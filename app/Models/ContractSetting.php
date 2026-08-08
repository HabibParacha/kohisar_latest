<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContractSetting extends Model
{
    use HasFactory;

    protected $fillable = [
        'coa_payable_id',
        'coa_expense_dr_id',
        'coa_expense_cr_id',
        'unloading',
        'loading',
        'bag_cutting',
        'wanda_production',
        'unload_refill',
        'packing',
        'shifting',
    ];

    // ── Relationships ────────────────────────────────────────────────────────────

    public function coaPayable()
    {
        return $this->belongsTo(ChartOfAccount::class, 'coa_payable_id');
    }

    public function coaExpenseDr()
    {
        return $this->belongsTo(ChartOfAccount::class, 'coa_expense_dr_id');
    }

    public function coaExpenseCr()
    {
        return $this->belongsTo(ChartOfAccount::class, 'coa_expense_cr_id');
    }
}
