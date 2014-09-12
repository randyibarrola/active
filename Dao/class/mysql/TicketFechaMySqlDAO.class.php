<?php
/**
 * Class that operate on table 'ticket_fecha'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class TicketFechaMySqlDAO implements TicketFechaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return TicketFechaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM ticket_fecha WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM ticket_fecha';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM ticket_fecha ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param ticketFecha primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM ticket_fecha WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param TicketFechaMySql ticketFecha
 	 */
	public function insert($ticketFecha){
		$sql = 'INSERT INTO ticket_fecha (fecha, ticket_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($ticketFecha->fecha);
		$sqlQuery->setNumber($ticketFecha->ticketId);

		$id = $this->executeInsert($sqlQuery);	
		$ticketFecha->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param TicketFechaMySql ticketFecha
 	 */
	public function update($ticketFecha){
		$sql = 'UPDATE ticket_fecha SET fecha = ?, ticket_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($ticketFecha->fecha);
		$sqlQuery->setNumber($ticketFecha->ticketId);

		$sqlQuery->setNumber($ticketFecha->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM ticket_fecha';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByFecha($value){
		$sql = 'SELECT * FROM ticket_fecha WHERE fecha = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTicketId($value){
		$sql = 'SELECT * FROM ticket_fecha WHERE ticket_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByFecha($value){
		$sql = 'DELETE FROM ticket_fecha WHERE fecha = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTicketId($value){
		$sql = 'DELETE FROM ticket_fecha WHERE ticket_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return TicketFechaMySql 
	 */
	protected function readRow($row){
		$ticketFecha = new TicketFecha();
		
		$ticketFecha->id = $row['id'];
		$ticketFecha->fecha = $row['fecha'];
		$ticketFecha->ticketId = $row['ticket_id'];

		return $ticketFecha;
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
	 * @return TicketFechaMySql 
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