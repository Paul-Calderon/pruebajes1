-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2020 a las 23:24:46
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apertura`
--

CREATE TABLE `apertura` (
  `idapertura` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `total` float NOT NULL,
  `estado` int(11) NOT NULL,
  `estadocorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `apertura`
--

INSERT INTO `apertura` (`idapertura`, `idsucursal`, `fecha`, `descripcion`, `idusuario`, `total`, `estado`, `estadocorte`) VALUES
(1, 2, '2020-09-18', 'cvxvxcvxcv', 1, 100, 1, 0),
(2, 2, '2020-09-30', 'asdfsfsf', 1, 100, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `idcaja` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `comprobante` int(11) NOT NULL,
  `totalingreso` float NOT NULL,
  `totalapertura` float NOT NULL,
  `totalefectivo` float NOT NULL,
  `totalegreso` float NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `tablacorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`idcaja`, `fecha`, `descripcion`, `comprobante`, `totalingreso`, `totalapertura`, `totalefectivo`, `totalegreso`, `idusuario`, `idsucursal`, `tablacorte`) VALUES
(1, '2020-09-18', '5465465', 1, 312, 100, 0, 0, 1, 2, 1),
(2, '2020-09-30', 'sfsdff', 2, 452.5, 100, 0, 0, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio`
--

CREATE TABLE `cambio` (
  `idcambio` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `totalcambio` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cambio`
--

INSERT INTO `cambio` (`idcambio`, `idusuario`, `idsucursal`, `descripcion`, `fecha`, `totalcambio`, `estado`) VALUES
(4, 8, 2, 'sdfsfsfd', '2020-09-01', 20, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `descripcion`, `estado`) VALUES
(1, 'Desechable', 1),
(2, 'Higiene', 1),
(3, 'Energizante e Hidratante', 1),
(4, 'Gaseosa', 1),
(5, 'Jugos', 1),
(6, 'Cerveza', 1),
(7, 'Bebidas', 1),
(8, 'Yoghurt', 1),
(9, 'Lácteos', 1),
(10, 'Limpieza', 1),
(11, 'Varios', 1),
(12, 'Insecticidas', 1),
(13, 'Abarrotes', 1),
(14, 'Golosina', 1),
(15, 'Galletas', 1),
(16, 'Librería', 1),
(17, 'Medicina', 1),
(18, 'ChocoFruta', 1),
(19, 'Cigarro', 1),
(20, 'Recargas', 1),
(21, 'Condimentos', 1),
(22, 'Embutidos', 1),
(23, 'Belleza', 1),
(24, 'herramientassfsfs', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idclientes` int(11) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `descuentosug` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nit`, `nombre`, `direccion`, `telefono`, `descuentosug`, `estado`) VALUES
(1, '7894564-22', 'Carlos Majut', '4654654', '7777-7777', 0, 0),
(6, '1234567', 'Varios', 'Varios', '0000-0000', 50, 1),
(7, '778899', 'Carlos Cifuentes', 'REu', '5464-6546', 0, 1),
(8, '2233344', 'Alexander Paúl', 'REu', '0000-0000', 0, 1),
(9, '996633', 'Pedro Infante', 'Retalhuleu', '8798-7987', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompras` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idtipocompra` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `saldo` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompras`, `idproveedor`, `idusuario`, `idtipocompra`, `idsucursal`, `fecha`, `comprobante`, `total`, `saldo`, `estado`) VALUES
(27, 9, 8, 1, 2, '2020-09-01', 'asdfsdf', 40, 0, 0),
(28, 8, 8, 2, 2, '2020-09-01', 'dfsfs', 40, 40, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaxcobrar`
--

CREATE TABLE `cuentaxcobrar` (
  `idcuentacobrar` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idtipopago` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `estado` int(11) NOT NULL,
  `estadocorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentaxcobrar`
--

INSERT INTO `cuentaxcobrar` (`idcuentacobrar`, `idpago`, `idusuario`, `idtipopago`, `idsucursal`, `descripcion`, `fecha`, `monto`, `estado`, `estadocorte`) VALUES
(1, 54, 1, 1, 2, 'Abono', '2020-09-18', 10, 1, 0),
(2, 54, 1, 1, 2, 'Abono', '2020-09-30', 5, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaxpagar`
--

CREATE TABLE `cuentaxpagar` (
  `idcuentapagar` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `estado` int(11) NOT NULL,
  `estadocorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denominacion`
--

CREATE TABLE `denominacion` (
  `iddenominacion` int(11) NOT NULL,
  `denominacion` float NOT NULL,
  `descripcion` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `denominacion`
--

INSERT INTO `denominacion` (`iddenominacion`, `denominacion`, `descripcion`, `estado`) VALUES
(1, 0.1, 1, 1),
(2, 0.25, 1, 1),
(3, 0.5, 1, 1),
(4, 1, 1, 1),
(5, 1, 2, 1),
(6, 5, 2, 1),
(7, 10, 2, 1),
(8, 20, 2, 1),
(9, 50, 2, 1),
(10, 100, 2, 1),
(11, 200, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_apertura`
--

CREATE TABLE `detalle_apertura` (
  `iddetalleapertura` int(11) NOT NULL,
  `idapertura` int(11) NOT NULL,
  `iddenominacion` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_caja`
--

CREATE TABLE `detalle_caja` (
  `iddetallecaja` int(11) NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idevento` int(11) NOT NULL,
  `tabla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_caja`
--

INSERT INTO `detalle_caja` (`iddetallecaja`, `idcaja`, `idevento`, `tabla`) VALUES
(1, 1, 50, 2),
(2, 1, 48, 2),
(3, 1, 47, 2),
(4, 1, 46, 2),
(5, 1, 45, 2),
(6, 1, 42, 2),
(7, 1, 41, 2),
(8, 1, 40, 2),
(9, 1, 39, 2),
(10, 1, 38, 2),
(11, 1, 1, 3),
(12, 2, 77, 2),
(13, 2, 75, 2),
(14, 2, 73, 2),
(15, 2, 72, 2),
(16, 2, 71, 2),
(17, 2, 69, 2),
(18, 2, 68, 2),
(19, 2, 67, 2),
(20, 2, 66, 2),
(21, 2, 63, 2),
(22, 2, 62, 2),
(23, 2, 61, 2),
(24, 2, 59, 2),
(25, 2, 53, 2),
(26, 2, 48, 2),
(27, 2, 2, 4),
(28, 2, 1, 4),
(29, 2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cambio`
--

CREATE TABLE `detalle_cambio` (
  `iddetallecambio` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idcambio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo` float NOT NULL,
  `estado` int(11) NOT NULL,
  `estadocambio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_cambio`
--

INSERT INTO `detalle_cambio` (`iddetallecambio`, `idproducto`, `idcambio`, `cantidad`, `costo`, `estado`, `estadocambio`) VALUES
(9, 54, 4, 1, 20, 1, 1),
(10, 82, 4, 1, 20, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `iddetalle_compra` int(11) NOT NULL,
  `idcompras` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciocosto` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`iddetalle_compra`, `idcompras`, `idproducto`, `cantidad`, `preciocosto`, `estado`) VALUES
(35, 27, 54, 2, 20, 1),
(36, 28, 79, 1, 20, 1),
(37, 28, 82, 1, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pago`
--

CREATE TABLE `detalle_pago` (
  `iddetalle_pago` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `idtipopago` int(11) NOT NULL,
  `comprobante` varchar(50) NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_pago`
--

INSERT INTO `detalle_pago` (`iddetalle_pago`, `idpago`, `idtipopago`, `comprobante`, `monto`, `estado`) VALUES
(55, 38, 1, '---', 75, 1),
(56, 39, 1, '---', 25, 1),
(57, 41, 1, '---', 100, 1),
(58, 42, 1, '---', 100, 1),
(59, 46, 3, '', 20, 1),
(60, 46, 1, '---', 25, 1),
(61, 45, 3, '', 25, 1),
(62, 47, 1, '---', 30, 1),
(63, 50, 1, '---', 50, 1),
(64, 48, 3, '', 25, 1),
(65, 48, 1, '---', 25, 1),
(66, 40, 1, '--', 50, 1),
(67, 56, 1, '---', 75, 1),
(68, 59, 1, '---', 100, 1),
(69, 61, 1, '---', 25, 1),
(70, 62, 3, '', 10, 1),
(71, 62, 1, '---', 20, 1),
(72, 63, 1, '---', 100, 1),
(73, 66, 1, '---', 25, 1),
(74, 67, 1, '---', 25, 1),
(75, 68, 1, '---', 25, 1),
(76, 69, 1, '---', 25, 1),
(77, 71, 1, '---', 400, 1),
(78, 72, 1, '---', 25, 1),
(79, 73, 1, '---', 50, 1),
(80, 75, 1, '---', 25, 1),
(81, 77, 1, '--', -25, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

CREATE TABLE `detalle_salida` (
  `iddetallesalida` int(11) NOT NULL,
  `idsalida` int(11) DEFAULT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `costo` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_salida`
--

INSERT INTO `detalle_salida` (`iddetallesalida`, `idsalida`, `idproducto`, `cantidad`, `costo`, `estado`) VALUES
(13, 8, 55, 1, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_traslado`
--

CREATE TABLE `detalle_traslado` (
  `iddetalletraslado` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idtraslado` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo` float NOT NULL,
  `estado` int(11) NOT NULL,
  `estadotraslado` int(11) NOT NULL,
  `estadocheck` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idpago` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `cantidadventa` float NOT NULL,
  `precioventa` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idpago`, `idproducto`, `cantidad`, `cantidadventa`, `precioventa`, `estado`) VALUES
(61, 38, 333, 1, 0, 25, 1),
(62, 38, 333, 2, 0, 25, 1),
(63, 39, 82, 1, 0, 25, 1),
(64, 40, 54, 1, 0, 25, 1),
(65, 40, 55, 1, 0, 25, 1),
(66, 41, 82, 1, 0, 25, 1),
(67, 42, 82, 1, 0, 25, 1),
(69, 43, 82, 1, 0, 25, 0),
(70, 43, 55, 1, 0, 25, 1),
(72, 44, 82, 1, 0, 25, 1),
(73, 44, 79, 1, 0, 25, 1),
(75, 45, 87, 1, 0, 25, 1),
(77, 46, 70, 1, 0, 25, 1),
(78, 46, 69, 1, 0, 25, 1),
(80, 47, 82, 1, 0, 25, 1),
(82, 48, 236, 1, 0, 25, 1),
(83, 48, 55, 1, 0, 25, 1),
(85, 50, 236, 1, 0, 25, 1),
(86, 50, 235, 1, 0, 25, 1),
(88, 51, 55, 1, 0, 25, 1),
(89, 51, 68, 1, 0, 25, 1),
(90, 51, 135, 1, 0, 25, 1),
(91, 51, 268, 1, 0, 25, 1),
(93, 52, 69, 1, 1, 25, 1),
(94, 52, 70, 1, 0, 25, 1),
(96, 53, 208, 1, 0, 25, 1),
(97, 53, 260, 1, 0, 25, 1),
(98, 53, 262, 1, 0, 25, 1),
(99, 53, 261, 1, 0, 25, 1),
(101, 54, 82, 1, 0, 25, 1),
(103, 55, 70, 1, 0, 25, 1),
(105, 56, 5, 1, 0, 25, 1),
(106, 56, 6, 1, 0, 25, 1),
(107, 56, 19, 1, 0, 25, 1),
(109, 57, 64, 1, 0, 25, 1),
(110, 57, 66, 1, 0, 25, 1),
(111, 57, 65, 1, 0, 25, 1),
(113, 58, 11, 12, 0, 25, 1),
(114, 58, 54, 1, 0, 25, 1),
(115, 58, 297, 1, 0, 25, 1),
(116, 59, 79, 1, 0, 25, 1),
(117, 59, 82, 1, 0, 25, 1),
(118, 59, 83, 1, 0, 25, 1),
(119, 59, 236, 1, 0, 25, 1),
(121, 60, 82, 1, 0, 25, 2),
(122, 60, 84, 1, 1, 25, 1),
(123, 60, 87, 1, 1, 25, 1),
(124, 61, 87, 1, 0, 25, 1),
(125, 62, 69, 1, 0, 25, 1),
(126, 63, 84, 1, 0, 25, 1),
(129, 65, 3, 1, 1, 25, 1),
(130, 65, 9, 1, 0, 25, 2),
(131, 65, 19, 3, 3, 25, 2),
(132, 66, 19, 1, 0, 25, 1),
(133, 67, 19, 1, 0, 25, 1),
(134, 68, 19, 1, 0, 25, 1),
(135, 69, 19, 1, 0, 25, 1),
(136, 65, 9, -1, 0, 25, 2),
(137, 70, 258, 10, 4, 25, 2),
(138, 70, 260, 10, 3, 25, 2),
(139, 71, 260, 2, 0, 25, 1),
(140, 71, 258, 2, 0, 25, 1),
(141, 72, 260, 1, 0, 25, 1),
(142, 70, 260, -7, 0, 25, 2),
(143, 73, 258, 2, 0, 25, 1),
(144, 70, 258, -6, 0, 25, 2),
(145, 58, 96, 1, 0, 25, 1),
(147, 74, 82, 10, 0, 25, 1),
(148, 74, 262, 1, 0, 25, 1),
(149, 74, 23, 2, 0, 25, 1),
(150, 74, 82, 1, 0, 25, 1),
(151, 77, 258, -1, 0, 25, 2),
(152, 75, 3, 1, 0, 25, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocorte`
--

CREATE TABLE `estadocorte` (
  `idestadocorte` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadocorte`
--

INSERT INTO `estadocorte` (`idestadocorte`, `descripcion`) VALUES
(1, 'Corte Total'),
(2, 'Corte Parcial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventocorte`
--

CREATE TABLE `eventocorte` (
  `ideventocorte` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventocorte`
--

INSERT INTO `eventocorte` (`ideventocorte`, `descripcion`) VALUES
(1, 'Gastos'),
(2, 'ingresos'),
(3, 'Apertura'),
(4, 'Cuentas x Cobrar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `idgasto` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `monto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idusuario` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `estadocorte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idtipoventa` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `totalregistrado` float NOT NULL,
  `totalpagado` float NOT NULL,
  `descuento` float NOT NULL,
  `cambio` float NOT NULL,
  `saldo` float NOT NULL,
  `justificacion` varchar(50) NOT NULL,
  `correlativo` int(11) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `iddevoluaciones` int(11) NOT NULL,
  `numerodevo` varchar(50) NOT NULL,
  `estadocorte` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `estadoalterno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `idusuario`, `idcliente`, `idtipoventa`, `idsucursal`, `fecha`, `hora`, `totalregistrado`, `totalpagado`, `descuento`, `cambio`, `saldo`, `justificacion`, `correlativo`, `serie`, `iddevoluaciones`, `numerodevo`, `estadocorte`, `estado`, `estadoalterno`) VALUES
(38, 1, 6, 1, 2, '2020-05-12', '20:10:32', 75, 75, 0, 0, 0, '-', 1, 'A', 0, '-', 0, 1, 0),
(39, 8, 6, 1, 2, '2020-09-01', '11:04:52', 25, 25, 0, 0, 0, '-', 2, 'A', 0, '-', 0, 1, 0),
(40, 1, 1, 1, 2, '2020-09-16', '09:35:33', 50, 50, 0, 0, 0, '--', 3, 'A', 0, '-', 0, 1, 0),
(41, 1, 8, 1, 2, '2020-09-16', '10:34:16', 25, 100, 0, 75, 0, '-', 4, 'A', 0, '-', 0, 1, 0),
(42, 1, 7, 1, 2, '2020-09-16', '10:34:39', 25, 100, 0, 75, 0, '-', 5, 'A', 0, '-', 0, 1, 0),
(43, 1, 6, 1, 2, '2020-09-16', '11:59:47', 25, 0, 0, 0, 0, '--', 6, 'A', 0, '-', 0, 0, 0),
(44, 1, 7, 1, 2, '2020-09-16', '12:01:25', 50, 0, 0, 0, 0, '--', 7, 'A', 0, '-', 0, 0, 0),
(45, 1, 6, 1, 2, '2020-09-01', '15:02:54', 25, 25, 0, 0, 0, '-', 8, 'A', 0, '-', 0, 1, 0),
(46, 1, 6, 1, 2, '2020-09-16', '15:00:51', 50, 45, 25, 20, 0, 'Esto no es', 9, 'A', 0, '-', 0, 1, 0),
(47, 1, 6, 1, 2, '2020-09-16', '15:12:56', 25, 30, 13, 18, 0, 'Cliente Especial', 10, 'A', 0, '-', 0, 1, 0),
(48, 1, 6, 1, 2, '2020-09-18', '11:53:48', 50, 50, 25, 25, 0, '232323', 11, 'A', 0, '-', 0, 1, 0),
(50, 1, 9, 1, 2, '2020-09-17', '16:25:25', 50, 50, 0, 0, 0, '-', 12, 'A', 0, '-', 0, 1, 0),
(51, 1, 6, 1, 2, '2020-09-18', '11:55:07', 100, 0, 0, 0, 0, '--', 13, 'A', 0, '-', 0, 0, 0),
(52, 1, 6, 3, 2, '2020-09-18', '13:32:50', 25, 25, 0, 0, 25, '-', 14, 'A', 0, '-', 0, 1, 0),
(53, 1, 6, 1, 2, '2020-09-18', '13:27:17', 100, 0, 100, 0, 0, 'asdasdsa', 15, 'A', 0, '-', 0, 1, 0),
(54, 1, 7, 2, 2, '2020-09-18', '13:37:58', 25, 25, 0, 0, 10, '-', 16, 'A', 0, '-', 0, 1, 0),
(55, 1, 6, 1, 2, '2020-09-18', '14:53:49', 25, 0, 0, 0, 0, '--', 17, 'A', 0, '-', 0, 0, 1),
(56, 1, 6, 1, 2, '2020-09-18', '15:25:06', 75, 75, 0, 0, 0, '-', 18, 'A', 0, '-', 0, 0, 0),
(57, 1, 7, 1, 2, '2020-09-18', '15:23:30', 75, 0, 0, 0, 0, '--', 19, 'A', 0, '-', 0, 0, 1),
(58, 1, 6, 1, 2, '2020-09-22', '09:30:44', 375, 0, 0, 0, 0, '--', 20, 'A', 0, '-', 1, 2, 1),
(59, 1, 6, 1, 2, '2020-09-22', '09:40:28', 100, 100, 0, 0, 0, '-', 21, 'A', 0, '-', 0, 1, 0),
(60, 1, 6, 3, 2, '2020-09-22', '14:03:01', 25, 25, 0, 0, 25, '-', 22, 'A', 0, '-', 0, 1, 0),
(61, 1, 6, 1, 2, '2020-09-22', '16:46:09', 25, 25, 0, 0, 0, '', 23, 'A', 0, '-', 0, 1, 0),
(62, 1, 6, 1, 2, '2020-09-22', '16:48:07', 25, 30, 0, 17.5, 0, '', 24, 'A', 0, '-', 0, 1, 0),
(63, 1, 6, 1, 2, '2020-09-22', '16:52:51', 25, 100, 25, 100, 0, 'dasdads', 25, 'A', 0, '-', 0, 1, 0),
(65, 1, 7, 3, 2, '2020-09-23', '14:57:43', 100, 100, 0, 0, 100, '-', 26, 'A', 0, '-', 0, 1, 0),
(66, 1, 7, 1, 2, '2020-09-23', '15:04:30', 25, 25, 0, 0, 0, '-', 27, 'A', 0, '-', 0, 1, 0),
(67, 1, 7, 1, 2, '2020-09-23', '15:08:30', 25, 25, 0, 0, 0, '-', 28, 'A', 0, '-', 0, 1, 0),
(68, 1, 7, 1, 2, '2020-09-23', '15:15:06', 25, 25, 0, 0, 0, '-', 29, 'A', 0, '-', 0, 1, 0),
(69, 1, 7, 1, 2, '2020-09-23', '15:20:44', 25, 25, 0, 0, 0, '-', 30, 'A', 0, '-', 0, 1, 0),
(70, 1, 6, 3, 2, '2020-09-24', '09:51:48', 175, 175, 0, 0, 175, '-', 31, 'A', 0, '-', 0, 1, 0),
(71, 1, 6, 1, 2, '2020-09-24', '09:52:36', 100, 400, 0, 300, 0, '-', 32, 'A', 0, '-', 0, 1, 0),
(72, 1, 6, 1, 2, '2020-09-24', '09:52:59', 25, 25, 0, 0, 0, '-', 33, 'A', 0, '-', 0, 1, 0),
(73, 1, 6, 1, 2, '2020-09-24', '09:59:07', 50, 50, 0, 0, 0, '-', 34, 'A', 0, '-', 0, 1, 0),
(74, 1, 6, 1, 2, '2020-09-22', '14:34:06', 350, 0, 0, 0, 0, '--', 35, 'A', 0, '-', 1, 2, 1),
(75, 1, 7, 1, 2, '2020-09-25', '12:45:32', 25, 25, 0, 0, 0, '-', 36, 'A', 0, '-', 0, 1, 0),
(77, 1, 6, 4, 2, '2020-09-30', '11:14:09', -25, -25, 0, 0, 0, '-', 37, 'A', 73, 'A-34', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`, `estado`) VALUES
(1, 'Usuarios', 1),
(2, 'Compras', 1),
(3, 'Ventas', 1),
(4, 'Inventario', 1),
(5, 'Personas', 1),
(6, 'Apertura Caja', 1),
(7, 'Caja', 1),
(8, 'Gerencia', 1),
(9, 'Bodega', 0),
(10, 'Impresión Etiquetas', 1),
(11, 'Detalle de Ventas', 0),
(12, 'Cuentas Corrientes', 0),
(13, 'Sucursales', 0),
(14, 'Consignación', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `fechaingreso` date NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciocosto` float NOT NULL,
  `precioventa` float NOT NULL,
  `cantidadmin` int(11) NOT NULL,
  `fechacaducidad` date NOT NULL,
  `proveedor` varchar(50) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `idcambio` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `estadoprint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `idunidad`, `idcategoria`, `idsucursal`, `fechaingreso`, `codigo`, `producto`, `descripcion`, `cantidad`, `preciocosto`, `precioventa`, `cantidadmin`, `fechacaducidad`, `proveedor`, `imagen`, `idcambio`, `estado`, `estadoprint`) VALUES
(1, 1, 1, 2, '2020-04-15', '7408304258593', 'Platos Desechables Envaica', '50 Unidades Bandeja 1P (mediana)', 100, 20, 25, 2, '2021-04-14', '--', 'product.png', 0, 1, 0),
(2, 1, 2, 2, '2020-04-15', '7702425804821', 'Toallitas Húmedas Huggies', '80 unidades con fragancia', 100, 20, 25, 2, '2022-01-04', '--', 'product.png', 0, 1, 0),
(3, 1, 1, 2, '2020-04-15', '7408304258654', 'Platos Desechables Envaica', '50 Unidades bandeja 2ps (grande)', 99, 20, 25, 2, '2021-04-14', '--', 'product.png', 0, 1, 0),
(4, 2, 3, 2, '2020-04-15', '7406189003741', 'Raptor', 'Bebida Energizante 473 ml', 100, 20, 25, 5, '2020-10-11', '--', 'product.png', 0, 1, 0),
(5, 5, 4, 2, '2020-04-15', '7401002301271', 'Super Cola 1.5 lt', 'Agua Gaseosa Desechable', 100, 20, 25, 5, '2020-07-14', '--', 'product.png', 0, 1, 0),
(6, 5, 4, 2, '2020-04-15', '7401002305606', 'Super Lime Lemon 1.5 lt', 'Agua Gaseosa Desechable', 100, 20, 25, 5, '2020-07-20', '--', 'product.png', 0, 1, 0),
(7, 6, 3, 2, '2020-04-15', '7401005906862', 'AMP 365', 'Desechable 600ml', 100, 20, 25, 3, '0000-00-00', '--', 'product.png', 0, 1, 0),
(8, 5, 1, 2, '2020-04-15', '7401002307822', 'Naranjada con Soda Carnaval', 'Desechable 600ml', 100, 20, 25, 2, '2020-06-12', '--', 'product.png', 0, 1, 0),
(9, 5, 1, 2, '2020-04-21', '095188014802', 'Tampico Citrus Punch', 'Desechable 480ml', 100, 20, 25, 5, '2020-07-01', '--', 'product.png', 0, 1, 0),
(10, 5, 1, 2, '2020-04-16', '7406233000023', 'Pañal POM POM', 'Pañal tipo tela Grande (19.8-30.8lbs.)', 100, 20, 25, 2, '2021-07-01', '--', 'product.png', 0, 1, 0),
(11, 5, 5, 2, '2020-04-15', '7406189008579', 'Jugos de la granja', 'Botella de Naranja 500ml', 100, 20, 25, 2, '2020-06-06', '--', 'product.png', 0, 1, 0),
(12, 5, 3, 2, '2020-04-15', '7401002301615', 'Mineral Canada Dry', 'Botella 600ml', 100, 20, 25, 1, '2020-02-07', '--', 'product.png', 0, 1, 0),
(13, 2, 6, 2, '2020-04-15', '7401000701288', 'Cerveza Dorada Ice', 'Cerveza Lata 350 ml', 100, 20, 25, 5, '2021-03-20', '--', 'product.png', 0, 1, 0),
(14, 2, 6, 2, '2020-04-15', '75002459', 'Cerveza Tecate', 'Cerveza Lata 355 ml', 100, 20, 25, 5, '2020-11-30', '--', 'product.png', 0, 1, 0),
(15, 5, 4, 2, '2020-04-15', '7401080200152', 'Desechable Coca Cola', 'Botella 600ml', 100, 20, 25, 5, '2020-05-02', '--', 'product.png', 0, 1, 0),
(16, 5, 7, 2, '2020-04-15', '7401002306719', 'Agua Pura Salvavidas', 'Botella 600ml', 100, 20, 25, 2, '2021-04-02', '--', 'product.png', 0, 1, 0),
(17, 5, 7, 2, '2020-04-21', '024474002124', 'Fruta Fresca Petit', 'Botella Sabor Manzana 500ml', 100, 20, 25, 2, '2020-08-19', '--', 'product.png', 0, 1, 0),
(18, 5, 7, 2, '2020-04-21', '024474002162', 'Fruta Fresca Petit', 'Botella Sabor Frutas Tropicales 500ml', 100, 20, 25, 2, '2020-08-17', '--', 'product.png', 0, 1, 0),
(19, 2, 4, 2, '2020-04-15', '7401002304517', 'Uva Salvavidas', 'Lata 350ml', 97, 20, 25, 2, '2021-02-01', '--', 'product.png', 0, 1, 0),
(20, 2, 4, 2, '2020-04-15', '7401002305613', 'Super Lime Lemon', 'Lata 350ml', 100, 20, 25, 2, '2020-08-19', '--', 'product.png', 0, 1, 0),
(21, 6, 7, 2, '2020-04-15', '7506192507646', 'Saviloee', 'Bebida de Sabila botella 320ml', 100, 20, 25, 2, '2020-05-14', '--', 'product.png', 0, 1, 0),
(22, 6, 7, 2, '2020-04-15', '8801056074289', 'Lotte Aloe Vera', 'Botella 500ml', 100, 20, 25, 5, '2020-12-26', '--', 'product.png', 0, 1, 0),
(23, 6, 3, 2, '2020-04-21', '7441003581487', 'Powerade Frutas', 'Botella 600ml', 100, 20, 25, 2, '2020-06-16', '--', 'product.png', 0, 1, 0),
(24, 6, 7, 2, '2020-04-15', '7401000707723', 'Raptor', 'Botella 600ml', 100, 20, 25, 2, '2020-07-23', '--', 'product.png', 0, 1, 0),
(25, 5, 4, 2, '2020-04-15', '7401002304166', 'Salvavidas Roja 1.5lt', 'Desechable 1.5lt', 100, 20, 25, 2, '2020-07-27', '--', 'product.png', 0, 1, 0),
(26, 2, 5, 2, '2020-04-15', '088313010534', 'Kerns Melocotón', 'Lata 330ml', 100, 20, 25, 5, '2022-01-15', '--', 'product.png', 0, 1, 0),
(27, 2, 7, 2, '2020-04-15', '7406189005011', 'Te Frio Del Monte', 'Sabor Melocoton lata 330ml', 100, 20, 25, 2, '2020-11-27', '--', 'product.png', 0, 1, 0),
(28, 2, 5, 2, '2020-04-15', '088313006346', 'Kerns Vegetales', 'V8 lata 330ml', 100, 20, 25, 5, '2022-01-15', '--', 'product.png', 0, 1, 0),
(29, 2, 5, 2, '2020-04-15', '088313010718', 'Kerns Piña', 'Piña Lata 330ml', 100, 20, 25, 2, '2021-08-15', '--', 'product.png', 0, 1, 0),
(30, 6, 7, 2, '2020-04-15', '4712883680663', 'New Food Aloe Vera', 'Botella 500ml', 100, 20, 25, 2, '2021-03-21', '--', 'product.png', 0, 1, 0),
(31, 6, 3, 2, '2020-04-15', '036731001818', 'Gatorade Uva', 'Botella 600ml', 100, 20, 25, 3, '2020-10-15', '--', 'product.png', 0, 1, 0),
(32, 6, 7, 2, '2020-04-15', '036731001825', 'Gatorade Naranja', 'Botella 600ml', 100, 20, 25, 3, '2020-09-04', '--', 'product.png', 0, 1, 0),
(33, 6, 4, 2, '2020-04-29', '7401002304197', 'Salvavidas Roja Mini', 'Botella 350ml', 100, 20, 25, 5, '2020-07-04', '--', 'product.png', 0, 1, 0),
(34, 6, 4, 2, '2020-04-29', '7401002304685', 'Salvavidas Uva Mini', 'Botella 350ml', 100, 20, 25, 3, '2020-07-11', '--', 'product.png', 0, 1, 0),
(35, 6, 4, 2, '2020-04-29', '7401002305699', 'Super Lime Lemon mini', 'Botella 350ml', 100, 20, 25, 3, '2020-07-17', '--', 'product.png', 0, 1, 0),
(36, 6, 4, 2, '2020-04-29', '7401002301455', 'Super Cola mini', 'Botella 350ml', 100, 20, 25, 3, '2020-07-19', '--', 'product.png', 0, 1, 0),
(37, 2, 3, 2, '2020-04-15', '7401002301523', 'Mineral Canada Dry', 'Lata 350ml', 100, 20, 25, 5, '2020-01-06', '--', 'product.png', 0, 1, 0),
(38, 2, 4, 2, '2020-04-15', '7401002301288', 'Super Cola', 'Lata 350ml', 100, 20, 25, 2, '2020-08-05', '--', 'product.png', 0, 1, 0),
(39, 6, 7, 2, '2020-04-15', '095188013027', 'Tampico Pachon Citrus Punch', 'Botella 300ml', 100, 20, 25, 3, '2020-06-07', '--', 'product.png', 0, 1, 0),
(40, 5, 5, 2, '2020-04-15', '7401001508107', 'Fruvita Pera', 'Caja 200ml', 100, 20, 25, 2, '2020-08-04', '--', 'product.png', 0, 1, 0),
(41, 5, 5, 2, '2020-04-15', '7401001508015', 'Fruvita Manzana', 'Caja 200ml', 100, 20, 25, 3, '2021-02-14', '--', 'product.png', 0, 1, 0),
(42, 5, 5, 2, '2020-04-15', '7401001508053', 'Fruti Vita Melocotón', 'Caja 200ml', 100, 20, 25, 4, '2021-03-01', '--', 'product.png', 0, 1, 0),
(43, 2, 4, 2, '2020-04-15', '7441003500235', 'Coca Cola', 'Lata 354ml', 100, 20, 25, 6, '2020-11-27', '--', 'product.png', 0, 1, 0),
(44, 6, 3, 2, '2020-04-21', '7441003584488', 'Powerade Avalancha Lapina', 'Botella 600ml', 100, 20, 25, 2, '2020-07-15', '--', 'product.png', 0, 1, 0),
(45, 7, 3, 2, '2020-04-18', 'minshangrila', 'Agua Mineral Shangrila', 'Envase Retornable de 350ml', 100, 20, 25, 4, '2020-08-15', '--', 'product.png', 0, 1, 0),
(46, 7, 4, 2, '2020-04-14', 'frescatoronja', 'Fresca Toronja', 'Envase Retornable 354m', 100, 20, 25, 2, '2020-08-11', '--', 'product.png', 0, 1, 0),
(47, 7, 4, 2, '2020-04-14', '7441003530201', 'Sprite', 'Envase Retornable 354ml', 100, 20, 25, 2, '2020-07-14', '--', 'product.png', 0, 1, 0),
(48, 2, 5, 2, '2020-05-01', '088313010442', 'Kerns Manzana', 'Lata 330ml', 100, 20, 25, 5, '2022-01-15', '--', 'product.png', 0, 1, 0),
(49, 2, 4, 2, '2020-04-15', '7401002304012', 'Salvavidas Roja', 'Lata 350ml', 100, 20, 25, 2, '2020-08-22', '--', 'product.png', 0, 1, 0),
(50, 2, 3, 2, '2020-04-15', '7401005988561', 'Adrenaline Rush', 'Lata 473ml', 100, 20, 25, 2, '2021-02-14', '--', 'product.png', 0, 1, 0),
(51, 7, 4, 2, '2020-04-18', '7441003520202', 'Fanta Sabores', 'Envase Retornable 354ml varios Sabores', 100, 20, 25, 2, '2020-08-17', '--', 'product.png', 0, 0, 0),
(52, 5, 5, 2, '2020-04-21', '7401001507278', 'Shaka laka Vainilla', 'Caja 200ml', 100, 20, 25, 5, '2020-10-11', '--', 'product.png', 0, 1, 0),
(53, 5, 5, 2, '2020-04-21', '7401001507308', 'Shaka Laka Fresa', 'Caja 200ml', 100, 20, 25, 5, '2020-09-19', '--', 'product.png', 0, 1, 0),
(54, 5, 8, 2, '2020-09-01', '7501040091407', 'Yoghurt Yoplait Fresa', 'yoghurt 220g', 99, 20, 25, 3, '2020-04-09', '9', 'product.png', 0, 1, 0),
(55, 5, 8, 2, '2020-04-15', '7501020561159', 'Yoghurt Lala Fresa', 'Yoghurt 220g', 98, 20, 25, 3, '2020-04-24', '--', 'product.png', 0, 1, 0),
(56, 2, 6, 2, '2020-04-15', '7401000702414', 'Cerveza Gallo', 'Lata 350ml', 100, 20, 25, 2, '2021-01-14', '--', 'product.png', 0, 1, 0),
(57, 5, 9, 2, '2020-04-15', '7501020546477', 'Nutri Lety Leche 1lt', 'Caja de Leche', 100, 20, 25, 2, '2020-07-02', '--', 'product.png', 0, 1, 0),
(58, 5, 9, 2, '2020-04-15', '7441014703694', 'Crema La Villita', 'Bolsa 130g', 100, 20, 25, 5, '2020-06-16', '--', 'product.png', 0, 1, 0),
(59, 5, 9, 2, '2020-05-01', '763517611045', 'Leche Entera Foremost', 'Bolsa 425ml', 100, 20, 25, 2, '2020-07-02', '--', 'product.png', 0, 1, 0),
(60, 5, 9, 2, '2020-04-15', '763517010114', 'Leche Entera Foremost', 'Bolsa 900ml', 100, 20, 25, 2, '2020-05-15', '--', 'product.png', 0, 1, 0),
(61, 5, 9, 2, '2020-04-14', '7501040081460', 'Queso Americano La Villita', 'Bolsa Pequeña 140g', 100, 20, 25, 1, '2020-06-29', '--', 'product.png', 0, 1, 0),
(62, 3, 4, 2, '2020-04-30', '7441003500501', 'Coca Cola 1lt', 'Envase Retornable', 100, 20, 25, 5, '2020-09-28', '--', 'product.png', 0, 1, 0),
(63, 5, 4, 2, '2020-04-30', '7401080200312', 'Coca Cola Jumbo 2.5lt', 'Desechable Jumbo', 100, 20, 25, 3, '2020-05-30', '--', 'product.png', 0, 1, 0),
(64, 5, 2, 2, '2020-04-15', '7702031787570', 'Stay Free', 'Toallas Sanitarias normal con alas (10 tollas)', 100, 20, 25, 5, '2021-05-30', '--', 'product.png', 0, 1, 0),
(65, 5, 2, 2, '2020-04-15', '7441008164821', 'Kotex', 'Esencial con alas (10 toallas), Tela voile extradoux', 100, 20, 25, 5, '2021-08-06', '--', 'product.png', 0, 1, 0),
(66, 5, 2, 2, '2020-04-15', '7509546074658', 'Jabón Palmolive', 'Jabón Lavanda y crema 150g', 100, 20, 25, 1, '2021-12-01', '--', 'product.png', 0, 1, 0),
(67, 5, 2, 2, '2020-04-15', '7509546074641', 'Jabón Palmolive', 'Extractos de frutos del bosque y agua de coco 150g', 100, 20, 25, 1, '2021-12-01', '--', 'product.png', 0, 1, 0),
(68, 5, 2, 2, '2020-04-15', '7509546074726', 'Jabón Palmolive', 'Yoghurt y frutas 150g', 100, 20, 25, 1, '2021-05-01', '--', 'product.png', 0, 1, 0),
(69, 5, 10, 2, '2020-04-15', '099176263906', 'Axion Espuma Activa', 'Jabón líquido para utensilios de cocina 75ml', 98, 20, 25, 1, '2024-06-01', '--', 'product.png', 0, 1, 0),
(70, 5, 10, 2, '2020-05-06', '606110064569', 'Esponja Verde', 'Esponja Limpiadora Alteco Sol', 99, 20, 25, 1, '2024-06-01', '--', 'product.png', 0, 1, 0),
(71, 5, 10, 2, '2020-04-15', '7415603271536', 'Cepillo Riñon Industrial', 'Cepillo de Ropa', 100, 20, 25, 1, '2024-06-01', '--', 'product.png', 0, 1, 0),
(72, 1, 2, 2, '2020-04-15', '7406233000092', 'Toallas Húmedas POM POM', 'Paquete 80 toallas  sin alcohol', 100, 20, 25, 5, '0000-00-00', '--', 'product.png', 0, 1, 0),
(73, 5, 2, 2, '2020-04-25', '099176922261', 'Jabón Protex', 'Balance Saludable 110g', 100, 20, 25, 2, '2021-11-01', '--', 'product.png', 0, 1, 0),
(74, 5, 2, 2, '2020-04-25', '099176922247', 'Jabón Protex', 'Fresh 110g', 100, 20, 25, 2, '2021-11-01', '--', 'product.png', 0, 1, 0),
(75, 5, 2, 2, '2020-04-15', '7509546074702', 'Jabón Palmolive', 'Jasmín y Manteca de Cacao 150g', 100, 20, 25, 2, '2021-09-01', '--', 'product.png', 0, 1, 0),
(76, 5, 2, 2, '2020-04-15', '099176316817', 'Cepillos Colgate', 'Premier Clean con Limpiador de lengua', 100, 20, 25, 1, '2024-09-01', '--', 'product.png', 0, 1, 0),
(77, 5, 2, 2, '2020-04-15', '7453038431156', 'Cepillo Dental Beauty', 'Cepillo para niños', 100, 20, 25, 1, '2024-09-01', '--', 'product.png', 0, 1, 0),
(78, 5, 2, 2, '2020-04-15', '759364010087', 'K-Dent Duro', 'Cepillo Dental Duro Cepident', 100, 20, 25, 1, '0000-00-00', '--', 'product.png', 0, 1, 0),
(79, 5, 11, 2, '2020-09-01', '4719867213084', 'Super Glue Chemmer', 'Pegamento super Fuerte 1.5g', 100, 20, 25, 5, '2024-09-01', '8', 'product.png', 0, 1, 0),
(80, 5, 2, 2, '2020-04-15', '713200110010', 'Rasuradora', 'Dorusa TD-709', 100, 20, 25, 4, '0000-00-00', '--', 'product.png', 0, 1, 0),
(81, 5, 2, 2, '2020-04-15', '7506195108734', 'Rasuradora Gillete', 'Cabeza Fija Ultra Grip2', 100, 20, 25, 4, '2024-09-01', '--', 'product.png', 0, 1, 0),
(82, 8, 11, 2, '2020-09-01', 'bateriaaaaray', 'Batería Rayovac AAA', 'Par de Baterías', 96, 20, 25, 1, '2024-09-01', '8', 'product.png', 0, 1, 0),
(83, 8, 11, 2, '2020-04-15', 'bateriaaaray', 'Batería Rayovac AA', 'par de baterías', 99, 20, 25, 1, '2024-09-01', '--', 'product.png', 0, 1, 0),
(84, 1, 11, 2, '2020-04-15', '6953675800205', 'Palillos Pinchos', 'Purely Natural', 99, 20, 25, 1, '2024-09-01', '--', 'product.png', 0, 1, 0),
(85, 5, 12, 2, '2020-04-14', '785381014456', 'Baygon Ultra Verde', 'Aerosol 400ml', 100, 20, 25, 1, '2021-05-01', '--', 'product.png', 0, 1, 0),
(86, 5, 11, 2, '2020-04-15', '8998899001760', 'Autan Espiral Lavanda', 'Espirales para mosquitos', 100, 20, 25, 2, '2021-05-01', '--', 'product.png', 0, 1, 0),
(87, 5, 11, 2, '2020-04-15', '8998899001753', 'Autan Espiral', 'Espiral para mosquitos', 98, 20, 25, 2, '2021-05-01', '--', 'product.png', 0, 1, 0),
(88, 5, 2, 2, '2020-04-15', '7509546064635', 'Speed Stick mini', 'Antitranspirante Xtreme Ultra Tech 20g', 100, 20, 25, 1, '2021-01-01', '--', 'product.png', 0, 1, 0),
(89, 5, 2, 2, '2020-04-15', '7509546030258', 'Lady Speed Stick', 'Double Defense Antitranspirante', 100, 20, 25, 1, '2021-10-01', '--', 'product.png', 0, 1, 0),
(90, 5, 11, 2, '2020-04-15', 'cortauniaspeq', 'Corta Uñas Pequeño', 'metal', 100, 20, 25, 1, '2021-10-01', '--', 'product.png', 0, 1, 0),
(91, 5, 11, 2, '2020-04-14', 'colacabello', 'Cola Negra', 'Cola elástica', 100, 20, 25, 2, '2021-10-01', '--', 'product.png', 0, 1, 0),
(92, 9, 11, 2, '2020-04-15', 'hulescol', 'Hules de Color', 'Hulitos', 100, 20, 25, 2, '2021-10-01', '--', 'product.png', 0, 1, 0),
(93, 5, 11, 2, '2020-04-15', 'candadotrypeq', 'Candado Try-Cycler Pequeño', 'Candado de Metal Pequeño', 100, 20, 25, 1, '2021-10-01', '--', 'product.png', 0, 1, 0),
(94, 5, 11, 2, '2020-04-15', 'candadotrymed', 'Candado Try-Cycler Mediano', 'Candado de Metal Mediano', 100, 20, 25, 1, '2021-10-01', '--', 'product.png', 0, 1, 0),
(95, 5, 11, 2, '2020-04-15', 'candadotrygran', 'Candado Try-Cycler Grande', 'Candado de Metal Grande', 100, 20, 25, 1, '2021-10-01', '--', 'product.png', 0, 1, 0),
(96, 5, 10, 2, '2020-04-15', '099176006268', 'Azistín Forta Lavanda', 'Bolsa pequeña 80ml', 100, 20, 25, 5, '2021-07-06', '--', 'product.png', 0, 1, 0),
(97, 5, 10, 2, '2020-04-15', '099176133421', 'Fabuloso Antibacteril', 'Bolsa Lavanda fresca 80ml', 100, 20, 25, 5, '2022-02-01', '--', 'product.png', 0, 1, 0),
(98, 5, 10, 2, '2020-04-15', '099176006251', 'Azistín Forta Manzana', 'Bolsa Desinfectante 80ml', 100, 20, 25, 5, '2022-02-01', '--', 'product.png', 0, 1, 0),
(99, 5, 10, 2, '2020-04-15', '099176232940', 'Sauvitel Complete', 'Fresca Primavera Bolsa de 80ml', 100, 20, 25, 5, '2022-02-01', '--', 'product.png', 0, 1, 0),
(100, 5, 10, 2, '2020-04-14', '7509546650760', 'Suavitel complete', 'Flor de Primavera bolsa 80ml Rosado', 100, 20, 25, 5, '2021-07-01', '--', 'product.png', 0, 1, 0),
(101, 5, 10, 2, '2020-04-14', '099176232933', 'Suavitel Complete', 'Aroma de Sol Bolsa 80ml Amarillo', 100, 20, 25, 5, '2022-02-01', '--', 'product.png', 0, 1, 0),
(102, 5, 10, 2, '2020-04-25', '099176003731', 'Jabón Doña Blanca', 'Jabón Arrasagrasa Limón 105g', 100, 20, 25, 3, '2022-10-01', '--', 'product.png', 0, 1, 0),
(103, 5, 10, 2, '2020-04-25', '099176003687', 'Jabón Doña Blanca', 'Jabón Arrasagrasa Limón 170g', 100, 20, 25, 3, '2022-10-01', '--', 'product.png', 0, 1, 0),
(104, 5, 10, 2, '2020-04-15', '099176003717', 'Jabón Potensol', 'Jabón 400g', 100, 20, 25, 2, '2022-12-01', '--', 'product.png', 0, 1, 0),
(105, 5, 10, 2, '2020-04-15', '7401006100023', 'Detergente en Barra Tex', 'Jabón Limón 225g', 100, 20, 25, 1, '2022-11-01', '--', 'product.png', 0, 1, 0),
(106, 5, 10, 2, '2020-04-15', '7501026027567', 'Detergente Blanca Nieves', 'Bolsa 100g (pequeña)', 100, 20, 25, 2, '2022-11-01', '--', 'product.png', 0, 1, 0),
(107, 5, 10, 2, '2020-04-15', '7501026026584', 'Detergente Foca', 'Bolsa 100g (pequeña)', 100, 20, 25, 2, '2022-11-01', '--', 'product.png', 0, 1, 0),
(108, 5, 10, 2, '2020-04-14', '7421001644551', 'Bola de Jabón Max', 'Jabón de Ropa bola verde', 100, 20, 25, 3, '2022-01-01', '--', 'product.png', 0, 1, 0),
(109, 5, 10, 2, '2020-04-15', '7421001613540', 'Bola Jabón Max', 'Jabón de Ropa Azul', 100, 20, 25, 3, '2021-09-01', '--', 'product.png', 0, 1, 0),
(110, 5, 10, 2, '2020-04-15', '7421001643509', 'Bola de Jabón Max', 'Jabón de ropa blanca', 100, 20, 25, 3, '2021-11-01', '--', 'product.png', 0, 1, 0),
(111, 5, 10, 2, '2020-04-15', '7406171035798', 'Detergente en Polvo Ultra Klin', 'Bolsa 440g Anaranjada', 100, 20, 25, 2, '2023-02-01', '--', 'product.png', 0, 1, 0),
(112, 5, 10, 2, '2020-04-25', '7406171035804', 'Detergente en Polva Ultra Klin', 'Bolsa 440g Rojo', 100, 20, 25, 2, '2023-03-01', '--', 'product.png', 0, 1, 0),
(113, 5, 10, 2, '2020-04-25', '7401006102003', 'Detergente en Polvo Ultra Klin', 'Bolsa 440g Verde', 100, 20, 25, 2, '2023-03-01', '--', 'product.png', 0, 1, 0),
(114, 5, 10, 2, '2020-04-25', '7406171035811', 'Detergente en Polvo Ultra Klin', 'Bolsa 440g Azul', 100, 20, 25, 2, '2023-02-01', '--', 'product.png', 0, 1, 0),
(115, 5, 10, 2, '2020-04-15', '7421001613861', 'Bola de Jabón Max', 'Jabón para ropa Naranja', 100, 20, 25, 3, '2021-11-01', '--', 'product.png', 0, 1, 0),
(116, 5, 10, 2, '2020-04-15', '785381014401', 'Cloro Superpro', 'Cloro blanqueador + Desinfectante bolsa 240ml', 100, 20, 25, 6, '2021-02-01', '--', 'product.png', 0, 1, 0),
(117, 5, 10, 2, '2020-04-15', '7506195163702', 'Cloro Magia Blanca', 'Bolsa 200ml', 100, 20, 25, 6, '2023-10-01', '--', 'product.png', 0, 1, 0),
(118, 5, 10, 2, '2020-04-15', '7501026027550', 'Detergente Blanca Nieves', 'Bolsa 250g', 100, 20, 25, 2, '2023-10-01', '--', 'product.png', 0, 1, 0),
(119, 5, 10, 2, '2020-04-15', '7501026026577', 'Detergente en polvo Foca', 'Bolsa 250g', 100, 20, 25, 2, '2023-10-01', '--', 'product.png', 0, 1, 0),
(120, 5, 10, 2, '2020-04-25', '7406171021234', 'Detergente en Polvo Ultra Klin', 'Bolsa 1.1kg Naranaja', 100, 20, 25, 2, '2023-02-01', '--', 'product.png', 0, 1, 0),
(121, 5, 11, 2, '2020-04-15', 'ametralladorapan', 'Ametralladora Pantera', '1 m', 100, 20, 25, 1, '2023-02-01', '--', 'product.png', 0, 1, 0),
(122, 1, 1, 2, '2020-04-16', '7406360000026', 'Servilletas White Cotton', 'Paquete 100 Servilletas', 100, 20, 25, 2, '2023-02-01', '--', 'product.png', 0, 1, 0),
(123, 5, 1, 2, '2020-04-16', '766324303417', 'Mayordomo Nube Blanca', 'Toalla Multiusos 60 hojas doble', 100, 20, 25, 1, '2023-02-01', '--', 'product.png', 0, 1, 0),
(124, 5, 1, 2, '2020-04-16', 'panialm', 'pañal mediano', 'Pañal varios', 100, 20, 25, 3, '2023-02-01', '--', 'product.png', 0, 1, 0),
(125, 5, 2, 2, '2020-04-15', '7501019006623', 'Saba buenas noches', '10 toallas  extra largas nocturna', 100, 20, 25, 2, '2023-02-02', '--', 'product.png', 0, 1, 0),
(126, 5, 13, 2, '2020-04-16', '089674020002', 'Consomé de Pollo', 'Sazonador en polvo 12g', 100, 20, 25, 5, '2020-12-31', '--', 'product.png', 0, 1, 0),
(127, 5, 13, 2, '2020-04-16', '089674050467', 'Sal de Ajo Malher', 'Sobre 6g', 100, 20, 25, 5, '2021-02-28', '--', 'product.png', 0, 1, 0),
(128, 10, 13, 2, '2020-04-16', '7401002902676', 'Arroz Gallo Dorado', 'Precocido 1lb', 100, 20, 25, 1, '2021-10-16', '--', 'product.png', 0, 1, 0),
(129, 5, 13, 2, '2020-04-16', '0896740008517', 'Sazón Completa Malher', 'Sazonador en polvo 6g', 100, 20, 25, 3, '2020-10-31', '--', 'product.png', 0, 1, 0),
(130, 5, 13, 2, '2020-04-16', '089674050733', 'Sazonador Malher', 'Acentuador de Sabor en polvo 5g', 100, 20, 25, 3, '2020-01-31', '--', 'product.png', 0, 1, 0),
(131, 5, 13, 2, '2020-04-15', '7401001790137', 'Café la Jarillita', 'Instantaneo 8g', 100, 20, 25, 5, '2022-09-01', '--', 'product.png', 0, 1, 0),
(132, 5, 13, 2, '2020-04-15', '725226000282', 'Chicle Cubo de la Rosa', 'Varios sabores', 100, 20, 25, 5, '2022-09-01', '--', 'product.png', 0, 1, 0),
(133, 5, 13, 2, '2020-04-15', '7401137103047', 'Mostaza Ana Belly', 'Bolsa 100g', 100, 20, 25, 2, '2021-08-21', '--', 'product.png', 0, 1, 0),
(134, 5, 13, 2, '2020-04-16', '089674002121', 'Consomé Tomate Res Malher', 'Sobre 10g', 100, 20, 25, 5, '2021-02-28', '--', 'product.png', 0, 1, 0),
(135, 1, 13, 2, '2020-04-16', '7401056950319', 'Maseca Harina de Maiz', 'Paquete 800g', 100, 20, 25, 2, '2020-09-30', '--', 'product.png', 0, 1, 0),
(136, 5, 13, 2, '2020-04-16', '089674050641', 'Canela En Polvo Malher', 'Sobre 3g', 100, 20, 25, 5, '2020-12-31', '--', 'product.png', 0, 1, 0),
(137, 5, 13, 2, '2020-04-16', '089674050917', 'Suavirico Malher', 'Sobre Ablandador de carne en polvo 7g', 100, 20, 25, 5, '2020-11-30', '--', 'product.png', 0, 1, 0),
(138, 5, 13, 2, '2020-04-16', '089674050375', 'Sal de Cebolla Malher', 'Sobre de Sal de cebolla en polvo 6g', 100, 20, 25, 5, '2020-10-31', '--', 'product.png', 0, 1, 0),
(139, 5, 13, 2, '2020-04-16', '070662242025', 'Sopa CUP NOODLES Nissin', 'Sopa instantánea de camarón', 100, 20, 25, 5, '2021-01-17', '--', 'product.png', 0, 1, 0),
(140, 5, 13, 2, '2020-04-16', '7404001800134', 'Sopa Laky', 'Sopa instantánea de camarón', 100, 20, 25, 5, '2021-01-31', '--', 'product.png', 0, 1, 0),
(141, 5, 13, 2, '2020-04-16', '753081201001', 'Salsa Inglesa Ina', 'Botella 89ml', 100, 20, 25, 2, '2021-11-15', '--', 'product.png', 0, 1, 0),
(142, 5, 13, 2, '2020-04-16', '738777170038', 'Salsa Brava Picamas', 'Botella 100g', 100, 20, 25, 2, '2021-04-07', '--', 'product.png', 0, 1, 0),
(143, 5, 13, 2, '2020-04-16', '7401137107007', 'Vinagre Ana Belly', 'Botella vinagre sintético 92g', 100, 20, 25, 2, '2021-05-20', '--', 'product.png', 0, 1, 0),
(144, 5, 13, 2, '2020-04-16', '753081200004', 'Salsa Soya Ina', 'Botella 89ml', 100, 20, 25, 2, '2021-05-24', '--', 'product.png', 0, 1, 0),
(145, 5, 13, 2, '2020-04-16', '7401007800144', 'Esencia Castilla Fresa', 'Botella 8.5 Oz', 100, 20, 25, 1, '2030-12-02', '--', 'product.png', 0, 1, 0),
(146, 5, 13, 2, '2020-04-16', '7401007800120', 'Esencia Castilla Crema', 'Frasco 8.5 Oz.', 100, 20, 25, 1, '2030-12-02', '--', 'product.png', 0, 1, 0),
(147, 5, 13, 2, '2020-04-16', '7401007800212', 'Esencia Castilla Piña', 'Frasco 8.5Oz', 100, 20, 25, 1, '2030-12-02', '--', 'product.png', 0, 1, 0),
(148, 5, 13, 2, '2020-04-21', '089674010546', 'Ablandador y Sazonador Malher', 'Sobre en polvo 10g', 100, 20, 25, 5, '2020-10-31', '--', 'product.png', 0, 1, 0),
(149, 5, 13, 2, '2020-04-15', '7613035398702', 'Café Musun', 'Sobre 8g (8 tazas)', 100, 20, 25, 3, '2021-02-28', '--', 'product.png', 0, 1, 0),
(150, 5, 13, 2, '2020-04-16', '7702354251550', 'FresaYá', 'Mezcla en Polvo 20g', 100, 20, 25, 1, '2020-09-28', '--', 'product.png', 0, 1, 0),
(151, 5, 13, 2, '2020-04-15', '088169430586', 'Cola de Res Maggi', 'Bolsa para reparar Sopa 76g', 100, 20, 25, 1, '2020-08-31', '--', 'product.png', 0, 1, 0),
(152, 5, 13, 2, '2020-04-15', '7613035396203', 'Sopa de Pollo con Fideos Maggi', 'Sopa de 57g', 100, 20, 25, 1, '2021-01-31', '--', 'product.png', 0, 1, 0),
(153, 5, 13, 2, '2020-04-16', '7411000345405', 'Sopa Criolla Knorr', 'Costillas de Res Criolla con Fideos 55g', 100, 20, 25, 2, '2020-07-17', '--', 'product.png', 0, 1, 0),
(154, 5, 13, 2, '2020-04-15', '088169429900', 'Crema de Mariscos Maggi', 'Sobre 80g', 100, 20, 25, 2, '2020-09-30', '--', 'product.png', 0, 1, 0),
(155, 5, 13, 2, '2020-04-21', '7411000344859', 'Salsa Natura Ranchera', 'Salsita de Tomate 106g', 100, 20, 25, 2, '2022-01-15', '--', 'product.png', 0, 1, 0),
(156, 5, 13, 2, '2020-04-16', '088313590807', 'Pasta de Tomate Kerns', 'Pasta Original 114g', 100, 20, 25, 1, '2021-08-11', '--', 'product.png', 0, 1, 0),
(157, 5, 13, 2, '2020-04-16', '089674007270', 'Yus guanabana Toki', 'Pulpa de fruta  28g', 100, 20, 25, 1, '2020-06-30', '--', 'product.png', 0, 1, 0),
(158, 5, 13, 2, '2020-04-14', '7702354251598', 'HorchataYa', 'Sobre 20g', 100, 20, 25, 1, '2020-11-27', '--', 'product.png', 0, 1, 0),
(159, 5, 13, 2, '2020-04-16', '7702354251581', 'PiñaYá', 'Sobre 20g', 100, 20, 25, 1, '2020-11-12', '--', 'product.png', 0, 1, 0),
(160, 5, 13, 2, '2020-04-16', '089674006846', 'Yus Rosa de Jamaica Toki', 'Sobre 28g', 100, 20, 25, 1, '2020-06-30', '--', 'product.png', 0, 1, 0),
(161, 5, 13, 2, '2020-04-16', '089674007058', 'Fruty Naranaja', 'Sobre 14g', 100, 20, 25, 2, '2020-06-30', '--', 'product.png', 0, 1, 0),
(162, 5, 13, 2, '2020-04-16', '089674007034', 'Fruty Fresa', 'Sobre 14g', 100, 20, 25, 2, '2020-06-30', '--', 'product.png', 0, 1, 0),
(163, 5, 13, 2, '2020-04-16', '089674007065', 'Fruty Limonada', 'Sobre 14g', 100, 20, 25, 1, '2020-06-30', '--', 'product.png', 0, 1, 0),
(164, 5, 13, 2, '2020-04-16', '089674007041', 'Fruty Piña', 'Sobre 14g', 100, 20, 25, 1, '2020-06-30', '--', 'product.png', 0, 1, 0),
(165, 5, 13, 2, '2020-04-16', '089674007096', 'Fruty Horchata', 'Sobre 14g', 100, 20, 25, 1, '2020-06-30', '--', 'product.png', 0, 1, 0),
(166, 5, 13, 2, '2020-04-21', '089674060848', 'Toki Naranja', 'Sobre 8g', 100, 20, 25, 1, '2021-04-30', '--', 'product.png', 0, 1, 0),
(167, 5, 13, 2, '2020-04-21', '089674060817', 'Toki Uva', 'Sobre 8g', 100, 20, 25, 1, '2021-04-30', '--', 'product.png', 0, 1, 0),
(168, 5, 13, 2, '2020-04-21', '089674060831', 'Toki Piña', 'Sobre 8g', 100, 20, 25, 1, '2021-04-30', '--', 'product.png', 0, 1, 0),
(169, 5, 13, 2, '2020-04-21', '089674060824', 'Toki Fresa', 'Sobre 8g', 100, 20, 25, 1, '2021-04-30', '--', 'product.png', 0, 1, 0),
(170, 5, 13, 2, '2020-04-16', '089674006815', 'Yus Fresa Toki', 'Sobre 28g', 100, 20, 25, 1, '2020-12-31', '--', 'product.png', 0, 1, 0),
(171, 5, 13, 2, '2020-04-15', '088169004978', 'Nescafe Clásico', 'Sobre 8g', 100, 20, 25, 5, '2021-02-02', '--', 'product.png', 0, 1, 0),
(172, 5, 13, 2, '2020-04-14', '089674003166', 'Consomé de Camarón Malher', 'Sobre 10g', 100, 20, 25, 5, '2021-01-31', '--', 'product.png', 0, 1, 0),
(173, 5, 13, 2, '2020-04-16', '089674010348', 'Pimienta Negra Malher', 'Pimienta en polvo sobre 2.5g', 100, 20, 25, 5, '2020-10-31', '--', 'product.png', 0, 1, 0),
(174, 11, 13, 2, '2020-04-15', '7411000320921', 'Margarina Mirasol', 'Margarina vegetal 80g', 100, 20, 25, 5, '2020-05-15', '--', 'product.png', 0, 1, 0),
(175, 5, 13, 2, '2020-04-14', '7613035371354', 'Sopa de Pollo Maggi', 'Sopa con fideos sobre 28.5g', 100, 20, 25, 5, '2020-11-30', '--', 'product.png', 0, 1, 0),
(176, 12, 13, 2, '2020-04-16', '6900509507069', 'Palillos de dientes', 'El Sol 500 palillos', 100, 20, 25, 1, '2024-11-30', '--', 'product.png', 0, 1, 0),
(177, 5, 13, 2, '2020-04-21', 'delcaferamita', 'Del Cafe Ramita', 'Cafe tostado y molido 20g', 100, 20, 25, 2, '2024-11-30', '--', 'product.png', 0, 1, 0),
(178, 10, 13, 2, '2020-04-16', 'libarrozpre', 'Arroz Libriado', 'Arroz Precosido', 100, 20, 25, 2, '2024-11-30', '--', 'product.png', 0, 1, 0),
(179, 5, 13, 2, '2020-04-15', '7401001503386', 'Aceite Ideal', 'Aceite Vegetal 80ml', 100, 20, 25, 1, '2021-05-19', '--', 'product.png', 0, 1, 0),
(180, 5, 13, 2, '2020-04-15', '7401001500286', 'Aceite Ideal', 'Aceite Vegetal 445ml', 100, 20, 25, 2, '2021-01-02', '--', 'product.png', 0, 1, 0),
(181, 5, 13, 2, '2020-04-25', '7401001503713', 'Aceite Patrona', 'Aceite Vegetal 175ml', 100, 20, 25, 2, '2021-02-16', '--', 'product.png', 0, 1, 0),
(182, 5, 13, 2, '2020-04-15', '7401001500316', 'Aceite Ideal', 'Aceite Vegetal 175ml', 100, 20, 25, 2, '2021-07-10', '--', 'product.png', 0, 1, 0),
(183, 5, 13, 2, '2020-04-16', '7613035858251', 'Leche en Polvo Nido', 'FortiCrece 110g', 100, 20, 25, 2, '2020-10-31', '--', 'product.png', 0, 1, 0),
(184, 5, 13, 2, '2020-04-16', '7613035988286', 'Leche en polvo Anchor', 'Leche entera 110g', 100, 20, 25, 2, '2020-11-30', '--', 'product.png', 0, 1, 0),
(185, 5, 13, 2, '2020-04-15', '7410030501904', 'Frijoles Volteados La Chula', 'Frijoles negros 170.4g Pequeño', 100, 20, 25, 1, '2021-05-23', '--', 'product.png', 0, 1, 0),
(186, 5, 13, 2, '2020-04-15', '7410030501874', 'Frijol Volteados La Chula', 'Frijoles  Negros 400g Grande', 100, 20, 25, 1, '2021-05-23', '--', 'product.png', 0, 1, 0),
(187, 5, 13, 2, '2020-04-15', '7410030501850', 'Frijoles Volteados la Chula', 'Frijoles Negros 283g Mediana', 100, 20, 25, 1, '2021-12-15', '--', 'product.png', 0, 1, 0),
(188, 5, 13, 2, '2020-04-16', '088313261585', 'Frijol Volteado Ducal', 'Frijoles negros molidos 227g Mediano', 100, 20, 25, 1, '2021-05-15', '--', 'product.png', 0, 1, 0),
(189, 2, 13, 2, '2020-04-16', '088313062267', 'Frijol Volteado Ducal', 'Frijol Negro molido 156g Pequeño', 100, 20, 25, 1, '2022-08-15', '--', 'product.png', 0, 1, 0),
(190, 2, 13, 2, '2020-04-25', '738777020036', 'Jalapeños', 'Rodajados en Escabeche Picante 105g', 100, 20, 25, 1, '2021-05-21', '--', 'product.png', 0, 1, 0),
(191, 2, 13, 2, '2020-04-25', '738777020029', 'Jalapeños', 'Rodajados en escabeche 105g semipicante', 100, 20, 25, 1, '2021-03-26', '--', 'product.png', 0, 1, 0),
(192, 2, 13, 2, '2020-04-16', '028571000663', 'Sardinas la Sirena', 'Salsa de Tomate 75g', 100, 20, 25, 1, '2021-10-16', '--', 'product.png', 0, 1, 0),
(193, 2, 13, 2, '2020-04-16', '028571000731', 'Sardinas La Sirena', 'Salsa de Tomate  Picante Suave 75g', 100, 20, 25, 1, '2022-05-21', '--', 'product.png', 0, 1, 0),
(194, 2, 13, 2, '2020-04-14', '028571000694', 'Sardinas La Sirena', 'Salsa de Tomate Picante 75g', 100, 20, 25, 1, '2022-07-19', '--', 'product.png', 0, 1, 0),
(195, 2, 13, 2, '2020-04-16', '088313326062', 'Pasta de Tomate Kerns', 'Salsa de Tomate 170g (pequeña)', 100, 20, 25, 1, '2022-04-15', '--', 'product.png', 0, 1, 0),
(196, 13, 13, 2, '2020-04-16', 'bijolsobr', 'Bijol', 'Colorante y Saborizante sobre 1.5g', 100, 20, 25, 5, '2020-07-01', '--', 'product.png', 0, 1, 0),
(197, 12, 13, 2, '2020-04-15', '7411000342466', 'Maizena', 'Caja pequeña 47g', 100, 20, 25, 1, '2021-08-31', '--', 'product.png', 0, 1, 0),
(198, 5, 13, 2, '2020-04-14', '7401156700418', 'Salchicha Chimez', 'Salchicha Pavo', 100, 20, 25, 5, '2020-04-12', '--', 'product.png', 0, 1, 0),
(199, 9, 13, 2, '2020-04-15', '7404001800080', 'Sopa Laky Res', 'Sopa Instantánea bolsa 85g', 100, 20, 25, 1, '2020-11-21', '--', 'product.png', 0, 1, 0),
(200, 9, 13, 2, '2020-04-15', '7404001800073', 'Sopa Laky Camaron', 'Sopa Instantánea bolsa 85g', 100, 20, 25, 1, '2021-01-22', '--', 'product.png', 0, 1, 0),
(201, 9, 13, 2, '2020-04-16', '753081101004', 'Chao Mein Ina', 'Fideos para Chao Mein 180g', 100, 20, 25, 1, '2020-07-01', '--', 'product.png', 0, 1, 0),
(202, 9, 13, 2, '2020-04-16', '753081030205', 'Pasta Italiana', 'Cabello de Ángel 150g', 100, 20, 25, 1, '2022-02-03', '--', 'product.png', 0, 1, 0),
(203, 9, 13, 2, '2020-04-16', '753081067003', 'Concha Pasta', 'Pasta L\'Italiana', 100, 20, 25, 1, '2021-12-16', '--', 'product.png', 0, 1, 0),
(204, 9, 13, 2, '2020-04-16', '7501204010039', 'Pasta la Perla', 'Pasta de Sémalo de Trigo 200g', 100, 20, 25, 1, '2020-07-04', '--', 'product.png', 0, 0, 0),
(205, 9, 13, 2, '2020-04-16', '753081024013', 'Codito Mediano L\'Italiana', 'Pasta 200g', 100, 20, 25, 1, '2022-02-10', '--', 'product.png', 0, 1, 0),
(206, 5, 13, 2, '2020-04-14', '7411000345375', 'Sopa Criolla KNORR', 'Sopa de Gallina Criolla con Fideos 54g', 100, 20, 25, 1, '2020-10-12', '--', 'product.png', 0, 1, 0),
(207, 5, 13, 2, '2020-04-15', '803275300789', 'Avena Mosh Quaker', 'Hojuelas de Avena 50g (pequeña)', 100, 20, 25, 1, '2020-12-03', '--', 'product.png', 0, 1, 0),
(208, 5, 14, 2, '2020-04-15', '041667022011', 'Pop Weaver', 'Mantequilla Extra 68g', 99, 20, 25, 1, '2020-11-01', '--', 'product.png', 0, 1, 0),
(209, 10, 13, 2, '2020-04-15', '7401007800526', 'Gelatina Castilla Fresa', 'Vitaminas A y C', 100, 20, 25, 1, '2024-11-01', '--', 'product.png', 0, 1, 0),
(210, 9, 13, 2, '2020-04-15', '7401137101012', 'Ketchup Ana Belly', 'Salsa de Tomate bolsa 215g', 100, 20, 25, 1, '2021-01-06', '--', 'product.png', 0, 1, 0),
(211, 9, 13, 2, '2020-04-15', '7401137100053', 'Mayonesa Ana Belly', 'Bolsa 100g (pequeña)', 100, 20, 25, 1, '2020-12-21', '--', 'product.png', 0, 1, 0),
(212, 9, 13, 2, '2020-04-15', '7401137100060', 'Mayonesa Ana Belly', 'Bolsa 200g (mediana)', 100, 20, 25, 1, '2020-11-21', '--', 'product.png', 0, 1, 0),
(213, 9, 13, 2, '2020-04-15', '7401137100077', 'Mayonesa Ana Belly', 'Bolsa 390g( grande)', 100, 20, 25, 1, '2020-08-08', '--', 'product.png', 0, 1, 0),
(214, 12, 13, 2, '2020-04-15', '7841547989532', 'Aluminium Foil', 'Papel de Aluminio 7.6mts', 100, 20, 25, 1, '2024-08-08', '--', 'product.png', 0, 1, 0),
(215, 12, 13, 2, '2020-04-16', '758437179881', 'Rostizador Empanizador ya Está', 'Caja 3.5g', 100, 20, 25, 2, '2020-08-16', '--', 'product.png', 0, 1, 0),
(216, 10, 13, 2, '2020-04-16', '781179001035', 'Azúcar Caña Real', 'Azúcar Fortificada 500g', 100, 20, 25, 5, '2020-09-01', '--', 'product.png', 0, 1, 0),
(217, 5, 13, 2, '2020-04-16', '7501118342202', 'Sal de Oso Blanco', 'Sal Yodada Floururada 1kg', 100, 20, 25, 1, '2024-09-01', '--', 'product.png', 0, 1, 0),
(218, 12, 13, 2, '2020-04-14', '7401103700232', 'Hot Cakes', 'Panqueques y Waffles 450g', 100, 20, 25, 1, '2020-07-23', '--', 'product.png', 0, 0, 0),
(219, 12, 13, 2, '2020-04-16', '751296150107', 'Hot Cake Mix Gold', 'Mezcla para panqueques 450g', 100, 20, 25, 1, '2020-05-05', '--', 'product.png', 0, 1, 0),
(220, 9, 1, 2, '2020-04-16', '7410010491102', 'Cucharitas Flexi', 'Bolsa 50 unidades #5', 100, 20, 25, 1, '2024-05-05', '--', 'product.png', 0, 1, 0),
(221, 9, 1, 2, '2020-04-16', '7401187300021', 'Tenedores Rumba', 'Tenedores Servimerk 25 unidades', 100, 20, 25, 1, '2024-05-05', '--', 'product.png', 0, 1, 0),
(222, 9, 1, 2, '2020-04-16', '7401187300014', 'Cucharas Rumba', 'Cucharas Servimerk 25 Unidades', 100, 20, 25, 1, '2024-05-05', '--', 'product.png', 0, 1, 0),
(223, 5, 13, 2, '2020-04-16', '7501000910762', 'Gerber Melocón', 'Compota 100g', 100, 20, 25, 1, '2021-05-05', '--', 'product.png', 0, 1, 0),
(224, 9, 1, 2, '2020-04-16', 'cucharasguate', 'Cucharas Guate', 'Cucharas desechables 25 unidades', 100, 20, 25, 1, '2024-05-05', '--', 'product.png', 0, 1, 0),
(225, 9, 1, 2, '2020-04-16', 'cubiertoschinito', 'Cubiertos el Chinito', 'bolsa 25 unidades', 100, 20, 25, 1, '2024-05-05', '--', 'product.png', 0, 1, 0),
(226, 10, 13, 2, '2020-04-16', 'salib', 'Sal', 'Sal Blanca', 100, 20, 25, 5, '2024-05-05', '--', 'product.png', 0, 1, 0),
(227, 10, 13, 2, '2020-04-14', 'chocolatelib', 'Chocolate', 'Chocolate', 100, 20, 25, 1, '2024-05-05', '--', 'product.png', 0, 1, 0),
(228, 5, 10, 2, '2020-04-25', '7406171021227', 'Detergente en Polvo Ultra Klin', 'Bolsa 1.1kg Morada', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(229, 5, 10, 2, '2020-04-25', '7401006100108', 'Detergente en Polvo Ultra Klin', 'Bolsa 1.1kg Verde', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(230, 5, 10, 2, '2020-04-25', '7406171021388', 'Detergente en Polvo Ultra Klin', 'Bolsa 1.1kg Roja', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(231, 5, 13, 2, '2020-05-07', 'huevosun', 'Huevos', 'Varios', 100, 20, 25, 5, '2020-05-05', '--', 'product.png', 0, 1, 0),
(232, 9, 13, 2, '2020-04-21', 'Carbonun', 'Carbon', 'varios', 100, 20, 25, 1, '2020-05-05', '--', 'product.png', 0, 1, 0),
(233, 5, 13, 2, '2020-04-16', 'ajoun', 'ajo', 'Cabez ajo', 100, 20, 25, 1, '2020-05-05', '--', 'product.png', 0, 1, 0),
(234, 5, 13, 2, '2020-04-16', 'cobanun', 'Chile Coban', 'Bolsitas', 100, 20, 25, 2, '2020-05-05', '--', 'product.png', 0, 1, 0),
(235, 5, 13, 2, '2020-04-16', 'tomilloun', 'Tomillo', 'Bolsita', 99, 20, 25, 2, '2020-05-05', '--', 'product.png', 0, 1, 0),
(236, 5, 13, 2, '2020-04-16', 'achoteun', 'Achote Molido', 'Bolsitas', 95, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(237, 5, 13, 2, '2020-04-16', 'clavoun', 'Clavo', 'bolsitas Sasonador', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(238, 5, 13, 2, '2020-04-16', 'bicarbonatoun', 'Bicarbonato', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(239, 5, 13, 2, '2020-04-16', 'laurelun', 'Laurel', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(240, 5, 13, 2, '2020-04-16', 'oreganoun', 'Oregano', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(241, 5, 13, 2, '2020-04-16', 'canelaen raja', 'Canela', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(242, 5, 13, 2, '2020-04-16', 'migaun', 'Miga de Pan', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(243, 5, 13, 2, '2020-04-16', 'charamuscaun', 'Charamusca', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(244, 5, 13, 2, '2020-04-16', 'pcastillaun', 'Pimienta Castilla', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(245, 5, 13, 2, '2020-04-16', 'pgordaun', 'Pimienta Gorda', 'Bolsitas', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(246, 5, 13, 2, '2020-04-16', 'harinaun', 'Harina', 'Bolsita', 100, 20, 25, 2, '2024-05-05', '--', 'product.png', 0, 1, 0),
(247, 12, 13, 2, '2020-04-25', 'fosfogata', 'Fósforos Fogata', 'Caja', 100, 20, 25, 10, '2024-05-05', '--', 'product.png', 0, 1, 0),
(248, 1, 13, 2, '2020-04-16', '099072000674', 'Papel Higiénico Premier', '4 rollos Mega Roll', 100, 20, 25, 3, '2024-05-05', '--', 'product.png', 0, 1, 0),
(249, 5, 2, 2, '2020-04-14', 'papelpremierun', 'Papel Higiénico Premier', '400 hojas', 100, 20, 25, 3, '2024-05-05', '--', 'product.png', 0, 0, 0),
(250, 5, 2, 2, '2020-04-16', '7441008126751', 'Papel Higiénico Scoot Plus', 'Doble Higiene', 100, 20, 25, 3, '2021-03-22', '--', 'product.png', 0, 1, 0),
(251, 5, 2, 2, '2020-04-16', '7404004200467', 'Max Pappel', 'Hojas Dobles Acolchonadas', 100, 20, 25, 3, '2021-03-22', '--', 'product.png', 0, 1, 0),
(252, 1, 2, 2, '2020-04-16', '766324304094', 'Rosal Soft Plus', '4 rollos doble hoja', 100, 20, 25, 3, '2021-03-22', '--', 'product.png', 0, 1, 0),
(253, 1, 1, 2, '2020-04-15', '7408304259354', 'Vaso Desechable Envaica', 'Paquete de 25 unidades 4.5 Onzas', 100, 20, 25, 2, '2024-04-15', '--', 'product.png', 0, 1, 0),
(254, 1, 1, 2, '2020-04-15', '7408304259200', 'Plato desechable Envaica', 'Paquete de 25 unidades P6s', 100, 20, 25, 2, '2024-04-15', '--', 'product.png', 0, 1, 0),
(255, 1, 1, 2, '2020-04-15', '7404001800479', 'Vaso desechable Laky', 'Paquete 25 unidades térmico', 100, 20, 25, 2, '2024-04-15', '--', 'product.png', 0, 1, 0),
(256, 1, 1, 2, '2020-04-15', '7502208800190', 'Vaso Desechable Reyma', 'Vaso Térmico 25 piezas 10 Oz', 100, 20, 25, 2, '2024-04-15', '--', 'product.png', 0, 1, 0),
(257, 5, 1, 2, '2020-04-15', '7441008141440', 'Pañales Huggies', 'G3 Tamaño 20 - 27.5Lbs', 100, 20, 25, 1, '2021-11-07', '--', 'product.png', 0, 1, 0),
(258, 5, 14, 2, '2020-04-15', '721282403883', 'Lays  Max Queso', '35g', 96, 20, 25, 2, '2020-06-14', '--', 'product.png', 0, 1, 0),
(259, 5, 14, 2, '2020-04-15', '721282403869', 'Lays Original', '35g', 100, 20, 25, 2, '2020-06-07', '--', 'product.png', 0, 1, 0),
(260, 5, 14, 2, '2020-04-15', '721282402329', 'Poffets Queso Frito Lay', '36g', 96, 20, 25, 2, '2020-05-31', '--', 'product.png', 0, 1, 0),
(261, 5, 14, 2, '2020-04-15', '721282202745', 'Fiestas Snax', '42g', 99, 20, 25, 2, '2020-05-31', '--', 'product.png', 0, 1, 0),
(262, 5, 14, 2, '2020-04-15', '748757005298', 'Tocinito Diana', 'Sabor Tocino y Barbacoa 10g', 99, 20, 25, 2, '2020-07-04', '--', 'product.png', 0, 1, 0),
(263, 5, 14, 2, '2020-04-15', '721282303718', 'Chicharrones Criollos Frito Lay', '22g', 100, 20, 25, 3, '2020-04-19', '--', 'product.png', 0, 1, 0),
(264, 5, 14, 2, '2020-04-15', '721282203834', 'Tortirx Tacos', 'Chile-ros 37g', 100, 20, 25, 3, '2020-06-14', '--', 'product.png', 0, 1, 0),
(265, 5, 14, 2, '2020-04-15', '748757003935', 'Maní Japones Diana', 'Maní Horneado Saboreado con salsa de Soya 27g', 100, 20, 25, 3, '0000-00-00', '--', 'product.png', 0, 1, 0),
(266, 5, 14, 2, '2020-04-15', '721282303824', 'Tortrix Twist', 'Queso 24g', 100, 20, 25, 3, '2020-06-14', '--', 'product.png', 0, 1, 0),
(267, 5, 14, 2, '2020-04-15', '721282102434', 'Hula Hoops Frito Ley', 'Anillitos de Papa 18g', 100, 20, 25, 3, '2020-05-03', '--', 'product.png', 0, 1, 0),
(268, 5, 14, 2, '2020-04-15', '748757000590', 'Toztecas Diana', 'Tortillas de Maíz con chile chipotle y limón 25g', 100, 20, 25, 3, '2020-07-12', '--', 'product.png', 0, 1, 0),
(269, 5, 14, 2, '2020-04-25', '721282303787', 'Tortrix Barbacoa', '26g', 100, 20, 25, 3, '2020-06-21', '--', 'product.png', 0, 1, 0),
(270, 5, 14, 2, '2020-04-15', '081537305929', 'Maní Japones Naú', 'Maní horneado 20g', 100, 20, 25, 3, '2020-06-12', '--', 'product.png', 0, 1, 0),
(271, 5, 14, 2, '2020-04-15', '748757004482', 'Maní Limón Diana', 'Maní sabor a limón 23g', 100, 20, 25, 2, '2020-06-19', '--', 'product.png', 0, 1, 0),
(272, 5, 14, 2, '2020-04-25', '721282102557', 'Cebollitas Filler\'s', '12g', 100, 20, 25, 2, '2020-06-14', '--', 'product.png', 0, 1, 0),
(273, 5, 14, 2, '2020-04-15', '748757001542', 'Elotitos Valientes Diana', 'Maíz Frito con sabor a Salsa Picante 15g', 100, 20, 25, 2, '2020-07-06', '--', 'product.png', 0, 1, 0),
(274, 5, 14, 2, '2020-04-25', '721282303831', 'Tortix Twist Chilepe', '24g', 100, 20, 25, 3, '2020-06-21', '--', 'product.png', 0, 1, 0),
(275, 5, 14, 2, '2020-04-15', '081537305622', 'Chobix Señorial', 'Frituras de trigo Sabor Barbacoa 18g', 100, 20, 25, 3, '2020-07-04', '--', 'product.png', 0, 1, 0),
(276, 5, 14, 2, '2020-04-15', '748757002761', 'Maní con Piquete Diana', 'Maní con sal y chile 23g', 100, 20, 25, 2, '2020-04-05', '--', 'product.png', 0, 1, 0),
(277, 5, 14, 2, '2020-04-15', '748757002600', 'Jalapeños Diana', 'Tortillas de maíz con sabor a Jalapeño 20g', 100, 20, 25, 2, '2020-07-19', '-', 'product.png', 0, 1, 0),
(278, 5, 14, 2, '2020-04-15', '7406007091325', 'Tortillitas Mix con Aritos Señorial', 'Mezcla de frituras de maíz sabor queso y cebolla 28g', 100, 20, 25, 2, '2020-06-08', '--', 'product.png', 0, 1, 0),
(279, 5, 14, 2, '2020-04-29', '7406007090434', 'Tortillitas Mix con Chicharrones', 'Mezcla de fritura de maíz con chicharrón sabor barbacoa 20g', 100, 20, 25, 2, '2020-07-06', '--', 'product.png', 0, 1, 0),
(280, 5, 14, 2, '2020-04-15', '748757002747', 'Maní con Sal Diana', '23g', 100, 20, 25, 2, '2020-04-23', '--', 'product.png', 0, 1, 0),
(281, 5, 14, 2, '2020-04-15', '7406007091332', 'Tortillitas Mix con Bolitas Señorial', 'Mezcla de frituras de maíz sabor queso y maíz sabor queso 28g', 100, 20, 25, 2, '2020-05-23', '--', 'product.png', 0, 1, 0),
(282, 5, 14, 2, '2020-04-15', '721282101888', 'Chicharrones Barbacoa Frito Lay', 'Bakon Krisp 90g', 100, 20, 25, 2, '2020-05-17', '--', 'product.png', 0, 1, 0),
(283, 5, 14, 2, '2020-04-15', '7406007090342', 'Chicharrones Señorial', 'Sabor Barbacoa 10g', 100, 20, 25, 2, '2020-06-27', '--', 'product.png', 0, 1, 0),
(284, 5, 14, 2, '2020-04-25', '721282202998', 'Tortrix con Chicharrón', '24g', 100, 20, 25, 2, '2020-05-31', '--', 'product.png', 0, 1, 0),
(285, 5, 14, 2, '2020-04-15', '748757005304', 'Maíz Chino Diana', 'Cereal de maíz de barbacoa y chile picante 11g', 100, 20, 25, 2, '2020-06-29', '--', 'product.png', 0, 1, 0),
(286, 5, 14, 2, '2020-04-29', '081537305639', 'Chobix Señorial', 'Sabor queso chipotle 18g', 100, 20, 25, 2, '2020-07-11', '--', 'product.png', 0, 1, 0),
(287, 5, 14, 2, '2020-04-15', '081537305332', 'Tortillitas Señorial', 'Frituras de Maíz 26g', 100, 20, 25, 2, '2020-06-24', '--', 'product.png', 0, 1, 0),
(288, 5, 14, 2, '2020-04-15', '748757002624', 'Nachos Diana', 'Tortillas de maíz con sabor a queso 20g', 100, 20, 25, 2, '2020-07-31', '--', 'product.png', 0, 1, 0),
(289, 5, 14, 2, '2020-04-15', '7406007091349', 'Tortillitas Mix con quesifritos Señorial', 'Mezcla de Frituras de maíz de queso y fritos de chile y queso 28g', 100, 20, 25, 2, '2020-06-24', '--', 'product.png', 0, 1, 0),
(290, 5, 14, 2, '2020-04-15', '748757001399', 'Churritos Lunares Diana', 'Extruido de maíz con queso cheddar blanco 8g', 100, 20, 25, 2, '2020-04-23', '--', 'product.png', 0, 1, 0),
(291, 5, 14, 2, '2020-04-15', '748757005281', 'Churritos Diana', 'Cereal de maíz saboreado con queso', 100, 20, 25, 2, '2020-07-08', '--', 'product.png', 0, 1, 0),
(292, 5, 14, 2, '2020-04-15', '748757002129', 'Cereza Diana', 'Gomita de almidón confitada sabor fresa 20g', 100, 20, 25, 5, '2020-07-29', '--', 'product.png', 0, 1, 0),
(293, 5, 14, 2, '2020-04-15', '748757001597', 'Palitos Chile Limón Diana', 'Palitos de maíz con sabor a chile y limón 15g', 100, 20, 25, 5, '2020-07-15', '--', 'product.png', 0, 1, 0),
(294, 5, 14, 2, '2020-04-15', '748757005373', 'Palitos Diana', 'Palitos de maíz sabor barbacoa 15g', 100, 20, 25, 5, '2020-07-15', '--', 'product.png', 0, 1, 0),
(295, 5, 15, 2, '2020-04-16', '086581110888', 'Galleta Chiky', 'Galletas con cobertura de chocolate', 100, 20, 25, 5, '2020-07-06', '--', 'product.png', 0, 1, 0),
(296, 5, 15, 2, '2020-04-16', '753079200313', 'Galleta Salada Gama', '4 galletas 24g', 100, 20, 25, 5, '2020-07-16', '--', 'product.png', 0, 1, 0),
(297, 5, 15, 2, '2020-04-21', '748757008732', 'Galleta Picnic Diana', 'Galleta Sabor Vainilla 13g', 100, 20, 25, 5, '2020-08-12', '--', 'product.png', 0, 1, 0),
(298, 5, 15, 2, '2020-04-16', '748757009302', 'Galleta Picnic Diana', 'Sabor a Chocolate 13g', 100, 20, 25, 5, '2020-12-05', '--', 'product.png', 0, 1, 0),
(299, 5, 15, 2, '2020-04-16', '753079000791', 'Galleta Can Can', '6 galletas de vainilla y chocolate 37.5g', 100, 20, 25, 5, '2021-01-13', '--', 'product.png', 0, 1, 0),
(300, 5, 14, 2, '2020-04-16', '75020460', 'Chiclets Clorets', 'Freshmint Doble Clorofila 2 piezas', 100, 20, 25, 5, '2021-10-25', '--', 'product.png', 0, 1, 0),
(301, 5, 14, 2, '2020-04-16', '75025465', 'Max Air Dentyne', 'Ice Blue Goma de mascar', 100, 20, 25, 5, '2021-07-01', '--', 'product.png', 0, 1, 0),
(302, 5, 14, 2, '2020-04-16', '75025458', 'Max Air Dentyne', 'Spearmint goma de mascar', 100, 20, 25, 5, '2021-07-04', '--', 'product.png', 0, 1, 0),
(303, 5, 14, 2, '2020-04-16', '75019907', 'Clorets', 'Con Clorofila', 100, 20, 25, 5, '2021-04-28', '--', 'product.png', 0, 1, 0),
(304, 5, 14, 2, '2020-04-16', '75019877', 'Chiclets adams', 'Goma de mascar sabor a menta', 100, 20, 25, 5, '2021-01-04', '--', 'product.png', 0, 1, 0),
(305, 5, 14, 2, '2020-04-15', '75067687', 'Trident', 'Goma de mascar sin azucar', 100, 20, 25, 5, '2021-03-11', '--', 'product.png', 0, 1, 0),
(306, 5, 14, 2, '2020-04-15', '75045685', 'Tridents', 'Goma de mascar artificial a mora a azul', 100, 20, 25, 5, '2020-10-27', '--', 'product.png', 0, 1, 0),
(307, 5, 14, 2, '2020-04-15', '75045623', 'Trident', 'Goma de mascar sabor a Menta', 100, 20, 25, 5, '2020-11-28', '--', 'product.png', 0, 1, 0),
(308, 5, 14, 2, '2020-04-15', '4875700164', 'Menta', 'Caramelo masticable sabor a menta 29g', 100, 20, 25, 1, '2020-02-24', '--', 'product.png', 0, 0, 0),
(309, 5, 14, 2, '2020-04-16', '75051952', 'Bubbaloo', 'Sabor a menta', 100, 20, 25, 5, '2021-02-09', '--', 'product.png', 0, 1, 0),
(310, 5, 14, 2, '2020-05-01', '75051938', 'Bubbaloo', 'Sabor a fresa', 100, 20, 25, 5, '2021-03-16', '--', 'product.png', 0, 1, 0),
(311, 5, 15, 2, '2020-04-16', '086581012502', 'Club Extra', 'Galletas Pozuelo', 100, 20, 25, 5, '2020-06-13', '--', 'product.png', 0, 1, 0),
(312, 5, 14, 2, '2020-04-16', '7702007007947', 'Choco bolas', 'Bolitas de dulce sabor a chocolate', 100, 20, 25, 5, '2020-07-24', '--', 'product.png', 0, 1, 0),
(313, 5, 14, 2, '2020-04-16', 'tomyclasico', 'Tomy el clasico', 'Dulce sabor a chocolate', 100, 20, 25, 5, '2021-05-24', '--', 'product.png', 0, 1, 0),
(314, 5, 14, 2, '2020-04-16', 'Damy', 'Damy', 'Dulce crujiente', 100, 20, 25, 5, '2021-05-02', '--', 'product.png', 0, 1, 0),
(315, 5, 14, 2, '2020-04-16', 'coffespressolavian', 'Lavian Coffee Espresso', 'Delicioso Dulce de chocolate', 100, 20, 25, 5, '2021-05-02', '--', 'product.png', 0, 1, 0),
(316, 5, 14, 2, '2020-04-16', 'hallsextraflyp', 'Halls', 'Extra Fuerte Lyptus', 100, 20, 25, 5, '2021-02-03', '--', 'product.png', 0, 1, 0),
(317, 5, 14, 2, '2020-04-16', 'hallscreamy', 'Halls Creamy', 'Fresa cremosa', 100, 20, 25, 5, '2021-06-05', '--', 'product.png', 0, 1, 0),
(318, 5, 14, 2, '2020-04-16', 'Hallssandialyp', 'Halls Sandia  Lyptus', 'Caramelo sabor a sandia', 100, 20, 25, 5, '2021-02-08', '--', 'product.png', 0, 1, 0),
(319, 5, 14, 2, '2020-04-16', 'Hallsmentholyp', 'Halls Mentho Lyptus', 'Caramelo sabor a menta', 100, 20, 25, 5, '2021-02-08', '--', 'product.png', 0, 1, 0),
(320, 5, 14, 2, '2020-04-16', 'bonbonbunclear', 'Bon Bon Bun Clear', 'Clear', 100, 20, 25, 5, '2021-05-03', '--', 'product.png', 0, 1, 0),
(321, 5, 14, 2, '2020-04-16', 'bonbonbunmorazul', 'Bon Bon Bun Morazul Fresh', 'Chicle de menta', 100, 20, 25, 5, '2021-03-06', '--', 'product.png', 0, 1, 0),
(322, 5, 14, 2, '2020-04-15', 'bonbonbunwater', 'Bon Bon Bun Watermelon', 'Sabor a sandia', 100, 20, 25, 5, '2021-02-08', '--', 'product.png', 0, 1, 0),
(323, 5, 14, 2, '2020-04-16', 'bonbonbuncool', 'Bon Bon Bun Cool', 'Buble Gum', 100, 20, 25, 5, '2021-05-10', '--', 'product.png', 0, 1, 0),
(324, 5, 14, 2, '2020-04-16', 'bonbonbunx3', 'Bon Bon Bun  x3', 'Sabor a naranja', 100, 20, 25, 5, '2021-05-06', '--', 'product.png', 0, 1, 0),
(325, 5, 14, 2, '2020-04-16', '7406234005485', 'Bon Bon Bun', 'Sabor original a fresa', 100, 20, 25, 5, '2021-06-09', '--', 'product.png', 0, 1, 0),
(326, 5, 2, 2, '2020-04-15', '7506306233195', 'Sedal Co-Creations', 'Keratina con antioxidante Sampoo 2 en 1', 100, 20, 25, 5, '2021-06-10', '--', 'product.png', 0, 1, 0),
(327, 5, 2, 2, '2020-04-15', '7500435108324', 'Pantene Crema para peinar', 'Rizos definidos de 18ml', 100, 20, 25, 5, '2021-01-12', '--', 'product.png', 0, 1, 0),
(328, 5, 2, 2, '2020-05-07', '7506192505413', 'Ego Gel For Men', 'Máxima Fijación', 100, 20, 25, 5, '2021-05-25', '--', 'product.png', 0, 1, 0),
(329, 5, 2, 2, '2020-04-15', '7702006202664', 'Shampoo Savila', 'Shampoo y Acondicionador 2 en 1 Doble Contenido', 100, 20, 25, 5, '2021-08-18', '--', 'product.png', 0, 1, 0),
(330, 5, 2, 2, '2020-04-15', '27506295379106', 'Pantene de 10ml', 'Crema para peinar  liso extremo', 100, 20, 25, 5, '2020-03-18', '--', 'product.png', 0, 0, 0),
(331, 5, 2, 2, '2020-04-15', '7506295379102', 'Pantene 10 ml', 'Crema para peinar  liso extremo  pro-v', 100, 20, 25, 5, '2020-12-19', '--', 'product.png', 0, 1, 0);
INSERT INTO `producto` (`idproducto`, `idunidad`, `idcategoria`, `idsucursal`, `fechaingreso`, `codigo`, `producto`, `descripcion`, `cantidad`, `preciocosto`, `precioventa`, `cantidadmin`, `fechacaducidad`, `proveedor`, `imagen`, `idcambio`, `estado`, `estadoprint`) VALUES
(332, 5, 2, 2, '2020-04-15', '7509546079783', 'Paolmolive Optims', 'Control caspa limpieza purificante', 100, 20, 25, 5, '2021-05-20', '--', 'product.png', 0, 1, 0),
(333, 5, 2, 2, '2020-04-15', '7500435020268', 'Pantene Shampoo  cabello libre de sal', 'Fuerza y reconstruccion', 97, 20, 25, 5, '2021-08-19', '--', 'product.png', 0, 1, 0),
(334, 5, 2, 2, '2020-04-15', '7506295378556', 'Pantene prov', 'Shampoo  cabello libre de sal liso extremo Plateado', 100, 20, 25, 5, '2021-05-10', '--', 'product.png', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `nit`, `nombre`, `direccion`, `telefono`, `cuenta`, `estado`) VALUES
(1, '789456-5', 'Pedro Infante', 'Reu', '4546-5465', '7897-45646-4454', 0),
(2, '7634936-0', 'Carlos Pedro', 'REu', '41655164', '121321321', 1),
(3, '78945-555', 'Pedro Quiej', '5555', '5555-5555', '55555', 1),
(4, '7897456-55', 'Karla Funes', 'REU', '5555-5555', '555-55', 1),
(5, '7879-555', 'Quintana Roud', '5asfsd', '4555-5555', '5555-555', 1),
(6, '23344556', 'Kevin Marcos', 'REu', '0809-8098', '456-4656', 1),
(7, '223344', 'Pedro', 'reu', '3333-3333', '', 1),
(8, '445566', '445566', 'Cuan', '2222-2222', '', 1),
(9, '1213788-8', 'Calors Pedro', 'Reu', '5454-5454', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `idsalida` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`idsalida`, `idsucursal`, `idusuario`, `fecha`, `descripcion`, `total`, `estado`) VALUES
(8, 2, 8, '2020-09-01', 'dfasdfsf', 20, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL,
  `sucursal` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idsucursal`, `sucursal`, `estado`) VALUES
(1, 'Todas las Sucursales', 2),
(2, 'Predeterminada', 1),
(3, 'Nuevo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `idtipopago` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`idtipopago`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Efectivo', 'Moneda Nacional ( Q )', 2),
(2, 'Tarjeta de Credito', 'Tarjeta 789456', 0),
(3, 'Tarjeta Visa', '7894-555', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_venta`
--

CREATE TABLE `tipo_venta` (
  `idtipoventa` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_venta`
--

INSERT INTO `tipo_venta` (`idtipoventa`, `descripcion`, `estado`) VALUES
(1, 'Contado', 1),
(2, 'Crédito', 1),
(3, 'Consignación', 1),
(4, 'Devoluciones', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idtraslado` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idsucursalenvio` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL,
  `correlativo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `estadocheck` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `idunidad` int(11) NOT NULL,
  `unidad` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`idunidad`, `unidad`, `estado`) VALUES
(1, 'Paquete', 1),
(2, 'Lata', 1),
(3, 'Litro', 1),
(4, 'Desechable', 0),
(5, 'Unidad', 1),
(6, 'Botella', 1),
(7, 'Envase', 1),
(8, 'Par', 1),
(9, 'Bolsa', 1),
(10, 'Libra', 1),
(11, 'Barra', 1),
(12, 'Caja', 1),
(13, 'Sobre', 1),
(14, 'Fardo', 1),
(15, 'Pastillas', 1),
(16, 'Claro', 2),
(17, 'Tigo', 2),
(18, 'Movistar', 2),
(19, 'Desechable', 1),
(20, 'todos estos', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idestadodet` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `idsucursal`, `idestadodet`, `estado`) VALUES
(1, 'Admin', 'Reu', '0000-0000', 'admin123@hotmail.com', '1', 'admin', '12345', '1543363254.jpg', 2, 345, 1),
(2, 'soporte', 'reu', '41544455', 'dawesystems@gmail.com', '1', 'soporte', 'soporte123', '1524424677.png', 1, 345, 1),
(8, 'Usuario', 'Reu', '4546-5465', 'usuario@hotmail.com', '1', 'usuario', '1234', '1543363254.jpg', 2, 345, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(9, 2, 1),
(10, 2, 2),
(11, 2, 3),
(12, 2, 4),
(13, 2, 5),
(14, 2, 6),
(15, 2, 7),
(16, 2, 8),
(32, 2, 9),
(159, 1, 1),
(160, 1, 2),
(161, 1, 3),
(162, 1, 4),
(163, 1, 5),
(164, 1, 6),
(165, 1, 7),
(166, 1, 8),
(167, 1, 10),
(168, 8, 1),
(169, 8, 2),
(170, 8, 3),
(171, 8, 4),
(172, 8, 5),
(173, 8, 6),
(174, 8, 7),
(175, 8, 8),
(176, 8, 10),
(177, 1, 9),
(178, 1, 13),
(179, 1, 12),
(180, 1, 11),
(181, 1, 14);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apertura`
--
ALTER TABLE `apertura`
  ADD PRIMARY KEY (`idapertura`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`idcaja`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `tablacorte` (`tablacorte`);

--
-- Indices de la tabla `cambio`
--
ALTER TABLE `cambio`
  ADD PRIMARY KEY (`idcambio`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idclientes`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompras`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `cuentaxcobrar`
--
ALTER TABLE `cuentaxcobrar`
  ADD PRIMARY KEY (`idcuentacobrar`),
  ADD KEY `idpago` (`idpago`);

--
-- Indices de la tabla `cuentaxpagar`
--
ALTER TABLE `cuentaxpagar`
  ADD PRIMARY KEY (`idcuentapagar`),
  ADD KEY `idcompra` (`idcompra`);

--
-- Indices de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  ADD PRIMARY KEY (`iddenominacion`);

--
-- Indices de la tabla `detalle_apertura`
--
ALTER TABLE `detalle_apertura`
  ADD PRIMARY KEY (`iddetalleapertura`),
  ADD KEY `idapertura` (`idapertura`),
  ADD KEY `iddenominacion` (`iddenominacion`);

--
-- Indices de la tabla `detalle_caja`
--
ALTER TABLE `detalle_caja`
  ADD PRIMARY KEY (`iddetallecaja`),
  ADD KEY `idcaja` (`idcaja`),
  ADD KEY `tabla` (`tabla`);

--
-- Indices de la tabla `detalle_cambio`
--
ALTER TABLE `detalle_cambio`
  ADD PRIMARY KEY (`iddetallecambio`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idcambio` (`idcambio`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`iddetalle_compra`),
  ADD KEY `idcompras` (`idcompras`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD PRIMARY KEY (`iddetalle_pago`),
  ADD KEY `idpago` (`idpago`),
  ADD KEY `idtipopago` (`idtipopago`);

--
-- Indices de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD PRIMARY KEY (`iddetallesalida`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idsalida` (`idsalida`);

--
-- Indices de la tabla `detalle_traslado`
--
ALTER TABLE `detalle_traslado`
  ADD PRIMARY KEY (`iddetalletraslado`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idtraslado` (`idtraslado`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `idpago` (`idpago`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `estadocorte`
--
ALTER TABLE `estadocorte`
  ADD PRIMARY KEY (`idestadocorte`);

--
-- Indices de la tabla `eventocorte`
--
ALTER TABLE `eventocorte`
  ADD PRIMARY KEY (`ideventocorte`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`idgasto`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idtipoventa` (`idtipoventa`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idunidad` (`idunidad`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`idsalida`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idsucursal`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- Indices de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  ADD PRIMARY KEY (`idtipoventa`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idtraslado`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`idunidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idsucursal` (`idsucursal`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idpermiso` (`idpermiso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apertura`
--
ALTER TABLE `apertura`
  MODIFY `idapertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `idcaja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cambio`
--
ALTER TABLE `cambio`
  MODIFY `idcambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idclientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `cuentaxcobrar`
--
ALTER TABLE `cuentaxcobrar`
  MODIFY `idcuentacobrar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuentaxpagar`
--
ALTER TABLE `cuentaxpagar`
  MODIFY `idcuentapagar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  MODIFY `iddenominacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_apertura`
--
ALTER TABLE `detalle_apertura`
  MODIFY `iddetalleapertura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_caja`
--
ALTER TABLE `detalle_caja`
  MODIFY `iddetallecaja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `detalle_cambio`
--
ALTER TABLE `detalle_cambio`
  MODIFY `iddetallecambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `iddetalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  MODIFY `iddetalle_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  MODIFY `iddetallesalida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detalle_traslado`
--
ALTER TABLE `detalle_traslado`
  MODIFY `iddetalletraslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT de la tabla `estadocorte`
--
ALTER TABLE `estadocorte`
  MODIFY `idestadocorte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `eventocorte`
--
ALTER TABLE `eventocorte`
  MODIFY `ideventocorte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `idgasto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `idsalida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idsucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `idtipopago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_venta`
--
ALTER TABLE `tipo_venta`
  MODIFY `idtipoventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idtraslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `idunidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apertura`
--
ALTER TABLE `apertura`
  ADD CONSTRAINT `apertura_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `caja_ibfk_2` FOREIGN KEY (`tablacorte`) REFERENCES `estadocorte` (`idestadocorte`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`);

--
-- Filtros para la tabla `cuentaxcobrar`
--
ALTER TABLE `cuentaxcobrar`
  ADD CONSTRAINT `cuentaxcobrar_ibfk_1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`);

--
-- Filtros para la tabla `cuentaxpagar`
--
ALTER TABLE `cuentaxpagar`
  ADD CONSTRAINT `cuentaxpagar_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`idcompras`);

--
-- Filtros para la tabla `detalle_apertura`
--
ALTER TABLE `detalle_apertura`
  ADD CONSTRAINT `detalle_apertura_ibfk_1` FOREIGN KEY (`iddenominacion`) REFERENCES `denominacion` (`iddenominacion`),
  ADD CONSTRAINT `detalle_apertura_ibfk_2` FOREIGN KEY (`idapertura`) REFERENCES `apertura` (`idapertura`);

--
-- Filtros para la tabla `detalle_caja`
--
ALTER TABLE `detalle_caja`
  ADD CONSTRAINT `detalle_caja_ibfk_1` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`idcaja`),
  ADD CONSTRAINT `detalle_caja_ibfk_2` FOREIGN KEY (`tabla`) REFERENCES `eventocorte` (`ideventocorte`);

--
-- Filtros para la tabla `detalle_cambio`
--
ALTER TABLE `detalle_cambio`
  ADD CONSTRAINT `detalle_cambio_ibfk_1` FOREIGN KEY (`idcambio`) REFERENCES `cambio` (`idcambio`),
  ADD CONSTRAINT `detalle_cambio_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`idcompras`) REFERENCES `compras` (`idcompras`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD CONSTRAINT `detalle_pago_ibfk_1` FOREIGN KEY (`idtipopago`) REFERENCES `tipo_pago` (`idtipopago`),
  ADD CONSTRAINT `detalle_pago_ibfk_2` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`);

--
-- Filtros para la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD CONSTRAINT `detalle_salida_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  ADD CONSTRAINT `detalle_salida_ibfk_3` FOREIGN KEY (`idsalida`) REFERENCES `salida` (`idsalida`);

--
-- Filtros para la tabla `detalle_traslado`
--
ALTER TABLE `detalle_traslado`
  ADD CONSTRAINT `detalle_traslado_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  ADD CONSTRAINT `detalle_traslado_ibfk_2` FOREIGN KEY (`idtraslado`) REFERENCES `traslado` (`idtraslado`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idclientes`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`idtipoventa`) REFERENCES `tipo_venta` (`idtipoventa`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idunidad`) REFERENCES `unidad` (`idunidad`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `usuario_permiso_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `usuario_permiso_ibfk_2` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
