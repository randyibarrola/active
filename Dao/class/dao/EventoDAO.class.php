<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface EventoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Evento 
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
 	 * @param evento primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Evento evento
 	 */
	public function insert($evento);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Evento evento
 	 */
	public function update($evento);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByMonedaId($value);

	public function queryByDireccionId($value);

	public function queryByCampaniaId($value);

	public function queryByDescripcionBreve($value);

	public function queryByDescripcionExtendida($value);

	public function queryBySugerenciasTpv($value);

	public function queryByInstruccionesConsumo($value);

	public function queryByYoutube($value);

	public function queryByTituloSeo($value);

	public function queryByVentaAnticipada($value);

	public function queryByPorcentajeComision($value);

	public function queryByTipoReserva($value);

	public function queryByPorcentajeCobroAnticipado($value);

	public function queryByBookingOnrequest($value);

	public function queryByEmailReservas($value);

	public function queryByTelefonoReservas($value);

	public function queryByTransfer($value);

	public function queryByGuias($value);

	public function queryByDestinoTuristicoId($value);

	public function queryByDuracion($value);


	public function deleteByNombre($value);

	public function deleteByMonedaId($value);

	public function deleteByDireccionId($value);

	public function deleteByCampaniaId($value);

	public function deleteByDescripcionBreve($value);

	public function deleteByDescripcionExtendida($value);

	public function deleteBySugerenciasTpv($value);

	public function deleteByInstruccionesConsumo($value);

	public function deleteByYoutube($value);

	public function deleteByTituloSeo($value);

	public function deleteByVentaAnticipada($value);

	public function deleteByPorcentajeComision($value);

	public function deleteByTipoReserva($value);

	public function deleteByPorcentajeCobroAnticipado($value);

	public function deleteByBookingOnrequest($value);

	public function deleteByEmailReservas($value);

	public function deleteByTelefonoReservas($value);

	public function deleteByTransfer($value);

	public function deleteByGuias($value);

	public function deleteByDestinoTuristicoId($value);

	public function deleteByDuracion($value);


}
?>