SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `music_service` DEFAULT CHARACTER SET latin1 ;
USE `music_service` ;

-- -----------------------------------------------------
-- Table `music_service`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `first` VARCHAR(45) NOT NULL ,
  `last` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `level_completed` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) ,
  UNIQUE INDEX `userName_UNIQUE` (`username` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`db_version`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`db_version` (
  `db_version_id` INT NOT NULL AUTO_INCREMENT ,
  `version` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(75) NOT NULL ,
  PRIMARY KEY (`db_version_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`level`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`level` (
  `level_id` INT NOT NULL AUTO_INCREMENT ,
  `level_number` INT NOT NULL ,
  `level_description` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`level_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`quiz`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`quiz` (
  `quiz_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `level_id` INT(11) NOT NULL ,
  `quiz_name` VARCHAR(45) NULL DEFAULT NULL ,
  `instrument_aide` TINYINT(1) NULL DEFAULT NULL ,
  `quiz_description` TEXT NOT NULL ,
  PRIMARY KEY (`quiz_id`) ,
  UNIQUE INDEX `quiz_id_UNIQUE` (`quiz_id` ASC) ,
  INDEX `fk_quiz_level_id_idx` (`level_id` ASC) ,
  CONSTRAINT `fk_quiz_level_id`
    FOREIGN KEY (`level_id` )
    REFERENCES `music_service`.`level` (`level_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`tutorial`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial` (
  `tutorial_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `level_id` INT(11) NOT NULL ,
  `tutorial_name` VARCHAR(45) NOT NULL ,
  `instrument_aide` TINYINT(1) NULL DEFAULT NULL ,
  `tutorial_description` TEXT NOT NULL ,
  PRIMARY KEY (`tutorial_id`) ,
  UNIQUE INDEX `quiz_id_UNIQUE` (`tutorial_id` ASC) ,
  INDEX `fk_tutorial_level_id_idx` (`level_id` ASC) ,
  CONSTRAINT `fk_tutorial_level_id`
    FOREIGN KEY (`level_id` )
    REFERENCES `music_service`.`level` (`level_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`tutorial_page`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial_page` (
  `tutorial_page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tutorial_id` INT(11) NOT NULL ,
  `tutorial_name` VARCHAR(45) NOT NULL ,
  `sequence_id` INT(11) NOT NULL ,
  `tutorial_type` VARCHAR(45) NULL DEFAULT NULL ,
  `tutorial_text` TEXT NULL DEFAULT NULL ,
  `tutorial_image` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tutorial_page_id`, `tutorial_id`) ,
  UNIQUE INDEX `verse_id_UNIQUE` (`tutorial_page_id` ASC) ,
  INDEX `fk_Tutorial_ScriptItems_Tutorial1` (`tutorial_id` ASC) ,
  CONSTRAINT `fk_Tutorial_ScriptItems_Tutorial1`
    FOREIGN KEY (`tutorial_id` )
    REFERENCES `music_service`.`tutorial` (`tutorial_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`demo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`demo` (
  `demo_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `demo_level` INT(11) NOT NULL ,
  `demo_name` VARCHAR(45) NOT NULL ,
  `demo_description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`demo_id`) ,
  UNIQUE INDEX `quiz_id_UNIQUE` (`demo_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`demo_note`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`demo_note` (
  `demo_note_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `demo_id` INT(11) NOT NULL ,
  `note_display` VARCHAR(45) NOT NULL ,
  `note_key` VARCHAR(45) NOT NULL ,
  `note_duration` VARCHAR(45) NOT NULL ,
  `note_delay` VARCHAR(45) NULL DEFAULT NULL ,
  `sequence_id` INT(11) NOT NULL ,
  PRIMARY KEY (`demo_note_id`, `demo_id`) ,
  INDEX `fk_{04B99A73-C897-4E5D-A996-81165A25FB3F}` (`demo_id` ASC) ,
  CONSTRAINT `fk_{04B99A73-C897-4E5D-A996-81165A25FB3F}`
    FOREIGN KEY (`demo_id` )
    REFERENCES `music_service`.`demo` (`demo_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`question`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`question` (
  `question_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `quiz_id` INT(11) NOT NULL ,
  `question_name` VARCHAR(45) NOT NULL ,
  `sequence_id` INT(11) NOT NULL ,
  `question_type` VARCHAR(45) NULL DEFAULT NULL ,
  `question_text` TEXT NULL DEFAULT NULL ,
  `question_image` VARCHAR(45) NULL DEFAULT NULL ,
  `answer` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`question_id`, `quiz_id`) ,
  INDEX `fk_{FEE25730-831E-4AD5-BA06-24ED7063840F}` (`quiz_id` ASC) ,
  CONSTRAINT `fk_{FEE25730-831E-4AD5-BA06-24ED7063840F}`
    FOREIGN KEY (`quiz_id` )
    REFERENCES `music_service`.`quiz` (`quiz_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`quiz_instance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`quiz_instance` (
  `quiz_instance_id` INT NOT NULL ,
  `quiz_id` INT NOT NULL ,
  `user_id` INT NULL DEFAULT NULL ,
  `score` INT NULL DEFAULT NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`tutorial_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial_status` (
  `tutorial_status_id` INT NOT NULL ,
  `user_id` INT NULL DEFAULT NULL ,
  `tutorial_id` INT NULL DEFAULT NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`tutorial_page_responses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `music_service`.`tutorial_page_responses` (
  `tutorial_page_responses_id` INT NOT NULL AUTO_INCREMENT ,
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
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Data for table `music_service`.`db_version`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`db_version` (`db_version_id`, `version`, `description`) VALUES (1, '1.0', 'Added user table and db_version table.');
INSERT INTO `music_service`.`db_version` (`db_version_id`, `version`, `description`) VALUES (2, '2.0', 'Added core tables for entire projet.');
INSERT INTO `music_service`.`db_version` (`db_version_id`, `version`, `description`) VALUES (3, '3.0', 'Added tutorial, tutorial_pages, and tutorial_page_responses table.');
INSERT INTO `music_service`.`db_version` (`db_version_id`, `version`, `description`) VALUES (3, '4.0', 'Modified note duration to be a varchar. Lower cased music notes. Tweaked one tutorial page statement.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`, `username`, `level_completed`) VALUES (NULL, 'Nigel', 'Stuart', 'nstuart@bu.edu', 'admin', 'password', 'nigel', '0');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`, `username`, `level_completed`) VALUES (NULL, 'Ana', 'Beglova', 'abeglova@gmail.com', 'admin', 'password', 'ana', '0');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`, `username`, `level_completed`) VALUES (NULL, 'Jon', 'Kelley', 'jk214north@gmail.com', 'admin', 'password', 'jon', '0');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`, `username`, `level_completed`) VALUES (NULL, 'Hieu', 'Tang', 'hqtran@bu.edu', 'admin', 'password', 'hieu', '0');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`, `username`, `level_completed`) VALUES (NULL, 'Chris', 'Wright', 'valtera45@gmail.com', 'admin', 'password', 'chris', '0');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`level`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 1, 'Learn when to use your right and left hand to play a note.');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 2, 'Learn how to understand the lines in a note.');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 3, 'Learn about all the variations of the C4 note.');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 4, 'Learn about the D4 and E4 notes.');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 5, 'Learn about the F4 and G4 notes');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 6, 'Learn about the B4, A4 and G3 notes.');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 7, 'Learn about the D#4, F#4, G#4 and C#4 notes.');
INSERT INTO `music_service`.`level` (`level_id`, `level_number`, `level_description`) VALUES (NULL, 8, 'The grand finale! Put all the items you have learned together and play a song!');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`quiz`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 1, 'Quiz 1', NULL, 'Quiz on notes learned in Tutorial 1.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 2, 'Quiz 2', NULL, 'Quiz on notes learned in tutorial 2.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 3, 'Quiz 3', NULL, 'Quiz on notes learned in tutorial 3.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 4, 'Quiz 4', NULL, 'Quiz on notes learned in tutorial 4.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 5, 'Quiz 5', NULL, 'Quiz on notes learned in tutorial 5.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 6, 'Quiz 6', NULL, 'Quiz on notes learned in tutorial 6.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 7, 'Quiz 7', NULL, 'Quiz on notes learned in tutorial 7.');
INSERT INTO `music_service`.`quiz` (`quiz_id`, `level_id`, `quiz_name`, `instrument_aide`, `quiz_description`) VALUES (NULL, 8, 'Quiz 8', NULL, 'Quiz on notes leanred in tutorial 8.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`demo`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`demo` (`demo_id`, `demo_level`, `demo_name`, `demo_description`) VALUES (NULL, 1, 'Happy Birthday', 'Guide to playing Happy Birthday song.');
INSERT INTO `music_service`.`demo` (`demo_id`, `demo_level`, `demo_name`, `demo_description`) VALUES (NULL, 2, 'Row Row Row Your Boat', 'Guide to playing Row Row Row Your Boat song.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`question`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 1', 1, 'multiple_choice', 'Which hand is circled? The right or left?', 'Quizzes_Level1_1.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 2', 2, 'multiple_choice', 'Which hand is circled? The right or left?', 'Quizzes_Level1_2.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 3', 3, 'multiple_choice', 'Which hand is circled? The right or left?', 'Quizzes_Level1_3.png', 'Left');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 4', 4, 'multiple_choice', 'Which hand is circled? The right or left?', 'Quizzes_Level1_4.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 5, 'multiple_choice', 'Which hand is circled? The right or left?', 'Quizzes_Level1_5.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 1!', '', '');



INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 1', 1, 'multiple_choice', 'What line number is highlighted in the Treble Clef?', 'Quizzes_Level2_1.png', '1');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 2', 2, 'multiple_choice', 'What line number is highlighted in the Bass Clef?', 'Quizzes_Level2_2.png', '2');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 3', 3, 'multiple_choice', 'What line number is highlighted in the Treble Clef?', 'Quizzes_Level2_3.png', '4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 4', 4, 'multiple_choice', 'What line number is highlighted in the Treble Clef?', 'Quizzes_Level2_4.png', '3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 5', 5, 'multiple_choice', 'What line number is hightlighted in the Bass Clef?', 'Quizzes_Level2_5.png', '5');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 2!', '', '');


INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_1.png', 'c4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_2.png', 'c4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 3', 3, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_3.png', 'c4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 4', 4, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_4.png', 'c4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 5', 5, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_5.png', 'c4 c4 c4 c4 c4 c4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 3!', '', '');


INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_1.png', 'd4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_2.png', 'e4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 3', 3, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_3.png', 'd4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 4', 4, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_4.png', 'd4 e4 d4 c4 d4 e4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 5, 'done', 'You have completed quiz 4!', '', '');


INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level5_1.png', 'f4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level5_2.png', 'g4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 3', 3, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level5_3.png', 'g4 g4 f4 f4 g4 g4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level5_4.png', 'c4 c4 e4 e4 f4 f4 g4 g4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level5_5.png', 'c4 d4 e4 f4 g4 f4 e4 d4 c4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 5!', '', '');

INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level6_1.png', 'b4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level6_2.png', 'a4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 3', 3, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level6_3.png', 'g3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level6_4.png', 'b4 a4 g3 "b4 a4 g3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level6_5.png', 'c4 b4 a4 b4 c4 a4 g3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 6!', '', '');


INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 1', 1, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_1.png', 'dsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 2', 2, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_2.png', 'fsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 3', 3, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_3.png', 'gsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_4.png', 'csharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_5.png', 'csharp4 fsharp4 gsharp4 csharp4 gsharp4 dsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 7!', '', '');


INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 1', 1, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_1.png', 'asharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 2', 2, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_2.png', 'gsharp3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 3', 3, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_3.png', 'b4 gsharp3 asharp4 csharp4 b4 asharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_4.png', 'csharp4 csharp4 csharp4 b4 asharp4 gsharp3 asharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_5.png', 'gsharp3 asharp4 b4 csharp4 dsharp4 fsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 6, 'done', 'You have completed quiz 8!', '', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `music_service`.`demo_note`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;


-- -----------------------------------------------------
-- Data for Happy Birthday Demo
-- -----------------------------------------------------
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.125', '1');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.125', '2');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'D',  'd4',        '0.25',  '3');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.25',  '4');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'f4',        '0.25',  '5');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'E',  'e4',        '0.5',   '6');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.125', '7');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.125', '8');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'D',  'd4',        '0.25',  '9');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.25',  '10');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'G',  'g4',        '0.25',  '11');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'f4',        '0.5',   '12');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.125', '13');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c4',        '0.125', '14');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'c5',        '0.25',  '15');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A',  'a5',        '0.25',  '16');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'f4',        '0.25',  '17');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'E',  'e4',        '0.25',  '18');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'D',  'd4',        '0.25',  '19');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A#', 'asharp5',   '0.125', '20');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A#', 'asharp5',   '0.125', '21');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A',  'a5',        '0.25',  '22');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'f4',        '0.25',  '23');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'G',  'g4',        '0.25',  '24');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'f4',        '0.5',   '25');




