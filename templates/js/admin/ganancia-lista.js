$(initGanancia);
tabla = false;
function initGanancia() {
    if(tabla) {
        tabla.fnDestroy();
        $('#table_ganancias tbody').html('');
    }
    tabla = $('#table_ganancias').dataTable({
        "aaSorting": [[ 4, "desc" ]],
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
            action = "<a href='" + BASE_URL + "/admin-ganancia-gestion/id:" + aData.id + "' title='Editar'><span class='fa fa-pencil'></span></a>";
            $(nRow).find('td.centered').html(action);
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-ganancia',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "buscar" } );
            
        },
        "aoColumns": [
            { "mData": "localizador", "sClass": "localizador" },
            { "mData": "hotel"},
            { "mData": "fecha_inicio"},
            { "mData": "fecha_final" },
            { "mData": "tiempo_creacion" },
            { "mData": "porcentaje" },
            { "mData": "comision" },
            { "mData": "estado" }
        ]
    });

    
    jQuery('#table_ganancias_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_ganancias_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_ganancias_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}
