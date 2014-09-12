$(initHotel);


var DESCRIPCION_LARGA = {};
var DESCRIPCION_CORTA = {};
var INFORMACION_COMPRA = {};
var TITULO_SEO = {};
var KEYWORDS_SEO = {};

function initHotel() {
    $('#lugares_input').tagsInput({
        'width':'100%',
        'height': '34px',
        'defaultText':'Agregar'
    });
    $('#lugares_input').on('paste',function() {
        $(this).trigger('keypress');
    });
    //guardar hotel
    $('#saveBtn').click(function(e){
        e.preventDefault();
        IDIOMA = $('#idiomaSelect').val();
        IDIOMASEO = $('#idiomaSelectSeo').val();
        $('#idiomaSelect, #idiomaSelectSeo').change();
        
        $('textarea[name=descripcionCorta]').val(JSON.stringify(DESCRIPCION_CORTA));
        $('textarea[name=descripcionLarga]').val(JSON.stringify(DESCRIPCION_LARGA));
        $('textarea[name=informacionCompra]').val(JSON.stringify(INFORMACION_COMPRA));
        $('#validarInfoCompra').val(CKEDITOR.instances.informacionCompra.getData());
        
        $('input[name=tituloSeo]').val(JSON.stringify(TITULO_SEO));
        $('textarea[name=keywordsSeo]').val(JSON.stringify(KEYWORDS_SEO));
        
        valid = $('#hotelFrm1').validationEngine('validate');
        if(valid) {
            $('#idiomaSelect').change();
            
            $('#blocker').fadeIn().find('div').html('Salvando datos del hotel');
            fecha = "";
            for(i=0;i<FECHAS_STOP.length;i++) {
                
                
                fecha += "&fechas[]=" + FECHAS_STOP[i];
            }
            data = $('#hotelFrm1').serialize() + fecha;
            $.ajax({
                url: BASE_URL + '/admin-ajax-hotel',
                data: data,
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
        }
    });
    
    //autorellenar
    $('#readBookingBtn').click(function(e){
        e.preventDefault();
        IDIOMA = $('#idiomaSelect').val();
        IDIOMASEO = $('#idiomaSelectSeo').val();
        $('#idiomaSelect, #idiomaSelectSeo').change();

        $('textarea[name=descripcionCorta]').val(JSON.stringify(DESCRIPCION_CORTA));
        $('textarea[name=descripcionLarga]').val(JSON.stringify(DESCRIPCION_LARGA));
        $('textarea[name=informacionCompra]').val(JSON.stringify(INFORMACION_COMPRA));
        $('#validarInfoCompra').val(CKEDITOR.instances.informacionCompra.getData());
        
        $('input[name=tituloSeo]').val(JSON.stringify(TITULO_SEO));
        $('textarea[name=keywordsSeo]').val(JSON.stringify(KEYWORDS_SEO));
        valid = $('#hotelFrm1').validationEngine('validate');
        if(valid) {
            $('#blocker').fadeIn().find('div').html('Salvando datos del hotel');
            
            fecha = "";
            for(i=0;i<FECHAS_STOP.length;i++) {
                
                
                fecha += "&fechas[]=" + FECHAS_STOP[i];
            }
            data = $('#hotelFrm1').serialize() + fecha;
            
            $.ajax({
                url: BASE_URL + '/admin-ajax-hotel',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    if(response.msg == 'ok') {                        
                        
                        $('#blocker').find('div').html('Actualizando datos desde booking.com');
                        $.ajax({
                            url: BASE_URL + '/admin-ajax-llenarhotel',
                            data: {id: response.hotelId},
                            type: 'post',
                            dataType: 'json',
                            success: function(resp) {
                                $('#blocker').fadeOut();
                                if(resp.msg == 'ok') {
                                    
                                    window.location = BASE_URL + '/admin-hotel-gestion/id:' + response.hotelId + '/s_id:' + new Date().getTime();
                                    
                                } else {
                                    toastr.success('No se pudo actualizar desde booking.com');
                                }
                            }
                        });
                        
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
    $('#readBookingImgBtn').click(function(e){
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-llenarhotel',
            data: {id:  $('input[name=idHotel]').val(), imagenes: 1},
            type: 'post',
            dataType: 'json',
            success: function(resp) {
                $('#blocker').fadeOut();
                if(resp.msg == 'ok') {

                    getApartamentoFotos()

                } else {
                    toastr.success('No se pudo actualizar desde booking.com');
                }
            }
        });
    });
    
    descripcionesFunctions();
    seoFunctions();
    
    promocionesFunction();
    preciosMinimosFunction();
    
    coloresFunction();
    
    pararVentasFunction();
    
    dominiosFunction();
    
    gestionFotosFunctions();
    getApartamentoFotos();
    
    logoFunctions();
    deleteLogo();
    
    $('select[name=tipoReserva]').change(function(){
        $('input[name=porcentageCobroAnticipado]').prop('disabled', $(this).val() == 'offline')
    })
    
    autoCompleteCampania();
    autocompleteDestino();
    autocompleteAdword();
    
    $('a.enviar-clave').click(function(e){
        e.preventDefault();
        $('#blocker').fadeIn().find('div').html('Espere por favor...');
        $.ajax({
            url: BASE_URL + '/admin-ajax-hotel',
            data: {action:'recuperarClave', idHotel:$('input[name=idHotel]').val()},
            type:'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                } else {
                    toastr.error(response.data);
                }
            }
        })
    });
    
    blacklistFunction();
    validacionReservas();
    destacado();
    //$('input[name=nombre], select[name=destinoId]').change(tituloseoFunction);
    
    $('input[name=dominioCampania]').on('change blur click',function(){
        if($(this).val().trim().length > 0) {
            $('input[name=adwords]').val($(this).val().trim().replace('.'+SISTEMA_NOMBRE_WEB, '.com') + '-'+SISTEMA_NOMBRE_WEB);
        }
    })
    
    initMapa();
    
    
}


function getApartamentoFotos(){
    $.ajax({
        dataType: "json",
        url: BASE_URL + "/admin-ajax-hotel",
        type: "POST",
        data: {
            idHotel: $('#global_id_hotel').val(),
            action: 'getFotos'
        },
        success: function(response) {    
            if(response.msg == 'ok'){
                if(response.html != 'not_found'){
                    $('#hotel-dropzone').addClass('dz-started');
                    $('#hotel-dropzone').html(response.html);
                    deleteApartamentoFoto();
                }
            }
        }
    }); 
}
function deleteApartamentoFoto(){
    $('.delete_foto').off().on('click', function(e){
        
        var ruta = $(this).attr('data-ruta');
        var idApartamentoAdjunto = $(this).attr('data-deptoadj');
        $('#blocker').fadeIn().find('div').html('Espere por favor...');
        $.ajax({
            dataType: "json",
            url: BASE_URL + "/admin-ajax-hotel",
            type: "POST",
            data: {
                idArchivo: idApartamentoAdjunto,
                ruta: ruta,
                action: 'deleteFoto'
            },
            success: function(response) { 
                $('#blocker').fadeOut();
                if(response.msg == 'ok'){
                    toastr.success(response.data);
                    getApartamentoFotos();
                }else{
                    toastr.error(response.data);
                }
            }
        }); 
        return false;
    });
}
function gestionFotosFunctions(){
    
    Dropzone.options.apartamentoDropzone = {
        url: BASE_URL + '/admin-ajax-hotel',
        addedfile: function(file) {
                //console.log(file)
                var removeButton = Dropzone.createElement("<a href='#' class='dz-remove'>Borrar foto</a>");
                var _this = this;
                removeButton.addEventListener("click", function(e) {
                    // Make sure the button click doesn't submit the form:
                    e.preventDefault();
                    e.stopPropagation();

                    // Remove the file preview.
                    _this.removeFile(file);
                // If you want to the delete the file on the server as well,
                // you can do the AJAX request here.
                });

                // Add the button to the file preview element.
                file.previewElement.appendChild(removeButton);
            },
            success: function(file, responseText) {
                //console.log(responseText)
                getApartamentoFotos();
            }
        
    }
}

var START_DATE = false;
var END_DATE = false;

function promocionesFunction() {
    
    $('input[name=inicioContrato]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: new Date()
    });
    
    START_DATE = new Date();
    if($('input[name=inicioContrato]').val() && $('input[name=inicioContrato]').val().trim().length > 0) {
        START_DATE = $('input[name=inicioContrato]').datepicker('getDate');
    }
    
    $('input[name=finContrato]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: new Date(new Date(START_DATE).setDate(START_DATE.getDate() + 1))
    });
    
    if($('input[name=finContrato]').val() && $('input[name=finContrato]').val().trim().length > 0)
        END_DATE = $('input[name=finContrato]').datepicker('getDate');
    
    $('input[name=inicioContrato]').on('changeDate', function(ev){
        START_DATE = ev.date;
        d = new Date(new Date(ev.date).setDate(ev.date.getDate() + 1));        
        //console.log(ev.date, $('input[name=finContrato]').datepicker('getDate'));
        if(ev.date.getTime() >= $('input[name=finContrato]').datepicker('getDate').getTime()) {
            $('input[name=finContrato]').datepicker('setDate', d);
            //f = (d.getDate() > 9 ? d.getDate() : ('0' + d.getDate())) + '-' + d.getMonth() + '-' + d.getFullYear();
            //console.log(f);
            //$('input[name=finContrato]').val(f);
            //$(this).datepicker('hide');
            $('input[name=finContrato]').datepicker('show');
            
        }
        $('input[name=finContrato]').datepicker('setStartDate', d);
        $(this).datepicker('hide');
        
        $('#promociones input[name$="[inicio]"]').each(function(){
            $(this).datepicker('setStartDate', START_DATE);
            $(this).datepicker('setEndDate', END_DATE);
        })
        
        $('#promociones input[name$="[fin]"]').each(function(){
            
            $(this).datepicker('setEndDate', END_DATE);
        })
    });
    
    $('input[name=finContrato]').on('changeDate', function(ev){
        END_DATE = ev.date;
        $(this).datepicker('hide');
        $('#promociones input[name$="[inicio]"]').each(function(){
            
            $(this).datepicker('setEndDate', END_DATE);
        })
        
        $('#promociones input[name$="[fin]"]').each(function(){
            
            $(this).datepicker('setEndDate', END_DATE);
        })
    });
    
    $('#add_promo').click(function(e){
        e.preventDefault();
        p = $('#promocion-hidden').clone();
        p.removeAttr('id').removeClass('hidden');
        name = 'XX_' + new Date().getTime();
        p.find('input, select, textarea').each(function(){
            $(this).prop('disabled', false)
            $(this).attr('name', $(this).attr('name').replace('XX', name));
            
        })
        p.find('input[type=checkbox]').attr('name', 'promociones' + p.find('input[type=checkbox]').attr('name')).uniform('update');
        p.find('input[name*="[condicionPagoOnline]"]').change(pagoOnline);
        _p = p;
        fechasPromociones(p);
        $('#promociones').append(_p);
        pagoOnline();
        eliminarPromociones();
        
    });
    eliminarPromociones();
    
    $('#promociones > div').each(function(i){
        fechasPromociones($(this));
    })
    
    $('#promociones input[name*="[condicionPagoOnline]"]').change(pagoOnline);
    pagoOnline();
}

function fechasPromociones(promo) {
    promo.find('input[name$="[inicio]"]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: START_DATE,
        endDate: END_DATE/*,
        beforeShowDay:function(date) {
            fechasND = getFechasNoDisponibles(promo[0]);
            
            for(i=0;i<fechasND.length; i++) {
                if(date.getTime() >= fechasND[i][0] && date.getTime() <= fechasND[i][1]) {
                    return false;
                }
            }
            return true;
        }*/
    });
    
    promo.find('input[name$="[fin]"]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: new Date(new Date(START_DATE).setDate(START_DATE.getDate() + 1)),
        endDate: END_DATE/*,
        beforeShowDay:function(date) {
            fechasND = getFechasNoDisponibles(promo[0]);
            
            for(i=0;i<fechasND.length; i++) {
                if(date.getTime() >= fechasND[i][0] && date.getTime() <= fechasND[i][1]) {
                    return false;
                }
            }
            return date < END_DATE && date > START_DATE;
        }*/
    });
    
    promo.find('input[name$="[inicio]"]').on('changeDate', function(ev){
        d = new Date(new Date(ev.date).setDate(ev.date.getDate() + 1));        
        
        if(ev.date.getTime() >= promo.find('input[name$="[fin]"]').datepicker('getDate').getTime()) {
            promo.find('input[name$="[fin]"]').datepicker('setDate', d);
            
            promo.find('input[name$="[fin]"]').datepicker('show');
            
        }
        
        promo.find('input[name$="[fin]"]').datepicker('setStartDate', d);
        $(this).datepicker('hide');
        
        $('input[name$="[inicio]"], input[name$="[fin]"]').datepicker('update');
    });
    
    promo.find('input[name$="[fin]"]').on('changeDate', function(ev){
        $('input[name$="[inicio]"], input[name$="[fin]"]').datepicker('update');
    });
}

