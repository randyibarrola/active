$(initBlacklist);



function initBlacklist() {
    
    
    //guardar hotel
    $('#blacklistFrm').submit(function(e){
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        if(valid) {
            $('#blocker').fadeIn();
            data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-blacklist',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                        if(response.msg == 'ok') {
                        
                        window.location = BASE_URL + '/admin-blacklist-lista' + END_URL;
                        
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
        
    descripcionesFunctions();
    
    
}


IDIOMA = false;

function descripcionesFunctions() {
    nombre = $('input[name=nombre]').val();
    descripcion = $('textarea[name=descripcion]').val();
    
    $('#idiomaSelect').change(function(e){
        
        if(IDIOMA) {
            NOMBRE[IDIOMA] = $('#nombre').val();
            DESCRIPCION[IDIOMA] = $('#descripcion').val();
        }
        IDIOMA = $(this).val();
        $('#nombre').val(NOMBRE[IDIOMA]);
        $('#descripcion').val(DESCRIPCION[IDIOMA]);      
            
        
    });
    
    if(nombre && nombre.trim().length > 2) {
        NOMBRE = JSON.parse(nombre);
        if(descripcion && descripcion.trim().length > 2)
            DESCRIPCION = JSON.parse(descripcion);
       
        
        for(var lang in NOMBRE) {
            break;
        }
        
        $('#idiomaSelect').val(lang);
        
        $('#idiomaSelect').change();
        
        
        
    }
    
    if(!IDIOMA)
            IDIOMA = $('#idiomaSelect').val();
    
}



