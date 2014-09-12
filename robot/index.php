<?php 
include 'ganon.php';
ob_implicit_flush(true);

$loginUrl = 'http://www.booking.com/hotel/es/oasis-duna-corralejo-fuerteventura.es.html';

$opciones = array(
  'http'=>array(
    'method'=>"GET",
    'header'=>"Accept-language: es\r\n" .
               'User-agent: Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3B48b Safari/419.3'
  )
);
$contexto = stream_context_create($opciones);
$content = file_get_contents($loginUrl, false, $contexto);
$html = str_get_dom($content);
$inputs = $html('#form_search input');
$url = $loginUrl.'?';

$notparse = array('checkin_monthday'=>'31','checkin_year_month'=>'2013-10','checkout_year_month' => '2013-11','checkout_monthday' => '1','ci_date' => '2013-10-31','co_date' => '2013-11-1','search_form_id' => '192a1bab236301f7');
foreach ($inputs as $input) {	
	if(!array_key_exists($input->name,$notparse)){
		$url .= $input->name.'='.urlencode($input->value).'&';
	}else{
		$url .= $input->name.'='.urlencode($notparse[$input->name]).'&';
	}
}
$content = file_get_contents($url, false, $contexto);
$html = str_get_dom($content);
$apartamentos = $html('#bookForm ul li');

foreach ($apartamentos as $a) {
	echo '<h1>titulo</h1>';
	$titulo = $a('h2');
 	echo $titulo[0]->getPlainTextUTF8();

	$imagenes = $a('.roomImage');
	echo '<h1>Imagen</h1>';
	foreach ($imagenes as $image) {
		echo $image->getAttribute('data-big-image').'<br />';
	}

	echo '<h1>Precio</h1>';
	$precio = $a('.price');
	echo $precio[0]->getPlainTextUTF8();

	echo '<h1>Condiciones</h1>';
	$condiciones = $a('h3 span');
	echo $condiciones[0]->getPlainTextUTF8();	

	echo '<h1>Maxima cantidad de apartamentos</h1>';
	$maximo = $a('.num_rooms');
	echo $maximo[0]->getAttribute('data-max-rooms');

	echo '<hr /><br />';

}

?>