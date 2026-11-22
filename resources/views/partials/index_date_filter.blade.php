{{-- Date range filter for index pages. Needs $defaultStartDate and $defaultEndDate. --}}
<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-md-3">
                <div class="mb-3">
                    <label class="form-label">Start Date</label>
                    <div class="input-group">
                        <div class="input-group-text"><span class="bx bx-calendar"></span></div>
                        <input type="date" name="start_date" id="start_date" class="form-control" value="{{ $defaultStartDate }}">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="mb-3">
                    <label class="form-label">End Date</label>
                    <div class="input-group">
                        <div class="input-group-text"><span class="bx bx-calendar"></span></div>
                        <input type="date" name="end_date" id="end_date" class="form-control" value="{{ $defaultEndDate }}">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <button type="button" class="btn btn-danger mt-4" id="filter-btn">
                    <i class="mdi mdi-filter"></i> Filter
                </button>
                <button type="button" class="btn btn-primary mt-4" id="reset-filter-btn">
                    <i class="fas fa-sync-alt"></i> Reset
                </button>
            </div>
        </div>
    </div>
</div>
