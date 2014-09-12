<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface DestinoArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return DestinoArchivo 
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
 	 * @param destinoArchivo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DestinoArchivo destinoArchivo
 	 */
	public function insert($destinoArchivo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param DestinoArchivo destinoArchivo
 	 */
	public function update($destinoArchivo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByDestinoId($value);

	public function queryByArchivoId($value);


	public function deleteByDestinoId($value);

	public function deleteByArchivoId($value);


}
?>