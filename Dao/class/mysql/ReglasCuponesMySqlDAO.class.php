<?php
/**
 * Class that operate on table 'reglas_cupones'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ReglasCuponesMySqlDAO implements ReglasCuponesDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ReglasCuponesMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM reglas_cupones WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM reglas_cupones';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM reglas_cupones ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param reglasCupone primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM reglas_cupones WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReglasCuponesMySql reglasCupone
 	 */
	public function insert($reglasCupone){
		$sql = 'INSERT INTO reglas_cupones (configuracion_id, monto, descuento, tipo_descuento) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($reglasCupone->configuracionId);
		$sqlQuery->set($reglasCupone->monto);
		$sqlQuery->set($reglasCupone->descuento);
		$sqlQuery->set($reglasCupone->tipoDescuento);

		$id = $this->executeInsert($sqlQuery);	
		$reglasCupone->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReglasCuponesMySql reglasCupone
 	 */
	public function update($reglasCupone){
		$sql = 'UPDATE reglas_cupones SET configuracion_id = ?, monto = ?, descuento = ?, tipo_descuento = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($reglasCupone->configuracionId);
		$sqlQuery->set($reglasCupone->monto);
		$sqlQuery->set($reglasCupone->descuento);
		$sqlQuery->set($reglasCupone->tipoDescuento);

		$sqlQuery->setNumber($reglasCupone->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM reglas_cupones';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByConfiguracionId($value){
		$sql = 'SELECT * FROM reglas_cupones WHERE configuracion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonto($value){
		$sql = 'SELECT * FROM reglas_cupones WHERE monto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescuento($value){
		$sql = 'SELECT * FROM reglas_cupones WHERE descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoDescuento($value){
		$sql = 'SELECT * FROM reglas_cupones WHERE tipo_descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByConfiguracionId($value){
		$sql = 'DELETE FROM reglas_cupones WHERE configuracion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonto($value){
		$sql = 'DELETE FROM reglas_cupones WHERE monto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescuento($value){
		$sql = 'DELETE FROM reglas_cupones WHERE descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoDescuento($value){
		$sql = 'DELETE FROM reglas_cupones WHERE tipo_descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ReglasCuponesMySql 
	 */
	protected function readRow($row){
		$reglasCupone = new ReglasCupone();
		
		$reglasCupone->id = $row['id'];
		$reglasCupone->configuracionId = $row['configuracion_id'];
		$reglasCupone->monto = $row['monto'];
		$reglasCupone->descuento = $row['descuento'];
		$reglasCupone->tipoDescuento = $row['tipo_descuento'];

		return $reglasCupone;
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
	 * @return ReglasCuponesMySql 
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