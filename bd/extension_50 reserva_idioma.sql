ALTER TABLE reserva ADD idioma_id INT NULL;

ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;