<?php 
function insertFaq($data = array()) {
    try {
        
        $transaction = new Transaction();
        
        $faq = DAOFactory::getFaqDAO()->prepare($data);
        $id_faq = DAOFactory::getFaqDAO()->insert($faq);
        
        $transaction->commit();
        
        return $id_faq;
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function updateFaq($idFaq, $data = array()) {
    try {
        $transaction = new Transaction();
        
        $faq = DAOFactory::getFaqDAO()->prepare($data, $idFaq);
        DAOFactory::getFaqDAO()->update($faq);
        
        $transaction->commit();
        return $idFaq;
    } catch (Exception $e) {
        print_r($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getAllFaqs() {
    try {
        $faq = DAOFactory::getFaqDAO()->queryAll();
        return $faq;
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getFaq($id) {
    try {
        return DAOFactory::getFaqDAO()->load($id);
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function deleteFaq($id) {
    try {
        $transaction = new Transaction();
        
        $faq = DAOFactory::getFaqDAO()->load($id);
        DAOFactory::getFaqDAO()->delete($id);

        $transaction->commit();
        return true;
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}
?>