-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `proveedor_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `telefono` INT NOT NULL,
  `fax` INT NULL,
  `nif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`proveedor_id`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `empleado_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`empleado_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`venta` (
  `venta_id` INT NOT NULL AUTO_INCREMENT,
  `empleado_empleado_id` INT NOT NULL,
  PRIMARY KEY (`venta_id`, `empleado_empleado_id`),
  INDEX `fk_venta_empleado1_idx` (`empleado_empleado_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_empleado1`
    FOREIGN KEY (`empleado_empleado_id`)
    REFERENCES `optica`.`empleado` (`empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`gafa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafa` (
  `gafa_id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `graduacion_cristal_1` FLOAT NOT NULL,
  `graduacion_cristal_2` FLOAT NOT NULL,
  `montura` ENUM("Flotante", "Pasta", "Metalica") NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_vidrio` VARCHAR(45) NOT NULL,
  `precio` FLOAT NULL,
  `proveedor_proveedor_id` INT NOT NULL,
  `venta_venta_id` INT NOT NULL,
  `venta_empleado_gafa_id` INT NOT NULL,
  PRIMARY KEY (`gafa_id`, `proveedor_proveedor_id`, `venta_venta_id`, `venta_empleado_gafa_id`),
  INDEX `fk_gafa_proveedor_idx` (`proveedor_proveedor_id` ASC) VISIBLE,
  INDEX `fk_gafa_venta1_idx` (`venta_venta_id` ASC, `venta_empleado_gafa_id` ASC) VISIBLE,
  CONSTRAINT `fk_gafa_proveedor`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gafa_venta1`
    FOREIGN KEY (`venta_venta_id` , `venta_empleado_gafa_id`)
    REFERENCES `optica`.`venta` (`venta_id` , `empleado_empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_registro` DATE NOT NULL,
  `empleado_cliente_id` INT NOT NULL,
  PRIMARY KEY (`cliente_id`, `empleado_cliente_id`),
  INDEX `fk_cliente_empleado1_idx` (`empleado_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_empleado1`
    FOREIGN KEY (`empleado_cliente_id`)
    REFERENCES `optica`.`empleado` (`empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`referido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`referido` (
  `referido_id` INT NOT NULL AUTO_INCREMENT,
  `referido_cliente_id` INT NOT NULL,
  PRIMARY KEY (`referido_id`),
  INDEX `fk_referido_cliente1_idx` (`referido_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_referido_cliente1`
    FOREIGN KEY (`referido_cliente_id`)
    REFERENCES `optica`.`cliente` (`cliente_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
