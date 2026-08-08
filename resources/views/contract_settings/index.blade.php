@extends('template.tmp')
@section('title', 'Contract Settings')

@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            {{-- Page Title --}}
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h3 class="mb-sm-0 font-size-18">Contract Settings</h3>
                        <div class="page-title-right">
                            <a href="{{ route('contract-settings.create') }}" class="btn btn-primary">
                                <i class="mdi mdi-plus me-1"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Flash Messages --}}
            @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            @endif

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="">
                                <table id="contract-settings-table" class="table table-striped table-sm" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Expense Acc</th>
                                            <th>Contractor Payable</th>
                                            <th class="text-end">Unloading</th>
                                            <th class="text-end">Loading</th>
                                            <th class="text-end">Bag Cutting</th>
                                            <th class="text-end">Wanda Production</th>
                                            <th class="text-end">Unload Refill</th>
                                            <th class="text-end">Packing</th>
                                            <th class="text-end">Shifting</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($settings as $setting)
                                        <tr>
                                            <td>{{ $setting->id }}</td>
                                            <td>{{ $setting->coaExpenseDr->name ?? '-' }}</td>
                                            <td>{{ $setting->coaPayableCr->name ?? '-' }}</td>
                                            <td class="text-end">{{ number_format($setting->unloading, 2) }}</td>
                                            <td class="text-end">{{ number_format($setting->loading, 2) }}</td>
                                            <td class="text-end">{{ number_format($setting->bag_cutting, 2) }}</td>
                                            <td class="text-end">{{ number_format($setting->wanda_production, 2) }}</td>
                                            <td class="text-end">{{ number_format($setting->unload_refill, 2) }}</td>
                                            <td class="text-end">{{ number_format($setting->packing, 2) }}</td>
                                            <td class="text-end">{{ number_format($setting->shifting, 2) }}</td>
                                            <td class="text-center">
                                                
                                                <a href="{{ route('contract-settings.edit', $setting->id) }}" class="btn btn-sm btn-light">
                                                    <i class="bx bx-pencil font-size-16 text-secondary me-1"></i> Edit
                                                </a>
                                                    
                                                
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
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#contract-settings-table').DataTable({
            responsive: true,
            pageLength: 25,
        });
    });

    function deleteContractSetting(id) {
        if (confirm('Are you sure you want to delete this contract setting?')) {
            document.getElementById('delete-form-' + id).submit();
        }
    }
</script>
@endsection
