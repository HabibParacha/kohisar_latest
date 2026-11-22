{{-- Wires the date filter to a DataTable held in the JS variable `table`. --}}
            $('#filter-btn').on('click', function() {
                table.draw();
            });
            $('#reset-filter-btn').on('click', function() {
                $('#start_date').val('{{ $defaultStartDate }}');
                $('#end_date').val('{{ $defaultEndDate }}');
                table.draw();
            });
            $('#start_date').on('change', function() {
                let startDate = $(this).val();
                let endDate = $('#end_date').val();
                if (!endDate || endDate < startDate) {
                    $('#end_date').val(startDate);
                }
                $('#end_date').attr('min', startDate);
            });
