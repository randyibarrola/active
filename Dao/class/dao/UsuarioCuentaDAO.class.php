<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface UsuarioCuentaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return UsuarioCuenta 
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
 	 * @param usuarioCuenta primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioCuenta usuarioCuenta
 	 */
	public function insert($usuarioCuenta);
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioCuenta usuarioCuenta
 	 */
	public function update($usuarioCuenta);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByUsuarioId($value);

	public function queryByBancoNombre($value);

	public function queryByBancoSucursal($value);

	public function queryByDireccionId($value);

	public function queryByPaisId($value);

	public function queryByNombre($value);

	public function queryBySwift($value);

	public function queryByNumero($value);

	public function queryByIban($value);

	public function queryByTaxId($value);

	public function queryByComentarios($value);

	public function queryByContactoNombre($value);

	public function queryByContactoEmail($value);


	public function deleteByUsuarioId($value);

	public function deleteByBancoNombre($value);

	public function deleteByBancoSucursal($value);

	public function deleteByDireccionId($value);

	public function deleteByPaisId($value);

	public function deleteByNombre($value);

	public function deleteBySwift($value);

	public function deleteByNumero($value);

	public function deleteByIban($value);

	public function deleteByTaxId($value);

	public function deleteByComentarios($value);

	public function deleteByContactoNombre($value);

	public function deleteByContactoEmail($value);


}
?>