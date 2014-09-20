var Form = function () {
    var initDatePickers = function(selector) {
        selector = selector != undefined ? selector : $('.datepicker');
        if(jQuery().datepicker) {
            selector.each(function() {
                var widget = $(this);

                widget.datepicker({
                    autoclose: true,
                    startDate: widget.data('start-date') ? widget.data('start-date') : -Infinity,
                    endDate: widget.data('start-date') ? widget.data('end-date') : Infinity
                }).on('changeDate', function(ev) {
                    if(widget.data('sync')) {
                        $(widget.data('sync')).val(App.formatDate(new Date(ev.date)));
                    }

                    widget.triggerHandler('app.event.datepicker.changeDate', ev);
                });

                if(widget.attr('value') != undefined && widget.val().trim() != '') {
                    widget.datepicker('setDate', widget.val().trim());
                }
                else if(widget.data('date') == undefined) {
                    widget.datepicker('setDate', widget.data('start-date') ? widget.data('start-date') : "today");
                }
                else if(widget.attr('type') != undefined && widget.data('date') != undefined) {
                    widget.datepicker('setDate', widget.data('date'));
                }

                if(widget.data('sync')) {
                    $(widget.data('sync')).val(App.formatDate(new Date(widget.datepicker('getDate'))));
                }
            });
        }
    };

    return {
        init: function () {
            initDatePickers();
        },

        handleDatepicker: function(selector) {
            initDatePickers($(selector));
        }
    };

}();

