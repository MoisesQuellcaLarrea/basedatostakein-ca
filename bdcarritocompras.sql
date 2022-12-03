-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2022 a las 15:47:31
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) UNSIGNED NOT NULL,
  `Dni` varchar(9) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Dni`, `Nombres`, `Direccion`, `Email`, `Password`) VALUES
(21, '123', 'moises', 'lpaz', 'mql28sep@gmail.com', 'admin'),
(23, '61343', 'JUAN', 'LP', 'mql29sep@gmail.com', 'admin'),
(24, '123124', 'juabbbb', 'ddd', 'mql30sep@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idCliente` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idCliente`, `idPago`, `FechaCompras`, `Monto`, `Estado`) VALUES
(10, 24, 20, '2022-12-02', 50, 'Cancelado - En Proceso de Envio'),
(11, 24, 21, '2022-12-02', 350, 'Cancelado - En Proceso de Envio'),
(12, 24, 22, '2022-12-02', 260, 'Cancelado - En Proceso de Envio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(13, 45, 10, 1, 50),
(14, 50, 11, 1, 200),
(15, 51, 11, 1, 150),
(16, 46, 12, 2, 80),
(17, 48, 12, 2, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `Monto`) VALUES
(20, 50),
(21, 350),
(22, 210);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombres`, `Foto`, `Descripcion`, `Precio`, `Stock`) VALUES
(42, 'PROPOLEO', 'http://localhost:80/carrito/course_12.jpg', 'NATURAL MEDICINAL FIEBREW ALERGIAS ETC', 60, 12),
(43, 'JALEA REAL', 'http://localhost:80/carrito/course_14.jpg', 'ESTIMULANTE REJUVENECEDOR', 120, 20),
(44, 'POLEN', 'http://localhost:80/carrito/polen.jpg', 'LAS ABEJAS OBRERAS, LO MEZCLAN CON NÃCTAR Y SALIVA DE ABEJA Y LUEGO LO EMPACAN EN LAS CÃLULAS DE PANAL EN LA COLMENA. EL POLEN DE ABEJA PODRÃA AYUDAR A ESTIMULAR EL SISTEMA INMUNOLÃGICO', 50, 20),
(45, 'POLEN', 'http://localhost:80/carrito/polen.jpg', 'LAS ABEJAS OBRERAS, LO MEZCLAN CON NÃCTAR Y SALIVA DE ABEJA Y LUEGO LO EMPACAN EN LAS CÃLULAS DE PANAL EN LA COLMENA. EL POLEN DE ABEJA PODRÃA AYUDAR A ESTIMULAR EL SISTEMA INMUNOLÃGICO', 50, 20),
(46, 'MIEL', 'http://localhost:80/carrito/course_13.jpg', 'UN PRODUCTO CON PROPIEDADES Y BENEFICIOS PARA LA SALUD YA QUE ES EFICAZ PARA TRATAR HERIDAS DE LA PIEL; LA TOS Y ALERGIAS; REDUCE EL COLESTEROL; PREVIENE PROBLEMAS DEL CORAZÃN Y EL ESTREÃIMIENTO', 80, 30),
(47, 'PANAL ', 'http://localhost:80/carrito/course_1.jpg', 'UN PRODUCTO CON PROPIEDADES Y BENEFICIOS PARA LA SALUD YA QUE ES EFICAZ PARA TRATAR HERIDAS DE LA PIEL; LA TOS Y ALERGIAS; REDUCE EL COLESTEROL; PREVIENE PROBLEMAS DEL CORAZÃN Y EL ESTREÃIMIENTO', 120, 20),
(48, 'CERA DE ABEJA', 'http://localhost:80/carrito/news_28.jpg', 'PROPIEDADES HIDRATANTES, FRENA LA APARICIÃN DE ARRUGAS Y SIGNOS DE EXPRESIÃN, ELIMINA PEQUEÃAS CICATRICES, REDUCE LAS MARCAS DE ACNÃ Y EQUILIBRA EL TONO DE LA PIEL', 50, 20),
(49, 'VENENO DE ABEJA', 'http://localhost:80/carrito/01.jpg', 'ADEMÃS DE LA ARTRITIS, SE PRETENDE QUE EL VENENO DE ABEJA SEA ÃTIL PARA TRATAR LO SIGUIENTE: LESIONES CRÃNICAS TALES COMO BURSITIS Y TENDINITIS. PADECIMIENTOS CARDIOVASCULARES COMO HIPERTENSIÃN. PADECIMIENTOS PULMONARES COMO ASMA', 70, 20),
(50, 'MEDIA ALSA', 'http://localhost:80/carrito/course_17.jpg', 'COMPLETO 20 MARCOS', 200, 5),
(51, 'NUCLEO', 'http://localhost:80/carrito/course_18.jpg', 'CAJA COMPLETA 4 MARCOS RESERVAS AL MAXIMO', 150, 15),
(52, 'JALEA REYNA', 'http://localhost:80/carrito/event_2.jpg', 'DIABETIS', 20, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idCliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
