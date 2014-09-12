<?php 
$logged = $usuario_core->validateUser();
exit();
$hoteles = getAllHoteles();
$keys = array();

foreach ($hoteles as $h_k => $hotel) {
	$key = getClaveByHotel($hotel->id);
	$keys[$h_k]['hotel'] = $hotel->nombre;
	$keys[$h_k]['key'] = $key;
}

include 'Lib/excel/PHPExcel.php';
$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("Matias Barbarroja")
							 ->setTitle("d")
							 ->setSubject("Exportadas");

$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Hotel')
            ->setCellValue('B1', 'Key');

if(count($keys)){
	$counter = 2;

	foreach ($keys as $k) {
		$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$counter, $k['hotel'])
            ->setCellValue('B'.$counter, $k['key']);
        $counter++;
	}

header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="Keys.xls"');
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