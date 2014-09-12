$(initFunction);

function initFunction() {
    
    $('#formWizardEmpresa, #formWizardContrato').submit(function(e){
        e.preventDefault();
        if($('.atc:hidden').length > 0 || $('.atc').parent().hasClass('checked'))
            $('.atc').removeClass('validate[required]');
        else $('.atc').addClass('validate[required]');
        valid = $('form').validationEngine('validate');
        
        if(valid) {
            data = $('form').serialize();
            $('#blocker').fadeIn().find('div').html('Salvando...');
            $.ajax({
                url: BASE_URL + '/admin-ajax-contrato',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        /*if($('.imprimir').prop('checked')) {
                            window.open(BASE_URL + '/admin-campania-imprimir/id:' + response.campania, $('input[name=nombre]').val());
                        }*/
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-campania-ver/id:' + response.campania;
                        }, 3500);
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
        
    });
    
    $('#tipo_producto').change(function () {
       if($(this).val() == "hotel"){
            $('.tipo_hotel').show();
       }else{
        $('.tipo_hotel').hide(); 
       }
    });
    
    $('a.btn[href$=Div]').click(function(e){
        e.preventDefault();
        div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
        form = div.find('form');
        if($('.atc').parent().hasClass('checked'))
            $('.atc').removeClass('validate[required]');
        else $('.atc').addClass('validate[required]');
        valid = form.validationEngine('validate');
        
        if(valid) {
            href = $(this).attr('href');
            
            goToStep(href);
        }
    })
    
    
    $('a.step[href$=Div]').off().click(function(e){
        e.preventDefault();
        return false;
        //console.log(e);
        /*
        li = $($(this)).parent();
        
        div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
        
        if($(this).attr('href') == '#' + div.attr('id')) return false;
        form = $('.portlet-body > div > div:not(:hidden):not(.progress) form');
        if($('.atc').parent().hasClass('checked'))
            $('.atc').removeClass('validate[required]');
        else $('.atc').addClass('validate[required]');
        valid = form.validationEngine('validate');
        if(valid) {
            goToStep($(this).attr('href'));
        } else {
            return false;
        }*/
    });
    
    autocompleteEmpresa();
    
    updateBar();
    
    promocionesFunction();
    
    agregarEmpresa();
    
    subdominio();
    
   // initMapa();
       
    $('#tc_link').click(function(e){
        e.preventDefault();
        $('#tc_modal').modal();
    });
    
    $('select[name=empresaDistribuidoraId]').change(function(){
        
        id = $(this).val();
        opt = $('select[name=empresaDistribuidoraId] option[value="' + id + '"]');
        
        $('input[name=porcentajeBeneficio]').val(opt.attr('pb'));
    });
    
    $('select[name=empresaId]').change(datosEmpresa);
    
    
    
    initMapa();
}

function subdominio() {
    $('input[name=nombreHotel]').on('change', function(){
        hotel = $(this).val();
        //$('#blocker').fadeIn().find('div').html('Generando subdominio...');
        $.ajax({
            type: 'post',
            data: {hotel:hotel},
            dataType: 'json',
            url: BASE_URL + '/admin-ajax-dominio',
            success: function(response) {
                $('input[name=subdominio]').val(response.data);
                //$('#blocker').fadeOut();
            }
        })
    })
}

function updateBar() {
    
    var total = $('ul.steps li').length;
    var current = 1;
    $('ul.steps li').each(function(i){
        if($(this).hasClass('active'))
            current = i + 1;
    });
    var $percent = (current / total) * 100;
    $('.form-wizard').find('.progress-bar').css({
        width: $percent + '%'
    });
    $('.portlet-title .caption .step-title').html('Paso ' + current + ' de ' + total);
                
}

function goToStep(step) {
    div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
    
    divToGo = $(step);
    
    if(divToGo.attr('id') == 'finalizarDiv') { //resumen
        $('#labelNombre').html($('input[name=nombre]').val());
        $('#labelNombreHotel').html($('input[name=nombreHotel]').val());
        $('#labelFin').html($('input[name=fin]').val());
        $('#labelInicio').html($('input[name=inicio]').val());
        $('#labelSubdominio').html($('input[name=subdominio]').val());
        $('#labelDistribuidora').html($('select[name=empresaDistribuidoraId] option[value=' + $('select[name=empresaDistribuidoraId]').val() + ']').html());
        $('#labelCliente').html($('input[name=nombreComercial]').val());
        
        $('#labelEstanciaMinima').html($('select[name="estanciaMinima"]').val() + ' días');
        $('#labelVentaAnticipada').html($('select[name="ventaAnticipada"]').val() + ' días');
        
        $('#periodos-resume-container').html('');
        $('#promociones .promocion').each (function(i){
            clon = $('#periodo-resume').clone();
            clon.find('label.promo').html('Promoción ' + (i + 1));
            clon.find('label.inicio').html($(this).find('input[name$="[inicio]"]').val());
            clon.find('label.fin').html($(this).find('input[name$="[fin]"]').val());
            clon.find('label.descuento').html($(this).find('input[name$="[descuentoBooking]"]').val() + ' ' + $(this).find('select[name$="[tipoDescuento]"]').val());
            //clon.find('label.estancia-minima').html($(this).find('input[name$="[estanciaMinima]"]').val() + ' días');
            //clon.find('label.venta-anticipada').html($(this).find('input[name$="[ventaAnticipada]"]').val() + ' días');
            clon.removeAttr('id').removeClass('hidden');
            $('#periodos-resume-container').append(clon);
        })
    }
    
    div.hide();
    divToGo.fadeIn();
    $('a.step[href="#' + div.attr('id') + '"]').parent().removeClass('active').addClass('done');
    $('a.step[href="#' + divToGo.attr('id') + '"]').parent().addClass('active').removeClass('done');
    
    updateBar();
}

function datosEmpresa() {
    $('#blocker').fadeIn();
    $.ajax({
        url: BASE_URL + '/admin-ajax-empresa',
        data: {action:'get', id: $('select[name=empresaId]').val()},
        type: 'post',
        dataType: 'json',
        success: function(response){
            $('#blocker').fadeOut();
            if(response.msg == 'ok') {
                $('input[name=nombreComercial]').val(response.data.nombreComercial);
                $('input[name=nombreFiscal]').val(response.data.nombreFiscal);
                $('input[name=numeroFiscal]').val(response.data.numeroFiscal);
                $('input[name=telefonoReservas]').val(response.data.telefonoReservas);
                $('input[name=emailReservas]').val(response.data.emailReservas);
                $('input[name=destinoTuristico]').val(response.data.destinoTuristico);
                
                $('input[name=contactoNombre]').val(response.data.contactoNombre);
                $('input[name=contactoApellidos]').val(response.data.contactoApellidos);
                $('input[name=contactoEmail]').val(response.data.contactoEmail);
                $('input[name=contactoDni]').val(response.data.contactoDni);
                
                $('input[name=descripcion]').val(response.data.direccion.descripcion);
                $('input[name=calle]').val(response.data.direccion.calle);
                $('input[name=codigoPostal]').val(response.data.direccion.codigoPostal);
                $('input[name=lat]').val(response.data.direccion.lat);
                $('input[name=lon]').val(response.data.direccion.lon);
                
                $("#geocomplete").geocomplete('find', $("input[name=lat]").val() + ', ' + $("input[name=lon]").val());
            }
        }
    });
}


var START_DATE = false;
var END_DATE = false;

function promocionesFunction() {
    
    $('input[name=inicio]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: new Date()
    });
    
    START_DATE = new Date();
    if($('input[name=inicio]').val() && $('input[name=inicio]').val().trim().length > 0) {
        START_DATE = $('input[name=inicio]').datepicker('getDate');
    }
    
    $('input[name=fin]').datepicker({
        format: 'dd-mm-yyyy',
         autoclose: true,
        startDate: new Date(new Date(START_DATE).setDate(START_DATE.getDate() + 1))
    });
    
    if($('input[name=fin]').val() && $('input[name=fin]').val().trim().length > 0)
        END_DATE = $('input[name=fin]').datepicker('getDate');
    
    $('input[name=inicio]').on('changeDate', function(ev){
        START_DATE = ev.date;
        d = new Date(new Date(ev.date).setDate(ev.date.getDate() + 1));        
        //console.log(ev.date, $('input[name=finContrato]').datepicker('getDate'));
        if(ev.date.getTime() >= $('input[name=fin]').datepicker('getDate').getTime()) {
            $('input[name=fin]').datepicker('setDate', d);
            //f = (d.getDate() > 9 ? d.getDate() : ('0' + d.getDate())) + '-' + d.getMonth() + '-' + d.getFullYear();
            //console.log(f);
            //$('input[name=finContrato]').val(f);
            //$(this).datepicker('hide');
            $('input[name=fin]').datepicker('show');
            
        }
        $('input[name=fin]').datepicker('setStartDate', d);
        $(this).datepicker('hide');
        
        $('#promociones input[name$="[inicio]"]').each(function(){
            $(this).datepicker('setStartDate', START_DATE);
            $(this).datepicker('setEndDate', END_DATE);
        })
        
        $('#promociones input[name$="[fin]"]').each(function(){
            
            $(this).datepicker('setEndDate', END_DATE);
        })
    });
    
    $('input[name=fin]').on('changeDate', function(ev){
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
        p.find('input, select').each(function(){
            $(this).prop('disabled', false)
            $(this).attr('name', $(this).attr('name').replace('XX', name));
        })
        fechasPromociones(p);
        $('#promociones').append(p);
        
        eliminarPromociones();
    });
    eliminarPromociones();
    
    $('#promociones > div').each(function(){
        fechasPromociones($(this));
    })
}

