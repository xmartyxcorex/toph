-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2014 at 06:44 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `toph`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfiles`
--

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assetfiles`
--

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(44, 1, 1, '1500x1250-sports-01.jpeg', 'image', 1500, 1250, 144855, '2014-10-28 22:53:02', '2014-10-28 22:53:03', '2014-10-28 22:53:03', 'a86ff095-c8e1-4d97-954c-e878f57541ed'),
(45, 1, 1, '1500x1250-sports-03.jpeg', 'image', 1500, 1250, 240115, '2014-10-28 22:53:11', '2014-10-28 22:53:12', '2014-10-28 22:53:12', '9c1634b2-8b20-47f8-9e4d-308bf8639501'),
(48, 1, 1, '1500x1250-nightlife-01.jpeg', 'image', 1500, 1250, 234726, '2014-10-28 23:02:50', '2014-10-28 23:02:52', '2014-10-28 23:02:52', 'cbb31fbf-5afb-4dbe-b124-51cf10a1cb26'),
(54, 1, 1, '1500x1250-nature-01.jpeg', 'image', 1500, 1250, 417060, '2014-10-29 20:45:33', '2014-10-29 20:45:36', '2014-10-29 20:45:36', '42912c8b-4f47-4283-b57d-f5392f3f28b0'),
(63, 1, 1, 'thailand.png', 'image', 849, 517, 109065, '2014-12-01 22:55:18', '2014-12-01 22:55:19', '2014-12-01 22:55:19', '506da50e-2c9e-4980-acd6-741b69aa2481');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfolders`
--

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_assetfolders`
--

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Blog', '', '2014-10-14 18:12:10', '2014-10-14 18:12:10', 'd8f237a0-5d3f-4cdf-8448-d8aeebd99339');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetsources`
--

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_assetsources`
--

INSERT INTO `craft_assetsources` (`id`, `name`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Blog', 'Local', '{"path":"..\\/public\\/images\\/blog\\/","url":"\\/images\\/blog\\/"}', 1, 9, '2014-10-14 18:12:10', '2014-10-14 18:12:10', '25b5ea28-db0b-4a63-8642-6129f1b431da');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `craft_assettransformindex`
--

INSERT INTO `craft_assettransformindex` (`id`, `fileId`, `filename`, `format`, `location`, `sourceId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 45, NULL, NULL, '_1200x675_crop_top-center_90', 1, 0, 1, '2014-10-28 22:53:21', '0000-00-00 00:00:00', '2014-10-28 22:53:21', '4c83acb7-f0a8-4fbf-b718-efc6e620ab9b'),
(5, 45, '1500x1250-sports-03.jpeg', NULL, '_large', 1, 1, 0, '2014-10-28 22:55:11', '2014-10-28 22:55:11', '2014-10-28 22:55:12', '43d19c7f-f6ea-4ca9-b190-8328d3faa68a'),
(6, 45, '1500x1250-sports-03.jpeg', NULL, '_medium', 1, 1, 0, '2014-10-28 22:55:12', '2014-10-28 22:55:12', '2014-10-28 22:55:13', '4ca0728a-7fc3-45c1-811f-ba7e1ac08993'),
(7, 45, '1500x1250-sports-03.jpeg', NULL, '_small', 1, 1, 0, '2014-10-28 22:55:12', '2014-10-28 22:55:12', '2014-10-28 22:55:14', '59e92405-79bf-4187-8cba-497d0538511c'),
(8, 44, '1500x1250-sports-01.jpeg', NULL, '_large', 1, 1, 0, '2014-10-28 22:57:26', '2014-10-28 22:57:26', '2014-10-28 22:57:27', 'ef8b7c3d-59e9-4727-b3b0-5f6ec6f09eb7'),
(9, 48, '1500x1250-nightlife-01.jpeg', NULL, '_large', 1, 1, 0, '2014-10-28 23:03:12', '2014-10-28 23:03:12', '2014-10-28 23:03:13', '24f12a26-0de9-4bfb-a051-293e01ae6840'),
(10, 48, '1500x1250-nightlife-01.jpeg', NULL, '_medium', 1, 1, 0, '2014-10-28 23:03:12', '2014-10-28 23:03:12', '2014-10-28 23:03:14', 'f498b736-8152-497f-b620-fe236ac8bb86'),
(11, 48, '1500x1250-nightlife-01.jpeg', NULL, '_small', 1, 1, 0, '2014-10-28 23:03:12', '2014-10-28 23:03:12', '2014-10-28 23:03:14', '732a9fe4-5e9d-4b92-b612-bcac36c460df'),
(12, 54, '1500x1250-nature-01.jpeg', NULL, '_medium', 1, 1, 0, '2014-10-29 21:05:04', '0000-00-00 00:00:00', '2014-10-29 21:05:05', 'e90dcc6c-85cc-4797-be6b-99b3d5f72440'),
(13, 44, '1500x1250-sports-01.jpeg', NULL, '_medium', 1, 1, 0, '2014-10-30 00:36:50', '2014-10-30 00:36:50', '2014-10-30 00:36:52', '6c5f9382-ee4e-4dc2-8a76-6c651de9198f'),
(14, 44, '1500x1250-sports-01.jpeg', NULL, '_small', 1, 1, 0, '2014-10-30 00:36:51', '2014-10-30 00:36:51', '2014-10-30 00:36:52', '3d26871f-41e5-47fa-b1c4-cc7a34d6d2ea'),
(15, 63, 'thailand.png', NULL, '_large', 1, 1, 0, '2014-12-01 22:58:14', '2014-12-01 22:58:14', '2014-12-01 22:58:15', '4d6a5bdc-c86a-4234-8a93-6e2017153783'),
(16, 63, 'thailand.png', NULL, '_medium', 1, 1, 0, '2014-12-01 22:58:14', '2014-12-01 22:58:14', '2014-12-01 22:58:15', '979e2d86-1ec4-45ba-bc7c-127e5adc7ffa'),
(17, 63, 'thailand.png', NULL, '_small', 1, 1, 0, '2014-12-01 22:58:14', '2014-12-01 22:58:14', '2014-12-01 22:58:16', '64d86e17-d641-455f-9978-6ded7e2129ea');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `craft_assettransforms`
--

