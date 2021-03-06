-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2017 at 04:00 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 5.6.30-10+deb.sury.org~xenial+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `econtent`
--

-- --------------------------------------------------------

--
-- Table structure for table `blob_file`
--

CREATE TABLE `blob_file` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `file_sha256` char(64) NOT NULL,
  `context_id` int(10) UNSIGNED DEFAULT NULL,
  `file_name` varchar(2048) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `contenttype` varchar(256) DEFAULT NULL,
  `path` varchar(2048) DEFAULT NULL,
  `content` longblob,
  `json` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accessed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `featured_image` longtext COLLATE utf8mb4_unicode_ci,
  `tags` longtext COLLATE utf8mb4_unicode_ci,
  `xml_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `featured_image`, `tags`, `xml_file`, `creator_id`, `created_at`, `updated_at`) VALUES
(14, 'FBN1502 Business Numerical Skills B', 'FBN1502 Business Numerical Skills B', NULL, '', NULL, 1, '2017-04-18 13:00:55', '2017-04-18 13:00:55'),
(16, 'FBN1501 - Business Numerical Skills A', 'FBN1501 - Business Numerical Skills A', NULL, '', NULL, 1, '2017-04-19 11:59:07', '2017-04-19 11:59:07'),
(25, 'Demo', 'Demo of the e-content functionality', NULL, '', NULL, 1, '2017-05-12 07:28:58', '2017-05-12 07:28:58'),
(26, 'CS101', 'CS101', NULL, '', NULL, 1, '2017-07-05 11:59:16', '2017-07-05 11:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `course_users`
--

CREATE TABLE `course_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '27000000',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opted_out` tinyint(4) NOT NULL DEFAULT '0',
  `opted_out_date` blob,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_users`
--

INSERT INTO `course_users` (`id`, `course_id`, `user_id`, `email`, `opted_out`, `opted_out_date`, `created_at`, `updated_at`) VALUES
(1, 14, 1, 'inst@ischool.edu', 0, NULL, '2017-03-22 06:02:10', '2017-03-22 06:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin Groups', 'admin-groups', '2017-04-08 18:10:58', '2017-04-08 18:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `available_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(256, '', '{"displayName":"App\\\\Jobs\\\\SendCourseNotificationEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"App\\\\Jobs\\\\SendCourseNotificationEmail","command":"O:36:\\"App\\\\Jobs\\\\SendCourseNotificationEmail\\":6:{s:9:\\"\\u0000*\\u0000course\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:17:\\"App\\\\Models\\\\Course\\";s:2:\\"id\\";i:4;}s:8:\\"\\u0000*\\u0000email\\";s:16:\\"josh1@live.co.za\\";s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;}"}}', 255, '2017-03-13 11:29:25', '2017-03-23 11:29:25', '2017-03-13 11:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `key_request`
--

CREATE TABLE `key_request` (
  `request_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(512) NOT NULL,
  `notes` text,
  `admin` text,
  `state` smallint(6) DEFAULT NULL,
  `lti` tinyint(4) DEFAULT NULL,
  `json` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lms_plugins`
--

CREATE TABLE `lms_plugins` (
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `plugin_path` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `title` varchar(2048) DEFAULT NULL,
  `json` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lms_plugins`
--

INSERT INTO `lms_plugins` (`plugin_id`, `plugin_path`, `version`, `title`, `json`, `created_at`, `updated_at`) VALUES
(1, 'admin/lti/database.php', 201701121623, NULL, NULL, '2017-01-19 09:16:12', '2017-01-19 09:16:12'),
(11, 'admin/key/database.php', 201701121623, NULL, NULL, '2017-01-19 09:16:12', '2017-01-19 09:16:12'),
(12, 'admin/blob/database.php', 201701121623, NULL, NULL, '2017-01-19 09:16:12', '2017-01-19 09:16:12'),
(13, 'admin/mail/database.php', 201701121623, NULL, NULL, '2017-01-19 09:16:12', '2017-01-19 09:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `lti_ck_domains`
--

CREATE TABLE `lti_ck_domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `launch_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lti_ck_domains`
--

INSERT INTO `lti_ck_domains` (`id`, `launch_url`, `key`, `secret`, `created_at`, `updated_at`) VALUES
(1, 'https://bltools.creighton.edu/lti/ltimaps/ltimaps/map.php ', '12345', 'secret', '2017-03-14 00:31:00', '2017-03-14 00:31:00'),
(2, 'https://mirror.unisaonline.net/tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2NDYwODEyMjQzNzI4NjczIn0=', 'unisa', '12345', '2017-03-14 01:13:51', '2017-03-14 01:13:51'),
(3, 'https://www.edu-apps.org/titanpad', '', '', '2017-03-14 04:22:30', '2017-03-14 04:22:30'),
(4, 'https://steamboat.youseeu.com/lti/955rf3/lti_connect.php', '', '', '2017-03-14 04:52:38', '2017-03-14 04:52:38'),
(5, 'https://unisaonline.net/cw-econ/components/lti/lms.php?delivery_url=tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2NDYwODEyMjQzNzI4NjczIn0=', 'unisa', '12345', '2017-07-05 21:39:42', '2017-07-05 21:39:42'),
(6, 'https://dev.unisaonline.net/cw-econ/components/lti/lms.php?delivery_url=tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2NDYwODEyMjQzNzI4NjczIn0=', 'unisa', '12345', '2017-07-05 21:55:45', '2017-07-05 21:55:45'),
(7, 'https://dev.unisaonline.net/tao/ltiDeliveryProvider/DeliveryTool/launch?eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ1OTIzNjc0OTc4MjcyNzk0In0=', 'unisa', '12345', '2017-07-20 22:56:05', '2017-07-20 22:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `lti_context`
--

CREATE TABLE `lti_context` (
  `context_id` int(10) UNSIGNED NOT NULL,
  `context_sha256` char(64) NOT NULL,
  `context_key` varchar(255) NOT NULL,
  `key_id` int(10) UNSIGNED NOT NULL,
  `title` text,
  `json` text,
  `settings` text,
  `settings_url` text,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_context`
--

INSERT INTO `lti_context` (`context_id`, `context_sha256`, `context_key`, `key_id`, `title`, `json`, `settings`, `settings_url`, `entity_version`, `created_at`, `updated_at`) VALUES
(1, '48e34f46273af9216b28aa476263b28814de979e10d173c2873a7d655e980835', '456434513', 1, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-01-20 09:39:51', '2017-01-20 09:39:51'),
(3, '5f082ff8351e08d254cbbebf7927f37adffeee6681ecb3910b811c16129d90cc', 'bltiextensions', 1, 'TEDEd', '{"bltititle":"TEDEd","bltidescription":"Search YouTube videos in the TEDEd Channel. A new icon will show up in your course rich editor letting you search the TEDEd channel and click to embed videos in your course material.","bltilaunch_url":"https:\\/\\/www.edu-apps.org\\/lti_public_resources\\/?tool_id=youtube_ted_ed","bltiextensions":{"@attributes":{"platform":"canvas.instructure.com"},"lticmproperty":["www.edu-apps.org","https:\\/\\/www.edu-apps.org\\/assets\\/lti_public_resources\\/ted_ed_icon.png","anonymous","600","560","TEDEd","youtube_ted_ed"],"lticmoptions":[{"@attributes":{"name":"editor_button"},"lticmproperty":"true"},{"@attributes":{"name":"resource_selection"},"lticmproperty":"true"}]}}', '', '', 1, '2017-03-06 20:56:44', '2017-03-06 20:56:44'),
(8, 'c702e001f8c0abede71e68fcb244bcb399b40acc0b90ab4f95bb850d9169716d', 'cartridge_icon', 1, 'College Board', '{"bltititle":"College Board","bltidescription":"Links to SAT and AP practice tests","bltiicon":"https:\\/\\/www.edu-apps.org\\/tools\\/college_board\\/icon.png","bltilaunch_url":"https:\\/\\/www.edu-apps.org\\/tool_redirect?id=college_board","bltiextensions":{"@attributes":{"platform":"canvas.instructure.com"},"lticmproperty":["college_board","anonymous"],"lticmoptions":[{"@attributes":{"name":"editor_button"},"lticmproperty":["https:\\/\\/www.edu-apps.org\\/tool_redirect?id=college_board","https:\\/\\/www.edu-apps.org\\/tools\\/college_board\\/icon.png","College Board","690","530","true"]},{"@attributes":{"name":"resource_selection"},"lticmproperty":["https:\\/\\/www.edu-apps.org\\/tool_redirect?id=college_board","https:\\/\\/www.edu-apps.org\\/tools\\/college_board\\/icon.png","College Board","690","530","true"]}]},"cartridge_bundle":{"@attributes":{"identifierref":"BLTI001_Bundle"}},"cartridge_icon":{"@attributes":{"identifierref":"BLTI001_Icon"}}}', '', '', 1, '2017-03-21 21:11:10', '2017-03-21 21:11:10'),
(9, '5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', '0', 1, 'College Board', 'false', '', '', 1, '2017-03-21 21:11:48', '2017-03-21 21:11:48'),
(35, '166e5fb037f51db16329991a90a51c2a66b1709319ff1be013f7d2375a5bdf88', '@attributes', 1, 'educreations', '{"cartridge_basiclti_link":{"bltititle":"educreations","bltidescription":"Teacher-recorded whiteboard sessions","bltiicon":"https:\\/\\/www.edu-apps.org\\/tools\\/educreations\\/icon.png","bltilaunch_url":"https:\\/\\/www.edu-apps.org\\/tool_redirect?id=educreations","bltiextensions":{"lticmproperty":[{"@value":"educreations","@attributes":{"name":"tool_id"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}}],"lticmoptions":[{"lticmproperty":[{"@value":"https:\\/\\/www.edu-apps.org\\/tool_redirect?id=educreations","@attributes":{"name":"url"}},{"@value":"https:\\/\\/www.edu-apps.org\\/tools\\/educreations\\/icon.png","@attributes":{"name":"icon_url"}},{"@value":"educreations","@attributes":{"name":"text"}},{"@value":"690","@attributes":{"name":"selection_width"}},{"@value":"530","@attributes":{"name":"selection_height"}},{"@value":"true","@attributes":{"name":"enabled"}}],"@attributes":{"name":"editor_button"}},{"lticmproperty":[{"@value":"https:\\/\\/www.edu-apps.org\\/tool_redirect?id=educreations","@attributes":{"name":"url"}},{"@value":"https:\\/\\/www.edu-apps.org\\/tools\\/educreations\\/icon.png","@attributes":{"name":"icon_url"}},{"@value":"educreations","@attributes":{"name":"text"}},{"@value":"690","@attributes":{"name":"selection_width"}},{"@value":"530","@attributes":{"name":"selection_height"}},{"@value":"true","@attributes":{"name":"enabled"}}],"@attributes":{"name":"resource_selection"}}],"@attributes":{"platform":"canvas.instructure.com"}},"cartridge_bundle":{"@value":"","@attributes":{"identifierref":"BLTI001_Bundle"}},"cartridge_icon":{"@value":"","@attributes":{"identifierref":"BLTI001_Icon"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd       http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd       http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd       http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 20:51:26', '2017-04-03 20:51:26'),
(38, '98483c6eb40b6c31a448c22a66ded3b5e5e8d5119cac8327b655c8b5c4836489', 'testkey', 34, 'XanEdu', '{"cartridge_basiclti_link":{"bltititle":"XanEdu","bltidescription":"XanEdu LTI App","bltilaunch_url":"","bltiextensions":{"lticmproperty":[{"@value":"xanedu.com","@attributes":{"name":"domain"}},{"@value":"http:\\/\\/coursepacks.xanedu.com\\/images\\/cpcc_xanedu.gif","@attributes":{"name":"icon_url"}},{"@value":"name_only","@attributes":{"name":"privacy_level"}},{"@value":"xanedu","@attributes":{"name":"tool_id"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 21:12:58', '2017-04-03 21:12:58'),
(40, '3a86e4c51bcc8d434e8e28a81b71a5af4f5d2525f4874a38f3644fb6291b3406', 'nokey', 36, 'Quizlet', '{"cartridge_basiclti_link":{"bltititle":"Quizlet","bltidescription":"Search for and embed publicly available flashcards and question sets from Quizlet. Questions can be embedded directly into content as flash cards, review, or as a study game.","bltilaunch_url":"https:\\/\\/www.edu-apps.org\\/lti_public_resources\\/?tool_id=quizlet","bltiextensions":{"lticmproperty":[{"@value":"edu-apps.org","@attributes":{"name":"domain"}},{"@value":"https:\\/\\/www.edu-apps.org\\/assets\\/lti_public_resources\\/quizlet_icon.png","@attributes":{"name":"icon_url"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}},{"@value":"600","@attributes":{"name":"selection_height"}},{"@value":"560","@attributes":{"name":"selection_width"}},{"@value":"quizlet","@attributes":{"name":"tool_id"}}],"lticmoptions":[{"lticmproperty":{"@value":"true","@attributes":{"name":"enabled"}},"@attributes":{"name":"editor_button"}},{"lticmproperty":{"@value":"true","@attributes":{"name":"enabled"}},"@attributes":{"name":"resource_selection"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 21:14:31', '2017-04-03 21:14:31'),
(43, '166253b8f92ae0bc431aa587a64251665513aa31f0304a757f7e3f4d3c559f33', 'mahara', 39, 'Open Educational Search', '{"cartridge_basiclti_link":{"bltititle":"Open Educational Search","bltidescription":"","bltilaunch_url":"https:\\/\\/openedsearch.azurewebsites.net\\/","bltiicon":"https:\\/\\/openedsearch.azurewebsites.net\\/Store\\/StoreIcon16.png","blticustom":"","bltiextensions":{"lticmproperty":[{"@value":"microsoft_opened_search","@attributes":{"name":"tool_id"}},{"@value":"https:\\/\\/openedsearch.azurewebsites.net\\/Store\\/StoreIcon16.png","@attributes":{"name":"icon_url"}},{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"openedsearch.azurewebsites.net","@attributes":{"name":"domain"}},{"@value":"Open Educational Search","@attributes":{"name":"text"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemalocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 21:17:03', '2017-04-03 21:17:03'),
(46, '01ceddcf9a9138a7ac34277fa9340ea7b34b0990a961c4eafde8a08065048095', '4564345135', 1, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-04-10 12:09:46', '2017-04-10 12:09:46'),
(47, '01f956315e03b0513e2d011fda7df9a56aa335f4b6c236627b6d17dc6af141c4', '4564345133', 1, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-04-10 16:03:44', '2017-04-10 16:03:44'),
(48, '25d1b1b8b0df9c415c37c56f8d7fd122a6d7b0fca47f598726b71fe1de95ba46', '45643451355', 1, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-04-10 16:57:38', '2017-04-10 16:57:38'),
(49, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', 42, 'Mahara', 'false', '', '', 1, '2017-04-10 20:50:59', '2017-04-10 20:50:59'),
(50, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', 43, 'Mahara', 'false', '', '', 1, '2017-04-10 20:53:28', '2017-04-10 20:53:28'),
(52, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '12345', 45, 'WhiteBoard', 'false', '', '', 1, '2017-04-10 21:11:23', '2017-04-10 21:11:23'),
(54, '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '1', 1, 'Design of Personal Environments', NULL, NULL, NULL, 0, '2017-04-11 10:22:14', '2017-04-11 10:22:14'),
(55, '6036272f420fcb803d05299ad19dd82cebd716b75e4c967b169a055e011a6b06', 'mangwanani', 47, 'Graphs Tool', 'false', '', '', 1, '2017-04-10 23:03:57', '2017-04-10 23:03:57'),
(56, 'f0bc6d10cee6478ca4f69692bae9de2b10bd2ce9cda3d974251572b62894590e', 'chingwachevana', 48, 'MindMap', 'false', '', '', 1, '2017-04-10 23:09:08', '2017-04-10 23:09:08'),
(58, '25d1b1b8b0df9c415c37c56f8d7fd122a6d7b0fca47f598726b71fe1de95ba46', '45643451355', 42, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-04-11 12:55:28', '2017-04-11 12:55:28'),
(59, '52c16e1feb3f0f46a81e70cea775d0511ee02434097329c9748ac3e3eeb26882', '45643451333', 1, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-04-20 13:50:48', '2017-04-20 13:50:48'),
(60, '680d48ce56d582bee092e23826ca0724dd50d6615ed5f8f8a8feea82372e5ea8', 'X03V2zr6ECRiV0ix', 50, 'Unplag Plagiarism Checker', '{"cartridge_basiclti_link":{"bltititle":"Unplag","bltidescription":"Unplag.com is a similarity checker created to protect content originality, timely spot text duplication","bltiicon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltisecure_icon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltivendor":{"lticpcode":"Unplag.com","lticpname":"Unplag.com","lticpdescription":"Unplag.com is a similarity checker created to protect content originality.","lticpurl":"https:\\/\\/Unplag.com\\/","lticpcontact":{"lticpemail":"support@Unplag.com"}},"bltilaunch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltisecure_launch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltiextensions":{"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"lti.unplag.com","@attributes":{"name":"domain"}}],"lticmoptions":{"lticmproperty":[{"@value":"0","@attributes":{"name":"auto_grade"}},{"@value":"$Canvas.assignment.dueAt.iso8601","@attributes":{"name":"due_date"}}],"@attributes":{"name":"custom_fields"}},"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-20 01:52:44', '2017-04-20 01:52:44'),
(63, '1cc1a8c8fec669478e25a389e57d31decae735594569215ca5e81369e17c139a', 'Ooi4WJNocGqZuZJa', 53, 'Unplag Plagiarism Checker', '{"cartridge_basiclti_link":{"bltititle":"Unplag","bltidescription":"Unplag.com is a similarity checker created to protect content originality, timely spot text duplication","bltiicon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltisecure_icon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltivendor":{"lticpcode":"Unplag.com","lticpname":"Unplag.com","lticpdescription":"Unplag.com is a similarity checker created to protect content originality.","lticpurl":"https:\\/\\/Unplag.com\\/","lticpcontact":{"lticpemail":"support@Unplag.com"}},"bltilaunch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltisecure_launch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltiextensions":{"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"lti.unplag.com","@attributes":{"name":"domain"}}],"lticmoptions":{"lticmproperty":[{"@value":"0","@attributes":{"name":"auto_grade"}},{"@value":"$Canvas.assignment.dueAt.iso8601","@attributes":{"name":"due_date"}}],"@attributes":{"name":"custom_fields"}},"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-22 22:24:49', '2017-04-22 22:24:49'),
(64, '477015de8f713070bc7b7c73aa16359483e0ffa9e1da73d53ebde4083ca6e9d5', 'bmmuffy', 54, 'Learn LTI', '{"cartridge_basiclti_link":{"bltititle":"Learn LTI","bltidescription":"Lessons and tests on building an LTI app","bltiicon":"","bltiextensions":{"lticmproperty":[{"@value":"learn-lti","@attributes":{"name":"tool_id"}},{"@value":"learn-lti.herokuapp.com","@attributes":{"name":"domain"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}}],"lticmoptions":{"lticmproperty":[{"@value":"https:\\/\\/learn-lti.herokuapp.com\\/launch\\/init","@attributes":{"name":"url"}},{"@value":"Learn LTI Lesson","@attributes":{"name":"text"}},{"@value":"450","@attributes":{"name":"selection_width"}},{"@value":"350","@attributes":{"name":"selection_height"}},{"@value":"true","@attributes":{"name":"enabled"}}],"@attributes":{"name":"resource_selection"}},"@attributes":{"platform":"canvas.instructure.com"}},"cartridge_bundle":{"@value":"","@attributes":{"identifierref":"BLTI001_Bundle"}},"cartridge_icon":{"@value":"","@attributes":{"identifierref":"BLTI001_Icon"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-26 01:29:30', '2017-04-26 01:29:30'),
(65, '14116841caa61935e3a39da23cb380d3865328d939be5802e2f905a93238f5f9', 'moodle257-bene-zvako', 55, 'Chem Vantage', 'false', '', '', 1, '2017-04-26 01:50:59', '2017-04-26 01:50:59'),
(67, '9c5e6d70261a7e0b7e70e835aa76598a3bce91e7588ede1153efc4edd3859059', 'piazza.sandbox', 57, 'Piazza', 'false', '', '', 1, '2017-04-26 02:09:59', '2017-04-26 02:09:59'),
(69, '477015de8f713070bc7b7c73aa16359483e0ffa9e1da73d53ebde4083ca6e9d5', 'bmmuffy', 59, 'Feed The Me', 'false', '', '', 1, '2017-04-27 04:55:29', '2017-04-27 04:55:29'),
(72, 'cd1c9b429e7062c5581eaf0d812194a291d5fa2fb54ea14113a43d69ec8774d8', 'dfd01fce46bf2d5835e31e2e3f69a744', 62, 'Badges', 'false', '', '', 1, '2017-04-27 05:08:25', '2017-04-27 05:08:25'),
(73, 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '', 1, 'Edu Creations', 'false', '', '', 1, '2017-04-27 05:16:16', '2017-04-27 05:16:16'),
(74, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', 63, 'Edu Creations', 'false', '', '', 1, '2017-04-27 05:16:42', '2017-04-27 05:16:42'),
(75, '089486ceb053b7244b0c598ec946fbc04b98a504fd7d6bc00ac7197921862abc', '54d430d3dc4d', 64, 'Xorro-Q', 'false', '', '', 1, '2017-04-27 05:24:01', '2017-04-27 05:24:01'),
(82, 'efe79ca59f358f2fd20a4686c639e7f98cef01e9918d8fa27284205f7ec0e6cf', '693c299c5978d4e583fe8053630aded3', 71, 'Edueto', '{"cartridge_basiclti_link":{"bltititle":"Edueto","bltidescription":"Create original online exercises, tests and homework.","bltilaunch_url":"https:\\/\\/www.edueto.com\\/lti","bltiextensions":{"lticmoptions":{"lticmproperty":[{"@value":"true","@attributes":{"name":"enabled"}},{"@value":"https:\\/\\/www.edueto.com\\/lti","@attributes":{"name":"url"}},{"@value":"public","@attributes":{"name":"visibility"}}],"@attributes":{"name":"course_navigation"}},"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"12354884848979848","@attributes":{"name":"tool_id"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-27 18:57:22', '2017-04-27 18:57:22'),
(85, 'a02b59353df305b76086c78fbfc0fd1bd508662e87b25e6639b40164aa234c92', '1053aoa07kq6l', 74, 'Office mix', 'false', '', '', 1, '2017-04-27 19:23:12', '2017-04-27 19:23:12'),
(86, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', 75, 'Khana Academy', 'false', '', '', 1, '2017-04-27 19:26:31', '2017-04-27 19:26:31'),
(88, '76e38ebbeda2c4ce3460a37d2bf00bd21d9edfd2e2524e6bf4d7bc9337189fc7', 'zkqv75iatkg8', 77, 'Mindomo', 'false', '', '', 1, '2017-04-27 19:37:03', '2017-04-27 19:37:03'),
(89, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', 78, 'Acclaim', 'false', '', '', 1, '2017-04-27 19:44:16', '2017-04-27 19:44:16'),
(90, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', 79, 'Talent', 'false', '', '', 1, '2017-04-27 19:56:57', '2017-04-27 19:56:57'),
(92, '459766ad7a99502bd169042c35ab2a63eb95944f03e17257085e6ea33d68023a', 'cid-00113', 1, 'Design of Personal Environments 1', NULL, NULL, NULL, 0, '2017-07-03 21:25:03', '2017-07-03 21:25:03'),
(93, '48e34f46273af9216b28aa476263b28814de979e10d173c2873a7d655e980835', '456434513', 42, 'Introduction to Programming', NULL, NULL, NULL, 0, '2017-07-05 15:04:56', '2017-07-05 15:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `lti_domain`
--

CREATE TABLE `lti_domain` (
  `key_id` int(10) UNSIGNED NOT NULL,
  `context_id` int(10) UNSIGNED DEFAULT NULL,
  `domain` longtext,
  `port` int(10) UNSIGNED DEFAULT NULL,
  `consumer_key` text,
  `secret` text,
  `json` text,
  `logo_uri` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_domain`
--

INSERT INTO `lti_domain` (`key_id`, `context_id`, `domain`, `port`, `consumer_key`, `secret`, `json`, `logo_uri`, `created_at`, `updated_at`) VALUES
(36, 40, 'https://www.edu-apps.org/lti_public_resources/?tool_id=quizlet', 80, 'nokey', 'nosecret', '{"cartridge_basiclti_link":{"bltititle":"Quizlet","bltidescription":"Search for and embed publicly available flashcards and question sets from Quizlet. Questions can be embedded directly into content as flash cards, review, or as a study game.","bltilaunch_url":"https:\\/\\/www.edu-apps.org\\/lti_public_resources\\/?tool_id=quizlet","bltiextensions":{"lticmproperty":[{"@value":"edu-apps.org","@attributes":{"name":"domain"}},{"@value":"https:\\/\\/www.edu-apps.org\\/assets\\/lti_public_resources\\/quizlet_icon.png","@attributes":{"name":"icon_url"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}},{"@value":"600","@attributes":{"name":"selection_height"}},{"@value":"560","@attributes":{"name":"selection_width"}},{"@value":"quizlet","@attributes":{"name":"tool_id"}}],"lticmoptions":[{"lticmproperty":{"@value":"true","@attributes":{"name":"enabled"}},"@attributes":{"name":"editor_button"}},{"lticmproperty":{"@value":"true","@attributes":{"name":"enabled"}},"@attributes":{"name":"resource_selection"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/pr_quizlet.png', '2017-04-03 21:14:31', '2017-04-03 21:14:31'),
(39, 43, 'https://openedsearch.azurewebsites.net/', 80, 'mahara', 'maharakey', '{"cartridge_basiclti_link":{"bltititle":"Open Educational Search","bltidescription":"","bltilaunch_url":"https:\\/\\/openedsearch.azurewebsites.net\\/","bltiicon":"https:\\/\\/openedsearch.azurewebsites.net\\/Store\\/StoreIcon16.png","blticustom":"","bltiextensions":{"lticmproperty":[{"@value":"microsoft_opened_search","@attributes":{"name":"tool_id"}},{"@value":"https:\\/\\/openedsearch.azurewebsites.net\\/Store\\/StoreIcon16.png","@attributes":{"name":"icon_url"}},{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"openedsearch.azurewebsites.net","@attributes":{"name":"domain"}},{"@value":"Open Educational Search","@attributes":{"name":"text"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemalocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/f808b8c7-602b-4715-bead-a4230b58365f.png', '2017-04-03 21:17:03', '2017-04-03 21:17:03'),
(43, 50, 'https://dev.unisaonline.net/mahara/auth/blti/login/login.php', 80, 'unisa', '12345', 'false', 'data:image/png;base64,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', '2017-04-10 20:53:28', '2017-04-10 20:53:28'),
(45, 52, 'https://dev.unisaonline.net/whiteboard/', 80, '12345', 'secret', 'false', 'https://awwapp.com/static/site/images/logo-inline-positive.png', '2017-04-10 21:11:23', '2017-04-10 21:11:23'),
(47, 55, 'https://dev.unisaonline.net/e-content/lecturer', 80, 'mangwanani', 'mangwanani', 'false', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAK8AAACvABQqw0mAAAABx0RVh0U29mdHdhcmUAQWRvYmUgRmlyZXdvcmtzIENTM5jWRgMAAAAWdEVYdENyZWF0aW9uIFRpbWUAMTgvMTAvMDjSIwgbAAAEEXRFWHRYTUw6Y29tLmFkb2JlLnhtcAA8P3hwYWNrZXQgYmVnaW49IiAgICIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA0LjEtYzAzNCA0Ni4yNzI5NzYsIFNhdCBKYW4gMjcgMjAwNyAyMjoxMTo0MSAgICAgICAgIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eGFwPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIj4KICAgICAgICAgPHhhcDpDcmVhdG9yVG9vbD5BZG9iZSBGaXJld29ya3MgQ1MzPC94YXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4YXA6Q3JlYXRlRGF0ZT4yMDA4LTEwLTE4VDAwOjAyOjQ3WjwveGFwOkNyZWF0ZURhdGU+CiAgICAgICAgIDx4YXA6TW9kaWZ5RGF0ZT4yMDA4LTEwLTE4VDAyOjA3OjM1WjwveGFwOk1vZGlmeURhdGU+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAs5LQxAAAgAElEQVR4nOzdebglV10v/O9aVXs68zndfXrupDsxQycYJIJCIIwqkoDAdQBBuHoRjaIXeB7vFV9k0iuvj49EhSsISowyvQ44ERBUQEiCymDAMKQzdHpId6fnPuMeqtZ6/1hVu2rXrn1Onz777Fq16/t5nuq9z9Dn1Kp9dv1+9VtDCa01iIiIqFhk1jtAREREg8cEgIiIqICYABARERUQEwAiIqICYgJARERUQEwAiIiICogJABERUQExASAiIiogJgBEREQFxASAiIiogJgAEBERFRATACIiogJiAkBERFRATACIiIgKiAkAERFRATEBICIiKiAmAERERAXkZvFLhRBZ/FobJBsuUj4vUr6v1/8nIrKNXuHzOuX7kt/f6/8PNa0H3+xMEoCCSAv2YoXnaV8D0pMEIiKbpQV3nfh82sfJ58mfR33EBKC/0q7kkwFepnxexr4W/zlp1QAmAkRkq7TAnUwGVOxRJzaV+H9MBjYQE4D1SwvW8UAuEQX91R6TCUHy6p/Bn4hslwz48cCfDParPSp0Jw5pSQVdAiYAlyYeiONX7/EAfjFb8nvj/79Xd0Gv/SAiykKvK/RkoI4nAAqdAV5d5JasFISPaftBq2ACsDZp/fbJQO6kPI8/pn09rUrQqwshbX+IiLKSFniTJfy0q/5w8xPP/cTnk1+PJwMCnYlGr/2hFNYlAFmMhFyJ6JyykLzajwfyeHB3Y593E1/v+N5rXvjSnSM/+NJn+dWRTQsTW66ru9Uty3Anw1941quOde9Tf9tIRLQRZpzGQvi8htaFqlc/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', '2017-04-10 23:03:57', '2017-04-10 23:03:57');
INSERT INTO `lti_domain` (`key_id`, `context_id`, `domain`, `port`, `consumer_key`, `secret`, `json`, `logo_uri`, `created_at`, `updated_at`) VALUES
(48, 56, 'https://dev.unisaonline.net/e-content/mindmap', 80, 'chingwachevana', 'chingwachevana', 'false', 'data:image/png;base64,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', '2017-04-10 23:09:08', '2017-04-10 23:09:08'),
(53, 63, 'https://lti.unplag.com/lti/launch', 80, 'Ooi4WJNocGqZuZJa', '9j60XQP1oIstW6mrfqCUJXGwN9gvGKUs', '{"cartridge_basiclti_link":{"bltititle":"Unplag","bltidescription":"Unplag.com is a similarity checker created to protect content originality, timely spot text duplication","bltiicon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltisecure_icon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltivendor":{"lticpcode":"Unplag.com","lticpname":"Unplag.com","lticpdescription":"Unplag.com is a similarity checker created to protect content originality.","lticpurl":"https:\\/\\/Unplag.com\\/","lticpcontact":{"lticpemail":"support@Unplag.com"}},"bltilaunch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltisecure_launch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltiextensions":{"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"lti.unplag.com","@attributes":{"name":"domain"}}],"lticmoptions":{"lticmproperty":[{"@value":"0","@attributes":{"name":"auto_grade"}},{"@value":"$Canvas.assignment.dueAt.iso8601","@attributes":{"name":"due_date"}}],"@attributes":{"name":"custom_fields"}},"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/unplag.png', '2017-04-22 22:24:49', '2017-04-22 22:24:49'),
(54, 64, 'https://learn-lti.herokuapp.com/launch/init', 80, 'bmmuffy', '395b354f92ba9e9ca8484dff294b18e2', '{"cartridge_basiclti_link":{"bltititle":"Learn LTI","bltidescription":"Lessons and tests on building an LTI app","bltiicon":"","bltiextensions":{"lticmproperty":[{"@value":"learn-lti","@attributes":{"name":"tool_id"}},{"@value":"learn-lti.herokuapp.com","@attributes":{"name":"domain"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}}],"lticmoptions":{"lticmproperty":[{"@value":"https:\\/\\/learn-lti.herokuapp.com\\/launch\\/init","@attributes":{"name":"url"}},{"@value":"Learn LTI Lesson","@attributes":{"name":"text"}},{"@value":"450","@attributes":{"name":"selection_width"}},{"@value":"350","@attributes":{"name":"selection_height"}},{"@value":"true","@attributes":{"name":"enabled"}}],"@attributes":{"name":"resource_selection"}},"@attributes":{"platform":"canvas.instructure.com"}},"cartridge_bundle":{"@value":"","@attributes":{"identifierref":"BLTI001_Bundle"}},"cartridge_icon":{"@value":"","@attributes":{"identifierref":"BLTI001_Icon"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/learn_lti.png', '2017-04-26 01:29:30', '2017-04-26 01:29:30'),
(55, 65, 'https://www.chemvantage.org/lti', 80, 'moodle257-bene-zvako', '7d54e0c65fbd0ad212049c24f080fa9c', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/cc10922f-47fb-49c8-bc04-bb7e9b227830.png', '2017-04-26 01:50:59', '2017-04-26 01:50:59'),
(57, 67, 'https://piazza.com/connect', 80, 'piazza.sandbox', 'test_only_secret', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/piazza.png', '2017-04-26 02:09:59', '2017-04-26 02:09:59'),
(59, 69, 'https://feed-the-lti.herokuapp.com/lti_launch', 80, 'bmmuffy', 'fe461cb447231db7c35c0a0282d597b7', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/feed_the_me.png', '2017-04-27 04:55:29', '2017-04-27 04:55:29'),
(62, 72, 'https://www.canvabadges.org/placement_launch', 80, 'dfd01fce46bf2d5835e31e2e3f69a744', '9c69c9f6d3d1720a6c674a2afee98a80', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/canvabadges.png', '2017-04-27 05:08:25', '2017-04-27 05:08:25'),
(63, 74, 'https://www.edu-apps.org/tool_redirect?id=educreations', 80, 'unisa', '12345', 'false', 'https://learning-support.powerschool.com/hc/en-us/article_attachments/201541733/educreations-logo.png', '2017-04-27 05:16:42', '2017-04-27 05:16:42'),
(64, 75, 'https://q.xorro.com/lti', 80, '54d430d3dc4d', '403a30cb010a5996', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/9e41cb51-77c9-41fe-a393-665702f23f2e.png', '2017-04-27 05:24:02', '2017-04-27 05:24:02'),
(71, 82, 'https://www.edueto.com/lti', 80, '693c299c5978d4e583fe8053630aded3', '1039d57b324a98030918fd6389b6c614', '{"cartridge_basiclti_link":{"bltititle":"Edueto","bltidescription":"Create original online exercises, tests and homework.","bltilaunch_url":"https:\\/\\/www.edueto.com\\/lti","bltiextensions":{"lticmoptions":{"lticmproperty":[{"@value":"true","@attributes":{"name":"enabled"}},{"@value":"https:\\/\\/www.edueto.com\\/lti","@attributes":{"name":"url"}},{"@value":"public","@attributes":{"name":"visibility"}}],"@attributes":{"name":"course_navigation"}},"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"12354884848979848","@attributes":{"name":"tool_id"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/edueto.png', '2017-04-27 18:57:22', '2017-04-27 18:57:22'),
(74, 85, 'https://mix.office.com/lti/', 80, '1053aoa07kq6l', 'hl3ags66k1cj', 'false', 'https://learning-support.powerschool.com/hc/en-us/article_attachments/202135938/MixStoreLogo.png', '2017-04-27 19:23:12', '2017-04-27 19:23:12'),
(75, 86, 'https://www.edu-apps.org/tool_redirect?id=khan_academy', 80, 'unisa', '12345', 'false', 'https://learning-support.powerschool.com/attachments/token/gpvsfopso24bxzc/?name=Khan+Academy.png', '2017-04-27 19:26:31', '2017-04-27 19:26:31'),
(77, 88, 'https://www.mindomo.com', 80, 'zkqv75iatkg8', '1hgi5sj1', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/mindomo.png', '2017-04-27 19:37:03', '2017-04-27 19:37:03'),
(78, 89, 'https://app.getacclaim.com/lti-launch/', 80, 'unisa', '12345', 'false', 'https://learning-support.powerschool.com/hc/en-us/article_attachments/202484908/AcclaimLogo2.png', '2017-04-27 19:44:16', '2017-04-27 19:44:16'),
(79, 90, 'https://www.torshtalent.com/_lti/request', 80, 'unisa', '12345', 'false', 'https://edu-app-center.s3.amazonaws.com/uploads/production/lti_app/banner_image/torsh_talent.png', '2017-04-27 19:56:57', '2017-04-27 19:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `lti_graphs`
--

CREATE TABLE `lti_graphs` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lti_graphs`
--

INSERT INTO `lti_graphs` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, '<script type="text/javascript">\r\n             (function () {\r\n                       var board = JXG.JSXGraph.initBoard(\'box2\', {boundingbox: [-1, 9, 9, -1], axis: true, \r\n                                                           showcopyright: false, shownavigation: false});\r\n\r\n                       // Create a tangent providing a glider on a function graph\r\n\r\n                       var c1 = board.create(\'curve\', [function(t){return t},function(t){return t*t*t;}]);\r\n                       var g1 = board.create(\'glider\', [0.6, 1.2, c1]);\r\n                       var t1 = board.create(\'tangent\', [g1]);\r\n                       board.update();\r\n\r\n                            })();\r\n\r\n       </script>', 'Tangent', '2017-04-10 22:55:06', '2017-04-10 22:55:06'),
(2, '<script type="text/javascript">\r\n        (function () {\r\n            var board = JXG.JSXGraph.initBoard(\'jxgbox\', {\r\n                boundingbox: [-1.5, 2, 1.5, -1],\r\n                keepaspectratio: true,\r\n                showcopyright: false,\r\n                shownavigation: false\r\n            });\r\n            var cerise = {\r\n                        strokeColor: \'#901B77\',\r\n                        fillColor: \'#CA147A\'\r\n                    },\r\n                    grass = {\r\n                        strokeColor: \'#009256\',\r\n                        fillColor: \'#65B72E\',\r\n                        visible: true,\r\n                        withLabel: true\r\n                    },\r\n                    perpendicular = {\r\n                        strokeColor: \'black\',\r\n                        dash: 1,\r\n                        strokeWidth: 1,\r\n                        point: JXG.deepCopy(cerise, {\r\n                            visible: true,\r\n                            withLabel: true\r\n                        })\r\n                    },\r\n                    median = {\r\n                        strokeWidth: 1,\r\n                        strokeColor: \'#333333\',\r\n                        dash: 2\r\n                    },\r\n                    A = board.create(\'point\', [1, 0], cerise),\r\n                    B = board.create(\'point\', [-1, 0], cerise),\r\n                    C = board.create(\'point\', [0.2, 1.5], cerise),\r\n                    pol = board.create(\'polygon\', [A, B, C], {\r\n                        fillColor: \'#FFFF00\',\r\n                        lines: {\r\n                            strokeWidth: 2,\r\n                            strokeColor: \'#009256\'\r\n                        }\r\n                    });\r\n            var pABC, pBCA, pCAB, i1;\r\n            perpendicular.point.name = \'H_c\';\r\n            pABC = board.create(\'perpendicular\', [pol.borders[0], C], perpendicular);\r\n            perpendicular.point.name = \'H_a\';\r\n            pBCA = board.create(\'perpendicular\', [pol.borders[1], A], perpendicular);\r\n            perpendicular.point.name = \'H_b\';\r\n            pCAB = board.create(\'perpendicular\', [pol.borders[2], B], perpendicular);\r\n            grass.name = \'H\';\r\n            i1 = board.create(\'intersection\', [pABC, pCAB, 0], grass);\r\n            var mAB, mBC, mCA;\r\n            cerise.name = \'M_c\';\r\n            mAB = board.create(\'midpoint\', [A, B], cerise);\r\n            cerise.name = \'M_a\';\r\n            mBC = board.create(\'midpoint\', [B, C], cerise);\r\n            cerise.name = \'M_b\';\r\n            mCA = board.create(\'midpoint\', [C, A], cerise);\r\n            var ma, mb, mc, i2;\r\n            ma = board.create(\'segment\', [mBC, A], median);\r\n            mb = board.create(\'segment\', [mCA, B], median);\r\n            mc = board.create(\'segment\', [mAB, C], median);\r\n            grass.name = \'S\';\r\n            i2 = board.create(\'intersection\', [ma, mc, 0], grass);\r\n            var c;\r\n            grass.name = \'U\';\r\n            c = board.create(\'circumcircle\', [A, B, C], {\r\n                strokeColor: \'#000000\',\r\n                dash: 3,\r\n                strokeWidth: 1,\r\n                point: grass\r\n            });\r\n            var euler;\r\n            euler = board.create(\'line\', [i1, i2], {\r\n                strokeWidth: 2,\r\n                strokeColor: \'#901B77\'\r\n            });\r\n            board.update();\r\n        })();\r\n        </script>', 'JxGBox-1', '2017-05-08 04:21:07', '2017-05-08 04:21:07'),
(3, '<script type="text/javascript">\r\n        (function () {\r\n            var board = JXG.JSXGraph.initBoard(\'jxgbox\', {\r\n                boundingbox: [-1.5, 2, 1.5, -1],\r\n                keepaspectratio: true,\r\n                showcopyright: false,\r\n                shownavigation: false\r\n            });\r\n            var cerise = {\r\n                        strokeColor: \'#901B77\',\r\n                        fillColor: \'#CA147A\'\r\n                    },\r\n                    grass = {\r\n                        strokeColor: \'#009256\',\r\n                        fillColor: \'#65B72E\',\r\n                        visible: true,\r\n                        withLabel: true\r\n                    },\r\n                    perpendicular = {\r\n                        strokeColor: \'black\',\r\n                        dash: 1,\r\n                        strokeWidth: 1,\r\n                        point: JXG.deepCopy(cerise, {\r\n                            visible: true,\r\n                            withLabel: true\r\n                        })\r\n                    },\r\n                    median = {\r\n                        strokeWidth: 1,\r\n                        strokeColor: \'#333333\',\r\n                        dash: 2\r\n                    },\r\n                    A = board.create(\'point\', [1, 0], cerise),\r\n                    B = board.create(\'point\', [-1, 0], cerise),\r\n                    C = board.create(\'point\', [0.2, 1.5], cerise),\r\n                    pol = board.create(\'polygon\', [A, B, C], {\r\n                        fillColor: \'#FFFF00\',\r\n                        lines: {\r\n                            strokeWidth: 2,\r\n                            strokeColor: \'#009256\'\r\n                        }\r\n                    });\r\n            var pABC, pBCA, pCAB, i1;\r\n            perpendicular.point.name = \'H_c\';\r\n            pABC = board.create(\'perpendicular\', [pol.borders[0], C], perpendicular);\r\n            perpendicular.point.name = \'H_a\';\r\n            pBCA = board.create(\'perpendicular\', [pol.borders[1], A], perpendicular);\r\n            perpendicular.point.name = \'H_b\';\r\n            pCAB = board.create(\'perpendicular\', [pol.borders[2], B], perpendicular);\r\n            grass.name = \'H\';\r\n            i1 = board.create(\'intersection\', [pABC, pCAB, 0], grass);\r\n            var mAB, mBC, mCA;\r\n            cerise.name = \'M_c\';\r\n            mAB = board.create(\'midpoint\', [A, B], cerise);\r\n            cerise.name = \'M_a\';\r\n            mBC = board.create(\'midpoint\', [B, C], cerise);\r\n            cerise.name = \'M_b\';\r\n            mCA = board.create(\'midpoint\', [C, A], cerise);\r\n            var ma, mb, mc, i2;\r\n            ma = board.create(\'segment\', [mBC, A], median);\r\n            mb = board.create(\'segment\', [mCA, B], median);\r\n            mc = board.create(\'segment\', [mAB, C], median);\r\n            grass.name = \'S\';\r\n            i2 = board.create(\'intersection\', [ma, mc, 0], grass);\r\n            var c;\r\n            grass.name = \'U\';\r\n            c = board.create(\'circumcircle\', [A, B, C], {\r\n                strokeColor: \'#000000\',\r\n                dash: 3,\r\n                strokeWidth: 1,\r\n                point: grass\r\n            });\r\n            var euler;\r\n            euler = board.create(\'line\', [i1, i2], {\r\n                strokeWidth: 2,\r\n                strokeColor: \'#901B77\'\r\n            });\r\n            board.update();\r\n        })();\r\n        </script>', 'Latest Graph', '2017-05-08 04:31:00', '2017-05-08 04:31:00'),
(4, '(function () {\r\n            var board = JXG.JSXGraph.initBoard(\'jxgbox\', {\r\n                boundingbox: [-1.5, 2, 1.5, -1],\r\n                keepaspectratio: true,\r\n                showcopyright: false,\r\n                shownavigation: false\r\n            });\r\n            var cerise = {\r\n                        strokeColor: \'#901B77\',\r\n                        fillColor: \'#CA147A\'\r\n                    },\r\n                    grass = {\r\n                        strokeColor: \'#009256\',\r\n                        fillColor: \'#65B72E\',\r\n                        visible: true,\r\n                        withLabel: true\r\n                    },\r\n                    perpendicular = {\r\n                        strokeColor: \'black\',\r\n                        dash: 1,\r\n                        strokeWidth: 1,\r\n                        point: JXG.deepCopy(cerise, {\r\n                            visible: true,\r\n                            withLabel: true\r\n                        })\r\n                    },\r\n                    median = {\r\n                        strokeWidth: 1,\r\n                        strokeColor: \'#333333\',\r\n                        dash: 2\r\n                    },\r\n                    A = board.create(\'point\', [1, 0], cerise),\r\n                    B = board.create(\'point\', [-1, 0], cerise),\r\n                    C = board.create(\'point\', [0.2, 1.5], cerise),\r\n                    pol = board.create(\'polygon\', [A, B, C], {\r\n                        fillColor: \'#FFFF00\',\r\n                        lines: {\r\n                            strokeWidth: 2,\r\n                            strokeColor: \'#009256\'\r\n                        }\r\n                    });\r\n            var pABC, pBCA, pCAB, i1;\r\n            perpendicular.point.name = \'H_c\';\r\n            pABC = board.create(\'perpendicular\', [pol.borders[0], C], perpendicular);\r\n            perpendicular.point.name = \'H_a\';\r\n            pBCA = board.create(\'perpendicular\', [pol.borders[1], A], perpendicular);\r\n            perpendicular.point.name = \'H_b\';\r\n            pCAB = board.create(\'perpendicular\', [pol.borders[2], B], perpendicular);\r\n            grass.name = \'H\';\r\n            i1 = board.create(\'intersection\', [pABC, pCAB, 0], grass);\r\n            var mAB, mBC, mCA;\r\n            cerise.name = \'M_c\';\r\n            mAB = board.create(\'midpoint\', [A, B], cerise);\r\n            cerise.name = \'M_a\';\r\n            mBC = board.create(\'midpoint\', [B, C], cerise);\r\n            cerise.name = \'M_b\';\r\n            mCA = board.create(\'midpoint\', [C, A], cerise);\r\n            var ma, mb, mc, i2;\r\n            ma = board.create(\'segment\', [mBC, A], median);\r\n            mb = board.create(\'segment\', [mCA, B], median);\r\n            mc = board.create(\'segment\', [mAB, C], median);\r\n            grass.name = \'S\';\r\n            i2 = board.create(\'intersection\', [ma, mc, 0], grass);\r\n            var c;\r\n            grass.name = \'U\';\r\n            c = board.create(\'circumcircle\', [A, B, C], {\r\n                strokeColor: \'#000000\',\r\n                dash: 3,\r\n                strokeWidth: 1,\r\n                point: grass\r\n            });\r\n            var euler;\r\n            euler = board.create(\'line\', [i1, i2], {\r\n                strokeWidth: 2,\r\n                strokeColor: \'#901B77\'\r\n            });\r\n            board.update();\r\n        })();', 'Interactive Graph 3', '2017-07-06 22:58:34', '2017-07-06 22:58:34'),
(5, '(function () {\r\n            var board = JXG.JSXGraph.initBoard(\'jxgbox\', {\r\n                boundingbox: [-1.5, 2, 1.5, -1],\r\n                keepaspectratio: true,\r\n                showcopyright: false,\r\n                shownavigation: false\r\n            });\r\n            var cerise = {\r\n                        strokeColor: \'#901B77\',\r\n                        fillColor: \'#CA147A\'\r\n                    },\r\n                    grass = {\r\n                        strokeColor: \'#009256\',\r\n                        fillColor: \'#65B72E\',\r\n                        visible: true,\r\n                        withLabel: true\r\n                    },\r\n                    perpendicular = {\r\n                        strokeColor: \'black\',\r\n                        dash: 1,\r\n                        strokeWidth: 1,\r\n                        point: JXG.deepCopy(cerise, {\r\n                            visible: true,\r\n                            withLabel: true\r\n                        })\r\n                    },\r\n                    median = {\r\n                        strokeWidth: 1,\r\n                        strokeColor: \'#333333\',\r\n                        dash: 2\r\n                    },\r\n                    A = board.create(\'point\', [1, 0], cerise),\r\n                    B = board.create(\'point\', [-1, 0], cerise),\r\n                    C = board.create(\'point\', [0.2, 1.5], cerise),\r\n                    pol = board.create(\'polygon\', [A, B, C], {\r\n                        fillColor: \'#FFFF00\',\r\n                        lines: {\r\n                            strokeWidth: 2,\r\n                            strokeColor: \'#009256\'\r\n                        }\r\n                    });\r\n            var pABC, pBCA, pCAB, i1;\r\n            perpendicular.point.name = \'H_c\';\r\n            pABC = board.create(\'perpendicular\', [pol.borders[0], C], perpendicular);\r\n            perpendicular.point.name = \'H_a\';\r\n            pBCA = board.create(\'perpendicular\', [pol.borders[1], A], perpendicular);\r\n            perpendicular.point.name = \'H_b\';\r\n            pCAB = board.create(\'perpendicular\', [pol.borders[2], B], perpendicular);\r\n            grass.name = \'H\';\r\n            i1 = board.create(\'intersection\', [pABC, pCAB, 0], grass);\r\n            var mAB, mBC, mCA;\r\n            cerise.name = \'M_c\';\r\n            mAB = board.create(\'midpoint\', [A, B], cerise);\r\n            cerise.name = \'M_a\';\r\n            mBC = board.create(\'midpoint\', [B, C], cerise);\r\n            cerise.name = \'M_b\';\r\n            mCA = board.create(\'midpoint\', [C, A], cerise);\r\n            var ma, mb, mc, i2;\r\n            ma = board.create(\'segment\', [mBC, A], median);\r\n            mb = board.create(\'segment\', [mCA, B], median);\r\n            mc = board.create(\'segment\', [mAB, C], median);\r\n            grass.name = \'S\';\r\n            i2 = board.create(\'intersection\', [ma, mc, 0], grass);\r\n            var c;\r\n            grass.name = \'U\';\r\n            c = board.create(\'circumcircle\', [A, B, C], {\r\n                strokeColor: \'#000000\',\r\n                dash: 3,\r\n                strokeWidth: 1,\r\n                point: grass\r\n            });\r\n            var euler;\r\n            euler = board.create(\'line\', [i1, i2], {\r\n                strokeWidth: 2,\r\n                strokeColor: \'#901B77\'\r\n            });\r\n            board.update();\r\n        })();', 'Demo Graph July', '2017-07-07 05:29:37', '2017-07-07 05:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `lti_key`
--

CREATE TABLE `lti_key` (
  `key_id` int(10) UNSIGNED NOT NULL,
  `key_sha256` char(64) NOT NULL,
  `key_key` text NOT NULL,
  `secret` text,
  `new_secret` text,
  `ack` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `consumer_profile` text,
  `new_consumer_profile` text,
  `tool_profile` text,
  `new_tool_profile` text,
  `json` text,
  `settings` text,
  `settings_url` text,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_key`
--

INSERT INTO `lti_key` (`key_id`, `key_sha256`, `key_key`, `secret`, `new_secret`, `ack`, `user_id`, `consumer_profile`, `new_consumer_profile`, `tool_profile`, `new_tool_profile`, `json`, `settings`, `settings_url`, `entity_version`, `created_at`, `updated_at`) VALUES
(1, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '12345', 'secret', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-01-19 07:16:12', '2017-01-19 07:16:12'),
(2, 'd4c9d9027326271a89ce51fcaf328ed673f17be33469ff979e8ab8dd501e664f', 'google.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-01-19 07:16:12', '2017-01-19 07:16:12'),
(34, '98483c6eb40b6c31a448c22a66ded3b5e5e8d5119cac8327b655c8b5c4836489', 'testkey', 'testkey', NULL, '', 14, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"XanEdu","bltidescription":"XanEdu LTI App","bltilaunch_url":"","bltiextensions":{"lticmproperty":[{"@value":"xanedu.com","@attributes":{"name":"domain"}},{"@value":"http:\\/\\/coursepacks.xanedu.com\\/images\\/cpcc_xanedu.gif","@attributes":{"name":"icon_url"}},{"@value":"name_only","@attributes":{"name":"privacy_level"}},{"@value":"xanedu","@attributes":{"name":"tool_id"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 21:12:58', '2017-04-03 21:12:58'),
(36, '3a86e4c51bcc8d434e8e28a81b71a5af4f5d2525f4874a38f3644fb6291b3406', 'nokey', 'nosecret', NULL, '', 14, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"Quizlet","bltidescription":"Search for and embed publicly available flashcards and question sets from Quizlet. Questions can be embedded directly into content as flash cards, review, or as a study game.","bltilaunch_url":"https:\\/\\/www.edu-apps.org\\/lti_public_resources\\/?tool_id=quizlet","bltiextensions":{"lticmproperty":[{"@value":"edu-apps.org","@attributes":{"name":"domain"}},{"@value":"https:\\/\\/www.edu-apps.org\\/assets\\/lti_public_resources\\/quizlet_icon.png","@attributes":{"name":"icon_url"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}},{"@value":"600","@attributes":{"name":"selection_height"}},{"@value":"560","@attributes":{"name":"selection_width"}},{"@value":"quizlet","@attributes":{"name":"tool_id"}}],"lticmoptions":[{"lticmproperty":{"@value":"true","@attributes":{"name":"enabled"}},"@attributes":{"name":"editor_button"}},{"lticmproperty":{"@value":"true","@attributes":{"name":"enabled"}},"@attributes":{"name":"resource_selection"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 21:14:31', '2017-04-03 21:14:31'),
(39, '166253b8f92ae0bc431aa587a64251665513aa31f0304a757f7e3f4d3c559f33', 'mahara', 'maharakey', NULL, '', 14, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"Open Educational Search","bltidescription":"","bltilaunch_url":"https:\\/\\/openedsearch.azurewebsites.net\\/","bltiicon":"https:\\/\\/openedsearch.azurewebsites.net\\/Store\\/StoreIcon16.png","blticustom":"","bltiextensions":{"lticmproperty":[{"@value":"microsoft_opened_search","@attributes":{"name":"tool_id"}},{"@value":"https:\\/\\/openedsearch.azurewebsites.net\\/Store\\/StoreIcon16.png","@attributes":{"name":"icon_url"}},{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"openedsearch.azurewebsites.net","@attributes":{"name":"domain"}},{"@value":"Open Educational Search","@attributes":{"name":"text"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemalocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-03 21:17:03', '2017-04-03 21:17:03'),
(42, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', '12345', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-10 20:50:58', '2017-04-10 20:50:58'),
(43, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', '12345', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-10 20:53:28', '2017-04-10 20:53:28'),
(45, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '12345', 'secret', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-10 21:11:23', '2017-04-10 21:11:23'),
(47, '6036272f420fcb803d05299ad19dd82cebd716b75e4c967b169a055e011a6b06', 'mangwanani', 'mangwanani', NULL, '', 1400006, '', '', '', '', 'false', '', '', 1, '2017-04-10 23:03:57', '2017-04-10 23:03:57'),
(48, 'f0bc6d10cee6478ca4f69692bae9de2b10bd2ce9cda3d974251572b62894590e', 'chingwachevana', 'chingwachevana', NULL, '', 1400007, '', '', '', '', 'false', '', '', 1, '2017-04-10 23:09:08', '2017-04-10 23:09:08'),
(50, '680d48ce56d582bee092e23826ca0724dd50d6615ed5f8f8a8feea82372e5ea8', 'X03V2zr6ECRiV0ix', '25DRd3DauiRBMoRl79ya18cw19GYOOdJ', NULL, '', 1400010, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"Unplag","bltidescription":"Unplag.com is a similarity checker created to protect content originality, timely spot text duplication","bltiicon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltisecure_icon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltivendor":{"lticpcode":"Unplag.com","lticpname":"Unplag.com","lticpdescription":"Unplag.com is a similarity checker created to protect content originality.","lticpurl":"https:\\/\\/Unplag.com\\/","lticpcontact":{"lticpemail":"support@Unplag.com"}},"bltilaunch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltisecure_launch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltiextensions":{"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"lti.unplag.com","@attributes":{"name":"domain"}}],"lticmoptions":{"lticmproperty":[{"@value":"0","@attributes":{"name":"auto_grade"}},{"@value":"$Canvas.assignment.dueAt.iso8601","@attributes":{"name":"due_date"}}],"@attributes":{"name":"custom_fields"}},"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-20 01:52:44', '2017-04-20 01:52:44'),
(53, '1cc1a8c8fec669478e25a389e57d31decae735594569215ca5e81369e17c139a', 'Ooi4WJNocGqZuZJa', '9j60XQP1oIstW6mrfqCUJXGwN9gvGKUs', NULL, '', 1, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"Unplag","bltidescription":"Unplag.com is a similarity checker created to protect content originality, timely spot text duplication","bltiicon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltisecure_icon":"https:\\/\\/unplag.com\\/img\\/logo_cab.svg","bltivendor":{"lticpcode":"Unplag.com","lticpname":"Unplag.com","lticpdescription":"Unplag.com is a similarity checker created to protect content originality.","lticpurl":"https:\\/\\/Unplag.com\\/","lticpcontact":{"lticpemail":"support@Unplag.com"}},"bltilaunch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltisecure_launch_url":"https:\\/\\/lti.unplag.com\\/lti\\/launch","bltiextensions":{"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"lti.unplag.com","@attributes":{"name":"domain"}}],"lticmoptions":{"lticmproperty":[{"@value":"0","@attributes":{"name":"auto_grade"}},{"@value":"$Canvas.assignment.dueAt.iso8601","@attributes":{"name":"due_date"}}],"@attributes":{"name":"custom_fields"}},"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-22 22:24:48', '2017-04-22 22:24:48'),
(54, '477015de8f713070bc7b7c73aa16359483e0ffa9e1da73d53ebde4083ca6e9d5', 'bmmuffy', '395b354f92ba9e9ca8484dff294b18e2', NULL, '', 1, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"Learn LTI","bltidescription":"Lessons and tests on building an LTI app","bltiicon":"","bltiextensions":{"lticmproperty":[{"@value":"learn-lti","@attributes":{"name":"tool_id"}},{"@value":"learn-lti.herokuapp.com","@attributes":{"name":"domain"}},{"@value":"anonymous","@attributes":{"name":"privacy_level"}}],"lticmoptions":{"lticmproperty":[{"@value":"https:\\/\\/learn-lti.herokuapp.com\\/launch\\/init","@attributes":{"name":"url"}},{"@value":"Learn LTI Lesson","@attributes":{"name":"text"}},{"@value":"450","@attributes":{"name":"selection_width"}},{"@value":"350","@attributes":{"name":"selection_height"}},{"@value":"true","@attributes":{"name":"enabled"}}],"@attributes":{"name":"resource_selection"}},"@attributes":{"platform":"canvas.instructure.com"}},"cartridge_bundle":{"@value":"","@attributes":{"identifierref":"BLTI001_Bundle"}},"cartridge_icon":{"@value":"","@attributes":{"identifierref":"BLTI001_Icon"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd     http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-26 01:29:30', '2017-04-26 01:29:30'),
(55, '14116841caa61935e3a39da23cb380d3865328d939be5802e2f905a93238f5f9', 'moodle257-bene-zvako', '7d54e0c65fbd0ad212049c24f080fa9c', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-26 01:50:59', '2017-04-26 01:50:59'),
(57, '9c5e6d70261a7e0b7e70e835aa76598a3bce91e7588ede1153efc4edd3859059', 'piazza.sandbox', 'test_only_secret', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-26 02:09:59', '2017-04-26 02:09:59'),
(59, '477015de8f713070bc7b7c73aa16359483e0ffa9e1da73d53ebde4083ca6e9d5', 'bmmuffy', 'fe461cb447231db7c35c0a0282d597b7', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 04:55:29', '2017-04-27 04:55:29'),
(62, 'cd1c9b429e7062c5581eaf0d812194a291d5fa2fb54ea14113a43d69ec8774d8', 'dfd01fce46bf2d5835e31e2e3f69a744', '9c69c9f6d3d1720a6c674a2afee98a80', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 05:08:25', '2017-04-27 05:08:25'),
(63, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', '12345', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 05:16:42', '2017-04-27 05:16:42'),
(64, '089486ceb053b7244b0c598ec946fbc04b98a504fd7d6bc00ac7197921862abc', '54d430d3dc4d', '403a30cb010a5996', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 05:24:01', '2017-04-27 05:24:01'),
(71, 'efe79ca59f358f2fd20a4686c639e7f98cef01e9918d8fa27284205f7ec0e6cf', '693c299c5978d4e583fe8053630aded3', '1039d57b324a98030918fd6389b6c614', NULL, '', 1, '', '', '', '', '{"cartridge_basiclti_link":{"bltititle":"Edueto","bltidescription":"Create original online exercises, tests and homework.","bltilaunch_url":"https:\\/\\/www.edueto.com\\/lti","bltiextensions":{"lticmoptions":{"lticmproperty":[{"@value":"true","@attributes":{"name":"enabled"}},{"@value":"https:\\/\\/www.edueto.com\\/lti","@attributes":{"name":"url"}},{"@value":"public","@attributes":{"name":"visibility"}}],"@attributes":{"name":"course_navigation"}},"lticmproperty":[{"@value":"public","@attributes":{"name":"privacy_level"}},{"@value":"12354884848979848","@attributes":{"name":"tool_id"}}],"@attributes":{"platform":"canvas.instructure.com"}},"@attributes":{"schemaLocation":"http:\\/\\/www.imsglobal.org\\/xsd\\/imslticc_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticc_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imsbasiclti_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imsbasiclti_v1p0p1.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticm_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticm_v1p0.xsd http:\\/\\/www.imsglobal.org\\/xsd\\/imslticp_v1p0 http:\\/\\/www.imsglobal.org\\/xsd\\/lti\\/ltiv1p0\\/imslticp_v1p0.xsd"}}}', '', '', 1, '2017-04-27 18:57:22', '2017-04-27 18:57:22'),
(74, 'a02b59353df305b76086c78fbfc0fd1bd508662e87b25e6639b40164aa234c92', '1053aoa07kq6l', 'hl3ags66k1cj', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 19:23:12', '2017-04-27 19:23:12'),
(75, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', '12345', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 19:26:31', '2017-04-27 19:26:31'),
(77, '76e38ebbeda2c4ce3460a37d2bf00bd21d9edfd2e2524e6bf4d7bc9337189fc7', 'zkqv75iatkg8', '1hgi5sj1', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 19:37:03', '2017-04-27 19:37:03'),
(78, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', '12345', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 19:44:16', '2017-04-27 19:44:16'),
(79, '11cdf5cb34aef73394abde0dc62900b615d493091d80b124d6672fd4c4ba31f8', 'unisa', '12345', NULL, '', 1, '', '', '', '', 'false', '', '', 1, '2017-04-27 19:56:56', '2017-04-27 19:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `lti_link`
--

CREATE TABLE `lti_link` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `link_sha256` char(64) NOT NULL,
  `link_key` text NOT NULL,
  `context_id` int(10) UNSIGNED NOT NULL,
  `path` text,
  `title` text,
  `json` text,
  `settings` text,
  `settings_url` text,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_link`
--

INSERT INTO `lti_link` (`link_id`, `link_sha256`, `link_key`, `context_id`, `path`, `title`, `json`, `settings`, `settings_url`, `entity_version`, `created_at`, `updated_at`) VALUES
(1, '92cef4029ac060d448065916b25ead6c273e25114224d01c283fdc2ce250c463', '292832126', 1, 'https://dev.unisaonline.net/e-content/lti', 'Weekly Blog', NULL, NULL, NULL, 0, '2017-01-20 09:39:51', '2017-01-20 09:39:51'),
(2, '92cef4029ac060d448065916b25ead6c273e25114224d01c283fdc2ce250c463', '292832126', 46, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-04-10 12:09:46', '2017-04-10 12:09:46'),
(3, 'f97b62402266a3de1c158831a5868ac00ba75dc58d142df75078c7416eb3fe60', '2928321267', 46, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-04-10 12:12:24', '2017-04-10 12:12:24'),
(4, '92cef4029ac060d448065916b25ead6c273e25114224d01c283fdc2ce250c463', '292832126', 47, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-04-10 16:03:44', '2017-04-10 16:03:44'),
(5, 'dbd3ca8516da0f8db2519b6a384cbf43c85fe7dd4911d9b182b2796a307ed46b', '292832126787', 48, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-04-10 16:57:38', '2017-04-10 16:57:38'),
(6, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '12345', 54, NULL, 'Title for thing', NULL, NULL, NULL, 0, '2017-04-11 10:22:14', '2017-04-11 10:22:14'),
(7, 'dbd3ca8516da0f8db2519b6a384cbf43c85fe7dd4911d9b182b2796a307ed46b', '292832126787', 58, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-04-11 12:55:28', '2017-04-11 12:55:28'),
(8, 'afc5caccc30408631f34bafec359b58c58dcccaaffa9a857e6aa48abbcc1c926', '29283212633', 59, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-04-20 13:50:48', '2017-04-20 13:50:48'),
(9, '6876a3d6684737ac2c785997e24cd33b1d821757dad3a94be501352f4b819454', 'res-0012612', 92, NULL, 'My Weekly Wiki', NULL, NULL, NULL, 0, '2017-07-03 21:25:03', '2017-07-03 21:25:03'),
(10, '92cef4029ac060d448065916b25ead6c273e25114224d01c283fdc2ce250c463', '292832126', 93, NULL, 'Weekly Blog', NULL, NULL, NULL, 0, '2017-07-05 15:04:56', '2017-07-05 15:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `lti_membership`
--

CREATE TABLE `lti_membership` (
  `membership_id` int(10) UNSIGNED NOT NULL,
  `context_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` smallint(6) DEFAULT NULL,
  `role_override` smallint(6) DEFAULT NULL,
  `json` text,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_membership`
--

INSERT INTO `lti_membership` (`membership_id`, `context_id`, `user_id`, `role`, `role_override`, `json`, `entity_version`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL, 0, '2017-01-20 09:39:51', '2017-01-20 09:39:51'),
(2, 1, 2, 0, NULL, NULL, 0, '2017-03-07 06:26:31', '2017-03-07 06:26:31'),
(3, 1, 3, 0, NULL, NULL, 0, '2017-03-07 06:26:37', '2017-03-07 06:26:37'),
(8, 1, 7, 1, NULL, NULL, 0, '2017-04-10 12:47:38', '2017-04-10 12:47:38'),
(9, 1, 8, 0, NULL, NULL, 0, '2017-04-10 12:47:51', '2017-04-10 12:47:51'),
(10, 46, 1, 1, NULL, NULL, 0, '2017-04-10 13:46:52', '2017-04-10 13:46:52'),
(11, 46, 2, 0, NULL, NULL, 0, '2017-04-10 15:41:09', '2017-04-10 15:41:09'),
(12, 46, 3, 0, NULL, NULL, 0, '2017-04-10 15:41:17', '2017-04-10 15:41:17'),
(13, 46, 7, 0, NULL, NULL, 0, '2017-04-10 15:42:48', '2017-04-10 15:42:48'),
(14, 1, 9, 1, NULL, NULL, 0, '2017-04-10 15:45:34', '2017-04-10 15:45:34'),
(15, 47, 9, 1, NULL, NULL, 0, '2017-04-10 16:03:44', '2017-04-10 16:03:44'),
(16, 46, 10, 0, NULL, NULL, 0, '2017-04-10 16:16:02', '2017-04-10 16:16:02'),
(17, 46, 11, 0, NULL, NULL, 0, '2017-04-10 16:54:09', '2017-04-10 16:54:09'),
(18, 46, 12, 1, NULL, NULL, 0, '2017-04-10 16:54:50', '2017-04-10 16:54:50'),
(19, 48, 13, 1, NULL, NULL, 0, '2017-04-10 16:57:39', '2017-04-10 16:57:39'),
(20, 48, 8, 0, NULL, NULL, 0, '2017-04-10 17:51:22', '2017-04-10 17:51:22'),
(21, 48, 2, 0, NULL, NULL, 0, '2017-04-10 17:51:25', '2017-04-10 17:51:25'),
(22, 48, 1, 1, NULL, NULL, 0, '2017-04-10 17:53:20', '2017-04-10 17:53:20'),
(23, 47, 2, 0, NULL, NULL, 0, '2017-04-11 07:43:39', '2017-04-11 07:43:39'),
(24, 47, 1, 1, NULL, NULL, 0, '2017-04-11 07:44:04', '2017-04-11 07:44:04'),
(25, 54, 14, 1, NULL, NULL, 0, '2017-04-11 10:22:14', '2017-04-11 10:22:14'),
(26, 58, 15, 1, NULL, NULL, 0, '2017-04-11 12:55:28', '2017-04-11 12:55:28'),
(27, 58, 16, 0, NULL, NULL, 0, '2017-04-11 12:56:47', '2017-04-11 12:56:47'),
(28, 59, 17, 1, NULL, NULL, 0, '2017-04-20 13:50:48', '2017-04-20 13:50:48'),
(29, 59, 1, 1, NULL, NULL, 0, '2017-04-20 14:13:03', '2017-04-20 14:13:03'),
(30, 59, 2, 0, NULL, NULL, 0, '2017-04-20 14:13:19', '2017-04-20 14:13:19'),
(31, 59, 8, 0, NULL, NULL, 0, '2017-04-20 14:13:30', '2017-04-20 14:13:30'),
(32, 92, 18, 1, NULL, NULL, 0, '2017-07-03 21:25:04', '2017-07-03 21:25:04'),
(33, 93, 19, 0, NULL, NULL, 0, '2017-07-05 15:04:56', '2017-07-05 15:04:56'),
(34, 93, 15, 1, NULL, NULL, 0, '2017-07-05 15:05:11', '2017-07-05 15:05:11'),
(35, 93, 16, 0, NULL, NULL, 0, '2017-07-06 09:41:39', '2017-07-06 09:41:39'),
(36, 1, 20, 1, NULL, NULL, 0, '2017-07-08 12:19:45', '2017-07-08 12:19:45'),
(37, 93, 21, 1, NULL, NULL, 0, '2017-07-08 12:20:31', '2017-07-08 12:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `lti_nonce`
--

CREATE TABLE `lti_nonce` (
  `nonce` char(128) NOT NULL,
  `key_id` int(10) UNSIGNED NOT NULL,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_nonce`
--

INSERT INTO `lti_nonce` (`nonce`, `key_id`, `entity_version`, `created_at`) VALUES
('23a40c4e97dbe09dbbda5e3577ed1ce6', 1, 0, '2017-07-16 12:41:09'),
('440a108060f579f47e942c837bcdac89', 1, 0, '2017-07-27 09:29:29'),
('4f763d885fab36a70b0e542a2b9f08a8', 1, 0, '2017-07-27 14:53:29'),
('5746d01a1a9c54ec7325a4bfc2a94d3c', 1, 0, '2017-07-28 08:13:38'),
('6982d249ccdbb6370ac6ce431e8d4d87', 1, 0, '2017-07-27 09:29:01'),
('72575ebb102dc861d8d7c9d059b8e975', 1, 0, '2017-07-27 14:52:50'),
('72ba0e7a5d0049c5d23741cab766ce7e', 1, 0, '2017-07-08 12:19:45'),
('876ff42cd75f6385c9bf2cb0523ff472', 1, 0, '2017-07-19 10:32:04'),
('899fa95eccc41ab945ed0e02ba5e0bea', 1, 0, '2017-07-28 09:27:23'),
('9839b2169b5c093d3546a2f7d7792eb3', 1, 0, '2017-07-25 15:09:44'),
('a8bd5145f4550be642bc5fb4a1d6f1f7', 1, 0, '2017-07-26 08:48:45'),
('d15b50e7c1e8ef0c39bc51b542ef1a29', 1, 0, '2017-07-28 13:56:14'),
('12d370637cb866bfd556fe5fa99586d4', 42, 0, '2017-07-14 16:18:12'),
('16e83b40bb3a71f2d971aec2bb9d987f', 42, 0, '2017-07-26 14:51:37'),
('18864e3f3d7efc6ddaac4ebe9ef13df2', 42, 0, '2017-07-21 10:57:43'),
('21bc6876d37b9d49e74f026e1161a62a', 42, 0, '2017-07-21 08:17:54'),
('248548803c661f121a7280393dbd5427', 42, 0, '2017-07-17 11:03:16'),
('463a12a9486abdbd41cb2151f369352e', 42, 0, '2017-07-13 10:11:31'),
('4c697a3981826cd4f40b6e64535ae51f', 42, 0, '2017-07-17 09:10:14'),
('50f7825cc6c8f9c85661d7f7a3695f2a', 42, 0, '2017-07-21 08:10:28'),
('5640183934783a5c674e8f787ebca660', 42, 0, '2017-07-25 13:15:19'),
('6a5b3787a851e63d6d394802a7507dce', 42, 0, '2017-07-13 10:09:27'),
('6aac84fd77c307107bc6c970844158a6', 42, 0, '2017-07-17 09:03:37'),
('6cd3f64f0b7d2ac65b59e39dc6fd1c78', 42, 0, '2017-07-21 08:12:27'),
('7719cbf36157cc0f3e6b0d46436113a5', 42, 0, '2017-07-24 13:59:19'),
('8d67d26ac543d5f6f2b608f066e1ab3c', 42, 0, '2017-07-14 09:48:40'),
('974164364fce3e323c43eb59f0577f8d', 42, 0, '2017-07-24 13:00:26'),
('9ba65c9a8f7108f0823bd5877435f5f2', 42, 0, '2017-07-26 14:40:37'),
('a29806a15683918aea2587ca58626759', 42, 0, '2017-07-16 12:41:16'),
('aedd40bda5e801bfc747652b7d4b4a3c', 42, 0, '2017-07-13 10:13:52'),
('b133500bd6393f29f42edeadb9148abe', 42, 0, '2017-07-21 10:54:42'),
('b22ceccae8e24e11425c2bfc99e44004', 42, 0, '2017-07-17 09:43:35'),
('b66742ea928c79fc40ec63f817527623', 42, 0, '2017-07-07 10:23:20'),
('c2be201cc91b1f0c10eb5cb0ac6fa100', 42, 0, '2017-07-26 15:52:02'),
('c8455bf84f5132b40a988f94e296ac8a', 42, 0, '2017-07-14 10:12:13'),
('c8da0dc89af9d2528324dace0a14bb04', 42, 0, '2017-07-14 10:25:48'),
('e1ad6f91fb9ea7afa8ead96a36407bcf', 42, 0, '2017-07-17 09:09:04'),
('e97840f5c5a6117e6ffb1c64a5f5b13b', 42, 0, '2017-07-14 10:21:28'),
('f06216097ba9416345e1c130aaac0d27', 42, 0, '2017-07-08 12:20:31'),
('f9bd726fa27f1473fac357edc38130a8', 42, 0, '2017-07-17 11:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `lti_result`
--

CREATE TABLE `lti_result` (
  `result_id` int(10) UNSIGNED NOT NULL,
  `link_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `result_url` text,
  `sourcedid` text,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `ipaddr` varchar(64) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `note` text,
  `server_grade` float DEFAULT NULL,
  `json` text,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retrieved_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_result`
--

INSERT INTO `lti_result` (`result_id`, `link_id`, `user_id`, `result_url`, `sourcedid`, `service_id`, `ipaddr`, `grade`, `note`, `server_grade`, `json`, `entity_version`, `created_at`, `updated_at`, `retrieved_at`) VALUES
(1, 1, 1, NULL, 'eba99f886a944318b11234787c1bd636', 5, NULL, NULL, NULL, NULL, NULL, 0, '2017-01-20 09:39:51', '2017-01-20 09:39:51', '2017-01-20 09:39:51'),
(2, 1, 2, NULL, '26e988d4c7312a8b49dfa8deb9faa5ee', 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-03-07 06:26:31', '2017-03-07 06:26:31', '2017-03-07 06:26:31'),
(3, 1, 3, NULL, 'd92dc727b3c069898d06e1f0fec491b1', 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-03-07 06:26:37', '2017-03-07 06:26:37', '2017-03-07 06:26:37'),
(9, 1, 7, NULL, 'a5f216f2d9fe6cdd5ccc41880d5fc19d', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 12:47:38', '2017-04-10 12:47:38', '2017-04-10 12:47:38'),
(10, 1, 8, NULL, '8a65e0c80e8948d535d378fe3105944f', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 12:47:51', '2017-04-10 12:47:51', '2017-04-10 12:47:51'),
(11, 3, 1, NULL, 'fd30ae4b7c1cf74c66ca404a2d60dfd1', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 13:46:52', '2017-04-10 13:46:52', '2017-04-10 13:46:52'),
(12, 3, 2, NULL, '304056a4b093a24c8cc663114012608b', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 15:41:09', '2017-04-10 15:41:09', '2017-04-10 15:41:09'),
(13, 3, 3, NULL, '88641707f970f15a096f49c6219c3fad', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 15:41:17', '2017-04-10 15:41:17', '2017-04-10 15:41:17'),
(14, 3, 7, NULL, '5f9f79ac93f6668a3c7b23e65dd15b67', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 15:42:48', '2017-04-10 15:42:48', '2017-04-10 15:42:48'),
(15, 1, 9, NULL, '97257598d41bbc8e1838e90bbdf2a7b4', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 15:45:35', '2017-04-10 15:45:35', '2017-04-10 15:45:35'),
(16, 4, 9, NULL, 'a3effd658568e6d002c811d8cc2dc0fe', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 16:03:44', '2017-04-10 16:03:44', '2017-04-10 16:03:44'),
(17, 3, 10, NULL, 'aeb45a08f5c3c73dcc5cfdd9683524a6', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 16:16:02', '2017-04-10 16:16:02', '2017-04-10 16:16:02'),
(18, 3, 11, NULL, '5f9f79ac93f6668a3c7b23e65dd15b67', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 16:54:09', '2017-04-10 16:54:09', '2017-04-10 16:54:09'),
(19, 3, 12, NULL, '36ea1191bacc2cc1f0e1c80c2459e739', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 16:54:50', '2017-04-10 16:54:50', '2017-04-10 16:54:50'),
(20, 5, 13, NULL, 'c35c4040e57de343a56d4c44d24b94ed', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 16:57:39', '2017-04-10 16:57:39', '2017-04-10 16:57:39'),
(21, 5, 8, NULL, 'fd5b4b0b6bca3b743b6e403781e0c462', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 17:51:22', '2017-04-10 17:51:22', '2017-04-10 17:51:22'),
(22, 5, 2, NULL, '4c58f7341b7c309d96a4c9bae6df2174', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 17:51:25', '2017-04-10 17:51:25', '2017-04-10 17:51:25'),
(23, 5, 1, NULL, '1bb6fbd849df9a3c64ab91791804c5ed', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-10 17:53:20', '2017-04-10 17:53:20', '2017-04-10 17:53:20'),
(24, 4, 2, NULL, 'ebf3fc7c4f121e883650fffa02ec5432', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-11 07:43:39', '2017-04-11 07:43:39', '2017-04-11 07:43:39'),
(25, 4, 1, NULL, '88cf808c85a351525493769e0032d387', 3, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-11 07:44:04', '2017-04-11 07:44:04', '2017-04-11 07:44:04'),
(26, 6, 14, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-11 10:22:14', '2017-04-11 10:22:14', '2017-04-11 10:22:14'),
(27, 7, 15, NULL, '1bb6fbd849df9a3c64ab91791804c5ed', 4, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-11 12:55:28', '2017-04-11 12:55:28', '2017-04-11 12:55:28'),
(28, 7, 16, NULL, '4c58f7341b7c309d96a4c9bae6df2174', 4, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-11 12:56:47', '2017-04-11 12:56:47', '2017-04-11 12:56:47'),
(29, 8, 17, NULL, '49b91f52e675d4c1c9bc1fbf46cb7cab', 5, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-20 13:50:48', '2017-04-20 13:50:48', '2017-04-20 13:50:48'),
(30, 8, 1, NULL, '2abb328bccd3053cbb55eddcaa20de76', 5, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-20 14:13:04', '2017-04-20 14:13:04', '2017-04-20 14:13:04'),
(31, 8, 2, NULL, '81920cb8df22757e53bcf5ecb17fb1e2', 5, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-20 14:13:19', '2017-04-20 14:13:19', '2017-04-20 14:13:19'),
(32, 8, 8, NULL, '72e4f8d9b93cfbf42ff23d434424483e', 5, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-20 14:13:30', '2017-04-20 14:13:30', '2017-04-20 14:13:30'),
(33, 9, 18, NULL, '{"zap" : "SiÃ¢n JSON 1234 Sourcedid <>&lt;"}', 6, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-03 21:25:04', '2017-07-03 21:25:04', '2017-07-03 21:25:04'),
(34, 10, 19, NULL, 'd92dc727b3c069898d06e1f0fec491b1', 4, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-05 15:04:56', '2017-07-05 15:04:56', '2017-07-05 15:04:56'),
(35, 10, 15, NULL, 'eba99f886a944318b11234787c1bd636', 7, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-05 15:05:11', '2017-07-05 15:05:11', '2017-07-05 15:05:11'),
(36, 10, 16, NULL, '26e988d4c7312a8b49dfa8deb9faa5ee', 7, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-06 09:41:39', '2017-07-06 09:41:39', '2017-07-06 09:41:39'),
(37, 1, 20, NULL, '456434513:292832124:292832126', 8, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-08 12:19:45', '2017-07-08 12:19:45', '2017-07-08 12:19:45'),
(38, 10, 21, NULL, '456434513:292832124:292832126', 9, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-08 12:20:31', '2017-07-08 12:20:31', '2017-07-08 12:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `lti_service`
--

CREATE TABLE `lti_service` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_sha256` char(64) NOT NULL,
  `service_key` text NOT NULL,
  `key_id` int(10) UNSIGNED NOT NULL,
  `format` varchar(1024) DEFAULT NULL,
  `json` text,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_service`
--

INSERT INTO `lti_service` (`service_id`, `service_sha256`, `service_key`, `key_id`, `format`, `json`, `entity_version`, `created_at`, `updated_at`) VALUES
(1, '22ad141bc0e61c84483b6e3c28d7435a0b0568f900a9b73ee6ca1e6b14889f5b', 'http://tsugi.dev/lti/tool_consumer_outcome.php?b64=MTIzNDU6OjpzZWNyZXQ6Ojo=', 1, NULL, NULL, 0, '2017-01-20 09:39:51', '2017-01-20 09:39:51'),
(3, 'c15402f1322a26de3abb0219bb1015b0f8e96e6d5040c1100a94232c0a1be131', 'http://localhost/tsugi/lti/tool_consumer_outcome.php?b64=MTIzNDU6OjpzZWNyZXQ6Ojo=', 1, NULL, NULL, 0, '2017-04-05 13:44:21', '2017-04-05 13:44:21'),
(4, 'dd1b5d072447b554d5c1d9ef619747f32f66f3f2ef2d7db56f0317e91b4b07af', 'http://localhost/tsugi/lti/tool_consumer_outcome.php?b64=dW5pc2E6OjoxMjM0NTo6Og==', 42, NULL, NULL, 0, '2017-04-11 12:55:28', '2017-04-11 12:55:28'),
(5, 'ec8350153953965521e3cbddc747f3d405c1cc46e672b119c3362a812fb96a6a', 'https://dev.unisaonline.net/tsugi/lti/tool_consumer_outcome.php?b64=MTIzNDU6OjpzZWNyZXQ6Ojo=', 1, NULL, NULL, 0, '2017-04-19 08:43:13', '2017-04-19 08:43:13'),
(6, '3a4c4b8b3871a8ac1fc84691112e85c1e12db01673787f2ae089cbc8ffd60193', 'https://online.dr-chuck.com/sakai-api-test/common/tool_consumer_outcome.php?b64=MTIzNDU6OjpzZWNyZXQ6Ojo1OTVhYjYyZjA2Nzk3', 1, NULL, NULL, 0, '2017-07-03 21:25:04', '2017-07-03 21:25:04'),
(7, 'd57b3bcfdc2647ec80131d157e95a2e6f731ac16fdebe1d0ff38df2561e32ac1', 'https://dev.unisaonline.net/tsugi/lti/tool_consumer_outcome.php?b64=dW5pc2E6OjoxMjM0NTo6Og==', 42, NULL, NULL, 0, '2017-07-06 09:02:08', '2017-07-06 09:02:08'),
(8, '1c3926aa705dd6750a0f33ec246ff46da412986def7c1df9b1b4721fc57b91f4', 'https://www.tsugi.org/tsugi/dev/grade?b64=MTIzNDU6OjpzZWNyZXQ6Ojo=', 1, NULL, NULL, 0, '2017-07-08 12:19:45', '2017-07-08 12:19:45'),
(9, 'f5406ef57a816d14537202f07a1e166ba126f94ee4b2feedc903af16a8e0dbf9', 'https://www.tsugi.org/tsugi/dev/grade?b64=dW5pc2E6OjoxMjM0NTo6Og==', 42, NULL, NULL, 0, '2017-07-08 12:20:31', '2017-07-08 12:20:31'),
(10, 'facb8c46b84cbdb6d18b076b401267380b07ce37d881508a7d0b3a151e2f4e22', 'http://localhost/tsugi2/dev/grade?b64=dW5pc2E6OjoxMjM0NTo6Og==', 42, NULL, NULL, 0, '2017-07-14 10:25:48', '2017-07-14 10:25:48'),
(11, '008f12f56e4b21d95fb7755c5e7667b971aef6b6d1bdf8b2f2c42e51d319a8e3', 'http://localhost:81/tsugi/dev/grade?b64=dW5pc2E6OjoxMjM0NTo6Og==', 42, NULL, NULL, 0, '2017-07-14 16:18:12', '2017-07-14 16:18:12'),
(12, '1df671e17233160b6d14d74b67ab789f487767645cb5a163ac490b0d2402b754', 'http://localhost/tsugi/dev/grade?b64=MTIzNDU6OjpzZWNyZXQ6Ojo=', 1, NULL, NULL, 0, '2017-07-19 10:32:03', '2017-07-19 10:32:03'),
(13, '3c75bdaca64a9263988b8e3222b903f64372c18595b71409cabfd9ba82be32cd', 'http://localhost/tsugi/dev/grade?b64=dW5pc2E6OjoxMjM0NTo6Og==', 42, NULL, NULL, 0, '2017-07-26 14:40:37', '2017-07-26 14:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `lti_user`
--

CREATE TABLE `lti_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_sha256` char(64) NOT NULL,
  `user_key` varchar(13) NOT NULL,
  `key_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED DEFAULT NULL,
  `displayname` text,
  `email` text,
  `locale` char(63) DEFAULT NULL,
  `subscribe` smallint(6) DEFAULT NULL,
  `json` text,
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipaddr` varchar(64) DEFAULT NULL,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lti_user`
--

INSERT INTO `lti_user` (`user_id`, `user_sha256`, `user_key`, `key_id`, `profile_id`, `displayname`, `email`, `locale`, `subscribe`, `json`, `login_at`, `ipaddr`, `entity_version`, `created_at`, `updated_at`) VALUES
(1, '92cef4029ac060d448065916b25ead6c273e25114224d01c283fdc2ce250c463', '292832126', 1, NULL, 'Jane Instructor', 'inst@ischool.edu', NULL, NULL, NULL, '2017-01-20 09:39:51', NULL, 0, '2017-01-20 09:39:51', '2017-01-20 09:39:51'),
(2, 'e8167fb16b4a0fb3978449b74ffeb28a3b8d1dd5e25c85436cb452f6a5690161', '998928898', 1, NULL, 'Sue Student', 'student@ischool.edu', NULL, NULL, NULL, '2017-03-07 06:26:31', NULL, 0, '2017-03-07 06:26:31', '2017-03-07 06:26:31'),
(3, 'a7c072f8e9c6eb84b2c5d2b6d4f092e8e982a34945401f67f7da93e8e7283529', '121212331', 1, NULL, 'Ed Student', 'ed@ischool.edu', NULL, NULL, NULL, '2017-03-07 06:26:37', NULL, 0, '2017-03-07 06:26:37', '2017-03-07 06:26:37'),
(8, 'd43403a2c3dae4e4332bf99111e6e066ecda233354d5fa44484dff058e483bb8', '777777777', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2017-04-10 12:47:51', NULL, 0, '2017-04-10 12:47:51', '2017-04-10 12:47:51'),
(11, 'f97b62402266a3de1c158831a5868ac00ba75dc58d142df75078c7416eb3fe60', '2928321267', 1, NULL, 'Peace', 'peacengara@aol.com', NULL, NULL, NULL, '2017-04-10 16:54:09', NULL, 0, '2017-04-10 16:54:09', '2017-04-10 16:54:09'),
(12, 'bff68d1b386d54ee8602ff1a196500f1ec2eb3b9ffffcae9514884c4fd100b94', '29283212628', 1, NULL, 'Runyararo', 'peacengara@aol.com', NULL, NULL, NULL, '2017-04-10 16:54:50', NULL, 0, '2017-04-10 16:54:50', '2017-04-10 16:54:50'),
(13, 'f495bd190c260618cd4f3c7e852a0c0dcad3d8dbd074e118aed196b14d252492', '29283212687', 1, NULL, 'Runyararo', 'runya@yahoo.com', NULL, NULL, NULL, '2017-04-10 16:57:39', NULL, 0, '2017-04-10 16:57:39', '2017-04-10 16:57:39'),
(14, '828171db4aa1985c06fb85e598a285458bf684b66144aec1f574944f7e70ffcb', '1235134', 1, NULL, 'Josh Harington', 'josh1@live.co.za', NULL, NULL, NULL, '2017-04-11 10:22:14', NULL, 0, '2017-04-11 10:22:14', '2017-04-11 10:22:14'),
(15, '92cef4029ac060d448065916b25ead6c273e25114224d01c283fdc2ce250c463', '292832126', 42, NULL, 'Jane Instructor', 'inst@ischool.edu', NULL, NULL, NULL, '2017-04-11 12:55:28', NULL, 0, '2017-04-11 12:55:28', '2017-04-11 12:55:28'),
(16, 'e8167fb16b4a0fb3978449b74ffeb28a3b8d1dd5e25c85436cb452f6a5690161', '998928898', 42, NULL, 'Sue Student', 'student@ischool.edu', NULL, NULL, NULL, '2017-04-11 12:56:47', NULL, 0, '2017-04-11 12:56:47', '2017-04-11 12:56:47'),
(17, 'afc5caccc30408631f34bafec359b58c58dcccaaffa9a857e6aa48abbcc1c926', '29283212633', 1, NULL, 'Benedict Pabazhira', 'benedict.pabazhira@eon.co.za', NULL, NULL, NULL, '2017-04-20 13:50:48', NULL, 0, '2017-04-20 13:50:48', '2017-04-20 13:50:48'),
(18, 'dbc995a94edb58fb6b885d3317f0276446e03b5fb3b403d374e6256ab52d71ef', 'user-0016', 1, NULL, 'SiÃ¢n Instructor', 'sian@imscert.org', NULL, NULL, NULL, '2017-07-03 21:25:03', NULL, 0, '2017-07-03 21:25:03', '2017-07-03 21:25:03'),
(19, 'a7c072f8e9c6eb84b2c5d2b6d4f092e8e982a34945401f67f7da93e8e7283529', '121212331', 42, NULL, 'Ed Student', 'ed@ischool.edu', NULL, NULL, NULL, '2017-07-05 15:04:56', NULL, 0, '2017-07-05 15:04:56', '2017-07-05 15:04:56'),
(20, '30b1bac716afb136d75d36ea157634a24c2884f3ce3e4e433093d3e91446f31e', '292832124', 1, NULL, 'Shylet', 'shyletchawasarira@gmail.com', NULL, NULL, NULL, '2017-07-08 12:19:45', NULL, 0, '2017-07-08 12:19:45', '2017-07-08 12:19:45'),
(21, '30b1bac716afb136d75d36ea157634a24c2884f3ce3e4e433093d3e91446f31e', '292832124', 42, NULL, 'Shylet', 'shyletchawasarira@gmail.com', NULL, NULL, NULL, '2017-07-08 12:20:31', NULL, 0, '2017-07-08 12:20:31', '2017-07-08 12:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `mail_bulk`
--

CREATE TABLE `mail_bulk` (
  `bulk_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `context_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `body` text,
  `json` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mail_sent`
--

CREATE TABLE `mail_sent` (
  `sent_id` int(10) UNSIGNED NOT NULL,
  `context_id` int(10) UNSIGNED NOT NULL,
  `link_id` int(10) UNSIGNED DEFAULT NULL,
  `user_to` int(10) UNSIGNED DEFAULT NULL,
  `user_from` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `body` text,
  `json` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_01_01_000000_RolesPermissionsDB', 2),
(9, '2017_01_17_000000_create_lti_tables', 3),
(10, '2017_01_19_000000_create_tsugi_tables', 3),
(11, '2017_03_07_055520_create_user_l_t_i_links_table', 4),
(12, '2016_12_01_000000_PHPSaasWrapperMigrations', 5),
(13, '2017_03_18_182434_create_courses_table', 6),
(14, '2016_12_01_000000_CreateDummyTables', 7),
(15, '2017_03_20_100136_create_storylines_table', 8),
(16, '2017_03_20_100138_create_storyline_items_table', 8),
(17, '2017_03_20_075834_create_graphs_table', 9),
(18, '2017_03_22_072102_create_course_users_table', 10),
(19, '2017_03_22_074018_create_jobs_table', 10),
(30, '2017_04_16_220118_create_stories_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'UNISA Personal Access Client', 'WXSzhl15Y8Vw8Hq5wh9hPiYDZwMaqIUm5s50b11Y', 'http://localhost', 1, 0, 0, '2017-03-05 16:21:06', '2017-03-05 16:21:06'),
(2, NULL, 'UNISA Password Grant Client', 'bnriNqfRGmY11hr8EuBgIKCuMtRFDipciSRQef2t', 'http://localhost', 0, 1, 0, '2017-03-05 16:21:06', '2017-03-05 16:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-03-05 16:21:06', '2017-03-05 16:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bmmuffy@gmail.com', '$2y$10$AmMwNrEPr7.kj7W7l0JJB.hIfajE.eI4mgdLvjsC.f8oFfz9C6lem', '2017-04-20 11:35:42'),
('michelle.warricke@eon.co.za', '$2y$10$exLZYiS74FEhDdX7pIF9cuKlIAFTMH/rRv75eK6oOVYBpkgT3QAhO', '2017-07-03 09:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(6, 'Edit Page', 'edit-page', '2017-03-08 09:08:53', '2017-03-08 09:08:53'),
(7, 'View Page', 'view-page', '2017-03-08 09:08:56', '2017-03-08 09:08:56'),
(8, 'Create Page', 'create-page', '2017-03-08 09:08:58', '2017-03-08 09:08:58'),
(9, 'Delete Page', 'delete-page', '2017-03-08 09:09:03', '2017-03-08 09:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_group_items`
--

CREATE TABLE `permission_group_items` (
  `permission_group_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(10) UNSIGNED NOT NULL,
  `profile_sha256` char(64) NOT NULL,
  `profile_key` text NOT NULL,
  `key_id` int(10) UNSIGNED NOT NULL,
  `displayname` text,
  `email` text,
  `locale` char(63) DEFAULT NULL,
  `subscribe` smallint(6) DEFAULT NULL,
  `json` text,
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entity_version` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `psw_services_available`
--

CREATE TABLE `psw_services_available` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psw_services_linked`
--

CREATE TABLE `psw_services_linked` (
  `service_link_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'Instructor', 'instructor', '2017-03-08 06:36:33', '2017-03-08 06:36:33'),
(5, 'Learner', 'learner', '2017-03-08 07:40:35', '2017-03-08 07:40:35'),
(6, 'SysAdmin', 'sysadmin', '2017-04-08 20:16:37', '2017-04-08 20:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(4, 6),
(6, 6),
(4, 7),
(5, 7),
(6, 7),
(4, 8),
(6, 8),
(4, 9),
(6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `storyline_id` int(10) UNSIGNED NOT NULL,
  `lft` int(10) DEFAULT NULL,
  `rgt` int(10) DEFAULT NULL,
  `depth` int(10) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` longtext COLLATE utf8mb4_unicode_ci,
  `file_url` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `parent_id`, `storyline_id`, `lft`, `rgt`, `depth`, `title`, `description`, `file_name`, `file_url`, `created_at`, `updated_at`) VALUES
(66, NULL, 46, 131, 132, 0, 'TV & Home Theather', '', 'I am File', 'google.com', '2017-04-17 09:00:05', '2017-04-17 09:00:05'),
(67, NULL, 46, 133, 134, 0, 'Tablets & E-Readers', '', 'I am File', 'google.com', '2017-04-17 09:00:05', '2017-04-17 09:00:06'),
(68, NULL, 46, 135, 152, 0, 'Computers', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(69, 68, 46, 136, 141, 1, 'Laptops', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(70, 69, 46, 137, 138, 2, 'PC Laptops', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(71, 69, 46, 139, 140, 2, 'Macbooks (Air/Pro)', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(72, 68, 46, 142, 151, 1, 'Desktops', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(73, 72, 46, 143, 144, 2, 'Towers Only', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(74, 72, 46, 145, 146, 2, 'Desktop Packages', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(75, 72, 46, 147, 148, 2, 'All-in-One Computers', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(76, 72, 46, 149, 150, 2, 'Gaming Desktops', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(77, NULL, 46, 153, 154, 0, 'Cell Phones', '', 'I am File', 'google.com', '2017-04-17 09:00:06', '2017-04-17 09:00:06'),
(78, NULL, 46, 155, 156, 0, 'Group', NULL, NULL, NULL, '2017-04-17 09:00:06', '2017-04-17 09:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `storylines`
--

CREATE TABLE `storylines` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storylines`
--

INSERT INTO `storylines` (`id`, `course_id`, `creator_id`, `version`, `created_at`, `updated_at`) VALUES
(47, 14, 1, NULL, '2017-04-18 13:01:19', '2017-04-18 13:01:19'),
(55, 16, 1, NULL, '2017-04-19 12:01:07', '2017-04-19 12:01:07'),
(56, 17, 1, NULL, '2017-04-25 09:16:24', '2017-04-25 09:16:24'),
(57, 17, 1, NULL, '2017-04-25 09:16:52', '2017-04-25 09:16:52'),
(58, 17, 1, NULL, '2017-04-25 09:17:10', '2017-04-25 09:17:10'),
(59, 17, 1, NULL, '2017-04-25 09:17:16', '2017-04-25 09:17:16'),
(60, 17, 1, NULL, '2017-04-25 09:17:19', '2017-04-25 09:17:19'),
(61, 19, 1, NULL, '2017-04-26 06:31:27', '2017-04-26 06:31:27'),
(62, 19, 1, NULL, '2017-04-26 06:35:00', '2017-04-26 06:35:00'),
(63, 19, 1, NULL, '2017-04-26 06:36:32', '2017-04-26 06:36:32'),
(64, 19, 1, NULL, '2017-04-26 06:36:54', '2017-04-26 06:36:54'),
(70, 25, 1, NULL, '2017-05-12 07:35:50', '2017-05-12 07:35:50'),
(71, 26, 1, NULL, '2017-07-05 12:06:11', '2017-07-05 12:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `storyline_items`
--

CREATE TABLE `storyline_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `storyline_id` int(10) UNSIGNED NOT NULL,
  `root_parent` int(10) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  `_lft` int(10) NOT NULL,
  `_rgt` int(10) NOT NULL,
  `previous` int(10) DEFAULT NULL,
  `next` int(10) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topics` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_url` longtext COLLATE utf8mb4_unicode_ci,
  `file_name` longtext COLLATE utf8mb4_unicode_ci,
  `page_trail` text COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `names` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_url_backup` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storyline_items`
--

INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(20, 468, 47, 388, 4, 461, 462, 222, 224, 223, '', 'Equation', 'Functions and Representations of Functions', '', 'temp/FBN1502/20.html', '20.html', '388,155,468,20', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics/equation'),
(22, 468, 47, 388, 4, 463, 464, 223, 225, 224, '', 'Values of a and b ', 'Functions and Representations of Functions', '', 'temp/FBN1502/22.html', '22.html', '388,155,468,22', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics/values-of-a-and-b'),
(23, 468, 47, 388, 4, 465, 466, 224, 226, 225, '', 'y-intercept', 'Functions and Representations of Functions', '', 'temp/FBN1502/23.html', '23.html', '388,155,468,23', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics/y-intercept'),
(24, 468, 47, 388, 4, 467, 468, 225, 227, 226, '', 'x-intercept', 'Functions and Representations of Functions', '', 'temp/FBN1502/24.html', '24.html', '388,155,468,24', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics/x-intercept'),
(25, 468, 47, 388, 4, 469, 470, 226, 228, 227, '', 'Recap', 'Functions and Representations of Functions', '', 'temp/FBN1502/25.html', '25.html', '388,155,468,25', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics/recap'),
(27, 470, 47, 388, 4, 475, 476, 229, 231, 230, '', 'Two points', 'Functions and Representations of Functions', '', 'temp/FBN1502/27.html', '27.html', '388,155,470,27', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/draw-the-graph/two-points'),
(29, 470, 47, 388, 4, 477, 478, 230, 232, 231, '', 'Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/29.html', '29.html', '388,155,470,29', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/draw-the-graph/video'),
(31, 475, 47, 388, 4, 483, 484, 233, 235, 234, '', 'Definition - Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/31.html', '31.html', '388,155,475,31', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope/definition---video'),
(32, 475, 47, 388, 4, 485, 486, 234, 236, 235, '', 'Ratio of change - Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/32.html', '32.html', '388,155,475,32', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope/ratio-of-change---video'),
(33, 475, 47, 388, 4, 487, 488, 235, 237, 236, '', 'Negative slope - Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/33.html', '33.html', '388,155,475,33', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope/negative-slope---video'),
(34, 475, 47, 388, 4, 489, 490, 236, 238, 237, '', 'Recap', 'Functions and Representations of Functions', '', 'temp/FBN1502/34.html', '34.html', '388,155,475,34', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope/recap'),
(39, 155, 47, 388, 3, 454, 455, 261, 263, 262, '', 'Summary', 'Functions and Representations of Functions', '', 'temp/FBN1502/39.html', '39.html', '388,155,39', 11, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/summary'),
(40, 490, 47, 388, 4, 539, 540, 263, 265, 264, '', 'Instructions', 'Functions and Representations of Functions', '', 'temp/FBN1502/40.html', '40.html', '388,155,490,40', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/exercise/instructions'),
(43, 478, 47, 388, 4, 497, 498, 240, 242, 241, '', 'Two points', 'Functions and Representations of Functions', '', 'temp/FBN1502/43.html', '43.html', '388,155,478,43', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/determine-equation/two-points'),
(44, 478, 47, 388, 4, 499, 500, 242, 244, 243, '', 'Word problems', 'Functions and Representations of Functions', '', 'temp/FBN1502/44.html', '44.html', '388,155,478,44', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/determine-equation/word-problems'),
(49, 483, 47, 388, 4, 507, 508, 246, 248, 247, '', 'Example', 'Functions and Representations of Functions', '', 'temp/FBN1502/49.html', '49.html', '388,155,483,49', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-b-0/example'),
(50, 483, 47, 388, 4, 509, 510, 247, 249, 248, '', 'Recap', 'Functions and Representations of Functions', '', 'temp/FBN1502/50.html', '50.html', '388,155,483,50', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-b-0/recap'),
(52, 485, 47, 388, 4, 517, 518, 250, 252, 251, '', 'Horizontal', 'Functions and Representations of Functions', '', 'temp/FBN1502/52.html', '52.html', '388,155,485,52', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-a-0/horizontal'),
(53, 483, 47, 388, 4, 511, 512, 245, 247, 246, '', 'Through origin', 'Functions and Representations of Functions', '', 'temp/FBN1502/53.html', '53.html', '388,155,483,53', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-b-0/through-origin'),
(56, 485, 47, 388, 4, 519, 520, 251, 253, 252, '', 'Examples', 'Functions and Representations of Functions', '', 'temp/FBN1502/56.html', '56.html', '388,155,485,56', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-a-0/examples'),
(57, 485, 47, 388, 4, 521, 522, 252, 254, 253, '', 'Slope', 'Functions and Representations of Functions', '', 'temp/FBN1502/57.html', '57.html', '388,155,485,57', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-a-0/slope'),
(59, 487, 47, 388, 4, 527, 528, 255, 257, 256, '', 'Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/59.html', '59.html', '388,155,487,59', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-parallel-to-y-axis/video'),
(60, 487, 47, 388, 4, 529, 530, 256, 258, 257, '', 'Examples', 'Functions and Representations of Functions', '', 'temp/FBN1502/60.html', '60.html', '388,155,487,60', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-parallel-to-y-axis/examples'),
(61, 487, 47, 388, 4, 531, 532, 257, 259, 258, '', 'Slope', 'Functions and Representations of Functions', '', 'temp/FBN1502/61.html', '61.html', '388,155,487,61', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-parallel-to-y-axis/slope'),
(63, 155, 47, 388, 3, 456, 457, 259, 261, 260, '', 'Special case: Parallel lines', 'Functions and Representations of Functions', '', 'temp/FBN1502/63.html', '63.html', '388,155,63', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-parallel-lines'),
(67, 156, 47, 156, 2, 3, 4, -1, 1, 0, '', 'Unlock_all_pages', 'Linear Systems', '', 'temp/FBN1502/67.html', '67.html', '156,67', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages/unlock_all_pages'),
(68, 156, 47, 156, 2, 5, 6, -1, 1, 0, '', 'Lock_all_pages', '', '', 'temp/FBN1502/68.html', '68.html', '156,68', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages/lock_all_pages'),
(80, 151, 47, 387, 3, 22, 23, 153, 155, 154, '', 'Introduction', 'Mathematics of Finance', '', 'temp/FBN1502/80.html', '80.html', '387,151,80', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/introduction'),
(81, 447, 47, 387, 4, 45, 46, 165, 167, 166, '', 'Period and payments', 'Mathematics of Finance', '', 'temp/FBN1502/81.html', '81.html', '387,151,447,81', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/period-and-payments/period-and-payments'),
(82, 514, 47, 388, 4, 557, 558, 310, 312, 311, '', 'Equation', 'Functions and Representations of Functions', '', 'temp/FBN1502/82.html', '82.html', '388,157,514,82', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/equation'),
(84, 445, 47, 387, 4, 31, 32, 155, 157, 156, '', 'Video', 'Mathematics of Finance', '', 'temp/FBN1502/84.html', '84.html', '387,151,445,84', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/calculate-payments-r/video'),
(86, 445, 47, 387, 4, 33, 34, 156, 158, 157, '', 'Formula', 'Mathematics of Finance', '', 'temp/FBN1502/86.html', '86.html', '387,151,445,86', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/calculate-payments-r/formula'),
(87, 446, 47, 387, 4, 39, 40, 159, 161, 160, '', 'SHARP', 'Mathematics of Finance', '', 'temp/FBN1502/87.html', '87.html', '387,151,446,87', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/the-amortisation-schedule/sharp'),
(88, 446, 47, 387, 4, 41, 42, 160, 162, 161, '', 'Recap', 'Mathematics of Finance', '', 'temp/FBN1502/88.html', '88.html', '387,151,446,88', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/the-amortisation-schedule/recap'),
(89, 151, 47, 387, 3, 24, 25, 166, 168, 167, '', 'Present value (P)', 'Mathematics of Finance', '', 'temp/FBN1502/89.html', '89.html', '387,151,89', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/present-value-p'),
(90, 448, 47, 387, 4, 55, 56, 168, 170, 169, '', 'Fixed or variable?', 'Mathematics of Finance', '', 'temp/FBN1502/90.html', '90.html', '387,151,448,90', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/interest-rate-i/fixed-or-variable'),
(91, 448, 47, 387, 4, 57, 58, 169, 171, 170, '', 'Video - Part A', 'Mathematics of Finance', '', 'temp/FBN1502/91.html', '91.html', '387,151,448,91', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/interest-rate-i/video---part-a'),
(92, 448, 47, 387, 4, 59, 60, 170, 172, 171, '', 'Video - Part B', 'Mathematics of Finance', '', 'temp/FBN1502/92.html', '92.html', '387,151,448,92', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/interest-rate-i/video---part-b'),
(93, 151, 47, 387, 3, 26, 27, 172, 174, 173, '', 'Summary', 'Mathematics of Finance', '', 'temp/FBN1502/93.html', '93.html', '387,151,93', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/summary'),
(94, 449, 47, 387, 4, 65, 66, 174, 176, 175, '', 'Instructions', 'Mathematics of Finance', '', 'temp/FBN1502/94.html', '94.html', '387,151,449,94', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/exercise/instructions'),
(95, 450, 47, 387, 4, 71, 72, 177, 179, 178, '', 'Information', 'Mathematics of Finance', '', 'temp/FBN1502/95.html', '95.html', '387,151,450,95', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/assignment/information'),
(97, 152, 47, 387, 3, 78, 79, 124, 126, 125, '', 'Definition', 'Mathematics of Finance', '', 'temp/FBN1502/97.html', '97.html', '387,152,97', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/definition'),
(98, 431, 47, 387, 4, 83, 84, 126, 128, 127, '', 'Ordinary annuity and annuity due', 'Mathematics of Finance', '', 'temp/FBN1502/98.html', '98.html', '387,152,431,98', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/types/ordinary-annuity-and-annuity-due'),
(99, 431, 47, 387, 4, 85, 86, 127, 129, 128, '', 'Annuity certain and perpetuity', 'Mathematics of Finance', '', 'temp/FBN1502/99.html', '99.html', '387,152,431,99', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/types/annuity-certain-and-perpetuity'),
(100, 431, 47, 387, 4, 87, 88, 128, 130, 129, '', 'Examples', 'Mathematics of Finance', '', 'temp/FBN1502/100.html', '100.html', '387,152,431,100', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/types/examples'),
(101, 432, 47, 387, 4, 91, 92, 130, 132, 131, '', 'Video', 'Mathematics of Finance', '', 'temp/FBN1502/101.html', '101.html', '387,152,432,101', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/future-value-s/video'),
(102, 432, 47, 387, 4, 93, 94, 131, 133, 132, '', 'Formula', 'Mathematics of Finance', '', 'temp/FBN1502/102.html', '102.html', '387,152,432,102', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/future-value-s/formula'),
(103, 432, 47, 387, 4, 95, 96, 132, 134, 133, '', 'Calculate S and R', 'Mathematics of Finance', '', 'temp/FBN1502/103.html', '103.html', '387,152,432,103', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/future-value-s/calculate-s-and-r'),
(104, 433, 47, 387, 4, 103, 104, 136, 138, 137, '', 'Video', 'Mathematics of Finance', '', 'temp/FBN1502/104.html', '104.html', '387,152,433,104', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/present-value-p/video'),
(105, 433, 47, 387, 4, 105, 106, 137, 139, 138, '', 'Formula', 'Mathematics of Finance', '', 'temp/FBN1502/105.html', '105.html', '387,152,433,105', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/present-value-p/formula'),
(106, 433, 47, 387, 4, 107, 108, 138, 140, 139, '', 'Calculate P and R', 'Mathematics of Finance', '', 'temp/FBN1502/106.html', '106.html', '387,152,433,106', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/present-value-p/calculate-p-and-r'),
(107, 434, 47, 387, 4, 115, 116, 142, 144, 143, '', 'Specific cases', 'Mathematics of Finance', '', 'temp/FBN1502/107.html', '107.html', '387,152,434,107', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/relationship-between-p-and-s/specific-cases'),
(108, 434, 47, 387, 4, 117, 118, 143, 145, 144, '', 'Relationship between formulas', 'Mathematics of Finance', '', 'temp/FBN1502/108.html', '108.html', '387,152,434,108', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/relationship-between-p-and-s/relationship-between-formulas'),
(109, 152, 47, 387, 3, 80, 81, 144, 146, 145, '', 'Summary', 'Mathematics of Finance', '', 'temp/FBN1502/109.html', '109.html', '387,152,109', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/summary'),
(111, 435, 47, 387, 4, 121, 122, 146, 148, 147, '', 'Instructions', 'Mathematics of Finance', '', 'temp/FBN1502/111.html', '111.html', '387,152,435,111', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/exercise/instructions'),
(112, 436, 47, 387, 4, 127, 128, 149, 151, 150, '', 'Information', 'Mathematics of Finance', '', 'temp/FBN1502/112.html', '112.html', '387,152,436,112', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/assignment/information'),
(114, 417, 47, 387, 4, 141, 142, 62, 64, 63, '', 'Introduction', 'Mathematics of Finance', '', 'temp/FBN1502/114.html', '114.html', '387,153,417,114', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/simple-and-compound-interest/introduction'),
(115, 417, 47, 387, 4, 143, 144, 63, 65, 64, '', 'Example', 'Mathematics of Finance', '', 'temp/FBN1502/115.html', '115.html', '387,153,417,115', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/simple-and-compound-interest/example'),
(116, 417, 47, 387, 4, 145, 146, 64, 66, 65, '', 'Simple interest amount', 'Mathematics of Finance', '', 'temp/FBN1502/116.html', '116.html', '387,153,417,116', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/simple-and-compound-interest/simple-interest-amount'),
(117, 417, 47, 387, 4, 147, 148, 65, 67, 66, '', 'Compound interest amount', 'Mathematics of Finance', '', 'temp/FBN1502/117.html', '117.html', '387,153,417,117', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/simple-and-compound-interest/compound-interest-amount'),
(118, 418, 47, 387, 4, 151, 152, 69, 71, 70, '', 'How it works 2', 'Mathematics of Finance', '', 'temp/FBN1502/118.html', '118.html', '387,153,418,118', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/how-it-works/how-it-works-2'),
(119, 419, 47, 387, 4, 159, 160, 71, 73, 72, '', 'Formula', 'Mathematics of Finance', '', 'temp/FBN1502/119.html', '119.html', '387,153,419,119', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-s/formula'),
(120, 419, 47, 387, 4, 161, 162, 72, 74, 73, '', 'Example', 'Mathematics of Finance', '', 'temp/FBN1502/120.html', '120.html', '387,153,419,120', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-s/example'),
(121, 420, 47, 387, 4, 167, 168, 75, 77, 76, '', 'Compounding periods', 'Mathematics of Finance', '', 'temp/FBN1502/121.html', '121.html', '387,153,420,121', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/compounding-periods'),
(122, 420, 47, 387, 4, 169, 170, 76, 78, 77, '', 'Semi-annually', 'Mathematics of Finance', '', 'temp/FBN1502/122.html', '122.html', '387,153,420,122', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/semi-annually'),
(123, 420, 47, 387, 4, 171, 172, 77, 79, 78, '', 'Yearly', 'Mathematics of Finance', '', 'temp/FBN1502/123.html', '123.html', '387,153,420,123', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/yearly'),
(124, 420, 47, 387, 4, 173, 174, 78, 80, 79, '', 'Quarterly and monthly', 'Mathematics of Finance', '', 'temp/FBN1502/124.html', '124.html', '387,153,420,124', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/quarterly-and-monthly'),
(125, 420, 47, 387, 4, 175, 176, 79, 81, 80, '', 'All together', 'Mathematics of Finance', '', 'temp/FBN1502/125.html', '125.html', '387,153,420,125', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/all-together'),
(126, 421, 47, 387, 4, 185, 186, 84, 86, 85, '', 'Calculate P', 'Mathematics of Finance', '', 'temp/FBN1502/126.html', '126.html', '387,153,421,126', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-p/calculate-p'),
(127, 422, 47, 387, 4, 191, 192, 87, 89, 88, '', 'Calculate n and i', 'Mathematics of Finance', '', 'temp/FBN1502/127.html', '127.html', '387,153,422,127', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-n-and-i/calculate-n-and-i'),
(128, 153, 47, 387, 3, 136, 137, 90, 92, 91, '', 'Summary', '', '', 'temp/FBN1502/128.html', '128.html', '387,153,128', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/summary'),
(129, 423, 47, 387, 4, 199, 200, 92, 94, 93, '', 'Instructions', 'Mathematics of Finance', '', 'temp/FBN1502/129.html', '129.html', '387,153,423,129', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/exercise/instructions'),
(130, 424, 47, 387, 4, 205, 206, 95, 97, 96, '', 'Information', 'Mathematics of Finance', '', 'temp/FBN1502/130.html', '130.html', '387,153,424,130', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/assignment/information'),
(132, 452, 47, 388, 4, 383, 384, 190, 192, 191, '', 'Variable', 'Functions and Representations of Functions', '', 'temp/FBN1502/132.html', '132.html', '388,154,452,132', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/variables/variable'),
(133, 452, 47, 388, 4, 385, 386, 191, 193, 192, '', 'Mathematical expressions', 'Functions and Representations of Functions', '', 'temp/FBN1502/133.html', '133.html', '388,154,452,133', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/variables/mathematical-expressions'),
(134, 452, 47, 388, 4, 387, 388, 192, 194, 193, '', 'Variables in expressions', 'Functions and Representations of Functions', '', 'temp/FBN1502/134.html', '134.html', '388,154,452,134', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/variables/variables-in-expressions'),
(135, 452, 47, 388, 4, 389, 390, 193, 195, 194, '', 'Variables in formulas', 'Functions and Representations of Functions', '', 'temp/FBN1502/135.html', '135.html', '388,154,452,135', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/variables/variables-in-formulas'),
(136, 453, 47, 388, 4, 393, 394, 183, 185, 184, '', 'Definition', 'Functions and Representations of Functions', '', 'temp/FBN1502/136.html', '136.html', '388,154,453,136', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula/definition'),
(137, 453, 47, 388, 4, 395, 396, 184, 186, 185, '', 'Advantage', 'Functions and Representations of Functions', '', 'temp/FBN1502/137.html', '137.html', '388,154,453,137', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula/advantage'),
(138, 453, 47, 388, 4, 397, 398, 185, 187, 186, '', 'Dependance', 'Functions and Representations of Functions', '', 'temp/FBN1502/138.html', '138.html', '388,154,453,138', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula/dependance'),
(141, 457, 47, 388, 4, 407, 408, 195, 197, 196, '', 'Concept', 'Functions and Representations of Functions', '', 'temp/FBN1502/141.html', '141.html', '388,154,457,141', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function/concept'),
(142, 457, 47, 388, 4, 409, 410, 196, 198, 197, '', 'Name', 'Functions and Representations of Functions', '', 'temp/FBN1502/142.html', '142.html', '388,154,457,142', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function/name'),
(143, 457, 47, 388, 4, 411, 412, 197, 199, 198, '', 'Examples', 'Functions and Representations of Functions', '', 'temp/FBN1502/143.html', '143.html', '388,154,457,143', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function/examples'),
(144, 457, 47, 388, 4, 413, 414, 198, 200, 199, '', 'A function', 'Functions and Representations of Functions', '', 'temp/FBN1502/144.html', '144.html', '388,154,457,144', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function/a-function'),
(145, 457, 47, 388, 4, 415, 416, 199, 201, 200, '', 'Not a function', 'Functions and Representations of Functions', '', 'temp/FBN1502/145.html', '145.html', '388,154,457,145', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function/not-a-function'),
(146, 457, 47, 388, 4, 417, 418, 200, 202, 201, '', 'Independent variables', 'Functions and Representations of Functions', '', 'temp/FBN1502/146.html', '146.html', '388,154,457,146', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function/independent-variables'),
(147, 458, 47, 388, 4, 421, 422, 202, 204, 203, '', 'Notation', 'Functions and Representations of Functions', '', 'temp/FBN1502/147.html', '147.html', '388,154,458,147', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function-notation/notation'),
(148, 458, 47, 388, 4, 423, 424, 203, 205, 204, '', 'Example', 'Functions and Representations of Functions', '', 'temp/FBN1502/148.html', '148.html', '388,154,458,148', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function-notation/example'),
(149, 154, 47, 388, 3, 376, 377, 205, 207, 206, '', 'Graphing functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/149.html', '149.html', '388,154,149', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/graphing-functions'),
(150, 460, 47, 388, 4, 429, 430, 207, 209, 208, '', 'Introduction', 'Functions and Representations of Functions', '', 'temp/FBN1502/150.html', '150.html', '388,154,460,150', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/the-cartesian-plane/introduction'),
(151, 387, 47, 387, 2, 21, 76, 151, 153, 152, '', 'Amortisation', 'Mathematics of Finance', '', 'temp/FBN1502/151.html', '151.html', '387,151', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation'),
(152, 387, 47, 387, 2, 77, 134, 122, 124, 123, '', 'Annuities', 'Mathematics of Finance', '', 'temp/FBN1502/152.html', '152.html', '387,152', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities'),
(153, 387, 47, 387, 2, 135, 210, 59, 61, 60, '', 'Compound interest', 'Mathematics of Finance', '', 'temp/FBN1502/153.html', '153.html', '387,153', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest'),
(154, 388, 47, 388, 2, 375, 452, 180, 182, 181, '', 'Definition of functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/154.html', '154.html', '388,154', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions'),
(155, 388, 47, 388, 2, 453, 550, 219, 221, 220, '', 'Linear functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/155.html', '155.html', '388,155', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions'),
(156, 616, 47, 0, 1, 2, 15, -1, 1, 0, '', 'OTHER &amp; TEST PAGES', '', '', 'temp/FBN1502/156.html', '156.html', '156', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages'),
(157, 388, 47, 388, 2, 551, 604, 306, 308, 307, '', 'Exponential and logarithmic functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/157.html', '157.html', '388,157', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions'),
(158, 388, 47, 388, 2, 605, 680, 268, 270, 269, '', 'Quadratic functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/158.html', '158.html', '388,158', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions'),
(162, 389, 47, 389, 2, 683, 726, 334, 336, 335, '', 'Linear equations in one variable', 'Linear Systems', '', 'temp/FBN1502/162.html', '162.html', '389,162', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable'),
(163, 389, 47, 389, 2, 727, 780, 356, 358, 357, '', 'Systems of linear equations in two variables', 'Linear Systems', '', 'temp/FBN1502/163.html', '163.html', '389,163', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables'),
(166, 389, 47, 389, 2, 781, 834, 383, 385, 384, '', 'Linear inequalities in one variable', 'Linear Systems', '', 'temp/FBN1502/166.html', '166.html', '389,166', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable'),
(167, 389, 47, 389, 2, 835, 888, 410, 412, 411, '', 'Systems of linear inequalities in two variables', 'Linear Systems', '', 'temp/FBN1502/167.html', '167.html', '389,167', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables'),
(169, 390, 47, 390, 2, 891, 962, 438, 440, 439, '', 'Marginal cost', 'An Application of Differentiation', '', 'temp/FBN1502/169.html', '169.html', '390,169', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost'),
(171, 390, 47, 390, 2, 963, 1004, 474, 476, 475, '', 'Marginal profit', 'An Application of Differentiation', '', 'temp/FBN1502/171.html', '171.html', '390,171', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit'),
(173, 387, 47, 387, 2, 211, 252, 38, 40, 39, '', 'Simple discount', 'Mathematics of Finance', '', 'temp/FBN1502/173.html', '173.html', '387,173', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount'),
(176, 387, 47, 387, 2, 253, 322, 3, 5, 4, '', 'Simple interest', 'Mathematics of Finance', '', 'temp/FBN1502/176.html', '176.html', '387,176', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest'),
(177, 387, 47, 387, 2, 323, 372, 97, 99, 98, '', 'Time value of money', 'Mathematics of Finance', '', 'temp/FBN1502/177.html', '177.html', '387,177', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money'),
(179, 463, 47, 388, 4, 441, 442, 214, 216, 215, '', 'Instructions', 'Functions and Representations of Functions', '', 'temp/FBN1502/179.html', '179.html', '388,154,463,179', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/exercise/instructions'),
(180, 509, 47, 388, 4, 669, 670, 301, 303, 302, '', 'Instructions', 'Functions and Representations of Functions', '', 'temp/FBN1502/180.html', '180.html', '388,158,509,180', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/exercise/instructions'),
(181, 520, 47, 388, 4, 593, 594, 328, 330, 329, '', 'Instructions', 'Functions and Representations of Functions', '', 'temp/FBN1502/181.html', '181.html', '388,157,520,181', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exercise/instructions'),
(182, 532, 47, 389, 4, 715, 716, 351, 353, 352, '', 'Instructions', 'Linear Systems', '', 'temp/FBN1502/182.html', '182.html', '389,162,532,182', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/exercise/instructions'),
(183, 547, 47, 389, 4, 769, 770, 378, 380, 379, '', 'Instructions', 'Linear Systems', '', 'temp/FBN1502/183.html', '183.html', '389,163,547,183', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/exercise/instructions'),
(184, 559, 47, 389, 4, 823, 824, 405, 407, 406, '', 'Instructions', 'Linear Systems', '', 'temp/FBN1502/184.html', '184.html', '389,166,559,184', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/exercise/instructions'),
(185, 577, 47, 389, 4, 877, 878, 432, 434, 433, '', 'Instructions', 'Linear Systems', '', 'temp/FBN1502/185.html', '185.html', '389,167,577,185', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/exercise/instructions'),
(186, 594, 47, 390, 4, 951, 952, 469, 471, 470, '', 'Instructions', 'An Application of Differentiation', '', 'temp/FBN1502/186.html', '186.html', '390,169,594,186', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/exercise/instructions'),
(187, 606, 47, 390, 4, 993, 994, 490, 492, 491, '', 'Instructions', 'An Application of Differentiation', '', 'temp/FBN1502/187.html', '187.html', '390,171,606,187', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/exercise/instructions'),
(188, 414, 47, 387, 4, 241, 242, 54, 56, 55, '', 'Instructions', 'Mathematics of Finance', '', 'temp/FBN1502/188.html', '188.html', '387,173,414,188', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/exercise/instructions'),
(189, 408, 47, 387, 4, 311, 312, 33, 35, 34, '', 'Instructions', 'Mathematics of Finance', '', 'temp/FBN1502/189.html', '189.html', '387,176,408,189', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/exercise/instructions'),
(190, 429, 47, 387, 4, 361, 362, 117, 119, 118, '', 'Instructions', 'Mathematics of Finance', '', 'temp/FBN1502/190.html', '190.html', '387,177,429,190', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/exercise/instructions'),
(191, 465, 47, 388, 4, 447, 448, 217, 219, 218, '', 'Information', 'Functions and Representations of Functions', '', 'temp/FBN1502/191.html', '191.html', '388,154,465,191', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/assignment/information'),
(192, 492, 47, 388, 4, 545, 546, 266, 268, 267, '', 'Information', 'Functions and Representations of Functions', '', 'temp/FBN1502/192.html', '192.html', '388,155,492,192', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/assignment/information'),
(193, 511, 47, 388, 4, 675, 676, 304, 306, 305, '', 'Information', 'Functions and Representations of Functions', '', 'temp/FBN1502/193.html', '193.html', '388,158,511,193', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/assignment/information'),
(194, 522, 47, 388, 4, 599, 600, 331, 333, 332, '', 'Information', 'Functions and Representations of Functions', '', 'temp/FBN1502/194.html', '194.html', '388,157,522,194', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/assignment/information'),
(195, 534, 47, 389, 4, 721, 722, 354, 356, 355, '', 'Information', 'Linear Systems', '', 'temp/FBN1502/195.html', '195.html', '389,162,534,195', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/assignment/information'),
(196, 549, 47, 389, 4, 775, 776, 381, 383, 382, '', 'Information', 'Linear Systems', '', 'temp/FBN1502/196.html', '196.html', '389,163,549,196', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/assignment/information'),
(197, 560, 47, 389, 4, 829, 830, 408, 410, 409, '', 'Information', 'Linear Systems', '', 'temp/FBN1502/197.html', '197.html', '389,166,560,197', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/assignment/information'),
(198, 579, 47, 389, 4, 883, 884, 435, 437, 436, '', 'Information', 'Linear Systems', '', 'temp/FBN1502/198.html', '198.html', '389,167,579,198', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/assignment/information'),
(199, 596, 47, 390, 4, 957, 958, 472, 474, 473, '', 'Information', 'An Application of Differentiation', '', 'temp/FBN1502/199.html', '199.html', '390,169,596,199', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/assignment/information'),
(200, 608, 47, 390, 4, 999, 1000, 493, 495, 494, '', 'Information', 'An Application of Differentiation', '', 'temp/FBN1502/200.html', '200.html', '390,171,608,200', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/assignment/information'),
(201, 415, 47, 387, 4, 247, 248, 57, 59, 58, '', 'Information', 'Mathematics of Finance', '', 'temp/FBN1502/201.html', '201.html', '387,173,415,201', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/assignment/information'),
(202, 409, 47, 387, 4, 317, 318, 36, 38, 37, '', 'Information', 'Mathematics of Finance', '', 'temp/FBN1502/202.html', '202.html', '387,176,409,202', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/assignment/information'),
(203, 430, 47, 387, 4, 367, 368, 120, 122, 121, '', 'Information', 'Mathematics of Finance', '', 'temp/FBN1502/203.html', '203.html', '387,177,430,203', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/assignment/information'),
(204, 177, 47, 387, 3, 324, 325, 115, 117, 116, '', 'Summary', 'Mathematics of Finance', '', 'temp/FBN1502/204.html', '204.html', '387,177,204', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/summary'),
(205, 176, 47, 387, 3, 254, 255, 31, 33, 32, '', 'Summary', '', '', 'temp/FBN1502/205.html', '205.html', '387,176,205', 14, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/summary'),
(206, 173, 47, 387, 3, 212, 213, 52, 54, 53, '', 'Summary', '', '', 'temp/FBN1502/206.html', '206.html', '387,173,206', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/summary'),
(207, 171, 47, 390, 3, 964, 965, 488, 490, 489, '', 'Summary', 'An Application of Differentiation', '', 'temp/FBN1502/207.html', '207.html', '390,171,207', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/summary'),
(208, 169, 47, 390, 3, 892, 893, 467, 469, 468, '', 'Summary', 'An Application of Differentiation', '', 'temp/FBN1502/208.html', '208.html', '390,169,208', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/summary'),
(209, 167, 47, 389, 3, 836, 837, 430, 432, 431, '', 'Summary', 'Linear Systems', '', 'temp/FBN1502/209.html', '209.html', '389,167,209', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/summary'),
(210, 166, 47, 389, 3, 782, 783, 403, 405, 404, '', 'Summary', 'Linear Systems', '', 'temp/FBN1502/210.html', '210.html', '389,166,210', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/summary'),
(211, 163, 47, 389, 3, 728, 729, 376, 378, 377, '', 'Summary', 'Linear Systems', '', 'temp/FBN1502/211.html', '211.html', '389,163,211', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/summary'),
(212, 162, 47, 389, 3, 684, 685, 349, 351, 350, '', 'Summary', 'Linear Systems', '', 'temp/FBN1502/212.html', '212.html', '389,162,212', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/summary'),
(213, 157, 47, 388, 3, 552, 553, 326, 328, 327, '', 'Summary', 'Functions and Representations of Functions', '', 'temp/FBN1502/213.html', '213.html', '388,157,213', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/summary'),
(214, 158, 47, 388, 3, 606, 607, 299, 301, 300, '', 'Summary', 'Functions and Representations of Functions', '', 'temp/FBN1502/214.html', '214.html', '388,158,214', 11, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/summary'),
(215, 460, 47, 388, 4, 431, 432, 208, 210, 209, '', 'Axes', 'Functions and Representations of Functions', '', 'temp/FBN1502/215.html', '215.html', '388,154,460,215', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/the-cartesian-plane/axes'),
(217, 460, 47, 388, 4, 433, 434, 210, 212, 211, '', 'Quadrants', 'Functions and Representations of Functions', '', 'temp/FBN1502/217.html', '217.html', '388,154,460,217', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/the-cartesian-plane/quadrants'),
(219, 154, 47, 388, 3, 378, 379, 212, 214, 213, '', 'Summary', 'Functions and Representations of Functions', '', 'temp/FBN1502/219.html', '219.html', '388,154,219', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/summary'),
(220, 495, 47, 388, 4, 613, 614, 271, 273, 272, '', 'Practical applications', 'Functions and Representations of Functions', '', 'temp/FBN1502/220.html', '220.html', '388,158,495,220', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/introduction/practical-applications'),
(221, 495, 47, 388, 4, 615, 616, 272, 274, 273, '', 'Projectile motion', 'Functions and Representations of Functions', '', 'temp/FBN1502/221.html', '221.html', '388,158,495,221', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/introduction/projectile-motion'),
(222, 496, 47, 388, 4, 619, 620, 274, 276, 275, '', 'Equation', 'Functions and Representations of Functions', '', 'temp/FBN1502/222.html', '222.html', '388,158,496,222', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/equation/equation'),
(223, 158, 47, 388, 3, 608, 609, 276, 278, 277, '', 'Shape of graph', 'Functions and Representations of Functions', '', 'temp/FBN1502/223.html', '223.html', '388,158,223', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/shape-of-graph'),
(224, 498, 47, 388, 4, 625, 626, 279, 281, 280, '', 'y-coordinate', 'Functions and Representations of Functions', '', 'temp/FBN1502/224.html', '224.html', '388,158,498,224', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/vertex/y-coordinate'),
(225, 498, 47, 388, 4, 627, 628, 278, 280, 279, '', 'x-coordinate', 'Functions and Representations of Functions', '', 'temp/FBN1502/225.html', '225.html', '388,158,498,225', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/vertex/x-coordinate'),
(226, 500, 47, 388, 4, 633, 634, 282, 284, 283, '', 'y-axis', 'Functions and Representations of Functions', '', 'temp/FBN1502/226.html', '226.html', '388,158,500,226', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/intercepts/y-axis'),
(227, 500, 47, 388, 4, 635, 636, 283, 285, 284, '', 'x-axis', 'Functions and Representations of Functions', '', 'temp/FBN1502/227.html', '227.html', '388,158,500,227', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/intercepts/x-axis'),
(228, 502, 47, 388, 4, 641, 642, 286, 288, 287, '', 'Two x-intercepts', 'Functions and Representations of Functions', '', 'temp/FBN1502/228.html', '228.html', '388,158,502,228', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/discriminant/two-x-intercepts'),
(229, 502, 47, 388, 4, 643, 644, 287, 289, 288, '', 'One x-intercept', 'Functions and Representations of Functions', '', 'temp/FBN1502/229.html', '229.html', '388,158,502,229', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/discriminant/one-x-intercept'),
(230, 502, 47, 388, 4, 645, 646, 288, 290, 289, '', 'No x-intercepts', 'Functions and Representations of Functions', '', 'temp/FBN1502/230.html', '230.html', '388,158,502,230', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/discriminant/no-x-intercepts'),
(231, 505, 47, 388, 4, 653, 654, 292, 294, 293, '', 'Steps', 'Functions and Representations of Functions', '', 'temp/FBN1502/231.html', '231.html', '388,158,505,231', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/draw-the-graph/steps'),
(232, 505, 47, 388, 4, 655, 656, 293, 295, 294, '', 'Example', 'Functions and Representations of Functions', '', 'temp/FBN1502/232.html', '232.html', '388,158,505,232', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/draw-the-graph/example'),
(235, 508, 47, 388, 4, 663, 664, 297, 299, 298, '', 'Not constant', 'Functions and Representations of Functions', '', 'temp/FBN1502/235.html', '235.html', '388,158,508,235', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/slope/not-constant'),
(236, 508, 47, 388, 4, 665, 666, 298, 300, 299, '', 'Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/236.html', '236.html', '388,158,508,236', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/slope/video'),
(237, 514, 47, 388, 4, 559, 560, 309, 311, 310, '', 'Introduction', 'Functions and Representations of Functions', '', 'temp/FBN1502/237.html', '237.html', '388,157,514,237', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/introduction'),
(238, 514, 47, 388, 4, 561, 562, 311, 313, 312, '', 'Examples', 'Functions and Representations of Functions', '', 'temp/FBN1502/238.html', '238.html', '388,157,514,238', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/examples'),
(239, 514, 47, 388, 4, 563, 564, 312, 314, 313, '', 'x &gt; 0; x &lt; 0', 'Functions and Representations of Functions', '', 'temp/FBN1502/239.html', '239.html', '388,157,514,239', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/x-0-x-0'),
(240, 514, 47, 388, 4, 565, 566, 314, 316, 315, '', 'x &gt; 0; x &lt; 0 - Video', 'Functions and Representations of Functions', '', 'temp/FBN1502/240.html', '240.html', '388,157,514,240', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/x-0-x-0---video'),
(241, 514, 47, 388, 4, 567, 568, 315, 317, 316, '', 'a &gt; 1;  0 &lt; a &lt; 1', 'Functions and Representations of Functions', '', 'temp/FBN1502/241.html', '241.html', '388,157,514,241', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/a-1-0-a-1'),
(242, 514, 47, 388, 4, 569, 570, 317, 319, 318, '', 'a &gt; 1;  0 &lt; a &lt; 1 - Recap', 'Functions and Representations of Functions', '', 'temp/FBN1502/242.html', '242.html', '388,157,514,242', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/a-1-0-a-1---recap'),
(243, 517, 47, 388, 4, 577, 578, 319, 321, 320, '', 'Inverse function', 'Functions and Representations of Functions', '', 'temp/FBN1502/243.html', '243.html', '388,157,517,243', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/inverse-function'),
(244, 517, 47, 388, 4, 579, 580, 320, 322, 321, '', 'Equation', 'Functions and Representations of Functions', '', 'temp/FBN1502/244.html', '244.html', '388,157,517,244', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/equation'),
(245, 517, 47, 388, 4, 581, 582, 321, 323, 322, '', 'Example', 'Functions and Representations of Functions', '', 'temp/FBN1502/245.html', '245.html', '388,157,517,245', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/example');
INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(246, 517, 47, 388, 4, 583, 584, 324, 326, 325, '', 'In general', 'Functions and Representations of Functions', '', 'temp/FBN1502/246.html', '246.html', '388,157,517,246', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/in-general'),
(247, 517, 47, 388, 4, 585, 586, 325, 327, 326, '', 'Graph', 'Functions and Representations of Functions', '', 'temp/FBN1502/247.html', '247.html', '388,157,517,247', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/graph'),
(248, 525, 47, 389, 4, 689, 690, 337, 339, 338, '', 'Video 1', 'Linear Systems', '', 'temp/FBN1502/248.html', '248.html', '389,162,525,248', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve/video-1'),
(249, 525, 47, 389, 4, 691, 692, 338, 340, 339, '', 'Video 2', 'Linear Systems', '', 'temp/FBN1502/249.html', '249.html', '389,162,525,249', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve/video-2'),
(250, 525, 47, 389, 4, 693, 694, 339, 341, 340, '', 'Examples', 'Linear Systems', '', 'temp/FBN1502/250.html', '250.html', '389,162,525,250', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve/examples'),
(251, 525, 47, 389, 4, 695, 696, 340, 342, 341, '', 'Steps', 'Linear Systems', '', 'temp/FBN1502/251.html', '251.html', '389,162,525,251', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve/steps'),
(252, 528, 47, 389, 4, 703, 704, 344, 346, 345, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/252.html', '252.html', '389,162,528,252', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/word-problems/example'),
(253, 530, 47, 389, 4, 709, 710, 347, 349, 348, '', 'Determine  x-intercept', 'Linear Systems', '', 'temp/FBN1502/253.html', '253.html', '389,162,530,253', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve-by-x-intercept/determine-x-intercept'),
(255, 537, 47, 389, 4, 733, 734, 359, 361, 360, '', 'Introduction', 'Linear Systems', '', 'temp/FBN1502/255.html', '255.html', '389,163,537,255', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/systems-of-equations/introduction'),
(256, 537, 47, 389, 4, 735, 736, 360, 362, 361, '', 'The system', 'Linear Systems', '', 'temp/FBN1502/256.html', '256.html', '389,163,537,256', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/systems-of-equations/the-system'),
(257, 538, 47, 389, 4, 739, 740, 362, 364, 363, '', 'Video', 'Linear Systems', '', 'temp/FBN1502/257.html', '257.html', '389,163,538,257', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-graphing/video'),
(258, 540, 47, 389, 4, 745, 746, 365, 367, 366, '', 'Video', 'Linear Systems', '', 'temp/FBN1502/258.html', '258.html', '389,163,540,258', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-substitution/video'),
(259, 540, 47, 389, 4, 747, 748, 366, 368, 367, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/259.html', '259.html', '389,163,540,259', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-substitution/example'),
(260, 542, 47, 389, 4, 753, 754, 369, 371, 370, '', 'Video 1', 'Linear Systems', '', 'temp/FBN1502/260.html', '260.html', '389,163,542,260', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-elimination/video-1'),
(261, 542, 47, 389, 4, 755, 756, 370, 372, 371, '', 'Video 2', 'Linear Systems', '', 'temp/FBN1502/261.html', '261.html', '389,163,542,261', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-elimination/video-2'),
(262, 545, 47, 389, 4, 763, 764, 374, 376, 375, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/262.html', '262.html', '389,163,545,262', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/word-problems/example'),
(263, 552, 47, 389, 4, 787, 788, 386, 388, 387, '', '&gt; and &lt;', 'Linear Systems', '', 'temp/FBN1502/263.html', '263.html', '389,166,552,263', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/introduction/and'),
(264, 552, 47, 389, 4, 789, 790, 387, 389, 388, '', '&quot;&gt; and =&quot; and &quot;&lt; and =&quot;', 'Linear Systems', '', 'temp/FBN1502/264.html', '264.html', '389,166,552,264', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/introduction/and-and-and'),
(265, 553, 47, 389, 4, 793, 794, 389, 391, 390, '', 'Rules 1 &amp; 2', 'Linear Systems', '', 'temp/FBN1502/265.html', '265.html', '389,166,553,265', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/solve/rules-1-2'),
(266, 553, 47, 389, 4, 795, 796, 391, 393, 392, '', 'Rule 5', 'Linear Systems', '', 'temp/FBN1502/266.html', '266.html', '389,166,553,266', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/solve/rule-5'),
(267, 553, 47, 389, 4, 797, 798, 390, 392, 391, '', 'Rules 3 &amp; 4', 'Linear Systems', '', 'temp/FBN1502/267.html', '267.html', '389,166,553,267', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/solve/rules-3-4'),
(268, 553, 47, 389, 4, 799, 800, 392, 394, 393, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/268.html', '268.html', '389,166,553,268', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/solve/example'),
(269, 555, 47, 389, 4, 805, 806, 395, 397, 396, '', 'Four types', 'Linear Systems', '', 'temp/FBN1502/269.html', '269.html', '389,166,555,269', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/miscellaneous/four-types'),
(270, 555, 47, 389, 4, 807, 808, 396, 398, 397, '', 'Variable on right side', 'Linear Systems', '', 'temp/FBN1502/270.html', '270.html', '389,166,555,270', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/miscellaneous/variable-on-right-side'),
(271, 555, 47, 389, 4, 809, 810, 397, 399, 398, '', 'Multiply or divide by variable', 'Linear Systems', '', 'temp/FBN1502/271.html', '271.html', '389,166,555,271', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/miscellaneous/multiply-or-divide-by-variable'),
(272, 557, 47, 389, 4, 815, 816, 400, 402, 401, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/272.html', '272.html', '389,166,557,272', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/word-problems/example'),
(273, 557, 47, 389, 4, 817, 818, 401, 403, 402, '', 'Key words', 'Linear Systems', '', 'temp/FBN1502/273.html', '273.html', '389,166,557,273', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/word-problems/key-words'),
(274, 156, 47, 156, 2, 7, 8, -1, 1, 0, '', 'TAO_demo', '', '', 'temp/FBN1502/274.html', '274.html', '156,274', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages/tao_demo'),
(275, 564, 47, 389, 4, 843, 844, 413, 415, 414, '', 'Video', 'Linear Systems', '', 'temp/FBN1502/275.html', '275.html', '389,167,564,275', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/linear-inequality/video'),
(276, 564, 47, 389, 4, 845, 846, 414, 416, 415, '', 'Boundary line', 'Linear Systems', '', 'temp/FBN1502/276.html', '276.html', '389,167,564,276', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/linear-inequality/boundary-line'),
(277, 564, 47, 389, 4, 847, 848, 416, 418, 417, '', 'Activity 1 recap', 'Linear Systems', '', 'temp/FBN1502/277.html', '277.html', '389,167,564,277', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/linear-inequality/activity-1-recap'),
(278, 568, 47, 389, 4, 855, 856, 419, 421, 420, '', 'Video', 'Linear Systems', '', 'temp/FBN1502/278.html', '278.html', '389,167,568,278', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-two-linear-inequalities/video'),
(279, 568, 47, 389, 4, 857, 858, 421, 423, 422, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/279.html', '279.html', '389,167,568,279', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-two-linear-inequalities/example'),
(280, 573, 47, 389, 4, 865, 866, 424, 426, 425, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/280.html', '280.html', '389,167,573,280', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-more-linear-inequalities/example'),
(282, 575, 47, 389, 4, 871, 872, 427, 429, 428, '', 'Example', 'Linear Systems', '', 'temp/FBN1502/282.html', '282.html', '389,167,575,282', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/word-problems/example'),
(283, 167, 47, 389, 3, 838, 839, 429, 431, 430, '', 'No solution', 'Linear Systems', '', 'temp/FBN1502/283.html', '283.html', '389,167,283', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/no-solution'),
(285, 582, 47, 390, 4, 899, 900, 441, 443, 442, '', 'Introduction', 'An Application of Differentiation', '', 'temp/FBN1502/285.html', '285.html', '390,169,582,285', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/total-fixed-and-variable-cost/introduction'),
(286, 582, 47, 390, 4, 901, 902, 442, 444, 443, '', 'Example', 'An Application of Differentiation', '', 'temp/FBN1502/286.html', '286.html', '390,169,582,286', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/total-fixed-and-variable-cost/example'),
(287, 582, 47, 390, 4, 903, 904, 443, 445, 444, '', 'Cost as a function', 'An Application of Differentiation', '', 'temp/FBN1502/287.html', '287.html', '390,169,582,287', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/total-fixed-and-variable-cost/cost-as-a-function'),
(288, 583, 47, 390, 4, 907, 908, 445, 447, 446, '', 'Introduction', 'An Application of Differentiation', '', 'temp/FBN1502/288.html', '288.html', '390,169,583,288', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/marginal-cost/introduction'),
(289, 583, 47, 390, 4, 909, 910, 446, 448, 447, '', 'Three methods', 'An Application of Differentiation', '', 'temp/FBN1502/289.html', '289.html', '390,169,583,289', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/marginal-cost/three-methods'),
(290, 584, 47, 390, 4, 913, 914, 448, 450, 449, '', 'Example', 'An Application of Differentiation', '', 'temp/FBN1502/290.html', '290.html', '390,169,584,290', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---table/example'),
(291, 586, 47, 390, 4, 919, 920, 451, 453, 452, '', 'Linear relationship', 'An Application of Differentiation', '', 'temp/FBN1502/291.html', '291.html', '390,169,586,291', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---linear-function/linear-relationship'),
(292, 586, 47, 390, 4, 921, 922, 452, 454, 453, '', 'Slope', 'An Application of Differentiation', '', 'temp/FBN1502/292.html', '292.html', '390,169,586,292', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---linear-function/slope'),
(293, 586, 47, 390, 4, 923, 924, 453, 455, 454, '', 'Video', 'An Application of Differentiation', '', 'temp/FBN1502/293.html', '293.html', '390,169,586,293', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---linear-function/video'),
(294, 586, 47, 390, 4, 925, 926, 455, 457, 456, '', 'Constant change', 'An Application of Differentiation', '', 'temp/FBN1502/294.html', '294.html', '390,169,586,294', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---linear-function/constant-change'),
(295, 169, 47, 390, 3, 894, 895, 456, 458, 457, '', 'Calculate - Non-linear function: Video', 'An Application of Differentiation', '', 'temp/FBN1502/295.html', '295.html', '390,169,295', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---non-linear-function-video'),
(296, 589, 47, 390, 4, 933, 934, 459, 461, 460, '', 'Differentiation rules', 'An Application of Differentiation', '', 'temp/FBN1502/296.html', '296.html', '390,169,589,296', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/derivatives-and-slope/differentiation-rules'),
(297, 592, 47, 390, 4, 941, 942, 463, 465, 464, '', 'Farmer example', 'An Application of Differentiation', '', 'temp/FBN1502/297.html', '297.html', '390,169,592,297', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/non-linear-function/farmer-example'),
(298, 592, 47, 390, 4, 943, 944, 464, 466, 465, '', 'Farmer example (Cont.)', 'An Application of Differentiation', '', 'temp/FBN1502/298.html', '298.html', '390,169,592,298', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/non-linear-function/farmer-example-cont'),
(299, 592, 47, 390, 4, 945, 946, 466, 468, 467, '', 'Farmer recap', 'An Application of Differentiation', '', 'temp/FBN1502/299.html', '299.html', '390,169,592,299', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/non-linear-function/farmer-recap'),
(302, 599, 47, 390, 4, 969, 970, 477, 479, 478, '', 'Introduction', 'An Application of Differentiation', '', 'temp/FBN1502/302.html', '302.html', '390,171,599,302', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/profit/introduction'),
(303, 599, 47, 390, 4, 971, 972, 479, 481, 480, '', 'Farmer', 'An Application of Differentiation', '', 'temp/FBN1502/303.html', '303.html', '390,171,599,303', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/profit/farmer'),
(304, 602, 47, 390, 4, 977, 978, 481, 483, 482, '', 'Farmer', 'An Application of Differentiation', '', 'temp/FBN1502/304.html', '304.html', '390,171,602,304', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-profit/farmer'),
(305, 602, 47, 390, 4, 979, 980, 482, 484, 483, '', 'Farmer (Cont.)', 'An Application of Differentiation', '', 'temp/FBN1502/305.html', '305.html', '390,171,602,305', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-profit/farmer-cont'),
(306, 603, 47, 390, 4, 983, 984, 484, 486, 485, '', 'Video', 'An Application of Differentiation', '', 'temp/FBN1502/306.html', '306.html', '390,171,603,306', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-functions/video'),
(307, 603, 47, 390, 4, 985, 986, 485, 487, 486, '', 'Recap', 'An Application of Differentiation', '', 'temp/FBN1502/307.html', '307.html', '390,171,603,307', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-functions/recap'),
(308, 616, 47, 0, 1, 16, 17, -1, 1, 0, '', 'return_url', '', '', 'temp/FBN1502/308.html', '308.html', '308', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/return_url'),
(309, 411, 47, 387, 4, 221, 222, 41, 43, 42, '', 'Video', 'Mathematics of Finance', '', 'temp/FBN1502/309.html', '309.html', '387,173,411,309', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/introduction/video'),
(310, 411, 47, 387, 4, 223, 224, 42, 44, 43, '', 'Introduction', 'Mathematics of Finance', '', 'temp/FBN1502/310.html', '310.html', '387,173,411,310', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/introduction/introduction'),
(311, 173, 47, 387, 3, 214, 215, 43, 45, 44, '', 'Formula', '', '', 'temp/FBN1502/311.html', '311.html', '387,173,311', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/formula'),
(312, 173, 47, 387, 3, 216, 217, 44, 46, 45, '', 'Time line ', '', '', 'temp/FBN1502/312.html', '312.html', '387,173,312', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/time-line'),
(313, 413, 47, 387, 4, 235, 236, 50, 52, 51, '', 'Examples of each', 'Mathematics of Finance', '', 'temp/FBN1502/313.html', '313.html', '387,173,413,313', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/simple-interest-vs.-simple-discount/examples-of-each'),
(314, 413, 47, 387, 4, 237, 238, 51, 53, 52, '', 'Comparing', 'Mathematics of Finance', '', 'temp/FBN1502/314.html', '314.html', '387,173,413,314', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/simple-interest-vs.-simple-discount/comparing'),
(315, 176, 47, 387, 3, 256, 257, 5, 7, 6, '', 'Introduction', 'Mathematics of Finance', '', 'temp/FBN1502/315.html', '315.html', '387,176,315', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/introduction'),
(317, 391, 47, 387, 4, 271, 272, 7, 9, 8, '', 'Borrower', 'Mathematics of Finance', '', 'temp/FBN1502/317.html', '317.html', '387,176,391,317', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/borrowers-and-investors/borrower'),
(318, 391, 47, 387, 4, 273, 274, 8, 10, 9, '', 'Investor', 'Mathematics of Finance', '', 'temp/FBN1502/318.html', '318.html', '387,176,391,318', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/borrowers-and-investors/investor'),
(319, 392, 47, 387, 4, 277, 278, 10, 12, 11, '', 'How it works', 'Mathematics of Finance', '', 'temp/FBN1502/319.html', '319.html', '387,176,392,319', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/how-it-works/how-it-works'),
(320, 392, 47, 387, 4, 279, 280, 11, 13, 12, '', 'The interest amount', 'Mathematics of Finance', '', 'temp/FBN1502/320.html', '320.html', '387,176,392,320', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/how-it-works/the-interest-amount'),
(321, 176, 47, 387, 3, 258, 259, 12, 14, 13, '', 'Simple Interest Formula', '', '', 'temp/FBN1502/321.html', '321.html', '387,176,321', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/simple-interest-formula'),
(322, 176, 47, 387, 3, 260, 261, 13, 15, 14, '', 'Annum and year', '', '', 'temp/FBN1502/322.html', '322.html', '387,176,322', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/annum-and-year'),
(323, 176, 47, 387, 3, 262, 263, 15, 17, 16, '', 'Time line ', '', '', 'temp/FBN1502/323.html', '323.html', '387,176,323', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/time-line'),
(324, 176, 47, 387, 3, 264, 265, 16, 18, 17, '', 'Accumulated Sum Formula', '', '', 'temp/FBN1502/324.html', '324.html', '387,176,324', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/accumulated-sum-formula'),
(325, 405, 47, 387, 4, 287, 288, 20, 22, 21, '', 'Change Subject of Formula', 'Mathematics of Finance', '', 'temp/FBN1502/325.html', '325.html', '387,176,405,325', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-p/change-subject-of-formula'),
(326, 405, 47, 387, 4, 289, 290, 22, 24, 23, '', 'Present Value', 'Mathematics of Finance', '', 'temp/FBN1502/326.html', '326.html', '387,176,405,326', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-p/present-value'),
(327, 406, 47, 387, 4, 297, 298, 27, 29, 28, '', 'Recap', 'Mathematics of Finance', '', 'temp/FBN1502/327.html', '327.html', '387,176,406,327', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-n/recap'),
(328, 407, 47, 387, 4, 305, 306, 30, 32, 31, '', 'Recap', 'Mathematics of Finance', '', 'temp/FBN1502/328.html', '328.html', '387,176,407,328', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-i/recap'),
(329, 177, 47, 387, 3, 326, 327, 99, 101, 100, '', 'Introduction', 'Mathematics of Finance', '', 'temp/FBN1502/329.html', '329.html', '387,177,329', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/introduction'),
(330, 426, 47, 387, 4, 333, 334, 101, 103, 102, '', 'Time and money', 'Mathematics of Finance', '', 'temp/FBN1502/330.html', '330.html', '387,177,426,330', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/time-and-money/time-and-money'),
(331, 426, 47, 387, 4, 335, 336, 102, 104, 103, '', 'Present and future values', 'Mathematics of Finance', '', 'temp/FBN1502/331.html', '331.html', '387,177,426,331', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/time-and-money/present-and-future-values'),
(332, 426, 47, 387, 4, 337, 338, 103, 105, 104, '', 'Example', 'Mathematics of Finance', '', 'temp/FBN1502/332.html', '332.html', '387,177,426,332', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/time-and-money/example'),
(333, 177, 47, 387, 3, 328, 329, 104, 106, 105, '', 'Time line', 'Mathematics of Finance', '', 'temp/FBN1502/333.html', '333.html', '387,177,333', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/time-line'),
(334, 427, 47, 387, 4, 341, 342, 106, 108, 107, '', 'Forwards and backwards', 'Mathematics of Finance', '', 'temp/FBN1502/334.html', '334.html', '387,177,427,334', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/moving-repayments/forwards-and-backwards'),
(335, 427, 47, 387, 4, 343, 344, 107, 109, 108, '', 'Rules', 'Mathematics of Finance', '', 'temp/FBN1502/335.html', '335.html', '387,177,427,335', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/moving-repayments/rules'),
(336, 427, 47, 387, 4, 345, 346, 109, 111, 110, '', 'Recap', 'Mathematics of Finance', '', 'temp/FBN1502/336.html', '336.html', '387,177,427,336', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/moving-repayments/recap'),
(337, 428, 47, 387, 4, 351, 352, 111, 113, 112, '', 'Example', 'Mathematics of Finance', '', 'temp/FBN1502/337.html', '337.html', '387,177,428,337', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/replacing-financial-obligations/example'),
(338, 428, 47, 387, 4, 353, 354, 113, 115, 114, '', 'Replacing financial obligations', 'Mathematics of Finance', '', 'temp/FBN1502/338.html', '338.html', '387,177,428,338', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/replacing-financial-obligations/replacing-financial-obligations'),
(340, 616, 47, 0, 1, 18, 19, -1, 1, 0, '', 'page-locked', '', '', 'temp/FBN1502/340.html', '340.html', '340', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/page-locked'),
(343, 156, 47, 156, 2, 9, 10, -1, 1, 0, '', 'add_topics', '', '', 'temp/FBN1502/343.html', '343.html', '156,343', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages/add_topics'),
(344, 445, 47, 387, 4, 35, 36, 157, 159, 158, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/344.html', '344.html', '387,151,445,344', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/calculate-payments-r/activity'),
(348, 447, 47, 387, 4, 47, 48, 162, 164, 163, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/348.html', '348.html', '387,151,447,348', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/period-and-payments/activity'),
(352, 447, 47, 387, 4, 49, 50, 163, 165, 164, '', 'Increase payment', 'Mathematics of Finance', '', 'temp/FBN1502/352.html', '352.html', '387,151,447,352', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/period-and-payments/increase-payment'),
(353, 447, 47, 387, 4, 51, 52, 164, 166, 165, '', 'Activity (Cont.)', 'Mathematics of Finance', '', 'temp/FBN1502/353.html', '353.html', '387,151,447,353', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/period-and-payments/activity-cont'),
(355, 448, 47, 387, 4, 61, 62, 171, 173, 172, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/355.html', '355.html', '387,151,448,355', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/interest-rate-i/activity'),
(357, 449, 47, 387, 4, 67, 68, 175, 177, 176, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/357.html', '357.html', '387,151,449,357', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/exercise/exercise'),
(358, 450, 47, 387, 4, 73, 74, 178, 180, 179, '', 'Questions', 'Mathematics of Finance', '', 'temp/FBN1502/358.html', '358.html', '387,151,450,358', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/assignment/questions'),
(359, 176, 47, 387, 3, 266, 267, 14, 16, 15, '', 'Calculate I - Activity', '', '', 'temp/FBN1502/359.html', '359.html', '387,176,359', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-i---activity'),
(361, 404, 47, 387, 4, 283, 284, 18, 20, 19, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/361.html', '361.html', '387,176,404,361', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-s/activity'),
(362, 405, 47, 387, 4, 291, 292, 21, 23, 22, '', 'Activity 1', 'Mathematics of Finance', '', 'temp/FBN1502/362.html', '362.html', '387,176,405,362', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-p/activity-1'),
(363, 405, 47, 387, 4, 293, 294, 23, 25, 24, '', 'Activity 2', 'Mathematics of Finance', '', 'temp/FBN1502/363.html', '363.html', '387,176,405,363', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-p/activity-2'),
(364, 406, 47, 387, 4, 299, 300, 25, 27, 26, '', 'Activity 1', 'Mathematics of Finance', '', 'temp/FBN1502/364.html', '364.html', '387,176,406,364', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-n/activity-1'),
(365, 406, 47, 387, 4, 301, 302, 26, 28, 27, '', 'Activity 2', 'Mathematics of Finance', '', 'temp/FBN1502/365.html', '365.html', '387,176,406,365', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-n/activity-2'),
(366, 407, 47, 387, 4, 307, 308, 29, 31, 30, '', 'Activity 1', 'Mathematics of Finance', '', 'temp/FBN1502/366.html', '366.html', '387,176,407,366', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-i/activity-1'),
(367, 408, 47, 387, 4, 313, 314, 34, 36, 35, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/367.html', '367.html', '387,176,408,367', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/exercise/exercise'),
(368, 409, 47, 387, 4, 319, 320, 37, 39, 38, '', 'Questions', 'Mathematics of Finance', '', 'temp/FBN1502/368.html', '368.html', '387,176,409,368', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/assignment/questions'),
(369, 412, 47, 387, 4, 227, 228, 46, 48, 47, '', 'Activity 1', 'Mathematics of Finance', '', 'temp/FBN1502/369.html', '369.html', '387,173,412,369', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/activities/activity-1'),
(371, 412, 47, 387, 4, 229, 230, 47, 49, 48, '', 'Activity 2', 'Mathematics of Finance', '', 'temp/FBN1502/371.html', '371.html', '387,173,412,371', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/activities/activity-2'),
(372, 412, 47, 387, 4, 231, 232, 48, 50, 49, '', 'Activity 3', 'Mathematics of Finance', '', 'temp/FBN1502/372.html', '372.html', '387,173,412,372', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/activities/activity-3'),
(373, 414, 47, 387, 4, 243, 244, 55, 57, 56, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/373.html', '373.html', '387,173,414,373', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/exercise/exercise'),
(374, 415, 47, 387, 4, 249, 250, 58, 60, 59, '', 'Questions', 'Mathematics of Finance', '', 'temp/FBN1502/374.html', '374.html', '387,173,415,374', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/assignment/questions'),
(375, 418, 47, 387, 4, 153, 154, 67, 69, 68, '', 'How it works 1', 'Mathematics of Finance', '', 'temp/FBN1502/375.html', '375.html', '387,153,418,375', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/how-it-works/how-it-works-1'),
(376, 418, 47, 387, 4, 155, 156, 68, 70, 69, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/376.html', '376.html', '387,153,418,376', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/how-it-works/activity'),
(377, 419, 47, 387, 4, 163, 164, 73, 75, 74, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/377.html', '377.html', '387,153,419,377', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-s/activity'),
(378, 420, 47, 387, 4, 177, 178, 80, 82, 81, '', 'Activity 1', 'Mathematics of Finance', '', 'temp/FBN1502/378.html', '378.html', '387,153,420,378', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/activity-1'),
(379, 420, 47, 387, 4, 179, 180, 81, 83, 82, '', 'Activity 2', 'Mathematics of Finance', '', 'temp/FBN1502/379.html', '379.html', '387,153,420,379', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/activity-2'),
(380, 420, 47, 387, 4, 181, 182, 82, 84, 83, '', 'Activity 3', 'Mathematics of Finance', '', 'temp/FBN1502/380.html', '380.html', '387,153,420,380', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods/activity-3'),
(381, 421, 47, 387, 4, 187, 188, 85, 87, 86, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/381.html', '381.html', '387,153,421,381', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-p/activity'),
(382, 422, 47, 387, 4, 193, 194, 88, 90, 89, '', 'Calculate n - Activity', 'Mathematics of Finance', '', 'temp/FBN1502/382.html', '382.html', '387,153,422,382', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-n-and-i/calculate-n---activity'),
(383, 422, 47, 387, 4, 195, 196, 89, 91, 90, '', 'Calculate i - Activity', 'Mathematics of Finance', '', 'temp/FBN1502/383.html', '383.html', '387,153,422,383', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-n-and-i/calculate-i---activity'),
(384, 423, 47, 387, 4, 201, 202, 93, 95, 94, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/384.html', '384.html', '387,153,423,384', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/exercise/exercise'),
(385, 424, 47, 387, 4, 207, 208, 96, 98, 97, '', 'Questions', 'Mathematics of Finance', '', 'temp/FBN1502/385.html', '385.html', '387,153,424,385', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/assignment/questions'),
(386, 176, 47, 387, 3, 268, 269, 4, 6, 5, '', 'Learning objectives', 'Mathematics of Finance', '', 'temp/FBN1502/386.html', '386.html', '387,176,386', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/learning-objectives'),
(387, 616, 47, 0, 1, 20, 373, 2, 4, 3, '', 'Mathematics of finance', '', '', 'temp/FBN1502/387.html', '387.html', '387', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance'),
(388, 616, 47, 0, 1, 374, 681, 179, 181, 180, '', 'Functions and representations of functions', '', '', 'temp/FBN1502/388.html', '388.html', '388', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions'),
(389, 616, 47, 0, 1, 682, 889, 333, 335, 334, '', 'Linear systems', '', '', 'temp/FBN1502/389.html', '389.html', '389', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems'),
(390, 616, 47, 0, 1, 890, 1005, 437, 439, 438, '', 'An application of differentiation', '', '', 'temp/FBN1502/390.html', '390.html', '390', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation'),
(391, 176, 47, 387, 3, 270, 275, 6, 8, 7, '', 'Borrowers and investors', 'Mathematics of Finance', '', 'temp/FBN1502/391.html', '391.html', '387,176,391', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/borrowers-and-investors'),
(392, 176, 47, 387, 3, 276, 281, 9, 11, 10, '', 'How it works', 'Mathematics of Finance', '', 'temp/FBN1502/392.html', '392.html', '387,176,392', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/how-it-works'),
(393, 427, 47, 387, 4, 347, 348, 108, 110, 109, '', 'Activity', 'Mathematics of Finance', '', 'temp/FBN1502/393.html', '393.html', '387,177,427,393', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/moving-repayments/activity'),
(395, 428, 47, 387, 4, 355, 356, 112, 114, 113, '', 'Activity 1', 'Mathematics of Finance', '', 'temp/FBN1502/395.html', '395.html', '387,177,428,395', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/replacing-financial-obligations/activity-1'),
(399, 428, 47, 387, 4, 357, 358, 114, 116, 115, '', 'Activity 2', 'Mathematics of Finance', '', 'temp/FBN1502/399.html', '399.html', '387,177,428,399', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/replacing-financial-obligations/activity-2'),
(402, 429, 47, 387, 4, 363, 364, 118, 120, 119, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/402.html', '402.html', '387,177,429,402', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/exercise/exercise'),
(403, 430, 47, 387, 4, 369, 370, 121, 123, 122, '', 'Questions', 'Mathematics of Finance', '', 'temp/FBN1502/403.html', '403.html', '387,177,430,403', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/assignment/questions'),
(404, 176, 47, 387, 3, 282, 285, 17, 19, 18, '', 'Calculate S', 'Mathematics of Finance', '', 'temp/FBN1502/404.html', '404.html', '387,176,404', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-s'),
(405, 176, 47, 387, 3, 286, 295, 19, 21, 20, '', 'Calculate P', '', '', 'temp/FBN1502/405.html', '405.html', '387,176,405', 11, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-p'),
(406, 176, 47, 387, 3, 296, 303, 24, 26, 25, '', 'Calculate n', '', '', 'temp/FBN1502/406.html', '406.html', '387,176,406', 12, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-n'),
(407, 176, 47, 387, 3, 304, 309, 28, 30, 29, '', 'Calculate i', 'Mathematics of Finance', '', 'temp/FBN1502/407.html', '407.html', '387,176,407', 13, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/calculate-i'),
(408, 176, 47, 387, 3, 310, 315, 32, 34, 33, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/408.html', '408.html', '387,176,408', 15, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/exercise'),
(409, 176, 47, 387, 3, 316, 321, 35, 37, 36, '', 'Assignment', 'Mathematics of Finance', '', 'temp/FBN1502/409.html', '409.html', '387,176,409', 16, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-interest/assignment'),
(410, 173, 47, 387, 3, 218, 219, 39, 41, 40, '', 'Learning objectives', 'Mathematics of Finance', '', 'temp/FBN1502/410.html', '410.html', '387,173,410', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/learning-objectives'),
(411, 173, 47, 387, 3, 220, 225, 40, 42, 41, '', 'Introduction', 'Mathematics of Finance', '', 'temp/FBN1502/411.html', '411.html', '387,173,411', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/introduction'),
(412, 173, 47, 387, 3, 226, 233, 45, 47, 46, '', 'Activities', 'Mathematics of Finance', '', 'temp/FBN1502/412.html', '412.html', '387,173,412', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/activities'),
(413, 173, 47, 387, 3, 234, 239, 49, 51, 50, '', 'Simple interest vs. simple discount', 'Mathematics of Finance', '', 'temp/FBN1502/413.html', '413.html', '387,173,413', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/simple-interest-vs.-simple-discount'),
(414, 173, 47, 387, 3, 240, 245, 53, 55, 54, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/414.html', '414.html', '387,173,414', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/exercise'),
(415, 173, 47, 387, 3, 246, 251, 56, 58, 57, '', 'Assignment', 'Mathematics of Finance', '', 'temp/FBN1502/415.html', '415.html', '387,173,415', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/simple-discount/assignment'),
(416, 153, 47, 387, 3, 138, 139, 60, 62, 61, '', 'Learning objectives', 'Mathematics of Finance', '', 'temp/FBN1502/416.html', '416.html', '387,153,416', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/learning-objectives'),
(417, 153, 47, 387, 3, 140, 149, 61, 63, 62, '', 'Simple and compound interest', 'Mathematics of Finance', '', 'temp/FBN1502/417.html', '417.html', '387,153,417', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/simple-and-compound-interest'),
(418, 153, 47, 387, 3, 150, 157, 66, 68, 67, '', 'How it works', 'Mathematics of Finance', '', 'temp/FBN1502/418.html', '418.html', '387,153,418', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/how-it-works'),
(419, 153, 47, 387, 3, 158, 165, 70, 72, 71, '', 'Calculate S', 'Mathematics of Finance', '', 'temp/FBN1502/419.html', '419.html', '387,153,419', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-s'),
(420, 153, 47, 387, 3, 166, 183, 74, 76, 75, '', 'Compounding periods', 'Mathematics of Finance', '', 'temp/FBN1502/420.html', '420.html', '387,153,420', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/compounding-periods'),
(421, 153, 47, 387, 3, 184, 189, 83, 85, 84, '', 'Calculate P', 'Mathematics of Finance', '', 'temp/FBN1502/421.html', '421.html', '387,153,421', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-p'),
(422, 153, 47, 387, 3, 190, 197, 86, 88, 87, '', 'Calculate n and i', 'Mathematics of Finance', '', 'temp/FBN1502/422.html', '422.html', '387,153,422', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/calculate-n-and-i'),
(423, 153, 47, 387, 3, 198, 203, 91, 93, 92, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/423.html', '423.html', '387,153,423', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/exercise'),
(424, 153, 47, 387, 3, 204, 209, 94, 96, 95, '', 'Assignment', 'Mathematics of Finance', '', 'temp/FBN1502/424.html', '424.html', '387,153,424', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/compound-interest/assignment'),
(425, 177, 47, 387, 3, 330, 331, 98, 100, 99, '', 'Learning objectives', 'Mathematics of Finance', '', 'temp/FBN1502/425.html', '425.html', '387,177,425', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/learning-objectives'),
(426, 177, 47, 387, 3, 332, 339, 100, 102, 101, '', 'Time and money', 'Mathematics of Finance', '', 'temp/FBN1502/426.html', '426.html', '387,177,426', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/time-and-money'),
(427, 177, 47, 387, 3, 340, 349, 105, 107, 106, '', 'Moving repayments', 'Mathematics of Finance', '', 'temp/FBN1502/427.html', '427.html', '387,177,427', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/moving-repayments'),
(428, 177, 47, 387, 3, 350, 359, 110, 112, 111, '', 'Replacing financial obligations', 'Mathematics of Finance', '', 'temp/FBN1502/428.html', '428.html', '387,177,428', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/replacing-financial-obligations'),
(429, 177, 47, 387, 3, 360, 365, 116, 118, 117, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/429.html', '429.html', '387,177,429', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/exercise'),
(430, 177, 47, 387, 3, 366, 371, 119, 121, 120, '', 'Assignment', '', '', 'temp/FBN1502/430.html', '430.html', '387,177,430', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/time-value-of-money/assignment'),
(431, 152, 47, 387, 3, 82, 89, 125, 127, 126, '', 'Types', 'Mathematics of Finance', '', 'temp/FBN1502/431.html', '431.html', '387,152,431', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/types'),
(432, 152, 47, 387, 3, 90, 101, 129, 131, 130, '', 'Future value (S)', 'Mathematics of Finance', '', 'temp/FBN1502/432.html', '432.html', '387,152,432', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/future-value-s'),
(433, 152, 47, 387, 3, 102, 113, 135, 137, 136, '', 'Present value (P)', 'Mathematics of Finance', '', 'temp/FBN1502/433.html', '433.html', '387,152,433', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/present-value-p'),
(434, 152, 47, 387, 3, 114, 119, 141, 143, 142, '', 'Relationship between P and S', 'Mathematics of Finance', '', 'temp/FBN1502/434.html', '434.html', '387,152,434', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/relationship-between-p-and-s'),
(435, 152, 47, 387, 3, 120, 125, 145, 147, 146, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/435.html', '435.html', '387,152,435', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/exercise'),
(436, 152, 47, 387, 3, 126, 131, 148, 150, 149, '', 'Assignment', 'Mathematics of Finance', '', 'temp/FBN1502/436.html', '436.html', '387,152,436', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/assignment'),
(437, 152, 47, 387, 3, 132, 133, 123, 125, 124, '', 'Learning objectives', 'Mathematics of Finance', '', 'temp/FBN1502/437.html', '437.html', '387,152,437', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/learning-objectives'),
(438, 432, 47, 387, 4, 97, 98, 133, 135, 134, '', 'Calculate S - Activity', 'Mathematics of Finance', '', 'temp/FBN1502/438.html', '438.html', '387,152,432,438', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/future-value-s/calculate-s---activity'),
(439, 432, 47, 387, 4, 99, 100, 134, 136, 135, '', 'Calculate R - Activity', 'Mathematics of Finance', '', 'temp/FBN1502/439.html', '439.html', '387,152,432,439', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/future-value-s/calculate-r---activity'),
(440, 433, 47, 387, 4, 109, 110, 139, 141, 140, '', 'Calculate P - Activity', 'Mathematics of Finance', '', 'temp/FBN1502/440.html', '440.html', '387,152,433,440', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/present-value-p/calculate-p---activity'),
(441, 433, 47, 387, 4, 111, 112, 140, 142, 141, '', 'Calculate R - Activity', 'Mathematics of Finance', '', 'temp/FBN1502/441.html', '441.html', '387,152,433,441', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/present-value-p/calculate-r---activity'),
(442, 435, 47, 387, 4, 123, 124, 147, 149, 148, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/442.html', '442.html', '387,152,435,442', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/exercise/exercise'),
(443, 436, 47, 387, 4, 129, 130, 150, 152, 151, '', 'Questions', 'Mathematics of Finance', '', 'temp/FBN1502/443.html', '443.html', '387,152,436,443', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/annuities/assignment/questions'),
(444, 151, 47, 387, 3, 28, 29, 152, 154, 153, '', 'Learning objectives', 'Mathematics of Finance', '', 'temp/FBN1502/444.html', '444.html', '387,151,444', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/learning-objectives'),
(445, 151, 47, 387, 3, 30, 37, 154, 156, 155, '', 'Calculate payments (R)', 'Mathematics of Finance', '', 'temp/FBN1502/445.html', '445.html', '387,151,445', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/calculate-payments-r'),
(446, 151, 47, 387, 3, 38, 43, 158, 160, 159, '', 'The amortisation schedule', 'Mathematics of Finance', '', 'temp/FBN1502/446.html', '446.html', '387,151,446', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/the-amortisation-schedule'),
(447, 151, 47, 387, 3, 44, 53, 161, 163, 162, '', 'Period and payments', 'Mathematics of Finance', '', 'temp/FBN1502/447.html', '447.html', '387,151,447', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/period-and-payments'),
(448, 151, 47, 387, 3, 54, 63, 167, 169, 168, '', 'Interest rate (i)', 'Mathematics of Finance', '', 'temp/FBN1502/448.html', '448.html', '387,151,448', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/mathematics-of-finance/amortisation/interest-rate-i'),
(449, 151, 47, 387, 3, 64, 69, 173, 175, 174, '', 'Exercise', 'Mathematics of Finance', '', 'temp/FBN1502/449.html', '449.html', '387,151,449', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/exercise'),
(450, 151, 47, 387, 3, 70, 75, 176, 178, 177, '', 'Assignment', 'Mathematics of Finance', '', 'temp/FBN1502/450.html', '450.html', '387,151,450', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/mathematics-of-finance/amortisation/assignment'),
(451, 154, 47, 388, 3, 380, 381, 181, 183, 182, '', 'Learning objectives', 'Functions and Representations of Functions', '', 'temp/FBN1502/451.html', '451.html', '388,154,451', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/learning-objectives'),
(452, 154, 47, 388, 3, 382, 391, 189, 191, 190, '', 'Variables', 'Functions and Representations of Functions', '', 'temp/FBN1502/452.html', '452.html', '388,154,452', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/variables');
INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(453, 154, 47, 388, 3, 392, 405, 182, 184, 183, '', 'Formula', 'Functions and Representations of Functions', '', 'temp/FBN1502/453.html', '453.html', '388,154,453', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula'),
(454, 453, 47, 388, 4, 399, 400, 186, 188, 187, '', 'Activity 1', 'Functions and Representations of Functions', '', 'temp/FBN1502/454.html', '454.html', '388,154,453,454', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula/activity-1'),
(455, 453, 47, 388, 4, 401, 402, 187, 189, 188, '', 'Activity 2', 'Functions and Representations of Functions', '', 'temp/FBN1502/455.html', '455.html', '388,154,453,455', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula/activity-2'),
(456, 453, 47, 388, 4, 403, 404, 188, 190, 189, '', 'Activity 3', 'Functions and Representations of Functions', '', 'temp/FBN1502/456.html', '456.html', '388,154,453,456', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/formula/activity-3'),
(457, 154, 47, 388, 3, 406, 419, 194, 196, 195, '', 'Function', 'Functions and Representations of Functions', '', 'temp/FBN1502/457.html', '457.html', '388,154,457', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function'),
(458, 154, 47, 388, 3, 420, 427, 201, 203, 202, '', 'Function notation', 'Functions and Representations of Functions', '', 'temp/FBN1502/458.html', '458.html', '388,154,458', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function-notation'),
(459, 458, 47, 388, 4, 425, 426, 204, 206, 205, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/459.html', '459.html', '388,154,458,459', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/function-notation/activity'),
(460, 154, 47, 388, 3, 428, 439, 206, 208, 207, '', 'The Cartesian plane', 'Functions and Representations of Functions', '', 'temp/FBN1502/460.html', '460.html', '388,154,460', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/the-cartesian-plane'),
(461, 460, 47, 388, 4, 435, 436, 209, 211, 210, '', 'Direction - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/461.html', '461.html', '388,154,460,461', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/the-cartesian-plane/direction---activity'),
(462, 460, 47, 388, 4, 437, 438, 211, 213, 212, '', 'Coordinates - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/462.html', '462.html', '388,154,460,462', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/the-cartesian-plane/coordinates---activity'),
(463, 154, 47, 388, 3, 440, 445, 213, 215, 214, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/463.html', '463.html', '388,154,463', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/exercise'),
(464, 463, 47, 388, 4, 443, 444, 215, 217, 216, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/464.html', '464.html', '388,154,463,464', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/exercise/exercise'),
(465, 154, 47, 388, 3, 446, 451, 216, 218, 217, '', 'Assignment', 'Functions and Representations of Functions', '', 'temp/FBN1502/465.html', '465.html', '388,154,465', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/assignment'),
(466, 465, 47, 388, 4, 449, 450, 218, 220, 219, '', 'Questions', 'Functions and Representations of Functions', '', 'temp/FBN1502/466.html', '466.html', '388,154,465,466', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/definition-of-functions/assignment/questions'),
(467, 155, 47, 388, 3, 458, 459, 220, 222, 221, '', 'Learning objectives', 'Functions and Representations of Functions', '', 'temp/FBN1502/467.html', '467.html', '388,155,467', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/learning-objectives'),
(468, 155, 47, 388, 3, 460, 473, 221, 223, 222, '', 'Characteristics', 'Functions and Representations of Functions', '', 'temp/FBN1502/468.html', '468.html', '388,155,468', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics'),
(469, 468, 47, 388, 4, 471, 472, 227, 229, 228, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/469.html', '469.html', '388,155,468,469', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/characteristics/activity'),
(470, 155, 47, 388, 3, 474, 481, 228, 230, 229, '', 'Draw the graph', 'Functions and Representations of Functions', '', 'temp/FBN1502/470.html', '470.html', '388,155,470', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/draw-the-graph'),
(471, 470, 47, 388, 4, 479, 480, 231, 233, 232, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/471.html', '471.html', '388,155,470,471', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/draw-the-graph/activity'),
(475, 155, 47, 388, 3, 482, 495, 232, 234, 233, '', 'Slope', 'Functions and Representations of Functions', '', 'temp/FBN1502/475.html', '475.html', '388,155,475', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope'),
(476, 475, 47, 388, 4, 491, 492, 237, 239, 238, '', 'Four cases - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/476.html', '476.html', '388,155,475,476', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope/four-cases---activity'),
(477, 475, 47, 388, 4, 493, 494, 238, 240, 239, '', '3/4; 4/3 - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/477.html', '477.html', '388,155,475,477', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/slope/34-43---activity'),
(478, 155, 47, 388, 3, 496, 505, 239, 241, 240, '', 'Determine equation', 'Functions and Representations of Functions', '', 'temp/FBN1502/478.html', '478.html', '388,155,478', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/determine-equation'),
(479, 478, 47, 388, 4, 501, 502, 241, 243, 242, '', 'Activity 1', 'Functions and Representations of Functions', '', 'temp/FBN1502/479.html', '479.html', '388,155,478,479', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/determine-equation/activity-1'),
(480, 478, 47, 388, 4, 503, 504, 243, 245, 244, '', 'Activity 2', 'Functions and Representations of Functions', '', 'temp/FBN1502/480.html', '480.html', '388,155,478,480', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/determine-equation/activity-2'),
(483, 155, 47, 388, 3, 506, 515, 244, 246, 245, '', 'Special case: b = 0', 'Functions and Representations of Functions', '', 'temp/FBN1502/483.html', '483.html', '388,155,483', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-b-0'),
(484, 483, 47, 388, 4, 513, 514, 248, 250, 249, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/484.html', '484.html', '388,155,483,484', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-b-0/activity'),
(485, 155, 47, 388, 3, 516, 525, 249, 251, 250, '', 'Special case: a = 0', 'Functions and Representations of Functions', '', 'temp/FBN1502/485.html', '485.html', '388,155,485', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-a-0'),
(486, 485, 47, 388, 4, 523, 524, 253, 255, 254, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/486.html', '486.html', '388,155,485,486', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-a-0/activity'),
(487, 155, 47, 388, 3, 526, 535, 254, 256, 255, '', 'Special case: Parallel to y-axis', 'Functions and Representations of Functions', '', 'temp/FBN1502/487.html', '487.html', '388,155,487', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-parallel-to-y-axis'),
(488, 487, 47, 388, 4, 533, 534, 258, 260, 259, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/488.html', '488.html', '388,155,487,488', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/special-case-parallel-to-y-axis/activity'),
(489, 155, 47, 388, 3, 536, 537, 260, 262, 261, '', 'Recap - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/489.html', '489.html', '388,155,489', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/recap---activity'),
(490, 155, 47, 388, 3, 538, 543, 262, 264, 263, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/490.html', '490.html', '388,155,490', 12, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/exercise'),
(491, 490, 47, 388, 4, 541, 542, 264, 266, 265, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/491.html', '491.html', '388,155,490,491', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/exercise/exercise'),
(492, 155, 47, 388, 3, 544, 549, 265, 267, 266, '', 'Assignment', 'Functions and Representations of Functions', '', 'temp/FBN1502/492.html', '492.html', '388,155,492', 13, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/assignment'),
(493, 492, 47, 388, 4, 547, 548, 267, 269, 268, '', 'Questions', 'Functions and Representations of Functions', '', 'temp/FBN1502/493.html', '493.html', '388,155,492,493', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/linear-functions/assignment/questions'),
(494, 158, 47, 388, 3, 610, 611, 269, 271, 270, '', 'Learning objectives', 'Functions and Representations of Functions', '', 'temp/FBN1502/494.html', '494.html', '388,158,494', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/learning-objectives'),
(495, 158, 47, 388, 3, 612, 617, 270, 272, 271, '', 'Introduction', 'Functions and Representations of Functions', '', 'temp/FBN1502/495.html', '495.html', '388,158,495', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/introduction'),
(496, 158, 47, 388, 3, 618, 623, 273, 275, 274, '', 'Equation', 'Functions and Representations of Functions', '', 'temp/FBN1502/496.html', '496.html', '388,158,496', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/equation'),
(497, 496, 47, 388, 4, 621, 622, 275, 277, 276, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/497.html', '497.html', '388,158,496,497', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/equation/activity'),
(498, 158, 47, 388, 3, 624, 631, 277, 279, 278, '', 'Vertex', 'Functions and Representations of Functions', '', 'temp/FBN1502/498.html', '498.html', '388,158,498', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/vertex'),
(499, 498, 47, 388, 4, 629, 630, 280, 282, 281, '', 'Coordinates - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/499.html', '499.html', '388,158,498,499', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/vertex/coordinates---activity'),
(500, 158, 47, 388, 3, 632, 639, 281, 283, 282, '', 'Intercepts', 'Functions and Representations of Functions', '', 'temp/FBN1502/500.html', '500.html', '388,158,500', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/intercepts'),
(501, 500, 47, 388, 4, 637, 638, 284, 286, 285, '', 'Intercepts - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/501.html', '501.html', '388,158,500,501', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/intercepts/intercepts---activity'),
(502, 158, 47, 388, 3, 640, 651, 285, 287, 286, '', 'Discriminant', 'Functions and Representations of Functions', '', 'temp/FBN1502/502.html', '502.html', '388,158,502', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/discriminant'),
(503, 502, 47, 388, 4, 647, 648, 289, 291, 290, '', 'Specific cases - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/503.html', '503.html', '388,158,502,503', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/discriminant/specific-cases---activity'),
(504, 502, 47, 388, 4, 649, 650, 290, 292, 291, '', 'Recap - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/504.html', '504.html', '388,158,502,504', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/discriminant/recap---activity'),
(505, 158, 47, 388, 3, 652, 659, 291, 293, 292, '', 'Draw the graph', 'Functions and Representations of Functions', '', 'temp/FBN1502/505.html', '505.html', '388,158,505', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/draw-the-graph'),
(506, 505, 47, 388, 4, 657, 658, 294, 296, 295, '', 'Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/506.html', '506.html', '388,158,505,506', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/draw-the-graph/activity'),
(507, 158, 47, 388, 3, 660, 661, 295, 297, 296, '', 'Activity - Changes in a, b and c', 'Functions and Representations of Functions', '', 'temp/FBN1502/507.html', '507.html', '388,158,507', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/activity---changes-in-a-b-and-c'),
(508, 158, 47, 388, 3, 662, 667, 296, 298, 297, '', 'Slope', 'Functions and Representations of Functions', '', 'temp/FBN1502/508.html', '508.html', '388,158,508', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/slope'),
(509, 158, 47, 388, 3, 668, 673, 300, 302, 301, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/509.html', '509.html', '388,158,509', 12, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/exercise'),
(510, 509, 47, 388, 4, 671, 672, 302, 304, 303, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/510.html', '510.html', '388,158,509,510', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/exercise/exercise'),
(511, 158, 47, 388, 3, 674, 679, 303, 305, 304, '', 'Assignment', 'Functions and Representations of Functions', '', 'temp/FBN1502/511.html', '511.html', '388,158,511', 13, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/assignment'),
(512, 511, 47, 388, 4, 677, 678, 305, 307, 306, '', 'Questions', 'Functions and Representations of Functions', '', 'temp/FBN1502/512.html', '512.html', '388,158,511,512', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/quadratic-functions/assignment/questions'),
(513, 157, 47, 388, 3, 554, 555, 307, 309, 308, '', 'Learning objectives', 'Functions and Representations of Functions', '', 'temp/FBN1502/513.html', '513.html', '388,157,513', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/learning-objectives'),
(514, 157, 47, 388, 3, 556, 575, 308, 310, 309, '', 'Exponential functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/514.html', '514.html', '388,157,514', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions'),
(515, 514, 47, 388, 4, 571, 572, 313, 315, 314, '', 'x &gt; 0; x &lt; 0 - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/515.html', '515.html', '388,157,514,515', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/x-0-x-0---activity'),
(516, 514, 47, 388, 4, 573, 574, 316, 318, 317, '', 'a &gt; 1;  0 &lt; a &lt; 1 - Activity', 'Functions and Representations of Functions', '', 'temp/FBN1502/516.html', '516.html', '388,157,514,516', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exponential-functions/a-1-0-a-1---activity'),
(517, 157, 47, 388, 3, 576, 591, 318, 320, 319, '', 'Logarithmic functions', 'Functions and Representations of Functions', '', 'temp/FBN1502/517.html', '517.html', '388,157,517', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions'),
(518, 517, 47, 388, 4, 587, 588, 322, 324, 323, '', 'Activity 1', 'Functions and Representations of Functions', '', 'temp/FBN1502/518.html', '518.html', '388,157,517,518', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/activity-1'),
(519, 517, 47, 388, 4, 589, 590, 323, 325, 324, '', 'Activity 2', 'Functions and Representations of Functions', '', 'temp/FBN1502/519.html', '519.html', '388,157,517,519', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/logarithmic-functions/activity-2'),
(520, 157, 47, 388, 3, 592, 597, 327, 329, 328, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/520.html', '520.html', '388,157,520', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exercise'),
(521, 520, 47, 388, 4, 595, 596, 329, 331, 330, '', 'Exercise', 'Functions and Representations of Functions', '', 'temp/FBN1502/521.html', '521.html', '388,157,520,521', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/exercise/exercise'),
(522, 157, 47, 388, 3, 598, 603, 330, 332, 331, '', 'Assignment', 'Functions and Representations of Functions', '', 'temp/FBN1502/522.html', '522.html', '388,157,522', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/assignment'),
(523, 522, 47, 388, 4, 601, 602, 332, 334, 333, '', 'Questions', 'Functions and Representations of Functions', '', 'temp/FBN1502/523.html', '523.html', '388,157,522,523', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/functions-and-representations-of-functions/exponential-and-logarithmic-functions/assignment/questions'),
(524, 162, 47, 389, 3, 686, 687, 335, 337, 336, '', 'Learning objectives', 'Linear Systems', '', 'temp/FBN1502/524.html', '524.html', '389,162,524', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/learning-objectives'),
(525, 162, 47, 389, 3, 688, 701, 336, 338, 337, '', 'Solve', 'Linear Systems', '', 'temp/FBN1502/525.html', '525.html', '389,162,525', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve'),
(526, 525, 47, 389, 4, 697, 698, 341, 343, 342, '', 'Step-by-step - Activity', 'Linear Systems', '', 'temp/FBN1502/526.html', '526.html', '389,162,525,526', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve/step-by-step---activity'),
(527, 525, 47, 389, 4, 699, 700, 342, 344, 343, '', 'Now you try - Activity', 'Linear Systems', '', 'temp/FBN1502/527.html', '527.html', '389,162,525,527', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve/now-you-try---activity'),
(528, 162, 47, 389, 3, 702, 707, 343, 345, 344, '', 'Word problems', 'Linear Systems', '', 'temp/FBN1502/528.html', '528.html', '389,162,528', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/word-problems'),
(529, 528, 47, 389, 4, 705, 706, 345, 347, 346, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/529.html', '529.html', '389,162,528,529', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/word-problems/activity'),
(530, 162, 47, 389, 3, 708, 713, 346, 348, 347, '', 'Solve by  x-intercept', 'Linear Systems', '', 'temp/FBN1502/530.html', '530.html', '389,162,530', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve-by-x-intercept'),
(531, 530, 47, 389, 4, 711, 712, 348, 350, 349, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/531.html', '531.html', '389,162,530,531', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/solve-by-x-intercept/activity'),
(532, 162, 47, 389, 3, 714, 719, 350, 352, 351, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/532.html', '532.html', '389,162,532', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/exercise'),
(533, 532, 47, 389, 4, 717, 718, 352, 354, 353, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/533.html', '533.html', '389,162,532,533', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/exercise/exercise'),
(534, 162, 47, 389, 3, 720, 725, 353, 355, 354, '', 'Assignment', 'Linear Systems', '', 'temp/FBN1502/534.html', '534.html', '389,162,534', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/assignment'),
(535, 534, 47, 389, 4, 723, 724, 355, 357, 356, '', 'Questions', 'Linear Systems', '', 'temp/FBN1502/535.html', '535.html', '389,162,534,535', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/linear-equations-in-one-variable/assignment/questions'),
(536, 163, 47, 389, 3, 730, 731, 357, 359, 358, '', 'Learning objectives', 'Linear Systems', '', 'temp/FBN1502/536.html', '536.html', '389,163,536', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/learning-objectives'),
(537, 163, 47, 389, 3, 732, 737, 358, 360, 359, '', 'Systems of equations', 'Linear Systems', '', 'temp/FBN1502/537.html', '537.html', '389,163,537', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/systems-of-equations'),
(538, 163, 47, 389, 3, 738, 743, 361, 363, 362, '', 'Solve: Graphing', 'Linear Systems', '', 'temp/FBN1502/538.html', '538.html', '389,163,538', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-graphing'),
(539, 538, 47, 389, 4, 741, 742, 363, 365, 364, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/539.html', '539.html', '389,163,538,539', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-graphing/activity'),
(540, 163, 47, 389, 3, 744, 751, 364, 366, 365, '', 'Solve: Substitution', 'Linear Systems', '', 'temp/FBN1502/540.html', '540.html', '389,163,540', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:21', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-substitution'),
(541, 540, 47, 389, 4, 749, 750, 367, 369, 368, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/541.html', '541.html', '389,163,540,541', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-substitution/activity'),
(542, 163, 47, 389, 3, 752, 759, 368, 370, 369, '', 'Solve: Elimination', 'Linear Systems', '', 'temp/FBN1502/542.html', '542.html', '389,163,542', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-elimination'),
(543, 542, 47, 389, 4, 757, 758, 371, 373, 372, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/543.html', '543.html', '389,163,542,543', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-elimination/activity'),
(544, 163, 47, 389, 3, 760, 761, 372, 374, 373, '', 'Solve: Any method - Activity', 'Linear Systems', '', 'temp/FBN1502/544.html', '544.html', '389,163,544', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/solve-any-method---activity'),
(545, 163, 47, 389, 3, 762, 767, 373, 375, 374, '', 'Word problems', 'Linear Systems', '', 'temp/FBN1502/545.html', '545.html', '389,163,545', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/word-problems'),
(546, 545, 47, 389, 4, 765, 766, 375, 377, 376, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/546.html', '546.html', '389,163,545,546', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/word-problems/activity'),
(547, 163, 47, 389, 3, 768, 773, 377, 379, 378, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/547.html', '547.html', '389,163,547', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/exercise'),
(548, 547, 47, 389, 4, 771, 772, 379, 381, 380, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/548.html', '548.html', '389,163,547,548', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/exercise/exercise'),
(549, 163, 47, 389, 3, 774, 779, 380, 382, 381, '', 'Assignment', 'Linear Systems', '', 'temp/FBN1502/549.html', '549.html', '389,163,549', 10, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/assignment'),
(550, 549, 47, 389, 4, 777, 778, 382, 384, 383, '', 'Questions', 'Linear Systems', '', 'temp/FBN1502/550.html', '550.html', '389,163,549,550', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-equations-in-two-variables/assignment/questions'),
(551, 166, 47, 389, 3, 784, 785, 384, 386, 385, '', 'Learning objectives', 'Linear Systems', '', 'temp/FBN1502/551.html', '551.html', '389,166,551', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/learning-objectives'),
(552, 166, 47, 389, 3, 786, 791, 385, 387, 386, '', 'Introduction', 'Linear Systems', '', 'temp/FBN1502/552.html', '552.html', '389,166,552', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/introduction'),
(553, 166, 47, 389, 3, 792, 803, 388, 390, 389, '', 'Solve', 'Linear Systems', '', 'temp/FBN1502/553.html', '553.html', '389,166,553', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/solve'),
(554, 553, 47, 389, 4, 801, 802, 393, 395, 394, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/554.html', '554.html', '389,166,553,554', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/solve/activity'),
(555, 166, 47, 389, 3, 804, 813, 394, 396, 395, '', 'Miscellaneous', 'Linear Systems', '', 'temp/FBN1502/555.html', '555.html', '389,166,555', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/miscellaneous'),
(556, 555, 47, 389, 4, 811, 812, 398, 400, 399, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/556.html', '556.html', '389,166,555,556', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/miscellaneous/activity'),
(557, 166, 47, 389, 3, 814, 821, 399, 401, 400, '', 'Word problems', 'Linear Systems', '', 'temp/FBN1502/557.html', '557.html', '389,166,557', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/word-problems'),
(558, 557, 47, 389, 4, 819, 820, 402, 404, 403, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/558.html', '558.html', '389,166,557,558', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/word-problems/activity'),
(559, 166, 47, 389, 3, 822, 827, 404, 406, 405, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/559.html', '559.html', '389,166,559', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/exercise'),
(560, 166, 47, 389, 3, 828, 833, 407, 409, 408, '', 'Assignment', 'Linear Systems', '', 'temp/FBN1502/560.html', '560.html', '389,166,560', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/assignment'),
(561, 559, 47, 389, 4, 825, 826, 406, 408, 407, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/561.html', '561.html', '389,166,559,561', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/exercise/exercise'),
(562, 560, 47, 389, 4, 831, 832, 409, 411, 410, '', 'Questions', 'Linear Systems', '', 'temp/FBN1502/562.html', '562.html', '389,166,560,562', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/linear-inequalities-in-one-variable/assignment/questions'),
(563, 167, 47, 389, 3, 840, 841, 411, 413, 412, '', 'Learning objectives', 'Linear Systems', '', 'temp/FBN1502/563.html', '563.html', '389,167,563', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/learning-objectives'),
(564, 167, 47, 389, 3, 842, 853, 412, 414, 413, '', 'Linear inequality', 'Linear Systems', '', 'temp/FBN1502/564.html', '564.html', '389,167,564', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/linear-inequality'),
(565, 564, 47, 389, 4, 849, 850, 415, 417, 416, '', 'Activity 1', 'Linear Systems', '', 'temp/FBN1502/565.html', '565.html', '389,167,564,565', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/linear-inequality/activity-1'),
(567, 564, 47, 389, 4, 851, 852, 417, 419, 418, '', 'Activity 2', 'Linear Systems', '', 'temp/FBN1502/567.html', '567.html', '389,167,564,567', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/linear-inequality/activity-2'),
(568, 167, 47, 389, 3, 854, 863, 418, 420, 419, '', 'Systems of two linear inequalities', 'Linear Systems', '', 'temp/FBN1502/568.html', '568.html', '389,167,568', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-two-linear-inequalities'),
(569, 568, 47, 389, 4, 859, 860, 420, 422, 421, '', 'Activity 1', 'Linear Systems', '', 'temp/FBN1502/569.html', '569.html', '389,167,568,569', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-two-linear-inequalities/activity-1'),
(572, 568, 47, 389, 4, 861, 862, 422, 424, 423, '', 'Activity 2', 'Linear Systems', '', 'temp/FBN1502/572.html', '572.html', '389,167,568,572', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-two-linear-inequalities/activity-2'),
(573, 167, 47, 389, 3, 864, 869, 423, 425, 424, '', 'Systems of more linear inequalities', 'Linear Systems', '', 'temp/FBN1502/573.html', '573.html', '389,167,573', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-more-linear-inequalities'),
(574, 573, 47, 389, 4, 867, 868, 425, 427, 426, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/574.html', '574.html', '389,167,573,574', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/systems-of-more-linear-inequalities/activity'),
(575, 167, 47, 389, 3, 870, 875, 426, 428, 427, '', 'Word problems', 'Linear Systems', '', 'temp/FBN1502/575.html', '575.html', '389,167,575', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/word-problems'),
(576, 575, 47, 389, 4, 873, 874, 428, 430, 429, '', 'Activity', 'Linear Systems', '', 'temp/FBN1502/576.html', '576.html', '389,167,575,576', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/word-problems/activity'),
(577, 167, 47, 389, 3, 876, 881, 431, 433, 432, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/577.html', '577.html', '389,167,577', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/exercise'),
(578, 577, 47, 389, 4, 879, 880, 433, 435, 434, '', 'Exercise', 'Linear Systems', '', 'temp/FBN1502/578.html', '578.html', '389,167,577,578', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/exercise/exercise'),
(579, 167, 47, 389, 3, 882, 887, 434, 436, 435, '', 'Assignment', 'Linear Systems', '', 'temp/FBN1502/579.html', '579.html', '389,167,579', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/assignment'),
(580, 579, 47, 389, 4, 885, 886, 436, 438, 437, '', 'Questions', 'Linear Systems', '', 'temp/FBN1502/580.html', '580.html', '389,167,579,580', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/linear-systems/systems-of-linear-inequalities-in-two-variables/assignment/questions'),
(581, 169, 47, 390, 3, 896, 897, 439, 441, 440, '', 'Learning objectives', 'An Application of Differentiation', '', 'temp/FBN1502/581.html', '581.html', '390,169,581', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/learning-objectives'),
(582, 169, 47, 390, 3, 898, 905, 440, 442, 441, '', 'Total, fixed and variable cost', 'An Application of Differentiation', '', 'temp/FBN1502/582.html', '582.html', '390,169,582', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/total-fixed-and-variable-cost'),
(583, 169, 47, 390, 3, 906, 911, 444, 446, 445, '', 'Marginal cost', 'An Application of Differentiation', '', 'temp/FBN1502/583.html', '583.html', '390,169,583', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/marginal-cost'),
(584, 169, 47, 390, 3, 912, 917, 447, 449, 448, '', 'Calculate - Table', 'An Application of Differentiation', '', 'temp/FBN1502/584.html', '584.html', '390,169,584', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---table'),
(585, 584, 47, 390, 4, 915, 916, 449, 451, 450, '', 'Activity', 'An Application of Differentiation', '', 'temp/FBN1502/585.html', '585.html', '390,169,584,585', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---table/activity'),
(586, 169, 47, 390, 3, 918, 929, 450, 452, 451, '', 'Calculate - Linear function', 'An Application of Differentiation', '', 'temp/FBN1502/586.html', '586.html', '390,169,586', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---linear-function'),
(587, 586, 47, 390, 4, 927, 928, 454, 456, 455, '', 'Activity', 'An Application of Differentiation', '', 'temp/FBN1502/587.html', '587.html', '390,169,586,587', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/calculate---linear-function/activity'),
(588, 169, 47, 390, 3, 930, 931, 457, 459, 458, '', 'Time for practice - Activity', 'An Application of Differentiation', '', 'temp/FBN1502/588.html', '588.html', '390,169,588', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/time-for-practice---activity'),
(589, 169, 47, 390, 3, 932, 939, 458, 460, 459, '', 'Derivatives and slope', 'An Application of Differentiation', '', 'temp/FBN1502/589.html', '589.html', '390,169,589', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/derivatives-and-slope'),
(590, 589, 47, 390, 4, 935, 936, 460, 462, 461, '', 'Activity 1', 'An Application of Differentiation', '', 'temp/FBN1502/590.html', '590.html', '390,169,589,590', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/derivatives-and-slope/activity-1'),
(591, 589, 47, 390, 4, 937, 938, 461, 463, 462, '', 'Activity 2', 'An Application of Differentiation', '', 'temp/FBN1502/591.html', '591.html', '390,169,589,591', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/derivatives-and-slope/activity-2'),
(592, 169, 47, 390, 3, 940, 949, 462, 464, 463, '', 'Non-linear function', 'An Application of Differentiation', '', 'temp/FBN1502/592.html', '592.html', '390,169,592', 9, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/non-linear-function'),
(593, 592, 47, 390, 4, 947, 948, 465, 467, 466, '', 'Farmer activity', 'An Application of Differentiation', '', 'temp/FBN1502/593.html', '593.html', '390,169,592,593', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/non-linear-function/farmer-activity'),
(594, 169, 47, 390, 3, 950, 955, 468, 470, 469, '', 'Exercise', 'An Application of Differentiation', '', 'temp/FBN1502/594.html', '594.html', '390,169,594', 11, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/exercise'),
(595, 594, 47, 390, 4, 953, 954, 470, 472, 471, '', 'Exercise', 'An Application of Differentiation', '', 'temp/FBN1502/595.html', '595.html', '390,169,594,595', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/exercise/exercise'),
(596, 169, 47, 390, 3, 956, 961, 471, 473, 472, '', 'Assignment', 'An Application of Differentiation', '', 'temp/FBN1502/596.html', '596.html', '390,169,596', 12, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/assignment'),
(597, 596, 47, 390, 4, 959, 960, 473, 475, 474, '', 'Questions', 'An Application of Differentiation', '', 'temp/FBN1502/597.html', '597.html', '390,169,596,597', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-cost/assignment/questions'),
(598, 171, 47, 390, 3, 966, 967, 475, 477, 476, '', 'Learning objectives', 'An Application of Differentiation', '', 'temp/FBN1502/598.html', '598.html', '390,171,598', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/learning-objectives'),
(599, 171, 47, 390, 3, 968, 975, 476, 478, 477, '', 'Profit', 'An Application of Differentiation', '', 'temp/FBN1502/599.html', '599.html', '390,171,599', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/profit'),
(600, 599, 47, 390, 4, 973, 974, 478, 480, 479, '', 'Activity', 'An Application of Differentiation', '', 'temp/FBN1502/600.html', '600.html', '390,171,599,600', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/profit/activity'),
(602, 171, 47, 390, 3, 976, 981, 480, 482, 481, '', 'Marginal profit', 'An Application of Differentiation', '', 'temp/FBN1502/602.html', '602.html', '390,171,602', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-profit'),
(603, 171, 47, 390, 3, 982, 989, 483, 485, 484, '', 'Marginal functions', 'An Application of Differentiation', '', 'temp/FBN1502/603.html', '603.html', '390,171,603', 4, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-functions'),
(604, 603, 47, 390, 4, 987, 988, 486, 488, 487, '', 'Activity', 'An Application of Differentiation', '', 'temp/FBN1502/604.html', '604.html', '390,171,603,604', 3, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/marginal-functions/activity'),
(605, 171, 47, 390, 3, 990, 991, 487, 489, 488, '', 'Time for practice - Activity', 'An Application of Differentiation', '', 'temp/FBN1502/605.html', '605.html', '390,171,605', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/time-for-practice---activity'),
(606, 171, 47, 390, 3, 992, 997, 489, 491, 490, '', 'Exercise', 'An Application of Differentiation', '', 'temp/FBN1502/606.html', '606.html', '390,171,606', 7, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/exercise'),
(607, 606, 47, 390, 4, 995, 996, 491, 493, 492, '', 'Exercise', 'An Application of Differentiation', '', 'temp/FBN1502/607.html', '607.html', '390,171,606,607', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/exercise/exercise'),
(608, 171, 47, 390, 3, 998, 1003, 492, 494, 493, '', 'Assignment', 'An Application of Differentiation', '', 'temp/FBN1502/608.html', '608.html', '390,171,608', 8, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/assignment'),
(609, 608, 47, 390, 4, 1001, 1002, 494, 496, 495, '', 'Questions', 'An Application of Differentiation', '', 'temp/FBN1502/609.html', '609.html', '390,171,608,609', 2, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/an-application-of-differentiation/marginal-profit/assignment/questions'),
(612, 156, 47, 156, 2, 11, 12, -1, 1, 0, '', 'reset_scores', '', '', 'temp/FBN1502/612.html', '612.html', '156,612', 5, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages/reset_scores'),
(613, 156, 47, 156, 2, 13, 14, -1, 1, 0, '', 'page_ordering', '', '', 'temp/FBN1502/613.html', '613.html', '156,613', 6, '2017-04-21 02:01:37', '2017-05-12 15:31:22', '', '/other-test-pages/page_ordering'),
(614, 616, 47, 0, 1, 1006, 1009, 0, 2, 1, '', 'Welcome', '', '', 'temp/FBN1502/614.html', '614.html', '614', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/welcome'),
(615, 614, 47, 614, 2, 1007, 1008, 1, 3, 2, '', 'Please select here for instructions before proceeding', '', '', 'temp/FBN1502/615.html', '615.html', '614,615', 1, '2017-04-21 02:01:37', '2017-05-12 15:31:20', '', '/welcome/please-select-here-for-instructions-before-proceeding'),
(616, NULL, 47, NULL, 0, 1, 1010, NULL, NULL, 0, NULL, 'FBN1502 Business Numerical Skills B', NULL, NULL, NULL, NULL, NULL, NULL, '2017-04-30 12:13:05', '2017-05-12 15:31:20', NULL, NULL),
(1079, 10341, 55, 10341, 1, 3, 4, -1, 1, 0, NULL, 'Unlock_all_pages', '', '', 'temp/FBN1501/1079.html', '1079.html', '341,79', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages/unlock_all_pages'),
(1080, 10344, 55, 10344, 1, 769, 830, 373, 375, 374, NULL, 'Data collection', 'Collection, presentation and description of data', '', 'temp/FBN1501/1080.html', '1080.html', '344,80', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection'),
(1081, 10555, 55, 10344, 3, 773, 774, 376, 378, 377, NULL, 'Statistics', '', '', 'temp/FBN1501/1081.html', '1081.html', '344,80,555,81', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/introduction/statistics'),
(1082, 10555, 55, 10344, 3, 775, 776, 377, 379, 378, NULL, 'Descriptive statistics', '', '', 'temp/FBN1501/1082.html', '1082.html', '344,80,555,82', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/introduction/descriptive-statistics'),
(1083, 10555, 55, 10344, 3, 777, 778, 378, 380, 379, NULL, 'Video', '', '', 'temp/FBN1501/1083.html', '1083.html', '344,80,555,83', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/introduction/video'),
(1084, 10555, 55, 10344, 3, 779, 780, 379, 381, 380, NULL, 'Key definitions', '', '', 'temp/FBN1501/1084.html', '1084.html', '344,80,555,84', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/introduction/key-definitions'),
(1085, 10343, 55, 10343, 1, 613, 688, 299, 301, 300, NULL, 'Index numbers', 'Index and number transformations', '', 'temp/FBN1501/1085.html', '1085.html', '343,85', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers'),
(1086, 10520, 55, 10343, 3, 617, 618, 303, 305, 304, NULL, 'Formula', '', '', 'temp/FBN1501/1086.html', '1086.html', '343,85,520,86', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/index-numbers-and-transformations/index-numbers/simple-index/formula'),
(1087, 10522, 55, 10343, 3, 625, 626, 307, 309, 308, NULL, 'Example', '', '', 'temp/FBN1501/1087.html', '1087.html', '343,85,522,87', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/composite-index/example'),
(1088, 10520, 55, 10343, 3, 619, 620, 302, 304, 303, NULL, 'Video', '', '', 'temp/FBN1501/1088.html', '1088.html', '343,85,520,88', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/index-numbers-and-transformations/index-numbers/simple-index/video'),
(1089, 10522, 55, 10343, 3, 627, 628, 306, 308, 307, NULL, 'Video', '', '', 'temp/FBN1501/1089.html', '1089.html', '343,85,522,89', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/composite-index/video'),
(1090, 10523, 55, 10343, 3, 631, 632, 309, 311, 310, NULL, 'Video', '', '', 'temp/FBN1501/1090.html', '1090.html', '343,85,523,90', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/weighted-composite-index-wci/video'),
(1091, 10523, 55, 10343, 3, 633, 634, 310, 312, 311, NULL, 'Example', '', '', 'temp/FBN1501/1091.html', '1091.html', '343,85,523,91', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/weighted-composite-index-wci/example'),
(1092, 10525, 55, 10343, 3, 639, 640, 313, 315, 314, NULL, 'Video', '', '', 'temp/FBN1501/1092.html', '1092.html', '343,85,525,92', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---laspeyres-and-paasche/video'),
(1093, 10525, 55, 10343, 3, 641, 642, 314, 316, 315, NULL, 'Formulas', '', '', 'temp/FBN1501/1093.html', '1093.html', '343,85,525,93', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---laspeyres-and-paasche/formulas'),
(1095, 10525, 55, 10343, 3, 643, 644, 316, 318, 317, NULL, 'Interpretation', '', '', 'temp/FBN1501/1095.html', '1095.html', '343,85,525,95', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---laspeyres-and-paasche/interpretation'),
(1096, 10525, 55, 10343, 3, 645, 646, 317, 319, 318, NULL, 'Video - Choice', '', '', 'temp/FBN1501/1096.html', '1096.html', '343,85,525,96', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---laspeyres-and-paasche/video---choice');
INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(1097, 10342, 55, 10342, 1, 17, 54, 1, 3, 2, NULL, 'Priorities', 'Numbers and working with numbers', '', 'temp/FBN1501/1097.html', '1097.html', '342,97', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities'),
(1098, 10527, 55, 10343, 3, 651, 652, 319, 321, 320, NULL, 'Formula', '', '', 'temp/FBN1501/1098.html', '1098.html', '343,85,527,98', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---value-index/formula'),
(1099, 10342, 55, 10342, 1, 55, 82, 20, 22, 21, NULL, 'Variables', 'Numbers and working with numbers', '', 'temp/FBN1501/1099.html', '1099.html', '342,99', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/variables'),
(10100, 10342, 55, 10342, 1, 83, 126, 34, 36, 35, NULL, 'Laws of operations', 'Numbers and working with numbers', '', 'temp/FBN1501/10100.html', '10100.html', '342,100', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations'),
(10101, 10529, 55, 10343, 3, 659, 660, 322, 324, 323, NULL, 'Activity 1 info', '', '', 'temp/FBN1501/10101.html', '10101.html', '343,85,529,101', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi/activity-1-info'),
(10102, 10342, 55, 10342, 1, 127, 184, 56, 58, 57, NULL, 'Fractions 1', 'Numbers and working with numbers', '', 'temp/FBN1501/10102.html', '10102.html', '342,102', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1'),
(10103, 10342, 55, 10342, 1, 185, 252, 165, 167, 166, NULL, 'Roots', 'Numbers and working with numbers', '', 'temp/FBN1501/10103.html', '10103.html', '342,103', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots'),
(10104, 10342, 55, 10342, 1, 253, 324, 199, 201, 200, NULL, 'Ratios, proportions and percentages', 'Numbers and working with numbers', '', 'temp/FBN1501/10104.html', '10104.html', '342,104', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages'),
(10105, 10342, 55, 10342, 1, 325, 398, 235, 237, 236, NULL, 'Signs, notations and counting rules', 'Numbers and working with numbers', '', 'temp/FBN1501/10105.html', '10105.html', '342,105', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules'),
(10106, 10342, 55, 10342, 1, 399, 450, 272, 274, 273, NULL, 'Units and measures', 'Numbers and working with numbers', '', 'temp/FBN1501/10106.html', '10106.html', '342,106', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures'),
(10107, 10344, 55, 10344, 1, 831, 922, 404, 406, 405, NULL, 'Presentations', 'Collection, presentation and description of data', '', 'temp/FBN1501/10107.html', '10107.html', '344,107', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations'),
(10108, 10344, 55, 10344, 1, 923, 996, 450, 452, 451, NULL, 'Measures of locality', 'Collection, presentation and description of data', '', 'temp/FBN1501/10108.html', '10108.html', '344,108', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality'),
(10109, 10344, 55, 10344, 1, 997, 1074, 487, 489, 488, NULL, 'Measures of dispersion and box-and-whiskers diagram', 'Collection, presentation and description of data', '', 'temp/FBN1501/10109.html', '10109.html', '344,109', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram'),
(10110, 10353, 55, 10342, 3, 43, 44, 15, 17, 16, NULL, 'Instructions', '', '', 'temp/FBN1501/10110.html', '10110.html', '342,97,353,110', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/exercise/instructions'),
(10111, 10361, 55, 10342, 3, 71, 72, 29, 31, 30, NULL, 'Instructions', '', '', 'temp/FBN1501/10111.html', '10111.html', '342,99,361,111', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/exercise/instructions'),
(10112, 10374, 55, 10342, 3, 115, 116, 51, 53, 52, NULL, 'Instructions', '', '', 'temp/FBN1501/10112.html', '10112.html', '342,100,374,112', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/exercise/instructions'),
(10113, 10410, 55, 10342, 3, 521, 522, 123, 125, 124, NULL, 'Instructions', '', '', 'temp/FBN1501/10113.html', '10113.html', '342,378,410,113', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/exercise/instructions'),
(10114, 10460, 55, 10342, 3, 241, 242, 194, 196, 195, NULL, 'Instructions', '', '', 'temp/FBN1501/10114.html', '10114.html', '342,103,460,114', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/exercise/instructions'),
(10115, 10481, 55, 10342, 3, 313, 314, 230, 232, 231, NULL, 'Instructions', '', '', 'temp/FBN1501/10115.html', '10115.html', '342,104,481,115', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/exercise/instructions'),
(10116, 10500, 55, 10342, 3, 387, 388, 267, 269, 268, NULL, 'Instructions', '', '', 'temp/FBN1501/10116.html', '10116.html', '342,105,500,116', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/exercise/instructions'),
(10117, 10513, 55, 10342, 3, 439, 440, 293, 295, 294, NULL, 'Instructions', '', '', 'temp/FBN1501/10117.html', '10117.html', '342,106,513,117', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/exercise/instructions'),
(10118, 10550, 55, 10343, 3, 753, 754, 367, 369, 368, NULL, 'Instructions', '', '', 'temp/FBN1501/10118.html', '10118.html', '343,517,550,118', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/exercise/instructions'),
(10119, 10562, 55, 10344, 3, 819, 820, 399, 401, 400, NULL, 'Instructions', '', '', 'temp/FBN1501/10119.html', '10119.html', '344,80,562,119', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/exercise/instructions'),
(10120, 10588, 55, 10344, 3, 911, 912, 445, 447, 446, NULL, 'Instructions', '', '', 'temp/FBN1501/10120.html', '10120.html', '344,107,588,120', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/exercise/instructions'),
(10121, 10608, 55, 10344, 3, 985, 986, 482, 484, 483, NULL, 'Instructions', '', '', 'temp/FBN1501/10121.html', '10121.html', '344,108,608,121', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/exercise/instructions'),
(10122, 10626, 55, 10344, 3, 1063, 1064, 521, 523, 522, NULL, 'Instructions', '', '', 'temp/FBN1501/10122.html', '10122.html', '344,109,626,122', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/exercise/instructions'),
(10123, 10355, 55, 10342, 3, 49, 50, 18, 20, 19, NULL, 'Information', '', '', 'temp/FBN1501/10123.html', '10123.html', '342,97,355,123', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/assignment/information'),
(10124, 10363, 55, 10342, 3, 77, 78, 32, 34, 33, NULL, 'Information', '', '', 'temp/FBN1501/10124.html', '10124.html', '342,99,363,124', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/assignment/information'),
(10125, 10376, 55, 10342, 3, 121, 122, 54, 56, 55, NULL, 'Information', '', '', 'temp/FBN1501/10125.html', '10125.html', '342,100,376,125', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/assignment/information'),
(10126, 10411, 55, 10342, 3, 527, 528, 126, 128, 127, NULL, 'Information', '', '', 'temp/FBN1501/10126.html', '10126.html', '342,378,411,126', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/assignment/information'),
(10127, 10462, 55, 10342, 3, 247, 248, 197, 199, 198, NULL, 'Information', '', '', 'temp/FBN1501/10127.html', '10127.html', '342,103,462,127', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/assignment/information'),
(10128, 10483, 55, 10342, 3, 319, 320, 233, 235, 234, NULL, 'Information', '', '', 'temp/FBN1501/10128.html', '10128.html', '342,104,483,128', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/assignment/information'),
(10129, 10502, 55, 10342, 3, 393, 394, 270, 272, 271, NULL, 'Information', '', '', 'temp/FBN1501/10129.html', '10129.html', '342,105,502,129', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/assignment/information'),
(10130, 10515, 55, 10342, 3, 445, 446, 296, 298, 297, NULL, 'Information', '', '', 'temp/FBN1501/10130.html', '10130.html', '342,106,515,130', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/assignment/information'),
(10131, 10552, 55, 10343, 3, 761, 762, 370, 372, 371, NULL, 'Information', '', '', 'temp/FBN1501/10131.html', '10131.html', '343,517,552,131', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/assignment/information'),
(10132, 10564, 55, 10344, 3, 825, 826, 402, 404, 403, NULL, 'Information', '', '', 'temp/FBN1501/10132.html', '10132.html', '344,80,564,132', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/assignment/information'),
(10133, 10589, 55, 10344, 3, 917, 918, 448, 450, 449, NULL, 'Information', '', '', 'temp/FBN1501/10133.html', '10133.html', '344,107,589,133', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/assignment/information'),
(10134, 10610, 55, 10344, 3, 991, 992, 485, 487, 486, NULL, 'Information', '', '', 'temp/FBN1501/10134.html', '10134.html', '344,108,610,134', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/assignment/information'),
(10135, 10628, 55, 10344, 3, 1069, 1070, 524, 526, 525, NULL, 'Information', '', '', 'temp/FBN1501/10135.html', '10135.html', '344,109,628,135', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/assignment/information'),
(10136, 10346, 55, 10342, 3, 21, 22, 4, 6, 5, NULL, 'Order of operations', '', '', 'temp/FBN1501/10136.html', '10136.html', '342,97,346,136', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations/order-of-operations'),
(10137, 10346, 55, 10342, 3, 23, 24, 5, 7, 6, NULL, 'Video', '', '', 'temp/FBN1501/10137.html', '10137.html', '342,97,346,137', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations/video'),
(10138, 10351, 55, 10342, 3, 35, 36, 11, 13, 12, NULL, 'With and without', '', '', 'temp/FBN1501/10138.html', '10138.html', '342,97,351,138', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/brackets/with-and-without'),
(10139, 10351, 55, 10342, 3, 37, 38, 12, 14, 13, NULL, 'Example', '', '', 'temp/FBN1501/10139.html', '10139.html', '342,97,351,139', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/brackets/example'),
(10140, 10529, 55, 10343, 3, 661, 662, 323, 325, 324, NULL, 'Video 1', '', '', 'temp/FBN1501/10140.html', '10140.html', '343,85,529,140', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi/video-1'),
(10141, 10529, 55, 10343, 3, 663, 664, 324, 326, 325, NULL, 'Video 2', '', '', 'temp/FBN1501/10141.html', '10141.html', '343,85,529,141', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi/video-2'),
(10142, 10529, 55, 10343, 3, 665, 666, 326, 328, 327, NULL, 'Inflation', '', '', 'temp/FBN1501/10142.html', '10142.html', '343,85,529,142', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi/inflation'),
(10143, 10538, 55, 10343, 3, 693, 694, 337, 339, 338, NULL, 'Rebasing', '', '', 'temp/FBN1501/10143.html', '10143.html', '343,517,538,143', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/consumer-price-index/rebasing'),
(10144, 10538, 55, 10343, 3, 695, 696, 338, 340, 339, NULL, 'Real vs nominal', '', '', 'temp/FBN1501/10144.html', '10144.html', '343,517,538,144', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/consumer-price-index/real-vs-nominal'),
(10145, 10538, 55, 10343, 3, 697, 698, 340, 342, 341, NULL, 'Interpretation', '', '', 'temp/FBN1501/10145.html', '10145.html', '343,517,538,145', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/consumer-price-index/interpretation'),
(10146, 10541, 55, 10343, 3, 705, 706, 343, 345, 344, NULL, 'Activity 1 info', '', '', 'temp/FBN1501/10146.html', '10146.html', '343,517,541,146', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/exchange-rate/activity-1-info'),
(10147, 10541, 55, 10343, 3, 707, 708, 344, 346, 345, NULL, 'Video 1', '', '', 'temp/FBN1501/10147.html', '10147.html', '343,517,541,147', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/exchange-rate/video-1'),
(10148, 10541, 55, 10343, 3, 709, 710, 345, 347, 346, NULL, 'Video 2', '', '', 'temp/FBN1501/10148.html', '10148.html', '343,517,541,148', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/exchange-rate/video-2'),
(10149, 10544, 55, 10343, 3, 717, 718, 349, 351, 350, NULL, 'Activity 1 info', '', '', 'temp/FBN1501/10149.html', '10149.html', '343,517,544,149', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/fine-ounce/activity-1-info'),
(10150, 10544, 55, 10343, 3, 719, 720, 350, 352, 351, NULL, 'Video', '', '', 'temp/FBN1501/10150.html', '10150.html', '343,517,544,150', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/fine-ounce/video'),
(10151, 10547, 55, 10343, 3, 727, 728, 354, 356, 355, NULL, 'Activity 1 info', '', '', 'temp/FBN1501/10151.html', '10151.html', '343,517,547,151', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/activity-1-info'),
(10152, 10547, 55, 10343, 3, 729, 730, 355, 357, 356, NULL, 'Video', '', '', 'temp/FBN1501/10152.html', '10152.html', '343,517,547,152', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/video'),
(10153, 10547, 55, 10343, 3, 731, 732, 357, 359, 358, NULL, 'Video - Measure', '', '', 'temp/FBN1501/10153.html', '10153.html', '343,517,547,153', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/video---measure'),
(10154, 10547, 55, 10343, 3, 733, 734, 358, 360, 359, NULL, 'Measure growth rate', '', '', 'temp/FBN1501/10154.html', '10154.html', '343,517,547,154', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/measure-growth-rate'),
(10155, 10358, 55, 10342, 3, 59, 60, 23, 25, 24, NULL, 'Definition', '', '', 'temp/FBN1501/10155.html', '10155.html', '342,99,358,155', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/variables/definition'),
(10156, 10341, 55, 10341, 1, 5, 6, -1, 1, 0, NULL, 'Lock_all_pages', '', '', 'temp/FBN1501/10156.html', '10156.html', '341,156', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages/lock_all_pages'),
(10157, 10358, 55, 10342, 3, 61, 62, 26, 28, 27, NULL, 'Symbols', '', '', 'temp/FBN1501/10157.html', '10157.html', '342,99,358,157', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/variables/symbols'),
(10158, 10358, 55, 10342, 3, 63, 64, 27, 29, 28, NULL, 'Example', '', '', 'temp/FBN1501/10158.html', '10158.html', '342,99,358,158', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/variables/example'),
(10159, 10547, 55, 10343, 3, 735, 736, 359, 361, 360, NULL, 'Method 1', '', '', 'temp/FBN1501/10159.html', '10159.html', '343,517,547,159', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/method-1'),
(10160, 10547, 55, 10343, 3, 737, 738, 360, 362, 361, NULL, 'Method 2', '', '', 'temp/FBN1501/10160.html', '10160.html', '343,517,547,160', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/method-2'),
(10161, 10547, 55, 10343, 3, 739, 740, 361, 363, 362, NULL, 'Method 3', '', '', 'temp/FBN1501/10161.html', '10161.html', '343,517,547,161', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/method-3'),
(10163, 10547, 55, 10343, 3, 741, 742, 363, 365, 364, NULL, 'Methods summary', '', '', 'temp/FBN1501/10163.html', '10163.html', '343,517,547,163', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/methods-summary'),
(10164, 10366, 55, 10342, 3, 91, 92, 37, 39, 38, NULL, 'Definitions', '', '', 'temp/FBN1501/10164.html', '10164.html', '342,100,366,164', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/commutative-laws-and-x/definitions'),
(10165, 10547, 55, 10343, 3, 743, 744, 364, 366, 365, NULL, 'Comparison graph', '', '', 'temp/FBN1501/10165.html', '10165.html', '343,517,547,165', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/comparison-graph'),
(10166, 10366, 55, 10342, 3, 93, 94, 38, 40, 39, NULL, 'Examples', '', '', 'temp/FBN1501/10166.html', '10166.html', '342,100,366,166', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/commutative-laws-and-x/examples'),
(10167, 10367, 55, 10342, 3, 97, 98, 40, 42, 41, NULL, 'Definitions', '', '', 'temp/FBN1501/10167.html', '10167.html', '342,100,367,167', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/associative-laws-and-x/definitions'),
(10168, 10341, 55, 10341, 1, 7, 8, -1, 1, 0, NULL, 'TAO_demo', '', '', 'temp/FBN1501/10168.html', '10168.html', '341,168', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages/tao_demo'),
(10170, 10547, 55, 10343, 3, 745, 746, 365, 367, 366, NULL, 'GDP omits', '', '', 'temp/FBN1501/10170.html', '10170.html', '343,517,547,170', 12, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/gdp-omits'),
(10171, 10370, 55, 10342, 3, 105, 106, 44, 46, 45, NULL, 'Definition', '', '', 'temp/FBN1501/10171.html', '10171.html', '342,100,370,171', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/distributive-law/definition'),
(10172, 10100, 55, 10342, 2, 84, 85, 48, 50, 49, NULL, 'Summary of laws', '', '', 'temp/FBN1501/10172.html', '10172.html', '342,100,172', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/summary-of-laws'),
(10173, 10100, 55, 10342, 2, 86, 87, 49, 51, 50, NULL, 'Identity properties', '', '', 'temp/FBN1501/10173.html', '10173.html', '342,100,173', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/identity-properties'),
(10175, 10381, 55, 10342, 3, 131, 132, 59, 61, 60, NULL, 'Terminology', '', '', 'temp/FBN1501/10175.html', '10175.html', '342,102,381,175', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/fractions/terminology'),
(10176, 10381, 55, 10342, 3, 133, 134, 60, 62, 61, NULL, 'Definition', '', '', 'temp/FBN1501/10176.html', '10176.html', '342,102,381,176', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/fractions/definition'),
(10177, 10391, 55, 10342, 3, 155, 156, 71, 73, 72, NULL, 'Mixed to improper', '', '', 'temp/FBN1501/10177.html', '10177.html', '342,102,391,177', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/conversions/mixed-to-improper'),
(10178, 10396, 55, 10342, 3, 167, 168, 77, 79, 78, NULL, 'Definition', '', '', 'temp/FBN1501/10178.html', '10178.html', '342,102,396,178', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/reciprocal/definition'),
(10179, 10404, 55, 10342, 3, 455, 456, 88, 90, 89, NULL, 'GCF', '', '', 'temp/FBN1501/10179.html', '10179.html', '342,378,404,179', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/reducing/gcf'),
(10180, 10404, 55, 10342, 3, 457, 458, 89, 91, 90, NULL, 'Example', '', '', 'temp/FBN1501/10180.html', '10180.html', '342,378,404,180', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/reducing/example'),
(10181, 10404, 55, 10342, 3, 459, 460, 91, 93, 92, NULL, 'Video - Factor', '', '', 'temp/FBN1501/10181.html', '10181.html', '342,378,404,181', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/reducing/video---factor'),
(10182, 10404, 55, 10342, 3, 461, 462, 92, 94, 93, NULL, 'Recap', '', '', 'temp/FBN1501/10182.html', '10182.html', '342,378,404,182', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/reducing/recap'),
(10183, 10405, 55, 10342, 3, 467, 468, 94, 96, 95, NULL, 'Video - Part', '', '', 'temp/FBN1501/10183.html', '10183.html', '342,378,405,183', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/multiplication/video---part'),
(10184, 10405, 55, 10342, 3, 469, 470, 95, 97, 96, NULL, 'Video - Multiplication', '', '', 'temp/FBN1501/10184.html', '10184.html', '342,378,405,184', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/multiplication/video---multiplication'),
(10185, 10405, 55, 10342, 3, 471, 472, 96, 98, 97, NULL, 'Example', '', '', 'temp/FBN1501/10185.html', '10185.html', '342,378,405,185', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/multiplication/example'),
(10186, 10406, 55, 10342, 3, 477, 478, 99, 101, 100, NULL, 'Video - Part 1', '', '', 'temp/FBN1501/10186.html', '10186.html', '342,378,406,186', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/division/video---part-1'),
(10187, 10406, 55, 10342, 3, 479, 480, 100, 102, 101, NULL, 'Video - Part 2', '', '', 'temp/FBN1501/10187.html', '10187.html', '342,378,406,187', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/division/video---part-2'),
(10188, 10407, 55, 10342, 3, 485, 486, 104, 106, 105, NULL, 'Video', '', '', 'temp/FBN1501/10188.html', '10188.html', '342,378,407,188', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/addition/video'),
(10189, 10407, 55, 10342, 3, 487, 488, 105, 107, 106, NULL, 'Example', '', '', 'temp/FBN1501/10189.html', '10189.html', '342,378,407,189', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/addition/example'),
(10190, 10408, 55, 10342, 3, 493, 494, 108, 110, 109, NULL, 'Video', '', '', 'temp/FBN1501/10190.html', '10190.html', '342,378,408,190', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/subtraction/video'),
(10191, 10409, 55, 10342, 3, 499, 500, 112, 114, 113, NULL, 'Introduction 1', '', '', 'temp/FBN1501/10191.html', '10191.html', '342,378,409,191', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/introduction-1'),
(10192, 10409, 55, 10342, 3, 501, 502, 113, 115, 114, NULL, 'Introduction 2', '', '', 'temp/FBN1501/10192.html', '10192.html', '342,378,409,192', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/introduction-2'),
(10193, 10409, 55, 10342, 3, 503, 504, 114, 116, 115, NULL, 'Representation', '', '', 'temp/FBN1501/10193.html', '10193.html', '342,378,409,193', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/representation'),
(10194, 10409, 55, 10342, 3, 505, 506, 116, 118, 117, NULL, 'Decimals to fractions', '', '', 'temp/FBN1501/10194.html', '10194.html', '342,378,409,194', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/decimals-to-fractions'),
(10195, 10409, 55, 10342, 3, 507, 508, 117, 119, 118, NULL, 'Fractions to decimals', '', '', 'temp/FBN1501/10195.html', '10195.html', '342,378,409,195', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/fractions-to-decimals'),
(10196, 10409, 55, 10342, 3, 509, 510, 118, 120, 119, NULL, 'Rounding', '', '', 'temp/FBN1501/10196.html', '10196.html', '342,378,409,196', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/rounding'),
(10197, 10409, 55, 10342, 3, 511, 512, 121, 123, 122, NULL, 'Three types', '', '', 'temp/FBN1501/10197.html', '10197.html', '342,378,409,197', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/three-types'),
(10198, 10556, 55, 10344, 3, 783, 784, 381, 383, 382, NULL, 'Population vs sample', '', '', 'temp/FBN1501/10198.html', '10198.html', '344,80,556,198', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/sampling/population-vs-sample'),
(10199, 10556, 55, 10344, 3, 785, 786, 382, 384, 383, NULL, 'Sampling', '', '', 'temp/FBN1501/10199.html', '10199.html', '344,80,556,199', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/sampling/sampling'),
(10200, 10556, 55, 10344, 3, 787, 788, 383, 385, 384, NULL, '3 Types', '', '', 'temp/FBN1501/10200.html', '10200.html', '344,80,556,200', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/sampling/3-types'),
(10201, 10557, 55, 10344, 3, 791, 792, 385, 387, 386, NULL, 'Video 1', '', '', 'temp/FBN1501/10201.html', '10201.html', '344,80,557,201', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/simple-random-sampling/video-1'),
(10202, 10557, 55, 10344, 3, 793, 794, 386, 388, 387, NULL, 'Video 2', '', '', 'temp/FBN1501/10202.html', '10202.html', '344,80,557,202', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/simple-random-sampling/video-2'),
(10203, 10557, 55, 10344, 3, 795, 796, 387, 389, 388, NULL, 'Sample', '', '', 'temp/FBN1501/10203.html', '10203.html', '344,80,557,203', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/simple-random-sampling/sample'),
(10204, 10557, 55, 10344, 3, 797, 798, 388, 390, 389, NULL, 'Random selection', '', '', 'temp/FBN1501/10204.html', '10204.html', '344,80,557,204', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/simple-random-sampling/random-selection'),
(10205, 10559, 55, 10344, 3, 803, 804, 391, 393, 392, NULL, 'Video', '', '', 'temp/FBN1501/10205.html', '10205.html', '344,80,559,205', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/stratified-random-sampling/video'),
(10206, 10559, 55, 10344, 3, 805, 806, 392, 394, 393, NULL, 'Example', '', '', 'temp/FBN1501/10206.html', '10206.html', '344,80,559,206', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/stratified-random-sampling/example'),
(10207, 10561, 55, 10344, 3, 811, 812, 395, 397, 396, NULL, 'Method', '', '', 'temp/FBN1501/10207.html', '10207.html', '344,80,561,207', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/systematic-sampling/method'),
(10208, 10561, 55, 10344, 3, 813, 814, 396, 398, 397, NULL, 'Example', '', '', 'temp/FBN1501/10208.html', '10208.html', '344,80,561,208', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/systematic-sampling/example'),
(10209, 10561, 55, 10344, 3, 815, 816, 397, 399, 398, NULL, 'Dis- and -advantages', '', '', 'temp/FBN1501/10209.html', '10209.html', '344,80,561,209', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/systematic-sampling/dis--and--advantages'),
(10211, 10567, 55, 10344, 3, 835, 836, 407, 409, 408, NULL, 'Presentation', '', '', 'temp/FBN1501/10211.html', '10211.html', '344,107,567,211', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/introduction/presentation'),
(10212, 10567, 55, 10344, 3, 837, 838, 408, 410, 409, NULL, 'Data types', '', '', 'temp/FBN1501/10212.html', '10212.html', '344,107,567,212', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/introduction/data-types'),
(10213, 10567, 55, 10344, 3, 839, 840, 409, 411, 410, NULL, 'Recap', '', '', 'temp/FBN1501/10213.html', '10213.html', '344,107,567,213', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/introduction/recap'),
(10214, 10570, 55, 10344, 3, 847, 848, 413, 415, 414, NULL, 'Bar graph', '', '', 'temp/FBN1501/10214.html', '10214.html', '344,107,570,214', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/bar-representations/bar-graph'),
(10215, 10570, 55, 10344, 3, 849, 850, 414, 416, 415, NULL, 'Histogram', '', '', 'temp/FBN1501/10215.html', '10215.html', '344,107,570,215', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/bar-representations/histogram'),
(10216, 10570, 55, 10344, 3, 851, 852, 415, 417, 416, NULL, 'Comparison', '', '', 'temp/FBN1501/10216.html', '10216.html', '344,107,570,216', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/bar-representations/comparison'),
(10217, 10571, 55, 10344, 3, 855, 856, 417, 419, 418, NULL, 'Frequency table', '', '', 'temp/FBN1501/10217.html', '10217.html', '344,107,571,217', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/frequency-table'),
(10218, 10424, 55, 10342, 3, 541, 542, 131, 133, 132, NULL, 'Video', '', '', 'temp/FBN1501/10218.html', '10218.html', '342,426,424,218', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/powers/introduction/video'),
(10219, 10429, 55, 10342, 3, 549, 550, 134, 136, 135, NULL, 'Add exponents', '', '', 'temp/FBN1501/10219.html', '10219.html', '342,426,429,219', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/product-property/add-exponents'),
(10220, 10431, 55, 10342, 3, 555, 556, 137, 139, 138, NULL, 'Multiply exponents', '', '', 'temp/FBN1501/10220.html', '10220.html', '342,426,431,220', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-power-property/multiply-exponents'),
(10221, 10433, 55, 10342, 3, 561, 562, 140, 142, 141, NULL, 'Product of factors', '', '', 'temp/FBN1501/10221.html', '10221.html', '342,426,433,221', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-product-property/product-of-factors'),
(10222, 10435, 55, 10342, 3, 567, 568, 143, 145, 144, NULL, 'Same power', '', '', 'temp/FBN1501/10222.html', '10222.html', '342,426,435,222', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-fraction-property/same-power'),
(10223, 10435, 55, 10342, 3, 569, 570, 145, 147, 146, NULL, 'Subtract exponents', '', '', 'temp/FBN1501/10223.html', '10223.html', '342,426,435,223', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-fraction-property/subtract-exponents'),
(10224, 10438, 55, 10342, 3, 577, 578, 148, 150, 149, NULL, 'Negative exponent', '', '', 'temp/FBN1501/10224.html', '10224.html', '342,426,438,224', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/negative-power-property/negative-exponent'),
(10225, 10438, 55, 10342, 3, 579, 580, 150, 152, 151, NULL, 'Negative powers', '', '', 'temp/FBN1501/10225.html', '10225.html', '342,426,438,225', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/negative-power-property/negative-powers'),
(10226, 10441, 55, 10342, 3, 587, 588, 153, 155, 154, NULL, '0 and 1 exponents', '', '', 'temp/FBN1501/10226.html', '10226.html', '342,426,441,226', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/0-and-1-exponent-property/0-and-1-exponents'),
(10227, 10443, 55, 10342, 3, 593, 594, 156, 158, 157, NULL, 'Like terms', '', '', 'temp/FBN1501/10227.html', '10227.html', '342,426,443,227', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/like-terms/like-terms'),
(10228, 10426, 55, 10342, 2, 538, 539, 158, 160, 159, NULL, 'Properties summary', '', '', 'temp/FBN1501/10228.html', '10228.html', '342,426,228', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/powers/properties-summary'),
(10229, 10451, 55, 10342, 3, 191, 192, 168, 170, 169, NULL, 'Video 1', '', '', 'temp/FBN1501/10229.html', '10229.html', '342,103,451,229', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/video-1'),
(10230, 10451, 55, 10342, 3, 193, 194, 169, 171, 170, NULL, 'Video 2', '', '', 'temp/FBN1501/10230.html', '10230.html', '342,103,451,230', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/video-2'),
(10231, 10451, 55, 10342, 3, 195, 196, 171, 173, 172, NULL, 'Of numbers', '', '', 'temp/FBN1501/10231.html', '10231.html', '342,103,451,231', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/of-numbers'),
(10232, 10451, 55, 10342, 3, 197, 198, 172, 174, 173, NULL, 'Of fractions', '', '', 'temp/FBN1501/10232.html', '10232.html', '342,103,451,232', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/of-fractions'),
(10233, 10451, 55, 10342, 3, 199, 200, 173, 175, 174, NULL, 'Properties', '', '', 'temp/FBN1501/10233.html', '10233.html', '342,103,451,233', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/properties'),
(10234, 10453, 55, 10342, 3, 207, 208, 176, 178, 177, NULL, 'Video 1', '', '', 'temp/FBN1501/10234.html', '10234.html', '342,103,453,234', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/cube-roots/video-1'),
(10235, 10453, 55, 10342, 3, 209, 210, 177, 179, 178, NULL, 'Video 2', '', '', 'temp/FBN1501/10235.html', '10235.html', '342,103,453,235', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/cube-roots/video-2'),
(10236, 10454, 55, 10342, 3, 213, 214, 179, 181, 180, NULL, 'Examples', '', '', 'temp/FBN1501/10236.html', '10236.html', '342,103,454,236', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/examples'),
(10237, 10454, 55, 10342, 3, 215, 216, 181, 183, 182, NULL, 'Cube root (Perfect)', '', '', 'temp/FBN1501/10237.html', '10237.html', '342,103,454,237', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/cube-root-perfect'),
(10238, 10454, 55, 10342, 3, 217, 218, 182, 184, 183, NULL, 'Fourth root (Perfect)', '', '', 'temp/FBN1501/10238.html', '10238.html', '342,103,454,238', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/fourth-root-perfect'),
(10239, 10454, 55, 10342, 3, 219, 220, 183, 185, 184, NULL, 'nth root (Perfect)', '', '', 'temp/FBN1501/10239.html', '10239.html', '342,103,454,239', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/nth-root-perfect'),
(10240, 10454, 55, 10342, 3, 221, 222, 184, 186, 185, NULL, ' Cube root (Normal)', '', '', 'temp/FBN1501/10240.html', '10240.html', '342,103,454,240', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/cube-root-normal'),
(10241, 10454, 55, 10342, 3, 223, 224, 185, 187, 186, NULL, 'Fourth root (Normal)', '', '', 'temp/FBN1501/10241.html', '10241.html', '342,103,454,241', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/fourth-root-normal'),
(10242, 10454, 55, 10342, 3, 225, 226, 188, 190, 189, NULL, 'Fractional exponents 1', '', '', 'temp/FBN1501/10242.html', '10242.html', '342,103,454,242', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/fractional-exponents-1'),
(10243, 10454, 55, 10342, 3, 227, 228, 189, 191, 190, NULL, 'Fractional exponents 2', '', '', 'temp/FBN1501/10243.html', '10243.html', '342,103,454,243', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/fractional-exponents-2'),
(10244, 10103, 55, 10342, 2, 186, 187, 192, 194, 193, NULL, 'Remarks about roots', '', '', 'temp/FBN1501/10244.html', '10244.html', '342,103,244', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/remarks-about-roots'),
(10245, 10451, 55, 10342, 3, 201, 202, 170, 172, 171, NULL, 'Visualization', '', '', 'temp/FBN1501/10245.html', '10245.html', '342,103,451,245', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/visualization'),
(10246, 10465, 55, 10342, 3, 257, 258, 202, 204, 203, NULL, 'Introduction', '', '', 'temp/FBN1501/10246.html', '10246.html', '342,104,465,246', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/introduction'),
(10247, 10465, 55, 10342, 3, 259, 260, 203, 205, 204, NULL, 'Part to part', '', '', 'temp/FBN1501/10247.html', '10247.html', '342,104,465,247', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/part-to-part'),
(10248, 10465, 55, 10342, 3, 261, 262, 205, 207, 206, NULL, 'Part to whole', '', '', 'temp/FBN1501/10248.html', '10248.html', '342,104,465,248', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/part-to-whole'),
(10249, 10465, 55, 10342, 3, 263, 264, 206, 208, 207, NULL, 'Part to one', '', '', 'temp/FBN1501/10249.html', '10249.html', '342,104,465,249', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/part-to-one'),
(10250, 10471, 55, 10342, 3, 275, 276, 211, 213, 212, NULL, 'Introduction', '', '', 'temp/FBN1501/10250.html', '10250.html', '342,104,471,250', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/proportion/introduction'),
(10251, 10471, 55, 10342, 3, 277, 278, 212, 214, 213, NULL, 'Example', '', '', 'temp/FBN1501/10251.html', '10251.html', '342,104,471,251', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/proportion/example'),
(10252, 10471, 55, 10342, 3, 279, 280, 213, 215, 214, NULL, 'Alternative', '', '', 'temp/FBN1501/10252.html', '10252.html', '342,104,471,252', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/proportion/alternative'),
(10253, 10474, 55, 10342, 3, 287, 288, 217, 219, 218, NULL, 'Introduction', '', '', 'temp/FBN1501/10253.html', '10253.html', '342,104,474,253', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/introduction'),
(10255, 10474, 55, 10342, 3, 289, 290, 220, 222, 221, NULL, 'Representation', '', '', 'temp/FBN1501/10255.html', '10255.html', '342,104,474,255', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/representation'),
(10256, 10474, 55, 10342, 3, 291, 292, 221, 223, 222, NULL, 'Case 1', '', '', 'temp/FBN1501/10256.html', '10256.html', '342,104,474,256', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/case-1'),
(10257, 10474, 55, 10342, 3, 293, 294, 223, 225, 224, NULL, 'Case 2', '', '', 'temp/FBN1501/10257.html', '10257.html', '342,104,474,257', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/case-2'),
(10258, 10474, 55, 10342, 3, 295, 296, 225, 227, 226, NULL, 'Case 3', '', '', 'temp/FBN1501/10258.html', '10258.html', '342,104,474,258', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/case-3'),
(10259, 10474, 55, 10342, 3, 297, 298, 227, 229, 228, NULL, '% Change', '', '', 'temp/FBN1501/10259.html', '10259.html', '342,104,474,259', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/change'),
(10260, 10493, 55, 10342, 3, 361, 362, 254, 256, 255, NULL, 'Video', '', '', 'temp/FBN1501/10260.html', '10260.html', '342,105,493,260', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations/video'),
(10261, 10495, 55, 10342, 3, 369, 370, 258, 260, 259, NULL, 'Video 1', '', '', 'temp/FBN1501/10261.html', '10261.html', '342,105,495,261', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-versus-combinations/video-1'),
(10262, 10495, 55, 10342, 3, 371, 372, 259, 261, 260, NULL, 'Video 2', '', '', 'temp/FBN1501/10262.html', '10262.html', '342,105,495,262', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-versus-combinations/video-2'),
(10267, 10571, 55, 10344, 3, 857, 858, 418, 420, 419, NULL, 'Video - Frequency table', '', '', 'temp/FBN1501/10267.html', '10267.html', '344,107,571,267', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/video---frequency-table'),
(10268, 10571, 55, 10344, 3, 859, 860, 427, 429, 428, NULL, 'Video - Interval size', '', '', 'temp/FBN1501/10268.html', '10268.html', '344,107,571,268', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/video---interval-size'),
(10269, 10599, 55, 10344, 3, 949, 950, 463, 465, 464, NULL, 'Video', '', '', 'temp/FBN1501/10269.html', '10269.html', '344,108,599,269', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-discrete-quantitative-data/video'),
(10270, 10606, 55, 10344, 3, 979, 980, 478, 480, 479, NULL, 'Video', '', '', 'temp/FBN1501/10270.html', '10270.html', '344,108,606,270', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/distribution-of-data/video'),
(10271, 10613, 55, 10344, 3, 1005, 1006, 496, 498, 497, NULL, 'Video 1', '', '', 'temp/FBN1501/10271.html', '10271.html', '344,109,613,271', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/video-1'),
(10272, 10613, 55, 10344, 3, 1007, 1008, 497, 499, 498, NULL, 'Video 2 - Scores', '', '', 'temp/FBN1501/10272.html', '10272.html', '344,109,613,272', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/video-2---scores'),
(10274, 10486, 55, 10342, 3, 329, 330, 239, 241, 240, NULL, 'Signs', '', '', 'temp/FBN1501/10274.html', '10274.html', '342,105,486,274', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/signs-and-notations/signs'),
(10275, 10571, 55, 10344, 3, 861, 862, 419, 421, 420, NULL, 'Histogram', '', '', 'temp/FBN1501/10275.html', '10275.html', '344,107,571,275', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/histogram'),
(10277, 10498, 55, 10342, 3, 381, 382, 264, 266, 265, NULL, 'Repetition', '', '', 'temp/FBN1501/10277.html', '10277.html', '342,105,498,277', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-with-repetition/repetition'),
(10278, 10505, 55, 10342, 3, 405, 406, 276, 278, 277, NULL, 'Lengths in SI system', '', '', 'temp/FBN1501/10278.html', '10278.html', '342,106,505,278', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/length/lengths-in-si-system'),
(10279, 10505, 55, 10342, 3, 407, 408, 279, 281, 280, NULL, 'In practice', '', '', 'temp/FBN1501/10279.html', '10279.html', '342,106,505,279', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/length/in-practice'),
(10280, 10571, 55, 10344, 3, 863, 864, 423, 425, 424, NULL, 'Percentages', '', '', 'temp/FBN1501/10280.html', '10280.html', '344,107,571,280', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/percentages'),
(10281, 10508, 55, 10342, 3, 417, 418, 283, 285, 284, NULL, 'Convert large to small', '', '', 'temp/FBN1501/10281.html', '10281.html', '342,106,508,281', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/area/convert-large-to-small'),
(10282, 10510, 55, 10342, 3, 427, 428, 287, 289, 288, NULL, 'Three dimensions', '', '', 'temp/FBN1501/10282.html', '10282.html', '342,106,510,282', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/volume/three-dimensions'),
(10284, 10594, 55, 10344, 3, 931, 932, 454, 456, 455, NULL, 'Definition', '', '', 'temp/FBN1501/10284.html', '10284.html', '344,108,594,284', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-raw-data/definition'),
(10285, 10605, 55, 10344, 3, 969, 970, 473, 475, 474, NULL, 'Definition', '', '', 'temp/FBN1501/10285.html', '10285.html', '344,108,605,285', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/mode/definition');
INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(10286, 10605, 55, 10344, 3, 971, 972, 475, 477, 476, NULL, 'Example - None', '', '', 'temp/FBN1501/10286.html', '10286.html', '344,108,605,286', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/mode/example---none'),
(10287, 10579, 55, 10344, 3, 881, 882, 430, 432, 431, NULL, 'Example', '', '', 'temp/FBN1501/10287.html', '10287.html', '344,107,579,287', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/pie-chart/example'),
(10288, 10605, 55, 10344, 3, 973, 974, 476, 478, 477, NULL, 'Example - Sensitivity', '', '', 'temp/FBN1501/10288.html', '10288.html', '344,108,605,288', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/mode/example---sensitivity'),
(10289, 10581, 55, 10344, 3, 887, 888, 433, 435, 434, NULL, 'Definition', '', '', 'temp/FBN1501/10289.html', '10289.html', '344,107,581,289', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/cumulative-frequency/definition'),
(10290, 10109, 55, 10344, 2, 998, 999, 489, 491, 490, NULL, 'Introduction', '', '', 'temp/FBN1501/10290.html', '10290.html', '344,109,290', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/introduction'),
(10291, 10109, 55, 10344, 2, 1000, 1001, 490, 492, 491, NULL, 'Range', '', '', 'temp/FBN1501/10291.html', '10291.html', '344,109,291', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/range'),
(10292, 10613, 55, 10344, 3, 1009, 1010, 499, 501, 500, NULL, 'Variance - Scores', '', '', 'temp/FBN1501/10292.html', '10292.html', '344,109,613,292', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/variance---scores'),
(10293, 10623, 55, 10344, 3, 1051, 1052, 515, 517, 516, NULL, 'Definition', '', '', 'temp/FBN1501/10293.html', '10293.html', '344,109,623,293', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/box-and-whiskers-diagram/definition'),
(10294, 10623, 55, 10344, 3, 1053, 1054, 516, 518, 517, NULL, 'Example', '', '', 'temp/FBN1501/10294.html', '10294.html', '344,109,623,294', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/box-and-whiskers-diagram/example'),
(10295, 10623, 55, 10344, 3, 1055, 1056, 518, 520, 519, NULL, 'Interpretation', '', '', 'temp/FBN1501/10295.html', '10295.html', '344,109,623,295', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/box-and-whiskers-diagram/interpretation'),
(10296, 10505, 55, 10342, 3, 409, 410, 277, 279, 278, NULL, 'Conversion tables', '', '', 'temp/FBN1501/10296.html', '10296.html', '342,106,505,296', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/length/conversion-tables'),
(10297, 10508, 55, 10342, 3, 419, 420, 282, 284, 283, NULL, 'Measures surface', '', '', 'temp/FBN1501/10297.html', '10297.html', '342,106,508,297', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/area/measures-surface'),
(10298, 10510, 55, 10342, 3, 429, 430, 288, 290, 289, NULL, 'Converting', '', '', 'temp/FBN1501/10298.html', '10298.html', '342,106,510,298', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/volume/converting'),
(10299, 10486, 55, 10342, 3, 331, 332, 238, 240, 239, NULL, 'Number line', '', '', 'temp/FBN1501/10299.html', '10299.html', '342,105,486,299', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/signs-and-notations/number-line'),
(10300, 10486, 55, 10342, 3, 333, 334, 240, 242, 241, NULL, 'Phrases', '', '', 'temp/FBN1501/10300.html', '10300.html', '342,105,486,300', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/signs-and-notations/phrases'),
(10301, 10581, 55, 10344, 3, 889, 890, 435, 437, 436, NULL, 'Ogive', '', '', 'temp/FBN1501/10301.html', '10301.html', '344,107,581,301', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/cumulative-frequency/ogive'),
(10302, 10108, 55, 10344, 2, 924, 925, 480, 482, 481, NULL, 'Summary', '', '', 'temp/FBN1501/10302.html', '10302.html', '344,108,302', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/summary'),
(10303, 10613, 55, 10344, 3, 1011, 1012, 492, 494, 493, NULL, 'Spread around mean', '', '', 'temp/FBN1501/10303.html', '10303.html', '344,109,613,303', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/spread-around-mean'),
(10304, 10613, 55, 10344, 3, 1013, 1014, 495, 497, 496, NULL, 'Shape', '', '', 'temp/FBN1501/10304.html', '10304.html', '344,109,613,304', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/shape'),
(10305, 10613, 55, 10344, 3, 1015, 1016, 502, 504, 503, NULL, 'Normal curve', '', '', 'temp/FBN1501/10305.html', '10305.html', '344,109,613,305', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/normal-curve'),
(10306, 10618, 55, 10344, 3, 1031, 1032, 505, 507, 506, NULL, 'Equal parts', '', '', 'temp/FBN1501/10306.html', '10306.html', '344,109,618,306', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/quartiles/equal-parts'),
(10307, 10618, 55, 10344, 3, 1033, 1034, 506, 508, 507, NULL, 'Quartile deviation', '', '', 'temp/FBN1501/10307.html', '10307.html', '344,109,618,307', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/quartiles/quartile-deviation'),
(10308, 10621, 55, 10344, 3, 1041, 1042, 510, 512, 511, NULL, 'Ratio of S to mean', '', '', 'temp/FBN1501/10308.html', '10308.html', '344,109,621,308', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/coefficient-of-variation/ratio-of-s-to-mean'),
(10310, 10488, 55, 10342, 3, 339, 340, 243, 245, 244, NULL, 'Add and subtract 1', '', '', 'temp/FBN1501/10310.html', '10310.html', '342,105,488,310', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/positive-and-negative-numbers/add-and-subtract-1'),
(10311, 10488, 55, 10342, 3, 341, 342, 244, 246, 245, NULL, 'Add and subtract 2', '', '', 'temp/FBN1501/10311.html', '10311.html', '342,105,488,311', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/positive-and-negative-numbers/add-and-subtract-2'),
(10312, 10488, 55, 10342, 3, 343, 344, 245, 247, 246, NULL, 'Multiply and divide', '', '', 'temp/FBN1501/10312.html', '10312.html', '342,105,488,312', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/positive-and-negative-numbers/multiply-and-divide'),
(10313, 10489, 55, 10342, 3, 347, 348, 247, 249, 248, NULL, 'Summation', '', '', 'temp/FBN1501/10313.html', '10313.html', '342,105,489,313', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/summation/summation'),
(10314, 10491, 55, 10342, 3, 353, 354, 250, 252, 251, NULL, 'Definition', '', '', 'temp/FBN1501/10314.html', '10314.html', '342,105,491,314', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/factorial/definition'),
(10315, 10491, 55, 10342, 3, 355, 356, 251, 253, 252, NULL, 'Example', '', '', 'temp/FBN1501/10315.html', '10315.html', '342,105,491,315', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/factorial/example'),
(10316, 10493, 55, 10342, 3, 363, 364, 256, 258, 257, NULL, 'Formulas', '', '', 'temp/FBN1501/10316.html', '10316.html', '342,105,493,316', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations/formulas'),
(10317, 10495, 55, 10342, 3, 373, 374, 261, 263, 262, NULL, 'Formulas', '', '', 'temp/FBN1501/10317.html', '10317.html', '342,105,495,317', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-versus-combinations/formulas'),
(10318, 10106, 55, 10342, 2, 400, 401, 274, 276, 275, NULL, 'SI System', '', '', 'temp/FBN1501/10318.html', '10318.html', '342,106,318', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/si-system'),
(10319, 10508, 55, 10342, 3, 421, 422, 284, 286, 285, NULL, 'Convert small to large', '', '', 'temp/FBN1501/10319.html', '10319.html', '342,106,508,319', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/area/convert-small-to-large'),
(10320, 10510, 55, 10342, 3, 431, 432, 289, 291, 290, NULL, 'Conversion tables', '', '', 'temp/FBN1501/10320.html', '10320.html', '342,106,510,320', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/volume/conversion-tables'),
(10321, 10585, 55, 10344, 3, 899, 900, 439, 441, 440, NULL, 'Place value', '', '', 'temp/FBN1501/10321.html', '10321.html', '344,107,585,321', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/stem-and-leaf-diagram/place-value'),
(10322, 10585, 55, 10344, 3, 901, 902, 440, 442, 441, NULL, 'Example', '', '', 'temp/FBN1501/10322.html', '10322.html', '344,107,585,322', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/stem-and-leaf-diagram/example'),
(10323, 10585, 55, 10344, 3, 903, 904, 442, 444, 443, NULL, 'Alt. presentation', '', '', 'temp/FBN1501/10323.html', '10323.html', '344,107,585,323', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/stem-and-leaf-diagram/alt.-presentation'),
(10324, 10108, 55, 10344, 2, 926, 927, 452, 454, 453, NULL, 'Introduction', '', '', 'temp/FBN1501/10324.html', '10324.html', '344,108,324', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/introduction'),
(10325, 10594, 55, 10344, 3, 933, 934, 456, 458, 457, NULL, 'Formula', '', '', 'temp/FBN1501/10325.html', '10325.html', '344,108,594,325', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-raw-data/formula'),
(10326, 10594, 55, 10344, 3, 935, 936, 457, 459, 458, NULL, 'Example', '', '', 'temp/FBN1501/10326.html', '10326.html', '344,108,594,326', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-raw-data/example'),
(10327, 10596, 55, 10344, 3, 941, 942, 459, 461, 460, NULL, 'Intervals', '', '', 'temp/FBN1501/10327.html', '10327.html', '344,108,596,327', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-interval-data/intervals'),
(10328, 10596, 55, 10344, 3, 943, 944, 460, 462, 461, NULL, 'Formula', '', '', 'temp/FBN1501/10328.html', '10328.html', '344,108,596,328', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-interval-data/formula'),
(10329, 10602, 55, 10344, 3, 955, 956, 466, 468, 467, NULL, 'Definition', '', '', 'temp/FBN1501/10329.html', '10329.html', '344,108,602,329', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/median/definition'),
(10330, 10602, 55, 10344, 3, 957, 958, 467, 469, 468, NULL, 'Example - Odd', '', '', 'temp/FBN1501/10330.html', '10330.html', '344,108,602,330', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/median/example---odd'),
(10331, 10602, 55, 10344, 3, 959, 960, 468, 470, 469, NULL, 'Example - Even', '', '', 'temp/FBN1501/10331.html', '10331.html', '344,108,602,331', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/median/example---even'),
(10332, 10602, 55, 10344, 3, 961, 962, 469, 471, 470, NULL, 'Example - Sensitivity', '', '', 'temp/FBN1501/10332.html', '10332.html', '344,108,602,332', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/median/example---sensitivity'),
(10333, 10613, 55, 10344, 3, 1017, 1018, 493, 495, 494, NULL, 'Compare data sets', '', '', 'temp/FBN1501/10333.html', '10333.html', '344,109,613,333', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/compare-data-sets'),
(10334, 10613, 55, 10344, 3, 1019, 1020, 501, 503, 502, NULL, 'Formulas', '', '', 'temp/FBN1501/10334.html', '10334.html', '344,109,613,334', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/formulas'),
(10335, 10621, 55, 10344, 3, 1043, 1044, 511, 513, 512, NULL, 'Variability of data sets', '', '', 'temp/FBN1501/10335.html', '10335.html', '344,109,621,335', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/coefficient-of-variation/variability-of-data-sets'),
(10336, 10621, 55, 10344, 3, 1045, 1046, 512, 514, 513, NULL, 'Example', '', '', 'temp/FBN1501/10336.html', '10336.html', '344,109,621,336', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/coefficient-of-variation/example'),
(10339, 10605, 55, 10344, 3, 975, 976, 474, 476, 475, NULL, 'Example - More than one', '', '', 'temp/FBN1501/10339.html', '10339.html', '344,108,605,339', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/mode/example---more-than-one'),
(10340, 10346, 55, 10342, 3, 25, 26, 6, 8, 7, NULL, 'Activity', '', '', 'temp/FBN1501/10340.html', '10340.html', '342,97,346,340', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations/activity'),
(10341, 20344, 55, 0, 0, 2, 15, -1, 1, 0, NULL, 'TEST &amp; OTHER PAGES', '', '', 'temp/FBN1501/10341.html', '10341.html', '341', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages'),
(10342, 20344, 55, 0, 0, 16, 611, 0, 2, 1, NULL, 'Numbers and working with numbers', '', '', 'temp/FBN1501/10342.html', '10342.html', '342', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers'),
(10343, 20344, 55, 0, 0, 612, 767, 298, 300, 299, NULL, 'Index numbers and transformations', '', '', 'temp/FBN1501/10343.html', '10343.html', '343', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations'),
(10344, 20344, 55, 10344, 0, 768, 1075, 372, 374, 373, NULL, 'Collection, presentation and description of data', '', '', 'temp/FBN1501/10344.html', '10344.html', '344', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data'),
(10345, 1097, 55, 10342, 2, 18, 19, 2, 4, 3, NULL, 'Learning objectives', 'Numbers and working with numbers', '', 'temp/FBN1501/10345.html', '10345.html', '342,97,345', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/learning-objectives'),
(10346, 1097, 55, 10342, 2, 20, 33, 3, 5, 4, NULL, 'Order of operations', '', '', 'temp/FBN1501/10346.html', '10346.html', '342,97,346', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations'),
(10347, 10346, 55, 10342, 3, 27, 28, 7, 9, 8, NULL, 'Activity (Cont. 1)', '', '', 'temp/FBN1501/10347.html', '10347.html', '342,97,346,347', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations/activity-cont.-1'),
(10348, 10346, 55, 10342, 3, 29, 30, 8, 10, 9, NULL, 'Activity (Cont. 2)', '', '', 'temp/FBN1501/10348.html', '10348.html', '342,97,346,348', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations/activity-cont.-2'),
(10349, 10346, 55, 10342, 3, 31, 32, 9, 11, 10, NULL, 'Activity (Cont. 3)', '', '', 'temp/FBN1501/10349.html', '10349.html', '342,97,346,349', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/order-of-operations/activity-cont.-3'),
(10351, 1097, 55, 10342, 2, 34, 41, 10, 12, 11, NULL, 'Brackets', '', '', 'temp/FBN1501/10351.html', '10351.html', '342,97,351', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/brackets'),
(10352, 10351, 55, 10342, 3, 39, 40, 13, 15, 14, NULL, 'Activity', '', '', 'temp/FBN1501/10352.html', '10352.html', '342,97,351,352', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/numbers-and-working-with-numbers/priorities/brackets/activity'),
(10353, 1097, 55, 10342, 2, 42, 47, 14, 16, 15, NULL, 'Exercise', '', '', 'temp/FBN1501/10353.html', '10353.html', '342,97,353', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/exercise'),
(10354, 10353, 55, 10342, 3, 45, 46, 16, 18, 17, NULL, 'Exercise', '', '', 'temp/FBN1501/10354.html', '10354.html', '342,97,353,354', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/exercise/exercise'),
(10355, 1097, 55, 10342, 2, 48, 53, 17, 19, 18, NULL, 'Assignment', '', '', 'temp/FBN1501/10355.html', '10355.html', '342,97,355', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/assignment'),
(10356, 10355, 55, 10342, 3, 51, 52, 19, 21, 20, NULL, 'Questions', '', '', 'temp/FBN1501/10356.html', '10356.html', '342,97,355,356', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/priorities/assignment/questions'),
(10357, 1099, 55, 10342, 2, 56, 57, 21, 23, 22, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10357.html', '10357.html', '342,99,357', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/learning-objectives'),
(10358, 1099, 55, 10342, 2, 58, 69, 22, 24, 23, NULL, 'Variables', '', '', 'temp/FBN1501/10358.html', '10358.html', '342,99,358', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/variables'),
(10359, 10358, 55, 10342, 3, 65, 66, 24, 26, 25, NULL, 'Activity 1', '', '', 'temp/FBN1501/10359.html', '10359.html', '342,99,358,359', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/variables/activity-1'),
(10360, 10358, 55, 10342, 3, 67, 68, 25, 27, 26, NULL, 'Activity 2', '', '', 'temp/FBN1501/10360.html', '10360.html', '342,99,358,360', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/variables/activity-2'),
(10361, 1099, 55, 10342, 2, 70, 75, 28, 30, 29, NULL, 'Exercise', '', '', 'temp/FBN1501/10361.html', '10361.html', '342,99,361', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/exercise'),
(10362, 10361, 55, 10342, 3, 73, 74, 30, 32, 31, NULL, 'Exercise', '', '', 'temp/FBN1501/10362.html', '10362.html', '342,99,361,362', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/exercise/exercise'),
(10363, 1099, 55, 10342, 2, 76, 81, 31, 33, 32, NULL, 'Assignment', '', '', 'temp/FBN1501/10363.html', '10363.html', '342,99,363', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/assignment'),
(10364, 10363, 55, 10342, 3, 79, 80, 33, 35, 34, NULL, 'Questions', '', '', 'temp/FBN1501/10364.html', '10364.html', '342,99,363,364', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:24', '', '/numbers-and-working-with-numbers/variables/assignment/questions'),
(10365, 10100, 55, 10342, 2, 88, 89, 35, 37, 36, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10365.html', '10365.html', '342,100,365', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/learning-objectives'),
(10366, 10100, 55, 10342, 2, 90, 95, 36, 38, 37, NULL, 'Commutative laws (+ and x)', '', '', 'temp/FBN1501/10366.html', '10366.html', '342,100,366', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/commutative-laws-and-x'),
(10367, 10100, 55, 10342, 2, 96, 103, 39, 41, 40, NULL, 'Associative laws (+ and x)', '', '', 'temp/FBN1501/10367.html', '10367.html', '342,100,367', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/associative-laws-and-x'),
(10368, 10367, 55, 10342, 3, 99, 100, 41, 43, 42, NULL, 'Activity (+)', '', '', 'temp/FBN1501/10368.html', '10368.html', '342,100,367,368', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/associative-laws-and-x/activity'),
(10369, 10367, 55, 10342, 3, 101, 102, 42, 44, 43, NULL, 'Activity (x)', '', '', 'temp/FBN1501/10369.html', '10369.html', '342,100,367,369', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/associative-laws-and-x/activity-x'),
(10370, 10100, 55, 10342, 2, 104, 113, 43, 45, 44, NULL, 'Distributive law', '', '', 'temp/FBN1501/10370.html', '10370.html', '342,100,370', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/distributive-law'),
(10371, 10370, 55, 10342, 3, 107, 108, 45, 47, 46, NULL, 'Activity 1', '', '', 'temp/FBN1501/10371.html', '10371.html', '342,100,370,371', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/distributive-law/activity-1'),
(10372, 10370, 55, 10342, 3, 109, 110, 46, 48, 47, NULL, 'Examples', '', '', 'temp/FBN1501/10372.html', '10372.html', '342,100,370,372', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/distributive-law/examples'),
(10373, 10370, 55, 10342, 3, 111, 112, 47, 49, 48, NULL, 'Activity 2', '', '', 'temp/FBN1501/10373.html', '10373.html', '342,100,370,373', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/distributive-law/activity-2'),
(10374, 10100, 55, 10342, 2, 114, 119, 50, 52, 51, NULL, 'Exercise', '', '', 'temp/FBN1501/10374.html', '10374.html', '342,100,374', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/exercise'),
(10375, 10374, 55, 10342, 3, 117, 118, 52, 54, 53, NULL, 'Exercise', '', '', 'temp/FBN1501/10375.html', '10375.html', '342,100,374,375', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/exercise/exercise'),
(10376, 10100, 55, 10342, 2, 120, 125, 53, 55, 54, NULL, 'Assignment', '', '', 'temp/FBN1501/10376.html', '10376.html', '342,100,376', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/assignment'),
(10377, 10376, 55, 10342, 3, 123, 124, 55, 57, 56, NULL, 'Questions', '', '', 'temp/FBN1501/10377.html', '10377.html', '342,100,376,377', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/laws-of-operations/assignment/questions'),
(10378, 10342, 55, 10342, 1, 451, 536, 85, 87, 86, NULL, 'Fractions 2', 'Numbers and working with numbers', '', 'temp/FBN1501/10378.html', '10378.html', '342,378', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2'),
(10379, 10102, 55, 10342, 2, 128, 129, 57, 59, 58, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10379.html', '10379.html', '342,102,379', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/learning-objectives'),
(10380, 10378, 55, 10342, 2, 452, 453, 86, 88, 87, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10380.html', '10380.html', '342,378,380', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/fractions-2/learning-objectives'),
(10381, 10102, 55, 10342, 2, 130, 135, 58, 60, 59, NULL, 'Fractions', '', '', 'temp/FBN1501/10381.html', '10381.html', '342,102,381', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/fractions'),
(10382, 10102, 55, 10342, 2, 136, 141, 61, 63, 62, NULL, 'Proper fraction', '', '', 'temp/FBN1501/10382.html', '10382.html', '342,102,382', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/proper-fraction'),
(10383, 10382, 55, 10342, 3, 137, 138, 62, 64, 63, NULL, 'Definition', '', '', 'temp/FBN1501/10383.html', '10383.html', '342,102,382,383', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/proper-fraction/definition'),
(10384, 10382, 55, 10342, 3, 139, 140, 63, 65, 64, NULL, 'Activity', '', '', 'temp/FBN1501/10384.html', '10384.html', '342,102,382,384', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/proper-fraction/activity'),
(10385, 10102, 55, 10342, 2, 142, 147, 64, 66, 65, NULL, 'Improper fraction', '', '', 'temp/FBN1501/10385.html', '10385.html', '342,102,385', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/improper-fraction'),
(10386, 10385, 55, 10342, 3, 143, 144, 65, 67, 66, NULL, 'Definition', '', '', 'temp/FBN1501/10386.html', '10386.html', '342,102,385,386', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:25', '', '/numbers-and-working-with-numbers/fractions-1/improper-fraction/definition'),
(10387, 10385, 55, 10342, 3, 145, 146, 66, 68, 67, NULL, 'Activity', '', '', 'temp/FBN1501/10387.html', '10387.html', '342,102,385,387', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/improper-fraction/activity'),
(10388, 10102, 55, 10342, 2, 148, 153, 67, 69, 68, NULL, 'Mixed number', '', '', 'temp/FBN1501/10388.html', '10388.html', '342,102,388', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/mixed-number'),
(10389, 10388, 55, 10342, 3, 149, 150, 68, 70, 69, NULL, 'Definition', '', '', 'temp/FBN1501/10389.html', '10389.html', '342,102,388,389', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/mixed-number/definition'),
(10390, 10388, 55, 10342, 3, 151, 152, 69, 71, 70, NULL, 'Activity', 'Numbers and working with numbers', '', 'temp/FBN1501/10390.html', '10390.html', '342,102,388,390', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/mixed-number/activity'),
(10391, 10102, 55, 10342, 2, 154, 159, 70, 72, 71, NULL, 'Conversions', '', '', 'temp/FBN1501/10391.html', '10391.html', '342,102,391', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/conversions'),
(10392, 10391, 55, 10342, 3, 157, 158, 72, 74, 73, NULL, 'Improper to mixed', '', '', 'temp/FBN1501/10392.html', '10392.html', '342,102,391,392', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/conversions/improper-to-mixed'),
(10393, 10102, 55, 10342, 2, 160, 165, 73, 75, 74, NULL, 'Equivalent fraction', '', '', 'temp/FBN1501/10393.html', '10393.html', '342,102,393', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/equivalent-fraction'),
(10394, 10393, 55, 10342, 3, 161, 162, 74, 76, 75, NULL, 'Definition', '', '', 'temp/FBN1501/10394.html', '10394.html', '342,102,393,394', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/equivalent-fraction/definition'),
(10395, 10393, 55, 10342, 3, 163, 164, 75, 77, 76, NULL, 'Activity', '', '', 'temp/FBN1501/10395.html', '10395.html', '342,102,393,395', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/equivalent-fraction/activity'),
(10396, 10102, 55, 10342, 2, 166, 171, 76, 78, 77, NULL, 'Reciprocal', '', '', 'temp/FBN1501/10396.html', '10396.html', '342,102,396', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/reciprocal'),
(10397, 10396, 55, 10342, 3, 169, 170, 78, 80, 79, NULL, 'Activity', '', '', 'temp/FBN1501/10397.html', '10397.html', '342,102,396,397', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/reciprocal/activity'),
(10398, 10102, 55, 10342, 2, 172, 177, 79, 81, 80, NULL, 'Exercise', '', '', 'temp/FBN1501/10398.html', '10398.html', '342,102,398', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/exercise'),
(10399, 10398, 55, 10342, 3, 173, 174, 80, 82, 81, NULL, 'Instructions', '', '', 'temp/FBN1501/10399.html', '10399.html', '342,102,398,399', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/exercise/instructions'),
(10400, 10398, 55, 10342, 3, 175, 176, 81, 83, 82, NULL, 'Exercise', '', '', 'temp/FBN1501/10400.html', '10400.html', '342,102,398,400', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/exercise/exercise'),
(10401, 10102, 55, 10342, 2, 178, 183, 82, 84, 83, NULL, 'Assignment', '', '', 'temp/FBN1501/10401.html', '10401.html', '342,102,401', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/assignment'),
(10402, 10401, 55, 10342, 3, 179, 180, 83, 85, 84, NULL, 'Information', '', '', 'temp/FBN1501/10402.html', '10402.html', '342,102,401,402', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/assignment/information'),
(10403, 10401, 55, 10342, 3, 181, 182, 84, 86, 85, NULL, 'Questions', '', '', 'temp/FBN1501/10403.html', '10403.html', '342,102,401,403', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/fractions-1/assignment/questions'),
(10404, 10378, 55, 10342, 2, 454, 465, 87, 89, 88, NULL, 'Reducing', '', '', 'temp/FBN1501/10404.html', '10404.html', '342,378,404', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/reducing'),
(10405, 10378, 55, 10342, 2, 466, 475, 93, 95, 94, NULL, 'Multiplication', '', '', 'temp/FBN1501/10405.html', '10405.html', '342,378,405', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/multiplication'),
(10406, 10378, 55, 10342, 2, 476, 483, 98, 100, 99, NULL, 'Division', '', '', 'temp/FBN1501/10406.html', '10406.html', '342,378,406', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/division'),
(10407, 10378, 55, 10342, 2, 484, 491, 103, 105, 104, NULL, 'Addition', '', '', 'temp/FBN1501/10407.html', '10407.html', '342,378,407', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/addition'),
(10408, 10378, 55, 10342, 2, 492, 497, 107, 109, 108, NULL, 'Subtraction', '', '', 'temp/FBN1501/10408.html', '10408.html', '342,378,408', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/subtraction'),
(10409, 10378, 55, 10342, 2, 498, 519, 111, 113, 112, NULL, 'Decimals', '', '', 'temp/FBN1501/10409.html', '10409.html', '342,378,409', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals'),
(10410, 10378, 55, 10342, 2, 520, 525, 122, 124, 123, NULL, 'Exercise', '', '', 'temp/FBN1501/10410.html', '10410.html', '342,378,410', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/exercise'),
(10411, 10378, 55, 10342, 2, 526, 531, 125, 127, 126, NULL, 'Assignment', '', '', 'temp/FBN1501/10411.html', '10411.html', '342,378,411', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/assignment'),
(10412, 10404, 55, 10342, 3, 463, 464, 90, 92, 91, NULL, 'Activity', '', '', 'temp/FBN1501/10412.html', '10412.html', '342,378,404,412', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/reducing/activity'),
(10413, 10405, 55, 10342, 3, 473, 474, 97, 99, 98, NULL, 'Activity', '', '', 'temp/FBN1501/10413.html', '10413.html', '342,378,405,413', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/multiplication/activity'),
(10414, 10406, 55, 10342, 3, 481, 482, 101, 103, 102, NULL, 'Activity', '', '', 'temp/FBN1501/10414.html', '10414.html', '342,378,406,414', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/division/activity'),
(10415, 10407, 55, 10342, 3, 489, 490, 106, 108, 107, NULL, 'Activity', '', '', 'temp/FBN1501/10415.html', '10415.html', '342,378,407,415', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/addition/activity'),
(10416, 10378, 55, 10342, 2, 532, 533, 102, 104, 103, NULL, 'Activity (multiply and divide)', '', '', 'temp/FBN1501/10416.html', '10416.html', '342,378,416', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/activity-multiply-and-divide'),
(10417, 10408, 55, 10342, 3, 495, 496, 109, 111, 110, NULL, 'Activity', '', '', 'temp/FBN1501/10417.html', '10417.html', '342,378,408,417', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/subtraction/activity'),
(10418, 10378, 55, 10342, 2, 534, 535, 110, 112, 111, NULL, 'Activity (+ and -)', '', '', 'temp/FBN1501/10418.html', '10418.html', '342,378,418', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/activity-and--'),
(10419, 10409, 55, 10342, 3, 513, 514, 115, 117, 116, NULL, 'Activity', '', '', 'temp/FBN1501/10419.html', '10419.html', '342,378,409,419', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/activity'),
(10420, 10409, 55, 10342, 3, 515, 516, 119, 121, 120, NULL, 'Activity 1', '', '', 'temp/FBN1501/10420.html', '10420.html', '342,378,409,420', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/activity-1'),
(10421, 10409, 55, 10342, 3, 517, 518, 120, 122, 121, NULL, 'Activity 2', '', '', 'temp/FBN1501/10421.html', '10421.html', '342,378,409,421', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/decimals/activity-2'),
(10422, 10410, 55, 10342, 3, 523, 524, 124, 126, 125, NULL, 'Exercise', '', '', 'temp/FBN1501/10422.html', '10422.html', '342,378,410,422', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/exercise/exercise'),
(10423, 10411, 55, 10342, 3, 529, 530, 127, 129, 128, NULL, 'Questions', '', '', 'temp/FBN1501/10423.html', '10423.html', '342,378,411,423', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/fractions-2/assignment/questions'),
(10424, 10426, 55, 10342, 2, 540, 545, 130, 132, 131, NULL, 'Introduction', '', '', 'temp/FBN1501/10424.html', '10424.html', '342,426,424', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/introduction'),
(10425, 10103, 55, 10342, 2, 188, 189, 166, 168, 167, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10425.html', '10425.html', '342,103,425', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/learning-objectives'),
(10426, 10342, 55, 10342, 1, 537, 610, 128, 130, 129, NULL, 'Powers', 'Numbers and working with numbers', '', 'temp/FBN1501/10426.html', '10426.html', '342,426', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers'),
(10427, 10426, 55, 10342, 2, 546, 547, 129, 131, 130, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10427.html', '10427.html', '342,426,427', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/learning-objectives'),
(10428, 10424, 55, 10342, 3, 543, 544, 132, 134, 133, NULL, 'Activity', '', '', 'temp/FBN1501/10428.html', '10428.html', '342,426,424,428', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:30', '', '/numbers-and-working-with-numbers/powers/introduction/activity'),
(10429, 10426, 55, 10342, 2, 548, 553, 133, 135, 134, NULL, 'Product property', '', '', 'temp/FBN1501/10429.html', '10429.html', '342,426,429', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/product-property'),
(10430, 10429, 55, 10342, 3, 551, 552, 135, 137, 136, NULL, 'Activity', '', '', 'temp/FBN1501/10430.html', '10430.html', '342,426,429,430', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/product-property/activity'),
(10431, 10426, 55, 10342, 2, 554, 559, 136, 138, 137, NULL, 'Power of a power property', '', '', 'temp/FBN1501/10431.html', '10431.html', '342,426,431', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-power-property'),
(10432, 10431, 55, 10342, 3, 557, 558, 138, 140, 139, NULL, 'Activity', '', '', 'temp/FBN1501/10432.html', '10432.html', '342,426,431,432', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-power-property/activity'),
(10433, 10426, 55, 10342, 2, 560, 565, 139, 141, 140, NULL, 'Power of a product property', '', '', 'temp/FBN1501/10433.html', '10433.html', '342,426,433', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-product-property'),
(10434, 10433, 55, 10342, 3, 563, 564, 141, 143, 142, NULL, 'Activity', '', '', 'temp/FBN1501/10434.html', '10434.html', '342,426,433,434', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-product-property/activity'),
(10435, 10426, 55, 10342, 2, 566, 575, 142, 144, 143, NULL, 'Power of a fraction property', '', '', 'temp/FBN1501/10435.html', '10435.html', '342,426,435', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-fraction-property'),
(10436, 10435, 55, 10342, 3, 571, 572, 144, 146, 145, NULL, 'Activity 1', '', '', 'temp/FBN1501/10436.html', '10436.html', '342,426,435,436', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-fraction-property/activity-1'),
(10437, 10435, 55, 10342, 3, 573, 574, 146, 148, 147, NULL, 'Activity 2', '', '', 'temp/FBN1501/10437.html', '10437.html', '342,426,435,437', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/power-of-a-fraction-property/activity-2'),
(10438, 10426, 55, 10342, 2, 576, 585, 147, 149, 148, NULL, 'Negative power property', '', '', 'temp/FBN1501/10438.html', '10438.html', '342,426,438', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/negative-power-property'),
(10439, 10438, 55, 10342, 3, 581, 582, 149, 151, 150, NULL, 'Activity 1', '', '', 'temp/FBN1501/10439.html', '10439.html', '342,426,438,439', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/negative-power-property/activity-1'),
(10440, 10438, 55, 10342, 3, 583, 584, 151, 153, 152, NULL, 'Activity 2', '', '', 'temp/FBN1501/10440.html', '10440.html', '342,426,438,440', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/negative-power-property/activity-2'),
(10441, 10426, 55, 10342, 2, 586, 591, 152, 154, 153, NULL, '0 and 1 exponent property', '', '', 'temp/FBN1501/10441.html', '10441.html', '342,426,441', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/0-and-1-exponent-property'),
(10442, 10441, 55, 10342, 3, 589, 590, 154, 156, 155, NULL, 'Activity', '', '', 'temp/FBN1501/10442.html', '10442.html', '342,426,441,442', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/0-and-1-exponent-property/activity'),
(10443, 10426, 55, 10342, 2, 592, 597, 155, 157, 156, NULL, 'Like terms', '', '', 'temp/FBN1501/10443.html', '10443.html', '342,426,443', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/like-terms'),
(10444, 10443, 55, 10342, 3, 595, 596, 157, 159, 158, NULL, 'Activity', '', '', 'temp/FBN1501/10444.html', '10444.html', '342,426,443,444', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/like-terms/activity'),
(10445, 10426, 55, 10342, 2, 598, 603, 159, 161, 160, NULL, 'Exercise', '', '', 'temp/FBN1501/10445.html', '10445.html', '342,426,445', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/exercise'),
(10446, 10426, 55, 10342, 2, 604, 609, 162, 164, 163, NULL, 'Assignment', '', '', 'temp/FBN1501/10446.html', '10446.html', '342,426,446', 12, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/assignment'),
(10447, 10445, 55, 10342, 3, 599, 600, 160, 162, 161, NULL, 'Instructions', '', '', 'temp/FBN1501/10447.html', '10447.html', '342,426,445,447', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/exercise/instructions'),
(10448, 10445, 55, 10342, 3, 601, 602, 161, 163, 162, NULL, 'Exercise', '', '', 'temp/FBN1501/10448.html', '10448.html', '342,426,445,448', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/exercise/exercise'),
(10449, 10446, 55, 10342, 3, 605, 606, 163, 165, 164, NULL, 'Information', '', '', 'temp/FBN1501/10449.html', '10449.html', '342,426,446,449', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/assignment/information'),
(10450, 10446, 55, 10342, 3, 607, 608, 164, 166, 165, NULL, 'Questions', '', '', 'temp/FBN1501/10450.html', '10450.html', '342,426,446,450', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/numbers-and-working-with-numbers/powers/assignment/questions'),
(10451, 10103, 55, 10342, 2, 190, 205, 167, 169, 168, NULL, 'Square roots', '', '', 'temp/FBN1501/10451.html', '10451.html', '342,103,451', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots'),
(10452, 10451, 55, 10342, 3, 203, 204, 174, 176, 175, NULL, 'Activity', '', '', 'temp/FBN1501/10452.html', '10452.html', '342,103,451,452', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/square-roots/activity'),
(10453, 10103, 55, 10342, 2, 206, 211, 175, 177, 176, NULL, 'Cube roots', '', '', 'temp/FBN1501/10453.html', '10453.html', '342,103,453', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:26', '', '/numbers-and-working-with-numbers/roots/cube-roots'),
(10454, 10103, 55, 10342, 2, 212, 239, 178, 180, 179, NULL, 'Roots with higher indexes', '', '', 'temp/FBN1501/10454.html', '10454.html', '342,103,454', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes'),
(10455, 10454, 55, 10342, 3, 229, 230, 180, 182, 181, NULL, 'Activity', '', '', 'temp/FBN1501/10455.html', '10455.html', '342,103,454,455', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/activity'),
(10456, 10454, 55, 10342, 3, 231, 232, 186, 188, 187, NULL, 'Activity 1', '', '', 'temp/FBN1501/10456.html', '10456.html', '342,103,454,456', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/activity-1'),
(10457, 10454, 55, 10342, 3, 233, 234, 187, 189, 188, NULL, 'Activity 2', '', '', 'temp/FBN1501/10457.html', '10457.html', '342,103,454,457', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/activity-2'),
(10458, 10454, 55, 10342, 3, 235, 236, 190, 192, 191, NULL, 'Activity 3', '', '', 'temp/FBN1501/10458.html', '10458.html', '342,103,454,458', 12, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/activity-3'),
(10459, 10454, 55, 10342, 3, 237, 238, 191, 193, 192, NULL, 'Activity 4', '', '', 'temp/FBN1501/10459.html', '10459.html', '342,103,454,459', 13, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/roots-with-higher-indexes/activity-4'),
(10460, 10103, 55, 10342, 2, 240, 245, 193, 195, 194, NULL, 'Exercise', '', '', 'temp/FBN1501/10460.html', '10460.html', '342,103,460', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/exercise'),
(10461, 10460, 55, 10342, 3, 243, 244, 195, 197, 196, NULL, 'Exercise', '', '', 'temp/FBN1501/10461.html', '10461.html', '342,103,460,461', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/exercise/exercise'),
(10462, 10103, 55, 10342, 2, 246, 251, 196, 198, 197, NULL, 'Assignment', '', '', 'temp/FBN1501/10462.html', '10462.html', '342,103,462', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/assignment'),
(10463, 10462, 55, 10342, 3, 249, 250, 198, 200, 199, NULL, 'Questions', '', '', 'temp/FBN1501/10463.html', '10463.html', '342,103,462,463', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/roots/assignment/questions'),
(10464, 10104, 55, 10342, 2, 254, 255, 200, 202, 201, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10464.html', '10464.html', '342,104,464', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/learning-objectives'),
(10465, 10104, 55, 10342, 2, 256, 273, 201, 203, 202, NULL, 'Ratios', '', '', 'temp/FBN1501/10465.html', '10465.html', '342,104,465', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios'),
(10466, 10465, 55, 10342, 3, 265, 266, 204, 206, 205, NULL, 'Activity 1', '', '', 'temp/FBN1501/10466.html', '10466.html', '342,104,465,466', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/activity-1'),
(10467, 10465, 55, 10342, 3, 267, 268, 207, 209, 208, NULL, 'Activity 2', '', '', 'temp/FBN1501/10467.html', '10467.html', '342,104,465,467', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/activity-2'),
(10468, 10465, 55, 10342, 3, 269, 270, 208, 210, 209, NULL, 'Activity 3', '', '', 'temp/FBN1501/10468.html', '10468.html', '342,104,465,468', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/activity-3'),
(10470, 10465, 55, 10342, 3, 271, 272, 209, 211, 210, NULL, 'Activity 4', '', '', 'temp/FBN1501/10470.html', '10470.html', '342,104,465,470', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/ratios/activity-4'),
(10471, 10104, 55, 10342, 2, 274, 285, 210, 212, 211, NULL, 'Proportion', '', '', 'temp/FBN1501/10471.html', '10471.html', '342,104,471', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/proportion');
INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(10472, 10471, 55, 10342, 3, 281, 282, 214, 216, 215, NULL, 'Activity 1', '', '', 'temp/FBN1501/10472.html', '10472.html', '342,104,471,472', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/proportion/activity-1'),
(10473, 10471, 55, 10342, 3, 283, 284, 215, 217, 216, NULL, 'Activity 2', '', '', 'temp/FBN1501/10473.html', '10473.html', '342,104,471,473', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:27', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/proportion/activity-2'),
(10474, 10104, 55, 10342, 2, 286, 311, 216, 218, 217, NULL, 'Percentages', '', '', 'temp/FBN1501/10474.html', '10474.html', '342,104,474', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages'),
(10475, 10474, 55, 10342, 3, 299, 300, 218, 220, 219, NULL, 'Activity 1', '', '', 'temp/FBN1501/10475.html', '10475.html', '342,104,474,475', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/activity-1'),
(10476, 10474, 55, 10342, 3, 301, 302, 219, 221, 220, NULL, 'Activity 2', '', '', 'temp/FBN1501/10476.html', '10476.html', '342,104,474,476', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/activity-2'),
(10477, 10474, 55, 10342, 3, 303, 304, 222, 224, 223, NULL, 'Activity 3', '', '', 'temp/FBN1501/10477.html', '10477.html', '342,104,474,477', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/activity-3'),
(10478, 10474, 55, 10342, 3, 305, 306, 224, 226, 225, NULL, 'Activity 4', '', '', 'temp/FBN1501/10478.html', '10478.html', '342,104,474,478', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/activity-4'),
(10479, 10474, 55, 10342, 3, 307, 308, 226, 228, 227, NULL, 'Activity 5', '', '', 'temp/FBN1501/10479.html', '10479.html', '342,104,474,479', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/activity-5'),
(10480, 10474, 55, 10342, 3, 309, 310, 228, 230, 229, NULL, 'Activity 6', '', '', 'temp/FBN1501/10480.html', '10480.html', '342,104,474,480', 12, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/percentages/activity-6'),
(10481, 10104, 55, 10342, 2, 312, 317, 229, 231, 230, NULL, 'Exercise', '', '', 'temp/FBN1501/10481.html', '10481.html', '342,104,481', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/exercise'),
(10482, 10481, 55, 10342, 3, 315, 316, 231, 233, 232, NULL, 'Exercise', '', '', 'temp/FBN1501/10482.html', '10482.html', '342,104,481,482', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/exercise/exercise'),
(10483, 10104, 55, 10342, 2, 318, 323, 232, 234, 233, NULL, 'Assignment', '', '', 'temp/FBN1501/10483.html', '10483.html', '342,104,483', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/assignment'),
(10484, 10483, 55, 10342, 3, 321, 322, 234, 236, 235, NULL, 'Questions', '', '', 'temp/FBN1501/10484.html', '10484.html', '342,104,483,484', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/ratios-proportions-and-percentages/assignment/questions'),
(10485, 10105, 55, 10342, 2, 326, 327, 236, 238, 237, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10485.html', '10485.html', '342,105,485', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/learning-objectives'),
(10486, 10105, 55, 10342, 2, 328, 337, 237, 239, 238, NULL, 'Signs and notations', '', '', 'temp/FBN1501/10486.html', '10486.html', '342,105,486', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/signs-and-notations'),
(10487, 10486, 55, 10342, 3, 335, 336, 241, 243, 242, NULL, 'Activity', '', '', 'temp/FBN1501/10487.html', '10487.html', '342,105,486,487', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/signs-and-notations/activity'),
(10488, 10105, 55, 10342, 2, 338, 345, 242, 244, 243, NULL, 'Positive and negative numbers', '', '', 'temp/FBN1501/10488.html', '10488.html', '342,105,488', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/positive-and-negative-numbers'),
(10489, 10105, 55, 10342, 2, 346, 351, 246, 248, 247, NULL, 'Summation', '', '', 'temp/FBN1501/10489.html', '10489.html', '342,105,489', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/summation'),
(10490, 10489, 55, 10342, 3, 349, 350, 248, 250, 249, NULL, 'Activity', '', '', 'temp/FBN1501/10490.html', '10490.html', '342,105,489,490', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/summation/activity'),
(10491, 10105, 55, 10342, 2, 352, 359, 249, 251, 250, NULL, 'Factorial', '', '', 'temp/FBN1501/10491.html', '10491.html', '342,105,491', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/factorial'),
(10492, 10491, 55, 10342, 3, 357, 358, 252, 254, 253, NULL, 'Activity', '', '', 'temp/FBN1501/10492.html', '10492.html', '342,105,491,492', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/factorial/activity'),
(10493, 10105, 55, 10342, 2, 360, 367, 253, 255, 254, NULL, 'Permutations', '', '', 'temp/FBN1501/10493.html', '10493.html', '342,105,493', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations'),
(10494, 10493, 55, 10342, 3, 365, 366, 255, 257, 256, NULL, 'Activity', '', '', 'temp/FBN1501/10494.html', '10494.html', '342,105,493,494', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:28', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations/activity'),
(10495, 10105, 55, 10342, 2, 368, 379, 257, 259, 258, NULL, 'Permutations versus combinations', '', '', 'temp/FBN1501/10495.html', '10495.html', '342,105,495', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-versus-combinations'),
(10496, 10495, 55, 10342, 3, 375, 376, 260, 262, 261, NULL, 'Activity 1', '', '', 'temp/FBN1501/10496.html', '10496.html', '342,105,495,496', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-versus-combinations/activity-1'),
(10497, 10495, 55, 10342, 3, 377, 378, 262, 264, 263, NULL, 'Activity 2', '', '', 'temp/FBN1501/10497.html', '10497.html', '342,105,495,497', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-versus-combinations/activity-2'),
(10498, 10105, 55, 10342, 2, 380, 385, 263, 265, 264, NULL, 'Permutations with repetition', '', '', 'temp/FBN1501/10498.html', '10498.html', '342,105,498', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-with-repetition'),
(10499, 10498, 55, 10342, 3, 383, 384, 265, 267, 266, NULL, 'Activity', '', '', 'temp/FBN1501/10499.html', '10499.html', '342,105,498,499', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/permutations-with-repetition/activity'),
(10500, 10105, 55, 10342, 2, 386, 391, 266, 268, 267, NULL, 'Exercise', '', '', 'temp/FBN1501/10500.html', '10500.html', '342,105,500', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/exercise'),
(10501, 10500, 55, 10342, 3, 389, 390, 268, 270, 269, NULL, 'Exercise', '', '', 'temp/FBN1501/10501.html', '10501.html', '342,105,500,501', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/exercise/exercise'),
(10502, 10105, 55, 10342, 2, 392, 397, 269, 271, 270, NULL, 'Assignment', '', '', 'temp/FBN1501/10502.html', '10502.html', '342,105,502', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/assignment'),
(10503, 10502, 55, 10342, 3, 395, 396, 271, 273, 272, NULL, 'Questions', '', '', 'temp/FBN1501/10503.html', '10503.html', '342,105,502,503', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/signs-notations-and-counting-rules/assignment/questions'),
(10504, 10106, 55, 10342, 2, 402, 403, 273, 275, 274, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10504.html', '10504.html', '342,106,504', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/learning-objectives'),
(10505, 10106, 55, 10342, 2, 404, 415, 275, 277, 276, NULL, 'Length', '', '', 'temp/FBN1501/10505.html', '10505.html', '342,106,505', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/length'),
(10506, 10505, 55, 10342, 3, 411, 412, 278, 280, 279, NULL, 'Activity 1', '', '', 'temp/FBN1501/10506.html', '10506.html', '342,106,505,506', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/length/activity-1'),
(10507, 10505, 55, 10342, 3, 413, 414, 280, 282, 281, NULL, 'Activity 2', '', '', 'temp/FBN1501/10507.html', '10507.html', '342,106,505,507', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/length/activity-2'),
(10508, 10106, 55, 10342, 2, 416, 425, 281, 283, 282, NULL, 'Area', '', '', 'temp/FBN1501/10508.html', '10508.html', '342,106,508', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/area'),
(10509, 10508, 55, 10342, 3, 423, 424, 285, 287, 286, NULL, 'Activity', '', '', 'temp/FBN1501/10509.html', '10509.html', '342,106,508,509', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/area/activity'),
(10510, 10106, 55, 10342, 2, 426, 437, 286, 288, 287, NULL, 'Volume', '', '', 'temp/FBN1501/10510.html', '10510.html', '342,106,510', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/volume'),
(10511, 10510, 55, 10342, 3, 433, 434, 290, 292, 291, NULL, 'Activity 1', '', '', 'temp/FBN1501/10511.html', '10511.html', '342,106,510,511', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/volume/activity-1'),
(10512, 10510, 55, 10342, 3, 435, 436, 291, 293, 292, NULL, 'Activity 2', '', '', 'temp/FBN1501/10512.html', '10512.html', '342,106,510,512', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/volume/activity-2'),
(10513, 10106, 55, 10342, 2, 438, 443, 292, 294, 293, NULL, 'Exercise', '', '', 'temp/FBN1501/10513.html', '10513.html', '342,106,513', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/exercise'),
(10514, 10513, 55, 10342, 3, 441, 442, 294, 296, 295, NULL, 'Exercise', '', '', 'temp/FBN1501/10514.html', '10514.html', '342,106,513,514', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/exercise/exercise'),
(10515, 10106, 55, 10342, 2, 444, 449, 295, 297, 296, NULL, 'Assignment', '', '', 'temp/FBN1501/10515.html', '10515.html', '342,106,515', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/assignment'),
(10516, 10515, 55, 10342, 3, 447, 448, 297, 299, 298, NULL, 'Questions', '', '', 'temp/FBN1501/10516.html', '10516.html', '342,106,515,516', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:29', '', '/numbers-and-working-with-numbers/units-and-measures/assignment/questions'),
(10517, 10343, 55, 10343, 1, 689, 766, 334, 336, 335, NULL, 'Transformation and rates', 'Index and number transformations', '', 'temp/FBN1501/10517.html', '10517.html', '343,517', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates'),
(10518, 1085, 55, 10343, 2, 614, 615, 300, 302, 301, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10518.html', '10518.html', '343,85,518', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/index-numbers-and-transformations/index-numbers/learning-objectives'),
(10519, 10517, 55, 10343, 2, 690, 691, 335, 337, 336, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10519.html', '10519.html', '343,517,519', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/learning-objectives'),
(10520, 1085, 55, 10343, 2, 616, 623, 301, 303, 302, NULL, 'Simple index', '', '', 'temp/FBN1501/10520.html', '10520.html', '343,85,520', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/index-numbers-and-transformations/index-numbers/simple-index'),
(10521, 10520, 55, 10343, 3, 621, 622, 304, 306, 305, NULL, 'Activity', '', '', 'temp/FBN1501/10521.html', '10521.html', '343,85,520,521', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:31', '', '/index-numbers-and-transformations/index-numbers/simple-index/activity'),
(10522, 1085, 55, 10343, 2, 624, 629, 305, 307, 306, NULL, 'Composite index', '', '', 'temp/FBN1501/10522.html', '10522.html', '343,85,522', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/composite-index'),
(10523, 1085, 55, 10343, 2, 630, 637, 308, 310, 309, NULL, 'Weighted composite index (WCI)', '', '', 'temp/FBN1501/10523.html', '10523.html', '343,85,523', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/weighted-composite-index-wci'),
(10524, 10523, 55, 10343, 3, 635, 636, 311, 313, 312, NULL, 'Activity', '', '', 'temp/FBN1501/10524.html', '10524.html', '343,85,523,524', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/weighted-composite-index-wci/activity'),
(10525, 1085, 55, 10343, 2, 638, 649, 312, 314, 313, NULL, 'WCI -  Laspeyres and Paasche', '', '', 'temp/FBN1501/10525.html', '10525.html', '343,85,525', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---laspeyres-and-paasche'),
(10526, 10525, 55, 10343, 3, 647, 648, 315, 317, 316, NULL, 'Activity', '', '', 'temp/FBN1501/10526.html', '10526.html', '343,85,525,526', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---laspeyres-and-paasche/activity'),
(10527, 1085, 55, 10343, 2, 650, 657, 318, 320, 319, NULL, 'WCI - Value index', '', '', 'temp/FBN1501/10527.html', '10527.html', '343,85,527', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---value-index'),
(10528, 10527, 55, 10343, 3, 653, 654, 320, 322, 321, NULL, 'Activity', '', '', 'temp/FBN1501/10528.html', '10528.html', '343,85,527,528', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---value-index/activity'),
(10529, 1085, 55, 10343, 2, 658, 671, 321, 323, 322, NULL, 'WCI - CPI', '', '', 'temp/FBN1501/10529.html', '10529.html', '343,85,529', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi'),
(10530, 10529, 55, 10343, 3, 667, 668, 325, 327, 326, NULL, 'Activity 1', '', '', 'temp/FBN1501/10530.html', '10530.html', '343,85,529,530', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi/activity-1'),
(10531, 10529, 55, 10343, 3, 669, 670, 327, 329, 328, NULL, 'Activity 2', '', '', 'temp/FBN1501/10531.html', '10531.html', '343,85,529,531', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---cpi/activity-2'),
(10532, 1085, 55, 10343, 2, 672, 681, 328, 330, 329, NULL, 'Exercise', '', '', 'temp/FBN1501/10532.html', '10532.html', '343,85,532', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/exercise'),
(10533, 10532, 55, 10343, 3, 673, 674, 329, 331, 330, NULL, 'Instructions', '', '', 'temp/FBN1501/10533.html', '10533.html', '343,85,532,533', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/exercise/instructions'),
(10534, 10532, 55, 10343, 3, 675, 676, 330, 332, 331, NULL, 'Exercise', '', '', 'temp/FBN1501/10534.html', '10534.html', '343,85,532,534', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/exercise/exercise'),
(10535, 1085, 55, 10343, 2, 682, 687, 331, 333, 332, NULL, 'Assignment', '', '', 'temp/FBN1501/10535.html', '10535.html', '343,85,535', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/assignment'),
(10536, 10535, 55, 10343, 3, 683, 684, 332, 334, 333, NULL, 'Information', '', '', 'temp/FBN1501/10536.html', '10536.html', '343,85,535,536', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/assignment/information'),
(10537, 10535, 55, 10343, 3, 685, 686, 333, 335, 334, NULL, 'Questions', '', '', 'temp/FBN1501/10537.html', '10537.html', '343,85,535,537', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/assignment/questions'),
(10538, 10517, 55, 10343, 2, 692, 703, 336, 338, 337, NULL, 'Consumer price index', '', '', 'temp/FBN1501/10538.html', '10538.html', '343,517,538', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/consumer-price-index'),
(10539, 10538, 55, 10343, 3, 699, 700, 339, 341, 340, NULL, 'Activity 1', '', '', 'temp/FBN1501/10539.html', '10539.html', '343,517,538,539', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/consumer-price-index/activity-1'),
(10540, 10538, 55, 10343, 3, 701, 702, 341, 343, 342, NULL, 'Activity 2', '', '', 'temp/FBN1501/10540.html', '10540.html', '343,517,538,540', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/consumer-price-index/activity-2'),
(10541, 10517, 55, 10343, 2, 704, 715, 342, 344, 343, NULL, 'Exchange rate', '', '', 'temp/FBN1501/10541.html', '10541.html', '343,517,541', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/exchange-rate'),
(10542, 10541, 55, 10343, 3, 711, 712, 346, 348, 347, NULL, 'Activity 1', '', '', 'temp/FBN1501/10542.html', '10542.html', '343,517,541,542', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/transformation-and-rates/exchange-rate/activity-1'),
(10543, 10541, 55, 10343, 3, 713, 714, 347, 349, 348, NULL, 'Activity 2', '', '', 'temp/FBN1501/10543.html', '10543.html', '343,517,541,543', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/exchange-rate/activity-2'),
(10544, 10517, 55, 10343, 2, 716, 725, 348, 350, 349, NULL, 'Fine ounce', '', '', 'temp/FBN1501/10544.html', '10544.html', '343,517,544', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/fine-ounce'),
(10545, 10544, 55, 10343, 3, 721, 722, 351, 353, 352, NULL, 'Activity 1', '', '', 'temp/FBN1501/10545.html', '10545.html', '343,517,544,545', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/fine-ounce/activity-1'),
(10546, 10544, 55, 10343, 3, 723, 724, 352, 354, 353, NULL, 'Activity 2', '', '', 'temp/FBN1501/10546.html', '10546.html', '343,517,544,546', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/fine-ounce/activity-2'),
(10547, 10517, 55, 10343, 2, 726, 751, 353, 355, 354, NULL, 'GDP and growth rate', '', '', 'temp/FBN1501/10547.html', '10547.html', '343,517,547', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate'),
(10548, 10547, 55, 10343, 3, 747, 748, 356, 358, 357, NULL, 'Activity 1', '', '', 'temp/FBN1501/10548.html', '10548.html', '343,517,547,548', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/activity-1'),
(10549, 10547, 55, 10343, 3, 749, 750, 362, 364, 363, NULL, 'Activity 2', '', '', 'temp/FBN1501/10549.html', '10549.html', '343,517,547,549', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/gdp-and-growth-rate/activity-2'),
(10550, 10517, 55, 10343, 2, 752, 759, 366, 368, 367, NULL, 'Exercise', '', '', 'temp/FBN1501/10550.html', '10550.html', '343,517,550', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/exercise'),
(10551, 10550, 55, 10343, 3, 755, 756, 368, 370, 369, NULL, 'Exercise', '', '', 'temp/FBN1501/10551.html', '10551.html', '343,517,550,551', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/exercise/exercise'),
(10552, 10517, 55, 10343, 2, 760, 765, 369, 371, 370, NULL, 'Assignment', '', '', 'temp/FBN1501/10552.html', '10552.html', '343,517,552', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/assignment'),
(10553, 10552, 55, 10343, 3, 763, 764, 371, 373, 372, NULL, 'Questions', '', '', 'temp/FBN1501/10553.html', '10553.html', '343,517,552,553', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/assignment/questions'),
(10554, 1080, 55, 10344, 2, 770, 771, 374, 376, 375, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10554.html', '10554.html', '344,80,554', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/learning-objectives'),
(10555, 1080, 55, 10344, 2, 772, 781, 375, 377, 376, NULL, 'Introduction', '', '', 'temp/FBN1501/10555.html', '10555.html', '344,80,555', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/introduction'),
(10556, 1080, 55, 10344, 2, 782, 789, 380, 382, 381, NULL, 'Sampling', '', '', 'temp/FBN1501/10556.html', '10556.html', '344,80,556', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/collection-presentation-and-description-of-data/data-collection/sampling'),
(10557, 1080, 55, 10344, 2, 790, 801, 384, 386, 385, NULL, 'Simple random sampling', '', '', 'temp/FBN1501/10557.html', '10557.html', '344,80,557', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/simple-random-sampling'),
(10558, 10557, 55, 10344, 3, 799, 800, 389, 391, 390, NULL, 'Activity', '', '', 'temp/FBN1501/10558.html', '10558.html', '344,80,557,558', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/simple-random-sampling/activity'),
(10559, 1080, 55, 10344, 2, 802, 809, 390, 392, 391, NULL, 'Stratified random sampling', '', '', 'temp/FBN1501/10559.html', '10559.html', '344,80,559', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/stratified-random-sampling'),
(10560, 10559, 55, 10344, 3, 807, 808, 393, 395, 394, NULL, 'Activity', '', '', 'temp/FBN1501/10560.html', '10560.html', '344,80,559,560', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/stratified-random-sampling/activity'),
(10561, 1080, 55, 10344, 2, 810, 817, 394, 396, 395, NULL, 'Systematic sampling', '', '', 'temp/FBN1501/10561.html', '10561.html', '344,80,561', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/systematic-sampling'),
(10562, 1080, 55, 10344, 2, 818, 823, 398, 400, 399, NULL, 'Exercise', '', '', 'temp/FBN1501/10562.html', '10562.html', '344,80,562', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/exercise'),
(10563, 10562, 55, 10344, 3, 821, 822, 400, 402, 401, NULL, 'Exercise', '', '', 'temp/FBN1501/10563.html', '10563.html', '344,80,562,563', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/exercise/exercise'),
(10564, 1080, 55, 10344, 2, 824, 829, 401, 403, 402, NULL, 'Assignment', '', '', 'temp/FBN1501/10564.html', '10564.html', '344,80,564', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/assignment'),
(10565, 10564, 55, 10344, 3, 827, 828, 403, 405, 404, NULL, 'Questions', '', '', 'temp/FBN1501/10565.html', '10565.html', '344,80,564,565', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/data-collection/assignment/questions'),
(10566, 10107, 55, 10344, 2, 832, 833, 405, 407, 406, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10566.html', '10566.html', '344,107,566', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/learning-objectives'),
(10567, 10107, 55, 10344, 2, 834, 845, 406, 408, 407, NULL, 'Introduction', '', '', 'temp/FBN1501/10567.html', '10567.html', '344,107,567', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/introduction'),
(10568, 10567, 55, 10344, 3, 841, 842, 410, 412, 411, NULL, 'Activity 1', '', '', 'temp/FBN1501/10568.html', '10568.html', '344,107,567,568', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/introduction/activity-1'),
(10569, 10567, 55, 10344, 3, 843, 844, 411, 413, 412, NULL, 'Activity 2', '', '', 'temp/FBN1501/10569.html', '10569.html', '344,107,567,569', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/introduction/activity-2'),
(10570, 10107, 55, 10344, 2, 846, 853, 412, 414, 413, NULL, 'Bar representations', '', '', 'temp/FBN1501/10570.html', '10570.html', '344,107,570', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/bar-representations'),
(10571, 10107, 55, 10344, 2, 854, 879, 416, 418, 417, NULL, 'Frequency table', '', '', 'temp/FBN1501/10571.html', '10571.html', '344,107,571', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table'),
(10572, 10571, 55, 10344, 3, 865, 866, 421, 423, 422, NULL, 'Activity 1', '', '', 'temp/FBN1501/10572.html', '10572.html', '344,107,571,572', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/activity-1'),
(10573, 10571, 55, 10344, 3, 867, 868, 422, 424, 423, NULL, 'Activity 2', '', '', 'temp/FBN1501/10573.html', '10573.html', '344,107,571,573', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/activity-2'),
(10574, 10571, 55, 10344, 3, 869, 870, 420, 422, 421, NULL, 'Relative frequency', '', '', 'temp/FBN1501/10574.html', '10574.html', '344,107,571,574', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/relative-frequency'),
(10575, 10571, 55, 10344, 3, 871, 872, 424, 426, 425, NULL, 'Activity 3', '', '', 'temp/FBN1501/10575.html', '10575.html', '344,107,571,575', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/activity-3'),
(10576, 10571, 55, 10344, 3, 873, 874, 425, 427, 426, NULL, 'Activity 4', '', '', 'temp/FBN1501/10576.html', '10576.html', '344,107,571,576', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/activity-4'),
(10577, 10571, 55, 10344, 3, 875, 876, 426, 428, 427, NULL, 'Activity 5', '', '', 'temp/FBN1501/10577.html', '10577.html', '344,107,571,577', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/activity-5'),
(10578, 10571, 55, 10344, 3, 877, 878, 428, 430, 429, NULL, 'Activity 6', '', '', 'temp/FBN1501/10578.html', '10578.html', '344,107,571,578', 12, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/frequency-table/activity-6'),
(10579, 10107, 55, 10344, 2, 880, 885, 429, 431, 430, NULL, 'Pie chart', '', '', 'temp/FBN1501/10579.html', '10579.html', '344,107,579', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/pie-chart'),
(10580, 10579, 55, 10344, 3, 883, 884, 431, 433, 432, NULL, 'Activity', '', '', 'temp/FBN1501/10580.html', '10580.html', '344,107,579,580', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:34', '', '/collection-presentation-and-description-of-data/presentations/pie-chart/activity'),
(10581, 10107, 55, 10344, 2, 886, 897, 432, 434, 433, NULL, 'Cumulative frequency', '', '', 'temp/FBN1501/10581.html', '10581.html', '344,107,581', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/cumulative-frequency'),
(10582, 10581, 55, 10344, 3, 891, 892, 434, 436, 435, NULL, 'Activity 1', '', '', 'temp/FBN1501/10582.html', '10582.html', '344,107,581,582', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/cumulative-frequency/activity-1'),
(10583, 10581, 55, 10344, 3, 893, 894, 436, 438, 437, NULL, 'Activity 2', '', '', 'temp/FBN1501/10583.html', '10583.html', '344,107,581,583', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/cumulative-frequency/activity-2'),
(10584, 10581, 55, 10344, 3, 895, 896, 437, 439, 438, NULL, 'Activity 3', '', '', 'temp/FBN1501/10584.html', '10584.html', '344,107,581,584', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/cumulative-frequency/activity-3'),
(10585, 10107, 55, 10344, 2, 898, 909, 438, 440, 439, NULL, 'Stem-and-leaf diagram', '', '', 'temp/FBN1501/10585.html', '10585.html', '344,107,585', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/stem-and-leaf-diagram'),
(10586, 10585, 55, 10344, 3, 905, 906, 441, 443, 442, NULL, 'Activity 1', '', '', 'temp/FBN1501/10586.html', '10586.html', '344,107,585,586', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/stem-and-leaf-diagram/activity-1'),
(10587, 10585, 55, 10344, 3, 907, 908, 443, 445, 444, NULL, 'Activity 2', '', '', 'temp/FBN1501/10587.html', '10587.html', '344,107,585,587', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/stem-and-leaf-diagram/activity-2'),
(10588, 10107, 55, 10344, 2, 910, 915, 444, 446, 445, NULL, 'Exercise', '', '', 'temp/FBN1501/10588.html', '10588.html', '344,107,588', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/exercise'),
(10589, 10107, 55, 10344, 2, 916, 921, 447, 449, 448, NULL, 'Assignment', '', '', 'temp/FBN1501/10589.html', '10589.html', '344,107,589', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/assignment'),
(10590, 10588, 55, 10344, 3, 913, 914, 446, 448, 447, NULL, 'Exercise', '', '', 'temp/FBN1501/10590.html', '10590.html', '344,107,588,590', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/exercise/exercise'),
(10591, 10589, 55, 10344, 3, 919, 920, 449, 451, 450, NULL, 'Questions', '', '', 'temp/FBN1501/10591.html', '10591.html', '344,107,589,591', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/presentations/assignment/questions'),
(10592, 10108, 55, 10344, 2, 928, 929, 451, 453, 452, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10592.html', '10592.html', '344,108,592', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/learning-objectives'),
(10594, 10108, 55, 10344, 2, 930, 939, 453, 455, 454, NULL, 'Mean (Raw data)', '', '', 'temp/FBN1501/10594.html', '10594.html', '344,108,594', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-raw-data'),
(10595, 10594, 55, 10344, 3, 937, 938, 455, 457, 456, NULL, 'Activity', '', '', 'temp/FBN1501/10595.html', '10595.html', '344,108,594,595', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-raw-data/activity'),
(10596, 10108, 55, 10344, 2, 940, 947, 458, 460, 459, NULL, 'Mean (Interval data)', '', '', 'temp/FBN1501/10596.html', '10596.html', '344,108,596', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-interval-data'),
(10597, 10596, 55, 10344, 3, 945, 946, 461, 463, 462, NULL, 'Activity', '', '', 'temp/FBN1501/10597.html', '10597.html', '344,108,596,597', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-interval-data/activity'),
(10599, 10108, 55, 10344, 2, 948, 953, 462, 464, 463, NULL, 'Mean (Discrete quantitative data)', '', '', 'temp/FBN1501/10599.html', '10599.html', '344,108,599', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-discrete-quantitative-data'),
(10600, 10599, 55, 10344, 3, 951, 952, 464, 466, 465, NULL, 'Activity 1', '', '', 'temp/FBN1501/10600.html', '10600.html', '344,108,599,600', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/mean-discrete-quantitative-data/activity-1'),
(10602, 10108, 55, 10344, 2, 954, 967, 465, 467, 466, NULL, 'Median', '', '', 'temp/FBN1501/10602.html', '10602.html', '344,108,602', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/median'),
(10603, 10602, 55, 10344, 3, 963, 964, 470, 472, 471, NULL, 'Activity - Odd', '', '', 'temp/FBN1501/10603.html', '10603.html', '344,108,602,603', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:35', '', '/collection-presentation-and-description-of-data/measures-of-locality/median/activity---odd'),
(10604, 10602, 55, 10344, 3, 965, 966, 471, 473, 472, NULL, 'Activity - Even', '', '', 'temp/FBN1501/10604.html', '10604.html', '344,108,602,604', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/median/activity---even'),
(10605, 10108, 55, 10344, 2, 968, 977, 472, 474, 473, NULL, 'Mode', '', '', 'temp/FBN1501/10605.html', '10605.html', '344,108,605', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/mode'),
(10606, 10108, 55, 10344, 2, 978, 983, 477, 479, 478, NULL, 'Distribution of data', '', '', 'temp/FBN1501/10606.html', '10606.html', '344,108,606', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/distribution-of-data'),
(10607, 10606, 55, 10344, 3, 981, 982, 479, 481, 480, NULL, 'Activity', '', '', 'temp/FBN1501/10607.html', '10607.html', '344,108,606,607', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/distribution-of-data/activity'),
(10608, 10108, 55, 10344, 2, 984, 989, 481, 483, 482, NULL, 'Exercise', '', '', 'temp/FBN1501/10608.html', '10608.html', '344,108,608', 10, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/exercise'),
(10609, 10608, 55, 10344, 3, 987, 988, 483, 485, 484, NULL, 'Exercise', '', '', 'temp/FBN1501/10609.html', '10609.html', '344,108,608,609', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/exercise/exercise'),
(10610, 10108, 55, 10344, 2, 990, 995, 484, 486, 485, NULL, 'Assignment', '', '', 'temp/FBN1501/10610.html', '10610.html', '344,108,610', 11, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/assignment'),
(10611, 10610, 55, 10344, 3, 993, 994, 486, 488, 487, NULL, 'Questions', '', '', 'temp/FBN1501/10611.html', '10611.html', '344,108,610,611', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-locality/assignment/questions'),
(10612, 10109, 55, 10344, 2, 1002, 1003, 488, 490, 489, NULL, 'Learning objectives', '', '', 'temp/FBN1501/10612.html', '10612.html', '344,109,612', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/learning-objectives'),
(10613, 10109, 55, 10344, 2, 1004, 1029, 491, 493, 492, NULL, 'Standard deviation', '', '', 'temp/FBN1501/10613.html', '10613.html', '344,109,613', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation'),
(10614, 10613, 55, 10344, 3, 1021, 1022, 494, 496, 495, NULL, 'Activity 1', '', '', 'temp/FBN1501/10614.html', '10614.html', '344,109,613,614', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/activity-1'),
(10615, 10613, 55, 10344, 3, 1023, 1024, 498, 500, 499, NULL, 'Activity 2 - Scores', '', '', 'temp/FBN1501/10615.html', '10615.html', '344,109,613,615', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/activity-2---scores'),
(10616, 10613, 55, 10344, 3, 1025, 1026, 500, 502, 501, NULL, 'Activity 3', '', '', 'temp/FBN1501/10616.html', '10616.html', '344,109,613,616', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/activity-3'),
(10617, 10613, 55, 10344, 3, 1027, 1028, 503, 505, 504, NULL, 'Activity 4', '', '', 'temp/FBN1501/10617.html', '10617.html', '344,109,613,617', 12, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/standard-deviation/activity-4'),
(10618, 10109, 55, 10344, 2, 1030, 1039, 504, 506, 505, NULL, 'Quartiles', '', '', 'temp/FBN1501/10618.html', '10618.html', '344,109,618', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/quartiles'),
(10619, 10618, 55, 10344, 3, 1035, 1036, 507, 509, 508, NULL, 'Activity 1', '', '', 'temp/FBN1501/10619.html', '10619.html', '344,109,618,619', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/quartiles/activity-1'),
(10620, 10618, 55, 10344, 3, 1037, 1038, 508, 510, 509, NULL, 'Activity 2', '', '', 'temp/FBN1501/10620.html', '10620.html', '344,109,618,620', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:36', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/quartiles/activity-2'),
(10621, 10109, 55, 10344, 2, 1040, 1049, 509, 511, 510, NULL, 'Coefficient of variation', '', '', 'temp/FBN1501/10621.html', '10621.html', '344,109,621', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/coefficient-of-variation'),
(10622, 10621, 55, 10344, 3, 1047, 1048, 513, 515, 514, NULL, 'Activity', '', '', 'temp/FBN1501/10622.html', '10622.html', '344,109,621,622', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/coefficient-of-variation/activity'),
(10623, 10109, 55, 10344, 2, 1050, 1061, 514, 516, 515, NULL, 'Box-and-whiskers diagram', '', '', 'temp/FBN1501/10623.html', '10623.html', '344,109,623', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/box-and-whiskers-diagram'),
(10624, 10623, 55, 10344, 3, 1057, 1058, 517, 519, 518, NULL, 'Activity 1', '', '', 'temp/FBN1501/10624.html', '10624.html', '344,109,623,624', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/box-and-whiskers-diagram/activity-1'),
(10625, 10623, 55, 10344, 3, 1059, 1060, 519, 521, 520, NULL, 'Activity 2', '', '', 'temp/FBN1501/10625.html', '10625.html', '344,109,623,625', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/box-and-whiskers-diagram/activity-2'),
(10626, 10109, 55, 10344, 2, 1062, 1067, 520, 522, 521, NULL, 'Exercise', '', '', 'temp/FBN1501/10626.html', '10626.html', '344,109,626', 8, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/exercise'),
(10627, 10626, 55, 10344, 3, 1065, 1066, 522, 524, 523, NULL, 'Exercise', '', '', 'temp/FBN1501/10627.html', '10627.html', '344,109,626,627', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/exercise/exercise'),
(10628, 10109, 55, 10344, 2, 1068, 1073, 523, 525, 524, NULL, 'Assignment', '', '', 'temp/FBN1501/10628.html', '10628.html', '344,109,628', 9, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/assignment'),
(10629, 10628, 55, 10344, 3, 1071, 1072, 525, 527, 526, NULL, 'Questions', '', '', 'temp/FBN1501/10629.html', '10629.html', '344,109,628,629', 2, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/collection-presentation-and-description-of-data/measures-of-dispersion-and-box-and-whiskers-diagram/assignment/questions'),
(10630, 20344, 55, 0, 0, 1076, 1077, -1, 1, 0, NULL, 'add_topic', '', '', 'temp/FBN1501/10630.html', '10630.html', '630', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/add_topic'),
(10631, 20344, 55, 0, 0, 1078, 1079, -1, 1, 0, NULL, 'return_url', '', '', 'temp/FBN1501/10631.html', '10631.html', '631', 7, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/return_url'),
(10632, 10341, 55, 10341, 1, 9, 10, -1, 1, 0, NULL, 'reset_scores', '', '', 'temp/FBN1501/10632.html', '10632.html', '341,632', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages/reset_scores'),
(10635, 10341, 55, 10341, 1, 11, 12, -1, 1, 0, NULL, 'page_ordering', '', '', 'temp/FBN1501/10635.html', '10635.html', '341,635', 5, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages/page_ordering'),
(10636, 20344, 55, 0, 0, 1080, 1083, -1, 1, 0, NULL, 'Welcome', '', '', 'temp/FBN1501/10636.html', '10636.html', '636', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/welcome'),
(10637, 10636, 55, 10636, 1, 1081, 1082, -1, 1, 0, NULL, 'Please click here for instructions before proceeding', '', '', 'temp/FBN1501/10637.html', '10637.html', '636,637', 1, '2017-04-21 06:56:44', '2017-05-02 03:43:37', '', '/welcome/please-click-here-for-instructions-before-proceeding'),
(10640, 10341, 55, 10341, 1, 13, 14, -1, 1, 0, NULL, 'page_add_test', '', '', 'temp/FBN1501/10640.html', '10640.html', '341,640', 6, '2017-04-21 06:56:44', '2017-05-02 03:43:23', '', '/test-other-pages/page_add_test'),
(10641, 10527, 55, 10343, 3, 655, 656, -1, 1, 0, NULL, 'Toets', '', '', 'temp/FBN1501/10641.html', '10641.html', '343,85,527,641', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/wci---value-index/toets'),
(10643, 10532, 55, 10343, 3, 677, 678, -1, 1, 0, NULL, 'ExerciseTest', '', '', 'temp/FBN1501/10643.html', '10643.html', '343,85,532,643', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/exercise/exercisetest'),
(10644, 10550, 55, 10343, 3, 757, 758, -1, 1, 0, NULL, 'ExerciseTest', '', '', 'temp/FBN1501/10644.html', '10644.html', '343,517,550,644', 3, '2017-04-21 06:56:44', '2017-05-02 03:43:33', '', '/index-numbers-and-transformations/transformation-and-rates/exercise/exercisetest'),
(10645, 10532, 55, 10343, 3, 679, 680, -1, 1, 0, NULL, 'ExerciseTest2', '', '', 'temp/FBN1501/10645.html', '10645.html', '343,85,532,645', 4, '2017-04-21 06:56:44', '2017-05-02 03:43:32', '', '/index-numbers-and-transformations/index-numbers/exercise/exercisetest2'),
(20344, NULL, 55, NULL, NULL, 1, 1084, NULL, NULL, 0, NULL, 'FBN1501 - Business Numerical Skills A', NULL, NULL, NULL, NULL, NULL, NULL, '2017-05-02 05:40:23', '2017-05-02 03:43:37', NULL, NULL),
(20346, 20345, 56, NULL, 1, 2, 3, NULL, NULL, 0, NULL, 'FBN1503 Business Identity Skills.1', NULL, NULL, '', '', NULL, NULL, '2017-05-02 06:38:01', '2017-05-02 06:38:21', NULL, NULL),
(20368, NULL, 70, NULL, 0, 1, 22, NULL, NULL, 0, NULL, 'Demo', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/614.html', '614.html', NULL, NULL, '2017-05-12 07:35:50', '2017-05-16 08:58:03', NULL, NULL),
(20369, 20368, 70, NULL, 1, 2, 13, NULL, NULL, 0, NULL, 'Amortisation', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/444-0.html', '444-0.html', NULL, NULL, '2017-05-12 07:35:50', '2017-05-16 08:58:03', NULL, NULL),
(20370, 20368, 70, NULL, 1, 14, 21, NULL, NULL, 0, NULL, 'Linear Functions', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/155.html', '155.html', NULL, NULL, '2017-05-12 07:35:50', '2017-05-16 08:58:03', NULL, NULL),
(20371, 20370, 70, NULL, 2, 15, 16, NULL, NULL, 0, NULL, 'Graph', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/470.html', '470.html', NULL, NULL, '2017-05-12 07:35:50', '2017-05-16 08:58:03', NULL, NULL),
(20372, 20370, 70, NULL, 2, 17, 18, NULL, NULL, 0, NULL, 'Exercise', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/491.html', '491.html', NULL, NULL, '2017-05-12 07:35:50', '2017-05-16 08:58:03', NULL, NULL),
(20373, 20370, 70, NULL, 2, 19, 20, NULL, NULL, 0, NULL, 'Self Assessment', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/489.html', '489.html', NULL, NULL, '2017-05-12 07:35:50', '2017-05-16 08:58:03', NULL, NULL),
(20374, 20369, 70, NULL, 2, 3, 4, NULL, NULL, 0, NULL, 'Learning Objectives', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/444.html', '444.html', NULL, NULL, '2017-05-12 07:41:46', '2017-05-16 08:58:03', NULL, NULL),
(20375, 20369, 70, NULL, 2, 5, 6, NULL, NULL, 0, NULL, 'Introduction', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/80.html', '80.html', NULL, NULL, '2017-05-12 07:41:46', '2017-05-16 08:58:03', NULL, NULL),
(20376, 20369, 70, NULL, 2, 7, 8, NULL, NULL, 0, NULL, 'Calculate Payments - Video', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/84.html', '84.html', NULL, NULL, '2017-05-12 07:41:46', '2017-05-16 08:58:03', NULL, NULL),
(20377, 20369, 70, NULL, 2, 9, 10, NULL, NULL, 0, NULL, 'Calculate Payments - Formula', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/86.html', '86.html', NULL, NULL, '2017-05-12 07:41:46', '2017-05-16 08:58:03', NULL, NULL),
(20378, 20369, 70, NULL, 2, 11, 12, NULL, NULL, 0, NULL, 'Activity', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/html/334.html', '334.html', NULL, NULL, '2017-05-12 07:41:46', '2017-05-16 08:58:03', NULL, NULL);
INSERT INTO `storyline_items` (`id`, `parent_id`, `storyline_id`, `root_parent`, `level`, `_lft`, `_rgt`, `previous`, `next`, `ordering`, `type`, `name`, `topics`, `description`, `file_url`, `file_name`, `page_trail`, `position`, `created_at`, `updated_at`, `names`, `file_url_backup`) VALUES
(20382, NULL, 71, NULL, 0, 7, 14, NULL, NULL, 0, NULL, 'CS101 FULL COURSE', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/content/1490440367.html', '1490440367.html', NULL, NULL, '2017-07-05 12:06:52', '2017-07-21 08:57:20', NULL, NULL),
(20383, 20382, 71, NULL, 1, 8, 13, NULL, NULL, 0, NULL, 'CS101 FULL COURSE.1', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/content/1490440367.html', '1490440367.html', NULL, NULL, '2017-07-05 12:06:52', '2017-07-21 08:57:20', NULL, NULL),
(20384, 20383, 71, NULL, 2, 9, 10, NULL, NULL, 0, NULL, 'ASSESMENT', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/content/marshall-assess-test.html', 'marshall-assess-test.html', NULL, NULL, '2017-07-05 12:06:52', '2017-07-21 08:57:20', NULL, NULL),
(20385, 20383, 71, NULL, 2, 11, 12, NULL, NULL, 0, NULL, 'GRAPH', NULL, NULL, 'EON/system/public/vendor/storyline/core/files/content/delivery-ppc-self-assesment-test-2.html', 'delivery-ppc-self-assesment-test-2.html', NULL, NULL, '2017-07-07 05:35:45', '2017-07-21 08:57:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jane Instructor23', 'inst@ischool.edu', '$2y$10$LPH005YbRDaEGVUMiHySfemvHrlyXmPeJHXrb2/WaHXEKR6.HXfh.', 'drGG3RC2WNgILifC9W4W1n7SZ32ArX1VBnnW2KZ597BclLjLH4LLnr1pkFXg', '2017-03-07 22:06:40', '2017-03-08 23:06:02'),
(2, 'Sue Student', 'student@ischool.edu', NULL, 'O6cRGkWLqUoLubXrCEuU9vgGEfFQ0TpWIlQtZvEzjTrMhYBc1ivbaIa9hNnJ', '2017-03-07 22:11:50', '2017-03-07 22:11:50'),
(3, 'Ed Student', 'ed@ischool.edu', NULL, NULL, '2017-03-07 21:54:57', '2017-03-07 21:54:57'),
(1400005, 'Peace', 'peacengara@aol.com', '$2y$10$Rwl.7oX4I7OG6puGe1WS1eTnMzzxyC6t3OZ0/EkVqBGAMeVBYRFzO', NULL, '2017-04-10 04:54:09', '2017-04-10 04:54:09'),
(1400006, 'Runyararo', 'runya@yahoo.com', '$2y$10$yCQDNoUsJtyNU8FKoEUG3.pNo7Q1RHD4A/9ZztotHH8Lfg7HMMWIG', 'fD6RUqS12kLx1v6CTDGHboxKXQLyQHcUgalIBTm9CS40tQGK9DwM52nCZLp2', '2017-04-10 04:57:39', '2017-04-10 04:57:39'),
(1400007, 'Josh Harington', 'josh1@live.co.za', '$2y$10$NmYUM1hoeImbGPtAAakTZ.wmS85r4EZWjwbO05G.gxPkSQu0TqwDy', 'PE21Iccsm6AnjudSEBKHtFwzH5UL5pe144crtPgCjw1LwWnNK3YnyFPJPaS5', '2017-04-10 22:22:15', '2017-04-10 22:22:15'),
(1400008, 'Peace', 'dev@webhoop.co.za', '$2y$10$00zh8XqDoEQ1zgIeaFJF9OWDHujLy34jLX5RRhS/y4s8lfdC/ncuy', NULL, '2017-04-11 10:20:06', '2017-04-11 10:20:06'),
(1400010, 'Benedict', 'benedict.pabazhira@eon.co.za', '$2y$10$ZFK2GxCV5shHn50bSdZ1J.iiv65I7OpVNuqgYG4M2Si88OdZP6EM6', 'vZiaSzurSeGYetd2krU6NWmK1ulHbjLDJJ0gSmDriuY9zvJKM0mZ7XghVCUj', '2017-04-20 10:53:24', '2017-04-20 10:53:24'),
(1400011, 'Benedict', 'bmmuffy@gmail.com', '$2y$10$.TkWWwYrsyFvuge33wlIhuGFsqJBGKasfvamtiz1dM5OnmMone4qu', 'RqAdMQ4wSMoV7i3hjvug3UCSD3DPZagnDKe0UjMvVwqkUxF4qa6uqUrMG4BJ', '2017-04-20 11:38:17', '2017-04-20 11:38:17'),
(1400012, 'tawanda@tawanda.com', 'tawanda@tawanda.com', '$2y$10$A0Q0V2mTbE0MEB6nyLqxnuiis10Xcpy4Ojsn/sjygenwTsRoZuPPa', 'hqycIRgfsyjKvRTjMYMoPV05MI9EqAaM8HliUXrGrdFK5QmoG7Kf2ZultmoG', '2017-04-22 17:15:41', '2017-04-22 17:15:41'),
(1400013, 'Jaco du Preez', 'jaco.dupreez@eon.co.za', '$2y$10$/91jR4CRi2/UH8YBNerfj.WqcN6ptXNVz0mXf8wYcez0MKkfyr9FO', 'PKfVZOHJFpJqLaxJMubdH2fexsJVfA3tFVz15umHp6LvHAKQ3bXEBIpntQXc', '2017-04-25 08:14:20', '2017-04-25 08:14:20'),
(1400014, 'Rajeev Mishra', 'rajeev.mishra@eon.co.za', '$2y$10$6mE6059bfJ0n2zm0Y4Ome.hEZAXQHLKPBdc4Tw4iaRaJVCNESS2EO', NULL, '2017-06-12 12:14:11', '2017-06-12 12:14:11'),
(1400015, 'Michelle', 'michelle.warricke@eon.co.za', '$2y$10$iaD1tjmdMybk89r7ziRlYOLGYd24s6tFerR23hp.mUb.DDIRu4wim', NULL, '2017-06-28 06:53:39', '2017-06-28 06:53:39'),
(1400016, 'Michelle', 'michelle.warricke@gmail.com', '$2y$10$UbtU6O3m4ibwtmixe8W.wOzl1ywc6va9lvOdJ..Bk/.9/8LG1u7t2', NULL, '2017-07-03 09:46:10', '2017-07-03 09:46:10'),
(1400017, 'Shylet', 'shyletchawasarira@gmail.com', '$2y$10$UPh.N3EefTI90F5./RlVQOKeDSmEu5.EHYamaO3MyqQVeJRl3.ZIW', NULL, '2017-07-08 00:19:45', '2017-07-08 00:19:45'),
(1400018, 'Marshall Mutambudzi', 'marshall.mutambudzi@protonmail.ch', '$2y$10$/fuM7XDEnzi.REQuZ3WACe3yAoyCxCeWDBb/vGDOsRz4BOI7vRRt2', NULL, '2017-07-24 17:50:44', '2017-07-24 17:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `users_lti_links`
--

CREATE TABLE `users_lti_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lti_user_id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lis_person_contact_email_primary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lis_person_name_family` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lis_person_name_full` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lis_person_name_given` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lis_person_sourcedid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lis_result_sourcedid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_lti_links`
--

INSERT INTO `users_lti_links` (`id`, `user_id`, `lti_user_id`, `context_id`, `lis_person_contact_email_primary`, `lis_person_name_family`, `lis_person_name_full`, `lis_person_name_given`, `lis_person_sourcedid`, `lis_result_sourcedid`, `roles`, `created_at`, `updated_at`) VALUES
(1, 1, '292832126', '456434513', 'inst@ischool.edu', 'Instructor', 'Jane Instructor', 'Jane', 'ischool.edu:inst', 'eba99f886a944318b11234787c1bd636', 'Instructor', '2017-03-07 22:06:40', '2017-03-07 22:06:40'),
(2, 2, '998928898', '456434513', 'student@ischool.edu', 'Student', 'Sue Student', 'Sue', 'ischool.edu:student', '26e988d4c7312a8b49dfa8deb9faa5ee', 'Learner', '2017-03-07 22:11:50', '2017-03-07 22:11:50'),
(3, 3, '121212331', '456434513', 'ed@ischool.edu', 'Student', 'Ed Student', 'Ed', 'ischool.edu:ed', 'd92dc727b3c069898d06e1f0fec491b1', 'Learner', '2017-03-07 21:54:57', '2017-03-07 21:54:57'),
(18, 1400005, '2928321267', '4564345135', 'peacengara@aol.com', 'Ngara', 'Peace', 'Digo', 'proudngara@gmail.com', '5f9f79ac93f6668a3c7b23e65dd15b67', 'Learner', '2017-04-10 04:54:09', '2017-04-10 04:54:09'),
(19, 1400005, '29283212628', '4564345135', 'peacengara@aol.com', 'Ngara', 'Peace', 'Pit', 'ischool.edu:inst', '36ea1191bacc2cc1f0e1c80c2459e739', 'Instructor', '2017-04-10 04:54:50', '2017-04-10 04:54:50'),
(20, 1400006, '29283212687', '45643451355', 'runya@yahoo.com', 'Ngara', 'Runyararo', 'Runya', 'ischool.edu:inst', 'c35c4040e57de343a56d4c44d24b94ed', 'Instructor', '2017-04-10 04:57:39', '2017-04-10 04:57:39'),
(21, 1400007, '1235134', '1', 'josh1@live.co.za', 'Harington', 'Josh Harington', 'Josh', '123456', '123456', 'Instructor', '2017-04-10 22:33:22', '2017-04-10 22:33:22'),
(22, 1400010, '29283212633', '45643451333', 'benedict.pabazhira@eon.co.za', 'Instructor', 'Benedict Pabazhira', 'Benedict', 'ischool.edu:inst', '49b91f52e675d4c1c9bc1fbf46cb7cab', 'Instructor', '2017-04-20 01:50:48', '2017-04-20 01:50:48'),
(23, 1400017, '292832124', '456434513', 'shyletchawasarira@gmail.com', 'Instructor', 'Shylet', 'Jane', 'ischool.edu:inst', '456434513:292832124:292832126', 'Instructor', '2017-07-08 00:19:45', '2017-07-08 00:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `has_permission` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wb_mod_code`
--

CREATE TABLE `wb_mod_code` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wb_mod_code`
--

INSERT INTO `wb_mod_code` (`section_id`, `page_id`, `content`) VALUES
(679, 10168, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NzIxNTExNzk1OTQ3NSJ9'),
(780, 10347, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNDYyMjMxNDY1MDI3NCJ9'),
(683, 10563, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODgyNTkxNDg1MTE3MCJ9'),
(812, 10390, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjYzODk2NjM1MDQwMiJ9'),
(684, 10558, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NzIxNTExNzk1OTQ3NSJ9'),
(685, 10560, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODc2OTU3NjE1MTE2MCJ9'),
(686, 10569, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODk3MzM3MTM1MTE5NiJ9'),
(687, 10572, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTA0OTU4MzI1MTIyMCJ9'),
(808, 10387, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjU3MzQyNDUwMzk0In0='),
(688, 10568, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODkwOTMzNTc1MTE4NiJ9'),
(689, 10573, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTEwNTE2NDU1MTIzNCJ9'),
(690, 10575, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTE3NTMyNDQ1MTI1MCJ9'),
(691, 10576, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTIzNjczNjg1MTI2MiJ9'),
(692, 10577, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTMwNjE4ODA1MTI3MCJ9'),
(693, 10578, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NzUzMDEzMDE1OTQ5NyJ9'),
(694, 10580, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTQ0MDk4NzE1MTI5MCJ9'),
(695, 10583, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTU3ODYwNTQ1MTMwNiJ9'),
(696, 10584, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NzcyMDU0MTY1OTUxNSJ9'),
(697, 10587, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTc4NjExNzA1MTMzMCJ9'),
(698, 10595, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTkwOTc3Mzg1MTM0MCJ9'),
(699, 10597, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTk5NTgzMTUxMzUyIn0='),
(700, 10600, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDA5NjU3NDUxMzY2In0='),
(702, 10603, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDI1OTkzMzg1MTM5MCJ9'),
(703, 10604, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDM1OTU2MTQ1MTQwMiJ9'),
(704, 10607, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDQyNjQ4MjQ1MTQxNCJ9'),
(705, 10609, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDU0Mjk2ODk1MTQzMCJ9'),
(706, 10614, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDYzMjg1MTQ1MiJ9'),
(707, 10615, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1ODIxMzQ5NjE1OTUzMyJ9'),
(708, 10616, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDc1NTI2MDc1MTQ4NCJ9'),
(709, 10617, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDgxMzIwODY1MTQ5NCJ9'),
(710, 10619, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDg3NTI4NjM1MTUwMiJ9'),
(819, 10620, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDkyNTYwNTI1MTUxMiJ9'),
(820, 10459, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDU5ODgxMDk1MDc1MiJ9'),
(821, 10582, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTUxNDgzMjY1MTI5OCJ9'),
(822, 10586, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxOTcyNDg4NzY1MTMyMiJ9'),
(712, 10622, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMDk5MTM2Nzk1MTUyMCJ9'),
(713, 10624, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMTA0MzcxMzU1MTUyOCJ9'),
(714, 10625, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQyMTA5MzI4Nzc1MTUzNiJ9'),
(715, 10384, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjQyMDQ1Mzc1MDM4NiJ9'),
(811, 10395, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjcxNTkxMDUwNDEwIn0='),
(718, 10400, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjg3NDMxMTY1MDQxOCJ9'),
(719, 10412, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjk3MTgzOTc1MDQyNiJ9'),
(720, 10362, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNTY0Mzk5OTI1MDMzOCJ9'),
(824, 10627, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1ODU2ODQ0MzY1OTU1NSJ9'),
(825, 10590, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQ4NTY3MTk3NzE1MjAxNiJ9'),
(826, 10534, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NTQzMDE2MzA1OTM4NyJ9'),
(721, 10414, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNzEyMTIwNjQ1MDQ0MiJ9'),
(722, 10360, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNTU0NDE5NzE1MDMzMCJ9'),
(723, 10359, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNTQ2MTcyNDY1MDMyMiJ9'),
(724, 10413, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNzA1ODY3MzUwNDM0In0='),
(725, 10514, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjc2NjY2MTI1MTAwOCJ9'),
(726, 10512, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjY4NTk1OTI1MDk5NiJ9'),
(727, 10511, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjYxMzg0OTM1MDk4OCJ9'),
(728, 10416, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MjE0MDEzNTE1OTIyOSJ9'),
(729, 10509, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjU0NzQxMTI1MDk4MCJ9'),
(730, 10507, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjQ2NjExMzE1MDk3MCJ9'),
(731, 10506, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjQwMTQ0OTY1MDk2MiJ9'),
(732, 10501, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjMyODUzMTM1MDk1NCJ9'),
(733, 10417, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNzMxODU5Mjk1MDQ3NiJ9'),
(738, 10499, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjIxNDkwNDI1MDk0NiJ9'),
(735, 10497, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjE1MjU2OTU1MDkzOCJ9'),
(736, 10415, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MjUxMjQ3MzM1OTI1MSJ9'),
(737, 10418, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MjY5NTg1MjI1OTI2NyJ9'),
(739, 10419, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNzQyOTk3MzUwNDkyIn0='),
(740, 10420, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNzU3MTQ5NTA1MDAifQ=='),
(814, 10421, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MjkyMzQ0NTkyOTEifQ=='),
(815, 10477, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTQ5MzM0MjE1MDg0NiJ9'),
(816, 10473, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTI3OTg3OTY1MDgyMiJ9'),
(817, 10476, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTQyMjIxOTI1MDgzOCJ9'),
(741, 10422, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNzczMzQ5OTk1MDUxNiJ9'),
(742, 10521, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNzEyNDQyNTEwMTYifQ=='),
(743, 10524, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNzE5OTMwNjc1MTAyNCJ9'),
(744, 10526, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNzMzNjc3MjI1MTAzNCJ9'),
(745, 10528, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NDg3NDU4NDI1OTM2NSJ9'),
(746, 10530, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNzQ4Mzc0MDI1MTA1MCJ9'),
(747, 10496, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjEwMDk2Nzg1MDkzMCJ9'),
(748, 10494, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNjA0MzQwODA1MDkyMiJ9'),
(749, 10531, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNzU0NDM3Njg1MTA1OCJ9'),
(750, 10492, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTk4NjEzNjU1MDkxMCJ9'),
(751, 10539, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NjAxNzYzNDA1OTQxNSJ9'),
(752, 10490, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTkzMzE1ODc1MDkwMiJ9'),
(753, 10487, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTg2MjYwNTA1MDg5NCJ9'),
(754, 10540, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODE1OTU1NTg1MTA4NCJ9'),
(755, 10482, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTc4OTE4ODE1MDg4NiJ9'),
(756, 10480, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTcxMzk5NjUwODcwIn0='),
(757, 10542, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODIzMDUzMTI1MTA5MiJ9'),
(758, 10543, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODI4NjYxMzQ1MTEwMiJ9'),
(759, 10545, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODM1MDYxMTUxMTEwIn0='),
(760, 10546, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODQwNjYwMjM1MTExOCJ9'),
(761, 10479, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTYzOTkwNzM1MDg2MiJ9'),
(763, 10478, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTU3OTUwNjc1MDg1NCJ9'),
(764, 10475, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTM0NzY2NDc1MDgzMCJ9'),
(765, 10548, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODQ2NTkwOTk1MTEyNiJ9'),
(766, 10472, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNTIwMTQxMzUwODE0In0='),
(767, 10470, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDk5MDgwNTE1MDc5NiJ9'),
(768, 10549, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1NjI1OTczNjU5NDMzIn0='),
(769, 10468, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDkyNzgzNjQ1MDc4OCJ9'),
(770, 10467, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDgyMzE5NTI1MDc3OCJ9'),
(771, 10551, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxODU5NTY4NjM1MTE0NCJ9'),
(772, 10466, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDc1ODU5NTE1MDc3MCJ9'),
(773, 10368, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNTkyNjQ0NjA1MDM0NiJ9'),
(775, 10354, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2OTEwMDg3MDY0NjQ1NzI3NSJ9'),
(776, 10349, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNDk4NTE5MzQ1MDI5MCJ9'),
(777, 10369, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MDYwNTc0MjM1OTE3MSJ9'),
(778, 10348, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNDg3Njc0NjY1MDI4MiJ9'),
(779, 10340, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNDE1NTM5NzI1MDI2MiJ9'),
(781, 10461, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDY4MTc0NDI1MDc2MiJ9'),
(782, 10458, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDUyNzM1NTQ1MDc0NCJ9'),
(783, 10457, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MzQ3MDg1MTQ1OTMzNyJ9'),
(784, 10456, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDQwNTQ2ODg1MDcyOCJ9'),
(785, 10455, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDMyODc3ODA1MDcyMCJ9'),
(786, 10452, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDIxNDQ0NzU1MDcxMiJ9'),
(787, 10371, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjA3NjY3MjM1MDM2MiJ9'),
(788, 10448, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDEzMDI4Nzk1MDY5NiJ9'),
(789, 10373, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjEzNzk1NDE1MDM3MCJ9'),
(790, 10375, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNjIwOTU3OTg1MDM3OCJ9'),
(791, 10444, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDA3NzI4OTM1MDY4NiJ9'),
(792, 10442, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxNDAyNDc1MzA1MDY3OCJ9'),
(793, 10428, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzQ3NTMxMjY1MDU5OCJ9'),
(794, 10440, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDA1MzE0MzQwOTU1OTMwOSJ9'),
(795, 10430, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzU2NTM5MzUwNjIwIn0='),
(796, 10439, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzg5NTE4MzE1MDY2MCJ9'),
(797, 10432, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzYyNzYwMzA1MDYyOCJ9'),
(798, 10437, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzgyODQ4Njk1MDY1MiJ9'),
(799, 10434, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzY5ODk1Mzk1MDYzNiJ9'),
(800, 10436, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQxMzc2Njg4NjY1MDY0NCJ9'),
(801, 10352, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODQwNTA3ODU4Mjk1MDI5OCJ9'),
(802, 10341, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ1OTIzNjA0MTE3MDIyNzgwIn0=');

-- --------------------------------------------------------

--
-- Table structure for table `wb_mod_codeFBN1502`
--

CREATE TABLE `wb_mod_codeFBN1502` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wb_mod_codeFBN1502`
--

INSERT INTO `wb_mod_codeFBN1502` (`section_id`, `page_id`, `content`) VALUES
(700, 362, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDI2MzE3ODI1MzQxNiJ9'),
(672, 361, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDIwMDYzODM1MzQwOCJ9'),
(703, 359, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDEzODg2NDI1MzM5NCJ9'),
(707, 369, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDYxMDQ2Njk1MzUyNiJ9'),
(679, 438, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjA2NDEzNDU1Mzc0MCJ9'),
(681, 439, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjExMTkyOTY1Mzc1MCJ9'),
(682, 440, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjE1NjE1NDI1Mzc1OCJ9'),
(683, 441, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjE5NzU5Mzk1Mzc2NiJ9'),
(684, 442, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjI0ODI1NzI1Mzc3NCJ9'),
(685, 376, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMTAyMzk0ODg1MzU5OCJ9'),
(686, 402, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1NTUwODc0MTk2MTgzMSJ9'),
(793, 462, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU5MDIxNjU0MTU1NTAxNyJ9'),
(688, 399, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MDcyMTM4MTc2MTYzNSJ9'),
(692, 395, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MDY4NzcyMTE2MTYyMyJ9'),
(693, 393, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0ODczNzQ4MDk2MTU3MSJ9'),
(694, 367, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDUxNDkxMjI1MzUwMCJ9'),
(695, 366, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDQ1OTQ2NDU1MzQ4MCJ9'),
(696, 365, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDQwNTgyNDM1MzQ2MCJ9'),
(698, 364, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDM1ODk5NjE1MzQ1MCJ9'),
(699, 363, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDMxMzc3NzU1MzQzMCJ9'),
(739, 459, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU5MDA4OTY1NDI1NDk4MyJ9'),
(704, 373, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDg3MzYzNjM1MzU3OCJ9'),
(705, 372, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDc0MDU4NDc1MzU1NCJ9'),
(706, 371, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMDY4MDI1Mzc1MzU0MCJ9'),
(708, 607, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDQ2NDk3Nzk1NDQ3NiJ9'),
(710, 605, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDQwMjk0NTk1NDQ2NCJ9'),
(711, 344, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjI5Nzg1Njg1NDc5OCJ9'),
(712, 604, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDM0Njg5MDU1NDQ1NiJ9'),
(713, 600, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDI4MDkzMTU0NDQ4In0='),
(714, 348, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjM5OTMwODU1NDgxMiJ9'),
(715, 353, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjUwOTQzOTE1NDgyMiJ9'),
(716, 595, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDE5MDQ0MTk1NDQ0MCJ9'),
(717, 355, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjYwNjUyMDM1NDgzMiJ9'),
(718, 593, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDExOTUwNDc1NDQyNiJ9'),
(719, 591, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2NDA1NjEzMTA1NDQxMiJ9'),
(720, 357, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MTU4NTk1ODQ2MTY4NyJ9'),
(721, 590, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2Mzk5NTQ0Njc1NDQwNCJ9'),
(722, 377, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0NDI0NDMwNDE2MTQ3NyJ9'),
(723, 588, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2MzkzMjg5OTM1NDM5NiJ9'),
(724, 378, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMTE0MjM0MTc1MzYxNCJ9'),
(725, 587, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2Mzg0OTE2NjU1NDM4MiJ9'),
(726, 379, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0NTU1MTMzODYxNDk1In0='),
(727, 585, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU2Mzc4ODMzNTE1NDM3MiJ9'),
(728, 578, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDk2NzY2Njg1NDE2MiJ9'),
(730, 576, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDkxNTIyNzk1NDE0MiJ9;'),
(732, 380, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0NTYzMzQyMjYxNTAzIn0='),
(733, 572, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDc2NjgzMTg1NDEyMiJ9'),
(734, 381, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0NTY3MjMyOTg2MTUxMSJ9'),
(735, 382, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMTM2OTE5MzE1MzY1NCJ9'),
(736, 383, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0NTcyMTY2NjE2MTUxOSJ9'),
(737, 384, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMTQ2NjU2NTI1MzY3MCJ9'),
(785, 515, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NTk1NDg3NTg1NDc0OCJ9'),
(738, 456, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU5MDAzNzg4MzI1NDk3NSJ9'),
(740, 464, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MjI5ODM1Njg2MTcyNyJ9'),
(741, 469, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDkzNzY5NDQxNjYxMjk1In0='),
(742, 471, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDkzOTYwNTk3MjE2MTMyOSJ9'),
(743, 476, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MDE1NzUwMzA2MTM0MSJ9'),
(744, 477, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MDM4ODIwMTI2MTM1MyJ9'),
(745, 479, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MDY1NzQ4NjI2MTM2NSJ9'),
(746, 480, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MDg3NDE2OTU2MTM4MSJ9'),
(747, 484, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MTE2MjM1Njg2MTM5MyJ9'),
(748, 486, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MTgyNDczOTM2MTQyMSJ9'),
(749, 488, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MjEzNjMwOTc2MTQzMyJ9'),
(750, 489, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MjQxMTU0MzY2MTQ0NSJ9'),
(751, 491, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk0MjQ3MzQxNzg2MTQ1OSJ9'),
(752, 497, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MjU3MDM3NDQ2MTczOSJ9'),
(753, 499, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NTU0NDk5MDI1NDcwMCJ9'),
(754, 501, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NTYxOTM1MDc1NDcwOCJ9'),
(755, 503, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NTY3OTExNjg1NDcxNiJ9'),
(756, 504, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NTczNzYzMDU1NDcyNCJ9'),
(757, 506, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1Mjg3MDQyMzA2MTc1MyJ9'),
(758, 507, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NTg3NzkwNjg1NDc0MCJ9'),
(759, 516, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjAxMzI4ODc1NDc1NiJ9'),
(760, 518, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjA3NTc0NjY1NDc2NiJ9'),
(761, 519, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjEzMzUzNDE1NDc3NCJ9'),
(762, 521, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU3NjE5NDc0NjU0NzgyIn0='),
(763, 526, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjUzNzkzNzg1MzgxMCJ9'),
(764, 527, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjU5MTUyMzA1MzgxOCJ9'),
(786, 548, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDI1NTkzMjQ1Mzk5OCJ9'),
(765, 529, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjYzODQ5MTE1MzgyNiJ9'),
(766, 531, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjY3OTI1MDI1MzgzNCJ9'),
(767, 533, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjcyNTgxMDQ1Mzg1MSJ9'),
(768, 539, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjc4NjI0Mzg1Mzg2NiJ9'),
(769, 541, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjgzOTY4NzA1Mzg3OCJ9'),
(770, 543, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwMjg5MTM2NzE1Mzg4OCJ9'),
(771, 544, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDEzMjkwMDU1Mzk2NiJ9'),
(772, 546, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDE5ODkzOTI1Mzk4MiJ9'),
(773, 554, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDMxMzI5NjY1NDAwNiJ9'),
(774, 556, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDM2ODgzODY1NDAyMCJ9'),
(775, 558, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDQyMjE4OTE1NDA0MiJ9'),
(776, 561, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDQ4OTMzNDA1NDA2MCJ9'),
(777, 565, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDU2MzE0Njc1NDA3MCJ9'),
(778, 567, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDYyNjQ1NjM1NDA5NCJ9'),
(779, 569, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1Mzg2ODI4NTI2MTc5OSJ9'),
(788, 574, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODUwNDgzNTkwNjU0MTMyIn0='),
(789, 510, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MzUzNDIzNjY2MTc4MyJ9'),
(790, 454, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ3MDk1MjA4MDcxNTY2MTcxMyJ9'),
(791, 455, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU4OTg0MjkxMzA1NDk2NyJ9'),
(792, 461, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ2ODU5MDE1NTE4Nzg1NDk5NyJ9'),
(781, 156, 'tao/ltiDeliveryProvider/DeliveryTool/launch/eyJkZWxpdmVyeSI6Imh0dHA6XC9cL3VuaXNhdGVzdDIuY2xvdWRhcHAubmV0XC90YW9cL3VuaXNhLnJkZiNpMTQ1OTIzNjA0MTE3MDIyNzgwIn0=');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blob_file`
--
ALTER TABLE `blob_file`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `blob_indx_1` (`file_sha256`) USING HASH,
  ADD KEY `blob_ibfk_1` (`context_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_ibfk_1` (`creator_id`);

--
-- Indexes for table `course_users`
--
ALTER TABLE `course_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_users_ibfk_1` (`user_id`),
  ADD KEY `course_users_ibfk_2` (`course_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `key_request`
--
ALTER TABLE `key_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `key_request_fk_1` (`user_id`);

--
-- Indexes for table `lms_plugins`
--
ALTER TABLE `lms_plugins`
  ADD PRIMARY KEY (`plugin_id`),
  ADD UNIQUE KEY `plugin_path` (`plugin_path`);

--
-- Indexes for table `lti_ck_domains`
--
ALTER TABLE `lti_ck_domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lti_context`
--
ALTER TABLE `lti_context`
  ADD PRIMARY KEY (`context_id`),
  ADD UNIQUE KEY `key_id` (`key_id`,`context_sha256`),
  ADD KEY `lti_context_ibfk_1` (`context_key`);

--
-- Indexes for table `lti_domain`
--
ALTER TABLE `lti_domain`
  ADD UNIQUE KEY `key_id` (`key_id`,`context_id`) USING BTREE,
  ADD KEY `lti_domain_ibfk_2` (`context_id`);

--
-- Indexes for table `lti_graphs`
--
ALTER TABLE `lti_graphs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lti_key`
--
ALTER TABLE `lti_key`
  ADD PRIMARY KEY (`key_id`);

--
-- Indexes for table `lti_link`
--
ALTER TABLE `lti_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `link_sha256` (`link_sha256`,`context_id`),
  ADD KEY `lti_link_ibfk_1` (`context_id`);

--
-- Indexes for table `lti_membership`
--
ALTER TABLE `lti_membership`
  ADD PRIMARY KEY (`membership_id`),
  ADD UNIQUE KEY `context_id` (`context_id`,`user_id`),
  ADD KEY `lti_membership_ibfk_2` (`user_id`);

--
-- Indexes for table `lti_nonce`
--
ALTER TABLE `lti_nonce`
  ADD UNIQUE KEY `key_id` (`key_id`,`nonce`),
  ADD KEY `nonce_indx_1` (`nonce`) USING HASH;

--
-- Indexes for table `lti_result`
--
ALTER TABLE `lti_result`
  ADD PRIMARY KEY (`result_id`),
  ADD UNIQUE KEY `link_id` (`link_id`,`user_id`),
  ADD KEY `lti_result_ibfk_2` (`user_id`),
  ADD KEY `lti_result_ibfk_3` (`service_id`);

--
-- Indexes for table `lti_service`
--
ALTER TABLE `lti_service`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `key_id` (`key_id`,`service_sha256`);

--
-- Indexes for table `lti_user`
--
ALTER TABLE `lti_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `key_id` (`key_id`,`user_sha256`),
  ADD KEY `lti_user_ibfk_2` (`user_key`);

--
-- Indexes for table `mail_bulk`
--
ALTER TABLE `mail_bulk`
  ADD PRIMARY KEY (`bulk_id`),
  ADD KEY `mail_bulk_ibfk_1` (`context_id`),
  ADD KEY `mail_bulk_ibfk_2` (`user_id`);

--
-- Indexes for table `mail_sent`
--
ALTER TABLE `mail_sent`
  ADD PRIMARY KEY (`sent_id`),
  ADD KEY `mail_sent_ibfk_1` (`context_id`),
  ADD KEY `mail_sent_ibfk_2` (`link_id`),
  ADD KEY `mail_sent_ibfk_3` (`user_to`),
  ADD KEY `mail_sent_ibfk_4` (`user_from`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_group_items`
--
ALTER TABLE `permission_group_items`
  ADD PRIMARY KEY (`permission_group_id`),
  ADD KEY `permission_group_items_group_id_foreign` (`group_id`),
  ADD KEY `permission_group_items_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `profile_sha256` (`profile_sha256`),
  ADD UNIQUE KEY `profile_id` (`profile_id`,`profile_sha256`);

--
-- Indexes for table `psw_services_available`
--
ALTER TABLE `psw_services_available`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `psw_services_linked`
--
ALTER TABLE `psw_services_linked`
  ADD PRIMARY KEY (`service_link_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `roles_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stories_storyline_id_fbk` (`storyline_id`);

--
-- Indexes for table `storylines`
--
ALTER TABLE `storylines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storylines_ibfk_1` (`course_id`),
  ADD KEY `storylines_ibfk_2` (`creator_id`);

--
-- Indexes for table `storyline_items`
--
ALTER TABLE `storyline_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storyline_items_ibfk_1` (`storyline_id`),
  ADD KEY `storyline_id` (`storyline_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_lti_links`
--
ALTER TABLE `users_lti_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_lti_links_ibfk_1` (`user_id`),
  ADD KEY `users_lti_links_ibfk_2` (`lti_user_id`),
  ADD KEY `users_lti_links_ibfk_3` (`context_id`(13));

--
-- Indexes for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`group_id`),
  ADD KEY `users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `users_permissions_group_id_foreign` (`group_id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`group_id`),
  ADD KEY `users_roles_role_id_foreign` (`role_id`),
  ADD KEY `users_roles_group_id_foreign` (`group_id`);

--
-- Indexes for table `wb_mod_code`
--
ALTER TABLE `wb_mod_code`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `wb_mod_codeFBN1502`
--
ALTER TABLE `wb_mod_codeFBN1502`
  ADD PRIMARY KEY (`section_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blob_file`
--
ALTER TABLE `blob_file`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `course_users`
--
ALTER TABLE `course_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `key_request`
--
ALTER TABLE `key_request`
  MODIFY `request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lms_plugins`
--
ALTER TABLE `lms_plugins`
  MODIFY `plugin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `lti_ck_domains`
--
ALTER TABLE `lti_ck_domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lti_context`
--
ALTER TABLE `lti_context`
  MODIFY `context_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `lti_graphs`
--
ALTER TABLE `lti_graphs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `lti_key`
--
ALTER TABLE `lti_key`
  MODIFY `key_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `lti_link`
--
ALTER TABLE `lti_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `lti_membership`
--
ALTER TABLE `lti_membership`
  MODIFY `membership_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `lti_result`
--
ALTER TABLE `lti_result`
  MODIFY `result_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `lti_service`
--
ALTER TABLE `lti_service`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `lti_user`
--
ALTER TABLE `lti_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `mail_bulk`
--
ALTER TABLE `mail_bulk`
  MODIFY `bulk_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mail_sent`
--
ALTER TABLE `mail_sent`
  MODIFY `sent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permission_group_items`
--
ALTER TABLE `permission_group_items`
  MODIFY `permission_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `psw_services_available`
--
ALTER TABLE `psw_services_available`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `psw_services_linked`
--
ALTER TABLE `psw_services_linked`
  MODIFY `service_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `storylines`
--
ALTER TABLE `storylines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `storyline_items`
--
ALTER TABLE `storyline_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20386;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1400019;
--
-- AUTO_INCREMENT for table `users_lti_links`
--
ALTER TABLE `users_lti_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `blob_file`
--
ALTER TABLE `blob_file`
  ADD CONSTRAINT `blob_ibfk_1` FOREIGN KEY (`context_id`) REFERENCES `lti_context` (`context_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_users`
--
ALTER TABLE `course_users`
  ADD CONSTRAINT `course_users_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `key_request`
--
ALTER TABLE `key_request`
  ADD CONSTRAINT `key_request_fk_1` FOREIGN KEY (`user_id`) REFERENCES `lti_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lti_context`
--
ALTER TABLE `lti_context`
  ADD CONSTRAINT `lti_context_ibfk_1` FOREIGN KEY (`key_id`) REFERENCES `lti_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lti_domain`
--
ALTER TABLE `lti_domain`
  ADD CONSTRAINT `lti_domain_ibfk_1` FOREIGN KEY (`key_id`) REFERENCES `lti_key` (`key_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lti_domain_ibfk_2` FOREIGN KEY (`context_id`) REFERENCES `lti_context` (`context_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lti_link`
--
ALTER TABLE `lti_link`
  ADD CONSTRAINT `lti_link_ibfk_1` FOREIGN KEY (`context_id`) REFERENCES `lti_context` (`context_id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`ltiuser`@`localhost` EVENT `lti_nonce_auto` ON SCHEDULE EVERY 1 HOUR STARTS '2017-01-18 10:35:40' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM lti_nonce WHERE created_at < (UNIX_TIMESTAMP() - 3600)$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
