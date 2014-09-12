<?php

$result = array('msg'=> 'ok', 'data' => NULL);

$page = $_GET['id'];

if(isset($_GET['print'])) {
    $smarty->assign('print', true);
    $smarty->display($page . '.tpl');
} else {
    $result['data'] = $smarty->fetch($page . '.tpl');
    echo json_encode($result);
}

?>