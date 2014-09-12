<?php 
include 'Lib/excel/PHPExcel.php';

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Matias Barbarroja")
							 ->setTitle("Reservas")
							 ->setSubject("Reservas exportadas")
							 ->setDescription("Lista de reservas exportadas desde el sistema.");

$reservas = $_SESSION['lastReservas'];
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Localizador')
            ->setCellValue('B1', 'Cliente')
            ->setCellValue('C1', 'Hotel')
            ->setCellValue('D1', 'Llegada')
            ->setCellValue('E1', 'Salida')
            ->setCellValue('F1', 'Creación')
            ->setCellValue('G1', 'Total')
            ->setCellValue('H1', 'Comisión')
            ->setCellValue('I1', 'Estado')
            ->setCellValue('J1', 'OP')
            ->setCellValue('K1', 'OP devolución');

if(count($reservas)){
	$counter = 2;

	foreach ($reservas as $reserva) {
		$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$counter, $reserva['localizador'])
            ->setCellValue('B'.$counter, $reserva['cliente'])
            ->setCellValue('C'.$counter, $reserva['hotel'])
            ->setCellValue('D'.$counter, $reserva['llegada'])
            ->setCellValue('E'.$counter, $reserva['salida'])
            ->setCellValue('F'.$counter, $reserva['creacion'])
            ->setCellValue('G'.$counter, str_replace('&euro;', '€', $reserva['total']))
            ->setCellValue('H'.$counter, str_replace('&euro;', '€', $reserva['comision']))
            ->setCellValue('I'.$counter, $reserva['estado'])
            ->setCellValue('J'.$counter, $reserva['op'])
            ->setCellValue('K'.$counter, $reserva['opDevolucion']);

        $counter++;

	}

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="Reservas.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;
}else{
	echo "No se encontraron datos.";
}
/*
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Hello')
            ->setCellValue('B1', 'world!')
            ->setCellValue('C1', 'Hello')
            ->setCellValue('D1', 'world!');

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="01simple.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;
*/
?>