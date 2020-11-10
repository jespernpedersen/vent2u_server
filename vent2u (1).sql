-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2020 at 11:03 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vent2u`
--

-- --------------------------------------------------------

--
-- Table structure for table `claimrequests`
--

CREATE TABLE `claimrequests` (
  `ID` int(11) UNSIGNED NOT NULL,
  `student_id` int(11) UNSIGNED NOT NULL,
  `vent_id` int(11) UNSIGNED NOT NULL,
  `status_id` int(11) UNSIGNED NOT NULL,
  `approved_by_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `claimrequeststatus`
--

CREATE TABLE `claimrequeststatus` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class_users`
--

CREATE TABLE `class_users` (
  `ID` int(11) UNSIGNED NOT NULL,
  `classes_id` int(11) UNSIGNED NOT NULL,
  `users_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `presets`
--

CREATE TABLE `presets` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `temperature` int(2) NOT NULL DEFAULT 20,
  `humidity` int(3) NOT NULL DEFAULT 50,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `grid_size` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) UNSIGNED NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT 0,
  `user_role_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ventgroups`
--

CREATE TABLE `ventgroups` (
  `ID` int(11) UNSIGNED NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vents`
--

CREATE TABLE `vents` (
  `ID` int(11) UNSIGNED NOT NULL,
  `temperature` int(2) NOT NULL DEFAULT 20,
  `humidity` int(3) NOT NULL DEFAULT 50,
  `oxygenLevel` int(3) NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL,
  `vent_group_id` int(11) UNSIGNED NOT NULL,
  `presets_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `claimrequests`
--
ALTER TABLE `claimrequests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `vent_id` (`vent_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `approved_by_id` (`approved_by_id`);

--
-- Indexes for table `claimrequeststatus`
--
ALTER TABLE `claimrequeststatus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `class_users`
--
ALTER TABLE `class_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `classes_id` (`classes_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `presets`
--
ALTER TABLE `presets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ventgroups`
--
ALTER TABLE `ventgroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `vents`
--
ALTER TABLE `vents`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vent_group_id` (`vent_group_id`),
  ADD KEY `presets_id` (`presets_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `claimrequests`
--
ALTER TABLE `claimrequests`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claimrequeststatus`
--
ALTER TABLE `claimrequeststatus`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_users`
--
ALTER TABLE `class_users`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presets`
--
ALTER TABLE `presets`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ventgroups`
--
ALTER TABLE `ventgroups`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vents`
--
ALTER TABLE `vents`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `claimrequests`
--
ALTER TABLE `claimrequests`
  ADD CONSTRAINT `claimrequests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `claimrequests_ibfk_2` FOREIGN KEY (`vent_id`) REFERENCES `vents` (`ID`),
  ADD CONSTRAINT `claimrequests_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `claimrequeststatus` (`ID`),
  ADD CONSTRAINT `claimrequests_ibfk_4` FOREIGN KEY (`approved_by_id`) REFERENCES `users` (`ID`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`ID`);

--
-- Constraints for table `class_users`
--
ALTER TABLE `class_users`
  ADD CONSTRAINT `class_users_ibfk_1` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`ID`),
  ADD CONSTRAINT `class_users_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`ID`);

--
-- Constraints for table `presets`
--
ALTER TABLE `presets`
  ADD CONSTRAINT `presets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`ID`);

--
-- Constraints for table `ventgroups`
--
ALTER TABLE `ventgroups`
  ADD CONSTRAINT `ventgroups_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `ventgroups` (`ID`);

--
-- Constraints for table `vents`
--
ALTER TABLE `vents`
  ADD CONSTRAINT `vents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `vents_ibfk_2` FOREIGN KEY (`vent_group_id`) REFERENCES `ventgroups` (`ID`),
  ADD CONSTRAINT `vents_ibfk_3` FOREIGN KEY (`presets_id`) REFERENCES `presets` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
