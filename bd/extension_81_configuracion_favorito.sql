ALTER TABLE  `configuracion_evento` ADD  `favorito` TINYINT NULL ;
UPDATE `configuracion_evento` SET `favorito`=0 WHERE 1