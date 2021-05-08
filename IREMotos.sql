-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tallermotos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tallermotos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tallermotos` DEFAULT CHARACTER SET utf8 ;
USE `tallermotos` ;

-- -----------------------------------------------------
-- Table `tallermotos`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`estado` (
  `idEstado` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`categoria` (
  `idCategoria` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripcion` VARCHAR(245) NULL DEFAULT NULL,
  `idEstado` INT(11) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  INDEX `fk_Categoria_Estado1` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `tallermotos`.`estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`tipocancelacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`tipocancelacion` (
  `idTipoCancelacion` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoCancelacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`tipofactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`tipofactura` (
  `idTipoFactura` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoFactura`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`perfil` (
  `idPerfil` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`tipodocumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`tipodocumento` (
  `idTipoDocumento` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Abreviatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`usuarios` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(100) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `NumeroDocumento` VARCHAR(45) NOT NULL,
  `Telefono` INT(15) NULL DEFAULT NULL,
  `CorreoElectonico` VARCHAR(145) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `Contrasena` VARCHAR(45) NULL DEFAULT NULL,
  `idEstado` INT(11) NOT NULL,
  `idTipoDocumento` INT(11) NOT NULL,
  `idPerfil` INT(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuarios_Estado1` (`idEstado` ASC) VISIBLE,
  INDEX `fk_Usuarios_TipoDocumento1` (`idTipoDocumento` ASC) VISIBLE,
  INDEX `fk_Usuarios_Perfil1` (`idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `tallermotos`.`estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `tallermotos`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_TipoDocumento1`
    FOREIGN KEY (`idTipoDocumento`)
    REFERENCES `tallermotos`.`tipodocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`ingresopedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`ingresopedido` (
  `idIngresoPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NOT NULL,
  `NumeroComprobante` VARCHAR(45) NULL DEFAULT NULL,
  `Impuesto` DECIMAL(4,2) NULL DEFAULT NULL,
  `ValorAbonoFactura` FLOAT NULL DEFAULT NULL,
  `idTipoCancelacion` INT(11) NOT NULL,
  `idTipoFactura` INT(11) NOT NULL,
  `idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idIngresoPedido`),
  INDEX `fk_IngresoPedido_TipoCancelacion1` (`idTipoCancelacion` ASC) VISIBLE,
  INDEX `fk_IngresoPedido_TipoFactura1` (`idTipoFactura` ASC) VISIBLE,
  INDEX `fk_IngresoPedido_Usuarios1` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_IngresoPedido_TipoCancelacion1`
    FOREIGN KEY (`idTipoCancelacion`)
    REFERENCES `tallermotos`.`tipocancelacion` (`idTipoCancelacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IngresoPedido_TipoFactura1`
    FOREIGN KEY (`idTipoFactura`)
    REFERENCES `tallermotos`.`tipofactura` (`idTipoFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IngresoPedido_Usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `tallermotos`.`usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`marca` (
  `idMarca` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(245) NULL DEFAULT NULL,
  `Imagen` VARCHAR(50) NULL DEFAULT NULL,
  `idEstado` INT(11) NOT NULL,
  PRIMARY KEY (`idMarca`),
  INDEX `fk_Marca_Estado1` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_Marca_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `tallermotos`.`estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`productos` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Codigo` VARCHAR(45) NOT NULL,
  `CantidadStock` INT(11) NOT NULL,
  `Descripcion` VARCHAR(200) NULL DEFAULT NULL,
  `Imagen` VARCHAR(50) NOT NULL,
  `idCategoria` INT(11) NOT NULL,
  `idMarca` INT(11) NOT NULL,
  `idEstado` INT(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Productos_Categoria1` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Productos_Marca1` (`idMarca` ASC) VISIBLE,
  INDEX `fk_Productos_Estado1` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `tallermotos`.`categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `tallermotos`.`estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Marca1`
    FOREIGN KEY (`idMarca`)
    REFERENCES `tallermotos`.`marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`detalleingresopedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`detalleingresopedido` (
  `idDetalleIngresoPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idProducto` INT(11) NOT NULL,
  `idIngresoPedido` INT(11) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  `ValorCompraUnidad` DECIMAL(11,4) NOT NULL,
  `ValorVentaUnidad` DECIMAL(11,4) NOT NULL,
  `ValorDescuentoUnidad` DECIMAL(11,4) NOT NULL,
  PRIMARY KEY (`idDetalleIngresoPedido`),
  INDEX `fk_Productos_has_IngresoPedido_Productos1` (`idProducto` ASC) VISIBLE,
  INDEX `fk_Productos_has_IngresoPedido_IngresoPedido1` (`idIngresoPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_has_IngresoPedido_IngresoPedido1`
    FOREIGN KEY (`idIngresoPedido`)
    REFERENCES `tallermotos`.`ingresopedido` (`idIngresoPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_IngresoPedido_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `tallermotos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`tipopago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`tipopago` (
  `idTipoPago` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(145) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoPago`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`venta` (
  `idVenta` INT(11) NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NOT NULL,
  `NumeroComprobante` INT(11) NOT NULL,
  `TotalVenta` DECIMAL(11,2) NULL DEFAULT NULL,
  `idTipoPago` INT(11) NOT NULL,
  `idTipoFactura` INT(11) NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Venta_TipoPago` (`idTipoPago` ASC) VISIBLE,
  INDEX `fk_Venta_TipoFactura1` (`idTipoFactura` ASC) VISIBLE,
  CONSTRAINT `fk_Venta_TipoFactura1`
    FOREIGN KEY (`idTipoFactura`)
    REFERENCES `tallermotos`.`tipofactura` (`idTipoFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_TipoPago`
    FOREIGN KEY (`idTipoPago`)
    REFERENCES `tallermotos`.`tipopago` (`idTipoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`detalleventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`detalleventa` (
  `idDetalleVenta` INT(11) NOT NULL,
  `idVenta` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  `PrecioVenta` DECIMAL(11,4) NOT NULL,
  `Descuento` DECIMAL(11,4) NULL DEFAULT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  INDEX `fk_Venta_has_Productos_Venta1` (`idVenta` ASC) VISIBLE,
  INDEX `fk_Venta_has_Productos_Productos1` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Venta_has_Productos_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `tallermotos`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_has_Productos_Venta1`
    FOREIGN KEY (`idVenta`)
    REFERENCES `tallermotos`.`venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`tipomecanica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`tipomecanica` (
  `idTipoMecanica` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `ValorPromedio` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`idTipoMecanica`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`detalleventatipomecanica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`detalleventatipomecanica` (
  `idVentaPorTipoMecanica` INT(11) NOT NULL AUTO_INCREMENT,
  `idVenta` INT(11) NOT NULL,
  `idTipoMecanica` INT(11) NOT NULL,
  `ValorTotal` DECIMAL(11,4) NOT NULL,
  PRIMARY KEY (`idVentaPorTipoMecanica`),
  INDEX `fk_Venta_has_TipoMecanica_Venta1` (`idVenta` ASC) VISIBLE,
  INDEX `fk_Venta_has_TipoMecanica_TipoMecanica1` (`idTipoMecanica` ASC) VISIBLE,
  CONSTRAINT `fk_Venta_has_TipoMecanica_TipoMecanica1`
    FOREIGN KEY (`idTipoMecanica`)
    REFERENCES `tallermotos`.`tipomecanica` (`idTipoMecanica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_has_TipoMecanica_Venta1`
    FOREIGN KEY (`idVenta`)
    REFERENCES `tallermotos`.`venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`funcionalidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`funcionalidades` (
  `idFuncionalidad` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ruta` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFuncionalidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tallermotos`.`funcionalidadesporperfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermotos`.`funcionalidadesporperfil` (
  `FuncionalidadesPorPerfil` INT(11) NOT NULL AUTO_INCREMENT,
  `idFuncionalidad` INT(11) NOT NULL,
  `idPerfil` INT(11) NOT NULL,
  PRIMARY KEY (`FuncionalidadesPorPerfil`),
  INDEX `fk_Funcionalidades_has_Perfil_Funcionalidades1` (`idFuncionalidad` ASC) VISIBLE,
  INDEX `fk_Funcionalidades_has_Perfil_Perfil1` (`idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionalidades_has_Perfil_Funcionalidades1`
    FOREIGN KEY (`idFuncionalidad`)
    REFERENCES `tallermotos`.`funcionalidades` (`idFuncionalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionalidades_has_Perfil_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `tallermotos`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
