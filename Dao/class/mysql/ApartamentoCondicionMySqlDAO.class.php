<?php
/**
 * Class that operate on table 'apartamento_condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ApartamentoCondicionMySqlDAO implements ApartamentoCondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ApartamentoCondicionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM apartamento_condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM apartamento_condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM apartamento_condicion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param apartamentoCondicion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM apartamento_condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoCondicionMySql apartamentoCondicion
 	 */
	public function insert($apartamentoCondicion){
		$sql = 'INSERT INTO apartamento_condicion (apartamento_id, condicion_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($apartamentoCondicion->apartamentoId);
		$sqlQuery->setNumber($apartamentoCondicion->condicionId);

		$id = $this->executeInsert($sqlQuery);	
		$apartamentoCondicion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoCondicionMySql apartamentoCondicion
 	 */
	public function update($apartamentoCondicion){
		$sql = 'UPDATE apartamento_condicion SET apartamento_id = ?, condicion_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($apartamentoCondicion->apartamentoId);
		$sqlQuery->setNumber($apartamentoCondicion->condicionId);

		$sqlQuery->setNumber($apartamentoCondicion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM apartamento_condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByApartamentoId($value){
		$sql = 'SELECT * FROM apartamento_condicion WHERE apartamento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCondicionId($value){
		$sql = 'SELECT * FROM apartamento_condicion WHERE condicion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByApartamentoId($value){
		$sql = 'DELETE FROM apartamento_condicion WHERE apartamento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCondicionId($value){
		$sql = 'DELETE FROM apartamento_condicion WHERE condicion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ApartamentoCondicionMySql 
	 */
	protected function readRow($row){
		$apartamentoCondicion = new ApartamentoCondicion();
		
		$apartamentoCondicion->apartamentoId = $row['apartamento_id'];
		$apartamentoCondicion->condicionId = $row['condicion_id'];
		$apartamentoCondicion->id = $row['id'];

		return $apartamentoCondicion;
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
	 * @return ApartamentoCondicionMySql 
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