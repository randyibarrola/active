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
        }
    };

    var initSearchTourList = function() {
        var affix = $('.booking-tour-content > .head:eq(0)');
        var affixTop = affix.offset().top;
        $(document).scroll(function(e){
            var windowTop = $(window).scrollTop();
            if(affixTop + 50 < windowTop){
                if(!affix.hasClass('affix-top')) {
                    affix.addClass('affix-top');
                }
                affix.css('width', affix.parents('.booking-tour-content').eq(0).css('width'))
            }else{
                affix.removeClass('affix-top');
                affix.css('width', 'auto');
            }
        });

        $('#booking-tour-form').submit(function() {
            $('.booking-tour-content').hide();
            if(Booking.initStep[2]) {
                Booking.initStep[2] = false;
                Booking.init(3);
            }
            $('.booking-confirm-content').show();

            return false;
        });

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

    var initBookingConfirmForm = function() {
        var form = $('#booking-confirm-form');

        form.submit(function(e){
            var valid = $(this).validationEngine('validate');
            if(valid) {
                $('#send-confirm-modal').modal('show');
                return true;
            }
            else {
                e.preventDefault();
                return false;
            }

        });

        $('#go-to-tour-list').click(function() {
            $('.booking-confirm-content').hide();
            $('.booking-tour-content').show();
        });
    };

    var initRoomDetails = function() {
        $('#show-room-more-info').toggle(function() {
            $('#room-more-info').show();
            $(this).text('- ' + App.getI18n('ocultar_detalle'));
        }, function() {
            $('#room-more-info').hide();
            $(this).text('+ ' + App.getI18n('mostrar_detalle'));
        });
        App.handleSlider(item.find('.flexslider'));
    };

    return {
        init: function(step) {
            if(!step)
                step = 1;

            initModals(step);

            switch(step) {
                case 1:
                    initSearchRoomList();
                    $('#contact').bind('app.event.load.success', function(ev, selector, response, status, xhr) {
                        Contact.init($(selector).find('#contact-form'));
                    });
                    break;
                case 2:
                    initSearchTourList();
                    initRoomDetails();
                    break;
                case 3:
                    initBookingConfirmForm();
                    break;
                default:
                    break;
            }
        },

        initStep: [false, false, true]
    };
}();
