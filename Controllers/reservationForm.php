<?php

$reserva = getReserva(133);

generarFactura($reserva, $hotel);
    

function generarFactura($reserva, $hotel) {
    try {
        
        global $template_dir;
        global $template_url;
        
        $pdfWriter = new PdfWriter();

        $pdfWriter->Header();
        
        $pdfWriter->printHeaderRow(1,'Factura', $reserva->localizador);
        $ruta = ' ';
        if($hotel->logoId) {
            $ruta = ' img('.$hotel->logo->ruta.') ';
        } else {
            $ruta = ' img('.$template_url.'/images/logo.png) ';
        } 
        $pdfWriter->printHeaderRow(2,$ruta . ' '.$smarty->getConfigVariable('sistema_nombre'), '', 90, 'R');
        
        $pdfWriter->printRow(1,'', "Nombre: " . $reserva->usuario->nombre . "
Apellido: " . $reserva->usuario->apellido . "
Email: ".$reserva->usuario->email."
Telefono: ".$reserva->usuario->telefono."
");
        
    $pdfWriter->printRow(2,'', "Distribuidor:" . $hotel->distribuidor->nombreComercial."
CIF: ".$hotel->distribuidor->numeroFiscal."
Direccion: ".$hotel->distribuidor->direccion->descripcion."
Telefono: ".$hotel->distribuidor->telefonoReservas."
Email: ".$hotel->distribuidor->emailReservas."
");
    
    $pdfWriter->PrintBorderTableRow('Cargos facturados:');
    $total = 0;
    foreach($reserva->alojamiento as $p) {
        if($p->importeInicial) {
            $pdfWriter->printRow(1,"Localizador $reserva->localizador - gestión de reserva $p->porcientoInicial %", 
                "$p->nombre", 150);
            $pdfWriter->printRow(2,$reserva->moneda->codigo . ' ' . number_format($p->importeInicial, 2, ',', ''),'', 30);
        
            $total += $p->importeInicial;
        }
    }

    foreach($reserva->extras as $p) {
        if($p->importeInicial) {
            $pdfWriter->printRow(1,"Localizador $p->localizador - gestión de reserva $p->porcientoInicial %", 
                "$p->nombre", 150);
            $pdfWriter->printRow(2,$reserva->moneda->codigo . ' ' . number_format($p->importeInicial, 2, ',', ''),'', 30);
            
            $total += $p->importeInicial;
        }
    }

    $pdfWriter->PrintBorderTableRow('  ');

    $pdfWriter->printRow(1,'','', 130);
    $pdfWriter->printRow(2,'Total: ' . $reserva->moneda->codigo . ' ' . number_format($total, 2, ',', ''),'Impuestos y tasas incluidas', 50, 'C');

    $pdfWriter->printRow(1,'','', 180, 'C');
    $pdfWriter->printRow(2,'','', 180, 'C');
    $pdfWriter->printRow(3,"Si tienes alguna duda sobre la factura, no dudes en consultarnos en
    " . $hotel->distribuidor->emailReservas . " o llamando al " . $hotel->distribuidor->telefonoReservas, '', 250, 'C');
        /*
        $pdfWriter->printRow(2, '', 'dsfgsdfg sdf gsdfgsdfg sdfg sdf gsdfg sdfg ');
        $pdfWriter->printRow(3, '', 'dsfgsdfg sdf gsdfgsdfg sdfg sdf gsdfg sdfg ');*/
        $filename = $template_dir . '/pdf/factura_' . $reserva->localizador . '.pdf';
        $pdfWriter->Output();
        //return $filename;
    } catch(Exception $e) {
        print_r($e);
        //return false;
    }
}

?>