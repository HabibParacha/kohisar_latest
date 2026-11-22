<?php

namespace Tests\Unit;

use App\Support\DateRange;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Tests\TestCase;

class DateRangeTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();
        Carbon::setTestNow('2026-11-22');
    }

    protected function tearDown(): void
    {
        Carbon::setTestNow();
        parent::tearDown();
    }

    public function test_defaults_to_last_60_days_when_no_dates_given()
    {
        $this->assertSame(['2026-09-23', '2026-11-22'], DateRange::fromRequest(new Request(), 60));
    }

    public function test_uses_dates_from_request()
    {
        $request = new Request(['start_date' => '2025-01-01', 'end_date' => '2025-03-31']);

        $this->assertSame(['2025-01-01', '2025-03-31'], DateRange::fromRequest($request, 60));
    }

    public function test_fills_missing_end_date_with_today()
    {
        $request = new Request(['start_date' => '2026-01-01']);

        $this->assertSame(['2026-01-01', '2026-11-22'], DateRange::fromRequest($request, 60));
    }
}
