-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.27 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for springmvc
CREATE DATABASE IF NOT EXISTS `springmvc` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `springmvc`;

-- Dumping structure for table springmvc.business_setting
CREATE TABLE IF NOT EXISTS `business_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone_number` varchar(15) DEFAULT NULL,
  `fax_number` varchar(100) DEFAULT NULL,
  `tt_number` varchar(255) DEFAULT NULL,
  `image` blob,
  `notes` varchar(400) DEFAULT NULL,
  `created_user` varchar(70) NOT NULL DEFAULT '',
  `created_date` timestamp NOT NULL,
  `modify_user` varchar(70) DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Describes business configurartions';

-- Dumping data for table springmvc.business_setting: 0 rows
/*!40000 ALTER TABLE `business_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_setting` ENABLE KEYS */;

-- Dumping structure for table springmvc.category
CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.category: 2 rows
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`categoryid`, `description`) VALUES
	(1, 'Home and Living'),
	(5, 'test');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table springmvc.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customerid` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneno` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customerid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.customer: ~1 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customerid`, `address`, `name`, `password`, `phoneno`, `username`) VALUES
	(1, 's', 's', 's', 's', 's');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table springmvc.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Dumping data for table springmvc.hibernate_sequence: 4 rows
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(799),
	(799),
	(799),
	(799);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table springmvc.item
CREATE TABLE IF NOT EXISTS `item` (
  `itemid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.item: 4 rows
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemid`, `categoryid`, `description`, `imagepath`, `price`, `id`, `category_id`, `code`, `created_date`, `created_user`, `modified_date`, `modified_user`, `name`, `status`, `uom_id`, `version`) VALUES
	(11, 1, 'xxxx', NULL, 32, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	(10, 1, 'ffffffffff', NULL, 111, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	(9, 1, 'bbbb', NULL, 123, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	(8, 1, 'aaaa', NULL, 120, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Dumping structure for table springmvc.itemimagedetails
CREATE TABLE IF NOT EXISTS `itemimagedetails` (
  `itemimagedetailid` int NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) DEFAULT NULL,
  `itemid` int DEFAULT NULL,
  `isdefault` int DEFAULT NULL,
  PRIMARY KEY (`itemimagedetailid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.itemimagedetails: 8 rows
/*!40000 ALTER TABLE `itemimagedetails` DISABLE KEYS */;
INSERT INTO `itemimagedetails` (`itemimagedetailid`, `itemname`, `itemid`, `isdefault`) VALUES
	(34, '1599817536192_1_2.jpg', 9, 1),
	(33, '1599817536192_1_1.jpg', 9, 0),
	(32, '1599817479244_1_3.jpg', 8, 1),
	(31, '1599817479244_1_2.jpg', 8, 0),
	(30, '1599817479244_1_1.jpg', 8, 0),
	(35, '1599833747246_1_1.jpg', 11, 0),
	(36, '1599833747246_1_2.jpg', 11, 0),
	(37, '1599833747246_1_3.png', 11, 1);
/*!40000 ALTER TABLE `itemimagedetails` ENABLE KEYS */;

