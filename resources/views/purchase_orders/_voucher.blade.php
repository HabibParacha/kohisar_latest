<div class="voucher">

    <!-- Copy Label -->
    <div class="copy-label">{{ $copy }}</div>

    <!-- Header -->
    <div class="header">
        <div class="logo-row">
            <div class="logo">KFI</div>
            <div class="company-info">
                <div class="company">KOHISAR Feed Industries</div>
                <div class="address">
                    Plot # 43, Phase III, Industrial Estate, Hattar  
                    Ph: 0995-617362, 617363
                </div>
            </div>
        </div>
    </div>

    <!-- Title -->
    <div class="title">RECEIVING BILL</div>

    <!-- Voucher No + Date -->
    <div class="top-info">
        <div class="field">
            <span>Voucher No.</span>
            <div class="line" contenteditable="true" s  tyle="text-align: center;">{{ $invoice->invoice_no ?? '' }}</div>
        </div>
        <div class="field">
            <span>Date</span>
            <div class="line" contenteditable="true" style="text-align: center;">
                {{ isset($invoice->date) ? date('d / m / Y', strtotime($invoice->date)) : '' }}
            </div>
        </div>
    </div>

    <!-- Form Table -->
   <table class="form-table">
    <tr>
        <td class="label-en">Sender's Name</td>
        <td class="label-ur">بھیجنے والا</td>
        <td class="value" contenteditable="true">{{ $invoice->party->business_name ?? '' }}</td>
    </tr>
    <tr>
        <td class="label-en">Item</td>
        <td class="label-ur">مال</td>
        <td class="value" contenteditable="true">
            @foreach($invoice->invoiceDetails as $detail)
                {{ $detail->item->name ?? ' ' }} 
            @endforeach

        </td>
    </tr>
    <tr>
        <td class="label-en">Vehicle #</td>
        <td class="label-ur">گاڑی نمبر</td>
        <td class="value" contenteditable="true">{{ $invoice->vehicle_no ?? '' }}</td>
    </tr>
    <tr>
        <td class="label-en">Time In</td>
        <td class="label-ur">وقت داخل</td>
        <td class="value" contenteditable="true">{{ $invoice->time_in ?? '' }}</td>
    </tr>
    <tr>
        <td class="label-en">Time Out</td>
        <td class="label-ur">وقت خارج</td>
        <td class="value" contenteditable="true">{{ $invoice->time_out ?? '' }}</td>
    </tr>
    <tr>
        <td class="label-en">No. of Bags</td>
        <td class="label-ur">تعداد بیگ</td>
        <td class="value" contenteditable="true">{{ number_format($invoice->total_bags,2) }}</td>
    </tr>
    <tr>
        <td class="label-en">Gross Weight</td>
        <td class="label-ur">کل وزن</td>
        <td class="value" contenteditable="true">{{ number_format($invoice->invoiceDetails->sum('gross_weight'),2) }}</td>
    </tr>
    <tr>
        <td class="label-en">Cutting</td>
        <td class="label-ur">کٹنگ</td>
        <td class="value" contenteditable="true">{{ $invoice->cutting ?? '' }}</td>
    </tr>
    <tr>
        <td class="label-en">Bag's Weight</td>
        <td class="label-ur">بیگ کا وزن</td>
        <td class="value" contenteditable="true">{{ $bag->gross_weight ?? '' }}</td>
    </tr>
    <tr>
        <td class="label-en">Net Weight</td>
        <td class="label-ur">صاف وزن</td>
        <td class="value" contenteditable="true">{{ $bag->net_weight ?? '' }}</td>
    </tr>
</table>

    <!-- Bottom Fields -->
    <div class="bottom-row">
        <div class="b-field">
            <span>Type of Bag:</span>
            <div class="b-line" contenteditable="true">{{ $bag->item->name ?? '' }}</div>
        </div>
        <div class="b-field">
            <span>Scale Operator:</span>
            <div class="b-line" contenteditable="true">{{ $invoice->sale_operator ?? '' }}</div>
        </div>
    </div>

    <div class="bottom-row">
        <div class="b-field">
            <span>Received by:</span>
            <div class="b-line" contenteditable="true"></div>
        </div>
        <div class="b-field">
            <span>Checked by:</span>
            <div class="b-line" contenteditable="true"></div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">KOHISAR Feed Industries — Receiving Bill</div>
</div>