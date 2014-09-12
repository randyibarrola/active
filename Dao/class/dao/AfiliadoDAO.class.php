<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AfiliadoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Afiliado 
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
 	 * @param afiliado primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Afiliado afiliado
 	 */
	public function insert($afiliado);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Afiliado afiliado
 	 */
	public function update($afiliado);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByUsuarioId($value);

	public function queryByMonedaId($value);

	public function queryByIdiomaId($value);

	public function queryByNombreComercial($value);

	public function queryByWeb($value);

	public function queryByComisionHotel($value);

	public function queryByComisionEvento($value);


	public function deleteByUsuarioId($value);

	public function deleteByMonedaId($value);

	public function deleteByIdiomaId($value);

	public function deleteByNombreComercial($value);

	public function deleteByWeb($value);

	public function deleteByComisionHotel($value);

	public function deleteByComisionEvento($value);


}
?>