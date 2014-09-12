<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ConfiguracionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Configuracion 
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
 	 * @param configuracion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Configuracion configuracion
 	 */
	public function insert($configuracion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Configuracion configuracion
 	 */
	public function update($configuracion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByComparacionBooking($value);

	public function queryBySincronizacionVika($value);

	public function queryByCuponPromocional($value);

	public function queryByAtencionPersonalizada($value);

	public function queryByPagoFlexible($value);

	public function queryByVikaEmail($value);

	public function queryByVikaPassword($value);

	public function queryByVikaCanal($value);

	public function queryByVikaEmpresa($value);

	public function queryByAlias($value);

	public function queryByUsuarioId($value);


	public function deleteByComparacionBooking($value);

	public function deleteBySincronizacionVika($value);

	public function deleteByCuponPromocional($value);

	public function deleteByAtencionPersonalizada($value);

	public function deleteByPagoFlexible($value);

	public function deleteByVikaEmail($value);

	public function deleteByVikaPassword($value);

	public function deleteByVikaCanal($value);

	public function deleteByVikaEmpresa($value);

	public function deleteByAlias($value);

	public function deleteByUsuarioId($value);


}
?>