<?php 
$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');

if(strcmp($action, 'getAll') == 0) {
    $regla_id = $_POST['id'];
    $cupones = getCuponesByRegla($regla_id);
    $smarty->assign('cupones', $cupones);
    $cupon = $smarty->fetch('admin/configuracion/cupones.tpl');

    if($cupones) {
        $result['msg'] = 'ok';
        $result['data'] = array(
            'html' => $cupon,
            'msg' => 'Se guardaron los cambios correctamente');
    } else {
        $result['data'] = 'No se encontraron cupones.';
    }
}

echo json_encode($result);

?>