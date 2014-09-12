$(initCondicion);

var NOMBRE = {};
var DESCRIPCION = {};

function initCondicion() {
    CKEDITOR.config.entities = false;
    
    //guardar hotel
    $('#condicionFrm').submit(function(e){
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        if(valid) {
            $('#idiomaSelect').change();
            $('input[name=nombre]').val(JSON.stringify(NOMBRE));
            $('textarea[name=descripcion]').val(JSON.stringify(DESCRIPCION));
            
            $('#blocker').fadeIn().find('div').html('Salvando datos...');
            
            data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-condicion',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                        if(response.msg == 'ok') {
                        
                        toastr.success(response.data);
                        
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
    setTimeout(function(){
        descripcionesFunctions();
    }, 1000)  
    
    
    
}


IDIOMA = false;

function descripcionesFunctions() {
    nombre = $('input[name=nombre]').val();
    descripcion = $('textarea[name=descripcion]').val();
    
    $('#idiomaSelect').change(function(e){
        
        if(IDIOMA) {
            NOMBRE[IDIOMA] = $('#nombre').val();
            //DESCRIPCION[IDIOMA] = $('#descripcion').val();
            
            DESCRIPCION[IDIOMA] = CKEDITOR.instances.descripcion.getData();            
            //CKEDITOR.instances.descripcion.setData(DESCRIPCION[IDIOMA]);
        }
        IDIOMA = $(this).val();
        $('#nombre').val(NOMBRE[IDIOMA]);
        $('#descripcion').val(DESCRIPCION[IDIOMA]);      
        CKEDITOR.instances.descripcion.setData(DESCRIPCION[IDIOMA]);
        
    });
    
    if(nombre && nombre.trim().length > 2) {
        NOMBRE = JSON.parse(nombre);
        
        if(descripcion && descripcion.trim().length > 2){
            try {
              DESCRIPCION = JSON.parse(descripcion);
            } catch (e) {
              console.log(e);
            }
        }
        
        
        for(var lang in NOMBRE) {
            break;
        }
        
        $('#idiomaSelect').val(lang);
        
        $('#idiomaSelect').change();
        
        
        
    }
    
    if(!IDIOMA)
            IDIOMA = $('#idiomaSelect').val();
    
}



