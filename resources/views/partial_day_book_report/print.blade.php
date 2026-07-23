<!DOCTYPE html>
<html>

<head>
    <title>Partial Day Book Report</title>

    <style>
        @page {
            size: A4;
            margin: 10mm;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            color: #000;
        }

        .page {
            width: 80%;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h3 {
            margin: 0;
            font-size: 18px;
        }

        .date {
            margin-top: 5px;
            font-size: 13px;
        }


        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 5px;
        }

        th {
            background: #eee;
            text-align: center;
        }

        .text-end {
            text-align: right;
        }

        .section-title {
            font-weight: bold;
            background: #ddd;
            text-align: left;
        }

        .total {
            font-weight: bold;
        }


        .buttons {
            position: fixed;
            right: 20px;
            bottom: 20px;
        }

        .buttons button {
            padding: 8px 15px;
            margin-left: 5px;
            cursor: pointer;
        }

        .text-start {
            text-align: left;
        }

        .text-center {
            text-align: center;
        }

        .text-end {
            text-align: right;
        }

        .fw-bold {
            font-weight: 700;
        }

        .text-dark {
            color: #212529;
        }

        .text-white {
            color: #ffffff;
        }

        .bg-success {
            background-color: #198754;
        }

        .bg-dark {
            background-color: #212529;
        }
        .bg-warning {
            background-color: #ffc107;
        }

        @media print {

            .buttons {
                display: none;
            }

            .page {
                width: 100%;
            }
        }

        /* Floating Action Buttons */
        .floating-actions {
            position: fixed;
            bottom: 25px;
            right: 25px;
            display: flex;
            flex-direction: column;
            gap: 12px;
            z-index: 9999;
        }

        .fab {
            width: 58px;
            height: 58px;
            border: none;
            border-radius: 50%;
            color: #fff;
            font-size: 22px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.25);
            transition: all .3s ease;
        }

        .fab:hover {
            transform: translateY(-3px) scale(1.08);
        }

        .print-btn {
            background: #2980b9;
        }

        .pdf-btn {
            background: #27ae60;
        }

        .back-btn {
            background: #e67e22;
        }

        @media print {
            .floating-actions {
                display: none !important;
            }
        }
    </style>
</head>

<body>


    <div class="page">

        <div class="header">
            <h3>Partial Day Book Report</h3>

            <div class="date">
                {{ date('d-m-Y', strtotime($startDate)) }}

                @if ($startDate != $endDate)
                    - {{ date('d-m-Y', strtotime($endDate)) }}
                @endif
            </div>
        </div>


        <table>

            <thead>
                <tr>
                    <th>Date</th>
                    <th>Ref. No</th>
                    <th>Supplier</th>
                    <th>Item</th>
                    <th>Vehicle No</th>
                    <th>Total Bags</th>
                    <th>Net Wgt.</th>
                    <th>Rate</th>
                    <th>Freight</th>
                </tr>
            </thead>


            <tbody>

                @include('partial_day_book_report.partials._receipts')


                <tr class="total">
                    <td colspan="8" class="text-end">
                        Total
                    </td>

                    <td class="text-end">
                        {{ $totalReceiptFreight }}
                    </td>
                </tr>


                @include('partial_day_book_report.partials._si_x_freight_0')


                <tr class="total">
                    <td colspan="8" class="text-end">
                        Total
                    </td>

                    <td class="text-end">
                        {{ $totalSaleFreightExcludingX }}
                    </td>
                </tr>



                @include('partial_day_book_report.partials._si_x_freight_1')


                <tr class="total">
                    <td colspan="8" class="text-end">
                        Total
                    </td>

                    <td class="text-end">
                        {{ $totalSaleFreightIncludingX }}
                    </td>
                </tr>


            </tbody>

        </table>


    </div>



     <div class="floating-actions">

        <button class="fab back-btn" onclick="history.back()" title="Back">
            ←
        </button>

        <button class="fab pdf-btn" onclick="window.print()" title="Save as PDF">
            📄
        </button>

        <button class="fab print-btn" onclick="window.print()" title="Print">
            🖨️
        </button>

    </div>

</body>

</html>
