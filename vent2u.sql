-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2020 at 08:28 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vent2u`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNotifications` (IN `userId` INT(11) UNSIGNED)  BEGIN
	SELECT * from notifications_queue WHERE user_id = userId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `username` VARCHAR(42), IN `userpassword` VARCHAR(64))  begin 
set @loggedin = 0;
SELECT COUNT(*) from users where users.email=username and users.password= userpassword into @loggedin;
if @loggedin = 1 
then update users SET logged_in = 1 where email = username and password = userpassword;
select true as "logged_in", ID from users where email = email and password= userpassword;
else select false as "logged_in";
end if;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `air_properties`
--

CREATE TABLE `air_properties` (
  `ID` int(11) UNSIGNED NOT NULL,
  `speed` int(2) DEFAULT NULL,
  `quality` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `change_requests`
--

CREATE TABLE `change_requests` (
  `ID` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `vent_id` int(11) UNSIGNED NOT NULL,
  `status_id` int(11) UNSIGNED NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `change_requests`
--

INSERT INTO `change_requests` (`ID`, `user_id`, `vent_id`, `status_id`, `time`) VALUES
(2, 1, 5, 1, '2020-12-08 10:54:48');

--
-- Triggers `change_requests`
--
DELIMITER $$
CREATE TRIGGER `notify_change_request` AFTER INSERT ON `change_requests` FOR EACH ROW BEGIN
    INSERT INTO notifications_queue(user_id, action_type_id, foreign_id) SELECT ID, 1, New.id FROM v_users WHERE vent_id = New.vent_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `claim_logs`
--

CREATE TABLE `claim_logs` (
  `ID` int(11) UNSIGNED NOT NULL,
  `vent_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `notifications_queue`
--

CREATE TABLE `notifications_queue` (
  `ID` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `action_type_id` int(11) UNSIGNED NOT NULL,
  `foreign_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `notifications_queue`
--

INSERT INTO `notifications_queue` (`ID`, `user_id`, `action_type_id`, `foreign_id`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 2),
(3, 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_type`
--

CREATE TABLE `notification_type` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `notification_type`
--

INSERT INTO `notification_type` (`ID`, `name`) VALUES
(1, 'Change Request');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `group_number` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`ID`, `name`, `group_number`) VALUES
(1, 'Too sweaty', NULL),
(2, 'Too Cold', 1);

-- --------------------------------------------------------

--
-- Table structure for table `requested_changes`
--

CREATE TABLE `requested_changes` (
  `ID` int(11) UNSIGNED NOT NULL,
  `request_id` int(11) UNSIGNED NOT NULL,
  `option_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`ID`, `name`) VALUES
(1, 'Pending'),
(2, 'Approved'),
(3, 'Denied'),
(4, 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `grid_size` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`ID`, `name`, `grid_size`) VALUES
(1, 'Calvi Risorta', 2),
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
  `vent_id` int(11) UNSIGNED DEFAULT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `user_role_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `password`, `vent_id`, `logged_in`, `user_role_id`) VALUES
(1, 'Keith', 'Proin@nullaanteiaculis.org', 'SWM94EHF6PT', 5, 1, 3),
(2, 'Nash', 'Morbi.quis@imperdietdictummagna.', 'QRS57QLS0CD', 5, 0, 3),
(3, 'Jakeem', 'ut@id.co.uk', 'CEZ19IST2HT', 5, 0, 3),
(4, 'Britanney', 'vulputate.risus@leoVivamusnibh.c', 'QEC96DLA3HU', NULL, 0, 2),
(5, 'Philip', 'id.risus@idante.org', 'IHN48GYZ7RM', NULL, 1, 1),
(6, 'Kenyon', 'ac@eget.org', 'ZXM16AAU4VY', NULL, 1, 3),
(7, 'Blake', 'lectus.rutrum@acmattis.ca', 'SPO08PUN3QS', NULL, 0, 2),
(8, 'Emily', 'nonummy@nonummy.ca', 'ZBX02ZIZ9XU', NULL, 1, 1),
(9, 'Brandon', 'vitae.purus@dictummi.ca', 'ZAT90QAP2XR', NULL, 0, 2),
(10, 'Quinn', 'a.odio@ultrices.edu', 'BRZ27KFH1YX', NULL, 0, 1),
(11, 'Magee', 'risus.Morbi.metus@porttitor.ca', 'PQK33EQW3KB', NULL, 1, 2),
(12, 'Jonas', 'elit.pede.malesuada@pellentesque', 'GTO26LRM9IX', NULL, 1, 2),
(13, 'Ali', 'commodo.auctor.velit@dictummi.co', 'NCY85UJN7FD', NULL, 1, 3),
(14, 'Gregory', 'magna.Phasellus@eratnonummy.net', 'FNI51NFB0YD', NULL, 0, 2),
(15, 'Oleg', 'imperdiet.dictum.magna@facilisis', 'KVZ43LYP3GC', NULL, 1, 3),
(16, 'Kellie', 'felis.eget@convalliserateget.org', 'CXS73BST7YU', NULL, 0, 2),
(17, 'Amanda', 'aliquet.nec@aliquamiaculislacus.', 'ZGP25DKC4MP', NULL, 0, 1),
(18, 'Calvin', 'massa.lobortis.ultrices@sceleris', 'EOI43HDO2DQ', NULL, 1, 1),
(19, 'Jayme', 'sit@augueporttitor.com', 'TSF23DXQ3MF', NULL, 1, 2),
(20, 'Beverly', 'ut@elementum.com', 'XVN61VGA0IK', NULL, 0, 3),
(21, 'Mechelle', 'venenatis.vel.faucibus@velitAliq', 'MPC19MAM4RH', NULL, 1, 2),
(22, 'Yeo', 'eu@risusInmi.co.uk', 'AAJ13ZID3IJ', NULL, 1, 3),
(23, 'Yasir', 'rutrum.Fusce.dolor@auguemalesuad', 'ROP05TIC3XV', NULL, 1, 2),
(24, 'Joshua', 'nonummy.Fusce.fermentum@sceleris', 'ORK36LQN8WV', NULL, 1, 3),
(25, 'Robin', 'ultrices.Duis@dictumeuplacerat.o', 'DJZ56VXT6HY', NULL, 0, 1),
(26, 'Cairo', 'magnis@mieleifendegestas.net', 'KZX72IHD8FM', NULL, 1, 3),
(27, 'Olga', 'turpis.Aliquam.adipiscing@nisi.e', 'EVB30IKU6TJ', NULL, 0, 3),
(28, 'Connor', 'facilisis.non@vitaeodio.org', 'XAZ13SSB5XP', NULL, 0, 2),
(29, 'Honorato', 'ante.bibendum.ullamcorper@eu.edu', 'GXV48QXQ8LK', NULL, 1, 2),
(30, 'Kermit', 'felis@fringillaeuismod.org', 'CJD67PMJ4OR', NULL, 1, 3),
(31, 'Henry', 'scelerisque.scelerisque.dui@perc', 'DOT04WJZ0BY', NULL, 0, 3),
(32, 'Orla', 'Integer@sedfacilisis.edu', 'HID85VOD5CF', NULL, 0, 2),
(33, 'Aspen', 'Sed.congue.elit@nonummyipsumnon.', 'NGS03RSM8KV', NULL, 0, 3),
(34, 'Jemima', 'id@sitametfaucibus.net', 'FDT77GUV0ZS', NULL, 0, 2),
(35, 'Ramona', 'nec.diam@imperdiet.com', 'YIN48DTD0QA', NULL, 0, 3),
(36, 'Risa', 'nisl@fringilla.co.uk', 'RNI96ISJ9WG', NULL, 1, 1),
(37, 'Kai', 'orci.Donec@eudoloregestas.co.uk', 'MWS79ZYJ7ED', NULL, 1, 3),
(38, 'Lara', 'ligula.consectetuer.rhoncus@metu', 'TKB96FOE7HK', NULL, 1, 3),
(39, 'Adam', 'ac@arcuac.edu', 'XTG58HDX9LD', NULL, 1, 3),
(40, 'Lesley', 'eleifend.nec.malesuada@ornareIn.', 'NXO43WCV3TH', NULL, 1, 3),
(41, 'Cadman', 'id.mollis.nec@nibh.org', 'VGE69PCI8LU', NULL, 0, 3),
(42, 'Marshall', 'augue.scelerisque@atauctor.co.uk', 'TQT58LWH9VJ', NULL, 1, 3),
(43, 'Zachery', 'sollicitudin.adipiscing.ligula@D', 'DDE73GYF6YL', NULL, 1, 2),
(44, 'Kadeem', 'lacinia.orci.consectetuer@Crasdi', 'GVL65TAH4IE', NULL, 0, 2),
(45, 'Walter', 'mauris@orciUtsagittis.edu', 'WOY21HNH3HS', NULL, 1, 2),
(46, 'Barbara', 'mi.lorem.vehicula@utpellentesque', 'UWN17UBD3CY', NULL, 0, 3),
(47, 'Brittany', 'ultricies.ligula.Nullam@tortordi', 'ABE69SQE4KL', NULL, 1, 1),
(48, 'Noelani', 'arcu.Morbi.sit@vitaesodalesnisi.', 'RJM36VZY2IG', NULL, 0, 3),
(49, 'Karly', 'scelerisque.lorem.ipsum@liberoPr', 'YGN45TSV4DI', NULL, 0, 3),
(50, 'Zeph', 'vel@nunc.net', 'RVC35VMV8XS', NULL, 0, 1),
(51, 'Ella', 'metus@dictummiac.co.uk', 'SLS50YHF9GQ', NULL, 0, 2),
(52, 'Magee', 'sapien.gravida@malesuadafames.ne', 'KVN34QGU7VX', NULL, 0, 2),
(53, 'Simone', 'nisl@semmolestiesodales.net', 'TTN91BDA6GD', NULL, 1, 3),
(54, 'Prescott', 'elit.fermentum.risus@Donecegesta', 'RZH03JKH0KH', NULL, 1, 1),
(55, 'Valentine', 'consectetuer@liberoestcongue.org', 'SVC20UBS4FJ', NULL, 0, 1),
(56, 'Felix', 'at.augue@magna.net', 'RAE05NPM9EO', NULL, 1, 3),
(57, 'Len', 'ut@non.co.uk', 'ZBT33YXV0GY', NULL, 1, 3),
(58, 'David', 'lobortis.mauris@neque.net', 'YVC35PLE6ZB', NULL, 1, 2),
(59, 'Kenneth', 'Nunc.sed.orci@milaciniamattis.co', 'LYP56TJE5HR', NULL, 1, 3),
(60, 'Vladimir', 'Fusce@quam.co.uk', 'XBU23YKI2OE', NULL, 1, 2),
(61, 'Willow', 'Praesent@Vivamuseuismod.net', 'DHM93UHB8HR', NULL, 1, 3),
(62, 'Winifred', 'nunc.nulla.vulputate@ametloremse', 'MOS87ITP3QC', NULL, 0, 3),
(63, 'Zachery', 'Quisque.porttitor.eros@pedenec.n', 'SBT21AIA5SY', NULL, 1, 3),
(64, 'Danielle', 'amet.consectetuer@quamquis.com', 'QBP24QSK2TW', NULL, 0, 3),
(65, 'Nasim', 'natoque.penatibus.et@neceleifend', 'GLV45PKJ1ZJ', NULL, 1, 3),
(66, 'Xavier', 'enim.Curabitur.massa@Ut.ca', 'DHY50LJR4JC', NULL, 0, 1),
(67, 'Jana', 'tristique.ac.eleifend@adipiscing', 'IPU41PQC4XT', NULL, 0, 1),
(68, 'Jakeem', 'magna.Phasellus.dolor@Donec.edu', 'UCY25JSR5FE', NULL, 0, 2),
(69, 'Baker', 'in@lectus.org', 'YWL04HMM0MY', NULL, 0, 3),
(70, 'Damon', 'eu.neque.pellentesque@afacilisis', 'NPW63VNL8UN', NULL, 1, 3),
(71, 'Bryar', 'tellus@eleifend.net', 'ZIK27MEZ9JS', NULL, 0, 2),
(72, 'Hoyt', 'tincidunt.Donec@erat.ca', 'KZM64DTI6WU', NULL, 1, 1),
(73, 'Hashim', 'Morbi.vehicula@sitamet.edu', 'PLH84SCV3IA', NULL, 1, 1),
(74, 'Indigo', 'ultrices@rutrumurna.com', 'ALM13NST5UX', NULL, 1, 3),
(75, 'Wang', 'Suspendisse.aliquet@vulputate.or', 'ESD75JXQ8FF', NULL, 1, 3),
(76, 'Dante', 'Cras@habitantmorbi.org', 'XQT05MVG0GN', NULL, 1, 2),
(77, 'Kalia', 'convallis@netuset.com', 'LMZ27WNQ7CP', NULL, 1, 2),
(78, 'Dana', 'Ut.semper.pretium@pede.edu', 'QLE90ILC6GX', NULL, 1, 3),
(79, 'Stella', 'gravida@accumsanconvallis.com', 'RFH72ACA4ZG', NULL, 1, 2),
(80, 'Branden', 'elit.dictum@leo.net', 'DDN31UJN2HH', NULL, 1, 2),
(81, 'Damon', 'neque.Nullam.nisl@temporbibendum', 'VKC20ZHX3NW', NULL, 0, 2),
(82, 'Callum', 'purus.ac.tellus@risusDonec.com', 'IXI71AOA1VJ', NULL, 1, 2),
(83, 'Winter', 'nisi@pellentesqueegetdictum.org', 'LYQ29OCG1OZ', NULL, 0, 2),
(84, 'Kirk', 'Maecenas@euodio.net', 'GOE02VUR3FQ', NULL, 0, 1),
(85, 'Burke', 'faucibus.orci.luctus@nibh.org', 'FKG40KHY2BD', NULL, 1, 1),
(86, 'Ivory', 'cursus@sitamet.edu', 'TKT28MZQ1SD', NULL, 0, 3),
(87, 'Lillith', 'Phasellus.elit@In.edu', 'QUP84AEV3OB', NULL, 1, 3),
(88, 'Whilemina', 'in.faucibus.orci@vitaealiquam.or', 'MGH52SFB0MU', NULL, 0, 1),
(89, 'Linda', 'erat@atauctorullamcorper.ca', 'ZGG09POL0VH', NULL, 0, 3),
(90, 'Halla', 'in.sodales.elit@eutempor.org', 'CBC79LIM7EO', NULL, 0, 2),
(91, 'Trevor', 'in.tempus@lobortisaugue.edu', 'WHJ26NHM7YT', NULL, 0, 1),
(92, 'Kalia', 'a.ultricies@consequatnec.edu', 'ZBK71XBZ4MP', NULL, 0, 3),
(93, 'Richard', 'penatibus.et@ametmassaQuisque.ne', 'EUX38KCI4FI', NULL, 1, 1),
(94, 'Flavia', 'volutpat.nunc.sit@massaVestibulu', 'TYF62BPL8RF', NULL, 0, 2),
(95, 'Hermione', 'justo.Praesent@pharetraQuisque.c', 'OWE02FHR9PK', NULL, 0, 1),
(96, 'Imogene', 'est@lectusNullam.edu', 'EJS12PTU0UJ', NULL, 0, 2),
(97, 'Erasmus', 'leo.elementum@etlacinia.com', 'WKJ63QTE0JI', NULL, 0, 2),
(98, 'Aphrodite', 'amet.ultricies@Aeneanegestashend', 'FEZ54PHT8JU', NULL, 0, 2),
(99, 'Cassandra', 'vel.mauris.Integer@duiFusce.co.u', 'TTA25SPW4OG', NULL, 0, 1),
(100, 'September', 'feugiat.Sed@aauctornon.ca', 'QRN30HHP9CW', NULL, 0, 1);

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
-- Table structure for table `vents`
--

CREATE TABLE `vents` (
  `ID` int(11) UNSIGNED NOT NULL,
  `temperature` int(2) DEFAULT NULL,
  `humidity` int(3) DEFAULT NULL,
  `air_properties_id` int(11) UNSIGNED NOT NULL,
  `vent_group_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `vents`
--

INSERT INTO `vents` (`ID`, `temperature`, `humidity`, `air_properties_id`, `vent_group_id`) VALUES
(1, 21, 48, 0, 1),
(2, 24, 58, 0, 2),
(3, 17, 53, 0, 3),
(4, 25, 29, 0, 4),
(5, 22, 63, 0, 5),
(6, 26, 20, 0, 6),
(7, 24, 67, 0, 7),
(8, 24, 43, 0, 8),
(9, 21, 35, 0, 9),
(10, 18, 65, 0, 10),
(11, 26, 64, 0, 11),
(12, 20, 52, 0, 12),
(13, 25, 47, 0, 13),
(14, 22, 27, 0, 14),
(15, 17, 56, 0, 15),
(16, 23, 54, 0, 16),
(17, 22, 46, 0, 17),
(18, 20, 23, 0, 18),
(19, 17, 39, 0, 19),
(20, 23, 24, 0, 20),
(21, 24, 70, 0, 21),
(22, 19, 65, 0, 22),
(23, 22, 30, 0, 23),
(24, 21, 40, 0, 24),
(25, 26, 36, 0, 25),
(26, 25, 47, 0, 26),
(27, 17, 68, 0, 27),
(28, 22, 70, 0, 28),
(29, 26, 35, 0, 29),
(30, 21, 57, 0, 30),
(31, 22, 21, 0, 31),
(32, 17, 42, 0, 32),
(33, 26, 50, 0, 33),
(34, 24, 56, 0, 34),
(35, 22, 42, 0, 35),
(36, 20, 55, 0, 36),
(37, 26, 26, 0, 37),
(38, 21, 52, 0, 38),
(39, 19, 23, 0, 39),
(40, 19, 31, 0, 40);

-- --------------------------------------------------------

--
-- Table structure for table `vent_groups`
--

CREATE TABLE `vent_groups` (
  `ID` int(11) UNSIGNED NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vent_groups`
--

INSERT INTO `vent_groups` (`ID`, `room_id`) VALUES
(10, 1),
(20, 1),
(30, 1),
(40, 1),
(1, 2),
(11, 2),
(21, 2),
(31, 2),
(2, 3),
(12, 3),
(22, 3),
(32, 3),
(3, 4),
(13, 4),
(23, 4),
(33, 4),
(4, 5),
(14, 5),
(24, 5),
(34, 5),
(5, 6),
(15, 6),
(25, 6),
(35, 6),
(6, 7),
(16, 7),
(26, 7),
(36, 7),
(7, 8),
(17, 8),
(27, 8),
(37, 8),
(8, 9),
(18, 9),
(28, 9),
(38, 9),
(9, 10),
(19, 10),
(29, 10),
(39, 10);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `change_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `is_approved` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_users`
-- (See below for the actual view)
--
CREATE TABLE `v_users` (
`ID` int(11) unsigned
,`name` varchar(64)
,`vent_id` int(11) unsigned
,`room_id` int(11) unsigned
,`user_role_id` int(3) unsigned
,`user_role` varchar(32)
,`logged_in` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_vents`
-- (See below for the actual view)
--
CREATE TABLE `v_vents` (
`ID` int(11) unsigned
,`vent_group_id` int(11) unsigned
,`room_id` int(11) unsigned
,`user_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `v_users`
--
DROP TABLE IF EXISTS `v_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_users`  AS  select `a`.`ID` AS `ID`,`a`.`name` AS `name`,`a`.`vent_id` AS `vent_id`,`d`.`room_id` AS `room_id`,`a`.`user_role_id` AS `user_role_id`,`b`.`name` AS `user_role`,`a`.`logged_in` AS `logged_in` from (((`users` `a` left join `user_roles` `b` on((`a`.`user_role_id` = `b`.`ID`))) left join `vents` `c` on((`a`.`vent_id` = `c`.`ID`))) left join `vent_groups` `d` on((`c`.`vent_group_id` = `d`.`ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_vents`
--
DROP TABLE IF EXISTS `v_vents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_vents`  AS  select `a`.`ID` AS `ID`,`a`.`vent_group_id` AS `vent_group_id`,`b`.`room_id` AS `room_id`,(select count(0) from `users` where (`users`.`vent_id` = `a`.`ID`)) AS `user_count` from (`vents` `a` left join `vent_groups` `b` on((`a`.`vent_group_id` = `b`.`ID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `air_properties`
--
ALTER TABLE `air_properties`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `change_requests`
--
ALTER TABLE `change_requests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vent_id` (`vent_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `claim_logs`
--
ALTER TABLE `claim_logs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `vent_id` (`vent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications_queue`
--
ALTER TABLE `notifications_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification_type`
--
ALTER TABLE `notification_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `requested_changes`
--
ALTER TABLE `requested_changes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`ID`);

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
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `vent_id` (`vent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
