@extends('template.tmp')
@section('title', 'kohisar')

@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-semibold mb-0">{{ $partyName }} Cumulative Sales</h3>
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

            @php
                $sr = 1;
                $grandWeight = 0;
                $grandQuantity = 0;
            @endphp

            @foreach($report as $category => $items)

                @php
                    $categoryWeight = 0;
                    $categoryQuantity = 0;
                @endphp

                {{-- Category Card --}}
                <div class="card shadow-sm border-0 mb-4">
                    <div class="card-header bg-dark bg-opacity-10 border-0 py-3">
                        <h5 class="mb-0 fw-semibold text-white">
                            {{ $category }}
                        </h5>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th width="5%" class="ps-3">#</th>
                                        <th width="40%">Name</th>
                                        {{-- <th class="text-center">Net Weight</th> --}}
                                        <th class="text-center pe-3">Total Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($items as $row)
                                        @php
                                            $categoryWeight   += $row->net_weight;
                                            $categoryQuantity += $row->total_quantity;
                                            $grandWeight      += $row->net_weight;
                                            $grandQuantity    += $row->total_quantity;
                                        @endphp

                                        <tr>
                                            <td class="ps-3">{{ $sr++ }}</td>
                                            <td>{{ $row->item }}</td>
                                            {{-- <td class="text-center">
                                                {{ number_format($row->net_weight, 0) }}
                                            </td> --}}
                                            <td class="text-center pe-3">
                                                {{ number_format($row->total_quantity, 0) }}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr class="table-light fw-bold">
                                        <td colspan="2" class="text-end pe-3">Category Total</td>
                                        {{-- <td class="text-center">
                                            {{ number_format($categoryWeight, 0) }}
                                        </td> --}}
                                        <td class="text-center pe-3">
                                            {{ number_format($categoryQuantity, 0) }}
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

            @endforeach

            {{-- Grand Total Card --}}
            <div class="card shadow border-0 mb-4">
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
                                    {{ number_format($grandQuantity, 0) }}
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