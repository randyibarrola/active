<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface HotelIdiomaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return HotelIdioma 
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
 	 * @param hotelIdioma primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelIdioma hotelIdioma
 	 */
	public function insert($hotelIdioma);
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelIdioma hotelIdioma
 	 */
	public function update($hotelIdioma);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByIdiomaId($value);


	public function deleteByHotelId($value);

	public function deleteByIdiomaId($value);


}
?>