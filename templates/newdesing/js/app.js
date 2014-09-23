var App = function () {
    var initScrolls = function() {
        $('#scroll-top').click(function(e) {
            e.preventDefault();
            App.scrollTop();
        });

        $('.scroll-to').click(function(e) {
            e.preventDefault();

            var offset = $(this).attr('data-offset') ? parseInt($(this).attr('data-offset')) : 0;

            if($(this).attr('href'))
                App.scrollTo($($(this).attr('href')), offset);
            else if($(this).attr('data-href'))
                App.scrollTo($($(this).attr('data-href')), offset);
        });


        $('.scroll-content').each(function () {
            $(this).niceScroll({
                cursorcolor: '#c9c9c9',
                cursorwidth: 7,
                autohidemode: false
            });
        });
    };

    var initAppDropdownChoices = function() {
        $('.app-dropdown-choice').each(function() {
            var e = $(this);
            var text = e.find('.dropdown-selected').eq(0);
            var menu = e.find('.dropdown-menu').eq(0);

            menu.find('li').click(function() {
                var li = $(this);
                text.html(li.attr('data-selected'));

                li.siblings('li').removeClass('disabled');
                li.addClass('disabled');

                e.triggerHandler('app.event.dropdown.change', [li]);
            });
        });
    };

    var loadAjaxContent = function() {
        $('.app-ajax-load').each(function() {
            App.contentAjaxLoad($(this));
        });
    };

    var initSliders = function() {
        if(jQuery().flexslider) {
            $('#home-slider-hotel-carousel').flexslider({
                animation: "fade",
                controlNav: false,
                animationLoop: false,
                slideshow: false,
                itemWidth: 210,
                itemMargin: 5,
                asNavFor: '#home-slider-hotel-slider'
              }); 
            
            $('#home-slider-hotel-slider').flexslider({
                animation: "fade",
                controlNav: "thumbnails",
                slideshow: false,
                sync: "#home-slider-hotel-slider"
            });
            
           
            /*
            $('.flexslider-scn-carousel').each(function() {
                var e = $(this);
                e.flexslider({
                    animation: "fade",
                    controlNav: false,
                    animationLoop: false,
                    slideshow: false,
                    itemWidth: parseInt(e.attr('data-itemwidth')),
                    itemMargin: 5,
                    asNavFor: e.attr('data-asnavfor')
                })
            });
            
            $('.flexslider-scn-slider').each(function() {
                var e = $(this);
                e.flexslider({
                    animation: "slide",
                    controlNav: false,
                    animationLoop: true,
                    slideshow: false,
                    sync: e.attr('data-sync')
                })
            });*/
        }
    };

    var initWidgetCount = function() {
        $('.app-widget-count').each(function() {
            App.widgetCount($(this));
        });
    };

    var handleTooltips = function () {
        if (App.isTouchDevice()) { // if touch device, some tooltips can be skipped in order to not conflict with click events
            jQuery('.tooltips:not(.no-tooltip-on-touch-device)').tooltip();
        } else {
            jQuery('.tooltips').tooltip();
        }
    };

    var initGlobalSearchForm = function() {
        var form = $('#global-search-form');
        var widgetTypeahead = form.find('input.typeahead').eq(0);
        var widgetSelectedItem = form.find('input.selected-item').eq(0);

        $('#display-global-search').toggle(function() {
            widgetTypeahead.focus();
            form.show();
        }, function() {
            form.hide();
        });

        var map = {};
        var items = [];
        var selectedItem = {};

        widgetTypeahead.typeahead({
            source: function(query, process) {
                items = [];
                map = {};

                if(query.trim() != '') {
                    $.ajax({
                        url: App.baseUrl + '/admin-ajax-hoteles',
                        type: 'post',
                        data: { action:'search', term: query, nodestinos: 1 },
                        dataType: 'json',
                        success: function(response) {
                            if(response.lista.length > 0) {
                                for(i = 0; i< response.lista.length ; i++) {
                                    map[response.lista[i].nombre] = response.lista[i];
                                    items.push(response.lista[i].nombre);
                                }
                            } else {
                                items = [widgetTypeahead.data("noresult")];
                            }

                            console.log(items.toSource());

                            widgetSelectedItem.val('');
                            process(items);
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            items = [];
                            widgetSelectedItem.val('');
                            process(items);
                        }
                    });
                }
                else {
                    process(items);
                }
            },
            matcher: function(item) {
                var flag = false;
                if (item.toLowerCase().indexOf(this.query.trim().toLowerCase()) != -1 || item == widgetTypeahead.data('noresult')) {
                    flag = true;
                }

                return flag;
            },
            sorter: function(items) {
                return items.sort();
            },
            updater: function(item) {
                selectedItem = map[item];

                if(selectedItem) {
                    var url = selectedItem.url;
                    if(url.replace('http', '').length == url.length)
                        url = 'http://' + url;


                    widgetSelectedItem.val(url);

                    window.location = url;
                }
                else {
                    item = '';
                }

                return item;
            }
        });

        form.submit(function(e) {
            e.preventDefault();
        });
    };

    var initModals = function() {
        $('#cookies_modal, #privacidad_modal').each(function() {
            var modal = $(this);
            var modalBody = modal.find('.modal-body').eq(0);
            modal.on('show.bs.modal', function (e) {
                if(modalBody.children().length == 0) {
                    modalBody.append(App.imgLoading);
                    var idTarget = '#' + modal.attr('id');
                    var relatedTarget = $("a[data-target=" + idTarget + "]").eq(0);
                    $.ajax({
                        url: App.baseUrl + '/ajax-popup',
                        data: {id: relatedTarget.attr('data-content')},
                        type: 'get',
                        dataType: 'json',
                        success: function(response) {
                            modalBody.html(response.data);
                        }
                    });
                }
            });
        });
    };

    var handleAppCookies = function() {
        var vikahotelCookie = function() {
            $('#app-accept-cookies').hide();
            App.setCookie('accept-vikahotel-cookie', 1, 365);
        };

        if(!App.checkCookie('accept-vikahotel-cookie', 1)) {
            $('#app-accept-cookies').slideDown('fast');
            $('#app-accept-cookies-btn').click(function(e){
                e.preventDefault();
                vikahotelCookie();
                return false;
            });

            $('#main-content-theme *').click(function(e){
                vikahotelCookie();
            })
        }
    };

    var initSelect2 = function(selector) {
        selector = selector != undefined ? $(selector) : $('.select2');

        if(jQuery().select2) {
            selector.each(function() {
                $(this).select2({
                    allowClear: true
                });
            });
        }
    };

    return {
        dateFormat: "dd-mm-yyyy",
        locale: 'es',
        currency: '€',
        userCurrency: '€',
        changeTax: {},
        baseUrl: 'http://localhost',
        endUrl: '',
        configBooking: {
            minSojourn: 1,
            prevSelling: 0,
            dateStopSelling: [],
            agreementEndDate: false
        },

        //main function to initiate template pages
        init: function () {
            initAppDropdownChoices();
            initScrolls();
            initSliders();
            initWidgetCount();
            handleTooltips();
            initGlobalSearchForm();
            initModals();
            handleAppCookies();
            initSelect2();

            if(jQuery().datepicker) {
                jQuery().datepicker.defaults.format = App.dateFormat;
                jQuery().datepicker.defaults.language = App.locale;
            }

            var ajaxLoading = $('#ajax-loading').clone();
            ajaxLoading.show();
            App.imgLoading = ajaxLoading;

            loadAjaxContent();
        },

        // wrapper function to scroll to an element
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                scrollTop: pos + (offeset ? offeset : 0)
            }, 'slow');
        },

        scrollTop: function () {
            App.scrollTo();
        },

        formatDate: function(date) {
            var format = App.dateFormat;

            var day = date.getDate() <= 9 ? "0" + date.getDate() : date.getDate();
            var month = date.getMonth() + 1 <= 9 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var year = date.getFullYear();

            format = format.replace(/dd/g, day);
            format = format.replace(/mm/g, month);
            format = format.replace(/yyyy/g, year);

            return format;
        },

        parseDate: function(str) {
            var format = App.dateFormat;

            var rangeDay = [format.search(/dd/g), format.search(/dd/g) + 2];
            var rangeMonth = [format.search(/mm/g), format.search(/mm/g) + 2];
            var rangeYear = [format.search(/yyyy/g), format.search(/yyyy/g) + 4];

            return new Date(parseInt(str.substring(rangeYear[0], rangeYear[1])), parseInt(str.substring(rangeMonth[0], rangeMonth[1])) - 1, parseInt(str.substring(rangeDay[0], rangeDay[1])), 0, 0, 0, 0);
        },

        imgLoading: "",

        contentAjaxLoad: function(selector) {
            var href = $(selector).attr('data-href') != 'undefined' ? $(selector).attr('data-href') : $(selector).attr('href');

            selector.append(App.imgLoading);
            $(selector).load(href, function(response, status, xhr) {
                $(selector).triggerHandler('app.event.load.success', [selector, response, status, xhr]);
            });
        },

        bookingDateWidget: function(form) {
            var widgetCheckin = $(form).find('.app-booking-date-start').eq(0);
            var widgetCheckout = $(form).find('.app-booking-date-end').eq(0);
            var spanDateDiff = $(form).find('.app-booking-date-diff').eq(0);
            var nowTemp = new Date();
            var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

            var start_check_in = widgetCheckin.val().trim() != ''
                ? App.parseDate(widgetCheckin.val())
                : new Date(new Date(now).setDate(now.getDate() + App.configBooking.prevSelling));

            var checkin = widgetCheckin.datepicker({
                startDate: start_check_in,
                autoclose: true,
                onRender: function(date) {
                    return date.valueOf() < now.valueOf() ? 'disabled' : '';
                },
                beforeShowDay: function(date) {
                    var formated_day = App.formatDate(date);
                    return $.inArray(formated_day, App.configBooking.dateStopSelling) > 0 ? 'disabled' : '';
                }
            }).on('changeDate', function(ev) {
                    var newDate = new Date(ev.date);
                    newDate.setDate(newDate.getDate() + App.configBooking.minSojourn);
                    if (newDate.valueOf() > checkout.getDate().valueOf()) {
                        checkout.update(newDate);
                    }
                    else {
                        checkout.update();
                    }

                    updateDateDiff();
                }).data('datepicker');


            var start_check_out = widgetCheckout.val().trim() != ''
                ? App.parseDate(widgetCheckout.val())
                : new Date(new Date(start_check_in).setDate(new Date(start_check_in).getDate() + App.configBooking.minSojourn));

            var checkout = widgetCheckout.datepicker({
                startDate: start_check_out,
                autoclose: true,
                onRender: function(date) {
                    var newDate = new Date(checkin.getDate());
                    newDate.setDate(newDate.getDate() + App.configBooking.minSojourn);
                    return date.valueOf() < newDate.valueOf() ? 'disabled' : '';
                },
                beforeShowDay: function(date) {
                    var checkinDate = new Date(checkin.getDate());
                    checkinDate.setDate(checkinDate.getDate() + App.configBooking.minSojourn);
                    var formated_day = App.formatDate(date);
                    return date.valueOf() < checkinDate.valueOf() || $.inArray(formated_day, App.configBooking.dateStopSelling) > 0 ? 'disabled' : '';
                }
            }).on('changeDate', function(ev) {
                    updateDateDiff();
                }).data('datepicker');

            var updateDateDiff = function() {
                spanDateDiff.text(parseInt((checkout.getDate().getTime() - checkin.getDate().getTime()) / 86400000));
            };

            checkin.setDate(start_check_in);
            checkout.setDate(start_check_out);

            if(App.configBooking.agreementEndDate) {
                var endDateCheckin = new Date(App.parseDate(App.configBooking.agreementEndDate).getTime());
                checkin.setEndDate(endDateCheckin);
                checkout.setEndDate(new Date(endDateCheckin.getTime() + (parseInt(App.configBooking.minSojourn) * 86400000)));
            }

            updateDateDiff();
        },

        widgetCount: function(selector) {
            var widget = $(selector).find('.widget').eq(0);
            var minus = widget.children('.widget-minus').eq(0);
            var minusStep = minus.attr('data-step') != undefined ? parseInt(minus.attr('data-step')) : parseInt(1);
            var minusStop = minus.attr('data-stop') != undefined ? parseInt(minus.attr('data-stop')) : parseInt(1);
            var plus = widget.children('.widget-plus').eq(0);
            var plusStep = minus.attr('data-step') != undefined ? parseInt(plus.attr('data-step')) : parseInt(1);
            var plusStop = minus.attr('data-stop') != undefined ? parseInt(plus.attr('data-stop')) : parseInt(100);
            var text = widget.children('.widget-text').eq(0);
            var input = widget.children('.widget-value').eq(0);

            var updateCounters = function() {
                if(parseInt(input.val()) - minusStep < minusStop) {
                    if(!minus.hasClass('disabled')) {
                        minus.addClass('disabled');
                    }
                }
                else {
                    if(minus.hasClass('disabled')) {
                        minus.removeClass('disabled');
                    }
                }

                if(parseInt(input.val()) + plusStep > plusStop) {
                    if(!plus.hasClass('disabled')) {
                        plus.addClass('disabled');
                    }
                }
                else {
                    if(plus.hasClass('disabled')) {
                        plus.removeClass('disabled');
                    }
                }
            };

            updateCounters();

            minus.off().click(function() {
                if(parseInt(input.val()) - minusStep >= minusStop) {
                    input.val(parseInt(input.val()) - minusStep);
                    input.trigger('change');
                }
            });

            plus.off().click(function() {
                if(parseInt(input.val()) + plusStep <= plusStop) {
                    input.val(parseInt(input.val()) + plusStep);
                    input.trigger('change');
                }
            });

            input.off().on('change', function() {
                var value = parseInt($(this).val());
                updateCounters();
                text.text(value);
                var sync = $(this).attr('data-sync');
                if(sync != undefined && sync.trim() != "") {
                    $(sync).val(value).trigger('change');
                }

                $(selector).triggerHandler('app.event.widget.count.change', [value]);
            });
        },

        formatPrice: function(value) {
            value = value.toString().replace('.', ',');

            var split = value.split(',');
            if(split.length == 2) {
                if(split[1].length == 1) {
                    value += '0';
                }
                else if(split[1].length > 2) {
                    value = split[0] + ',' + split[1].substr(0, 2);
                }
            }
            else if(value != 0) {
                value += ',00';
            }

            return value;
        },

        isTouchDevice: function () {
            try {
                document.createEvent("TouchEvent");
                return true;
            } catch (e) {
                return false;
            }
        },

        setCookie: function(name, value, expire) {
            var date = new Date();
            date.setTime(date.getTime()+(expire * 24 * 60 * 60 * 1000));
            var expires = "expires=" + date.toGMTString();
            document.cookie = name + "=" + value + "; " + expires;
        },

        getCookie: function(name) {
            name = name + "=";
            var ca = document.cookie.split(';');
            for(var i = 0; i < ca.length; i++)
            {
                var cookie = $.trim(ca[i]);
                if (cookie.indexOf(name) == 0)
                    return cookie.substring(name.length, cookie.length);
            }
            return "";
        },

        checkCookie: function(name, value) {
            var c = App.getCookie(name);
            return c == value;
        },

        blockUI: function (el, centerY) {
            el = jQuery(el);
            el.block({
                message: App.imgLoading,
                centerY: centerY != undefined ? centerY : true,
                css: {
                    top: '10%',
                    border: 'none',
                    padding: '2px',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.05,
                    cursor: 'wait'
                }
            });
        },

        unblockUI: function (el) {
            jQuery(el).unblock({
                onUnblock: function () {
                    jQuery(el).removeAttr("style");
                }
            });
        },

        handleSelect2: function(selector) {
            initSelect2($(selector));
        }
    };

}();
