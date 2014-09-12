<?php
/**
 * Class that operate on table 'apartamento'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ApartamentoMySqlDAO implements ApartamentoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ApartamentoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM apartamento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM apartamento';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM apartamento ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param apartamento primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM apartamento WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoMySql apartamento
 	 */
	public function insert($apartamento){
		$sql = 'INSERT INTO apartamento (nombre, hotel_id, descripcion_corta, descripcion_larga, estado, adultos, superficie, ninios, tiempo_creacion, ultima_modificacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($apartamento->nombre);
		$sqlQuery->setNumber($apartamento->hotelId);
		$sqlQuery->set($apartamento->descripcionCorta);
		$sqlQuery->set($apartamento->descripcionLarga);
		$sqlQuery->set($apartamento->estado);
		$sqlQuery->setNumber($apartamento->adultos);
		$sqlQuery->set($apartamento->superficie);
		$sqlQuery->setNumber($apartamento->ninios);
		$sqlQuery->set($apartamento->tiempoCreacion);
		$sqlQuery->set($apartamento->ultimaModificacion);

		$id = $this->executeInsert($sqlQuery);	
		$apartamento->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoMySql apartamento
 	 */
	public function update($apartamento){
		$sql = 'UPDATE apartamento SET nombre = ?, hotel_id = ?, descripcion_corta = ?, descripcion_larga = ?, estado = ?, adultos = ?, superficie = ?, ninios = ?, tiempo_creacion = ?, ultima_modificacion = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($apartamento->nombre);
		$sqlQuery->setNumber($apartamento->hotelId);
		$sqlQuery->set($apartamento->descripcionCorta);
		$sqlQuery->set($apartamento->descripcionLarga);
		$sqlQuery->set($apartamento->estado);
		$sqlQuery->setNumber($apartamento->adultos);
		$sqlQuery->set($apartamento->superficie);
		$sqlQuery->setNumber($apartamento->ninios);
		$sqlQuery->set($apartamento->tiempoCreacion);
		$sqlQuery->set($apartamento->ultimaModificacion);

		$sqlQuery->setNumber($apartamento->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM apartamento';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM apartamento WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM apartamento WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcionCorta($value){
		$sql = 'SELECT * FROM apartamento WHERE descripcion_corta = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcionLarga($value){
		$sql = 'SELECT * FROM apartamento WHERE descripcion_larga = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM apartamento WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAdultos($value){
		$sql = 'SELECT * FROM apartamento WHERE adultos = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySuperficie($value){
		$sql = 'SELECT * FROM apartamento WHERE superficie = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNinios($value){
		$sql = 'SELECT * FROM apartamento WHERE ninios = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM apartamento WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM apartamento WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM apartamento WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM apartamento WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcionCorta($value){
		$sql = 'DELETE FROM apartamento WHERE descripcion_corta = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcionLarga($value){
		$sql = 'DELETE FROM apartamento WHERE descripcion_larga = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM apartamento WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAdultos($value){
		$sql = 'DELETE FROM apartamento WHERE adultos = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySuperficie($value){
		$sql = 'DELETE FROM apartamento WHERE superficie = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNinios($value){
		$sql = 'DELETE FROM apartamento WHERE ninios = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM apartamento WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM apartamento WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ApartamentoMySql 
	 */
	protected function readRow($row){
		$apartamento = new Apartamento();
		
		$apartamento->id = $row['id'];
		$apartamento->nombre = $row['nombre'];
		$apartamento->hotelId = $row['hotel_id'];
		$apartamento->descripcionCorta = $row['descripcion_corta'];
		$apartamento->descripcionLarga = $row['descripcion_larga'];
		$apartamento->estado = $row['estado'];
		$apartamento->adultos = $row['adultos'];
		$apartamento->superficie = $row['superficie'];
		$apartamento->ninios = $row['ninios'];
		$apartamento->tiempoCreacion = $row['tiempo_creacion'];
		$apartamento->ultimaModificacion = $row['ultima_modificacion'];

		return $apartamento;
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
	 * @return ApartamentoMySql 
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