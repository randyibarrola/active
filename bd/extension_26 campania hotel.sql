alter table campania add nombre_hotel varchar(200) NULL;

alter table campania add localizador varchar(50) NULL;

alter table campania add empresa_distribuidora_id INT NULL;

ALTER TABLE campania
  ADD CONSTRAINT `fk_campania_distribuidor1` FOREIGN KEY (`empresa_distribuidora_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;