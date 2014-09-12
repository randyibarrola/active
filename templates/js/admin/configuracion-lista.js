$(initConfig);

function initConfig() {
    $('#table_configs').dataTable({
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
                'aTargets': [0, 3]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            
            $(nRow).find('a.delete').off('click').on('click', function(e){
                e.preventDefault();
                id = $(this).attr('config-id');
                $('#idEliminar').val(id);
                $('#eliminar_modal').modal();
                eliminar();
            });
            
        }
    });

    jQuery('#table_configs .group-checkable').change(function () {
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

    jQuery('#table_configs_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_configs_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_configs_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}

function eliminar() {
    $('#aceptarEliminar').off().click(function(e){
        
        e.preventDefault();
        id = $('#idEliminar').val();
        $('#eliminar_modal').modal('toggle');
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-configuracion',
            data: {id:id, action:'eliminar'},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                    setTimeout(function(){
                        window.location = BASE_URL + '/admin-configuracion-lista?c=' + new Date().getTime();
                    }, 3000);
                } else {
                    toastr.error(response.data);
                }
            }
        });
    })
}


