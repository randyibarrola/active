<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');

$data_hotel = array(
    'inicioContrato' => NULL,
    'finContrato' => NULL
);

$data_empresa = array(
    'nombreComercial' => NULL,
    'nombreFiscal' => NULL,
    'numeroFiscal' => NULL,
    'telefonoReservas' => NULL,
    'emailReservas' => NULL,
    'destinoTuristico' => NULL,
    'contactoNombre' => NULL,
    'contactoApellidos' => NULL,
    'contactoEmail' => NULL
);

$data_direccion = array(
    'descripcion' => NULL,
    'calle' => NULL,
    'codigoPostal' => NULL,
    'lat' => NULL,
    'lon' => NULL
);

foreach ($data_hotel as $key=>$value) {
    if(isset($_POST[$key])) {
        $data_hotel[$key] = $_POST[$key];
    }
}

if($data_hotel['inicioContrato']) {
    $f = explode('-', $data_hotel['inicioContrato']);
    $f = $f[2] . '-' . $f[1] . '-' . $f[0];
    $data_hotel['inicioContrato'] = $f; 
}
    
if($data_hotel['finContrato']) {
    $f = explode('-', $data_hotel['finContrato']);
    $f = $f[2] . '-' . $f[1] . '-' . $f[0];
    $data_hotel['finContrato'] = $f; 
}

foreach ($data_empresa as $key=>$value) {
    if(isset($_POST[$key])) {
        $data_empresa[$key] = $_POST[$key];
    }
}

foreach ($data_direccion as $key=>$value) {
    if(isset($_POST[$key])) {
        $data_direccion[$key] = $_POST[$key];
    }
}

$idiomas = array();

if (isset($_POST['idiomas']))
    $idiomas = $_POST['idiomas'];

$monedas = array();

if (isset($_POST['monedas']))
    $monedas = $_POST['monedas'];

$promociones = array();
if(isset($_POST['promociones'])) {
    $promociones = $_POST['promociones'];
    foreach ($promociones as $k=>$p) {
        $f = explode('-', $p['inicio']);
        $f = $f[2] . '-' . $f[1] . '-' . $f[0];
        $promociones[$k]['inicio'] = $f;

        $f = explode('-', $p['fin']);
        $f = $f[2] . '-' . $f[1] . '-' . $f[0];
        $promociones[$k]['fin'] = $f;


    }
}

$usuario = $usuario_core->getUsuario();

$campania = completarCampania($usuario->id, $data_hotel, $data_empresa, $data_direccion,
        $idiomas, $monedas, $promociones);

if($campania) {
    $result['msg'] = 'ok';
    $result['data'] = 'Se guardaron los cambios correctamente';
} else {
    $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
}



echo json_encode($result);

?>