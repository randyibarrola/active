<?php
/**
 * Class that operate on table 'busqueda_disponibilidad'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-03-31 18:20
 */
class BusquedaDisponibilidadMySqlExtDAO extends BusquedaDisponibilidadMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new BusquedaDisponibilidad ();
        return $this->mysql->prepare($obj, $data);
    }
    
    function queryByArgs($args = array()) {
        $sql = 'SELECT h.nombre AS hotel, b.tiempo_creacion, b.inicio, b.fin, b.id
                FROM busqueda_disponibilidad AS b
                INNER JOIN hotel AS h ON h.id = b.hotel_id ';
        if($args['sSearch'] && strlen(trim($args['sSearch']))) {
            $sql .= ' WHERE h.nombre like "%' . $args['sSearch'] . '%" ';
        }
        
        if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY b.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY b.inicio ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY b.fin ' . $args['sSortDir_0'];
                        break;
                    
                }
            } else 
                $sql .= ' ORDER BY b.tiempo_creacion DESC';
            
            if($args['iDisplayLength'])
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
       
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
    
    function countByArgs($args = array()) {
        $sql = 'SELECT count(b.id)
                FROM busqueda_disponibilidad AS b
                INNER JOIN hotel AS h ON h.id = b.hotel_id ';
        if($args['sSearch'] && strlen(trim($args['sSearch']))) {
            $sql .= ' WHERE h.nombre like "%' . $args['sSearch'] . '%" ';
        }
        
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
}
?>