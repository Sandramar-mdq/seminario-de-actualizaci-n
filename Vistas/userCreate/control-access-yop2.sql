-- Adminer 4.8.1 MySQL 8.0.29 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP PROCEDURE IF EXISTS `auth_user`;;
CREATE PROCEDURE `auth_user`(IN `user_name` varchar(45), IN `password` varchar(45))
SELECT id FROM user 
WHERE user.user_name = user_name AND user.user_pass = password;;

DROP PROCEDURE IF EXISTS `change_password`;;
CREATE PROCEDURE `change_password`(IN `new_pass` varchar(45), IN `id` int)
BEGIN
        UPDATE user SET user_pass = new_password WHERE id = user_id_dni;
END;;

DROP PROCEDURE IF EXISTS `change_user_group`;;
CREATE PROCEDURE `change_user_group`(IN `new_group_id` int, IN `id` int)
BEGIN
        UPDATE `control-access-yop2`.user_groupmembers 
        SET group_id = new_group_id  WHERE id = user_id_dni;
END;;

DROP PROCEDURE IF EXISTS `create_session`;;
CREATE PROCEDURE `create_session`()
BEGIN
        DECLARE user_id_dni INT DEFAULT 0;
        INSERT INTO user_session (token, created, expires, user_id_dni) 
        VALUES(token, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY), user_id_dni);
END;;

DROP PROCEDURE IF EXISTS `delete_action`;;
CREATE PROCEDURE `delete_action`(IN `id` int)
BEGIN
        DELETE FROM `control-access-yop2`.action WHERE action_id = id;
END;;

DROP PROCEDURE IF EXISTS `delete_group`;;
CREATE PROCEDURE `delete_group`(IN `id` int)
BEGIN
        DELETE FROM `control-access-yop2`.group WHERE group_id = id;
END;;

DROP PROCEDURE IF EXISTS `delete_user`;;
CREATE PROCEDURE `delete_user`(IN `id` int)
BEGIN
	DELETE FROM user WHERE user_id_dni = ID;
END;;

DROP PROCEDURE IF EXISTS `delete_user_group`;;
CREATE PROCEDURE `delete_user_group`(IN `id` int)
BEGIN
        DELETE FROM  `control-access-yop2`.user_groupmembers WHERE group_members.user_id_dni= id;
END;;

DROP PROCEDURE IF EXISTS `find_user`;;
CREATE PROCEDURE `find_user`(IN `id` int(11))
BEGIN
     SELECT user_name, user_pass FROM `control-access-yop2`.user WHERE user_id_dni = ID;
END;;

DROP PROCEDURE IF EXISTS `insert_action`;;
CREATE PROCEDURE `insert_action`(IN `id` int, IN `name` varchar(45), IN `descrip` varchar(120))
BEGIN
        INSERT INTO action (action_id, action_name, action_descrip) VALUES (id, name, descrip);
END;;

DROP PROCEDURE IF EXISTS `insert_group`;;
CREATE PROCEDURE `insert_group`(IN `id` int, IN `name` varchar(45), IN `descrip` varchar(100))
BEGIN
        INSERT INTO `control-access-yop2`.group (group_id, group_name, group_descrip)
        VALUES (id, name, descrip);
END;;

DROP PROCEDURE IF EXISTS `insert_user`;;
CREATE PROCEDURE `insert_user`(IN `DNI` int, IN `name` varchar(45), IN `passw` varchar(45))
BEGIN
	INSERT INTO user (user_id_dni, user_name, user_pass)
	VALUES (DNI,name, passw);
END;;

DROP PROCEDURE IF EXISTS `insert_user_group`;;
CREATE PROCEDURE `insert_user_group`(IN `user_id` int, IN `group_id` int)
BEGIN
        INSERT INTO `control-access-yop2`.user_groupmembers (user_id_dni, group_id)
        VALUES (user_id, group_id);
END;;

DROP PROCEDURE IF EXISTS `list_action`;;
CREATE PROCEDURE `list_action`()
BEGIN
	SELECT * FROM `control-access-yop2`.action;
END;;

DROP PROCEDURE IF EXISTS `list_group`;;
CREATE PROCEDURE `list_group`()
BEGIN
	SELECT * FROM `control-access-yop2`.group;
END;;

DROP PROCEDURE IF EXISTS `list_user`;;
CREATE PROCEDURE `list_user`()
BEGIN
	SELECT * FROM `control-access-yop2`.user;
END;;

DROP PROCEDURE IF EXISTS `upload_action`;;
CREATE PROCEDURE `upload_action`(IN `id` int, IN `name` varchar(45), IN `descrip` varchar(120))
BEGIN
	UPDATE `control-access-yop2`.action
        SET action_name = name, action_descrip = descrip WHERE action_id = id;
END;;

