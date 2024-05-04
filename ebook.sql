-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ebook
CREATE DATABASE IF NOT EXISTS `ebook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ebook`;

-- Dumping structure for table ebook.book
CREATE TABLE IF NOT EXISTS `book` (
  `bookID` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `bookCategory` varchar(255) DEFAULT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ebook.book: ~6 rows (approximately)
INSERT INTO `book` (`bookID`, `author`, `bookCategory`, `bookName`, `email`, `photo`, `price`, `status`) VALUES
	(2, 'anhduc', 'New', 'java programming', 'admin', 'java.jpg', 98998, 'active'),
	(3, 'thuongthuong', 'New', 'jsp programming', 'admin', 'jsp.jpg', 898989, 'active'),
	(4, 'Thương', 'New', 'python programming', 'admin', 'python.jpg', 9999, 'active'),
	(5, 'Đức', 'New', 'sql programming', 'admin', 'sql.jpg', 5200, 'active'),
	(6, 'NIKKK', 'Old', 'ruby programming', 'admin', 'ruby.jpg', 78989, 'active'),
	(7, 'Robert Oliver', 'Old', 'Python QuickStart Guide', 'admin', 'python3.jpg', 300000, 'active'),
	(21, 'Thương', 'Old', 'javascript programming', 'anhduc220403@gmail.com', 'js.jpg', 9999, 'active');

-- Dumping structure for table ebook.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `cartID` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `bookID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `FKpt8fdp30itr4a2jd9wo57u916` (`bookID`),
  KEY `FKqyoj542cy6eem9q3o17ney8g0` (`userID`),
  CONSTRAINT `FKpt8fdp30itr4a2jd9wo57u916` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`),
  CONSTRAINT `FKqyoj542cy6eem9q3o17ney8g0` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ebook.cart: ~0 rows (approximately)

-- Dumping structure for table ebook.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ebook.hibernate_sequence: ~0 rows (approximately)
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(38);

-- Dumping structure for table ebook.order_book
CREATE TABLE IF NOT EXISTS `order_book` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `orderID` varchar(255) DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `bookID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt2sqovdbm4avg0ags14ocoqdb` (`bookID`),
  KEY `FK7s8j2w22cded0ag2sjtxryaxp` (`userID`),
  CONSTRAINT `FK7s8j2w22cded0ag2sjtxryaxp` FOREIGN KEY (`userID`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt2sqovdbm4avg0ags14ocoqdb` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ebook.order_book: ~7 rows (approximately)
INSERT INTO `order_book` (`id`, `address`, `orderID`, `paymentType`, `totalPrice`, `bookID`, `userID`) VALUES
	(22, 'HungYen', 'BOOk-ORD-0529', 'COD', 5200, 5, 1),
	(23, 'HungYen', 'BOOk-ORD-078', 'COD', 9999, 4, 1),
	(27, 'HungYen', 'BOOk-ORD-0208', 'COD', 9999, 4, 1),
	(28, 'HungYen', 'BOOk-ORD-0622', 'COD', 98998, 2, 1),
	(29, 'HungYen', 'BOOk-ORD-0671', 'COD', 5200, 5, 1),
	(35, 'HungYen', 'BOOK-ORD-0732', 'COD', 9999, 21, 1),
	(36, 'HungYen', 'BOOK-ORD-0740', 'COD', 5200, 5, 1),
	(37, 'HungYen', 'BOOK-ORD-0636', 'COD', 98998, 2, 1);

-- Dumping structure for table ebook.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ebook.user: ~1 rows (approximately)
INSERT INTO `user` (`id`, `address`, `email`, `fName`, `password`, `phoneNo`) VALUES
	(1, 'HungYen', 'anhduc220403@gmail.com', 'anhduc0809', '0809', '898989');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
