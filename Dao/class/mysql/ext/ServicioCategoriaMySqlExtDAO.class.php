<?php
/**
 * Class that operate on table 'servicio_categoria'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class ServicioCategoriaMySqlExtDAO extends ServicioCategoriaMySqlDAO{

	function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idServicioCategoria = 0) {

        if ($idServicioCategoria != 0)
            $categoria = $this->load($idServicioCategoria);
        else
            $categoria = new ServicioCategoria();
        return $this->mysql->prepare($categoria, $data);
    }
}
?>