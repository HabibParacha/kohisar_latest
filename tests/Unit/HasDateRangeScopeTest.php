<?php

namespace Tests\Unit;

use App\Models\InvoiceMaster;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Tests\TestCase;

class HasDateRangeScopeTest extends TestCase
{
    public function test_within_dates_filters_on_the_date_column()
    {
        $query = InvoiceMaster::withinDates('2026-09-23', '2026-11-22');

        $this->assertStringContainsString('`invoice_master`.`date` between ? and ?', $query->toSql());
        $this->assertSame(['2026-09-23', '2026-11-22'], $query->getBindings());
    }

    public function test_within_request_dates_defaults_to_last_60_days()
    {
        Carbon::setTestNow('2026-11-22');

        $query = InvoiceMaster::withinRequestDates(new Request(), 60);

        $this->assertSame(['2026-09-23', '2026-11-22'], $query->getBindings());
        Carbon::setTestNow();
    }

    public function test_within_request_dates_uses_dates_from_request()
    {
        $request = new Request(['start_date' => '2025-01-01', 'end_date' => '2025-03-31']);

        $this->assertSame(['2025-01-01', '2025-03-31'], InvoiceMaster::withinRequestDates($request, 60)->getBindings());
    }
}
