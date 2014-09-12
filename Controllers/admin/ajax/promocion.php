<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if(strcmp($action, 'update') == 0) {
    
    $data = array(
        'palabras' => NULL,
        'descuento' => NULL,
        'tipoDescuento' => NULL,
        'usuarioId' => NULL,
        'hoteles' => NULL
    );
    
    foreach ($data as $key=>$val) {
        if(isset($_POST[$key]))
            $data[$key] = $_POST[$key];
    }
    
    if(isset($_POST['idPromocion'])) {
        $id = $_POST['idPromocion'];
        $bl = updatePromocionPalabrasClave($id, $data, $data['hoteles']);
    } else {
        $bl = insertPromocionPalabrasClave($data, $data['hoteles']);
    }
    
    if($bl) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteFromBlacklist($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó la palabra';
        } else {
            $result['data'] = 'No se pudo eliminar la palabra';
        }
    }
}

echo json_encode($result);

?>