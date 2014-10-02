var Booking = function() {
    var initSearchRoomForm = function() {
        var form = $('#booking-search-room');

        form.find('button.toggle-dates').toggle(function() {
            form.find('.toggle-dates-menu').eq(0).show();
        }, function() {
            form.find('.toggle-dates-menu').eq(0).hide();
        });

        App.bookingDateWidget(form);

        form.bind('app.event.form.submit.before', function(e, data) {
            var modal = $('#search-best-prices-modal');
            modal.find('.modal-body > h1').text(App.getI18n('buscando_su_mejor_tarifa'));
            modal.modal('show');
        });

        form.submit(function() {
            form.triggerHandler('app.event.form.submit.before', []);
        });
    };

    var filterSearchRoomList = function(list, filters) {
        $(filters).each(function() {
            var e = $(this);
            e.change(function() {
                var pensionValue = e.attr('id') == 'search-room-filter-pension' ? e.val().trim() : $('#search-room-filter-pension').val().trim();
                var paxValue = e.attr('id') == 'search-room-filter-pax' ? e.val().trim() : $('#search-room-filter-pax').val().trim();

                $.each(list, function() {
                    var item = $(this);
                    var flag = true;

                    var dataFilterPax = item.find('.filter-pax-value').text().trim();
                    if(flag && paxValue != '0') {
                        flag = dataFilterPax == paxValue;
                    }

                    if(flag && pensionValue != '0') {
                        var bookingOptions = item.find('.booking-options .option');
                        bookingOptions.each(function() {
                            var option = $(this);
                            option.removeClass('hidden');
                            if(option.children('h5').text().trim() != pensionValue) {
                                option.addClass('hidden');
                            }
                        });
                    }
                    else {
                        item.find('.booking-options .option').removeClass('hidden');
                    }

                    flag = flag && item.find('.booking-options:eq(0) > .hidden').length < item.find('.booking-options:eq(0) > .option').length;

                    if(flag) {
                        item.show();
                    }
                    else {
                        item.hide();
                    }
                });
            });
        });
    };

    var initSearchRoomList = function() {
        var modal = $('#search-best-prices-modal');
        modal.find('.modal-body > h1').text(App.getI18n('buscando_disponibilidad') + '...');
        modal.on('shown.bs.modal', function (e) {
            window.setTimeout(function(){
                modal.find('.modal-body > h1').text(App.getI18n('calculando_tarifa') + '...');
            },2300);
        });
        modal.modal('show');

        $.post(App.baseUrl + '/ajax-apartamento' + App.endUrl, function(data) {
            var container = $('#search-room-container');
            container.html(data);

            var items = container.find('#search-room-result > .item');
            if(items.length > 0) {
                var filters = $('#search-room-filter select.select2');
                App.handleSelect2(filters);
                filterSearchRoomList(items, filters);
                items.each(function() {
                    initSearchRoomItem($(this));
                });

                App.contentAjaxLoad($('#contact'));
            }
            else {
                var form = $('#booking-search-room');
                var formFields = form.find('.head:eq(0) > .head-dates').eq(0);
                form.find('.jumbotron:eq(0)').append(formFields.clone());
                formFields.remove();
                form.find('.jumbotron:eq(0)').show();
                container.empty();
                $('#contact').remove();
            }
            initSearchRoomForm();

            modal.off('shown.bs.modal');
            modal.modal('hide');

//
//            $('.cantidad_select').change(function(){
//                var tarifas = eval($(this).parents('.room_container').find('input.precio_tarifas').val());
//                var tarifas_sin_descuento = eval($(this).parents('.room_container').find('input.precio_tarifas_sin_descuento').val());
//                $(this).parents('.room_container').find('.precio_total span').html(tarifas[$(this).val()-1]);
//                if(tarifas_sin_descuento)
//                    $(this).parents('.room_container').find('.precio_total_sin_descuento span').html(tarifas_sin_descuento[$(this).val()-1]);
//                calcularReglas();
//            });
//            $('.toggle_detalles').click(function(){
//                var that = $(this);
//                $(this).parents('.row').find('.descripcion_table').toggle(function(){
//                    if($(this).is(':visible')){
//                        that.html('- '+OCULTAR_DETALLE);
//                    }else{
//                        that.html('+ '+MOSTRAR_DETALLE);
//                    }
//                    return true;
//                });
//            });
//            calcularReglas();
//            $('select.apto-filter').change(filtros);
//
//            //hoteles - destino
//            startItem = parseInt($('.hotel_list').attr('startitem'));
//            itemsByPage = parseInt($('.hotel_list').attr('itemsbypage'));
//            totalItems = parseInt($('.hotel_list').attr('totalitems'));
//            showMix();
//            paginate(parseInt(startItem/itemsByPage) + 1, parseInt(totalItems/itemsByPage) + ((totalItems%itemsByPage == 0) ? 0 : 1));
//
//            $('[data-toggle=popover]').popover({trigger:'hover'});
        });
    };

    var initSearchRoomItem = function(item) {
        var link = item.find('.more-info').eq(0);
        link.toggle(function() {
            link.children('span').text(link.attr('data-minus'));
            link.children('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
            item.find('.more-info-content').slideDown();
        }, function() {
            link.children('span').text(link.attr('data-more'));
            link.children('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-down');
            item.find('.more-info-content').slideUp();
        });

        App.handleSlider(item.find('.flexslider'));

//        item.find('.show-booking-room-modal').each(function() {
//            var clicked = $(this);
//            clicked.click(function() {
//                var form = $('#booking-room-form');
//
//                form.find('.booking-room-form-room').val(clicked.data('room'));
//                form.find('.booking-room-form-count').val(1);
//                form.find('.booking-room-form-type').val(clicked.data('type'));
//
//                var bookingFormModal = $('#booking-room-modal');
//                bookingFormModal.find('.room-title').text(clicked.data('title'));
//                bookingFormModal.find('.widget-plus').attr('data-stop', clicked.data('stock'));
//                bookingFormModal.find('.widget-value').val(1);
//                bookingFormModal.find('.widget-text').text(1);
//                bookingFormModal.find('.current-price').attr('data-basic-price', clicked.data('current-price')).text(clicked.data('current-price').replace('.', ','));
//                bookingFormModal.find('.old-price').attr('data-basic-price', clicked.data('old-price')).text(clicked.data('old-price').replace('.', ','));
//
//                var widgetCount = bookingFormModal.find('#booking-room-modal-widget-count');
//                App.widgetCount(widgetCount);
//
//                bookingFormModal.modal('show');
//            });
//        });
    };

    var initModals = function(step) {
        switch(step) {
            case 1:
                var bookingFormModal = $('#booking-room-modal');
                bookingFormModal.modal({
                    show: false
                }).on('show.bs.modal', function (e) {
                    bookingFormModal.find('button').eq(0).off().click(function() {
                        bookingFormModal.modal('hide');
                        $('#booking-room-form').trigger('submit');
                    });
                });

                var widgetCount = bookingFormModal.find('#booking-room-modal-widget-count');

                widgetCount.bind('app.event.widget.count.change', function(event, value) {
                    var currentPrice = value * parseFloat(bookingFormModal.find('.current-price').attr('data-basic-price'));
                    var oldPrice = value * parseFloat(bookingFormModal.find('.old-price').attr('data-basic-price'));

                    bookingFormModal.find('.current-price').text(App.formatPrice(currentPrice));
                    bookingFormModal.find('.old-price').text(App.formatPrice(oldPrice));
                });

                var searchRoomModal = $('#search-best-prices-modal');
                searchRoomModal.modal({
                    backdrop: "static",
                    keyboard: false,
                    show: false
                });

                break;
            case 3:
                var bookingConfirmFormModal = $('#send-confirm-modal');
                bookingConfirmFormModal.modal({
                    backdrop: "static",
                    keyboard: false,
                    show: false
                });
                break;
            case 4:
                var cancelLoadModal = $('#load-cancel-modal');
                cancelLoadModal.modal({
                    backdrop: "static",
                    keyboard: false,
                    show: false
                });

                var cancelConfirmModal = $('#cancelar_modal');
                cancelConfirmModal.modal({
                    show: false
                }).on('show.bs.modal', function (e) {
                    $('#aceptarCancelar').click(function(e){
                        $('#cancelar_modal').modal('toggle');
                        cancelLoadModal.modal('show');
                        var id = $('#idCancelar').val();
                        $.ajax({
                            url: App.baseUrl + '/ajax-reserva',
                            data: {id:id, action:'cancelar'},
                            type: 'post',
                            dataType: 'json',
                            success: function(response) {
                                cancelLoadModal.modal('hide');
                                if(response.msg == 'ok') {
                                    toastr.success(response.data);
                                    setTimeout(function(){
                                        window.location = App.baseUrl + '/cancelacion/id:' + id + App.endUrl;
                                    }, 3000);
                                } else {
                                    toastr.error(response.data);
                                }
                            }
                        });
                    });
                });
                break;
        }
    };

    var initSearchTourList = function() {
        var affix = $('#booking-tour-head');
        var affixTop = affix.offset().top;
        $(document).scroll(function(e){
            var windowTop = $(window).scrollTop();
            if(affixTop + 50 < windowTop){
                if(!affix.hasClass('affix-top')) {
                    affix.addClass('affix-top');
                }
                affix.css('width', affix.siblings('#booking-content').eq(0).css('width'));
            }else{
                affix.removeClass('affix-top');
                affix.css('width', 'auto');
            }
        });

        $('#booking-tour-form').submit(function() {
            affix.hide();
            $('.booking-tour-content').hide();
            if(Booking.initStep[2]) {
                Booking.initStep[2] = false;
                Booking.init(3);
            }
            var active = $('.booking-confirm-content');
            active.show();
            App.scrollTo(active);

            return false;
        });

        var list = $('#search-tour-result');
        list.children('.item').each(function() {
            initSearchTourItem($(this));
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
    };

    var initSearchTourItem = function(item) {
        var link = item.find('a.show-booking-tour-form').eq(0);
        link.toggle(function() {
            link.children('span').text(link.attr('data-minus'));
            link.children('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
            item.find('.more-info-content').slideDown();
        }, function() {
            link.children('span').text(link.attr('data-more'));
            link.children('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-down');
            item.find('.more-info-content').slideUp();
        });

        item.find('button.show-booking-tour-form').eq(0).click(function() {
            link.trigger('click');
        });

        var form = item.find('.booking-add-tour-form').eq(0);
        form.bind('app.event.form.init', function(e, data) {
            var widgetAdultCount = form.find('select.adult-count').eq(0);
            var widgetChildCount = form.find('select.child-count').eq(0);
            var totalPriceText = form.find('label.total-price').eq(0);
            var widgetDiscount = form.find('input.discount').eq(0);
            if(widgetDiscount.attr('value') == undefined) {
                widgetDiscount.val(0);
            }
            var btnDiscountCode = form.find('button.btn-discount-code').eq(0);
            var widgetDiscountCode = form.find('input.discount-code').eq(0);

            widgetAdultCount.change(function() {
                var widget = $(this);
                var subPriceText = $(this).siblings('.sub-price').eq(0);
                var basicPrice = parseFloat($(this).siblings('.adult-price').eq(0).val());
                subPriceText.find('span').eq(0).text(App.formatPrice(parseInt(widget.val()) * basicPrice));

                changeTotalPrice();
            });

            widgetChildCount.change(function() {
                var widget = $(this);
                var subPriceText = $(this).siblings('.sub-price').eq(0);
                var basicPrice = parseFloat($(this).siblings('.child-price').eq(0).val());
                subPriceText.find('span').eq(0).text(App.formatPrice(parseInt(widget.val()) * basicPrice));

                changeTotalPrice();
            });

            widgetDiscount.change(function() {
                changeTotalPrice();
            });

            btnDiscountCode.click(function() {
                if(widgetDiscountCode.val().trim() != "") {
                    var holder = $(this).parents('.input-group').eq(0);
                    var validateHolder = holder.siblings('.discount-validate').eq(0);
                    var removeCode = validateHolder.find('i').eq(0);

                    // La variable data debe obtenerse mediante una petición ajax con el formato siguiente:
                    var data = {
                        valid: true,
                        type: 'percent',
                        value: 10,
                        msgError: 'Código incorrecto'
                    };

                    if(data.valid) {
                        widgetDiscount.val(data.value);
                        widgetDiscount.data('discount-type', data.type);
                        validateHolder.find('label').eq(0).text("-" + App.formatPrice(data.value) + (data.type == 'number' ? App.currency : '%'));
                        validateHolder.prepend($('<span></span>').addClass('code').text(widgetDiscountCode.val() + ':'));
                        holder.hide();
                        validateHolder.show();

                        removeCode.unbind('click').click(function() {
                            widgetDiscount.val(0);
                            widgetDiscountCode.val('');
                            validateHolder.find('span.code').remove();
                            validateHolder.hide();
                            holder.show();

                            changeTotalPrice();
                        });

                        changeTotalPrice();
                    }
                }
            });

            var changeTotalPrice = function() {
                var basicAdultPrice = parseFloat(widgetAdultCount.siblings('.adult-price').eq(0).val());
                var countAdult = parseInt(widgetAdultCount.val());
                var basicChildPrice = parseFloat(widgetChildCount.siblings('.child-price').eq(0).val());
                var countChild = parseInt(widgetChildCount.val());

                var basicTotalPrice = (countAdult * basicAdultPrice) + (countChild * basicChildPrice);
                var discountPrice = widgetDiscount.data('discount-type') && widgetDiscount.data('discount-type') == 'percent' && parseFloat(widgetDiscount.val()) != 0
                    ? parseFloat(widgetDiscount.val()) * basicTotalPrice / 100
                    : basicTotalPrice - parseFloat(widgetDiscount.val());

                totalPriceText.find('span').eq(0).text(App.formatPrice(discountPrice));
            };

            changeTotalPrice();

            form.submit(function() {
                form.triggerHandler('app.event.form.submit.success', []);

                return false;
            });
        });

        form.bind('app.event.form.submit.success', function(e, data) {
            //Aquí se agrega el tour a la reserva. De momento solo se elimina el tour de la lista.
            item.remove();
        });

        form.triggerHandler('app.event.form.init', []);
    };

    var initBookingConfirmForm = function() {
        
        cardValidation();
        var form = $('#booking-confirm-form');

        form.find('input[name="nombre"], input[name="apellido"]').change(function() {
            form.find('input[name="titular"]:eq(0)').val(form.find('input[name="nombre"]:eq(0)').val().trim() + ' ' + form.find('input[name="apellido"]:eq(0)').val().trim());
        });

        form.find('input[name="email"]').change(function() {
            form.find('#send-email').text($(this).val().trim());
        });

        form.submit(function(e){
            var valid = $(this).validationEngine('validate');
            if(valid) {
                $('#send-confirm-modal').modal('show');
                return true;
            }
            else {
                e.preventDefault();
                form.find('.select2-container').removeClass('validate[required]');
                return false;
            }

        });

        $('#go-to-tour-list').click(function() {
            $('.booking-confirm-content').hide();
            $('#booking-tour-head').show();
            $('.booking-tour-content').show();
        });
        
        initRoomDetails($('.reserva-description'));        
    };

    var initRoomDetails = function(item) {
        $('#show-room-more-info').toggle(function() {
            $('#room-more-info').show();
            $(this).text('- ' + App.getI18n('ocultar_detalle'));
        }, function() {
            $('#room-more-info').hide();
            $(this).text('+ ' + App.getI18n('mostrar_detalle'));
        });
        App.handleSlider(item.find('.flexslider'));
    };
    
    var cardValidation = function(){
            
            var cards = new Array();
            /*$('ul.cards li').each(function(){

                cards.push($(this).attr('card'));
            });*/
            //ponemos alternativamente los valores fijos pues no estan en el nuevo maquetado
             cards.push('visa');
             cards.push('mastercard');

            if($('input[name=tarjetaNumero]').length > 0) {
                $('input[name=tarjetaNumero]').attr('valid-card', false);
                $('input[name=tarjetaNumero]').validateCreditCard(function(ev){
                        //$(".cards li").addClass("off");
                        $('input[name=tarjetaNumero]').removeClass('validCreditCard');
                        if(ev.card_type==null){
                                $('input[name=tarjetaNumero]').attr('valid-card', false);
                                $('input[name=tarjetaTipo]').val('');
                                return
                        }
                        //$(".cards ." + ev.card_type.name).removeClass("off");
                        $('input[name=tarjetaTipo]').val($(".cards ." + ev.card_type.name).attr('title'));
                        $('input[name=tarjetaTipo]').val(ev.card_type.name);
                        if(ev.length_valid && ev.luhn_valid) {                
                             $('input[name=tarjetaNumero]').attr('valid-card', true).addClass('validCreditCard');

                             return true;
                        }
                        return false;
                },
                {accept:cards}
                );
            }
    };

    var initConfirmPage = function() {
        $('#cancelarBtn').click(function(e){
            $('#cancelar_modal').modal();
        });
    };

    var affixBookingAbstract = function() {
        var windowWidth = $(window).width();
        var affix = $('#booking-info');

        $(window).resize(function() {
            windowWidth = $(window).width();
            affix.css({
                width: (affix.parent('div:eq(0)').width()) + 'px'
            });
            if(windowWidth <= 728) {
                affix.css({
                    position: 'relative',
                    top: 'inherit'
                });
            }
        });

        var bookingContent = $('#booking-content');

        $(window).scroll(function(e){
            var windowTop = $(window).scrollTop();
            var bookingContentTop = bookingContent.offset().top;
            var bookingContentHeight = bookingContent.height();
            var limit = bookingContentTop + bookingContentHeight;

            if(windowWidth > 728) {
                if(windowTop > bookingContentTop && limit - affix.height() > windowTop){
                    affix.css({
                        position: 'fixed',
                        top: '5px',
                        width: (affix.parent('div:eq(0)').width()) + 'px'
                    });
                }
                else if(windowTop <= bookingContentTop) {
                    affix.css({
                        position: 'relative',
                        top: 'inherit'
                    });
                }
                else {
                    affix.css({
                        position: 'absolute',
                        overflow: 'hidden',
                        top: (bookingContentHeight - affix.height()) + 'px'
                    });
                }
            }
        });

        $(window).trigger('scroll');
    };

    return {
        init: function(step) {
            if(!step)
                step = 1;

            initModals(step);
            affixBookingAbstract();

            switch(step) {
                case 1:
                    initSearchRoomList();
                    $('#contact').bind('app.event.load.success', function(ev, selector, response, status, xhr) {
                        Contact.init($(selector).find('#contact-form'));
                    });
                    break;
                case 2:
                    initSearchTourList();
                    initRoomDetails($('.reserva-description'));
                    break;
                case 3:
                    initBookingConfirmForm();
                    break;
                case 4:
                    initConfirmPage();
                    break;
                default:
                    break;
            }
        },

        initStep: [false, false, true]
    };
}();
