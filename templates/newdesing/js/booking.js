var Booking = function() {
    var initSearchRoomForm = function() {
        var form = $('#booking-search-room');

        form.find('button.toggle-dates').toggle(function() {
            form.find('.toggle-dates-menu').eq(0).show();
        }, function() {
            form.find('.toggle-dates-menu').eq(0).hide();
        });

        App.bookingDateWidget(form);
    };

    var initSearchRoomList = function() {
        var list = $('#search-room-result');
        list.children('.item').each(function() {
            initSearchRoomItem($(this));
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

                $('.show-booking-room-modal').click(function() {
                    var clicked = $(this);
                    var form = $('#booking-room-form');

                    form.find('.booking-room-form-room').val(clicked.data('room'));
                    form.find('.booking-room-form-count').val(1);
                    form.find('.booking-room-form-type').val(clicked.data('type'));

                    bookingFormModal.find('.room-title').text(clicked.data('title'));
                    bookingFormModal.find('.widget-plus').attr('data-stop', clicked.data('stock'));
                    bookingFormModal.find('.widget-value').val(1);
                    bookingFormModal.find('.widget-text').text(1);
                    bookingFormModal.find('.current-price').attr('data-basic-price', clicked.data('current-price')).text(clicked.data('current-price').replace('.', ','));
                    bookingFormModal.find('.old-price').attr('data-basic-price', clicked.data('old-price')).text(clicked.data('old-price').replace('.', ','));

                    App.widgetCount(widgetCount);

                    bookingFormModal.modal('show');
                });

                widgetCount.bind('app.event.widget.count.change', function(event, value) {
                    var currentPrice = value * parseFloat(bookingFormModal.find('.current-price').attr('data-basic-price'));
                    var oldPrice = value * parseFloat(bookingFormModal.find('.old-price').attr('data-basic-price'));

                    bookingFormModal.find('.current-price').text(App.formatPrice(currentPrice));
                    bookingFormModal.find('.old-price').text(App.formatPrice(oldPrice));
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

    return {
        init: function(step) {
            if(!step)
                step = 1;

            switch(step) {
                case 1:
                    initSearchRoomForm();
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

            initModals(step);
        }
    };
}();
