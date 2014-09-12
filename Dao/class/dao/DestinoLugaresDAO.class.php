<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-14 21:02
 */
interface DestinoLugaresDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return DestinoLugares 
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
 	 * @param destinoLugare primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DestinoLugares destinoLugare
 	 */
	public function insert($destinoLugare);
	
	/**
 	 * Update record in table
 	 *
 	 * @param DestinoLugares destinoLugare
 	 */
	public function update($destinoLugare);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByDestinoTuristicoId($value);

	public function queryByNombre($value);


	public function deleteByDestinoTuristicoId($value);

	public function deleteByNombre($value);


}
?>