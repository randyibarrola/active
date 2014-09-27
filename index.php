<?php
session_start();
header('Content-Type: text/html; charset=UTF-8'); 
error_reporting(E_ERROR | E_WARNING | E_PARSE);

require 'config.php';
include 'Core/Include.php';
require 'Dao/include_dao.php';
require 'Logic/usuario.php';
require 'Logic/hotel.php';
require 'Logic/reserva.php';
require 'Logic/paises.php';
require 'Logic/empresa.php';
require 'Logic/direccion.php';
require 'Logic/nomencladores.php';
require 'Logic/configuracion.php';
require 'Logic/condiciones.php';
require 'Logic/blacklist.php';
require 'Logic/campania.php';
require 'Logic/promocion.php';
require 'Logic/cart.php';
require 'Logic/destino.php';
require 'Logic/busqueda.php';
require 'Logic/adword.php';
require 'Logic/factura.php';
 require 'Logic/evento.php';
 require 'Logic/faq.php';
require 'Lib/smarty/Smarty.class.php';
require 'Lib/nusoap/nusoap.php';
include_once 'Lib/mobiledetect/Mobile_Detect.php';


require 'Lib/currency-detector/Detector.php';
require 'Lib/currency-detector/Currency/Code.php';
require 'Lib/currency-detector/Currency/Symbol.php';
use CurrencyDetector\Detector;

$controller = new Core_Controller();
$includes = $controller->getFileAction();

$currencyDetector = new Detector();

$smarty = new Smarty();
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120;
$smarty->assign("base_url",$base_url);
$smarty->assign("template_url",$template_url);
$detect = new Mobile_Detect();
$smarty->assign('movile', $detect->isMobile() && !$detect->isTablet());

/*
if (isset($_SESSION['lang'])) {
   $lang_set = $_SESSION['lang'];
   $lang_set = "spanish";
   } else {
          $lang_set = "spanish";
}*/
//$smarty->configLoad($lang_set . '.conf');

$idiomas = getAllIdiomas();
$smarty->assign('idiomas', $idiomas);
$monedas = getAllMonedas();
$smarty->assign('monedas', $monedas);
$money = 'EUR';

$hotel_domain = $_SERVER['SERVER_NAME'];
$usar_moneda_hotel = false;

if(isset($_REQUEST['m'])){
    $money = $_REQUEST['m'];
    actualizarCambioMoneda();
    $_SESSION['money'] = $money;
    //$end_url .= '/m:' . $_REQUEST['m'];
}elseif (isset($_SESSION['money'])){
    $money =  $_SESSION['money'];
}else{
  $usar_moneda_hotel = true;
}

$hotel = getHotelByDominio($hotel_domain);

if(!$hotel) $hotel = getHotelByUrl($hotel_url);

if($hotel) {
    $moneda = getMoneda($hotel->monedaId);

    if($usar_moneda_hotel && $hotel->monedaId) {
        $money = $moneda->codigo;
    }

    $m = getMonedaByCodigo($money);
    $currency = $m->simbolo;
    $showSubPrice = $currency != $moneda->simbolo;

    $smarty->assign('money', $money);
    $smarty->assign('moneda', $m);
    $smarty->assign('currency', $currency);
    $smarty->assign('showSubPrice', $showSubPrice);

    //actualizarCambioMoneda();
    $campania = getCampania($hotel->campaniaId);
    $redirect_to = addhttp($hotel->dominioOficial);
    
    if($campania && $campania->estado=='Aprobada'){
      $timeInicio = strtotime($hotel->campania->inicio);
      $timeFin = strtotime($hotel->campania->fin);    
      $now = time();
      if($now < $timeInicio || $now > ($timeFin + 24 * 60 * 60)){
          $login_url = $base_url . '/hoteles';
        $hotel = false;
      } else {          
          $smarty->assign('hotel',$hotel);
      }
    }else{
        $login_url = $base_url . '/hoteles';
      $hotel = false;
    }
} else {
    $login_url = $base_url . '/hoteles';
}

