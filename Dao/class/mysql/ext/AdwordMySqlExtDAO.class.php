<?php
/**
 * Class that operate on table 'adword'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-04-13 19:58
 */
class AdwordMySqlExtDAO extends AdwordMySqlDAO{

    private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idData = 0) {

        if ($idData != 0)
            $row = $this->load($idData);
        else
            $row = new Adword();
        return $this->mysql->prepare($row, $data);
    }
    
    function queryByArgs($args = array()) {
        $sql = 'SELECT DISTINCT a.* FROM adword AS a ';
        
        $sql .= ' WHERE 1=1 ';
        if(isset($args['sSearch']) && strlen($args['sSearch'])) {
            $sql .= ' AND (
                      a.nombre_campania like "%' . $args['sSearch'] . '%" OR
                      a.presupuesto like "%' . $args['sSearch'] . '%"
                    )';
        }
        if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY a.nombre_campania ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY a.presupuesto ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY a.inicio ' . $args['sSortDir_0'] . ', a.fin ' . $args['sSortDir_0'];
                        break;
                    
                }
            } else 
                $sql .= ' ORDER BY a.tiempo_creacion DESC';
            
            if($args['iDisplayLength'])
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
       
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
    
    function countByArgs($args = array()) {
        $sql = 'SELECT COUNT(a.id) FROM adword AS a ';
        
        $sql .= ' WHERE 1=1 ';
        if(isset($args['sSearch']) && strlen($args['sSearch'])) {
            $sql .= ' AND (
                      a.nombre_campania like "%' . $args['sSearch'] . '%" OR
                      a.presupuesto like "%' . $args['sSearch'] . '%"
                    )';
        }
        
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
    
    function queryByCampania($term) {
        $sql = 'SELECT a.* FROM adword AS a ';
        
        $sql .= ' WHERE a.nombre_campania like "%' . $term . '%"';
        
        $sqlQuery = new SqlQuery($sql);
        return $this->getList($sqlQuery);
    }
}
?>