$(initConfiguracion);

function initConfiguracion() {
    $('#configFrm').submit(function(e){
        e.preventDefault();
        valid = $(this).validationEngine('validate');
        if(valid) {
            
            $('#blocker').fadeIn();
            data = $(this).serialize();
            $.ajax({
                url: BASE_URL + '/admin-ajax-configuracion',
                data: data,
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    $('#blocker').fadeOut();
                    if(response.msg == 'ok') {
                        toastr.success(response.data);
                        setTimeout(function(){
                            window.location = BASE_URL + '/admin-configuracion-lista';
                        }, 3500);
                    } else {
                        toastr.error(response.data);
                    }
                }
            });
        }
    });
    
    reglasFunction();
    comparacionBooking();
    //sincronizacionVika();
    //configuracion();
    tablaProductos();
}


function tablaProductos() {
    $('#table_producto').dataTable({
        "aLengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"]
        ],
        // set the initial value
        "iDisplayLength": 100,
        "sPaginationType": "bootstrap",
        "oLanguage": {
            "sLengthMenu": "_MENU_ records",
            "oPaginate": {
                "sPrevious": "Prev",
                "sNext": "Next"
            }
        },
        "aoColumnDefs": [{
                'bSortable': false,
                'aTargets': [0, 4]
            }
        ]
    });

    jQuery('#table_producto .group-checkable').change(function () {
        var set = jQuery(this).attr("data-set");
        var checked = jQuery(this).is(":checked");
        jQuery(set).each(function () {
            if (checked) {
                $(this).attr("checked", true);
            } else {
                $(this).attr("checked", false);
            }
        });
        jQuery.uniform.update(set);
    });

    jQuery('#table_producto_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    jQuery('#table_producto_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
    jQuery('#table_producto_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

}

function reglasFunction() {
    
    if($('input[name=cuponPromocional]:checked').length > 0) {
        $('#cuponesPromocionales, #reglas').show();
        $('#reglas input, #reglas select').prop('disabled', false);
    } else {
        $('#cuponesPromocionales, #reglas').hide();
        $('#reglas input, #reglas select').prop('disabled', true);
    }
    
    $('input[name=cuponPromocional]').change(function(){
        if($('input[name=cuponPromocional]:checked').length > 0) {
            $('#cuponesPromocionales, #reglas').slideDown();
            $('#reglas input, #reglas select').prop('disabled', false);
        } else {
            $('#cuponesPromocionales, #reglas').slideUp();
            $('#reglas input, #reglas select').prop('disabled', true);
        }
    });
    
    //Agregar una regla
    $('#add_regla').click(function(e){
        e.preventDefault();
        regla = $('#regla-descuento-hidden').clone();
        regla.removeAttr('id');
        name = 'XX_' + new Date().getTime();
        regla.find('input, select').each(function(){
            $(this).prop('disabled', false)
            $(this).attr('name', $(this).attr('name').replace('XX', name));
        })
        $('#reglas').append(regla);
        
        regla.find('.generar_cupones').click(function(){
            mostrarCupones($(this).attr('name'));
        });

        eliminarReglas();
    });

    $('#reglas .generar_cupones').click(function(){
        mostrarCupones($(this).attr('name'));
    });

    eliminarReglas();
}

function mostrarCupones(id){
    $('#cupones_body').html("");

    $.ajax({
        url: BASE_URL + '/admin-ajax-cupones',
        data: {
            action:'getAll',
            id:id
        },
        type: 'post',
        dataType: 'json',
        success: function(response) {
            if(response.data.html) {
                $('#cupones_modal').modal();
                $('#cupones_body').html(response.data.html);
            } else {
                toastr.error(response.data.msg);
            }
        }
    });
}

function eliminarReglas() {
    $('.delete-pago-container a').off('click').on('click', function(e){
        e.preventDefault();
        $(this).parent().parent().remove();
    })
}
/*
function configuracion() {
    vika = $('input[name=sincronizacionVika]').prop('checked'); 
    $('input[type=text][name^="vika"], input[type=password][name^="vika"]').prop('disabled', !vika);
}*/

function comparacionBooking() {
    if($('input[name=comparacionBooking]:checked').length > 0) {
        $('#comparacionBooking').show();
        $('#comparacionBooking input, #comparacionBooking select').prop('disabled', false);
    } else {
        $('#comparacionBooking').hide();
        $('#comparacionBooking input, #comparacionBooking select').prop('disabled', true);
    }
    
    $('input[name=comparacionBooking]').change(function(){
        if($('input[name=comparacionBooking]:checked').length > 0) {
            $('#comparacionBooking').slideDown();
            $('#comparacionBooking input, #comparacionBooking select').prop('disabled', false);
        } else {
            $('#comparacionBooking').slideUp();
            $('#comparacionBooking input, #comparacionBooking select').prop('disabled', true);
        }
    });
}

/*function sincronizacionVika() {
    if($('input[name=sincronizacionVika]:checked').length > 0) {
        $('.sincronizacionVika').show();
        $('.sincronizacionVika input').prop('disabled', false);
        $('input[name=cuponPromocional]').prop('disabled', false);
    } else {
        $('.sincronizacionVika').hide();
        $('.sincronizacionVika input').prop('disabled', true);
        $('input[name=cuponPromocional]').prop('checked', false).prop('disabled', true);
    }
    
    $('input[name=sincronizacionVika]').change(function(){
        if($('input[name=sincronizacionVika]:checked').length > 0) {
            $('.sincronizacionVika').slideDown();
            $('.sincronizacionVika input').prop('disabled', false);
            $('input[name=cuponPromocional]').prop('disabled', false);
        } else {
            $('.sincronizacionVika').slideUp();
            $('.sincronizacionVika input').prop('disabled', true);
            $('input[name=cuponPromocional]').prop('checked', false).prop('disabled', true);
        }
    });
}*/