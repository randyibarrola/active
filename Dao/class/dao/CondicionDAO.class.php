<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface CondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Condicion 
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
 	 * @param condicion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Condicion condicion
 	 */
	public function insert($condicion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Condicion condicion
 	 */
	public function update($condicion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByDescripcion($value);

	public function queryByCondicionCategoriaId($value);

	public function queryByUsuarioId($value);


	public function deleteByNombre($value);

	public function deleteByDescripcion($value);

	public function deleteByCondicionCategoriaId($value);

	public function deleteByUsuarioId($value);


}
?>