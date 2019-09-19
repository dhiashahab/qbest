-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.30-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table sik.antriloket
DROP TABLE IF EXISTS `antriloket`;
CREATE TABLE IF NOT EXISTS `antriloket` (
  `loket` int(2) NOT NULL,
  `antrian` int(4) NOT NULL,
  `panggil` int(1) DEFAULT NULL,
  `suara` int(1) DEFAULT NULL,
  PRIMARY KEY (`loket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

-- Dumping data for table sik.antriloket: 2 rows
/*!40000 ALTER TABLE `antriloket` DISABLE KEYS */;
INSERT IGNORE INTO `antriloket` (`loket`, `antrian`, `panggil`, `suara`) VALUES
	(2, 10, 0, 3),
	(1, 49, 0, 1),
	(3, 1, 0, 1),
	(4, 1, 0, 1);
/*!40000 ALTER TABLE `antriloket` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