$actualUrl = getActualUrl();
if(!$hotel && !strpos($actualUrl, '/admin-') 
        && !strpos($actualUrl, 'confirmacion') 
        && !strpos($actualUrl, 'cancelacion')
        && !strpos($actualUrl, 'condiciones')
        && !strpos($actualUrl, 'popup')
        && !strpos($actualUrl, 'contacto')
        && !strpos($actualUrl, 'suscripcion')
        && !strpos($actualUrl, 'thumb')
        && !strpos($actualUrl, '/ajax-reserva')
        && !strpos($actualUrl, '/hoteles')
        && !strpos($actualUrl, '/validar')
        && !strpos($actualUrl, '/facturacion')
        && !strpos($actualUrl, '/reserva')) {
    
    if(isset($_REQUEST['l'])){
        $smarty->assign('lang', $_REQUEST['l']);
        $lang_set = $_REQUEST['l'];
        $_SESSION['lang'] = $lang_set;
    }elseif (isset($_SESSION['lang'])){
        $smarty->assign('lang', $_SESSION['lang']);
        $lang_set = $_SESSION['lang'];
    }else{
        $lang_set = 'es';
        $smarty->assign('lang', $lang_set);
        $_SESSION['lang'] = $lang_set;
    }

    $smarty->configLoad($lang_set . '.conf');

    setlocale(LC_ALL, Core_Util_General::getLocaleName($lang_set));
    
    include 'Controllers/hoteles.php';
    
} else {    
    $usuario_core = Core_Usuario::getInstance();
    $usuario = $usuario_core->getUsuario();

    if($usuario){
      $smarty->assign('logged_user',$usuario);
    }

    if (isset($_REQUEST["inicio"]) && isset($_REQUEST["salida"])) {
      $smarty->assign('inicio', str_replace('/index', '',$_REQUEST["inicio"]));
      $smarty->assign('salida', str_replace('/index', '',$_REQUEST["salida"]));
      $_SESSION['inicio'] = str_replace('/index', '',$_REQUEST["inicio"]);
      $_SESSION['salida'] = str_replace('/index', '',$_REQUEST["salida"]);
      setcookie("inicio", str_replace('/index', '',$_REQUEST["inicio"]));
      setcookie("salida", str_replace('/index', '',$_REQUEST["salida"]));
      $smarty->assign('noches',ceil(abs(strtotime($_REQUEST["salida"]) - strtotime($_REQUEST["inicio"])) / 86400));
    }else if (isset($_SESSION["inicio"]) && isset($_SESSION["salida"])) {
      $smarty->assign('inicio',$_SESSION["inicio"]);
      $smarty->assign('salida',$_SESSION["salida"]);
      $smarty->assign('noches',ceil(abs(strtotime($_SESSION["salida"]) - strtotime($_SESSION["inicio"])) / 86400));
      setcookie("inicio", str_replace('/index', '',$_SESSION["inicio"]));
      setcookie("salida", str_replace('/index', '',$_SESSION["salida"]));
    }else if (isset($_COOKIE["inicio"]) && isset($_COOKIE["salida"])) {
      $smarty->assign('inicio',$_COOKIE["inicio"]);
      $smarty->assign('salida',$_COOKIE["salida"]);
      $smarty->assign('noches',ceil(abs(strtotime($_COOKIE["salida"]) - strtotime($_COOKIE["inicio"])) / 86400));
    }else{
      $smarty->assign('inicio',date('d-m-Y'));
      $salida = new DateTime('tomorrow');
      $smarty->assign('salida',$salida->format('d-m-Y'));
      setcookie("inicio", date('d-m-Y'));
      setcookie("salida", $salida->format('d-m-Y'));
      $_SESSION['inicio'] = date('d-m-Y');
      $_SESSION['salida'] = $salida->format('d-m-Y');
      $smarty->assign('noches',ceil(abs(strtotime($salida->format('d-m-Y')) - strtotime(date('d-m-Y'))) / 86400));
    }

    $end_url = '';
    
    if(isset($_REQUEST['t'])){        
        $smarty->assign('tab', $_REQUEST['t']);        
    }

    if(isset($_REQUEST['l'])){
        $smarty->assign('lang', $_REQUEST['l']);
        $lang_set = $_REQUEST['l'];
        $_SESSION['lang'] = $lang_set;
        //$end_url .= '/l:' . $_REQUEST['l'];
    }elseif (isset($_SESSION['lang'])){
        $smarty->assign('lang', $_SESSION['lang']);
        $lang_set = $_SESSION['lang'];
    }else{
        $lang_set = 'en';
        if($hotel->idiomaId) {
            $lang_set = getIdioma($hotel->idiomaId)->codigo;
        }
        $smarty->assign('lang', $lang_set);
        $_SESSION['lang'] = $lang_set;
    }

    $smarty->configLoad($lang_set . '.conf');

    setlocale(LC_ALL, Core_Util_General::getLocaleName($lang_set));

    if($_REQUEST['a']){
      $afiliado_id = urldecode(Encrypter::decrypt($_REQUEST['a'], 'afiliado'));
      if(is_numeric($afiliado_id)){
        $month = 2592000 + time();
        setcookie('afiliado', $_REQUEST['a'], $month, "/", ".".$smarty->getConfigVariable('sistema_nombre_web'));
      }
    }
    
    /*
    if(isset($_REQUEST['m'])) {
        $smarty->assign('money', $_REQUEST['m']);
        $end_url .= '/m:' . $_REQUEST['m'];
        $smarty->assign('currency', getMonedaByCodigo($_REQUEST['m'])->simbolo);
        $money = $_REQUEST['m'];
    } else {
        $smarty->assign('money', 'EUR');
        $smarty->assign('currency', getMonedaByCodigo('EUR')->simbolo);
    }*/
      
    if($hotel->precioMinimo) {
        $monedaPrecioMinimo = getMoneda($hotel->precioMinimo->monedaId);
        if($money != $monedaPrecioMinimo->codigo) {
            $hotel->precioMinimo->precioMinimo = convertFromMonedaToMoneda($hotel->precioMinimo->precioMinimo, $monedaPrecioMinimo->codigo, $money);
        }
    }
    
    if($hotel->relacionados) {
        foreach ($hotel->relacionados as $k=>$r) {
            if(isset($r->precioMinimo) && $r->precioMinimo->monedaId) {
                $mPrecioMinimo = getMoneda($r->precioMinimo->monedaId);
                if($money != $mPrecioMinimo->codigo) {
                    $hotel->relacionados[$k]->precioMinimo->precioMinimo = convertFromMonedaToMoneda($r->precioMinimo->precioMinimo, $mPrecioMinimo->codigo, $money);
                }
            }
        }
    }
    
    $smarty->assign('hotel',$hotel);

    $smarty->assign('end_url', $end_url);

    $actual_url = getActualUrl();

    $end_actual_url = '';
    if(substr_count($actual_url, '?') > 0) {
        $arr = explode('?', $actual_url);
        $end_actual_url = '?' . $arr[1];
        $actual_url = $arr[0];
    }
    $smarty->assign('actual_url', $actual_url);
    $smarty->assign('end_actual_url', $end_actual_url);

    $smarty->assign('vikahotel_url', $vikahotel_url);

    $action_controller = $includes['action'];
    $smarty->assign('action_controller',$action_controller);

    //if (is_file($includes['file'])) {
    include $includes['file'];
    /*} else {
      header('Location:' . $base_url);
    }*/
}


