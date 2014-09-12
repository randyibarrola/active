$(initReserva);

function initReserva() {
    
    autoCompleteHotel();
    guardarPago();
    
    $('#inicio, #final').datepicker({
        'format' : 'dd-mm-yyyy',
        
    })
}

function autoCompleteHotel() {
    $( "#nombrehotel").typeahead({
        source: function(query, process) {
            $.ajax({
               url: BASE_URL + '/admin-ajax-reserva',
               type: 'post',
               dataType: 'json',
               data: {action:'search', term: query},
               success : function(response) {
                   ELEMENTOS = [];
                   
                    var lista = [];
                    for(i=0;i<response.lista.hoteles.length; i++) {
                        var elemento = response.lista.hoteles[i];
                        elemento.tipo = 'hotel';
                        lista.push(elemento.nombre);
                        ELEMENTOS[elemento.nombre] = elemento;
                    }
                    
                   if(lista.length > 0) {
                       //console.log(lista);
                    return process(lista);
                   }
                   else
                    return process(['No hay elementos para mostrar']); 
               }
            });
        },
        updater: function(item) {
            c = ELEMENTOS[item];
            if(c) {
                $('#hotel').val(c.id);
                
                return item;
            } else {
                $('#hotel').val('');
                return ;
            }
            
            
            
        }
    });
}

function guardarPago() {
    $('#reservaFrm').submit(function(e) {
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        
        if(valid) {
            data = $(this).serialize();
            $('#blocker').fadeIn();
            $.ajax({
                url: BASE_URL + '/admin-ajax-reserva',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        setTimeout(function(){
                           window.location = BASE_URL + '/admin-reserva-lista';
                        }, 3500);
                    } else {
                        toastr.error(response.data);
                    }
                }
            })
        }
    })
}




