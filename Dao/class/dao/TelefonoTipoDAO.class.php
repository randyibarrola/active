<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface TelefonoTipoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return TelefonoTipo 
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
 	 * @param telefonoTipo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param TelefonoTipo telefonoTipo
 	 */
	public function insert($telefonoTipo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param TelefonoTipo telefonoTipo
 	 */
	public function update($telefonoTipo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);


	public function deleteByNombre($value);


}
?>