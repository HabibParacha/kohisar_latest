<?php

namespace App\Http\Controllers;

use App\Models\Voucher;
use Illuminate\Http\Request;
use App\Models\InvoiceMaster;
use App\Models\PartyWarehouse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

/**
 * Handles sale invoices that are created FROM a sale order.
 * Keeps sale-order balance tracking (sold_quantity / balance_quantity) in sync
 * on every store, update, and destroy operation.
 *
 * Regular sale invoices (no sale order) stay in SaleInvoiceController.
 */
class SaleOrderInvoiceController extends Controller
{
    // ─── Create ──────────────────────────────────────────────────────────────────

    /**
     * Show the form to create a sale invoice from the given sale order.
     * Only order detail rows that still have balance_quantity > 0 are included.
     */
    public function create($saleOrderId)
    {
        $saleOrder = InvoiceMaster::with(['invoiceDetails' => function ($query) {
            $query->where('balance_quantity', '>', 0);
        }])->findOrFail($saleOrderId);

        $newInvoiceNo    = InvoiceMaster::generateInvoiceNo('INV', 'invoice');
        $partyWarehouses = PartyWarehouse::where('party_id', $saleOrder->party_id)->get();
        $itemGoods       = DB::table('v_finished_goods_stock_report')->get();

        return view('sale_invoices.create_from_sale_order', compact(
            'saleOrder', 'partyWarehouses', 'newInvoiceNo', 'itemGoods'
        ));
    }

    // ─── Store ───────────────────────────────────────────────────────────────────

