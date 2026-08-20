<?php

namespace App\Http\Controllers;

use App\Models\ChartOfAccount;
use App\Models\ContractSetting;
use App\Models\ContractVoucher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ContractVoucherController extends Controller
{
    // ─── Index ───────────────────────────────────────────────────────────────────

    public function index()
    {
        $vouchers = ContractVoucher::with(['createdBy'])
            ->orderBy('date', 'desc')
            ->get();

        return view('contract_vouchers.index', compact('vouchers'));
    }

    // ─── Create ──────────────────────────────────────────────────────────────────

    public function create()
    {
        // Pre-fill rates from the latest contract setting
        $setting = ContractSetting::latest()->first();

        return view('contract_vouchers.create', compact('setting'));
    }

    // ─── Store ───────────────────────────────────────────────────────────────────

    public function store(Request $request)
    {
        $request->validate([
            'date'                  => 'required|date',
            'expense_coa_dr_id'     => 'required|exists:chart_of_accounts,id',
            'coa_payable_cr_id'     => 'required|exists:chart_of_accounts,id',
            'unloading_rate'        => 'nullable|numeric|min:0',
            'unloading_bags'        => 'nullable|numeric|min:0',
            'loading_rate'          => 'nullable|numeric|min:0',
            'loading_bags'          => 'nullable|numeric|min:0',
            'bag_cutting_rate'      => 'nullable|numeric|min:0',
            'bag_cutting_bags'      => 'nullable|numeric|min:0',
            'wanda_production_rate' => 'nullable|numeric|min:0',
            'wanda_production_bags' => 'nullable|numeric|min:0',
            'unload_refill_rate'    => 'nullable|numeric|min:0',
            'unload_refill_bags'    => 'nullable|numeric|min:0',
            'packing_rate'          => 'nullable|numeric|min:0',
            'shifting_rate'         => 'nullable|numeric|min:0',
        ]);

        // ── One voucher per day ───────────────────────────────────────────────────
        $exists = ContractVoucher::whereDate('date', $request->date)->exists();
        if ($exists) {
            return back()
                ->withInput()
                ->withErrors(['date' => 'A contract voucher already exists for ' . $request->date . '. Only one voucher per day is allowed.']);
        }

        // ── Compute totals (server-side) ──────────────────────────────────────────
        $totalBags = ($request->unloading_bags ?? 0)
            + ($request->loading_bags ?? 0)
            + ($request->bag_cutting_bags ?? 0)
            + ($request->wanda_production_bags ?? 0)
            + ($request->unload_refill_bags ?? 0)
            + ($request->packing_bags ?? 0)
            + ($request->shifting_bags ?? 0);

        $totalAmount = (($request->unloading_rate ?? 0)   * ($request->unloading_bags ?? 0))
            + (($request->loading_rate ?? 0)              * ($request->loading_bags ?? 0))
            + (($request->bag_cutting_rate ?? 0)          * ($request->bag_cutting_bags ?? 0))
            + (($request->wanda_production_rate ?? 0)     * ($request->wanda_production_bags ?? 0))
            + (($request->unload_refill_rate ?? 0)        * ($request->unload_refill_bags ?? 0))
            + (($request->packing_rate ?? 0)              * ($request->packing_bags ?? 0))
            + (($request->shifting_rate ?? 0)             * ($request->shifting_bags ?? 0));

        $voucherNumber = 'CV-' . date('Ymd', strtotime($request->date));

        DB::beginTransaction();
        try {
            $voucher = ContractVoucher::create([
                'date'                  => $request->date,
                'voucher_number'        => $voucherNumber,
                'expense_coa_dr_id'     => $request->expense_coa_dr_id,
                'coa_payable_cr_id'     => $request->coa_payable_cr_id,
                'unloading_rate'        => $request->unloading_rate,
                'unloading_bags'        => $request->unloading_bags,
                'loading_rate'          => $request->loading_rate,
                'loading_bags'          => $request->loading_bags,
                'bag_cutting_rate'      => $request->bag_cutting_rate,
                'bag_cutting_bags'      => $request->bag_cutting_bags,
                'wanda_production_rate' => $request->wanda_production_rate,
                'wanda_production_bags' => $request->wanda_production_bags,
                'unload_refill_rate'    => $request->unload_refill_rate,
                'unload_refill_bags'    => $request->unload_refill_bags,
                'packing_rate'          => $request->packing_rate,
                'packing_bags'          => $request->packing_bags,
                'shifting_rate'         => $request->shifting_rate,
                'shifting_bags'         => $request->shifting_bags,
                'total_bags'            => $totalBags,
                'total_amount'          => $totalAmount,
                'created_by'            => Auth::id(),
            ]);

            // ── Journal entries ───────────────────────────────────────────────────
            $this->postJournalEntries($voucher);

            DB::commit();

            return redirect()->route('contract-voucher.show', $voucher->id)
                ->with('success', 'Contract Voucher ' . $voucherNumber . ' created successfully.');

        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withInput()->withErrors(['error' => $e->getMessage()]);
        }
    }

    // ─── Show ────────────────────────────────────────────────────────────────────

    public function show(ContractVoucher $contractVoucher)
    {
        $contractVoucher->load(['expenseCoaDr', 'payableCoaCr', 'createdBy', 'updatedBy']);

        return view('contract_vouchers.show', compact('contractVoucher'));
    }

    // ─── Edit ────────────────────────────────────────────────────────────────────

    public function edit(ContractVoucher $contractVoucher)
    {
        // Admin only
        if (!Auth::user()->is_super_admin) {
            abort(403, 'Only administrators can edit contract vouchers.');
        }
    
        $setting = ContractSetting::latest()->first();

        return view('contract_vouchers.edit', compact('contractVoucher', 'setting'));
    }

    // ─── Update ──────────────────────────────────────────────────────────────────

    public function update(Request $request, ContractVoucher $contractVoucher)
    {
        // Admin only
        if (!Auth::user()->is_super_admin) {
            abort(403, 'Only administrators can edit contract vouchers.');
        }

        $request->validate([
            'date'                  => 'required|date',
            'expense_coa_dr_id'     => 'required|exists:chart_of_accounts,id',
            'coa_payable_cr_id'     => 'required|exists:chart_of_accounts,id',
            'unloading_rate'        => 'nullable|numeric|min:0',
            'unloading_bags'        => 'nullable|numeric|min:0',
            'loading_rate'          => 'nullable|numeric|min:0',
            'loading_bags'          => 'nullable|numeric|min:0',
            'bag_cutting_rate'      => 'nullable|numeric|min:0',
            'bag_cutting_bags'      => 'nullable|numeric|min:0',
            'wanda_production_rate' => 'nullable|numeric|min:0',
            'wanda_production_bags' => 'nullable|numeric|min:0',
            'unload_refill_rate'    => 'nullable|numeric|min:0',
            'unload_refill_bags'    => 'nullable|numeric|min:0',
            'packing_rate'          => 'nullable|numeric|min:0',
            'shifting_rate'         => 'nullable|numeric|min:0',
        ]);

        // One-per-day: allow same date on same record but block if another record has that date
        $exists = ContractVoucher::whereDate('date', $request->date)
            ->where('id', '!=', $contractVoucher->id)
            ->exists();
        if ($exists) {
            return back()
                ->withInput()
                ->withErrors(['date' => 'Another contract voucher already exists for ' . $request->date . '.']);
        }

        // Recalculate totals
        $totalBags = ($request->unloading_bags ?? 0)
            + ($request->loading_bags ?? 0)
            + ($request->bag_cutting_bags ?? 0)
            + ($request->wanda_production_bags ?? 0)
            + ($request->unload_refill_bags ?? 0)
            + ($request->packing_bags ?? 0)
            + ($request->shifting_bags ?? 0);

        $totalAmount = (($request->unloading_rate ?? 0)   * ($request->unloading_bags ?? 0))
            + (($request->loading_rate ?? 0)              * ($request->loading_bags ?? 0))
            + (($request->bag_cutting_rate ?? 0)          * ($request->bag_cutting_bags ?? 0))
            + (($request->wanda_production_rate ?? 0)     * ($request->wanda_production_bags ?? 0))
            + (($request->unload_refill_rate ?? 0)        * ($request->unload_refill_bags ?? 0))
            + (($request->packing_rate ?? 0)              * ($request->packing_bags ?? 0))
            + (($request->shifting_rate ?? 0)             * ($request->shifting_bags ?? 0));

        DB::beginTransaction();
        try {
            $contractVoucher->update([
                'date'                  => $request->date,
                'expense_coa_dr_id'     => $request->expense_coa_dr_id,
                'coa_payable_cr_id'     => $request->coa_payable_cr_id,
                'unloading_rate'        => $request->unloading_rate,
                'unloading_bags'        => $request->unloading_bags,
                'loading_rate'          => $request->loading_rate,
                'loading_bags'          => $request->loading_bags,
                'bag_cutting_rate'      => $request->bag_cutting_rate,
                'bag_cutting_bags'      => $request->bag_cutting_bags,
                'wanda_production_rate' => $request->wanda_production_rate,
                'wanda_production_bags' => $request->wanda_production_bags,
                'unload_refill_rate'    => $request->unload_refill_rate,
                'unload_refill_bags'    => $request->unload_refill_bags,
                'packing_rate'          => $request->packing_rate,
                'packing_bags'          => $request->packing_bags,
                'shifting_rate'         => $request->shifting_rate,
                'shifting_bags'         => $request->shifting_bags,
                'total_bags'            => $totalBags,
                'total_amount'          => $totalAmount,
                'updated_by'            => Auth::id(),
            ]);

            // ── Re-post journal entries ───────────────────────────────────────────
            DB::table('journals')
                ->where('voucher_no', $contractVoucher->voucher_number)
                ->where('type', 'contract_voucher')
                ->delete();

            $this->postJournalEntries($contractVoucher->fresh());

            DB::commit();

            return redirect()->route('contract-voucher.show', $contractVoucher->id)
                ->with('success', 'Contract Voucher updated successfully.');

        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withInput()->withErrors(['error' => $e->getMessage()]);
        }
    }

    // ─── Helper: Post Journal Entries ─────────────────────────────────────────────

    private function postJournalEntries(ContractVoucher $voucher): void
    {
        $narration = 'Contract Labour — ' . $voucher->voucher_number
            . ' | Total Bags: ' . $voucher->total_bags;

        // DR: Expense (Labour Cost)
        DB::table('journals')->insert([
            'date'                => $voucher->date,
            'voucher_no'          => $voucher->voucher_number,
            'type'                => 'contract_voucher',
            'chart_of_account_id' => $voucher->expense_coa_dr_id,
            'narration'           => $narration,
            'debit'               => $voucher->total_amount,
            'credit'              => null,
            'created_by'          => Auth::id(),
            'created_at'          => now(),
            'updated_at'          => now(),
        ]);

        // CR: Payable (Labour Payable)
        DB::table('journals')->insert([
            'date'                => $voucher->date,
            'voucher_no'          => $voucher->voucher_number,
            'type'                => 'contract_voucher',
            'chart_of_account_id' => $voucher->coa_payable_cr_id,
            'narration'           => $narration,
            'debit'               => null,
            'credit'              => $voucher->total_amount,
            'created_by'          => Auth::id(),
            'created_at'          => now(),
            'updated_at'          => now(),
        ]);
    }
}
