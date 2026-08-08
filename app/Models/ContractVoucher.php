<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContractVoucher extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'voucher_number',
        'expense_coa_dr_id',
        'coa_payable_cr_id',
        'unloading_rate',
        'unloading_bags',
        'loading_rate',
        'loading_bags',
        'bag_cutting_rate',
        'bag_cutting_bags',
        'wanda_production_rate',
        'wanda_production_bags',
        'unload_refill_rate',
        'unload_refill_bags',
        'packing_rate',
        'packing_bags',
        'shifting_rate',
        'shifting_bags',
        'total_bags',
        'total_amount',
        'created_by',
        'updated_by',
    ];

    // ── Relationships ────────────────────────────────────────────────────────────

    public function expenseCoaDr()
    {
        return $this->belongsTo(ChartOfAccount::class, 'expense_coa_dr_id');
    }

    public function payableCoaCr()
    {
        return $this->belongsTo(ChartOfAccount::class, 'coa_payable_cr_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}
