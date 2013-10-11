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
  `date_create` DATE NOT NULL,
  `page_numbers` VARCHAR(10) NULL,
  `file_url` VARCHAR(255) NOT NULL,
  `file_type` VARCHAR(45) NOT NULL DEFAULT 'pdf',
  PRIMARY KEY (`id_document`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`requests` (
  `id_request` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `id_document` INT NOT NULL,
  `id_category` INT NOT NULL,
  `id_dependecy` INT NOT NULL DEFAULT 0,
  `other_dependency` VARCHAR(100) NULL,
  `name` VARCHAR(255) NULL,
  `short_name` VARCHAR(255) NULL,
  `slug` VARCHAR(255) NULL,
  `folio` VARCHAR(55) NULL,
  `question` TEXT NULL,
  `description` TEXT NULL,
  `keywords` VARCHAR(255) NULL,
  `date_published` DATE NOT NULL,
  `date_limit` DATE NULL,
  `date_last_modified` DATE NULL,
  `date_answer` DATE NULL,
  PRIMARY KEY (`id_request`))
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
  `short_name` VARCHAR(255) NULL,
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
  `name` VARCHAR(255) NULL,
  `short_name` VARCHAR(255) NULL,
  `slug` VARCHAR(255) NULL,
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


-- -----------------------------------------------------
-- Table `mydb`.`dependencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dependencies` (
  `id_dependecy` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `short_name` VARCHAR(255) NULL,
  `slug` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `address` VARCHAR(100) NULL,
  `type` VARCHAR(10) NOT NULL DEFAULT 'federal',
  PRIMARY KEY (`id_dependecy`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aditional_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aditional_information` (
  `id_aditional` INT NOT NULL AUTO_INCREMENT,
  `id_request` INT NOT NULL,
  `date_request` DATE NULL,
  `request` TEXT NULL,
  `response` TEXT NULL,
  `date_response` DATE NULL,
  `date_limit` DATE NULL,
  PRIMARY KEY (`id_aditional`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`responses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`responses` (
  `id_response` INT NOT NULL AUTO_INCREMENT,
  `id_request` INT NOT NULL,
  `id_type_answer` INT NULL,
  `answer` TEXT NULL,
  `id_quality` INT NULL COMMENT '1 Completa\n2 Legible\n3 Formato Abierto\n\n4 Incompleta\n5 Ilegible\n6 No es lo solicita\n7 En formato no accesible',
  `information_delivery` INT NOT NULL DEFAULT 3 COMMENT '1 Consulta directa\n2 Formato fisico\n3 Formato electronico',
  `process_ifai` INT NOT NULL DEFAULT 1 COMMENT '1 En proceso\n2 Concluida\n3 No aplica',
  PRIMARY KEY (`id_response`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`documents_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`documents_types` (
  `id_type_document` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_type_document`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answers_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`answers_types` (
  `id_type_answer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_type_answer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reviews` (
  `id_review` INT NOT NULL AUTO_INCREMENT,
  `id_request` INT NOT NULL,
  `date` DATE NULL,
  `date_limit` DATE NULL,
  `description` VARCHAR(255) NULL COMMENT 'Acto que se recurrió',
  PRIMARY KEY (`id_review`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`allegations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`allegations` (
  `id_allegation` INT NOT NULL AUTO_INCREMENT,
  `id_request` INT NOT NULL,
  `allegation` TEXT NULL,
  `description` VARCHAR(255) NULL COMMENT 'A que ponencia fue enviada',
  `date` DATE NULL,
  PRIMARY KEY (`id_allegation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`resolutions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resolutions` (
  `id_resolution` INT NOT NULL AUTO_INCREMENT,
  `id_request` INT NOT NULL,
  `id_type_resolution` INT NOT NULL COMMENT '1 Confirma\n2 Modifica\n3 Revoca\n4 Desecha\n5 Sobresee',
  `date_notification` DATE NULL,
  `date` DATE NULL,
  `resource` VARCHAR(45) NULL COMMENT 'Ponencia que procesó el recurso',
  `resource_number` VARCHAR(45) NULL,
  `file_url` VARCHAR(255) NULL,
  `id_document` INT NULL,
  PRIMARY KEY (`id_resolution`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cumplimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cumplimiento` (
  `id_cumplimiento` INT NOT NULL AUTO_INCREMENT,
  `id_request` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT false,
  `date` DATE NULL,
  `description` VARCHAR(255) NULL COMMENT 'Modalidad de entrega de la información',
  PRIMARY KEY (`id_cumplimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`keywords` (
  `id_keyword` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_keyword`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`keywords2requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`keywords2requests` (
  `id_keyword` INT NOT NULL,
  `id_request` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`keywords2documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`keywords2documents` (
  `id_keyword` INT NOT NULL,
  `id_document` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`quality` (
  `id_quality` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id_quality`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`resolutions_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resolutions_type` (
  `id_resolution_type` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id_resolution_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`responses2documentstypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`responses2documentstypes` (
  `id_response` INT NOT NULL,
  `id_type_document` INT NOT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
