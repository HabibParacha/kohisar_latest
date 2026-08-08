<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kohisar Feed Industries - Receiving Bill</title>

<style>
    @page {
        size: A4 landscape;
        margin: 0;
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    html, body {
        width: 100%;
        height: 100%;
        font-family: Arial, Helvetica, sans-serif;
        color: #111;
        background: #e5e5e5;
    }

    /* A4 Landscape */
    .a4-page {
        width: 297mm;
        height: 210mm;
        padding: 6mm 7mm;
        background: #fff;
        display: flex;
        gap: 5mm;
    }

    /* ========== VOUCHER ========== */
    .voucher {
        position: relative;
        width: calc((100% - 5mm) / 2);
        height: 198mm;
        border: 0.45mm solid #333;
        padding: 4mm 4mm 3mm;
        background: #fff;
        overflow: hidden;
    }

    /* Dashed separator between copies */
    .voucher:not(:last-child)::after {
        content: "";
        position: absolute;
        right: -2.7mm;
        top: 0;
        height: 100%;
        border-right: 0.35mm dashed #555;
    }

    /* Copy Label */
    .copy-label {
        position: absolute;
        top: 2.5mm;
        right: 3mm;
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
        padding-bottom: 2mm;
        border-bottom: 0.35mm solid #444;
        margin-bottom: 2.5mm;
    }

    .logo-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 2.5mm;
    }

    .logo {
        width: 9mm;
        height: 7.5mm;
        border: 0.7mm solid #193d7a;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2.8mm;
        font-weight: 700;
        color: #193d7a;
        flex-shrink: 0;
    }

    .company-info {
        text-align: left;
    }

    .company {
        font-size: 5.2mm;
        font-weight: 700;
        color: #193d7a;
        letter-spacing: -0.2mm;
    }

    .address {
        font-size: 2.1mm;
        margin-top: 0.6mm;
        color: #333;
        line-height: 1.35;
    }

    /* Title */
    .title {
        text-align: center;
        font-size: 4mm;
        font-weight: 700;
        letter-spacing: 0.8mm;
        border: 0.4mm solid #222;
        padding: 1.2mm 6mm;
        margin: 0 auto 3mm;
        width: fit-content;
        background: #f8f8f8;
    }

    /* Top Info */
    .top-info {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4mm;
        margin-bottom: 3mm;
        font-size: 2.6mm;
    }

    .field {
        display: flex;
        align-items: flex-end;
        gap: 1.5mm;
    }

    .field span {
        white-space: nowrap;
        font-weight: 600;
        padding-bottom: 0.8mm;
    }

    .line {
        flex: 1;
        border-bottom: 0.3mm solid #444;
        min-height: 5mm;
        padding: 0 1mm 0.4mm;
        font-size: 2.7mm;
        outline: none;
    }

    /* Form Table */
    .form-table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        font-size: 2.55mm;
        margin-bottom: 3mm;
    }

    .form-table td {
        border: 0.3mm solid #444;
        padding: 0 2mm;
        height: 8.2mm;
        vertical-align: middle;
    }

    .form-table .label-en {
        width: 20%;
        font-weight: 600;
        background: #f7f7f7;
        text-align: left;
    }

    .form-table .label-ur {
        width: 20%;
        font-weight: 500;
        background: #f7f7f7;
        text-align: center;
        font-size:14px;
        color: #333;
        text-align: center;
    }

    .form-table .value {
        width: 60%;
        outline: none;
        padding-left: 2.5mm;
    }
    .urdu {
        font-size: 2.3mm;
        color: #444;
        margin-left: 1.5mm;
        font-weight: 500;
        text-align: right;
    }

    /* Bottom Fields */
    .bottom-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4mm;
        margin-bottom: 2.5mm;
        font-size: 2.45mm;
    }

    .b-field {
        display: flex;
        align-items: flex-end;
        gap: 1.5mm;
    }

    .b-field span {
        white-space: nowrap;
        font-weight: 600;
        padding-bottom: 0.6mm;
    }

    .b-line {
        flex: 1;
        border-bottom: 0.3mm solid #444;
        min-height: 5.5mm;
        padding: 0 1mm 0.3mm;
        outline: none;
        font-size: 2.5mm;
        text-align: center;
    }

    /* Footer */
    .footer {
        position: absolute;
        left: 4mm;
        right: 4mm;
        bottom: 2.5mm;
        text-align: center;
        font-size: 1.9mm;
        color: #666;
    }

    /* Print */
    @media print {
        html, body {
            width: 297mm;
            height: 210mm;
            background: white;
        }

        .a4-page {
            width: 297mm;
            height: 210mm;
            padding: 6mm 7mm;
        }

        .voucher {
            break-inside: avoid;
            page-break-inside: avoid;
        }
    }
</style>
</head>
<body>

<div class="a4-page">

    <!-- DRIVER COPY -->
    @include('purchase_orders._voucher', [
        'copy' => 'DRIVER COPY',
        'invoice' => $data,
        'bag' => $bag
    ])

    <!-- OFFICE COPY -->
    @include('purchase_orders._voucher', [
        'copy' => 'OFFICE COPY',
        'invoice' => $data,
        'bag' => $bag
    ])

</div>

</body>
</html>