INSERT INTO `craft_assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `height`, `width`, `format`, `quality`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Thumb', 'thumb', 'crop', 'center-center', 200, 200, NULL, 90, '2014-10-28 21:15:39', '2014-10-14 18:12:55', '2014-10-28 21:15:39', '66af4b3a-71ca-492b-970d-f849c262deb1'),
(3, 'Large', 'large', 'crop', 'top-center', 675, 1200, NULL, 90, '2014-10-28 21:13:54', '2014-10-17 00:51:27', '2014-10-28 22:25:35', '458af413-b937-4a2c-aea9-303b20d1d946'),
(4, 'Small', 'small', 'crop', 'center-center', 225, 400, NULL, 90, '2014-10-28 21:15:15', '2014-10-17 00:52:02', '2014-10-28 21:15:15', 'e1dcd4f8-399c-4f00-93cf-c83d4b7f3525'),
(5, 'Medium', 'medium', 'crop', 'center-center', 450, 800, NULL, 100, '2014-10-28 22:39:23', '2014-10-28 22:39:23', '2014-10-28 22:39:23', 'f41cb039-d8dc-4971-a267-d072a9e95064');

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_i18n`
--

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_summary` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_summary`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', NULL, NULL, '2014-09-10 22:56:00', '2014-09-10 22:56:00', '4dfbad5f-b1f9-4692-bd93-894d7bd8de71'),
(2, 2, 'en_us', 'Homepage', NULL, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '03665ce7-b753-40bd-b240-78ea311d0b7b'),
(4, 4, 'en_us', 'What''s Up Thailand', '', '2014-10-14 19:26:28', '2014-10-30 00:49:19', '876e5f4d-7df2-4c2e-aace-103f31d27584'),
(31, 40, 'en_us', 'New Entry', '', '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'c31f07b1-80a6-4457-acf9-a0ad6e3df61a'),
(32, 44, 'en_us', '1500x1250-sports-01', NULL, '2014-10-28 22:53:03', '2014-10-28 22:53:03', '92aefd80-4cb3-4c2d-a4ad-c41fa3b1865f'),
(33, 45, 'en_us', '1500x1250-sports-03', NULL, '2014-10-28 22:53:12', '2014-10-28 22:53:12', '1736059f-a858-4062-b4ef-12ccaef4a7ef'),
(34, 48, 'en_us', '1500x1250-nightlife-01', NULL, '2014-10-28 23:02:52', '2014-10-28 23:02:52', '4223819f-79cd-409d-9f1b-742eb415064f'),
(36, 54, 'en_us', '1500x1250-nature-01', NULL, '2014-10-29 20:45:36', '2014-10-29 20:45:36', '2f7d4101-628d-4e3d-91d2-a51d830a6deb'),
(37, 60, 'en_us', 'T-Minus 45 Days', '', '2014-12-01 22:41:24', '2014-12-01 23:32:11', '7af4d8b4-571f-47b2-913e-71424ef7e2cb'),
(38, 63, 'en_us', 'thailand', NULL, '2014-12-01 22:55:19', '2014-12-01 22:55:19', 'd484370b-3f58-4791-8e86-7bb97b1bf857');

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_idx` (`archived`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=67 ;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'User', 1, 0, '2014-09-10 22:56:00', '2014-09-10 22:56:00', 'a4874091-8021-48a9-a67a-371931126361'),
(2, 'Entry', 1, 0, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '56078bd8-0f9d-4176-8150-f0927d0d2015'),
(4, 'Entry', 1, 0, '2014-10-14 19:26:28', '2014-10-30 00:49:19', 'e04032b0-14e0-439c-88b4-6ce4cfacb723'),
(5, 'MatrixBlock', 1, 0, '2014-10-14 19:26:28', '2014-10-30 00:49:20', 'c55a8836-6ec4-4ea2-862c-53e5852d8f3b'),
(8, 'MatrixBlock', 1, 0, '2014-10-17 02:30:23', '2014-10-30 00:49:20', 'dd1b2f59-f21b-4006-aadd-0cf1b585ee5d'),
(9, 'MatrixBlock', 1, 0, '2014-10-17 02:30:23', '2014-10-30 00:49:20', '49be0317-4bfe-43d6-a5cf-1de836711cce'),
(15, 'MatrixBlock', 1, 0, '2014-10-22 01:07:57', '2014-10-30 00:49:20', 'ebaaab44-c28f-4908-8d44-0d43fc6dbe5e'),
(25, 'MatrixBlock', 1, 0, '2014-10-28 21:59:57', '2014-10-30 00:49:20', '7c0a77cc-aef2-447c-bb26-373fd9773670'),
(40, 'Entry', 1, 0, '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'e9e68f96-be87-463f-ae7b-52611ccfc4c4'),
(41, 'MatrixBlock', 1, 0, '2014-10-28 22:50:52', '2014-11-29 19:03:38', '41ebce43-ace7-4f41-9a99-773aff4492d6'),
(42, 'MatrixBlock', 1, 0, '2014-10-28 22:50:52', '2014-11-29 19:03:38', '718ec030-b2ed-4265-814b-ce42be61631c'),
(43, 'MatrixBlock', 1, 0, '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'e0bb6bbd-29a3-4dd5-89c8-1d64e6b59ada'),
(44, 'Asset', 1, 0, '2014-10-28 22:53:03', '2014-10-28 22:53:03', 'ef485d3c-fc09-4317-81f6-0ecc1f7856fa'),
(45, 'Asset', 1, 0, '2014-10-28 22:53:12', '2014-10-28 22:53:12', '0ab3f978-a5cb-44f2-ac7a-b9562bc6e5a0'),
(47, 'MatrixBlock', 1, 0, '2014-10-28 23:01:51', '2014-11-29 19:03:38', 'beace748-a3f6-4502-a24d-3747f377135f'),
(48, 'Asset', 1, 0, '2014-10-28 23:02:52', '2014-10-28 23:02:52', '872c284b-4916-473d-a4f9-5a095977114e'),
(49, 'MatrixBlock', 1, 0, '2014-10-28 23:03:07', '2014-11-29 19:03:38', '44e3cfab-011c-4c8b-9872-c7a36f9924c8'),
(50, 'MatrixBlock', 1, 0, '2014-10-28 23:03:07', '2014-11-29 19:03:38', 'f678961c-9646-401b-989f-c09c923317d5'),
(52, 'MatrixBlock', 1, 0, '2014-10-29 19:01:12', '2014-11-29 19:03:38', '0550e513-f3fc-44a7-a9bb-bd293294941f'),
(54, 'Asset', 1, 0, '2014-10-29 20:45:35', '2014-10-29 20:45:35', 'c816c738-66ac-4755-8c54-9b18c142f309'),
(55, 'MatrixBlock', 1, 0, '2014-10-29 20:56:22', '2014-11-29 19:03:38', 'aa4d2f0b-44d3-49e9-b9d1-36873b84f44c'),
(56, 'MatrixBlock', 1, 0, '2014-10-29 20:56:22', '2014-11-29 19:03:38', 'b810f0c0-1446-4f14-aab6-052f2eeab8b8'),
(57, 'MatrixBlock', 1, 0, '2014-10-29 21:09:49', '2014-11-29 19:03:39', '0f15dfa6-6f1f-44b9-a3ea-0869aa5d482e'),
(58, 'MatrixBlock', 1, 0, '2014-11-29 18:47:26', '2014-11-29 19:03:39', '6989e537-255f-4761-b6d8-c77f1cb7aebb'),
(59, 'MatrixBlock', 1, 0, '2014-11-29 18:47:26', '2014-11-29 19:03:39', '4bb82a04-c0e4-4c5b-93de-f49b58634956'),
(60, 'Entry', 1, 0, '2014-12-01 22:41:24', '2014-12-01 23:32:11', 'ac22df3a-f817-471a-a61d-48561f15b061'),
(61, 'MatrixBlock', 1, 0, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '135e0606-3e10-47ef-ba3e-818aa12eb0f2'),
(62, 'MatrixBlock', 1, 0, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '8fbb07f5-290e-4e27-b2f2-31f20190cc02'),
(63, 'Asset', 1, 0, '2014-12-01 22:55:19', '2014-12-01 22:55:19', 'dcac6c69-75e7-40f6-806e-2f2d54b36aa0'),
(64, 'MatrixBlock', 1, 0, '2014-12-01 22:58:05', '2014-12-01 23:32:11', '19265c87-be18-4410-85b3-c1fb2ccc2ea7'),
(65, 'MatrixBlock', 1, 0, '2014-12-01 22:58:06', '2014-12-01 23:32:11', 'b11e4baa-f163-4e00-ac5a-c7011d234b73'),
(66, 'MatrixBlock', 1, 0, '2014-12-01 23:30:51', '2014-12-01 23:32:11', '4d954b3c-77dd-4e87-91fb-70282ad852f2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_i18n`
--

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=67 ;

--
-- Dumping data for table `craft_elements_i18n`
--

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', '', NULL, 1, '2014-09-10 22:56:00', '2014-09-10 22:56:00', '42507fef-226d-4365-a277-911c478c1142'),
(2, 2, 'en_us', 'homepage', '__home__', 1, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '5b41ec7b-872e-49d9-a6cb-cb738035a7f3'),
(4, 4, 'en_us', 'whats-up-thailand', 'blog/2014/whats-up-thailand', 1, '2014-10-14 19:26:28', '2014-10-30 00:49:20', 'ef24ab2f-28a9-4201-b5dc-6cc81412cb6a'),
(5, 5, 'en_us', '', NULL, 1, '2014-10-14 19:26:28', '2014-10-30 00:49:20', '1c59c99a-e2d2-44a6-abc7-63fe07132281'),
(8, 8, 'en_us', '', NULL, 1, '2014-10-17 02:30:23', '2014-10-30 00:49:20', '58609af9-1e5e-459f-9e83-02a240212857'),
(9, 9, 'en_us', '', NULL, 1, '2014-10-17 02:30:23', '2014-10-30 00:49:20', '23587151-e06b-4212-aa17-fef2a563f375'),
(15, 15, 'en_us', '', NULL, 1, '2014-10-22 01:07:57', '2014-10-30 00:49:20', 'a8227055-edc8-4e15-a1f4-f9330949ba0d'),
(25, 25, 'en_us', '', NULL, 1, '2014-10-28 21:59:57', '2014-10-30 00:49:20', '9ae58360-8f21-4842-b779-7a040af552b6'),
(40, 40, 'en_us', 'new-entry', 'blog/2014/new-entry', 1, '2014-10-28 22:50:52', '2014-11-29 19:03:38', '80e870e8-7290-4d53-8b22-969f03699940'),
(41, 41, 'en_us', '', NULL, 1, '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'b078f9e4-c486-40d0-a7ad-8dc31ce66c72'),
(42, 42, 'en_us', '', NULL, 1, '2014-10-28 22:50:52', '2014-11-29 19:03:38', '34477eef-3e67-40bd-916d-2823755e27ed'),
(43, 43, 'en_us', '', NULL, 1, '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'a6d3197f-bdb4-4f80-9b22-03732136f13e'),
(44, 44, 'en_us', '1500x1250-sports-01', NULL, 1, '2014-10-28 22:53:03', '2014-10-28 22:53:03', 'ab27299a-ea3d-49fb-8388-386d4a1f3eae'),
(45, 45, 'en_us', '1500x1250-sports-03', NULL, 1, '2014-10-28 22:53:12', '2014-10-28 22:53:12', '58290155-e425-4489-9c43-c7bacb1be37b'),
(47, 47, 'en_us', '', NULL, 1, '2014-10-28 23:01:51', '2014-11-29 19:03:38', 'facbded5-17c9-456e-aba3-43acea87ca62'),
(48, 48, 'en_us', '1500x1250-nightlife-01', NULL, 1, '2014-10-28 23:02:52', '2014-10-28 23:02:52', '5f9863b2-53dd-498d-a49a-aaccbbd4fab8'),
(49, 49, 'en_us', '', NULL, 1, '2014-10-28 23:03:07', '2014-11-29 19:03:38', 'ac0a946f-84e3-41bd-a21e-a140a3b9ad4f'),
(50, 50, 'en_us', '', NULL, 1, '2014-10-28 23:03:07', '2014-11-29 19:03:38', '98793814-78da-49f4-b37e-814a8185f7e2'),
(52, 52, 'en_us', '', NULL, 1, '2014-10-29 19:01:12', '2014-11-29 19:03:38', '02563018-c70d-4bf0-be0a-a82b7899b36f'),
(54, 54, 'en_us', '1500x1250-nature-01', NULL, 1, '2014-10-29 20:45:36', '2014-10-29 20:45:36', 'da22f18e-a9b1-4c1b-8f6e-141435400154'),
(55, 55, 'en_us', '', NULL, 1, '2014-10-29 20:56:22', '2014-11-29 19:03:38', '85b0068a-85d8-4dac-b8ea-5f3665943fa3'),
(56, 56, 'en_us', '', NULL, 1, '2014-10-29 20:56:22', '2014-11-29 19:03:38', '79a33429-ebc6-4429-8853-6c3ab6a248e2'),
(57, 57, 'en_us', '', NULL, 1, '2014-10-29 21:09:49', '2014-11-29 19:03:39', '439782c8-2d31-4698-82f8-17f231b91d2e'),
(58, 58, 'en_us', '', NULL, 1, '2014-11-29 18:47:26', '2014-11-29 19:03:39', 'bf38668b-8bcd-499d-b67e-d8f91ec82e78'),
(59, 59, 'en_us', '', NULL, 1, '2014-11-29 18:47:26', '2014-11-29 19:03:39', '652e5000-1a4d-4484-a28b-aba68a0715f4'),
(60, 60, 'en_us', 't-minus-45-days', 'blog/2014/t-minus-45-days', 1, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '61619e8d-d9e3-4fe3-82d0-c1d6720b7269'),
(61, 61, 'en_us', '', NULL, 1, '2014-12-01 22:41:25', '2014-12-01 23:32:11', 'e7300e6b-419b-4998-9b94-6ead95e8876e'),
(62, 62, 'en_us', '', NULL, 1, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '7862377f-b496-40a5-8f06-0c1ab2888cc4'),
(63, 63, 'en_us', 'thailand', NULL, 1, '2014-12-01 22:55:19', '2014-12-01 22:55:19', '8b493c19-d43d-47e4-86e6-37b441a06e08'),
(64, 64, 'en_us', '', NULL, 1, '2014-12-01 22:58:06', '2014-12-01 23:32:11', 'ed5d9415-920c-4a5d-932e-f8eac96b49e8'),
(65, 65, 'en_us', '', NULL, 1, '2014-12-01 22:58:06', '2014-12-01 23:32:11', '6b17f027-7cb2-41cb-9420-29846cdabea5'),
(66, 66, 'en_us', '', NULL, 1, '2014-12-01 23:30:51', '2014-12-01 23:32:11', '859fb05b-262f-463a-a7c5-42ec39fb9f24');

-- --------------------------------------------------------

--
-- Table structure for table `craft_emailmessages`
--

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 1, NULL, '2014-09-10 22:56:04', NULL, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '5db5ed3f-6a99-466d-9574-a2560d456508'),
(4, 2, 3, 1, '2014-10-14 19:26:00', NULL, '2014-10-14 19:26:29', '2014-10-30 00:49:20', '4180e51d-dfd3-4ce7-b3df-2de5592f76bf'),
(40, 2, 3, 1, '2014-10-28 22:50:00', NULL, '2014-10-28 22:50:52', '2014-11-29 19:03:39', '7ff3f38a-00d6-4ddb-8b64-d9fac0c64b4d'),
(60, 2, 3, 1, '2014-12-01 22:41:00', NULL, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '47e636f9-8e68-4c4c-8d1b-91cf28cfed47');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 3, 'Homepage', 'homepage', 0, NULL, '{section.name|raw}', NULL, '2014-09-10 22:56:04', '2014-10-14 16:38:12', '4c0f672b-6495-44dd-af9b-d9256b7e608b'),
(3, 2, 19, 'Blog', 'blog', 1, 'Title', NULL, NULL, '2014-10-14 18:16:30', '2014-10-17 02:28:27', '40d8d4b5-66e0-43bd-b5ef-6d0bf2b1d353');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 'Blog', '2014-10-14 18:04:28', '2014-10-14 18:04:28', '62ee0ae6-3276-4bf4-88ff-005cf7c782b9'),
(3, 'Assets', '2014-10-17 00:35:53', '2014-10-17 00:35:53', 'addcbc5f-ab96-402e-88d9-d85b302d86ab');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=81 ;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(26, 19, 4, 11, 0, 1, '2014-10-17 02:28:27', '2014-10-17 02:28:27', '85dc6a1c-f854-49ae-95ee-738c22751c2e'),
(27, 19, 4, 4, 0, 2, '2014-10-17 02:28:27', '2014-10-17 02:28:27', '63410a1a-9ecd-4c06-a902-137912b2b801'),
(28, 19, 4, 10, 0, 3, '2014-10-17 02:28:27', '2014-10-17 02:28:27', '26333720-7d58-4ef0-a4d4-ba899d3a6156'),
(29, 19, 4, 3, 0, 4, '2014-10-17 02:28:27', '2014-10-17 02:28:27', 'c17742d3-7728-4003-ae2e-4f2ea1fcbfc4'),
(57, 36, NULL, 12, 0, 1, '2014-10-28 23:01:28', '2014-10-28 23:01:28', 'd66786b1-663d-4b07-8bdc-54a3f0798b21'),
(58, 36, NULL, 13, 0, 2, '2014-10-28 23:01:28', '2014-10-28 23:01:28', 'fda123d9-12cc-496d-a767-939314d884ca'),
(59, 37, NULL, 17, 0, 1, '2014-10-28 23:01:28', '2014-10-28 23:01:28', '9d98b795-6e63-444c-8eae-92a791e49bff'),
(74, 46, NULL, 5, 0, 1, '2014-12-02 00:21:05', '2014-12-02 00:21:05', '763fb113-8915-4951-9bcf-a51241f7c038'),
(75, 46, NULL, 16, 0, 2, '2014-12-02 00:21:05', '2014-12-02 00:21:05', '4c452e63-cf95-42cf-a521-4aafbc9f48be'),
(76, 47, NULL, 6, 0, 1, '2014-12-02 00:21:05', '2014-12-02 00:21:05', '8fd148af-56ba-435f-9fcf-d163c5af09d0'),
(77, 47, NULL, 7, 0, 2, '2014-12-02 00:21:05', '2014-12-02 00:21:05', 'c8fe9aac-b800-472c-95ae-577684534183'),
(78, 47, NULL, 8, 0, 3, '2014-12-02 00:21:05', '2014-12-02 00:21:05', '6ba65a16-6fc0-4ceb-8a21-cba79b48f2d5'),
(79, 48, NULL, 9, 0, 1, '2014-12-02 00:21:05', '2014-12-02 00:21:05', 'cf0c88c1-2fd3-4af6-9f09-e50ec849ab3a'),
(80, 49, NULL, 18, 0, 1, '2014-12-02 00:21:05', '2014-12-02 00:21:05', '08126800-1dec-4ca4-82b8-9f31db50877f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=50 ;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Tag', '2014-09-10 22:56:03', '2014-09-10 22:56:03', '117eddd0-37cd-4aab-91b4-5b5da11648a1'),
(3, 'Entry', '2014-09-10 22:56:04', '2014-09-10 22:56:04', 'a2ab7603-9a2f-4ae6-bc10-e61adbdf3ab2'),
(9, 'Asset', '2014-10-14 18:12:10', '2014-10-14 18:12:10', '22e193b0-ed09-4a87-8755-ca0a2d7b0ece'),
(19, 'Entry', '2014-10-17 02:28:27', '2014-10-17 02:28:27', '09a3e9b9-646c-4cae-a958-56c16b67adad'),
(36, 'MatrixBlock', '2014-10-28 23:01:28', '2014-10-28 23:01:28', '504439e7-8443-42db-bba7-87579fdc8915'),
(37, 'MatrixBlock', '2014-10-28 23:01:28', '2014-10-28 23:01:28', '90e77bba-60ef-4b50-8b7d-888501ac6d76'),
(46, 'MatrixBlock', '2014-12-02 00:21:05', '2014-12-02 00:21:05', 'bbbebcfd-c094-40ca-b5ca-f2b6a6158b5b'),
(47, 'MatrixBlock', '2014-12-02 00:21:05', '2014-12-02 00:21:05', 'ea166cdb-d066-4c76-abbb-2b51ad13c37e'),
(48, 'MatrixBlock', '2014-12-02 00:21:05', '2014-12-02 00:21:05', 'e4561401-f480-4905-b5b5-8a00003fb9fd'),
(49, 'MatrixBlock', '2014-12-02 00:21:05', '2014-12-02 00:21:05', '1d59a6bb-d8e8-4eb4-a2bd-86e74a559c16');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 'Content', 1, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '43d3a874-7af8-4c16-8620-c045e1222a2f'),
(4, 19, 'Blog', 1, '2014-10-17 02:28:27', '2014-10-17 02:28:27', 'fbfc1184-bb65-4fcc-bb6c-785ff92ed333');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 'Tags', 'tags', 'global', '', 0, 'Tags', '{"source":"taggroup:1"}', '2014-09-10 22:56:04', '2014-10-14 18:19:03', 'd6cec3a1-b313-4c83-a5cd-931a9ceb764a'),
(4, 2, 'Article', 'article', 'global', '', 0, 'Matrix', '{"maxBlocks":null}', '2014-10-14 18:08:36', '2014-12-02 00:21:05', '90438b64-f695-43ea-87c2-03284c31490f'),
(5, NULL, 'Text', 'text', 'matrixBlockType:1', NULL, 0, 'RichText', '{"configFile":"","cleanupHtml":"","purifyHtml":""}', '2014-10-14 18:08:37', '2014-12-02 00:21:05', '82135d92-61f8-4e87-89e7-11e2552d7977'),
(6, NULL, 'Image', 'image', 'matrixBlockType:2', NULL, 0, 'Assets', '{"useSingleFolder":"","sources":"*","defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"","limit":""}', '2014-10-14 18:08:37', '2014-12-02 00:21:05', '47decc0a-5750-4b0d-a5fc-cd813122dedd'),
(7, NULL, 'Caption', 'caption', 'matrixBlockType:2', NULL, 0, 'RichText', '{"configFile":"","cleanupHtml":"1","purifyHtml":""}', '2014-10-14 18:08:37', '2014-12-02 00:21:05', '4b7181c6-b452-4ce5-9273-d86b79fe57f9'),
(8, NULL, 'Position', 'position', 'matrixBlockType:2', NULL, 0, 'PositionSelect', '{"options":["left","center","right","full"]}', '2014-10-14 18:08:37', '2014-12-02 00:21:05', '42fdbac3-7c19-49b8-808b-c924e2f037e5'),
(9, NULL, 'Heading', 'heading', 'matrixBlockType:3', NULL, 0, 'PlainText', '{"placeholder":"","maxLength":"","multiline":"","initialRows":"4"}', '2014-10-14 18:08:37', '2014-12-02 00:21:05', '6d7c0fe2-fd7d-4600-8f75-fafb031f750c'),
(10, 2, 'Summary', 'summary', 'global', '', 0, 'RichText', '{"configFile":"","cleanupHtml":"1","purifyHtml":""}', '2014-10-14 18:09:08', '2014-10-17 02:39:41', 'dfeaf045-4108-4c8b-a49a-dfaef24a1c16'),
(11, 2, 'Intro', 'intro', 'global', '', 0, 'Matrix', '{"maxBlocks":null}', '2014-10-17 01:34:21', '2014-10-28 23:01:28', '97abe8bc-d61a-4d89-a7bd-a9f5aa66f363'),
(12, NULL, 'Text', 'text', 'matrixBlockType:4', NULL, 0, 'RichText', '{"configFile":"","cleanupHtml":"1","purifyHtml":""}', '2014-10-17 01:34:22', '2014-10-28 23:01:28', 'b7d6acde-e968-4a08-860e-18b1a8d93b94'),
(13, NULL, 'Image', 'image', 'matrixBlockType:4', NULL, 0, 'Assets', '{"useSingleFolder":"","sources":"*","defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"","limit":""}', '2014-10-17 01:34:23', '2014-10-28 23:01:28', 'dfdee339-e8ac-44f3-8622-b1f14cd11d12'),
(16, NULL, 'Position', 'position', 'matrixBlockType:1', NULL, 0, 'PositionSelect', '{"options":["left","center","right","full"]}', '2014-10-21 22:38:14', '2014-12-02 00:21:05', '5b8f7e34-0171-4b43-ac13-0898b2710bb0'),
(17, NULL, 'Image', 'image', 'matrixBlockType:6', NULL, 0, 'Assets', '{"useSingleFolder":"","sources":"*","defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"","limit":"1"}', '2014-10-28 23:01:28', '2014-10-28 23:01:28', '4b95ad32-a1c6-49a9-aaff-fe902966570e'),
(18, NULL, 'Image', 'image', 'matrixBlockType:7', NULL, 0, 'Assets', '{"useSingleFolder":"","sources":"*","defaultUploadLocationSource":"1","defaultUploadLocationSubpath":"","singleUploadLocationSource":"1","singleUploadLocationSubpath":"","restrictFiles":"","limit":""}', '2014-10-29 18:57:06', '2014-12-02 00:21:05', '69914940-a154-42ea-9a3e-409f0c172e0e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `build`, `schemaVersion`, `releaseDate`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `track`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2.2', 2598, '2.2.1', '2014-10-27 21:26:50', 0, 'Toph.er', 'http://toph.dev', 'UTC', 1, 0, 'stable', '2014-09-10 22:55:57', '2014-10-28 22:33:55', '02cd11fe-b4d2-48f9-9dd5-526bbf3c63ed');

