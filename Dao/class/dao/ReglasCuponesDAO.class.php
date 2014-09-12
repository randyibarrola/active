<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ReglasCuponesDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ReglasCupones 
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
 	 * @param reglasCupone primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReglasCupones reglasCupone
 	 */
	public function insert($reglasCupone);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReglasCupones reglasCupone
 	 */
	public function update($reglasCupone);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByConfiguracionId($value);

	public function queryByMonto($value);

	public function queryByDescuento($value);

	public function queryByTipoDescuento($value);


	public function deleteByConfiguracionId($value);

	public function deleteByMonto($value);

	public function deleteByDescuento($value);

	public function deleteByTipoDescuento($value);


}
?>