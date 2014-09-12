<?php
/**
 * Class that operate on table 'adword_pais'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-04-13 19:58
 */
class AdwordPaisMySqlExtDAO extends AdwordPaisMySqlDAO{

    private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idData = 0) {

        if ($idData != 0)
            $row = $this->load($idData);
        else
            $row = new AdwordPai();
        return $this->mysql->prepare($row, $data);
    }
}
?>