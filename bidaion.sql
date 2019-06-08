-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2019 a las 03:10:55
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bidaion`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarhabitacioneshotel` (IN `codigohotel1` INT)  NO SQL
select *
from habitacion
where codigohotel=codigohotel1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarreservas` (IN `codigohabitacion1` INT, IN `fechafin1` VARCHAR(50), IN `fechainicio1` VARCHAR(50))  NO SQL
select * from reserva inner join reservahotel on reserva.codigoreserva=reservahotel.codigoreserva where reservahotel.codigohabitacion=codigohabitacion1 AND fechainicio1 between fechainicio AND fechafin OR reservahotel.codigohabitacion=codigohabitacion1 AND fechafin1 between fechainicio AND fechafin OR reservahotel.codigohabitacion=codigohabitacion1 AND fechainicio1 < fechainicio AND fechafin1 > fechafin$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarreservasapartamento` (IN `codigoapartamento1` INT, IN `fechafin1` VARCHAR(50), IN `fechainicio1` VARCHAR(50))  NO SQL
select *
from reserva
where codigoapartamento=codigoapartamento1 AND fechainicio1 between fechainicio AND fechafin OR codigoapartamento=codigoapartamento1 AND fechafin1 between fechainicio ANd fechafin
OR codigoapartamento=codigoapartamento1 AND fechainicio1 < fechainicio AND fechafin1 > fechafin$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarreservascasa` (IN `codigocasa1` INT, IN `fechafin1` VARCHAR(50), IN `fechainicio1` VARCHAR(50))  NO SQL
select *
from reserva
where codigocasa=codigocasa1 AND fechainicio1 between fechainicio AND fechafin OR codigocasa=codigocasa1 AND fechafin1 between fechainicio ANd fechafin
OR codigocasa=codigocasa1 AND fechainicio1 < fechainicio AND fechafin1 > fechafin$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `comprobarhabitacionapartamento` (IN `codigoapartamento1` INT)  NO SQL
select *
from habitacion
where codigoapartamento=codigoapartamento1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `comprobarhabitacioncasa` (IN `codigocasa1` INT)  NO SQL
select *
from habitacion
where codigocasa=codigocasa1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalapartamento` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from apartamento
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by precioapartamento ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalapartamentonumeroreservas` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from apartamento
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by numeroreservas DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalcasa` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from casa
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by preciocasa ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalcasanumeroreservas` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from casa
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by numeroreservas DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalhotel` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from hotel
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by precio ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalhotelnumeroreservas` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from hotel
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by numeroreservas DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finalordennumeroestrellas` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from hotel
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1
order by numeroEstrellas DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarnumeroreservaapartamento` (IN `codigoapartamento1` INT)  NO SQL
select *
from apartamento
where codigoapartamento=codigoapartamento1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarnumeroreservacasa` (IN `codigocasa1` INT)  NO SQL
select *
from casa
where codigocasa=codigocasa1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarnumeroreservahotel` (IN `codigohotel1` INT)  NO SQL
select *
from hotel
where codigohotel=codigohotel1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rellenarapartamentos` (IN `ubicacion1` VARCHAR(50))  NO SQL
select *
from apartamento
where ubicacion=ubicacion1
order by precioapartamento ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rellenarapartamentosinorden` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from apartamento
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rellenarcasas` (IN `ubicacion1` VARCHAR(50))  NO SQL
select *
from casa
where ubicacion=ubicacion1
order by preciocasa ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rellenarcasasinorden` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from casa
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rellenarhoteles` (IN `ubicacion1` VARCHAR(50))  NO SQL
select *
from hotel
where ubicacion=ubicacion1
order by precio ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rellenarhotelsinorden` (IN `ubicacion1` VARCHAR(50), IN `wifi1` VARCHAR(50), IN `piscina1` VARCHAR(50), IN `spa1` VARCHAR(50), IN `parking1` VARCHAR(50), IN `aireacondicionado1` VARCHAR(50), IN `restaurante1` VARCHAR(50), IN `bar1` VARCHAR(50), IN `gym1` VARCHAR(50))  NO SQL
select *
from hotel
where ubicacion=ubicacion1 AND wifi=wifi1 AND piscina=piscina1 AND spa=spa1 AND parking=parking1 AND aireacondicionado=aireacondicionado1 AND
restaurante=restaurante1 AND bar=bar1 AND gym=gym1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vercamas` (IN `codigohabitacion1` INT)  NO SQL
select *
from cama
where codigohabitacion=codigohabitacion1$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamento`
--

CREATE TABLE `apartamento` (
  `codigoapartamento` int(11) NOT NULL,
  `nombrealojamiento` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `habitacionesdisponibles` int(11) DEFAULT NULL,
  `precioapartamento` double DEFAULT NULL,
  `numeroreservas` int(11) DEFAULT NULL,
  `mcuadrados` double DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `wifi` varchar(50) DEFAULT NULL,
  `piscina` varchar(50) DEFAULT NULL,
  `spa` varchar(50) DEFAULT NULL,
  `parking` varchar(50) DEFAULT NULL,
  `aireacondicionado` varchar(50) DEFAULT NULL,
  `restaurante` varchar(50) DEFAULT NULL,
  `bar` varchar(50) DEFAULT NULL,
  `gym` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `apartamento`
--

INSERT INTO `apartamento` (`codigoapartamento`, `nombrealojamiento`, `ubicacion`, `habitacionesdisponibles`, `precioapartamento`, `numeroreservas`, `mcuadrados`, `piso`, `wifi`, `piscina`, `spa`, `parking`, `aireacondicionado`, `restaurante`, `bar`, `gym`) VALUES
(30, 'Apartamento30', 'Barakaldo', 6, 80, 22, 200, 4, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(31, 'Apartamento31', 'Las Arenas', 6, 90, 20, 288, 5, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(32, 'Apartamento32', 'Bilbao', 6, 100, 1, 392, 6, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(33, 'Apartamento33', 'Santurce', 6, 190, 17, 800, 7, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(34, 'Apartamento34', 'Barakaldo', 6, 80, 15, 200, 8, 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'true'),
(35, 'Apartamento35', 'Las Arenas', 6, 90, 14, 288, 9, 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'true'),
(36, 'Apartamento36', 'Bilbao', 6, 100, 13, 392, 10, 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'true'),
(37, 'Apartamento37', 'Santurce', 6, 190, 12, 800, 11, 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'true');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `baseslegales`
--

CREATE TABLE `baseslegales` (
  `codigobaseslegales` int(11) NOT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `baseslegales`
--

INSERT INTO `baseslegales` (`codigobaseslegales`, `dni`, `fecha`) VALUES
(1, '12345678L', '0000-00-00'),
(2, '87654321Q', '0000-00-00'),
(3, '19283746P', '0000-00-00'),
(4, '99118273H', '0000-00-00'),
(5, '12213423D', '0000-00-00'),
(6, '11111111T', '0000-00-00'),
(7, '22222222F', '0000-00-00'),
(8, '33333333D', '0000-00-00'),
(9, '55555555J', '0000-00-00'),
(10, '12324453R', '0000-00-00'),
(11, '66666666S', '0000-00-00'),
(12, '77777777M', '0000-00-00'),
(13, '88888888X', '0000-00-00'),
(14, '99999999C', '0000-00-00'),
(15, '99228833N', '0000-00-00'),
(16, '11221133Y', '0000-00-00'),
(17, '55884938B', '0000-00-00'),
(18, '12122445J', '0000-00-00'),
(19, '00220039X', '0000-00-00'),
(20, '12122445J', '0000-00-00'),
(21, '00220039X', '0000-00-00'),
(22, '12122445J', '0000-00-00'),
(23, '00220039X', '0000-00-00'),
(24, '00000000C', '2019-05-13'),
(25, '00000000C', '2019-05-14'),
(26, '00000000C', '2019-05-14'),
(27, '00000000C', '2019-05-14'),
(28, '00000000C', '2019-05-14'),
(29, '00000000C', '2019-05-14'),
(30, '00000000C', '2019-05-14'),
(31, '00000000C', '2019-05-14'),
(32, '00000000C', '2019-05-14'),
(33, '00000000C', '2019-05-14'),
(34, '00000000C', '2019-05-14'),
(35, '00000000C', '2019-05-14'),
(36, '00000000C', '2019-05-14'),
(37, '00000000C', '2019-05-14'),
(38, '00000000C', '2019-05-14'),
(39, '00000000C', '2019-05-14'),
(40, '00000000C', '2019-05-14'),
(41, '00000000C', '2019-05-14'),
(42, '00000000C', '2019-05-14'),
(43, '00000000C', '2019-05-14'),
(44, '00000000C', '2019-05-14'),
(45, '00000000C', '2019-05-14'),
(46, '00000000C', '2019-05-14'),
(47, '00000000C', '2019-05-14'),
(48, '00000000C', '2019-05-14'),
(49, '00000000C', '2019-05-14'),
(50, '00000000C', '2019-05-14'),
(51, '00000000C', '2019-05-14'),
(52, '00000000C', '2019-05-14'),
(53, '00000000C', '2019-05-14'),
(54, '00000000C', '2019-05-14'),
(55, '00000000C', '2019-05-14'),
(56, '00000000C', '2019-05-14'),
(57, '00000000C', '2019-05-15'),
(58, '00000000C', '2019-05-15'),
(59, '00000000C', '2019-05-15'),
(60, '00000000C', '2019-05-15'),
(61, '00000000T', '2019-05-16'),
(62, '00000000T', '2019-05-16'),
(63, '00000000T', '2019-05-16'),
(64, '00000000T', '2019-05-16'),
(65, '00000000C', '2019-05-16'),
(66, '00000000T', '2019-05-16'),
(67, '00000000T', '2019-05-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cama`
--

