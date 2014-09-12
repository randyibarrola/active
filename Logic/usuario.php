<?php

function authenticateUsuario($user, $pass) {
    try {
        $args = array("email" => $user, "password" => $pass);

        $customer = DAOFactory::getUsuarioDAO()->queryByArgs($args);
        if (sizeof($customer) > 0) {
            $customer = $customer[0];
            if($customer->usuarioGrupoId) {
                $customer->rol = DAOFactory::getUsuarioGrupoDAO()->load($customer->usuarioGrupoId)->nombre;
            }
            return $customer;
        } else
            return false;
    } catch (Exception $e) {
        return false;
    }
}

function insertUsuario($data = array(), $data_direccion = array(), $empresas = array()) {
    try {
        //set creatrion date.	
        $data["tiempoCreacion"] = date("Y-m-d H:i:s");
        //start new transaction				
        $transaction = new Transaction();
        
        $d = false;
        foreach ($data_direccion as $dir) {
            if(!is_null($dir) && strlen(trim($dir)) > 0) {
                $d = true;
                break;
            }
        }
        
        if($d) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
            $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
            $data['direccionId'] = $id_direccion;
        }

        $customer = DAOFactory::getUsuarioDAO()->prepare($data);
        $new_customer_id = DAOFactory::getUsuarioDAO()->insert($customer);
        
        //if($customer->usuarioGrupoId == 2) {
            foreach ($empresas as $empresa_id) {
                $usuario_empresa = DAOFactory::getUsuarioEmpresaDAO()->prepare(array(
                    'usuarioId' => $new_customer_id,
                    'empresaId' => $empresa_id
                ));
                DAOFactory::getUsuarioEmpresaDAO()->insert($usuario_empresa);
            }
        //}

        $transaction->commit();

        return $new_customer_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateUsuario($idUsuario, $data = array(), $data_direccion = array(), $empresas = array()) {
    try {
        //start new transaction	
        $transaction = new Transaction();

        
        
        $d = false;
        foreach ($data_direccion as $dir) {
            if(!is_null($dir) && strlen(trim($dir)) > 0) {
                $d = true;
                break;
            }
        }
        $old_usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        if($d && !$old_usuario->direccionId) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
            $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
            $data['direccionId'] = $id_direccion;
        } else if($d && $old_usuario->direccionId) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion, $old_usuario->direccionId);
            DAOFactory::getDireccionDAO()->update($direccion);
        }
        $customer = DAOFactory::getUsuarioDAO()->prepare($data, $idUsuario);
        DAOFactory::getUsuarioDAO()->update($customer);
        
        //if($customer->usuarioGrupoId == 2) {
            DAOFactory::getUsuarioEmpresaDAO()->deleteByUsuarioId($idUsuario);
            foreach ($empresas as $empresa_id) {
                $usuario_empresa = DAOFactory::getUsuarioEmpresaDAO()->prepare(array(
                    'usuarioId' => $idUsuario,
                    'empresaId' => $empresa_id
                ));
                DAOFactory::getUsuarioEmpresaDAO()->insert($usuario_empresa);
            }
        //}

        $transaction->commit();

        return $customer;
    } catch (Exception $e) {
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateUsuarioData($idUsuario, $data = array()) {
    try {
        //start new transaction	
        $transaction = new Transaction();
        $customer = DAOFactory::getUsuarioDAO()->prepare($data, $idUsuario);
        DAOFactory::getUsuarioDAO()->update($customer);

        $transaction->commit();

        return $customer;
    } catch (Exception $e) {
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteUsuario($idUsuario) {
    try {
        //start new transaction	
        $transaction = new Transaction();
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        
        $d = deleteReservasByUsuarioId($idUsuario);
        if(!$d) throw new Exception('No se pudo borrar las reservas ');
        DAOFactory::getUsuarioEmpresaDAO()->deleteByUsuarioId($idUsuario);
        
        //eliminar el resto de los datos si cliente
        if($usuario->usuarioGrupoId == 2||true) {
            $empresas = getEmpresasByUsuario($usuario->id, false);
            if($empresas){
               if($empresas && count($empresas)) {
                    foreach ($empresas as $e) {
                        $d = deleteEmpresa($e->id, false);
                        if(!$d) throw new Exception('No se pudo borrar la empresa ' . $e->id);
                    }
                }
            }
        }
        
        

        $result = DAOFactory::getUsuarioDAO()->delete($idUsuario);

        if (!$result) {
            throw new Exception("Failed to delete the Events.");
        }
        
        if($usuario->direccionId)
            DAOFactory::getDireccionDAO()->delete($usuario->direccionId);
        
        $transaction->commit();

        return $result;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function getAllUsuarios($withTipo = false) {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryAll();
        if($withTipo)
        foreach ($usuarios as $u) {
            switch ($u->usuarioGrupoId) {
            case 1: $u->tipo = 'Administrador';
                break;
            case 2: $u->tipo = 'Cliente';
                break;
            case 3: $u->tipo = 'Distribuidor';
                break;
            }
        }
        
        return $usuarios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getAllUsuariosByDistribuidor($usuarioId, $withTipo = false) {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryAllUsuariosByDistribuidor($usuarioId);
        if($withTipo)
        foreach ($usuarios as $u) {
            switch ($u->usuarioGrupoId) {
            case 1: $u->tipo = 'Administrador';
                break;
            case 2: $u->tipo = 'Cliente';
                break;
            case 3: $u->tipo = 'Distribuidor';
                break;
            }
        }
        return $usuarios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getUsuario($idUsuario) {
    try {
        $customer = DAOFactory::getUsuarioDAO()->load($idUsuario);
        if($customer->direccionId)
            $customer->direccion = DAOFactory::getDireccionDAO()->load($customer->direccionId);
        if($customer->paisId) $customer->pais = DAOFactory::getPaisDAO()->load($customer->paisId);
        return $customer;
    } catch (Exception $e) {
        return false;
    }
}

function getUsuarioByEmail($email) {
    try {
        $customer = DAOFactory::getUsuarioDAO()->queryByEmail($email);
        return $customer;
    } catch (Exception $e) {
        return false;
    }
}

function getUsuarios($args = array()) {
    try {
        return DAOFactory::getUsuarioDAO()->queryByArgs($args);
    } catch (Exception $e) {
        return array();
    }
}

function searchUsuarios($args) {
    try {
        return DAOFactory::getUsuarioDAO()->querySearch($args);
    } catch (Exception $e) {
        return array();
    }
}

function getAllGrupos() {
    try {
        
        $grupos = DAOFactory::getGrupoUsuarioDAO()->queryAll();
        return $grupos;
        
    } catch (Exception $e) {
        return false;
    }
}

function getGrupo($id) {
    try {
        
        $grupo = DAOFactory::getGrupoUsuarioDAO()->load($id);
        return $grupo;
        
    } catch (Exception $e) {
        return false;
    }
}

function getTiposUsuarioByUsuarioId($idUsuario) {
    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        $grupos = DAOFactory::getGrupoUsuarioDAO()->queryAllUnder($usuario->grupoUsuarioId);
        return $grupos;
        
    } catch (Exception $e) {
        return false;
    }
}

function getUsuariosWithoutPassword() {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryAll();
        foreach ($usuarios as $u) {
            $u->password = '';
        }
        return $usuarios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getUsuariosByTerm($term) {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryBuscar($term);
        
        return $usuarios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getUsuariosByGrupo($grupoId) {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryByUsuarioGrupoId($grupoId);
        if($withTipo)
        foreach ($usuarios as $u) {
            switch ($u->usuarioGrupoId) {
            case 1: $u->tipo = 'Administrador';
                break;
            case 2: $u->tipo = 'Cliente';
                break;
            case 3: $u->tipo = 'Distribuidor';
                break;
            }
        }
        return $usuarios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getUsuariosByTermAndDistribuidor($term, $usuarioId) {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryBuscarWithDistribuidorId($term, $usuarioId);
        
        return $usuarios;
        
    } catch (Exception $e) {
        return false;
    }
}

function registrarCliente($data = array()) {
    try {
        
        $transaction = new Transaction();
        $now = date('Y-m-d');
        $pass = substr(uniqid(), 0, 7);
        //insert usuario
        $data_user = array(
            'usuarioGrupoId' => 2,
            'tiempoCreacion' => $now,
            'status' => 'Pendiente',
            'nombre' => $data['nombre'],
            'apellido' => $data['apellido'],
            'email' => $data['email'],
            'dni' => $data['dni'],
            'puestoTrabajo' => $data['puestoTrabajo'],
            'telefono' => $data['movil'],
            'password' => $pass,
            'porcentajeBeneficio' => $data['porcentajeBeneficio']
        );
        
        $usuario = DAOFactory::getUsuarioDAO()->prepare($data_user);
        $usuario_id = DAOFactory::getUsuarioDAO()->insert($usuario);
        
        //insert direccion de empresa
        $direccion = DAOFactory::getDireccionDAO()->prepare(array());
        $dir_id = DAOFactory::getDireccionDAO()->insert($direccion);
        
        //insert empresa
        $data_empresa = array(
            'direccionId' => $dir_id,
            'empresaTipoId' => 2,
            'estado' => 'Pendiente',
            'nombreComercial' => $data['empresa'],
            'nombreFiscal' => $data['empresa'],
            'numeroFiscal' => $data['numeroFiscal'],
            'telefonoReservas' => $data['telefono'],
            'contactoNombre' => $data['nombre'],
            'contactoApellidos' => $data['apellido'],
            'contactoEmail' => $data['email'],
            'emailReservas' => $data['email'],
            'contactoDni' => $data['dni']
        );
        $empresa = DAOFactory::getEmpresaDAO()->prepare($data_empresa);
        $empresa_id = DAOFactory::getEmpresaDAO()->insert($empresa);
        
        //insert usuario - empresa
        $usuario_empresa = DAOFactory::getUsuarioEmpresaDAO()->prepare(array('usuarioId' => $usuario_id, 'empresaId' => $empresa_id));
        $ue_id = DAOFactory::getUsuarioEmpresaDAO()->insert($usuario_empresa);
        
        //insert permisos basicos (hotel, empresa y reservas)
        /*
        $permisos = array(1, 2, 3);
        foreach ($permisos as $p) {
            $usuario_permiso = DAOFactory::getUsuarioPermisoDAO()->prepare(array('usuarioId'=>$usuario_id, 'permisoId'=>$p));
            DAOFactory::getUsuarioPermisoDAO()->insert($usuario_permiso);
        }*/
        
        
        //insert campania
        $campanias = $data['hotel'];
        if($campanias) {
            foreach ($campanias as $c) {
                $campania = DAOFactory::getCampaniaDAO()->prepare(array(
                    'nombre'=>$c, 
                    'nombreHotel' => $c, 
                    'empresaId'=>$empresa_id, 
                    'estado'=>'Pendiente',
                    'localizador' => generarLocalizador()));
                DAOFactory::getCampaniaDAO()->insert($campania);
            }
        }
        
        $transaction->commit();
        
        return $usuario_id;
        
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getPermisosByUsuario($idUsuario) {
    try {
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        $usuario_permisos = DAOFactory::getUsuarioPermisoDAO()->queryByUsuarioGrupoId($usuario->usuarioGrupoId);
        
        $permisos = array();
        
        foreach ($usuario_permisos as $up) {
            $permiso = DAOFactory::getPermisoDAO()->load($up->permisoId);
            array_push($permisos, $permiso->nombre);
        }
        
        return $permisos;
        
    } catch (Exception $e) {
        return false;
    }
}

function activarUsuario($idUsuario) {
    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->prepare(array('status'=>'activado'), $idUsuario);
        DAOFactory::getUsuarioDAO()->update($usuario);
        
        return true;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getUsuariosByEmpresaId($idEmpresa) {
    try {
        
        $usuarios = DAOFactory::getUsuarioDAO()->queryByEmpresaId($idEmpresa);
        return $usuarios;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}
?>