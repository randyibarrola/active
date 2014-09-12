<?php

$logged = $usuario_core->validateUser();

$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');

if($logged) {
    
    $usuario = $usuario_core->getUsuario();
    
    if(strcmp($action, 'search') == 0) {

        $term = $_POST['term'];
        $tipo = isset($_POST["tipo"]) ? $_POST["tipo"]:"hotel";
         
        if($usuario->usuarioGrupoId == 1)
            $campanias = buscarCampanias($term, $tipo);   
        else if ($usuario->usuarioGrupoId == 3)
            $campanias = buscarCampanias($term, $usuario->id, $tipo);
        
        $result['msg'] = 'ok';
        $result['lista'] = $campanias;
        

        

    }
    
    if(strcmp($action, 'eliminar') == 0) {
        $id = $_POST['id'];
        $d = eliminarCampania($id);
        
        if($d) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó el contrato';
        } else {
            $result['data'] = 'No se eliminó el contrato';
        }
    }
    
    if(strcmp($action, 'cambiarEstado') == 0) {
        $id = $_POST['id'];
        $estado = $_POST['estado'];
        $c = cambiarEstadoCampania($id, $estado);
        
        if($c) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se actualizó el estado de la campania';
        } else {
            $result['data'] = 'No se actualizaron los datos';
        }
    }
    
    if(strcmp($action, 'addEmpresa') == 0) {
        $nombre = $_POST['nombre'];
        $data = array(
            'nombreComercial' => $nombre,
            'nombreFiscal' => $nombre,
            'empresaTipoId' => 2,
            'estado' => 'activo'
        );
        
        $idEmpresa = insertEmpresa($data, array(), $usuario_core->getUsuario()->id);
        
        if($idEmpresa) {
            $empresa = getEmpresaById($idEmpresa);
            $result['msg'] = 'ok';
            $result['data'] = 'Se registró la empresa correctamente';
            $result['empresa'] = $empresa;
        } else {
            $result['data'] = 'Ocurrió un error al registrar la empresa';
        }
    }
} else {
    $result['msg'] = 'Usted no está autenticado';
}

echo json_encode($result);

?>