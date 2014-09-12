<?php

include_once dirname(__FILE__) . '/../Lib/html2pdf_v4.03/html2pdf.class.php';

class Html2PdfWriter {

    public static function write($content, $dir) {
        try {
            $html2pdf = new HTML2PDF('P', 'A4', 'es');
            $html2pdf->writeHTML($content);
            $html2pdf->Output($dir, 'F');
            return true;
        } catch (Exception $ex) {
            print_r($ex);
            return false;
        }
    }
}

?>