-- -----------------------------------------------------
-- Data for Row Row Row Your Boat Demo
-- -----------------------------------------------------
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.375',  '1');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.375',  '2');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.25',   '3');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'D', 'd4', '0.125',  '4');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.375',  '5');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.25',   '6');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'D', 'd4', '0.125',  '7');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.25',   '8');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'F', 'f4', '0.125',  '9');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'g4', '0.75',  '10');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c5', '0.125', '11');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c5', '0.125', '12');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c5', '0.125', '13');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'g4', '0.125', '14');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'g4', '0.125', '15');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'g4', '0.125', '16');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.125', '17');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.125', '18');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.125', '19');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.125', '20');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.125', '21');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.125', '22');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'g4', '0.25',  '23');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'F', 'f4', '0.125', '24');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'e4', '0.25',  '25');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'D', 'd4', '0.125', '26');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'c4', '0.75',  '27');



COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`tutorial`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (1, 1, 'Level 1 Tutorial', 0, 'This is the first tutorial and is a great place to start.');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (2, 2, 'Level 2 Tutorial', 0, 'This is the second tutorial and should not be started until the first tutorial is completed..');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (3, 3, 'Level 3 Tutorial', 0, 'This is the third tutorial and should not be started until the second tutorial is completed..');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (4, 4, 'Level 4 Tutorial', 0, 'This is the fourth tutorial and should not be started until the third tutorial is completed..');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (5, 5, 'Level 5 Tutorial', 0, 'This is the fifth tutorial and should not be started until the fourth tutorial is completed..');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (6, 6, 'Level 6 Tutorial', 0, 'This is the sixth tutorial and should not be started until the fifth tutorial is completed..');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (7, 7, 'Level 7 Tutorial', 0, 'This is the seventh tutorial and should not be started until the sixth tutorial is completed..');
INSERT INTO `music_service`.`tutorial` (`tutorial_id`, `level_id`, `tutorial_name`, `instrument_aide`, `tutorial_description`) VALUES (8, 8, 'Level 8 Tutorial', 0, 'This is the eighth tutorial and should not be started until the seventh tutorial is completed..');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`tutorial_page`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (1, 1, 'Grand Staff', 1, 'press_continue', 'This is the grand staff.  The grand staff displays what notes to play on the piano!  It is broken into two seperate staves each with five lines.', 'Tutorial_Level1_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (2, 1, 'Right Hand Note Placement', 2, 'press_continue', 'The red circle shows where notes to be played with the right hand to go.  The blue circle is the Treble Clef.  It is also called the G Clef.  Just remember that the top five lines include notes to be played with the right hand.', 'Tutorial_Level1_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (3, 1, 'Left Hand Note Placement', 3, 'press_continue', 'The blue circle shows the Basss Clef.  it is also called the F Clef.  All notes in this space are played with the left hand.', 'Tutorial_Level1_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (4, 1, 'Left and Right Hand Note Placement', 4, 'press_continue', 'The top five lines are for right hand notes and the bottom five lines are for left hand notes!', 'Tutorial_Level1_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (5, 2, 'Stave Lines', 1, 'press_continue', 'There are five lines in each stave.  These lines can have notes.', 'Tutorial_Level2_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (6, 2, 'Line Notes', 2, 'press_continue', 'These are called line notes because the circle of each note falls on a line.  Each note also has a stem, like a cherry or an apple!  The stem points up when below the third line and points down when above the third line.', 'Tutorial_Level2_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (7, 2, 'Space Notes', 3, 'press_continue', 'There can also be space notes.  These are notes that fall in between the lines.  There are four space notes in each stave.', 'Tutorial_Level2_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (8, 2, 'More Space Notes', 4, 'press_continue', 'There can also be space notes.  These are notes that fall in between the lines.  There are a total of four space notes in each stave.', 'Tutorial_Level2_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (9, 2, 'Invisible Line', 5, 'press_continue', 'You can also pretend that there is an invisible line in between the two staves.  This will be useful later!', 'Tutorial_Level2_5.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (10, 3, 'Middle C', 1, 'press_continue', 'This is the first note that people learn to read and play on the piano.  The line through the note comes from the invisible line we saw earlier that devides the two staves.', 'Tutorial_Level3_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (11, 3, 'Left Middle C ', 2, 'press_continue', 'This is the same physical note on the piano.  Here the note is closer to the Bass Clef, though.  This means that the left hand will play the note instead of  the right hand.', 'Tutorial_Level3_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (12, 3, 'Six Middle C Notes', 3, 'press_key', 'Here there are 6 middle C notes in a row.  The first three should be played with the right hand, and the last three should be played with the left hand on a real piano.', 'Tutorial_Level3_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (13, 4, 'D Note', 1, 'press_key', 'This a new note, D!  This note is right below the 1st line on the Treble Clef.  You should play this note with your right hand on a real piano.  The key is highlighted below, click the key or press \'D\' on your computer keyboard to move on.', 'Tutorial_Level4_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (14, 4, 'E Note', 2, 'press_key', 'This a new note, E!  This note is on the 1st line on the Treble Clef.  You should play this note with your right hand.  Press the key or press \'E\' on your computer keyboard to hear the note.', 'Tutorial_Level4_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (15, 4, 'Changing Note', 3, 'press_continue', 'Here, the example starts with a \'D\' note.  The arrows show that the note is changing.  The second note is an \'E\'.', 'Tutorial_Level4_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (16, 5, 'F Note', 1, 'press_key', 'Here is a new note, F!  It is in the 1st space of the Treble Clef.  This key is highlighted on the piano.  Click the key or press the \'F\' key on your piano.', 'Tutorial_Level5_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (17, 5, 'G Note', 2, 'press_key', 'This is the note G.  It is located on the second line of the piano.  This note is also played with your right hand.  Click the note on the piano or press \'G\' to hear what it sounds like!', 'Tutorial_Level5_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (18, 5, 'Two F Notes and Two G Notes', 3, 'press_continue', 'Here we start with two f notes.  The arrows show when the notes change.  All of these notes will be played with your right hand on a real piano.', 'Tutorial_Level5_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (19, 6, 'B Note', 1, 'press_key', 'This a new note, B.  It is close to the Bass Clef, so you will play this note with your left hand.  It is located right above the top line of the Bass Clef.  Click the key or press \'B\' on your keyboard.', 'Tutorial_Level6_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (20, 6, 'A Note', 2, 'press_key', 'This is a new note, A!  It is located on the 5th line of the Bass Clef.  Click the highlighted key or press \'A\' on your keyboard.', 'Tutorial_Level6_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (21, 6, 'Left Hand G Note', 3, 'press_key', 'This is the note G.  It is in the 4th space of the Bass Clef.  You can play this note with your left hand on a real piano.  Click the highlighted key!', 'Tutorial_Level6_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (22, 6, 'Three Notes', 4, 'press_continue', 'Here we have three B\'s, three A\'s, and three G\'s.  Bis above the 5th line.  A is on the 5th line, and G is in the 4th space.', 'Tutorial_Level6_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (23, 7, 'Sharp', 1, 'press_key', 'The \'#\' symbol means sharp.  This note is called \'C sharp\'.  The sharp symbol means that we are going to raise the note C by one half step.  A half step is the next direct key on the keyboard.  If we raise the note, we get the first note higher than C.  This is the black key highlighted on the keyboard.', 'Tutorial_Level7_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (24, 7, 'D Sharp', 2, 'press key', 'This is D sharp.  It is one half step higher than D.  This means the next direct key above D.  The \'#\' symbol is always placed before the note.  Go ahead and click the highlighted key!', 'Tutorial_Level7_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (25, 7, 'F Sharp', 3, 'press_key', 'Here we have F#.  You may have noticed that there is no e sharp.  This is because there is no black key between E and F.  This is  the black key above F.', 'Tutorial_Level7_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (26, 7, 'G Sharp', 4, 'press_key', 'Here we have G sharp.  If you know the note wihtout the sharp symbol, all you have to do is raise the note by a half step.  Click the highlighted key!', 'Tutorial_Level7_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (27, 7, 'Collection of Sharp Notes', 5, 'press_continue', 'Here we have C sharp, D sharp, F sharp, and G sharp.  Sharp notes will always be black keys.', 'Tutorial_Level7_5.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (28, 8, 'A Sharp', 1, 'press_key', 'This is A sharp.  We skip \'B\' sharp because there is no black key between B and C.  Press the highlighted key to move on!', 'Tutorial_Level8_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (29, 8, 'Left Hand G Sharp', 2, 'press_key', 'This is G sharp.  It is one half step higher than G.  Click the key to continue!', 'Tutorial_Level8_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (30, 1, 'Conclusion', 5, 'done', 'Congratulations you have finished the 1st Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (31, 2, 'Conclusion', 6, 'done', 'Congratulations you have finished the 2nd Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (32, 3, 'Conclusion', 4, 'done', 'Congratulations you have finished the 3rd Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (33, 4, 'Conclusion', 4, 'done', 'Congratulations you have finished the 4th Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (34, 5, 'Conclusion', 4, 'done', 'Congratulations you have finished the 5th Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (35, 6, 'Conclusion', 5, 'done', 'Congratulations you have finished the 6th Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (36, 7, 'Conclusion', 6, 'done', 'Congratulations you have finished the 7th Tutorial!  Click continue to move on to the quiz.', NULL);
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (37, 8, 'Conclusion', 3, 'done', 'Congratulations you have finished the 8th Tutorial!  Click continue to move on to the quiz.', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`tutorial_page_responses`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (1, 'c4', 1, 12);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (2, 'c4', 2, 12);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (3, 'c4', 3, 12);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (4, 'c4', 4, 12);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (5, 'c4', 5, 12);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (6, 'c4', 6, 12);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (7, 'd4', 1, 13);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (8, 'e4', 1, 14);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (9, 'f4', 1, 16);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (10, 'g4', 1, 17);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (11, 'b4', 1, 19);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (12, 'a4', 1, 20);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (13, 'g3', 1, 21);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (14, 'csharp4', 1, 23);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (15, 'dsharp4', 1, 24);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (16, 'fsharp4', 1, 25);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (17, 'gsharp4', 1, 26);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (18, 'asharp4', 1, 28);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`, `tutorial_page_tutorial_page_id`) VALUES (19, 'gsharp3', 1, 29);

COMMIT;
