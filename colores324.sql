-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2024 a las 14:00:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colores324`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` int(11) NOT NULL,
  `R` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `nombre_color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id`, `R`, `G`, `B`, `nombre_color`) VALUES
(1, 255, 0, 0, 'Rojo'),
(2, 0, 255, 0, 'Verde'),
(3, 0, 0, 255, 'Azul'),
(4, 255, 255, 255, 'Blanco'),
(5, 0, 0, 0, 'Negro'),
(6, 255, 255, 0, 'Amarillo'),
(7, 255, 0, 255, 'Magenta'),
(8, 0, 255, 255, 'Cian'),
(9, 128, 0, 0, 'Marrón'),
(10, 0, 128, 0, 'Verde oscuro'),
(11, 0, 0, 128, 'Azul oscuro'),
(12, 128, 128, 128, 'Gris'),
(13, 192, 192, 192, 'Gris claro'),
(14, 128, 0, 128, 'Púrpura'),
(15, 128, 128, 0, 'Olive'),
(16, 0, 128, 128, 'Teal'),
(17, 165, 42, 42, 'Marrón rojizo'),
(18, 255, 0, 0, 'Rojo puro'),
(19, 0, 255, 0, 'Verde puro'),
(20, 0, 0, 255, 'Azul puro'),
(21, 255, 255, 0, 'Amarillo puro'),
(22, 255, 0, 255, 'Magenta puro'),
(23, 0, 255, 255, 'Cian puro'),
(24, 128, 128, 0, 'Olive oscuro'),
(25, 139, 0, 0, 'Rojo oscuro'),
(26, 255, 20, 147, 'Rosa'),
(27, 238, 130, 238, 'Violeta'),
(28, 255, 105, 180, 'Rosa claro'),
(29, 255, 182, 193, 'Rosa pálido'),
(30, 255, 192, 203, 'Rosa claro pálido'),
(31, 219, 112, 147, 'Rosa medio pálido'),
(32, 255, 228, 225, 'Rosa melocotón claro'),
(33, 255, 240, 245, 'Rosa claro de concha'),
(34, 250, 235, 215, 'Blanco almendra'),
(35, 245, 245, 220, 'Beige'),
(36, 255, 255, 240, 'Blanco de marfil'),
(37, 255, 255, 224, 'Blanco pálido'),
(38, 255, 250, 240, 'Blanco lino'),
(39, 253, 245, 230, 'Blanco antiguo'),
(40, 240, 255, 240, 'Blanco de nieve'),
(41, 240, 255, 255, 'Blanco de ganar'),
(42, 240, 248, 255, 'Blanco azulado'),
(43, 240, 255, 255, 'Blanco ligero de cielo azul'),
(44, 225, 255, 255, 'Blanco azulado pálido'),
(45, 176, 224, 230, 'Blanco celeste'),
(46, 175, 238, 238, 'Blanco celeste pálido'),
(47, 173, 216, 230, 'Blanco celeste claro'),
(48, 135, 206, 250, 'Blanco azul'),
(49, 135, 206, 235, 'Blanco azul claro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancaria`
--

CREATE TABLE `cuenta_bancaria` (
  `id_cliente` int(11) DEFAULT NULL,
  `n_cuenta` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta_bancaria`
--

INSERT INTO `cuenta_bancaria` (`id_cliente`, `n_cuenta`, `tipo`, `saldo`) VALUES
(234567, 10000, 'ahorros', 5000.50),
(234567, 10001, 'corriente', 2020.20),
(234567, 10002, 'jubilacion', 60000.43),
(234568, 10003, 'ahorros', 7044.56),
(234568, 10004, 'corriente', 300.30),
(234569, 10005, 'ahorros', 200.56),
(234569, 10006, 'ahorros', 1200.56),
(234570, 10007, 'ahorros', 10439.80),
(234570, 10008, 'Plazo Fijo', 20000.00),
(234571, 10009, 'ahorros', 3000.00),
(234571, 10010, 'negocio', 14000.30),
(234571, 10011, 'estudiante', 2000.00),
(234571, 10012, 'estudiante', 2000.00),
(234569, 10013, 'Plazo Fijo', 14000.00),
(234568, 10014, 'jubilacion', 2100.00),
(234569, 10015, 'jubilacion', 12344.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagencolor`
--

CREATE TABLE `imagencolor` (
  `id` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `nombre_imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ci` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ap_pat` varchar(50) DEFAULT NULL,
  `ap_mat` varchar(50) DEFAULT NULL,
  `fe_nac` date DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `departamento` varchar(20) DEFAULT NULL,
  `contrasenia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ci`, `nombre`, `ap_pat`, `ap_mat`, `fe_nac`, `tipo`, `email`, `departamento`, `contrasenia`) VALUES
(1, 'MARCELO', 'OVANDO', 'COLQUE', '1998-05-10', 'ADMIN', 'ovando@gmail.com', 'LA PAZ', '123456'),
(7, 'ITATI', 'TORREZ', 'MENDEZ', '1999-05-18', 'DIRECTOR', 'torrezitati@gmail.com', 'LA PAZ', '123456'),
(123789, 'MARCELO', 'PEREZ', 'PLATA', '1998-12-31', 'USUARIO', 'mperezp@gmail.com', 'LA PAZ', '123'),
(232323, 'ALBERTO JOSE', 'SALAS', 'MAMANI', '1990-10-10', 'USUARIO', 'albert@gmail.com', 'LA PAZ', '123'),
(234567, 'PEDRO', 'VASQUEZ', 'MORALES', '1960-05-15', 'USUARIO', 'pedro@pedro.com', 'COCHABAMBA', '123'),
(234568, 'CAMILA', 'MOREJON', 'AGUILAR', '1980-07-30', 'USUARIO', 'cmorejona@gmail.com', 'SANTA CRUZ', '123'),
(234569, 'LUIS', 'ALVAREZ', 'PORTUGAL', '1990-09-17', 'USUARIO', 'lalvarezp@gmail.com', 'SANTA CRUZ', '123'),
(234570, 'MARIA', 'ASPIAZU', 'SANCHEZ', '1960-10-20', 'USUARIO', 'maspiazus@gmail.com', 'COCHABAMBA', '123'),
(234571, 'CESAR', 'CALLE', 'SOTO', '1993-01-10', 'USUARIO', 'ccalles@gmail.com', 'LA PAZ', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_bancaria`
--

CREATE TABLE `transaccion_bancaria` (
  `id_transaccion` int(11) NOT NULL,
  `cuenta_src` int(11) DEFAULT NULL,
  `cuenta_dst` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD PRIMARY KEY (`n_cuenta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `imagencolor`
--
ALTER TABLE `imagencolor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `transaccion_bancaria`
--
ALTER TABLE `transaccion_bancaria`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `cuenta_src` (`cuenta_src`),
  ADD KEY `cuenta_dst` (`cuenta_dst`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  MODIFY `n_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10020;

--
-- AUTO_INCREMENT de la tabla `imagencolor`
--
ALTER TABLE `imagencolor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion_bancaria`
--
ALTER TABLE `transaccion_bancaria`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD CONSTRAINT `cuenta_bancaria_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `persona` (`ci`);

--
-- Filtros para la tabla `imagencolor`
--
ALTER TABLE `imagencolor`
  ADD CONSTRAINT `imagencolor_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id`);

--
-- Filtros para la tabla `transaccion_bancaria`
--
ALTER TABLE `transaccion_bancaria`
  ADD CONSTRAINT `transaccion_bancaria_ibfk_1` FOREIGN KEY (`cuenta_src`) REFERENCES `cuenta_bancaria` (`n_cuenta`),
  ADD CONSTRAINT `transaccion_bancaria_ibfk_2` FOREIGN KEY (`cuenta_dst`) REFERENCES `cuenta_bancaria` (`n_cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
