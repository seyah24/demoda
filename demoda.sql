-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2022 at 10:47 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoda`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

DROP TABLE IF EXISTS `category_list`;
CREATE TABLE IF NOT EXISTS `category_list` (
  `cateid` int NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(250) NOT NULL,
  `cate_des` text NOT NULL,
  `cate_status` tinyint NOT NULL DEFAULT '1',
  `cate_delete_flag` tinyint NOT NULL DEFAULT '0',
  `cate_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cate_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cateid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`cateid`, `cate_name`, `cate_des`, `cate_status`, `cate_delete_flag`, `cate_date_created`, `cate_date_updated`) VALUES
(1, 'Khác', 'Tổng hợp các topic có nội dung khác', 1, 0, '2022-11-19 22:44:28', '2022-11-19 22:44:28'),
(2, 'Magic', 'Magic. Witchcraft.', 1, 0, '2022-11-19 20:21:36', '2022-11-19 20:21:36'),
(3, 'Progaming', 'This is about Programing.', 1, 0, '2022-11-19 20:21:41', '2022-11-19 20:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `eco_system`
--

DROP TABLE IF EXISTS `eco_system`;
CREATE TABLE IF NOT EXISTS `eco_system` (
  `syid` int NOT NULL AUTO_INCREMENT,
  `sy_name` varchar(100) DEFAULT NULL,
  `sy_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`syid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eco_system`
--

INSERT INTO `eco_system` (`syid`, `sy_name`, `sy_date_created`) VALUES
(1, 'DS Forum', '2022-11-19 22:44:27'),
(2, 'DS social media', '2022-11-19 22:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE IF NOT EXISTS `friend_requests` (
  `frid` int NOT NULL AUTO_INCREMENT,
  `uid_source` int NOT NULL,
  `uid_target` int NOT NULL,
  `fr_status` tinyint NOT NULL DEFAULT '0',
  `fr_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fr_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`frid`),
  KEY `fk_frtouss` (`uid_source`),
  KEY `fk_frtoust` (`uid_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `post_caption` text NOT NULL,
  `p_upload_path` text NOT NULL,
  `p_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `p_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  KEY `fk_potous` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_com`
--

DROP TABLE IF EXISTS `post_com`;
CREATE TABLE IF NOT EXISTS `post_com` (
  `pocomid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  `post_comment` text NOT NULL,
  `pc_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pc_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pocomid`),
  KEY `fk_pctopo` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
CREATE TABLE IF NOT EXISTS `post_likes` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `fk_pltopo` (`pid`),
  KEY `fk_pltous` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
CREATE TABLE IF NOT EXISTS `system_info` (
  `siid` int NOT NULL AUTO_INCREMENT,
  `syid` int NOT NULL,
  `si_meta_field` text NOT NULL,
  `si_meta_value` text NOT NULL,
  PRIMARY KEY (`siid`),
  KEY `fk_sitoes` (`syid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`siid`, `syid`, `si_meta_field`, `si_meta_value`) VALUES
(1, 1, 'name', 'DS Forum'),
(2, 1, 'short_name', 'DSF'),
(3, 1, 'logo', 'uploads/logo.png?v=1652665183'),
(4, 1, 'user_avatar', 'uploads/user_avatar.jpg'),
(5, 1, 'cover', 'uploads/cover.png?v=1652665183'),
(6, 2, 'name', 'DS Social'),
(7, 2, 'short_name', 'DSSN'),
(8, 2, 'logo', 'uploads/logo.png?v=1652491306'),
(9, 2, 'user_avatar', 'uploads/user_avatar.jpg'),
(10, 2, 'cover', 'uploads/cover.png?v=1652491310');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `toid` int NOT NULL AUTO_INCREMENT,
  `cateid` int NOT NULL,
  `userid` int NOT NULL,
  `to_title` varchar(250) NOT NULL,
  `to_content` text NOT NULL,
  `to_status` tinyint NOT NULL DEFAULT '0',
  `to_delete_flag` tinyint NOT NULL DEFAULT '0',
  `to_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`toid`),
  KEY `fk_totocate` (`cateid`),
  KEY `fk_totous` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`toid`, `cateid`, `userid`, `to_title`, `to_content`, `to_status`, `to_delete_flag`, `to_date_created`, `to_date_updated`) VALUES
(1, 1, 1, 'test', '<p>Data to delete</p>', 1, 1, '2022-05-16 13:52:36', '2022-05-16 13:54:05'),
(2, 1, 1, 'test', '<p>This is a sample topic</p>', 1, 0, '2022-05-16 13:52:36', '2022-11-19 20:28:22'),
(3, 2, 1, 'Hello witches', '<h1>Yo, good morning witches. </h1>\r\n<p>Welcome to DS forum.\r\n<br>This is a test topic. \r\n<br>Have a nice day!<p>', 1, 0, '2022-11-19 20:24:25', '2022-11-19 20:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `topic_com`
--

DROP TABLE IF EXISTS `topic_com`;
CREATE TABLE IF NOT EXISTS `topic_com` (
  `tocomid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `toid` int NOT NULL,
  `topic_comment` text NOT NULL,
  `tc_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tc_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tocomid`),
  KEY `fk_tctous` (`userid`),
  KEY `fk_tctoto` (`toid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topic_com`
--

INSERT INTO `topic_com` (`tocomid`, `userid`, `toid`, `topic_comment`, `tc_date_created`, `tc_date_updated`) VALUES
(1, 4, 2, 'hello my dear', '2022-11-19 23:37:32', '2022-11-19 23:37:32'),
(2, 2, 3, 'Hello', '2022-11-20 17:11:28', '2022-11-20 17:11:28'),
(3, 4, 2, 'hoho, test', '2022-11-20 17:11:47', '2022-11-20 17:11:47'),
(4, 4, 3, 'ye, huhaa', '2022-11-20 17:12:04', '2022-11-20 17:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `topic_rep`
--

DROP TABLE IF EXISTS `topic_rep`;
CREATE TABLE IF NOT EXISTS `topic_rep` (
  `toreid` int NOT NULL AUTO_INCREMENT,
  `tocomid` int NOT NULL,
  `topic_reply` text NOT NULL,
  `userid` int NOT NULL,
  `tore_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tore_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`toreid`),
  KEY `fk_trtotc` (`tocomid`),
  KEY `fk_trtous` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` mediumtext NOT NULL,
  `user_type` int NOT NULL DEFAULT '3',
  `firstname` varchar(250) NOT NULL,
  `middlename` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_ustout` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `username`, `email`, `password`, `user_type`, `firstname`, `middlename`, `lastname`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'admin', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500', 1, 'Admin', NULL, 'Web', 'uploads/avatars/1.png?v=1649834664', NULL, '2022-11-19 18:27:44', '2022-11-19 18:27:44'),
(2, 'alysa', NULL, 'e10adc3949ba59abbe56e057f20f883e', 3, 'Alysa', 'a', 'Ya', NULL, '2022-11-19 14:39:09', '2022-11-19 21:39:36', '2022-11-19 21:39:36'),
(4, 'test', NULL, 'e10adc3949ba59abbe56e057f20f883e', 3, 'test', 'ing', 'ae', NULL, '2022-11-19 15:34:24', '2022-11-19 22:34:42', '2022-11-19 22:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE IF NOT EXISTS `user_meta` (
  `umid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `um_meta_field` text NOT NULL,
  `um_meta_value` text NOT NULL,
  PRIMARY KEY (`umid`),
  KEY `fk_umtous` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`umid`, `uid`, `um_meta_field`, `um_meta_value`) VALUES
(1, 1, 'contact', '09123456789/456-654-8879'),
(2, 1, 'address', 'Trung Hoa, Cau Giay, Ha Noi'),
(3, 1, 'relation_status', 'In Relationship'),
(4, 1, 'education', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vehicula ullamcorper risus, et facilisis erat vehicula vitae.'),
(5, 1, 'working', 'Nam sollicitudin felis vitae nulla luctus elementum. Fusce accumsan est a est feugiat, id lacinia elit accumsan. Proin venenatis nunc quis sapien consequat maximus.'),
(6, 1, 'about', 'Phasellus blandit neque ultrices ipsum rhoncus venenatis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean interdum fringilla elit. Donec nisl dui, lobortis at sapien sed, consequat sagittis leo. Cras iaculis erat aliquet augue tincidunt porttitor.');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `utid` int NOT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`utid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`utid`, `user_type`) VALUES
(1, 'Admin'),
(2, 'Mod'),
(3, 'Member'),
(4, 'Registered Users');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `fk_frtouss` FOREIGN KEY (`uid_source`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `fk_frtoust` FOREIGN KEY (`uid_target`) REFERENCES `users` (`uid`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_potous` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `post_com`
--
ALTER TABLE `post_com`
  ADD CONSTRAINT `fk_pctopo` FOREIGN KEY (`uid`) REFERENCES `posts` (`pid`),
  ADD CONSTRAINT `fk_pctous` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `fk_pltopo` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`),
  ADD CONSTRAINT `fk_pltous` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `system_info`
--
ALTER TABLE `system_info`
  ADD CONSTRAINT `fk_sitoes` FOREIGN KEY (`syid`) REFERENCES `eco_system` (`syid`);

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `fk_totocate` FOREIGN KEY (`cateid`) REFERENCES `category_list` (`cateid`),
  ADD CONSTRAINT `fk_totous` FOREIGN KEY (`userid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `topic_com`
--
ALTER TABLE `topic_com`
  ADD CONSTRAINT `fk_tctoto` FOREIGN KEY (`toid`) REFERENCES `topics` (`toid`),
  ADD CONSTRAINT `fk_tctous` FOREIGN KEY (`userid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `topic_rep`
--
ALTER TABLE `topic_rep`
  ADD CONSTRAINT `fk_trtotc` FOREIGN KEY (`tocomid`) REFERENCES `topic_com` (`tocomid`),
  ADD CONSTRAINT `fk_trtous` FOREIGN KEY (`userid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_ustout` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`utid`);

--
-- Constraints for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD CONSTRAINT `fk_umtous` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
