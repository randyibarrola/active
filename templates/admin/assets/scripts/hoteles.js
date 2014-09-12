$(initHotelesFilter);

function initHotelesFilter() {
    
    autocompleteHotelDestino();
    
    
    showMix();
    
    var actualPage = parseInt(startItem / itemsByPage) + 1;
    var totalPages = parseInt(totalItems / itemsByPage) + ((totalItems % itemsByPage == 0) ? 0 : 1);
    
    $('#precios, #estrellas').change(function(){
        $('.hotel_list').css('opacity', 0.4);
        $.ajax({
            url: BASE_URL + '/admin-ajax-hoteles',
            data: {action: 'filter', start: 0, term: '', precio: $('#precios').val(), estrellas: $('#estrellas').val()},
            type: 'post',
            dataType: 'json',
            success: function(response) {
                hideMix(response.html, 0, (response.hoteles.count / response.hoteles.limit) + ((response.hoteles.count % response.hoteles.limit > 0) ? 1 : 0));
                $('.hotel_list').css('opacity', 1);
                actualizarMapa(response.locations);
            }
        })
    })
    
    paginate(actualPage, totalPages);
    if($('#captchaContainer').length > 0)
        showRecaptcha();
    actualizarMapa(LOCATIONS);
    
    
}

var ELEMENTOS = [];
var TIPOS = [];

function autocompleteHotelDestino() {
    
    $('#search').typeahead({
        source: function(qry, process){
            $.ajax({
                url: BASE_URL + '/admin-ajax-hoteles',
                type: 'post',
                data: {action:'search', term:qry},
                dataType: 'json',
                success: function(response) {
                    ELEMENTOS = [];
                    TIPOS = [];
                    if(response.lista.length > 0) {
                        for(i=0;i<response.lista.length;i++) {
                            ELEMENTOS[i] = response.lista[i].nombre;
                            TIPOS[i] = response.lista[i].tipo;
                        }
                        
                        return process(ELEMENTOS);
                    } else
                        return process([NO_ELEMENTOS_LABEL]);
                }
            });
        },
        updater: function(item) {
            pos = $.inArray(item, ELEMENTOS);
            if(pos != -1) {
                $.ajax({
                    url: BASE_URL + '/admin-ajax-hoteles',
                    data: {action: 'filter', start: 0, term: item, precio: $('#precios').val(), estrellas: $('#estrellas').val()},
                    type: 'post',
                    dataType: 'json',
                    success: function(response) {
                        hideMix(response.html, 1, (response.hoteles.count / response.hoteles.limit) + ((response.hoteles.count % response.hoteles.limit > 0) ? 1 : 0));
                        actualizarMapa(response.locations);
                    }
                })
                return item;
            } 
            $.ajax({
                url: BASE_URL + '/admin-ajax-hoteles',
                data: {action: 'filter', start: 0, term: '', precio: $('#precios').val(), estrellas: $('#estrellas').val()},
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    hideMix(response.html, 0, (response.hoteles.count / response.hoteles.limit) + ((response.hoteles.count % response.hoteles.limit > 0) ? 1 : 0));
                    actualizarMapa(response.locations);
                }
            })
            return '';
        }
    });
}

var map = false;

//var myLatlng = new google.maps.LatLng("40.4216737855101","-3.7001175433777");
var marcadores = [];
var MOVING_MAP = false;
function initialize() {
    var mapOptions = {
        zoom: 15,
        minZoom: 7,
        'scrollwheel': false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById('mapa'), mapOptions);

     
    
    
    
}

var infoWindow;