    /**
     * Save the new sale invoice and recalculate the parent sale order balance.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'party_id'            => 'required',
            'party_warehouse_id'  => 'required',
            'sale_order_id'       => 'required|exists:invoice_master,id',
            'total_quantity.*'    => 'required',
            'per_unit_price.*'    => 'required',
        ], [
            'party_id.required'           => 'Party is required.',
            'party_warehouse_id.required' => 'Party Farm / Warehouse is required.',
            'sale_order_id.required'      => 'Sale Order is required.',
            'total_quantity.*.required'   => 'Quantity is required for all items.',
            'per_unit_price.*.required'   => 'Unit price is required for each item.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ]);
        }

        DB::beginTransaction();

        try {
            $newInvoiceNo = InvoiceMaster::generateInvoiceNo('INV', 'invoice');

            $invoiceMasterData = [
                'date'                 => $request->input('date'),
                'invoice_no'           => $newInvoiceNo,
                'sale_order_id'        => $request->input('sale_order_id'),
                'type'                 => 'invoice',
                'party_id'             => $request->input('party_id'),
                'saleman_id'           => $request->input('saleman_id'),
                'party_warehouse_id'   => $request->input('party_warehouse_id'),
                'reference_no'         => $request->input('reference_no'),
                'vehicle_no'           => $request->input('vehicle_no'),
                'sub_total'            => $request->input('sub_total'),
                'discount_amount'      => $request->input('discount_total'),
                'tax_rate'             => $request->input('gst_rate'),
                'tax_amount'           => $request->input('gst_amount'),
                'wth_tax_rate'         => $request->input('wth_rate'),
                'wth_tax_amount'       => $request->input('wth_amount'),
                'commission_rate'      => $request->input('commission_rate'),
                'commission_amount'    => $request->input('commission_amount'),
                'is_x_freight'         => $request->input('is_x_freight'),
                'shipping'             => $request->input('shipping'),
                'grand_total'          => $request->input('grand_total'),
                'total_purchase_price' => $request->input('grand_total_purchase_price'),
                'profit_loss'          => $request->input('grand_total') - $request->input('grand_total_purchase_price'),
                'description'          => $request->input('description'),
                'created_by'           => Auth::id(),
            ];

            if ($request->hasFile('attachment')) {
                $file                           = $request->file('attachment');
                $fileName                       = time() . '.' . $file->extension();
                $file->move(public_path('attachments/sale-order'), $fileName);
                $invoiceMasterData['attachment'] = $fileName;
            }

            $invoiceMasterId = DB::table('invoice_master')->insertGetId($invoiceMasterData);

            for ($i = 0; $i < count($request->item_id); $i++) {
                DB::table('invoice_detail')->insertGetId([
                    'invoice_master_id'         => $invoiceMasterId,
                    'date'                       => $request->input('date'),
                    'invoice_no'                 => $newInvoiceNo,
                    'type'                       => 'invoice',
                    'item_id'                    => $request->item_id[$i],
                    'unit_weight'                => $request->unit_weight[$i],
                    'total_quantity'             => $request->total_quantity[$i],
                    'net_weight'                 => $request->net_weight[$i],
                    'per_unit_price'             => $request->per_unit_price[$i],
                    'purchase_unit_price'        => $request->purchase_unit_price[$i],
                    'total_price'                => $request->total_price[$i],
                    'total_purchase_price'       => $request->total_purchase_price[$i],
                    'discount_type'              => $request->discount_type[$i],
                    'discount_value'             => $request->discount_value[$i],
                    'discount_amount'            => $request->discount_unit_price[$i],
                    'discount_unit_price'        => $request->discount_unit_price[$i],
                    'after_discount_total_price' => $request->after_discount_total_price[$i],
                    'grand_total'                => $request->after_discount_total_price[$i],
                ]);
            }

            // Journal entries (same logic as SaleInvoiceController)
            $voucherType  = DB::table('voucher_types')->where('code', 'CP')->first();
            $newVoucherNo = Voucher::generateVoucherNo($voucherType->code);

            $this->createJournalEntries(
                $request, $newInvoiceNo, $invoiceMasterId,
                $newVoucherNo, $voucherType->code, $voucherType->name
            );

            // Sync sold / balance quantities on the parent sale order
            $this->syncOrderBalance($request->input('sale_order_id'));

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Sale Invoice created successfully. Invoice No: ' . $newInvoiceNo,
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    // ─── Edit ────────────────────────────────────────────────────────────────────

    /**
     * Show the edit form for a sale invoice that was created from a sale order.
     * Loads both the invoice being edited AND the parent sale order so the view
     * can show the order balance alongside the current quantities.
     */
    public function edit($id)
    {
        try {
            $invoice = InvoiceMaster::with(['invoiceDetails', 'party', 'partyWarehouse', 'saleman'])
                ->findOrFail($id);

            $saleOrder = InvoiceMaster::with(['invoiceDetails'])
                ->findOrFail($invoice->sale_order_id);

            $itemGoods       = DB::table('v_finished_goods_stock_report')->get();
            $partyWarehouses = PartyWarehouse::where('party_id', $invoice->party_id)->get();

            return view('sale_invoices.edit_from_sale_order', compact(
                'invoice', 'saleOrder', 'itemGoods', 'partyWarehouses'
            ));

        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // ─── Update ──────────────────────────────────────────────────────────────────

    /**
     * Update the sale invoice and re-sync the sale order balance.
     */
    public function update(Request $request, $id)
    {
        dd($request->all());
        $validator = Validator::make($request->all(), [
            'party_id'           => 'required',
            'party_warehouse_id' => 'required',
            'total_quantity.*'   => 'required',
            'per_unit_price.*'   => 'required',
        ], [
            'party_id.required'           => 'Party is required.',
            'party_warehouse_id.required' => 'Party Farm / Warehouse is required.',
            'total_quantity.*.required'   => 'Quantity is required for all items.',
            'per_unit_price.*.required'   => 'Unit price is required for each item.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ]);
        }

        DB::beginTransaction();

        try {
            $invoiceMaster = InvoiceMaster::findOrFail($id);
            $saleOrderId   = $invoiceMaster->sale_order_id;

            // Update master
            $invoiceMaster->update([
                'date'                 => $request->input('date'),
                'party_id'             => $request->input('party_id'),
                'saleman_id'           => $request->input('saleman_id'),
                'party_warehouse_id'   => $request->input('party_warehouse_id'),
                'reference_no'         => $request->input('reference_no'),
                'vehicle_no'           => $request->input('vehicle_no'),
                'sub_total'            => $request->input('sub_total'),
                'discount_amount'      => $request->input('discount_total'),
                'tax_rate'             => $request->input('gst_rate'),
                'tax_amount'           => $request->input('gst_amount'),
                'wth_tax_rate'         => $request->input('wth_rate'),
                'wth_tax_amount'       => $request->input('wth_amount'),
                'commission_rate'      => $request->input('commission_rate'),
                'commission_amount'    => $request->input('commission_amount'),
                'is_x_freight'         => $request->input('is_x_freight'),
                'shipping'             => $request->input('shipping'),
                'grand_total'          => $request->input('grand_total'),
                'total_purchase_price' => $request->input('grand_total_purchase_price'),
                'profit_loss'          => $request->input('grand_total') - $request->input('grand_total_purchase_price'),
                'description'          => $request->input('description'),
                'updated_by'           => Auth::id(),
            ]);

            if ($request->hasFile('attachment')) {
                $file     = $request->file('attachment');
                $fileName = time() . '.' . $file->extension();
                $file->move(public_path('attachments/sale-order'), $fileName);
                $invoiceMaster->update(['attachment' => $fileName]);
            }

            // Replace detail rows
            DB::table('invoice_detail')->where('invoice_master_id', $invoiceMaster->id)->delete();

            for ($i = 0; $i < count($request->item_id); $i++) {
                DB::table('invoice_detail')->insertGetId([
                    'invoice_master_id'         => $invoiceMaster->id,
                    'date'                       => $request->input('date'),
                    'invoice_no'                 => $invoiceMaster->invoice_no,
                    'type'                       => 'invoice',
                    'item_id'                    => $request->item_id[$i],
                    'unit_weight'                => $request->unit_weight[$i],
                    'total_quantity'             => $request->total_quantity[$i],
                    'net_weight'                 => $request->net_weight[$i],
                    'per_unit_price'             => $request->per_unit_price[$i],
                    'purchase_unit_price'        => $request->purchase_unit_price[$i],
                    'total_price'                => $request->total_price[$i],
                    'total_purchase_price'       => $request->total_purchase_price[$i],
                    'discount_type'              => $request->discount_type[$i],
                    'discount_value'             => $request->discount_value[$i],
                    'discount_amount'            => $request->discount_unit_price[$i],
                    'discount_unit_price'        => $request->discount_unit_price[$i],
                    'after_discount_total_price' => $request->after_discount_total_price[$i],
                    'grand_total'                => $request->after_discount_total_price[$i],
                ]);
            }

            // Replace journal entries
            $voucher = Voucher::where('invoice_master_id', $invoiceMaster->id)->first();
            if ($voucher) {
                $voucherNo   = $voucher->voucher_no;
                $voucherCode = $voucher->code;
                $voucherType = $voucher->type;
            } else {
                $vType       = DB::table('voucher_types')->where('code', 'CP')->first();
                $voucherNo   = Voucher::generateVoucherNo($vType->code);
                $voucherCode = $vType->code;
                $voucherType = $vType->name;
            }

            DB::table('voucher_details')->where('invoice_master_id', $invoiceMaster->id)->delete();
            DB::table('vouchers')->where('invoice_master_id', $invoiceMaster->id)->delete();
            DB::table('journals')->where('invoice_master_id', $invoiceMaster->id)->delete();

            $this->createJournalEntries(
                $request, $invoiceMaster->invoice_no, $invoiceMaster->id,
                $voucherNo, $voucherCode, $voucherType
            );

            // Re-sync sold / balance quantities on the parent sale order
            if ($saleOrderId) {
                $this->syncOrderBalance($saleOrderId);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Sale Invoice updated successfully. Invoice No: ' . $invoiceMaster->invoice_no,
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    // ─── Destroy ─────────────────────────────────────────────────────────────────

    /**
     * Delete a sale invoice that was created from a sale order.
     * After deletion, re-syncs the order balance so quantities are restored.
     * If no invoices remain against the order, the order is unlocked.
     */
    public function destroy($id)
    {
        DB::beginTransaction();

        try {
            $invoiceMaster = InvoiceMaster::findOrFail($id);
            $saleOrderId   = $invoiceMaster->sale_order_id;

            DB::table('invoice_detail')->where('invoice_master_id', $id)->delete();
            DB::table('voucher_details')->where('invoice_master_id', $id)->delete();
            DB::table('vouchers')->where('invoice_master_id', $id)->delete();
            DB::table('journals')->where('invoice_master_id', $id)->delete();
            DB::table('invoice_master')->where('id', $id)->delete();

            // Re-sync — since the invoice is gone, sold qty drops and balance restores
            if ($saleOrderId) {
                $this->syncOrderBalance($saleOrderId);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Sale Invoice deleted successfully.',
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    // ─── Helpers ─────────────────────────────────────────────────────────────────

    /**
     * Recalculate sold_quantity and balance_quantity on every invoice_detail row
     * of the sale order, based on the current set of linked sale invoices.
     * Also manages the is_lock flag on the sale order header.
     */
    private function syncOrderBalance($saleOrderId)
    {
        $saleOrder = InvoiceMaster::find($saleOrderId);

        if (!$saleOrder) {
            return;
        }

        // All invoice IDs currently linked to this sale order
        $invoiceIds = DB::table('invoice_master')
            ->where('sale_order_id', $saleOrderId)
            ->where('type', 'invoice')
            ->pluck('id');

        // Each detail row of the sale order
        $orderDetails = DB::table('invoice_detail')
            ->where('invoice_master_id', $saleOrderId)
            ->get();

        foreach ($orderDetails as $orderDetail) {
            $soldQty = DB::table('invoice_detail')
                ->whereIn('invoice_master_id', $invoiceIds)
                ->where('item_id', $orderDetail->item_id)
                ->sum('total_quantity');

            $balanceQty = max(0, $orderDetail->total_quantity - $soldQty);

            DB::table('invoice_detail')
                ->where('id', $orderDetail->id)
                ->update([
                    'sold_quantity'    => $soldQty,
                    'balance_quantity' => $balanceQty,
                ]);
        }

        // Lock when at least one invoice exists; unlock if all invoices have been deleted
        $hasInvoices        = $invoiceIds->isNotEmpty();
        $saleOrder->is_lock = $hasInvoices ? 1 : 0;
        $saleOrder->save();
    }

    /**
     * Create the journal entries for the invoice.
     * Mirrors the logic in SaleInvoiceController::createJournalEntries().
     */
    private function createJournalEntries(
        Request $request,
        $invoiceNo,
        $invoiceMasterId,
        $voucherNo,
        $voucherCode,
        $voucherType
    ) {
        $customerId       = $request->input('party_id');
        $narrationAR      = 'AR @ '        . $invoiceNo . ' amount Rs: ' . number_format($request->input('grand_total') ?? 0, 2);
        $narrationInv     = 'Inventory @ ' . $invoiceNo . ' amount Rs: ' . number_format($request->input('inventory') ?? 0, 2);
        $narrationShip    = 'Freight Paid @ ' . $invoiceNo . ' amount Rs: ' . number_format($request->input('shipping') ?? 0, 2);
        $narrationXShip   = 'Freight Paid on behalf of Kohisar Mill @ ' . $invoiceNo . ' amount Rs: ' . number_format($request->input('shipping') ?? 0, 2);

        // DR: Accounts Receivable
        DB::table('journals')->insert([
            'date'                => $request->input('date'),
            'voucher_no'          => $invoiceNo,
            'type'                => 'invoice',
            'chart_of_account_id' => env('AR'),
            'narration'           => $narrationAR,
            'customer_id'         => $customerId,
            'invoice_master_id'   => $invoiceMasterId,
            'debit'               => $request->input('grand_total'),
            'trace'               => '',
            'created_by'          => Auth::id(),
            'created_at'          => now(),
        ]);

        // CR: Finished Goods Inventory
        DB::table('journals')->insert([
            'date'                => $request->input('date'),
            'voucher_no'          => $invoiceNo,
            'type'                => 'invoice',
            'chart_of_account_id' => env('FINISHED_GOOD'),
            'narration'           => $narrationInv,
            'customer_id'         => $customerId,
            'invoice_master_id'   => $invoiceMasterId,
            'credit'              => $request->input('grand_total_purchase_price'),
            'trace'               => '',
            'created_by'          => Auth::id(),
            'created_at'          => now(),
        ]);

        // CR: Retained Earnings (profit on sale)
        DB::table('journals')->insert([
            'date'                => $request->input('date'),
            'voucher_no'          => $invoiceNo,
            'type'                => 'invoice',
            'chart_of_account_id' => env('FINISHED_GOOD_RETAINED_EARNING'),
            'narration'           => $narrationInv,
            'customer_id'         => $customerId,
            'invoice_master_id'   => $invoiceMasterId,
            'credit'              => $request->input('grand_total') - $request->input('grand_total_purchase_price'),
            'trace'               => '',
            'created_by'          => Auth::id(),
            'created_at'          => now(),
        ]);

        // Freight entries (only when shipping > 0)
        $shipping = $request->input('shipping');
        if ($shipping && $shipping > 0) {
            if ($request->input('is_x_freight') == '1') {
                // X-freight: CR AR, DR Output Freight
                DB::table('journals')->insert([
                    'date'                => $request->input('date'),
                    'voucher_no'          => $invoiceNo,
                    'type'                => 'invoice',
                    'chart_of_account_id' => env('AR'),
                    'narration'           => $narrationShip,
                    'customer_id'         => $customerId,
                    'invoice_master_id'   => $invoiceMasterId,
                    'credit'              => $shipping,
                    'trace'               => '',
                    'created_by'          => Auth::id(),
                    'created_at'          => now(),
                ]);
                DB::table('journals')->insert([
                    'date'                => $request->input('date'),
                    'voucher_no'          => $invoiceNo,
                    'type'                => 'invoice',
                    'chart_of_account_id' => env('OUTPUT_FREIGHT'),
                    'narration'           => $narrationXShip,
                    'customer_id'         => $customerId,
                    'invoice_master_id'   => $invoiceMasterId,
                    'debit'               => $shipping,
                    'trace'               => '',
                    'created_by'          => Auth::id(),
                    'created_at'          => now(),
                ]);
            } else {
                // Cash freight: CP Voucher — DR Output Freight, CR Petty Cash
                $voucherId = DB::table('vouchers')->insertGetId([
                    'date'              => $request->date,
                    'voucher_no'        => $voucherNo,
                    'code'              => $voucherCode,
                    'type'              => $voucherType,
                    'invoice_master_id' => $invoiceMasterId,
                    'narration'         => $narrationShip,
                    'total_amount'      => $shipping,
                    'created_by'        => Auth::id(),
                ]);

                $vDR = [
                    'voucher_id'          => $voucherId,
                    'date'                => $request->date,
                    'voucher_no'          => $voucherNo,
                    'code'                => $voucherCode,
                    'type'                => $voucherType,
                    'chart_of_account_id' => env('OUTPUT_FREIGHT'),
                    'invoice_master_id'   => $invoiceMasterId,
                    'customer_id'         => $customerId,
                    'narration'           => $narrationShip,
                    'debit'               => $shipping,
                    'created_at'          => now(),
                ];
                DB::table('voucher_details')->insert($vDR);
                $vDR['created_by'] = Auth::id();
                DB::table('journals')->insert($vDR);

                $vCR = [
                    'voucher_id'          => $voucherId,
                    'date'                => $request->date,
                    'voucher_no'          => $voucherNo,
                    'code'                => $voucherCode,
                    'type'                => $voucherType,
                    'chart_of_account_id' => env('PETTY_CASH'),
                    'invoice_master_id'   => $invoiceMasterId,
                    'customer_id'         => $customerId,
                    'narration'           => $narrationShip,
                    'credit'              => $shipping,
                    'created_at'          => now(),
                ];
                DB::table('voucher_details')->insert($vCR);
                $vCR['created_by'] = Auth::id();
                DB::table('journals')->insert($vCR);
            }
        }
    }
}
