<?php
/**
 * Class that operate on table 'promocion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class PromocionMySqlDAO implements PromocionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return PromocionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM promocion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM promocion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM promocion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param promocion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM promocion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param PromocionMySql promocion
 	 */
	public function insert($promocion){
		$sql = 'INSERT INTO promocion (inicio, fin, descuento_booking, tipo_descuento_booking, hotel_id, palabras, condicion_pago_online, pago_online) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($promocion->inicio);
		$sqlQuery->set($promocion->fin);
		$sqlQuery->set($promocion->descuentoBooking);
		$sqlQuery->set($promocion->tipoDescuentoBooking);
		$sqlQuery->setNumber($promocion->hotelId);
		$sqlQuery->set($promocion->palabras);
		$sqlQuery->setNumber($promocion->condicionPagoOnline);
		$sqlQuery->set($promocion->pagoOnline);

		$id = $this->executeInsert($sqlQuery);	
		$promocion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param PromocionMySql promocion
 	 */
	public function update($promocion){
		$sql = 'UPDATE promocion SET inicio = ?, fin = ?, descuento_booking = ?, tipo_descuento_booking = ?, hotel_id = ?, palabras = ?, condicion_pago_online = ?, pago_online = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($promocion->inicio);
		$sqlQuery->set($promocion->fin);
		$sqlQuery->set($promocion->descuentoBooking);
		$sqlQuery->set($promocion->tipoDescuentoBooking);
		$sqlQuery->setNumber($promocion->hotelId);
		$sqlQuery->set($promocion->palabras);
		$sqlQuery->setNumber($promocion->condicionPagoOnline);
		$sqlQuery->set($promocion->pagoOnline);

		$sqlQuery->setNumber($promocion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM promocion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM promocion WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFin($value){
		$sql = 'SELECT * FROM promocion WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescuentoBooking($value){
		$sql = 'SELECT * FROM promocion WHERE descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoDescuentoBooking($value){
		$sql = 'SELECT * FROM promocion WHERE tipo_descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM promocion WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPalabras($value){
		$sql = 'SELECT * FROM promocion WHERE palabras = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCondicionPagoOnline($value){
		$sql = 'SELECT * FROM promocion WHERE condicion_pago_online = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPagoOnline($value){
		$sql = 'SELECT * FROM promocion WHERE pago_online = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByInicio($value){
		$sql = 'DELETE FROM promocion WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFin($value){
		$sql = 'DELETE FROM promocion WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescuentoBooking($value){
		$sql = 'DELETE FROM promocion WHERE descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoDescuentoBooking($value){
		$sql = 'DELETE FROM promocion WHERE tipo_descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM promocion WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPalabras($value){
		$sql = 'DELETE FROM promocion WHERE palabras = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCondicionPagoOnline($value){
		$sql = 'DELETE FROM promocion WHERE condicion_pago_online = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPagoOnline($value){
		$sql = 'DELETE FROM promocion WHERE pago_online = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return PromocionMySql 
	 */
	protected function readRow($row){
		$promocion = new Promocion();
		
		$promocion->id = $row['id'];
		$promocion->inicio = $row['inicio'];
		$promocion->fin = $row['fin'];
		$promocion->descuentoBooking = $row['descuento_booking'];
		$promocion->tipoDescuentoBooking = $row['tipo_descuento_booking'];
		$promocion->hotelId = $row['hotel_id'];
		$promocion->palabras = $row['palabras'];
		$promocion->condicionPagoOnline = $row['condicion_pago_online'];
		$promocion->pagoOnline = $row['pago_online'];

		return $promocion;
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
	 * @return PromocionMySql 
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