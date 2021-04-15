-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-04-2021 a las 04:53:08
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cucei`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(60) CHARACTER SET latin1 NOT NULL,
  `editado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nivel` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id_admin`, `usuario`, `nombre`, `password`, `editado`, `nivel`) VALUES
(12, 'admin8', '8888', '$2y$12$fk6LlWFcF9Ixql/ivyXc2.I9APlhqfgIjtore29am8sO1T.miEsii', '2019-07-29 23:33:03', 0),
(16, 'admin', 'admin', '$2y$12$J1OxSBorC7avLQA7XSzJme1T55gACGNS7.eZrtqOl5R5h1Z7oqTAy', '2019-07-29 23:33:03', 1),
(25, 'glori', 'glori', '$2y$12$89vKdTdp..eMda1fg8A7XeWUh59ZN9o2q9SHN6s4TcdBpW6fkGlcG', '2019-07-29 23:34:22', 0),
(33, 'admin3', 'admin3', '$2y$12$FPKW4LegHmYik4aSvhaqHelOw14T6/NRheITj.cXrM9xVDpgmpOqa', '2019-07-30 02:18:00', 0),
(92, 'leo ', 'leo ', '$2y$12$UcJKLi3uWHlqsyCiUd639.sRDpnpoDRNoTNSXsGvCXYC5skI5K/mi', '2019-07-31 22:42:33', 0),
(93, '1', '1', '$2y$12$EiPRxRoUqObsh0jONw3nd.ReYhvBZdgYi2qFNOTBC.ayULpOlyXLG', '2019-08-24 12:51:48', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_evento`
--

DROP TABLE IF EXISTS `categoria_evento`;
CREATE TABLE IF NOT EXISTS `categoria_evento` (
  `id_categoria` tinyint(10) NOT NULL AUTO_INCREMENT,
  `categoria_evento` varchar(50) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `editado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_evento`
--

INSERT INTO `categoria_evento` (`id_categoria`, `categoria_evento`, `icono`, `editado`) VALUES
(2, 'conferencias', 'fa-code', '2019-08-02 02:39:18'),
(3, 'talleres', 'fa-comment', '2019-08-02 02:39:18'),
(11, 'seminarios', 'fas fa-university', '2019-08-07 20:17:58'),
(12, 'Tensorflow', 'fas fa-laptop', '2019-08-07 20:22:59'),
(13, 'cloud', 'fas fa-cloud-download-alt', '2019-08-07 20:29:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `evento_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(60) NOT NULL,
  `fecha_evento` date NOT NULL,
  `hora_evento` time NOT NULL,
  `clave` varchar(10) DEFAULT NULL,
  `id_cat_evento` tinyint(10) NOT NULL,
  `id_inv` tinyint(4) NOT NULL,
  `editado` datetime DEFAULT NULL,
  PRIMARY KEY (`evento_id`),
  KEY `id_cat_event` (`id_cat_evento`),
  KEY `id_inv` (`id_inv`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`evento_id`, `nombre_evento`, `fecha_evento`, `hora_evento`, `clave`, `id_cat_evento`, `id_inv`, `editado`) VALUES
(7, 'UNITY', '2019-06-16', '16:00:00', '45R', 2, 2, '2019-08-24 16:52:19'),
(8, 'PYTHON', '2019-06-16', '19:10:00', 'GGC', 2, 3, '2019-08-24 20:23:57'),
(19, 'REACT', '2019-08-11', '18:45:00', NULL, 13, 9, '2019-08-24 20:25:59'),
(25, 'BLENDER', '2019-08-25', '20:30:00', NULL, 11, 4, '2019-08-24 16:51:29'),
(26, 'BIGDATA', '2019-08-23', '18:30:00', NULL, 13, 9, '2019-08-24 19:28:47'),
(27, 'FIREBASE', '2019-08-24', '20:45:00', NULL, 11, 1, '2019-08-24 17:36:57'),
(29, 'Inteligencia artificial', '2019-08-16', '20:45:00', NULL, 12, 3, '2019-08-24 20:24:06'),
(35, 'python inicio', '2019-08-23', '19:00:00', NULL, 3, 4, '2019-08-24 18:55:25'),
(37, 'assembly 8ac', '2019-08-23', '22:00:00', NULL, 3, 3, '2020-06-06 04:43:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitados`
--

DROP TABLE IF EXISTS `invitados`;
CREATE TABLE IF NOT EXISTS `invitados` (
  `invitado_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre_invitado` varchar(30) NOT NULL,
  `apellido_invitado` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `url_imagen` varchar(50) NOT NULL,
  PRIMARY KEY (`invitado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `invitados`
--

INSERT INTO `invitados` (`invitado_id`, `nombre_invitado`, `apellido_invitado`, `descripcion`, `url_imagen`) VALUES
(1, 'David ', 'Bonilla', 'Gran diseador de videojuegos con basta experiencia eusando tecnologias como unity y blender etc.', 'invitado1.jpg'),
(2, 'Saul', 'Romero', 'Vasta en experiencia en data science usando herramientas como tensor flow, mongo db, python, jupiter, etc.', 'invitado2.jpg'),
(3, 'Jose', 'Vazques', 'Un programador con gran esperiencia en UX, asi como conferencista en hacker garage.', 'invitado3.jpg'),
(4, 'Margaret', 'Senegan', 'Photographer', 'invitado4.jpg'),
(9, 'po', 'Senegin', 'sass', 'invitado6.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regalos`
--

DROP TABLE IF EXISTS `regalos`;
CREATE TABLE IF NOT EXISTS `regalos` (
  `ID_regalo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_regalo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_regalo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regalos`
--

INSERT INTO `regalos` (`ID_regalo`, `nombre_regalo`) VALUES
(1, 'Pulsera'),
(2, 'Etiquetas'),
(3, 'Plumas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrados`
--

DROP TABLE IF EXISTS `registrados`;
CREATE TABLE IF NOT EXISTS `registrados` (
  `ID_Registrado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_registrado` varchar(50) NOT NULL,
  `apellido_registrado` varchar(50) NOT NULL,
  `email_registrado` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL,
  `pases_articulos` longtext NOT NULL,
  `talleres_registrados` longtext NOT NULL,
  `regalo` int(11) NOT NULL,
  `total_pagado` varchar(50) NOT NULL,
  `pagado` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Registrado`),
  KEY `regalo` (`regalo`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrados`
--

INSERT INTO `registrados` (`ID_Registrado`, `nombre_registrado`, `apellido_registrado`, `email_registrado`, `fecha_registro`, `pases_articulos`, `talleres_registrados`, `regalo`, `total_pagado`, `pagado`) VALUES
(137, 'maite', 'sacnhez', 'crashx11@hotmail.com', '2019-08-06', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"5\"},\"pase_2dias\":{\"cantidad\":\"\"},\"etiquetas\":2}', '{\"eventos\":[\"7\",\"18\"]}', 1, '249', 1),
(145, '4', '4', 'sdsads@wewew', '2019-08-09', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"3\"},\"camisas\":1,\"etiquetas\":1}', '{\"eventos\":[\"29\",\"26\"]}', 1, '', 1),
(147, 'ppppppppp', 'pppppppp', 'sdsads@wewew', '2019-08-15', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"4\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"8\"]}', 1, '180', 1),
(148, '', '', '', '2019-08-24', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"1\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"29\"]}', 2, '45', 1),
(153, '1', 'rodriguez', 'crashx30@hotmail.com', '2019-08-25', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"2\"},\"pase_2dias\":{\"cantidad\":\"1\"},\"camisas\":1}', '{\"eventos\":[\"19\",\"35\",\"27\"]}', 2, '129.3', 1),
(154, '', '', '', '2019-08-25', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"16\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"18\",\"27\"]}', 2, '720', 1),
(155, '', '', '', '2019-08-25', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"2\"}}', '{\"eventos\":[\"18\",\"27\"]}', 2, '60', 0),
(156, '', '', '', '2019-08-25', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"1\"},\"pase_2dias\":{\"cantidad\":\"0\"}}', '{\"eventos\":[\"37\",\"27\"]}', 2, '65', 0),
(157, '', '', '', '2020-06-06', '{\"un_dia\":{\"cantidad\":\"2\"},\"pase_completo\":{\"cantidad\":\"1\"},\"pase_2dias\":{\"cantidad\":\"1\"},\"camisas\":3,\"etiquetas\":3}', '{\"eventos\":[\"19\",\"25\",\"35\",\"37\",\"27\"]}', 2, '148.9', 1),
(158, '', '', '', '2020-06-06', '{\"un_dia\":{\"cantidad\":\"2\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"etiquetas\":3}', '{\"eventos\":[\"37\"]}', 2, '46', 0),
(159, 'q', 'q', 'q', '2020-06-06', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"1\"},\"camisas\":2,\"etiquetas\":2}', '{\"eventos\":[\"26\",\"27\"]}', 2, '52.6', 0),
(160, '', '', '', '2020-06-09', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"etiquetas\":1}', '{\"eventos\":[\"35\"]}', 2, '22', 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_cat_evento`) REFERENCES `categoria_evento` (`id_categoria`),
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_inv`) REFERENCES `invitados` (`invitado_id`);

--
-- Filtros para la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD CONSTRAINT `registrados_ibfk_1` FOREIGN KEY (`regalo`) REFERENCES `regalos` (`ID_regalo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
