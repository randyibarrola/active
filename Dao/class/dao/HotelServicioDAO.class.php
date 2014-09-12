<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelServicioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelServicio 
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
 	 * @param hotelServicio primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelServicio hotelServicio
 	 */
	public function insert($hotelServicio);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelServicio hotelServicio
 	 */
	public function update($hotelServicio);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByServicioId($value);


	public function deleteByHotelId($value);

	public function deleteByServicioId($value);


}
?>