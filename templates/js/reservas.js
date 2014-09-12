

$(document).ready(function() {

    $('.datepicker').datepicker({
        startDate: "today",
        autoclose: true,
        language: LANG
    });
     $('.flexslider').flexslider({
        animation: "fade"
      });

    $(".when-you-go-date").each(function(){
        fechas = eval($(this).find('input[name=fechasTarifas]').val());
        
        enables = [];
        tarifas = [];
        minDate = [Math.min(),new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate()];
        if(fechas)
        for(var f=0;f<fechas.length;f++) {
            if(!fechas[f] || fechas[f].length == 0)
                continue;
            fecha = fechas[f].split('->');
            tarifaId = fecha[1];
            fecha = fecha[0];
            fecha = fecha.split('/');
            YEAR = parseInt(fecha[2].trim());
            MONTH = parseInt(fecha[1].trim()) - 1;
            DAY = parseInt(fecha[0].trim());
            /*if(DAY.length == 1)
                DAY = '0' + DAY;
            fecha = YEAR + '-' + MONTH + '-' + DAY;*/
            /*fecha = new Date(fecha);
            fecha.setDate(new Date(fecha).getDate() + 1);
            fecha.setHours(0);*/
            fecha = new Date(YEAR,MONTH,DAY);

            time = fecha.getTime();
            
            enables.push(time);
            if(minDate[0] >= time) {
                minDate[0] = time;
                minDate[1] = fecha;
            }
            if(!tarifas[tarifaId])
                tarifas[tarifaId] = [];
            
            tarifas[tarifaId].push(time);
        }
        tarifasFechas = [];
        tarifasFechas['tarifas'] = tarifas;
        tarifasFechas['enableDates'] = enables;

        $(this).data(tarifasFechas);
        $(this).datepicker({
            language: LANG,
            beforeShowDay: function (date){
                enables = this.data['enableDates'];
                return enables.indexOf(date.getTime()) !== -1 ;
            },
            show: function(date){
                
            },
            data: tarifasFechas,
            startDate: minDate[1]
        }).on('changeDate', function(ev){
            var y = ev.date.getFullYear(),
                _m = ev.date.getMonth() + 1,
                m = (_m > 9 ? _m : '0'+_m),
                _d = ev.date.getDate(),
                d = (_d);
            var when_you_go = MONTHS[_m - 1] + " " + d + ", " + y;
            tarifas = $(this).data()['tarifas'];
            tarifa = null;

            _this = $(this).parent();
            _this = _this.parents('.frmExcursion');
            $(this).parent().parent().find('.a-que-hora').hide();
            $(this).parent().parent().find('.completa-datos').show();

            var horarios_validos = [];
            var select_horario = $(this).parent().parent().find(".a-que-hora select").html('');
            var tarifas_validas = [];

            _this.find('.tarifa_container').addClass('hidden').find('select').attr('disabled', 'disabled');

            for(var tarifaId in tarifas) {
                fechas = tarifas[tarifaId];
                if(fechas.indexOf(ev.date.getTime()) !== -1) {
                    tarifa = tarifaId;
                    
                    $(this).find('input[name=fecha]').val(d + "/" + m + "/" + y);
                    
                    var horarios = JSON.parse($('#tarifa_'+tarifa).val());
                                        
                    for (var i = 0; i < horarios.length; i++) {
                        if(horarios_validos.indexOf(horarios[i])===-1){
                            horarios_validos.push(horarios[i]);
                            select_horario.append($('<option></option>').attr("value", horarios[i]).text(horarios[i]));
                        }
                    }

                    if(horarios && horarios.length>0){
                        $(this).parent().parent().find('.a-que-hora').show();
                        $(this).parent().parent().find(".set-when-you-go").html(when_you_go);
                        tarifas_validas.push(tarifa);
                    }else{
                        //Sin horarios
                        _this.find('.tarifa_container[tarifa-id="' + tarifa + '"]').addClass('hidden').find('select').attr('disabled', 'disabled');
                    }
                }else{
                    //Sin fecha disponible
                    _this.find('.tarifa_container[tarifa-id="' + tarifa + '"]').addClass('hidden').find('select').attr('disabled', 'disabled');
                }
            }

            if(horarios_validos.length===0){
                _this.find('.tarifa_container').removeClass('hidden').find('select').removeAttr('disabled');
            }

            select_horario.off().change(function() {
                var horario_seleccionado = $(this).val();
                for (var i = 0; i < tarifas_validas.length; i++) {
                    var horarios = JSON.parse($('#tarifa_'+tarifas_validas[i]).val());
                    if(horarios.indexOf(horario_seleccionado) !== -1){
                        _this.find('.tarifa_container[tarifa-id="' + tarifas_validas[i] + '"]').removeClass('hidden').find('select').removeAttr('disabled');
                    }else{
                        _this.find('.tarifa_container[tarifa-id="' + tarifas_validas[i] + '"]').addClass('hidden').find('select').attr('disabled', 'disabled');
                    }
                }
            }).change();

            calcularTotal(_this);
            _this.find('.cupon-total-content').removeClass('hidden');
            
        });
        
        $(this).find('td.day:not(.disabled)').first().click();
    });
    
    setCurrentDate();

    //$('#reservation_tabs').tab();
    $('#reservation_tabs a').click(function(e) {
        e.preventDefault()
        $(this).tab('show');
        
        if(!$('#data_step').is(':visible')){
            $('.continuar_container').show();
            
        }else{
            $('.continuar_container').hide();
            
        }
        //console.log(this);
        if($(this).attr('href') == "#reservation_step") {
            $('.reservacion-list-content-main .alert.alert-success').show();
        } else {
            $('.reservacion-list-content-main .alert.alert-success').hide();
        }
    })

    
    $(".go-step-2").click(function() {
        $("#reservation_tabs .data_step a").trigger("click");
        $("body").scrollTop(0);
        $(this).parent().hide();
        return false;
    });

    $(".go-step-3").click(function() {
        $("#reservation_tabs .pay_step a").trigger("click");
        $("body").scrollTop(0);
        return false;
    });

    $("input[name=un_pago_tipo]").change(function() {
        $(this).parents(".table.un-pago-table").find(".total-pago").hide();
        $(this).parents("tr").find(".total-pago").show();
    });

    $("input[name=forma_pago_btn]").change(function() {
        $(".for-2-pays").toggleClass("hidden");
    });
    
    $(".i_wanna_it").click(function(){
        $(".i_wanna_it").show();
        $(this).hide();
        $(".opinions-list, .tarifas-table-main").hide();
        _this = $(this).parent().parent().parent();
        _this.find(".tarifas-table-main").slideDown('fast');
        _this.find("td.day.active").click();

        _this.parent().find(".producto_descripcion_breve").hide();
        _this.parent().find(".producto_descripcion_extendida").show();
        
        _this.find('.cancel_this_booking').off('click').click(function(e){
            _this.parent().find(".producto_descripcion_breve").show();
            _this.parent().find(".producto_descripcion_extendida").hide();

            e.preventDefault();
            _this = $(this).parent();
            while(!_this.hasClass('panel-body'))_this = _this.parent();
            e.preventDefault();
            _this.find(".i_wanna_it").show();
            _this.find(".tarifas-table-main").hide();
            _this.find('.opinions-list').slideDown('fast');
        
        })
        
        return false;
    });
    
    $(".ver-opiniones").click(function(e){
        e.preventDefault();
        $(".i_wanna_it").show();
        $(".tarifas-table-main").hide();
        $('.opinions-list').slideDown('fast');
        return false;
    });

    $('#book_conditions, #privacy_policies').off('click').on('click', function(e){
        e.preventDefault();
        var id = $(this).attr('id');
        $('#' + id + '_modal').modal();
    });

    follow_me_reservation();
    selectTicketsFunctions();
    calcularTotalExcursiones();
    
    reservarExcursion();
    eliminarExcursiones();
    
    validarCupon();
    
    cardValidation();
    terminarReservacion();
    
    $('input[name=email]').change(function(){
        $('#enviaremos-a-email').html($(this).val());
    })
    
    datosPago(pay_now);
    
    if(error_msg) {
        $('.data_step > a').click();
        toastr.error(error_msg);
    }
    
    if($('#captchadiv').length > 0)
        showRecaptcha();
    
    $('#showServices').click(function(){
            that = $(this);
            $('#showServicesContainer').toggle(function(){
                    if($(this).is(':visible')){
                            that.html('- '+OCULTAR_DETALLE);
                    }else{
                            that.html('+ '+MOSTRAR_DETALLE);
                    }
            });
      });
    jQuery.fx.off = true;
      $('#showServicesContainer').toggle();
      
      $('input[name=nombre], input[name=apellido]').on('change', function(){
          $('input[name=titular]').val($('input[name=nombre]').val() + ' ' + $('input[name=apellido]').val());
      })
});
function selectTicketsFunctions() {
    if($('div.select-tickets').length > 0) {
        selectTicket();
        $('div.select-tickets input[type=radio]').click(function(e){e.preventDefault();});
        $('.tarifa_container').click(function(e){
            if($(this).find('input[type=radio]').prop('checked')) return;
            $(this).find('input[type=radio]').prop('checked', true);
            selectTicket();
            $(this).find('input[type=radio]').change();
        });
    }
}
function selectTicket() {
    /*if($('div.select-tickets input[type=radio]:checked').length == 0)
            $($('div.select-tickets input[type=radio]')[0]).prop('checked', true);*/
    $('.tarifa_container:not(.hidden) div.select-tickets input[type=radio]').each(function(){
        $(this).parent().parent().find('select').prop('disabled', !$(this).prop('checked'));
        if($(this).prop('checked')) {
            $(this).parent().parent().addClass('entrada-selected');
            precio = $(this).parent().parent().find('select').attr('precio');
            $(this).parent().parent().find('label.totalEntradas strong').html(moneyConverter(precio));
        } else {
            $(this).parent().parent().removeClass('entrada-selected');
        }
        $('select[name^="entradas"]:disabled').val(0);
        $('.tarifa_container:not(.entrada-selected) label.totalEntradas strong').html('')
        $('select[name^="entradas"]:not(:disabled)').val(1);
    });
}
function setCurrentDate(){
    var d = $("#when-you-go-date").datepicker('getDay'),
        m = $("#when-you-go-date").datepicker('getMonth'),
        y = $("#when-you-go-date").datepicker('getFullYear');
    var when_you_go = MONTHS[m - 1] + " " + d + ", " + y;
    $("#set-when-you-go").html(when_you_go);
}

