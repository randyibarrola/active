<?php

if ($hotel) {
    //include 'Lib/ganon.php';
    ob_implicit_flush(true);

    if (isset($_SESSION["inicio"]) && isset($_SESSION["salida"])) {
        $inicio = strtotime($_SESSION['inicio']);
        $salida = strtotime($_SESSION['salida']);
    }else if (isset($_COOKIE["inicio"]) && isset($_COOKIE["salida"])) {
        $inicio = $_COOKIE['inicio'];
        $inicio = strtotime($inicio);
        
        $salida = $_COOKIE['salida'];
        $salida = strtotime($salida);
    } else {
        exit();
    }
    
    $noches = ceil(($salida - $inicio)/(60*60*24));
    $smarty->assign('noches', $noches);
    
    $auth = base64_encode('pp-arrunkyr:capsstic');

    $opciones = array(
        'http' => array(
            'method' => "GET",
            'proxy' => 'tcp://enuskank.proxysolutions.net:26226',
            'request_fulluri' => true,
            'header' => array(
                    "Accept-language: es",
                    "Proxy-Authorization: Basic $auth",
                    "User-agent: Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3B48b Safari/419.3"
                )
        )
    );

    set_time_limit(0);

    $contexto = stream_context_create($opciones);
    //$lang = 'es';
    $hotel_url = $hotel->url;
    if($hotel->idiomaId) {
        $lang = getIdioma($hotel->idiomaId)->codigo;
    }
    /*if (isset($_REQUEST['l'])) {
        $hotel_url .= '?lang=' . $_REQUEST['l'];
        $lang = $_REQUEST['l'];
    }
    else
        $hotel_url .= '?lang=' . $lang;*/
    $lenguajes_malos = array('de','it','fr','pt','ru');
    
    if(in_array($lang_set, $lenguajes_malos)){
        $lang = 'en';
    }else{
        $lang = $lang_set;
    }

    $hotel_url .= '?lang=' . $lang;

    $coin = getMoneda($hotel->monedaId);
    $moneda = $coin->simbolo;
    $hotel_url .= '&selected_currency='. $coin->codigo;

    $content = file_get_contents($hotel_url, false, $contexto);

    //$html = str_get_dom($content);

    
    //lista negra
    $blacklist = getWordsInBlacklistToRemove($hotel->id);
    
    
    
    $blacklistNoResults = getWordsInBlacklistToRemoveResult($hotel->id);
    
    //promocion por palabras clave
    $promociones = getPromocionByHotelIdAndFechas($hotel->id, $inicio, $salida);
    
    
    //$inputs = $html('#form_search input');
    $url = $hotel_url . '&';

    $notparse = array('checkin_monthday' => date('d', $inicio),
        'checkin_year_month' => date('Y-m', $inicio),
        'checkout_year_month' => date('Y-m', $salida),
        'checkout_monthday' => date('d', $salida),
        'ci_date' => date('Y-m-d', $inicio),
        'co_date' => date('Y-m-d', $salida)
    );

    /*
    Antiguo robot
    foreach ($inputs as $input) {
        if (!array_key_exists($input->name, $notparse)) {
            $url .= $input->name . '=' . urlencode($input->value) . '&';
        } else {
            $url .= $input->name . '=' . urlencode($notparse[$input->name]) . '&';
        }
    }*/
    
    //Para los selectores
    $condicionesS = array();
    $pensionesS = array();
    $paxesS = array();

    //Nuevo robot
    $dom = new DOMDocument(); 
    @$dom->loadHTML($content); 
    $x = new DOMXPath($dom);

    foreach($x->query('//form[@id="form_search"]/input[@type="hidden"]') as $node){ 
        $name = $node->getAttribute('name');
        if (!array_key_exists($name, $notparse)) {
            $url .= $name . '=' . urlencode($node->getAttribute('value')) . '&';
        } else {
            $url .= $name . '=' . urlencode($notparse[$name]) . '&';
        }
    } 
    //Nuevo robot

    $content = file_get_contents($url, false, $contexto);
    
    $titulos = array();

    //Nuevo robot
        $dom = new DOMDocument('1.0', 'utf-8'); 
        @$dom->loadHTML('<meta http-equiv="content-type" content="text/html; charset=utf-8">'.$content); 
        $x = new DOMXPath($dom);
        $aparts = array();

        //$cantidad_apartamentos = $x->query('//form[@id="bookForm"]/ul/li')->length;
        $a_security = $x->query('//div[@id="hp_change_dates"]/a[contains(@class,"primary_cta")]');
        
        foreach ($a_security as $a) {
            if($a){
                $href = $a->getAttribute('href');
                $content = file_get_contents($href, false, $contexto);

                $dom = new DOMDocument('1.0', 'utf-8'); 
                @$dom->loadHTML('<meta http-equiv="content-type" content="text/html; charset=utf-8">'.$content); 
                $x = new DOMXPath($dom);
            }
            break;
        }


        foreach($x->query('//form[@id="bookForm"]/ul/li') as $pk => $n){
            $es_diferente = true;
            
            $eliminar = false;
            
            $k = 'X_' . $pk . '_0';
            
            $promocionesPC = false;
            if($promociones) {
                foreach ($promociones as $promocion) {
                    if($promocion && (!$promocion->palabras || strlen(trim($promocion->palabras)) == 0)) {
                        if(!$promocionesPC) $promocionesPC = array();
                        $promocionesPC[$promocion->id] = $promocion;
                    }
                }
            }
            

            foreach ($x->query('div/h2', $n) as $h2) {
                $aparts[$k]['titulo'] = str_replace($blacklist, "", $h2->nodeValue);
                
                if($promociones && (!$promocionesPC || count($promocionesPC) < count($promociones))) {
                    foreach ($promociones as $promocion) {
                        if(!$promocionesPC[$promocion->id] && verificarPromocion(array($promocion), $aparts[$k]['titulo'])) {
                            if(!$promocionesPC) $promocionesPC = array();
                            $promocionesPC[$promocion->id] = $promocion;
                        }
                               
                    }
                }
                
                if(!in_array($h2->nodeValue, $titulos)){
                    $titulos = array();
                    $titulos[] = $aparts[$k]['titulo'];
                }else{
                    $es_diferente= false;
                }
            }
            
            if(isValidResult($blacklistNoResults, $aparts[$k]['titulo'])){
                unset($aparts[$k]);
                continue;
            }

            $aparts[$k]['es_diferente'] = $es_diferente;

            //if($es_diferente){
                $cleanBlackList = array();
                foreach ($blacklist as $b) {
                    $cleanBlackList[] = trim(StringUtils::clean($b));
                }
                foreach($x->query('div/div[contains(@class,"room_info_wrapp")]/p',$n) as $info_k => $info){
                    
                    if($info_k==0){
                        if($es_diferente)
                            $aparts[$k]['descripcion'] = $info->nodeValue;
                    }else{
                        $string = preg_replace('/\s+/', ' ', trim($info->nodeValue));;
                        if(strlen(trim(str_replace($cleanBlackList, '', trim(StringUtils::clean($string))))) < strlen(trim(StringUtils::clean($string))))
                            continue;
                        else
                            $aparts[$k]['servicios'][] = $info->nodeValue;
                    }
                    
                    if($promociones && (!$promocionesPC || count($promocionesPC) < count($promociones))) {
                        foreach ($promociones as $promocion) {
                            if(!$promocionesPC[$promocion->id] && verificarPromocion(array($promocion), $info->nodeValue)) {
                                if(!$promocionesPC) $promocionesPC = array();
                                $promocionesPC[$promocion->id] = $promocion;
                            }

                        }
                    }
                }
                
                if($hotel->tipoReserva == 'cobro anticipado de comisiones') {
                    $comisionText = $smarty->getConfigVariable('garantizamos_tu_reserva') . ': ';
                    $comisionText .= $smarty->getConfigVariable('se_cargara_un') . ' ';
                    $comisionText .= $hotel->porcentageCobroAnticipado . '% ';
                    $comisionText .= $smarty->getConfigVariable('de_tu_reserva_como_garantia') . ' ';
                    $aparts[$k]['servicios'][] = $comisionText;
                }

                if(isValidResult($blacklistNoResults, $aparts[$k]['descripcion'])){
                    unset($aparts[$k]);
                    continue;
                }
            
                foreach ($x->query('div/div[contains(@class,"room_info_wrapp")]/div/div[contains(@class,"swipe_gallery_container")]/div/div[contains(@class,"roomImage")]',$n) as $image) {
                    $ruta = $image->getAttribute('data-big-image');
                    $arr = explode(".", $ruta);
                    $img_ext = $arr[count($arr) - 1];

                    $new_name = md5($ruta);

                    $new_file_name = $template_dir . "/images/apartamentos/" . $new_name . "." . $img_ext;

                    if (!file_exists($new_file_name))
                        file_put_contents($new_file_name, file_get_contents($ruta));

                    $new_ruta = 'https://'.$hotel->campania->subdominio . "/templates/images/apartamentos/" . $new_name . "." . $img_ext;

                    $aparts[$k]['imagenes'][] = $new_ruta;
                }
            /*}else{
                $aparts[$k]['imagenes'] = array_merge($aparts['X_' . $pk - 1 . '_0']['imagenes'], array());
            }*/
            /*
            $precio = '';

            foreach ($x->query('div/div[contains(@class,"roomInfo")]/span[@class="price "]', $n) as $p_k => $precio) {
                $precio = $precio->nodeValue;
                break;
            }

            if(!$precio){
                foreach ($x->query('div/div/div[contains(@class,"roomInfo")]/span[@class="price "]', $n) as $p_k => $precio) {
                    $precio = $precio->nodeValue;
                    break;
                }
            }

            if(!$precio){
                foreach ($x->query('div/div/span[@class="price "]', $n) as $p_k => $precio) {
                    $precio = $precio->nodeValue;
                    break;
                }
            }

            if(!$precio){
                foreach ($x->query('div/div/span[@class="price nm"]', $n) as $p_k => $precio) {
                    $precio = $precio->nodeValue;
                    break;
                }
            }

            if(!$precio){
                foreach ($x->query('div/div/div[contains(@class,"roomInfo")]/span[@class="price nm"]', $n) as $p_k => $precio) {
                    $precio = $precio->nodeValue;
                    break;
                }
            }

            if(!$precio){
                foreach ($x->query('div/div[contains(@class,"roomInfo")]/span[@class="price nm"]', $n) as $p_k => $precio) {
                    $precio = $precio->nodeValue;
                    break;
                }
            }*/
            $precio = false;

            foreach ($x->query('div/div/div[contains(@class,"num_rooms")]/script', $n) as $script) {
                $scripts = split('=', $script->nodeValue);

                $tarifa = str_replace(';', '', trim($scripts[1]));

                $tarifa = str_replace("[", "", str_replace("]", "", $tarifa));
                $tarifas = explode("','", $tarifa);
                $tarifa = '[';

                foreach ($tarifas as $p => $t) {
                        $precio_tarifa_s = false;
                        $t = str_replace("'", "", $t);

                        foreach (explode(" ", trim($t)) as $tp) {
                            $tp = str_replace('US$', '', $tp);
                            if (strlen($tp) && is_numeric(str_replace(",", "", $tp)))
                                $precio_tarifa_s = getNumberFromStr($tp);
                        }

                        $precio = $precio_tarifa_s;
                        break;
                    }
            }

            if(!$precio){
                unset($aparts[$k]);
                break;
            }

            $delete = false;
            if($hotel->respetarCupo)
            foreach ($x->query('div/div/div[contains(@class,"num_rooms")]', $n) as  $max_rooms) {
                if(intval($max_rooms->getAttribute('data-max-rooms'))<=1){
                    $delete = true;
                }
            }

            if($delete){
                unset($aparts[$k]);
                continue;
            }

            //for ($i=1; $i < 25; $i++) { 
            foreach ($x->query('div/div[contains(@class,"maxPersonsInfo")]/div/span[contains(@class,"numberOfPeople")]', $n) as $a) {
                if( is_numeric($a->nodeValue) ){
                    $aparts[$k]['adultos'] = $a->nodeValue;    
                    break;
                }
            } 
            foreach ($x->query('div/div[contains(@class,"maxPersonsInfo")]/div/span[contains(@class,"numberOfKids")]', $n) as $a) {
                if( is_numeric($a->nodeValue) ){
                    $aparts[$k]['ninios'] = $a->nodeValue;
                    break;
                }
            } 
            //}
            //Esta está bien
            if(!$aparts[$k]['adultos'] || !is_numeric($aparts[$k]['adultos']) ){
                for ($i=1; $i < 25; $i++) { 
                    foreach ($x->query('div/div[contains(@class,"maxPersonsInfo")]/span[contains(@class,"occsprite2 max'.$i.'")]', $n) as $a) {
                        $aparts[$k]['adultos'] = $i;
                    } 
                    foreach ($x->query('div/div[contains(@class,"maxPersonsInfo")]/span[contains(@class,"occsprite_sml kids max'.$i.'")]', $n) as $a) {
                        $aparts[$k]['ninios'] = $i;
                    } 
                }
            }

            //Esta es la mera nueva =)
            if(!$aparts[$k]['adultos'] || !is_numeric($aparts[$k]['adultos']) ){
                foreach ($x->query('div[contains(@class,"room")]/div[contains(@class,"maxPersonsInfo")]/div/span[contains(@class,"numberOfPeople")]', $n) as $a) {
                    if( is_numeric($a->nodeValue) ){
                        $aparts[$k]['adultos'] = $a->nodeValue;
                    }
                } 
                foreach ($x->query('div[contains(@class,"room")]/div[contains(@class,"maxPersonsInfo")]/div/span[contains(@class,"numberOfKids")]', $n) as $a) {
                    if( is_numeric($a->nodeValue) ){
                        $aparts[$k]['ninios'] = $a->nodeValue;
                    }
                } 
            }

            // 2/Septiembre/2014
            if(!$aparts[$k]['adultos'] || !is_numeric($aparts[$k]['adultos']) ){
                foreach ($x->query('div[contains(@class,"room")]/div[contains(@class,"maxPersonsInfo")]/span[contains(@class,"max-peeps")]', $n) as $a) {
                    if(is_numeric($a->nodeValue) ){
                        $aparts[$k]['adultos'] = $a->nodeValue;
                    }
                }

                $n_c = 0;
                foreach ($x->query('div[contains(@class,"room")]/div[contains(@class,"maxPersonsInfo")]/span[contains(@class,"max-kiddos")]', $n) as $a) {
                    $v = preg_replace('/\D/', '', $a->nodeValue);
                    if(is_numeric($v) && $n_c == 0){
                        $aparts[$k]['adultos'] = $v;
                    }else if(is_numeric($v) && $n_c == 1){
                        $aparts[$k]['ninios'] = $v;
                    }
                    $n_c++;
                } 
            }

            if(!$aparts[$k]['adultos'] || !is_numeric($aparts[$k]['adultos']) ){
                //Nuevo maquetado
                for ($i=1; $i < 25; $i++) { 
                    foreach ($x->query('div/div/div[contains(@class,"roomInfo")]/span[contains(@class,"occsprite2 max'.$i.'")]', $n) as $a) {
                        $aparts[$k]['adultos'] = $i;
                        echo 'old_3 ';
                    } 
                    foreach ($x->query('div/div/div[contains(@class,"roomInfo")]/span/span[contains(@class,"occsprite_sml kids max'.$i.'")]', $n) as $a) {
                        $aparts[$k]['ninios'] = $i;
                    } 
                }
            }

            if(!$aparts[$k]['adultos'] || !is_numeric($aparts[$k]['adultos']) ){
                //Nuevo maquetado
                for ($i=1; $i < 25; $i++) { 
                    foreach ($x->query('div/div/p/span[contains(@class,"occsprite max'.$i.'")]', $n) as $a) {
                        $aparts[$k]['adultos'] = $i;
                    }
                    foreach ($x->query('div/div/p/span[contains(@class,"occsprite kids max'.$i.'")]', $n) as $a) {
                        $aparts[$k]['ninios'] = $i;
                    } 
                }
            }
            if(!$aparts[$k]['adultos'] || !is_numeric($aparts[$k]['adultos']) ){
                //Nuevo maquetado
                for ($i=1; $i < 25; $i++) {
                    foreach ($x->query('div/div[contains(@class,"maxPersonsInfo")]/div[contains(@id,"newIcons")]', $n) as $a) {
                        foreach ($x->query('span[contains(@class,"max'.$i.'")]', $a) as $b) {
                            $aparts[$k]['adultos'] = $i;
                        }
                        foreach ($x->query('span[contains(@class,"kids max'.$i.'")]', $a) as $b) {
                            $aparts[$k]['ninios'] = $i;
                        }    
                    }
                }
            }

            //condiciones
            foreach ($x->query('div/h3', $n) as $h3) {
                $aparts[$k]['condicion'] = trim(str_replace($blacklist, "", $h3->nodeValue));
            }

           /* if(!$aparts[$k]['adultos'] || !$precio){
                $mail = new Core_Mailer();                               
                $mail->send_email('ruben.velazquez.calva@gmail.com', 'Error en el maquetado', 'Error en Pax o tarifas, arreglar!');
                $mail->send_email('matias.barbarroja@gmail.com', 'Error en el maquetado', 'Error en Pax o tarifas, alerta!!, alerta!!');
            }*/

            if(isset($aparts[$k]['condicion']) && strlen($aparts[$k]['condicion'])>0){
                $condicion = $aparts[$k]['condicion'];
                $pensiones = split('•', $condicion);
                if(count($pensiones)>1){
                    $aparts[$k]['pension']  = trim($pensiones[1]);
                    $aparts[$k]['condicion'] = trim($pensiones[0]);
                }else{
                    $aparts[$k]['pension'] = $smarty->getConfigVariable('solo_alojamiento');
                }
            }else{
                $aparts[$k]['pension'] = $smarty->getConfigVariable('solo_alojamiento');
            }

            if(isValidResult($blacklistNoResults, $aparts[$k]['condicion'])){
                unset($aparts[$k]);
                continue;
            }
            
            
            if($promociones && (!$promocionesPC || count($promocionesPC) < count($promociones))) {
                foreach ($promociones as $promocion) {
                    if(!$promocionesPC[$promocion->id] && verificarPromocion(array($promocion), $aparts[$k]['condicion'])) {
                        if(!$promocionesPC) $promocionesPC = array();
                        $promocionesPC[$promocion->id] = $promocion;
                    }

                }
            }
            
            //Precio(promocion por fecha)
            
            //para selectores
            $condicionesS[$aparts[$k]['condicion']] = $aparts[$k]['condicion'];
            $pensionesS[$aparts[$k]['pension']] = $aparts[$k]['pension'];
            
            $pax_k = $aparts[$k]['adultos'];
            if($aparts[$k]['ninios']) $pax_k .= ('-' . $aparts[$k]['ninios']);
            $paxesS[$pax_k] = array(
                'adultos' => $aparts[$k]['adultos'],
                'ninios' => $aparts[$k]['ninios']
            );

            //precios
            $monedas = getAllMonedas();
            
            $precio = $currencyDetector->getAmount($precio);
            $aparts[$k]['precio_sin_descuento'] = $moneda . number_format($precio, 2, ',', ' ');
            //precios sin descuento por moneda
            foreach ($monedas as $m) {
                if($m->id != $hotel->monedaId) {
                    $precio_moneda = convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $m->codigo);
                    $aparts[$k]['precios_sin_descuento'][$m->codigo] = $m->simbolo . number_format($precio_moneda, 2, ',', '');
                }
            }
            
            
            if ($promocionesPC) {                
                $precio_real = $currencyDetector->getAmount($precio);
                
                foreach ($promocionesPC as $promocionPC) {
                    $precio_promocion = $precio_real;                                   
                    $descuento = $promocionPC->descuentoBooking;
                    if ($promocionPC->tipoDescuentoBooking == '%') {
                        $descuento = $precio_promocion * $descuento / 100;
                    }
                    $precio_promocion -= $descuento;
                    
                    if(!$promocionPC->condicionPagoOnline) {
                        $precio = $precio_promocion;
                        $aparts[$k]['descuento'] = ($promocionPC->tipoDescuentoBooking == '%') ? $promocionPC->descuentoBooking: $descuento;
                        $aparts[$k]['tipoDescuento'] = $promocionPC->tipoDescuentoBooking;
                    } else {
                        $kk = 'X_' . $pk . "_" . $promocionPC->id;
                        $aparts[$kk]['descuento'] = ($promocionPC->tipoDescuentoBooking == '%') ? $promocionPC->descuentoBooking: $descuento;
                        $aparts[$kk]['tipoDescuento'] = $promocionPC->tipoDescuentoBooking;
                        $aparts[$kk]['condicionOnline'] = 1;
                        $aparts[$kk]['pagoOnline'] = $promocionPC->pagoOnline;
                        
                        foreach ($monedas as $m) {
                            if($m->id != $hotel->monedaId) {
                                $precio_moneda = convertFromMonedaToMoneda($precio_promocion, $hotel->moneda->codigo, $m->codigo);
                                $aparts[$kk]['precios'][$m->codigo] = $m->simbolo .' '. number_format($precio_moneda, 2, ',', '');
                            }
                        }

                        $aparts[$kk]['precio'] = $moneda . number_format($precio_promocion, 2, ',', ' ');
                        
                        $aparts[$kk]['titulo'] = $aparts[$k]['titulo'];
                        $aparts[$kk]['pension']  = $aparts[$k]['pension'];
                        $aparts[$kk]['condicion'] = $aparts[$k]['condicion'];
                        $aparts[$kk]['adultos'] = $aparts[$k]['adultos'];
                        $aparts[$kk]['ninios'] = $aparts[$k]['ninios'];
                        $aparts[$kk]['precios_sin_descuento'] = $aparts[$k]['precios_sin_descuento'];
                        $aparts[$kk]['imagenes'] = $aparts[$k]['imagenes'];
                    }
                }
                
            }
            
            foreach ($monedas as $m) {
                if($m->codigo != $money) {
                    $precio_moneda = convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $m->codigo);
                    $aparts[$k]['precios'][$m->codigo] = $m->simbolo .' '. $precio_moneda;
                }
            }
            
            $precio_seleccionado = convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $money);
            $precio_moneda_seleccionada = $currency . $precio_seleccionado;
            $aparts[$k]['precio_moneda_seleccionada'] = $precio_moneda_seleccionada;
            $aparts[$k]['precio_moneda_seleccionada_especulado'] = $currency . number_format ( ($precio_seleccionado +  ( rand(20,50) * $precio_seleccionado ) / 100 ), 2,',' ,'') ;            
            $precio = $moneda . number_format($precio, 2, ',', ' ');
            $aparts[$k]['precio'] = $precio;

    }

    
    $_SESSION['apartamentos'] = $aparts;

    //$limit = 2;
    $limit = 3;

    if(!count($aparts)) {
        $limit = 10;
    }
    //guardar busqueda
    $data_busqueda = array(
        'hotelId' => $hotel->id,
        'inicio' => date('Y-m-d', $inicio),
        'fin' => date('Y-m-d', $salida),
        'tiempoCreacion' => date('Y-m-d H:i:s'),
        'url' => "http://" . $_SERVER["SERVER_NAME"]
    );
    insertBusquedaDisponibilidad($data_busqueda);
    
    if($hotel->destinoId) {
        $destino = getDestino($hotel->destinoId);
        $hoteles = getHotelesCampaniasActivas($destino->nombre, 0, $limit, $hotel->id);
        $smarty->assign('hoteles',$hoteles);
    }

    $subaptos = array();
    $indice = 0;
    foreach($aparts as $key=>$apt){
        if($apt['descripcion']){
            $subaptos[$key] = array();
            $indice = $key;
        } else {
           $subaptos[$indice][] = $apt; 
        }
    }


    $smarty->assign('condiciones', $condicionesS);
    $smarty->assign('pensiones', $pensionesS);
    $smarty->assign('paxes', $paxesS);
    $smarty->assign('monedas', $monedas);
    $smarty->assign('apartamentos', $aparts);
    $smarty->assign('sub_apartamentos', $subaptos);

    $smarty->assign('reglas', json_encode($hotel->config->reglas));

    $smarty->display('apartamento.tpl');
}
?>