function getFechasNoDisponibles(row) {
    fechas = [];
    /*p = $(row).parent();
    //console.log(p.attr('id'));
    
    if(p.attr('id') == 'preciosMinimos'){
    
        p.children().each(function(){
            if(row != this) {
                if($(this).find('input[name$="[inicio]"]').val() && $(this).find('input[name$="[fin]"]').val()) {
                    ini = $(this).find('input[name$="[inicio]"]').datepicker('getDate').getTime();
                    end = $(this).find('input[name$="[fin]"]').datepicker('getDate').getTime();
                    fechas.push([ini, end]);
                }
            }
        });
    }*/
    return fechas;
}

function eliminarPromociones() {
    $('.delete-pago-container a').off('click').on('click', function(e){
        e.preventDefault();
        $(this).parent().parent().remove();
    })
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

    //$("#geocomplete").trigger("geocode");
    
    $("#geocomplete").on("geocode:dragged", function(event, latLng) {
        $("input[name=lat]").val(latLng.lat());
        $("input[name=lon]").val(latLng.lng());
    });
}

IDIOMA = false;
IDIOMASEO = false;

function descripcionesFunctions() {
    
    
    descripcionLarga = $('textarea[name=descripcionLarga]').val();
    
    
    $('#idiomaSelect').change(function(e){
        
        if(IDIOMA) {
            
            DESCRIPCION_LARGA[IDIOMA] = CKEDITOR.instances.descripcionLarga.getData();            
            CKEDITOR.instances.descripcionLarga.setData(DESCRIPCION_LARGA[$(this).val()]);
            
        }
        IDIOMA = $(this).val();
        $('#descripcionLarga').val(DESCRIPCION_LARGA[IDIOMA]);
        
        
    });
    
    if(descripcionLarga && descripcionLarga.trim().length > 2) {
        DESCRIPCION_LARGA = JSON.parse(descripcionLarga);
            
        for(var lang in DESCRIPCION_LARGA) {
            break;
        }
        
        $('#idiomaSelect').val(lang);
        
        $('#idiomaSelect').change();
        
    }
    
    IDIOMA = $('#idiomaSelect').val();
    
}

