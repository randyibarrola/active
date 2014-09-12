<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelCondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelCondicion 
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
 	 * @param hotelCondicion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelCondicion hotelCondicion
 	 */
	public function insert($hotelCondicion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelCondicion hotelCondicion
 	 */
	public function update($hotelCondicion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByCondicionId($value);


	public function deleteByHotelId($value);

	public function deleteByCondicionId($value);


}
?>