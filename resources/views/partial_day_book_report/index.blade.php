@extends('template.tmp')

@section('content')
<style>
    .table-scroll {
    max-height: 500px;
    overflow-y: auto;
}

.table-scroll thead th {
    position: sticky;
    top: 0;
    z-index: 2;
    background-color: var(--bs-light);
}
</style>
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                {{-- Filter Form --}}
                <form action="{{ route('partial-day-book-report.index') }}" method="GET">
                    <div class=" mb-3">
                        <div class="row g-3 align-items-end">

                            <div class="col-md-8">
                                <div class="row g-3 align-items-end">

                                    <div class="col-md-3">
                                        <label class="form-label">Start Date</label>
                                        <input type="date" name="start_date" id="start_date"
                                            class="form-control @error('start_date') is-invalid @enderror"
                                            value="{{ request('start_date', date('Y-m-d')) }}">
                                    </div>

                                    <div class="col-md-3" id="endDateWrapper" style="display:none;">
                                        <label class="form-label">End Date</label>
                                        <input type="date" name="end_date" id="end_date"
                                            class="form-control @error('end_date') is-invalid @enderror"
                                            value="{{ request('end_date') }}">


                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-check mt-4">
                                            <input class="form-check-input" type="checkbox" id="multiple_dates"
                                                name="multiple_dates" value="1"
                                                {{ request('multiple_dates') ? 'checked' : '' }}>

                                            <label class="form-check-label" for="multiple_dates">
                                                Multiple Dates
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Actions -->
                            <div class="col-md-4">
                                <div class="d-flex gap-2 justify-content-end">
                                    <button type="submit" class="btn btn-primary px-4">
                                        <i class="mdi mdi-magnify"></i>
                                        Search
                                    </button>
                                    @if ($receipts->isNotEmpty() || $saleInvoices_is_x_freight_0->isNotEmpty() || $saleInvoices_is_x_freight_1->isNotEmpty())
                                        <a href="{{ route('partial-day-book-report.print', request()->query()) }}"
                                            class="btn btn-success px-4">
                                            <i class="mdi mdi-download"></i>
                                            Download
                                        </a>
                                    @endif
                                </div>
                            </div>

                        </div>
                    </div>
                </form>

                <div class="card shadow-sm">
                    <div class="col-md-12">

                            <div class="table-responsive table-scroll">
                                <table class="table table-bordered align-middle table-sm">
                                    <thead class="table-light">
                                        <tr>
                                            <th style="width:10%">Date</th>
                                            <th style="width:10%">Ref. No</th>
                                            <th style="width:20%">Supplier</th>
                                            <th style="width:10%">Item</th>
                                            <th style="width:10%">Vehicle No</th>
                                            <th class="text-end" style="width:10%">Total Bags</th>
                                            <th class="text-end" style="width:10%">Net Wgt.</th>
                                            <th class="text-end" style="width:10%">Rate</th>
                                            <th class="text-end" style="width:10%">Freight</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        @include('partial_day_book_report.partials._receipts')

                                        <tr>
                                            <td colspan="8" class="text-end fw-bold">Total</td>
                                            <td class="text-end fw-bold">{{ $totalReceiptFreight }}</td>
                                        </tr>

                                        @include('partial_day_book_report.partials._si_x_freight_0')

                                        <tr>
                                            <td colspan="8" class="text-end fw-bold">Total</td>
                                            <td class="text-end fw-bold">{{ $totalSaleFreightExcludingX }}</td>
                                        </tr>

                                        @include('partial_day_book_report.partials._si_x_freight_1')

                                        <tr>
                                            <td colspan="8" class="text-end fw-bold">Total</td>
                                            <td class="text-end fw-bold">{{ $totalSaleFreightIncludingX }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {

            const checkbox = document.getElementById('multiple_dates');
            const endDateWrapper = document.getElementById('endDateWrapper');
            const endDate = document.getElementById('end_date');

            function toggleEndDate() {
                if (checkbox.checked) {
                    endDateWrapper.style.display = 'block';
                } else {
                    endDateWrapper.style.display = 'none';
                    endDate.value = ''; // clear end date when disabled
                }
            }

            checkbox.addEventListener('change', toggleEndDate);

            // Keep visible after validation/request reload
            toggleEndDate();
        });
    </script>
@endsection
