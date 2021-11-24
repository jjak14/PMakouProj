-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour cicool
CREATE DATABASE IF NOT EXISTS `cicool` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cicool`;

-- Listage de la structure de la table cicool. aauth_groups
CREATE TABLE IF NOT EXISTS `aauth_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_groups : 4 rows
DELETE FROM `aauth_groups`;
/*!40000 ALTER TABLE `aauth_groups` DISABLE KEYS */;
INSERT INTO `aauth_groups` (`id`, `name`, `definition`) VALUES
	(1, 'Admin', 'Superadmin Group'),
	(2, 'Membre_de_famille', 'Membre de famille'),
	(3, 'Default', 'Default Access Group'),
	(4, 'Chef_de_Famille', 'Chef de familles');
/*!40000 ALTER TABLE `aauth_groups` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_group_to_group
CREATE TABLE IF NOT EXISTS `aauth_group_to_group` (
  `group_id` int(10) unsigned NOT NULL,
  `subgroup_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`subgroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_group_to_group : 0 rows
DELETE FROM `aauth_group_to_group`;
/*!40000 ALTER TABLE `aauth_group_to_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `aauth_group_to_group` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_login_attempts
CREATE TABLE IF NOT EXISTS `aauth_login_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(39) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_login_attempts : 0 rows
DELETE FROM `aauth_login_attempts`;
/*!40000 ALTER TABLE `aauth_login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aauth_login_attempts` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_perms
CREATE TABLE IF NOT EXISTS `aauth_perms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_perms : 135 rows
DELETE FROM `aauth_perms`;
/*!40000 ALTER TABLE `aauth_perms` DISABLE KEYS */;
INSERT INTO `aauth_perms` (`id`, `name`, `definition`) VALUES
	(1, 'menu_dashboard', NULL),
	(2, 'menu_crud_builder', NULL),
	(3, 'menu_api_builder', NULL),
	(4, 'menu_page_builder', NULL),
	(5, 'menu_form_builder', NULL),
	(6, 'menu_menu', NULL),
	(7, 'menu_auth', NULL),
	(8, 'menu_user', NULL),
	(9, 'menu_group', NULL),
	(10, 'menu_access', NULL),
	(11, 'menu_permission', NULL),
	(12, 'menu_api_documentation', NULL),
	(13, 'menu_web_documentation', NULL),
	(14, 'menu_settings', NULL),
	(15, 'user_list', NULL),
	(16, 'user_update_status', NULL),
	(17, 'user_export', NULL),
	(18, 'user_add', NULL),
	(19, 'user_update', NULL),
	(20, 'user_update_profile', NULL),
	(21, 'user_update_password', NULL),
	(22, 'user_profile', NULL),
	(23, 'user_view', NULL),
	(24, 'user_delete', NULL),
	(25, 'blog_list', NULL),
	(26, 'blog_export', NULL),
	(27, 'blog_add', NULL),
	(28, 'blog_update', NULL),
	(29, 'blog_view', NULL),
	(30, 'blog_delete', NULL),
	(31, 'form_list', NULL),
	(32, 'form_export', NULL),
	(33, 'form_add', NULL),
	(34, 'form_update', NULL),
	(35, 'form_view', NULL),
	(36, 'form_manage', NULL),
	(37, 'form_delete', NULL),
	(38, 'crud_list', NULL),
	(39, 'crud_export', NULL),
	(40, 'crud_add', NULL),
	(41, 'crud_update', NULL),
	(42, 'crud_view', NULL),
	(43, 'crud_delete', NULL),
	(44, 'rest_list', NULL),
	(45, 'rest_export', NULL),
	(46, 'rest_add', NULL),
	(47, 'rest_update', NULL),
	(48, 'rest_view', NULL),
	(49, 'rest_delete', NULL),
	(50, 'group_list', NULL),
	(51, 'group_export', NULL),
	(52, 'group_add', NULL),
	(53, 'group_update', NULL),
	(54, 'group_view', NULL),
	(55, 'group_delete', NULL),
	(56, 'permission_list', NULL),
	(57, 'permission_export', NULL),
	(58, 'permission_add', NULL),
	(59, 'permission_update', NULL),
	(60, 'permission_view', NULL),
	(61, 'permission_delete', NULL),
	(62, 'access_list', NULL),
	(63, 'access_add', NULL),
	(64, 'access_update', NULL),
	(65, 'menu_list', NULL),
	(66, 'menu_add', NULL),
	(67, 'menu_update', NULL),
	(68, 'menu_delete', NULL),
	(69, 'menu_save_ordering', NULL),
	(70, 'menu_type_add', NULL),
	(71, 'page_list', NULL),
	(72, 'page_export', NULL),
	(73, 'page_add', NULL),
	(74, 'page_update', NULL),
	(75, 'page_view', NULL),
	(76, 'page_delete', NULL),
	(77, 'blog_list', NULL),
	(78, 'blog_export', NULL),
	(79, 'blog_add', NULL),
	(80, 'blog_update', NULL),
	(81, 'blog_view', NULL),
	(82, 'blog_delete', NULL),
	(83, 'setting', NULL),
	(84, 'setting_update', NULL),
	(85, 'dashboard', NULL),
	(86, 'extension_list', NULL),
	(87, 'extension_activate', NULL),
	(88, 'extension_deactivate', NULL),
	(89, 'database_list', ''),
	(90, 'famille_add', ''),
	(91, 'famille_update', ''),
	(92, 'famille_view', ''),
	(93, 'famille_delete', ''),
	(94, 'famille_list', ''),
	(139, 'gestionevenement_view', ''),
	(138, 'gestionevenement_update', ''),
	(137, 'gestionevenement_add', ''),
	(100, 'page_detail', ''),
	(101, 'menu_familles', ''),
	(102, 'menu_familles8', ''),
	(103, 'database_add', ''),
	(104, 'extension_add', ''),
	(105, 'menu_evenements', ''),
	(106, 'menu_utilisateurs', ''),
	(107, 'menu_permissions', ''),
	(108, 'menu_groups', ''),
	(109, 'menu_listes_des_familles', ''),
	(110, 'menu_gestion_des_familles', ''),
	(111, 'menu_gestions_des_evenements', ''),
	(112, 'menu_liste_des_evenements', ''),
	(113, 'menu_arbre-genealogique', ''),
	(114, 'menu_liste_des_familles', ''),
	(115, 'permission_edit', ''),
	(116, 'keys_list', ''),
	(117, 'database_update', ''),
	(118, 'menu_accueil', ''),
	(119, 'menu_arbre_généalogique', ''),
	(120, 'menu_a_propos_de_nous', ''),
	(121, 'database_view', ''),
	(122, 'menu_gestion_de_la_gall', ''),
	(123, 'gallerie_add', ''),
	(124, 'gallerie_update', ''),
	(125, 'gallerie_view', ''),
	(126, 'gallerie_delete', ''),
	(127, 'gallerie_list', ''),
	(128, 'menu_gestion_de_la_gall', ''),
	(129, 'gallerie_export', ''),
	(130, 'arbregenealogique_add', ''),
	(131, 'arbregenealogique_update', ''),
	(132, 'arbregenealogique_view', ''),
	(133, 'arbregenealogique_delete', ''),
	(134, 'arbregenealogique_list', ''),
	(135, 'arbregenealogique_export', ''),
	(136, 'evenement_export', ''),
	(140, 'gestionevenement_delete', ''),
	(141, 'gestionevenement_list', ''),
	(142, 'menu_gestion_evenement', ''),
	(143, 'menu_evenement', '');
