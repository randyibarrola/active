<?php
/**
 * Class that operate on table 'evento'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-13 06:57
 */
class EventoMySqlExtDAO extends EventoMySqlDAO{
    
    private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idEvento = 0) {

        if ($idEvento != 0)
            $evento = $this->load($idEvento);
        else
            $evento = new Evento();
        return $this->mysql->prepare($evento, $data);
    }
    
    public function queryByUsuarioId($id) {
        $sql = 'SELECT DISTINCT e.* FROM evento AS e ';
        $sql .= ' INNER JOIN campania AS c ON c.id = e.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' WHERE ue.usuario_id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($id);
        return $this->getList($sqlQuery);
    }
    
    public function queryUsuarioEvento($idUsuario, $idEvento) {
        $sql = 'SELECT DISTINCT e.* FROM evento AS e ';
        $sql .= ' INNER JOIN campania AS c ON c.id = e.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' WHERE ue.usuario_id = ? AND e.id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idUsuario);
        $sqlQuery->setNumber($idEvento);
        return $this->getList($sqlQuery);
    }
	
}
?>