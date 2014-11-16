SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Data for table `automatosx`.`db_version`
-- -----------------------------------------------------
INSERT INTO `mydb`.`db_version` (`version`, `description`) VALUES ('2.00', 'Added core tables for entire projet.');


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
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 1', 1, 'multiple_choice', 'Whcih hand is circled? The right or left?', 'Quizzes_Level1_1.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 2', 2, 'multiple_choice', 'Whcih hand is circled? The right or left?', 'Quizzes_Level1_2.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 3', 3, 'multiple_choice', 'Whcih hand is circled? The right or left?', 'Quizzes_Level1_3.png', 'Left');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 4', 4, 'multiple_choice', 'Whcih hand is circled? The right or left?', 'Quizzes_Level1_4.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 1, 'Question 5', 5, 'multiple_choice', 'Whcih hand is circled? The right or left?', 'Quizzes_Level1_5.png', 'Right');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 1', 1, 'multiple_choice', 'What line number is highlighted in the Treble Clef?', 'Quizzes_Level2_1.png', '1');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 2', 2, 'multiple_choice', 'What line number is highlighted in the Bass Clef?', 'Quizzes_Level2_2.png', '2');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 3', 3, 'multiple_choice', 'What line number is highlighted in the Treble Clef?', 'Quizzes_Level2_3.png', '4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 4', 4, 'multiple_choice', 'What line number is highlighted in the Treble Clef?', 'Quizzes_Level2_4.png', '3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 2, 'Question 5', 5, 'multiple_choice', 'What line number is hightlighted in the Bass Clef?', 'Quizzes_Level2_5.png', '5');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_1.png', 'C4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_2.png', 'C4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 3', 3, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_3.png', 'C4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 4', 4, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_4.png', 'C4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 3, 'Question 5', 5, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level3_5.png', 'C4 (x6)');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_1.png', 'D4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_2.png', 'E4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 3', 3, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_3.png', 'D4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 4, 'Question 4', 4, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level4_4.png', 'D4 E4 D4 C4 D4 E4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level5_1.png', 'F4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level5_2.png', 'G4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 3', 3, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level5_3.png', 'G4 G4 F4 F4 G4 G4 F4 F4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level5_4.png', 'C4 C4 E4 E4 F4 F4 G4 G4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 5, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level5_5.png', 'C4 D4 E4 F4 G4 F4 E4 D4 C4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 1', 1, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level6_1.png', 'B4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 2', 2, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level6_2.png', 'A4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 3', 3, 'press_key', 'What  note is displayed? Can you play it on the keyboard?', 'Quizzes_Level6_3.png', 'G3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level6_4.png', 'B4 A4 G3 A4 G3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 6, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level6_5.png', 'C4 B4 A4 C4 A4 G3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 1', 1, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_1.png', 'Dsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 2', 2, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_2.png', 'Fsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 3', 3, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_3.png', 'Gsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_4.png', 'Csharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 7, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level7_5.png', 'Dsharp4 Fsharp4 Gsharp4 Csharp4 Gsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 1', 1, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_1.png', 'Asharp3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 2', 2, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_2.png', 'Gsharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 3', 3, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_3.png', 'B4 Gsharp3 Asharp4 Csharp4 B4 Asharp3');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 4', 4, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_4.png', 'Csharp4 Csharp4 Csharp4 B4 Asharp4 Gsharp3 Asharp4');
INSERT INTO `music_service`.`question` (`question_id`, `quiz_id`, `question_name`, `sequence_id`, `question_type`, `question_text`, `question_image`, `answer`) VALUES (NULL, 8, 'Question 5', 5, 'press_key', 'Which notes are displayed? Can you play them on the keyboard?', 'Quizzes_Level8_5.png', 'gsharp3 asharp4 b4 csharp4 dsharp5 fsharp4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `music_service`.`demo_note`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;


-- -----------------------------------------------------
-- Data for Happy Birthday Demo
-- -----------------------------------------------------
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.125', '1');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.125', '2');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'D',  'D4',        '0.25',  '3');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.25',  '4');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'F4',        '0.25',  '5');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'E',  'E4',        '0.5',   '6');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.125', '7');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.125', '8');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'D',  'D4',        '0.25',  '9');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.25',  '10');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'G',  'G4',        '0.25',  '11');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'F4',        '0.5',   '12');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.125', '13');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C4',        '0.125', '14');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'C',  'C5',        '0.25',  '15');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A',  'A5',        '0.25',  '16');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'F4',        '0.25',  '17');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'E',  'E4',        '0.25',  '18');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'D',  'D4',        '0.25',  '19');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A#', 'asharp5',   '0.125', '20');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A#', 'asharp5',   '0.125', '21');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'A',  'A5',        '0.25',  '22');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'F4',        '0.25',  '23');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'G',  'G4',        '0.25',  '24');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 1, 'F',  'F4',        '0.5',   '25');




-- -----------------------------------------------------
-- Data for Row Row Row Your Boat Demo
-- -----------------------------------------------------
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.375',  '1');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.375',  '2');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.25',   '3');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'D', 'D4', '0.125',  '4');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.375',  '5');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.25',   '6');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'D', 'D4', '0.125',  '7');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.25',   '8');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'F', 'F4', '0.125',  '9');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'G4', '0.75',  '10');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C5', '0.125', '11');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C5', '0.125', '12');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C5', '0.125', '13');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'G4', '0.125', '14');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'G4', '0.125', '15');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'G4', '0.125', '16');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.125', '17');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.125', '18');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.125', '19');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.125', '20');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.125', '21');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.125', '22');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'G', 'G4', '0.25',  '23');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'F', 'F4', '0.125', '24');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'E', 'E4', '0.25',  '25');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'D', 'D4', '0.125', '26');
INSERT INTO `music_service`.`demo_note` (`demo_note_id`, `demo_id`, `note_display`, `note_key`, `note_duration`, `sequence_id` ) VALUES (NULL, 2, 'C', 'C4', '0.75',  '27');



COMMIT;
