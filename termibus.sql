-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2019 a las 03:10:28
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
-- Base de datos: `termibus`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `verbus` (IN `Cod_Linea1` VARCHAR(50))  NO SQL
select autobus.Cod_bus,autobus.N_plazas,autobus.Consumo_km,autobus.Color
from autobus inner join linea_autobus on autobus.Cod_bus=linea_autobus.Cod_bus
where linea_autobus.Cod_Linea=Cod_Linea1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vercodigoparada` (IN `Cod_Linea1` VARCHAR(50))  NO SQL
select parada.Cod_Parada ,Nombre,Calle,Latitud,longitud 
FROM parada inner join lineaparada on parada.Cod_Parada= lineaparada.Cod_Parada
WHERE Cod_Linea=Cod_Linea1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verlineas` ()  NO SQL
select *
from linea$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autobus`
--

CREATE TABLE `autobus` (
  `Cod_bus` int(11) NOT NULL,
  `N_plazas` int(11) NOT NULL,
  `Consumo_km` float NOT NULL,
  `Color` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `autobus`
--

INSERT INTO `autobus` (`Cod_bus`, `N_plazas`, `Consumo_km`, `Color`) VALUES
(1001, 40, 0.32, 'Rojo'),
(1002, 45, 0.36, 'Negro'),
(1003, 30, 0.29, 'Azul'),
(2001, 45, 0.42, 'Rojo'),
(3001, 37, 0.325, 'Negro'),
(3002, 45, 0.278, 'Azul'),
(4001, 20, 0.18, 'Rojo'),
(4002, 45, 0.326, 'Verde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billete`
--

