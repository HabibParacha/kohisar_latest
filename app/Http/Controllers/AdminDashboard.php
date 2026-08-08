<?php

namespace App\Http\Controllers;

use App\Models\InvoiceDetail;
use App\Models\Category;
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

        $today = date('Y-m-d');
        $startOfMonth = date('Y-m-01');
        $endOfMonth = date('Y-m-t');
       
        $totalBagSold = InvoiceDetail::where('type', 'invoice')
            ->whereHas('item.category', function ($query) {
                $query->salesCategories();
            })
            ->whereBetween('date', [$startOfMonth, $endOfMonth])
            ->sum('total_quantity');
        
        $previous = InvoiceDetail::with('item.category')
            ->where('type', 'sale_order')
            ->where('date', '<', $today)
            ->get()
            ->groupBy(fn($x) => $x->item->category_id);

        $today = InvoiceDetail::with('item.category')
            ->where('type', 'sale_order')
            ->where('date', $today)
            ->get()
            ->groupBy(fn($x) => $x->item->category_id);

        $prendingOrders = Category::salesCategories()->get()->map(function ($category) use ($previous, $today) {
            $previous = $previous->get($category->id, collect())->sum('balance_quantity');
            $today = $today->get($category->id, collect())->sum('balance_quantity');
            $total = $previous + $today;

            return [
                'name' => $category->name,
                'previous' => $previous,
                'today' => $today,
                'total' => $total,
            ];
        });

            

        return view('admin_dashboard', 
            compact(
                'total_users',
                'totalBagSold',
                'prendingOrders'

            )
        );
    }
}
