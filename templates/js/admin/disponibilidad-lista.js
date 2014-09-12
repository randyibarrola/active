$(initListaDisponibilidad);

function initListaDisponibilidad() {
    tableDisponibilidad();
}


var table = false;
function tableDisponibilidad() {
    table = $('#table_busquedas').dataTable({
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
                'aTargets': [4]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            
            $(nRow).find('td.centered').html('');
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-disponibilidad',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "buscar" } );
            
        },
        "aoColumns": [
            { "mData": "hotel"},
            { "mData": "tiempo_creacion"},
            { "mData": "inicio"},
            { "mData": "fin"},
            { "mData": "id", "sClass": "centered" }
        ]
    });
    
    jQuery('#table_busquedas_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_busquedas_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_busquedas_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
}

