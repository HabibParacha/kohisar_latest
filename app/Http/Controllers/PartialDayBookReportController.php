<?php

namespace App\Http\Controllers;

use App\Models\InvoiceMaster;
use Illuminate\Http\Request;

class PartialDayBookReportController extends Controller
{
    public function index(Request $request)
    {
        $data = $this->getReportData($request);

        return view('partial_day_book_report.index', $data);
    }


    public function print(Request $request)
    {
        $data = $this->getReportData($request);

        return view('partial_day_book_report.print', $data);
    }


    private function getReportData(Request $request)
    {
        $startDate = $request->start_date ?? date('Y-m-d');

        $endDate = $request->multiple_dates == 1
            ? $request->end_date
            : $startDate;


        $openingBalance = $this->calculateOpeningBalance($startDate);


        $receipts = InvoiceMaster::with('invoiceDetails','party:id,business_name')
            ->whereBetween('date', [$startDate, $endDate])
            ->where('type', 'receipt')
            ->whereNotNull('reference_no')
            ->orderBy('reference_no')
            ->get();


        $saleInvoices_is_x_freight_0 = InvoiceMaster::with('invoiceDetails','party:id,business_name')
            ->whereBetween('date', [$startDate, $endDate])
            ->where('type', 'invoice')
            ->where('is_x_freight', 0)
            ->orderBy('reference_no')
            ->get();


        $saleInvoices_is_x_freight_1 = InvoiceMaster::with('invoiceDetails','party:id,business_name')
            ->whereBetween('date', [$startDate, $endDate])
            ->where('type', 'invoice')
            ->where('is_x_freight', 1)
            ->orderBy('reference_no')
            ->get();


        $totalReceiptFreight = $receipts->sum('shipping');

        $totalSaleFreightExcludingX = $saleInvoices_is_x_freight_0->sum('shipping');

        $totalSaleFreightIncludingX = $saleInvoices_is_x_freight_1->sum('shipping');


        $closingBalance = $openingBalance 
            + $totalReceiptFreight 
            + $totalSaleFreightExcludingX;


        return [
            'receipts' => $receipts,

            'saleInvoices_is_x_freight_0' => $saleInvoices_is_x_freight_0,

            'saleInvoices_is_x_freight_1' => $saleInvoices_is_x_freight_1,


            'totalReceiptFreight' => $totalReceiptFreight,

            'totalSaleFreightExcludingX' => $totalSaleFreightExcludingX,

            'totalSaleFreightIncludingX' => $totalSaleFreightIncludingX,

            'openingBalance' => $openingBalance,

            'closingBalance' => $closingBalance,

            'startDate' => $startDate,

            'endDate' => $endDate,
        ];
    }



    private function calculateOpeningBalance($startDate)
    {
        $receipts = InvoiceMaster::whereDate('date', '<', $startDate)
            ->where('type', 'receipt')
            ->whereNotNull('reference_no')
            ->sum('shipping');


        $saleInvoices_is_x_freight_0 = InvoiceMaster::whereDate('date', '<', $startDate)
            ->where('type', 'invoice')
            ->where('is_x_freight', 0)
            ->sum('shipping');


        return $receipts + $saleInvoices_is_x_freight_0;
    }
}