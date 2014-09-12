<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface CondicionCategoriaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return CondicionCategoria 
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
 	 * @param condicionCategoria primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CondicionCategoria condicionCategoria
 	 */
	public function insert($condicionCategoria);
	
	/**
 	 * Update record in table
 	 *
 	 * @param CondicionCategoria condicionCategoria
 	 */
	public function update($condicionCategoria);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);


	public function deleteByNombre($value);


}
?>