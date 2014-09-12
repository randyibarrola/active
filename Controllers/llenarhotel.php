<?php

include 'Lib/ganon.php';
ob_implicit_flush(true);

if(isset($_REQUEST['hotel_url'])){
	$hotel_url = $_REQUEST['hotel_url'];
}else{
	$hotel_url = 'http://www.booking.com/hotel/es/oasis-duna-corralejo-fuerteventura.es.html';	
}

$opciones = array(
    'http' => array(
        'method' => "GET",
        'header' => "Accept-language: es\r\n"
    )
);
set_time_limit(600000);
$contexto = stream_context_create($opciones);
$content = file_get_contents($hotel_url, false, $contexto);
$html = str_get_dom($content);
$photos = $html('#photos_distinct a');
$imagenes = array();


foreach ($photos as $e_k => $element) {
    if (strlen($element->getAttribute('data-resized')) > 0) {
        $ruta = trim($element->getAttribute('data-resized'));
        
        $arr = explode(".", $ruta);
        $img_ext = $arr[count($arr) - 1];
        
        $new_name = md5($ruta);
        
        $new_file_name = $template_dir . "/images/apartamentos/" . $new_name . "." . $img_ext;
        
        if(!file_exists($new_file_name))
            file_put_contents($new_file_name, file_get_contents($ruta));
        
        $new_ruta = $template_url . "/images/apartamentos/" . $new_name . "." . $img_ext; 
        
        $imagenes[$e_k]['ruta'] = $new_ruta;
        
    }
    $imagenes[$e_k]['tipo'] = 'imagen';
    $imagenes[$e_k]['extension'] = 'jpg';
}


$hoteles = getHotelByUrl($hotel_url);
if ($hoteles && count($hoteles) > 0) {
    foreach ($hoteles as $h) {
    	deleteHotelServicios($h->id);
        deleteHotelImages($h->id);
        deleteHotel($h->id);
    }
}

$descripcion = $html('#summary');
$descripcion_larga = trim($descripcion[0]->getInnerText());

$nombre = $html('#hp_hotel_name');
$nombre = trim($nombre[0]->getInnerText());

$rating = $html('#wrap-hotelpage-top h1 span.use_sprites');

if(isset($rating[0]) && strlen($rating[0]->getAttribute('title'))>0){
    $rating = filter_var($rating[0]->getAttribute('title'), FILTER_SANITIZE_NUMBER_INT);    
}else{
    $rating = 0;
}



$hotel = array('descripcionLarga' => $descripcion_larga,
    'url' => $hotel_url,
    'estado' => 'activo',
    'visitas' => 0,
    'nombre' => $nombre,
    'calidad' => (int) $rating);

$hotel_id = insertHotel($hotel);

foreach ($imagenes as $imagen) {
    insertHotelImage($imagen, $hotel_id);
}

//Servicios!
$servicios = $html('.nha_single_unit_facilities .description');

$servicios_array = array();

foreach ($servicios as $servicio) {
    $servicio_t = $servicio('h3');
    $servicio_t = $servicio_t[0]->getPlainText();

    $servicio_p = $servicio('p');
    $servicio_p = $servicio_p[0]->getPlainText();
	
	$servicios_text = split(',', trim($servicio_p));

	foreach ($servicios_text as $servicio_text) {
		inserHotelServicio(array('categoria' => trim($servicio_t),'servicio' => trim($servicio_text)), $hotel_id);
	}
}

//Mapa!
$metas = $html('meta');
$latitude = 28.358744;
$longitude = -14.053676;

foreach ($metas as $meta) {
	if($meta->getAttribute('property') == 'booking_com:location:latitude'){
		$latitude = $meta->getAttribute('content');
	}else if($meta->getAttribute('property') == 'booking_com:location:longitude'){
		$longitude = $meta->getAttribute('content');
	}
}

?>