-- --------------------------------------------------------

--
-- Table structure for table `craft_locales`
--

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_locales`
--

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
('en_us', 1, '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'd6dd2e16-b233-4579-8e54-860fb4dd77f0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixblocks`
--

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `ownerLocale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 4, 4, 1, NULL, 2, '2014-10-14 19:26:29', '2014-10-30 00:49:20', 'd1914664-1cfb-4163-9786-45114bbe7c1c'),
(8, 4, 11, 4, NULL, 1, '2014-10-17 02:30:23', '2014-10-30 00:49:20', 'ebff9e40-4042-4cb9-8257-84aecc40da80'),
(9, 4, 4, 2, NULL, 3, '2014-10-17 02:30:23', '2014-10-30 00:49:20', '7fa98c66-ff09-421d-91f3-29c7e449e596'),
(15, 4, 4, 3, NULL, 1, '2014-10-22 01:07:57', '2014-10-30 00:49:20', 'd2dcbe07-94bb-462e-b9d9-6954039d9c10'),
(25, 4, 4, 1, NULL, 4, '2014-10-28 21:59:57', '2014-10-30 00:49:20', '046e8839-550d-456c-9f1c-beda9603a6df'),
(41, 40, 11, 4, NULL, 1, '2014-10-28 22:50:52', '2014-11-29 19:03:38', '5c0d937f-8839-4789-bfdc-d82f9c788850'),
(42, 40, 4, 1, NULL, 2, '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'd43f9408-43f8-4d4b-8895-d1664253103e'),
(43, 40, 4, 2, NULL, 3, '2014-10-28 22:50:52', '2014-11-29 19:03:38', 'ef911391-a776-45a3-84c0-8d786c9bad25'),
(47, 40, 11, 6, NULL, 2, '2014-10-28 23:01:51', '2014-11-29 19:03:38', '99e8db31-7f05-4165-8f0c-97421d6413c2'),
(49, 40, 4, 1, NULL, 4, '2014-10-28 23:03:07', '2014-11-29 19:03:38', '0a245378-fa39-4886-9f04-dec0992b28af'),
(50, 40, 4, 2, NULL, 5, '2014-10-28 23:03:07', '2014-11-29 19:03:38', 'af5a6145-ee6d-4358-a433-d667c7ecdc30'),
(52, 40, 4, 7, NULL, 7, '2014-10-29 19:01:12', '2014-11-29 19:03:39', '814b8005-204e-4737-95ef-b6cf08b80ba9'),
(55, 40, 4, 3, NULL, 1, '2014-10-29 20:56:22', '2014-11-29 19:03:38', 'c6ee5511-6a7a-4590-a113-5ea55ef4049b'),
(56, 40, 4, 3, NULL, 6, '2014-10-29 20:56:22', '2014-11-29 19:03:38', 'b83ed0e5-4ad7-49c3-a6b8-179dd7075fe5'),
(57, 40, 4, 1, NULL, 8, '2014-10-29 21:09:49', '2014-11-29 19:03:39', 'ea2709da-c327-4fca-a8ed-38f747d3dc1f'),
(58, 40, 4, 1, NULL, 9, '2014-11-29 18:47:26', '2014-11-29 19:03:39', '6c7d9280-467f-4f91-9193-c5fe1c064e7d'),
(59, 40, 4, 3, NULL, 10, '2014-11-29 18:47:26', '2014-11-29 19:03:39', '2425c261-d2b6-4e7c-be7a-5160188efa6f'),
(61, 60, 11, 4, NULL, 1, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '2f1669da-d959-47a0-8ccb-bc604848d87f'),
(62, 60, 4, 1, NULL, 2, '2014-12-01 22:41:25', '2014-12-01 23:32:11', '785d8394-002f-4f13-9998-10c35e2c9a90'),
(64, 60, 4, 2, NULL, 3, '2014-12-01 22:58:06', '2014-12-01 23:32:11', '40d9dd2e-59f4-4a9e-a9d8-e2db8cff020d'),
(65, 60, 4, 1, NULL, 4, '2014-12-01 22:58:06', '2014-12-01 23:32:11', '31cf5e85-8b92-45c6-a572-6602b0334e9a'),
(66, 60, 4, 3, NULL, 1, '2014-12-01 23:30:51', '2014-12-01 23:32:11', '5a7663ad-c26d-439a-ba33-727451909f89');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `craft_matrixblocktypes`
--

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 4, 46, 'Text', 'text', 1, '2014-10-14 18:08:37', '2014-12-02 00:21:05', 'e259d12c-8071-4391-b3ee-fda732581e88'),
(2, 4, 47, 'Image', 'image', 2, '2014-10-14 18:08:37', '2014-12-02 00:21:05', 'e39fb9ab-38b6-4710-b281-acdc54cbb1a4'),
(3, 4, 48, 'Heading', 'heading', 3, '2014-10-14 18:08:37', '2014-12-02 00:21:05', '680b997c-5372-4e2d-94c4-1f7f08fc9462'),
(4, 11, 36, 'Text', 'text', 1, '2014-10-17 01:34:22', '2014-10-28 23:01:28', '2c3ce839-e9ac-413a-aeaa-879048ef2e5f'),
(6, 11, 37, 'Image', 'image', 2, '2014-10-28 23:01:28', '2014-10-28 23:01:28', 'f5f9c6a4-a100-4a37-ba47-de32c79ea466'),
(7, 4, 49, 'Gallery', 'gallery', 4, '2014-10-29 18:57:06', '2014-12-02 00:21:05', '44d43ca8-162d-46f3-9644-6de704dc4f10');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_article`
--

