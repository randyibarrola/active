<?php
/**
 * Class that operate on table 'hotel'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class HotelMySqlExtDAO extends HotelMySqlDAO{

    private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idHotel = 0) {

        if ($idHotel != 0)
            $hotel = $this->load($idHotel);
        else
            $hotel = new Hotel();
        return $this->mysql->prepare($hotel, $data);
    }
    
    public function queryByUsuarioId($id) {
        $sql = 'SELECT DISTINCT h.* FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' WHERE ue.usuario_id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($id);
        return $this->getList($sqlQuery);
    }
    
    public function queryUsuarioHotel($idUsuario, $idHotel) {
        $sql = 'SELECT DISTINCT h.* FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' WHERE ue.usuario_id = ? AND h.id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idUsuario);
        $sqlQuery->setNumber($idHotel);
        return $this->getList($sqlQuery);
    }

    public function queryFavoritos() {
        $sql = 'SELECT DISTINCT h.* FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' WHERE h.destacado = 1';

        $sqlQuery = new SqlQuery($sql);
        return $this->getList($sqlQuery);
    }
    
    public function queryByUsuarioIdAndDestinoId($idUsuario, $idDestino) {
        $sql = 'SELECT DISTINCT h.* FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' WHERE ue.usuario_id = ? AND h.destino_id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idUsuario);
        $sqlQuery->setNumber($idDestino);
        return $this->getList($sqlQuery);
    }
    
    public function queryByTerm($term, $usuarioId = 0){
        $sql = 'SELECT DISTINCT h.* FROM hotel AS h ';
        if($usuarioId) {
            $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id';
            $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
            $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        }
        $sql .= ' WHERE h.nombre like "%' . $term . '%" ';
        if($usuarioId) {
            $sql .= ' AND ue.usuario_id = ?';
        }
        $sqlQuery = new SqlQuery($sql);
        if($usuarioId) {
            $sqlQuery->setNumber($usuarioId);
        }
        return $this->getList($sqlQuery);
    }
    
    public function queryByCampaniasActivas($term = '', $start = 0, $limit = 0, $exceptId = 0, $args = array()) {
        $sql = '  SELECT DISTINCT h.id AS hotel_id, h.url AS hotel_url, 
                  h.nombre AS hotel_nombre, 
                  h.descripcion_larga as hotel_descripcion,
                  h.calidad AS hotel_calidad,
                  c.subdominio AS hotel_dominio,
                  d.id AS destino_id, d.nombre AS destino_nombre,
                  a.id AS archivo_id, a.ruta AS archivo_ruta,
                  hp.precio_minimo AS precio_precioMinimo,
                  hp.inicio as precio_inicio, hp.fin as precio_fin,
                  m.codigo AS moneda_codigo, m.simbolo AS moneda_simbolo,
                  m.nombre AS moneda_nombre, m.tasa_cambio AS moneda_tasaCambio,
                  dir.lat AS hotel_lat, dir.lon AS hotel_lon
                  FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id
                  LEFT JOIN destino_turistico AS d ON d.id = h.destino_id
                  LEFT JOIN hotel_archivo AS ha ON ha.hotel_id = h.id
                  LEFT JOIN archivo AS a ON a.id = ha.archivo_id
                  LEFT JOIN hotel_precio AS hp ON hp.hotel_id = h.id
                  LEFT JOIN moneda AS m ON m.id = hp.moneda_id
                  LEFT JOIN hotel_direccion AS hd ON hd.hotel_id = h.id
                  LEFT JOIN direccion AS dir ON dir.id = hd.direccion_id OR dir.id = d.direccion_id';
        $sql .= ' WHERE c.estado = ? AND h.id <> ?';
        if(strlen(trim($term))) {
            $sql .= " AND (
                      h.nombre like '%$term%' OR d.nombre like '%$term%'
                        )
                    ";
        }
        
        if($args['precio']) {
            $sql .= ' AND hp.precio_minimo <= ? ';
        }
        
        if($args['estrellas']) {
            $sql .= ' AND h.calidad = ? ';
        }
        
        if($limit) {
            $sql .= " GROUP BY h.id, h.destacado DESC LIMIT $start, $limit";
        }
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->set('Aprobada');
        $sqlQuery->setNumber($exceptId);
        if($args['precio']) {
            $sqlQuery->setNumber($args['precio']);
        }
        if($args['estrellas']) {
            $sqlQuery->setNumber($args['estrellas']);
        }
        return $this->execute($sqlQuery);
    }
    
    public function countByCampaniasActivas($term, $exceptId = 0, $args = array()) {
        
        $sql = '  SELECT COUNT(DISTINCT h.id)
                  FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id
                  LEFT JOIN destino_turistico AS d ON d.id = h.destino_id
                  LEFT JOIN hotel_archivo AS ha ON ha.hotel_id = h.id
                  LEFT JOIN archivo AS a ON a.id = ha.archivo_id
                  LEFT JOIN hotel_precio AS hp ON hp.hotel_id = h.id
                  LEFT JOIN moneda AS m ON m.id = hp.moneda_id
                  LEFT JOIN hotel_direccion AS hd ON hd.hotel_id = h.id
                  LEFT JOIN direccion AS dir ON dir.id = hd.direccion_id OR dir.id = d.direccion_id';
        $sql .= ' WHERE c.estado = ? AND h.id <> ?';
        if(strlen(trim($term))) {
            $sql .= " AND (
                      h.nombre like '%$term%' OR d.nombre like '%$term%'
                        )
                    ";
        }
        
        if($args['precio']) {
            $sql .= ' AND hp.precio_minimo <= ? ';
        }
        
        if($args['estrellas']) {
            $sql .= ' AND h.calidad = ? ';
        }
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->set('Aprobada');
        $sqlQuery->setNumber($exceptId);
        if($args['precio']) {
            $sqlQuery->setNumber($args['precio']);
        }
        if($args['estrellas']) {
            $sqlQuery->setNumber($args['estrellas']);
        }
        return $this->execute($sqlQuery);
    }
    
    public function preciosMinimosByCampaniasActivas($term, $exceptId = 0) {
        $sql = '  SELECT DISTINCT hp.precio_minimo as precio, m.codigo, m.simbolo
                  FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id
                  LEFT JOIN destino_turistico AS d ON d.id = h.destino_id
                  INNER JOIN hotel_precio AS hp ON hp.hotel_id = h.id
                  INNER JOIN moneda AS m ON m.id = hp.moneda_id';
        $sql .= ' WHERE c.estado = ? AND h.id <> ?';
        if(strlen(trim($term))) {
            $sql .= " AND (
                      h.nombre = '$term' OR d.nombre = '$term'
                        )
                    ";
        }
        
        $sql .= ' ORDER BY hp.precio_minimo ASC';
        
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->set('Aprobada');
        $sqlQuery->setNumber($exceptId);
        return $this->execute($sqlQuery);
    }
    
    public function estrellasByCampaniasActivas($term, $exceptId = 0) {
        $sql = '  SELECT DISTINCT h.calidad
                  FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id
                  LEFT JOIN destino_turistico AS d ON d.id = h.destino_id
                  INNER JOIN hotel_precio AS hp ON hp.hotel_id = h.id
                  INNER JOIN moneda AS m ON m.id = hp.moneda_id';
        $sql .= ' WHERE c.estado = ? AND h.id <> ? AND h.calidad > 0';
        if(strlen(trim($term))) {
            $sql .= " AND (
                      h.nombre = '$term' OR d.nombre = '$term'
                        )
                    ";
        }
        
        $sql .= ' ORDER BY h.calidad ASC';
        
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->set('Aprobada');
        $sqlQuery->setNumber($exceptId);
        return $this->execute($sqlQuery);
    }
    
    public function locationsByCampaniasActivas($term) {
        $sql = '  SELECT distinct hh.id, hh.nombre, dir.lat, dir.lon
                  FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id
                  LEFT JOIN destino_turistico AS d ON d.id = h.destino_id
                  LEFT JOIN hotel AS hh ON hh.destino_id = d.id
                  LEFT JOIN hotel_direccion AS hd ON hd.hotel_id = hh.id
                  LEFT JOIN direccion AS dir ON dir.id = hd.direccion_id ';
        $sql .= ' WHERE c.estado = ? ';
        if(strlen(trim($term))) {
            $sql .= " AND (
                      h.nombre = '$term' OR d.nombre = '$term'
                        )
                    ";
        }
        $sql .= ' GROUP BY hh.id';
        
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->set('Aprobada');
        return $this->execute($sqlQuery);
    }
    
    public function filterByDestinoAndUsuario($usuarioId = 0, $destinoId = 0, $args = array()) {
        $sql = 'SELECT DISTINCT h.id, h.nombre, d.id AS destino_id, d.nombre AS destino, 
                c.inicio, c.fin, h.email_reservas, h.telefono_reservas, 
                c.subdominio, h.destacado, h.clave_google_analytics 
                FROM hotel AS h ';
        $sql .= ' INNER JOIN campania AS c ON c.id = h.campania_id';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' LEFT JOIN destino_turistico AS d ON d.id = h.destino_id ';
        $sql .= ' WHERE c.estado = "Aprobada" AND (ue.usuario_id = ? OR ' . $usuarioId . ' = 0)  AND (h.destino_id = ? OR ' . $destinoId . ' = 0 )';
        if($args['findDestacados']) {
            $sql .= ' AND h.destacado = 1 ';
        }
        if(isset($args['sSearch']) && strlen($args['sSearch'])) {
            $sql .= ' AND (
                      h.nombre like "%' . $args['sSearch'] . '%" OR
                      d.nombre like "%' . $args['sSearch'] . '%" OR
                     
                      h.email_reservas like "%' . $args['sSearch'] . '%" OR
                      h.telefono_reservas like "%' . $args['sSearch'] . '%"
                    )';
        }
        if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY h.nombre ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY d.nombre ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY c.inicio ' . $args['sSortDir_0'] . ', c.fin ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY h.email_reservas ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY h.telefono_reservas ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY h.tiempo_creacion DESC';
            
            if($args['iDisplayLength'])
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
       
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($usuarioId);
        $sqlQuery->setNumber($destinoId);
        return $this->execute($sqlQuery);
    }
	
}
?>