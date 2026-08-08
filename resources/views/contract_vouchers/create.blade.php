@extends('template.tmp')
@section('title', 'Create Contract Voucher')

@section('content')
<style>
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button { -webkit-appearance: none; margin: 0; }
    input[type=number] { -moz-appearance: textfield; }
    .rate-table td, .rate-table th { vertical-align: middle; padding: 0.3rem 0.5rem !important; }
    .rate-table input { font-size: 13px; }
    .total-row td { font-weight: 700; background: #f8f9fa; }
</style>

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h3 class="mb-sm-0 font-size-18">Create Contract Voucher</h3>
                        <div class="page-title-right">
                            <a href="{{ route('contract-voucher.index') }}" class="btn btn-secondary">
                                <i class="bx bx-arrow-back me-1"></i> Back
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Errors --}}
            @if($errors->any())
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form action="{{ route('contract-voucher.store') }}" method="POST" id="voucher-form">
                @csrf

                {{-- ── Header Card ── --}}
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Voucher Info</h5>
                        <div class="row">

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Date <span class="text-danger">*</span></label>
                                    <input type="date" name="date" id="date"
                                           class="form-control @error('date') is-invalid @enderror"
                                           value="{{ old('date', date('Y-m-d')) }}" required readonly>
                                    @error('date')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Voucher No. <small class="text-muted">(auto)</small></label>
                                    <input type="text" id="voucher-preview" class="form-control" readonly
                                           value="CV-{{ date('Ymd') }}">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Expense DR <span class="text-danger">*</span></label>
                                    <input type="number" name="expense_coa_dr_id"
                                           class="form-control @error('expense_coa_dr_id') is-invalid @enderror"
                                           value="{{ old('expense_coa_dr_id', $setting->coa_expense_dr_id ?? '') }}"
                                           placeholder="COA ID" required readonly>
                                    @error('expense_coa_dr_id')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Contractor Payable CR<span class="text-danger">*</span></label>
                                    <input type="number" name="coa_payable_cr_id"
                                           class="form-control @error('coa_payable_cr_id') is-invalid @enderror"
                                           value="{{ old('coa_payable_cr_id', $setting->coa_payable_cr_id ?? '') }}"
                                           placeholder="COA ID" required readonly>
                                    @error('coa_payable_cr_id')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                {{-- ── Rate Card Table ── --}}
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Rate Card</h5>
                        <div class="table-responsive">
                            <table class="table table-bordered rate-table">
                                <thead class="table-light">
                                    <tr>
                                        <th width="25%">Activity</th>
                                        <th width="20%" class="text-end">Rate (Rs)</th>
                                        <th width="20%" class="text-end">Bags / Qty</th>
                                        <th width="20%" class="text-end">Amount (Rs)</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    {{-- Unloading --}}
                                    <tr>
                                        <td class="fw-semibold">Unloading</td>
                                        <td>
                                            <input type="number" name="unloading_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="unloading_bags" data-amount="unloading_amount"
                                                   value="{{ old('unloading_rate', $setting->unloading ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="unloading_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="unloading_rate" data-amount="unloading_amount"
                                                   value="{{ old('unloading_bags', 0) }}">
                                        </td>
                                        <td>
                                            <input type="number" id="unloading_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                    {{-- Loading --}}
                                    <tr>
                                        <td class="fw-semibold">Loading</td>
                                        <td>
                                            <input type="number" name="loading_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="loading_bags" data-amount="loading_amount"
                                                   value="{{ old('loading_rate', $setting->loading ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="loading_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="loading_rate" data-amount="loading_amount"
                                                   value="{{ old('loading_bags', 0) }}">
                                        </td>
                                        <td>
                                            <input type="number" id="loading_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                    {{-- Bag Cutting --}}
                                    <tr>
                                        <td class="fw-semibold">Bag Cutting</td>
                                        <td>
                                            <input type="number" name="bag_cutting_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="bag_cutting_bags" data-amount="bag_cutting_amount"
                                                   value="{{ old('bag_cutting_rate', $setting->bag_cutting ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="bag_cutting_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="bag_cutting_rate" data-amount="bag_cutting_amount"
                                                   value="{{ old('bag_cutting_bags', 0) }}" >
                                        </td>
                                        <td>
                                            <input type="number" id="bag_cutting_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                    {{-- Wanda Production --}}
                                    <tr>
                                        <td class="fw-semibold">Wanda Production</td>
                                        <td>
                                            <input type="number" name="wanda_production_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="wanda_production_bags" data-amount="wanda_production_amount"
                                                   value="{{ old('wanda_production_rate', $setting->wanda_production ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="wanda_production_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="wanda_production_rate" data-amount="wanda_production_amount"
                                                   value="{{ old('wanda_production_bags', 0) }}">
                                        </td>
                                        <td>
                                            <input type="number" id="wanda_production_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                    {{-- Unload Refill --}}
                                    <tr>
                                        <td class="fw-semibold">Unload Refill</td>
                                        <td>
                                            <input type="number" name="unload_refill_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="unload_refill_bags" data-amount="unload_refill_amount"
                                                   value="{{ old('unload_refill_rate', $setting->unload_refill ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="unload_refill_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="unload_refill_rate" data-amount="unload_refill_amount"
                                                   value="{{ old('unload_refill_bags', 0) }}" >
                                        </td>
                                        <td>
                                            <input type="number" id="unload_refill_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                    {{-- Packing --}}
                                    <tr>
                                        <td class="fw-semibold">Packing</td>
                                        <td>
                                            <input type="number" name="packing_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="packing_bags" data-amount="packing_amount"
                                                   value="{{ old('packing_rate', $setting->packing ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="packing_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="packing_rate" data-amount="packing_amount"
                                                   value="{{ old('packing_bags', 0) }}">
                                        </td>
                                        <td>
                                            <input type="number" id="packing_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                    {{-- Shifting --}}
                                    <tr>
                                        <td class="fw-semibold">Shifting</td>
                                        <td>
                                            <input type="number" name="shifting_rate" step="0.01" min="0"
                                                   class="form-control text-end rate-input"
                                                   data-bags="shifting_bags" data-amount="shifting_amount"
                                                   value="{{ old('shifting_rate', $setting->shifting ?? 0) }}" readonly>
                                        </td>
                                        <td>
                                            <input type="number" name="shifting_bags" step="0.01" min="0"
                                                   class="form-control text-end bags-input"
                                                   data-rate="shifting_rate" data-amount="shifting_amount"
                                                   value="{{ old('shifting_bags', 0) }}">
                                        </td>
                                        <td>
                                            <input type="number" id="shifting_amount" class="form-control text-end amount-col" readonly value="0">
                                        </td>
                                    </tr>

                                </tbody>
                                <tfoot>
                                    <tr class="total-row">
                                        <td colspan="2" class="text-end">TOTAL</td>
                                        <td class="text-end">
                                            <input type="number" id="total-bags-display" class="form-control text-end fw-bold" readonly value="0">
                                        </td>
                                        <td class="text-end">
                                            <input type="number" id="total-amount-display" class="form-control text-end fw-bold" readonly value="0">
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

                {{-- Buttons --}}
                <div class="row mb-3">
                    <div class="col-12 text-end">
                        <button type="submit" class="btn btn-success w-md" id="save-btn">
                            <i class="bx bx-save me-1"></i> Save Voucher
                        </button>
                        <a href="{{ route('contract-voucher.index') }}" class="btn btn-secondary w-md">Cancel</a>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {

    // Update voucher number preview when date changes
    $('#date').on('change', function () {
        var d = $(this).val().replace(/-/g, '');
        $('#voucher-preview').val(d ? 'CV-' + d : '');
    });

    // Calculate row amount for rate × bags rows
    function calcRowAmount(rateInput) {
        var rate     = parseFloat(rateInput.val()) || 0;
        var bagsName = rateInput.data('bags');
        var amountId = rateInput.data('amount');
        var bags     = parseFloat($('[name="' + bagsName + '"]').val()) || 0;
        $('#' + amountId).val((rate * bags).toFixed(2));
        updateTotals();
    }

    // Flat-rate rows (packing, shifting)
    function calcFlatRate(input) {
        var rate     = parseFloat(input.val()) || 0;
        var amountId = input.data('amount');
        $('#' + amountId).val(rate.toFixed(2));
        updateTotals();
    }

    // Bags field change → use its sibling rate
    $(document).on('input change', '.bags-input', function () {
        var rateName = $(this).data('rate');
        var rateInput = $('[name="' + rateName + '"]');
        var rate   = parseFloat(rateInput.val()) || 0;
        var bags   = parseFloat($(this).val()) || 0;
        var amountId = $(this).data('amount');
        $('#' + amountId).val((rate * bags).toFixed(2));
        updateTotals();
    });

    $(document).on('input change', '.rate-input', function () {
        calcRowAmount($(this));
    });

    function updateTotals() {
        var totalBags   = 0;
        var totalAmount = 0;

        // Bag rows
        $('[name$="_bags"]').each(function () {
            totalBags += parseFloat($(this).val()) || 0;
        });

        // All amount columns
        $('.amount-col').each(function () {
            totalAmount += parseFloat($(this).val()) || 0;
        });

        $('#total-bags-display').val(totalBags.toFixed(2));
        $('#total-amount-display').val(totalAmount.toFixed(2));
    }

    // Initialise on page load (for old() values after validation fail)
    $('.rate-input').each(function () { calcRowAmount($(this)); });
    $('.flat-rate-input').each(function () { calcFlatRate($(this)); });

});
</script>
@endsection
