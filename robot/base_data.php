<?php 
include 'ganon.php';
ob_implicit_flush(true);

$loginUrl = 'http://www.booking.com/hotel/es/oasis-duna-corralejo-fuerteventura.es.html';

$opciones = array(
  'http'=>array(
    'method'=>"GET",
    'header'=>"Accept-language: es\r\n"
  )
);

$contexto = stream_context_create($opciones);
$content = file_get_contents($loginUrl, false, $contexto);
$html = str_get_dom($content);
$photos = $html('#photos_distinct a');

//Imagenes
echo '<h1>Imagenes</h1>';
 foreach($photos as $element) {
   echo ($element->getAttribute('data-resized')).'<br />';
 }

 echo '<br /><h1>Descripcion</h1>';
 $descripcion = $html('#summary');
 print_r($descripcion[0]->getInnerText());

?>