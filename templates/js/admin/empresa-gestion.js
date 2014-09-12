$(initEmpresa);

function initEmpresa() {
    
    
    $('#empresaFrm').submit(function(e){
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        if(valid) {
            data = $(this).serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-empresa',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-empresa-lista';
                        }, 3500);
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
    $('select[name=empresaTipoId]').change(function(){
        console.log($(this).val() == 1);
        if($(this).val() == 1) {
            $('#distribuidoras-container').addClass('hidden').find('select').prop('disabled', true);
        } else {
            $('#distribuidoras-container').removeClass('hidden').find('select').prop('disabled', false);
        }
    })
    
    initMapa();
    
}

function initMapa() {
    $("#geocomplete").geocomplete({
        map: "#mapa",        
        markerOptions: {
            draggable: true
        }
    });
    
    var map = $("#geocomplete").geocomplete("map");
    google.maps.event.trigger(map, "resize");
    window.setTimeout(function() {
        map.setCenter(new google.maps.LatLng($("input[name=lat]").val(), $("input[name=lon]").val()));
        $("#geocomplete").geocomplete('find', $("input[name=lat]").val() + ', ' + $("input[name=lon]").val());
    }, 20);

    //$("#geocomplete").trigger("geocode");
    
    $("#geocomplete").on("geocode:dragged", function(event, latLng) {
        $("input[name=lat]").val(latLng.lat());
        $("input[name=lon]").val(latLng.lng());
    });
}





