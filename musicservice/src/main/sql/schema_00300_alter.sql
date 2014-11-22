SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;

USE `mydb`;

ALTER TABLE `music_service`.`demo_note` DROP FOREIGN KEY `fk_4c9abd9a-6d40-11e4-b4b3-00173fc3a31c` ;

ALTER TABLE `music_service`.`question` DROP FOREIGN KEY `fk_4c9adb5e-6d40-11e4-b4b3-00173fc3a31c` ;

ALTER TABLE `music_service`.`tutorial` CHANGE COLUMN `tutorial_description` `tutorial_description` TEXT NOT NULL  ;

ALTER TABLE `music_service`.`tutorial_page` CHANGE COLUMN `tutorial_text` `tutorial_text` TEXT NULL DEFAULT NULL  ;

ALTER TABLE `music_service`.`demo_note` 
  ADD CONSTRAINT `fk_{04B99A73-C897-4E5D-A996-81165A25FB3F}`
  FOREIGN KEY (`demo_id` )
  REFERENCES `music_service`.`demo` (`demo_id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `fk_{04B99A73-C897-4E5D-A996-81165A25FB3F}` (`demo_id` ASC) 
, DROP INDEX `fk_4c9abd9a-6d40-11e4-b4b3-00173fc3a31c` ;

ALTER TABLE `music_service`.`question` 
  ADD CONSTRAINT `fk_{FEE25730-831E-4AD5-BA06-24ED7063840F}`
  FOREIGN KEY (`quiz_id` )
  REFERENCES `music_service`.`quiz` (`quiz_id` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `fk_{FEE25730-831E-4AD5-BA06-24ED7063840F}` (`quiz_id` ASC) 
, DROP INDEX `fk_4c9adb5e-6d40-11e4-b4b3-00173fc3a31c` ;

CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial_page_responses` (
  `tutorial_page_responses_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tutorial_page_response` VARCHAR(45) NOT NULL ,
  `tutorial_page_response_sequence_id` INT(11) NOT NULL ,
  `tutorial_page_tutorial_page_id` INT(11) NOT NULL ,
  PRIMARY KEY (`tutorial_page_responses_id`, `tutorial_page_tutorial_page_id`) ,
  UNIQUE INDEX `tutorial_page_responses_id_UNIQUE` (`tutorial_page_responses_id` ASC) ,
  INDEX `fk_tutorial_page_responses_tutorial_page1` (`tutorial_page_tutorial_page_id` ASC) ,
  CONSTRAINT `fk_tutorial_page_responses_tutorial_page1`
    FOREIGN KEY (`tutorial_page_tutorial_page_id` )
    REFERENCES `music_service`.`tutorial_page` (`tutorial_page_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
