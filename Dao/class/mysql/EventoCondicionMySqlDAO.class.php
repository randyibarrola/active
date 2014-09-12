<?php
/**
 * Class that operate on table 'evento_condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class EventoCondicionMySqlDAO implements EventoCondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return EventoCondicionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM evento_condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM evento_condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM evento_condicion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param eventoCondicion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM evento_condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EventoCondicionMySql eventoCondicion
 	 */
	public function insert($eventoCondicion){
		$sql = 'INSERT INTO evento_condicion (evento_id, condicion_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($eventoCondicion->eventoId);
		$sqlQuery->setNumber($eventoCondicion->condicionId);

		$id = $this->executeInsert($sqlQuery);	
		$eventoCondicion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param EventoCondicionMySql eventoCondicion
 	 */
	public function update($eventoCondicion){
		$sql = 'UPDATE evento_condicion SET evento_id = ?, condicion_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($eventoCondicion->eventoId);
		$sqlQuery->setNumber($eventoCondicion->condicionId);

		$sqlQuery->setNumber($eventoCondicion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM evento_condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByEventoId($value){
		$sql = 'SELECT * FROM evento_condicion WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCondicionId($value){
		$sql = 'SELECT * FROM evento_condicion WHERE condicion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByEventoId($value){
		$sql = 'DELETE FROM evento_condicion WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCondicionId($value){
		$sql = 'DELETE FROM evento_condicion WHERE condicion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return EventoCondicionMySql 
	 */
	protected function readRow($row){
		$eventoCondicion = new EventoCondicion();
		
		$eventoCondicion->id = $row['id'];
		$eventoCondicion->eventoId = $row['evento_id'];
		$eventoCondicion->condicionId = $row['condicion_id'];

		return $eventoCondicion;
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
	 * @return EventoCondicionMySql 
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