<?php
/**
 * Class that operate on table 'blacklist'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class BlacklistMySqlDAO implements BlacklistDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return BlacklistMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM blacklist WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM blacklist';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM blacklist ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param blacklist primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM blacklist WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param BlacklistMySql blacklist
 	 */
	public function insert($blacklist){
		$sql = 'INSERT INTO blacklist (palabra, ocultar_resultado, hotel_id, usuario_id) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($blacklist->palabra);
		$sqlQuery->setNumber($blacklist->ocultarResultado);
		$sqlQuery->setNumber($blacklist->hotelId);
		$sqlQuery->setNumber($blacklist->usuarioId);

		$id = $this->executeInsert($sqlQuery);	
		$blacklist->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param BlacklistMySql blacklist
 	 */
	public function update($blacklist){
		$sql = 'UPDATE blacklist SET palabra = ?, ocultar_resultado = ?, hotel_id = ?, usuario_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($blacklist->palabra);
		$sqlQuery->setNumber($blacklist->ocultarResultado);
		$sqlQuery->setNumber($blacklist->hotelId);
		$sqlQuery->setNumber($blacklist->usuarioId);

		$sqlQuery->setNumber($blacklist->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM blacklist';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByPalabra($value){
		$sql = 'SELECT * FROM blacklist WHERE palabra = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByOcultarResultado($value){
		$sql = 'SELECT * FROM blacklist WHERE ocultar_resultado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM blacklist WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM blacklist WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByPalabra($value){
		$sql = 'DELETE FROM blacklist WHERE palabra = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByOcultarResultado($value){
		$sql = 'DELETE FROM blacklist WHERE ocultar_resultado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM blacklist WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM blacklist WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return BlacklistMySql 
	 */
	protected function readRow($row){
		$blacklist = new Blacklist();
		
		$blacklist->id = $row['id'];
		$blacklist->palabra = $row['palabra'];
		$blacklist->ocultarResultado = $row['ocultar_resultado'];
		$blacklist->hotelId = $row['hotel_id'];
		$blacklist->usuarioId = $row['usuario_id'];

		return $blacklist;
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
	 * @return BlacklistMySql 
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