function seoFunctions() {
    
    descripcionCorta = $('textarea[name=descripcionCorta]').val();
    
    informacionCompra = $('textarea[name=informacionCompra]').val();
    tituloSeo = $('input[name=tituloSeo]').val();
    keywordsSeo = $('textarea[name=keywordsSeo]').val();
    
    $('#idiomaSelectSeo').change(function(e){
        
        if(IDIOMASEO) {
            
            DESCRIPCION_CORTA[IDIOMASEO] = $('#descripcionCorta').val();
            
            INFORMACION_COMPRA[IDIOMASEO] = CKEDITOR.instances.informacionCompra.getData();
            CKEDITOR.instances.informacionCompra.setData(INFORMACION_COMPRA[$(this).val()]);
            
            TITULO_SEO[IDIOMASEO] = $('#tituloSeo').val();
            KEYWORDS_SEO[IDIOMASEO] = $('#keywordsSeo').val();
        }
        IDIOMASEO = $(this).val();
        
        
        
        $('#informacionCompra').val(INFORMACION_COMPRA[IDIOMASEO]);
        
        
    });
    
    if(informacionCompra && informacionCompra.trim().length > 2) {
            INFORMACION_COMPRA = JSON.parse(informacionCompra);
        
        
        
        $('#idiomaSelectSeo').change();
        
    }
    
    IDIOMASEO = $('#idiomaSelectSeo').val();
    
}


