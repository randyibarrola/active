<?php
function insertHotel($data = array(), $data_direccion = array(),
        $idiomas = array(), $monedas = array(), $fechas = array(), 
        $condiciones = array(), $dominios = array(), $promociones = array(), 
        $data_blacklist = array(), $precios = array()) {
    try {
        $data["tiempoCreacion"] = date("Y-m-d H:i:s");	
        $transaction = new Transaction();
        
        if($data['campaniaId']) {
            $campania = DAOFactory::getCampaniaDAO()->load($data['campaniaId']);
            $data['dominioCampania'] = $campania->subdominio;
        }

        //Activar SEO
        $data['seo'] = 1;
                
        $hotel = DAOFactory::getHotelDAO()->prepare($data);
        $new_hotel_id = DAOFactory::getHotelDAO()->insert($hotel);
        
        if(isset($data['clave'])) {
            $clave = Encrypter::encrypt($data['clave'], $new_hotel_id);
            $h = DAOFactory::getHotelDAO()->prepare(array('clave'=>$clave), $new_hotel_id);
            DAOFactory::getHotelDAO()->update($h);
        }
        
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
            $hotel_direccion = DAOFactory::getHotelDireccionDAO()->prepare(array('hotelId'=>$new_hotel_id, 'direccionId' => $id_direccion));
            DAOFactory::getHotelDireccionDAO()->insert($hotel_direccion);
        }
        
        if(count($idiomas)) {
            foreach ($idiomas as $idioma) {
                $id = DAOFactory::getHotelIdiomaDAO()->prepare(array('hotelId'=>$new_hotel_id, 'idiomaId'=>$idioma));
                DAOFactory::getHotelIdiomaDAO()->insert($id);
            }
        }
        
        if(count($monedas)) {
            foreach ($monedas as $moneda) {
                $mon = DAOFactory::getHotelMonedaDAO()->prepare(array('hotelId'=>$new_hotel_id, 'monedaId'=>$moneda));
                DAOFactory::getHotelMonedaDAO()->insert($mon);
            }
        }
        
        foreach($fechas as $fecha) {
            $fechaHotel = DAOFactory::getHotelFechasDAO()->prepare(array('hotelId'=>$new_hotel_id, 'fecha'=> $fecha));
            $fecha_id = DAOFactory::getHotelFechasDAO()->insert($fechaHotel);
        }
        
        foreach ($condiciones as $cond) {
            $condicion = DAOFactory::getHotelCondicionDAO()->prepare(array('hotelId'=>$new_hotel_id, 'condicionId'=>$cond));
            DAOFactory::getHotelCondicionDAO()->insert($condicion);
        }
        
        $condiciones_obligatorias = DAOFactory::getCondicionDAO()->queryByCondicionCategoriaId(1);
        foreach ($condiciones_obligatorias as $cond) {
            $condicion = DAOFactory::getHotelCondicionDAO()->prepare(array('hotelId'=>$new_hotel_id, 'condicionId'=>$cond->id));
            DAOFactory::getHotelCondicionDAO()->insert($condicion);
        }
        
        foreach ($dominios as $dom) {
            $dominio = DAOFactory::getHotelDominiosDAO()->prepare(array('hotelId'=>$new_hotel_id, 'dominio'=>$dom));
            DAOFactory::getHotelDominiosDAO()->insert($dominio);
        }
        
        foreach ($promociones as $data_promocion) {
            $data_promocion['hotelId'] = $new_hotel_id;
            $promocion = DAOFactory::getPromocionDAO()->prepare($data_promocion);
            DAOFactory::getPromocionDAO()->insert($promocion);
        }
        
        foreach ($precios as $data_precio) {
            $data_precio['hotelId'] = $new_hotel_id;
            $precio = DAOFactory::getHotelPrecioDAO()->prepare($data_precio);
            DAOFactory::getHotelPrecioDAO()->insert($precio);
        }
        
        //DAOFactory::getBlacklistDAO()->deleteByHotelId($new_hotel_id);
        if($data_blacklist) {
            foreach ($data_blacklist as $dbl) {
                $dbl['hotelId'] = $new_hotel_id;
                $blacklist = DAOFactory::getBlacklistDAO()->prepare($dbl);
                DAOFactory::getBlacklistDAO()->insert($blacklist);
            }
        }
        
        

        $transaction->commit();
        
        actualizarSeo($new_hotel_id);

        return $new_hotel_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function insertHotelImage($data,$hotel_id) {
    try {
        $transaction = new Transaction();
        
        $archivo = DAOFactory::getArchivoDAO()->prepare($data);
        $new_archivo_id = DAOFactory::getArchivoDAO()->insert($archivo);
        
        if($new_archivo_id){
            $hotel_archivo = array('hotelId' => $hotel_id,'archivoId' => $new_archivo_id);
            $hotel_archivo = DAOFactory::getHotelArchivoDAO()->prepare($hotel_archivo);
            $new_hotel_archivo_id = DAOFactory::getHotelArchivoDAO()->insert($hotel_archivo);

            $transaction->commit();
        }
       

        return $new_hotel_archivo_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function inserHotelServicio($data,$hotel_id) {
    try {
        $transaction = new Transaction();
        $hotel_servicio_id = false;

        if(is_array($data)){
            if(isset($data['categoria'])){
                $categoria_nombre = $data['categoria'];
                $categoria = DAOFactory::getServicioCategoriaDAO()->queryByNombre($categoria_nombre);
                
                if(count($categoria)==0){
                    $categoria = DAOFactory::getServicioCategoriaDAO()->prepare(array('nombre' => $categoria_nombre));
                    $categoria_id = DAOFactory::getServicioCategoriaDAO()->insert($categoria);
                    $categoria = DAOFactory::getServicioCategoriaDAO()->load($categoria_id);
                }else{
                    $categoria = $categoria[0];
                }

                $servicio_nombre = $data['servicio'];
                $servicio = DAOFactory::getServicioDAO()->queryByNombre($servicio_nombre);
                
                if(count($servicio)==0){
                    $servicio = DAOFactory::getServicioDAO()->prepare(array('nombre' => $servicio_nombre,'tipo' => 'hotel','servicioCategoriaId' => $categoria->id));
                    $servicio_id = DAOFactory::getServicioDAO()->insert($servicio);
                    $servicio = DAOFactory::getServicioDAO()->load($servicio_id);
                }else{
                    $servicio = $servicio[0];
                }

                $hotel_servicio = DAOFactory::getHotelServicioDAO()->prepare(array('servicioId' => $servicio->id, 'hotelId' => $hotel_id));
                $hotel_servicio_id = DAOFactory::getHotelServicioDAO()->insert($hotel_servicio);

                $transaction->commit();
            }
        }

        return $hotel_servicio_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function inserHotelCondicion($data,$hotel_id) {
    try {
        $transaction = new Transaction();
        $hotel_servicio_id = false;

        if(is_array($data)){
            if(isset($data['categoria'])){
                $categoria_nombre = $data['categoria'];
                $categoria = DAOFactory::getServicioCategoriaDAO()->queryByNombre($categoria_nombre);
                
                if(count($categoria)==0){
                    $categoria = DAOFactory::getServicioCategoriaDAO()->prepare(array('nombre' => $categoria_nombre));
                    $categoria_id = DAOFactory::getServicioCategoriaDAO()->insert($categoria);
                    $categoria = DAOFactory::getServicioCategoriaDAO()->load($categoria_id);
                }else{
                    $categoria = $categoria[0];
                }

                $servicio_nombre = $data['servicio'];
                $servicio = DAOFactory::getServicioDAO()->queryByNombre($servicio_nombre);
                
                if(count($servicio)==0){
                    $servicio = DAOFactory::getServicioDAO()->prepare(array('nombre' => $servicio_nombre,'tipo' => 'condicion','servicioCategoriaId' => $categoria->id));
                    $servicio_id = DAOFactory::getServicioDAO()->insert($servicio);
                    $servicio = DAOFactory::getServicioDAO()->load($servicio_id);
                }else{
                    $servicio = $servicio[0];
                }

                $hotel_servicio = DAOFactory::getHotelServicioDAO()->prepare(array('servicioId' => $servicio->id, 'hotelId' => $hotel_id));
                $hotel_servicio_id = DAOFactory::getHotelServicioDAO()->insert($hotel_servicio);

                $transaction->commit();
            }
        }

        return $hotel_servicio_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function inserHotelTenerEnCuenta($text,$hotel_id) {
    try {
        $transaction = new Transaction();
        $hotel_servicio_id = false;
        

        $categoria_nombre = 'a tener en cuenta ' . $hotel_id;
        
        $categoria = DAOFactory::getServicioCategoriaDAO()->prepare(array('nombre' => $categoria_nombre));
        $categoria_id = DAOFactory::getServicioCategoriaDAO()->insert($categoria);
        $categoria = DAOFactory::getServicioCategoriaDAO()->load($categoria_id);
        

        $servicio_nombre = $text;
        
        $servicio = DAOFactory::getServicioDAO()->prepare(array('nombre' => $servicio_nombre,'tipo' => 'a tener en cuenta','servicioCategoriaId' => $categoria->id));
        $servicio_id = DAOFactory::getServicioDAO()->insert($servicio);
        $servicio = DAOFactory::getServicioDAO()->load($servicio_id);
        

        $hotel_servicio = DAOFactory::getHotelServicioDAO()->prepare(array('servicioId' => $servicio->id, 'hotelId' => $hotel_id));
        $hotel_servicio_id = DAOFactory::getHotelServicioDAO()->insert($hotel_servicio);

        $transaction->commit();
            

        return $hotel_servicio_id;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateHotelSingle($idHotel, $data = array()) {
    try {
        $transaction = new Transaction();
        $hotel = DAOFactory::getHotelDAO()->prepare($data, $idHotel);
        DAOFactory::getHotelDAO()->update($hotel);
    }catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateHotel($idHotel, $data = array(), $data_direccion = array(),
        $idiomas = array(), $monedas = array(), $fechas = array(), 
        $condiciones = array(), $dominios = array(), $promociones = array(), 
        $data_blacklist = array(), $precios = array()) {
    try {
        $transaction = new Transaction();

        if($data['campaniaId']) {
            $campania = DAOFactory::getCampaniaDAO()->load($data['campaniaId']);
            $data['dominioCampania'] = $campania->subdominio;
        }
        
        
        $hotel = DAOFactory::getHotelDAO()->prepare($data, $idHotel);
        if($data['logoId'] == NULL) $hotel->logoId = NULL;
        DAOFactory::getHotelDAO()->update($hotel);
        
        $d = false;
        foreach ($data_direccion as $dir) {
            if(!is_null($dir) && strlen(trim($dir)) > 0) {
                $d = true;
                break;
            }
        }
        
        $old_direccion = getDireccionByHotel($idHotel);
        
        if($d && !$old_direccion) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
            $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
            $hotel_direccion = DAOFactory::getHotelDireccionDAO()->prepare(array('hotelId'=>$idHotel, 'direccionId' => $id_direccion));
            DAOFactory::getHotelDireccionDAO()->insert($hotel_direccion);
        } else if($d && $old_direccion) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion, $old_direccion->id);
            DAOFactory::getDireccionDAO()->update($direccion);
        }
        
        
        DAOFactory::getHotelIdiomaDAO()->deleteByHotelId($idHotel);
        if(count($idiomas)) {
            foreach ($idiomas as $idioma) {
                $id = DAOFactory::getHotelIdiomaDAO()->prepare(array('hotelId'=>$idHotel, 'idiomaId'=>$idioma));
                DAOFactory::getHotelIdiomaDAO()->insert($id);
            }
        }
        
        DAOFactory::getHotelMonedaDAO()->deleteByHotelId($idHotel);
        if(count($monedas)) {
            foreach ($monedas as $moneda) {
                $mon = DAOFactory::getHotelMonedaDAO()->prepare(array('hotelId'=>$idHotel, 'monedaId'=>$moneda));
                DAOFactory::getHotelMonedaDAO()->insert($mon);
            }
        }
        
        DAOFactory::getHotelFechasDAO()->deleteByHotelId($idHotel);
        
        foreach($fechas as $fecha) {
            $fechaHotel = DAOFactory::getHotelFechasDAO()->prepare(array('hotelId'=>$idHotel, 'fecha'=> $fecha));
            $fecha_id = DAOFactory::getHotelFechasDAO()->insert($fechaHotel);
        }
        
        DAOFactory::getHotelCondicionDAO()->deleteByHotelId($idHotel);
        foreach ($condiciones as $cond) {
            $condicion = DAOFactory::getHotelCondicionDAO()->prepare(array('hotelId'=>$idHotel, 'condicionId'=>$cond));
            DAOFactory::getHotelCondicionDAO()->insert($condicion);
        }
        $condiciones_obligatorias = DAOFactory::getCondicionDAO()->queryByCondicionCategoriaId(1);
        
        foreach ($condiciones_obligatorias as $cond) {
            $condicion = DAOFactory::getHotelCondicionDAO()->prepare(array('hotelId'=>$idHotel, 'condicionId'=>$cond->id));
            DAOFactory::getHotelCondicionDAO()->insert($condicion);
        }
        
        DAOFactory::getHotelDominiosDAO()->deleteByHotelId($idHotel);
        foreach ($dominios as $dom) {
            $dominio = DAOFactory::getHotelDominiosDAO()->prepare(array('hotelId'=>$idHotel, 'dominio'=>$dom));
            DAOFactory::getHotelDominiosDAO()->insert($dominio);
        }
        
        DAOFactory::getPromocionDAO()->deleteByHotelId($idHotel);
        foreach ($promociones as $data_promocion) {
            $data_promocion['hotelId'] = $idHotel;
            $promocion = DAOFactory::getPromocionDAO()->prepare($data_promocion);
            DAOFactory::getPromocionDAO()->insert($promocion);
        }
        
        DAOFactory::getHotelPrecioDAO()->deleteByHotelId($idHotel);
        foreach ($precios as $data_precio) {
            $data_precio['hotelId'] = $idHotel;
            $precio = DAOFactory::getHotelPrecioDAO()->prepare($data_precio);
            DAOFactory::getHotelPrecioDAO()->insert($precio);
        }
        
        getClaveByHotel($idHotel);
        
        DAOFactory::getBlacklistDAO()->deleteByHotelId($idHotel);
        if($data_blacklist) {
            foreach ($data_blacklist as $dbl) {
                $dbl['hotelId'] = $idHotel;
                $blacklist = DAOFactory::getBlacklistDAO()->prepare($dbl);
                DAOFactory::getBlacklistDAO()->insert($blacklist);
            }
        }
        
        actualizarSeo($idHotel);

        $transaction->commit();

        return $idHotel;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateHotelData($idHotel, $data_hotel) {
    try {
        $transaction = new Transaction();
        
        $hotel = DAOFactory::getHotelDAO()->prepare($data_hotel, $idHotel);
        
        DAOFactory::getHotelDAO()->update($hotel);
        
        getClaveByHotel($idHotel);
        
        $transaction->commit();

        return $hotel;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteHotel($idHotel, $transactional = true) {
    try {
        if($transactional)
            $transaction = new Transaction();
        
        $hotel = DAOFactory::getHotelDAO()->load($idHotel);
        
        
        deleteHotelServicios($idHotel, false);
        deleteHotelImages($idHotel, false);
        deleteHotelCondiciones($idHotel, false);
        deleteHotelDirecciones($idHotel, false);
        
        deleteReservasByHotelId($idHotel);
        
        DAOFactory::getHotelIdiomaDAO()->deleteByHotelId($hotel->id);
        DAOFactory::getHotelMonedaDAO()->deleteByHotelId($hotel->id);
        DAOFactory::getHotelDominiosDAO()->deleteByHotelId($hotel->id);
        DAOFactory::getHotelFechasDAO()->deleteByHotelId($idHotel);
        DAOFactory::getPromocionDAO()->deleteByHotelId($idHotel);
        DAOFactory::getBlackListDAO()->deleteByHotelId($idHotel);
        DAOFactory::getHotelPrecioDAO()->deleteByHotelId($idHotel);
        
        DAOFactory::getBusquedaDisponibilidadDAO()->deleteByHotelId($idHotel);
        
        DAOFactory::getHotelDAO()->delete($hotel->id);

        if($transactional)
            $transaction->commit();

        return true;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteHotelesByEmpresaId($idEmpresa) {
    try {
        
        $hoteles = DAOFactory::getHotelDAO()->queryByEmpresaId($idEmpresa);
        if($hoteles && count($hoteles)) {
            foreach ($hoteles as $h) {
                $d = deleteHotel($h, false);
                if(!$d) throw new Exception('No se pudo borrar el hotel ' . $h->id);
            }
        }
        
        return true;
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

function deleteHotelImages($idHotel, $transactional = true){
    try {
        if($transactional)$transaction = new Transaction();

        $h_archivos = DAOFactory::getHotelArchivoDAO()->queryByHotelId($idHotel);

        foreach ($h_archivos as $h_a) {
            $d = DAOFactory::getHotelArchivoDAO()->delete($h_a->id);
            if (!$d) {
                throw new Exception("Error:delete hotel archivos.");
            }
            $d = DAOFactory::getArchivoDAO()->delete($h_a->archivoId);
             if (!$d) {
                throw new Exception("Error:delete archivos");
            }
        }
        if($transactional)$transaction->commit();

        return $result;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteHotelServicios($idHotel, $transactional = true){
    try {
        if($transactional)$transaction = new Transaction();

        $h_servicio = DAOFactory::getHotelServicioDAO()->queryByHotelId($idHotel);
        DAOFactory::getHotelServicioDAO()->deleteByHotelId($idHotel);
        foreach ($h_servicio as $h_a) {
            $otros = DAOFactory::getHotelServicioDAO()->queryByServicioId($h_a->servicioId);
            if(!$otros || !count($otros)) {
                $servicio = DAOFactory::getServicioDAO()->load($h_a->servicioId);
                DAOFactory::getServicioDAO()->delete($h_a->servicioId);
                
                $otras = DAOFactory::getServicioDAO()->queryByServicioCategoriaId($servicio->servicioCategoriaId);
                
                if(!otras || !count($otras))
                    DAOFactory::getServicioCategoriaDAO()->delete($servicio->servicioCategoriaId);
            }
            
        }
        
        if($transactional)$transaction->commit();

        return $result;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteFoto($id) {
    try {
        $transaction = new Transaction();

        DAOFactory::getHotelArchivoDAO()->deleteByArchivoId($id);
        DAOFactory::getApartamentoArchivoDAO()->deleteByArchivoId($id);
        
        DAOFactory::getArchivoDAO()->delete($id);
                
        $transaction->commit();

        return true;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteHotelCondiciones($idHotel, $transactional = true){
    try {
        if($transactional)$transaction = new Transaction();

        DAOFactory::getHotelCondicionDAO()->deleteByHotelId($idHotel);
        
        
        if($transactional)$transaction->commit();

        return $result;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteHotelDirecciones($idHotel, $transactional = true){
    try {
        if($transactional)$transaction = new Transaction();

        $h_direccion = DAOFactory::getHotelDireccionDAO()->queryByHotelId($idHotel);
        DAOFactory::getHotelDireccionDAO()->deleteByHotelId($idHotel);
        foreach ($h_direccion as $h_a) {
            $d = DAOFactory::getDireccionDAO()->delete($h_a->direccionId);
            if (!$d) {
                throw new Exception("Error:delete hotel servicios.");
            }
        }
        
        if($transactional)$transaction->commit();

        return $result;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function getAllHoteles() {
    try {
        
        $hoteles = DAOFactory::getHotelDAO()->queryAll();
        
        foreach ($hoteles as $hotel) {
            if($hotel->nombre && strlen(trim($hotel->nombre)) > 2 && $hotel->nombre[0] == '{' && $hotel->nombre[strlen($hotel->nombre)-1] == '}') {
                $hotel->nombre = json_decode(trim($hotel->nombre))->es;
            }

            if($hotel->descripcionCorta && strlen(trim($hotel->descripcionCorta)) > 0) {
                $hotel->descripcionesCortas = json_decode(trim($hotel->descripcionCorta));
            }

            if($hotel->descripcionLarga && strlen(trim($hotel->descripcionLarga)) > 0) {
                $hotel->descripcionesLargas = json_decode(trim($hotel->descripcionLarga));
            }
            
            $hotel->dominios = DAOFactory::getHotelDominiosDAO()->queryByHotelId($hotel->id);
            
            $hotel->campania = DAOFactory::getCampaniaDAO()->load($hotel->campaniaId);
        }
        
        return $hoteles;
        
    } catch (Exception $e) {
        return false;
    }
}

function getHotelesFavoritos() {
    try {
        
        $hoteles = DAOFactory::getHotelDAO()->queryFavoritos();
        return $hoteles;
        
    } catch (Exception $e) {
        return false;
    }
}

function getHotelesCampaniasActivas($term = "", $start = 0, $limit = 10, $exceptId = 0, $args = array()) {
    try {
        
        $rows = DAOFactory::getHotelDAO()->queryByCampaniasActivas($term, $start, $limit, $exceptId, $args);
        $hoteles = array();
        foreach ($rows as $row) {
            if(!$hoteles[$row['hotel_id']]) {
                foreach ($row as $key=>$value) {
                    if(is_string($value)) $value = strip_tags ($value);
                    $k = explode('_', $key);
                    if(strcmp($k[1], 'descripcion') == 0) {
                        if($value && strlen($value) > 1 &&
                                $value[0] == '{' && $value[strlen($value) - 1] == '}')
                            $value = json_decode ($value);
                        else {
                            $value = json_decode(json_encode(array('es'=>$value)));
                        }
                    }
                    
                    if(strcmp($k[0], 'hotel')==0)
                        $hoteles[$row['hotel_id']][$k[1]] = $value;
                    else {                        
                        $hoteles[$row['hotel_id']][$k[0]][$k[1]] = $value;
                    }
                }
            }
        }
        $counts = DAOFactory::getHotelDAO()->countByCampaniasActivas($term, $exceptId, $args);
        
        while(is_array($counts))
            $counts = $counts[0];
        
        $hoteles['count'] = $counts;
        $hoteles['start'] = $start;
        $hoteles['limit'] = $limit;
        
        return $hoteles;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

function getLocationsHotelesCampaniasActivas($term = "") {
    try {
        
        $rows = DAOFactory::getHotelDAO()->locationsByCampaniasActivas($term);
                
        return $rows;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

function getHotelesByUsuario($idUsuario, $data = true) {

    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        
        if($usuario->usuarioGrupoId == 1)
            return getAllHoteles();
        
        $hoteles = DAOFactory::getHotelDAO()->queryByUsuarioId($idUsuario);
        
        if(!$data)            
            return $hoteles;
        
        foreach ($hoteles as $hotel) {
            if($hotel->nombre && strlen(trim($hotel->nombre)) > 2 && $hotel->nombre[0] == '{' && $hotel->nombre[strlen($hotel->nombre)-1] == '}') {
                $hotel->nombre = json_decode(trim($hotel->nombre))->es;
            }

            if($hotel->descripcionCorta && strlen(trim($hotel->descripcionCorta)) > 0) {
                $hotel->descripcionesCortas = json_decode(trim($hotel->descripcionCorta));
            }

            if($hotel->descripcionLarga && strlen(trim($hotel->descripcionLarga)) > 0) {
                $hotel->descripcionesLargas = json_decode(trim($hotel->descripcionLarga));
            }
            
            $hotel->dominios = DAOFactory::getHotelDominiosDAO()->queryByHotelId($hotel->id);
            
            $hotel->campania = DAOFactory::getCampaniaDAO()->load($hotel->campaniaId);
        }
        
        return $hoteles;
        
    } catch (Exception $e) {
        return false;
    }
}

function getAllHotelImages($idHotel, $all = false) {
    try {
        
        $h_archivos = DAOFactory::getHotelArchivoDAO()->queryByHotelId($idHotel);
        $images = array();

        if($h_archivos)
            foreach ($h_archivos as $h_a) {
                $images[] = DAOFactory::getArchivoDAO()->load($h_a->archivoId);
            }
        /*    
        if($all) {
            $hotel = DAOFactory::getHotelDAO()->load($idHotel);
            if($hotel->destinoId) {
                $imagesDestino = getAllDestinoImages($hotel->destinoId);
                $images = array_merge($images, $imagesDestino);
            }
        }*/

        return $images;
        
    } catch (Exception $e) {
        return false;
    }
}

function getHotelLogo($idHotel, $all = false) {
    try {
        
        $h_archivos = DAOFactory::getHotelArchivoDAO()->queryByHotelId($idHotel);
        $archivo = null;
        if($h_archivos)
            foreach ($h_archivos as $h_a) {
                $archivo = DAOFactory::getArchivoDAO()->load($h_a->archivoId);
                if($archivo->tipo == "logo")
                    return $archivo;
            }
          
        return isset($h_archivos[0]) ? DAOFactory::getArchivoDAO()->load($h_archivos[0]->archivoId) : $archivo;
        
        
    } catch (Exception $e) {
        return false;
    }
}

function getAllHotelServicios($idHotel) {
    try {
        
        $h_servicios = DAOFactory::getHotelServicioDAO()->queryByHotelId($idHotel);
        $servicios = array();

        if($h_servicios){
            foreach ($h_servicios as $h_k => $h_s) {
                $s = DAOFactory::getServicioDAO()->load($h_s->servicioId);
                if($s->tipo != 'hotel')
                    continue;
                $c = DAOFactory::getServicioCategoriaDAO()->load($s->servicioCategoriaId);
                $s->descripciones = json_decode($s->nombre);
                
                $servicios[$c->id]['categoria'] = json_decode($c->nombre);
                $servicios[$c->id]['servicios'][$h_k] = $s; 
            }
        }

        return $servicios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getAllHotelCondiciones($idHotel) {
    try {
        
        $h_servicios = DAOFactory::getHotelServicioDAO()->queryByHotelId($idHotel);
        $servicios = array();

        if($h_servicios){
            foreach ($h_servicios as $h_k => $h_s) {
                $s = DAOFactory::getServicioDAO()->load($h_s->servicioId);
                if($s->tipo != 'condicion')
                    continue;
                $c = DAOFactory::getServicioCategoriaDAO()->load($s->servicioCategoriaId);
                $s->descripciones = json_decode($s->nombre);
                
                $servicios[$c->id]['categoria'] = json_decode($c->nombre);
                $servicios[$c->id]['servicios'][$h_k] = $s; 
            }
        }

        return $servicios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getAllHotelTenerEnCuenta($idHotel) {
    try {
        
        $h_servicios = DAOFactory::getHotelServicioDAO()->queryByHotelId($idHotel);
        $servicios = array();

        if($h_servicios){
            foreach ($h_servicios as $h_k => $h_s) {
                $s = DAOFactory::getServicioDAO()->load($h_s->servicioId);
                if($s->tipo != 'tener en cuenta')
                    continue;
                $c = DAOFactory::getServicioCategoriaDAO()->load($s->servicioCategoriaId);
                $s->descripciones = json_decode($s->nombre);
                
                $servicios[$c->id]['categoria'] = json_decode($c->nombre);
                $servicios[$c->id]['servicios'][$h_k] = $s; 
            }
        }

        return $servicios;
        
    } catch (Exception $e) {
        return false;
    }
}

function getHotelByUrl($url) {
    try {
        $hotel = DAOFactory::getHotelDAO()->queryByUrl($url);
        
        if($hotel && is_array($hotel) && count($hotel))
            $hotel = $hotel[0];
        else 
            return false;
        
        $hotel->campania = getCampania($hotel->campaniaId);
        $hotel->empresa = getEmpresaById($hotel->campania->empresaId);
        $hotel->distribuidor = getEmpresaById($hotel->campania->empresaDistribuidoraId);
        
        $hotel->direccion = getDireccionByHotel($hotel->id);
        if($hotel->configuracionId)
            $hotel->config = getConfiguracionById($hotel->configuracionId);
                
        $hotel->empresa = getEmpresaById($hotel->empresaId);
        
        $hotel->idiomas = getAllIdiomas();
        $hotel->monedas = getMonedasByHotelId($hotel->id);
        $hotel->condiciones = getCondicionesByHotelId($hotel->id);
        
        if($hotel->nombre && strlen(trim($hotel->nombre)) > 2 && $hotel->nombre[0] == '{' && $hotel->nombre[strlen($hotel->nombre)-1] == '}') {
            $hotel->nombre = json_decode(trim($hotel->nombre))->es;
        }
        
        if($hotel->descripcionCorta && strlen(trim($hotel->descripcionCorta)) > 0) {
            $hotel->descripcionesCortas = json_decode(trim($hotel->descripcionCorta));
        }
        
        if($hotel->descripcionLarga && strlen(trim($hotel->descripcionLarga)) > 0) {
            $hotel->descripcionesLargas = json_decode(trim($hotel->descripcionLarga));
        }
        
        if($hotel->informacionCompra && strlen(trim($hotel->informacionCompra)) > 0) {
            $hotel->informacionesCompra = json_decode(trim($hotel->informacionCompra));
        }
        
        if($hotel->tituloSeo && strlen(trim($hotel->tituloSeo)) > 0) {
            $hotel->titulosSeo = json_decode(trim($hotel->tituloSeo));
        }
        
        if($hotel->keywordsSeo && strlen(trim($hotel->keywordsSeo)) > 0) {
            $hotel->jkeywordsSeo = json_decode(trim($hotel->keywordsSeo));
        }
        
        $hotel->fechas = DAOFactory::getHotelFechasDAO()->queryByHotelId($hotel->id);
        
        if($hotel->logoId) {
            $hotel->logo = DAOFactory::getArchivoDAO()->load($hotel->logoId);
        }
        
        $hotel->dominios = DAOFactory::getHotelDominiosDAO()->queryByHotelId($hotel->id);
        
        $hotel->promociones = DAOFactory::getPromocionDAO()->queryByHotelId($hotel->id);
        
        $hotel->blacklist = DAOFactory::getBlacklistDAO()->queryByHotelId($hotel->id);
        
        if($hotel->monedaId) {
            $hotel->moneda = getMoneda($hotel->monedaId);
        }
        
        return $hotel;
    } catch (Exception $e) {
        return false;
    }
}
function getHotelById($id, $convertirMonedas = true){
    try {
        $hotel = DAOFactory::getHotelDAO()->load($id);
        $hotel->direccion = getDireccionByHotel($hotel->id);
        if($hotel->configuracionId)
            $configuracion = DAOFactory::getConfiguracionDAO()->load($hotel->configuracionId);
        if($hotel->configuracionId)
            $hotel->config = getConfiguracionById($hotel->configuracionId);
        if($hotel->campaniaId) {
            $hotel->campania = getCampania($hotel->campaniaId);
            if($hotel->campania->empresaId)
                $hotel->empresa = getEmpresaById($hotel->campania->empresaId);
            if($hotel->campania->empresaDistribuidoraId)
                $hotel->distribuidor = getEmpresaById($hotel->campania->empresaDistribuidoraId);
        }
        
        $hotel->idiomas = getAllIdiomas();
        $hotel->monedas = getMonedasByHotelId($hotel->id);
        $hotel->condiciones = getCondicionesByHotelId($hotel->id);
        
        if($hotel->nombre && strlen(trim($hotel->nombre)) > 2 && $hotel->nombre[0] == '{' && $hotel->nombre[strlen($hotel->nombre)-1] == '}') {
            $hotel->nombre = json_decode(trim($hotel->nombre))->es;
        }
        
        if($hotel->descripcionCorta && strlen(trim($hotel->descripcionCorta)) > 0) {
            $hotel->descripcionesCortas = json_decode(trim($hotel->descripcionCorta));
        }
        
        if($hotel->descripcionLarga && strlen(trim($hotel->descripcionLarga)) > 0) {
            $hotel->descripcionesLargas = json_decode(trim($hotel->descripcionLarga));
        }
        
        if($hotel->informacionCompra && strlen(trim($hotel->informacionCompra)) > 0) {
            $hotel->informacionesCompra = json_decode(trim($hotel->informacionCompra));
        }
        
        if($hotel->tituloSeo && strlen(trim($hotel->tituloSeo)) > 0) {
            $hotel->titulosSeo = json_decode(trim($hotel->tituloSeo));
        }
        
        if($hotel->keywordsSeo && strlen(trim($hotel->keywordsSeo)) > 0) {
            $hotel->jkeywordsSeo = json_decode(trim($hotel->keywordsSeo));
        }
        
        $hotel->fechas = DAOFactory::getHotelFechasDAO()->queryByHotelId($hotel->id);
        
        if($hotel->logoId) {
            $hotel->logo = DAOFactory::getArchivoDAO()->load($hotel->logoId);
        }
        
        $hotel->dominios = DAOFactory::getHotelDominiosDAO()->queryByHotelId($hotel->id);
        
        $hotel->promociones = DAOFactory::getPromocionDAO()->queryByHotelId($hotel->id);
        
        if($hotel->promociones) {
            $hotel->promocionActual = false;
            foreach ($hotel->promociones as $p) {
                $now = time();
                if($now >= strtotime($p->inicio) && $now <= (strtotime($p->fin) + 24 * 60 * 60))
                    $hotel->promocionActual = $p;
            }
        }
        if($hotel->monedaId) {
            $hotel->moneda = getMoneda($hotel->monedaId);
        }
        global $money;

        $preciosMinimos = DAOFactory::getHotelPrecioDAO()->queryByHotelId($hotel->id);
        if($preciosMinimos && count($preciosMinimos)) {
            $precio_minimo_val = $preciosMinimos[0]->precioMinimo;
            if($convertirMonedas){
                $precio_moneda_seleccionada = convertFromMonedaToMoneda($precio_minimo_val, $hotel->moneda->codigo, $money);
                $preciosMinimos[0]->precioMinimo = $precio_moneda_seleccionada;
            }else{
                $preciosMinimos[0]->precioMinimo = $precio_minimo_val;
            }
            $hotel->precioMinimo = $preciosMinimos[0];
        }
        
        
        $hotel->blacklist = DAOFactory::getBlacklistDAO()->queryByHotelId($hotel->id);
        
        if($hotel->destinoId) {
            $hotel->destino = getDestino($hotel->destinoId);
            if($hotel->destino->descripcion) $hotel->destino->descripciones = json_decode ($hotel->destino->descripcion);
            if($hotel->mostrarHotelesRelacionados) {
                $hoteles = DAOFactory::getHotelDAO()->queryByDestinoId($hotel->destinoId);
                $keys = array_rand($hoteles, (count($hoteles) > 10) ? 10 : count($hoteles));
                if(!is_array($keys)) $keys = array($keys);
                $relacionados = array();
                

                foreach($keys as $k) {
                    $h = $hoteles[$k];
                    if($h->id != $hotel->id) {
                        $precioMinimo = DAOFactory::getHotelPrecioDAO()->queryByHotelId($h->id);
                        if($precioMinimo && count($precioMinimo)){
                            $precio_minimo_val = $precioMinimo[0]->precioMinimo;
                            $precio_moneda_seleccionada = convertFromMonedaToMoneda($precio_minimo_val, $hotel->moneda->codigo, $money);
                            $precioMinimo[0]->precioMinimo = $precio_moneda_seleccionada;
                            $h->precioMinimo = $precioMinimo[0];
                            $h->logo = getHotelLogo($h->id);                            
                        }                            
                        
                        $h->campania = DAOFactory::getCampaniaDAO()->load($h->campaniaId);
                        $relacionados[] = $h;
                    }
                }
                $hotel->relacionados = $relacionados;                
            }
        }
        
        return $hotel;
    } catch (Exception $e) {
        return false;
    }
}

function getHotelByDominio($dominio) {
    try {
        
        $dominios = DAOFactory::getHotelDominiosDAO()->queryByDominio($dominio);
        
        if($dominios && count($dominios)) {
            $dominios = $dominios[0];
            $hotel = getHotelById($dominios->hotelId);
            $hotel->dominio = $dominio;
            return $hotel;
        }
        
        $hotel = DAOFactory::getHotelDAO()->queryByDominioCampania($dominio);
        if($hotel && count($hotel)) {
            return getHotelById($hotel[0]->id);
        }
        
        $hotel = DAOFactory::getHotelDAO()->queryByDominioOficial($dominio);
        if($hotel && count($hotel)) {
            return getHotelById($hotel[0]->id);
        }

        $hotel = DAOFactory::getHotelDAO()->queryByAdwords($dominio);
        if($hotel && count($hotel)) {
            return getHotelById($hotel[0]->id);
        }
        
        return false;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getDireccionByHotel($idHotel) {
    try {
        
        $hd = DAOFactory::getHotelDireccionDAO()->queryByHotelId($idHotel);
        
        if($hd && count($hd)) {
            $direccion = DAOFactory::getDireccionDAO()->load($hd[0]->direccionId);
            return $direccion;
        }
        
        return false;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}


function getIdiomasByHotelId($id) {
    try {
        $idiomas = array();
        $ids = DAOFactory::getHotelIdiomaDAO()->queryByHotelId($id);
        foreach ($ids as $k=>$id) {
            $idiomas[$k] = DAOFactory::getIdiomaDAO()->load($id->idiomaId);
        }
        return $idiomas;
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getMonedasByHotelId($id) {
    try {
        $monedas = array();
        $mons = DAOFactory::getHotelMonedaDAO()->queryByHotelId($id);
        foreach ($mons as $k=>$id) {
            $monedas[$k] = DAOFactory::getMonedaDAO()->load($id->monedaId);
        }
        return $monedas;
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getCondicionesByHotelId($id) {
    try {
        $condiciones = array();
        $ids = DAOFactory::getHotelCondicionDAO()->queryByHotelId($id);
        
        foreach ($ids as $k=>$cid) {
            $condiciones[$cid->condicionId] = DAOFactory::getCondicionDAO()->load($cid->condicionId);
            $condiciones[$cid->condicionId]->nombres = json_decode($condiciones[$cid->condicionId]->nombre);
            $condiciones[$cid->condicionId]->descripciones = json_decode($condiciones[$cid->condicionId]->descripcion);
        }
        return $condiciones;
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getParametrosVikaByHotelId($id) {
    try {
        $hotel = getHotelById($id);
        
        if($hotel->config && $hotel->config->sincronizacionVika) {
            $distribuidor = array (
                'email' => $hotel->config->vikaEmail,
                'password' => $hotel->config->vikaPassword,
                'empresaId' => $hotel->config->vikaEmpresa,
                'canal' => $hotel->config->vikaCanal
            );
            
            return $distribuidor;
        }
        
        return false;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function insertLogo($data = array(), $idHotel = 0) {
    try {
        
        $transaction = new Transaction();
        
        $archivo = DAOFactory::getArchivoDAO()->prepare($data);
        
        $archivo_id = DAOFactory::getArchivoDAO()->insert($archivo);
        
        if($archivo_id) $transaction->commit();
        
        if($idHotel && DAOFactory::getHotelDAO()->load($idHotel)) {
            $h = DAOFactory::getHotelDAO()->prepare(array('logoId' => $archivo_id), $idHotel);
            DAOFactory::getHotelDAO()->update($h);
        }
        
        return $archivo_id;
        
    } catch(Exception $e) {
        var_dump($e);
        
        if($transaction) $transaction->rollback();
        
        return false;
    }
}

function completarCampania($idUsuario, $data_hotel, $data_empresa, 
        $data_direccion, $idiomas, $monedas, $promociones) {
    try {
        
        $transaction = new Transaction();
        
        $empresas = getEmpresasByUsuario($idUsuario);
        $empresa = $empresas[0];
        
        $emp = updateEmpresa($empresa->id, $data_empresa, $data_direccion, false);
        
        if(!$emp) throw new Exception ('No se guardaron los datos de la empresa');
        
        $hoteles = getHotelesByUsuario($idUsuario);
        
        $idHotel = $hoteles[0]->id;
        
        $hotel = DAOFactory::getHotelDAO()->prepare($data_hotel, $idHotel);

        DAOFactory::getHotelDAO()->update($hotel);
        
        getClaveByHotel($idHotel);
        
        DAOFactory::getHotelIdiomaDAO()->deleteByHotelId($idHotel);
        if(count($idiomas)) {
            foreach ($idiomas as $idioma) {
                $id = DAOFactory::getHotelIdiomaDAO()->prepare(array('hotelId'=>$idHotel, 'idiomaId'=>$idioma));
                DAOFactory::getHotelIdiomaDAO()->insert($id);
            }
        }
        
        DAOFactory::getHotelMonedaDAO()->deleteByHotelId($idHotel);
        if(count($monedas)) {
            foreach ($monedas as $moneda) {
                $mon = DAOFactory::getHotelMonedaDAO()->prepare(array('hotelId'=>$idHotel, 'monedaId'=>$moneda));
                DAOFactory::getHotelMonedaDAO()->insert($mon);
            }
        }
        
        DAOFactory::getPromocionDAO()->deleteByHotelId($idHotel);
        foreach ($promociones as $data_promocion) {
            $data_promocion['hotelId'] = $idHotel;
            $promocion = DAOFactory::getPromocionDAO()->prepare($data_promocion);
            DAOFactory::getPromocionDAO()->insert($promocion);
        }
        
        $usuario = DAOFactory::getUsuarioDAO()->prepare(array('status'=>'activo'), $idUsuario);
        DAOFactory::getUsuarioDAO()->update($usuario);
        
        $transaction->commit();
        
        return true;
        
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getClaveByHotel($idHotel) {
    try {
        
        $hotel = DAOFactory::getHotelDAO()->load($idHotel);
        
        /*
        if(!$hotel->clave || !strlen($hotel->clave)) {
            
            $h = DAOFactory::getHotelDAO()->prepare(array('clave'=>Encrypter::encrypt(uniqid(), $idHotel)), $idHotel);
            DAOFactory::getHotelDAO()->update($h);
            $hotel = DAOFactory::getHotelDAO()->load($idHotel);
        }*/
        
        return Encrypter::decrypt($hotel->clave, $idHotel);
        
    } catch(Exception $e) {
        return false;
    }
}
/*
function getHotelesByUsuario($idUsuario) {
    try {
        
        $hoteles = DAOFactory::getHotelDAO()->queryByUsuarioId($idUsuario);
        
        return $hoteles;
        
    } catch (Exception $e) {
        error_log($e);
        return false;
    }
}*/

function buscarHoteles($term, $usuarioId = 0) {
    try {
        
        $hoteles = DAOFactory::getHotelDAO()->queryByTerm($term, $usuarioId);
        return $hoteles;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getHotelesByDestino($idDestino, $idUsuario) {

    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        
        if($usuario->usuarioGrupoId == 1)
            $hoteles = DAOFactory::getHotelDAO()->queryByDestinoId($idDestino);
        else 
            $hoteles = DAOFactory::getHotelDAO()->queryByUsuarioIdAndDestinoId($idUsuario, $idDestino);
        
        foreach ($hoteles as $hotel) {
            if($hotel->nombre && strlen(trim($hotel->nombre)) > 2 && $hotel->nombre[0] == '{' && $hotel->nombre[strlen($hotel->nombre)-1] == '}') {
                $hotel->nombre = json_decode(trim($hotel->nombre))->es;
            }

            if($hotel->descripcionCorta && strlen(trim($hotel->descripcionCorta)) > 0) {
                $hotel->descripcionesCortas = json_decode(trim($hotel->descripcionCorta));
            }

            if($hotel->descripcionLarga && strlen(trim($hotel->descripcionLarga)) > 0) {
                $hotel->descripcionesLargas = json_decode(trim($hotel->descripcionLarga));
            }
            
            $hotel->dominios = DAOFactory::getHotelDominiosDAO()->queryByHotelId($hotel->id);
            
            $hotel->campania = DAOFactory::getCampaniaDAO()->load($hotel->campaniaId);
        }
        
        return $hoteles;
        
    } catch (Exception $e) {
        return false;
    }
}

function getLoginCodeByHotelId($id) {
    try {
        
        $hotel = DAOFactory::getHotelDAO()->load($id);
        
        $loginCode = encryptId($id);
        
        $loginCode .= '-' . encryptId(date('Y', strtotime($hotel->tiempoCreacion)));
        $loginCode .= '-' . encryptId(date('m', strtotime($hotel->tiempoCreacion)));
        $loginCode .= '-' . encryptId(date('d', strtotime($hotel->tiempoCreacion)));
        
        return $loginCode;
        
    } catch (Exception $e) {
        return false;
    }
}

function getHotelIdByLoginCode($loginCode) {
    try {
        
        $arr_loginCode = explode('-', $loginCode);
        
        $id = decryptId($arr_loginCode[0]);
        $Y = decryptId($arr_loginCode[1]);
        $m = decryptId($arr_loginCode[2]);
        $d = decryptId($arr_loginCode[3]);
        
        $hotel = DAOFactory::getHotelDAO()->load($id);
        if(strtotime(date('Y-m-d' ,strtotime($hotel->tiempoCreacion))) == strtotime("$Y-$m-$d")) {
            return $id;
        }
        return false;
        
    } catch (Exception $e) {
        return false;
    }
}

function filtrarHotelesPorDestino($idUsuario, $idDestino = 0, $args = array()) {
    try {
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        $id = ($usuario->usuarioGrupoId == 1) ? 0 : $idUsuario;
        $destinoId = (strlen(trim($idDestino))) ? $idDestino : 0;
        $rows = DAOFactory::getHotelDAO()->filterByDestinoAndUsuario($id, $destinoId, $args);
        //print_r($rows);
        return $rows;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

function getDominiosByHotel($hotelId) {
    try {
        
        $hotel = DAOFactory::getHotelDAO()->load($hotelId);
        
        $campania = DAOFactory::getCampaniaDAO()->load($hotel->campaniaId);
        
        $dominios = array(
            $campania->subdominio,
            $hotel->dominioOficial
        );
        
        $hds = DAOFactory::getHotelDominiosDAO()->queryByHotelId($hotelId);
        
        foreach ($hds as $d) {
            $dominios[] = $d->dominio;
        }
        
        return $dominios;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getPreciosHoteles($term, $exceptId = 0) {
    try {
        
        $precios = DAOFactory::getHotelDAO()->preciosMinimosByCampaniasActivas($term, $exceptId);
        
        return $precios;
        
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getCalidadHoteles($term, $exceptId = 0) {
    try {
        
        $calidad = DAOFactory::getHotelDAO()->estrellasByCampaniasActivas($term, $exceptId);
        
        return $calidad;
        
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function userCanAccessHotel($idHotel, $idUser) {
    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUser);
        if($usuario->usuarioGrupoId == 1)
            return true;
        $uh = DAOFactory::getHotelDAO()->queryUsuarioHotel($idUser, $idHotel);
        if($uh && count($uh))
            return true;
        
        return false;
        
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}
function getSimpleHotel($idHotel) {
    try {
        
        $hotel = DAOFactory::getHotelDAO()->load($idHotel);       
        return $hotel;
        
    } catch(Exception $e) {
        return false;
    }
}
?>