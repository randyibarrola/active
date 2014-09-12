<?php
/**
 * Class that operate on table 'busqueda_disponibilidad'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class BusquedaDisponibilidadMySqlDAO implements BusquedaDisponibilidadDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return BusquedaDisponibilidadMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM busqueda_disponibilidad WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM busqueda_disponibilidad';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM busqueda_disponibilidad ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param busquedaDisponibilidad primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM busqueda_disponibilidad WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param BusquedaDisponibilidadMySql busquedaDisponibilidad
 	 */
	public function insert($busquedaDisponibilidad){
		$sql = 'INSERT INTO busqueda_disponibilidad (tiempo_creacion, inicio, fin, hotel_id, url) VALUES (?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($busquedaDisponibilidad->tiempoCreacion);
		$sqlQuery->set($busquedaDisponibilidad->inicio);
		$sqlQuery->set($busquedaDisponibilidad->fin);
		$sqlQuery->setNumber($busquedaDisponibilidad->hotelId);
		$sqlQuery->set($busquedaDisponibilidad->url);

		$id = $this->executeInsert($sqlQuery);	
		$busquedaDisponibilidad->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param BusquedaDisponibilidadMySql busquedaDisponibilidad
 	 */
	public function update($busquedaDisponibilidad){
		$sql = 'UPDATE busqueda_disponibilidad SET tiempo_creacion = ?, inicio = ?, fin = ?, hotel_id = ?, url = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($busquedaDisponibilidad->tiempoCreacion);
		$sqlQuery->set($busquedaDisponibilidad->inicio);
		$sqlQuery->set($busquedaDisponibilidad->fin);
		$sqlQuery->setNumber($busquedaDisponibilidad->hotelId);
		$sqlQuery->set($busquedaDisponibilidad->url);

		$sqlQuery->setNumber($busquedaDisponibilidad->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM busqueda_disponibilidad';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM busqueda_disponibilidad WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM busqueda_disponibilidad WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFin($value){
		$sql = 'SELECT * FROM busqueda_disponibilidad WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM busqueda_disponibilidad WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUrl($value){
		$sql = 'SELECT * FROM busqueda_disponibilidad WHERE url = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM busqueda_disponibilidad WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInicio($value){
		$sql = 'DELETE FROM busqueda_disponibilidad WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFin($value){
		$sql = 'DELETE FROM busqueda_disponibilidad WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM busqueda_disponibilidad WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUrl($value){
		$sql = 'DELETE FROM busqueda_disponibilidad WHERE url = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return BusquedaDisponibilidadMySql 
	 */
	protected function readRow($row){
		$busquedaDisponibilidad = new BusquedaDisponibilidad();
		
		$busquedaDisponibilidad->id = $row['id'];
		$busquedaDisponibilidad->tiempoCreacion = $row['tiempo_creacion'];
		$busquedaDisponibilidad->inicio = $row['inicio'];
		$busquedaDisponibilidad->fin = $row['fin'];
		$busquedaDisponibilidad->hotelId = $row['hotel_id'];
		$busquedaDisponibilidad->url = $row['url'];

		return $busquedaDisponibilidad;
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
	 * @return BusquedaDisponibilidadMySql 
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