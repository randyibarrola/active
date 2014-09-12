<?php
/**
 * Class that operate on table 'empresa_tipo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class EmpresaTipoMySqlDAO implements EmpresaTipoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return EmpresaTipoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM empresa_tipo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM empresa_tipo';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM empresa_tipo ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param empresaTipo primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM empresa_tipo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EmpresaTipoMySql empresaTipo
 	 */
	public function insert($empresaTipo){
		$sql = 'INSERT INTO empresa_tipo (tipo) VALUES (?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($empresaTipo->tipo);

		$id = $this->executeInsert($sqlQuery);	
		$empresaTipo->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param EmpresaTipoMySql empresaTipo
 	 */
	public function update($empresaTipo){
		$sql = 'UPDATE empresa_tipo SET tipo = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($empresaTipo->tipo);

		$sqlQuery->setNumber($empresaTipo->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM empresa_tipo';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM empresa_tipo WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByTipo($value){
		$sql = 'DELETE FROM empresa_tipo WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return EmpresaTipoMySql 
	 */
	protected function readRow($row){
		$empresaTipo = new EmpresaTipo();
		
		$empresaTipo->id = $row['id'];
		$empresaTipo->tipo = $row['tipo'];

		return $empresaTipo;
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
	 * @return EmpresaTipoMySql 
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