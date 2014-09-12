<?php
/**
 * Class that operate on table 'factura'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-05-02 14:44
 */
class FacturaMySqlExtDAO extends FacturaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Factura ();
        return $this->mysql->prepare($obj, $data);
    }
    
    public function queryByArgs($args = array()){
            $sql = 'SELECT DISTINCT f.id, h.nombre as hotel, h.id AS hotelId, f.tiempo_creacion as tiempoCreacion,
                    f.total, f.comision, f.estado, f.numero, f.cliente, m.simbolo  as moneda
                    FROM factura AS f
                    INNER JOIN hotel AS h ON h.id = f.hotel_id
                    INNER JOIN moneda AS m ON m.id = f.moneda_id
                    INNER JOIN factura_reserva AS fr ON fr.factura_id = f.id
                    INNER JOIN reserva AS r ON fr.reserva_id = r.id
                    INNER JOIN usuario AS u ON r.usuario_id = u.id
                    WHERE 1=1 '; 
            if(isset($args['sSearch']) && strlen($args['sSearch']) && $args['sSearch']!='hotel' && $args['sSearch']!='usuario') {
                $sql .= '  AND ( 
                            f.id like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            f.numero like "%' . $args['sSearch'] . '%" OR
                            f.estado like "%' . $args['sSearch'] . '%" OR
                            f.cliente like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            concat_ws(" ",u.nombre,u.apellido)  like "%' . $args['sSearch'] . '%" OR
                            r.localizador like "%' . $args['sSearch'] . '%" 
                        )';
            }else if($args['sSearch']=='hotel' || $args['sSearch']=='usuario'){
                $sql .= " AND f.cliente = '".$args['sSearch']."'";
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY f.numero ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY f.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    /*case '3':
                        $sql .= ' ORDER BY f.total ' . $args['sSortDir_0'];
                        break;*/
                    case '4':
                        $sql .= ' ORDER BY f.total ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY f.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY f.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            return $this->execute($sqlQuery);
    }
    
    public function countByArgs($args = array()){
            $sql = 'SELECT DISTINCT COUNT(f.id)
                    FROM factura AS f
                    INNER JOIN hotel AS h ON h.id = f.hotel_id
                    INNER JOIN moneda AS m ON m.id = f.moneda_id
                    INNER JOIN factura_reserva AS fr ON fr.factura_id = f.id
                    INNER JOIN reserva AS r ON fr.reserva_id = r.id
                    INNER JOIN usuario AS u ON r.usuario_id = u.id
                    WHERE 1=1 '; 
           if(isset($args['sSearch']) && strlen($args['sSearch']) && $args['sSearch']!='hotel' && $args['sSearch']!='usuario') {
                $sql .= '  AND ( 
                            f.id like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            f.estado like "%' . $args['sSearch'] . '%" OR
                            f.cliente like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            r.localizador like "%' . $args['sSearch'] . '%" 
                        )';
            }else if($args['sSearch']=='hotel' || $args['sSearch']=='usuario'){
                $sql .= " AND f.cliente = '".$args['sSearch']."'";
            }
            
            
            $sql .= ' ORDER BY f.tiempo_creacion DESC';
            
            $sqlQuery = new SqlQuery($sql);
            return $this->execute($sqlQuery);
    }

    function countByYear($year, $contrato = false) {
        $sql = 'SELECT COUNT(f.id) FROM factura AS f 
                WHERE UNIX_TIMESTAMP(f.tiempo_creacion) BETWEEN 
                UNIX_TIMESTAMP("' . $year . '-01-01") AND UNIX_TIMESTAMP("' . ($year + 1) . '-01-01")';
        if($contrato) {
            $sql .= " AND f.contrato = '".$contrato."'";
        }
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }

}
?>