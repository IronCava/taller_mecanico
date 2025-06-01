-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-06-2025 a las 00:12:46
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller_mecanico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `correo`, `telefono`) VALUES
(1, 'Ana Martínez', 'ana@gmail.com', '600123456'),
(2, 'Carlos López', 'carlos@hotmail.com', '677456789'),
(3, 'Laura Gómez', 'laura@outlook.com', '611998877');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `id_mecanico` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`id_mecanico`, `nombre`, `especialidad`) VALUES
(1, 'Pedro Sánchez', 'Motor'),
(2, 'Marta Ruiz', 'Frenos'),
(3, 'Javier Torres', 'Electricidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `id_repuesto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuesto`
--

INSERT INTO `repuesto` (`id_repuesto`, `nombre`, `marca`, `precio_unitario`) VALUES
(1, 'Aceite 10W40', 'Castrol', 25.50),
(2, 'Pastillas de freno', 'Brembo', 45.00),
(3, 'Correa distribución', 'Gates', 120.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `id_vehiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `fecha`, `detalle`, `costo_total`, `id_vehiculo`) VALUES
(1, '2024-05-10', 'Cambio de aceite y filtros', 120.00, 1),
(2, '2024-06-01', 'Revisión de frenos', 200.00, 2),
(3, '2024-06-02', 'Cambio de correa de distribución', 350.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_mecanico`
--

CREATE TABLE `servicio_mecanico` (
  `id_servicio` int(11) NOT NULL,
  `id_mecanico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio_mecanico`
--

INSERT INTO `servicio_mecanico` (`id_servicio`, `id_mecanico`) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_repuesto`
--

CREATE TABLE `servicio_repuesto` (
  `id_servicio` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `cantidad_utilizada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio_repuesto`
--

INSERT INTO `servicio_repuesto` (`id_servicio`, `id_repuesto`, `cantidad_utilizada`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `anio` year(4) DEFAULT NULL,
  `patente` varchar(20) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `marca`, `modelo`, `anio`, `patente`, `id_cliente`) VALUES
(1, 'Toyota', 'Corolla', '2015', 'ABC123', 1),
(2, 'Ford', 'Fiesta', '2018', 'XYZ789', 1),
(3, 'Honda', 'Civic', '2020', 'LMN456', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_1` (
`id_vehiculo` int(11)
,`marca` varchar(50)
,`modelo` varchar(50)
,`anio` year(4)
,`patente` varchar(20)
,`nombre_cliente` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_2` (
`id_servicio` int(11)
,`fecha` date
,`detalle` text
,`costo_total` decimal(10,2)
,`patente` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_3`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_3` (
`cliente` varchar(100)
,`total_gastado` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_4`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_4` (
`id_servicio` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_5`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_5` (
`id_mecanico` int(11)
,`nombre` varchar(100)
,`especialidad` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_6`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_6` (
`id_servicio` int(11)
,`costo_repuestos` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_7`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_7` (
`id_repuesto` int(11)
,`nombre` varchar(100)
,`cantidad_servicios` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_8`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_8` (
`id_vehiculo` int(11)
,`marca` varchar(50)
,`modelo` varchar(50)
,`patente` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_9`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_9` (
`id_cliente` int(11)
,`nombre` varchar(100)
,`cantidad_vehiculos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_10`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_10` (
`id_mecanico` int(11)
,`nombre` varchar(100)
,`total_repuestos_usados` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_1`
--
DROP TABLE IF EXISTS `vista_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_1`  AS SELECT `v`.`id_vehiculo` AS `id_vehiculo`, `v`.`marca` AS `marca`, `v`.`modelo` AS `modelo`, `v`.`anio` AS `anio`, `v`.`patente` AS `patente`, `c`.`nombre` AS `nombre_cliente` FROM (`vehiculo` `v` join `cliente` `c` on(`v`.`id_cliente` = `c`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_2`
--
DROP TABLE IF EXISTS `vista_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_2`  AS SELECT `s`.`id_servicio` AS `id_servicio`, `s`.`fecha` AS `fecha`, `s`.`detalle` AS `detalle`, `s`.`costo_total` AS `costo_total`, `v`.`patente` AS `patente` FROM (`servicio` `s` join `vehiculo` `v` on(`s`.`id_vehiculo` = `v`.`id_vehiculo`)) WHERE `v`.`patente` = 'ABC123' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_3`
--
DROP TABLE IF EXISTS `vista_3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_3`  AS SELECT `c`.`nombre` AS `cliente`, sum(`s`.`costo_total`) AS `total_gastado` FROM ((`cliente` `c` join `vehiculo` `v` on(`c`.`id_cliente` = `v`.`id_cliente`)) join `servicio` `s` on(`v`.`id_vehiculo` = `s`.`id_vehiculo`)) GROUP BY `c`.`id_cliente` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_4`
--
DROP TABLE IF EXISTS `vista_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_4`  AS SELECT `sr`.`id_servicio` AS `id_servicio` FROM `servicio_repuesto` AS `sr` GROUP BY `sr`.`id_servicio` HAVING count(distinct `sr`.`id_repuesto`) > 3 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_5`
--
DROP TABLE IF EXISTS `vista_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_5`  AS SELECT DISTINCT `m`.`id_mecanico` AS `id_mecanico`, `m`.`nombre` AS `nombre`, `m`.`especialidad` AS `especialidad` FROM ((`mecanico` `m` join `servicio_mecanico` `sm` on(`m`.`id_mecanico` = `sm`.`id_mecanico`)) join `servicio` `s` on(`sm`.`id_servicio` = `s`.`id_servicio`)) WHERE year(`s`.`fecha`) = 2024 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_6`
--
DROP TABLE IF EXISTS `vista_6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_6`  AS SELECT `sr`.`id_servicio` AS `id_servicio`, sum(`sr`.`cantidad_utilizada` * `r`.`precio_unitario`) AS `costo_repuestos` FROM (`servicio_repuesto` `sr` join `repuesto` `r` on(`sr`.`id_repuesto` = `r`.`id_repuesto`)) WHERE `sr`.`id_servicio` = 3 GROUP BY `sr`.`id_servicio` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_7`
--
DROP TABLE IF EXISTS `vista_7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_7`  AS SELECT `r`.`id_repuesto` AS `id_repuesto`, `r`.`nombre` AS `nombre`, count(distinct `sr`.`id_servicio`) AS `cantidad_servicios` FROM (`repuesto` `r` join `servicio_repuesto` `sr` on(`r`.`id_repuesto` = `sr`.`id_repuesto`)) GROUP BY `r`.`id_repuesto` HAVING count(distinct `sr`.`id_servicio`) > 5 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_8`
--
DROP TABLE IF EXISTS `vista_8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_8`  AS SELECT `v`.`id_vehiculo` AS `id_vehiculo`, `v`.`marca` AS `marca`, `v`.`modelo` AS `modelo`, `v`.`patente` AS `patente` FROM (`vehiculo` `v` left join `servicio` `s` on(`v`.`id_vehiculo` = `s`.`id_vehiculo`)) WHERE `s`.`id_servicio` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_9`
--
DROP TABLE IF EXISTS `vista_9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_9`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, count(`v`.`id_vehiculo`) AS `cantidad_vehiculos` FROM (`cliente` `c` join `vehiculo` `v` on(`c`.`id_cliente` = `v`.`id_cliente`)) GROUP BY `c`.`id_cliente` HAVING count(`v`.`id_vehiculo`) > 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_10`
--
DROP TABLE IF EXISTS `vista_10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_10`  AS SELECT `m`.`id_mecanico` AS `id_mecanico`, `m`.`nombre` AS `nombre`, sum(`sr`.`cantidad_utilizada`) AS `total_repuestos_usados` FROM ((`mecanico` `m` join `servicio_mecanico` `sm` on(`m`.`id_mecanico` = `sm`.`id_mecanico`)) join `servicio_repuesto` `sr` on(`sm`.`id_servicio` = `sr`.`id_servicio`)) GROUP BY `m`.`id_mecanico` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`id_mecanico`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`id_repuesto`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `servicio_mecanico`
--
ALTER TABLE `servicio_mecanico`
  ADD PRIMARY KEY (`id_servicio`,`id_mecanico`),
  ADD KEY `id_mecanico` (`id_mecanico`);

--
-- Indices de la tabla `servicio_repuesto`
--
ALTER TABLE `servicio_repuesto`
  ADD PRIMARY KEY (`id_servicio`,`id_repuesto`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `patente` (`patente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `id_mecanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`);

--
-- Filtros para la tabla `servicio_mecanico`
--
ALTER TABLE `servicio_mecanico`
  ADD CONSTRAINT `servicio_mecanico_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `servicio_mecanico_ibfk_2` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`);

--
-- Filtros para la tabla `servicio_repuesto`
--
ALTER TABLE `servicio_repuesto`
  ADD CONSTRAINT `servicio_repuesto_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `servicio_repuesto_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuesto` (`id_repuesto`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
