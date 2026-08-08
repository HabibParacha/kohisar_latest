@extends('template.tmp')
@section('title', 'Contract Vouchers')

@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h3 class="mb-sm-0 font-size-18">Contract Vouchers</h3>
                        <div class="page-title-right">
                            <a href="{{ route('contract-voucher.create') }}" class="btn btn-primary">
                                <i class="mdi mdi-plus me-1"></i> Create Voucher
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

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="contract-vouchers-table" class="table table-striped table-sm" style="width:100%">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Date</th>
                                    <th>Voucher No.</th>
                                    <th class="text-end">Total Bags</th>
                                    <th class="text-end">Total Amount</th>
                                    <th>Created By</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($vouchers as $voucher)
                                <tr>
                                    <td>{{ $voucher->id }}</td>
                                    <td>{{ date('d-m-Y', strtotime($voucher->date)) }}</td>
                                    <td><span class="badge bg-secondary">{{ $voucher->voucher_number }}</span></td>
                                    <td class="text-end">{{ number_format($voucher->total_bags, 2) }}</td>
                                    <td class="text-end fw-bold">{{ number_format($voucher->total_amount, 2) }}</td>
                                    <td>{{ $voucher->createdBy->name ?? '-' }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('contract-voucher.show', $voucher->id) }}"
                                           class="btn btn-sm btn-info" title="View">
                                            <i class="bx bx-show"></i>
                                        </a>
                                        @if(Auth::user()->is_super_admin)
                                        <a href="{{ route('contract-voucher.edit', $voucher->id) }}"
                                           class="btn btn-sm btn-warning" title="Edit">
                                            <i class="bx bx-pencil"></i>
                                        </a>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#contract-vouchers-table').DataTable({
            order: [[1, 'desc']],
            pageLength: 25,
        });
    });
</script>
@endsection
