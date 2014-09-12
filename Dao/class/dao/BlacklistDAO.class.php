<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface BlacklistDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Blacklist 
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
 	 * @param blacklist primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Blacklist blacklist
 	 */
	public function insert($blacklist);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Blacklist blacklist
 	 */
	public function update($blacklist);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByPalabra($value);

	public function queryByOcultarResultado($value);

	public function queryByHotelId($value);

	public function queryByUsuarioId($value);


	public function deleteByPalabra($value);

	public function deleteByOcultarResultado($value);

	public function deleteByHotelId($value);

	public function deleteByUsuarioId($value);


}
?>