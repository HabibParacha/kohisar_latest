<?php

namespace App\Http\Controllers;

use App\Models\InvoiceDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestController extends Controller
{
    public function test(Request $request)
    {

        $BreederOutput = InvoiceDetail::with('item.category')
        ->whereHas('item.category', function ($query) {
            $query->where('id', 1);
        })
        ->where('type','output')
        ->sum('total_price');


        $BreederInvoices = InvoiceDetail::with('item.category')
        ->whereHas('item.category', function ($query) {
            $query->where('id', 1);
        })
       ->where('type','invoice')
        ->sum('total_purcahse_price');


        return response()->json([
            'total_output' => $BreederOutput,
            'total_invoices' => $BreederInvoices,
            'diff' => $BreederOutput - $BreederInvoices
            ]);
    }

    public function old()
    {
        $wanda = DB::table('v_finished_goods_stock_report')
        ->where('category_id',3)
        ->get()
        ->each(function ($i){
            $i->total_purchase_price = $i->balance * $i->purchase_price;
        });

        $wanda = DB::table('v_finished_goods_stock_report')
    ->where('category_id', 3)
    ->sum(DB::raw('balance * purchase_price'));

        dd($wanda->sum('total_purchase_price'));

        $breeder = DB::table('v_finished_goods_stock_report')
        ->where('category_id',1)
        ->get();


        $broiler = DB::table('v_finished_goods_stock_report')
        ->where('category_id',2)
        ->get();

        $layer = DB::table('v_finished_goods_stock_report')
        ->where('category_id',4)
        ->get();
    }
}
