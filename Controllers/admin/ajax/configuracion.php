<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if(strcmp($action, 'update') == 0) {
    
    $data_configuracion = array(
        'alias' => NULL,
        'descuentoBooking' => 0,
        'tipoDescuentoBooking' => NULL,
        'comparacionBooking' => 0,
        'sincronizacionVika' => 0,
        'vikaEmail' => NULL,
        'vikaEmpresa' => NULL,
        'vikaCanal' => NULL,
        'atencionPersonalizada' => 0,
        'pagoFlexible' => 0,
        'cuponPromocional' => 0
    );
    
    foreach ($data_configuracion as $key=>$value) {
        if(isset($_POST[$key])) {
            $data_configuracion[$key] = $_POST[$key];
        }
    }
    
    if(isset($_POST['vikaPassword']) && strlen($_POST['vikaPassword']) > 0)
        $data_configuracion['vikaPassword'] = $_POST['vikaPassword'];
    
    $data_reglas_cupones = array();
    
    if(isset($_POST['reglas'])) $data_reglas_cupones = $_POST['reglas'];
    
    $productos = array();

    if(isset($_POST['productos'])) $productos = $_POST['productos'];
    
    $favoritos = array();
    if(isset($_POST['favoritos'])) $favoritos = $_POST['favoritos'];
    
    if(isset($_POST['idConfiguracion'])) {
        $idConfiguracion = $_POST['idConfiguracion'];
        $config = updateConfiguracion($idConfiguracion, $data_configuracion, $data_reglas_cupones, $productos, $favoritos);
    } else {
        $data_configuracion['usuarioId'] = $usuario_core->getUsuario()->id;
        $config = insertConfiguracion($data_configuracion, $data_reglas_cupones, $productos, $favoritos);
    }
    
    if($config) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteConfiguracion($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó la configuracion';
        } else {
            $result['data'] = 'No se pudo eliminar la configuracion';
        }
    }
}

echo json_encode($result);

?>