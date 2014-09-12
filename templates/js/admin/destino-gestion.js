$(initDestino);
var DESCRIPCION = {};
var idioma;
function initDestino() {
    $('#destinoFrm').submit(function(e){
        e.preventDefault();
        _valid = $(this).validationEngine('validate');
        if(_valid) {
            
            DESCRIPCION[$('#idioma').val()] = CKEDITOR.instances.descripcion.getData();
            $('textarea[name=descripcion]').val(JSON.stringify(DESCRIPCION));
            data = $(this).serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-destino',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        if($('input[name=idDestino]').length == 0)
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-destino-gestion/id:' + response.destinoId;
                        }, 3000);
                    }
                }
            })
        }
        
    });
    
    descripcion();
    if($('input[name=idDestino]').length > 0) {
        gestionFotosFunctions();
        getDestinoFotos();
    }
    
    initMapa();
    $('#lugares_input').tagsInput({
        'width':'100%',
        'height': '34px',
        'defaultText':'Agregar'
    });
}

function descripcion() {
    descripcion = $('textarea[name=descripcion]').val();
    if(descripcion.trim().length >= 2 && descripcion.trim()[0] == '{' && descripcion.trim()[descripcion.trim().length - 1] == '}') {
        DESCRIPCION = JSON.parse(descripcion);
    } else {
        DESCRIPCION['es'] = descripcion;
    }
    setTimeout(function(){
        idioma = $('#idioma').val();
        CKEDITOR.instances.descripcion.setData(DESCRIPCION[idioma] ? DESCRIPCION[idioma] : '');
    
    }, 1000)
    
    
    $('#idioma').change(function(e){
        DESCRIPCION[idioma] = CKEDITOR.instances.descripcion.getData();
        idioma = $('#idioma').val();
        CKEDITOR.instances.descripcion.setData(DESCRIPCION[idioma] ? DESCRIPCION[idioma] : '')
    })
    
}

function getDestinoFotos(){
    $.ajax({
        dataType: "json",
        url: BASE_URL + "/admin-ajax-destino",
        type: "POST",
        data: {
            idDestino: $('input[name=idDestino]').val(),
            action: 'getFotos'
        },
        success: function(response) {    
            if(response.msg == 'ok'){
                if(response.html != 'not_found'){
                    $('#hotel-dropzone').addClass('dz-started');
                    $('#hotel-dropzone').html(response.html);
                    deleteDestinoFoto();
                }
            }
        }
    }); 
}
function deleteDestinoFoto(){
    $('.delete_foto').off().on('click', function(e){
        
        var ruta = $(this).attr('data-ruta');
        var idApartamentoAdjunto = $(this).attr('data-deptoadj');
        $('#blocker').fadeIn();
        $.ajax({
            dataType: "json",
            url: BASE_URL + "/admin-ajax-destino",
            type: "POST",
            data: {
                idArchivo: idApartamentoAdjunto,
                ruta: ruta,
                action: 'deleteFoto'
            },
            success: function(response) { 
                $('#blocker').fadeOut();
                if(response.msg == 'ok'){
                    toastr.success(response.data);
                    getDestinoFotos();
                }else{
                    toastr.error(response.data);
                }
            }
        }); 
        return false;
    });
}
function gestionFotosFunctions(){
    
    Dropzone.options.apartamentoDropzone = {
        url: BASE_URL + '/admin-ajax-destino',
        addedfile: function(file) {
                //console.log(file)
                var removeButton = Dropzone.createElement("<a href='#' class='dz-remove'>Borrar foto</a>");
                var _this = this;
                removeButton.addEventListener("click", function(e) {
                    // Make sure the button click doesn't submit the form:
                    e.preventDefault();
                    e.stopPropagation();

                    // Remove the file preview.
                    _this.removeFile(file);
                // If you want to the delete the file on the server as well,
                // you can do the AJAX request here.
                });

                // Add the button to the file preview element.
                file.previewElement.appendChild(removeButton);
            },
            success: function(file, responseText) {
                //console.log(responseText)
                getDestinoFotos();
            }
        
    }
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
        map.setCenter(new google.maps.LatLng($('input[name="direccion[lat]"]').val(), $('input[name="direccion[lon]"]').val()));
        $("#geocomplete").geocomplete('find', $('input[name="direccion[lat]"]').val() + ', ' + $('input[name="direccion[lon]"]').val());
    }, 20);

    //$("#geocomplete").trigger("geocode");
    
    $("#geocomplete").on("geocode:dragged", function(event, latLng) {
        $('input[name="direccion[lat]"]').val(latLng.lat());
        $('input[name="direccion[lon]"]').val(latLng.lng());
    });
}

function gestionLugares(){
    $('#agregar_lugar').click(function(){
        $clone = $('.lugar_hidden').clone(true).off();

        var time = new Date().getTime();
        $clone.find('input, select').each(function(){
            $(this).prop('disabled', false);
            $(this).attr('name', $(this).attr('name').replace('XX', time));
        });
        $clone.removeClass("hidden").removeClass("lugar_hidden");

        $clone.find('.delete').click(function(){
            $(this).parents(".lugar_content").remove();
            return false;
        });

        $('#lugar_container').append($clone);

        calendario($clone, time, true);
        idiomaSelect($clone, time);
        return false;
    });
}