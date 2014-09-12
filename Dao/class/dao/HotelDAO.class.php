<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-21 06:44
 */
interface HotelDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Hotel 
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
 	 * @param hotel primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Hotel hotel
 	 */
	public function insert($hotel);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Hotel hotel
 	 */
	public function update($hotel);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByDescripcionCorta($value);

	public function queryByDescripcionLarga($value);

	public function queryByVisitas($value);

	public function queryByEstado($value);

	public function queryByCapacidad($value);

	public function queryByTiempoCreacion($value);

	public function queryByUltimaModificacion($value);

	public function queryByUrl($value);

	public function queryByCalidad($value);

	public function queryByEmpresaId($value);

	public function queryByConfiguracionId($value);

	public function queryByTripAdvisor($value);

	public function queryByBackgroundColor($value);

	public function queryByEstanciaMinima($value);

	public function queryByVentaAnticipada($value);

	public function queryByLogoId($value);

	public function queryByPorcentageCobroAnticipado($value);

	public function queryByInformacionCompra($value);

	public function queryByTituloSeo($value);

	public function queryByKeywordsSeo($value);

	public function queryByTipoReserva($value);

	public function queryByClaveGoogleAnalytics($value);

	public function queryByInicioContrato($value);

	public function queryByFinContrato($value);

	public function queryByDescuentoBooking($value);

	public function queryByTipoDescuentoBooking($value);

	public function queryByEmailReservas($value);

	public function queryByCampaniaId($value);

	public function queryBySeo($value);

	public function queryByClave($value);

	public function queryByDominioOficial($value);

	public function queryByTelefonoReservas($value);

	public function queryByDominioCampania($value);

	public function queryByBookingOnrequest($value);

	public function queryByIdiomaId($value);

	public function queryByDestinoId($value);

	public function queryByContenidoHtml($value);

	public function queryByChat($value);

	public function queryByHeaderVikahotel($value);

	public function queryByMostrarHotelesRelacionados($value);

	public function queryByRespetarCupo($value);

	public function queryByLoginCode($value);

	public function queryByMonedaId($value);

	public function queryByDestacado($value);

	public function queryByAdwords($value);

	public function queryByWebOficial($value);

	public function queryByDominioPrincipal($value);

	public function queryByEmailContacto($value);

	public function queryByLugares($value);


	public function deleteByNombre($value);

	public function deleteByDescripcionCorta($value);

	public function deleteByDescripcionLarga($value);

	public function deleteByVisitas($value);

	public function deleteByEstado($value);

	public function deleteByCapacidad($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByUltimaModificacion($value);

	public function deleteByUrl($value);

	public function deleteByCalidad($value);

	public function deleteByEmpresaId($value);

	public function deleteByConfiguracionId($value);

	public function deleteByTripAdvisor($value);

	public function deleteByBackgroundColor($value);

	public function deleteByEstanciaMinima($value);

	public function deleteByVentaAnticipada($value);

	public function deleteByLogoId($value);

	public function deleteByPorcentageCobroAnticipado($value);

	public function deleteByInformacionCompra($value);

	public function deleteByTituloSeo($value);

	public function deleteByKeywordsSeo($value);

	public function deleteByTipoReserva($value);

	public function deleteByClaveGoogleAnalytics($value);

	public function deleteByInicioContrato($value);

	public function deleteByFinContrato($value);

	public function deleteByDescuentoBooking($value);

	public function deleteByTipoDescuentoBooking($value);

	public function deleteByEmailReservas($value);

	public function deleteByCampaniaId($value);

	public function deleteBySeo($value);

	public function deleteByClave($value);

	public function deleteByDominioOficial($value);

	public function deleteByTelefonoReservas($value);

	public function deleteByDominioCampania($value);

	public function deleteByBookingOnrequest($value);

	public function deleteByIdiomaId($value);

	public function deleteByDestinoId($value);

	public function deleteByContenidoHtml($value);

	public function deleteByChat($value);

	public function deleteByHeaderVikahotel($value);

	public function deleteByMostrarHotelesRelacionados($value);

	public function deleteByRespetarCupo($value);

	public function deleteByLoginCode($value);

	public function deleteByMonedaId($value);

	public function deleteByDestacado($value);

	public function deleteByAdwords($value);

	public function deleteByWebOficial($value);

	public function deleteByDominioPrincipal($value);

	public function deleteByEmailContacto($value);

	public function deleteByLugares($value);


}
?>