
$(document).ready(function(){
    jQuery.fx.off = true;
    
	$('#blocker').show();
	//$('#buscar_disponibilidad_btn').button('loading');

	window.setTimeout(function(){
		$('#blocker div').html(CALCULANDO_TARIFA+'...');
	},2300);
	
	$.post(BASE_URL + '/ajax-apartamento' + END_URL, function( data ) {
	  $('#apartamentos_container').html(data);
	  //$('#buscar_disponibilidad_btn').button('reset');
	  $('#blocker').slideUp();
	  
	  $('.flexslider').flexslider({
            animation: "fade"
          });
	  
	  $('#blocker div').html(BUSCANDO_DISPONIBILIDAD+'...');
	  $('.cantidad_select').change(function(){
	  	var tarifas = eval($(this).parents('.room_container').find('input.precio_tarifas').val());
                var tarifas_sin_descuento = eval($(this).parents('.room_container').find('input.precio_tarifas_sin_descuento').val());
	  	$(this).parents('.room_container').find('.precio_total span').html(tarifas[$(this).val()-1]);
                if(tarifas_sin_descuento)
                    $(this).parents('.room_container').find('.precio_total_sin_descuento span').html(tarifas_sin_descuento[$(this).val()-1]);
                calcularReglas();
	  });

	  $('.toggle_detalles').click(function(){
	  	var that = $(this);
	  	$(this).parents('.row').find('.descripcion_table').toggle(function(){
	  		if($(this).is(':visible')){
	  			that.html('- '+OCULTAR_DETALLE);
	  		}else{
	  			that.html('+ '+MOSTRAR_DETALLE);
	  		}
            return true;
	  	});
	  });
          calcularReglas();
          $('select.apto-filter').change(filtros);
          
          //hoteles - destino
          startItem = parseInt($('.hotel_list').attr('startitem'));
          itemsByPage = parseInt($('.hotel_list').attr('itemsbypage'));
          totalItems = parseInt($('.hotel_list').attr('totalitems'));
          showMix();
          paginate(parseInt(startItem/itemsByPage) + 1, parseInt(totalItems/itemsByPage) + ((totalItems%itemsByPage == 0) ? 0 : 1));
          
          $('[data-toggle=popover]').popover({trigger:'hover'});
	});
        
        
});

var startItem = 0;
var itemsByPage = 0;
var totalItems = 0;


function calcularReglas() {
    var REGLAS = eval($('#reglas').val());
    $('p.by_this_booking.cupon').parent().hide();
    if(typeof REGLAS == 'object') {
        
        $('.room_container:not(.has_description)').each(function(){
            precio = $(this).find('.precio_total span').html();
            
            precio = precio.replace(CURRENCY, '');
            
            precio = parseFloat(precio);
            
            for(i=REGLAS.length - 1;i >= 0; i--) {
                regla = REGLAS[i];
                if(precio > parseFloat(regla.monto)) {
                    $(this).find('.monto_regla').html(CURRENCY + ' ' + regla.monto);
                    descuento = (regla.tipoDescuento == '%') ? (regla.descuento + regla.tipoDescuento) : (CURRENCY + ' ' + regla.descuento);
                    $(this).find('.descuento_regla').html(descuento);
                    $(this).find('p.by_this_booking.cupon').parent().show();
                    break;
                }
            }
            
        })
        
    }
}

function filtros() {
    $('.room_container, .one-apartment').removeClass('noshow');
    $('select.apto-filter').each(filtrarAptos);
    $('.one-apartment').each(function(){
        if($(this).find('.room_container.hasnt_description:not(.noshow)').length < 1)
            $(this).addClass('noshow');
    });
    
    $('.noshow').fadeOut();
    $('.room_container:not(.noshow), .one-apartment:not(.noshow)').fadeIn();
}

function filtrarAptos() {
    var select = $(this);
    
    if(select.val() == '0') return;
    $('input[name=' + select.attr('id') + ']').each(function(){
        if($(this).val().trim() != select.val().trim()) {
            $(this).parents('.room_container').addClass('noshow');
        }
    })
}

function showMix() {
    $('.mix').animate({opacity: 1}, 500);
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
            
            $.ajax({
                url: BASE_URL + '/admin-ajax-hoteles',
                data: {action: 'filter', start: item, term: DESTINO, hotelId:$('.hotel_list').attr('hotel')},
                type: 'post',
                dataType: 'json',
                success: function(response) {
                    hideMix(response.html, page, (response.hoteles.count / response.hoteles.limit) + ((response.hoteles.count % response.hoteles.limit > 0) ? 1 : 0));
                }
            })
        }
    })
}