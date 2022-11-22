-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 21, 2022 at 03:53 PM
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `delete_flag` tinyint NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Khác', 'Tổng hợp các topic có nội dung khác', 1, 0, '2022-11-19 22:44:28', '2022-11-19 22:44:28'),
(2, 'Magic', 'Magic. Witchcraft.', 1, 0, '2022-11-19 20:21:36', '2022-11-19 20:21:36'),
(3, 'Progaming', 'This is about Programing.', 1, 0, '2022-11-19 20:21:41', '2022-11-19 20:22:13'),
(4, 'Giải trí', 'Các ội dung giải trí.', 1, 0, '2022-11-20 18:14:12', '2022-11-20 18:14:12'),
(5, 'Tin tức', 'Tổng hợp các tin tức', 1, 0, '2022-11-20 18:14:12', '2022-11-20 18:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `eco_system`
--

DROP TABLE IF EXISTS `eco_system`;
CREATE TABLE IF NOT EXISTS `eco_system` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eco_system`
--

INSERT INTO `eco_system` (`id`, `name`, `date_created`) VALUES
(1, 'DS Forum', '2022-11-19 22:44:27'),
(2, 'DS social media', '2022-11-19 22:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE IF NOT EXISTS `friend_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source_id` int NOT NULL,
  `target_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_frtouss` (`source_id`),
  KEY `fk_frtoust` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_cmt`
--

DROP TABLE IF EXISTS `post_cmt`;
CREATE TABLE IF NOT EXISTS `post_cmt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_pctopo` (`post_id`),
  KEY `fk_pltous` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
CREATE TABLE IF NOT EXISTS `post_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pltopo` (`post_id`),
  KEY `fk_pltous` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_list`
--

DROP TABLE IF EXISTS `post_list`;
CREATE TABLE IF NOT EXISTS `post_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `caption` text NOT NULL,
  `upload_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_potous` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sy_id` int NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sitoes` (`sy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `sy_id`, `meta_field`, `meta_value`) VALUES
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
-- Table structure for table `topic_cmt`
--

DROP TABLE IF EXISTS `topic_cmt`;
CREATE TABLE IF NOT EXISTS `topic_cmt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `topic_id` int NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tctous` (`user_id`),
  KEY `fk_tctoto` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topic_cmt`
--

INSERT INTO `topic_cmt` (`id`, `user_id`, `topic_id`, `comment`, `date_created`, `date_updated`) VALUES
(1, 4, 2, 'hello my dear', '2022-11-19 23:37:32', '2022-11-19 23:37:32'),
(2, 2, 3, 'Hello', '2022-11-20 17:11:28', '2022-11-20 17:11:28'),
(3, 4, 2, 'hoho, test', '2022-11-20 17:11:47', '2022-11-20 17:11:47'),
(4, 4, 3, 'ye, huhaa', '2022-11-20 17:12:04', '2022-11-20 17:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `topic_list`
--

DROP TABLE IF EXISTS `topic_list`;
CREATE TABLE IF NOT EXISTS `topic_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `delete_flag` tinyint NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_totous` (`user_id`),
  KEY `fk_totocate` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topic_list`
--

INSERT INTO `topic_list` (`id`, `user_id`, `category_id`, `title`, `content`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 'test', '<p>Data to delete</p>', 1, 1, '2022-05-16 13:52:36', '2022-05-16 13:54:05'),
(2, 1, 1, 'test', '<p>This is a sample topic</p>', 1, 0, '2022-05-16 13:52:36', '2022-11-19 20:28:22'),
(3, 1, 2, 'Hello witches', '<h1>Yo, good morning witches. </h1>\r\n<p>Welcome to DS forum.\r\n<br>This is a test topic. \r\n<br>Have a nice day!<p>', 1, 0, '2022-11-19 20:24:25', '2022-11-19 20:29:08'),
(4, 4, 3, 'HTML', '<p>HTML là một từ viết tắt của Hypertext Markup Language, nó là một loại ngôn ngữ siêu văn bản và được sử dụng rất phổ biến trong lập trình web. Khi người dùng click vào các liên kết ở trong một trang web thì có thể dẫn tới sự xuất hiện của nhiều trang web khác nhau. Một trang như vậy người ta thường gọi là một trang HTML. Ngoài ra, HTML còn hỗ trợ cho người dùng trong việc lập trình để tạo ra các cấu trúc và phân loại được các thành phần khác bên trong trang web. Nó thường có khả năng phân chia cho các đoạn văn, blog, heading, footer, header và một số đường link liên kết khác. \r\nƯu điểm nổi bật:</p>\r\n<p>- Bởi vì HTML được ra đời từ rất lâu nên nguồn tài nguyên hỗ trợ hỗ trợ cho nó vô cùng khổng lồ. Hiện nay, cộng đồng của HTML đang phát triển ngày càng lớn trên thế giới. </p>\r\n<p>- HTML có thể chạy tương đối mượt mà trên hầu hết những trình duyệt phổ biến nhất hiện nay là: IE, Chrome, FireFox, Cốc Cốc…</p>\r\n<p>- Mã nguồn mà HTML sử dụng là loại mã nguồn mở và có thể sử dụng hoàn toàn miễn phí.</p>\r\n<p>- Quá trình học HTML tương đối đơn giản, dễ hiểu nên người học có thể dễ dàng nắm bắt được các kiến thức căn bản nhanh chóng hơn. Quá trình xây dựng khung cho website căn bản sẽ có thể thực hiện chỉ với vài tuần học. </p>\r\n<p>- HTML được quy định theo một tiêu chuẩn nhất định nên việc markup sẽ trở nên đồng nhất, gọn gàng hơn rất nhiều bởi vì, HTML được vận hành bởi World Wide Web Consortium (W3C).</p>\r\n<p>- Quá trình thực hiện sẽ dễ dàng hơn bởi nó tích hợp với nhiều loại ngôn ngữ backend như: PHP, NodeJs, Ruby, Java… để có thể tạo thành một website hoàn chỉnh với đầy đủ mọi tính năng. </p>\r\n<p>Nhược điểm còn tồn tại:</p>\r\n<p>- Nhược điểm lớn nhất mà HTML còn tồn tại đó chính là chỉ có thể sử dụng ở những trang web tĩnh. Đây là những trang web chỉ hiển thị thông tin mà không có sự tương tác của người dùng. Chính vậy, khi xây dựng những tính năng động hoặc hướng đối tượng người dùng thì lập trình viên cần phải sử dụng Javascript hoặc ngôn ngữ backend khác của bên thứ 3 mới có thể thực hiện được. </p>\r\n<p>- HTML không có khả năng tạo ra sự riêng biệt và mới mẻ cho người dùng bởi vì nó thường chỉ có thể thực thi những thứ logic và có cấu trúc nhất định. </p>\r\n<p>- Hiện nay, một số trình duyệt vẫn còn chậm trong việc hỗ trợ cho tính năng mới nhất của HTML và đặc biệt là với HTML5.</p>\r\n<p>- Ngoài ra, một số trình duyệt cũ vẫn không thể render được những tag mới có bên trong HTML5.</p>', 1, 0, '2022-11-21 00:09:56', '2022-11-21 00:09:56'),
(6, 2, 5, 'Elon Musk đăng ảnh chế Twitter \'đã chết\'', '<p>Elon Musk đăng bức ảnh với nội dung Twitter đã chết trong khi những người xung quanh tỏ ra vui vẻ.</p>\r\n<img src=\"https://i1-sohoa.vnecdn.net/2022/11/19/A-nh-chu-p-Ma-n-hi-nh-2022-11-4322-1382-1668830299.png?w=0&h=0&q=100&dpr=2&fit=crop&s=PyzMQXtP0oUyCQGrONXA-g\" />', 1, 0, '2022-11-21 00:15:42', '2022-11-21 00:15:42'),
(7, 2, 4, 'Mission Zero – Game Hành Động 2v4 Của NetEase', '<p>Mission Zero là tựa game mobile hành động kết hợp cả hai thể loại hành động và gián điệp của NetEase. Game thủ sẽ tham gia vào các trận đấu đối kháng dưới hình thức 2v4 đặc trưng, mỗi bên sẽ lựa chọn gia nhập vào một trong hai phe là Mobius hoặc Sirius.</p>', 1, 0, '2022-11-21 00:23:52', '2022-11-21 00:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `topic_reply`
--

DROP TABLE IF EXISTS `topic_reply`;
CREATE TABLE IF NOT EXISTS `topic_reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `reply` text NOT NULL,
  `user_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_trtotc` (`comment_id`),
  KEY `fk_trtous` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` mediumtext NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `avatar` text,
  `type` int NOT NULL DEFAULT '3',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '0=Pending, 1=Approved, 2 = Denied, 3=Blocked',
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_ustout` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `middlename`, `lastname`, `avatar`, `type`, `status`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'admin', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500', 'Admin', '', 'Web', 'uploads/avatars/1.png?v=1649834664', 1, '0', NULL, '2022-11-19 18:27:44', '2022-11-20 18:52:33'),
(2, 'alysa', 'selionfire24@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Alysa', 'a', 'Ya', NULL, 3, '0', '2022-11-19 14:39:09', '2022-11-19 21:39:36', '2022-11-20 20:44:22'),
(4, 'test', NULL, 'e10adc3949ba59abbe56e057f20f883e', 'test', 'ing', 'ae', NULL, 3, '0', '2022-11-19 15:34:24', '2022-11-19 22:34:42', '2022-11-19 22:34:42'),
(5, 'quancute', NULL, 'e10adc3949ba59abbe56e057f20f883e', 'Quan', NULL, 'Cuteo', NULL, 2, '0', '2022-11-20 17:26:40', '2022-11-21 00:31:53', '2022-11-21 00:32:13'),
(6, 'mala', NULL, 'e10adc3949ba59abbe56e057f20f883e', 'Mala', NULL, 'Fernandez', NULL, 4, '0', '2022-11-20 17:32:27', '2022-11-21 00:33:00', '2022-11-21 00:33:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE IF NOT EXISTS `user_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_umtous` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`id`, `user_id`, `meta_field`, `meta_value`) VALUES
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
  `id` int NOT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type_name`) VALUES
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
  ADD CONSTRAINT `fk_frtouss` FOREIGN KEY (`source_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_frtoust` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_cmt`
--
ALTER TABLE `post_cmt`
  ADD CONSTRAINT `fk_pctopo` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`),
  ADD CONSTRAINT `fk_pctous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `fk_pltopo` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`),
  ADD CONSTRAINT `fk_pltous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_list`
--
ALTER TABLE `post_list`
  ADD CONSTRAINT `fk_potous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `system_info`
--
ALTER TABLE `system_info`
  ADD CONSTRAINT `fk_sitoes` FOREIGN KEY (`sy_id`) REFERENCES `eco_system` (`id`);

--
-- Constraints for table `topic_cmt`
--
ALTER TABLE `topic_cmt`
  ADD CONSTRAINT `fk_tctoto` FOREIGN KEY (`topic_id`) REFERENCES `topic_list` (`id`),
  ADD CONSTRAINT `fk_tctous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `topic_list`
--
ALTER TABLE `topic_list`
  ADD CONSTRAINT `fk_totocate` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`),
  ADD CONSTRAINT `fk_totous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `topic_reply`
--
ALTER TABLE `topic_reply`
  ADD CONSTRAINT `fk_trtotc` FOREIGN KEY (`comment_id`) REFERENCES `topic_cmt` (`id`),
  ADD CONSTRAINT `fk_trtous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_ustout` FOREIGN KEY (`type`) REFERENCES `user_type` (`id`);

--
-- Constraints for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD CONSTRAINT `fk_umtous` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
