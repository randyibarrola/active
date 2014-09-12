<?php
/**
 * Class that operate on table 'faq'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-27 21:31
 */
class FaqMySqlExtDAO extends FaqMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {
        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Faq();
        return $this->mysql->prepare($obj, $data);
    }
}
?>