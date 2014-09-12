var map;


function initialize() {
    var myLatlng = new google.maps.LatLng($('input[name=lat]').val(), $('input[name=lon]').val());
    var icon = '/templates/images/condominium.png';

    var mapOptions = {
        zoom: 14,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false
    }
    map = new google.maps.Map(document.getElementById('contact-map'), mapOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        icon: BASE_URL + icon
    });
    
    google.maps.event.trigger(map, 'resize');
    map.setCenter(myLatlng);
}

$(document).ready(function() {

    $('#asunto_select').change(function(){
        if($(this).val()==0 || $(this).val()==1){
            $('.contacto_label').show();
        }else{
            $('.contacto_label').hide();
        }
    });
    
    
    $('#contact-form').submit(function(e){
        e.preventDefault();
        var valid = $(this).validationEngine('validate');
        if(valid) {
            var data = $(this).serialize();
            _this = $(this);
            $('#blocker').fadeIn().find('div').html('Enviando...');
            $.ajax({
                url: BASE_URL + '/ajax-contacto',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        _this.find('input[type=text], textarea').val('');
                    } else {
                        toastr.error(response.data);
                        //Recaptcha.reload();
                    }                    
                }
            });
        }
    });
    
    $('#subscribe_form').submit(function(e){
        e.preventDefault();
        var valid = $(this).validationEngine('validate');
        _this = $(this);
        if(valid) {
            $('#blocker').fadeIn().find('div').html('Enviando...');
            var data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/ajax-suscripcion',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        _this.find('input[type=text], textarea').val('');
                    } else {
                        toastr.error(response.data);
                        
                    } 
                }
            });
        }
    })
    
    
    

    $('.date-start').datepicker({
        autoclose: true,
        format: 'dd-mm-yyyy'
    }).on('changeDate', function(ev) {
        $('.date-end').datepicker('setStartDate', ev.date);
    });

    $('.date-start').datepicker('setStartDate', new Date());

    $('.date-end').datepicker({
        autoclose: true,
        format: 'dd-mm-yyyy'
    }).on('changeDate', function(ev) {

        });

    $('.date-end').datepicker('setStartDate', new Date());
    
    initialize();
    /*
    if($('#captchaContainer').length > 0)
        showRecaptcha();*/
});

function showRecaptcha() {
    Recaptcha.create("6LcY-uYSAAAAACBIaBBmfEdbYqJxCkDdtOONaeIE", 'captchaContainer', {
        tabindex: 1,
        theme: "clean",
        callback: Recaptcha.focus_response_field
    });
}