<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ReservaPagoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ReservaPago 
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
 	 * @param reservaPago primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaPago reservaPago
 	 */
	public function insert($reservaPago);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaPago reservaPago
 	 */
	public function update($reservaPago);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByFormaPago($value);

	public function queryByAutorizacion($value);

	public function queryByRequest($value);

	public function queryByImporte($value);

	public function queryByConcepto($value);

	public function queryByEstado($value);

	public function queryByTiempoCreacion($value);

	public function queryByUltimaModificacion($value);

	public function queryByOrigen($value);

	public function queryByValidada($value);

	public function queryByComentario($value);

	public function queryByTipo($value);

	public function queryByReservaId($value);

	public function queryByTarjetaTipo($value);

	public function queryByCaducidadMes($value);

	public function queryByCaducidadAnio($value);

	public function queryByPaypal($value);

	public function queryByTarjetaNumero($value);

	public function queryByCvv($value);

	public function queryByMonedaId($value);

	public function queryByTitular($value);

	public function queryByOp($value);

	public function queryByOpDevolucion($value);


	public function deleteByFormaPago($value);

	public function deleteByAutorizacion($value);

	public function deleteByRequest($value);

	public function deleteByImporte($value);

	public function deleteByConcepto($value);

	public function deleteByEstado($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByUltimaModificacion($value);

	public function deleteByOrigen($value);

	public function deleteByValidada($value);

	public function deleteByComentario($value);

	public function deleteByTipo($value);

	public function deleteByReservaId($value);

	public function deleteByTarjetaTipo($value);

	public function deleteByCaducidadMes($value);

	public function deleteByCaducidadAnio($value);

	public function deleteByPaypal($value);

	public function deleteByTarjetaNumero($value);

	public function deleteByCvv($value);

	public function deleteByMonedaId($value);

	public function deleteByTitular($value);

	public function deleteByOp($value);

	public function deleteByOpDevolucion($value);


}
?>