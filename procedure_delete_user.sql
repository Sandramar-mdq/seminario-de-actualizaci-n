CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuario`( in id int)
BEGIN
	DELETE FROM user WHERE id_user_dni = ID;
END