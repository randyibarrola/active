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
            $('.flexslider-tcn').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });

            $('.flexslider-scn-carousel').each(function() {
                var e = $(this);
                e.flexslider({
                    animation: "slide",
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
            });
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
                // la variable data es temporal, debe implementarse con ajax utilizando la variable query.
                var data = [
                    {"code": "1", "name": "NH Eurobuilding"},
                    {"code": "2", "name": "NH Nacional"},
                    {"code": "3", "name": "NH Balboa"},
                    {"code": "4", "name": "NH Puerta de Alcalá"},
                    {"code": "5", "name": "NH Collection Palacio de Tepa"},
                    {"code": "6", "name": "NH Collection Paseo del Prado"}
                ];

                $.each(data, function (i, item) {
                    map[item.name] = item;
                    items.push(item.name);
                });

                widgetSelectedItem.val('');
                process(items);
            },
            matcher: function(item) {
                var flag = false;
                if (item.toLowerCase().indexOf(this.query.trim().toLowerCase()) != -1) {
                    flag = true;
                }

                return flag;
            },
            sorter: function(items) {
                return items.sort();
            },
            updater: function(item) {
                selectedItem = map[item];
                widgetSelectedItem.val(selectedItem.code);

                return item;
            }
        });
    };

    return {
        dateFormat: "dd/mm/yyyy",
        locale: 'es',
        currency: '€',

        //main function to initiate template pages
        init: function () {
            initAppDropdownChoices();
            initScrolls();
            initSliders();
            initWidgetCount();
            handleTooltips();
            initGlobalSearchForm();

            if(jQuery().datepicker) {
                jQuery().datepicker.defaults.format = App.dateFormat;
                jQuery().datepicker.defaults.language = App.locale;
            }

            if(jQuery().select2) {
                $('.select2').select2({
                    allowClear: true
                });
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

        imgLoading: "",

        contentAjaxLoad: function(selector) {
            var href = $(selector).attr('data-href') != 'undefined' ? $(selector).attr('data-href') : $(selector).attr('href');

            selector.append(App.imgLoading);
            $(selector).load(href, function() {
                $(selector).triggerHandler('app.event.load.success');
            });
        },

        bookingDateWidget: function(form) {
            var widgetCheckin = $(form).find('.app-booking-date-start').eq(0);
            var widgetCheckout = $(form).find('.app-booking-date-end').eq(0);
            var spanDateDiff = $(form).find('.app-booking-date-diff').eq(0);
            var nowTemp = new Date();
            var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
            var checkin = widgetCheckin.datepicker({
                startDate: "today",
                autoclose: true,
                onRender: function(date) {
                    return date.valueOf() < now.valueOf() ? 'disabled' : '';
                },
                beforeShowDay: function(date) {
                    var formated_day = App.formatDate(date);
                    return $.inArray(formated_day, []) > 0 ? 'disabled' : '';
                }
            }).on('changeDate', function(ev) {
                    var newDate = new Date(ev.date);
                    newDate.setDate(newDate.getDate() + 1);
                    if (newDate.valueOf() > checkout.getDate().valueOf()) {
                        checkout.update(newDate);
                    }
                    else {
                        checkout.update();
                    }

                    updateDateDiff();
                }).data('datepicker');


            var diff_days_checks = 1;
            var start_check_out = new Date(new Date(now).setDate(now.getDate() + diff_days_checks));

            var checkout = widgetCheckout.datepicker({
                startDate: start_check_out,
                autoclose: true,
                onRender: function(date) {
                    var newDate = new Date(checkin.getDate());
                    newDate.setDate(newDate.getDate() + 1);
                    return date.valueOf() < newDate.valueOf() ? 'disabled' : '';
                },
                beforeShowDay: function(date) {
                    var checkinDate = new Date(checkin.getDate());
                    checkinDate.setDate(checkinDate.getDate() + 1);
                    var formated_day = App.formatDate(date);
                    return date.valueOf() < checkinDate.valueOf() || $.inArray(formated_day, []) > 0 ? 'disabled' : '';
                }
            }).on('changeDate', function(ev) {
                    updateDateDiff();
                }).data('datepicker');

            var updateDateDiff = function() {
                spanDateDiff.text(parseInt((checkout.getDate().getTime() - checkin.getDate().getTime()) / 86400000));
            };

            if(widgetCheckin.val() == '') {
                checkin.setDate(now);
                checkout.setDate(start_check_out);
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
        }
    };

}();
