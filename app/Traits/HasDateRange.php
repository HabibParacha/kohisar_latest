<?php

namespace App\Traits;

use App\Support\DateRange;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;

/**
 * Date filtering for any model that has a `date` column.
 *
 *   InvoiceMaster::withinDates('2026-01-01', '2026-01-31')   // exact dates
 *   InvoiceMaster::withinRequestDates($request, 60)          // user's dates, or last 60 days
 *
 * To use a different column, set `protected $dateRangeColumn = 'start_date';` on the model.
 * The default range rule lives in App\Support\DateRange, not here.
 */
trait HasDateRange
{
    public function scopeWithinDates(Builder $query, string $start, string $end): Builder
    {
        $column = $this->dateRangeColumn ?? 'date';

        return $query->whereBetween($this->qualifyColumn($column), [$start, $end]);
    }

    public function scopeWithinRequestDates(Builder $query, Request $request, int $days): Builder
    {
        return $this->scopeWithinDates($query, ...DateRange::fromRequest($request, $days));
    }
}
