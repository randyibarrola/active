<?php
/**
 * Class that operate on table 'hotel_precio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class HotelPrecioMySqlDAO implements HotelPrecioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return HotelPrecioMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM hotel_precio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM hotel_precio';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM hotel_precio ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param hotelPrecio primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM hotel_precio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelPrecioMySql hotelPrecio
 	 */
	public function insert($hotelPrecio){
		$sql = 'INSERT INTO hotel_precio (inicio, fin, precio_minimo, moneda_id, hotel_id) VALUES (?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($hotelPrecio->inicio);
		$sqlQuery->set($hotelPrecio->fin);
		$sqlQuery->set($hotelPrecio->precioMinimo);
		$sqlQuery->setNumber($hotelPrecio->monedaId);
		$sqlQuery->setNumber($hotelPrecio->hotelId);

		$id = $this->executeInsert($sqlQuery);	
		$hotelPrecio->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelPrecioMySql hotelPrecio
 	 */
	public function update($hotelPrecio){
		$sql = 'UPDATE hotel_precio SET inicio = ?, fin = ?, precio_minimo = ?, moneda_id = ?, hotel_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($hotelPrecio->inicio);
		$sqlQuery->set($hotelPrecio->fin);
		$sqlQuery->set($hotelPrecio->precioMinimo);
		$sqlQuery->setNumber($hotelPrecio->monedaId);
		$sqlQuery->setNumber($hotelPrecio->hotelId);

		$sqlQuery->setNumber($hotelPrecio->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM hotel_precio';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM hotel_precio WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFin($value){
		$sql = 'SELECT * FROM hotel_precio WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPrecioMinimo($value){
		$sql = 'SELECT * FROM hotel_precio WHERE precio_minimo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM hotel_precio WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM hotel_precio WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByInicio($value){
		$sql = 'DELETE FROM hotel_precio WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFin($value){
		$sql = 'DELETE FROM hotel_precio WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPrecioMinimo($value){
		$sql = 'DELETE FROM hotel_precio WHERE precio_minimo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM hotel_precio WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM hotel_precio WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return HotelPrecioMySql 
	 */
	protected function readRow($row){
		$hotelPrecio = new HotelPrecio();
		
		$hotelPrecio->id = $row['id'];
		$hotelPrecio->inicio = $row['inicio'];
		$hotelPrecio->fin = $row['fin'];
		$hotelPrecio->precioMinimo = $row['precio_minimo'];
		$hotelPrecio->monedaId = $row['moneda_id'];
		$hotelPrecio->hotelId = $row['hotel_id'];

		return $hotelPrecio;
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
	 * @return HotelPrecioMySql 
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