/*
function follow_me_reservation() {

    var documentHeight = 0;
    var paddingTop = 60;
    var element = ".reservacion-list-content-main:visible";
    var offset = $(element).offset();
    var containerHeight = $(".main_content").height();

    $(window).scroll(function() {
        if ($(document).width() > 974) {
            containerHeight = $(".main_content").height();
            follow(containerHeight, paddingTop, element, offset);
        } else {
            $(element).stop().animate({
                marginTop: 0
            });
        }

    });

    $(window).resize(function() {
        if ($(document).width() > 974) {
            offset.top = 74;
        }
    });

    follow(containerHeight, paddingTop, element, offset);
}

function follow(containerHeight, paddingTop, element, offset) {

    documentHeight = $(document).height();
    var elementHeight = $(element).height();
    if ($(window).scrollTop() > offset.top) {
        var newPosition = ($(window).scrollTop() - offset.top) + paddingTop; //460
        var maxPosition = containerHeight - (elementHeight + 20); //878
        if (newPosition > maxPosition) {
            newPosition = maxPosition;
        }
        $(element).stop().animate({
            marginTop: newPosition
        });
    } else {
        $(element).stop().animate({
            marginTop: 0
        });
    }
    ;
}*/

function fixWidth(){
    $('.reservacion-list-content-main').width($('.reserva-right-side').width() - 30);
}

