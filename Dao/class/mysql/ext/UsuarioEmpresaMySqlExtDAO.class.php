<?php
/**
 * Class that operate on table 'usuario_empresa'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-12 16:21
 */
class UsuarioEmpresaMySqlExtDAO extends UsuarioEmpresaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new UsuarioEmpresa ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>