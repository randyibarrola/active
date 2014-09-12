<?php
/**
 * Class that operate on table 'factura_reserva'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class FacturaReservaMySqlDAO implements FacturaReservaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return FacturaReservaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM factura_reserva WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM factura_reserva';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM factura_reserva ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param facturaReserva primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM factura_reserva WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param FacturaReservaMySql facturaReserva
 	 */
	public function insert($facturaReserva){
		$sql = 'INSERT INTO factura_reserva (factura_id, reserva_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($facturaReserva->facturaId);
		$sqlQuery->setNumber($facturaReserva->reservaId);

		$id = $this->executeInsert($sqlQuery);	
		$facturaReserva->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param FacturaReservaMySql facturaReserva
 	 */
	public function update($facturaReserva){
		$sql = 'UPDATE factura_reserva SET factura_id = ?, reserva_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($facturaReserva->facturaId);
		$sqlQuery->setNumber($facturaReserva->reservaId);

		$sqlQuery->setNumber($facturaReserva->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM factura_reserva';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByFacturaId($value){
		$sql = 'SELECT * FROM factura_reserva WHERE factura_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByReservaId($value){
		$sql = 'SELECT * FROM factura_reserva WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByFacturaId($value){
		$sql = 'DELETE FROM factura_reserva WHERE factura_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByReservaId($value){
		$sql = 'DELETE FROM factura_reserva WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return FacturaReservaMySql 
	 */
	protected function readRow($row){
		$facturaReserva = new FacturaReserva();
		
		$facturaReserva->id = $row['id'];
		$facturaReserva->facturaId = $row['factura_id'];
		$facturaReserva->reservaId = $row['reserva_id'];

		return $facturaReserva;
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
	 * @return FacturaReservaMySql 
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