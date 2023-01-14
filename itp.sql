-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2019 at 07:09 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_log`
--

CREATE TABLE `accounts_log` (
  `log_id` int(12) NOT NULL,
  `log_icon` varchar(255) NOT NULL,
  `log_details` varchar(255) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_log`
--

INSERT INTO `accounts_log` (`log_id`, `log_icon`, `log_details`, `log_time`) VALUES
(1, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 1 confirmed on booking transaction', '2019-05-12 14:08:34'),
(2, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 2 confirmed on booking transaction', '2019-05-12 14:17:37'),
(3, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 3 confirmed on booking transaction', '2019-05-12 14:17:53'),
(4, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 6 confirmed on booking transaction', '2019-05-12 14:21:04'),
(5, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 7 confirmed on booking transaction', '2019-05-12 14:21:05'),
(6, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 8 confirmed on booking transaction', '2019-05-12 14:23:20'),
(7, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 9 confirmed on booking transaction', '2019-05-12 14:23:21'),
(8, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 10 confirmed on booking transaction', '2019-05-12 14:45:30'),
(9, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 11 confirmed on booking transaction', '2019-05-12 14:45:31'),
(10, 'briefcase w3-text-blue', 'New record, Domain transaction added on to expenses', '2019-05-12 15:20:13'),
(11, 'briefcase w3-text-blue', 'New record, Domain transaction added on to expenses', '2019-05-12 15:12:41'),
(12, 'briefcase w3-text-blue', 'New record, Domain transaction added on to expenses', '2019-05-12 15:13:23'),
(13, 'briefcase w3-text-blue', 'New record, Domain transaction added on to expenses', '2019-05-12 15:13:49'),
(14, 'briefcase w3-text-blue', 'New record, Domain transaction added on to expenses', '2019-05-12 15:14:05'),
(15, 'user-minus w3-text-red', 'New record, transaction 57 added to bad debt', '2019-05-12 15:19:04'),
(16, 'user-minus w3-text-red', 'New record, transaction 58 added to bad debt', '2019-05-12 15:19:01'),
(17, 'map-marked-alt w3-text-yellow', 'Updated record, transaction 48 confirmed on booking transaction', '2019-05-12 15:17:28'),
(18, 'user-minus w3-text-red', 'New record, transaction 59 added to bad debt', '2019-05-12 15:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `a_username` varchar(255) NOT NULL,
  `a_pasword` varchar(255) NOT NULL,
  `a_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `a_username`, `a_pasword`, `a_category`) VALUES
(1, 'oshadee', '123', 'accounts'),
(2, 'kalani', '123', 'hrs');

-- --------------------------------------------------------

--
-- Table structure for table `bad_debts`
--

CREATE TABLE `bad_debts` (
  `Transaction_Id` int(12) NOT NULL,
  `Business_name` varchar(255) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bad_debts`
--

INSERT INTO `bad_debts` (`Transaction_Id`, `Business_name`, `Department`, `Amount`, `Date`) VALUES
(57, 'Asoka Tours', 'Vehicle', 18000, '2019-04-12'),
(58, 'Sri Lanka Expeditions', 'Adventure', 2000, '2019-04-12'),
(59, 'Hanthana Travel Club', 'Guide', 5000, '2019-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `booking_payment`
--

CREATE TABLE `booking_payment` (
  `Transaction_Id` int(11) NOT NULL,
  `Business_name` varchar(255) NOT NULL,
  `Department` enum('Vehicle','Adventure','Guide','Spa','Hotel','Packages','Travel','Restaurant','Driver') NOT NULL,
  `Amount` double NOT NULL,
  `Date` date NOT NULL,
  `Status` enum('unconfirmed','confirmed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_payment`
--

INSERT INTO `booking_payment` (`Transaction_Id`, `Business_name`, `Department`, `Amount`, `Date`, `Status`) VALUES
(1, 'Asoka Tours', 'Vehicle', 13500, '2019-05-12', 'confirmed'),
(2, 'Sri Lanka Expeditions', 'Adventure', 100000, '2019-05-12', 'confirmed'),
(3, 'Hanthana Travel Club', 'Guide', 112600, '2019-05-12', 'confirmed'),
(6, 'Honey Spa', 'Spa', 186000, '2019-05-12', 'confirmed'),
(7, 'Hilton', 'Hotel', 179200, '2019-05-12', 'confirmed'),
(8, 'Platinum', 'Packages', 18000, '2019-05-12', 'confirmed'),
(9, 'Olanka Travels', 'Travel', 15700, '2019-05-12', 'confirmed'),
(10, 'The Lagoon', 'Restaurant', 18900, '2019-05-12', 'confirmed'),
(11, 'Kangroo Cabs', 'Driver', 12000, '2019-05-12', 'confirmed'),
(12, 'Asoka Tours', 'Vehicle', 30000, '2019-04-12', 'confirmed'),
(13, 'Sri Lanka Expeditions', 'Adventure', 10000, '2019-04-12', 'confirmed'),
(14, 'Hanthana Travel Club', 'Guide', 15000, '2019-04-12', 'confirmed'),
(15, 'Honey Spa', 'Spa', 70000, '2019-04-12', 'confirmed'),
(16, 'Hilton', 'Hotel', 100000, '2019-04-12', 'confirmed'),
(17, 'Platinum', 'Packages', 12000, '2019-04-12', 'confirmed'),
(18, 'Olanka Travels', 'Travel', 19500, '2019-04-12', 'confirmed'),
(19, 'The Lagoon', 'Restaurant', 8600, '2019-04-12', 'confirmed'),
(20, 'Kangroo Cabs', 'Driver', 13300, '2019-04-12', 'confirmed'),
(21, 'Asoka Tours', 'Vehicle', 16000, '2019-03-12', 'confirmed'),
(22, 'Sri Lanka Expeditions', 'Adventure', 110000, '2019-03-12', 'confirmed'),
(23, 'Hanthana Travel Club', 'Guide', 25600, '2019-03-12', 'confirmed'),
(24, 'Honey Spa', 'Spa', 250000, '2019-03-12', 'confirmed'),
(25, 'Hilton', 'Hotel', 180000, '2019-03-12', 'confirmed'),
(26, 'Platinum', 'Packages', 82400, '2019-03-12', 'confirmed'),
(27, 'Olanka Travels', 'Travel', 64700, '2019-03-12', 'confirmed'),
(28, 'The Lagoon', 'Restaurant', 48000, '2019-03-12', 'confirmed'),
(29, 'Kangroo Cabs', 'Driver', 60750, '2019-03-12', 'confirmed'),
(30, 'Asoka Tours', 'Vehicle', 16000, '2019-02-12', 'confirmed'),
(31, 'Sri Lanka Expeditions', 'Adventure', 40000, '2019-02-12', 'confirmed'),
(32, 'Hanthana Travel Club', 'Guide', 25600, '2019-02-12', 'confirmed'),
(33, 'Honey Spa', 'Spa', 250000, '2019-02-12', 'confirmed'),
(34, 'Hilton', 'Hotel', 150000, '2019-02-12', 'confirmed'),
(35, 'Platinum', 'Packages', 82400, '2019-02-12', 'confirmed'),
(36, 'Olanka Travels', 'Travel', 64700, '2019-02-12', 'confirmed'),
(37, 'The Lagoon', 'Restaurant', 48000, '2019-02-12', 'confirmed'),
(38, 'Kangroo Cabs', 'Driver', 60700, '2019-02-12', 'confirmed'),
(39, 'Asoka Tours', 'Vehicle', 16000, '2019-01-12', 'confirmed'),
(40, 'Sri Lanka Expeditions', 'Adventure', 40000, '2019-01-12', 'confirmed'),
(41, 'Hanthana Travel Club', 'Guide', 25600, '2019-01-12', 'confirmed'),
(42, 'Honey Spa', 'Spa', 150000, '2019-01-12', 'confirmed'),
(43, 'Hilton', 'Hotel', 100000, '2019-01-12', 'confirmed'),
(44, 'Platinum', 'Packages', 82400, '2019-01-12', 'confirmed'),
(45, 'Olanka Travels', 'Travel', 64700, '2019-01-12', 'confirmed'),
(46, 'The Lagoon', 'Restaurant', 48000, '2019-01-12', 'confirmed'),
(47, 'Kangroo Cabs', 'Driver', 60700, '2019-01-12', 'confirmed'),
(48, 'Asoka Tours', 'Vehicle', 16000, '2019-05-12', 'confirmed'),
(49, 'Sri Lanka Expeditions', 'Adventure', 8000, '2019-05-12', 'unconfirmed'),
(50, 'Hanthana Travel Club', 'Guide', 4600, '2019-05-12', 'unconfirmed'),
(51, 'Honey Spa', 'Spa', 11000, '2019-05-12', 'unconfirmed'),
(52, 'Hilton', 'Hotel', 21300, '2019-05-12', 'unconfirmed'),
(53, 'Platinum', 'Packages', 8400, '2019-05-12', 'unconfirmed'),
(54, 'Olanka Travels', 'Travel', 4800, '2019-05-12', 'unconfirmed'),
(55, 'The Lagoon', 'Restaurant', 9200, '2019-05-12', 'unconfirmed'),
(56, 'Kangroo Cabs', 'Driver', 1490, '2019-05-12', 'unconfirmed');

-- --------------------------------------------------------

--
-- Table structure for table `business_payment`
--

CREATE TABLE `business_payment` (
  `Transaction_Id` int(11) NOT NULL,
  `Type` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_payment`
--

INSERT INTO `business_payment` (`Transaction_Id`, `Type`, `Date`, `Amount`) VALUES
(1, 'Domain', '2019-05-12', 8000),
(2, 'Domain', '2019-04-12', 7500),
(3, 'Domain', '2019-03-12', 6000),
(4, 'Domain', '2019-02-12', 5300),
(5, 'Domain', '2019-01-12', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `file_path`
--

CREATE TABLE `file_path` (
  `id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL,
  `path` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_path`
--

INSERT INTO `file_path` (`id`, `type`, `path`) VALUES
(1, 'Accounts Report', 'C:/Users/Redhw/Desktop/eco_travels/src/Account/Reports/'),
(2, 'Accounts Folder', 'C:/Users/Redhw/Desktop/reports/'),
(3, 'Hrs Report', 'C:/Users/Redhw/Desktop/eco_travels/src/Hrs/Reports/'),
(4, 'Hrs Folder', 'C:/Users/Redhw/Desktop/eco_travels/WebContent/reports/hrs/');

-- --------------------------------------------------------

--
-- Table structure for table `hotel10`
--

CREATE TABLE `hotel10` (
  `part` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `hotel_id` varchar(45) NOT NULL,
  `imagelocation` varchar(45) DEFAULT NULL,
  `facilities` text,
  `activities` text,
  `food` text,
  `re_services` text,
  `cleaning_services` text,
  `pool` text,
  `rooms` text,
  `address` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel10`
--

INSERT INTO `hotel10` (`part`, `name`, `hotel_id`, `imagelocation`, `facilities`, `activities`, `food`, `re_services`, `cleaning_services`, `pool`, `rooms`, `address`, `UserName`, `password`, `reg_date`) VALUES
('Hotel', 'Samudra', '01', '01.png', '*Swimming Pools\r\n*Free Wifi\r\n*Beachfont', '*Beach\r\n*Fishing', '*Chocolate or Cookies-Rs up to 200\r\n*Fruits-With several prices', '*Lockers\r\n*Couerage Services', '*Daily maid services\r\n*Trouser Press', '*Swimming Pool\r\n*Kids Pool', '*Deluxe Room = Rs 3000-5000\r\n*Superior Room=Rs 2000-3000', 'Aluthgama', 'kalani00', 'kalani00', '2019-02-18 06:33:57'),
('Restaurant', 'Saman', '10', '10.png', '*Beachfont\r\n*Family Rooms', '*Beach\r\n*Table tennis\r\n*Billiords', '*Chocolate or Cookies-Rs up to 200\r\n*Fruits-With several prices', '*24 Hour Front Desk', '*Daily maid services', '*Swimming Pool', '* Standard Double Room=RS 1500-2000', 'Galle', 'Sunil', 'sunil00', '2019-05-20 06:33:57'),
('Restaurant', 'Olu', '11', '11.png', '*Swimming Pools', '*Beach', '*Breakfast in room', '*24 Hour Front Desk', '*Daily maid services', '*Swimming Pool', '* Standard Double Room=RS 1500-2000', 'Galle', 'Nimesh', 'nimesh00', '2019-03-12 06:33:57'),
('Hotel', 'Panarama', '12', 'hotel/12.png', '*Beachfont\r\n*Family Rooms', '*Windsurfing\r\n*Table tennis', '*Chocolate or Cookies-Rs up to 200\r\n*Fruits-With several prices', '*Lockers\r\n*Couerage Services', '*Daily maid services\r\n*Trouser Press', '*Swimming Pool\r\n*Kids Pool', '*Deluxe Room = Rs 3000-5000\r\n*Superior Room=Rs 2000-3000', 'Galle', 'Bimal', 'bimal00', '2019-05-08 06:33:57'),
('Hotel', 'Protea', '22', 'hotel/22.png', '*Swimming Pools\r\n*Free Wifi', '*Beach\r\n*Library', '*Kid meals - Rs 500-1000\r\n*Snack bar\r\n*Breakfast in room', '*Luggage Services\r\n*Currency Exchanges', '*Daily maid services\r\n*Trouser Press', '*Kids Pool\r\n*Personal Trainer', '* Standard Double Room=RS 1500-2000\r\n', 'Ambalangoda', 'Kamal', 'kamal00', '2019-03-13 06:33:57'),
('Restaurant', 'Sadun', '567', 'hotel/567.png', '*Swimming Pools\r\n*Free Wifi\r\n*Beachfont\r\n*Family Rooms', '*Library\r\n*Windsurfing\r\n*Table tennis', '*Chocolate or Cookies-Rs up to 200\r\n*Fruits-With several prices\r\n*Bottle of water-Rs 50-100', '*Lockers\r\n*Couerage Services\r\n*Luggage Services', '*Daily maid services\r\n*Trouser Press', '*Swimming Pool\r\n*Kids Pool', '*Deluxe Room = Rs 3000-5000\r\n*Superior Room=Rs 2000-3000', 'galle', 'sadun00', 'sadun00', '2019-04-11 06:33:57'),
('Hotel', 'Araliya', '67', 'hotel/67.png', '*Swimming Pools\r\n*Free Wifi\r\n*Beachfont', '*Beach\r\n*Library\r\n*Windsurfing', '*Chocolate or Cookies-Rs up to 200\r\n*Fruits-With several prices\r\n*Bottle of water-Rs 50-100', '*Lockers\r\n*Couerage Services\r\n*Luggage Services', '*Daily maid services\r\n*Trouser Press\r\n*Dry Cleaning', '*Swimming Pool\r\n*Kids Pool\r\n*Personal Trainer', '*Deluxe Room = Rs 3000-5000\r\n*Superior Room=Rs 2000-3000', 'Kalutara', 'chinthaka', 'chinthaka00', '2019-05-20 06:33:57'),
('Hotel', 'Shanaz', '78', 'hotel/78.png', '*Swimming Pools\r\n*Free Wifi\r\n*Beachfont', '*Windsurfing\r\n*Table tennis\r\n*Billiords\r\n*Fishing', '*Wine shampane-Rs up to 1000\r\n*Kid meals - Rs 500-1000\r\n*Snack bar', '*Lockers\r\n*Couerage Services\r\n*Luggage Services', '*Daily maid services\r\n*Trouser Press\r\n*Dry Cleaning', '*Swimming Pool\r\n*Kids Pool\r\n*Personal Trainer', '*Superior Room=Rs 2000-3000\r\n* Standard Double Room=RS 1500-2000', 'Deniyaya', 'Pansilu', 'pansilu88', '2019-05-20 06:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Fname` varchar(40) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `NIC` varchar(45) NOT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Fname`, `Lname`, `Address`, `NIC`, `Gender`, `DOB`, `Email`, `PhoneNo`, `UserName`, `Password`, `reg_date`) VALUES
('Nimesh', 'Perera', 'Deniyaya', '553478976v', 'Male', '1955-4-5', 'nimesh@gmail.com', 716745678, 'Nimesh', 'nimesh00', '2019-05-20 06:33:22'),
('Sunil', 'Perera', 'Galle', '627898765v', 'Male', '1962-8-11', 'sunil45@gmail.com', 752345678, 'Sunil', 'sunil00', '2019-05-20 06:33:22'),
('Nimal', 'Silva', 'No,17 wawita Middeniya', '665787654v', 'Male', '1966-02-17', 'nimal12@gmail.com', 766784567, 'Nimal', 'nimal66', '2019-05-20 06:33:22'),
('Sunitha', 'Perera', 'No 12 Aluwihara para Baddegama', '674567898v', 'Female', '1967-7-8', 'sunitha23@gmail.com', 783456789, 'sunitha', 'sunitha00', '2019-05-20 06:33:22'),
('Sasitha', 'Randeniya', 'No 78 biyagama rd Ambalanthota', '742345678v', 'Male', '1974-4-7', 'sasitha23@gmail.com', 782345678, 'Sasitha', 'sasitha123', '2019-05-20 06:33:22'),
('Randhika', 'Silva', 'Middeniya', '743456787v', 'Male', '1974-03-5', 'randhika@gmail.com', 764567890, 'Admin', 'Randhika', '2019-05-20 06:33:22'),
('Chamudhitha', 'Mihiranga', 'No,78 rathgama road, Mirissa', '765673212v', 'Male', NULL, 'chamuditha78@gmail.com', 715678765, 'Chamudhitha', 'chamudhitha00', '2019-05-20 06:33:22'),
('Chinthaka', 'Prasad', 'Kalutara', '765678765v', 'Male', '1976-07-3', 'chinthaka@mail.com', 765678765, 'chinthaka', 'chinthaka00', '2019-05-20 06:33:22'),
('Pansilu', 'Parinda', 'Deniyaya', '873456786v', 'Male', '1987-03-12', 'pansilu1234@gmail.com', 784567345, 'Pansilu', 'pansilu88', '2019-05-20 06:33:22'),
('Bimal', 'Fernando', 'no 56 galle road Mirissa', '882345678v', 'Female', '1988-05-5', 'Fernando@gmail.com', 764567876, 'Bimal', 'bimal00', '2019-05-20 06:33:22'),
('Kamal', 'Silva', 'No,73 Aththidiya rd Ambalangoda', '884567898v', 'Male', '1988-2-6', 'kamal67@gmail.com', 754567898, 'Kamal', 'kamal00', '2019-05-20 06:33:22'),
('Oshadee', 'Amarasinghe', 'Rajagiriya', '952345786v', 'Female', '1995-03-6', 'osh@gmail.com', 763456789, 'oshadee', 'oshadee123', '2019-05-20 06:33:22'),
('Dilki', 'Perera', 'No 67 waskaduwa Panadura', '953456789v', 'Female', '1995-9-3', 'dilki@gmail.com', 715678987, 'dilki', 'dilki123', '2019-05-20 06:33:22'),
('Kalani', 'Lakshani', 'No,89 Bandaragama Rd,Waskaduwa,Kalutara', '965820884v', 'Female', '1996-03-22', 'kalanilakshani64@gmail.com', 784693098, 'kalani00', 'kalani00', '2019-05-20 06:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `spa`
--

CREATE TABLE `spa` (
  `part` varchar(255) NOT NULL DEFAULT 'Spa',
  `name` varchar(45) DEFAULT NULL,
  `id` varchar(45) NOT NULL,
  `imagelocation` varchar(45) DEFAULT NULL,
  `facials` text,
  `waxing` text,
  `body` text,
  `massage` text,
  `tinting` text,
  `address` varchar(100) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spa`
--

INSERT INTO `spa` (`part`, `name`, `id`, `imagelocation`, `facials`, `waxing`, `body`, `massage`, `tinting`, `address`, `UserName`, `password`, `reg_date`) VALUES
('Spa', 'Olu', '30', 'hotel/30.png', '*Express Facial ---> $45 \r\n*Signature Facial ---> $65 ', '*Sideburn --->$65Wax\r\n*Full Face Wax--->$80', '*Body Polish\r\n*Aroma,salt Treatment/Vichy Rain', '*Swedish Massage\r\n*Deep Tissue Massage', '*Lash Tint', 'Galle', 'Sasitha', 'sasitha123', '2019-05-20 06:32:41'),
('Spa', 'Sheron', '45', 'hotel/45.png', '*Express Facial ---> $45 \r\n*Signature Facial ---> $65 \r\n*Radiance Facial ---> $90', '*Lip Wax--->$60\r\n*Chin Wax---$70\r\n*Sideburn --->$65Wax', '*Body Polish\r\n*Aroma,salt Treatment/Vichy Rain\r\n*Seaweed or Mud Body Wrap', '*Tension Relief Massage\r\n*Swedish Massage\r\n*Deep Tissue Massage', '*Lash Tint\r\n*Brow Tint', 'Kalutara', 'Nimal', 'nimal66', '2019-05-20 06:32:41'),
('Spa', 'Nelum', '500', '90.png', '*Express Facial ---> $45 \r\n*Signature Facial ---> $65 \r\n*Radiance Facial ---> $90', '*Lip Wax--->$60\r\n*Chin Wax---$70\r\n*Sideburn --->$65Wax\r\n*Sideburn --->$65Wax', '*Body Polish\r\n*Aroma,salt Treatment/Vichy Rain', '*Tension Relief Massage\r\n*Swedish Massage\r\n*Deep Tissue Massage\r\n*Deep Tissue Massage\r\n*Deep Tissue \r\n*Deep Tissue Massage\r\n*Deep Tissue Massage', '*Lash Tint', 'Baddegama', 'dilki', 'dilki123', '2019-05-20 06:32:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_log`
--
ALTER TABLE `accounts_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `bad_debts`
--
ALTER TABLE `bad_debts`
  ADD PRIMARY KEY (`Transaction_Id`);

--
-- Indexes for table `booking_payment`
--
ALTER TABLE `booking_payment`
  ADD PRIMARY KEY (`Transaction_Id`);

--
-- Indexes for table `business_payment`
--
ALTER TABLE `business_payment`
  ADD PRIMARY KEY (`Transaction_Id`);

--
-- Indexes for table `file_path`
--
ALTER TABLE `file_path`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel10`
--
ALTER TABLE `hotel10`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`NIC`);

--
-- Indexes for table `spa`
--
ALTER TABLE `spa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_log`
--
ALTER TABLE `accounts_log`
  MODIFY `log_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_payment`
--
ALTER TABLE `booking_payment`
  MODIFY `Transaction_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `business_payment`
--
ALTER TABLE `business_payment`
  MODIFY `Transaction_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `file_path`
--
ALTER TABLE `file_path`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
