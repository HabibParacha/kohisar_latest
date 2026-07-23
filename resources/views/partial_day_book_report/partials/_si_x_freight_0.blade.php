<tr>
    <td colspan="9" class="text-start fw-bold bg-success text-dark">Sale Invoices</td>
</tr>


@forelse ($saleInvoices_is_x_freight_0 as $invoice)

    @php    $flag = 0;  @endphp

    @foreach ($invoice->invoiceDetails as $detail)
        <tr>
            <td>{{ date('d-m-Y', strtotime($invoice->date)) }}</td>
            <td>{{ $invoice->reference_no }}</td>
            <td>{{ $invoice->party->business_name  ?? 'N/A' }} {{ $invoice->partyWarehouse->name ?? ' '   }}</td>
            <td>{{ $detail->item->name }}</td>
            <td>{{ $invoice->vehicle_no }}</td>
            <td class="text-end">{{ $detail->total_quantity }}</td>
            <td class="text-end"></td>
            <td class="text-end"></td>
            <td class="text-end">{{ $flag === 0 ? $invoice->shipping : '' }}</td>
        </tr>
        @php    $flag = 1;  @endphp
    @endforeach


@empty
    <tr>
        <td colspan="9" class="text-center">No records found.</td>
    </tr>
@endforelse
