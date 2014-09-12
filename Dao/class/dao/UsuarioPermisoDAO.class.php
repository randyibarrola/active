<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface UsuarioPermisoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return UsuarioPermiso 
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
 	 * @param usuarioPermiso primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioPermiso usuarioPermiso
 	 */
	public function insert($usuarioPermiso);
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioPermiso usuarioPermiso
 	 */
	public function update($usuarioPermiso);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByUsuarioGrupoId($value);

	public function queryByPermisoId($value);


	public function deleteByUsuarioGrupoId($value);

	public function deleteByPermisoId($value);


}
?>