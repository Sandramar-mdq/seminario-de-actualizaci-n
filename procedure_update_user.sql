CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_usuario`(in id int, in nam VARCHAR(45), in passwo VARCHAR(45))
BEGIN
	UPDATE user
    SET nameUser = nam, passw = passwo WHERE idUserDNI = id;
END