function follow_me_reservation() {

    var windowWidth = $(window).width();
    var filtrosContainerTop = $('.reservacion-list-content').offset().top;
    var filtrosHeight = $('.reservacion-list-content').height();
    var filtros = $('.reservacion-list-content-main');

    $(window).resize(function() {
        fixWidth();
        windowWidth = $(window).width();
        var filtrosContainerTop = $('.reservacion-list-content-main').offset().top;
        var filtrosHeight = $('.reservacion-list-content').height();
    });
    fixWidth();

    $(window).scroll(function(e){
        var windowTop = $(window).scrollTop();
        var limite = $('.reserva-left-side').offset().top + $('.reserva-left-side').height() - filtrosHeight;
        filtrosHeight = $('.reservacion-list-content-main').height();
        if(limite > filtrosHeight && windowWidth > 800){
            if(windowTop >= filtrosContainerTop && windowTop<limite){
                filtros.css({
                    position:'fixed',
                    top: '5px'
                });
            }else{
                if(windowTop<limite){
                    filtros.css('position','static');
                }else{
                    margin = limite - $('.reserva-left-side').offset().top;
                    filtros.css({
                        position: 'absolute',
                        top: margin
                    }); 
                }
            }
        }else{
            filtros.css('position','static');
        }
    });
}




