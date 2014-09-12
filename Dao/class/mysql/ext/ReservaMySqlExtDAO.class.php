<?php
/**
 * Class that operate on table 'reserva'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-20 16:16
 */
class ReservaMySqlExtDAO extends ReservaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idReserva = 0) {

        if ($idReserva != 0)
            $reserva = $this->load($idReserva);
        else
            $reserva = new Reserva ();
        return $this->mysql->prepare($reserva, $data);
    }
    
    public function queryByUsuarioEmail($value){
        $sql = 'SELECT r.* FROM reserva AS r';
        $sql .= ' INNER JOIN usuario AS u ON u.id = r.usuario_id ';
        $sql .= ' WHERE u.email = ? order by r.tiempo_creacion desc';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->set($value);
        return $this->getList($sqlQuery);
    }
    
    public function queryByUsuarioAprobar($usuarioId, $args = array()){
        $sql = 'SELECT distinct r.* FROM usuario_empresa AS ue
                INNER JOIN campania AS ca 
                  ON ca.empresa_id = ue.empresa_id 
                  OR ue.empresa_id = ca.empresa_distribuidora_id
                INNER JOIN empresa AS ee 
                  ON ca.empresa_id = ee.id 
                  OR (ee.id = ca.empresa_distribuidora_id AND ee.id = ue.empresa_id) 
                  OR ue.empresa_id = ee.id 
                INNER JOIN hotel AS h ON h.campania_id = ca.id
                INNER JOIN reserva AS r ON r.hotel_id = h.id
                WHERE ue.usuario_id = ? AND r.estado = "Pendiente"
                ORDER BY r.tiempo_creacion DESC';
        if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
                
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($usuarioId);
        return $this->getList($sqlQuery);
    }
    
    public function queryByEstado($value, $args = array()){
            $sql = 'SELECT r.* FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    WHERE r.estado = ? ';
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->set($value);
            return $this->getList($sqlQuery);
    }
    
    public function queryByHotelId($value, $args = array()){
            $sql = 'SELECT r.* FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    WHERE r.hotel_id = ?';
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($value);
            return $this->getList($sqlQuery);
    }
    
    public function queryByTerm($term, $idUsuario = 0, $args = array()){
            $sql = 'SELECT DISTINCT r.* FROM reserva AS r '; 
            if($idUsuario) {
                $sql .= ' INNER JOIN hotel AS h ON h.id = r.hotel_id
                          INNER JOIN campania AS c ON c.id = h.campania_id
                          INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id
                          INNER JOIN usuario_empresa AS ue ON ue.empresa_id = e.id';
            }
            $sql .= ' WHERE r.localizador like "%' . $term . '%"';
            if($idUsuario) {
                $sql .= ' AND ue.usuario_id = ?';
            }
            
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= 'LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            
            $sqlQuery = new SqlQuery($sql);
            if($idUsuario) {
                $sqlQuery->setNumber($idUsuario);
            }
            return $this->getList($sqlQuery);
    }
    
    public function queryByUsuarioId($value, $args = array()){
            $sql = 'SELECT DISTINCT r.* FROM reserva AS r
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    WHERE r.usuario_id = ?'; 
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($value);
            return $this->getList($sqlQuery);
    }
    
    public function queryByUsuarioAutenticadoId($value, $args = array()){
            $sql = 'SELECT DISTINCT r.* FROM reserva AS r
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS e ON e.id = ca.empresa_id OR e.id = ca.empresa_distribuidora_id
                    INNER JOIN usuario_empresa AS ue ON ue.empresa_id = e.id
                    INNER JOIN usuario AS uu ON uu.id = ue.usuario_id
                    
                    WHERE uu.id = ?'; 
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($value);
            return $this->getList($sqlQuery);
    }
    
    public function queryByArgs($args = array()){
            $sql = 'SELECT DISTINCT r.* FROM reserva AS r
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id'; 
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            
            return $this->getList($sqlQuery);
    }
    
    public function queryByValidar($idHotel){
            $sql = 'SELECT r.id AS reserva_id, r.tiempo_creacion AS reserva_tiempoCreacion, r.localizador AS reserva_localizador, 
                    r.estado AS reserva_estado, r.total AS reserva_total,                    
                    m.id as moneda_id, m.nombre AS moneda_nombre, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo,
                    h.nombre AS reserva_hotel,
                    u.nombre AS usuario_nombre, u.apellido AS usuario_apellido,
                    rp.nombre AS producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.tipo AS producto_tipo,
                    rp.inicio AS producto_inicio, rp.final AS producto_final,
                    rp.precio_unitario AS producto_precioUnitario,
                    rp.adultos AS producto_adultos, rp.ninios AS producto_ninios,
                    rpa.id AS pago_id, rpa.importe AS pago_importe,
                    rpa.estado AS pago_estado, rpa.validada AS pago_validado
                    FROM reserva AS r 
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    LEFT JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    WHERE r.hotel_id = ? AND UNIX_TIMESTAMP(rp.inicio) < UNIX_TIMESTAMP("' . date('Y-m-d') .'")
                    AND r.estado = "Aprobada"
                    ORDER BY r.tiempo_creacion DESC';
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($idHotel);
            return $this->execute($sqlQuery);
    }
    
    public function queryByEmptyPax() {
            $sql = 'SELECT distinct ra.id, c.apartamento as apartamento
                    FROM reserva_producto AS ra
                    INNER JOIN reserva AS r ON r.id = ra.reserva_id
                    INNER JOIN shopping_cart AS c ON c.id = r.cart_id
                    WHERE ra.tipo = "apartamento" AND ra.adultos IS NULL AND ra.ninios IS NULL';
            $sqlQuery = new SqlQuery($sql);
            return $this->execute($sqlQuery);
    }
    
    public function queryByValidadas($idHotel){
            $sql = 'SELECT r.id AS reserva_id, r.tiempo_creacion AS reserva_tiempoCreacion, r.localizador AS reserva_localizador, 
                    r.estado AS reserva_estado, r.total AS reserva_total,                    
                    m.id as moneda_id, m.nombre AS moneda_nombre, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo,
                    h.nombre AS reserva_hotel,
                    u.nombre AS usuario_nombre, u.apellido AS usuario_apellido,
                    rp.nombre AS producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.tipo AS producto_tipo,
                    rp.inicio AS producto_inicio, rp.final AS producto_final,
                    rp.precio_unitario AS producto_precioUnitario,
                    rp.adultos AS producto_adultos, rp.ninios AS producto_ninios,
                    rpa.id AS pago_id, rpa.importe AS pago_importe,
                    rpa.estado AS pago_estado, rpa.validada AS pago_validado
                    FROM reserva AS r 
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    LEFT JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    WHERE r.hotel_id = ? AND UNIX_TIMESTAMP(rp.inicio) < UNIX_TIMESTAMP("' . date('Y-m-d') .'")
                    AND r.estado = "Stayed"
                    ORDER BY r.tiempo_creacion DESC';
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($idHotel);
            return $this->execute($sqlQuery);
    }
    
    /* optimized queries */
    public function showByHotelId($value, $args = array()){
            $sql = 'SELECT DISTINCT r.id, r.tiempo_creacion AS tiempoCreacion, r.estado, r.localizador,
                    h.id as hotel_id, h.nombre as hotel_nombre, 
                    u.id as usuario_id, u.nombre as usuario_nombre, u.apellido as usuario_apellido, u.email as usuario_email,
                    rp.id as producto_id, rp.nombre as producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.precio_unitario as producto_precioUnitario, rp.inicio as producto_inicio, rp.final as producto_final, 
                    m.id AS moneda_id, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo, m.tasa_cambio AS moneda_tasaCambio,
                    ca.id AS campania_id, ca.nombre AS campania_nombre, ca.porcentaje_beneficio AS campania_porcentajeBeneficio,
                    dist.id AS distribuidor_id, dist.nombre_fiscal AS distribuidor_nombreFiscal, dist.porcentaje_beneficio AS distribuidor_porcentajeBeneficio,
                    rpa.op AS op, rpa.op_devolucion AS opDevolucion
                    FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS dist ON dist.id = ca.empresa_distribuidora_id
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    WHERE r.hotel_id = ?';
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%" OR
                            rpa.op like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if($args['showByOp']) {
                $sql .= ' AND rpa.op IS NOT NULL  AND rpa.op <> "" ';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'] . ', r.id ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($value);
            return $this->execute($sqlQuery);
    }
    
    public function showByEstado($value, $args = array()){
            $sql = 'SELECT DISTINCT r.id, r.tiempo_creacion as tiempoCreacion, r.estado, r.localizador, 
                    h.id as hotel_id, h.nombre as hotel_nombre, 
                    u.id as usuario_id, u.nombre as usuario_nombre, u.apellido as usuario_apellido, u.email as usuario_email,
                    rp.id as producto_id, rp.nombre as producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.precio_unitario as producto_precioUnitario, rp.inicio as producto_inicio, rp.final as producto_final, 
                    m.id AS moneda_id, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo, m.tasa_cambio AS moneda_tasaCambio,
                    ca.id AS campania_id, ca.nombre AS campania_nombre, ca.porcentaje_beneficio AS campania_porcentajeBeneficio,
                    dist.id AS distribuidor_id, dist.nombre_fiscal AS distribuidor_nombreFiscal, dist.porcentaje_beneficio AS distribuidor_porcentajeBeneficio,
                    rpa.op AS op, rpa.op_devolucion AS opDevolucion
                    FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS dist ON dist.id = ca.empresa_distribuidora_id
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    WHERE r.estado = ? ';
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%" OR
                            rpa.op like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if($args['showByOp']) {
                $sql .= ' AND rpa.op IS NOT NULL AND rpa.op <> ""  ';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'] . ', r.id ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->set($value);
            return $this->execute($sqlQuery);
    }
    
    public function showByUsuarioId($value, $args = array()){
            $sql = 'SELECT DISTINCT r.id, r.tiempo_creacion as tiempoCreacion, r.estado, r.localizador, 
                    h.id as hotel_id, h.nombre as hotel_nombre, 
                    u.id as usuario_id, u.nombre as usuario_nombre, u.apellido as usuario_apellido, u.email as usuario_email,
                    rp.id as producto_id, rp.nombre as producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.precio_unitario as producto_precioUnitario, rp.inicio as producto_inicio, rp.final as producto_final, 
                    m.id AS moneda_id, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo, m.tasa_cambio AS moneda_tasaCambio,
                    ca.id AS campania_id, ca.nombre AS campania_nombre, ca.porcentaje_beneficio AS campania_porcentajeBeneficio,
                    dist.id AS distribuidor_id, dist.nombre_fiscal AS distribuidor_nombreFiscal, dist.porcentaje_beneficio AS distribuidor_porcentajeBeneficio,
                    rpa.op AS op, rpa.op_devolucion AS opDevolucion
                    FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS dist ON dist.id = ca.empresa_distribuidora_id
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    WHERE r.usuario_id = ?'; 
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%" OR
                            rpa.op like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if($args['showByOp']) {
                $sql .= ' AND rpa.op IS NOT NULL  AND rpa.op <> "" ';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'] . ', r.id ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($value);
            return $this->execute($sqlQuery);
    }
    
    public function showById($id){
            $sql = 'SELECT r.id, r.tiempo_creacion as tiempoCreacion, r.estado, r.localizador, 
                    h.id as hotel_id, h.nombre as hotel_nombre, 
                    u.id as usuario_id, u.nombre as usuario_nombre, u.apellido as usuario_apellido, u.email as usuario_email,
                    rp.id as producto_id, rp.nombre as producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.precio_unitario as producto_precioUnitario, rp.inicio as producto_inicio, rp.final as producto_final, 
                    m.id AS moneda_id, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo, m.tasa_cambio AS moneda_tasaCambio,
                    ca.id AS campania_id, ca.nombre AS campania_nombre, ca.porcentaje_beneficio AS campania_porcentajeBeneficio,
                    dist.id AS distribuidor_id, dist.nombre_fiscal AS distribuidor_nombreFiscal, dist.porcentaje_beneficio AS distribuidor_porcentajeBeneficio,
                    rpa.op AS op, rpa.op_devolucion AS opDevolucion
                    FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS dist ON dist.id = ca.empresa_distribuidora_id
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    WHERE r.id = ?'; 
            
            
            
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($id);
            return $this->execute($sqlQuery);
    }
    
    public function showByUsuarioAutenticadoId($value, $args = array()){
            $sql = 'SELECT DISTINCT r.id, r.tiempo_creacion as tiempoCreacion, r.estado, r.localizador, 
                    h.id as hotel_id, h.nombre as hotel_nombre, 
                    u.id as usuario_id, u.nombre as usuario_nombre, u.apellido as usuario_apellido, u.email as usuario_email,
                    rp.id as producto_id, rp.nombre as producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.precio_unitario as producto_precioUnitario, rp.inicio as producto_inicio, rp.final as producto_final, 
                    m.id AS moneda_id, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo, m.tasa_cambio AS moneda_tasaCambio,
                    ca.id AS campania_id, ca.nombre AS campania_nombre, ca.porcentaje_beneficio AS campania_porcentajeBeneficio,
                    dist.id AS distribuidor_id, dist.nombre_fiscal AS distribuidor_nombreFiscal, dist.porcentaje_beneficio AS distribuidor_porcentajeBeneficio,
                    rpa.op AS op, rpa.op_devolucion AS opDevolucion
                    FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS dist ON dist.id = ca.empresa_distribuidora_id
                    
                    INNER JOIN empresa AS emp ON emp.id = ca.empresa_id OR emp.id = ca.empresa_distribuidora_id
                    INNER JOIN usuario_empresa AS ue ON ue.empresa_id = emp.id
                    INNER JOIN usuario AS uu ON uu.id = ue.usuario_id
                    
                    WHERE uu.id = ?'; 
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%" OR 
                            rpa.op like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if($args['showByOp']) {
                $sql .= ' AND rpa.op IS NOT NULL AND rpa.op <> ""  ';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion  ' . $args['sSortDir_0'] . ', r.id ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($value);
            return $this->execute($sqlQuery);
    }
    
    public function showByArgs($args = array()){
            $sql = 'SELECT DISTINCT r.id, r.tiempo_creacion as tiempoCreacion, r.estado, r.localizador, 
                    h.id as hotel_id, h.nombre as hotel_nombre, 
                    u.id as usuario_id, u.nombre as usuario_nombre, u.apellido as usuario_apellido, u.email as usuario_email,
                    rp.id as producto_id, rp.nombre as producto_nombre, rp.porciento_inicial AS producto_porcientoInicial, rp.precio_unitario as producto_precioUnitario, rp.inicio as producto_inicio, rp.final as producto_final, 
                    m.id AS moneda_id, m.simbolo AS moneda_simbolo, m.codigo AS moneda_codigo, m.tasa_cambio AS moneda_tasaCambio,
                    ca.id AS campania_id, ca.nombre AS campania_nombre, ca.porcentaje_beneficio AS campania_porcentajeBeneficio,
                    dist.id AS distribuidor_id, dist.nombre_fiscal AS distribuidor_nombreFiscal, dist.porcentaje_beneficio AS distribuidor_porcentajeBeneficio,
                    rpa.op AS op, rpa.op_devolucion AS opDevolucion
                    FROM reserva AS r 
                    INNER JOIN hotel AS h ON h.id = r.hotel_id
                    INNER JOIN usuario AS u ON u.id = r.usuario_id
                    INNER JOIN reserva_producto AS rp ON rp.reserva_id = r.id AND rp.tipo = "apartamento"
                    INNER JOIN moneda AS m ON m.id = r.moneda_id
                    INNER JOIN campania AS ca ON ca.id = h.campania_id
                    INNER JOIN empresa AS dist ON dist.id = ca.empresa_distribuidora_id 
                    LEFT JOIN reserva_pago AS rpa ON rpa.reserva_id = r.id '; 
                    
            if(isset($args['sSearch']) && strlen($args['sSearch'])) {
                $sql .= ' AND ( 
                            r.localizador like "%' . $args['sSearch'] . '%" OR
                            h.nombre like "%' . $args['sSearch'] . '%" OR
                            u.apellido like "%' . $args['sSearch'] . '%" OR
                            u.nombre like "%' . $args['sSearch'] . '%" OR
                            r.estado like "%' . $args['sSearch'] . '%" OR
                            rpa.op like "%' . $args['sSearch'] . '%" OR
                            rpa.op_devolucion like "%' . $args['sSearch'] . '%"
                        )';
            }
            
            if($args['showByOp']) {
                $sql .= ' AND rpa.op IS NOT NULL AND rpa.op <> "" ';
            }
            
            if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY r.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY u.nombre ' . $args['sSortDir_0'] . ', u.apellido ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY rp.inicio ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY rp.final ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY r.tiempo_creacion ' . $args['sSortDir_0'] . ', r.id ' . $args['sSortDir_0'];
                        break;
                    case '6':
                        $sql .= ' ORDER BY r.total ' . $args['sSortDir_0'];
                        break;
                    case '7':
                        $sql .= ' ORDER BY r.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY r.tiempo_creacion DESC';
            if($args['iDisplayLength'] && $args['iDisplayLength'] != '-1')
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
            $sqlQuery = new SqlQuery($sql);
            
            return $this->execute($sqlQuery);
    }
    
    function countByYear($year, $reservaId = 0) {
        $sql = 'SELECT COUNT(r.id) FROM reserva AS r 
                WHERE UNIX_TIMESTAMP(r.tiempo_creacion) BETWEEN 
                UNIX_TIMESTAMP("' . $year . '-01-01") AND UNIX_TIMESTAMP("' . ($year + 1) . '-01-01")';
        if($reservaId) {
            $sql .= ' AND r.id < ?';
        }
        $sqlQuery = new SqlQuery($sql);
        if($reservaId) {
            $sqlQuery->setNumber($reservaId);
        }
        return $this->execute($sqlQuery);
    }
    
    
}
?>