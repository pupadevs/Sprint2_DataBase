-- MySQL Script generated by MySQL Workbench
-- Sun Jul 16 23:17:29 2023
-- Model: New Model    Version: 1.0
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
-- Table `optica`.`provedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`provedor` (
  `idprovedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NOT NULL,
  `Calle` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(6) NOT NULL,
  `puerta` VARCHAR(6) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` INT NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefono` INT NULL,
  `fax` INT NULL DEFAULT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprovedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `idmarca` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(65) NOT NULL,
  `idprovedor` INT NOT NULL,
  PRIMARY KEY (`idmarca`),
  INDEX `fk_id_provedor_idx` (`idprovedor` ASC) VISIBLE,
  CONSTRAINT `fk_id_provedor`
    FOREIGN KEY (`idprovedor`)
    REFERENCES `optica`.`provedor` (`idprovedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `idgafas` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `graduacion_R` DOUBLE NOT NULL,
  `graduacion_L` DOUBLE NOT NULL,
  `montura` ENUM('flotante', 'pasta', 'metalica') NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_crisal_R` VARCHAR(45) NOT NULL,
  `color_cristal_L` VARCHAR(45) NOT NULL,
  `idmarca` INT NOT NULL,
  PRIMARY KEY (`idgafas`),
  INDEX `fk_id_marca_idx` (`idmarca` ASC) VISIBLE,
  CONSTRAINT `fk_id_marca`
    FOREIGN KEY (`idmarca`)
    REFERENCES `optica`.`marca` (`idmarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(85) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `telefono` INT NULL,
  `correo_electronico` VARCHAR(105) NULL,
  `fecha_registro` DATE NULL,
  `cliente_recomendado` INT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_cliente_cliente1_idx` (`cliente_recomendado` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_cliente1`
    FOREIGN KEY (`cliente_recomendado`)
    REFERENCES `optica`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `idempleado` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `idgafas` INT NOT NULL,
  PRIMARY KEY (`idventas`),
  INDEX `fk_id_empleado_idx` (`idempleado` ASC) VISIBLE,
  INDEX `fk_id_cliente_idx` (`idcliente` ASC) VISIBLE,
  INDEX `fk_id_gafas_idx` (`idgafas` ASC) VISIBLE,
  CONSTRAINT `fk_id_empleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `optica`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `optica`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_gafas`
    FOREIGN KEY (`idgafas`)
    REFERENCES `optica`.`gafas` (`idgafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `optica` ;

-- -----------------------------------------------------
-- Placeholder table for view `optica`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `optica`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`view1`;
USE `optica`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