function calcularTotalExcursiones() {
    $('select[name^="entradas"], input[type=radio][name=ticket]').on('change', function(){
        _this = $(this);

        if($(this).is('select')) {
            if(_this.val() == 0) {
                _this.parents('.tarifa_container').find('label.totalEntradas strong').html(moneyConverter(0));
            } else {
                _this.parents('.tarifa_container').find('label.totalEntradas strong').html(moneyConverter($(this).attr('precio')));
            }
        }
        //while(!_this.hasClass('tarifas-table')) _this = _this.parent();
        _this = _this.parents('.tarifas-table');
        precio = 0;
        _this.find('select[name^="entradas"]:not(:disabled)').each(function(){
            precio += (parseFloat($(this).attr('precio')) * parseFloat($(this).val()));            
        });
        
        if(parseFloat(_this.find('[name=xdec]').val()) > 0) {
            desc = parseFloat(_this.find('[name=xdec]').val());
            precio -= (precio * desc / 100);
        }
        
        _this.find('.subtotal-cell label.precio_total').html(moneyConverter(precio)+' <span class="subprice">('+CURRENCY_USUARIO+convertMoney(precio)+')</span>');


        _this.find('.subtotal-cell input[name=total]').val(precio);
        _this.find('.subtotal-cell input[name=total_format]').val(moneyConverter(precio));
        
        if(precio == 0) {
            _this.parents('form.frmExcursion').find('input[type=submit]').prop('disabled', true);
        } else {
            _this.parents('form.frmExcursion').find('input[type=submit]').prop('disabled', false);
        }
    })
}

function convertMoney(price){
    return parseFloat(price*TASA_DE_CAMBIO).toFixed(2);
}

function calcularTotal(_this) {
        precio = 0;
        _this.find('select[name^="entradas"]:not(:disabled)').each(function(){            
            precio += (parseFloat($(this).attr('precio')) * parseFloat($(this).val()));
        });
        if(parseFloat(_this.find('[name=xdec]').val()) > 0) {
            desc = parseFloat(_this.find('[name=xdec]').val());
            if(desc < 0) desc *= -1;
            descType = _this.find('[name=xtype]').val();
            //console.log(descType, (descType == '%'));
            precio -= ((descType == '%') ? (precio * desc / 100) : desc);
            if(precio < 0)
                precio = 0;
        }
        
        _this.find('.subtotal-cell label.precio_total').html(moneyConverter(precio)+' <span class="subprice">('+CURRENCY_USUARIO+convertMoney(precio)+')</span>');
        _this.find('.subtotal-cell input[name=total]').val(precio);
        _this.find('.subtotal-cell input[name=total_format]').val(moneyConverter(precio));
        
        if(precio == 0) {
            _this.find('input[type=submit]').prop('disabled', true);
        } else {
            _this.find('input[type=submit]').prop('disabled', false);
        }
}

