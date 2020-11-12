-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2020 at 07:16 PM
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

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`ID`, `name`, `grid_size`) VALUES
(1, 'Calvi Risorta', 3),
(2, 'Limal', 3),
(3, 'Chapadinha', 3),
(4, 'Villers-le-Peuplier', 1),
(5, 'Piła', 3),
(6, 'Cañas', 2),
(7, 'Bloomington', 2),
(8, 'Yumbel', 2),
(9, 'Offida', 2),
(10, 'Castel Colonna', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT 0,
  `user_role_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `password`, `logged_in`, `user_role_id`) VALUES
(1, 'Keith', 'Proin@nullaanteiaculis.org', 'SWM94EHF6PT', 0, 3),
(2, 'Nash', 'Morbi.quis@imperdietdictummagna.', 'QRS57QLS0CD', 0, 3),
(3, 'Jakeem', 'ut@id.co.uk', 'CEZ19IST2HT', 0, 3),
(4, 'Britanney', 'vulputate.risus@leoVivamusnibh.c', 'QEC96DLA3HU', 0, 2),
(5, 'Philip', 'id.risus@idante.org', 'IHN48GYZ7RM', 1, 1),
(6, 'Kenyon', 'ac@eget.org', 'ZXM16AAU4VY', 1, 3),
(7, 'Blake', 'lectus.rutrum@acmattis.ca', 'SPO08PUN3QS', 0, 2),
(8, 'Emily', 'nonummy@nonummy.ca', 'ZBX02ZIZ9XU', 1, 1),
(9, 'Brandon', 'vitae.purus@dictummi.ca', 'ZAT90QAP2XR', 0, 2),
(10, 'Quinn', 'a.odio@ultrices.edu', 'BRZ27KFH1YX', 0, 1),
(11, 'Magee', 'risus.Morbi.metus@porttitor.ca', 'PQK33EQW3KB', 1, 2),
(12, 'Jonas', 'elit.pede.malesuada@pellentesque', 'GTO26LRM9IX', 1, 2),
(13, 'Ali', 'commodo.auctor.velit@dictummi.co', 'NCY85UJN7FD', 1, 3),
(14, 'Gregory', 'magna.Phasellus@eratnonummy.net', 'FNI51NFB0YD', 0, 2),
(15, 'Oleg', 'imperdiet.dictum.magna@facilisis', 'KVZ43LYP3GC', 1, 3),
(16, 'Kellie', 'felis.eget@convalliserateget.org', 'CXS73BST7YU', 0, 2),
(17, 'Amanda', 'aliquet.nec@aliquamiaculislacus.', 'ZGP25DKC4MP', 0, 1),
(18, 'Calvin', 'massa.lobortis.ultrices@sceleris', 'EOI43HDO2DQ', 1, 1),
(19, 'Jayme', 'sit@augueporttitor.com', 'TSF23DXQ3MF', 1, 2),
(20, 'Beverly', 'ut@elementum.com', 'XVN61VGA0IK', 0, 3),
(21, 'Mechelle', 'venenatis.vel.faucibus@velitAliq', 'MPC19MAM4RH', 1, 2),
(22, 'Yeo', 'eu@risusInmi.co.uk', 'AAJ13ZID3IJ', 1, 3),
(23, 'Yasir', 'rutrum.Fusce.dolor@auguemalesuad', 'ROP05TIC3XV', 1, 2),
(24, 'Joshua', 'nonummy.Fusce.fermentum@sceleris', 'ORK36LQN8WV', 1, 3),
(25, 'Robin', 'ultrices.Duis@dictumeuplacerat.o', 'DJZ56VXT6HY', 0, 1),
(26, 'Cairo', 'magnis@mieleifendegestas.net', 'KZX72IHD8FM', 1, 3),
(27, 'Olga', 'turpis.Aliquam.adipiscing@nisi.e', 'EVB30IKU6TJ', 0, 3),
(28, 'Connor', 'facilisis.non@vitaeodio.org', 'XAZ13SSB5XP', 0, 2),
(29, 'Honorato', 'ante.bibendum.ullamcorper@eu.edu', 'GXV48QXQ8LK', 1, 2),
(30, 'Kermit', 'felis@fringillaeuismod.org', 'CJD67PMJ4OR', 1, 3),
(31, 'Henry', 'scelerisque.scelerisque.dui@perc', 'DOT04WJZ0BY', 0, 3),
(32, 'Orla', 'Integer@sedfacilisis.edu', 'HID85VOD5CF', 0, 2),
(33, 'Aspen', 'Sed.congue.elit@nonummyipsumnon.', 'NGS03RSM8KV', 0, 3),
(34, 'Jemima', 'id@sitametfaucibus.net', 'FDT77GUV0ZS', 0, 2),
(35, 'Ramona', 'nec.diam@imperdiet.com', 'YIN48DTD0QA', 0, 3),
(36, 'Risa', 'nisl@fringilla.co.uk', 'RNI96ISJ9WG', 1, 1),
(37, 'Kai', 'orci.Donec@eudoloregestas.co.uk', 'MWS79ZYJ7ED', 1, 3),
(38, 'Lara', 'ligula.consectetuer.rhoncus@metu', 'TKB96FOE7HK', 1, 3),
(39, 'Adam', 'ac@arcuac.edu', 'XTG58HDX9LD', 1, 3),
(40, 'Lesley', 'eleifend.nec.malesuada@ornareIn.', 'NXO43WCV3TH', 1, 3),
(41, 'Cadman', 'id.mollis.nec@nibh.org', 'VGE69PCI8LU', 0, 3),
(42, 'Marshall', 'augue.scelerisque@atauctor.co.uk', 'TQT58LWH9VJ', 1, 3),
(43, 'Zachery', 'sollicitudin.adipiscing.ligula@D', 'DDE73GYF6YL', 1, 2),
(44, 'Kadeem', 'lacinia.orci.consectetuer@Crasdi', 'GVL65TAH4IE', 0, 2),
(45, 'Walter', 'mauris@orciUtsagittis.edu', 'WOY21HNH3HS', 1, 2),
(46, 'Barbara', 'mi.lorem.vehicula@utpellentesque', 'UWN17UBD3CY', 0, 3),
(47, 'Brittany', 'ultricies.ligula.Nullam@tortordi', 'ABE69SQE4KL', 1, 1),
(48, 'Noelani', 'arcu.Morbi.sit@vitaesodalesnisi.', 'RJM36VZY2IG', 0, 3),
(49, 'Karly', 'scelerisque.lorem.ipsum@liberoPr', 'YGN45TSV4DI', 0, 3),
(50, 'Zeph', 'vel@nunc.net', 'RVC35VMV8XS', 0, 1),
(51, 'Ella', 'metus@dictummiac.co.uk', 'SLS50YHF9GQ', 0, 2),
(52, 'Magee', 'sapien.gravida@malesuadafames.ne', 'KVN34QGU7VX', 0, 2),
(53, 'Simone', 'nisl@semmolestiesodales.net', 'TTN91BDA6GD', 1, 3),
(54, 'Prescott', 'elit.fermentum.risus@Donecegesta', 'RZH03JKH0KH', 1, 1),
(55, 'Valentine', 'consectetuer@liberoestcongue.org', 'SVC20UBS4FJ', 0, 1),
(56, 'Felix', 'at.augue@magna.net', 'RAE05NPM9EO', 1, 3),
(57, 'Len', 'ut@non.co.uk', 'ZBT33YXV0GY', 1, 3),
(58, 'David', 'lobortis.mauris@neque.net', 'YVC35PLE6ZB', 1, 2),
(59, 'Kenneth', 'Nunc.sed.orci@milaciniamattis.co', 'LYP56TJE5HR', 1, 3),
(60, 'Vladimir', 'Fusce@quam.co.uk', 'XBU23YKI2OE', 1, 2),
(61, 'Willow', 'Praesent@Vivamuseuismod.net', 'DHM93UHB8HR', 1, 3),
(62, 'Winifred', 'nunc.nulla.vulputate@ametloremse', 'MOS87ITP3QC', 0, 3),
(63, 'Zachery', 'Quisque.porttitor.eros@pedenec.n', 'SBT21AIA5SY', 1, 3),
(64, 'Danielle', 'amet.consectetuer@quamquis.com', 'QBP24QSK2TW', 0, 3),
(65, 'Nasim', 'natoque.penatibus.et@neceleifend', 'GLV45PKJ1ZJ', 1, 3),
(66, 'Xavier', 'enim.Curabitur.massa@Ut.ca', 'DHY50LJR4JC', 0, 1),
(67, 'Jana', 'tristique.ac.eleifend@adipiscing', 'IPU41PQC4XT', 0, 1),
(68, 'Jakeem', 'magna.Phasellus.dolor@Donec.edu', 'UCY25JSR5FE', 0, 2),
(69, 'Baker', 'in@lectus.org', 'YWL04HMM0MY', 0, 3),
(70, 'Damon', 'eu.neque.pellentesque@afacilisis', 'NPW63VNL8UN', 1, 3),
(71, 'Bryar', 'tellus@eleifend.net', 'ZIK27MEZ9JS', 0, 2),
(72, 'Hoyt', 'tincidunt.Donec@erat.ca', 'KZM64DTI6WU', 1, 1),
(73, 'Hashim', 'Morbi.vehicula@sitamet.edu', 'PLH84SCV3IA', 1, 1),
(74, 'Indigo', 'ultrices@rutrumurna.com', 'ALM13NST5UX', 1, 3),
(75, 'Wang', 'Suspendisse.aliquet@vulputate.or', 'ESD75JXQ8FF', 1, 3),
(76, 'Dante', 'Cras@habitantmorbi.org', 'XQT05MVG0GN', 1, 2),
(77, 'Kalia', 'convallis@netuset.com', 'LMZ27WNQ7CP', 1, 2),
(78, 'Dana', 'Ut.semper.pretium@pede.edu', 'QLE90ILC6GX', 1, 3),
(79, 'Stella', 'gravida@accumsanconvallis.com', 'RFH72ACA4ZG', 1, 2),
(80, 'Branden', 'elit.dictum@leo.net', 'DDN31UJN2HH', 1, 2),
(81, 'Damon', 'neque.Nullam.nisl@temporbibendum', 'VKC20ZHX3NW', 0, 2),
(82, 'Callum', 'purus.ac.tellus@risusDonec.com', 'IXI71AOA1VJ', 1, 2),
(83, 'Winter', 'nisi@pellentesqueegetdictum.org', 'LYQ29OCG1OZ', 0, 2),
(84, 'Kirk', 'Maecenas@euodio.net', 'GOE02VUR3FQ', 0, 1),
(85, 'Burke', 'faucibus.orci.luctus@nibh.org', 'FKG40KHY2BD', 1, 1),
(86, 'Ivory', 'cursus@sitamet.edu', 'TKT28MZQ1SD', 0, 3),
(87, 'Lillith', 'Phasellus.elit@In.edu', 'QUP84AEV3OB', 1, 3),
(88, 'Whilemina', 'in.faucibus.orci@vitaealiquam.or', 'MGH52SFB0MU', 0, 1),
(89, 'Linda', 'erat@atauctorullamcorper.ca', 'ZGG09POL0VH', 0, 3),
(90, 'Halla', 'in.sodales.elit@eutempor.org', 'CBC79LIM7EO', 0, 2),
(91, 'Trevor', 'in.tempus@lobortisaugue.edu', 'WHJ26NHM7YT', 0, 1),
(92, 'Kalia', 'a.ultricies@consequatnec.edu', 'ZBK71XBZ4MP', 0, 3),
(93, 'Richard', 'penatibus.et@ametmassaQuisque.ne', 'EUX38KCI4FI', 1, 1),
(94, 'Flavia', 'volutpat.nunc.sit@massaVestibulu', 'TYF62BPL8RF', 0, 2),
(95, 'Hermione', 'justo.Praesent@pharetraQuisque.c', 'OWE02FHR9PK', 0, 1),
(96, 'Imogene', 'est@lectusNullam.edu', 'EJS12PTU0UJ', 0, 2),
(97, 'Erasmus', 'leo.elementum@etlacinia.com', 'WKJ63QTE0JI', 0, 2),
(98, 'Aphrodite', 'amet.ultricies@Aeneanegestashend', 'FEZ54PHT8JU', 0, 2),
(99, 'Cassandra', 'vel.mauris.Integer@duiFusce.co.u', 'TTA25SPW4OG', 0, 1),
(100, 'September', 'feugiat.Sed@aauctornon.ca', 'QRN30HHP9CW', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`ID`, `name`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `ventgroups`
--

CREATE TABLE `ventgroups` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ventgroups`
--

INSERT INTO `ventgroups` (`ID`, `name`, `room_id`) VALUES
(1, 'Group 1', 2),
(2, 'Group 1', 3),
(3, 'Group 1', 4),
(4, 'Group 1', 5),
(5, 'Group 1', 6),
(6, 'Group 1', 7),
(7, 'Group 1', 8),
(8, 'Group 1', 9),
(9, 'Group 1', 10),
(10, 'Group 1', 1),
(11, 'Group 2', 2),
(12, 'Group 2', 3),
(13, 'Group 2', 4),
(14, 'Group 2', 5),
(15, 'Group 2', 6),
(16, 'Group 2', 7),
(17, 'Group 2', 8),
(18, 'Group 2', 9),
(19, 'Group 2', 10),
(20, 'Group 2', 1),
(21, 'Group 3', 2),
(22, 'Group 3', 3),
(23, 'Group 3', 4),
(24, 'Group 3', 5),
(25, 'Group 3', 6),
(26, 'Group 3', 7),
(27, 'Group 3', 8),
(28, 'Group 3', 9),
(29, 'Group 3', 10),
(30, 'Group 3', 1),
(31, 'Group 4', 2),
(32, 'Group 4', 3),
(33, 'Group 4', 4),
(34, 'Group 4', 5),
(35, 'Group 4', 6),
(36, 'Group 4', 7),
(37, 'Group 4', 8),
(38, 'Group 4', 9),
(39, 'Group 4', 10),
(40, 'Group 4', 1);

--
-- Triggers `ventgroups`
--
DELIMITER $$
CREATE TRIGGER `create_group_name` BEFORE INSERT ON `ventgroups` FOR EACH ROW set new.name = CONCAT('Group ', ((SELECT count(*) from ventgroups WHERE room_id = new.room_id) +1 ))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vents`
--

CREATE TABLE `vents` (
  `ID` int(11) UNSIGNED NOT NULL,
  `temperature` int(2) NOT NULL DEFAULT 20,
  `humidity` int(3) NOT NULL DEFAULT 50,
  `oxygen_level` int(3) NOT NULL DEFAULT 0,
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
  ADD UNIQUE KEY `user_id_2` (`user_id`),
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
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ventgroups`
--
ALTER TABLE `ventgroups`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  ADD CONSTRAINT `ventgroups_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`ID`);

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


CREATE USER 'manager'@'%' IDENTIFIED VIA mysql_native_password USING '***';GRANT USAGE ON *.* TO 'manager'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;GRANT ALL PRIVILEGES ON `vent2u`.* TO 'manager'@'%';