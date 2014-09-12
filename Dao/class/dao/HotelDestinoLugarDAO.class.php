<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-14 21:02
 */
interface HotelDestinoLugarDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelDestinoLugar 
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
 	 * @param hotelDestinoLugar primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelDestinoLugar hotelDestinoLugar
 	 */
	public function insert($hotelDestinoLugar);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelDestinoLugar hotelDestinoLugar
 	 */
	public function update($hotelDestinoLugar);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByDestinoLugaresId($value);


	public function deleteByHotelId($value);

	public function deleteByDestinoLugaresId($value);


}
?>