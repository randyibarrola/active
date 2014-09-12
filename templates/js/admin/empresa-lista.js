$(initEmpresa);
var tabla = false;
function initEmpresa() {
    tabla = $('#table_empresas').dataTable({
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
                'aTargets': [0, 4]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            
            $(nRow).find('a.delete').off('click').on('click', function(e){
                e.preventDefault();
                id = $(this).attr('empresa-id');
                $('#idEliminar').val(id);
                $('#eliminar_modal').modal();
                eliminar();
            });
            
            $(nRow).find('input[type=text]').off().change(function(e){
                if($(this).val().trim().length > 0) {
                    $('#blocker').fadeIn();
                    $.ajax({
                        url: BASE_URL + '/admin-ajax-empresa',
                        data: $(this).serialize() + '&action=updatefields',
                        type: 'post',
                        dataType: 'json',
                        success: function(response) {
                            $('#blocker').fadeOut();
                            tabla.fnDestroy();
                            initEmpresa();
                        }
                    })
                }
            })
            
        },
        "bRetrieve": true,
        "bDestroy": true
    });

    jQuery('#table_empresas .group-checkable').change(function () {
        var set = jQuery(this).attr("data-set");
        var checked = jQuery(this).is(":checked");
        jQuery(set).each(function () {
            if (checked) {
                $(this).attr("checked", true);
            } else {
                $(this).attr("checked", false);
            }
        });
        jQuery.uniform.update(set);
    });

    jQuery('#table_empresas_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_empresas_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_empresas_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}


function eliminar() {
    $('#aceptarEliminar').off().click(function(e){
        
        e.preventDefault();
        id = $('#idEliminar').val();
        $('#eliminar_modal').modal('toggle');
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-empresa',
            data: {id:id, action:'eliminar'},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                    setTimeout(function(){
                        window.location = BASE_URL + '/admin-empresa-lista?c=' + new Date().getTime();
                    }, 3000);
                } else {
                    toastr.error(response.data);
                }
            }
        });
    })
}


