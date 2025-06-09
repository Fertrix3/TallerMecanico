-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2025 a las 21:55:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbtallermecanico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(10) NOT NULL,
  `usuario_id` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `usuario_id`, `nombre`, `rfc`, `telefono`) VALUES
(1616, 9659, 'Loki', '8899', '571637383'),
(1783, 8041, 'Fabian', '9090', '3521007615'),
(4389, 9659, 'Chuy', '7642', '345467891'),
(8530, 8041, 'Ernestino', '8091', '3319381100'),
(8765, 9659, 'Cuco', '9180', '3312253211'),
(9817, 8041, 'Tristán', '6699', '3525261819');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_reparacion`
--

CREATE TABLE `det_reparacion` (
  `det_id` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `pieza_id` int(10) NOT NULL,
  `folio` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `det_reparacion`
--

INSERT INTO `det_reparacion` (`det_id`, `cantidad`, `pieza_id`, `folio`) VALUES
(3972, 1, 6975, 'EV0596'),
(5082, 1, 5561, 'GD4672');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas`
--

CREATE TABLE `piezas` (
  `pieza_id` int(10) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `existencia` int(10) NOT NULL,
  `precio` double NOT NULL,
  `numero_serie` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `piezas`
--

INSERT INTO `piezas` (`pieza_id`, `descripcion`, `existencia`, `precio`, `numero_serie`) VALUES
(3458, 'amortiguador', 3, 400, '5'),
(5072, 'Perno', 30, 70, '4321'),
(5561, 'suspensión', 8, 1000, '4567'),
(6975, 'Bujía', 49, 250.4, '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparacion`
--

CREATE TABLE `reparacion` (
  `folio` varchar(10) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `fecha_entrada` varchar(10) NOT NULL,
  `fecha_salida` varchar(10) NOT NULL,
  `descripcion_falla` varchar(500) NOT NULL,
  `usuario_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reparacion`
--

INSERT INTO `reparacion` (`folio`, `matricula`, `fecha_entrada`, `fecha_salida`, `descripcion_falla`, `usuario_id`) VALUES
('EV0596', '08AGO17', '2025-03-28', '2025-04-12', 'Le falta un cambio de bujía', '5526'),
('GD4672', '13JUN03', '2025-03-28', '2025-04-05', 'Le falla un amortiguador y la suspensión', '1020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `perfil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `username`, `password`, `perfil`) VALUES
(1020, 'Tony', '_tony_', 'carros12', 'mecanico'),
(5526, 'Pablo', '_pablo_', '2655', 'mecanico'),
(8041, 'Julian', '_julian_', 'carros15', 'auxiliar'),
(9659, 'David', '_david_', 'carritos', 'auxiliar'),
(9720, 'Adair', '_adair_', 'carros456', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `matricula` varchar(10) NOT NULL,
  `cliente_id` varchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `usuario_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`matricula`, `cliente_id`, `marca`, `modelo`, `usuario_id`) VALUES
('02JUL04', '1616', 'Nissan', 'sepa', '1020'),
('08AGO17', '8765', 'F1', 'todos', '5526'),
('13JUN03', '8530', 'Chevrolet', 'no', '1020'),
('16SEP21', '4389', 'M&M', 'Kchau', '1020'),
('21JUN10', '1783', 'Masdita', 'apoco', '5526'),
('22JUL09', '9817', 'Chedraui', 'naranja', '1020');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `usuario_id_2` (`usuario_id`);

--
-- Indices de la tabla `det_reparacion`
--
ALTER TABLE `det_reparacion`
  ADD PRIMARY KEY (`det_id`),
  ADD KEY `pieza_id` (`pieza_id`),
  ADD KEY `folio` (`folio`);

--
-- Indices de la tabla `piezas`
--
ALTER TABLE `piezas`
  ADD PRIMARY KEY (`pieza_id`);

--
-- Indices de la tabla `reparacion`
--
ALTER TABLE `reparacion`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `usuario_id` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
