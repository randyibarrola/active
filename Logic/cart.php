<?php

function insertCart($data = array()) {
    try {
        
        $transaction = new Transaction();
        
        if(isset($data['apartamento'])) $data['apartamento'] = json_encode($data['apartamento']);
        if(isset($data['excursiones'])) $data['excursiones'] = json_encode($data['excursiones']);

        $cart = DAOFactory::getShoppingCartDAO()->prepare($data);
        $cart_id = DAOFactory::getShoppingCartDAO()->insert($cart);
        
        $transaction->commit();
        
        return $cart_id;
        
    } catch(Exception $e) {
        print_r($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function updateCart($idCart, $data = array()) {
    try {
        
        $transaction = new Transaction();
        
        if(isset($data['apartamento'])) $data['apartamento'] = json_encode($data['apartamento']);
        if(isset($data['excursiones'])) $data['excursiones'] = json_encode($data['excursiones']);
        //print_r($data);
        $cart = DAOFactory::getShoppingCartDAO()->prepare($data, $idCart);
        DAOFactory::getShoppingCartDAO()->update($cart);
        
        $transaction->commit();
        
        return $idCart;
        
    } catch(Exception $e) {
        print_r($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getCart($idCart) {
    try {
        
        $cart = DAOFactory::getShoppingCartDAO()->load($idCart);
        
        if(!$cart) return false;
        
        $cart->apartamentoObj = json_decode($cart->apartamento);
        
        $cart->excursionesArray = json_decode($cart->excursiones);
        
        if($cart->monedaId)
            $cart->moneda = DAOFactory::getMonedaDAO()->load($cart->monedaId);
        
        return $cart;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

?>