function fechasPromociones(promo) {
    promo.find('input[name$="[inicio]"]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: START_DATE,
        endDate: END_DATE,
        beforeShowDay:function(date) {
            fechasND = getFechasNoDisponibles(promo[0]);
            
            for(i=0;i<fechasND.length; i++) {
                if(date.getTime() >= fechasND[i][0] && date.getTime() <= fechasND[i][1]) {
                    return false;
                }
            }
            return true;
        }
    });
    
    promo.find('input[name$="[fin]"]').datepicker({
        format: 'dd-mm-yyyy',
        startDate: new Date(new Date(START_DATE).setDate(START_DATE.getDate() + 1)),
        endDate: END_DATE,
        autoclose: true,
        beforeShowDay:function(date) {
            fechasND = getFechasNoDisponibles(promo[0]);
            
            for(i=0;i<fechasND.length; i++) {
                if(date.getTime() >= fechasND[i][0] && date.getTime() <= fechasND[i][1]) {
                    return false;
                }
            }
            return true;
        }
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
    $('#promociones > div').each(function(){
        if(row != this) {
            if($(this).find('input[name$="[inicio]"]').val() && $(this).find('input[name$="[fin]"]').val()) {
                ini = $(this).find('input[name$="[inicio]"]').datepicker('getDate').getTime();
                end = $(this).find('input[name$="[fin]"]').datepicker('getDate').getTime();
                fechas.push([ini, end]);
            }
        }
    });
    return fechas;
}

function eliminarPromociones() {
    $('.delete-pago-container a').off('click').on('click', function(e){
        e.preventDefault();
        $(this).parent().parent().remove();
    })
}

map = false;

function initMapa() {
    $("#geocomplete").geocomplete({
        map: "#mapa",        
        markerOptions: {
            draggable: true
        }
    });
    
    map = $("#geocomplete").geocomplete("map");
    google.maps.event.trigger(map, "resize");
    window.setTimeout(function() {
        map.setCenter(new google.maps.LatLng($("input[name=lat]").val(), $("input[name=lon]").val()));
        $("#geocomplete").geocomplete('find', $("input[name=lat]").val() + ', ' + $("input[name=lon]").val());
    }, 20);

    //$("#geocomplete").trigger("geocode");
    
    $("#geocomplete").on("geocode:dragged", function(event, latLng) {
        $("input[name=lat]").val(latLng.lat());
        $("input[name=lon]").val(latLng.lng());
        //console.log(1);
    });
    
    $("#geocomplete").on("geocode:result", function(result) {
        $("input[name=lat]").val(map.getCenter().lat());
        $("input[name=lon]").val(map.getCenter().lng());
    });
}

function agregarEmpresa() {
    
    $('#nuevaEmpresaBtn').click(function(e){
        e.preventDefault();
        $('#nuevaEmpresa').fadeOut(100, function(){
            $('#addEmpresa').fadeIn();
        })
    })
    
    $('input[name=empresa]').change(function(e){
        if($(this).val() && $(this).val().trim().length > 0) {
            $('#addEmpresaBtn').removeClass('disabled');
        } else {
            $('#addEmpresaBtn').addClass('disabled');
        }
    }).keyup(function(e){
        if($(this).val() && $(this).val().trim().length > 0) {
            $('#addEmpresaBtn').removeClass('disabled');
        } else {
            $('#addEmpresaBtn').addClass('disabled');
        }
    });
    
    $('#addEmpresaBtn').click(function(e){
        e.preventDefault();
        if(!$(this).hasClass('disabled')) {
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-contrato',
                data: {action: 'addEmpresa', nombre: $('input[name=empresa]').val()},
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        $('#empresaId').val(response.empresa.nombreComercial);
                        option = '<option value="' + response.empresa.id + '">' + response.empresa.nombreComercial + '</option>';
                        $('select[name=empresaId]').append(option).val(response.empresa.id);
                        $('input[name=empresa]').val('')
                        datosEmpresa();
                        $('#addEmpresa').fadeOut(100, function(){
                            $('#nuevaEmpresa').fadeIn();
                        })
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    })
}

var ELEMENTOS = [];

function autocompleteEmpresa() {
    source = $.map($('select[name=empresaId] option'), function(n){
        return $(n).html().trim();
    })
    $('#empresaId').typeahead({
        source: function(query, process){
            lista = $.map($('select[name=empresaId] option'), function(n){
                
                return $(n).html().trim();
            });
            console.log(lista);
            return lista;
        },
        updater: function(item) {
            var e = false;
            $('select[name=empresaId] option').each(function(){
                if($(this).html().trim() == item.trim())
                    e = $(this).val();
            })
            if(e) {
                $('#empresaId').val(item.trim());
                $('select[name=empresaId]').val(e);
                $('select[name=empresaId]').change();
                return item;
            } else {
                $('#empresaId').val('');
                $('select[name=empresaId]').val(0);
                return ;
            }
            
            
            
        }
    })
}


