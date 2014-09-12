<?php
/**
 * Class that operate on table 'shopping_cart'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ShoppingCartMySqlDAO implements ShoppingCartDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ShoppingCartMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM shopping_cart WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM shopping_cart';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM shopping_cart ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param shoppingCart primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM shopping_cart WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ShoppingCartMySql shoppingCart
 	 */
	public function insert($shoppingCart){
		$sql = 'INSERT INTO shopping_cart (hotel_id, apartamento, excursiones, inicio, salida, noches, url, moneda_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($shoppingCart->hotelId);
		$sqlQuery->set($shoppingCart->apartamento);
		$sqlQuery->set($shoppingCart->excursiones);
		$sqlQuery->set($shoppingCart->inicio);
		$sqlQuery->set($shoppingCart->salida);
		$sqlQuery->setNumber($shoppingCart->noches);
		$sqlQuery->set($shoppingCart->url);
		$sqlQuery->setNumber($shoppingCart->monedaId);

		$id = $this->executeInsert($sqlQuery);	
		$shoppingCart->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ShoppingCartMySql shoppingCart
 	 */
	public function update($shoppingCart){
		$sql = 'UPDATE shopping_cart SET hotel_id = ?, apartamento = ?, excursiones = ?, inicio = ?, salida = ?, noches = ?, url = ?, moneda_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($shoppingCart->hotelId);
		$sqlQuery->set($shoppingCart->apartamento);
		$sqlQuery->set($shoppingCart->excursiones);
		$sqlQuery->set($shoppingCart->inicio);
		$sqlQuery->set($shoppingCart->salida);
		$sqlQuery->setNumber($shoppingCart->noches);
		$sqlQuery->set($shoppingCart->url);
		$sqlQuery->setNumber($shoppingCart->monedaId);

		$sqlQuery->setNumber($shoppingCart->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM shopping_cart';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM shopping_cart WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByApartamento($value){
		$sql = 'SELECT * FROM shopping_cart WHERE apartamento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByExcursiones($value){
		$sql = 'SELECT * FROM shopping_cart WHERE excursiones = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM shopping_cart WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySalida($value){
		$sql = 'SELECT * FROM shopping_cart WHERE salida = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNoches($value){
		$sql = 'SELECT * FROM shopping_cart WHERE noches = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUrl($value){
		$sql = 'SELECT * FROM shopping_cart WHERE url = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM shopping_cart WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByHotelId($value){
		$sql = 'DELETE FROM shopping_cart WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByApartamento($value){
		$sql = 'DELETE FROM shopping_cart WHERE apartamento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByExcursiones($value){
		$sql = 'DELETE FROM shopping_cart WHERE excursiones = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInicio($value){
		$sql = 'DELETE FROM shopping_cart WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySalida($value){
		$sql = 'DELETE FROM shopping_cart WHERE salida = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNoches($value){
		$sql = 'DELETE FROM shopping_cart WHERE noches = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUrl($value){
		$sql = 'DELETE FROM shopping_cart WHERE url = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM shopping_cart WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ShoppingCartMySql 
	 */
	protected function readRow($row){
		$shoppingCart = new ShoppingCart();
		
		$shoppingCart->id = $row['id'];
		$shoppingCart->hotelId = $row['hotel_id'];
		$shoppingCart->apartamento = $row['apartamento'];
		$shoppingCart->excursiones = $row['excursiones'];
		$shoppingCart->inicio = $row['inicio'];
		$shoppingCart->salida = $row['salida'];
		$shoppingCart->noches = $row['noches'];
		$shoppingCart->url = $row['url'];
		$shoppingCart->monedaId = $row['moneda_id'];

		return $shoppingCart;
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
	 * @return ShoppingCartMySql 
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