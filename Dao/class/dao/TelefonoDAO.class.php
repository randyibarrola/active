<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface TelefonoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Telefono 
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
 	 * @param telefono primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Telefono telefono
 	 */
	public function insert($telefono);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Telefono telefono
 	 */
	public function update($telefono);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNumero($value);

	public function queryByTelefonoTipoId($value);

	public function queryByEmpresaId($value);


	public function deleteByNumero($value);

	public function deleteByTelefonoTipoId($value);

	public function deleteByEmpresaId($value);


}
?>