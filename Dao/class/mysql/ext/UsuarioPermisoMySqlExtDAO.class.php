<?php
/**
 * Class that operate on table 'usuario_permiso'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-12 16:21
 */
class UsuarioPermisoMySqlExtDAO extends UsuarioPermisoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new UsuarioPermiso ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>