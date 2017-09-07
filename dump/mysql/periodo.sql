-- phpMyAdmin SQL Dump
-- version 4.5.5.1deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-06-2016 a las 17:29:02
-- Versión del servidor: 5.6.28-1
-- Versión de PHP: 5.6.19-2+b1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdpermisos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL,
  `nombre_periodo` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `fecha_recaudo_ini` date NOT NULL,
  `fecha_recaudo_fin` date NOT NULL,
  `estatus` varchar(10) NOT NULL COMMENT '0=inactivo, 1=activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id_periodo`, `nombre_periodo`, `fecha_inicio`, `fecha_cierre`, `fecha_recaudo_ini`, `fecha_recaudo_fin`, `estatus`) VALUES
(1, 'I- 2016', '2016-01-01', '2016-06-30', '2015-12-15', '2016-01-15', '1'),
(2, 'PERIODO II 2016', '2016-08-01', '2017-01-20', '2016-08-01', '2016-08-19', '0'),
(3, 'PERIODO III 2017', '2017-01-04', '2017-07-22', '2016-12-01', '2016-12-31', '0'),
(5, 'PII-2017', '2017-07-01', '2017-12-31', '2017-06-01', '2017-06-30', '0'),
(6, 'UPTOS I-2016', '2016-03-14', '2016-03-27', '2016-03-07', '2016-03-11', '0'),
(7, 'periodo', '2016-06-20', '2016-11-11', '2016-06-13', '2016-07-02', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
