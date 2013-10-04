SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`documents` (
  `id_document` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `short_name` VARCHAR(45) NULL,
  `keywords` TEXT NULL,
  PRIMARY KEY (`id_document`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inquiries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inquiries` (
  `id_inquirie` INT NOT NULL AUTO_INCREMENT,
  `id_document` INT NOT NULL,
  `id_category` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `short_name` VARCHAR(255) NULL,
  `slug` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `keywords` TEXT NULL,
  `date_published` DATE NOT NULL,
  `date_limit` DATE NULL,
  `date_last_modified` DATE NULL,
  PRIMARY KEY (`id_inquirie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `slug` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`organizations` (
  `id_organization` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id_organization`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `id_organization` INT NOT NULL,
  `id_area` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NULL,
  `type` VARCHAR(45) NOT NULL DEFAULT 'normal',
  `date_create` TIME NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`areas` (
  `id_area` INT NOT NULL AUTO_INCREMENT,
  `id_organization` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `slug` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id_area`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
