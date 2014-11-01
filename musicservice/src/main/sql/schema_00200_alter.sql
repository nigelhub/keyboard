SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `music_service`.`user` ADD COLUMN `username` VARCHAR(45) NOT NULL  AFTER `password` , ADD COLUMN `level_completed` VARCHAR(45) NULL DEFAULT NULL  AFTER `username` , CHANGE COLUMN `password` `password` VARCHAR(45) NOT NULL  
, ADD UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) 
, ADD UNIQUE INDEX `userName_UNIQUE` (`username` ASC) ;

CREATE  TABLE IF NOT EXISTS `music_service`.`quiz` (
  `quiz_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `level_id` INT(11) NOT NULL ,
  `quiz_name` VARCHAR(45) NULL DEFAULT NULL ,
  `instrument_aide` TINYINT(1) NOT NULL ,
  `quiz_description` TEXT NOT NULL ,
  PRIMARY KEY (`quiz_id`) ,
  UNIQUE INDEX `quiz_id_UNIQUE` (`quiz_id` ASC) ,
  INDEX `fk_quiz_level_id_idx` (`level_id` ASC) ,
  CONSTRAINT `fk_quiz_level_id`
    FOREIGN KEY (`level_id` )
    REFERENCES `music_service`.`level` (`level_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial` (
  `tutorial_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `level_id` INT(11) NOT NULL ,
  `tutorial_name` VARCHAR(45) NOT NULL ,
  `instrument_aide` TINYINT(1) NULL DEFAULT NULL ,
  `tutorial_description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`tutorial_id`) ,
  UNIQUE INDEX `quiz_id_UNIQUE` (`tutorial_id` ASC) ,
  INDEX `fk_tutorial_level_id_idx` (`level_id` ASC) ,
  CONSTRAINT `fk_tutorial_level_id`
    FOREIGN KEY (`level_id` )
    REFERENCES `music_service`.`level` (`level_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial_page` (
  `tutorial_page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tutorial_id` INT(11) NOT NULL ,
  `tutorial_name` VARCHAR(45) NOT NULL ,
  `sequence_id` INT(11) NOT NULL ,
  `tutorial_type` VARCHAR(45) NULL DEFAULT NULL ,
  `tutorial_text` VARCHAR(45) NULL DEFAULT NULL ,
  `tutorial_image` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tutorial_page_id`, `tutorial_id`) ,
  UNIQUE INDEX `verse_id_UNIQUE` (`tutorial_page_id` ASC) ,
  INDEX `fk_Tutorial_ScriptItems_Tutorial1` (`tutorial_id` ASC) ,
  CONSTRAINT `fk_Tutorial_ScriptItems_Tutorial1`
    FOREIGN KEY (`tutorial_id` )
    REFERENCES `music_service`.`tutorial` (`tutorial_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`demo` (
  `demo_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `demo_level` INT(11) NOT NULL ,
  `demo_name` VARCHAR(45) NOT NULL ,
  `demo_description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`demo_id`) ,
  UNIQUE INDEX `quiz_id_UNIQUE` (`demo_id` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`demo_note` (
  `demo_note_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `demo_id` INT(11) NOT NULL ,
  `note_display` VARCHAR(45) NOT NULL ,
  `note_key` VARCHAR(45) NOT NULL ,
  `note_duration` INT(11) NOT NULL ,
  `note_delay` INT(11) NULL DEFAULT NULL ,
  `sequence_id` INT(11) NOT NULL ,
  PRIMARY KEY (`demo_note_id`, `demo_id`) ,
  UNIQUE INDEX `verse_id_UNIQUE` (`demo_note_id` ASC) ,
  INDEX `fk_Note_ScriptItems_Demo1` (`demo_id` ASC) ,
  CONSTRAINT `fk_Note_ScriptItems_Demo1`
    FOREIGN KEY (`demo_id` )
    REFERENCES `music_service`.`demo` (`demo_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`question` (
  `question_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `quiz_id` INT(11) NOT NULL ,
  `question_name` VARCHAR(45) NOT NULL ,
  `sequence_id` INT(11) NOT NULL ,
  `question_type` VARCHAR(45) NULL DEFAULT NULL ,
  `qustion_text` TEXT NULL DEFAULT NULL ,
  `question_image` VARCHAR(45) NULL DEFAULT NULL ,
  `answer` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`question_id`, `quiz_id`) ,
  UNIQUE INDEX `verse_id_UNIQUE` (`question_id` ASC) ,
  INDEX `fk_Quiz_ScriptItems_Quiz1` (`quiz_id` ASC) ,
  UNIQUE INDEX `unique_quiz_id_sequence` (`quiz_id` ASC, `sequence_id` ASC) ,
  CONSTRAINT `fk_Quiz_ScriptItems_Quiz1`
    FOREIGN KEY (`quiz_id` )
    REFERENCES `music_service`.`quiz` (`quiz_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`quiz_instance` (
  `quiz_instance_id` INT(11) NOT NULL ,
  `quiz_id` INT(11) NOT NULL ,
  `user_id` INT(11) NULL DEFAULT NULL ,
  `score` INT(11) NULL DEFAULT NULL ,
  `grade` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`quiz_instance_id`) ,
  INDEX `fk_quiz_id_idx` (`quiz_id` ASC) ,
  INDEX `fk_quiz_user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_quiz_id`
    FOREIGN KEY (`quiz_id` )
    REFERENCES `music_service`.`quiz` (`quiz_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `music_service`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial_status` (
  `tutorial_status_id` INT(11) NOT NULL ,
  `user_id` INT(11) NULL DEFAULT NULL ,
  `tutorial_id` INT(11) NULL DEFAULT NULL ,
  `status` VARCHAR(45) NULL DEFAULT NULL ,
  INDEX `fk_tutorial_id_idx` (`tutorial_id` ASC) ,
  INDEX `fk_tutorial_status_user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_tutorial_id`
    FOREIGN KEY (`tutorial_id` )
    REFERENCES `music_service`.`tutorial` (`tutorial_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tutorial_status_user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `music_service`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `music_service`.`level` (
  `level_id` INT(11) NOT NULL ,
  `level_number` INT(11) NOT NULL ,
  `level_description` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`level_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