function coloresFunction() {
    color = 'ffffff';
    $('input[name=backgroundColor]').ColorPicker({
        color: '#' + color,
            onShow: function (colpkr) {
                    $(colpkr).fadeIn(500);
                    return false;
            },
            onHide: function (colpkr) {
                    $(colpkr).fadeOut(500);
                    return false;
            },
            onChange: function (hsb, hex, rgb) {
                    
                    $('input[name=backgroundColor]').val(hex);
                    
            }
    });
}

var FECHAS_STOP = [];

function pararVentasFunction() {
    
    fechas = eval($('input[name=detenerFechas]').val());
    if(fechas) {
        FECHAS_STOP = fechas;
    }
    
    $('#calendario').datepicker({
        startDate: new Date(),
        beforeShowDay: function (date){
            month = (date.getMonth() + 1);
            f = date.getFullYear() + '-' + (month > 9 ? month : ('0' + month)) + '-' + (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate()));
            
            return $.inArray(f, FECHAS_STOP) != -1 ? 'red' : true;
        }
        
    }).on('changeDate', function(e){
            date = e.date;
            month = (date.getMonth() + 1);
            f = date.getFullYear() + '-' + (month > 9 ? month : ('0' + month)) + '-' + (date.getDate() > 9 ? date.getDate() : ('0' + date.getDate()));
            //console.log(f);
            if($.inArray(f, FECHAS_STOP) == -1) {
                FECHAS_STOP.push(f);
                $('td.day.active').addClass('red');
            } else {
                FECHAS_STOP = removeFromArray(f, FECHAS_STOP);
                $('td.day.active').removeClass('red');
            }
            
            //$(this).datepicker('update');
            //$(this).datepicker('setDate', date);
        });
}
 
