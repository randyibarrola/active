$(initValidar);

function initValidar() {
    tableReservas();
    $('#table_reservas input[type=checkbox]').prop('checked', true).change();
    $('form.validation-form').submit(function(e){
        e.preventDefault();
        $.ajax({
        url: BASE_URL + '/admin-ajax-validar',
        data: $(this).serialize(),
        type: 'post',
        dataType: 'json',
        success: function(response){
            table.fnDestroy();
            $('#table_reservas tbody').html(response.html);
            tableReservas();
            if(response.msg == 'ok') {
                window.location = BASE_URL + '/admin-login';
            }
        }});
    });
}

var table = false;
function tableReservas() {
    table = $('#table_reservas').dataTable({
        "aLengthMenu": [
            [100, 150, 200, -1],
            [100, 150, 200, "All"]
        ],
        // set the initial value
        "iDisplayLength": 100,
        "sPaginationType": "bootstrap",
        "oLanguage": {
            "sLengthMenu": "_MENU_ records",
            "oPaginate": {
                "sPrevious": "Prev",
                "sNext": "Next"
            }
        },
        "aoColumnDefs": [{
                'bSortable': false,
                'aTargets': [0]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            
            $(nRow).find('input[type=checkbox]').uniform().change(function(e){
                tr = $(this).parents('tr');
                tr.find('td.estado').html(($(this).prop('checked')) ? 'Stayed' : 'No Show');
            });
            
            $(nRow).find('td.importe input').off().change(function(){
                price = parseFloat($(this).val());
                comisionSpan = $(this).parent().parent().find('td.comision span');
                comision = parseFloat(comisionSpan.attr('comision')) * price / 100;
                comisionSpan.html(comision.toFixed(2));
                table.fnDestroy();
                $(this).parent().find('p').removeClass('hidden');
                tableReservas();
            }).autoNumeric('init', {aSep: '', aDec: '.'});
            
        },
        "bRetrieve": true,
        "bDestroy": true
    });
    $('#table_reservas tbody .checkboxes').uniform();
    jQuery('#table_reservas .group-checkable').change(function () {
        var set = jQuery(this).attr("data-set");
        var checked = jQuery(this).is(":checked");
        jQuery(set).each(function () {
            if (checked) {
                $(this).prop("checked", true).change();
            } else {
                $(this).prop("checked", false).change();
            }
        });
        jQuery.uniform.update(set);
    });

    jQuery('#table_reservas_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_reservas_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_reservas_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}


