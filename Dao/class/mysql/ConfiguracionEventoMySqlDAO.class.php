<?php
/**
 * Class that operate on table 'configuracion_evento'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ConfiguracionEventoMySqlDAO implements ConfiguracionEventoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ConfiguracionEventoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM configuracion_evento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM configuracion_evento';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM configuracion_evento ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param configuracionEvento primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM configuracion_evento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ConfiguracionEventoMySql configuracionEvento
 	 */
	public function insert($configuracionEvento){
		$sql = 'INSERT INTO configuracion_evento (configuracion_id, evento_id, favorito) VALUES (?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($configuracionEvento->configuracionId);
		$sqlQuery->setNumber($configuracionEvento->eventoId);
		$sqlQuery->setNumber($configuracionEvento->favorito);

		$id = $this->executeInsert($sqlQuery);	
		$configuracionEvento->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ConfiguracionEventoMySql configuracionEvento
 	 */
	public function update($configuracionEvento){
		$sql = 'UPDATE configuracion_evento SET configuracion_id = ?, evento_id = ?, favorito = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($configuracionEvento->configuracionId);
		$sqlQuery->setNumber($configuracionEvento->eventoId);
		$sqlQuery->setNumber($configuracionEvento->favorito);

		$sqlQuery->setNumber($configuracionEvento->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM configuracion_evento';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByConfiguracionId($value){
		$sql = 'SELECT * FROM configuracion_evento WHERE configuracion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEventoId($value){
		$sql = 'SELECT * FROM configuracion_evento WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFavorito($value){
		$sql = 'SELECT * FROM configuracion_evento WHERE favorito = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByConfiguracionId($value){
		$sql = 'DELETE FROM configuracion_evento WHERE configuracion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEventoId($value){
		$sql = 'DELETE FROM configuracion_evento WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFavorito($value){
		$sql = 'DELETE FROM configuracion_evento WHERE favorito = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ConfiguracionEventoMySql 
	 */
	protected function readRow($row){
		$configuracionEvento = new ConfiguracionEvento();
		
		$configuracionEvento->id = $row['id'];
		$configuracionEvento->configuracionId = $row['configuracion_id'];
		$configuracionEvento->eventoId = $row['evento_id'];
		$configuracionEvento->favorito = $row['favorito'];

		return $configuracionEvento;
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
	 * @return ConfiguracionEventoMySql 
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