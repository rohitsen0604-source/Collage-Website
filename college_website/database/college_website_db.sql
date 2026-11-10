-- College Website Database Dump
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Table structure for table `courses`
--
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `filename` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `milestones`
--
CREATE TABLE IF NOT EXISTS `milestones` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `milestones`
--
INSERT INTO `milestones` (`id`, `title`, `content`, `datetime`) VALUES
(1, 'Sample', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel sodales erat. Sed non lacus nisi. Sed imperdiet, elit ullamcorper pharetra vehicula, est neque facilisis quam, dictum congue ligula lacus sit amet sapien. Donec quis bibendum mauris. Donec laoreet elit nec enim dignissim, vel tempor arcu tincidunt. Aliquam laoreet, nunc et feugiat rutrum, urna leo iaculis ligula, eu tincidunt ex nisl vel turpis. Vivamus hendrerit lorem lobortis velit tempor placerat. Nulla facilisi. Integer gravida malesuada augue. In in ante ante. Suspendisse pellentesque, ex vitae pharetra pellentesque, tellus libero ullamcorper tortor, ut imperdiet nisl odio eu est. Aliquam feugiat magna eleifend elit mollis lobortis. Nulla facilisi.', '2018-02-21 00:00:00'),
(2, 'Sample 2', 'Sample', '2020-05-20 00:00:00'),
(3, 'adsasd', 'asdasdasdasd', '2020-09-16 00:00:00')
ON DUPLICATE KEY UPDATE `id`=`id`;

--
-- Table structure for table `pages`
--
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `filename` text NOT NULL,
  `date_crerated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `system_settings`
--
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--
INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Simple College Website', 'info@sample.comm', '+6948 8542 623', '1603525860_blue-encircled-book-and-feather-pen.png', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span&gt;Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;fr-video fr-deletable fr-fvc fr-dvb fr-draggable&quot; contenteditable=&quot;false&quot; draggable=&quot;true&quot;&gt;&lt;iframe src=&quot;https://www.youtube.com/embed/C1twgR80YsQ&quot; frameborder=&quot;0&quot; allowfullscreen=&quot;&quot; class=&quot;fr-draggable&quot; style=&quot;width: 1078px; height: 453px;&quot;&gt;&lt;/iframe&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;')
ON DUPLICATE KEY UPDATE `id`=`id`;

--
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff, 3= subscriber',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1)
ON DUPLICATE KEY UPDATE `id`=`id`;

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
