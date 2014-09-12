<?php
/**
 * Class that operate on table 'evento_archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-13 06:57
 */
class EventoArchivoMySqlExtDAO extends EventoArchivoMySqlDAO{
    
    private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idEventoArchivo = 0) {

        if ($idEventoArchivo != 0)
            $evento_archivo = $this->load($idEventoArchivo);
        else
            $evento_archivo = new EventoArchivo();
        return $this->mysql->prepare($evento_archivo, $data);
    }
	
}
?>