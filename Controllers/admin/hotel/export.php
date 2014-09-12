<?php 
include 'Lib/excel/PHPExcel.php';
$objPHPExcel = new PHPExcel();

$objPHPExcel->getProperties()->setCreator("Matias Barbarroja")
							 ->setTitle("Hoteles")
							 ->setSubject("Hoteles exportados")
							 ->setDescription("Lista de hoteles exportados desde el sistema.");

$hoteles = $_SESSION['lastHoteles'];

$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Nombre')
            ->setCellValue('B1', 'Destino')
            ->setCellValue('C1', 'Dominio')
            ->setCellValue('D1', 'Periodo del contrato')
            ->setCellValue('E1', 'Email')
            ->setCellValue('F1', 'Teléfono');


if(count($hoteles)){
	$counter = 2;

	foreach ($hoteles as $hotel) {
		$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$counter, $hotel['nombre'])
            ->setCellValue('B'.$counter, $hotel['destino'])
            ->setCellValue('C'.$counter, $hotel['subdominio'])
            ->setCellValue('D'.$counter, $hotel['contrato'])
            ->setCellValue('E'.$counter, $hotel['email_reservas'])
            ->setCellValue('F'.$counter, $hotel['telefono_reservas']);

        $counter++;

	}

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="hoteles.xls"');
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
?>