-- Dumping structure for table springmvc.main_category
CREATE TABLE IF NOT EXISTS `main_category` (
  `maincategoryid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isactive` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`maincategoryid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.main_category: 0 rows
/*!40000 ALTER TABLE `main_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_category` ENABLE KEYS */;

-- Dumping structure for table springmvc.program
CREATE TABLE IF NOT EXISTS `program` (
  `programid` int NOT NULL DEFAULT '0',
  `parentid` int DEFAULT NULL,
  `sid` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `isendprogram` int DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `jspFile` varchar(100) DEFAULT NULL,
  `events` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`programid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.program: ~26 rows (approximately)
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` (`programid`, `parentid`, `sid`, `description`, `level`, `isendprogram`, `icon`, `jspFile`, `events`) VALUES
	(50, 0, '', 'Dashboard', 1, 0, 'fa fa-link', NULL, ''),
	(51, 50, 'dashboard.do', 'My Dashboard', 1, 1, 'fa fa-link', 'dashboard', '1'),
	(60, 0, '', 'Masters', 1, 0, 'fa fa-tachometer', '', ''),
	(61, 60, 'city.do', 'City Management', 2, 1, 'fa fa-link', 'city', '1,2'),
	(62, 60, 'deliveryCharges.do', 'Delivery Charges', 2, 1, 'fa fa-link', 'deliveryCharges', '1,2'),
	(100, 0, '', 'Product Management', 1, 0, 'fa fa-tachometer', NULL, NULL),
	(101, 100, 'productCategory.do', 'Product Category', 2, 1, 'fa fa-link', 'productCategory', '1,2'),
	(102, 100, 'prodcutBrand.do', 'Product Brand', 2, 1, 'fa fa-link', 'productBrand', '1,2'),
	(103, 100, 'product.do', 'Product', 2, 1, 'fa fa-link', 'product', '1,2'),
	(200, 0, '', 'Pricing & Promotion', 1, 0, 'fa fa-tachometer', '', ''),
	(201, 200, 'promotion.do', 'Promotion', 2, 1, 'fa fa-link', 'promotion', '1,2'),
	(202, 200, 'pricing.do', 'Pricing', 2, 1, 'fa fa-link', 'pricing', '1,2'),
	(300, 0, '', 'Inventory Management', 1, 0, 'fa fa-tachometer', '', ''),
	(301, 300, 'inventoryReceipt.do', 'Inventory Receipts', 2, 1, 'fa fa-link', 'inventoryReceipt', '1,2'),
	(302, 300, 'onhandInventorydo', 'On-hand Inventory', 2, 1, 'fa fa-link', 'onhandInventory', '1,2'),
	(400, 0, '', 'Order Management', 1, 0, 'fa fa-tachometer', '', ''),
	(401, 400, 'pendingOrders.do', 'Pending Order', 2, 1, 'fa fa-link', 'pendingOrder', '1,2'),
	(402, 400, 'orderHistory.do', 'Order History', 2, 1, 'fa fa-link', 'orderHistory', '1,2'),
	(500, 0, '', 'Customer Management', 1, 0, 'fa fa-tachometer', '', ''),
	(501, 500, 'customer.do', 'Customer Creation', 1, 1, 'fa fa-link', 'customer', '1,2'),
	(600, 0, '', 'Supplier Management', 1, 0, 'fa fa-tachometer', '', ''),
	(601, 600, 'supplier.do', 'Supplier Creation', 1, 1, 'fa fa-link', 'supplier', '1,2'),
	(700, 0, '', 'Administration', 1, 0, 'fa fa-tachometer', '', ''),
	(701, 700, 'userType.do', 'User Type', 2, 1, 'fa fa-link', 'userType', '1,2'),
	(702, 700, 'user.do', 'User Management', 2, 1, 'fa fa-link', 'userCreation', '1,2'),
	(703, 700, 'userAccessControl.do', 'User Access Control', 2, 1, 'fa fa-link', 'UserAccessControl', '1,2');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;

-- Dumping structure for table springmvc.user
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `isactive` int DEFAULT NULL,
  `usertype` int DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userid`, `password`, `username`, `isactive`, `usertype`) VALUES
	(1, '123123123', 'admin', 0, 1),
	(3, '123', 'lakshika', NULL, 35),
	(4, '123', 'akila', NULL, 35),
	(5, '123123123', 'Supuni', NULL, 35);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table springmvc.user2
CREATE TABLE IF NOT EXISTS `user2` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.user2: ~0 rows (approximately)
/*!40000 ALTER TABLE `user2` DISABLE KEYS */;
/*!40000 ALTER TABLE `user2` ENABLE KEYS */;

