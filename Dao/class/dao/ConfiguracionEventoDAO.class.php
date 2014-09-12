<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ConfiguracionEventoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ConfiguracionEvento 
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
 	 * @param configuracionEvento primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ConfiguracionEvento configuracionEvento
 	 */
	public function insert($configuracionEvento);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ConfiguracionEvento configuracionEvento
 	 */
	public function update($configuracionEvento);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByConfiguracionId($value);

	public function queryByEventoId($value);

	public function queryByFavorito($value);


	public function deleteByConfiguracionId($value);

	public function deleteByEventoId($value);

	public function deleteByFavorito($value);


}
?>