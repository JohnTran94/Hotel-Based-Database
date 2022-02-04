-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table hotel.check_in_out
DROP TABLE IF EXISTS `check_in_out`;
CREATE TABLE IF NOT EXISTS `check_in_out` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `rid` (`rid`),
  CONSTRAINT `check_in_out_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `rooms` (`rid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table hotel.guests
DROP TABLE IF EXISTS `guests`;
CREATE TABLE IF NOT EXISTS `guests` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `customer_date` date NOT NULL,
  `last_stay` date NOT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  UNIQUE KEY `full_name` (`first_name`,`last_name`),
  KEY `rid` (`rid`),
  CONSTRAINT `guests_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `rooms` (`rid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table hotel.guest_to_package
DROP TABLE IF EXISTS `guest_to_package`;
CREATE TABLE IF NOT EXISTS `guest_to_package` (
  `gid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`gid`,`pid`),
  KEY `fk_pid_packages` (`pid`),
  CONSTRAINT `fk_gid_guests` FOREIGN KEY (`gid`) REFERENCES `guests` (`gid`) ON DELETE CASCADE,
  CONSTRAINT `fk_pid_packages` FOREIGN KEY (`pid`) REFERENCES `packages` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table hotel.packages
DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL,
  `package_cost` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table hotel.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL,
  `floor_number` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `room_floor` (`floor_number`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