function removeFromArray(obj, arr) {
    newArray = [];
    
    for(i=0;i<arr.length;i++) {
        if(arr[i] != obj)
            newArray.push(arr[i]);
    }
    return newArray;
}

function logoFunctions() {
    $('.logo').uniform({
        fileButtonHtml: "Selecciona logotipo"
    });
    $('#logo').on('change', function() {
        fileSelectHandler();
    });
    $('#crop_image_container_trigger').colorbox({
        inline: true,
        width: '100%'
    });
    
    mostrarDeleteLogo();
}

function dominiosFunction() {
    $('#add-domain').click(function(e){
        e.preventDefault();
        d = $('#dominio').clone();
        d.removeAttr('id').removeClass('hidden').find('input[name="dominios[]"]').prop('disabled', false);
        $('#dominios').append(d);
        eliminarDominios();
    });
    eliminarDominios();
}

function eliminarDominios() {
    $('a.delete-domain').off('click').click(function(e){
        e.preventDefault();
        _this = $(this).parent();
        while(!_this.hasClass('row-fluid')) _this = _this.parent();
        
        _this.remove();
    })
}
CAMPANIAS = [];
function autoCompleteCampania() {
    $( "#campania").typeahead({
        source: function(query, process) {
            $.ajax({
               url: BASE_URL + '/admin-ajax-campania',
               type: 'post',
               dataType: 'json',
               data: {action:'search', term: query},
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
                
                $('input[name=dominioCampania]').val(c.subdominio);
                $('input[name=emailReservas]').val(c.empresa.emailReservas);
                
                $('input[name=telefonoReservas]').val(c.empresa.telefonoReservas);
                console.log(c.porcentajeBeneficio);
                $('input[name=porcentageCobroAnticipado]').val(c.porcentajeBeneficio);
                
                if(c.promociones) {
                    $('#promociones').html();
                    for(i=0;i<c.promociones.length;i++) {
                        promo = c.promociones[i];
                        p = $('#promocion-hidden').clone();
                        p.removeAttr('id').removeClass('hidden');
                        name = promo.id;
                        p.find('input, select').each(function(){
                            $(this).prop('disabled', false)
                            $(this).attr('name', $(this).attr('name').replace('XX', name));
                        });
                        
                        ini = promo.inicio.split(' ')[0].split('-');
                        ini = ini[2] + '-' + ini[1] + '-' + ini[0];
                        
                        fin = promo.fin.split(' ')[0].split('-');
                        fin = fin[2] + '-' + fin[1] + '-' + fin[0];
                        
                        p.find('input[name$="[descuentoBooking]"]').val(promo.descuentoBooking)
                        p.find('select[name$="[tipoDescuentoBooking]"]').val(promo.tipoDescuento);
                        p.find('input[name$="[inicio]"]').val(ini);
                        p.find('input[name$="[fin]"]').val(fin);
                        fechasPromociones(p);
                        $('#promociones').append(p);
                    }
                }
                eliminarPromociones();
                //tituloseoFunction();
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

function eliminarBlacklist() {
    $('.delete-blacklist-container a').off('click').on('click', function(e){
        e.preventDefault();
        $(this).parent().parent().parent().remove();
    })
}

function blacklistFunction() {
    eliminarBlacklist();
    
    $('#addBlacklistBtn').on('click', function(e){
        e.preventDefault();
        clone = $('#blacklistHidden').clone();
        clone.removeClass('hidden').removeAttr('id');
        time = new Date().getTime();
        clone.find('input, select').each(function(){
            $(this).prop('disabled', false);
            name = $(this).attr('name');
            name = name.replace('XX', 'XX_' + time);
            $(this).attr('name', name);
        })
        $('#blacklist').append(clone);
        eliminarBlacklist();
    });
    
   
    $('#importBlacklistBtn').click(function(){
        $('#importarbl_modal').modal();
    })
    
    $('#importBlacklistFrm').submit(function(e){
        e.preventDefault();
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-blacklist',
            data: $(this).serialize(),
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                $('#importarbl_modal').modal('toggle');
                if(response.blacklist && response.blacklist.length > 0) {
                    for(i=0;i<response.blacklist.length; i++) {
                        blacklist = response.blacklist[i];
                        clone = $('#blacklistHidden').clone();
                        clone.removeClass('hidden').removeAttr('id');
                        time = blacklist.id;
                        clone.find('input, select').each(function(){
                            $(this).prop('disabled', false);
                            name = $(this).attr('name');
                            name = name.replace('XX', 'XX_' + time);
                            $(this).attr('name', name);
                        });
                        clone.find('input[name$="[palabra]"]').val(blacklist.palabra);
                        clone.find('select').val(blacklist.ocultarResultado);
                        $('#blacklist').append(clone);
                        
                    }
                    eliminarBlacklist();
                }
                
            }
        })
    })
}


function preciosMinimosFunction() {
    
    
    $('#preciosMinimos > div').each(function(){
        fechasPromociones($(this));
        
        if($(this).find('input[name*=inicio]').val().trim().length > 0){
            $(this).find('input[name*=fin]').datepicker('setStartDate', $(this).find('input[name*=fin]').datepicker('getDate'));
        }
    })
    
    $('#preciosMinimos input[type=text], #preciosMinimos select').prop('disabled', !$('#activarPrecioMinimo').prop('checked'));
    
    $('#activarPrecioMinimo').on('change', function(){
        $('#preciosMinimos input[type=text], #preciosMinimos select').prop('disabled', !$('#activarPrecioMinimo').prop('checked'));
    })
}

function tituloseoFunction(){
    text = $('input[name=nombre]').val().trim();
    if($('select[name=destinoId]').val() > 0)
        text += (' | ' + $('select[name=destinoId] option:selected').text());
    console.log(text);
    $('#tituloSeo').val(text)
}

function mostrarDeleteLogo() {
    img = $('#logo_image_file_png').attr('src');
    if(img.trim().length == 0)
        $('#deleteLogoContainer').hide();
    else 
        $('#deleteLogoContainer').show();
}

function deleteLogo() {
    $('#deleteLogoContainer a').click(function(e){
        e.preventDefault();
        $('#logo_image_file_png').attr('src', '');
        $('input[name=logoId]').val('');
        mostrarDeleteLogo();
    })
    
    
}

function validacionReservas() {
    
    $('#urlValidacionBtn').off().click(function(e){
        e.preventDefault();
        id = $('input[name=idHotel]').val();
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-hotel',
            data: {action:'urlValidacion', id:id},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                }
            }
        });
    })
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
                $('input[name=destinoId]').val(c.id);
                $.ajax({
                   url: BASE_URL + '/admin-ajax-destino',
                   type: 'post',
                   dataType: 'json',
                   data: {action:'get', id: c.id},
                   success : function(response) {
                        if(response.destino.lugares && response.destino.lugares != ''){
                            $('#lugares_input').importTags(response.destino.lugares);
                            //$('#lugares_container').slideDown();
                        }else{
                            $('#lugares_input').importTags('');
                            //$('#lugares_container').slideUp();
                        }
                   }
                });
                return item;
            } else {
                $('#lugares_input').importTags('');
                //$('#lugares_container').slideUp();
                $('input[name=destinoId]').val('');
                return '';
            }
            
            
            
        }
    });
}

