<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface DestinoTuristicoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return DestinoTuristico 
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
 	 * @param destinoTuristico primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DestinoTuristico destinoTuristico
 	 */
	public function insert($destinoTuristico);
	
	/**
 	 * Update record in table
 	 *
 	 * @param DestinoTuristico destinoTuristico
 	 */
	public function update($destinoTuristico);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByDescripcion($value);

	public function queryByDireccionId($value);


	public function deleteByNombre($value);

	public function deleteByDescripcion($value);

	public function deleteByDireccionId($value);


}
?>