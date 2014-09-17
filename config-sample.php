<?php
$site_prefix = '';
$c_url = str_replace('/','',$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]);

if($c_url == 'www.vikahotel.com'){
	header('Location: https://www.vikahotel.com/admin');
	exit();
}

if(isset($_SERVER['HTTPS'])) {
	if(strpos($c_url,'index') !== false){
		header('Location: http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]);
		exit();
	}
	$base_url = "https://" . $_SERVER['SERVER_NAME'].$site_prefix;
	$base_url_ssl = "https://" . $_SERVER['SERVER_NAME'].$site_prefix;
	$template_url = "https://" . $_SERVER['SERVER_NAME'].$site_prefix.'/templates';
}else{
	if(strpos($_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"], "/admin")
	&& !strpos($_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"], "/admin-book")
	&& !strpos($_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"], "/admin-ajax-hoteles")){
		header('Location: https://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]);
	}

	$base_url = "http://" . $_SERVER['SERVER_NAME'].$site_prefix;
	$base_url_ssl = "https://" . $_SERVER['SERVER_NAME'].$site_prefix;
	$template_url = "http://" . $_SERVER['SERVER_NAME'].$site_prefix.'/templates';
}

$app_dir = $_SERVER['DOCUMENT_ROOT'].$site_prefix;
$template_dir = $_SERVER['DOCUMENT_ROOT'].$site_prefix.'/templates';

if(isset($_REQUEST['hotel_url'])){
	$hotel_url = $_REQUEST['hotel_url'];
	setcookie("hotel_url", $hotel_url);
}else if(isset($_COOKIE['hotel_url'])){
	$hotel_url = $_COOKIE['hotel_url'];
}

$init_prefix = '/selector';
$init_url = "http://" . $_SERVER['SERVER_NAME'].$site_prefix.$init_prefix;


$service_url = "http://localhost/vikatickets";

$republickey = "6LcY-uYSAAAAACBIaBBmfEdbYqJxCkDdtOONaeIE";
$reprivatekey = "6LcY-uYSAAAAABRFFQn56OhwJwhDVGciLO6W_KcQ";

//url de vikahotel
$vikahotel_url = 'https://www.vikahotel.com';

?>