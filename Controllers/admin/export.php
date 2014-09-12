<?php 
error_reporting(E_ALL);
$hoteles = getHotelesFavoritos();

$columns = array('Campaign', 'Campaign Daily Budget', 'Languages', 'Location ID', 'Location', 'Networks', 'Ad Group', 'Max CPC', 'Flexible Reach', 'Display Network Custom Bid Type', 'Keyword', 'Type', 'Bid adjustment', 'Headline', 'Description Line 1', 'Description Line 2', 'Sitelink text', 'Display URL', 'Destination URL', 'Platform targeting', 'Device Preference', 'Ad Schedule');

$exported = array();
$exported[] = $columns;

$exported_data = array();
$exported_data[] = $columns;
$counter = 1;
$util = new Core_Util_General();

if($hoteles && is_array($hoteles)){
	foreach ($hoteles as $k => $hotel) {
		foreach ($columns as $column) {
			switch ($column) {
					case 'Campaign':
						$exported_data[$counter][] = 'Vikahotel - Canarias';
						break;
					case 'Campaign Daily Budget':
						$exported_data[$counter][] = '50';
						break;
					case 'Languages':
						$exported_data[$counter][] = 'es';
						break;
					default:
						$exported_data[$counter][] = '';
						break;
				}

			switch ($column) {
					case 'Campaign':
						$exported_data[$counter+1][] = 'Vikahotel - Canarias';
						break;
					case 'Location ID':
						$exported_data[$counter+1][] = '2724';
						break;
					/*case 'Location':
						$exported_data[$counter+1][] = 'Spain';
						break;*/
					default:
						$exported_data[$counter+1][] = '';
						break;
				}

			switch ($column) {
					case 'Campaign':
						$exported_data[$counter+2][] = 'Vikahotel - Canarias';
						break;
					case 'Ad Group':
						$exported_data[$counter+2][] = str_replace('Web oficial', '', $hotel->nombre);
						break;
					case 'Max CPC':
						$exported_data[$counter+2][] = '0.70';
						break;
					default:
						$exported_data[$counter+2][] = '';
						break;
				}


				switch ($column) {
					case 'Campaign':
						$exported_data[$counter+3][] = 'Vikahotel - Canarias';
						break;
					case 'Ad Group':
						$exported_data[$counter+3][] = str_replace('Web oficial', '', $hotel->nombre);
						break;
					case 'Headline':
						$exported_data[$counter+3][] = $util->truncate(str_replace('Web oficial', '', $hotel->nombre), 25, '');
						break;
					case 'Description Line 1':
						$exported_data[$counter+3][] = 'Reserva ya al Mejor precio Online!';
						break;
					case 'Description Line 2':
						$exported_data[$counter+3][] = 'Oferta exclusiva Web.';
						break;
					case 'Display URL':
						$exported_data[$counter+3][] = str_replace('-vikahotel.com', '', $hotel->adwords);
						break;
					case 'Destination URL':
						$exported_data[$counter+3][] = 'http://'.$hotel->adwords;
						break;
					default:
						$exported_data[$counter+3][] = '';
						break;
				}	

				switch ($column) {
					case 'Campaign':
						$exported_data[$counter+4][] = 'Vikahotel - Canarias';
						break;
					case 'Ad Group':
						$exported_data[$counter+4][] = str_replace('Web oficial', '', $hotel->nombre);
						break;
					case 'Keyword':
						$exported_data[$counter+4][] = str_replace('Web oficial', '', $hotel->nombre);
						break;
					case 'Type':
						$exported_data[$counter+4][] = 'Broad';
						break;
					default:
						$exported_data[$counter+4][] = '';
						break;
				}	
		}
		$counter = $counter + 5;
	}
}
$util->download_send_headers("data_export_" . date("Y-m-d") . ".csv");
echo $util->array2csv($exported_data);
die();

?>