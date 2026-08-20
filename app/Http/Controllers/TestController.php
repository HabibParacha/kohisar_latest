<?php

namespace App\Http\Controllers;

use App\Models\InvoiceDetail;
use Illuminate\Http\Request;

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
        ->sum('total_purchase_price');


        return response()->json([
            'total_output' => $BreederOutput,
            'total_invoices' => $BreederInvoices,
            'diff' => $BreederOutput - $BreederInvoices
            ]);
    }
}
