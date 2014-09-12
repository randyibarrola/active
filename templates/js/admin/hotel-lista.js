$(initHotel);

var table = false;

function initHotel() {
    initTableHotel();
    if($('input[name=destinoId]').val().trim().length > 0)
        filtrarPorDestino();
    autocomplete();
    $('input[name=destacados]').change(filtrarPorDestino);
}

function initTableHotel(idFavorito) {
        
    table = $('#table_hoteles').dataTable({
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
            
            $(nRow).find('td.centered').html(aData.acciones);
            
            $(nRow).find('td.nombre').html('<input type="text" name="edit[' + aData.id + '][nombre]" value="' + aData.nombre + '">');
            $(nRow).find('td.email').html('<input type="text" name="edit[' + aData.id + '][emailReservas]" value="' + aData.email_reservas + '">');
            $(nRow).find('td.telefono').html('<input type="text" name="edit[' + aData.id + '][telefonoReservas]" value="' + aData.telefono_reservas + '">');
            $(nRow).find('td.contrato').html('<span class="label label-success">' + aData.contrato + '</span>');
            
            $(nRow).find('a.delete').off('click').on('click', function(e){
                e.preventDefault();
                id = $(this).attr('hotel-id');
                $('#idEliminar').val(id);
                $('#eliminar_modal').modal();
                eliminar();
            });
            
            $(nRow).find('a.favorito').off('click').on('click', function(e){
                e.preventDefault();
                id = $(this).attr('hotel-id');
                $.ajax({
                    url: BASE_URL + '/admin-ajax-hotel',
                    data: {action: 'favorito', favoritoId: id},
                    type: 'post',
                    dataType: 'json',
                    success: function(){
                        table.fnDraw(false);
                    }
                })
                
                //initTableHotel(id);
            });
            
            $(nRow).find('input[type=text]').off().change(function(e){
                if($(this).val().trim().length > 0) {
                    $('#blocker').fadeIn();
                    $.ajax({
                        url: BASE_URL + '/admin-ajax-hotel',
                        data: $(this).serialize() + '&action=updatefields',
                        type: 'post',
                        dataType: 'json',
                        success: function(response) {
                            $('#blocker').fadeOut();
                            table.fnDraw(false);
                        }
                    })
                }
            })
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-hotel',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "filtrarPorDestino" } );
            if($('input[name=destinoId]').val().trim().length > 0)
                aoData.push( { "name": "id", "value": $('input[name=destinoId]').val() } );
            aoData.push( { "name": "table", "value": true } );
            if($('input[name=destacados]').prop('checked'))
                aoData.push( { "name": "findDestacados", "value": 1 } );
            if(idFavorito)
                aoData.push( { "name": "favoritoId", "value": idFavorito } );
        },
        "aoColumns": [
            { "mData": "nombre", "sClass": "nombre" },
            { "mData": "dominio", "sClass": "dominios" },
            { "mData": "contrato", "sClass": "contrato" },
            { "mData": "email_reservas", "sClass": "email" },
            { "mData": "telefono_reservas", "sClass": "telefono" },
            { "mData": "id", "sClass": "centered" }
        ]
    });

    $('#table_hoteles input[type=checkbox]').uniform('update');
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

var DESTINOS = [];
function autocomplete() {
    $( "#destino").typeahead({
        source: function(query, process) {
            $.ajax({
               url: BASE_URL + '/admin-ajax-destino',
               type: 'post',
               dataType: 'json',
               data: {action:'search', term: query},
               success : function(response) {
                   DESTINOS = [];
                   if(response.lista.length > 0) {
                    var lista = [];
                    for(i=0;i<response.lista.length; i++) {
                        var elemento = response.lista[i];
                        lista.push(elemento.nombre);
                        DESTINOS[elemento.nombre] = elemento;
                    }
                    return process(lista);
                   }
                   else
                    return process(['No hay elementos para mostrar']); 
               }
            });
        },
        updater: function(item) {
            c = DESTINOS[item];
            if(c) {
                $('input[name=destinoId]').val(c.id);
                filtrarPorDestino();
                return item;
            } else {
                $('input[name=destinoId]').val('');
                return '';
            }
            
            
            
        }
    });
}


