<?php
/**
 * Class that operate on table 'reserva_afiliado'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-13 08:07
 */
class ReservaAfiliadoMySqlExtDAO extends ReservaAfiliadoMySqlDAO{
	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idReservaAfiliado = 0) {
        if ($idReservaAfiliado != 0)
            $reservaAfiliado = $this->load($idReservaAfiliado);
        else
            $reservaAfiliado = new ReservaAfiliado();
        return $this->mysql->prepare($reservaAfiliado, $data);
    }

    function queryByArgs($args = array()) {
        $sql = 'SELECT DISTINCT ra.*, r.*, h.nombre AS hotel, rp.inicio AS fecha_inicio, rp.final AS fecha_final FROM reserva_afiliado AS ra ';
        $sql .= ' INNER JOIN reserva AS r on ra.reserva_id = r.id';
        $sql .= ' INNER JOIN reserva_producto AS rp on rp.reserva_id = r.id';
        $sql .= ' INNER JOIN hotel AS h on r.hotel_id = h.id';
        $sql .= ' WHERE 1 ';
        if(isset($args['sSearch']) && strlen($args['sSearch'])) {
            $sql .= ' AND (
                      ra.comision like "%' . $args['sSearch'] . '%" OR
                      r.localizador like "%' . $args['sSearch'] . '%" OR
                      h.nombre like "%' . $args['sSearch'] . '%" OR
                      ra.porcentaje like "%' . $args['sSearch'] . '%"
                    )';
        }
        if(isset($args['afiliadoId']) && is_numeric($args['afiliadoId'])){
            $sql .= ' AND ra.afiliado_id='.$args['afiliadoId'];
        }

        if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY ra.porcentaje ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY ra.comision ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            
            if($args['iDisplayLength'])
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
       
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
    
    function countByArgs($args = array()) {
        $sql = 'SELECT COUNT(ra.id) FROM reserva_afiliado AS ra ';
        
        $sql .= ' WHERE 1 ';
        if(isset($args['sSearch']) && strlen($args['sSearch'])) {
            $sql .= ' AND (
                      ra.comision like "%' . $args['sSearch'] . '%" OR
                      ra.porcentaje like "%' . $args['sSearch'] . '%"
                    )';
        }
        if(isset($args['afiliadoId']) && is_numeric($args['afiliadoId'])){
            $sql .= ' AND ra.afiliado_id='.$args['afiliadoId'];
        }
        
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
}
?>