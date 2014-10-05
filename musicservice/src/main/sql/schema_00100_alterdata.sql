
SET AUTOCOMMIT=0;
USE `music_service`;

-- -----------------------------------------------------
-- Data for table `automatosx`.`db_version`
-- -----------------------------------------------------
INSERT INTO `mydb`.`db_version` (`version`, `description`) VALUES ('1.00', 'Added user table and db_version table.');

-- -----------------------------------------------------
-- Data for table `mydb`.`user` 
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `password`, `role`) VALUES (NULL, 'Nigel', 'Stuart', 'nstuart@bu.edu', 'password', 'admin');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `password`, `role`) VALUES (NULL, 'Ana', 'Beglova', 'abeglova@gmail.com', 'password', 'admin');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `password`, `role`) VALUES (NULL, 'Jon', 'Kelley', 'jk214north@gmail.com', 'password', 'admin');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `password`, `role`) VALUES (NULL, 'Hieu', 'Tang', 'hqtran@bu.edu', 'password', 'admin');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `password`, `role`) VALUES (NULL, 'Chris', 'Wright', 'valtera45@gmail.com', 'password', 'admin');
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `password`, `role`) VALUES (NULL, 'Derek', 'Jeter', 'dj2@yankees.com', 'retire', 'user');

COMMIT;
