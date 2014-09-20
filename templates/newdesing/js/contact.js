var Contact = function() {


    return {
        form: $('#contact-form'),

        init: function(ajaxContent) {
            if(ajaxContent != undefined) {
                Contact.form = $(ajaxContent);
            }

            Form.handleDatepicker(Contact.form.find('.datepicker'));
            App.handleSelect2(Contact.form.find('.select2'));

            $('#contactFormAsunto').change(function(){
                var gruop = $('#subjectBookingGroup');
                parseInt($(this).val()) <= 1 ? gruop.show() : gruop.hide();
            });

            var widgetLlegada = $('#contactFormLlegada');
            var widgetSalida = $('#contactFormSalida');
            widgetLlegada.bind('app.event.datepicker.changeDate', function(e, dev) {
                if (dev.date.valueOf() > widgetSalida.datepicker('getDate').valueOf()) {
                    widgetSalida.datepicker('update', dev.date);
                }
                widgetSalida.datepicker('setStartDate', dev.date);
            });

            Contact.form.submit(function(e){
                e.preventDefault();
                var valid = $(this).validationEngine('validate');
                if(valid) {
                    var data = $(this).serialize();
                    App.blockUI(Contact.form);
                    $.ajax({
                        url: App.baseUrl + '/ajax-contacto',
                        data: data,
                        type: 'post',
                        dataType: 'json',
                        success: function(response) {
                            App.unblockUI(Contact.form);
                            if(response.msg == 'ok') {
                                toastr.success(response.data);
                                Contact.form.trigger('reset');
                            } else {
                                toastr.error(response.data);
                            }
                        }
                    });
                }
            });
        }
    };
}();