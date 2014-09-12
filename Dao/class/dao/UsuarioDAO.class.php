<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface UsuarioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Usuario 
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
 	 * @param usuario primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Usuario usuario
 	 */
	public function insert($usuario);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Usuario usuario
 	 */
	public function update($usuario);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByApellido($value);

	public function queryByEmail($value);

	public function queryByTiempoCreacion($value);

	public function queryByUltimaModificacion($value);

	public function queryByStatus($value);

	public function queryByDireccionId($value);

	public function queryByUsuarioGrupoId($value);

	public function queryByTelefono($value);

	public function queryByPaisId($value);

	public function queryByPassword($value);

	public function queryByPuestoTrabajo($value);

	public function queryByPorcentajeBeneficio($value);

	public function queryByDni($value);


	public function deleteByNombre($value);

	public function deleteByApellido($value);

	public function deleteByEmail($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByUltimaModificacion($value);

	public function deleteByStatus($value);

	public function deleteByDireccionId($value);

	public function deleteByUsuarioGrupoId($value);

	public function deleteByTelefono($value);

	public function deleteByPaisId($value);

	public function deleteByPassword($value);

	public function deleteByPuestoTrabajo($value);

	public function deleteByPorcentajeBeneficio($value);

	public function deleteByDni($value);


}
?>