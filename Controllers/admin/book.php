<?php 
	if ($_GET['id']) {
		$reserva = getReserva($_GET['id']);
		$hotel = getHotelById($reserva->hotelId);
		$apartamento = $reserva->alojamiento[0];
		$inicio = strtotime($apartamento->inicio);
		$salida = strtotime($apartamento->final);

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
    
    //$inputs = $html('#form_search input');
    $url = $hotel_url . '&';

    $notparse = array('checkin_monthday' => date('d', $inicio),
        'checkin_year_month' => date('Y-m', $inicio),
        'checkout_year_month' => date('Y-m', $salida),
        'checkout_monthday' => date('d', $salida),
        'ci_date' => date('Y-m-d', $inicio),
        'co_date' => date('Y-m-d', $salida)
    );
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

	    echo $content;
	}
?>
	