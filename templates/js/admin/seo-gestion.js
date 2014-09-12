$(initHotel);


var DESCRIPCION_CORTA = {};
var TITULO_SEO = {};
var KEYWORDS_SEO = {};

function initHotel() {
    
    
    //guardar hotel
    $('#saveBtn').click(function(e){
        e.preventDefault();
        IDIOMASEO = $('#idiomaSelectSeo').val();
        $('#idiomaSelectSeo').change();
        
        $('textarea[name=descripcionCorta]').val(JSON.stringify(DESCRIPCION_CORTA));
        
        $('input[name=tituloSeo]').val(JSON.stringify(TITULO_SEO));
        $('textarea[name=keywordsSeo]').val(JSON.stringify(KEYWORDS_SEO));
        
        valid = $('#hotelFrm1').validationEngine('validate');
        if(valid) {
            
            $('#blocker').fadeIn().find('div').html('Salvando datos del hotel');
            
            data = $('#hotelFrm1').serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-seo',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                        if(response.msg == 'ok') {
                        
                        toastr.success(response.data);
                        setTimeout(function (){
                            window.location = BASE_URL + '/admin-seo-lista';
                        }, 3500);
                        
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
    
    seoFunctions();
}

IDIOMASEO = false;

function seoFunctions() {
    
    descripcionCorta = $('textarea[name=descripcionCorta]').val();
    
    tituloSeo = $('input[name=tituloSeo]').val();
    keywordsSeo = $('textarea[name=keywordsSeo]').val();
    
    $('#idiomaSelectSeo').change(function(e){
        
        if(IDIOMASEO) {
            
            DESCRIPCION_CORTA[IDIOMASEO] = $('#descripcionCorta').val();
                        
            TITULO_SEO[IDIOMASEO] = $('#tituloSeo').val();
            KEYWORDS_SEO[IDIOMASEO] = $('#keywordsSeo').val();
        }
        IDIOMASEO = $(this).val();
        
        $('#descripcionCorta').val(DESCRIPCION_CORTA[IDIOMASEO]);
        
        $('#tituloSeo').val(TITULO_SEO[IDIOMASEO]);
        $('#keywordsSeo').val(KEYWORDS_SEO[IDIOMASEO]);
        
    });
    
    if(tituloSeo && tituloSeo.trim().length > 2) {
        TITULO_SEO = JSON.parse(tituloSeo);
        if(descripcionCorta && descripcionCorta.trim().length > 2)
            DESCRIPCION_CORTA = JSON.parse(descripcionCorta);
        
        if(keywordsSeo && keywordsSeo.trim().length > 2)
            KEYWORDS_SEO = JSON.parse(keywordsSeo);
        
        for(var lang in TITULO_SEO) {
            break;
        }
        
        $('#idiomaSelectSeo').val(lang);
        
        $('#idiomaSelectSeo').change();
        
    }
    
    IDIOMASEO = $('#idiomaSelectSeo').val();
    
}

function tituloseoFunction(){
    text = $('input[name=nombre]').val().trim();
    if($('select[name=destinoId]').val() > 0)
        text += (' | ' + $('select[name=destinoId] option:selected').text());
    console.log(text);
    $('#tituloSeo').val(text)
}
