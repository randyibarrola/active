var Home = function() {
    var initSimpleSearchOffers = function() {
        var form = $('#simple-search-offers');
        if(form.length > 0) {
            App.bookingDateWidget(form);

            form.bind('app.event.form.submit.before', function(e, data) {
                $('#search-best-prices-modal').modal({
                    backdrop: "static",
                    keyboard: false
                });
            });

            form.submit(function() {
                form.triggerHandler('app.event.form.submit.before', []);


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

            $('#contact').bind('app.event.load.success', function(ev, selector, response, status, xhr) {
                Contact.init($(selector).find('#contact-form'));
            });
        },

        handleMap: function() {
            var map;
            $('#contact-map').html(App.imgLoading);

            if(typeof google != "undefined") {
                var myLatlng = new google.maps.LatLng($('input[name=lat]').val(), $('input[name=lon]').val());
                var icon = '/templates/images/condominium.png';

                var mapOptions = {
                    zoom: 14,
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    scrollwheel: false
                };

                map = new google.maps.Map(document.getElementById('contact-map'), mapOptions);

                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    icon: App.baseUrl + icon
                });

                google.maps.event.trigger(map, 'resize');
                map.setCenter(myLatlng);
                
            }
        }
    };
}();