function destacado() {
    $('.actions.favorito a').click(function(e){
        e.preventDefault();
        destacado = $('input[name=destacado]').prop('checked');
        $('input[name=destacado]').prop('checked', !destacado);
        src = $(this).find('img').attr('src');
        $(this).find('img').attr('src', src.replace((destacado ? '-on.' : '-off.'), (destacado ? '-off.' : '-on.')));
        $(this).attr('title', destacado ? 'Marcar como favorito' : 'Desmarcar como favorito');
    })
}

function pagoOnline() {
    
    $('input[type=checkbox]').each(function(){
        checked = $(this).prop('checked');
        $(this).parents('.promocion').find('input[name*="[pagoOnline]"]').prop('disabled', !checked);
    })
}

var ADWORDS = [];
function autocompleteAdword() {
    $('#adword').typeahead({
        source: function(query, process) {
            $.ajax({
               url: BASE_URL + '/admin-ajax-adword',
               type: 'post',
               dataType: 'json',
               data: {action:'search', term: query},
               success : function(response) {
                   ADWORDS = [];
                   if(response.lista.length > 0) {
                    var lista = [];
                    for(i=0;i<response.lista.length; i++) {
                        var elemento = response.lista[i];
                        lista.push(elemento.nombreCampania);
                        ADWORDS[elemento.nombreCampania] = elemento;
                    }
                    return process(lista);
                   }
                   else
                    return process(['No hay elementos para mostrar']); 
               }
            });
        },
        updater: function(item) {
            c = ADWORDS[item];
            if(c) {
                $('input[name=idAdword]').val(c.id);
                return item;
            } else {
                $('input[name=idAdword]').val('');
                return '';
            }
        }
    }).change(function(){
        if($('#adword').val().trim().length == 0)
            $('input[name=idAdword]').val('');
    });
}