function moneyConverter(cant) {
    var c = parseFloat(cant).toFixed(2);
    c = CURRENCY + ("" + c).replace(".", ",");
    return c;
}

function reservarExcursion() {
    $('form.frmExcursion').on('submit', function(e){
        e.preventDefault();
        data = $(this).serialize();
        $('#blocker div').html(EspereText);
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/ajax-excursion' + END_URL,
            data: data,
            type: 'post',
            dataType: 'json',
            success: function(response) {
                
                if(response.msg == 'ok') {
                    
                    newExc = $('#resumen-reserva-otros .hidden').clone();
                    newExc.find('.excursion-nombre').html(response.data.evento);
                    newExc.find('.excursion-fecha').html(FechaText + ": " + response.data.fecha + " " + ((response.data.hora && response.data.hora.length > 0)? response.data.hora : ""));
                    if(response.data.entradas.length > 0) {
                        for(i=0;i<response.data.entradas.length;i++) {
                            p = newExc.find('.entradas p').first().clone();
                            p.find('strong').html(response.data.entradas[i].descripcion);
                            newExc.find('.entradas').append(p);
                        }
                    }
                    newExc.find('.excursion-precio strong').html(response.data.total_format);
                    newExc.removeClass("hidden");
                    newExc.attr('id', response.data.id);
                    $('[name=cupon]').val('').change();
                    
                    newExc.find('.eliminar-excursion a').on('click', function(ev) {
                        ev.preventDefault();
                        $('#blocker').fadeIn();
                        $.ajax({
                            url: BASE_URL + '/ajax-excursion' + END_URL,
                            data: {action:'eliminar', id:response.data.id, precio_apartamento: $('input[name="precio_apartamento"]').val()},
                            type: 'post',
                            dataType: 'json',
                            success: function(resp) {
                                $('#blocker').fadeOut();
                                if(resp.msg == 'ok') {
                                    $('#' + response.data.id).remove();
                                    //$('#cobrar_' + response.data.id).remove();
                                    $('#precio-total-label').html(resp.data.precioTotal);
                                    $('#panel_cobrar_tarjeta, #panel_cobrar_tarjeta_captcha').html(resp.html);
                                    datosPago(resp.online);
                                }
                            }
                        })
                    });
                    $('#resumen-reserva-otros').append(newExc);
                    
                    $('#precio-total-label').html(response.data.precioTotal);
                    
                    $('#panel_cobrar_tarjeta, #panel_cobrar_tarjeta_captcha').html(response.html);
                    
                    datosPago(response.online);
                    
                    $('#blocker').fadeOut();
                } else {
                    $('#blocker').fadeOut();
                }
            }
        });
    })
}

function validarCupon() {
    $('a.validar_cupon').click(function(e) {
        
        e.preventDefault();
        _this = $(this);
        while(!_this.hasClass('frmExcursion'))_this = _this.parent();
        var cupon = _this.find('input[name=cupon]').val();
        var tarifaId = _this.find('[name=tarifaId]').val();
        var sesion = _this.find('[name=sesion]').val();
        var fecha = _this.find('input[name=fecha]').val();

        if(cupon.trim().length > 0 && fecha.trim().length > 0) {
            var data = { 
                codigo: cupon,
                //tarifaId: tarifaId,
                sesion: sesion,
                fecha: fecha,
                action: 'validarCupon'
            };
            $('#blocker').fadeIn();
            $.ajax({
                type: 'post',
                dataType: 'json',
                data: data,
                url : BASE_URL + '/ajax-excursion' + END_URL,
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.result == 'ok') {
                        //toastr.success(response.msg);
                        _this.find('[name=xdec]').val(parseFloat(response.data.descuento));
                        _this.find('[name=xtype]').val(response.data.descuentoTipo);
                        calcularTotal(_this);
                    } else {
                        toastr.error(invalid_cupon_msg);
                        _this.find('[name=xdec]').val('');
                        _this.find('[name=xtype]').val('');
                        calcularTotal(_this);
                    }
                }
            })
        }
    });
    $('[name=cupon]').change(function(){
        _this = $(this);
        while(!_this.hasClass('frmExcursion'))_this = _this.parent();
        _this.find('[name=xdec]').val('');
        calcularTotal(_this);
    })
}

