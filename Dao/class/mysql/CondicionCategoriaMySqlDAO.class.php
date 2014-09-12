<?php
/**
 * Class that operate on table 'condicion_categoria'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class CondicionCategoriaMySqlDAO implements CondicionCategoriaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return CondicionCategoriaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM condicion_categoria WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM condicion_categoria';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM condicion_categoria ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param condicionCategoria primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM condicion_categoria WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CondicionCategoriaMySql condicionCategoria
 	 */
	public function insert($condicionCategoria){
		$sql = 'INSERT INTO condicion_categoria (nombre) VALUES (?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($condicionCategoria->nombre);

		$id = $this->executeInsert($sqlQuery);	
		$condicionCategoria->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param CondicionCategoriaMySql condicionCategoria
 	 */
	public function update($condicionCategoria){
		$sql = 'UPDATE condicion_categoria SET nombre = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($condicionCategoria->nombre);

		$sqlQuery->setNumber($condicionCategoria->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM condicion_categoria';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM condicion_categoria WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM condicion_categoria WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return CondicionCategoriaMySql 
	 */
	protected function readRow($row){
		$condicionCategoria = new CondicionCategoria();
		
		$condicionCategoria->id = $row['id'];
		$condicionCategoria->nombre = $row['nombre'];

		return $condicionCategoria;
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
	 * @return CondicionCategoriaMySql 
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