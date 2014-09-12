$(initAdword);
tabla = false;
function initAdword() {
    if(tabla) {
        tabla.fnDestroy();
        $('#table_adwords tbody').html('');
    }
    tabla = $('#table_adwords').dataTable({
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
            action = "<a href='" + BASE_URL + "/admin-adword-gestion/id:" + aData.id + "' title='Editar'><span class='fa fa-pencil'></span></a>";
            $(nRow).find('td.centered').html(action);
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-adword',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "buscar" } );
            
        },
        "aoColumns": [
            { "mData": "nombre_campania", "sClass": "nombre" },
            { "mData": "presupuesto", "sClass": "presupuesto" },
            { "mData": "vigencia", "sClass": "vigencia" },
            { "mData": "id", "sClass": "centered" }
        ]
    });

    
    jQuery('#table_adwords_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_adwords_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_adwords_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}

function eliminar() {
    $('#aceptarEliminar').off().click(function(e){
        
        e.preventDefault();
        id = $('#idEliminar').val();
        $('#eliminar_modal').modal('toggle');
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-adword',
            data: {id:id, action:'eliminar'},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                    initAdword();
                } else {
                    toastr.error(response.data);
                }
            }
        });
    })
}