CREATE TABLE `cama` (
  `codigocama` int(11) NOT NULL,
  `codigohabitacion` int(11) DEFAULT NULL,
  `tipocama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cama`
--

INSERT INTO `cama` (`codigocama`, `codigohabitacion`, `tipocama`) VALUES
(100, 10, 'matrimonio'),
(101, 10, 'infantil'),
(102, 11, 'matrimonio'),
(103, 11, 'infantil'),
(104, 11, 'infantil'),
(105, 12, 'simple'),
(106, 12, 'simple'),
(107, 12, 'simple'),
(108, 12, 'simple'),
(109, 13, 'simple'),
(110, 13, 'simple'),
(111, 14, 'simple'),
(112, 14, 'simple'),
(113, 14, 'simple'),
(114, 14, 'simple'),
(115, 20, 'matrimonio'),
(116, 20, 'infantil'),
(117, 21, 'matrimonio'),
(118, 21, 'infantil'),
(119, 21, 'infantil'),
(120, 22, 'simple'),
(121, 22, 'simple'),
(122, 22, 'simple'),
(123, 22, 'simple'),
(124, 23, 'simple'),
(125, 23, 'simple'),
(126, 24, 'simple'),
(127, 24, 'simple'),
(128, 24, 'simple'),
(129, 24, 'simple'),
(130, 30, 'matrimonio'),
(131, 30, 'infantil'),
(132, 31, 'matrimonio'),
(133, 31, 'infantil'),
(134, 31, 'infantil'),
(135, 32, 'simple'),
(136, 32, 'simple'),
(137, 32, 'simple'),
(138, 32, 'simple'),
(139, 33, 'simple'),
(140, 33, 'simple'),
(141, 34, 'simple'),
(142, 34, 'simple'),
(143, 34, 'simple'),
(144, 34, 'simple'),
(145, 40, 'matrimonio'),
(146, 40, 'infantil'),
(147, 41, 'matrimonio'),
(148, 41, 'infantil'),
(149, 41, 'infantil'),
(150, 42, 'simple'),
(151, 42, 'simple'),
(152, 42, 'simple'),
(153, 42, 'simple'),
(154, 43, 'simple'),
(155, 43, 'simple'),
(156, 44, 'simple'),
(157, 44, 'simple'),
(158, 44, 'simple'),
(159, 44, 'simple'),
(160, 50, 'matrimonio'),
(161, 50, 'infantil'),
(162, 51, 'matrimonio'),
(163, 51, 'infantil'),
(164, 51, 'infantil'),
(165, 52, 'simple'),
(166, 52, 'simple'),
(167, 52, 'simple'),
(168, 52, 'simple'),
(169, 53, 'simple'),
(170, 53, 'simple'),
(171, 54, 'simple'),
(172, 54, 'simple'),
(173, 54, 'simple'),
(174, 54, 'simple'),
(175, 60, 'matrimonio'),
(176, 60, 'infantil'),
(177, 61, 'matrimonio'),
(178, 61, 'infantil'),
(179, 61, 'infantil'),
(180, 62, 'simple'),
(181, 62, 'simple'),
(182, 62, 'simple'),
(183, 62, 'simple'),
(184, 63, 'simple'),
(185, 63, 'simple'),
(186, 64, 'simple'),
(187, 64, 'simple'),
(188, 64, 'simple'),
(189, 64, 'simple'),
(190, 70, 'matrimonio'),
(191, 70, 'infantil'),
(192, 71, 'matrimonio'),
(193, 71, 'infantil'),
(194, 71, 'infantil'),
(195, 72, 'simple'),
(196, 72, 'simple'),
(197, 72, 'simple'),
(198, 72, 'simple'),
(199, 73, 'simple'),
(200, 73, 'simple'),
(201, 74, 'simple'),
(202, 74, 'simple'),
(203, 74, 'simple'),
(204, 74, 'simple'),
(205, 80, 'matrimonio'),
(206, 80, 'infantil'),
(207, 81, 'matrimonio'),
(208, 81, 'infantil'),
(209, 81, 'infantil'),
(210, 82, 'simple'),
(211, 82, 'simple'),
(212, 82, 'simple'),
(213, 82, 'simple'),
(214, 83, 'simple'),
(215, 83, 'simple'),
(216, 84, 'simple'),
(217, 84, 'simple'),
(218, 84, 'simple'),
(219, 84, 'simple'),
(220, 90, 'matrimonio'),
(221, 90, 'infantil'),
(222, 91, 'matrimonio'),
(223, 91, 'infantil'),
(224, 91, 'infantil'),
(225, 92, 'simple'),
(226, 92, 'simple'),
(227, 92, 'simple'),
(228, 92, 'simple'),
(229, 93, 'simple'),
(230, 93, 'simple'),
(231, 94, 'simple'),
(232, 94, 'simple'),
(233, 94, 'simple'),
(234, 94, 'simple'),
(235, 100, 'matrimonio'),
(236, 100, 'infantil'),
(237, 101, 'matrimonio'),
(238, 101, 'infantil'),
(239, 101, 'infantil'),
(240, 102, 'simple'),
(241, 102, 'simple'),
(242, 102, 'simple'),
(243, 102, 'simple'),
(244, 103, 'simple'),
(245, 103, 'simple'),
(246, 104, 'simple'),
(247, 104, 'simple'),
(248, 104, 'simple'),
(249, 104, 'simple'),
(250, 110, 'matrimonio'),
(251, 110, 'infantil'),
(252, 111, 'matrimonio'),
(253, 111, 'infantil'),
(254, 111, 'infantil'),
(255, 112, 'simple'),
(256, 112, 'simple'),
(257, 112, 'simple'),
(258, 112, 'simple'),
(259, 113, 'simple'),
(260, 113, 'simple'),
(261, 114, 'simple'),
(262, 114, 'simple'),
(263, 114, 'simple'),
(264, 114, 'simple'),
(265, 120, 'matrimonio'),
(266, 120, 'infantil'),
(267, 121, 'matrimonio'),
(268, 121, 'infantil'),
(269, 121, 'infantil'),
(270, 122, 'simple'),
(271, 122, 'simple'),
(272, 122, 'simple'),
(273, 122, 'simple'),
(274, 123, 'simple'),
(275, 123, 'simple'),
(276, 124, 'simple'),
(277, 124, 'simple'),
(278, 124, 'simple'),
(279, 124, 'simple'),
(280, 130, 'matrimonio'),
(281, 130, 'infantil'),
(282, 131, 'matrimonio'),
(283, 131, 'infantil'),
(284, 131, 'infantil'),
(285, 132, 'simple'),
(286, 132, 'simple'),
(287, 132, 'simple'),
(288, 132, 'simple'),
(289, 133, 'simple'),
(290, 133, 'simple'),
(291, 134, 'simple'),
(292, 134, 'simple'),
(293, 134, 'simple'),
(294, 134, 'simple'),
(295, 140, 'matrimonio'),
(296, 140, 'infantil'),
(297, 141, 'matrimonio'),
(298, 141, 'infantil'),
(299, 141, 'infantil'),
(300, 142, 'simple'),
(301, 142, 'simple'),
(302, 142, 'simple'),
(303, 142, 'simple'),
(304, 143, 'simple'),
(305, 143, 'simple'),
(306, 144, 'simple'),
(307, 144, 'simple'),
(308, 144, 'simple'),
(309, 144, 'simple'),
(310, 150, 'matrimonio'),
(311, 150, 'infantil'),
(312, 151, 'matrimonio'),
(313, 151, 'infantil'),
(314, 151, 'infantil'),
(315, 152, 'simple'),
(316, 152, 'simple'),
(317, 152, 'simple'),
(318, 152, 'simple'),
(319, 153, 'simple'),
(320, 153, 'simple'),
(321, 154, 'simple'),
(322, 154, 'simple'),
(323, 154, 'simple'),
(324, 154, 'simple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa`
--

CREATE TABLE `casa` (
  `codigocasa` int(11) NOT NULL,
  `nombrealojamiento` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `habitacionesdisponibles` int(11) DEFAULT NULL,
  `preciocasa` double DEFAULT NULL,
  `numeroreservas` int(11) DEFAULT NULL,
  `mcuadrados` double DEFAULT NULL,
  `nbaños` int(11) DEFAULT NULL,
  `wifi` varchar(50) DEFAULT NULL,
  `piscina` varchar(50) DEFAULT NULL,
  `spa` varchar(50) DEFAULT NULL,
  `parking` varchar(50) DEFAULT NULL,
  `aireacondicionado` varchar(50) DEFAULT NULL,
  `restaurante` varchar(50) DEFAULT NULL,
  `bar` varchar(50) DEFAULT NULL,
  `gym` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `casa`
--

INSERT INTO `casa` (`codigocasa`, `nombrealojamiento`, `ubicacion`, `habitacionesdisponibles`, `preciocasa`, `numeroreservas`, `mcuadrados`, `nbaños`, `wifi`, `piscina`, `spa`, `parking`, `aireacondicionado`, `restaurante`, `bar`, `gym`) VALUES
(20, 'Casa20', 'Bilbao', 6, 100, 21, 200, 1, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(21, 'Casa21', 'Santurce', 6, 110, 1, 288, 1, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(22, 'Casa22', 'Barakaldo', 6, 120, 2, 392, 1, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(23, 'Casa23', 'Las Arenas', 6, 130, 16, 512, 1, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(24, 'Casa24', 'Bilbao', 6, 100, 15, 200, 1, 'true', 'true', 'false', 'true', 'true', 'false', 'true', 'false'),
(25, 'Casa25', 'Santurce', 6, 110, 14, 288, 1, 'true', 'true', 'false', 'true', 'true', 'false', 'true', 'false'),
(26, 'Casa26', 'Barakaldo', 6, 120, 13, 392, 1, 'true', 'true', 'false', 'true', 'true', 'false', 'true', 'false'),
(27, 'Casa27', 'Las Arenas', 6, 130, 12, 512, 1, 'true', 'true', 'false', 'true', 'true', 'false', 'true', 'false');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` varchar(50) NOT NULL,
  `nombrecliente` varchar(50) DEFAULT NULL,
  `apellidocliente` varchar(50) DEFAULT NULL,
  `edad` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`dni`, `nombrecliente`, `apellidocliente`, `edad`, `sexo`, `contraseña`) VALUES
('00000000C', 'Ash', 'Ketchum', '20', 'null', '00bfc8c729f5d4d529a412b12c58ddd2'),
('00000000T', 'Mr.T', 'Barakus', '40', 'null', '4d186321c1a7f0f354b297e8914ab240'),
('00220039X', 'Ivan', 'Vani', '35', 'Hombre', 'lalolalola'),
('11111111T', 'Caren', 'Latada', '29', 'Mujer', 'lalolalola'),
('11221133Y', 'Melani', 'Reis', '27', 'Mujer', 'lalolalola'),
('12122445J', 'Pablo', 'Alvoran', '43', 'Hombre', 'lalolalola'),
('12213423D', 'Soila', 'Cerda', '22', 'Mujer', 'lalolalola'),
('12324453R', 'Lina', 'Selina', '37', 'Mujer', 'lalolalola'),
('12345678L', 'Alberto', 'Barvera', '20', 'Hombre', 'lalolalola'),
('19191919F', 'Alejandro', 'DiMaggio', '20', 'null', '4d186321c1a7f0f354b297e8914ab240'),
('19283746P', 'Elver', 'Galarga', '22', 'Hombre', 'lalolalola'),
('22222222F', 'Jorge', 'Nitales', '40', 'Hombre', 'lalolalola'),
('33333333D', 'Xavier', 'Tolano', '43', 'Hombre', 'lalolalola'),
('44444444V', 'Alfredo', 'Merdero', '22', 'Mujer', 'lalolalola'),
('55555555J', 'Paco', 'Gao', '32', 'Hombre', 'lalolalola'),
('55884938B', 'Pedro', 'Pedrero', '22', 'Hombre', 'lalolalola'),
('66666666S', 'Sheila', 'Serdo', '34', 'Mujer', 'lalolalola'),
('77777777M', 'Bea', 'jimenez', '47', 'Mujer', 'lalolalola'),
('87654321Q', 'Roberto', 'Sedino', '30', 'Hombre', 'lalolalola'),
('88888888X', 'Isabel', 'Hola', '27', 'Mujer', 'lalolalola'),
('99118273H', 'Rosa', 'Melano', '27', 'Mujer', 'lalolalola'),
('99228833N', 'Olivia', 'Verde', '24', 'Mujer', 'lalolalola'),
('99999999C', 'Ramon', 'Calvo', '52', 'Hombre', 'lalolalola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `codigohabitacion` int(11) NOT NULL,
  `codigohotel` int(11) DEFAULT NULL,
  `codigocasa` int(11) DEFAULT NULL,
  `codigoapartamento` int(11) DEFAULT NULL,
  `numerocamas` int(11) DEFAULT NULL,
  `tipohabitacioncasa` varchar(50) DEFAULT NULL,
  `mcuadrados` double DEFAULT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`codigohabitacion`, `codigohotel`, `codigocasa`, `codigoapartamento`, `numerocamas`, `tipohabitacioncasa`, `mcuadrados`, `precio`) VALUES
(10, 1, NULL, NULL, 2, 'habitacion', 7, 70),
(11, 1, NULL, NULL, 3, 'habitacion', 8, 80),
(12, 1, NULL, NULL, 4, 'habitacion', 9, 90),
(13, 1, NULL, NULL, 2, 'habitacion', 5, 50),
(14, 1, NULL, NULL, 4, 'habitacion', 5, 60),
(20, 2, NULL, NULL, 2, 'habitacion', 7, 70),
(21, 2, NULL, NULL, 3, 'habitacion', 8, 80),
(22, 2, NULL, NULL, 4, 'habitacion', 9, 90),
(23, 2, NULL, NULL, 2, 'habitacion', 5, 50),
(24, 2, NULL, NULL, 4, 'habitacion', 6, 60),
(30, 3, NULL, NULL, 2, 'habitacion', 7, 70),
(31, 3, NULL, NULL, 3, 'habitacion', 8, 80),
(32, 3, NULL, NULL, 4, 'habitacion', 9, 90),
(33, 3, NULL, NULL, 2, 'habitacion', 5, 50),
(34, 3, NULL, NULL, 4, 'habitacion', 6, 60),
(40, 4, NULL, NULL, 2, 'habitacion', 7, 70),
(41, 4, NULL, NULL, 3, 'habitacion', 8, 80),
(42, 4, NULL, NULL, 4, 'habitacion', 9, 90),
(43, 4, NULL, NULL, 2, 'habitacion', 5, 50),
(44, 4, NULL, NULL, 4, 'habitacion', 6, 60),
(50, 5, NULL, NULL, 2, 'habitacion', 7, 70),
(51, 5, NULL, NULL, 3, 'habitacion', 8, 80),
(52, 5, NULL, NULL, 4, 'habitacion', 9, 90),
(53, 5, NULL, NULL, 2, 'habitacion', 5, 50),
(54, 5, NULL, NULL, 4, 'habitacion', 6, 60),
(60, 6, NULL, NULL, 2, 'habitacion', 7, 70),
(61, 6, NULL, NULL, 3, 'habitacion', 8, 80),
(62, 6, NULL, NULL, 4, 'habitacion', 9, 90),
(63, 6, NULL, NULL, 2, 'habitacion', 5, 50),
(64, 6, NULL, NULL, 4, 'habitacion', 6, 60),
(70, 7, NULL, NULL, 2, 'habitacion', 7, 70),
(71, 7, NULL, NULL, 3, 'habitacion', 8, 80),
(72, 7, NULL, NULL, 4, 'habitacion', 9, 90),
(73, 7, NULL, NULL, 2, 'habitacion', 5, 50),
(74, 7, NULL, NULL, 4, 'habitacion', 6, 60),
(80, 8, NULL, NULL, 2, 'habitacion', 7, 70),
(81, 8, NULL, NULL, 3, 'habitacion', 8, 80),
(82, 8, NULL, NULL, 4, 'habitacion', 9, 90),
(83, 8, NULL, NULL, 2, 'habitacion', 5, 50),
(84, 8, NULL, NULL, 4, 'habitacion', 6, 60),
(90, 9, NULL, NULL, 2, 'habitacion', 7, 70),
(91, 9, NULL, NULL, 3, 'habitacion', 8, 80),
(92, 9, NULL, NULL, 4, 'habitacion', 9, 90),
(93, 9, NULL, NULL, 2, 'habitacion', 5, 50),
(94, 9, NULL, NULL, 4, 'habitacion', 6, 60),
(100, 10, NULL, NULL, 2, 'habitacion', 7, 70),
(101, 10, NULL, NULL, 3, 'habitacion', 8, 80),
(102, 10, NULL, NULL, 4, 'habitacion', 9, 90),
(103, 10, NULL, NULL, 2, 'habitacion', 5, 50),
(104, 10, NULL, NULL, 4, 'habitacion', 6, 60),
(110, 11, NULL, NULL, 2, 'habitacion', 7, 70),
(111, 11, NULL, NULL, 3, 'habitacion', 8, 80),
(112, 11, NULL, NULL, 4, 'habitacion', 9, 90),
(113, 11, NULL, NULL, 2, 'habitacion', 5, 50),
(114, 11, NULL, NULL, 4, 'habitacion', 6, 60),
(120, 12, NULL, NULL, 2, 'habitacion', 7, 70),
(121, 12, NULL, NULL, 3, 'habitacion', 8, 80),
(122, 12, NULL, NULL, 4, 'habitacion', 9, 90),
(123, 12, NULL, NULL, 2, 'habitacion', 5, 50),
(124, 12, NULL, NULL, 4, 'habitacion', 6, 60),
(130, 13, NULL, NULL, 2, 'habitacion', 7, 70),
(131, 13, NULL, NULL, 3, 'habitacion', 8, 80),
(132, 13, NULL, NULL, 4, 'habitacion', 9, 90),
(133, 13, NULL, NULL, 2, 'habitacion', 5, 50),
(134, 13, NULL, NULL, 4, 'habitacion', 6, 60),
(140, 14, NULL, NULL, 2, 'habitacion', 7, 70),
(141, 14, NULL, NULL, 3, 'habitacion', 8, 80),
(142, 14, NULL, NULL, 4, 'habitacion', 9, 90),
(143, 14, NULL, NULL, 2, 'habitacion', 5, 50),
(144, 14, NULL, NULL, 4, 'habitacion', 6, 60),
(150, 15, NULL, NULL, 2, 'habitacion', 7, 70),
(151, 15, NULL, NULL, 3, 'habitacion', 8, 80),
(152, 15, NULL, NULL, 4, 'habitacion', 9, 90),
(153, 15, NULL, NULL, 2, 'habitacion', 5, 50),
(154, 15, NULL, NULL, 4, 'habitacion', 6, 60),
(160, NULL, 20, NULL, NULL, 'Dormitorio', 5, NULL),
(161, NULL, 20, NULL, NULL, 'Sala', 5, NULL),
(162, NULL, 20, NULL, NULL, 'Cocina', 5, NULL),
(163, NULL, 20, NULL, NULL, 'Baño', 5, NULL),
(164, NULL, 20, NULL, NULL, 'Comedor', 5, NULL),
(165, NULL, 20, NULL, NULL, 'Dormitorio2', 5, NULL),
(166, NULL, 20, NULL, NULL, 'Garaje', 5, NULL),
(167, NULL, 20, NULL, NULL, 'Balcon', 5, NULL),
(170, NULL, 21, NULL, NULL, 'Dormitorio', 6, NULL),
(171, NULL, 21, NULL, NULL, 'Sala', 6, NULL),
(172, NULL, 21, NULL, NULL, 'Cocina', 6, NULL),
(173, NULL, 21, NULL, NULL, 'Baño', 6, NULL),
(174, NULL, 21, NULL, NULL, 'Comedor', 6, NULL),
(175, NULL, 21, NULL, NULL, 'Dormitorio2', 6, NULL),
(176, NULL, 21, NULL, NULL, 'Garaje', 6, NULL),
(177, NULL, 21, NULL, NULL, 'Balcon', 6, NULL),
(180, NULL, 22, NULL, NULL, 'Dormitorio', 7, NULL),
(181, NULL, 22, NULL, NULL, 'Sala', 7, NULL),
(182, NULL, 22, NULL, NULL, 'Cocina', 7, NULL),
(183, NULL, 22, NULL, NULL, 'Baño', 7, NULL),
(184, NULL, 22, NULL, NULL, 'Comedor', 7, NULL),
(185, NULL, 22, NULL, NULL, 'Dormitorio2', 7, NULL),
(186, NULL, 22, NULL, NULL, 'Garaje', 7, NULL),
(187, NULL, 22, NULL, NULL, 'Balcon', 7, NULL),
(190, NULL, 23, NULL, NULL, 'Dormitorio', 8, NULL),
(191, NULL, 23, NULL, NULL, 'Sala', 8, NULL),
(192, NULL, 23, NULL, NULL, 'Cocina', 8, NULL),
(193, NULL, 23, NULL, NULL, 'Baño', 8, NULL),
(194, NULL, 23, NULL, NULL, 'Comedor', 8, NULL),
(195, NULL, 23, NULL, NULL, 'Dormitorio2', 8, NULL),
(196, NULL, 23, NULL, NULL, 'Garaje', 8, NULL),
(197, NULL, 23, NULL, NULL, 'Balcon', 8, NULL),
(200, NULL, 24, NULL, NULL, 'Dormitorio', 5, NULL),
(201, NULL, 24, NULL, NULL, 'Sala', 5, NULL),
(202, NULL, 24, NULL, NULL, 'Cocina', 5, NULL),
(203, NULL, 24, NULL, NULL, 'Baño', 5, NULL),
(204, NULL, 24, NULL, NULL, 'Comedor', 5, NULL),
(205, NULL, 24, NULL, NULL, 'Dormitorio2', 5, NULL),
(206, NULL, 24, NULL, NULL, 'Garaje', 5, NULL),
(207, NULL, 24, NULL, NULL, 'Balcon', 5, NULL),
(210, NULL, 25, NULL, NULL, 'Dormitorio', 6, NULL),
(211, NULL, 25, NULL, NULL, 'Sala', 6, NULL),
(212, NULL, 25, NULL, NULL, 'Cocina', 6, NULL),
(213, NULL, 25, NULL, NULL, 'Baño', 6, NULL),
(214, NULL, 25, NULL, NULL, 'Comedor', 6, NULL),
(215, NULL, 25, NULL, NULL, 'Dormitorio2', 6, NULL),
(216, NULL, 25, NULL, NULL, 'Garaje', 6, NULL),
(217, NULL, 25, NULL, NULL, 'Balcon', 6, NULL),
(220, NULL, 26, NULL, NULL, 'Dormitorio', 7, NULL),
(221, NULL, 26, NULL, NULL, 'Sala', 7, NULL),
(222, NULL, 26, NULL, NULL, 'Cocina', 7, NULL),
(223, NULL, 26, NULL, NULL, 'Baño', 7, NULL),
(224, NULL, 26, NULL, NULL, 'Comedor', 7, NULL),
(225, NULL, 26, NULL, NULL, 'Dormitorio2', 7, NULL),
(226, NULL, 26, NULL, NULL, 'Garaje', 7, NULL),
(227, NULL, 26, NULL, NULL, 'Balcon', 7, NULL),
(230, NULL, 27, NULL, NULL, 'Dormitorio', 8, NULL),
(231, NULL, 27, NULL, NULL, 'Sala', 8, NULL),
(232, NULL, 27, NULL, NULL, 'Cocina', 8, NULL),
(233, NULL, 27, NULL, NULL, 'Baño', 8, NULL),
(234, NULL, 27, NULL, NULL, 'Comedor', 8, NULL),
(235, NULL, 27, NULL, NULL, 'Dormitorio2', 8, NULL),
(236, NULL, 27, NULL, NULL, 'Garaje', 8, NULL),
(237, NULL, 27, NULL, NULL, 'Balcon', 8, NULL),
(240, NULL, NULL, 30, NULL, 'Dormitorio', 5, NULL),
(241, NULL, NULL, 30, NULL, 'Sala', 5, NULL),
(242, NULL, NULL, 30, NULL, 'Cocina', 5, NULL),
(243, NULL, NULL, 30, NULL, 'Baño', 5, NULL),
(244, NULL, NULL, 30, NULL, 'Comedor', 5, NULL),
(245, NULL, NULL, 30, NULL, 'Dormitorio2', 5, NULL),
(246, NULL, NULL, 30, NULL, 'Garaje', 5, NULL),
(247, NULL, NULL, 30, NULL, 'Balcon', 5, NULL),
(250, NULL, NULL, 31, NULL, 'Dormitorio', 6, NULL),
(251, NULL, NULL, 31, NULL, 'Sala', 6, NULL),
(252, NULL, NULL, 31, NULL, 'Cocina', 6, NULL),
(253, NULL, NULL, 31, NULL, 'Baño', 6, NULL),
(254, NULL, NULL, 31, NULL, 'Comedor', 6, NULL),
(255, NULL, NULL, 31, NULL, 'Dormitorio2', 6, NULL),
(256, NULL, NULL, 31, NULL, 'Garaje', 6, NULL),
(257, NULL, NULL, 31, NULL, 'Balcon', 6, NULL),
(260, NULL, NULL, 32, NULL, 'Dormitorio', 7, NULL),
(261, NULL, NULL, 32, NULL, 'Sala', 7, NULL),
(262, NULL, NULL, 32, NULL, 'Cocina', 7, NULL),
(263, NULL, NULL, 32, NULL, 'Baño', 7, NULL),
(264, NULL, NULL, 32, NULL, 'Comedor', 7, NULL),
(265, NULL, NULL, 32, NULL, 'Dormitorio2', 7, NULL),
(266, NULL, NULL, 32, NULL, 'Garaje', 7, NULL),
(267, NULL, NULL, 32, NULL, 'Balcon', 7, NULL),
(270, NULL, NULL, 33, NULL, 'Dormitorio', 10, NULL),
(271, NULL, NULL, 33, NULL, 'Sala', 10, NULL),
(272, NULL, NULL, 33, NULL, 'Cocina', 10, NULL),
(273, NULL, NULL, 33, NULL, 'Baño', 10, NULL),
(274, NULL, NULL, 33, NULL, 'Comedor', 10, NULL),
(275, NULL, NULL, 33, NULL, 'Dormitorio2', 10, NULL),
(276, NULL, NULL, 33, NULL, 'Garaje', 10, NULL),
(277, NULL, NULL, 33, NULL, 'Balcon', 10, NULL),
(280, NULL, NULL, 34, NULL, 'Dormitorio', 5, NULL),
(281, NULL, NULL, 34, NULL, 'Sala', 5, NULL),
(282, NULL, NULL, 34, NULL, 'Cocina', 5, NULL),
(283, NULL, NULL, 34, NULL, 'Baño', 5, NULL),
(284, NULL, NULL, 34, NULL, 'Comedor', 5, NULL),
(285, NULL, NULL, 34, NULL, 'Dormitorio2', 5, NULL),
(286, NULL, NULL, 34, NULL, 'Garaje', 5, NULL),
(287, NULL, NULL, 34, NULL, 'Balcon', 5, NULL),
(290, NULL, NULL, 35, NULL, 'Dormitorio', 6, NULL),
(291, NULL, NULL, 35, NULL, 'Sala', 6, NULL),
(292, NULL, NULL, 35, NULL, 'Cocina', 6, NULL),
(293, NULL, NULL, 35, NULL, 'Baño', 6, NULL),
(294, NULL, NULL, 35, NULL, 'Comedor', 6, NULL),
(295, NULL, NULL, 35, NULL, 'Dormitorio2', 6, NULL),
(296, NULL, NULL, 35, NULL, 'Garaje', 6, NULL),
(297, NULL, NULL, 35, NULL, 'Balcon', 6, NULL),
(300, NULL, NULL, 36, NULL, 'Dormitorio', 7, NULL),
(301, NULL, NULL, 36, NULL, 'Sala', 7, NULL),
(302, NULL, NULL, 36, NULL, 'Cocina', 7, NULL),
(303, NULL, NULL, 36, NULL, 'Baño', 7, NULL),
(304, NULL, NULL, 36, NULL, 'Comedor', 7, NULL),
(305, NULL, NULL, 36, NULL, 'Dormitorio2', 7, NULL),
(306, NULL, NULL, 36, NULL, 'Garaje', 7, NULL),
(307, NULL, NULL, 36, NULL, 'Balcon', 7, NULL),
(310, NULL, NULL, 37, NULL, 'Dormitorio', 10, NULL),
(311, NULL, NULL, 37, NULL, 'Sala', 10, NULL),
(312, NULL, NULL, 37, NULL, 'Cocina', 10, NULL),
(313, NULL, NULL, 37, NULL, 'Baño', 10, NULL),
(314, NULL, NULL, 37, NULL, 'Comedor', 10, NULL),
(315, NULL, NULL, 37, NULL, 'Dormitorio2', 10, NULL),
(316, NULL, NULL, 37, NULL, 'Garaje', 10, NULL),
(317, NULL, NULL, 37, NULL, 'Balcon', 10, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `codigohotel` int(11) NOT NULL,
  `nombrealojamiento` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `habitacionesdisponibles` int(11) DEFAULT NULL,
  `numeroEstrellas` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `numeroreservas` int(11) DEFAULT NULL,
  `wifi` varchar(50) DEFAULT NULL,
  `piscina` varchar(50) DEFAULT NULL,
  `spa` varchar(50) DEFAULT NULL,
  `parking` varchar(50) DEFAULT NULL,
  `aireacondicionado` varchar(50) DEFAULT NULL,
  `restaurante` varchar(50) DEFAULT NULL,
  `bar` varchar(50) DEFAULT NULL,
  `gym` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`codigohotel`, `nombrealojamiento`, `ubicacion`, `habitacionesdisponibles`, `numeroEstrellas`, `precio`, `numeroreservas`, `wifi`, `piscina`, `spa`, `parking`, `aireacondicionado`, `restaurante`, `bar`, `gym`) VALUES
(1, 'Hotel1', 'Bilbao', 5, 3, 40, 21, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(2, 'Hotel2', 'Bilbao', 5, 3, 40, 20, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(3, 'Hotel3', 'Santurce', 5, 4, 50, 18, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(4, 'Hotel4', 'Las Arenas', 5, 5, 60, 17, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(5, 'Hotel5', 'Barakaldo', 5, 4, 50, 16, 'true', 'true', 'false', 'true', 'true', 'true', 'true', 'true'),
(6, 'Hotel6', 'Bilbao', 5, 2, 30, 15, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(7, 'Hotel7', 'Las Arenas', 5, 2, 30, 16, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(8, 'Hotel8', 'Bilbao', 5, 2, 30, 14, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(9, 'Hotel9', 'Santurce', 5, 2, 30, 13, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(10, 'Hotel10', 'Bilbao', 5, 3, 40, 14, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(11, 'Hotel11', 'Las Arenas', 5, 3, 10, 10, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(12, 'Hotel12', 'Bilbao', 5, 3, 40, 9, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(13, 'Hotel13', 'Barakaldo', 5, 4, 50, 11, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(14, 'Hotel14', 'Santurce', 5, 3, 40, 7, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(15, 'Hotel15', 'Bilbao', 5, 3, 40, 14, 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `popularidadapartamento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `popularidadapartamento` (
`codigoapartamento` int(11)
,`nombrealojamiento` varchar(50)
,`ubicacion` varchar(50)
,`habitacionesdisponibles` int(11)
,`precioapartamento` double
,`numeroreservas` int(11)
,`mcuadrados` double
,`piso` int(11)
,`wifi` varchar(50)
,`piscina` varchar(50)
,`spa` varchar(50)
,`parking` varchar(50)
,`aireacondicionado` varchar(50)
,`restaurante` varchar(50)
,`bar` varchar(50)
,`gym` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `popularidadcasa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `popularidadcasa` (
`codigocasa` int(11)
,`nombrealojamiento` varchar(50)
,`ubicacion` varchar(50)
,`habitacionesdisponibles` int(11)
,`preciocasa` double
,`numeroreservas` int(11)
,`mcuadrados` double
,`nbaños` int(11)
,`wifi` varchar(50)
,`piscina` varchar(50)
,`spa` varchar(50)
,`parking` varchar(50)
,`aireacondicionado` varchar(50)
,`restaurante` varchar(50)
,`bar` varchar(50)
,`gym` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `popularidadhotel`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `popularidadhotel` (
`codigohotel` int(11)
,`nombrealojamiento` varchar(50)
,`ubicacion` varchar(50)
,`habitacionesdisponibles` int(11)
,`numeroEstrellas` int(11)
,`precio` double
,`numeroreservas` int(11)
,`wifi` varchar(50)
,`piscina` varchar(50)
,`spa` varchar(50)
,`parking` varchar(50)
,`aireacondicionado` varchar(50)
,`restaurante` varchar(50)
,`bar` varchar(50)
,`gym` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `precioapartamento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `precioapartamento` (
`codigoapartamento` int(11)
,`nombrealojamiento` varchar(50)
,`ubicacion` varchar(50)
,`habitacionesdisponibles` int(11)
,`precioapartamento` double
,`numeroreservas` int(11)
,`mcuadrados` double
,`piso` int(11)
,`wifi` varchar(50)
,`piscina` varchar(50)
,`spa` varchar(50)
,`parking` varchar(50)
,`aireacondicionado` varchar(50)
,`restaurante` varchar(50)
,`bar` varchar(50)
,`gym` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `preciocasa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `preciocasa` (
`codigocasa` int(11)
,`nombrealojamiento` varchar(50)
,`ubicacion` varchar(50)
,`habitacionesdisponibles` int(11)
,`preciocasa` double
,`numeroreservas` int(11)
,`mcuadrados` double
,`nbaños` int(11)
,`wifi` varchar(50)
,`piscina` varchar(50)
,`spa` varchar(50)
,`parking` varchar(50)
,`aireacondicionado` varchar(50)
,`restaurante` varchar(50)
,`bar` varchar(50)
,`gym` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `preciohotel`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `preciohotel` (
`codigohotel` int(11)
,`nombrealojamiento` varchar(50)
,`ubicacion` varchar(50)
,`habitacionesdisponibles` int(11)
,`numeroEstrellas` int(11)
,`precio` double
,`numeroreservas` int(11)
,`wifi` varchar(50)
,`piscina` varchar(50)
,`spa` varchar(50)
,`parking` varchar(50)
,`aireacondicionado` varchar(50)
,`restaurante` varchar(50)
,`bar` varchar(50)
,`gym` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `codigoreserva` int(11) NOT NULL,
  `codigohotel` int(11) DEFAULT NULL,
  `codigocasa` int(11) DEFAULT NULL,
  `codigoapartamento` int(11) DEFAULT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `nombreAlojamiento` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `numeropersonas` int(11) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`codigoreserva`, `codigohotel`, `codigocasa`, `codigoapartamento`, `dni`, `precio`, `nombreAlojamiento`, `ubicacion`, `numeropersonas`, `fechainicio`, `fechafin`) VALUES
(1, 1, NULL, NULL, '12345678L', 70, 'Hotel1', 'Bilbao', 2, '0000-00-00', '0000-00-00'),
(2, 2, NULL, NULL, '87654321Q', 50, 'Hotel2', 'Bilbao', 2, '0000-00-00', '0000-00-00'),
(3, 2, NULL, NULL, '19283746P', 40, 'Hotel2', 'Bilbao', 2, '0000-00-00', '0000-00-00'),
(4, 3, NULL, NULL, '99118273H', 50, 'Hotel3', 'Santurce', 2, '0000-00-00', '0000-00-00'),
(5, 3, NULL, NULL, '12213423D', 70, 'Hotel3', 'Santurce', 2, '0000-00-00', '0000-00-00'),
(6, 3, NULL, NULL, '11111111T', 70, 'Hotel3', 'Santurce', 2, '0000-00-00', '0000-00-00'),
(7, 4, NULL, NULL, '22222222F', 50, 'Hotel4', 'Las Arenas', 2, '0000-00-00', '0000-00-00'),
(8, 4, NULL, NULL, '33333333D', 70, 'Hotel4', 'Las Arenas', 2, '0000-00-00', '0000-00-00'),
(9, 4, NULL, NULL, '44444444V', 50, 'Hotel4', 'Las Arenas', 2, '0000-00-00', '0000-00-00'),
(10, 4, NULL, NULL, '55555555J', 70, 'Hotel4', 'Las Arenas', 2, '0000-00-00', '0000-00-00'),
(11, 5, NULL, NULL, '12324453R', 70, 'Hotel5', 'Barakaldo', 2, '0000-00-00', '0000-00-00'),
(12, 5, NULL, NULL, '66666666S', 50, 'Hotel5', 'Barakaldo', 2, '0000-00-00', '0000-00-00'),
(13, 5, NULL, NULL, '77777777M', 70, 'Hotel5', 'Barakaldo', 2, '0000-00-00', '0000-00-00'),
(14, 5, NULL, NULL, '88888888X', 50, 'Hotel5', 'Barakaldo', 2, '0000-00-00', '0000-00-00'),
(15, 5, NULL, NULL, '99999999C', 70, 'Hotel5', 'Barakaldo', 2, '0000-00-00', '0000-00-00'),
(16, 6, NULL, NULL, '99228833N', 70, 'Hotel6', 'Bilbao', 2, '0000-00-00', '0000-00-00'),
(17, 7, NULL, NULL, '11221133Y', 50, 'Hotel7', 'Las Arenas', 2, '0000-00-00', '0000-00-00'),
(18, 8, NULL, NULL, '55884938B', 50, 'Hotel8', 'Bilbao', 2, '0000-00-00', '0000-00-00'),
(19, 9, NULL, NULL, '12122445J', 50, 'Hotel9', 'Santurce', 2, '0000-00-00', '0000-00-00'),
(20, 9, NULL, NULL, '00220039X', 70, 'Hotel9', 'Santurce', 2, '0000-00-00', '0000-00-00'),
(21, NULL, 20, NULL, '12122445J', 50, 'Casa20', 'Bilbao', 2, '0000-00-00', '0000-00-00'),
(22, NULL, 21, NULL, '00220039X', 70, 'Casa21', 'Santurce', 2, '0000-00-00', '0000-00-00'),
(23, NULL, NULL, 30, '12122445J', 50, 'Apartamento30', 'Barakaldo', 2, '0000-00-00', '0000-00-00'),
(24, NULL, NULL, 31, '00220039X', 70, 'Apartamento31', 'Las Arenas', 2, '0000-00-00', '0000-00-00'),
(25, 2, 0, 0, '00000000C', 350, 'Hotel2', 'Bilbao', 1, '2019-05-27', '2019-05-31'),
(26, 10, 0, 0, '00000000C', 400, 'Hotel10', 'Bilbao', 1, '2019-05-27', '2019-05-31'),
(27, 15, 0, 0, '00000000C', 360, 'Hotel15', 'Bilbao', 1, '2019-05-20', '2019-05-26'),
(28, 10, 0, 0, '00000000C', 648, 'Hotel10', 'Bilbao', 1, '2019-05-20', '2019-05-26'),
(29, 1, 0, 0, '00000000C', 576, 'Hotel1', 'Bilbao', 3, '2019-05-20', '2019-05-26'),
(30, 0, 20, 0, '00000000C', 720, 'Casa20', 'Bilbao', 1, '2019-05-20', '2019-05-26'),
(31, 0, 22, 0, '00000000C', 864, 'Casa22', 'Barakaldo', 1, '2019-05-20', '2019-05-26'),
(32, 0, 22, 0, '00000000C', 600, 'Casa22', 'Barakaldo', 1, '2019-05-27', '2019-05-31'),
(33, 0, 21, 0, '00000000C', 792, 'Casa21', 'Santurce', 1, '2019-05-20', '2019-05-26'),
(34, 0, 22, 0, '00000000C', 948, 'Casa22', 'Barakaldo', 1, '2019-06-03', '2019-06-09'),
(35, 0, 0, 32, '00000000C', 720, 'Apartamento32', 'Bilbao', 1, '2019-05-20', '2019-05-26'),
(36, 0, 0, 30, '00000000C', 576, 'Apartamento30', 'Barakaldo', 1, '2019-05-20', '2019-05-26'),
(37, 8, 0, 0, '00000000C', 869.6, 'Hotel8', 'Bilbao', 1, '2019-06-03', '2019-06-09'),
(38, 7, 0, 0, '00000000C', 400, 'Hotel7', 'Las Arenas', 1, '2019-05-27', '2019-05-31'),
(39, 7, 0, 0, '00000000C', 953, 'Hotel7', 'Las Arenas', 1, '2019-06-10', '2019-06-16'),
(40, 13, 0, 0, '00000000C', 360, 'Hotel13', 'Barakaldo', 1, '2019-05-27', '2019-05-31'),
(41, 13, 0, 0, '00000000C', 395, 'Hotel13', 'Barakaldo', 1, '2019-06-17', '2019-06-23'),
(42, 0, 20, 0, '00000000C', 790, 'Casa20', 'Bilbao', 1, '2019-06-24', '2019-06-30'),
(43, 0, 0, 30, '00000000C', 632, 'Apartamento30', 'Barakaldo', 1, '2019-06-24', '2019-06-30'),
(44, 15, 0, 0, '00000000T', 695, 'Hotel15', 'Bilbao', 1, '2019-05-20', '2019-05-26'),
(45, 15, 0, 0, '00000000T', 695, 'Hotel15', 'Bilbao', 2, '2019-05-20', '2019-05-26'),
(46, 15, 0, 0, '00000000T', 767, 'Hotel15', 'Bilbao', 2, '2019-05-20', '2019-05-26'),
(47, 15, 0, 0, '00000000T', 839, 'Hotel15', 'Bilbao', 2, '2019-05-20', '2019-05-26'),
(48, 15, 0, 0, '00000000T', 839, 'Hotel15', 'Bilbao', 2, '2019-09-16', '2019-09-22'),
(49, 0, 0, 33, '00000000T', 1836, 'Apartamento33', 'Santurce', 1, '2019-06-24', '2019-06-30'),
(50, 0, 0, 31, '00000000T', 1046, 'Apartamento31', 'Las Arenas', 1, '2019-06-24', '2019-06-30'),
(51, 10, 0, 0, '00000000C', 765, 'Hotel10', 'Bilbao', 1, '2019-05-20', '2019-05-26'),
(52, 9, 0, 0, '00000000T', 1123, 'Hotel9', 'Santurce', 3, '2019-05-20', '2019-05-26'),
(53, 6, 0, 0, '00000000T', 983, 'Hotel6', 'Bilbao', 3, '2019-05-20', '2019-05-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservahotel`
--

CREATE TABLE `reservahotel` (
  `codigoreservahotel` int(11) NOT NULL,
  `codigoreserva` int(11) DEFAULT NULL,
  `codigohabitacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservahotel`
--

INSERT INTO `reservahotel` (`codigoreservahotel`, `codigoreserva`, `codigohabitacion`) VALUES
(1, NULL, NULL),
(2, 25, 20),
(3, 26, 101),
(4, 27, 153),
(5, 28, 102),
(6, 29, 11),
(7, 37, 82),
(8, 38, 71),
(9, 39, 70),
(10, 40, 130),
(11, 40, 132),
(12, 41, 133),
(13, 44, 153),
(14, 45, 153),
(15, 46, 154),
(16, 47, 150),
(17, 48, 150),
(18, 51, 103),
(19, 52, 92),
(20, 53, 121),
(21, 53, 62),
(22, 54, 82);

-- --------------------------------------------------------

--
-- Estructura para la vista `popularidadapartamento`
--
DROP TABLE IF EXISTS `popularidadapartamento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popularidadapartamento`  AS  select `apartamento`.`codigoapartamento` AS `codigoapartamento`,`apartamento`.`nombrealojamiento` AS `nombrealojamiento`,`apartamento`.`ubicacion` AS `ubicacion`,`apartamento`.`habitacionesdisponibles` AS `habitacionesdisponibles`,`apartamento`.`precioapartamento` AS `precioapartamento`,`apartamento`.`numeroreservas` AS `numeroreservas`,`apartamento`.`mcuadrados` AS `mcuadrados`,`apartamento`.`piso` AS `piso`,`apartamento`.`wifi` AS `wifi`,`apartamento`.`piscina` AS `piscina`,`apartamento`.`spa` AS `spa`,`apartamento`.`parking` AS `parking`,`apartamento`.`aireacondicionado` AS `aireacondicionado`,`apartamento`.`restaurante` AS `restaurante`,`apartamento`.`bar` AS `bar`,`apartamento`.`gym` AS `gym` from `apartamento` order by `apartamento`.`numeroreservas` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `popularidadcasa`
--
DROP TABLE IF EXISTS `popularidadcasa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popularidadcasa`  AS  select `casa`.`codigocasa` AS `codigocasa`,`casa`.`nombrealojamiento` AS `nombrealojamiento`,`casa`.`ubicacion` AS `ubicacion`,`casa`.`habitacionesdisponibles` AS `habitacionesdisponibles`,`casa`.`preciocasa` AS `preciocasa`,`casa`.`numeroreservas` AS `numeroreservas`,`casa`.`mcuadrados` AS `mcuadrados`,`casa`.`nbaños` AS `nbaños`,`casa`.`wifi` AS `wifi`,`casa`.`piscina` AS `piscina`,`casa`.`spa` AS `spa`,`casa`.`parking` AS `parking`,`casa`.`aireacondicionado` AS `aireacondicionado`,`casa`.`restaurante` AS `restaurante`,`casa`.`bar` AS `bar`,`casa`.`gym` AS `gym` from `casa` order by `casa`.`numeroreservas` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `popularidadhotel`
--
DROP TABLE IF EXISTS `popularidadhotel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popularidadhotel`  AS  select `hotel`.`codigohotel` AS `codigohotel`,`hotel`.`nombrealojamiento` AS `nombrealojamiento`,`hotel`.`ubicacion` AS `ubicacion`,`hotel`.`habitacionesdisponibles` AS `habitacionesdisponibles`,`hotel`.`numeroEstrellas` AS `numeroEstrellas`,`hotel`.`precio` AS `precio`,`hotel`.`numeroreservas` AS `numeroreservas`,`hotel`.`wifi` AS `wifi`,`hotel`.`piscina` AS `piscina`,`hotel`.`spa` AS `spa`,`hotel`.`parking` AS `parking`,`hotel`.`aireacondicionado` AS `aireacondicionado`,`hotel`.`restaurante` AS `restaurante`,`hotel`.`bar` AS `bar`,`hotel`.`gym` AS `gym` from `hotel` order by `hotel`.`numeroreservas` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `precioapartamento`
--
DROP TABLE IF EXISTS `precioapartamento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `precioapartamento`  AS  select `apartamento`.`codigoapartamento` AS `codigoapartamento`,`apartamento`.`nombrealojamiento` AS `nombrealojamiento`,`apartamento`.`ubicacion` AS `ubicacion`,`apartamento`.`habitacionesdisponibles` AS `habitacionesdisponibles`,`apartamento`.`precioapartamento` AS `precioapartamento`,`apartamento`.`numeroreservas` AS `numeroreservas`,`apartamento`.`mcuadrados` AS `mcuadrados`,`apartamento`.`piso` AS `piso`,`apartamento`.`wifi` AS `wifi`,`apartamento`.`piscina` AS `piscina`,`apartamento`.`spa` AS `spa`,`apartamento`.`parking` AS `parking`,`apartamento`.`aireacondicionado` AS `aireacondicionado`,`apartamento`.`restaurante` AS `restaurante`,`apartamento`.`bar` AS `bar`,`apartamento`.`gym` AS `gym` from `apartamento` order by `apartamento`.`precioapartamento` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `preciocasa`
--
DROP TABLE IF EXISTS `preciocasa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `preciocasa`  AS  select `casa`.`codigocasa` AS `codigocasa`,`casa`.`nombrealojamiento` AS `nombrealojamiento`,`casa`.`ubicacion` AS `ubicacion`,`casa`.`habitacionesdisponibles` AS `habitacionesdisponibles`,`casa`.`preciocasa` AS `preciocasa`,`casa`.`numeroreservas` AS `numeroreservas`,`casa`.`mcuadrados` AS `mcuadrados`,`casa`.`nbaños` AS `nbaños`,`casa`.`wifi` AS `wifi`,`casa`.`piscina` AS `piscina`,`casa`.`spa` AS `spa`,`casa`.`parking` AS `parking`,`casa`.`aireacondicionado` AS `aireacondicionado`,`casa`.`restaurante` AS `restaurante`,`casa`.`bar` AS `bar`,`casa`.`gym` AS `gym` from `casa` order by `casa`.`preciocasa` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `preciohotel`
--
DROP TABLE IF EXISTS `preciohotel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `preciohotel`  AS  select `hotel`.`codigohotel` AS `codigohotel`,`hotel`.`nombrealojamiento` AS `nombrealojamiento`,`hotel`.`ubicacion` AS `ubicacion`,`hotel`.`habitacionesdisponibles` AS `habitacionesdisponibles`,`hotel`.`numeroEstrellas` AS `numeroEstrellas`,`hotel`.`precio` AS `precio`,`hotel`.`numeroreservas` AS `numeroreservas`,`hotel`.`wifi` AS `wifi`,`hotel`.`piscina` AS `piscina`,`hotel`.`spa` AS `spa`,`hotel`.`parking` AS `parking`,`hotel`.`aireacondicionado` AS `aireacondicionado`,`hotel`.`restaurante` AS `restaurante`,`hotel`.`bar` AS `bar`,`hotel`.`gym` AS `gym` from `hotel` order by `hotel`.`precio` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`codigoapartamento`);

--
-- Indices de la tabla `baseslegales`
--
ALTER TABLE `baseslegales`
  ADD PRIMARY KEY (`codigobaseslegales`);

--
-- Indices de la tabla `cama`
--
ALTER TABLE `cama`
  ADD PRIMARY KEY (`codigocama`);

--
-- Indices de la tabla `casa`
--
ALTER TABLE `casa`
  ADD PRIMARY KEY (`codigocasa`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`codigohabitacion`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`codigohotel`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`codigoreserva`);

--
-- Indices de la tabla `reservahotel`
--
ALTER TABLE `reservahotel`
  ADD PRIMARY KEY (`codigoreservahotel`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `codigoreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `reservahotel`
--
ALTER TABLE `reservahotel`
  MODIFY `codigoreservahotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
