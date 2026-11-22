# Project Changes & How Things Work

A plain-English record of changes made to Kohisar: **what** changed, **where**, and **how it works**.
Newest entries at the top. Add a new section for every feature or refactor.

---

## 2026-11-22 — Default 60-day filter + 25 rows on index pages

**Branch:** `adding-date-filters`

### Why
Index pages loaded every record ever saved, which got slower as data grew.
Now they show only recent data by default.

### What the user sees
| Page | Date filter | Default range | Rows per page |
|------|-------------|---------------|---------------|
| Production | Already existed | Last 60 days (pre-filled) | 25 |
| Sale Invoice | **New** (Start / End / Filter / Reset) | Last 60 days | 25 |
| Purchase Order (really Purchase Receipt) | **New** | Last 60 days | 25 |
| Recipe | Not added (on purpose) | — | 25 |

- The Start/End date boxes are filled in when the page opens, so the user can see the range.
- **Reset** returns to the last 60 days. It does not clear the boxes.
- To see older data, change the Start Date and click **Filter**.

### How it works (request flow)
```
Browser (index page)
  └─ DataTables sends start_date / end_date with every AJAX call
       └─ Controller index()
            └─ InvoiceMaster::withinRequestDates($request, 60)      (scope in HasDateRange trait)
                 ├─ DateRange::fromRequest($request, 60) → [start, end]  (last 60 days if empty)
                 └─ withinDates(start, end) → WHERE invoice_master.date BETWEEN ...
```

### Files
| File | Role |
|------|------|
| `app/Support/DateRange.php` | **Helper.** Calculates dates only. `lastDays($days)` and `fromRequest($request, $days)`. The number of days is always passed by the caller; there is no hidden default. |
| `app/Traits/HasDateRange.php` | **Reusable trait.** Adds two scopes to any model: `->withinDates($start, $end)` for exact dates, and `->withinRequestDates($request, $days)` for the user's dates, or the last `$days` days if none were picked. The date rule stays in `DateRange`; the trait only calls it. Uses the `date` column; a model can set `$dateRangeColumn` to use another column. |
| `app/Models/InvoiceMaster.php` | Uses the `HasDateRange` trait. |
| `ProductionController`, `SaleInvoiceController`, `PurchaseOrderController` | `index()` calls `withinRequestDates($request, 60)`, passes `DateRange::lastDays(60)` to the view, eager-loads relations (`recipe`, `party`), and passes `$defaultStartDate` / `$defaultEndDate` to the view. |
| `resources/views/partials/index_date_filter.blade.php` | Shared filter HTML (date boxes + buttons). |
| `resources/views/partials/index_date_filter_js.blade.php` | Shared filter JS (Filter / Reset / end-date ≥ start-date). Needs a JS variable named `table`. |
| `resources/views/{productions,sale_invoices,purchase_orders,recipes}/index.blade.php` | `pageLength: 25`. The ajax call sends the dates. |
| `tests/Unit/DateRangeTest.php`, `tests/Unit/HasDateRangeScopeTest.php` | Unit tests (no database needed). |

### Add the same filter to another page
1. Model: `use HasDateRange;` (and `protected $dateRangeColumn = '...';` if the column isn't `date`).
2. Controller `index()`: `->withinRequestDates($request, 60)`, and pass `DateRange::lastDays(60)` to the view as `$defaultStartDate`, `$defaultEndDate`.
3. View: `@include('partials.index_date_filter')` above the table. In the DataTable, send `start_date` / `end_date` in `ajax.data` and add `pageLength: 25`. After the table is created, `@include('partials.index_date_filter_js')`.

### Known limitations
- The controllers still call `->get()` before passing data to DataTables, so all rows in the 60-day range are loaded and then paged in PHP. Moving fully to server-side paging would need `filterColumn()` for the computed columns (`party_business_name`, etc.).
- There are no Feature tests for these endpoints: `phpunit.xml` points at the real MySQL database, so `RefreshDatabase` would wipe data. Switch tests to SQLite first.

---

## Code organisation guide (where things go)

| Kind of code | Folder | Example |
|--------------|--------|---------|
| Business process (writes several tables, transactions) | `app/Services/` | Posting a production, invoice journals |
| Small calculation helper, no database | `app/Support/` | `DateRange` |
| Repeated query condition on one model | Local scope on the model | `scopeWithinDates` |
| Same scope on many models | Trait in `app/Traits/` | `HasDateRange` |
| Checking request input | Form Request in `app/Http/Requests/` | — |
