-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-04-2021 a las 04:54:56
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
-- Base de datos: `daily`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` bigint(111) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `activity` text COLLATE utf8_unicode_ci,
  `created_at` date NOT NULL,
  `remind` date DEFAULT NULL,
  `updated_at` date NOT NULL,
  `user` int(11) NOT NULL,
  `dateact` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `activity`
--

INSERT INTO `activity` (`id`, `name`, `phone`, `email`, `activity`, `created_at`, `remind`, `updated_at`, `user`, `dateact`, `checked`) VALUES
(137, 'cleanpors mecos', '1', '1@sfsdf', 'test1 dcnasbdjhsfd efuiweruiwuisd fdfsjihvfjbv rweiruirweiuewr w3498 43578fev  v jhhfbjsdfjhdvsb sdfkasdoihbfevbjhvjg 3489rtg9ui4589n bvbjgjkf rv n954jtkj g jorkjdfg df vfz dgreaiojtn ', '2021-01-05', '2021-01-18', '2021-01-05', 28, 'Jan 19, 2021', 0),
(190, 'cx', '2', '23@hotmail.com', 'g', '2021-01-11', '2021-01-31', '2021-01-11', 33, 'Jan 31, 2021', 0),
(191, 'cx23', '2', '23@hotmail.com', 'gh', '2021-01-11', '2021-01-26', '2021-01-11', 33, 'Jan 27, 2021', 1),
(226, 'getter13', '423318747539', 'crashx30@hotmail.com', 'test233', '2021-01-14', '2021-01-14', '2021-01-14', 28, 'Jan 15, 2021', 1),
(229, 'v', '1', '23@hotmail.com', 'ere', '2021-01-27', '2021-01-30', '2021-01-27', 28, 'Jan 31, 2021', 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `user-act` FOREIGN KEY (`user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
