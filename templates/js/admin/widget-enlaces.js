$(initWidget);
table = false;
function initWidget() {
    table = $('#table_widgets').dataTable({
        "aLengthMenu": [
            [100, 150, 200, -1],
            [100, 150, 200, "All"]
        ],
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
                'aTargets': [0, 1]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
        
        },
        "bRetrieve": true,
        "bDestroy": true
    });
    jQuery('#table_widgets_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_widgets_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_widgets_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
}