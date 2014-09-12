ALTER TABLE condicion ADD usuario_id INT NULL;

ALTER TABLE `condicion`
  ADD CONSTRAINT `fk_condicion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `condicion` 
CHANGE COLUMN `descripcion` `descripcion` LONGTEXT NULL DEFAULT NULL ;

ALTER TABLE `reserva_producto` 
CHANGE COLUMN `nombre` `nombre` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL ;
