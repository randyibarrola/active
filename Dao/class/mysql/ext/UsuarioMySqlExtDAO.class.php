<?php
/**
 * Class that operate on table 'usuario'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class UsuarioMySqlExtDAO extends UsuarioMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Usuario ();
        return $this->mysql->prepare($obj, $data);
    }
    
    function queryByArgs($args) {
        $exclude = array("page", "limit");
        $sql = "SELECT c.* FROM usuario c ";

        $sql .= $this->mysql->addFilters("c", $args, $exclude);
        $sql .= $this->mysql->limit($args);

        $sqlQuery = new SqlQuery($sql);

        return $this->getList($sqlQuery);
    }

    function getByEmail($email) {
        $sql = "SELECT c.* FROM usuario AS c where TRIM(c.email)='" . trim($email) . "' ";
        $sqlQuery = new SqlQuery($sql);
        return $this->getRow($sqlQuery);
    }
    
    function queryByEmpresaId($empresaId) {
        $sql = "SELECT distinct u.* FROM usuario AS u ";
        $sql .= ' INNER JOIN usuario_empresa as ue on ue.usuario_id = u.id';
        $sql .= ' WHERE ue.empresa_id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($empresaId);
        return $this->getRow($sqlQuery);
    }
    
    function queryByTerm($term) {
        
        $sql = 'SELECT u.* FROM usuario as u 
                WHERE u.nombre like "%' . $term . '%" 
                OR u.apellido like "%' . $term . '%" 
                OR u.email like "%' . $term . '%"';

        $sqlQuery = new SqlQuery($sql);

        return $this->getList($sqlQuery);
    }
    
    function queryUsuariosReservaronMisHoteles($term, $idUsuario) {
        
        $sql = 'SELECT DISTINCT u.* FROM reserva AS r
                INNER JOIN hotel AS h ON h.id = r.hotel_id
                INNER JOIN campania AS c ON c.id = h.campania_id
                INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = e.id
                INNER JOIN usuario as u ON u.id = r.usuario_id
                WHERE (u.nombre like "%' . $term . '%" 
                OR u.apellido like "%' . $term . '%" 
                OR u.email like "%' . $term . '%")
                AND ue.usuario_id = ? ';
        
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idUsuario);
        return $this->getList($sqlQuery);
    }
    
    function queryAllUsuariosByDistribuidor($distribuidorId) {
        $sql = 'SELECT distinct u.* FROM usuario_empresa AS ued
                INNER JOIN empresa AS ed ON ed.id = ued.empresa_id
                INNER JOIN campania AS c ON c.empresa_distribuidora_id = ed.id
                INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = e.empresa_distribuidora_id
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = e.id
                INNER JOIN usuario as u ON u.id = ue.usuario_id
                WHERE ued.usuario_id = ? AND u.usuario_grupo_id = 2';

        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($distribuidorId);
        return $this->getList($sqlQuery);
    }
}
?>