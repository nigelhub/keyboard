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
  `tutorial_description` VARCHAR(45) NOT NULL ,
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
  `note_duration` INT(11) NOT NULL ,
  `note_delay` INT(11) NULL DEFAULT NULL ,
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
  `tutorial_page_id` INT NOT NULL ,
  `tutorial_page_response` VARCHAR(45) NOT NULL ,
  `tutorial_page_response_sequence_id` INT NOT NULL ,
  PRIMARY KEY (`tutorial_page_responses_id`) ,
  INDEX `tutorial_page_id` () ,
  UNIQUE INDEX `tutorial_page_id_UNIQUE` (`tutorial_page_id` ASC) ,
  CONSTRAINT `tutorial_page_id`
    FOREIGN KEY ()
    REFERENCES `music_service`.`tutorial_page` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (1, 1, 'Grand Staff', 1, 'information', 'This is the grand staff.  The grand staff displays what notes to play on the piano!  It is broken into two seperate staves each with five lines.', 'Tutorial_Level1_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (2, 1, 'Right Hand Note Placement', 2, 'information', 'The red circle shows where notes to be played with the right hand to go.  The blue circle is the Treble Clef.  It is also called the G Clef.  Just remember that the top five lines include notes to be played with the right hand.', 'Tutorial_Level1_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (3, 1, 'Left Hand Note Placement', 3, 'information', 'The blue circle shows the Basss Clef.  it is also called the F Clef.  All notes in this space are played with the left hand.', 'Tutorial_Level1_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (4, 1, 'Left and Right Hand Note Placement', 4, 'information', 'The top five lines are for right hand notes and the bottom five lines are for left hand notes!', 'Tutorial_Level1_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (5, 2, 'Stave Lines', 1, 'information', 'There are five lines in each stave.  These lines can have notes.', 'Tutorial_Level2_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (6, 2, 'Line Notes', 2, 'information', 'These are called line notes because the circle of each note falls on a line.  Each note also has a stem, like a cherry or an apple!  The stem points up when below the third line and points down when above the third line.', 'Tutorial_Level2_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (7, 2, 'Space Notes', 3, 'information', 'There can also be space notes.  These are notes that fall in between the lines.  There are four space notes in each stave.', 'Tutorial_Level2_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (8, 2, 'More Space Notes', 4, 'information', 'There can also be space notes.  These are notes that fall in between the lines.  There are a total of four space notes in each stave.', 'Tutorial_Level2_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (9, 2, 'Invisible Line', 5, 'information', 'You can also pretend that there is an invisible line in between the two staves.  This will be useful later!', 'Tutorial_Level2_5.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (10, 3, 'Middle C', 1, 'information', 'This is the first note that people learn to read and play on the piano.  The line through the note comes from the invisible line we saw earlier that devides the two staves.', 'Tutorial_Level3_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (11, 3, 'Left Middle C ', 2, 'information', 'This is the same physical note on the piano.  Here the note is closer to the Bass Clef, though.  This means that the left hand will play the note instead of  the right hand.', 'Tutorial_Level3_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (12, 3, 'Six Middle C Notes', 3, 'information', 'Here there are 6 middle C notes in a row.  The first three should be played with the right hand, and the last three should be played with the left hand on a real piano.', 'Tutorial_Level3_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (13, 4, 'D Note', 1, 'press_key', 'This a new note, D!  This note is right below the 1st line on the Treble Clef.  You should play this note with your right hand on a real piano.  The key is highlighted below, click the key or press \'D\' on your computer keyboard to move on.', 'Tutorial_Level4_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (14, 4, 'E Note', 2, 'press_key', 'This a new note, E!  This note is on the 1st line on the Treble Clef.  You should play this note with your right hand.  Press the key or press \'E\' on your computer keyboard to hear the note.', 'Tutorial_Level4_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (15, 4, 'Changing Note', 3, 'information', 'Here, the example starts with a \'D\' note.  The arrows show that the note is changing.  The second note is an \'E\'.', 'Tutorial_Level4_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (16, 5, 'F Note', 1, 'press_key', 'Here is a new note, F!  It is in the 1st space of the Treble Clef.  This key is highlighted on the piano.  Click the key or press the \'F\' key on your piano.', 'Tutorial_Level5_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (17, 5, 'G Note', 2, 'press_key', 'This is the note G.  It is located on the second line of the piano.  This note is also played with your right hand.  Click the note on the piano or press \'G\' to hear what it sounds like!', 'Tutorial_Level5_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (18, 5, 'Two F Notes and Two G Notes', 3, 'information', 'Here we start with two f notes.  The arrows show when the notes change.  All of these notes will be played with your right hand on a real piano.', 'Tutorial_Level5_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (19, 6, 'B Note', 1, 'press_key', 'This a new note, B.  It is close to the Bass Clef, so you will play this note with your left hand.  It is located right above the top line of the Bass Clef.  Click the key or press \'B\' on your keyboard.', 'Tutorial_Level6_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (20, 6, 'A Note', 2, 'press_key', 'This is a new note, A!  It is located on the 5th line of the Bass Clef.  Click the highlighted key or press \'A\' on your keyboard.', 'Tutorial_Level6_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (21, 6, 'Left Hand G Note', 3, 'press_key', 'This is the note G.  It is in the 4th space of the Bass Clef.  You can play this note with your left hand on a real piano.  Click the highlighted key!', 'Tutorial_Level6_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (22, 6, 'Three Notes', 4, 'information', 'Here we have three B\'s, three A\'s, and three G\'s.  Bis above the 5th line.  A is on the 5th line, and G is in the 4th space.', 'Tutorial_Level6_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (23, 7, 'Sharp', 1, 'information', 'The \'#\' symbol means sharp.  This note is called \'C sharp\'.  The sharp symbol means that we are going to raise the note C by one half step.  A half step is the next direct key on the keyboard.  If we raise the note, we get the first note higher than C.  This is the black key highlighted on the keyboard.', 'Tutorial_Level7_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (24, 7, 'D Sharp', 2, 'press key', 'This is D sharp.  It is one half step higher than D.  This means the next direct key above D.  The \'#\' symbol is always placed before the note.  Go ahead and click the highlighted key!', 'Tutorial_Level7_2.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (25, 7, 'F Sharp', 3, 'information', 'Here we have F#.  You may have noticed that there is no e sharp.  This is because there is no black key between E and F.  This is  the black key above F.', 'Tutorial_Level7_3.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (26, 7, 'G Sharp', 4, 'press_key', 'Here we have G sharp.  If you know the note wihtout the sharp symbol, all you have to do is raise the note by a half step.  Click the highlighted key!', 'Tutorial_Level7_4.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (27, 7, 'Collection of Sharp Notes', 5, 'information', 'Here we have C sharp, D sharp, F sharp, and G sharp.  Sharp notes will always be black keys.', 'Tutorial_Level7_5.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (28, 8, 'A Sharp', 1, 'press_key', 'This is A sharp.  We skip \'B\' sharp because there is no black key between B and C.  Press the highlighted key to move on!', 'Tutorial_Level8_1.png');
INSERT INTO `music_service`.`tutorial_page` (`tutorial_page_id`, `tutorial_id`, `tutorial_name`, `sequence_id`, `tutorial_type`, `tutorial_text`, `tutorial_image`) VALUES (29, 8, 'Left Hand G Sharp', 2, 'press_key', 'This is G sharp.  It is one half step higher than G.  Click the key to continue!', 'Tutorial_Level8_2.png');

COMMIT;

-- -----------------------------------------------------
-- Data for table `music_service`.`tutorial_page_responses`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`) VALUES (1, 12, 'C4', 1);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`) VALUES (1, 12, 'C4', 2);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`) VALUES (1, 12, 'C4', 3);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`) VALUES (1, 12, 'C4', 4);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`) VALUES (1, 12, 'C4', 5);
INSERT INTO `music_service`.`tutorial_page_responses` (`tutorial_page_responses_id`, `tutorial_page_id`, `tutorial_page_response`, `tutorial_page_response_sequence_id`) VALUES (1, 12, 'C4', 6);

COMMIT;
