--Permisos para afiliados
INSERT INTO `permiso` (`id` , `nombre`) VALUES ('10',  'afiliados');
INSERT INTO `usuario_permiso` (`id`, `usuario_grupo_id`, `permiso_id`) VALUES (NULL, '1', '10');
INSERT INTO `usuario_permiso` (`id`, `usuario_grupo_id`, `permiso_id`) VALUES (NULL, '3', '10');

--Permisos para widgets
INSERT INTO `permiso` (`id` , `nombre`) VALUES ('11',  'widgets');
INSERT INTO `usuario_permiso` (`id`, `usuario_grupo_id`, `permiso_id`) VALUES (NULL, '5', '11');