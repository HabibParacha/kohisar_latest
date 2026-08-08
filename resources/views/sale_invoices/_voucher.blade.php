<div class="voucher">

    <!-- Copy Label -->
    <div class="copy-label">{{ $copy }}</div>

    <!-- Header -->
    <div class="header">
        <div class="logo-row">
            <div class="logo">KFI</div>
            <div class="company">KOHISAR Feed Industries</div>
        </div>
        <div class="address">
            Plot # 43, Phase III, Industrial Estate, Hattar &nbsp;|&nbsp; Ph: 0995-617362, 617363
        </div>
    </div>

    <!-- Title -->
    <div class="title">GATE PASS</div>

    <!-- Info Row -->
    <div class="info-row">
        <div class="field">
            <span>Voucher No.</span>
            <div class="line" contenteditable="true">{{ $invoice->invoice_no }}</div>
        </div>
        <div class="field">
            <span>Date</span>
            <div class="line" contenteditable="true">
                {{ date('d / m / Y', strtotime($invoice->date)) }}
            </div>
        </div>
    </div>

    <!-- To / Area -->
    <div class="info-row">
        <div class="field">
            <span>To</span>
            <div class="line" contenteditable="true">
                {{ $invoice->party->business_name ?? '' }}
            </div>
        </div>
        <div class="field">
            <span>Area</span>
            <div class="line" contenteditable="true">
                {{ $invoice->partyWarehouse->name ?? '' }}
            </div>
        </div>
    </div>

    <!-- Contact person -->
    <div class="info-row">
        <div class="field">
            <span>Contact Person</span>
            <div class="line" contenteditable="true">
                {{ $invoice->contact_person ?? '' }}
            </div>
        </div>
        <div class="field">
            <span>Phone</span>
            <div class="line" contenteditable="true">
                {{ $invoice->contact_person_phone ?? '' }}
            </div>
        </div>
    </div>

    <!-- Items -->
    <div class="section-title">Items / Description</div>

    <table>
        <thead>
            <tr>
                <th class="sr">Sr.</th>
                <th class="desc">Description</th>
                <th class="qty">Quantity</th>
            </tr>
        </thead>
        <tbody>
            @foreach($invoice->invoiceDetails as $row)
                <tr>
                    <td class="sr">{{ $loop->iteration }}</td>
                    <td class="desc">
                        <div contenteditable="true">{{ $row->item->name }}</div>
                    </td>
                    <td class="qty">
                        <div contenteditable="true">{{ $row->total_quantity }}</div>
                    </td>
                </tr>
            @endforeach

            {{-- Empty rows if needed (optional) --}}
            @for($i = $invoice->invoiceDetails->count(); $i < 6; $i++)
                <tr>
                    <td class="sr"></td>
                    <td class="desc"><div contenteditable="true"></div></td>
                    <td class="qty"><div contenteditable="true"></div></td>
                </tr>
            @endfor

             <tr>
                    <td class="sr"></td>
                    <td class="desc" style="text-align: right;font-size: 14px"><b contenteditable="true" >TOTAL</b></td>
                    <td class="qty" style="text-align: center;font-size: 14px"><b contenteditable="true">{{ $invoice->invoiceDetails->sum('total_quantity') }} Bags</b></td>
                </tr>
        </tbody>
    </table>

    <!-- Bottom Fields - INLINE -->
    <div class="bottom">
        <div class="b-field">
            <b>Vehicle No.</b>
            <div class="b-line" contenteditable="true">{{ $invoice->vehicle_no }}</div>
        </div>
        <div class="b-field">
            <b>Issued by</b>
            <div class="b-line" contenteditable="true"> {{ auth()->user()->name ?? '' }}</div>
        </div>
        <div class="b-field">
            <b>Received by</b>
            <div class="b-line" contenteditable="true"></div>
        </div>
        <div class="b-field">
            <b>Checked by</b>
            <div class="b-line" contenteditable="true"></div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">KOHISAR Feed Industries — Gate Pass</div>
</div>