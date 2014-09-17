var Form = function () {
    var initDatePickers = function() {
        if(jQuery().datepicker) {
            $('.datepicker').each(function() {
                var widget = $(this);

                widget.datepicker({
                    autoclose: true,
                    startDate: widget.data('start-date') ? widget.data('start-date') : -Infinity,
                    endDate: widget.data('start-date') ? widget.data('end-date') : Infinity
                }).on('changeDate', function(ev) {
                    if(widget.data('sync')) {
                        $(widget.data('sync')).val(App.formatDate(new Date(ev.date)));
                    }
                });

                if(widget.data('date') == undefined) {
                    widget.datepicker('setDate', widget.data('start-date') ? widget.data('start-date') : "today")
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
        }
    };

}();

