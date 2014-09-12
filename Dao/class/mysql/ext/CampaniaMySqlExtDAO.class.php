<?php
/**
 * Class that operate on table 'campania'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-24 13:44
 */
class CampaniaMySqlExtDAO extends CampaniaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Campania ();
        return $this->mysql->prepare($obj, $data);
    }
    
    public function queryByUsuarioId($value){
		$sql = 'SELECT DISTINCT c.* FROM campania AS c ';
                $sql .= ' INNER JOIN empresa AS e ON c.empresa_id = e.id ';
                $sql .= ' INNER JOIN usuario_empresa AS ue ON ue.empresa_id = e.id ';
                $sql .= ' WHERE ue.usuario_id = ? GROUP BY c.id';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

    public function queryByDistribuidorId($value){
        $sql = 'SELECT DISTINCT c.* FROM campania AS c 
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = c.empresa_distribuidora_id
                WHERE ue.usuario_id = ? GROUP BY c.id';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($value);
        return $this->getList($sqlQuery);
    }
    
    public function queryByDistribuidorIdORUsuarioId($value){
        $sql = 'SELECT DISTINCT c.* FROM campania AS c 
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = c.empresa_distribuidora_id OR ue.empresa_id = c.empresa_id
                WHERE ue.usuario_id = ? GROUP BY c.id';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($value);
        return $this->getList($sqlQuery);
    }
        
        public function queryByTerm($term, $usuarioId = 0, $tipo="hotel"){
		$sql = 'SELECT DISTINCT c.* FROM campania AS c ';
                if($usuarioId) {
                    $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
                    $sql .= ' INNER JOIN usuario_empresa AS ue ON ue.empresa_id = e.id ';
                }
                $sql .= ' WHERE c.estado = "Aprobada" AND (';
                $sql .= ' c.nombre like "%' . $term .'%" OR ';
                $sql .= ' c.localizador like "%' . $term .'%" )';
                $sql .= ' AND c.tipo = ?';
                

                if($usuarioId) {
                    $sql .= ' AND ue.usuario_id = ?';
                }
		      $sqlQuery = new SqlQuery($sql);
              $sqlQuery->set($tipo);
                if($usuarioId) {
                    $sqlQuery->setNumber($usuarioId);
                }
                
		return $this->getList($sqlQuery);
	}
        
        public function getDominiosLike($hotel){
		$sql = 'SELECT subdominio FROM campania ';
                $sql .= ' WHERE subdominio like "%' . $hotel . '"';
		$sqlQuery = new SqlQuery($sql);
		return $this->execute($sqlQuery);
	}
        
    public function queryByDistribuidorIdAndDestino($idUsuario, $idDestino){
        $sql = 'SELECT DISTINCT c.* FROM campania AS c 
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = c.empresa_distribuidora_id
                INNER JOIN hotel AS h ON h.campania_id = c.id
                WHERE ue.usuario_id = ? AND h.destino_id = ? GROUP BY c.id';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idUsuario);
        $sqlQuery->setNumber($idDestino);
        return $this->getList($sqlQuery);
    }
    
    public function queryByDistribuidorIdORUsuarioIdAndDestinoId($idUsuario, $idDestino){
        $sql = 'SELECT distinct c.* FROM campania AS c 
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = c.empresa_distribuidora_id OR ue.empresa_id = c.empresa_id
                INNER JOIN hotel AS h ON h.campania_id = c.id
                WHERE ue.usuario_id = ? AND h.destino_id = ? GROUP BY c.id';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idUsuario);
        $sqlQuery->setNumber($idDestino);
        return $this->getList($sqlQuery);
    }
    
    public function queryByDestinoId($idDestino){
        $sql = 'SELECT DISTINCT c.* FROM campania AS c 
                INNER JOIN usuario_empresa AS ue ON ue.empresa_id = c.empresa_distribuidora_id
                INNER JOIN hotel AS h ON h.campania_id = c.id
                WHERE h.destino_id = ? GROUP BY c.id';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($idDestino);
        return $this->getList($sqlQuery);
    }
    
    public function queryHotelesActivos($term){
        $sql = 'SELECT distinct h.nombre, "hotel" as tipo, c.subdominio as url 
                from campania as c
                inner join hotel as h on c.id = h.campania_id
                where h.nombre like "%' . $term . '%"
                and c.estado = "Aprobada"';
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
    
    public function queryDestinosHotelesActivos($term){
        $sql = 'SELECT distinct d.nombre, "destino" as tipo from campania as c
                inner join hotel as h on c.id = h.campania_id
                inner join destino_turistico as d on d.id = h.destino_id
                where d.nombre like "%' . $term . '%"
                and c.estado = "Aprobada"';
        $sqlQuery = new SqlQuery($sql);
        return $this->execute($sqlQuery);
    }
    
    public function filterByDestinoAndUsuario($usuarioId = 0, $destinoId = 0, $args = array()) {
        $sql = 'SELECT DISTINCT c.id, c.nombre_hotel, c.tipo as tipo,  c.localizador, h.nombre as hotel, c.subdominio, h.id as hotel_id,  
                c.inicio, c.fin, h.tipo_reserva, h.porcentage_cobro_anticipado, c.estado, dist.nombre_comercial as distribuidor ';
        $sql .= ' FROM campania AS c ';
        $sql .= ' INNER JOIN empresa AS dist ON dist.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN empresa AS e ON e.id = c.empresa_id OR e.id = c.empresa_distribuidora_id ';
        $sql .= ' INNER JOIN usuario_empresa AS ue ON e.id = ue.empresa_id';
        $sql .= ' LEFT JOIN hotel AS h ON c.id = h.campania_id ';
        $sql .= ' LEFT JOIN destino_turistico AS d ON d.id = h.destino_id ';
        
        $sql .= ' WHERE (ue.usuario_id = ? OR ' . $usuarioId . ' = 0)  AND (h.destino_id = ? OR ' . $destinoId . ' = 0 )';
        if(isset($args['sSearch']) && strlen($args['sSearch'])) {
            $sql .= ' AND (
                      c.nombre_hotel like "%' . $args['sSearch'] . '%" OR
                      c.localizador like "%' . $args['sSearch'] . '%" OR
                     
                      dist.nombre_comercial like "%' . $args['sSearch'] . '%" OR
                      c.estado like "%' . $args['sSearch'] . '%"
                    )';
        }
        if(isset($args['iSortCol_0'])) {
                switch ($args['iSortCol_0']) {
                    case '0':
                        $sql .= ' ORDER BY c.localizador ' . $args['sSortDir_0'];
                        break;
                    case '1':
                        $sql .= ' ORDER BY c.nombre_hotel ' . $args['sSortDir_0'];
                        break;
                    case '2':
                        $sql .= ' ORDER BY h.tipo_reserva ' . $args['sSortDir_0'] . ', h.porcentage_cobro_anticipado ' . $args['sSortDir_0'];
                        break;
                    case '3':
                        $sql .= ' ORDER BY c.inicio ' . $args['sSortDir_0'] . ', c.fin ' . $args['sSortDir_0'];
                        break;
                    case '4':
                        $sql .= ' ORDER BY dist.nombre_comercial ' . $args['sSortDir_0'];
                        break;
                    case '5':
                        $sql .= ' ORDER BY c.estado ' . $args['sSortDir_0'];
                        break;
                }
            } else 
                $sql .= ' ORDER BY c.localizador DESC';
            
            if($args['iDisplayLength'])
                $sql .= ' LIMIT ' . (($args['iDisplayStart']) ? $args['iDisplayStart'] : 0) . ' , ' . (($args['iDisplayLength']) ? $args['iDisplayLength'] : 20);
       
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($usuarioId);
        $sqlQuery->setNumber($destinoId);
        return $this->execute($sqlQuery);
    }
}
?>