<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface CampaniaPeriodoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return CampaniaPeriodo 
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
 	 * @param campaniaPeriodo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CampaniaPeriodo campaniaPeriodo
 	 */
	public function insert($campaniaPeriodo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param CampaniaPeriodo campaniaPeriodo
 	 */
	public function update($campaniaPeriodo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByInicio($value);

	public function queryByFin($value);

	public function queryByEstanciaMinima($value);

	public function queryByVentaAnticipada($value);

	public function queryByDescuentoBooking($value);

	public function queryByTipoDescuento($value);

	public function queryByCampaniaId($value);


	public function deleteByInicio($value);

	public function deleteByFin($value);

	public function deleteByEstanciaMinima($value);

	public function deleteByVentaAnticipada($value);

	public function deleteByDescuentoBooking($value);

	public function deleteByTipoDescuento($value);

	public function deleteByCampaniaId($value);


}
?>