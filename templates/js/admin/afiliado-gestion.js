$(initUsuario);

function initUsuario() {
    $('#afiliadoForm').submit(function(e){
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
                            window.location = BASE_URL + '/admin-afiliado-lista';
                        }, 800);
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });   
    
    tabla_hoteles();
    tabla_productos();
}

function tabla_hoteles() {
    $('#table_hoteles').dataTable({
        "aLengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"]
        ],
        // set the initial value
        "iDisplayLength": 20,
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

    jQuery('#table_hoteles .group-checkable').change(function () {
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

    jQuery('#table_hoteles_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_hoteles_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_hoteles_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}


function tabla_productos() {
    $('#table_productos').dataTable({
        "aLengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"]
        ],
        // set the initial value
        "iDisplayLength": 20,
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

    jQuery('#table_productos .group-checkable').change(function () {
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

    jQuery('#table_productos_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_productos_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_productos_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}