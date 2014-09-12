var CONTENIDO = {};

$(document).ready(function() {
	$('#saveBtn').click(function(e){
		e.preventDefault();
        IDIOMA = $('#idiomaSelect').val();
        $('#idiomaSelect').change();
        
        $('textarea[name=contenido]').val(JSON.stringify(CONTENIDO));
        
        valid = $('#formulario').validationEngine('validate');

        if(valid) {
            data = $('#formulario').serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-faq',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        window.location = BASE_URL + '/admin-faq-gestion';
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }

	});	
	descripcionesFunctions();
});

IDIOMA = false;
function descripcionesFunctions() {    

    contenido = $('textarea[name=contenido]').val();

    $('#idiomaSelect').change(function(e){
        if(IDIOMA) {
            CONTENIDO[IDIOMA] = CKEDITOR.instances.contenido.getData();            
            CKEDITOR.instances.contenido.setData(CONTENIDO[$(this).val()]);
        }

        IDIOMA = $(this).val();
        $('#contenido').val(CONTENIDO[IDIOMA]);

    });
    var db = $('textarea[name=contenido]').val();
    if(db.length>2) CONTENIDO = JSON.parse(db);

    if(contenido && contenido.trim().length > 2) {
        CONTENIDO = JSON.parse(contenido);

        for(var lang in CONTENIDO) {
            break;
        }

        $('#idiomaSelect').val(lang);
        $('#idiomaSelect').change();
    }
    
    IDIOMA = $('#idiomaSelect').val();
    
}