<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AfiliadoRegistroDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return AfiliadoRegistro 
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
 	 * @param afiliadoRegistro primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoRegistro afiliadoRegistro
 	 */
	public function insert($afiliadoRegistro);
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoRegistro afiliadoRegistro
 	 */
	public function update($afiliadoRegistro);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByAfiliadoId($value);

	public function queryByImporte($value);

	public function queryByFecha($value);

	public function queryByReservaId($value);


	public function deleteByAfiliadoId($value);

	public function deleteByImporte($value);

	public function deleteByFecha($value);

	public function deleteByReservaId($value);


}
?>