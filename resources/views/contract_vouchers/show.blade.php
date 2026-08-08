@extends('template.tmp')
@section('title', 'Contract Voucher — {{ $contractVoucher->voucher_number }}')

@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h3 class="mb-sm-0 font-size-18">
                            Contract Voucher
                            <span class="badge bg-secondary ms-2">{{ $contractVoucher->voucher_number }}</span>
                        </h3>
                        <div class="page-title-right d-flex gap-2">
                            @if(Auth::user()->is_super_admin)
                            <a href="{{ route('contract-voucher.edit', $contractVoucher->id) }}" class="btn btn-warning">
                                <i class="bx bx-pencil me-1"></i> Edit
                            </a>
                            @endif
                            <button onclick="window.print()" class="btn btn-outline-secondary">
                                <i class="bx bx-printer me-1"></i> Print
                            </button>
                            <a href="{{ route('contract-voucher.index') }}" class="btn btn-secondary">
                                <i class="bx bx-arrow-back me-1"></i> Back
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            @endif

            {{-- ── Header Info ── --}}
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <p class="mb-1 text-muted">Date</p>
                            <p class="fw-bold">{{ date('d-m-Y', strtotime($contractVoucher->date)) }}</p>
                        </div>
                        <div class="col-md-3">
                            <p class="mb-1 text-muted">Voucher No.</p>
                            <p class="fw-bold">{{ $contractVoucher->voucher_number }}</p>
                        </div>
                        <div class="col-md-3">
                            <p class="mb-1 text-muted">Created By</p>
                            <p class="fw-bold">{{ $contractVoucher->createdBy->name ?? '-' }}</p>
                        </div>
                        <div class="col-md-3">
                            <p class="mb-1 text-muted">Expense DR </p>
                            <p class="fw-bold">{{ $contractVoucher->expenseCoaDr->name ?? $contractVoucher->expense_coa_dr_id }}</p>
                        </div>
                        <div class="col-md-3">
                            <p class="mb-1 text-muted">Contractor payable CR</p>
                            <p class="fw-bold">{{ $contractVoucher->payableCoaCr->name ?? $contractVoucher->coa_payable_cr_id }}</p>
                        </div>
                        @if($contractVoucher->updatedBy)
                        <div class="col-md-3">
                            <p class="mb-1 text-muted">Last Updated By</p>
                            <p class="fw-bold">{{ $contractVoucher->updatedBy->name }}</p>
                        </div>
                        @endif
                    </div>
                </div>
            </div>

            {{-- ── Rate Card Detail ── --}}
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-3">Rate Card Detail</h5>
                    <div class="table-responsive">
                        <table class="table table-bordered table-sm">
                            <thead class="table-light">
                                <tr>
                                    <th>Activity</th>
                                    <th class="text-end">Rate (Rs)</th>
                                    <th class="text-end">Bags</th>
                                    <th class="text-end">Amount (Rs)</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $v = $contractVoucher;
                                    $rows = [
                                        ['label' => 'Unloading',        'rate' => $v->unloading_rate,        'bags' => $v->unloading_bags],
                                        ['label' => 'Loading',          'rate' => $v->loading_rate,          'bags' => $v->loading_bags],
                                        ['label' => 'Bag Cutting',      'rate' => $v->bag_cutting_rate,      'bags' => $v->bag_cutting_bags],
                                        ['label' => 'Wanda Production', 'rate' => $v->wanda_production_rate, 'bags' => $v->wanda_production_bags],
                                        ['label' => 'Unload Refill',    'rate' => $v->unload_refill_rate,    'bags' => $v->unload_refill_bags],
                                        ['label' => 'Packing',          'rate' => $v->packing_rate,          'bags' => $v->packing_bags],
                                        ['label' => 'Shifting',         'rate' => $v->shifting_rate,         'bags' => $v->shifting_bags],
                                    ];
                                @endphp

                                @foreach($rows as $row)
                                <tr>
                                    <td>{{ $row['label'] }}</td>
                                    <td class="text-end">{{ number_format($row['rate'] ?? 0, 2) }}</td>
                                    <td class="text-end">
                                        @if($row['bags'] !== null)
                                            {{ number_format($row['bags'], 2) }}
                                        @else
                                            <span class="text-muted">—</span>
                                        @endif
                                    </td>
                                    <td class="text-end">
                                        @if($row['bags'] !== null)
                                            {{ number_format(($row['rate'] ?? 0) * ($row['bags'] ?? 0), 2) }}
                                        @else
                                            {{ number_format($row['rate'] ?? 0, 2) }}
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr class="table-dark">
                                    <td colspan="2" class="text-end fw-bold">TOTAL</td>
                                    <td class="text-end fw-bold">{{ number_format($contractVoucher->total_bags, 2) }}</td>
                                    <td class="text-end fw-bold fs-5">{{ number_format($contractVoucher->total_amount, 2) }}</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>

            {{-- ── Journal Summary ── --}}
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-3">Journal Entries Posted</h5>
                    <table class="table table-sm table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>Account</th>
                                <th class="text-end">Debit (Rs)</th>
                                <th class="text-end">Credit (Rs)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{ $contractVoucher->expenseCoaDr->name ?? ('COA #' . $contractVoucher->expense_coa_dr_id) }}
                                    <small class="text-muted">(Expense)</small></td>
                                <td class="text-end">{{ number_format($contractVoucher->total_amount, 2) }}</td>
                                <td class="text-end">—</td>
                            </tr>
                            <tr>
                                <td>{{ $contractVoucher->payableCoaCr->name ?? ('COA #' . $contractVoucher->coa_payable_cr_id) }}
                                    <small class="text-muted">(Payable)</small></td>
                                <td class="text-end">—</td>
                                <td class="text-end">{{ number_format($contractVoucher->total_amount, 2) }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection
