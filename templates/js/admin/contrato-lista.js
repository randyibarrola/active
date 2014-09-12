$(initContratos);
var table = false;

function initContratos(){
    initTableContratos();
    if($('input[name=destinoId]').val().trim().length > 0)
        filtrarPorDestino();
    autocomplete();
}

function initTableContratos() {
    table = $('#table_campanias').dataTable({
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
                'aTargets': [0, 6]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            
            $(nRow).find('td.centered').html(aData.acciones);
            $(nRow).find('td.estado').html('<span class="label label-success ' + ((aData.estado != 'Pendiente') ? 'estado-campania' : '')  + '" ' + ((aData.estado != 'Pendiente') ? ('campania-id=' + aData.id) : '') + '><span class="estado-label">' + aData.estado + '</span> ' + ((aData.estado != 'Pendiente') ? ' <i class="fa fa-pencil"></i>' : '') + '</span>');
            
            $(nRow).find('a.delete').off('click').on('click', function(e){
                e.preventDefault();
                id = $(this).attr('campania-id');
                $('#idEliminar').val(id);
                $('#eliminar_modal').modal();
                eliminar();
            });
            
            $(nRow).find('span.estado-campania').off('click').on('click', function(){
                $('table span.estado').each(function(){
                        $(this).parent().find('span.estado-campania').show();
                        $(this).remove();                            
                });
                $(this).hide();
                _this = $(this);
                console.log(_this);
                sp = $('#cambiarEstado').clone();
                sp.removeClass('hidden');
                sp.find('select').val(_this.find('span.estado-label').html()).on('change', function(){
                    estado = $(this).val();
                    id = _this.attr('campania-id');
                    $('#blocker').fadeIn();
                    $.ajax({
                        url: BASE_URL + '/admin-ajax-contrato',
                        data: {estado: estado, action: 'cambiarEstado', id: id},
                        type: 'post',
                        dataType: 'json',
                        success: function(response){
                            $('#blocker').fadeOut();
                            if(response.msg == 'ok') {
                                toastr.success(response.data);
                                table.fnDraw(false);
                                /*setTimeout(function(){
                                    window.location = BASE_URL + '/admin-contrato-lista/' + new Date().getTime();
                                }, 3000)*/
                                
                            }
                        }
                    })
                }).blur(function(){
                    td = $(this).parents('td');
                    $(this).parent().remove();
                    td.find('span').show();
                });
                
                _this.parent().append(sp);
                sp.find('select').focus();
            });
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-contrato',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "filtrarPorDestino" } );
            if($('input[name=destinoId]').val().trim().length > 0)
                aoData.push( { "name": "id", "value": $('input[name=destinoId]').val() } );
            aoData.push( { "name": "table", "value": true } );
        },
        "aoColumns": [
            { "mData": "localizador" },
            { "mData": "nombre_hotel" },
            { "mData": "cobro" },
            { "mData": "contrato", },
            { "mData": "distribuidor"},
            { "mData": "estado", "sClass": "estado" },
            { "mData": "id", "sClass": "centered" }
        ]
    });

    $('#table_campanias input[type=checkbox]').uniform('update');
    jQuery('#table_campanias .group-checkable').change(function () {
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

    jQuery('#table_campanias_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_campanias_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_campanias_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}

function eliminar() {
    $('#aceptarEliminar').off().click(function(e){
        
        e.preventDefault();
        id = $('#idEliminar').val();
        $('#eliminar_modal').modal('toggle');
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-contrato',
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
        table.fnDestroy();
        $('#table_campanias tbody').html('');
        initTableContratos();
        /*
        destinoId = $('input[name=destinoId]').val();
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-contrato',
            data: {action:'filtrarPorDestino', id:destinoId},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(table) table.fnDestroy();
                $('#table_campanias tbody').html('');
                $('#table_campanias tbody').html(response.html);
                initTableContratos();
            }
        })*/
    
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
    
    $( "#destino").change(function(){
        if($(this).val().trim().length == 0) {
            $('input[name=destinoId]').val('');
            filtrarPorDestino();
        }
    })
    
}


