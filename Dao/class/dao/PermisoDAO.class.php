<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface PermisoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Permiso 
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
 	 * @param permiso primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Permiso permiso
 	 */
	public function insert($permiso);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Permiso permiso
 	 */
	public function update($permiso);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);


	public function deleteByNombre($value);


}
?>