function actualizarMapa(locations) {

    //var myLatlng;

    if (!map) {
        initialize();
        google.maps.event.trigger(map, 'resize');
        infowindow = new google.maps.InfoWindow({
                            content: ''
                    });
        
    } else {
        
        for (i = 0; i < marcadores.length; i++) {
            
            if (marcadores[i])
                marcadores[i].setMap(null);
        }
        marcadores = [];
    }

    var latlngbounds = new google.maps.LatLngBounds();
    //$('.hotel_list .hotel_item:not(:hidden)').each(function() {
    term = $('#search').val().trim();
    for(i=0;i<locations.length; i++) {
        var location = locations[i];
        if(!location.nombre) continue;
        var idHotel = location.id;
        var nombre = location.nombre;
        var lat = location.lat;
        var lon = location.lon;
        var icon = '/templates/images/map-marker.png';
        if(term == nombre.trim())
            icon = '/templates/images/map_icons/house.png';
        

        var parliament = new google.maps.LatLng(lat, lon);
        latlngbounds.extend(parliament);
        var marker = new google.maps.Marker({
            idHotel:idHotel, 
            title: nombre,
            position: parliament,
            map: map,
            icon: BASE_URL + icon
        });

        marcadores.push(marker);
        
        google.maps.event.addListener(marker, 'click', function(e) {
                var m = this;
                var id = m.idHotel;
                $.ajax({
                    url: BASE_URL + '/admin-ajax-hoteles',
                    data: {action:'informacionMapa', id:id},
                    type: 'post',
                    dataType: 'json',
                    success: function(resp) {
                        if(resp.msg == 'ok') {
                            infowindow.setContent(resp.html);
                            infowindow.open(map, m);
                        }
                    }
                });
                
        });
        
    }
        /*
        google.maps.event.addListener(marker, 'click', function() {
                idApto = marker.idApto;
                $.ajax({
                    url: BASE_URL + '/ajax-apartamento',
                    data: {action:'informacionMapa', id:idApto},
                    type: 'post',
                    dataType: 'json',
                    success: function(resp) {
                        if(resp.msg == 'ok') {
                            infowindow.setContent(resp.html);
                            infowindow.open(map, marker);
                        }
                    }
                });
                
        });*/

    //});

    map.setCenter(latlngbounds.getCenter());
    map.fitBounds(latlngbounds);
    if(map.getZoom() > 15) {
        map.setZoom(15);
    }
}

function showMix() {
    $('.mix').animate({opacity: 1}, 500, function(){
        //actualizarMapa();
    });
}

function hideMix(html, page, totalPages) {
    $('.mix').animate({opacity: 0}, 500, function(){
        if(html.trim().length > 0) {
            $('.hotel_list').html(html);
            showMix();
            $('#pagination').parent().show();
            if(page > 0) {
                $('#pagination').bootstrapPaginator({currentPage:page});
            }
            if(totalPages > 1) {
                $('#pagination').bootstrapPaginator({totalPages:totalPages});
            } else {
                $('#pagination').parent().hide();
            }
            $("html, body").animate({scrollTop: $(".hotel_container").offset().top}, 10);
        }
    });
}

function paginate(actual, total) {
    $('#pagination').bootstrapPaginator({
        currentPage:actual, 
        totalPages: total, 
        alignment: 'center',
        onPageClicked: function(e,originalEvent,type,page){

            e.stopImmediatePropagation();

            var currentTarget = $(e.currentTarget);

            var pages = currentTarget.bootstrapPaginator("getPages");

            var item = (page - 1) * itemsByPage;
            var data = {action: 'filter', start: item, term: $('#search').val(), precio: $('#precios').val(), estrellas: $('#estrellas').val()};
            if($('.el-hotel').length > 0)
                data.paginar_otros = 1;
            $('.hotel_list').css('opacity', 0.4);
            $.ajax({
                url: BASE_URL + '/admin-ajax-hoteles',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('.hotel_list').css('opacity', 1);
                    hideMix(response.html, page, (response.hoteles.count / response.hoteles.limit) + ((response.hoteles.count % response.hoteles.limit > 0) ? 1 : 0));
                }
            })
        }
    })
}

function showRecaptcha() {
    Recaptcha.create("6LcY-uYSAAAAACBIaBBmfEdbYqJxCkDdtOONaeIE", 'captchaContainer', {
        tabindex: 1,
        theme: "clean",
        callback: Recaptcha.focus_response_field
    });
}


