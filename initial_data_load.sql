-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.19 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-06-25 19:17:59
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table mary-jolisa.mjweb_contents
DROP TABLE IF EXISTS `mjweb_contents`;
CREATE TABLE IF NOT EXISTS `mjweb_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `tile_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `display` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mary-jolisa.mjweb_contents: ~6 rows (approximately)
DELETE FROM `mjweb_contents`;
/*!40000 ALTER TABLE `mjweb_contents` DISABLE KEYS */;
INSERT INTO `mjweb_contents` (`id`, `company_id`, `tile_id`, `order`, `display`, `link`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, 'All devices', '', '2014-06-14 22:16:39', '2014-06-14 22:35:04'),
	(2, 1, 2, NULL, 'Desktops & Tablets', '', '2014-06-14 22:18:15', '2014-06-14 22:40:38'),
	(3, 1, 3, NULL, 'All devices', '', '2014-06-14 22:18:55', '2014-06-14 22:40:45'),
	(5, 1, 4, NULL, 'All devices', '', '2014-06-14 22:34:55', '2014-06-14 22:40:53'),
	(6, 1, 6, NULL, 'All devices', '', '2014-06-15 23:11:16', '2014-06-15 23:11:16'),
	(7, 1, 7, NULL, 'All devices', NULL, NULL, NULL);
/*!40000 ALTER TABLE `mjweb_contents` ENABLE KEYS */;


-- Dumping structure for table mary-jolisa.mjweb_details
DROP TABLE IF EXISTS `mjweb_details`;
CREATE TABLE IF NOT EXISTS `mjweb_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `subdomain_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tile_colour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ecommerce` int(11) DEFAULT NULL,
  `monday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tuesday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wednesday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thursday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `friday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saturday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sunday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mary-jolisa.mjweb_details: ~1 rows (approximately)
DELETE FROM `mjweb_details`;
/*!40000 ALTER TABLE `mjweb_details` DISABLE KEYS */;
INSERT INTO `mjweb_details` (`id`, `company_id`, `subdomain_name`, `tile_colour`, `background`, `font`, `tagline`, `ecommerce`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `facebook`, `twitter`, `googleplus`, `linkedin`, `created_at`, `updated_at`) VALUES
	(1, 1, 'test_subdomain', '#4c1760', NULL, NULL, 'Example company tagline does here - can be any text you want of any lenght that you want but best to just describe the main bits', NULL, '9.00am - 5.30pm', '9.00am - 5.30pm', '9.00am - 5.30pm', '9.00am - 5.30pm', '9.00am - 5.30pm', '9.00am - 5.30pm', '11.00am - 4.30pm', 'facebook', 'https://twitter.com/#!/specright', 'plus', 'in', NULL, '2014-06-15 23:10:31');
/*!40000 ALTER TABLE `mjweb_details` ENABLE KEYS */;


-- Dumping structure for table mary-jolisa.mjweb_images
DROP TABLE IF EXISTS `mjweb_images`;
CREATE TABLE IF NOT EXISTS `mjweb_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mary-jolisa.mjweb_images: ~0 rows (approximately)
DELETE FROM `mjweb_images`;
/*!40000 ALTER TABLE `mjweb_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `mjweb_images` ENABLE KEYS */;


-- Dumping structure for table mary-jolisa.mjweb_imagesettings
DROP TABLE IF EXISTS `mjweb_imagesettings`;
CREATE TABLE IF NOT EXISTS `mjweb_imagesettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mary-jolisa.mjweb_imagesettings: ~0 rows (approximately)
DELETE FROM `mjweb_imagesettings`;
/*!40000 ALTER TABLE `mjweb_imagesettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mjweb_imagesettings` ENABLE KEYS */;


-- Dumping structure for table mary-jolisa.mjweb_services
DROP TABLE IF EXISTS `mjweb_services`;
CREATE TABLE IF NOT EXISTS `mjweb_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mary-jolisa.mjweb_services: ~5 rows (approximately)
DELETE FROM `mjweb_services`;
/*!40000 ALTER TABLE `mjweb_services` DISABLE KEYS */;
INSERT INTO `mjweb_services` (`id`, `company_id`, `text`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Dog Grooming', NULL, NULL),
	(2, 1, 'Wash & Brush', NULL, NULL),
	(3, 1, 'Brush & Clip', NULL, NULL),
	(4, 1, 'Dog Care Accessories', NULL, NULL),
	(5, 1, 'Any breed, size or shape', NULL, NULL);
/*!40000 ALTER TABLE `mjweb_services` ENABLE KEYS */;


-- Dumping structure for table mary-jolisa.mjweb_tiles
DROP TABLE IF EXISTS `mjweb_tiles`;
CREATE TABLE IF NOT EXISTS `mjweb_tiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partial_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mary-jolisa.mjweb_tiles: ~7 rows (approximately)
DELETE FROM `mjweb_tiles`;
/*!40000 ALTER TABLE `mjweb_tiles` DISABLE KEYS */;
INSERT INTO `mjweb_tiles` (`id`, `name`, `partial_name`, `created_at`, `updated_at`) VALUES
	(1, 'Transparent Tile', 'transparent_tile', NULL, NULL),
	(2, 'Colour Tile', 'colour_tile', NULL, NULL),
	(3, 'Services', 'services', NULL, NULL),
	(4, 'Contact', 'contact', NULL, NULL),
	(5, 'Image', 'image', NULL, NULL),
	(6, 'Ecommerce Link', 'ecommerce', NULL, NULL),
	(7, 'Trading Hours', 'hours', NULL, NULL);
/*!40000 ALTER TABLE `mjweb_tiles` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