function eliminarExcursiones() {
    $('.eliminar-excursion a').on('click', function(ev) {
            ev.preventDefault();
            excursionId = $(this).parent().parent().attr('id');
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/ajax-excursion' + END_URL,
                data: {action:'eliminar', id:excursionId, precio_apartamento: $('input[name="precio_apartamento"]').val()},
                type: 'post',
                dataType: 'json',
                success: function(resp) {
                    $('#blocker').fadeOut();
                    if(resp.msg == 'ok') {
                        
                        $('#' + excursionId).remove();
                        $('#cobrar_' + excursionId).remove();
                        $('#precio-total-label').html(resp.data.precioTotal);
                        $('#panel_cobrar_tarjeta, #panel_cobrar_tarjeta_captcha').html(resp.html);
                        datosPago(resp.online);
                        
                    } else {
                        
                    }
                }
            });
        });
}

function datosPago(pagar_ahora) {
    $('.when-you-go-date td.day:not(.disabled)').first().click();
    if(pagar_ahora) {
        $('#pagar_reserva').fadeIn().find('input, select').prop('disabled', false);
        $('#panel_con_captcha').fadeOut();
    } else {
        $('#pagar_reserva').fadeOut().find('input, select').prop('disabled', true);
        $('#panel_con_captcha').fadeIn();
    }
}

function cardValidation() {
    
    var cards = new Array();
    $('ul.cards li').each(function(){
        
        cards.push($(this).attr('card'));
    });
    
    if($('input[name=tarjetaNumero]').length > 0) {
        $('input[name=tarjetaNumero]').attr('valid-card', false);
        $('input[name=tarjetaNumero]').validateCreditCard(function(ev){
                $(".cards li").addClass("off");
                $('input[name=tarjetaNumero]').removeClass('validCreditCard');
                if(ev.card_type==null){
                        $('input[name=tarjetaNumero]').attr('valid-card', false);
                        $('input[name=tarjetaTipo]').val('');
                        return
                }
                $(".cards ." + ev.card_type.name).removeClass("off");
                $('input[name=tarjetaTipo]').val($(".cards ." + ev.card_type.name).attr('title'));
                if(ev.length_valid && ev.luhn_valid) {                
                     $('input[name=tarjetaNumero]').attr('valid-card', true).addClass('validCreditCard');
                     
                     return true;
                }
                return false;
        },
        {accept:cards}
        );
    }
    
}

function terminarReservacion() {
    $('#frmDatos').submit(function(e){
        
        valid = $(this).validationEngine('validate');
        if(valid){
            $('#blocker').fadeIn().find('div').html('Sending data ...');
            return true;
            /*
            data = $(this).serialize() + "&action=insert";
            $.ajax({
                url: BASE_URL + '/ajax-reserva',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        //toastr.success(response.data);
                        //setTimeout(function(){
                            window.location = BASE_URL + '/confirmacion/id:' + $('input[name=idApartamento]').val() + '/r_id:' + response.reserva_id;
                        //}, 3500);
                    } else {
                        toastr.error(response.data);
                    }
                }
            }); */ 
        } else {
            e.preventDefault();
            return false;
        }
        
    })
}

function showRecaptcha() {
    Recaptcha.create("6LcY-uYSAAAAACBIaBBmfEdbYqJxCkDdtOONaeIE", 'captchadiv', {
        tabindex: 1,
        theme: "clean",
        callback: Recaptcha.focus_response_field
    });
}
