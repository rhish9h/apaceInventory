-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2020 at 09:38 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apace`
--

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `serial number` int(11) NOT NULL,
  `time stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `table name` varchar(255) NOT NULL,
  `query type` varchar(255) NOT NULL,
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`serial number`, `time stamp`, `table name`, `query type`, `query`) VALUES
(1, '2019-07-29 14:14:33', 'xyz', '', 'hello\'\''),
(2, '2019-07-29 14:57:04', 'order details', '', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 108'),
(3, '2019-07-29 15:01:24', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 110'),
(4, '2019-07-29 15:08:31', 'material master', 'delete', 'DELETE FROM `material master` WHERE `material master`.`serial number` = 167'),
(5, '2019-07-29 15:08:50', 'material type master', 'delete', 'DELETE FROM `material type master` WHERE `material type master`.`serial number` = 43'),
(6, '2019-07-29 15:08:52', 'product master', 'delete', 'DELETE FROM `product master` WHERE `product master`.`serial number` = 37'),
(7, '2019-07-29 15:08:56', 'uom master', 'delete', 'DELETE FROM `uom master` WHERE `uom master`.`serial number` = 10'),
(8, '2019-07-29 15:09:30', 'vendor master', 'delete', 'DELETE FROM `vendor master` WHERE `vendor master`.`serial number` = 30'),
(9, '2019-07-29 15:09:34', 'vendor type master', 'delete', 'DELETE FROM `vendor type master` WHERE `vendor type master`.`serial number` = 16'),
(10, '2019-07-29 15:11:00', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 20'),
(11, '2019-07-29 15:13:01', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-23\', `promised delivery date` = \'2019-07-23\', `vendor` = \'Orthofit\', `folder reference` = \'/test\', `product` = \'Singlet-Mens\', `pattern` = \'MSGLT01\', `order code` = \'test order-Singlet-Mens\', `product related instructions` = \'12\', `product notes` = \'23\', `printing details` = \'31\', `printing notes` = \'42\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 19;'),
(12, '2019-07-29 15:16:50', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'719000\', \'719005\', \'719005-1\', \'2019-07-29\', \'2019-07-29\', \'2019-07-29\', \'Select vendor\', \'\', \'Chase-Mens\', \'M0006\', \'-Chase-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(13, '2019-07-29 15:17:02', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 21'),
(14, '2019-07-29 15:19:57', 'order details', 'delete', '1'),
(15, '2019-07-29 15:19:57', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'1\' WHERE `sub/order master`.`serial number` = 19;'),
(16, '2019-07-29 15:19:57', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'M\', \'1\')'),
(17, '2019-07-29 15:20:38', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'27\' WHERE `sub/order master`.`serial number` = 19;'),
(18, '2019-07-29 15:20:39', 'order details', 'delete', '1'),
(19, '2019-07-29 15:20:39', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'L\', \'14\')'),
(20, '2019-07-29 15:23:14', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'29\' WHERE `sub/order master`.`serial number` = 19;'),
(21, '2019-07-29 15:23:15', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-2\''),
(22, '2019-07-29 15:23:15', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'L\', \'14\')'),
(23, '2019-07-29 15:23:15', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'M\', \'1\')'),
(24, '2019-07-29 15:23:15', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'S\', \'12\')'),
(25, '2019-07-29 15:23:15', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'XL\', \'2\')'),
(26, '2019-07-29 15:26:43', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-29\', \'rhishabh - test\', \'rhishabh - test\', \'ColorCraft-SonaliScreens\', \'ColorCraft-SonaliScreens\', \'ColorCraft-SonaliScreens\', \'719002\', \'719002-1\', \'F18\', \'1\', \'0\', \'1\', \'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay\')'),
(27, '2019-07-29 15:26:43', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'17\', `stock value` = \'9350\' WHERE `raw material stock`.`material id` = \'F15\';'),
(28, '2019-07-29 15:26:43', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'34\', `stock value` = \'17000\' WHERE `raw material stock`.`material id` = \'F18\';'),
(29, '2019-07-29 15:26:43', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-29\', \'rhishabh - test\', \'rhishabh - test\', \'ColorCraft-SonaliScreens\', \'ColorCraft-SonaliScreens\', \'ColorCraft-SonaliScreens\', \'719002\', \'719002-1\', \'F15\', \'0\', \'1\', \'-1\', \'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati\')'),
(30, '2019-07-30 13:50:35', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'1234\', \'\')'),
(31, '2019-07-30 13:50:39', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 119'),
(32, '2019-07-30 13:54:34', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'1234\', \'\')'),
(33, '2019-07-30 13:54:46', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 120'),
(34, '2019-07-30 13:57:48', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'1234\', \'\')'),
(35, '2019-07-30 13:57:52', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 121'),
(36, '2019-07-30 14:03:55', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'1234\', \'\')'),
(37, '2019-07-30 14:03:59', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 122'),
(38, '2019-07-30 14:38:26', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'\', \'\')'),
(39, '2019-07-30 14:38:31', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 123'),
(40, '2019-07-30 14:39:03', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'\', \'\')'),
(41, '2019-07-31 01:07:51', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 124'),
(42, '2019-07-31 01:09:00', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'test\', \'\', \'\')'),
(43, '2019-07-31 01:09:21', 'order details', 'delete', 'DELETE FROM `order details` WHERE `order details`.`serial number` = 125'),
(44, '2019-07-31 01:20:52', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-22\', `promised delivery date` = \'2019-07-22\', `vendor` = \'Pioneer\', `folder reference` = \'qwer\', `product` = \'Raglan-RN-Mens\', `pattern` = \'M0002\', `order code` = \'test 4-Raglan-RN-Mens\', `product related instructions` = \'1234\\\'test\\\'\', `product notes` = \'123\\\'hello\\\'\', `printing details` = \'1234\', `printing notes` = \'1\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 17;'),
(45, '2019-07-31 01:22:35', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-22\', `promised delivery date` = \'2019-07-22\', `vendor` = \'krishnile\', `folder reference` = \'dffadfasfd\', `product` = \'Tri suit-Womens\', `pattern` = \'WTST01\', `order code` = \'test 4-Tri suit-Womens\', `product related instructions` = \'12\', `product notes` = \'341\', `printing details` = \'56\', `printing notes` = \'78\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 16;'),
(46, '2019-07-31 01:29:15', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-22\', `promised delivery date` = \'2019-07-22\', `vendor` = \'Local\', `folder reference` = \'/something/something\', `product` = \'Breakaway-Womens\', `pattern` = \'W0004\', `order code` = \'\', `product related instructions` = \'123\', `product notes` = \'456\', `printing details` = \'789\', `printing notes` = \'qwe\', `flag` = \'127\' WHERE `sub/order master`.`serial number` = 11;'),
(47, '2019-07-31 01:30:18', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-22\', `promised delivery date` = \'2019-07-22\', `vendor` = \'Local\', `folder reference` = \'/something/something\', `product` = \'Breakaway-Womens\', `pattern` = \'W0004\', `order code` = \'test 5-Breakaway-Womens\', `product related instructions` = \'123\', `product notes` = \'456\', `printing details` = \'789\', `printing notes` = \'qwe\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 11;'),
(48, '2019-07-31 01:41:27', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'18\' WHERE `sub/order master`.`serial number` = 9;'),
(49, '2019-07-31 01:41:27', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719001-1\''),
(50, '2019-07-31 01:41:27', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-1\', \'M\', \'6\')'),
(51, '2019-07-31 01:41:27', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-1\', \'S\', \'12\')'),
(52, '2019-07-31 01:42:53', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719001-1\''),
(53, '2019-07-31 01:42:53', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'19\' WHERE `sub/order master`.`serial number` = 9;'),
(54, '2019-07-31 01:42:53', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-1\', \'M\', \'6\')'),
(55, '2019-07-31 01:42:53', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-1\', \'S\', \'12\')'),
(56, '2019-07-31 01:42:53', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-1\', \'L\', \'1\')'),
(57, '2019-07-31 01:46:18', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'719000\', \'719005\', \'719005-1\', \'2019-07-31\', \'2019-07-31\', \'2019-07-31\', \'Select vendor\', \'\', \'Transition-Mens\', \'M0011\', \'-Transition-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(58, '2019-07-31 01:46:44', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 22'),
(59, '2019-07-31 01:54:43', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-31\', \'rhishabh\', \'rhishabh\', \'Berenis\', \'Berenis\', \'Berenis\', \'719001\', \'719001-1\', \'F12\', \'0\', \'0.9\', \'-0.9\', \'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati\')'),
(60, '2019-07-31 01:54:43', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'23\', `stock value` = \'12650\' WHERE `raw material stock`.`material id` = \'F12\';'),
(61, '2019-07-31 01:54:43', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-31\', \'rhishabh\', \'rhishabh\', \'Berenis\', \'Berenis\', \'Berenis\', \'719001\', \'719001-1\', \'F14\', \'2\', \'0\', \'2\', \'Fabric - Spandex-DarkGrey-240gsm-60inch-Roll-POS1281-Pashupati\')'),
(62, '2019-07-31 01:54:43', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'3\', `stock value` = \'1650\' WHERE `raw material stock`.`material id` = \'F14\';'),
(63, '2019-07-31 01:55:39', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-31\', \'rhishabh\', \'rhishabh\', \'Berenis\', \'Berenis\', \'Berenis\', \'719001\', \'719001-1\', \'F1\', \'0\', \'0\', \'0\', \'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal\')'),
(64, '2019-07-31 01:55:39', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'10\', `stock value` = \'2750\' WHERE `raw material stock`.`material id` = \'F1\';'),
(65, '2019-07-31 01:56:02', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-31\', \'tommy\', \'tommy\', \'Pashupati\', \'Pashupati\', \'Pashupati\', \'719001\', \'719001-1\', \'F20\', \'1\', \'3\', \'-2\', \'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay\')'),
(66, '2019-07-31 01:56:02', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'13\', `stock value` = \'4680\' WHERE `raw material stock`.`material id` = \'F20\';'),
(67, '2019-07-31 02:01:06', 'uom master', 'delete', 'DELETE FROM `uom master` WHERE `uom master`.`serial number` = 9'),
(68, '2019-07-31 02:01:15', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-23\', `promised delivery date` = \'2019-07-23\', `vendor` = \'Orthofit\', `folder reference` = \'/test\', `product` = \'Singlet-Mens\', `pattern` = \'MSGLT01\', `order code` = \'test order-Singlet-Mens\', `product related instructions` = \'121\', `product notes` = \'23\', `printing details` = \'31\', `printing notes` = \'42\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 19;'),
(69, '2019-07-31 02:01:25', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'719000\', \'719005\', \'719005-1\', \'2019-07-31\', \'2019-07-31\', \'2019-07-31\', \'Select vendor\', \'\', \'Transition-Mens\', \'M0011\', \'-Transition-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(70, '2019-07-31 02:01:34', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 23'),
(71, '2019-07-31 02:01:48', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-2\''),
(72, '2019-07-31 02:01:48', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'27\' WHERE `sub/order master`.`serial number` = 19;'),
(73, '2019-07-31 02:01:48', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'L\', \'14\')'),
(74, '2019-07-31 02:01:48', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'M\', \'1\')'),
(75, '2019-07-31 02:01:48', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'S\', \'12\')'),
(76, '2019-07-31 02:02:26', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2019-07-31\', \'rhishabh\', \'rhishabh\', \'AakashEnt\', \'AakashEnt\', \'AakashEnt\', \'719004\', \'719004-2\', \'F2\', \'0\', \'1\', \'-1\', \'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal\')'),
(77, '2019-07-31 02:02:26', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'70\', `stock value` = \'17990\' WHERE `raw material stock`.`material id` = \'F2\';'),
(78, '2019-07-31 02:06:22', 'material issue', 'insert', 'INSERT INTO `material issue` (`material id`, `material code`, `quantity issued`, `quantity returned`, `net usage`, `date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`) VALUES (\'F2\', \'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal\', \'1\', \'0\', \'1\', \'2019-07-31\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\')'),
(79, '2019-07-31 02:06:22', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'69\', `stock value` = \'17733\' WHERE `raw material stock`.`material id` = \'F2\';'),
(80, '2019-07-31 02:08:55', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'719000\', \'719005\', \'719005-1\', \'2019-07-31\', \'2019-07-31\', \'2019-07-31\', \'Select vendor\', \'\', \'Breakaway-Mens\', \'M0016\', \'-Breakaway-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(81, '2019-07-31 02:09:15', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 24'),
(82, '2019-07-31 02:15:29', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'719000\', \'719005\', \'719005-1\', \'2019-07-31\', \'2019-07-31\', \'2019-07-31\', \'Select vendor\', \'\', \'Chase-Mens\', \'M0006\', \'-Chase-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(83, '2019-07-31 02:15:41', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 25'),
(84, '2019-07-31 02:16:09', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'719000\', \'719005\', \'719005-1\', \'2019-07-31\', \'2019-07-31\', \'2019-07-31\', \'Select vendor\', \'\', \'Chase-Mens\', \'M0006\', \'-Chase-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(85, '2019-07-31 02:16:16', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 26'),
(86, '2019-08-02 05:58:55', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-2\''),
(87, '2019-08-02 05:58:55', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'31\' WHERE `sub/order master`.`serial number` = 19;'),
(88, '2019-08-02 05:58:56', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'L\', \'14\')'),
(89, '2019-08-02 05:58:56', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'M\', \'1\')'),
(90, '2019-08-02 05:58:56', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'S\', \'12\')'),
(91, '2019-08-02 05:58:56', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'XL\', \'4\')'),
(92, '2019-08-02 06:01:50', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'\', \'819000\', \'819001\', \'819001-1\', \'2019-08-02\', \'2019-08-02\', \'2019-08-02\', \'Select vendor\', \'\', \'Transition-Mens\', \'M0011\', \'-Transition-Mens\', \'0\', \'\', \'\', \'\', \'\', \'1\')'),
(93, '2019-08-02 06:02:15', 'sub/order master', 'delete', 'DELETE FROM `sub/order master` WHERE `sub/order master`.`serial number` = 20'),
(94, '2019-08-02 06:10:49', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-23\', `promised delivery date` = \'2019-07-23\', `vendor` = \'Orthofit\', `folder reference` = \'/test\', `product` = \'Singlet-Mens\', `pattern` = \'MSGLT01\', `order code` = \'test order-Singlet-Mens\', `product related instructions` = \'121\nhello\', `product notes` = \'23\', `printing details` = \'31\', `printing notes` = \'42\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 19;'),
(95, '2019-08-02 06:51:34', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-2\''),
(96, '2019-08-02 06:51:34', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'33\' WHERE `sub/order master`.`serial number` = 19;'),
(97, '2019-08-02 06:51:34', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'L\', \'14\')'),
(98, '2019-08-02 06:51:34', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'M\', \'1\')'),
(99, '2019-08-02 06:51:34', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'S\', \'12\')'),
(100, '2019-08-02 06:51:35', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'XL\', \'4\')'),
(101, '2019-08-02 06:51:35', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'XXL\', \'1\')'),
(102, '2019-08-02 06:51:35', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-2\', \'XXXL\', \'1\')'),
(103, '2019-09-03 10:48:50', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\')'),
(104, '2019-09-03 10:58:16', 'material master', 'delete', 'DELETE FROM `material master` WHERE `material master`.`serial number` = 167'),
(105, '2019-09-03 11:02:26', 'material master', 'update', 'UPDATE `material master` SET `unit of measurement - purchase` = \'\', `unit of measurement - usage` = \'\', `uom conversion` = \'0\', `vendor id` = \'\', `active` = \'1\', `minimum order quantity` = \'0\', `safety stock/reorder level` = \'0\', `attrib1` = \'\', `attrib2` = \'\', `attrib3` = \'\', `attrib4` = \'\', `attrib5` = \'\' WHERE `material master`.`serial number` = 166;'),
(106, '2019-09-09 14:00:45', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-23\', `promised delivery date` = \'2019-07-23\', `vendor` = \'Orthofit\', `folder reference` = \'/test\', `product` = \'Singlet-Mens\', `pattern` = \'MSGLT01\', `order code` = \'test order-Singlet-Mens\', `product related instructions` = \'121\nhello\', `product notes` = \'23\n2nd line\', `printing details` = \'31\ntest\nthird line\', `printing notes` = \'42\n2nd line\', `flag` = \'1\' WHERE `sub/order master`.`serial number` = 19;'),
(107, '2020-03-16 15:33:05', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-1\''),
(108, '2020-03-16 15:33:05', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'18\' WHERE `sub/order master`.`serial number` = 18;'),
(109, '2020-03-16 15:33:05', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'L\', \'10\')'),
(110, '2020-03-16 15:33:06', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'M\', \'1\')'),
(111, '2020-03-16 15:33:06', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'S\', \'5\')'),
(112, '2020-03-16 15:33:06', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'XL\', \'2\')'),
(113, '2020-03-16 15:34:17', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'27\' WHERE `sub/order master`.`serial number` = 18;'),
(114, '2020-03-16 15:34:17', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-1\''),
(115, '2020-03-16 15:34:17', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'L\', \'10\')'),
(116, '2020-03-16 15:34:17', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'M\', \'1\')'),
(117, '2020-03-16 15:34:17', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'S\', \'5\')'),
(118, '2020-03-16 15:34:17', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'XL\', \'2\')'),
(119, '2020-03-16 15:34:17', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'A\', \'9\')'),
(120, '2020-03-16 15:41:38', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'50\' WHERE `sub/order master`.`serial number` = 18;'),
(121, '2020-03-16 15:41:38', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-1\''),
(122, '2020-03-16 15:41:38', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'A\', \'9\')'),
(123, '2020-03-16 15:41:38', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'L\', \'10\')'),
(124, '2020-03-16 15:41:38', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'M\', \'1\')'),
(125, '2020-03-16 15:41:38', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'B\', \'30\')'),
(126, '2020-03-16 15:43:26', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'46\' WHERE `sub/order master`.`serial number` = 18;'),
(127, '2020-03-16 15:43:26', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-1\''),
(128, '2020-03-16 15:43:27', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'B\', \'30\')'),
(129, '2020-03-16 15:43:27', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'L\', \'10\')'),
(130, '2020-03-16 15:43:27', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'M\', \'1\')'),
(131, '2020-03-16 15:43:27', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'A\', \'5\')'),
(132, '2020-03-16 15:45:59', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'15\' WHERE `sub/order master`.`serial number` = 18;'),
(133, '2020-03-16 15:45:59', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719004-1\''),
(134, '2020-03-16 15:45:59', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'L\', \'10\')'),
(135, '2020-03-16 15:45:59', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'M\', \'1\')'),
(136, '2020-03-16 15:45:59', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719004-1\', \'A\', \'4\')'),
(137, '2020-03-16 16:08:21', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719001-4\''),
(138, '2020-03-16 16:08:21', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'1\' WHERE `sub/order master`.`serial number` = 17;'),
(139, '2020-03-16 16:08:21', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-4\', \'\\\'hello\\\'\', \'0\')'),
(140, '2020-03-16 16:08:21', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'719001-4\', \'A\', \'1\')'),
(141, '2020-03-17 15:02:03', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`) VALUES (\'D167\', \'0\', \'0\', \'0\')'),
(142, '2020-03-17 15:02:03', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'dfg\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'D167\', \'dfg\')'),
(143, '2020-03-17 15:03:15', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`) VALUES (\'S168\', \'0\', \'0\', \'0\')'),
(144, '2020-03-17 15:03:15', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'sdfadsdf\', \'dfs\', \'dsf\', \'sfdf\', \'sdf\', \'dfsf\', \'sdf\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'S168\', \'sdfadsdf-sdf-dfsf-sdf\')'),
(145, '2020-03-17 15:21:38', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`) VALUES (\'K169\', \'0\', \'0\', \'0\')'),
(146, '2020-03-17 15:21:38', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'kjkjhk\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'K169\', \'kjkjhk\')'),
(147, '2020-03-17 15:27:57', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`) VALUES (\'S170\', \'0\', \'0\', \'0\')'),
(148, '2020-03-17 15:27:57', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'sdfasf\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'S170\', \'sdfasf\')'),
(149, '2020-03-17 15:28:20', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'jgjfhf\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'J171\', \'jgjfhf\')'),
(150, '2020-03-17 15:28:20', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`) VALUES (\'J171\', \'0\', \'0\', \'0\')'),
(151, '2020-03-17 15:28:37', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'test\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'T172\', \'test\')'),
(152, '2020-03-17 15:28:37', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`) VALUES (\'T172\', \'0\', \'0\', \'0\')'),
(153, '2020-03-17 15:48:37', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'619001\', \'619001-1\', \'F21\', \'07\', \'0\', \'7\', \'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay\')'),
(154, '2020-03-17 15:48:37', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'619001\', \'619001-1\', \'F12\', \'03\', \'0\', \'3\', \'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati\')'),
(155, '2020-03-17 15:48:37', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'20\', `stock value` = \'11000\' WHERE `raw material stock`.`material id` = \'F12\';'),
(156, '2020-03-17 15:48:37', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'2.7\', `stock value` = \'972\' WHERE `raw material stock`.`material id` = \'F21\';'),
(157, '2020-03-17 16:01:36', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'619001\', \'619001-1\', \'F15\', \'13\', \'4\', \'9\', \'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati\')'),
(158, '2020-03-17 16:01:36', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'6006\', `stock value` = \'6006\' WHERE `raw material stock`.`material id` = \'S52\';'),
(159, '2020-03-17 16:01:36', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'619001\', \'619001-1\', \'S52\', \'9\', \'99\', \'-90\', \'Sizing Labels-White-M----Kushal\')'),
(160, '2020-03-17 16:01:36', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'8\', `stock value` = \'4400\' WHERE `raw material stock`.`material id` = \'F15\';'),
(161, '2020-03-17 16:04:13', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719003\', \'719003-1\', \'F19\', \'2\', \'0\', \'2\', \'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay\')'),
(162, '2020-03-17 16:04:13', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'7.5\', `stock value` = \'2700\' WHERE `raw material stock`.`material id` = \'F19\';'),
(163, '2020-03-17 16:10:59', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719001\', \'719001-3\', \'Z29\', \'1\', \'10\', \'-9\', \'Zipper - YKK - molded-Black-56cm-Open---Bathija\')'),
(164, '2020-03-17 16:10:59', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719001\', \'719001-3\', \'T72\', \'10\', \'2\', \'8\', \'Threads - unspun-Light Grey-A-star----ShreePoly\')'),
(165, '2020-03-17 16:10:59', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'10\', `stock value` = \'370\' WHERE `raw material stock`.`material id` = \'Z29\';'),
(166, '2020-03-17 16:10:59', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'10\', `stock value` = \'1250\' WHERE `raw material stock`.`material id` = \'T72\';'),
(167, '2020-03-17 16:18:56', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'rhishabh\\\'s order\', \'320000\', \'320001\', \'320001-1\', \'2020-03-17\', \'2020-03-17\', \'2020-03-17\', \'ShreePoly\', \'asdfasdfa\', \'Tri suit-Mens\', \'MTST1\', \'rhishabh\\\'s order-Tri suit-Mens\', \'0\', \'dsfasd\', \'sdfsfd\', \'vxcdfgsdfg\', \'dfgsdfgsgf\', \'1\')'),
(168, '2020-03-17 16:20:24', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'rhishabh hattarki\', \'rhishabh hattarki\', \'Vaishvik\', \'Vaishvik\', \'Vaishvik\', \'320001\', \'320001-1\', \'F12\', \'32\', \'123\', \'-91\', \'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati\')'),
(169, '2020-03-17 16:20:24', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'rhishabh hattarki\', \'rhishabh hattarki\', \'Vaishvik\', \'Vaishvik\', \'Vaishvik\', \'320001\', \'320001-1\', \'F127\', \'3\', \'2\', \'1\', \'Fabric - RK-RoyalBlue-180gsm-72inch-Tube--GVijay\')'),
(170, '2020-03-17 16:20:24', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'rhishabh hattarki\', \'rhishabh hattarki\', \'Vaishvik\', \'Vaishvik\', \'Vaishvik\', \'320001\', \'320001-1\', \'E60\', \'234\', \'1123\', \'-889\', \'Elastic - local-White-0.25inch----Vishal\')'),
(171, '2020-03-17 16:20:24', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'2\', `stock value` = \'720\' WHERE `raw material stock`.`material id` = \'F127\';'),
(172, '2020-03-17 16:20:24', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'889\', `stock value` = \'8890\' WHERE `raw material stock`.`material id` = \'E60\';'),
(173, '2020-03-17 16:20:24', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'111\', `stock value` = \'61050\' WHERE `raw material stock`.`material id` = \'F12\';'),
(174, '2020-03-17 16:24:13', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'test person\', \'test person\', \'Sonatapes\', \'Sonatapes\', \'Sonatapes\', \'320001\', \'320001-1\', \'F17\', \'23\', \'32\', \'-9\', \'Fabric - Lycra 100X20-Black-180gsm-60inch-Roll--GVijay\')'),
(175, '2020-03-17 16:24:13', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'13\', `stock value` = \'6500\' WHERE `raw material stock`.`material id` = \'F18\';'),
(176, '2020-03-17 16:24:13', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'test person\', \'test person\', \'Sonatapes\', \'Sonatapes\', \'Sonatapes\', \'320001\', \'320001-1\', \'E44\', \'2\', \'0\', \'2\', \'Elastic - waistband-Black-45mm----Sonatapes\')'),
(177, '2020-03-17 16:24:13', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'test person\', \'test person\', \'Sonatapes\', \'Sonatapes\', \'Sonatapes\', \'320001\', \'320001-1\', \'F18\', \'23\', \'2\', \'21\', \'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay\')'),
(178, '2020-03-17 16:24:13', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'10\', `stock value` = \'5000\' WHERE `raw material stock`.`material id` = \'F17\';'),
(179, '2020-03-17 16:24:13', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'349\', `stock value` = \'6980\' WHERE `raw material stock`.`material id` = \'E44\';'),
(180, '2020-03-17 16:25:05', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'320001\', \'320001-1\', \'T68\', \'0\', \'3\', \'-3\', \'Threads - unspun-Seagreen-A-star----ShreePoly\')'),
(181, '2020-03-17 16:25:05', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'320001\', \'320001-1\', \'F21\', \'2\', \'0\', \'2\', \'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay\')'),
(182, '2020-03-17 16:25:05', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'35\', `stock value` = \'4375\' WHERE `raw material stock`.`material id` = \'T68\';'),
(183, '2020-03-17 16:25:05', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'0.7\', `stock value` = \'252\' WHERE `raw material stock`.`material id` = \'F21\';'),
(184, '2020-03-17 16:30:52', 'material issue', 'insert', 'INSERT INTO `material issue` (`material id`, `material code`, `quantity issued`, `quantity returned`, `net usage`, `date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`) VALUES (\'F1\', \'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal\', \'9\', \'0\', \'9\', \'2020-03-17\', \'somebody\', \'somebody\', \'Pashupati\', \'Pashupati\', \'Pashupati\')'),
(185, '2020-03-17 16:30:52', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'1\', `stock value` = \'275\' WHERE `raw material stock`.`material id` = \'F1\';'),
(186, '2020-03-17 16:34:59', 'material issue', 'insert', 'INSERT INTO `material issue` (`material id`, `material code`, `quantity issued`, `quantity returned`, `net usage`, `date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`) VALUES (\'F1\', \'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal\', \'0\', \'22\', \'-22\', \'2020-03-17\', \'\', \'\', \'Select vendor\', \'Select vendor\', \'Select vendor\')'),
(187, '2020-03-17 16:34:59', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'23\', `stock value` = \'6325\' WHERE `raw material stock`.`material id` = \'F1\';'),
(188, '2020-03-18 15:02:51', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`) VALUES (\'2020-03-18\', \'kjhkjhk\', \'kjhkjhk\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719001\', \'719001-3\', \'F20\', \'98\', \'88\', \'10\', \'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay\')'),
(189, '2020-03-18 15:02:51', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'3\', `stock value` = \'1080\' WHERE `raw material stock`.`material id` = \'F20\';'),
(190, '2020-03-29 12:39:25', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'hello there\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'H173\', \'hello there\')');
INSERT INTO `logs` (`serial number`, `time stamp`, `table name`, `query type`, `query`) VALUES
(191, '2020-03-29 12:41:14', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'test\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'T174\', \'test\')'),
(192, '2020-03-29 12:43:02', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'kjhjhgljg\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'K175\', \'kjhjhgljg\')'),
(193, '2020-03-29 12:45:44', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'kjjbjhhhgf\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'K176\', \'kjjbjhhhgf\')'),
(194, '2020-03-29 12:45:44', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'K176\', \'0\', \'0\', \'0\', \'kjjbjhhhgf\')'),
(195, '2020-03-29 12:47:07', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'T177\', \'0\', \'0\', \'0\', \'test\')'),
(196, '2020-03-29 12:47:07', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'test\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'T177\', \'test\')'),
(197, '2020-03-29 12:51:41', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'terminator\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'T178\', \'terminator\')'),
(198, '2020-03-29 12:51:41', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'T178\', \'0\', \'0\', \'0\', \'terminator\')'),
(199, '2020-03-29 15:51:41', 'sub/order master', 'insert', 'INSERT INTO `sub/order master` (`order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES (\'test\', \'320000\', \'320002\', \'320002-1\', \'2020-03-17\', \'2020-03-17\', \'2020-03-17\', \'ShreePoly\', \'asdfasdfa\', \'Tri suit-Mens\', \'MTST1\', \'test-Tri suit-Mens\', \'0\', \'dsfasd\', \'sdfsfd\', \'vxcdfgsdfg\', \'dfgsdfgsgf\', \'1\')'),
(200, '2020-03-29 18:15:57', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'D179\', \'0\', \'0\', \'0\', \'dfgdg-fgd-dfgdf-dfgf-dfgdfg-dfdgdf\')'),
(201, '2020-03-29 18:15:57', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'dfgdg\', \'\', \'\', \'\', \'fgd\', \'dfgdf\', \'dfgf\', \'dfgdfg\', \'dfdgdf\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'D179\', \'dfgdg-fgd-dfgdf-dfgf-dfgdfg-dfdgdf\')'),
(202, '2020-03-29 18:32:29', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-03-29\', \'rhish\', \'rhish\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719002\', \'719002-1\', \'F22\', \'0\', \'0\', \'0\', \'Fabric - Mesh-Red-180gsm-72inch-Tube--GVijay\', \'test\')'),
(203, '2020-03-29 18:32:30', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'23\', `stock value` = \'8280\' WHERE `raw material stock`.`material id` = \'F22\';'),
(204, '2020-03-29 18:40:52', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-03-29\', \'lkkjlk\', \'lkkjlk\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719002\', \'719002-1\', \'R46\', \'0\', \'0\', \'0\', \'Reflective piping-Grey reflective-----Rushabh Ent\', \'hgjg hghgjhghgjhg gjhgjhgj hjgjhgjhgghghgjghgjgj hgjg\')'),
(205, '2020-03-29 18:40:52', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-03-29\', \'lkkjlk\', \'lkkjlk\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'719002\', \'719002-1\', \'F18\', \'0\', \'0\', \'0\', \'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay\', \'hfhgjhgjhgjhg gjhgg hgjghj j ghjgj j hjgj j hjgj jh hjgjhg kg\')'),
(206, '2020-03-29 18:40:52', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'13\', `stock value` = \'6500\' WHERE `raw material stock`.`material id` = \'F18\';'),
(207, '2020-03-29 18:40:52', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'-24\', `stock value` = \'-120\' WHERE `raw material stock`.`material id` = \'R46\';'),
(208, '2020-03-29 18:46:15', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-03-29\', \'lkkjlk\', \'lkkjlk\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'320002\', \'320002-1\', \'F21\', \'0\', \'0\', \'0\', \'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay\', \'hjkhgljg jkjgjg jhl jh j hgjk l\')'),
(209, '2020-03-29 18:46:15', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'0.7\', `stock value` = \'252\' WHERE `raw material stock`.`material id` = \'F21\';'),
(210, '2020-03-29 19:09:45', 'material issue', 'insert', 'INSERT INTO `material issue` (`material id`, `material code`, `quantity issued`, `quantity returned`, `net usage`, `date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `notes`) VALUES (\'F19\', \'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay\', \'0\', \'0\', \'0\', \'2020-03-29\', \'rhishabh\', \'rhishabh\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'sdfasdfad\nasdf\nasfd\nasfdasd\')'),
(211, '2020-03-29 19:09:45', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'7.5\', `stock value` = \'2700\' WHERE `raw material stock`.`material id` = \'F19\';'),
(212, '2020-03-29 19:35:18', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-23\', `promised delivery date` = \'2019-07-23\', `vendor` = \'Orthofit\', `folder reference` = \'/test\', `product` = \'Singlet-Mens\', `pattern` = \'MSGLT01\', `order code` = \'test order-Singlet-Mens\', `product related instructions` = \'121\nhello\', `product notes` = \'23\n2nd line\', `printing details` = \'31\ntest\nthird line\', `printing notes` = \'42\n2nd line\', `flag` = \'1\', `quantity completed` = \'30\', `quantity reworked` = \'5\' WHERE `sub/order master`.`serial number` = 19;'),
(213, '2020-03-29 19:36:16', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2019-07-22\', `promised delivery date` = \'2019-07-22\', `vendor` = \'Pioneer\', `folder reference` = \'qwer\', `product` = \'Raglan-RN-Mens\', `pattern` = \'M0002\', `order code` = \'test 4-Raglan-RN-Mens\', `product related instructions` = \'1234\\\'test\\\'\', `product notes` = \'123\\\'hello\\\'\', `printing details` = \'1234\', `printing notes` = \'1\', `flag` = \'1\', `quantity completed` = \'2\', `quantity reworked` = \'1\' WHERE `sub/order master`.`serial number` = 17;'),
(214, '2020-03-30 14:36:47', 'workstation operation', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'320001-1\''),
(215, '2020-03-30 14:36:47', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320001-1\', \'initial\', \'2020-03-30\')'),
(216, '2020-03-30 14:36:48', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320001-1\', \'intermediate\', \'2020-03-30\')'),
(217, '2020-03-30 14:37:47', 'workstation operation', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719001-4\''),
(218, '2020-03-30 14:37:47', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'initial\', \'2020-03-30\')'),
(219, '2020-03-30 14:37:47', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'intermediate\', \'2020-03-31\')'),
(220, '2020-03-30 14:37:47', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'final\', \'2020-04-01\')'),
(221, '2020-03-30 14:46:53', 'workstation operation', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'719001-4\''),
(222, '2020-03-30 14:46:55', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'initial\', \'2020-03-30\')'),
(223, '2020-03-30 14:46:55', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'intermediate\', \'2020-03-31\')'),
(224, '2020-03-30 14:52:23', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'320002-1\''),
(225, '2020-03-30 14:52:23', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'1\' WHERE `sub/order master`.`serial number` = 21;'),
(226, '2020-03-30 14:52:23', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'320002-1\', \'M\', \'1\')'),
(227, '2020-03-30 14:52:23', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'320002-1\', \'L\', \'0\')'),
(228, '2020-03-30 14:52:43', 'workstation operation', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'320002-1\''),
(229, '2020-03-30 14:52:43', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'initial\', \'2020-03-30\')'),
(230, '2020-03-30 14:55:47', 'workstation operation', 'delete', 'DELETE FROM `workstation operation` WHERE `suborder id` = \'719001-4\''),
(231, '2020-03-30 14:55:47', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'initial\', \'2020-03-30\')'),
(232, '2020-03-30 14:55:47', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'719001-4\', \'intermediate\', \'2020-03-31\')'),
(233, '2020-03-30 14:57:11', 'workstation operation', 'delete', 'DELETE FROM `workstation operation` WHERE `suborder id` = \'320002-1\''),
(234, '2020-03-30 14:57:11', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'initial\', \'2020-03-30\')'),
(235, '2020-03-30 14:57:11', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'final\', \'2020-03-30\')'),
(236, '2020-03-30 14:59:10', 'workstation operation', 'delete', 'DELETE FROM `workstation operation` WHERE `suborder id` = \'320002-1\''),
(237, '2020-03-30 14:59:10', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'initial\', \'2020-03-30\')'),
(238, '2020-03-30 14:59:10', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'intermediate\', \'2020-03-31\')'),
(239, '2020-03-30 14:59:10', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'final\', \'2020-04-01\')'),
(240, '2020-03-31 17:57:38', 'workstation master', 'insert', 'INSERT INTO `workstation master` (`workstation`) VALUES (\'post final\')'),
(241, '2020-03-31 17:57:55', 'workstation master', 'update', 'UPDATE `workstation master` SET `workstation` = \'semi intermediate\' WHERE `workstation master`.`serial number` = 5;'),
(242, '2020-03-31 17:58:09', 'workstation master', 'delete', 'DELETE FROM `workstation master` WHERE `workstation master`.`serial number` = 5'),
(243, '2020-04-02 11:29:43', 'order details', 'delete', 'DELETE FROM `order details` WHERE `suborder id` = \'320002-1\''),
(244, '2020-04-02 11:29:43', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `total` = \'0\' WHERE `sub/order master`.`serial number` = 21;'),
(245, '2020-04-02 11:29:43', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'320002-1\', \'S\', \'0\')'),
(246, '2020-04-02 11:29:43', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'320002-1\', \'M\', \'0\')'),
(247, '2020-04-02 11:29:44', 'order details', 'insert', 'INSERT INTO `order details` (`suborder id`, `size`, `quantity`) VALUES (\'320002-1\', \'L\', \'0\')'),
(248, '2020-04-02 11:31:33', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'A180\', \'0\', \'0\', \'0\', \'asdf-sdsf-sdf-sdf-sd-s\')'),
(249, '2020-04-02 11:31:33', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'asdf\', \'\', \'\', \'\', \'sdsf\', \'sdf\', \'sdf\', \'sd\', \'s\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'A180\', \'asdf-sdsf-sdf-sdf-sd-s\')'),
(250, '2020-04-02 11:38:39', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'T181\', \'0\', \'0\', \'0\', \'test-test-sdf-sdf-sd-s\')'),
(251, '2020-04-02 11:38:39', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'test\', \'\', \'\', \'\', \'test\', \'sdf\', \'sdf\', \'sd\', \'s\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'T181\', \'test-test-sdf-sdf-sd-s\')'),
(252, '2020-04-02 11:40:50', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-04-02\', \'rhish\', \'rhish\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'320002\', \'320002-1\', \'F15\', \'5\', \'1\', \'4\', \'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati\', \'\')'),
(253, '2020-04-02 11:40:50', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-04-02\', \'rhish\', \'rhish\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'320002\', \'320002-1\', \'F19\', \'3\', \'3\', \'0\', \'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay\', \'3\')'),
(254, '2020-04-02 11:40:50', 'material issue', 'insert', 'INSERT INTO `material issue` (`date issued`, `material issued by`, `material inward by`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `order id`, `suborder id`, `material id`, `quantity issued`, `quantity returned`, `net usage`, `material code`, `notes`) VALUES (\'2020-04-02\', \'rhish\', \'rhish\', \'Select vendor\', \'Select vendor\', \'Select vendor\', \'320002\', \'320002-1\', \'E43\', \'7\', \'3\', \'4\', \'Elastic - Silicon Gripper-White-28mm-10mmsilicongripper---China\', \'\')'),
(255, '2020-04-02 11:40:50', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'41\', `stock value` = \'1640\' WHERE `raw material stock`.`material id` = \'E43\';'),
(256, '2020-04-02 11:40:50', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'7.5\', `stock value` = \'2700\' WHERE `raw material stock`.`material id` = \'F19\';'),
(257, '2020-04-02 11:40:50', 'raw material stock', 'update', 'UPDATE `raw material stock` SET `stock` = \'4\', `stock value` = \'2200\' WHERE `raw material stock`.`material id` = \'F15\';'),
(258, '2020-04-02 11:54:08', 'workstation operation', 'delete', 'DELETE FROM `workstation operation` WHERE `suborder id` = \'320002-1\''),
(259, '2020-04-02 11:54:08', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'initial\', \'2020-03-30\')'),
(260, '2020-04-02 11:54:08', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'intermediate\', \'2020-03-31\')'),
(261, '2020-04-02 11:54:08', 'workstation operation', 'insert', 'INSERT INTO `workstation operation` (`suborder id`, `workstation`, `start date`) VALUES (\'320002-1\', \'final\', \'2020-04-02\')'),
(262, '2020-04-02 12:01:30', 'sub/order master', 'update', 'UPDATE `sub/order master` SET `date issued` = \'2020-03-17\', `promised delivery date` = \'2020-03-17\', `vendor` = \'ShreePoly\', `folder reference` = \'asdfasdfa\', `product` = \'Tri suit-Mens\', `pattern` = \'MTST1\', `order code` = \'test-Tri suit-Mens\', `product related instructions` = \'dsfasd\', `product notes` = \'sdfsfd\', `printing details` = \'vxcdfgsdfg\', `printing notes` = \'dfgsdfgsgf\', `flag` = \'1\', `quantity completed` = \'31\', `quantity reworked` = \'12\' WHERE `sub/order master`.`serial number` = 21;'),
(263, '2020-04-02 12:03:55', 'material master', 'delete', 'DELETE FROM `material master` WHERE `material master`.`serial number` = 181'),
(264, '2020-04-02 12:04:11', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'D181\', \'0\', \'0\', \'0\', \'dfd-test-sdf-sdf-sd-s\')'),
(265, '2020-04-02 12:04:11', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'dfd\', \'dfg\', \'gdgf\', \'\', \'test\', \'sdf\', \'sdf\', \'sd\', \'s\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'D181\', \'dfd-test-sdf-sdf-sd-s\')'),
(266, '2020-04-02 12:05:28', 'raw material stock', 'insert', 'INSERT INTO `raw material stock` (`material id`, `stock`, `purchase price`, `stock value`, `material code`) VALUES (\'R183\', \'0\', \'0\', \'0\', \'rdgf\')'),
(267, '2020-04-02 12:05:28', 'material master', 'insert', 'INSERT INTO `material master` (`material type`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `safety stock/reorder level`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`, `material id`, `material code`) VALUES (\'rdgf\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'1\', \'\', \'\', \'\', \'\', \'\', \'\', \'\', \'R183\', \'rdgf\')');

-- --------------------------------------------------------

--
-- Table structure for table `material issue`
--

CREATE TABLE `material issue` (
  `serial number` int(11) NOT NULL,
  `order id` int(11) NOT NULL,
  `suborder id` varchar(255) NOT NULL,
  `material id` varchar(255) NOT NULL,
  `material code` varchar(255) NOT NULL,
  `quantity issued` float NOT NULL,
  `quantity returned` float NOT NULL,
  `net usage` float NOT NULL,
  `material issued by` varchar(255) NOT NULL,
  `material inward by` varchar(255) NOT NULL,
  `date issued` date NOT NULL,
  `vendor (stitching)` varchar(255) NOT NULL,
  `vendor (printing)` varchar(255) NOT NULL,
  `vendor (packing)` varchar(255) NOT NULL,
  `out-of-state` varchar(255) NOT NULL,
  `delivery method` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `flag` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material issue`
--

INSERT INTO `material issue` (`serial number`, `order id`, `suborder id`, `material id`, `material code`, `quantity issued`, `quantity returned`, `net usage`, `material issued by`, `material inward by`, `date issued`, `vendor (stitching)`, `vendor (printing)`, `vendor (packing)`, `out-of-state`, `delivery method`, `notes`, `flag`) VALUES
(1, 619010, '619010-1', 'F11', 'Fabric - Dotknit-Dark Grey-140gsm-72inch-Roll-CE3232-Goyal', 25, 0, 0, 'Aditya', 'Aditya', '2019-06-13', '', '', '', '', '', '', 1),
(2, 619010, '619010-2', 'F8', 'Fabric - Dotknit-ElectricBlue-140gsm-72inch-Roll-CE3232-Goyal', 12.7, 0, 0, 'Aditya', 'Aditya', '2019-06-13', '', '', '', '', '', '', 1),
(5, 0, '', 'F21', 'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay', 5.3, 2.3, 3, '', '', '2019-07-09', '', '', '', '', '', '', 1),
(20, 0, '', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 1, 3, -2, '', '', '2019-07-13', '', '', '', '', '', '', 1),
(21, 0, '', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, 'Rhishabh Hattarki', 'Rhishabh Hattarki', '2019-07-13', 'test', 'test', 'test', '', '', '', 1),
(22, 0, '', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 0, 1, -1, 'Rhishabh', 'Rhishabh', '2019-07-15', 'Goyal', 'Goyal', 'Goyal', '', '', '', 1),
(24, 619010, '619010-1', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 0, 0, 0, 'test', 'test', '2019-07-15', 'Bathija', 'Bathija', 'Bathija', '', '', '', 1),
(28, 619010, '619010-1', 'F1', '', 1, -1, 0, 'xvcx', 'xvcx', '2019-07-16', 'Berenis', 'Berenis', 'Berenis', '', '', '', 1),
(29, 619010, '619010-1', 'F11', '', 2, -2, 4, 'fgdf', 'fgdf', '2019-07-16', 'ShreePoly', 'ShreePoly', 'ShreePoly', '', '', '', 1),
(30, 619010, '619010-1', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 1, -1, 2, 'qwer', 'qwer', '2019-07-16', 'ShreePoly', 'ShreePoly', 'ShreePoly', '', '', '', 1),
(31, 619010, '619010-1', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 1.5, -1, 2.5, 'qwer', 'qwer', '2019-07-16', 'ShreePoly', 'ShreePoly', 'ShreePoly', '', '', '', 1),
(32, 619010, '619010-1', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 4, 2, 2, 'qwer', 'qwer', '2019-07-16', 'ShreePoly', 'ShreePoly', 'ShreePoly', '', '', '', 1),
(33, 619010, '619010-1', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 5, 2, 3, 'rhishabh', 'rhishabh', '2019-07-16', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', '', '', '', 1),
(34, 619010, '619010-1', 'F3', 'Fabric - Dotknit-White-140gsm-72inch-Roll-CE3232-Goyal', 24, 9, 15, 'rhishabh', 'rhishabh', '2019-07-16', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', '', '', '', 1),
(35, 619010, '619010-2', 'F3', 'Fabric - Dotknit-White-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, 'rhishabh hattarki', 'rhishabh hattarki', '2019-07-17', 'OmkarArts', 'OmkarArts', 'OmkarArts', '', '', '', 1),
(36, 619010, '619010-2', 'F5', 'Fabric - Dotknit-Aqua-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, 'rhishabh hattarki', 'rhishabh hattarki', '2019-07-17', 'OmkarArts', 'OmkarArts', 'OmkarArts', '', '', '', 1),
(37, 619010, '619010-2', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 4, 0, 4, 'sdfsfs', 'sdfsfs', '2019-07-17', 'Goyal', 'Goyal', 'Goyal', '', '', '', 1),
(38, 619010, '619010-2', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 9, 2, 7, 'sdfsfs', 'sdfsfs', '2019-07-17', 'Goyal', 'Goyal', 'Goyal', '', '', '', 1),
(39, 619010, '619010-2', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 0, 9, -9, '', '', '2019-07-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(40, 619010, '619010-2', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 2, 0, 2, '', '', '2019-07-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(41, 619010, '619010-2', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 0, 2, -2, '', '', '2019-07-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(42, 719003, '719003-1', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 2, 1, 1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(43, 719003, '719003-1', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(44, 719003, '719003-1', 'F3', 'Fabric - Dotknit-White-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(45, 719003, '719003-1', 'F5', 'Fabric - Dotknit-Aqua-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(46, 719003, '719003-1', 'F14', 'Fabric - Spandex-DarkGrey-240gsm-60inch-Roll-POS1281-Pashupati', 0, 0, 0, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(47, 719003, '719003-1', 'Z29', 'Zipper - YKK - molded-Black-56cm-Open---Bathija', 0, 1, -1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(48, 719003, '719003-1', 'F7', 'Fabric - Dotknit-Flouro-orange-140gsm-72inch-Roll-CE3232-Goyal', 0, 1, -1, 'asdfa', 'asdfa', '2019-07-22', 'Kushal', 'Kushal', 'Kushal', '', '', '', 1),
(49, 719003, '719003-1', 'F17', 'Fabric - Lycra 100X20-Black-180gsm-60inch-Roll--GVijay', 0, 1, -1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(50, 719001, '719001-2', 'F19', 'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay', 0, 1, -1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(51, 719001, '719001-2', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(52, 719001, '719001-2', 'F8', 'Fabric - Dotknit-ElectricBlue-140gsm-72inch-Roll-CE3232-Goyal', 0, 0, 0, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(53, 719001, '719001-3', 'F10', 'Fabric - Dotknit-Lime-140gsm-72inch-Roll-CE3232-Goyal', 0, 0, 0, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(54, 719001, '719001-3', 'F11', 'Fabric - Dotknit-Dark Grey-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, 'rhishabh', 'rhishabh', '2019-07-22', 'Sonatapes', 'Sonatapes', 'Sonatapes', '', '', '', 1),
(55, 719001, '719001-4', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(56, 719001, '719001-4', 'F11', 'Fabric - Dotknit-Dark Grey-140gsm-72inch-Roll-CE3232-Goyal', 0, 1, -1, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(57, 719001, '719001-4', 'F15', 'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati', 0, 0, 0, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(58, 719001, '719001-4', 'F20', 'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay', 0, 0, 0, '', '', '2019-07-22', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(59, 719001, '719001-3', 'F9', 'Fabric - Dotknit-Lemon Yellow-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, 'sadsdfa', 'sadsdfa', '2019-07-22', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', '', '', '', 1),
(60, 719001, '719001-4', 'F20', 'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay', 0, 1, -1, 'asdfas', 'asdfas', '2019-07-22', 'GVijay', 'GVijay', 'GVijay', '', '', '', 1),
(61, 619001, '619001-1', 'F15', 'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati', 1, 0, 1, 'rhishabh-double test', 'rhishabh-double test', '2019-07-22', 'GVijay', 'GVijay', 'GVijay', '', '', '', 1),
(62, 619001, '619001-1', 'F16', 'Fabric - Lycra 100X20-White-180gsm-60inch-Roll--GVijay', 0, 1, -1, 'rhishabh-double test', 'rhishabh-double test', '2019-07-22', 'GVijay', 'GVijay', 'GVijay', '', '', '', 1),
(63, 719004, '719004-2', 'S53', 'Sizing Labels-White-L----Kushal', 67, 1, 66, 'rhishabh doing the test', 'rhishabh doing the test', '2019-07-23', 'Rushabh Ent', 'Rushabh Ent', 'Rushabh Ent', '', '', '', 1),
(64, 719004, '719004-2', 'T69', 'Threads - unspun-Lemon Yellow-A-star----ShreePoly', 0, 1, -1, 'rhishabh doing the test', 'rhishabh doing the test', '2019-07-23', 'Rushabh Ent', 'Rushabh Ent', 'Rushabh Ent', '', '', '', 1),
(65, 719004, '719004-2', 'P116', 'Pad - Cycling-Red-Mens-Gel---Bestway', 1, 0, 1, 'rhishabh doing the test', 'rhishabh doing the test', '2019-07-23', 'Rushabh Ent', 'Rushabh Ent', 'Rushabh Ent', '', '', '', 1),
(66, 719004, '719004-2', 'S53', 'Sizing Labels-White-L----Kushal', 50, 0, 50, 'rhishabh doing the test', 'rhishabh doing the test', '2019-07-23', 'Rushabh Ent', 'Rushabh Ent', 'Rushabh Ent', '', '', '', 1),
(67, 719004, '719004-2', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 0, 1.25, -1.25, 'rhishabh doing the test', 'rhishabh doing the test', '2019-07-23', 'Rushabh Ent', 'Rushabh Ent', 'Rushabh Ent', '', '', '', 1),
(68, 719004, '719004-2', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 0, 4.22, -4.22, 'rhishabh doing the test', 'rhishabh doing the test', '2019-07-23', 'Rushabh Ent', 'Rushabh Ent', 'Rushabh Ent', '', '', '', 1),
(69, 719004, '719004-1', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-23', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(70, 719004, '719004-1', 'F14', 'Fabric - Spandex-DarkGrey-240gsm-60inch-Roll-POS1281-Pashupati', 0, 0, 0, '', '', '2019-07-23', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(71, 719002, '719002-1', 'F18', 'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay', 1, 0, 1, 'rhishabh - test', 'rhishabh - test', '2019-07-29', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', '', '', '', 1),
(72, 719002, '719002-1', 'F15', 'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati', 0, 1, -1, 'rhishabh - test', 'rhishabh - test', '2019-07-29', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', 'ColorCraft-SonaliScreens', '', '', '', 1),
(73, 719001, '719001-1', 'F12', 'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati', 0, 0.9, -0.9, 'rhishabh', 'rhishabh', '2019-07-31', 'Berenis', 'Berenis', 'Berenis', '', '', '', 1),
(74, 719001, '719001-1', 'F14', 'Fabric - Spandex-DarkGrey-240gsm-60inch-Roll-POS1281-Pashupati', 2, 0, 2, 'rhishabh', 'rhishabh', '2019-07-31', 'Berenis', 'Berenis', 'Berenis', '', '', '', 1),
(75, 719001, '719001-1', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 0, 0, 0, 'rhishabh', 'rhishabh', '2019-07-31', 'Berenis', 'Berenis', 'Berenis', '', '', '', 1),
(76, 719001, '719001-1', 'F20', 'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay', 1, 3, -2, 'tommy', 'tommy', '2019-07-31', 'Pashupati', 'Pashupati', 'Pashupati', '', '', '', 1),
(77, 719004, '719004-2', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 0, 1, -1, 'rhishabh', 'rhishabh', '2019-07-31', 'AakashEnt', 'AakashEnt', 'AakashEnt', '', '', '', 1),
(78, 0, '', 'F2', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 1, 0, 1, '', '', '2019-07-31', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(79, 619001, '619001-1', 'F21', 'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay', 7, 0, 7, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(80, 619001, '619001-1', 'F12', 'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati', 3, 0, 3, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(81, 619001, '619001-1', 'F15', 'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati', 13, 4, 9, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(82, 619001, '619001-1', 'S52', 'Sizing Labels-White-M----Kushal', 9, 99, -90, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(83, 719003, '719003-1', 'F19', 'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay', 2, 0, 2, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(84, 719001, '719001-3', 'Z29', 'Zipper - YKK - molded-Black-56cm-Open---Bathija', 1, 10, -9, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(85, 719001, '719001-3', 'T72', 'Threads - unspun-Light Grey-A-star----ShreePoly', 10, 2, 8, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(86, 320001, '320001-1', 'F12', 'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati', 32, 123, -91, 'rhishabh hattarki', 'rhishabh hattarki', '2020-03-17', 'Vaishvik', 'Vaishvik', 'Vaishvik', '', '', '', 1),
(87, 320001, '320001-1', 'F127', 'Fabric - RK-RoyalBlue-180gsm-72inch-Tube--GVijay', 3, 2, 1, 'rhishabh hattarki', 'rhishabh hattarki', '2020-03-17', 'Vaishvik', 'Vaishvik', 'Vaishvik', '', '', '', 1),
(88, 320001, '320001-1', 'E60', 'Elastic - local-White-0.25inch----Vishal', 234, 1123, -889, 'rhishabh hattarki', 'rhishabh hattarki', '2020-03-17', 'Vaishvik', 'Vaishvik', 'Vaishvik', '', '', '', 1),
(89, 320001, '320001-1', 'F17', 'Fabric - Lycra 100X20-Black-180gsm-60inch-Roll--GVijay', 23, 32, -9, 'test person', 'test person', '2020-03-17', 'Sonatapes', 'Sonatapes', 'Sonatapes', '', '', '', 1),
(90, 320001, '320001-1', 'E44', 'Elastic - waistband-Black-45mm----Sonatapes', 2, 0, 2, 'test person', 'test person', '2020-03-17', 'Sonatapes', 'Sonatapes', 'Sonatapes', '', '', '', 1),
(91, 320001, '320001-1', 'F18', 'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay', 23, 2, 21, 'test person', 'test person', '2020-03-17', 'Sonatapes', 'Sonatapes', 'Sonatapes', '', '', '', 1),
(92, 320001, '320001-1', 'F21', 'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay', 2, 0, 2, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(93, 320001, '320001-1', 'T68', 'Threads - unspun-Seagreen-A-star----ShreePoly', 0, 3, -3, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(94, 0, '', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 9, 0, 9, 'somebody', 'somebody', '2020-03-17', 'Pashupati', 'Pashupati', 'Pashupati', '', '', '', 1),
(95, 0, '', 'F1', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 0, 22, -22, '', '', '2020-03-17', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(96, 719001, '719001-3', 'F20', 'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay', 98, 88, 10, 'kjhkjhk', 'kjhkjhk', '2020-03-18', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(97, 719002, '719002-1', 'F22', 'Fabric - Mesh-Red-180gsm-72inch-Tube--GVijay', 0, 0, 0, 'rhish', 'rhish', '2020-03-29', 'Select vendor', 'Select vendor', 'Select vendor', '', '', 'test', 1),
(98, 719002, '719002-1', 'R46', 'Reflective piping-Grey reflective-----Rushabh Ent', 0, 0, 0, 'lkkjlk', 'lkkjlk', '2020-03-29', 'Select vendor', 'Select vendor', 'Select vendor', '', '', 'hgjg hghgjhghgjhg gjhgjhgj hjgjhgjhgghghgjghgjgj hgjg', 1),
(99, 719002, '719002-1', 'F18', 'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay', 0, 0, 0, 'lkkjlk', 'lkkjlk', '2020-03-29', 'Select vendor', 'Select vendor', 'Select vendor', '', '', 'hfhgjhgjhgjhg gjhgg hgjghj j ghjgj j hjgj j hjgj jh hjgjhg kg', 1),
(100, 320002, '320002-1', 'F21', 'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay', 0, 0, 0, 'lkkjlk', 'lkkjlk', '2020-03-29', 'Select vendor', 'Select vendor', 'Select vendor', '', '', 'hjkhgljg jkjgjg jhl jh j hgjk l', 1),
(101, 0, '', 'F19', 'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay', 0, 0, 0, 'rhishabh', 'rhishabh', '2020-03-29', 'Select vendor', 'Select vendor', 'Select vendor', '', '', 'sdfasdfad\nasdf\nasfd\nasfdasd', 1),
(102, 320002, '320002-1', 'E43', 'Elastic - Silicon Gripper-White-28mm-10mmsilicongripper---China', 7, 3, 4, 'rhish', 'rhish', '2020-04-02', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(103, 320002, '320002-1', 'F15', 'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati', 5, 1, 4, 'rhish', 'rhish', '2020-04-02', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '', 1),
(104, 320002, '320002-1', 'F19', 'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay', 3, 3, 0, 'rhish', 'rhish', '2020-04-02', 'Select vendor', 'Select vendor', 'Select vendor', '', '', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `material master`
--

CREATE TABLE `material master` (
  `serial number` int(11) NOT NULL,
  `material id` varchar(255) NOT NULL,
  `material type` varchar(255) NOT NULL,
  `material code` varchar(255) NOT NULL,
  `unit of measurement - purchase` varchar(255) NOT NULL,
  `unit of measurement - usage` varchar(255) NOT NULL,
  `uom conversion` float NOT NULL,
  `main attrib1` varchar(255) NOT NULL,
  `main attrib2` varchar(255) NOT NULL,
  `main attrib3` varchar(255) NOT NULL,
  `main attrib4` varchar(255) NOT NULL,
  `main attrib5` varchar(255) NOT NULL,
  `vendor id` varchar(255) NOT NULL,
  `vendor name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `minimum order quantity` int(11) NOT NULL,
  `lead time to reorder` int(11) NOT NULL,
  `safety stock/reorder level` int(11) NOT NULL,
  `monthly burnrate` float NOT NULL,
  `attrib1` varchar(255) NOT NULL,
  `attrib2` varchar(255) NOT NULL,
  `attrib3` varchar(255) NOT NULL,
  `attrib4` varchar(255) NOT NULL,
  `attrib5` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material master`
--

INSERT INTO `material master` (`serial number`, `material id`, `material type`, `material code`, `unit of measurement - purchase`, `unit of measurement - usage`, `uom conversion`, `main attrib1`, `main attrib2`, `main attrib3`, `main attrib4`, `main attrib5`, `vendor id`, `vendor name`, `active`, `minimum order quantity`, `lead time to reorder`, `safety stock/reorder level`, `monthly burnrate`, `attrib1`, `attrib2`, `attrib3`, `attrib4`, `attrib5`) VALUES
(1, 'F1', 'Fabric - Dotknit', 'Fabric - Dotknit-Red-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Red', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 10, 0, 4, 0, 'updated', 'updated', 'updated', 'updated', 'qwertyupdated'),
(2, 'F2', 'Fabric - Dotknit', 'Fabric - Dotknit-Black-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Black', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(3, 'F3', 'Fabric - Dotknit', 'Fabric - Dotknit-White-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'White', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(5, 'F5', 'Fabric - Dotknit', 'Fabric - Dotknit-Aqua-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Aqua', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(7, 'F7', 'Fabric - Dotknit', 'Fabric - Dotknit-Flouro-orange-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Flouro-orange', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(8, 'F8', 'Fabric - Dotknit', 'Fabric - Dotknit-ElectricBlue-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'ElectricBlue', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(9, 'F9', 'Fabric - Dotknit', 'Fabric - Dotknit-Lemon Yellow-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Lemon Yellow', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(10, 'F10', 'Fabric - Dotknit', 'Fabric - Dotknit-Lime-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Lime', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(11, 'F11', 'Fabric - Dotknit', 'Fabric - Dotknit-Dark Grey-140gsm-72inch-Roll-CE3232-Goyal', 'Kilo', 'Kilo', 1, 'Dark Grey', '140gsm', '72inch', 'Roll', 'CE3232', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(12, 'F12', 'Fabric - Spandex', 'Fabric - Spandex-Black-240gsm-60inch-Roll-POS1281-Pashupati', 'Kilo', 'Kilo', 1, 'Black', '240gsm', '60inch', 'Roll', 'POS1281', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(13, 'F13', 'Fabric - Spandex', 'Fabric - Spandex-White-240gsm-60inch-Roll-POS1281-Pashupati', 'Kilo', 'Kilo', 1, 'White', '240gsm', '60inch', 'Roll', 'POS1281', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(14, 'F14', 'Fabric - Spandex', 'Fabric - Spandex-DarkGrey-240gsm-60inch-Roll-POS1281-Pashupati', 'Kilo', 'Kilo', 1, 'DarkGrey', '240gsm', '60inch', 'Roll', 'POS1281', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(15, 'F15', 'Fabric - Spandex', 'Fabric - Spandex-Navy-240gsm-60inch-Roll-POS1281-Pashupati', 'Kilo', 'Kilo', 1, 'Navy', '240gsm', '60inch', 'Roll', 'POS1281', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(16, 'F16', 'Fabric - Lycra 100X20', 'Fabric - Lycra 100X20-White-180gsm-60inch-Roll--GVijay', 'Kilo', 'Kilo', 1, 'White', '180gsm', '60inch', 'Roll', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(17, 'F17', 'Fabric - Lycra 100X20', 'Fabric - Lycra 100X20-Black-180gsm-60inch-Roll--GVijay', 'Kilo', 'Kilo', 1, 'Black', '180gsm', '60inch', 'Roll', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(18, 'F18', 'Fabric - Lycra 100X40', 'Fabric - Lycra 100X40-Black-220gsm-60inch-Roll--GVijay', 'Kilo', 'Kilo', 1, 'Black', '220gsm', '60inch', 'Roll', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(19, 'F19', 'Fabric - Mesh', 'Fabric - Mesh-Black-180gsm-72inch-Tube--GVijay', 'Kilo', 'Kilo', 1, 'Black', '180gsm', '72inch', 'Tube', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(20, 'F20', 'Fabric - Mesh', 'Fabric - Mesh-White-180gsm-72inch-Tube--GVijay', 'Kilo', 'Kilo', 1, 'White', '180gsm', '72inch', 'Tube', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(21, 'F21', 'Fabric - Mesh', 'Fabric - Mesh-Navy-180gsm-72inch-Tube--GVijay', 'Kilo', 'Kilo', 1, 'Navy', '180gsm', '72inch', 'Tube', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(22, 'F22', 'Fabric - Mesh', 'Fabric - Mesh-Red-180gsm-72inch-Tube--GVijay', 'Kilo', 'Kilo', 1, 'Red', '180gsm', '72inch', 'Tube', '', '', 'GVijay', 1, 0, 0, 0, 0, '', '', '', '', ''),
(23, 'F23', 'Fabric - JC011', 'Fabric - JC011-White-180gsm-60inch-Roll--China', 'Kilo', 'Kilo', 1, 'White', '180gsm', '60inch', 'Roll', '', '', 'China', 1, 0, 0, 0, 0, '', '', '', '', ''),
(24, 'F24', 'Fabric - Polywoven Spandex', 'Fabric - Polywoven Spandex-Black-130gsm-60inch-Roll-POS1645-Pashupati', 'Kilo', 'Kilo', 1, 'Black', '130gsm', '60inch', 'Roll', 'POS1645', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(25, 'F25', 'Fabric - Polywoven Spandex', 'Fabric - Polywoven Spandex-Navy-130gsm-60inch-Roll-POS1645-Pashupati', 'Kilo', 'Kilo', 1, 'Navy', '130gsm', '60inch', 'Roll', 'POS1645', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(26, 'F26', 'Fabric - Dotknit', 'Fabric - Dotknit-DarkGrey-140gsm-60inch-Roll-POS1707-Pashupati', 'Kilo', 'Kilo', 1, 'DarkGrey', '140gsm', '60inch', 'Roll', 'POS1707', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(27, 'F27', 'Fabric - Dotknit', 'Fabric - Dotknit-Aubergine-140gsm-60inch-Roll-POS1707-Pashupati', 'Kilo', 'Kilo', 1, 'Aubergine', '140gsm', '60inch', 'Roll', 'POS1707', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(28, 'F28', 'Fabric - Dotknit', 'Fabric - Dotknit-Scuba-140gsm-60inch-Roll-POS1707-Pashupati', 'Kilo', 'Kilo', 1, 'Scuba', '140gsm', '60inch', 'Roll', 'POS1707', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(29, 'Z29', 'Zipper - YKK - molded', 'Zipper - YKK - molded-Black-56cm-Open---Bathija', 'Count', 'Count', 1, 'Black', '56cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(30, 'Z30', 'Zipper - YKK - molded', 'Zipper - YKK - molded-Black-60cm-Open---Bathija', 'Count', 'Count', 1, 'Black', '60cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(31, 'Z31', 'Zipper - YKK - molded', 'Zipper - YKK - molded-Black-70cm-Open---Bathija', 'Count', 'Count', 1, 'Black', '70cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(32, 'Z32', 'Zipper - YKK - molded', 'Zipper - YKK - molded-Black-50.5cm-Open---Bathija', 'Count', 'Count', 1, 'Black', '50.5cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(33, 'Z33', 'Zipper - YKK - molded', 'Zipper - YKK - molded-White-56cm-Open---Bathija', 'Count', 'Count', 1, 'White', '56cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(34, 'Z34', 'Zipper - YKK - molded', 'Zipper - YKK - molded-White-60cm-Open---Bathija', 'Count', 'Count', 1, 'White', '60cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(35, 'Z35', 'Zipper - YKK - molded', 'Zipper - YKK - molded-White-70cm-Open---Bathija', 'Count', 'Count', 1, 'White', '70cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(36, 'Z36', 'Zipper - YKK - molded', 'Zipper - YKK - molded-White-50.5cm-Open---Bathija', 'Count', 'Count', 1, 'White', '50.5cm', 'Open', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(37, 'Z37', 'Zipper - YKK - coil', 'Zipper - YKK - coil-Black-65cm-Closed---Bathija', 'Count', 'Count', 1, 'Black', '65cm', 'Closed', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(38, 'Z38', 'Zipper - YKK - coil', 'Zipper - YKK - coil-White-65cm-Closed---Bathija', 'Count', 'Count', 1, 'White', '65cm', 'Closed', '', '', '', 'Bathija', 1, 0, 0, 0, 0, '', '', '', '', ''),
(39, 'P39', 'Pad - Cycling', 'Pad - Cycling-Red-Mens-Gel---China', 'Count', 'Count', 1, 'Red', 'Mens', 'Gel', '', '', '', 'China', 1, 0, 0, 0, 0, '', '', '', '', ''),
(40, 'P40', 'Pad - Cycling', 'Pad - Cycling-Pink-Womens-Gel---China', 'Count', 'Count', 1, 'Pink', 'Womens', 'Gel', '', '', '', 'China', 1, 0, 0, 0, 0, '', '', '', '', ''),
(41, 'P41', 'Pad - Triathlon', 'Pad - Triathlon-Grey-Mens-Foam---Berenis', 'Count', 'Count', 1, 'Grey', 'Mens', 'Foam', '', '', '', 'Berenis', 1, 0, 0, 0, 0, '', '', '', '', ''),
(42, 'P42', 'Pad - Cycling', 'Pad - Cycling-Brown-Mens-Foam---Berenis', 'Count', 'Count', 1, 'Brown', 'Mens', 'Foam', '', '', '', 'Berenis', 1, 0, 0, 0, 0, '', '', '', '', ''),
(43, 'E43', 'Elastic - Silicon Gripper', 'Elastic - Silicon Gripper-White-28mm-10mmsilicongripper---China', 'Meter', 'Meter', 1, 'White', '28mm', '10mmsilicongripper', '', '', '', 'China', 1, 0, 0, 0, 0, '', '', '', '', ''),
(44, 'E44', 'Elastic - waistband', 'Elastic - waistband-Black-45mm----Sonatapes', 'Meter', 'Meter', 1, 'Black', '45mm', '', '', '', '', 'Sonatapes', 1, 0, 0, 0, 0, '', '', '', '', ''),
(45, 'E45', 'Elastic - tape', 'Elastic - tape-White-8mm----Sonatapes', 'Meter', 'Meter', 1, 'White', '8mm', '', '', '', '', 'Sonatapes', 1, 0, 0, 0, 0, '', '', '', '', ''),
(46, 'R46', 'Reflective piping', 'Reflective piping-Grey reflective-----Rushabh Ent', 'Meter', 'Meter', 1, 'Grey reflective', '', '', '', '', '', 'Rushabh Ent', 1, 0, 0, 0, 0, '', '', '', '', ''),
(47, 'R47', 'Reflective tape', 'Reflective tape-Grey reflective-2inch----Rushabh Ent', 'Roll', 'Roll', 1, 'Grey reflective', '2inch', '', '', '', '', 'Rushabh Ent', 1, 0, 0, 0, 0, '', '', '', '', ''),
(48, 'W48', 'Washcare Labels', 'Washcare Labels-White-Standard----Kushal', 'Count', 'Count', 1, 'White', 'Standard', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(49, 'S49', 'Sizing Labels', 'Sizing Labels-White-2XS----Kushal', 'Count', 'Count', 1, 'White', '2XS', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(50, 'S50', 'Sizing Labels', 'Sizing Labels-White-XS----Kushal', 'Count', 'Count', 1, 'White', 'XS', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(51, 'S51', 'Sizing Labels', 'Sizing Labels-White-S----Kushal', 'Count', 'Count', 1, 'White', 'S', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(52, 'S52', 'Sizing Labels', 'Sizing Labels-White-M----Kushal', 'Count', 'Count', 1, 'White', 'M', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(53, 'S53', 'Sizing Labels', 'Sizing Labels-White-L----Kushal', 'Count', 'Count', 1, 'White', 'L', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(54, 'S54', 'Sizing Labels', 'Sizing Labels-White-XL----Kushal', 'Count', 'Count', 1, 'White', 'XL', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(55, 'S55', 'Sizing Labels', 'Sizing Labels-White-XXL----Kushal', 'Count', 'Count', 1, 'White', 'XXL', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(56, 'S56', 'Sizing Labels', 'Sizing Labels-White-Blank----Kushal', 'Count', 'Count', 1, 'White', 'Blank', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(57, 'G57', 'Gender Labels', 'Gender Labels-White-Mens----Kushal', 'Count', 'Count', 1, 'White', 'Mens', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(58, 'G58', 'Gender Labels', 'Gender Labels-White-Womens----Kushal', 'Count', 'Count', 1, 'White', 'Womens', '', '', '', '', 'Kushal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(59, 'E59', 'Elastic - local', 'Elastic - local-White-0.5inch----Vishal', 'Meter', 'Meter', 1, 'White', '0.5inch', '', '', '', '', 'Vishal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(60, 'E60', 'Elastic - local', 'Elastic - local-White-0.25inch----Vishal', 'Meter', 'Meter', 1, 'White', '0.25inch', '', '', '', '', 'Vishal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(61, 'P61', 'Polybags - ziplock', 'Polybags - ziplock-Clear-11X14----ExcelPoly', 'Count', 'Count', 1, 'Clear', '11X14', '', '', '', '', 'ExcelPoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(62, 'P62', 'Polybag - standard', 'Polybag - standard-Clear-10x16----JaiPlastic', 'Count', 'Count', 1, 'Clear', '10x16', '', '', '', '', 'JaiPlastic', 1, 0, 0, 0, 0, '', '', '', '', ''),
(63, 'T63', 'Threads - unspun', 'Threads - unspun-Red-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Red', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(64, 'T64', 'Threads - unspun', 'Threads - unspun-Black-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Black', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(65, 'T65', 'Threads - unspun', 'Threads - unspun-White-A-star----ShreePoly', 'Cones', 'Cones', 1, 'White', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(66, 'T66', 'Threads - unspun', 'Threads - unspun-Navy-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Navy', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(67, 'T67', 'Threads - unspun', 'Threads - unspun-Aqua-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Aqua', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(68, 'T68', 'Threads - unspun', 'Threads - unspun-Seagreen-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Seagreen', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(69, 'T69', 'Threads - unspun', 'Threads - unspun-Lemon Yellow-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Lemon Yellow', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(70, 'T70', 'Threads - unspun', 'Threads - unspun-Lime-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Lime', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(71, 'T71', 'Threads - unspun', 'Threads - unspun-Dark Grey-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Dark Grey', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(72, 'T72', 'Threads - unspun', 'Threads - unspun-Light Grey-A-star----ShreePoly', 'Cones', 'Cones', 1, 'Light Grey', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(73, 'T73', 'Threads - unspun', 'Threads - unspun-ElectricBlue-A-star----ShreePoly', 'Cones', 'Cones', 1, 'ElectricBlue', 'A-star', '', '', '', '', 'ShreePoly', 1, 0, 0, 0, 0, '', '', '', '', ''),
(74, 'F74', 'Fabric - Dotknit', 'Fabric - Dotknit-Red-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Red', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(75, 'F75', 'Fabric - Dotknit', 'Fabric - Dotknit-Black-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Black', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(76, 'F76', 'Fabric - Dotknit', 'Fabric - Dotknit-White-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'White', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(77, 'F77', 'Fabric - Dotknit', 'Fabric - Dotknit-Navy-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Navy', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(78, 'F78', 'Fabric - Dotknit', 'Fabric - Dotknit-Aqua-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Aqua', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(79, 'F79', 'Fabric - Dotknit', 'Fabric - Dotknit-Seagreen-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Seagreen', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(80, 'F80', 'Fabric - Dotknit', 'Fabric - Dotknit-Flouro-orange-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Flouro-orange', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(81, 'F81', 'Fabric - Dotknit', 'Fabric - Dotknit-ElectricBlue-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'ElectricBlue', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(82, 'F82', 'Fabric - Dotknit', 'Fabric - Dotknit-Lemon Yellow-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Lemon Yellow', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(83, 'F83', 'Fabric - Dotknit', 'Fabric - Dotknit-Lime-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Lime', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(84, 'F84', 'Fabric - Dotknit', 'Fabric - Dotknit-Dark Grey-140gsm-60inch-Roll--Goyal', 'Kilo', 'Kilo', 1, 'Dark Grey', '140gsm', '60inch', 'Roll', '', '', 'Goyal', 1, 0, 0, 0, 0, '', '', '', '', ''),
(85, 'F85', 'Fabric - Spandex', 'Fabric - Spandex-Navy Blue Melange-220gsm-60inch-Roll--Pashupati', 'Kilo', 'Kilo', 1, 'Navy Blue Melange', '220gsm', '60inch', 'Roll', '', '', 'Pashupati', 1, 0, 0, 0, 0, '', '', '', '', ''),
(86, 'None', 'None', 'None------', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(87, 'F87', 'Fabric - rollsublimated', 'Fabric - rollsublimated-Lime-print1-140gsm-72inch-Roll--Goyal', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(88, 'F88', 'Fabric - rollsublimated', 'Fabric - rollsublimated-Lime-print2-140gsm-72inch-Roll--Goyal', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(89, 'F89', 'Fabric - rollsublimated', 'Fabric - rollsublimated-Red-print1-140gsm-72inch-Roll--Goyal', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(90, 'R90', 'Reflective Tabs Cut', 'Reflective Tabs Cut-Grey reflective-----Rushabh Ent', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(91, 'F91', 'Fabric - Melange', 'Fabric - Melange-Rust-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(92, 'F92', 'Fabric - Melange', 'Fabric - Melange-Moss-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(93, 'F93', 'Fabric - Melange', 'Fabric - Melange-DirtyBlue-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(94, 'F94', 'Fabric - Melange', 'Fabric - Melange-Denim-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(95, 'F95', 'Fabric - Melange', 'Fabric - Melange-Citrus-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(96, 'F96', 'Fabric - Melange', 'Fabric - Melange-Slate-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(97, 'F97', 'Fabric - Melange', 'Fabric - Melange-Sky-180gsm-60inch---', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(98, 'F98', 'Fabric - Mesh', 'Fabric - Mesh-Black-Shoebag----', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(99, 'E99', 'Elastic - Silicon Gripper', 'Elastic - Silicon Gripper-Black-Green-20mm----', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(100, 'F100', 'Fabric - Plainknit', 'Fabric - Plainknit-Orange-160gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(101, 'F101', 'Fabric - LRK', 'Fabric - LRK-Dark Grey-160gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(102, 'F102', 'Fabric - RK', 'Fabric - RK-Dark Grey-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(103, 'F103', 'Fabric - RK', 'Fabric - RK-Red-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(104, 'F104', 'Fabric - RK', 'Fabric - RK-Black-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(105, 'F105', 'Fabric - RK', 'Fabric - RK-Apple Green-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(106, 'Z106', 'Zippers Local - 6 inch', 'Zippers Local - 6 inch-Navy-Local-6inch---Local', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(107, 'T107', 'Threads - unspun', 'Threads - unspun-Aubergine-A-star----ShreePoly', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(108, 'Z108', 'Zippers invisible - 8 inch', 'Zippers invisible - 8 inch-Aubergine-Invisible-8inch---Local', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(109, 'Z109', 'Zippers invisible - 8 inch', 'Zippers invisible - 8 inch-Scuba-Invisible-8inch---Local', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(110, 'Z110', 'Zippers invisible - 8 inch', 'Zippers invisible - 8 inch-Black-Invisible-8inch---Local', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(111, 'Z111', 'Zippers Local - 8 inch', 'Zippers Local - 8 inch-Aubergine-Local-8inch---Local', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(112, 'Z112', 'Zippers Local - 8 inch', 'Zippers Local - 8 inch-Black-Local-8inch---Local', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(113, 'F113', 'Fabric - Plainknit', 'Fabric - Plainknit-Black-160gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(114, 'F114', 'Fabric - Plainknit', 'Fabric - Plainknit-Brown-160gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(115, 'F115', 'Fabric-PointelleMesh', 'Fabric-PointelleMesh-White-140gsm-60inch-Roll-POS2901-Pashupati', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(116, 'P116', 'Pad - Cycling', 'Pad - Cycling-Red-Mens-Gel---Bestway', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(117, 'E117', 'Elastic - Silicon Gripper', 'Elastic - Silicon Gripper-White-40cm-Powerband-Roll--Bestway', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(118, 'F118', 'Fabric - Spandex', 'Fabric - Spandex-Black-240gsm-60inch-Roll-POS2922-Pashupati', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(119, 'F119', 'Fabric - Popcorn', 'Fabric - Popcorn-Purple-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(120, 'F120', 'Fabric - Popcorn', 'Fabric - Popcorn-Yellow-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(121, 'F121', 'Fabric - Popcorn', 'Fabric - Popcorn-DarkGrey-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(122, 'F122', 'Fabric - Popcorn', 'Fabric - Popcorn-Red-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(123, 'F123', 'Fabric - Popcorn', 'Fabric - Popcorn-LightGrey-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(124, 'F124', 'Fabric - Popcorn', 'Fabric - Popcorn-AppleGreen-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(125, 'F125', 'Fabric - Popcorn', 'Fabric - Popcorn-NavyBlue-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(126, 'F126', 'Fabric - Popcorn', 'Fabric - Popcorn-Black-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(127, 'F127', 'Fabric - RK', 'Fabric - RK-RoyalBlue-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(128, 'F128', 'Fabric - RK', 'Fabric - RK-MojoBlue-180gsm-72inch-Tube--GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(129, 'C129', 'Collar', 'Collar-Yellow-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(130, 'C130', 'Collar', 'Collar-Red-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(131, 'C131', 'Collar', 'Collar-AppleGreen-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(132, 'C132', 'Collar', 'Collar-DarkGrey-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(133, 'C133', 'Collar', 'Collar-NavyBlue-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(134, 'C134', 'Collar', 'Collar-Black-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(135, 'C135', 'Collar', 'Collar-Purple-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(136, 'C136', 'Collar', 'Collar-White-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(137, 'C137', 'Collar', 'Collar-LightGrey-Polyester----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(138, 'C138', 'Collar', 'Collar-NavyBlue-Cotton----GVijay', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(139, 'F139', 'Fabric - AeroKnit', 'Fabric - AeroKnit-White-130gsm-60inch-Roll-POS1884-Pashupati', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(140, 'F140', 'Fabric - Dotknit', 'Fabric - Dotknit-Pink-140gsm-60inch-Roll-POS1707-Pashupati', '', '', 1, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(141, 'E141', 'Elastic - Silicon Gripper', 'Elastic - Silicon Gripper-White-25mm-10mmsilicongripper-Open-BWE03-Bestway', '', '', 0.0110705, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(151, 'undefinedtest1', 'test', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(152, 'testtest1', 'test', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(153, 'Fs.no.', 'fat', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(154, 'Tundefined', 'test', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(155, 'T154', 'test22', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(156, 'T1551', 'test44', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(157, 'T157', 'test55', '', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(158, 'T158', 'test1', '', 'test2', 'test3', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(159, '1159', '1', '', '2', '3', 4, '5', '6', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(160, 'T160', 't1', '', '2', '3', 4, '5', '6', '7', '8', '9', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(161, 'Q161', 'q1', '', '2', '3', 4, '5', '6', '7', '8', '9', '10', '11', 1, 0, 0, 0, 0, '', '', '', '', ''),
(162, 'Q162', 'q1', '', '2', '3', 4, '5', '6', '7', '8', '9', '10', '11', 1, 12, 0, 13, 0, '14', '', '', '', ''),
(163, 'Q163', 'q1', '', '2', '3', 4, '5', '6', '7', '8', '9', '10', '11', 1, 12, 0, 13, 0, '14', '15', '16', '17', '18'),
(164, 'L164', 'last test', 'last test-shirt-white-patchy-shiny-fancy-Crazy vendor', 'kilo', 'gram', 1000, 'shirt', 'white', 'patchy', 'shiny', 'fancy', 'V233', 'Crazy vendor', 1, 34, 0, 50, 0, 'shade', 'light', 'low opaque', 'bluish', 'long'),
(165, 'A165', 'as', 'as', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(166, 'T166', 'test', 'test-sdf-sas-sfd-sdf', '', '', 0, 'sdf', 'sas', 'sfd', 'sdf', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(167, 'D167', 'dfg', 'dfg', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(168, 'S168', 'sdfadsdf', 'sdfadsdf-sdf-dfsf-sdf', 'dfs', 'dsf', 0, 'sdf', 'dfsf', 'sdf', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(169, 'K169', 'kjkjhk', 'kjkjhk', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(170, 'S170', 'sdfasf', 'sdfasf', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(171, 'J171', 'jgjfhf', 'jgjfhf', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(172, 'T172', 'test', 'test', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(173, 'H173', 'hello there', 'hello there', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(174, 'T174', 'test', 'test', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(175, 'K175', 'kjhjhgljg', 'kjhjhgljg', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(176, 'K176', 'kjjbjhhhgf', 'kjjbjhhhgf', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(177, 'T177', 'test', 'test', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(178, 'T178', 'terminator', 'terminator', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(179, 'D179', 'dfgdg', 'dfgdg-fgd-dfgdf-dfgf-dfgdfg-dfdgdf', '', '', 0, 'fgd', 'dfgdf', 'dfgf', 'dfgdfg', 'dfdgdf', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(180, 'A180', 'asdf', 'asdf-sdsf-sdf-sdf-sd-s', '', '', 0, 'sdsf', 'sdf', 'sdf', 'sd', 's', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(182, 'D181', 'dfd', 'dfd-test-sdf-sdf-sd-s', 'dfg', 'gdgf', 0, 'test', 'sdf', 'sdf', 'sd', 's', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(183, 'R183', 'rdgf', 'rdgf', '', '', 0, '', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `material type master`
--

CREATE TABLE `material type master` (
  `serial number` int(11) NOT NULL,
  `material type` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material type master`
--

INSERT INTO `material type master` (`serial number`, `material type`, `active`) VALUES
(1, 'Fabric - Dotknit', 1),
(2, 'Fabric - Spandex', 1),
(3, 'Fabric - Lycra 100X20', 1),
(4, 'Fabric - Lycra 100X40', 1),
(5, 'Fabric - JC011', 1),
(6, 'Fabric - Mesh', 1),
(7, 'Fabric - Polywoven Spandex', 1),
(8, 'Zipper - YKK - molded', 1),
(9, 'Zipper - YKK - coil', 1),
(10, 'Zipper - Local - coil', 1),
(11, 'Pad - Triathlon', 1),
(12, 'Pad - Cycling', 1),
(13, 'Elastic - Silicon Gripper', 1),
(14, 'Elastic - tape', 1),
(15, 'Elastic - waistband', 1),
(16, 'Elastic - local', 1),
(17, 'Reflective piping', 1),
(18, 'Reflective tape', 1),
(19, 'Washcare Labels', 1),
(20, 'Sizing Labels', 1),
(21, 'Gender Labels', 1),
(22, 'Polybags - ziplock', 1),
(23, 'Polybag - standard', 1),
(24, 'Threads - unspun', 1),
(25, 'Fabric - NirmalKnit', 1),
(26, 'Fabric - RK', 1),
(27, 'Fabric - LRK', 1),
(29, 'Fabric - rollsublimated', 1),
(30, 'Reflective Tabs Cut', 1),
(31, 'Fabric - Plainknit', 1),
(32, 'Zippers Local - 6 inch', 1),
(33, 'Zippers invisible - 8 inch', 1),
(34, 'Zippers Local - 8 inch', 1),
(35, 'Fabric - PointelleMesh', 1),
(36, 'Fabric - Popcorn', 1),
(37, 'Collar', 1),
(38, 'Fabric - AeroKnit', 1),
(42, 'test2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `serial number` int(11) NOT NULL,
  `suborder id` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`serial number`, `suborder id`, `size`, `quantity`) VALUES
(84, '619010-1', 'S', 8),
(85, '619010-1', 'L', 14),
(86, '619010-1', 'XL', 10),
(87, '619010-1', '2XL', 4),
(88, '619010-1', 'M', 1),
(89, '619010-2', 'S', 10),
(90, '619010-2', 'M', 14),
(91, '619010-2', 'L', 14),
(92, '619010-2', 'XL', 10),
(93, '619010-2', '2XL', 4),
(100, '719001-3', 'test', 1),
(101, '719001-3', 'test5', 3),
(102, '719001-3', 'tes', 4),
(128, '719001-1', 'M', 6),
(129, '719001-1', 'S', 12),
(130, '719001-1', 'L', 1),
(138, '719004-2', 'L', 14),
(139, '719004-2', 'M', 1),
(140, '719004-2', 'S', 12),
(141, '719004-2', 'XL', 4),
(142, '719004-2', 'XXL', 1),
(143, '719004-2', 'XXXL', 1),
(161, '719004-1', 'L', 10),
(162, '719004-1', 'M', 1),
(163, '719004-1', 'A', 4),
(164, '320002-1', 'S', 0),
(165, '320002-1', 'M', 0),
(166, '320002-1', 'L', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product master`
--

CREATE TABLE `product master` (
  `serial number` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product master`
--

INSERT INTO `product master` (`serial number`, `product`, `gender`, `pattern`, `active`) VALUES
(1, 'Breakaway', 'Mens', 'M0016', 1),
(2, 'Chase', 'Mens', 'M0006', 1),
(3, 'Peleton', 'Mens', 'M0013', 1),
(4, 'Transition', 'Mens', 'M0011', 1),
(5, 'Transition-Full', 'Mens', 'M0011', 1),
(6, 'VergeTop', 'Mens', 'MTJ02', 1),
(7, 'VergeShorts', 'Mens', 'MCS02', 1),
(8, 'Slingshot', 'Mens', 'MCS02', 1),
(9, 'Tri suit', 'Mens', 'MTST1', 1),
(10, 'Regular-RN', 'Mens', 'M0001', 1),
(11, 'Raglan-RN', 'Mens', 'M0002', 1),
(12, 'Echelon', 'Mens', 'MCBS01', 1),
(13, 'Singlet', 'Mens', 'MSGLT01', 1),
(14, 'Tempo', 'Mens', 'MRS01', 1),
(15, 'Regular-Polo', 'Mens', 'M0003', 1),
(16, 'Raglan-Polo', 'Mens', 'M0003A', 1),
(17, 'Breakaway', 'Womens', 'W0004', 1),
(18, 'Chase', 'Womens', 'W0004', 1),
(19, 'Peleton', 'Womens', 'W0010', 1),
(20, 'Transition', 'Womens', 'W0009', 1),
(21, 'VergeTop', 'Womens', 'WTJ01', 1),
(22, 'VergeShorts', 'Womens', 'WTS01', 1),
(23, 'Slingshot', 'Womens', 'CSW1', 1),
(24, 'Tri suit', 'Womens', 'WTST01', 1),
(25, 'Regular-RN', 'Womens', 'W0001', 1),
(26, 'Raglan-RN', 'Womens', 'W0002', 1),
(27, 'Regular-VN', 'Womens', 'W0001', 1),
(28, 'Raglan-VN', 'Womens', 'W0002', 1),
(29, 'Echelon', 'Womens', 'WCBS', 1),
(30, 'Singlet', 'Womens', 'WSGLT01', 1),
(31, 'Tempo', 'Womens', 'WRS01', 1),
(32, 'Regular-Polo', 'Womens', 'W0005', 1),
(33, 'CyclingTshirt', 'Womens', 'W0015', 1),
(34, 'Echelon2.0', 'Mens', 'MCBS02', 1),
(35, 'CyclingTshirt', 'Mens', 'M0018', 1),
(36, 'test2', 'female', 'M0018', 1);

-- --------------------------------------------------------

--
-- Table structure for table `raw material stock`
--

CREATE TABLE `raw material stock` (
  `serial number` int(11) NOT NULL,
  `material id` varchar(255) NOT NULL,
  `material code` varchar(255) NOT NULL,
  `stock` float NOT NULL,
  `purchase price` float NOT NULL,
  `stock value` float NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `raw material stock`
--

INSERT INTO `raw material stock` (`serial number`, `material id`, `material code`, `stock`, `purchase price`, `stock value`, `active`) VALUES
(1, 'F1', '', 23, 275, 6325, 1),
(2, 'F2', '', 69, 257, 17733, 1),
(3, 'F3', '', 121.24, 257, 31158.7, 1),
(4, 'F4', '', 0.8, 257, 205.6, 1),
(5, 'F5', '', 136.53, 257, 35088.2, 1),
(6, 'F6', '', 76.8, 257, 19737.6, 1),
(7, 'F7', '', 3.73, 257, 958.61, 1),
(8, 'F8', '', 126.22, 257, 32438.5, 1),
(9, 'F9', '', 62.05, 257, 15946.8, 1),
(10, 'F10', '', 63.9, 257, 16422.3, 1),
(11, 'F11', '', 81.4, 257, 20919.8, 1),
(12, 'F12', '', 111, 550, 61050, 1),
(13, 'F13', '', 6.1, 550, 3355, 1),
(14, 'F14', '', 3, 550, 1650, 1),
(15, 'F15', '', 4, 550, 2200, 1),
(16, 'F16', '', 9.3, 500, 4650, 1),
(17, 'F17', '', 10, 500, 5000, 1),
(18, 'F18', '', 13, 500, 6500, 1),
(19, 'F19', '', 7.5, 360, 2700, 1),
(20, 'F20', '', 3, 360, 1080, 1),
(21, 'F21', '', 0.7, 360, 252, 1),
(22, 'F22', '', 23, 360, 8280, 1),
(23, 'F23', '', 71.63, 1000, 71630, 1),
(24, 'F24', '', 20, 550, 11000, 1),
(25, 'F25', '', 30, 550, 16500, 1),
(26, 'F26', '', 26, 370, 9620, 1),
(27, 'F27', '', 4.15, 370, 1535.5, 1),
(28, 'F28', '', 9.73, 370, 3600.1, 1),
(29, 'Z29', '', 10, 37, 370, 1),
(30, 'Z30', '', 0, 37, 0, 1),
(31, 'Z31', '', 67, 37, 2479, 1),
(32, 'Z32', '', 33, 37, 1221, 1),
(33, 'Z33', '', 53, 37, 1961, 1),
(34, 'Z34', '', 46, 37, 1702, 1),
(35, 'Z35', '', 42, 37, 1554, 1),
(36, 'Z36', '', 70, 37, 2590, 1),
(37, 'Z37', '', 50, 37, 1850, 1),
(38, 'Z38', '', 28, 37, 1036, 1),
(39, 'P39', '', 0, 200, 0, 1),
(40, 'P40', '', 60, 200, 12000, 1),
(41, 'P41', '', 46, 250, 11500, 1),
(42, 'P42', '', 220, 300, 66000, 1),
(43, 'E43', '', 41, 40, 1640, 1),
(44, 'E44', '', 349, 20, 6980, 1),
(45, 'E45', '', 1380, 8, 11040, 1),
(46, 'R46', '', -24, 5, -120, 1),
(47, 'R47', '', 260, 5, 1300, 1),
(48, 'W48', '', -64, 1, -64, 1),
(49, 'S49', '', 6000, 1, 6000, 1),
(50, 'S50', '', 4000, 1, 4000, 1),
(51, 'S51', '', 9444, 1, 9444, 1),
(52, 'S52', '', 6006, 1, 6006, 1),
(53, 'S53', '', 7800, 1, 7800, 1),
(54, 'S54', '', 12958, 1, 12958, 1),
(55, 'S55', '', 4980, 1, 4980, 1),
(56, 'S56', '', 1000, 1, 1000, 1),
(57, 'G57', '', 9686, 1, 9686, 1),
(58, 'G58', '', 14000, 1, 14000, 1),
(59, 'E59', '', -26, 10, -260, 1),
(60, 'E60', '', 889, 10, 8890, 1),
(61, 'P61', '', 3700, 0, 0, 1),
(62, 'P62', '', 0, 2, 0, 1),
(63, 'T63', '', 8, 125, 1000, 1),
(64, 'T64', '', 24, 125, 3000, 1),
(65, 'T65', '', 50, 125, 6250, 1),
(66, 'T66', '', 20, 125, 2500, 1),
(67, 'T67', '', 15, 125, 1875, 1),
(68, 'T68', '', 35, 125, 4375, 1),
(69, 'T69', '', 34, 125, 4250, 1),
(70, 'T70', '', 24, 125, 3000, 1),
(71, 'T71', '', 20, 125, 2500, 1),
(72, 'T72', '', 10, 125, 1250, 1),
(73, 'T73', '', 31, 125, 3875, 1),
(74, 'F74', '', 0, 0, 0, 1),
(75, 'F75', '', 0, 0, 0, 1),
(76, 'F76', '', 0, 0, 0, 1),
(77, 'F77', '', 0, 0, 0, 1),
(78, 'F78', '', 0, 0, 0, 1),
(79, 'F79', '', 0, 0, 0, 1),
(80, 'F80', '', 0, 0, 0, 1),
(81, 'F81', '', 0, 0, 0, 1),
(82, 'F82', '', 0, 0, 0, 1),
(83, 'F83', '', 0, 0, 0, 1),
(84, 'F84', '', 0, 0, 0, 1),
(85, 'F85', '', 0, 550, 0, 1),
(86, 'None', '', 0, 0, 0, 1),
(87, 'F87', '', 5.7, 600, 3420, 1),
(88, 'F88', '', 12.6, 600, 7560, 1),
(89, 'F89', '', 8, 600, 4800, 1),
(90, 'R90', '', -100, 0, 0, 1),
(91, 'F91', '', 8, 250, 2000, 1),
(92, 'F92', '', 21, 250, 5250, 1),
(93, 'F93', '', 15.9, 250, 3975, 1),
(94, 'F94', '', 23.7, 250, 5925, 1),
(95, 'F95', '', 4.2, 250, 1050, 1),
(96, 'F96', '', 5.2, 250, 1300, 1),
(97, 'F97', '', 5.4, 250, 1350, 1),
(98, 'F98', '', 8.7, 150, 1305, 1),
(99, 'E99', '', 3.6, 40, 144, 1),
(100, 'F100', '', 5, 300, 1500, 1),
(101, 'F101', '', 4.3, 300, 1290, 1),
(102, 'F102', '', 4.4, 300, 1320, 1),
(103, 'F103', '', 16, 300, 4800, 1),
(104, 'F104', '', 10, 300, 3000, 1),
(105, 'F105', '', 6.5, 300, 1950, 1),
(106, 'Z106', '', 5, 125, 625, 1),
(107, 'T107', '', 8, 5, 40, 1),
(108, 'Z108', '', 150, 5, 750, 1),
(109, 'Z109', '', 100, 5, 500, 1),
(110, 'Z110', '', 150, 5, 750, 1),
(111, 'Z111', '', 5, 5, 25, 1),
(112, 'Z112', '', 5, 5, 25, 1),
(113, 'F113', '', 29.7, 300, 8910, 1),
(114, 'F114', '', 29, 300, 8700, 1),
(115, 'F115', '', 19.6, 230, 4508, 1),
(116, 'P116', '', 93, 141, 13113, 1),
(117, 'E117', '', 420, 86, 36120, 1),
(118, 'F118', '', 25.5, 560, 14280, 1),
(119, 'F119', '', 21.24, 360, 7646.4, 1),
(120, 'F120', '', 4.8, 360, 1728, 1),
(121, 'F121', '', 3.2, 360, 1152, 1),
(122, 'F122', '', 6.3, 360, 2268, 1),
(123, 'F123', '', 21.1, 360, 7596, 1),
(124, 'F124', '', 3.9, 360, 1404, 1),
(125, 'F125', '', 1, 360, 360, 1),
(126, 'F126', '', 3, 360, 1080, 1),
(127, 'F127', '', 2, 360, 720, 1),
(128, 'F128', '', 10, 360, 3600, 1),
(129, 'C129', '', 9.5, 320, 3040, 1),
(130, 'C130', '', 2.5, 320, 800, 1),
(131, 'C131', '', 17.5, 320, 5600, 1),
(132, 'C132', '', 13.5, 320, 4320, 1),
(133, 'C133', '', 12.7, 320, 4064, 1),
(134, 'C134', '', 7, 320, 2240, 1),
(135, 'C135', '', 9.5, 320, 3040, 1),
(136, 'C136', '', 10.9, 320, 3488, 1),
(137, 'C137', '', 1.9, 320, 608, 1),
(138, 'C138', '', 2.3, 320, 736, 1),
(139, 'F139', '', -19.95, 335, -6683.25, 1),
(140, 'F140', '', 20.1, 330, 6633, 1),
(141, 'E141', '', 820, 30, 24600, 1),
(142, 'T142', '', 0, 0, 0, 1),
(143, 'T143', '', 0, 0, 0, 1),
(144, 'D167', '', 0, 0, 0, 1),
(145, 'S168', '', 0, 0, 0, 1),
(146, 'K169', '', 0, 0, 0, 1),
(147, 'S170', '', 0, 0, 0, 1),
(148, 'J171', '', 0, 0, 0, 1),
(149, 'T172', '', 0, 0, 0, 1),
(150, 'K176', 'kjjbjhhhgf', 0, 0, 0, 1),
(151, 'T177', 'test', 0, 0, 0, 1),
(152, 'T178', 'terminator', 0, 0, 0, 1),
(153, 'D179', 'dfgdg-fgd-dfgdf-dfgf-dfgdfg-dfdgdf', 0, 0, 0, 1),
(154, 'A180', 'asdf-sdsf-sdf-sdf-sd-s', 0, 0, 0, 1),
(155, 'T181', 'test-test-sdf-sdf-sd-s', 0, 0, 0, 1),
(156, 'D181', 'dfd-test-sdf-sdf-sd-s', 0, 0, 0, 1),
(157, 'R183', 'rdgf', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub/order master`
--

CREATE TABLE `sub/order master` (
  `serial number` int(11) NOT NULL,
  `order name` varchar(255) NOT NULL,
  `month-year` int(11) NOT NULL,
  `order id` int(11) NOT NULL,
  `sub-order id` varchar(255) NOT NULL,
  `date order received` date NOT NULL,
  `date issued` date NOT NULL,
  `promised delivery date` date NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `folder reference` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `order code` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `quantity completed` int(11) NOT NULL,
  `quantity reworked` int(11) NOT NULL,
  `product related instructions` text NOT NULL,
  `product notes` text NOT NULL,
  `printing details` text NOT NULL,
  `printing notes` text NOT NULL,
  `flag` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub/order master`
--

INSERT INTO `sub/order master` (`serial number`, `order name`, `month-year`, `order id`, `sub-order id`, `date order received`, `date issued`, `promised delivery date`, `vendor`, `folder reference`, `product`, `pattern`, `order code`, `total`, `quantity completed`, `quantity reworked`, `product related instructions`, `product notes`, `printing details`, `printing notes`, `flag`) VALUES
(1, 'Men\'s Cycling T-shirt-2019-Dark Grey', 619000, 619010, '619010-1', '2019-06-10', '2019-06-10', '2019-06-30', 'Orthofit', '\\apace-retail', 'CyclingTshirt-Mens', 'M0018', 'Men\'s Cycling T-shirt-2019-Dark Grey-CyclingTshirt', 37, 0, 0, 'standard product', '6 inch zipper, open pockets', 'print as per design', '', 1),
(2, 'Men\'s Cycling T-shirt-2019-Ele Blue', 619000, 619010, '619010-2', '2019-06-10', '2019-06-10', '2019-06-30', 'Orthofit', '\\apace-retail', 'CyclingTshirt-Mens', 'M0018', 'Men\'s Cycling T-shirt-2019-Ele Blue-CyclingTshirt', 52, 0, 0, 'standard product', '6 inch zipper, open pockets', 'print as per design', '', 1),
(3, 'puneWolfpack', 619000, 619001, '619001-1', '2019-06-04', '2019-06-05', '2019-06-06', 'goyal', '/something', 't-shirt', 'M0001', 'puneWolfpack-t-shirt', 20, 0, 0, 'dfsdf', 'sdfsaf', 'sdfasfd', 'sadfasf', 1),
(9, 'test 4', 719000, 719001, '719001-1', '2019-07-22', '2019-07-22', '2019-07-22', 'Orthofit', 'ddsfasdf', 'CyclingTshirt-Mens', 'M0018', 'test 4-CyclingTshirt-Mens', 19, 0, 0, 'sadfasdf', 'sadfas', 'dfsdfs', 'dfsdfsd', 1),
(11, 'test 5', 719000, 719002, '719002-1', '2019-07-22', '2019-07-22', '2019-07-22', 'Local', '/something/something', 'Breakaway-Womens', 'W0004', 'test 5-Breakaway-Womens', 0, 0, 0, '123', '456', '789', 'qwe', 1),
(12, 'test 6', 719000, 719003, '719003-1', '2019-07-22', '2019-07-23', '2019-07-24', 'krishnile', '/something/test', 'CyclingTshirt-Womens', 'W0015', 'test 6-CyclingTshirt-Womens', 0, 0, 0, '123', 'asd', 'xzc', '456', 0),
(15, 'test 4', 719000, 719001, '719001-2', '2019-07-22', '2019-07-22', '2019-07-22', 'Goyal', 'sdafads', 'Peleton-Mens', 'M0013', 'test 4-Peleton-Mens', 0, 0, 0, 'sdafds', 'asdfas', 'fdfasd', 'fasdfdf', 1),
(16, 'test 4', 719000, 719001, '719001-3', '2019-07-22', '2019-07-22', '2019-07-22', 'krishnile', 'dffadfasfd', 'Tri suit-Womens', 'WTST01', 'test 4-Tri suit-Womens', 8, 0, 0, '12', '341', '56', '78', 1),
(17, 'test 4', 719000, 719001, '719001-4', '2019-07-22', '2019-07-22', '2019-07-22', 'Pioneer', 'qwer', 'Raglan-RN-Mens', 'M0002', 'test 4-Raglan-RN-Mens', 1, 2, 1, '1234\'test\'', '123\'hello\'', '1234', '1', 1),
(18, 'test order', 719000, 719004, '719004-1', '2019-07-22', '2019-07-23', '2019-07-24', 'ColorCraft-SonaliScreens', '/test/test/supertest/updated/reupdated', 'Echelon-Mens', 'MCBS01', 'test order-Echelon-Mens', 15, 0, 0, '12t', '34t', '56t', '78t', 1),
(19, 'test order', 719000, 719004, '719004-2', '2019-07-23', '2019-07-23', '2019-07-23', 'Orthofit', '/test', 'Singlet-Mens', 'MSGLT01', 'test order-Singlet-Mens', 33, 30, 5, '121\nhello', '23\n2nd line', '31\ntest\nthird line', '42\n2nd line', 1),
(20, 'rhishabh\'s order', 320000, 320001, '320001-1', '2020-03-17', '2020-03-17', '2020-03-17', 'ShreePoly', 'asdfasdfa', 'Tri suit-Mens', 'MTST1', 'rhishabh\'s order-Tri suit-Mens', 0, 0, 0, 'dsfasd', 'sdfsfd', 'vxcdfgsdfg', 'dfgsdfgsgf', 1),
(21, 'test', 320000, 320002, '320002-1', '2020-03-17', '2020-03-17', '2020-03-17', 'ShreePoly', 'asdfasdfa', 'Tri suit-Mens', 'MTST1', 'test-Tri suit-Mens', 0, 31, 12, 'dsfasd', 'sdfsfd', 'vxcdfgsdfg', 'dfgsdfgsgf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uom master`
--

CREATE TABLE `uom master` (
  `serial number` int(11) NOT NULL,
  `uom` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uom master`
--

INSERT INTO `uom master` (`serial number`, `uom`, `active`) VALUES
(1, 'Kilo', 1),
(2, 'Meter', 1),
(3, 'Count', 1),
(4, 'Cone', 1),
(5, 'Roll', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor master`
--

CREATE TABLE `vendor master` (
  `serial number` int(11) NOT NULL,
  `vendor id` int(11) NOT NULL,
  `vendor type` varchar(255) NOT NULL,
  `vendor name` varchar(255) NOT NULL,
  `vendor address` text NOT NULL,
  `vendor contact` bigint(20) NOT NULL,
  `vendor email` varchar(255) NOT NULL,
  `vendor gst#` varchar(255) NOT NULL,
  `vendor pan#` varchar(255) NOT NULL,
  `other` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor master`
--

INSERT INTO `vendor master` (`serial number`, `vendor id`, `vendor type`, `vendor name`, `vendor address`, `vendor contact`, `vendor email`, `vendor gst#`, `vendor pan#`, `other`, `active`) VALUES
(1, 1, 'fabric', 'Goyal', 'Surat', 0, '', '', '', '', 1),
(2, 2, 'fabric', 'GVijay', 'Mumbai', 0, '', '', '', '', 1),
(3, 3, 'fabric', 'Pashupati', 'Gurgaon', 0, '', '', '', '', 1),
(4, 4, 'accessories', 'Bathija', 'Mumbai', 0, '', '', '', '', 1),
(5, 5, 'accessories', 'Berenis', 'Italy', 0, '', '', '', '', 1),
(6, 6, 'accessories', 'Sonatapes', 'Goa', 0, '', '', '', '', 1),
(7, 7, 'accessories', 'Rushabh Ent', 'Mumbai', 0, '', '', '', '', 1),
(8, 8, 'accessories', 'Kushal', 'Pune', 0, '', '', '', '', 1),
(9, 9, 'accessories', 'Vishal', 'Pune', 0, '', '', '', '', 1),
(10, 10, 'packaging', 'ExcelPoly', 'Pune', 0, '', '', '', '', 1),
(11, 11, 'packaging', 'JaiPlastic', 'Pune', 0, '', '', '', '', 1),
(12, 12, 'thread', 'ShreePoly', 'Pune', 0, '', '', '', '', 1),
(13, 13, 'accessories', 'Local', 'Pune', 0, '', '', '', '', 1),
(14, 14, 'stitching', 'SaiSports', 'Pune', 0, '', '', '', '', 1),
(15, 15, 'stitching', 'Orthofit', 'Pune', 0, '', '', '', '', 1),
(16, 16, 'stitching', 'AakashEnt', 'Pune', 0, '', '', '', '', 1),
(17, 17, 'stitching', 'Vaishvik', 'Mumbai', 0, '', '', '', '', 1),
(18, 18, 'printing', 'ColorCraft-SonaliScreens', 'Pune', 0, '', '', '', '', 1),
(19, 19, 'printing', 'OmkarArts', 'Pune', 0, '', '', '', '', 1),
(20, 20, 'printing', 'Pioneer', 'Pune', 0, '', '', '', '', 1),
(21, 21, 'packing', 'Bhavesh', 'Pune', 0, '', '', '', '', 1),
(22, 22, 'other', 'Pawar-KajiButton', 'Pune', 0, '', '', '', '', 1),
(23, 23, 'accessories', 'Bestway', 'Guangzhou', 0, '', '', '', '', 1),
(24, 24, 'readymade', 'Onkar-Lale', 'Pune', 0, '', '', '', '', 1),
(25, 25, 'readymade', 'krishnile', 'Pune', 0, '', '', '', '', 1),
(26, 26, 'readymade', 'ramesh rumal house', 'Mumbai', 0, '', '', '', '', 1),
(27, 27, 'readymade', 'maheshverma', 'Pune', 0, '', '', '', '', 1),
(28, 0, 'testupd', 'test', 'pune', 99999321231, 'test@gmail.com', 'test', 'test', 'test', 1),
(29, 0, 'test', 'etst', '', 0, '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor type master`
--

CREATE TABLE `vendor type master` (
  `serial number` int(11) NOT NULL,
  `vendor type` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor type master`
--

INSERT INTO `vendor type master` (`serial number`, `vendor type`, `active`) VALUES
(1, 'stitching', 1),
(2, 'printing', 1),
(3, 'packing', 1),
(4, 'shipping', 1),
(5, 'fabric', 1),
(6, 'accessories', 1),
(7, 'packaging', 1),
(8, 'thread', 1),
(9, 'other', 1),
(10, 'readymade', 1),
(15, 'test', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workstation master`
--

CREATE TABLE `workstation master` (
  `serial number` int(11) NOT NULL,
  `workstation` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workstation master`
--

INSERT INTO `workstation master` (`serial number`, `workstation`, `active`) VALUES
(1, 'initial', 1),
(2, 'intermediate', 1),
(3, 'pre final', 1),
(4, 'final', 1);

-- --------------------------------------------------------

--
-- Table structure for table `workstation operation`
--

CREATE TABLE `workstation operation` (
  `serial number` int(11) NOT NULL,
  `suborder id` varchar(255) NOT NULL,
  `workstation` varchar(255) NOT NULL,
  `start date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workstation operation`
--

INSERT INTO `workstation operation` (`serial number`, `suborder id`, `workstation`, `start date`) VALUES
(1, '320001-1', 'initial', '2020-03-30'),
(2, '320001-1', 'intermediate', '2020-03-30'),
(9, '719001-4', 'initial', '2020-03-30'),
(10, '719001-4', 'intermediate', '2020-03-31'),
(16, '320002-1', 'initial', '2020-03-30'),
(17, '320002-1', 'intermediate', '2020-03-31'),
(18, '320002-1', 'final', '2020-04-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`serial number`);

--
-- Indexes for table `material issue`
--
ALTER TABLE `material issue`
  ADD PRIMARY KEY (`serial number`);

--
-- Indexes for table `material master`
--
ALTER TABLE `material master`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `material id` (`material id`);

--
-- Indexes for table `material type master`
--
ALTER TABLE `material type master`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `material type` (`material type`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `suborder id` (`suborder id`,`size`);

--
-- Indexes for table `product master`
--
ALTER TABLE `product master`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `product` (`product`,`gender`);

--
-- Indexes for table `raw material stock`
--
ALTER TABLE `raw material stock`
  ADD PRIMARY KEY (`serial number`);

--
-- Indexes for table `sub/order master`
--
ALTER TABLE `sub/order master`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `sub-order id` (`sub-order id`);

--
-- Indexes for table `uom master`
--
ALTER TABLE `uom master`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `uom` (`uom`);

--
-- Indexes for table `vendor master`
--
ALTER TABLE `vendor master`
  ADD PRIMARY KEY (`serial number`);

--
-- Indexes for table `vendor type master`
--
ALTER TABLE `vendor type master`
  ADD PRIMARY KEY (`serial number`),
  ADD UNIQUE KEY `vendor type` (`vendor type`);

--
-- Indexes for table `workstation master`
--
ALTER TABLE `workstation master`
  ADD PRIMARY KEY (`serial number`);

--
-- Indexes for table `workstation operation`
--
ALTER TABLE `workstation operation`
  ADD PRIMARY KEY (`serial number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `material issue`
--
ALTER TABLE `material issue`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `material master`
--
ALTER TABLE `material master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `material type master`
--
ALTER TABLE `material type master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order details`
--
ALTER TABLE `order details`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `product master`
--
ALTER TABLE `product master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `raw material stock`
--
ALTER TABLE `raw material stock`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `sub/order master`
--
ALTER TABLE `sub/order master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `uom master`
--
ALTER TABLE `uom master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor master`
--
ALTER TABLE `vendor master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vendor type master`
--
ALTER TABLE `vendor type master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `workstation master`
--
ALTER TABLE `workstation master`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `workstation operation`
--
ALTER TABLE `workstation operation`
  MODIFY `serial number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
