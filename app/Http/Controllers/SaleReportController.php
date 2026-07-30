<?php

namespace App\Http\Controllers;

use App\Models\InvoiceDetail;
use App\Models\Party;
use Illuminate\Http\Request;

class SaleReportController extends Controller
{
    public function customerCummulativeSalesRequest()
    {
        $customers = Party::whereIn('party_type',['customer','both'])->get();

        return view('reports.customer_cumm_sales.request', compact('customers'));
    }

    public function customerCummulativeSalesShow(Request $request)
    {
    
        $startDate = $request->startDate;
        $endDate = $request->endDate;
        $party_id = $request->party_id;
        $partyName = $request->party_id ? Party::find($request->party_id)->business_name : 'All Customers';

        $data = InvoiceDetail::with([
            'item.category',
            'invoiceMaster'
        ])
        ->whereHas('item.category', function ($query) {
            $query->salesCategories();
        })
        ->whereHas('invoiceMaster', function ($query) use ($request) {

            $query->where('type', 'invoice')
                ->whereBetween('date', [
                    $request->startDate,
                    $request->endDate
                ]);

            if ($request->filled('party_id')) {
                $query->where('party_id', $request->party_id);
            }
        })
        ->get();


        $report = $data
        ->groupBy(fn ($detail) => $detail->item->category->name)
        ->map(function ($categoryItems) {

            return $categoryItems
                ->groupBy('item_id')
                ->map(function ($items) {

                    return (object)[
                        'item' => $items->first()->item->name,
                        'net_weight' => $items->sum('net_weight'),
                        'total_quantity' => $items->sum('total_quantity'),
                    ];
                });
        });

        return view('reports.customer_cumm_sales.show', compact('report', 'partyName', 'startDate', 'endDate'));
    }
}