-- Dumping structure for table springmvc.userprogram
CREATE TABLE IF NOT EXISTS `userprogram` (
  `userprogramid` int NOT NULL AUTO_INCREMENT,
  `programid` int DEFAULT NULL,
  `usertypeid` int DEFAULT NULL,
  PRIMARY KEY (`userprogramid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=797 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.userprogram: ~54 rows (approximately)
/*!40000 ALTER TABLE `userprogram` DISABLE KEYS */;
INSERT INTO `userprogram` (`userprogramid`, `programid`, `usertypeid`) VALUES
	(517, 200, 0),
	(519, 201, 0),
	(522, 202, 0),
	(525, 400, 0),
	(527, 401, 0),
	(530, 402, 0),
	(533, 600, 0),
	(535, 601, 0),
	(538, 100, 0),
	(539, 101, 0),
	(542, 102, 0),
	(545, 103, 0),
	(548, 300, 0),
	(550, 301, 0),
	(553, 302, 0),
	(556, 50, 0),
	(558, 51, 0),
	(560, 500, 0),
	(562, 501, 0),
	(565, 60, 0),
	(567, 700, 0),
	(569, 61, 0),
	(572, 701, 0),
	(575, 62, 0),
	(578, 702, 0),
	(581, 703, 0),
	(679, 700, 35),
	(680, 703, 35),
	(740, 200, 1),
	(741, 201, 1),
	(744, 202, 1),
	(747, 400, 1),
	(748, 401, 1),
	(751, 402, 1),
	(754, 600, 1),
	(755, 601, 1),
	(758, 100, 1),
	(759, 101, 1),
	(762, 102, 1),
	(765, 103, 1),
	(768, 300, 1),
	(769, 301, 1),
	(772, 302, 1),
	(775, 50, 1),
	(776, 51, 1),
	(778, 500, 1),
	(779, 501, 1),
	(782, 60, 1),
	(783, 700, 1),
	(784, 61, 1),
	(787, 701, 1),
	(790, 62, 1),
	(793, 702, 1),
	(796, 703, 1);
/*!40000 ALTER TABLE `userprogram` ENABLE KEYS */;

-- Dumping structure for table springmvc.userprogramevent
CREATE TABLE IF NOT EXISTS `userprogramevent` (
  `userprgeventid` int NOT NULL AUTO_INCREMENT,
  `event` int DEFAULT NULL,
  `userprogramid` int DEFAULT NULL,
  PRIMARY KEY (`userprgeventid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.userprogramevent: ~62 rows (approximately)
/*!40000 ALTER TABLE `userprogramevent` DISABLE KEYS */;
INSERT INTO `userprogramevent` (`userprgeventid`, `event`, `userprogramid`) VALUES
	(742, 1, 741),
	(743, 2, 741),
	(745, 1, 744),
	(746, 2, 744),
	(749, 1, 748),
	(750, 2, 748),
	(752, 1, 751),
	(753, 2, 751),
	(756, 1, 755),
	(757, 2, 755),
	(760, 1, 759),
	(761, 2, 759),
	(763, 1, 762),
	(764, 2, 762),
	(766, 1, 765),
	(767, 2, 765),
	(770, 1, 769),
	(771, 2, 769),
	(773, 1, 772),
	(774, 2, 772),
	(777, 1, 776),
	(780, 1, 779),
	(781, 2, 779),
	(785, 1, 784),
	(786, 2, 784),
	(788, 1, 787),
	(789, 2, 787),
	(791, 1, 790),
	(792, 2, 790),
	(794, 1, 793),
	(795, 2, 793),
	(797, 1, 796),
	(798, 2, 796),
	(925, 1, 702),
	(926, 2, 702),
	(927, 1, 701),
	(928, 2, 701),
	(932, 1, 501),
	(933, 2, 501),
	(935, 1, 401),
	(936, 2, 401),
	(937, 1, 402),
	(938, 2, 402),
	(940, 1, 301),
	(941, 2, 301),
	(942, 1, 302),
	(943, 2, 302),
	(945, 1, 201),
	(946, 2, 201),
	(947, 1, 202),
	(948, 2, 202),
	(950, 1, 101),
	(951, 2, 101),
	(952, 1, 102),
	(953, 2, 102),
	(954, 1, 103),
	(955, 2, 103),
	(957, 1, 61),
	(958, 2, 61),
	(959, 1, 62),
	(960, 2, 62),
	(962, 1, 51);
/*!40000 ALTER TABLE `userprogramevent` ENABLE KEYS */;

-- Dumping structure for table springmvc.usertype
CREATE TABLE IF NOT EXISTS `usertype` (
  `usertypeid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `companyid` int DEFAULT NULL,
  PRIMARY KEY (`usertypeid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table springmvc.usertype: ~5 rows (approximately)
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` (`usertypeid`, `code`, `description`, `companyid`) VALUES
	(1, 'ECAD', 'Admin-ecart', 0),
	(35, 'PWR', 'Product Worker', 0),
	(39, NULL, NULL, 0),
	(40, NULL, NULL, 0),
	(41, NULL, NULL, 0);
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