DROP PROCEDURE IF EXISTS `upload_group`;;
CREATE PROCEDURE `upload_group`(IN `id` int, IN `name` varchar(45), IN `descrip` varchar(100))
BEGIN
	UPDATE `control-access-yop2`.user
        SET group_name = nam, group_descrip = descrip WHERE group_id = id;
END;;

DROP PROCEDURE IF EXISTS `upload_user`;;
CREATE PROCEDURE `upload_user`(IN `id` int, IN `nam` varchar(45), IN `passwo` varchar(45))
BEGIN
	UPDATE user
    SET user_name = nam, user_pass = passwo WHERE user_id_dni = id;
END;;

DROP PROCEDURE IF EXISTS `validate_user`;;
CREATE PROCEDURE `validate_user`(IN `id` int, IN `name` varchar(45), IN `pass` varchar(45))
BEGIN
        SELECT name, id from `control-access-yop2`.user WHERE user.name = user_name AND user.user_pass = pass;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `action_id` int NOT NULL,
  `action_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `action_descrip` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `id_action_UNIQUE` (`action_id`),
  UNIQUE KEY `action_name_UNIQUE` (`action_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `action` (`action_id`, `action_name`, `action_descrip`) VALUES
(11,	'alta',	'inscribir usuario'),
(12,	'baja',	'eliminar usuario'),
(13,	'modificacion',	'corregir datos de usuario'),
(14,	'listar usuarios',	'mostrar informacion');

DROP TABLE IF EXISTS `action_group`;
CREATE TABLE `action_group` (
  `group_id` int NOT NULL,
  `action_id` int NOT NULL,
  KEY `id_action` (`action_id`),
  KEY `id_group` (`group_id`),
  CONSTRAINT `action_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`),
  CONSTRAINT `action_group_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `action` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `group_id` int NOT NULL,
  `group_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `group_descrip` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `id_group_UNIQUE` (`group_id`),
  UNIQUE KEY `group_name_UNIQUE` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `group` (`group_id`, `group_name`, `group_descrip`) VALUES
(21,	'Alumnos',	'personas que cursan regularmente'),
(22,	'profesores',	'dan clases, califican cursadas y toman examenes '),
(23,	'directivos',	'todo lo relacionado con la gestion ;\n');

DROP TABLE IF EXISTS `group_accesses`;
CREATE TABLE `group_accesses` (
  `group_id` int NOT NULL,
  `action_id` int NOT NULL,
  KEY `group_id` (`group_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `group_accesses_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`),
  CONSTRAINT `group_accesses_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `action` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `group_compatibility`;
CREATE TABLE `group_compatibility` (
  `group_id_source` int NOT NULL,
  `group_id_target` int NOT NULL,
  KEY `group_id_source` (`group_id_source`),
  KEY `group_id_target` (`group_id_target`),
  CONSTRAINT `group_compatibility_ibfk_1` FOREIGN KEY (`group_id_source`) REFERENCES `group` (`group_id`),
  CONSTRAINT `group_compatibility_ibfk_2` FOREIGN KEY (`group_id_target`) REFERENCES `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `group_members`;
CREATE TABLE `group_members` (
  `user_id_dni` int NOT NULL,
  `group_id` int NOT NULL,
  KEY `user_id_dni` (`user_id_dni`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`user_id_dni`) REFERENCES `user` (`user_id_dni`),
  CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id_dni` int NOT NULL,
  `user_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id_dni`),
  UNIQUE KEY `id_user_dni_UNIQUE` (`user_id_dni`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci KEY_BLOCK_SIZE=16;

INSERT INTO `user` (`user_id_dni`, `user_name`, `user_pass`) VALUES
(130,	'atropos',	'23456'),
(202,	'pedro',	'3ases2j'),
(232,	'juan23',	'3empanadas'),
(285,	'maria19',	'7vasos'),
(323,	'moira',	'claro11'),
(350,	'antonia',	'4ases'),
(450,	'cloto37',	'azulroto'),
(456,	'lakesis',	'12patitos'),
(635,	'barto',	'diebartdie');

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `user_id_dni` int NOT NULL,
  `group_id` int NOT NULL,
  KEY `id_user_dni_idx` (`user_id_dni`),
  KEY `id_group_idx` (`group_id`),
  CONSTRAINT `user_group_ibfk_3` FOREIGN KEY (`user_id_dni`) REFERENCES `user` (`user_id_dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_group_ibfk_4` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info` int NOT NULL,
  KEY `user_info` (`user_info`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_info`) REFERENCES `user` (`user_id_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `user_session`;
CREATE TABLE `user_session` (
  `session_id` int NOT NULL,
  `user_id_dni` int NOT NULL,
  `token` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `created` datetime NOT NULL,
  `expires` datetime NOT NULL,
  KEY `user_id_dni` (`user_id_dni`),
  CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id_dni`) REFERENCES `user` (`user_id_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;


-- 2022-11-14 05:37:45
