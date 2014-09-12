<?php
/**
 * Class that operate on table 'afiliado_evento'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AfiliadoEventoMySqlDAO implements AfiliadoEventoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AfiliadoEventoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM afiliado_evento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM afiliado_evento';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM afiliado_evento ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param afiliadoEvento primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM afiliado_evento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoEventoMySql afiliadoEvento
 	 */
	public function insert($afiliadoEvento){
		$sql = 'INSERT INTO afiliado_evento (afiliado_id, evento_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliadoEvento->afiliadoId);
		$sqlQuery->setNumber($afiliadoEvento->eventoId);

		$id = $this->executeInsert($sqlQuery);	
		$afiliadoEvento->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoEventoMySql afiliadoEvento
 	 */
	public function update($afiliadoEvento){
		$sql = 'UPDATE afiliado_evento SET afiliado_id = ?, evento_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliadoEvento->afiliadoId);
		$sqlQuery->setNumber($afiliadoEvento->eventoId);

		$sqlQuery->setNumber($afiliadoEvento->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM afiliado_evento';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByAfiliadoId($value){
		$sql = 'SELECT * FROM afiliado_evento WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEventoId($value){
		$sql = 'SELECT * FROM afiliado_evento WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByAfiliadoId($value){
		$sql = 'DELETE FROM afiliado_evento WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEventoId($value){
		$sql = 'DELETE FROM afiliado_evento WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AfiliadoEventoMySql 
	 */
	protected function readRow($row){
		$afiliadoEvento = new AfiliadoEvento();
		
		$afiliadoEvento->id = $row['id'];
		$afiliadoEvento->afiliadoId = $row['afiliado_id'];
		$afiliadoEvento->eventoId = $row['evento_id'];

		return $afiliadoEvento;
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
	 * @return AfiliadoEventoMySql 
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