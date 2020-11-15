-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2020 at 12:43 AM
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

--
-- Dumping data for table `presets`
--

INSERT INTO `presets` (`ID`, `name`, `temperature`, `humidity`, `user_id`) VALUES
(1, 'Thailand', 25, 49, 9),
(2, 'Vietnam', 17, 55, 10),
(3, 'Bulgaria', 15, 81, 66),
(4, 'China', 17, 62, 50),
(5, 'China', 15, 54, 75),
(6, 'China', 23, 47, 7),
(7, 'Poland', 18, 67, 90),
(8, 'Niger', 15, 70, 44),
(9, 'Philippines', 16, 77, 97),
(10, 'Greece', 22, 65, 38),
(11, 'Indonesia', 16, 62, 86),
(12, 'Czech Republic', 22, 81, 13),
(13, 'South Africa', 16, 76, 12),
(14, 'Greece', 25, 48, 10),
(15, 'Sweden', 24, 66, 93),
(16, 'China', 19, 51, 4),
(17, 'China', 18, 51, 92),
(18, 'China', 17, 62, 50),
(19, 'Mexico', 25, 69, 65),
(20, 'Philippines', 24, 59, 77),
(21, 'Nauru', 15, 71, 42),
(22, 'Croatia', 25, 72, 10),
(23, 'Czech Republic', 20, 80, 98),
(24, 'Poland', 17, 45, 89),
(25, 'Indonesia', 17, 45, 90),
(26, 'China', 26, 57, 29),
(27, 'Philippines', 16, 49, 71),
(28, 'China', 23, 65, 4),
(29, 'Thailand', 18, 78, 83),
(30, 'Slovenia', 21, 73, 51),
(31, 'Brazil', 15, 45, 82),
(32, 'Thailand', 19, 71, 78),
(33, 'France', 26, 80, 85),
(34, 'Canada', 23, 78, 7),
(35, 'Indonesia', 24, 64, 31),
(36, 'France', 18, 58, 100),
(37, 'China', 25, 70, 62),
(38, 'France', 17, 56, 13),
(39, 'Sweden', 20, 61, 17),
(40, 'Philippines', 16, 49, 85),
(41, 'Indonesia', 22, 53, 37),
(42, 'Israel', 16, 49, 23),
(43, 'China', 15, 60, 35),
(44, 'Indonesia', 25, 52, 17),
(45, 'Tajikistan', 26, 58, 34),
(46, 'Brazil', 17, 85, 35),
(47, 'China', 15, 54, 66),
(48, 'Finland', 21, 84, 47),
(49, 'Indonesia', 18, 84, 43),
(50, 'China', 23, 57, 29),
(51, 'China', 22, 60, 42),
(52, 'Japan', 15, 47, 1),
(53, 'Brazil', 20, 66, 40),
(54, 'Thailand', 22, 61, 61),
(55, 'France', 17, 84, 57),
(56, 'Portugal', 23, 48, 43),
(57, 'Mexico', 20, 50, 10),
(58, 'China', 16, 46, 11),
(59, 'China', 15, 72, 77),
(60, 'France', 19, 55, 20),
(61, 'France', 19, 49, 64),
(62, 'Philippines', 21, 66, 6),
(63, 'Poland', 18, 79, 38),
(64, 'Indonesia', 23, 78, 5),
(65, 'Russia', 25, 72, 48),
(66, 'Indonesia', 23, 53, 2),
(67, 'China', 20, 57, 37),
(68, 'China', 16, 69, 31),
(69, 'Indonesia', 19, 83, 56),
(70, 'Norway', 19, 46, 82),
(71, 'China', 16, 70, 77),
(72, 'Colombia', 19, 48, 74),
(73, 'China', 19, 81, 36),
(74, 'Indonesia', 22, 45, 47),
(75, 'Croatia', 17, 79, 76),
(76, 'China', 16, 77, 77),
(77, 'Indonesia', 25, 72, 87),
(78, 'Ukraine', 26, 48, 5),
(79, 'Philippines', 23, 60, 85),
(80, 'China', 19, 75, 18),
(81, 'Argentina', 20, 59, 30),
(82, 'Indonesia', 18, 84, 14),
(83, 'China', 15, 85, 45),
(84, 'Poland', 24, 77, 99),
(85, 'Brazil', 20, 51, 98),
(86, 'Tanzania', 18, 73, 73),
(87, 'Afghanistan', 18, 51, 39),
(88, 'Indonesia', 22, 45, 90),
(89, 'Tanzania', 19, 58, 31),
(90, 'Bahamas', 18, 55, 77),
(91, 'China', 18, 65, 52),
(92, 'Serbia', 24, 48, 24),
(93, 'Greece', 24, 57, 93),
(94, 'Costa Rica', 22, 53, 6),
(95, 'Czech Republic', 25, 77, 2),
(96, 'France', 20, 68, 61),
(97, 'Haiti', 26, 67, 96),
(98, 'Pakistan', 24, 64, 70),
(99, 'Sweden', 18, 82, 35),
(100, 'Russia', 23, 66, 5),
(101, 'Poland', 26, 78, 23),
(102, 'Japan', 16, 72, 99),
(103, 'Portugal', 20, 72, 39),
(104, 'Peru', 22, 68, 83),
(105, 'Albania', 24, 76, 95),
(106, 'China', 24, 47, 84),
(107, 'Brazil', 25, 71, 26),
(108, 'Indonesia', 21, 78, 32),
(109, 'Palestinian Territory', 25, 52, 58),
(110, 'Venezuela', 15, 71, 8),
(111, 'Guinea', 17, 82, 89),
(112, 'China', 24, 55, 38),
(113, 'France', 24, 54, 42),
(114, 'Portugal', 17, 72, 7),
(115, 'Russia', 16, 54, 81),
(116, 'Poland', 24, 60, 85),
(117, 'Peru', 17, 63, 12),
(118, 'Dominican Republic', 20, 77, 83),
(119, 'Czech Republic', 15, 58, 32),
(120, 'Thailand', 15, 73, 63),
(121, 'Japan', 20, 54, 55),
(122, 'Niger', 18, 69, 44),
(123, 'Ukraine', 17, 70, 43),
(124, 'Kyrgyzstan', 19, 75, 92),
(125, 'Portugal', 26, 78, 6),
(126, 'New Zealand', 26, 64, 84),
(127, 'Indonesia', 24, 76, 56),
(128, 'Russia', 19, 85, 43),
(129, 'Philippines', 15, 73, 90),
(130, 'Czech Republic', 16, 78, 92),
(131, 'Philippines', 15, 83, 27),
(132, 'China', 24, 56, 14),
(133, 'Croatia', 17, 50, 74),
(134, 'Ukraine', 18, 83, 28),
(135, 'Portugal', 24, 50, 8),
(136, 'Colombia', 24, 49, 14),
(137, 'Philippines', 20, 81, 42),
(138, 'Indonesia', 15, 53, 64),
(139, 'Indonesia', 25, 84, 33),
(140, 'China', 21, 60, 84),
(141, 'United States', 21, 63, 84),
(142, 'Peru', 15, 65, 61),
(143, 'Brazil', 24, 65, 21),
(144, 'Japan', 18, 82, 69),
(145, 'Tunisia', 19, 79, 31),
(146, 'Russia', 26, 60, 30),
(147, 'Kenya', 24, 77, 8),
(148, 'Philippines', 26, 46, 43),
(149, 'China', 18, 45, 29),
(150, 'Iraq', 24, 75, 7),
(151, 'China', 20, 81, 38),
(152, 'Brazil', 22, 84, 16),
(153, 'China', 17, 47, 10),
(154, 'Indonesia', 21, 50, 48),
(155, 'Japan', 17, 73, 40),
(156, 'China', 18, 52, 8),
(157, 'Albania', 25, 75, 46),
(158, 'Honduras', 23, 63, 36),
(159, 'Croatia', 24, 56, 99),
(160, 'Philippines', 26, 78, 24),
(161, 'Dominican Republic', 23, 71, 72),
(162, 'Indonesia', 17, 81, 97),
(163, 'Canada', 16, 56, 84),
(164, 'Malaysia', 18, 52, 49),
(165, 'China', 16, 64, 96),
(166, 'Russia', 17, 48, 87),
(167, 'Croatia', 22, 80, 36),
(168, 'Peru', 23, 82, 23),
(169, 'Colombia', 17, 69, 10),
(170, 'Egypt', 21, 81, 53),
(171, 'Indonesia', 21, 53, 27),
(172, 'Russia', 20, 45, 22),
(173, 'China', 22, 73, 8),
(174, 'United States', 17, 48, 38),
(175, 'Portugal', 16, 56, 84),
(176, 'Bosnia and Herzegovina', 17, 54, 46),
(177, 'Vietnam', 20, 79, 92),
(178, 'United States', 25, 64, 42),
(179, 'Sweden', 16, 83, 72),
(180, 'Canada', 19, 45, 94),
(181, 'Grenada', 24, 61, 96),
(182, 'China', 17, 73, 68),
(183, 'Ireland', 19, 69, 84),
(184, 'Bulgaria', 19, 76, 82),
(185, 'China', 24, 84, 15),
(186, 'Japan', 21, 53, 79),
(187, 'Philippines', 23, 77, 76),
(188, 'Philippines', 20, 68, 54),
(189, 'Portugal', 18, 45, 12),
(190, 'Brazil', 16, 57, 63),
(191, 'Japan', 19, 73, 30),
(192, 'Mexico', 22, 77, 49),
(193, 'Czech Republic', 21, 60, 77),
(194, 'Indonesia', 22, 62, 94),
(195, 'Indonesia', 15, 59, 20),
(196, 'Portugal', 19, 74, 37),
(197, 'Indonesia', 24, 65, 68),
(198, 'New Zealand', 15, 80, 78),
(199, 'Indonesia', 18, 76, 8),
(200, 'France', 17, 58, 41);

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
-- Table structure for table `vent_groups`
--

