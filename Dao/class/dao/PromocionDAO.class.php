<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface PromocionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Promocion 
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
 	 * @param promocion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Promocion promocion
 	 */
	public function insert($promocion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Promocion promocion
 	 */
	public function update($promocion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByInicio($value);

	public function queryByFin($value);

	public function queryByDescuentoBooking($value);

	public function queryByTipoDescuentoBooking($value);

	public function queryByHotelId($value);

	public function queryByPalabras($value);

	public function queryByCondicionPagoOnline($value);

	public function queryByPagoOnline($value);


	public function deleteByInicio($value);

	public function deleteByFin($value);

	public function deleteByDescuentoBooking($value);

	public function deleteByTipoDescuentoBooking($value);

	public function deleteByHotelId($value);

	public function deleteByPalabras($value);

	public function deleteByCondicionPagoOnline($value);

	public function deleteByPagoOnline($value);


}
?>