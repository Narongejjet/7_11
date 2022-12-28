-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 03:36 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `7_11`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` bigint(20) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `calls` varchar(20) DEFAULT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `firstName`, `lastName`, `calls`, `Email`) VALUES
(1, 'MR.CHATCHANAN', 'CHATSATHAWONG', '099-304-5398', 'sony99012@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `maproles`
--

CREATE TABLE `maproles` (
  `mapId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `calls` varchar(20) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `sectionsId` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'register',
  `approvedBy` bigint(20) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `maproles`
--

INSERT INTO `maproles` (`mapId`, `roleId`, `firstName`, `lastName`, `calls`, `Email`, `sectionsId`, `status`, `approvedBy`, `createDate`, `updatedAt`) VALUES
(1, 1, 'MR.SUPHAPBURUS', 'MOONPIMAI', '094-527-9199', 'eqburut.mool@gmail.com', 2, 'register', NULL, '2022-12-28 02:35:11', NULL),
(2, 1, 'MISS JITTIMA', 'ASATHUM', '094-447-0996', 'jitima.24959@gmail.com', 3, 'register', NULL, '2022-12-28 02:35:11', NULL),
(3, 2, 'MR.CHIROT', 'AUNKITTI', '061-638-9874', 'chirot230346@gmail.com', 2, 'register', NULL, '2022-12-28 02:35:11', NULL),
(4, 2, 'MR.KHUMPHOL', 'METTAWASEE', '091-072-9939', 'daysun0903@gmail.com', 1, 'register', NULL, '2022-12-28 02:35:11', NULL),
(5, 2, 'MR.NARONGDECH', 'SANTAWEESUK', '083-070-8364', 'Narongdej.jet@gmail.com', 1, 'register', NULL, '2022-12-28 02:35:11', NULL),
(6, 3, 'MISS THEERATHIDA', 'BOONKLOM', '064-570-1755', 'marileen611@gmail.com', 5, 'register', NULL, '2022-12-28 02:35:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menuId` bigint(20) NOT NULL,
  `nameMenu` varchar(255) DEFAULT NULL,
  `permission` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuId`, `nameMenu`, `permission`, `status`, `createDate`, `updatedAt`) VALUES
(1, 'sales', 'check', 1, '2022-12-28 02:35:11', NULL),
(2, 'POS', 'check', 1, '2022-12-28 02:35:11', NULL),
(3, 'Statement', 'check', 1, '2022-12-28 02:35:11', NULL),
(4, 'stocks', 'check, edit', 1, '2022-12-28 02:35:11', NULL),
(5, 'HR', 'check', 1, '2022-12-28 02:35:11', NULL),
(6, 'members', 'check, edit', 1, '2022-12-28 02:35:11', NULL),
(7, 'purchase', 'check, edit', 1, '2022-12-28 02:35:11', NULL),
(8, 'payRoll', 'check, edit', 1, '2022-12-28 02:35:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permissionId` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permissionId`, `name`, `status`, `createDate`, `updatedAt`) VALUES
(1, 'check', 1, '2022-12-28 02:35:11', NULL),
(2, 'edit', 1, '2022-12-28 02:35:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissionmenu`
--

CREATE TABLE `permissionmenu` (
  `roleId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  `menuId` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissionmenu`
--

INSERT INTO `permissionmenu` (`roleId`, `permissionId`, `menuId`, `status`, `createDate`, `updatedAt`) VALUES
(1, 1, 1, 1, '2022-12-28 02:35:11', NULL),
(1, 1, 2, 1, '2022-12-28 02:35:11', NULL),
(1, 1, 3, 1, '2022-12-28 02:35:11', NULL),
(1, 1, 4, 1, '2022-12-28 02:35:11', NULL),
(1, 2, 4, 1, '2022-12-28 02:35:11', NULL),
(1, 1, 5, 1, '2022-12-28 02:35:11', NULL),
(1, 1, 6, 1, '2022-12-28 02:35:11', NULL),
(1, 2, 6, 1, '2022-12-28 02:35:11', NULL),
(1, 1, 7, 1, '2022-12-28 02:35:11', NULL),
(1, 2, 7, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 1, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 2, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 3, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 4, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 5, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 6, 1, '2022-12-28 02:35:11', NULL),
(2, 2, 6, 1, '2022-12-28 02:35:11', NULL),
(2, 1, 7, 1, '2022-12-28 02:35:11', NULL),
(3, 1, 1, 1, '2022-12-28 02:35:11', NULL),
(3, 1, 2, 1, '2022-12-28 02:35:11', NULL),
(3, 1, 3, 1, '2022-12-28 02:35:11', NULL),
(3, 1, 4, 1, '2022-12-28 02:35:11', NULL),
(3, 2, 4, 1, '2022-12-28 02:35:11', NULL),
(3, 1, 6, 1, '2022-12-28 02:35:11', NULL),
(3, 2, 6, 1, '2022-12-28 02:35:11', NULL),
(3, 1, 7, 1, '2022-12-28 02:35:11', NULL),
(3, 2, 7, 1, '2022-12-28 02:35:11', NULL),
(4, 1, 1, 1, '2022-12-28 02:35:11', NULL),
(4, 1, 2, 1, '2022-12-28 02:35:11', NULL),
(4, 1, 4, 1, '2022-12-28 02:35:11', NULL),
(4, 1, 6, 1, '2022-12-28 02:35:11', NULL),
(4, 1, 7, 1, '2022-12-28 02:35:11', NULL),
(4, 2, 7, 1, '2022-12-28 02:35:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissionrole`
--

CREATE TABLE `permissionrole` (
  `roleId` bigint(20) NOT NULL,
  `approvedId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissionrole`
--

INSERT INTO `permissionrole` (`roleId`, `approvedId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'hr'),
(2, 'fc'),
(3, 'Manager'),
(4, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`) VALUES
(1, 'North'),
(2, 'South'),
(3, 'West'),
(4, 'East'),
(5, 'Central');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD UNIQUE KEY `firstName` (`firstName`,`lastName`);

--
-- Indexes for table `maproles`
--
ALTER TABLE `maproles`
  ADD PRIMARY KEY (`mapId`),
  ADD UNIQUE KEY `roleId` (`roleId`,`firstName`,`lastName`),
  ADD KEY `approvedBy` (`approvedBy`),
  ADD KEY `sectionsId` (`sectionsId`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuId`),
  ADD UNIQUE KEY `nameMenu` (`nameMenu`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permissionId`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `permissionmenu`
--
ALTER TABLE `permissionmenu`
  ADD KEY `roleId` (`roleId`),
  ADD KEY `permissionId` (`permissionId`),
  ADD KEY `menuId` (`menuId`);

--
-- Indexes for table `permissionrole`
--
ALTER TABLE `permissionrole`
  ADD KEY `roleId` (`roleId`),
  ADD KEY `approvedId` (`approvedId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maproles`
--
ALTER TABLE `maproles`
  MODIFY `mapId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menuId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permissionId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maproles`
--
ALTER TABLE `maproles`
  ADD CONSTRAINT `maproles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `maproles_ibfk_2` FOREIGN KEY (`approvedBy`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `maproles_ibfk_3` FOREIGN KEY (`sectionsId`) REFERENCES `sections` (`id`);

--
-- Constraints for table `permissionmenu`
--
ALTER TABLE `permissionmenu`
  ADD CONSTRAINT `permissionmenu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `permissionmenu_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`permissionId`),
  ADD CONSTRAINT `permissionmenu_ibfk_3` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`);

--
-- Constraints for table `permissionrole`
--
ALTER TABLE `permissionrole`
  ADD CONSTRAINT `permissionrole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `permissionrole_ibfk_2` FOREIGN KEY (`approvedId`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
