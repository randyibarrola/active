<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelFechasDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelFechas 
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
 	 * @param hotelFecha primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelFechas hotelFecha
 	 */
	public function insert($hotelFecha);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelFechas hotelFecha
 	 */
	public function update($hotelFecha);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByFecha($value);


	public function deleteByHotelId($value);

	public function deleteByFecha($value);


}
?>