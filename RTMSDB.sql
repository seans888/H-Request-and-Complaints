-- MySQL Script generated by MySQL Workbench
-- 10/25/17 20:46:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema rtmsdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rtmsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rtmsdb` DEFAULT CHARACTER SET utf8 ;
USE `rtmsdb` ;

-- -----------------------------------------------------
-- Table `rtmsdb`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`guest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roomno` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`check_in` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `check_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guest_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_in_guest_idx` (`guest_id` ASC),
  INDEX `fk_check_in_room1_idx` (`room_id` ASC),
  CONSTRAINT `fk_check_in_guest`
    FOREIGN KEY (`guest_id`)
    REFERENCES `rtmsdb`.`guest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_in_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `rtmsdb`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_employee_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `rtmsdb`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `escalation_time` TIME NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_category_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `rtmsdb`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `check_in_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `employee_responsible_id` INT NOT NULL,
  `employee_create_id` INT NOT NULL,
  `level` INT NOT NULL,
  `description` TEXT NOT NULL,
  `time_open` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_close` DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00',
  `status` VARCHAR(10) NOT NULL DEFAULT 'Open',
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_check_in1_idx` (`check_in_id` ASC),
  INDEX `fk_ticket_category1_idx` (`category_id` ASC),
  INDEX `fk_ticket_employee1_idx` (`employee_create_id` ASC),
  INDEX `fk_ticket_employee2_idx` (`employee_responsible_id` ASC),
  CONSTRAINT `fk_ticket_check_in1`
    FOREIGN KEY (`check_in_id`)
    REFERENCES `rtmsdb`.`check_in` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `rtmsdb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_employee1`
    FOREIGN KEY (`employee_create_id`)
    REFERENCES `rtmsdb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_employee2`
    FOREIGN KEY (`employee_responsible_id`)
    REFERENCES `rtmsdb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rtmsdb`.`transcript`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rtmsdb`.`transcript` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transcript_ticket1_idx` (`ticket_id` ASC),
  CONSTRAINT `fk_transcript_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `rtmsdb`.`ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
