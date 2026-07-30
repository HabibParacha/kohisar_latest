<?php

namespace App\Http\Controllers;

use App\Models\InvoiceDetail;
use Illuminate\Http\Request;

class SurplusBagsReportController extends Controller
{
    public function cummulativeProductionRequest()
    {
        return view('reports.surplus_bags_cumm_prod.request');
    }

    public function cummulativeProductionShow(Request $request)
    {
        $startDate = $request->startDate;
        $endDate = $request->endDate;

        $data = InvoiceDetail::with([
            'item.category'
        ])
        ->where('type', 'output')
        ->where('is_surplus', 1)
        ->whereHas('item.category', function ($query) {
            $query->salesCategories();
        })
        ->whereBetween('date', [
            $request->startDate,
            $request->endDate
        ])
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
        return view('reports.surplus_bags_cumm_prod.show', compact('report'));


    }
}
