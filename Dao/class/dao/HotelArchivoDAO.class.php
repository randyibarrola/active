<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelArchivo 
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
 	 * @param hotelArchivo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelArchivo hotelArchivo
 	 */
	public function insert($hotelArchivo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelArchivo hotelArchivo
 	 */
	public function update($hotelArchivo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByArchivoId($value);

	public function queryByTipo($value);


	public function deleteByHotelId($value);

	public function deleteByArchivoId($value);

	public function deleteByTipo($value);


}
?>