CREATE TABLE `billete` (
  `Cod_Billete` int(8) NOT NULL,
  `NTrayecto` int(11) NOT NULL,
  `Cod_Linea` varchar(10) COLLATE utf8_bin NOT NULL,
  `Cod_Bus` int(11) NOT NULL,
  `Cod_Parada_Inicio` int(8) NOT NULL,
  `Cod_Parada_Fin` int(8) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `DNI` varchar(9) COLLATE utf8_bin NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `DNI` varchar(9) COLLATE utf8_bin NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_bin NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` char(1) COLLATE utf8_bin NOT NULL,
  `Contraseña` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`DNI`, `Nombre`, `Apellidos`, `Fecha_nac`, `Sexo`, `Contraseña`) VALUES
('11111111C', 'Cris', 'Laez', '1989-06-10', 'V', '4d186321c1a7f0f354b297e8914ab240'),
('15236985K', 'Popeye', 'El marino', '1956-01-17', 'V', 'ec5287c45f0e70ec22d52e8bcbeeb640'),
('16057217E', 'Pepe', 'Gotera', '1975-12-10', 'V', 'ec5287c45f0e70ec22d52e8bcbeeb640'),
('45899844Y', 'Olivia', 'Mercado', '1945-04-18', 'M', 'ec5287c45f0e70ec22d52e8bcbeeb640'),
('78878943G', 'Otilio', 'Ladrillo', '2018-09-10', 'V', 'ec5287c45f0e70ec22d52e8bcbeeb640');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `Cod_Linea` varchar(10) COLLATE utf8_bin NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`Cod_Linea`, `Nombre`) VALUES
('L1', 'Termibus-Plentzia'),
('L2', 'Termibus-Muskiz'),
('L3', 'Termibus-Balmaseda'),
('L4', 'Termibus-Durango');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaparada`
--

CREATE TABLE `lineaparada` (
  `Cod_Linea` varchar(10) COLLATE utf8_bin NOT NULL,
  `Cod_Parada` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `lineaparada`
--

INSERT INTO `lineaparada` (`Cod_Linea`, `Cod_Parada`) VALUES
('L1', 1),
('L1', 3),
('L1', 4),
('L1', 5),
('L1', 6),
('L1', 7),
('L1', 8),
('L2', 1),
('L2', 9),
('L2', 10),
('L2', 11),
('L3', 1),
('L3', 9),
('L3', 13),
('L3', 14),
('L3', 15),
('L4', 1),
('L4', 16),
('L4', 17),
('L4', 18),
('L4', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_autobus`
--

CREATE TABLE `linea_autobus` (
  `Cod_Linea` varchar(10) COLLATE utf8_bin NOT NULL,
  `Cod_bus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `linea_autobus`
--

INSERT INTO `linea_autobus` (`Cod_Linea`, `Cod_bus`) VALUES
('L1', 1001),
('L1', 1002),
('L1', 1003),
('L2', 2001),
('L3', 3001),
('L3', 3002),
('L4', 4001),
('L4', 4002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parada`
--

CREATE TABLE `parada` (
  `Cod_Parada` int(8) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `Calle` varchar(100) COLLATE utf8_bin NOT NULL,
  `Latitud` float NOT NULL,
  `Longitud` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `parada`
--

INSERT INTO `parada` (`Cod_Parada`, `Nombre`, `Calle`, `Latitud`, `Longitud`) VALUES
(1, 'Termibus-Bilbao', 'Luis Briñas', 43.2614, -2.94974),
(3, 'Metro Leioa', 'Otsobarrena', 43.3191, -2.99149),
(4, 'Metro Berango', 'Sabino Arana', 43.367, -2.99921),
(5, 'Metro Larrabasterra', 'BI-634', 43.3759, -2.99183),
(6, 'Ayuntamiento Sopelana', 'Sabino Arana', 43.3814, -2.98109),
(7, 'Asilo Barrika', 'BI-634', 43.4055, -2.96369),
(8, 'Ayuntamiento Plentzia', 'Erribera', 43.4045, -2.94967),
(9, 'Barakaldo - Sagrado Corazon', 'N-634', 43.2833, -2.99605),
(10, 'Ayuntamiento Trapaga', 'Rufino Olaso', 43.3035, -3.03873),
(11, 'Estacion Renfe Muskiz', 'San Julian', 43.3217, -3.11286),
(12, 'Alonsotegui - San Bartolome', 'Erdiko Kalea', 43.245, -2.98991),
(13, 'Estacion Renfe La cuadra - Güeñes', 'Heeriko Plaza', 43.2228, -3.02511),
(14, 'Estacion Renfe Sodupe - Güeñes', 'Gudari Plaza', 43.2017, -3.0513),
(15, 'Balmaseda Centro', 'Campo de las monjas', 43.1926, -3.19725),
(16, 'Amorebieta - Boroa', 'Poligono Boroa', 43.2339, -2.75336),
(17, 'Amorebieta - Centro', 'Lola', 43.219, -2.73358),
(18, 'Iurreta', 'Andaparape Kalea', 43.177, -2.63364),
(19, 'Durango', 'Jose Maria de la Iglesia', 43.1696, -2.63117);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poblacion`
--

CREATE TABLE `poblacion` (
  `Cod_Postal` varchar(5) COLLATE utf8_bin NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `poblacion`
--

INSERT INTO `poblacion` (`Cod_Postal`, `Nombre`) VALUES
('48013', 'Bilbao'),
('48200', 'Durango'),
('48215', 'Iurreta'),
('48340', 'Amorebieta'),
('48510', 'Trapaga'),
('48550', 'Muskiz'),
('48600', 'Sopela'),
('48620', 'Plentzia'),
('48640', 'Berango'),
('48650', 'Barrika'),
('48800', 'Balmaseda'),
('48810', 'Alonsotegi'),
('48840', 'Güeñes'),
('48903', 'Barakaldo'),
('48940', 'Leioa'),
('48970', 'Basauri');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poblacion_parada`
--

CREATE TABLE `poblacion_parada` (
  `Cod_Parada` int(8) NOT NULL,
  `Cod_Postal` varchar(5) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `poblacion_parada`
--

INSERT INTO `poblacion_parada` (`Cod_Parada`, `Cod_Postal`) VALUES
(1, '48013'),
(3, '48940'),
(4, '48640'),
(5, '48600'),
(6, '48600'),
(7, '48650'),
(8, '48620'),
(9, '48903'),
(10, '48510'),
(11, '48550'),
(12, '48810'),
(13, '48840'),
(14, '48840'),
(15, '48800'),
(16, '48340'),
(17, '48340'),
(18, '48215'),
(19, '48200');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autobus`
--
ALTER TABLE `autobus`
  ADD PRIMARY KEY (`Cod_bus`);

--
-- Indices de la tabla `billete`
--
ALTER TABLE `billete`
  ADD PRIMARY KEY (`Cod_Billete`,`NTrayecto`),
  ADD KEY `Cod_Linea` (`Cod_Linea`),
  ADD KEY `Cod_Bus` (`Cod_Bus`),
  ADD KEY `Cod_Parada_Inicio` (`Cod_Parada_Inicio`),
  ADD KEY `Cod_Parada_Fin` (`Cod_Parada_Fin`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`Cod_Linea`);

--
-- Indices de la tabla `lineaparada`
--
ALTER TABLE `lineaparada`
  ADD PRIMARY KEY (`Cod_Linea`,`Cod_Parada`),
  ADD KEY `Cod_Parada` (`Cod_Parada`);

--
-- Indices de la tabla `linea_autobus`
--
ALTER TABLE `linea_autobus`
  ADD PRIMARY KEY (`Cod_Linea`,`Cod_bus`),
  ADD KEY `Cod_bus` (`Cod_bus`);

--
-- Indices de la tabla `parada`
--
ALTER TABLE `parada`
  ADD PRIMARY KEY (`Cod_Parada`);

--
-- Indices de la tabla `poblacion`
--
ALTER TABLE `poblacion`
  ADD PRIMARY KEY (`Cod_Postal`);

--
-- Indices de la tabla `poblacion_parada`
--
ALTER TABLE `poblacion_parada`
  ADD PRIMARY KEY (`Cod_Parada`,`Cod_Postal`),
  ADD KEY `Cod_Postal` (`Cod_Postal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `billete`
--
ALTER TABLE `billete`
  MODIFY `Cod_Billete` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parada`
--
ALTER TABLE `parada`
  MODIFY `Cod_Parada` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `billete`
--
ALTER TABLE `billete`
  ADD CONSTRAINT `billete_ibfk_1` FOREIGN KEY (`Cod_Linea`) REFERENCES `linea` (`Cod_Linea`),
  ADD CONSTRAINT `billete_ibfk_2` FOREIGN KEY (`Cod_Bus`) REFERENCES `autobus` (`Cod_bus`),
  ADD CONSTRAINT `billete_ibfk_3` FOREIGN KEY (`Cod_Parada_Inicio`) REFERENCES `parada` (`Cod_Parada`),
  ADD CONSTRAINT `billete_ibfk_4` FOREIGN KEY (`Cod_Parada_Fin`) REFERENCES `parada` (`Cod_Parada`),
  ADD CONSTRAINT `billete_ibfk_5` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`);

--
-- Filtros para la tabla `lineaparada`
--
ALTER TABLE `lineaparada`
  ADD CONSTRAINT `lineaparada_ibfk_1` FOREIGN KEY (`Cod_Linea`) REFERENCES `linea` (`Cod_Linea`),
  ADD CONSTRAINT `lineaparada_ibfk_2` FOREIGN KEY (`Cod_Parada`) REFERENCES `parada` (`Cod_Parada`);

--
-- Filtros para la tabla `linea_autobus`
--
ALTER TABLE `linea_autobus`
  ADD CONSTRAINT `linea_autobus_ibfk_1` FOREIGN KEY (`Cod_Linea`) REFERENCES `linea` (`Cod_Linea`),
  ADD CONSTRAINT `linea_autobus_ibfk_2` FOREIGN KEY (`Cod_bus`) REFERENCES `autobus` (`Cod_bus`);

--
-- Filtros para la tabla `poblacion_parada`
--
ALTER TABLE `poblacion_parada`
  ADD CONSTRAINT `poblacion_parada_ibfk_1` FOREIGN KEY (`Cod_Postal`) REFERENCES `poblacion` (`Cod_Postal`),
  ADD CONSTRAINT `poblacion_parada_ibfk_2` FOREIGN KEY (`Cod_Parada`) REFERENCES `parada` (`Cod_Parada`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
