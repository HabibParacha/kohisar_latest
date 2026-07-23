@extends('template.tmp')
@section('title', 'kohisar')

@section('content')
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
    :root {
        --primary-color: #0d6efd;
    }

    .main-content {
        background-color: #f8f9fa;
    }

    .report-header {
        background: white;
        border-bottom: 1px solid #e9ecef;
    }

    .category-card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .category-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }

    .table-container {
        max-height: 520px;
        overflow-y: auto;
        border-radius: 8px;
        border: 1px solid #e9ecef;
    }

    .table-container table {
        border-collapse: separate;
        border-spacing: 0;
    }

    .table-container thead th {
        position: sticky;
        top: 0;
        z-index: 10;
        background: #212529;
        color: #fff;
        font-weight: 500;
        font-size: 0.875rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .table th, .table td {
        padding: 14px 10px;
        vertical-align: middle;
        font-size: 0.95rem;
    }

    .table tbody tr:hover {
        background-color: #f8f9fa;
    }

    .number-cell {
        font-variant-numeric: tabular-nums;
        text-align: right;
    }

    .summary-card {
        background: linear-gradient(135deg, #f8f9fa, #ffffff);
        border: none;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(13, 110, 253, 0.1);
    }

    .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #495057;
        margin-bottom: 1rem;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }
</style>

<div class="main-content">
    <div class="page-content py-4">
        <div class="container-fluid">
            
            <!-- Page Header -->
            <div class="report-header mb-4 py-3 px-4 rounded-3 shadow-sm">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h2 class="h4 mb-0 fw-semibold text-dark">Stock Report - Kohisar</h2>
                        <p class="text-muted mb-0 small">Production &amp; Sales Overview</p>
                    </div>
                    <div class="text-end">
                        <span class="badge bg-primary fs-6 px-3 py-2">Live Summary</span>
                    </div>
                </div>
            </div>

            <!-- Category Sections -->
            @foreach ($data as $categoryData)
                <div class="mb-5">
                    <div class="section-title">
                        <i class="bi bi-folder2-open text-primary"></i>
                        {{ $categoryData['category_name'] }}
                    </div>

                    <div class="card category-card">
                        <div class="card-body p-0">
                            <div class="table-container">
                                <table id="table{{ $loop->index }}" class="table table-hover mb-0 align-middle">
                                    <thead class="table-dark">
                                        <tr>
                                            <th width="40" class="text-center">#</th>
                                            <th>Name</th>
                                            <th class="text-end">Opening Stock</th>
                                            <th class="text-end">Production</th>
                                            <th class="text-end">Total</th>
                                            <th class="text-end">Bags Issued</th>
                                            <th class="text-end">Closing Stock</th>
                                            <th class="text-end">Cum. Sales</th>
                                            <th class="text-end">Cum. Production</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($categoryData['items'] as $item)
                                        @php
                                            $opening_stock = round($item['before_start_date_production'] - $item['before_start_date_sales'], 2);
                                            $total = round($item['between_dates_production'] + $opening_stock, 2);
                                            $closing_stock = round($total - $item['between_dates_sales'], 2);
                                        @endphp
                                            <tr>
                                                <td class="text-center text-muted">{{ $loop->iteration }}</td>
                                                <td class="fw-medium">{{ $item['name'] }}</td>
                                                <td class="number-cell">{{ $opening_stock > 0 ? number_format($opening_stock, 2) : '—' }}</td>
                                                <td class="number-cell">{{ number_format($item['between_dates_production'], 2) }}</td>
                                                <td class="number-cell fw-semibold">{{ number_format($total, 2) }}</td>
                                                <td class="number-cell">{{ number_format($item['between_dates_sales'], 2) }}</td>
                                                <td class="number-cell {{ $closing_stock < 0 ? 'text-danger' : '' }}">{{ number_format($closing_stock, 2) }}</td>
                                                <td class="number-cell">{{ number_format($item['cumulative_sale'], 2) }}</td>
                                                <td class="number-cell">{{ number_format($item['cumulative_prod'], 2) }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>

                                    <!-- Category Total -->
                                    @php
                                        $sumOpening = collect($categoryData['items'])->sum('before_start_date_production') - collect($categoryData['items'])->sum('before_start_date_sales');
                                        $sumProduction = collect($categoryData['items'])->sum('between_dates_production');
                                        $sumTotal = $sumProduction + $sumOpening;
                                        $sumSales = collect($categoryData['items'])->sum('between_dates_sales');
                                        $sumClosing = $sumTotal - $sumSales;
                                        $sumCumSales = collect($categoryData['items'])->sum('cumulative_sale');
                                        $sumCumProd = collect($categoryData['items'])->sum('cumulative_prod');
                                    @endphp

                                    <tfoot class="table-light border-top border-2">
                                        <tr class="fw-bold">
                                            <td colspan="2" class="text-end pe-3">Total for {{ $categoryData['category_name'] }}</td>
                                            <td class="number-cell">{{ $sumOpening > 0 ? number_format($sumOpening, 2) : '—' }}</td>
                                            <td class="number-cell">{{ number_format($sumProduction, 2) }}</td>
                                            <td class="number-cell">{{ number_format($sumTotal, 2) }}</td>
                                            <td class="number-cell">{{ number_format($sumSales, 2) }}</td>
                                            <td class="number-cell">{{ number_format($sumClosing, 2) }}</td>
                                            <td class="number-cell">{{ number_format($sumCumSales, 2) }}</td>
                                            <td class="number-cell">{{ number_format($sumCumProd, 2) }}</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach

            <!-- Grand Total Summary -->
            <div class="summary-card p-4">
                <h4 class="section-title mb-4">
                    <i class="bi bi-bar-chart-line text-primary"></i>
                    Overall Summary
                </h4>

                @php
                    $grandOpening = 0;
                    $grandProduction = 0;
                    $grandTotal = 0;
                    $grandBagsIssued = 0;
                    $grandClosing = 0;
                    $grandCumSales = 0;
                    $grandCumProd = 0;

                    foreach ($data as $categoryData) {
                        $catOpening = collect($categoryData['items'])->sum('before_start_date_production') - collect($categoryData['items'])->sum('before_start_date_sales');
                        $catProd = collect($categoryData['items'])->sum('between_dates_production');
                        $catTotal = $catProd + $catOpening;
                        $catSales = collect($categoryData['items'])->sum('between_dates_sales');
                        $catClosing = $catTotal - $catSales;

                        $grandOpening += $catOpening;
                        $grandProduction += $catProd;
                        $grandTotal += $catTotal;
                        $grandBagsIssued += $catSales;
                        $grandClosing += $catClosing;
                        $grandCumSales += collect($categoryData['items'])->sum('cumulative_sale');
                        $grandCumProd += collect($categoryData['items'])->sum('cumulative_prod');
                    }
                @endphp

                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle" style="background: white;">
                        <thead class="table-dark">
                            <tr>
                                <th class="text-start">Total Opening Stock</th>
                                <th class="text-end">Total Production</th>
                                <th class="text-end">Grand Total</th>
                                <th class="text-end">Total Bags Issued</th>
                                <th class="text-end">Total Closing Stock</th>
                                <th class="text-end">Total Cum. Sales</th>
                                <th class="text-end">Total Cum. Production</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="fw-bold fs-5">
                                <td class="text-start">{{ number_format($grandOpening, 2) }}</td>
                                <td class="text-end">{{ number_format($grandProduction, 2) }}</td>
                                <td class="text-end">{{ number_format($grandTotal, 2) }}</td>
                                <td class="text-end">{{ number_format($grandBagsIssued, 2) }}</td>
                                <td class="text-end">{{ number_format($grandClosing, 2) }}</td>
                                <td class="text-end">{{ number_format($grandCumSales, 2) }}</td>
                                <td class="text-end">{{ number_format($grandCumProd, 2) }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Optional: Add smooth scrolling or minor enhancements
        $('.table-container').on('scroll', function() {
            // Future enhancements if needed
        });
    });
</script>
@endsection