/*!40000 ALTER TABLE `aauth_perms` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_perm_to_group
CREATE TABLE IF NOT EXISTS `aauth_perm_to_group` (
  `perm_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_perm_to_group : 164 rows
DELETE FROM `aauth_perm_to_group`;
/*!40000 ALTER TABLE `aauth_perm_to_group` DISABLE KEYS */;
INSERT INTO `aauth_perm_to_group` (`perm_id`, `group_id`) VALUES
	(136, 1),
	(135, 1),
	(134, 1),
	(133, 1),
	(132, 1),
	(131, 1),
	(130, 1),
	(129, 1),
	(127, 1),
	(126, 1),
	(123, 4),
	(141, 4),
	(140, 4),
	(137, 4),
	(138, 4),
	(139, 4),
	(94, 4),
	(93, 4),
	(92, 4),
	(91, 4),
	(90, 4),
	(85, 4),
	(82, 4),
	(81, 4),
	(80, 4),
	(79, 4),
	(125, 1),
	(124, 1),
	(123, 1),
	(116, 1),
	(141, 1),
	(140, 1),
	(137, 1),
	(138, 1),
	(139, 1),
	(94, 1),
	(93, 1),
	(92, 1),
	(91, 1),
	(90, 1),
	(121, 1),
	(117, 1),
	(78, 4),
	(112, 3),
	(103, 1),
	(77, 4),
	(111, 3),
	(89, 1),
	(30, 4),
	(104, 1),
	(29, 4),
	(88, 1),
	(129, 2),
	(127, 2),
	(126, 2),
	(28, 4),
	(27, 4),
	(26, 4),
	(25, 4),
	(143, 4),
	(142, 4),
	(122, 4),
	(125, 2),
	(124, 2),
	(123, 2),
	(94, 2),
	(92, 2),
	(85, 2),
	(87, 1),
	(86, 1),
	(85, 1),
	(84, 1),
	(83, 1),
	(100, 1),
	(76, 1),
	(75, 1),
	(74, 1),
	(73, 1),
	(72, 1),
	(71, 1),
	(64, 1),
	(63, 1),
	(62, 1),
	(115, 1),
	(61, 1),
	(60, 1),
	(59, 1),
	(58, 1),
	(57, 1),
	(56, 1),
	(55, 1),
	(54, 1),
	(53, 1),
	(52, 1),
	(51, 1),
	(50, 1),
	(49, 1),
	(48, 1),
	(47, 1),
	(46, 1),
	(45, 1),
	(44, 1),
	(43, 1),
	(42, 1),
	(41, 1),
	(40, 1),
	(39, 1),
	(38, 1),
	(37, 1),
	(36, 1),
	(35, 1),
	(34, 1),
	(33, 1),
	(32, 1),
	(31, 1),
	(82, 1),
	(81, 1),
	(80, 1),
	(79, 1),
	(78, 1),
	(77, 1),
	(30, 1),
	(29, 1),
	(28, 1),
	(27, 1),
	(26, 1),
	(25, 1),
	(24, 1),
	(23, 1),
	(22, 1),
	(21, 1),
	(20, 1),
	(19, 1),
	(18, 1),
	(17, 1),
	(16, 1),
	(15, 1),
	(143, 1),
	(142, 1),
	(128, 1),
	(122, 1),
	(120, 1),
	(119, 1),
	(118, 1),
	(114, 1),
	(113, 1),
	(112, 1),
	(111, 1),
	(110, 1),
	(109, 1),
	(119, 4),
	(112, 4),
	(111, 4),
	(143, 2),
	(122, 2),
	(108, 1),
	(119, 2),
	(122, 3),
	(110, 4),
	(107, 1),
	(105, 2),
	(119, 3),
	(109, 4),
	(101, 2),
	(106, 1),
	(105, 1),
	(102, 1),
	(101, 1),
	(70, 1),
	(69, 1),
	(68, 1),
	(67, 1),
	(66, 1),
	(65, 1),
	(14, 1),
	(13, 1),
	(12, 1),
	(11, 1),
	(10, 1),
	(9, 1),
	(8, 1),
	(7, 1),
	(6, 1),
	(5, 1),
	(4, 1),
	(3, 1),
	(2, 1),
	(105, 4),
	(1, 1),
	(1, 2),
	(143, 3),
	(101, 4),
	(1, 4),
	(124, 4),
	(125, 4),
	(126, 4),
	(127, 4),
	(129, 4),
	(136, 4);
/*!40000 ALTER TABLE `aauth_perm_to_group` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_perm_to_user
CREATE TABLE IF NOT EXISTS `aauth_perm_to_user` (
  `perm_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`perm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_perm_to_user : 0 rows
DELETE FROM `aauth_perm_to_user`;
/*!40000 ALTER TABLE `aauth_perm_to_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `aauth_perm_to_user` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_pms
CREATE TABLE IF NOT EXISTS `aauth_pms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `receiver_id` int(10) unsigned NOT NULL,
  `title` varchar(225) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(11) DEFAULT NULL,
  `pm_deleted_receiver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_pms : 0 rows
DELETE FROM `aauth_pms`;
/*!40000 ALTER TABLE `aauth_pms` DISABLE KEYS */;
/*!40000 ALTER TABLE `aauth_pms` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_user
CREATE TABLE IF NOT EXISTS `aauth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_user : 0 rows
DELETE FROM `aauth_user`;
/*!40000 ALTER TABLE `aauth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `aauth_user` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_users
CREATE TABLE IF NOT EXISTS `aauth_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `oauth_uid` text,
  `oauth_provider` varchar(100) DEFAULT NULL,
  `pass` varchar(64) NOT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `avatar` text NOT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `top_secret` varchar(16) DEFAULT NULL,
  `ip_address` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_users : 4 rows
DELETE FROM `aauth_users`;
/*!40000 ALTER TABLE `aauth_users` DISABLE KEYS */;
INSERT INTO `aauth_users` (`id`, `email`, `oauth_uid`, `oauth_provider`, `pass`, `username`, `full_name`, `avatar`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `top_secret`, `ip_address`) VALUES
	(1, 'larryjakam@gmail.com', NULL, NULL, 'b5c56a7a576509eb4933502ac81584e0a15b84f49cd274dc470273572f65d2db', 'larryjakam', 'larryjakam', '', 0, '2021-11-24 00:04:12', '2021-11-24 00:04:12', '2021-10-15 20:11:01', NULL, '2021-10-20 00:00:00', 'cCNBufr9Ug6z50t2', NULL, NULL, '127.0.0.1'),
	(2, 'julesndanga@gmail.com', NULL, NULL, '7b8df0acdf9cc25241cc668229e0cb3f34075a70dbda7aaed41d2b15ebed2241', 'Jules', 'jules Ndanga', 'default.png', 0, '2021-11-23 22:32:16', '2021-11-23 22:32:16', '2021-10-16 03:14:26', NULL, NULL, NULL, NULL, NULL, '127.0.0.1'),
	(4, 'jurgen@gmail.com', NULL, NULL, 'ab7e917b4b031c5aaa3b92ee8d432f12f4b975ca14acca4438c024ea3aed7959', 'Jurgen', 'jurgen', 'default.png', 0, '2021-11-23 22:33:36', '2021-11-23 22:33:36', '2021-10-16 13:30:08', NULL, NULL, NULL, NULL, NULL, '127.0.0.1'),
	(6, 'roland@gmail.com', NULL, NULL, '39f5e1361a2aa0b19e9577cb35cb61bf450b669d4191f0d57f52e72e5500d9e7', 'Roland', 'roland test', 'default.png', 0, '2021-11-15 20:57:05', '2021-11-15 20:57:05', '2021-11-15 20:56:41', NULL, NULL, NULL, NULL, NULL, '::1'),
	(7, 'admin@test.com', NULL, NULL, '54fa55a9666411cb48c3bf273e90a98c31bbb18685cf146e56566bd7d8ddc0bc', 'administrateurtest', 'admin admin', 'default.png', 0, NULL, NULL, '2021-11-23 23:11:48', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'chef@test.com', NULL, NULL, '94fc7468a65e664314dbdb188930989cfa0aa2a94edb8591dc641449df2c8714', 'chefsfam', 'chefs des familles test', 'default.png', 0, NULL, NULL, '2021-11-23 23:14:33', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'membre@test.com', NULL, NULL, '5b2b2ca9b5e7bf437b55a21a4b00c3074f7bf5a01f000fed1192ab99255fd42e', 'membresfam', 'membres familles test', 'default.png', 0, NULL, NULL, '2021-11-23 23:15:52', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `aauth_users` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_user_to_group
CREATE TABLE IF NOT EXISTS `aauth_user_to_group` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_user_to_group : 10 rows
DELETE FROM `aauth_user_to_group`;
/*!40000 ALTER TABLE `aauth_user_to_group` DISABLE KEYS */;
INSERT INTO `aauth_user_to_group` (`user_id`, `group_id`) VALUES
	(1, 1),
	(1, 3),
	(2, 4),
	(3, 2),
	(3, 3),
	(4, 2),
	(5, 2),
	(5, 3),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 3),
	(8, 3),
	(8, 4),
	(9, 2),
	(9, 3);
