<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelMonedaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelMoneda 
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
 	 * @param hotelMoneda primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelMoneda hotelMoneda
 	 */
	public function insert($hotelMoneda);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelMoneda hotelMoneda
 	 */
	public function update($hotelMoneda);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByMonedaId($value);


	public function deleteByHotelId($value);

	public function deleteByMonedaId($value);


}
?>