/* funciones utiles */
function addhttp($url) {
    if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
        $url = "http://" . $url;
    }
    return $url;
}

function getNumberFromStr($number) {
	$nnumber = 0;
	$entero = true;
	$decimal = 10;
	for($i=0;$i<strlen($number);$i++) {
		if(is_numeric($number[$i])) {
			if($entero)
				$nnumber = $nnumber * 10 + $number[$i];
			else {
				$nnumber += ($number[$i]/ $decimal);
				$decimal *= 10;
 			}
		}			
		else if ($nnumber && strlen($number) - $i <= 3)
			$entero = false;
                
	}
        
	return $nnumber;
}

function getActualUrl() {
    global $money;
    global $lang_set;
    $url = "http://" . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
    $url = str_replace("/l:" . $lang_set, "", $url); 
    $url = str_replace("/m:" . $money, "", $url);
    if(substr_count($_SERVER["REQUEST_URI"], "/") < 2 || (substr_count($_SERVER["REQUEST_URI"], "/") == 2 && $_SERVER["REQUEST_URI"][strlen($_SERVER["REQUEST_URI"]) - 1] == '/') && substr_count($_SERVER["REQUEST_URI"], '-') == 0) {
        $url .= $_SERVER["REQUEST_URI"][strlen($_SERVER["REQUEST_URI"]) - 1] == '/' ? 'index' : '/index';
    }
    return $url;
}
?>