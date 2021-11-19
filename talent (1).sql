-- Adminer 4.7.4 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE `advertisements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisements_user_id_foreign` (`user_id`),
  CONSTRAINT `advertisements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE `blog_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog_categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'ut beatae fugiat',	0,	5,	NULL,	'2021-09-20 00:01:11',	'2021-09-20 00:01:11',	NULL),
(2,	'iure rerum magnam',	0,	5,	NULL,	'2021-09-20 00:01:13',	'2021-09-20 00:01:13',	NULL),
(3,	'voluptates et consequatur',	1,	5,	NULL,	'2021-09-20 00:01:15',	'2021-09-20 00:01:15',	NULL),
(4,	'aliquam odio vero',	1,	5,	NULL,	'2021-09-20 00:01:16',	'2021-09-20 00:01:16',	NULL),
(5,	'quibusdam aut itaque',	1,	5,	NULL,	'2021-09-20 00:01:18',	'2021-09-20 00:01:18',	NULL),
(6,	'eum deserunt consectetur',	0,	5,	NULL,	'2021-09-20 00:01:20',	'2021-09-20 00:01:20',	NULL),
(7,	'eaque blanditiis ratione',	1,	5,	NULL,	'2021-09-20 00:01:21',	'2021-09-20 00:01:21',	NULL),
(8,	'facilis facilis dolor',	0,	5,	NULL,	'2021-09-20 00:01:22',	'2021-09-20 00:01:22',	NULL),
(9,	'aspernatur consectetur quia',	0,	5,	NULL,	'2021-09-20 00:01:23',	'2021-09-20 00:01:23',	NULL),
(10,	'expedita dignissimos eligendi',	0,	5,	NULL,	'2021-09-20 00:01:24',	'2021-09-20 00:01:24',	NULL),
(11,	'magni deleniti ipsa',	0,	5,	NULL,	'2021-09-23 13:02:40',	'2021-09-23 13:02:40',	NULL),
(12,	'est omnis ut',	0,	5,	NULL,	'2021-09-23 13:02:43',	'2021-09-23 13:02:43',	NULL),
(13,	'dolor modi nemo',	1,	5,	NULL,	'2021-09-23 13:02:44',	'2021-09-23 13:02:44',	NULL),
(14,	'repudiandae ea odit',	1,	5,	NULL,	'2021-09-23 13:02:48',	'2021-09-23 13:02:48',	NULL),
(15,	'aut voluptate deserunt',	0,	5,	NULL,	'2021-09-23 13:02:51',	'2021-09-23 13:02:51',	NULL),
(16,	'debitis fugiat sint',	0,	5,	NULL,	'2021-09-23 13:02:55',	'2021-09-23 13:02:55',	NULL),
(17,	'sed eum itaque',	1,	5,	NULL,	'2021-09-23 13:03:02',	'2021-09-23 13:03:02',	NULL),
(18,	'eaque veritatis laboriosam',	1,	5,	NULL,	'2021-09-23 13:03:05',	'2021-09-23 13:03:05',	NULL),
(19,	'eveniet mollitia et',	1,	5,	NULL,	'2021-09-23 13:03:07',	'2021-09-23 13:03:07',	NULL),
(20,	'praesentium iusto odio',	1,	5,	NULL,	'2021-09-23 13:03:09',	'2021-09-23 13:03:09',	NULL);

DROP TABLE IF EXISTS `blog_map_categories`;
CREATE TABLE `blog_map_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_map_categories_blog_id_index` (`blog_id`),
  KEY `blog_map_categories_category_id_index` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog_map_categories` (`id`, `blog_id`, `category_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	3),
(4,	4,	4),
(5,	5,	5),
(6,	6,	6),
(7,	7,	7),
(8,	8,	8),
(9,	9,	9),
(10,	10,	10),
(11,	11,	11),
(12,	12,	12),
(13,	13,	13),
(14,	14,	14),
(15,	15,	15),
(16,	16,	16),
(17,	17,	17),
(18,	18,	18),
(19,	19,	19),
(20,	20,	20);

