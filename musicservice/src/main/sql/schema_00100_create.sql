SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `music_service` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `music_service` ;

-- -----------------------------------------------------
-- Table `music_service`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_service`.`user` ;

CREATE  TABLE IF NOT EXISTS `music_service`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `first` VARCHAR(45) NOT NULL ,
  `last` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NULL ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_service`.`db_version`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_service`.`db_version` ;

CREATE  TABLE IF NOT EXISTS `music_service`.`db_version` (
  `db_version_id` INT NOT NULL AUTO_INCREMENT ,
  `version` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(75) NOT NULL ,
  PRIMARY KEY (`db_version_id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `music_service`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `music_service`;
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`) VALUES (NULL, 'Nigel', 'Stuart', 'nstuart@bu.edu', 'admin', NULL);
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`) VALUES (NULL, 'Ana', 'Beglova', 'abeglova@gmail.com', 'admin', NULL);
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`) VALUES (NULL, 'Jon', 'Kelley', 'jk214north@gmail.com', 'admin', NULL);
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`) VALUES (NULL, 'Hieu', 'Tang', 'hqtran@bu.edu', 'admin', NULL);
INSERT INTO `music_service`.`user` (`user_id`, `first`, `last`, `email`, `role`, `password`) VALUES (NULL, 'Chris', 'Wright', 'valtera45@gmail.com', 'admin', NULL);

COMMIT;
