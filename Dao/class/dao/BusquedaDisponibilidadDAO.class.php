<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface BusquedaDisponibilidadDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return BusquedaDisponibilidad 
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
 	 * @param busquedaDisponibilidad primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param BusquedaDisponibilidad busquedaDisponibilidad
 	 */
	public function insert($busquedaDisponibilidad);
	
	/**
 	 * Update record in table
 	 *
 	 * @param BusquedaDisponibilidad busquedaDisponibilidad
 	 */
	public function update($busquedaDisponibilidad);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByTiempoCreacion($value);

	public function queryByInicio($value);

	public function queryByFin($value);

	public function queryByHotelId($value);

	public function queryByUrl($value);


	public function deleteByTiempoCreacion($value);

	public function deleteByInicio($value);

	public function deleteByFin($value);

	public function deleteByHotelId($value);

	public function deleteByUrl($value);


}
?>