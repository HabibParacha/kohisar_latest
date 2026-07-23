<tr>
    <td colspan="9" class="text-start fw-bold bg-warning text-dark">Bill Receipts</td>
</tr>
@forelse ($receipts as $receipt)
    @php
        $totalBags = $receipt->invoiceDetails[0]->total_quantity;
        $totalWeight = $receipt->invoiceDetails[0]->after_cut_total_weight;
        $totalPrice = $receipt->invoiceDetails[0]->total_price;

        $rate = ($totalPrice / $totalWeight) * 40;
    @endphp
    <tr>
        <td>{{ date('d-m-Y', strtotime($receipt->date)) }}</td>
        <td>{{ $receipt->reference_no }}</td>
        <td>{{ $receipt->party->business_name ?? 'N/A' }}</td>
        <td>{{ $receipt->invoiceDetails[0]->item->name }}</td>
        <td>{{ $receipt->vehicle_no }}</td>
        <td class="text-end">{{ $totalBags }}</td>
        <td class="text-end">{{ $totalWeight }}</td>
        <td class="text-end"> {{ $rate }}</td>
        <td class="text-end">{{ $receipt->shipping }}</td>
    </tr>


@empty
    <tr>
        <td colspan="9" class="text-center">No records found.</td>
    </tr>
@endforelse
