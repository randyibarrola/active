<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-13 08:07
 */
interface FacturaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Factura 
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
 	 * @param factura primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Factura factura
 	 */
	public function insert($factura);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Factura factura
 	 */
	public function update($factura);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByHotelId($value);

	public function queryByTiempoCreacion($value);

	public function queryByUltimaModificacion($value);

	public function queryByEstado($value);

	public function queryByTotal($value);

	public function queryByComision($value);

	public function queryByMonedaId($value);

	public function queryByContrato($value);

	public function queryByNumero($value);

	public function queryByCliente($value);


	public function deleteByHotelId($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByUltimaModificacion($value);

	public function deleteByEstado($value);

	public function deleteByTotal($value);

	public function deleteByComision($value);

	public function deleteByMonedaId($value);

	public function deleteByContrato($value);

	public function deleteByNumero($value);

	public function deleteByCliente($value);


}
?>