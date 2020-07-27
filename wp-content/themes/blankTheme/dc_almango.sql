-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2020 a las 04:22:32
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dc_almango`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_actionscheduler_actions`
--

CREATE TABLE `al_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_actionscheduler_actions`
--

INSERT INTO `al_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(113, 'action_scheduler/migration_hook', 'complete', '2020-06-23 19:31:04', '2020-06-23 21:31:04', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1592940664;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1592940664;}', 1, 1, '2020-06-23 19:31:06', '2020-06-23 21:31:06', 0, NULL),
(114, 'action_scheduler/migration_hook', 'complete', '2020-06-23 19:32:06', '2020-06-23 21:32:06', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1592940726;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1592940726;}', 1, 1, '2020-06-23 19:32:27', '2020-06-23 21:32:27', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_actionscheduler_claims`
--

CREATE TABLE `al_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_actionscheduler_groups`
--

CREATE TABLE `al_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_actionscheduler_groups`
--

INSERT INTO `al_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_actionscheduler_logs`
--

CREATE TABLE `al_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_actionscheduler_logs`
--

INSERT INTO `al_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 113, 'action created', '2020-06-23 19:30:04', '2020-06-23 21:30:04'),
(2, 113, 'action started via WP Cron', '2020-06-23 19:31:06', '2020-06-23 21:31:06'),
(3, 113, 'action complete via WP Cron', '2020-06-23 19:31:06', '2020-06-23 21:31:06'),
(4, 114, 'action created', '2020-06-23 19:31:06', '2020-06-23 21:31:06'),
(5, 114, 'action started via WP Cron', '2020-06-23 19:32:27', '2020-06-23 21:32:27'),
(6, 114, 'action complete via WP Cron', '2020-06-23 19:32:27', '2020-06-23 21:32:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_cf7dbplugin_st`
--

CREATE TABLE `al_cf7dbplugin_st` (
  `submit_time` decimal(16,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_cf7dbplugin_submits`
--

CREATE TABLE `al_cf7dbplugin_submits` (
  `submit_time` decimal(16,4) NOT NULL,
  `form_name` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `field_name` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `field_value` longtext CHARACTER SET utf8 DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `file` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_commentmeta`
--

CREATE TABLE `al_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_comments`
--

CREATE TABLE `al_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_comments`
--

INSERT INTO `al_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-06-22 18:55:46', '2020-06-22 16:55:46', 'Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visita la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0),
(2, 313, 'WooCommerce', 'woocommerce@dev.almango.com', '', '', '2020-07-02 07:04:16', '2020-07-02 05:04:16', 'Unpaid order cancelled - time limit reached. Order status changed from Pending payment to Cancelled.', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(3, 314, 'WooCommerce', 'woocommerce@dev.almango.com', '', '', '2020-07-02 19:40:28', '2020-07-02 17:40:28', 'Unpaid order cancelled - time limit reached. Order status changed from Pending payment to Cancelled.', 0, '1', 'WooCommerce', 'order_note', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_finaltiles_gallery`
--

CREATE TABLE `al_finaltiles_gallery` (
  `Id` int(11) NOT NULL,
  `configuration` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `al_finaltiles_gallery`
--

INSERT INTO `al_finaltiles_gallery` (`Id`, `configuration`) VALUES
(1, '{\"ajaxLoading\":\"F\",\"layout\":\"columns\",\"name\":\"gsx-r1000-a\",\"slug\":\"gsx-r1000-a\",\"description\":\"Fotos de la gsx-r1000-a\",\"lightbox\":\"lightbox2\",\"lightboxOptions\":\"\",\"lightboxOptionsMobile\":\"\",\"mobileLightbox\":\"lightbox2\",\"lightboxImageSize\":\"large\",\"blank\":\"F\",\"margin\":10,\"allFilterLabel\":\"\",\"minTileWidth\":250,\"gridCellSize\":25,\"gridCellSizeDisabledBelow\":800,\"enableTwitter\":\"F\",\"backgroundColor\":null,\"filterClick\":\"F\",\"disableLightboxGroups\":\"F\",\"defaultFilter\":\"\",\"enableFacebook\":\"F\",\"enableGplus\":\"F\",\"enablePinterest\":\"F\",\"imagesOrder\":\"user\",\"compressHTML\":\"T\",\"loadMethod\":\"sequential\",\"socialIconColor\":\"#ffffff\",\"socialIconPosition\":\"bottom\",\"socialIconStyle\":\"none\",\"recentPostsCaption\":\"title\",\"recentPostsCaptionAutoExcerptLength\":20,\"captionBehavior\":\"none\",\"captionEffect\":\"\",\"captionEmpty\":\"hide\",\"captionBackgroundColor\":\"#000000\",\"captionColor\":\"#ffffff\",\"captionCustomFields\":\"\",\"captionFrameColor\":\"#ffffff\",\"captionEffectDuration\":250,\"captionEasing\":\"\",\"captionVerticalAlignment\":\"middle\",\"captionHorizontalAlignment\":\"center\",\"captionMobileBehavior\":\"desktop\",\"captionOpacity\":80,\"captionIcon\":\"\",\"captionFrame\":\"F\",\"customCaptionIcon\":\"\",\"captionIconColor\":\"#ffffff\",\"captionIconSize\":12,\"captionFontSize\":12,\"captionPosition\":\"inside\",\"titleFontSize\":14,\"hoverZoom\":0,\"hoverRotation\":0,\"hoverDuration\":0,\"hoverIconRotation\":\"F\",\"filters\":\"\",\"wp_field_caption\":\"caption\",\"wp_field_title\":\"title\",\"borderSize\":0,\"borderColor\":null,\"loadingBarColor\":\"#666\",\"loadingBarBackgroundColor\":\"#fff\",\"enlargeImages\":\"T\",\"borderRadius\":0,\"imageSizeFactor\":30,\"imageSizeFactorTabletLandscape\":30,\"imageSizeFactorTabletPortrait\":20,\"imageSizeFactorPhoneLandscape\":30,\"imageSizeFactorPhonePortrait\":20,\"imageSizeFactorCustom\":\"\",\"taxonomyAsFilter\":\"\",\"columns\":4,\"columnsTabletLandscape\":4,\"columnsTabletPortrait\":3,\"columnsPhoneLandscape\":3,\"columnsPhonePortrait\":2,\"max_posts\":0,\"shadowSize\":0,\"shadowColor\":\"#cccccc\",\"source\":\"images\",\"post_types\":\"\",\"post_taxonomies\":\"\",\"taxonomyOperator\":\"OR\",\"post_tags\":\"\",\"tilesPerPage\":20,\"woo_categories\":\"\",\"defaultPostImageSize\":\"\",\"defaultWooImageSize\":\"\",\"width\":\"100%\",\"beforeGalleryText\":\"\",\"afterGalleryText\":\"\",\"aClass\":\"\",\"rel\":\"\",\"style\":\"\",\"delay\":0,\"script\":\"\",\"support\":\"F\",\"supportText\":\"Powered by Final Tiles Grid Gallery\",\"scrollEffect\":null,\"loadedScaleY\":100,\"loadedScaleX\":100,\"loadedHSlide\":0,\"loadedVSlide\":0,\"loadedEasing\":\"ease-out\",\"loadedDuration\":500,\"loadedRotateY\":0,\"loadedRotateX\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_finaltiles_gallery_images`
--

CREATE TABLE `al_finaltiles_gallery_images` (
  `Id` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'image',
  `imageId` int(11) NOT NULL,
  `imagePath` longtext NOT NULL,
  `filters` varchar(1500) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `alt` longtext DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `blank` enum('T','F') NOT NULL DEFAULT 'F',
  `description` longtext NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `group` text DEFAULT NULL,
  `hidden` enum('T','F') NOT NULL DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `al_finaltiles_gallery_images`
--

INSERT INTO `al_finaltiles_gallery_images` (`Id`, `gid`, `type`, `imageId`, `imagePath`, `filters`, `link`, `title`, `alt`, `target`, `blank`, `description`, `sortOrder`, `group`, `hidden`) VALUES
(1, 1, 'image', 160, 'http://dev.almango.com/wp-content/uploads/2020/07/13.png', NULL, NULL, '13', '', '', 'F', '', 6, '', 'F'),
(2, 1, 'image', 161, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_0160.png', NULL, NULL, 'IMG_0160', '', '', 'F', '', 7, '', 'F'),
(3, 1, 'image', 162, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_9791-687x1024.png', NULL, NULL, 'IMG_9791', '', '', 'F', '', 8, '', 'F'),
(4, 1, 'image', 163, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_9873-683x1024.png', NULL, NULL, 'IMG_9873', '', '', 'F', '', 5, '', 'F'),
(5, 1, 'image', 164, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_9879.png', NULL, NULL, 'IMG_9879', '', '', 'F', '', 9, '', 'F'),
(8, 1, 'image', 167, 'http://dev.almango.com/wp-content/uploads/2020/07/10-683x1024.png', NULL, NULL, '10', '', '', 'F', '', 2, '', 'F'),
(9, 1, 'image', 166, 'http://dev.almango.com/wp-content/uploads/2020/07/02.png', NULL, NULL, '02', '', '', 'F', '', 3, '', 'F'),
(11, 1, 'image', 166, 'http://dev.almango.com/wp-content/uploads/2020/07/02.png', NULL, NULL, '02', '', '', 'F', '', 4, '', 'F'),
(12, 1, 'image', 166, 'http://dev.almango.com/wp-content/uploads/2020/07/02.png', NULL, NULL, '02', '', '', 'F', '', 1, '', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_links`
--

CREATE TABLE `al_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_mailchimp_carts`
--

CREATE TABLE `al_mailchimp_carts` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_mailchimp_jobs`
--

CREATE TABLE `al_mailchimp_jobs` (
  `id` bigint(20) NOT NULL,
  `obj_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_options`
--

CREATE TABLE `al_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_options`
--

INSERT INTO `al_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://dev.almango-master.com ', 'yes'),
(2, 'home', 'http://dev.almango-master.com ', 'yes'),
(3, 'blogname', 'AlMango', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'frankdelarosacampos@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd/m/Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:13:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";i:2;s:33:\"classic-editor/classic-editor.php\";i:3;s:58:\"contact-form-7-to-database-extension/contact-form-7-db.php\";i:4;s:36:\"contact-form-7/wp-contact-form-7.php\";i:5;s:32:\"duplicate-page/duplicatepage.php\";i:6;s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";i:7;s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";i:8;s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";i:9;s:35:\"pasarela-maximo/pasarela-maximo.php\";i:10;s:80:\"woocommerce-attribute-range-filter-master/woocommerce-attribute-range-filter.php\";i:11;s:27:\"woocommerce/woocommerce.php\";i:12;s:24:\"wordpress-seo/wp-seo.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'blankTheme', 'yes'),
(41, 'stylesheet', 'blankTheme', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:33:\"classic-editor/classic-editor.php\";a:2:{i:0;s:14:\"Classic_Editor\";i:1;s:9:\"uninstall\";}}', 'no'),
(82, 'timezone_string', 'Europe/Madrid', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '8', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'al_user_roles', 'a:9:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:115:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:37:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'es_ES', 'yes'),
(97, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:26:\"woocommerce_price_filter-2\";i:1;s:32:\"woocommerce_product_categories-2\";i:2;s:25:\"woocommerce_layered_nav-3\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'cron', 'a:17:{i:1595350785;a:1:{s:19:\"wpseo-reindex-links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595350794;a:1:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595351471;a:1:{s:42:\"fs_data_sync_final-tiles-grid-gallery-lite\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595353983;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1595354146;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1595357582;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1595361584;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595368800;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595372384;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1595388621;a:1:{s:40:\"fs_data_sync_ajax-search-for-woocommerce\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595393746;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1595436946;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595437170;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595437171;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1595437184;a:1:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1596715200;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'recovery_keys', 'a:0:{}', 'yes'),
(130, 'can_compress_scripts', '1', 'no'),
(145, 'recently_activated', 'a:0:{}', 'yes'),
(146, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.1.4\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";d:1592852383;s:7:\"version\";s:5:\"5.1.4\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(147, 'CF7DBPlugin_NoSaveFields', '/.*wpcf7.*/,_wpnonce', 'yes'),
(148, 'CF7DBPlugin__version', '2.10.26', 'yes'),
(149, 'CF7DBPlugin__installed', '1', 'yes'),
(150, 'CF7DBPlugin_IntegrateWithCF7', 'true', 'yes'),
(151, 'CF7DBPlugin_GenerateSubmitTimeInCF7Email', 'false', 'yes'),
(152, 'CF7DBPlugin_IntegrateWithFSCF', 'true', 'yes'),
(153, 'CF7DBPlugin_IntegrateWithJetPackContactForm', 'true', 'yes'),
(154, 'CF7DBPlugin_IntegrateWithGravityForms', 'true', 'yes'),
(155, 'CF7DBPlugin_IntegrateWithFormidableForms', 'true', 'yes'),
(156, 'CF7DBPlugin_IntegrateWithWrContactForms', 'true', 'yes'),
(157, 'CF7DBPlugin_IntegrateWithQuform', 'true', 'yes'),
(158, 'CF7DBPlugin_IntegrateWithNinjaForms', 'true', 'yes'),
(159, 'CF7DBPlugin_IntegrateWithCalderaForms', 'true', 'yes'),
(160, 'CF7DBPlugin_IntegrateWithEnfoldThemForms', 'true', 'yes'),
(161, 'CF7DBPlugin_IntegrateWithCFormsII', 'true', 'yes'),
(162, 'CF7DBPlugin_IntegrateWithFormCraft', 'true', 'yes'),
(163, 'CF7DBPlugin_IntegrateWithVerySimpleContactForm', 'true', 'yes'),
(164, 'CF7DBPlugin_IntegrateWithFMS', 'true', 'yes'),
(165, 'duplicate_page_options', 'a:4:{s:21:\"duplicate_post_status\";s:5:\"draft\";s:23:\"duplicate_post_redirect\";s:7:\"to_list\";s:21:\"duplicate_post_suffix\";s:0:\"\";s:21:\"duplicate_post_editor\";s:7:\"classic\";}', 'yes'),
(168, 'woocommerce_store_address', 'AV LAS LOMAS', 'yes'),
(169, 'woocommerce_store_address_2', '', 'yes'),
(170, 'woocommerce_store_city', 'LIMA', 'yes'),
(171, 'woocommerce_default_country', 'PE:LIM', 'yes'),
(172, 'woocommerce_store_postcode', 'LIMA01', 'yes'),
(173, 'woocommerce_allowed_countries', 'all', 'yes'),
(174, 'woocommerce_all_except_countries', 'a:0:{}', 'yes'),
(175, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes'),
(176, 'woocommerce_ship_to_countries', '', 'yes'),
(177, 'woocommerce_specific_ship_to_countries', 'a:0:{}', 'yes'),
(178, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(179, 'woocommerce_calc_taxes', 'no', 'yes'),
(180, 'woocommerce_enable_coupons', 'yes', 'yes'),
(181, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(182, 'woocommerce_currency', 'PEN', 'yes'),
(183, 'woocommerce_currency_pos', 'left', 'yes'),
(184, 'woocommerce_price_thousand_sep', ',', 'yes'),
(185, 'woocommerce_price_decimal_sep', '.', 'yes'),
(186, 'woocommerce_price_num_decimals', '0', 'yes'),
(187, 'woocommerce_shop_page_id', '108', 'yes'),
(188, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(189, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(190, 'woocommerce_placeholder_image', '6', 'yes'),
(191, 'woocommerce_weight_unit', 'kg', 'yes'),
(192, 'woocommerce_dimension_unit', 'cm', 'yes'),
(193, 'woocommerce_enable_reviews', 'yes', 'yes'),
(194, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(195, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(196, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(197, 'woocommerce_review_rating_required', 'yes', 'no'),
(198, 'woocommerce_manage_stock', 'yes', 'yes'),
(199, 'woocommerce_hold_stock_minutes', '60', 'no'),
(200, 'woocommerce_notify_low_stock', 'yes', 'no'),
(201, 'woocommerce_notify_no_stock', 'yes', 'no'),
(202, 'woocommerce_stock_email_recipient', 'frankdelarosacampos@gmail.com', 'no'),
(203, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(204, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(205, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(206, 'woocommerce_stock_format', '', 'yes'),
(207, 'woocommerce_file_download_method', 'force', 'no'),
(208, 'woocommerce_downloads_require_login', 'no', 'no'),
(209, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(210, 'woocommerce_prices_include_tax', 'no', 'yes'),
(211, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(212, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(213, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(214, 'woocommerce_tax_classes', '', 'yes'),
(215, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(216, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(217, 'woocommerce_price_display_suffix', '', 'yes'),
(218, 'woocommerce_tax_total_display', 'itemized', 'no'),
(219, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(220, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(221, 'woocommerce_ship_to_destination', 'billing', 'no'),
(222, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(223, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(224, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(225, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(226, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(227, 'woocommerce_registration_generate_username', 'yes', 'no'),
(228, 'woocommerce_registration_generate_password', 'yes', 'no'),
(229, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(230, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(231, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(232, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(233, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(234, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(235, 'woocommerce_trash_pending_orders', '', 'no'),
(236, 'woocommerce_trash_failed_orders', '', 'no'),
(237, 'woocommerce_trash_cancelled_orders', '', 'no'),
(238, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(239, 'woocommerce_email_from_name', 'AlMango', 'no'),
(240, 'woocommerce_email_from_address', 'frankdelarosacampos@gmail.com', 'no'),
(241, 'woocommerce_email_header_image', '', 'no'),
(242, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(243, 'woocommerce_email_base_color', '#96588a', 'no'),
(244, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(245, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(246, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(247, 'woocommerce_cart_page_id', '109', 'no'),
(248, 'woocommerce_checkout_page_id', '110', 'no'),
(249, 'woocommerce_myaccount_page_id', '111', 'no'),
(250, 'woocommerce_terms_page_id', '', 'no'),
(251, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(252, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(253, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(254, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(255, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(256, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(257, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(258, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(259, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(260, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(261, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(262, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(263, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(264, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(265, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(266, 'woocommerce_api_enabled', 'no', 'yes'),
(267, 'woocommerce_allow_tracking', 'yes', 'no'),
(268, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(269, 'woocommerce_single_image_width', '600', 'yes'),
(270, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(271, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(272, 'woocommerce_demo_store', 'no', 'no'),
(273, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:8:\"/product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(274, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(275, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(278, 'default_product_cat', '15', 'yes'),
(281, 'woocommerce_version', '3.7.1', 'yes'),
(282, 'woocommerce_db_version', '3.7.1', 'yes'),
(283, 'wpseo', 'a:20:{s:15:\"ms_defaults_set\";b:0;s:7:\"version\";s:4:\"11.8\";s:20:\"disableadvanced_meta\";b:1;s:19:\"onpage_indexability\";b:1;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1592845185;s:13:\"myyoast-oauth\";b:0;}', 'yes'),
(284, 'wpseo_titles', 'a:96:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:35:\"Page not found %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:23:\"is-media-purge-relevant\";b:0;s:20:\"breadcrumbs-404crumb\";s:25:\"Error 404: Page not found\";s:29:\"breadcrumbs-display-blog-page\";b:1;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:12:\"Archives for\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:16:\"You searched for\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:14:\"person_logo_id\";i:0;s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:15:\"company_logo_id\";i:0;s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";i:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";i:0;s:13:\"title-product\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:16:\"metadesc-product\";s:0:\"\";s:15:\"noindex-product\";b:0;s:16:\"showdate-product\";b:0;s:26:\"display-metabox-pt-product\";b:1;s:26:\"post_types-product-maintax\";i:0;s:23:\"title-ptarchive-product\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:26:\"metadesc-ptarchive-product\";s:0:\"\";s:25:\"bctitle-ptarchive-product\";s:0:\"\";s:25:\"noindex-ptarchive-product\";b:0;s:18:\"title-tax-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:18:\"title-tax-post_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:21:\"title-tax-post_format\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:21:\"title-tax-product_cat\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-product_cat\";s:0:\"\";s:31:\"display-metabox-tax-product_cat\";b:1;s:23:\"noindex-tax-product_cat\";b:0;s:29:\"taxonomy-product_cat-ptparent\";i:0;s:21:\"title-tax-product_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-product_tag\";s:0:\"\";s:31:\"display-metabox-tax-product_tag\";b:1;s:23:\"noindex-tax-product_tag\";b:0;s:29:\"taxonomy-product_tag-ptparent\";i:0;s:32:\"title-tax-product_shipping_class\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:35:\"metadesc-tax-product_shipping_class\";s:0:\"\";s:42:\"display-metabox-tax-product_shipping_class\";b:1;s:34:\"noindex-tax-product_shipping_class\";b:0;s:40:\"taxonomy-product_shipping_class-ptparent\";i:0;}', 'yes'),
(285, 'wpseo_social', 'a:19:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:13:\"wikipedia_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}', 'yes'),
(286, 'wpseo_flush_rewrite', '1', 'yes'),
(287, 'woocommerce_admin_notices', 'a:1:{i:1;s:20:\"no_secure_connection\";}', 'yes'),
(288, '_transient_timeout_wpseo_link_table_inaccessible', '1624381185', 'no'),
(289, '_transient_wpseo_link_table_inaccessible', '0', 'no'),
(290, '_transient_timeout_wpseo_meta_table_inaccessible', '1624381185', 'no'),
(291, '_transient_wpseo_meta_table_inaccessible', '0', 'no'),
(292, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(293, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(294, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(295, 'widget_woocommerce_layered_nav', 'a:2:{i:3;a:4:{s:5:\"title\";s:19:\"POSICIÓN DE MANEJO\";s:9:\"attribute\";s:8:\"posicion\";s:12:\"display_type\";s:4:\"list\";s:10:\"query_type\";s:2:\"or\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(296, 'widget_woocommerce_price_filter', 'a:2:{i:2;a:1:{s:5:\"title\";s:6:\"PRECIO\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(297, 'widget_woocommerce_product_categories', 'a:2:{i:2;a:8:{s:5:\"title\";s:0:\"\";s:7:\"orderby\";s:4:\"name\";s:8:\"dropdown\";i:0;s:5:\"count\";i:0;s:12:\"hierarchical\";i:1;s:18:\"show_children_only\";i:0;s:10:\"hide_empty\";i:0;s:9:\"max_depth\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(298, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(299, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(300, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(301, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(302, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(303, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(304, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(308, '_transient_as_comment_count', 'O:8:\"stdClass\":7:{s:8:\"approved\";s:1:\"1\";s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(309, 'CF7DBPlugin_HideAdminPanelFromNonAdmins', 'true', 'yes'),
(310, 'acf_version', '5.7.7', 'yes'),
(315, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(321, 'theme_mods_twentynineteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1592845203;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(322, 'current_theme', 'Diacritica', 'yes'),
(323, 'theme_mods_blankTheme', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(324, 'theme_switched', '', 'yes'),
(325, 'woocommerce_maybe_regenerate_images_hash', '991b1ca641921cf0f5baf7a2fe85861b', 'yes'),
(331, '_transient_shipping-transient-version', '1592845205', 'yes'),
(332, '_transient_timeout_wc_shipping_method_count_legacy', '1595437205', 'no'),
(333, '_transient_wc_shipping_method_count_legacy', 'a:2:{s:7:\"version\";s:10:\"1592845205\";s:5:\"value\";i:0;}', 'no'),
(340, 'new_admin_email', 'frankdelarosacampos@gmail.com', 'yes'),
(373, 'fs_active_plugins', 'O:8:\"stdClass\":3:{s:7:\"plugins\";a:1:{s:34:\"ajax-search-for-woocommerce/fs/lib\";O:8:\"stdClass\":4:{s:7:\"version\";s:5:\"2.3.2\";s:4:\"type\";s:6:\"plugin\";s:9:\"timestamp\";i:1595381731;s:11:\"plugin_path\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";}}s:7:\"abspath\";s:18:\"G:\\htdocs\\almango/\";s:6:\"newest\";O:8:\"stdClass\":5:{s:11:\"plugin_path\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";s:8:\"sdk_path\";s:34:\"ajax-search-for-woocommerce/fs/lib\";s:7:\"version\";s:5:\"2.3.2\";s:13:\"in_activation\";b:0;s:9:\"timestamp\";i:1595381731;}}', 'yes'),
(374, 'fs_debug_mode', '', 'yes');
INSERT INTO `al_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(375, 'fs_accounts', 'a:14:{s:21:\"id_slug_type_path_map\";a:2:{i:700;a:3:{s:4:\"slug\";s:27:\"ajax-search-for-woocommerce\";s:4:\"type\";s:6:\"plugin\";s:4:\"path\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";}i:1002;a:3:{s:4:\"slug\";s:29:\"final-tiles-grid-gallery-lite\";s:4:\"type\";s:6:\"plugin\";s:4:\"path\";s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";}}s:11:\"plugin_data\";a:2:{s:27:\"ajax-search-for-woocommerce\";a:23:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";}s:20:\"is_network_activated\";b:0;s:17:\"install_timestamp\";i:1592849040;s:17:\"was_plugin_loaded\";b:1;s:21:\"is_plugin_new_install\";b:0;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:5:\"2.3.2\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:5:\"1.7.1\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:15:\"dev.almango.com\";s:9:\"server_ip\";s:9:\"127.0.0.1\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1592849040;s:7:\"version\";s:5:\"1.7.1\";}s:15:\"prev_is_premium\";b:0;s:30:\"is_extensions_tracking_allowed\";b:1;s:14:\"has_trial_plan\";b:0;s:22:\"install_sync_timestamp\";i:1595304912;s:19:\"keepalive_timestamp\";i:1595304912;s:20:\"activation_timestamp\";i:1592849046;s:9:\"sync_cron\";O:8:\"stdClass\":5:{s:7:\"version\";s:5:\"1.7.1\";s:7:\"blog_id\";i:0;s:11:\"sdk_version\";s:5:\"2.3.2\";s:9:\"timestamp\";i:1592849051;s:2:\"on\";b:1;}s:14:\"sync_timestamp\";i:1595304911;s:15:\"is_whitelabeled\";b:0;}s:29:\"final-tiles-grid-gallery-lite\";a:24:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";}s:20:\"is_network_activated\";b:0;s:17:\"install_timestamp\";i:1593583742;s:17:\"was_plugin_loaded\";b:1;s:21:\"is_plugin_new_install\";b:0;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:5:\"2.3.2\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:6:\"3.4.20\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:15:\"dev.almango.com\";s:9:\"server_ip\";s:9:\"127.0.0.1\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1593583742;s:7:\"version\";s:6:\"3.4.20\";}s:15:\"prev_is_premium\";b:0;s:30:\"is_extensions_tracking_allowed\";b:1;s:14:\"has_trial_plan\";b:1;s:22:\"install_sync_timestamp\";i:1595353983;s:19:\"keepalive_timestamp\";i:1595353983;s:20:\"activation_timestamp\";i:1593583751;s:9:\"sync_cron\";O:8:\"stdClass\":5:{s:7:\"version\";s:6:\"3.4.20\";s:7:\"blog_id\";i:0;s:11:\"sdk_version\";s:5:\"2.3.2\";s:9:\"timestamp\";i:1593583755;s:2:\"on\";b:1;}s:14:\"sync_timestamp\";i:1595353983;s:15:\"is_whitelabeled\";b:0;s:21:\"trial_promotion_shown\";i:1594429489;}}s:13:\"file_slug_map\";a:2:{s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";s:27:\"ajax-search-for-woocommerce\";s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";s:29:\"final-tiles-grid-gallery-lite\";}s:7:\"plugins\";a:2:{s:27:\"ajax-search-for-woocommerce\";O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:27:\"AJAX Search for WooCommerce\";s:4:\"slug\";s:27:\"ajax-search-for-woocommerce\";s:12:\"premium_slug\";s:35:\"ajax-search-for-woocommerce-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";b:0;s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";s:7:\"version\";s:5:\"1.7.1\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:3:\"Pro\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_f4f2a51dbe0aee43de0692db77a3e\";s:10:\"secret_key\";N;s:2:\"id\";s:3:\"700\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:29:\"final-tiles-grid-gallery-lite\";O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:40:\"Final Tiles Grid Gallery - Image Gallery\";s:4:\"slug\";s:29:\"final-tiles-grid-gallery-lite\";s:12:\"premium_slug\";s:37:\"final-tiles-grid-gallery-lite-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";s:3:\"all\";s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";s:7:\"version\";s:6:\"3.4.20\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:9:\"(Premium)\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_d0e075b84d491d510a1d0a21087af\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"1002\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:9:\"unique_id\";s:32:\"2bed00332cee25de98c50dfabad94904\";s:5:\"plans\";a:2:{s:27:\"ajax-search-for-woocommerce\";a:3:{i:0;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"NzAw\";s:4:\"name\";s:8:\"ZnJlZQ==\";s:5:\"title\";s:12:\"U3RhcnRlcg==\";s:11:\"description\";s:40:\"U2VhcmNoIHByb2R1Y3RzIGluIGxpdmUgdGltZQ==\";s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:4:\"MQ==\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";N;s:23:\"is_require_subscription\";s:0:\"\";s:10:\"support_kb\";N;s:13:\"support_forum\";s:88:\"aHR0cHM6Ly93b3JkcHJlc3Mub3JnL3N1cHBvcnQvcGx1Z2luL2FqYXgtc2VhcmNoLWZvci13b29jb21tZXJjZQ==\";s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:0:\"\";s:2:\"id\";s:8:\"MjkwMg==\";s:7:\"updated\";s:28:\"MjAxOC0xMi0yOCAwMDowNDowNQ==\";s:7:\"created\";s:28:\"MjAxOC0wNC0wNyAyMTozNjo1Ng==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:1;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"NzAw\";s:4:\"name\";s:4:\"cHJv\";s:5:\"title\";s:4:\"UHJv\";s:11:\"description\";s:76:\"I0luY3JlYXNlIHlvdXIgc2FsZXMgYnkgZmFzdGVyIGFuZCBtb2Rlcm4gc2VhcmNoIGVuZ2luZQ==\";s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:0:\"\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";N;s:23:\"is_require_subscription\";s:4:\"MQ==\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:32:\"ZGdvcmFwbHVnaW5zQGdtYWlsLmNvbQ==\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:4:\"MQ==\";s:2:\"id\";s:8:\"NDc5OQ==\";s:7:\"updated\";s:28:\"MjAxOS0wOS0zMCAwOTo1NDoyMg==\";s:7:\"created\";s:28:\"MjAxOC0xMi0yNyAyMzoxODowNg==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:2;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"NzAw\";s:4:\"name\";s:16:\"Y3VzdG9td29yaw==\";s:5:\"title\";s:16:\"Q3VzdG9tIFdvcms=\";s:11:\"description\";N;s:17:\"is_free_localhost\";s:0:\"\";s:17:\"is_block_features\";s:4:\"MQ==\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";N;s:23:\"is_require_subscription\";s:0:\"\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:0:\"\";s:2:\"id\";s:8:\"NzM1Ng==\";s:7:\"updated\";s:28:\"MjAxOS0wOS0xMCAxNzoyMDo0Nw==\";s:7:\"created\";s:28:\"MjAxOS0wOS0xMCAxNzoxODozMQ==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:29:\"final-tiles-grid-gallery-lite\";a:4:{i:0;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:8:\"MTAwMg==\";s:4:\"name\";s:8:\"ZnJlZQ==\";s:5:\"title\";s:8:\"TGl0ZQ==\";s:11:\"description\";N;s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:4:\"MQ==\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";N;s:23:\"is_require_subscription\";s:0:\"\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:0:\"\";s:2:\"id\";s:8:\"MjA2NA==\";s:7:\"updated\";s:28:\"MjAxNy0xMC0wOSAwNzoyMDowMw==\";s:7:\"created\";s:28:\"MjAxNy0xMC0wNCAwNTo1Mzo0NQ==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:1;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:8:\"MTAwMg==\";s:4:\"name\";s:8:\"YmFzaWM=\";s:5:\"title\";s:8:\"QmFzaWM=\";s:11:\"description\";N;s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:0:\"\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";s:4:\"MTQ=\";s:23:\"is_require_subscription\";s:4:\"MQ==\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:36:\"c3VwcG9ydEBncmVlbnRyZWVsYWJzLm5ldA==\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:0:\"\";s:2:\"id\";s:8:\"MTgzNg==\";s:7:\"updated\";s:28:\"MjAxOS0xMS0xMyAxMzo1NjozMw==\";s:7:\"created\";s:28:\"MjAxNy0wOC0xOSAwNzoyMjowNQ==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:2;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:8:\"MTAwMg==\";s:4:\"name\";s:12:\"dWx0aW1hdGU=\";s:5:\"title\";s:12:\"VWx0aW1hdGU=\";s:11:\"description\";N;s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:0:\"\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";s:4:\"MTQ=\";s:23:\"is_require_subscription\";s:4:\"MQ==\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:28:\"aGVsbG9Ad3AtbW9kdWxhLmNvbQ==\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:0:\"\";s:11:\"is_featured\";s:4:\"MQ==\";s:2:\"id\";s:8:\"MTg0NQ==\";s:7:\"updated\";s:28:\"MjAxOS0xMS0xMyAxMzo0OToxOQ==\";s:7:\"created\";s:28:\"MjAxNy0wOC0yMCAxMzo1ODoyNw==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:3;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:8:\"MTAwMg==\";s:4:\"name\";s:12:\"YnVzaW5lc3M=\";s:5:\"title\";s:12:\"QnVzaW5lc3M=\";s:11:\"description\";N;s:17:\"is_free_localhost\";s:4:\"MQ==\";s:17:\"is_block_features\";s:0:\"\";s:12:\"license_type\";s:4:\"MA==\";s:16:\"is_https_support\";s:0:\"\";s:12:\"trial_period\";s:4:\"MTQ=\";s:23:\"is_require_subscription\";s:4:\"MQ==\";s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:28:\"aGVsbG9Ad3AtbW9kdWxhLmNvbQ==\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";s:4:\"MQ==\";s:11:\"is_featured\";s:0:\"\";s:2:\"id\";s:8:\"MTg0Ng==\";s:7:\"updated\";s:28:\"MjAxOS0xMS0xMyAxMzo1MTozOA==\";s:7:\"created\";s:28:\"MjAxNy0wOC0yMCAxNDozNzo1Mw==\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}}s:14:\"active_plugins\";O:8:\"stdClass\":3:{s:9:\"timestamp\";i:1595353983;s:3:\"md5\";s:32:\"3494e4b473dd49de3db4f6a91acd644b\";s:7:\"plugins\";a:13:{s:34:\"advanced-custom-fields-pro/acf.php\";a:5:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:7:\"version\";s:5:\"5.7.7\";s:5:\"title\";s:26:\"Advanced Custom Fields PRO\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";a:5:{s:4:\"slug\";s:27:\"ajax-search-for-woocommerce\";s:7:\"version\";s:5:\"1.7.1\";s:5:\"title\";s:27:\"AJAX Search for WooCommerce\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:33:\"classic-editor/classic-editor.php\";a:5:{s:4:\"slug\";s:14:\"classic-editor\";s:7:\"version\";s:3:\"1.5\";s:5:\"title\";s:14:\"Classic Editor\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:36:\"contact-form-7/wp-contact-form-7.php\";a:5:{s:4:\"slug\";s:14:\"contact-form-7\";s:7:\"version\";s:5:\"5.1.4\";s:5:\"title\";s:14:\"Contact Form 7\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:58:\"contact-form-7-to-database-extension/contact-form-7-db.php\";a:5:{s:4:\"slug\";s:36:\"contact-form-7-to-database-extension\";s:7:\"version\";s:7:\"2.10.26\";s:5:\"title\";s:15:\"Contact Form DB\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:32:\"duplicate-page/duplicatepage.php\";a:5:{s:4:\"slug\";s:14:\"duplicate-page\";s:7:\"version\";s:3:\"4.0\";s:5:\"title\";s:14:\"Duplicate Page\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:27:\"woocommerce/woocommerce.php\";a:5:{s:4:\"slug\";s:11:\"woocommerce\";s:7:\"version\";s:5:\"3.7.1\";s:5:\"title\";s:11:\"WooCommerce\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:24:\"wordpress-seo/wp-seo.php\";a:5:{s:4:\"slug\";s:13:\"wordpress-seo\";s:7:\"version\";s:4:\"11.8\";s:5:\"title\";s:9:\"Yoast SEO\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";a:5:{s:4:\"slug\";s:24:\"facebook-for-woocommerce\";s:7:\"version\";s:6:\"1.11.4\";s:5:\"title\";s:24:\"Facebook for WooCommerce\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";a:5:{s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:7:\"version\";s:5:\"2.4.1\";s:5:\"title\";s:25:\"Mailchimp for WooCommerce\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:80:\"woocommerce-attribute-range-filter-master/woocommerce-attribute-range-filter.php\";a:5:{s:4:\"slug\";s:41:\"woocommerce-attribute-range-filter-master\";s:7:\"version\";s:3:\"0.1\";s:5:\"title\";s:34:\"WooCommerce Attribute Range Filter\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";a:5:{s:4:\"slug\";s:29:\"final-tiles-grid-gallery-lite\";s:7:\"version\";s:6:\"3.4.20\";s:5:\"title\";s:40:\"Final Tiles Grid Gallery - Image Gallery\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}s:35:\"pasarela-maximo/pasarela-maximo.php\";a:5:{s:4:\"slug\";s:15:\"pasarela-maximo\";s:7:\"version\";s:3:\"1.0\";s:5:\"title\";s:15:\"Pasarela MAXIMO\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}}}s:11:\"all_plugins\";O:8:\"stdClass\":3:{s:9:\"timestamp\";i:1593709895;s:3:\"md5\";s:32:\"81f296425f775bd46ef86eab93c81992\";s:7:\"plugins\";a:16:{s:34:\"advanced-custom-fields-pro/acf.php\";a:5:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:7:\"version\";s:5:\"5.7.7\";s:5:\"title\";s:26:\"Advanced Custom Fields PRO\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";a:5:{s:4:\"slug\";s:27:\"ajax-search-for-woocommerce\";s:7:\"version\";s:5:\"1.7.1\";s:5:\"title\";s:27:\"AJAX Search for WooCommerce\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:19:\"akismet/akismet.php\";a:5:{s:4:\"slug\";s:7:\"akismet\";s:7:\"version\";s:5:\"4.1.2\";s:5:\"title\";s:17:\"Akismet Anti-Spam\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:33:\"classic-editor/classic-editor.php\";a:5:{s:4:\"slug\";s:14:\"classic-editor\";s:7:\"version\";s:3:\"1.5\";s:5:\"title\";s:14:\"Classic Editor\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:36:\"contact-form-7/wp-contact-form-7.php\";a:5:{s:4:\"slug\";s:14:\"contact-form-7\";s:7:\"version\";s:5:\"5.1.4\";s:5:\"title\";s:14:\"Contact Form 7\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:58:\"contact-form-7-to-database-extension/contact-form-7-db.php\";a:5:{s:4:\"slug\";s:36:\"contact-form-7-to-database-extension\";s:7:\"version\";s:7:\"2.10.26\";s:5:\"title\";s:15:\"Contact Form DB\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:32:\"duplicate-page/duplicatepage.php\";a:5:{s:4:\"slug\";s:14:\"duplicate-page\";s:7:\"version\";s:3:\"4.0\";s:5:\"title\";s:14:\"Duplicate Page\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:9:\"hello.php\";a:5:{s:4:\"slug\";s:11:\"hello-dolly\";s:7:\"version\";s:5:\"1.7.2\";s:5:\"title\";s:11:\"Hello Dolly\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:27:\"woocommerce/woocommerce.php\";a:5:{s:4:\"slug\";s:11:\"woocommerce\";s:7:\"version\";s:5:\"3.7.1\";s:5:\"title\";s:11:\"WooCommerce\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:24:\"wordpress-seo/wp-seo.php\";a:5:{s:4:\"slug\";s:13:\"wordpress-seo\";s:7:\"version\";s:4:\"11.8\";s:5:\"title\";s:9:\"Yoast SEO\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";a:5:{s:4:\"slug\";s:24:\"facebook-for-woocommerce\";s:7:\"version\";s:6:\"1.11.4\";s:5:\"title\";s:24:\"Facebook for WooCommerce\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";a:5:{s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:7:\"version\";s:5:\"2.4.1\";s:5:\"title\";s:25:\"Mailchimp for WooCommerce\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:39:\"woocommerce-admin/woocommerce-admin.php\";a:5:{s:4:\"slug\";s:17:\"woocommerce-admin\";s:7:\"version\";s:5:\"1.2.4\";s:5:\"title\";s:17:\"WooCommerce Admin\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:80:\"woocommerce-attribute-range-filter-master/woocommerce-attribute-range-filter.php\";a:5:{s:4:\"slug\";s:41:\"woocommerce-attribute-range-filter-master\";s:7:\"version\";s:3:\"0.1\";s:5:\"title\";s:34:\"WooCommerce Attribute Range Filter\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";a:5:{s:4:\"slug\";s:29:\"final-tiles-grid-gallery-lite\";s:7:\"version\";s:6:\"3.4.20\";s:5:\"title\";s:40:\"Final Tiles Grid Gallery - Image Gallery\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}s:35:\"pasarela-maximo/pasarela-maximo.php\";a:5:{s:4:\"slug\";s:15:\"pasarela-maximo\";s:7:\"version\";s:3:\"1.0\";s:5:\"title\";s:15:\"Pasarela MAXIMO\";s:9:\"is_active\";b:0;s:14:\"is_uninstalled\";b:0;}}}s:10:\"all_themes\";O:8:\"stdClass\":3:{s:9:\"timestamp\";i:1595353983;s:3:\"md5\";s:32:\"80c47c1eb6385833ee25a68d9fe7f04c\";s:6:\"themes\";a:1:{s:10:\"blankTheme\";a:5:{s:4:\"slug\";s:10:\"blankTheme\";s:7:\"version\";s:3:\"1.0\";s:5:\"title\";s:8:\"Al Mango\";s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;}}}s:5:\"sites\";a:2:{s:27:\"ajax-search-for-woocommerce\";O:7:\"FS_Site\":25:{s:7:\"site_id\";s:8:\"35749746\";s:9:\"plugin_id\";s:3:\"700\";s:7:\"user_id\";s:7:\"3222500\";s:5:\"title\";s:7:\"AlMango\";s:3:\"url\";s:22:\"http://dev.almango.com\";s:7:\"version\";s:5:\"1.7.1\";s:8:\"language\";s:2:\"es\";s:7:\"charset\";s:5:\"UTF-8\";s:16:\"platform_version\";s:5:\"5.2.2\";s:11:\"sdk_version\";s:5:\"2.3.2\";s:28:\"programming_language_version\";s:5:\"7.3.8\";s:7:\"plan_id\";s:4:\"2902\";s:10:\"license_id\";N;s:13:\"trial_plan_id\";N;s:10:\"trial_ends\";N;s:10:\"is_premium\";b:0;s:15:\"is_disconnected\";b:0;s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;s:10:\"public_key\";s:32:\"pk_ef930b12846af885556fdb6bd3d89\";s:10:\"secret_key\";s:32:\"sk_Tp@$K7:qGcEKeE)}^3E9)Ug334PA_\";s:2:\"id\";s:7:\"4921033\";s:7:\"updated\";N;s:7:\"created\";s:19:\"2020-06-22 18:04:06\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}s:29:\"final-tiles-grid-gallery-lite\";O:7:\"FS_Site\":25:{s:7:\"site_id\";s:8:\"35749746\";s:9:\"plugin_id\";s:4:\"1002\";s:7:\"user_id\";s:7:\"3222500\";s:5:\"title\";s:7:\"AlMango\";s:3:\"url\";s:22:\"http://dev.almango.com\";s:7:\"version\";s:6:\"3.4.20\";s:8:\"language\";s:2:\"es\";s:7:\"charset\";s:5:\"UTF-8\";s:16:\"platform_version\";s:5:\"5.2.2\";s:11:\"sdk_version\";s:5:\"2.3.2\";s:28:\"programming_language_version\";s:5:\"7.3.8\";s:7:\"plan_id\";s:4:\"2064\";s:10:\"license_id\";N;s:13:\"trial_plan_id\";N;s:10:\"trial_ends\";N;s:10:\"is_premium\";b:0;s:15:\"is_disconnected\";b:0;s:9:\"is_active\";b:1;s:14:\"is_uninstalled\";b:0;s:10:\"public_key\";s:32:\"pk_f3cbc759d9ea3deccf8092282c9a8\";s:10:\"secret_key\";s:32:\"sk_Q(+pP+=!YSXndO=T+Acgm4Q+bdvD9\";s:2:\"id\";s:7:\"4982690\";s:7:\"updated\";N;s:7:\"created\";s:19:\"2020-07-01 06:09:14\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:5:\"users\";a:1:{i:3222500;O:7:\"FS_User\":13:{s:5:\"email\";s:29:\"frankdelarosacampos@gmail.com\";s:5:\"first\";s:5:\"admin\";s:4:\"last\";s:0:\"\";s:11:\"is_verified\";b:0;s:7:\"is_beta\";b:0;s:11:\"customer_id\";N;s:5:\"gross\";i:0;s:10:\"public_key\";s:32:\"pk_a1593a70c056bcbc00f7c20577f8d\";s:10:\"secret_key\";s:32:\"sk_.sDnhpL}iU!p.[)DjE}G@#G]d<RxI\";s:2:\"id\";s:7:\"3222500\";s:7:\"updated\";N;s:7:\"created\";s:19:\"2020-06-22 18:04:06\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:23:\"user_id_license_ids_map\";a:2:{i:700;a:1:{i:3222500;a:0:{}}i:1002;a:1:{i:3222500;a:0:{}}}s:12:\"all_licenses\";a:2:{i:700;a:0:{}i:1002;a:0:{}}s:13:\"admin_notices\";a:1:{s:29:\"final-tiles-grid-gallery-lite\";a:0:{}}}', 'yes'),
(376, 'fs_gdpr', 'a:1:{s:2:\"u1\";a:2:{s:8:\"required\";b:0;s:18:\"show_opt_in_notice\";b:0;}}', 'yes'),
(377, 'fs_api_cache', 'a:6:{s:45:\"get:/v1/users/3222500/plugins/1002/plans.json\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":1:{s:5:\"plans\";a:4:{i:0;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"1002\";s:4:\"name\";s:4:\"free\";s:5:\"title\";s:4:\"Lite\";s:11:\"description\";N;s:17:\"is_free_localhost\";b:1;s:17:\"is_block_features\";b:1;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";N;s:23:\"is_require_subscription\";b:0;s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:0;s:11:\"is_featured\";b:0;s:2:\"id\";s:4:\"2064\";s:7:\"updated\";s:19:\"2017-10-09 07:20:03\";s:7:\"created\";s:19:\"2017-10-04 05:53:45\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:1;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"1002\";s:4:\"name\";s:5:\"basic\";s:5:\"title\";s:5:\"Basic\";s:11:\"description\";N;s:17:\"is_free_localhost\";b:1;s:17:\"is_block_features\";b:0;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";i:14;s:23:\"is_require_subscription\";b:1;s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:25:\"support@greentreelabs.net\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:0;s:11:\"is_featured\";b:0;s:2:\"id\";s:4:\"1836\";s:7:\"updated\";s:19:\"2019-11-13 13:56:33\";s:7:\"created\";s:19:\"2017-08-19 07:22:05\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:2;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"1002\";s:4:\"name\";s:8:\"ultimate\";s:5:\"title\";s:8:\"Ultimate\";s:11:\"description\";N;s:17:\"is_free_localhost\";b:1;s:17:\"is_block_features\";b:0;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";i:14;s:23:\"is_require_subscription\";b:1;s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:19:\"hello@wp-modula.com\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:0;s:11:\"is_featured\";b:1;s:2:\"id\";s:4:\"1845\";s:7:\"updated\";s:19:\"2019-11-13 13:49:19\";s:7:\"created\";s:19:\"2017-08-20 13:58:27\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:3;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:4:\"1002\";s:4:\"name\";s:8:\"business\";s:5:\"title\";s:8:\"Business\";s:11:\"description\";N;s:17:\"is_free_localhost\";b:1;s:17:\"is_block_features\";b:0;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";i:14;s:23:\"is_require_subscription\";b:1;s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:19:\"hello@wp-modula.com\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:1;s:11:\"is_featured\";b:0;s:2:\"id\";s:4:\"1846\";s:7:\"updated\";s:19:\"2019-11-13 13:51:38\";s:7:\"created\";s:19:\"2017-08-20 14:37:53\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}}s:7:\"created\";i:1595353977;s:9:\"timestamp\";i:1595440377;}s:56:\"get:/v1/users/3222500.json?plugin_id=1002&fields=is_beta\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":2:{s:2:\"id\";s:7:\"3222500\";s:7:\"is_beta\";b:0;}s:7:\"created\";i:1595276613;s:9:\"timestamp\";i:1595363013;}s:65:\"get:/v1/users/3222500/plugins/1002/licenses.json?is_enriched=true\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":1:{s:8:\"licenses\";a:0:{}}s:7:\"created\";i:1595353977;s:9:\"timestamp\";i:1595440377;}s:55:\"get:/v1/users/3222500.json?plugin_id=700&fields=is_beta\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":2:{s:2:\"id\";s:7:\"3222500\";s:7:\"is_beta\";b:0;}s:7:\"created\";i:1595276613;s:9:\"timestamp\";i:1595363013;}s:44:\"get:/v1/users/3222500/plugins/700/plans.json\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":1:{s:5:\"plans\";a:3:{i:0;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:3:\"700\";s:4:\"name\";s:4:\"free\";s:5:\"title\";s:7:\"Starter\";s:11:\"description\";s:28:\"Search products in live time\";s:17:\"is_free_localhost\";b:1;s:17:\"is_block_features\";b:1;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";N;s:23:\"is_require_subscription\";b:0;s:10:\"support_kb\";N;s:13:\"support_forum\";s:64:\"https://wordpress.org/support/plugin/ajax-search-for-woocommerce\";s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:0;s:11:\"is_featured\";b:0;s:2:\"id\";s:4:\"2902\";s:7:\"updated\";s:19:\"2018-12-28 00:04:05\";s:7:\"created\";s:19:\"2018-04-07 21:36:56\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:1;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:3:\"700\";s:4:\"name\";s:3:\"pro\";s:5:\"title\";s:3:\"Pro\";s:11:\"description\";s:55:\"#Increase your sales by faster and modern search engine\";s:17:\"is_free_localhost\";b:1;s:17:\"is_block_features\";b:0;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";N;s:23:\"is_require_subscription\";b:1;s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";s:22:\"dgoraplugins@gmail.com\";s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:0;s:11:\"is_featured\";b:1;s:2:\"id\";s:4:\"4799\";s:7:\"updated\";s:19:\"2019-09-30 09:54:22\";s:7:\"created\";s:19:\"2018-12-27 23:18:06\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}i:2;O:14:\"FS_Plugin_Plan\":21:{s:9:\"plugin_id\";s:3:\"700\";s:4:\"name\";s:10:\"customwork\";s:5:\"title\";s:11:\"Custom Work\";s:11:\"description\";N;s:17:\"is_free_localhost\";b:0;s:17:\"is_block_features\";b:1;s:12:\"license_type\";i:0;s:16:\"is_https_support\";b:0;s:12:\"trial_period\";N;s:23:\"is_require_subscription\";b:0;s:10:\"support_kb\";N;s:13:\"support_forum\";N;s:13:\"support_email\";N;s:13:\"support_phone\";N;s:13:\"support_skype\";N;s:18:\"is_success_manager\";b:0;s:11:\"is_featured\";b:0;s:2:\"id\";s:4:\"7356\";s:7:\"updated\";s:19:\"2019-09-10 17:20:47\";s:7:\"created\";s:19:\"2019-09-10 17:18:31\";s:22:\"\0FS_Entity\0_is_updated\";b:0;}}}s:7:\"created\";i:1595304906;s:9:\"timestamp\";i:1595391306;}s:64:\"get:/v1/users/3222500/plugins/700/licenses.json?is_enriched=true\";O:8:\"stdClass\":3:{s:6:\"result\";O:8:\"stdClass\":1:{s:8:\"licenses\";a:0:{}}s:7:\"created\";i:1595304906;s:9:\"timestamp\";i:1595391306;}}', 'no'),
(380, 'widget_dgwt_wcas_ajax_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(381, 'dgwt_wcas_activation_date', '1592849041', 'yes'),
(382, 'dgwt_wcas_settings', 'a:46:{s:9:\"min_chars\";s:1:\"3\";s:14:\"max_form_width\";s:3:\"600\";s:18:\"show_submit_button\";s:3:\"off\";s:18:\"search_submit_text\";s:6:\"Search\";s:18:\"search_placeholder\";s:40:\"Busca tu moto por estilo, modelo o marca\";s:13:\"search_layout\";s:7:\"classic\";s:21:\"enable_mobile_overlay\";s:2:\"on\";s:17:\"mobile_breakpoint\";s:3:\"992\";s:14:\"bg_input_color\";s:0:\"\";s:16:\"text_input_color\";s:0:\"\";s:18:\"border_input_color\";s:0:\"\";s:15:\"bg_submit_color\";s:0:\"\";s:17:\"text_submit_color\";s:0:\"\";s:14:\"show_preloader\";s:2:\"on\";s:13:\"preloader_url\";s:0:\"\";s:17:\"suggestions_limit\";s:1:\"7\";s:20:\"show_grouped_results\";s:2:\"on\";s:22:\"search_no_results_text\";s:17:\"No hay resultados\";s:18:\"show_product_image\";s:2:\"on\";s:18:\"show_product_price\";s:3:\"off\";s:17:\"show_product_desc\";s:3:\"off\";s:16:\"show_product_sku\";s:3:\"off\";s:27:\"search_see_all_results_text\";s:19:\"Ver todas las motos\";s:24:\"show_matching_categories\";s:2:\"on\";s:18:\"show_matching_tags\";s:3:\"off\";s:19:\"show_matching_posts\";s:3:\"off\";s:19:\"show_matching_pages\";s:3:\"off\";s:16:\"show_details_box\";s:2:\"on\";s:12:\"sug_bg_color\";s:0:\"\";s:15:\"sug_hover_color\";s:0:\"\";s:14:\"sug_text_color\";s:0:\"\";s:19:\"sug_highlight_color\";s:0:\"\";s:16:\"sug_border_color\";s:0:\"\";s:25:\"search_in_product_content\";s:2:\"on\";s:25:\"search_in_product_excerpt\";s:2:\"on\";s:21:\"search_in_product_sku\";s:3:\"off\";s:28:\"search_in_product_attributes\";s:3:\"off\";s:28:\"search_in_product_categories\";s:3:\"off\";s:22:\"search_in_product_tags\";s:3:\"off\";s:23:\"search_in_custom_fields\";s:0:\"\";s:20:\"exclude_out_of_stock\";s:3:\"off\";s:22:\"fuzziness_enabled_demo\";s:3:\"off\";s:15:\"search_synonyms\";s:0:\"\";s:16:\"indexer_schedule\";s:3:\"off\";s:25:\"indexer_schedule_interval\";s:6:\"weekly\";s:27:\"indexer_schedule_start_time\";s:1:\"3\";}', 'yes'),
(383, 'dgwt_wcas_version', '1.7.1', 'yes'),
(384, '_site_transient_timeout_locked_1', '1908209048', 'no'),
(385, '_site_transient_locked_1', '1', 'no'),
(422, 'wpseo_taxonomy_meta', 'a:2:{s:11:\"product_cat\";a:16:{i:15;a:2:{s:13:\"wpseo_linkdex\";s:2:\"18\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:25;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:26;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:43;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:36;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:46;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:45;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:44;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:40;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:42;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:41;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:39;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:37;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:38;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:34;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}i:35;a:2:{s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:2:\"30\";}}s:11:\"pa_posicion\";a:4:{i:58;a:18:{s:11:\"wpseo_title\";s:0:\"\";s:10:\"wpseo_desc\";s:0:\"\";s:15:\"wpseo_canonical\";s:0:\"\";s:13:\"wpseo_bctitle\";s:0:\"\";s:13:\"wpseo_noindex\";s:7:\"default\";s:13:\"wpseo_focuskw\";s:0:\"\";s:13:\"wpseo_linkdex\";s:0:\"\";s:19:\"wpseo_content_score\";s:0:\"\";s:19:\"wpseo_focuskeywords\";s:2:\"[]\";s:21:\"wpseo_keywordsynonyms\";s:2:\"[]\";s:21:\"wpseo_opengraph-title\";s:0:\"\";s:27:\"wpseo_opengraph-description\";s:0:\"\";s:21:\"wpseo_opengraph-image\";s:0:\"\";s:24:\"wpseo_opengraph-image-id\";s:0:\"\";s:19:\"wpseo_twitter-title\";s:0:\"\";s:25:\"wpseo_twitter-description\";s:0:\"\";s:19:\"wpseo_twitter-image\";s:0:\"\";s:22:\"wpseo_twitter-image-id\";s:0:\"\";}i:60;a:18:{s:11:\"wpseo_title\";s:0:\"\";s:10:\"wpseo_desc\";s:0:\"\";s:15:\"wpseo_canonical\";s:0:\"\";s:13:\"wpseo_bctitle\";s:0:\"\";s:13:\"wpseo_noindex\";s:7:\"default\";s:13:\"wpseo_focuskw\";s:0:\"\";s:13:\"wpseo_linkdex\";s:0:\"\";s:19:\"wpseo_content_score\";s:0:\"\";s:19:\"wpseo_focuskeywords\";s:2:\"[]\";s:21:\"wpseo_keywordsynonyms\";s:2:\"[]\";s:21:\"wpseo_opengraph-title\";s:0:\"\";s:27:\"wpseo_opengraph-description\";s:0:\"\";s:21:\"wpseo_opengraph-image\";s:0:\"\";s:24:\"wpseo_opengraph-image-id\";s:0:\"\";s:19:\"wpseo_twitter-title\";s:0:\"\";s:25:\"wpseo_twitter-description\";s:0:\"\";s:19:\"wpseo_twitter-image\";s:0:\"\";s:22:\"wpseo_twitter-image-id\";s:0:\"\";}i:57;a:18:{s:11:\"wpseo_title\";s:0:\"\";s:10:\"wpseo_desc\";s:0:\"\";s:15:\"wpseo_canonical\";s:0:\"\";s:13:\"wpseo_bctitle\";s:0:\"\";s:13:\"wpseo_noindex\";s:7:\"default\";s:13:\"wpseo_focuskw\";s:0:\"\";s:13:\"wpseo_linkdex\";s:0:\"\";s:19:\"wpseo_content_score\";s:0:\"\";s:19:\"wpseo_focuskeywords\";s:2:\"[]\";s:21:\"wpseo_keywordsynonyms\";s:2:\"[]\";s:21:\"wpseo_opengraph-title\";s:0:\"\";s:27:\"wpseo_opengraph-description\";s:0:\"\";s:21:\"wpseo_opengraph-image\";s:0:\"\";s:24:\"wpseo_opengraph-image-id\";s:0:\"\";s:19:\"wpseo_twitter-title\";s:0:\"\";s:25:\"wpseo_twitter-description\";s:0:\"\";s:19:\"wpseo_twitter-image\";s:0:\"\";s:22:\"wpseo_twitter-image-id\";s:0:\"\";}i:59;a:18:{s:11:\"wpseo_title\";s:0:\"\";s:10:\"wpseo_desc\";s:0:\"\";s:15:\"wpseo_canonical\";s:0:\"\";s:13:\"wpseo_bctitle\";s:0:\"\";s:13:\"wpseo_noindex\";s:7:\"default\";s:13:\"wpseo_focuskw\";s:0:\"\";s:13:\"wpseo_linkdex\";s:0:\"\";s:19:\"wpseo_content_score\";s:0:\"\";s:19:\"wpseo_focuskeywords\";s:2:\"[]\";s:21:\"wpseo_keywordsynonyms\";s:2:\"[]\";s:21:\"wpseo_opengraph-title\";s:0:\"\";s:27:\"wpseo_opengraph-description\";s:0:\"\";s:21:\"wpseo_opengraph-image\";s:0:\"\";s:24:\"wpseo_opengraph-image-id\";s:0:\"\";s:19:\"wpseo_twitter-title\";s:0:\"\";s:25:\"wpseo_twitter-description\";s:0:\"\";s:19:\"wpseo_twitter-image\";s:0:\"\";s:22:\"wpseo_twitter-image-id\";s:0:\"\";}}}', 'yes'),
(494, 'category_children', 'a:0:{}', 'yes'),
(557, '_transient_product_query-transient-version', '1595279424', 'yes'),
(558, '_transient_product-transient-version', '1594766573', 'yes'),
(570, 'options_logo', '96', 'no'),
(571, '_options_logo', 'field_5ef169d12428c', 'no'),
(572, 'options_subscription_title', '¡NUESTRAS OFERTAS A UN CLIC!', 'no'),
(573, '_options_subscription_title', 'field_5ef169da2428d', 'no'),
(574, 'options_social_0_link', '#', 'no'),
(575, '_options_social_0_link', 'field_5ef169ff2428f', 'no'),
(576, 'options_social_0_img', '97', 'no'),
(577, '_options_social_0_img', 'field_5ef16a0824290', 'no'),
(578, 'options_social_1_link', '#', 'no'),
(579, '_options_social_1_link', 'field_5ef169ff2428f', 'no'),
(580, 'options_social_1_img', '98', 'no'),
(581, '_options_social_1_img', 'field_5ef16a0824290', 'no'),
(582, 'options_social_2_link', '#', 'no'),
(583, '_options_social_2_link', 'field_5ef169ff2428f', 'no'),
(584, 'options_social_2_img', '99', 'no'),
(585, '_options_social_2_img', 'field_5ef16a0824290', 'no'),
(586, 'options_social_3_link', '#', 'no'),
(587, '_options_social_3_link', 'field_5ef169ff2428f', 'no'),
(588, 'options_social_3_img', '100', 'no'),
(589, '_options_social_3_img', 'field_5ef16a0824290', 'no'),
(590, 'options_social', '4', 'no'),
(591, '_options_social', 'field_5ef169e82428e', 'no'),
(592, 'options_conocenos_menu', '<h2>CONÓCENOS</h2>\r\n<ul>\r\n 	<li>¿Quiénes somos?</li>\r\n 	<li>¿Por que nosotros?</li>\r\n 	<li>Trabaja con Nosotros</li>\r\n</ul>', 'no'),
(593, '_options_conocenos_menu', 'field_5ef16a46bad64', 'no'),
(594, 'options_servicio_menu', '<h2>SERVICIO AL CLIENTE</h2>\r\n<ul>\r\n 	<li>¿Como comprar en <strong class=\"morado\">Almango</strong>.<strong class=\"naranja\">pe</strong>?</li>\r\n 	<li>Preguntas Frecuentes</li>\r\n 	<li>Contáctanos</li>\r\n 	<li>Ventas Corporativaas</li>\r\n</ul>', 'no'),
(595, '_options_servicio_menu', 'field_5ef16a5fbad65', 'no'),
(596, 'options_nosotros_menu', '<h2>CRECE CON NOSOTROS</h2>\r\n<ul>\r\n 	<li>Anuncia con Nosotros</li>\r\n 	<li>Conviértete en Socio</li>\r\n</ul>', 'no'),
(597, '_options_nosotros_menu', 'field_5ef16a67bad66', 'no'),
(598, 'options_legales_menu', '<h2>LEGALES</h2>\r\n<ul>\r\n 	<li>Términos y Condiciones</li>\r\n 	<li>Protección de Propiedad Intelectual</li>\r\n 	<li>Contrato de compra, privacidad y seguridad</li>\r\n</ul>', 'no'),
(599, '_options_legales_menu', 'field_5ef16a6ebad67', 'no'),
(602, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(624, '_transient_timeout_wc_shipping_method_count', '1595475746', 'no'),
(625, '_transient_wc_shipping_method_count', 'a:2:{s:7:\"version\";s:10:\"1592845205\";s:5:\"value\";i:0;}', 'no'),
(934, 'woocommerce_obw_last_completed_step', 'recommended', 'yes'),
(937, 'woocommerce_product_type', 'both', 'yes'),
(939, 'woocommerce_tracker_last_send', '1595276695', 'yes'),
(940, 'woocommerce_cheque_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(941, 'woocommerce_bacs_settings', 'a:10:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:20:\"Direct bank transfer\";s:11:\"description\";s:176:\"Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.\";s:12:\"instructions\";s:0:\"\";s:12:\"account_name\";s:0:\"\";s:14:\"account_number\";s:0:\"\";s:9:\"sort_code\";s:0:\"\";s:9:\"bank_name\";s:0:\"\";s:4:\"iban\";s:0:\"\";s:3:\"bic\";s:0:\"\";}', 'yes'),
(942, 'woocommerce_cod_settings', 'a:6:{s:7:\"enabled\";s:2:\"no\";s:5:\"title\";s:16:\"Cash on delivery\";s:11:\"description\";s:28:\"Pay with cash upon delivery.\";s:12:\"instructions\";s:28:\"Pay with cash upon delivery.\";s:18:\"enable_for_methods\";a:0:{}s:18:\"enable_for_virtual\";s:3:\"yes\";}', 'yes'),
(951, 'mailchimp-woocommerce', 'a:0:{}', 'yes'),
(952, 'mailchimp_woocommerce_plugin_do_activation_redirect', '', 'yes'),
(953, 'mailchimp-woocommerce-store_id', '5ef2583a175e0', 'yes'),
(954, 'mailchimp-woocommerce-store-id-last-verified', '1592940602', 'yes'),
(955, 'action_scheduler_hybrid_store_demarkation', '112', 'yes'),
(956, 'schema-ActionScheduler_StoreSchema', '3.0.1592940603', 'yes'),
(957, 'schema-ActionScheduler_LoggerSchema', '2.0.1592940603', 'yes'),
(966, 'action_scheduler_lock_async-request-runner', '1595354045', 'yes'),
(967, 'wc_facebook_for_woocommerce_is_active', 'yes', 'yes'),
(968, 'woocommerce_admin_notice_woocommerce-admin_install_error', 'WooCommerce Admin was installed but could not be activated. <a href=\"http://dev.almango.com/wp-admin/plugins.php\">Please activate it manually by clicking here.</a>', 'yes'),
(970, 'action_scheduler_migration_status', 'complete', 'yes'),
(1550, 'wc_facebook_for_woocommerce_lifecycle_events', '[{\"name\":\"install\",\"time\":1593201241,\"version\":\"1.11.4\"}]', 'no'),
(1551, 'wc_facebook_for_woocommerce_version', '1.11.4', 'yes'),
(1553, 'woocommerce_tracker_ua', 'a:3:{i:0;s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";i:1;s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\";i:2;s:130:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36 Edg/84.0.522.40\";}', 'yes'),
(1735, '_transient_wc_attribute_taxonomies', 'a:3:{i:0;O:8:\"stdClass\":6:{s:12:\"attribute_id\";s:1:\"2\";s:14:\"attribute_name\";s:10:\"cilindrada\";s:15:\"attribute_label\";s:10:\"Cilindrada\";s:14:\"attribute_type\";s:6:\"select\";s:17:\"attribute_orderby\";s:10:\"menu_order\";s:16:\"attribute_public\";s:1:\"0\";}i:1;O:8:\"stdClass\":6:{s:12:\"attribute_id\";s:1:\"1\";s:14:\"attribute_name\";s:5:\"color\";s:15:\"attribute_label\";s:5:\"Color\";s:14:\"attribute_type\";s:6:\"select\";s:17:\"attribute_orderby\";s:10:\"menu_order\";s:16:\"attribute_public\";s:1:\"0\";}i:2;O:8:\"stdClass\":6:{s:12:\"attribute_id\";s:1:\"3\";s:14:\"attribute_name\";s:8:\"posicion\";s:15:\"attribute_label\";s:8:\"posicion\";s:14:\"attribute_type\";s:6:\"select\";s:17:\"attribute_orderby\";s:10:\"menu_order\";s:16:\"attribute_public\";s:1:\"0\";}}', 'yes'),
(1751, 'widget_wc-range-filter-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1790, 'woocommerce_thumbnail_cropping', 'uncropped', 'yes'),
(1791, 'woocommerce_default_catalog_orderby', 'price', 'yes'),
(1792, 'woocommerce_catalog_columns', '3', 'yes'),
(1793, 'woocommerce_catalog_rows', '3', 'yes'),
(2055, 'product_cat_children', 'a:9:{i:24;a:2:{i:0;i:25;i:1;i:26;}i:15;a:8:{i:0;i:27;i:1;i:28;i:2;i:29;i:3;i:30;i:4;i:31;i:5;i:32;i:6;i:33;i:7;i:34;}i:34;a:1:{i:0;i:35;}i:27;a:2:{i:0;i:36;i:1;i:43;}i:33;a:1:{i:0;i:37;}i:30;a:1:{i:0;i:38;}i:29;a:2:{i:0;i:39;i:1;i:41;}i:28;a:4:{i:0;i:40;i:1;i:44;i:2;i:45;i:3;i:46;}i:32;a:1:{i:0;i:42;}}', 'yes');
INSERT INTO `al_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(2057, 'rewrite_rules', 'a:158:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:39:\"index.php?yoast-sitemap-xsl=$matches[1]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=8&cpage=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(2334, 'FinalTiles_gallery_db_version', '20190518', 'yes'),
(2335, 'ftg_review', 'a:2:{s:4:\"time\";i:1594429552;s:9:\"dismissed\";b:1;}', 'yes'),
(2648, 'options_background_myaccount', '307', 'no'),
(2649, '_options_background_myaccount', 'field_5efd42de63219', 'no'),
(2734, 'woocommerce_woo-maximo_settings', 'a:4:{s:7:\"enabled\";s:3:\"yes\";s:9:\"test-mode\";s:3:\"yes\";s:10:\"public_key\";s:36:\"wqLNc6OB1uqkuJWV0xD98G93WhEb3AkY6kpZ\";s:11:\"private_key\";s:36:\"8lJm55dTZcB4TEliMaXjgLTrOJqIuI1A0XUz\";}', 'yes'),
(2735, 'woocommerce_gateway_order', 'a:5:{s:4:\"bacs\";i:0;s:6:\"cheque\";i:1;s:3:\"cod\";i:2;s:6:\"paypal\";i:3;s:10:\"woo-maximo\";i:4;}', 'yes'),
(2736, '_transient_orders-transient-version', '1593711628', 'yes'),
(2911, 'CF7DBPlugin_UseDataTablesJS', 'true', 'yes'),
(2912, 'CF7DBPlugin_Donated', 'false', 'yes'),
(2964, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(3178, 'recovery_mode_email_last_sent', '1593890333', 'yes'),
(3522, '_transient_timeout_wc_term_counts', '1597358810', 'no'),
(3523, '_transient_wc_term_counts', 'a:25:{i:48;s:1:\"2\";i:15;s:1:\"2\";i:46;s:1:\"2\";i:45;s:0:\"\";i:44;s:0:\"\";i:27;s:0:\"\";i:43;s:0:\"\";i:42;s:0:\"\";i:41;s:0:\"\";i:40;s:0:\"\";i:39;s:0:\"\";i:38;s:0:\"\";i:37;s:0:\"\";i:36;s:0:\"\";i:28;s:1:\"2\";i:25;s:1:\"2\";i:26;s:0:\"\";i:24;s:1:\"2\";i:35;s:0:\"\";i:29;s:0:\"\";i:30;s:0:\"\";i:31;s:0:\"\";i:32;s:0:\"\";i:33;s:0:\"\";i:34;s:0:\"\";}', 'no'),
(3631, 'options_porcentaje_conversion', '1.05', 'no'),
(3632, '_options_porcentaje_conversion', 'field_5f0e9cd66e146', 'no'),
(3856, '_transient_timeout_external_ip_address_::1', '1595880972', 'no'),
(3857, '_transient_external_ip_address_::1', '190.239.103.192', 'no'),
(3862, '_transient_timeout_acf_plugin_updates', '1595449426', 'no'),
(3863, '_transient_acf_plugin_updates', 'a:4:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:6:\"5.8.12\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:5:\"5.4.2\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}}}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"5.7.7\";}}', 'no'),
(3871, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/es_ES/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"es_ES\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/es_ES/wordpress-5.4.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.3.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.3.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.3.4\";s:7:\"version\";s:5:\"5.3.4\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1595353979;s:15:\"version_checked\";s:5:\"5.2.7\";s:12:\"translations\";a:0:{}}', 'no'),
(3872, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1595353981;s:7:\"checked\";a:1:{s:10:\"blankTheme\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(3874, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:29:\"frankdelarosacampos@gmail.com\";s:7:\"version\";s:5:\"5.2.7\";s:9:\"timestamp\";i:1595276691;}', 'no'),
(3878, '_transient_timeout_external_ip_address_127.0.0.1', '1595881498', 'no'),
(3879, '_transient_external_ip_address_127.0.0.1', '190.239.103.192', 'no'),
(3882, '_transient_timeout_wc_layered_nav_counts_pa_posicion', '1595363156', 'no'),
(3883, '_transient_wc_layered_nav_counts_pa_posicion', 'a:3:{i:0;b:0;s:32:\"c981ab03ba3d5b953831eed343d92ade\";a:4:{i:57;i:2;i:58;i:2;i:59;i:2;i:60;i:2;}s:32:\"67cd5045d03b6874accf88d2d369e5c2\";a:4:{i:57;i:2;i:58;i:2;i:59;i:2;i:60;i:2;}}', 'no'),
(3896, '_site_transient_timeout_browser_2469762b83ca8d970135b59a36e5efad', '1595884222', 'no'),
(3897, '_site_transient_browser_2469762b83ca8d970135b59a36e5efad', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"84.0.4147.89\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(3898, '_site_transient_timeout_php_check_90a84b80b2ae4bb2a14bb18a1c790012', '1595884223', 'no'),
(3899, '_site_transient_php_check_90a84b80b2ae4bb2a14bb18a1c790012', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(3900, '_transient_timeout_sv_wc_plugin_wc_versions', '1595884223', 'no'),
(3901, '_transient_sv_wc_plugin_wc_versions', 'a:65:{i:0;s:5:\"4.3.0\";i:1;s:5:\"4.2.2\";i:2;s:5:\"4.2.1\";i:3;s:5:\"4.2.0\";i:4;s:5:\"4.1.1\";i:5;s:5:\"4.1.0\";i:6;s:5:\"4.0.1\";i:7;s:5:\"4.0.0\";i:8;s:5:\"3.9.3\";i:9;s:5:\"3.9.2\";i:10;s:5:\"3.9.1\";i:11;s:5:\"3.9.0\";i:12;s:5:\"3.8.1\";i:13;s:5:\"3.8.0\";i:14;s:5:\"3.7.1\";i:15;s:5:\"3.7.0\";i:16;s:5:\"3.6.5\";i:17;s:5:\"3.6.4\";i:18;s:5:\"3.6.3\";i:19;s:5:\"3.6.2\";i:20;s:5:\"3.6.1\";i:21;s:5:\"3.6.0\";i:22;s:5:\"3.5.8\";i:23;s:5:\"3.5.7\";i:24;s:5:\"3.5.6\";i:25;s:5:\"3.5.5\";i:26;s:5:\"3.5.4\";i:27;s:5:\"3.5.3\";i:28;s:5:\"3.5.2\";i:29;s:5:\"3.5.1\";i:30;s:5:\"3.5.0\";i:31;s:5:\"3.4.7\";i:32;s:5:\"3.4.6\";i:33;s:5:\"3.4.5\";i:34;s:5:\"3.4.4\";i:35;s:5:\"3.4.3\";i:36;s:5:\"3.4.2\";i:37;s:5:\"3.4.1\";i:38;s:5:\"3.4.0\";i:39;s:5:\"3.3.5\";i:40;s:5:\"3.3.4\";i:41;s:5:\"3.3.3\";i:42;s:5:\"3.3.2\";i:43;s:5:\"3.3.1\";i:44;s:5:\"3.3.0\";i:45;s:5:\"3.2.6\";i:46;s:5:\"3.2.5\";i:47;s:5:\"3.2.4\";i:48;s:5:\"3.2.3\";i:49;s:5:\"3.2.2\";i:50;s:5:\"3.2.1\";i:51;s:5:\"3.2.0\";i:52;s:5:\"3.1.2\";i:53;s:5:\"3.1.1\";i:54;s:5:\"3.1.0\";i:55;s:5:\"3.0.9\";i:56;s:5:\"3.0.8\";i:57;s:5:\"3.0.7\";i:58;s:5:\"3.0.6\";i:59;s:5:\"3.0.5\";i:60;s:5:\"3.0.4\";i:61;s:5:\"3.0.3\";i:62;s:5:\"3.0.2\";i:63;s:5:\"3.0.1\";i:64;s:5:\"3.0.0\";}', 'no'),
(3902, '_transient_timeout_wc_low_stock_count', '1597871424', 'no'),
(3903, '_transient_wc_low_stock_count', '0', 'no'),
(3904, '_transient_timeout_wc_outofstock_count', '1597871424', 'no'),
(3905, '_transient_wc_outofstock_count', '0', 'no'),
(3906, '_transient_timeout_wc_report_sales_by_date', '1595373549', 'no'),
(3907, '_transient_wc_report_sales_by_date', 'a:16:{s:32:\"194eb16c796c7defe3c8836a873af4ab\";a:0:{}s:32:\"b4ca56d4a250cf6f2c224a2bd3f7c551\";a:0:{}s:32:\"4f09a9b3376fbd3653b21ce0dc550d22\";a:0:{}s:32:\"31b1d516a40cf5b41709780d453f3ae1\";N;s:32:\"566d7f546a5f579f04401edc39cf0241\";a:0:{}s:32:\"91bdd4b62435765e65427ce0feef5cd5\";a:0:{}s:32:\"c0fb672d249f0d66b6dd652e9ae81da7\";a:0:{}s:32:\"b3e0700f5b2719f89b687db925fa42ef\";a:0:{}s:32:\"ee8a17a9408b848e57eac3effb65c8b1\";a:0:{}s:32:\"b1b6af7226a961f9d8d8b3dd5421577a\";a:0:{}s:32:\"4253bf39ab639edd4068c8170f1023d9\";a:0:{}s:32:\"99c2d9ad6869f175ae68e0f3075f71da\";N;s:32:\"143993c4d67fdf332c5b58ae9211e657\";a:0:{}s:32:\"c9bc94c367e5c49a65cefaf82d10c8ce\";a:0:{}s:32:\"ea68a4a821f690b707e977daddb0fd80\";a:0:{}s:32:\"20af67f53964f6fcb8b45c980faf13b6\";a:0:{}}', 'no'),
(3908, '_transient_timeout_wc_admin_report', '1595373550', 'no'),
(3909, '_transient_wc_admin_report', 'a:1:{s:32:\"dd4ee581345391c7e1eef781c420643a\";a:0:{}}', 'no'),
(4085, '_transient_timeout__woocommerce_helper_subscriptions', '1595354879', 'no'),
(4086, '_transient__woocommerce_helper_subscriptions', 'a:0:{}', 'no'),
(4087, '_site_transient_timeout_theme_roots', '1595355779', 'no'),
(4088, '_site_transient_theme_roots', 'a:1:{s:10:\"blankTheme\";s:7:\"/themes\";}', 'no'),
(4089, '_transient_timeout__woocommerce_helper_updates', '1595397179', 'no'),
(4090, '_transient__woocommerce_helper_updates', 'a:4:{s:4:\"hash\";s:32:\"d751713988987e9331980363e24189ce\";s:7:\"updated\";i:1595353979;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}', 'no'),
(4091, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1595353981;s:7:\"checked\";a:16:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"5.7.7\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";s:5:\"1.7.1\";s:19:\"akismet/akismet.php\";s:5:\"4.1.2\";s:33:\"classic-editor/classic-editor.php\";s:3:\"1.5\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.1.4\";s:58:\"contact-form-7-to-database-extension/contact-form-7-db.php\";s:7:\"2.10.26\";s:32:\"duplicate-page/duplicatepage.php\";s:3:\"4.0\";s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";s:6:\"1.11.4\";s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";s:6:\"3.4.20\";s:9:\"hello.php\";s:5:\"1.7.2\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:5:\"2.4.1\";s:35:\"pasarela-maximo/pasarela-maximo.php\";s:3:\"1.0\";s:27:\"woocommerce/woocommerce.php\";s:5:\"3.7.1\";s:39:\"woocommerce-admin/woocommerce-admin.php\";s:5:\"1.2.4\";s:80:\"woocommerce-attribute-range-filter-master/woocommerce-attribute-range-filter.php\";s:3:\"0.1\";s:24:\"wordpress-seo/wp-seo.php\";s:4:\"11.8\";}s:8:\"response\";a:5:{s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:41:\"w.org/plugins/ajax-search-for-woocommerce\";s:4:\"slug\";s:27:\"ajax-search-for-woocommerce\";s:6:\"plugin\";s:59:\"ajax-search-for-woocommerce/ajax-search-for-woocommerce.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/ajax-search-for-woocommerce/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/ajax-search-for-woocommerce.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:80:\"https://ps.w.org/ajax-search-for-woocommerce/assets/icon-256x256.png?rev=2042590\";s:2:\"1x\";s:80:\"https://ps.w.org/ajax-search-for-woocommerce/assets/icon-128x128.png?rev=2042590\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:83:\"https://ps.w.org/ajax-search-for-woocommerce/assets/banner-1544x500.jpg?rev=2234615\";s:2:\"1x\";s:82:\"https://ps.w.org/ajax-search-for-woocommerce/assets/banner-772x250.jpg?rev=2234615\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.5\";s:12:\"requires_php\";s:3:\"5.5\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:32:\"duplicate-page/duplicatepage.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/duplicate-page\";s:4:\"slug\";s:14:\"duplicate-page\";s:6:\"plugin\";s:32:\"duplicate-page/duplicatepage.php\";s:11:\"new_version\";s:3:\"4.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/duplicate-page/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/duplicate-page.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/duplicate-page/assets/icon-128x128.jpg?rev=1412874\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/duplicate-page/assets/banner-772x250.jpg?rev=1410328\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"4.3.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.4.3.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2075035\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2075035\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2075035\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2075035\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"7.0\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:6:\"5.8.12\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:5:\"5.4.2\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:8:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/classic-editor.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:3:\"5.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/contact-form-7.5.2.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";a:0:{}}s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:38:\"w.org/plugins/facebook-for-woocommerce\";s:4:\"slug\";s:24:\"facebook-for-woocommerce\";s:6:\"plugin\";s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";s:11:\"new_version\";s:6:\"1.11.4\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/facebook-for-woocommerce/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/facebook-for-woocommerce.1.11.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:77:\"https://ps.w.org/facebook-for-woocommerce/assets/icon-256x256.png?rev=2040223\";s:2:\"1x\";s:69:\"https://ps.w.org/facebook-for-woocommerce/assets/icon.svg?rev=2040223\";s:3:\"svg\";s:69:\"https://ps.w.org/facebook-for-woocommerce/assets/icon.svg?rev=2040223\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:43:\"w.org/plugins/final-tiles-grid-gallery-lite\";s:4:\"slug\";s:29:\"final-tiles-grid-gallery-lite\";s:6:\"plugin\";s:55:\"final-tiles-grid-gallery-lite/FinalTilesGalleryLite.php\";s:11:\"new_version\";s:6:\"3.4.20\";s:3:\"url\";s:60:\"https://wordpress.org/plugins/final-tiles-grid-gallery-lite/\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/plugin/final-tiles-grid-gallery-lite.3.4.20.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:82:\"https://ps.w.org/final-tiles-grid-gallery-lite/assets/icon-256x256.jpg?rev=1454717\";s:2:\"1x\";s:82:\"https://ps.w.org/final-tiles-grid-gallery-lite/assets/icon-128x128.jpg?rev=1454717\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:84:\"https://ps.w.org/final-tiles-grid-gallery-lite/assets/banner-772x250.jpg?rev=1973770\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:39:\"w.org/plugins/mailchimp-for-woocommerce\";s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:6:\"plugin\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:11:\"new_version\";s:5:\"2.4.1\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/mailchimp-for-woocommerce/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/mailchimp-for-woocommerce.2.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";s:2:\"1x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-1544x500.png?rev=1950415\";s:2:\"1x\";s:80:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-772x250.jpg?rev=1950415\";}s:11:\"banners_rtl\";a:0:{}}s:39:\"woocommerce-admin/woocommerce-admin.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:31:\"w.org/plugins/woocommerce-admin\";s:4:\"slug\";s:17:\"woocommerce-admin\";s:6:\"plugin\";s:39:\"woocommerce-admin/woocommerce-admin.php\";s:11:\"new_version\";s:5:\"1.3.1\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/woocommerce-admin/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/woocommerce-admin.1.3.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/woocommerce-admin/assets/icon-256x256.jpg?rev=2057866\";s:2:\"1x\";s:70:\"https://ps.w.org/woocommerce-admin/assets/icon-128x128.jpg?rev=2057866\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/woocommerce-admin/assets/banner-1544x500.jpg?rev=2057866\";s:2:\"1x\";s:72:\"https://ps.w.org/woocommerce-admin/assets/banner-772x250.jpg?rev=2057866\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:6:\"5.6.20\";s:13:\"compatibility\";a:0:{}}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:6:\"14.6.1\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wordpress-seo.14.6.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=1834347\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435\";}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:6:\"5.6.20\";s:13:\"compatibility\";a:0:{}}}}', 'no'),
(4093, '_site_transient_timeout_available_translations', '1595364784', 'no');
INSERT INTO `al_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(4094, '_site_transient_available_translations', 'a:119:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-06-17 12:47:20\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-19 15:59:01\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.15/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-11-09 13:59:01\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:6:\"4.8.14\";s:7:\"updated\";s:19:\"2017-10-01 12:57:10\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.8.14/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 06:59:21\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-17 13:16:10\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-21 11:15:44\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 08:20:39\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-10 08:52:41\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2019-11-06 07:19:00\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 18:18:15\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.2.7/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 18:17:47\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2020-04-15 07:22:27\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"5.2.4\";s:7:\"updated\";s:19:\"2019-10-15 07:08:52\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/5.2.4/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-19 20:02:39\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 15:27:30\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 05:41:12\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-06-18 22:29:52\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2019-10-20 22:32:55\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2019-10-20 00:26:02\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 21:14:56\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2020-03-29 13:12:46\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.6/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 22:55:35\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2019-12-07 04:01:34\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:3:\"5.1\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.1/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:3:\"5.0\";s:7:\"updated\";s:19:\"2018-12-06 21:26:01\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.0/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2019-05-23 02:23:28\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.15/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-09 09:36:22\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 22:47:59\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-13 05:45:15\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 21:14:02\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:9:\"5.0-beta3\";s:7:\"updated\";s:19:\"2018-11-28 16:04:33\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.0-beta3/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2017-12-09 21:12:23\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 04:57:38\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-19 12:07:13\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-21 13:26:33\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-06-11 12:32:32\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2020-07-04 16:43:09\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.15/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.6/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 22:37:37\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 08:32:16\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-06-17 09:33:44\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-06-05 20:31:52\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-11-09 22:16:56\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.6/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"5.1.1\";s:7:\"updated\";s:19:\"2019-03-19 14:36:40\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.1.1/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:6:\"5.0.10\";s:7:\"updated\";s:19:\"2020-07-21 01:25:55\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.0.10/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.7.11\";s:7:\"updated\";s:19:\"2018-09-20 11:13:37\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.7.11/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-12 16:20:11\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-27 17:21:25\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-24 13:53:29\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2020-03-23 13:43:32\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-21 14:15:57\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.8/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-12 08:08:32\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"5.0.3\";s:7:\"updated\";s:19:\"2019-01-09 07:34:10\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.0.3/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2019-12-04 12:22:34\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.15/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರೆಸಿ\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-21 16:30:17\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"4.9.9\";s:7:\"updated\";s:19:\"2018-12-18 14:32:44\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.9/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-14 08:45:32\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:6:\"4.7.18\";s:7:\"updated\";s:19:\"2020-07-14 09:04:42\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.18/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"5.2.3\";s:7:\"updated\";s:19:\"2019-09-08 12:57:25\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.3/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.8.14\";s:7:\"updated\";s:19:\"2018-02-13 07:38:55\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.14/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2018-08-31 11:57:07\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.15/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 22:46:31\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-27 10:30:26\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 07:05:06\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.2.7/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 07:05:39\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-17 14:43:39\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-10-24 08:39:27\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-05-21 12:29:50\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 10:57:07\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 21:32:32\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-10-20 09:41:26\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"5.2.3\";s:7:\"updated\";s:19:\"2019-07-02 07:58:03\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/5.2.3/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-21 11:32:02\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-07 21:07:54\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-11-15 09:18:40\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"5.2.3\";s:7:\"updated\";s:19:\"2019-06-26 11:40:37\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.3/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2018-01-04 13:33:13\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-20 13:58:24\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"5.2.4\";s:7:\"updated\";s:19:\"2019-10-15 10:03:57\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.4/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 08:04:21\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-10-22 00:19:41\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.6/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-06-04 18:07:56\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-09 13:59:45\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-12 12:31:53\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-08 06:44:30\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"5.1.6\";s:7:\"updated\";s:19:\"2020-04-09 10:48:08\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.1.6/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:6:\"5.0.10\";s:7:\"updated\";s:19:\"2019-01-23 12:32:40\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.0.10/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-06-10 10:43:57\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.7/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-20 08:42:05\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-11-14 00:33:57\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"5.2.4\";s:7:\"updated\";s:19:\"2019-10-01 15:59:49\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.4/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}', 'no'),
(4097, '_transient_doing_cron', '1595383014.2129359245300292968750', 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_postmeta`
--

CREATE TABLE `al_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_postmeta`
--

INSERT INTO `al_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_form', '<div class=\"ref\">[email* correo id:correo placeholder \"Escribe tu correo aquí\"]<button type=\"submit\" class=\"btn btn--morado\">Suscríbirme</button></div>'),
(4, 5, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:24:\"AlMango \"[your-subject]\"\";s:6:\"sender\";s:35:\"AlMango <wordpress@dev.almango.com>\";s:9:\"recipient\";s:29:\"frankdelarosacampos@gmail.com\";s:4:\"body\";s:168:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on AlMango (http://dev.almango.com)\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(5, 5, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:24:\"AlMango \"[your-subject]\"\";s:6:\"sender\";s:35:\"AlMango <wordpress@dev.almango.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:110:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on AlMango (http://dev.almango.com)\";s:18:\"additional_headers\";s:39:\"Reply-To: frankdelarosacampos@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(6, 5, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
(7, 5, '_additional_settings', ''),
(8, 5, '_locale', 'es_ES'),
(9, 6, '_wp_attached_file', 'woocommerce-placeholder.png'),
(10, 6, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:5:\"sizes\";a:8:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_thumbnail_preview\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(11, 8, '_edit_last', '1'),
(12, 8, '_edit_lock', '1593550099:1'),
(13, 8, '_wp_page_template', 'templates/template-home.php'),
(14, 8, '_yoast_wpseo_content_score', '30'),
(17, 11, '_wp_attached_file', '2020/06/4371089-motorcycle-transportation.png'),
(18, 11, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:45:\"2020/06/4371089-motorcycle-transportation.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4371089-motorcycle-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371089-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371089-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:43:\"4371089-motorcycle-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(19, 12, '_wp_attached_file', '2020/06/4371089-motorcycle-transportation-1.png'),
(20, 12, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:47:\"2020/06/4371089-motorcycle-transportation-1.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:47:\"4371089-motorcycle-transportation-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:47:\"4371089-motorcycle-transportation-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:47:\"4371089-motorcycle-transportation-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:45:\"4371089-motorcycle-transportation-1-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(21, 13, '_wp_attached_file', '2020/06/4371090-motorcycle-retro-scooter-transportation.png'),
(22, 13, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:59:\"2020/06/4371090-motorcycle-retro-scooter-transportation.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"4371090-motorcycle-retro-scooter-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:59:\"4371090-motorcycle-retro-scooter-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:59:\"4371090-motorcycle-retro-scooter-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:57:\"4371090-motorcycle-retro-scooter-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(23, 14, '_wp_attached_file', '2020/06/4371090-motorcycle-retro-scooter-transportation-1.png'),
(24, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:61:\"2020/06/4371090-motorcycle-retro-scooter-transportation-1.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:61:\"4371090-motorcycle-retro-scooter-transportation-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:61:\"4371090-motorcycle-retro-scooter-transportation-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:61:\"4371090-motorcycle-retro-scooter-transportation-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:59:\"4371090-motorcycle-retro-scooter-transportation-1-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(25, 15, '_wp_attached_file', '2020/06/4371095-motorcycle-transportation.png'),
(26, 15, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:45:\"2020/06/4371095-motorcycle-transportation.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4371095-motorcycle-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371095-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371095-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:43:\"4371095-motorcycle-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(27, 16, '_wp_attached_file', '2020/06/4371096-motorcycle-transportation.png'),
(28, 16, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:157;s:6:\"height\";i:157;s:4:\"file\";s:45:\"2020/06/4371096-motorcycle-transportation.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4371096-motorcycle-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371096-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371096-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:43:\"4371096-motorcycle-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(29, 17, '_wp_attached_file', '2020/06/4371096-motorcycle-transportation-1.png'),
(30, 17, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:148;s:6:\"height\";i:148;s:4:\"file\";s:47:\"2020/06/4371096-motorcycle-transportation-1.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:47:\"4371096-motorcycle-transportation-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:47:\"4371096-motorcycle-transportation-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:45:\"4371096-motorcycle-transportation-1-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(31, 18, '_wp_attached_file', '2020/06/4674604-biker-motorcycle-retro-transportation-vehicle.png'),
(32, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:65:\"2020/06/4674604-biker-motorcycle-retro-transportation-vehicle.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:65:\"4674604-biker-motorcycle-retro-transportation-vehicle-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:65:\"4674604-biker-motorcycle-retro-transportation-vehicle-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:65:\"4674604-biker-motorcycle-retro-transportation-vehicle-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:63:\"4674604-biker-motorcycle-retro-transportation-vehicle-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(33, 19, '_wp_attached_file', '2020/06/4371085-motorcycle-transportation.png'),
(34, 19, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:45:\"2020/06/4371085-motorcycle-transportation.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4371085-motorcycle-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371085-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371085-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:43:\"4371085-motorcycle-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(35, 20, '_wp_attached_file', '2020/06/4371086-motorcycle-transportation.png'),
(36, 20, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:160;s:6:\"height\";i:160;s:4:\"file\";s:45:\"2020/06/4371086-motorcycle-transportation.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4371086-motorcycle-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371086-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371086-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:43:\"4371086-motorcycle-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(37, 21, '_wp_attached_file', '2020/06/honda_png.png'),
(38, 21, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:90;s:6:\"height\";i:90;s:4:\"file\";s:21:\"2020/06/honda_png.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:19:\"honda_png-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(39, 22, '_wp_attached_file', '2020/06/Italika-logo.png'),
(40, 22, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:90;s:6:\"height\";i:90;s:4:\"file\";s:24:\"2020/06/Italika-logo.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:22:\"Italika-logo-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(41, 23, '_edit_last', '1'),
(42, 23, '_edit_lock', '1594793335:1'),
(43, 33, '_edit_last', '1'),
(44, 33, '_edit_lock', '1593194278:1'),
(45, 62, '_wp_attached_file', '2020/06/Cub.png'),
(46, 62, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:41;s:6:\"height\";i:30;s:4:\"file\";s:15:\"2020/06/Cub.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(47, 63, '_wp_attached_file', '2020/06/Custom.png'),
(48, 63, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:46;s:6:\"height\";i:23;s:4:\"file\";s:18:\"2020/06/Custom.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(49, 64, '_wp_attached_file', '2020/06/Dax.png'),
(50, 64, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:44;s:6:\"height\";i:33;s:4:\"file\";s:15:\"2020/06/Dax.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(51, 65, '_wp_attached_file', '2020/06/Deportivo.png'),
(52, 65, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:42;s:6:\"height\";i:28;s:4:\"file\";s:21:\"2020/06/Deportivo.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(53, 66, '_wp_attached_file', '2020/06/Doble-Proposito.png'),
(54, 66, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:48;s:6:\"height\";i:32;s:4:\"file\";s:27:\"2020/06/Doble-Proposito.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(55, 67, '_wp_attached_file', '2020/06/enduro.png'),
(56, 67, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:43;s:6:\"height\";i:27;s:4:\"file\";s:18:\"2020/06/enduro.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(57, 68, '_wp_attached_file', '2020/06/Maxi-Scooter.png'),
(58, 68, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:44;s:6:\"height\";i:27;s:4:\"file\";s:24:\"2020/06/Maxi-Scooter.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(59, 69, '_wp_attached_file', '2020/06/MOTO-COMPETITION.png'),
(60, 69, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:49;s:6:\"height\";i:41;s:4:\"file\";s:28:\"2020/06/MOTO-COMPETITION.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(61, 70, '_wp_attached_file', '2020/06/MOTO-HERITAGE.png'),
(62, 70, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:58;s:6:\"height\";i:34;s:4:\"file\";s:25:\"2020/06/MOTO-HERITAGE.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(63, 71, '_wp_attached_file', '2020/06/MOTO-PRACTICE.png'),
(64, 71, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:52;s:6:\"height\";i:35;s:4:\"file\";s:25:\"2020/06/MOTO-PRACTICE.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(65, 72, '_wp_attached_file', '2020/06/MOTO-SPEED.png'),
(66, 72, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:53;s:6:\"height\";i:36;s:4:\"file\";s:22:\"2020/06/MOTO-SPEED.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(67, 73, '_wp_attached_file', '2020/06/MOTO-STREET.png'),
(68, 73, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:54;s:6:\"height\";i:32;s:4:\"file\";s:23:\"2020/06/MOTO-STREET.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(69, 74, '_wp_attached_file', '2020/06/MOTO-TOUR.png'),
(70, 74, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:48;s:6:\"height\";i:34;s:4:\"file\";s:21:\"2020/06/MOTO-TOUR.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(71, 75, '_wp_attached_file', '2020/06/MOTO-TRAIL.png'),
(72, 75, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:52;s:6:\"height\";i:34;s:4:\"file\";s:22:\"2020/06/MOTO-TRAIL.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(73, 76, '_wp_attached_file', '2020/06/MOTO-URBAN.png'),
(74, 76, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:48;s:6:\"height\";i:36;s:4:\"file\";s:22:\"2020/06/MOTO-URBAN.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(75, 77, '_wp_attached_file', '2020/06/bobber.png'),
(76, 77, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:47;s:6:\"height\";i:25;s:4:\"file\";s:18:\"2020/06/bobber.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(77, 78, '_wp_attached_file', '2020/06/Cafe-racer.png'),
(78, 78, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:42;s:6:\"height\";i:22;s:4:\"file\";s:22:\"2020/06/Cafe-racer.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(79, 79, '_wp_attached_file', '2020/06/chopper.png'),
(80, 79, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:44;s:6:\"height\";i:25;s:4:\"file\";s:19:\"2020/06/chopper.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(81, 80, '_wp_attached_file', '2020/06/cross.png'),
(82, 80, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:39;s:6:\"height\";i:25;s:4:\"file\";s:17:\"2020/06/cross.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(83, 81, '_wp_attached_file', '2020/06/Cruiser.png'),
(84, 81, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:46;s:6:\"height\";i:31;s:4:\"file\";s:19:\"2020/06/Cruiser.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(85, 82, '_wp_attached_file', '2020/06/2476614.png'),
(86, 82, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:926;s:4:\"file\";s:19:\"2020/06/2476614.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"2476614-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"2476614-300x145.png\";s:5:\"width\";i:300;s:6:\"height\";i:145;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"2476614-768x370.png\";s:5:\"width\";i:768;s:6:\"height\";i:370;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:20:\"2476614-1024x494.png\";s:5:\"width\";i:1024;s:6:\"height\";i:494;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:19:\"2476614-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:19:\"2476614-600x289.png\";s:5:\"width\";i:600;s:6:\"height\";i:289;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"2476614-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:19:\"2476614-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:19:\"2476614-600x289.png\";s:5:\"width\";i:600;s:6:\"height\";i:289;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"2476614-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:17:\"2476614-64x31.png\";s:5:\"width\";i:64;s:6:\"height\";i:31;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(87, 83, '_wp_attached_file', '2020/06/28D5F4AA-A765-4A1F-8BFC-F354EA927F10.png'),
(88, 83, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:750;s:6:\"height\";i:340;s:4:\"file\";s:48:\"2020/06/28D5F4AA-A765-4A1F-8BFC-F354EA927F10.png\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-300x136.png\";s:5:\"width\";i:300;s:6:\"height\";i:136;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-600x272.png\";s:5:\"width\";i:600;s:6:\"height\";i:272;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-600x272.png\";s:5:\"width\";i:600;s:6:\"height\";i:272;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:48:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:46:\"28D5F4AA-A765-4A1F-8BFC-F354EA927F10-64x29.png\";s:5:\"width\";i:64;s:6:\"height\";i:29;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(89, 84, '_wp_attached_file', '2020/06/11424.png'),
(90, 84, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1519;s:6:\"height\";i:240;s:4:\"file\";s:17:\"2020/06/11424.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"11424-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"11424-300x47.png\";s:5:\"width\";i:300;s:6:\"height\";i:47;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:17:\"11424-768x121.png\";s:5:\"width\";i:768;s:6:\"height\";i:121;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"11424-1024x162.png\";s:5:\"width\";i:1024;s:6:\"height\";i:162;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:17:\"11424-300x240.png\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:16:\"11424-600x95.png\";s:5:\"width\";i:600;s:6:\"height\";i:95;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:17:\"11424-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:17:\"11424-300x240.png\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:16:\"11424-600x95.png\";s:5:\"width\";i:600;s:6:\"height\";i:95;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:17:\"11424-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:15:\"11424-64x10.png\";s:5:\"width\";i:64;s:6:\"height\";i:10;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(91, 85, '_wp_attached_file', '2020/06/AnrEX55.png'),
(92, 85, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:19:\"2020/06/AnrEX55.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"AnrEX55-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"AnrEX55-300x169.png\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"AnrEX55-768x432.png\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:20:\"AnrEX55-1024x576.png\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:19:\"AnrEX55-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:19:\"AnrEX55-600x338.png\";s:5:\"width\";i:600;s:6:\"height\";i:338;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"AnrEX55-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:19:\"AnrEX55-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:19:\"AnrEX55-600x338.png\";s:5:\"width\";i:600;s:6:\"height\";i:338;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"AnrEX55-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:17:\"AnrEX55-64x36.png\";s:5:\"width\";i:64;s:6:\"height\";i:36;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(93, 86, '_wp_attached_file', '2020/06/apreton-de-manos.png'),
(94, 86, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:109;s:6:\"height\";i:109;s:4:\"file\";s:28:\"2020/06/apreton-de-manos.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:28:\"apreton-de-manos-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:28:\"apreton-de-manos-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:26:\"apreton-de-manos-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(95, 87, '_wp_attached_file', '2020/06/cliente.png'),
(96, 87, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:109;s:6:\"height\";i:109;s:4:\"file\";s:19:\"2020/06/cliente.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"cliente-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"cliente-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:17:\"cliente-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(97, 88, '_wp_attached_file', '2020/06/negocios-y-finanzas.png'),
(98, 88, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:109;s:6:\"height\";i:109;s:4:\"file\";s:31:\"2020/06/negocios-y-finanzas.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"negocios-y-finanzas-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"negocios-y-finanzas-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:29:\"negocios-y-finanzas-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(99, 89, '_wp_attached_file', '2020/06/peru.png'),
(100, 89, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:109;s:6:\"height\";i:109;s:4:\"file\";s:16:\"2020/06/peru.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"peru-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"peru-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:14:\"peru-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(101, 90, '_wp_attached_file', '2020/06/proximo.png'),
(102, 90, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:19:\"2020/06/proximo.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(103, 91, '_wp_attached_file', '2020/06/proximo-1.png'),
(104, 91, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:21:\"2020/06/proximo-1.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(105, 8, 'init_img', '82'),
(106, 8, '_init_img', 'field_5ef16aa914c71'),
(107, 8, 'init-first-title', 'NUNCA FUE TAN '),
(108, 8, '_init-first-title', 'field_5ef16ab014c72'),
(109, 8, 'init-title-list_0_text', 'APASIONANTE'),
(110, 8, '_init-title-list_0_text', 'field_5ef16acb14c74'),
(111, 8, 'init-title-list_1_text', 'SENCILLO'),
(112, 8, '_init-title-list_1_text', 'field_5ef16acb14c74'),
(113, 8, 'init-title-list_2_text', 'COOL'),
(114, 8, '_init-title-list_2_text', 'field_5ef16acb14c74'),
(115, 8, 'init-title-list', '3'),
(116, 8, '_init-title-list', 'field_5ef16abd14c73'),
(117, 8, 'init-subtitle', 'COMPRAR UNA MOTO'),
(118, 8, '_init-subtitle', 'field_5ef16ad514c75'),
(119, 8, 'init-first-botton-link', '#'),
(120, 8, '_init-first-botton-link', 'field_5ef16ae114c76'),
(121, 8, 'init-first-botton-text', 'Averigua más'),
(122, 8, '_init-first-botton-text', 'field_5ef16aed14c77'),
(123, 8, 'init-second-botton-link', '#'),
(124, 8, '_init-second-botton-link', 'field_5ef16af714c78'),
(125, 8, 'init-second-botton-text', 'Ir a la tienda'),
(126, 8, '_init-second-botton-text', 'field_5ef16b0014c79'),
(127, 8, 'banner_0_img', '85'),
(128, 8, '_banner_0_img', 'field_5ef16b1f14c7b'),
(129, 8, 'banner_1_img', '85'),
(130, 8, '_banner_1_img', 'field_5ef16b1f14c7b'),
(131, 8, 'banner_2_img', '85'),
(132, 8, '_banner_2_img', 'field_5ef16b1f14c7b'),
(133, 8, 'banner', '3'),
(134, 8, '_banner', 'field_5ef16b0a14c7a'),
(135, 8, 'title_estilos', '¿CUAL ES TU ESTILO?'),
(136, 8, '_title_estilos', 'field_5ef16b2814c7c'),
(137, 8, 'banner_publicitario_0_img', '83'),
(138, 8, '_banner_publicitario_0_img', 'field_5ef16b4c14c7e'),
(139, 8, 'banner_publicitario_1_img', '83'),
(140, 8, '_banner_publicitario_1_img', 'field_5ef16b4c14c7e'),
(141, 8, 'banner_publicitario', '3'),
(142, 8, '_banner_publicitario', 'field_5ef16b3714c7d'),
(143, 8, 'title_marcas', '¿CUAL ES TU MARCA DE MOTO FAVORITA?'),
(144, 8, '_title_marcas', 'field_5ef16b5514c7f'),
(145, 8, 'title_destacados', 'LOS MODELOS MÁS TOP'),
(146, 8, '_title_destacados', 'field_5ef16b6714c80'),
(147, 8, 'products_featureds_0_banner_solid', ''),
(148, 8, '_products_featureds_0_banner_solid', 'field_5ef16b8814c82'),
(149, 8, 'products_featureds_0_id', '93'),
(150, 8, '_products_featureds_0_id', 'field_5ef16b9214c83'),
(151, 8, 'products_featureds', '4'),
(152, 8, '_products_featureds', 'field_5ef16b7614c81'),
(153, 8, 'banner_publicitario_num_one', '84'),
(154, 8, '_banner_publicitario_num_one', 'field_5ef16ba114c84'),
(155, 8, 'descuentos_title', 'DESCUENTOS ALMANGO'),
(156, 8, '_descuentos_title', 'field_5ef16c8814c85'),
(157, 8, 'descuentos_subtitle', 'Disfruta de nuestros mejores cupones aquí'),
(158, 8, '_descuentos_subtitle', 'field_5ef16c9714c86'),
(159, 8, 'prometemos_title', 'TE PROMETEMOS'),
(160, 8, '_prometemos_title', 'field_5ef16c9e14c87'),
(161, 8, 'promesas_list', '4'),
(162, 8, '_promesas_list', 'field_5ef16caa14c88'),
(163, 8, 'aceptamos_title', 'Aceptamos DEPOSITOS , TRANSFERENCIAS, tarjetas de Crédito y Débito.'),
(164, 8, '_aceptamos_title', 'field_5ef16cd214c8c'),
(165, 92, 'init_img', '82'),
(166, 92, '_init_img', 'field_5ef16aa914c71'),
(167, 92, 'init-first-title', 'NUNCA FUE TAN '),
(168, 92, '_init-first-title', 'field_5ef16ab014c72'),
(169, 92, 'init-title-list_0_text', 'APASIONANTE'),
(170, 92, '_init-title-list_0_text', 'field_5ef16acb14c74'),
(171, 92, 'init-title-list_1_text', 'SENCILLO'),
(172, 92, '_init-title-list_1_text', 'field_5ef16acb14c74'),
(173, 92, 'init-title-list_2_text', 'COOL'),
(174, 92, '_init-title-list_2_text', 'field_5ef16acb14c74'),
(175, 92, 'init-title-list', '3'),
(176, 92, '_init-title-list', 'field_5ef16abd14c73'),
(177, 92, 'init-subtitle', 'COMPRAR UNA MOTO'),
(178, 92, '_init-subtitle', 'field_5ef16ad514c75'),
(179, 92, 'init-first-botton-link', '#'),
(180, 92, '_init-first-botton-link', 'field_5ef16ae114c76'),
(181, 92, 'init-first-botton-text', 'Averigua más'),
(182, 92, '_init-first-botton-text', 'field_5ef16aed14c77'),
(183, 92, 'init-second-botton-link', '#'),
(184, 92, '_init-second-botton-link', 'field_5ef16af714c78'),
(185, 92, 'init-second-botton-text', 'Ir a la tienda'),
(186, 92, '_init-second-botton-text', 'field_5ef16b0014c79'),
(187, 92, 'banner_0_img', '85'),
(188, 92, '_banner_0_img', 'field_5ef16b1f14c7b'),
(189, 92, 'banner_1_img', '85'),
(190, 92, '_banner_1_img', 'field_5ef16b1f14c7b'),
(191, 92, 'banner_2_img', '85'),
(192, 92, '_banner_2_img', 'field_5ef16b1f14c7b'),
(193, 92, 'banner', '3'),
(194, 92, '_banner', 'field_5ef16b0a14c7a');
INSERT INTO `al_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(195, 92, 'title_estilos', '¿CUAL ES TU ESTILO?'),
(196, 92, '_title_estilos', 'field_5ef16b2814c7c'),
(197, 92, 'banner_publicitario_0_img', '83'),
(198, 92, '_banner_publicitario_0_img', 'field_5ef16b4c14c7e'),
(199, 92, 'banner_publicitario_1_img', '83'),
(200, 92, '_banner_publicitario_1_img', 'field_5ef16b4c14c7e'),
(201, 92, 'banner_publicitario', '2'),
(202, 92, '_banner_publicitario', 'field_5ef16b3714c7d'),
(203, 92, 'title_marcas', '¿CUAL ES TU MARCA DE MOTO FAVORITA?'),
(204, 92, '_title_marcas', 'field_5ef16b5514c7f'),
(205, 92, 'title_destacados', 'LOS MODELOS MÁS TOP'),
(206, 92, '_title_destacados', 'field_5ef16b6714c80'),
(207, 92, 'products_featureds_0_banner_solid', ''),
(208, 92, '_products_featureds_0_banner_solid', 'field_5ef16b8814c82'),
(209, 92, 'products_featureds_0_id', ''),
(210, 92, '_products_featureds_0_id', 'field_5ef16b9214c83'),
(211, 92, 'products_featureds', '1'),
(212, 92, '_products_featureds', 'field_5ef16b7614c81'),
(213, 92, 'banner_publicitario_num_one', ''),
(214, 92, '_banner_publicitario_num_one', 'field_5ef16ba114c84'),
(215, 92, 'descuentos_title', ''),
(216, 92, '_descuentos_title', 'field_5ef16c8814c85'),
(217, 92, 'descuentos_subtitle', ''),
(218, 92, '_descuentos_subtitle', 'field_5ef16c9714c86'),
(219, 92, 'prometemos_title', ''),
(220, 92, '_prometemos_title', 'field_5ef16c9e14c87'),
(221, 92, 'promesas_list', ''),
(222, 92, '_promesas_list', 'field_5ef16caa14c88'),
(223, 92, 'aceptamos_title', ''),
(224, 92, '_aceptamos_title', 'field_5ef16cd214c8c'),
(225, 93, '_edit_last', '1'),
(226, 93, '_edit_lock', '1594784595:1'),
(227, 93, '_regular_price', '61015'),
(228, 93, '_sale_price', '54000'),
(229, 93, 'total_sales', '0'),
(230, 93, '_tax_status', 'taxable'),
(231, 93, '_tax_class', ''),
(232, 93, '_manage_stock', 'no'),
(233, 93, '_backorders', 'no'),
(234, 93, '_sold_individually', 'no'),
(235, 93, '_virtual', 'no'),
(236, 93, '_downloadable', 'no'),
(237, 93, '_download_limit', '-1'),
(238, 93, '_download_expiry', '-1'),
(239, 93, '_stock', NULL),
(240, 93, '_stock_status', 'instock'),
(241, 93, '_wc_average_rating', '0'),
(242, 93, '_wc_review_count', '0'),
(243, 93, '_product_version', '3.7.1'),
(244, 93, '_price', '54000'),
(245, 93, '_yoast_wpseo_primary_product_cat', '15'),
(246, 93, '_yoast_wpseo_content_score', '60'),
(247, 94, '_wp_attached_file', '2020/06/unnamed.png'),
(248, 94, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:372;s:6:\"height\";i:300;s:4:\"file\";s:19:\"2020/06/unnamed.png\";s:5:\"sizes\";a:8:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"unnamed-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"unnamed-300x242.png\";s:5:\"width\";i:300;s:6:\"height\";i:242;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:19:\"unnamed-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"unnamed-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:19:\"unnamed-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"unnamed-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:17:\"unnamed-64x52.png\";s:5:\"width\";i:64;s:6:\"height\";i:52;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_thumbnail_preview\";a:4:{s:4:\"file\";s:19:\"unnamed-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(249, 93, '_thumbnail_id', '316'),
(250, 8, 'products_featureds_1_banner_solid', ''),
(251, 8, '_products_featureds_1_banner_solid', 'field_5ef16b8814c82'),
(252, 8, 'products_featureds_1_id', '93'),
(253, 8, '_products_featureds_1_id', 'field_5ef16b9214c83'),
(254, 8, 'products_featureds_2_banner_solid', ''),
(255, 8, '_products_featureds_2_banner_solid', 'field_5ef16b8814c82'),
(256, 8, 'products_featureds_2_id', '93'),
(257, 8, '_products_featureds_2_id', 'field_5ef16b9214c83'),
(258, 8, 'products_featureds_3_banner_solid', '85'),
(259, 8, '_products_featureds_3_banner_solid', 'field_5ef16b8814c82'),
(260, 8, 'products_featureds_3_id', ''),
(261, 8, '_products_featureds_3_id', 'field_5ef16b9214c83'),
(262, 8, 'promesas_list_0_imagen', '89'),
(263, 8, '_promesas_list_0_imagen', 'field_5ef16cbb14c89'),
(264, 8, 'promesas_list_0_title', 'Precio justo'),
(265, 8, '_promesas_list_0_title', 'field_5ef16cc414c8a'),
(266, 8, 'promesas_list_0_text', 'Valoramos tu inversión'),
(267, 8, '_promesas_list_0_text', 'field_5ef16cc914c8b'),
(268, 8, 'promesas_list_1_imagen', '88'),
(269, 8, '_promesas_list_1_imagen', 'field_5ef16cbb14c89'),
(270, 8, 'promesas_list_1_title', 'Envíos nacionales'),
(271, 8, '_promesas_list_1_title', 'field_5ef16cc414c8a'),
(272, 8, 'promesas_list_1_text', 'Entrega en puntos céntricos de cada ciudad'),
(273, 8, '_promesas_list_1_text', 'field_5ef16cc914c8b'),
(274, 8, 'promesas_list_2_imagen', '87'),
(275, 8, '_promesas_list_2_imagen', 'field_5ef16cbb14c89'),
(276, 8, 'promesas_list_2_title', 'Compra con confianza'),
(277, 8, '_promesas_list_2_title', 'field_5ef16cc414c8a'),
(278, 8, 'promesas_list_2_text', 'Seguridad garantizada en cada transacción'),
(279, 8, '_promesas_list_2_text', 'field_5ef16cc914c8b'),
(280, 8, 'promesas_list_3_imagen', '86'),
(281, 8, '_promesas_list_3_imagen', 'field_5ef16cbb14c89'),
(282, 8, 'promesas_list_3_title', 'Nuestras 3T'),
(283, 8, '_promesas_list_3_title', 'field_5ef16cc414c8a'),
(284, 8, 'promesas_list_3_text', 'Te escuchamos, te entendemos y te ayudamos'),
(285, 8, '_promesas_list_3_text', 'field_5ef16cc914c8b'),
(286, 95, 'init_img', '82'),
(287, 95, '_init_img', 'field_5ef16aa914c71'),
(288, 95, 'init-first-title', 'NUNCA FUE TAN '),
(289, 95, '_init-first-title', 'field_5ef16ab014c72'),
(290, 95, 'init-title-list_0_text', 'APASIONANTE'),
(291, 95, '_init-title-list_0_text', 'field_5ef16acb14c74'),
(292, 95, 'init-title-list_1_text', 'SENCILLO'),
(293, 95, '_init-title-list_1_text', 'field_5ef16acb14c74'),
(294, 95, 'init-title-list_2_text', 'COOL'),
(295, 95, '_init-title-list_2_text', 'field_5ef16acb14c74'),
(296, 95, 'init-title-list', '3'),
(297, 95, '_init-title-list', 'field_5ef16abd14c73'),
(298, 95, 'init-subtitle', 'COMPRAR UNA MOTO'),
(299, 95, '_init-subtitle', 'field_5ef16ad514c75'),
(300, 95, 'init-first-botton-link', '#'),
(301, 95, '_init-first-botton-link', 'field_5ef16ae114c76'),
(302, 95, 'init-first-botton-text', 'Averigua más'),
(303, 95, '_init-first-botton-text', 'field_5ef16aed14c77'),
(304, 95, 'init-second-botton-link', '#'),
(305, 95, '_init-second-botton-link', 'field_5ef16af714c78'),
(306, 95, 'init-second-botton-text', 'Ir a la tienda'),
(307, 95, '_init-second-botton-text', 'field_5ef16b0014c79'),
(308, 95, 'banner_0_img', '85'),
(309, 95, '_banner_0_img', 'field_5ef16b1f14c7b'),
(310, 95, 'banner_1_img', '85'),
(311, 95, '_banner_1_img', 'field_5ef16b1f14c7b'),
(312, 95, 'banner_2_img', '85'),
(313, 95, '_banner_2_img', 'field_5ef16b1f14c7b'),
(314, 95, 'banner', '3'),
(315, 95, '_banner', 'field_5ef16b0a14c7a'),
(316, 95, 'title_estilos', '¿CUAL ES TU ESTILO?'),
(317, 95, '_title_estilos', 'field_5ef16b2814c7c'),
(318, 95, 'banner_publicitario_0_img', '83'),
(319, 95, '_banner_publicitario_0_img', 'field_5ef16b4c14c7e'),
(320, 95, 'banner_publicitario_1_img', '83'),
(321, 95, '_banner_publicitario_1_img', 'field_5ef16b4c14c7e'),
(322, 95, 'banner_publicitario', '2'),
(323, 95, '_banner_publicitario', 'field_5ef16b3714c7d'),
(324, 95, 'title_marcas', '¿CUAL ES TU MARCA DE MOTO FAVORITA?'),
(325, 95, '_title_marcas', 'field_5ef16b5514c7f'),
(326, 95, 'title_destacados', 'LOS MODELOS MÁS TOP'),
(327, 95, '_title_destacados', 'field_5ef16b6714c80'),
(328, 95, 'products_featureds_0_banner_solid', ''),
(329, 95, '_products_featureds_0_banner_solid', 'field_5ef16b8814c82'),
(330, 95, 'products_featureds_0_id', '93'),
(331, 95, '_products_featureds_0_id', 'field_5ef16b9214c83'),
(332, 95, 'products_featureds', '4'),
(333, 95, '_products_featureds', 'field_5ef16b7614c81'),
(334, 95, 'banner_publicitario_num_one', '84'),
(335, 95, '_banner_publicitario_num_one', 'field_5ef16ba114c84'),
(336, 95, 'descuentos_title', 'DESCUENTOS ALMANGO'),
(337, 95, '_descuentos_title', 'field_5ef16c8814c85'),
(338, 95, 'descuentos_subtitle', 'Disfruta de nuestros mejores cupones aquí'),
(339, 95, '_descuentos_subtitle', 'field_5ef16c9714c86'),
(340, 95, 'prometemos_title', 'TE PROMETEMOS'),
(341, 95, '_prometemos_title', 'field_5ef16c9e14c87'),
(342, 95, 'promesas_list', '4'),
(343, 95, '_promesas_list', 'field_5ef16caa14c88'),
(344, 95, 'aceptamos_title', 'Aceptamos DEPOSITOS , TRANSFERENCIAS, tarjetas de Crédito y Débito.'),
(345, 95, '_aceptamos_title', 'field_5ef16cd214c8c'),
(346, 95, 'products_featureds_1_banner_solid', ''),
(347, 95, '_products_featureds_1_banner_solid', 'field_5ef16b8814c82'),
(348, 95, 'products_featureds_1_id', '93'),
(349, 95, '_products_featureds_1_id', 'field_5ef16b9214c83'),
(350, 95, 'products_featureds_2_banner_solid', ''),
(351, 95, '_products_featureds_2_banner_solid', 'field_5ef16b8814c82'),
(352, 95, 'products_featureds_2_id', '93'),
(353, 95, '_products_featureds_2_id', 'field_5ef16b9214c83'),
(354, 95, 'products_featureds_3_banner_solid', '85'),
(355, 95, '_products_featureds_3_banner_solid', 'field_5ef16b8814c82'),
(356, 95, 'products_featureds_3_id', ''),
(357, 95, '_products_featureds_3_id', 'field_5ef16b9214c83'),
(358, 95, 'promesas_list_0_imagen', '89'),
(359, 95, '_promesas_list_0_imagen', 'field_5ef16cbb14c89'),
(360, 95, 'promesas_list_0_title', 'Precio justo'),
(361, 95, '_promesas_list_0_title', 'field_5ef16cc414c8a'),
(362, 95, 'promesas_list_0_text', 'Valoramos tu inversión'),
(363, 95, '_promesas_list_0_text', 'field_5ef16cc914c8b'),
(364, 95, 'promesas_list_1_imagen', '88'),
(365, 95, '_promesas_list_1_imagen', 'field_5ef16cbb14c89'),
(366, 95, 'promesas_list_1_title', 'Envíos nacionales'),
(367, 95, '_promesas_list_1_title', 'field_5ef16cc414c8a'),
(368, 95, 'promesas_list_1_text', 'Entrega en puntos céntricos de cada ciudad'),
(369, 95, '_promesas_list_1_text', 'field_5ef16cc914c8b'),
(370, 95, 'promesas_list_2_imagen', '87'),
(371, 95, '_promesas_list_2_imagen', 'field_5ef16cbb14c89'),
(372, 95, 'promesas_list_2_title', 'Compra con confianza'),
(373, 95, '_promesas_list_2_title', 'field_5ef16cc414c8a'),
(374, 95, 'promesas_list_2_text', 'Seguridad garantizada en cada transacción'),
(375, 95, '_promesas_list_2_text', 'field_5ef16cc914c8b'),
(376, 95, 'promesas_list_3_imagen', '86'),
(377, 95, '_promesas_list_3_imagen', 'field_5ef16cbb14c89'),
(378, 95, 'promesas_list_3_title', 'Nuestras 3T'),
(379, 95, '_promesas_list_3_title', 'field_5ef16cc414c8a'),
(380, 95, 'promesas_list_3_text', 'Te escuchamos, te entendemos y te ayudamos'),
(381, 95, '_promesas_list_3_text', 'field_5ef16cc914c8b'),
(382, 96, '_wp_attached_file', '2020/06/logo.png'),
(383, 96, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:376;s:6:\"height\";i:154;s:4:\"file\";s:16:\"2020/06/logo.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"logo-300x123.png\";s:5:\"width\";i:300;s:6:\"height\";i:123;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"logo-300x154.png\";s:5:\"width\";i:300;s:6:\"height\";i:154;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:16:\"logo-300x154.png\";s:5:\"width\";i:300;s:6:\"height\";i:154;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:14:\"logo-64x26.png\";s:5:\"width\";i:64;s:6:\"height\";i:26;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(384, 97, '_wp_attached_file', '2020/06/social-media.png'),
(385, 97, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:24:\"2020/06/social-media.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(386, 98, '_wp_attached_file', '2020/06/social-media-1.png'),
(387, 98, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:26:\"2020/06/social-media-1.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(388, 99, '_wp_attached_file', '2020/06/social-media-6.png'),
(389, 99, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:26:\"2020/06/social-media-6.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(390, 100, '_wp_attached_file', '2020/06/social-media-8.png'),
(391, 100, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:26:\"2020/06/social-media-8.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(419, 104, '_menu_item_type', 'custom'),
(420, 104, '_menu_item_menu_item_parent', '0'),
(421, 104, '_menu_item_object_id', '104'),
(422, 104, '_menu_item_object', 'custom'),
(423, 104, '_menu_item_target', ''),
(424, 104, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(425, 104, '_menu_item_xfn', ''),
(426, 104, '_menu_item_url', '#'),
(428, 8, 'products_featureds_0_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #CCFF00 100%) 0% 0% no-repeat padding-box;'),
(429, 8, '_products_featureds_0_background_banner', 'field_5ef21fc8e30de'),
(430, 8, 'products_featureds_1_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #27F4CA 100%) 0% 0% no-repeat padding-box;'),
(431, 8, '_products_featureds_1_background_banner', 'field_5ef21fc8e30de'),
(432, 8, 'products_featureds_2_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #CCFF00 100%) 0% 0% no-repeat padding-box;'),
(433, 8, '_products_featureds_2_background_banner', 'field_5ef21fc8e30de'),
(434, 8, 'products_featureds_3_background_banner', ''),
(435, 8, '_products_featureds_3_background_banner', 'field_5ef21fc8e30de'),
(436, 106, 'init_img', '82'),
(437, 106, '_init_img', 'field_5ef16aa914c71'),
(438, 106, 'init-first-title', 'NUNCA FUE TAN '),
(439, 106, '_init-first-title', 'field_5ef16ab014c72'),
(440, 106, 'init-title-list_0_text', 'APASIONANTE'),
(441, 106, '_init-title-list_0_text', 'field_5ef16acb14c74'),
(442, 106, 'init-title-list_1_text', 'SENCILLO'),
(443, 106, '_init-title-list_1_text', 'field_5ef16acb14c74'),
(444, 106, 'init-title-list_2_text', 'COOL'),
(445, 106, '_init-title-list_2_text', 'field_5ef16acb14c74'),
(446, 106, 'init-title-list', '3'),
(447, 106, '_init-title-list', 'field_5ef16abd14c73'),
(448, 106, 'init-subtitle', 'COMPRAR UNA MOTO'),
(449, 106, '_init-subtitle', 'field_5ef16ad514c75'),
(450, 106, 'init-first-botton-link', '#'),
(451, 106, '_init-first-botton-link', 'field_5ef16ae114c76'),
(452, 106, 'init-first-botton-text', 'Averigua más'),
(453, 106, '_init-first-botton-text', 'field_5ef16aed14c77'),
(454, 106, 'init-second-botton-link', '#'),
(455, 106, '_init-second-botton-link', 'field_5ef16af714c78'),
(456, 106, 'init-second-botton-text', 'Ir a la tienda'),
(457, 106, '_init-second-botton-text', 'field_5ef16b0014c79'),
(458, 106, 'banner_0_img', '85'),
(459, 106, '_banner_0_img', 'field_5ef16b1f14c7b'),
(460, 106, 'banner_1_img', '85'),
(461, 106, '_banner_1_img', 'field_5ef16b1f14c7b'),
(462, 106, 'banner_2_img', '85'),
(463, 106, '_banner_2_img', 'field_5ef16b1f14c7b'),
(464, 106, 'banner', '3'),
(465, 106, '_banner', 'field_5ef16b0a14c7a'),
(466, 106, 'title_estilos', '¿CUAL ES TU ESTILO?'),
(467, 106, '_title_estilos', 'field_5ef16b2814c7c'),
(468, 106, 'banner_publicitario_0_img', '83'),
(469, 106, '_banner_publicitario_0_img', 'field_5ef16b4c14c7e'),
(470, 106, 'banner_publicitario_1_img', '83'),
(471, 106, '_banner_publicitario_1_img', 'field_5ef16b4c14c7e'),
(472, 106, 'banner_publicitario', '2'),
(473, 106, '_banner_publicitario', 'field_5ef16b3714c7d'),
(474, 106, 'title_marcas', '¿CUAL ES TU MARCA DE MOTO FAVORITA?'),
(475, 106, '_title_marcas', 'field_5ef16b5514c7f'),
(476, 106, 'title_destacados', 'LOS MODELOS MÁS TOP'),
(477, 106, '_title_destacados', 'field_5ef16b6714c80'),
(478, 106, 'products_featureds_0_banner_solid', ''),
(479, 106, '_products_featureds_0_banner_solid', 'field_5ef16b8814c82'),
(480, 106, 'products_featureds_0_id', '93'),
(481, 106, '_products_featureds_0_id', 'field_5ef16b9214c83'),
(482, 106, 'products_featureds', '4'),
(483, 106, '_products_featureds', 'field_5ef16b7614c81'),
(484, 106, 'banner_publicitario_num_one', '84'),
(485, 106, '_banner_publicitario_num_one', 'field_5ef16ba114c84'),
(486, 106, 'descuentos_title', 'DESCUENTOS ALMANGO'),
(487, 106, '_descuentos_title', 'field_5ef16c8814c85'),
(488, 106, 'descuentos_subtitle', 'Disfruta de nuestros mejores cupones aquí'),
(489, 106, '_descuentos_subtitle', 'field_5ef16c9714c86'),
(490, 106, 'prometemos_title', 'TE PROMETEMOS'),
(491, 106, '_prometemos_title', 'field_5ef16c9e14c87'),
(492, 106, 'promesas_list', '4'),
(493, 106, '_promesas_list', 'field_5ef16caa14c88'),
(494, 106, 'aceptamos_title', 'Aceptamos DEPOSITOS , TRANSFERENCIAS, tarjetas de Crédito y Débito.'),
(495, 106, '_aceptamos_title', 'field_5ef16cd214c8c'),
(496, 106, 'products_featureds_1_banner_solid', ''),
(497, 106, '_products_featureds_1_banner_solid', 'field_5ef16b8814c82'),
(498, 106, 'products_featureds_1_id', '93'),
(499, 106, '_products_featureds_1_id', 'field_5ef16b9214c83'),
(500, 106, 'products_featureds_2_banner_solid', ''),
(501, 106, '_products_featureds_2_banner_solid', 'field_5ef16b8814c82'),
(502, 106, 'products_featureds_2_id', '93'),
(503, 106, '_products_featureds_2_id', 'field_5ef16b9214c83'),
(504, 106, 'products_featureds_3_banner_solid', '85'),
(505, 106, '_products_featureds_3_banner_solid', 'field_5ef16b8814c82'),
(506, 106, 'products_featureds_3_id', ''),
(507, 106, '_products_featureds_3_id', 'field_5ef16b9214c83'),
(508, 106, 'promesas_list_0_imagen', '89'),
(509, 106, '_promesas_list_0_imagen', 'field_5ef16cbb14c89'),
(510, 106, 'promesas_list_0_title', 'Precio justo'),
(511, 106, '_promesas_list_0_title', 'field_5ef16cc414c8a'),
(512, 106, 'promesas_list_0_text', 'Valoramos tu inversión'),
(513, 106, '_promesas_list_0_text', 'field_5ef16cc914c8b'),
(514, 106, 'promesas_list_1_imagen', '88'),
(515, 106, '_promesas_list_1_imagen', 'field_5ef16cbb14c89'),
(516, 106, 'promesas_list_1_title', 'Envíos nacionales'),
(517, 106, '_promesas_list_1_title', 'field_5ef16cc414c8a'),
(518, 106, 'promesas_list_1_text', 'Entrega en puntos céntricos de cada ciudad'),
(519, 106, '_promesas_list_1_text', 'field_5ef16cc914c8b'),
(520, 106, 'promesas_list_2_imagen', '87'),
(521, 106, '_promesas_list_2_imagen', 'field_5ef16cbb14c89'),
(522, 106, 'promesas_list_2_title', 'Compra con confianza'),
(523, 106, '_promesas_list_2_title', 'field_5ef16cc414c8a'),
(524, 106, 'promesas_list_2_text', 'Seguridad garantizada en cada transacción'),
(525, 106, '_promesas_list_2_text', 'field_5ef16cc914c8b'),
(526, 106, 'promesas_list_3_imagen', '86'),
(527, 106, '_promesas_list_3_imagen', 'field_5ef16cbb14c89'),
(528, 106, 'promesas_list_3_title', 'Nuestras 3T'),
(529, 106, '_promesas_list_3_title', 'field_5ef16cc414c8a'),
(530, 106, 'promesas_list_3_text', 'Te escuchamos, te entendemos y te ayudamos'),
(531, 106, '_promesas_list_3_text', 'field_5ef16cc914c8b'),
(532, 106, 'products_featureds_0_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #CCFF00 100%) 0% 0% no-repeat padding-box;'),
(533, 106, '_products_featureds_0_background_banner', 'field_5ef21fc8e30de'),
(534, 106, 'products_featureds_1_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #27F4CA 100%) 0% 0% no-repeat padding-box;'),
(535, 106, '_products_featureds_1_background_banner', 'field_5ef21fc8e30de'),
(536, 106, 'products_featureds_2_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #CCFF00 100%) 0% 0% no-repeat padding-box;'),
(537, 106, '_products_featureds_2_background_banner', 'field_5ef21fc8e30de'),
(538, 106, 'products_featureds_3_background_banner', ''),
(539, 106, '_products_featureds_3_background_banner', 'field_5ef21fc8e30de'),
(540, 5, '_config_errors', 'a:1:{s:23:\"mail.additional_headers\";a:1:{i:0;a:2:{s:4:\"code\";i:102;s:4:\"args\";a:3:{s:7:\"message\";s:51:\"Invalid mailbox syntax is used in the %name% field.\";s:6:\"params\";a:1:{s:4:\"name\";s:8:\"Reply-To\";}s:4:\"link\";s:68:\"https://contactform7.com/configuration-errors/invalid-mailbox-syntax\";}}}}'),
(541, 107, '_edit_last', '1'),
(542, 107, '_edit_lock', '1592940533:1'),
(543, 113, '_edit_last', '1'),
(544, 113, '_edit_lock', '1593202032:1'),
(545, 115, '_edit_last', '1'),
(546, 115, '_edit_lock', '1593565485:1'),
(547, 115, '_wp_page_template', 'templates/template-brands.php'),
(548, 115, '_yoast_wpseo_content_score', '30'),
(549, 93, '_wc_facebook_sync_enabled', 'no'),
(550, 117, '_edit_last', '1'),
(551, 117, '_edit_lock', '1593208194:1'),
(552, 125, '_wp_attached_file', '2020/06/bujia-png-2.png'),
(553, 125, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:183;s:6:\"height\";i:114;s:4:\"file\";s:23:\"2020/06/bujia-png-2.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"bujia-png-2-150x114.png\";s:5:\"width\";i:150;s:6:\"height\";i:114;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:23:\"bujia-png-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:23:\"bujia-png-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:21:\"bujia-png-2-64x40.png\";s:5:\"width\";i:64;s:6:\"height\";i:40;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(554, 126, '_wp_attached_file', '2020/06/harley-davidson-4129835_1920.png'),
(555, 126, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1276;s:4:\"file\";s:40:\"2020/06/harley-davidson-4129835_1920.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-300x199.png\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-768x510.png\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:41:\"harley-davidson-4129835_1920-1024x681.png\";s:5:\"width\";i:1024;s:6:\"height\";i:681;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-600x399.png\";s:5:\"width\";i:600;s:6:\"height\";i:399;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-600x399.png\";s:5:\"width\";i:600;s:6:\"height\";i:399;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:40:\"harley-davidson-4129835_1920-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:38:\"harley-davidson-4129835_1920-64x43.png\";s:5:\"width\";i:64;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(556, 127, '_wp_attached_file', '2020/06/motorcycle-2268518_1920.png'),
(557, 127, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:35:\"2020/06/motorcycle-2268518_1920.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-768x512.png\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:36:\"motorcycle-2268518_1920-1024x683.png\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:35:\"motorcycle-2268518_1920-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:33:\"motorcycle-2268518_1920-64x43.png\";s:5:\"width\";i:64;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(558, 115, '_thumbnail_id', '126'),
(559, 115, 'marca', 'a:1:{i:0;s:2:\"25\";}'),
(560, 115, '_marca', 'field_5ef656588e0e7'),
(561, 115, 'resumen', 'Bajaj Pulsar es una marca india de motocicletas, propiedad de Bajaj Auto. La moto fue creada por Bajaj Auto en sociedad con Tokyo R&amp;D y posteriormente con el diseñador de motocicletas Glynn Kerr. A la fecha existen 5 variantes disponibles, con motores de 135 c.c, 150 c.c, 180 c.c, 200 c.c, y 220 c.c.'),
(562, 115, '_resumen', 'field_5ef656748e0e8'),
(563, 115, 'imagesswiper_0_img', '125'),
(564, 115, '_imagesswiper_0_img', 'field_5ef6568d8e0ea'),
(565, 115, 'imagesswiper_1_img', '125'),
(566, 115, '_imagesswiper_1_img', 'field_5ef6568d8e0ea'),
(567, 115, 'imagesswiper_2_img', '125'),
(568, 115, '_imagesswiper_2_img', 'field_5ef6568d8e0ea'),
(569, 115, 'imagesswiper', '3'),
(570, 115, '_imagesswiper', 'field_5ef6567e8e0e9'),
(571, 115, 'motos_0_id', '93'),
(572, 115, '_motos_0_id', 'field_5ef6572872cc7'),
(573, 115, 'motos', '4'),
(574, 115, '_motos', 'field_5ef6571a72cc6'),
(575, 115, 'banner-lineal', '85'),
(576, 115, '_banner-lineal', 'field_5ef6576dea90f'),
(577, 128, 'marca', 'a:1:{i:0;s:2:\"25\";}'),
(578, 128, '_marca', 'field_5ef656588e0e7'),
(579, 128, 'resumen', 'Bajaj Pulsar es una marca india de motocicletas, propiedad de Bajaj Auto. La moto fue creada por Bajaj Auto en sociedad con Tokyo R&amp;D y posteriormente con el diseñador de motocicletas Glynn Kerr. A la fecha existen 5 variantes disponibles, con motores de 135 c.c, 150 c.c, 180 c.c, 200 c.c, y 220 c.c.'),
(580, 128, '_resumen', 'field_5ef656748e0e8'),
(581, 128, 'imagesswiper_0_img', '125'),
(582, 128, '_imagesswiper_0_img', 'field_5ef6568d8e0ea'),
(583, 128, 'imagesswiper_1_img', '125'),
(584, 128, '_imagesswiper_1_img', 'field_5ef6568d8e0ea'),
(585, 128, 'imagesswiper_2_img', '125'),
(586, 128, '_imagesswiper_2_img', 'field_5ef6568d8e0ea'),
(587, 128, 'imagesswiper', '3'),
(588, 128, '_imagesswiper', 'field_5ef6567e8e0e9'),
(589, 128, 'motos_0_id', '93'),
(590, 128, '_motos_0_id', 'field_5ef6572872cc7'),
(591, 128, 'motos', '1'),
(592, 128, '_motos', 'field_5ef6571a72cc6'),
(593, 128, 'banner-lineal', '85'),
(594, 128, '_banner-lineal', 'field_5ef6576dea90f'),
(595, 115, 'motos_1_id', '93'),
(596, 115, '_motos_1_id', 'field_5ef6572872cc7'),
(597, 115, 'motos_2_id', '93'),
(598, 115, '_motos_2_id', 'field_5ef6572872cc7'),
(599, 115, 'motos_3_id', '93'),
(600, 115, '_motos_3_id', 'field_5ef6572872cc7'),
(601, 129, 'marca', 'a:1:{i:0;s:2:\"25\";}'),
(602, 129, '_marca', 'field_5ef656588e0e7'),
(603, 129, 'resumen', 'Bajaj Pulsar es una marca india de motocicletas, propiedad de Bajaj Auto. La moto fue creada por Bajaj Auto en sociedad con Tokyo R&amp;D y posteriormente con el diseñador de motocicletas Glynn Kerr. A la fecha existen 5 variantes disponibles, con motores de 135 c.c, 150 c.c, 180 c.c, 200 c.c, y 220 c.c.'),
(604, 129, '_resumen', 'field_5ef656748e0e8'),
(605, 129, 'imagesswiper_0_img', '125'),
(606, 129, '_imagesswiper_0_img', 'field_5ef6568d8e0ea'),
(607, 129, 'imagesswiper_1_img', '125'),
(608, 129, '_imagesswiper_1_img', 'field_5ef6568d8e0ea'),
(609, 129, 'imagesswiper_2_img', '125'),
(610, 129, '_imagesswiper_2_img', 'field_5ef6568d8e0ea'),
(611, 129, 'imagesswiper', '3'),
(612, 129, '_imagesswiper', 'field_5ef6567e8e0e9'),
(613, 129, 'motos_0_id', '93'),
(614, 129, '_motos_0_id', 'field_5ef6572872cc7'),
(615, 129, 'motos', '4'),
(616, 129, '_motos', 'field_5ef6571a72cc6'),
(617, 129, 'banner-lineal', '85'),
(618, 129, '_banner-lineal', 'field_5ef6576dea90f'),
(619, 129, 'motos_1_id', '93'),
(620, 129, '_motos_1_id', 'field_5ef6572872cc7'),
(621, 129, 'motos_2_id', '93'),
(622, 129, '_motos_2_id', 'field_5ef6572872cc7'),
(623, 129, 'motos_3_id', '93'),
(624, 129, '_motos_3_id', 'field_5ef6572872cc7'),
(625, 130, '_edit_last', '1'),
(626, 130, '_edit_lock', '1593643651:1'),
(627, 93, 'imagen_banner', '127'),
(628, 93, '_imagen_banner', 'field_5ef6643f7827f'),
(629, 93, 'modelo', 'Modelo 2020'),
(630, 93, '_modelo', 'field_5ef66e17d812b'),
(631, 133, '_edit_last', '1'),
(632, 133, '_edit_lock', '1593208326:1'),
(633, 93, '_product_attributes', 'a:3:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"0\";s:10:\"is_visible\";s:1:\"1\";s:12:\"is_variation\";s:1:\"0\";s:11:\"is_taxonomy\";s:1:\"1\";}s:13:\"pa_cilindrada\";a:6:{s:4:\"name\";s:13:\"pa_cilindrada\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"1\";s:10:\"is_visible\";s:1:\"1\";s:12:\"is_variation\";s:1:\"0\";s:11:\"is_taxonomy\";s:1:\"1\";}s:11:\"pa_posicion\";a:6:{s:4:\"name\";s:11:\"pa_posicion\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"2\";s:10:\"is_visible\";s:1:\"1\";s:12:\"is_variation\";s:1:\"0\";s:11:\"is_taxonomy\";s:1:\"1\";}}'),
(634, 135, '_menu_item_type', 'post_type'),
(635, 135, '_menu_item_menu_item_parent', '0'),
(636, 135, '_menu_item_object_id', '108'),
(637, 135, '_menu_item_object', 'page'),
(638, 135, '_menu_item_target', ''),
(639, 135, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(640, 135, '_menu_item_xfn', ''),
(641, 135, '_menu_item_url', ''),
(643, 136, '_menu_item_type', 'post_type'),
(644, 136, '_menu_item_menu_item_parent', '0'),
(645, 136, '_menu_item_object_id', '8'),
(646, 136, '_menu_item_object', 'page'),
(647, 136, '_menu_item_target', ''),
(648, 136, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(649, 136, '_menu_item_xfn', ''),
(650, 136, '_menu_item_url', ''),
(652, 108, '_edit_lock', '1595281608:1'),
(653, 108, '_edit_last', '1'),
(654, 108, '_yoast_wpseo_content_score', '30'),
(657, 139, '_regular_price', '60015'),
(658, 139, '_sale_price', '58000'),
(659, 139, 'total_sales', '0'),
(660, 139, '_tax_status', 'taxable'),
(661, 139, '_tax_class', ''),
(662, 139, '_manage_stock', 'no'),
(663, 139, '_backorders', 'no'),
(664, 139, '_sold_individually', 'no'),
(665, 139, '_virtual', 'no'),
(666, 139, '_downloadable', 'no'),
(667, 139, '_download_limit', '-1'),
(668, 139, '_download_expiry', '-1'),
(669, 139, '_thumbnail_id', '317'),
(670, 139, '_stock', NULL),
(671, 139, '_stock_status', 'instock'),
(672, 139, '_wc_average_rating', '0'),
(673, 139, '_wc_review_count', '0'),
(674, 139, '_product_attributes', 'a:3:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"0\";s:10:\"is_visible\";s:1:\"1\";s:12:\"is_variation\";s:1:\"0\";s:11:\"is_taxonomy\";s:1:\"1\";}s:13:\"pa_cilindrada\";a:6:{s:4:\"name\";s:13:\"pa_cilindrada\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"1\";s:10:\"is_visible\";s:1:\"1\";s:12:\"is_variation\";s:1:\"0\";s:11:\"is_taxonomy\";s:1:\"1\";}s:11:\"pa_posicion\";a:6:{s:4:\"name\";s:11:\"pa_posicion\";s:5:\"value\";s:0:\"\";s:8:\"position\";s:1:\"2\";s:10:\"is_visible\";s:1:\"1\";s:12:\"is_variation\";s:1:\"0\";s:11:\"is_taxonomy\";s:1:\"1\";}}'),
(675, 139, '_product_version', '3.7.1'),
(676, 139, '_price', '58000'),
(677, 139, '_yoast_wpseo_primary_product_cat', '15'),
(678, 139, '_yoast_wpseo_content_score', '60'),
(679, 139, '_wc_facebook_sync_enabled', 'no'),
(680, 139, 'imagen_banner', '127'),
(681, 139, '_imagen_banner', 'field_5ef6643f7827f'),
(682, 139, 'modelo', 'Modelo 2020'),
(683, 139, '_modelo', 'field_5ef66e17d812b'),
(684, 139, '_edit_lock', '1594793020:1'),
(685, 139, '_edit_last', '1'),
(686, 140, '_edit_lock', '1593213116:1'),
(687, 140, '_wp_trash_meta_status', 'publish'),
(688, 140, '_wp_trash_meta_time', '1593213134'),
(689, 141, '_edit_last', '1'),
(690, 141, '_edit_lock', '1593225863:1'),
(691, 143, '_wp_attached_file', '2020/06/hechado-adelante.png'),
(692, 143, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:38;s:4:\"file\";s:28:\"2020/06/hechado-adelante.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(693, 144, '_wp_attached_file', '2020/06/normal.png'),
(694, 144, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:44;s:6:\"height\";i:45;s:4:\"file\";s:18:\"2020/06/normal.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(695, 145, '_wp_attached_file', '2020/06/hechado-adelante-normal.png'),
(696, 145, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:49;s:6:\"height\";i:42;s:4:\"file\";s:35:\"2020/06/hechado-adelante-normal.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(697, 151, '_wp_attached_file', '2020/06/WhatsApp-Image-2020-05-25-at-15.11.18.png'),
(698, 151, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:796;s:4:\"file\";s:49:\"2020/06/WhatsApp-Image-2020-05-25-at-15.11.18.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-300x124.png\";s:5:\"width\";i:300;s:6:\"height\";i:124;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-768x318.png\";s:5:\"width\";i:768;s:6:\"height\";i:318;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:50:\"WhatsApp-Image-2020-05-25-at-15.11.18-1024x425.png\";s:5:\"width\";i:1024;s:6:\"height\";i:425;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-300x124.png\";s:5:\"width\";i:300;s:6:\"height\";i:124;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-600x249.png\";s:5:\"width\";i:600;s:6:\"height\";i:249;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-300x124.png\";s:5:\"width\";i:300;s:6:\"height\";i:124;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-600x249.png\";s:5:\"width\";i:600;s:6:\"height\";i:249;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:49:\"WhatsApp-Image-2020-05-25-at-15.11.18-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:47:\"WhatsApp-Image-2020-05-25-at-15.11.18-64x27.png\";s:5:\"width\";i:64;s:6:\"height\";i:27;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(699, 152, '_wp_attached_file', '2020/06/comercio.png'),
(700, 152, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:60;s:6:\"height\";i:60;s:4:\"file\";s:20:\"2020/06/comercio.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(701, 153, '_wp_attached_file', '2020/06/seguridad.png'),
(702, 153, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:60;s:6:\"height\";i:60;s:4:\"file\";s:21:\"2020/06/seguridad.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(703, 154, '_wp_attached_file', '2020/06/44265.png'),
(704, 154, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:60;s:6:\"height\";i:60;s:4:\"file\";s:17:\"2020/06/44265.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(705, 155, '_wp_attached_file', '2020/06/bloquear.png'),
(706, 155, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:60;s:6:\"height\";i:60;s:4:\"file\";s:20:\"2020/06/bloquear.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(707, 156, '_wp_attached_file', '2020/06/bolsa-de-la-compra-1.png'),
(708, 156, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:60;s:6:\"height\";i:60;s:4:\"file\";s:32:\"2020/06/bolsa-de-la-compra-1.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(709, 93, 'imagen_background', '151'),
(710, 93, '_imagen_background', 'field_5ef6a809454b6'),
(711, 93, 'presents_0_imagen', '152'),
(712, 93, '_presents_0_imagen', 'field_5ef6a822454b8'),
(713, 93, 'presents_0_text', 'Cupones'),
(714, 93, '_presents_0_text', 'field_5ef6a82a454b9'),
(715, 93, 'presents_1_imagen', '153'),
(716, 93, '_presents_1_imagen', 'field_5ef6a822454b8'),
(717, 93, 'presents_1_text', 'Casco'),
(718, 93, '_presents_1_text', 'field_5ef6a82a454b9'),
(719, 93, 'presents_2_imagen', '154'),
(720, 93, '_presents_2_imagen', 'field_5ef6a822454b8'),
(721, 93, 'presents_2_text', 'Delivery Gratis'),
(722, 93, '_presents_2_text', 'field_5ef6a82a454b9'),
(723, 93, 'presents_3_imagen', '155'),
(724, 93, '_presents_3_imagen', 'field_5ef6a822454b8'),
(725, 93, 'presents_3_text', 'Seguridad'),
(726, 93, '_presents_3_text', 'field_5ef6a82a454b9'),
(727, 93, 'presents_4_imagen', '156'),
(728, 93, '_presents_4_imagen', 'field_5ef6a822454b8'),
(729, 93, 'presents_4_text', 'MERCHADISING'),
(730, 93, '_presents_4_text', 'field_5ef6a82a454b9'),
(731, 93, 'presents', '5'),
(732, 93, '_presents', 'field_5ef6a812454b7'),
(733, 93, 'resumen', 'Para aquellos incurables amantes de las motocicletas de velocidad, está aquí la nueva Pulsar NS200 FI, una deportiva de profunda agilidad y destrezas con un sistema capaz de optimizar hasta la última pizca de combustible. Prepárate para vivir intensas revoluciones por minuto.'),
(734, 93, '_resumen', 'field_5ef6a832454ba'),
(735, 139, 'imagen_background', '151'),
(736, 139, '_imagen_background', 'field_5ef6a809454b6'),
(737, 139, 'presents_0_imagen', '153'),
(738, 139, '_presents_0_imagen', 'field_5ef6a822454b8'),
(739, 139, 'presents_0_text', 'Casco'),
(740, 139, '_presents_0_text', 'field_5ef6a82a454b9'),
(741, 139, 'presents_1_imagen', '154'),
(742, 139, '_presents_1_imagen', 'field_5ef6a822454b8'),
(743, 139, 'presents_1_text', 'Delivery Gratis'),
(744, 139, '_presents_1_text', 'field_5ef6a82a454b9'),
(745, 139, 'presents', '2'),
(746, 139, '_presents', 'field_5ef6a812454b7'),
(747, 139, 'resumen', 'Para aquellos incurables amantes de las motocicletas de velocidad, está aquí la nueva Pulsar NS200 FI, una deportiva de profunda agilidad y destrezas con un sistema capaz de optimizar hasta la última pizca de combustible. Prepárate para vivir intensas revoluciones por minuto.'),
(748, 139, '_resumen', 'field_5ef6a832454ba'),
(749, 8, 'banner_publicitario_2_img', '83'),
(750, 8, '_banner_publicitario_2_img', 'field_5ef16b4c14c7e'),
(751, 157, 'init_img', '82'),
(752, 157, '_init_img', 'field_5ef16aa914c71'),
(753, 157, 'init-first-title', 'NUNCA FUE TAN '),
(754, 157, '_init-first-title', 'field_5ef16ab014c72'),
(755, 157, 'init-title-list_0_text', 'APASIONANTE'),
(756, 157, '_init-title-list_0_text', 'field_5ef16acb14c74'),
(757, 157, 'init-title-list_1_text', 'SENCILLO'),
(758, 157, '_init-title-list_1_text', 'field_5ef16acb14c74'),
(759, 157, 'init-title-list_2_text', 'COOL'),
(760, 157, '_init-title-list_2_text', 'field_5ef16acb14c74'),
(761, 157, 'init-title-list', '3'),
(762, 157, '_init-title-list', 'field_5ef16abd14c73'),
(763, 157, 'init-subtitle', 'COMPRAR UNA MOTO'),
(764, 157, '_init-subtitle', 'field_5ef16ad514c75'),
(765, 157, 'init-first-botton-link', '#'),
(766, 157, '_init-first-botton-link', 'field_5ef16ae114c76'),
(767, 157, 'init-first-botton-text', 'Averigua más'),
(768, 157, '_init-first-botton-text', 'field_5ef16aed14c77'),
(769, 157, 'init-second-botton-link', '#'),
(770, 157, '_init-second-botton-link', 'field_5ef16af714c78'),
(771, 157, 'init-second-botton-text', 'Ir a la tienda'),
(772, 157, '_init-second-botton-text', 'field_5ef16b0014c79'),
(773, 157, 'banner_0_img', '85'),
(774, 157, '_banner_0_img', 'field_5ef16b1f14c7b'),
(775, 157, 'banner_1_img', '85'),
(776, 157, '_banner_1_img', 'field_5ef16b1f14c7b'),
(777, 157, 'banner_2_img', '85'),
(778, 157, '_banner_2_img', 'field_5ef16b1f14c7b'),
(779, 157, 'banner', '3'),
(780, 157, '_banner', 'field_5ef16b0a14c7a'),
(781, 157, 'title_estilos', '¿CUAL ES TU ESTILO?'),
(782, 157, '_title_estilos', 'field_5ef16b2814c7c'),
(783, 157, 'banner_publicitario_0_img', '83'),
(784, 157, '_banner_publicitario_0_img', 'field_5ef16b4c14c7e'),
(785, 157, 'banner_publicitario_1_img', '83'),
(786, 157, '_banner_publicitario_1_img', 'field_5ef16b4c14c7e'),
(787, 157, 'banner_publicitario', '3'),
(788, 157, '_banner_publicitario', 'field_5ef16b3714c7d'),
(789, 157, 'title_marcas', '¿CUAL ES TU MARCA DE MOTO FAVORITA?'),
(790, 157, '_title_marcas', 'field_5ef16b5514c7f'),
(791, 157, 'title_destacados', 'LOS MODELOS MÁS TOP'),
(792, 157, '_title_destacados', 'field_5ef16b6714c80'),
(793, 157, 'products_featureds_0_banner_solid', ''),
(794, 157, '_products_featureds_0_banner_solid', 'field_5ef16b8814c82'),
(795, 157, 'products_featureds_0_id', '93'),
(796, 157, '_products_featureds_0_id', 'field_5ef16b9214c83'),
(797, 157, 'products_featureds', '4'),
(798, 157, '_products_featureds', 'field_5ef16b7614c81'),
(799, 157, 'banner_publicitario_num_one', '84'),
(800, 157, '_banner_publicitario_num_one', 'field_5ef16ba114c84'),
(801, 157, 'descuentos_title', 'DESCUENTOS ALMANGO'),
(802, 157, '_descuentos_title', 'field_5ef16c8814c85'),
(803, 157, 'descuentos_subtitle', 'Disfruta de nuestros mejores cupones aquí'),
(804, 157, '_descuentos_subtitle', 'field_5ef16c9714c86'),
(805, 157, 'prometemos_title', 'TE PROMETEMOS'),
(806, 157, '_prometemos_title', 'field_5ef16c9e14c87'),
(807, 157, 'promesas_list', '4'),
(808, 157, '_promesas_list', 'field_5ef16caa14c88'),
(809, 157, 'aceptamos_title', 'Aceptamos DEPOSITOS , TRANSFERENCIAS, tarjetas de Crédito y Débito.'),
(810, 157, '_aceptamos_title', 'field_5ef16cd214c8c'),
(811, 157, 'products_featureds_1_banner_solid', ''),
(812, 157, '_products_featureds_1_banner_solid', 'field_5ef16b8814c82'),
(813, 157, 'products_featureds_1_id', '93'),
(814, 157, '_products_featureds_1_id', 'field_5ef16b9214c83'),
(815, 157, 'products_featureds_2_banner_solid', ''),
(816, 157, '_products_featureds_2_banner_solid', 'field_5ef16b8814c82'),
(817, 157, 'products_featureds_2_id', '93'),
(818, 157, '_products_featureds_2_id', 'field_5ef16b9214c83'),
(819, 157, 'products_featureds_3_banner_solid', '85'),
(820, 157, '_products_featureds_3_banner_solid', 'field_5ef16b8814c82'),
(821, 157, 'products_featureds_3_id', ''),
(822, 157, '_products_featureds_3_id', 'field_5ef16b9214c83'),
(823, 157, 'promesas_list_0_imagen', '89'),
(824, 157, '_promesas_list_0_imagen', 'field_5ef16cbb14c89'),
(825, 157, 'promesas_list_0_title', 'Precio justo'),
(826, 157, '_promesas_list_0_title', 'field_5ef16cc414c8a'),
(827, 157, 'promesas_list_0_text', 'Valoramos tu inversión'),
(828, 157, '_promesas_list_0_text', 'field_5ef16cc914c8b'),
(829, 157, 'promesas_list_1_imagen', '88');
INSERT INTO `al_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(830, 157, '_promesas_list_1_imagen', 'field_5ef16cbb14c89'),
(831, 157, 'promesas_list_1_title', 'Envíos nacionales'),
(832, 157, '_promesas_list_1_title', 'field_5ef16cc414c8a'),
(833, 157, 'promesas_list_1_text', 'Entrega en puntos céntricos de cada ciudad'),
(834, 157, '_promesas_list_1_text', 'field_5ef16cc914c8b'),
(835, 157, 'promesas_list_2_imagen', '87'),
(836, 157, '_promesas_list_2_imagen', 'field_5ef16cbb14c89'),
(837, 157, 'promesas_list_2_title', 'Compra con confianza'),
(838, 157, '_promesas_list_2_title', 'field_5ef16cc414c8a'),
(839, 157, 'promesas_list_2_text', 'Seguridad garantizada en cada transacción'),
(840, 157, '_promesas_list_2_text', 'field_5ef16cc914c8b'),
(841, 157, 'promesas_list_3_imagen', '86'),
(842, 157, '_promesas_list_3_imagen', 'field_5ef16cbb14c89'),
(843, 157, 'promesas_list_3_title', 'Nuestras 3T'),
(844, 157, '_promesas_list_3_title', 'field_5ef16cc414c8a'),
(845, 157, 'promesas_list_3_text', 'Te escuchamos, te entendemos y te ayudamos'),
(846, 157, '_promesas_list_3_text', 'field_5ef16cc914c8b'),
(847, 157, 'products_featureds_0_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #CCFF00 100%) 0% 0% no-repeat padding-box;'),
(848, 157, '_products_featureds_0_background_banner', 'field_5ef21fc8e30de'),
(849, 157, 'products_featureds_1_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #27F4CA 100%) 0% 0% no-repeat padding-box;'),
(850, 157, '_products_featureds_1_background_banner', 'field_5ef21fc8e30de'),
(851, 157, 'products_featureds_2_background_banner', 'transparent linear-gradient(180deg, #00AFE9 0%, #CCFF00 100%) 0% 0% no-repeat padding-box;'),
(852, 157, '_products_featureds_2_background_banner', 'field_5ef21fc8e30de'),
(853, 157, 'products_featureds_3_background_banner', ''),
(854, 157, '_products_featureds_3_background_banner', 'field_5ef21fc8e30de'),
(855, 157, 'banner_publicitario_2_img', '83'),
(856, 157, '_banner_publicitario_2_img', 'field_5ef16b4c14c7e'),
(859, 160, '_wp_attached_file', '2020/07/13.png'),
(860, 160, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:885;s:6:\"height\";i:583;s:4:\"file\";s:14:\"2020/07/13.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"13-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"13-300x198.png\";s:5:\"width\";i:300;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:14:\"13-768x506.png\";s:5:\"width\";i:768;s:6:\"height\";i:506;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:14:\"13-300x198.png\";s:5:\"width\";i:300;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:14:\"13-600x395.png\";s:5:\"width\";i:600;s:6:\"height\";i:395;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:14:\"13-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:14:\"13-300x198.png\";s:5:\"width\";i:300;s:6:\"height\";i:198;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:14:\"13-600x395.png\";s:5:\"width\";i:600;s:6:\"height\";i:395;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:14:\"13-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:12:\"13-64x42.png\";s:5:\"width\";i:64;s:6:\"height\";i:42;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(861, 161, '_wp_attached_file', '2020/07/IMG_0160.png'),
(862, 161, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:846;s:6:\"height\";i:564;s:4:\"file\";s:20:\"2020/07/IMG_0160.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_0160-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_0160-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"IMG_0160-768x512.png\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"IMG_0160-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"IMG_0160-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_0160-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"IMG_0160-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:20:\"IMG_0160-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_0160-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:18:\"IMG_0160-64x43.png\";s:5:\"width\";i:64;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(863, 162, '_wp_attached_file', '2020/07/IMG_9791.png'),
(864, 162, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:770;s:6:\"height\";i:1147;s:4:\"file\";s:20:\"2020/07/IMG_9791.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9791-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_9791-201x300.png\";s:5:\"width\";i:201;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"IMG_9791-768x1144.png\";s:5:\"width\";i:768;s:6:\"height\";i:1144;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_9791-687x1024.png\";s:5:\"width\";i:687;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"IMG_9791-300x447.png\";s:5:\"width\";i:300;s:6:\"height\";i:447;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"IMG_9791-600x894.png\";s:5:\"width\";i:600;s:6:\"height\";i:894;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9791-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"IMG_9791-300x447.png\";s:5:\"width\";i:300;s:6:\"height\";i:447;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:20:\"IMG_9791-600x894.png\";s:5:\"width\";i:600;s:6:\"height\";i:894;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9791-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:18:\"IMG_9791-64x95.png\";s:5:\"width\";i:64;s:6:\"height\";i:95;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(865, 163, '_wp_attached_file', '2020/07/IMG_9873.png'),
(866, 163, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:754;s:6:\"height\";i:1130;s:4:\"file\";s:20:\"2020/07/IMG_9873.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9873-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_9873-200x300.png\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"IMG_9873-683x1024.png\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"IMG_9873-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"IMG_9873-600x899.png\";s:5:\"width\";i:600;s:6:\"height\";i:899;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9873-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"IMG_9873-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:20:\"IMG_9873-600x899.png\";s:5:\"width\";i:600;s:6:\"height\";i:899;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9873-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:18:\"IMG_9873-64x96.png\";s:5:\"width\";i:64;s:6:\"height\";i:96;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(867, 164, '_wp_attached_file', '2020/07/IMG_9879.png'),
(868, 164, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:862;s:6:\"height\";i:575;s:4:\"file\";s:20:\"2020/07/IMG_9879.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9879-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"IMG_9879-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"IMG_9879-768x512.png\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"IMG_9879-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"IMG_9879-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9879-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"IMG_9879-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:20:\"IMG_9879-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"IMG_9879-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:18:\"IMG_9879-64x43.png\";s:5:\"width\";i:64;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(869, 165, '_wp_attached_file', '2020/07/LEO.png'),
(870, 165, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:765;s:6:\"height\";i:1147;s:4:\"file\";s:15:\"2020/07/LEO.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"LEO-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"LEO-200x300.png\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:16:\"LEO-683x1024.png\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:15:\"LEO-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:15:\"LEO-600x900.png\";s:5:\"width\";i:600;s:6:\"height\";i:900;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:15:\"LEO-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:15:\"LEO-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:15:\"LEO-600x900.png\";s:5:\"width\";i:600;s:6:\"height\";i:900;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:15:\"LEO-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:13:\"LEO-64x96.png\";s:5:\"width\";i:64;s:6:\"height\";i:96;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(871, 166, '_wp_attached_file', '2020/07/02.png'),
(872, 166, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:846;s:6:\"height\";i:564;s:4:\"file\";s:14:\"2020/07/02.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"02-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"02-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:14:\"02-768x512.png\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:14:\"02-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:14:\"02-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:14:\"02-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:14:\"02-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:14:\"02-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:14:\"02-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:12:\"02-64x43.png\";s:5:\"width\";i:64;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(873, 167, '_wp_attached_file', '2020/07/10.png'),
(874, 167, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:752;s:6:\"height\";i:1128;s:4:\"file\";s:14:\"2020/07/10.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"10-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"10-200x300.png\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:15:\"10-683x1024.png\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:14:\"10-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:14:\"10-600x900.png\";s:5:\"width\";i:600;s:6:\"height\";i:900;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:14:\"10-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:14:\"10-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:14:\"10-600x900.png\";s:5:\"width\";i:600;s:6:\"height\";i:900;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:14:\"10-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:12:\"10-64x96.png\";s:5:\"width\";i:64;s:6:\"height\";i:96;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(875, 221, '_edit_last', '1'),
(876, 221, '_edit_lock', '1593586952:1'),
(877, 263, '_edit_last', '1'),
(878, 263, '_edit_lock', '1593588595:1'),
(879, 283, '_wp_attached_file', '2020/06/luz-abs-1.png'),
(880, 283, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:76;s:6:\"height\";i:75;s:4:\"file\";s:21:\"2020/06/luz-abs-1.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:19:\"luz-abs-1-64x63.png\";s:5:\"width\";i:64;s:6:\"height\";i:63;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(881, 284, '_wp_attached_file', '2020/06/motocicleta-2.png'),
(882, 284, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:25:\"2020/06/motocicleta-2.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"motocicleta-2-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(883, 285, '_wp_attached_file', '2020/06/motocicleta-3.png'),
(884, 285, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:77;s:6:\"height\";i:76;s:4:\"file\";s:25:\"2020/06/motocicleta-3.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"motocicleta-3-64x63.png\";s:5:\"width\";i:64;s:6:\"height\";i:63;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(885, 286, '_wp_attached_file', '2020/06/motocicleta-4.png'),
(886, 286, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:25:\"2020/06/motocicleta-4.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"motocicleta-4-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(887, 287, '_wp_attached_file', '2020/06/deportes-de-motor.png'),
(888, 287, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:29:\"2020/06/deportes-de-motor.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:27:\"deportes-de-motor-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(889, 288, '_wp_attached_file', '2020/06/iluminacion.png'),
(890, 288, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:92;s:6:\"height\";i:92;s:4:\"file\";s:23:\"2020/06/iluminacion.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:21:\"iluminacion-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(891, 289, '_wp_attached_file', '2020/06/LEO.png'),
(892, 289, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:765;s:6:\"height\";i:1147;s:4:\"file\";s:15:\"2020/06/LEO.png\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"LEO-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"LEO-200x300.png\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:16:\"LEO-683x1024.png\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:15:\"LEO-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:15:\"LEO-600x900.png\";s:5:\"width\";i:600;s:6:\"height\";i:900;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:15:\"LEO-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:15:\"LEO-300x450.png\";s:5:\"width\";i:300;s:6:\"height\";i:450;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:15:\"LEO-600x900.png\";s:5:\"width\";i:600;s:6:\"height\";i:900;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:15:\"LEO-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:13:\"LEO-64x96.png\";s:5:\"width\";i:64;s:6:\"height\";i:96;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(893, 290, '_wp_attached_file', '2020/06/ns200-amarillo.png'),
(894, 290, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1367;s:6:\"height\";i:911;s:4:\"file\";s:26:\"2020/06/ns200-amarillo.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-768x512.png\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:27:\"ns200-amarillo-1024x682.png\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:26:\"ns200-amarillo-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-600x400.png\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:26:\"ns200-amarillo-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:24:\"ns200-amarillo-64x43.png\";s:5:\"width\";i:64;s:6:\"height\";i:43;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(895, 291, '_wp_attached_file', '2020/06/motocicleta-6.png'),
(896, 291, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:77;s:6:\"height\";i:77;s:4:\"file\";s:25:\"2020/06/motocicleta-6.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"motocicleta-6-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(897, 292, '_wp_attached_file', '2020/06/motocicleta-12.png'),
(898, 292, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:26:\"2020/06/motocicleta-12.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:24:\"motocicleta-12-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(899, 293, '_wp_attached_file', '2020/06/motor-del-coche.png'),
(900, 293, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:27:\"2020/06/motor-del-coche.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:25:\"motor-del-coche-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(901, 294, '_wp_attached_file', '2020/06/motocicleta-5.png'),
(902, 294, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:25:\"2020/06/motocicleta-5.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"motocicleta-5-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(903, 93, 'imagen_parallax', '85'),
(904, 93, '_imagen_parallax', 'field_5efc29021788c'),
(905, 93, 'ventajas_0_icon', '287'),
(906, 93, '_ventajas_0_icon', 'field_5efc2a1917893'),
(907, 93, 'ventajas_0_video', ''),
(908, 93, '_ventajas_0_video', 'field_5efc29f01788e'),
(909, 93, 'ventajas_0_imagen', '166'),
(910, 93, '_ventajas_0_imagen', 'field_5efc29fa1788f'),
(911, 93, 'ventajas_0_uptitle', 'ERGONOMÍA'),
(912, 93, '_ventajas_0_uptitle', 'field_5efc2a0217890'),
(913, 93, 'ventajas_0_title', 'AHORRADOR'),
(914, 93, '_ventajas_0_title', 'field_5efc2a0b17891'),
(915, 93, 'ventajas_0_subtitle', 'ABS'),
(916, 93, '_ventajas_0_subtitle', 'field_5efc2a1317892'),
(917, 93, 'ventajas_0_content', 'Entrega 389 kilómetros de recorrido con apenas 3.7 galones de gasolina, mérito indiscutible de su eficiente sistema de inyección electrónico.'),
(918, 93, '_ventajas_0_content', 'field_5efc2a2617894'),
(919, 93, 'ventajas_1_icon', '285'),
(920, 93, '_ventajas_1_icon', 'field_5efc2a1917893'),
(921, 93, 'ventajas_1_video', ''),
(922, 93, '_ventajas_1_video', 'field_5efc29f01788e'),
(923, 93, 'ventajas_1_imagen', '160'),
(924, 93, '_ventajas_1_imagen', 'field_5efc29fa1788f'),
(925, 93, 'ventajas_1_uptitle', 'ERGONOMÍA'),
(926, 93, '_ventajas_1_uptitle', 'field_5efc2a0217890'),
(927, 93, 'ventajas_1_title', 'AHORRADOR 2'),
(928, 93, '_ventajas_1_title', 'field_5efc2a0b17891'),
(929, 93, 'ventajas_1_subtitle', 'ABS'),
(930, 93, '_ventajas_1_subtitle', 'field_5efc2a1317892'),
(931, 93, 'ventajas_1_content', 'Entrega 389 kilómetros de recorrido con apenas 3.7 galones de gasolina, mérito indiscutible de su eficiente sistema de inyección electrónico.'),
(932, 93, '_ventajas_1_content', 'field_5efc2a2617894'),
(933, 93, 'ventajas_2_icon', '283'),
(934, 93, '_ventajas_2_icon', 'field_5efc2a1917893'),
(935, 93, 'ventajas_2_video', ''),
(936, 93, '_ventajas_2_video', 'field_5efc29f01788e'),
(937, 93, 'ventajas_2_imagen', '151'),
(938, 93, '_ventajas_2_imagen', 'field_5efc29fa1788f'),
(939, 93, 'ventajas_2_uptitle', 'ERGONOMÍA'),
(940, 93, '_ventajas_2_uptitle', 'field_5efc2a0217890'),
(941, 93, 'ventajas_2_title', 'AHORRADOR 3'),
(942, 93, '_ventajas_2_title', 'field_5efc2a0b17891'),
(943, 93, 'ventajas_2_subtitle', 'ABS'),
(944, 93, '_ventajas_2_subtitle', 'field_5efc2a1317892'),
(945, 93, 'ventajas_2_content', 'Entrega 389 kilómetros de recorrido con apenas 3.7 galones de gasolina, mérito indiscutible de su eficiente sistema de inyección electrónico.'),
(946, 93, '_ventajas_2_content', 'field_5efc2a2617894'),
(947, 93, 'ventajas', '3'),
(948, 93, '_ventajas', 'field_5efc29e41788d'),
(949, 93, 'colores_0_background', 'transparent linear-gradient(204deg, #090908 0%, #F9DF50 100%) 0% 0% no-repeat padding-box;'),
(950, 93, '_colores_0_background', 'field_5efc2ae417896'),
(951, 93, 'colores_0_360_image', ''),
(952, 93, '_colores_0_360_image', 'field_5efc2aec17897'),
(953, 93, 'colores_0_imagen', '290'),
(954, 93, '_colores_0_imagen', 'field_5efc2af617898'),
(955, 93, 'colores_0_color', '#f4ff56'),
(956, 93, '_colores_0_color', 'field_5efc2b0117899'),
(957, 93, 'colores_0_text', 'AMARILLO SOL'),
(958, 93, '_colores_0_text', 'field_5efc2b0a1789a'),
(959, 93, 'colores_1_background', 'transparent linear-gradient(204deg, #090908 0%, #e86161 100%) 0% 0% no-repeat padding-box;'),
(960, 93, '_colores_1_background', 'field_5efc2ae417896'),
(961, 93, 'colores_1_360_image', '305'),
(962, 93, '_colores_1_360_image', 'field_5efc2aec17897'),
(963, 93, 'colores_1_imagen', ''),
(964, 93, '_colores_1_imagen', 'field_5efc2af617898'),
(965, 93, 'colores_1_color', '#e86161'),
(966, 93, '_colores_1_color', 'field_5efc2b0117899'),
(967, 93, 'colores_1_text', 'ROJO PASIÓN'),
(968, 93, '_colores_1_text', 'field_5efc2b0a1789a'),
(969, 93, 'colores', '2'),
(970, 93, '_colores', 'field_5efc2a2e17895'),
(971, 93, 'parts_0_icon', '286'),
(972, 93, '_parts_0_icon', 'field_5efc2b7b178a1'),
(973, 93, 'parts_0_video', ''),
(974, 93, '_parts_0_video', 'field_5efc2b4d1789c'),
(975, 93, 'parts_0_imagen', '126'),
(976, 93, '_parts_0_imagen', 'field_5efc2b551789d'),
(977, 93, 'parts_0_title', 'TABLERO '),
(978, 93, '_parts_0_title', 'field_5efc2b5f1789e'),
(979, 93, 'parts_0_list', '<ul>\r\n 	<li>VELOCÍMETRO</li>\r\n 	<li>MEDIDOR DE BATERIA</li>\r\n 	<li>TACÓMETRO</li>\r\n 	<li>CUENTA REVOLUCIONES</li>\r\n</ul>'),
(980, 93, '_parts_0_list', 'field_5efc2b651789f'),
(981, 93, 'parts_1_icon', '284'),
(982, 93, '_parts_1_icon', 'field_5efc2b7b178a1'),
(983, 93, 'parts_1_video', ''),
(984, 93, '_parts_1_video', 'field_5efc2b4d1789c'),
(985, 93, 'parts_1_imagen', '126'),
(986, 93, '_parts_1_imagen', 'field_5efc2b551789d'),
(987, 93, 'parts_1_title', 'TABLERO 2'),
(988, 93, '_parts_1_title', 'field_5efc2b5f1789e'),
(989, 93, 'parts_1_list', '<ul>\r\n 	<li>VELOCÍMETRO</li>\r\n 	<li>MEDIDOR DE BATERIA</li>\r\n 	<li>TACÓMETRO</li>\r\n 	<li>CUENTA REVOLUCIONES</li>\r\n</ul>'),
(990, 93, '_parts_1_list', 'field_5efc2b651789f'),
(991, 93, 'parts_2_icon', '285'),
(992, 93, '_parts_2_icon', 'field_5efc2b7b178a1'),
(993, 93, 'parts_2_video', ''),
(994, 93, '_parts_2_video', 'field_5efc2b4d1789c'),
(995, 93, 'parts_2_imagen', '126'),
(996, 93, '_parts_2_imagen', 'field_5efc2b551789d'),
(997, 93, 'parts_2_title', 'TABLERO 3'),
(998, 93, '_parts_2_title', 'field_5efc2b5f1789e'),
(999, 93, 'parts_2_list', '<ul>\r\n 	<li>VELOCÍMETRO</li>\r\n 	<li>MEDIDOR DE BATERIA</li>\r\n 	<li>TACÓMETRO</li>\r\n 	<li>CUENTA REVOLUCIONES</li>\r\n</ul>'),
(1000, 93, '_parts_2_list', 'field_5efc2b651789f'),
(1001, 93, 'parts_3_icon', '288'),
(1002, 93, '_parts_3_icon', 'field_5efc2b7b178a1'),
(1003, 93, 'parts_3_video', ''),
(1004, 93, '_parts_3_video', 'field_5efc2b4d1789c'),
(1005, 93, 'parts_3_imagen', '126'),
(1006, 93, '_parts_3_imagen', 'field_5efc2b551789d'),
(1007, 93, 'parts_3_title', 'TABLERO 4'),
(1008, 93, '_parts_3_title', 'field_5efc2b5f1789e'),
(1009, 93, 'parts_3_list', '<ul>\r\n 	<li>VELOCÍMETRO</li>\r\n 	<li>MEDIDOR DE BATERIA</li>\r\n 	<li>TACÓMETRO</li>\r\n 	<li>CUENTA REVOLUCIONES</li>\r\n</ul>'),
(1010, 93, '_parts_3_list', 'field_5efc2b651789f'),
(1011, 93, 'parts', '4'),
(1012, 93, '_parts', 'field_5efc2b451789b'),
(1013, 93, 'imagen_parallax_2', '85'),
(1014, 93, '_imagen_parallax_2', 'field_5efc2b86178a2'),
(1015, 93, 'trans_0_icon', '291'),
(1016, 93, '_trans_0_icon', 'field_5efc2c02178ad'),
(1017, 93, 'trans_0_video', ''),
(1018, 93, '_trans_0_video', 'field_5efc2bba178a4'),
(1019, 93, 'trans_0_imagen', '85'),
(1020, 93, '_trans_0_imagen', 'field_5efc2bc4178a5'),
(1021, 93, 'trans_0_title', 'TRANSMICIÓN'),
(1022, 93, '_trans_0_title', 'field_5efc2bcd178a6'),
(1023, 93, 'trans_0_subtitle', 'MECÁNICA'),
(1024, 93, '_trans_0_subtitle', 'field_5efc2bd3178a7'),
(1025, 93, 'trans_0_list', '2'),
(1026, 93, '_trans_0_list', 'field_5efc2bd9178a8'),
(1027, 93, 'trans_1_icon', '292'),
(1028, 93, '_trans_1_icon', 'field_5efc2c02178ad'),
(1029, 93, 'trans_1_video', ''),
(1030, 93, '_trans_1_video', 'field_5efc2bba178a4'),
(1031, 93, 'trans_1_imagen', '127'),
(1032, 93, '_trans_1_imagen', 'field_5efc2bc4178a5'),
(1033, 93, 'trans_1_title', 'TRANSMICIÓN 2'),
(1034, 93, '_trans_1_title', 'field_5efc2bcd178a6'),
(1035, 93, 'trans_1_subtitle', 'MECÁNICA'),
(1036, 93, '_trans_1_subtitle', 'field_5efc2bd3178a7'),
(1037, 93, 'trans_1_list', '1'),
(1038, 93, '_trans_1_list', 'field_5efc2bd9178a8'),
(1039, 93, 'trans_2_icon', '293'),
(1040, 93, '_trans_2_icon', 'field_5efc2c02178ad'),
(1041, 93, 'trans_2_video', ''),
(1042, 93, '_trans_2_video', 'field_5efc2bba178a4'),
(1043, 93, 'trans_2_imagen', '127'),
(1044, 93, '_trans_2_imagen', 'field_5efc2bc4178a5'),
(1045, 93, 'trans_2_title', 'TRANSMICIÓN 3'),
(1046, 93, '_trans_2_title', 'field_5efc2bcd178a6'),
(1047, 93, 'trans_2_subtitle', 'MECÁNICA'),
(1048, 93, '_trans_2_subtitle', 'field_5efc2bd3178a7'),
(1049, 93, 'trans_2_list', '1'),
(1050, 93, '_trans_2_list', 'field_5efc2bd9178a8'),
(1051, 93, 'trans_3_icon', '294'),
(1052, 93, '_trans_3_icon', 'field_5efc2c02178ad'),
(1053, 93, 'trans_3_video', ''),
(1054, 93, '_trans_3_video', 'field_5efc2bba178a4'),
(1055, 93, 'trans_3_imagen', '151'),
(1056, 93, '_trans_3_imagen', 'field_5efc2bc4178a5'),
(1057, 93, 'trans_3_title', 'TRANSMICIÓN 4'),
(1058, 93, '_trans_3_title', 'field_5efc2bcd178a6'),
(1059, 93, 'trans_3_subtitle', 'MECÁNICA'),
(1060, 93, '_trans_3_subtitle', 'field_5efc2bd3178a7'),
(1061, 93, 'trans_3_list', '1'),
(1062, 93, '_trans_3_list', 'field_5efc2bd9178a8'),
(1063, 93, 'trans', '4'),
(1064, 93, '_trans', 'field_5efc2b91178a3'),
(1065, 93, 'title_dimensiones', 'DIMENSIONES Y PRESTACIONES'),
(1066, 93, '_title_dimensiones', 'field_5efc2f587a767'),
(1067, 93, 'number_box_1', '80.7'),
(1068, 93, '_number_box_1', 'field_5efc2f637a768'),
(1069, 93, 'text_box_1', 'CM'),
(1070, 93, '_text_box_1', 'field_5efc2f6b7a769'),
(1071, 93, 'desc_box_1', 'ALTURA DEL ASIENTO AL PISO'),
(1072, 93, '_desc_box_1', 'field_5efc2f797a76a'),
(1073, 93, 'imagen_moto_left', '297'),
(1074, 93, '_imagen_moto_left', 'field_5efc2fe37a76d'),
(1075, 93, 'number_box_2', '136.3'),
(1076, 93, '_number_box_2', 'field_5efc300b7a76e'),
(1077, 93, 'text_box_2', 'CM'),
(1078, 93, '_text_box_2', 'field_5efc301d7a76f'),
(1079, 93, 'desc_box_2', 'DISTANCIA ENTRE EJES'),
(1080, 93, '_desc_box_2', 'field_5efc302b7a770'),
(1081, 93, 'number_box_3', '201.5'),
(1082, 93, '_number_box_3', 'field_5efc303c7a771'),
(1083, 93, 'text_box_3', 'CM'),
(1084, 93, '_text_box_3', 'field_5efc30507a772'),
(1085, 93, 'desc_box_3', 'LARGO TOTAL'),
(1086, 93, '_desc_box_3', 'field_5efc306d7a773'),
(1087, 93, 'number_box_4', '80.7'),
(1088, 93, '_number_box_4', 'field_5efc30a27a775'),
(1089, 93, 'text_box_4', 'CM'),
(1090, 93, '_text_box_4', 'field_5efc30b17a776'),
(1091, 93, 'desc_box_4', 'ALTURA DE CHASIS AL PISO'),
(1092, 93, '_desc_box_4', 'field_5efc30bf7a777'),
(1093, 93, 'number_box_5', '90'),
(1094, 93, '_number_box_5', 'field_5efc30d37a778'),
(1095, 93, 'text_box_5', '°'),
(1096, 93, '_text_box_5', 'field_5efc31aa7a779'),
(1097, 93, 'desc_box_5', 'RADIO DE GIRO'),
(1098, 93, '_desc_box_5', 'field_5efc31bc7a77a'),
(1099, 93, 'imagen_moto_center', '296'),
(1100, 93, '_imagen_moto_center', 'field_5efc31e77a77b'),
(1101, 93, 'number_box_6', '80.4'),
(1102, 93, '_number_box_6', 'field_5efc32197a77c'),
(1103, 93, 'text_box_6', 'CM'),
(1104, 93, '_text_box_6', 'field_5efc32407a77d'),
(1105, 93, 'desc_box_6', 'ANCHO TOTAL'),
(1106, 93, '_desc_box_6', 'field_5efc32507a77e'),
(1107, 93, 'number_box_7', '117.5'),
(1108, 93, '_number_box_7', 'field_5efc32667a77f'),
(1109, 93, 'text_box_7', 'CM'),
(1110, 93, '_text_box_7', 'field_5efc328c9a141'),
(1111, 93, 'desc_box_7', 'ALTO TOTAL'),
(1112, 93, '_desc_box_7', 'field_5efc329e9a142'),
(1113, 93, 'position_moto', '295'),
(1114, 93, '_position_moto', 'field_5efc32ba9a143'),
(1115, 93, 'position_moto_title', 'POSICIÓN DE MANEJO'),
(1116, 93, '_position_moto_title', 'field_5efc32f99a144'),
(1117, 93, 'position_moto_desc', 'SEMI ERGUIDO'),
(1118, 93, '_position_moto_desc', 'field_5efc33099a145'),
(1119, 93, 'atrib_text_1', 'PESO:'),
(1120, 93, '_atrib_text_1', 'field_5efc3330c2f21'),
(1121, 93, 'atrib_number_1', '145.45'),
(1122, 93, '_atrib_number_1', 'field_5efc3366c2f22'),
(1123, 93, 'atrib_imagen_1', '299'),
(1124, 93, '_atrib_imagen_1', 'field_5efc3376c2f23'),
(1125, 93, 'atrib_text_2', 'CARGA UTIL:'),
(1126, 93, '_atrib_text_2', 'field_5efc3390c2f24'),
(1127, 93, 'atrib_number_2', '160.88'),
(1128, 93, '_atrib_number_2', 'field_5efc33a3c2f25'),
(1129, 93, 'atrib_imagen_2', '299'),
(1130, 93, '_atrib_imagen_2', 'field_5efc33b0c2f26'),
(1131, 93, 'atrib_text_3', 'CAPACIDAD:'),
(1132, 93, '_atrib_text_3', 'field_5efc33bfc2f27'),
(1133, 93, 'atrib_number_3', '2'),
(1134, 93, '_atrib_number_3', 'field_5efc33ccc2f28'),
(1135, 93, 'atrib_imagen_3', '298'),
(1136, 93, '_atrib_imagen_3', 'field_5efc33d8c2f29'),
(1137, 93, 'descargar_ficha', '#'),
(1138, 93, '_descargar_ficha', 'field_5efc34f79ba8a'),
(1139, 93, 'fren', '4'),
(1140, 93, '_fren', 'field_5efc34629ba7f'),
(1141, 93, 'imagen_parallax_3', '85'),
(1142, 93, '_imagen_parallax_3', 'field_5efc352a9ba8d'),
(1143, 93, 'mirame_title', 'MIRAME Y AMAME'),
(1144, 93, '_mirame_title', 'field_5efc354d9ba8f'),
(1145, 93, 'mirame_subtitle', 'Mírame en diferentes ángulos vas a querer llévame contigo.'),
(1146, 93, '_mirame_subtitle', 'field_5efc355a9ba90'),
(1147, 93, 'grid_shortcode', '[FinalTilesGallery id=\'1\']'),
(1148, 93, '_grid_shortcode', 'field_5efc35689ba91'),
(1149, 295, '_wp_attached_file', '2020/06/normal-1.png'),
(1150, 295, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:214;s:6:\"height\";i:219;s:4:\"file\";s:20:\"2020/06/normal-1.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"normal-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"normal-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"normal-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:18:\"normal-1-64x65.png\";s:5:\"width\";i:64;s:6:\"height\";i:65;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1151, 296, '_wp_attached_file', '2020/06/STREET-top-1.png'),
(1152, 296, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:198;s:6:\"height\";i:318;s:4:\"file\";s:24:\"2020/06/STREET-top-1.png\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"STREET-top-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"STREET-top-1-187x300.png\";s:5:\"width\";i:187;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:24:\"STREET-top-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:24:\"STREET-top-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"STREET-top-1-64x103.png\";s:5:\"width\";i:64;s:6:\"height\";i:103;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1153, 297, '_wp_attached_file', '2020/06/4371087-motorcycle-transportation.png'),
(1154, 297, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:396;s:6:\"height\";i:396;s:4:\"file\";s:45:\"2020/06/4371087-motorcycle-transportation.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4371087-motorcycle-transportation-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"4371087-motorcycle-transportation-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:45:\"4371087-motorcycle-transportation-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371087-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:45:\"4371087-motorcycle-transportation-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:45:\"4371087-motorcycle-transportation-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:43:\"4371087-motorcycle-transportation-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1155, 298, '_wp_attached_file', '2020/06/caminar.png'),
(1156, 298, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:19:\"2020/06/caminar.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1157, 299, '_wp_attached_file', '2020/06/weight.png'),
(1158, 299, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:18:\"2020/06/weight.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1159, 93, 'trans_0_list_0_title', 'N° DE CAMBIOS'),
(1160, 93, '_trans_0_list_0_title', 'field_5efc2be3178a9'),
(1161, 93, 'trans_0_list_0_number', '6'),
(1162, 93, '_trans_0_list_0_number', 'field_5efc2bec178aa'),
(1163, 93, 'trans_0_list_0_atrib', ''),
(1164, 93, '_trans_0_list_0_atrib', 'field_5efc2bf2178ab'),
(1165, 93, 'trans_0_list_1_title', 'VELOCIDAD MÁXIMA'),
(1166, 93, '_trans_0_list_1_title', 'field_5efc2be3178a9'),
(1167, 93, 'trans_0_list_1_number', '190'),
(1168, 93, '_trans_0_list_1_number', 'field_5efc2bec178aa'),
(1169, 93, 'trans_0_list_1_atrib', 'KM/H'),
(1170, 93, '_trans_0_list_1_atrib', 'field_5efc2bf2178ab'),
(1171, 93, 'trans_1_list_0_title', 'VELOCIDAD MÁXIMA'),
(1172, 93, '_trans_1_list_0_title', 'field_5efc2be3178a9'),
(1173, 93, 'trans_1_list_0_number', '190'),
(1174, 93, '_trans_1_list_0_number', 'field_5efc2bec178aa'),
(1175, 93, 'trans_1_list_0_atrib', 'KM/H'),
(1176, 93, '_trans_1_list_0_atrib', 'field_5efc2bf2178ab'),
(1177, 93, 'trans_2_list_0_title', 'VELOCIDAD MÁXIMA'),
(1178, 93, '_trans_2_list_0_title', 'field_5efc2be3178a9'),
(1179, 93, 'trans_2_list_0_number', '190'),
(1180, 93, '_trans_2_list_0_number', 'field_5efc2bec178aa'),
(1181, 93, 'trans_2_list_0_atrib', 'KM/H'),
(1182, 93, '_trans_2_list_0_atrib', 'field_5efc2bf2178ab'),
(1183, 93, 'trans_3_list_0_title', 'VELOCIDAD MÁXIMA'),
(1184, 93, '_trans_3_list_0_title', 'field_5efc2be3178a9'),
(1185, 93, 'trans_3_list_0_number', '190'),
(1186, 93, '_trans_3_list_0_number', 'field_5efc2bec178aa'),
(1187, 93, 'trans_3_list_0_atrib', 'KM/H'),
(1188, 93, '_trans_3_list_0_atrib', 'field_5efc2bf2178ab'),
(1189, 300, '_wp_attached_file', '2020/06/motocicleta-9.png');
INSERT INTO `al_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1190, 300, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:25:\"2020/06/motocicleta-9.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:23:\"motocicleta-9-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1191, 301, '_wp_attached_file', '2020/06/motocicleta-10.png'),
(1192, 301, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:75;s:6:\"height\";i:75;s:4:\"file\";s:26:\"2020/06/motocicleta-10.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:24:\"motocicleta-10-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1193, 302, '_wp_attached_file', '2020/06/motocicleta-11.png'),
(1194, 302, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:77;s:6:\"height\";i:77;s:4:\"file\";s:26:\"2020/06/motocicleta-11.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:24:\"motocicleta-11-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1195, 303, '_wp_attached_file', '2020/06/diverso.png'),
(1196, 303, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:77;s:6:\"height\";i:77;s:4:\"file\";s:19:\"2020/06/diverso.png\";s:5:\"sizes\";a:1:{s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:17:\"diverso-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1197, 93, 'fren_0_icon', '300'),
(1198, 93, '_fren_0_icon', 'field_5efc34dd9ba89'),
(1199, 93, 'fren_0_video', ''),
(1200, 93, '_fren_0_video', 'field_5efc34719ba80'),
(1201, 93, 'fren_0_imagen', '127'),
(1202, 93, '_fren_0_imagen', 'field_5efc347f9ba81'),
(1203, 93, 'fren_0_title', 'FRENOS'),
(1204, 93, '_fren_0_title', 'field_5efc348a9ba82'),
(1205, 93, 'fren_0_subtitle', ''),
(1206, 93, '_fren_0_subtitle', 'field_5efc34919ba83'),
(1207, 93, 'fren_0_list_0_title', 'DELANTERO'),
(1208, 93, '_fren_0_list_0_title', 'field_5efc349f9ba85'),
(1209, 93, 'fren_0_list_0_number', '310'),
(1210, 93, '_fren_0_list_0_number', 'field_5efc34b39ba86'),
(1211, 93, 'fren_0_list_0_atrib', 'mm'),
(1212, 93, '_fren_0_list_0_atrib', 'field_5efc34c09ba87'),
(1213, 93, 'fren_0_list_0_text', 'Disco lobulado con caliper de 4 pistones y ABS Nissin'),
(1214, 93, '_fren_0_list_0_text', 'field_5efc34d29ba88'),
(1215, 93, 'fren_0_list_1_title', 'POSTERIOR'),
(1216, 93, '_fren_0_list_1_title', 'field_5efc349f9ba85'),
(1217, 93, 'fren_0_list_1_number', '220'),
(1218, 93, '_fren_0_list_1_number', 'field_5efc34b39ba86'),
(1219, 93, 'fren_0_list_1_atrib', 'mm'),
(1220, 93, '_fren_0_list_1_atrib', 'field_5efc34c09ba87'),
(1221, 93, 'fren_0_list_1_text', 'Disco lobulado con caliper de 4 pistones'),
(1222, 93, '_fren_0_list_1_text', 'field_5efc34d29ba88'),
(1223, 93, 'fren_0_list_2_title', 'SISTEMA DE FRENOS'),
(1224, 93, '_fren_0_list_2_title', 'field_5efc349f9ba85'),
(1225, 93, 'fren_0_list_2_number', 'ABS'),
(1226, 93, '_fren_0_list_2_number', 'field_5efc34b39ba86'),
(1227, 93, 'fren_0_list_2_atrib', ''),
(1228, 93, '_fren_0_list_2_atrib', 'field_5efc34c09ba87'),
(1229, 93, 'fren_0_list_2_text', 'En ambas ruedas'),
(1230, 93, '_fren_0_list_2_text', 'field_5efc34d29ba88'),
(1231, 93, 'fren_0_list', '3'),
(1232, 93, '_fren_0_list', 'field_5efc34979ba84'),
(1233, 93, 'fren_1_icon', '301'),
(1234, 93, '_fren_1_icon', 'field_5efc34dd9ba89'),
(1235, 93, 'fren_1_video', ''),
(1236, 93, '_fren_1_video', 'field_5efc34719ba80'),
(1237, 93, 'fren_1_imagen', '126'),
(1238, 93, '_fren_1_imagen', 'field_5efc347f9ba81'),
(1239, 93, 'fren_1_title', 'FRENOS'),
(1240, 93, '_fren_1_title', 'field_5efc348a9ba82'),
(1241, 93, 'fren_1_subtitle', ''),
(1242, 93, '_fren_1_subtitle', 'field_5efc34919ba83'),
(1243, 93, 'fren_1_list_0_title', 'DELANTERO'),
(1244, 93, '_fren_1_list_0_title', 'field_5efc349f9ba85'),
(1245, 93, 'fren_1_list_0_number', '123'),
(1246, 93, '_fren_1_list_0_number', 'field_5efc34b39ba86'),
(1247, 93, 'fren_1_list_0_atrib', 'mm'),
(1248, 93, '_fren_1_list_0_atrib', 'field_5efc34c09ba87'),
(1249, 93, 'fren_1_list_0_text', 'Disco lobulado con caliper de 4 pistones y ABS Nissin'),
(1250, 93, '_fren_1_list_0_text', 'field_5efc34d29ba88'),
(1251, 93, 'fren_1_list', '1'),
(1252, 93, '_fren_1_list', 'field_5efc34979ba84'),
(1253, 93, 'fren_2_icon', '302'),
(1254, 93, '_fren_2_icon', 'field_5efc34dd9ba89'),
(1255, 93, 'fren_2_video', ''),
(1256, 93, '_fren_2_video', 'field_5efc34719ba80'),
(1257, 93, 'fren_2_imagen', '151'),
(1258, 93, '_fren_2_imagen', 'field_5efc347f9ba81'),
(1259, 93, 'fren_2_title', 'FRENOS'),
(1260, 93, '_fren_2_title', 'field_5efc348a9ba82'),
(1261, 93, 'fren_2_subtitle', ''),
(1262, 93, '_fren_2_subtitle', 'field_5efc34919ba83'),
(1263, 93, 'fren_2_list', ''),
(1264, 93, '_fren_2_list', 'field_5efc34979ba84'),
(1265, 93, 'fren_3_icon', '303'),
(1266, 93, '_fren_3_icon', 'field_5efc34dd9ba89'),
(1267, 93, 'fren_3_video', ''),
(1268, 93, '_fren_3_video', 'field_5efc34719ba80'),
(1269, 93, 'fren_3_imagen', '85'),
(1270, 93, '_fren_3_imagen', 'field_5efc347f9ba81'),
(1271, 93, 'fren_3_title', 'FRENOS'),
(1272, 93, '_fren_3_title', 'field_5efc348a9ba82'),
(1273, 93, 'fren_3_subtitle', ''),
(1274, 93, '_fren_3_subtitle', 'field_5efc34919ba83'),
(1275, 93, 'fren_3_list_0_title', 'DELANTERO'),
(1276, 93, '_fren_3_list_0_title', 'field_5efc349f9ba85'),
(1277, 93, 'fren_3_list_0_number', '123'),
(1278, 93, '_fren_3_list_0_number', 'field_5efc34b39ba86'),
(1279, 93, 'fren_3_list_0_atrib', 'nm'),
(1280, 93, '_fren_3_list_0_atrib', 'field_5efc34c09ba87'),
(1281, 93, 'fren_3_list_0_text', 'Disco lobulado con caliper de 4 pistones y ABS Nissin'),
(1282, 93, '_fren_3_list_0_text', 'field_5efc34d29ba88'),
(1283, 93, 'fren_3_list', '1'),
(1284, 93, '_fren_3_list', 'field_5efc34979ba84'),
(1285, 304, '_wp_attached_file', '2020/06/Grupo-704-min.jpg'),
(1286, 305, '_wp_attached_file', '2020/06/Grupo-704-min-1.jpg'),
(1287, 305, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:11524;s:6:\"height\";i:6481;s:4:\"file\";s:27:\"2020/06/Grupo-704-min-1.jpg\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:28:\"Grupo-704-min-1-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:27:\"Grupo-704-min-1-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-600x337.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:337;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-600x337.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:337;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:27:\"Grupo-704-min-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:25:\"Grupo-704-min-1-64x36.jpg\";s:5:\"width\";i:64;s:6:\"height\";i:36;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1288, 111, '_edit_lock', '1593655873:1'),
(1289, 111, '_edit_last', '1'),
(1290, 111, '_wp_page_template', 'templates/template-myaccount.php'),
(1291, 111, '_yoast_wpseo_content_score', '90'),
(1292, 307, '_wp_attached_file', '2020/07/machu-picchu-1569324_1280.png'),
(1293, 307, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1520;s:6:\"height\";i:178;s:4:\"file\";s:37:\"2020/07/machu-picchu-1569324_1280.png\";s:5:\"sizes\";a:11:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"machu-picchu-1569324_1280-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"machu-picchu-1569324_1280-300x35.png\";s:5:\"width\";i:300;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:36:\"machu-picchu-1569324_1280-768x90.png\";s:5:\"width\";i:768;s:6:\"height\";i:90;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:38:\"machu-picchu-1569324_1280-1024x120.png\";s:5:\"width\";i:1024;s:6:\"height\";i:120;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:36:\"machu-picchu-1569324_1280-300x35.png\";s:5:\"width\";i:300;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:36:\"machu-picchu-1569324_1280-600x70.png\";s:5:\"width\";i:600;s:6:\"height\";i:70;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:37:\"machu-picchu-1569324_1280-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:36:\"machu-picchu-1569324_1280-300x35.png\";s:5:\"width\";i:300;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:36:\"machu-picchu-1569324_1280-600x70.png\";s:5:\"width\";i:600;s:6:\"height\";i:70;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:37:\"machu-picchu-1569324_1280-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:34:\"machu-picchu-1569324_1280-64x7.png\";s:5:\"width\";i:64;s:6:\"height\";i:7;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1294, 310, '_edit_last', '1'),
(1295, 310, '_edit_lock', '1593661815:1'),
(1296, 312, '_wp_attached_file', '2020/07/88163880_2956796697705508_8194579974775111680_o.jpg'),
(1297, 312, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:960;s:4:\"file\";s:59:\"2020/07/88163880_2956796697705508_8194579974775111680_o.jpg\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:59:\"88163880_2956796697705508_8194579974775111680_o-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:57:\"88163880_2956796697705508_8194579974775111680_o-64x64.jpg\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1298, 313, '_order_key', 'wc_order_9NoZ7VnQ8etAO'),
(1299, 313, '_customer_user', '1'),
(1300, 313, '_payment_method', 'woo-maximo'),
(1301, 313, '_payment_method_title', 'Tarjeta  de crédito y débito '),
(1302, 313, '_customer_ip_address', '127.0.0.1'),
(1303, 313, '_customer_user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1304, 313, '_created_via', 'checkout'),
(1305, 313, '_cart_hash', '208bfdf75c3796f786c8df3439789975'),
(1306, 313, '_billing_first_name', 'Fran'),
(1307, 313, '_billing_last_name', 'De la Rosa'),
(1308, 313, '_billing_address_1', 'AV LAS LOMAS'),
(1309, 313, '_billing_city', 'LIMA'),
(1310, 313, '_billing_state', 'LIM'),
(1311, 313, '_billing_postcode', 'LIMA01'),
(1312, 313, '_billing_country', 'PE'),
(1313, 313, '_billing_email', 'frankdelarosacampos@gmail.com'),
(1314, 313, '_billing_phone', '918172291'),
(1315, 313, '_order_currency', 'PEN'),
(1316, 313, '_cart_discount', '0'),
(1317, 313, '_cart_discount_tax', '0'),
(1318, 313, '_order_shipping', '0'),
(1319, 313, '_order_shipping_tax', '0'),
(1320, 313, '_order_tax', '0'),
(1321, 313, '_order_total', '270000'),
(1322, 313, '_order_version', '3.7.1'),
(1323, 313, '_prices_include_tax', 'no'),
(1324, 313, '_billing_address_index', 'Fran De la Rosa  AV LAS LOMAS  LIMA LIM LIMA01 PE frankdelarosacampos@gmail.com 918172291'),
(1325, 313, '_shipping_address_index', '        '),
(1326, 313, 'is_vat_exempt', 'no'),
(1327, 314, '_order_key', 'wc_order_ZYVZIDaleEPrz'),
(1328, 314, '_customer_user', '1'),
(1329, 314, '_payment_method', 'woo-maximo'),
(1330, 314, '_payment_method_title', 'Tarjeta  de crédito y débito '),
(1331, 314, '_customer_ip_address', '127.0.0.1'),
(1332, 314, '_customer_user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36'),
(1333, 314, '_created_via', 'checkout'),
(1334, 314, '_cart_hash', '584f5352284b938f121495941800050b'),
(1335, 314, '_billing_first_name', 'Fran'),
(1336, 314, '_billing_last_name', 'De la Rosa'),
(1337, 314, '_billing_address_1', 'AV LAS LOMAS'),
(1338, 314, '_billing_city', 'LIMA'),
(1339, 314, '_billing_state', 'LIM'),
(1340, 314, '_billing_postcode', 'LIMA01'),
(1341, 314, '_billing_country', 'PE'),
(1342, 314, '_billing_email', 'frankdelarosacampos@gmail.com'),
(1343, 314, '_billing_phone', '918172291'),
(1344, 314, '_order_currency', 'PEN'),
(1345, 314, '_cart_discount', '0'),
(1346, 314, '_cart_discount_tax', '0'),
(1347, 314, '_order_shipping', '0'),
(1348, 314, '_order_shipping_tax', '0'),
(1349, 314, '_order_tax', '0'),
(1350, 314, '_order_total', '324000'),
(1351, 314, '_order_version', '3.7.1'),
(1352, 314, '_prices_include_tax', 'no'),
(1353, 314, '_billing_address_index', 'Fran De la Rosa  AV LAS LOMAS  LIMA LIM LIMA01 PE frankdelarosacampos@gmail.com 918172291'),
(1354, 314, '_shipping_address_index', '        '),
(1355, 314, 'is_vat_exempt', 'no'),
(1356, 314, '_edit_lock', '1593711173:1'),
(1357, 316, '_wp_attached_file', '2020/06/ducati-monster-797-2018-negro-464827.png'),
(1358, 316, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:410;s:6:\"height\";i:259;s:4:\"file\";s:48:\"2020/06/ducati-monster-797-2018-negro-464827.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-300x190.png\";s:5:\"width\";i:300;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-300x190.png\";s:5:\"width\";i:300;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-300x190.png\";s:5:\"width\";i:300;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:46:\"ducati-monster-797-2018-negro-464827-64x40.png\";s:5:\"width\";i:64;s:6:\"height\";i:40;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1359, 317, '_wp_attached_file', '2020/06/ducati-monster-797-2018-negro-464827-1.png'),
(1360, 317, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:410;s:6:\"height\";i:259;s:4:\"file\";s:50:\"2020/06/ducati-monster-797-2018-negro-464827-1.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:50:\"ducati-monster-797-2018-negro-464827-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:50:\"ducati-monster-797-2018-negro-464827-1-300x190.png\";s:5:\"width\";i:300;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:50:\"ducati-monster-797-2018-negro-464827-1-300x190.png\";s:5:\"width\";i:300;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:50:\"ducati-monster-797-2018-negro-464827-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:50:\"ducati-monster-797-2018-negro-464827-1-300x190.png\";s:5:\"width\";i:300;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:50:\"ducati-monster-797-2018-negro-464827-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:48:\"ducati-monster-797-2018-negro-464827-1-64x40.png\";s:5:\"width\";i:64;s:6:\"height\";i:40;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1361, 139, 'imagen_parallax', ''),
(1362, 139, '_imagen_parallax', 'field_5efc29021788c'),
(1363, 139, 'ventajas', ''),
(1364, 139, '_ventajas', 'field_5efc29e41788d'),
(1365, 139, 'colores', ''),
(1366, 139, '_colores', 'field_5efc2a2e17895'),
(1367, 139, 'parts', ''),
(1368, 139, '_parts', 'field_5efc2b451789b'),
(1369, 139, 'imagen_parallax_2', ''),
(1370, 139, '_imagen_parallax_2', 'field_5efc2b86178a2'),
(1371, 139, 'trans', ''),
(1372, 139, '_trans', 'field_5efc2b91178a3'),
(1373, 139, 'title_dimensiones', ''),
(1374, 139, '_title_dimensiones', 'field_5efc2f587a767'),
(1375, 139, 'number_box_1', ''),
(1376, 139, '_number_box_1', 'field_5efc2f637a768'),
(1377, 139, 'text_box_1', ''),
(1378, 139, '_text_box_1', 'field_5efc2f6b7a769'),
(1379, 139, 'desc_box_1', ''),
(1380, 139, '_desc_box_1', 'field_5efc2f797a76a'),
(1381, 139, 'imagen_moto_left', ''),
(1382, 139, '_imagen_moto_left', 'field_5efc2fe37a76d'),
(1383, 139, 'number_box_2', ''),
(1384, 139, '_number_box_2', 'field_5efc300b7a76e'),
(1385, 139, 'text_box_2', ''),
(1386, 139, '_text_box_2', 'field_5efc301d7a76f'),
(1387, 139, 'desc_box_2', ''),
(1388, 139, '_desc_box_2', 'field_5efc302b7a770'),
(1389, 139, 'number_box_3', ''),
(1390, 139, '_number_box_3', 'field_5efc303c7a771'),
(1391, 139, 'text_box_3', ''),
(1392, 139, '_text_box_3', 'field_5efc30507a772'),
(1393, 139, 'desc_box_3', ''),
(1394, 139, '_desc_box_3', 'field_5efc306d7a773'),
(1395, 139, 'number_box_4', ''),
(1396, 139, '_number_box_4', 'field_5efc30a27a775'),
(1397, 139, 'text_box_4', ''),
(1398, 139, '_text_box_4', 'field_5efc30b17a776'),
(1399, 139, 'desc_box_4', ''),
(1400, 139, '_desc_box_4', 'field_5efc30bf7a777'),
(1401, 139, 'number_box_5', ''),
(1402, 139, '_number_box_5', 'field_5efc30d37a778'),
(1403, 139, 'text_box_5', ''),
(1404, 139, '_text_box_5', 'field_5efc31aa7a779'),
(1405, 139, 'desc_box_5', ''),
(1406, 139, '_desc_box_5', 'field_5efc31bc7a77a'),
(1407, 139, 'imagen_moto_center', ''),
(1408, 139, '_imagen_moto_center', 'field_5efc31e77a77b'),
(1409, 139, 'number_box_6', ''),
(1410, 139, '_number_box_6', 'field_5efc32197a77c'),
(1411, 139, 'text_box_6', ''),
(1412, 139, '_text_box_6', 'field_5efc32407a77d'),
(1413, 139, 'desc_box_6', ''),
(1414, 139, '_desc_box_6', 'field_5efc32507a77e'),
(1415, 139, 'number_box_7', ''),
(1416, 139, '_number_box_7', 'field_5efc32667a77f'),
(1417, 139, 'text_box_7', ''),
(1418, 139, '_text_box_7', 'field_5efc328c9a141'),
(1419, 139, 'desc_box_7', ''),
(1420, 139, '_desc_box_7', 'field_5efc329e9a142'),
(1421, 139, 'position_moto', ''),
(1422, 139, '_position_moto', 'field_5efc32ba9a143'),
(1423, 139, 'position_moto_title', ''),
(1424, 139, '_position_moto_title', 'field_5efc32f99a144'),
(1425, 139, 'position_moto_desc', ''),
(1426, 139, '_position_moto_desc', 'field_5efc33099a145'),
(1427, 139, 'atrib_text_1', ''),
(1428, 139, '_atrib_text_1', 'field_5efc3330c2f21'),
(1429, 139, 'atrib_number_1', ''),
(1430, 139, '_atrib_number_1', 'field_5efc3366c2f22'),
(1431, 139, 'atrib_imagen_1', ''),
(1432, 139, '_atrib_imagen_1', 'field_5efc3376c2f23'),
(1433, 139, 'atrib_text_2', ''),
(1434, 139, '_atrib_text_2', 'field_5efc3390c2f24'),
(1435, 139, 'atrib_number_2', ''),
(1436, 139, '_atrib_number_2', 'field_5efc33a3c2f25'),
(1437, 139, 'atrib_imagen_2', ''),
(1438, 139, '_atrib_imagen_2', 'field_5efc33b0c2f26'),
(1439, 139, 'atrib_text_3', ''),
(1440, 139, '_atrib_text_3', 'field_5efc33bfc2f27'),
(1441, 139, 'atrib_number_3', ''),
(1442, 139, '_atrib_number_3', 'field_5efc33ccc2f28'),
(1443, 139, 'atrib_imagen_3', ''),
(1444, 139, '_atrib_imagen_3', 'field_5efc33d8c2f29'),
(1445, 139, 'descargar_ficha', ''),
(1446, 139, '_descargar_ficha', 'field_5efc34f79ba8a'),
(1447, 139, 'fren', ''),
(1448, 139, '_fren', 'field_5efc34629ba7f'),
(1449, 139, 'imagen_parallax_3', ''),
(1450, 139, '_imagen_parallax_3', 'field_5efc352a9ba8d'),
(1451, 139, 'mirame_title', ''),
(1452, 139, '_mirame_title', 'field_5efc354d9ba8f'),
(1453, 139, 'mirame_subtitle', ''),
(1454, 139, '_mirame_subtitle', 'field_5efc355a9ba90'),
(1455, 139, 'grid_shortcode', ''),
(1456, 139, '_grid_shortcode', 'field_5efc35689ba91'),
(1457, 320, '_edit_last', '1'),
(1458, 320, '_edit_lock', '1595287906:1'),
(1459, 320, '_wp_page_template', 'templates/template-worknos.php'),
(1460, 320, '_yoast_wpseo_content_score', '30'),
(1461, 322, '_form', '<h2>Dejanos tus datos</h2>\n<label>Nombres y Apellidos\' (requerido)\n    [text* your-name] </label>\n\n<label>Celular\'\n    [tel celular] </label>\n\n<label> Tu correo electrónico\' (requerido)\n    [email* your-email] </label>\n\n<label> Link de Linkedin\'\n    [url linkedin]</label>\n<label> AREA DE TU INTERES\n    [select menu-631 include_blank \"Interes 1\" \"Interes 2 \" \"Interes 3\"]</label>\n<label> ADJUNTA TU CV\'\n    [file file-cv]</label>\n<p>Datos Obligatorios</p>\n[submit \"ENVIAR SOLICITUD\"]'),
(1462, 322, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:26:\"AlMango «[your-subject]»\";s:6:\"sender\";s:42:\"AlMango <wordpress@dev.almango-master.com>\";s:9:\"recipient\";s:29:\"frankdelarosacampos@gmail.com\";s:4:\"body\";s:196:\"De: [your-name] <[your-email]>\nAsunto: [your-subject]\n\nCuerpo del mensaje:\n[your-message]\n\n-- \nEste mensaje se ha enviado desde un formulario de contacto en AlMango (http://dev.almango-master.com)\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(1463, 322, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:26:\"AlMango «[your-subject]»\";s:6:\"sender\";s:42:\"AlMango <wordpress@dev.almango-master.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:141:\"Cuerpo del mensaje:\n[your-message]\n\n-- \nEste mensaje se ha enviado desde un formulario de contacto en AlMango (http://dev.almango-master.com)\";s:18:\"additional_headers\";s:39:\"Reply-To: frankdelarosacampos@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(1464, 322, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:40:\"Gracias por tu mensaje. Ha sido enviado.\";s:12:\"mail_sent_ng\";s:85:\"Hubo un error intentando enviar tu mensaje. Por favor inténtalo de nuevo más tarde.\";s:16:\"validation_error\";s:74:\"Uno o más campos tienen un error. Por favor revisa e inténtalo de nuevo.\";s:4:\"spam\";s:85:\"Hubo un error intentando enviar tu mensaje. Por favor inténtalo de nuevo más tarde.\";s:12:\"accept_terms\";s:69:\"Debes aceptar los términos y condiciones antes de enviar tu mensaje.\";s:16:\"invalid_required\";s:24:\"El campo es obligatorio.\";s:16:\"invalid_too_long\";s:28:\"El campo es demasiado largo.\";s:17:\"invalid_too_short\";s:28:\"El campo es demasiado corto.\";s:12:\"invalid_date\";s:34:\"El formato de fecha es incorrecto.\";s:14:\"date_too_early\";s:50:\"La fecha es anterior a la más temprana permitida.\";s:13:\"date_too_late\";s:50:\"La fecha es posterior a la más tardía permitida.\";s:13:\"upload_failed\";s:46:\"Hubo un error desconocido subiendo el archivo.\";s:24:\"upload_file_type_invalid\";s:52:\"No tienes permisos para subir archivos de este tipo.\";s:21:\"upload_file_too_large\";s:31:\"El archivo es demasiado grande.\";s:23:\"upload_failed_php_error\";s:43:\"Se ha producido un error subiendo la imagen\";s:14:\"invalid_number\";s:36:\"El formato de número no es válido.\";s:16:\"number_too_small\";s:45:\"El número es menor que el mínimo permitido.\";s:16:\"number_too_large\";s:45:\"El número es mayor que el máximo permitido.\";s:23:\"quiz_answer_not_correct\";s:44:\"La respuesta al cuestionario no es correcta.\";s:17:\"captcha_not_match\";s:37:\"El código introducido es incorrecto.\";s:13:\"invalid_email\";s:71:\"La dirección de correo electrónico que has introducido no es válida.\";s:11:\"invalid_url\";s:21:\"La URL no es válida.\";s:11:\"invalid_tel\";s:38:\"El número de teléfono no es válido.\";}'),
(1465, 322, '_additional_settings', ''),
(1466, 322, '_locale', 'es_ES'),
(1467, 323, '_wp_attached_file', '2020/07/avatar@2x.png'),
(1468, 323, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:50;s:4:\"file\";s:21:\"2020/07/avatar@2x.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1469, 324, '_wp_attached_file', '2020/07/businessman@2x.png'),
(1470, 324, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:50;s:4:\"file\";s:26:\"2020/07/businessman@2x.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1471, 325, '_wp_attached_file', '2020/07/jigsaw@2x.png'),
(1472, 325, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:50;s:4:\"file\";s:21:\"2020/07/jigsaw@2x.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1473, 326, '_wp_attached_file', '2020/07/kid-and-baby@2x.png'),
(1474, 326, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:664;s:6:\"height\";i:664;s:4:\"file\";s:27:\"2020/07/kid-and-baby@2x.png\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:27:\"kid-and-baby@2x-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:27:\"kid-and-baby@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:25:\"kid-and-baby@2x-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1475, 327, '_wp_attached_file', '2020/07/linkedin@2x.png'),
(1476, 327, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:50;s:4:\"file\";s:23:\"2020/07/linkedin@2x.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1477, 328, '_wp_attached_file', '2020/07/man-1@2x.png'),
(1478, 328, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:664;s:6:\"height\";i:664;s:4:\"file\";s:20:\"2020/07/man-1@2x.png\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"man-1@2x-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"man-1@2x-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"man-1@2x-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"man-1@2x-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"man-1@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"man-1@2x-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:20:\"man-1@2x-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"man-1@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:18:\"man-1@2x-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1479, 329, '_wp_attached_file', '2020/07/mobile-phone@2x.png'),
(1480, 329, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:50;s:4:\"file\";s:27:\"2020/07/mobile-phone@2x.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1481, 330, '_wp_attached_file', '2020/07/multimedia@2x.png'),
(1482, 330, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:50;s:6:\"height\";i:50;s:4:\"file\";s:25:\"2020/07/multimedia@2x.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1483, 331, '_wp_attached_file', '2020/07/up@2x.png'),
(1484, 331, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:292;s:6:\"height\";i:292;s:4:\"file\";s:17:\"2020/07/up@2x.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"up@2x-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:17:\"up@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:17:\"up@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:15:\"up@2x-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1485, 332, '_wp_attached_file', '2020/07/up-1@2x.png'),
(1486, 332, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:293;s:6:\"height\";i:293;s:4:\"file\";s:19:\"2020/07/up-1@2x.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"up-1@2x-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"up-1@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"up-1@2x-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"dgwt-wcas-product-suggestion\";a:4:{s:4:\"file\";s:17:\"up-1@2x-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(1487, 333, '_edit_last', '1'),
(1488, 333, '_edit_lock', '1595294399:1'),
(1489, 320, 'titulo_worknos', 'Trabaja con Nosotros'),
(1490, 320, '_titulo_worknos', 'field_5f16274d05bd4'),
(1491, 320, 'texto_worknos', 'Únete a nuestro equipo y trabaja por tus pasiones, porque no hay mayor recompensa que tus ideas realmente importen y puedan hacerse realidad.'),
(1492, 320, '_texto_worknos', 'field_5f16275905bd5'),
(1493, 320, 'img_girl', '326'),
(1494, 320, '_img_girl', 'field_5f16276005bd6'),
(1495, 320, 'img_arrow', '332'),
(1496, 320, '_img_arrow', 'field_5f16278d05bd7'),
(1497, 320, 'img_text', ''),
(1498, 320, '_img_text', 'field_5f1627ad05bd8'),
(1499, 320, 'img_boy', '328'),
(1500, 320, '_img_boy', 'field_5f1627c405bd9'),
(1501, 320, 'img_arrow_boy', '331'),
(1502, 320, '_img_arrow_boy', 'field_5f1627de05bda'),
(1503, 342, 'titulo_worknos', 'Trabaja con Nosotros'),
(1504, 342, '_titulo_worknos', 'field_5f16274d05bd4'),
(1505, 342, 'texto_worknos', 'Únete a nuestro equipo y trabaja por tus pasiones, porque no hay mayor recompensa que tus ideas realmente importen y puedan hacerse realidad.'),
(1506, 342, '_texto_worknos', 'field_5f16275905bd5'),
(1507, 342, 'img_girl', '326'),
(1508, 342, '_img_girl', 'field_5f16276005bd6'),
(1509, 342, 'img_arrow', '332'),
(1510, 342, '_img_arrow', 'field_5f16278d05bd7'),
(1511, 342, 'img_text', ''),
(1512, 342, '_img_text', 'field_5f1627ad05bd8'),
(1513, 342, 'img_boy', '328'),
(1514, 342, '_img_boy', 'field_5f1627c405bd9'),
(1515, 342, 'img_arrow_boy', '331'),
(1516, 342, '_img_arrow_boy', 'field_5f1627de05bda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_posts`
--

CREATE TABLE `al_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_posts`
--

INSERT INTO `al_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-06-22 18:55:46', '2020-06-22 16:55:46', '<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Edítala o bórrala, ¡luego empieza a escribir!</p>\n<!-- /wp:paragraph -->', '¡Hola, mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2020-06-22 18:55:46', '2020-06-22 16:55:46', '', 0, 'http://dev.almango.com/?p=1', 0, 'post', '', 1),
(2, 1, '2020-06-22 18:55:46', '2020-06-22 16:55:46', '<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo. Es diferente a una entrada del blog porque permanecerá en un solo lugar y aparecerá en la navegación de tu sitio (en la mayoría de los temas). La mayoría de las personas comienzan con una página «Acerca de» que les presenta a los visitantes potenciales del sitio. Podrías decir algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>¡Bienvenido! Soy camarero de día, aspirante a actor de noche y esta es mi web. Vivo en Mairena del Alcor, tengo un perro que se llama Firulais y me gusta el rebujito. (Y las tardes largas con café).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>…o algo así:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La empresa «Mariscos Recio» fue fundada por Antonio Recio Mata. Empezó siendo una pequeña empresa que suministraba marisco a hoteles y restaurantes, pero poco a poco se ha ido transformando en un gran imperio. Mariscos Recio, el mar al mejor precio.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, deberías ir a <a href=\"http://dev.almango.com/wp-admin/\">tu escritorio</a> para borrar esta página y crear nuevas páginas para tu contenido. ¡Pásalo bien!</p>\n<!-- /wp:paragraph -->', 'Página de ejemplo', '', 'publish', 'closed', 'open', '', 'pagina-ejemplo', '', '', '2020-06-22 18:55:46', '2020-06-22 16:55:46', '', 0, 'http://dev.almango.com/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-06-22 18:55:46', '2020-06-22 16:55:46', '<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>La dirección de nuestra web es: http://dev.almango.com.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué datos personales recogemos y por qué los recogemos</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comentarios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Cuando los visitantes dejan comentarios en la web, recopilamos los datos que se muestran en el formulario de comentarios, así como la dirección IP del visitante y la cadena de agentes de usuario del navegador para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Una cadena anónima creada a partir de tu dirección de correo electrónico (también llamada hash) puede ser proporcionada al servicio de Gravatar para ver si la estás usando. La política de privacidad del servicio Gravatar está disponible aquí: https://automattic.com/privacy/. Después de la aprobación de tu comentario, la imagen de tu perfil es visible para el público en el contexto de su comentario.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Medios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si subes imágenes a la web deberías evitar subir imágenes con datos de ubicación (GPS EXIF) incluidos. Los visitantes de la web pueden descargar y extraer cualquier dato de localización de las imágenes de la web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formularios de contacto</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario en nuestro sitio puedes elegir guardar tu nombre, dirección de correo electrónico y web en cookies. Esto es para tu comodidad, para que no tengas que volver a rellenar tus datos cuando dejes otro comentario. Estas cookies tendrán una duración de un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tienes una cuenta y te conectas a este sitio, instalaremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se elimina al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando inicias sesión, también instalaremos varias cookies para guardar tu información de inicio de sesión y tus opciones de visualización de pantalla. Las cookies de inicio de sesión duran dos días, y las cookies de opciones de pantalla duran un año. Si seleccionas &quot;Recordarme&quot;, tu inicio de sesión perdurará durante dos semanas. Si sales de tu cuenta, las cookies de inicio de sesión se eliminarán.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editas o publicas un artículo se guardará una cookie adicional en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID del artículo que acabas de editar. Caduca después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenido incrustado de otros sitios web</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Los artículos de este sitio pueden incluir contenido incrustado (por ejemplo, vídeos, imágenes, artículos, etc.). El contenido incrustado de otras web se comporta exactamente de la misma manera que si el visitante hubiera visitado la otra web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estas web pueden recopilar datos sobre ti, utilizar cookies, incrustar un seguimiento adicional de terceros, y supervisar tu interacción con ese contenido incrustado, incluido el seguimiento de tu interacción con el contenido incrustado si tienes una cuenta y estás conectado a esa web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analítica</h3><!-- /wp:heading --><!-- wp:heading --><h2>Con quién compartimos tus datos</h2><!-- /wp:heading --><!-- wp:heading --><h2>Cuánto tiempo conservamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejas un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar comentarios sucesivos automáticamente en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>De los usuarios que se registran en nuestra web (si los hay), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o eliminar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores de la web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tienes sobre tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si tienes una cuenta o has dejado comentarios en esta web, puedes solicitar recibir un archivo de exportación de los datos personales que tenemos sobre ti, incluyendo cualquier dato que nos hayas proporcionado. También puedes solicitar que eliminemos cualquier dato personal que tengamos sobre ti. Esto no incluye ningún dato que estemos obligados a conservar con fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Dónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Los comentarios de los visitantes puede que los revise un servicio de detección automática de spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Tu información de contacto</h2><!-- /wp:heading --><!-- wp:heading --><h2>Información adicional</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cómo protegemos tus datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué procedimientos utilizamos contra las brechas de datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>De qué terceros recibimos datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué tipo de toma de decisiones automatizada y/o perfilado hacemos con los datos del usuario</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Requerimientos regulatorios de revelación de información del sector</h3><!-- /wp:heading -->', 'Política de privacidad', '', 'draft', 'closed', 'open', '', 'politica-privacidad', '', '', '2020-06-22 18:55:46', '2020-06-22 16:55:46', '', 0, 'http://dev.almango.com/?page_id=3', 0, 'page', '', 0),
(5, 1, '2020-06-22 18:59:43', '2020-06-22 16:59:43', '<div class=\"ref\">[email* correo id:correo placeholder \"Escribe tu correo aquí\"]<button type=\"submit\" class=\"btn btn--morado\">Suscríbirme</button></div>\n1\nAlMango \"[your-subject]\"\nAlMango <wordpress@dev.almango.com>\nfrankdelarosacampos@gmail.com\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on AlMango (http://dev.almango.com)\nReply-To: [your-email]\n\n\n\n\nAlMango \"[your-subject]\"\nAlMango <wordpress@dev.almango.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on AlMango (http://dev.almango.com)\nReply-To: frankdelarosacampos@gmail.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'subscription', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2020-06-23 19:55:14', '2020-06-23 17:55:14', '', 0, 'http://dev.almango.com/?post_type=wpcf7_contact_form&#038;p=5', 0, 'wpcf7_contact_form', '', 0),
(6, 1, '2020-06-22 18:59:44', '2020-06-22 16:59:44', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2020-06-22 18:59:44', '2020-06-22 16:59:44', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(8, 1, '2020-06-22 19:00:53', '2020-06-22 17:00:53', '', 'home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2020-06-30 18:44:21', '2020-06-30 16:44:21', '', 0, 'http://dev.almango.com/?page_id=8', 0, 'page', '', 0),
(9, 1, '2020-06-22 19:00:53', '2020-06-22 17:00:53', '', 'home', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-06-22 19:00:53', '2020-06-22 17:00:53', '', 8, 'http://dev.almango.com/2020/06/22/8-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2020-06-23 00:38:34', '2020-06-22 22:38:34', '', '4371089 - motorcycle transportation', '', 'inherit', 'open', 'closed', '', '4371089-motorcycle-transportation', '', '', '2020-06-23 00:38:34', '2020-06-22 22:38:34', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371089-motorcycle-transportation.png', 0, 'attachment', 'image/png', 0),
(12, 1, '2020-06-23 00:38:35', '2020-06-22 22:38:35', '', '4371089 - motorcycle transportation-1', '', 'inherit', 'open', 'closed', '', '4371089-motorcycle-transportation-1', '', '', '2020-06-23 00:38:35', '2020-06-22 22:38:35', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371089-motorcycle-transportation-1.png', 0, 'attachment', 'image/png', 0),
(13, 1, '2020-06-23 00:38:35', '2020-06-22 22:38:35', '', '4371090 - motorcycle retro scooter transportation', '', 'inherit', 'open', 'closed', '', '4371090-motorcycle-retro-scooter-transportation', '', '', '2020-06-23 00:38:35', '2020-06-22 22:38:35', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371090-motorcycle-retro-scooter-transportation.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2020-06-23 00:38:36', '2020-06-22 22:38:36', '', '4371090 - motorcycle retro scooter transportation-1', '', 'inherit', 'open', 'closed', '', '4371090-motorcycle-retro-scooter-transportation-1', '', '', '2020-06-23 00:38:36', '2020-06-22 22:38:36', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371090-motorcycle-retro-scooter-transportation-1.png', 0, 'attachment', 'image/png', 0),
(15, 1, '2020-06-23 00:38:36', '2020-06-22 22:38:36', '', '4371095 - motorcycle transportation', '', 'inherit', 'open', 'closed', '', '4371095-motorcycle-transportation', '', '', '2020-06-23 00:38:36', '2020-06-22 22:38:36', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371095-motorcycle-transportation.png', 0, 'attachment', 'image/png', 0),
(16, 1, '2020-06-23 00:38:37', '2020-06-22 22:38:37', '', '4371096 - motorcycle transportation', '', 'inherit', 'open', 'closed', '', '4371096-motorcycle-transportation', '', '', '2020-06-23 00:38:37', '2020-06-22 22:38:37', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371096-motorcycle-transportation.png', 0, 'attachment', 'image/png', 0),
(17, 1, '2020-06-23 00:38:37', '2020-06-22 22:38:37', '', '4371096 - motorcycle transportation-1', '', 'inherit', 'open', 'closed', '', '4371096-motorcycle-transportation-1', '', '', '2020-06-23 00:38:37', '2020-06-22 22:38:37', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371096-motorcycle-transportation-1.png', 0, 'attachment', 'image/png', 0),
(18, 1, '2020-06-23 00:38:38', '2020-06-22 22:38:38', '', '4674604 - biker motorcycle retro transportation vehicle', '', 'inherit', 'open', 'closed', '', '4674604-biker-motorcycle-retro-transportation-vehicle', '', '', '2020-06-23 00:38:38', '2020-06-22 22:38:38', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4674604-biker-motorcycle-retro-transportation-vehicle.png', 0, 'attachment', 'image/png', 0),
(19, 1, '2020-06-23 00:38:38', '2020-06-22 22:38:38', '', '4371085 - motorcycle transportation', '', 'inherit', 'open', 'closed', '', '4371085-motorcycle-transportation', '', '', '2020-06-23 00:38:38', '2020-06-22 22:38:38', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371085-motorcycle-transportation.png', 0, 'attachment', 'image/png', 0),
(20, 1, '2020-06-23 00:38:39', '2020-06-22 22:38:39', '', '4371086 - motorcycle transportation', '', 'inherit', 'open', 'closed', '', '4371086-motorcycle-transportation', '', '', '2020-06-23 00:38:39', '2020-06-22 22:38:39', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/4371086-motorcycle-transportation.png', 0, 'attachment', 'image/png', 0),
(21, 1, '2020-06-23 00:49:39', '2020-06-22 22:49:39', '', 'honda_png', '', 'inherit', 'open', 'closed', '', 'honda_png', '', '', '2020-06-23 00:49:39', '2020-06-22 22:49:39', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/honda_png.png', 0, 'attachment', 'image/png', 0),
(22, 1, '2020-06-23 00:49:40', '2020-06-22 22:49:40', '', 'Italika-logo', '', 'inherit', 'open', 'closed', '', 'italika-logo', '', '', '2020-06-23 00:49:40', '2020-06-22 22:49:40', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Italika-logo.png', 0, 'attachment', 'image/png', 0),
(23, 1, '2020-06-23 04:23:59', '2020-06-23 02:23:59', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:11:\"acf-options\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'options', 'options', 'publish', 'closed', 'closed', '', 'group_5ef167b665448', '', '', '2020-07-15 08:06:33', '2020-07-15 06:06:33', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=23', 0, 'acf-field-group', '', 0),
(24, 1, '2020-06-23 04:33:57', '2020-06-23 02:33:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'logo', 'logo', 'publish', 'closed', 'closed', '', 'field_5ef169d12428c', '', '', '2020-06-23 04:33:57', '2020-06-23 02:33:57', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=24', 0, 'acf-field', '', 0),
(25, 1, '2020-06-23 04:33:57', '2020-06-23 02:33:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'subscription_title', 'subscription_title', 'publish', 'closed', 'closed', '', 'field_5ef169da2428d', '', '', '2020-06-23 04:33:57', '2020-06-23 02:33:57', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=25', 1, 'acf-field', '', 0),
(26, 1, '2020-06-23 04:33:57', '2020-06-23 02:33:57', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'social', 'social', 'publish', 'closed', 'closed', '', 'field_5ef169e82428e', '', '', '2020-06-23 04:33:57', '2020-06-23 02:33:57', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=26', 2, 'acf-field', '', 0),
(27, 1, '2020-06-23 04:33:57', '2020-06-23 02:33:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'link', 'link', 'publish', 'closed', 'closed', '', 'field_5ef169ff2428f', '', '', '2020-06-23 04:33:57', '2020-06-23 02:33:57', '', 26, 'http://dev.almango.com/?post_type=acf-field&p=27', 0, 'acf-field', '', 0),
(28, 1, '2020-06-23 04:33:57', '2020-06-23 02:33:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img', 'img', 'publish', 'closed', 'closed', '', 'field_5ef16a0824290', '', '', '2020-06-23 04:33:57', '2020-06-23 02:33:57', '', 26, 'http://dev.almango.com/?post_type=acf-field&p=28', 1, 'acf-field', '', 0),
(29, 1, '2020-06-23 04:35:29', '2020-06-23 02:35:29', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'conocenos_menu', 'conocenos_menu', 'publish', 'closed', 'closed', '', 'field_5ef16a46bad64', '', '', '2020-06-23 04:35:29', '2020-06-23 02:35:29', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=29', 3, 'acf-field', '', 0),
(30, 1, '2020-06-23 04:35:29', '2020-06-23 02:35:29', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'servicio_menu', 'servicio_menu', 'publish', 'closed', 'closed', '', 'field_5ef16a5fbad65', '', '', '2020-06-23 04:35:29', '2020-06-23 02:35:29', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=30', 4, 'acf-field', '', 0),
(31, 1, '2020-06-23 04:35:29', '2020-06-23 02:35:29', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'nosotros_menu', 'nosotros_menu', 'publish', 'closed', 'closed', '', 'field_5ef16a67bad66', '', '', '2020-06-23 04:35:29', '2020-06-23 02:35:29', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=31', 5, 'acf-field', '', 0),
(32, 1, '2020-06-23 04:35:29', '2020-06-23 02:35:29', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'legales_menu', 'legales_menu', 'publish', 'closed', 'closed', '', 'field_5ef16a6ebad67', '', '', '2020-06-23 05:12:43', '2020-06-23 03:12:43', '', 23, 'http://dev.almango.com/?post_type=acf-field&#038;p=32', 6, 'acf-field', '', 0),
(33, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:27:\"templates/template-home.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'home', 'home', 'publish', 'closed', 'closed', '', 'group_5ef16a9892c8f', '', '', '2020-06-26 20:00:10', '2020-06-26 18:00:10', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=33', 0, 'acf-field-group', '', 0),
(34, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'init_img', 'init_img', 'publish', 'closed', 'closed', '', 'field_5ef16aa914c71', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=34', 0, 'acf-field', '', 0),
(35, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'init-first-title', 'init-first-title', 'publish', 'closed', 'closed', '', 'field_5ef16ab014c72', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=35', 1, 'acf-field', '', 0),
(36, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'init-title-list', 'init-title-list', 'publish', 'closed', 'closed', '', 'field_5ef16abd14c73', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=36', 2, 'acf-field', '', 0),
(37, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'text', 'text', 'publish', 'closed', 'closed', '', 'field_5ef16acb14c74', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 36, 'http://dev.almango.com/?post_type=acf-field&p=37', 0, 'acf-field', '', 0),
(38, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'init-subtitle', 'init-subtitle', 'publish', 'closed', 'closed', '', 'field_5ef16ad514c75', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=38', 3, 'acf-field', '', 0),
(39, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'init-first-botton-link', 'init-first-botton-link', 'publish', 'closed', 'closed', '', 'field_5ef16ae114c76', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=39', 4, 'acf-field', '', 0),
(40, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'init-first-botton-text', 'init-first-botton-text', 'publish', 'closed', 'closed', '', 'field_5ef16aed14c77', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=40', 5, 'acf-field', '', 0),
(41, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'init-second-botton-link', 'init-second-botton-link', 'publish', 'closed', 'closed', '', 'field_5ef16af714c78', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=41', 6, 'acf-field', '', 0),
(42, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'init-second-botton-text', 'init-second-botton-text', 'publish', 'closed', 'closed', '', 'field_5ef16b0014c79', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=42', 7, 'acf-field', '', 0),
(43, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'banner', 'banner', 'publish', 'closed', 'closed', '', 'field_5ef16b0a14c7a', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=43', 8, 'acf-field', '', 0),
(44, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img', 'img', 'publish', 'closed', 'closed', '', 'field_5ef16b1f14c7b', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 43, 'http://dev.almango.com/?post_type=acf-field&p=44', 0, 'acf-field', '', 0),
(45, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title_estilos', 'title_estilos', 'publish', 'closed', 'closed', '', 'field_5ef16b2814c7c', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=45', 9, 'acf-field', '', 0),
(46, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'banner_publicitario', 'banner_publicitario', 'publish', 'closed', 'closed', '', 'field_5ef16b3714c7d', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=46', 10, 'acf-field', '', 0),
(47, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img', 'img', 'publish', 'closed', 'closed', '', 'field_5ef16b4c14c7e', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 46, 'http://dev.almango.com/?post_type=acf-field&p=47', 0, 'acf-field', '', 0),
(48, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title_marcas', 'title_marcas', 'publish', 'closed', 'closed', '', 'field_5ef16b5514c7f', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=48', 11, 'acf-field', '', 0),
(49, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title_destacados', 'title_destacados', 'publish', 'closed', 'closed', '', 'field_5ef16b6714c80', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=49', 12, 'acf-field', '', 0),
(50, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'products_featureds', 'products_featureds', 'publish', 'closed', 'closed', '', 'field_5ef16b7614c81', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=50', 13, 'acf-field', '', 0),
(51, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'banner_solid', 'banner_solid', 'publish', 'closed', 'closed', '', 'field_5ef16b8814c82', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 50, 'http://dev.almango.com/?post_type=acf-field&p=51', 0, 'acf-field', '', 0),
(52, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:7:\"product\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}', 'id', 'id', 'publish', 'closed', 'closed', '', 'field_5ef16b9214c83', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 50, 'http://dev.almango.com/?post_type=acf-field&p=52', 1, 'acf-field', '', 0),
(53, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'banner_publicitario_num_one', 'banner_publicitario_num_one', 'publish', 'closed', 'closed', '', 'field_5ef16ba114c84', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=53', 14, 'acf-field', '', 0),
(54, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'descuentos_title', 'descuentos_title', 'publish', 'closed', 'closed', '', 'field_5ef16c8814c85', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=54', 15, 'acf-field', '', 0),
(55, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'descuentos_subtitle', 'descuentos_subtitle', 'publish', 'closed', 'closed', '', 'field_5ef16c9714c86', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=55', 16, 'acf-field', '', 0),
(56, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'prometemos_title', 'prometemos_title', 'publish', 'closed', 'closed', '', 'field_5ef16c9e14c87', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=56', 17, 'acf-field', '', 0),
(57, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'promesas_list', 'promesas_list', 'publish', 'closed', 'closed', '', 'field_5ef16caa14c88', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=57', 18, 'acf-field', '', 0),
(58, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5ef16cbb14c89', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 57, 'http://dev.almango.com/?post_type=acf-field&p=58', 0, 'acf-field', '', 0),
(59, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5ef16cc414c8a', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 57, 'http://dev.almango.com/?post_type=acf-field&p=59', 1, 'acf-field', '', 0),
(60, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'text', 'text', 'publish', 'closed', 'closed', '', 'field_5ef16cc914c8b', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 57, 'http://dev.almango.com/?post_type=acf-field&p=60', 2, 'acf-field', '', 0),
(61, 1, '2020-06-23 04:45:57', '2020-06-23 02:45:57', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'aceptamos_title', 'aceptamos_title', 'publish', 'closed', 'closed', '', 'field_5ef16cd214c8c', '', '', '2020-06-23 04:45:57', '2020-06-23 02:45:57', '', 33, 'http://dev.almango.com/?post_type=acf-field&p=61', 19, 'acf-field', '', 0),
(62, 1, '2020-06-23 04:51:00', '2020-06-23 02:51:00', '', 'Cub', '', 'inherit', 'open', 'closed', '', 'cub', '', '', '2020-06-23 04:51:00', '2020-06-23 02:51:00', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Cub.png', 0, 'attachment', 'image/png', 0),
(63, 1, '2020-06-23 04:51:00', '2020-06-23 02:51:00', '', 'Custom', '', 'inherit', 'open', 'closed', '', 'custom', '', '', '2020-06-23 04:51:00', '2020-06-23 02:51:00', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Custom.png', 0, 'attachment', 'image/png', 0),
(64, 1, '2020-06-23 04:51:01', '2020-06-23 02:51:01', '', 'Dax', '', 'inherit', 'open', 'closed', '', 'dax', '', '', '2020-06-23 04:51:01', '2020-06-23 02:51:01', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Dax.png', 0, 'attachment', 'image/png', 0),
(65, 1, '2020-06-23 04:51:01', '2020-06-23 02:51:01', '', 'Deportivo', '', 'inherit', 'open', 'closed', '', 'deportivo', '', '', '2020-06-23 04:51:01', '2020-06-23 02:51:01', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Deportivo.png', 0, 'attachment', 'image/png', 0),
(66, 1, '2020-06-23 04:51:02', '2020-06-23 02:51:02', '', 'Doble Proposito', '', 'inherit', 'open', 'closed', '', 'doble-proposito', '', '', '2020-06-23 04:51:02', '2020-06-23 02:51:02', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Doble-Proposito.png', 0, 'attachment', 'image/png', 0),
(67, 1, '2020-06-23 04:51:03', '2020-06-23 02:51:03', '', 'enduro', '', 'inherit', 'open', 'closed', '', 'enduro', '', '', '2020-06-23 04:51:03', '2020-06-23 02:51:03', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/enduro.png', 0, 'attachment', 'image/png', 0),
(68, 1, '2020-06-23 04:51:03', '2020-06-23 02:51:03', '', 'Maxi Scooter', '', 'inherit', 'open', 'closed', '', 'maxi-scooter', '', '', '2020-06-23 04:51:03', '2020-06-23 02:51:03', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Maxi-Scooter.png', 0, 'attachment', 'image/png', 0),
(69, 1, '2020-06-23 04:51:04', '2020-06-23 02:51:04', '', 'MOTO COMPETITION', '', 'inherit', 'open', 'closed', '', 'moto-competition', '', '', '2020-06-23 04:51:04', '2020-06-23 02:51:04', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-COMPETITION.png', 0, 'attachment', 'image/png', 0),
(70, 1, '2020-06-23 04:51:04', '2020-06-23 02:51:04', '', 'MOTO HERITAGE', '', 'inherit', 'open', 'closed', '', 'moto-heritage', '', '', '2020-06-23 04:51:04', '2020-06-23 02:51:04', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-HERITAGE.png', 0, 'attachment', 'image/png', 0),
(71, 1, '2020-06-23 04:51:04', '2020-06-23 02:51:04', '', 'MOTO PRACTICE', '', 'inherit', 'open', 'closed', '', 'moto-practice', '', '', '2020-06-23 04:51:04', '2020-06-23 02:51:04', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-PRACTICE.png', 0, 'attachment', 'image/png', 0),
(72, 1, '2020-06-23 04:51:05', '2020-06-23 02:51:05', '', 'MOTO SPEED', '', 'inherit', 'open', 'closed', '', 'moto-speed', '', '', '2020-06-23 04:51:05', '2020-06-23 02:51:05', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-SPEED.png', 0, 'attachment', 'image/png', 0),
(73, 1, '2020-06-23 04:51:05', '2020-06-23 02:51:05', '', 'MOTO STREET', '', 'inherit', 'open', 'closed', '', 'moto-street', '', '', '2020-06-23 04:51:05', '2020-06-23 02:51:05', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-STREET.png', 0, 'attachment', 'image/png', 0),
(74, 1, '2020-06-23 04:51:06', '2020-06-23 02:51:06', '', 'MOTO TOUR', '', 'inherit', 'open', 'closed', '', 'moto-tour', '', '', '2020-06-23 04:51:06', '2020-06-23 02:51:06', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-TOUR.png', 0, 'attachment', 'image/png', 0),
(75, 1, '2020-06-23 04:51:06', '2020-06-23 02:51:06', '', 'MOTO TRAIL', '', 'inherit', 'open', 'closed', '', 'moto-trail', '', '', '2020-06-23 04:51:06', '2020-06-23 02:51:06', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-TRAIL.png', 0, 'attachment', 'image/png', 0),
(76, 1, '2020-06-23 04:51:07', '2020-06-23 02:51:07', '', 'MOTO URBAN', '', 'inherit', 'open', 'closed', '', 'moto-urban', '', '', '2020-06-23 04:51:07', '2020-06-23 02:51:07', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/MOTO-URBAN.png', 0, 'attachment', 'image/png', 0),
(77, 1, '2020-06-23 04:51:07', '2020-06-23 02:51:07', '', 'bobber', '', 'inherit', 'open', 'closed', '', 'bobber', '', '', '2020-06-23 04:51:07', '2020-06-23 02:51:07', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/bobber.png', 0, 'attachment', 'image/png', 0),
(78, 1, '2020-06-23 04:51:08', '2020-06-23 02:51:08', '', 'Cafe racer', '', 'inherit', 'open', 'closed', '', 'cafe-racer', '', '', '2020-06-23 04:51:08', '2020-06-23 02:51:08', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Cafe-racer.png', 0, 'attachment', 'image/png', 0),
(79, 1, '2020-06-23 04:51:08', '2020-06-23 02:51:08', '', 'chopper', '', 'inherit', 'open', 'closed', '', 'chopper', '', '', '2020-06-23 04:51:08', '2020-06-23 02:51:08', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/chopper.png', 0, 'attachment', 'image/png', 0),
(80, 1, '2020-06-23 04:51:09', '2020-06-23 02:51:09', '', 'cross', '', 'inherit', 'open', 'closed', '', 'cross', '', '', '2020-06-23 04:51:09', '2020-06-23 02:51:09', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/cross.png', 0, 'attachment', 'image/png', 0),
(81, 1, '2020-06-23 04:51:09', '2020-06-23 02:51:09', '', 'Cruiser', '', 'inherit', 'open', 'closed', '', 'cruiser', '', '', '2020-06-23 04:51:09', '2020-06-23 02:51:09', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/Cruiser.png', 0, 'attachment', 'image/png', 0),
(82, 1, '2020-06-23 04:59:58', '2020-06-23 02:59:58', '', '2476614', '', 'inherit', 'open', 'closed', '', '2476614', '', '', '2020-06-23 04:59:58', '2020-06-23 02:59:58', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/2476614.png', 0, 'attachment', 'image/png', 0),
(83, 1, '2020-06-23 05:01:41', '2020-06-23 03:01:41', '', '28D5F4AA-A765-4A1F-8BFC-F354EA927F10', '', 'inherit', 'open', 'closed', '', '28d5f4aa-a765-4a1f-8bfc-f354ea927f10', '', '', '2020-06-23 05:01:41', '2020-06-23 03:01:41', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/28D5F4AA-A765-4A1F-8BFC-F354EA927F10.png', 0, 'attachment', 'image/png', 0),
(84, 1, '2020-06-23 05:01:42', '2020-06-23 03:01:42', '', '11424', '', 'inherit', 'open', 'closed', '', '11424', '', '', '2020-06-23 05:01:42', '2020-06-23 03:01:42', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/11424.png', 0, 'attachment', 'image/png', 0),
(85, 1, '2020-06-23 05:01:43', '2020-06-23 03:01:43', '', 'AnrEX55', '', 'inherit', 'open', 'closed', '', 'anrex55', '', '', '2020-06-23 05:01:43', '2020-06-23 03:01:43', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/AnrEX55.png', 0, 'attachment', 'image/png', 0),
(86, 1, '2020-06-23 05:01:44', '2020-06-23 03:01:44', '', 'apreton-de-manos', '', 'inherit', 'open', 'closed', '', 'apreton-de-manos', '', '', '2020-06-23 05:01:44', '2020-06-23 03:01:44', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/apreton-de-manos.png', 0, 'attachment', 'image/png', 0),
(87, 1, '2020-06-23 05:01:44', '2020-06-23 03:01:44', '', 'cliente', '', 'inherit', 'open', 'closed', '', 'cliente', '', '', '2020-06-23 05:01:44', '2020-06-23 03:01:44', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/cliente.png', 0, 'attachment', 'image/png', 0),
(88, 1, '2020-06-23 05:01:45', '2020-06-23 03:01:45', '', 'negocios-y-finanzas', '', 'inherit', 'open', 'closed', '', 'negocios-y-finanzas', '', '', '2020-06-23 05:01:45', '2020-06-23 03:01:45', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/negocios-y-finanzas.png', 0, 'attachment', 'image/png', 0),
(89, 1, '2020-06-23 05:01:46', '2020-06-23 03:01:46', '', 'peru', '', 'inherit', 'open', 'closed', '', 'peru', '', '', '2020-06-23 05:01:46', '2020-06-23 03:01:46', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/peru.png', 0, 'attachment', 'image/png', 0),
(90, 1, '2020-06-23 05:01:46', '2020-06-23 03:01:46', '', 'proximo', '', 'inherit', 'open', 'closed', '', 'proximo', '', '', '2020-06-23 05:01:46', '2020-06-23 03:01:46', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/proximo.png', 0, 'attachment', 'image/png', 0),
(91, 1, '2020-06-23 05:01:47', '2020-06-23 03:01:47', '', 'proximo-1', '', 'inherit', 'open', 'closed', '', 'proximo-1', '', '', '2020-06-23 05:01:47', '2020-06-23 03:01:47', '', 8, 'http://dev.almango.com/wp-content/uploads/2020/06/proximo-1.png', 0, 'attachment', 'image/png', 0);
INSERT INTO `al_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(92, 1, '2020-06-23 05:02:50', '2020-06-23 03:02:50', '', 'home', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-06-23 05:02:50', '2020-06-23 03:02:50', '', 8, 'http://dev.almango.com/8-revision-v1/', 0, 'revision', '', 0),
(93, 1, '2020-06-23 05:04:44', '2020-06-23 03:04:44', 'Moto Honda, Estilo Bobber', 'GSX-R1000-A', '', 'publish', 'open', 'closed', '', 'gsx-r1000-a', '', '', '2020-07-15 00:42:38', '2020-07-14 22:42:38', '', 0, 'http://dev.almango.com/?post_type=product&#038;p=93', 0, 'product', '', 0),
(94, 1, '2020-06-23 05:05:33', '2020-06-23 03:05:33', '', 'unnamed', '', 'inherit', 'open', 'closed', '', 'unnamed', '', '', '2020-06-23 05:05:33', '2020-06-23 03:05:33', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/unnamed.png', 0, 'attachment', 'image/png', 0),
(95, 1, '2020-06-23 05:07:47', '2020-06-23 03:07:47', '', 'home', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-06-23 05:07:47', '2020-06-23 03:07:47', '', 8, 'http://dev.almango.com/8-revision-v1/', 0, 'revision', '', 0),
(96, 1, '2020-06-23 05:08:22', '2020-06-23 03:08:22', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2020-06-23 05:08:22', '2020-06-23 03:08:22', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/logo.png', 0, 'attachment', 'image/png', 0),
(97, 1, '2020-06-23 05:09:15', '2020-06-23 03:09:15', '', 'social-media', '', 'inherit', 'open', 'closed', '', 'social-media', '', '', '2020-06-23 05:09:15', '2020-06-23 03:09:15', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/social-media.png', 0, 'attachment', 'image/png', 0),
(98, 1, '2020-06-23 05:09:16', '2020-06-23 03:09:16', '', 'social-media (1)', '', 'inherit', 'open', 'closed', '', 'social-media-1', '', '', '2020-06-23 05:09:16', '2020-06-23 03:09:16', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/social-media-1.png', 0, 'attachment', 'image/png', 0),
(99, 1, '2020-06-23 05:09:16', '2020-06-23 03:09:16', '', 'social-media (6)', '', 'inherit', 'open', 'closed', '', 'social-media-6', '', '', '2020-06-23 05:09:16', '2020-06-23 03:09:16', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/social-media-6.png', 0, 'attachment', 'image/png', 0),
(100, 1, '2020-06-23 05:09:17', '2020-06-23 03:09:17', '', 'social-media (8)', '', 'inherit', 'open', 'closed', '', 'social-media-8', '', '', '2020-06-23 05:09:17', '2020-06-23 03:09:17', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/social-media-8.png', 0, 'attachment', 'image/png', 0),
(104, 1, '2020-06-23 05:14:22', '2020-06-23 03:14:22', '', 'CONTÁCTANOS', '', 'publish', 'closed', 'closed', '', 'contactanos', '', '', '2020-07-02 18:31:37', '2020-07-02 16:31:37', '', 0, 'http://dev.almango.com/?p=104', 3, 'nav_menu_item', '', 0),
(105, 1, '2020-06-23 17:29:17', '2020-06-23 15:29:17', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'background_banner', 'background_banner', 'publish', 'closed', 'closed', '', 'field_5ef21fc8e30de', '', '', '2020-06-23 17:29:17', '2020-06-23 15:29:17', '', 50, 'http://dev.almango.com/?post_type=acf-field&p=105', 2, 'acf-field', '', 0),
(106, 1, '2020-06-23 17:39:57', '2020-06-23 15:39:57', '', 'home', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-06-23 17:39:57', '2020-06-23 15:39:57', '', 8, 'http://dev.almango.com/8-revision-v1/', 0, 'revision', '', 0),
(107, 1, '2020-06-23 21:28:53', '0000-00-00 00:00:00', '', 'tienda', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-23 21:28:53', '2020-06-23 19:28:53', '', 0, 'http://dev.almango.com/?page_id=107', 0, 'page', '', 0),
(108, 1, '2020-06-23 21:29:21', '2020-06-23 19:29:21', '', 'Tienda', '', 'publish', 'closed', 'closed', '', 'shop', '', '', '2020-06-27 00:43:38', '2020-06-26 22:43:38', '', 0, 'http://dev.almango.com/shop/', 0, 'page', '', 0),
(109, 1, '2020-06-23 21:29:21', '2020-06-23 19:29:21', '<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2020-06-23 21:29:21', '2020-06-23 19:29:21', '', 0, 'http://dev.almango.com/cart/', 0, 'page', '', 0),
(110, 1, '2020-06-23 21:29:21', '2020-06-23 19:29:21', '<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2020-06-23 21:29:21', '2020-06-23 19:29:21', '', 0, 'http://dev.almango.com/checkout/', 0, 'page', '', 0),
(111, 1, '2020-06-23 21:29:21', '2020-06-23 19:29:21', '<!-- wp:shortcode -->\r\n<p>[woocommerce_my_account]</p>\r\n<!-- /wp:shortcode -->', 'My account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2020-07-02 04:12:21', '2020-07-02 02:12:21', '', 0, 'http://dev.almango.com/my-account/', 0, 'page', '', 0),
(113, 1, '2020-06-26 19:57:17', '2020-06-26 17:57:17', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:8:\"taxonomy\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:11:\"product_cat\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'taxonomy brands', 'taxonomy-brands', 'publish', 'closed', 'closed', '', 'group_5ef6369452513', '', '', '2020-06-26 22:09:33', '2020-06-26 20:09:33', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=113', 0, 'acf-field-group', '', 0),
(114, 1, '2020-06-26 19:57:17', '2020-06-26 17:57:17', 'a:10:{s:4:\"type\";s:9:\"page_link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"page\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:14:\"allow_archives\";i:1;s:8:\"multiple\";i:0;}', 'page', 'page', 'publish', 'closed', 'closed', '', 'field_5ef6369a3831e', '', '', '2020-06-26 19:57:17', '2020-06-26 17:57:17', '', 113, 'http://dev.almango.com/?post_type=acf-field&p=114', 0, 'acf-field', '', 0),
(115, 1, '2020-06-26 19:58:23', '2020-06-26 17:58:23', '', 'Harley Davinson', '', 'publish', 'closed', 'closed', '', 'harley-davinson', '', '', '2020-06-26 23:10:14', '2020-06-26 21:10:14', '', 0, 'http://dev.almango.com/?page_id=115', 0, 'page', '', 0),
(116, 1, '2020-06-26 19:58:23', '2020-06-26 17:58:23', '', 'Harley Davinson', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2020-06-26 19:58:23', '2020-06-26 17:58:23', '', 115, 'http://dev.almango.com/115-revision-v1/', 0, 'revision', '', 0),
(117, 1, '2020-06-26 22:12:12', '2020-06-26 20:12:12', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:29:\"templates/template-brands.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'brands page', 'brands-page', 'publish', 'closed', 'closed', '', 'group_5ef65653ee0c9', '', '', '2020-06-26 22:52:40', '2020-06-26 20:52:40', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=117', 0, 'acf-field-group', '', 0),
(118, 1, '2020-06-26 22:12:12', '2020-06-26 20:12:12', 'a:13:{s:4:\"type\";s:8:\"taxonomy\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:8:\"taxonomy\";s:11:\"product_cat\";s:10:\"field_type\";s:8:\"checkbox\";s:8:\"add_term\";i:1;s:10:\"save_terms\";i:0;s:10:\"load_terms\";i:0;s:13:\"return_format\";s:2:\"id\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;}', 'marca', 'marca', 'publish', 'closed', 'closed', '', 'field_5ef656588e0e7', '', '', '2020-06-26 22:52:40', '2020-06-26 20:52:40', '', 117, 'http://dev.almango.com/?post_type=acf-field&#038;p=118', 0, 'acf-field', '', 0),
(119, 1, '2020-06-26 22:12:12', '2020-06-26 20:12:12', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'resumen', 'resumen', 'publish', 'closed', 'closed', '', 'field_5ef656748e0e8', '', '', '2020-06-26 22:12:12', '2020-06-26 20:12:12', '', 117, 'http://dev.almango.com/?post_type=acf-field&p=119', 1, 'acf-field', '', 0),
(120, 1, '2020-06-26 22:12:12', '2020-06-26 20:12:12', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'imagesswiper', 'imagesswiper', 'publish', 'closed', 'closed', '', 'field_5ef6567e8e0e9', '', '', '2020-06-26 22:12:12', '2020-06-26 20:12:12', '', 117, 'http://dev.almango.com/?post_type=acf-field&p=120', 2, 'acf-field', '', 0),
(121, 1, '2020-06-26 22:12:12', '2020-06-26 20:12:12', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img', 'img', 'publish', 'closed', 'closed', '', 'field_5ef6568d8e0ea', '', '', '2020-06-26 22:12:12', '2020-06-26 20:12:12', '', 120, 'http://dev.almango.com/?post_type=acf-field&p=121', 0, 'acf-field', '', 0),
(122, 1, '2020-06-26 22:15:05', '2020-06-26 20:15:05', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:19:\"Motos seleccionadas\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'motos', 'motos', 'publish', 'closed', 'closed', '', 'field_5ef6571a72cc6', '', '', '2020-06-26 22:15:05', '2020-06-26 20:15:05', '', 117, 'http://dev.almango.com/?post_type=acf-field&p=122', 3, 'acf-field', '', 0),
(123, 1, '2020-06-26 22:15:05', '2020-06-26 20:15:05', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:7:\"product\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}', 'id', 'id', 'publish', 'closed', 'closed', '', 'field_5ef6572872cc7', '', '', '2020-06-26 22:15:05', '2020-06-26 20:15:05', '', 122, 'http://dev.almango.com/?post_type=acf-field&p=123', 0, 'acf-field', '', 0),
(124, 1, '2020-06-26 22:16:24', '2020-06-26 20:16:24', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'banner-lineal', 'banner-lineal', 'publish', 'closed', 'closed', '', 'field_5ef6576dea90f', '', '', '2020-06-26 22:16:24', '2020-06-26 20:16:24', '', 117, 'http://dev.almango.com/?post_type=acf-field&p=124', 4, 'acf-field', '', 0),
(125, 1, '2020-06-26 22:39:16', '2020-06-26 20:39:16', '', 'bujia-png-2', '', 'inherit', 'open', 'closed', '', 'bujia-png-2', '', '', '2020-06-26 22:39:16', '2020-06-26 20:39:16', '', 115, 'http://dev.almango.com/wp-content/uploads/2020/06/bujia-png-2.png', 0, 'attachment', 'image/png', 0),
(126, 1, '2020-06-26 22:39:17', '2020-06-26 20:39:17', '', 'harley-davidson-4129835_1920', '', 'inherit', 'open', 'closed', '', 'harley-davidson-4129835_1920', '', '', '2020-06-26 22:39:17', '2020-06-26 20:39:17', '', 115, 'http://dev.almango.com/wp-content/uploads/2020/06/harley-davidson-4129835_1920.png', 0, 'attachment', 'image/png', 0),
(127, 1, '2020-06-26 22:39:19', '2020-06-26 20:39:19', '', 'motorcycle-2268518_1920', '', 'inherit', 'open', 'closed', '', 'motorcycle-2268518_1920', '', '', '2020-06-26 22:39:19', '2020-06-26 20:39:19', '', 115, 'http://dev.almango.com/wp-content/uploads/2020/06/motorcycle-2268518_1920.png', 0, 'attachment', 'image/png', 0),
(128, 1, '2020-06-26 22:43:38', '2020-06-26 20:43:38', '', 'Harley Davinson', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2020-06-26 22:43:38', '2020-06-26 20:43:38', '', 115, 'http://dev.almango.com/115-revision-v1/', 0, 'revision', '', 0),
(129, 1, '2020-06-26 23:10:14', '2020-06-26 21:10:14', '', 'Harley Davinson', '', 'inherit', 'closed', 'closed', '', '115-revision-v1', '', '', '2020-06-26 23:10:14', '2020-06-26 21:10:14', '', 115, 'http://dev.almango.com/115-revision-v1/', 0, 'revision', '', 0),
(130, 1, '2020-06-26 23:10:37', '2020-06-26 21:10:37', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"product\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'products', 'products', 'publish', 'closed', 'closed', '', 'group_5efc2e02ba9ea', '', '', '2020-07-01 09:19:47', '2020-07-01 07:19:47', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=130', 0, 'acf-field-group', '', 0),
(131, 1, '2020-06-26 23:10:37', '2020-06-26 21:10:37', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen_banner', 'imagen_banner', 'publish', 'closed', 'closed', '', 'field_5ef6643f7827f', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=131', 1, 'acf-field', '', 0),
(132, 1, '2020-06-26 23:52:28', '2020-06-26 21:52:28', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'modelo', 'modelo', 'publish', 'closed', 'closed', '', 'field_5ef66e17d812b', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=132', 2, 'acf-field', '', 0),
(133, 1, '2020-06-26 23:54:28', '2020-06-26 21:54:28', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:8:\"taxonomy\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"pa_color\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'color', 'color', 'publish', 'closed', 'closed', '', 'group_5ef66e7c44f75', '', '', '2020-06-26 23:54:28', '2020-06-26 21:54:28', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=133', 0, 'acf-field-group', '', 0),
(134, 1, '2020-06-26 23:54:28', '2020-06-26 21:54:28', 'a:6:{s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";}', 'color', 'color', 'publish', 'closed', 'closed', '', 'field_5ef66e8cbc1a4', '', '', '2020-06-26 23:54:28', '2020-06-26 21:54:28', '', 133, 'http://dev.almango.com/?post_type=acf-field&p=134', 0, 'acf-field', '', 0),
(135, 1, '2020-06-27 00:37:17', '2020-06-26 22:37:17', '', 'TIENDA', '', 'publish', 'closed', 'closed', '', 'tienda-2', '', '', '2020-07-02 18:31:37', '2020-07-02 16:31:37', '', 0, 'http://dev.almango.com/?p=135', 2, 'nav_menu_item', '', 0),
(136, 1, '2020-06-27 00:37:17', '2020-06-26 22:37:17', '', 'INICIO', '', 'publish', 'closed', 'closed', '', 'inicio-2', '', '', '2020-07-02 18:31:37', '2020-07-02 16:31:37', '', 0, 'http://dev.almango.com/?p=136', 1, 'nav_menu_item', '', 0),
(137, 1, '2020-06-27 00:43:38', '2020-06-26 22:43:38', '', 'Tienda', '', 'inherit', 'closed', 'closed', '', '108-revision-v1', '', '', '2020-06-27 00:43:38', '2020-06-26 22:43:38', '', 108, 'http://dev.almango.com/108-revision-v1/', 0, 'revision', '', 0),
(139, 1, '2020-06-27 00:58:46', '2020-06-26 22:58:46', 'Moto Honda, Estilo Bobber', 'GSX-R1000-B', '', 'publish', 'open', 'closed', '', 'gsx-r1000-b', '', '', '2020-07-15 00:42:53', '2020-07-14 22:42:53', '', 0, 'http://dev.almango.com/?post_type=product&#038;p=139', 0, 'product', '', 0),
(140, 1, '2020-06-27 01:12:14', '2020-06-26 23:12:14', '{\n    \"woocommerce_thumbnail_cropping\": {\n        \"value\": \"uncropped\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-06-26 23:11:56\"\n    },\n    \"woocommerce_default_catalog_orderby\": {\n        \"value\": \"price\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-06-26 23:12:14\"\n    },\n    \"woocommerce_catalog_columns\": {\n        \"value\": \"3\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-06-26 23:12:14\"\n    },\n    \"woocommerce_catalog_rows\": {\n        \"value\": \"3\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-06-26 23:12:14\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '71d1e79a-7249-41de-bacb-5db22d04595f', '', '', '2020-06-27 01:12:14', '2020-06-26 23:12:14', '', 0, 'http://dev.almango.com/?p=140', 0, 'customize_changeset', '', 0),
(141, 1, '2020-06-27 02:43:33', '2020-06-27 00:43:33', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:8:\"taxonomy\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:11:\"pa_posicion\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'posicionmanejo', 'posicionmanejo', 'publish', 'closed', 'closed', '', 'group_5ef693afb75e3', '', '', '2020-06-27 02:43:33', '2020-06-27 00:43:33', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=141', 0, 'acf-field-group', '', 0),
(142, 1, '2020-06-27 02:43:33', '2020-06-27 00:43:33', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5ef69606a7623', '', '', '2020-06-27 02:43:33', '2020-06-27 00:43:33', '', 141, 'http://dev.almango.com/?post_type=acf-field&p=142', 0, 'acf-field', '', 0),
(143, 1, '2020-06-27 02:44:00', '2020-06-27 00:44:00', '', 'hechado adelante', '', 'inherit', 'open', 'closed', '', 'hechado-adelante', '', '', '2020-06-27 02:44:00', '2020-06-27 00:44:00', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/hechado-adelante.png', 0, 'attachment', 'image/png', 0),
(144, 1, '2020-06-27 02:44:00', '2020-06-27 00:44:00', '', 'normal', '', 'inherit', 'open', 'closed', '', 'normal', '', '', '2020-06-27 02:44:00', '2020-06-27 00:44:00', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/normal.png', 0, 'attachment', 'image/png', 0),
(145, 1, '2020-06-27 02:44:01', '2020-06-27 00:44:01', '', 'hechado adelante normal', '', 'inherit', 'open', 'closed', '', 'hechado-adelante-normal', '', '', '2020-06-27 02:44:01', '2020-06-27 00:44:01', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/06/hechado-adelante-normal.png', 0, 'attachment', 'image/png', 0),
(146, 1, '2020-06-27 04:01:26', '2020-06-27 02:01:26', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen_background', 'imagen_background', 'publish', 'closed', 'closed', '', 'field_5ef6a809454b6', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=146', 3, 'acf-field', '', 0),
(147, 1, '2020-06-27 04:01:26', '2020-06-27 02:01:26', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'presents', 'presents', 'publish', 'closed', 'closed', '', 'field_5ef6a812454b7', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=147', 5, 'acf-field', '', 0),
(148, 1, '2020-06-27 04:01:26', '2020-06-27 02:01:26', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5ef6a822454b8', '', '', '2020-06-27 04:01:26', '2020-06-27 02:01:26', '', 147, 'http://dev.almango.com/?post_type=acf-field&p=148', 0, 'acf-field', '', 0),
(149, 1, '2020-06-27 04:01:26', '2020-06-27 02:01:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'text', 'text', 'publish', 'closed', 'closed', '', 'field_5ef6a82a454b9', '', '', '2020-06-27 04:01:26', '2020-06-27 02:01:26', '', 147, 'http://dev.almango.com/?post_type=acf-field&p=149', 1, 'acf-field', '', 0),
(150, 1, '2020-06-27 04:01:26', '2020-06-27 02:01:26', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'resumen', 'resumen', 'publish', 'closed', 'closed', '', 'field_5ef6a832454ba', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=150', 7, 'acf-field', '', 0),
(151, 1, '2020-06-27 04:01:49', '2020-06-27 02:01:49', '', 'WhatsApp Image 2020-05-25 at 15.11.18', '', 'inherit', 'open', 'closed', '', 'whatsapp-image-2020-05-25-at-15-11-18', '', '', '2020-06-27 04:01:49', '2020-06-27 02:01:49', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/WhatsApp-Image-2020-05-25-at-15.11.18.png', 0, 'attachment', 'image/png', 0),
(152, 1, '2020-06-27 04:04:37', '2020-06-27 02:04:37', '', 'comercio', '', 'inherit', 'open', 'closed', '', 'comercio', '', '', '2020-06-27 04:04:37', '2020-06-27 02:04:37', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/comercio.png', 0, 'attachment', 'image/png', 0),
(153, 1, '2020-06-27 04:04:38', '2020-06-27 02:04:38', '', 'seguridad', '', 'inherit', 'open', 'closed', '', 'seguridad', '', '', '2020-06-27 04:04:38', '2020-06-27 02:04:38', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/seguridad.png', 0, 'attachment', 'image/png', 0),
(154, 1, '2020-06-27 04:04:38', '2020-06-27 02:04:38', '', '44265', '', 'inherit', 'open', 'closed', '', '44265', '', '', '2020-06-27 04:04:38', '2020-06-27 02:04:38', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/44265.png', 0, 'attachment', 'image/png', 0),
(155, 1, '2020-06-27 04:04:39', '2020-06-27 02:04:39', '', 'bloquear', '', 'inherit', 'open', 'closed', '', 'bloquear', '', '', '2020-06-27 04:04:39', '2020-06-27 02:04:39', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/bloquear.png', 0, 'attachment', 'image/png', 0),
(156, 1, '2020-06-27 04:04:40', '2020-06-27 02:04:40', '', 'bolsa-de-la-compra (1)', '', 'inherit', 'open', 'closed', '', 'bolsa-de-la-compra-1', '', '', '2020-06-27 04:04:40', '2020-06-27 02:04:40', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/bolsa-de-la-compra-1.png', 0, 'attachment', 'image/png', 0),
(157, 1, '2020-06-30 18:44:21', '2020-06-30 16:44:21', '', 'home', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-06-30 18:44:21', '2020-06-30 16:44:21', '', 8, 'http://dev.almango.com/8-revision-v1/', 0, 'revision', '', 0),
(160, 1, '2020-07-01 08:12:36', '2020-07-01 06:12:36', '', '13', '', 'inherit', 'open', 'closed', '', '13', '', '', '2020-07-01 09:18:41', '2020-07-01 07:18:41', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/07/13.png', 0, 'attachment', 'image/png', 0),
(161, 1, '2020-07-01 08:12:37', '2020-07-01 06:12:37', '', 'IMG_0160', '', 'inherit', 'open', 'closed', '', 'img_0160', '', '', '2020-07-01 08:12:37', '2020-07-01 06:12:37', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_0160.png', 0, 'attachment', 'image/png', 0),
(162, 1, '2020-07-01 08:12:39', '2020-07-01 06:12:39', '', 'IMG_9791', '', 'inherit', 'open', 'closed', '', 'img_9791', '', '', '2020-07-01 08:12:39', '2020-07-01 06:12:39', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_9791.png', 0, 'attachment', 'image/png', 0),
(163, 1, '2020-07-01 08:12:41', '2020-07-01 06:12:41', '', 'IMG_9873', '', 'inherit', 'open', 'closed', '', 'img_9873', '', '', '2020-07-01 08:12:41', '2020-07-01 06:12:41', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_9873.png', 0, 'attachment', 'image/png', 0),
(164, 1, '2020-07-01 08:12:43', '2020-07-01 06:12:43', '', 'IMG_9879', '', 'inherit', 'open', 'closed', '', 'img_9879', '', '', '2020-07-01 08:12:43', '2020-07-01 06:12:43', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/IMG_9879.png', 0, 'attachment', 'image/png', 0),
(165, 1, '2020-07-01 08:12:44', '2020-07-01 06:12:44', '', 'LEO', '', 'inherit', 'open', 'closed', '', 'leo', '', '', '2020-07-01 08:12:44', '2020-07-01 06:12:44', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/LEO.png', 0, 'attachment', 'image/png', 0),
(166, 1, '2020-07-01 08:12:46', '2020-07-01 06:12:46', '', '02', '', 'inherit', 'open', 'closed', '', '02', '', '', '2020-07-01 09:18:41', '2020-07-01 07:18:41', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/07/02.png', 0, 'attachment', 'image/png', 0),
(167, 1, '2020-07-01 08:12:47', '2020-07-01 06:12:47', '', '10', '', 'inherit', 'open', 'closed', '', '10', '', '', '2020-07-01 08:12:47', '2020-07-01 06:12:47', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/10.png', 0, 'attachment', 'image/png', 0),
(168, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen_parallax', 'imagen_parallax', 'publish', 'closed', 'closed', '', 'field_5efc29021788c', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=168', 8, 'acf-field', '', 0),
(169, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'ventajas', 'ventajas', 'publish', 'closed', 'closed', '', 'field_5efc29e41788d', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=169', 10, 'acf-field', '', 0),
(170, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'icon', 'icon', 'publish', 'closed', 'closed', '', 'field_5efc2a1917893', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=170', 0, 'acf-field', '', 0),
(171, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"file\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:8:\"min_size\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'video', 'video', 'publish', 'closed', 'closed', '', 'field_5efc29f01788e', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=171', 1, 'acf-field', '', 0),
(172, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5efc29fa1788f', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=172', 2, 'acf-field', '', 0),
(173, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'uptitle', 'uptitle', 'publish', 'closed', 'closed', '', 'field_5efc2a0217890', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=173', 3, 'acf-field', '', 0),
(174, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5efc2a0b17891', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=174', 4, 'acf-field', '', 0),
(175, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'subtitle', 'subtitle', 'publish', 'closed', 'closed', '', 'field_5efc2a1317892', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=175', 5, 'acf-field', '', 0),
(176, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'content', 'content', 'publish', 'closed', 'closed', '', 'field_5efc2a2617894', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 169, 'http://dev.almango.com/?post_type=acf-field&p=176', 6, 'acf-field', '', 0),
(177, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'colores', 'colores', 'publish', 'closed', 'closed', '', 'field_5efc2a2e17895', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=177', 12, 'acf-field', '', 0),
(178, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'background', 'background', 'publish', 'closed', 'closed', '', 'field_5efc2ae417896', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 177, 'http://dev.almango.com/?post_type=acf-field&p=178', 0, 'acf-field', '', 0),
(179, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', '360_image', '360_image', 'publish', 'closed', 'closed', '', 'field_5efc2aec17897', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 177, 'http://dev.almango.com/?post_type=acf-field&p=179', 1, 'acf-field', '', 0),
(180, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5efc2af617898', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 177, 'http://dev.almango.com/?post_type=acf-field&p=180', 2, 'acf-field', '', 0),
(181, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:6:{s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";}', 'color', 'color', 'publish', 'closed', 'closed', '', 'field_5efc2b0117899', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 177, 'http://dev.almango.com/?post_type=acf-field&p=181', 3, 'acf-field', '', 0),
(182, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'text', 'text', 'publish', 'closed', 'closed', '', 'field_5efc2b0a1789a', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 177, 'http://dev.almango.com/?post_type=acf-field&p=182', 4, 'acf-field', '', 0),
(183, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'parts', 'parts', 'publish', 'closed', 'closed', '', 'field_5efc2b451789b', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=183', 14, 'acf-field', '', 0),
(184, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'icon', 'icon', 'publish', 'closed', 'closed', '', 'field_5efc2b7b178a1', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 183, 'http://dev.almango.com/?post_type=acf-field&p=184', 0, 'acf-field', '', 0),
(185, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"file\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:8:\"min_size\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'video', 'video', 'publish', 'closed', 'closed', '', 'field_5efc2b4d1789c', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 183, 'http://dev.almango.com/?post_type=acf-field&p=185', 1, 'acf-field', '', 0),
(186, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5efc2b551789d', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 183, 'http://dev.almango.com/?post_type=acf-field&p=186', 2, 'acf-field', '', 0),
(187, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5efc2b5f1789e', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 183, 'http://dev.almango.com/?post_type=acf-field&p=187', 3, 'acf-field', '', 0),
(188, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'list', 'list', 'publish', 'closed', 'closed', '', 'field_5efc2b651789f', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 183, 'http://dev.almango.com/?post_type=acf-field&p=188', 4, 'acf-field', '', 0),
(189, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen_parallax_2', 'imagen_parallax_2', 'publish', 'closed', 'closed', '', 'field_5efc2b86178a2', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=189', 15, 'acf-field', '', 0),
(190, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'trans', 'trans', 'publish', 'closed', 'closed', '', 'field_5efc2b91178a3', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&#038;p=190', 16, 'acf-field', '', 0),
(191, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'icon', 'icon', 'publish', 'closed', 'closed', '', 'field_5efc2c02178ad', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 190, 'http://dev.almango.com/?post_type=acf-field&p=191', 0, 'acf-field', '', 0),
(192, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"file\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:8:\"min_size\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'video', 'video', 'publish', 'closed', 'closed', '', 'field_5efc2bba178a4', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 190, 'http://dev.almango.com/?post_type=acf-field&p=192', 1, 'acf-field', '', 0),
(193, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5efc2bc4178a5', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 190, 'http://dev.almango.com/?post_type=acf-field&p=193', 2, 'acf-field', '', 0),
(194, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5efc2bcd178a6', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 190, 'http://dev.almango.com/?post_type=acf-field&p=194', 3, 'acf-field', '', 0),
(195, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'subtitle', 'subtitle', 'publish', 'closed', 'closed', '', 'field_5efc2bd3178a7', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 190, 'http://dev.almango.com/?post_type=acf-field&p=195', 4, 'acf-field', '', 0),
(196, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:0:\"\";}', 'list', 'list', 'publish', 'closed', 'closed', '', 'field_5efc2bd9178a8', '', '', '2020-07-01 09:19:47', '2020-07-01 07:19:47', '', 190, 'http://dev.almango.com/?post_type=acf-field&#038;p=196', 5, 'acf-field', '', 0),
(197, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5efc2be3178a9', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 196, 'http://dev.almango.com/?post_type=acf-field&p=197', 0, 'acf-field', '', 0);
INSERT INTO `al_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(198, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'number', 'number', 'publish', 'closed', 'closed', '', 'field_5efc2bec178aa', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 196, 'http://dev.almango.com/?post_type=acf-field&p=198', 1, 'acf-field', '', 0),
(199, 1, '2020-07-01 08:32:34', '2020-07-01 06:32:34', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'atrib', 'atrib', 'publish', 'closed', 'closed', '', 'field_5efc2bf2178ab', '', '', '2020-07-01 08:32:34', '2020-07-01 06:32:34', '', 196, 'http://dev.almango.com/?post_type=acf-field&p=199', 2, 'acf-field', '', 0),
(215, 1, '2020-07-01 08:36:57', '2020-07-01 06:36:57', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Datos principales', 'datos_principales', 'publish', 'closed', 'closed', '', 'field_5efc2e61edc52', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&p=215', 0, 'acf-field', '', 0),
(216, 1, '2020-07-01 08:36:57', '2020-07-01 06:36:57', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Regalos', 'regalos', 'publish', 'closed', 'closed', '', 'field_5efc2e78edc53', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&p=216', 4, 'acf-field', '', 0),
(217, 1, '2020-07-01 08:36:57', '2020-07-01 06:36:57', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Resumen', 'resumen', 'publish', 'closed', 'closed', '', 'field_5efc2eb3edc54', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&p=217', 6, 'acf-field', '', 0),
(218, 1, '2020-07-01 08:36:57', '2020-07-01 06:36:57', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Ventajas', 'ventajas', 'publish', 'closed', 'closed', '', 'field_5efc2ec2edc55', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&p=218', 9, 'acf-field', '', 0),
(219, 1, '2020-07-01 08:36:57', '2020-07-01 06:36:57', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Colores', 'colores', 'publish', 'closed', 'closed', '', 'field_5efc2ee3edc56', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&p=219', 11, 'acf-field', '', 0),
(220, 1, '2020-07-01 08:36:57', '2020-07-01 06:36:57', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Atributos', 'atributos', 'publish', 'closed', 'closed', '', 'field_5efc2ef7edc57', '', '', '2020-07-01 08:36:57', '2020-07-01 06:36:57', '', 130, 'http://dev.almango.com/?post_type=acf-field&p=220', 13, 'acf-field', '', 0),
(221, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"product\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Dimensiones', 'dimensiones', 'publish', 'closed', 'closed', '', 'group_5efc2f1057c85', '', '', '2020-07-01 09:04:53', '2020-07-01 07:04:53', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=221', 0, 'acf-field-group', '', 0),
(222, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Dimensiones', 'dimensiones', 'publish', 'closed', 'closed', '', 'field_5efc2f1b7a766', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=222', 0, 'acf-field', '', 0),
(223, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Título', 'title_dimensiones', 'publish', 'closed', 'closed', '', 'field_5efc2f587a767', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=223', 1, 'acf-field', '', 0),
(224, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Box 1', 'box_1', 'publish', 'closed', 'closed', '', 'field_5efc2fc17a76b', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=224', 2, 'acf-field', '', 0),
(225, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número', 'number_box_1', 'publish', 'closed', 'closed', '', 'field_5efc2f637a768', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=225', 3, 'acf-field', '', 0),
(226, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto', 'text_box_1', 'publish', 'closed', 'closed', '', 'field_5efc2f6b7a769', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=226', 4, 'acf-field', '', 0),
(227, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción', 'desc_box_1', 'publish', 'closed', 'closed', '', 'field_5efc2f797a76a', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=227', 5, 'acf-field', '', 0),
(228, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Imagen Moto Izquierda', 'imagen_moto_left', 'publish', 'closed', 'closed', '', 'field_5efc2fe37a76d', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=228', 6, 'acf-field', '', 0),
(229, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número 2', 'number_box_2', 'publish', 'closed', 'closed', '', 'field_5efc300b7a76e', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=229', 7, 'acf-field', '', 0),
(230, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto 2', 'text_box_2', 'publish', 'closed', 'closed', '', 'field_5efc301d7a76f', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=230', 8, 'acf-field', '', 0),
(231, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción 2', 'desc_box_2', 'publish', 'closed', 'closed', '', 'field_5efc302b7a770', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=231', 9, 'acf-field', '', 0),
(232, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número bottom', 'number_box_3', 'publish', 'closed', 'closed', '', 'field_5efc303c7a771', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=232', 10, 'acf-field', '', 0),
(233, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto bottom', 'text_box_3', 'publish', 'closed', 'closed', '', 'field_5efc30507a772', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=233', 11, 'acf-field', '', 0),
(234, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción Bottom', 'desc_box_3', 'publish', 'closed', 'closed', '', 'field_5efc306d7a773', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=234', 12, 'acf-field', '', 0),
(235, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número Bottom 2', 'number_box_4', 'publish', 'closed', 'closed', '', 'field_5efc30a27a775', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=235', 13, 'acf-field', '', 0),
(236, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto Bottom 2', 'text_box_4', 'publish', 'closed', 'closed', '', 'field_5efc30b17a776', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=236', 14, 'acf-field', '', 0),
(237, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción Bottom 2', 'desc_box_4', 'publish', 'closed', 'closed', '', 'field_5efc30bf7a777', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=237', 15, 'acf-field', '', 0),
(238, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Box 2', 'box_2', 'publish', 'closed', 'closed', '', 'field_5efc2fce7a76c', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=238', 16, 'acf-field', '', 0),
(239, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número', 'number_box_5', 'publish', 'closed', 'closed', '', 'field_5efc30d37a778', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=239', 17, 'acf-field', '', 0),
(240, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto', 'text_box_5', 'publish', 'closed', 'closed', '', 'field_5efc31aa7a779', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=240', 18, 'acf-field', '', 0),
(241, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción', 'desc_box_5', 'publish', 'closed', 'closed', '', 'field_5efc31bc7a77a', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=241', 19, 'acf-field', '', 0),
(242, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Imagen central', 'imagen_moto_center', 'publish', 'closed', 'closed', '', 'field_5efc31e77a77b', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=242', 20, 'acf-field', '', 0),
(243, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número Bottom', 'number_box_6', 'publish', 'closed', 'closed', '', 'field_5efc32197a77c', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=243', 21, 'acf-field', '', 0),
(244, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto Bottom', 'text_box_6', 'publish', 'closed', 'closed', '', 'field_5efc32407a77d', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=244', 22, 'acf-field', '', 0),
(245, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción Bottom', 'desc_box_6', 'publish', 'closed', 'closed', '', 'field_5efc32507a77e', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=245', 23, 'acf-field', '', 0),
(246, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número derecha', 'number_box_7', 'publish', 'closed', 'closed', '', 'field_5efc32667a77f', '', '', '2020-07-01 08:51:51', '2020-07-01 06:51:51', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=246', 24, 'acf-field', '', 0),
(247, 1, '2020-07-01 08:51:51', '2020-07-01 06:51:51', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Box 3 - Posición', 'box_3_-_posicion', 'publish', 'closed', 'closed', '', 'field_5efc30927a774', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&#038;p=247', 27, 'acf-field', '', 0),
(248, 1, '2020-07-01 08:54:36', '2020-07-01 06:54:36', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto derecha', 'text_box_7', 'publish', 'closed', 'closed', '', 'field_5efc328c9a141', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=248', 25, 'acf-field', '', 0),
(249, 1, '2020-07-01 08:54:36', '2020-07-01 06:54:36', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción Derecha', 'desc_box_7', 'publish', 'closed', 'closed', '', 'field_5efc329e9a142', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=249', 26, 'acf-field', '', 0),
(250, 1, '2020-07-01 08:54:36', '2020-07-01 06:54:36', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Posición Moto', 'position_moto', 'publish', 'closed', 'closed', '', 'field_5efc32ba9a143', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=250', 28, 'acf-field', '', 0),
(251, 1, '2020-07-01 08:54:36', '2020-07-01 06:54:36', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Título', 'position_moto_title', 'publish', 'closed', 'closed', '', 'field_5efc32f99a144', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=251', 29, 'acf-field', '', 0),
(252, 1, '2020-07-01 08:54:36', '2020-07-01 06:54:36', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Descripción', 'position_moto_desc', 'publish', 'closed', 'closed', '', 'field_5efc33099a145', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=252', 30, 'acf-field', '', 0),
(253, 1, '2020-07-01 08:54:36', '2020-07-01 06:54:36', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Atributos Bottom', 'atributos_bottom', 'publish', 'closed', 'closed', '', 'field_5efc33199a146', '', '', '2020-07-01 08:54:36', '2020-07-01 06:54:36', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=253', 31, 'acf-field', '', 0),
(254, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto izquierda', 'atrib_text_1', 'publish', 'closed', 'closed', '', 'field_5efc3330c2f21', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=254', 32, 'acf-field', '', 0),
(255, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número izquierda', 'atrib_number_1', 'publish', 'closed', 'closed', '', 'field_5efc3366c2f22', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=255', 33, 'acf-field', '', 0),
(256, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Imagen izquierda', 'atrib_imagen_1', 'publish', 'closed', 'closed', '', 'field_5efc3376c2f23', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=256', 34, 'acf-field', '', 0),
(257, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto central', 'atrib_text_2', 'publish', 'closed', 'closed', '', 'field_5efc3390c2f24', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=257', 35, 'acf-field', '', 0),
(258, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número central', 'atrib_number_2', 'publish', 'closed', 'closed', '', 'field_5efc33a3c2f25', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=258', 36, 'acf-field', '', 0),
(259, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Imagen Central', 'atrib_imagen_2', 'publish', 'closed', 'closed', '', 'field_5efc33b0c2f26', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=259', 37, 'acf-field', '', 0),
(260, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Texto derecha', 'atrib_text_3', 'publish', 'closed', 'closed', '', 'field_5efc33bfc2f27', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=260', 38, 'acf-field', '', 0),
(261, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Número derecha', 'atrib_number_3', 'publish', 'closed', 'closed', '', 'field_5efc33ccc2f28', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=261', 39, 'acf-field', '', 0),
(262, 1, '2020-07-01 08:57:44', '2020-07-01 06:57:44', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Imagen derecha', 'atrib_imagen_3', 'publish', 'closed', 'closed', '', 'field_5efc33d8c2f29', '', '', '2020-07-01 08:57:44', '2020-07-01 06:57:44', '', 221, 'http://dev.almango.com/?post_type=acf-field&p=262', 40, 'acf-field', '', 0),
(263, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"product\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Atributos Adicionales', 'atributos-adicionales', 'publish', 'closed', 'closed', '', 'group_5efc3445d76ef', '', '', '2020-07-01 09:04:32', '2020-07-01 07:04:32', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=263', 0, 'acf-field-group', '', 0),
(264, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Ficha Técnica', 'ficha_tecnica', 'publish', 'closed', 'closed', '', 'field_5efc35069ba8b', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=264', 0, 'acf-field', '', 0),
(265, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Ficha Técnica', 'descargar_ficha', 'publish', 'closed', 'closed', '', 'field_5efc34f79ba8a', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=265', 1, 'acf-field', '', 0),
(266, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Adicionales', '', 'publish', 'closed', 'closed', '', 'field_5efc351a9ba8c', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=266', 2, 'acf-field', '', 0),
(267, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:0:\"\";}', 'fren', 'fren', 'publish', 'closed', 'closed', '', 'field_5efc34629ba7f', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=267', 3, 'acf-field', '', 0),
(268, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'icon', 'icon', 'publish', 'closed', 'closed', '', 'field_5efc34dd9ba89', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 267, 'http://dev.almango.com/?post_type=acf-field&p=268', 0, 'acf-field', '', 0),
(269, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"file\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:8:\"min_size\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'video', 'video', 'publish', 'closed', 'closed', '', 'field_5efc34719ba80', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 267, 'http://dev.almango.com/?post_type=acf-field&p=269', 1, 'acf-field', '', 0),
(270, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen', 'imagen', 'publish', 'closed', 'closed', '', 'field_5efc347f9ba81', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 267, 'http://dev.almango.com/?post_type=acf-field&p=270', 2, 'acf-field', '', 0),
(271, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5efc348a9ba82', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 267, 'http://dev.almango.com/?post_type=acf-field&p=271', 3, 'acf-field', '', 0),
(272, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'subtitle', 'subtitle', 'publish', 'closed', 'closed', '', 'field_5efc34919ba83', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 267, 'http://dev.almango.com/?post_type=acf-field&p=272', 4, 'acf-field', '', 0),
(273, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:0:\"\";}', 'list', 'list', 'publish', 'closed', 'closed', '', 'field_5efc34979ba84', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 267, 'http://dev.almango.com/?post_type=acf-field&p=273', 5, 'acf-field', '', 0),
(274, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'title', 'title', 'publish', 'closed', 'closed', '', 'field_5efc349f9ba85', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 273, 'http://dev.almango.com/?post_type=acf-field&p=274', 0, 'acf-field', '', 0),
(275, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'number', 'number', 'publish', 'closed', 'closed', '', 'field_5efc34b39ba86', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 273, 'http://dev.almango.com/?post_type=acf-field&p=275', 1, 'acf-field', '', 0),
(276, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'atrib', 'atrib', 'publish', 'closed', 'closed', '', 'field_5efc34c09ba87', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 273, 'http://dev.almango.com/?post_type=acf-field&p=276', 2, 'acf-field', '', 0),
(277, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'text', 'text', 'publish', 'closed', 'closed', '', 'field_5efc34d29ba88', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 273, 'http://dev.almango.com/?post_type=acf-field&p=277', 3, 'acf-field', '', 0),
(278, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Imagen', 'imagen_parallax_3', 'publish', 'closed', 'closed', '', 'field_5efc352a9ba8d', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=278', 4, 'acf-field', '', 0),
(279, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Mirame', 'mirame', 'publish', 'closed', 'closed', '', 'field_5efc353d9ba8e', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=279', 5, 'acf-field', '', 0),
(280, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Título', 'mirame_title', 'publish', 'closed', 'closed', '', 'field_5efc354d9ba8f', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=280', 6, 'acf-field', '', 0),
(281, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'SubTitulo', 'mirame_subtitle', 'publish', 'closed', 'closed', '', 'field_5efc355a9ba90', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=281', 7, 'acf-field', '', 0),
(282, 1, '2020-07-01 09:04:26', '2020-07-01 07:04:26', 'a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'Grid', 'grid_shortcode', 'publish', 'closed', 'closed', '', 'field_5efc35689ba91', '', '', '2020-07-01 09:04:26', '2020-07-01 07:04:26', '', 263, 'http://dev.almango.com/?post_type=acf-field&p=282', 8, 'acf-field', '', 0),
(283, 1, '2020-07-01 09:08:07', '2020-07-01 07:08:07', '', 'luz-abs (1)', '', 'inherit', 'open', 'closed', '', 'luz-abs-1', '', '', '2020-07-01 09:08:07', '2020-07-01 07:08:07', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/luz-abs-1.png', 0, 'attachment', 'image/png', 0),
(284, 1, '2020-07-01 09:08:08', '2020-07-01 07:08:08', '', 'motocicleta (2)', '', 'inherit', 'open', 'closed', '', 'motocicleta-2', '', '', '2020-07-01 09:08:08', '2020-07-01 07:08:08', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-2.png', 0, 'attachment', 'image/png', 0),
(285, 1, '2020-07-01 09:08:08', '2020-07-01 07:08:08', '', 'motocicleta (3)', '', 'inherit', 'open', 'closed', '', 'motocicleta-3', '', '', '2020-07-01 09:08:08', '2020-07-01 07:08:08', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-3.png', 0, 'attachment', 'image/png', 0),
(286, 1, '2020-07-01 09:08:09', '2020-07-01 07:08:09', '', 'motocicleta (4)', '', 'inherit', 'open', 'closed', '', 'motocicleta-4', '', '', '2020-07-01 09:08:09', '2020-07-01 07:08:09', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-4.png', 0, 'attachment', 'image/png', 0),
(287, 1, '2020-07-01 09:08:09', '2020-07-01 07:08:09', '', 'deportes-de-motor', '', 'inherit', 'open', 'closed', '', 'deportes-de-motor', '', '', '2020-07-01 09:08:09', '2020-07-01 07:08:09', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/deportes-de-motor.png', 0, 'attachment', 'image/png', 0),
(288, 1, '2020-07-01 09:08:10', '2020-07-01 07:08:10', '', 'iluminacion', '', 'inherit', 'open', 'closed', '', 'iluminacion', '', '', '2020-07-01 09:08:10', '2020-07-01 07:08:10', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/iluminacion.png', 0, 'attachment', 'image/png', 0),
(289, 1, '2020-07-01 09:09:09', '2020-07-01 07:09:09', '', 'LEO', '', 'inherit', 'open', 'closed', '', 'leo-2', '', '', '2020-07-01 09:09:09', '2020-07-01 07:09:09', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/LEO.png', 0, 'attachment', 'image/png', 0),
(290, 1, '2020-07-01 09:11:51', '2020-07-01 07:11:51', '', 'ns200 amarillo', '', 'inherit', 'open', 'closed', '', 'ns200-amarillo', '', '', '2020-07-01 09:11:51', '2020-07-01 07:11:51', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/ns200-amarillo.png', 0, 'attachment', 'image/png', 0),
(291, 1, '2020-07-01 09:17:32', '2020-07-01 07:17:32', '', 'motocicleta (6)', '', 'inherit', 'open', 'closed', '', 'motocicleta-6', '', '', '2020-07-01 09:17:32', '2020-07-01 07:17:32', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-6.png', 0, 'attachment', 'image/png', 0),
(292, 1, '2020-07-01 09:17:33', '2020-07-01 07:17:33', '', 'motocicleta (12)', '', 'inherit', 'open', 'closed', '', 'motocicleta-12', '', '', '2020-07-01 09:17:33', '2020-07-01 07:17:33', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-12.png', 0, 'attachment', 'image/png', 0),
(293, 1, '2020-07-01 09:17:34', '2020-07-01 07:17:34', '', 'motor-del-coche', '', 'inherit', 'open', 'closed', '', 'motor-del-coche', '', '', '2020-07-01 09:17:34', '2020-07-01 07:17:34', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motor-del-coche.png', 0, 'attachment', 'image/png', 0),
(294, 1, '2020-07-01 09:17:34', '2020-07-01 07:17:34', '', 'motocicleta (5)', '', 'inherit', 'open', 'closed', '', 'motocicleta-5', '', '', '2020-07-01 09:17:34', '2020-07-01 07:17:34', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-5.png', 0, 'attachment', 'image/png', 0),
(295, 1, '2020-07-01 09:23:00', '2020-07-01 07:23:00', '', 'normal', '', 'inherit', 'open', 'closed', '', 'normal-2', '', '', '2020-07-01 09:23:00', '2020-07-01 07:23:00', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/normal-1.png', 0, 'attachment', 'image/png', 0),
(296, 1, '2020-07-01 09:23:02', '2020-07-01 07:23:02', '', 'STREET top (1)', '', 'inherit', 'open', 'closed', '', 'street-top-1', '', '', '2020-07-01 09:23:02', '2020-07-01 07:23:02', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/STREET-top-1.png', 0, 'attachment', 'image/png', 0),
(297, 1, '2020-07-01 09:23:06', '2020-07-01 07:23:06', '', '4371087 - motorcycle transportation', '', 'inherit', 'open', 'closed', '', '4371087-motorcycle-transportation', '', '', '2020-07-01 09:23:06', '2020-07-01 07:23:06', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/4371087-motorcycle-transportation.png', 0, 'attachment', 'image/png', 0),
(298, 1, '2020-07-01 09:26:24', '2020-07-01 07:26:24', '', 'caminar', '', 'inherit', 'open', 'closed', '', 'caminar', '', '', '2020-07-01 09:26:24', '2020-07-01 07:26:24', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/caminar.png', 0, 'attachment', 'image/png', 0),
(299, 1, '2020-07-01 09:26:24', '2020-07-01 07:26:24', '', 'weight', '', 'inherit', 'open', 'closed', '', 'weight', '', '', '2020-07-01 09:26:24', '2020-07-01 07:26:24', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/weight.png', 0, 'attachment', 'image/png', 0),
(300, 1, '2020-07-01 09:28:26', '2020-07-01 07:28:26', '', 'motocicleta (9)', '', 'inherit', 'open', 'closed', '', 'motocicleta-9', '', '', '2020-07-01 09:28:26', '2020-07-01 07:28:26', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-9.png', 0, 'attachment', 'image/png', 0);
INSERT INTO `al_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(301, 1, '2020-07-01 09:28:27', '2020-07-01 07:28:27', '', 'motocicleta (10)', '', 'inherit', 'open', 'closed', '', 'motocicleta-10', '', '', '2020-07-01 09:28:27', '2020-07-01 07:28:27', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-10.png', 0, 'attachment', 'image/png', 0),
(302, 1, '2020-07-01 09:28:27', '2020-07-01 07:28:27', '', 'motocicleta (11)', '', 'inherit', 'open', 'closed', '', 'motocicleta-11', '', '', '2020-07-01 09:28:27', '2020-07-01 07:28:27', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/motocicleta-11.png', 0, 'attachment', 'image/png', 0),
(303, 1, '2020-07-01 09:28:28', '2020-07-01 07:28:28', '', 'diverso', '', 'inherit', 'open', 'closed', '', 'diverso', '', '', '2020-07-01 09:28:28', '2020-07-01 07:28:28', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/diverso.png', 0, 'attachment', 'image/png', 0),
(304, 1, '2020-07-02 00:03:56', '2020-07-01 22:03:56', '', 'Grupo 704-min', '', 'inherit', 'open', 'closed', '', 'grupo-704-min', '', '', '2020-07-02 00:03:56', '2020-07-01 22:03:56', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/Grupo-704-min.jpg', 0, 'attachment', 'image/jpeg', 0),
(305, 1, '2020-07-02 00:04:04', '2020-07-01 22:04:04', '', 'Grupo 704-min', '', 'inherit', 'open', 'closed', '', 'grupo-704-min-2', '', '', '2020-07-02 00:04:04', '2020-07-01 22:04:04', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/Grupo-704-min-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(306, 1, '2020-07-02 04:12:21', '2020-07-02 02:12:21', '<!-- wp:shortcode -->\r\n<p>[woocommerce_my_account]</p>\r\n<!-- /wp:shortcode -->', 'My account', '', 'inherit', 'closed', 'closed', '', '111-revision-v1', '', '', '2020-07-02 04:12:21', '2020-07-02 02:12:21', '', 111, 'http://dev.almango.com/111-revision-v1/', 0, 'revision', '', 0),
(307, 1, '2020-07-02 04:13:16', '2020-07-02 02:13:16', '', 'machu-picchu-1569324_1280', '', 'inherit', 'open', 'closed', '', 'machu-picchu-1569324_1280', '', '', '2020-07-02 04:13:16', '2020-07-02 02:13:16', '', 111, 'http://dev.almango.com/wp-content/uploads/2020/07/machu-picchu-1569324_1280.png', 0, 'attachment', 'image/png', 0),
(309, 1, '2020-07-02 04:14:06', '2020-07-02 02:14:06', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'background_myaccount', 'background_myaccount', 'publish', 'closed', 'closed', '', 'field_5efd42de63219', '', '', '2020-07-02 04:14:06', '2020-07-02 02:14:06', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=309', 7, 'acf-field', '', 0),
(310, 1, '2020-07-02 04:21:47', '2020-07-02 02:21:47', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"user_role\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:3:\"all\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'user', 'user', 'publish', 'closed', 'closed', '', 'group_5efd44a78b162', '', '', '2020-07-02 04:21:47', '2020-07-02 02:21:47', '', 0, 'http://dev.almango.com/?post_type=acf-field-group&#038;p=310', 0, 'acf-field-group', '', 0),
(311, 1, '2020-07-02 04:21:47', '2020-07-02 02:21:47', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'imagen_perfil', 'imagen_perfil', 'publish', 'closed', 'closed', '', 'field_5efd44ab85b55', '', '', '2020-07-02 04:21:47', '2020-07-02 02:21:47', '', 310, 'http://dev.almango.com/?post_type=acf-field&p=311', 0, 'acf-field', '', 0),
(312, 1, '2020-07-02 04:25:50', '2020-07-02 02:25:50', '', '88163880_2956796697705508_8194579974775111680_o', '', 'inherit', 'open', 'closed', '', '88163880_2956796697705508_8194579974775111680_o', '', '', '2020-07-02 04:25:50', '2020-07-02 02:25:50', '', 0, 'http://dev.almango.com/wp-content/uploads/2020/07/88163880_2956796697705508_8194579974775111680_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(313, 1, '2020-07-02 05:54:49', '2020-07-02 03:54:49', '', 'Order &ndash; julio 2, 2020 @ 05:54 AM', '', 'wc-cancelled', 'open', 'closed', 'wc_order_JYEelZlxxmwbi', 'order-jul-02-2020-0354-am', '', '', '2020-07-02 07:04:16', '2020-07-02 05:04:16', '', 0, 'http://dev.almango.com/?post_type=shop_order&#038;p=313', 0, 'shop_order', '', 1),
(314, 1, '2020-07-02 17:53:51', '2020-07-02 15:53:51', '', 'Order &ndash; julio 2, 2020 @ 05:53 PM', '', 'wc-cancelled', 'open', 'closed', 'wc_order_0xiRKBytroriW', 'order-jul-02-2020-0353-pm', '', '', '2020-07-02 19:40:28', '2020-07-02 17:40:28', '', 0, 'http://dev.almango.com/?post_type=shop_order&#038;p=314', 0, 'shop_order', '', 1),
(316, 1, '2020-07-15 00:42:31', '2020-07-14 22:42:31', '', 'ducati-monster-797-2018-negro-464827', '', 'inherit', 'open', 'closed', '', 'ducati-monster-797-2018-negro-464827', '', '', '2020-07-15 00:42:31', '2020-07-14 22:42:31', '', 93, 'http://dev.almango.com/wp-content/uploads/2020/06/ducati-monster-797-2018-negro-464827.png', 0, 'attachment', 'image/png', 0),
(317, 1, '2020-07-15 00:42:48', '2020-07-14 22:42:48', '', 'ducati-monster-797-2018-negro-464827', '', 'inherit', 'open', 'closed', '', 'ducati-monster-797-2018-negro-464827-2', '', '', '2020-07-15 00:42:48', '2020-07-14 22:42:48', '', 139, 'http://dev.almango.com/wp-content/uploads/2020/06/ducati-monster-797-2018-negro-464827-1.png', 0, 'attachment', 'image/png', 0),
(318, 1, '2020-07-15 08:06:33', '2020-07-15 06:06:33', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'porcentaje_conversion', 'porcentaje_conversion', 'publish', 'closed', 'closed', '', 'field_5f0e9cd66e146', '', '', '2020-07-15 08:06:33', '2020-07-15 06:06:33', '', 23, 'http://dev.almango.com/?post_type=acf-field&p=318', 8, 'acf-field', '', 0),
(319, 1, '2020-07-20 23:10:24', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-07-20 23:10:24', '0000-00-00 00:00:00', '', 0, 'http://dev.almango-master.com/?p=319', 0, 'post', '', 0),
(320, 1, '2020-07-20 23:11:48', '2020-07-20 21:11:48', '', 'Trabaja con Nosotros', '', 'publish', 'closed', 'closed', '', 'trabaja-con-nosotros', '', '', '2020-07-21 01:33:25', '2020-07-20 23:33:25', '', 0, 'http://dev.almango-master.com/?page_id=320', 0, 'page', '', 0),
(321, 1, '2020-07-20 23:11:48', '2020-07-20 21:11:48', '', 'Trabaja con Nosotros', '', 'inherit', 'closed', 'closed', '', '320-revision-v1', '', '', '2020-07-20 23:11:48', '2020-07-20 21:11:48', '', 320, 'http://dev.almango-master.com/320-revision-v1/', 0, 'revision', '', 0),
(322, 1, '2020-07-21 01:08:12', '2020-07-20 23:08:12', '<h2>Dejanos tus datos</h2>\r\n<label>Nombres y Apellidos\' (requerido)\r\n    [text* your-name] </label>\r\n\r\n<label>Celular\'\r\n    [tel celular] </label>\r\n\r\n<label> Tu correo electrónico\' (requerido)\r\n    [email* your-email] </label>\r\n\r\n<label> Link de Linkedin\'\r\n    [url linkedin]</label>\r\n<label> AREA DE TU INTERES\r\n    [select menu-631 include_blank \"Interes 1\" \"Interes 2 \" \"Interes 3\"]</label>\r\n<label> ADJUNTA TU CV\'\r\n    [file file-cv]</label>\r\n<p>Datos Obligatorios</p>\r\n[submit \"ENVIAR SOLICITUD\"]\n1\nAlMango «[your-subject]»\nAlMango <wordpress@dev.almango-master.com>\nfrankdelarosacampos@gmail.com\nDe: [your-name] <[your-email]>\r\nAsunto: [your-subject]\r\n\r\nCuerpo del mensaje:\r\n[your-message]\r\n\r\n-- \r\nEste mensaje se ha enviado desde un formulario de contacto en AlMango (http://dev.almango-master.com)\nReply-To: [your-email]\n\n\n\n\nAlMango «[your-subject]»\nAlMango <wordpress@dev.almango-master.com>\n[your-email]\nCuerpo del mensaje:\r\n[your-message]\r\n\r\n-- \r\nEste mensaje se ha enviado desde un formulario de contacto en AlMango (http://dev.almango-master.com)\nReply-To: frankdelarosacampos@gmail.com\n\n\n\nGracias por tu mensaje. Ha sido enviado.\nHubo un error intentando enviar tu mensaje. Por favor inténtalo de nuevo más tarde.\nUno o más campos tienen un error. Por favor revisa e inténtalo de nuevo.\nHubo un error intentando enviar tu mensaje. Por favor inténtalo de nuevo más tarde.\nDebes aceptar los términos y condiciones antes de enviar tu mensaje.\nEl campo es obligatorio.\nEl campo es demasiado largo.\nEl campo es demasiado corto.\nEl formato de fecha es incorrecto.\nLa fecha es anterior a la más temprana permitida.\nLa fecha es posterior a la más tardía permitida.\nHubo un error desconocido subiendo el archivo.\nNo tienes permisos para subir archivos de este tipo.\nEl archivo es demasiado grande.\nSe ha producido un error subiendo la imagen\nEl formato de número no es válido.\nEl número es menor que el mínimo permitido.\nEl número es mayor que el máximo permitido.\nLa respuesta al cuestionario no es correcta.\nEl código introducido es incorrecto.\nLa dirección de correo electrónico que has introducido no es válida.\nLa URL no es válida.\nEl número de teléfono no es válido.', 'Envio de Solicitud', '', 'publish', 'closed', 'closed', '', 'envio-de-solicitud', '', '', '2020-07-21 03:30:52', '2020-07-21 01:30:52', '', 0, 'http://dev.almango-master.com/?post_type=wpcf7_contact_form&#038;p=322', 0, 'wpcf7_contact_form', '', 0),
(323, 1, '2020-07-21 01:22:12', '2020-07-20 23:22:12', '', 'avatar@2x', '', 'inherit', 'open', 'closed', '', 'avatar2x', '', '', '2020-07-21 01:22:12', '2020-07-20 23:22:12', '', 0, 'http://dev.almango-master.com/wp-content/uploads/2020/07/avatar@2x.png', 0, 'attachment', 'image/png', 0),
(324, 1, '2020-07-21 01:22:13', '2020-07-20 23:22:13', '', 'businessman@2x', '', 'inherit', 'open', 'closed', '', 'businessman2x', '', '', '2020-07-21 01:22:13', '2020-07-20 23:22:13', '', 0, 'http://dev.almango-master.com/wp-content/uploads/2020/07/businessman@2x.png', 0, 'attachment', 'image/png', 0),
(325, 1, '2020-07-21 01:22:14', '2020-07-20 23:22:14', '', 'jigsaw@2x', '', 'inherit', 'open', 'closed', '', 'jigsaw2x', '', '', '2020-07-21 01:22:14', '2020-07-20 23:22:14', '', 0, 'http://dev.almango-master.com/wp-content/uploads/2020/07/jigsaw@2x.png', 0, 'attachment', 'image/png', 0),
(326, 1, '2020-07-21 01:22:16', '2020-07-20 23:22:16', '', 'kid-and-baby@2x', '', 'inherit', 'open', 'closed', '', 'kid-and-baby2x', '', '', '2020-07-21 01:33:25', '2020-07-20 23:33:25', '', 320, 'http://dev.almango-master.com/wp-content/uploads/2020/07/kid-and-baby@2x.png', 0, 'attachment', 'image/png', 0),
(327, 1, '2020-07-21 01:22:18', '2020-07-20 23:22:18', '', 'linkedin@2x', '', 'inherit', 'open', 'closed', '', 'linkedin2x', '', '', '2020-07-21 01:22:18', '2020-07-20 23:22:18', '', 0, 'http://dev.almango-master.com/wp-content/uploads/2020/07/linkedin@2x.png', 0, 'attachment', 'image/png', 0),
(328, 1, '2020-07-21 01:22:19', '2020-07-20 23:22:19', '', 'man (1)@2x', '', 'inherit', 'open', 'closed', '', 'man-12x', '', '', '2020-07-21 01:33:26', '2020-07-20 23:33:26', '', 320, 'http://dev.almango-master.com/wp-content/uploads/2020/07/man-1@2x.png', 0, 'attachment', 'image/png', 0),
(329, 1, '2020-07-21 01:22:21', '2020-07-20 23:22:21', '', 'mobile-phone@2x', '', 'inherit', 'open', 'closed', '', 'mobile-phone2x', '', '', '2020-07-21 01:22:21', '2020-07-20 23:22:21', '', 0, 'http://dev.almango-master.com/wp-content/uploads/2020/07/mobile-phone@2x.png', 0, 'attachment', 'image/png', 0),
(330, 1, '2020-07-21 01:22:22', '2020-07-20 23:22:22', '', 'multimedia@2x', '', 'inherit', 'open', 'closed', '', 'multimedia2x', '', '', '2020-07-21 01:22:22', '2020-07-20 23:22:22', '', 0, 'http://dev.almango-master.com/wp-content/uploads/2020/07/multimedia@2x.png', 0, 'attachment', 'image/png', 0),
(331, 1, '2020-07-21 01:22:24', '2020-07-20 23:22:24', '', 'up@2x', '', 'inherit', 'open', 'closed', '', 'up2x', '', '', '2020-07-21 01:33:26', '2020-07-20 23:33:26', '', 320, 'http://dev.almango-master.com/wp-content/uploads/2020/07/up@2x.png', 0, 'attachment', 'image/png', 0),
(332, 1, '2020-07-21 01:22:25', '2020-07-20 23:22:25', '', 'up-1@2x', '', 'inherit', 'open', 'closed', '', 'up-12x', '', '', '2020-07-21 01:33:25', '2020-07-20 23:33:25', '', 320, 'http://dev.almango-master.com/wp-content/uploads/2020/07/up-1@2x.png', 0, 'attachment', 'image/png', 0),
(333, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:30:\"templates/template-worknos.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Trabaja con nosotros', 'trabaja-con-nosotros', 'publish', 'closed', 'closed', '', 'group_5f1627418e2fc', '', '', '2020-07-21 01:31:56', '2020-07-20 23:31:56', '', 0, 'http://dev.almango-master.com/?post_type=acf-field-group&#038;p=333', 0, 'acf-field-group', '', 0),
(334, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'titulo_worknos', 'titulo_worknos', 'publish', 'closed', 'closed', '', 'field_5f16274d05bd4', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=334', 0, 'acf-field', '', 0),
(335, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'texto_worknos', 'texto_worknos', 'publish', 'closed', 'closed', '', 'field_5f16275905bd5', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=335', 1, 'acf-field', '', 0),
(336, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:4:\"full\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img_girl', 'img_girl', 'publish', 'closed', 'closed', '', 'field_5f16276005bd6', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=336', 2, 'acf-field', '', 0),
(337, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:4:\"full\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img_arrow', 'img_arrow', 'publish', 'closed', 'closed', '', 'field_5f16278d05bd7', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=337', 3, 'acf-field', '', 0),
(338, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img_text', 'img_text', 'publish', 'closed', 'closed', '', 'field_5f1627ad05bd8', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=338', 4, 'acf-field', '', 0),
(339, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:4:\"full\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img_boy', 'img_boy', 'publish', 'closed', 'closed', '', 'field_5f1627c405bd9', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=339', 5, 'acf-field', '', 0),
(340, 1, '2020-07-21 01:25:46', '2020-07-20 23:25:46', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:4:\"full\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'img_arrow_boy', 'img_arrow_boy', 'publish', 'closed', 'closed', '', 'field_5f1627de05bda', '', '', '2020-07-21 01:25:46', '2020-07-20 23:25:46', '', 333, 'http://dev.almango-master.com/?post_type=acf-field&p=340', 6, 'acf-field', '', 0),
(342, 1, '2020-07-21 01:33:25', '2020-07-20 23:33:25', '', 'Trabaja con Nosotros', '', 'inherit', 'closed', 'closed', '', '320-revision-v1', '', '', '2020-07-21 01:33:25', '2020-07-20 23:33:25', '', 320, 'http://dev.almango-master.com/320-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_termmeta`
--

CREATE TABLE `al_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_termmeta`
--

INSERT INTO `al_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 15, 'display_type', ''),
(2, 15, 'thumbnail_id', '0'),
(27, 24, 'order', '0'),
(28, 24, 'display_type', ''),
(29, 24, 'thumbnail_id', '0'),
(30, 25, 'order', '0'),
(31, 25, 'display_type', ''),
(32, 25, 'thumbnail_id', '21'),
(33, 26, 'order', '0'),
(34, 26, 'display_type', ''),
(35, 26, 'thumbnail_id', '22'),
(36, 27, 'order', '0'),
(37, 27, 'display_type', ''),
(38, 27, 'thumbnail_id', '69'),
(39, 28, 'order', '0'),
(40, 28, 'display_type', ''),
(41, 28, 'thumbnail_id', '70'),
(42, 29, 'order', '0'),
(43, 29, 'display_type', ''),
(44, 29, 'thumbnail_id', '71'),
(45, 30, 'order', '0'),
(46, 30, 'display_type', ''),
(47, 30, 'thumbnail_id', '72'),
(48, 31, 'order', '0'),
(49, 31, 'display_type', ''),
(50, 31, 'thumbnail_id', '73'),
(51, 32, 'order', '0'),
(52, 32, 'display_type', ''),
(53, 32, 'thumbnail_id', '74'),
(54, 33, 'order', '0'),
(55, 33, 'display_type', ''),
(56, 33, 'thumbnail_id', '75'),
(57, 34, 'order', '0'),
(58, 34, 'display_type', ''),
(59, 34, 'thumbnail_id', '76'),
(60, 35, 'order', '0'),
(61, 35, 'display_type', ''),
(62, 35, 'thumbnail_id', '68'),
(63, 36, 'order', '0'),
(64, 36, 'display_type', ''),
(65, 36, 'thumbnail_id', '67'),
(66, 37, 'order', '0'),
(67, 37, 'display_type', ''),
(68, 37, 'thumbnail_id', '66'),
(69, 38, 'order', '0'),
(70, 38, 'display_type', ''),
(71, 38, 'thumbnail_id', '65'),
(72, 39, 'order', '0'),
(73, 39, 'display_type', ''),
(74, 39, 'thumbnail_id', '64'),
(75, 40, 'order', '0'),
(76, 40, 'display_type', ''),
(77, 40, 'thumbnail_id', '63'),
(78, 41, 'order', '0'),
(79, 41, 'display_type', ''),
(80, 41, 'thumbnail_id', '62'),
(81, 42, 'order', '0'),
(82, 42, 'display_type', ''),
(83, 42, 'thumbnail_id', '81'),
(84, 43, 'order', '0'),
(85, 43, 'display_type', ''),
(86, 43, 'thumbnail_id', '80'),
(87, 44, 'order', '0'),
(88, 44, 'display_type', ''),
(89, 44, 'thumbnail_id', '79'),
(90, 45, 'order', '0'),
(91, 45, 'display_type', ''),
(92, 45, 'thumbnail_id', '78'),
(93, 46, 'order', '0'),
(94, 46, 'display_type', ''),
(95, 46, 'thumbnail_id', '77'),
(96, 15, 'product_count_product_cat', '2'),
(97, 46, 'product_count_product_cat', '2'),
(98, 25, 'page', '115'),
(99, 25, '_page', 'field_5ef6369a3831e'),
(100, 26, 'page', '115'),
(101, 26, '_page', 'field_5ef6369a3831e'),
(102, 24, 'product_count_product_cat', '2'),
(103, 25, 'product_count_product_cat', '2'),
(104, 48, 'product_count_product_tag', '2'),
(105, 49, 'order_pa_color', '0'),
(106, 49, 'color', '#226fe2'),
(107, 49, '_color', 'field_5ef66e8cbc1a4'),
(108, 50, 'order_pa_color', '0'),
(109, 50, 'color', '#e83535'),
(110, 50, '_color', 'field_5ef66e8cbc1a4'),
(111, 51, 'order_pa_color', '0'),
(112, 51, 'color', '#000000'),
(113, 51, '_color', 'field_5ef66e8cbc1a4'),
(114, 52, 'order_pa_cilindrada', '0'),
(115, 53, 'order_pa_cilindrada', '0'),
(116, 54, 'order_pa_cilindrada', '0'),
(117, 55, 'order_pa_cilindrada', '0'),
(118, 56, 'order_pa_cilindrada', '0'),
(119, 57, 'order_pa_posicion', '0'),
(120, 58, 'order_pa_posicion', '0'),
(121, 59, 'order_pa_posicion', '0'),
(122, 60, 'order_pa_posicion', '0'),
(123, 58, 'imagen', '144'),
(124, 58, '_imagen', 'field_5ef69606a7623'),
(125, 60, 'imagen', '145'),
(126, 60, '_imagen', 'field_5ef69606a7623'),
(127, 57, 'imagen', '143'),
(128, 57, '_imagen', 'field_5ef69606a7623'),
(129, 59, 'imagen', '144'),
(130, 59, '_imagen', 'field_5ef69606a7623'),
(131, 43, 'page', ''),
(132, 43, '_page', 'field_5ef6369a3831e'),
(133, 36, 'page', ''),
(134, 36, '_page', 'field_5ef6369a3831e'),
(135, 46, 'page', ''),
(136, 46, '_page', 'field_5ef6369a3831e'),
(137, 45, 'page', ''),
(138, 45, '_page', 'field_5ef6369a3831e'),
(139, 44, 'page', ''),
(140, 44, '_page', 'field_5ef6369a3831e'),
(141, 40, 'page', ''),
(142, 40, '_page', 'field_5ef6369a3831e'),
(143, 42, 'page', ''),
(144, 42, '_page', 'field_5ef6369a3831e'),
(145, 41, 'page', ''),
(146, 41, '_page', 'field_5ef6369a3831e'),
(147, 39, 'page', ''),
(148, 39, '_page', 'field_5ef6369a3831e'),
(149, 37, 'page', ''),
(150, 37, '_page', 'field_5ef6369a3831e'),
(151, 38, 'page', ''),
(152, 38, '_page', 'field_5ef6369a3831e'),
(153, 34, 'page', ''),
(154, 34, '_page', 'field_5ef6369a3831e'),
(155, 35, 'page', ''),
(156, 35, '_page', 'field_5ef6369a3831e'),
(157, 28, 'product_count_product_cat', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_terms`
--

CREATE TABLE `al_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_terms`
--

INSERT INTO `al_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'Estilo', 'estilo', 0),
(24, 'Marca', 'marca', 0),
(25, 'Honda', 'honda', 0),
(26, 'Italika', 'italika', 0),
(27, 'competition', 'competition', 0),
(28, 'Heritage', 'heritage', 0),
(29, 'Practice', 'practice', 0),
(30, 'Speed', 'speed', 0),
(31, 'Street', 'street', 0),
(32, 'Tour', 'tour', 0),
(33, 'Trail', 'trail', 0),
(34, 'Urban', 'urban', 0),
(35, 'Maxi Scooter', 'maxi-scooter', 0),
(36, 'Enduro', 'enduro', 0),
(37, 'Doble propósito', 'doble-proposito', 0),
(38, 'Deportivo', 'deportivo', 0),
(39, 'Dax', 'dax', 0),
(40, 'Custom', 'custom', 0),
(41, 'Cub', 'cub', 0),
(42, 'Cruiser', 'cruiser', 0),
(43, 'Cross', 'cross', 0),
(44, 'Chopper', 'chopper', 0),
(45, 'Cafe racer', 'cafe-racer', 0),
(46, 'Bobber', 'bobber', 0),
(47, 'header', 'header', 0),
(48, '#Urban Mobility', 'urban-mobility', 0),
(49, 'azul', 'azul', 0),
(50, 'rojo', 'rojo', 0),
(51, 'negro', 'negro', 0),
(52, '10', '10', 0),
(53, '11', '11', 0),
(54, '12', '12', 0),
(55, '15', '15', 0),
(56, '13', '13', 0),
(57, 'RECOSTADO', 'recostado', 0),
(58, 'ERGUIDO', 'erguido', 0),
(59, 'SEMI ERGUIDO', 'semi-erguido', 0),
(60, 'INCLINADO', 'inclinado', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_term_relationships`
--

CREATE TABLE `al_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_term_relationships`
--

INSERT INTO `al_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(93, 2, 0),
(93, 15, 0),
(93, 24, 0),
(93, 25, 0),
(93, 46, 0),
(93, 48, 0),
(93, 49, 0),
(93, 51, 0),
(93, 52, 0),
(93, 53, 0),
(93, 54, 0),
(93, 57, 0),
(93, 58, 0),
(93, 59, 0),
(93, 60, 0),
(104, 47, 0),
(135, 47, 0),
(136, 47, 0),
(139, 2, 0),
(139, 8, 0),
(139, 15, 0),
(139, 24, 0),
(139, 25, 0),
(139, 46, 0),
(139, 48, 0),
(139, 49, 0),
(139, 51, 0),
(139, 52, 0),
(139, 53, 0),
(139, 57, 0),
(139, 58, 0),
(139, 59, 0),
(139, 60, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_term_taxonomy`
--

CREATE TABLE `al_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_term_taxonomy`
--

INSERT INTO `al_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 2),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_visibility', '', 0, 0),
(7, 7, 'product_visibility', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 1),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', '', 0, 2),
(24, 24, 'product_cat', '', 0, 2),
(25, 25, 'product_cat', '', 24, 2),
(26, 26, 'product_cat', '', 24, 0),
(27, 27, 'product_cat', '', 15, 0),
(28, 28, 'product_cat', '', 15, 0),
(29, 29, 'product_cat', '', 15, 0),
(30, 30, 'product_cat', '', 15, 0),
(31, 31, 'product_cat', '', 15, 0),
(32, 32, 'product_cat', '', 15, 0),
(33, 33, 'product_cat', '', 15, 0),
(34, 34, 'product_cat', '', 15, 0),
(35, 35, 'product_cat', '', 34, 0),
(36, 36, 'product_cat', '', 27, 0),
(37, 37, 'product_cat', '', 33, 0),
(38, 38, 'product_cat', '', 30, 0),
(39, 39, 'product_cat', '', 29, 0),
(40, 40, 'product_cat', '', 28, 0),
(41, 41, 'product_cat', '', 29, 0),
(42, 42, 'product_cat', '', 32, 0),
(43, 43, 'product_cat', '', 27, 0),
(44, 44, 'product_cat', '', 28, 0),
(45, 45, 'product_cat', '', 28, 0),
(46, 46, 'product_cat', '', 28, 2),
(47, 47, 'nav_menu', '', 0, 3),
(48, 48, 'product_tag', '', 0, 2),
(49, 49, 'pa_color', '', 0, 2),
(50, 50, 'pa_color', '', 0, 0),
(51, 51, 'pa_color', '', 0, 2),
(52, 52, 'pa_cilindrada', '', 0, 2),
(53, 53, 'pa_cilindrada', '', 0, 2),
(54, 54, 'pa_cilindrada', '', 0, 1),
(55, 55, 'pa_cilindrada', '', 0, 0),
(56, 56, 'pa_cilindrada', '', 0, 0),
(57, 57, 'pa_posicion', '', 0, 2),
(58, 58, 'pa_posicion', '', 0, 2),
(59, 59, 'pa_posicion', '', 0, 2),
(60, 60, 'pa_posicion', '', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_usermeta`
--

CREATE TABLE `al_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_usermeta`
--

INSERT INTO `al_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', 'Fran'),
(3, 1, 'last_name', 'De la Rosa'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'blue'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'false'),
(11, 1, 'locale', ''),
(12, 1, 'al_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'al_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"00bf86e93fd8f9d79f27eae04fba97421a6a8f0f97c6250fc4ee23dcda67fa10\";a:4:{s:10:\"expiration\";i:1595452219;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:130:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36 Edg/84.0.522.40\";s:5:\"login\";i:1595279419;}}'),
(17, 1, 'al_dashboard_quick_press_last_post_id', '319'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, '_woocommerce_tracks_anon_id', 'woo:sDOpmOuoWLRjhDJBY/6PLm0U'),
(20, 1, 'al_yoast_notifications', 'a:2:{i:0;a:2:{s:7:\"message\";s:452:\"Yoast SEO y WooCommerce pueden funcionar juntos mucho mejor añadiendo un plugin que les ayude. Por favor, instala Yoast WooCommerce SEO para hacer tu vida más fácil. <a href=\"https://yoa.st/1o0?php_version=7.4&platform=wordpress&platform_version=5.2.7&software=free&software_version=11.8&days_active=6-30&user_language=es_ES\" aria-label=\"Más información sobre Yoast WooCommerce SEO\" target=\"_blank\" rel=\"noopener noreferrer\">Más información</a>.\";s:7:\"options\";a:9:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:44:\"wpseo-suggested-plugin-yoast-woocommerce-seo\";s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";a:1:{i:0;s:15:\"install_plugins\";}s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}i:1;a:2:{s:7:\"message\";s:257:\"<strong>Enorme problema de SEO: Estás bloqueando el acceso a los robots.</strong> Debes <a href=\"http://dev.almango-master.com/wp-admin/options-reading.php\">ir a tus ajustes de lectura</a> y desactivar la casilla de visibilidad en los motores de búsqueda.\";s:7:\"options\";a:9:{s:4:\"type\";s:5:\"error\";s:2:\"id\";s:32:\"wpseo-dismiss-blog-public-notice\";s:5:\"nonce\";N;s:8:\"priority\";i:1;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}}'),
(21, 1, 'dismissed_wc_admin_notice', '1'),
(22, 1, 'dismissed_no_secure_connection_notice', '1'),
(23, 1, '_yoast_wpseo_profile_updated', '1593659704'),
(24, 1, 'wc_last_active', '1595289600'),
(25, 1, 'wpseo_title', ''),
(26, 1, 'wpseo_metadesc', ''),
(27, 1, 'wpseo_noindex_author', ''),
(28, 1, 'wpseo_content_analysis_disable', ''),
(29, 1, 'wpseo_keyword_analysis_disable', ''),
(30, 1, 'billing_first_name', 'Fran'),
(31, 1, 'billing_last_name', 'De la Rosa'),
(32, 1, 'billing_company', ''),
(33, 1, 'billing_address_1', 'AV LAS LOMAS'),
(34, 1, 'billing_address_2', ''),
(35, 1, 'billing_city', 'LIMA'),
(36, 1, 'billing_postcode', 'LIMA01'),
(37, 1, 'billing_country', 'PE'),
(38, 1, 'billing_state', 'LIM'),
(39, 1, 'billing_phone', '918172291'),
(40, 1, 'billing_email', 'frankdelarosacampos@gmail.com'),
(41, 1, 'shipping_first_name', 'Fran'),
(42, 1, 'shipping_last_name', 'De la Rosa'),
(43, 1, 'shipping_company', ''),
(44, 1, 'shipping_address_1', 'AV LAS LOMAS'),
(45, 1, 'shipping_address_2', ''),
(46, 1, 'shipping_city', 'LIMA'),
(47, 1, 'shipping_postcode', 'LIMA01'),
(48, 1, 'shipping_country', 'PE'),
(49, 1, 'shipping_state', 'LMA'),
(50, 1, 'facebook', ''),
(51, 1, 'instagram', ''),
(52, 1, 'linkedin', ''),
(53, 1, 'myspace', ''),
(54, 1, 'pinterest', ''),
(55, 1, 'soundcloud', ''),
(56, 1, 'tumblr', ''),
(57, 1, 'twitter', ''),
(58, 1, 'youtube', ''),
(59, 1, 'wikipedia', ''),
(60, 1, 'last_update', '1593705231'),
(61, 1, 'al_user-settings', 'libraryContent=browse&editor=tinymce'),
(62, 1, 'al_user-settings-time', '1592881941'),
(63, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(64, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:21:\"add-post-type-product\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-product_cat\";i:3;s:15:\"add-product_tag\";}'),
(65, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:1:{s:32:\"98dce83da57b0395e163467c9dae521b\";a:11:{s:3:\"key\";s:32:\"98dce83da57b0395e163467c9dae521b\";s:10:\"product_id\";i:93;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:6;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:270000;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:270000;s:8:\"line_tax\";i:0;}}}'),
(67, 1, 'closedpostboxes_page', 'a:0:{}'),
(68, 1, 'metaboxhidden_page', 'a:9:{i:0;s:23:\"acf-group_5ef66e7c44f75\";i:1;s:23:\"acf-group_5ef16a9892c8f\";i:2;s:23:\"acf-group_5ef167b665448\";i:3;s:23:\"acf-group_5ef693afb75e3\";i:4;s:23:\"acf-group_5ef6643c9d19d\";i:5;s:23:\"acf-group_5ef6369452513\";i:6;s:16:\"commentstatusdiv\";i:7;s:7:\"slugdiv\";i:8;s:9:\"authordiv\";}'),
(69, 1, 'nav_menu_recently_edited', '47'),
(72, 1, 'meta-box-order_product', 'a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:84:\"submitdiv,product_catdiv,tagsdiv-product_tag,postimagediv,woocommerce-product-images\";s:6:\"normal\";s:283:\"wpseo_meta,acf-group_5ef65653ee0c9,acf-group_5ef66e7c44f75,acf-group_5ef16a9892c8f,acf-group_5ef167b665448,acf-group_5ef693afb75e3,acf-group_5efc2e02ba9ea,acf-group_5efc2f1057c85,acf-group_5efc3445d76ef,acf-group_5ef6369452513,woocommerce-product-data,slugdiv,postexcerpt,commentsdiv\";s:8:\"advanced\";s:0:\"\";}'),
(73, 1, 'screen_layout_product', '2'),
(74, 1, 'imagen_perfil', '312'),
(75, 1, '_imagen_perfil', 'field_5efd44ab85b55'),
(76, 1, 'shipping_method', ''),
(79, 1, 'dismissed_no_shipping_methods_notice', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_users`
--

CREATE TABLE `al_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_users`
--

INSERT INTO `al_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BX2w4G4tkJgxsEewXZXChitpnLVdre.', 'admin', 'frankdelarosacampos@gmail.com', '', '2020-06-22 16:55:46', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_wc_download_log`
--

CREATE TABLE `al_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_wc_product_meta_lookup`
--

CREATE TABLE `al_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(10,2) DEFAULT NULL,
  `max_price` decimal(10,2) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_wc_product_meta_lookup`
--

INSERT INTO `al_wc_product_meta_lookup` (`product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`) VALUES
(93, '', 0, 0, '54000.00', '54000.00', 1, NULL, 'instock', 0, '0.00', 0),
(139, '', 0, 0, '58000.00', '58000.00', 1, NULL, 'instock', 0, '0.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_wc_tax_rate_classes`
--

CREATE TABLE `al_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_wc_tax_rate_classes`
--

INSERT INTO `al_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_wc_webhooks`
--

CREATE TABLE `al_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_api_keys`
--

CREATE TABLE `al_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_attribute_taxonomies`
--

CREATE TABLE `al_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_woocommerce_attribute_taxonomies`
--

INSERT INTO `al_woocommerce_attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`) VALUES
(1, 'color', 'Color', 'select', 'menu_order', 0),
(2, 'cilindrada', 'Cilindrada', 'select', 'menu_order', 0),
(3, 'posicion', 'posicion', 'select', 'menu_order', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `al_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_log`
--

CREATE TABLE `al_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_order_itemmeta`
--

CREATE TABLE `al_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_woocommerce_order_itemmeta`
--

INSERT INTO `al_woocommerce_order_itemmeta` (`meta_id`, `order_item_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_product_id', '93'),
(2, 1, '_variation_id', '0'),
(3, 1, '_qty', '5'),
(4, 1, '_tax_class', ''),
(5, 1, '_line_subtotal', '270000'),
(6, 1, '_line_subtotal_tax', '0'),
(7, 1, '_line_total', '270000'),
(8, 1, '_line_tax', '0'),
(9, 1, '_line_tax_data', 'a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}'),
(10, 2, '_product_id', '93'),
(11, 2, '_variation_id', '0'),
(12, 2, '_qty', '6'),
(13, 2, '_tax_class', ''),
(14, 2, '_line_subtotal', '324000'),
(15, 2, '_line_subtotal_tax', '0'),
(16, 2, '_line_total', '324000'),
(17, 2, '_line_tax', '0'),
(18, 2, '_line_tax_data', 'a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_order_items`
--

CREATE TABLE `al_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_woocommerce_order_items`
--

INSERT INTO `al_woocommerce_order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `order_id`) VALUES
(1, 'GSX-R1000-A', 'line_item', 313),
(2, 'GSX-R1000-A', 'line_item', 314);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_payment_tokenmeta`
--

CREATE TABLE `al_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_payment_tokens`
--

CREATE TABLE `al_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_sessions`
--

CREATE TABLE `al_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_woocommerce_sessions`
--

INSERT INTO `al_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(3830, '1', 'a:8:{s:4:\"cart\";s:418:\"a:1:{s:32:\"98dce83da57b0395e163467c9dae521b\";a:11:{s:3:\"key\";s:32:\"98dce83da57b0395e163467c9dae521b\";s:10:\"product_id\";i:93;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:6;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:324000;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:324000;s:8:\"line_tax\";i:0;}}\";s:11:\"cart_totals\";s:402:\"a:15:{s:8:\"subtotal\";s:6:\"324000\";s:12:\"subtotal_tax\";d:0;s:14:\"shipping_total\";s:1:\"0\";s:12:\"shipping_tax\";d:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";d:0;s:12:\"discount_tax\";d:0;s:19:\"cart_contents_total\";s:6:\"324000\";s:17:\"cart_contents_tax\";d:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";s:1:\"0\";s:7:\"fee_tax\";d:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:6:\"324000\";s:9:\"total_tax\";d:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:693:\"a:26:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:3:\"LIM\";s:7:\"country\";s:2:\"PE\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:3:\"LIM\";s:16:\"shipping_country\";s:2:\"PE\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";s:22:\"mailchimp_landing_site\";s:73:\"http://dev.almango-master.com/wp-admin/admin-ajax.php?_fs_blog_admin=true\";}', 1595452232);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_shipping_zones`
--

CREATE TABLE `al_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_shipping_zone_locations`
--

CREATE TABLE `al_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_shipping_zone_methods`
--

CREATE TABLE `al_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_tax_rates`
--

CREATE TABLE `al_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_woocommerce_tax_rate_locations`
--

CREATE TABLE `al_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_yoast_seo_links`
--

CREATE TABLE `al_yoast_seo_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `target_post_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `al_yoast_seo_meta`
--

CREATE TABLE `al_yoast_seo_meta` (
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `internal_link_count` int(10) UNSIGNED DEFAULT NULL,
  `incoming_link_count` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `al_yoast_seo_meta`
--

INSERT INTO `al_yoast_seo_meta` (`object_id`, `internal_link_count`, `incoming_link_count`) VALUES
(4, 0, 0),
(7, 0, 0),
(8, 0, 0),
(10, 0, 0),
(93, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(107, 0, 0),
(108, 0, 0),
(109, 0, 0),
(110, 0, 0),
(111, 0, 0),
(112, 0, 0),
(115, 0, 0),
(138, 0, 0),
(139, 0, 0),
(158, 0, 0),
(159, 0, 0),
(200, 0, 0),
(201, 0, 0),
(202, 0, 0),
(203, 0, 0),
(204, 0, 0),
(205, 0, 0),
(206, 0, 0),
(207, 0, 0),
(208, 0, 0),
(209, 0, 0),
(210, 0, 0),
(211, 0, 0),
(212, 0, 0),
(213, 0, 0),
(214, 0, 0),
(308, 0, 0),
(315, 0, 0),
(320, 0, 0),
(341, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `al_actionscheduler_actions`
--
ALTER TABLE `al_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indices de la tabla `al_actionscheduler_claims`
--
ALTER TABLE `al_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indices de la tabla `al_actionscheduler_groups`
--
ALTER TABLE `al_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indices de la tabla `al_actionscheduler_logs`
--
ALTER TABLE `al_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indices de la tabla `al_cf7dbplugin_st`
--
ALTER TABLE `al_cf7dbplugin_st`
  ADD PRIMARY KEY (`submit_time`);

--
-- Indices de la tabla `al_cf7dbplugin_submits`
--
ALTER TABLE `al_cf7dbplugin_submits`
  ADD KEY `submit_time_idx` (`submit_time`),
  ADD KEY `form_name_idx` (`form_name`),
  ADD KEY `field_name_idx` (`field_name`);

--
-- Indices de la tabla `al_commentmeta`
--
ALTER TABLE `al_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `al_comments`
--
ALTER TABLE `al_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indices de la tabla `al_finaltiles_gallery`
--
ALTER TABLE `al_finaltiles_gallery`
  ADD UNIQUE KEY `Id` (`Id`);

--
-- Indices de la tabla `al_finaltiles_gallery_images`
--
ALTER TABLE `al_finaltiles_gallery_images`
  ADD UNIQUE KEY `id` (`Id`);

--
-- Indices de la tabla `al_links`
--
ALTER TABLE `al_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indices de la tabla `al_mailchimp_carts`
--
ALTER TABLE `al_mailchimp_carts`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `al_mailchimp_jobs`
--
ALTER TABLE `al_mailchimp_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `al_options`
--
ALTER TABLE `al_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indices de la tabla `al_postmeta`
--
ALTER TABLE `al_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `al_posts`
--
ALTER TABLE `al_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indices de la tabla `al_termmeta`
--
ALTER TABLE `al_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `al_terms`
--
ALTER TABLE `al_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indices de la tabla `al_term_relationships`
--
ALTER TABLE `al_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indices de la tabla `al_term_taxonomy`
--
ALTER TABLE `al_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indices de la tabla `al_usermeta`
--
ALTER TABLE `al_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `al_users`
--
ALTER TABLE `al_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indices de la tabla `al_wc_download_log`
--
ALTER TABLE `al_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indices de la tabla `al_wc_product_meta_lookup`
--
ALTER TABLE `al_wc_product_meta_lookup`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `virtual` (`virtual`),
  ADD KEY `downloadable` (`downloadable`),
  ADD KEY `stock_status` (`stock_status`),
  ADD KEY `stock_quantity` (`stock_quantity`),
  ADD KEY `onsale` (`onsale`),
  ADD KEY `min_max_price` (`min_price`,`max_price`);

--
-- Indices de la tabla `al_wc_tax_rate_classes`
--
ALTER TABLE `al_wc_tax_rate_classes`
  ADD PRIMARY KEY (`tax_rate_class_id`),
  ADD UNIQUE KEY `slug` (`slug`(191));

--
-- Indices de la tabla `al_wc_webhooks`
--
ALTER TABLE `al_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `al_woocommerce_api_keys`
--
ALTER TABLE `al_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indices de la tabla `al_woocommerce_attribute_taxonomies`
--
ALTER TABLE `al_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indices de la tabla `al_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `al_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`);

--
-- Indices de la tabla `al_woocommerce_log`
--
ALTER TABLE `al_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indices de la tabla `al_woocommerce_order_itemmeta`
--
ALTER TABLE `al_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indices de la tabla `al_woocommerce_order_items`
--
ALTER TABLE `al_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `al_woocommerce_payment_tokenmeta`
--
ALTER TABLE `al_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indices de la tabla `al_woocommerce_payment_tokens`
--
ALTER TABLE `al_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `al_woocommerce_sessions`
--
ALTER TABLE `al_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Indices de la tabla `al_woocommerce_shipping_zones`
--
ALTER TABLE `al_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indices de la tabla `al_woocommerce_shipping_zone_locations`
--
ALTER TABLE `al_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indices de la tabla `al_woocommerce_shipping_zone_methods`
--
ALTER TABLE `al_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indices de la tabla `al_woocommerce_tax_rates`
--
ALTER TABLE `al_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indices de la tabla `al_woocommerce_tax_rate_locations`
--
ALTER TABLE `al_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indices de la tabla `al_yoast_seo_links`
--
ALTER TABLE `al_yoast_seo_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`);

--
-- Indices de la tabla `al_yoast_seo_meta`
--
ALTER TABLE `al_yoast_seo_meta`
  ADD UNIQUE KEY `object_id` (`object_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `al_actionscheduler_actions`
--
ALTER TABLE `al_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `al_actionscheduler_claims`
--
ALTER TABLE `al_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2415;

--
-- AUTO_INCREMENT de la tabla `al_actionscheduler_groups`
--
ALTER TABLE `al_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `al_actionscheduler_logs`
--
ALTER TABLE `al_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `al_commentmeta`
--
ALTER TABLE `al_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_comments`
--
ALTER TABLE `al_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `al_finaltiles_gallery`
--
ALTER TABLE `al_finaltiles_gallery`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `al_finaltiles_gallery_images`
--
ALTER TABLE `al_finaltiles_gallery_images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `al_links`
--
ALTER TABLE `al_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_mailchimp_jobs`
--
ALTER TABLE `al_mailchimp_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_options`
--
ALTER TABLE `al_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4098;

--
-- AUTO_INCREMENT de la tabla `al_postmeta`
--
ALTER TABLE `al_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1517;

--
-- AUTO_INCREMENT de la tabla `al_posts`
--
ALTER TABLE `al_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT de la tabla `al_termmeta`
--
ALTER TABLE `al_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT de la tabla `al_terms`
--
ALTER TABLE `al_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `al_term_taxonomy`
--
ALTER TABLE `al_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `al_usermeta`
--
ALTER TABLE `al_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `al_users`
--
ALTER TABLE `al_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `al_wc_download_log`
--
ALTER TABLE `al_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_wc_tax_rate_classes`
--
ALTER TABLE `al_wc_tax_rate_classes`
  MODIFY `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `al_wc_webhooks`
--
ALTER TABLE `al_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_api_keys`
--
ALTER TABLE `al_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_attribute_taxonomies`
--
ALTER TABLE `al_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `al_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_log`
--
ALTER TABLE `al_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_order_itemmeta`
--
ALTER TABLE `al_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_order_items`
--
ALTER TABLE `al_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_payment_tokenmeta`
--
ALTER TABLE `al_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_payment_tokens`
--
ALTER TABLE `al_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_sessions`
--
ALTER TABLE `al_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4178;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_shipping_zones`
--
ALTER TABLE `al_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_shipping_zone_locations`
--
ALTER TABLE `al_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_shipping_zone_methods`
--
ALTER TABLE `al_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_tax_rates`
--
ALTER TABLE `al_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_woocommerce_tax_rate_locations`
--
ALTER TABLE `al_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `al_yoast_seo_links`
--
ALTER TABLE `al_yoast_seo_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `al_wc_download_log`
--
ALTER TABLE `al_wc_download_log`
  ADD CONSTRAINT `fk_al_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `al_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