CREATE TABLE `craft_matrixcontent_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_text_text` text COLLATE utf8_unicode_ci,
  `field_image_caption` text COLLATE utf8_unicode_ci,
  `field_image_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_heading_heading` text COLLATE utf8_unicode_ci,
  `field_text_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_article_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_article_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `craft_matrixcontent_article`
--

INSERT INTO `craft_matrixcontent_article` (`id`, `elementId`, `locale`, `field_text_text`, `field_image_caption`, `field_image_position`, `field_heading_heading`, `field_text_position`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 'en_us', '<p>Crucifix drinking vinegar Pinterest blog, PBR&amp;B Shoreditch viral you probably haven''t heard of them occupy authentic aesthetic skateboard PBR. Pickled VHS mustache cliche, Godard cornhole four loko. Wolf pour-over Odd Future biodiesel. Art party skateboard freegan, authentic brunch raw denim typewriter swag aesthetic gentrify scenester salvia dreamcatcher. </p>', NULL, NULL, NULL, 'left', '2014-10-14 19:26:28', '2014-10-30 00:49:20', '4fd760ce-73e9-4364-9187-6be59cbeafb8'),
(2, 9, 'en_us', NULL, '<p>From a bold new font to a brand new name, hear how Cooper Hewitt is reimagining itself for the 21st century and how the museum’s new identity was conceived and designed.</p>', 'right', NULL, NULL, '2014-10-17 02:30:23', '2014-10-30 00:49:20', 'd38e3732-fcbc-454a-a5bd-e52d0236154a'),
(3, 15, 'en_us', NULL, NULL, NULL, 'Heading', NULL, '2014-10-22 01:07:57', '2014-10-30 00:49:20', 'fc8b1b50-2539-406f-9e5a-41194dfddbe4'),
(4, 25, 'en_us', '<p>From a bold new font to a brand new name, hear how Cooper Hewitt is reimagining itself for the 21st century and how the museum’s new identity was conceived and designed. Eddie Opara (Pentagram) and Chester Jenkins (Village) talk with Caroline Baumann, Cooper Hewitt’s director, in a 90 minute talk recorded 10 September, 2014.</p>', NULL, NULL, NULL, 'left', '2014-10-28 21:59:57', '2014-10-30 00:49:20', '0e6aef79-b7d2-4661-8d76-c60051b6afbb'),
(6, 42, 'en_us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>', NULL, NULL, NULL, 'left', '2014-10-28 22:50:52', '2014-11-29 19:03:38', '3510ef58-5222-48fd-a6d6-e21026bdc3cb'),
(7, 43, 'en_us', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>', 'right', NULL, NULL, '2014-10-28 22:50:52', '2014-11-29 19:03:38', '28aff806-c6bb-4d69-9930-946276af5916'),
(8, 49, 'en_us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>', NULL, NULL, NULL, 'left', '2014-10-28 23:03:07', '2014-11-29 19:03:38', '4b831ac5-aadc-4497-bdeb-c5cfb7dfe43a'),
(9, 50, 'en_us', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'right', NULL, NULL, '2014-10-28 23:03:07', '2014-11-29 19:03:38', 'b17ae662-1e8c-41e2-b2cf-09ad87c0ab8c'),
(11, 52, 'en_us', NULL, NULL, NULL, NULL, NULL, '2014-10-29 19:01:12', '2014-11-29 19:03:38', 'fa2a3271-6d5f-4b3d-8101-c12e580eac93'),
(12, 55, 'en_us', NULL, NULL, NULL, 'Preparation', NULL, '2014-10-29 20:56:22', '2014-11-29 19:03:38', 'e22b726b-fbb5-4e0b-b35a-205b6a18f53d'),
(13, 56, 'en_us', NULL, NULL, NULL, 'Here We Go', NULL, '2014-10-29 20:56:22', '2014-11-29 19:03:38', 'bc95c8f4-dd03-41f0-9b0f-c6cb9b9bcb94'),
(14, 57, 'en_us', '<p>\n	Lorem ipsum dolor sit amet, \n	<strong>consectetur</strong> adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <em>Excepteur sint occaecat</em> cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n</p>\n<ul><li>List Item</li>\n	<li>Item Two</li>\n</ul>', NULL, NULL, NULL, 'full', '2014-10-29 21:09:49', '2014-11-29 19:03:39', '68764529-f9b1-4880-a6ca-4c486ec4a95c'),
(15, 58, 'en_us', '<p>Lorem ipsum dolor sit amet, <strong>consectetur</strong> adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <em>Excepteur sint occaecat</em> cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, NULL, NULL, 'full', '2014-11-29 18:47:26', '2014-11-29 19:03:39', '34fdcb81-e35d-4481-ba0b-f8bc20952f90'),
(16, 59, 'en_us', NULL, NULL, NULL, 'Poop', NULL, '2014-11-29 18:47:26', '2014-11-29 19:03:39', '358da5d3-3c92-4dc4-b4f5-39cbdbe26421'),
(17, 62, 'en_us', '<p>\n	When winter destroyed everyones lives last winter I made a promise to myself: \n	<strong>Get the fuck out of Michigan before it''s too late! </strong>At the same time I was tortured by Facebook photos of friends in bikinis basking in the sun next to crystal clear blue waters, chilling with monkeys, hiking the jungles, etc. I was all like, where the <em>frig</em> are these girls? <strong>I WANNA GO! </strong>Thailand was seemingly the place to be. \n</p>\n<p>\n	So, needless to say I set a goal to save up and get out to Thailand by the time winter was in full effect. After about 7 months I grew a pair and bought a plane ticket.\n</p>', NULL, NULL, NULL, 'full', '2014-12-01 22:41:25', '2014-12-01 23:32:11', '604aa102-6477-4ed3-ab87-08cd5e945fd3'),
(18, 64, 'en_us', NULL, '', 'full', NULL, NULL, '2014-12-01 22:58:05', '2014-12-01 23:32:11', 'c1922821-0c9f-40ba-a7b3-d267a915a906'),
(19, 65, 'en_us', '<p>\n	The hardest part of the trip is putting together some sort of plan for what happens when I get there. My idea of planning for this trip is to have an idea of where I''d like to go, loosely plan around those places, and let everything else just happen. This makes me a little bit anxious, but I can''t see the point in making a day-to-day itinerary with all that there is to do and see in a place like Thailand. The only thing I really want to do is take an open-water dive course in order to scuba dive whenever/wherever I want.\n</p>\n<p>\n	Below is a list of helpful resources regarding my trip:\n</p>\n<dl><dt><a href="http://www.nomadicmatt.com/travel-guides/thailand-travel-tips/" title="Thailand Travel Tips">Nomadic Matt: Thailand Travel Tips</a></dt>\n	<dd class="chunk_divide">Awesome tips &amp; resources regarding money, things to do, food, etc.</dd>\n	<dt><a href="http://www.nomadicmatt.com/travel-guides/thailand-travel-tips/" title="Thailand Travel Tips">Nomadic Matt: Thailand Travel Tips</a></dt>\n	<dd class="chunk_divide">Awesome tips &amp; resources regarding money, things to do, food, etc.</dd>\n</dl>', NULL, NULL, NULL, 'full', '2014-12-01 22:58:06', '2014-12-01 23:32:11', '0f08bb54-0067-4be9-9c8e-f4d337f01993'),
(20, 66, 'en_us', NULL, NULL, NULL, 'The Plan', NULL, '2014-12-01 23:30:51', '2014-12-01 23:32:11', 'a3b496f7-b9e5-439b-8735-1632f94ae04d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_intro`
--

