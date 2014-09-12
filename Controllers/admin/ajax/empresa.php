<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if(strcmp($action, 'update') == 0) {
    $data = array(
        'nombreComercial' => NULL,
        'nombreFiscal' => NULL,
        'numeroFiscal' => NULL,
        'telefonoReservas' => NULL,
        'emailReservas' => NULL,
        'destinoTuristico' => NULL,
        'contactoNombre' => NULL,
        'contactoApellidos' => NULL,
        'contactoEmail' => NULL,
        'empresaTipoId' => NULL,
        'empresaDistribuidoraId' => NULL,
        'contactoDni' => NULL,
        'porcentajeBeneficio' => NULL
    );
    
    $data_direccion = array(
        'descripcion' => NULL,
        'calle' => NULL,
        'codigoPostal' => NULL,
        'lat' => NULL,
        'lon' => NULL
    );
    
    foreach ($data as $key=>$value) {
        if(isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }
    
    if(!$data['empresaDistribuidoraId'])
        $data['empresaDistribuidoraId'] = NULL;
    
    foreach ($data_direccion as $key=>$value) {
        if(isset($_POST[$key])) {
            $data_direccion[$key] = $_POST[$key];
        }
    }
    
    
    if(isset($_POST['idEmpresa'])) {
        $idEmpresa = $_POST['idEmpresa'];
        $empresa = updateEmpresa($idEmpresa, $data, $data_direccion);
    } else {
        $empresa = insertEmpresa($data, $data_direccion, $usuario_core->getUsuario()->id);
    }
    
    if($empresa) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteEmpresa($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se guardaron los cambios correctamente';
        } else {
            $result['data'] = 'No se pudo eliminar la empresa';
        }
    }
}

if(strcmp($action, 'get') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $empresa = getEmpresaById($id);
        
        $result['msg'] = 'ok';
        $result['data'] = $empresa;
    }
}

if(strcmp($action, 'updatefields') == 0) {
    if(isset($_POST['edit'])) {
        $edit = $_POST['edit'];
        foreach ($edit as $id=>$data) {
            $updated = updateEmpresaData($id, $data);
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