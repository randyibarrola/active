var Login = function () {

	var handleLogin = function() {
		$('.login-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                username: {
	                    required: true
	                },
	                password: {
	                    required: true
	                },
	                remember: {
	                    required: false
	                }
	            },

	            messages: {
	                usuario: {
	                    required: "El correo electrónico es requerido."
	                },
	                password: {
	                    required: "la contraseña es requerida."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-danger', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                form.submit();
	            }
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                    $('.login-form').submit();
	                }
	                return false;
	            }
	        });
	}

	var handleForgetPassword = function () {
		$('.forget-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                email: {
	                    required: true,
	                    email: true
	                }
	            },

	            messages: {
	                email: {
	                    required: "Email is required."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                form.submit();
	            }
	        });

	        $('.forget-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.forget-form').validate().form()) {
	                    $('.forget-form').submit();
	                }
	                return false;
	            }
	        });

	        jQuery('#forget-password').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.forget-form').show();
	        });

	        jQuery('#back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.forget-form').hide();
	        });

	}

	var handleRegister = function () {

		function format(state) {
            if (!state.id) return state.text; // optgroup
            return "<img class='flag' src='"+ TEMPLATE_URL +"/admin/assets/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
        }


		$("#select2_sample4").select2({
		  	placeholder: '<i class="fa fa-map-marker"></i>&nbsp;Select a Country',
            allowClear: true,
            formatResult: format,
            formatSelection: format,
            escapeMarkup: function (m) {
                return m;
            }
        });


			$('#select2_sample4').change(function () {
                $('.register-form').validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
            });



         $('.register-form').validate({
	            errorElement: 'span', 
	            errorClass: 'help-block', 
	            focusInvalid: false, 
	            ignore: "",
	            rules: {
	                'nombre': {
                            required: true
                        },
                        'apellido': {
                            required: true
                        },
                        /*'numeroFiscal': {
                            required: true
                        },*/
                        'dni': {
                            required: true
                        },
                        'empresa': {
                            required: true
                        },
                        'puestoTrabajo': {
                            required: true
                        },
                        'telefono': {
                            required: true
                        },
                        'movil': {
                            required: true
                        },
	                'hotel[]': {
	                    required: true
	                },/*
                        'empresa_contactoApellido': {
	                    required: true
	                },
                        'empresa_contactoEmail': {
	                    required: true,
                            email: true
	                },
                        'empresa_nombre': {
	                    required: true
	                },
                        'empresa_direccion': {
	                    required: true
	                },
	                country: {
	                    required: true
	                },*/
	                email: {
	                    required: true,
	                    email: true
	                },
	                /*password: {
	                    required: true
	                },
	                rpassword: {
	                    equalTo: "#password"
	                },*/

	                tnc: {
	                    required: true
	                },
                        porcentajeBeneficio: {
                            required: true
                        }
	            },

	            messages: { 
	                tnc: {
	                    required: "Please accept TNC first."
	                }
	            },

	            invalidHandler: function (event, validator) {   

	            },

	            highlight: function (element) { 
	                $(element)
	                    .closest('.form-group').addClass('has-error'); 
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                if (element.attr("name") == "tnc") {                   
	                    error.insertAfter($('#register_tnc_error'));
	                } else if (element.closest('.input-icon').size() === 1) {
	                    error.insertAfter(element.closest('.input-icon'));
	                } else {
	                	error.insertAfter(element);
	                }
	            },

	            submitHandler: function (form) {
                        console.log(form);
	                data = $(form).serialize();
                        $('#blocker').fadeIn();
                        $.ajax({
                            url: BASE_URL + '/admin-ajax-registrar',
                            data: data,
                            type: 'post',
                            dataType: 'json',
                            success: function(response) {
                                $('#blocker').fadeOut();
                                if(response.msg == 'ok') {
                                    
                                    toastr.success(response.data);
                                    
                                    setTimeout(function(){
                                        window.location = response.url;
                                    }, 1000);

                                } else {
                                    toastr.error(response.data);
                                    return false;
                                }
                            }
                        });
	            }
	        });

                $('.register-form').submit(function (ev) {
                        //console.log("submting !!!")
                        ev.stopPropagation();
                        ev.preventDefault();
                //valid = $(this).validationEngine('validate');


                });

			
                /*
	        jQuery('#register-btn').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.register-form').show();
	        });*/
                /*
	        jQuery('#register-back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.register-form').hide();
	        });*/
                
                $('#addProductBtn').click(function(e){
                    e.preventDefault();
                    clone = $('.hotel-clone').clone();
                    clone.removeClass('hotel-clone').removeClass('hidden');
                    clone.find('input').prop('disabled', false);
                    $('#hoteles').append(clone);
                });
                
                $('#ley_link').click(function(e){
                    e.preventDefault();
                    $('#blocker').fadeIn().find('div').html('Loading...');
                    $.ajax({
                        url: BASE_URL + '/ajax-popup',
                        data: {id: 'ley'},
                        type: 'get',
                        dataType: 'json',
                        success: function(response) {
                            $('#blocker').fadeOut();
                            $('#ley_modal .modal-body').html(response.data);
                            $('#ley_modal').modal();
                        }
                    });
                });
                
                if(msg) toastr.error(msg);
                
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
                
	}
    
    return {
        //main function to initiate the module
        init: function () {
        	
            handleLogin();
            handleForgetPassword();
            handleRegister();        
	       
	       	$.backstretch([
		        TEMPLATE_URL+"/admin/assets/img/bg/13.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		    });
        }

    };

}();