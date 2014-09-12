<?php
/**
 * Class that operate on table 'hotel'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-21 06:44
 */
class HotelMySqlDAO implements HotelDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return HotelMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM hotel WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM hotel';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM hotel ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param hotel primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM hotel WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelMySql hotel
 	 */
	public function insert($hotel){
		$sql = 'INSERT INTO hotel (nombre, descripcion_corta, descripcion_larga, visitas, estado, capacidad, tiempo_creacion, ultima_modificacion, url, calidad, empresa_id, configuracion_id, trip_advisor, background_color, estancia_minima, venta_anticipada, logo_id, porcentage_cobro_anticipado, informacion_compra, titulo_seo, keywords_seo, tipo_reserva, clave_google_analytics, inicioContrato, finContrato, descuento_booking, tipo_descuento_booking, email_reservas, campania_id, seo, clave, dominio_oficial, telefono_reservas, dominio_campania, booking_onrequest, idioma_id, destino_id, contenido_html, chat, header_vikahotel, mostrar_hoteles_relacionados, respetar_cupo, login_code, moneda_id, destacado, adwords, web_oficial, dominio_principal, email_contacto, lugares) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($hotel->nombre);
		$sqlQuery->set($hotel->descripcionCorta);
		$sqlQuery->set($hotel->descripcionLarga);
		$sqlQuery->setNumber($hotel->visitas);
		$sqlQuery->set($hotel->estado);
		$sqlQuery->setNumber($hotel->capacidad);
		$sqlQuery->set($hotel->tiempoCreacion);
		$sqlQuery->set($hotel->ultimaModificacion);
		$sqlQuery->set($hotel->url);
		$sqlQuery->set($hotel->calidad);
		$sqlQuery->setNumber($hotel->empresaId);
		$sqlQuery->setNumber($hotel->configuracionId);
		$sqlQuery->set($hotel->tripAdvisor);
		$sqlQuery->set($hotel->backgroundColor);
		$sqlQuery->setNumber($hotel->estanciaMinima);
		$sqlQuery->setNumber($hotel->ventaAnticipada);
		$sqlQuery->setNumber($hotel->logoId);
		$sqlQuery->set($hotel->porcentageCobroAnticipado);
		$sqlQuery->set($hotel->informacionCompra);
		$sqlQuery->set($hotel->tituloSeo);
		$sqlQuery->set($hotel->keywordsSeo);
		$sqlQuery->set($hotel->tipoReserva);
		$sqlQuery->set($hotel->claveGoogleAnalytics);
		$sqlQuery->set($hotel->inicioContrato);
		$sqlQuery->set($hotel->finContrato);
		$sqlQuery->set($hotel->descuentoBooking);
		$sqlQuery->set($hotel->tipoDescuentoBooking);
		$sqlQuery->set($hotel->emailReservas);
		$sqlQuery->setNumber($hotel->campaniaId);
		$sqlQuery->setNumber($hotel->seo);
		$sqlQuery->set($hotel->clave);
		$sqlQuery->set($hotel->dominioOficial);
		$sqlQuery->set($hotel->telefonoReservas);
		$sqlQuery->set($hotel->dominioCampania);
		$sqlQuery->setNumber($hotel->bookingOnrequest);
		$sqlQuery->setNumber($hotel->idiomaId);
		$sqlQuery->setNumber($hotel->destinoId);
		$sqlQuery->set($hotel->contenidoHtml);
		$sqlQuery->setNumber($hotel->chat);
		$sqlQuery->setNumber($hotel->headerVikahotel);
		$sqlQuery->setNumber($hotel->mostrarHotelesRelacionados);
		$sqlQuery->setNumber($hotel->respetarCupo);
		$sqlQuery->set($hotel->loginCode);
		$sqlQuery->setNumber($hotel->monedaId);
		$sqlQuery->setNumber($hotel->destacado);
		$sqlQuery->set($hotel->adwords);
		$sqlQuery->setNumber($hotel->webOficial);
		$sqlQuery->set($hotel->dominioPrincipal);
		$sqlQuery->set($hotel->emailContacto);
		$sqlQuery->set($hotel->lugares);

		$id = $this->executeInsert($sqlQuery);	
		$hotel->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelMySql hotel
 	 */
	public function update($hotel){
		$sql = 'UPDATE hotel SET nombre = ?, descripcion_corta = ?, descripcion_larga = ?, visitas = ?, estado = ?, capacidad = ?, tiempo_creacion = ?, ultima_modificacion = ?, url = ?, calidad = ?, empresa_id = ?, configuracion_id = ?, trip_advisor = ?, background_color = ?, estancia_minima = ?, venta_anticipada = ?, logo_id = ?, porcentage_cobro_anticipado = ?, informacion_compra = ?, titulo_seo = ?, keywords_seo = ?, tipo_reserva = ?, clave_google_analytics = ?, inicioContrato = ?, finContrato = ?, descuento_booking = ?, tipo_descuento_booking = ?, email_reservas = ?, campania_id = ?, seo = ?, clave = ?, dominio_oficial = ?, telefono_reservas = ?, dominio_campania = ?, booking_onrequest = ?, idioma_id = ?, destino_id = ?, contenido_html = ?, chat = ?, header_vikahotel = ?, mostrar_hoteles_relacionados = ?, respetar_cupo = ?, login_code = ?, moneda_id = ?, destacado = ?, adwords = ?, web_oficial = ?, dominio_principal = ?, email_contacto = ?, lugares = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($hotel->nombre);
		$sqlQuery->set($hotel->descripcionCorta);
		$sqlQuery->set($hotel->descripcionLarga);
		$sqlQuery->setNumber($hotel->visitas);
		$sqlQuery->set($hotel->estado);
		$sqlQuery->setNumber($hotel->capacidad);
		$sqlQuery->set($hotel->tiempoCreacion);
		$sqlQuery->set($hotel->ultimaModificacion);
		$sqlQuery->set($hotel->url);
		$sqlQuery->set($hotel->calidad);
		$sqlQuery->setNumber($hotel->empresaId);
		$sqlQuery->setNumber($hotel->configuracionId);
		$sqlQuery->set($hotel->tripAdvisor);
		$sqlQuery->set($hotel->backgroundColor);
		$sqlQuery->setNumber($hotel->estanciaMinima);
		$sqlQuery->setNumber($hotel->ventaAnticipada);
		$sqlQuery->setNumber($hotel->logoId);
		$sqlQuery->set($hotel->porcentageCobroAnticipado);
		$sqlQuery->set($hotel->informacionCompra);
		$sqlQuery->set($hotel->tituloSeo);
		$sqlQuery->set($hotel->keywordsSeo);
		$sqlQuery->set($hotel->tipoReserva);
		$sqlQuery->set($hotel->claveGoogleAnalytics);
		$sqlQuery->set($hotel->inicioContrato);
		$sqlQuery->set($hotel->finContrato);
		$sqlQuery->set($hotel->descuentoBooking);
		$sqlQuery->set($hotel->tipoDescuentoBooking);
		$sqlQuery->set($hotel->emailReservas);
		$sqlQuery->setNumber($hotel->campaniaId);
		$sqlQuery->setNumber($hotel->seo);
		$sqlQuery->set($hotel->clave);
		$sqlQuery->set($hotel->dominioOficial);
		$sqlQuery->set($hotel->telefonoReservas);
		$sqlQuery->set($hotel->dominioCampania);
		$sqlQuery->setNumber($hotel->bookingOnrequest);
		$sqlQuery->setNumber($hotel->idiomaId);
		$sqlQuery->setNumber($hotel->destinoId);
		$sqlQuery->set($hotel->contenidoHtml);
		$sqlQuery->setNumber($hotel->chat);
		$sqlQuery->setNumber($hotel->headerVikahotel);
		$sqlQuery->setNumber($hotel->mostrarHotelesRelacionados);
		$sqlQuery->setNumber($hotel->respetarCupo);
		$sqlQuery->set($hotel->loginCode);
		$sqlQuery->setNumber($hotel->monedaId);
		$sqlQuery->setNumber($hotel->destacado);
		$sqlQuery->set($hotel->adwords);
		$sqlQuery->setNumber($hotel->webOficial);
		$sqlQuery->set($hotel->dominioPrincipal);
		$sqlQuery->set($hotel->emailContacto);
		$sqlQuery->set($hotel->lugares);

		$sqlQuery->setNumber($hotel->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM hotel';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM hotel WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcionCorta($value){
		$sql = 'SELECT * FROM hotel WHERE descripcion_corta = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcionLarga($value){
		$sql = 'SELECT * FROM hotel WHERE descripcion_larga = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVisitas($value){
		$sql = 'SELECT * FROM hotel WHERE visitas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM hotel WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCapacidad($value){
		$sql = 'SELECT * FROM hotel WHERE capacidad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM hotel WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM hotel WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUrl($value){
		$sql = 'SELECT * FROM hotel WHERE url = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCalidad($value){
		$sql = 'SELECT * FROM hotel WHERE calidad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaId($value){
		$sql = 'SELECT * FROM hotel WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByConfiguracionId($value){
		$sql = 'SELECT * FROM hotel WHERE configuracion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTripAdvisor($value){
		$sql = 'SELECT * FROM hotel WHERE trip_advisor = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByBackgroundColor($value){
		$sql = 'SELECT * FROM hotel WHERE background_color = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstanciaMinima($value){
		$sql = 'SELECT * FROM hotel WHERE estancia_minima = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVentaAnticipada($value){
		$sql = 'SELECT * FROM hotel WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLogoId($value){
		$sql = 'SELECT * FROM hotel WHERE logo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentageCobroAnticipado($value){
		$sql = 'SELECT * FROM hotel WHERE porcentage_cobro_anticipado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInformacionCompra($value){
		$sql = 'SELECT * FROM hotel WHERE informacion_compra = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTituloSeo($value){
		$sql = 'SELECT * FROM hotel WHERE titulo_seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByKeywordsSeo($value){
		$sql = 'SELECT * FROM hotel WHERE keywords_seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoReserva($value){
		$sql = 'SELECT * FROM hotel WHERE tipo_reserva = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByClaveGoogleAnalytics($value){
		$sql = 'SELECT * FROM hotel WHERE clave_google_analytics = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInicioContrato($value){
		$sql = 'SELECT * FROM hotel WHERE inicioContrato = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFinContrato($value){
		$sql = 'SELECT * FROM hotel WHERE finContrato = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescuentoBooking($value){
		$sql = 'SELECT * FROM hotel WHERE descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoDescuentoBooking($value){
		$sql = 'SELECT * FROM hotel WHERE tipo_descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmailReservas($value){
		$sql = 'SELECT * FROM hotel WHERE email_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCampaniaId($value){
		$sql = 'SELECT * FROM hotel WHERE campania_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySeo($value){
		$sql = 'SELECT * FROM hotel WHERE seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByClave($value){
		$sql = 'SELECT * FROM hotel WHERE clave = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDominioOficial($value){
		$sql = 'SELECT * FROM hotel WHERE dominio_oficial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTelefonoReservas($value){
		$sql = 'SELECT * FROM hotel WHERE telefono_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDominioCampania($value){
		$sql = 'SELECT * FROM hotel WHERE dominio_campania = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByBookingOnrequest($value){
		$sql = 'SELECT * FROM hotel WHERE booking_onrequest = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIdiomaId($value){
		$sql = 'SELECT * FROM hotel WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDestinoId($value){
		$sql = 'SELECT * FROM hotel WHERE destino_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContenidoHtml($value){
		$sql = 'SELECT * FROM hotel WHERE contenido_html = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByChat($value){
		$sql = 'SELECT * FROM hotel WHERE chat = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHeaderVikahotel($value){
		$sql = 'SELECT * FROM hotel WHERE header_vikahotel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMostrarHotelesRelacionados($value){
		$sql = 'SELECT * FROM hotel WHERE mostrar_hoteles_relacionados = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByRespetarCupo($value){
		$sql = 'SELECT * FROM hotel WHERE respetar_cupo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLoginCode($value){
		$sql = 'SELECT * FROM hotel WHERE login_code = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM hotel WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDestacado($value){
		$sql = 'SELECT * FROM hotel WHERE destacado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAdwords($value){
		$sql = 'SELECT * FROM hotel WHERE adwords = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByWebOficial($value){
		$sql = 'SELECT * FROM hotel WHERE web_oficial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDominioPrincipal($value){
		$sql = 'SELECT * FROM hotel WHERE dominio_principal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmailContacto($value){
		$sql = 'SELECT * FROM hotel WHERE email_contacto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLugares($value){
		$sql = 'SELECT * FROM hotel WHERE lugares = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM hotel WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcionCorta($value){
		$sql = 'DELETE FROM hotel WHERE descripcion_corta = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcionLarga($value){
		$sql = 'DELETE FROM hotel WHERE descripcion_larga = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVisitas($value){
		$sql = 'DELETE FROM hotel WHERE visitas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM hotel WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCapacidad($value){
		$sql = 'DELETE FROM hotel WHERE capacidad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM hotel WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM hotel WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUrl($value){
		$sql = 'DELETE FROM hotel WHERE url = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCalidad($value){
		$sql = 'DELETE FROM hotel WHERE calidad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaId($value){
		$sql = 'DELETE FROM hotel WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByConfiguracionId($value){
		$sql = 'DELETE FROM hotel WHERE configuracion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTripAdvisor($value){
		$sql = 'DELETE FROM hotel WHERE trip_advisor = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByBackgroundColor($value){
		$sql = 'DELETE FROM hotel WHERE background_color = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstanciaMinima($value){
		$sql = 'DELETE FROM hotel WHERE estancia_minima = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVentaAnticipada($value){
		$sql = 'DELETE FROM hotel WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLogoId($value){
		$sql = 'DELETE FROM hotel WHERE logo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentageCobroAnticipado($value){
		$sql = 'DELETE FROM hotel WHERE porcentage_cobro_anticipado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInformacionCompra($value){
		$sql = 'DELETE FROM hotel WHERE informacion_compra = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTituloSeo($value){
		$sql = 'DELETE FROM hotel WHERE titulo_seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByKeywordsSeo($value){
		$sql = 'DELETE FROM hotel WHERE keywords_seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoReserva($value){
		$sql = 'DELETE FROM hotel WHERE tipo_reserva = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByClaveGoogleAnalytics($value){
		$sql = 'DELETE FROM hotel WHERE clave_google_analytics = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInicioContrato($value){
		$sql = 'DELETE FROM hotel WHERE inicioContrato = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFinContrato($value){
		$sql = 'DELETE FROM hotel WHERE finContrato = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescuentoBooking($value){
		$sql = 'DELETE FROM hotel WHERE descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoDescuentoBooking($value){
		$sql = 'DELETE FROM hotel WHERE tipo_descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmailReservas($value){
		$sql = 'DELETE FROM hotel WHERE email_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCampaniaId($value){
		$sql = 'DELETE FROM hotel WHERE campania_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySeo($value){
		$sql = 'DELETE FROM hotel WHERE seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByClave($value){
		$sql = 'DELETE FROM hotel WHERE clave = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDominioOficial($value){
		$sql = 'DELETE FROM hotel WHERE dominio_oficial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTelefonoReservas($value){
		$sql = 'DELETE FROM hotel WHERE telefono_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDominioCampania($value){
		$sql = 'DELETE FROM hotel WHERE dominio_campania = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByBookingOnrequest($value){
		$sql = 'DELETE FROM hotel WHERE booking_onrequest = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIdiomaId($value){
		$sql = 'DELETE FROM hotel WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDestinoId($value){
		$sql = 'DELETE FROM hotel WHERE destino_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContenidoHtml($value){
		$sql = 'DELETE FROM hotel WHERE contenido_html = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByChat($value){
		$sql = 'DELETE FROM hotel WHERE chat = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHeaderVikahotel($value){
		$sql = 'DELETE FROM hotel WHERE header_vikahotel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMostrarHotelesRelacionados($value){
		$sql = 'DELETE FROM hotel WHERE mostrar_hoteles_relacionados = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByRespetarCupo($value){
		$sql = 'DELETE FROM hotel WHERE respetar_cupo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLoginCode($value){
		$sql = 'DELETE FROM hotel WHERE login_code = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM hotel WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDestacado($value){
		$sql = 'DELETE FROM hotel WHERE destacado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAdwords($value){
		$sql = 'DELETE FROM hotel WHERE adwords = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByWebOficial($value){
		$sql = 'DELETE FROM hotel WHERE web_oficial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDominioPrincipal($value){
		$sql = 'DELETE FROM hotel WHERE dominio_principal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmailContacto($value){
		$sql = 'DELETE FROM hotel WHERE email_contacto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLugares($value){
		$sql = 'DELETE FROM hotel WHERE lugares = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return HotelMySql 
	 */
	protected function readRow($row){
		$hotel = new Hotel();
		
		$hotel->id = $row['id'];
		$hotel->nombre = $row['nombre'];
		$hotel->descripcionCorta = $row['descripcion_corta'];
		$hotel->descripcionLarga = $row['descripcion_larga'];
		$hotel->visitas = $row['visitas'];
		$hotel->estado = $row['estado'];
		$hotel->capacidad = $row['capacidad'];
		$hotel->tiempoCreacion = $row['tiempo_creacion'];
		$hotel->ultimaModificacion = $row['ultima_modificacion'];
		$hotel->url = $row['url'];
		$hotel->calidad = $row['calidad'];
		$hotel->empresaId = $row['empresa_id'];
		$hotel->configuracionId = $row['configuracion_id'];
		$hotel->tripAdvisor = $row['trip_advisor'];
		$hotel->backgroundColor = $row['background_color'];
		$hotel->estanciaMinima = $row['estancia_minima'];
		$hotel->ventaAnticipada = $row['venta_anticipada'];
		$hotel->logoId = $row['logo_id'];
		$hotel->porcentageCobroAnticipado = $row['porcentage_cobro_anticipado'];
		$hotel->informacionCompra = $row['informacion_compra'];
		$hotel->tituloSeo = $row['titulo_seo'];
		$hotel->keywordsSeo = $row['keywords_seo'];
		$hotel->tipoReserva = $row['tipo_reserva'];
		$hotel->claveGoogleAnalytics = $row['clave_google_analytics'];
		$hotel->inicioContrato = $row['inicioContrato'];
		$hotel->finContrato = $row['finContrato'];
		$hotel->descuentoBooking = $row['descuento_booking'];
		$hotel->tipoDescuentoBooking = $row['tipo_descuento_booking'];
		$hotel->emailReservas = $row['email_reservas'];
		$hotel->campaniaId = $row['campania_id'];
		$hotel->seo = $row['seo'];
		$hotel->clave = $row['clave'];
		$hotel->dominioOficial = $row['dominio_oficial'];
		$hotel->telefonoReservas = $row['telefono_reservas'];
		$hotel->dominioCampania = $row['dominio_campania'];
		$hotel->bookingOnrequest = $row['booking_onrequest'];
		$hotel->idiomaId = $row['idioma_id'];
		$hotel->destinoId = $row['destino_id'];
		$hotel->contenidoHtml = $row['contenido_html'];
		$hotel->chat = $row['chat'];
		$hotel->headerVikahotel = $row['header_vikahotel'];
		$hotel->mostrarHotelesRelacionados = $row['mostrar_hoteles_relacionados'];
		$hotel->respetarCupo = $row['respetar_cupo'];
		$hotel->loginCode = $row['login_code'];
		$hotel->monedaId = $row['moneda_id'];
		$hotel->destacado = $row['destacado'];
		$hotel->adwords = $row['adwords'];
		$hotel->webOficial = $row['web_oficial'];
		$hotel->dominioPrincipal = $row['dominio_principal'];
		$hotel->emailContacto = $row['email_contacto'];
		$hotel->lugares = $row['lugares'];

		return $hotel;
	}
	
	protected function getList($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$ret[$i] = $this->readRow($tab[$i]);
		}
		return $ret;
	}
	
	/**
	 * Get row
	 *
	 * @return HotelMySql 
	 */
	protected function getRow($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		if(count($tab)==0){
			return null;
		}
		return $this->readRow($tab[0]);		
	}
	
	/**
	 * Execute sql query
	 */
	protected function execute($sqlQuery){
		return QueryExecutor::execute($sqlQuery);
	}
	
		
	/**
	 * Execute sql query
	 */
	protected function executeUpdate($sqlQuery){
		return QueryExecutor::executeUpdate($sqlQuery);
	}

	/**
	 * Query for one row and one column
	 */
	protected function querySingleResult($sqlQuery){
		return QueryExecutor::queryForString($sqlQuery);
	}

	/**
	 * Insert row to table
	 */
	protected function executeInsert($sqlQuery){
		return QueryExecutor::executeInsert($sqlQuery);
	}
}
?>