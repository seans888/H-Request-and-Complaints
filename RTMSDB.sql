-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2017 at 03:37 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rtmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `escalation_time` time NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `escalation_time`, `department_id`) VALUES
(1, 'Pillows', 'Extra or pillow replacement', '00:08:00', 1),
(2, 'Fix Aircon', 'Fix airconditioning', '00:20:00', 2),
(3, 'Room Service', 'Delivers food and drinks ordered by guests', '00:15:00', 3),
(4, 'Water Temperature', 'Adjust water temperature to warm', '00:10:00', 2),
(5, 'Package Pick Up', 'Guests has package for pick up in lobby', '00:05:00', 4),
(6, 'Extra Bed', 'Guests has requested extra bed', '00:07:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `check_in`
--

CREATE TABLE `check_in` (
  `id` int(11) NOT NULL,
  `check_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `guest_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `check_in`
--

INSERT INTO `check_in` (`id`, `check_in`, `check_out`, `guest_id`, `room_id`, `status`) VALUES
(1, '2017-10-26 10:21:00', '2017-10-26 02:21:00', 1, 1, 'Inactive'),
(2, '2017-10-26 10:21:33', '2017-10-26 02:21:33', 2, 2, 'Active'),
(3, '2017-10-26 10:23:03', '2017-10-26 02:23:03', 4, 4, 'Inactive'),
(4, '2017-10-26 10:23:21', '2017-10-26 02:31:49', 3, 3, 'Inactive'),
(5, '2017-10-26 10:24:01', '2017-10-26 02:24:01', 5, 5, 'Active'),
(6, '2017-10-26 10:24:49', '2017-10-26 02:24:49', 6, 6, 'Active'),
(7, '2017-10-26 10:25:36', '2017-10-26 02:25:36', 7, 7, 'Active'),
(8, '2017-10-26 10:26:11', '2017-10-26 02:26:11', 8, 8, 'Active'),
(9, '2017-10-26 10:26:34', '2017-10-26 02:26:34', 9, 9, 'Active'),
(10, '2017-10-26 10:28:22', '2017-10-26 02:28:22', 10, 1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`) VALUES
(1, 'Housekeeping', 'Cleans rooms for guests'),
(2, 'Engineering', 'Fixing appliances including air conditioning, lighting, and plumbing'),
(3, 'Food and Beverages', 'Delivers food and drinks to the guests.'),
(4, 'Front Desk', 'Deals with guests\r\n'),
(5, 'Guest Services', 'Accepts guest\'s calls.');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `level` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `firstName`, `lastName`, `level`, `department_id`) VALUES
(1, 'Patricia', 'Pangilinan', 2, 1),
(3, 'Shaun', 'Ibañez', 3, 2),
(4, 'Zian', 'Vertudes', 3, 3),
(5, 'Krisper', 'Bariuan', 3, 4),
(6, 'Buena', 'Talosig', 3, 1),
(7, 'Wesley', 'Silvestre', 1, 2),
(8, 'Hazel', 'Grace', 1, 1),
(9, 'Shella ', 'Guttierez', 2, 3),
(10, 'Jeline', 'Reyes', 1, 3),
(11, 'Norrie', 'Lustre', 2, 4),
(12, 'Gab', 'Nangseen', 2, 2),
(13, 'Jessica', 'Marcia', 1, 4),
(14, 'Xander', 'Ford', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `firstName`, `lastName`) VALUES
(1, 'Selena', 'Gomez'),
(2, 'Georgia', 'Hadid'),
(3, 'Justin', 'Folley'),
(4, 'Hannah ', 'Baker'),
(5, 'Will', 'Byers'),
(6, 'Winnona ', 'Rider'),
(7, 'Lili', 'Reinhart'),
(8, 'Camila', 'Mendez'),
(9, 'Robert', 'Downey'),
(10, 'Paul', 'Walker');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `roomno`) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `check_in_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `employee_responsible_id` int(11) NOT NULL,
  `employee_create_id` int(11) NOT NULL,
  `level` int(11) DEFAULT '1',
  `description` text NOT NULL,
  `time_open` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_close` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `check_in_id`, `category_id`, `employee_responsible_id`, `employee_create_id`, `level`, `description`, `time_open`, `time_close`, `status`) VALUES
(4, 5, 1, 13, 14, 1, 'Two (2) extra pillows.', '2017-10-29 23:26:49', '2017-10-29 23:26:49', 'Open'),
(5, 10, 6, 7, 14, 1, '1 extra bed', '2017-10-30 12:33:37', '2017-10-30 12:33:37', 'Open'),
(6, 2, 3, 13, 14, 2, 'Clean the spillage', '2017-10-30 12:34:11', '2017-10-30 12:34:11', 'Closed'),
(7, 10, 1, 8, 14, 1, 'Replace (5) pillows', '2017-10-30 12:34:59', '2017-10-30 12:34:59', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `transcript`
--

CREATE TABLE `transcript` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('stibanez', 'qwerty');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_department1_idx` (`department_id`);

--
-- Indexes for table `check_in`
--
ALTER TABLE `check_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_check_in_guest_idx` (`guest_id`),
  ADD KEY `fk_check_in_room1_idx` (`room_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_department1_idx` (`department_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_check_in1_idx` (`check_in_id`),
  ADD KEY `fk_ticket_category1_idx` (`category_id`),
  ADD KEY `fk_ticket_employee1_idx` (`employee_create_id`),
  ADD KEY `fk_ticket_employee2_idx` (`employee_responsible_id`);

--
-- Indexes for table `transcript`
--
ALTER TABLE `transcript`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transcript_ticket1_idx` (`ticket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `check_in`
--
ALTER TABLE `check_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `transcript`
--
ALTER TABLE `transcript`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `check_in`
--
ALTER TABLE `check_in`
  ADD CONSTRAINT `fk_check_in_guest` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_check_in_room1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_check_in1` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_employee1` FOREIGN KEY (`employee_create_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_employee2` FOREIGN KEY (`employee_responsible_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transcript`
--
ALTER TABLE `transcript`
  ADD CONSTRAINT `fk_transcript_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
