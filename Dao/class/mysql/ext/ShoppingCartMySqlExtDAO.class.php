<?php
/**
 * Class that operate on table 'shopping_cart'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-01-14 04:47
 */
class ShoppingCartMySqlExtDAO extends ShoppingCartMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new ShoppingCart ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>