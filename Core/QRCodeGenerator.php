<?php

include_once dirname(__FILE__) . '/../Lib/phpqrcode/qrlib.php';

class QRCodeGenerator {
    
    public static function Generate($info, $filename) {
        $sitename = '/vikatickets';
        $dir_path = $_SERVER['DOCUMENT_ROOT'].$sitename.'/cache/'; 
        QRcode::png($info, $dir_path.$filename, 'H', 6);
    }
    
}

?>