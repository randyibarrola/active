$(initSuspender);

function initSuspender() {
    $('#suspenderCampaniaFrm').submit(function(e){
        e.preventDefault();
        
        if($('#ap').parent().hasClass('checked')) {
            $('#ap').removeClass('validate[required]');
            $('#ap').parent().find('div').remove();
        } else {
            $('#ap').addClass('validate[required]');
        }
        valid = $(this).validationEngine('validate');
        if(valid) {
            data = $(this).serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-contrato',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-campania-lista';
                        }, 3500)
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
}


