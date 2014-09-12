<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if(strcmp($action, 'update') == 0) {
    
    $data_condicion = array(
        
        'nombre' => NULL,
        'descripcion' => NULL
    );
    
    foreach ($data_condicion as $key=>$value) {
        if(isset($_POST[$key])) {
            $data_condicion[$key] = $_POST[$key];
        }
    }
    
    
    if(isset($_POST['idCondicion'])) {
        $idCondicion = $_POST['idCondicion'];
        $cond = updateCondicion($idCondicion, $data_condicion);
    } else {
        $usuario = $usuario_core->getUsuario();
        
        if($usuario->usuarioGrupoId == 3)
            $data_condicion['usuarioId'] = $usuario->id;
        
        $cond = insertCondicion($data_condicion);
    }
    
    if($cond) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteCondicion($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó la condición';
        } else {
            $result['data'] = 'No se pudo eliminar la condición';
        }
    }
}

echo json_encode($result);

?>