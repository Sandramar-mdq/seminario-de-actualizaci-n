CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user`(in id int, in name VARCHAR(45), in password VARCHAR(45))
BEGIN
INSERT INTO user (idUserDNI,nameUser, passw)
VALUES (id, name, password);

END