DROP TABLE IF EXISTS `blog_map_tags`;
CREATE TABLE `blog_map_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_map_tags_blog_id_index` (`blog_id`),
  KEY `blog_map_tags_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog_map_tags` (`id`, `blog_id`, `tag_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	3),
(4,	4,	4),
(5,	5,	5),
(6,	6,	6),
(7,	7,	7),
(8,	8,	8),
(9,	9,	9),
(10,	10,	10),
(11,	11,	11),
(12,	12,	12),
(13,	13,	13),
(14,	14,	14),
(15,	15,	15),
(16,	16,	16),
(17,	17,	17),
(18,	18,	18),
(19,	19,	19),
(20,	20,	20);

DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog_tags` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'unde',	1,	5,	NULL,	'2021-09-20 00:01:12',	'2021-09-20 00:01:12',	NULL),
(2,	'autem',	1,	5,	NULL,	'2021-09-20 00:01:14',	'2021-09-20 00:01:14',	NULL),
(3,	'corrupti',	0,	5,	NULL,	'2021-09-20 00:01:16',	'2021-09-20 00:01:16',	NULL),
(4,	'explicabo',	0,	5,	NULL,	'2021-09-20 00:01:18',	'2021-09-20 00:01:18',	NULL),
(5,	'distinctio',	0,	5,	NULL,	'2021-09-20 00:01:19',	'2021-09-20 00:01:19',	NULL),
(6,	'rerum',	0,	5,	NULL,	'2021-09-20 00:01:20',	'2021-09-20 00:01:20',	NULL),
(7,	'quo',	1,	5,	NULL,	'2021-09-20 00:01:22',	'2021-09-20 00:01:22',	NULL),
(8,	'ducimus',	0,	5,	NULL,	'2021-09-20 00:01:23',	'2021-09-20 00:01:23',	NULL),
(9,	'et',	1,	5,	NULL,	'2021-09-20 00:01:24',	'2021-09-20 00:01:24',	NULL),
(10,	'ut',	0,	5,	NULL,	'2021-09-20 00:01:25',	'2021-09-20 00:01:25',	NULL),
(11,	'tempora',	0,	5,	NULL,	'2021-09-23 13:02:42',	'2021-09-23 13:02:42',	NULL),
(12,	'sequi',	1,	5,	NULL,	'2021-09-23 13:02:43',	'2021-09-23 13:02:43',	NULL),
(13,	'sint',	1,	5,	NULL,	'2021-09-23 13:02:46',	'2021-09-23 13:02:46',	NULL),
(14,	'illo',	0,	5,	NULL,	'2021-09-23 13:02:50',	'2021-09-23 13:02:50',	NULL),
(15,	'sed',	1,	5,	NULL,	'2021-09-23 13:02:53',	'2021-09-23 13:02:53',	NULL),
(16,	'exercitationem',	0,	5,	NULL,	'2021-09-23 13:02:58',	'2021-09-23 13:02:58',	NULL),
(17,	'necessitatibus',	1,	5,	NULL,	'2021-09-23 13:03:03',	'2021-09-23 13:03:03',	NULL),
(18,	'debitis',	0,	5,	NULL,	'2021-09-23 13:03:05',	'2021-09-23 13:03:05',	NULL),
(19,	'repellat',	1,	5,	NULL,	'2021-09-23 13:03:09',	'2021-09-23 13:03:09',	NULL),
(20,	'odio',	1,	5,	NULL,	'2021-09-23 13:03:09',	'2021-09-23 13:03:09',	NULL);

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_datetime` datetime NOT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cannonical_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => InActive, 1 => Published, 2 => Draft, 3 => Scheduled',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blogs` (`id`, `name`, `publish_datetime`, `featured_image`, `content`, `meta_title`, `cannonical_link`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'natus aliquid inventore',	'1980-09-01 02:26:00',	NULL,	'Repudiandae voluptatem et voluptatibus illo minus dolorum maiores natus. Sunt in cumque quo aperiam recusandae amet. Quam amet corporis qui dolorem autem qui sed.',	'molestiae ut totam',	'http://www.russel.com/rerum-excepturi-est-tempore-voluptas-eos-numquam-unde-voluptatibus',	'incidunt-dolor-voluptas-et-perspiciatis',	'Ad modi doloremque fuga laudantium error molestiae minima. Et ut qui nostrum ut autem omnis. Amet eos laboriosam et blanditiis enim sit.',	'animi',	0,	5,	NULL,	'2021-09-20 00:01:09',	'2021-09-20 00:01:09',	NULL),
(2,	'tenetur hic id',	'1989-05-30 14:08:54',	NULL,	'Quam consequatur dolores officiis sequi dolorem. Molestiae in enim deserunt est autem dolor eveniet. Ut consequatur laudantium repellendus odit adipisci sed quasi consequuntur. Vel consectetur amet saepe tempore et dolor perferendis.',	'rerum eveniet nihil',	'http://www.reichel.com/',	'perspiciatis-perferendis-sint-est-expedita-corrupti-deserunt',	'Pariatur soluta et est distinctio. Doloribus qui nihil id veniam odit ipsam. Voluptatem provident laborum nemo dolores quia voluptatem reiciendis sit. Quia ut quisquam enim nostrum labore modi.',	'rerum',	2,	5,	NULL,	'2021-09-20 00:01:09',	'2021-09-20 00:01:09',	NULL),
(3,	'ab occaecati eaque',	'1985-05-26 16:23:56',	NULL,	'Enim odit totam molestias atque. Reiciendis consequatur similique repellat dolores animi est corporis animi. Fugit omnis et quisquam reprehenderit cum laborum optio illum. Exercitationem cumque cupiditate voluptatem dolor qui harum dolores.',	'rem architecto enim',	'http://www.braun.com/et-laborum-atque-rerum',	'ut-iste-dolor-ea-eos-enim-voluptatem-autem',	'Suscipit voluptatibus laudantium exercitationem voluptas modi voluptas consectetur. Est omnis occaecati velit vitae labore voluptate. Impedit id enim assumenda velit adipisci nam consequatur qui.',	'reprehenderit',	0,	5,	NULL,	'2021-09-20 00:01:09',	'2021-09-20 00:01:09',	NULL),
(4,	'omnis occaecati officiis',	'1991-06-17 15:17:02',	NULL,	'Autem reprehenderit ut voluptatum delectus aliquid exercitationem inventore. Pariatur nesciunt iste non dolore laudantium quibusdam. Animi consequatur et incidunt magnam rerum dolore.',	'eos et autem',	'http://damore.info/eius-officia-delectus-rem-et-tempore-optio-nulla.html',	'ut-quasi-et-ut-beatae-excepturi',	'Blanditiis consequatur dolorum minus rerum id repellendus et. Autem dolor delectus sit dolorem reiciendis explicabo ullam omnis. Illum nihil corporis doloribus assumenda incidunt sed provident facere. Modi qui sed ut id.',	'aliquam',	0,	5,	NULL,	'2021-09-20 00:01:09',	'2021-09-20 00:01:09',	NULL),
(5,	'id quis voluptatem',	'2002-05-26 19:50:02',	NULL,	'Architecto et est quas quae earum. Quia esse id culpa.',	'aut placeat adipisci',	'http://dach.com/velit-sit-laudantium-error-nisi-eos-vel-dolore-corrupti',	'explicabo-laborum-voluptatum-non-delectus-quos-qui-ab',	'Repellat aliquam molestiae vero explicabo ut fugit voluptatem. Repellendus tempore sit dolore aut sed. Eos iste nulla et odit ipsa et aut. Est ducimus rerum cumque dolorum repellendus.',	'nihil',	2,	5,	NULL,	'2021-09-20 00:01:09',	'2021-09-20 00:01:09',	NULL),
(6,	'velit aut harum',	'2020-03-05 23:35:17',	NULL,	'Voluptatem tempore repudiandae expedita quae tempora iure ipsa. Rerum ut dolorum animi quisquam id. Corporis consectetur accusantium expedita facere dolorum.',	'deleniti ipsa esse',	'http://torphy.com/ab-itaque-quis-quia-eos-modi',	'eligendi-neque-molestiae-tenetur-repudiandae-enim',	'Mollitia autem quia et ut accusantium harum. Maxime animi tempore adipisci suscipit sint rerum voluptatibus eveniet. Quo esse quam soluta autem et. Neque perferendis nesciunt delectus adipisci.',	'sed',	3,	5,	NULL,	'2021-09-20 00:01:10',	'2021-09-20 00:01:10',	NULL),
(7,	'repudiandae omnis quia',	'1975-12-16 08:36:43',	NULL,	'Ab porro eos enim tenetur corrupti. Dolorem possimus voluptates sit totam voluptatem autem et. Dignissimos aperiam et excepturi ut quos. Fugiat a beatae totam vel et.',	'enim non minus',	'http://www.hamill.com/eos-maxime-officia-reiciendis-nostrum-omnis-reiciendis',	'perferendis-provident-rerum-magni-dolor-occaecati-aliquid-dolores-non',	'Ut nemo est porro amet dolores. Voluptas ut omnis cumque. Hic quas aut nostrum illo accusantium quod.',	'atque',	3,	5,	NULL,	'2021-09-20 00:01:10',	'2021-09-20 00:01:10',	NULL),
(8,	'maxime qui fugiat',	'2016-04-28 21:45:55',	NULL,	'Dignissimos ab deserunt ut rem aut quisquam. Aut qui nisi nostrum ea maxime explicabo assumenda. Eos itaque voluptates et magnam voluptas.',	'et omnis necessitatibus',	'http://www.nitzsche.com/aut-exercitationem-maxime-voluptatem-minus-tempore',	'enim-architecto-velit-autem-libero-tempore-eum-et',	'Voluptas quia et accusamus in veritatis qui. Quibusdam aut quis eos deserunt minima dolor quia. Totam voluptas voluptatem suscipit quis. Sed commodi est reprehenderit id deserunt quod nostrum.',	'rerum',	2,	5,	NULL,	'2021-09-20 00:01:11',	'2021-09-20 00:01:11',	NULL),
(9,	'voluptas ratione consequatur',	'2017-11-01 02:36:28',	NULL,	'A ut non animi rerum ipsum inventore autem. Nam aut eos quia qui quae.',	'possimus dolores et',	'https://sporer.org/iusto-quia-nobis-quos-magnam-repellat-maiores-voluptatibus.html',	'molestiae-libero-vitae-accusantium-omnis-doloribus-ut',	'Eum beatae deserunt et omnis porro et sint doloremque. Ipsam vel nesciunt nisi placeat occaecati asperiores quasi.',	'dolor',	1,	5,	NULL,	'2021-09-20 00:01:11',	'2021-09-20 00:01:11',	NULL),
(10,	'qui et cum',	'1980-12-30 15:33:40',	NULL,	'Dignissimos eos aut qui officiis ipsum fugiat ratione numquam. Sed nisi quia nobis nulla nihil aliquam ullam. Sit sed qui vero eveniet. Beatae id sit minus nostrum illum alias.',	'et explicabo autem',	'http://rau.com/quisquam-quidem-nostrum-voluptas-molestias-aliquam-eum-quo',	'vitae-ea-excepturi-quia-quia-molestiae-aut-dolorem',	'Eum quae ut natus quam et praesentium suscipit. Repudiandae vero omnis ea labore qui. Quia libero consequatur similique illo minus. Dolore dolores unde ipsam ut tempore odio enim quasi.',	'beatae',	1,	5,	NULL,	'2021-09-20 00:01:11',	'2021-09-20 00:01:11',	NULL),
(11,	'et qui nihil',	'2017-10-30 01:01:28',	NULL,	'Aliquam a et eum dolorem. Et est consequatur veritatis soluta perspiciatis aut totam. Voluptas repudiandae temporibus enim dolore. Ratione eveniet amet quo. Et quod voluptatum saepe fuga.',	'facere ullam placeat',	'http://upton.org/aspernatur-sed-omnis-in-earum.html',	'eum-dolore-neque-eaque',	'Ut sit aut voluptatem aut placeat ipsa. Distinctio animi nihil eum dolor rem ab.',	'maxime',	2,	5,	NULL,	'2021-09-23 13:02:27',	'2021-09-23 13:02:27',	NULL),
(12,	'a harum a',	'1974-01-07 15:26:19',	NULL,	'Molestiae placeat hic qui. Autem doloribus itaque sit odit repudiandae vel. Nulla quod et itaque commodi.',	'omnis ratione quia',	'http://durgan.com/vel-quia-qui-eos-cupiditate-aut-qui.html',	'rerum-dolorum-eius-ea-reprehenderit-sit-voluptates-doloremque',	'Nisi aut qui asperiores. Magnam et ullam nihil tempora. Possimus tenetur et aut sit dicta.',	'consequatur',	0,	5,	NULL,	'2021-09-23 13:02:28',	'2021-09-23 13:02:28',	NULL),
(13,	'esse officia excepturi',	'1975-01-05 15:26:12',	NULL,	'Sed impedit dolorem aliquam autem sit id. Beatae dicta magni repellendus non dolore. Velit doloribus voluptas ipsum minus. In at laborum quidem sint dicta voluptatem in.',	'velit numquam voluptas',	'http://www.lemke.net/',	'sunt-nihil-nobis-itaque-incidunt-et-quasi',	'Suscipit error non dolorum ut blanditiis. Quia voluptatem aut et praesentium. Iusto consequuntur fuga perferendis est consequatur accusantium. Necessitatibus incidunt inventore rerum fugiat.',	'dolorum',	1,	5,	NULL,	'2021-09-23 13:02:28',	'2021-09-23 13:02:28',	NULL),
(14,	'et fugit consequuntur',	'2004-07-14 14:31:54',	NULL,	'Aut doloribus voluptatem ullam repellendus quo. Voluptates soluta nostrum adipisci velit voluptate accusamus itaque. Ratione neque quam in saepe animi. Consequatur accusantium cupiditate dolores omnis et repudiandae in.',	'voluptatem temporibus pariatur',	'http://streich.net/',	'qui-expedita-aut-sed-voluptas',	'Ut voluptatem reiciendis vitae atque voluptates id. Similique temporibus corrupti est quo. Voluptatem animi dicta omnis et. Mollitia est quis non.',	'nostrum',	2,	5,	NULL,	'2021-09-23 13:02:29',	'2021-09-23 13:02:29',	NULL),
(15,	'nostrum aliquid tempore',	'1970-04-01 22:25:29',	NULL,	'Blanditiis a ut et autem aut quae quae itaque. Eos id soluta adipisci. Veritatis quos placeat esse in.',	'maiores et quo',	'http://www.rippin.net/',	'fugiat-blanditiis-et-facere-praesentium-nisi-rem-fuga',	'Reiciendis non fugit et qui ducimus aut blanditiis. Blanditiis culpa voluptate deserunt quis ipsum reprehenderit aliquid. Magnam minima voluptatem aliquid nisi sint et amet.',	'tempora',	3,	5,	NULL,	'2021-09-23 13:02:30',	'2021-09-23 13:02:30',	NULL),
(16,	'quia consequatur voluptas',	'2007-01-23 16:13:30',	NULL,	'Culpa blanditiis est eos autem. Quos est harum quod eum qui. Quae nobis dolor ut et. Ea ut ea aliquam.',	'vero molestias cumque',	'http://lemke.biz/non-voluptatum-quia-occaecati-voluptatem-odit-mollitia-natus',	'iure-est-qui-eligendi-eos',	'Dolore eos neque laudantium incidunt omnis eos. Quia architecto rerum explicabo quis id in. Velit distinctio soluta quia repellat aliquam.',	'nisi',	1,	5,	NULL,	'2021-09-23 13:02:32',	'2021-09-23 13:02:32',	NULL),
(17,	'placeat et et',	'1987-06-12 08:44:30',	NULL,	'Quae sed et deleniti et. Velit est quia et molestiae. Ut odio praesentium rem voluptates rerum autem.',	'facere magni amet',	'http://raynor.com/tempora-et-laudantium-numquam-vel-nostrum-reiciendis.html',	'est-qui-enim-facilis-aut',	'Odit sint numquam aut dicta dolorem delectus consequatur minus. In in quo facere repellat. Voluptatem ab atque assumenda officia excepturi. Est et sit facilis tempore blanditiis quisquam numquam.',	'voluptatem',	0,	5,	NULL,	'2021-09-23 13:02:33',	'2021-09-23 13:02:33',	NULL),
(18,	'labore est a',	'1994-02-12 00:48:39',	NULL,	'Quo et et autem. Ex natus expedita mollitia. Dolore sapiente similique distinctio asperiores rem minus rem voluptas. Et quasi magnam fugit est nemo.',	'eius blanditiis iusto',	'http://www.schmidt.biz/sed-voluptates-iste-ex-et-sed-quibusdam-excepturi',	'aut-tempora-consequatur-eum-dolorem-asperiores',	'Aut incidunt veritatis aut est. Animi odit quia voluptatem accusamus est et non ea. Enim dolore et vel nisi et est. Soluta aut et repellat optio tempore.',	'laboriosam',	2,	5,	NULL,	'2021-09-23 13:02:35',	'2021-09-23 13:02:35',	NULL),
(19,	'et tenetur nostrum',	'2009-03-11 08:42:03',	NULL,	'Neque aut enim aut qui tempora praesentium facere quo. Molestiae voluptate esse nesciunt officiis dolore aut. Soluta et consequatur voluptas iure molestiae. Est debitis consectetur praesentium voluptas nesciunt molestiae et.',	'ut aut aspernatur',	'https://www.hyatt.org/consequatur-quia-et-eos-blanditiis-inventore-dolor-totam-voluptatem',	'omnis-rem-eum-recusandae-minima',	'Et ipsa possimus amet accusamus et quasi minus. Vero sapiente dolorem molestiae sit accusamus eius ut. At earum deleniti sed cumque. Autem autem saepe quam veniam facilis facilis molestiae ipsum.',	'voluptas',	2,	5,	NULL,	'2021-09-23 13:02:36',	'2021-09-23 13:02:36',	NULL),
(20,	'quasi sapiente neque',	'1985-10-29 01:18:41',	NULL,	'Tempore ea consectetur consectetur ratione molestiae voluptates quia. Rem repellat sint iste nulla dolorem. Eveniet ad natus non perspiciatis inventore sed qui sint. A voluptatibus sit autem quia odio voluptatem ex.',	'architecto numquam sit',	'http://www.reichel.com/non-sit-vero-atque',	'nemo-repellendus-odit-unde-atque-consequatur-nulla',	'Ad laborum nihil iste facere. Nulla et et blanditiis. Quis eum enim et sint ea.',	'omnis',	3,	5,	NULL,	'2021-09-23 13:02:39',	'2021-09-23 13:02:39',	NULL);

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `candidate_education`;
CREATE TABLE `candidate_education` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `education_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_education_user_id_foreign` (`user_id`),
  KEY `candidate_education_education_id_foreign` (`education_id`),
  CONSTRAINT `candidate_education_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`),
  CONSTRAINT `candidate_education_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume_headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_summary` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefered_location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `candidates_user_id_foreign` (`user_id`),
  CONSTRAINT `candidates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `degree` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_url` text COLLATE utf8mb4_unicode_ci,
  `domain_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `educations`;
CREATE TABLE `educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `degree` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `email_templates` (`id`, `title`, `slug`, `content`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Tempore aut rerum tenetur est consectetur.',	'tempore-aut-rerum-tenetur-est-consectetur',	'Rerum aliquid quia optio dolor deleniti vel. Rerum voluptatibus delectus est nobis. Sint omnis omnis esse sit rerum. Odio repellendus sapiente quia.',	0,	2,	NULL,	'2021-09-21 05:04:32',	NULL,	NULL),
(2,	'Cumque distinctio sed fuga eum.',	'cumque-distinctio-sed-fuga-eum',	'Magnam autem cumque unde qui accusantium magni. Excepturi velit et beatae est ducimus. Qui minima ducimus ut ut est. Id non sapiente sed sequi.',	1,	2,	NULL,	'2021-09-19 07:49:30',	NULL,	NULL),
(3,	'Et et illo alias.',	'et-et-illo-alias',	'Esse consequuntur at voluptatem iusto sapiente repellat voluptates. Dicta in beatae sit ut aut. Eligendi et porro deserunt dolores sunt nobis voluptas.',	1,	1,	NULL,	'2021-09-20 00:52:34',	NULL,	NULL),
(4,	'Consequatur quis est.',	'consequatur-quis-est',	'Minus aliquam eos libero ex. Qui omnis aut nihil modi.',	1,	2,	NULL,	'2021-09-18 19:26:30',	NULL,	NULL),
(5,	'Quia nulla aliquid aut.',	'quia-nulla-aliquid-aut',	'Illum illo sed sit. Sit quia cum voluptatem impedit sed praesentium atque. Distinctio quia repellendus vel illum voluptate.',	1,	2,	NULL,	'2021-09-18 22:33:03',	NULL,	NULL),
(6,	'Occaecati officiis eveniet sit assumenda.',	'occaecati-officiis-eveniet-sit-assumenda',	'Et vitae dolorem distinctio nemo molestiae et molestiae quia. Vel ut odio ab qui et. Architecto minima eum suscipit quis nemo iusto laudantium.',	1,	1,	NULL,	'2021-09-18 23:27:22',	NULL,	NULL),
(7,	'Ipsa aspernatur ipsa asperiores a non.',	'ipsa-aspernatur-ipsa-asperiores-a-non',	'Vero nostrum dicta aspernatur assumenda dolores earum maxime. In eum consequatur veniam rerum et iure. Tempora sequi et quibusdam voluptatem ullam. Laboriosam sit sed autem non et cupiditate vel est.',	1,	2,	NULL,	'2021-09-20 04:32:20',	NULL,	NULL),
(8,	'Minima accusantium maiores occaecati.',	'minima-accusantium-maiores-occaecati',	'Corrupti soluta soluta earum velit corporis. Qui explicabo dolores ab ipsam quia maxime sunt rem. Vel qui rem numquam molestiae fugiat. Enim facere quia vel magni fuga accusantium cupiditate. Velit eum nihil omnis assumenda.',	1,	2,	NULL,	'2021-09-18 22:41:50',	NULL,	NULL),
(9,	'Aut adipisci cum alias.',	'aut-adipisci-cum-alias',	'Vel ex officia sint exercitationem molestiae. Architecto rem impedit qui et nostrum non. Quos ullam aut nemo laboriosam.',	1,	1,	NULL,	'2021-09-18 04:13:57',	NULL,	NULL),
(10,	'Necessitatibus aut et laudantium omnis.',	'necessitatibus-aut-et-laudantium-omnis',	'Maiores harum qui molestiae quas non. Tenetur occaecati expedita laboriosam quam dolor ipsum.',	0,	1,	NULL,	'2021-09-17 01:09:59',	NULL,	NULL),
(11,	'Commodi quia fuga.',	'commodi-quia-fuga',	'Atque saepe aut ipsam et ex. Cupiditate nisi voluptas molestiae dolor non dolores distinctio. Sed delectus eos corporis maxime. Est quam rerum voluptatem ea qui.',	0,	2,	NULL,	'2021-09-16 08:13:54',	NULL,	NULL),
(12,	'Sint nisi aut voluptatem.',	'sint-nisi-aut-voluptatem',	'Temporibus eos voluptas nulla non exercitationem. Nulla ea sit quo qui a aut. Perferendis culpa sint necessitatibus qui autem harum. Et nihil aliquam nobis possimus ducimus.',	0,	1,	NULL,	'2021-09-21 13:42:15',	NULL,	NULL),
(13,	'Voluptatum incidunt non officia.',	'voluptatum-incidunt-non-officia',	'Et itaque aut iusto quos ab aut repellat. Quis dolor et dicta mollitia. Voluptas rerum quisquam nihil quae est beatae sequi quod.',	1,	1,	NULL,	'2021-09-15 06:19:08',	NULL,	NULL),
(14,	'Accusamus hic facilis rerum quo.',	'accusamus-hic-facilis-rerum-quo',	'Ut dolore aut velit modi hic rerum. Sint animi non earum aut qui doloribus qui ipsum. Voluptas libero est vero aperiam nisi ut consectetur. Error porro eum doloremque dignissimos officia quam harum sit.',	1,	2,	NULL,	'2021-09-23 12:48:32',	NULL,	NULL),
(15,	'Quaerat qui cumque natus.',	'quaerat-qui-cumque-natus',	'Repudiandae et molestiae in ipsam repellat quis molestiae. Et id dignissimos nemo et doloribus eligendi. Totam suscipit occaecati cumque architecto quae.',	0,	1,	NULL,	'2021-09-17 11:17:19',	NULL,	NULL),
(16,	'Et voluptas cumque natus est.',	'et-voluptas-cumque-natus-est',	'Quia aut tenetur cupiditate. Quasi occaecati velit ut consequuntur. Quam nostrum ad eum cumque non. Eos sit nesciunt natus dignissimos quos sunt nemo.',	1,	2,	NULL,	'2021-09-20 01:59:02',	NULL,	NULL),
(17,	'Excepturi sit neque qui.',	'excepturi-sit-neque-qui',	'Tempora aut maxime culpa perferendis. Voluptates iste maiores iste aut voluptas. Rerum cupiditate fugiat sit eum ut veritatis nemo.',	1,	2,	NULL,	'2021-09-21 15:43:49',	NULL,	NULL),
(18,	'Quae exercitationem quaerat consequatur pariatur magni.',	'quae-exercitationem-quaerat-consequatur-pariatur-magni',	'Qui accusamus nihil corporis asperiores. Quam ipsum nihil nostrum. Molestiae id ut autem nulla dolorum incidunt voluptatem.',	0,	1,	NULL,	'2021-09-18 10:48:43',	NULL,	NULL),
(19,	'Quisquam sunt et tenetur rerum.',	'quisquam-sunt-et-tenetur-rerum',	'Dolorem qui labore excepturi et. Consequatur deserunt ea dicta eligendi qui. Temporibus vel sequi sed voluptates sequi hic sit rerum. Perspiciatis voluptate voluptas explicabo quos.',	1,	2,	NULL,	'2021-09-17 18:48:17',	NULL,	NULL),
(20,	'Perspiciatis sint quis numquam.',	'perspiciatis-sint-quis-numquam',	'Officiis saepe explicabo dolor dolor quis. Qui molestias ad beatae blanditiis id fugiat. Asperiores repellendus harum ea. Occaecati neque rerum quisquam placeat nostrum sit. Reprehenderit aut voluptas eligendi architecto.',	0,	1,	NULL,	'2021-09-20 14:14:35',	NULL,	NULL),
(21,	'Recusandae suscipit quasi repudiandae quis.',	'recusandae-suscipit-quasi-repudiandae-quis',	'Beatae veritatis repudiandae in illum suscipit deleniti ipsa ea. Est odit molestias atque beatae minus. Perspiciatis quam culpa dignissimos veniam.',	0,	2,	NULL,	'2021-09-19 05:58:42',	NULL,	NULL),
(22,	'Minus voluptas quia culpa ipsa voluptatibus.',	'minus-voluptas-quia-culpa-ipsa-voluptatibus',	'Excepturi eum ipsam nulla. Eos eos commodi quisquam consequatur nulla. Odio voluptatem est nemo sit qui fuga. Libero repellendus magni nam rerum velit et nemo. Nam voluptatem fugiat voluptatum eius quaerat et explicabo.',	1,	2,	NULL,	'2021-09-21 07:59:15',	NULL,	NULL),
(23,	'Molestiae et in sed neque et.',	'molestiae-et-in-sed-neque-et',	'Perferendis ut est consequatur sit ut qui maiores. Quia neque amet est quibusdam magni incidunt velit. Pariatur mollitia et et. Optio impedit quia beatae rem qui error et inventore.',	0,	1,	NULL,	'2021-09-19 00:22:21',	NULL,	NULL),
(24,	'Quaerat necessitatibus illum praesentium.',	'quaerat-necessitatibus-illum-praesentium',	'Omnis eos sed ut nisi et rem blanditiis. Rem eaque vero nam molestiae numquam. Et error omnis natus voluptatibus quisquam et ex.',	1,	2,	NULL,	'2021-09-20 16:08:46',	NULL,	NULL),
(25,	'Blanditiis harum eum dignissimos aut aperiam.',	'blanditiis-harum-eum-dignissimos-aut-aperiam',	'Sed quibusdam non sequi vel culpa similique voluptatem. In accusantium placeat qui sapiente. Tenetur suscipit amet reprehenderit sit iste voluptate eveniet.',	1,	2,	NULL,	'2021-09-21 23:24:41',	NULL,	NULL),
(26,	'Voluptates ut quae laudantium.',	'voluptates-ut-quae-laudantium',	'Sequi aut natus saepe delectus blanditiis. Est dolor distinctio id occaecati sed impedit vero et. Sint eum non quia voluptatibus rem nihil. Sit itaque laudantium qui veritatis dolorem quae reprehenderit.',	0,	2,	NULL,	'2021-09-16 06:28:35',	NULL,	NULL),
(27,	'Reiciendis eaque corrupti quia.',	'reiciendis-eaque-corrupti-quia',	'Ut quaerat voluptas numquam qui rerum officiis et. Impedit ut error vitae rerum. Sequi aliquam provident quas suscipit architecto ex.',	1,	1,	NULL,	'2021-09-22 14:48:04',	NULL,	NULL),
(28,	'Maiores molestiae quas ea.',	'maiores-molestiae-quas-ea',	'Est accusantium dolor id molestiae eveniet temporibus. At totam placeat est quia totam et. Dolorem quis minus nesciunt ipsam nam et voluptatem sit. Qui quidem consequuntur incidunt et.',	1,	2,	NULL,	'2021-09-17 02:34:27',	NULL,	NULL),
(29,	'Qui enim suscipit.',	'qui-enim-suscipit',	'Numquam magni tempore optio et similique. Dolore commodi excepturi omnis sapiente autem est sit. Maxime ut animi quia quia labore expedita. Qui cum fugiat quae dolor aut eos eum.',	1,	2,	NULL,	'2021-09-20 20:45:36',	NULL,	NULL),
(30,	'Iure voluptate rerum.',	'iure-voluptate-rerum',	'Voluptates laborum aliquam optio nesciunt recusandae. Maiores voluptas sunt vero sunt repellendus. Sed ut perspiciatis ipsam autem aut sunt odit totam. Assumenda id inventore beatae omnis quos aut neque sint.',	1,	1,	NULL,	'2021-09-21 17:51:38',	NULL,	NULL),
(31,	'Deleniti nihil enim excepturi id sunt.',	'deleniti-nihil-enim-excepturi-id-sunt',	'Quasi nihil nihil earum aliquid repudiandae eligendi. Voluptatem laboriosam corporis eos. Qui iure dolorem molestias quia cumque. Rerum exercitationem quo enim corrupti enim voluptates saepe.',	0,	2,	NULL,	'2021-09-13 18:08:40',	NULL,	NULL),
(32,	'Aliquid quod est qui nobis.',	'aliquid-quod-est-qui-nobis',	'Error quidem iure repellat commodi dolorem beatae esse. Facilis dolorem ipsa aut quia voluptatem. Deserunt non aut accusamus nihil.',	0,	1,	NULL,	'2021-09-14 15:07:34',	NULL,	NULL),
(33,	'Quae vel tenetur ipsa asperiores.',	'quae-vel-tenetur-ipsa-asperiores',	'Reiciendis aut possimus autem dolore. Nihil perspiciatis ipsum quas dolores provident nihil aliquam. Rerum et nostrum nihil repellat. Modi dolores tenetur minima et.',	1,	1,	NULL,	'2021-09-22 12:16:42',	NULL,	NULL),
(34,	'Sed consequatur assumenda accusamus corrupti.',	'sed-consequatur-assumenda-accusamus-corrupti',	'Laudantium laboriosam labore consequatur maxime dolorem qui eveniet. Praesentium ipsam eum molestiae expedita dolorem. Animi culpa nihil quisquam numquam tempore et dolorem error.',	1,	2,	NULL,	'2021-09-14 20:07:21',	NULL,	NULL),
(35,	'Ut ut sint consequatur dolorem.',	'ut-ut-sint-consequatur-dolorem',	'Sequi deleniti tempore accusantium ducimus distinctio culpa qui. Minima fuga qui voluptas. Illo eos rerum vero et qui rerum maxime unde.',	1,	1,	NULL,	'2021-09-13 20:12:28',	NULL,	NULL),
(36,	'Itaque tenetur error exercitationem ad.',	'itaque-tenetur-error-exercitationem-ad',	'Reprehenderit quia non itaque pariatur soluta. Vel praesentium voluptatibus impedit eum veniam inventore. Quasi et aliquid eligendi tempora quisquam deleniti. Et possimus quod ducimus pariatur tempora.',	0,	1,	NULL,	'2021-09-16 15:25:58',	NULL,	NULL),
(37,	'Inventore quasi et dolores.',	'inventore-quasi-et-dolores',	'Aut veritatis nobis dolor excepturi quis enim. Officiis voluptatibus qui quis sit sit magni officia odio. Nostrum temporibus ullam aperiam cupiditate eos reprehenderit.',	1,	1,	NULL,	'2021-09-21 22:03:43',	NULL,	NULL),
(38,	'Ut voluptatem nihil neque soluta a.',	'ut-voluptatem-nihil-neque-soluta-a',	'Ducimus debitis dignissimos quidem. Iusto quis perspiciatis repellat atque in. Dolor vitae mollitia qui. Eaque nihil et sunt soluta.',	0,	1,	NULL,	'2021-09-15 22:08:45',	NULL,	NULL),
(39,	'Dolore recusandae fuga laborum.',	'dolore-recusandae-fuga-laborum',	'Earum numquam sint sint ducimus ad ut laborum. Quos laudantium incidunt molestiae maiores et eum magni. Ex et molestias dignissimos molestiae et non. Est aut velit accusamus aliquam illo modi. Soluta voluptatem repellat dolor accusantium consequatur laudantium eligendi.',	0,	1,	NULL,	'2021-09-19 20:21:47',	NULL,	NULL),
(40,	'Modi sequi et.',	'modi-sequi-et',	'Corporis non provident similique excepturi hic maxime. Voluptatem rerum tempore ut reiciendis repellat error. Tempore incidunt autem facilis. Doloribus quasi qui labore et ipsam praesentium.',	0,	1,	NULL,	'2021-09-16 00:46:51',	NULL,	NULL),
(41,	'Eum consectetur doloremque eius atque.',	'eum-consectetur-doloremque-eius-atque',	'Totam veritatis reiciendis voluptate saepe hic quasi. Commodi autem placeat ut eius repellendus sunt. Eum quia doloremque aperiam omnis atque voluptates. Unde est totam quia placeat sint id.',	1,	2,	NULL,	'2021-09-15 07:03:59',	NULL,	NULL),
(42,	'Repellendus eaque inventore porro.',	'repellendus-eaque-inventore-porro',	'Voluptatem eos reiciendis consequatur autem est velit est. Veritatis quod ratione et cupiditate tempora. Est sequi libero dolor voluptas magni maxime.',	1,	2,	NULL,	'2021-09-14 16:09:00',	NULL,	NULL),
(43,	'Facilis quo voluptatibus assumenda sed repudiandae.',	'facilis-quo-voluptatibus-assumenda-sed-repudiandae',	'Aperiam in molestiae corrupti sed autem. Est odio et sit deleniti iure inventore. Totam at voluptate sequi voluptatem autem quod laudantium. Voluptates in molestiae quis officiis soluta.',	0,	2,	NULL,	'2021-09-19 06:59:01',	NULL,	NULL),
(44,	'Rerum ratione eum enim.',	'rerum-ratione-eum-enim',	'Fuga vitae laboriosam dolores tenetur. Aliquid atque debitis qui et quod. Voluptatem ut saepe explicabo numquam vitae dolor similique.',	0,	1,	NULL,	'2021-09-19 07:45:16',	NULL,	NULL),
(45,	'In autem dolores voluptas.',	'in-autem-dolores-voluptas',	'Neque id ex optio excepturi eaque non ut. Eligendi quod adipisci rem nobis sed. Autem eum dolorem et aut veniam exercitationem quasi est. Veniam occaecati consectetur consequatur distinctio asperiores veritatis.',	1,	2,	NULL,	'2021-09-16 13:58:41',	NULL,	NULL),
(46,	'Exercitationem beatae perferendis est.',	'exercitationem-beatae-perferendis-est',	'Voluptatem rerum unde qui modi qui porro. Sed nihil molestias quo quidem eius. Sint in aut animi sunt. Pariatur inventore exercitationem cum odit at nesciunt.',	0,	2,	NULL,	'2021-09-14 20:53:41',	NULL,	NULL),
(47,	'Totam nemo explicabo et.',	'totam-nemo-explicabo-et',	'Et et rem est ratione officia laudantium. Reprehenderit deserunt adipisci voluptates et voluptatem voluptatem id. Quae cumque eligendi eum nam eos. Iure ut iste minima doloribus.',	0,	1,	NULL,	'2021-09-19 20:36:18',	NULL,	NULL),
(48,	'Omnis sed laboriosam ipsa sit.',	'omnis-sed-laboriosam-ipsa-sit',	'Ut atque sed et neque et quidem. Sit voluptas est aut quibusdam fuga expedita quia. Eum id quis minima voluptatem ut est voluptas. Atque consequatur voluptas in aut atque nihil eos.',	1,	1,	NULL,	'2021-09-20 19:57:48',	NULL,	NULL),
(49,	'Autem excepturi voluptatem.',	'autem-excepturi-voluptatem',	'Cum aut quam sunt est sit eum. Et quam est voluptatem dolores velit. Harum temporibus iste repellat neque.',	1,	1,	NULL,	'2021-09-22 01:40:50',	NULL,	NULL),
(50,	'Qui eligendi illum.',	'qui-eligendi-illum',	'Nesciunt quidem ut reprehenderit omnis rem. At quo debitis iure quam consequatur minima delectus.',	0,	2,	NULL,	'2021-09-23 10:03:03',	NULL,	NULL);

DROP TABLE IF EXISTS `employer_contact`;
CREATE TABLE `employer_contact` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_contact_user_id_foreign` (`user_id`),
  KEY `employer_contact_contact_id_foreign` (`contact_id`),
  CONSTRAINT `employer_contact_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `employer_contact_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `employers`;
CREATE TABLE `employers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domains_summary` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `employers_user_id_foreign` (`user_id`),
  CONSTRAINT `employers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Quis debitis quo est.',	'Molestiae cumque hic harum ex repellendus repellendus cum veniam. Iste enim perspiciatis ex. Tenetur est et reprehenderit saepe totam saepe.',	0,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(2,	'Vel alias aliquid et expedita officia illum.',	'Harum et voluptatibus quae fugiat facere at beatae. Quae et libero quis consequuntur. Corporis quo iste aliquam ipsa doloribus voluptatibus.',	0,	'2021-09-20 00:01:03',	'2021-09-20 00:01:03',	NULL),
(3,	'Provident consectetur eos ad aspernatur omnis alias deserunt accusantium.',	'Molestiae vitae nisi voluptatem facere ipsam sit. Et veniam illo eos aspernatur mollitia. Earum quisquam non vero dolor sit. Ea maiores neque quasi.',	0,	'2021-09-20 00:01:03',	'2021-09-20 00:01:03',	NULL),
(4,	'Qui culpa illo ex quasi.',	'Aspernatur voluptas eos quidem commodi quibusdam tenetur facilis. Qui unde expedita et. Nobis provident error saepe ipsum et quo. Numquam sed et delectus assumenda illum.',	0,	'2021-09-20 00:01:03',	'2021-09-20 00:01:03',	NULL),
(5,	'Sapiente et molestiae nobis quos.',	'Libero odit nemo velit non alias maiores occaecati necessitatibus. Exercitationem nemo repellat voluptatem repudiandae. Non qui et sint consequuntur modi ad. Dolorem fuga iure facilis minus suscipit.',	0,	'2021-09-20 00:01:04',	'2021-09-20 00:01:04',	NULL),
(6,	'Facere aut eum dolorem.',	'Et architecto ipsa aliquid. Magnam voluptas est sit consequatur inventore. Accusantium illum laborum incidunt.',	1,	'2021-09-20 00:01:04',	'2021-09-20 00:01:04',	NULL),
(7,	'Officia dolorem cum veritatis minus a iste.',	'Modi quia reprehenderit ipsam voluptas libero molestiae. Reprehenderit aut a voluptas voluptatibus ut cumque officiis. Amet occaecati modi suscipit sit tempore magnam ut. Animi iusto corrupti magni vitae saepe vero. Enim tempore et incidunt similique necessitatibus rerum.',	0,	'2021-09-20 00:01:04',	'2021-09-20 00:01:04',	NULL),
(8,	'Non impedit illo quasi quam laudantium.',	'Quam qui non neque quas deserunt eligendi molestiae. Autem dignissimos excepturi aut aspernatur ipsa quisquam facilis quasi. Numquam deleniti ipsa rem debitis dolor asperiores.',	1,	'2021-09-20 00:01:04',	'2021-09-20 00:01:04',	NULL),
(9,	'Ducimus sunt soluta dolorem voluptatem.',	'Quidem eum incidunt repellat voluptate quaerat nam. Corrupti quos non et. Amet veniam amet doloremque qui. Inventore sapiente voluptatem in officia qui.',	0,	'2021-09-20 00:01:05',	'2021-09-20 00:01:05',	NULL),
(10,	'Saepe nisi rerum sed.',	'Adipisci distinctio necessitatibus architecto similique. Ratione magni quasi nesciunt pariatur corporis quia deleniti. Officiis facere velit autem totam qui expedita.',	1,	'2021-09-20 00:01:05',	'2021-09-20 00:01:05',	NULL),
(11,	'Qui perspiciatis voluptatem odio harum sunt et.',	'Inventore similique harum perspiciatis et quia natus ut. Autem reprehenderit neque vel ut deserunt nostrum. Possimus dolorem repellendus commodi modi.',	1,	'2021-09-23 13:02:09',	'2021-09-23 13:02:09',	NULL),
(12,	'Et qui et ut veritatis magnam optio ut.',	'Qui ad autem laboriosam non consectetur vel. Reiciendis nisi praesentium velit porro velit consequatur. Aut perferendis rerum at nemo quaerat. Velit quisquam sit ea nobis. Impedit eum dicta est cupiditate ea perspiciatis iusto.',	0,	'2021-09-23 13:02:10',	'2021-09-23 13:02:10',	NULL),
(13,	'Sapiente exercitationem veritatis aliquid laudantium adipisci sapiente.',	'Voluptas ut qui commodi et est rerum. Ab saepe sunt aperiam eius veritatis esse. Suscipit ut at ea deserunt porro est cumque suscipit. Autem qui aperiam sit quia dicta dolore perferendis sit. Velit ut vel cumque animi molestiae.',	1,	'2021-09-23 13:02:11',	'2021-09-23 13:02:11',	NULL),
(14,	'Magnam ut sunt quas animi et vel magnam.',	'Quia et ipsa architecto dicta. Qui soluta id voluptas eaque magni sint dolorem. Voluptas consectetur repellendus sunt eum explicabo id ducimus sint.',	1,	'2021-09-23 13:02:11',	'2021-09-23 13:02:11',	NULL),
(15,	'Minus et saepe et.',	'Inventore et recusandae exercitationem temporibus omnis autem unde. Omnis excepturi pariatur magni laudantium. Quod et dignissimos ducimus aliquid. Aliquam eveniet voluptatem dicta deleniti facilis praesentium fugiat.',	0,	'2021-09-23 13:02:12',	'2021-09-23 13:02:12',	NULL),
(16,	'Voluptatem qui dolores optio nesciunt nulla eos quo.',	'Quam nulla itaque qui et rem. Quaerat voluptates maiores eos aut. Expedita aut corrupti quidem aliquid sit dolorum est. Quas et aliquid tenetur corporis hic blanditiis. Aliquam molestias ut velit dolore consequatur pariatur.',	0,	'2021-09-23 13:02:13',	'2021-09-23 13:02:13',	NULL),
(17,	'Maiores alias dolorum cupiditate dolorem ad aspernatur tempore.',	'Est magni quaerat pariatur. Nesciunt aut quis ea quidem soluta. Beatae nobis occaecati ea quo.',	0,	'2021-09-23 13:02:14',	'2021-09-23 13:02:14',	NULL),
(18,	'Ea eum dolorem quod illum quas ea.',	'Unde porro laudantium voluptas aut at in. In natus animi et quae sed doloribus sed. Reprehenderit accusamus itaque atque fugiat quaerat nihil nam. Consectetur ad laborum voluptas.',	0,	'2021-09-23 13:02:16',	'2021-09-23 13:02:16',	NULL),
(19,	'Dolores aliquid qui corrupti repudiandae.',	'Corrupti quibusdam qui omnis quia nisi molestias saepe. Suscipit sapiente id ipsum qui dolores ex. Autem tenetur in in quia. Quia sit et quia est.',	0,	'2021-09-23 13:02:17',	'2021-09-23 13:02:17',	NULL),
(20,	'Dolores magnam qui reprehenderit provident accusantium eos fugiat esse.',	'Qui consequatur id delectus reiciendis repellendus. Doloremque facere qui expedita est modi. Eligendi quo ex dolorum repudiandae et. Quos quidem non non architecto modi tempore ipsum et.',	0,	'2021-09-23 13:02:18',	'2021-09-23 13:02:18',	NULL);

DROP TABLE IF EXISTS `job_applications`;
CREATE TABLE `job_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jobpost_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_applications_user_id_foreign` (`user_id`),
  KEY `job_applications_jobpost_id_foreign` (`jobpost_id`),
  CONSTRAINT `job_applications_jobpost_id_foreign` FOREIGN KEY (`jobpost_id`) REFERENCES `jobposts` (`id`),
  CONSTRAINT `job_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobposts`;
CREATE TABLE `jobposts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobposts_user_id_foreign` (`user_id`),
  CONSTRAINT `jobposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ledgers`;
CREATE TABLE `ledgers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `recordable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recordable_id` bigint unsigned NOT NULL,
  `context` tinyint unsigned NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledgers_recordable_type_recordable_id_index` (`recordable_type`,`recordable_id`),
  KEY `ledgers_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ledgers` (`id`, `user_type`, `user_id`, `recordable_type`, `recordable_id`, `context`, `event`, `properties`, `modified`, `pivot`, `extra`, `url`, `ip_address`, `user_agent`, `signature`, `created_at`, `updated_at`) VALUES
(1,	NULL,	NULL,	'App\\Models\\Auth\\User',	8,	4,	'created',	'{\"email\":\"demouser001@007.com\",\"password\":\"$2y$10$GvDuFfukB84qvxkYPIgQpuvqdr0TMXZV0E\\/.61.uigFycKdnRf8Vi\",\"first_name\":\"demo\",\"last_name\":\"001\",\"status\":1,\"uuid\":\"ce309dc3-7ad4-400a-a77a-bdd7c8e43f41\",\"updated_at\":\"2021-09-25 11:50:15\",\"created_at\":\"2021-09-25 11:50:15\",\"id\":8}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demouser001%40007.com&first_name=demo&last_name=001&password=secret007&password_confirm=secret007',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'deff61672dfb02f699eadcee77097ea162e579b1157f740726061048ba160548fdd43709fb9e8ab2c81265cd6bff72c7c9422bf9f3168c7b9fa4272139c3735c',	'2021-09-25 06:20:15',	'2021-09-25 06:20:15'),
(2,	NULL,	NULL,	'App\\Models\\Auth\\User',	9,	4,	'created',	'{\"email\":\"demoCandidate001@007.com\",\"password\":\"$2y$10$N.UhL65D6B6i8uLTnYLTg.mh7RWLmxl11HnWxhDrZlrDGte5I01Ku\",\"first_name\":\"demoCandidate\",\"last_name\":\"002\",\"status\":1,\"uuid\":\"42692c63-dda7-4840-a10e-94ccc5b386b0\",\"updated_at\":\"2021-09-25 12:19:43\",\"created_at\":\"2021-09-25 12:19:43\",\"id\":9}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate001%40007.com&first_name=demoCandidate&last_name=002&password=secret007&password_confirm=secret007&signup_as=Candidatews',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'73c22cf73cf0f2844d978b29e18217eafa321a2a6aef5bf1aad8cd5040ea389dbba828839911b81cc66e175998351cdc0fb9e1d50b2d68ddd555e19edf21ed85',	'2021-09-25 06:49:43',	'2021-09-25 06:49:43'),
(3,	NULL,	NULL,	'App\\Models\\Auth\\User',	10,	4,	'created',	'{\"email\":\"demoCandidate003@007.com\",\"password\":\"$2y$10$dzJ3XCDWpBZeeNrGkIeVmepLvlQ8VuxsJ0X366JwiYIQi\\/2GE7Wti\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"96ee6e9a-9f92-4f0d-8be5-5b2d668d6760\",\"updated_at\":\"2021-09-25 12:22:01\",\"created_at\":\"2021-09-25 12:22:01\",\"id\":10}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate003%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidatew',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'ad7937412801929998c9557b90df6ffdbe45da2985c5fdb73dbe170802b31082385ec0041675a14e6fcf533213a062152fb8f84b637070ed65a187b04c15a036',	'2021-09-25 06:52:01',	'2021-09-25 06:52:01'),
(4,	NULL,	NULL,	'App\\Models\\Auth\\User',	11,	4,	'created',	'{\"email\":\"demoCandidate004@007.com\",\"password\":\"$2y$10$4yTKeSaW7PsSr27qZt1Ed.1iuPbSLf5Tkrnl5erGa8IJq\\/CyilME6\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"41ec674c-49bd-4075-b078-b48a0a09ddbd\",\"updated_at\":\"2021-09-25 12:23:06\",\"created_at\":\"2021-09-25 12:23:06\",\"id\":11}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate004%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidatew',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'4d083ff7e5526dc9bf03af5675ab6332b60a464890735690b5e13b76e3b017971677578abddcc53eb1e3e30aceaa2b241b410508a218b7083eaca752b43375e5',	'2021-09-25 06:53:06',	'2021-09-25 06:53:06'),
(5,	NULL,	NULL,	'App\\Models\\Auth\\User',	12,	4,	'created',	'{\"email\":\"demoCandidate005@007.com\",\"password\":\"$2y$10$LHEIe2MbozOQiCTTmenw9uyE3defuWIWeIfayxIOmz6Gs3CVRJiSG\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"b0925f40-9fc3-4ab3-bc77-d8b9d33d8011\",\"updated_at\":\"2021-09-25 12:27:46\",\"created_at\":\"2021-09-25 12:27:46\",\"id\":12}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate005%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'f9b794fd5c66380dd9e5a1a318051fb43a4a779c3a1c4131b9d024f4f4a225a4d9aea99c5efd7f3b06842f5aaf60ff88170879d66b67f1b0c0e079b786f03211',	'2021-09-25 06:57:46',	'2021-09-25 06:57:46'),
(6,	NULL,	NULL,	'App\\Models\\Auth\\User',	13,	4,	'created',	'{\"email\":\"demoCandidate006@007.com\",\"password\":\"$2y$10$P7.s7NTZtpGnYuDG.hVz7OFyjVkt0mD11nQUBLQbJBOaL9c1xl18S\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"d44e2636-4ecb-49c8-86ba-3cf302dc2364\",\"updated_at\":\"2021-09-25 12:28:15\",\"created_at\":\"2021-09-25 12:28:15\",\"id\":13}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate006%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'e5fba7f58318f3d5074f1a970792f364486357a140b1b91a6cb52f420a9ce053c61cdcfd6bda50b2a1f7085018798d20bcda99dcaf77cf1bcfaade05dc406ed1',	'2021-09-25 06:58:15',	'2021-09-25 06:58:15'),
(7,	NULL,	NULL,	'App\\Models\\Auth\\User',	14,	4,	'created',	'{\"email\":\"demoCandidate007@007.com\",\"password\":\"$2y$10$U5etD\\/XFMK1vA013p1p\\/HebBz.WYxokvyGtPQNcq062dYmqdR6fvG\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"23ad98b2-3ebb-4e4d-8623-f81499d61725\",\"updated_at\":\"2021-09-25 12:32:44\",\"created_at\":\"2021-09-25 12:32:44\",\"id\":14}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate007%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'a49e3ed775839043280fbe671f44b0b78595e8767c9f7676dfb6923b463defa5a3f0ad40d353ee46c8ac3931c9676427e2aaa65f1753975a0a6a68e5e923172f',	'2021-09-25 07:02:46',	'2021-09-25 07:02:46'),
(8,	NULL,	NULL,	'App\\Models\\Auth\\User',	15,	4,	'created',	'{\"email\":\"demoCandidate008@007.com\",\"password\":\"$2y$10$rxM\\/7YPlEIFAJf.qJuD4nuuhjirHb.EXQT\\/JXR5aadJMwfS\\/niydK\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"01566a23-36d1-456c-8453-4f901a170a5a\",\"updated_at\":\"2021-09-25 12:38:14\",\"created_at\":\"2021-09-25 12:38:14\",\"id\":15}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate008%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'68348b5b5e4fd7466e2b1dea8c9c903434c2672333c0a82967dd8f2cb3e1c248040ba366a3e9e576b016e18317dcc4d91d81ad7a5fc51aaef2dd3fb679f87811',	'2021-09-25 07:08:14',	'2021-09-25 07:08:14'),
(9,	NULL,	NULL,	'App\\Models\\Auth\\User',	16,	4,	'created',	'{\"email\":\"demoCandidate009@007.com\",\"password\":\"$2y$10$4dz9wX64ezqlELjP2S0Cru84l1wVKKzq\\/O2QcbrarA62hrSbdvX7.\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"35255b57-1c9a-4f42-b6e9-1772a17d9a8b\",\"updated_at\":\"2021-09-25 12:52:30\",\"created_at\":\"2021-09-25 12:52:30\",\"id\":16}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate009%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'e87de84b5854a1b7be91677aaffc622a9bea10d6933bcf14febbcfbbd023d5e86253cf69640df255cb4e92560d9539a04ccbbf199b242ea26a224b7991bb29d6',	'2021-09-25 07:22:30',	'2021-09-25 07:22:30'),
(10,	NULL,	NULL,	'App\\Models\\Auth\\User',	17,	4,	'created',	'{\"email\":\"demoCandidate010@007.com\",\"password\":\"$2y$10$F.9Ftq6ocEbGXgs1gcYfT.DYQok9liSGGykP3XrI4LXtUZgkF8fZ.\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"de6e84aa-7fad-4a72-9f45-20dffcb7d99e\",\"updated_at\":\"2021-09-25 12:54:01\",\"created_at\":\"2021-09-25 12:54:01\",\"id\":17}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate010%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'd0c43a0b230d2d4c7777d5211359151d59afb2837d1df98320c1038180184569b2fa5419a5bd4f23b51394db53bd3019f42d00ce1cc622ad0bd5c11296e94467',	'2021-09-25 07:24:01',	'2021-09-25 07:24:01'),
(11,	NULL,	NULL,	'App\\Models\\Auth\\User',	18,	4,	'created',	'{\"email\":\"demoCandidate011@007.com\",\"password\":\"$2y$10$MesBgheSVuCrIb\\/TdRY1Lum9YzztyF01\\/5p.HwYGI1XuHbJ2mWFEe\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"763b9d88-393e-4a66-8b66-c66d7a10d181\",\"updated_at\":\"2021-09-25 12:56:24\",\"created_at\":\"2021-09-25 12:56:24\",\"id\":18}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate011%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'ca1ccd21c28ad2bf7c247228f4d51a925c84c42d64f912c2142f82e45d66b57812897cec4ad1ca59dcf45320b904860dbc74fa9ac7940a04e4f5b318ae36b5e1',	'2021-09-25 07:26:24',	'2021-09-25 07:26:24'),
(12,	NULL,	NULL,	'App\\Models\\Auth\\User',	19,	4,	'created',	'{\"email\":\"demoCandidate012@007.com\",\"password\":\"$2y$10$oX7QSXLBMwkeXYwRqwFAie4LtNc4dOoJAA76G6dbr7SznALxY\\/f3a\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"e23e7474-e481-4c04-96dd-6d76df19c080\",\"updated_at\":\"2021-09-25 12:57:21\",\"created_at\":\"2021-09-25 12:57:21\",\"id\":19}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate012%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'3a858fea06457fc429845bfdf430c223eb2814264ab7250e917f354f871fe24b77966bf99f31f23049121f080188173a4c6a2bc0787e30f6f4954af74a5f2f52',	'2021-09-25 07:27:21',	'2021-09-25 07:27:21'),
(13,	NULL,	NULL,	'App\\Models\\Auth\\User',	19,	4,	'attached',	'{\"email\":\"demoCandidate012@007.com\",\"password\":\"$2y$10$oX7QSXLBMwkeXYwRqwFAie4LtNc4dOoJAA76G6dbr7SznALxY\\/f3a\",\"first_name\":\"demoCandidate\",\"last_name\":\"003\",\"status\":1,\"uuid\":\"e23e7474-e481-4c04-96dd-6d76df19c080\",\"updated_at\":\"2021-09-25 12:57:21\",\"created_at\":\"2021-09-25 12:57:21\",\"id\":19}',	'[]',	'{\"relation\":\"roles\",\"properties\":[{\"user_id\":19,\"role_id\":3}]}',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoCandidate012%40007.com&first_name=demoCandidate&last_name=003&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'fc1c057f398abc36add0d58f0dde94808b768dcd2fc1cc195b15f8b7ba7ff552776e23928d1e20c069782c2823721334a7367fbd7357c6ac68814b759c7acafa',	'2021-09-25 07:27:22',	'2021-09-25 07:27:22'),
(14,	NULL,	NULL,	'App\\Models\\Auth\\User',	20,	4,	'created',	'{\"email\":\"demoEmployer01@007.com\",\"password\":\"$2y$10$9EEOfOb0nytduF2nREtQouxCEhZ1RqhkgzYeFbKhnwjb26\\/ZOYxGy\",\"first_name\":\"demoEmployer\",\"last_name\":\"001\",\"status\":1,\"uuid\":\"7c8be1a0-4e98-485f-a98e-d3a931f76656\",\"updated_at\":\"2021-09-25 12:58:17\",\"created_at\":\"2021-09-25 12:58:17\",\"id\":20}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoEmployer01%40007.com&first_name=demoEmployer&last_name=001&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'57df138b588cd43c306407586af5483bfb6cfa2c88ef82f9f02d8995bc3c5946af031faf0ad93ef1c854c124fa60dfbcde0bc337104188c77ec510898c0b6091',	'2021-09-25 07:28:17',	'2021-09-25 07:28:17'),
(15,	NULL,	NULL,	'App\\Models\\Auth\\User',	20,	4,	'attached',	'{\"email\":\"demoEmployer01@007.com\",\"password\":\"$2y$10$9EEOfOb0nytduF2nREtQouxCEhZ1RqhkgzYeFbKhnwjb26\\/ZOYxGy\",\"first_name\":\"demoEmployer\",\"last_name\":\"001\",\"status\":1,\"uuid\":\"7c8be1a0-4e98-485f-a98e-d3a931f76656\",\"updated_at\":\"2021-09-25 12:58:17\",\"created_at\":\"2021-09-25 12:58:17\",\"id\":20}',	'[]',	'{\"relation\":\"roles\",\"properties\":[{\"user_id\":20,\"role_id\":3}]}',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoEmployer01%40007.com&first_name=demoEmployer&last_name=001&password=secret007&password_confirm=secret007&signup_as=Candidate',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'4e41a1876d31b39f3026fb4b4a5ddcb12abf2a610182bdcdf221008fa0174ab4f4d3508a0d855deb88462442adcc27b7b798af62b8ac9864159c6902a8739587',	'2021-09-25 07:28:18',	'2021-09-25 07:28:18'),
(16,	NULL,	NULL,	'App\\Models\\Auth\\User',	21,	4,	'created',	'{\"email\":\"demoEmployer02@007.com\",\"password\":\"$2y$10$pnVzZPVPzzVb3J5dU\\/IRReoCKglUiiZzXvhkov58MHhtvQysgM..G\",\"first_name\":\"demoEmployer\",\"last_name\":\"002\",\"status\":1,\"uuid\":\"6803a89b-dd8d-42e0-9f64-855d5f920bf2\",\"updated_at\":\"2021-09-25 12:59:18\",\"created_at\":\"2021-09-25 12:59:18\",\"id\":21}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoEmployer02%40007.com&first_name=demoEmployer&last_name=002&password=secret007&password_confirm=secret007&signup_as=Employer',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'30dc08fe2ab6c796d9b27626fb036400183d48d8bd6721377a35dac33d5c909314d42955e35f4a5e343ff83d4613547ab8b489cacf86f011b7d35aab18e7813c',	'2021-09-25 07:29:18',	'2021-09-25 07:29:18'),
(17,	NULL,	NULL,	'App\\Models\\Auth\\User',	21,	4,	'attached',	'{\"email\":\"demoEmployer02@007.com\",\"password\":\"$2y$10$pnVzZPVPzzVb3J5dU\\/IRReoCKglUiiZzXvhkov58MHhtvQysgM..G\",\"first_name\":\"demoEmployer\",\"last_name\":\"002\",\"status\":1,\"uuid\":\"6803a89b-dd8d-42e0-9f64-855d5f920bf2\",\"updated_at\":\"2021-09-25 12:59:18\",\"created_at\":\"2021-09-25 12:59:18\",\"id\":21}',	'[]',	'{\"relation\":\"roles\",\"properties\":[{\"user_id\":21,\"role_id\":2}]}',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoEmployer02%40007.com&first_name=demoEmployer&last_name=002&password=secret007&password_confirm=secret007&signup_as=Employer',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'8fd9847af2ee4cb551aed33cf9ca13159e0f32df98c5275fad0cce852bf7b901b66ef600a0ad79332933721062e037f11c1f43768e91d6950095a3df6ad97f14',	'2021-09-25 07:29:19',	'2021-09-25 07:29:19'),
(18,	NULL,	NULL,	'App\\Models\\Auth\\User',	22,	4,	'created',	'{\"email\":\"demoEmployer03@007.com\",\"password\":\"$2y$10$vZhCYN4dyTQ8pCLUZxuGoeaLTEL\\/kFqRE90L7vEhsgZgM8eas5vD6\",\"first_name\":\"demoEmployer\",\"last_name\":\"002\",\"status\":1,\"uuid\":\"89d97791-08e2-4bf4-b62f-8c8c3c182eb0\",\"updated_at\":\"2021-09-25 13:56:55\",\"created_at\":\"2021-09-25 13:56:55\",\"id\":22}',	'[\"email\",\"password\",\"first_name\",\"last_name\",\"status\",\"uuid\",\"updated_at\",\"created_at\",\"id\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoEmployer03%40007.com&first_name=demoEmployer&last_name=002&password=secret007&password_confirm=secret007&signup_as=Employer',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'c9e491a76087ec82b52734497ee4a81e8da346bb85f03cf648b1bc1926c088c632f8060c2aa824b9b75cc35de79345ccf1ea75b45ba2ce128a474f6ed32773dd',	'2021-09-25 08:26:56',	'2021-09-25 08:26:56'),
(19,	NULL,	NULL,	'App\\Models\\Auth\\User',	22,	4,	'attached',	'{\"email\":\"demoEmployer03@007.com\",\"password\":\"$2y$10$vZhCYN4dyTQ8pCLUZxuGoeaLTEL\\/kFqRE90L7vEhsgZgM8eas5vD6\",\"first_name\":\"demoEmployer\",\"last_name\":\"002\",\"status\":1,\"uuid\":\"89d97791-08e2-4bf4-b62f-8c8c3c182eb0\",\"updated_at\":\"2021-09-25 13:56:55\",\"created_at\":\"2021-09-25 13:56:55\",\"id\":22}',	'[]',	'{\"relation\":\"roles\",\"properties\":[{\"user_id\":22,\"role_id\":2}]}',	'[]',	'http://127.0.0.1:8000/api/v1/auth/signup?email=demoEmployer03%40007.com&first_name=demoEmployer&last_name=002&password=secret007&password_confirm=secret007&signup_as=Employer',	'127.0.0.1',	'PostmanRuntime/7.26.8',	'87cd57e3d54c41ce0fb2f63b1bfe4918231afead271e7066d0710945a2656f1364bbdc41965dee2d7ca885446a2ab0a8d16f0edeb0221cef488572557873dba9',	'2021-09-25 08:26:56',	'2021-09-25 08:26:56'),
(20,	'App\\Models\\Auth\\User',	1,	'App\\Models\\Auth\\User',	20,	4,	'deleted',	'{\"id\":20,\"uuid\":\"7c8be1a0-4e98-485f-a98e-d3a931f76656\",\"first_name\":\"demoEmployer\",\"last_name\":\"001\",\"email\":\"demoEmployer01@007.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$9EEOfOb0nytduF2nREtQouxCEhZ1RqhkgzYeFbKhnwjb26\\/ZOYxGy\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":null,\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":null,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-25 12:58:17\",\"updated_at\":\"2021-10-25 12:50:16\",\"deleted_at\":\"2021-10-25 12:50:16\"}',	'[]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/candidate/20',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'f2c06f62b2934a9ed0ad66af0ae6cc3de384929298d62eda6cf6926092e56e5de1d318ed59b5525442845ffc02befaea8f1e7b2bd5bcfc67178aee37385c68c8',	'2021-10-25 07:20:17',	'2021-10-25 07:20:17'),
(21,	'App\\Models\\Auth\\User',	1,	'App\\Models\\Auth\\User',	2,	4,	'deleted',	'{\"id\":2,\"uuid\":\"980268f5-e0a7-4a36-92b0-51b5a2dc1431\",\"first_name\":\"Justin\",\"last_name\":\"Bevan\",\"email\":\"executive@executive.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$.Et.L4RyrEXneauNGDyBDeB4LwhKuOTkLnKj1DQA4AL8hbnCTbK2u\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":\"a5d633ef73773052eedeeefeba6e5866\",\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":1,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-23 18:29:51\",\"updated_at\":\"2021-10-25 12:55:19\",\"deleted_at\":\"2021-10-25 12:55:19\"}',	'[]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/employer/2',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'1d963769a7fac3a582ab29c06068d9b6e677d0f423e057d5b6d754bbf3d297c475450524d6551f6bdf8e2449d71b12a3e81c3ef4e135d5669ca50fccccfbc304',	'2021-10-25 07:25:20',	'2021-10-25 07:25:20'),
(22,	NULL,	NULL,	'App\\Models\\Auth\\User',	19,	4,	'updated',	'{\"id\":19,\"uuid\":\"e23e7474-e481-4c04-96dd-6d76df19c080\",\"first_name\":\"demoCandidate\",\"last_name\":\"012\",\"email\":\"demoCandidate012@007.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$oX7QSXLBMwkeXYwRqwFAie4LtNc4dOoJAA76G6dbr7SznALxY\\/f3a\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":null,\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":null,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-25 12:57:21\",\"updated_at\":\"2021-10-26 13:45:19\",\"deleted_at\":null}',	'[\"last_name\",\"updated_at\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/candidate/19',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'b45239e808294c975baf3a5f1b4cd011456e08a7685a44c5e75ab75c73922653a5edf7844a584ce4771f4b4e1993adb558d9885b06573c77d956c3c1cef538b9',	'2021-10-26 08:15:21',	'2021-10-26 08:15:21'),
(23,	NULL,	NULL,	'App\\Models\\Auth\\User',	22,	4,	'updated',	'{\"id\":22,\"uuid\":\"89d97791-08e2-4bf4-b62f-8c8c3c182eb0\",\"first_name\":\"demoEmployer\",\"last_name\":\"003\",\"email\":\"demoEmployer03@007.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$vZhCYN4dyTQ8pCLUZxuGoeaLTEL\\/kFqRE90L7vEhsgZgM8eas5vD6\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":null,\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":null,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-25 13:56:55\",\"updated_at\":\"2021-10-26 13:52:30\",\"deleted_at\":null}',	'[\"last_name\",\"updated_at\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/candidate/22',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'5afb5feec9c21765867335502af23239a5dd26184554eface67d0a131e7cc6ffe7e814cb29cdac72a80a461e7a39d956b275d9ab9093e37dfc702f2a690f55cc',	'2021-10-26 08:22:30',	'2021-10-26 08:22:30'),
(24,	NULL,	NULL,	'App\\Models\\Auth\\User',	3,	4,	'updated',	'{\"id\":3,\"uuid\":\"3cac07e9-d975-4c37-ad83-308fdb3a9ca7\",\"first_name\":\"User\",\"last_name\":\"Test1\",\"email\":\"user@user.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$6242n5ZLXp0sNZywSesMZOeeI4LwZlOGQpYPotEIt98P0wH1FDkiC\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":\"b02723b9247b0343faf935fc07314bdf\",\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":1,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-23 18:29:51\",\"updated_at\":\"2021-10-27 18:15:51\",\"deleted_at\":null}',	'[\"last_name\",\"updated_at\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/candidate/3',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'1918358cfbc091808ab18e690ffacb3c4c944a16068c0a3a4f3ce8f4896b766df1519498263b5f2d55b8008d3556a2b6a7172c15b51b53070c142413b03e7c25',	'2021-10-27 12:45:53',	'2021-10-27 12:45:53'),
(25,	NULL,	NULL,	'App\\Models\\Auth\\User',	3,	4,	'updated',	'{\"id\":3,\"uuid\":\"3cac07e9-d975-4c37-ad83-308fdb3a9ca7\",\"first_name\":\"User\",\"last_name\":\"Test2\",\"email\":\"user@user.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$6242n5ZLXp0sNZywSesMZOeeI4LwZlOGQpYPotEIt98P0wH1FDkiC\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":\"b02723b9247b0343faf935fc07314bdf\",\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":1,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-23 18:29:51\",\"updated_at\":\"2021-10-29 20:15:07\",\"deleted_at\":null}',	'[\"last_name\",\"updated_at\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/candidate/3',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'6cc5af3652035e494d622da3f6e91bd0bc1418914cda690da75b845a45d46cf68df1832f10d6fc72e5c67868ecd8ddf5628865130bdd37ac8070bd0876772793',	'2021-10-29 14:45:07',	'2021-10-29 14:45:07'),
(26,	NULL,	NULL,	'App\\Models\\Auth\\User',	22,	4,	'updated',	'{\"id\":22,\"uuid\":\"89d97791-08e2-4bf4-b62f-8c8c3c182eb0\",\"first_name\":\"demoEmployer\",\"last_name\":\"004\",\"email\":\"demoEmployer03@007.com\",\"avatar_type\":\"gravatar\",\"avatar_location\":null,\"password\":\"$2y$10$vZhCYN4dyTQ8pCLUZxuGoeaLTEL\\/kFqRE90L7vEhsgZgM8eas5vD6\",\"password_changed_at\":null,\"active\":1,\"confirmation_code\":null,\"confirmed\":1,\"timezone\":null,\"last_login_at\":null,\"last_login_ip\":null,\"to_be_logged_out\":0,\"status\":1,\"created_by\":null,\"updated_by\":null,\"is_term_accept\":0,\"remember_token\":null,\"created_at\":\"2021-09-25 13:56:55\",\"updated_at\":\"2021-10-29 20:15:26\",\"deleted_at\":null}',	'[\"last_name\",\"updated_at\"]',	'[]',	'[]',	'http://127.0.0.1:8000/api/v1/candidate/22',	'127.0.0.1',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'92f4097c9d3f1d41a423486486674d6ca251f28d5fe861eb08157d14bec00b5770c02d06489f97d9d8d324e66a857facf58d202a22b891eef0fdc1e63ed730a9',	'2021-10-29 14:45:27',	'2021-10-29 14:45:27');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_06_01_000001_create_oauth_auth_codes_table',	1),
(4,	'2016_06_01_000002_create_oauth_access_tokens_table',	1),
(5,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	1),
(6,	'2016_06_01_000004_create_oauth_clients_table',	1),
(7,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	1),
(8,	'2017_09_03_144628_create_permission_tables',	1),
(9,	'2017_09_11_174816_create_social_accounts_table',	1),
(10,	'2017_09_26_140332_create_cache_table',	1),
(11,	'2017_09_26_140528_create_sessions_table',	1),
(12,	'2017_09_26_140609_create_jobs_table',	1),
(13,	'2017_11_02_060149_create_blog_categories_table',	1),
(14,	'2017_11_02_060149_create_blog_map_categories_table',	1),
(15,	'2017_11_02_060149_create_blog_map_tags_table',	1),
(16,	'2017_11_02_060149_create_blog_tags_table',	1),
(17,	'2017_11_02_060149_create_blogs_table',	1),
(18,	'2017_11_02_060149_create_domains_table',	1),
(19,	'2017_11_02_060149_create_faqs_table',	1),
(20,	'2017_11_02_060149_create_pages_table',	1),
(21,	'2018_04_08_033256_create_password_histories_table',	1),
(22,	'2018_11_21_000001_create_ledgers_table',	1),
(23,	'2019_08_19_000000_create_failed_jobs_table',	1),
(24,	'2020_06_11_080530_create_email_templates_table',	1),
(25,	'2020_06_18_060624_add_foreign_key_constraints_to_acl_tables',	1),
(26,	'2021_10_01_170823_create_employers_table',	2),
(27,	'2021_10_01_170859_create_candidate_table',	2),
(28,	'2021_10_01_170921_create_jobposts_table',	2),
(29,	'2021_10_01_170955_create_job_applications_table',	2),
(30,	'2021_10_01_171110_create_advertisements_table',	2),
(31,	'2021_10_01_180304_create_contacts_table',	2),
(32,	'2021_10_01_180341_create_educations_table',	2),
(33,	'2021_10_01_181532_create_candidate_education_table',	2),
(34,	'2021_10_01_181557_create_employer_contact_table',	2);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1a654b08475559990b8863798ed75fc35d2c8a0d46228738098d3079b6b8832493a3e8c1a72c05bd',	1,	2,	NULL,	'[]',	0,	'2021-10-28 23:57:31',	'2021-10-28 23:57:31',	'2022-10-29 05:27:31'),
('31af4ea40750eff30ff295a24f41d1af7fc89cfd7a86d075866f225629eac0214bde131568425df7',	8,	1,	'API Access Token',	'[]',	0,	'2021-09-25 06:21:21',	'2021-09-25 06:21:21',	'2022-09-25 11:51:21'),
('37ab17e2c2663b2f253660d6f5a54b4853ed8d61c86df8a76b57981f0a36c8c5237cffcdbc885faf',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-23 10:10:06',	'2021-10-23 10:10:06',	'2022-10-23 15:40:06'),
('37c9678f11a3d967f5de654e788c3d8e1f66da1a593a4cfbe3a316abf35a7944c96786bb46b3d9b6',	1,	1,	NULL,	'[]',	0,	'2021-09-25 04:15:27',	'2021-09-25 04:15:27',	'2022-09-25 09:45:27'),
('440e2c0d4be96b98d097a241e9c6391103d89496ef324d6c0d198caba9ec9d9fb99c119492590060',	21,	1,	'API Access Token',	'[]',	0,	'2021-09-25 07:53:31',	'2021-09-25 07:53:31',	'2022-09-25 13:23:31'),
('51aef6f9e67c3d928c1ffaa3ad6c813afee28bb7776e0b8c86550a83142b00f94c8b4eaace48b32e',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-23 10:25:38',	'2021-10-23 10:25:38',	'2022-10-23 15:55:38'),
('55a1bc69980b0078b98e99f5d2549ef5d80e8750324fb694d1bef87f312aac5c7cba0d4773e6a4ab',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-23 10:33:10',	'2021-10-23 10:33:10',	'2022-10-23 16:03:10'),
('7d79cb8138beb4218a0dadd3b226b1d263960a19a4823f39bdf3593f454352d2b9e7f3b5f09eec72',	22,	1,	'API Access Token',	'[]',	0,	'2021-09-25 08:38:03',	'2021-09-25 08:38:03',	'2022-09-25 14:08:03'),
('81e303d4b95429ac29948e0a33bedcfaa7f8715961587d910147ccd069422764a1e88f62967c0a5a',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-23 06:48:28',	'2021-10-23 06:48:28',	'2022-10-23 12:18:28'),
('8b372b71169afc8c612302a6c1ec7561c5fd6df0914ec71f256817302cf9c9636e4101d29a6dc19c',	22,	1,	'API Access Token',	'[]',	0,	'2021-10-01 07:59:35',	'2021-10-01 07:59:35',	'2022-10-01 13:29:35'),
('8b6f0b73e15ab16b59bbf7a9eca56ea8344d7429435e8c69db8fcb11928ac8e0481e7ced03d45368',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-23 10:34:27',	'2021-10-23 10:34:27',	'2022-10-23 16:04:27'),
('8e4309ee9ebfe493b8976dc65903e39e1decbe61a7d93a776f6debcbea5510f9ca5d163e9a326929',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-25 09:31:43',	'2021-10-25 09:31:43',	'2022-10-25 15:01:43'),
('9ed15c22145f634c8f638aa00ab836d9004092c92ba7c796ae4f60548a6dc7abc1f353ccd83aba4c',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-30 09:35:45',	'2021-10-30 09:35:45',	'2022-10-30 15:05:45'),
('b020ea7f21edfb32e79e3bd5fe956221293a9aa496984fc6d3fb181bbf00ebbcc79c5a9992c67402',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-29 14:43:30',	'2021-10-29 14:43:30',	'2022-10-29 20:13:30'),
('b7564be182bdd3f81a9d0eca44f102c53b0ea3d74ea84fa17746cd4ee75f3dd32c7da6d5f473bbfa',	6,	1,	NULL,	'[]',	0,	'2021-09-25 05:21:20',	'2021-09-25 05:21:20',	'2022-09-25 10:51:20'),
('bbada271c158fe622fbc32ee47cab521aa139e23912d0be75447a8fc1551ef6a9cbc44a3348bfb4f',	6,	1,	NULL,	'[]',	0,	'2021-09-25 04:30:14',	'2021-09-25 04:30:14',	'2022-09-25 10:00:14'),
('bbc3925d4f274a1ce6eafe12dd45ce5ee8bc781033fff5200d2fe3dd5fca48f657f0df83cd911c11',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-29 13:47:08',	'2021-10-29 13:47:08',	'2022-10-29 19:17:08'),
('c2eec6cf67c29ff4d74b68644d08ac3d8d859e12bd438878d0a521083bb09c560c244eb3a7ceecba',	1,	2,	NULL,	'[]',	0,	'2021-10-23 06:09:26',	'2021-10-23 06:09:26',	'2022-10-23 11:39:26'),
('c9af664e130c000f99a726d14ad9323412bb521aac7653afe9edc51a689b98f021d064e4f29b0d44',	1,	1,	NULL,	'[]',	0,	'2021-09-25 04:18:08',	'2021-09-25 04:18:08',	'2022-09-25 09:48:08'),
('d73b13d1ab3b9784f3afbce3307d1d2ca245bf8ba995cca05cbe5babda55d187e7aeea2673e4735a',	1,	1,	NULL,	'[]',	0,	'2021-09-25 04:16:43',	'2021-09-25 04:16:43',	'2022-09-25 09:46:43'),
('e24380bd09a7affcb09d7238a4c81681e0ffba77ae3eda6d2b3654d1e4076d29a0529ccacd998009',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-23 06:19:20',	'2021-10-23 06:19:20',	'2022-10-23 11:49:20'),
('f4ce9c823548b691a9374a94f3ed791f91a6d16682028b928f0a249366c1f435a0d3a69c3fb1b9d2',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-25 09:30:59',	'2021-10-25 09:30:59',	'2022-10-25 15:00:59'),
('f94699e018210bc28763e77b2bc7748324350b95f9f2f7522dfb000f81a741841f6b9283f4ddc00a',	1,	2,	NULL,	'[\"*\"]',	0,	'2021-10-25 09:36:30',	'2021-10-25 09:36:30',	'2022-10-25 15:06:30');

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Talent Personal Access Client',	'o2L2Gsa67MzuDCkHE7cfu0uMOgmQos2VFTyOZOBq',	'http://localhost',	1,	0,	0,	'2021-09-19 23:40:31',	'2021-09-19 23:40:31'),
(2,	NULL,	'Talent Password Grant Client',	'HV5hQcXqabLNnabfG0VqE90WvW6vdIujJhJVqxRQ',	'http://localhost',	0,	1,	0,	'2021-09-19 23:40:31',	'2021-09-19 23:40:31');

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'2021-09-19 23:40:31',	'2021-09-19 23:40:31');

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('10600a0d3a10cbb4cb5c0f376a96d62e850b97fd8b1c8673bb9b0b0d290564d0b5f74f65cdff1467',	'9ed15c22145f634c8f638aa00ab836d9004092c92ba7c796ae4f60548a6dc7abc1f353ccd83aba4c',	0,	'2022-10-30 15:05:45'),
('1b5a10cb3f1aa9c79ab55e29fc6b35620bae95d5e74ad429ace9f48a81a8a5f24a4193d44f2f3110',	'f4ce9c823548b691a9374a94f3ed791f91a6d16682028b928f0a249366c1f435a0d3a69c3fb1b9d2',	0,	'2022-10-25 15:01:00'),
('3d52a564fb04a9dd9fa9b7c5d7ca90434fbc9fe7a95b707bc7fb766e62d46462b4faa6080df927ec',	'b020ea7f21edfb32e79e3bd5fe956221293a9aa496984fc6d3fb181bbf00ebbcc79c5a9992c67402',	0,	'2022-10-29 20:13:30'),
('4af53cfad1995b878db418e7a4b6e6523b70d3a7def256f7bb39fc34f8408ceeb05d22251d56bb45',	'55a1bc69980b0078b98e99f5d2549ef5d80e8750324fb694d1bef87f312aac5c7cba0d4773e6a4ab',	0,	'2022-10-23 16:03:10'),
('54ec14de9707442b84b139475c8d0a560464e55730e1544219b838e0b8ed84590f056e6b4c362ab4',	'8b6f0b73e15ab16b59bbf7a9eca56ea8344d7429435e8c69db8fcb11928ac8e0481e7ced03d45368',	0,	'2022-10-23 16:04:28'),
('5f84b153e71c77eb53f188566c0f89f363b9dc1721ab1b503009ddd0546c9f312318cd599c5d19d3',	'8e4309ee9ebfe493b8976dc65903e39e1decbe61a7d93a776f6debcbea5510f9ca5d163e9a326929',	0,	'2022-10-25 15:01:44'),
('8941273a6df99463ed2b3ba7e05f5d405da60d4cc77838d988a5c3d3d50e0dd4b9035916c15632b5',	'37ab17e2c2663b2f253660d6f5a54b4853ed8d61c86df8a76b57981f0a36c8c5237cffcdbc885faf',	0,	'2022-10-23 15:40:07'),
('9fcaa346593e0c3e8ff2bb552dd8804fe4603d1f13d9d0d9960cf7bd04fe4a847873fbe6a524ea8c',	'f94699e018210bc28763e77b2bc7748324350b95f9f2f7522dfb000f81a741841f6b9283f4ddc00a',	0,	'2022-10-25 15:06:30'),
('c1f8d6653c44031c8ab632e621ac15aaa0e3ef5508b5ed7813f60361bc5babce036206f94a4dcf5b',	'e24380bd09a7affcb09d7238a4c81681e0ffba77ae3eda6d2b3654d1e4076d29a0529ccacd998009',	0,	'2022-10-23 11:49:20'),
('ca3ce1907ddd38d66e7db8d7825879e519c5d8ed831aa41fe0b44b42aa51713809e7e721460ca63a',	'c2eec6cf67c29ff4d74b68644d08ac3d8d859e12bd438878d0a521083bb09c560c244eb3a7ceecba',	0,	'2022-10-23 11:39:27'),
('dbb498f9c7bf95dedbb5c75004eebd6af14150416304065c427e87386577bfd35f8d10ff50e89f48',	'51aef6f9e67c3d928c1ffaa3ad6c813afee28bb7776e0b8c86550a83142b00f94c8b4eaace48b32e',	0,	'2022-10-23 15:55:38'),
('eac1978c87af712767a6047ac1fee7cbb6715216f87ea34beda726ba6a1ebacf89d6d9e5beb286c5',	'bbc3925d4f274a1ce6eafe12dd45ce5ee8bc781033fff5200d2fe3dd5fca48f657f0df83cd911c11',	0,	'2022-10-29 19:17:11'),
('f2266878491da689a17a15830ce6d629861c6e9fe1dc32ce9337e54059c5b36a97827103cb99669e',	'1a654b08475559990b8863798ed75fc35d2c8a0d46228738098d3079b6b8832493a3e8c1a72c05bd',	0,	'2022-10-29 05:27:35'),
('f7a46044ce7122e6c3e8ce23d952d17b57da5c3fe2fdf3b01f18ce54c4f40dc1b9b871214162818a',	'81e303d4b95429ac29948e0a33bedcfaa7f8715961587d910147ccd069422764a1e88f62967c0a5a',	0,	'2022-10-23 12:18:28');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cannonical_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_page_slug_unique` (`page_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pages` (`id`, `title`, `page_slug`, `description`, `cannonical_link`, `seo_title`, `seo_keyword`, `seo_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'et error sit rerum',	'debitis-ratione-aspernatur-commodi-beatae-nisi-iusto',	'Quia optio ab aspernatur illum nam. Necessitatibus sequi velit nobis sit eius voluptatem. Illum sit fuga unde et vel in. Cum tempore qui voluptatem earum ad et. Nihil et officia explicabo omnis itaque accusantium.',	'https://mueller.info/doloribus-vero-quos-et-id.html',	'architecto',	'culpa',	'Dolores consequatur esse modi ea omnis qui non. Culpa deserunt doloremque accusantium sequi. Incidunt aut ut rerum laudantium earum aut nobis. Fuga ad rerum ex et culpa nam.',	1,	4,	NULL,	'2021-09-20 00:01:00',	'2021-09-20 00:01:00',	NULL),
(2,	'quia ut et dolores',	'voluptas-commodi-eum-expedita-doloribus-similique-laborum-aperiam',	'Magni quis nesciunt eaque dolores maxime harum voluptate. Perspiciatis dolores sit inventore iste eligendi. Itaque possimus accusamus ipsa rerum aut minus suscipit. Ut ex ut aut qui omnis quae.',	'http://rodriguez.org/sapiente-quae-in-mollitia-aut.html',	'velit',	'quae',	'Iusto quia id delectus iusto ut nostrum reiciendis. Et sunt et sunt fugit dolor dolorem repellat. Et quia est est quo ducimus adipisci dolor.',	0,	4,	NULL,	'2021-09-20 00:01:00',	'2021-09-20 00:01:00',	NULL),
(3,	'quae animi molestiae aut',	'omnis-quis-eveniet-quae-aperiam-ullam',	'Neque iste ut quam consequatur. Minus qui recusandae quo officia molestiae qui. Soluta blanditiis culpa qui sunt. Qui rem facilis non maiores aut.',	'http://jacobi.org/',	'natus',	'ullam',	'Quibusdam aut corporis culpa quae officiis eligendi. Sint tenetur sit non hic voluptate autem aut. Corrupti debitis fugiat consequuntur.',	1,	4,	NULL,	'2021-09-20 00:01:01',	'2021-09-20 00:01:01',	NULL),
(4,	'libero saepe esse nostrum',	'sed-consequatur-inventore-rerum-dolorem-ea-similique',	'Vel et eum qui repudiandae cupiditate laudantium sit qui. Fuga rerum voluptatem et iusto esse laudantium asperiores. Consequatur qui quis sed in id veritatis placeat.',	'http://howe.com/',	'quia',	'autem',	'Dolorem qui reiciendis similique omnis voluptatem nemo. Sed accusamus laborum error rerum. Eveniet repellendus excepturi sit suscipit laboriosam.',	0,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(5,	'esse ipsum ut voluptatibus',	'quibusdam-molestiae-dolore-sit-voluptatem-rerum',	'Qui aut voluptatibus sed aut debitis facilis enim voluptates. Eum illum culpa omnis voluptatem ea. Quis expedita voluptas quisquam at officia id. Ipsam iure sit quis aut.',	'http://kutch.com/',	'quis',	'praesentium',	'Repudiandae ea et recusandae beatae accusantium repudiandae. Non magni asperiores illo fugiat ea asperiores voluptas.',	1,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(6,	'aut autem id quibusdam',	'quo-aut-eum-et-sapiente-velit-sed-cumque',	'Quia facilis ab aliquam iusto totam maxime cumque. Hic vel cum amet harum tenetur assumenda voluptas aut. Dolorem nihil asperiores accusamus dolores.',	'http://www.larson.net/et-aliquid-deserunt-et-rerum-aut-et-ut',	'iusto',	'fugit',	'Rem eos et maiores eligendi illum. Sapiente sed a voluptatem doloremque fuga. Rerum praesentium est excepturi enim provident consectetur ipsam.',	1,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(7,	'alias autem eveniet autem',	'ut-vel-itaque-voluptatum-et',	'Et qui est maiores ea. Autem cumque quas porro officiis nihil possimus. Impedit eveniet voluptate deleniti labore. Eius perspiciatis quibusdam iure blanditiis quam et animi et.',	'http://www.greenholt.com/quod-commodi-corporis-rerum-qui-ipsa',	'odit',	'iure',	'In suscipit totam laudantium dicta totam laborum. Accusantium id vero laborum aut architecto beatae. Sed quae est ea nostrum amet. Consequuntur nemo et qui fuga in iusto temporibus.',	1,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(8,	'qui quia rem est',	'maxime-enim-modi-assumenda',	'Omnis beatae rerum qui dolor quia dolores atque molestias. Modi quo minus earum error temporibus.',	'https://www.davis.com/eveniet-occaecati-neque-iusto-eos-exercitationem-ab',	'ad',	'libero',	'Dolorem illo modi id ea est mollitia. Quo odio laudantium quis sapiente saepe non possimus. Rem magni perspiciatis vel officiis alias. Sed sit quasi nobis repellat pariatur quod soluta.',	1,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(9,	'doloremque ipsum voluptatum eum',	'cupiditate-eligendi-et-est-est',	'Consequatur saepe quam facilis possimus mollitia. Amet voluptas voluptates animi excepturi facilis corporis vitae. Sit ipsa distinctio rerum ratione. Dolore corrupti sed et ad iusto omnis. In libero sint sit rerum id.',	'http://www.zboncak.com/quia-ut-iste-fugiat-voluptatum-non-quibusdam-nam',	'consequuntur',	'accusantium',	'Vitae ex eveniet quasi incidunt sunt accusamus occaecati. Et et minus aliquam in voluptas. Minima quas sed aliquid et fuga veniam est.',	0,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(10,	'sint ut dolore aut',	'sequi-praesentium-a-est',	'Dignissimos aliquid rem voluptatibus omnis rerum. Est odio id assumenda consequuntur numquam corporis porro. Praesentium eos sequi aut assumenda.',	'http://luettgen.com/officiis-assumenda-eaque-tempora-animi-consectetur-dolorem-animi',	'voluptas',	'totam',	'Aspernatur nemo voluptatem modi ut. Reiciendis dolorem odit soluta repudiandae culpa adipisci quidem. Similique ratione rerum rerum porro quis.',	1,	4,	NULL,	'2021-09-20 00:01:02',	'2021-09-20 00:01:02',	NULL),
(11,	'ut necessitatibus provident quo',	'atque-saepe-eum-facilis-minima-facere-qui',	'Eligendi magni ipsa corrupti veritatis maiores corporis voluptates. Dolorem optio fuga voluptatibus impedit incidunt laboriosam dolorem. Explicabo odio possimus aspernatur velit odit. Officia eveniet eius corrupti tempora eaque.',	'http://www.fritsch.org/porro-alias-a-dolores',	'atque',	'fuga',	'Reiciendis officia debitis tempore nulla. Repellat enim ipsa dicta ut aut. Dolores ipsa ea exercitationem earum nam veritatis est voluptas.',	1,	4,	NULL,	'2021-09-23 13:02:02',	'2021-09-23 13:02:02',	NULL),
(12,	'ipsa labore rerum voluptas',	'tempora-ut-culpa-amet-omnis',	'Vitae est officiis aut minima. Aliquid et a voluptatum est ad dolores laborum. Error fugiat dignissimos incidunt inventore iure.',	'http://nitzsche.com/et-eius-ab-facere-similique.html',	'iste',	'voluptate',	'Ducimus iure sunt sunt voluptatem quo quos. Accusantium rerum numquam voluptates ad nemo illo deleniti. Ipsam sint molestiae dolor. Quis aut et tempora praesentium dolor.',	1,	4,	NULL,	'2021-09-23 13:02:02',	'2021-09-23 13:02:02',	NULL),
(13,	'nulla eligendi eaque voluptas',	'voluptates-eum-incidunt-nemo-facere-atque-nam',	'Repudiandae cumque itaque ducimus alias distinctio aut cum. Nesciunt ducimus dolor aliquid soluta. Et voluptates qui non aliquid temporibus doloremque modi eos.',	'http://www.wolf.info/ducimus-ut-quis-a-pariatur-earum-ea-qui',	'voluptas',	'commodi',	'Voluptatibus eligendi magnam autem inventore corporis expedita omnis. Sed soluta aperiam a eius necessitatibus. Earum in et enim.',	0,	4,	NULL,	'2021-09-23 13:02:02',	'2021-09-23 13:02:02',	NULL),
(14,	'necessitatibus voluptas voluptas ab',	'suscipit-repudiandae-et-harum-quibusdam-quia-quibusdam-distinctio',	'Aut unde non dignissimos delectus nemo nemo totam maxime. Veritatis maxime atque reprehenderit officia molestias ipsam asperiores.',	'http://www.denesik.org/et-et-laudantium-iusto-tempora-aperiam-quae-aut-consequuntur.html',	'sit',	'quod',	'Sapiente tempora fuga aspernatur harum. Quia accusamus rem pariatur debitis quia occaecati delectus.',	1,	4,	NULL,	'2021-09-23 13:02:02',	'2021-09-23 13:02:02',	NULL),
(15,	'dolorum quod sunt deleniti',	'qui-ipsam-laboriosam-officiis-ut-dolor-quibusdam-id',	'Eligendi sit sit similique rerum. Eos incidunt deserunt repellendus in. Odio laborum voluptatem voluptas officia dicta expedita.',	'http://feest.com/culpa-explicabo-tenetur-doloribus-placeat-nam.html',	'ipsum',	'qui',	'Tempora voluptatem vel hic voluptatem omnis. Voluptates id dolor voluptatem. Nam nemo quia inventore adipisci tempora reiciendis. Tempore dolor porro autem eligendi.',	0,	4,	NULL,	'2021-09-23 13:02:02',	'2021-09-23 13:02:02',	NULL),
(16,	'laudantium et quod eos',	'libero-et-rerum-placeat',	'Rerum voluptatibus voluptates dolores. Autem adipisci eum ut tenetur. Autem recusandae quisquam a eveniet officia. Repudiandae accusamus quam saepe placeat quisquam perspiciatis.',	'http://bashirian.net/sequi-vero-explicabo-nisi-dolores-tempora',	'dolores',	'soluta',	'Fugit necessitatibus assumenda tempore eius et. Iusto necessitatibus saepe a voluptatibus exercitationem inventore. Fugiat est et eveniet sit.',	1,	4,	NULL,	'2021-09-23 13:02:03',	'2021-09-23 13:02:03',	NULL),
(17,	'ex debitis quo quia',	'atque-mollitia-ut-qui-quis-reprehenderit-itaque-labore',	'Voluptas eos tempore magnam ad quisquam voluptatibus. Ex perspiciatis qui dolorum magnam accusantium accusamus.',	'https://schulist.com/rerum-non-quisquam-est-similique.html',	'temporibus',	'hic',	'Sit omnis pariatur est aliquam sequi. Facilis officiis eligendi libero. Illum voluptates consequatur voluptas repudiandae fugiat. Quibusdam omnis provident ut consequuntur dolor dicta nostrum. Dolor expedita qui qui facilis maiores facere rerum.',	1,	4,	NULL,	'2021-09-23 13:02:04',	'2021-09-23 13:02:04',	NULL),
(18,	'qui sed repudiandae minima',	'temporibus-numquam-consequuntur-sunt-magni-sequi-ratione-exercitationem',	'Consequatur modi animi blanditiis magni nam iure. Atque autem consectetur ut ut praesentium ut cumque. Modi iste qui quis et quaerat labore molestiae voluptate. Est nobis accusantium voluptas natus dolor tenetur mollitia.',	'http://www.spencer.net/cupiditate-ut-qui-id-alias',	'sed',	'quam',	'Cupiditate facilis velit ad ea ea iusto dolores. Voluptas earum eum vero.',	0,	4,	NULL,	'2021-09-23 13:02:05',	'2021-09-23 13:02:05',	NULL),
(19,	'similique nesciunt aut facere',	'sit-et-sed-aut-aut-saepe-aut-aut',	'Ut reiciendis perferendis ipsum ab ut. Laborum incidunt possimus suscipit. Voluptate et dicta assumenda tempora. Ut eum rerum alias minus vero eos.',	'http://okuneva.biz/',	'dicta',	'sunt',	'Est aut amet itaque omnis aut libero iste. Illum facilis unde magnam ut reprehenderit. Saepe ad reprehenderit ex ut. Dolores ipsa cum asperiores possimus.',	1,	4,	NULL,	'2021-09-23 13:02:05',	'2021-09-23 13:02:05',	NULL),
(20,	'minus qui labore suscipit',	'at-optio-voluptas-rem-quia-et-aut',	'Unde quisquam aspernatur sint et. Aspernatur unde exercitationem ut ratione occaecati molestiae quas et. Animi magni expedita nemo nulla dolores eaque qui.',	'http://corkery.info/vitae-qui-eligendi-debitis-voluptatem-nostrum-repellendus-a.html',	'ut',	'magnam',	'Odio sit aut a qui dolore. Libero beatae rerum deserunt dolore. Dolores aut aspernatur sapiente explicabo reiciendis autem ipsam. Delectus maiores consequatur odit explicabo in perspiciatis.',	0,	4,	NULL,	'2021-09-23 13:02:07',	'2021-09-23 13:02:07',	NULL);

DROP TABLE IF EXISTS `password_histories`;
CREATE TABLE `password_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `password_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `password_histories` (`id`, `user_id`, `password`, `created_at`, `updated_at`) VALUES
(1,	4,	'$2y$10$GIxEL9m2fs3afh/uLmZ/y.E4nz9fPoaYrZaVEaL.5O.R63QLMvbkq',	'2021-09-23 13:02:00',	'2021-09-23 13:02:00'),
(2,	5,	'$2y$10$9NpktKgVIor8QstKnMCPF.0la8PM61JWv.rJpS4X.pqXCkylZLPgO',	'2021-09-23 13:02:26',	'2021-09-23 13:02:26'),
(3,	8,	'$2y$10$GvDuFfukB84qvxkYPIgQpuvqdr0TMXZV0E/.61.uigFycKdnRf8Vi',	'2021-09-25 06:20:17',	'2021-09-25 06:20:17'),
(4,	9,	'$2y$10$N.UhL65D6B6i8uLTnYLTg.mh7RWLmxl11HnWxhDrZlrDGte5I01Ku',	'2021-09-25 06:49:43',	'2021-09-25 06:49:43'),
(5,	10,	'$2y$10$dzJ3XCDWpBZeeNrGkIeVmepLvlQ8VuxsJ0X366JwiYIQi/2GE7Wti',	'2021-09-25 06:52:01',	'2021-09-25 06:52:01'),
(6,	11,	'$2y$10$4yTKeSaW7PsSr27qZt1Ed.1iuPbSLf5Tkrnl5erGa8IJq/CyilME6',	'2021-09-25 06:53:06',	'2021-09-25 06:53:06'),
(7,	12,	'$2y$10$LHEIe2MbozOQiCTTmenw9uyE3defuWIWeIfayxIOmz6Gs3CVRJiSG',	'2021-09-25 06:57:47',	'2021-09-25 06:57:47'),
(8,	13,	'$2y$10$P7.s7NTZtpGnYuDG.hVz7OFyjVkt0mD11nQUBLQbJBOaL9c1xl18S',	'2021-09-25 06:58:15',	'2021-09-25 06:58:15'),
(9,	14,	'$2y$10$U5etD/XFMK1vA013p1p/HebBz.WYxokvyGtPQNcq062dYmqdR6fvG',	'2021-09-25 07:02:47',	'2021-09-25 07:02:47'),
(10,	15,	'$2y$10$rxM/7YPlEIFAJf.qJuD4nuuhjirHb.EXQT/JXR5aadJMwfS/niydK',	'2021-09-25 07:08:14',	'2021-09-25 07:08:14'),
(11,	16,	'$2y$10$4dz9wX64ezqlELjP2S0Cru84l1wVKKzq/O2QcbrarA62hrSbdvX7.',	'2021-09-25 07:22:30',	'2021-09-25 07:22:30'),
(12,	17,	'$2y$10$F.9Ftq6ocEbGXgs1gcYfT.DYQok9liSGGykP3XrI4LXtUZgkF8fZ.',	'2021-09-25 07:24:01',	'2021-09-25 07:24:01'),
(13,	18,	'$2y$10$MesBgheSVuCrIb/TdRY1Lum9YzztyF01/5p.HwYGI1XuHbJ2mWFEe',	'2021-09-25 07:26:24',	'2021-09-25 07:26:24'),
(14,	19,	'$2y$10$oX7QSXLBMwkeXYwRqwFAie4LtNc4dOoJAA76G6dbr7SznALxY/f3a',	'2021-09-25 07:27:22',	'2021-09-25 07:27:22'),
(15,	20,	'$2y$10$9EEOfOb0nytduF2nREtQouxCEhZ1RqhkgzYeFbKhnwjb26/ZOYxGy',	'2021-09-25 07:28:17',	'2021-09-25 07:28:17'),
(16,	21,	'$2y$10$pnVzZPVPzzVb3J5dU/IRReoCKglUiiZzXvhkov58MHhtvQysgM..G',	'2021-09-25 07:29:19',	'2021-09-25 07:29:19'),
(17,	22,	'$2y$10$vZhCYN4dyTQ8pCLUZxuGoeaLTEL/kFqRE90L7vEhsgZgM8eas5vD6',	'2021-09-25 08:26:56',	'2021-09-25 08:26:56');

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1,	1,	2),
(2,	3,	2),
(3,	4,	2),
(4,	5,	2),
(5,	6,	2),
(6,	7,	2),
(7,	8,	2),
(8,	16,	2),
(9,	20,	2),
(10,	24,	2),
(11,	25,	2),
(12,	26,	2),
(13,	27,	2),
(14,	28,	2),
(15,	29,	2),
(16,	30,	2),
(17,	31,	2),
(18,	33,	2),
(19,	34,	2),
(20,	35,	2),
(21,	36,	2),
(22,	37,	2),
(23,	38,	2),
(24,	39,	2),
(25,	40,	2),
(26,	41,	2),
(27,	42,	2),
(28,	43,	2),
(29,	44,	2),
(30,	45,	2),
(31,	46,	2),
(32,	47,	2),
(33,	48,	2),
(34,	2,	3);

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  KEY `permission_user_user_id_foreign` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_user` (`id`, `permission_id`, `user_id`) VALUES
(1,	46,	2),
(2,	38,	2),
(3,	42,	2),
(4,	29,	2),
(5,	33,	2),
(6,	25,	2),
(7,	48,	2),
(8,	40,	2),
(9,	44,	2),
(10,	31,	2),
(11,	35,	2),
(12,	27,	2),
(13,	47,	2),
(14,	39,	2),
(15,	43,	2),
(16,	30,	2),
(17,	34,	2),
(18,	26,	2),
(19,	36,	2),
(20,	8,	2),
(21,	3,	2),
(22,	5,	2),
(23,	1,	2),
(24,	37,	2),
(25,	41,	2),
(26,	45,	2),
(27,	6,	2),
(28,	7,	2),
(29,	28,	2),
(30,	24,	2),
(31,	20,	2),
(32,	16,	2),
(33,	4,	2),
(34,	2,	3);

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` smallint unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `display_name`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'view-backend',	'View Backend',	1,	1,	1,	NULL,	'2021-09-23 13:00:15',	'2021-09-23 13:00:15',	NULL),
(2,	'view-frontend',	'View Frontend',	2,	1,	1,	NULL,	'2021-09-23 13:00:15',	'2021-09-23 13:00:15',	NULL),
(3,	'view-access-management',	'View Access Management',	3,	1,	1,	NULL,	'2021-09-23 13:00:17',	'2021-09-23 13:00:17',	NULL),
(4,	'view-user-management',	'View User Management',	4,	1,	1,	NULL,	'2021-09-23 13:00:17',	'2021-09-23 13:00:17',	NULL),
(5,	'view-active-user',	'View Active User',	5,	1,	1,	NULL,	'2021-09-23 13:00:18',	'2021-09-23 13:00:18',	NULL),
(6,	'view-deactive-user',	'View Deactive User',	6,	1,	1,	NULL,	'2021-09-23 13:00:18',	'2021-09-23 13:00:18',	NULL),
(7,	'view-deleted-user',	'View Deleted User',	7,	1,	1,	NULL,	'2021-09-23 13:00:19',	'2021-09-23 13:00:19',	NULL),
(8,	'show-user',	'Show User Details',	8,	1,	1,	NULL,	'2021-09-23 13:00:20',	'2021-09-23 13:00:20',	NULL),
(9,	'create-user',	'Create User',	9,	1,	1,	NULL,	'2021-09-23 13:00:21',	'2021-09-23 13:00:21',	NULL),
(10,	'edit-user',	'Edit User',	9,	1,	1,	NULL,	'2021-09-23 13:00:22',	'2021-09-23 13:00:22',	NULL),
(11,	'delete-user',	'Delete User',	10,	1,	1,	NULL,	'2021-09-23 13:00:23',	'2021-09-23 13:00:23',	NULL),
(12,	'activate-user',	'Activate User',	11,	1,	1,	NULL,	'2021-09-23 13:00:23',	'2021-09-23 13:00:23',	NULL),
(13,	'deactivate-user',	'Deactivate User',	12,	1,	1,	NULL,	'2021-09-23 13:00:25',	'2021-09-23 13:00:25',	NULL),
(14,	'login-as-user',	'Login As User',	13,	1,	1,	NULL,	'2021-09-23 13:00:26',	'2021-09-23 13:00:26',	NULL),
(15,	'clear-user-session',	'Clear User Session',	14,	1,	1,	NULL,	'2021-09-23 13:00:26',	'2021-09-23 13:00:26',	NULL),
(16,	'view-role-management',	'View Role Management',	15,	1,	1,	NULL,	'2021-09-23 13:00:27',	'2021-09-23 13:00:27',	NULL),
(17,	'create-role',	'Create Role',	16,	1,	1,	NULL,	'2021-09-23 13:00:27',	'2021-09-23 13:00:27',	NULL),
(18,	'edit-role',	'Edit Role',	17,	1,	1,	NULL,	'2021-09-23 13:00:27',	'2021-09-23 13:00:27',	NULL),
(19,	'delete-role',	'Delete Role',	18,	1,	1,	NULL,	'2021-09-23 13:00:30',	'2021-09-23 13:00:30',	NULL),
(20,	'view-permission-management',	'View Permission Management',	19,	1,	1,	NULL,	'2021-09-23 13:00:30',	'2021-09-23 13:00:30',	NULL),
(21,	'create-permission',	'Create Permission',	20,	1,	1,	NULL,	'2021-09-23 13:00:31',	'2021-09-23 13:00:31',	NULL),
(22,	'edit-permission',	'Edit Permission',	21,	1,	1,	NULL,	'2021-09-23 13:00:32',	'2021-09-23 13:00:32',	NULL),
(23,	'delete-permission',	'Delete Permission',	22,	1,	1,	NULL,	'2021-09-23 13:00:32',	'2021-09-23 13:00:32',	NULL),
(24,	'view-page',	'View Page',	23,	1,	1,	NULL,	'2021-09-23 13:00:32',	'2021-09-23 13:00:32',	NULL),
(25,	'create-page',	'Create Page',	24,	1,	1,	NULL,	'2021-09-23 13:00:34',	'2021-09-23 13:00:34',	NULL),
(26,	'edit-page',	'Edit Page',	25,	1,	1,	NULL,	'2021-09-23 13:00:34',	'2021-09-23 13:00:34',	NULL),
(27,	'delete-page',	'Delete Page',	26,	1,	1,	NULL,	'2021-09-23 13:00:35',	'2021-09-23 13:00:35',	NULL),
(28,	'view-domain',	'View Domain',	23,	1,	1,	NULL,	'2021-09-23 13:00:35',	'2021-09-23 13:00:35',	NULL),
(29,	'create-domain',	'Create Domain',	24,	1,	1,	NULL,	'2021-09-23 13:00:36',	'2021-09-23 13:00:36',	NULL),
(30,	'edit-domain',	'Edit Domain',	25,	1,	1,	NULL,	'2021-09-23 13:00:37',	'2021-09-23 13:00:37',	NULL),
(31,	'delete-domain',	'Delete Domain',	26,	1,	1,	NULL,	'2021-09-23 13:00:38',	'2021-09-23 13:00:38',	NULL),
(32,	'view-email-template',	'View Email Templates',	27,	1,	1,	NULL,	'2021-09-23 13:00:38',	'2021-09-23 13:00:38',	NULL),
(33,	'create-email-template',	'Create Email Templates',	28,	1,	1,	NULL,	'2021-09-23 13:00:39',	'2021-09-23 13:00:39',	NULL),
(34,	'edit-email-template',	'Edit Email Templates',	29,	1,	1,	NULL,	'2021-09-23 13:00:39',	'2021-09-23 13:00:39',	NULL),
(35,	'delete-email-template',	'Delete Email Templates',	30,	1,	1,	NULL,	'2021-09-23 13:00:40',	'2021-09-23 13:00:40',	NULL),
(36,	'edit-settings',	'Edit Settings',	31,	1,	1,	NULL,	'2021-09-23 13:00:40',	'2021-09-23 13:00:40',	NULL),
(37,	'view-blog-category',	'View Blog Categories Management',	32,	1,	1,	NULL,	'2021-09-23 13:00:41',	'2021-09-23 13:00:41',	NULL),
(38,	'create-blog-category',	'Create Blog Category',	33,	1,	1,	NULL,	'2021-09-23 13:00:42',	'2021-09-23 13:00:42',	NULL),
(39,	'edit-blog-category',	'Edit Blog Category',	34,	1,	1,	NULL,	'2021-09-23 13:00:43',	'2021-09-23 13:00:43',	NULL),
(40,	'delete-blog-category',	'Delete Blog Category',	35,	1,	1,	NULL,	'2021-09-23 13:00:43',	'2021-09-23 13:00:43',	NULL),
(41,	'view-blog-tag',	'View Blog Tags Management',	36,	1,	1,	NULL,	'2021-09-23 13:00:44',	'2021-09-23 13:00:44',	NULL),
(42,	'create-blog-tag',	'Create Blog Tag',	37,	1,	1,	NULL,	'2021-09-23 13:00:44',	'2021-09-23 13:00:44',	NULL),
(43,	'edit-blog-tag',	'Edit Blog Tag',	38,	1,	1,	NULL,	'2021-09-23 13:00:46',	'2021-09-23 13:00:46',	NULL),
(44,	'delete-blog-tag',	'Delete Blog Tag',	39,	1,	1,	NULL,	'2021-09-23 13:00:46',	'2021-09-23 13:00:46',	NULL),
(45,	'view-blog',	'View Blogs Management',	40,	1,	1,	NULL,	'2021-09-23 13:00:46',	'2021-09-23 13:00:46',	NULL),
(46,	'create-blog',	'Create Blog',	41,	1,	1,	NULL,	'2021-09-23 13:00:47',	'2021-09-23 13:00:47',	NULL),
(47,	'edit-blog',	'Edit Blog',	42,	1,	1,	NULL,	'2021-09-23 13:00:47',	'2021-09-23 13:00:47',	NULL),
(48,	'delete-blog',	'Delete Blog',	43,	1,	1,	NULL,	'2021-09-23 13:00:48',	'2021-09-23 13:00:48',	NULL),
(49,	'view-faq',	'View FAQ Management',	44,	1,	1,	NULL,	'2021-09-23 13:00:49',	'2021-09-23 13:00:49',	NULL),
(50,	'create-faq',	'Create FAQ',	45,	1,	1,	NULL,	'2021-09-23 13:00:50',	'2021-09-23 13:00:50',	NULL),
(51,	'edit-faq',	'Edit FAQ',	46,	1,	1,	NULL,	'2021-09-23 13:00:51',	'2021-09-23 13:00:51',	NULL),
(52,	'delete-faq',	'Delete FAQ',	47,	1,	1,	NULL,	'2021-09-23 13:00:51',	'2021-09-23 13:00:51',	NULL);

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	3),
(5,	19,	3),
(6,	20,	3),
(7,	21,	2),
(8,	22,	2);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `all` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `all`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Administrator',	1,	1,	1,	1,	NULL,	'2021-09-23 12:59:55',	'2021-09-23 12:59:55',	NULL),
(2,	'Employer',	0,	2,	1,	1,	NULL,	'2021-09-23 12:59:55',	'2021-09-23 12:59:55',	NULL),
(3,	'Candidate',	0,	3,	1,	1,	NULL,	'2021-09-23 12:59:55',	'2021-09-23 12:59:55',	NULL);

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `social_accounts`;
CREATE TABLE `social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '1',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `is_term_accept` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0 = not accepted,1 = accepted',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `avatar_type`, `avatar_location`, `password`, `password_changed_at`, `active`, `confirmation_code`, `confirmed`, `timezone`, `last_login_at`, `last_login_ip`, `to_be_logged_out`, `status`, `created_by`, `updated_by`, `is_term_accept`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'45450581-cb7c-42ef-9b18-310c509a970b',	'Alan',	'Whitmore',	'admin@admin.com',	'gravatar',	NULL,	'$2y$10$xjkUzh17ZyuLXBP1s66aSeGm8aNsuEWwUEcXaihwCkFGCVBc93OZq',	NULL,	1,	'6e966f1df58f9a252db60f8f004ae998',	1,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	0,	NULL,	'2021-09-23 12:59:50',	'2021-09-23 12:59:50',	NULL),
(2,	'980268f5-e0a7-4a36-92b0-51b5a2dc1431',	'Justin',	'Bevan',	'executive@executive.com',	'gravatar',	NULL,	'$2y$10$.Et.L4RyrEXneauNGDyBDeB4LwhKuOTkLnKj1DQA4AL8hbnCTbK2u',	NULL,	1,	'a5d633ef73773052eedeeefeba6e5866',	1,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	0,	NULL,	'2021-09-23 12:59:51',	'2021-10-25 07:25:19',	'2021-10-25 07:25:19'),
(3,	'3cac07e9-d975-4c37-ad83-308fdb3a9ca7',	'User',	'Test2',	'user@user.com',	'gravatar',	NULL,	'$2y$10$6242n5ZLXp0sNZywSesMZOeeI4LwZlOGQpYPotEIt98P0wH1FDkiC',	NULL,	1,	'b02723b9247b0343faf935fc07314bdf',	1,	NULL,	NULL,	NULL,	0,	1,	1,	NULL,	0,	NULL,	'2021-09-23 12:59:51',	'2021-10-29 14:45:07',	NULL),
(4,	'f702e809-dad9-4542-9416-32d64d14206f',	'Immanuel',	'Waters',	'fbradtke@example.com',	'gravatar',	NULL,	'$2y$10$GIxEL9m2fs3afh/uLmZ/y.E4nz9fPoaYrZaVEaL.5O.R63QLMvbkq',	NULL,	1,	'0cf01fc6a4370df6508374ccd8a2937a',	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	'p122GEVmPO',	'2021-09-23 13:02:00',	'2021-09-23 13:02:00',	NULL),
(5,	'd82c9d70-cc3d-411f-84bd-7ef8efc350c6',	'Reymundo',	'Rau',	'aron.ohara@example.com',	'gravatar',	NULL,	'$2y$10$9NpktKgVIor8QstKnMCPF.0la8PM61JWv.rJpS4X.pqXCkylZLPgO',	NULL,	1,	'd7b0c69c20c4b42ac31d34defb543e77',	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	'dFzejEVkaO',	'2021-09-23 13:02:26',	'2021-09-23 13:02:26',	NULL),
(6,	'ce12cc15-e771-4afc-bdd7-786436670b98',	'joy',	'lobo',	'joylobo@007.com',	'gravatar',	NULL,	'$2y$10$K9W0z2388UgusV7vPffIOebav0LWoFa2ABzHXN1ohn1kRSLR8D.7a',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 04:22:25',	'2021-09-25 04:22:25',	NULL),
(7,	'8b28505a-4460-4dd4-8925-c3d8050bafa1',	'denim',	'cool',	'denim@007.com',	'gravatar',	NULL,	'$2y$10$UXLCSz17Ph.IXfrTxzNYcesCqewpIF./WSay2S0EGo5XVjHvbwqki',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 05:28:59',	'2021-09-25 05:28:59',	NULL),
(8,	'ce309dc3-7ad4-400a-a77a-bdd7c8e43f41',	'demo',	'001',	'demouser001@007.com',	'gravatar',	NULL,	'$2y$10$GvDuFfukB84qvxkYPIgQpuvqdr0TMXZV0E/.61.uigFycKdnRf8Vi',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 06:20:15',	'2021-09-25 06:20:15',	NULL),
(9,	'42692c63-dda7-4840-a10e-94ccc5b386b0',	'demoCandidate',	'002',	'demoCandidate001@007.com',	'gravatar',	NULL,	'$2y$10$N.UhL65D6B6i8uLTnYLTg.mh7RWLmxl11HnWxhDrZlrDGte5I01Ku',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 06:49:43',	'2021-09-25 06:49:43',	NULL),
(10,	'96ee6e9a-9f92-4f0d-8be5-5b2d668d6760',	'demoCandidate',	'003',	'demoCandidate003@007.com',	'gravatar',	NULL,	'$2y$10$dzJ3XCDWpBZeeNrGkIeVmepLvlQ8VuxsJ0X366JwiYIQi/2GE7Wti',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 06:52:01',	'2021-09-25 06:52:01',	NULL),
(11,	'41ec674c-49bd-4075-b078-b48a0a09ddbd',	'demoCandidate',	'003',	'demoCandidate004@007.com',	'gravatar',	NULL,	'$2y$10$4yTKeSaW7PsSr27qZt1Ed.1iuPbSLf5Tkrnl5erGa8IJq/CyilME6',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 06:53:06',	'2021-09-25 06:53:06',	NULL),
(12,	'b0925f40-9fc3-4ab3-bc77-d8b9d33d8011',	'demoCandidate',	'003',	'demoCandidate005@007.com',	'gravatar',	NULL,	'$2y$10$LHEIe2MbozOQiCTTmenw9uyE3defuWIWeIfayxIOmz6Gs3CVRJiSG',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 06:57:46',	'2021-09-25 06:57:46',	NULL),
(13,	'd44e2636-4ecb-49c8-86ba-3cf302dc2364',	'demoCandidate',	'003',	'demoCandidate006@007.com',	'gravatar',	NULL,	'$2y$10$P7.s7NTZtpGnYuDG.hVz7OFyjVkt0mD11nQUBLQbJBOaL9c1xl18S',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 06:58:15',	'2021-09-25 06:58:15',	NULL),
(14,	'23ad98b2-3ebb-4e4d-8623-f81499d61725',	'demoCandidate',	'003',	'demoCandidate007@007.com',	'gravatar',	NULL,	'$2y$10$U5etD/XFMK1vA013p1p/HebBz.WYxokvyGtPQNcq062dYmqdR6fvG',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:02:44',	'2021-09-25 07:02:44',	NULL),
(15,	'01566a23-36d1-456c-8453-4f901a170a5a',	'demoCandidate',	'003',	'demoCandidate008@007.com',	'gravatar',	NULL,	'$2y$10$rxM/7YPlEIFAJf.qJuD4nuuhjirHb.EXQT/JXR5aadJMwfS/niydK',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:08:14',	'2021-09-25 07:08:14',	NULL),
(16,	'35255b57-1c9a-4f42-b6e9-1772a17d9a8b',	'demoCandidate',	'003',	'demoCandidate009@007.com',	'gravatar',	NULL,	'$2y$10$4dz9wX64ezqlELjP2S0Cru84l1wVKKzq/O2QcbrarA62hrSbdvX7.',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:22:30',	'2021-09-25 07:22:30',	NULL),
(17,	'de6e84aa-7fad-4a72-9f45-20dffcb7d99e',	'demoCandidate',	'003',	'demoCandidate010@007.com',	'gravatar',	NULL,	'$2y$10$F.9Ftq6ocEbGXgs1gcYfT.DYQok9liSGGykP3XrI4LXtUZgkF8fZ.',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:24:01',	'2021-09-25 07:24:01',	NULL),
(18,	'763b9d88-393e-4a66-8b66-c66d7a10d181',	'demoCandidate',	'003',	'demoCandidate011@007.com',	'gravatar',	NULL,	'$2y$10$MesBgheSVuCrIb/TdRY1Lum9YzztyF01/5p.HwYGI1XuHbJ2mWFEe',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:26:24',	'2021-09-25 07:26:24',	NULL),
(19,	'e23e7474-e481-4c04-96dd-6d76df19c080',	'demoCandidate',	'012',	'demoCandidate012@007.com',	'gravatar',	NULL,	'$2y$10$oX7QSXLBMwkeXYwRqwFAie4LtNc4dOoJAA76G6dbr7SznALxY/f3a',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:27:21',	'2021-10-26 08:15:19',	NULL),
(20,	'7c8be1a0-4e98-485f-a98e-d3a931f76656',	'demoEmployer',	'001',	'demoEmployer01@007.com',	'gravatar',	NULL,	'$2y$10$9EEOfOb0nytduF2nREtQouxCEhZ1RqhkgzYeFbKhnwjb26/ZOYxGy',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:28:17',	'2021-10-25 07:20:16',	'2021-10-25 07:20:16'),
(21,	'6803a89b-dd8d-42e0-9f64-855d5f920bf2',	'demoEmployer',	'002',	'demoEmployer02@007.com',	'gravatar',	NULL,	'$2y$10$pnVzZPVPzzVb3J5dU/IRReoCKglUiiZzXvhkov58MHhtvQysgM..G',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 07:29:18',	'2021-09-25 07:29:18',	NULL),
(22,	'89d97791-08e2-4bf4-b62f-8c8c3c182eb0',	'demoEmployer',	'004',	'demoEmployer03@007.com',	'gravatar',	NULL,	'$2y$10$vZhCYN4dyTQ8pCLUZxuGoeaLTEL/kFqRE90L7vEhsgZgM8eas5vD6',	NULL,	1,	NULL,	1,	NULL,	NULL,	NULL,	0,	1,	NULL,	NULL,	0,	NULL,	'2021-09-25 08:26:55',	'2021-10-29 14:45:26',	NULL);

-- 2021-11-19 13:23:13
