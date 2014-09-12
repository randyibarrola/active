$(initHotel);

function initHotel() {
    $('#table_hoteles').dataTable({
        "aLengthMenu": [
            [20, 50, 100, -1],
            [20, 50, 100, "All"]
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
                'aTargets': [1, 2, 3]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            action = "<a href='" + BASE_URL + "/admin-seo-gestion/id:" + aData.id + "' title='Editar seo'><span class='fa fa-pencil'></span></a>";
            $(nRow).find('td.centered').html(action);
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-hotel',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "filtrarPorDestino" } );
            aoData.push( { "name": "table", "value": true } );
            
        },
        "aoColumns": [
            { "mData": "nombre", "sClass": "nombre" },
            { "mData": "dominio", "sClass": "dominios" },
            { "mData": "clave_google_analytics", "sClass": "clave" },
            { "mData": "id", "sClass": "centered" }
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

function eliminar() {
    $('#aceptarEliminar').off().click(function(e){
        
        e.preventDefault();
        id = $('#idEliminar').val();
        $('#eliminar_modal').modal('toggle');
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-hotel',
            data: {id:id, action:'eliminar'},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                    setTimeout(function(){
                        window.location = BASE_URL + '/admin-hotel-lista?c=' + new Date().getTime();
                    }, 3000);
                } else {
                    toastr.error(response.data);
                }
            }
        });
    })
}


