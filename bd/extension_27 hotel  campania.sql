alter table hotel add campania_id INT NULL;

ALTER TABLE hotel
  ADD CONSTRAINT `fk_hotel_campania1` FOREIGN KEY (`campania_id`) REFERENCES `campania` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;