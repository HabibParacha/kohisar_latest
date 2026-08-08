<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kohisar Feed Industries - Gate Pass</title>

<style>
    @page {
        size: A3 landscape;
        margin: 0;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
        width: 100%;
        height: 100%;
        font-family: Arial, Helvetica, sans-serif;
        color: #111;
        background: #e5e5e5;
    }

    /* A3 Landscape */
    .a3-page {
        width: 420mm;
        min-height: 297mm;
        padding: 6mm 7mm;
        background: #fff;
        display: flex;
        gap: 4mm;
        page-break-after: always;   /* forces new page when needed */
    }

    /* ========== VOUCHER ========== */
    .voucher {
        position: relative;
        width: calc((100% - 8mm) / 3);
        min-height: 285mm;          /* changed from fixed height */
        border: 0.4mm solid #333;
        padding: 3.5mm 3.5mm 2.5mm;
        background: #fff;
        overflow: visible;          /* allow content to grow */
    }

    /* Dashed separator */
    .voucher:not(:last-child)::after {
        content: "";
        position: absolute;
        right: -2.2mm;
        top: 0;
        height: 100%;
        border-right: 0.3mm dashed #666;
    }

    /* Copy Label */
    .copy-label {
        position: absolute;
        top: 2mm;
        right: 2.5mm;
        font-size: 3mm;
        font-weight: 700;
        border: 0.3mm solid #222;
        padding: 0.8mm 2.2mm;
        background: #fff;
        z-index: 2;
    }

    /* Header */
    .header {
        text-align: center;
        padding-bottom: 1.8mm;
        border-bottom: 0.35mm solid #444;
        margin-bottom: 2mm;
    }

    .logo-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 2mm;
        color: #193d7a;
    }

    .logo {
        width: 8.5mm;
        height: 6.5mm;
        border: 0.65mm solid #193d7a;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2.6mm;
        font-weight: 700;
    }

    .company {
        font-size: 5.8mm;
        font-weight: 700;
        letter-spacing: -0.25mm;
    }

    .address {
        font-size: 2.2mm;
        margin-top: 0.8mm;
        color: #333;
    }

    /* Title */
    .title {
        text-align: center;
        font-size: 3.8mm;
        font-weight: 700;
        letter-spacing: 0.6mm;
        border: 0.4mm solid #222;
        padding: 1mm 5mm;
        margin: 0 auto 2.5mm;
        width: fit-content;
    }

    /* Info rows */
    .info-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2.5mm;
        margin-bottom: 1.8mm;
        font-size: 2.5mm;
    }

    .field {
        display: flex;
        align-items: flex-end;
        gap: 1.2mm;
    }

    .field span {
        white-space: nowrap;
        font-weight: 600;
        padding-bottom: 0.8mm;
    }

    .line {
        flex: 1;
        border-bottom: 0.3mm solid #444;
        min-height: 4.8mm;
        padding: 0 1mm 0.5mm;
        font-size: 2.6mm;
        outline: none;
        text-align: center;
    }

    /* Section title */
    .section-title {
        font-size: 2.5mm;
        font-weight: 700;
        border: 0.3mm solid #333;
        border-bottom: none;
        padding: 1mm 2mm;
        background: #f5f5f5;
    }

    /* Table */
    table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        font-size: 2.45mm;
    }

    th, td {
        border: 0.3mm solid #444;
        vertical-align: middle;
    }

    th {
        height: 6.5mm;
        background: #eee;
        font-weight: 700;
        text-align: center;
    }

    td {
        height: 7.5mm;
        padding: 2mm;
        font-size: 12px;
        
    }

    .sr { width: 12%; text-align: center; }
    .desc { width: 58%; }
    .qty { width: 30%; text-align: center; }

    td div {
        width: 100%;
        height: 100%;
        outline: none;
    }

    .qty div { text-align: center; }

    /* Contact */
    .contact {
        border-left: 0.3mm solid #444;
        border-right: 0.3mm solid #444;
        border-bottom: 0.3mm solid #444;
        padding: 2.5mm 3mm;
        font-size: 2.6mm;
        min-height: 18mm;
    }

    .phone {
        text-align: center;
        font-size: 4.2mm;
        letter-spacing: 0.6mm;
        margin-top: 2.5mm;
        outline: none;
    }

    /* Total */
    .total-row {
        display: grid;
        grid-template-columns: 1fr 32%;
        border-left: 0.3mm solid #444;
        border-right: 0.3mm solid #444;
        border-bottom: 0.3mm solid #444;
        min-height: 11mm;
    }

    .total-label {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        padding-right: 3mm;
        font-size: 2.9mm;
        font-weight: 700;
    }

    .total-value {
        border-left: 0.3mm solid #444;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 3.8mm;
        font-weight: 700;
        outline: none;
    }

    /* Bottom fields - INLINE */
    .bottom {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 3.5mm 5mm;
        margin-top: 4mm;
    }

    .b-field {
        display: flex;
        align-items: flex-end;
        gap: 1.5mm;
        font-size: 2.45mm;
        min-height: 9mm;
    }

    .b-field b {
        white-space: nowrap;
        font-weight: 700;
        padding-bottom: 0.6mm;
    }

    .b-line {
        flex: 1;
        border-bottom: 0.3mm solid #444;
        min-height: 5.5mm;
        padding: 0 1mm 0.4mm;
        outline: none;
        font-size: 2.6mm;
        text-align: center;
    }

    /* Signatures */
    .signs {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4mm;
        margin-top: 3.5mm;
        margin-bottom: 6mm; /* space for footer */
    }

    .sign {
        height: 14mm;
        border: 0.3mm solid #777;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2.3mm;
        color: #555;
    }

    /* Footer */
    .footer {
        position: absolute;
        left: 3.5mm;
        right: 3.5mm;
        bottom: 2mm;
        text-align: center;
        font-size: 1.9mm;
        color: #666;
    }

    /* ========== PRINT RULES ========== */
    @media print {
        html, body {
            width: 420mm;
            background: white;
            height: auto !important;
        }

        .a3-page {
            width: 420mm;
            min-height: 297mm;
            padding: 6mm 7mm;
            page-break-after: always;
            break-after: page;
        }

        .voucher {
            min-height: 285mm;
            height: auto !important;
            overflow: visible !important;
            page-break-inside: avoid; /* keep one voucher together if possible */
        }

        /* Allow table to break across pages if extremely long */
        table {
            page-break-inside: auto;
        }

        tr {
            page-break-inside: avoid;
            page-break-after: auto;
        }
    }
</style>
</head>
<body>

<div class="a3-page">

    {{-- DRIVER COPY --}}
    @include('sale_invoices._voucher', [
        'copy' => 'DRIVER COPY',
        'invoice' => $invoice
    ])

    {{-- RECEIVER COPY --}}
    @include('sale_invoices._voucher', [
        'copy' => 'RECEIVER COPY',
        'invoice' => $invoice
    ])

    {{-- OFFICE COPY --}}
    @include('sale_invoices._voucher', [
        'copy' => 'OFFICE COPY',
        'invoice' => $invoice
    ])

</div>

</body>
</html>