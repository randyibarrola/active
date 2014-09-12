<?php
/**
 * Class that operate on table 'reserva_pago'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ReservaPagoMySqlDAO implements ReservaPagoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ReservaPagoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM reserva_pago WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM reserva_pago';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM reserva_pago ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param reservaPago primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM reserva_pago WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaPagoMySql reservaPago
 	 */
	public function insert($reservaPago){
		$sql = 'INSERT INTO reserva_pago (forma_pago, autorizacion, request, importe, concepto, estado, tiempo_creacion, ultima_modificacion, origen, validada, comentario, tipo, reserva_id, tarjeta_tipo, caducidad_mes, caducidad_anio, paypal, tarjeta_numero, cvv, moneda_id, titular, op, op_devolucion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($reservaPago->formaPago);
		$sqlQuery->set($reservaPago->autorizacion);
		$sqlQuery->set($reservaPago->request);
		$sqlQuery->set($reservaPago->importe);
		$sqlQuery->set($reservaPago->concepto);
		$sqlQuery->set($reservaPago->estado);
		$sqlQuery->set($reservaPago->tiempoCreacion);
		$sqlQuery->set($reservaPago->ultimaModificacion);
		$sqlQuery->set($reservaPago->origen);
		$sqlQuery->setNumber($reservaPago->validada);
		$sqlQuery->set($reservaPago->comentario);
		$sqlQuery->set($reservaPago->tipo);
		$sqlQuery->setNumber($reservaPago->reservaId);
		$sqlQuery->set($reservaPago->tarjetaTipo);
		$sqlQuery->setNumber($reservaPago->caducidadMes);
		$sqlQuery->setNumber($reservaPago->caducidadAnio);
		$sqlQuery->set($reservaPago->paypal);
		$sqlQuery->set($reservaPago->tarjetaNumero);
		$sqlQuery->set($reservaPago->cvv);
		$sqlQuery->setNumber($reservaPago->monedaId);
		$sqlQuery->set($reservaPago->titular);
		$sqlQuery->set($reservaPago->op);
		$sqlQuery->set($reservaPago->opDevolucion);

		$id = $this->executeInsert($sqlQuery);	
		$reservaPago->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaPagoMySql reservaPago
 	 */
	public function update($reservaPago){
		$sql = 'UPDATE reserva_pago SET forma_pago = ?, autorizacion = ?, request = ?, importe = ?, concepto = ?, estado = ?, tiempo_creacion = ?, ultima_modificacion = ?, origen = ?, validada = ?, comentario = ?, tipo = ?, reserva_id = ?, tarjeta_tipo = ?, caducidad_mes = ?, caducidad_anio = ?, paypal = ?, tarjeta_numero = ?, cvv = ?, moneda_id = ?, titular = ?, op = ?, op_devolucion = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($reservaPago->formaPago);
		$sqlQuery->set($reservaPago->autorizacion);
		$sqlQuery->set($reservaPago->request);
		$sqlQuery->set($reservaPago->importe);
		$sqlQuery->set($reservaPago->concepto);
		$sqlQuery->set($reservaPago->estado);
		$sqlQuery->set($reservaPago->tiempoCreacion);
		$sqlQuery->set($reservaPago->ultimaModificacion);
		$sqlQuery->set($reservaPago->origen);
		$sqlQuery->setNumber($reservaPago->validada);
		$sqlQuery->set($reservaPago->comentario);
		$sqlQuery->set($reservaPago->tipo);
		$sqlQuery->setNumber($reservaPago->reservaId);
		$sqlQuery->set($reservaPago->tarjetaTipo);
		$sqlQuery->setNumber($reservaPago->caducidadMes);
		$sqlQuery->setNumber($reservaPago->caducidadAnio);
		$sqlQuery->set($reservaPago->paypal);
		$sqlQuery->set($reservaPago->tarjetaNumero);
		$sqlQuery->set($reservaPago->cvv);
		$sqlQuery->setNumber($reservaPago->monedaId);
		$sqlQuery->set($reservaPago->titular);
		$sqlQuery->set($reservaPago->op);
		$sqlQuery->set($reservaPago->opDevolucion);

		$sqlQuery->setNumber($reservaPago->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM reserva_pago';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByFormaPago($value){
		$sql = 'SELECT * FROM reserva_pago WHERE forma_pago = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAutorizacion($value){
		$sql = 'SELECT * FROM reserva_pago WHERE autorizacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByRequest($value){
		$sql = 'SELECT * FROM reserva_pago WHERE request = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByImporte($value){
		$sql = 'SELECT * FROM reserva_pago WHERE importe = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByConcepto($value){
		$sql = 'SELECT * FROM reserva_pago WHERE concepto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM reserva_pago WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM reserva_pago WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM reserva_pago WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByOrigen($value){
		$sql = 'SELECT * FROM reserva_pago WHERE origen = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByValidada($value){
		$sql = 'SELECT * FROM reserva_pago WHERE validada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByComentario($value){
		$sql = 'SELECT * FROM reserva_pago WHERE comentario = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM reserva_pago WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByReservaId($value){
		$sql = 'SELECT * FROM reserva_pago WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTarjetaTipo($value){
		$sql = 'SELECT * FROM reserva_pago WHERE tarjeta_tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCaducidadMes($value){
		$sql = 'SELECT * FROM reserva_pago WHERE caducidad_mes = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCaducidadAnio($value){
		$sql = 'SELECT * FROM reserva_pago WHERE caducidad_anio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPaypal($value){
		$sql = 'SELECT * FROM reserva_pago WHERE paypal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTarjetaNumero($value){
		$sql = 'SELECT * FROM reserva_pago WHERE tarjeta_numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCvv($value){
		$sql = 'SELECT * FROM reserva_pago WHERE cvv = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM reserva_pago WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTitular($value){
		$sql = 'SELECT * FROM reserva_pago WHERE titular = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByOp($value){
		$sql = 'SELECT * FROM reserva_pago WHERE op = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByOpDevolucion($value){
		$sql = 'SELECT * FROM reserva_pago WHERE op_devolucion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByFormaPago($value){
		$sql = 'DELETE FROM reserva_pago WHERE forma_pago = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAutorizacion($value){
		$sql = 'DELETE FROM reserva_pago WHERE autorizacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByRequest($value){
		$sql = 'DELETE FROM reserva_pago WHERE request = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByImporte($value){
		$sql = 'DELETE FROM reserva_pago WHERE importe = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByConcepto($value){
		$sql = 'DELETE FROM reserva_pago WHERE concepto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM reserva_pago WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM reserva_pago WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM reserva_pago WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByOrigen($value){
		$sql = 'DELETE FROM reserva_pago WHERE origen = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByValidada($value){
		$sql = 'DELETE FROM reserva_pago WHERE validada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByComentario($value){
		$sql = 'DELETE FROM reserva_pago WHERE comentario = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM reserva_pago WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByReservaId($value){
		$sql = 'DELETE FROM reserva_pago WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTarjetaTipo($value){
		$sql = 'DELETE FROM reserva_pago WHERE tarjeta_tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCaducidadMes($value){
		$sql = 'DELETE FROM reserva_pago WHERE caducidad_mes = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCaducidadAnio($value){
		$sql = 'DELETE FROM reserva_pago WHERE caducidad_anio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPaypal($value){
		$sql = 'DELETE FROM reserva_pago WHERE paypal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTarjetaNumero($value){
		$sql = 'DELETE FROM reserva_pago WHERE tarjeta_numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCvv($value){
		$sql = 'DELETE FROM reserva_pago WHERE cvv = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM reserva_pago WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTitular($value){
		$sql = 'DELETE FROM reserva_pago WHERE titular = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByOp($value){
		$sql = 'DELETE FROM reserva_pago WHERE op = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByOpDevolucion($value){
		$sql = 'DELETE FROM reserva_pago WHERE op_devolucion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ReservaPagoMySql 
	 */
	protected function readRow($row){
		$reservaPago = new ReservaPago();
		
		$reservaPago->id = $row['id'];
		$reservaPago->formaPago = $row['forma_pago'];
		$reservaPago->autorizacion = $row['autorizacion'];
		$reservaPago->request = $row['request'];
		$reservaPago->importe = $row['importe'];
		$reservaPago->concepto = $row['concepto'];
		$reservaPago->estado = $row['estado'];
		$reservaPago->tiempoCreacion = $row['tiempo_creacion'];
		$reservaPago->ultimaModificacion = $row['ultima_modificacion'];
		$reservaPago->origen = $row['origen'];
		$reservaPago->validada = $row['validada'];
		$reservaPago->comentario = $row['comentario'];
		$reservaPago->tipo = $row['tipo'];
		$reservaPago->reservaId = $row['reserva_id'];
		$reservaPago->tarjetaTipo = $row['tarjeta_tipo'];
		$reservaPago->caducidadMes = $row['caducidad_mes'];
		$reservaPago->caducidadAnio = $row['caducidad_anio'];
		$reservaPago->paypal = $row['paypal'];
		$reservaPago->tarjetaNumero = $row['tarjeta_numero'];
		$reservaPago->cvv = $row['cvv'];
		$reservaPago->monedaId = $row['moneda_id'];
		$reservaPago->titular = $row['titular'];
		$reservaPago->op = $row['op'];
		$reservaPago->opDevolucion = $row['op_devolucion'];

		return $reservaPago;
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
	 * @return ReservaPagoMySql 
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