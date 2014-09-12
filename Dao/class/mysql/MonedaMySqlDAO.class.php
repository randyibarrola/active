<?php
/**
 * Class that operate on table 'moneda'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class MonedaMySqlDAO implements MonedaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return MonedaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM moneda WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM moneda';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM moneda ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param moneda primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM moneda WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param MonedaMySql moneda
 	 */
	public function insert($moneda){
		$sql = 'INSERT INTO moneda (nombre, simbolo, codigo, tasa_cambio, ultima_modificacion) VALUES (?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($moneda->nombre);
		$sqlQuery->set($moneda->simbolo);
		$sqlQuery->set($moneda->codigo);
		$sqlQuery->set($moneda->tasaCambio);
		$sqlQuery->set($moneda->ultimaModificacion);

		$id = $this->executeInsert($sqlQuery);	
		$moneda->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param MonedaMySql moneda
 	 */
	public function update($moneda){
		$sql = 'UPDATE moneda SET nombre = ?, simbolo = ?, codigo = ?, tasa_cambio = ?, ultima_modificacion = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($moneda->nombre);
		$sqlQuery->set($moneda->simbolo);
		$sqlQuery->set($moneda->codigo);
		$sqlQuery->set($moneda->tasaCambio);
		$sqlQuery->set($moneda->ultimaModificacion);

		$sqlQuery->setNumber($moneda->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM moneda';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM moneda WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySimbolo($value){
		$sql = 'SELECT * FROM moneda WHERE simbolo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCodigo($value){
		$sql = 'SELECT * FROM moneda WHERE codigo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTasaCambio($value){
		$sql = 'SELECT * FROM moneda WHERE tasa_cambio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM moneda WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM moneda WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySimbolo($value){
		$sql = 'DELETE FROM moneda WHERE simbolo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCodigo($value){
		$sql = 'DELETE FROM moneda WHERE codigo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTasaCambio($value){
		$sql = 'DELETE FROM moneda WHERE tasa_cambio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM moneda WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return MonedaMySql 
	 */
	protected function readRow($row){
		$moneda = new Moneda();
		
		$moneda->id = $row['id'];
		$moneda->nombre = $row['nombre'];
		$moneda->simbolo = $row['simbolo'];
		$moneda->codigo = $row['codigo'];
		$moneda->tasaCambio = $row['tasa_cambio'];
		$moneda->ultimaModificacion = $row['ultima_modificacion'];

		return $moneda;
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
	 * @return MonedaMySql 
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