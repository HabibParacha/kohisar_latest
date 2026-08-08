@extends('template.tmp')
@section('title', 'Create Contract Setting')

@section('content')
<link rel="stylesheet" href="{{ URL('/') }}/assets/libs/select2/css/select2.min.css">

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            {{-- Page Title --}}
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h3 class="mb-sm-0 font-size-18">Create Contract Setting</h3>
                        <div class="page-title-right">
                            <a href="{{ route('contract-settings.index') }}" class="btn btn-secondary">
                                <i class="bx bx-arrow-back me-1"></i> Back
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Validation Errors --}}
            @if($errors->any())
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form action="{{ route('contract-settings.store') }}" method="POST">
                @csrf

                {{-- Chart of Accounts Section --}}
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Chart of Accounts</h5>
                        <div class="row">

                          

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Expense Account (DR) <span class="text-danger">*</span></label>
                                    <select name="coa_expense_dr_id" id="coa_expense_dr_id" class="form-control select2" style="width:100%" required>
                                        <option value="">-- Select Account --</option>
                                        @foreach($chartOfAccounts as $coa)
                                            <option value="{{ $coa->id }}" {{ old('coa_expense_dr_id') == $coa->id ? 'selected' : '' }}>
                                                {{ $coa->id }} - {{ $coa->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                              <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Contractor Payable (CR) <span class="text-danger">*</span></label>
                                    <select name="coa_payable_cr_id" id="coa_payable_cr_id" class="form-control select2" style="width:100%" required>
                                        <option value="">-- Select Account --</option>
                                        @foreach($chartOfAccounts as $coa)
                                            <option value="{{ $coa->id }}" {{ old('coa_payable_cr_id') == $coa->id ? 'selected' : '' }}>
                                                {{ $coa->id }} - {{ $coa->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                           
                        </div>
                    </div>
                </div>

                {{-- Rate Card Section --}}
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Rate Card</h5>
                        <div class="row">

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Unloading</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="unloading" step="0.01" min="0"
                                               value="{{ old('unloading', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Loading</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="loading" step="0.01" min="0"
                                               value="{{ old('loading', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Bag Cutting</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="bag_cutting" step="0.01" min="0"
                                               value="{{ old('bag_cutting', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Wanda Production</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="wanda_production" step="0.01" min="0"
                                               value="{{ old('wanda_production', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Unload Refill</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="unload_refill" step="0.01" min="0"
                                               value="{{ old('unload_refill', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Packing</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="packing" step="0.01" min="0"
                                               value="{{ old('packing', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label class="form-label">Shifting</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><span class="bx bx-money"></span></div>
                                        <input type="number" name="shifting" step="0.01" min="0"
                                               value="{{ old('shifting', 0) }}"
                                               class="form-control text-end" required>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                {{-- Buttons --}}
                <div class="row mb-3">
                    <div class="col-12 text-end">
                        <button type="submit" class="btn btn-success w-md">
                            <i class="bx bx-save me-1"></i> Save
                        </button>
                        <a href="{{ route('contract-settings.index') }}" class="btn btn-secondary w-md">
                            Cancel
                        </a>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.select2').select2({
            placeholder: '-- Select Account --',
            allowClear: true
        });
    });
</script>
@endsection
