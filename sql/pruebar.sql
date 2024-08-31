-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2024 a las 20:17:08
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id` int(11) NOT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_adicion` datetime DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `tiempo_vida_restante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id`, `articulo_id`, `nombre`, `fecha_adicion`, `stock`, `stock_minimo`, `tiempo_vida_restante`) VALUES
(31, 45, 'Betabel', '2023-05-31 05:21:43', 18, 5, 15),
(32, 46, 'Naranjas', '2023-06-05 19:54:19', 20, 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `tiempo_vida` int(11) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `descripcion`, `stock`, `stock_minimo`, `unidad_medida`, `precio_unitario`, `tiempo_vida`, `fecha_caducidad`, `total`) VALUES
(28, 'tomate', 'tomates para preparaciones como ensaladas y salsas', 20, 5, 'KIlogramo', '5.00', 10, '2023-06-09', '100.00'),
(29, 'lechuga', 'lechuga para preparaciones como ensaladas', 5, 1, 'KIlogramo', '30.00', 20, '2023-06-19', '150.00'),
(30, 'manzanas', 'manzanas para preparaciones tales como postres y ensaladas', 20, 5, 'KIlogramo', '9.00', 20, '2023-06-20', '180.00'),
(31, 'mango', 'mango ideal para postres y ensaladas', 15, 5, 'KIlogramo', '8.00', 14, '2023-06-13', '120.00'),
(45, 'Betabel', 'Betabel, ideal para preparaciones como reducciones o ensaladas', 18, 5, 'Kilogramo', '10.00', 15, '2023-06-30', '180.00'),
(46, 'Naranjas', 'Naranjas utilizadas para diferentes preparaciones', 20, 5, 'Kilogramo', '5.00', 10, '2023-06-22', '100.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajach`
--

CREATE TABLE `cajach` (
  `cod_dia` int(11) NOT NULL,
  `montoi` varchar(11) NOT NULL,
  `fecha` date NOT NULL,
  `totale` varchar(11) NOT NULL,
  `totals` varchar(11) NOT NULL,
  `gtotal` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajaop`
--

CREATE TABLE `cajaop` (
  `cod_operacion` int(11) NOT NULL,
  `tipodeoperacion` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `tipocomprobante` varchar(150) NOT NULL,
  `importeentrada` varchar(30) NOT NULL,
  `importesalida` varchar(30) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `errores`
--

CREATE TABLE `errores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `errores`
--

INSERT INTO `errores` (`id`, `nombre`, `preciou`, `fyh`) VALUES
(3, 'Chilaquiles', '', '2024-01-15 11:28:06'),
(4, 'Desayuno de la casa', '', '2024-01-15 12:26:44'),
(12, 'Desayuno de la casa', '', '2024-01-15 12:47:21'),
(14, 'Menor Cena Fin de Año', '', '2024-01-15 12:49:33'),
(25, 'Desayuno de la casa', '', '2024-01-24 16:37:13'),
(26, 'Desayuno de la casa', '', '2024-01-24 16:37:13'),
(27, 'Huevos con chorizo', '', '2024-01-24 16:37:22'),
(28, 'Desayuno de la casa', '', '2024-01-24 16:38:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_alimentos`
--

CREATE TABLE `inventario_alimentos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Costo` decimal(10,2) NOT NULL,
  `Unidad` varchar(50) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `Costo_por_unidad` decimal(12,6) GENERATED ALWAYS AS (`Costo` / `Cantidad`) STORED,
  `Categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario_alimentos`
--

INSERT INTO `inventario_alimentos` (`ID`, `Nombre`, `Costo`, `Unidad`, `Cantidad`, `Categoria`) VALUES
(4, 'HONGOS', '120.00', 'unidades', '10.00', 'Frutas y Verduras'),
(5, 'CEBOLLA', '20.00', 'gramos', '950.00', 'Frutas y Verduras'),
(6, 'EPAZOTE', '5.00', 'gramos', '100.00', 'Frutas y Verduras'),
(7, 'AJO', '20.00', 'gramos', '200.00', 'Frutas y Verduras'),
(8, 'CEBOLLA MORADA', '15.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(9, 'LECHUGA ROMANA', '5.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(10, 'ARUGULA', '45.00', 'gramos', '400.00', 'Frutas y Verduras'),
(11, 'LECHUGA ITALIANA', '5.00', 'gramos', '400.00', 'Frutas y Verduras'),
(12, 'CALABAZA', '15.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(13, 'CILANTRO', '5.00', 'gramos', '150.00', 'Frutas y Verduras'),
(14, 'FLOR DE CALABAZA', '10.00', 'gramos', '150.00', 'Frutas y Verduras'),
(15, 'TOMATE', '20.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(16, 'JITOMATE', '20.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(17, 'MENTA', '5.00', 'gramos', '30.00', 'Frutas y Verduras'),
(18, 'HIERBABUENA', '1.00', 'unidades', '200.00', 'Frutas y Verduras'),
(19, 'ROMERO', '1.00', 'unidades', '200.00', 'Frutas y Verduras'),
(20, 'ALBAHACA', '1.00', 'unidades', '200.00', 'Frutas y Verduras'),
(21, 'PEREJIL', '5.00', 'gramos', '100.00', 'Frutas y Verduras'),
(22, 'ESPINACAS', '5.00', 'gramos', '100.00', 'Frutas y Verduras'),
(23, 'AGUACATE', '25.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(24, 'KALE', '35.00', 'gramos', '200.00', 'Frutas y Verduras'),
(25, 'RABANO', '20.00', 'unidades', '200.00', 'Frutas y Verduras'),
(26, 'NOPALES', '28.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(27, 'CHILE SERRANO', '18.00', 'gramos', '250.00', 'Frutas y Verduras'),
(28, 'ZANAHORIA', '11.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(29, 'ZANAHORIA BABY', '16.00', 'gramos', '150.00', 'Frutas y Verduras'),
(30, 'ELOTE', '2.00', 'unidades', '200.00', 'Frutas y Verduras'),
(31, 'BROCOLI', '1.00', 'unidades', '200.00', 'Frutas y Verduras'),
(32, 'CHILE POBLANO', '10.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(33, 'ELOTE GRANO', '15.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(34, 'CHAMPIÑONES', '75.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(35, 'SETAS', '70.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(36, 'LIMON', '20.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(37, 'NARANJA', '5.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(38, 'PAPAYA', '15.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(39, 'SANDIA', '12.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(40, 'MELON', '30.00', 'gramos', '1500.00', 'Frutas y Verduras'),
(41, 'PLATANO', '15.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(42, 'HIGO', '150.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(43, 'MANGO', '10.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(44, 'PIÑA', '18.00', 'gramos', '900.00', 'Frutas y Verduras'),
(45, 'FRESA', '60.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(46, 'ZARZAMORA', '60.00', 'gramos', '300.00', 'Frutas y Verduras'),
(47, 'FRAMBUESA', '30.00', 'gramos', '170.00', 'Frutas y Verduras'),
(48, 'KIWI', '85.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(49, 'PAPA ALFA', '15.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(50, 'PAPA NORMAL', '18.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(51, 'MIX HOJAS VERDES', '26.90', 'gramos', '200.00', 'Frutas y Verduras'),
(52, 'PORTOBELLO', '70.00', 'gramos', '5.00', 'Frutas y Verduras'),
(53, 'HABANERO', '40.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(54, 'CEBOLLA CAMBRAY', '18.00', 'gramos', '100.00', 'Frutas y Verduras'),
(55, 'GERMEN', '15.00', 'gramos', '200.00', 'Frutas y Verduras'),
(56, 'ELOTE', '30.00', 'gramos', '200.00', 'Frutas y Verduras'),
(57, 'BETABEL', '20.00', 'gramos', '1000.00', 'Frutas y Verduras'),
(58, 'TOMATE CHERRY', '30.00', 'gramos', '2000.00', 'Frutas y Verduras'),
(59, 'GUAJILLO', '120.00', 'gramos', '1000.00', 'Chiles Secos'),
(60, 'CHILE DE ARBOL', '30.00', 'gramos', '1000.00', 'Chiles Secos'),
(61, 'PIMIENTA', '47.00', 'gramos', '64.00', 'Especias'),
(62, 'SAL', '12.50', 'gramos', '1000.00', 'Especias'),
(63, 'AZUCAR', '31.00', 'gramos', '1000.00', 'Especias'),
(64, 'OREGANO', '115.00', 'gramos', '1000.00', 'Especias'),
(65, 'PAPRIKA', '29.10', 'gramos', '55.00', 'Especias'),
(66, 'CEBOLLA EN POLVO', '27.40', 'gramos', '65.00', 'Especias'),
(67, 'CAJUN', '180.00', 'gramos', '690.00', 'Especias'),
(68, 'CANELA', '30.00', 'gramos', '50.00', 'Especias'),
(69, 'MAIZENA', '35.00', 'gramos', '750.00', 'Abarrotes'),
(70, 'HARINA DE TRIGO', '24.00', 'gramos', '1000.00', 'Cereales'),
(71, 'CHIPOTLE EN LATA', '10.00', 'gramos', '105.00', 'Abarrotes'),
(72, 'ACEITE DE OLIVA', '70.00', 'mililitros', '750.00', 'Abarrotes'),
(73, 'ACEITE VEGETAL', '110.00', 'mililitros', '3500.00', 'Líquidos'),
(74, 'VINAGRE DE MANZANA', '22.50', 'mililitros', '500.00', 'Abarrotes'),
(75, 'PALILLO ALTO', '12.00', 'piezas', '25.00', 'Abarrotes'),
(76, 'ACEITUNA SIN HUESO', '17.50', 'unidades', '20.00', 'Abarrotes'),
(77, 'AXIOTE', '11.90', 'gramos', '100.00', 'Holeajinosas'),
(78, 'FETTUCCINI', '10.00', 'gramos', '200.00', 'Abarrotes'),
(79, 'HUEVO', '34.00', 'unidades', '16.00', 'Otros'),
(80, 'MAYONESA', '20.00', 'gramos', '180.00', 'Abarrotes'),
(81, 'VINAGRE BALSAMICO', '47.50', 'mililitros', '500.00', 'Abarrotes'),
(82, 'VINO DE CAJA', '70.00', 'mililitros', '1000.00', 'Abarrotes'),
(83, 'PILONCILLO', '50.00', 'gramos', '1000.00', 'Abarrotes'),
(84, 'PAN BOLLO', '5.50', 'unidades', '200.00', 'Panadería'),
(85, 'PAN HOTDOG', '5.50', 'unidades', '200.00', 'Panadería'),
(86, 'PAN DULCE', '5.00', 'unidades', '200.00', 'Panadería'),
(87, 'PAN DE SAL', '5.50', 'unidades', '200.00', 'Panadería'),
(88, 'QUESO FRESCO', '30.00', 'gramos', '500.00', 'Lácteos y Derivados'),
(89, 'QUESILLO', '80.00', 'gramos', '1000.00', 'Lácteos y Derivados'),
(90, 'LECHE CONDENSADA', '21.50', 'gramos', '387.00', 'Lácteos y Derivados'),
(91, 'MANTEQUILLA ARTESANAL', '116.00', 'gramos', '1000.00', 'Lácteos y Derivados'),
(92, 'LECHE ENTERA', '11.00', 'gramos', '1000.00', 'Lácteos y Derivados'),
(93, 'QUESO AÑEJO', '80.00', 'gramos', '1000.00', 'Lácteos y Derivados'),
(94, 'QUESO CREMA', '21.00', 'gramos', '190.00', 'Lácteos y Derivados'),
(95, 'QUESO DE CABRA', '79.00', 'gramos', '200.00', 'Lácteos y Derivados'),
(96, 'CREMA LYNCOTT', '46.00', 'gramos', '500.00', 'Lácteos y Derivados'),
(97, 'MIEL DE ABEJA', '90.00', 'gramos', '1000.00', 'Líquidos'),
(98, 'ALMENDRAS', '204.00', 'gramos', '1000.00', 'Holeajinosas'),
(99, 'CACAHUATE SALADO', '55.00', 'gramos', '1000.00', 'Holeajinosas'),
(100, 'ARANDANO DESHIDRATADO', '30.00', 'gramos', '250.00', 'Holeajinosas'),
(101, 'CACAHUATE GARAPIÑADO', '30.00', 'gramos', '500.00', 'Holeajinosas'),
(102, 'CECINA', '240.00', 'gramos', '1000.00', 'Carnes Rojas'),
(103, 'PECHUGA POLLO', '150.00', 'gramos', '1000.00', 'Carnes Rojas'),
(104, 'HUACHINANGO', '360.00', 'gramos', '800.00', 'Pescados y Mariscos'),
(105, 'CAZON', '160.00', 'gramos', '1000.00', 'Pescados y Mariscos'),
(106, 'CAMARON ROSA', '240.00', 'gramos', '600.00', 'Pescados y Mariscos'),
(107, 'MOJARRA', '90.00', 'gramos', '1000.00', 'Pescados y Mariscos'),
(108, 'OSTION', '120.00', 'gramos', '50.00', 'Pescados y Mariscos'),
(109, 'FRIJOL BALLO NEGRO', '45.50', 'gramos', '1000.00', 'Leguminosas y Legumbres'),
(110, 'GARBANZO', '1.00', 'unidad', '200.00', 'Leguminosas y Legumbres'),
(111, 'LENTEJA', '1.00', 'unidad', '200.00', 'Leguminosas y Legumbres'),
(112, 'HABAS', '1.00', 'unidad', '200.00', 'Leguminosas y Legumbres'),
(113, 'HARINA DE TRIGO', '28.00', 'gramos', '1000.00', 'Cereales'),
(114, 'AVENA', '1.00', 'unidad', '1.00', 'Cereales'),
(115, 'AJONJOLI', '1.00', 'unidad', '1.00', 'Cereales'),
(116, 'POLVO PARA HORNEAR', '25.00', 'gramos', '250.00', 'Otros'),
(117, 'TORTILLA AZUL', '18.00', 'unidad', '17.00', 'Otros'),
(118, 'TORTILLA BLANCA', '15.00', 'unidad', '30.00', 'Otros'),
(119, 'HUEVO', '32.00', 'gramos', '1000.00', 'Otros'),
(120, 'AGUA PURIFICADA', '1.50', 'mililitros', '1000.00', 'Líquidos'),
(121, 'CHOCOLATE OAXAQUEÑO', '250.00', 'gramos', '3000.00', 'Otros'),
(122, 'ESCAMOLES', '800.00', 'gramos', '1000.00', 'Insectos'),
(123, 'GUSANOS MAGUEY', '1080.00', 'gramos', '1000.00', 'Insectos'),
(124, 'CHICATANAS', '1120.00', 'gramos', '1000.00', 'Insectos'),
(125, 'JAMON', '59.00', 'piezas', '6.00', 'Vegano'),
(126, 'ALBONDIGA VEGETAL', '59.00', 'piezas', '8.00', 'Vegano'),
(127, 'SALCHICHA VEGETAL', '62.00', 'piezas', '8.00', 'Vegano'),
(128, 'HAMBURGUESA VEGETAL', '59.00', 'piezas', '6.00', 'Vegano'),
(129, 'HAMBURGUESA BETABEL', '79.00', 'piezas', '5.00', 'Vegano'),
(130, 'MILASETAS', '79.00', 'piezas', '5.00', 'Vegano'),
(131, 'CARNE AL PASTOR', '1.00', 'gramos', '1.00', 'Vegano'),
(132, 'CHORIZO VEGETAL', '59.00', 'piezas', '12.00', 'Vegano'),
(133, 'QUESO VEGANO MANCHEGO', '129.00', 'gramos', '400.00', 'Vegano'),
(134, 'FRIJOLES REFRITOS', '37.82', 'gramos', '1500.00', 'Subrecetas'),
(135, 'COSTRA DE FRIJOL', '78.50', 'gramos', '800.00', 'Subrecetas'),
(136, 'MANTEQUILLA AL EPAZOTE', '28.00', 'gramos', '300.00', 'Subrecetas'),
(137, 'REDUCCION DE VINO', '81.30', 'mililitros', '500.00', 'Subrecetas'),
(138, 'CREMA DE ALMENDRAS', '68.34', 'gramos', '1200.00', 'Subrecetas'),
(139, 'ADEREZO DE CHIPOTLE', '8.20', 'mililitros', '100.00', 'Subrecetas'),
(140, 'GUACAMOLE', '35.56', 'gramos', '1300.00', 'Subrecetas'),
(141, 'TOTOPOS', '515.71', 'gramos', '1000.00', 'Subrecetas'),
(142, 'CREMA DE ALMENDRAS CON ESPINACAS', '123.37', 'gramos', '600.00', 'Subrecetas'),
(143, 'XNIPEC', '13.73', 'gramos', '500.00', 'Subrecetas'),
(144, 'PAPAS GAJO', '9.86', 'gramos', '350.00', 'Subrecetas'),
(145, 'SALSA AL PASTOR', '28.72', 'mililitros', '500.00', 'Subrecetas'),
(146, 'SALSA POBLANA', '21.79', 'mililitros', '500.00', 'Subrecetas'),
(147, 'HELADO ARTESANAL FRESA', '20.55', 'gramos', '500.00', 'Subrecetas'),
(148, 'HELADO CHOCOLATE CON MEZCAL', '108.46', 'gramos', '900.00', 'Subrecetas'),
(149, 'SALSA ZARANDEADA', '14.47', 'mililitros', '200.00', 'Subrecetas'),
(156, 'MANZANA RED', '1.00', 'unidad', '1.00', 'Frutas y Verduras'),
(157, 'MANZANA GOLDEN', '1.00', 'unidad', '1.00', 'Frutas y Verduras'),
(158, 'CARAMBOLO', '1.00', 'unidad', '1.00', 'Frutas y Verduras'),
(159, 'UVA ROJA', '1.00', 'unidad', '1.00', 'Frutas y Verduras'),
(160, 'UVA VERDE', '1.00', 'unidad', '1.00', 'Frutas y Verduras'),
(161, 'PERA', '1.00', 'unidad', '1.00', 'Frutas y Verduras'),
(162, 'PASILLA', '1.00', 'unidad', '1.00', 'Chiles Secos'),
(163, 'AZUCAR MASCABADA', '1.00', 'unidad', '1.00', 'Especias'),
(164, 'CLAVO', '1.00', 'unidad', '1.00', 'Especias'),
(165, 'TOMILLO', '1.00', 'unidad', '1.00', 'Especias'),
(166, 'LECHE EVAPORADA', '1.00', 'unidad', '1.00', 'Lácteos y Derivados'),
(167, 'ACEITE VEGETAL', '1.00', 'unidad', '1.00', 'Líquidos'),
(168, 'ACEITE OLIVA', '1.00', 'unidad', '1.00', 'Líquidos'),
(169, 'VINAGRE BLANCO', '1.00', 'unidad', '1.00', 'Líquidos'),
(170, 'VINAGRE MANZANA', '1.00', 'unidad', '1.00', 'Líquidos'),
(171, 'AVELLANA', '1.00', 'unidad', '1.00', 'Holeajinosas'),
(172, 'AXIOTE', '1.00', 'unidad', '1.00', 'Holeajinosas'),
(173, 'PIPITA DE CALABAZA', '1.00', 'unidad', '1.00', 'Holeajinosas'),
(174, 'PULPO', '1.00', 'unidad', '1.00', 'Pescados y Mariscos'),
(175, 'GARBANZO', '1.00', 'unidad', '200.00', 'Leguminosas y Legumbres'),
(176, 'LENTEJA', '1.00', 'unidad', '200.00', 'Leguminosas y Legumbres'),
(177, 'HABAS', '1.00', 'unidad', '200.00', 'Leguminosas y Legumbres'),
(178, 'GRENETINA', '1.00', 'unidad', '1.00', 'Otros'),
(179, 'MEZCAL OAXAQUEÑO', '350.00', 'gramos', '1000.00', 'Líquidos'),
(180, 'NUEZ', '1.00', 'gramos', '1.00', 'Holeajinosas'),
(181, 'CAFE POBLANO', '1.00', 'gramos', '1.00', 'Holeajinosas'),
(182, 'CAFE VERACRUZANO', '1.00', 'gramos', '1.00', 'Holeajinosas'),
(183, 'HOJA DE PLATANO', '1.00', 'gramos', '1.00', 'Otros'),
(184, 'Alimento de ejemplo 1', '2.00', 'unidades', '666.00', ''),
(185, 'Alimento de ejemplo 2', '3.00', 'unidades', '666.00', 'Frutas y Verduras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_bebidas`
--

CREATE TABLE `inventario_bebidas` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Piezas_existentes` int(11) NOT NULL,
  `Costo` decimal(10,2) NOT NULL,
  `Costo_por_unidad` decimal(10,2) GENERATED ALWAYS AS (`Costo` / `Piezas_existentes`) STORED,
  `Costo_por_copeo` decimal(10,2) DEFAULT NULL,
  `Stock_minimo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario_bebidas`
--

INSERT INTO `inventario_bebidas` (`ID`, `Nombre`, `Piezas_existentes`, `Costo`, `Costo_por_copeo`, `Stock_minimo`) VALUES
(1, 'agua de la llave', 7, '500.00', NULL, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mermas`
--

CREATE TABLE `mermas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mermas`
--

INSERT INTO `mermas` (`id`, `nombre`, `preciou`, `fyh`) VALUES
(2, 'Chilaquiles', '', '2024-01-15 11:18:18'),
(5, 'Desayuno de la casa', '', '2024-01-15 12:27:05'),
(9, 'Chilaquiles', '', '2024-01-15 12:36:33'),
(11, 'Chilaquiles', '', '2024-01-15 12:39:42'),
(13, 'Enfrijoladas', '', '2024-01-15 12:48:48'),
(23, 'Desayuno de la casa', '', '2024-01-15 13:55:35'),
(24, 'Quesadillas', '', '2024-01-15 13:55:55'),
(29, 'Tacos al pastor veggie', '', '2024-01-27 13:00:46'),
(30, 'papas gajo', '', '2024-01-27 14:39:32'),
(31, 'Carpaccio de Betabel', '', '2024-01-27 14:43:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mermas_ing`
--

CREATE TABLE `mermas_ing` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Ingredientes` text NOT NULL,
  `Cantidades` text NOT NULL,
  `Costo` decimal(12,6) NOT NULL,
  `FechaHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mermas_ing`
--

INSERT INTO `mermas_ing` (`ID`, `Nombre`, `Ingredientes`, `Cantidades`, `Costo`, `FechaHora`) VALUES
(1, 'Carpaccio de Betabel', '{\"BETABEL\", \"GERMEN\", \"TOMATE CHERRY\", \"REDUCCION DE VINO\", \"QUESO DE CABRA\", \"CACAHUATE GARAPIÑADO\", \"MANGO\"}', '{\"BETABEL\": 90, \"GERMEN\": 30, \"TOMATE CHERRY\": 15, \"REDUCCION DE VINO\": 25, \"QUESO DE CABRA\": 25, \"CACAHUATE GARAPIÑADO\": 15, \"MANGO\": 60}', '19.715000', '2024-01-27 14:43:20'),
(2, 'papas gajo', '{\"PAPA ALFA\", \"SAL\", \"PIMIENTA\", \"PAPRIKA\", \"ADEREZO DE CHIPOTLE\", \"CEBOLLA EN POLVO\"}', '{\"PAPA ALFA\": 350, \"SAL\": 2, \"PIMIENTA\": 2, \"PAPRIKA\": 2, \"ADEREZO DE CHIPOTLE\": 20, \"CEBOLLA EN POLVO\": 1}', '9.814000', '2024-01-27 14:39:32'),
(3, 'Tacos al pastor veggie', '{\"CARNE AL PASTOR\", \"CILANTRO\", \"CEBOLLA\", \"PIÑA\", \"LIMON\", \"TORTILLA BLANCA\"}', '{\"CARNE AL PASTOR\": 150, \"CILANTRO\": 50, \"CEBOLLA\": 50, \"PIÑA\": 45, \"LIMON\": 40, \"TORTILLA BLANCA\": 3}', '26.360000', '2024-01-27 13:00:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `habitacion` varchar(50) NOT NULL,
  `comensal` varchar(30) NOT NULL,
  `comentario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `nombre`, `capacidad`, `estado`, `tipo`, `habitacion`, `comensal`, `comentario`) VALUES
(1, 'Mesa 1', 4, 'Disponible', '', '', '', ''),
(2, 'Mesa 2', 2, 'Disponible', '', '', '', ''),
(3, 'Mesa 3', 6, 'Disponible', '', '', '', ''),
(4, 'Mesa 4', 2, 'Ocupada', 'Comensal Foráneo', '', '', ''),
(5, 'Mesa 5', 2, 'Disponible', '', '', '', ''),
(6, 'Mesa 6', 3, 'Disponible', '', '', '', ''),
(7, 'Mesa 7', 7, 'Disponible', '', '', '', ''),
(8, 'Mesa 8', 2, 'Disponible', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_currentes`
--

CREATE TABLE `ordenes_currentes` (
  `id` int(11) NOT NULL,
  `mesa` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes_currentes`
--

INSERT INTO `ordenes_currentes` (`id`, `mesa`, `nombre`, `cantidad`, `preciou`, `fyh`) VALUES
(1, 'Mesa 7', 'Chilaquiles', '', '', '2024-02-01 14:58:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_de_compra`
--

CREATE TABLE `ordenes_de_compra` (
  `id` int(11) NOT NULL,
  `informacion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`informacion`)),
  `modalidad` varchar(50) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `validacion` varchar(20) NOT NULL DEFAULT 'No Validado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes_de_compra`
--

INSERT INTO `ordenes_de_compra` (`id`, `informacion`, `modalidad`, `fecha_hora`, `validacion`) VALUES
(1, '{\"Nombre\":\"EJEMPLO\",\"Cantidad\":5}', 'Automática', '2024-01-30 21:47:32', 'No Validado'),
(2, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":10}]', 'Automática', '2024-01-30 21:47:40', 'Validado'),
(3, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":\"666\"}]', 'Manual', '2024-01-30 21:49:01', 'Validado'),
(4, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":10}]', 'Automática', '2024-01-30 21:56:32', 'No Validado'),
(5, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 1\",\"Cantidad\":10},{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":10}]', 'Automática', '2024-01-30 21:58:15', 'No Validado'),
(6, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 1\",\"Cantidad\":10},{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":10}]', 'Automática', '2024-01-30 21:59:47', 'No Validado'),
(7, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 1\",\"Cantidad\":10},{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":10}]', 'Automática', '2024-01-30 22:00:49', 'No Validado'),
(8, '[{\"Nombre\":\"ALIMENTO DE EJEMPLO 1\",\"Cantidad\":\"666.00\"},{\"Nombre\":\"ALIMENTO DE EJEMPLO 2\",\"Cantidad\":\"666.00\"}]', 'Manual', '2024-01-30 22:02:02', 'Validado'),
(9, '[{\"Nombre\":\"HONGOS\",\"Cantidad\":10}]', 'Automática', '2024-02-14 19:51:13', 'Validado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_finalizadas`
--

CREATE TABLE `ordenes_finalizadas` (
  `id` int(11) NOT NULL,
  `mesa` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_listas`
--

CREATE TABLE `ordenes_listas` (
  `id` int(11) NOT NULL,
  `mesa` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes_listas`
--

INSERT INTO `ordenes_listas` (`id`, `mesa`, `nombre`, `cantidad`, `preciou`, `fyh`) VALUES
(1, 'Mesa 1', 'Huevos con jamón', '', '', '2023-12-19 13:23:15'),
(2, 'Mesa 4', 'plato frutas niño', '', '', '2023-12-19 13:29:43'),
(3, 'Mesa 1', 'Cena Fin de Año', '', '', '2023-12-20 11:38:12'),
(4, 'Mesa 1', 'Menor Cena Fin de Año', '', '', '2023-12-20 11:38:16'),
(5, 'Mesa 1', 'Cena Navidad', '', '', '2023-12-20 11:38:20'),
(6, 'Mesa 1', 'Menor Cena Navidad', '', '', '2023-12-20 11:38:23'),
(7, 'Mesa 1', 'Desayuno de la casa', '', '', '2024-01-15 12:33:32'),
(8, 'Mesa 1', 'Desayuno de la casa', '', '', '2024-01-15 12:36:23'),
(10, 'Mesa 1', 'Desayuno de la casa', '', '', '2024-01-15 12:37:33'),
(23, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-02 14:34:52'),
(24, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-02 14:57:22'),
(25, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-02 15:50:48'),
(29, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-04 12:03:38'),
(30, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-04 13:17:54'),
(31, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-04 13:25:05'),
(32, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-11 10:39:30'),
(33, 'Mesa 1', 'Tacos al pastor veggie', '', '', '2024-01-11 10:40:19'),
(35, 'Mesa 1', 'Huevos con chorizo', '', '', '2024-01-28 10:41:24'),
(36, 'Mesa 7', 'cocktail de frutas', '', '', '2024-01-28 10:41:42'),
(37, 'Mesa 1', 'Cena Fin de Año', '', '', '2024-01-28 11:06:41'),
(38, 'Mesa 1', 'Cena Fin de Año', '', '', '2024-01-28 11:27:40'),
(39, 'Mesa 1', 'Menor Cena Fin de Año', '', '', '2024-01-28 11:31:40'),
(40, 'Mesa 1', 'Desayuno de la casa', '', '', '2024-01-28 11:36:45'),
(41, 'Mesa 7', 'Chilaquiles', '', '', '2024-01-28 11:36:57'),
(42, 'Mesa 7', 'Huevos rancheros', '', '', '2024-01-28 11:38:03'),
(43, 'Mesa 7', 'plato frutas niño', '', '', '2024-01-28 11:38:06'),
(44, 'Mesa 4', 'Chilaquiles', '', '', '2024-01-28 11:41:50'),
(45, 'Mesa 4', 'Huevos rancheros', '', '', '2024-01-28 11:41:53'),
(46, 'Mesa 4', 'Enfrijoladas', '', '', '2024-01-28 11:43:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa1`
--

CREATE TABLE `ordenmesa1` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa2`
--

CREATE TABLE `ordenmesa2` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa3`
--

CREATE TABLE `ordenmesa3` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa4`
--

CREATE TABLE `ordenmesa4` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenmesa4`
--

INSERT INTO `ordenmesa4` (`id`, `nombre`, `cantidad`, `preciou`, `fyh`) VALUES
(56, 'Chilaquiles', '1', '125', '2024-01-28 11:41:50'),
(57, 'Huevos rancheros', '1', '105', '2024-01-28 11:41:53'),
(58, 'Enfrijoladas', '1', '119', '2024-01-28 11:43:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa5`
--

CREATE TABLE `ordenmesa5` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa6`
--

CREATE TABLE `ordenmesa6` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa7`
--

CREATE TABLE `ordenmesa7` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenmesa8`
--

CREATE TABLE `ordenmesa8` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL,
  `fyh` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Ingredientes` text NOT NULL,
  `Cantidades` text NOT NULL,
  `Costo` decimal(12,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`ID`, `Nombre`, `Ingredientes`, `Cantidades`, `Costo`) VALUES
(1, 'Crema de setas', '[\"CEBOLLA\",\"AJO\",\"ZANAHORIA\",\"CHAMPI\\u00d1ONES\",\"SETAS\",\"PAPA NORMAL\",\"LECHE ENTERA\"]', '{\"CEBOLLA\":\"250\",\"AJO\":\"100\",\"ZANAHORIA\":\"500\",\"CHAMPI\\u00d1ONES\":\"600\",\"SETAS\":\"300\",\"PAPA NORMAL\":\"500\",\"LECHE ENTERA\":\"3000\"}', '128.500000'),
(3, 'Ensalada de frutos rojos', '[\"LECHUGA ITALIANA\",\"FRESA\",\"ZARZAMORA\",\"FRAMBUESA\",\"ARANDANO DESHIDRATADO\",\"CACAHUATE GARAPI\\u00d1ADO\",\"REDUCCION DE VINO\"]', '{\"LECHUGA ITALIANA\":\"40\",\"FRESA\":\"10\",\"ZARZAMORA\":\"10\",\"FRAMBUESA\":\"10\",\"ARANDANO DESHIDRATADO\":\"10\",\"CACAHUATE GARAPI\\u00d1ADO\":\"10\",\"REDUCCION DE VINO\":\"15\"}', '9.103710'),
(4, 'Cazon en costra de frijol y mantequilla al epazote', '[\"ZANAHORIA BABY\",\"PAPA ALFA\",\"CAZON\",\"COSTRA DE FRIJOL\",\"MANTEQUILLA AL EPAZOTE\"]', '{\"ZANAHORIA BABY\":\"10\",\"PAPA ALFA\":\"40\",\"CAZON\":\"190\",\"COSTRA DE FRIJOL\":\"48\",\"MANTEQUILLA AL EPAZOTE\":\"20\"}', '38.643330'),
(5, 'Volcan de chocolate con helado artesanal de fresa', '[\"PLATANO\",\"FRESA\",\"AZUCAR\",\"HARINA DE TRIGO\",\"HUEVO\",\"MANTEQUILLA ARTESANAL\",\"LECHE ENTERA\",\"HARINA DE TRIGO\",\"CHOCOLATE OAXAQUE\\u00d1O\"]', '{\"PLATANO\":\"400\",\"FRESA\":\"250\",\"AZUCAR\":\"50\",\"HARINA DE TRIGO\":\"300\",\"HUEVO\":\"19\",\"MANTEQUILLA ARTESANAL\":\"600\",\"LECHE ENTERA\":\"400\",\"CHOCOLATE OAXAQUE\\u00d1O\":\"650\"}', '198.291450'),
(6, 'Tacos de huachinango', '[\"AJO\",\"PEREJIL\",\"LIMON\",\"HUACHINANGO\",\"TORTILLA AZUL\"]', '{\"AJO\":\"20\",\"PEREJIL\":\"5\",\"LIMON\":\"25\",\"HUACHINANGO\":\"180\",\"TORTILLA AZUL\":\"4\"}', '87.022728'),
(7, 'PECHUGA A LA PARRILLA CON CAJUN Y ENSALADA MIXTA', '{\"PECHUGA POLLO\", \"CAJUN\", \"SAL\", \"PIMIENTA\", \"LECHUGA ITALIANA\", \"AGUACATE\", \"CEBOLLA MORADA\"}', '{\"PECHUGA POLLO\": 180, \"CAJUN\": 20, \"SAL\": 20, \"PIMIENTA\": 10, \"LECHUGA ITALIANA\": 60, \"AGUACATE\": 30, \"CEBOLLA MORADA\": 20}', '41.111000'),
(8, 'ENSALADA DE HIGOS', '{\"HIGO\", \"MIX HOJAS VERDES\", \"CACAHUATE GARAPIÑADO\", \"FRAMBUESA\", \"QUESO DE CABRA\", \"VINAGRE BALSAMICO\", \"MIEL DE ABEJA\", \"ACEITE DE OLIVA\", \"FRESA\"}', '{\"HIGO\": 80, \"MIX HOJAS VERDES\": 80, \"CACAHUATE GARAPIÑADO\": 30, \"FRAMBUESA\": 10, \"QUESO DE CABRA\": 30, \"VINAGRE BALSAMICO\": 40, \"MIEL DE ABEJA\": 15, \"ACEITE DE OLIVA\": 10, \"FRESA\": 25}', '45.848000'),
(9, 'AGUACHILE VERDE', '{\"CAMARON ROSA\", \"OSTION\", \"TOMATE\", \"CHILE SERRANO\", \"CILANTRO\", \"MENTA\", \"LIMON\", \"ACEITUNA SIN HUESO\", \"AGUACATE\"}', '{\"CAMARON ROSA\": 170, \"OSTION\": 1, \"TOMATE\": 60, \"CHILE SERRANO\": 15, \"CILANTRO\": 40, \"MENTA\": 5, \"LIMON\": 80, \"ACEITUNA SIN HUESO\": 2, \"AGUACATE\": 50}', '79.113000'),
(10, 'OSTIONES ZARANDEADOS', '{\"OSTION\", \"SALSA ZARANDEADA\", \"GERMEN\"}', '{\"OSTION\": 7, \"SALSA ZARANDEADA\": 40, \"GERMEN\": 20}', '23.600000'),
(11, 'CARPACCIO DE BETABEL', '{\"BETABEL\", \"GERMEN\", \"TOMATE CHERRY\", \"REDUCCION DE VINO\", \"QUESO DE CABRA\", \"CACAHUATE GARAPIÑADO\", \"MANGO\"}', '{\"BETABEL\": 90, \"GERMEN\": 30, \"TOMATE CHERRY\": 15, \"REDUCCION DE VINO\": 25, \"QUESO DE CABRA\": 25, \"CACAHUATE GARAPIÑADO\": 15, \"MANGO\": 60}', '19.715000'),
(12, 'SOPA DE HONGOS', '{\"AGUA PURIFICADA\", \"GUAJILLO\", \"AJO\", \"CEBOLLA\", \"CHAMPIÑONES\", \"CALABAZA\", \"EPAZOTE\", \"FLOR DE CALABAZA\"}', '{\"AGUA PURIFICADA\": 1000, \"GUAJILLO\": 80, \"AJO\": 60, \"CEBOLLA\": 150, \"CHAMPIÑONES\": 200, \"CALABAZA\": 200, \"EPAZOTE\": 50, \"FLOR DE CALABAZA\": 40}', '43.267000'),
(13, 'PAPAS GAJO', '{\"PAPA ALFA\", \"SAL\", \"PIMIENTA\", \"PAPRIKA\", \"ADEREZO DE CHIPOTLE\", \"CEBOLLA EN POLVO\"}', '{\"PAPA ALFA\": 350, \"SAL\": 2, \"PIMIENTA\": 2, \"PAPRIKA\": 2, \"ADEREZO DE CHIPOTLE\": 20, \"CEBOLLA EN POLVO\": 1}', '9.814000'),
(14, 'ESCAMOLES', '{\"ESCAMOLES\", \"CEBOLLA\", \"MANTEQUILLA ARTESANAL\", \"EPAZOTE\", \"CHILE SERRANO\", \"GUACAMOLE\"}', '{\"ESCAMOLES\": 100, \"CEBOLLA\": 25, \"MANTEQUILLA ARTESANAL\": 15, \"EPAZOTE\": 3, \"CHILE SERRANO\": 15, \"GUACAMOLE\": 80}', '85.658000'),
(15, 'ENSALADA DE CHORIZO VEGANO', '{\"CHORIZO VEGETAL\", \"MIX HOJAS VERDES\", \"CACAHUATE SALADO\", \"QUESO FRESCO\", \"CEBOLLA\", \"LIMON\", \"ACEITE DE OLIVA\", \"AGUACATE\"}', '{\"CHORIZO VEGETAL\": 1, \"MIX HOJAS VERDES\": 67, \"CACAHUATE SALADO\": 20, \"QUESO FRESCO\": 30, \"CEBOLLA\": 50, \"LIMON\": 50, \"ACEITE DE OLIVA\": 40, \"AGUACATE\": 20}', '23.062000'),
(16, 'CECINA ATLIXQUENSE', '{\"TORTILLA BLANCA\", \"CECINA\", \"FRIJOLES REFRITOS\", \"GUACAMOLE\", \"QUESO FRESCO\", \"TOTOPOS\", \"NOPALES\", \"QUESO AÑEJO\"}', '{\"TORTILLA BLANCA\": 4, \"CECINA\": 200, \"FRIJOLES REFRITOS\": 50, \"GUACAMOLE\": 50, \"QUESO FRESCO\": 80, \"TOTOPOS\": 15, \"NOPALES\": 40, \"QUESO AÑEJO\": 10}', '65.084000'),
(17, 'HOTDOG AL PASTOR', '{\"SALCHICHA VEGETAL\", \"PAN HOTDOG\", \"CEBOLLA\", \"CILANTRO\", \"XNIPEC\", \"PIÑA\"}', '{\"SALCHICHA VEGETAL\": 1, \"PAN HOTDOG\": 1, \"CEBOLLA\": 40, \"CILANTRO\": 5, \"XNIPEC\": 15, \"PIÑA\": 15}', '14.857000'),
(18, 'TACOS AL PASTOR VEGGIE', '{\"CARNE AL PASTOR\", \"CILANTRO\", \"CEBOLLA\", \"PIÑA\", \"LIMON\", \"TORTILLA BLANCA\"}', '{\"CARNE AL PASTOR\": 150, \"CILANTRO\": 50, \"CEBOLLA\": 50, \"PIÑA\": 45, \"LIMON\": 40, \"TORTILLA BLANCA\": 3}', '26.360000'),
(19, 'TACOS DE CAZON', '{\"CAZON\", \"SALSA AL PASTOR\", \"PIÑA\", \"CILANTRO\", \"CEBOLLA\", \"LIMON\", \"TORTILLA BLANCA\"}', '{\"CAZON\": 120, \"SALSA AL PASTOR\": 30, \"PIÑA\": 45, \"CILANTRO\": 30, \"CEBOLLA\": 30, \"LIMON\": 20, \"TORTILLA BLANCA\": 3}', '24.983000'),
(20, 'HAMBURGUESA PORTO', '{\"PAN BOLLO\", \"HAMBURGUESA BETABEL\", \"PORTOBELLO\", \"CREMA DE ALMENDRAS CON ESPINACAS\", \"XNIPEC\", \"PALILLO ALTO\", \"ACEITUNA SIN HUESO\", \"PAPAS GAJO\", \"ADEREZO DE CHIPOTLE\"}', '{\"PAN BOLLO\": 1, \"HAMBURGUESA BETABEL\": 1, \"PORTOBELLO\": 1, \"CREMA DE ALMENDRAS CON ESPINACAS\": 50, \"XNIPEC\": 20, \"PALILLO ALTO\": 2, \"ACEITUNA SIN HUESO\": 2, \"PAPAS GAJO\": 130, \"ADEREZO DE CHIPOTLE\": 30}', '54.964000'),
(21, 'CAZON AL PASTOR', '{\"CAZON\", \"SALSA AL PASTOR\", \"PIÑA\", \"CEBOLLA CAMBRAY\", \"CHAMPIÑONES\", \"XNIPEC\", \"HOJA DE PLATANO\"}', '{\"CAZON\": 200, \"SALSA AL PASTOR\": 50, \"PIÑA\": 35, \"CEBOLLA CAMBRAY\": 18, \"CHAMPIÑONES\": 25, \"XNIPEC\": 30, \"HOJA DE PLATANO\": 30}', '41.441000'),
(22, 'Linguinni CON ALBONDIGA VEGGIE', '{\"FETTUCCINI\", \"SALSA POBLANA\", \"CHAMPIÑONES\", \"ALBONDIGA VEGETAL\", \"PAN DE SAL\"}', '{\"FETTUCCINI\": 100, \"SALSA POBLANA\": 80, \"CHAMPIÑONES\": 80, \"ALBONDIGA VEGETAL\": 3, \"PAN DE SAL\": 1}', '42.112000'),
(23, 'MOJARRA A LA TALLA', '{\"MOJARRA\", \"GUAJILLO\", \"AJO\", \"CEBOLLA\", \"MAYONESA\", \"NARANJA\", \"GERMEN\"}', '{\"MOJARRA\": 400, \"GUAJILLO\": 20, \"AJO\": 20, \"CEBOLLA\": 20, \"MAYONESA\": 40, \"NARANJA\": 20, \"GERMEN\": 10}', '46.094000'),
(24, 'VOLCAN DE CHOCOLATE CON HELADO ARTESANAL', '{\"MANTEQUILLA ARTESANAL\", \"CHOCOLATE OAXAQUEÑO\", \"HUEVO\", \"HARINA DE TRIGO\", \"AZUCAR\", \"HELADO ARTESANAL FRESA\"}', '{\"MANTEQUILLA ARTESANAL\": 670, \"CHOCOLATE OAXAQUEÑO\": 580, \"HUEVO\": 12, \"HARINA DE TRIGO\": 300, \"AZUCAR\": 100, \"HELADO ARTESANAL FRESA\": 50}', '163.908000'),
(25, 'PAN DE ELOTE Y HELADO CHOCOLATE CON MEZCAL', '{\"ELOTE\", \"HARINA DE TRIGO\", \"LECHE CONDENSADA\", \"POLVO PARA HORNEAR\", \"QUESO CREMA\", \"ACEITE VEGETAL\"}', '{\"ELOTE\": 210, \"HARINA DE TRIGO\": 375, \"LECHE CONDENSADA\": 600, \"POLVO PARA HORNEAR\": 10, \"QUESO CREMA\": 95, \"ACEITE VEGETAL\": 300}', '69.562000'),
(26, 'SUBRECETA - GUACAMOLE', '[\"CEBOLLA\",\"CILANTRO\",\"AGUACATE\",\"CHILE SERRANO\",\"LIMON\"]', '{\"CEBOLLA\":\"80\",\"CILANTRO\":\"80\",\"AGUACATE\":\"1000\",\"CHILE SERRANO\":\"80\",\"LIMON\":\"63\"}', '36.370880'),
(27, 'SUBRECETA - CREMA DE ALMENDRAS', '[\"SAL\",\"CEBOLLA EN POLVO\",\"MAIZENA\",\"ALMENDRAS\",\"AGUA PURIFICADA\"]', '{\"SAL\":\"15\",\"CEBOLLA EN POLVO\":\"15\",\"MAIZENA\":\"200\",\"ALMENDRAS\":\"250\",\"AGUA PURIFICADA\":\"1000\"}', '68.343970'),
(28, 'SUBRECETA - CREMA DE ALMENDRAS CON ESPINACA', '[\"CEBOLLA\",\"ESPINACAS\",\"ACEITE DE OLIVA\",\"QUESO VEGANO MANCHEGO\",\"CREMA DE ALMENDRAS\"]', '{\"CEBOLLA\":\"200\",\"ESPINACAS\":\"150\",\"ACEITE DE OLIVA\":\"40\",\"QUESO VEGANO MANCHEGO\":\"300\",\"CREMA DE ALMENDRAS\":\"200\"}', '123.583920'),
(29, 'SUBRECETA - FRIJOLES REFRITOS', '[\"CEBOLLA\",\"AJO\",\"ACEITE VEGETAL\",\"FRIJOL BALLO NEGRO\",\"AGUA PURIFICADA\"]', '{\"CEBOLLA\":\"100\",\"AJO\":\"100\",\"ACEITE VEGETAL\":\"50\",\"FRIJOL BALLO NEGRO\":\"500\",\"AGUA PURIFICADA\":\"1000\"}', '37.926750'),
(30, 'SUBRECETA - ADEREZO CHIPOTLE', '[\"LIMON\",\"CHIPOTLE EN LATA\",\"CREMA DE ALMENDRAS\"]', '{\"LIMON\":\"30\",\"CHIPOTLE EN LATA\":\"20\",\"CREMA DE ALMENDRAS\":\"100\"}', '8.199760'),
(31, 'SUBRECETA - XNIPEC', '[\"CEBOLLA MORADA\",\"HABANERO\",\"OREGANO\",\"VINAGRE DE MANZANA\"]', '{\"CEBOLLA MORADA\":\"300\",\"HABANERO\":\"150\",\"OREGANO\":\"5\",\"VINAGRE DE MANZANA\":\"50\"}', '13.325000'),
(32, 'SUBRECETA - SALSA AL PASTOR', '[\"NARANJA\",\"GUAJILLO\",\"OREGANO\",\"VINAGRE DE MANZANA\",\"AXIOTE\"]', '{\"NARANJA\":\"300\",\"GUAJILLO\":\"100\",\"OREGANO\":\"30\",\"VINAGRE DE MANZANA\":\"50\",\"AXIOTE\":\"80\"}', '28.720000'),
(33, 'SUBRECETA - SALSA POBLANA', '[\"CEBOLLA\",\"AJO\",\"CILANTRO\",\"CHILE POBLANO\",\"SAL\",\"QUESO FRESCO\",\"MANTEQUILLA ARTESANAL\",\"LECHE ENTERA\"]', '{\"CEBOLLA\":\"100\",\"AJO\":\"50\",\"CILANTRO\":\"60\",\"CHILE POBLANO\":\"150\",\"SAL\":\"25\",\"QUESO FRESCO\":\"60\",\"MANTEQUILLA ARTESANAL\":\"30\",\"LECHE ENTERA\":\"400\"}', '22.397780'),
(34, 'SUBRECETA - HELADO DE FRUTAS ARTESANAL', '[\"PLATANO\",\"FRESA\",\"AZUCAR\",\"LECHE ENTERA\"]', '{\"PLATANO\":\"100\",\"FRESA\":\"200\",\"AZUCAR\":\"50\",\"LECHE ENTERA\":\"500\"}', '20.550000'),
(35, 'SUBRECETA - SALSA ZARANDEADA', '[\"CEBOLLA\",\"AJO\",\"GUAJILLO\",\"SAL\",\"VINAGRE DE MANZANA\",\"MAYONESA\"]', '{\"CEBOLLA\":\"20\",\"AJO\":\"20\",\"GUAJILLO\":\"80\",\"SAL\":\"10\",\"VINAGRE DE MANZANA\":\"15\",\"MAYONESA\":\"15\"}', '14.487725'),
(36, 'SUBRECETA - REDUCCIÓN DE VINO', '[\"CANELA\",\"VINO DE CAJA\",\"PILONCILLO\"]', '{\"CANELA\":\"8\",\"VINO DE CAJA\":\"1000\",\"PILONCILLO\":\"130\"}', '81.300000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `datos_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_json`)),
  `habitacion` varchar(30) NOT NULL,
  `comensal` varchar(30) NOT NULL,
  `fyh` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `datos_json`, `habitacion`, `comensal`, `fyh`) VALUES
(1, '[{\"id\":\"20\",\"nombre\":\"Tacos al pastor veggie\",\"cantidad\":\"1\",\"preciou\":\"99\",\"fyh\":\"2024-01-04 12:03:38\",\"mensaje\":\"PAGADO AL MOMENTO\"},{\"id\":\"21\",\"nombre\":\"Tacos al pastor veggie\",\"cantidad\":\"1\",\"preciou\":\"99\",\"fyh\":\"2024-01-04 13:17:54\",\"mensaje\":\"PAGADO AL MOMENTO\"},{\"id\":\"22\",\"nombre\":\"Tacos al pastor veggie\",\"cantidad\":\"1\",\"preciou\":\"99\",\"fyh\":\"2024-01-04 13:25:05\",\"mensaje\":\"PAGADO AL MOMENTO\"}]', '', '', '2024-01-04 17:04:22'),
(2, '[{\"id\":\"48\",\"nombre\":\"Desayuno Saludable (incluido)\",\"cantidad\":\"1\",\"preciou\":\"0\",\"fyh\":\"2024-01-28 10:40:41\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"49\",\"nombre\":\"Desayuno Saludable (incluido)\",\"cantidad\":\"1\",\"preciou\":\"0\",\"fyh\":\"2024-01-28 10:40:44\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"50\",\"nombre\":\"Chilaquiles\",\"cantidad\":\"1\",\"preciou\":\"125\",\"fyh\":\"2024-01-28 10:41:22\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"51\",\"nombre\":\"Huevos con chorizo\",\"cantidad\":\"1\",\"preciou\":\"115\",\"fyh\":\"2024-01-28 10:41:24\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"52\",\"nombre\":\"Cena Fin de Año\",\"cantidad\":\"1\",\"preciou\":\"700\",\"fyh\":\"2024-01-28 11:06:41\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"53\",\"nombre\":\"Cena Fin de Año\",\"cantidad\":\"1\",\"preciou\":\"700\",\"fyh\":\"2024-01-28 11:27:40\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"54\",\"nombre\":\"Menor Cena Fin de Año\",\"cantidad\":\"1\",\"preciou\":\"480\",\"fyh\":\"2024-01-28 11:31:40\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"55\",\"nombre\":\"Desayuno de la casa\",\"cantidad\":\"1\",\"preciou\":\"125\",\"fyh\":\"2024-01-28 11:36:45\",\"mensaje\":\"Mandado a la habitación\"}]', 'Dalia', 'MARIAN LUIS SILVA', '2024-01-31 11:55:02'),
(3, '[{\"id\":\"5\",\"nombre\":\"cocktail de frutas\",\"cantidad\":\"1\",\"preciou\":\"75\",\"fyh\":\"2024-01-28 10:41:42\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"6\",\"nombre\":\"Chilaquiles\",\"cantidad\":\"1\",\"preciou\":\"125\",\"fyh\":\"2024-01-28 11:36:57\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"7\",\"nombre\":\"Huevos rancheros\",\"cantidad\":\"1\",\"preciou\":\"105\",\"fyh\":\"2024-01-28 11:38:03\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"8\",\"nombre\":\"plato frutas niño\",\"cantidad\":\"1\",\"preciou\":\"45\",\"fyh\":\"2024-01-28 11:38:06\",\"mensaje\":\"Mandado a la habitación\"},{\"id\":\"9\",\"nombre\":\"Chilaquiles\",\"cantidad\":\"1\",\"preciou\":\"125\",\"fyh\":\"2024-02-01 14:58:08\",\"mensaje\":\"Mandado a la habitación\"}]', 'Cuna de moisés', 'SHAURY SANTIAGO AGUILAR', '2024-02-14 13:32:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(10, 'RecepcionCFv', '$2y$10$Tfw8TTVEBrm9CRWaZUBVfuoZ/oTCx2iN/hMVxUYsNPasCIcUpt2LC', '2023-04-01 11:40:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventadirecta`
--

CREATE TABLE `ventadirecta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `preciou` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cajach`
--
ALTER TABLE `cajach`
  ADD PRIMARY KEY (`cod_dia`);

--
-- Indices de la tabla `cajaop`
--
ALTER TABLE `cajaop`
  ADD PRIMARY KEY (`cod_operacion`);

--
-- Indices de la tabla `errores`
--
ALTER TABLE `errores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario_alimentos`
--
ALTER TABLE `inventario_alimentos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `inventario_bebidas`
--
ALTER TABLE `inventario_bebidas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `mermas`
--
ALTER TABLE `mermas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mermas_ing`
--
ALTER TABLE `mermas_ing`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ordenes_currentes`
--
ALTER TABLE `ordenes_currentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_de_compra`
--
ALTER TABLE `ordenes_de_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_finalizadas`
--
ALTER TABLE `ordenes_finalizadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_listas`
--
ALTER TABLE `ordenes_listas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa1`
--
ALTER TABLE `ordenmesa1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa2`
--
ALTER TABLE `ordenmesa2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa3`
--
ALTER TABLE `ordenmesa3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa4`
--
ALTER TABLE `ordenmesa4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa5`
--
ALTER TABLE `ordenmesa5`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa6`
--
ALTER TABLE `ordenmesa6`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa7`
--
ALTER TABLE `ordenmesa7`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenmesa8`
--
ALTER TABLE `ordenmesa8`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `ventadirecta`
--
ALTER TABLE `ventadirecta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `cajach`
--
ALTER TABLE `cajach`
  MODIFY `cod_dia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajaop`
--
ALTER TABLE `cajaop`
  MODIFY `cod_operacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `errores`
--
ALTER TABLE `errores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `inventario_alimentos`
--
ALTER TABLE `inventario_alimentos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `inventario_bebidas`
--
ALTER TABLE `inventario_bebidas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mermas`
--
ALTER TABLE `mermas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `mermas_ing`
--
ALTER TABLE `mermas_ing`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ordenes_currentes`
--
ALTER TABLE `ordenes_currentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ordenes_de_compra`
--
ALTER TABLE `ordenes_de_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ordenes_finalizadas`
--
ALTER TABLE `ordenes_finalizadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenes_listas`
--
ALTER TABLE `ordenes_listas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `ordenmesa1`
--
ALTER TABLE `ordenmesa1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `ordenmesa2`
--
ALTER TABLE `ordenmesa2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ordenmesa3`
--
ALTER TABLE `ordenmesa3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `ordenmesa4`
--
ALTER TABLE `ordenmesa4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `ordenmesa5`
--
ALTER TABLE `ordenmesa5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ordenmesa6`
--
ALTER TABLE `ordenmesa6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `ordenmesa7`
--
ALTER TABLE `ordenmesa7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ordenmesa8`
--
ALTER TABLE `ordenmesa8`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventadirecta`
--
ALTER TABLE `ventadirecta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
