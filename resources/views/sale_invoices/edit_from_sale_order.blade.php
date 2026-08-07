@extends('template.tmp')
@section('title', 'kohisar')

@section('content')
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    .table>:not(caption)>*>* {
        padding: 0.15rem .15rem !important;
    }
    table tbody tr input.form-control {
        border-radius: 0rem !important;
        font-size: 11px;
    }
    #summary-table input.form-control {
        border-radius: 0.25rem !important;
    }
    .form-control:disabled, .form-control[readonly] {
        background-color: #eff2f780 !important;
        opacity: 1;
    }
</style>
<style>
    .ui-state-highlight {
        height: 40px;
        background-color: #f0f0f0;
    }
</style>

    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                {{-- Route: PUT  sale-order-invoice/{id} → SaleOrderInvoiceController::update --}}
                <form id="sale-order-invoice-update" action="{{ route('sale-order-invoice.update', $invoice->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="id" id="invoice_master_id" value="{{ $invoice->id }}">


                    <input type="hidden" name="party_id"      value="{{ $invoice->party_id }}">
                    <input type="hidden" name="saleman_id"    value="{{ $invoice->saleman_id }}">
                    <input type="hidden" name="sale_order_id" value="{{ $invoice->sale_order_id }}">

                    <div class="row">
                        {{-- Left card: Invoice fields --}}
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Edit Sale Invoice</h4>
        
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Invoice No</label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><span class="bx bx-receipt"></span></div>
                                                    <input type="text" name="invoice_no" class="form-control" value="{{ $invoice->invoice_no }}" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Date</label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><span class="bx bx-calendar"></span></div>
                                                    <input type="date" name="date" class="form-control" value="{{ $invoice->date }}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Customer</label>
                                                <input type="text" class="form-control" value="{{ $invoice->party->business_name ?? '' }}" readonly>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Farm / Warehouse</label>
                                                <div class="input-group">
                                                    <select name="party_warehouse_id" class="form-control select2" style="width:100%">
                                                        <option value="{{ $invoice->party_warehouse_id }}">
                                                            {{ $invoice->partyWarehouse->name ?? '' }}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Vehicle No</label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><span class="bx bxs-truck"></span></div>
                                                    <input type="text" name="vehicle_no" class="form-control" value="{{ $invoice->vehicle_no }}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Reference No</label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><span class="bx bxs-spreadsheet"></span></div>
                                                    <input type="text" name="reference_no" class="form-control" value="{{ $invoice->reference_no }}" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {{-- Right card: Sale Order info --}}
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Sale Order</h4>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Saleman</label>
                                                <input type="text" class="form-control" value="{{ $invoice->saleman->name ?? '' }}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Sale Order No</label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><span class="bx bx-receipt"></span></div>
                                                    <input type="text" class="form-control" value="{{ $saleOrder->invoice_no }}" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Order Date</label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><span class="bx bx-calendar"></span></div>
                                                    <input type="date" class="form-control" value="{{ $saleOrder->date }}" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Items table --}}
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4">Invoice Details</h4>
                            <div class="table-responsive">
                                <table id="table" class="table table-border" style="border-collapse:collapse;">
                                    <thead>
                                        <tr>
                                            <th width="10"  class="text-start"></th>
                                            <th width="200" class="text-start">Item</th>
                                            <th width="50"  class="text-center">Unit wgt.</th>
                                            <th width="50"  class="text-center">Stock Bal.</th>
                                            <th width="50"  class="text-center">Ord. Bal.</th>
                                            <th width="50"  class="text-center">Qty</th>
                                            <th width="100" class="text-center">Total wgt.</th>
                                            <th width="50"  class="text-center">Unit Price</th>
                                            <th width="100" class="text-center">Total Price</th>
                                            <th width="50"  class="text-center">Discount</th>
                                            <th width="50"  class="text-center">Discount Type</th>
                                            <th width="50"  class="text-center">Discount Unit Price</th>
                                            <th width="100" class="text-center">Discount Amount</th>
                                            <th width="100" class="text-center">Total After Discount</th>
                                            <th width="20"  class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="sortable-table">
                                        {{--
                                            We iterate the INVOICE detail rows (what was previously saved).
                                            For each, we look up the matching sale ORDER detail row to get
                                            the current balance_quantity to show in the "Ord. Bal." column.
                                        --}}
                                         {{-- 
                                                    Available balance = the stored balance_quantity on the 
                                                    order PLUS what this invoice was using, because when we
                                                    re-save, syncOrderBalance() recalculates from scratch.
                                                    We show balance_quantity + this_invoice_qty so the user
                                                    sees the real headroom while editing this invoice.
                                                --}}
                                        @foreach ($invoice->invoiceDetails as $detail)
                                            @php
                                                $orderDetail = $saleOrder->invoiceDetails
                                                    ->firstWhere('item_id', $detail->item_id);
                                               
                                                $availableBalance = $orderDetail
                                                    ? ($orderDetail->balance_quantity + $detail->total_quantity)
                                                    : $detail->total_quantity;
                                            @endphp

                                            <tr>
                                                <td class="text-end"><a style="cursor:grab"><i style="font-size:25px" class="mdi mdi-drag handle text-dark"></i></a></td>

                                                <td>
                                                    <select name="item_id[]" class="form-control select2 item-dropdown" style="width:100%">
                                                        <option value="">Choose...</option>
                                                        @foreach ($itemGoods as $item)
                                                            <option
                                                                @if($detail->item_id == $item->id) selected @endif
                                                                value="{{ $item->id }}"
                                                                data-stock="{{ $item->balance }}"
                                                                data-unit-weight="{{ $item->unit_weight }}"
                                                                data-sell-price="{{ $item->sell_price }}"
                                                                data-purchase-price="{{ $item->purchase_price }}"
                                                            >
                                                                {{ $item->code.'-'.$item->category_name.'-'.$item->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </td>

                                                <td class="text-end">
                                                    <input type="number" name="unit_weight[]" step="0.0001" class="text-end form-control item-unit-weight" readonly>
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" step="0.0001" class="text-end form-control item-stock-balance" readonly>
                                                </td>
                                                {{-- Ord. Bal. — available headroom for this edit --}}
                                                <td class="text-end">
                                                    <input type="number" name="balance_quantity[]" value="{{ $availableBalance }}" step="0.0001" class="text-end form-control item-total-balance" readonly>
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="total_quantity[]" value="{{ $detail->total_quantity }}" step="0.0001" class="text-end form-control item-total-quantity">
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="net_weight[]" step="0.0001" class="text-end form-control item-net-weight" readonly>
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="purchase_unit_price[]" step="0.0001" class="text-end form-control item-purchase-unit-price" readonly>
                                                    <input type="number" name="per_unit_price[]" value="{{ $detail->per_unit_price }}" step="0.0001" class="text-end form-control item-per-unit-price">
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="total_price[]" step="0.0001" class="text-end form-control item-total-price" readonly>
                                                </td>
                                                <td>
                                                    <input type="number" name="discount_value[]" value="{{ $detail->discount_value ?? 0 }}" step="0.01" class="form-control item-discount-value">
                                                </td>
                                                <td>
                                                    <select name="discount_type[]" class="form-select item-discount-type">
                                                        <option @selected(($detail->discount_type ?? 'percentage') == 'percentage') value="percentage">%</option>
                                                        <option @selected(($detail->discount_type ?? '') == 'fixed') value="fixed">Fixed</option>
                                                    </select>
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="discount_unit_price[]" value="{{ $detail->discount_unit_price ?? 0 }}" step="0.01" class="text-end form-control item-discount-unit-price" readonly>
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="discount_amount[]" value="{{ $detail->discount_amount ?? 0 }}" step="0.01" class="text-end form-control item-discount-amount" readonly>
                                                </td>
                                                <td class="text-end">
                                                    <input type="number" name="total_purchase_price[]" step="0.0001" class="text-end form-control item-total-purchase-price" readonly>
                                                    <input type="number" name="after_discount_total_price[]" value="{{ $detail->after_discount_total_price }}" class="text-end form-control item-after-discount" readonly>
                                                </td>
                                                <td class="text-center">
                                                    <a href="#"><span style="font-size:18px" class="bx bx-trash text-danger remove-item"></span></a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th class="text-end" id="qty"></th>
                                            <th class="text-end" id="total-weight"></th>
                                            <th></th>
                                            <th class="text-end" id="total-price-footer"></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th class="text-end" id="total-discount-amount-footer"></th>
                                            <th class="text-end" id="total-after-discount-footer"></th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

                    {{-- Summary / totals --}}
                    <div class="row">
                        <div class="col-md-8"></div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <table class="table table-sm" id="summary-table">
                                        <tr>
                                            <th width="50%">Sub Total</th>
                                            <td width="50%">
                                                <input type="number" name="sub_total" id="sub-total" step="0.001" value="0" class="form-control text-end" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%">Discount</th>
                                            <td width="50%">
                                                <input type="number" name="discount_total" id="discount-total" step="0.001" value="0" class="form-control text-end" readonly>
                                            </td>
                                        </tr>
                                        <tr class="d-none">
                                            <th>GST</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="number" name="gst_rate" step="0.001" id="gst-rate" class="form-control" placeholder="percentage">
                                                    <input type="number" name="gst_amount" step="0.001" id="gst-amount" class="form-control text-end" autocomplete="off">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="d-none">
                                            <th>WTH</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="number" name="wth_rate" step="0.001" id="wth-rate" class="form-control" placeholder="percentage">
                                                    <input type="number" name="wth_amount" step="0.001" id="wth-amount" class="form-control text-end" autocomplete="off">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Freight</th>
                                            <td>
                                                <div class="input-group">
                                                    <div class="input-group-text">
                                                        <input type="checkbox" name="is_x_freight" id="is-x-freight" value="1"
                                                            @checked($invoice->is_x_freight == 1)
                                                            title="X-Freight (on behalf of Kohisar)">
                                                    </div>
                                                    <input type="number" name="shipping" step="0.001" id="shipping" value="{{ $invoice->shipping }}" class="form-control text-end" autocomplete="off">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="d-none">
                                            <th>Commission</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="number" name="commission_rate" step="0.001" id="commission-rate" class="form-control" placeholder="percentage">
                                                    <input type="number" name="commission_amount" step="0.001" id="commission-amount" class="form-control text-end" autocomplete="off">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%">Grand Total <sub>[sub total + GST + WTH]</sub></th>
                                            <td width="50%">
                                                <input type="number" name="grand_total" id="grand-total" step="0.001" value="0" class="form-control text-end" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%">Inventory</th>
                                            <td width="50%">
                                                <input type="text" id="inventory" name="inventory" class="form-control text-end" step="0.001" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%">Cost</th>
                                            <td width="50%">
                                                <input type="number" id="grand-total-purchase-price" name="grand_total_purchase_price" class="form-control text-end" step="0.001" readonly>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <div class="row d-none">
                                <label class="col-md-3 col-form-label">Attachment</label>
                                <div class="col-md-9">
                                    <input type="file" name="attachment" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 text-end">
                            <button type="submit" id="submit-sale-order-invoice-update" class="btn btn-success w-md">Update</button>
                            <a href="{{ route('sale-invoice.index') }}" class="btn btn-secondary w-md">Cancel</a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="{{ asset('/assets/js/tinymce1.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script>
        let notyf = new Notyf({
            duration: 3000,
            position: { x: 'right', y: 'top' },
        });
    </script>

@include('sale_invoices.js')

<script>
    $(document).ready(function () {
        $('.item-dropdown').each(function () {
            $(this).trigger('change');
        });
    });

    // ─── Balance Quantity Validation ───────────────────────────────────────────────
    $(document).on('input change', '.item-total-quantity', function () {
        var $input     = $(this);
        var enteredQty = parseFloat($input.val()) || 0;
        var $row       = $input.closest('tr');
        var balanceQty = parseFloat($row.find('.item-total-balance').val()) || 0;

        if (enteredQty > balanceQty) {
            notyf.error({
                message: 'Quantity (' + enteredQty + ') exceeds the available balance (' + balanceQty + ') for this item.',
                duration: 4000
            });
            $input.val(0).trigger('change');
        }
    });
</script>

<script>
    $('#sale-order-invoice-update').on('submit', function (e) {
        e.preventDefault();
        var submit_btn = $('#submit-sale-order-invoice-update');
        let formData   = new FormData(this);
        var invoice_master_id = $('#invoice_master_id').val();

        $.ajax({
            type: 'POST',   // Laravel spoofs PUT via @method('PUT')
            url: "{{ route('sale-order-invoice.update',':id') }}".replace(':id',invoice_master_id),
            dataType: 'json',
            contentType: false,
            processData: false,
            cache: false,
            data: formData,
            enctype: 'multipart/form-data',
            beforeSend: function () {
                submit_btn.prop('disabled', true).html('Processing');
            },
            success: function (response) {
                submit_btn.prop('disabled', false).html('Update');
                if (response.success == true) {
                    notyf.success({ message: response.message, duration: 3000 });
                    setTimeout(function () {
                        window.location.href = '{{ route("sale-invoice.index") }}';
                    }, 300);
                } else {
                    notyf.error({ message: response.message, duration: 5000 });
                }
            },
            error: function (e) {
                submit_btn.prop('disabled', false).html('Update');
                notyf.error({ message: e.responseJSON.message, duration: 5000 });
            }
        });
    });
</script>

@endsection
