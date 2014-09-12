<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AfiliadoHotelDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return AfiliadoHotel 
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
 	 * @param afiliadoHotel primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoHotel afiliadoHotel
 	 */
	public function insert($afiliadoHotel);
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoHotel afiliadoHotel
 	 */
	public function update($afiliadoHotel);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByAfiliadoId($value);

	public function queryByHotelId($value);


	public function deleteByAfiliadoId($value);

	public function deleteByHotelId($value);


}
?>