-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 05-11-2021 a las 10:37:24
-- Versión del servidor: 5.7.34
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SG`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `dirección` varchar(50) DEFAULT NULL,
  `CIF/NIF` varchar(9) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`id_cliente`, `nombre`, `dirección`, `CIF/NIF`, `telefono`, `email`) VALUES
(1, 'Eric', 'Calle Velazquez 15, Madrid, Madrid', '56478367K', 675678765, 'eric@hotmail.com'),
(2, 'Alistair', 'Calle Arizona 3, Madrid, Madrid', '56473826T', 675456239, 'alistair@hotmail.com'),
(3, 'Kate', 'Calle Oklahoma 12, Madrid, Madrid', '57835623O', 678924351, 'kate@hotmail.com'),
(4, 'Ariel', 'Calle San Francisco 2, Madrid, Madrid', '53426789E', 675432190, 'ariel@hotmail.com'),
(5, 'Andrew', 'Calle Los Angeles 7, Madrid, Madrid', '53624534U', 654378924, 'andrew@hotmail.com'),
(6, 'Angelina', 'Calle Kansas 8, Madrid, Madrid', '56745324W', 624536132, 'angelina@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_cliente` varchar(25) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `CIF/NIF` varchar(50) NOT NULL,
  `nombre_producto` varchar(25) DEFAULT NULL,
  `precio_producto` double DEFAULT NULL,
  `iva_producto` double DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `numero_factura` int(11) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `forma_pago` varchar(25) DEFAULT NULL,
  `plazo_pago` int(11) NOT NULL,
  `estructura` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Factura`
--

INSERT INTO `Factura` (`id_factura`, `id_cliente`, `id_producto`, `nombre_cliente`, `direccion`, `telefono`, `CIF/NIF`, `nombre_producto`, `precio_producto`, `iva_producto`, `cantidad`, `numero_factura`, `fecha_factura`, `forma_pago`, `plazo_pago`, `estructura`) VALUES
(1, 1, 1, 'Eric', '0Calle Velazquez 15, Madrid, Madrid', '675678765', '56478367K', 'camiseta', 20, 21, 2, 1, '2021-12-12', 'al contado', 3, 'No hay observaciones'),
(2, 2, 2, 'Alistair', 'Calle Arizona 3, Madrid, Madrid', '675456239', '56473826T', '56473826T', 25, 21, 3, 2, '2021-09-02', 'al contado', 3, 'No hay observaciones'),
(3, 3, 3, 'Kate', 'Calle Oklahoma 12, Madrid, Madrid', '678924351', '57835623O', 'abrigo', 150, 21, 1, 3, '2021-03-04', 'al contado', 3, 'No hay observaciones'),
(4, 4, 4, 'Ariel', 'Calle San Francisco 2, Madrid, Madrid', '675432190', '53426789E', 'gorro', 12, 21, 3, 5, '2021-06-14', 'al contado', 3, 'No hay observaciones'),
(5, 4, 5, 'Ariel', 'Calle San Francisco 2, Madrid, Madrid', '675432190', '53426789E', 'sudadera', 60, 21, 4, 5, '2021-06-14', 'al contado', 3, 'No hay observaciones'),
(6, 6, 6, 'Angelina', 'Calle Kansas 8, Madrid, Madrid', '624536132', '56745324W', 'chandal', 55, 21, 5, 6, '2021-05-14', 'al contado', 3, 'No hay observaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `id_producto` int(11) NOT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`id_producto`, `ref`, `descripcion`, `precio`, `stock`, `iva`) VALUES
(1, 'XZ564HJ56', 'camiseta', 20, 25, 21),
(2, 'F345REH56', 'camisa', 25, 35, 21),
(3, 'H253YHG67', 'abrigo', 150, 20, 21),
(4, 'GH346DT5', 'gorro', 12, 10, 21),
(5, 'H231HK47TF', 'sudadera', 60, 40, 21),
(6, 'J785GTD43D', 'chandal', 55, 30, 21),
(7, 'J307FL64R', 'chaleco', 50, 35, 21),
(8, 'J785GTD43D', 'cazadora', 55, 30, 21),
(9, 'J894DRS45M', 'vaqueros', 80, 25, 21),
(10, 'F425GR43L', 'zapatillas', 90, 50, 21),
(11, 'J897FD32R', 'falda', 60, 30, 21),
(12, 'G785HKG45F', 'chaqueta', 80, 40, 21);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`id_producto`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Factura`
--
ALTER TABLE `Factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `Productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
