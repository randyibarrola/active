$(initFunction);
function initFunction() {
    $('a.btn[href$=Div]').click(function(e){
        e.preventDefault();
        div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
        form = div.find('form');
        if($('.atc').parent().hasClass('checked'))
            $('.atc').removeClass('validate[required]');
        else $('.atc').addClass('validate[required]');
        valid = form.validationEngine('validate');
        
        if(valid) {
            href = $(this).attr('href');
            goToStep(href);
        }
    });
    $('a.step[href$=Div]').off().click(function(e){
        e.preventDefault();
        return false;
    });

    updateBar();
    coloresFunction();
    generar_widget();
    submit_widget();
    tipo_widget();
}

function submit_widget(){
    $('#formFinalizar').submit(function() {
        $('#action_formulario').val("insert");

        $.ajax({
            url: BASE_URL + '/admin-ajax-widget',
            data: $('#formWizardWidget').serialize()+"&nombre="+$('#widget_nombre').val(),
            type: 'post',
            dataType: 'json',
            success: function(response) {
                if(response.msg == "ok"){
                    window.location = BASE_URL + '/admin-widget-lista';
                }
            }
        });
        return false;
    });
}

function tipo_widget() {
    $('#tipo_widget').click(function() {
        $('.widget_row .col-md-3').hide();

        if($('#tipo_widget_select').val()=="banner"){
            $('.banner_row').show();

            $('#backgroundBody').val("000000");
            $('#textColorBody').val("FFFFFF");
            $('#backgroundButton').val("E8AB47");
            $('#textColorButton').val("FFFFFF");
        }else{
            $('.completo_row').show();
            $('#backgroundBody').val("F9F9F9");
            $('#textColorBody').val("626262");
            $('#backgroundButton').val("C92183");
            $('#textColorButton').val("FFFFFF");
        }
    });
}

function generar_widget() {
    $('#generar_widget').click(function() {
        $('#action_formulario').val("get");
        $('#tipo_formulario').val($('#tipo_widget_select').val());

        $('#widget_html').html("");
        $('#widget_codigo').val("");

        $('#blocker').fadeIn();

        $.ajax({
            url: BASE_URL + '/admin-ajax-widget',
            data: $('#formWizardWidget').serialize(),
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == "ok"){
                    $('#enlace_directo').val(response.data.enlace);
                    $('#widget_html').html(response.data.html);
                    $('#widget_codigo').val(response.data.html);
                }
            }
        });
    });
}

function goToStep(step) {
    div = $('.portlet-body > div > div:not(:hidden):not(.progress)');
    divToGo = $(step);
       
    div.hide();
    divToGo.fadeIn();
    $('a.step[href="#' + div.attr('id') + '"]').parent().removeClass('active').addClass('done');
    $('a.step[href="#' + divToGo.attr('id') + '"]').parent().addClass('active').removeClass('done');
    
    updateBar();
}

function updateBar() {
    var total = $('ul.steps li').length;
    var current = 1;
    $('ul.steps li').each(function(i){
        if($(this).hasClass('active'))
            current = i + 1;
    });

    var $percent = (current / total) * 100;
    $('.form-wizard').find('.progress-bar').css({
        width: $percent + '%'
    });
    $('.portlet-title .caption .step-title').html('Paso ' + current + ' de ' + total);
}

function coloresFunction() {
    $('input.colores').each(function(){
        var color = $(this).val();
        var that = this;
        $(this).ColorPicker({
            color: '#' + color,
                onShow: function (colpkr) {
                    $(colpkr).fadeIn(500);
                    return false;
                },
                onHide: function (colpkr) {
                    $(colpkr).fadeOut(500);
                    return false;
                },
                onChange: function(hsb, hex, rgb, el) {
                    $(that).val(hex);
                }
        });
    });
}