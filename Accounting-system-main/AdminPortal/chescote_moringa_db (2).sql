-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2023 at 10:51 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chescote_moringa_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `advance_payments_tb`
--

CREATE TABLE IF NOT EXISTS `advance_payments_tb` (
  `advace_id` int(12) NOT NULL,
  `amount` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `qty` int(12) NOT NULL,
  `branch_id` int(12) NOT NULL,
  `order_no` int(12) NOT NULL,
  `customer_name` text NOT NULL,
  `price` int(12) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batches_tb`
--

CREATE TABLE IF NOT EXISTS `batches_tb` (
  `batch_id` int(12) NOT NULL,
  `qty` text NOT NULL,
  `prod_id` int(12) NOT NULL,
  `buy_price` text NOT NULL,
  `sell_price` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batches_tb`
--

INSERT INTO `batches_tb` (`batch_id`, `qty`, `prod_id`, `buy_price`, `sell_price`, `date_added`) VALUES
(1, '96', 64, '00', '', '2022-06-28 11:56:47'),
(2, '42', 533, '0', '', '2022-06-28 11:56:47'),
(3, '42', 41, '0', '', '2022-06-28 11:56:47'),
(4, '1', 82, '0', '', '2022-06-28 11:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_address` varchar(100) NOT NULL,
  `branch_contact` varchar(50) NOT NULL,
  `reciept_footer_text` text NOT NULL,
  `notification_count` int(12) NOT NULL,
  `skin` varchar(15) NOT NULL,
  `tpin` text NOT NULL,
  `logo` text NOT NULL,
  `bank_account_name` text NOT NULL,
  `bank` text NOT NULL,
  `account_number` text NOT NULL,
  `sort_code` text NOT NULL,
  `branch_code` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `branch_address`, `branch_contact`, `reciept_footer_text`, `notification_count`, `skin`, `tpin`, `logo`, `bank_account_name`, `bank`, `account_number`, `sort_code`, `branch_code`) VALUES
(1, 'Empire Brands Limited', 'PLOT NO. 9542,\r\nOFF KATANGA ROAD, INDUSTRIAL AREA,\r\nLUSAKA , ZAMBIA - +260978899776', 'empirebrandszm@gmail.com', 'We reserve the right to charge interest at the ZANACO Ruling Rate + 3% if the invoice is not settled with-in the agreed terms of credit', 0, 'red', '', 'Screenshot 2023-08-10 094358.png', 'RYINO PHARM LIMITED', 'Stanbic Bank', '9130004227003', '04-01-03', '04-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `cashout_limits_tb`
--

CREATE TABLE IF NOT EXISTS `cashout_limits_tb` (
  `id` int(12) NOT NULL,
  `cashoutlimit` text NOT NULL,
  `status` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashout_limits_tb`
--

INSERT INTO `cashout_limits_tb` (`id`, `cashoutlimit`, `status`, `date_added`) VALUES
(1, '10', 'Not Active', '2020-11-29 15:07:05');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(59, 'MORINGA PRODUCTS'),
(62, 'ZAMOR PRODUCTS');

-- --------------------------------------------------------

--
-- Table structure for table `credit_note`
--

CREATE TABLE IF NOT EXISTS `credit_note` (
  `credit_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `Customer_id` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message_credit` text NOT NULL,
  `description` text NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `customer_name` text NOT NULL,
  `complete_message_statement` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_note`
--

INSERT INTO `credit_note` (`credit_id`, `invoice_no`, `Customer_id`, `date`, `message_credit`, `description`, `prod_id`, `qty`, `price`, `total`, `invoice_id`, `customer_name`, `complete_message_statement`) VALUES
(68, 5112, '3', '2023-09-09 09:26:12', ' hello zambia', 'hello', 0, 0, 0, 777, 95, 'AFRICA SUPERMARKETS LIMITED ', 'hello world'),
(69, 0, '3', '2023-09-09 09:26:12', ' hello zambia', 'martin', 0, 0, 0, 2815, 0, 'AFRICA SUPERMARKETS LIMITED', 'hello world'),
(70, 5112, '3', '2023-09-09 09:29:22', ' martin', '', 0, 1, 25, 25, 95, 'AFRICA SUPERMARKETS LIMITED ', 'hello'),
(71, 5112, '3', '2023-09-09 09:29:22', ' martin', '', 0, 1, 13, 13, 99, 'AFRICA SUPERMARKETS LIMITED ', 'hello'),
(72, 5112, '3', '2023-09-09 09:29:22', ' martin', '', 0, 1, 13, 13, 98, 'AFRICA SUPERMARKETS LIMITED ', 'hello'),
(73, 5113, '45', '2023-09-09 13:23:47', ' yess', '', 0, 1, 18, 18, 111, 'Collins ', 'yes'),
(74, 5113, '45', '2023-09-09 13:23:47', ' yess', '', 0, 1, 140, 140, 112, 'Collins ', 'yes'),
(75, 5113, '45', '2023-09-09 13:23:47', ' yess', '', 0, 1, 145, 145, 113, 'Collins ', 'yes'),
(76, 5115, '45', '2023-09-09 13:36:25', ' he', '', 0, 1, 18, 18, 116, 'Collins ', 'helo'),
(77, 5115, '45', '2023-09-09 13:36:25', ' he', '', 0, 1, 250, 250, 117, 'Collins ', 'helo'),
(78, 5115, '45', '2023-09-09 13:36:25', ' he', '', 0, 1, 195, 195, 118, 'Collins ', 'helo'),
(79, 5115, '45', '2023-09-09 13:36:25', ' he', '', 0, 3, 20, 60, 119, 'Collins ', 'helo'),
(80, 5117, '3', '2023-09-11 06:51:28', ' martin', ' bag of fries', 0, 1, 18, 18, 122, 'AFRICA SUPERMARKETS LIMITED ', 'martin'),
(81, 5120, '45', '2023-09-11 07:26:37', ' fin', ' ', 0, 5, 12, 60, 128, 'Collins ', 'fin'),
(82, 5123, '45', '2023-09-11 07:39:05', ' final', ' FINAL', 0, 5, 12, 60, 132, 'Collins ', 'final'),
(83, 5124, '45', '2023-09-11 07:43:59', ' Final', ' Hello', 0, 5, 12, 60, 133, 'Collins ', 'Final'),
(84, 0, '44', '2023-10-04 10:37:48', ' test2', 'test', 0, 3, 22, 66, 0, 'ZESSCO', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `credit_outgoing_stock`
--

CREATE TABLE IF NOT EXISTS `credit_outgoing_stock` (
  `id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qty` text NOT NULL,
  `customer` text NOT NULL,
  `user_id` int(12) NOT NULL,
  `order_no` int(12) NOT NULL,
  `price` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_outgoing_stock`
--

INSERT INTO `credit_outgoing_stock` (`id`, `prod_id`, `date_added`, `qty`, `customer`, `user_id`, `order_no`, `price`) VALUES
(20, 99, '2019-10-15 16:06:07', '1', 'FADAK-NEW', 8, 1364, '55.00'),
(21, 100, '2019-10-15 16:06:07', '1', 'FADAK-NEW', 8, 1364, '55.00'),
(22, 103, '2019-10-15 16:11:18', '1', 'FADAK-NEW', 8, 1364, '55');

-- --------------------------------------------------------

--
-- Table structure for table `credit_payments`
--

CREATE TABLE IF NOT EXISTS `credit_payments` (
  `credit_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `amount` text NOT NULL,
  `invoice_no` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_temp`
--

CREATE TABLE IF NOT EXISTS `credit_temp` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `invoice_no` int(11) DEFAULT '0',
  `invoice_id` int(11) DEFAULT '0',
  `cust_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int(3) NOT NULL,
  `cust_first` varchar(63) DEFAULT NULL,
  `cust_last` varchar(13) DEFAULT NULL,
  `cust_address` varchar(120) DEFAULT NULL,
  `cust_contact` varchar(42) DEFAULT NULL,
  `balance` varchar(1) DEFAULT NULL,
  `cust_pic` varchar(11) DEFAULT NULL,
  `bday` varchar(10) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `house_status` varchar(10) DEFAULT NULL,
  `years` varchar(10) DEFAULT NULL,
  `rent` varchar(10) DEFAULT NULL,
  `emp_name` varchar(10) DEFAULT NULL,
  `emp_no` varchar(10) DEFAULT NULL,
  `emp_address` varchar(10) DEFAULT NULL,
  `emp_year` varchar(10) DEFAULT NULL,
  `occupation` varchar(10) DEFAULT NULL,
  `salary` varchar(10) DEFAULT NULL,
  `spouse` varchar(10) DEFAULT NULL,
  `spouse_no` varchar(10) DEFAULT NULL,
  `spouse_emp` varchar(10) DEFAULT NULL,
  `spouse_details` varchar(10) DEFAULT NULL,
  `spouse_income` varchar(1) DEFAULT NULL,
  `comaker` varchar(10) DEFAULT NULL,
  `comaker_details` varchar(10) DEFAULT NULL,
  `branch_id` varchar(1) DEFAULT NULL,
  `credit_status` varchar(10) DEFAULT NULL,
  `ci_remarks` varchar(10) DEFAULT NULL,
  `ci_name` varchar(10) DEFAULT NULL,
  `ci_date` varchar(10) DEFAULT NULL,
  `payslip` varchar(1) DEFAULT NULL,
  `valid_id` varchar(1) DEFAULT NULL,
  `cert` varchar(1) DEFAULT NULL,
  `cedula` varchar(1) DEFAULT NULL,
  `income` varchar(1) DEFAULT NULL,
  `email` varchar(10) DEFAULT NULL,
  `account_no` varchar(12) DEFAULT NULL,
  `price_tag` text,
  `city` text
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_first`, `cust_last`, `cust_address`, `cust_contact`, `balance`, `cust_pic`, `bday`, `nickname`, `house_status`, `years`, `rent`, `emp_name`, `emp_no`, `emp_address`, `emp_year`, `occupation`, `salary`, `spouse`, `spouse_no`, `spouse_emp`, `spouse_details`, `spouse_income`, `comaker`, `comaker_details`, `branch_id`, `credit_status`, `ci_remarks`, `ci_name`, `ci_date`, `payslip`, `valid_id`, `cert`, `cedula`, `income`, `email`, `account_no`, `price_tag`, `city`) VALUES
(3, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - KAFUBU MALL', '37946', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO001', 'retail', 'ND'),
(4, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - JACARANDA MALL', '31097', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO002', 'retail', 'ND'),
(5, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - NDOLA', '2816', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO003', 'retail', 'ND'),
(6, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - MUKUBA MALL', '84723', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO004', 'retail', 'KI'),
(7, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - MINI CHIMWEMWE', '31364', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO005', 'retail', 'KI'),
(8, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - KITWE', '2832', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO006', 'retail', 'KI'),
(9, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - MINI KAPIRI MPOSHI', '81474', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO007', 'retail', 'KA'),
(10, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - KABWE', '2824', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO008', 'retail', 'KA'),
(11, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - MULUNGUSHI', '35740', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO009', 'retail', 'KA'),
(12, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - CITY MALL', '64832', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO010', 'retail', 'SO'),
(13, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - CHILILABOMBWE', '64824', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO011', 'retail', 'CH'),
(14, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - SOLWEZI', '2890', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO012', 'retail', 'SO'),
(15, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - THE PARK', '37954', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO013', 'retail', 'CH'),
(16, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - CHINGOLA', '2866', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO014', 'retail', 'CH'),
(17, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - MUFULIRA', '2858', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO015', 'retail', 'MU'),
(18, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE - ROAN MALL', '34906', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO016', 'retail', 'LU'),
(19, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MINI CHIRUNDU', '35766', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO017', 'retail', 'CH'),
(20, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  EASTPARK MALL', '91184', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO018', 'retail', 'LU'),
(21, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  TWIN PALMS', '37938', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO019', 'retail', 'LU'),
(22, 'AFRICA SUPERMARKETS LIMITED 3', '', 'SHOPRITE -  WOODLANDS', '94433', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO020', 'retail', 'LU'),
(23, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  COSMOPOLITAN MALL', '96948', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO021', 'retail', 'LU'),
(24, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MINI KABWATA', '99158', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO022', 'retail', 'LU'),
(25, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MATERO', '2921', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO023', 'retail', 'LU'),
(26, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MINI BAULENI', '99302', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO024', 'retail', 'LU'),
(27, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  UNZA', '70768', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO025', 'retail', 'LU'),
(28, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  GREAT NORTH', '81458', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO026', 'retail', 'LU'),
(29, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  CHILENJE', '2963', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO027', 'retail', 'LU'),
(30, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MANDA HILL', '2997', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO028', 'retail', 'LU'),
(31, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MINI MUNALI', '39875', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO029', 'retail', 'LU'),
(32, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  KABULONGA', '39883', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO030', 'retail', 'LU'),
(33, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  WATERFALLS', '34922', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO031', 'retail', 'LU'),
(34, 'AFRICA SUPERMARKETS LIMITED', '', 'MEGASAVE - LUSAKA', '5903', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO032', 'retail', 'LU'),
(35, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  CAIRO ROAD', '2808', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO033', 'retail', 'LU'),
(36, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  KASAMA', '2989', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO034', 'retail', 'KA'),
(37, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MANSA', '2955', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO035', 'retail', 'MA'),
(38, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MAZABUKA', '2939', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO036', 'retail', 'MA'),
(39, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  BAROTSE MALL', '84799', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO037', 'retail', 'MO'),
(40, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  CHIPATA', '2913', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO038', 'retail', 'CH'),
(41, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MINI KALINGALINGA', '85185', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO039', 'retail', 'LU'),
(42, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  MOSI-O-TUNYA', '55615', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO040', 'retail', 'LI'),
(43, 'AFRICA SUPERMARKETS LIMITED', '', 'SHOPRITE -  LIVINGSTONE', '2840', '', '', '', '', '', '', '', '', '1001646043', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'SHO041', 'retail', 'LI'),
(44, 'ZESSCO', '', 'KAFUE', '908097890', '0', 'default.gif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wholesale_price', NULL),
(45, 'Collins', '', 'Lusaka chilanga', '0987986', '0', 'default.gif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'retail', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE IF NOT EXISTS `customer_payments` (
  `id` int(12) NOT NULL,
  `amount` text NOT NULL,
  `date_paid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_id` int(12) NOT NULL,
  `old_balance` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_payments`
--

INSERT INTO `customer_payments` (`id`, `amount`, `date_paid`, `customer_id`, `old_balance`) VALUES
(1, '40000', '2019-09-17 15:11:15', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `damages_log_tb`
--

CREATE TABLE IF NOT EXISTS `damages_log_tb` (
  `id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(12) NOT NULL,
  `qty_damage` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `damages_log_tb`
--

INSERT INTO `damages_log_tb` (`id`, `prod_id`, `date_added`, `user_id`, `qty_damage`) VALUES
(1, 46, '2022-01-19 13:06:29', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_tb`
--

CREATE TABLE IF NOT EXISTS `delivery_tb` (
  `id` int(12) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discount_tb`
--

CREATE TABLE IF NOT EXISTS `discount_tb` (
  `id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `discount_price` int(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount_from` text NOT NULL,
  `discount_to` text NOT NULL,
  `status` text NOT NULL,
  `price_before_disc` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `draft_sales_tb`
--

CREATE TABLE IF NOT EXISTS `draft_sales_tb` (
  `sales_details_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `order_no` int(12) NOT NULL,
  `client_name` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `draft_temp_trans`
--

CREATE TABLE IF NOT EXISTS `draft_temp_trans` (
  `temp_trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `order_no` int(12) NOT NULL,
  `customer_name` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` varchar(50) NOT NULL,
  `user_id` int(12) NOT NULL,
  `is_printed` int(11) NOT NULL,
  `price_tag` text NOT NULL,
  `invoice_no` text NOT NULL,
  `cust_id` text NOT NULL,
  `description` text NOT NULL,
  `discount_type` text NOT NULL,
  `amount` text NOT NULL,
  `date2collect` text NOT NULL,
  `order_shoprite` text NOT NULL,
  `total_amount` int(11) NOT NULL,
  `payment_acc_name` int(11) NOT NULL,
  `payment_acc_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `draft_temp_trans`
--

INSERT INTO `draft_temp_trans` (`temp_trans_id`, `prod_id`, `price`, `qty`, `branch_id`, `order_no`, `customer_name`, `date`, `updated`, `user_id`, `is_printed`, `price_tag`, `invoice_no`, `cust_id`, `description`, `discount_type`, `amount`, `date2collect`, `order_shoprite`, `total_amount`, `payment_acc_name`, `payment_acc_id`) VALUES
(302, 40, '35.00', '1', 1, 5246, 'Collins ', '2023-10-04 12:55:44', '2023-10-04', 8, 0, '', '', '45', ' Tesing 2', '', '', '', '', 0, 0, 0),
(303, 41, '35.00', '1', 1, 5246, 'Collins ', '2023-10-04 12:55:44', '2023-10-04', 8, 0, '', '', '45', ' Tesing 2', '', '', '', '', 0, 0, 0),
(304, 488, '640.00', '1', 1, 5247, 'Collins ', '2023-10-05 09:26:13', '2023-10-05', 8, 0, '', '', '45', ' ', '', '', '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates_tb`
--

CREATE TABLE IF NOT EXISTS `exchange_rates_tb` (
  `exchange_id` int(12) NOT NULL,
  `rate` text NOT NULL,
  `name` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exchange_rates_tb`
--

INSERT INTO `exchange_rates_tb` (`exchange_id`, `rate`, `name`, `date_added`) VALUES
(1, '23', 'USD (Dollar)', '2021-04-21 09:28:14'),
(2, '0', 'ZMW', '2020-06-14 06:22:07'),
(4, '20', 'UK (Pound)', '2020-06-14 06:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `expenses_tb`
--

CREATE TABLE IF NOT EXISTS `expenses_tb` (
  `id` int(12) NOT NULL,
  `description` text NOT NULL,
  `amount` int(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category` text NOT NULL,
  `payment_method` text NOT NULL,
  `attachment` text NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `payment_acc_name` text NOT NULL,
  `pay_acc_id` int(11) NOT NULL,
  `balance` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenses_tb`
--

INSERT INTO `expenses_tb` (`id`, `description`, `amount`, `date`, `category`, `payment_method`, `attachment`, `supplier_id`, `payment_acc_name`, `pay_acc_id`, `balance`) VALUES
(36, ' EXP2023', 600, '2023-10-04 09:55:56', 'Wage expense', 'Cheque', '', 0, 'Cash and cash equivalants', 6, '1000'),
(37, ' test', 600, '2023-10-06 07:35:04', 'Wage expense', 'Debit card', '', 18, 'Cash and cash equivalants', 6, '670');

-- --------------------------------------------------------

--
-- Table structure for table `expense_types_tb`
--

CREATE TABLE IF NOT EXISTS `expense_types_tb` (
  `id` int(12) NOT NULL,
  `description` text NOT NULL,
  `exp_name` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int(12) NOT NULL DEFAULT '4'
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense_types_tb`
--

INSERT INTO `expense_types_tb` (`id`, `description`, `exp_name`, `date_added`, `added_by`) VALUES
(1, '', ' Fuel', '2020-11-29 19:06:16', 4),
(2, '', ' Salaries', '2020-11-29 19:06:22', 4),
(3, '', 'Amortisation', '2023-08-17 08:19:06', 0),
(4, '', 'Bad debts', '2023-08-17 08:19:06', 0),
(5, '', 'Insurance - General', '2023-08-17 08:25:53', 0),
(6, '', 'Insurance - Liability', '2023-08-17 08:25:53', 0),
(9, '', 'Bank charges', '2023-08-17 09:04:48', 0),
(11, '', 'Insurance - Disability', '2023-08-17 09:11:07', 4),
(12, '', 'office expenese', '2023-08-17 09:14:13', 4),
(13, '', 'Meals and Entertainment', '2023-08-17 09:14:13', 4),
(14, '', 'Other General and administrative expenses', '2023-08-17 09:19:30', 4),
(15, '', 'Legal and professional fees', '2023-08-17 09:19:30', 4),
(16, '', 'Equipment rental', '2023-08-17 09:30:46', 4),
(17, '', 'Dues and subscriptions', '2023-08-17 09:30:46', 4),
(18, '', 'Communication and fees', '2023-08-17 10:17:11', 4),
(19, '', 'Income tax expense', '2023-08-17 10:17:11', 4),
(20, '', 'Management compensation', '2023-08-17 10:17:11', 4),
(21, '', 'Interest expense', '2023-08-17 10:17:11', 4),
(22, '', 'Loss on discontinued operations, net of tax', '2023-08-17 10:17:11', 4),
(23, '', 'Unrealised loss on securities, net of tax', '2023-08-17 10:17:11', 4),
(24, '', 'Other operating income (expense)', '2023-08-17 10:17:11', 4),
(25, '', 'Loss on disposal of assets', '2023-08-17 10:17:11', 4),
(26, '', 'Interest income', '2023-08-17 10:17:11', 4),
(27, '', 'Freight and Delivery - COS', '2023-08-17 10:17:11', 4),
(28, '', 'Cost of sales', '2023-08-17 10:17:11', 4),
(29, '', 'Uncategorized income', '2023-08-17 10:17:11', 4),
(30, '', 'Services', '2023-08-17 10:17:11', 4),
(31, '', 'Sales-retail', '2023-08-17 10:17:11', 4),
(32, '', 'Sales-wholesale', '2023-08-17 10:17:11', 4),
(33, '', 'Sales of Product Income', '2023-08-17 10:17:11', 4),
(34, '', 'Cost of sales', '2023-08-17 10:17:11', 4),
(35, '', 'Dividend income', '2023-08-17 10:17:11', 4),
(36, '', 'Revenue - General', '2023-08-17 10:17:11', 4),
(37, '', 'Billable Expense Income', '2023-08-17 10:17:11', 4),
(38, '', 'Share capital', '2023-08-17 10:17:11', 4),
(39, '', 'Retained Earnings', '2023-08-17 10:17:11', 4),
(40, '', 'Other comprehensive', '2023-08-17 10:17:11', 4),
(41, '', 'Equity in earnings of subsidiaries', '2023-08-17 10:17:11', 4),
(42, '', 'Dividend disbursed', '2023-08-17 10:17:11', 4),
(43, '', 'Long-term debt', '2023-08-17 10:17:11', 4),
(44, '', 'Liabilities related to assets held sale', '2023-08-17 10:17:11', 4),
(45, '', 'Intangibles', '2023-08-17 10:17:11', 4),
(46, '', 'Long-term Investments', '2023-08-17 10:17:11', 4),
(47, '', 'Accrued liabilities', '2023-08-17 10:17:11', 4),
(48, '', 'Dividends payable', '2023-08-17 10:17:11', 4),
(49, '', 'Income tax payable', '2023-08-17 10:17:11', 4),
(50, '', 'Payroll Clearing', '2023-08-17 10:17:11', 4),
(51, '', 'Payroll liabilities', '2023-08-17 10:17:11', 4),
(52, '', 'Short-term Debt', '2023-08-17 10:17:11', 4),
(53, '', 'Accrued holiday payable', '2023-08-17 10:17:11', 4),
(54, '', 'Inventory Asset', '2023-08-17 10:17:11', 4),
(55, '', 'Prepaid expenses uncategorized funds', '2023-08-17 10:17:11', 4),
(56, '', 'Accumulated depreciation on property, plant and equipment', '2023-08-17 10:17:11', 4),
(57, '', 'Property, plant and equipment', '2023-08-17 10:17:11', 4),
(58, '', 'Assets held for sale', '2023-08-17 10:17:11', 4),
(59, '', 'Deferred tax assets', '2023-08-17 10:17:11', 4),
(60, '', 'Goodwill', '2023-08-17 10:17:11', 4),
(61, '', 'Travel expenses-general and admin expenses', '2023-08-17 10:17:11', 4),
(62, '', 'Travel expenses-selling expenses', '2023-08-17 10:17:11', 4),
(63, '', 'Uncategorized Expense', '2023-08-17 10:17:11', 4),
(64, '', 'Utilities', '2023-08-17 10:17:11', 4),
(65, '', 'Wage expense', '2023-08-17 10:17:11', 4),
(66, '', 'Cash and cash equivalents', '2023-08-17 10:17:11', 4),
(67, '', 'Allowance for bad debt', '2023-08-17 10:17:11', 4),
(68, '', 'Available for sale assets (short-term)', '2023-08-17 10:17:11', 4),
(69, '', 'Inventory', '2023-08-17 10:17:11', 4),
(70, '', 'Other Selling expenses', '2023-08-17 10:17:11', 4),
(71, '', 'Other types of Expenses', '2023-08-17 10:17:11', 4),
(72, '', 'Advertising Expenses', '2023-08-17 10:17:11', 4),
(73, '', 'Payroll Expenses', '2023-08-17 10:17:11', 4),
(74, '', 'Purchases', '2023-08-17 10:17:11', 4),
(75, '', 'Rent or lease payment', '2023-08-17 10:17:11', 4),
(76, '', 'Repairs and Maintenance', '2023-08-17 10:17:11', 4),
(77, '', 'Shipping and delivery expense', '2023-08-17 10:17:11', 4),
(78, '', 'Stationery and printing', '2023-08-17 10:17:11', 4),
(79, '', 'Supplies', '2023-08-17 10:17:11', 4);

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

CREATE TABLE IF NOT EXISTS `history_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1491 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `user_id`, `action`, `date`) VALUES
(1, 4, 'has logged in the system at ', '2019-08-17 11:59:27'),
(2, 4, 'has logged out the system at ', '2019-08-17 13:14:19'),
(3, 8, 'has logged in the system at ', '2019-08-17 13:14:24'),
(4, 4, 'has logged in the system at ', '2019-08-20 13:13:38'),
(5, 4, 'has logged in the system at ', '2019-08-20 17:48:30'),
(6, 4, 'has logged out the system at ', '2019-08-20 17:49:06'),
(7, 10, 'has logged in the system at ', '2019-08-20 17:49:13'),
(8, 4, 'has logged in the system at ', '2019-08-21 18:01:44'),
(9, 4, 'has logged out the system at ', '2019-08-21 18:01:52'),
(10, 10, 'has logged in the system at ', '2019-08-21 18:01:58'),
(11, 10, 'has logged out the system at ', '2019-08-22 10:23:34'),
(12, 4, 'has logged in the system at ', '2019-08-22 10:23:40'),
(13, 4, 'has logged out the system at ', '2019-08-22 11:10:03'),
(14, 10, 'has logged in the system at ', '2019-08-22 11:10:36'),
(15, 10, 'has logged out the system at ', '2019-08-22 11:56:10'),
(16, 4, 'has logged in the system at ', '2019-08-22 11:58:19'),
(17, 4, 'has logged out the system at ', '2019-08-22 12:36:40'),
(18, 10, 'has logged in the system at ', '2019-08-22 12:36:46'),
(19, 10, 'has logged out the system at ', '2019-08-22 12:46:02'),
(20, 4, 'has logged in the system at ', '2019-08-22 12:46:07'),
(21, 4, 'has logged out the system at ', '2019-08-22 13:01:54'),
(22, 8, 'has logged in the system at ', '2019-08-22 13:01:59'),
(23, 8, 'has logged out the system at ', '2019-08-22 13:26:44'),
(24, 4, 'has logged in the system at ', '2019-08-22 13:26:49'),
(25, 4, 'has logged out the system at ', '2019-08-22 13:41:26'),
(26, 8, 'has logged in the system at ', '2019-08-22 13:41:40'),
(27, 8, 'has logged out the system at ', '2019-08-22 14:49:26'),
(28, 10, 'has logged in the system at ', '2019-08-22 14:49:41'),
(29, 10, 'has logged out the system at ', '2019-08-22 15:03:14'),
(30, 4, 'has logged in the system at ', '2019-08-22 15:03:19'),
(31, 4, 'has logged out the system at ', '2019-08-22 15:08:44'),
(32, 10, 'has logged in the system at ', '2019-08-22 15:10:18'),
(33, 10, 'has logged out the system at ', '2019-08-22 15:17:41'),
(34, 4, 'has logged in the system at ', '2019-08-22 15:17:45'),
(35, 4, 'has logged out the system at ', '2019-08-22 15:21:55'),
(36, 10, 'has logged in the system at ', '2019-08-22 15:21:59'),
(37, 10, 'has logged out the system at ', '2019-08-22 15:23:22'),
(38, 4, 'has logged in the system at ', '2019-08-22 15:23:27'),
(39, 4, 'has logged out the system at ', '2019-08-22 15:25:05'),
(40, 10, 'has logged in the system at ', '2019-08-22 15:25:11'),
(41, 10, 'has logged out the system at ', '2019-08-22 15:34:15'),
(42, 8, 'has logged in the system at ', '2019-08-22 15:34:41'),
(43, 8, 'has logged out the system at ', '2019-08-22 15:34:55'),
(44, 4, 'has logged in the system at ', '2019-08-22 15:35:08'),
(45, 4, 'has logged out the system at ', '2019-08-22 15:35:14'),
(46, 10, 'has logged in the system at ', '2019-08-22 15:35:26'),
(47, 10, 'has logged out the system at ', '2019-08-22 15:46:43'),
(48, 10, 'has logged in the system at ', '2019-08-22 15:46:50'),
(49, 10, 'has logged out the system at ', '2019-08-22 15:46:52'),
(50, 4, 'has logged in the system at ', '2019-08-22 15:47:00'),
(51, 4, 'has logged in the system at ', '2019-08-23 09:36:53'),
(52, 4, 'has logged in the system at ', '2019-08-23 16:09:01'),
(53, 4, 'has logged out the system at ', '2019-08-24 14:10:55'),
(54, 4, 'has logged in the system at ', '2019-08-25 14:10:50'),
(55, 4, 'has logged out the system at ', '2019-08-25 14:15:30'),
(56, 8, 'has logged in the system at ', '2019-08-25 14:15:36'),
(57, 8, 'has logged in the system at ', '2019-08-25 15:24:09'),
(58, 8, 'has logged in the system at ', '2019-08-26 13:33:51'),
(59, 10, 'has logged in the system at ', '2019-08-26 14:27:49'),
(60, 8, 'has logged in the system at ', '2019-08-27 11:40:28'),
(61, 4, 'has logged in the system at ', '2019-09-03 09:44:08'),
(62, 4, 'has logged in the system at ', '2019-09-03 09:44:47'),
(63, 4, 'has logged out the system at ', '2019-09-03 09:46:00'),
(64, 8, 'has logged in the system at ', '2019-09-03 09:46:04'),
(65, 8, 'has logged out the system at ', '2019-09-03 09:46:31'),
(66, 4, 'has logged in the system at ', '2019-09-03 09:46:36'),
(67, 4, 'has logged out the system at ', '2019-09-03 09:51:57'),
(68, 4, 'has logged in the system at ', '2019-09-03 09:52:31'),
(69, 4, 'has logged out the system at ', '2019-09-03 11:47:15'),
(70, 8, 'has logged in the system at ', '2019-09-03 11:47:28'),
(71, 8, 'has logged in the system at ', '2019-09-03 11:53:04'),
(72, 8, 'has logged in the system at ', '2019-09-03 12:07:28'),
(73, 8, 'has logged in the system at ', '2019-09-04 16:58:09'),
(74, 8, 'has logged out the system at ', '2019-09-04 18:42:00'),
(75, 4, 'has logged in the system at ', '2019-09-04 18:42:05'),
(76, 4, 'has logged out the system at ', '2019-09-04 18:42:24'),
(77, 8, 'has logged in the system at ', '2019-09-04 18:42:36'),
(78, 10, 'has logged in the system at ', '2019-09-05 12:58:11'),
(79, 10, 'has logged out the system at ', '2019-09-05 12:58:46'),
(80, 4, 'has logged in the system at ', '2019-09-05 12:58:50'),
(81, 4, 'has logged out the system at ', '2019-09-05 12:59:54'),
(82, 10, 'has logged in the system at ', '2019-09-05 13:00:00'),
(83, 4, 'has logged in the system at ', '2019-09-06 08:10:53'),
(84, 4, 'has logged out the system at ', '2019-09-06 08:12:39'),
(85, 8, 'has logged in the system at ', '2019-09-06 08:12:46'),
(86, 8, 'has logged out the system at ', '2019-09-06 08:13:55'),
(87, 8, 'has logged in the system at ', '2019-09-06 08:14:30'),
(88, 8, 'has logged out the system at ', '2019-09-06 08:55:26'),
(89, 4, 'has logged in the system at ', '2019-09-06 08:55:31'),
(90, 4, 'has logged out the system at ', '2019-09-06 08:55:48'),
(91, 8, 'has logged in the system at ', '2019-09-06 08:56:58'),
(92, 8, 'has logged out the system at ', '2019-09-06 09:06:41'),
(93, 8, 'has logged in the system at ', '2019-09-06 16:03:33'),
(94, 8, 'has logged out the system at ', '2019-09-06 17:01:39'),
(95, 4, 'has logged in the system at ', '2019-09-06 17:01:45'),
(96, 4, 'has logged out the system at ', '2019-09-06 17:01:53'),
(97, 8, 'has logged in the system at ', '2019-09-06 17:01:59'),
(98, 8, 'has logged in the system at ', '2019-09-06 17:05:34'),
(99, 8, 'has logged in the system at ', '2019-09-06 22:21:33'),
(100, 8, 'has logged out the system at ', '2019-09-06 22:26:50'),
(101, 8, 'has logged in the system at ', '2019-09-06 22:26:58'),
(102, 8, 'has logged in the system at ', '2019-09-07 09:49:14'),
(103, 8, 'has logged in the system at ', '2019-09-10 16:59:26'),
(104, 8, 'has logged in the system at ', '2019-09-12 09:42:57'),
(105, 8, 'has logged out the system at ', '2019-09-12 10:21:13'),
(106, 4, 'has logged in the system at ', '2019-09-12 10:56:25'),
(107, 4, 'has logged out the system at ', '2019-09-12 12:10:18'),
(108, 8, 'has logged in the system at ', '2019-09-12 12:10:25'),
(109, 8, 'has logged in the system at ', '2019-09-12 14:17:26'),
(110, 4, 'has logged in the system at ', '2019-09-17 16:51:43'),
(111, 4, 'has logged in the system at ', '2019-09-20 11:05:37'),
(112, 8, 'has logged in the system at ', '2019-09-30 17:46:50'),
(113, 8, 'has logged out the system at ', '2019-09-30 17:51:56'),
(114, 4, 'has logged in the system at ', '2019-09-30 17:52:02'),
(115, 4, 'has logged out the system at ', '2019-09-30 18:08:34'),
(116, 8, 'has logged in the system at ', '2019-09-30 18:08:43'),
(117, 8, 'has logged out the system at ', '2019-09-30 19:03:04'),
(118, 4, 'has logged in the system at ', '2019-09-30 19:03:09'),
(119, 4, 'has logged out the system at ', '2019-09-30 19:04:28'),
(120, 8, 'has logged in the system at ', '2019-09-30 19:04:34'),
(121, 8, 'has logged out the system at ', '2019-09-30 19:13:44'),
(122, 8, 'has logged in the system at ', '2019-09-30 19:25:36'),
(123, 8, 'has logged in the system at ', '2019-10-07 10:48:37'),
(124, 8, 'has logged in the system at ', '2019-10-07 11:06:56'),
(125, 8, 'has logged in the system at ', '2019-10-08 10:31:17'),
(126, 8, 'has logged out the system at ', '2019-10-08 10:41:48'),
(127, 4, 'has logged in the system at ', '2019-10-08 10:42:04'),
(128, 4, 'has logged out the system at ', '2019-10-08 10:54:20'),
(129, 8, 'has logged in the system at ', '2019-10-08 10:54:28'),
(130, 8, 'has logged in the system at ', '2019-10-09 00:14:57'),
(131, 8, 'has logged in the system at ', '2019-10-09 08:54:00'),
(132, 8, 'has logged out the system at ', '2019-10-09 09:01:08'),
(133, 4, 'has logged in the system at ', '2019-10-09 09:01:12'),
(134, 4, 'has logged out the system at ', '2019-10-09 09:01:34'),
(135, 8, 'has logged in the system at ', '2019-10-09 09:01:56'),
(136, 10, 'has logged in the system at ', '2019-10-09 14:54:30'),
(137, 10, 'has logged out the system at ', '2019-10-09 15:01:08'),
(138, 8, 'has logged in the system at ', '2019-10-09 15:01:13'),
(139, 4, 'has logged in the system at ', '2019-10-11 12:15:39'),
(140, 4, 'has logged out the system at ', '2019-10-11 12:36:21'),
(141, 8, 'has logged in the system at ', '2019-10-11 12:36:29'),
(142, 8, 'has logged out the system at ', '2019-10-11 14:44:33'),
(143, 4, 'has logged in the system at ', '2019-10-11 14:44:38'),
(144, 4, 'has logged out the system at ', '2019-10-11 14:45:18'),
(145, 8, 'has logged in the system at ', '2019-10-11 14:45:23'),
(146, 8, 'has logged out the system at ', '2019-10-11 14:53:35'),
(147, 4, 'has logged in the system at ', '2019-10-11 14:53:40'),
(148, 4, 'has logged out the system at ', '2019-10-11 15:01:24'),
(149, 8, 'has logged in the system at ', '2019-10-11 15:01:31'),
(150, 8, 'has logged in the system at ', '2019-10-12 19:24:58'),
(151, 4, 'has logged in the system at ', '2019-10-13 00:15:14'),
(152, 4, 'has logged out the system at ', '2019-10-13 00:20:04'),
(153, 8, 'has logged in the system at ', '2019-10-13 00:20:12'),
(154, 8, 'has logged in the system at ', '2019-10-13 18:29:34'),
(155, 8, 'has logged in the system at ', '2019-10-14 19:57:32'),
(156, 8, 'has logged in the system at ', '2019-10-14 21:42:22'),
(157, 8, 'has logged out the system at ', '2019-10-14 21:42:50'),
(158, 4, 'has logged in the system at ', '2019-10-14 21:42:56'),
(159, 4, 'has logged out the system at ', '2019-10-14 21:57:07'),
(160, 8, 'has logged in the system at ', '2019-10-14 21:57:13'),
(161, 8, 'has logged in the system at ', '2019-10-15 15:49:13'),
(162, 8, 'has logged out the system at ', '2019-10-15 17:57:44'),
(163, 4, 'has logged in the system at ', '2019-10-15 17:58:01'),
(164, 4, 'has logged out the system at ', '2019-10-15 18:05:51'),
(165, 8, 'has logged in the system at ', '2019-10-15 18:05:56'),
(166, 8, 'has logged out the system at ', '2019-10-15 18:06:10'),
(167, 4, 'has logged in the system at ', '2019-10-15 18:06:41'),
(168, 4, 'has logged out the system at ', '2019-10-15 18:11:03'),
(169, 8, 'has logged in the system at ', '2019-10-15 18:11:08'),
(170, 8, 'has logged out the system at ', '2019-10-15 18:11:21'),
(171, 4, 'has logged in the system at ', '2019-10-15 18:11:26'),
(172, 4, 'has logged in the system at ', '2019-10-15 21:37:11'),
(173, 4, 'has logged out the system at ', '2019-10-15 21:47:16'),
(174, 8, 'has logged in the system at ', '2019-10-16 11:04:08'),
(175, 8, 'has logged out the system at ', '2019-10-16 11:08:07'),
(176, 8, 'has logged in the system at ', '2019-10-16 11:12:39'),
(177, 8, 'has logged in the system at ', '2019-10-18 19:29:38'),
(178, 8, 'has logged in the system at ', '2019-10-21 09:31:40'),
(179, 8, 'has logged out the system at ', '2019-10-21 10:28:31'),
(180, 4, 'has logged in the system at ', '2019-10-21 10:28:35'),
(181, 4, 'has logged out the system at ', '2019-10-21 10:28:55'),
(182, 8, 'has logged in the system at ', '2019-10-21 13:07:18'),
(183, 4, 'has logged in the system at ', '2019-11-15 10:38:32'),
(184, 4, 'has logged out the system at ', '2019-11-15 10:57:41'),
(185, 8, 'has logged in the system at ', '2019-11-15 10:57:46'),
(186, 8, 'has logged out the system at ', '2019-11-15 11:10:31'),
(187, 4, 'has logged in the system at ', '2019-11-15 11:10:37'),
(188, 4, 'has logged in the system at ', '2019-12-30 14:17:49'),
(189, 4, 'has logged out the system at ', '2019-12-30 14:53:18'),
(190, 8, 'has logged in the system at ', '2019-12-30 14:53:26'),
(191, 8, 'has logged out the system at ', '2019-12-30 17:25:18'),
(192, 8, 'has logged in the system at ', '2020-01-14 10:20:47'),
(193, 8, 'has logged out the system at ', '2020-01-14 10:33:45'),
(194, 8, 'has logged in the system at ', '2020-01-14 10:33:49'),
(195, 4, 'has logged in the system at ', '2020-01-26 07:04:49'),
(196, 4, 'has logged out the system at ', '2020-01-26 07:05:07'),
(197, 8, 'has logged in the system at ', '2020-01-26 07:05:12'),
(198, 4, 'has logged in the system at ', '2020-01-27 10:13:05'),
(199, 4, 'has logged out the system at ', '2020-01-27 10:14:53'),
(200, 8, 'has logged in the system at ', '2020-01-27 10:14:58'),
(201, 8, 'has logged out the system at ', '2020-01-27 10:16:24'),
(202, 4, 'has logged in the system at ', '2020-01-27 10:16:29'),
(203, 4, 'has logged out the system at ', '2020-01-27 10:21:40'),
(204, 8, 'has logged in the system at ', '2020-01-27 10:22:56'),
(205, 8, 'has logged out the system at ', '2020-01-27 11:43:01'),
(206, 4, 'has logged in the system at ', '2020-01-27 11:43:07'),
(207, 4, 'has logged out the system at ', '2020-01-27 11:43:34'),
(208, 8, 'has logged in the system at ', '2020-01-27 11:43:40'),
(209, 8, 'has logged in the system at ', '2020-01-28 18:07:27'),
(210, 8, 'has logged out the system at ', '2020-01-28 18:25:09'),
(211, 4, 'has logged in the system at ', '2020-01-28 18:25:15'),
(212, 4, 'has logged out the system at ', '2020-01-28 18:28:36'),
(213, 8, 'has logged in the system at ', '2020-01-28 18:28:39'),
(214, 8, 'has logged in the system at ', '2020-01-28 18:43:40'),
(215, 8, 'has logged out the system at ', '2020-01-28 18:43:50'),
(216, 8, 'has logged in the system at ', '2020-01-28 18:43:55'),
(217, 8, 'has logged out the system at ', '2020-01-28 18:44:09'),
(218, 4, 'has logged in the system at ', '2020-01-28 18:44:15'),
(219, 8, 'has logged out the system at ', '2020-01-28 20:18:29'),
(220, 8, 'has logged in the system at ', '2020-01-28 20:18:34'),
(221, 8, 'has logged out the system at ', '2020-01-28 20:19:48'),
(222, 4, 'has logged in the system at ', '2020-01-28 20:19:54'),
(223, 4, 'has logged out the system at ', '2020-01-28 20:32:32'),
(224, 8, 'has logged in the system at ', '2020-01-28 20:34:39'),
(225, 8, 'has logged out the system at ', '2020-01-28 20:37:35'),
(226, 4, 'has logged in the system at ', '2020-01-28 20:38:03'),
(227, 4, 'has logged out the system at ', '2020-01-28 20:38:58'),
(228, 8, 'has logged in the system at ', '2020-01-28 20:39:03'),
(229, 8, 'has logged out the system at ', '2020-01-28 20:40:08'),
(230, 4, 'has logged in the system at ', '2020-01-28 20:40:13'),
(231, 4, 'has logged out the system at ', '2020-01-28 20:40:40'),
(232, 8, 'has logged in the system at ', '2020-01-28 20:40:45'),
(233, 4, 'has logged in the system at ', '2020-01-28 22:58:07'),
(234, 4, 'has logged out the system at ', '2020-01-28 22:58:42'),
(235, 8, 'has logged in the system at ', '2020-01-28 22:58:48'),
(236, 8, 'has logged out the system at ', '2020-01-29 09:58:55'),
(237, 4, 'has logged in the system at ', '2020-01-29 09:59:00'),
(238, 4, 'has logged out the system at ', '2020-01-29 10:05:51'),
(239, 8, 'has logged in the system at ', '2020-01-29 15:14:14'),
(240, 8, 'has logged out the system at ', '2020-01-29 15:14:17'),
(241, 8, 'has logged in the system at ', '2020-01-30 11:28:46'),
(242, 8, 'has logged out the system at ', '2020-01-30 11:28:52'),
(243, 8, 'has logged in the system at ', '2020-01-30 11:28:57'),
(244, 4, 'has logged out the system at ', '2020-01-30 17:52:25'),
(245, 8, 'has logged in the system at ', '2020-01-30 17:52:34'),
(246, 8, 'has logged out the system at ', '2020-01-30 18:01:31'),
(247, 8, 'has logged in the system at ', '2020-01-30 18:01:37'),
(248, 8, 'has logged in the system at ', '2020-01-31 11:40:20'),
(249, 8, 'has logged out the system at ', '2020-01-31 11:40:23'),
(250, 4, 'has logged in the system at ', '2020-01-31 11:40:29'),
(251, 4, 'has logged out the system at ', '2020-01-31 11:45:49'),
(252, 4, 'has logged in the system at ', '2020-01-31 11:45:59'),
(253, 4, 'has logged out the system at ', '2020-01-31 11:53:20'),
(254, 8, 'has logged in the system at ', '2020-01-31 11:53:26'),
(255, 8, 'has logged in the system at ', '2020-01-31 16:13:10'),
(256, 8, 'has logged out the system at ', '2020-10-21 10:15:58'),
(257, 4, 'has logged in the system at ', '2020-10-21 10:16:03'),
(258, 4, 'has logged out the system at ', '2020-10-21 10:19:58'),
(259, 4, 'has logged in the system at ', '2020-10-21 10:32:28'),
(260, 4, 'has logged out the system at ', '2020-10-21 10:32:49'),
(261, 10, 'has logged in the system at ', '2020-10-21 10:32:55'),
(262, 10, 'has logged out the system at ', '2020-10-21 10:33:34'),
(263, 4, 'has logged in the system at ', '2020-10-21 10:33:42'),
(264, 8, 'has logged in the system at ', '2020-10-26 11:31:54'),
(265, 8, 'has logged out the system at ', '2020-10-26 11:32:54'),
(266, 4, 'has logged in the system at ', '2020-10-26 11:32:58'),
(267, 4, 'has logged in the system at ', '2020-10-26 14:53:44'),
(268, 4, 'has logged out the system at ', '2020-10-26 14:55:17'),
(269, 10, 'has logged in the system at ', '2020-10-26 14:55:23'),
(270, 10, 'has logged out the system at ', '2020-10-26 15:07:41'),
(271, 4, 'has logged in the system at ', '2020-10-26 15:07:45'),
(272, 4, 'has logged out the system at ', '2020-10-26 15:09:03'),
(273, 10, 'has logged in the system at ', '2020-10-26 15:09:10'),
(274, 10, 'has logged out the system at ', '2020-10-26 15:15:24'),
(275, 8, 'has logged in the system at ', '2020-10-26 15:15:31'),
(276, 8, 'has logged out the system at ', '2020-10-26 15:29:39'),
(277, 4, 'has logged in the system at ', '2020-10-26 15:29:44'),
(278, 4, 'has logged out the system at ', '2020-10-26 15:41:21'),
(279, 8, 'has logged in the system at ', '2020-10-30 11:57:56'),
(280, 4, 'has logged in the system at ', '2020-11-07 19:12:54'),
(281, 4, 'has logged in the system at ', '2020-11-29 16:24:15'),
(282, 4, 'has logged out the system at ', '2020-11-29 16:24:28'),
(283, 8, 'has logged in the system at ', '2020-11-29 16:24:35'),
(284, 8, 'has logged out the system at ', '2020-11-29 17:00:28'),
(285, 4, 'has logged in the system at ', '2020-11-29 17:00:33'),
(286, 4, 'has logged out the system at ', '2020-11-29 17:01:35'),
(287, 8, 'has logged in the system at ', '2020-11-29 17:01:41'),
(288, 8, 'has logged out the system at ', '2020-11-29 17:05:21'),
(289, 4, 'has logged in the system at ', '2020-11-29 17:05:26'),
(290, 4, 'has logged out the system at ', '2020-11-29 17:07:07'),
(291, 8, 'has logged in the system at ', '2020-11-29 17:07:15'),
(292, 13, 'has logged out the system at ', '2020-11-29 17:15:24'),
(293, 8, 'has logged in the system at ', '2020-11-29 17:15:31'),
(294, 8, 'has logged out the system at ', '2020-11-29 18:28:22'),
(295, 4, 'has logged in the system at ', '2020-11-29 18:28:28'),
(296, 4, 'has logged out the system at ', '2020-11-29 20:21:16'),
(297, 8, 'has logged in the system at ', '2020-11-29 20:21:21'),
(298, 8, 'has logged out the system at ', '2020-11-29 20:50:18'),
(299, 4, 'has logged in the system at ', '2020-11-29 20:50:23'),
(300, 4, 'has logged out the system at ', '2020-11-29 20:53:20'),
(301, 8, 'has logged in the system at ', '2020-11-29 20:54:07'),
(302, 8, 'has logged in the system at ', '2020-11-29 20:55:27'),
(303, 8, 'has logged out the system at ', '2020-11-29 21:02:55'),
(304, 4, 'has logged in the system at ', '2020-11-29 21:03:00'),
(305, 4, 'has logged out the system at ', '2020-11-29 21:06:24'),
(306, 8, 'has logged in the system at ', '2020-11-29 21:06:29'),
(307, 8, 'has logged out the system at ', '2020-11-29 23:13:23'),
(308, 8, 'has logged in the system at ', '2020-11-30 15:35:26'),
(309, 8, 'has logged in the system at ', '2020-12-02 11:11:31'),
(310, 8, 'has logged out the system at ', '2020-12-02 14:36:55'),
(311, 8, 'has logged in the system at ', '2020-12-02 15:22:42'),
(312, 8, 'has logged out the system at ', '2020-12-02 16:25:06'),
(313, 4, 'has logged in the system at ', '2020-12-14 14:44:26'),
(314, 4, 'has logged out the system at ', '2020-12-14 14:44:40'),
(315, 8, 'has logged in the system at ', '2020-12-14 14:44:46'),
(316, 8, 'has logged out the system at ', '2020-12-14 14:47:26'),
(317, 4, 'has logged in the system at ', '2020-12-14 14:47:37'),
(318, 4, 'has logged in the system at ', '2020-12-14 22:19:56'),
(319, 4, 'has logged out the system at ', '2020-12-14 23:09:59'),
(320, 8, 'has logged in the system at ', '2020-12-14 23:10:04'),
(321, 8, 'has logged in the system at ', '2020-12-15 15:14:07'),
(322, 8, 'has logged out the system at ', '2020-12-15 15:27:56'),
(323, 0, 'has logged out the system at ', '2020-12-15 15:28:20'),
(324, 8, 'has logged in the system at ', '2020-12-15 15:40:48'),
(325, 8, 'has logged out the system at ', '2020-12-15 15:58:35'),
(326, 4, 'has logged out the system at ', '2020-12-15 16:05:32'),
(327, 8, 'has logged in the system at ', '2020-12-15 17:34:52'),
(328, 8, 'has logged out the system at ', '2020-12-15 17:36:39'),
(329, 4, 'has logged in the system at ', '2020-12-15 17:36:47'),
(330, 4, 'has logged out the system at ', '2020-12-15 17:43:05'),
(331, 8, 'has logged in the system at ', '2020-12-15 17:43:10'),
(332, 8, 'has logged out the system at ', '2020-12-15 17:49:34'),
(333, 4, 'has logged in the system at ', '2020-12-15 17:49:40'),
(334, 4, 'has logged out the system at ', '2020-12-15 17:51:41'),
(335, 4, 'has logged in the system at ', '2020-12-15 17:52:07'),
(336, 4, 'has logged out the system at ', '2020-12-15 21:32:07'),
(337, 8, 'has logged in the system at ', '2020-12-16 10:41:02'),
(338, 8, 'has logged out the system at ', '2020-12-16 10:50:29'),
(339, 0, 'has logged out the system at ', '2020-12-16 11:02:04'),
(340, 4, 'has logged in the system at ', '2020-12-16 11:02:08'),
(341, 8, 'has logged in the system at ', '2020-12-17 08:23:19'),
(342, 8, 'has logged out the system at ', '2020-12-17 08:38:59'),
(343, 4, 'has logged in the system at ', '2020-12-17 08:39:05'),
(344, 8, 'has logged in the system at ', '2020-12-17 10:03:04'),
(345, 8, 'has logged out the system at ', '2020-12-17 10:04:22'),
(346, 4, 'has logged in the system at ', '2020-12-17 10:06:10'),
(347, 8, 'has logged in the system at ', '2020-12-17 17:35:05'),
(348, 8, 'has logged in the system at ', '2020-12-17 17:49:36'),
(349, 8, 'has logged out the system at ', '2020-12-17 18:07:25'),
(350, 4, 'has logged in the system at ', '2020-12-17 18:07:33'),
(351, 4, 'has logged out the system at ', '2020-12-17 18:08:15'),
(352, 8, 'has logged in the system at ', '2020-12-17 18:08:21'),
(353, 8, 'has logged out the system at ', '2020-12-17 18:08:31'),
(354, 8, 'has logged in the system at ', '2020-12-20 11:47:38'),
(355, 8, 'has logged out the system at ', '2020-12-20 12:02:41'),
(356, 8, 'has logged in the system at ', '2020-12-22 14:21:09'),
(357, 8, 'has logged out the system at ', '2020-12-22 14:37:40'),
(358, 4, 'has logged in the system at ', '2020-12-22 14:37:51'),
(359, 4, 'has logged out the system at ', '2020-12-22 14:40:27'),
(360, 8, 'has logged in the system at ', '2020-12-22 14:40:32'),
(361, 8, 'has logged in the system at ', '2020-12-22 17:37:44'),
(362, 8, 'has logged out the system at ', '2020-12-22 17:56:42'),
(363, 4, 'has logged in the system at ', '2020-12-22 17:56:48'),
(364, 4, 'has logged in the system at ', '2020-12-22 17:58:27'),
(365, 4, 'has logged in the system at ', '2020-12-22 21:25:29'),
(366, 4, 'has logged out the system at ', '2020-12-22 21:25:34'),
(367, 8, 'has logged in the system at ', '2020-12-22 21:25:46'),
(368, 8, 'has logged out the system at ', '2020-12-22 21:37:55'),
(369, 8, 'has logged in the system at ', '2020-12-22 21:38:00'),
(370, 8, 'has logged out the system at ', '2020-12-22 21:38:02'),
(371, 4, 'has logged in the system at ', '2020-12-22 21:38:08'),
(372, 8, 'has logged in the system at ', '2020-12-23 16:14:01'),
(373, 8, 'has logged out the system at ', '2020-12-23 16:42:36'),
(374, 4, 'has logged in the system at ', '2020-12-23 16:42:42'),
(375, 8, 'has logged in the system at ', '2020-12-24 16:19:42'),
(376, 8, 'has logged out the system at ', '2020-12-24 16:21:25'),
(377, 4, 'has logged in the system at ', '2020-12-24 16:21:31'),
(378, 4, 'has logged out the system at ', '2020-12-24 16:21:44'),
(379, 4, 'has logged in the system at ', '2020-12-24 16:21:50'),
(380, 4, 'has logged in the system at ', '2020-12-26 08:51:36'),
(381, 4, 'has logged in the system at ', '2020-12-27 17:06:15'),
(382, 4, 'has logged out the system at ', '2020-12-27 17:24:15'),
(383, 8, 'has logged in the system at ', '2020-12-27 17:24:21'),
(384, 8, 'has logged out the system at ', '2020-12-27 17:31:14'),
(385, 4, 'has logged in the system at ', '2020-12-27 17:31:19'),
(386, 4, 'has logged out the system at ', '2020-12-27 17:31:52'),
(387, 8, 'has logged in the system at ', '2020-12-27 17:32:04'),
(388, 8, 'has logged in the system at ', '2020-12-28 16:52:18'),
(389, 8, 'has logged out the system at ', '2020-12-28 16:53:34'),
(390, 4, 'has logged in the system at ', '2020-12-28 16:53:39'),
(391, 4, 'has logged out the system at ', '2020-12-28 16:54:17'),
(392, 8, 'has logged in the system at ', '2020-12-28 16:54:22'),
(393, 8, 'has logged out the system at ', '2020-12-28 17:29:10'),
(394, 4, 'has logged in the system at ', '2020-12-28 17:29:15'),
(395, 4, 'has logged out the system at ', '2020-12-28 17:29:42'),
(396, 8, 'has logged in the system at ', '2020-12-28 17:29:47'),
(397, 8, 'has logged out the system at ', '2020-12-28 17:32:44'),
(398, 4, 'has logged in the system at ', '2020-12-28 17:32:49'),
(399, 4, 'has logged out the system at ', '2020-12-28 17:33:35'),
(400, 8, 'has logged in the system at ', '2020-12-31 09:13:34'),
(401, 8, 'has logged out the system at ', '2020-12-31 09:23:57'),
(402, 4, 'has logged in the system at ', '2020-12-31 09:24:03'),
(403, 8, 'has logged in the system at ', '2020-12-31 11:07:13'),
(404, 8, 'has logged out the system at ', '2020-12-31 13:04:37'),
(405, 8, 'has logged in the system at ', '2020-12-31 13:04:43'),
(406, 8, 'has logged in the system at ', '2021-01-01 10:08:50'),
(407, 8, 'has logged out the system at ', '2021-01-01 10:11:15'),
(408, 4, 'has logged in the system at ', '2021-01-01 10:11:20'),
(409, 4, 'has logged out the system at ', '2021-01-01 10:12:38'),
(410, 8, 'has logged in the system at ', '2021-01-01 10:12:44'),
(411, 8, 'has logged out the system at ', '2021-01-01 13:58:54'),
(412, 8, 'has logged in the system at ', '2021-01-01 13:59:00'),
(413, 8, 'has logged out the system at ', '2021-01-01 19:12:02'),
(414, 4, 'has logged in the system at ', '2021-01-01 19:12:25'),
(415, 4, 'has logged out the system at ', '2021-01-01 19:14:08'),
(416, 8, 'has logged in the system at ', '2021-01-01 19:14:13'),
(417, 8, 'has logged out the system at ', '2021-01-01 19:21:18'),
(418, 4, 'has logged in the system at ', '2021-01-01 23:01:44'),
(419, 4, 'has logged out the system at ', '2021-01-01 23:03:02'),
(420, 4, 'has logged in the system at ', '2021-01-01 23:03:10'),
(421, 4, 'has logged out the system at ', '2021-01-01 23:07:40'),
(422, 8, 'has logged in the system at ', '2021-01-01 23:07:48'),
(423, 8, 'has logged out the system at ', '2021-01-01 23:11:56'),
(424, 8, 'has logged in the system at ', '2021-01-01 23:13:57'),
(425, 8, 'has logged out the system at ', '2021-01-01 23:14:03'),
(426, 4, 'has logged in the system at ', '2021-01-01 23:14:11'),
(427, 4, 'has logged out the system at ', '2021-01-01 23:16:01'),
(428, 8, 'has logged in the system at ', '2021-01-01 23:16:23'),
(429, 8, 'has logged out the system at ', '2021-01-01 23:26:51'),
(430, 8, 'has logged in the system at ', '2021-01-03 11:26:24'),
(431, 8, 'has logged out the system at ', '2021-01-03 11:33:43'),
(432, 4, 'has logged in the system at ', '2021-01-03 11:33:55'),
(433, 8, 'has logged in the system at ', '2021-01-04 13:33:34'),
(434, 8, 'has logged out the system at ', '2021-01-04 13:35:22'),
(435, 4, 'has logged in the system at ', '2021-01-04 13:35:40'),
(436, 8, 'has logged in the system at ', '2021-01-04 14:31:50'),
(437, 8, 'has logged out the system at ', '2021-01-04 14:36:04'),
(438, 4, 'has logged in the system at ', '2021-01-04 14:36:16'),
(439, 8, 'has logged in the system at ', '2021-01-04 17:12:52'),
(440, 8, 'has logged out the system at ', '2021-01-04 17:17:37'),
(441, 8, 'has logged in the system at ', '2021-01-04 17:52:53'),
(442, 8, 'has logged in the system at ', '2021-01-05 14:04:16'),
(443, 8, 'has logged out the system at ', '2021-01-05 14:16:30'),
(444, 8, 'has logged in the system at ', '2021-01-08 12:02:20'),
(445, 8, 'has logged out the system at ', '2021-01-08 12:06:09'),
(446, 4, 'has logged in the system at ', '2021-01-08 12:07:08'),
(447, 4, 'has logged out the system at ', '2021-01-08 12:07:57'),
(448, 8, 'has logged in the system at ', '2021-01-08 17:55:53'),
(449, 8, 'has logged in the system at ', '2021-01-08 17:57:51'),
(450, 8, 'has logged out the system at ', '2021-01-08 17:58:27'),
(451, 8, 'has logged in the system at ', '2021-01-10 11:48:45'),
(452, 8, 'has logged out the system at ', '2021-01-10 11:49:32'),
(453, 4, 'has logged in the system at ', '2021-01-10 11:49:38'),
(454, 4, 'has logged out the system at ', '2021-01-10 11:49:57'),
(455, 8, 'has logged in the system at ', '2021-01-10 11:50:02'),
(456, 8, 'has logged out the system at ', '2021-01-10 11:55:47'),
(457, 8, 'has logged in the system at ', '2021-01-11 14:51:06'),
(458, 8, 'has logged out the system at ', '2021-01-11 14:53:02'),
(459, 8, 'has logged in the system at ', '2021-01-11 20:40:21'),
(460, 8, 'has logged in the system at ', '2021-01-11 20:53:09'),
(461, 8, 'has logged out the system at ', '2021-01-11 21:06:08'),
(462, 8, 'has logged in the system at ', '2021-01-11 21:38:08'),
(463, 8, 'has logged out the system at ', '2021-01-11 21:39:03'),
(464, 4, 'has logged in the system at ', '2021-01-11 21:39:10'),
(465, 8, 'has logged in the system at ', '2021-01-12 10:27:38'),
(466, 8, 'has logged in the system at ', '2021-01-13 09:50:45'),
(467, 8, 'has logged in the system at ', '2021-01-14 08:28:41'),
(468, 8, 'has logged in the system at ', '2021-01-14 08:33:11'),
(469, 8, 'has logged out the system at ', '2021-01-14 08:33:20'),
(470, 8, 'has logged in the system at ', '2021-01-14 20:19:35'),
(471, 8, 'has logged in the system at ', '2021-01-18 20:34:30'),
(472, 8, 'has logged out the system at ', '2021-01-18 21:10:11'),
(473, 4, 'has logged in the system at ', '2021-01-18 21:10:18'),
(474, 4, 'has logged out the system at ', '2021-01-18 21:12:29'),
(475, 8, 'has logged in the system at ', '2021-01-19 20:38:15'),
(476, 8, 'has logged in the system at ', '2021-01-21 20:48:41'),
(477, 8, 'has logged out the system at ', '2021-01-21 20:51:35'),
(478, 4, 'has logged in the system at ', '2021-01-21 20:51:44'),
(479, 8, 'has logged in the system at ', '2021-01-22 20:48:55'),
(480, 8, 'has logged in the system at ', '2021-01-23 21:56:12'),
(481, 8, 'has logged in the system at ', '2021-01-26 12:56:48'),
(482, 8, 'has logged in the system at ', '2021-01-28 15:10:08'),
(483, 8, 'has logged in the system at ', '2021-01-28 17:35:00'),
(484, 8, 'has logged in the system at ', '2021-01-29 09:11:46'),
(485, 8, 'has logged in the system at ', '2021-01-30 10:52:49'),
(486, 8, 'has logged out the system at ', '2021-01-30 11:21:00'),
(487, 8, 'has logged in the system at ', '2021-02-01 08:06:07'),
(488, 8, 'has logged in the system at ', '2021-02-03 08:52:05'),
(489, 8, 'has logged out the system at ', '2021-02-03 08:53:16'),
(490, 4, 'has logged in the system at ', '2021-02-03 08:53:49'),
(491, 8, 'has logged in the system at ', '2021-02-03 17:47:35'),
(492, 8, 'has logged out the system at ', '2021-02-03 17:57:58'),
(493, 4, 'has logged in the system at ', '2021-02-03 17:58:07'),
(494, 8, 'has logged in the system at ', '2021-02-06 09:57:40'),
(495, 8, 'has logged out the system at ', '2021-02-06 10:00:39'),
(496, 4, 'has logged in the system at ', '2021-02-06 10:00:52'),
(497, 4, 'has logged out the system at ', '2021-02-06 10:04:17'),
(498, 8, 'has logged in the system at ', '2021-02-06 10:04:25'),
(499, 8, 'has logged out the system at ', '2021-02-06 10:05:44'),
(500, 4, 'has logged in the system at ', '2021-02-06 10:15:07'),
(501, 8, 'has logged in the system at ', '2021-02-09 08:54:43'),
(502, 8, 'has logged in the system at ', '2021-02-09 12:43:10'),
(503, 8, 'has logged in the system at ', '2021-02-10 14:35:21'),
(504, 8, 'has logged in the system at ', '2021-02-10 14:45:18'),
(505, 8, 'has logged in the system at ', '2021-02-10 14:50:41'),
(506, 8, 'has logged out the system at ', '2021-02-10 14:51:26'),
(507, 4, 'has logged in the system at ', '2021-02-10 14:51:33'),
(508, 8, 'has logged out the system at ', '2021-02-10 14:55:13'),
(509, 4, 'has logged in the system at ', '2021-02-10 14:55:27'),
(510, 8, 'has logged in the system at ', '2021-02-10 21:12:07'),
(511, 8, 'has logged in the system at ', '2021-02-11 10:21:11'),
(512, 8, 'has logged in the system at ', '2021-02-11 22:23:05'),
(513, 8, 'has logged out the system at ', '2021-02-11 22:29:04'),
(514, 4, 'has logged in the system at ', '2021-02-11 22:29:16'),
(515, 8, 'has logged in the system at ', '2021-02-11 22:31:00'),
(516, 8, 'has logged in the system at ', '2021-02-14 11:01:49'),
(517, 8, 'has logged out the system at ', '2021-02-14 11:04:40'),
(518, 4, 'has logged in the system at ', '2021-02-14 11:05:44'),
(519, 8, 'has logged in the system at ', '2021-02-14 11:42:25'),
(520, 8, 'has logged in the system at ', '2021-02-14 12:37:22'),
(521, 8, 'has logged in the system at ', '2021-02-15 10:14:11'),
(522, 8, 'has logged in the system at ', '2021-02-16 10:02:10'),
(523, 8, 'has logged in the system at ', '2021-02-16 11:32:59'),
(524, 8, 'has logged in the system at ', '2021-02-16 14:46:40'),
(525, 8, 'has logged in the system at ', '2021-02-17 16:04:26'),
(526, 8, 'has logged out the system at ', '2021-02-17 16:19:58'),
(527, 4, 'has logged in the system at ', '2021-02-17 16:20:05'),
(528, 4, 'has logged out the system at ', '2021-02-17 16:20:18'),
(529, 8, 'has logged in the system at ', '2021-02-17 16:20:24'),
(530, 8, 'has logged out the system at ', '2021-02-17 16:22:09'),
(531, 4, 'has logged in the system at ', '2021-02-17 16:26:36'),
(532, 8, 'has logged in the system at ', '2021-02-19 11:12:28'),
(533, 8, 'has logged out the system at ', '2021-02-19 11:46:08'),
(534, 4, 'has logged in the system at ', '2021-02-19 11:46:45'),
(535, 8, 'has logged in the system at ', '2021-02-19 16:56:27'),
(536, 4, 'has logged in the system at ', '2021-02-19 17:27:23'),
(537, 4, 'has logged in the system at ', '2021-02-20 09:48:48'),
(538, 8, 'has logged in the system at ', '2021-02-21 09:13:04'),
(539, 8, 'has logged in the system at ', '2021-02-25 21:59:51'),
(540, 8, 'has logged out the system at ', '2021-02-25 22:06:40'),
(541, 4, 'has logged in the system at ', '2021-02-25 22:09:32'),
(542, 4, 'has logged in the system at ', '2021-02-26 08:55:51'),
(543, 4, 'has logged out the system at ', '2021-02-26 08:58:21'),
(544, 8, 'has logged in the system at ', '2021-02-26 08:58:28'),
(545, 8, 'has logged out the system at ', '2021-02-26 09:04:48'),
(546, 4, 'has logged in the system at ', '2021-02-26 09:05:51'),
(547, 8, 'has logged in the system at ', '2021-02-26 14:22:09'),
(548, 4, 'has logged in the system at ', '2021-02-27 09:37:06'),
(549, 8, 'has logged in the system at ', '2021-02-27 14:27:16'),
(550, 8, 'has logged out the system at ', '2021-02-27 14:30:51'),
(551, 4, 'has logged in the system at ', '2021-02-27 14:31:06'),
(552, 8, 'has logged in the system at ', '2021-02-28 12:24:34'),
(553, 8, 'has logged out the system at ', '2021-02-28 12:25:08'),
(554, 4, 'has logged in the system at ', '2021-02-28 12:28:38'),
(555, 8, 'has logged in the system at ', '2021-03-01 11:23:42'),
(556, 8, 'has logged in the system at ', '2021-03-01 20:08:44'),
(557, 8, 'has logged in the system at ', '2021-03-02 11:28:27'),
(558, 8, 'has logged in the system at ', '2021-03-03 08:03:44'),
(559, 8, 'has logged in the system at ', '2021-03-04 16:31:17'),
(560, 8, 'has logged in the system at ', '2021-03-05 10:26:59'),
(561, 8, 'has logged in the system at ', '2021-03-06 09:13:36'),
(562, 8, 'has logged out the system at ', '2021-03-06 09:13:39'),
(563, 8, 'has logged in the system at ', '2021-03-06 09:29:22'),
(564, 8, 'has logged out the system at ', '2021-03-06 09:29:25'),
(565, 4, 'has logged in the system at ', '2021-03-06 09:29:44'),
(566, 4, 'has logged in the system at ', '2021-03-06 09:43:51'),
(567, 8, 'has logged in the system at ', '2021-03-06 11:33:44'),
(568, 8, 'has logged in the system at ', '2021-03-07 13:18:39'),
(569, 8, 'has logged out the system at ', '2021-03-07 13:23:50'),
(570, 4, 'has logged in the system at ', '2021-03-07 13:24:03'),
(571, 8, 'has logged in the system at ', '2021-03-07 18:32:21'),
(572, 8, 'has logged in the system at ', '2021-03-08 00:10:43'),
(573, 8, 'has logged in the system at ', '2021-03-08 00:55:47'),
(574, 8, 'has logged in the system at ', '2021-03-09 13:10:53'),
(575, 8, 'has logged in the system at ', '2021-03-11 15:29:39'),
(576, 8, 'has logged in the system at ', '2021-03-12 09:11:10'),
(577, 8, 'has logged out the system at ', '2021-03-12 09:12:46'),
(578, 4, 'has logged in the system at ', '2021-03-12 09:14:05'),
(579, 4, 'has logged out the system at ', '2021-03-12 09:14:47'),
(580, 8, 'has logged in the system at ', '2021-03-12 09:14:54'),
(581, 8, 'has logged in the system at ', '2021-03-13 09:06:17'),
(582, 8, 'has logged in the system at ', '2021-03-16 10:43:30'),
(583, 8, 'has logged out the system at ', '2021-03-16 11:06:08'),
(584, 4, 'has logged in the system at ', '2021-03-16 11:06:32'),
(585, 4, 'has logged out the system at ', '2021-03-16 11:09:16'),
(586, 8, 'has logged in the system at ', '2021-03-16 11:09:27'),
(587, 8, 'has logged out the system at ', '2021-03-16 11:14:00'),
(588, 8, 'has logged in the system at ', '2021-03-16 15:17:05'),
(589, 8, 'has logged out the system at ', '2021-03-16 15:26:12'),
(590, 4, 'has logged in the system at ', '2021-03-16 15:26:21'),
(591, 8, 'has logged in the system at ', '2021-03-17 09:41:03'),
(592, 8, 'has logged in the system at ', '2021-03-18 18:06:21'),
(593, 8, 'has logged out the system at ', '2021-03-18 18:07:53'),
(594, 4, 'has logged in the system at ', '2021-03-18 18:08:03'),
(595, 8, 'has logged in the system at ', '2021-03-20 18:23:04'),
(596, 8, 'has logged out the system at ', '2021-03-20 18:24:15'),
(597, 4, 'has logged in the system at ', '2021-03-23 12:39:30'),
(598, 4, 'has logged in the system at ', '2021-03-24 15:30:25'),
(599, 4, 'has logged out the system at ', '2021-03-24 15:32:14'),
(600, 8, 'has logged in the system at ', '2021-03-24 15:32:23'),
(601, 8, 'has logged in the system at ', '2021-03-24 16:01:40'),
(602, 8, 'has logged out the system at ', '2021-03-24 16:17:42'),
(603, 8, 'has logged in the system at ', '2021-03-24 16:17:52'),
(604, 8, 'has logged out the system at ', '2021-03-24 16:19:29'),
(605, 4, 'has logged in the system at ', '2021-03-24 16:20:06'),
(606, 8, 'has logged in the system at ', '2021-03-25 14:26:04'),
(607, 8, 'has logged in the system at ', '2021-03-25 14:29:30'),
(608, 8, 'has logged out the system at ', '2021-03-25 14:35:27'),
(609, 4, 'has logged in the system at ', '2021-03-25 14:35:34'),
(610, 8, 'has logged in the system at ', '2021-03-26 08:52:31'),
(611, 8, 'has logged out the system at ', '2021-03-26 08:54:28'),
(612, 4, 'has logged in the system at ', '2021-03-26 08:54:49'),
(613, 8, 'has logged in the system at ', '2021-03-26 13:38:49'),
(614, 8, 'has logged in the system at ', '2021-03-27 15:08:12'),
(615, 8, 'has logged out the system at ', '2021-03-27 15:11:12'),
(616, 4, 'has logged in the system at ', '2021-03-27 15:11:19'),
(617, 4, 'has logged in the system at ', '2021-03-31 17:09:29'),
(618, 4, 'has logged out the system at ', '2021-03-31 17:09:57'),
(619, 8, 'has logged in the system at ', '2021-03-31 17:10:04'),
(620, 8, 'has logged in the system at ', '2021-04-01 09:19:53'),
(621, 8, 'has logged in the system at ', '2021-04-06 07:45:32'),
(622, 4, 'has logged in the system at ', '2021-04-07 09:27:27'),
(623, 4, 'has logged out the system at ', '2021-04-07 09:27:56'),
(624, 8, 'has logged in the system at ', '2021-04-07 09:28:06'),
(625, 8, 'has logged in the system at ', '2021-04-09 10:10:56'),
(626, 8, 'has logged in the system at ', '2021-04-09 19:47:35'),
(627, 8, 'has logged in the system at ', '2021-04-11 05:08:33'),
(628, 8, 'has logged out the system at ', '2021-04-11 05:24:27'),
(629, 8, 'has logged in the system at ', '2021-04-11 05:44:55'),
(630, 8, 'has logged out the system at ', '2021-04-11 05:44:57'),
(631, 8, 'has logged in the system at ', '2021-04-11 09:06:54'),
(632, 8, 'has logged out the system at ', '2021-04-11 09:07:25'),
(633, 4, 'has logged in the system at ', '2021-04-11 09:08:15'),
(634, 8, 'has logged in the system at ', '2021-04-12 14:02:32'),
(635, 8, 'has logged in the system at ', '2021-04-13 12:50:16'),
(636, 8, 'has logged in the system at ', '2021-04-13 13:26:19'),
(637, 4, 'has logged in the system at ', '2021-04-13 16:10:31'),
(638, 4, 'has logged out the system at ', '2021-04-13 16:10:39'),
(639, 8, 'has logged in the system at ', '2021-04-13 16:10:51'),
(640, 4, 'has logged in the system at ', '2021-04-15 08:12:05'),
(641, 8, 'has logged in the system at ', '2021-04-16 09:10:41'),
(642, 8, 'has logged in the system at ', '2021-04-16 11:43:03'),
(643, 8, 'has logged in the system at ', '2021-04-16 11:46:41'),
(644, 8, 'has logged in the system at ', '2021-04-16 13:51:32'),
(645, 8, 'has logged out the system at ', '2021-04-16 14:12:19'),
(646, 4, 'has logged in the system at ', '2021-04-16 14:12:43'),
(647, 8, 'has logged in the system at ', '2021-04-19 17:21:11'),
(648, 8, 'has logged out the system at ', '2021-04-19 17:22:54'),
(649, 8, 'has logged in the system at ', '2021-04-20 11:02:25'),
(650, 8, 'has logged in the system at ', '2021-04-20 12:26:46'),
(651, 8, 'has logged in the system at ', '2021-04-22 15:28:26'),
(652, 8, 'has logged out the system at ', '2021-04-22 15:28:30'),
(653, 4, 'has logged in the system at ', '2021-04-22 15:28:43'),
(654, 8, 'has logged in the system at ', '2021-04-23 20:52:27'),
(655, 8, 'has logged in the system at ', '2021-04-24 09:28:52'),
(656, 8, 'has logged out the system at ', '2021-04-24 09:29:14'),
(657, 4, 'has logged in the system at ', '2021-04-24 09:29:27'),
(658, 8, 'has logged in the system at ', '2021-04-26 19:04:15'),
(659, 8, 'has logged in the system at ', '2021-04-27 13:13:32'),
(660, 8, 'has logged out the system at ', '2021-04-27 13:25:38'),
(661, 4, 'has logged in the system at ', '2021-04-27 13:26:21'),
(662, 8, 'has logged in the system at ', '2021-04-27 15:55:32'),
(663, 8, 'has logged in the system at ', '2021-04-28 10:54:41'),
(664, 8, 'has logged in the system at ', '2021-04-28 15:57:19'),
(665, 8, 'has logged in the system at ', '2021-04-29 19:08:19'),
(666, 4, 'has logged in the system at ', '2021-04-29 20:54:29'),
(667, 8, 'has logged in the system at ', '2021-05-03 10:28:28'),
(668, 8, 'has logged out the system at ', '2021-05-03 10:31:46'),
(669, 4, 'has logged in the system at ', '2021-05-03 10:32:01'),
(670, 8, 'has logged in the system at ', '2021-05-04 14:51:15'),
(671, 4, 'has logged in the system at ', '2021-05-07 08:11:29'),
(672, 4, 'has logged out the system at ', '2021-05-07 08:12:51'),
(673, 8, 'has logged in the system at ', '2021-05-07 08:12:58'),
(674, 8, 'has logged in the system at ', '2021-05-09 11:43:16'),
(675, 8, 'has logged in the system at ', '2021-05-09 12:11:07'),
(676, 8, 'has logged out the system at ', '2021-05-09 12:13:21'),
(677, 4, 'has logged in the system at ', '2021-05-09 12:13:35'),
(678, 8, 'has logged in the system at ', '2021-05-10 11:27:43'),
(679, 8, 'has logged out the system at ', '2021-05-10 11:29:08'),
(680, 4, 'has logged in the system at ', '2021-05-10 11:29:15'),
(681, 4, 'has logged in the system at ', '2021-05-13 10:17:29'),
(682, 4, 'has logged out the system at ', '2021-05-13 10:17:35'),
(683, 8, 'has logged in the system at ', '2021-05-13 10:21:38'),
(684, 8, 'has logged in the system at ', '2021-05-15 14:36:47'),
(685, 8, 'has logged in the system at ', '2021-05-17 09:00:45'),
(686, 8, 'has logged out the system at ', '2021-05-17 09:01:50'),
(687, 8, 'has logged in the system at ', '2021-05-18 22:02:05'),
(688, 8, 'has logged out the system at ', '2021-05-18 22:11:44'),
(689, 4, 'has logged in the system at ', '2021-05-18 22:12:12'),
(690, 8, 'has logged in the system at ', '2021-05-20 08:35:49'),
(691, 8, 'has logged out the system at ', '2021-05-20 08:41:41'),
(692, 4, 'has logged in the system at ', '2021-05-20 08:44:20'),
(693, 8, 'has logged in the system at ', '2021-05-21 09:12:14'),
(694, 8, 'has logged in the system at ', '2021-05-21 16:48:33'),
(695, 8, 'has logged in the system at ', '2021-05-25 14:44:46'),
(696, 8, 'has logged in the system at ', '2021-05-25 14:53:11'),
(697, 8, 'has logged in the system at ', '2021-05-26 15:13:01'),
(698, 8, 'has logged out the system at ', '2021-05-26 15:15:23'),
(699, 4, 'has logged in the system at ', '2021-05-26 15:15:31'),
(700, 8, 'has logged in the system at ', '2021-05-27 11:30:38'),
(701, 8, 'has logged out the system at ', '2021-05-27 11:30:42'),
(702, 8, 'has logged in the system at ', '2021-05-27 16:51:12'),
(703, 8, 'has logged in the system at ', '2021-05-28 16:42:44'),
(704, 8, 'has logged out the system at ', '2021-05-28 16:45:13'),
(705, 4, 'has logged in the system at ', '2021-05-28 16:45:24'),
(706, 4, 'has logged in the system at ', '2021-05-28 16:52:04'),
(707, 4, 'has logged in the system at ', '2021-06-01 10:36:27'),
(708, 8, 'has logged in the system at ', '2021-06-02 09:12:25'),
(709, 8, 'has logged out the system at ', '2021-06-02 09:12:28'),
(710, 8, 'has logged in the system at ', '2021-06-02 09:14:23'),
(711, 8, 'has logged in the system at ', '2021-06-02 09:22:58'),
(712, 8, 'has logged in the system at ', '2021-06-03 22:45:57'),
(713, 8, 'has logged out the system at ', '2021-06-03 22:48:18'),
(714, 4, 'has logged in the system at ', '2021-06-03 22:48:27'),
(715, 8, 'has logged in the system at ', '2021-06-04 17:07:39'),
(716, 8, 'has logged in the system at ', '2021-06-08 12:29:09'),
(717, 8, 'has logged in the system at ', '2021-06-10 11:24:50'),
(718, 8, 'has logged out the system at ', '2021-06-10 11:27:49'),
(719, 4, 'has logged in the system at ', '2021-06-10 11:28:00'),
(720, 8, 'has logged in the system at ', '2021-06-10 13:43:40'),
(721, 8, 'has logged in the system at ', '2021-06-10 15:45:48'),
(722, 8, 'has logged out the system at ', '2021-06-10 15:48:36'),
(723, 4, 'has logged in the system at ', '2021-06-10 15:48:50'),
(724, 8, 'has logged in the system at ', '2021-06-17 08:35:35'),
(725, 8, 'has logged out the system at ', '2021-06-17 08:44:51'),
(726, 8, 'has logged in the system at ', '2021-06-18 08:18:46'),
(727, 8, 'has logged in the system at ', '2021-06-19 12:42:29'),
(728, 8, 'has logged in the system at ', '2021-06-20 12:00:24'),
(729, 8, 'has logged in the system at ', '2021-06-21 12:12:17'),
(730, 8, 'has logged in the system at ', '2021-06-21 13:15:40'),
(731, 8, 'has logged out the system at ', '2021-06-21 13:16:04'),
(732, 4, 'has logged in the system at ', '2021-06-21 13:16:11'),
(733, 8, 'has logged in the system at ', '2021-06-22 13:23:20'),
(734, 8, 'has logged in the system at ', '2021-06-22 16:36:17'),
(735, 8, 'has logged in the system at ', '2021-06-24 10:45:26'),
(736, 8, 'has logged out the system at ', '2021-06-24 10:46:03'),
(737, 4, 'has logged in the system at ', '2021-06-24 10:46:10'),
(738, 4, 'has logged out the system at ', '2021-06-24 10:47:26'),
(739, 8, 'has logged in the system at ', '2021-06-24 10:47:33'),
(740, 8, 'has logged in the system at ', '2021-06-27 15:47:08'),
(741, 8, 'has logged in the system at ', '2021-06-28 18:23:55'),
(742, 8, 'has logged out the system at ', '2021-06-28 18:38:48'),
(743, 8, 'has logged in the system at ', '2021-07-01 11:45:21'),
(744, 8, 'has logged out the system at ', '2021-07-01 11:54:45'),
(745, 8, 'has logged in the system at ', '2021-07-02 13:34:23'),
(746, 8, 'has logged in the system at ', '2021-07-03 14:43:08'),
(747, 8, 'has logged in the system at ', '2021-07-07 11:36:43'),
(748, 8, 'has logged out the system at ', '2021-07-07 11:37:57'),
(749, 4, 'has logged in the system at ', '2021-07-07 11:38:09'),
(750, 8, 'has logged in the system at ', '2021-07-08 10:45:41'),
(751, 8, 'has logged out the system at ', '2021-07-08 10:47:28'),
(752, 4, 'has logged in the system at ', '2021-07-08 11:07:45'),
(753, 4, 'has logged in the system at ', '2021-07-09 08:18:54'),
(754, 8, 'has logged in the system at ', '2021-07-09 14:53:47'),
(755, 8, 'has logged out the system at ', '2021-07-09 14:58:57'),
(756, 4, 'has logged in the system at ', '2021-07-09 14:59:08'),
(757, 8, 'has logged in the system at ', '2021-07-14 18:47:23'),
(758, 8, 'has logged in the system at ', '2021-07-15 15:47:20'),
(759, 8, 'has logged out the system at ', '2021-07-15 16:00:26'),
(760, 4, 'has logged in the system at ', '2021-07-15 16:00:38'),
(761, 8, 'has logged in the system at ', '2021-07-19 09:38:44'),
(762, 8, 'has logged out the system at ', '2021-07-19 09:41:50'),
(763, 4, 'has logged in the system at ', '2021-07-19 09:42:51'),
(764, 4, 'has logged out the system at ', '2021-07-19 09:49:07'),
(765, 8, 'has logged in the system at ', '2021-07-19 09:49:15'),
(766, 8, 'has logged in the system at ', '2021-07-20 09:27:04'),
(767, 8, 'has logged out the system at ', '2021-07-20 09:29:27'),
(768, 4, 'has logged in the system at ', '2021-07-20 09:34:23'),
(769, 8, 'has logged in the system at ', '2021-07-21 17:06:03'),
(770, 8, 'has logged in the system at ', '2021-07-22 17:41:05'),
(771, 8, 'has logged out the system at ', '2021-07-22 17:41:14'),
(772, 8, 'has logged in the system at ', '2021-07-26 08:26:26'),
(773, 8, 'has logged out the system at ', '2021-07-26 08:32:08'),
(774, 4, 'has logged in the system at ', '2021-07-26 08:35:08'),
(775, 8, 'has logged in the system at ', '2021-07-28 10:12:03'),
(776, 8, 'has logged out the system at ', '2021-07-28 10:14:24'),
(777, 4, 'has logged in the system at ', '2021-07-28 10:14:32'),
(778, 8, 'has logged in the system at ', '2021-07-28 17:04:30'),
(779, 8, 'has logged out the system at ', '2021-07-28 17:13:16'),
(780, 4, 'has logged in the system at ', '2021-07-28 17:13:30'),
(781, 8, 'has logged in the system at ', '2021-07-31 12:22:32'),
(782, 8, 'has logged out the system at ', '2021-07-31 12:25:21'),
(783, 4, 'has logged in the system at ', '2021-07-31 12:25:32'),
(784, 8, 'has logged in the system at ', '2021-08-01 09:46:06'),
(785, 8, 'has logged out the system at ', '2021-08-01 09:47:53'),
(786, 4, 'has logged in the system at ', '2021-08-01 09:51:36'),
(787, 8, 'has logged in the system at ', '2021-08-03 09:04:24'),
(788, 8, 'has logged in the system at ', '2021-08-04 17:21:17'),
(789, 8, 'has logged out the system at ', '2021-08-04 17:25:11');
INSERT INTO `history_log` (`log_id`, `user_id`, `action`, `date`) VALUES
(790, 4, 'has logged in the system at ', '2021-08-04 17:25:19'),
(791, 8, 'has logged in the system at ', '2021-08-07 11:42:16'),
(792, 8, 'has logged in the system at ', '2021-08-10 11:00:51'),
(793, 8, 'has logged in the system at ', '2021-08-10 11:03:24'),
(794, 8, 'has logged in the system at ', '2021-08-10 11:04:04'),
(795, 8, 'has logged in the system at ', '2021-08-10 11:05:35'),
(796, 8, 'has logged in the system at ', '2021-08-10 11:09:09'),
(797, 8, 'has logged in the system at ', '2021-08-10 11:14:05'),
(798, 8, 'has logged in the system at ', '2021-08-10 15:14:14'),
(799, 8, 'has logged in the system at ', '2021-08-10 15:15:09'),
(800, 8, 'has logged in the system at ', '2021-08-14 13:39:25'),
(801, 8, 'has logged out the system at ', '2021-08-14 13:42:02'),
(802, 4, 'has logged in the system at ', '2021-08-14 13:42:26'),
(803, 8, 'has logged in the system at ', '2021-08-16 16:25:01'),
(804, 8, 'has logged in the system at ', '2021-08-16 16:26:00'),
(805, 8, 'has logged in the system at ', '2021-08-16 16:28:18'),
(806, 8, 'has logged in the system at ', '2021-08-18 13:30:03'),
(807, 8, 'has logged in the system at ', '2021-08-18 13:31:16'),
(808, 8, 'has logged in the system at ', '2021-08-20 09:42:28'),
(809, 8, 'has logged in the system at ', '2021-08-21 11:45:55'),
(810, 8, 'has logged in the system at ', '2021-08-21 11:46:23'),
(811, 8, 'has logged in the system at ', '2021-08-21 11:48:54'),
(812, 8, 'has logged out the system at ', '2021-08-21 11:53:57'),
(813, 4, 'has logged in the system at ', '2021-08-21 11:54:33'),
(814, 8, 'has logged in the system at ', '2021-08-23 14:33:17'),
(815, 8, 'has logged in the system at ', '2021-08-25 11:32:11'),
(816, 8, 'has logged in the system at ', '2021-08-25 11:32:41'),
(817, 8, 'has logged in the system at ', '2021-08-27 17:30:33'),
(818, 4, 'has logged in the system at ', '2021-08-29 16:58:39'),
(819, 4, 'has logged in the system at ', '2021-08-29 17:04:52'),
(820, 8, 'has logged in the system at ', '2021-08-31 11:44:56'),
(821, 8, 'has logged in the system at ', '2021-08-31 13:33:19'),
(822, 4, 'has logged in the system at ', '2021-08-31 13:39:21'),
(823, 4, 'has logged in the system at ', '2021-09-02 16:48:23'),
(824, 4, 'has logged out the system at ', '2021-09-02 16:48:34'),
(825, 8, 'has logged in the system at ', '2021-09-02 16:48:41'),
(826, 8, 'has logged in the system at ', '2021-09-03 11:18:38'),
(827, 8, 'has logged in the system at ', '2021-09-03 11:20:40'),
(828, 8, 'has logged in the system at ', '2021-09-03 16:30:55'),
(829, 8, 'has logged in the system at ', '2021-09-05 12:33:28'),
(830, 8, 'has logged in the system at ', '2021-09-05 12:34:05'),
(831, 8, 'has logged out the system at ', '2021-09-05 12:35:41'),
(832, 4, 'has logged in the system at ', '2021-09-05 12:35:59'),
(833, 4, 'has logged in the system at ', '2021-09-06 09:54:03'),
(834, 4, 'has logged in the system at ', '2021-09-06 14:47:09'),
(835, 4, 'has logged out the system at ', '2021-09-06 14:47:13'),
(836, 8, 'has logged in the system at ', '2021-09-06 14:47:20'),
(837, 8, 'has logged in the system at ', '2021-09-07 13:35:08'),
(838, 8, 'has logged in the system at ', '2021-09-08 08:15:12'),
(839, 8, 'has logged out the system at ', '2021-09-08 08:15:51'),
(840, 4, 'has logged in the system at ', '2021-09-08 08:16:02'),
(841, 8, 'has logged in the system at ', '2021-09-08 15:32:02'),
(842, 0, 'has logged out the system at ', '2021-09-08 17:21:09'),
(843, 8, 'has logged in the system at ', '2021-09-10 14:34:52'),
(844, 8, 'has logged in the system at ', '2021-09-11 12:24:00'),
(845, 8, 'has logged in the system at ', '2021-09-15 15:00:27'),
(846, 8, 'has logged out the system at ', '2021-09-15 15:02:12'),
(847, 4, 'has logged in the system at ', '2021-09-15 15:02:38'),
(848, 8, 'has logged in the system at ', '2021-09-17 10:51:30'),
(849, 8, 'has logged out the system at ', '2021-09-17 10:52:50'),
(850, 8, 'has logged in the system at ', '2021-09-19 10:39:20'),
(851, 8, 'has logged out the system at ', '2021-09-19 10:39:57'),
(852, 8, 'has logged in the system at ', '2021-09-19 12:27:23'),
(853, 8, 'has logged in the system at ', '2021-09-20 08:56:35'),
(854, 8, 'has logged out the system at ', '2021-09-20 09:31:54'),
(855, 4, 'has logged in the system at ', '2021-09-20 09:32:04'),
(856, 8, 'has logged in the system at ', '2021-09-20 15:38:53'),
(857, 8, 'has logged in the system at ', '2021-09-22 08:45:20'),
(858, 8, 'has logged in the system at ', '2021-09-22 12:27:00'),
(859, 8, 'has logged in the system at ', '2021-09-22 14:50:07'),
(860, 4, 'has logged in the system at ', '2021-09-23 11:36:00'),
(861, 8, 'has logged in the system at ', '2021-09-24 14:26:32'),
(862, 8, 'has logged in the system at ', '2021-09-25 11:31:35'),
(863, 8, 'has logged out the system at ', '2021-09-25 11:38:44'),
(864, 4, 'has logged in the system at ', '2021-09-25 11:38:55'),
(865, 8, 'has logged in the system at ', '2021-09-26 18:51:03'),
(866, 8, 'has logged in the system at ', '2021-09-27 15:32:24'),
(867, 8, 'has logged in the system at ', '2021-09-29 11:20:10'),
(868, 8, 'has logged in the system at ', '2021-10-01 08:57:07'),
(869, 8, 'has logged in the system at ', '2021-10-02 08:35:48'),
(870, 4, 'has logged in the system at ', '2021-10-07 11:26:38'),
(871, 4, 'has logged in the system at ', '2021-10-07 13:39:51'),
(872, 8, 'has logged in the system at ', '2021-10-07 16:01:24'),
(873, 8, 'has logged in the system at ', '2021-10-09 08:49:50'),
(874, 8, 'has logged out the system at ', '2021-10-09 08:51:12'),
(875, 4, 'has logged in the system at ', '2021-10-09 08:54:37'),
(876, 8, 'has logged in the system at ', '2021-10-11 08:20:07'),
(877, 8, 'has logged in the system at ', '2021-10-11 13:46:08'),
(878, 8, 'has logged in the system at ', '2021-10-11 16:05:55'),
(879, 8, 'has logged in the system at ', '2021-10-14 09:06:14'),
(880, 8, 'has logged in the system at ', '2021-10-14 11:22:08'),
(881, 8, 'has logged in the system at ', '2021-10-15 10:55:08'),
(882, 8, 'has logged in the system at ', '2021-10-18 09:18:17'),
(883, 8, 'has logged in the system at ', '2021-10-18 10:46:35'),
(884, 8, 'has logged in the system at ', '2021-10-20 08:18:19'),
(885, 8, 'has logged in the system at ', '2021-10-21 11:23:11'),
(886, 8, 'has logged in the system at ', '2021-10-22 08:13:46'),
(887, 8, 'has logged in the system at ', '2021-10-22 10:49:42'),
(888, 8, 'has logged in the system at ', '2021-10-22 16:57:31'),
(889, 8, 'has logged in the system at ', '2021-10-25 16:51:23'),
(890, 8, 'has logged out the system at ', '2021-10-25 17:03:24'),
(891, 8, 'has logged in the system at ', '2021-10-25 17:21:38'),
(892, 8, 'has logged out the system at ', '2021-10-25 17:21:49'),
(893, 4, 'has logged in the system at ', '2021-10-25 17:21:56'),
(894, 8, 'has logged in the system at ', '2021-10-26 08:32:13'),
(895, 8, 'has logged in the system at ', '2021-10-26 14:40:55'),
(896, 8, 'has logged out the system at ', '2021-10-26 14:41:29'),
(897, 8, 'has logged in the system at ', '2021-10-27 08:39:58'),
(898, 8, 'has logged out the system at ', '2021-10-27 08:49:14'),
(899, 4, 'has logged in the system at ', '2021-10-27 08:49:21'),
(900, 8, 'has logged in the system at ', '2021-10-30 13:56:22'),
(901, 8, 'has logged in the system at ', '2021-11-01 08:21:23'),
(902, 8, 'has logged in the system at ', '2021-11-01 10:39:34'),
(903, 8, 'has logged in the system at ', '2021-11-04 08:00:15'),
(904, 8, 'has logged in the system at ', '2021-11-08 08:18:42'),
(905, 8, 'has logged in the system at ', '2021-11-08 13:02:42'),
(906, 8, 'has logged in the system at ', '2021-11-08 15:08:02'),
(907, 8, 'has logged in the system at ', '2021-11-09 09:34:01'),
(908, 8, 'has logged in the system at ', '2021-11-10 08:55:38'),
(909, 8, 'has logged in the system at ', '2021-11-12 08:20:54'),
(910, 8, 'has logged in the system at ', '2021-11-13 08:52:37'),
(911, 4, 'has logged in the system at ', '2021-11-13 09:14:46'),
(912, 8, 'has logged in the system at ', '2021-11-15 11:20:20'),
(913, 8, 'has logged in the system at ', '2021-11-17 13:05:44'),
(914, 8, 'has logged out the system at ', '2021-11-17 13:13:33'),
(915, 4, 'has logged in the system at ', '2021-11-17 13:13:49'),
(916, 8, 'has logged in the system at ', '2021-11-18 14:47:48'),
(917, 4, 'has logged in the system at ', '2021-11-23 11:49:43'),
(918, 4, 'has logged out the system at ', '2021-11-23 12:01:24'),
(919, 8, 'has logged in the system at ', '2021-11-23 12:01:32'),
(920, 8, 'has logged out the system at ', '2021-11-23 12:02:27'),
(921, 4, 'has logged in the system at ', '2021-11-23 12:02:39'),
(922, 4, 'has logged out the system at ', '2021-11-23 12:04:09'),
(923, 8, 'has logged in the system at ', '2021-11-23 12:04:17'),
(924, 8, 'has logged out the system at ', '2021-11-23 12:07:53'),
(925, 4, 'has logged in the system at ', '2021-11-23 12:08:06'),
(926, 8, 'has logged in the system at ', '2021-11-25 07:58:10'),
(927, 8, 'has logged out the system at ', '2021-11-25 07:59:14'),
(928, 4, 'has logged in the system at ', '2021-11-25 07:59:47'),
(929, 8, 'has logged in the system at ', '2021-11-26 13:46:57'),
(930, 8, 'has logged out the system at ', '2021-11-26 13:47:42'),
(931, 8, 'has logged in the system at ', '2021-11-27 06:53:34'),
(932, 8, 'has logged in the system at ', '2021-11-27 09:10:56'),
(933, 8, 'has logged in the system at ', '2021-11-29 13:29:50'),
(934, 8, 'has logged in the system at ', '2021-11-30 08:52:49'),
(935, 8, 'has logged out the system at ', '2021-11-30 08:57:40'),
(936, 4, 'has logged in the system at ', '2021-11-30 08:57:50'),
(937, 4, 'has logged out the system at ', '2021-11-30 09:06:23'),
(938, 8, 'has logged in the system at ', '2021-12-01 08:42:28'),
(939, 8, 'has logged in the system at ', '2021-12-01 16:09:29'),
(940, 8, 'has logged out the system at ', '2021-12-01 16:09:40'),
(941, 8, 'has logged in the system at ', '2021-12-01 16:09:47'),
(942, 8, 'has logged out the system at ', '2021-12-01 16:11:29'),
(943, 4, 'has logged in the system at ', '2021-12-01 16:11:42'),
(944, 4, 'has logged out the system at ', '2021-12-01 16:12:55'),
(945, 4, 'has logged in the system at ', '2021-12-01 16:13:02'),
(946, 4, 'has logged out the system at ', '2021-12-01 16:13:49'),
(947, 8, 'has logged in the system at ', '2021-12-01 16:14:27'),
(948, 8, 'has logged out the system at ', '2021-12-01 16:16:04'),
(949, 4, 'has logged in the system at ', '2021-12-01 16:16:12'),
(950, 8, 'has logged in the system at ', '2021-12-02 15:25:21'),
(951, 8, 'has logged in the system at ', '2021-12-03 10:56:23'),
(952, 8, 'has logged out the system at ', '2021-12-03 11:02:11'),
(953, 4, 'has logged in the system at ', '2021-12-03 11:02:23'),
(954, 4, 'has logged out the system at ', '2021-12-03 11:04:17'),
(955, 8, 'has logged in the system at ', '2021-12-03 11:04:24'),
(956, 8, 'has logged in the system at ', '2021-12-03 11:05:59'),
(957, 8, 'has logged in the system at ', '2021-12-03 11:27:14'),
(958, 8, 'has logged in the system at ', '2021-12-03 12:11:52'),
(959, 8, 'has logged in the system at ', '2021-12-04 12:02:08'),
(960, 8, 'has logged in the system at ', '2021-12-04 12:29:18'),
(961, 8, 'has logged out the system at ', '2021-12-04 12:29:36'),
(962, 8, 'has logged in the system at ', '2021-12-06 14:33:07'),
(963, 8, 'has logged in the system at ', '2021-12-06 15:37:02'),
(964, 8, 'has logged out the system at ', '2021-12-06 16:05:39'),
(965, 4, 'has logged in the system at ', '2021-12-06 16:16:29'),
(966, 4, 'has logged out the system at ', '2021-12-06 16:44:23'),
(967, 8, 'has logged in the system at ', '2021-12-06 16:44:30'),
(968, 8, 'has logged in the system at ', '2021-12-07 14:46:03'),
(969, 8, 'has logged in the system at ', '2021-12-08 12:55:25'),
(970, 8, 'has logged in the system at ', '2021-12-10 11:12:52'),
(971, 8, 'has logged in the system at ', '2021-12-10 11:13:21'),
(972, 8, 'has logged in the system at ', '2021-12-10 11:13:38'),
(973, 8, 'has logged in the system at ', '2021-12-10 11:30:13'),
(974, 8, 'has logged out the system at ', '2021-12-10 11:31:05'),
(975, 8, 'has logged in the system at ', '2021-12-10 18:11:45'),
(976, 8, 'has logged out the system at ', '2021-12-10 18:13:15'),
(977, 4, 'has logged in the system at ', '2021-12-10 18:13:23'),
(978, 8, 'has logged in the system at ', '2021-12-13 14:47:15'),
(979, 8, 'has logged in the system at ', '2021-12-14 10:39:19'),
(980, 8, 'has logged in the system at ', '2021-12-14 10:39:35'),
(981, 8, 'has logged in the system at ', '2021-12-14 11:44:07'),
(982, 8, 'has logged in the system at ', '2021-12-14 13:59:10'),
(983, 8, 'has logged in the system at ', '2021-12-15 15:07:19'),
(984, 8, 'has logged in the system at ', '2021-12-16 11:27:42'),
(985, 8, 'has logged out the system at ', '2021-12-16 11:29:17'),
(986, 4, 'has logged in the system at ', '2021-12-16 11:34:16'),
(987, 8, 'has logged in the system at ', '2021-12-20 09:19:44'),
(988, 8, 'has logged in the system at ', '2021-12-21 14:56:49'),
(989, 8, 'has logged in the system at ', '2021-12-21 14:57:09'),
(990, 8, 'has logged in the system at ', '2021-12-21 14:58:20'),
(991, 8, 'has logged in the system at ', '2021-12-21 17:23:05'),
(992, 8, 'has logged out the system at ', '2021-12-21 17:24:08'),
(993, 4, 'has logged in the system at ', '2021-12-21 17:24:22'),
(994, 8, 'has logged in the system at ', '2021-12-21 17:30:34'),
(995, 8, 'has logged in the system at ', '2021-12-22 14:58:08'),
(996, 8, 'has logged in the system at ', '2021-12-22 14:58:28'),
(997, 8, 'has logged in the system at ', '2021-12-22 15:04:15'),
(998, 8, 'has logged in the system at ', '2021-12-22 17:10:58'),
(999, 8, 'has logged in the system at ', '2021-12-23 09:49:04'),
(1000, 8, 'has logged out the system at ', '2021-12-23 09:49:27'),
(1001, 4, 'has logged in the system at ', '2021-12-23 09:50:54'),
(1002, 8, 'has logged in the system at ', '2021-12-23 17:18:48'),
(1003, 8, 'has logged out the system at ', '2021-12-23 17:21:06'),
(1004, 4, 'has logged in the system at ', '2021-12-23 17:21:14'),
(1005, 4, 'has logged out the system at ', '2021-12-23 17:21:54'),
(1006, 8, 'has logged in the system at ', '2021-12-24 11:14:13'),
(1007, 8, 'has logged in the system at ', '2021-12-24 14:02:51'),
(1008, 8, 'has logged in the system at ', '2021-12-27 09:26:34'),
(1009, 8, 'has logged out the system at ', '2021-12-27 09:29:40'),
(1010, 8, 'has logged in the system at ', '2021-12-27 12:48:49'),
(1011, 8, 'has logged out the system at ', '2021-12-27 12:48:53'),
(1012, 4, 'has logged in the system at ', '2021-12-27 12:49:07'),
(1013, 8, 'has logged in the system at ', '2021-12-27 15:40:15'),
(1014, 4, 'has logged in the system at ', '2021-12-27 15:59:53'),
(1015, 4, 'has logged out the system at ', '2021-12-27 16:01:58'),
(1016, 8, 'has logged in the system at ', '2021-12-27 16:02:06'),
(1017, 8, 'has logged in the system at ', '2021-12-29 11:24:49'),
(1018, 8, 'has logged in the system at ', '2021-12-29 17:30:48'),
(1019, 8, 'has logged in the system at ', '2021-12-30 10:33:40'),
(1020, 8, 'has logged in the system at ', '2022-01-04 16:57:28'),
(1021, 8, 'has logged out the system at ', '2022-01-04 16:57:31'),
(1022, 4, 'has logged in the system at ', '2022-01-04 16:57:48'),
(1023, 12, 'has logged in the system at ', '2022-01-04 17:06:47'),
(1024, 8, 'has logged in the system at ', '2022-01-05 16:21:16'),
(1025, 8, 'has logged out the system at ', '2022-01-05 16:23:22'),
(1026, 12, 'has logged in the system at ', '2022-01-07 09:52:59'),
(1027, 12, 'has logged in the system at ', '2022-01-07 10:38:23'),
(1028, 12, 'has logged in the system at ', '2022-01-07 11:20:07'),
(1029, 12, 'has logged out the system at ', '2022-01-07 11:24:24'),
(1030, 8, 'has logged in the system at ', '2022-01-07 11:24:31'),
(1031, 8, 'has logged out the system at ', '2022-01-07 11:25:50'),
(1032, 12, 'has logged in the system at ', '2022-01-07 11:47:14'),
(1033, 12, 'has logged in the system at ', '2022-01-07 13:27:39'),
(1034, 12, 'has logged in the system at ', '2022-01-07 13:42:44'),
(1035, 12, 'has logged in the system at ', '2022-01-07 14:18:13'),
(1036, 12, 'has logged in the system at ', '2022-01-07 15:01:07'),
(1037, 12, 'has logged in the system at ', '2022-01-08 09:13:51'),
(1038, 12, 'has logged out the system at ', '2022-01-08 09:16:20'),
(1039, 8, 'has logged in the system at ', '2022-01-08 09:16:28'),
(1040, 8, 'has logged in the system at ', '2022-01-08 09:22:36'),
(1041, 8, 'has logged in the system at ', '2022-01-08 09:27:52'),
(1042, 12, 'has logged in the system at ', '2022-01-08 09:44:41'),
(1043, 12, 'has logged in the system at ', '2022-01-08 09:44:59'),
(1044, 12, 'has logged out the system at ', '2022-01-08 09:55:34'),
(1045, 8, 'has logged in the system at ', '2022-01-08 09:55:44'),
(1046, 8, 'has logged in the system at ', '2022-01-08 10:16:51'),
(1047, 12, 'has logged in the system at ', '2022-01-08 11:43:44'),
(1048, 12, 'has logged out the system at ', '2022-01-08 11:44:22'),
(1049, 8, 'has logged in the system at ', '2022-01-08 11:44:33'),
(1050, 8, 'has logged out the system at ', '2022-01-08 12:25:52'),
(1051, 12, 'has logged in the system at ', '2022-01-08 12:26:00'),
(1052, 12, 'has logged out the system at ', '2022-01-08 12:26:34'),
(1053, 8, 'has logged in the system at ', '2022-01-08 12:26:40'),
(1054, 8, 'has logged out the system at ', '2022-01-08 12:27:54'),
(1055, 12, 'has logged in the system at ', '2022-01-08 12:28:01'),
(1056, 12, 'has logged out the system at ', '2022-01-08 12:28:35'),
(1057, 12, 'has logged in the system at ', '2022-01-08 12:28:42'),
(1058, 8, 'has logged in the system at ', '2022-01-08 12:28:52'),
(1059, 8, 'has logged in the system at ', '2022-01-08 12:42:50'),
(1060, 8, 'has logged out the system at ', '2022-01-08 12:50:58'),
(1061, 12, 'has logged in the system at ', '2022-01-08 12:52:38'),
(1062, 12, 'has logged out the system at ', '2022-01-08 12:55:03'),
(1063, 8, 'has logged in the system at ', '2022-01-08 12:55:11'),
(1064, 12, 'has logged in the system at ', '2022-01-10 09:23:55'),
(1065, 12, 'has logged out the system at ', '2022-01-10 09:26:33'),
(1066, 13, 'has logged in the system at ', '2022-01-10 09:26:46'),
(1067, 13, 'has logged out the system at ', '2022-01-10 09:29:57'),
(1068, 12, 'has logged in the system at ', '2022-01-10 09:30:05'),
(1069, 13, 'has logged in the system at ', '2022-01-10 09:35:17'),
(1070, 13, 'has logged out the system at ', '2022-01-10 09:35:43'),
(1071, 12, 'has logged in the system at ', '2022-01-10 09:35:50'),
(1072, 12, 'has logged out the system at ', '2022-01-10 09:39:28'),
(1073, 13, 'has logged in the system at ', '2022-01-10 09:39:40'),
(1074, 13, 'has logged out the system at ', '2022-01-10 10:08:58'),
(1075, 0, 'has logged out the system at ', '2022-01-10 10:09:00'),
(1076, 12, 'has logged in the system at ', '2022-01-10 10:09:07'),
(1077, 12, 'has logged out the system at ', '2022-01-10 10:19:08'),
(1078, 13, 'has logged in the system at ', '2022-01-10 10:19:22'),
(1079, 13, 'has logged out the system at ', '2022-01-10 10:21:04'),
(1080, 12, 'has logged in the system at ', '2022-01-10 10:21:14'),
(1081, 12, 'has logged in the system at ', '2022-01-10 10:39:19'),
(1082, 12, 'has logged out the system at ', '2022-01-10 11:11:22'),
(1083, 8, 'has logged in the system at ', '2022-01-10 11:11:29'),
(1084, 8, 'has logged out the system at ', '2022-01-10 11:27:55'),
(1085, 12, 'has logged in the system at ', '2022-01-10 11:28:11'),
(1086, 12, 'has logged out the system at ', '2022-01-10 11:34:55'),
(1087, 8, 'has logged in the system at ', '2022-01-10 11:35:05'),
(1088, 8, 'has logged out the system at ', '2022-01-10 11:38:41'),
(1089, 12, 'has logged in the system at ', '2022-01-10 11:38:48'),
(1090, 12, 'has logged out the system at ', '2022-01-10 11:48:36'),
(1091, 13, 'has logged in the system at ', '2022-01-10 11:48:46'),
(1092, 13, 'has logged out the system at ', '2022-01-10 11:49:10'),
(1093, 12, 'has logged in the system at ', '2022-01-10 11:49:17'),
(1094, 12, 'has logged out the system at ', '2022-01-10 11:49:42'),
(1095, 13, 'has logged in the system at ', '2022-01-10 11:49:56'),
(1096, 13, 'has logged out the system at ', '2022-01-10 12:07:28'),
(1097, 12, 'has logged in the system at ', '2022-01-10 12:07:37'),
(1098, 12, 'has logged out the system at ', '2022-01-10 12:07:53'),
(1099, 13, 'has logged in the system at ', '2022-01-10 12:12:23'),
(1100, 13, 'has logged in the system at ', '2022-01-10 12:15:39'),
(1101, 13, 'has logged out the system at ', '2022-01-10 12:16:33'),
(1102, 12, 'has logged in the system at ', '2022-01-10 12:17:07'),
(1103, 12, 'has logged out the system at ', '2022-01-10 12:18:12'),
(1104, 13, 'has logged in the system at ', '2022-01-10 12:18:27'),
(1105, 13, 'has logged out the system at ', '2022-01-10 12:19:46'),
(1106, 12, 'has logged in the system at ', '2022-01-10 12:19:53'),
(1107, 12, 'has logged out the system at ', '2022-01-10 12:20:12'),
(1108, 13, 'has logged in the system at ', '2022-01-10 12:20:53'),
(1109, 12, 'has logged in the system at ', '2022-01-10 14:07:26'),
(1110, 4, 'has logged in the system at ', '2022-01-10 14:21:25'),
(1111, 4, 'has logged in the system at ', '2022-01-10 14:22:32'),
(1112, 4, 'has logged out the system at ', '2022-01-10 14:22:51'),
(1113, 13, 'has logged in the system at ', '2022-01-10 14:27:06'),
(1114, 4, 'has logged in the system at ', '2022-01-10 14:31:19'),
(1115, 4, 'has logged out the system at ', '2022-01-10 15:21:27'),
(1116, 8, 'has logged in the system at ', '2022-01-10 15:46:12'),
(1117, 8, 'has logged out the system at ', '2022-01-10 15:46:23'),
(1118, 12, 'has logged in the system at ', '2022-01-10 15:46:29'),
(1119, 12, 'has logged in the system at ', '2022-01-11 07:59:34'),
(1120, 12, 'has logged in the system at ', '2022-01-11 08:06:17'),
(1121, 12, 'has logged in the system at ', '2022-01-11 08:27:11'),
(1122, 12, 'has logged in the system at ', '2022-01-11 08:28:28'),
(1123, 12, 'has logged in the system at ', '2022-01-11 08:28:36'),
(1124, 12, 'has logged in the system at ', '2022-01-11 08:30:21'),
(1125, 12, 'has logged in the system at ', '2022-01-11 09:20:46'),
(1126, 12, 'has logged out the system at ', '2022-01-11 09:28:15'),
(1127, 14, 'has logged in the system at ', '2022-01-11 09:28:28'),
(1128, 12, 'has logged in the system at ', '2022-01-11 09:36:27'),
(1129, 12, 'has logged out the system at ', '2022-01-11 10:27:46'),
(1130, 13, 'has logged in the system at ', '2022-01-11 10:28:32'),
(1131, 13, 'has logged out the system at ', '2022-01-11 10:39:53'),
(1132, 12, 'has logged in the system at ', '2022-01-11 10:40:02'),
(1133, 12, 'has logged out the system at ', '2022-01-11 10:47:26'),
(1134, 14, 'has logged in the system at ', '2022-01-11 10:47:44'),
(1135, 14, 'has logged out the system at ', '2022-01-11 10:47:59'),
(1136, 13, 'has logged in the system at ', '2022-01-11 10:48:10'),
(1137, 12, 'has logged in the system at ', '2022-01-11 10:51:02'),
(1138, 13, 'has logged out the system at ', '2022-01-11 10:51:22'),
(1139, 12, 'has logged in the system at ', '2022-01-11 10:51:32'),
(1140, 12, 'has logged out the system at ', '2022-01-11 10:57:46'),
(1141, 13, 'has logged in the system at ', '2022-01-11 10:58:06'),
(1142, 13, 'has logged out the system at ', '2022-01-11 11:21:39'),
(1143, 12, 'has logged in the system at ', '2022-01-11 11:21:46'),
(1144, 12, 'has logged out the system at ', '2022-01-11 11:22:42'),
(1145, 13, 'has logged in the system at ', '2022-01-11 11:25:33'),
(1146, 13, 'has logged out the system at ', '2022-01-11 11:35:59'),
(1147, 12, 'has logged in the system at ', '2022-01-11 11:36:08'),
(1148, 12, 'has logged out the system at ', '2022-01-11 11:40:01'),
(1149, 13, 'has logged in the system at ', '2022-01-11 11:41:39'),
(1150, 13, 'has logged out the system at ', '2022-01-11 11:49:15'),
(1151, 12, 'has logged in the system at ', '2022-01-11 11:49:25'),
(1152, 12, 'has logged out the system at ', '2022-01-11 11:50:39'),
(1153, 8, 'has logged in the system at ', '2022-01-11 11:50:46'),
(1154, 8, 'has logged out the system at ', '2022-01-11 11:51:06'),
(1155, 13, 'has logged in the system at ', '2022-01-11 11:51:32'),
(1156, 13, 'has logged out the system at ', '2022-01-11 11:57:31'),
(1157, 12, 'has logged in the system at ', '2022-01-11 11:57:38'),
(1158, 12, 'has logged out the system at ', '2022-01-11 12:09:43'),
(1159, 8, 'has logged in the system at ', '2022-01-11 12:09:52'),
(1160, 8, 'has logged out the system at ', '2022-01-11 12:17:03'),
(1161, 13, 'has logged in the system at ', '2022-01-11 12:17:28'),
(1162, 13, 'has logged out the system at ', '2022-01-11 12:26:20'),
(1163, 12, 'has logged in the system at ', '2022-01-11 12:26:27'),
(1164, 12, 'has logged out the system at ', '2022-01-11 12:27:32'),
(1165, 14, 'has logged in the system at ', '2022-01-11 12:27:42'),
(1166, 14, 'has logged out the system at ', '2022-01-11 12:27:51'),
(1167, 13, 'has logged in the system at ', '2022-01-11 12:27:59'),
(1168, 13, 'has logged out the system at ', '2022-01-11 12:37:27'),
(1169, 4, 'has logged in the system at ', '2022-01-11 12:38:12'),
(1170, 4, 'has logged out the system at ', '2022-01-11 13:46:40'),
(1171, 12, 'has logged in the system at ', '2022-01-11 13:46:51'),
(1172, 12, 'has logged in the system at ', '2022-01-11 14:07:08'),
(1173, 12, 'has logged out the system at ', '2022-01-11 14:19:10'),
(1174, 14, 'has logged in the system at ', '2022-01-11 14:19:36'),
(1175, 14, 'has logged out the system at ', '2022-01-11 14:25:42'),
(1176, 14, 'has logged in the system at ', '2022-01-11 14:26:07'),
(1177, 14, 'has logged out the system at ', '2022-01-11 14:26:38'),
(1178, 13, 'has logged in the system at ', '2022-01-11 14:26:48'),
(1179, 4, 'has logged in the system at ', '2022-01-11 15:42:01'),
(1180, 4, 'has logged out the system at ', '2022-01-11 16:01:53'),
(1181, 13, 'has logged out the system at ', '2022-01-11 16:18:58'),
(1182, 14, 'has logged in the system at ', '2022-01-11 16:19:54'),
(1183, 12, 'has logged in the system at ', '2022-01-12 06:59:32'),
(1184, 14, 'has logged in the system at ', '2022-01-12 08:00:19'),
(1185, 14, 'has logged in the system at ', '2022-01-12 09:09:47'),
(1186, 14, 'has logged in the system at ', '2022-01-12 11:30:59'),
(1187, 14, 'has logged in the system at ', '2022-01-12 11:58:41'),
(1188, 14, 'has logged out the system at ', '2022-01-12 12:01:39'),
(1189, 13, 'has logged in the system at ', '2022-01-12 12:01:52'),
(1190, 8, 'has logged in the system at ', '2022-01-13 08:31:02'),
(1191, 8, 'has logged in the system at ', '2022-01-13 08:45:17'),
(1192, 14, 'has logged in the system at ', '2022-01-13 10:02:43'),
(1193, 8, 'has logged out the system at ', '2022-01-13 10:05:30'),
(1194, 12, 'has logged in the system at ', '2022-01-13 10:05:37'),
(1195, 12, 'has logged out the system at ', '2022-01-13 10:13:45'),
(1196, 8, 'has logged in the system at ', '2022-01-13 10:13:53'),
(1197, 8, 'has logged in the system at ', '2022-01-13 10:35:22'),
(1198, 8, 'has logged out the system at ', '2022-01-13 11:32:49'),
(1199, 12, 'has logged in the system at ', '2022-01-13 11:32:56'),
(1200, 12, 'has logged out the system at ', '2022-01-13 11:33:55'),
(1201, 12, 'has logged in the system at ', '2022-01-13 11:34:02'),
(1202, 12, 'has logged out the system at ', '2022-01-13 11:34:07'),
(1203, 8, 'has logged in the system at ', '2022-01-13 11:34:17'),
(1204, 8, 'has logged in the system at ', '2022-01-13 14:01:15'),
(1205, 8, 'has logged in the system at ', '2022-01-13 16:46:49'),
(1206, 8, 'has logged in the system at ', '2022-01-13 17:35:27'),
(1207, 12, 'has logged in the system at ', '2022-01-13 18:06:05'),
(1208, 12, 'has logged out the system at ', '2022-01-13 18:07:48'),
(1209, 12, 'has logged in the system at ', '2022-01-13 18:07:54'),
(1210, 12, 'has logged out the system at ', '2022-01-13 18:13:49'),
(1211, 4, 'has logged in the system at ', '2022-01-14 08:09:28'),
(1212, 12, 'has logged in the system at ', '2022-01-14 08:20:56'),
(1213, 12, 'has logged out the system at ', '2022-01-14 08:21:02'),
(1214, 12, 'has logged in the system at ', '2022-01-14 08:21:11'),
(1215, 12, 'has logged out the system at ', '2022-01-14 08:21:22'),
(1216, 8, 'has logged in the system at ', '2022-01-14 08:21:59'),
(1217, 4, 'has logged out the system at ', '2022-01-14 08:27:16'),
(1218, 13, 'has logged in the system at ', '2022-01-14 08:58:30'),
(1219, 13, 'has logged out the system at ', '2022-01-14 09:00:06'),
(1220, 14, 'has logged in the system at ', '2022-01-14 09:00:20'),
(1221, 14, 'has logged out the system at ', '2022-01-14 09:11:42'),
(1222, 13, 'has logged in the system at ', '2022-01-14 09:22:21'),
(1223, 13, 'has logged out the system at ', '2022-01-14 09:23:40'),
(1224, 14, 'has logged in the system at ', '2022-01-14 09:23:50'),
(1225, 14, 'has logged out the system at ', '2022-01-14 09:25:29'),
(1226, 13, 'has logged in the system at ', '2022-01-14 09:25:41'),
(1227, 13, 'has logged out the system at ', '2022-01-14 10:01:43'),
(1228, 8, 'has logged in the system at ', '2022-01-15 12:03:03'),
(1229, 12, 'has logged in the system at ', '2022-01-17 08:05:09'),
(1230, 4, 'has logged in the system at ', '2022-01-17 08:27:44'),
(1231, 4, 'has logged in the system at ', '2022-01-17 08:32:03'),
(1232, 4, 'has logged in the system at ', '2022-01-17 08:34:44'),
(1233, 12, 'has logged in the system at ', '2022-01-17 09:09:37'),
(1234, 12, 'has logged in the system at ', '2022-01-17 09:23:10'),
(1235, 13, 'has logged in the system at ', '2022-01-17 10:17:18'),
(1236, 12, 'has logged in the system at ', '2022-01-17 10:23:29'),
(1237, 12, 'has logged out the system at ', '2022-01-17 10:26:04'),
(1238, 8, 'has logged in the system at ', '2022-01-17 10:26:11'),
(1239, 13, 'has logged out the system at ', '2022-01-17 10:26:48'),
(1240, 4, 'has logged in the system at ', '2022-01-17 10:29:20'),
(1241, 13, 'has logged in the system at ', '2022-01-17 10:30:25'),
(1242, 4, 'has logged out the system at ', '2022-01-17 10:33:41'),
(1243, 12, 'has logged out the system at ', '2022-01-17 10:41:03'),
(1244, 8, 'has logged in the system at ', '2022-01-17 10:41:10'),
(1245, 12, 'has logged in the system at ', '2022-01-17 10:41:58'),
(1246, 12, 'has logged in the system at ', '2022-01-17 11:09:57'),
(1247, 4, 'has logged in the system at ', '2022-01-17 11:13:59'),
(1248, 4, 'has logged in the system at ', '2022-01-17 11:33:09'),
(1249, 12, 'has logged out the system at ', '2022-01-17 11:35:29'),
(1250, 14, 'has logged in the system at ', '2022-01-17 11:35:43'),
(1251, 8, 'has logged in the system at ', '2022-01-17 11:50:22'),
(1252, 8, 'has logged out the system at ', '2022-01-17 11:51:21'),
(1253, 13, 'has logged in the system at ', '2022-01-17 11:59:51'),
(1254, 0, 'has logged out the system at ', '2022-01-17 11:59:55'),
(1255, 13, 'has logged out the system at ', '2022-01-17 12:03:35'),
(1256, 12, 'has logged in the system at ', '2022-01-17 12:03:50'),
(1257, 12, 'has logged in the system at ', '2022-01-17 12:04:34'),
(1258, 12, 'has logged out the system at ', '2022-01-17 12:05:06'),
(1259, 12, 'has logged in the system at ', '2022-01-17 12:05:11'),
(1260, 12, 'has logged out the system at ', '2022-01-17 12:05:31'),
(1261, 13, 'has logged in the system at ', '2022-01-17 12:05:59'),
(1262, 13, 'has logged out the system at ', '2022-01-17 12:12:10'),
(1263, 14, 'has logged in the system at ', '2022-01-17 12:12:20'),
(1264, 14, 'has logged out the system at ', '2022-01-17 12:26:58'),
(1265, 13, 'has logged in the system at ', '2022-01-17 12:27:39'),
(1266, 13, 'has logged out the system at ', '2022-01-17 13:06:42'),
(1267, 13, 'has logged in the system at ', '2022-01-17 13:06:55'),
(1268, 13, 'has logged out the system at ', '2022-01-17 13:07:02'),
(1269, 14, 'has logged in the system at ', '2022-01-17 13:07:12'),
(1270, 14, 'has logged out the system at ', '2022-01-17 13:15:17'),
(1271, 13, 'has logged in the system at ', '2022-01-17 13:16:34'),
(1272, 13, 'has logged out the system at ', '2022-01-17 13:21:25'),
(1273, 12, 'has logged in the system at ', '2022-01-17 13:21:37'),
(1274, 12, 'has logged out the system at ', '2022-01-17 13:22:48'),
(1275, 13, 'has logged in the system at ', '2022-01-17 13:22:57'),
(1276, 13, 'has logged out the system at ', '2022-01-17 13:27:13'),
(1277, 12, 'has logged in the system at ', '2022-01-17 13:27:20'),
(1278, 12, 'has logged out the system at ', '2022-01-17 13:29:12'),
(1279, 12, 'has logged in the system at ', '2022-01-17 13:29:23'),
(1280, 12, 'has logged out the system at ', '2022-01-17 13:29:26'),
(1281, 13, 'has logged in the system at ', '2022-01-17 13:29:41'),
(1282, 13, 'has logged out the system at ', '2022-01-17 13:32:11'),
(1283, 12, 'has logged in the system at ', '2022-01-17 13:32:20'),
(1284, 12, 'has logged out the system at ', '2022-01-17 13:36:21'),
(1285, 13, 'has logged in the system at ', '2022-01-17 13:36:39'),
(1286, 13, 'has logged in the system at ', '2022-01-17 14:29:37'),
(1287, 13, 'has logged out the system at ', '2022-01-17 14:55:27'),
(1288, 12, 'has logged in the system at ', '2022-01-17 14:55:35'),
(1289, 12, 'has logged out the system at ', '2022-01-17 14:57:59'),
(1290, 13, 'has logged in the system at ', '2022-01-17 14:58:11'),
(1291, 12, 'has logged in the system at ', '2022-01-17 15:12:10'),
(1292, 12, 'has logged out the system at ', '2022-01-17 16:06:16'),
(1293, 0, 'has logged out the system at ', '2022-01-17 16:46:10'),
(1294, 12, 'has logged in the system at ', '2022-01-17 16:46:17'),
(1295, 4, 'has logged in the system at ', '2022-01-18 07:57:57'),
(1296, 4, 'has logged out the system at ', '2022-01-18 08:04:05'),
(1297, 13, 'has logged in the system at ', '2022-01-18 09:41:27'),
(1298, 13, 'has logged in the system at ', '2022-01-18 10:04:10'),
(1299, 8, 'has logged in the system at ', '2022-01-18 10:20:44'),
(1300, 13, 'has logged in the system at ', '2022-01-18 10:39:57'),
(1301, 13, 'has logged in the system at ', '2022-01-18 10:44:43'),
(1302, 8, 'has logged in the system at ', '2022-01-18 10:53:17'),
(1303, 13, 'has logged in the system at ', '2022-01-18 11:11:11'),
(1304, 8, 'has logged in the system at ', '2022-01-18 11:50:48'),
(1305, 8, 'has logged out the system at ', '2022-01-18 11:51:17'),
(1306, 13, 'has logged out the system at ', '2022-01-18 12:05:30'),
(1307, 14, 'has logged in the system at ', '2022-01-18 12:05:46'),
(1308, 14, 'has logged out the system at ', '2022-01-18 12:08:23'),
(1309, 13, 'has logged in the system at ', '2022-01-18 12:08:43'),
(1310, 13, 'has logged in the system at ', '2022-01-18 14:30:25'),
(1311, 8, 'has logged in the system at ', '2022-01-18 15:25:36'),
(1312, 8, 'has logged out the system at ', '2022-01-18 15:25:49'),
(1313, 12, 'has logged in the system at ', '2022-01-18 15:25:55'),
(1314, 12, 'has logged in the system at ', '2022-01-18 15:30:09'),
(1315, 14, 'has logged in the system at ', '2022-01-18 15:54:45'),
(1316, 4, 'has logged in the system at ', '2022-01-19 08:45:02'),
(1317, 4, 'has logged in the system at ', '2022-01-19 10:38:57'),
(1318, 4, 'has logged in the system at ', '2022-01-19 10:46:55'),
(1319, 12, 'has logged in the system at ', '2022-01-19 11:01:35'),
(1320, 12, 'has logged in the system at ', '2022-01-19 11:02:16'),
(1321, 12, 'has logged in the system at ', '2022-01-19 14:05:54'),
(1322, 14, 'has logged in the system at ', '2022-01-19 14:11:59'),
(1323, 12, 'has logged out the system at ', '2022-01-19 14:14:14'),
(1324, 12, 'has logged in the system at ', '2022-01-19 14:15:26'),
(1325, 4, 'has logged in the system at ', '2022-01-19 14:19:38'),
(1326, 4, 'has logged out the system at ', '2022-01-19 14:26:15'),
(1327, 14, 'has logged in the system at ', '2022-01-19 14:32:52'),
(1328, 8, 'has logged out the system at ', '2022-01-20 14:08:22'),
(1329, 12, 'has logged in the system at ', '2022-01-20 14:08:27'),
(1330, 4, 'has logged in the system at ', '2022-01-20 14:50:32'),
(1331, 4, 'has logged in the system at ', '2022-01-20 15:13:45'),
(1332, 12, 'has logged in the system at ', '2022-01-20 15:14:32'),
(1333, 4, 'has logged in the system at ', '2022-01-20 15:22:11'),
(1334, 14, 'has logged in the system at ', '2022-01-20 15:31:01'),
(1335, 4, 'has logged in the system at ', '2022-01-20 15:46:44'),
(1336, 4, 'has logged in the system at ', '2022-01-20 15:48:19'),
(1337, 4, 'has logged in the system at ', '2022-01-20 16:08:12'),
(1338, 4, 'has logged in the system at ', '2022-01-20 16:24:31'),
(1339, 4, 'has logged out the system at ', '2022-01-20 16:34:20'),
(1340, 4, 'has logged in the system at ', '2022-01-20 16:59:08'),
(1341, 4, 'has logged out the system at ', '2022-01-20 17:05:59'),
(1342, 4, 'has logged in the system at ', '2022-01-21 08:59:22'),
(1343, 8, 'has logged out the system at ', '2022-01-21 09:31:52'),
(1344, 4, 'has logged out the system at ', '2022-01-21 10:03:48'),
(1345, 12, 'has logged in the system at ', '2022-01-21 10:26:07'),
(1346, 4, 'has logged in the system at ', '2022-01-21 11:17:59'),
(1347, 4, 'has logged out the system at ', '2022-01-21 11:49:23'),
(1348, 13, 'has logged out the system at ', '2022-01-21 16:28:35'),
(1349, 14, 'has logged in the system at ', '2022-01-21 16:28:44'),
(1350, 12, 'has logged in the system at ', '2022-01-25 15:05:02'),
(1351, 13, 'has logged out the system at ', '2022-01-26 10:37:48'),
(1352, 14, 'has logged in the system at ', '2022-01-26 10:37:58'),
(1353, 14, 'has logged out the system at ', '2022-01-26 10:46:02'),
(1354, 13, 'has logged out the system at ', '2022-01-26 11:08:21'),
(1355, 14, 'has logged in the system at ', '2022-01-26 11:08:52'),
(1356, 14, 'has logged out the system at ', '2022-01-26 11:11:10'),
(1357, 4, 'has logged in the system at ', '2022-01-26 14:19:18'),
(1358, 4, 'has logged out the system at ', '2022-01-26 14:20:05'),
(1359, 13, 'has logged out the system at ', '2022-01-26 15:07:31'),
(1360, 13, 'has logged out the system at ', '2022-01-26 15:08:33'),
(1361, 14, 'has logged in the system at ', '2022-01-26 15:08:50'),
(1362, 14, 'has logged out the system at ', '2022-01-26 15:10:04'),
(1363, 14, 'has logged in the system at ', '2022-01-28 10:23:53'),
(1364, 12, 'has logged in the system at ', '2022-01-28 10:28:59'),
(1365, 12, 'has logged in the system at ', '2022-01-28 10:32:07'),
(1366, 12, 'has logged in the system at ', '2022-01-28 10:38:26'),
(1367, 12, 'has logged in the system at ', '2022-01-28 10:38:31'),
(1368, 12, 'has logged in the system at ', '2022-01-28 10:39:29'),
(1369, 12, 'has logged out the system at ', '2022-01-28 10:47:27'),
(1370, 14, 'has logged in the system at ', '2022-01-28 10:47:39'),
(1371, 12, 'has logged in the system at ', '2022-01-28 10:48:04'),
(1372, 14, 'has logged in the system at ', '2022-01-28 11:20:23'),
(1373, 14, 'has logged in the system at ', '2022-01-28 11:25:07'),
(1374, 12, 'has logged in the system at ', '2022-01-28 11:28:10'),
(1375, 14, 'has logged in the system at ', '2022-01-28 11:30:09'),
(1376, 12, 'has logged in the system at ', '2022-01-28 11:31:05'),
(1377, 12, 'has logged out the system at ', '2022-01-28 11:36:53'),
(1378, 14, 'has logged in the system at ', '2022-01-28 11:37:05'),
(1379, 14, 'has logged out the system at ', '2022-01-28 11:37:48'),
(1380, 13, 'has logged out the system at ', '2022-01-28 11:39:57'),
(1381, 14, 'has logged in the system at ', '2022-01-28 11:40:07'),
(1382, 14, 'has logged in the system at ', '2022-01-28 14:31:00'),
(1383, 14, 'has logged in the system at ', '2022-01-28 14:37:43'),
(1384, 14, 'has logged out the system at ', '2022-01-28 14:45:37'),
(1385, 14, 'has logged in the system at ', '2022-01-28 15:16:07'),
(1386, 14, 'has logged in the system at ', '2022-01-28 15:20:24'),
(1387, 14, 'has logged out the system at ', '2022-01-28 15:21:05'),
(1388, 14, 'has logged in the system at ', '2022-01-28 15:21:25'),
(1389, 14, 'has logged in the system at ', '2022-01-28 15:22:25'),
(1390, 14, 'has logged in the system at ', '2022-01-28 15:57:31'),
(1391, 14, 'has logged in the system at ', '2022-01-28 15:57:57'),
(1392, 14, 'has logged out the system at ', '2022-01-28 15:58:09'),
(1393, 12, 'has logged in the system at ', '2022-02-01 11:10:07'),
(1394, 14, 'has logged in the system at ', '2022-02-02 13:54:55'),
(1395, 12, 'has logged in the system at ', '2022-02-02 15:03:55'),
(1396, 14, 'has logged in the system at ', '2022-02-03 15:55:26'),
(1397, 12, 'has logged in the system at ', '2022-05-25 17:10:07'),
(1398, 12, 'has logged in the system at ', '2022-06-03 08:25:13'),
(1399, 12, 'has logged out the system at ', '2022-06-03 09:07:58'),
(1400, 12, 'has logged in the system at ', '2022-06-09 14:02:42'),
(1401, 12, 'has logged out the system at ', '2022-06-09 14:05:46'),
(1402, 12, 'has logged in the system at ', '2022-06-29 15:27:15'),
(1403, 12, 'has logged in the system at ', '2022-07-09 12:17:53'),
(1404, 12, 'has logged in the system at ', '2022-07-09 12:51:22'),
(1405, 12, 'has logged in the system at ', '2022-07-09 13:19:31'),
(1406, 12, 'has logged in the system at ', '2022-07-25 11:12:34'),
(1407, 12, 'has logged out the system at ', '2022-07-25 11:12:51'),
(1408, 12, 'has logged in the system at ', '2022-07-26 15:37:55'),
(1409, 12, 'has logged in the system at ', '2022-07-26 15:46:34'),
(1410, 12, 'has logged in the system at ', '2022-08-31 08:43:15'),
(1411, 12, 'has logged out the system at ', '2022-08-31 08:43:23'),
(1412, 12, 'has logged in the system at ', '2022-08-31 08:43:27'),
(1413, 12, 'has logged in the system at ', '2022-09-08 14:35:03'),
(1414, 12, 'has logged out the system at ', '2022-09-08 14:37:05'),
(1415, 8, 'has logged out the system at ', '2022-09-08 15:34:58'),
(1416, 12, 'has logged in the system at ', '2022-09-13 11:50:38'),
(1417, 21, 'has logged out the system at ', '2022-09-13 12:07:43'),
(1418, 12, 'has logged in the system at ', '2022-09-24 21:28:37'),
(1419, 12, 'has logged out the system at ', '2022-09-24 21:39:13'),
(1420, 8, 'has logged out the system at ', '2022-09-24 21:45:18'),
(1421, 0, 'has logged out the system at ', '2022-10-07 13:58:27'),
(1422, 12, 'has logged in the system at ', '2022-10-25 12:08:25'),
(1423, 8, 'has logged out the system at ', '2022-11-15 09:31:07'),
(1424, 12, 'has logged in the system at ', '2022-11-15 09:31:16'),
(1425, 12, 'has logged in the system at ', '2022-11-16 11:47:28'),
(1426, 12, 'has logged out the system at ', '2022-11-16 12:10:14'),
(1427, 8, 'has logged out the system at ', '2022-11-16 12:32:28'),
(1428, 12, 'has logged in the system at ', '2022-11-16 12:33:06'),
(1429, 12, 'has logged out the system at ', '2022-11-16 12:34:16'),
(1430, 8, 'has logged out the system at ', '2022-11-16 15:01:20'),
(1431, 12, 'has logged in the system at ', '2022-11-16 15:01:27'),
(1432, 12, 'has logged out the system at ', '2022-11-16 15:02:18'),
(1433, 12, 'has logged in the system at ', '2022-11-16 15:19:20'),
(1434, 12, 'has logged out the system at ', '2022-11-16 15:22:45'),
(1435, 8, 'has logged out the system at ', '2022-11-17 11:36:23'),
(1436, 12, 'has logged in the system at ', '2022-11-17 11:36:35'),
(1437, 12, 'has logged out the system at ', '2022-11-17 12:51:55'),
(1438, 8, 'has logged out the system at ', '2022-11-17 13:09:51'),
(1439, 12, 'has logged in the system at ', '2022-11-17 13:09:59'),
(1440, 12, 'has logged out the system at ', '2022-11-17 13:57:46'),
(1441, 8, 'has logged out the system at ', '2022-11-17 13:58:42'),
(1442, 12, 'has logged in the system at ', '2022-11-17 13:58:48'),
(1443, 12, 'has logged out the system at ', '2022-11-17 14:08:58'),
(1444, 8, 'has logged out the system at ', '2022-11-17 14:12:21'),
(1445, 12, 'has logged in the system at ', '2022-11-17 14:12:33'),
(1446, 12, 'has logged out the system at ', '2022-11-17 14:15:13'),
(1447, 8, 'has logged out the system at ', '2022-11-17 15:17:09'),
(1448, 12, 'has logged in the system at ', '2022-11-17 15:17:16'),
(1449, 8, 'has logged out the system at ', '2022-11-18 09:42:21'),
(1450, 12, 'has logged in the system at ', '2022-11-18 09:42:29'),
(1451, 12, 'has logged in the system at ', '2022-11-19 07:48:17'),
(1452, 12, 'has logged in the system at ', '2022-11-19 14:50:03'),
(1453, 12, 'has logged out the system at ', '2022-11-19 15:47:28'),
(1454, 8, 'has logged out the system at ', '2022-11-19 15:48:46'),
(1455, 12, 'has logged in the system at ', '2022-11-19 15:48:54'),
(1456, 12, 'has logged in the system at ', '2023-01-20 18:27:32'),
(1457, 12, 'has logged in the system at ', '2023-07-17 11:33:22'),
(1458, 12, 'has logged out the system at ', '2023-07-17 11:33:27'),
(1459, 12, 'has logged in the system at ', '2023-07-17 11:33:30'),
(1460, 12, 'has logged in the system at ', '2023-08-10 09:41:47'),
(1461, 8, 'has logged out the system at ', '2023-08-11 16:28:48'),
(1462, 12, 'has logged in the system at ', '2023-08-11 16:28:53'),
(1463, 12, 'has logged in the system at ', '2023-08-12 09:36:08'),
(1464, 12, 'has logged in the system at ', '2023-08-12 12:07:39'),
(1465, 12, 'has logged in the system at ', '2023-08-13 18:45:35'),
(1466, 12, 'has logged in the system at ', '2023-08-14 09:00:44'),
(1467, 12, 'has logged in the system at ', '2023-08-14 09:44:37'),
(1468, 12, 'has logged in the system at ', '2023-08-21 20:58:51'),
(1469, 12, 'has logged in the system at ', '2023-08-24 09:30:52'),
(1470, 12, 'has logged in the system at ', '2023-08-29 14:09:36'),
(1471, 12, 'has logged in the system at ', '2023-08-30 16:03:34'),
(1472, 12, 'has logged out the system at ', '2023-08-31 08:27:51'),
(1473, 12, 'has logged in the system at ', '2023-09-01 08:48:12'),
(1474, 12, 'has logged out the system at ', '2023-09-01 10:47:27'),
(1475, 12, 'has logged in the system at ', '2023-09-02 10:01:24'),
(1476, 12, 'has logged in the system at ', '2023-09-04 16:38:47'),
(1477, 8, 'has logged out the system at ', '2023-09-05 11:51:14'),
(1478, 8, 'has logged out the system at ', '2023-09-05 11:51:38'),
(1479, 8, 'has logged out the system at ', '2023-09-05 11:51:54'),
(1480, 8, 'has logged out the system at ', '2023-09-05 12:00:13'),
(1481, 8, 'has logged out the system at ', '2023-09-05 13:41:39'),
(1482, 8, 'has logged out the system at ', '2023-09-05 22:45:13'),
(1483, 8, 'has logged out the system at ', '2023-10-05 19:21:51'),
(1484, 12, 'has logged in the system at ', '2023-10-05 19:21:58'),
(1485, 12, 'has logged out the system at ', '2023-10-05 19:43:51'),
(1486, 8, 'has logged out the system at ', '2023-10-05 19:44:06'),
(1487, 12, 'has logged in the system at ', '2023-10-05 19:44:17'),
(1488, 12, 'has logged in the system at ', '2023-10-07 08:51:09'),
(1489, 8, 'has logged out the system at ', '2023-10-09 10:45:08'),
(1490, 12, 'has logged in the system at ', '2023-10-09 10:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_tb`
--

CREATE TABLE IF NOT EXISTS `inventory_tb` (
  `id` int(12) NOT NULL,
  `name` text NOT NULL,
  `quantity` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_tb`
--

INSERT INTO `inventory_tb` (`id`, `name`, `quantity`, `date_added`, `added_by`) VALUES
(1, 'Moringa Tea (Bulk per KG)', 13560, '2022-01-20 13:54:09', 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoices_tb`
--

CREATE TABLE IF NOT EXISTS `invoices_tb` (
  `id` int(12) NOT NULL,
  `order_no` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5248 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices_tb`
--

INSERT INTO `invoices_tb` (`id`, `order_no`) VALUES
(1, 3898),
(2, 4560),
(3, 4512),
(4, 348),
(5, 778),
(6, 2490),
(7, 4896),
(8, 4666),
(9, 1499),
(10, 1201),
(11, 963),
(12, 3641),
(13, 3394),
(14, 2605),
(15, 3131),
(16, 4156),
(17, 969),
(18, 597),
(19, 2036),
(20, 2593),
(21, 4654),
(22, 3233),
(23, 2619),
(24, 2276),
(25, 103),
(26, 4506),
(27, 1683),
(28, 3864),
(29, 4763),
(30, 4688),
(31, 1206),
(32, 582),
(33, 3815),
(34, 3979),
(35, 326),
(36, 728),
(37, 874),
(38, 971),
(39, 3626),
(40, 263),
(41, 2302),
(42, 3113),
(43, 3151),
(44, 4321),
(45, 2197),
(4979, 4979),
(4981, 2365),
(4982, 4333),
(4983, 3129),
(4984, 2698),
(4985, 983),
(4986, 3955),
(4987, 2597),
(4988, 1451),
(4989, 908),
(4990, 3752),
(4991, 4545),
(4992, 1170),
(4993, 2604),
(4994, 4307),
(4995, 2942),
(4996, 2358),
(4997, 799),
(4998, 100),
(4999, 3096),
(5000, 2789),
(5001, 3041),
(5002, 3611),
(5003, 118),
(5004, 4442),
(5005, 237),
(5006, 4378),
(5007, 568),
(5008, 3733),
(5009, 1353),
(5010, 4957),
(5011, 235),
(5012, 258),
(5013, 130),
(5014, 2832),
(5015, 1724),
(5016, 499),
(5017, 3185),
(5018, 1410),
(5019, 2717),
(5020, 3456),
(5021, 1434),
(5022, 3040),
(5023, 3210),
(5024, 4222),
(5025, 3598),
(5026, 4414),
(5027, 3143),
(5028, 3048),
(5029, 2874),
(5030, 491),
(5031, 3170),
(5032, 580),
(5033, 3344),
(5034, 1366),
(5035, 3424),
(5036, 3312),
(5037, 996),
(5038, 3545),
(5039, 3895),
(5040, 4289),
(5041, 3296),
(5042, 1212),
(5043, 4974),
(5044, 2875),
(5045, 1610),
(5046, 4145),
(5047, 4335),
(5048, 3013),
(5049, 4599),
(5050, 4358),
(5051, 4728),
(5052, 478),
(5053, 3048),
(5054, 2735),
(5055, 2800),
(5056, 3761),
(5057, 133),
(5058, 1509),
(5059, 2939),
(5060, 2709),
(5061, 2696),
(5062, 2941),
(5063, 1238),
(5064, 1610),
(5065, 1027),
(5066, 2019),
(5067, 3408),
(5068, 1985),
(5069, 4745),
(5070, 1282),
(5071, 1476),
(5072, 373),
(5073, 623),
(5074, 1760),
(5075, 4496),
(5076, 3749),
(5077, 3002),
(5078, 4166),
(5079, 3872),
(5080, 593),
(5081, 554),
(5082, 1542),
(5083, 4809),
(5084, 921),
(5085, 2521),
(5086, 2173),
(5087, 4816),
(5088, 4481),
(5089, 1331),
(5090, 3503),
(5091, 3308),
(5092, 3681),
(5093, 2492),
(5094, 4607),
(5095, 4757),
(5096, 4835),
(5097, 236),
(5098, 2524),
(5099, 4963),
(5100, 2879),
(5101, 291),
(5102, 1593),
(5103, 2738),
(5104, 2570),
(5105, 871),
(5106, 3938),
(5107, 2389),
(5108, 3991),
(5109, 3057),
(5110, 3835),
(5111, 2985),
(5112, 3587),
(5113, 2032),
(5114, 3696),
(5115, 1819),
(5116, 989),
(5117, 2147),
(5118, 1461),
(5119, 4166),
(5120, 4241),
(5121, 2231),
(5122, 1778),
(5123, 1274),
(5124, 3000),
(5125, 1556),
(5126, 2016),
(5127, 411),
(5128, 2288),
(5129, 1762),
(5130, 1689),
(5131, 1534),
(5132, 2861),
(5133, 2647),
(5134, 2783),
(5135, 3001),
(5136, 2520),
(5137, 3702),
(5138, 1346),
(5139, 691),
(5140, 390),
(5141, 723),
(5142, 85),
(5143, 3137),
(5144, 3539),
(5145, 1842),
(5146, 2903),
(5147, 2169),
(5148, 2909),
(5149, 4884),
(5150, 2491),
(5151, 4362),
(5152, 74),
(5153, 3794),
(5154, 2248),
(5155, 1347),
(5156, 1901),
(5157, 1481),
(5158, 2511),
(5159, 2930),
(5160, 4440),
(5161, 883),
(5162, 3823),
(5163, 4911),
(5164, 4814),
(5165, 624),
(5166, 839),
(5167, 4523),
(5168, 195),
(5169, 2484),
(5170, 3599),
(5171, 3993),
(5172, 4983),
(5173, 4281),
(5174, 3607),
(5175, 2820),
(5176, 2439),
(5177, 2619),
(5178, 1229),
(5179, 4768),
(5180, 1762),
(5181, 3163),
(5182, 1769),
(5183, 4599),
(5184, 1058),
(5185, 2753),
(5186, 2724),
(5187, 2733),
(5188, 2115),
(5189, 3656),
(5190, 3108),
(5191, 1373),
(5192, 3046),
(5193, 2108),
(5194, 1581),
(5195, 3606),
(5196, 2673),
(5197, 1080),
(5198, 2770),
(5199, 4297),
(5200, 4051),
(5201, 847),
(5202, 2411),
(5203, 670),
(5204, 2604),
(5205, 830),
(5206, 4243),
(5207, 239),
(5208, 4568),
(5209, 300),
(5210, 395),
(5211, 1494),
(5212, 3220),
(5213, 2027),
(5214, 182),
(5215, 2792),
(5216, 4996),
(5217, 2205),
(5218, 917),
(5219, 2810),
(5220, 373),
(5221, 4729),
(5222, 1839),
(5223, 2595),
(5224, 3926),
(5225, 3958),
(5226, 2714),
(5227, 4005),
(5228, 355),
(5229, 1332),
(5230, 2907),
(5231, 891),
(5232, 4205),
(5233, 4584),
(5234, 4671),
(5235, 3963),
(5236, 5000),
(5237, 1600),
(5238, 1849),
(5239, 3271),
(5240, 2813),
(5241, 4560),
(5242, 1793),
(5243, 763),
(5244, 4704),
(5245, 1320),
(5246, 4719),
(5247, 709);

-- --------------------------------------------------------

--
-- Table structure for table `inv_damages_tb`
--

CREATE TABLE IF NOT EXISTS `inv_damages_tb` (
  `id` int(12) NOT NULL,
  `inv_id` int(12) NOT NULL,
  `quantity` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_returns_tb`
--

CREATE TABLE IF NOT EXISTS `item_returns_tb` (
  `tb_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `return_date` date NOT NULL,
  `return_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `licience_reg_tb`
--

CREATE TABLE IF NOT EXISTS `licience_reg_tb` (
  `id` int(12) NOT NULL,
  `exp_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `licience_key` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `licience_reg_tb`
--

INSERT INTO `licience_reg_tb` (`id`, `exp_date`, `licience_key`) VALUES
(1, '2024-01-19 22:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `modes_of_payment_tb`
--

CREATE TABLE IF NOT EXISTS `modes_of_payment_tb` (
  `payment_mode_id` int(12) NOT NULL,
  `name` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modes_of_payment_tb`
--

INSERT INTO `modes_of_payment_tb` (`payment_mode_id`, `name`, `date`, `date_added`) VALUES
(1, 'Cash', '2019-11-03 16:29:35', '0000-00-00 00:00:00'),
(3, 'MTN Mobile Money', '2019-11-03 16:40:42', '0000-00-00 00:00:00'),
(5, 'Cheque', '2020-12-15 15:40:14', '0000-00-00 00:00:00'),
(6, 'EFT', '2020-12-15 15:41:17', '0000-00-00 00:00:00'),
(7, 'Airtel Mobile Money', '2020-12-15 15:42:12', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_settings_tb`
--

CREATE TABLE IF NOT EXISTS `notifications_settings_tb` (
  `id` int(12) NOT NULL,
  `not_count` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `open_close_cashout_tb`
--

CREATE TABLE IF NOT EXISTS `open_close_cashout_tb` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `login` text NOT NULL,
  `logout` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `open_close_cashout_tb`
--

INSERT INTO `open_close_cashout_tb` (`id`, `user_id`, `login`, `logout`, `status`) VALUES
(1, 8, '2019-08-17 13:14:24', '2019-08-22 13:26:44', 'closed'),
(2, 8, '2019-08-22 13:41:40', '2019-08-22 14:49:26', 'closed'),
(3, 8, '2019-08-22 15:34:41', '2019-08-22 15:34:55', 'closed'),
(4, 8, '2019-08-25 14:15:36', '2019-09-03 09:46:31', 'closed'),
(5, 8, '2019-09-03 11:47:28', '2019-09-04 18:42:00', 'closed'),
(6, 8, '2019-09-04 18:42:36', '2019-09-06 08:13:55', 'closed'),
(7, 8, '2019-09-06 08:14:30', '2019-09-06 08:55:26', 'closed'),
(8, 8, '2019-09-06 08:56:58', '2019-09-06 09:06:41', 'closed'),
(9, 8, '2019-09-06 16:03:33', '2019-09-06 17:01:39', 'closed'),
(10, 8, '2019-09-06 17:01:59', '2019-09-06 22:26:50', 'closed'),
(11, 8, '2019-09-06 22:26:58', '2019-09-12 10:21:13', 'closed'),
(12, 8, '2019-09-12 12:10:25', '2019-09-30 17:51:56', 'closed'),
(13, 8, '2019-09-30 18:08:43', '2019-09-30 19:03:04', 'closed'),
(14, 8, '2019-09-30 19:04:34', '2019-09-30 19:13:44', 'closed'),
(15, 8, '2019-09-30 19:25:36', '2019-10-08 10:41:48', 'closed'),
(16, 8, '2019-10-08 10:54:28', '2019-10-09 09:01:08', 'closed'),
(17, 8, '2019-10-09 09:01:56', '2019-10-11 14:44:33', 'closed'),
(18, 8, '2019-10-11 14:45:23', '2019-10-11 14:53:35', 'closed'),
(19, 8, '2019-10-11 15:01:31', '2019-10-14 21:42:50', 'closed'),
(20, 8, '2019-10-14 21:57:13', '2019-10-15 17:57:44', 'closed'),
(21, 8, '2019-10-15 18:05:56', '2019-10-15 18:06:10', 'closed'),
(22, 8, '2019-10-15 18:11:08', '2019-10-15 18:11:21', 'closed'),
(23, 8, '2019-10-16 11:04:08', '2019-10-16 11:08:07', 'closed'),
(24, 8, '2019-10-16 11:12:39', '2019-10-21 10:28:31', 'closed'),
(25, 8, '2019-10-21 13:07:18', '2019-11-15 11:10:31', 'closed'),
(26, 8, '2019-12-30 14:53:26', '2019-12-30 17:25:18', 'closed'),
(27, 8, '2020-01-14 10:20:47', '2020-01-14 10:33:45', 'closed'),
(28, 8, '2020-01-14 10:33:49', '2020-01-27 10:16:24', 'closed'),
(29, 8, '2020-01-27 10:22:56', '2020-01-27 11:43:01', 'closed'),
(30, 8, '2020-01-27 11:43:40', '2020-01-28 18:25:09', 'closed'),
(31, 8, '2020-01-28 18:28:39', '2020-01-28 18:43:50', 'closed'),
(32, 8, '2020-01-28 18:43:55', '2020-01-28 18:44:09', 'closed'),
(33, 8, '2020-01-28 20:18:34', '2020-01-28 20:19:48', 'closed'),
(34, 8, '2020-01-28 20:34:39', '2020-01-28 20:37:35', 'closed'),
(35, 8, '2020-01-28 20:39:03', '2020-01-28 20:40:08', 'closed'),
(36, 8, '2020-01-28 20:40:45', '2020-01-29 09:58:55', 'closed'),
(37, 8, '2020-01-29 15:14:14', '2020-01-29 15:14:17', 'closed'),
(38, 8, '2020-01-30 11:28:46', '2020-01-30 11:28:52', 'closed'),
(39, 8, '2020-01-30 11:28:57', '2020-01-30 18:01:31', 'closed'),
(40, 8, '2020-01-30 18:01:37', '2020-01-31 11:40:23', 'closed'),
(41, 8, '2020-01-31 11:53:26', '2020-10-21 10:15:58', 'closed'),
(42, 8, '2020-10-26 11:31:54', '2020-10-26 11:32:54', 'closed'),
(43, 8, '2020-10-26 15:15:31', '2020-10-26 15:29:39', 'closed'),
(44, 8, '2020-10-30 11:57:56', '2020-11-29 17:00:28', 'closed'),
(45, 8, '2020-11-29 17:01:41', '2020-11-29 17:05:21', 'closed'),
(46, 8, '2020-11-29 17:07:15', '2020-11-29 18:28:22', 'closed'),
(47, 8, '2020-11-29 20:21:21', '2020-11-29 20:50:18', 'closed'),
(48, 8, '2020-11-29 20:54:07', '2020-11-29 21:02:55', 'closed'),
(49, 8, '2020-11-29 21:06:29', '2020-11-29 23:13:23', 'closed'),
(50, 8, '2020-11-30 15:35:26', '2020-12-02 14:36:55', 'closed'),
(51, 8, '2020-12-02 15:22:42', '2020-12-02 16:25:06', 'closed'),
(52, 8, '2020-12-14 14:44:46', '2020-12-14 14:47:26', 'closed'),
(53, 8, '2020-12-14 23:10:04', '2020-12-15 15:27:56', 'closed'),
(54, 8, '2020-12-15 15:40:48', '2020-12-15 15:58:35', 'closed'),
(55, 8, '2020-12-15 17:34:52', '2020-12-15 17:36:39', 'closed'),
(56, 8, '2020-12-15 17:43:10', '2020-12-15 17:49:34', 'closed'),
(57, 8, '2020-12-16 10:41:02', '2020-12-16 10:50:29', 'closed'),
(58, 8, '2020-12-17 08:23:19', '2020-12-17 08:38:59', 'closed'),
(59, 8, '2020-12-17 10:03:04', '2020-12-17 10:04:22', 'closed'),
(60, 8, '2020-12-17 17:35:05', '2020-12-17 18:07:25', 'closed'),
(61, 8, '2020-12-17 18:08:21', '2020-12-17 18:08:31', 'closed'),
(62, 8, '2020-12-20 11:47:38', '2020-12-20 12:02:41', 'closed'),
(63, 8, '2020-12-22 14:21:09', '2020-12-22 14:37:40', 'closed'),
(64, 8, '2020-12-22 14:40:32', '2020-12-22 17:56:42', 'closed'),
(65, 8, '2020-12-22 21:25:46', '2020-12-22 21:37:55', 'closed'),
(66, 8, '2020-12-22 21:38:00', '2020-12-22 21:38:02', 'closed'),
(67, 8, '2020-12-23 16:14:01', '2020-12-23 16:42:36', 'closed'),
(68, 8, '2020-12-24 16:19:42', '2020-12-24 16:21:25', 'closed'),
(69, 8, '2020-12-27 17:24:21', '2020-12-27 17:31:14', 'closed'),
(70, 8, '2020-12-27 17:32:04', '2020-12-28 16:53:34', 'closed'),
(71, 8, '2020-12-28 16:54:22', '2020-12-28 17:29:10', 'closed'),
(72, 8, '2020-12-28 17:29:47', '2020-12-28 17:32:44', 'closed'),
(73, 8, '2020-12-31 09:13:34', '2020-12-31 09:23:57', 'closed'),
(74, 8, '2020-12-31 11:07:13', '2020-12-31 13:04:37', 'closed'),
(75, 8, '2020-12-31 13:04:43', '2021-01-01 10:11:15', 'closed'),
(76, 8, '2021-01-01 10:12:44', '2021-01-01 19:12:02', 'closed'),
(77, 8, '2021-01-01 19:14:13', '2021-01-01 19:21:18', 'closed'),
(78, 8, '2021-01-01 23:07:48', '2021-01-01 23:11:56', 'closed'),
(79, 8, '2021-01-01 23:13:57', '2021-01-01 23:14:03', 'closed'),
(80, 8, '2021-01-01 23:16:23', '2021-01-01 23:26:51', 'closed'),
(81, 8, '2021-01-03 11:26:24', '2021-01-03 11:33:43', 'closed'),
(82, 8, '2021-01-04 13:33:34', '2021-01-04 13:35:22', 'closed'),
(83, 8, '2021-01-04 14:31:50', '2021-01-04 14:36:04', 'closed'),
(84, 8, '2021-01-04 17:12:52', '2021-01-04 17:17:37', 'closed'),
(85, 8, '2021-01-04 17:52:53', '2021-01-05 14:16:30', 'closed'),
(86, 8, '2021-01-08 12:02:20', '2021-01-08 12:06:09', 'closed'),
(87, 8, '2021-01-08 17:55:53', '2021-01-08 17:58:27', 'closed'),
(88, 8, '2021-01-10 11:48:45', '2021-01-10 11:49:32', 'closed'),
(89, 8, '2021-01-10 11:50:02', '2021-01-10 11:55:47', 'closed'),
(90, 8, '2021-01-11 14:51:06', '2021-01-11 14:53:02', 'closed'),
(91, 8, '2021-01-11 20:40:21', '2021-01-11 21:06:08', 'closed'),
(92, 8, '2021-01-11 21:38:08', '2021-01-11 21:39:03', 'closed'),
(93, 8, '2021-01-12 10:27:38', '2021-01-14 08:33:20', 'closed'),
(94, 8, '2021-01-14 20:19:35', '2021-01-18 21:10:11', 'closed'),
(95, 8, '2021-01-19 20:38:15', '2021-01-21 20:51:35', 'closed'),
(96, 8, '2021-01-22 20:48:55', '2021-01-30 11:21:00', 'closed'),
(97, 8, '2021-02-01 08:06:07', '2021-02-03 08:53:16', 'closed'),
(98, 8, '2021-02-03 17:47:35', '2021-02-03 17:57:58', 'closed'),
(99, 8, '2021-02-06 09:57:40', '2021-02-06 10:00:39', 'closed'),
(100, 8, '2021-02-06 10:04:25', '2021-02-06 10:05:44', 'closed'),
(101, 8, '2021-02-09 08:54:43', '2021-02-10 14:51:26', 'closed'),
(102, 8, '2021-02-10 21:12:07', '2021-02-11 22:29:04', 'closed'),
(103, 8, '2021-02-11 22:31:00', '2021-02-14 11:04:40', 'closed'),
(104, 8, '2021-02-14 11:42:25', '2021-02-17 16:19:58', 'closed'),
(105, 8, '2021-02-17 16:20:24', '2021-02-17 16:22:09', 'closed'),
(106, 8, '2021-02-19 11:12:28', '2021-02-19 11:46:08', 'closed'),
(107, 8, '2021-02-19 16:56:27', '2021-02-25 22:06:40', 'closed'),
(108, 8, '2021-02-26 08:58:28', '2021-02-26 09:04:48', 'closed'),
(109, 8, '2021-02-26 14:22:09', '2021-02-27 14:30:51', 'closed'),
(110, 8, '2021-02-28 12:24:34', '2021-02-28 12:25:08', 'closed'),
(111, 8, '2021-03-01 11:23:42', '2021-03-06 09:13:39', 'closed'),
(112, 8, '2021-03-06 09:29:22', '2021-03-06 09:29:25', 'closed'),
(113, 8, '2021-03-06 11:33:44', '2021-03-07 13:23:50', 'closed'),
(114, 8, '2021-03-07 18:32:21', '2021-03-12 09:12:46', 'closed'),
(115, 8, '2021-03-12 09:14:54', '2021-03-16 11:06:08', 'closed'),
(116, 8, '2021-03-16 11:09:27', '2021-03-16 11:14:00', 'closed'),
(117, 8, '2021-03-16 15:17:05', '2021-03-16 15:26:12', 'closed'),
(118, 8, '2021-03-17 09:41:03', '2021-03-18 18:07:53', 'closed'),
(119, 8, '2021-03-20 18:23:04', '2021-03-20 18:24:15', 'closed'),
(120, 8, '2021-03-24 15:32:23', '2021-03-24 16:17:42', 'closed'),
(121, 8, '2021-03-24 16:17:52', '2021-03-24 16:19:29', 'closed'),
(122, 8, '2021-03-25 14:26:04', '2021-03-25 14:35:27', 'closed'),
(123, 8, '2021-03-26 08:52:31', '2021-03-26 08:54:28', 'closed'),
(124, 8, '2021-03-26 13:38:49', '2021-03-27 15:11:12', 'closed'),
(125, 8, '2021-03-31 17:10:04', '2021-04-11 05:24:27', 'closed'),
(126, 8, '2021-04-11 05:44:55', '2021-04-11 05:44:57', 'closed'),
(127, 8, '2021-04-11 09:06:54', '2021-04-11 09:07:25', 'closed'),
(128, 8, '2021-04-12 14:02:32', '2021-04-16 14:12:19', 'closed'),
(129, 8, '2021-04-19 17:21:11', '2021-04-19 17:22:54', 'closed'),
(130, 8, '2021-04-20 11:02:25', '2021-04-22 15:28:30', 'closed'),
(131, 8, '2021-04-23 20:52:27', '2021-04-24 09:29:14', 'closed'),
(132, 8, '2021-04-26 19:04:15', '2021-04-27 13:25:38', 'closed'),
(133, 8, '2021-04-27 15:55:32', '2021-05-03 10:31:46', 'closed'),
(134, 8, '2021-05-04 14:51:15', '2021-05-09 12:13:21', 'closed'),
(135, 8, '2021-05-10 11:27:43', '2021-05-10 11:29:08', 'closed'),
(136, 8, '2021-05-13 10:21:38', '2021-05-17 09:01:50', 'closed'),
(137, 8, '2021-05-18 22:02:05', '2021-05-18 22:11:44', 'closed'),
(138, 8, '2021-05-20 08:35:49', '2021-05-20 08:41:41', 'closed'),
(139, 8, '2021-05-21 09:12:14', '2021-05-26 15:15:23', 'closed'),
(140, 8, '2021-05-27 11:30:38', '2021-05-27 11:30:42', 'closed'),
(141, 8, '2021-05-27 16:51:12', '2021-05-28 16:45:13', 'closed'),
(142, 8, '2021-06-02 09:12:25', '2021-06-02 09:12:28', 'closed'),
(143, 8, '2021-06-02 09:14:23', '2021-06-03 22:48:18', 'closed'),
(144, 8, '2021-06-04 17:07:39', '2021-06-10 11:27:49', 'closed'),
(145, 8, '2021-06-10 13:43:40', '2021-06-10 15:48:36', 'closed'),
(146, 8, '2021-06-17 08:35:35', '2021-06-17 08:44:51', 'closed'),
(147, 8, '2021-06-18 08:18:46', '2021-06-21 13:16:04', 'closed'),
(148, 8, '2021-06-22 13:23:20', '2021-06-24 10:46:03', 'closed'),
(149, 8, '2021-06-24 10:47:33', '2021-06-28 18:38:48', 'closed'),
(150, 8, '2021-07-01 11:45:21', '2021-07-01 11:54:45', 'closed'),
(151, 8, '2021-07-02 13:34:23', '2021-07-07 11:37:57', 'closed'),
(152, 8, '2021-07-08 10:45:41', '2021-07-08 10:47:28', 'closed'),
(153, 8, '2021-07-09 14:53:47', '2021-07-09 14:58:57', 'closed'),
(154, 8, '2021-07-14 18:47:23', '2021-07-15 16:00:26', 'closed'),
(155, 8, '2021-07-19 09:38:44', '2021-07-19 09:41:50', 'closed'),
(156, 8, '2021-07-19 09:49:15', '2021-07-20 09:29:27', 'closed'),
(157, 8, '2021-07-21 17:06:03', '2021-07-22 17:41:14', 'closed'),
(158, 8, '2021-07-26 08:26:26', '2021-07-26 08:32:08', 'closed'),
(159, 8, '2021-07-28 10:12:03', '2021-07-28 10:14:24', 'closed'),
(160, 8, '2021-07-28 17:04:30', '2021-07-28 17:13:16', 'closed'),
(161, 8, '2021-07-31 12:22:32', '2021-07-31 12:25:21', 'closed'),
(162, 8, '2021-08-01 09:46:06', '2021-08-01 09:47:53', 'closed'),
(163, 8, '2021-08-03 09:04:24', '2021-08-04 17:25:11', 'closed'),
(164, 8, '2021-08-07 11:42:16', '2021-08-14 13:42:02', 'closed'),
(165, 8, '2021-08-16 16:25:01', '2021-08-21 11:53:57', 'closed'),
(166, 8, '2021-08-23 14:33:17', '2021-09-05 12:35:41', 'closed'),
(167, 8, '2021-09-06 14:47:20', '2021-09-08 08:15:51', 'closed'),
(168, 8, '2021-09-08 15:32:02', '2021-09-15 15:02:12', 'closed'),
(169, 8, '2021-09-17 10:51:30', '2021-09-17 10:52:50', 'closed'),
(170, 8, '2021-09-19 10:39:20', '2021-09-19 10:39:57', 'closed'),
(171, 8, '2021-09-19 12:27:23', '2021-09-20 09:31:54', 'closed'),
(172, 8, '2021-09-20 15:38:53', '2021-09-25 11:38:44', 'closed'),
(173, 8, '2021-09-26 18:51:03', '2021-10-09 08:51:12', 'closed'),
(174, 8, '2021-10-11 08:20:07', '2021-10-25 17:03:24', 'closed'),
(175, 8, '2021-10-25 17:21:38', '2021-10-25 17:21:49', 'closed'),
(176, 8, '2021-10-26 08:32:13', '2021-10-26 14:41:29', 'closed'),
(177, 8, '2021-10-27 08:39:58', '2021-10-27 08:49:14', 'closed'),
(178, 8, '2021-10-30 13:56:22', '2021-11-17 13:13:33', 'closed'),
(179, 8, '2021-11-18 14:47:48', '2021-11-23 12:02:27', 'closed'),
(180, 8, '2021-11-23 12:04:17', '2021-11-23 12:07:53', 'closed'),
(181, 8, '2021-11-25 07:58:10', '2021-11-25 07:59:14', 'closed'),
(182, 8, '2021-11-26 13:46:57', '2021-11-26 13:47:42', 'closed'),
(183, 8, '2021-11-27 06:53:34', '2021-11-30 08:57:40', 'closed'),
(184, 8, '2021-12-01 08:42:28', '2021-12-01 16:09:40', 'closed'),
(185, 8, '2021-12-01 16:09:47', '2021-12-01 16:11:29', 'closed'),
(186, 8, '2021-12-01 16:14:27', '2021-12-01 16:16:04', 'closed'),
(187, 8, '2021-12-02 15:25:21', '2021-12-03 11:02:11', 'closed'),
(188, 8, '2021-12-03 11:04:24', '2021-12-04 12:29:36', 'closed'),
(189, 8, '2021-12-06 14:33:07', '2021-12-06 16:05:39', 'closed'),
(190, 8, '2021-12-06 16:44:30', '2021-12-10 11:31:05', 'closed'),
(191, 8, '2021-12-10 18:11:45', '2021-12-10 18:13:15', 'closed'),
(192, 8, '2021-12-13 14:47:15', '2021-12-16 11:29:17', 'closed'),
(193, 8, '2021-12-20 09:19:44', '2021-12-21 17:24:08', 'closed'),
(194, 8, '2021-12-21 17:30:34', '2021-12-23 09:49:27', 'closed'),
(195, 8, '2021-12-23 17:18:48', '2021-12-23 17:21:06', 'closed'),
(196, 8, '2021-12-24 11:14:13', '2021-12-27 09:29:40', 'closed'),
(197, 8, '2021-12-27 12:48:49', '2021-12-27 12:48:53', 'closed'),
(198, 8, '2021-12-27 15:40:15', '2022-01-04 16:57:31', 'closed'),
(199, 8, '2022-01-05 16:21:16', '2022-01-05 16:23:22', 'closed'),
(200, 8, '2022-01-07 11:24:31', '2022-01-07 11:25:50', 'closed'),
(201, 8, '2022-01-08 09:16:28', '2022-01-08 12:25:52', 'closed'),
(202, 8, '2022-01-08 12:26:40', '2022-01-08 12:27:54', 'closed'),
(203, 8, '2022-01-08 12:28:52', '2022-01-08 12:50:58', 'closed'),
(204, 8, '2022-01-08 12:55:11', '2022-01-10 11:27:55', 'closed'),
(205, 13, '2022-01-10 09:26:46', '2022-01-10 09:29:57', 'closed'),
(206, 13, '2022-01-10 09:35:17', '2022-01-10 09:35:43', 'closed'),
(207, 13, '2022-01-10 09:39:40', '2022-01-10 10:08:58', 'closed'),
(208, 13, '2022-01-10 10:19:22', '2022-01-10 10:21:04', 'closed'),
(209, 8, '2022-01-10 11:35:05', '2022-01-10 11:38:41', 'closed'),
(210, 13, '2022-01-10 11:48:46', '2022-01-10 11:49:10', 'closed'),
(211, 13, '2022-01-10 11:49:56', '2022-01-10 12:07:28', 'closed'),
(212, 13, '2022-01-10 12:12:23', '2022-01-10 12:16:33', 'closed'),
(213, 13, '2022-01-10 12:18:27', '2022-01-10 12:19:46', 'closed'),
(214, 13, '2022-01-10 12:20:53', '2022-01-11 10:39:53', 'closed'),
(215, 8, '2022-01-10 15:46:12', '2022-01-10 15:46:23', 'closed'),
(216, 13, '2022-01-11 10:48:10', '2022-01-11 10:51:22', 'closed'),
(217, 13, '2022-01-11 10:58:06', '2022-01-11 11:21:39', 'closed'),
(218, 13, '2022-01-11 11:25:33', '2022-01-11 11:35:59', 'closed'),
(219, 13, '2022-01-11 11:41:39', '2022-01-11 11:49:15', 'closed'),
(220, 8, '2022-01-11 11:50:46', '2022-01-11 11:51:06', 'closed'),
(221, 13, '2022-01-11 11:51:32', '2022-01-11 11:57:31', 'closed'),
(222, 8, '2022-01-11 12:09:52', '2022-01-11 12:17:03', 'closed'),
(223, 13, '2022-01-11 12:17:28', '2022-01-11 12:26:20', 'closed'),
(224, 13, '2022-01-11 12:27:59', '2022-01-11 12:37:27', 'closed'),
(225, 13, '2022-01-11 14:26:48', '2022-01-11 16:18:58', 'closed'),
(226, 13, '2022-01-12 12:01:52', '2022-01-14 09:00:06', 'closed'),
(227, 8, '2022-01-13 08:31:02', '2022-01-13 10:05:30', 'closed'),
(228, 8, '2022-01-13 10:13:53', '2022-01-13 11:32:49', 'closed'),
(229, 8, '2022-01-13 11:34:17', '2022-01-17 11:51:21', 'closed'),
(230, 13, '2022-01-14 09:22:21', '2022-01-14 09:23:40', 'closed'),
(231, 13, '2022-01-14 09:25:41', '2022-01-14 10:01:43', 'closed'),
(232, 13, '2022-01-17 10:17:18', '2022-01-17 10:26:48', 'closed'),
(233, 13, '2022-01-17 10:30:25', '2022-01-17 12:03:35', 'closed'),
(234, 13, '2022-01-17 12:05:59', '2022-01-17 12:12:10', 'closed'),
(235, 13, '2022-01-17 12:27:39', '2022-01-17 13:06:42', 'closed'),
(236, 13, '2022-01-17 13:06:55', '2022-01-17 13:07:02', 'closed'),
(237, 13, '2022-01-17 13:16:34', '2022-01-17 13:21:25', 'closed'),
(238, 13, '2022-01-17 13:22:57', '2022-01-17 13:27:13', 'closed'),
(239, 13, '2022-01-17 13:29:41', '2022-01-17 13:32:11', 'closed'),
(240, 13, '2022-01-17 13:36:39', '2022-01-17 14:55:27', 'closed'),
(241, 13, '2022-01-17 14:58:11', '2022-01-18 12:05:30', 'closed'),
(242, 8, '2022-01-18 10:20:44', '2022-01-18 11:51:17', 'closed'),
(243, 13, '2022-01-18 12:08:43', '2022-01-28 11:39:57', 'closed'),
(244, 8, '2022-01-18 15:25:36', '2022-01-18 15:25:49', 'closed');

-- --------------------------------------------------------

--
-- Table structure for table `open_close_tb`
--

CREATE TABLE IF NOT EXISTS `open_close_tb` (
  `id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `open_bal` int(12) NOT NULL,
  `close_bal` int(12) NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `open_close_tb`
--

INSERT INTO `open_close_tb` (`id`, `prod_id`, `open_bal`, `close_bal`, `date`) VALUES
(1, 481, 65, 55, '2022-01-08'),
(2, 482, 90, 0, '2022-01-08'),
(3, 483, 8, 1, '2022-01-10'),
(4, 481, 54, 53, '2022-01-10'),
(5, 482, 89, 0, '2022-01-10'),
(6, 24, 3, 0, '2022-01-10'),
(7, 484, 2, 0, '2022-01-10'),
(8, 486, 5, 3, '2022-01-11'),
(9, 2, 94, 86, '2022-01-11'),
(10, 43, 81, 69, '2022-01-11'),
(11, 52, 83, 53, '2022-01-11'),
(12, 64, 81, 63, '2022-01-11'),
(13, 21, 109, 101, '2022-01-11'),
(14, 9, 82, 78, '2022-01-11'),
(15, 20, 81, 78, '2022-01-11'),
(16, 53, 89, 0, '2022-01-11'),
(17, 24, 3, 0, '2022-01-11'),
(18, 60, 47, 0, '2022-01-11'),
(19, 22, 71, 0, '2022-01-11'),
(20, 55, 76, 0, '2022-01-11'),
(21, 59, 115, 109, '2022-01-11'),
(22, 21, 100, 92, '2022-01-14'),
(23, 20, 75, 0, '2022-01-14'),
(24, 2, 85, 0, '2022-01-17'),
(25, 5, 9, 8, '2022-01-17'),
(26, 485, 75, 71, '2022-01-17'),
(27, 4, 5, 0, '2022-01-17'),
(28, 23, 9, 0, '2022-01-17'),
(29, 490, 12, 0, '2022-01-17'),
(30, 12, 36, 0, '2022-01-17'),
(31, 485, 70, 0, '2022-01-18'),
(32, 24, 2, 0, '2022-01-18'),
(33, 490, 11, 9, '2022-01-18'),
(34, 37, 133, 0, '2022-01-18'),
(35, 101, 392, 0, '2022-01-18'),
(36, 40, 145, 0, '2022-01-18'),
(37, 46, 413, 0, '2022-01-18'),
(38, 30, 117, 0, '2022-01-18'),
(39, 31, 99, 0, '2022-01-18'),
(40, 4, 3, 0, '2022-01-18'),
(41, 25, 9, 0, '2022-01-18'),
(42, 14, 13, 0, '2022-01-18'),
(43, 29, 22, 0, '2022-01-18'),
(44, 28, 10, 0, '2022-01-21'),
(45, 53, 105, 0, '2022-01-21'),
(46, 4, 13, 0, '2022-01-26'),
(47, 24, 12, 11, '2022-01-26'),
(48, 81, 201, 0, '2022-01-26'),
(49, 1, 43, 0, '2022-01-26'),
(50, 490, 8, 0, '2022-01-26'),
(51, 12, 20, 0, '2022-01-26'),
(52, 5, 7, 13, '2022-01-26'),
(53, 14, 12, 0, '2022-01-26'),
(54, 485, 24, 0, '2022-01-26'),
(55, 490, 7, 0, '2022-02-02'),
(56, 18, 91, 0, '2022-02-02'),
(57, 49, 78, 0, '2022-02-02'),
(58, 485, 3, 0, '2022-02-02'),
(59, 24, 9, 0, '2022-02-02'),
(60, 25, 8, 0, '2022-02-02'),
(61, 504, 37, 0, '2022-05-25'),
(62, 19, 11, 9, '2022-09-01'),
(63, 16, 16, 0, '2022-09-01'),
(64, 17, 15, 0, '2022-09-01'),
(65, 19, -2, 0, '2022-09-24'),
(66, 16, 14, 0, '2022-09-24'),
(67, 19, -5, 0, '2022-09-25'),
(68, 16, 13, 0, '2022-09-25'),
(69, 82, 1, 0, '2022-09-25'),
(70, 504, 32, 0, '2022-11-17'),
(71, 500, 296, 0, '2022-11-17'),
(72, 507, -12, 0, '2022-11-17'),
(73, 570, -2, 0, '2022-11-17'),
(74, 517, -6, 0, '2022-11-17'),
(75, 504, 20, 0, '2022-11-19'),
(76, 29, 23, 0, '2023-01-28'),
(77, 15, 33, 0, '2023-01-28'),
(78, 29, 12, 0, '2023-08-11'),
(79, 504, 14, 0, '2023-09-04'),
(80, 510, 185, 0, '2023-09-04'),
(81, 2, 16, 16, '2023-09-04'),
(82, 42, 79, 0, '2023-09-04'),
(83, 58, 67, 0, '2023-09-04'),
(84, 29, 8, 1, '2023-09-04'),
(85, 615, 98, 0, '2023-09-04'),
(86, 15, 22, 21, '2023-09-04'),
(87, 9, 46, 0, '2023-09-04'),
(88, 488, 33, 0, '2023-09-04'),
(89, 49, 69, 69, '2023-09-04'),
(90, 1, 27, 0, '2023-09-05'),
(91, 17, 1, 1, '2023-09-10'),
(92, 17, 0, 0, '2023-09-11'),
(93, 615, 85, 85, '2023-09-11'),
(94, 45, 120, 0, '2023-09-11'),
(95, 15, 14, 10, '2023-09-11'),
(96, 22, 42, 41, '2023-09-11'),
(97, 56, 14, 13, '2023-09-11'),
(98, 13, 11, 0, '2023-09-11'),
(99, 18, 79, 76, '2023-09-11'),
(100, 12, 156, 154, '2023-09-11'),
(101, 112, 0, 0, '2023-09-11'),
(102, 28, 8, 0, '2023-09-11'),
(103, 63, 31, 0, '2023-09-11'),
(104, 24, 1, 0, '2023-09-11'),
(105, 68, 76, 75, '2023-09-11'),
(106, 61, 16, 0, '2023-09-11'),
(107, 34, 3, 0, '2023-09-11'),
(108, 55, 74, 73, '2023-09-19'),
(109, 91, 1, 0, '2023-09-19'),
(110, 18, 75, 73, '2023-09-19'),
(111, 15, 9, 0, '2023-09-19'),
(112, 0, 0, 0, '2023-09-19'),
(113, 5, 12, 0, '2023-09-19'),
(114, 4, 11, 0, '2023-09-19'),
(115, 49, 67, 66, '2023-09-19'),
(116, 22, 38, 36, '2023-09-19'),
(117, 118, 0, 0, '2023-09-19'),
(118, 12, 151, 144, '2023-09-19'),
(119, 34, 2, 1, '2023-09-19'),
(120, 70, 67, 66, '2023-09-19'),
(121, 72, 57, 0, '2023-09-19'),
(122, 65, 99, 0, '2023-09-19'),
(123, 9, 45, 0, '2023-09-19'),
(124, 488, 31, 0, '2023-09-19'),
(125, 52, 62, 0, '2023-09-19'),
(126, 48, 82, 81, '2023-09-19'),
(127, 113, 0, 0, '2023-09-19'),
(128, 60, 0, 0, '2023-09-19'),
(129, 44, 204, 0, '2023-09-19'),
(130, 610, 46, 45, '2023-09-19'),
(131, 15, 0, 0, '2023-09-21'),
(132, 18, 72, 64, '2023-09-21'),
(133, 22, 30, 27, '2023-09-21'),
(134, 17, 0, 0, '2023-09-21'),
(135, 25, 2, 0, '2023-09-21'),
(136, 46, 390, 0, '2023-09-21'),
(137, 50, 104, 0, '2023-09-21'),
(138, 41, 156, 155, '2023-09-21'),
(139, 55, 71, 70, '2023-09-21'),
(140, 49, 65, 0, '2023-09-21'),
(141, 34, 0, 0, '2023-09-21'),
(142, 12, 143, 140, '2023-09-21'),
(143, 487, 17, 0, '2023-09-21'),
(144, 37, 65, 0, '2023-09-21'),
(145, 70, 63, 62, '2023-09-21'),
(146, 14, 9, 0, '2023-09-21'),
(147, 5, 10, 8, '2023-09-21'),
(148, 26, 4, 3, '2023-09-21'),
(149, 21, 9, 8, '2023-09-21'),
(150, 31, 37, 0, '2023-09-21'),
(151, 1, 25, 0, '2023-09-21'),
(152, 572, 20, 0, '2023-09-21'),
(153, 91, 0, 0, '2023-09-21'),
(154, 45, 118, 0, '2023-09-21'),
(155, 2, 14, 0, '2023-09-21'),
(156, 488, 29, 0, '2023-09-21'),
(157, 61, 13, 0, '2023-09-21'),
(158, 568, 82, 81, '2023-09-21'),
(159, 64, 119, 0, '2023-09-21'),
(160, 102, 67, 0, '2023-09-21'),
(161, 63, 30, 0, '2023-09-21'),
(162, 40, 105, 104, '2023-09-21'),
(163, 73, 134, 0, '2023-09-21'),
(164, 8, 75, 0, '2023-09-21'),
(165, 568, 80, 0, '2023-09-22'),
(166, 18, 62, 0, '2023-09-22'),
(167, 5, 7, 0, '2023-09-22'),
(168, 22, 27, 25, '2023-10-04'),
(169, 8, 75, 0, '2023-10-04'),
(170, 33, 3, 0, '2023-10-04'),
(171, 26, 3, 0, '2023-10-04'),
(172, 18, 62, 61, '2023-10-04'),
(173, 13, 10, 0, '2023-10-04'),
(174, 55, 69, 0, '2023-10-04'),
(175, 63, 29, 0, '2023-10-04'),
(176, 615, 84, 0, '2023-10-04');

-- --------------------------------------------------------

--
-- Table structure for table `part_payments_tb`
--

CREATE TABLE IF NOT EXISTS `part_payments_tb` (
  `payment_id` int(12) NOT NULL,
  `amount` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `payment_mode_id` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `part_payments_tb`
--

INSERT INTO `part_payments_tb` (`payment_id`, `amount`, `date_added`, `order_no`, `user_id`, `payment_mode_id`) VALUES
(1, '50', '2021-02-01 14:25:50', 1685, 8, 1),
(2, '100', '2021-02-01 14:25:50', 3081, 8, 1),
(3, '60', '2021-02-01 14:25:50', 469, 8, 1),
(4, '100', '2021-02-01 14:25:50', 2226, 8, 1),
(5, '10', '2021-02-01 14:25:50', 635, 8, 1),
(6, '50', '2021-02-01 14:25:50', 4123, 8, 1),
(7, '100', '2021-02-01 14:25:50', 1547, 8, 1),
(8, '100', '2021-02-01 14:25:50', 2073, 8, 1),
(9, '5500', '2021-02-01 14:25:50', 484, 8, 1),
(10, '20000', '2021-02-01 14:25:50', 3312, 8, 1),
(11, '7400', '2021-02-17 14:18:07', 4016, 8, 5),
(12, '3000', '2021-03-24 14:13:18', 2315, 8, 1),
(13, '6500', '2021-05-25 12:55:20', 454, 8, 1),
(14, '18400', '2021-10-25 15:01:09', 1518, 8, 3),
(15, '10', '2021-10-26 06:33:33', 1518, 8, 3),
(16, '7890.00', '2021-12-01 14:10:15', 1518, 8, 7),
(17, '25', '2022-06-03 07:58:27', 3690, 8, 1),
(18, '1000', '2022-06-14 08:42:10', 5049, 8, 1),
(19, '1000', '2022-06-28 12:11:58', 5049, 8, 1),
(20, '500', '2022-06-28 12:17:29', 5049, 8, 1),
(21, '25', '2022-09-01 10:37:26', 3690, 8, 1),
(22, '25000', '2022-09-30 11:47:59', 5058, 28, 6),
(23, '100', '2022-10-25 10:12:59', 5059, 12, 1),
(24, '63', '2022-10-25 10:13:46', 5059, 12, 1),
(25, '1000', '2022-10-25 10:17:38', 5060, 12, 1),
(26, '10000', '2022-10-25 10:17:53', 5060, 12, 1),
(27, '200', '2023-09-11 12:46:28', 5113, 8, 1),
(28, '150', '2023-09-11 19:49:12', 5125, 8, 1),
(29, '20', '2023-09-11 19:49:52', 5126, 8, 1),
(30, '100', '2023-09-11 19:52:17', 5127, 8, 1),
(31, '18', '2023-09-11 19:52:35', 5129, 8, 1),
(32, '100', '2023-09-11 20:29:22', 5130, 8, 1),
(33, '10', '2023-09-11 20:41:06', 5131, 8, 1),
(34, '20', '2023-09-19 13:47:20', 5163, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `payment_for` date NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `remaining` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `rebate` decimal(10,2) NOT NULL,
  `or_no` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `cust_id`, `sales_id`, `payment`, `payment_date`, `user_id`, `branch_id`, `payment_for`, `due`, `interest`, `remaining`, `status`, `rebate`, `or_no`) VALUES
(1, 0, 1, '0.00', '2019-08-17 13:16:20', 8, 1, '2019-08-17', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(2, 0, 2, '0.00', '2019-08-22 13:02:15', 8, 1, '2019-08-22', '0.00', '0.00', '0.00', 'paid', '0.00', 1902),
(3, 0, 3, '55.00', '2019-08-22 13:45:16', 8, 1, '2019-08-22', '55.00', '0.00', '0.00', 'paid', '0.00', 1903),
(4, 0, 4, '55.00', '2019-08-22 13:52:18', 8, 1, '2019-08-22', '55.00', '0.00', '0.00', 'paid', '0.00', 1904),
(5, 0, 5, '55.00', '2019-08-22 13:54:18', 8, 1, '2019-08-22', '55.00', '0.00', '0.00', 'paid', '0.00', 1905),
(6, 0, 6, '55.00', '2019-08-22 13:54:55', 8, 1, '2019-08-22', '55.00', '0.00', '0.00', 'paid', '0.00', 1906),
(7, 0, 7, '55.00', '2019-08-22 14:06:29', 8, 1, '2019-08-22', '55.00', '0.00', '0.00', 'paid', '0.00', 1907),
(8, 0, 8, '165.00', '2019-08-25 14:15:53', 8, 1, '2019-08-25', '165.00', '0.00', '0.00', 'paid', '0.00', 1908),
(9, 0, 9, '55.00', '2019-08-25 15:24:20', 8, 1, '2019-08-25', '55.00', '0.00', '0.00', 'paid', '0.00', 1909),
(10, 0, 10, '110.00', '2019-08-26 13:43:34', 8, 1, '2019-08-26', '110.00', '0.00', '0.00', 'paid', '0.00', 1910),
(11, 0, 11, '115.00', '2019-08-27 11:40:45', 8, 1, '2019-08-27', '115.00', '0.00', '0.00', 'paid', '0.00', 1911),
(12, 0, 12, '60.00', '2019-09-03 11:47:39', 8, 1, '2019-09-03', '60.00', '0.00', '0.00', 'paid', '0.00', 1912),
(13, 0, 13, '0.00', '2019-09-03 11:51:04', 8, 1, '2019-09-03', '0.00', '0.00', '0.00', 'paid', '0.00', 1913),
(14, 0, 14, '165.00', '2019-09-03 11:51:32', 8, 1, '2019-09-03', '165.00', '0.00', '0.00', 'paid', '0.00', 1914),
(15, 0, 15, '54.00', '2019-09-03 11:53:13', 8, 1, '2019-09-03', '54.00', '0.00', '0.00', 'paid', '0.00', 1915),
(16, 0, 16, '110.00', '2019-09-03 11:53:40', 8, 1, '2019-09-03', '110.00', '0.00', '0.00', 'paid', '0.00', 1916),
(17, 0, 17, '110.00', '2019-09-06 08:12:59', 8, 1, '2019-09-06', '110.00', '0.00', '0.00', 'paid', '0.00', 1917),
(18, 0, 18, '55.00', '2019-09-06 08:57:12', 8, 1, '2019-09-06', '55.00', '0.00', '0.00', 'paid', '0.00', 1918),
(19, 0, 19, '165.00', '2019-09-06 09:01:55', 8, 1, '2019-09-06', '165.00', '0.00', '0.00', 'paid', '0.00', 1919),
(20, 0, 20, '65.00', '2019-09-06 22:26:32', 8, 1, '2019-09-06', '65.00', '0.00', '0.00', 'paid', '0.00', 1920),
(21, 0, 21, '165.00', '2019-09-07 09:50:24', 8, 1, '2019-09-07', '165.00', '0.00', '0.00', 'paid', '0.00', 1921),
(22, 0, 22, '0.00', '2019-09-10 17:53:05', 8, 1, '2019-09-10', '0.00', '0.00', '0.00', 'paid', '0.00', 1922),
(23, 0, 23, '165.00', '2019-09-30 17:47:04', 8, 1, '2019-09-30', '165.00', '0.00', '0.00', 'paid', '0.00', 1923),
(24, 0, 24, '165.00', '2019-09-30 18:09:09', 8, 1, '2019-09-30', '165.00', '0.00', '0.00', 'paid', '0.00', 1924),
(25, 0, 25, '165.00', '2019-09-30 18:27:10', 8, 1, '2019-09-30', '165.00', '0.00', '0.00', 'paid', '0.00', 1925),
(26, 0, 26, '170.00', '2019-09-30 19:04:48', 8, 1, '2019-09-30', '170.00', '0.00', '0.00', 'paid', '0.00', 1926),
(27, 0, 27, '170.00', '2019-09-30 19:25:55', 8, 1, '2019-09-30', '170.00', '0.00', '0.00', 'paid', '0.00', 1927),
(28, 0, 28, '108.00', '2019-10-08 11:01:17', 8, 1, '2019-10-08', '108.00', '0.00', '0.00', 'paid', '0.00', 1928),
(29, 0, 29, '114.00', '2019-10-09 08:57:47', 8, 1, '2019-10-09', '114.00', '0.00', '0.00', 'paid', '0.00', 1929),
(30, 0, 30, '163.00', '2019-10-09 08:59:12', 8, 1, '2019-10-09', '163.00', '0.00', '0.00', 'paid', '0.00', 1930),
(31, 0, 31, '114.00', '2019-10-09 15:02:21', 8, 1, '2019-10-09', '114.00', '0.00', '0.00', 'paid', '0.00', 1931),
(32, 0, 32, '109.00', '2019-10-09 15:05:08', 8, 1, '2019-10-09', '109.00', '0.00', '0.00', 'paid', '0.00', 1932),
(33, 0, 33, '275.00', '2019-10-09 15:07:27', 8, 1, '2019-10-09', '275.00', '0.00', '0.00', 'paid', '0.00', 1933),
(34, 0, 34, '165.00', '2019-10-11 12:36:53', 8, 1, '2019-10-11', '165.00', '0.00', '0.00', 'paid', '0.00', 1934),
(35, 0, 35, '165.00', '2019-10-11 13:00:31', 8, 1, '2019-10-11', '165.00', '0.00', '0.00', 'paid', '0.00', 1935),
(36, 0, 36, '225.00', '2019-10-11 14:02:58', 8, 1, '2019-10-11', '225.00', '0.00', '0.00', 'paid', '0.00', 1936),
(37, 0, 37, '110.00', '2019-10-11 14:17:01', 8, 1, '2019-10-11', '110.00', '0.00', '0.00', 'paid', '0.00', 1937),
(38, 0, 38, '115.00', '2019-10-11 14:23:41', 8, 1, '2019-10-11', '115.00', '0.00', '0.00', 'paid', '0.00', 1938),
(39, 0, 39, '555.00', '2019-10-11 14:32:41', 8, 1, '2019-10-11', '555.00', '0.00', '0.00', 'paid', '0.00', 1939),
(40, 0, 40, '275.00', '2019-10-11 14:37:22', 8, 1, '2019-10-11', '275.00', '0.00', '0.00', 'paid', '0.00', 1940),
(41, 0, 41, '195.00', '2019-10-11 14:42:17', 8, 1, '2019-10-11', '195.00', '0.00', '0.00', 'paid', '0.00', 1941),
(42, 0, 42, '225.00', '2019-10-11 14:45:56', 8, 1, '2019-10-11', '225.00', '0.00', '0.00', 'paid', '0.00', 1942),
(43, 0, 43, '110.00', '2019-10-11 15:01:45', 8, 1, '2019-10-11', '110.00', '0.00', '0.00', 'paid', '0.00', 1943),
(44, 0, 44, '60.00', '2019-10-11 15:05:00', 8, 1, '2019-10-11', '60.00', '0.00', '0.00', 'paid', '0.00', 1944),
(45, 0, 45, '110.00', '2019-10-11 15:07:10', 8, 1, '2019-10-11', '110.00', '0.00', '0.00', 'paid', '0.00', 1945),
(46, 0, 46, '115.00', '2019-10-11 15:09:00', 8, 1, '2019-10-11', '115.00', '0.00', '0.00', 'paid', '0.00', 1946),
(47, 0, 47, '115.00', '2019-10-12 19:25:12', 8, 1, '2019-10-12', '115.00', '0.00', '0.00', 'paid', '0.00', 1947),
(48, 0, 48, '85.00', '2019-10-13 18:30:08', 8, 1, '2019-10-13', '85.00', '0.00', '0.00', 'paid', '0.00', 1948),
(49, 0, 49, '115.00', '2019-10-14 19:57:38', 8, 1, '2019-10-14', '115.00', '0.00', '0.00', 'paid', '0.00', 1949),
(50, 0, 50, '85.00', '2019-10-18 19:29:52', 8, 1, '2019-10-18', '85.00', '0.00', '0.00', 'paid', '0.00', 1950),
(51, 0, 51, '115.00', '2019-10-21 09:31:54', 8, 1, '2019-10-21', '115.00', '0.00', '0.00', 'paid', '0.00', 1951),
(52, 0, 52, '55.00', '2019-10-21 09:55:34', 8, 1, '2019-10-21', '55.00', '0.00', '0.00', 'paid', '0.00', 1952),
(53, 0, 53, '165.00', '2019-10-21 10:14:38', 8, 1, '2019-10-21', '165.00', '0.00', '0.00', 'paid', '0.00', 1953),
(54, 0, 54, '85.00', '2019-10-21 10:27:58', 8, 1, '2019-10-21', '85.00', '0.00', '0.00', 'paid', '0.00', 1954),
(55, 0, 55, '750.00', '2019-12-30 14:54:56', 8, 1, '2019-12-30', '750.00', '0.00', '0.00', 'paid', '0.00', 1955),
(56, 0, 56, '30.00', '2020-01-14 10:24:48', 8, 1, '2020-01-14', '30.00', '0.00', '0.00', 'paid', '0.00', 1956),
(57, 0, 57, '90.00', '2020-01-14 10:30:41', 8, 1, '2020-01-14', '90.00', '0.00', '0.00', 'paid', '0.00', 1957),
(58, 0, 58, '170.00', '2020-01-14 10:34:05', 8, 1, '2020-01-14', '170.00', '0.00', '0.00', 'paid', '0.00', 1958),
(59, 0, 59, '115.00', '2020-01-14 10:38:26', 8, 1, '2020-01-14', '115.00', '0.00', '0.00', 'paid', '0.00', 1959),
(60, 0, 60, '115.00', '2020-01-27 12:02:08', 8, 1, '2020-01-27', '115.00', '0.00', '0.00', 'paid', '0.00', 1960),
(61, 0, 61, '165.00', '2020-01-27 12:09:23', 8, 1, '2020-01-27', '165.00', '0.00', '0.00', 'paid', '0.00', 1961),
(62, 0, 62, '0.00', '2020-01-28 18:44:54', 8, 1, '2020-01-28', '0.00', '0.00', '0.00', 'paid', '0.00', 1962),
(63, 0, 1, '0.00', '2020-01-28 20:18:50', 8, 1, '2020-01-28', '0.00', '0.00', '0.00', 'paid', '0.00', 1902),
(64, 0, 2, '20.00', '2020-01-28 20:19:28', 8, 1, '2020-01-28', '20.00', '0.00', '0.00', 'paid', '0.00', 1903),
(65, 0, 3, '0.00', '2020-01-28 20:37:29', 8, 1, '2020-01-28', '0.00', '0.00', '0.00', 'paid', '0.00', 1904),
(66, 0, 4, '30.00', '2020-01-28 20:39:53', 8, 1, '2020-01-28', '30.00', '0.00', '0.00', 'paid', '0.00', 1901),
(67, 0, 5, '0.00', '2020-01-28 21:04:03', 8, 1, '2020-01-28', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(68, 0, 6, '0.00', '2020-01-28 23:02:52', 8, 1, '2020-01-28', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(69, 0, 7, '0.00', '2020-01-29 09:52:19', 8, 1, '2020-01-29', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(70, 0, 8, '0.00', '2020-01-30 11:29:25', 8, 1, '2020-01-30', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(71, 0, 9, '0.00', '2020-01-30 17:52:52', 8, 1, '2020-01-30', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(72, 0, 10, '0.00', '2020-01-30 18:22:22', 8, 1, '2020-01-30', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(73, 0, 11, '80.00', '2020-10-21 10:15:06', 8, 1, '2020-10-21', '80.00', '0.00', '0.00', 'paid', '0.00', 1901),
(74, 0, 12, '0.00', '2020-10-26 11:32:21', 8, 1, '2020-10-26', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(75, 0, 13, '0.00', '2020-10-26 15:20:08', 8, 1, '2020-10-26', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(76, 0, 14, '0.00', '2020-10-26 15:21:40', 8, 1, '2020-10-26', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(77, 0, 15, '670.00', '2020-10-26 15:29:21', 8, 1, '2020-10-26', '670.00', '0.00', '0.00', 'paid', '0.00', 1901),
(78, 1, 16, '110.00', '2020-11-29 16:47:52', 8, 1, '2020-11-29', '110.00', '0.00', '0.00', 'paid', '0.00', 1901),
(79, 1, 18, '700.00', '2020-11-29 16:48:59', 8, 1, '2020-11-29', '700.00', '0.00', '0.00', 'paid', '0.00', 1901),
(80, 1, 20, '80.00', '2020-11-29 16:51:50', 8, 1, '2020-11-29', '80.00', '0.00', '0.00', 'paid', '0.00', 1901),
(81, 1, 21, '940.00', '2020-11-29 16:52:21', 8, 1, '2020-11-29', '940.00', '0.00', '0.00', 'paid', '0.00', 1901),
(82, 1, 22, '780.00', '2020-11-29 17:02:02', 8, 1, '2020-11-29', '780.00', '0.00', '0.00', 'paid', '0.00', 1901),
(83, 1, 23, '1060.00', '2020-11-29 17:48:00', 8, 1, '2020-11-29', '1060.00', '0.00', '0.00', 'paid', '0.00', 1901),
(84, 1, 24, '500.00', '2020-11-29 20:24:09', 8, 1, '2020-11-29', '500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(85, 0, 25, '800.00', '2020-11-29 21:19:27', 8, 1, '2020-11-29', '800.00', '0.00', '0.00', 'paid', '0.00', 1926),
(86, 0, 26, '480.00', '2020-11-30 16:00:51', 8, 1, '2020-11-30', '480.00', '0.00', '0.00', 'paid', '0.00', 1927),
(87, 0, 27, '480.00', '2020-11-30 16:01:15', 8, 1, '2020-11-30', '480.00', '0.00', '0.00', 'paid', '0.00', 1928),
(88, 0, 28, '480.00', '2020-11-30 16:03:19', 8, 1, '2020-11-30', '480.00', '0.00', '0.00', 'paid', '0.00', 1929),
(89, 0, 29, '1980.00', '2020-11-30 16:05:37', 8, 1, '2020-11-30', '1980.00', '0.00', '0.00', 'paid', '0.00', 1930),
(90, 0, 30, '940.00', '2020-11-30 16:49:35', 8, 1, '2020-11-30', '940.00', '0.00', '0.00', 'paid', '0.00', 1931),
(91, 0, 31, '940.00', '2020-11-30 16:50:35', 8, 1, '2020-11-30', '940.00', '0.00', '0.00', 'paid', '0.00', 1932),
(92, 0, 32, '2000.00', '2020-11-30 16:58:15', 8, 1, '2020-11-30', '2000.00', '0.00', '0.00', 'paid', '0.00', 1933),
(93, 0, 33, '3410.00', '2020-11-30 22:09:25', 8, 1, '2020-11-30', '3410.00', '0.00', '0.00', 'paid', '0.00', 1934),
(94, 0, 1, '8500.00', '2020-12-14 23:16:30', 8, 1, '2020-12-14', '8500.00', '0.00', '0.00', 'paid', '0.00', 1903),
(95, 1, 2, '4600.00', '2020-12-14 23:21:20', 8, 1, '2020-12-14', '4600.00', '0.00', '0.00', 'paid', '0.00', 1904),
(96, 1, 3, '3200.00', '2020-12-15 15:22:53', 8, 1, '2020-12-15', '3200.00', '0.00', '0.00', 'paid', '0.00', 1904),
(97, 1, 4, '9000.00', '2020-12-15 17:43:26', 8, 1, '2020-12-15', '9000.00', '0.00', '0.00', 'paid', '0.00', 1904),
(98, 1, 5, '1500.00', '2020-12-16 10:48:47', 8, 1, '2020-12-16', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(99, 1, 6, '2000.00', '2020-12-17 08:26:53', 8, 1, '2020-12-17', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(100, 1, 7, '2500.00', '2020-12-17 10:03:56', 8, 1, '2020-12-17', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(101, 1, 8, '2050.00', '2020-12-17 17:51:31', 8, 1, '2020-12-17', '2050.00', '0.00', '0.00', 'paid', '0.00', 1901),
(102, 1, 9, '14000.00', '2020-12-22 17:56:06', 8, 1, '2020-12-22', '14000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(103, 0, 10, '2600.00', '2020-12-22 21:25:57', 8, 1, '2020-12-22', '2600.00', '0.00', '0.00', 'paid', '0.00', 1902),
(104, 0, 11, '2500.00', '2020-12-23 16:23:46', 8, 1, '2020-12-23', '2500.00', '0.00', '0.00', 'paid', '0.00', 1903),
(105, 1, 12, '5600.00', '2020-12-23 16:41:50', 8, 1, '2020-12-23', '5600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(106, 1, 13, '14500.00', '2020-12-27 17:30:54', 8, 1, '2020-12-27', '14500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(107, 1, 14, '8000.00', '2020-12-28 16:54:42', 8, 1, '2020-12-28', '8000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(108, 1, 15, '1500.00', '2020-12-28 17:28:49', 8, 1, '2020-12-28', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(109, 1, 16, '1500.00', '2020-12-28 17:30:29', 8, 1, '2020-12-28', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(110, 1, 17, '1500.00', '2020-12-31 09:21:33', 8, 1, '2020-12-31', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(111, 1, 18, '500.00', '2020-12-31 09:23:39', 8, 1, '2020-12-31', '500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(112, 1, 19, '1500.00', '2020-12-31 11:08:58', 8, 1, '2020-12-31', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(113, 1, 20, '1000.00', '2020-12-31 13:12:43', 8, 1, '2020-12-31', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(114, 1, 21, '2000.00', '2021-01-01 10:10:31', 8, 1, '2021-01-01', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(115, 1, 22, '2500.00', '2021-01-01 10:21:25', 8, 1, '2021-01-01', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(116, 1, 23, '2000.00', '2021-01-01 12:28:39', 8, 1, '2021-01-01', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(117, 1, 24, '1500.00', '2021-01-01 23:10:14', 8, 1, '2021-01-01', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(118, 1, 25, '1500.00', '2021-01-01 23:24:07', 8, 1, '2021-01-01', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(119, 1, 26, '750.00', '2021-01-01 23:26:36', 8, 1, '2021-01-01', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(120, 1, 27, '1500.00', '2021-01-03 11:30:32', 8, 1, '2021-01-03', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(121, 1, 28, '900.00', '2021-01-03 11:33:12', 8, 1, '2021-01-03', '900.00', '0.00', '0.00', 'paid', '0.00', 1901),
(122, 1, 29, '1500.00', '2021-01-04 13:35:11', 8, 1, '2021-01-04', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(123, 1, 30, '1000.00', '2021-01-04 14:33:10', 8, 1, '2021-01-04', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(124, 1, 31, '1500.00', '2021-01-04 17:14:28', 8, 1, '2021-01-04', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(125, 1, 32, '0.00', '2021-01-05 14:08:56', 8, 1, '2021-01-05', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(126, 1, 33, '2200.00', '2021-01-05 14:11:19', 8, 1, '2021-01-05', '2200.00', '0.00', '0.00', 'paid', '0.00', 1901),
(127, 1, 34, '2500.00', '2021-01-08 12:04:19', 8, 1, '2021-01-08', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(128, 0, 35, '6150.00', '2021-01-11 14:51:46', 8, 1, '2021-01-11', '6150.00', '0.00', '0.00', 'paid', '0.00', 1901),
(129, 1, 36, '2000.00', '2021-01-11 21:00:56', 8, 1, '2021-01-11', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(130, 1, 37, '1250.00', '2021-01-11 21:05:52', 8, 1, '2021-01-11', '1250.00', '0.00', '0.00', 'paid', '0.00', 1901),
(131, 1, 38, '4500.00', '2021-01-14 20:21:54', 8, 1, '2021-01-14', '4500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(132, 1, 39, '3000.00', '2021-01-18 21:08:52', 8, 1, '2021-01-18', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(133, 1, 40, '23000.00', '2021-01-19 20:50:45', 8, 1, '2021-01-19', '23000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(134, 1, 41, '1500.00', '2021-01-21 20:50:58', 8, 1, '2021-01-21', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(135, 1, 42, '1000.00', '2021-02-01 08:17:39', 8, 1, '2021-02-01', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(136, 1, 43, '10000.00', '2021-02-01 08:21:45', 8, 1, '2021-02-01', '10000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(137, 1, 44, '3500.00', '2021-02-03 08:52:58', 8, 1, '2021-02-03', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(138, 1, 45, '3500.00', '2021-02-03 17:48:26', 8, 1, '2021-02-03', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(139, 1, 46, '5000.00', '2021-02-06 10:00:23', 8, 1, '2021-02-06', '5000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(140, 1, 47, '5200.00', '2021-02-06 10:05:25', 8, 1, '2021-02-06', '5200.00', '0.00', '0.00', 'paid', '0.00', 1901),
(141, 1, 48, '0.00', '2021-02-10 14:45:53', 8, 1, '2021-02-10', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(142, 1, 49, '1500.00', '2021-02-10 14:52:34', 8, 1, '2021-02-10', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(143, 1, 50, '750.00', '2021-02-11 10:22:09', 8, 1, '2021-02-11', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(144, 1, 51, '4200.00', '2021-02-11 22:26:04', 8, 1, '2021-02-11', '4200.00', '0.00', '0.00', 'paid', '0.00', 1901),
(145, 1, 52, '20800.00', '2021-02-14 11:03:48', 8, 1, '2021-02-14', '20800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(146, 1, 53, '10700.00', '2021-02-14 11:04:24', 8, 1, '2021-02-14', '10700.00', '0.00', '0.00', 'paid', '0.00', 1901),
(147, 1, 54, '1500.00', '2021-02-17 16:20:55', 8, 1, '2021-02-17', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(148, 1, 55, '2000.00', '2021-02-19 11:43:07', 8, 1, '2021-02-19', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(149, 1, 56, '15600.00', '2021-02-19 16:59:56', 8, 1, '2021-02-19', '15600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(150, 1, 57, '12000.00', '2021-02-25 22:05:17', 8, 1, '2021-02-25', '12000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(151, 1, 58, '15600.00', '2021-02-26 09:02:39', 8, 1, '2021-02-26', '15600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(152, 1, 59, '2500.00', '2021-02-27 14:27:59', 8, 1, '2021-02-27', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(153, 1, 60, '3000.00', '2021-03-02 11:33:15', 8, 1, '2021-03-02', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(154, 1, 61, '3000.00', '2021-03-07 13:19:56', 8, 1, '2021-03-07', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(155, 1, 62, '2700.00', '2021-03-07 13:23:43', 8, 1, '2021-03-07', '2700.00', '0.00', '0.00', 'paid', '0.00', 1901),
(156, 1, 63, '100.00', '2021-03-08 00:31:18', 8, 1, '2021-03-08', '100.00', '0.00', '0.00', 'paid', '0.00', 1901),
(157, 1, 64, '1800.00', '2021-03-08 00:36:54', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(158, 1, 65, '1800.00', '2021-03-08 00:37:57', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(159, 1, 66, '1800.00', '2021-03-08 00:39:03', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(160, 1, 67, '1800.00', '2021-03-08 00:42:01', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(161, 1, 68, '1800.00', '2021-03-08 00:43:00', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(162, 1, 69, '1800.00', '2021-03-08 00:56:01', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(163, 1, 70, '1800.00', '2021-03-08 00:57:13', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(164, 1, 71, '1800.00', '2021-03-08 01:00:33', 8, 1, '2021-03-08', '1800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(165, 1, 72, '8500.00', '2021-03-08 01:01:02', 8, 1, '2021-03-08', '8500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(166, 1, 73, '4500.00', '2021-03-11 15:32:14', 8, 1, '2021-03-11', '4500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(167, 1, 74, '2700.00', '2021-03-12 09:16:39', 8, 1, '2021-03-12', '2700.00', '0.00', '0.00', 'paid', '0.00', 1901),
(168, 1, 75, '10000.00', '2021-03-16 15:20:01', 8, 1, '2021-03-16', '10000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(169, 1, 76, '1500.00', '2021-03-16 15:25:07', 8, 1, '2021-03-16', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(170, 1, 77, '1500.00', '2021-03-18 18:06:57', 8, 1, '2021-03-18', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(171, 1, 78, '1300.00', '2021-03-20 18:24:05', 8, 1, '2021-03-20', '1300.00', '0.00', '0.00', 'paid', '0.00', 1901),
(172, 1, 79, '2500.00', '2021-03-25 14:31:37', 8, 1, '2021-03-25', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(173, 1, 80, '7500.00', '2021-03-27 15:10:26', 8, 1, '2021-03-27', '7500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(174, 1, 81, '10800.00', '2021-03-31 17:11:31', 8, 1, '2021-03-31', '10800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(175, 1, 82, '4000.00', '2021-03-31 17:13:05', 8, 1, '2021-03-31', '4000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(176, 1, 83, '10000.00', '2021-04-06 07:47:02', 8, 1, '2021-04-06', '10000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(177, 1, 84, '6380.00', '2021-04-07 09:31:42', 8, 1, '2021-04-07', '6380.00', '0.00', '0.00', 'paid', '0.00', 1901),
(178, 1, 85, '1500.00', '2021-04-09 19:48:13', 8, 1, '2021-04-09', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(179, 1, 86, '9500.00', '2021-04-11 05:15:33', 8, 1, '2021-04-11', '9500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(180, 1, 87, '1000.00', '2021-04-11 05:17:14', 8, 1, '2021-04-11', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(181, 1, 88, '750.00', '2021-04-13 16:16:23', 8, 1, '2021-04-13', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(182, 1, 89, '1000.00', '2021-04-16 13:52:36', 8, 1, '2021-04-16', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(183, 1, 90, '600.00', '2021-04-16 13:54:14', 8, 1, '2021-04-16', '600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(184, 1, 91, '6600.00', '2021-04-19 17:22:16', 8, 1, '2021-04-19', '6600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(185, 1, 92, '5000.00', '2021-04-20 12:28:01', 8, 1, '2021-04-20', '5000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(186, 1, 93, '3000.00', '2021-04-26 19:05:45', 8, 1, '2021-04-26', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(187, 1, 94, '2500.00', '2021-04-27 15:57:02', 8, 1, '2021-04-27', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(188, 1, 95, '3000.00', '2021-04-29 19:11:12', 8, 1, '2021-04-29', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(189, 1, 96, '2500.00', '2021-05-03 10:30:27', 8, 1, '2021-05-03', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(190, 1, 97, '2500.00', '2021-05-04 14:51:39', 8, 1, '2021-05-04', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(191, 1, 98, '1250.00', '2021-05-04 14:52:12', 8, 1, '2021-05-04', '1250.00', '0.00', '0.00', 'paid', '0.00', 1901),
(192, 1, 99, '1000.00', '2021-05-04 14:52:43', 8, 1, '2021-05-04', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(193, 1, 100, '6950.00', '2021-05-07 08:16:04', 8, 1, '2021-05-07', '6950.00', '0.00', '0.00', 'paid', '0.00', 1901),
(194, 1, 101, '6950.00', '2021-05-09 11:44:00', 8, 1, '2021-05-09', '6950.00', '0.00', '0.00', 'paid', '0.00', 1901),
(195, 1, 102, '2500.00', '2021-05-10 11:28:25', 8, 1, '2021-05-10', '2500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(196, 1, 103, '3000.00', '2021-05-13 10:26:10', 8, 1, '2021-05-13', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(197, 1, 104, '36800.00', '2021-05-15 14:38:30', 8, 1, '2021-05-15', '36800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(198, 1, 105, '16600.00', '2021-05-18 22:11:34', 8, 1, '2021-05-18', '16600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(199, 1, 106, '13800.00', '2021-05-20 08:37:01', 8, 1, '2021-05-20', '13800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(200, 1, 107, '11500.00', '2021-05-26 15:15:10', 8, 1, '2021-05-26', '11500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(201, 1, 108, '13000.00', '2021-05-28 16:44:13', 8, 1, '2021-05-28', '13000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(202, 1, 109, '3000.00', '2021-06-02 09:22:43', 8, 1, '2021-06-02', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(203, 1, 110, '3500.00', '2021-06-03 22:46:37', 8, 1, '2021-06-03', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(204, 1, 111, '3000.00', '2021-06-04 17:10:22', 8, 1, '2021-06-04', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(205, 1, 112, '19600.00', '2021-06-10 13:48:28', 8, 1, '2021-06-10', '19600.00', '0.00', '0.00', 'paid', '0.00', 1901),
(206, 1, 113, '3000.00', '2021-06-17 08:43:33', 8, 1, '2021-06-17', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(207, 1, 114, '8260.00', '2021-06-21 12:14:12', 8, 1, '2021-06-21', '8260.00', '0.00', '0.00', 'paid', '0.00', 1901),
(208, 1, 115, '4120.00', '2021-06-22 13:54:29', 8, 1, '2021-06-22', '4120.00', '0.00', '0.00', 'paid', '0.00', 1901),
(209, 1, 116, '6500.00', '2021-06-24 10:49:19', 8, 1, '2021-06-24', '6500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(210, 1, 117, '2800.00', '2021-06-28 18:34:12', 8, 1, '2021-06-28', '2800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(211, 1, 118, '9000.00', '2021-07-01 11:46:08', 8, 1, '2021-07-01', '9000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(212, 1, 119, '26800.00', '2021-07-03 14:45:08', 8, 1, '2021-07-03', '26800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(213, 1, 120, '2800.00', '2021-07-07 11:37:21', 8, 1, '2021-07-07', '2800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(214, 1, 121, '1350.00', '2021-07-15 15:49:57', 8, 1, '2021-07-15', '1350.00', '0.00', '0.00', 'paid', '0.00', 1901),
(215, 1, 122, '3540.00', '2021-07-19 09:49:45', 8, 1, '2021-07-19', '3540.00', '0.00', '0.00', 'paid', '0.00', 1901),
(216, 1, 123, '8500.00', '2021-07-28 10:13:18', 8, 1, '2021-07-28', '8500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(217, 1, 124, '13000.00', '2021-07-28 17:05:25', 8, 1, '2021-07-28', '13000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(218, 1, 125, '9000.00', '2021-07-31 12:25:07', 8, 1, '2021-07-31', '9000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(219, 1, 126, '3000.00', '2021-08-01 09:46:58', 8, 1, '2021-08-01', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(220, 1, 127, '3000.00', '2021-08-04 17:22:12', 8, 1, '2021-08-04', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(221, 1, 128, '1700.00', '2021-08-07 11:43:30', 8, 1, '2021-08-07', '1700.00', '0.00', '0.00', 'paid', '0.00', 1901),
(222, 1, 129, '500.00', '2021-08-18 13:38:31', 8, 1, '2021-08-18', '500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(223, 1, 130, '10500.00', '2021-08-21 11:53:40', 8, 1, '2021-08-21', '10500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(224, 1, 131, '1450.00', '2021-08-27 17:32:20', 8, 1, '2021-08-27', '1450.00', '0.00', '0.00', 'paid', '0.00', 1901),
(225, 1, 132, '8300.00', '2021-08-31 11:47:13', 8, 1, '2021-08-31', '8300.00', '0.00', '0.00', 'paid', '0.00', 1901),
(226, 1, 133, '1000.00', '2021-08-31 13:34:21', 8, 1, '2021-08-31', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(227, 1, 134, '780.00', '2021-09-02 16:53:27', 8, 1, '2021-09-02', '780.00', '0.00', '0.00', 'paid', '0.00', 1901),
(228, 1, 135, '10000.00', '2021-09-03 16:46:40', 8, 1, '2021-09-03', '10000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(229, 1, 136, '4000.00', '2021-09-06 14:48:33', 8, 1, '2021-09-06', '4000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(230, 1, 137, '12000.00', '2021-09-07 13:43:25', 8, 1, '2021-09-07', '12000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(231, 1, 138, '3000.00', '2021-09-10 14:35:52', 8, 1, '2021-09-10', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(232, 1, 139, '2000.00', '2021-09-15 15:00:57', 8, 1, '2021-09-15', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(233, 1, 140, '8000.00', '2021-09-19 10:39:47', 8, 1, '2021-09-19', '8000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(234, 1, 141, '4000.00', '2021-09-20 15:39:31', 8, 1, '2021-09-20', '4000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(235, 1, 142, '450.00', '2021-09-22 08:48:59', 8, 1, '2021-09-22', '450.00', '0.00', '0.00', 'paid', '0.00', 1901),
(236, 1, 143, '3000.00', '2021-09-22 14:52:26', 8, 1, '2021-09-22', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(237, 1, 144, '12800.00', '2021-09-27 15:37:07', 8, 1, '2021-09-27', '12800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(238, 1, 145, '12800.00', '2021-10-02 08:36:36', 8, 1, '2021-10-02', '12800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(239, 1, 146, '15000.00', '2021-10-09 08:51:00', 8, 1, '2021-10-09', '15000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(240, 1, 147, '2000.00', '2021-10-15 10:55:40', 8, 1, '2021-10-15', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(241, 1, 148, '3700.00', '2021-10-18 09:18:57', 8, 1, '2021-10-18', '3700.00', '0.00', '0.00', 'paid', '0.00', 1901),
(242, 1, 149, '6000.00', '2021-10-20 08:38:06', 8, 1, '2021-10-20', '6000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(243, 1, 150, '450.00', '2021-10-21 11:24:08', 8, 1, '2021-10-21', '450.00', '0.00', '0.00', 'paid', '0.00', 1901),
(244, 1, 151, '18400.00', '2021-10-25 16:53:58', 8, 1, '2021-10-25', '18400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(245, 1, 152, '3000.00', '2021-10-27 08:47:04', 8, 1, '2021-10-27', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(246, 1, 153, '450.00', '2021-10-27 08:48:58', 8, 1, '2021-10-27', '450.00', '0.00', '0.00', 'paid', '0.00', 1901),
(247, 1, 154, '3500.00', '2021-11-01 08:22:09', 8, 1, '2021-11-01', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(248, 1, 155, '3500.00', '2021-11-08 08:24:43', 8, 1, '2021-11-08', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(249, 1, 156, '65000.00', '2021-11-08 13:03:45', 8, 1, '2021-11-08', '65000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(250, 1, 157, '1000.00', '2021-11-10 08:56:26', 8, 1, '2021-11-10', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(251, 1, 158, '4000.00', '2021-11-12 08:24:35', 8, 1, '2021-11-12', '4000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(252, 1, 159, '6500.00', '2021-11-12 08:25:45', 8, 1, '2021-11-12', '6500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(253, 1, 160, '5400.00', '2021-11-17 13:07:16', 8, 1, '2021-11-17', '5400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(254, 1, 161, '11000.00', '2021-11-17 13:10:44', 8, 1, '2021-11-17', '11000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(255, 1, 162, '2000.00', '2021-11-26 13:47:30', 8, 1, '2021-11-26', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(256, 1, 163, '7000.00', '2021-11-27 06:54:26', 8, 1, '2021-11-27', '7000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(257, 1, 164, '450.00', '2021-11-29 13:30:22', 8, 1, '2021-11-29', '450.00', '0.00', '0.00', 'paid', '0.00', 1901),
(258, 1, 165, '7800.00', '2021-11-30 08:53:32', 8, 1, '2021-11-30', '7800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(259, 1, 166, '5000.00', '2021-11-30 08:54:29', 8, 1, '2021-11-30', '5000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(260, 1, 167, '2000.00', '2021-12-01 08:42:55', 8, 1, '2021-12-01', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(261, 1, 168, '3000.00', '2021-12-01 16:15:40', 8, 1, '2021-12-01', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(262, 1, 169, '2000.00', '2021-12-02 15:26:01', 8, 1, '2021-12-02', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(263, 0, 170, '3000.00', '2021-12-07 14:46:28', 8, 1, '2021-12-07', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(264, 0, 171, '1500.00', '2021-12-08 12:55:58', 8, 1, '2021-12-08', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(265, 1, 172, '3500.00', '2021-12-10 11:30:47', 8, 1, '2021-12-10', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(266, 1, 173, '0.00', '2021-12-10 18:12:39', 8, 1, '2021-12-10', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(267, 1, 174, '0.00', '2021-12-10 18:12:42', 8, 1, '2021-12-10', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(268, 1, 175, '2000.00', '2021-12-10 18:13:08', 8, 1, '2021-12-10', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(269, 0, 176, '3000.00', '2021-12-14 11:45:14', 8, 1, '2021-12-14', '3000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(270, 0, 177, '1000.00', '2021-12-14 14:00:36', 8, 1, '2021-12-14', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(271, 0, 178, '1500.00', '2021-12-15 15:07:33', 8, 1, '2021-12-15', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(272, 1, 179, '3500.00', '2021-12-16 11:28:56', 8, 1, '2021-12-16', '3500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(273, 0, 180, '1500.00', '2021-12-21 14:59:06', 8, 1, '2021-12-21', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(274, 1, 181, '500.00', '2021-12-21 14:59:38', 8, 1, '2021-12-21', '500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(275, 1, 182, '5000.00', '2021-12-22 15:04:50', 8, 1, '2021-12-22', '5000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(276, 0, 183, '1000.00', '2021-12-22 17:11:13', 8, 1, '2021-12-22', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(277, 0, 184, '2000.00', '2021-12-23 17:19:13', 8, 1, '2021-12-23', '2000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(278, 1, 185, '1000.00', '2021-12-23 17:20:57', 8, 1, '2021-12-23', '1000.00', '0.00', '0.00', 'paid', '0.00', 1901),
(279, 0, 186, '1500.00', '2021-12-24 11:15:10', 8, 1, '2021-12-24', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(280, 0, 187, '1500.00', '2021-12-27 16:02:23', 8, 1, '2021-12-27', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(281, 0, 188, '1500.00', '2021-12-29 11:26:53', 8, 1, '2021-12-29', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(282, 0, 189, '1500.00', '2021-12-30 10:34:42', 8, 1, '2021-12-30', '1500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(283, 1, 1, '800.00', '2022-01-08 09:35:32', 8, 1, '2022-01-08', '800.00', '0.00', '0.00', 'paid', '0.00', 1901),
(284, 1, 2, '750.00', '2022-01-08 09:40:47', 8, 1, '2022-01-08', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(285, 1, 3, '400.00', '2022-01-08 09:56:13', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(286, 1, 4, '400.00', '2022-01-08 09:57:15', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(287, 0, 5, '400.00', '2022-01-08 10:01:52', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(288, 1, 6, '400.00', '2022-01-08 11:45:31', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(289, 1, 7, '400.00', '2022-01-08 11:46:50', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(290, 1, 8, '400.00', '2022-01-08 12:27:26', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(291, 1, 9, '400.00', '2022-01-08 12:43:35', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(292, 1, 10, '400.00', '2022-01-08 12:55:36', 8, 1, '2022-01-08', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(293, 0, 11, '180.00', '2022-01-10 10:02:06', 13, 1, '2022-01-10', '180.00', '0.00', '0.00', 'paid', '0.00', 1901),
(294, 0, 12, '30.00', '2022-01-10 10:05:55', 13, 1, '2022-01-10', '30.00', '0.00', '0.00', 'paid', '0.00', 1901),
(295, 0, 13, '60.00', '2022-01-10 10:07:09', 13, 1, '2022-01-10', '60.00', '0.00', '0.00', 'paid', '0.00', 1901),
(296, 1, 14, '400.00', '2022-01-10 11:12:38', 8, 1, '2022-01-10', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(297, 1, 15, '750.00', '2022-01-10 11:21:52', 8, 1, '2022-01-10', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(298, 1, 1, '30.00', '2022-01-10 12:01:54', 13, 1, '2022-01-10', '30.00', '0.00', '0.00', 'paid', '0.00', 1901),
(299, 1, 2, '2.00', '2022-01-10 12:18:54', 13, 1, '2022-01-10', '2.00', '0.00', '0.00', 'paid', '0.00', 1901),
(300, 1, 3, '15.00', '2022-01-11 11:52:21', 13, 1, '2022-01-11', '15.00', '0.00', '0.00', 'paid', '0.00', 1901),
(301, 1, 4, '20.00', '2022-01-11 11:54:29', 13, 1, '2022-01-11', '20.00', '0.00', '0.00', 'paid', '0.00', 1901),
(302, 0, 5, '40.00', '2022-01-11 12:20:48', 13, 1, '2022-01-11', '40.00', '0.00', '0.00', 'paid', '0.00', 1901),
(303, 1, 6, '440.00', '2022-01-11 14:30:28', 13, 1, '2022-01-11', '440.00', '0.00', '0.00', 'paid', '0.00', 1901),
(304, 1, 7, '456.00', '2022-01-11 14:34:49', 13, 1, '2022-01-11', '456.00', '0.00', '0.00', 'paid', '0.00', 1901),
(305, 1, 8, '456.00', '2022-01-11 14:36:42', 13, 1, '2022-01-11', '456.00', '0.00', '0.00', 'paid', '0.00', 1901),
(306, 1, 9, '440.00', '2022-01-11 14:42:31', 13, 1, '2022-01-11', '440.00', '0.00', '0.00', 'paid', '0.00', 1901),
(307, 1, 10, '750.00', '2022-01-11 14:52:20', 13, 1, '2022-01-11', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(308, 1, 11, '1210.00', '2022-01-11 14:54:46', 13, 1, '2022-01-11', '1210.00', '0.00', '0.00', 'paid', '0.00', 1901),
(309, 1, 12, '1210.00', '2022-01-11 15:00:44', 13, 1, '2022-01-11', '1210.00', '0.00', '0.00', 'paid', '0.00', 1901),
(310, 1, 13, '880.00', '2022-01-11 15:03:18', 13, 1, '2022-01-11', '880.00', '0.00', '0.00', 'paid', '0.00', 1901),
(311, 1, 14, '50.00', '2022-01-11 15:16:28', 13, 1, '2022-01-11', '50.00', '0.00', '0.00', 'paid', '0.00', 1901),
(312, 1, 15, '30.00', '2022-01-11 15:36:20', 13, 1, '2022-01-11', '30.00', '0.00', '0.00', 'paid', '0.00', 1901),
(313, 1, 16, '900.00', '2022-01-11 16:03:04', 13, 1, '2022-01-11', '900.00', '0.00', '0.00', 'paid', '0.00', 1901),
(314, 1, 17, '620.00', '2022-01-11 16:05:18', 13, 1, '2022-01-11', '620.00', '0.00', '0.00', 'paid', '0.00', 1901),
(315, 1, 18, '500.00', '2022-01-11 16:07:22', 13, 1, '2022-01-11', '500.00', '0.00', '0.00', 'paid', '0.00', 1901),
(316, 1, 19, '676.00', '2022-01-11 16:10:18', 13, 1, '2022-01-11', '676.00', '0.00', '0.00', 'paid', '0.00', 1901),
(317, 1, 20, '676.00', '2022-01-11 16:13:43', 13, 1, '2022-01-11', '676.00', '0.00', '0.00', 'paid', '0.00', 1901),
(318, 1, 21, '400.00', '2022-01-11 16:17:47', 13, 1, '2022-01-11', '400.00', '0.00', '0.00', 'paid', '0.00', 1901),
(319, 1, 22, '750.00', '2022-01-14 09:56:43', 13, 1, '2022-01-14', '750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(320, 1, 23, '1250.00', '2022-01-14 09:58:34', 13, 1, '2022-01-14', '1250.00', '0.00', '0.00', 'paid', '0.00', 1901),
(321, 1, 24, '2750.00', '2022-01-14 10:00:19', 13, 1, '2022-01-14', '2750.00', '0.00', '0.00', 'paid', '0.00', 1901),
(322, 1, 25, '440.00', '2022-01-17 10:22:26', 13, 1, '2022-01-17', '440.00', '0.00', '0.00', 'paid', '0.00', 1901),
(323, 1, 26, '276.00', '2022-01-17 13:24:34', 13, 1, '2022-01-17', '276.00', '0.00', '0.00', 'paid', '0.00', 1901),
(324, 1, 27, '296.00', '2022-01-17 13:37:26', 13, 1, '2022-01-17', '296.00', '0.00', '0.00', 'paid', '0.00', 1901),
(325, 1, 28, '93.00', '2022-01-17 15:13:29', 12, 1, '2022-01-17', '93.00', '0.00', '0.00', 'paid', '0.00', 1901),
(326, 1, 29, '458.00', '2022-01-17 15:45:58', 12, 1, '2022-01-17', '458.00', '0.00', '0.00', 'paid', '0.00', 1901),
(327, 1, 30, '93.00', '2022-01-18 10:09:06', 13, 1, '2022-01-18', '93.00', '0.00', '0.00', 'paid', '0.00', 1901),
(328, 1, 31, '575.00', '2022-01-18 11:36:16', 13, 1, '2022-01-18', '575.00', '0.00', '0.00', 'paid', '0.00', 1901),
(329, 1, 32, '86.00', '2022-01-18 11:37:36', 13, 1, '2022-01-18', '86.00', '0.00', '0.00', 'paid', '0.00', 1901),
(330, 1, 33, '33.00', '2022-01-18 12:09:55', 13, 1, '2022-01-18', '33.00', '0.00', '0.00', 'paid', '0.00', 1901),
(331, 1, 34, '210.00', '2022-01-21 09:37:59', 8, 1, '2022-01-21', '210.00', '0.00', '0.00', 'paid', '0.00', 1901),
(332, 1, 35, '50.00', '2022-01-21 12:19:43', 13, 1, '2022-01-21', '50.00', '0.00', '0.00', 'paid', '0.00', 1901),
(333, 1, 36, '98.00', '2022-01-26 10:47:22', 13, 1, '2022-01-26', '98.00', '0.00', '0.00', 'paid', '0.00', 1901),
(334, 1, 37, '1879.00', '2022-01-26 10:51:23', 13, 1, '2022-01-26', '1879.00', '0.00', '0.00', 'paid', '0.00', 1901),
(335, 1, 38, '90.00', '2022-01-26 11:12:09', 13, 1, '2022-01-26', '90.00', '0.00', '0.00', 'paid', '0.00', 1901),
(336, 1, 39, '70.00', '2022-01-26 11:53:30', 13, 1, '2022-01-26', '70.00', '0.00', '0.00', 'paid', '0.00', 1901),
(337, 1, 40, '72.00', '2022-02-02 14:32:33', 13, 1, '2022-02-02', '72.00', '0.00', '0.00', 'paid', '0.00', 1901),
(338, 1, 41, '246.00', '2022-02-02 14:34:22', 13, 1, '2022-02-02', '246.00', '0.00', '0.00', 'paid', '0.00', 1901),
(339, 1, 42, '270.00', '2022-05-25 17:11:55', 12, 1, '2022-05-25', '270.00', '0.00', '0.00', 'paid', '0.00', 1901),
(340, 1, 43, '428.00', '2022-09-01 12:25:52', 8, 1, '2022-09-01', '428.00', '0.00', '0.00', 'paid', '0.00', 1901),
(341, 1, 44, '140.00', '2022-09-01 12:26:29', 8, 1, '2022-09-01', '140.00', '0.00', '0.00', 'paid', '0.00', 1901),
(342, 1, 45, '555.00', '2022-09-24 21:39:45', 8, 1, '2022-09-24', '555.00', '0.00', '0.00', 'paid', '0.00', 1901),
(343, 0, 46, '695.00', '2022-09-25 19:07:08', 8, 1, '2022-09-25', '695.00', '0.00', '0.00', 'paid', '0.00', 1901),
(344, 1, 47, '40.00', '2022-09-25 19:27:39', 8, 1, '2022-09-25', '40.00', '0.00', '0.00', 'paid', '0.00', 1901),
(345, 1, 47, '835.00', '2022-11-17 10:40:29', 8, 1, '2022-11-17', '835.00', '0.00', '0.00', 'paid', '0.00', 1901),
(346, 1, 48, '140.00', '2022-11-17 11:35:15', 8, 1, '2022-11-17', '140.00', '0.00', '0.00', 'paid', '0.00', 1901),
(347, 1, 49, '140.00', '2022-11-17 13:06:07', 8, 1, '2022-11-17', '140.00', '0.00', '0.00', 'paid', '0.00', 1901),
(348, 1, 50, '260.00', '2022-11-17 13:09:00', 8, 1, '2022-11-17', '260.00', '0.00', '0.00', 'paid', '0.00', 1901),
(349, 1, 51, '243.00', '2022-11-17 14:12:01', 8, 1, '2022-11-17', '243.00', '0.00', '0.00', 'paid', '0.00', 1901),
(350, 1, 52, '135.00', '2022-11-19 15:48:36', 8, 1, '2022-11-19', '135.00', '0.00', '0.00', 'paid', '0.00', 1901),
(351, 1, 53, '151.00', '2023-01-28 10:58:55', 8, 1, '2023-01-28', '151.00', '0.00', '0.00', 'paid', '0.00', 1901),
(352, 0, 54, '6.00', '2023-08-11 15:01:06', 8, 1, '2023-08-11', '6.00', '0.00', '0.00', 'paid', '0.00', 1901),
(353, 0, 55, '0.00', '2023-09-04 13:32:14', 8, 1, '2023-09-04', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(354, 0, 56, '0.00', '2023-09-04 14:05:18', 8, 1, '2023-09-04', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(355, 0, 57, '0.00', '2023-09-04 14:06:45', 8, 1, '2023-09-04', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(356, 0, 58, '35.00', '2023-09-04 14:55:51', 8, 1, '2023-09-04', '35.00', '0.00', '0.00', 'paid', '0.00', 1901),
(357, 0, 59, '350.00', '2023-09-04 15:08:54', 8, 1, '2023-09-04', '350.00', '0.00', '0.00', 'paid', '0.00', 1901),
(358, 0, 60, '3.00', '2023-09-04 15:19:39', 8, 1, '2023-09-04', '3.00', '0.00', '0.00', 'paid', '0.00', 1901),
(359, 0, 61, '12.00', '2023-09-04 15:20:07', 8, 1, '2023-09-04', '12.00', '0.00', '0.00', 'paid', '0.00', 1901),
(360, 0, 62, '290.00', '2023-09-04 15:26:29', 8, 1, '2023-09-04', '290.00', '0.00', '0.00', 'paid', '0.00', 1901),
(361, 0, 63, '145.00', '2023-09-04 15:32:30', 8, 1, '2023-09-04', '145.00', '0.00', '0.00', 'paid', '0.00', 1901),
(362, 0, 64, '230.00', '2023-09-04 15:35:36', 8, 1, '2023-09-04', '230.00', '0.00', '0.00', 'paid', '0.00', 1901),
(363, 0, 204, '0.00', '2023-09-21 15:39:59', 8, 1, '2023-09-21', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(364, 1, 264, '980.00', '2023-10-04 12:32:53', 8, 1, '2023-10-04', '980.00', '0.00', '0.00', 'paid', '0.00', 1901),
(365, 1, 265, '0.00', '2023-10-04 12:34:05', 8, 1, '2023-10-04', '0.00', '0.00', '0.00', 'paid', '0.00', 1901),
(366, 1, 266, '250.00', '2023-10-04 12:36:27', 8, 1, '2023-10-04', '250.00', '0.00', '0.00', 'paid', '0.00', 1901),
(367, 1, 267, '250.00', '2023-10-04 12:37:02', 8, 1, '2023-10-04', '250.00', '0.00', '0.00', 'paid', '0.00', 1901);

-- --------------------------------------------------------

--
-- Table structure for table `payment_account`
--

CREATE TABLE IF NOT EXISTS `payment_account` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `description` text NOT NULL,
  `balance` text NOT NULL,
  `detail_type` text NOT NULL,
  `account_type` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_account`
--

INSERT INTO `payment_account` (`id`, `name`, `date`, `description`, `balance`, `detail_type`, `account_type`) VALUES
(6, 'Cash and cash equivalants', '2023-10-06 07:31:16.568810', 'Testing 1', '70', 'Client trust account', 'Credit Card'),
(7, 'Fixed Assets', '2023-10-04 09:11:15.115349', 'Testing 2', '2000', 'Cash and Cash Eqivilants', 'Cash & Cash Equivilants'),
(13, 'Long-term investments', '2023-10-04 09:11:23.067908', 'Testing 3', '3000', 'Client trust account', 'Cash & Cash Equivilants'),
(14, 'Owners Equity', '2023-10-04 09:11:28.144359', 'Testing 4', '4000', 'Cash on Hand', 'Credit Card'),
(15, 'Marketing', '2023-10-04 09:11:33.002139', ' For Brand Exposure', '5000', 'Money Market', 'Cash & Cash Equivilants');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_desc` varchar(500) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_sell_price` text NOT NULL,
  `prod_pic` varchar(300) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `prod_qty` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `reorder` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `belongs_to` int(12) NOT NULL,
  `stock_branch_id` int(12) NOT NULL,
  `barcode` text NOT NULL,
  `manufactor_date` text NOT NULL,
  `expire_date` text NOT NULL,
  `wholesale_price` text,
  `discount_price` int(12) NOT NULL,
  `special_price` text,
  `currency_id` text NOT NULL,
  `vat_status` text NOT NULL,
  `pack_size` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_sell_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`, `date_added`, `belongs_to`, `stock_branch_id`, `barcode`, `manufactor_date`, `expire_date`, `wholesale_price`, `discount_price`, `special_price`, `currency_id`, `vat_status`, `pack_size`) VALUES
(1, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules 180s (1x12)', '0.00', '825', 'default.gif', 59, '25', 1, 0, 17, '0', '2023-09-21 19:00:25', 4, 4, '1', '', '', '0', 0, '0', '', '', '0'),
(2, 'Moringa Miracle Green Tea (1x12)', 'Moringa Miracle Green Tea (1x12)', '0.00', '220', 'default.gif', 59, '14', 1, 0, 17, '0', '2023-09-21 20:13:37', 4, 4, '3', '', '', '0', 0, '0', '', '', '0'),
(3, 'Moringa Powder (Bulk per KG)', 'Moringa Powder (Bulk per KG)', '0.00', '51', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '4', '', '', '0', 0, '0', '', '', ''),
(4, 'Moringa Green Tea (Single)', 'Moringa Green Tea (Single)', '0.00', '25', 'default.gif', 59, '11', 1, 0, 17, '0', '2023-09-11 21:02:35', 4, 4, '6', '', '', '0', 0, '0', '', '', '0'),
(5, 'Moringa Capsules 180s (Singles)', 'Moringa Capsules 180s (Singles)', '0.00', '90', 'default.gif', 59, '7', 1, 0, 17, '0', '2023-09-22 07:24:32', 4, 4, '7', '', '', '0', 0, '0', '', '', '0'),
(7, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '0.00', '640', '', 59, '6', 1, 0, 17, '', '2023-09-21 21:34:17', 4, 4, '14', '', '', '0', 0, '0', '', '', ''),
(8, 'Moringa S.U.P. 250g Powder (Single)', 'Moringa S.U.P. 250g Powder (Single)', '0.00', '60', '', 59, '74', 1, 0, 17, '', '2023-10-04 10:32:53', 4, 4, '20', '', '', '0', 0, '0', '', '', ''),
(9, 'Moringa Human Powder 100g (1x10)', 'Moringa Human Powder 100g (1x10)', '0.00', '230', '', 59, '45', 1, 0, 17, '', '2023-09-19 13:30:26', 4, 4, '25', '', '', '0', 0, '0', '', '', ''),
(10, 'prod_name', 'prod_desc', '0.00', 'prod_sell_price', 'prod_pic', 0, '0', 0, 0, 0, 'serial', '2022-01-07 11:51:37', 0, 0, 'barcode', '', '', 'warehouse_id', 0, 're', '', '', ''),
(11, '', '', '0.00', '', '', 0, '0', 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(12, 'Moringa Animal Supplement 6kg', 'Moringa Animal Supplement 6kg', '0.00', '140', '', 59, '140', 1, 0, 17, '', '2023-09-21 20:13:37', 4, 4, '42', '', '', '0', 0, '0', '', '', ''),
(13, 'Moringa Pet Food Suppliment (1x10)', 'Moringa Pet Food Suppliment (1x10)', '0.00', '195', '', 59, '10', 1, 0, 17, '', '2023-09-22 06:54:28', 4, 4, '43', '', '', '0', 0, '0', '', '', ''),
(14, 'Moringa Capsules 90s (Singles)', 'Moringa Capsules 90s (Singles)', '0.00', '56', '', 59, '9', 1, 0, 17, '', '2023-09-21 14:50:54', 4, 4, '45', '', '', '0', 0, '0', '', '', ''),
(15, 'Moringa 5KG Protein Pellets', 'Moringa 5KG Protein Pellets', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2023-09-19 14:39:03', 4, 4, '46', '', '', '0', 0, '0', '', '', ''),
(16, 'Moringa 200G Protein Pellets (10x200G)', 'Moringa 200G Protein Pellets (10x200G)', '0.00', '135', '', 59, '0', 1, 0, 17, '', '2023-09-06 06:36:52', 4, 4, '47', '', '', '0', 0, '0', '', '', ''),
(17, 'Moringa 200G Protein Pellets (Singles)', 'Moringa 200G Protein Pellets (Singles)', '0.00', '13', '', 59, '0', 1, 0, 17, '', '2023-09-10 10:48:19', 4, 4, '48', '', '', '0', 0, '0', '', '', ''),
(18, 'Moringa Animal Feed 200g (Singles)', 'Moringa Animal Feed 200g (Singles)', '0.00', '18', '', 59, '61', 1, 0, 17, '', '2023-10-04 10:51:15', 4, 4, '49', '', '', '0', 0, '0', '', '', ''),
(19, 'Assorted Moringa Tea Pack', 'Assorted Moringa Tea Pack', '0.00', '140', '', 59, '-5', 1, 0, 17, '', '2022-09-24 19:39:45', 4, 4, '50', '', '', '0', 0, '0', '', '', ''),
(20, 'Moringa Lemon Grass Infusion (1x12)', 'Moringa Lemon Grass Infusion (1x12)', '0.00', '250', 'default.gif', 59, '44', 1, 0, 17, '0', '2023-09-19 20:09:22', 4, 4, '52', '', '', '0', 0, '0', '', '', '0'),
(21, 'Moringa Ginger & Lemon Infusion (1x12)', 'Moringa Ginger & Lemon Infusion (1x12)', '0.00', '250', 'default.gif', 59, '8', 1, 0, 17, '0', '2023-09-21 19:59:28', 4, 4, '53', '', '', '0', 0, '0', '', '', '0'),
(22, 'Moringa Apple & Cinnamon Infusion (1x12)', 'Moringa Apple & Cinnamon Infusion (1x12)', '0.00', '250', '', 59, '24', 1, 0, 17, '', '2023-10-04 10:36:27', 4, 4, '54', '', '', '0', 0, '0', '', '', ''),
(23, 'Moringa Lemon Grass Infusion (Singles)', 'Moringa Lemon Grass Infusion (Singles)', '0.00', '30', 'default.gif', 59, '20', 1, 0, 17, '0', '2022-01-26 08:45:53', 4, 4, '57', '', '', '0', 0, '0', '', '', '0'),
(24, 'Moringa Ginger & Lemon Infusion (Singles)', 'Moringa Ginger & Lemon Infusion (Singles)', '0.00', '30', 'default.gif', 59, '1', 1, 0, 17, '0', '2023-09-11 19:45:00', 4, 4, '58', '', '', '0', 0, '0', '', '', '0'),
(25, 'Moringa Apple & Cinnamon Infusion (Singles)', 'Moringa Apple & Cinnamon Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '2023-09-21 13:53:59', 4, 4, '59', '', '', '0', 0, '0', '', '', ''),
(26, 'Moringa Pet Food Supplement (Singles)', 'Moringa Pet Food Supplement (Singles)', '0.00', '25', '', 59, '2', 1, 0, 17, '', '2023-10-04 10:34:05', 4, 4, '63', '', '', '0', 0, '0', '', '', ''),
(27, 'Moringa AFS 200g (1x10)', 'Moringa AFS 200g (1x10)', '0.00', '130', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '68', '', '', '0', 0, '0', '', '', ''),
(28, 'Sheep sales', 'Sheep sales', '0.00', '140', 'default.gif', 59, '7.5', 1, 0, 17, '0', '2023-09-09 09:43:59', 4, 4, '70', '', '', '0', 0, '0', '', '', 'KG'),
(29, 'Green Carrier Bags', 'Green Carrier Bags', '0.00', '3', '', 59, '0', 1, 0, 17, '', '2023-09-05 07:02:34', 4, 4, '71', '', '', '0', 0, '0', '', '', ''),
(30, 'Moringa Oil 100ml', 'Moringa Oil 100ml', '0.00', '120', '', 59, '72', 1, 0, 17, '', '2023-09-04 13:44:42', 4, 4, '72', '', '', '0', 0, '0', '', '', ''),
(31, 'Moringa Oil 50ML', 'Moringa Oil 50ML', '0.00', '60', '', 59, '37', 1, 0, 17, '', '2023-09-21 19:00:25', 4, 4, '73', '', '', '0', 0, '0', '', '', ''),
(32, 'Moringa Oil (Bulk per Litre)', 'Moringa Oil (Bulk per Litre)', '0.00', '960', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '74', '', '', '0', 0, '0', '', '', ''),
(33, 'ZAMOR STARTER PACK (24 PIECE)', 'ZAMOR STARTER PACK (24 PIECE)', '0.00', '670', 'default.gif', 62, '2', 1, 0, 17, '0', '2023-10-04 10:32:53', 4, 4, 'Z200', '', '', '0', 0, '0', '', '', 'EC'),
(34, 'ZAMOR PICNIC GOURMET SET', 'ZAMOR PICNIC GOURMET SET', '0.00', '275', 'default.gif', 62, '0', 1, 0, 17, '0', '2023-09-21 14:17:28', 4, 4, 'Z201', '', '', '0', 0, '0', '', '', 'EC'),
(35, 'ZAMOR STARTER PACK (12 PIECE)', 'ZAMOR STARTER PACK (12 PIECE)', '0.00', '371', 'default.gif', 62, '2', 1, 0, 17, '0', '2022-01-21 09:38:01', 4, 4, 'Z202', '', '', '0', 0, '0', '', '', 'EC'),
(36, 'ZAMOR CHADAROO CHUNKY 220G', 'ZAMOR CHADAROO CHUNKY 220G', '0.00', '55', 'default.gif', 62, '0', 1, 0, 17, '0', '2022-01-21 09:39:11', 4, 4, 'Z216', '', '', '0', 0, '0', '', '', 'EC'),
(37, 'ZAMOR CHADAROO PASTE 220G', 'ZAMOR CHADAROO PASTE 220G', '0.00', '55', '', 59, '65', 1, 0, 17, '', '2023-09-21 14:38:14', 4, 4, 'Z223', '', '', '0', 0, '0', '', '', ''),
(38, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '0.00', '45', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z254', '', '', '0', 0, '0', '', '', ''),
(39, 'ZAMOR CUCUMBER 550G', 'ZAMOR CUCUMBER 550G', '0.00', '33', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z278', '', '', '0', 0, '0', '', '', ''),
(40, 'ZAMOR CAJUN RUB 100g', 'ZAMOR CAJUN RUB 100g', '0.00', '35', '', 59, '103', 1, 0, 17, '', '2023-10-04 10:55:44', 4, 4, 'Z283', '', '', '0', 0, '0', '', '', ''),
(41, 'ZAMOR CHICKEN RUB 100g', 'ZAMOR CHICKEN RUB 100g', '0.00', '35', '', 59, '154', 1, 0, 17, '', '2023-10-04 10:55:44', 4, 4, 'Z290', '', '', '0', 0, '0', '', '', ''),
(42, 'ZAMOR LAMB RUB 100g', 'ZAMOR LAMB RUB 100g', '0.00', '35', '', 59, '78', 1, 0, 17, '', '2023-09-04 13:44:42', 4, 4, 'Z306', '', '', '0', 0, '0', '', '', ''),
(43, 'ZAMOR BASIL (100g)', 'ZAMOR BASIL (100g)', '0.00', '25', '', 59, '51', 1, 0, 17, '', '2022-02-02 12:40:29', 4, 4, 'Z413', '', '', '0', 0, '0', '', '', ''),
(44, 'ZAMOR CELERY (100g)', 'ZAMOR CELERY (100g)', '0.00', '25', '', 59, '204', 1, 0, 17, '', '2023-09-19 13:37:42', 4, 4, 'Z420', '', '', '0', 0, '0', '', '', ''),
(45, 'ZAMORFUNKY FENNEL (100g)', 'ZAMORFUNKY FENNEL (100g)', '0.00', '35', '', 59, '118', 1, 0, 17, '', '2023-09-21 14:38:34', 4, 4, 'Z437', '', '', '0', 0, '0', '', '', ''),
(46, 'ZAMOR GARLIC & SPRING ONION (100g)', 'ZAMOR GARLIC & SPRING ONION (100g)', '0.00', '25', '', 59, '390', 1, 0, 17, '', '2023-09-21 13:40:58', 4, 4, 'Z444', '', '', '0', 0, '0', '', '', ''),
(47, 'ZAMOR MIXED CHILLIES (100g)', 'ZAMOR MIXED CHILLIES (100g)', '0.00', '25', '', 59, '91', 1, 0, 17, '', '2023-09-21 13:31:04', 4, 4, 'Z451', '', '', '0', 0, '0', '', '', ''),
(48, 'ZAMOR MIXED HERBS (100g)', 'ZAMOR MIXED HERBS (100g)', '0.00', '25', '', 59, '81', 1, 0, 17, '', '2023-09-19 14:32:27', 4, 4, 'Z468', '', '', '0', 0, '0', '', '', ''),
(49, 'ZAMOR ORIGANUM (100g)', 'ZAMOR ORIGANUM (100g)', '0.00', '25', '', 59, '65', 1, 0, 17, '', '2023-09-21 14:17:28', 4, 4, 'Z475', '', '', '0', 0, '0', '', '', ''),
(50, 'ZAMOR CRUNCHY CORIANDER', 'ZAMOR CRUNCHY CORIANDER', '0.00', '35', '', 59, '104', 1, 0, 17, '', '2023-09-21 14:08:23', 4, 4, 'Z482', '', '', '0', 0, '0', '', '', ''),
(51, 'ZAMOR PARSLEY & BASIL (100g)', 'ZAMOR PARSLEY & BASIL (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z499', '', '', '0', 0, '0', '', '', ''),
(52, 'ZAMOR ROSEMARY (100g)', 'ZAMOR ROSEMARY (100g)', '0.00', '25', '', 59, '62', 1, 0, 17, '', '2023-09-19 13:32:35', 4, 4, 'Z505', '', '', '0', 0, '0', '', '', ''),
(53, 'ZAMOR SAGE (100g)', 'ZAMOR SAGE (100g)', '0.00', '25', '', 59, '96', 1, 0, 17, '', '2023-09-11 21:03:10', 4, 4, 'Z512', '', '', '0', 0, '0', '', '', ''),
(54, 'ZAMOR SRIRACHA SALT', 'ZAMOR SRIRACHA SALT', '0.00', '43', '', 59, '54', 1, 0, 17, '', '2022-02-02 12:30:14', 4, 4, 'Z529', '', '', '0', 0, '0', '', '', ''),
(55, 'ZAMOR THYME (100g)', 'ZAMOR THYME (100g)', '0.00', '25', '', 59, '69', 1, 0, 17, '', '2023-09-22 06:54:28', 4, 4, 'Z536', '', '', '0', 0, '0', '', '', ''),
(56, 'ZAMOR BASIL LEAVES (50G) POUCHES', 'ZAMOR BASIL LEAVES (50G) POUCHES', '0.00', '20', '', 59, '12', 1, 0, 17, '', '2023-09-19 14:23:54', 4, 4, 'Z543', '', '', '0', 0, '0', '', '', ''),
(57, 'ZAMOR MORINGA & CELERY SALT', 'ZAMOR MORINGA & CELERY SALT', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z550', '', '', '0', 0, '0', '', '', ''),
(58, 'ZAMOR CELERY SALT', 'ZAMOR CELERY SALT', '0.00', '35', '', 59, '75', 1, 0, 17, '', '2023-09-21 13:53:59', 4, 4, 'Z567', '', '', '0', 0, '0', '', '', ''),
(59, 'ZAMOR CURRY LEAVES (50g) POUCHES', 'ZAMOR CURRY LEAVES (50g) POUCHES', '0.00', '20', '', 59, '47', 1, 0, 17, '', '2023-09-19 14:23:42', 4, 4, 'Z574', '', '', '0', 0, '0', '', '', ''),
(60, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '2023-09-19 13:37:42', 4, 4, 'Z581', '', '', '0', 0, '0', '', '', ''),
(61, 'ZAMOR MINT LEAVES (50g) POUCHES', 'ZAMOR MINT LEAVES (50g) POUCHES', '0.00', '20', '', 59, '13', 1, 0, 17, '', '2023-09-21 19:59:28', 4, 4, 'Z598', '', '', '0', 0, '0', '', '', ''),
(62, 'ZAMOR LEMONGRASS (100g)', 'ZAMOR LEMONGRASS (100g)', '0.00', '25', '', 59, '109', 1, 0, 17, '', '2022-02-02 12:12:26', 4, 4, 'Z604', '', '', '0', 0, '0', '', '', ''),
(63, 'ZAMOR THYME LEAVES (50G) POUCHES', 'ZAMOR THYME LEAVES (50G) POUCHES', '0.00', '20', '', 59, '29', 1, 0, 17, '', '2023-10-04 10:50:31', 4, 4, 'Z611', '', '', '0', 0, '0', '', '', ''),
(64, 'ZAMOR CHILLI OIL 125ML', 'ZAMOR CHILLI OIL 125ML', '0.00', '56', '', 59, '119', 1, 0, 17, '', '2023-09-21 19:59:02', 4, 4, 'Z628', '', '', '0', 0, '0', '', '', ''),
(65, 'ZAMOR DELICIOUS DILL', 'ZAMOR DELICIOUS DILL', '0.00', '35', '', 59, '99', 1, 0, 17, '', '2023-09-19 13:04:32', 4, 4, 'Z635', '', '', '0', 0, '0', '', '', ''),
(66, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '0.00', '45', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z642', '', '', '0', 0, '0', '', '', ''),
(67, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '0.00', '20', '', 59, '26', 1, 0, 17, '', '2023-09-09 07:47:44', 4, 4, 'Z666', '', '', '0', 0, '0', '', '', ''),
(68, 'ZAMOR CHILLIES, GARLIC & SALT', 'ZAMOR CHILLIES, GARLIC & SALT', '0.00', '35', '', 59, '75', 1, 0, 17, '', '2023-09-11 21:08:38', 4, 4, 'Z673', '', '', '0', 0, '0', '', '', ''),
(69, 'ZAMOR DRIED CHILLIES (50g) POUCHES', 'ZAMOR DRIED CHILLIES (50g) POUCHES', '0.00', '20', '', 59, '45', 1, 0, 17, '', '2022-02-03 12:37:14', 4, 4, 'Z697', '', '', '0', 0, '0', '', '', ''),
(70, 'ZAMOR PUNCHY PARSLEY', 'ZAMOR PUNCHY PARSLEY', '0.00', '35', '', 59, '62', 1, 0, 17, '', '2023-09-21 19:00:43', 4, 4, 'Z703', '', '', '0', 0, '0', '', '', ''),
(71, 'ZAMOR ONION POWDER 100g', 'ZAMOR ONION POWDER 100g', '0.00', '25', '', 59, '-8', 1, 0, 17, '', '2022-02-02 12:19:14', 4, 4, 'Z751', '', '', '0', 0, '0', '', '', ''),
(72, 'ZAMOR DILL (100g)', 'ZAMOR DILL (100g)', '0.00', '25', '', 59, '57', 1, 0, 17, '', '2023-09-19 13:04:32', 4, 4, 'Z768', '', '', '0', 0, '0', '', '', ''),
(73, 'ZAMOR FENNEL 100g', 'ZAMOR FENNEL 100g', '0.00', '25', '', 59, '134', 1, 0, 17, '', '2023-09-21 21:25:03', 4, 4, 'Z775', '', '', '0', 0, '0', '', '', ''),
(74, 'ZAMOR Parsley (100g)', 'ZAMOR Parsley (100g)', '0.00', '25', '', 59, '83', 1, 0, 17, '', '2023-09-21 14:20:19', 4, 4, 'Z805', '', '', '0', 0, '0', '', '', ''),
(75, 'ZAMOR LUSCIOUS LAMB', 'ZAMOR LUSCIOUS LAMB', '0.00', '25', '', 59, '113', 1, 0, 17, '', '2022-01-26 09:42:05', 4, 4, 'Z867', '', '', '0', 0, '0', '', '', ''),
(76, 'ZAMOR HERBY HUKU', 'ZAMOR HERBY HUKU', '0.00', '25', '', 59, '165', 1, 0, 17, '', '2022-02-02 11:58:49', 4, 4, 'Z881', '', '', '0', 0, '0', '', '', ''),
(77, 'ZAMOR SRIRACHA SALT (BULK)', 'ZAMOR SRIRACHA SALT (BULK)', '0.00', '250', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z900', '', '', '0', 0, '0', '', '', ''),
(78, 'ZAMOR BULK CHILLIES', 'ZAMOR BULK CHILLIES', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z901', '', '', '0', 0, '0', '', '', ''),
(79, 'ZAMOR CELERY POWDER (BULK)', 'ZAMOR CELERY POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z902', '', '', '0', 0, '0', '', '', ''),
(80, 'ZAMOR CELERY STEM (BULK)', 'ZAMOR CELERY STEM (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z903', '', '', '0', 0, '0', '', '', ''),
(81, 'ZAMOR PINK HIMALAYAN SALT (100g)', 'ZAMOR PINK HIMALAYAN SALT (100g)', '0.00', '43', '', 59, '170', 1, 0, 17, '', '2023-09-21 13:27:22', 4, 4, 'Z904', '', '', '0', 0, '0', '', '', ''),
(82, 'CHIA SEED', 'CHIA SEED', '0.00', '20', '', 59, '-1', 1, 0, 17, '', '2022-09-25 17:27:39', 4, 4, 'Z905', '', '', '0', 0, '0', '', '', ''),
(83, 'ZAMOR CHILLI POWDER (BULK)', 'ZAMOR CHILLI POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z906', '', '', '0', 0, '0', '', '', ''),
(84, 'ZAMOR CHIVES (BULK)', 'ZAMOR CHIVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z907', '', '', '0', 0, '0', '', '', ''),
(85, 'ZAMOR CRUNCHY CORIANDER (BULK)', 'ZAMOR CRUNCHY CORIANDER (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z908', '', '', '0', 0, '0', '', '', ''),
(86, 'ZAMOR DILL (BULK)', 'ZAMOR DILL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z909', '', '', '0', 0, '0', '', '', ''),
(87, 'ZAMOR FENNEL (BULK)', 'ZAMOR FENNEL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z910', '', '', '0', 0, '0', '', '', ''),
(88, 'ZAMOR FENNEL ROOT (BULK)', 'ZAMOR FENNEL ROOT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z911', '', '', '0', 0, '0', '', '', ''),
(89, 'ZAMOR GARLIC CHIVES (BULK)', 'ZAMOR GARLIC CHIVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z912', '', '', '0', 0, '0', '', '', ''),
(90, 'ZAMOR ONION POWDER (BULK)', 'ZAMOR ONION POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z913', '', '', '0', 0, '0', '', '', ''),
(91, 'ZAMOR LEMON GRASS (BULK)', 'ZAMOR LEMON GRASS (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2023-09-21 14:38:34', 4, 4, 'Z914', '', '', '0', 0, '0', '', '', ''),
(92, 'ZAMOR MINT (BULK)', 'ZAMOR MINT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z915', '', '', '0', 0, '0', '', '', ''),
(93, 'ZAMOR MORINGA LEAF', 'ZAMOR MORINGA LEAF', '0.00', '185', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z916', '', '', '0', 0, '0', '', '', ''),
(94, 'ZAMOR SPRING ONION POWDER (BULK)', 'ZAMOR SPRING ONION POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2023-09-21 19:01:06', 4, 4, 'Z917', '', '', '0', 0, '0', '', '', ''),
(95, 'ZAMOR TARRAGON (BULK)', 'ZAMOR TARRAGON (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z918', '', '', '0', 0, '0', '', '', ''),
(96, 'ZAMOR THYME BULK (KG)', 'ZAMOR THYME BULK (KG)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z919', '', '', '0', 0, '0', '', '', ''),
(97, 'ZAMOR DELICIOUS DILL (BULK)', 'ZAMOR DELICIOUS DILL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z920', '', '', '0', 0, '0', '', '', ''),
(98, 'ZAMOR SAGE (BULK)', 'ZAMOR SAGE (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z921', '', '', '0', 0, '0', '', '', ''),
(99, 'ZAMOR CURRY LEAVES (BULK)', 'ZAMOR CURRY LEAVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z922', '', '', '0', 0, '0', '', '', ''),
(100, 'ZAMOR PARSLEY LEAF (BULK)', 'ZAMOR PARSLEY LEAF (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z923', '', '', '0', 0, '0', '', '', ''),
(101, 'ZAMOR BLACK PEPPER CORNS (100g)', 'ZAMOR BLACK PEPPER CORNS (100g)', '0.00', '50', '', 59, '258', 1, 0, 17, '', '2023-09-19 14:23:27', 4, 4, 'Z928', '', '', '0', 0, '0', '', '', ''),
(102, 'ZAMOR TARRAGON (100g)', 'ZAMOR TARRAGON (100g)', '0.00', '25', '', 59, '67', 1, 0, 17, '', '2023-09-21 19:59:02', 4, 4, 'Z966', '', '', '0', 0, '0', '', '', ''),
(103, 'ZAMOR HERBY HUKU (BULK)', 'ZAMOR HERBY HUKU (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z981', '', '', '0', 0, '0', '', '', ''),
(104, 'ZAMOR LUSCIOUS LUMB (BULK)', 'ZAMOR LUSCIOUS LUMB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z983', '', '', '0', 0, '0', '', '', ''),
(105, 'ZAMOR CORIANDER (BULK)', 'ZAMOR CORIANDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z984', '', '', '0', 0, '0', '', '', ''),
(106, 'ZAMOR CHICKEN RUB (BULK)', 'ZAMOR CHICKEN RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z985', '', '', '0', 0, '0', '', '', ''),
(107, 'ZAMOR CAJUN RUB (BULK)', 'ZAMOR CAJUN RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z986', '', '', '0', 0, '0', '', '', ''),
(108, 'ZAMOR LAMB RUB (BULK)', 'ZAMOR LAMB RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z987', '', '', '0', 0, '0', '', '', ''),
(109, 'ZAMOR CELERY SALT (BULK)', 'ZAMOR CELERY SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z988', '', '', '0', 0, '0', '', '', ''),
(110, 'ZAMOR FUNKY FENNL (BULK)', 'ZAMOR FUNKY FENNL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z989', '', '', '0', 0, '0', '', '', ''),
(111, 'ZAMOR CHILLI, GARLIC SALT (BULK)', 'ZAMOR CHILLI, GARLIC SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z990', '', '', '0', 0, '0', '', '', ''),
(112, 'ZAMOR MIXED HERBS (BULK)', 'ZAMOR MIXED HERBS (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2023-09-09 09:43:59', 4, 4, 'Z991', '', '', '0', 0, '0', '', '', ''),
(113, 'ZAMOR PINK HIMALAYAN SALT (BULK)', 'ZAMOR PINK HIMALAYAN SALT (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2023-09-19 13:32:55', 4, 4, 'Z992', '', '', '0', 0, '0', '', '', ''),
(114, 'ZAMOR BLACK PEPPER CORNS (BULK)', 'ZAMOR BLACK PEPPER CORNS (BULK)', '0.00', '224', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z993', '', '', '0', 0, '0', '', '', ''),
(115, 'ZAMOR MORINGA CELERY SALT (BULK)', 'ZAMOR MORINGA CELERY SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z994', '', '', '0', 0, '0', '', '', ''),
(116, 'ZAMOR ORIGANUM (Bulk)', 'ZAMOR ORIGANUM (Bulk)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z996', '', '', '0', 0, '0', '', '', ''),
(117, 'ZAMOR BASIL LEAVES BULK (KG)', 'ZAMOR BASIL LEAVES BULK (KG)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z997', '', '', '0', 0, '0', '', '', ''),
(118, 'ZAMOR ROSEMARY (BULK)', 'ZAMOR ROSEMARY (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2023-09-19 12:46:08', 4, 4, 'Z998', '', '', '0', 0, '0', '', '', ''),
(119, 'ZAMOR MIXED CHILLIES (BULK) 500G', 'ZAMOR MIXED CHILLIES (BULK) 500G', '0.00', '200', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z999', '', '', '0', 0, '0', '', '', ''),
(120, '', '', '0.00', '', '', 0, '0', 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(121, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules 180s (1x12)', '0.00', '825', '', 59, '25', 1, 0, 17, '', '2022-01-19 12:51:24', 5, 5, '1', '', '', '0', 0, '0', '', '', ''),
(122, 'Moringa Miracle Green Tea (1x12)', 'Moringa Miracle Green Tea (1x12)', '0.00', '220', '', 59, '15', 1, 0, 17, '', '2022-01-19 12:52:30', 5, 5, '3', '', '', '0', 0, '0', '', '', ''),
(123, 'Moringa Powder (Bulk per KG)', 'Moringa Powder (Bulk per KG)', '0.00', '51', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '4', '', '', '0', 0, '0', '', '', ''),
(124, 'Moringa Green Tea (Single)', 'Moringa Green Tea (Single)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '6', '', '', '0', 0, '0', '', '', ''),
(125, 'Moringa Capsules 180s (Singles)', 'Moringa Capsules 180s (Singles)', '0.00', '90', '', 59, '0', 1, 0, 17, '', '2022-01-18 13:40:16', 5, 5, '7', '', '', '0', 0, '0', '', '', ''),
(126, 'No Sale/Cancelled Invoices', 'No Sale/Cancelled Invoices', '0.00', '  -    ', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '10', '', '', '0', 0, '0', '', '', ''),
(127, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '0.00', '640', '', 59, '26', 1, 0, 17, '', '2022-01-19 12:51:51', 5, 5, '14', '', '', '0', 0, '0', '', '', ''),
(128, 'Moringa S.U.P. 250g Powder (Single)', 'Moringa S.U.P. 250g Powder (Single)', '0.00', '60', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '20', '', '', '0', 0, '0', '', '', ''),
(129, 'Moringa Human Powder 100g (1x10)', 'Moringa Human Powder 100g (1x10)', '0.00', '230', '', 59, '14', 1, 0, 17, '', '2022-01-19 12:54:08', 5, 5, '25', '', '', '0', 0, '0', '', '', ''),
(130, 'Moringa 100g Powder (Single)', 'Moringa 100g Powder (Single)', '0.00', '30', '', 59, '1', 1, 0, 17, '', '2022-07-09 10:53:22', 5, 5, '33', '', '', '0', 0, '0', '', '', ''),
(131, 'Moringa Animal Feed Supplement 3kg', 'Moringa Animal Feed Supplement 3kg', '0.00', '70', '', 59, '9', 1, 0, 17, '', '2022-01-19 12:48:53', 5, 5, '41', '', '', '0', 0, '0', '', '', ''),
(132, 'Moringa Animal Supplement 6kg', 'Moringa Animal Supplement 6kg', '0.00', '140', '', 59, '24', 1, 0, 17, '', '2022-01-19 12:49:15', 5, 5, '42', '', '', '0', 0, '0', '', '', ''),
(133, 'Moringa Pet Food Suppliment (1x10)', 'Moringa Pet Food Suppliment (1x10)', '0.00', '195', '', 59, '11', 1, 0, 17, '', '2022-01-19 12:54:40', 5, 5, '43', '', '', '0', 0, '0', '', '', ''),
(134, 'Moringa Capsules 90s (Singles)', 'Moringa Capsules 90s (Singles)', '0.00', '56', '', 59, '0', 1, 0, 17, '', '2022-01-18 13:40:16', 5, 5, '45', '', '', '0', 0, '0', '', '', ''),
(135, 'Moringa 5KG Protein Pellets', 'Moringa 5KG Protein Pellets', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '46', '', '', '0', 0, '0', '', '', ''),
(136, 'Moringa 200G Protein Pellets (10x200G)', 'Moringa 200G Protein Pellets (10x200G)', '0.00', '135', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '47', '', '', '0', 0, '0', '', '', ''),
(137, 'Moringa 200G Protein Pellets (Singles)', 'Moringa 200G Protein Pellets (Singles)', '0.00', '13', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:56:26', 5, 5, '48', '', '', '0', 0, '0', '', '', ''),
(138, 'Moringa Animal Feed 200g (Singles)', 'Moringa Animal Feed 200g (Singles)', '0.00', '18', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:56:01', 5, 5, '49', '', '', '0', 0, '0', '', '', ''),
(139, 'Assorted Moringa Tea Pack', 'Assorted Moringa Tea Pack', '0.00', '140', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '50', '', '', '0', 0, '0', '', '', ''),
(140, 'Moringa Lemon Grass Infusion (1x12)', 'Moringa Lemon Grass Infusion (1x12)', '0.00', '250', '', 59, '9', 1, 0, 17, '', '2022-01-19 12:52:58', 5, 5, '52', '', '', '0', 0, '0', '', '', ''),
(141, 'Moringa Ginger & Lemon Infusion (1x12)', 'Moringa Ginger & Lemon Infusion (1x12)', '0.00', '250', '', 59, '14', 1, 0, 17, '', '2022-01-19 12:53:28', 5, 5, '53', '', '', '0', 0, '0', '', '', ''),
(142, 'Moringa Apple & Cinnamon Infusion (1x12)', 'Moringa Apple & Cinnamon Infusion (1x12)', '0.00', '250', '', 59, '9', 1, 0, 17, '', '2022-01-19 12:53:47', 5, 5, '54', '', '', '0', 0, '0', '', '', ''),
(143, 'Moringa Lemon Grass Infusion (Singles)', 'Moringa Lemon Grass Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '57', '', '', '0', 0, '0', '', '', ''),
(144, 'Moringa Ginger & Lemon Infusion (Singles)', 'Moringa Ginger & Lemon Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '58', '', '', '0', 0, '0', '', '', ''),
(145, 'Moringa Apple & Cinnamon Infusion (Singles)', 'Moringa Apple & Cinnamon Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '59', '', '', '0', 0, '0', '', '', ''),
(146, 'Bounced Cheques', 'Bounced Cheques', '0.00', '  -    ', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '61', '', '', '0', 0, '0', '', '', ''),
(147, 'Moringa Pet Food Supplement (Singles)', 'Moringa Pet Food Supplement (Singles)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '63', '', '', '0', 0, '0', '', '', ''),
(148, 'Moringa AFS 200g (1x10)', 'Moringa AFS 200g (1x10)', '0.00', '130', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '68', '', '', '0', 0, '0', '', '', ''),
(149, 'Sheep sales', 'Sheep sales', '0.00', '140', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '70', '', '', '0', 0, '0', '', '', ''),
(150, 'Green Carrier Bags', 'Green Carrier Bags', '0.00', '3', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '71', '', '', '0', 0, '0', '', '', ''),
(151, 'Moringa Oil 100ml', 'Moringa Oil 100ml', '0.00', '120', '', 59, '31', 1, 0, 17, '', '2022-01-19 12:55:27', 5, 5, '72', '', '', '0', 0, '0', '', '', ''),
(152, 'Moringa Oil 50ML', 'Moringa Oil 50ML', '0.00', '60', '', 59, '43', 1, 0, 17, '', '2022-01-19 12:55:09', 5, 5, '73', '', '', '0', 0, '0', '', '', ''),
(153, 'Moringa Oil (Bulk per Litre)', 'Moringa Oil (Bulk per Litre)', '0.00', '960', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '74', '', '', '0', 0, '0', '', '', ''),
(154, 'ZAMOR STARTER PACK (24 PIECE)', 'ZAMOR STARTER PACK (24 PIECE)', '0.00', '670', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z200', '', '', '0', 0, '0', '', '', ''),
(155, 'ZAMOR PICNIC GOURMET SET', 'ZAMOR PICNIC GOURMET SET', '0.00', '275', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z201', '', '', '0', 0, '0', '', '', ''),
(156, 'ZAMOR STARTER PACK (12 PIECE)', 'ZAMOR STARTER PACK (12 PIECE)', '0.00', '371', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z202', '', '', '0', 0, '0', '', '', ''),
(157, 'ZAMOR CHADAROO CHUNKY 220G', 'ZAMOR CHADAROO CHUNKY 220G', '0.00', '55', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z216', '', '', '0', 0, '0', '', '', ''),
(158, 'ZAMOR CHADAROO PASTE 220G', 'ZAMOR CHADAROO PASTE 220G', '0.00', '55', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z223', '', '', '0', 0, '0', '', '', ''),
(159, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '0.00', '45', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z254', '', '', '0', 0, '0', '', '', ''),
(160, 'ZAMOR CUCUMBER 550G', 'ZAMOR CUCUMBER 550G', '0.00', '33', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z278', '', '', '0', 0, '0', '', '', ''),
(161, 'ZAMOR CAJUN RUB 100g', 'ZAMOR CAJUN RUB 100g', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z283', '', '', '0', 0, '0', '', '', ''),
(162, 'ZAMOR CHICKEN RUB 100g', 'ZAMOR CHICKEN RUB 100g', '0.00', '35', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:59:57', 5, 5, 'Z290', '', '', '0', 0, '0', '', '', ''),
(163, 'ZAMOR LAMB RUB 100g', 'ZAMOR LAMB RUB 100g', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z306', '', '', '0', 0, '0', '', '', ''),
(164, 'ZAMOR BASIL (100g)', 'ZAMOR BASIL (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z413', '', '', '0', 0, '0', '', '', ''),
(165, 'ZAMOR CELERY (100g)', 'ZAMOR CELERY (100g)', '0.00', '25', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:59:34', 5, 5, 'Z420', '', '', '0', 0, '0', '', '', ''),
(166, 'ZAMORFUNKY FENNEL (100g)', 'ZAMORFUNKY FENNEL (100g)', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z437', '', '', '0', 0, '0', '', '', ''),
(167, 'ZAMOR GARLIC & SPRING ONION (100g)', 'ZAMOR GARLIC & SPRING ONION (100g)', '0.00', '25', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:57:31', 5, 5, 'Z444', '', '', '0', 0, '0', '', '', ''),
(168, 'ZAMOR MIXED CHILLIES (100g)', 'ZAMOR MIXED CHILLIES (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z451', '', '', '0', 0, '0', '', '', ''),
(169, 'ZAMOR MIXED HERBS (100g)', 'ZAMOR MIXED HERBS (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z468', '', '', '0', 0, '0', '', '', ''),
(170, 'ZAMOR ORIGANUM (100g)', 'ZAMOR ORIGANUM (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z475', '', '', '0', 0, '0', '', '', ''),
(171, 'ZAMOR CRUNCHY CORIANDER', 'ZAMOR CRUNCHY CORIANDER', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z482', '', '', '0', 0, '0', '', '', ''),
(172, 'ZAMOR PARSLEY & BASIL (100g)', 'ZAMOR PARSLEY & BASIL (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z499', '', '', '0', 0, '0', '', '', ''),
(173, 'ZAMOR ROSEMARY (100g)', 'ZAMOR ROSEMARY (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z505', '', '', '0', 0, '0', '', '', ''),
(174, 'ZAMOR SAGE (100g)', 'ZAMOR SAGE (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z512', '', '', '0', 0, '0', '', '', ''),
(175, 'ZAMOR SRIRACHA SALT', 'ZAMOR SRIRACHA SALT', '0.00', '43', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z529', '', '', '0', 0, '0', '', '', ''),
(176, 'ZAMOR THYME (100g)', 'ZAMOR THYME (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z536', '', '', '0', 0, '0', '', '', ''),
(177, 'ZAMOR BASIL LEAVES (50G) POUCHES', 'ZAMOR BASIL LEAVES (50G) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z543', '', '', '0', 0, '0', '', '', ''),
(178, 'ZAMOR MORINGA & CELERY SALT', 'ZAMOR MORINGA & CELERY SALT', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z550', '', '', '0', 0, '0', '', '', ''),
(179, 'ZAMOR CELERY SALT', 'ZAMOR CELERY SALT', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z567', '', '', '0', 0, '0', '', '', ''),
(180, 'ZAMOR CURRY LEAVES (50g) POUCHES', 'ZAMOR CURRY LEAVES (50g) POUCHES', '0.00', '20', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:58:13', 5, 5, 'Z574', '', '', '0', 0, '0', '', '', ''),
(181, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '0.00', '20', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:59:11', 5, 5, 'Z581', '', '', '0', 0, '0', '', '', ''),
(182, 'ZAMOR MINT LEAVES (50g) POUCHES', 'ZAMOR MINT LEAVES (50g) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z598', '', '', '0', 0, '0', '', '', ''),
(183, 'ZAMOR LEMONGRASS (100g)', 'ZAMOR LEMONGRASS (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z604', '', '', '0', 0, '0', '', '', ''),
(184, 'ZAMOR THYME LEAVES (50G) POUCHES', 'ZAMOR THYME LEAVES (50G) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z611', '', '', '0', 0, '0', '', '', ''),
(185, 'ZAMOR CHILLI OIL 125ML', 'ZAMOR CHILLI OIL 125ML', '0.00', '26', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z628', '', '', '0', 0, '0', '', '', ''),
(186, 'ZAMOR DELICIOUS DILL', 'ZAMOR DELICIOUS DILL', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z635', '', '', '0', 0, '0', '', '', ''),
(187, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '0.00', '45', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z642', '', '', '0', 0, '0', '', '', ''),
(188, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z666', '', '', '0', 0, '0', '', '', ''),
(189, 'ZAMOR CHILLIES, GARLIC & SALT', 'ZAMOR CHILLIES, GARLIC & SALT', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z673', '', '', '0', 0, '0', '', '', ''),
(190, 'ZAMOR DRIED CHILLIES (50g) POUCHES', 'ZAMOR DRIED CHILLIES (50g) POUCHES', '0.00', '20', '', 59, '1', 1, 0, 17, '', '2022-01-19 12:58:47', 5, 5, 'Z697', '', '', '0', 0, '0', '', '', ''),
(191, 'ZAMOR PUNCHY PARSLEY', 'ZAMOR PUNCHY PARSLEY', '0.00', '35', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z703', '', '', '0', 0, '0', '', '', ''),
(192, 'ZAMOR ONION POWDER 100g', 'ZAMOR ONION POWDER 100g', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z751', '', '', '0', 0, '0', '', '', ''),
(193, 'ZAMOR DILL (100g)', 'ZAMOR DILL (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z768', '', '', '0', 0, '0', '', '', ''),
(194, 'ZAMOR FENNEL 100g', 'ZAMOR FENNEL 100g', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z775', '', '', '0', 0, '0', '', '', ''),
(195, 'ZAMOR Parsley (100g)', 'ZAMOR Parsley (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z805', '', '', '0', 0, '0', '', '', ''),
(196, 'ZAMOR LUSCIOUS LAMB', 'ZAMOR LUSCIOUS LAMB', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z867', '', '', '0', 0, '0', '', '', ''),
(197, 'ZAMOR HERBY HUKU', 'ZAMOR HERBY HUKU', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z881', '', '', '0', 0, '0', '', '', ''),
(198, 'ZAMOR SRIRACHA SALT (BULK)', 'ZAMOR SRIRACHA SALT (BULK)', '0.00', '250', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z900', '', '', '0', 0, '0', '', '', ''),
(199, 'ZAMOR BULK CHILLIES', 'ZAMOR BULK CHILLIES', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z901', '', '', '0', 0, '0', '', '', ''),
(200, 'ZAMOR CELERY POWDER (BULK)', 'ZAMOR CELERY POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z902', '', '', '0', 0, '0', '', '', ''),
(201, 'ZAMOR CELERY STEM (BULK)', 'ZAMOR CELERY STEM (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z903', '', '', '0', 0, '0', '', '', ''),
(202, 'ZAMOR PINK HIMALAYAN SALT (100g)', 'ZAMOR PINK HIMALAYAN SALT (100g)', '0.00', '43', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z904', '', '', '0', 0, '0', '', '', ''),
(203, 'CHIA SEED', 'CHIA SEED', '0.00', '120', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z905', '', '', '0', 0, '0', '', '', ''),
(204, 'ZAMOR CHILLI POWDER (BULK)', 'ZAMOR CHILLI POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z906', '', '', '0', 0, '0', '', '', ''),
(205, 'ZAMOR CHIVES (BULK)', 'ZAMOR CHIVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z907', '', '', '0', 0, '0', '', '', ''),
(206, 'ZAMOR CRUNCHY CORIANDER (BULK)', 'ZAMOR CRUNCHY CORIANDER (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z908', '', '', '0', 0, '0', '', '', ''),
(207, 'ZAMOR DILL (BULK)', 'ZAMOR DILL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z909', '', '', '0', 0, '0', '', '', ''),
(208, 'ZAMOR FENNEL (BULK)', 'ZAMOR FENNEL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z910', '', '', '0', 0, '0', '', '', ''),
(209, 'ZAMOR FENNEL ROOT (BULK)', 'ZAMOR FENNEL ROOT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z911', '', '', '0', 0, '0', '', '', ''),
(210, 'ZAMOR GARLIC CHIVES (BULK)', 'ZAMOR GARLIC CHIVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z912', '', '', '0', 0, '0', '', '', ''),
(211, 'ZAMOR ONION POWDER (BULK)', 'ZAMOR ONION POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z913', '', '', '0', 0, '0', '', '', ''),
(212, 'ZAMOR LEMON GRASS (BULK)', 'ZAMOR LEMON GRASS (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z914', '', '', '0', 0, '0', '', '', ''),
(213, 'ZAMOR MINT (BULK)', 'ZAMOR MINT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z915', '', '', '0', 0, '0', '', '', ''),
(214, 'ZAMOR MORINGA LEAF', 'ZAMOR MORINGA LEAF', '0.00', '185', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z916', '', '', '0', 0, '0', '', '', ''),
(215, 'ZAMOR SPRING ONION POWDER (BULK)', 'ZAMOR SPRING ONION POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z917', '', '', '0', 0, '0', '', '', ''),
(216, 'ZAMOR TARRAGON (BULK)', 'ZAMOR TARRAGON (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z918', '', '', '0', 0, '0', '', '', ''),
(217, 'ZAMOR THYME BULK (KG)', 'ZAMOR THYME BULK (KG)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z919', '', '', '0', 0, '0', '', '', ''),
(218, 'ZAMOR DELICIOUS DILL (BULK)', 'ZAMOR DELICIOUS DILL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z920', '', '', '0', 0, '0', '', '', ''),
(219, 'ZAMOR SAGE (BULK)', 'ZAMOR SAGE (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z921', '', '', '0', 0, '0', '', '', ''),
(220, 'ZAMOR CURRY LEAVES (BULK)', 'ZAMOR CURRY LEAVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z922', '', '', '0', 0, '0', '', '', ''),
(221, 'ZAMOR PARSLEY LEAF (BULK)', 'ZAMOR PARSLEY LEAF (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z923', '', '', '0', 0, '0', '', '', ''),
(222, 'ZAMOR BLACK PEPPER CORNS (100g)', 'ZAMOR BLACK PEPPER CORNS (100g)', '0.00', '50', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z928', '', '', '0', 0, '0', '', '', ''),
(223, 'ZAMOR TARRAGON (100g)', 'ZAMOR TARRAGON (100g)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z966', '', '', '0', 0, '0', '', '', ''),
(224, 'ZAMOR HERBY HUKU (BULK)', 'ZAMOR HERBY HUKU (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z981', '', '', '0', 0, '0', '', '', ''),
(225, 'ZAMOR LUSCIOUS LUMB (BULK)', 'ZAMOR LUSCIOUS LUMB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z983', '', '', '0', 0, '0', '', '', ''),
(226, 'ZAMOR CORIANDER (BULK)', 'ZAMOR CORIANDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z984', '', '', '0', 0, '0', '', '', ''),
(227, 'ZAMOR CHICKEN RUB (BULK)', 'ZAMOR CHICKEN RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z985', '', '', '0', 0, '0', '', '', ''),
(228, 'ZAMOR CAJUN RUB (BULK)', 'ZAMOR CAJUN RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z986', '', '', '0', 0, '0', '', '', ''),
(229, 'ZAMOR LAMB RUB (BULK)', 'ZAMOR LAMB RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z987', '', '', '0', 0, '0', '', '', ''),
(230, 'ZAMOR CELERY SALT (BULK)', 'ZAMOR CELERY SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z988', '', '', '0', 0, '0', '', '', ''),
(231, 'ZAMOR FUNKY FENNL (BULK)', 'ZAMOR FUNKY FENNL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z989', '', '', '0', 0, '0', '', '', ''),
(232, 'ZAMOR CHILLI, GARLIC SALT (BULK)', 'ZAMOR CHILLI, GARLIC SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z990', '', '', '0', 0, '0', '', '', ''),
(233, 'ZAMOR MIXED HERBS (BULK)', 'ZAMOR MIXED HERBS (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z991', '', '', '0', 0, '0', '', '', ''),
(234, 'ZAMOR PINK HIMALAYAN SALT (BULK)', 'ZAMOR PINK HIMALAYAN SALT (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z992', '', '', '0', 0, '0', '', '', ''),
(235, 'ZAMOR BLACK PEPPER CORNS (BULK)', 'ZAMOR BLACK PEPPER CORNS (BULK)', '0.00', '224', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z993', '', '', '0', 0, '0', '', '', ''),
(236, 'ZAMOR MORINGA CELERY SALT (BULK)', 'ZAMOR MORINGA CELERY SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z994', '', '', '0', 0, '0', '', '', ''),
(237, 'ZAMOR ORIGANUM (Bulk)', 'ZAMOR ORIGANUM (Bulk)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z996', '', '', '0', 0, '0', '', '', ''),
(238, 'ZAMOR BASIL LEAVES BULK (KG)', 'ZAMOR BASIL LEAVES BULK (KG)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z997', '', '', '0', 0, '0', '', '', ''),
(239, 'ZAMOR ROSEMARY (BULK)', 'ZAMOR ROSEMARY (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z998', '', '', '0', 0, '0', '', '', ''),
(240, 'ZAMOR MIXED CHILLIES (BULK) 500G', 'ZAMOR MIXED CHILLIES (BULK) 500G', '0.00', '200', '', 59, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z999', '', '', '0', 0, '0', '', '', ''),
(241, '', '', '0.00', '', '', 0, '0', 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(242, 'Moringa Miracle Capsules 180s (1x12)', '', '0.00', '825', '', 0, '5', 1, 0, 17, '', '2022-01-19 12:13:28', 6, 6, '1', '', '', '0', 0, '0', '', '', ''),
(243, 'Moringa Miracle Green Tea (1x12)', '', '0.00', '220', '', 0, '3', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '3', '', '', '0', 0, '0', '', '', ''),
(244, 'Moringa Powder (Bulk per KG)', '', '0.00', '51', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '4', '', '', '0', 0, '0', '', '', ''),
(245, 'Moringa Green Tea (Single)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '6', '', '', '0', 0, '0', '', '', ''),
(246, 'Moringa Capsules 180s (Singles)', '', '0.00', '90', '', 0, '0', 1, 0, 17, '', '2022-01-18 13:40:16', 6, 6, '7', '', '', '0', 0, '0', '', '', ''),
(247, 'Moringa Miracle Capsules 90s (1x15)', '', '0.00', '640', '', 0, '5', 1, 0, 17, '', '2022-01-19 12:18:01', 6, 6, '14', '', '', '0', 0, '0', '', '', ''),
(248, 'Moringa S.U.P. 250g Powder (Single)', '', '0.00', '60', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '20', '', '', '0', 0, '0', '', '', ''),
(249, 'Moringa Human Powder 100g (1x10)', '', '0.00', '230', '', 0, '2', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '25', '', '', '0', 0, '0', '', '', ''),
(250, 'Moringa 100g Powder (Single)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '33', '', '', '0', 0, '0', '', '', ''),
(251, 'Moringa Animal Feed Supplement 3kg', '', '0.00', '70', '', 0, '6', 1, 0, 17, '', '2022-01-19 13:01:48', 6, 6, '41', '', '', '0', 0, '0', '', '', ''),
(252, 'Moringa Animal Supplement 6kg', '', '0.00', '140', '', 0, '5', 1, 0, 17, '', '2022-01-19 13:02:15', 6, 6, '42', '', '', '0', 0, '0', '', '', ''),
(253, 'Moringa Pet Food Suppliment (1x10)', '', '0.00', '195', '', 0, '4', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '43', '', '', '0', 0, '0', '', '', ''),
(254, 'Moringa Capsules 90s (Singles)', '', '0.00', '56', '', 0, '0', 1, 0, 17, '', '2022-01-18 13:40:16', 6, 6, '45', '', '', '0', 0, '0', '', '', ''),
(255, 'Moringa 5KG Protein Pellets', '', '0.00', '145', '', 0, '1', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '46', '', '', '0', 0, '0', '', '', ''),
(256, 'Moringa 200G Protein Pellets (10x200G)', '', '0.00', '135', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '47', '', '', '0', 0, '0', '', '', ''),
(257, 'Moringa 200G Protein Pellets (Singles)', '', '0.00', '13', '', 0, '1', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '48', '', '', '0', 0, '0', '', '', ''),
(258, 'Moringa Animal Feed 200g (Singles)', '', '0.00', '18', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '49', '', '', '0', 0, '0', '', '', ''),
(259, 'Assorted Moringa Tea Pack', '', '0.00', '140', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '50', '', '', '0', 0, '0', '', '', ''),
(260, 'Moringa Lemon Grass Infusion (1x12)', '', '0.00', '250', '', 0, '3', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '52', '', '', '0', 0, '0', '', '', ''),
(261, 'Moringa Ginger & Lemon Infusion (1x12)', '', '0.00', '250', '', 0, '4', 1, 0, 17, '', '2022-01-19 12:18:48', 6, 6, '53', '', '', '0', 0, '0', '', '', ''),
(262, 'Moringa Apple & Cinnamon Infusion (1x12)', '', '0.00', '250', '', 0, '4', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '54', '', '', '0', 0, '0', '', '', ''),
(263, 'Moringa Lemon Grass Infusion (Singles)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '57', '', '', '0', 0, '0', '', '', ''),
(264, 'Moringa Ginger & Lemon Infusion (Singles)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '58', '', '', '0', 0, '0', '', '', ''),
(265, 'Moringa Apple & Cinnamon Infusion (Singles)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '59', '', '', '0', 0, '0', '', '', ''),
(266, 'Bounced Cheques', '', '0.00', '  -    ', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '61', '', '', '0', 0, '0', '', '', ''),
(267, 'Moringa Pet Food Supplement (Singles)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '63', '', '', '0', 0, '0', '', '', ''),
(268, 'Moringa AFS 200g (1x10)', '', '0.00', '130', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '68', '', '', '0', 0, '0', '', '', ''),
(269, 'Sheep sales', '', '0.00', '140', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '70', '', '', '0', 0, '0', '', '', ''),
(270, 'Green Carrier Bags', '', '0.00', '3', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '71', '', '', '0', 0, '0', '', '', ''),
(271, 'Moringa Oil 100ml', '', '0.00', '120', '', 0, '7', 1, 0, 17, '', '2022-01-19 12:42:30', 6, 6, '72', '', '', '0', 0, '0', '', '', ''),
(272, 'Moringa Oil 50ML', '', '0.00', '60', '', 0, '7', 1, 0, 17, '', '2022-01-19 12:41:45', 6, 6, '73', '', '', '0', 0, '0', '', '', ''),
(273, 'Moringa Oil (Bulk per Litre)', '', '0.00', '960', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '74', '', '', '0', 0, '0', '', '', ''),
(274, 'ZAMOR STARTER PACK (24 PIECE)', '', '0.00', '670', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z200', '', '', '0', 0, '0', '', '', ''),
(275, 'ZAMOR PICNIC GOURMET SET', '', '0.00', '275', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z201', '', '', '0', 0, '0', '', '', ''),
(276, 'ZAMOR STARTER PACK (12 PIECE)', '', '0.00', '371', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z202', '', '', '0', 0, '0', '', '', ''),
(277, 'ZAMOR CHADAROO CHUNKY 220G', '', '0.00', '55', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z216', '', '', '0', 0, '0', '', '', ''),
(278, 'ZAMOR CHADAROO PASTE 220G', '', '0.00', '55', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z223', '', '', '0', 0, '0', '', '', ''),
(279, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '', '0.00', '45', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z254', '', '', '0', 0, '0', '', '', ''),
(280, 'ZAMOR CUCUMBER 550G', '', '0.00', '33', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z278', '', '', '0', 0, '0', '', '', ''),
(281, 'ZAMOR CAJUN RUB 100g', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z283', '', '', '0', 0, '0', '', '', ''),
(282, 'ZAMOR CHICKEN RUB 100g', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z290', '', '', '0', 0, '0', '', '', ''),
(283, 'ZAMOR LAMB RUB 100g', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z306', '', '', '0', 0, '0', '', '', ''),
(284, 'ZAMOR BASIL (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z413', '', '', '0', 0, '0', '', '', ''),
(285, 'ZAMOR CELERY (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z420', '', '', '0', 0, '0', '', '', ''),
(286, 'ZAMORFUNKY FENNEL (100g)', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z437', '', '', '0', 0, '0', '', '', ''),
(287, 'ZAMOR GARLIC & SPRING ONION (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z444', '', '', '0', 0, '0', '', '', ''),
(288, 'ZAMOR MIXED CHILLIES (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z451', '', '', '0', 0, '0', '', '', ''),
(289, 'ZAMOR MIXED HERBS (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z468', '', '', '0', 0, '0', '', '', ''),
(290, 'ZAMOR ORIGANUM (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z475', '', '', '0', 0, '0', '', '', '');
INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_sell_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`, `date_added`, `belongs_to`, `stock_branch_id`, `barcode`, `manufactor_date`, `expire_date`, `wholesale_price`, `discount_price`, `special_price`, `currency_id`, `vat_status`, `pack_size`) VALUES
(291, 'ZAMOR CRUNCHY CORIANDER', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z482', '', '', '0', 0, '0', '', '', ''),
(292, 'ZAMOR PARSLEY & BASIL (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z499', '', '', '0', 0, '0', '', '', ''),
(293, 'ZAMOR ROSEMARY (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z505', '', '', '0', 0, '0', '', '', ''),
(294, 'ZAMOR SAGE (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z512', '', '', '0', 0, '0', '', '', ''),
(295, 'ZAMOR SRIRACHA SALT', '', '0.00', '43', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z529', '', '', '0', 0, '0', '', '', ''),
(296, 'ZAMOR THYME (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z536', '', '', '0', 0, '0', '', '', ''),
(297, 'ZAMOR BASIL LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z543', '', '', '0', 0, '0', '', '', ''),
(298, 'ZAMOR MORINGA & CELERY SALT', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z550', '', '', '0', 0, '0', '', '', ''),
(299, 'ZAMOR CELERY SALT', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z567', '', '', '0', 0, '0', '', '', ''),
(300, 'ZAMOR CURRY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z574', '', '', '0', 0, '0', '', '', ''),
(301, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z581', '', '', '0', 0, '0', '', '', ''),
(302, 'ZAMOR MINT LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z598', '', '', '0', 0, '0', '', '', ''),
(303, 'ZAMOR LEMONGRASS (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z604', '', '', '0', 0, '0', '', '', ''),
(304, 'ZAMOR THYME LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z611', '', '', '0', 0, '0', '', '', ''),
(305, 'ZAMOR CHILLI OIL 125ML', '', '0.00', '26', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z628', '', '', '0', 0, '0', '', '', ''),
(306, 'ZAMOR DELICIOUS DILL', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z635', '', '', '0', 0, '0', '', '', ''),
(307, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '', '0.00', '45', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z642', '', '', '0', 0, '0', '', '', ''),
(308, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z666', '', '', '0', 0, '0', '', '', ''),
(309, 'ZAMOR CHILLIES, GARLIC & SALT', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z673', '', '', '0', 0, '0', '', '', ''),
(310, 'ZAMOR DRIED CHILLIES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z697', '', '', '0', 0, '0', '', '', ''),
(311, 'ZAMOR PUNCHY PARSLEY', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z703', '', '', '0', 0, '0', '', '', ''),
(312, 'ZAMOR ONION POWDER 100g', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z751', '', '', '0', 0, '0', '', '', ''),
(313, 'ZAMOR DILL (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z768', '', '', '0', 0, '0', '', '', ''),
(314, 'ZAMOR FENNEL 100g', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z775', '', '', '0', 0, '0', '', '', ''),
(315, 'ZAMOR Parsley (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z805', '', '', '0', 0, '0', '', '', ''),
(316, 'ZAMOR LUSCIOUS LAMB', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z867', '', '', '0', 0, '0', '', '', ''),
(317, 'ZAMOR HERBY HUKU', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z881', '', '', '0', 0, '0', '', '', ''),
(318, 'ZAMOR SRIRACHA SALT (BULK)', '', '0.00', '250', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z900', '', '', '0', 0, '0', '', '', ''),
(319, 'ZAMOR BULK CHILLIES', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z901', '', '', '0', 0, '0', '', '', ''),
(320, 'ZAMOR CELERY POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z902', '', '', '0', 0, '0', '', '', ''),
(321, 'ZAMOR CELERY STEM (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z903', '', '', '0', 0, '0', '', '', ''),
(322, 'ZAMOR PINK HIMALAYAN SALT (100g)', '', '0.00', '43', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z904', '', '', '0', 0, '0', '', '', ''),
(323, 'CHIA SEED', '', '0.00', '120', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z905', '', '', '0', 0, '0', '', '', ''),
(324, 'ZAMOR CHILLI POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z906', '', '', '0', 0, '0', '', '', ''),
(325, 'ZAMOR CHIVES (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z907', '', '', '0', 0, '0', '', '', ''),
(326, 'ZAMOR CRUNCHY CORIANDER (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z908', '', '', '0', 0, '0', '', '', ''),
(327, 'ZAMOR DILL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z909', '', '', '0', 0, '0', '', '', ''),
(328, 'ZAMOR FENNEL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z910', '', '', '0', 0, '0', '', '', ''),
(329, 'ZAMOR FENNEL ROOT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z911', '', '', '0', 0, '0', '', '', ''),
(330, 'ZAMOR GARLIC CHIVES (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z912', '', '', '0', 0, '0', '', '', ''),
(331, 'ZAMOR ONION POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z913', '', '', '0', 0, '0', '', '', ''),
(332, 'ZAMOR LEMON GRASS (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z914', '', '', '0', 0, '0', '', '', ''),
(333, 'ZAMOR MINT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z915', '', '', '0', 0, '0', '', '', ''),
(334, 'ZAMOR MORINGA LEAF', '', '0.00', '185', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z916', '', '', '0', 0, '0', '', '', ''),
(335, 'ZAMOR SPRING ONION POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z917', '', '', '0', 0, '0', '', '', ''),
(336, 'ZAMOR TARRAGON (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z918', '', '', '0', 0, '0', '', '', ''),
(337, 'ZAMOR THYME BULK (KG)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z919', '', '', '0', 0, '0', '', '', ''),
(338, 'ZAMOR DELICIOUS DILL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z920', '', '', '0', 0, '0', '', '', ''),
(339, 'ZAMOR SAGE (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z921', '', '', '0', 0, '0', '', '', ''),
(340, 'ZAMOR CURRY LEAVES (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z922', '', '', '0', 0, '0', '', '', ''),
(341, 'ZAMOR PARSLEY LEAF (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z923', '', '', '0', 0, '0', '', '', ''),
(342, 'ZAMOR BLACK PEPPER CORNS (100g)', '', '0.00', '50', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z928', '', '', '0', 0, '0', '', '', ''),
(343, 'ZAMOR TARRAGON (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z966', '', '', '0', 0, '0', '', '', ''),
(344, 'ZAMOR HERBY HUKU (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z981', '', '', '0', 0, '0', '', '', ''),
(345, 'ZAMOR LUSCIOUS LUMB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z983', '', '', '0', 0, '0', '', '', ''),
(346, 'ZAMOR CORIANDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z984', '', '', '0', 0, '0', '', '', ''),
(347, 'ZAMOR CHICKEN RUB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z985', '', '', '0', 0, '0', '', '', ''),
(348, 'ZAMOR CAJUN RUB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z986', '', '', '0', 0, '0', '', '', ''),
(349, 'ZAMOR LAMB RUB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z987', '', '', '0', 0, '0', '', '', ''),
(350, 'ZAMOR CELERY SALT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z988', '', '', '0', 0, '0', '', '', ''),
(351, 'ZAMOR FUNKY FENNL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z989', '', '', '0', 0, '0', '', '', ''),
(352, 'ZAMOR CHILLI, GARLIC SALT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z990', '', '', '0', 0, '0', '', '', ''),
(353, 'ZAMOR MIXED HERBS (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z991', '', '', '0', 0, '0', '', '', ''),
(354, 'ZAMOR PINK HIMALAYAN SALT (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z992', '', '', '0', 0, '0', '', '', ''),
(355, 'ZAMOR BLACK PEPPER CORNS (BULK)', '', '0.00', '224', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z993', '', '', '0', 0, '0', '', '', ''),
(356, 'ZAMOR MORINGA CELERY SALT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z994', '', '', '0', 0, '0', '', '', ''),
(357, 'ZAMOR ORIGANUM (Bulk)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z996', '', '', '0', 0, '0', '', '', ''),
(358, 'ZAMOR BASIL LEAVES BULK (KG)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z997', '', '', '0', 0, '0', '', '', ''),
(359, 'ZAMOR ROSEMARY (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z998', '', '', '0', 0, '0', '', '', ''),
(360, 'ZAMOR MIXED CHILLIES (BULK) 500G', '', '0.00', '200', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z999', '', '', '0', 0, '0', '', '', ''),
(361, '', '', '0.00', '', '', 0, '0', 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(362, 'Moringa Miracle Capsules 180s (1x12)', '', '0.00', '825', '', 0, '9', 1, 0, 17, '', '2022-01-19 12:44:09', 7, 7, '1', '', '', '0', 0, '0', '', '', ''),
(363, 'Moringa Miracle Green Tea (1x12)', '', '0.00', '220', '', 0, '3', 1, 0, 17, '', '2022-01-19 12:21:17', 7, 7, '3', '', '', '0', 0, '0', '', '', ''),
(364, 'Moringa Powder (Bulk per KG)', '', '0.00', '51', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '4', '', '', '0', 0, '0', '', '', ''),
(365, 'Moringa Green Tea (Single)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '6', '', '', '0', 0, '0', '', '', ''),
(366, 'Moringa Capsules 180s (Singles)', '', '0.00', '90', '', 0, '0', 1, 0, 17, '', '2022-01-18 13:40:16', 7, 7, '7', '', '', '0', 0, '0', '', '', ''),
(367, 'No Sale/Cancelled Invoices', '', '0.00', '  -    ', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '10', '', '', '0', 0, '0', '', '', ''),
(368, 'Moringa Miracle Capsules 90s (1x15)', '', '0.00', '640', '', 0, '8', 1, 0, 17, '', '2022-01-19 12:44:35', 7, 7, '14', '', '', '0', 0, '0', '', '', ''),
(369, 'Moringa S.U.P. 250g Powder (Single)', '', '0.00', '60', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '20', '', '', '0', 0, '0', '', '', ''),
(370, 'Moringa Human Powder 100g (1x10)', '', '0.00', '230', '', 0, '5', 1, 0, 17, '', '2022-01-19 12:45:01', 7, 7, '25', '', '', '0', 0, '0', '', '', ''),
(371, 'Moringa 100g Powder (Single)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '33', '', '', '0', 0, '0', '', '', ''),
(372, 'Moringa Animal Feed Supplement 3kg', '', '0.00', '70', '', 0, '31', 1, 0, 17, '', '2022-01-19 12:43:12', 7, 7, '41', '', '', '0', 0, '0', '', '', ''),
(373, 'Moringa Animal Supplement 6kg', '', '0.00', '140', '', 0, '5', 1, 0, 17, '', '2022-01-19 12:43:40', 7, 7, '42', '', '', '0', 0, '0', '', '', ''),
(374, 'Moringa Pet Food Suppliment (1x10)', '', '0.00', '195', '', 0, '2', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '43', '', '', '0', 0, '0', '', '', ''),
(375, 'Moringa Capsules 90s (Singles)', '', '0.00', '56', '', 0, '0', 1, 0, 17, '', '2022-01-18 13:40:16', 7, 7, '45', '', '', '0', 0, '0', '', '', ''),
(376, 'Moringa 5KG Protein Pellets', '', '0.00', '145', '', 0, '1', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '46', '', '', '0', 0, '0', '', '', ''),
(377, 'Moringa 200G Protein Pellets (10x200G)', '', '0.00', '135', '', 0, '1', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '47', '', '', '0', 0, '0', '', '', ''),
(378, 'Moringa 200G Protein Pellets (Singles)', '', '0.00', '13', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '48', '', '', '0', 0, '0', '', '', ''),
(379, 'Moringa Animal Feed 200g (Singles)', '', '0.00', '18', '', 0, '1', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '49', '', '', '0', 0, '0', '', '', ''),
(380, 'Assorted Moringa Tea Pack', '', '0.00', '140', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '50', '', '', '0', 0, '0', '', '', ''),
(381, 'Moringa Lemon Grass Infusion (1x12)', '', '0.00', '250', '', 0, '2', 1, 0, 17, '', '2022-01-19 12:25:47', 7, 7, '52', '', '', '0', 0, '0', '', '', ''),
(382, 'Moringa Ginger & Lemon Infusion (1x12)', '', '0.00', '250', '', 0, '3', 1, 0, 17, '', '2022-01-19 12:26:17', 7, 7, '53', '', '', '0', 0, '0', '', '', ''),
(383, 'Moringa Apple & Cinnamon Infusion (1x12)', '', '0.00', '250', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '54', '', '', '0', 0, '0', '', '', ''),
(384, 'Moringa Lemon Grass Infusion (Singles)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '57', '', '', '0', 0, '0', '', '', ''),
(385, 'Moringa Ginger & Lemon Infusion (Singles)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '58', '', '', '0', 0, '0', '', '', ''),
(386, 'Moringa Apple & Cinnamon Infusion (Singles)', '', '0.00', '30', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '59', '', '', '0', 0, '0', '', '', ''),
(387, 'Moringa Pet Food Supplement (Singles)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '63', '', '', '0', 0, '0', '', '', ''),
(388, 'Moringa AFS 200g (1x10)', '', '0.00', '130', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '68', '', '', '0', 0, '0', '', '', ''),
(389, 'Sheep sales', '', '0.00', '140', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '70', '', '', '0', 0, '0', '', '', ''),
(390, 'Green Carrier Bags', '', '0.00', '3', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '71', '', '', '0', 0, '0', '', '', ''),
(391, 'Moringa Oil 100ml', '', '0.00', '120', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '72', '', '', '0', 0, '0', '', '', ''),
(392, 'Moringa Oil 50ML', '', '0.00', '60', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '73', '', '', '0', 0, '0', '', '', ''),
(393, 'Moringa Oil (Bulk per Litre)', '', '0.00', '960', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '74', '', '', '0', 0, '0', '', '', ''),
(394, 'ZAMOR STARTER PACK (24 PIECE)', '', '0.00', '670', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z200', '', '', '0', 0, '0', '', '', ''),
(395, 'ZAMOR PICNIC GOURMET SET', '', '0.00', '275', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z201', '', '', '0', 0, '0', '', '', ''),
(396, 'ZAMOR STARTER PACK (12 PIECE)', '', '0.00', '371', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z202', '', '', '0', 0, '0', '', '', ''),
(397, 'ZAMOR CHADAROO CHUNKY 220G', '', '0.00', '55', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z216', '', '', '0', 0, '0', '', '', ''),
(398, 'ZAMOR CHADAROO PASTE 220G', '', '0.00', '55', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z223', '', '', '0', 0, '0', '', '', ''),
(399, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '', '0.00', '45', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z254', '', '', '0', 0, '0', '', '', ''),
(400, 'ZAMOR CUCUMBER 550G', '', '0.00', '33', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z278', '', '', '0', 0, '0', '', '', ''),
(401, 'ZAMOR CAJUN RUB 100g', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z283', '', '', '0', 0, '0', '', '', ''),
(402, 'ZAMOR CHICKEN RUB 100g', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z290', '', '', '0', 0, '0', '', '', ''),
(403, 'ZAMOR LAMB RUB 100g', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z306', '', '', '0', 0, '0', '', '', ''),
(404, 'ZAMOR BASIL (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z413', '', '', '0', 0, '0', '', '', ''),
(405, 'ZAMOR CELERY (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z420', '', '', '0', 0, '0', '', '', ''),
(406, 'ZAMORFUNKY FENNEL (100g)', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z437', '', '', '0', 0, '0', '', '', ''),
(407, 'ZAMOR GARLIC & SPRING ONION (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z444', '', '', '0', 0, '0', '', '', ''),
(408, 'ZAMOR MIXED CHILLIES (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z451', '', '', '0', 0, '0', '', '', ''),
(409, 'ZAMOR MIXED HERBS (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z468', '', '', '0', 0, '0', '', '', ''),
(410, 'ZAMOR ORIGANUM (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z475', '', '', '0', 0, '0', '', '', ''),
(411, 'ZAMOR CRUNCHY CORIANDER', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z482', '', '', '0', 0, '0', '', '', ''),
(412, 'ZAMOR PARSLEY & BASIL (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z499', '', '', '0', 0, '0', '', '', ''),
(413, 'ZAMOR ROSEMARY (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z505', '', '', '0', 0, '0', '', '', ''),
(414, 'ZAMOR SAGE (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z512', '', '', '0', 0, '0', '', '', ''),
(415, 'ZAMOR SRIRACHA SALT', '', '0.00', '43', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z529', '', '', '0', 0, '0', '', '', ''),
(416, 'ZAMOR THYME (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z536', '', '', '0', 0, '0', '', '', ''),
(417, 'ZAMOR BASIL LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z543', '', '', '0', 0, '0', '', '', ''),
(418, 'ZAMOR MORINGA & CELERY SALT', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z550', '', '', '0', 0, '0', '', '', ''),
(419, 'ZAMOR CELERY SALT', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z567', '', '', '0', 0, '0', '', '', ''),
(420, 'ZAMOR CURRY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z574', '', '', '0', 0, '0', '', '', ''),
(421, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z581', '', '', '0', 0, '0', '', '', ''),
(422, 'ZAMOR MINT LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z598', '', '', '0', 0, '0', '', '', ''),
(423, 'ZAMOR LEMONGRASS (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z604', '', '', '0', 0, '0', '', '', ''),
(424, 'ZAMOR THYME LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z611', '', '', '0', 0, '0', '', '', ''),
(425, 'ZAMOR CHILLI OIL 125ML', '', '0.00', '26', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z628', '', '', '0', 0, '0', '', '', ''),
(426, 'ZAMOR DELICIOUS DILL', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z635', '', '', '0', 0, '0', '', '', ''),
(427, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '', '0.00', '45', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z642', '', '', '0', 0, '0', '', '', ''),
(428, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z666', '', '', '0', 0, '0', '', '', ''),
(429, 'ZAMOR CHILLIES, GARLIC & SALT', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z673', '', '', '0', 0, '0', '', '', ''),
(430, 'ZAMOR DRIED CHILLIES (50g) POUCHES', '', '0.00', '20', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z697', '', '', '0', 0, '0', '', '', ''),
(431, 'ZAMOR PUNCHY PARSLEY', '', '0.00', '35', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z703', '', '', '0', 0, '0', '', '', ''),
(432, 'ZAMOR ONION POWDER 100g', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z751', '', '', '0', 0, '0', '', '', ''),
(433, 'ZAMOR DILL (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z768', '', '', '0', 0, '0', '', '', ''),
(434, 'ZAMOR FENNEL 100g', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z775', '', '', '0', 0, '0', '', '', ''),
(435, 'ZAMOR Parsley (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z805', '', '', '0', 0, '0', '', '', ''),
(436, 'ZAMOR LUSCIOUS LAMB', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z867', '', '', '0', 0, '0', '', '', ''),
(437, 'ZAMOR HERBY HUKU', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z881', '', '', '0', 0, '0', '', '', ''),
(438, 'ZAMOR SRIRACHA SALT (BULK)', '', '0.00', '250', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z900', '', '', '0', 0, '0', '', '', ''),
(439, 'ZAMOR BULK CHILLIES', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z901', '', '', '0', 0, '0', '', '', ''),
(440, 'ZAMOR CELERY POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z902', '', '', '0', 0, '0', '', '', ''),
(441, 'ZAMOR CELERY STEM (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z903', '', '', '0', 0, '0', '', '', ''),
(442, 'ZAMOR PINK HIMALAYAN SALT (100g)', '', '0.00', '43', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z904', '', '', '0', 0, '0', '', '', ''),
(443, 'CHIA SEED', '', '0.00', '120', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z905', '', '', '0', 0, '0', '', '', ''),
(444, 'ZAMOR CHILLI POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z906', '', '', '0', 0, '0', '', '', ''),
(445, 'ZAMOR CHIVES (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z907', '', '', '0', 0, '0', '', '', ''),
(446, 'ZAMOR CRUNCHY CORIANDER (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z908', '', '', '0', 0, '0', '', '', ''),
(447, 'ZAMOR DILL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z909', '', '', '0', 0, '0', '', '', ''),
(448, 'ZAMOR FENNEL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z910', '', '', '0', 0, '0', '', '', ''),
(449, 'ZAMOR FENNEL ROOT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z911', '', '', '0', 0, '0', '', '', ''),
(450, 'ZAMOR GARLIC CHIVES (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z912', '', '', '0', 0, '0', '', '', ''),
(451, 'ZAMOR ONION POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z913', '', '', '0', 0, '0', '', '', ''),
(452, 'ZAMOR LEMON GRASS (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z914', '', '', '0', 0, '0', '', '', ''),
(453, 'ZAMOR MINT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z915', '', '', '0', 0, '0', '', '', ''),
(454, 'ZAMOR MORINGA LEAF', '', '0.00', '185', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z916', '', '', '0', 0, '0', '', '', ''),
(455, 'ZAMOR SPRING ONION POWDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z917', '', '', '0', 0, '0', '', '', ''),
(456, 'ZAMOR TARRAGON (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z918', '', '', '0', 0, '0', '', '', ''),
(457, 'ZAMOR THYME BULK (KG)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z919', '', '', '0', 0, '0', '', '', ''),
(458, 'ZAMOR DELICIOUS DILL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z920', '', '', '0', 0, '0', '', '', ''),
(459, 'ZAMOR SAGE (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z921', '', '', '0', 0, '0', '', '', ''),
(460, 'ZAMOR CURRY LEAVES (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z922', '', '', '0', 0, '0', '', '', ''),
(461, 'ZAMOR PARSLEY LEAF (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z923', '', '', '0', 0, '0', '', '', ''),
(462, 'ZAMOR BLACK PEPPER CORNS (100g)', '', '0.00', '50', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z928', '', '', '0', 0, '0', '', '', ''),
(463, 'ZAMOR TARRAGON (100g)', '', '0.00', '25', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z966', '', '', '0', 0, '0', '', '', ''),
(464, 'ZAMOR HERBY HUKU (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z981', '', '', '0', 0, '0', '', '', ''),
(465, 'ZAMOR LUSCIOUS LUMB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z983', '', '', '0', 0, '0', '', '', ''),
(466, 'ZAMOR CORIANDER (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z984', '', '', '0', 0, '0', '', '', ''),
(467, 'ZAMOR CHICKEN RUB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z985', '', '', '0', 0, '0', '', '', ''),
(468, 'ZAMOR CAJUN RUB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z986', '', '', '0', 0, '0', '', '', ''),
(469, 'ZAMOR LAMB RUB (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z987', '', '', '0', 0, '0', '', '', ''),
(470, 'ZAMOR CELERY SALT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z988', '', '', '0', 0, '0', '', '', ''),
(471, 'ZAMOR FUNKY FENNL (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z989', '', '', '0', 0, '0', '', '', ''),
(472, 'ZAMOR CHILLI, GARLIC SALT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z990', '', '', '0', 0, '0', '', '', ''),
(473, 'ZAMOR MIXED HERBS (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z991', '', '', '0', 0, '0', '', '', ''),
(474, 'ZAMOR PINK HIMALAYAN SALT (BULK)', '', '0.00', '150', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z992', '', '', '0', 0, '0', '', '', ''),
(475, 'ZAMOR BLACK PEPPER CORNS (BULK)', '', '0.00', '224', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z993', '', '', '0', 0, '0', '', '', ''),
(476, 'ZAMOR MORINGA CELERY SALT (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z994', '', '', '0', 0, '0', '', '', ''),
(477, 'ZAMOR ORIGANUM (Bulk)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z996', '', '', '0', 0, '0', '', '', ''),
(478, 'ZAMOR BASIL LEAVES BULK (KG)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z997', '', '', '0', 0, '0', '', '', ''),
(479, 'ZAMOR ROSEMARY (BULK)', '', '0.00', '145', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z998', '', '', '0', 0, '0', '', '', ''),
(480, 'ZAMOR MIXED CHILLIES (BULK) 500G', '', '0.00', '200', '', 0, '0', 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z999', '', '', '0', 0, '0', '', '', ''),
(485, 'Moringa Animal Feed Supplement 3kg', 'Moringa Animal Feed Supplement 3kg', '0.00', '70', 'default.gif', 59, '0', 1, 0, 17, '0', '2023-09-05 07:02:12', 4, 4, '41', '', '', '0', 0, '0', '', '', '0'),
(487, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules ', '0.00', '825', 'default.gif', 59, '17', 1, 0, 17, '0', '2023-09-21 14:38:14', 4, 4, '01', '', '', '0', 0, '0', '', '', '0'),
(488, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '640.00', '640', 'default.gif', 59, '28', 1, 0, 17, 'Non', '2023-10-05 07:26:13', 59, 4, '14', '', '', '0', 0, '0', '', '', ''),
(489, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '640.00', '640', '', 59, '31', 1, 0, 17, 'Non', '2022-01-19 12:51:51', 59, 5, '14', '', '', NULL, 0, NULL, '', '', ''),
(490, 'Moringa Human Powder 100g (singles)', '', '0.00', '30', 'default.gif', 59, '0', 1, 0, 17, 'Non', '2023-09-04 13:44:25', 59, 4, '', '', '', '0', 0, '0', '', '', ''),
(492, 'Moringa Powder (Bulk per KG)', 'Moringa Powder (Bulk per KG)', '51.00', '200', 'default.gif', 59, '30150', 1, 0, 17, '0', '2022-01-20 14:07:59', 9, 9, '4', '', '', '0', 0, '0', '2', 'free', 'na'),
(493, 'Moringa Green Tea (Single)', 'Moringa Green Tea (Single)', '0.00', '25', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '6', '', '', '0', 0, '0', '2', 'free', 'na'),
(494, 'Moringa Capsules 180''s (Singles)', 'Moringa Capsules 180''s (Singles)', '0.00', '90', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '7', '', '', '0', 0, '0', '2', 'free', 'na'),
(495, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '0.00', '640', '', 59, '316', 1, 0, 17, '', '2023-08-10 09:19:52', 9, 9, '14', '', '', '0', 0, '0', '2', 'free', 'na'),
(496, 'Moringa S.U.P. 250g Powder (Single)', 'Moringa S.U.P. 250g Powder (Single)', '0.00', '60', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '20', '', '', '0', 0, '0', '2', 'free', 'na'),
(497, 'Moringa Human Powder 100g (1x10)', 'Moringa Human Powder 100g (1x10)', '0.00', '230', '', 59, '13', 1, 0, 17, '', '2022-11-18 14:05:54', 9, 9, '25', '', '', '0', 0, '0', '2', 'free', 'na'),
(498, 'Moringa 100g Powder (Single)', 'Moringa 100g Powder (Single)', '0.00', '30', '', 59, '-1', 1, 0, 17, '', '2022-07-09 10:53:22', 9, 9, '33', '', '', '0', 0, '0', '2', 'free', 'na'),
(499, 'Moringa Animal Feed Supplement 3kg', 'Moringa Animal Feed Supplement 3kg', '0.00', '70', '', 59, '270', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '41', '', '', '0', 0, '0', '2', 'free', 'na'),
(500, 'Moringa Animal Supplement 6kg', 'Moringa Animal Supplement 6kg', '0.00', '140', '', 59, '296', 1, 0, 17, '', '2022-11-16 13:02:06', 9, 9, '42', '', '', '0', 0, '0', '2', 'free', 'na'),
(501, 'Moringa Pet Food Suppliment (1x10)', 'Moringa Pet Food Suppliment (1x10)', '0.00', '195', '', 59, '28', 1, 0, 17, '', '2022-07-09 10:52:58', 9, 9, '43', '', '', '0', 0, '0', '2', 'free', 'na'),
(502, 'Moringa Capsules 90''s (Singles)', 'Moringa Capsules 90''s (Singles)', '0.00', '56', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '45', '', '', '0', 0, '0', '2', 'free', 'na'),
(503, 'Moringa 5KG Protein Pellets', 'Moringa 5KG Protein Pellets', '0.00', '145', '', 59, '76', 1, 0, 17, '', '2023-08-10 09:19:52', 9, 9, '46', '', '', '0', 0, '0', '2', 'free', 'na'),
(504, 'Moringa 200G Protein Pellets (10x200G)', 'Moringa 200G Protein Pellets (10x200G)', '0.00', '135', '', 59, '14', 1, 0, 17, '', '2023-08-11 14:55:31', 9, 9, '47', '', '', '0', 0, '0', '2', 'free', 'na'),
(505, 'Moringa 200G Protein Pellets (Singles)', 'Moringa 200G Protein Pellets (Singles)', '0.00', '13', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '48', '', '', '0', 0, '0', '2', 'free', 'na'),
(506, 'Moringa Animal Feed 200g (Singles)', 'Moringa Animal Feed 200g (Singles)', '0.00', '18', '', 59, '-31', 1, 0, 17, '', '2022-07-09 10:52:58', 9, 9, '49', '', '', '0', 0, '0', '2', 'free', 'na'),
(507, 'Assorted Moringa Tea Pack', 'Assorted Moringa Tea Pack', '0.00', '140', '', 59, '-13', 1, 0, 17, '', '2022-11-17 12:02:29', 9, 9, '50', '', '', '0', 0, '0', '2', 'free', 'na'),
(508, 'Moringa Lemon Grass Infusion (1x12)', 'Moringa Lemon Grass Infusion (1x12)', '0.00', '250', '', 59, '263', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '52', '', '', '0', 0, '0', '2', 'free', 'na'),
(509, 'Moringa Ginger & Lemon Infusion (1x12)', 'Moringa Ginger & Lemon Infusion (1x12)', '0.00', '250', '', 59, '331', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '53', '', '', '0', 0, '0', '2', 'free', 'na'),
(510, 'Moringa Apple & Cinnamon Infusion (1x12)', 'Moringa Apple & Cinnamon Infusion (1x12)', '0.00', '250', '', 59, '185', 1, 0, 17, '', '2023-08-11 14:55:31', 9, 9, '54', '', '', '0', 0, '0', '2', 'free', 'na'),
(511, 'Moringa Lemon Grass Infusion (Singles)', 'Moringa Lemon Grass Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '57', '', '', '0', 0, '0', '2', 'free', 'na'),
(512, 'Moringa Ginger & Lemon Infusion (Singles)', 'Moringa Ginger & Lemon Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '58', '', '', '0', 0, '0', '2', 'free', 'na'),
(513, 'Moringa Apple & Cinnamon Infusion (Singles)', 'Moringa Apple & Cinnamon Infusion (Singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '59', '', '', '0', 0, '0', '2', 'free', 'na'),
(514, 'Moringa Pet Food Supplement (Singles)', 'Moringa Pet Food Supplement (Singles)', '0.00', '25', '', 59, '-1', 1, 0, 17, '', '2022-07-09 10:52:58', 9, 9, '63', '', '', '0', 0, '0', '2', 'free', 'na'),
(515, 'Moringa AFS 200g (1x10)', 'Moringa AFS 200g (1x10)', '0.00', '130', '', 59, '22', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '68', '', '', '0', 0, '0', '2', 'free', 'na'),
(516, 'Sheep sales', 'Sheep sales', '0.00', '140', 'default.gif', 59, '19.5', 1, 0, 17, '0', '2022-07-09 10:52:58', 9, 9, '70', '', '', '0', 0, '0', '2', 'free', 'na'),
(517, 'Green Carrier Bags', 'Green Carrier Bags', '0.00', '3', '', 59, '-6', 1, 0, 17, '', '2022-11-17 12:02:29', 9, 9, '71', '', '', '0', 0, '0', '2', 'free', 'na'),
(518, 'Moringa Oil 100ml', 'Moringa Oil 100ml', '0.00', '120', '', 59, '282', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '72', '', '', '0', 0, '0', '2', 'free', 'na'),
(519, 'Moringa Oil 50ML', 'Moringa Oil 50ML', '0.00', '60', '', 59, '73', 1, 0, 17, '', '2022-11-18 14:05:54', 9, 9, '73', '', '', '0', 0, '0', '2', 'free', 'na'),
(520, 'Moringa Oil (Bulk per Litre)', 'Moringa Oil (Bulk per Litre)', '0.00', '960', '', 59, '60', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '74', '', '', '0', 0, '0', '2', 'free', 'na'),
(521, 'ZAMOR STARTER PACK (24 PIECE)', 'ZAMOR STARTER PACK (24 PIECE)', '0.00', '670', 'default.gif', 62, '0', 1, 0, 17, '0', '2022-01-20 13:36:45', 4, 4, 'Z200', '', '', '0', 0, '0', '2', 'free', 'EC'),
(522, 'ZAMOR PICNIC GOURMET SET', 'ZAMOR PICNIC GOURMET SET', '0.00', '275', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z201', '', '', '0', 0, '0', '2', 'free', 'na'),
(523, 'ZAMOR STARTER PACK (12 PIECE)', 'ZAMOR STARTER PACK (12 PIECE)', '0.00', '371', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z202', '', '', '0', 0, '0', '2', 'free', 'na'),
(524, 'ZAMOR CHADAROO CHUNKY 220G', 'ZAMOR CHADAROO CHUNKY 220G', '0.00', '55', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z216', '', '', '0', 0, '0', '2', 'free', 'na'),
(525, 'ZAMOR CHADAROO PASTE 220G', 'ZAMOR CHADAROO PASTE 220G', '0.00', '55', '', 59, '519', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z223', '', '', '0', 0, '0', '2', 'free', 'na'),
(526, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '0.00', '45', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z254', '', '', '0', 0, '0', '2', 'free', 'na'),
(527, 'ZAMOR CUCUMBER 550G', 'ZAMOR CUCUMBER 550G', '0.00', '33', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z278', '', '', '0', 0, '0', '2', 'free', 'na'),
(528, 'ZAMOR CAJUN RUB 100g', 'ZAMOR CAJUN RUB 100g', '0.00', '35', '', 59, '150', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z283', '', '', '0', 0, '0', '2', 'free', 'na'),
(529, 'ZAMOR CHICKEN RUB 100g', 'ZAMOR CHICKEN RUB 100g', '0.00', '35', '', 59, '156', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z290', '', '', '0', 0, '0', '2', 'free', 'na'),
(530, 'ZAMOR LAMB RUB 100g', 'ZAMOR LAMB RUB 100g', '0.00', '35', '', 59, '216', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z306', '', '', '0', 0, '0', '2', 'free', 'na'),
(531, 'ZAMOR BASIL (100g)', 'ZAMOR BASIL (100g)', '0.00', '25', '', 59, '40', 1, 0, 17, '', '2022-11-18 14:35:50', 9, 9, 'Z413', '', '', '0', 0, '0', '2', 'free', 'na'),
(532, 'ZAMOR CELERY (100g)', 'ZAMOR CELERY (100g)', '0.00', '25', '', 59, '184', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z420', '', '', '0', 0, '0', '2', 'free', 'na'),
(533, 'ZAMOR FUNKY FENNEL (100g)', 'ZAMORFUNKY FENNEL (100g)', '0.00', '35', 'default.gif', 59, '53', 1, 0, 17, '0', '2023-09-04 11:37:21', 4, 4, 'Z437', '', '', '0', 0, '0', '2', 'free', 'na'),
(534, 'ZAMOR GARLIC & SPRING ONION (100g)', 'ZAMOR GARLIC & SPRING ONION (100g)', '0.00', '25', '', 59, '-198', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z444', '', '', '0', 0, '0', '2', 'free', 'na'),
(535, 'ZAMOR MIXED CHILLIES (100g)', 'ZAMOR MIXED CHILLIES (100g)', '0.00', '25', '', 59, '258', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z451', '', '', '0', 0, '0', '2', 'free', 'na'),
(536, 'ZAMOR MIXED HERBS (100g)', 'ZAMOR MIXED HERBS (100g)', '0.00', '25', '', 59, '12', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z468', '', '', '0', 0, '0', '2', 'free', 'na'),
(537, 'ZAMOR ORIGANUM (100g)', 'ZAMOR ORIGANUM (100g)', '0.00', '25', '', 59, '18', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z475', '', '', '0', 0, '0', '2', 'free', 'na'),
(538, 'ZAMOR CRUNCHY CORIANDER', 'ZAMOR CRUNCHY CORIANDER', '0.00', '35', '', 59, '-7', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z482', '', '', '0', 0, '0', '2', 'free', 'na'),
(539, 'ZAMOR PARSLEY & BASIL (100g)', 'ZAMOR PARSLEY & BASIL (100g)', '0.00', '25', '', 59, '108', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z499', '', '', '0', 0, '0', '2', 'free', 'na'),
(540, 'ZAMOR ROSEMARY (100g)', 'ZAMOR ROSEMARY (100g)', '0.00', '25', '', 59, '-30', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z505', '', '', '0', 0, '0', '2', 'free', 'na'),
(541, 'ZAMOR SAGE (100g)', 'ZAMOR SAGE (100g)', '0.00', '25', '', 59, '30', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z512', '', '', '0', 0, '0', '2', 'free', 'na'),
(542, 'ZAMOR SRIRACHA SALT', 'ZAMOR SRIRACHA SALT', '0.00', '43', '', 59, '139', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z529', '', '', '0', 0, '0', '2', 'free', 'na'),
(543, 'ZAMOR THYME (100g)', 'ZAMOR THYME (100g)', '0.00', '25', '', 59, '24', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z536', '', '', '0', 0, '0', '2', 'free', 'na'),
(544, 'ZAMOR BASIL LEAVES (50G) POUCHES', 'ZAMOR BASIL LEAVES (50G) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z543', '', '', '0', 0, '0', '2', 'free', 'na'),
(545, 'ZAMOR MORINGA & CELERY SALT', 'ZAMOR MORINGA & CELERY SALT', '0.00', '35', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z550', '', '', '0', 0, '0', '2', 'free', 'na'),
(546, 'ZAMOR CELERY SALT', 'ZAMOR CELERY SALT', '0.00', '35', '', 59, '61', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z567', '', '', '0', 0, '0', '2', 'free', 'na'),
(547, 'ZAMOR CURRY LEAVES (50g) POUCHES', 'ZAMOR CURRY LEAVES (50g) POUCHES', '0.00', '20', '', 59, '-73', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z574', '', '', '0', 0, '0', '2', 'free', 'na'),
(548, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z581', '', '', '0', 0, '0', '2', 'free', 'na'),
(549, 'ZAMOR MINT LEAVES (50g) POUCHES', 'ZAMOR MINT LEAVES (50g) POUCHES', '0.00', '20', '', 59, '-30', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z598', '', '', '0', 0, '0', '2', 'free', 'na'),
(550, 'ZAMOR LEMONGRASS (100g)', 'ZAMOR LEMONGRASS (100g)', '0.00', '25', '', 59, '180', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z604', '', '', '0', 0, '0', '2', 'free', 'na'),
(551, 'ZAMOR THYME LEAVES (50G) POUCHES', 'ZAMOR THYME LEAVES (50G) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z611', '', '', '0', 0, '0', '2', 'free', 'na'),
(552, 'ZAMOR CHILLI OIL 125ML', 'ZAMOR CHILLI OIL 125ML', '0.00', '26', '', 59, '317', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z628', '', '', '0', 0, '0', '2', 'free', 'na'),
(553, 'ZAMOR DELICIOUS DILL', 'ZAMOR DELICIOUS DILL', '0.00', '35', '', 59, '63', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z635', '', '', '0', 0, '0', '2', 'free', 'na'),
(554, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '0.00', '45', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z642', '', '', '0', 0, '0', '2', 'free', 'na'),
(555, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '0.00', '20', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z666', '', '', '0', 0, '0', '2', 'free', 'na'),
(556, 'ZAMOR CHILLIES, GARLIC & SALT', 'ZAMOR CHILLIES, GARLIC & SALT', '0.00', '35', '', 59, '64', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z673', '', '', '0', 0, '0', '2', 'free', 'na'),
(557, 'ZAMOR DRIED CHILLIES (50g) POUCHES', 'ZAMOR DRIED CHILLIES (50g) POUCHES', '0.00', '20', '', 59, '-60', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z697', '', '', '0', 0, '0', '2', 'free', 'na'),
(558, 'ZAMOR PUNCHY PARSLEY', 'ZAMOR PUNCHY PARSLEY', '0.00', '35', '', 59, '59', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z703', '', '', '0', 0, '0', '2', 'free', 'na'),
(559, 'ZAMOR ONION POWDER 100g', 'ZAMOR ONION POWDER 100g', '0.00', '25', '', 59, '26', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z751', '', '', '0', 0, '0', '2', 'free', 'na'),
(560, 'ZAMOR DILL (100g)', 'ZAMOR DILL (100g)', '0.00', '25', '', 59, '216', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z768', '', '', '0', 0, '0', '2', 'free', 'na'),
(561, 'ZAMOR FENNEL 100g', 'ZAMOR FENNEL 100g', '0.00', '25', '', 59, '216', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z775', '', '', '0', 0, '0', '2', 'free', 'na'),
(562, 'ZAMOR Parsley (100g)', 'ZAMOR Parsley (100g)', '0.00', '25', '', 59, '48', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z805', '', '', '0', 0, '0', '2', 'free', 'na'),
(563, 'ZAMOR LUSCIOUS LAMB', 'ZAMOR LUSCIOUS LAMB', '0.00', '25', '', 59, '237', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z867', '', '', '0', 0, '0', '2', 'free', 'na'),
(564, 'ZAMOR HERBY HUKU', 'ZAMOR HERBY HUKU', '0.00', '25', '', 59, '224', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z881', '', '', '0', 0, '0', '2', 'free', 'na'),
(565, 'ZAMOR SRIRACHA SALT (BULK)', 'ZAMOR SRIRACHA SALT (BULK)', '0.00', '250', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z900', '', '', '0', 0, '0', '2', 'free', 'na'),
(566, 'ZAMOR BULK CHILLIES', 'ZAMOR BULK CHILLIES', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z901', '', '', '0', 0, '0', '2', 'free', 'na'),
(567, 'ZAMOR CELERY POWDER (BULK)', 'ZAMOR CELERY POWDER (BULK)', '0.00', '145', '', 59, '82', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z902', '', '', '0', 0, '0', '2', 'free', 'na'),
(568, 'ZAMOR CELERY STEM (BULK)', 'ZAMOR CELERY STEM (BULK)', '0.00', '145', 'default.gif', 59, '79.85', 1, 0, 17, '0', '2023-09-22 06:53:57', 4, 4, 'Z903', '', '', '0', 0, '0', '2', 'free', 'na'),
(569, 'ZAMOR PINK HIMALAYAN SALT (100g)', 'ZAMOR PINK HIMALAYAN SALT (100g)', '0.00', '43', '', 59, '196', 1, 0, 17, '', '2022-07-09 10:52:58', 9, 9, 'Z904', '', '', '0', 0, '0', '2', 'free', 'na'),
(570, 'CHIA SEED', 'CHIA SEED', '0.00', '120', '', 59, '-4', 1, 0, 17, '', '2022-11-17 12:02:29', 9, 9, 'Z905', '', '', '0', 0, '0', '2', 'free', 'na'),
(571, 'ZAMOR CHILLI POWDER (BULK)', 'ZAMOR CHILLI POWDER (BULK)', '0.00', '145', 'default.gif', 59, '256.990', 1, 0, 17, '0', '2022-01-21 09:33:39', 9, 9, 'Z906', '', '', '0', 0, '0', '2', 'free', 'na'),
(572, 'ZAMOR CHIVES (BULK)', 'ZAMOR CHIVES (BULK)', '0.00', '145', 'default.gif', 59, '19.857', 1, 0, 17, '0', '2023-09-21 14:38:53', 4, 4, 'Z907', '', '', '0', 0, '0', '2', 'free', 'na'),
(573, 'ZAMOR CRUNCHY CORIANDER (BULK)', 'ZAMOR CRUNCHY CORIANDER (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z908', '', '', '0', 0, '0', '2', 'free', 'na'),
(574, 'ZAMOR DILL (BULK)', 'ZAMOR DILL (BULK)', '0.00', '145', 'default.gif', 59, '1.908', 1, 0, 17, '0', '2022-01-21 09:25:27', 9, 9, 'Z909', '', '', '0', 0, '0', '2', 'free', 'na'),
(575, 'ZAMOR FENNEL (BULK)', 'ZAMOR FENNEL (BULK)', '0.00', '145', '', 59, '47', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z910', '', '', '0', 0, '0', '2', 'free', 'na'),
(576, 'ZAMOR FENNEL ROOT (BULK)', 'ZAMOR FENNEL ROOT (BULK)', '0.00', '145', 'default.gif', 59, '23.965', 1, 0, 17, '0', '2022-01-21 09:26:10', 9, 9, 'Z911', '', '', '0', 0, '0', '2', 'free', 'na'),
(577, 'ZAMOR GARLIC CHIVES (BULK)', 'ZAMOR GARLIC CHIVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z912', '', '', '0', 0, '0', '2', 'free', 'na'),
(578, 'ZAMOR ONION POWDER (BULK)', 'ZAMOR ONION POWDER (BULK)', '0.00', '145', '', 59, '28', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z913', '', '', '0', 0, '0', '2', 'free', 'na'),
(579, 'ZAMOR LEMON GRASS (BULK)', 'ZAMOR LEMON GRASS (BULK)', '0.00', '145', '', 59, '14', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z914', '', '', '0', 0, '0', '2', 'free', 'na'),
(580, 'ZAMOR MINT (BULK)', 'ZAMOR MINT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z915', '', '', '0', 0, '0', '2', 'free', 'na'),
(581, 'ZAMOR MORINGA LEAF', 'ZAMOR MORINGA LEAF', '0.00', '185', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z916', '', '', '0', 0, '0', '2', 'free', 'na'),
(582, 'ZAMOR SPRING ONION POWDER (BULK)', 'ZAMOR SPRING ONION POWDER (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z917', '', '', '0', 0, '0', '2', 'free', 'na'),
(583, 'ZAMOR TARRAGON (BULK)', 'ZAMOR TARRAGON (BULK)', '0.00', '145', 'default.gif', 59, '24.899', 1, 0, 17, '0', '2022-01-21 09:32:31', 9, 9, 'Z918', '', '', '0', 0, '0', '2', 'free', 'na'),
(584, 'ZAMOR THYME BULK (KG)', 'ZAMOR THYME BULK (KG)', '0.00', '150', 'default.gif', 59, '29.775', 1, 0, 17, '0', '2022-11-18 14:35:50', 9, 9, 'Z919', '', '', '0', 0, '0', '2', 'free', 'na'),
(585, 'ZAMOR DELICIOUS DILL (BULK)', 'ZAMOR DELICIOUS DILL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z920', '', '', '0', 0, '0', '2', 'free', 'na'),
(586, 'ZAMOR SAGE (BULK)', 'ZAMOR SAGE (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z921', '', '', '0', 0, '0', '2', 'free', 'na'),
(587, 'ZAMOR CURRY LEAVES (BULK)', 'ZAMOR CURRY LEAVES (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z922', '', '', '0', 0, '0', '2', 'free', 'na'),
(588, 'ZAMOR PARSLEY LEAF (BULK)', 'ZAMOR PARSLEY LEAF (BULK)', '0.00', '145', '', 59, '121', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z923', '', '', '0', 0, '0', '2', 'free', 'na'),
(589, 'ZAMOR BLACK PEPPER CORNS (100g)', 'ZAMOR BLACK PEPPER CORNS (100g)', '0.00', '50', 'default.gif', 59, '167', 1, 0, 17, '0', '2023-08-10 09:19:52', 9, 9, 'Z928', '', '', '0', 0, '0', '2', 'free', 'EC'),
(590, 'ZAMOR TARRAGON (100g)', 'ZAMOR TARRAGON (100g)', '0.00', '25', '', 59, '144', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z966', '', '', '0', 0, '0', '2', 'free', 'na'),
(591, 'ZAMOR HERBY HUKU (BULK)', 'ZAMOR HERBY HUKU (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z981', '', '', '0', 0, '0', '2', 'free', 'na'),
(592, 'ZAMOR LUSCIOUS LUMB (BULK)', 'ZAMOR LUSCIOUS LUMB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z983', '', '', '0', 0, '0', '2', 'free', 'na'),
(593, 'ZAMOR CORIANDER (BULK)', 'ZAMOR CORIANDER (BULK)', '0.00', '145', 'default.gif', 59, '8.335', 1, 0, 17, '0', '2022-01-21 09:24:37', 9, 9, 'Z984', '', '', '0', 0, '0', '2', 'free', 'na'),
(594, 'ZAMOR CHICKEN RUB (BULK)', 'ZAMOR CHICKEN RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z985', '', '', '0', 0, '0', '2', 'free', 'na'),
(595, 'ZAMOR CAJUN RUB (BULK)', 'ZAMOR CAJUN RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z986', '', '', '0', 0, '0', '2', 'free', 'na'),
(596, 'ZAMOR LAMB RUB (BULK)', 'ZAMOR LAMB RUB (BULK)', '0.00', '150', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z987', '', '', '0', 0, '0', '2', 'free', 'na'),
(597, 'ZAMOR CELERY SALT (BULK)', 'ZAMOR CELERY SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z988', '', '', '0', 0, '0', '2', 'free', 'na'),
(598, 'ZAMOR FUNKY FENNL (BULK)', 'ZAMOR FUNKY FENNL (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z989', '', '', '0', 0, '0', '2', 'free', 'na'),
(599, 'ZAMOR CHILLI, GARLIC SALT (BULK)', 'ZAMOR CHILLI, GARLIC SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z990', '', '', '0', 0, '0', '2', 'free', 'na'),
(600, 'ZAMOR MIXED HERBS (BULK)', 'ZAMOR MIXED HERBS (BULK)', '0.00', '145', '', 59, '-1', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z991', '', '', '0', 0, '0', '2', 'free', 'na'),
(601, 'ZAMOR PINK HIMALAYAN SALT (BULK)', 'ZAMOR PINK HIMALAYAN SALT (BULK)', '0.00', '150', 'default.gif', 62, '86.273', 1, 0, 17, '0', '2022-01-21 10:11:42', 9, 9, 'Z992', '', '', '0', 0, '0', '2', 'free', 'na');
INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_sell_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`, `date_added`, `belongs_to`, `stock_branch_id`, `barcode`, `manufactor_date`, `expire_date`, `wholesale_price`, `discount_price`, `special_price`, `currency_id`, `vat_status`, `pack_size`) VALUES
(602, 'ZAMOR BLACK PEPPER CORNS (BULK)', 'ZAMOR BLACK PEPPER CORNS (BULK)', '0.00', '224', 'default.gif', 59, '54.52', 1, 0, 17, '0', '2022-01-21 10:11:42', 9, 9, 'Z993', '', '', '0', 0, '0', '2', 'free', 'na'),
(603, 'ZAMOR MORINGA CELERY SALT (BULK)', 'ZAMOR MORINGA CELERY SALT (BULK)', '0.00', '145', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z994', '', '', '0', 0, '0', '2', 'free', 'na'),
(604, 'ZAMOR ORIGANUM (Bulk)', 'ZAMOR ORIGANUM (Bulk)', '0.00', '145', '', 59, '77', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z996', '', '', '0', 0, '0', '2', 'free', 'na'),
(605, 'ZAMOR BASIL LEAVES BULK (KG)', 'ZAMOR BASIL LEAVES BULK (KG)', '0.00', '145', 'default.gif', 59, '43.742', 1, 0, 17, '0', '2023-09-21 13:54:59', 4, 4, 'Z997', '', '', '0', 0, '0', '2', 'free', 'na'),
(606, 'ZAMOR ROSEMARY (BULK)', 'ZAMOR ROSEMARY (BULK)', '0.00', '145', '', 59, '221', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z998', '', '', '0', 0, '0', '2', 'free', 'na'),
(607, 'ZAMOR MIXED CHILLIES (BULK) 500G', 'ZAMOR MIXED CHILLIES (BULK) 500G', '0.00', '200', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, 'Z999', '', '', '0', 0, '0', '2', 'free', 'na'),
(608, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules 180s (1x12)', '0.00', '825', '', 59, '232', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '1', '', '', '0', 0, '0', '2', 'free', 'na'),
(609, 'moringa soap', 'moringa soap', '0.00', '30', '', 59, '60', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '', '', '', '0', 0, '0', '2', 'free', 'na'),
(610, 'ZAMOR TARRAGON (100g)', 'ZAMOR TARRAGON (100g)', '0.00', '25', 'default.gif', 62, '44', 1, 0, 17, '0', '2023-09-21 13:54:38', 4, 4, 'Z966', '', '', '0', 0, '0', '2', 'free', 'na'),
(611, 'Moringa Human Powder 100g (singles)', 'Moringa Human Powder 100g (singles)', '0.00', '30', '', 59, '0', 1, 0, 17, '', '0000-00-00 00:00:00', 9, 9, '', '', '', '0', 0, '0', '2', 'free', 'na'),
(612, 'ZAMOR MARJORAM', '', '100.00', '145.00', 'default.gif', 62, '5', 1, 0, 17, 'Non', '2022-01-21 09:29:38', 1, 9, '0.0', '2022-01-01', '2024-01-30', '140', 0, '0', '', '', 'KG'),
(613, 'ZAMOR CHILLI FLAKES (BULK)', '', '100.00', '145', 'default.gif', 62, '47', 1, 0, 17, 'Non', '2022-11-16 10:05:01', 1, 9, '0.0', '2022-01-01', '2022-03-01', '100', 0, '0', '', '', 'KG'),
(614, 'prod_name', 'prod_name', '0.00', '', '', 0, '1', 4, 0, 0, '', '2022-07-09 10:52:58', 0, 4, '', '', '', NULL, 0, NULL, '', '', ''),
(615, 'test transfer', '', '1.00', '12', 'default.gif', 59, '84', 1, 0, 17, '0', '2023-10-04 10:50:31', 4, 4, '0.0', '', '2022-07-06', '11', 8, '10', '', '', 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `product_`
--

CREATE TABLE IF NOT EXISTS `product_` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_desc` varchar(500) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_sell_price` text NOT NULL,
  `prod_pic` varchar(300) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `reorder` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `belongs_to` int(12) NOT NULL,
  `stock_branch_id` int(12) NOT NULL,
  `barcode` text NOT NULL,
  `manufactor_date` text NOT NULL,
  `expire_date` text NOT NULL,
  `wholesale_price` text,
  `discount_price` int(12) NOT NULL,
  `special_price` text,
  `currency_id` text NOT NULL,
  `vat_status` text NOT NULL,
  `pack_size` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_`
--

INSERT INTO `product_` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_sell_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`, `date_added`, `belongs_to`, `stock_branch_id`, `barcode`, `manufactor_date`, `expire_date`, `wholesale_price`, `discount_price`, `special_price`, `currency_id`, `vat_status`, `pack_size`) VALUES
(1, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules 180s (1x12)', '0.00', '825', '', 59, 43, 1, 0, 17, '', '2022-01-18 13:39:57', 4, 4, '1', '', '', '0', 0, '0', '', '', ''),
(2, 'Moringa Miracle Green Tea (1x12)', 'Moringa Miracle Green Tea (1x12)', '0.00', '220', '', 59, 72, 1, 0, 17, '', '2022-01-18 09:43:07', 4, 4, '3', '', '', '0', 0, '0', '', '', ''),
(3, 'Moringa Powder (Bulk per KG)', 'Moringa Powder (Bulk per KG)', '0.00', '51', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '4', '', '', '0', 0, '0', '', '', ''),
(4, 'Moringa Green Tea (Single)', 'Moringa Green Tea (Single)', '0.00', '25', '', 59, 1, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, '6', '', '', '0', 0, '0', '', '', ''),
(5, 'Moringa Capsules 180s (Singles)', 'Moringa Capsules 180s (Singles)', '0.00', '90', '', 59, 7, 1, 0, 17, '', '2022-01-18 13:39:57', 4, 4, '7', '', '', '0', 0, '0', '', '', ''),
(7, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '0.00', '640', '', 59, 53, 1, 0, 17, '', '2022-01-18 13:39:57', 4, 4, '14', '', '', '0', 0, '0', '', '', ''),
(8, 'Moringa S.U.P. 250g Powder (Single)', 'Moringa S.U.P. 250g Powder (Single)', '0.00', '60', '', 59, 76, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '20', '', '', '0', 0, '0', '', '', ''),
(9, 'Moringa Human Powder 100g (1x10)', 'Moringa Human Powder 100g (1x10)', '0.00', '230', '', 59, 76, 1, 0, 17, '', '2022-01-17 13:15:41', 4, 4, '25', '', '', '0', 0, '0', '', '', ''),
(10, 'prod_name', 'prod_desc', '0.00', 'prod_sell_price', 'prod_pic', 0, 0, 0, 0, 0, 'serial', '2022-01-07 11:51:37', 0, 0, 'barcode', '', '', 'warehouse_id', 0, 're', '', '', ''),
(11, '', '', '0.00', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(12, 'Moringa Animal Supplement 6kg', 'Moringa Animal Supplement 6kg', '0.00', '140', '', 59, 34, 1, 0, 17, '', '2022-01-17 13:45:58', 4, 4, '42', '', '', '0', 0, '0', '', '', ''),
(13, 'Moringa Pet Food Suppliment (1x10)', 'Moringa Pet Food Suppliment (1x10)', '0.00', '195', '', 59, 32, 1, 0, 17, '', '2022-01-17 10:08:28', 4, 4, '43', '', '', '0', 0, '0', '', '', ''),
(14, 'Moringa Capsules 90s (Singles)', 'Moringa Capsules 90s (Singles)', '0.00', '56', '', 59, 12, 1, 0, 17, '', '2022-01-18 13:39:57', 4, 4, '45', '', '', '0', 0, '0', '', '', ''),
(15, 'Moringa 5KG Protein Pellets', 'Moringa 5KG Protein Pellets', '0.00', '145', '', 59, 35, 1, 0, 17, '', '2022-01-11 10:46:27', 4, 4, '46', '', '', '0', 0, '0', '', '', ''),
(16, 'Moringa 200G Protein Pellets (10x200G)', 'Moringa 200G Protein Pellets (10x200G)', '0.00', '135', '', 59, 14, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '47', '', '', '0', 0, '0', '', '', ''),
(17, 'Moringa 200G Protein Pellets (Singles)', 'Moringa 200G Protein Pellets (Singles)', '0.00', '13', '', 59, 16, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '48', '', '', '0', 0, '0', '', '', ''),
(18, 'Moringa Animal Feed 200g (Singles)', 'Moringa Animal Feed 200g (Singles)', '0.00', '18', '', 59, 92, 1, 0, 17, '', '2022-01-17 09:20:20', 4, 4, '49', '', '', '0', 0, '0', '', '', ''),
(19, 'Assorted Moringa Tea Pack', 'Assorted Moringa Tea Pack', '0.00', '140', '', 59, 10, 1, 0, 17, '', '2022-01-17 09:19:54', 4, 4, '50', '', '', '0', 0, '0', '', '', ''),
(20, 'Moringa Lemon Grass Infusion (1x12)', 'Moringa Lemon Grass Infusion (1x12)', '0.00', '250', '', 59, 70, 1, 0, 17, '', '2022-01-17 13:39:37', 4, 4, '52', '', '', '0', 0, '0', '', '', ''),
(21, 'Moringa Ginger & Lemon Infusion (1x12)', 'Moringa Ginger & Lemon Infusion (1x12)', '0.00', '250', '', 59, 80, 1, 0, 17, '', '2022-01-18 09:21:13', 4, 4, '53', '', '', '0', 0, '0', '', '', ''),
(22, 'Moringa Apple & Cinnamon Infusion (1x12)', 'Moringa Apple & Cinnamon Infusion (1x12)', '0.00', '250', '', 59, 69, 1, 0, 17, '', '2022-01-17 13:18:17', 4, 4, '54', '', '', '0', 0, '0', '', '', ''),
(23, 'Moringa Lemon Grass Infusion (Singles)', 'Moringa Lemon Grass Infusion (Singles)', '0.00', '30', '', 59, 8, 1, 0, 17, '', '2022-01-17 11:37:26', 4, 4, '57', '', '', '0', 0, '0', '', '', ''),
(24, 'Moringa Ginger & Lemon Infusion (Singles)', 'Moringa Ginger & Lemon Infusion (Singles)', '0.00', '30', 'default.gif', 59, 0, 1, 0, 17, '0', '2022-01-18 09:36:16', 4, 4, '58', '', '', '0', 0, '0', '', '', '0'),
(25, 'Moringa Apple & Cinnamon Infusion (Singles)', 'Moringa Apple & Cinnamon Infusion (Singles)', '0.00', '30', '', 59, 8, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, '59', '', '', '0', 0, '0', '', '', ''),
(26, 'Moringa Pet Food Supplement (Singles)', 'Moringa Pet Food Supplement (Singles)', '0.00', '25', '', 59, 5, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '63', '', '', '0', 0, '0', '', '', ''),
(27, 'Moringa AFS 200g (1x10)', 'Moringa AFS 200g (1x10)', '0.00', '130', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '68', '', '', '0', 0, '0', '', '', ''),
(28, 'Sheep sales', 'Sheep sales', '0.00', '140', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '70', '', '', '0', 0, '0', '', '', ''),
(29, 'Green Carrier Bags', 'Green Carrier Bags', '0.00', '3', '', 59, 21, 1, 0, 17, '', '2022-01-18 10:09:55', 4, 4, '71', '', '', '0', 0, '0', '', '', ''),
(30, 'Moringa Oil 100ml', 'Moringa Oil 100ml', '0.00', '120', '', 59, 116, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, '72', '', '', '0', 0, '0', '', '', ''),
(31, 'Moringa Oil 50ML', 'Moringa Oil 50ML', '0.00', '60', '', 59, 98, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, '73', '', '', '0', 0, '0', '', '', ''),
(32, 'Moringa Oil (Bulk per Litre)', 'Moringa Oil (Bulk per Litre)', '0.00', '960', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, '74', '', '', '0', 0, '0', '', '', ''),
(33, 'ZAMOR STARTER PACK (24 PIECE)', 'ZAMOR STARTER PACK (24 PIECE)', '0.00', '670', '', 59, 3, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z200', '', '', '0', 0, '0', '', '', ''),
(34, 'ZAMOR PICNIC GOURMET SET', 'ZAMOR PICNIC GOURMET SET', '0.00', '275', '', 59, 4, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z201', '', '', '0', 0, '0', '', '', ''),
(35, 'ZAMOR STARTER PACK (12 PIECE)', 'ZAMOR STARTER PACK (12 PIECE)', '0.00', '371', '', 59, 2, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z202', '', '', '0', 0, '0', '', '', ''),
(36, 'ZAMOR CHADAROO CHUNKY 220G', 'ZAMOR CHADAROO CHUNKY 220G', '0.00', '55', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z216', '', '', '0', 0, '0', '', '', ''),
(37, 'ZAMOR CHADAROO PASTE 220G', 'ZAMOR CHADAROO PASTE 220G', '0.00', '55', '', 59, 132, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, 'Z223', '', '', '0', 0, '0', '', '', ''),
(38, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '0.00', '45', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z254', '', '', '0', 0, '0', '', '', ''),
(39, 'ZAMOR CUCUMBER 550G', 'ZAMOR CUCUMBER 550G', '0.00', '33', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z278', '', '', '0', 0, '0', '', '', ''),
(40, 'ZAMOR CAJUN RUB 100g', 'ZAMOR CAJUN RUB 100g', '0.00', '35', '', 59, 144, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, 'Z283', '', '', '0', 0, '0', '', '', ''),
(41, 'ZAMOR CHICKEN RUB 100g', 'ZAMOR CHICKEN RUB 100g', '0.00', '35', '', 59, 147, 1, 0, 17, '', '2022-01-17 13:11:41', 4, 4, 'Z290', '', '', '0', 0, '0', '', '', ''),
(42, 'ZAMOR LAMB RUB 100g', 'ZAMOR LAMB RUB 100g', '0.00', '35', '', 59, 92, 1, 0, 17, '', '2022-01-17 13:11:41', 4, 4, 'Z306', '', '', '0', 0, '0', '', '', ''),
(43, 'ZAMOR BASIL (100g)', 'ZAMOR BASIL (100g)', '0.00', '25', '', 59, 69, 1, 0, 17, '', '2022-01-17 13:39:37', 4, 4, 'Z413', '', '', '0', 0, '0', '', '', ''),
(44, 'ZAMOR CELERY (100g)', 'ZAMOR CELERY (100g)', '0.00', '25', '', 59, 225, 1, 0, 17, '', '2022-01-17 13:11:41', 4, 4, 'Z420', '', '', '0', 0, '0', '', '', ''),
(45, 'ZAMORFUNKY FENNEL (100g)', 'ZAMORFUNKY FENNEL (100g)', '0.00', '35', '', 59, 128, 1, 0, 17, '', '2022-01-17 09:30:28', 4, 4, 'Z437', '', '', '0', 0, '0', '', '', ''),
(46, 'ZAMOR GARLIC & SPRING ONION (100g)', 'ZAMOR GARLIC & SPRING ONION (100g)', '0.00', '25', '', 59, 412, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, 'Z444', '', '', '0', 0, '0', '', '', ''),
(47, 'ZAMOR MIXED CHILLIES (100g)', 'ZAMOR MIXED CHILLIES (100g)', '0.00', '25', '', 59, 121, 1, 0, 17, '', '2022-01-11 10:56:48', 4, 4, 'Z451', '', '', '0', 0, '0', '', '', ''),
(48, 'ZAMOR MIXED HERBS (100g)', 'ZAMOR MIXED HERBS (100g)', '0.00', '25', '', 59, 119, 1, 0, 17, '', '2022-01-17 09:31:00', 4, 4, 'Z468', '', '', '0', 0, '0', '', '', ''),
(49, 'ZAMOR ORIGANUM (100g)', 'ZAMOR ORIGANUM (100g)', '0.00', '25', '', 59, 114, 1, 0, 17, '', '2022-01-17 09:31:23', 4, 4, 'Z475', '', '', '0', 0, '0', '', '', ''),
(50, 'ZAMOR CRUNCHY CORIANDER', 'ZAMOR CRUNCHY CORIANDER', '0.00', '35', '', 59, 120, 1, 0, 17, '', '2022-01-17 13:11:41', 4, 4, 'Z482', '', '', '0', 0, '0', '', '', ''),
(51, 'ZAMOR PARSLEY & BASIL (100g)', 'ZAMOR PARSLEY & BASIL (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z499', '', '', '0', 0, '0', '', '', ''),
(52, 'ZAMOR ROSEMARY (100g)', 'ZAMOR ROSEMARY (100g)', '0.00', '25', '', 59, 95, 1, 0, 17, '', '2022-01-17 13:42:46', 4, 4, 'Z505', '', '', '0', 0, '0', '', '', ''),
(53, 'ZAMOR SAGE (100g)', 'ZAMOR SAGE (100g)', '0.00', '25', '', 59, 105, 1, 0, 17, '', '2022-01-17 09:23:52', 4, 4, 'Z512', '', '', '0', 0, '0', '', '', ''),
(54, 'ZAMOR SRIRACHA SALT', 'ZAMOR SRIRACHA SALT', '0.00', '43', '', 59, 84, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z529', '', '', '0', 0, '0', '', '', ''),
(55, 'ZAMOR THYME (100g)', 'ZAMOR THYME (100g)', '0.00', '25', '', 59, 88, 1, 0, 17, '', '2022-01-17 13:37:06', 4, 4, 'Z536', '', '', '0', 0, '0', '', '', ''),
(56, 'ZAMOR BASIL LEAVES (50G) POUCHES', 'ZAMOR BASIL LEAVES (50G) POUCHES', '0.00', '20', '', 59, 18, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z543', '', '', '0', 0, '0', '', '', ''),
(57, 'ZAMOR MORINGA & CELERY SALT', 'ZAMOR MORINGA & CELERY SALT', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z550', '', '', '0', 0, '0', '', '', ''),
(58, 'ZAMOR CELERY SALT', 'ZAMOR CELERY SALT', '0.00', '35', '', 59, 77, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z567', '', '', '0', 0, '0', '', '', ''),
(59, 'ZAMOR CURRY LEAVES (50g) POUCHES', 'ZAMOR CURRY LEAVES (50g) POUCHES', '0.00', '20', '', 59, 50, 1, 0, 17, '', '2022-01-18 09:30:07', 4, 4, 'Z574', '', '', '0', 0, '0', '', '', ''),
(60, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '0.00', '20', '', 59, 35, 1, 0, 17, '', '2022-01-17 13:15:41', 4, 4, 'Z581', '', '', '0', 0, '0', '', '', ''),
(61, 'ZAMOR MINT LEAVES (50g) POUCHES', 'ZAMOR MINT LEAVES (50g) POUCHES', '0.00', '20', '', 59, 17, 1, 0, 17, '', '2022-01-17 11:55:04', 4, 4, 'Z598', '', '', '0', 0, '0', '', '', ''),
(62, 'ZAMOR LEMONGRASS (100g)', 'ZAMOR LEMONGRASS (100g)', '0.00', '25', '', 59, 121, 1, 0, 17, '', '2022-01-11 11:05:33', 4, 4, 'Z604', '', '', '0', 0, '0', '', '', ''),
(63, 'ZAMOR THYME LEAVES (50G) POUCHES', 'ZAMOR THYME LEAVES (50G) POUCHES', '0.00', '20', '', 59, 32, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z611', '', '', '0', 0, '0', '', '', ''),
(64, 'ZAMOR CHILLI OIL 125ML', 'ZAMOR CHILLI OIL 125ML', '0.00', '26', '', 59, 51, 1, 0, 17, '', '2022-01-17 13:39:37', 4, 4, 'Z628', '', '', '0', 0, '0', '', '', ''),
(65, 'ZAMOR DELICIOUS DILL', 'ZAMOR DELICIOUS DILL', '0.00', '35', '', 59, 100, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z635', '', '', '0', 0, '0', '', '', ''),
(66, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '0.00', '45', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z642', '', '', '0', 0, '0', '', '', ''),
(67, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '0.00', '20', '', 59, 27, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z666', '', '', '0', 0, '0', '', '', ''),
(68, 'ZAMOR CHILLIES, GARLIC & SALT', 'ZAMOR CHILLIES, GARLIC & SALT', '0.00', '35', '', 59, 101, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z673', '', '', '0', 0, '0', '', '', ''),
(69, 'ZAMOR DRIED CHILLIES (50g) POUCHES', 'ZAMOR DRIED CHILLIES (50g) POUCHES', '0.00', '20', '', 59, 73, 1, 0, 17, '', '2022-01-18 09:30:07', 4, 4, 'Z697', '', '', '0', 0, '0', '', '', ''),
(70, 'ZAMOR PUNCHY PARSLEY', 'ZAMOR PUNCHY PARSLEY', '0.00', '35', '', 59, 79, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z703', '', '', '0', 0, '0', '', '', ''),
(71, 'ZAMOR ONION POWDER 100g', 'ZAMOR ONION POWDER 100g', '0.00', '25', '', 59, 46, 1, 0, 17, '', '2022-01-18 09:25:39', 4, 4, 'Z751', '', '', '0', 0, '0', '', '', ''),
(72, 'ZAMOR DILL (100g)', 'ZAMOR DILL (100g)', '0.00', '25', '', 59, 83, 1, 0, 17, '', '2022-01-17 13:11:41', 4, 4, 'Z768', '', '', '0', 0, '0', '', '', ''),
(73, 'ZAMOR FENNEL 100g', 'ZAMOR FENNEL 100g', '0.00', '25', '', 59, 153, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z775', '', '', '0', 0, '0', '', '', ''),
(74, 'ZAMOR Parsley (100g)', 'ZAMOR Parsley (100g)', '0.00', '25', '', 59, 98, 1, 0, 17, '', '2022-01-17 09:32:04', 4, 4, 'Z805', '', '', '0', 0, '0', '', '', ''),
(75, 'ZAMOR LUSCIOUS LAMB', 'ZAMOR LUSCIOUS LAMB', '0.00', '25', '', 59, 119, 1, 0, 17, '', '2022-01-17 13:11:41', 4, 4, 'Z867', '', '', '0', 0, '0', '', '', ''),
(76, 'ZAMOR HERBY HUKU', 'ZAMOR HERBY HUKU', '0.00', '25', '', 59, 147, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z881', '', '', '0', 0, '0', '', '', ''),
(77, 'ZAMOR SRIRACHA SALT (BULK)', 'ZAMOR SRIRACHA SALT (BULK)', '0.00', '250', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z900', '', '', '0', 0, '0', '', '', ''),
(78, 'ZAMOR BULK CHILLIES', 'ZAMOR BULK CHILLIES', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z901', '', '', '0', 0, '0', '', '', ''),
(79, 'ZAMOR CELERY POWDER (BULK)', 'ZAMOR CELERY POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z902', '', '', '0', 0, '0', '', '', ''),
(80, 'ZAMOR CELERY STEM (BULK)', 'ZAMOR CELERY STEM (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z903', '', '', '0', 0, '0', '', '', ''),
(81, 'ZAMOR PINK HIMALAYAN SALT (100g)', 'ZAMOR PINK HIMALAYAN SALT (100g)', '0.00', '43', '', 59, 201, 1, 0, 17, '', '2022-01-17 09:25:09', 4, 4, 'Z904', '', '', '0', 0, '0', '', '', ''),
(82, 'CHIA SEED', 'CHIA SEED', '0.00', '120', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z905', '', '', '0', 0, '0', '', '', ''),
(83, 'ZAMOR CHILLI POWDER (BULK)', 'ZAMOR CHILLI POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z906', '', '', '0', 0, '0', '', '', ''),
(84, 'ZAMOR CHIVES (BULK)', 'ZAMOR CHIVES (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z907', '', '', '0', 0, '0', '', '', ''),
(85, 'ZAMOR CRUNCHY CORIANDER (BULK)', 'ZAMOR CRUNCHY CORIANDER (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z908', '', '', '0', 0, '0', '', '', ''),
(86, 'ZAMOR DILL (BULK)', 'ZAMOR DILL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z909', '', '', '0', 0, '0', '', '', ''),
(87, 'ZAMOR FENNEL (BULK)', 'ZAMOR FENNEL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z910', '', '', '0', 0, '0', '', '', ''),
(88, 'ZAMOR FENNEL ROOT (BULK)', 'ZAMOR FENNEL ROOT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z911', '', '', '0', 0, '0', '', '', ''),
(89, 'ZAMOR GARLIC CHIVES (BULK)', 'ZAMOR GARLIC CHIVES (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z912', '', '', '0', 0, '0', '', '', ''),
(90, 'ZAMOR ONION POWDER (BULK)', 'ZAMOR ONION POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z913', '', '', '0', 0, '0', '', '', ''),
(91, 'ZAMOR LEMON GRASS (BULK)', 'ZAMOR LEMON GRASS (BULK)', '0.00', '145', '', 59, 2, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z914', '', '', '0', 0, '0', '', '', ''),
(92, 'ZAMOR MINT (BULK)', 'ZAMOR MINT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z915', '', '', '0', 0, '0', '', '', ''),
(93, 'ZAMOR MORINGA LEAF', 'ZAMOR MORINGA LEAF', '0.00', '185', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z916', '', '', '0', 0, '0', '', '', ''),
(94, 'ZAMOR SPRING ONION POWDER (BULK)', 'ZAMOR SPRING ONION POWDER (BULK)', '0.00', '145', '', 59, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z917', '', '', '0', 0, '0', '', '', ''),
(95, 'ZAMOR TARRAGON (BULK)', 'ZAMOR TARRAGON (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z918', '', '', '0', 0, '0', '', '', ''),
(96, 'ZAMOR THYME BULK (KG)', 'ZAMOR THYME BULK (KG)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z919', '', '', '0', 0, '0', '', '', ''),
(97, 'ZAMOR DELICIOUS DILL (BULK)', 'ZAMOR DELICIOUS DILL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z920', '', '', '0', 0, '0', '', '', ''),
(98, 'ZAMOR SAGE (BULK)', 'ZAMOR SAGE (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z921', '', '', '0', 0, '0', '', '', ''),
(99, 'ZAMOR CURRY LEAVES (BULK)', 'ZAMOR CURRY LEAVES (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z922', '', '', '0', 0, '0', '', '', ''),
(100, 'ZAMOR PARSLEY LEAF (BULK)', 'ZAMOR PARSLEY LEAF (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z923', '', '', '0', 0, '0', '', '', ''),
(101, 'ZAMOR BLACK PEPPER CORNS (100g)', 'ZAMOR BLACK PEPPER CORNS (100g)', '0.00', '50', '', 59, 391, 1, 0, 17, '', '2022-01-18 09:36:16', 4, 4, 'Z928', '', '', '0', 0, '0', '', '', ''),
(102, 'ZAMOR TARRAGON (100g)', 'ZAMOR TARRAGON (100g)', '0.00', '25', '', 59, 69, 1, 0, 17, '', '2022-01-17 13:54:07', 4, 4, 'Z966', '', '', '0', 0, '0', '', '', ''),
(103, 'ZAMOR HERBY HUKU (BULK)', 'ZAMOR HERBY HUKU (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z981', '', '', '0', 0, '0', '', '', ''),
(104, 'ZAMOR LUSCIOUS LUMB (BULK)', 'ZAMOR LUSCIOUS LUMB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z983', '', '', '0', 0, '0', '', '', ''),
(105, 'ZAMOR CORIANDER (BULK)', 'ZAMOR CORIANDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z984', '', '', '0', 0, '0', '', '', ''),
(106, 'ZAMOR CHICKEN RUB (BULK)', 'ZAMOR CHICKEN RUB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z985', '', '', '0', 0, '0', '', '', ''),
(107, 'ZAMOR CAJUN RUB (BULK)', 'ZAMOR CAJUN RUB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z986', '', '', '0', 0, '0', '', '', ''),
(108, 'ZAMOR LAMB RUB (BULK)', 'ZAMOR LAMB RUB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z987', '', '', '0', 0, '0', '', '', ''),
(109, 'ZAMOR CELERY SALT (BULK)', 'ZAMOR CELERY SALT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z988', '', '', '0', 0, '0', '', '', ''),
(110, 'ZAMOR FUNKY FENNL (BULK)', 'ZAMOR FUNKY FENNL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z989', '', '', '0', 0, '0', '', '', ''),
(111, 'ZAMOR CHILLI, GARLIC SALT (BULK)', 'ZAMOR CHILLI, GARLIC SALT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z990', '', '', '0', 0, '0', '', '', ''),
(112, 'ZAMOR MIXED HERBS (BULK)', 'ZAMOR MIXED HERBS (BULK)', '0.00', '145', '', 59, 1, 1, 0, 17, '', '2022-01-11 11:39:43', 4, 4, 'Z991', '', '', '0', 0, '0', '', '', ''),
(113, 'ZAMOR PINK HIMALAYAN SALT (BULK)', 'ZAMOR PINK HIMALAYAN SALT (BULK)', '0.00', '150', '', 59, 2, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z992', '', '', '0', 0, '0', '', '', ''),
(114, 'ZAMOR BLACK PEPPER CORNS (BULK)', 'ZAMOR BLACK PEPPER CORNS (BULK)', '0.00', '224', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z993', '', '', '0', 0, '0', '', '', ''),
(115, 'ZAMOR MORINGA CELERY SALT (BULK)', 'ZAMOR MORINGA CELERY SALT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z994', '', '', '0', 0, '0', '', '', ''),
(116, 'ZAMOR ORIGANUM (Bulk)', 'ZAMOR ORIGANUM (Bulk)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z996', '', '', '0', 0, '0', '', '', ''),
(117, 'ZAMOR BASIL LEAVES BULK (KG)', 'ZAMOR BASIL LEAVES BULK (KG)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z997', '', '', '0', 0, '0', '', '', ''),
(118, 'ZAMOR ROSEMARY (BULK)', 'ZAMOR ROSEMARY (BULK)', '0.00', '145', '', 59, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z998', '', '', '0', 0, '0', '', '', ''),
(119, 'ZAMOR MIXED CHILLIES (BULK) 500G', 'ZAMOR MIXED CHILLIES (BULK) 500G', '0.00', '200', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 4, 4, 'Z999', '', '', '0', 0, '0', '', '', ''),
(120, '', '', '0.00', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(121, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules 180s (1x12)', '0.00', '825', '', 59, 1, 1, 0, 17, '', '2022-01-18 13:39:57', 5, 5, '1', '', '', '0', 0, '0', '', '', ''),
(122, 'Moringa Miracle Green Tea (1x12)', 'Moringa Miracle Green Tea (1x12)', '0.00', '220', '', 59, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '3', '', '', '0', 0, '0', '', '', ''),
(123, 'Moringa Powder (Bulk per KG)', 'Moringa Powder (Bulk per KG)', '0.00', '51', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '4', '', '', '0', 0, '0', '', '', ''),
(124, 'Moringa Green Tea (Single)', 'Moringa Green Tea (Single)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '6', '', '', '0', 0, '0', '', '', ''),
(125, 'Moringa Capsules 180s (Singles)', 'Moringa Capsules 180s (Singles)', '0.00', '90', '', 59, 0, 1, 0, 17, '', '2022-01-18 13:39:57', 5, 5, '7', '', '', '0', 0, '0', '', '', ''),
(126, 'No Sale/Cancelled Invoices', 'No Sale/Cancelled Invoices', '0.00', '  -    ', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '10', '', '', '0', 0, '0', '', '', ''),
(127, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '0.00', '640', '', 59, 0, 1, 0, 17, '', '2022-01-18 13:39:57', 5, 5, '14', '', '', '0', 0, '0', '', '', ''),
(128, 'Moringa S.U.P. 250g Powder (Single)', 'Moringa S.U.P. 250g Powder (Single)', '0.00', '60', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '20', '', '', '0', 0, '0', '', '', ''),
(129, 'Moringa Human Powder 100g (1x10)', 'Moringa Human Powder 100g (1x10)', '0.00', '230', '', 59, 2, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '25', '', '', '0', 0, '0', '', '', ''),
(130, 'Moringa 100g Powder (Single)', 'Moringa 100g Powder (Single)', '0.00', '30', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '33', '', '', '0', 0, '0', '', '', ''),
(131, 'Moringa Animal Feed Supplement 3kg', 'Moringa Animal Feed Supplement 3kg', '0.00', '70', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '41', '', '', '0', 0, '0', '', '', ''),
(132, 'Moringa Animal Supplement 6kg', 'Moringa Animal Supplement 6kg', '0.00', '140', '', 59, 20, 1, 0, 17, '', '2022-01-12 09:38:32', 5, 5, '42', '', '', '0', 0, '0', '', '', ''),
(133, 'Moringa Pet Food Suppliment (1x10)', 'Moringa Pet Food Suppliment (1x10)', '0.00', '195', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '43', '', '', '0', 0, '0', '', '', ''),
(134, 'Moringa Capsules 90s (Singles)', 'Moringa Capsules 90s (Singles)', '0.00', '56', '', 59, 0, 1, 0, 17, '', '2022-01-18 13:39:57', 5, 5, '45', '', '', '0', 0, '0', '', '', ''),
(135, 'Moringa 5KG Protein Pellets', 'Moringa 5KG Protein Pellets', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '46', '', '', '0', 0, '0', '', '', ''),
(136, 'Moringa 200G Protein Pellets (10x200G)', 'Moringa 200G Protein Pellets (10x200G)', '0.00', '135', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '47', '', '', '0', 0, '0', '', '', ''),
(137, 'Moringa 200G Protein Pellets (Singles)', 'Moringa 200G Protein Pellets (Singles)', '0.00', '13', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '48', '', '', '0', 0, '0', '', '', ''),
(138, 'Moringa Animal Feed 200g (Singles)', 'Moringa Animal Feed 200g (Singles)', '0.00', '18', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '49', '', '', '0', 0, '0', '', '', ''),
(139, 'Assorted Moringa Tea Pack', 'Assorted Moringa Tea Pack', '0.00', '140', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '50', '', '', '0', 0, '0', '', '', ''),
(140, 'Moringa Lemon Grass Infusion (1x12)', 'Moringa Lemon Grass Infusion (1x12)', '0.00', '250', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '52', '', '', '0', 0, '0', '', '', ''),
(141, 'Moringa Ginger & Lemon Infusion (1x12)', 'Moringa Ginger & Lemon Infusion (1x12)', '0.00', '250', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '53', '', '', '0', 0, '0', '', '', ''),
(142, 'Moringa Apple & Cinnamon Infusion (1x12)', 'Moringa Apple & Cinnamon Infusion (1x12)', '0.00', '250', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '54', '', '', '0', 0, '0', '', '', ''),
(143, 'Moringa Lemon Grass Infusion (Singles)', 'Moringa Lemon Grass Infusion (Singles)', '0.00', '30', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '57', '', '', '0', 0, '0', '', '', ''),
(144, 'Moringa Ginger & Lemon Infusion (Singles)', 'Moringa Ginger & Lemon Infusion (Singles)', '0.00', '30', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '58', '', '', '0', 0, '0', '', '', ''),
(145, 'Moringa Apple & Cinnamon Infusion (Singles)', 'Moringa Apple & Cinnamon Infusion (Singles)', '0.00', '30', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '59', '', '', '0', 0, '0', '', '', ''),
(146, 'Bounced Cheques', 'Bounced Cheques', '0.00', '  -    ', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '61', '', '', '0', 0, '0', '', '', ''),
(147, 'Moringa Pet Food Supplement (Singles)', 'Moringa Pet Food Supplement (Singles)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '63', '', '', '0', 0, '0', '', '', ''),
(148, 'Moringa AFS 200g (1x10)', 'Moringa AFS 200g (1x10)', '0.00', '130', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '68', '', '', '0', 0, '0', '', '', ''),
(149, 'Sheep sales', 'Sheep sales', '0.00', '140', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '70', '', '', '0', 0, '0', '', '', ''),
(150, 'Green Carrier Bags', 'Green Carrier Bags', '0.00', '3', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '71', '', '', '0', 0, '0', '', '', ''),
(151, 'Moringa Oil 100ml', 'Moringa Oil 100ml', '0.00', '120', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '72', '', '', '0', 0, '0', '', '', ''),
(152, 'Moringa Oil 50ML', 'Moringa Oil 50ML', '0.00', '60', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '73', '', '', '0', 0, '0', '', '', ''),
(153, 'Moringa Oil (Bulk per Litre)', 'Moringa Oil (Bulk per Litre)', '0.00', '960', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, '74', '', '', '0', 0, '0', '', '', ''),
(154, 'ZAMOR STARTER PACK (24 PIECE)', 'ZAMOR STARTER PACK (24 PIECE)', '0.00', '670', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z200', '', '', '0', 0, '0', '', '', ''),
(155, 'ZAMOR PICNIC GOURMET SET', 'ZAMOR PICNIC GOURMET SET', '0.00', '275', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z201', '', '', '0', 0, '0', '', '', ''),
(156, 'ZAMOR STARTER PACK (12 PIECE)', 'ZAMOR STARTER PACK (12 PIECE)', '0.00', '371', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z202', '', '', '0', 0, '0', '', '', ''),
(157, 'ZAMOR CHADAROO CHUNKY 220G', 'ZAMOR CHADAROO CHUNKY 220G', '0.00', '55', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z216', '', '', '0', 0, '0', '', '', ''),
(158, 'ZAMOR CHADAROO PASTE 220G', 'ZAMOR CHADAROO PASTE 220G', '0.00', '55', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z223', '', '', '0', 0, '0', '', '', ''),
(159, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '0.00', '45', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z254', '', '', '0', 0, '0', '', '', ''),
(160, 'ZAMOR CUCUMBER 550G', 'ZAMOR CUCUMBER 550G', '0.00', '33', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z278', '', '', '0', 0, '0', '', '', ''),
(161, 'ZAMOR CAJUN RUB 100g', 'ZAMOR CAJUN RUB 100g', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z283', '', '', '0', 0, '0', '', '', ''),
(162, 'ZAMOR CHICKEN RUB 100g', 'ZAMOR CHICKEN RUB 100g', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z290', '', '', '0', 0, '0', '', '', ''),
(163, 'ZAMOR LAMB RUB 100g', 'ZAMOR LAMB RUB 100g', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z306', '', '', '0', 0, '0', '', '', ''),
(164, 'ZAMOR BASIL (100g)', 'ZAMOR BASIL (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z413', '', '', '0', 0, '0', '', '', ''),
(165, 'ZAMOR CELERY (100g)', 'ZAMOR CELERY (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z420', '', '', '0', 0, '0', '', '', ''),
(166, 'ZAMORFUNKY FENNEL (100g)', 'ZAMORFUNKY FENNEL (100g)', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z437', '', '', '0', 0, '0', '', '', ''),
(167, 'ZAMOR GARLIC & SPRING ONION (100g)', 'ZAMOR GARLIC & SPRING ONION (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z444', '', '', '0', 0, '0', '', '', ''),
(168, 'ZAMOR MIXED CHILLIES (100g)', 'ZAMOR MIXED CHILLIES (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z451', '', '', '0', 0, '0', '', '', ''),
(169, 'ZAMOR MIXED HERBS (100g)', 'ZAMOR MIXED HERBS (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z468', '', '', '0', 0, '0', '', '', ''),
(170, 'ZAMOR ORIGANUM (100g)', 'ZAMOR ORIGANUM (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z475', '', '', '0', 0, '0', '', '', ''),
(171, 'ZAMOR CRUNCHY CORIANDER', 'ZAMOR CRUNCHY CORIANDER', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z482', '', '', '0', 0, '0', '', '', ''),
(172, 'ZAMOR PARSLEY & BASIL (100g)', 'ZAMOR PARSLEY & BASIL (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z499', '', '', '0', 0, '0', '', '', ''),
(173, 'ZAMOR ROSEMARY (100g)', 'ZAMOR ROSEMARY (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z505', '', '', '0', 0, '0', '', '', ''),
(174, 'ZAMOR SAGE (100g)', 'ZAMOR SAGE (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z512', '', '', '0', 0, '0', '', '', ''),
(175, 'ZAMOR SRIRACHA SALT', 'ZAMOR SRIRACHA SALT', '0.00', '43', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z529', '', '', '0', 0, '0', '', '', ''),
(176, 'ZAMOR THYME (100g)', 'ZAMOR THYME (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z536', '', '', '0', 0, '0', '', '', ''),
(177, 'ZAMOR BASIL LEAVES (50G) POUCHES', 'ZAMOR BASIL LEAVES (50G) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z543', '', '', '0', 0, '0', '', '', ''),
(178, 'ZAMOR MORINGA & CELERY SALT', 'ZAMOR MORINGA & CELERY SALT', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z550', '', '', '0', 0, '0', '', '', ''),
(179, 'ZAMOR CELERY SALT', 'ZAMOR CELERY SALT', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z567', '', '', '0', 0, '0', '', '', ''),
(180, 'ZAMOR CURRY LEAVES (50g) POUCHES', 'ZAMOR CURRY LEAVES (50g) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z574', '', '', '0', 0, '0', '', '', ''),
(181, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z581', '', '', '0', 0, '0', '', '', ''),
(182, 'ZAMOR MINT LEAVES (50g) POUCHES', 'ZAMOR MINT LEAVES (50g) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z598', '', '', '0', 0, '0', '', '', ''),
(183, 'ZAMOR LEMONGRASS (100g)', 'ZAMOR LEMONGRASS (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z604', '', '', '0', 0, '0', '', '', ''),
(184, 'ZAMOR THYME LEAVES (50G) POUCHES', 'ZAMOR THYME LEAVES (50G) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z611', '', '', '0', 0, '0', '', '', ''),
(185, 'ZAMOR CHILLI OIL 125ML', 'ZAMOR CHILLI OIL 125ML', '0.00', '26', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z628', '', '', '0', 0, '0', '', '', ''),
(186, 'ZAMOR DELICIOUS DILL', 'ZAMOR DELICIOUS DILL', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z635', '', '', '0', 0, '0', '', '', ''),
(187, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '0.00', '45', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z642', '', '', '0', 0, '0', '', '', ''),
(188, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z666', '', '', '0', 0, '0', '', '', ''),
(189, 'ZAMOR CHILLIES, GARLIC & SALT', 'ZAMOR CHILLIES, GARLIC & SALT', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z673', '', '', '0', 0, '0', '', '', ''),
(190, 'ZAMOR DRIED CHILLIES (50g) POUCHES', 'ZAMOR DRIED CHILLIES (50g) POUCHES', '0.00', '20', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z697', '', '', '0', 0, '0', '', '', ''),
(191, 'ZAMOR PUNCHY PARSLEY', 'ZAMOR PUNCHY PARSLEY', '0.00', '35', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z703', '', '', '0', 0, '0', '', '', ''),
(192, 'ZAMOR ONION POWDER 100g', 'ZAMOR ONION POWDER 100g', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z751', '', '', '0', 0, '0', '', '', ''),
(193, 'ZAMOR DILL (100g)', 'ZAMOR DILL (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z768', '', '', '0', 0, '0', '', '', ''),
(194, 'ZAMOR FENNEL 100g', 'ZAMOR FENNEL 100g', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z775', '', '', '0', 0, '0', '', '', ''),
(195, 'ZAMOR Parsley (100g)', 'ZAMOR Parsley (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z805', '', '', '0', 0, '0', '', '', ''),
(196, 'ZAMOR LUSCIOUS LAMB', 'ZAMOR LUSCIOUS LAMB', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z867', '', '', '0', 0, '0', '', '', ''),
(197, 'ZAMOR HERBY HUKU', 'ZAMOR HERBY HUKU', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z881', '', '', '0', 0, '0', '', '', ''),
(198, 'ZAMOR SRIRACHA SALT (BULK)', 'ZAMOR SRIRACHA SALT (BULK)', '0.00', '250', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z900', '', '', '0', 0, '0', '', '', ''),
(199, 'ZAMOR BULK CHILLIES', 'ZAMOR BULK CHILLIES', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z901', '', '', '0', 0, '0', '', '', ''),
(200, 'ZAMOR CELERY POWDER (BULK)', 'ZAMOR CELERY POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z902', '', '', '0', 0, '0', '', '', ''),
(201, 'ZAMOR CELERY STEM (BULK)', 'ZAMOR CELERY STEM (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z903', '', '', '0', 0, '0', '', '', ''),
(202, 'ZAMOR PINK HIMALAYAN SALT (100g)', 'ZAMOR PINK HIMALAYAN SALT (100g)', '0.00', '43', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z904', '', '', '0', 0, '0', '', '', ''),
(203, 'CHIA SEED', 'CHIA SEED', '0.00', '120', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z905', '', '', '0', 0, '0', '', '', ''),
(204, 'ZAMOR CHILLI POWDER (BULK)', 'ZAMOR CHILLI POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z906', '', '', '0', 0, '0', '', '', ''),
(205, 'ZAMOR CHIVES (BULK)', 'ZAMOR CHIVES (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z907', '', '', '0', 0, '0', '', '', ''),
(206, 'ZAMOR CRUNCHY CORIANDER (BULK)', 'ZAMOR CRUNCHY CORIANDER (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z908', '', '', '0', 0, '0', '', '', ''),
(207, 'ZAMOR DILL (BULK)', 'ZAMOR DILL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z909', '', '', '0', 0, '0', '', '', ''),
(208, 'ZAMOR FENNEL (BULK)', 'ZAMOR FENNEL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z910', '', '', '0', 0, '0', '', '', ''),
(209, 'ZAMOR FENNEL ROOT (BULK)', 'ZAMOR FENNEL ROOT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z911', '', '', '0', 0, '0', '', '', ''),
(210, 'ZAMOR GARLIC CHIVES (BULK)', 'ZAMOR GARLIC CHIVES (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z912', '', '', '0', 0, '0', '', '', ''),
(211, 'ZAMOR ONION POWDER (BULK)', 'ZAMOR ONION POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z913', '', '', '0', 0, '0', '', '', ''),
(212, 'ZAMOR LEMON GRASS (BULK)', 'ZAMOR LEMON GRASS (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z914', '', '', '0', 0, '0', '', '', ''),
(213, 'ZAMOR MINT (BULK)', 'ZAMOR MINT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z915', '', '', '0', 0, '0', '', '', ''),
(214, 'ZAMOR MORINGA LEAF', 'ZAMOR MORINGA LEAF', '0.00', '185', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z916', '', '', '0', 0, '0', '', '', ''),
(215, 'ZAMOR SPRING ONION POWDER (BULK)', 'ZAMOR SPRING ONION POWDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z917', '', '', '0', 0, '0', '', '', ''),
(216, 'ZAMOR TARRAGON (BULK)', 'ZAMOR TARRAGON (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z918', '', '', '0', 0, '0', '', '', ''),
(217, 'ZAMOR THYME BULK (KG)', 'ZAMOR THYME BULK (KG)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z919', '', '', '0', 0, '0', '', '', ''),
(218, 'ZAMOR DELICIOUS DILL (BULK)', 'ZAMOR DELICIOUS DILL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z920', '', '', '0', 0, '0', '', '', ''),
(219, 'ZAMOR SAGE (BULK)', 'ZAMOR SAGE (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z921', '', '', '0', 0, '0', '', '', ''),
(220, 'ZAMOR CURRY LEAVES (BULK)', 'ZAMOR CURRY LEAVES (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z922', '', '', '0', 0, '0', '', '', ''),
(221, 'ZAMOR PARSLEY LEAF (BULK)', 'ZAMOR PARSLEY LEAF (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z923', '', '', '0', 0, '0', '', '', ''),
(222, 'ZAMOR BLACK PEPPER CORNS (100g)', 'ZAMOR BLACK PEPPER CORNS (100g)', '0.00', '50', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z928', '', '', '0', 0, '0', '', '', ''),
(223, 'ZAMOR TARRAGON (100g)', 'ZAMOR TARRAGON (100g)', '0.00', '25', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z966', '', '', '0', 0, '0', '', '', ''),
(224, 'ZAMOR HERBY HUKU (BULK)', 'ZAMOR HERBY HUKU (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z981', '', '', '0', 0, '0', '', '', ''),
(225, 'ZAMOR LUSCIOUS LUMB (BULK)', 'ZAMOR LUSCIOUS LUMB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z983', '', '', '0', 0, '0', '', '', ''),
(226, 'ZAMOR CORIANDER (BULK)', 'ZAMOR CORIANDER (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z984', '', '', '0', 0, '0', '', '', ''),
(227, 'ZAMOR CHICKEN RUB (BULK)', 'ZAMOR CHICKEN RUB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z985', '', '', '0', 0, '0', '', '', ''),
(228, 'ZAMOR CAJUN RUB (BULK)', 'ZAMOR CAJUN RUB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z986', '', '', '0', 0, '0', '', '', ''),
(229, 'ZAMOR LAMB RUB (BULK)', 'ZAMOR LAMB RUB (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z987', '', '', '0', 0, '0', '', '', ''),
(230, 'ZAMOR CELERY SALT (BULK)', 'ZAMOR CELERY SALT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z988', '', '', '0', 0, '0', '', '', ''),
(231, 'ZAMOR FUNKY FENNL (BULK)', 'ZAMOR FUNKY FENNL (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z989', '', '', '0', 0, '0', '', '', ''),
(232, 'ZAMOR CHILLI, GARLIC SALT (BULK)', 'ZAMOR CHILLI, GARLIC SALT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z990', '', '', '0', 0, '0', '', '', ''),
(233, 'ZAMOR MIXED HERBS (BULK)', 'ZAMOR MIXED HERBS (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z991', '', '', '0', 0, '0', '', '', ''),
(234, 'ZAMOR PINK HIMALAYAN SALT (BULK)', 'ZAMOR PINK HIMALAYAN SALT (BULK)', '0.00', '150', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z992', '', '', '0', 0, '0', '', '', ''),
(235, 'ZAMOR BLACK PEPPER CORNS (BULK)', 'ZAMOR BLACK PEPPER CORNS (BULK)', '0.00', '224', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z993', '', '', '0', 0, '0', '', '', ''),
(236, 'ZAMOR MORINGA CELERY SALT (BULK)', 'ZAMOR MORINGA CELERY SALT (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z994', '', '', '0', 0, '0', '', '', ''),
(237, 'ZAMOR ORIGANUM (Bulk)', 'ZAMOR ORIGANUM (Bulk)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z996', '', '', '0', 0, '0', '', '', ''),
(238, 'ZAMOR BASIL LEAVES BULK (KG)', 'ZAMOR BASIL LEAVES BULK (KG)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z997', '', '', '0', 0, '0', '', '', ''),
(239, 'ZAMOR ROSEMARY (BULK)', 'ZAMOR ROSEMARY (BULK)', '0.00', '145', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z998', '', '', '0', 0, '0', '', '', ''),
(240, 'ZAMOR MIXED CHILLIES (BULK) 500G', 'ZAMOR MIXED CHILLIES (BULK) 500G', '0.00', '200', '', 59, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 5, 5, 'Z999', '', '', '0', 0, '0', '', '', ''),
(241, '', '', '0.00', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(242, 'Moringa Miracle Capsules 180s (1x12)', '', '0.00', '825', '', 0, 3, 1, 0, 17, '', '2022-01-18 13:39:18', 6, 6, '1', '', '', '0', 0, '0', '', '', ''),
(243, 'Moringa Miracle Green Tea (1x12)', '', '0.00', '220', '', 0, 3, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '3', '', '', '0', 0, '0', '', '', ''),
(244, 'Moringa Powder (Bulk per KG)', '', '0.00', '51', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '4', '', '', '0', 0, '0', '', '', ''),
(245, 'Moringa Green Tea (Single)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '6', '', '', '0', 0, '0', '', '', ''),
(246, 'Moringa Capsules 180s (Singles)', '', '0.00', '90', '', 0, 0, 1, 0, 17, '', '2022-01-18 13:39:18', 6, 6, '7', '', '', '0', 0, '0', '', '', ''),
(247, 'Moringa Miracle Capsules 90s (1x15)', '', '0.00', '640', '', 0, 3, 1, 0, 17, '', '2022-01-18 13:39:18', 6, 6, '14', '', '', '0', 0, '0', '', '', ''),
(248, 'Moringa S.U.P. 250g Powder (Single)', '', '0.00', '60', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '20', '', '', '0', 0, '0', '', '', ''),
(249, 'Moringa Human Powder 100g (1x10)', '', '0.00', '230', '', 0, 2, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '25', '', '', '0', 0, '0', '', '', ''),
(250, 'Moringa 100g Powder (Single)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '33', '', '', '0', 0, '0', '', '', ''),
(251, 'Moringa Animal Feed Supplement 3kg', '', '0.00', '70', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '41', '', '', '0', 0, '0', '', '', ''),
(252, 'Moringa Animal Supplement 6kg', '', '0.00', '140', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '42', '', '', '0', 0, '0', '', '', ''),
(253, 'Moringa Pet Food Suppliment (1x10)', '', '0.00', '195', '', 0, 4, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '43', '', '', '0', 0, '0', '', '', ''),
(254, 'Moringa Capsules 90s (Singles)', '', '0.00', '56', '', 0, 0, 1, 0, 17, '', '2022-01-18 13:39:18', 6, 6, '45', '', '', '0', 0, '0', '', '', ''),
(255, 'Moringa 5KG Protein Pellets', '', '0.00', '145', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '46', '', '', '0', 0, '0', '', '', ''),
(256, 'Moringa 200G Protein Pellets (10x200G)', '', '0.00', '135', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '47', '', '', '0', 0, '0', '', '', ''),
(257, 'Moringa 200G Protein Pellets (Singles)', '', '0.00', '13', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '48', '', '', '0', 0, '0', '', '', ''),
(258, 'Moringa Animal Feed 200g (Singles)', '', '0.00', '18', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '49', '', '', '0', 0, '0', '', '', ''),
(259, 'Assorted Moringa Tea Pack', '', '0.00', '140', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '50', '', '', '0', 0, '0', '', '', ''),
(260, 'Moringa Lemon Grass Infusion (1x12)', '', '0.00', '250', '', 0, 3, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '52', '', '', '0', 0, '0', '', '', ''),
(261, 'Moringa Ginger & Lemon Infusion (1x12)', '', '0.00', '250', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '53', '', '', '0', 0, '0', '', '', ''),
(262, 'Moringa Apple & Cinnamon Infusion (1x12)', '', '0.00', '250', '', 0, 4, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '54', '', '', '0', 0, '0', '', '', ''),
(263, 'Moringa Lemon Grass Infusion (Singles)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '57', '', '', '0', 0, '0', '', '', ''),
(264, 'Moringa Ginger & Lemon Infusion (Singles)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '58', '', '', '0', 0, '0', '', '', ''),
(265, 'Moringa Apple & Cinnamon Infusion (Singles)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '59', '', '', '0', 0, '0', '', '', ''),
(266, 'Bounced Cheques', '', '0.00', '  -    ', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '61', '', '', '0', 0, '0', '', '', ''),
(267, 'Moringa Pet Food Supplement (Singles)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '63', '', '', '0', 0, '0', '', '', ''),
(268, 'Moringa AFS 200g (1x10)', '', '0.00', '130', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '68', '', '', '0', 0, '0', '', '', ''),
(269, 'Sheep sales', '', '0.00', '140', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '70', '', '', '0', 0, '0', '', '', ''),
(270, 'Green Carrier Bags', '', '0.00', '3', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '71', '', '', '0', 0, '0', '', '', ''),
(271, 'Moringa Oil 100ml', '', '0.00', '120', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '72', '', '', '0', 0, '0', '', '', ''),
(272, 'Moringa Oil 50ML', '', '0.00', '60', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '73', '', '', '0', 0, '0', '', '', ''),
(273, 'Moringa Oil (Bulk per Litre)', '', '0.00', '960', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, '74', '', '', '0', 0, '0', '', '', ''),
(274, 'ZAMOR STARTER PACK (24 PIECE)', '', '0.00', '670', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z200', '', '', '0', 0, '0', '', '', ''),
(275, 'ZAMOR PICNIC GOURMET SET', '', '0.00', '275', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z201', '', '', '0', 0, '0', '', '', ''),
(276, 'ZAMOR STARTER PACK (12 PIECE)', '', '0.00', '371', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z202', '', '', '0', 0, '0', '', '', ''),
(277, 'ZAMOR CHADAROO CHUNKY 220G', '', '0.00', '55', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z216', '', '', '0', 0, '0', '', '', ''),
(278, 'ZAMOR CHADAROO PASTE 220G', '', '0.00', '55', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z223', '', '', '0', 0, '0', '', '', ''),
(279, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '', '0.00', '45', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z254', '', '', '0', 0, '0', '', '', ''),
(280, 'ZAMOR CUCUMBER 550G', '', '0.00', '33', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z278', '', '', '0', 0, '0', '', '', ''),
(281, 'ZAMOR CAJUN RUB 100g', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z283', '', '', '0', 0, '0', '', '', ''),
(282, 'ZAMOR CHICKEN RUB 100g', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z290', '', '', '0', 0, '0', '', '', ''),
(283, 'ZAMOR LAMB RUB 100g', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z306', '', '', '0', 0, '0', '', '', ''),
(284, 'ZAMOR BASIL (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z413', '', '', '0', 0, '0', '', '', ''),
(285, 'ZAMOR CELERY (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z420', '', '', '0', 0, '0', '', '', ''),
(286, 'ZAMORFUNKY FENNEL (100g)', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z437', '', '', '0', 0, '0', '', '', ''),
(287, 'ZAMOR GARLIC & SPRING ONION (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z444', '', '', '0', 0, '0', '', '', ''),
(288, 'ZAMOR MIXED CHILLIES (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z451', '', '', '0', 0, '0', '', '', ''),
(289, 'ZAMOR MIXED HERBS (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z468', '', '', '0', 0, '0', '', '', ''),
(290, 'ZAMOR ORIGANUM (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z475', '', '', '0', 0, '0', '', '', ''),
(291, 'ZAMOR CRUNCHY CORIANDER', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z482', '', '', '0', 0, '0', '', '', ''),
(292, 'ZAMOR PARSLEY & BASIL (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z499', '', '', '0', 0, '0', '', '', ''),
(293, 'ZAMOR ROSEMARY (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z505', '', '', '0', 0, '0', '', '', ''),
(294, 'ZAMOR SAGE (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z512', '', '', '0', 0, '0', '', '', ''),
(295, 'ZAMOR SRIRACHA SALT', '', '0.00', '43', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z529', '', '', '0', 0, '0', '', '', '');
INSERT INTO `product_` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_sell_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`, `date_added`, `belongs_to`, `stock_branch_id`, `barcode`, `manufactor_date`, `expire_date`, `wholesale_price`, `discount_price`, `special_price`, `currency_id`, `vat_status`, `pack_size`) VALUES
(296, 'ZAMOR THYME (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z536', '', '', '0', 0, '0', '', '', ''),
(297, 'ZAMOR BASIL LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z543', '', '', '0', 0, '0', '', '', ''),
(298, 'ZAMOR MORINGA & CELERY SALT', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z550', '', '', '0', 0, '0', '', '', ''),
(299, 'ZAMOR CELERY SALT', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z567', '', '', '0', 0, '0', '', '', ''),
(300, 'ZAMOR CURRY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z574', '', '', '0', 0, '0', '', '', ''),
(301, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z581', '', '', '0', 0, '0', '', '', ''),
(302, 'ZAMOR MINT LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z598', '', '', '0', 0, '0', '', '', ''),
(303, 'ZAMOR LEMONGRASS (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z604', '', '', '0', 0, '0', '', '', ''),
(304, 'ZAMOR THYME LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z611', '', '', '0', 0, '0', '', '', ''),
(305, 'ZAMOR CHILLI OIL 125ML', '', '0.00', '26', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z628', '', '', '0', 0, '0', '', '', ''),
(306, 'ZAMOR DELICIOUS DILL', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z635', '', '', '0', 0, '0', '', '', ''),
(307, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '', '0.00', '45', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z642', '', '', '0', 0, '0', '', '', ''),
(308, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z666', '', '', '0', 0, '0', '', '', ''),
(309, 'ZAMOR CHILLIES, GARLIC & SALT', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z673', '', '', '0', 0, '0', '', '', ''),
(310, 'ZAMOR DRIED CHILLIES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z697', '', '', '0', 0, '0', '', '', ''),
(311, 'ZAMOR PUNCHY PARSLEY', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z703', '', '', '0', 0, '0', '', '', ''),
(312, 'ZAMOR ONION POWDER 100g', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z751', '', '', '0', 0, '0', '', '', ''),
(313, 'ZAMOR DILL (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z768', '', '', '0', 0, '0', '', '', ''),
(314, 'ZAMOR FENNEL 100g', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z775', '', '', '0', 0, '0', '', '', ''),
(315, 'ZAMOR Parsley (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z805', '', '', '0', 0, '0', '', '', ''),
(316, 'ZAMOR LUSCIOUS LAMB', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z867', '', '', '0', 0, '0', '', '', ''),
(317, 'ZAMOR HERBY HUKU', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z881', '', '', '0', 0, '0', '', '', ''),
(318, 'ZAMOR SRIRACHA SALT (BULK)', '', '0.00', '250', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z900', '', '', '0', 0, '0', '', '', ''),
(319, 'ZAMOR BULK CHILLIES', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z901', '', '', '0', 0, '0', '', '', ''),
(320, 'ZAMOR CELERY POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z902', '', '', '0', 0, '0', '', '', ''),
(321, 'ZAMOR CELERY STEM (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z903', '', '', '0', 0, '0', '', '', ''),
(322, 'ZAMOR PINK HIMALAYAN SALT (100g)', '', '0.00', '43', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z904', '', '', '0', 0, '0', '', '', ''),
(323, 'CHIA SEED', '', '0.00', '120', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z905', '', '', '0', 0, '0', '', '', ''),
(324, 'ZAMOR CHILLI POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z906', '', '', '0', 0, '0', '', '', ''),
(325, 'ZAMOR CHIVES (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z907', '', '', '0', 0, '0', '', '', ''),
(326, 'ZAMOR CRUNCHY CORIANDER (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z908', '', '', '0', 0, '0', '', '', ''),
(327, 'ZAMOR DILL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z909', '', '', '0', 0, '0', '', '', ''),
(328, 'ZAMOR FENNEL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z910', '', '', '0', 0, '0', '', '', ''),
(329, 'ZAMOR FENNEL ROOT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z911', '', '', '0', 0, '0', '', '', ''),
(330, 'ZAMOR GARLIC CHIVES (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z912', '', '', '0', 0, '0', '', '', ''),
(331, 'ZAMOR ONION POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z913', '', '', '0', 0, '0', '', '', ''),
(332, 'ZAMOR LEMON GRASS (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z914', '', '', '0', 0, '0', '', '', ''),
(333, 'ZAMOR MINT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z915', '', '', '0', 0, '0', '', '', ''),
(334, 'ZAMOR MORINGA LEAF', '', '0.00', '185', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z916', '', '', '0', 0, '0', '', '', ''),
(335, 'ZAMOR SPRING ONION POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z917', '', '', '0', 0, '0', '', '', ''),
(336, 'ZAMOR TARRAGON (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z918', '', '', '0', 0, '0', '', '', ''),
(337, 'ZAMOR THYME BULK (KG)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z919', '', '', '0', 0, '0', '', '', ''),
(338, 'ZAMOR DELICIOUS DILL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z920', '', '', '0', 0, '0', '', '', ''),
(339, 'ZAMOR SAGE (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z921', '', '', '0', 0, '0', '', '', ''),
(340, 'ZAMOR CURRY LEAVES (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z922', '', '', '0', 0, '0', '', '', ''),
(341, 'ZAMOR PARSLEY LEAF (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z923', '', '', '0', 0, '0', '', '', ''),
(342, 'ZAMOR BLACK PEPPER CORNS (100g)', '', '0.00', '50', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z928', '', '', '0', 0, '0', '', '', ''),
(343, 'ZAMOR TARRAGON (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z966', '', '', '0', 0, '0', '', '', ''),
(344, 'ZAMOR HERBY HUKU (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z981', '', '', '0', 0, '0', '', '', ''),
(345, 'ZAMOR LUSCIOUS LUMB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z983', '', '', '0', 0, '0', '', '', ''),
(346, 'ZAMOR CORIANDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z984', '', '', '0', 0, '0', '', '', ''),
(347, 'ZAMOR CHICKEN RUB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z985', '', '', '0', 0, '0', '', '', ''),
(348, 'ZAMOR CAJUN RUB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z986', '', '', '0', 0, '0', '', '', ''),
(349, 'ZAMOR LAMB RUB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z987', '', '', '0', 0, '0', '', '', ''),
(350, 'ZAMOR CELERY SALT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z988', '', '', '0', 0, '0', '', '', ''),
(351, 'ZAMOR FUNKY FENNL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z989', '', '', '0', 0, '0', '', '', ''),
(352, 'ZAMOR CHILLI, GARLIC SALT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z990', '', '', '0', 0, '0', '', '', ''),
(353, 'ZAMOR MIXED HERBS (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z991', '', '', '0', 0, '0', '', '', ''),
(354, 'ZAMOR PINK HIMALAYAN SALT (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z992', '', '', '0', 0, '0', '', '', ''),
(355, 'ZAMOR BLACK PEPPER CORNS (BULK)', '', '0.00', '224', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z993', '', '', '0', 0, '0', '', '', ''),
(356, 'ZAMOR MORINGA CELERY SALT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z994', '', '', '0', 0, '0', '', '', ''),
(357, 'ZAMOR ORIGANUM (Bulk)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z996', '', '', '0', 0, '0', '', '', ''),
(358, 'ZAMOR BASIL LEAVES BULK (KG)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z997', '', '', '0', 0, '0', '', '', ''),
(359, 'ZAMOR ROSEMARY (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z998', '', '', '0', 0, '0', '', '', ''),
(360, 'ZAMOR MIXED CHILLIES (BULK) 500G', '', '0.00', '200', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 6, 6, 'Z999', '', '', '0', 0, '0', '', '', ''),
(361, '', '', '0.00', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '', '', 0, '', '', '', ''),
(362, 'Moringa Miracle Capsules 180s (1x12)', '', '0.00', '825', '', 0, 1, 1, 0, 17, '', '2022-01-18 13:39:18', 7, 7, '1', '', '', '0', 0, '0', '', '', ''),
(363, 'Moringa Miracle Green Tea (1x12)', '', '0.00', '220', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '3', '', '', '0', 0, '0', '', '', ''),
(364, 'Moringa Powder (Bulk per KG)', '', '0.00', '51', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '4', '', '', '0', 0, '0', '', '', ''),
(365, 'Moringa Green Tea (Single)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '6', '', '', '0', 0, '0', '', '', ''),
(366, 'Moringa Capsules 180s (Singles)', '', '0.00', '90', '', 0, 0, 1, 0, 17, '', '2022-01-18 13:39:18', 7, 7, '7', '', '', '0', 0, '0', '', '', ''),
(367, 'No Sale/Cancelled Invoices', '', '0.00', '  -    ', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '10', '', '', '0', 0, '0', '', '', ''),
(368, 'Moringa Miracle Capsules 90s (1x15)', '', '0.00', '640', '', 0, 3, 1, 0, 17, '', '2022-01-18 13:39:18', 7, 7, '14', '', '', '0', 0, '0', '', '', ''),
(369, 'Moringa S.U.P. 250g Powder (Single)', '', '0.00', '60', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '20', '', '', '0', 0, '0', '', '', ''),
(370, 'Moringa Human Powder 100g (1x10)', '', '0.00', '230', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '25', '', '', '0', 0, '0', '', '', ''),
(371, 'Moringa 100g Powder (Single)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '33', '', '', '0', 0, '0', '', '', ''),
(372, 'Moringa Animal Feed Supplement 3kg', '', '0.00', '70', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '41', '', '', '0', 0, '0', '', '', ''),
(373, 'Moringa Animal Supplement 6kg', '', '0.00', '140', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '42', '', '', '0', 0, '0', '', '', ''),
(374, 'Moringa Pet Food Suppliment (1x10)', '', '0.00', '195', '', 0, 2, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '43', '', '', '0', 0, '0', '', '', ''),
(375, 'Moringa Capsules 90s (Singles)', '', '0.00', '56', '', 0, 0, 1, 0, 17, '', '2022-01-18 13:39:18', 7, 7, '45', '', '', '0', 0, '0', '', '', ''),
(376, 'Moringa 5KG Protein Pellets', '', '0.00', '145', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '46', '', '', '0', 0, '0', '', '', ''),
(377, 'Moringa 200G Protein Pellets (10x200G)', '', '0.00', '135', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '47', '', '', '0', 0, '0', '', '', ''),
(378, 'Moringa 200G Protein Pellets (Singles)', '', '0.00', '13', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '48', '', '', '0', 0, '0', '', '', ''),
(379, 'Moringa Animal Feed 200g (Singles)', '', '0.00', '18', '', 0, 1, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '49', '', '', '0', 0, '0', '', '', ''),
(380, 'Assorted Moringa Tea Pack', '', '0.00', '140', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '50', '', '', '0', 0, '0', '', '', ''),
(381, 'Moringa Lemon Grass Infusion (1x12)', '', '0.00', '250', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '52', '', '', '0', 0, '0', '', '', ''),
(382, 'Moringa Ginger & Lemon Infusion (1x12)', '', '0.00', '250', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '53', '', '', '0', 0, '0', '', '', ''),
(383, 'Moringa Apple & Cinnamon Infusion (1x12)', '', '0.00', '250', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '54', '', '', '0', 0, '0', '', '', ''),
(384, 'Moringa Lemon Grass Infusion (Singles)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '57', '', '', '0', 0, '0', '', '', ''),
(385, 'Moringa Ginger & Lemon Infusion (Singles)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '58', '', '', '0', 0, '0', '', '', ''),
(386, 'Moringa Apple & Cinnamon Infusion (Singles)', '', '0.00', '30', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '59', '', '', '0', 0, '0', '', '', ''),
(387, 'Moringa Pet Food Supplement (Singles)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '63', '', '', '0', 0, '0', '', '', ''),
(388, 'Moringa AFS 200g (1x10)', '', '0.00', '130', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '68', '', '', '0', 0, '0', '', '', ''),
(389, 'Sheep sales', '', '0.00', '140', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '70', '', '', '0', 0, '0', '', '', ''),
(390, 'Green Carrier Bags', '', '0.00', '3', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '71', '', '', '0', 0, '0', '', '', ''),
(391, 'Moringa Oil 100ml', '', '0.00', '120', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '72', '', '', '0', 0, '0', '', '', ''),
(392, 'Moringa Oil 50ML', '', '0.00', '60', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '73', '', '', '0', 0, '0', '', '', ''),
(393, 'Moringa Oil (Bulk per Litre)', '', '0.00', '960', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, '74', '', '', '0', 0, '0', '', '', ''),
(394, 'ZAMOR STARTER PACK (24 PIECE)', '', '0.00', '670', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z200', '', '', '0', 0, '0', '', '', ''),
(395, 'ZAMOR PICNIC GOURMET SET', '', '0.00', '275', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z201', '', '', '0', 0, '0', '', '', ''),
(396, 'ZAMOR STARTER PACK (12 PIECE)', '', '0.00', '371', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z202', '', '', '0', 0, '0', '', '', ''),
(397, 'ZAMOR CHADAROO CHUNKY 220G', '', '0.00', '55', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z216', '', '', '0', 0, '0', '', '', ''),
(398, 'ZAMOR CHADAROO PASTE 220G', '', '0.00', '55', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z223', '', '', '0', 0, '0', '', '', ''),
(399, 'ZAMOR PICKLED ONIONS (CHILLI) 590g', '', '0.00', '45', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z254', '', '', '0', 0, '0', '', '', ''),
(400, 'ZAMOR CUCUMBER 550G', '', '0.00', '33', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z278', '', '', '0', 0, '0', '', '', ''),
(401, 'ZAMOR CAJUN RUB 100g', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z283', '', '', '0', 0, '0', '', '', ''),
(402, 'ZAMOR CHICKEN RUB 100g', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z290', '', '', '0', 0, '0', '', '', ''),
(403, 'ZAMOR LAMB RUB 100g', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z306', '', '', '0', 0, '0', '', '', ''),
(404, 'ZAMOR BASIL (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z413', '', '', '0', 0, '0', '', '', ''),
(405, 'ZAMOR CELERY (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z420', '', '', '0', 0, '0', '', '', ''),
(406, 'ZAMORFUNKY FENNEL (100g)', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z437', '', '', '0', 0, '0', '', '', ''),
(407, 'ZAMOR GARLIC & SPRING ONION (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z444', '', '', '0', 0, '0', '', '', ''),
(408, 'ZAMOR MIXED CHILLIES (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z451', '', '', '0', 0, '0', '', '', ''),
(409, 'ZAMOR MIXED HERBS (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z468', '', '', '0', 0, '0', '', '', ''),
(410, 'ZAMOR ORIGANUM (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z475', '', '', '0', 0, '0', '', '', ''),
(411, 'ZAMOR CRUNCHY CORIANDER', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z482', '', '', '0', 0, '0', '', '', ''),
(412, 'ZAMOR PARSLEY & BASIL (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z499', '', '', '0', 0, '0', '', '', ''),
(413, 'ZAMOR ROSEMARY (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z505', '', '', '0', 0, '0', '', '', ''),
(414, 'ZAMOR SAGE (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z512', '', '', '0', 0, '0', '', '', ''),
(415, 'ZAMOR SRIRACHA SALT', '', '0.00', '43', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z529', '', '', '0', 0, '0', '', '', ''),
(416, 'ZAMOR THYME (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z536', '', '', '0', 0, '0', '', '', ''),
(417, 'ZAMOR BASIL LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z543', '', '', '0', 0, '0', '', '', ''),
(418, 'ZAMOR MORINGA & CELERY SALT', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z550', '', '', '0', 0, '0', '', '', ''),
(419, 'ZAMOR CELERY SALT', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z567', '', '', '0', 0, '0', '', '', ''),
(420, 'ZAMOR CURRY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z574', '', '', '0', 0, '0', '', '', ''),
(421, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z581', '', '', '0', 0, '0', '', '', ''),
(422, 'ZAMOR MINT LEAVES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z598', '', '', '0', 0, '0', '', '', ''),
(423, 'ZAMOR LEMONGRASS (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z604', '', '', '0', 0, '0', '', '', ''),
(424, 'ZAMOR THYME LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z611', '', '', '0', 0, '0', '', '', ''),
(425, 'ZAMOR CHILLI OIL 125ML', '', '0.00', '26', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z628', '', '', '0', 0, '0', '', '', ''),
(426, 'ZAMOR DELICIOUS DILL', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z635', '', '', '0', 0, '0', '', '', ''),
(427, 'ZAMOR PICKLED ONIONS (PLAIN) 590g', '', '0.00', '45', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z642', '', '', '0', 0, '0', '', '', ''),
(428, 'ZAMOR ROSEMARY LEAVES (50G) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z666', '', '', '0', 0, '0', '', '', ''),
(429, 'ZAMOR CHILLIES, GARLIC & SALT', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z673', '', '', '0', 0, '0', '', '', ''),
(430, 'ZAMOR DRIED CHILLIES (50g) POUCHES', '', '0.00', '20', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z697', '', '', '0', 0, '0', '', '', ''),
(431, 'ZAMOR PUNCHY PARSLEY', '', '0.00', '35', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z703', '', '', '0', 0, '0', '', '', ''),
(432, 'ZAMOR ONION POWDER 100g', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z751', '', '', '0', 0, '0', '', '', ''),
(433, 'ZAMOR DILL (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z768', '', '', '0', 0, '0', '', '', ''),
(434, 'ZAMOR FENNEL 100g', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z775', '', '', '0', 0, '0', '', '', ''),
(435, 'ZAMOR Parsley (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z805', '', '', '0', 0, '0', '', '', ''),
(436, 'ZAMOR LUSCIOUS LAMB', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z867', '', '', '0', 0, '0', '', '', ''),
(437, 'ZAMOR HERBY HUKU', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z881', '', '', '0', 0, '0', '', '', ''),
(438, 'ZAMOR SRIRACHA SALT (BULK)', '', '0.00', '250', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z900', '', '', '0', 0, '0', '', '', ''),
(439, 'ZAMOR BULK CHILLIES', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z901', '', '', '0', 0, '0', '', '', ''),
(440, 'ZAMOR CELERY POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z902', '', '', '0', 0, '0', '', '', ''),
(441, 'ZAMOR CELERY STEM (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z903', '', '', '0', 0, '0', '', '', ''),
(442, 'ZAMOR PINK HIMALAYAN SALT (100g)', '', '0.00', '43', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z904', '', '', '0', 0, '0', '', '', ''),
(443, 'CHIA SEED', '', '0.00', '120', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z905', '', '', '0', 0, '0', '', '', ''),
(444, 'ZAMOR CHILLI POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z906', '', '', '0', 0, '0', '', '', ''),
(445, 'ZAMOR CHIVES (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z907', '', '', '0', 0, '0', '', '', ''),
(446, 'ZAMOR CRUNCHY CORIANDER (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z908', '', '', '0', 0, '0', '', '', ''),
(447, 'ZAMOR DILL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z909', '', '', '0', 0, '0', '', '', ''),
(448, 'ZAMOR FENNEL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z910', '', '', '0', 0, '0', '', '', ''),
(449, 'ZAMOR FENNEL ROOT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z911', '', '', '0', 0, '0', '', '', ''),
(450, 'ZAMOR GARLIC CHIVES (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z912', '', '', '0', 0, '0', '', '', ''),
(451, 'ZAMOR ONION POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z913', '', '', '0', 0, '0', '', '', ''),
(452, 'ZAMOR LEMON GRASS (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z914', '', '', '0', 0, '0', '', '', ''),
(453, 'ZAMOR MINT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z915', '', '', '0', 0, '0', '', '', ''),
(454, 'ZAMOR MORINGA LEAF', '', '0.00', '185', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z916', '', '', '0', 0, '0', '', '', ''),
(455, 'ZAMOR SPRING ONION POWDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z917', '', '', '0', 0, '0', '', '', ''),
(456, 'ZAMOR TARRAGON (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z918', '', '', '0', 0, '0', '', '', ''),
(457, 'ZAMOR THYME BULK (KG)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z919', '', '', '0', 0, '0', '', '', ''),
(458, 'ZAMOR DELICIOUS DILL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z920', '', '', '0', 0, '0', '', '', ''),
(459, 'ZAMOR SAGE (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z921', '', '', '0', 0, '0', '', '', ''),
(460, 'ZAMOR CURRY LEAVES (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z922', '', '', '0', 0, '0', '', '', ''),
(461, 'ZAMOR PARSLEY LEAF (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z923', '', '', '0', 0, '0', '', '', ''),
(462, 'ZAMOR BLACK PEPPER CORNS (100g)', '', '0.00', '50', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z928', '', '', '0', 0, '0', '', '', ''),
(463, 'ZAMOR TARRAGON (100g)', '', '0.00', '25', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z966', '', '', '0', 0, '0', '', '', ''),
(464, 'ZAMOR HERBY HUKU (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z981', '', '', '0', 0, '0', '', '', ''),
(465, 'ZAMOR LUSCIOUS LUMB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z983', '', '', '0', 0, '0', '', '', ''),
(466, 'ZAMOR CORIANDER (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z984', '', '', '0', 0, '0', '', '', ''),
(467, 'ZAMOR CHICKEN RUB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z985', '', '', '0', 0, '0', '', '', ''),
(468, 'ZAMOR CAJUN RUB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z986', '', '', '0', 0, '0', '', '', ''),
(469, 'ZAMOR LAMB RUB (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z987', '', '', '0', 0, '0', '', '', ''),
(470, 'ZAMOR CELERY SALT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z988', '', '', '0', 0, '0', '', '', ''),
(471, 'ZAMOR FUNKY FENNL (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z989', '', '', '0', 0, '0', '', '', ''),
(472, 'ZAMOR CHILLI, GARLIC SALT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z990', '', '', '0', 0, '0', '', '', ''),
(473, 'ZAMOR MIXED HERBS (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z991', '', '', '0', 0, '0', '', '', ''),
(474, 'ZAMOR PINK HIMALAYAN SALT (BULK)', '', '0.00', '150', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z992', '', '', '0', 0, '0', '', '', ''),
(475, 'ZAMOR BLACK PEPPER CORNS (BULK)', '', '0.00', '224', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z993', '', '', '0', 0, '0', '', '', ''),
(476, 'ZAMOR MORINGA CELERY SALT (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z994', '', '', '0', 0, '0', '', '', ''),
(477, 'ZAMOR ORIGANUM (Bulk)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z996', '', '', '0', 0, '0', '', '', ''),
(478, 'ZAMOR BASIL LEAVES BULK (KG)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z997', '', '', '0', 0, '0', '', '', ''),
(479, 'ZAMOR ROSEMARY (BULK)', '', '0.00', '145', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z998', '', '', '0', 0, '0', '', '', ''),
(480, 'ZAMOR MIXED CHILLIES (BULK) 500G', '', '0.00', '200', '', 0, 0, 1, 0, 17, '', '2022-01-07 11:51:37', 7, 7, 'Z999', '', '', '0', 0, '0', '', '', ''),
(485, 'Moringa Animal Feed Supplement 3kg', 'Moringa Animal Feed Supplement 3kg', '0.00', '70', 'default.gif', 59, 69, 1, 0, 17, '0', '2022-01-18 08:09:06', 4, 4, '41', '', '', '0', 0, '0', '', '', '0'),
(487, 'Moringa Miracle Capsules 180s (1x12)', 'Moringa Miracle Capsules ', '0.00', '825', 'default.gif', 59, 53, 1, 0, 17, '0', '2022-01-18 13:32:08', 4, 4, '01', '', '', '0', 0, '0', '', '', '0'),
(488, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '640.00', '640', 'default.gif', 59, 36, 1, 0, 17, 'Non', '2022-01-17 09:16:47', 59, 4, '14', '', '', '0', 0, '0', '', '', ''),
(489, 'Moringa Miracle Capsules 90s (1x15)', 'Moringa Miracle Capsules 90s (1x15)', '640.00', '640', '', 59, 5, 1, 0, 17, 'Non', '2022-01-12 06:05:11', 59, 5, '14', '', '', NULL, 0, NULL, '', '', ''),
(490, 'Moringa Human Powder 100g (singles)', '', '0.00', '30', 'default.gif', 59, 8, 1, 0, 17, 'Non', '2022-01-18 10:09:55', 59, 4, '', '', '', '0', 0, '0', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request`
--

CREATE TABLE IF NOT EXISTS `purchase_request` (
  `pr_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_tb`
--

CREATE TABLE IF NOT EXISTS `quotation_tb` (
  `quote_id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `price` text NOT NULL,
  `qty` text NOT NULL,
  `branch_id` text NOT NULL,
  `user_id` text NOT NULL,
  `price_tag` text NOT NULL,
  `customer` text NOT NULL,
  `description` text NOT NULL,
  `quote_description` text NOT NULL,
  `validity` text NOT NULL,
  `status` text NOT NULL,
  `currency` text NOT NULL,
  `quote_identity` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_tb`
--

INSERT INTO `quotation_tb` (`quote_id`, `prod_id`, `price`, `qty`, `branch_id`, `user_id`, `price_tag`, `customer`, `description`, `quote_description`, `validity`, `status`, `currency`, `quote_identity`, `date_added`, `discount`) VALUES
(19, 19, '140', '2', '1', '8', '', '1903 HARLEY DAVIDSON CAFE', '', '', '', 'printed', 'ZMW', 20, '2022-09-02 08:03:36', '10'),
(20, 82, '20', '2', '1', '8', '', 'AADARSH PHARMACY', '', '', '', 'printed', 'USD (Dollar)', 21, '2022-09-22 10:05:34', ''),
(21, 82, '20', '2', '1', '8', '', '1903 HARLEY DAVIDSON CAFE', '', '', '', 'printed', 'ZMW', 24, '2022-09-25 17:07:39', ''),
(22, 17, '13', '1', '1', '8', '', '1903 HARLEY DAVIDSON CAFE', '', '', '', 'printed', 'ZMW', 24, '2022-09-25 17:07:39', ''),
(23, 24, '30', '1', '1', '8', '', '1903 HARLEY DAVIDSON CAFE', '', '', '', 'printed', 'ZMW', 24, '2022-09-25 17:07:39', ''),
(24, 82, '20', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(26, 21, '250', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(27, 18, '18', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(28, 18, '18', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(29, 82, '20', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(30, 82, '20', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(31, 82, '20', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', ''),
(32, 82, '20', '1', '1', '8', '', 'AFRICA SUPERMARKETS LIMITED', '', '', '', 'printed', 'ZMW', 33, '2023-08-11 13:01:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `rawdata_tb`
--

CREATE TABLE IF NOT EXISTS `rawdata_tb` (
  `id` int(12) NOT NULL,
  `class` text NOT NULL,
  `description` text NOT NULL,
  `colour` text NOT NULL,
  `category_id` int(12) NOT NULL,
  `origin` text NOT NULL,
  `qty` int(12) NOT NULL,
  `type` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawdata_tb`
--

INSERT INTO `rawdata_tb` (`id`, `class`, `description`, `colour`, `category_id`, `origin`, `qty`, `type`, `date`) VALUES
(1, 'PP', 'PP', 'Black', 59, 'USA', 44, 'RAW', '2019-09-05 11:07:32'),
(2, 'PP SUB', 'PP SUB', '', 59, 'SA', 23, 'SUB', '2019-09-05 11:02:05'),
(3, 'PP', 'sup ', '1', 59, 'mm', 50, 'RAW', '2019-09-05 11:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `rawdata_updates_tb`
--

CREATE TABLE IF NOT EXISTS `rawdata_updates_tb` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `status` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_id` int(12) NOT NULL,
  `action_status` text NOT NULL,
  `value` int(12) NOT NULL,
  `job` text NOT NULL,
  `source` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawdata_updates_tb`
--

INSERT INTO `rawdata_updates_tb` (`id`, `user_id`, `status`, `date_added`, `item_id`, `action_status`, `value`, `job`, `source`) VALUES
(6, 10, 'IN', '2019-08-22 13:44:48', 5, 'updated', 1, 'DMC', 'KOREA'),
(7, 10, 'IN', '2019-09-05 11:02:05', 1, 'updated', 1, 'PVC', 'KOREA'),
(8, 10, 'IN', '2019-09-05 11:02:05', 2, 'updated', 1, 'DMC', 'KOREA'),
(9, 10, 'OUT', '2019-09-05 11:07:32', 1, 'updated', 12, 'DMC', 'KOREA'),
(10, 10, 'IN', '2020-10-26 13:00:59', 1, '', 10, 'N/A', 'KOREA');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `date_added` datetime NOT NULL,
  `modeofpayment` varchar(15) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_no` int(12) NOT NULL,
  `customer_id` text NOT NULL,
  `rate` text NOT NULL,
  `pay_acc_id` int(11) NOT NULL,
  `payment_acc_name` text NOT NULL,
  `balance` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `user_id`, `discount`, `amount_due`, `date_added`, `modeofpayment`, `branch_id`, `total`, `order_no`, `customer_id`, `rate`, `pay_acc_id`, `payment_acc_name`, `balance`) VALUES
(261, 8, '0.00', '145.00', '2023-09-22 09:23:02', '1', 1, '145.00', 5230, '45', '', 15, '', '900'),
(262, 8, '0.00', '18.00', '2023-09-22 09:24:44', '1', 1, '108.00', 5232, '45', '', 15, '', '1045'),
(263, 8, '0.00', '90.00', '2023-09-22 09:24:44', '1', 1, '108.00', 5232, '45', '', 15, '', '1063'),
(264, 8, '0.00', '980.00', '2023-10-04 12:32:53', '1', 1, '980.00', 2813, '45', '', 0, '', ''),
(265, 8, '0.00', '0.00', '2023-10-04 12:34:05', '1', 1, '0.00', 4560, '44', '', 0, '', ''),
(266, 8, '0.00', '250.00', '2023-10-04 12:36:27', '1', 1, '250.00', 1793, '45', '21', 0, '', ''),
(267, 8, '0.00', '250.00', '2023-10-04 12:37:02', '1', 1, '250.00', 763, '45', '21', 0, '', ''),
(268, 8, '0.00', '18.00', '2023-10-04 12:39:40', '1', 1, '238.00', 5231, '45', '', 6, '', '400'),
(269, 8, '0.00', '195.00', '2023-10-04 12:39:40', '1', 1, '238.00', 5231, '45', '', 6, '', '418'),
(270, 8, '0.00', '25.00', '2023-10-04 12:39:40', '1', 1, '238.00', 5231, '45', '', 6, '', '613'),
(271, 8, '0.00', '20.00', '2023-10-04 12:54:28', '1', 1, '32.00', 5244, '45', '', 6, '', '638'),
(272, 8, '0.00', '12.00', '2023-10-04 12:54:28', '1', 1, '32.00', 5244, '45', '', 6, '', '658'),
(273, 8, '0.00', '0.00', '2023-10-04 12:54:50', '1', 1, '0.00', 5245, '44', '', 6, '', '670');

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

CREATE TABLE IF NOT EXISTS `sales_details` (
  `sales_details_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` text NOT NULL,
  `order_no` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `casher_trans_id` int(11) DEFAULT NULL,
  `discount` text NOT NULL,
  `discount_type` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_details`
--

INSERT INTO `sales_details` (`sales_details_id`, `sales_id`, `prod_id`, `price`, `qty`, `order_no`, `user_id`, `casher_trans_id`, `discount`, `discount_type`, `description`) VALUES
(105, 51, 570, '120.00', '2', 1027, 8, 13, '', '', ''),
(106, 51, 517, '3.00', '1', 1027, 8, 14, '', '', ''),
(107, 52, 504, '135.00', '1', 2019, 8, 26, '', '', ''),
(108, 53, 29, '3.00', '2', 3408, 8, NULL, '', '', ''),
(109, 53, 15, '145.00', '1', 3408, 8, NULL, '', '', ''),
(110, 54, 29, '3.00', '2', 5072, 8, NULL, '', '', ''),
(111, 55, 504, '13885.00', '5', 5075, 8, NULL, '', '', ''),
(112, 55, 510, '250.00', '1', 5075, 8, NULL, '', '', ''),
(113, 56, 2, '220.00', '4', 5076, 8, NULL, '', '', ''),
(114, 57, 2, '220.00', '9', 5078, 8, NULL, '', '', ''),
(115, 58, 42, '35.00', '1', 5077, 8, NULL, '', '', ''),
(116, 59, 58, '35.00', '10', 5079, 8, NULL, '', '', ''),
(117, 60, 29, '3.00', '1', 5080, 8, NULL, '', '', ''),
(118, 61, 615, '12.00', '1', 5081, 8, NULL, '', '', ''),
(119, 62, 15, '145.00', '2', 5083, 8, NULL, '', '', ''),
(120, 63, 15, '145.00', '1', 5085, 8, NULL, '', '', ''),
(121, 64, 9, '230.00', '1', 5084, 8, NULL, '', '', ''),
(122, 65, 29, '3.00', '1', 5086, 8, NULL, '', '', ''),
(123, 66, 488, '640.00', '1', 5087, 8, NULL, '', '', ''),
(124, 67, 49, '25.00', '1', 5088, 8, NULL, '', '', ''),
(125, 68, 29, '3.00', '1', 5088, 8, NULL, '', '', ''),
(126, 69, 490, '30.00', '5', 5086, 8, NULL, '', '', ''),
(127, 70, 30, '120.00', '1', 5087, 8, NULL, '', '', ''),
(128, 71, 49, '25.00', '1', 5082, 8, NULL, '', '', ''),
(129, 72, 13, '195.00', '1', 5088, 8, NULL, '', '', ''),
(130, 73, 17, '13.00', '1', 5089, 8, NULL, '', '', ''),
(131, 74, 18, '18.00', '1', 5090, 8, NULL, '', '', ''),
(132, 75, 29, '3.00', '1', 5089, 8, NULL, '', '', ''),
(133, 76, 29, '3.00', '4', 5090, 8, NULL, '', '', ''),
(134, 77, 1, '825.00', '1', 5088, 8, NULL, '', '', ''),
(135, 78, 42, '35.00', '1', 5087, 8, NULL, '', '', ''),
(136, 79, 16, '135.00', '1', 5091, 8, NULL, '', '', ''),
(137, 80, 16, '135.00', '1', 5094, 8, NULL, '', '', ''),
(138, 81, 56, '20.00', '1', 5094, 8, NULL, '', '', ''),
(139, 82, 17, '13.00', '1', 5109, 8, NULL, '', '', ''),
(140, 83, 17, '13.00', '1', 5104, 8, NULL, '', '', ''),
(141, 84, 46, '25.00', '1', 5104, 8, NULL, '', '', ''),
(142, 85, 31, '60.00', '1', 5107, 8, NULL, '', '', ''),
(143, 86, 17, '13.00', '1', 5108, 8, NULL, '', '', ''),
(144, 87, 17, '13.00', '3', 5110, 8, NULL, '', '', ''),
(145, 88, 67, '20.00', '1', 5112, 8, NULL, '', '', ''),
(146, 89, 22, '250.00', '1', 5112, 8, NULL, '', '', ''),
(147, 90, 31, '60.00', '1', 5112, 8, NULL, '', '', ''),
(148, 91, 18, '40.00', '2', 5110, 8, NULL, '', '', ''),
(149, 92, 25, '30.00', '1', 5110, 8, NULL, '', '', ''),
(150, 93, 17, '13.00', '1', 5116, 8, NULL, '', '', ''),
(151, 94, 615, '12.00', '5', 5113, 8, NULL, '', '', ' Hello'),
(152, 95, 615, '12.00', '5', 5120, 8, NULL, '', '', ' FINAL'),
(153, 96, 615, '12.00', '5', 5120, 8, NULL, '', '', ' finaL'),
(154, 97, 615, '12.00', '3', 5120, 8, NULL, '', '', ' Fin'),
(155, 98, 615, '12.00', '5', 5120, 8, NULL, '', '', ' '),
(156, 99, 45, '35.00', '2', 5113, 8, NULL, '', '', ' '),
(157, 100, 15, '145.00', '4', 5114, 8, NULL, '', '', ' '),
(158, 101, 22, '250.00', '3', 5113, 8, NULL, '', '', ' nshima'),
(159, 102, 56, '20.00', '3', 5113, 8, NULL, '', '', ''),
(160, 103, 13, '195.00', '1', 5113, 8, NULL, '', '', ''),
(161, 104, 22, '250.00', '1', 5115, 8, NULL, '', '', ''),
(162, 105, 18, '18.00', '1', 5114, 8, NULL, '', '', ''),
(163, 106, 12, '140.00', '1', 5114, 8, NULL, '', '', ''),
(164, 107, 17, '13.00', '1', 5114, 8, NULL, '', '', ''),
(165, 108, 112, '145.00', '1', 5113, 8, NULL, '', '', ''),
(166, 109, 28, '140.00', '1', 5113, 8, NULL, '', '', ''),
(167, 110, 18, '18.00', '1', 5113, 8, NULL, '', '', ''),
(168, 111, 18, '18.00', '1', 5129, 8, NULL, '', '', ' Two Again'),
(169, 112, 63, '20.00', '1', 5129, 8, NULL, '', '', ' Two Again'),
(170, 113, 15, '145.00', '1', 5130, 8, NULL, '', '', ' youcanwin'),
(171, 114, 12, '140.00', '1', 5127, 8, NULL, '', '', ' 1 one'),
(172, 115, 18, '18.00', '1', 5131, 8, NULL, '', '', ' 18 kwacha'),
(173, 116, 24, '30.00', '2', 5126, 8, NULL, '', '', ' ZAMOR 2 Times'),
(174, 117, 56, '20.00', '1', 5126, 8, NULL, '', '', ' ZAMOR 2 Times'),
(175, 118, 12, '140.00', '1', 5125, 8, NULL, '', '', ' 3 times'),
(176, 119, 18, '18.00', '1', 5125, 8, NULL, '', '', ' 3 times'),
(177, 120, 15, '145.00', '1', 5125, 8, NULL, '', '', ' 3 times'),
(178, 121, 68, '35.00', '1', 5136, 8, NULL, '', '', ' '),
(179, 122, 22, '250.00', '1', 5134, 8, NULL, '', '', ' '),
(180, 123, 15, '145.00', '1', 5137, 8, NULL, '', '', ' '),
(181, 124, 61, '20.00', '1', 5134, 8, NULL, '', '', ' '),
(182, 125, 34, '275.00', '1', 5139, 8, NULL, '', '', ' '),
(183, 126, 68, '35.00', '1', 5132, 8, NULL, '', '', ' '),
(184, 127, 55, '25.00', '1', 5132, 8, NULL, '', '', ' partial'),
(185, 128, 91, '145.00', '1', 5132, 8, NULL, '', '', ' partial'),
(186, 129, 18, '18.00', '1', 5132, 8, NULL, '', '', ' hello'),
(187, 130, 15, '145.00', '1', 5141, 8, NULL, '', '', ' partial'),
(188, 0, 0, '0.00', '', 5134, 8, NULL, '0', '', ''),
(189, 132, 5, '90.00', '1', 5142, 8, NULL, '', '', ' yep'),
(190, 134, 4, '25.00', '1', 5133, 8, NULL, '', '', ' three'),
(191, 0, 0, '0.00', '', 5143, 8, NULL, '0', '', ''),
(192, 135, 49, '25.00', '1', 5144, 8, NULL, '', '', ' two'),
(193, 0, 0, '0.00', '', 5146, 8, NULL, '0', '', ''),
(194, 0, 0, '0.00', '', 5146, 8, NULL, '0', '', ''),
(195, 0, 0, '0.00', '', 5146, 8, NULL, '0', '', ''),
(196, 0, 0, '0.00', '', 5147, 8, NULL, '0', '', ''),
(197, 0, 0, '0.00', '', 5147, 8, NULL, '0', '', ''),
(198, 138, 49, '25.00', '1', 5145, 8, NULL, '', '', ' three'),
(199, 0, 0, '0.00', '', 5145, 8, NULL, '0', '', ''),
(200, 139, 15, '145.00', '1', 5150, 8, NULL, '', '', ' '),
(201, 140, 22, '250.00', '1', 5148, 8, NULL, '', '', ' '),
(202, 141, 118, '145.00', '1', 5149, 8, NULL, '', '', ' '),
(203, 143, 12, '140.00', '1', 5151, 8, NULL, '', '', ' 2 done'),
(204, 145, 34, '275.00', '1', 5152, 8, NULL, '', '', ' '),
(205, 146, 70, '35.00', '2', 5154, 8, NULL, '', '', ' Scar'),
(206, 147, 72, '25.00', '1', 5153, 8, NULL, '', '', ' yep'),
(207, 148, 65, '35.00', '1', 5153, 8, NULL, '', '', ' yep'),
(208, 149, 9, '230.00', '1', 5155, 8, NULL, '', '', ' yess'),
(209, 150, 488, '640.00', '1', 5155, 8, NULL, '', '', ' yess'),
(210, 151, 52, '25.00', '1', 5156, 8, NULL, '', '', ' '),
(211, 152, 48, '25.00', '1', 5156, 8, NULL, '', '', ' '),
(212, 153, 113, '150.00', '1', 5157, 8, NULL, '', '', ' '),
(213, 154, 70, '35.00', '1', 5157, 8, NULL, '', '', ' '),
(214, 155, 12, '140.00', '1', 5159, 8, NULL, '', '', ' hello'),
(215, 156, 60, '20.00', '1', 5159, 8, NULL, '', '', ' hello'),
(216, 157, 44, '25.00', '1', 5159, 8, NULL, '', '', ' hello'),
(217, 158, 15, '145.00', '1', 5158, 8, NULL, '', '', ' '),
(218, 159, 15, '145.00', '1', 5161, 8, NULL, '', '', ' '),
(219, 160, 22, '250.00', '1', 5161, 8, NULL, '', '', ' '),
(220, 161, 610, '25.00', '20', 5161, 8, NULL, '', '', ' '),
(221, 162, 31, '60.00', '1', 5163, 8, NULL, '', '', ' '),
(222, 163, 102, '25.00', '1', 5167, 8, NULL, '', '', ' '),
(223, 164, 18, '18.00', '1', 5168, 8, NULL, '', '', ' '),
(224, 165, 50, '35.00', '1', 5168, 8, NULL, '', '', ' '),
(225, 166, 15, '145.00', '1', 5165, 8, NULL, '', '', ' '),
(226, 167, 61, '20.00', '1', 5166, 8, NULL, '', '', ' '),
(227, 168, 49, '25.00', '1', 5162, 8, NULL, '', '', ' multi'),
(228, 169, 610, '25.00', '1', 5162, 8, NULL, '', '', ' multi'),
(229, 170, 34, '275.00', '1', 5162, 8, NULL, '', '', ' multi'),
(230, 171, 55, '25.00', '1', 5162, 8, NULL, '', '', ' multi'),
(231, 172, 31, '60.00', '1', 5163, 8, NULL, '', '', ' '),
(232, 173, 12, '140.00', '6', 5160, 8, NULL, '', '', ' done nito'),
(233, 174, 7, '640.00', '1', 5160, 8, NULL, '', '', ' done nito'),
(234, 175, 50, '35.00', '1', 5172, 8, NULL, '', '', ' '),
(235, 176, 59, '20.00', '1', 5170, 8, NULL, '', '', ' '),
(236, 177, 56, '20.00', '1', 5171, 8, NULL, '', '', ' '),
(237, 178, 22, '250.00', '1', 5173, 8, NULL, '', '', ' '),
(238, 179, 7, '640.00', '1', 5173, 8, NULL, '', '', ' '),
(239, 180, 48, '25.00', '1', 5174, 8, NULL, '', '', ' '),
(240, 181, 15, '145.00', '1', 5169, 8, NULL, '', '', ' '),
(241, 182, 101, '50.00', '1', 5169, 8, NULL, '', '', ' '),
(242, 183, 15, '145.00', '1', 5175, 8, NULL, '', '', ' '),
(243, 184, 18, '18.00', '1', 5177, 8, NULL, '', '', ' '),
(244, 185, 20, '250.00', '1', 5178, 8, NULL, '', '', ' '),
(245, 186, 15, '145.00', '1', 5176, 8, NULL, '', '', ' '),
(246, 187, 18, '18.00', '1', 5179, 8, NULL, '', '', ' slaes for marketing'),
(247, 188, 22, '250.00', '6', 5179, 8, NULL, '', '', ' slaes for marketing'),
(248, 189, 12, '140.00', '1', 5116, 8, NULL, '', '', ''),
(249, 190, 18, '18.00', '1', 5117, 8, NULL, '', '', ' bag of fries'),
(250, 191, 2, '220.00', '1', 5117, 8, NULL, '', '', ' bag of fries'),
(251, 192, 488, '640.00', '1', 5117, 8, NULL, '', '', ' bag of fries'),
(252, 193, 18, '18.00', '1', 5180, 8, NULL, '', '', ' '),
(253, 194, 25, '30.00', '1', 5182, 8, NULL, '', '', ' '),
(254, 195, 14, '56.00', '1', 5183, 8, NULL, '', '', ' '),
(255, 196, 25, '30.00', '1', 5184, 8, NULL, '', '', ' '),
(256, 197, 22, '250.00', '1', 5189, 8, NULL, '', '', ' '),
(257, 198, 47, '25.00', '1', 5190, 8, NULL, '', '', ' '),
(258, 199, 81, '43.00', '1', 5186, 8, NULL, '', '', ' '),
(259, 200, 18, '18.00', '1', 5187, 8, NULL, '', '', ' '),
(260, 201, 568, '145.00', '1', 5187, 8, NULL, '', '', ' '),
(261, 202, 25, '30.00', '1', 5185, 8, NULL, '', '', ' '),
(262, 203, 64, '56.00', '15', 5188, 8, NULL, '', '', ' '),
(263, 204, 17, '0.00', '1', 5111, 8, NULL, '', '', ''),
(264, 204, 22, '0.00', '1', 5111, 8, NULL, '', '', ''),
(265, 204, 25, '0.00', '1', 5111, 8, NULL, '', '', ''),
(266, 205, 25, '30.00', '1', 5193, 8, NULL, '', '', ' '),
(267, 206, 46, '25.00', '1', 5193, 8, NULL, '', '', ' '),
(268, 207, 18, '18.00', '1', 5191, 8, NULL, '', '', ' '),
(269, 208, 18, '18.00', '1', 5192, 8, NULL, '', '', ' '),
(270, 209, 22, '250.00', '1', 5192, 8, NULL, '', '', ' '),
(271, 210, 70, '35.00', '1', 5194, 8, NULL, '', '', ' '),
(272, 211, 61, '20.00', '1', 5195, 8, NULL, '', '', ' '),
(273, 212, 14, '56.00', '1', 5200, 8, NULL, '', '', ' '),
(274, 213, 610, '25.00', '1', 5201, 8, NULL, '', '', ' '),
(275, 214, 25, '30.00', '1', 5199, 8, NULL, '', '', ' '),
(276, 215, 58, '35.00', '1', 5199, 8, NULL, '', '', ' '),
(277, 216, 605, '145.00', '1', 5202, 8, NULL, '', '', ' '),
(278, 217, 22, '250.00', '1', 5196, 8, NULL, '', '', ' '),
(279, 218, 70, '35.00', '1', 5198, 8, NULL, '', '', ' '),
(280, 219, 50, '35.00', '1', 5204, 8, NULL, '', '', ' '),
(281, 220, 41, '35.00', '1', 5204, 8, NULL, '', '', ' '),
(282, 221, 55, '25.00', '2', 5205, 8, NULL, '', '', ' '),
(283, 222, 49, '25.00', '1', 5207, 8, NULL, '', '', ' '),
(284, 223, 34, '275.00', '1', 5207, 8, NULL, '', '', ' '),
(285, 224, 488, '640.00', '1', 5203, 8, NULL, '', '', ' '),
(286, 225, 40, '35.00', '1', 5203, 8, NULL, '', '', ' '),
(287, 226, 5, '90.00', '1', 5206, 8, NULL, '', '', ' '),
(288, 227, 31, '60.00', '1', 5208, 8, NULL, '', '', ' '),
(289, 228, 45, '35.00', '1', 5209, 8, NULL, '', '', ' '),
(290, 229, 74, '25.00', '1', 5209, 8, NULL, '', '', ' '),
(291, 230, 12, '140.00', '1', 5210, 8, NULL, '', '', ' '),
(292, 231, 487, '825.00', '1', 5210, 8, NULL, '', '', ' '),
(293, 232, 37, '55.00', '1', 5210, 8, NULL, '', '', ' '),
(294, 233, 18, '18.00', '1', 5214, 8, NULL, '', '', ' '),
(295, 234, 70, '35.00', '1', 5214, 8, NULL, '', '', ' '),
(296, 235, 14, '56.00', '1', 5214, 8, NULL, '', '', ' '),
(297, 236, 12, '140.00', '1', 5215, 8, NULL, '', '', ' '),
(298, 237, 5, '90.00', '1', 5215, 8, NULL, '', '', ' '),
(299, 238, 26, '25.00', '1', 5215, 8, NULL, '', '', ' '),
(300, 239, 18, '18.00', '1', 5212, 8, NULL, '', '', ' '),
(301, 240, 572, '145.00', '1', 5213, 8, NULL, '', '', ' '),
(302, 241, 70, '35.00', '1', 5217, 8, NULL, '', '', ' '),
(303, 242, 94, '145.00', '1', 5218, 8, NULL, '', '', ' '),
(304, 243, 55, '25.00', '1', 5218, 8, NULL, '', '', ' '),
(305, 244, 12, '140.00', '1', 5219, 8, NULL, '', '', ' '),
(306, 245, 5, '90.00', '1', 5219, 8, NULL, '', '', ' '),
(307, 246, 21, '250.00', '1', 5219, 8, NULL, '', '', ' '),
(308, 247, 18, '18.00', '1', 5216, 8, NULL, '', '', ' '),
(309, 248, 31, '60.00', '1', 5216, 8, NULL, '', '', ' '),
(310, 249, 1, '825.00', '1', 5216, 8, NULL, '', '', ' '),
(311, 0, 572, '145.00', '1', 5211, 8, NULL, '', '', ' '),
(312, 311, 91, '145.00', '1', 5211, 8, NULL, '', '', ' '),
(313, 312, 45, '35.00', '1', 5211, 8, NULL, '', '', ' '),
(314, 0, 12, '140.00', '1', 5224, 8, NULL, '', '', ' '),
(315, 0, 2, '220.00', '1', 5224, 8, NULL, '', '', ' '),
(316, 315, 488, '640.00', '1', 5224, 8, NULL, '', '', ' '),
(317, 0, 61, '20.00', '1', 5223, 8, NULL, '', '', ' '),
(318, 317, 568, '145.00', '1', 5223, 8, NULL, '', '', ' '),
(319, 318, 21, '250.00', '1', 5223, 8, NULL, '', '', ' '),
(320, 0, 18, '18.00', '1', 5220, 8, NULL, '', '', ' '),
(321, 0, 5, '90.00', '1', 5220, 8, NULL, '', '', ' '),
(322, 0, 64, '56.00', '1', 5222, 8, NULL, '', '', ' '),
(323, 322, 102, '25.00', '1', 5222, 8, NULL, '', '', ' '),
(324, 323, 63, '20.00', '1', 5222, 8, NULL, '', '', ' '),
(325, 0, 40, '35.00', '1', 5226, 8, NULL, '', '', ' '),
(326, 325, 73, '25.00', '1', 5226, 8, NULL, '', '', ' '),
(327, 0, 26, '25.00', '1', 5225, 8, NULL, '', '', ' '),
(328, 0, 568, '145.00', '1', 5225, 8, NULL, '', '', ' '),
(329, 257, 41, '35.00', '1', 5221, 8, NULL, '', '', ' '),
(330, 258, 8, '60.00', '1', 5229, 8, NULL, '', '', ' '),
(331, 259, 7, '640.00', '1', 5227, 8, NULL, '', '', ' '),
(332, 260, 40, '35.00', '1', 5228, 8, NULL, '', '', ' '),
(333, 261, 568, '145.00', '1', 5230, 8, NULL, '', '', ' '),
(334, 262, 18, '18.00', '1', 5232, 8, NULL, '', '', ' '),
(335, 263, 5, '90.00', '1', 5232, 8, NULL, '', '', ' '),
(336, 264, 22, '250.00', '1', 2813, 8, NULL, '', '', ''),
(337, 264, 8, '60.00', '1', 2813, 8, NULL, '', '', ''),
(338, 264, 33, '670.00', '1', 2813, 8, NULL, '', '', ''),
(339, 265, 22, '0.00', '1', 4560, 8, NULL, '', '', ''),
(340, 265, 26, '0.00', '1', 4560, 8, NULL, '', '', ''),
(341, 266, 22, '250.00', '1', 1793, 8, NULL, '', '', ''),
(342, 268, 18, '18.00', '1', 5231, 8, NULL, '', '', ' '),
(343, 269, 13, '195.00', '1', 5231, 8, NULL, '', '', ' '),
(344, 270, 55, '25.00', '1', 5231, 8, NULL, '', '', ' '),
(345, 271, 63, '20.00', '1', 5244, 8, NULL, '', '', ' test 2'),
(346, 272, 615, '12.00', '1', 5244, 8, NULL, '', '', ' test 2'),
(347, 273, 18, '0.00', '1', 5245, 8, NULL, '', '', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `sales_tb`
--

CREATE TABLE IF NOT EXISTS `sales_tb` (
  `id` int(12) NOT NULL,
  `item_sold_id` int(12) NOT NULL,
  `quantity` int(12) NOT NULL,
  `sales_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int(12) NOT NULL,
  `price` int(12) NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `send_stock_to_user_temp`
--

CREATE TABLE IF NOT EXISTS `send_stock_to_user_temp` (
  `temp_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `InStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_category_tb`
--

CREATE TABLE IF NOT EXISTS `shop_category_tb` (
  `id` int(12) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_category_tb`
--

INSERT INTO `shop_category_tb` (`id`, `name`) VALUES
(1, 'Bar'),
(2, 'Restruant');

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE IF NOT EXISTS `stockin` (
  `stockin_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(6) NOT NULL,
  `date` datetime NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`stockin_id`, `prod_id`, `qty`, `date`, `branch_id`) VALUES
(1, 5, 5, '2017-02-04 01:10:41', 1),
(2, 15, 100, '2017-02-04 01:10:49', 1),
(3, 13, 10, '2017-02-04 01:10:55', 1),
(4, 14, 5, '2017-02-04 01:11:07', 1),
(5, 5, 0, '2017-12-03 00:29:21', 1),
(6, 14, 0, '2017-12-03 00:29:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_audit_tb`
--

CREATE TABLE IF NOT EXISTS `stock_audit_tb` (
  `id` int(12) NOT NULL,
  `prod_id` text NOT NULL,
  `count` int(12) NOT NULL,
  `added_to` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_audit_tb`
--

INSERT INTO `stock_audit_tb` (`id`, `prod_id`, `count`, `added_to`, `date_added`, `action`) VALUES
(1, 'Moringa Miracle Capsules 180s (1x12)', 288, 'Warehouse', '2022-01-07 13:42:29', 'Added'),
(2, 'ADIDAS SLIDE', 65, 'Racheal', '2022-01-08 07:15:09', 'Added'),
(3, 'NIKE 270', 90, 'Racheal', '2022-01-08 07:15:58', 'Added'),
(4, 'Moringa Oil 50ML', 6, 'Warehouse', '2022-01-10 07:33:09', 'Edit'),
(5, 'Moringa Oil 50ML', 117, 'Warehouse', '2022-01-10 07:34:07', 'Edit'),
(6, 'moringa soap', 8, 'No8 - Town Office - Lusaka', '2022-01-10 07:39:07', 'Added'),
(7, 'moringa soap', 100, 'Warehouse', '2022-01-10 08:18:08', 'Added'),
(8, 'moringa soap', 1, 'No8 - Town Office - Lusaka', '2022-01-10 09:39:23', 'Deleted'),
(9, 'ADIDAS SLIDE', 1, 'Racheal', '2022-01-10 09:39:33', 'Deleted'),
(10, 'NIKE 270', 1, 'Racheal', '2022-01-10 09:39:42', 'Deleted'),
(11, 'test', 2, 'No8 - Town Office - Lusaka', '2022-01-10 10:18:05', 'Added'),
(12, 'test', 1, 'No8 - Town Office - Lusaka', '2022-01-10 10:20:05', 'Deleted'),
(13, 'No Sale/Cancelled Invoices', 1, 'No8 - Town Office - Lusaka', '2022-01-11 07:45:40', 'Deleted'),
(14, 'Moringa Animal Feed Supplement 3kg', 1, 'Warehouse', '2022-01-11 08:42:15', 'Transfer'),
(15, 'Moringa Animal Feed Supplement 3kg', 329, 'Warehouse', '2022-01-11 08:42:42', 'Edit'),
(16, 'Moringa Animal Feed Supplement 3kg', 16, 'No8 - Town Office - Lusaka', '2022-01-11 08:43:08', 'Edited'),
(17, 'Moringa Ginger & Lemon Infusion (Singles)', 3, 'No8 - Town Office - Lusaka', '2022-01-11 08:56:17', 'Edited'),
(18, 'moringa soap', 5, 'No8 - Town Office - Lusaka', '2022-01-11 09:22:22', 'Added'),
(19, 'Moringa Miracle Capsules 180s (1x12)', 18, 'Warehouse', '2022-01-11 10:39:45', 'Transfer'),
(20, 'ZAMOR TARRAGON (100g)', 72, 'Warehouse', '2022-01-11 10:57:42', 'Transfer'),
(21, 'Moringa Miracle Capsules 90s (1x15)', 358, 'Warehouse', '2022-01-11 11:27:18', 'Edit'),
(22, 'Moringa Miracle Capsules 90s (1x15)', 24, 'Warehouse', '2022-01-11 11:27:54', 'Transfer'),
(23, 'moringa soap', 1, 'No8 - Town Office - Lusaka', '2022-01-11 11:55:17', 'Deleted'),
(24, 'Moringa Animal Supplement 6kg', 10, 'Linda', '2022-01-12 06:03:28', 'Transfer'),
(25, 'Moringa Miracle Capsules 90s (1x15)', 5, 'Linda ', '2022-01-12 06:05:11', 'Transfer'),
(26, 'Moringa Animal Supplement 6kg', 10, 'Linda', '2022-01-12 09:38:32', 'Transfer'),
(27, 'Moringa Human Powder 100g (singles)', 12, 'Warehouse', '2022-01-17 11:35:51', 'Added'),
(28, 'Moringa Human Powder 100g (singles)', 12, 'Warehouse', '2022-01-17 11:36:17', 'Transfer'),
(29, 'Moringa Miracle Capsules 180s (1x12)', 53, 'No8 - Town Office - Lusaka', '2022-01-18 13:32:08', 'Edited'),
(30, 'Moringa Miracle Capsules 90s (1x15)', 5, 'Linda', '2022-01-18 13:55:48', 'Transfer'),
(31, 'ZAMORFUNKY FENNEL (100g)', 15, 'Warehouse', '2022-01-19 09:02:52', 'Edit'),
(32, 'Moringa Miracle Capsules 180s (1x12)', 2, 'Nancy', '2022-01-19 12:13:28', 'Transfer'),
(33, 'Moringa Miracle Capsules 90s (1x15)', 2, 'Nancy', '2022-01-19 12:18:01', 'Transfer'),
(34, 'Moringa Ginger & Lemon Infusion (1x12)', 4, 'Nancy', '2022-01-19 12:18:48', 'Transfer'),
(35, 'Moringa Miracle Capsules 180s (1x12)', 3, 'Racheal', '2022-01-19 12:19:44', 'Transfer'),
(36, 'Moringa Miracle Capsules 90s (1x15)', 2, 'Racheal', '2022-01-19 12:20:39', 'Transfer'),
(37, 'Moringa Miracle Green Tea (1x12)', 2, 'Racheal', '2022-01-19 12:21:17', 'Transfer'),
(38, 'Moringa Lemon Grass Infusion (1x12)', 2, 'Racheal', '2022-01-19 12:25:47', 'Transfer'),
(39, 'Moringa Ginger & Lemon Infusion (1x12)', 3, 'Racheal', '2022-01-19 12:26:17', 'Transfer'),
(40, 'Moringa Human Powder 100g (1x10)', 3, 'Racheal', '2022-01-19 12:26:56', 'Transfer'),
(41, 'Moringa Animal Feed Supplement 3kg', 1, 'Racheal', '2022-01-19 12:27:39', 'Transfer'),
(42, 'Moringa Miracle Capsules 180s (1x12)', 3, 'Linda', '2022-01-19 12:31:16', 'Transfer'),
(43, 'Moringa Miracle Green Tea (1x12)', 3, 'Linda', '2022-01-19 12:37:32', 'Transfer'),
(44, 'Moringa Lemon Grass Infusion (1x12)', 3, 'Linda', '2022-01-19 12:38:00', 'Transfer'),
(45, 'Moringa Ginger & Lemon Infusion (1x12)', 3, 'Linda', '2022-01-19 12:38:24', 'Transfer'),
(46, 'Moringa Human Powder 100g (1x10)', 1, 'Linda', '2022-01-19 12:39:13', 'Transfer'),
(47, 'Moringa Apple & Cinnamon Infusion (1x12)', 3, 'Linda', '2022-01-19 12:39:37', 'Transfer'),
(48, 'Moringa Oil 50ML', 6, 'Nancy', '2022-01-19 12:41:45', 'Transfer'),
(49, 'Moringa Oil 100ml', 6, 'Nancy', '2022-01-19 12:42:30', 'Transfer'),
(50, 'Moringa Animal Feed Supplement 3kg', 30, 'Racheal', '2022-01-19 12:43:12', 'Transfer'),
(51, 'Moringa Animal Supplement 6kg', 5, 'Racheal', '2022-01-19 12:43:40', 'Transfer'),
(52, 'Moringa Miracle Capsules 180s (1x12)', 5, 'Racheal', '2022-01-19 12:44:09', 'Transfer'),
(53, 'Moringa Miracle Capsules 90s (1x15)', 3, 'Racheal', '2022-01-19 12:44:35', 'Transfer'),
(54, 'Moringa Human Powder 100g (1x10)', 2, 'Racheal', '2022-01-19 12:45:01', 'Transfer'),
(55, 'Moringa Miracle Capsules 180s (1x12)', 20, 'Linda', '2022-01-19 12:45:48', 'Transfer'),
(56, 'Moringa Miracle Capsules 90s (1x15)', 20, 'Linda', '2022-01-19 12:46:12', 'Transfer'),
(57, 'Moringa Miracle Green Tea (1x12)', 10, 'Linda', '2022-01-19 12:46:36', 'Transfer'),
(58, 'Moringa Lemon Grass Infusion (1x12)', 5, 'Linda', '2022-01-19 12:46:58', 'Transfer'),
(59, 'Moringa Ginger & Lemon Infusion (1x12)', 10, 'Linda', '2022-01-19 12:47:24', 'Transfer'),
(60, 'Moringa Apple & Cinnamon Infusion (1x12)', 5, 'Linda', '2022-01-19 12:47:53', 'Transfer'),
(61, 'Moringa Human Powder 100g (1x10)', 10, 'Linda', '2022-01-19 12:48:15', 'Transfer'),
(62, 'Moringa Pet Food Suppliment (1x10)', 10, 'Linda', '2022-01-19 12:48:35', 'Transfer'),
(63, 'Moringa Animal Feed Supplement 3kg', 9, 'Linda', '2022-01-19 12:48:53', 'Transfer'),
(64, 'Moringa Animal Supplement 6kg', 4, 'Linda', '2022-01-19 12:49:15', 'Transfer'),
(65, 'Moringa Oil 50ML', 42, 'Linda', '2022-01-19 12:49:56', 'Transfer'),
(66, 'Moringa Oil 100ml', 30, 'Linda', '2022-01-19 12:50:27', 'Transfer'),
(67, 'Moringa Miracle Capsules 180s (1x12)', 1, 'Linda', '2022-01-19 12:51:24', 'Transfer'),
(68, 'Moringa Miracle Capsules 90s (1x15)', 1, 'Linda', '2022-01-19 12:51:51', 'Transfer'),
(69, 'Moringa Miracle Green Tea (1x12)', 1, 'Linda', '2022-01-19 12:52:30', 'Transfer'),
(70, 'Moringa Lemon Grass Infusion (1x12)', 1, 'Linda', '2022-01-19 12:52:58', 'Transfer'),
(71, 'Moringa Ginger & Lemon Infusion (1x12)', 1, 'Linda', '2022-01-19 12:53:28', 'Transfer'),
(72, 'Moringa Apple & Cinnamon Infusion (1x12)', 1, 'Linda', '2022-01-19 12:53:47', 'Transfer'),
(73, 'Moringa Human Powder 100g (1x10)', 1, 'Linda', '2022-01-19 12:54:08', 'Transfer'),
(74, 'Moringa Pet Food Suppliment (1x10)', 1, 'Linda', '2022-01-19 12:54:40', 'Transfer'),
(75, 'Moringa Oil 50ML', 1, 'Linda', '2022-01-19 12:55:09', 'Transfer'),
(76, 'Moringa Oil 100ml', 1, 'Linda', '2022-01-19 12:55:27', 'Transfer'),
(77, 'Moringa Animal Feed 200g (Singles)', 1, 'Linda', '2022-01-19 12:56:01', 'Transfer'),
(78, 'Moringa 200G Protein Pellets (Singles)', 1, 'Linda', '2022-01-19 12:56:26', 'Transfer'),
(79, 'ZAMOR GARLIC & SPRING ONION (100g)', 1, 'Linda', '2022-01-19 12:57:31', 'Transfer'),
(80, 'ZAMOR CURRY LEAVES (50g) POUCHES', 1, 'Linda', '2022-01-19 12:58:13', 'Transfer'),
(81, 'ZAMOR DRIED CHILLIES (50g) POUCHES', 1, 'Linda', '2022-01-19 12:58:47', 'Transfer'),
(82, 'ZAMOR MIXED PARSLEY LEAVES (50g) POUCHES', 1, 'Linda', '2022-01-19 12:59:11', 'Transfer'),
(83, 'ZAMOR CELERY (100g)', 1, 'Linda', '2022-01-19 12:59:34', 'Transfer'),
(84, 'ZAMOR CHICKEN RUB 100g', 1, 'Linda', '2022-01-19 12:59:57', 'Transfer'),
(85, 'Moringa Animal Feed Supplement 3kg', 5, 'Nancy', '2022-01-19 13:01:48', 'Transfer'),
(86, 'Moringa Animal Supplement 6kg', 5, 'Nancy', '2022-01-19 13:02:15', 'Transfer'),
(87, 'Moringa Lemon Grass Infusion (1x12)', 51, 'No8 - Town Office - Lusaka', '2022-01-20 13:34:23', 'Edited'),
(88, 'ZAMOR STARTER PACK (24 PIECE)', 3, 'No8 - Town Office - Lusaka', '2022-01-20 13:35:51', 'Edited'),
(89, 'ZAMOR STARTER PACK (24 PIECE)', 0, 'No8 - Town Office - Lusaka', '2022-01-20 13:36:45', 'Edited'),
(90, 'ZAMOR PICNIC GOURMET SET', 4, 'No8 - Town Office - Lusaka', '2022-01-20 13:39:11', 'Edited'),
(91, 'Moringa Powder (Bulk per KG)', 15075, 'Head Quarters', '2022-01-20 13:52:18', 'Edited'),
(92, 'Sheep sales', 21, 'Head Quarters', '2022-01-20 14:09:38', 'Edited'),
(93, 'Sheep sales', 21, 'No8 - Town Office - Lusaka', '2022-01-20 14:25:04', 'Edited'),
(94, 'Sheep sales', 21, 'Head Quarters', '2022-01-20 14:28:24', 'Edited'),
(95, 'ZAMOR FUNKY FENNEL (100g)', 15, 'No8 - Town Office - Lusaka', '2022-01-21 07:20:31', 'Edited'),
(96, 'Sheep sales', 10, 'No8 - Town Office - Lusaka', '2022-01-21 07:29:48', 'Edited'),
(97, 'ZAMOR BASIL LEAVES BULK (KG)', 45, 'No8 - Town Office - Lusaka', '2022-01-21 09:21:18', 'Edited'),
(98, 'ZAMOR CELERY STEM (BULK)', 84, 'No8 - Town Office - Lusaka', '2022-01-21 09:22:48', 'Edited'),
(99, 'ZAMOR CHIVES (BULK)', 22, 'No8 - Town Office - Lusaka', '2022-01-21 09:23:49', 'Edited'),
(100, 'ZAMOR CORIANDER (BULK)', 8, 'Head Quarters', '2022-01-21 09:24:37', 'Edited'),
(101, 'ZAMOR DILL (BULK)', 2, 'Head Quarters', '2022-01-21 09:25:27', 'Edited'),
(102, 'ZAMOR FENNEL ROOT (BULK)', 24, 'Head Quarters', '2022-01-21 09:26:10', 'Edited'),
(103, 'ZAMOR MARJORAM', 5, 'Head Quarters', '2022-01-21 09:29:38', 'Added'),
(104, 'ZAMOR TARRAGON (BULK)', 25, 'No8 - Town Office - Lusaka', '2022-01-21 09:31:40', 'Edited'),
(105, 'ZAMOR THYME BULK (KG)', 9, 'Head Quarters', '2022-01-21 09:32:07', 'Edited'),
(106, 'ZAMOR TARRAGON (BULK)', 25, 'Head Quarters', '2022-01-21 09:32:31', 'Edited'),
(107, 'ZAMOR CHILLI POWDER (BULK)', 257, 'Head Quarters', '2022-01-21 09:33:39', 'Edited'),
(108, 'ZAMOR CHILLI FLAKES (BULK)', 48, 'Head Quarters', '2022-01-21 09:34:49', 'Added'),
(109, 'ZAMOR BLACK PEPPER CORNS (BULK)', 56, 'Head Quarters', '2022-01-21 09:35:34', 'Edited'),
(110, 'ZAMOR PINK HIMALAYAN SALT (BULK)', 87, 'Head Quarters', '2022-01-21 09:36:07', 'Edited'),
(111, 'ZAMOR TARRAGON (100g)', 72, 'No8 - Town Office - Lusaka', '2022-01-21 09:36:36', 'Edited'),
(112, 'ZAMOR STARTER PACK (12 PIECE)', 2, 'No8 - Town Office - Lusaka', '2022-01-21 09:38:01', 'Edited'),
(113, 'ZAMOR CHADAROO CHUNKY 220G', 0, 'No8 - Town Office - Lusaka', '2022-01-21 09:39:11', 'Edited'),
(114, 'ZAMOR BLACK PEPPER CORNS (100g)', 168, 'Head Quarters', '2022-01-21 09:43:48', 'Edited'),
(115, 'Moringa Miracle Green Tea (1x12)', 45, 'No8 - Town Office - Lusaka', '2022-01-26 08:38:52', 'Edited'),
(116, 'Moringa Green Tea (Single)', 13, 'No8 - Town Office - Lusaka', '2022-01-26 08:39:27', 'Edited'),
(117, 'Moringa Ginger & Lemon Infusion (1x12)', 41, 'No8 - Town Office - Lusaka', '2022-01-26 08:41:30', 'Edited'),
(118, 'Moringa Ginger & Lemon Infusion (Singles)', 12, 'No8 - Town Office - Lusaka', '2022-01-26 08:41:52', 'Edited'),
(119, 'Moringa Lemon Grass Infusion (Singles)', 20, 'No8 - Town Office - Lusaka', '2022-01-26 08:45:53', 'Edited'),
(120, 'Moringa Miracle Capsules 180s (1x12)', 40, 'No8 - Town Office - Lusaka', '2022-01-26 09:09:43', 'Edited'),
(121, 'Moringa Capsules 180s (Singles)', 13, 'No8 - Town Office - Lusaka', '2022-01-26 09:11:00', 'Edited'),
(122, '5', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(123, '9', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(124, '614', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(125, '13', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(126, '14', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(127, '15', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(128, '16', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(129, '18', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(130, '26', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(131, '28', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(132, '29', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(133, '81', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(134, '16', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(135, '19', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(136, '29', 1, 'No8 - Town Office - Lusaka', '2022-07-09 10:52:58', 'Transfer'),
(137, '130', 1, 'Linda', '2022-07-09 10:53:22', 'Transfer'),
(138, 'test transfer', 100, 'No8 - Town Office - Lusaka', '2022-07-26 13:38:51', 'Added'),
(139, 'test transfer', 100, 'No8 - Town Office - Lusaka', '2022-09-08 12:35:34', 'Edited'),
(140, 'COCA COLA 500ML', 10, 'Warehouse', '2022-09-13 09:51:30', 'Added'),
(141, 'COCA COLA 500ML', 2, 'Warehouse', '2022-09-13 09:51:46', 'Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `stock_damages_tb`
--

CREATE TABLE IF NOT EXISTS `stock_damages_tb` (
  `id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_damages` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_damages_tb`
--

INSERT INTO `stock_damages_tb` (`id`, `prod_id`, `date_added`, `no_damages`) VALUES
(1, 46, '2022-01-19 13:06:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_purchases_tb`
--

CREATE TABLE IF NOT EXISTS `stock_purchases_tb` (
  `purchase_id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `qty` text NOT NULL,
  `user_id` int(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `supplier_id` int(12) NOT NULL,
  `status` text NOT NULL,
  `sale_price` text NOT NULL,
  `cost_price` text NOT NULL,
  `invoice` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_purchases_tb`
--

INSERT INTO `stock_purchases_tb` (`purchase_id`, `prod_id`, `qty`, `user_id`, `date`, `supplier_id`, `status`, `sale_price`, `cost_price`, `invoice`) VALUES
(7, 76, '36', 14, '2022-02-02 11:58:49', 18, 'purchased', '25', '00', '0'),
(8, 64, '96', 14, '2022-06-28 11:56:47', 18, 'purchased', '56', '00', '0'),
(9, 533, '42', 14, '2022-06-28 11:56:47', 18, 'purchased', '35', '0', '0'),
(10, 41, '42', 14, '2022-06-28 11:56:47', 18, 'purchased', '35', '0', '0'),
(11, 82, '1', 8, '2022-06-28 11:56:47', 18, 'purchased', '20', '0', '0'),
(12, 259, '1', 12, '2022-11-15 12:31:08', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_user`
--

CREATE TABLE IF NOT EXISTS `stock_transfer_user` (
  `transfer_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `user_uid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `soled_qty` int(11) NOT NULL,
  `remaining_qty` int(11) NOT NULL,
  `opening` int(11) NOT NULL,
  `isopened` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_transfer_user`
--

INSERT INTO `stock_transfer_user` (`transfer_id`, `from_uid`, `user_uid`, `product_id`, `product_qty`, `soled_qty`, `remaining_qty`, `opening`, `isopened`, `date`, `time`) VALUES
(26, 12, 8, 504, 4, 1, 3, 1, 0, '2022-11-19', '14:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `stock_trasfers_tb`
--

CREATE TABLE IF NOT EXISTS `stock_trasfers_tb` (
  `id` int(12) NOT NULL,
  `prod_id` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qty` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `moved_to` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_trasfers_tb`
--

INSERT INTO `stock_trasfers_tb` (`id`, `prod_id`, `date_added`, `qty`, `user_id`, `moved_to`) VALUES
(1, 120, '2022-01-10 08:18:36', 40, 12, 4),
(2, 10, '2022-01-11 08:42:15', 1, 12, 4),
(3, 119, '2022-01-11 10:39:45', 18, 4, 4),
(4, 2, '2022-01-11 10:43:02', 16, 4, 4),
(5, 19, '2022-01-11 10:43:38', 11, 4, 4),
(6, 21, '2022-01-11 10:44:04', 1, 4, 4),
(7, 20, '2022-01-11 10:44:39', 32, 4, 4),
(8, 8, '2022-01-11 10:45:04', 13, 4, 4),
(9, 11, '2022-01-11 10:45:30', 40, 4, 4),
(10, 10, '2022-01-11 10:45:58', 29, 4, 4),
(11, 14, '2022-01-11 10:46:27', 16, 4, 4),
(12, 12, '2022-01-11 10:46:53', 2, 4, 4),
(13, 43, '2022-01-11 10:52:48', 60, 4, 4),
(14, 45, '2022-01-11 10:54:30', 96, 4, 4),
(15, 46, '2022-01-11 10:56:48', 30, 4, 4),
(16, 101, '2022-01-11 10:57:42', 72, 4, 4),
(17, 61, '2022-01-11 11:05:33', 36, 4, 4),
(18, 40, '2022-01-11 11:07:28', 60, 4, 4),
(19, 39, '2022-01-11 11:20:38', 66, 4, 4),
(20, 49, '2022-01-11 11:21:35', 60, 4, 4),
(21, 68, '2022-01-11 11:22:08', 60, 4, 4),
(22, 36, '2022-01-11 11:23:02', 90, 4, 4),
(23, 42, '2022-01-11 11:24:04', 12, 4, 4),
(24, 119, '2022-01-11 11:25:11', 32, 4, 4),
(25, 6, '2022-01-11 11:27:54', 24, 4, 4),
(26, 6, '2022-01-11 11:29:05', 16, 4, 4),
(27, 2, '2022-01-11 11:29:43', 27, 4, 4),
(28, 19, '2022-01-11 11:30:21', 19, 4, 4),
(29, 20, '2022-01-11 11:30:57', 40, 4, 4),
(30, 21, '2022-01-11 11:31:32', 11, 4, 4),
(31, 8, '2022-01-11 11:32:02', 17, 4, 4),
(32, 11, '2022-01-11 11:32:43', 2, 4, 4),
(33, 10, '2022-01-11 11:33:30', 30, 4, 4),
(34, 12, '2022-01-11 11:34:14', 12, 4, 4),
(35, 47, '2022-01-11 11:34:49', 18, 4, 4),
(36, 45, '2022-01-11 11:35:37', 150, 4, 4),
(37, 44, '2022-01-11 11:36:26', 18, 4, 4),
(38, 51, '2022-01-11 11:37:06', 24, 4, 4),
(39, 52, '2022-01-11 11:37:34', 24, 4, 4),
(40, 54, '2022-01-11 11:37:58', 24, 4, 4),
(41, 100, '2022-01-11 11:38:52', 156, 4, 4),
(42, 111, '2022-01-11 11:39:43', 1, 4, 4),
(43, 80, '2022-01-11 11:40:11', 1, 4, 4),
(44, 100, '2022-01-11 11:40:36', 1, 4, 4),
(45, 45, '2022-01-11 11:41:23', 48, 4, 4),
(46, 45, '2022-01-11 11:42:17', 72, 4, 4),
(47, 100, '2022-01-11 11:42:46', 120, 4, 4),
(48, 58, '2022-01-11 11:43:13', 73, 4, 4),
(49, 60, '2022-01-11 11:43:34', 30, 4, 4),
(50, 12, '2022-01-12 06:03:28', 10, 14, 5),
(51, 488, '2022-01-12 06:05:11', 5, 14, 59),
(52, 12, '2022-01-12 09:38:32', 10, 14, 5),
(53, 119, '2022-01-17 09:16:19', 6, 12, 4),
(54, 6, '2022-01-17 09:16:47', 1, 12, 4),
(55, 2, '2022-01-17 09:17:10', 3, 12, 4),
(56, 19, '2022-01-17 09:17:39', 5, 12, 4),
(57, 20, '2022-01-17 09:18:08', 24, 12, 4),
(58, 8, '2022-01-17 09:18:43', 2, 12, 4),
(59, 11, '2022-01-17 09:19:09', 7, 12, 4),
(60, 18, '2022-01-17 09:19:54', 10, 12, 4),
(61, 17, '2022-01-17 09:20:20', 30, 12, 4),
(62, 42, '2022-01-17 09:22:00', 18, 12, 4),
(63, 47, '2022-01-17 09:22:35', 24, 12, 4),
(64, 48, '2022-01-17 09:23:03', 18, 12, 4),
(65, 51, '2022-01-17 09:23:27', 30, 12, 4),
(66, 52, '2022-01-17 09:23:52', 18, 12, 4),
(67, 54, '2022-01-17 09:24:15', 12, 12, 4),
(68, 100, '2022-01-17 09:24:39', 90, 12, 4),
(69, 80, '2022-01-17 09:25:09', 90, 12, 4),
(70, 29, '2022-01-17 09:27:20', 72, 12, 4),
(71, 30, '2022-01-17 09:28:06', 42, 12, 4),
(72, 44, '2022-01-17 09:30:28', 18, 12, 4),
(73, 47, '2022-01-17 09:31:00', 18, 12, 4),
(74, 48, '2022-01-17 09:31:23', 36, 12, 4),
(75, 73, '2022-01-17 09:32:04', 24, 12, 4),
(76, 51, '2022-01-17 09:32:41', 48, 12, 4),
(77, 54, '2022-01-17 09:33:06', 12, 12, 4),
(78, 63, '2022-01-17 09:34:05', 18, 12, 4),
(79, 122, '2022-01-17 11:36:17', 12, 12, 4),
(80, 70, '2022-01-17 13:50:56', 60, 12, 4),
(81, 7, '2022-01-18 13:55:48', 5, 14, 5),
(82, 487, '2022-01-19 12:13:28', 2, 14, 6),
(83, 7, '2022-01-19 12:18:01', 2, 14, 6),
(84, 21, '2022-01-19 12:18:48', 4, 14, 6),
(85, 487, '2022-01-19 12:19:44', 3, 14, 7),
(86, 7, '2022-01-19 12:20:39', 2, 14, 7),
(87, 2, '2022-01-19 12:21:17', 2, 14, 7),
(88, 20, '2022-01-19 12:25:47', 2, 14, 7),
(89, 21, '2022-01-19 12:26:17', 3, 14, 7),
(90, 9, '2022-01-19 12:26:56', 3, 14, 7),
(91, 485, '2022-01-19 12:27:39', 1, 14, 7),
(92, 487, '2022-01-19 12:31:16', 3, 14, 5),
(93, 2, '2022-01-19 12:37:32', 3, 14, 5),
(94, 20, '2022-01-19 12:38:00', 3, 14, 5),
(95, 21, '2022-01-19 12:38:24', 3, 14, 5),
(96, 9, '2022-01-19 12:39:13', 1, 14, 5),
(97, 22, '2022-01-19 12:39:37', 3, 14, 5),
(98, 31, '2022-01-19 12:41:45', 6, 14, 6),
(99, 30, '2022-01-19 12:42:30', 6, 14, 6),
(100, 485, '2022-01-19 12:43:12', 30, 14, 7),
(101, 12, '2022-01-19 12:43:40', 5, 14, 7),
(102, 487, '2022-01-19 12:44:09', 5, 14, 7),
(103, 7, '2022-01-19 12:44:35', 3, 14, 7),
(104, 9, '2022-01-19 12:45:01', 2, 14, 7),
(105, 487, '2022-01-19 12:45:48', 20, 14, 5),
(106, 7, '2022-01-19 12:46:12', 20, 14, 5),
(107, 2, '2022-01-19 12:46:36', 10, 14, 5),
(108, 20, '2022-01-19 12:46:58', 5, 14, 5),
(109, 21, '2022-01-19 12:47:24', 10, 14, 5),
(110, 22, '2022-01-19 12:47:53', 5, 14, 5),
(111, 9, '2022-01-19 12:48:15', 10, 14, 5),
(112, 13, '2022-01-19 12:48:35', 10, 14, 5),
(113, 485, '2022-01-19 12:48:53', 9, 14, 5),
(114, 12, '2022-01-19 12:49:15', 4, 14, 5),
(115, 31, '2022-01-19 12:49:56', 42, 14, 5),
(116, 30, '2022-01-19 12:50:27', 30, 14, 5),
(117, 487, '2022-01-19 12:51:24', 1, 14, 5),
(118, 488, '2022-01-19 12:51:51', 1, 14, 5),
(119, 2, '2022-01-19 12:52:30', 1, 14, 5),
(120, 20, '2022-01-19 12:52:58', 1, 14, 5),
(121, 21, '2022-01-19 12:53:28', 1, 14, 5),
(122, 22, '2022-01-19 12:53:47', 1, 14, 5),
(123, 9, '2022-01-19 12:54:08', 1, 14, 5),
(124, 13, '2022-01-19 12:54:40', 1, 14, 5),
(125, 31, '2022-01-19 12:55:09', 1, 14, 5),
(126, 30, '2022-01-19 12:55:27', 1, 14, 5),
(127, 18, '2022-01-19 12:56:01', 1, 14, 5),
(128, 17, '2022-01-19 12:56:26', 1, 14, 5),
(129, 46, '2022-01-19 12:57:31', 1, 14, 5),
(130, 59, '2022-01-19 12:58:13', 1, 14, 5),
(131, 69, '2022-01-19 12:58:47', 1, 14, 5),
(132, 60, '2022-01-19 12:59:11', 1, 14, 5),
(133, 44, '2022-01-19 12:59:34', 1, 14, 5),
(134, 41, '2022-01-19 12:59:57', 1, 14, 5),
(135, 485, '2022-01-19 13:01:48', 5, 14, 6),
(136, 12, '2022-01-19 13:02:15', 5, 14, 6),
(137, 5, '2022-07-09 10:52:58', 1, 12, 4),
(138, 9, '2022-07-09 10:52:58', 1, 12, 4),
(139, 614, '2022-07-09 10:52:58', 1, 12, 4),
(140, 13, '2022-07-09 10:52:58', 1, 12, 4),
(141, 14, '2022-07-09 10:52:58', 1, 12, 4),
(142, 15, '2022-07-09 10:52:58', 1, 12, 4),
(143, 16, '2022-07-09 10:52:58', 1, 12, 4),
(144, 18, '2022-07-09 10:52:58', 1, 12, 4),
(145, 26, '2022-07-09 10:52:58', 1, 12, 4),
(146, 28, '2022-07-09 10:52:58', 1, 12, 4),
(147, 29, '2022-07-09 10:52:58', 1, 12, 4),
(148, 81, '2022-07-09 10:52:58', 1, 12, 4),
(149, 16, '2022-07-09 10:52:58', 1, 12, 4),
(150, 19, '2022-07-09 10:52:58', 1, 12, 4),
(151, 29, '2022-07-09 10:52:58', 1, 12, 4),
(152, 130, '2022-07-09 10:53:22', 1, 12, 5),
(153, 1, '2022-09-13 09:51:46', 2, 12, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stores_branch`
--

CREATE TABLE IF NOT EXISTS `stores_branch` (
  `id` int(12) NOT NULL,
  `branch_name` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores_branch`
--

INSERT INTO `stores_branch` (`id`, `branch_name`, `date_added`) VALUES
(4, 'No8 - Town Office - Lusaka', '2022-01-07 08:39:00'),
(5, 'Linda', '2022-01-07 09:59:17'),
(6, 'Nancy', '2022-01-07 09:59:13'),
(7, 'Racheal', '2022-01-07 09:59:02'),
(9, 'Head Quarters', '2022-01-11 13:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `sub_cons_tb`
--

CREATE TABLE IF NOT EXISTS `sub_cons_tb` (
  `id` int(12) NOT NULL,
  `class` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(12) NOT NULL,
  `category_id` int(12) NOT NULL,
  `origin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(300) NOT NULL,
  `supplier_contact` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_contact`) VALUES
(17, 'Other', 'B K Electronics\r\n', '00'),
(18, 'Head Quarters', 'Plot 354A \r\nNkumba Farm\r\nGreat East Road \r\nChongwe', '+260962790855'),
(19, 'TERA', 'idk', '0973646230');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments_tb`
--

CREATE TABLE IF NOT EXISTS `supplier_payments_tb` (
  `payment_id` int(12) NOT NULL,
  `supplier_id` int(12) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount_paid` text NOT NULL,
  `balance` text NOT NULL,
  `total_amount` text NOT NULL,
  `status` text NOT NULL,
  `invoice_no` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_payments_tb`
--

INSERT INTO `supplier_payments_tb` (`payment_id`, `supplier_id`, `date_added`, `amount_paid`, `balance`, `total_amount`, `status`, `invoice_no`) VALUES
(3, 11, '2019-05-22 06:57:16', '20000', '', '39842.5', '', 0),
(4, 17, '2019-05-22 06:58:29', '0', '', '6208', '', 1),
(5, 19, '2019-05-22 06:59:55', '0', '', '84732', '', 1),
(6, 18, '2019-05-22 07:00:48', '0', '', '12420', '', 35641),
(7, 20, '2019-05-22 07:02:07', '12000', '', '29481', '', 1),
(8, 24, '2019-05-22 07:09:58', '0', '', '8100', '', 1),
(9, 22, '2019-05-22 07:10:22', '0', '', '53100', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `temp_trans`
--

CREATE TABLE IF NOT EXISTS `temp_trans` (
  `temp_trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `casher_trans_id` int(11) NOT NULL,
  `price_tag` text NOT NULL,
  `discount_type` text NOT NULL,
  `amount` text NOT NULL,
  `description` text NOT NULL,
  `quote_id` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE IF NOT EXISTS `term` (
  `term_id` int(11) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `payable_for` varchar(10) NOT NULL,
  `term` varchar(11) NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `payment_start` date NOT NULL,
  `down` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_temp`
--

CREATE TABLE IF NOT EXISTS `trans_temp` (
  `id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_temp`
--

INSERT INTO `trans_temp` (`id`, `prod_id`, `user_id`) VALUES
(91, 498, 12),
(92, 498, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_type` text NOT NULL,
  `branch_id_user` int(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `status`, `branch_id`, `user_type`, `branch_id_user`) VALUES
(4, 'admin', '5195c2694c0a35fbd32c6490bcc98027', 'Moringa Admin', 'active', 1, 'Admin', 9),
(12, 'POS ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'POS Admin', 'active', 1, 'Admin', 9),
(13, 'moringa dispatc', '33b6366c46c0d661f75fe66162a799a0', 'Mary Mulenga Manda', 'active', 1, 'User', 4),
(14, 'Moringa dispatc', '4dfbf794e56dd009eaa36a2c3dfbc3c7', 'Mary Mulenga Manda', 'active', 1, 'Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_stock_to_sell_temp`
--

CREATE TABLE IF NOT EXISTS `user_stock_to_sell_temp` (
  `temp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int(12) NOT NULL,
  `name` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `date_added`) VALUES
(3, 'HQ - Headoffice - Chongwe', '2022-01-04 15:08:23'),
(4, 'No8 - Town Office - Lusaka', '2022-01-04 15:08:47'),
(5, 'Linda', '2022-01-04 15:09:07'),
(6, 'Nancy', '2022-01-04 15:09:20'),
(7, ' Racheal', '2022-01-04 15:09:44'),
(8, 'Acklas - Copperbelt', '2022-01-04 15:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `ware_house_tb`
--

CREATE TABLE IF NOT EXISTS `ware_house_tb` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_desc` varchar(500) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_sell_price` text NOT NULL,
  `prod_pic` varchar(300) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int(12) NOT NULL,
  `barcode` text NOT NULL,
  `stock_branch_id` int(12) NOT NULL,
  `belongs_to` int(12) NOT NULL,
  `warehouse_id` int(12) NOT NULL,
  `wholesale_price` text NOT NULL,
  `discount_price` text NOT NULL,
  `special_price` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ware_house_tb`
--

INSERT INTO `ware_house_tb` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_sell_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `supplier_id`, `serial`, `date_added`, `added_by`, `barcode`, `stock_branch_id`, `belongs_to`, `warehouse_id`, `wholesale_price`, `discount_price`, `special_price`) VALUES
(1, 'COCA COLA 500ML', 'COCA COLA 500ML', '1.00', '50', 'default.gif', 59, 8, 1, 17, 'Non', '2022-09-13 09:51:46', 0, '', 0, 0, 3, '1', '1', '1'),
(2, 'COCA COLA 500ML', 'COCA COLA 500ML', '1.00', '50', '', 59, 2, 1, 17, 'Non', '2022-09-13 09:51:46', 0, '', 4, 59, 4, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advance_payments_tb`
--
ALTER TABLE `advance_payments_tb`
  ADD PRIMARY KEY (`advace_id`);

--
-- Indexes for table `batches_tb`
--
ALTER TABLE `batches_tb`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `cashout_limits_tb`
--
ALTER TABLE `cashout_limits_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `credit_note`
--
ALTER TABLE `credit_note`
  ADD PRIMARY KEY (`credit_id`);

--
-- Indexes for table `credit_outgoing_stock`
--
ALTER TABLE `credit_outgoing_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_payments`
--
ALTER TABLE `credit_payments`
  ADD PRIMARY KEY (`credit_id`);

--
-- Indexes for table `credit_temp`
--
ALTER TABLE `credit_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damages_log_tb`
--
ALTER TABLE `damages_log_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_tb`
--
ALTER TABLE `delivery_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_tb`
--
ALTER TABLE `discount_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `draft_sales_tb`
--
ALTER TABLE `draft_sales_tb`
  ADD PRIMARY KEY (`sales_details_id`);

--
-- Indexes for table `draft_temp_trans`
--
ALTER TABLE `draft_temp_trans`
  ADD PRIMARY KEY (`temp_trans_id`);

--
-- Indexes for table `exchange_rates_tb`
--
ALTER TABLE `exchange_rates_tb`
  ADD PRIMARY KEY (`exchange_id`);

--
-- Indexes for table `expenses_tb`
--
ALTER TABLE `expenses_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types_tb`
--
ALTER TABLE `expense_types_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_log`
--
ALTER TABLE `history_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `inventory_tb`
--
ALTER TABLE `inventory_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices_tb`
--
ALTER TABLE `invoices_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_damages_tb`
--
ALTER TABLE `inv_damages_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_returns_tb`
--
ALTER TABLE `item_returns_tb`
  ADD PRIMARY KEY (`tb_id`);

--
-- Indexes for table `licience_reg_tb`
--
ALTER TABLE `licience_reg_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modes_of_payment_tb`
--
ALTER TABLE `modes_of_payment_tb`
  ADD PRIMARY KEY (`payment_mode_id`);

--
-- Indexes for table `notifications_settings_tb`
--
ALTER TABLE `notifications_settings_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_close_cashout_tb`
--
ALTER TABLE `open_close_cashout_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_close_tb`
--
ALTER TABLE `open_close_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `part_payments_tb`
--
ALTER TABLE `part_payments_tb`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_account`
--
ALTER TABLE `payment_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `product_`
--
ALTER TABLE `product_`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `purchase_request`
--
ALTER TABLE `purchase_request`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `quotation_tb`
--
ALTER TABLE `quotation_tb`
  ADD PRIMARY KEY (`quote_id`);

--
-- Indexes for table `rawdata_tb`
--
ALTER TABLE `rawdata_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rawdata_updates_tb`
--
ALTER TABLE `rawdata_updates_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`sales_details_id`);

--
-- Indexes for table `sales_tb`
--
ALTER TABLE `sales_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_stock_to_user_temp`
--
ALTER TABLE `send_stock_to_user_temp`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `shop_category_tb`
--
ALTER TABLE `shop_category_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`stockin_id`);

--
-- Indexes for table `stock_audit_tb`
--
ALTER TABLE `stock_audit_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_damages_tb`
--
ALTER TABLE `stock_damages_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_purchases_tb`
--
ALTER TABLE `stock_purchases_tb`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `stock_transfer_user`
--
ALTER TABLE `stock_transfer_user`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `stock_trasfers_tb`
--
ALTER TABLE `stock_trasfers_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores_branch`
--
ALTER TABLE `stores_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_cons_tb`
--
ALTER TABLE `sub_cons_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supplier_payments_tb`
--
ALTER TABLE `supplier_payments_tb`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `temp_trans`
--
ALTER TABLE `temp_trans`
  ADD PRIMARY KEY (`temp_trans_id`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `trans_temp`
--
ALTER TABLE `trans_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_stock_to_sell_temp`
--
ALTER TABLE `user_stock_to_sell_temp`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ware_house_tb`
--
ALTER TABLE `ware_house_tb`
  ADD PRIMARY KEY (`prod_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advance_payments_tb`
--
ALTER TABLE `advance_payments_tb`
  MODIFY `advace_id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `batches_tb`
--
ALTER TABLE `batches_tb`
  MODIFY `batch_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cashout_limits_tb`
--
ALTER TABLE `cashout_limits_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `credit_note`
--
ALTER TABLE `credit_note`
  MODIFY `credit_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `credit_outgoing_stock`
--
ALTER TABLE `credit_outgoing_stock`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `credit_payments`
--
ALTER TABLE `credit_payments`
  MODIFY `credit_id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `credit_temp`
--
ALTER TABLE `credit_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `damages_log_tb`
--
ALTER TABLE `damages_log_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `delivery_tb`
--
ALTER TABLE `delivery_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discount_tb`
--
ALTER TABLE `discount_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `draft_sales_tb`
--
ALTER TABLE `draft_sales_tb`
  MODIFY `sales_details_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `draft_temp_trans`
--
ALTER TABLE `draft_temp_trans`
  MODIFY `temp_trans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=305;
--
-- AUTO_INCREMENT for table `exchange_rates_tb`
--
ALTER TABLE `exchange_rates_tb`
  MODIFY `exchange_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `expenses_tb`
--
ALTER TABLE `expenses_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `expense_types_tb`
--
ALTER TABLE `expense_types_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `history_log`
--
ALTER TABLE `history_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1491;
--
-- AUTO_INCREMENT for table `inventory_tb`
--
ALTER TABLE `inventory_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoices_tb`
--
ALTER TABLE `invoices_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5248;
--
-- AUTO_INCREMENT for table `inv_damages_tb`
--
ALTER TABLE `inv_damages_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_returns_tb`
--
ALTER TABLE `item_returns_tb`
  MODIFY `tb_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `licience_reg_tb`
--
ALTER TABLE `licience_reg_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modes_of_payment_tb`
--
ALTER TABLE `modes_of_payment_tb`
  MODIFY `payment_mode_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `notifications_settings_tb`
--
ALTER TABLE `notifications_settings_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `open_close_cashout_tb`
--
ALTER TABLE `open_close_cashout_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `open_close_tb`
--
ALTER TABLE `open_close_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=177;
--
-- AUTO_INCREMENT for table `part_payments_tb`
--
ALTER TABLE `part_payments_tb`
  MODIFY `payment_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=368;
--
-- AUTO_INCREMENT for table `payment_account`
--
ALTER TABLE `payment_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=616;
--
-- AUTO_INCREMENT for table `product_`
--
ALTER TABLE `product_`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=491;
--
-- AUTO_INCREMENT for table `purchase_request`
--
ALTER TABLE `purchase_request`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotation_tb`
--
ALTER TABLE `quotation_tb`
  MODIFY `quote_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `rawdata_tb`
--
ALTER TABLE `rawdata_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rawdata_updates_tb`
--
ALTER TABLE `rawdata_updates_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=274;
--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `sales_details_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=348;
--
-- AUTO_INCREMENT for table `sales_tb`
--
ALTER TABLE `sales_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `send_stock_to_user_temp`
--
ALTER TABLE `send_stock_to_user_temp`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_category_tb`
--
ALTER TABLE `shop_category_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `stockin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `stock_audit_tb`
--
ALTER TABLE `stock_audit_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT for table `stock_damages_tb`
--
ALTER TABLE `stock_damages_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stock_purchases_tb`
--
ALTER TABLE `stock_purchases_tb`
  MODIFY `purchase_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `stock_transfer_user`
--
ALTER TABLE `stock_transfer_user`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `stock_trasfers_tb`
--
ALTER TABLE `stock_trasfers_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `stores_branch`
--
ALTER TABLE `stores_branch`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sub_cons_tb`
--
ALTER TABLE `sub_cons_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `supplier_payments_tb`
--
ALTER TABLE `supplier_payments_tb`
  MODIFY `payment_id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `temp_trans`
--
ALTER TABLE `temp_trans`
  MODIFY `temp_trans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `term`
--
ALTER TABLE `term`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trans_temp`
--
ALTER TABLE `trans_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_stock_to_sell_temp`
--
ALTER TABLE `user_stock_to_sell_temp`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ware_house_tb`
--
ALTER TABLE `ware_house_tb`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
