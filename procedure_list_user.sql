CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_usuarios`()
BEGIN
	SELECT * FROM `control-access-yop2`.user;
END