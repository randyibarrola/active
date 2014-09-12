<?php



function getAllIdiomas() {
    try {
        
        $idiomas = DAOFactory::getIdiomaDAO()->queryAll();
        
        return $idiomas;
        
    } catch(Exception $e) {
        return false;
    }
}

function getAllMonedas() {
    try {
        
        $monedas = DAOFactory::getMonedaDAO()->queryAll();
        
        return $monedas;
        
    } catch(Exception $e) {
        return false;
    }
}

function getIdiomaByCodigo($codigo) {
    try {
        
        $idiomas = DAOFactory::getIdiomaDAO()->queryByCodigo(trim($codigo));
        
        if($idiomas && count($idiomas))
            return $idiomas[0];
        
        return false;
        
    } catch(Exception $e) {
        return false;
    }
}

function getMonedaByCodigo($codigo) {
    try {
        
        $monedas = DAOFactory::getMonedaDAO()->queryByCodigo(trim($codigo));
        
        if($monedas && count($monedas))
            return $monedas[0];
        
        return false;
        
    } catch(Exception $e) {
        return false;
    }
}

function getMoneda($id) {
    try {
        
        $moneda = DAOFactory::getMonedaDAO()->load($id);
        
        
        return $moneda;
        
    } catch(Exception $e) {
        return false;
    }
}

function convertFromMonedaToMoneda($cant, $codigoActual, $codigoDeseado, $formated = true) {
    try {
        if($codigoDeseado != $codigoActual) {
            $monedaActual = getMonedaByCodigo($codigoActual);
            $monedaDeseada = getMonedaByCodigo($codigoDeseado);
            $new_cant = $cant * $monedaDeseada->tasaCambio / $monedaActual->tasaCambio;
        }else{
            $new_cant = $cant;
        }
        if($formated){
            if($codigoDeseado != 'EUR' && $codigoDeseado != 'GBP'){
                return number_format($new_cant, 2, '.', '');
            }else{
                return number_format($new_cant, 2, ',', '');
            }
        }else{
            return $new_cant;
        }
        
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getAllEmpresaTipos() {
    try {
        
        $tipos = DAOFactory::getEmpresaTipoDAO()->queryAll();
        return $tipos;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getDireccion($id) {
    try {
        
        $direccion = DAOFactory::getDireccionDAO()->load($id);
        return $direccion;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    } 
}

function getIdioma($id) {
    try {
        
        $idioma = DAOFactory::getIdiomaDAO()->load($id);
        
        
        return $idioma;
        
    } catch(Exception $e) {
        return false;
    }
}

function actualizarCambioMoneda() {
    try {
        set_time_limit(0);
        $moneda = getMonedaByCodigo('USD');
        $hoy = strtotime(date('Y-m-d'));
        $lastUpdate = strtotime(date('Y-m-d', ($moneda->ultimaModificacion) ? strtotime($moneda->ultimaModificacion) : 0));
        
        if($hoy > $lastUpdate) {
            $monedas = getAllMonedas();
            $transaction = new Transaction();
            $change_url = 'https://www.google.com/finance/converter';
            

            $cant = 1;
            $from='EUR';

            foreach($monedas as $moneda){
                
                $content = file_get_contents($change_url . '?a=' . $cant . '&from=' . $from . '&to=' . $moneda->codigo);
                $dom = new DOMDocument(); 
                @$dom->loadHTML($content); 
                $x = new DOMXPath($dom);
                foreach($x->query('//span[@class="bld"]') as $node){ 
                    $rate = floatval(trim(str_replace($moneda->codigo, '', $node->nodeValue)));
                    $m = DAOFactory::getMonedaDAO()->prepare(array(
                        'tasaCambio' => $rate,
                        'ultimaModificacion' => date('Y-m-d')
                    ), $moneda->id);
                    DAOFactory::getMonedaDAO()->update($m);
                } 
                
                    
            }
            
            $transaction->commit();
        }
        
        return true;
        
    } catch(Exception $e) {
        print_r($e);
        if($transaction)
            $transaction->rollback();
        return false;
    }
}

?>