CREATE TABLE `vent_groups` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vent_groups`
--

INSERT INTO `vent_groups` (`ID`, `name`, `room_id`) VALUES
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
-- Triggers `vent_groups`
--
DELIMITER $$
CREATE TRIGGER `create_group_name` BEFORE INSERT ON `vent_groups` FOR EACH ROW set new.name = CONCAT('Group ', ((SELECT count(*) from vent_groups WHERE room_id = new.room_id) +1 ))
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
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `vent_group_id` int(11) UNSIGNED NOT NULL,
  `preset_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vents`
--

INSERT INTO `vents` (`ID`, `temperature`, `humidity`, `oxygen_level`, `user_id`, `vent_group_id`, `preset_id`) VALUES
(1, 17, 85, 73, NULL, 1, NULL),
(2, 26, 78, 73, NULL, 1, 125),
(3, 20, 77, 82, NULL, 2, NULL),
(4, 17, 59, 71, NULL, 2, NULL),
(5, 20, 47, 74, NULL, 2, NULL),
(6, 20, 75, 71, NULL, 2, NULL),
(7, 22, 79, 90, NULL, 3, NULL),
(8, 21, 55, 83, NULL, 3, NULL),
(9, 23, 52, 76, NULL, 3, NULL),
(10, 19, 63, 75, NULL, 3, NULL),
(11, 23, 67, 98, NULL, 4, NULL),
(12, 16, 50, 79, NULL, 4, NULL),
(13, 19, 59, 85, NULL, 4, NULL),
(14, 20, 45, 91, NULL, 4, NULL),
(15, 20, 81, 72, NULL, 5, NULL),
(16, 16, 80, 73, NULL, 5, NULL),
(17, 20, 84, 82, NULL, 5, NULL),
(18, 23, 68, 90, NULL, 5, NULL),
(19, 20, 51, 74, NULL, 6, NULL),
(20, 24, 66, 76, NULL, 6, NULL),
(21, 26, 62, 88, NULL, 6, NULL),
(22, 19, 45, 88, NULL, 6, NULL),
(23, 16, 85, 82, NULL, 7, NULL),
(24, 20, 48, 95, NULL, 7, NULL),
(25, 21, 78, 74, NULL, 7, NULL),
(26, 24, 73, 98, NULL, 7, NULL),
(27, 22, 61, 98, NULL, 8, NULL),
(28, 18, 69, 81, NULL, 8, NULL),
(29, 18, 76, 97, NULL, 8, NULL),
(30, 26, 78, 73, NULL, 8, NULL),
(31, 20, 63, 84, NULL, 9, NULL),
(32, 25, 55, 72, NULL, 9, NULL),
(33, 18, 81, 79, NULL, 9, NULL),
(34, 17, 59, 86, 5, 9, NULL),
(35, 23, 80, 76, 8, 10, NULL),
(36, 24, 69, 79, NULL, 10, NULL),
(37, 23, 85, 92, 32, 10, NULL),
(38, 26, 75, 87, NULL, 10, NULL),
(39, 18, 53, 78, NULL, 11, NULL),
(40, 25, 78, 96, NULL, 11, NULL),
(41, 21, 67, 94, 43, 11, NULL),
(42, 18, 82, 80, 27, 11, NULL),
(43, 21, 49, 97, NULL, 12, NULL),
(44, 22, 58, 95, NULL, 12, NULL),
(45, 16, 66, 78, NULL, 12, NULL),
(46, 15, 59, 89, NULL, 12, NULL),
(47, 20, 71, 93, NULL, 13, NULL),
(48, 24, 62, 95, NULL, 13, NULL),
(49, 22, 72, 98, NULL, 13, NULL),
(50, 18, 63, 90, NULL, 13, NULL),
(51, 18, 46, 82, NULL, 14, NULL),
(52, 17, 85, 75, NULL, 14, NULL),
(53, 19, 58, 71, NULL, 14, NULL),
(54, 17, 45, 91, NULL, 14, NULL),
(55, 23, 79, 95, NULL, 15, NULL),
(56, 21, 60, 83, NULL, 15, NULL),
(57, 24, 51, 77, NULL, 15, NULL),
(58, 21, 48, 79, NULL, 15, NULL),
(59, 26, 84, 95, NULL, 16, NULL),
(60, 25, 80, 90, NULL, 16, NULL),
(61, 21, 65, 78, NULL, 16, NULL),
(62, 20, 78, 74, NULL, 16, NULL),
(63, 22, 46, 75, NULL, 17, NULL),
(64, 15, 75, 74, NULL, 17, NULL),
(65, 17, 55, 96, NULL, 17, NULL),
(66, 25, 76, 92, NULL, 17, NULL),
(67, 19, 66, 79, NULL, 18, NULL),
(68, 25, 64, 83, NULL, 18, NULL),
(69, 16, 67, 96, NULL, 18, NULL),
(70, 20, 85, 93, NULL, 18, NULL),
(71, 23, 46, 79, NULL, 19, NULL),
(72, 26, 55, 86, NULL, 19, NULL),
(73, 23, 72, 94, NULL, 19, NULL),
(74, 20, 53, 84, NULL, 19, NULL),
(75, 21, 76, 86, 54, 20, NULL),
(76, 26, 84, 93, 78, 20, NULL),
(77, 19, 46, 89, 23, 20, NULL),
(78, 22, 51, 91, NULL, 20, NULL),
(79, 15, 58, 98, NULL, 21, NULL),
(80, 15, 58, 89, NULL, 21, NULL),
(81, 17, 67, 84, NULL, 21, NULL),
(82, 26, 68, 93, NULL, 21, NULL),
(83, 15, 45, 90, NULL, 22, NULL),
(84, 24, 46, 87, NULL, 22, NULL),
(85, 22, 53, 74, NULL, 22, NULL),
(86, 25, 69, 90, NULL, 22, NULL),
(87, 17, 67, 81, NULL, 23, NULL),
(88, 19, 70, 82, NULL, 23, NULL),
(89, 16, 47, 84, NULL, 23, NULL),
(90, 16, 55, 87, NULL, 23, NULL),
(91, 17, 69, 97, NULL, 24, NULL),
(92, 19, 49, 71, NULL, 24, NULL),
(93, 22, 78, 86, NULL, 24, NULL),
(94, 23, 79, 85, NULL, 24, NULL),
(95, 17, 62, 76, NULL, 25, NULL),
(96, 23, 71, 78, NULL, 25, NULL),
(97, 15, 79, 89, NULL, 25, NULL),
(98, 24, 84, 95, NULL, 25, NULL),
(99, 21, 67, 88, NULL, 26, NULL),
(100, 19, 82, 81, NULL, 26, NULL),
(101, 25, 61, 96, NULL, 26, NULL),
(102, 23, 64, 90, NULL, 26, NULL),
(103, 17, 76, 97, NULL, 27, NULL),
(104, 23, 84, 96, NULL, 27, NULL),
(105, 21, 66, 95, NULL, 27, NULL),
(106, 21, 67, 82, NULL, 27, NULL),
(107, 19, 52, 82, NULL, 28, NULL),
(108, 16, 50, 88, NULL, 28, NULL),
(109, 19, 51, 82, NULL, 28, NULL),
(110, 20, 75, 86, NULL, 28, NULL),
(111, 25, 70, 98, NULL, 29, NULL),
(112, 19, 59, 93, NULL, 29, NULL),
(113, 24, 52, 77, NULL, 29, NULL),
(114, 23, 54, 88, NULL, 29, NULL),
(115, 25, 80, 78, NULL, 30, NULL),
(116, 19, 47, 75, NULL, 30, NULL),
(117, 16, 78, 84, NULL, 30, NULL),
(118, 24, 48, 83, NULL, 30, NULL),
(119, 15, 51, 86, NULL, 31, NULL),
(120, 18, 58, 74, NULL, 31, NULL),
(121, 17, 81, 79, NULL, 31, NULL),
(122, 19, 61, 73, NULL, 31, NULL),
(123, 23, 50, 86, NULL, 32, NULL),
(124, 26, 71, 83, NULL, 32, NULL),
(125, 21, 51, 97, NULL, 32, NULL),
(126, 23, 56, 76, NULL, 32, NULL),
(127, 18, 82, 77, NULL, 33, NULL),
(128, 21, 63, 80, NULL, 33, NULL),
(129, 16, 62, 83, NULL, 33, NULL),
(130, 21, 68, 81, NULL, 33, NULL),
(131, 17, 62, 86, NULL, 34, NULL),
(132, 24, 66, 97, NULL, 34, NULL),
(133, 19, 64, 73, NULL, 34, NULL),
(134, 16, 60, 88, NULL, 34, NULL),
(135, 23, 60, 93, NULL, 35, NULL),
(136, 25, 60, 85, NULL, 35, NULL),
(137, 17, 49, 73, NULL, 35, NULL),
(138, 19, 52, 95, NULL, 35, NULL),
(139, 18, 74, 85, NULL, 36, NULL),
(140, 21, 83, 90, NULL, 36, NULL),
(141, 15, 70, 73, NULL, 36, NULL),
(142, 24, 45, 73, NULL, 36, NULL),
(143, 18, 67, 71, NULL, 37, NULL),
(144, 23, 55, 88, NULL, 37, NULL),
(145, 22, 77, 88, NULL, 37, NULL),
(146, 26, 51, 88, NULL, 37, NULL),
(147, 20, 54, 72, NULL, 38, NULL),
(148, 20, 83, 94, NULL, 38, NULL),
(149, 20, 52, 80, NULL, 38, NULL),
(150, 20, 66, 93, NULL, 38, NULL),
(151, 18, 47, 72, NULL, 39, NULL),
(152, 15, 53, 91, NULL, 39, NULL),
(153, 21, 76, 86, NULL, 39, NULL),
(154, 15, 74, 85, NULL, 39, NULL),
(155, 18, 69, 83, NULL, 40, NULL),
(156, 16, 61, 90, NULL, 40, NULL),
(157, 19, 76, 85, NULL, 40, NULL),
(158, 19, 76, 75, NULL, 40, NULL);

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
-- Indexes for table `vent_groups`
--
ALTER TABLE `vent_groups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `vents`
--
ALTER TABLE `vents`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD UNIQUE KEY `user_id_3` (`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vent_group_id` (`vent_group_id`),
  ADD KEY `preset_id` (`preset_id`);

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
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

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
-- AUTO_INCREMENT for table `vent_groups`
--
ALTER TABLE `vent_groups`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `vents`
--
ALTER TABLE `vents`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

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
-- Constraints for table `vent_groups`
--
ALTER TABLE `vent_groups`
  ADD CONSTRAINT `vent_groups_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`ID`);

--
-- Constraints for table `vents`
--
ALTER TABLE `vents`
  ADD CONSTRAINT `vents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `vents_ibfk_2` FOREIGN KEY (`vent_group_id`) REFERENCES `vent_groups` (`ID`),
  ADD CONSTRAINT `vents_ibfk_3` FOREIGN KEY (`preset_id`) REFERENCES `presets` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
