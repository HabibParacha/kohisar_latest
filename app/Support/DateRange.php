<?php

namespace App\Support;

use Illuminate\Http\Request;

/**
 * Small date-range helper. It only calculates dates and does not touch the database.
 * The caller always passes the number of days, e.g. DateRange::lastDays(60).
 */
class DateRange
{
    /**
     * Today back $days days, e.g. lastDays(60) => ['2026-09-23', '2026-11-22'].
     *
     * @return array{0: string, 1: string}
     */
    public static function lastDays(int $days): array
    {
        return [
            now()->subDays($days)->format('Y-m-d'),
            now()->format('Y-m-d'),
        ];
    }

    /**
     * Dates from the request (start_date / end_date).
     * A missing value falls back to today back $days days.
     *
     * @return array{0: string, 1: string}
     */
    public static function fromRequest(Request $request, int $days): array
    {
        [$defaultStart, $defaultEnd] = self::lastDays($days);

        return [
            $request->input('start_date') ?: $defaultStart,
            $request->input('end_date') ?: $defaultEnd,
        ];
    }
}
