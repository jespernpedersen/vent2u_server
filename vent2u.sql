-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Dez-2020 às 20:10
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 5.6.39

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `claimrequests`
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
-- Estrutura da tabela `claimrequeststatus`
--

CREATE TABLE `claimrequeststatus` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `classes`
--

CREATE TABLE `classes` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `class_users`
--

CREATE TABLE `class_users` (
  `ID` int(11) UNSIGNED NOT NULL,
  `classes_id` int(11) UNSIGNED NOT NULL,
  `users_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rooms`
--

CREATE TABLE `rooms` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `grid_size` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `rooms`
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
-- Estrutura da tabela `users`
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
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `password`, `vent_id`, `logged_in`, `user_role_id`) VALUES
(1, 'Keith', 'Proin@nullaanteiaculis.org', 'SWM94EHF6PT', 5, 0, 3),
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
-- Estrutura da tabela `user_roles`
--

CREATE TABLE `user_roles` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `user_roles`
--

INSERT INTO `user_roles` (`ID`, `name`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vents`
--

CREATE TABLE `vents` (
  `ID` int(11) UNSIGNED NOT NULL,
  `temperature` int(2) DEFAULT NULL,
  `humidity` int(3) DEFAULT NULL,
  `air_properties_id` int(11) UNSIGNED NOT NULL,
  `vent_group_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `vents`
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
-- Estrutura da tabela `vent_groups`
--

CREATE TABLE `vent_groups` (
  `ID` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `room_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vent_groups`
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
-- Acionadores `vent_groups`
--
DELIMITER $$
CREATE TRIGGER `create_group_name` BEFORE INSERT ON `vent_groups` FOR EACH ROW set new.name = CONCAT('Group ', ((SELECT count(*) from vent_groups WHERE room_id = new.room_id) +1 ))
$$
DELIMITER ;

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

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vents`
--
ALTER TABLE `vents`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `vent_group_id` (`vent_group_id`);

--
-- Indexes for table `vent_groups`
--
ALTER TABLE `vent_groups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `room_id` (`room_id`);

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
-- AUTO_INCREMENT for table `vents`
--
ALTER TABLE `vents`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `vent_groups`
--
ALTER TABLE `vent_groups`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `claimrequests`
--
ALTER TABLE `claimrequests`
  ADD CONSTRAINT `claimrequests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `claimrequests_ibfk_2` FOREIGN KEY (`vent_id`) REFERENCES `vents` (`ID`),
  ADD CONSTRAINT `claimrequests_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `claimrequeststatus` (`ID`),
  ADD CONSTRAINT `claimrequests_ibfk_4` FOREIGN KEY (`approved_by_id`) REFERENCES `users` (`ID`);

--
-- Limitadores para a tabela `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`ID`);

--
-- Limitadores para a tabela `class_users`
--
ALTER TABLE `class_users`
  ADD CONSTRAINT `class_users_ibfk_1` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`ID`),
  ADD CONSTRAINT `class_users_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`ID`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`vent_id`) REFERENCES `vents` (`ID`);

--
-- Limitadores para a tabela `vents`
--
ALTER TABLE `vents`
  ADD CONSTRAINT `vents_ibfk_1` FOREIGN KEY (`vent_group_id`) REFERENCES `vent_groups` (`ID`);

--
-- Limitadores para a tabela `vent_groups`
--
ALTER TABLE `vent_groups`
  ADD CONSTRAINT `vent_groups_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
