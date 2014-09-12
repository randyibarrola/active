$(initReserva);
var LAST_ESTADO = "";
function initReserva() {
    
    guardarPago();
    
    pagosFunction();
    
    cardDataFunction();
    
    motivoFunction();

    LAST_ESTADO = $('select[name=estado]').val();
}

function guardarPago() {
    $('#reservaFrm').submit(function(e) {
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        
        if(valid) {
            data = $(this).serialize();
            
            if($('select[name=estado]').val()!= LAST_ESTADO && $('select[name=estado]').val() == 'Cancelada por el administrador') {
                $('#motivo_modal').modal();
            } else {
            
                $('#blocker').fadeIn();
                $.ajax({
                    url: BASE_URL + '/admin-ajax-reserva',
                    data: data,
                    type: 'post',
                    dataType: 'json',
                    success: function(response) {
                        $('#blocker').fadeOut();
                        if(response.msg == 'ok') {
                            toastr.success(response.data);
                            setTimeout(function(){
                                window.location = BASE_URL + '/admin-reserva-lista';
                            }, 3500);
                        } else {
                            toastr.error(response.data);
                        }
                    }
                });
            }
        }
    })
}

function pagosFunction() {
    $('#add_pago').on('click', function(e){
        e.preventDefault();
        tipo = $('#tipoPago').val();
        clon = $('#pago_' + tipo).clone();
        clon.removeAttr('id').addClass('pago');
        x = 'XX_' + new Date().getTime();
        clon.find('input, select').each(function(){            
            $(this).attr('name', $(this).attr('name').replace('XX', x));
            $(this).prop('disabled', false);
        });
        
        $('.pagos-add').append(clon);
        eliminarPagos();
    });
    eliminarPagos();
}

function eliminarPagos() {
    $('.delete-pago-container a').off('click').click(function(e){
        e.preventDefault();
        $(this).parent().parent().remove();
    })
}

function cardDataFunction() {
    $('#showCardDataBtn').click(function(){
        $('#cardData_modal').modal();
    });
    
    $('#aceptar').click(function(e){
        e.preventDefault();
        
        valid = $('#cardDataForm').validationEngine('validate');
        
        if(valid) {
            data = $('#cardDataForm').serialize();
            $('#cardData_modal').modal('toggle');
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-reserva',
                data:data,
                type:'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        $('#pagosCont').html(response.html);
                        pagosFunction();
                        $('#showCardDataBtn').hide();
                    } else {
                        toastr.error(response.data);
                    }
                }
            })
        }
    })
}

function motivoFunction() {
    $('#aceptarMotivo').click(function(e){
        e.preventDefault();
        var valid = $('#motivoForm').validationEngine('validate');
        if(valid) {
            data = $('#reservaFrm').serialize() + '&' + $('#motivoForm').serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-reserva',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-reserva-lista';
                        }, 3500);
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    })
}


