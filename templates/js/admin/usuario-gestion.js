$(initUsuario);

function initUsuario() {
    $('#usuarioFrm').submit(function(e){
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        if(valid) {
            data = $(this).serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-usuario',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-usuario-lista';
                        }, 1500);
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });   
    
    tablaEmpresas();
}

function tablaEmpresas() {
    $('#table_empresas').dataTable({
        "aLengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"]
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
        ]
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