/*!40000 ALTER TABLE `aauth_user_to_group` ENABLE KEYS */;

-- Listage de la structure de la table cicool. aauth_user_variables
CREATE TABLE IF NOT EXISTS `aauth_user_variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.aauth_user_variables : 0 rows
DELETE FROM `aauth_user_variables`;
/*!40000 ALTER TABLE `aauth_user_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `aauth_user_variables` ENABLE KEYS */;

-- Listage de la structure de la table cicool. arbre genealoqique
IF NOT EXISTS ;

-- Listage des données de la table cicool.arbre genealoqique : 0 rows
DELETE FROM `arbre genealoqique`;
/*!40000 ALTER TABLE `arbre genealoqique` DISABLE KEYS */;
-- Listage de la structure de la table cicool. arbregenealogique
CREATE TABLE IF NOT EXISTS `arbregenealogique` (
  `idArbre` int(11) NOT NULL AUTO_INCREMENT,
  `nomCouple` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`idArbre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table cicool.arbregenealogique : 0 rows
DELETE FROM `arbregenealogique`;
/*!40000 ALTER TABLE `arbregenealogique` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbregenealogique` ENABLE KEYS */;

-- Listage de la structure de la table cicool. blog
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `tags` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL,
  `author` varchar(100) NOT NULL,
  `viewers` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.blog : 1 rows
DELETE FROM `blog`;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`id`, `title`, `slug`, `content`, `image`, `tags`, `category`, `status`, `author`, `viewers`, `created_at`, `updated_at`) VALUES
	(1, 'Hello Wellcome To Cicool Builder', 'Hello-Wellcome-To-Ciool-Builder', 'greetings from our team I hope to be happy! ', 'wellcome.jpg', 'greetings', '1', 'publish', 'admin', 4, '2021-10-15 20:11:01', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- Listage de la structure de la table cicool. blog_category
IF NOT EXISTS ;

-- Listage des données de la table cicool.blog_category : 2 rows
DELETE FROM `blog_category`;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
-- Listage de la structure de la table cicool. captcha
CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(11) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.captcha : 1 rows
DELETE FROM `captcha`;
/*!40000 ALTER TABLE `captcha` DISABLE KEYS */;
INSERT INTO `captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
	(2, 1637071039, '127.0.0.1', 'CD3A');
/*!40000 ALTER TABLE `captcha` ENABLE KEYS */;

-- Listage de la structure de la table cicool. cc_options
CREATE TABLE IF NOT EXISTS `cc_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.cc_options : 18 rows
DELETE FROM `cc_options`;
/*!40000 ALTER TABLE `cc_options` DISABLE KEYS */;
INSERT INTO `cc_options` (`id`, `option_name`, `option_value`) VALUES
	(1, 'enable_crud_builder', NULL),
	(2, 'enable_form_builder', NULL),
	(3, 'enable_page_builder', NULL),
	(4, 'enable_disqus', '1'),
	(5, 'disqus_id', ''),
	(6, 'site_name', 'Peuh_Makoundjou'),
	(7, 'email', 'larryjakam@gmail.com'),
	(8, 'author', ''),
	(9, 'site_description', 'Site de famille présentant les arbres généalogiques'),
	(10, 'keywords', ''),
	(11, 'landing_page_id', 'login'),
	(12, 'timezone', 'Africa/Douala'),
	(13, 'active_theme', 'cicool'),
	(14, 'limit_pagination', '10'),
	(15, 'google_id', ''),
	(16, 'google_secret', ''),
	(17, 'logo', 'logo.png'),
	(18, 'enable_api_builder', NULL);
/*!40000 ALTER TABLE `cc_options` ENABLE KEYS */;

-- Listage de la structure de la table cicool. cc_session
CREATE TABLE IF NOT EXISTS `cc_session` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.cc_session : 0 rows
DELETE FROM `cc_session`;
/*!40000 ALTER TABLE `cc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_session` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud
CREATE TABLE IF NOT EXISTS `crud` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `page_read` varchar(20) DEFAULT NULL,
  `page_create` varchar(20) DEFAULT NULL,
  `page_update` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud : 4 rows
DELETE FROM `crud`;
/*!40000 ALTER TABLE `crud` DISABLE KEYS */;
INSERT INTO `crud` (`id`, `title`, `subject`, `table_name`, `primary_key`, `page_read`, `page_create`, `page_update`) VALUES
	(1, 'Famille', 'Famille', 'famille', 'idFamille', 'yes', 'yes', 'yes'),
	(5, 'Gestionevenement', 'Gestionevenement', 'gestionevenement', 'id', 'yes', 'yes', 'yes'),
	(3, 'Gallerie', 'Gallerie', 'gallerie', 'idGallerie', 'yes', 'yes', 'yes'),
	(4, 'Arbregenealogique', 'Arbregenealogique', 'arbregenealogique', 'idArbre', 'yes', 'yes', 'yes');
/*!40000 ALTER TABLE `crud` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_custom_option
CREATE TABLE IF NOT EXISTS `crud_custom_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_custom_option : 0 rows
DELETE FROM `crud_custom_option`;
/*!40000 ALTER TABLE `crud_custom_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `crud_custom_option` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_field
CREATE TABLE IF NOT EXISTS `crud_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_id` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `input_type` varchar(200) NOT NULL,
  `show_column` varchar(10) DEFAULT NULL,
  `show_add_form` varchar(10) DEFAULT NULL,
  `show_update_form` varchar(10) DEFAULT NULL,
  `show_detail_page` varchar(10) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_field : 17 rows
DELETE FROM `crud_field`;
/*!40000 ALTER TABLE `crud_field` DISABLE KEYS */;
INSERT INTO `crud_field` (`id`, `crud_id`, `field_name`, `field_label`, `input_type`, `show_column`, `show_add_form`, `show_update_form`, `show_detail_page`, `sort`, `relation_table`, `relation_value`, `relation_label`) VALUES
	(1, 1, 'idFamille', 'idFamille', 'number', '', '', '', 'yes', 1, '', '', ''),
	(2, 1, 'nomFamille', 'nomFamille', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
	(3, 1, 'nombreEnfant', 'nombreEnfant', 'number', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
	(4, 1, 'descriptionFamille', 'descriptionFamille', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
	(5, 1, 'dateMarriage', 'dateMarriage', 'date', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
	(6, 1, 'adresse', 'adresse', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
	(16, 2, 'dateCreation', 'dateCreation', 'datetime', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
	(15, 2, 'dateEvent', 'dateEvent', 'date', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
	(14, 2, 'description', 'description', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
	(13, 2, 'titreEvent', 'titreEvent', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
	(12, 2, 'idEvent', 'idEvent', 'number', '', '', '', 'yes', 1, '', '', ''),
	(17, 3, 'idGallerie', 'idGallerie', 'number', '', '', '', 'yes', 1, '', '', ''),
	(18, 3, 'photos', 'photos', 'file', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
	(19, 3, 'datePublication', 'datePublication', 'datetime', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
	(20, 4, 'idArbre', 'idArbre', 'number', '', '', '', 'yes', 1, '', '', ''),
	(21, 4, 'nomCouple', 'nomCouple', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
	(22, 4, 'role', 'role', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
	(23, 5, 'id', 'id', 'number', '', '', '', 'yes', 1, '', '', ''),
	(24, 5, 'Titre', 'Titre', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
	(25, 5, 'Description', 'Description', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
	(26, 5, 'photo', 'photo', 'file', 'yes', 'yes', 'yes', 'yes', 4, '', '', '');
/*!40000 ALTER TABLE `crud_field` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_field_configuration
CREATE TABLE IF NOT EXISTS `crud_field_configuration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `group_config` varchar(200) NOT NULL,
  `config_name` text NOT NULL,
  `config_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_field_configuration : 0 rows
DELETE FROM `crud_field_configuration`;
/*!40000 ALTER TABLE `crud_field_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `crud_field_configuration` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_field_validation
CREATE TABLE IF NOT EXISTS `crud_field_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_field_validation : 17 rows
DELETE FROM `crud_field_validation`;
/*!40000 ALTER TABLE `crud_field_validation` DISABLE KEYS */;
INSERT INTO `crud_field_validation` (`id`, `crud_field_id`, `crud_id`, `validation_name`, `validation_value`) VALUES
	(1, 2, 1, 'required', ''),
	(2, 2, 1, 'max_length', '255'),
	(3, 3, 1, 'required', ''),
	(4, 4, 1, 'required', ''),
	(5, 5, 1, 'required', ''),
	(6, 6, 1, 'required', ''),
	(15, 15, 2, 'required', ''),
	(14, 14, 2, 'required', ''),
	(13, 13, 2, 'max_length', '255'),
	(12, 13, 2, 'required', ''),
	(16, 16, 2, 'required', ''),
	(17, 18, 3, 'required', ''),
	(18, 19, 3, 'required', ''),
	(19, 21, 4, 'required', ''),
	(20, 21, 4, 'max_length', '255'),
	(21, 22, 4, 'required', ''),
	(22, 22, 4, 'max_length', '30'),
	(23, 24, 5, 'required', ''),
	(24, 24, 5, 'max_length', '255'),
	(25, 25, 5, 'required', ''),
	(26, 26, 5, 'required', '');
/*!40000 ALTER TABLE `crud_field_validation` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_input_chained
CREATE TABLE IF NOT EXISTS `crud_input_chained` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chain_field` varchar(250) DEFAULT NULL,
  `chain_field_eq` varchar(250) DEFAULT NULL,
  `crud_field_id` int(11) DEFAULT NULL,
  `crud_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_input_chained : 0 rows
DELETE FROM `crud_input_chained`;
/*!40000 ALTER TABLE `crud_input_chained` DISABLE KEYS */;
/*!40000 ALTER TABLE `crud_input_chained` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_input_type
CREATE TABLE IF NOT EXISTS `crud_input_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `custom_value` int(11) NOT NULL,
  `validation_group` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_input_type : 27 rows
DELETE FROM `crud_input_type`;
/*!40000 ALTER TABLE `crud_input_type` DISABLE KEYS */;
INSERT INTO `crud_input_type` (`id`, `type`, `relation`, `custom_value`, `validation_group`) VALUES
	(1, 'input', '0', 0, 'input'),
	(2, 'textarea', '0', 0, 'text'),
	(3, 'select', '1', 0, 'select'),
	(4, 'editor_wysiwyg', '0', 0, 'editor'),
	(5, 'password', '0', 0, 'password'),
	(6, 'email', '0', 0, 'email'),
	(7, 'address_map', '0', 0, 'address_map'),
	(8, 'file', '0', 0, 'file'),
	(9, 'file_multiple', '0', 0, 'file_multiple'),
	(10, 'datetime', '0', 0, 'datetime'),
	(11, 'date', '0', 0, 'date'),
	(12, 'timestamp', '0', 0, 'timestamp'),
	(13, 'number', '0', 0, 'number'),
	(14, 'yes_no', '0', 0, 'yes_no'),
	(15, 'time', '0', 0, 'time'),
	(16, 'year', '0', 0, 'year'),
	(17, 'select_multiple', '1', 0, 'select_multiple'),
	(18, 'checkboxes', '1', 0, 'checkboxes'),
	(19, 'options', '1', 0, 'options'),
	(20, 'true_false', '0', 0, 'true_false'),
	(21, 'current_user_username', '0', 0, 'user_username'),
	(22, 'current_user_id', '0', 0, 'current_user_id'),
	(23, 'custom_option', '0', 1, 'custom_option'),
	(24, 'custom_checkbox', '0', 1, 'custom_checkbox'),
	(25, 'custom_select_multiple', '0', 1, 'custom_select_multiple'),
	(26, 'custom_select', '0', 1, 'custom_select'),
	(27, 'chained', '1', 0, 'chained');
/*!40000 ALTER TABLE `crud_input_type` ENABLE KEYS */;

-- Listage de la structure de la table cicool. crud_input_validation
CREATE TABLE IF NOT EXISTS `crud_input_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `validation` varchar(200) NOT NULL,
  `input_able` varchar(20) NOT NULL,
  `group_input` text NOT NULL,
  `input_placeholder` text NOT NULL,
  `call_back` varchar(10) NOT NULL,
  `input_validation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.crud_input_validation : 37 rows
DELETE FROM `crud_input_validation`;
/*!40000 ALTER TABLE `crud_input_validation` DISABLE KEYS */;
INSERT INTO `crud_input_validation` (`id`, `validation`, `input_able`, `group_input`, `input_placeholder`, `call_back`, `input_validation`) VALUES
	(1, 'required', 'no', 'input, file, number, text, datetime, select, password, email, editor, date, yes_no, time, year, select_multiple, options, checkboxes, true_false, address_map, custom_option, custom_checkbox, custom_select_multiple, custom_select, file_multiple, chained', '', '', ''),
	(2, 'max_length', 'yes', 'input, number, text, select, password, email, editor, yes_no, time, year, select_multiple, options, checkboxes, address_map', '', '', 'numeric'),
	(3, 'min_length', 'yes', 'input, number, text, select, password, email, editor, time, year, select_multiple, address_map', '', '', 'numeric'),
	(4, 'valid_email', 'no', 'input, email', '', '', ''),
	(5, 'valid_emails', 'no', 'input, email', '', '', ''),
	(6, 'regex', 'yes', 'input, number, text, datetime, select, password, email, editor, date, yes_no, time, year, select_multiple, options, checkboxes', '', 'yes', 'callback_valid_regex'),
	(7, 'decimal', 'no', 'input, number, text, select', '', '', ''),
	(8, 'allowed_extension', 'yes', 'file, file_multiple', 'ex : jpg,png,..', '', 'callback_valid_extension_list'),
	(9, 'max_width', 'yes', 'file, file_multiple', '', '', 'numeric'),
	(10, 'max_height', 'yes', 'file, file_multiple', '', '', 'numeric'),
	(11, 'max_size', 'yes', 'file, file_multiple', '... kb', '', 'numeric'),
	(12, 'max_item', 'yes', 'file_multiple', '', '', 'numeric'),
	(13, 'valid_url', 'no', 'input, text', '', '', ''),
	(14, 'alpha', 'no', 'input, text, select, password, editor, yes_no', '', '', ''),
	(15, 'alpha_numeric', 'no', 'input, number, text, select, password, editor', '', '', ''),
	(16, 'alpha_numeric_spaces', 'no', 'input, number, text,select, password, editor', '', '', ''),
	(17, 'valid_number', 'no', 'input, number, text, password, editor, true_false', '', 'yes', ''),
	(18, 'valid_datetime', 'no', 'input, datetime, text', '', 'yes', ''),
	(19, 'valid_date', 'no', 'input, datetime, date, text', '', 'yes', ''),
	(20, 'valid_max_selected_option', 'yes', 'select_multiple, custom_select_multiple, custom_checkbox, checkboxes', '', 'yes', 'numeric'),
	(21, 'valid_min_selected_option', 'yes', 'select_multiple, custom_select_multiple, custom_checkbox, checkboxes', '', 'yes', 'numeric'),
	(22, 'valid_alpha_numeric_spaces_underscores', 'no', 'input, text,select, password, editor', '', 'yes', ''),
	(23, 'matches', 'yes', 'input, number, text, password, email', 'any field', 'no', 'callback_valid_alpha_numeric_spaces_underscores'),
	(24, 'valid_json', 'no', 'input, text, editor', '', 'yes', ' '),
	(25, 'valid_url', 'no', 'input, text, editor', '', 'no', ' '),
	(26, 'exact_length', 'yes', 'input, text, number', '0 - 99999*', 'no', 'numeric'),
	(27, 'alpha_dash', 'no', 'input, text', '', 'no', ''),
	(28, 'integer', 'no', 'input, text, number', '', 'no', ''),
	(29, 'differs', 'yes', 'input, text, number, email, password, editor, options, select', 'any field', 'no', 'callback_valid_alpha_numeric_spaces_underscores'),
	(30, 'is_natural', 'no', 'input, text, number', '', 'no', ''),
	(31, 'is_natural_no_zero', 'no', 'input, text, number', '', 'no', ''),
	(32, 'less_than', 'yes', 'input, text, number', '', 'no', 'numeric'),
	(33, 'less_than_equal_to', 'yes', 'input, text, number', '', 'no', 'numeric'),
	(34, 'greater_than', 'yes', 'input, text, number', '', 'no', 'numeric'),
	(35, 'greater_than_equal_to', 'yes', 'input, text, number', '', 'no', 'numeric'),
	(36, 'in_list', 'yes', 'input, text, number, select, options', '', 'no', 'callback_valid_multiple_value'),
	(37, 'valid_ip', 'no', 'input, text', '', 'no', '');
/*!40000 ALTER TABLE `crud_input_validation` ENABLE KEYS */;

-- Listage de la structure de la table cicool. evenement
IF NOT EXISTS ;

-- Listage des données de la table cicool.evenement : 1 rows
DELETE FROM `evenement`;
/*!40000 ALTER TABLE `evenement` DISABLE KEYS */;
-- Listage de la structure de la table cicool. famille
CREATE TABLE IF NOT EXISTS `famille` (
  `idFamille` int(11) NOT NULL AUTO_INCREMENT,
  `nomFamille` varchar(255) NOT NULL,
  `nombreEnfant` int(11) NOT NULL,
  `descriptionFamille` text NOT NULL,
  `dateMarriage` date NOT NULL,
  `adresse` text NOT NULL,
  PRIMARY KEY (`idFamille`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table cicool.famille : 1 rows
DELETE FROM `famille`;
/*!40000 ALTER TABLE `famille` DISABLE KEYS */;
/*!40000 ALTER TABLE `famille` ENABLE KEYS */;

-- Listage de la structure de la table cicool. form
CREATE TABLE IF NOT EXISTS `form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.form : 0 rows
DELETE FROM `form`;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;

-- Listage de la structure de la table cicool. form_custom_attribute
CREATE TABLE IF NOT EXISTS `form_custom_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `attribute_value` text NOT NULL,
  `attribute_label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.form_custom_attribute : 0 rows
DELETE FROM `form_custom_attribute`;
/*!40000 ALTER TABLE `form_custom_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_custom_attribute` ENABLE KEYS */;

-- Listage de la structure de la table cicool. form_custom_option
CREATE TABLE IF NOT EXISTS `form_custom_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.form_custom_option : 0 rows
DELETE FROM `form_custom_option`;
/*!40000 ALTER TABLE `form_custom_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_custom_option` ENABLE KEYS */;

-- Listage de la structure de la table cicool. form_field
CREATE TABLE IF NOT EXISTS `form_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `input_type` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `placeholder` text,
  `auto_generate_help_block` varchar(10) DEFAULT NULL,
  `help_block` text,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.form_field : 0 rows
DELETE FROM `form_field`;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;

-- Listage de la structure de la table cicool. form_field_validation
CREATE TABLE IF NOT EXISTS `form_field_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.form_field_validation : 0 rows
DELETE FROM `form_field_validation`;
/*!40000 ALTER TABLE `form_field_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_validation` ENABLE KEYS */;

-- Listage de la structure de la table cicool. gallerie
CREATE TABLE IF NOT EXISTS `gallerie` (
  `idGallerie` int(11) NOT NULL AUTO_INCREMENT,
  `photos` text NOT NULL,
  `datePublication` datetime NOT NULL,
  PRIMARY KEY (`idGallerie`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table cicool.gallerie : 1 rows
DELETE FROM `gallerie`;
/*!40000 ALTER TABLE `gallerie` DISABLE KEYS */;
INSERT INTO `gallerie` (`idGallerie`, `photos`, `datePublication`) VALUES
	(1, '20211117124145-2021-11-17gallerie124127.jpg', '2021-11-17 13:00:00');
/*!40000 ALTER TABLE `gallerie` ENABLE KEYS */;

-- Listage de la structure de la table cicool. keys
CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL,
  `is_private_key` tinyint(1) NOT NULL,
  `ip_addresses` text,
  `date_created` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.keys : 1 rows
DELETE FROM `keys`;
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
	(1, 0, '09D3D2775957F5D6BAE0E63A22D33F5F', 0, 0, 0, NULL, '2021-10-15 20:11:01');
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;

-- Listage de la structure de la table cicool. menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `icon_color` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `menu_type_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.menu : 31 rows
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `label`, `type`, `icon_color`, `link`, `sort`, `parent`, `icon`, `menu_type_id`, `active`) VALUES
	(2, 'Dashboard', 'menu', '', '{admin_url}/dashboard', 1, 0, 'fa-dashboard', 1, 1),
	(3, 'CRUD Builder', 'menu', '', '{admin_url}/crud', 15, 14, 'fa-table', 1, 0),
	(4, 'API Builder', 'menu', '', '{admin_url}/rest', 16, 0, 'fa-code', 1, 0),
	(5, 'Page Builder', 'menu', '', '{admin_url}/page', 17, 0, 'fa-file-o', 1, 0),
	(6, 'Form Builder', 'menu', '', '{admin_url}/form', 18, 0, 'fa-newspaper-o', 1, 0),
	(7, 'Liste des familles', 'menu', 'default', 'page/familles', 5, 28, 'fa-file-text-o', 1, 1),
	(8, 'Menu', 'menu', '', '{admin_url}/menu', 19, 0, 'fa-bars', 1, 0),
	(9, 'Auth', 'menu', '', '', 13, 0, 'fa-shield', 1, 0),
	(10, 'Utilisateurs', 'menu', 'default', '{admin_url}/user', 8, 0, 'fa-street-view', 1, 1),
	(11, 'Groups', 'menu', 'default', '{admin_url}/group', 10, 0, 'fa-group', 1, 1),
	(12, 'Access', 'menu', 'default', '{admin_url}/access', 11, 0, 'fa-key', 1, 1),
	(13, 'Permissions', 'menu', 'default', '{admin_url}/permission', 12, 0, 'fa-user-secret', 1, 0),
	(14, 'API Keys', 'menu', '', '{admin_url}/keys', 14, 9, '', 1, 0),
	(15, 'Extension', 'menu', '', '{admin_url}/extension', 20, 0, 'fa-puzzle-piece', 1, 0),
	(16, 'Database', 'menu', '', '{admin_url}/database', 21, 0, 'fa-database', 1, 0),
	(17, 'OTHER', 'label', '', '', 22, 0, '', 1, 1),
	(18, 'Settings', 'menu', 'text-red', '{admin_url}/setting', 23, 0, 'fa-circle-o', 1, 1),
	(19, 'Web Documentation', 'menu', 'text-blue', '{admin_url}/doc/web', 24, 0, 'fa-circle-o', 1, 0),
	(38, 'A Propos de nous', 'menu', 'default', 'page/a-propos-de-nous', 5, 0, '', 2, 1),
	(21, 'Accueil', 'menu', 'default', '/', 1, 0, '', 2, 1),
	(23, 'Dashboard', 'menu', '', 'administrator/dashboard', 6, 0, '', 2, 0),
	(28, 'Familles', 'menu', 'default', 'administrator/famille', 3, 0, 'fa-group', 1, 1),
	(33, 'Gestion des familles', 'menu', 'default', 'administrator/famille', 4, 28, '', 1, 1),
	(44, 'Evenement', 'menu', 'default', '#', 6, 0, 'fa-calendar-minus-o', 1, 1),
	(43, 'Gestion Evenement', 'menu', 'default', 'administrator/gestionevenement', 7, 44, 'fa-calculator', 1, 1),
	(39, 'Liste des Evenements', 'menu', 'default', 'page/evenements', 4, 0, '', 2, 0),
	(37, 'Arbre Généalogique', 'menu', 'default', 'page/arbre-genealogique', 2, 0, '', 2, 1),
	(40, 'Liste des Familles', 'menu', 'default', 'page/familles', 3, 0, '', 2, 1),
	(41, 'Gestion de la gallérie', 'menu', 'default', 'administrator/gallerie', 9, 0, 'fa-camera', 1, 1),
	(42, 'Arbre Généalogique', 'menu', 'default', 'page/arbre-genealogique', 2, 0, 'fa-sitemap', 1, 1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Listage de la structure de la table cicool. menu_type
CREATE TABLE IF NOT EXISTS `menu_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.menu_type : 2 rows
DELETE FROM `menu_type`;
/*!40000 ALTER TABLE `menu_type` DISABLE KEYS */;
INSERT INTO `menu_type` (`id`, `name`, `definition`) VALUES
	(1, 'side menu', NULL),
	(2, 'top menu', NULL);
/*!40000 ALTER TABLE `menu_type` ENABLE KEYS */;

-- Listage de la structure de la table cicool. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.migrations : 1 rows
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`version`) VALUES
	(1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table cicool. page
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `fresh_content` text NOT NULL,
  `keyword` text,
  `description` text,
  `link` varchar(200) DEFAULT NULL,
  `template` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.page : 4 rows
DELETE FROM `page`;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `title`, `type`, `content`, `fresh_content`, `keyword`, `description`, `link`, `template`, `created_at`) VALUES
	(1, 'familles', 'frontend', '<cc-element cc-id="style">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/css/agency.min.css" rel="stylesheet">\n</cc-element>\n\n<cc-element cc-id="content">\n    <section id="about" style="">\n        <div class="container ui-sortable">\n            <div class="row ui-sortable">\n                <div class="col-lg-12 text-center ui-sortable">\n                    <h2 class="section-heading">About</h2>\n                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>\n                </div>\n            </div>\n            <div class="row ui-sortable">\n                <div class="col-lg-12 ui-sortable">\n                    <ul class="timeline">\n                        <li>\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/1.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>2009-2011</h4>\n                                    <h4 class="subheading">Our Humble Beginnings</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/2.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>March 2011</h4>\n                                    <h4 class="subheading">An Agency is Born</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li>\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/3.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>December 2012</h4>\n                                    <h4 class="subheading">Transition to Full Service</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/4.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>July 2014</h4>\n                                    <h4 class="subheading">Phase Two Expansion</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <h4>Be Part\n                                    <br>Of Our\n                                    <br>Story!</h4>\n                            </div>\n                        </li>\n                    </ul>\n                </div>\n            </div>\n        </div>\n    </section>\n</cc-element>\n\n<cc-element cc-id="script" cc-placement="top">\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/js/bootstrap.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/jqBootstrapValidation.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/contact_me.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/agency.min.js"></script_widged>\n</cc-element>\n                            <cc-element cc-id="style">\n                              \n                            </cc-element>\n\n                            <cc-element cc-id="content">\n                              <div class="container ui-sortable" style="">\n                                <div class="row ui-sortable" style="">\n                                   <div class="column col-md-12 ui-sortable" style="">\n                                    <p style="">.</p>\n                                   </div>\n                                </div>\n                              </div>\n                            </cc-element>\n\n\n                            <cc-element cc-id="script" cc-placement="top">\n                               \n                            </cc-element>', '\n                                    \n                                    \n                                    \n                                    \n                                    \n                                       <li class="block-item ui-draggable ui-draggable-handle block-item-loaded" data-src="agency\\/about.php" data-block-name="agency\\" style="width: 200px; right: auto; height: 112px; bottom: auto; display: list-item;">\n				                <div class="nav-content-wrapper noselect ui-sortable">\n				                  <i class="fa fa-gear"></i>\n				                  <div class="tool-nav delete ui-sortable">\n				                    <i class="fa fa-trash"></i> <span class="info-nav">Delete</span>\n				                  </div>\n				                  <div class="tool-nav source ui-sortable">\n				                    <i class="fa fa-code"></i> <span class="info-nav">Source</span>\n				                  </div>\n				                  <div class="tool-nav copy ui-sortable">\n				                    <i class="fa fa-copy"></i> <span class="info-nav">Copy</span>\n				                  </div>\n				                  <div class="tool-nav handle ui-sortable ui-sortable-handle">\n				                    <i class="fa fa-arrows"></i> <span class="info-nav">Move</span>\n				                  </div>\n				                </div>\n				              \n				              <div class="block-content editable ui-sortable"><cc-element cc-id="style">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/css/agency.min.css" rel="stylesheet">\n</cc-element>\n\n<cc-element cc-id="content">\n    <section id="about" style="">\n        <div class="container ui-sortable">\n            <div class="row ui-sortable">\n                <div class="col-lg-12 text-center ui-sortable">\n                    <h2 class="section-heading">About</h2>\n                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>\n                </div>\n            </div>\n            <div class="row ui-sortable">\n                <div class="col-lg-12 ui-sortable">\n                    <ul class="timeline">\n                        <li>\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/1.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>2009-2011</h4>\n                                    <h4 class="subheading">Our Humble Beginnings</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/2.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>March 2011</h4>\n                                    <h4 class="subheading">An Agency is Born</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li>\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/3.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>December 2012</h4>\n                                    <h4 class="subheading">Transition to Full Service</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/4.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>July 2014</h4>\n                                    <h4 class="subheading">Phase Two Expansion</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <h4>Be Part\n                                    <br>Of Our\n                                    <br>Story!</h4>\n                            </div>\n                        </li>\n                    </ul>\n                </div>\n            </div>\n        </div>\n    </section>\n</cc-element>\n\n<cc-element cc-id="script" cc-placement="top">\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/js/bootstrap.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/jqBootstrapValidation.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/contact_me.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/agency.min.js"></script_widged>\n</cc-element></div>\n				            </li><li class="block-item ui-draggable ui-draggable-handle block-item-loaded" data-src="portofolio\\/column.php" data-block-name="portofolio\\" style="width: 200px; right: auto; height: 56px; bottom: auto; display: list-item;">\n                        <div class="nav-content-wrapper noselect ui-sortable">\n                          <i class="fa fa-gear"></i>\n                          <div class="tool-nav delete ui-sortable">\n                            <i class="fa fa-trash"></i> <span class="info-nav">Delete</span>\n                          </div>\n                          <div class="tool-nav source ui-sortable">\n                            <i class="fa fa-code"></i> <span class="info-nav">Source</span>\n                          </div>\n                          <div class="tool-nav copy ui-sortable">\n                            <i class="fa fa-copy"></i> <span class="info-nav">Copy</span>\n                          </div>\n                          <div class="tool-nav handle ui-sortable ui-sortable-handle">\n                            <i class="fa fa-arrows"></i> <span class="info-nav">Move</span>\n                          </div>\n                        </div>\n                      \n                      <div class="block-content editable ui-sortable">\n                            <cc-element cc-id="style">\n                              \n                            </cc-element>\n\n                            <cc-element cc-id="content">\n                              <div class="container ui-sortable" style="">\n                                <div class="row ui-sortable" style="">\n                                   <div class="column col-md-12 ui-sortable" style="">\n                                    <p style="">.</p>\n                                   </div>\n                                </div>\n                              </div>\n                            </cc-element>\n\n\n                            <cc-element cc-id="script" cc-placement="top">\n                               \n                            </cc-element></div>\n                    </li>\n                                                                                                                                                                                                                        ', '', 'Liste des Familles', 'familles', 'default', '2021-11-16 16:06:31'),
	(3, 'a propos de nous', 'frontend', '\n<cc-element cc-id="style">\n    <link data-src="stylesheet-bootstrap" href="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">\n    <link data-src="stylesheet-freelancer" href="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/css/freelancer.min.css" rel="stylesheet">\n    <link data-src="stylesheet-font-awesome" href="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">\n    <link data-src="stylesheet-bootstrap" href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">\n    <link data-src="stylesheet-bootstrap" href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">\n</cc-element>\n\n<cc-element cc-id="content">\n    <section class="success" id="about" style="">\n        <div class="container ui-sortable">\n            <div class="row ui-sortable">\n                <div class="col-lg-12 text-center ui-sortable">\n                    <h2>About</h2>\n                    <hr class="star-light">\n                </div>\n            </div>\n            <div class="row ui-sortable">\n                <div class="col-lg-4 col-lg-offset-2 ui-sortable">\n                    <p>Cicool is, an engine builder that provides tools to facilitate you in building a dynamic website, very easy to use, easy also to costume with dynamic content.</p>\n                </div>\n                <div class="col-lg-4 ui-sortable">\n                    <p>Whether you\'re a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>\n                </div>\n                <div class="col-lg-8 col-lg-offset-2 text-center ui-sortable">\n                    <a href="#" class="btn btn-lg btn-outline" data-original-title="" title="">\n                        <i class="fa fa-twitter"></i> Follow Me\n                    </a>\n                </div>\n            </div>\n        </div>\n    </section>\n</cc-element>\n\n\n<cc-element cc-id="script" cc-placement="top">\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/vendor/bootstrap/js/bootstrap.min.js"></script_widged>\n    <script_widged class="display-none" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/js/jqBootstrapValidation.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/js/contact_me.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/js/freelancer.min.js"></script_widged>\n    <script_widged class="display-none" type="text/javascript">\n    </script_widged>\n</cc-element><cc-element cc-id="style">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/css/agency.min.css" rel="stylesheet">\n</cc-element>\n\n<cc-element cc-id="content">\n    <section id="about" style="" class="">\n        <div class="container ui-sortable" style="">\n            <div class="row ui-sortable">\n                <div class="col-lg-12 text-center ui-sortable">\n                    <h2 class="section-heading">About</h2>\n                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>\n                </div>\n            </div>\n            <div class="row ui-sortable" style="">\n                <div class="col-lg-12 ui-sortable" style="">\n                    <ul class="timeline" style="">\n                        <li>\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/1.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>2009-2011</h4>\n                                    <h4 class="subheading">Our Humble Beginnings</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/2.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>March 2011</h4>\n                                    <h4 class="subheading">An Agency is Born</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li style="">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/3.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable" style="">\n                                <div class="timeline-heading ui-sortable" style="">\n                                    <h4>December 2012</h4>\n                                    <h4 class="subheading">Transition to Full Service</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable" style="">\n                                    <p class="text-muted" style="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted" style="">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/4.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>July 2014</h4>\n                                    <h4 class="subheading">Phase Two Expansion</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted" style="">\n                            <div class="timeline-image ui-sortable" style="">\n                                <h4>Be Part\n                                    <br>Of Our\n                                    <br>Story!</h4>\n                            </div>\n                        </li>\n                    </ul>\n                </div>\n            </div>\n        </div>\n    </section>\n</cc-element>\n\n<cc-element cc-id="script" cc-placement="top">\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/js/bootstrap.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/jqBootstrapValidation.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/contact_me.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/agency.min.js"></script_widged>\n</cc-element>\n                            <cc-element cc-id="style">\n                              \n                            </cc-element>\n\n                            <cc-element cc-id="content">\n                              <div class="container ui-sortable" style="">\n                                <div class="row ui-sortable" style="">\n                                   <div class="column col-md-12 ui-sortable" style="">\n                                    <p style="">.</p>\n                                   </div>\n                                </div>\n                              </div>\n                            </cc-element>\n\n\n                            <cc-element cc-id="script" cc-placement="top">\n                               \n                            </cc-element>', '\n                                    \n                                    \n                                    \n                                    \n                                       <li class="block-item ui-draggable ui-draggable-handle block-item-loaded" data-src="portofolio\\/about.php" data-block-name="portofolio\\" style="width: 200px; right: auto; height: 98px; bottom: auto; display: list-item;">\n				                <div class="nav-content-wrapper noselect ui-sortable">\n				                  <i class="fa fa-gear"></i>\n				                  <div class="tool-nav delete ui-sortable">\n				                    <i class="fa fa-trash"></i> <span class="info-nav">Delete</span>\n				                  </div>\n				                  <div class="tool-nav source ui-sortable">\n				                    <i class="fa fa-code"></i> <span class="info-nav">Source</span>\n				                  </div>\n				                  <div class="tool-nav copy ui-sortable">\n				                    <i class="fa fa-copy"></i> <span class="info-nav">Copy</span>\n				                  </div>\n				                  <div class="tool-nav handle ui-sortable ui-sortable-handle">\n				                    <i class="fa fa-arrows"></i> <span class="info-nav">Move</span>\n				                  </div>\n				                </div>\n				              \n				              <div class="block-content editable ui-sortable">\n<cc-element cc-id="style">\n    <link data-src="stylesheet-bootstrap" href="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">\n    <link data-src="stylesheet-freelancer" href="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/css/freelancer.min.css" rel="stylesheet">\n    <link data-src="stylesheet-font-awesome" href="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">\n    <link data-src="stylesheet-bootstrap" href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">\n    <link data-src="stylesheet-bootstrap" href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">\n</cc-element>\n\n<cc-element cc-id="content">\n    <section class="success" id="about" style="">\n        <div class="container ui-sortable">\n            <div class="row ui-sortable">\n                <div class="col-lg-12 text-center ui-sortable">\n                    <h2>About</h2>\n                    <hr class="star-light">\n                </div>\n            </div>\n            <div class="row ui-sortable">\n                <div class="col-lg-4 col-lg-offset-2 ui-sortable">\n                    <p>Cicool is, an engine builder that provides tools to facilitate you in building a dynamic website, very easy to use, easy also to costume with dynamic content.</p>\n                </div>\n                <div class="col-lg-4 ui-sortable">\n                    <p>Whether you\'re a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>\n                </div>\n                <div class="col-lg-8 col-lg-offset-2 text-center ui-sortable">\n                    <a href="#" class="btn btn-lg btn-outline" data-original-title="" title="">\n                        <i class="fa fa-twitter"></i> Follow Me\n                    </a>\n                </div>\n            </div>\n        </div>\n    </section>\n</cc-element>\n\n\n<cc-element cc-id="script" cc-placement="top">\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/vendor/bootstrap/js/bootstrap.min.js"></script_widged>\n    <script_widged class="display-none" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/js/jqBootstrapValidation.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/js/contact_me.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/portofolio\\/package/js/freelancer.min.js"></script_widged>\n    <script_widged class="display-none" type="text/javascript">\n    </script_widged>\n</cc-element></div>\n				            </li><li class="block-item ui-draggable ui-draggable-handle block-item-loaded" data-src="agency\\/about.php" data-block-name="agency\\" style="width: 200px; right: auto; height: 112px; bottom: auto; display: list-item;">\n				                <div class="nav-content-wrapper noselect ui-sortable">\n				                  <i class="fa fa-gear"></i>\n				                  <div class="tool-nav delete ui-sortable">\n				                    <i class="fa fa-trash"></i> <span class="info-nav">Delete</span>\n				                  </div>\n				                  <div class="tool-nav source ui-sortable">\n				                    <i class="fa fa-code"></i> <span class="info-nav">Source</span>\n				                  </div>\n				                  <div class="tool-nav copy ui-sortable">\n				                    <i class="fa fa-copy"></i> <span class="info-nav">Copy</span>\n				                  </div>\n				                  <div class="tool-nav handle ui-sortable ui-sortable-handle">\n				                    <i class="fa fa-arrows"></i> <span class="info-nav">Move</span>\n				                  </div>\n				                </div>\n				              \n				              <div class="block-content editable ui-sortable"><cc-element cc-id="style">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">\n    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">\n    <link href="http://localhost:80/cicool/cc-content/page-element/agency\\/package/css/agency.min.css" rel="stylesheet">\n</cc-element>\n\n<cc-element cc-id="content">\n    <section id="about" style="" class="">\n        <div class="container ui-sortable" style="">\n            <div class="row ui-sortable">\n                <div class="col-lg-12 text-center ui-sortable">\n                    <h2 class="section-heading">About</h2>\n                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>\n                </div>\n            </div>\n            <div class="row ui-sortable" style="">\n                <div class="col-lg-12 ui-sortable" style="">\n                    <ul class="timeline" style="">\n                        <li>\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/1.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>2009-2011</h4>\n                                    <h4 class="subheading">Our Humble Beginnings</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/2.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>March 2011</h4>\n                                    <h4 class="subheading">An Agency is Born</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li style="">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/3.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable" style="">\n                                <div class="timeline-heading ui-sortable" style="">\n                                    <h4>December 2012</h4>\n                                    <h4 class="subheading">Transition to Full Service</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable" style="">\n                                    <p class="text-muted" style="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted" style="">\n                            <div class="timeline-image ui-sortable">\n                                <img class="img-circle img-responsive" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/img/about/4.jpg" alt="">\n                            </div>\n                            <div class="timeline-panel ui-sortable">\n                                <div class="timeline-heading ui-sortable">\n                                    <h4>July 2014</h4>\n                                    <h4 class="subheading">Phase Two Expansion</h4>\n                                </div>\n                                <div class="timeline-body ui-sortable">\n                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n                                </div>\n                            </div>\n                        </li>\n                        <li class="timeline-inverted" style="">\n                            <div class="timeline-image ui-sortable" style="">\n                                <h4>Be Part\n                                    <br>Of Our\n                                    <br>Story!</h4>\n                            </div>\n                        </li>\n                    </ul>\n                </div>\n            </div>\n        </div>\n    </section>\n</cc-element>\n\n<cc-element cc-id="script" cc-placement="top">\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/vendor/bootstrap/js/bootstrap.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/jqBootstrapValidation.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/contact_me.js"></script_widged>\n    <script_widged class="display-none" src="http://localhost:80/cicool/cc-content/page-element/agency\\/package/js/agency.min.js"></script_widged>\n</cc-element></div>\n				            </li><li class="block-item ui-draggable ui-draggable-handle block-item-loaded" data-src="portofolio\\/column.php" data-block-name="portofolio\\" style="width: 200px; right: auto; height: 56px; bottom: auto; display: list-item;">\n                        <div class="nav-content-wrapper noselect ui-sortable">\n                          <i class="fa fa-gear"></i>\n                          <div class="tool-nav delete ui-sortable">\n                            <i class="fa fa-trash"></i> <span class="info-nav">Delete</span>\n                          </div>\n                          <div class="tool-nav source ui-sortable">\n                            <i class="fa fa-code"></i> <span class="info-nav">Source</span>\n                          </div>\n                          <div class="tool-nav copy ui-sortable">\n                            <i class="fa fa-copy"></i> <span class="info-nav">Copy</span>\n                          </div>\n                          <div class="tool-nav handle ui-sortable ui-sortable-handle">\n                            <i class="fa fa-arrows"></i> <span class="info-nav">Move</span>\n                          </div>\n                        </div>\n                      \n                      <div class="block-content editable ui-sortable">\n                            <cc-element cc-id="style">\n                              \n                            </cc-element>\n\n                            <cc-element cc-id="content">\n                              <div class="container ui-sortable" style="">\n                                <div class="row ui-sortable" style="">\n                                   <div class="column col-md-12 ui-sortable" style="">\n                                    <p style="">.</p>\n                                   </div>\n                                </div>\n                              </div>\n                            </cc-element>\n\n\n                            <cc-element cc-id="script" cc-placement="top">\n                               \n                            </cc-element></div>\n                    </li>\n                                                                                                                                                                                    ', '', 'histoire de la famille', 'a-propos-de-nous', 'default', '2021-11-16 16:05:15'),
	(6, 'arbre genealogique', 'frontend', '\n                            <cc-element cc-id="style">\n                                \n                              \n                            </cc-element>\n\n                            <cc-element cc-id="content">\n                               <iframe src="https://julesndanga.github.io/arbregenealogique/" style="height:100%;width:100%;" title="description"></iframe>\n                               \n                            </cc-element>\n\n\n                            <cc-element cc-id="script" cc-placement="top">\n                                \n                                \n                          </cc-element>', '\n                                    \n                                    \n                                    \n                                       <li class="block-item ui-draggable ui-draggable-handle block-item-loaded" data-src="portofolio\\/column.php" data-block-name="portofolio\\" style="width: 200px; right: auto; height: 56px; bottom: auto; display: list-item;">\n                        <div class="nav-content-wrapper noselect ui-sortable" style="display: block;">\n                          <i class="fa fa-gear"></i>\n                          <div class="tool-nav delete ui-sortable">\n                            <i class="fa fa-trash"></i> <span class="info-nav">Delete</span>\n                          </div>\n                          <div class="tool-nav source ui-sortable">\n                            <i class="fa fa-code"></i> <span class="info-nav">Source</span>\n                          </div>\n                          <div class="tool-nav copy ui-sortable">\n                            <i class="fa fa-copy"></i> <span class="info-nav">Copy</span>\n                          </div>\n                          <div class="tool-nav handle ui-sortable ui-sortable-handle">\n                            <i class="fa fa-arrows"></i> <span class="info-nav">Move</span>\n                          </div>\n                        </div>\n                      \n                      <div class="block-content editable ui-sortable" style="display: block;">\n                            <cc-element cc-id="style">\n                                \n                              \n                            </cc-element>\n\n                            <cc-element cc-id="content">\n                               <iframe src="https://julesndanga.github.io/arbregenealogique/" style="height:100%;width:100%;" title="description"></iframe>\n                               \n                            </cc-element>\n\n\n                            <cc-element cc-id="script" cc-placement="top">\n                                \n                                \n                          </cc-element></div>\n                            </li>                                    ', '', '', 'arbre-genealogique', 'default', '2021-11-16 21:29:36');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;

-- Listage de la structure de la table cicool. page_block_element
CREATE TABLE IF NOT EXISTS `page_block_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image_preview` varchar(200) NOT NULL,
  `block_name` varchar(200) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.page_block_element : 0 rows
DELETE FROM `page_block_element`;
/*!40000 ALTER TABLE `page_block_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_block_element` ENABLE KEYS */;

-- Listage de la structure de la table cicool. rest
CREATE TABLE IF NOT EXISTS `rest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `x_api_key` varchar(20) DEFAULT NULL,
  `x_token` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.rest : 0 rows
DELETE FROM `rest`;
/*!40000 ALTER TABLE `rest` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest` ENABLE KEYS */;

-- Listage de la structure de la table cicool. rest_field
CREATE TABLE IF NOT EXISTS `rest_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rest_id` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `input_type` varchar(200) NOT NULL,
  `show_column` varchar(10) DEFAULT NULL,
  `show_add_api` varchar(10) DEFAULT NULL,
  `show_update_api` varchar(10) DEFAULT NULL,
  `show_detail_api` varchar(10) DEFAULT NULL,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.rest_field : 0 rows
DELETE FROM `rest_field`;
/*!40000 ALTER TABLE `rest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest_field` ENABLE KEYS */;

-- Listage de la structure de la table cicool. rest_field_validation
CREATE TABLE IF NOT EXISTS `rest_field_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rest_field_id` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.rest_field_validation : 0 rows
DELETE FROM `rest_field_validation`;
/*!40000 ALTER TABLE `rest_field_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest_field_validation` ENABLE KEYS */;

-- Listage de la structure de la table cicool. rest_input_type
CREATE TABLE IF NOT EXISTS `rest_input_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `validation_group` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Listage des données de la table cicool.rest_input_type : 4 rows
DELETE FROM `rest_input_type`;
/*!40000 ALTER TABLE `rest_input_type` DISABLE KEYS */;
INSERT INTO `rest_input_type` (`id`, `type`, `relation`, `validation_group`) VALUES
	(1, 'input', '0', 'input'),
	(2, 'timestamp', '0', 'timestamp'),
	(3, 'file', '0', 'file'),
	(4, 'select', '1', 'select');
/*!40000 ALTER TABLE `rest_input_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
