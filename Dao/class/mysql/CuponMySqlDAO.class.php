<?php
/**
 * Class that operate on table 'cupon'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-27 08:41
 */
class CuponMySqlDAO implements CuponDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return CuponMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM cupon WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM cupon';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM cupon ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param cupon primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM cupon WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CuponMySql cupon
 	 */
	public function insert($cupon){
		$sql = 'INSERT INTO cupon (codigo, estado, reglas_cupones_id) VALUES (?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($cupon->codigo);
		$sqlQuery->set($cupon->estado);
		$sqlQuery->setNumber($cupon->reglasCuponesId);

		$id = $this->executeInsert($sqlQuery);	
		$cupon->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param CuponMySql cupon
 	 */
	public function update($cupon){
		$sql = 'UPDATE cupon SET codigo = ?, estado = ?, reglas_cupones_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($cupon->codigo);
		$sqlQuery->set($cupon->estado);
		$sqlQuery->setNumber($cupon->reglasCuponesId);

		$sqlQuery->setNumber($cupon->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM cupon';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByCodigo($value){
		$sql = 'SELECT * FROM cupon WHERE codigo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM cupon WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByReglasCuponesId($value){
		$sql = 'SELECT * FROM cupon WHERE reglas_cupones_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByCodigo($value){
		$sql = 'DELETE FROM cupon WHERE codigo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM cupon WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByReglasCuponesId($value){
		$sql = 'DELETE FROM cupon WHERE reglas_cupones_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return CuponMySql 
	 */
	protected function readRow($row){
		$cupon = new Cupon();
		
		$cupon->id = $row['id'];
		$cupon->codigo = $row['codigo'];
		$cupon->estado = $row['estado'];
		$cupon->reglasCuponesId = $row['reglas_cupones_id'];

		return $cupon;
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
	 * @return CuponMySql 
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