<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Archivo 
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
 	 * @param archivo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Archivo archivo
 	 */
	public function insert($archivo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Archivo archivo
 	 */
	public function update($archivo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByRuta($value);

	public function queryByTipo($value);

	public function queryByExtension($value);


	public function deleteByNombre($value);

	public function deleteByRuta($value);

	public function deleteByTipo($value);

	public function deleteByExtension($value);


}
?>