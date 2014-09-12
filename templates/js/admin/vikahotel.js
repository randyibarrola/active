$(document).ready(function(){
	$('#privacidad_link, a.privacidad_link').click(function(e){
                    e.preventDefault();
                    $('#blocker').fadeIn().find('div').html('Loading...');
                    $.ajax({
                        url: BASE_URL + '/ajax-popup',
                        data: {id: 'privacidad'},
                        type: 'get',
                        dataType: 'json',
                        success: function(response) {
                            $('#blocker').fadeOut();
                            $('#privacidad_modal .modal-body').html(response.data);
                            $('#privacidad_modal').modal();
                        }
                    });
                });

                $('a.contacto_modal').click(function(e){
                    $('#contacto_modal').modal();
                });

                 $('a.recuperar_reserva_modal').click(function(e){
                    $('#recuperar_reserva_modal').modal();
                });
                
                $('a.cookies_link').click(function(e){
                    e.preventDefault();
                    $('#blocker').fadeIn().find('div').html('Loading...');
                    $.ajax({
                        url: BASE_URL + '/ajax-popup',
                        data: {id: 'cookies'},
                        type: 'get',
                        dataType: 'json',
                        success: function(response) {
                            $('#blocker').fadeOut();
                            $('#cookies_modal .modal-body').html(response.data);
                            $('#cookies_modal').modal();
                        }
                    });
                })
                
                $('#terminos_link').click(function(e){
                    e.preventDefault();
                    $('#blocker').fadeIn().find('div').html('Loading...');
                    $.ajax({
                        url: BASE_URL + '/ajax-popup',
                        data: {id: 'terminos'},
                        type: 'get',
                        dataType: 'json',
                        success: function(response) {
                            $('#blocker').fadeOut();
                            $('#terminos_modal .modal-body').html(response.data);
                            $('#terminos_modal').modal();
                        }
                    });
                });
                
                $('#contact-form').submit(function(e){
                    e.preventDefault();
                    valid = $(this).validationEngine('validate');
                    if(valid) {
                        $('#blocker').fadeIn();
                        data = $(this).serialize();
                        $.ajax({
                            url: BASE_URL + '/ajax-contacto',
                            data: data,
                            type: 'post',
                            dataType: 'json',
                            success: function(response) {
                                $('#blocker').fadeOut();
                                if(response.msg == 'ok') {
                                    toastr.success(response.data);
                                    $('input[type=text], textarea', '#contact-form').val('');
                                    $('#contacto_modal').modal('toggle');
                                } else {
                                    toastr.error(response.data);
                                    Recaptcha.reload();
                                }
                            }
                        });
                    }
                });
                
                $('#recover-form').submit(function(e){
                    e.preventDefault();
                    valid = $(this).validationEngine('validate');
                    if(valid) {
                        $('#blocker').fadeIn();
                        data = $(this).serialize();
                        $.ajax({
                            url: BASE_URL + '/ajax-reserva',
                            data: data,
                            type: 'post',
                            dataType: 'json',
                            success: function(response) {
                                $('#blocker').fadeOut();
                                if(response.msg == 'ok') {
                                    toastr.success(response.data);
                                    $('input[type=text]', '#recover-form').val('');
                                    $('#recuperar_reserva_modal').modal('toggle');
                                } else {
                                    toastr.error(response.data);
                                }
                            }
                        });
                    }
                });
});