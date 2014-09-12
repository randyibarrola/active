<?php

$logged = $usuario_core->validateUser();

$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');

if($logged) {
    
    $usuario = $usuario_core->getUsuario();
    
    if(strcmp($action, 'update') == 0) {

        $idCampania = $_POST['idCampania'];

        $data = array(
            'nombre' => NULL,
            'localizador' => NULL,
            'nombreHotel' => NULL,
            'subdominio' => NULL,
            'inicio' => NULL,
            'fin' => NULL,
            'empresaDistribuidoraId' => NULL,
            'empresaId' => NULL,
            'promociones' => NULL,
            'email' => NULL,
            'estanciaMinima' => NULL,
            'ventaAnticipada' => NULL,
            'tipo' => "hotel"
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
            'contactoEmail' => NULL,
            'contactoDni' => NULL
        );
        
        $data_direccion_empresa = array(
            'descripcion' => NULL,
            'calle' => NULL,
            'codigoPostal' => NULL,
            'lat' => NULL,
            'lon' => NULL
        );

        foreach ($data as $k=>$v) {
            if(isset($_POST[$k])) {
                $data[$k] = $_POST[$k];
            }
        }
        
        foreach ($data_empresa as $k=>$v) {
            if(isset($_POST[$k])) {
                $data_empresa[$k] = $_POST[$k];
            }
        }
        
        foreach ($data_direccion_empresa as $k=>$v) {
            if(isset($_POST[$k])) {
                $data_direccion_empresa[$k] = $_POST[$k];
            }
        }
        
        
        if($data['inicio'] && strlen($data['inicio'])) {
            $f = explode('-', $data['inicio']);
            $f = $f[2] . '-' . $f[1] . '-' . $f[0];
            $data['inicio'] = $f;
        }

        if($data['fin'] && strlen($data['fin'])) {
            $f = explode('-', $data['fin']);
            $f = $f[2] . '-' . $f[1] . '-' . $f[0];
            $data['fin'] = $f;
        }

        if($data['promociones'] && is_array($data['promociones']) && count($data['promociones'])) {
            foreach ($data['promociones'] as $k=>$p) {
                if($p['inicio'] && strlen($p['inicio'])) {
                    $f = explode('-', $p['inicio']);
                    $f = $f[2] . '-' . $f[1] . '-' . $f[0];
                    $data['promociones'][$k]['inicio'] = $f;
                }

                if($p['fin'] && strlen($p['fin'])) {
                    $f = explode('-', $p['fin']);
                    $f = $f[2] . '-' . $f[1] . '-' . $f[0];
                    $data['promociones'][$k]['fin'] = $f;
                }
            }
            
            if($usuario->usuarioGrupoId == 3) { //distribuidor
                $data['estado'] = 'Aprobada';
                $data['porcentajeBeneficio'] = $_POST['porcentajeBeneficio'];
            } else if(!$idCampania) {
                $data['porcentajeBeneficio'] = getEmpresaById($data['empresaDistribuidoraId'])->porcentajeBeneficio;
            }
            
            if($idCampania)
                $updated = updateCampania($idCampania, $data, $data['promociones'], $data_empresa, $data_direccion_empresa);
            else {
                //$empresa = getEmpresasByUsuario($usuario->id);
                //$data['empresaId'] = $empresa[0]->id;
                $updated = insertCampania($data, $data['promociones'], $data_empresa, $data_direccion_empresa);
                $idCampania = $updated;
            }

            if($updated) {
                $result['msg'] = 'ok';
                $result['data'] = 'Gracias por crear su campaña. Nos pondremos en contacto con usted.';
                $result['campania'] = $idCampania;
            } else {
                $result['data'] = 'No se guardaron los datos';
            }
        } else {
            $result['data'] = 'No ha especificado ningún período. Especifique al menos uno.';
        }

        

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
    if(strcmp($action, 'suspender') == 0) {
        $idCampania = $_POST['idCampania'];
        $s = cambiarEstadoCampania($idCampania, 'Suspendida');
        
        if($s) {
            $result['msg'] = 'ok';
            $result['data'] = 'La campaña fue suspendida';
        } else {
            $result['data'] = 'Ocurrió un error al actualizar';
        }
    }
    
    if (strcmp($action, 'filtrarPorDestino') == 0) {
        if(isset($_POST['table'])) {
            $id = 0;
            if($_POST['id'] && strlen(trim($_POST['id'])))
                $id = $_POST['id'];
            
            $args = $_POST;
            
            $campanias = filtrarCampaniasByDestinoAndUsuario($usuario->id, $id, $args);
            
            foreach ($campanias as $pos=>$campania) {
                $campanias[$pos]['cobro'] = ($campania['tipo_reserva'] == 'online' ? 'Online' : 'Offline') . ' ' . ($campania['tipo_reserva'] == 'online' ? ($campania['porcentage_cobro_anticipado'] . '%') : '');
                if($campania['hotel']) $campanias[$pos]['nombre_hotel'] = $campania['hotel'];
                $campanias[$pos]['contrato'] = date('d/m/Y', strtotime($campania['inicio'])) . '-' . date('d/m/Y', strtotime($campania['fin']));
                
                $smarty->assign('campania', $campania);
                $campanias[$pos]['acciones'] = $smarty->fetch('admin/contrato/acciones.tpl');
            }
            $c = count(filtrarCampaniasByDestinoAndUsuario($usuario->id, $id, array('sSearch' => $args['sSearch'])));
            $result = array(
                "iTotalRecords"=> $c,
                "iTotalDisplayRecords"=> $c,
                'aaData' => $campanias
            );
            
        } else {
            $id = $_POST['id'];
            if($id)
                $campanias = getCampaniasByDestinoAndUsuario($id, $usuario->id);
            else 
                $campanias = getCampaniasByUsuario($usuario->id);
            $smarty->assign('campanias', $campanias);
            $html = $smarty->fetch('admin/contrato/filtros.tpl');
            $result['html'] = $html;
            $result['msg'] = 'ok';
        }
    }
} else {
    $result['msg'] = 'Usted no está autenticado';
}

echo json_encode($result);

?>