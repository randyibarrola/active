$(initFunction);

function initFunction() {
    
    $('#formWizardEmpresa').submit(function(e){
        e.preventDefault();
        
        valid = $('form').validationEngine('validate');
        
        if(valid) {
            data = $('form').serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-wizard',
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
    
    
    
    $('a.btn[href$=Div]').click(function(e){
        e.preventDefault();
        div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
        form = div.find('form');
        valid = form.validationEngine('validate');
        
        if(valid) {
            href = $(this).attr('href');
            
            goToStep(href);
        }
    })
    
    
    $('a.step[href$=Div]').off().click(function(e){
        e.preventDefault();
        console.log(e);
        li = $($(this)).parent();
        
        div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
        
        if($(this).attr('href') == '#' + div.attr('id')) return false;
        form = $('.portlet-body > div > div:not(:hidden):not(.progress) form');
        valid = form.validationEngine('validate');
        if(valid) {
            goToStep($(this).attr('href'));
        } else {
            return false;
        }
    })
    
    updateBar();
    
    promocionesFunction();
    
    
    
    initMapa();
    
    
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
    
    div.hide();
    divToGo.fadeIn();
    $('a.step[href="#' + div.attr('id') + '"]').parent().removeClass('active').addClass('done');
    $('a.step[href="#' + divToGo.attr('id') + '"]').parent().addClass('active').removeClass('done');
    
    updateBar();
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



