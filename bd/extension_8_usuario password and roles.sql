ALTER TABLE usuario ADD password VARCHAR(50) NULL;

INSERT INTO usuario_grupo(id, nombre) VALUES (1, 'Administrador');
INSERT INTO usuario_grupo(id, nombre) VALUES (2, 'Cliente');
INSERT INTO usuario_grupo(id, nombre) VALUES (3, 'Distribuidor');
