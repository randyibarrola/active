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
//            modal.modal('show');
        });

        form.submit(function() {
            form.triggerHandler('app.event.form.submit.before', []);
        });
    };

    var filterSearchRoomList = function(filters) {
        var filtrarAptos = function() {
            var select = $(this);

            if(select.val() == '0') return;
            $('input[name=' + select.attr('id') + ']').each(function(){
                if($(this).val().trim() != select.val().trim()) {
                    $(this).parents('.room_container').addClass('noshow');
                }
            })
        };

        filters.change(function() {
            $('.room_container, .one-apartment').removeClass('noshow');
            filters.each(filtrarAptos);
            $('.one-apartment').each(function(){
                if($(this).find('.room_container.hasnt_description:not(.noshow)').length < 1)
                    $(this).addClass('noshow');
            });

            $('.noshow').fadeOut();
            $('.room_container:not(.noshow), .one-apartment:not(.noshow)').fadeIn();
        });
    };

    var initSearchRoomList = function() {
        var modal = $('#search-best-prices-modal');
        var load = $('#search-room-load');
        load.find('h1').text(App.getI18n('buscando_disponibilidad') + '...');
        window.setTimeout(function(){
            load.find('h1').text(App.getI18n('calculando_tarifa') + '...');
        },2300);

        $.post(App.baseUrl + '/ajax-apartamento' + App.endUrl, function(data) {
            var container = $('#search-room-container');
            container.html(data);

            var items = container.find('.room_container');
            if(items.length > 0) {
                var filters = $('#search-room-filter select.select2');
                App.handleSelect2(filters);
                filterSearchRoomList(filters);
                initSearchRoomItem();
            }
            else {
                var form = $('#booking-search-room');
                var formFields = form.find('.head:eq(0) > .head-dates').eq(0);
                form.find('.jumbotron:eq(0)').append(formFields.clone());
                formFields.remove();
                form.find('.jumbotron:eq(0)').show();
                container.children(':not(#contact, #recommendation-hotels)').remove();
            }
            var contactHolder = $('#contact');
            contactHolder.bind('app.event.load.success', function(ev, selector, response, status, xhr) {
                Contact.init($(selector).find('#contact-form'));
            });
            App.contentAjaxLoad(contactHolder);
            initSearchRoomForm();

            initSuggest();

//            modal.off('shown.bs.modal');
//            modal.modal('hide');
        });
    };

    var initSuggest = function () {
        var listContainer = $('#recommendation-hotels-list');
        var startItem = listContainer.attr('startitem') ? parseInt(listContainer.attr('startitem')) : 0;
        var itemsByPage = listContainer.attr('itemsbypage') ? parseInt(listContainer.attr('itemsbypage')) : 0;
        var totalItems = listContainer.attr('totalitems') ? parseInt(listContainer.attr('totalitems')) : 0;

        var showMix = function() {
            $('.mix').animate({opacity: 1}, 500);
        };

        var hideMix = function(html, page, totalPages) {
            $('.mix').animate({opacity: 0}, 500, function(){
                if(html.trim().length > 0) {
                    listContainer.html(html);
                    showMix();
                    $('#pagination').parent().show();
                    if(page > 0) {
                        $('#pagination').bootstrapPaginator({currentPage:page});
                    }
                    if(totalPages > 1) {
                        $('#pagination').bootstrapPaginator({totalPages:totalPages});
                    } else {
                        $('#pagination').parent().hide();
                    }
                }
            });
        };

        var paginate = function(actual, total) {

            $('#pagination').bootstrapPaginator({
                currentPage:actual,
                totalPages: total,
                alignment: 'center',
                onPageClicked: function(e,originalEvent,type,page){

                    e.stopImmediatePropagation();

                    var currentTarget = $(e.currentTarget);

                    var pages = currentTarget.bootstrapPaginator("getPages");

                    var item = (page - 1) * itemsByPage;

                    $.ajax({
                        url: App.baseUrl + '/admin-ajax-hoteles',
                        data: {action: 'filter', start: item, term: App.get('destino'), hotelId:listContainer.attr('hotel')},
                        type: 'post',
                        dataType: 'json',
                        success: function(response) {
                            hideMix(response.html, page, (response.hoteles.count / response.hoteles.limit) + ((response.hoteles.count % response.hoteles.limit > 0) ? 1 : 0));
                        }
                    })
                }
            })
        };

        showMix();
        paginate(parseInt(startItem/itemsByPage) + 1, parseInt(totalItems/itemsByPage) + ((totalItems%itemsByPage == 0) ? 0 : 1));
    };

    var initSearchRoomItem = function() {
        var calcularReglas = function() {
            var REGLAS = eval($('#reglas').val());
            $('p.by_this_booking.cupon').parent().hide();
            if(typeof REGLAS == 'object') {

                $('.room_container:not(.has_description)').each(function(){
                    precio = $(this).find('.precio_total span').html();

                    precio = precio.replace(App.currency, '');

                    precio = parseFloat(precio);

                    for(i=REGLAS.length - 1;i >= 0; i--) {
                        regla = REGLAS[i];
                        if(precio > parseFloat(regla.monto)) {
                            $(this).find('.monto_regla').html(App.currency + ' ' + regla.monto);
                            descuento = (regla.tipoDescuento == '%') ? (regla.descuento + regla.tipoDescuento) : (App.currency + ' ' + regla.descuento);
                            $(this).find('.descuento_regla').html(descuento);
                            $(this).find('p.by_this_booking.cupon').parent().show();
                            break;
                        }
                    }

                })

            }
        };

        $('span[data-toggle="popover"]').popover({trigger:'hover'});

        $('.cantidad_select').change(function(){
            var tarifas = eval($(this).parents('.room_container').find('input.precio_tarifas').val());
            var tarifas_sin_descuento = eval($(this).parents('.room_container').find('input.precio_tarifas_sin_descuento').val());
            $(this).parents('.room_container').find('.precio_total span').html(tarifas[$(this).val()-1]);
            if(tarifas_sin_descuento)
                $(this).parents('.room_container').find('.precio_total_sin_descuento span').html(tarifas_sin_descuento[$(this).val()-1]);
            calcularReglas();
        });

        $('.toggle_detalles').toggle(function() {
            var that = $(this);
            $(this).parents('.row').eq(0).find('.descripcion_table').show();
            that.html('- '+App.getI18n('ocultar_detalle'));
        }, function() {
            var that = $(this);
            $(this).parents('.row').eq(0).find('.descripcion_table').hide();
            that.html('+ '+App.getI18n('mostrar_detalle'));
        });
        calcularReglas();

        App.handleSlider($('.flexslider'));
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
        }
    };

    var initSearchTourList = function() {
        var list = $('#search-tour-result');
        list.children('.item').each(function() {
            initSearchTourItem($(this));
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

    var affixBookingAbstract = function() {
        var windowWidth = $(window).width();
        var bookingContent = $('#bookingContent');
        var filtersContainerTop = bookingContent.offset().top;
        var filtersHeight = bookingContent.height();
        $(window).scroll(function(e){
            var affix = $('#booking-info');
            var windowTop = $(window).scrollTop();
            var limite = affix.offset().top + affix.height() - filtrosHeight;
            filtrosHeight = bookingContent.height();
            if(limite > filtrosHeight && windowWidth > 800){
                if(windowTop >= filtersContainerTop && windowTop<limite){
                    bookingContent.css({
                        position:'fixed',
                        top: '5px'
                    });
                }else{
                    if(windowTop<limite){
                        bookingContent.css('position','static');
                    }else{
                        margin = limite - affix.offset().top;
                        bookingContent.css({
                            position: 'absolute',
                            top: margin
                        });
                    }
                }
            }else{
                bookingContent.css('position','static');
            }
        });
    };

    return {
        init: function(step) {
            if(!step)
                step = 1;

            initModals(step);
//            affixBookingAbstract();

            switch(step) {
                case 1:
                    initSearchRoomList();
                    break;
                case 2:
                    initSearchTourList();
                    break;
                case 3:
                    break;
                default:
                    break;
            }
        }
    };
}();
