<?php 
$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');

if (strcmp($action, 'update') == 0) {
    $data = array(
        'contenido' => NULL
    );

    foreach ($data as $key => $value) {
        if (isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }

    if(getFaq(1)){
        $faq = updateFaq(1, $data);    
    }else{
        $faq = insertFaq($data);
    }

    if ($faq) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

echo json_encode($result);
?>