$(initFunction);

function initFunction() {
    autoCompleteHotel();
    $('#hotel').change(filtrarPorHotel);
    //filtrarPorHotel();
    initReserva();
    $('#entrada, #salida, #creacion').each(function(i){
        _this = $(this);
        _this.data('fechas', []);
        _this.datepicker({
            format:'dd/mm/yyyy',
            autoclose: true,
            beforeShowDay: function (date){
                //f = (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate())) + '/' + ((date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1)) ) + '/' + date.getFullYear();
               // _this = $($('#entrada, #salida, #creacion')[i]);
                //console.log(f, _this, _this.data('fechas'));
                //return _this.data('fechas').indexOf(f) != -1;
                return true;
            }
        })
    });
    
    $("input[type=text], select", "thead th").each( function ( i ) {
        
        $(this).change( function () {
            if(table)
                table.fnFilter( $(this).val(), i + 1 );
        } );
    } );
    
    $('input[name=all]').change(function(){
        $('#nombrehotel').prop('disabled', $(this).prop('checked'));
        $('input[name=showByOp]').prop('disabled', $(this).prop('checked')).prop('checked', false);
        filtrarPorHotel();
    })
    
    $('input[name=showByOp]').change(function(){
        $('input[name=all]').prop('disabled', $(this).prop('checked')).prop('checked', false);
        filtrarPorHotel();
    })
    
    motivoFunction();
}

function filtrarPorHotel() {
    
    if(table) table.fnDestroy();
        $('#table_reservas tbody').html('');
    initReserva();
}

table = false;

function initReserva() {
    
    table = $('#table_reservas').dataTable({
        "aaSorting": [[ 5, "desc" ]],
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
                'aTargets': [0, 9, 10,11]
            }
        ],
        "fnCreatedRow": function( nRow, aData, iDataIndex ) {
            
            //console.log(aData);
            
            acciones = '';
            acciones += '<a href="' + BASE_URL + '/admin-reserva-gestion/id:' + aData.id + '"><span class="fa fa-pencil"></span></a> ';
            acciones += '<a target="_blank" href="' + BASE_URL.replace("https", "http") + '/admin-book/id:' + aData.id + '"><span class="fa fa-bold"></span></a>';
            acciones += '<a reserva-id="' + aData.id + '" class="delete" href="#"><span class="fa fa-trash-o"></span></a>';
            if(aData.id.length > 0) {
                $(nRow).find('td').last().html(acciones);
                $(nRow).find('td.estado').html('<label class="estado" reserva-id="' + aData.id + '">' + aData.estado + '</label>');

                $(nRow).find('input[type=checkbox]').uniform();

                $(nRow).find('a.delete').off('click').on('click', function(e){
                    e.preventDefault();
                    id = $(this).attr('reserva-id');
                    $('#idEliminar').val(id);
                    $('#eliminar_modal').modal();
                    eliminar();
                });

                $(nRow).find('label.estado').off('click').on('click', function(){
                    if($(this).html()=="Cancelada por el administrador"){
                        return false;
                    }
                    $('table span.estado').each(function(){
                            $(this).parent().find('label').show();
                            $(this).remove();                            
                    });
                    $(this).hide();
                    _this = $(this);
                    sp = $('#cambiarEstado').clone();
                    sp.removeClass('hidden');

                    sp.find('select').val($(this).html()).on('change', function(){
                        estado = $(this).val();
                        reserva = _this.attr('reserva-id');
                        
                        if(estado == 'Cancelada por el administrador') {
                            $('#motivo_modal').modal();
                        } else {
                        
                            $('#blocker').fadeIn();
                            $.ajax({
                                url: BASE_URL + '/admin-ajax-reserva',
                                data: {estado: estado, action: 'cambiarEstado', id: reserva},
                                type: 'post',
                                dataType: 'json',
                                success: function(response){
                                    $('#blocker').fadeOut();
                                    if(response.msg == 'ok') {
                                        toastr.success(response.data);
                                        table.fnDraw(false);
                                    }
                                }
                            });
                        }
                    })

                    _this.parent().append(sp);
                });
            
            }
            
        },
        "bRetrieve": true,
        "bDestroy": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": BASE_URL + '/admin-ajax-reserva',
        "sServerMethod": "POST",
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "action", "value": "filtrar" } );
            if(!$('#nombrehotel').prop('disabled'))
                aoData.push( { "name": "query", "value": $('#hotel').val() } );
            aoData.push( { "name": "table", "value": true } );
            if($('input[name=showByOp]').prop('checked'))
                aoData.push({ "name": "showByOp", "value":1 });
        },
        "aoColumns": [
            { "mData": "localizador" },
            { "mData": "cliente" },
            { "mData": "hotel" },
            { "mData": "llegada" },
            { "mData": "salida" },
            { "mData": "creacion" },
            { "mData": "total" },
            { "mData": "comision" },
            { "mData": "estado", 'sClass' : 'estado' },
            { "mData": "op" },
            { "mData": "opDevolucion" },
            { "mData": "id", "sClass": "centered" }
        ],
        "fnDrawCallback": function( oSettings ) {
            //console.log(oSettings);
        }
    });
    $('#table_reservas tbody .checkboxes').uniform();
    jQuery('#table_reservas .group-checkable').change(function () {
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

    jQuery('#table_reservas_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_reservas_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_reservas_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

    

}

function eliminar() {
    $('#aceptarEliminar').off().click(function(e){
        
        e.preventDefault();
        id = $('#idEliminar').val();
        $('#eliminar_modal').modal('toggle');
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-reserva',
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

var ELEMENTOS = [];

function autoCompleteHotel() {
    $( "#nombrehotel").typeahead({
        source: function(query, process) {
            $.ajax({
               url: BASE_URL + '/admin-ajax-reserva',
               type: 'post',
               dataType: 'json',
               data: {action:'search', term: query},
               success : function(response) {
                   ELEMENTOS = [];
                   
                    var lista = [];
                    for(i=0;i<response.lista.hoteles.length; i++) {
                        var elemento = response.lista.hoteles[i];
                        elemento.tipo = 'hotel';
                        lista.push(elemento.nombre);
                        ELEMENTOS[elemento.nombre] = elemento;
                    }
                    for(i=0;i<response.lista.usuarios.length; i++) {
                        var elemento = response.lista.usuarios[i];
                        elemento.tipo = 'usuario';
                        lista.push(elemento.nombre + ' ' + elemento.apellido + ' (' + elemento.email + ')');
                        ELEMENTOS[elemento.nombre + ' ' + elemento.apellido + ' (' + elemento.email + ')'] = elemento;
                    }
                    for(i=0;i<response.lista.reservas.length; i++) {
                        var elemento = response.lista.reservas[i];
                        elemento.tipo = 'reserva';
                        lista.push(elemento.localizador);
                        ELEMENTOS[elemento.localizador] = elemento;
                    }
                   if(lista.length > 0) {
                       //console.log(lista);
                    return process(lista);
                   }
                   else
                    return process(['No hay elementos para mostrar']); 
               }
            });
        },
        updater: function(item) {
            c = ELEMENTOS[item];
            if(c) {
                $('#hotel').val(c.tipo + ':' + c.id);
                filtrarPorHotel();
                return item;
            } else {
                $('#hotel').val('');
                return ;
            }
            
            
            
        }
    });
}

function motivoFunction() {
    $('#aceptarMotivo').click(function(e){
        e.preventDefault();
        var valid = $('#motivoForm').validationEngine('validate');
        if(valid) {
            data = $('#reservaFrm').serialize() + '&' + $('#motivoForm').serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-reserva',
                data: {estado: estado, action: 'cambiarEstado', id: reserva, motivoCancelacion: $('textarea[name=motivoCancelacion]').val()},
                type: 'post',
                dataType: 'json',
                success: function(response){
                    $('#blocker').fadeOut();
                    $('#motivo_modal').modal('toggle');
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        table.fnDraw(false);
                    }
                }
            });
        }
    })
}


