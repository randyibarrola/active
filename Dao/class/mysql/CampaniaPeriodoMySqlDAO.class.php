<?php
/**
 * Class that operate on table 'campania_periodo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class CampaniaPeriodoMySqlDAO implements CampaniaPeriodoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return CampaniaPeriodoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM campania_periodo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM campania_periodo';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM campania_periodo ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param campaniaPeriodo primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM campania_periodo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CampaniaPeriodoMySql campaniaPeriodo
 	 */
	public function insert($campaniaPeriodo){
		$sql = 'INSERT INTO campania_periodo (inicio, fin, estancia_minima, venta_anticipada, descuento_booking, tipo_descuento, campania_id) VALUES (?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($campaniaPeriodo->inicio);
		$sqlQuery->set($campaniaPeriodo->fin);
		$sqlQuery->setNumber($campaniaPeriodo->estanciaMinima);
		$sqlQuery->setNumber($campaniaPeriodo->ventaAnticipada);
		$sqlQuery->set($campaniaPeriodo->descuentoBooking);
		$sqlQuery->set($campaniaPeriodo->tipoDescuento);
		$sqlQuery->setNumber($campaniaPeriodo->campaniaId);

		$id = $this->executeInsert($sqlQuery);	
		$campaniaPeriodo->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param CampaniaPeriodoMySql campaniaPeriodo
 	 */
	public function update($campaniaPeriodo){
		$sql = 'UPDATE campania_periodo SET inicio = ?, fin = ?, estancia_minima = ?, venta_anticipada = ?, descuento_booking = ?, tipo_descuento = ?, campania_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($campaniaPeriodo->inicio);
		$sqlQuery->set($campaniaPeriodo->fin);
		$sqlQuery->setNumber($campaniaPeriodo->estanciaMinima);
		$sqlQuery->setNumber($campaniaPeriodo->ventaAnticipada);
		$sqlQuery->set($campaniaPeriodo->descuentoBooking);
		$sqlQuery->set($campaniaPeriodo->tipoDescuento);
		$sqlQuery->setNumber($campaniaPeriodo->campaniaId);

		$sqlQuery->setNumber($campaniaPeriodo->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM campania_periodo';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM campania_periodo WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFin($value){
		$sql = 'SELECT * FROM campania_periodo WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstanciaMinima($value){
		$sql = 'SELECT * FROM campania_periodo WHERE estancia_minima = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVentaAnticipada($value){
		$sql = 'SELECT * FROM campania_periodo WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescuentoBooking($value){
		$sql = 'SELECT * FROM campania_periodo WHERE descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoDescuento($value){
		$sql = 'SELECT * FROM campania_periodo WHERE tipo_descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCampaniaId($value){
		$sql = 'SELECT * FROM campania_periodo WHERE campania_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByInicio($value){
		$sql = 'DELETE FROM campania_periodo WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFin($value){
		$sql = 'DELETE FROM campania_periodo WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstanciaMinima($value){
		$sql = 'DELETE FROM campania_periodo WHERE estancia_minima = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVentaAnticipada($value){
		$sql = 'DELETE FROM campania_periodo WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescuentoBooking($value){
		$sql = 'DELETE FROM campania_periodo WHERE descuento_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoDescuento($value){
		$sql = 'DELETE FROM campania_periodo WHERE tipo_descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCampaniaId($value){
		$sql = 'DELETE FROM campania_periodo WHERE campania_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return CampaniaPeriodoMySql 
	 */
	protected function readRow($row){
		$campaniaPeriodo = new CampaniaPeriodo();
		
		$campaniaPeriodo->id = $row['id'];
		$campaniaPeriodo->inicio = $row['inicio'];
		$campaniaPeriodo->fin = $row['fin'];
		$campaniaPeriodo->estanciaMinima = $row['estancia_minima'];
		$campaniaPeriodo->ventaAnticipada = $row['venta_anticipada'];
		$campaniaPeriodo->descuentoBooking = $row['descuento_booking'];
		$campaniaPeriodo->tipoDescuento = $row['tipo_descuento'];
		$campaniaPeriodo->campaniaId = $row['campania_id'];

		return $campaniaPeriodo;
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
	 * @return CampaniaPeriodoMySql 
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