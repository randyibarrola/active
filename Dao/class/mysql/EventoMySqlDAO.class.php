<?php
/**
 * Class that operate on table 'evento'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class EventoMySqlDAO implements EventoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return EventoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM evento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM evento';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM evento ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param evento primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM evento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EventoMySql evento
 	 */
	public function insert($evento){
		$sql = 'INSERT INTO evento (nombre, moneda_id, direccion_id, campania_id, descripcion_breve, descripcion_extendida, sugerencias_tpv, instrucciones_consumo, youtube, titulo_seo, venta_anticipada, porcentaje_comision, tipo_reserva, porcentaje_cobro_anticipado, booking_onrequest, email_reservas, telefono_reservas, transfer, guias, destino_turistico_id, duracion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($evento->nombre);
		$sqlQuery->setNumber($evento->monedaId);
		$sqlQuery->setNumber($evento->direccionId);
		$sqlQuery->setNumber($evento->campaniaId);
		$sqlQuery->set($evento->descripcionBreve);
		$sqlQuery->set($evento->descripcionExtendida);
		$sqlQuery->set($evento->sugerenciasTpv);
		$sqlQuery->set($evento->instruccionesConsumo);
		$sqlQuery->set($evento->youtube);
		$sqlQuery->set($evento->tituloSeo);
		$sqlQuery->setNumber($evento->ventaAnticipada);
		$sqlQuery->set($evento->porcentajeComision);
		$sqlQuery->set($evento->tipoReserva);
		$sqlQuery->set($evento->porcentajeCobroAnticipado);
		$sqlQuery->setNumber($evento->bookingOnrequest);
		$sqlQuery->set($evento->emailReservas);
		$sqlQuery->set($evento->telefonoReservas);
		$sqlQuery->setNumber($evento->transfer);
		$sqlQuery->set($evento->guias);
		$sqlQuery->setNumber($evento->destinoTuristicoId);
		$sqlQuery->set($evento->duracion);

		$id = $this->executeInsert($sqlQuery);	
		$evento->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param EventoMySql evento
 	 */
	public function update($evento){
		$sql = 'UPDATE evento SET nombre = ?, moneda_id = ?, direccion_id = ?, campania_id = ?, descripcion_breve = ?, descripcion_extendida = ?, sugerencias_tpv = ?, instrucciones_consumo = ?, youtube = ?, titulo_seo = ?, venta_anticipada = ?, porcentaje_comision = ?, tipo_reserva = ?, porcentaje_cobro_anticipado = ?, booking_onrequest = ?, email_reservas = ?, telefono_reservas = ?, transfer = ?, guias = ?, destino_turistico_id = ?, duracion = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($evento->nombre);
		$sqlQuery->setNumber($evento->monedaId);
		$sqlQuery->setNumber($evento->direccionId);
		$sqlQuery->setNumber($evento->campaniaId);
		$sqlQuery->set($evento->descripcionBreve);
		$sqlQuery->set($evento->descripcionExtendida);
		$sqlQuery->set($evento->sugerenciasTpv);
		$sqlQuery->set($evento->instruccionesConsumo);
		$sqlQuery->set($evento->youtube);
		$sqlQuery->set($evento->tituloSeo);
		$sqlQuery->setNumber($evento->ventaAnticipada);
		$sqlQuery->set($evento->porcentajeComision);
		$sqlQuery->set($evento->tipoReserva);
		$sqlQuery->set($evento->porcentajeCobroAnticipado);
		$sqlQuery->setNumber($evento->bookingOnrequest);
		$sqlQuery->set($evento->emailReservas);
		$sqlQuery->set($evento->telefonoReservas);
		$sqlQuery->setNumber($evento->transfer);
		$sqlQuery->set($evento->guias);
		$sqlQuery->setNumber($evento->destinoTuristicoId);
		$sqlQuery->set($evento->duracion);

		$sqlQuery->setNumber($evento->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM evento';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM evento WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM evento WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDireccionId($value){
		$sql = 'SELECT * FROM evento WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCampaniaId($value){
		$sql = 'SELECT * FROM evento WHERE campania_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcionBreve($value){
		$sql = 'SELECT * FROM evento WHERE descripcion_breve = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcionExtendida($value){
		$sql = 'SELECT * FROM evento WHERE descripcion_extendida = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySugerenciasTpv($value){
		$sql = 'SELECT * FROM evento WHERE sugerencias_tpv = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInstruccionesConsumo($value){
		$sql = 'SELECT * FROM evento WHERE instrucciones_consumo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByYoutube($value){
		$sql = 'SELECT * FROM evento WHERE youtube = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTituloSeo($value){
		$sql = 'SELECT * FROM evento WHERE titulo_seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVentaAnticipada($value){
		$sql = 'SELECT * FROM evento WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentajeComision($value){
		$sql = 'SELECT * FROM evento WHERE porcentaje_comision = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoReserva($value){
		$sql = 'SELECT * FROM evento WHERE tipo_reserva = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentajeCobroAnticipado($value){
		$sql = 'SELECT * FROM evento WHERE porcentaje_cobro_anticipado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByBookingOnrequest($value){
		$sql = 'SELECT * FROM evento WHERE booking_onrequest = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmailReservas($value){
		$sql = 'SELECT * FROM evento WHERE email_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTelefonoReservas($value){
		$sql = 'SELECT * FROM evento WHERE telefono_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTransfer($value){
		$sql = 'SELECT * FROM evento WHERE transfer = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByGuias($value){
		$sql = 'SELECT * FROM evento WHERE guias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDestinoTuristicoId($value){
		$sql = 'SELECT * FROM evento WHERE destino_turistico_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDuracion($value){
		$sql = 'SELECT * FROM evento WHERE duracion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM evento WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM evento WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDireccionId($value){
		$sql = 'DELETE FROM evento WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCampaniaId($value){
		$sql = 'DELETE FROM evento WHERE campania_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcionBreve($value){
		$sql = 'DELETE FROM evento WHERE descripcion_breve = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcionExtendida($value){
		$sql = 'DELETE FROM evento WHERE descripcion_extendida = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySugerenciasTpv($value){
		$sql = 'DELETE FROM evento WHERE sugerencias_tpv = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInstruccionesConsumo($value){
		$sql = 'DELETE FROM evento WHERE instrucciones_consumo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByYoutube($value){
		$sql = 'DELETE FROM evento WHERE youtube = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTituloSeo($value){
		$sql = 'DELETE FROM evento WHERE titulo_seo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVentaAnticipada($value){
		$sql = 'DELETE FROM evento WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentajeComision($value){
		$sql = 'DELETE FROM evento WHERE porcentaje_comision = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoReserva($value){
		$sql = 'DELETE FROM evento WHERE tipo_reserva = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentajeCobroAnticipado($value){
		$sql = 'DELETE FROM evento WHERE porcentaje_cobro_anticipado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByBookingOnrequest($value){
		$sql = 'DELETE FROM evento WHERE booking_onrequest = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmailReservas($value){
		$sql = 'DELETE FROM evento WHERE email_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTelefonoReservas($value){
		$sql = 'DELETE FROM evento WHERE telefono_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTransfer($value){
		$sql = 'DELETE FROM evento WHERE transfer = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByGuias($value){
		$sql = 'DELETE FROM evento WHERE guias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDestinoTuristicoId($value){
		$sql = 'DELETE FROM evento WHERE destino_turistico_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDuracion($value){
		$sql = 'DELETE FROM evento WHERE duracion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return EventoMySql 
	 */
	protected function readRow($row){
		$evento = new Evento();
		
		$evento->id = $row['id'];
		$evento->nombre = $row['nombre'];
		$evento->monedaId = $row['moneda_id'];
		$evento->direccionId = $row['direccion_id'];
		$evento->campaniaId = $row['campania_id'];
		$evento->descripcionBreve = $row['descripcion_breve'];
		$evento->descripcionExtendida = $row['descripcion_extendida'];
		$evento->sugerenciasTpv = $row['sugerencias_tpv'];
		$evento->instruccionesConsumo = $row['instrucciones_consumo'];
		$evento->youtube = $row['youtube'];
		$evento->tituloSeo = $row['titulo_seo'];
		$evento->ventaAnticipada = $row['venta_anticipada'];
		$evento->porcentajeComision = $row['porcentaje_comision'];
		$evento->tipoReserva = $row['tipo_reserva'];
		$evento->porcentajeCobroAnticipado = $row['porcentaje_cobro_anticipado'];
		$evento->bookingOnrequest = $row['booking_onrequest'];
		$evento->emailReservas = $row['email_reservas'];
		$evento->telefonoReservas = $row['telefono_reservas'];
		$evento->transfer = $row['transfer'];
		$evento->guias = $row['guias'];
		$evento->destinoTuristicoId = $row['destino_turistico_id'];
		$evento->duracion = $row['duracion'];

		return $evento;
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
	 * @return EventoMySql 
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