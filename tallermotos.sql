-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2021 a las 00:22:23
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tallermotos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(245) DEFAULT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `Nombre`, `Descripcion`, `idEstado`) VALUES
(1, 'Repuestos', 'Repuestos de todo tipo para motocicletas', 1),
(2, 'Accesorios de Lujo', 'Variedad en productos de Lujo para motocicleta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleingresopedido`
--

CREATE TABLE `detalleingresopedido` (
  `idDetalleIngresoPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idIngresoPedido` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ValorCompraUnidad` decimal(11,4) NOT NULL,
  `ValorVentaUnidad` decimal(11,4) NOT NULL,
  `ValorDescuentoUnidad` decimal(11,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleingresopedido`
--

INSERT INTO `detalleingresopedido` (`idDetalleIngresoPedido`, `idProducto`, `idIngresoPedido`, `Cantidad`, `ValorCompraUnidad`, `ValorVentaUnidad`, `ValorDescuentoUnidad`) VALUES
(1, 1, 2, 50, '17000.0000', '19000.0000', '1000.0000'),
(2, 1, 3, 12, '11000.0000', '16000.0000', '500.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioVenta` decimal(11,4) NOT NULL,
  `Descuento` decimal(11,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventatipomecanica`
--

CREATE TABLE `detalleventatipomecanica` (
  `idVentaPorTipoMecanica` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idTipoMecanica` int(11) NOT NULL,
  `ValorTotal` decimal(11,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleventatipomecanica`
--

INSERT INTO `detalleventatipomecanica` (`idVentaPorTipoMecanica`, `idVenta`, `idTipoMecanica`, `ValorTotal`) VALUES
(1, 1, 1, '0.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idEstado`, `Nombre`, `Descripcion`) VALUES
(1, 'Activo', 'Vigencia en el Sistema'),
(2, 'Inactivo', 'Se cancela del Sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionalidades`
--

CREATE TABLE `funcionalidades` (
  `idFuncionalidad` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Ruta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionalidadesporperfil`
--

CREATE TABLE `funcionalidadesporperfil` (
  `FuncionalidadesPorPerfil` int(11) NOT NULL,
  `idFuncionalidad` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresopedido`
--

CREATE TABLE `ingresopedido` (
  `idIngresoPedido` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `NumeroComprobante` varchar(45) DEFAULT NULL,
  `Impuesto` decimal(4,2) DEFAULT NULL,
  `ValorAbonoFactura` float DEFAULT NULL,
  `idTipoCancelacion` int(11) NOT NULL,
  `idTipoFactura` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(245) DEFAULT NULL,
  `Imagen` varchar(50) DEFAULT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `Nombre`, `Descripcion`, `Imagen`, `idEstado`) VALUES
(1, 'Advance', 'Marca Aceite.', NULL, 1),
(2, 'Mobil', 'Marca Aceite', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `Nombre`, `Descripcion`) VALUES
(1, 'Administrador', 'Dueño de todo el sistema. Perfil con acceso a'),
(2, 'Vendedor', 'Encargado de las ventas y articulos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Codigo` varchar(45) NOT NULL,
  `CantidadStock` int(11) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Imagen` varchar(50) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `Nombre`, `Codigo`, `CantidadStock`, `Descripcion`, `Imagen`, `idCategoria`, `idMarca`, `idEstado`) VALUES
(1, 'Aceite Advance Litro', '1254875', 12, 'Aceite para motos 4 tiempos', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocancelacion`
--

CREATE TABLE `tipocancelacion` (
  `idTipoCancelacion` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipocancelacion`
--

INSERT INTO `tipocancelacion` (`idTipoCancelacion`, `Nombre`, `Descripcion`) VALUES
(1, 'Pago al Contado', 'Pago Total del valor del Pedido'),
(2, 'Pago a Crédito', 'Pago Parcial del valor del Pedido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Abreviatura` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `Nombre`, `Abreviatura`) VALUES
(1, 'Cédula de Ciudadanía', 'CC'),
(2, 'Cédula de Extranjería', 'CE'),
(3, 'Tarjeta de Identidad', 'TI'),
(4, 'Número de Identificación Tributaria', 'NIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipofactura`
--

CREATE TABLE `tipofactura` (
  `idTipoFactura` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipofactura`
--

INSERT INTO `tipofactura` (`idTipoFactura`, `Nombre`, `Descripcion`) VALUES
(1, 'Comprobante de Venta', 'Documento No autorizado como Factura Legal.'),
(2, 'Comprobante Virtual', 'Documento digital oficializado como comproban'),
(3, 'Factura Física', 'Documento autorizado como Factura Legal.'),
(4, 'Factura Digital', 'Documento autorizado factura digital');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomecanica`
--

CREATE TABLE `tipomecanica` (
  `idTipoMecanica` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `ValorPromedio` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipomecanica`
--

INSERT INTO `tipomecanica` (`idTipoMecanica`, `Nombre`, `Descripcion`, `ValorPromedio`) VALUES
(1, 'Cambio de Aceite', 'Cambio de Aceite a todo tipo de moto', '0.00'),
(2, 'Cambio de Bandas de Freno', 'Cambio de Bandas de Freno Trasero y delantero', '12000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idTipoPago` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(145) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idTipoPago`, `Nombre`, `Descripcion`) VALUES
(1, 'Efectivo', 'Pago por Efectivo en el lugar'),
(2, 'Transferencia Electrónica', 'Pago directo a la cuenta 31652961391 Bancolombia Ahorros.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `NumeroDocumento` varchar(45) NOT NULL,
  `Telefono` int(15) DEFAULT NULL,
  `CorreoElectonico` varchar(145) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(45) DEFAULT NULL,
  `idEstado` int(11) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `Nombres`, `Apellidos`, `NumeroDocumento`, `Telefono`, `CorreoElectonico`, `Direccion`, `Contrasena`, `idEstado`, `idTipoDocumento`, `idPerfil`) VALUES
(1, 'Alejandro ', 'Perez', '26090443', 0, NULL, NULL, 'Admin123', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `NumeroComprobante` int(11) NOT NULL,
  `TotalVenta` decimal(11,2) DEFAULT NULL,
  `idTipoPago` int(11) NOT NULL,
  `idTipoFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idVenta`, `Fecha`, `NumeroComprobante`, `TotalVenta`, `idTipoPago`, `idTipoFactura`) VALUES
(1, '2021-04-28 00:38:18', 1258754, '25000.00', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `fk_Categoria_Estado1` (`idEstado`);

--
-- Indices de la tabla `detalleingresopedido`
--
ALTER TABLE `detalleingresopedido`
  ADD PRIMARY KEY (`idDetalleIngresoPedido`),
  ADD KEY `fk_Productos_has_IngresoPedido_Productos1` (`idProducto`),
  ADD KEY `fk_Productos_has_IngresoPedido_IngresoPedido1` (`idIngresoPedido`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `fk_Venta_has_Productos_Venta1` (`idVenta`),
  ADD KEY `fk_Venta_has_Productos_Productos1` (`idProducto`);

--
-- Indices de la tabla `detalleventatipomecanica`
--
ALTER TABLE `detalleventatipomecanica`
  ADD PRIMARY KEY (`idVentaPorTipoMecanica`),
  ADD KEY `fk_Venta_has_TipoMecanica_Venta1` (`idVenta`),
  ADD KEY `fk_Venta_has_TipoMecanica_TipoMecanica1` (`idTipoMecanica`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `funcionalidades`
--
ALTER TABLE `funcionalidades`
  ADD PRIMARY KEY (`idFuncionalidad`);

--
-- Indices de la tabla `funcionalidadesporperfil`
--
ALTER TABLE `funcionalidadesporperfil`
  ADD PRIMARY KEY (`FuncionalidadesPorPerfil`),
  ADD KEY `fk_Funcionalidades_has_Perfil_Funcionalidades1` (`idFuncionalidad`),
  ADD KEY `fk_Funcionalidades_has_Perfil_Perfil1` (`idPerfil`);

--
-- Indices de la tabla `ingresopedido`
--
ALTER TABLE `ingresopedido`
  ADD PRIMARY KEY (`idIngresoPedido`),
  ADD KEY `fk_IngresoPedido_TipoCancelacion1` (`idTipoCancelacion`),
  ADD KEY `fk_IngresoPedido_TipoFactura1` (`idTipoFactura`),
  ADD KEY `fk_IngresoPedido_Usuarios1` (`idUsuario`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`),
  ADD KEY `fk_Marca_Estado1` (`idEstado`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_Productos_Categoria1` (`idCategoria`),
  ADD KEY `fk_Productos_Marca1` (`idMarca`),
  ADD KEY `fk_Productos_Estado1` (`idEstado`);

--
-- Indices de la tabla `tipocancelacion`
--
ALTER TABLE `tipocancelacion`
  ADD PRIMARY KEY (`idTipoCancelacion`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipofactura`
--
ALTER TABLE `tipofactura`
  ADD PRIMARY KEY (`idTipoFactura`);

--
-- Indices de la tabla `tipomecanica`
--
ALTER TABLE `tipomecanica`
  ADD PRIMARY KEY (`idTipoMecanica`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idTipoPago`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuarios_Estado1` (`idEstado`),
  ADD KEY `fk_Usuarios_TipoDocumento1` (`idTipoDocumento`),
  ADD KEY `fk_Usuarios_Perfil1` (`idPerfil`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `fk_Venta_TipoPago` (`idTipoPago`),
  ADD KEY `fk_Venta_TipoFactura1` (`idTipoFactura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleingresopedido`
--
ALTER TABLE `detalleingresopedido`
  MODIFY `idDetalleIngresoPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleventatipomecanica`
--
ALTER TABLE `detalleventatipomecanica`
  MODIFY `idVentaPorTipoMecanica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `funcionalidades`
--
ALTER TABLE `funcionalidades`
  MODIFY `idFuncionalidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionalidadesporperfil`
--
ALTER TABLE `funcionalidadesporperfil`
  MODIFY `FuncionalidadesPorPerfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresopedido`
--
ALTER TABLE `ingresopedido`
  MODIFY `idIngresoPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipocancelacion`
--
ALTER TABLE `tipocancelacion`
  MODIFY `idTipoCancelacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipofactura`
--
ALTER TABLE `tipofactura`
  MODIFY `idTipoFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipomecanica`
--
ALTER TABLE `tipomecanica`
  MODIFY `idTipoMecanica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idTipoPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_Categoria_Estado1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleingresopedido`
--
ALTER TABLE `detalleingresopedido`
  ADD CONSTRAINT `fk_Productos_has_IngresoPedido_IngresoPedido1` FOREIGN KEY (`idIngresoPedido`) REFERENCES `ingresopedido` (`idIngresoPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_has_IngresoPedido_Productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_Venta_has_Productos_Productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Venta_has_Productos_Venta1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleventatipomecanica`
--
ALTER TABLE `detalleventatipomecanica`
  ADD CONSTRAINT `fk_Venta_has_TipoMecanica_TipoMecanica1` FOREIGN KEY (`idTipoMecanica`) REFERENCES `tipomecanica` (`idTipoMecanica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Venta_has_TipoMecanica_Venta1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcionalidadesporperfil`
--
ALTER TABLE `funcionalidadesporperfil`
  ADD CONSTRAINT `fk_Funcionalidades_has_Perfil_Funcionalidades1` FOREIGN KEY (`idFuncionalidad`) REFERENCES `funcionalidades` (`idFuncionalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Funcionalidades_has_Perfil_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresopedido`
--
ALTER TABLE `ingresopedido`
  ADD CONSTRAINT `fk_IngresoPedido_TipoCancelacion1` FOREIGN KEY (`idTipoCancelacion`) REFERENCES `tipocancelacion` (`idTipoCancelacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IngresoPedido_TipoFactura1` FOREIGN KEY (`idTipoFactura`) REFERENCES `tipofactura` (`idTipoFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IngresoPedido_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_Marca_Estado1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Estado1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Marca1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_Usuarios_Estado1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_TipoDocumento1` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_Venta_TipoFactura1` FOREIGN KEY (`idTipoFactura`) REFERENCES `tipofactura` (`idTipoFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Venta_TipoPago` FOREIGN KEY (`idTipoPago`) REFERENCES `tipopago` (`idTipoPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
