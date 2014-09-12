ALTER TABLE blacklist ADD usuario_id INT NULL;

ALTER TABLE `blacklist`
  ADD CONSTRAINT `fk_blacklist_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE configuracion ADD usuario_id INT NULL;

ALTER TABLE `configuracion`
  ADD CONSTRAINT `fk_configuracion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DROP TABLE IF EXISTS promocion_palabras_claves_hotel;  
DROP TABLE IF EXISTS promocion_palabras_claves;
