<?php

include 'Lib/ganon.php';
ob_implicit_flush(true);

ini_set('memory_limit', '2048M');

$result = array( 'msg' => 'error', 'data' => 'Seleccione el hotel');

if(isset($_REQUEST['id'])){
    $hotel_id = $_REQUEST['id'];

    $hotel = getHotelById($hotel_id);
    
    
    $opciones = array(
        'http' => array(
            'method' => "GET",
            'header' => "Accept-language: es\r\n"
        )
    );
    set_time_limit(9999999999);
    
    $hotel_url = $hotel->url;
    
    if(!isset($_REQUEST['imagenes'])) {
        
        if ($hotel) {
            deleteHotelServicios($hotel->id);
            //deleteHotelImages($hotel->id);       

        }
    
        $codigos = array(
            'es',
            'en',
            'it',
            'de',
            'fr',
            'ru',
            'pt'
        );


        $blacklist = getWordsInBlacklist();

        if($hotel->idiomas)
            foreach ($hotel->idiomas as $idioma) {
                if(!in_array($idioma->codigo, $codigos))
                    array_push($codigos, $idioma->codigo);
            }


        $descripciones_array = array();
        $descripciones_largas_array = array();
        $nombreHotel = '';
        $servicios_array = array();
        $condiciones_array = array();
        $tener_en_cuenta_array = array();

        //iterando sobre los idiomas del hotel
        foreach ($codigos as $key=>$codigo_idioma) {

            $url = $hotel_url . '?lang=' . $codigo_idioma;

            $contexto = stream_context_create($opciones);
            $content = file_get_contents($url, false, $contexto);
            $html = str_get_dom($content);
            /*
            if($key == 0) {
                $photos = $html('#photos_distinct a');

                foreach ($photos as $e_k => $element) {
                    $imagen = array();
                    $ruta = false;

                    if (strlen($element->getAttribute('data-resized')) > 0) {
                        $ruta = trim($element->getAttribute('data-resized'));
                    }else if (strlen($element->getAttribute('href')) > 0) {
                        $ruta = trim($element->getAttribute('href'));
                    }


                    if ($ruta) {

                        $arr = explode(".", $ruta);
                        $img_ext = $arr[count($arr) - 1];

                        $new_name = md5($ruta);

                        $new_file_name = $template_dir . "/images/apartamentos/" . $new_name . "." . $img_ext;

                        if(!file_exists($new_file_name))
                            file_put_contents($new_file_name, file_get_contents($ruta));

                        $new_ruta = $template_url . "/images/apartamentos/" . $new_name . "." . $img_ext; 

                        $imagen['ruta'] = $new_ruta;

                    }
                    $imagen['tipo'] = 'imagen';
                    $imagen['extension'] = 'jpg';

                    insertHotelImage($imagen, $hotel->id);
                }
            }*/

            //Nombre y descripcion
            $descripcion = $html('#summary');
            $descripcion_larga = str_replace($blacklist, "", trim($descripcion[0]->getInnerText()));

            $nombre = $html('#hp_hotel_name');
            $nombre = str_replace($blacklist, "", trim($nombre[0]->getPlainTextUTF8()));

            $rating = $html('#wrap-hotelpage-top h1 .stars');

            if(isset($rating[0]) && strlen($rating[0]->getAttribute('title'))>0){
                $rating = filter_var($rating[0]->getAttribute('title'), FILTER_SANITIZE_NUMBER_INT);    
            }else{
                $rating = 0;
            }

            $descripciones_largas_array[$codigo_idioma] = $descripcion_larga;
            $nombreHotel = $nombre;

            //servicios
            
            $servicios = $html('.nha_single_unit_facilities .description');

            foreach ($servicios as $s1=>$servicio) {
                $servicio_t = $servicio('.facility_name');
                
                if($servicio_t && $servicio_t[0]){
                    $servicio_t = str_replace($blacklist, "", $servicio_t[0]->getPlainText());
                }else{
                    $servicio_t = $servicio('h3');    
                    if($servicio_t && $servicio_t[0]) $servicio_t = str_replace($blacklist, "", $servicio_t[0]->getPlainText());
                }

                $servicio_p = $servicio('.firstpar');
                if(isset($servicio_p) && $servicio_p){
                    $servicio_p = str_replace($blacklist, "", $servicio_p[0]->getPlainText());
                }else{
                    $servicio_p = $servicio('.positive_policy_free');
                    if($servicio_p && $servicio_p[0]) $servicio_p = str_replace($blacklist, "", $servicio_p[0]->getPlainText());
                }
                
                if($servicio_p && strlen($servicio_p)>0){
                    $servicios_text = split(',', trim($servicio_p));

                    foreach ($servicios_text as $s2=>$servicio_text) {
                            if(!isset($servicios_array[$s1 . '_' . $s2])) {
                                $servicios_array[$s1 . '_' . $s2] = array(
                                    'categoria' => array(),
                                    'servicio' => array()
                                );
                            }

                            $servicios_array[$s1 . '_' . $s2]['categoria'][$codigo_idioma] = trim($servicio_t);
                            $servicios_array[$s1 . '_' . $s2]['servicio'][$codigo_idioma] = trim($servicio_text);
                    }
                }
            }
            
            $condiciones = $html('.descriptionsContainer .description');
            
            foreach ($condiciones as $s1=>$servicio) {
                $servicio_t_p = $servicio('p');
                if($servicio_t_p && isset($servicio_t_p[0]))
                    $servicio_t = str_replace($blacklist, "", $servicio_t_p[0]->getPlainText());

                if($servicio_t_p && isset($servicio_t_p[1])){
                    $servicio_p = str_replace($blacklist, "", $servicio_t_p[1]->getPlainText());

                    $servicios_text = split(',', trim($servicio_p));

                    foreach ($servicios_text as $s2=>$servicio_text) {
                            if(!isset($condiciones_array[$s1 . '_' . $s2])) {
                                $condiciones_array[$s1 . '_' . $s2] = array(
                                    'categoria' => array(),
                                    'servicio' => array()
                                );
                            }

                            $condiciones_array[$s1 . '_' . $s2]['categoria'][$codigo_idioma] = trim($servicio_t);
                            $condiciones_array[$s1 . '_' . $s2]['servicio'][$codigo_idioma] = trim($servicio_text);
                    }
                }
            }
            
            $a_tener_en_cuenta = $html('.loy_important_info_highlight .description');
            foreach ($a_tener_en_cuenta as $a) {
                $atec = html_entity_decode($a->toString(true, true, 1), ENT_QUOTES);
                $tener_en_cuenta_array[$codigo_idioma] = $atec;
            }
            
            

            //Mapa!
            if($key == 0) {
                $metas = $html('meta');


                foreach ($metas as $meta) {
                        if($meta->getAttribute('property') == 'booking_com:location:latitude'){
                                $latitude = $meta->getAttribute('content');
                        }else if($meta->getAttribute('property') == 'booking_com:location:longitude'){
                                $longitude = $meta->getAttribute('content');
                        }
                }

                if(isset($longitude) && isset($latitude)) {
                    updateDireccionByHotelId($hotel->id, array('lat' => $latitude, 'lon' => $longitude));
                }
            }
        }


        $data_hotel = array(
            'descripcionLarga' => json_encode($descripciones_largas_array),
            'nombre' => $nombreHotel,
            'calidad' => (int) $rating
        );

        updateHotelData($hotel->id, $data_hotel);

        foreach ($servicios_array as $servicio) {
            inserHotelServicio(array('categoria' => json_encode($servicio['categoria']),'servicio' => json_encode($servicio['servicio'])), $hotel->id);
            
        }
        foreach ($condiciones_array as $servicio) {
            inserHotelCondicion(array('categoria' => json_encode($servicio['categoria']),'servicio' => json_encode($servicio['servicio'])), $hotel->id);
        }
        
        inserHotelTenerEnCuenta(json_encode($tener_en_cuenta_array), $hotel->id);
        
        
    } else {
        
        deleteHotelImages($hotel->id); 
        
        $url = $hotel_url;

        $contexto = stream_context_create($opciones);
        $content = file_get_contents($url, false, $contexto);
        $html = str_get_dom($content);
        
        
        $photos = $html('#photos_distinct a');

        foreach ($photos as $e_k => $element) {
            $imagen = array();
            $ruta = false;

            if (strlen($element->getAttribute('data-resized')) > 0) {
                $ruta = trim($element->getAttribute('data-resized'));
            }else if (strlen($element->getAttribute('href')) > 0) {
                $ruta = trim($element->getAttribute('href'));
            }


            if ($ruta) {

                $arr = explode(".", $ruta);
                $img_ext = $arr[count($arr) - 1];

                $new_name = md5($ruta);

                $new_file_name = $template_dir . "/images/apartamentos/" . $new_name . "." . $img_ext;

                if(!file_exists($new_file_name))
                    file_put_contents($new_file_name, file_get_contents($ruta));

                $new_ruta = $template_url . "/images/apartamentos/" . $new_name . "." . $img_ext; 

                $imagen['ruta'] = $new_ruta;

            }
            $imagen['tipo'] = 'imagen';
            $imagen['extension'] = 'jpg';

            insertHotelImage($imagen, $hotel->id);
        }
        
    }
    
    $result['msg'] = 'ok';
    $result['data'] = 'Se guardaron los datos correctamente';
    

}
//print_r($result);
echo json_encode($result);

?>