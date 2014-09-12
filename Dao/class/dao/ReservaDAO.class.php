<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ReservaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Reserva 
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
 	 * @param reserva primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Reserva reserva
 	 */
	public function insert($reserva);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Reserva reserva
 	 */
	public function update($reserva);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByUsuarioId($value);

	public function queryByPeticionesEspeciales($value);

	public function queryByTiempoCreacion($value);

	public function queryByUltimaModificacion($value);

	public function queryByHoraPrevista($value);

	public function queryByTotal($value);

	public function queryByMoneda($value);

	public function queryByEstado($value);

	public function queryByHotelId($value);

	public function queryByLocalizador($value);

	public function queryByUrlOrigen($value);

	public function queryByMonedaId($value);

	public function queryByRecibirFactura($value);

	public function queryByIdiomaId($value);

	public function queryByCartId($value);

	public function queryByIp($value);

	public function queryByNavegador($value);

	public function queryByRequestTime($value);

	public function queryByNota($value);

	public function queryByMotivoCancelacion($value);

	public function queryByTipoCobro($value);


	public function deleteByUsuarioId($value);

	public function deleteByPeticionesEspeciales($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByUltimaModificacion($value);

	public function deleteByHoraPrevista($value);

	public function deleteByTotal($value);

	public function deleteByMoneda($value);

	public function deleteByEstado($value);

	public function deleteByHotelId($value);

	public function deleteByLocalizador($value);

	public function deleteByUrlOrigen($value);

	public function deleteByMonedaId($value);

	public function deleteByRecibirFactura($value);

	public function deleteByIdiomaId($value);

	public function deleteByCartId($value);

	public function deleteByIp($value);

	public function deleteByNavegador($value);

	public function deleteByRequestTime($value);

	public function deleteByNota($value);

	public function deleteByMotivoCancelacion($value);

	public function deleteByTipoCobro($value);


}
?>