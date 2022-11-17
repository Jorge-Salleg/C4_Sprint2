-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tienda_virtual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tienda_virtual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda_virtual` DEFAULT CHARACTER SET utf8 ;
USE `tienda_virtual` ;

-- -----------------------------------------------------
-- Table `tienda_virtual`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`personas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` ENUM('TI', 'CC', 'CE') NULL,
  `documento` VARCHAR(12) NULL,
  `primer_nombre` VARCHAR(20) NULL,
  `segundo_nombre` VARCHAR(20) NULL,
  `primero_apellido` VARCHAR(20) NULL,
  `sugundo_apellido` VARCHAR(20) NULL,
  `correo` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `barrio` VARCHAR(45) NULL,
  `ciudad_id` INT NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`departamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo_postal` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`ciudades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo_postal` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `estado` BIT(1) NULL,
  `departamento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ciudades_departamentos`
    FOREIGN KEY (`departamento_id`)
    REFERENCES `tienda_virtual`.`departamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `contrasenia` VARCHAR(100) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`), 
  CONSTRAINT `fk_usuarios_personas1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `tienda_virtual`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`usuarios_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`usuarios_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarios_roles_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `tienda_virtual`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_roles_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `tienda_virtual`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`vistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`vistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `ruta` VARCHAR(200) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`vistas_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`vistas_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roles_id` INT NOT NULL,
  `vistas_id` INT NOT NULL,
  PRIMARY KEY (`id`), 
  CONSTRAINT `fk_vistas_roles_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `tienda_virtual`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vistas_roles_vistas1`
    FOREIGN KEY (`vistas_id`)
    REFERENCES `tienda_virtual`.`vistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(200) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(200) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`unidades_medidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`unidades_medidas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(200) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(200) NULL,
  `estado` BIT(1) NULL,
  `marca_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  `unidade_medida_id` INT NOT NULL,
  PRIMARY KEY (`id`), 
  CONSTRAINT `fk_productos_marcas1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `tienda_virtual`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `tienda_virtual`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_unidades_medidas1`
    FOREIGN KEY (`unidade_medida_id`)
    REFERENCES `tienda_virtual`.`unidades_medidas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`bodegas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`bodegas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `direccion` VARCHAR(200) NULL,
  `estado` BIT(1) NULL,
  `ciudad_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_bodegas_ciudades1`
    FOREIGN KEY (`ciudad_id`)
    REFERENCES `tienda_virtual`.`ciudades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`inventarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`inventarios` (
  `id` INT NOT NULL,
  `valor_compra` DOUBLE NULL,
  `valor_venta` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `descuento` DOUBLE NULL,
  `cantidad_stock` DOUBLE NULL,
  `cantidad_minima` DOUBLE NULL,
  `cantidad_maxima` DOUBLE NULL,
  `producto_id` INT NOT NULL,
  `bodegas_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_inventarios_productos1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `tienda_virtual`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_bodegas1`
    FOREIGN KEY (`bodegas_id`)
    REFERENCES `tienda_virtual`.`bodegas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `estado` BIT(1) NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_clientes_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tienda_virtual`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`facturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_factura` VARCHAR(45) NULL,
  `valor_bruto` DOUBLE NULL,
  `valor_neto` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `descuento` DOUBLE NULL,
  `estado_pago` BIT(1) NULL,
  `estado` BIT(1) NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `tienda_virtual`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda_virtual`.`detalles_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`detalles_facturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor_bruto` DOUBLE NULL,
  `valor_neto` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `descuento` DOUBLE NULL,
  `cantidad` INT NULL,
  `factura_id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_detalles_facturas_facturas1`
    FOREIGN KEY (`factura_id`)
    REFERENCES `tienda_virtual`.`facturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_facturas_productos1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `tienda_virtual`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