CREATE TABLE `craft_matrixcontent_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_text_text` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_intro_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_intro_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `craft_matrixcontent_intro`
--

INSERT INTO `craft_matrixcontent_intro` (`id`, `elementId`, `locale`, `field_text_text`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 8, 'en_us', '<p>From a bold new font to a brand new name, hear how Cooper Hewitt is reimagining itself for the 21st century and how the museum’s new identity was conceived and designed. Eddie Opara (Pentagram) and Chester Jenkins (Village) talk with Caroline Baumann, Cooper Hewitt’s director, in a 90 minute talk recorded 10 September, 2014.</p>', '2014-10-17 02:30:23', '2014-10-30 00:49:20', 'dec60f8c-3073-4f71-a1c9-50c269563f00'),
(4, 41, 'en_us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '2014-10-28 22:50:52', '2014-11-29 19:03:38', '46f4998e-a990-4c27-bbf5-d3305f507281'),
(6, 47, 'en_us', NULL, '2014-10-28 23:01:51', '2014-11-29 19:03:38', '7c4d0270-857a-47e3-b834-8401f67b0ae4'),
(7, 61, 'en_us', '<p>\r\n	So, only a month and a half left before I leave for one of the most beautiful places on earth, Thailand. That said, the butterflies in my belly are in full effect. This article will outline the process of making this trip a reality and outline some of the things I''d like to do/places I''d like to go.\r\n</p>', '2014-12-01 22:41:25', '2014-12-01 23:32:11', '19ceb6c1-d44d-424f-8e78-bbf4dc931cd5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'm000000_000000_base', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '64641cc1-fab9-4ba5-b2eb-d569d4e5a658'),
(2, NULL, 'm131203_000000_allow_orphan_assets', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '9ec5c482-249a-473b-b52c-233a89a9bf4e'),
(3, NULL, 'm131212_000001_add_missing_fk_to_emailmessages', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '216567f7-6a2a-4c04-8fe2-4dae24bb61b8'),
(4, NULL, 'm140123_000000_update_widget_sort_orders', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'ae5f226a-02d2-4494-b200-13bc21163029'),
(5, NULL, 'm140212_000000_clean_up_structures', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2e0ea2de-ba47-43b9-b710-0c4b80d4efa3'),
(6, NULL, 'm140217_000000_add_missing_indexes', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '400e8d5d-d4dc-4a90-81ea-2232e7d74dc0'),
(7, NULL, 'm140223_000000_add_missing_element_rows', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '9c05f089-6c87-4392-becd-ced82ae8c396'),
(8, NULL, 'm140325_000000_fix_matrix_settings', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'fb094252-1b8b-4633-807d-0525439cf3bb'),
(9, NULL, 'm140401_000000_assignUserPermissions_permission', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '5d508889-11b7-4478-bc40-530fafca2247'),
(10, NULL, 'm140401_000000_delete_the_deleted_files', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'afeffeb5-d952-4977-813d-6dbef8411112'),
(11, NULL, 'm140401_000001_structures', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'a8796c43-badd-4e89-8aad-e963478ed280'),
(12, NULL, 'm140401_000002_elements_i18n_tweaks', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'c50090a3-46bf-4d27-98fe-b878b10bc0dd'),
(13, NULL, 'm140401_000003_tag_groups', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '6aac656e-f572-4d0c-a829-ac5694e4f814'),
(14, NULL, 'm140401_000004_add_unverifiedemail_column_to_users', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '7cf469b9-7c25-4c1f-b38b-716be0e2e959'),
(15, NULL, 'm140401_000005_translatable_matrix_fields', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '64df1935-d4d8-4095-a43d-03bb69e8f6cc'),
(16, NULL, 'm140401_000006_translatable_relation_fields', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'a0bf138d-7ef1-426d-94cd-17af22cb7939'),
(17, NULL, 'm140401_000007_add_enabledbydefault_column_to_sections_i18n', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '999c420a-e7b8-4554-b991-683111b1b7c7'),
(18, NULL, 'm140401_000008_fullpath_to_path', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '0eb98de1-a1c3-46d7-9b58-22c4284f224e'),
(19, NULL, 'm140401_000009_asset_field_layouts', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'b950fcdc-ba09-467c-a132-4961c4dda35b'),
(20, NULL, 'm140401_000010_no_section_default_author', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '0ab95a1f-4017-4f87-95f8-d1adf17d9f4b'),
(21, NULL, 'm140401_000011_categories', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'f4b5a91e-79d8-4411-aeeb-044696f3b3c5'),
(22, NULL, 'm140401_000012_templatecaches', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '53af0db2-dcca-4d35-86ce-48e3b7375f82'),
(23, NULL, 'm140401_000013_allow_temp_source_transforms', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '19b3e8ac-a9a1-4640-b89c-d0aea8a92cd8'),
(24, NULL, 'm140401_000014_entry_title_formats', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2710fa73-9926-4e77-b384-b75219bade10'),
(25, NULL, 'm140401_000015_tasks', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '9f996f6e-301f-4274-9563-6d6fc0e6a827'),
(26, NULL, 'm140401_000016_varchar_classes', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'e7803d73-b9ce-4306-8e04-0764a64a109f'),
(27, NULL, 'm140401_000017_add_transform_quality', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '51e0e032-2619-47cb-9b97-99914bbe3368'),
(28, NULL, 'm140401_000018_locale_routes', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '7bb0a1ef-0c1c-446e-84a4-6f6ee5fcff62'),
(29, NULL, 'm140401_000019_editions', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'de610524-d8a2-48d7-ba37-22e844e0f187'),
(30, NULL, 'm140401_000019_rackspace_auth_api', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'bcf1cbab-dcdf-41e4-b884-9cc8c4873302'),
(31, NULL, 'm140401_000020_deprecationerrors_table', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'cf22d025-c120-48fa-b4b0-e98587967cad'),
(32, NULL, 'm140401_000021_client_user', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '4b8afa36-536e-4156-84d5-8097ed66cc42'),
(33, NULL, 'm140401_100000_resave_elements', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '0cc7bdf4-5727-4b71-8ceb-fdc6d6f806ce'),
(34, NULL, 'm140401_100002_delete_compiled_templates', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '650861b2-83e9-4522-895e-c43e2d5841e9'),
(35, NULL, 'm140403_000000_allow_orphan_assets_again', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '191fe0b9-b0e3-43b4-b197-e3c307a0f405'),
(36, NULL, 'm140508_000000_fix_disabled_matrix_blocks', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2dee88a5-38be-4c3d-befe-de6cf8c83e85'),
(37, NULL, 'm140520_000000_add_id_column_to_templatecachecriteria', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '561ccfb1-700f-4ef7-a817-6c12e69c3c37'),
(38, NULL, 'm140603_000000_draft_names', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'e57f6881-9af7-4bcc-81bb-1350960f6e4a'),
(39, NULL, 'm140603_000001_draft_notes', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '6e7ce6f9-70f3-4e5c-ab0b-9f6789e7e20d'),
(40, NULL, 'm140603_000002_version_nums', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '50fe61ce-511d-4a19-8871-f6f3d0b7adf4'),
(41, NULL, 'm140603_000003_version_toggling', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'f1fe7657-47c0-4991-b363-e7265902daef'),
(42, NULL, 'm140603_000004_tokens', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'ee2d2d33-59ba-4637-acaa-1565cf3a0fe5'),
(43, NULL, 'm140603_000005_asset_sources', '2014-09-10 22:55:58', '2014-09-10 22:55:58', '2014-09-10 22:55:58', 'ac836b19-44e5-4873-9e31-dfad7a1f4d04'),
(44, NULL, 'm140716_000001_allow_temp_source_transforms_again', '2014-10-14 16:28:36', '2014-10-14 16:28:36', '2014-10-14 16:28:36', '60f3224e-7759-4c4a-90af-9c5adc61b499'),
(45, NULL, 'm140731_000001_resave_elements_with_assets_in_temp_sources', '2014-10-14 16:28:36', '2014-10-14 16:28:36', '2014-10-14 16:28:36', 'af4385fe-6a3a-4106-aeaa-5b2acafe5db4'),
(46, NULL, 'm140730_000001_add_filename_and_format_to_transformindex', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '2014-10-14 16:38:12', 'fff53652-fc12-4c11-95d6-816cfca1aaf1'),
(47, NULL, 'm140815_000001_add_format_to_transforms', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '5e034250-66d3-4198-bc7e-aeed060607ab'),
(48, NULL, 'm140822_000001_allow_more_than_128_items_per_field', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '2014-10-14 16:38:12', 'c663171a-f3c1-4173-97dc-36d8640abb9c'),
(49, NULL, 'm140829_000001_single_title_formats', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '92a62a41-6748-4680-be0e-b69ddd5967aa'),
(50, NULL, 'm140831_000001_extended_cache_keys', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '4a4f4261-293b-4557-b25e-313ff194e4eb'),
(51, NULL, 'm140922_000001_delete_orphaned_matrix_blocks', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '2014-10-14 16:38:12', '610e807a-924d-4c39-8a4c-17c33a128fd2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_rackspaceaccess`
--

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=144 ;

--
-- Dumping data for table `craft_relations`
--

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceLocale`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(127, 17, 47, NULL, 44, 1, '2014-11-29 19:03:38', '2014-11-29 19:03:38', '56a273d8-1c90-4885-9cdb-66e982bd74ec'),
(128, 6, 43, NULL, 45, 1, '2014-11-29 19:03:38', '2014-11-29 19:03:38', '8dca1888-e145-4e9e-9e85-35b2c9ec1f8b'),
(129, 6, 50, NULL, 48, 1, '2014-11-29 19:03:38', '2014-11-29 19:03:38', '95dcb8c4-a576-4f7a-8fa8-114eea342737'),
(130, 18, 52, NULL, 48, 1, '2014-11-29 19:03:39', '2014-11-29 19:03:39', 'b6a50762-57fc-48a3-918a-cf2ccdb2af81'),
(131, 18, 52, NULL, 44, 2, '2014-11-29 19:03:39', '2014-11-29 19:03:39', 'ff98e593-5631-4b7d-87ea-507fd5decac1'),
(132, 18, 52, NULL, 45, 3, '2014-11-29 19:03:39', '2014-11-29 19:03:39', '25189094-ab63-4d76-9f9c-1dc1fc3196a9'),
(143, 6, 64, NULL, 63, 1, '2014-12-01 23:32:11', '2014-12-01 23:32:11', '411a7987-74aa-400b-a481-0527f9bd24b8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(1, 'username', 0, 'en_us', ' admin '),
(1, 'firstname', 0, 'en_us', ''),
(1, 'lastname', 0, 'en_us', ''),
(1, 'fullname', 0, 'en_us', ''),
(1, 'email', 0, 'en_us', ' christophergroenink gmail com '),
(1, 'slug', 0, 'en_us', ''),
(2, 'field', 1, 'en_us', ' welcome to toph dev '),
(2, 'field', 2, 'en_us', ' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon toph dev will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
(2, 'slug', 0, 'en_us', ' homepage '),
(2, 'title', 0, 'en_us', ' homepage '),
(3, 'field', 2, 'en_us', ' craft is the cms that s powering toph dev it s beautiful powerful flexible and easy to use and it s made by pixel tonic we can t wait to dive in and see what it s capable of this is even more captivating content which you couldn t see on the news index page because it was entered after a page break and the news index template only likes to show the content on the first page craft a nice alternative to word if you re making a website '),
(3, 'field', 3, 'en_us', ''),
(3, 'slug', 0, 'en_us', ' we just installed craft '),
(3, 'title', 0, 'en_us', ' we just installed craft '),
(4, 'field', 4, 'en_us', ' heading left crucifix drinking vinegar pinterest blog pbr b shoreditch viral you probably haven t heard of them occupy authentic aesthetic skateboard pbr pickled vhs mustache cliche godard cornhole four loko wolf pour over odd future biodiesel art party skateboard freegan authentic brunch raw denim typewriter swag aesthetic gentrify scenester salvia dreamcatcher from a bold new font to a brand new name hear how cooper hewitt is reimagining itself for the 21st century and how the museum s new identity was conceived and designed right left from a bold new font to a brand new name hear how cooper hewitt is reimagining itself for the 21st century and how the museum s new identity was conceived and designed eddie opara pentagram and chester jenkins village talk with caroline baumann cooper hewitt s director in a 90 minute talk recorded 10 september 2014 right '),
(4, 'field', 10, 'en_us', ''),
(4, 'slug', 0, 'en_us', ' whats up thailand '),
(4, 'title', 0, 'en_us', ' what s up thailand '),
(5, 'field', 5, 'en_us', ' crucifix drinking vinegar pinterest blog pbr b shoreditch viral you probably haven t heard of them occupy authentic aesthetic skateboard pbr pickled vhs mustache cliche godard cornhole four loko wolf pour over odd future biodiesel art party skateboard freegan authentic brunch raw denim typewriter swag aesthetic gentrify scenester salvia dreamcatcher '),
(5, 'slug', 0, 'en_us', ''),
(6, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(6, 'extension', 0, 'en_us', ' jpeg '),
(6, 'kind', 0, 'en_us', ' image '),
(6, 'slug', 0, 'en_us', ' 1500x1250 sports 01 '),
(6, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(7, 'filename', 0, 'en_us', ' 1500x1250 sports 01_1 jpeg '),
(7, 'extension', 0, 'en_us', ' jpeg '),
(7, 'kind', 0, 'en_us', ' image '),
(7, 'slug', 0, 'en_us', ''),
(7, 'title', 0, 'en_us', ' 1500x1250 sports 01 1 '),
(4, 'field', 11, 'en_us', ' from a bold new font to a brand new name hear how cooper hewitt is reimagining itself for the 21st century and how the museum s new identity was conceived and designed eddie opara pentagram and chester jenkins village talk with caroline baumann cooper hewitt s director in a 90 minute talk recorded 10 september 2014 '),
(4, 'field', 3, 'en_us', ''),
(8, 'field', 12, 'en_us', ' from a bold new font to a brand new name hear how cooper hewitt is reimagining itself for the 21st century and how the museum s new identity was conceived and designed eddie opara pentagram and chester jenkins village talk with caroline baumann cooper hewitt s director in a 90 minute talk recorded 10 september 2014 '),
(8, 'field', 13, 'en_us', ''),
(8, 'slug', 0, 'en_us', ''),
(9, 'field', 6, 'en_us', ''),
(9, 'field', 7, 'en_us', ' from a bold new font to a brand new name hear how cooper hewitt is reimagining itself for the 21st century and how the museum s new identity was conceived and designed '),
(9, 'field', 8, 'en_us', ' right '),
(9, 'slug', 0, 'en_us', ''),
(10, 'field', 15, 'en_us', ' 1500x1250 sports 02 '),
(10, 'slug', 0, 'en_us', ''),
(14, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(11, 'filename', 0, 'en_us', ' 1500x1250 sports 01_1 jpeg '),
(11, 'extension', 0, 'en_us', ' jpeg '),
(11, 'kind', 0, 'en_us', ' image '),
(11, 'slug', 0, 'en_us', ''),
(11, 'title', 0, 'en_us', ' 1500x1250 sports 01 1 '),
(12, 'filename', 0, 'en_us', ' 1500x1250 nightlife 01 jpeg '),
(12, 'extension', 0, 'en_us', ' jpeg '),
(12, 'kind', 0, 'en_us', ' image '),
(12, 'slug', 0, 'en_us', ' 1500x1250 nightlife 01 '),
(12, 'title', 0, 'en_us', ' 1500x1250 nightlife 01 '),
(13, 'filename', 0, 'en_us', ' 1500x1250 sports 02 jpeg '),
(13, 'extension', 0, 'en_us', ' jpeg '),
(13, 'kind', 0, 'en_us', ' image '),
(13, 'slug', 0, 'en_us', ' 1500x1250 sports 02 '),
(13, 'title', 0, 'en_us', ' 1500x1250 sports 02 '),
(14, 'extension', 0, 'en_us', ' jpeg '),
(14, 'kind', 0, 'en_us', ' image '),
(14, 'slug', 0, 'en_us', ' 1500x1250 sports 01 '),
(14, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(5, 'field', 16, 'en_us', ' left '),
(15, 'field', 9, 'en_us', ' heading '),
(15, 'slug', 0, 'en_us', ''),
(16, 'filename', 0, 'en_us', ' 1500x1250 nature 01 jpeg '),
(16, 'extension', 0, 'en_us', ' jpeg '),
(16, 'kind', 0, 'en_us', ' image '),
(16, 'slug', 0, 'en_us', ' 1500x1250 nature 01 '),
(16, 'title', 0, 'en_us', ' 1500x1250 nature 01 '),
(17, 'filename', 0, 'en_us', ' 1500x1250 sports 01_1 jpeg '),
(17, 'extension', 0, 'en_us', ' jpeg '),
(17, 'kind', 0, 'en_us', ' image '),
(17, 'slug', 0, 'en_us', ''),
(17, 'title', 0, 'en_us', ' 1500x1250 sports 01 1 '),
(18, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(18, 'extension', 0, 'en_us', ' jpeg '),
(18, 'kind', 0, 'en_us', ' image '),
(18, 'slug', 0, 'en_us', ' 1500x1250 sports 01 '),
(18, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(19, 'filename', 0, 'en_us', ' 1500x1250 nature 01 jpeg '),
(19, 'extension', 0, 'en_us', ' jpeg '),
(19, 'kind', 0, 'en_us', ' image '),
(19, 'slug', 0, 'en_us', ' 1500x1250 nature 01 '),
(19, 'title', 0, 'en_us', ' 1500x1250 nature 01 '),
(20, 'filename', 0, 'en_us', ' 1500x1250 sports 02 jpeg '),
(20, 'extension', 0, 'en_us', ' jpeg '),
(20, 'kind', 0, 'en_us', ' image '),
(20, 'slug', 0, 'en_us', ' 1500x1250 sports 02 '),
(20, 'title', 0, 'en_us', ' 1500x1250 sports 02 '),
(21, 'filename', 0, 'en_us', ' 1500x1250 sports 03 jpeg '),
(21, 'extension', 0, 'en_us', ' jpeg '),
(21, 'kind', 0, 'en_us', ' image '),
(21, 'slug', 0, 'en_us', ' 1500x1250 sports 03 '),
(21, 'title', 0, 'en_us', ' 1500x1250 sports 03 '),
(22, 'field', 15, 'en_us', ' 1500x1250 nightlife 01 '),
(22, 'slug', 0, 'en_us', ''),
(23, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(23, 'extension', 0, 'en_us', ' jpeg '),
(23, 'kind', 0, 'en_us', ' image '),
(23, 'slug', 0, 'en_us', ' 1500x1250 sports 01 '),
(23, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(24, 'filename', 0, 'en_us', ' 1500x1250 nightlife 02 jpeg '),
(24, 'extension', 0, 'en_us', ' jpeg '),
(24, 'kind', 0, 'en_us', ' image '),
(24, 'slug', 0, 'en_us', ' 1500x1250 nightlife 02 '),
(24, 'title', 0, 'en_us', ' 1500x1250 nightlife 02 '),
(25, 'field', 5, 'en_us', ' from a bold new font to a brand new name hear how cooper hewitt is reimagining itself for the 21st century and how the museum s new identity was conceived and designed eddie opara pentagram and chester jenkins village talk with caroline baumann cooper hewitt s director in a 90 minute talk recorded 10 september 2014 '),
(25, 'field', 16, 'en_us', ' left '),
(25, 'slug', 0, 'en_us', ''),
(26, 'field', 6, 'en_us', ' 1500x1250 sports 03 '),
(26, 'field', 7, 'en_us', ''),
(26, 'field', 8, 'en_us', ' right '),
(26, 'slug', 0, 'en_us', ''),
(27, 'filename', 0, 'en_us', ' 1500x1250 nature 01 jpeg '),
(27, 'extension', 0, 'en_us', ' jpeg '),
(27, 'kind', 0, 'en_us', ' image '),
(27, 'slug', 0, 'en_us', ' 1500x1250 nature 01 '),
(27, 'title', 0, 'en_us', ' 1500x1250 nature 01 '),
(28, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(28, 'extension', 0, 'en_us', ' jpeg '),
(28, 'kind', 0, 'en_us', ' image '),
(28, 'slug', 0, 'en_us', ' 1500x1250 sports 01 '),
(28, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(29, 'filename', 0, 'en_us', ' 1500x1250 sports 03 jpeg '),
(29, 'extension', 0, 'en_us', ' jpeg '),
(29, 'kind', 0, 'en_us', ' image '),
(29, 'slug', 0, 'en_us', ' 1500x1250 sports 03 '),
(29, 'title', 0, 'en_us', ' 1500x1250 sports 03 '),
(30, 'filename', 0, 'en_us', ' 1500x1250 nightlife 02 jpeg '),
(30, 'extension', 0, 'en_us', ' jpeg '),
(30, 'kind', 0, 'en_us', ' image '),
(30, 'slug', 0, 'en_us', ' 1500x1250 nightlife 02 '),
(30, 'title', 0, 'en_us', ' 1500x1250 nightlife 02 '),
(58, 'field', 5, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
(31, 'filename', 0, 'en_us', ' 1500x1250 sports 02 jpeg '),
(31, 'extension', 0, 'en_us', ' jpeg '),
(31, 'kind', 0, 'en_us', ' image '),
(31, 'slug', 0, 'en_us', ' 1500x1250 sports 02 '),
(31, 'title', 0, 'en_us', ' 1500x1250 sports 02 '),
(32, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(32, 'extension', 0, 'en_us', ' jpeg '),
(32, 'kind', 0, 'en_us', ' image '),
(32, 'slug', 0, 'en_us', ' 1500x1250 sports 01 '),
(32, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(33, 'filename', 0, 'en_us', ' 1500x1250 nightlife 01 jpeg '),
(33, 'extension', 0, 'en_us', ' jpeg '),
(33, 'kind', 0, 'en_us', ' image '),
(33, 'slug', 0, 'en_us', ' 1500x1250 nightlife 01 '),
(33, 'title', 0, 'en_us', ' 1500x1250 nightlife 01 '),
(34, 'filename', 0, 'en_us', ' 1500x1250 nature 01_1 jpeg '),
(34, 'extension', 0, 'en_us', ' jpeg '),
(34, 'kind', 0, 'en_us', ' image '),
(34, 'slug', 0, 'en_us', ''),
(34, 'title', 0, 'en_us', ' 1500x1250 nature 01 1 '),
(35, 'filename', 0, 'en_us', ' 1500x1250 nightlife 01_1 jpeg '),
(35, 'extension', 0, 'en_us', ' jpeg '),
(35, 'kind', 0, 'en_us', ' image '),
(35, 'slug', 0, 'en_us', ''),
(35, 'title', 0, 'en_us', ' 1500x1250 nightlife 01 1 '),
(36, 'filename', 0, 'en_us', ' 1500x1250 nightlife 02_1 jpeg '),
(36, 'extension', 0, 'en_us', ' jpeg '),
(36, 'kind', 0, 'en_us', ' image '),
(36, 'slug', 0, 'en_us', ''),
(36, 'title', 0, 'en_us', ' 1500x1250 nightlife 02 1 '),
(37, 'filename', 0, 'en_us', ' 1500x1250 sports 01_1 jpeg '),
(37, 'extension', 0, 'en_us', ' jpeg '),
(37, 'kind', 0, 'en_us', ' image '),
(37, 'slug', 0, 'en_us', ''),
(37, 'title', 0, 'en_us', ' 1500x1250 sports 01 1 '),
(38, 'filename', 0, 'en_us', ' 1500x1250 sports 02_1 jpeg '),
(38, 'extension', 0, 'en_us', ' jpeg '),
(38, 'kind', 0, 'en_us', ' image '),
(38, 'slug', 0, 'en_us', ''),
(38, 'title', 0, 'en_us', ' 1500x1250 sports 02 1 '),
(39, 'filename', 0, 'en_us', ' 1500x1250 sports 03_1 jpeg '),
(39, 'extension', 0, 'en_us', ' jpeg '),
(39, 'kind', 0, 'en_us', ' image '),
(39, 'slug', 0, 'en_us', ''),
(39, 'title', 0, 'en_us', ' 1500x1250 sports 03 1 '),
(40, 'field', 11, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum 1500x1250 sports 01 '),
(40, 'field', 4, 'en_us', ' preparation left lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum 1500x1250 sports 03 right left lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum 1500x1250 nightlife 01 right here we go 1500x1250 nightlife 01 1500x1250 sports 01 1500x1250 sports 03 full lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum list item	item two full lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum poop '),
(40, 'field', 10, 'en_us', ''),
(40, 'field', 3, 'en_us', ''),
(40, 'slug', 0, 'en_us', ' new entry '),
(40, 'title', 0, 'en_us', ' new entry '),
(41, 'field', 12, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
(41, 'field', 13, 'en_us', ''),
(41, 'slug', 0, 'en_us', ''),
(42, 'field', 5, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
(42, 'field', 16, 'en_us', ' left '),
(42, 'slug', 0, 'en_us', ''),
(43, 'field', 6, 'en_us', ' 1500x1250 sports 03 '),
(43, 'field', 7, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
(43, 'field', 8, 'en_us', ' right '),
(43, 'slug', 0, 'en_us', ''),
(44, 'filename', 0, 'en_us', ' 1500x1250 sports 01 jpeg '),
(44, 'extension', 0, 'en_us', ' jpeg '),
(44, 'kind', 0, 'en_us', ' image '),
(44, 'slug', 0, 'en_us', ''),
(44, 'title', 0, 'en_us', ' 1500x1250 sports 01 '),
(45, 'filename', 0, 'en_us', ' 1500x1250 sports 03 jpeg '),
(45, 'extension', 0, 'en_us', ' jpeg '),
(45, 'kind', 0, 'en_us', ' image '),
(45, 'slug', 0, 'en_us', ''),
(45, 'title', 0, 'en_us', ' 1500x1250 sports 03 '),
(47, 'field', 17, 'en_us', ' 1500x1250 sports 01 '),
(46, 'field', 15, 'en_us', ' 1500x1250 sports 01 '),
(46, 'slug', 0, 'en_us', ''),
(47, 'slug', 0, 'en_us', ''),
(48, 'filename', 0, 'en_us', ' 1500x1250 nightlife 01 jpeg '),
(48, 'extension', 0, 'en_us', ' jpeg '),
(48, 'kind', 0, 'en_us', ' image '),
(48, 'slug', 0, 'en_us', ''),
(48, 'title', 0, 'en_us', ' 1500x1250 nightlife 01 '),
(49, 'field', 5, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
(49, 'field', 16, 'en_us', ' left '),
(49, 'slug', 0, 'en_us', ''),
(50, 'field', 6, 'en_us', ' 1500x1250 nightlife 01 '),
(50, 'field', 7, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),
(50, 'field', 8, 'en_us', ' right '),
(50, 'slug', 0, 'en_us', ''),
(51, 'field', 5, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum list itemanother itemitem threelast item '),
(51, 'field', 16, 'en_us', ' full '),
(51, 'slug', 0, 'en_us', ''),
(52, 'field', 18, 'en_us', ' 1500x1250 nightlife 01 1500x1250 sports 01 1500x1250 sports 03 '),
(52, 'slug', 0, 'en_us', ''),
(53, 'filename', 0, 'en_us', ' 1500x1250 sports 03_1 jpeg '),
(53, 'extension', 0, 'en_us', ' jpeg '),
(53, 'kind', 0, 'en_us', ' image '),
(53, 'slug', 0, 'en_us', ''),
(53, 'title', 0, 'en_us', ' 1500x1250 sports 03 1 '),
(54, 'filename', 0, 'en_us', ' 1500x1250 nature 01 jpeg '),
(54, 'extension', 0, 'en_us', ' jpeg '),
(54, 'kind', 0, 'en_us', ' image '),
(54, 'slug', 0, 'en_us', ''),
(54, 'title', 0, 'en_us', ' 1500x1250 nature 01 '),
(55, 'field', 9, 'en_us', ' preparation '),
(55, 'slug', 0, 'en_us', ''),
(56, 'field', 9, 'en_us', ' here we go '),
(56, 'slug', 0, 'en_us', ''),
(57, 'field', 5, 'en_us', ' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum list item item two '),
(57, 'field', 16, 'en_us', ' full '),
(57, 'slug', 0, 'en_us', ''),
(58, 'field', 16, 'en_us', ' full '),
(58, 'slug', 0, 'en_us', ''),
(59, 'field', 9, 'en_us', ' poop '),
(59, 'slug', 0, 'en_us', ''),
(60, 'field', 11, 'en_us', ' so only a month and a half left before i leave for one of the most beautiful places on earth thailand that said the butterflies in my belly are in full effect this article will outline the process of making this trip a reality and outline some of the things i d like to do places i d like to go '),
(60, 'field', 4, 'en_us', ' the plan full when winter destroyed everyones lives last winter i made a promise to myself get the fuck out of michigan before it s too late at the same time i was tortured by facebook photos of friends in bikinis basking in the sun next to crystal clear blue waters chilling with monkeys hiking the jungles etc i was all like where the frig are these girls i wanna go thailand was seemingly the place to be   so needless to say i set a goal to save up and get out to thailand by the time winter was in full effect after about 7 months i grew a pair and bought a plane ticket thailand full full the hardest part of the trip is putting together some sort of plan for what happens when i get there my idea of planning for this trip is to have an idea of where i d like to go loosely plan around those places and let everything else just happen this makes me a little bit anxious but i can t see the point in making a day to day itinerary with all that there is to do and see in a place like thailand the only thing i really want to do is take an open water dive course in order to scuba dive whenever wherever i want below is a list of helpful resources regarding my trip nomadic matt thailand travel tips awesome tips resources regarding money things to do food etc nomadic matt thailand travel tips awesome tips resources regarding money things to do food etc '),
(60, 'field', 10, 'en_us', ''),
(60, 'field', 3, 'en_us', ''),
(60, 'slug', 0, 'en_us', ' t minus 45 days '),
(60, 'title', 0, 'en_us', ' t minus 45 days '),
(61, 'field', 12, 'en_us', ' so only a month and a half left before i leave for one of the most beautiful places on earth thailand that said the butterflies in my belly are in full effect this article will outline the process of making this trip a reality and outline some of the things i d like to do places i d like to go '),
(61, 'field', 13, 'en_us', ''),
(61, 'slug', 0, 'en_us', ''),
(62, 'field', 5, 'en_us', ' when winter destroyed everyones lives last winter i made a promise to myself get the fuck out of michigan before it s too late at the same time i was tortured by facebook photos of friends in bikinis basking in the sun next to crystal clear blue waters chilling with monkeys hiking the jungles etc i was all like where the frig are these girls i wanna go thailand was seemingly the place to be   so needless to say i set a goal to save up and get out to thailand by the time winter was in full effect after about 7 months i grew a pair and bought a plane ticket '),
(62, 'field', 16, 'en_us', ' full '),
(62, 'slug', 0, 'en_us', ''),
(63, 'filename', 0, 'en_us', ' thailand png '),
(63, 'extension', 0, 'en_us', ' png '),
(63, 'kind', 0, 'en_us', ' image '),
(63, 'slug', 0, 'en_us', ''),
(63, 'title', 0, 'en_us', ' thailand '),
(64, 'field', 6, 'en_us', ' thailand '),
(64, 'field', 7, 'en_us', ''),
(64, 'field', 8, 'en_us', ' full '),
(64, 'slug', 0, 'en_us', ''),
(65, 'field', 5, 'en_us', ' the hardest part of the trip is putting together some sort of plan for what happens when i get there my idea of planning for this trip is to have an idea of where i d like to go loosely plan around those places and let everything else just happen this makes me a little bit anxious but i can t see the point in making a day to day itinerary with all that there is to do and see in a place like thailand the only thing i really want to do is take an open water dive course in order to scuba dive whenever wherever i want below is a list of helpful resources regarding my trip nomadic matt thailand travel tips awesome tips resources regarding money things to do food etc nomadic matt thailand travel tips awesome tips resources regarding money things to do food etc '),
(65, 'field', 16, 'en_us', ' full '),
(65, 'slug', 0, 'en_us', ''),
(66, 'field', 9, 'en_us', ' the plan '),
(66, 'slug', 0, 'en_us', '');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 'index', 1, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '196a576f-bf0c-4312-9190-faf373cda29c'),
(2, NULL, 'Blog', 'blog', 'channel', 1, 'blog/_entry', 1, '2014-09-10 22:56:04', '2014-10-14 18:02:09', 'ceabcebf-40a4-4571-abfe-d9cb071fbc60');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_i18n`
--

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `craft_sections_i18n`
--

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', 1, '__home__', NULL, '2014-09-10 22:56:04', '2014-09-10 22:56:04', '90976c3b-8dc7-4cc2-b981-dc60dc704e71'),
(2, 2, 'en_us', 0, 'blog/{postDate.year}/{slug}', NULL, '2014-09-10 22:56:04', '2014-10-14 18:02:09', 'ee307e78-41c3-429f-a814-93e0142dc87d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 1, '9a826ad157298d27d6ce709377bb604790b59863czozNjoiOWUyNjMzZjctMTM0Ny00ZjU4LTgzZWItOWY1YWM1ZmJkMWZhIjs=', '2014-11-29 18:45:41', '2014-11-29 18:45:41', '5ee10295-581d-4859-9580-2c47fabcb485');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `movePermission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{"protocol":"php","emailAddress":"christophergroenink@gmail.com","senderName":"Toph.er"}', '2014-09-10 22:56:03', '2014-09-10 22:56:03', '1f7c7938-fc21-4f07-9522-184138d71a51');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `craft_taggroups`
--

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', 'default', 1, '2014-09-10 22:56:03', '2014-09-10 22:56:03', '19e2e7ef-0c27-45ec-b3c3-681a2c77853d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tags_name_groupId_unq_idx` (`name`,`groupId`),
  KEY `craft_tags_groupId_fk` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tasks`
--

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachecriteria`
--

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` enum('active','locked','suspended','pending','archived') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `admin`, `client`, `status`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'christophergroenink@gmail.com', '$2a$13$zU.0e13lFcB4T819XhbguuXjdMoNq6v3n4aiGMxpwTLMYEOMdExkK', NULL, 1, 0, 'active', '2014-11-29 18:45:41', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-09-10 22:56:00', '2014-09-10 22:56:00', '2014-11-29 18:45:41', 'bb4b7ab8-1551-4689-aa83-1692e47554c3');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'QuickPost', 1, '{"section":"2"}', 1, '2014-10-14 16:28:11', '2014-10-14 16:28:11', 'b6ed1ef1-de6c-4763-9704-d5b0545ef5dc'),
(2, 1, 'RecentEntries', 2, NULL, 1, '2014-10-14 16:28:11', '2014-10-14 16:28:11', '1738d9cd-fe57-455a-a5b7-8a3a6a12dfeb'),
(3, 1, 'GetHelp', 3, NULL, 1, '2014-10-14 16:28:11', '2014-10-14 16:28:11', '31598341-7f87-42f6-b0e2-506e973223fd'),
(4, 1, 'Updates', 4, NULL, 1, '2014-10-14 16:28:11', '2014-10-14 16:28:11', '72f7bdfb-5ee9-4455-9f44-d75ebeb508d0'),
(5, 1, 'Feed', 5, '{"url":"http:\\/\\/feeds.feedburner.com\\/blogandtonic","title":"Blog & Tonic"}', 1, '2014-10-14 16:28:11', '2014-10-14 16:28:11', 'd9c08e1d-ecc6-4534-bc0f-067b75913910');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixcontent_article`
--
ALTER TABLE `craft_matrixcontent_article`
  ADD CONSTRAINT `craft_matrixcontent_article_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_article_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_intro`
--
ALTER TABLE `craft_matrixcontent_intro`
  ADD CONSTRAINT `craft_matrixcontent_intro_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_intro_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
