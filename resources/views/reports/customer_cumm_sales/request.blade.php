@extends('template.tmp')

@section('title', 'Kohisar')

@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
        <div class="card">
            <form action="{{ route('sale-report.customerCummulativeSalesShow') }}" method="get" target="_blank">

                <div class="card-body">
                    <h4 class="card-title">Customer Cummulative Sales Report</h4>

                    <div class="col-md-12">
                        <div class="col-md-4 mt-3">
                            <div class="form-group">
                                <label for="StartDate">Start Date</label>
                                <input type="date" name="startDate"  id="StartDate" class="form-control" value="{{ now()->format('Y-m-01') }}" required>
                                <div id="start"></div>
                            </div>
                            <div class="form-group mt-2">
                                <label for="EndDate">End Date</label>
                                <input type="date" name="endDate" id="EndDate" value="{{ now()->format('Y-m-t') }}" class="form-control" required>
                                <div id="end"></div>
                            </div>
                            
                            <div class="form-group mt-2">
                                <label class="form-label">Customers</label>
                                <select name="party_id"  id="party_id" class="select2 form-control" style="width: 100%">                                                
                                    <option value="">Choose...</option>
                                    @foreach ($customers as $customer)
                                        <option value="{{$customer->id}}">
                                            {{ $customer->id .'-'.$customer->business_name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            
                            
                            <button  class="btn btn-primary my-2" type="submit">Submit</button>

                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>        

@endsection