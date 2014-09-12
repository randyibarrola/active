<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelPrecioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelPrecio 
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
 	 * @param hotelPrecio primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelPrecio hotelPrecio
 	 */
	public function insert($hotelPrecio);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelPrecio hotelPrecio
 	 */
	public function update($hotelPrecio);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByInicio($value);

	public function queryByFin($value);

	public function queryByPrecioMinimo($value);

	public function queryByMonedaId($value);

	public function queryByHotelId($value);


	public function deleteByInicio($value);

	public function deleteByFin($value);

	public function deleteByPrecioMinimo($value);

	public function deleteByMonedaId($value);

	public function deleteByHotelId($value);


}
?>