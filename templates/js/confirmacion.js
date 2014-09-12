$(function(){
   
    $('#cancelarBtn').click(function(e){
        $('#cancelar_modal').modal();
    });
    
    $('#aceptarCancelar').click(function(e){
        $('#cancelar_modal').modal('toggle');
        $('#blocker').fadeIn().find('div').html('Cancelando ...');
        id = $('#idCancelar').val();
        $.ajax({
            url: BASE_URL + '/ajax-reserva',
            data: {id:id, action:'cancelar'},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success(response.data);
                    setTimeout(function(){
                        window.location = BASE_URL + '/cancelacion/id:' + id + END_URL;
                    }, 3000);
                } else {
                    toastr.error(response.data);
                }
            }
        })
    })
});