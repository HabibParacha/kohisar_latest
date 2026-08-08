@extends('template.tmp')
@section('title', 'kohisar')

@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-semibold mb-0">Surplus Bags Cumulative Production</h3>
            </div>

            <div class="mb-4">
                <b class=" me-2 fs-6">
                    From: {{ date('d-m-Y', strtotime(request('startDate'))) }}
                </b>
                <b class=" me-2 fs-6">
                    To: 
                    {{ date('d-m-Y', strtotime(request('endDate'))) }}
                </b>

    
               
            </div>
 

            <div class="card shadow-sm border-0 mb-4 col-md-8">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped align-middle mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th class="ps-3">#</th>
                                    <th>Date</th>
                                    <th>Production No</th>
                                    <th>Item Name</th>
                                    <th class="text-center pe-3">Total Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data as $row)
                                    <tr>
                                        <td class="ps-3">{{ $loop->iteration}}</td>
                                        <td>{{ date('d-m-Y', strtotime($row->date)) }}</td>
                                        <td>{{ $row->invoice_no }}</td>
                                        <td>{{ $row->item->name }}</td>
                                       
                                        <td class="text-center pe-3">
                                            {{ number_format($row->total_quantity, 0) }}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                            
                        </table>
                    </div>
                </div>
            </div>

      

            {{-- Grand Total Card --}}
            <div class="card shadow border-0 mb-4 col-md-8">
                <div class="card-header bg-dark  border-0 py-3">
                    <h5 class="mb-0 fw-semibold text-white">
                        <i class="ri-calculator-line me-1"></i> Grand Total
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        {{-- <div class="col-md-6">
                            <div class="border rounded-3 p-4 text-center bg-light">
                                <div class="text-muted small mb-1">Total Net Weight</div>
                                <div class="fs-3 fw-bold text-primary">
                                    {{ number_format($grandWeight, 0) }}
                                </div>
                            </div>
                        </div> --}}
                        <div class="col-md-12">
                            <div class="border rounded-3 p-4 text-center bg-light">
                                <div class="text-muted small mb-1">Total Quantity</div>
                                <div class="fs-3 fw-bold text-success">
                                    {{ number_format($data->sum('total_quantity'), 0) }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection