$(initEvento);

var DESCRIPCION_BREVE = {};
var DESCRIPCION_EXTENDIDA = {};
var SUGERENCIAS_TPV = {};
var INSTRUCCIONES_CONSUMO = {};

var TICKET_NOMBRES = {};

function initEvento() {
    $('#saveBtn').click(function(e){
        e.preventDefault();
        IDIOMA = $('#idiomaSelect').val();
        $('#idiomaSelect').change();
        
        $('textarea[name=descripcionBreve]').val(JSON.stringify(DESCRIPCION_BREVE));
        $('textarea[name=descripcionExtendida]').val(JSON.stringify(DESCRIPCION_EXTENDIDA));
        $('textarea[name=sugerenciasTpv]').val(JSON.stringify(SUGERENCIAS_TPV));
        $('textarea[name=instruccionesConsumo]').val(JSON.stringify(INSTRUCCIONES_CONSUMO));
        
        $('#validarInfoCompra').val(CKEDITOR.instances.sugerenciasTpv.getData());
        
        valid = $('#eventoFrm1').validationEngine('validate');
        if(valid) {
            $('#ticket_container .idioma_ticket').each(function () {
                $(this).focus(); 
            });

            var tickets_nombres = "";

            for (var ticket_id in TICKET_NOMBRES) {
                if(TICKET_NOMBRES[ticket_id] && TICKET_NOMBRES[ticket_id].es){
                    tickets_nombres += "&tickets["+ticket_id+"][nombre]=" + JSON.stringify(TICKET_NOMBRES[ticket_id]);
                }
            };


            $('#idiomaSelect').change();
            $('#blocker').fadeIn().find('div').html('Guardando');
            fecha = "";

            for(var fecha_key in FECHAS_TICKETS){
                for(var i=0;i < FECHAS_TICKETS[fecha_key].length;i++) {
                    fecha += "&tickets["+fecha_key+"][fechas]["+i+"]=" + FECHAS_TICKETS[fecha_key][i];
                }
            }

            data = $('#eventoFrm1').serialize()+tickets_nombres+fecha;
            $.ajax({
                url: BASE_URL + '/admin-ajax-evento',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        window.location = BASE_URL + '/admin-evento-lista';
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
    descripcionesFunctions();
    
    $('select[name=tipoReserva]').change(function(){
        $('input[name=porcentageCobroAnticipado]').prop('disabled', $(this).val() == 'offline')
    })
    
    autoCompleteCampania();
    autocompleteDestino();
    initMapa();
    gestionTickets();
    gestionFotosFunctions();
    getEventosFotos();
    initTickets();
    duracionMedida();
}

function duracionMedida() {
    $('#duracion_medida').on('change', duracionMedida);
    $('#duracion_indefinida').on('click', duracionMedida);
    var indefinida = !$('#duracion_indefinida').prop('checked');
    if(indefinida) {
        $('#duracion_dias, #duracion_horas').hide().prop('disabled', true).val('');
        $('#duracion_medida').hide();
    } else {
        $('#duracion_medida').show();
        var medida = $('#duracion_medida').val();
    
        if(medida == 'horas') {
            $('#duracion_dias').hide().prop('disabled', true).val('');
            $('#duracion_horas').show().prop('disabled', false);
        } else {
            $('#duracion_horas').hide().prop('disabled', true).val('');
            $('#duracion_dias').show().prop('disabled', false);
        }
    }
}

function gestionFotosFunctions(){
    
    Dropzone.options.apartamentoDropzone = {
        url: BASE_URL + '/admin-ajax-evento',
        addedfile: function(file) {
                //console.log(file)
                var removeButton = Dropzone.createElement("<a href='#' class='dz-remove'>Borrar foto</a>");
                var _this = this;
                removeButton.addEventListener("click", function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    _this.removeFile(file);
                });
                file.previewElement.appendChild(removeButton);
            },
            success: function(file, responseText) {
                
            }
        
    }
}
function getEventosFotos(){
    $.ajax({
        dataType: "json",
        url: BASE_URL + "/admin-ajax-evento",
        type: "POST",
        data: {
            idEvento: $('#global_id_evento').val(),
            action: 'getFotos'
        },
        success: function(response) {    
            if(response.msg == 'ok'){
                if(response.html != 'not_found'){
                    $('#evento-dropzone').addClass('dz-started');
                    $('#evento-dropzone').html(response.html);
                    deleteEventoFotos();
                }
            }
        }
    }); 
}

function deleteEventoFotos(){
    $('.delete_foto').off().on('click', function(e){
        var ruta = $(this).attr('data-ruta');
        var idEventoAdjunto = $(this).attr('data-deptoadj');
        $('#blocker').fadeIn().find('div').html('Espere por favor...');
        $.ajax({
            dataType: "json",
            url: BASE_URL + "/admin-ajax-evento",
            type: "POST",
            data: {
                idArchivo: idEventoAdjunto,
                ruta: ruta,
                action: 'deleteFoto'
            },
            success: function(response) { 
                $('#blocker').fadeOut();
                if(response.msg == 'ok'){
                    toastr.success(response.data);
                    getEventosFotos();
                }else{
                    toastr.error(response.data);
                }
            }
        }); 
        return false;
    });
}

function initMapa() {
    $("#geocomplete").geocomplete({
        map: "#mapa",        
        markerOptions: {
            draggable: true
        }
    });
    
    var map = $("#geocomplete").geocomplete("map");
    google.maps.event.trigger(map, "resize");
    window.setTimeout(function() {
        map.setCenter(new google.maps.LatLng($("input[name=lat]").val(), $("input[name=lon]").val()));
        $("#geocomplete").geocomplete('find', $("input[name=lat]").val() + ', ' + $("input[name=lon]").val());
    }, 20);
    
    $("#geocomplete").on("geocode:dragged", function(event, latLng) {
        $("input[name=lat]").val(latLng.lat());
        $("input[name=lon]").val(latLng.lng());
    });
}

IDIOMA = false;
function descripcionesFunctions() {    

    descripcionExtendida = $('textarea[name=descripcionExtendida]').val();

    $('#idiomaSelect').change(function(e){
        if(IDIOMA) {
            DESCRIPCION_BREVE[IDIOMA] = CKEDITOR.instances.descripcionBreve.getData();            
            CKEDITOR.instances.descripcionBreve.setData(DESCRIPCION_BREVE[$(this).val()]);

            DESCRIPCION_EXTENDIDA[IDIOMA] = CKEDITOR.instances.descripcionExtendida.getData();            
            CKEDITOR.instances.descripcionExtendida.setData(DESCRIPCION_EXTENDIDA[$(this).val()]);
            
            SUGERENCIAS_TPV[IDIOMA] = CKEDITOR.instances.sugerenciasTpv.getData();            
            CKEDITOR.instances.sugerenciasTpv.setData(SUGERENCIAS_TPV[$(this).val()]);

            INSTRUCCIONES_CONSUMO[IDIOMA] = CKEDITOR.instances.instruccionesConsumo.getData();            
            CKEDITOR.instances.instruccionesConsumo.setData(INSTRUCCIONES_CONSUMO[$(this).val()]);
        }

        IDIOMA = $(this).val();
        $('#descripcionBreve').val(DESCRIPCION_BREVE[IDIOMA]);
        $('#descripcionExtendida').val(DESCRIPCION_EXTENDIDA[IDIOMA]);
        $('#sugerenciasTpv').val(SUGERENCIAS_TPV[IDIOMA]);
        $('#instruccionesConsumo').val(INSTRUCCIONES_CONSUMO[IDIOMA]);

    });
    var db = $('textarea[name=descripcionBreve]').val();
    if(db.length>2) DESCRIPCION_BREVE = JSON.parse(db);
    
    var sugerencias_tpv = $('textarea[name=sugerenciasTpv]').val();
    if(sugerencias_tpv.length>2) SUGERENCIAS_TPV = JSON.parse(sugerencias_tpv);

    var instrucciones = $('textarea[name=instruccionesConsumo]').val();
    if(instrucciones.length > 2) INSTRUCCIONES_CONSUMO = JSON.parse(instrucciones);

    if(descripcionExtendida && descripcionExtendida.trim().length > 2) {
        DESCRIPCION_EXTENDIDA = JSON.parse(descripcionExtendida);

        for(var lang in DESCRIPCION_EXTENDIDA) {
            break;
        }
        $('#idiomaSelect').val(lang);
        $('#idiomaSelect').change();
    }
    
    IDIOMA = $('#idiomaSelect').val();
    
}

function removeFromArray(obj, arr) {
    newArray = [];
    
    for(i=0;i<arr.length;i++) {
        if(arr[i] != obj)
            newArray.push(arr[i]);
    }
    return newArray;
}

CAMPANIAS = [];
function autoCompleteCampania() {
    $( "#campania").typeahead({
        source: function(query, process) {
            $.ajax({
               url: BASE_URL + '/admin-ajax-campania',
               type: 'post',
               dataType: 'json',
               data: {action:'search', term: query, tipo: "evento"},
               success : function(response) {
                   CAMPANIAS = [];
                   if(response.lista.length > 0) {
                    var lista = [];
                    for(i=0;i<response.lista.length; i++) {
                        var elemento = response.lista[i];
                        lista.push(elemento.localizador + ' - ' + elemento.nombre);
                        CAMPANIAS[elemento.localizador + ' - ' + elemento.nombre] = elemento;
                    }
                    return process(lista);
                   }
                   else
                    return process(['No hay elementos para mostrar']); 
               }
            });
        },
        updater: function(item) {
            c = CAMPANIAS[item];
            if(c) {
                $('#idCampania').val(c.id);
                $('select[name=configuracionId]').html();
                if(c.configuraciones)
                    for(i=0;i<c.configuraciones.length;i++)
                        $('select[name=configuracionId]').append('<option value="' + c.configuraciones[i].id + '">' + c.configuraciones[i].alias + '</option>');
                
                ini = c.inicio.split(' ')[0];
                START_DATE = new Date(new Date(ini).setDate(new Date(ini).getDate() + 1));
                if(START_DATE < new Date()) START_DATE = new Date();
                ini = ini.split('-');
                $('input[name=inicioContrato]').val(ini[2] + '-' + ini[1] + '-' + ini[0]);
                fin = c.fin.split(' ')[0];
                END_DATE = new Date(new Date(fin).setDate(new Date(fin).getDate() + 1));
                
                fin = fin.split('-');
                $('input[name=finContrato]').val(fin[2] + '-' + fin[1] + '-' + fin[0]);
                
                $('#nombre').val(c.nombreHotel);
                $('select[name=empresaId]').val(c.empresaId);
                
                $('select[name=estanciaMinima]').val(c.estanciaMinima);
                $('select[name=ventaAnticipada]').val(c.ventaAnticipada);
                
                $('input[name=emailReservas]').val(c.empresa.emailReservas);
                $('input[name=telefonoReservas]').val(c.empresa.telefonoReservas);
                return item;
            } else {
                $('input[name=inicioContrato]').val('');
                $('input[name=finContrato]').val('');
                $('#idCampania').val('');
                return ;
            }
            
            
            
        }
    });
}

var DESTINOS = [];
function autocompleteDestino() {
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
                $('input[name=destinoTuristicoId]').val(c.id);
                return item;
            } else {
                $('input[name=destinoTuristicoId]').val('');
                return '';
            }
            
            
            
        }
    });
}

function pagoOnline() {    
    $('input[type=checkbox]').each(function(){
        checked = $(this).prop('checked');
        $(this).parents('.promocion').find('input[name*="[pagoOnline]"]').prop('disabled', !checked);
    })
}

var FECHAS_TICKETS = {};

function initTickets() {
    $("#ticket_container .ticket_content").each(function() {
        var ticketId = $(this).find(".ticket_id").val();
        
        var fechas = eval($(this).find('.ticket_fechas').val());
        FECHAS_TICKETS[ticketId] = [];

        for(var fecha in fechas){
            FECHAS_TICKETS[ticketId].push(fechas[fecha].fecha);
        }

        calendario($(this), ticketId, false);
        idiomaSelect($(this), ticketId);

        $(this).find('.borrar_ticket').click(function(){
            $(this).parents(".ticket_content").remove();
            FECHAS_TICKETS[ticketId] = [];
            TICKET_NOMBRES[ticketId] = null;
            return false;
        });
        $(this).find(".horario_container .horario-form-group .delete").click(function(){
            $(this).parents(".form-group").remove();
            return false;
        });
        bindHorario($(this));
    });
}

function calendario(ele, time, new_calendar) {
    if(new_calendar) FECHAS_TICKETS[time] = [];

    var calendario_ele = ele.find(".calendario").datepicker({
        startDate: new Date(),
        beforeShowDay: function (date){
            month = (date.getMonth() + 1);
            f = date.getFullYear() + '-' + (month > 9 ? month : ('0' + month)) + '-' + (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate()));
            
            return $.inArray(f, FECHAS_TICKETS[time]) != -1 ? 'green' : true;
        }
        
    }).on('changeDate', function(e){
        date = e.date;
        month = (date.getMonth() + 1);
        f = date.getFullYear() + '-' + (month > 9 ? month : ('0' + month)) + '-' + (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate()));
        if($.inArray(f, FECHAS_TICKETS[time]) == -1) {
            FECHAS_TICKETS[time].push(f);
            ele.find('td.day.active').addClass('green');
        } else {
            FECHAS_TICKETS[time] = removeFromArray(f, FECHAS_TICKETS[time]);
            ele.find('td.day.active').removeClass('green');
        }
    });

    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var fecha_inicial = ele.find(".fecha_inicial");
    var fecha_final = ele.find(".fecha_final");

    var checkin = fecha_inicial.datepicker({
      beforeShowDay: function(date) {
        return date.valueOf() < now.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      if (ev.date.valueOf() > checkout.date.valueOf()) {
        var newDate = new Date(ev.date)
        newDate.setDate(newDate.getDate() + 1);
        fecha_final.datepicker('setStartDate', newDate);
      }
      checkin.hide();
      fecha_final.focus();
    }).data('datepicker');

    var checkout = fecha_final.datepicker({
      beforeShowDay: function(date) {
        return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      checkout.hide();
    }).data('datepicker');

    ele.find(".agregar_rango_fecha_ticket").click(function() {
        var dates = getDates(fecha_inicial.datepicker('getDate'), fecha_final.datepicker('getDate'));
        for(var _date in dates){
            var date = dates[_date];
            month = (date.getMonth() + 1);
            f = date.getFullYear() + '-' + (month > 9 ? month : ('0' + month)) + '-' + (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate()));
            if($.inArray(f, FECHAS_TICKETS[time]) == -1) {
                FECHAS_TICKETS[time].push(f);
                calendario_ele.datepicker('setValue', date);
                ele.find('td.day.active').addClass('green');
            }
            calendario_ele.datepicker('update');
        }
        fecha_inicial.val("");
        fecha_final.val("");
        return false;
    });

    ele.find(".limpiar_rango_fecha_ticket").click(function() {
        var dates = getDates(fecha_inicial.datepicker('getDate'), fecha_final.datepicker('getDate'));
        for(var _date in dates){
            var date = dates[_date];
            month = (date.getMonth() + 1);
            f = date.getFullYear() + '-' + (month > 9 ? month : ('0' + month)) + '-' + (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate()));
            
            var index = $.inArray(f, FECHAS_TICKETS[time]);
            if(index !== -1) {
                FECHAS_TICKETS[time].splice(index, 1);
                calendario_ele.datepicker('setValue', date);
                ele.find('td.day.active').removeClass('green');
            }
            calendario_ele.datepicker('update');
        }
        fecha_inicial.val("");
        fecha_final.val("");
        return false;
    });
}
Date.prototype.addDays = function(days) {
    var dat = new Date(this.valueOf())
    dat.setDate(dat.getDate() + days);
    return dat;
}

function getDates(startDate, stopDate) {
    var dateArray = new Array();
    var currentDate = startDate;
    while (currentDate <= stopDate) {
        dateArray.push( new Date (currentDate) )
        currentDate = currentDate.addDays(1);
    }
    return dateArray;
}
function bindHorario(ele){
    ele.find(".agregar_horario").click(function(){
            $horario_clone = $(this).parent().find(".horario-form-group.hidden").clone(true).off();
            var horario_name = new Date().getTime();
            $horario_clone.removeClass("hidden").removeClass("horario-form-group");
            
            $horario_clone.find(".delete").click(function(){
                $(this).parents(".form-group").remove();
                return false;
            });
            $horario_clone.find("input").attr('name', $horario_clone.find("input").attr('name').replace('YY', horario_name));
            $(this).parent().find('.horario_container').append($horario_clone);
            return false;
        });
}


function idiomaSelect(ele, time){
    var ticket_nombre = ele.find(".ticket_nombre");

    try{
        TICKET_NOMBRES[time] = JSON.parse(ticket_nombre.val());
    }catch(e){
        TICKET_NOMBRES[time] = JSON.parse('{"es":"'+ticket_nombre.val()+'"}');
    }

    ticket_nombre.val("");

    ele.find(".idioma_ticket").change(function(){

        var current_nombre = TICKET_NOMBRES[time][$(this).val()];
        if(current_nombre){
            ticket_nombre.val(current_nombre);
        }else{
            ticket_nombre.val("");
        }

    }).on("focus",function() {
        TICKET_NOMBRES[time][$(this).val()] = ticket_nombre.val();
    }).change();
}

function gestionTickets(){
    $('#agregar_ticket').click(function(){
        $clone = $('.ticket_hidden').clone(true).off();

        var time = new Date().getTime();
        $clone.find('input, select').each(function(){
            $(this).prop('disabled', false);
            $(this).attr('name', $(this).attr('name').replace('XX', time));
        });
        $clone.removeClass("hidden").removeClass("ticket_hidden");

        $clone.find('.borrar_ticket').click(function(){
            $(this).parents(".ticket_content").remove();
            FECHAS_TICKETS[time] = [];
            TICKET_NOMBRES[time] = null;
            return false;
        });

        bindHorario($clone);

        $('#ticket_container').append($clone);

        calendario($clone, time, true);
        idiomaSelect($clone, time);
        return false;
    });
}