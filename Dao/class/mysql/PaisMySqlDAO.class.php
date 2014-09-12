<?php
/**
 * Class that operate on table 'pais'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class PaisMySqlDAO implements PaisDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return PaisMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM pais WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM pais';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM pais ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param pai primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM pais WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param PaisMySql pai
 	 */
	public function insert($pai){
		$sql = 'INSERT INTO pais (iso2, iso3, prefijo, nombre, continente, subcontinente, iso_moneda, nombre_moneda) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($pai->iso2);
		$sqlQuery->set($pai->iso3);
		$sqlQuery->set($pai->prefijo);
		$sqlQuery->set($pai->nombre);
		$sqlQuery->set($pai->continente);
		$sqlQuery->set($pai->subcontinente);
		$sqlQuery->set($pai->isoMoneda);
		$sqlQuery->set($pai->nombreMoneda);

		$id = $this->executeInsert($sqlQuery);	
		$pai->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param PaisMySql pai
 	 */
	public function update($pai){
		$sql = 'UPDATE pais SET iso2 = ?, iso3 = ?, prefijo = ?, nombre = ?, continente = ?, subcontinente = ?, iso_moneda = ?, nombre_moneda = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($pai->iso2);
		$sqlQuery->set($pai->iso3);
		$sqlQuery->set($pai->prefijo);
		$sqlQuery->set($pai->nombre);
		$sqlQuery->set($pai->continente);
		$sqlQuery->set($pai->subcontinente);
		$sqlQuery->set($pai->isoMoneda);
		$sqlQuery->set($pai->nombreMoneda);

		$sqlQuery->setNumber($pai->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM pais';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByIso2($value){
		$sql = 'SELECT * FROM pais WHERE iso2 = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIso3($value){
		$sql = 'SELECT * FROM pais WHERE iso3 = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPrefijo($value){
		$sql = 'SELECT * FROM pais WHERE prefijo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM pais WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContinente($value){
		$sql = 'SELECT * FROM pais WHERE continente = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySubcontinente($value){
		$sql = 'SELECT * FROM pais WHERE subcontinente = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIsoMoneda($value){
		$sql = 'SELECT * FROM pais WHERE iso_moneda = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombreMoneda($value){
		$sql = 'SELECT * FROM pais WHERE nombre_moneda = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByIso2($value){
		$sql = 'DELETE FROM pais WHERE iso2 = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIso3($value){
		$sql = 'DELETE FROM pais WHERE iso3 = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPrefijo($value){
		$sql = 'DELETE FROM pais WHERE prefijo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombre($value){
		$sql = 'DELETE FROM pais WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContinente($value){
		$sql = 'DELETE FROM pais WHERE continente = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySubcontinente($value){
		$sql = 'DELETE FROM pais WHERE subcontinente = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIsoMoneda($value){
		$sql = 'DELETE FROM pais WHERE iso_moneda = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombreMoneda($value){
		$sql = 'DELETE FROM pais WHERE nombre_moneda = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return PaisMySql 
	 */
	protected function readRow($row){
		$pai = new Pai();
		
		$pai->id = $row['id'];
		$pai->iso2 = $row['iso2'];
		$pai->iso3 = $row['iso3'];
		$pai->prefijo = $row['prefijo'];
		$pai->nombre = $row['nombre'];
		$pai->continente = $row['continente'];
		$pai->subcontinente = $row['subcontinente'];
		$pai->isoMoneda = $row['iso_moneda'];
		$pai->nombreMoneda = $row['nombre_moneda'];

		return $pai;
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
	 * @return PaisMySql 
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