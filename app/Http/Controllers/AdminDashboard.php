<?php

namespace App\Http\Controllers;

use App\Models\InvoiceDetail;
use App\Models\User;
use Illuminate\Http\Request;

class AdminDashboard extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $total_users = User::count();

        $startOfMonth = date('Y-m-01');
        $endOfMonth = date('Y-m-t');
       
        $totalBagSold = InvoiceDetail::where('type', 'invoice')
            ->whereBetween('date', [$startOfMonth, $endOfMonth])
            ->sum('total_quantity');

            

        return view('admin_dashboard', 
            compact(
                'total_users',
                'totalBagSold'
            )
        );
    }
}
