$(initPromocion);


function initPromocion() {
    
    
    //guardar hotel
    $('#promocionFrm').submit(function(e){
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        if(valid) {
            
            
            $('#blocker').fadeIn().find('div').html('Salvando datos...');
            
            data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-promocion',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        
                        toastr.success(response.data);

                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-promocion-lista';
                        }, 3000);
                        
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
        
    
    
}





