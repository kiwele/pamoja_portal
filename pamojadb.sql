-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 02:34 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pamojadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activestatuses`
--

CREATE TABLE `activestatuses` (
  `activeId` int(1) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `maritalstatuses`
--

CREATE TABLE `maritalstatuses` (
  `statusId` int(1) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `memberlocations`
--

CREATE TABLE `memberlocations` (
  `locationId` int(1) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `memberId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `memberlocations`
--

INSERT INTO `memberlocations` (`locationId`, `country`, `region`, `district`, `ward`, `street`, `house_number`, `start_date`, `end_date`, `createdAt`, `updatedAt`, `memberId`) VALUES
(0, NULL, 'KIGOMA', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-20 17:44:58', '2023-03-20 17:44:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` int(15) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `maritalStatusId` int(1) DEFAULT NULL,
  `activeId` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberId`, `first_name`, `middle_name`, `last_name`, `email`, `phone_number`, `profile_picture`, `createdAt`, `updatedAt`, `maritalStatusId`, `activeId`) VALUES
('1f5d9ede-d79c-41a8-bd54-c6253552c672', 'musa', 'kiwele', 'sudi', 'musa@gmail.com', 742781549, NULL, '2023-03-20 17:55:00', '2023-03-20 17:55:00', NULL, NULL),
('2018b85c-eed1-4739-b0ad-9906e9c17003', 'Kaliho', 'Bdru', 'kaliho', 'b@gmail.com', 742781549, NULL, '2023-03-20 18:14:28', '2023-03-20 18:14:28', NULL, NULL),
('a0280b1d-f989-42ca-9da1-088c781b4384', 'Babuu', 'mpere', 'mpera', 'babuu@gmail.com', 742781549, NULL, '2023-03-20 18:38:59', '2023-03-20 18:38:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schoolstudieds`
--

CREATE TABLE `schoolstudieds` (
  `schoolId` int(1) NOT NULL,
  `school_names` varchar(255) DEFAULT NULL,
  `study_taken` varchar(255) DEFAULT NULL,
  `award` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `memberId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schoolstudieds`
--

INSERT INTO `schoolstudieds` (`schoolId`, `school_names`, `study_taken`, `award`, `start_date`, `end_date`, `createdAt`, `updatedAt`, `memberId`) VALUES
(0, 'UDSM', NULL, NULL, NULL, NULL, '2023-03-20 17:44:58', '2023-03-20 17:44:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `roleId` int(1) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `password`, `profile_picture`, `createdAt`, `updatedAt`, `roleId`) VALUES
('349fdfef-a97f-438d-9d30-2e43f5b522b9', 'js@gmail.com', '$2a$10$8yOfuQuO5X1C4PsAp/YAJeEqKNeekiDLlW8pcEWdl3q1YaRM1TrqG', '', '2023-03-19 13:40:44', '2023-03-19 13:40:44', NULL),
('61aa068d-7f2e-4fcb-b068-f5b539107945', 'jh@gmail.com', '$2a$10$X536Ox2vNfsx4StHMTieluXwqh9fyX5VCgjpdBtkPOVwTs7KwdgM2', '', '2023-03-19 22:07:14', '2023-03-19 22:07:14', NULL),
('eb9e9542-813a-421c-ad2a-cba85082140d', 'musakiwele@gmail.com', '$2a$10$8YJvoUeNFgdfPxNs2Gkot.SpFm1Z6IZv1yXJu8tmeMu68LoJOD13W', '', '2023-03-20 17:10:07', '2023-03-20 17:10:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workexperiences`
--

CREATE TABLE `workexperiences` (
  `workId` int(2) NOT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `position_title` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `memberId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activestatuses`
--
ALTER TABLE `activestatuses`
  ADD PRIMARY KEY (`activeId`);

--
-- Indexes for table `maritalstatuses`
--
ALTER TABLE `maritalstatuses`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `memberlocations`
--
ALTER TABLE `memberlocations`
  ADD PRIMARY KEY (`locationId`),
  ADD KEY `memberId` (`memberId`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberId`),
  ADD KEY `maritalStatusId` (`maritalStatusId`),
  ADD KEY `activeId` (`activeId`);

--
-- Indexes for table `schoolstudieds`
--
ALTER TABLE `schoolstudieds`
  ADD PRIMARY KEY (`schoolId`),
  ADD KEY `memberId` (`memberId`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `workexperiences`
--
ALTER TABLE `workexperiences`
  ADD PRIMARY KEY (`workId`),
  ADD KEY `memberId` (`memberId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `memberlocations`
--
ALTER TABLE `memberlocations`
  ADD CONSTRAINT `memberlocations_ibfk_1` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_activeId_foreign_idx` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_10` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_100` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_101` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_102` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_103` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_104` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_105` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_106` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_107` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_108` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_109` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_11` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_110` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_111` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_112` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_113` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_114` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_115` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_116` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_117` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_118` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_119` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_12` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_120` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_121` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_122` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_123` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_124` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_125` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_126` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_127` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_128` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_129` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_13` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_130` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_131` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_132` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_133` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_134` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_135` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_136` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_137` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_138` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_139` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_14` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_140` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_141` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_142` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_143` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_144` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_145` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_146` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_147` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_148` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_149` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_15` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_150` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_151` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_152` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_153` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_154` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_155` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_156` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_157` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_158` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_159` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_16` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_160` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_161` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_162` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_163` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_164` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_165` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_166` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_167` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_168` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_169` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_17` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_170` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_171` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_172` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_173` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_174` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_175` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_176` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_177` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_178` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_179` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_18` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_180` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_181` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_182` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_183` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_184` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_185` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_186` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_187` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_188` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_189` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_19` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_190` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_191` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_192` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_193` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_194` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_195` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_196` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_197` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_198` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_199` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_2` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_20` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_200` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_201` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_202` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_203` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_204` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_205` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_206` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_207` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_208` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_209` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_21` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_210` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_211` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_212` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_213` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_214` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_215` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_216` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_217` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_218` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_219` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_22` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_220` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_221` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_222` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_223` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_224` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_225` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_226` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_227` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_228` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_229` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_23` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_230` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_231` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_232` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_233` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_234` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_235` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_236` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_237` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_238` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_239` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_24` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_240` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_241` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_242` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_243` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_244` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_245` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_246` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_247` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_248` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_249` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_25` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_250` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_251` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_252` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_253` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_254` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_255` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_256` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_257` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_258` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_259` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_26` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_260` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_261` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_262` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_263` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_264` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_265` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_266` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_267` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_268` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_269` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_27` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_270` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_271` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_272` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_273` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_274` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_275` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_276` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_277` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_278` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_279` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_28` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_280` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_281` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_282` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_283` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_284` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_285` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_286` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_287` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_288` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_289` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_29` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_290` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_291` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_292` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_293` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_294` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_295` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_296` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_297` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_298` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_299` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_3` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_30` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_300` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_301` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_302` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_303` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_304` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_305` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_306` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_307` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_308` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_309` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_31` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_310` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_311` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_312` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_313` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_314` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_315` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_316` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_317` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_318` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_319` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_32` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_320` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_321` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_322` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_323` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_324` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_325` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_326` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_327` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_328` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_329` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_33` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_34` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_35` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_36` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_37` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_38` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_39` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_4` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_40` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_41` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_42` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_43` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_44` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_45` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_46` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_47` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_48` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_49` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_5` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_50` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_51` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_52` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_53` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_54` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_55` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_56` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_57` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_58` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_59` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_6` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_60` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_61` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_62` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_63` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_64` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_65` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_66` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_67` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_68` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_69` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_7` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_70` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_71` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_72` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_73` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_74` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_75` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_76` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_77` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_78` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_79` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_8` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_80` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_81` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_82` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_83` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_84` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_85` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_86` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_87` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_88` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_89` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_9` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_90` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_91` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_92` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_93` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_94` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_95` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_96` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_97` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_98` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_99` FOREIGN KEY (`activeId`) REFERENCES `activestatuses` (`activeId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `members_maritalStatusId_foreign_idx` FOREIGN KEY (`maritalStatusId`) REFERENCES `maritalstatuses` (`statusId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `schoolstudieds`
--
ALTER TABLE `schoolstudieds`
  ADD CONSTRAINT `schoolstudieds_ibfk_1` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_10` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_100` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_101` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_102` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_103` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_104` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_105` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_106` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_107` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_108` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_109` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_11` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_110` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_111` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_112` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_113` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_114` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_115` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_116` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_117` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_118` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_119` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_12` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_120` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_121` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_122` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_123` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_124` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_125` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_126` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_127` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_128` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_129` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_13` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_130` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_131` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_132` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_133` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_134` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_135` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_136` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_137` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_138` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_139` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_14` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_140` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_141` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_142` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_143` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_144` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_145` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_146` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_147` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_148` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_149` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_15` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_150` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_151` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_152` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_153` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_154` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_155` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_156` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_157` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_158` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_159` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_16` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_160` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_161` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_162` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_163` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_164` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_165` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_166` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_167` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_168` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_169` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_17` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_170` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_171` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_172` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_173` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_174` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_175` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_176` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_177` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_178` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_179` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_18` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_180` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_181` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_182` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_183` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_184` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_185` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_186` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_187` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_188` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_189` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_19` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_190` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_191` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_192` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_193` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_194` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_195` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_196` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_197` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_198` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_199` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_20` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_200` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_201` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_202` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_203` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_204` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_205` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_206` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_207` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_208` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_209` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_21` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_210` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_211` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_212` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_213` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_214` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_215` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_216` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_217` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_218` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_219` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_22` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_220` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_221` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_222` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_223` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_224` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_225` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_226` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_227` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_228` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_229` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_23` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_230` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_231` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_232` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_233` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_234` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_235` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_236` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_237` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_238` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_239` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_24` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_240` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_241` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_242` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_243` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_244` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_245` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_246` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_247` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_248` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_249` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_25` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_250` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_251` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_252` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_253` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_254` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_255` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_256` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_26` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_27` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_28` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_29` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_30` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_31` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_32` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_33` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_34` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_35` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_36` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_37` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_38` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_39` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_40` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_41` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_42` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_43` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_44` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_45` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_46` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_47` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_48` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_49` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_50` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_51` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_52` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_53` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_54` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_55` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_56` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_57` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_58` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_59` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_6` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_60` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_61` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_62` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_63` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_64` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_65` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_66` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_67` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_68` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_69` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_7` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_70` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_71` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_72` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_73` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_74` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_75` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_76` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_77` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_78` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_79` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_8` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_80` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_81` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_82` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_83` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_84` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_85` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_86` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_87` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_88` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_89` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_9` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_90` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_91` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_92` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_93` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_94` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_95` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_96` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_97` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_98` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_99` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_roleId_foreign_idx` FOREIGN KEY (`roleId`) REFERENCES `userroles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workexperiences`
--
ALTER TABLE `workexperiences`
  ADD CONSTRAINT `workexperiences_ibfk_1` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
