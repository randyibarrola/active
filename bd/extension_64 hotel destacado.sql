ALTER TABLE hotel ADD destacado TINYINT NULL;

UPDATE hotel SET destacado = 0 WHERE destacado IS NULL;