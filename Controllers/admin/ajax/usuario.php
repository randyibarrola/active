<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');

if(strcmp($action, 'create') == 0) {
    $data = array(
        'nombre' => NULL,
        'apellido' => NULL,
        'email' => NULL,
        'status' => 'inactivo',
        'porcentajeBeneficio' => NULL
    );
    
    $data_direccion = array(
        'descripcion' => NULL,
        'calle' => NULL,
        'codigoPostal' => NULL
    );
    
    foreach ($data as $key=>$value) {
        if(isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }

    $p = $_POST['password'];

    if(isset($p) && strlen($p)>2){
        $data['password'] = $p;
    }
    
    foreach ($data_direccion as $key=>$value) {
        if(isset($_POST[$key])) {
            $data_direccion[$key] = $_POST[$key];
        }
    }
    
    $usuario = insertUsuario($data, $data_direccion);
    
    if($usuario) {
        $result['msg'] = 'ok';
        $result['data'] = 'La cuenta se ha creado correctamente';
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

if(strcmp($action, 'update') == 0) {
    $data = array(
        'nombre' => NULL,
        'apellido' => NULL,
        'email' => NULL,
        'status' => NULL,
        'telefono' => NULL,
        'paisId' => NULL,
        'usuarioGrupoId' => NULL,
        'porcentajeBeneficio' => NULL
    );
    
    $data_direccion = array(
        'descripcion' => NULL,
        'calle' => NULL,
        'codigoPostal' => NULL
    );
    
    foreach ($data as $key=>$value) {
        if(isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }
    
    foreach ($data_direccion as $key=>$value) {
        if(isset($_POST[$key])) {
            $data_direccion[$key] = $_POST[$key];
        }
    }

    if(isset($_POST['password']) && strlen($_POST['password'])>2){
        $data['password'] = $_POST['password'];
    }
    
    if($usuario_core->getUsuario()->usuarioGrupoId == 3) {
        $data['usuarioGrupoId'] = 2;
    }

    if(isset($_POST['tipo']) && $_POST['tipo'] == 'afiliado'){
        $data['usuarioGrupoId'] = 5;   
    }
    
    $empresas = array();
    if(isset($_POST['empresas']))
        $empresas = $_POST['empresas'];
    
    $idUsuario = $_POST['idUsuario'];

    if(isset($_POST['idUsuario'])) {
        $usuario = updateUsuario($idUsuario, $data, $data_direccion, $empresas);
    } else {
        $idUsuario = insertUsuario($data, $data_direccion, $empresas);
    }

    if(isset($_POST['tipo']) && $_POST['tipo'] == 'afiliado'){
        require 'Logic/afiliado.php';
        $hoteles = array();
        if(isset($_POST['hoteles']))
            $hoteles = $_POST['hoteles'];
        
        $productos = array();
        if(isset($_POST['productos']))
            $productos = $_POST['productos'];
        
        $data_afiliado = array(
                        'nombreComercial' => NULL,
                        'web' => NULL,
                        'comisionHotel' => NULL,
                        'comisionEvento' => NULL,
                        'monedaId'=> NULL, 
                        'idiomaId' => NULL);

        foreach ($data_afiliado as $key=>$value) {
            if(isset($_POST[$key])) {
                $data_afiliado[$key] = $_POST[$key];
            }
        }

        $data_cuenta = $_POST['cuenta'];
        
        if(isset($_POST['idUsuario'])) {
            $idAfiliado = $_POST['idAfiliado'];
            $afiliado = updateAfiliado($idAfiliado, $data_afiliado, $data_cuenta, $hoteles, $productos, $idUsuario);
        }else{
            $afiliado = insertAfiliado($data_afiliado, $data_cuenta, $hoteles, $productos, $idUsuario);
        }
    }
    
    if($idUsuario) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteUsuario($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó el usuario satisfactoriamente';
        } else {
            $result['data'] = 'No se pudo eliminar el usuario';
        }
    }
}

if(strcmp($action, 'eliminarAfiliado') == '0') {
    if(isset($_POST['id'])) {
        require 'Logic/afiliado.php';
        $id = $_POST['id'];
        $eliminar = deleteAfiliado($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó el afiliado satisfactoriamente';
        } else {
            $result['data'] = 'No se pudo eliminar el afiliado';
        }
    }
}

if(strcmp($action, 'updatefields') == 0) {
    if(isset($_POST['edit'])) {
        $edit = $_POST['edit'];
        foreach ($edit as $id=>$data) {
            $updated = updateUsuarioData($id, $data);
        }
        
        if($updated)
            $result = array(
                'msg'=>'ok',
                'data' => 'Los datos fueron actualizados correctamente'
            );
    }
}

echo json_encode($result);

?>