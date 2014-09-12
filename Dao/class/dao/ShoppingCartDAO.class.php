<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ShoppingCartDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ShoppingCart 
	 */
	public function load($id);

	/**
	 * Get all records from table
	 */
	public function queryAll();
	
	/**
	 * Get all records from table ordered by field
	 * @Param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn);
	
	/**
 	 * Delete record from table
 	 * @param shoppingCart primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ShoppingCart shoppingCart
 	 */
	public function insert($shoppingCart);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ShoppingCart shoppingCart
 	 */
	public function update($shoppingCart);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByApartamento($value);

	public function queryByExcursiones($value);

	public function queryByInicio($value);

	public function queryBySalida($value);

	public function queryByNoches($value);

	public function queryByUrl($value);

	public function queryByMonedaId($value);


	public function deleteByHotelId($value);

	public function deleteByApartamento($value);

	public function deleteByExcursiones($value);

	public function deleteByInicio($value);

	public function deleteBySalida($value);

	public function deleteByNoches($value);

	public function deleteByUrl($value);

	public function deleteByMonedaId($value);


}
?>