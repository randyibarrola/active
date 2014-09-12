$(initIdiomas);

function initIdiomas() {
    $('#idioma').change(seleccionarIdioma);
    
    $('#frmTraducciones').submit(function(e){
        e.preventDefault();
        data = $(this).serialize();
        $('#blocker').fadeIn();
        $.ajax({
            url: BASE_URL + '/admin-ajax-idioma',
            data: data,
            type: 'post',
            dataType: 'json',
            success: function(response) {
                $('#blocker').fadeOut();
                if(response.msg == 'ok') {
                    toastr.success('Se guardaron los cambios correctamente');
                    CONFIG[response.idioma] = response[response.idioma];
                    seleccionarIdioma();
                }
            }
        })
    });
    delete_palabra();
    addIdioma();
}

function delete_palabra(){
    $('#table_traducciones .delete').off().on('click',function(){
        $(this).parents('tr').remove();
        return false;
    });
}

function seleccionarIdioma() {
    idioma = $('#idioma').val();
    $('#table_traducciones tbody').html('');
    traducciones = CONFIG.es;
    for(key in traducciones) {
        row = '<tr><td>' + key + '</td><td>' 
                + traducciones[key] + '</td><td><textarea class="form-control" name="traducciones[' + key + ']" >' 
                + (CONFIG[idioma][key] ? CONFIG[idioma][key] : '') + '</textarea></td>';
        if(USUARIO_TIPO == 1)
            row += '<td><a class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a></td>';
        row += '</tr>';

        $('#table_traducciones tbody').append(row);
        delete_palabra();
    }
}

function addIdioma() {
    $('#addIdiomaBtn').click(function(e) {
        e.preventDefault();
        $('#addIdioma_modal').modal();
    })
}


