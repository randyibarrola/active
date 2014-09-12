$(initFacturas);

var table = false;

function initFacturas() {
    initTableFacturas();
    
}

function initTableFacturas() {
        
    table = $('#table_facturas').dataTable({
        "aaSorting": [[ 3, "desc" ]],
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
                'aTargets': [1, 5]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            var actions = '<a class="" target="_blank" href="' + aData.url + '"><span class="fa fa-eye"></span></a>';
            //actions += '&nbsp;&nbsp;<a class="sendEmail" href="javascript:void(0)" factura="' + aData.id + '"><span class="fa fa-info-circle"></span></a>';
            $(nRow).find('td.centered').html(actions);
            estadoHtml = '<label class="estado">' + aData.estado + '</label>';
            /*
            estadoHtml = '<select class="form-control" name="factura[' + aData.id + '][estado]">';
            estadoHtml += '<option ' + ((aData.estado == 'pendiente de cobro') ? 'selected' : '') + '>pendiente de cobro</option>';
            estadoHtml += '<option ' + ((aData.estado == 'cobrado') ? 'selected' : '') + '>cobrado</option>';
            estadoHtml += '<option ' + ((aData.estado == 'cancelada') ? 'selected' : '') + '>cancelada</option>';
            estadoHtml += '</select>';*/
            $(nRow).find('td.estado').html(estadoHtml);
            
            $(nRow).find('label.estado').off().click(function(e){
                $(this).hide();
                showSelectEstado(aData.id, $(this));
            })
            $(nRow).find('a.sendEmail').click(function(e){
                e.preventDefault();
                var idFactura = $(this).attr('factura');
                $('#blocker').fadeIn();
                $.ajax({
                    url: BASE_URL + '/admin-ajax-factura',
                    data: {action: 'enviarLink', idFactura: idFactura},
                    type: 'post',
                    dataType: 'json',
                    success: function(response) {
                        $('#blocker').fadeOut();
                        if(response.msg == 'ok') {
                            toastr.success(response.data);
                        } else {
                            toastr.error(response.data);
                        }
                    }
                });
            })
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-factura',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "filtrar" } );
            
        },
        "aoColumns": [
            { "mData": "numero" },
            { "mData": "cliente" },
            { "mData": "clienteNombre"},
            { "mData": "tiempoCreacion"},
            { "mData": "total" },
            { "mData": "comision"},
            { "mData": "estado", "sClass" : "estado" },
            { "mData": "url", "sClass": "centered" }
        ]
    });

    $('#table_facturas input[type=checkbox]').uniform('update');
    jQuery('#table_facturas .group-checkable').change(function () {
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

    jQuery('#table_facturas_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_facturas_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_facturas_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

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
                    table.fnDraw(false);
                } else {
                    toastr.error(response.data);
                }
            }
        });
    })
}

function filtrarPorDestino() {
        /*
        destinoId = $('input[name=destinoId]').val();
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-hotel',
            data: {action:'filtrarPorDestino', id:destinoId},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                table.fnDestroy();
                $('#table_hoteles tbody').html('');
                $('#table_hoteles tbody').html(response.html);
                initTableHotel();
            }
        })*/
        table.fnDestroy();
                $('#table_hoteles tbody').html('');
                initTableHotel();
}

function showSelectEstado(id, label) {
    estadoHtml = '<select class="form-control" name="factura[' + id + '][estado]">';
    estadoHtml += '<option ' + ((label.html() == 'pendiente de cobro') ? 'selected' : '') + '>pendiente de cobro</option>';
    estadoHtml += '<option ' + ((label.html() == 'cobrado') ? 'selected' : '') + '>cobrado</option>';
    estadoHtml += '<option ' + ((label.html() == 'cancelada') ? 'selected' : '') + '>cancelada</option>';
    estadoHtml += '</select>';
    label.parent().append(estadoHtml);
    label.parent().find('select').change(function(){
        $.ajax({
            url: BASE_URL + '/admin-ajax-factura',
            data: {action: 'cambiarEstado', id: id, estado: $(this).val()},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                    table.fnDraw();
                } else {
                    toastr.error(response.data);
                }
            }
        })
    });
}




