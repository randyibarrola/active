<?php 
$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');
require 'Logic/afiliado.php';
if (strcmp($action, 'buscar') == 0) {
    $args = $_POST;
    $afiliado = getAfiliadoByIdUsuario($usuario_core->getUsuario()->id);
    $args['afiliadoId'] = $afiliado->id;
    $ganancias = getGananciasByArgs($args);
    $c = countGananciasByArgs($args);

    if(count($ganancias)) {
        $totalFacturado = 0;
        foreach ($ganancias as $g_k => $ganancia) {
            if($ganancia['estado'] == 'Confirmada') {
                $totalFacturado += $ganancia['comision'];
                $ganancias[$g_k]['comision'] = '&euro;' . number_format($ganancia['comision'], 2, ',', '');
            }else{
                $ganancias[$g_k]['comision'] = '&euro;0';
            }
            
            $ganancias[$g_k]['porcentaje'] = $ganancias[$g_k]['porcentaje'].'%';
            
            $ganancias[$g_k]['fecha_inicio'] = date('d-m-Y', strtotime($ganancia['fecha_inicio']));
            $ganancias[$g_k]['fecha_final'] = date('d-m-Y', strtotime($ganancia['fecha_final']));
            $ganancias[$g_k]['tiempo_creacion'] = date('d-m-Y', strtotime($ganancia['tiempo_creacion']));
        }
        $totalFacturado = '&euro;' . number_format($totalFacturado, 2, ',', '');
        $ganancias[] = array(
            'localizador' => '',
            'hotel' => '',
            'fecha_inicio' => '',
            'fecha_final' => '',
            'tiempo_creacion' => '',
            'porcentaje' => '',
            'comision' => "Total: $totalFacturado",
            'estado' => ''
        );
    }

    $result = array(
        "iTotalRecords"=> $c,
        "iTotalDisplayRecords"=> $c,
        'aaData' => $ganancias
    );
}

echo json_encode($result);

?>