<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');

if (strcmp($action, 'filtrar') == 0) {
    
        
        $args = $_POST;
        
        $facturas = getFacturasByArgs($args);
        $total_facturado = 0;
        $total_comisiones = 0;

        foreach ($facturas as $pos=>$fact) {
            if($fact['cliente'] == 'hotel'){
                $facturas[$pos]['clienteNombre'] = $fact['hotel'];
            }else{
                $factura = getFactura($fact['id']);
                $reserva = $factura->reservas[0];
                if($reserva){
                    $facturas[$pos]['clienteNombre'] = $reserva->usuario->nombre.' '.$reserva->usuario->apellido;
                }
            }
            $total_facturado += $fact['total'];
            $total_comisiones += $fact['comision'];

            $facturas[$pos]['tiempoCreacion'] = date('d-m-Y',strtotime($fact['tiempoCreacion']));
            $facturas[$pos]['total'] = $fact['moneda'] . number_format($fact['total'], 2, ',', '');
            $facturas[$pos]['comision'] = $fact['moneda'] . number_format($fact['comision'], 2, ',', '');
            $login_code = getLoginCodeByHotelId($fact['hotelId']);
            $factura_code = encryptId($fact['id']);
            $facturas[$pos]['url'] = "$base_url/facturacion?login_code=$login_code&fcode=$factura_code";
        }
        
        $total = count(getAllFacturas());
        
        $filtered = countFacturasByArgs($args);

        if(count($facturas)) {
                $total_facturado = '&euro;' . number_format($total_facturado, 2, ',', '');
                $total_comisiones = '&euro;' . number_format($total_comisiones, 2, ',', '');
                $facturas[] = array(
                    'cliente' => '',
                    'clienteNombre' => '',
                    'estado' => '',
                    'hotel' => '',
                    'hotelId' => '',
                    'id' => '',
                    'total' => "<b>Total:<br> $total_facturado</b>",
                    'comision' => "<b>Comisión:<br> $total_comisiones</b>",
                    'numero' => '',
                    'tiempoCreacion' => '',
                    'url' => ''
                );
            }
        
        $result = array(
            "iTotalRecords"=> $total,
            "totalFacturado" => $total_facturado,
            "totalComisiones" => $total_comisiones,
            "iTotalDisplayRecords"=> $filtered,
            'aaData' => $facturas
        );
            
        
    
}

if (strcmp($action, 'cambiarEstado') == 0) {
    if(isset($_POST['id'])) {
        $facturaId = $_POST['id'];
        $estado = $_POST['estado'];
        
        $factura = getFactura($_POST['id']);
        $estadoAnterior = $factura->estado;
        
        cambiarEstadoFactura($facturaId, $estado);
        
        
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los datos correctamente';
        
    }
}

if (strcmp($action, 'enviarLink') == 0) {
    if(isset($_POST['idFactura'])) {
        
        //Temporal enviarEmailFactura($_POST['idFactura']);
        $result = array(
            'msg' => 'ok',
            'data' => 'Enviamos la dirección de la factura al email del hotel'
        );
        
        
    } else {
        $result['data'] = 'Seleccione la factura';
    }
}



echo json_encode($result);

?>