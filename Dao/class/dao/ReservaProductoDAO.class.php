<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-27 08:41
 */
interface ReservaProductoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ReservaProducto 
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
 	 * @param reservaProducto primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaProducto reservaProducto
 	 */
	public function insert($reservaProducto);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaProducto reservaProducto
 	 */
	public function update($reservaProducto);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByReservaId($value);

	public function queryByNombre($value);

	public function queryByTipo($value);

	public function queryByPrecioUnitario($value);

	public function queryByCantidad($value);

	public function queryByInicio($value);

	public function queryByFinal($value);

	public function queryByPagoOffline($value);

	public function queryByImporteInicial($value);

	public function queryByPorcientoInicial($value);

	public function queryByLocalizador($value);

	public function queryByTelefonoContacto($value);

	public function queryByModoPagoOffline($value);

	public function queryByEventoId($value);

	public function queryByEventoTpv($value);

	public function queryBySesion($value);

	public function queryByDireccion($value);

	public function queryByEmails($value);

	public function queryByEntradas($value);

	public function queryByCondicion($value);

	public function queryByPension($value);

	public function queryByAdultos($value);

	public function queryByNinios($value);

	public function queryByDescuento($value);

	public function queryByCupon($value);


	public function deleteByReservaId($value);

	public function deleteByNombre($value);

	public function deleteByTipo($value);

	public function deleteByPrecioUnitario($value);

	public function deleteByCantidad($value);

	public function deleteByInicio($value);

	public function deleteByFinal($value);

	public function deleteByPagoOffline($value);

	public function deleteByImporteInicial($value);

	public function deleteByPorcientoInicial($value);

	public function deleteByLocalizador($value);

	public function deleteByTelefonoContacto($value);

	public function deleteByModoPagoOffline($value);

	public function deleteByEventoId($value);

	public function deleteByEventoTpv($value);

	public function deleteBySesion($value);

	public function deleteByDireccion($value);

	public function deleteByEmails($value);

	public function deleteByEntradas($value);

	public function deleteByCondicion($value);

	public function deleteByPension($value);

	public function deleteByAdultos($value);

	public function deleteByNinios($value);

	public function deleteByDescuento($value);

	public function deleteByCupon($value);


}
?>