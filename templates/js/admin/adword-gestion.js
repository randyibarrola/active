$(initAdword);

function initAdword() {
    
    $('#adwordFrm').submit(function(e){
        e.preventDefault();
        if($(this).validationEngine('validate')) {
            $('#blocker').fadeIn();
            data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-adword',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        
                        toastr.success(response.data);
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-adword-lista';
                        }, 3000);
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            })
        }
    });
    
    $('select.multiselect').multiSelect();
    
    $('input[name=inicio]').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true
    }).on('changeDate', function(ev){
        start = new Date(ev.date.getTime() + (24*60*60*1000));
        $('input[name=fin]').datepicker('setStartDate', start);
    });
    
    $('input[name=fin]').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true
    });
    
}


