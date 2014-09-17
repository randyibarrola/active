var Home = function() {
    var initSimpleSearchOffers = function() {
        var form = $('#simple-search-offers');
        if(form.length > 0) {
            App.bookingDateWidget(form);

            form.bind('app.event.form.submit.before', function(e, data) {
                $('#search-best-prices-modal').modal('show');
            });

            form.submit(function() {
                form.triggerHandler('app.event.form.submit.before', []);

                return false;
            });
        }
    };

    var initFreeOffer = function() {
        var holder = $('#home-free-offer');

        holder.mouseenter(function() {
            holder.find('.home-free-offer-price').hide();
            holder.find('.btn').show();
        }).mouseleave(function() {
                holder.find('.btn').hide();
                holder.find('.home-free-offer-price').show();
        });
    };

    var initTourBookingForm = function() {
        var form = $('#tour-booking-form');

        var changesPrice = form.find("select.change-price");
        var pricePerPerson = parseFloat(form.find('input.input-price-per-person').eq(0).val());
        var widgetTotalPrice = form.find('input.input-total-price').eq(0);

        widgetTotalPrice.change(function() {
            var value = App.formatPrice($(this).val());

            form.find('#tourBookingFormTotalPrice').html(value);
        });

        changesPrice.each(function() {
            $(this).change(function() {
                calculatePrice();
            });
        });

        var calculatePrice = function() {
            var price = 0;
            changesPrice.each(function() {
                price += pricePerPerson * parseInt($(this).val());
            });

            widgetTotalPrice.val(price).trigger('change');
        };

        calculatePrice();
    };

    return {
        init: function() {
            initSimpleSearchOffers();
            initFreeOffer();
            initTourBookingForm();
        }
    };
}();
