-- phpMyAdmin SQL Dump
-- version 4.6.3deb1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-08-2016 a las 08:37:06
-- Versión del servidor: 5.6.30-1
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
CREATE DATABASE IF NOT EXISTS `bdpermisos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bdpermisos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `codigo_cargo` varchar(10) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `codigo_cargo`, `nombre_cargo`) VALUES
(1, '001', 'Coordinador de Programación'),
(2, '002', 'Secretaria'),
(3, '003', 'Asesor Legal'),
(4, '004', 'Jefe de Personal'),
(5, '005', 'Jefe de División'),
(6, '006', 'Director');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `codigo_departamento` varchar(50) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `codigo_departamento`, `nombre_departamento`) VALUES
(1, '001', 'División de Informática'),
(2, '002', 'División de Personal'),
(3, '003', 'Secretaria de Personal'),
(4, '004', 'División de Asesoría Jurídica'),
(5, '005', 'Coordinación de Bienestar Social'),
(6, '006', 'Coordinación de Licencias'),
(7, '007', 'Plantel Educativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

DROP TABLE IF EXISTS `periodo`;
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
(8, 'PERIODO ESCOLAR 2015-2016', '2015-09-01', '2016-08-31', '2015-09-01', '2015-12-20', '1'),
(9, 'PERIODO 2016-I VIII CONT UNICO', '2016-05-01', '2017-04-30', '2016-05-01', '2017-04-30', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `cedula_personal` varchar(15) NOT NULL,
  `nombre_personal` varchar(50) NOT NULL,
  `apellido_personal` varchar(50) NOT NULL,
  `correo_personal` varchar(100) NOT NULL,
  `telefono_personal` varchar(100) NOT NULL,
  `foto_personal` varchar(100) NOT NULL,
  `estatus_personal` varchar(10) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `cedula_personal`, `nombre_personal`, `apellido_personal`, `correo_personal`, `telefono_personal`, `foto_personal`, `estatus_personal`, `id_departamento`, `id_cargo`) VALUES
(1, '11829328', 'Oswaldo', 'Hernández', 'oswaldoehc@gmail.com', '04165936395', '11829328', '1', 1, 1),
(8, '12333444', 'José Gregorio', 'Rincones', 'perdorperez@gmail.com', '4241234567', '12333444', '1', 2, 4),
(9, '15666777', 'Maria', 'Silva', 'mariasilva@gmail.com', '04265678909', '15666777', '1', 4, 3),
(10, '10666999', 'Rosa', 'Bermudez', 'rosabermudez@gmail.com', '04123456789', '10666999', '1', 5, 2),
(11, '17326068', 'Alberto', 'AbellÃ¡n Nuez', 'albertoabell@gmail.com', '4161234567', '17326068', '1', 5, 1),
(12, '17308569', 'Fernanda', 'Aguilar Centelles', 'ferminaguil@gmail.com', '00000000001', '17308569', '1', 6, 2),
(14, '25428642', 'Enrique', 'Alías Ciruelas', 'enriquealías@gmail.com', '00000000003', '25428642', '1', 3, 2),
(15, '11222321', 'Valerio', 'Serrano', 'valerio@gmai.com', '-5234153', '11222321', '1', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `clave_usuario` varchar(50) NOT NULL,
  `nivel_usuario` varchar(2) NOT NULL COMMENT '0:Admin, 1:Jefe Dpto, 2:Secretaría, 3:Juridica, 4:Director, 5:Bienestar, 6:Licencia, 7:Dirección',
  `id_persona` int(11) NOT NULL,
  `fechasesion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `clave_usuario`, `nivel_usuario`, `id_persona`, `fechasesion`) VALUES
(1, 'admin', '1234', '0', 1, '2016-04-19 03:38:54'),
(2, 'jefe', '1234', '1', 8, '2016-04-19 05:05:00'),
(3, 'secre', '1234', '2', 14, '2016-04-19 05:04:20'),
(4, 'juri', '1234', '3', 9, '2016-04-19 05:03:38'),
(5, 'director', '1234', '4', 11, '2016-04-19 05:03:57'),
(6, 'bienestar', '1234', '5', 10, '2016-04-19 04:59:38'),
(8, 'licencia', '1234', '6', 12, '2016-04-19 05:04:02'),
(9, '11222321SV', '1234', '1', 15, '2016-06-06 05:33:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
