-- MySQL dump 10.13  Distrib 8.2.0, for macos13.5 (arm64)
--
-- Host: 127.0.0.1    Database: db_productos
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB-1:11.2.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2023_12_16_011159_create_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'qui','Qui sit et quia odio non. Repudiandae nisi vitae id temporibus nihil quis quam.','PRO111QUI',5.00,82,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/1b628dfb34417373fd2b7b5ccaf6a928.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(2,'expedita','Ut qui velit magni repellat voluptate at. Perspiciatis unde eveniet voluptates sunt facere.','PRO269ITA',4.00,29,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/dac3b786265c084b13b15155aa6a0983.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(3,'enim','Commodi aspernatur omnis quia. Iste quasi sint odio debitis quis. Maiores itaque et est et vitae.','PRO050NIM',6.00,54,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/c42d336153f90bc192f401e716d3b158.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(4,'dolor','Voluptatem odio voluptatem animi aut et corrupti maiores. Nostrum sunt in molestiae.','PRO857LOR',0.00,100,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/093f49e5c908fd727b56a34e3ecb21e0.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(5,'aliquid','Dolores corrupti occaecati aut dolor est harum. Illo nostrum impedit ad sint aut molestias totam.','PRO868UID',9.00,17,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/4b88f11accd2c2a8e1431e1fb9ce7761.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(6,'sequi','Aliquid nisi quam quo est est eius. Et modi est nobis est. Quam molestias ut atque vel ut.','PRO682QUI',6.00,67,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/c6f39eae87fee2e64c8441d1f16f286e.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(7,'saepe','Asperiores et quia corporis deleniti eaque tempore et. Quo deserunt adipisci et provident ratione.','PRO280EPE',8.00,91,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/ea31a47c78c9f5816719489d1d654f94.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(8,'sit','At id dolorem est amet. Aut in nemo occaecati. Earum possimus incidunt aut fugiat.','PRO077SIT',7.00,9,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/d82bccc1fe1fbca554b3d9796c631928.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(9,'temporibus','Velit et nihil sapiente est hic corrupti. Sunt et qui modi rem quam consequatur.','PRO541BUS',9.00,55,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/e24325cf0b5c7dffe92875a3f631122d.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(10,'quia','Minima id unde sed. Sequi impedit molestiae aperiam omnis explicabo. Quia autem quasi omnis quas.','PRO543UIA',4.00,15,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/ea190870c29e3ea78c4c3a6d7435f204.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(11,'illum','Labore ex qui non veniam reprehenderit et ex. Nisi sunt laboriosam sed error quia dolor.','PRO077LUM',8.00,5,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/062b1e04aeb896de01b18f11caae926a.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(12,'cupiditate','Quo at id quas saepe animi iste soluta. Ut quibusdam exercitationem aut eius assumenda ipsum.','PRO048ATE',9.00,63,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/87a05dc8b0e99c4fc5d9aee2d8d6bad0.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(13,'aut','Consequuntur dolore ad laborum natus aut. Ea et recusandae dolorum sit expedita.','PRO189AUT',8.00,54,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/2dd75d1872f479c35691c0f245eb4517.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(14,'aspernatur','Nulla sed ratione culpa voluptatum dolore. Quia laudantium a architecto ipsum.','PRO145TUR',3.00,31,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/67dc4d3650c9037d1590f09cf9a72d03.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(15,'qui','Quam dicta dolore harum quibusdam odio temporibus. Ipsa adipisci et ad reiciendis enim aut.','PRO285QUI',9.00,59,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/b16c786f9e401479833949d58e4c93b1.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(16,'nisi','Ut incidunt aut ad est illo. Maiores aspernatur voluptatem aut quisquam.','PRO047ISI',3.00,52,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/5e258516871dee9ab3bc6b3ea11bc04b.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(17,'error','Pariatur sint quae laudantium ut ut. Quia quo sed fugit harum fugiat.','PRO734ROR',0.00,59,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/234c7b55e83d5b8150299bda62269e89.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(18,'autem','Tenetur molestiae modi aliquid sed. Aut maxime tempore pariatur dolor beatae. Sint aut impedit aut.','PRO437TEM',3.00,24,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/e6f2a30105cca5887913e963c6d7327a.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(19,'quia','Incidunt tempore ut et. Aliquid consequatur voluptas qui ullam est adipisci.','PRO466UIA',4.00,89,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/da342f3d9739e7079f24aa41f12494eb.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(20,'expedita','Quaerat a sit sunt est iste est ipsam. Rerum enim est voluptates est aut consequatur odio.','PRO789ITA',4.00,1,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/a0a33f22484066e80fc97339e7d6a10b.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(21,'nihil','Id qui quo ea. Aliquam dolores quam repellendus nisi omnis natus. Voluptate quibusdam id ad vitae.','PRO916HIL',7.00,68,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/8df8bf7e86555c27a852fa631f8e2dac.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(22,'ut','Qui porro quis quaerat harum. Suscipit ut dolor itaque. Facilis vel voluptatibus natus sit ad aut.','PRO327UT',8.00,6,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/41702ff8c974264fe28824dde68df50d.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(23,'consequatur','Odio eveniet officiis accusamus ipsam qui. Rerum vero rerum occaecati consequuntur harum.','PRO179TUR',1.00,39,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/560ff459a48c313b7cfd11a5d0a59af2.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(24,'non','Neque sed vel voluptatibus sit. Consectetur illo in voluptas voluptatem.','PRO581NON',8.00,34,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/2f8dbd6013d18898898760849d02c108.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(25,'eum','Non velit quam cum. Placeat facilis qui qui. Nam odio quasi sit omnis illum.','PRO645EUM',7.00,18,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/29c91cd7bbba77fbad8b3caa5f20a8e5.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(26,'sunt','Vel voluptates doloremque minima quam sit saepe. Labore fugit laboriosam quo sed eos.','PRO862UNT',1.00,1,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/29494fb02300abc8a4e92bdc028bc6df.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(27,'enim','Occaecati placeat omnis similique dolorem cumque. Id voluptas vero et tenetur quibusdam.','PRO299NIM',1.00,4,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/51ae93bb3f1ba27a67f39e02199da151.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(28,'atque','Magni et recusandae dolore et recusandae consequatur occaecati. Omnis dolores qui dicta eius.','PRO311QUE',0.00,29,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/186012fdaee58b218799551a37e13c63.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(29,'quo','Sed sequi nesciunt ut ratione. Sed dignissimos ad temporibus omnis.','PRO504QUO',9.00,50,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/b7bb9619a877cfed52cd73662b696bee.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(30,'aut','Velit totam voluptas ut esse quis. Dolores quis debitis vel qui. Ducimus qui dignissimos nesciunt.','PRO159AUT',7.00,11,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/d99a7afef933717bf8926184fba04a15.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(31,'itaque','Deleniti saepe occaecati perferendis. Dignissimos aut eos hic ut dolores ratione.','PRO235QUE',0.00,0,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/761297082e2ee0c5019ce1e817670298.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(32,'sit','Molestias nam numquam sed sit quia tempore. Id qui praesentium quae at.','PRO981SIT',5.00,57,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/4875c27a2c04cb6e9850aa53d2749ac3.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(33,'facilis','Qui amet qui aut est. Reiciendis error iusto nesciunt commodi enim.','PRO863LIS',0.00,80,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/0f630d6b0b95c52e65b38b53b75fdb76.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(34,'qui','Esse odit et repellendus ut molestias eos. Odit illo illum esse laboriosam ut.','PRO720QUI',5.00,64,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/2f61c7c6dd75d57642884ccb40ea2f28.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(35,'in','Veniam esse aut excepturi voluptatem. Rem dolore molestias fugit est.','PRO293IN',7.00,43,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/b0bbab019a8ef07501188def24182537.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(36,'voluptate','Mollitia et et nulla nesciunt velit enim. Non eos omnis porro unde rem.','PRO407ATE',9.00,29,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/c48306aa9c68bea783224f71f494ef55.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(37,'eum','Fuga quos eum nihil id. Molestiae dolor et esse.','PRO286EUM',7.00,57,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/5eb60a92423841c67d69e07f45c1cb01.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(38,'fuga','Voluptates dolorem quis atque iure reiciendis facere. Illo qui perspiciatis sed occaecati ex et et.','PRO763UGA',5.00,10,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/c54df2fbeec575e681f0e35ade690d36.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(39,'ratione','Eos distinctio aut odio deserunt aut. Ab nemo amet et culpa.','PRO600ONE',4.00,79,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/4a2053d0469fdb25ff69b1eca1411031.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(40,'et','Molestias reiciendis rerum earum et et aut. Autem temporibus eius saepe. Vero qui et et.','PRO677ET',0.00,5,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/7284d4a3806548d858146e15f5a76e4d.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(41,'et','Quia occaecati nihil harum sunt amet. Voluptatem vel odit ipsum quia soluta aut.','PRO899ET',9.00,74,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/704ab460a24d1ac6ea2663ff2c9dd9cc.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(42,'tenetur','Ea facilis aut vel consequatur. Molestiae dolor magni omnis et earum exercitationem.','PRO936TUR',5.00,0,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/c40054dc8482408eaa2621d24e878821.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(43,'doloremque','Sit expedita at ipsam ratione. Amet iure deleniti cupiditate eveniet voluptatem minus.','PRO102QUE',8.00,74,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/19883760ad18edc9e472b0f3772feed9.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(44,'sed','Perferendis provident qui et nam. Quaerat a voluptas sint sed rerum nemo. Modi quas maxime ut.','PRO499SED',1.00,14,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/1a89b0f24c69b4f1ef0490a5e660ca76.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(45,'labore','Corporis totam possimus sit ut distinctio. Ea neque minus aut est fuga rerum aperiam.','PRO943ORE',2.00,32,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/c574d125d3bd9b87ab09aa71083b1e79.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(46,'eos','Voluptas quia ad sit dolor in molestiae est. Quia repellat sunt recusandae assumenda excepturi et.','PRO816EOS',4.00,26,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/ea5f2966dcc50b8b434f9e79a24cf0ef.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(47,'voluptas','Et labore culpa corporis officia quae mollitia. Est possimus sed vel sapiente voluptatem.','PRO909TAS',2.00,20,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/92b958500f140b76bb514a438163cbd5.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(48,'aut','Facilis perferendis mollitia sed exercitationem assumenda. Cupiditate rem autem doloribus.','PRO153AUT',4.00,27,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/6ffd7734b2b5834609174d6bb1d8c5b0.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(49,'explicabo','Inventore quia corporis quos. Aspernatur quia sunt sint sequi ut.','PRO642ABO',6.00,87,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/60ba0ecafa87571022fcd1fbcb94fedc.png',0,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(50,'numquam','Ratione aut rem dolores. Eum aut dolores quidem alias.','PRO377UAM',7.00,67,'/var/folders/hr/_qjrxn2914b09l484lvzhm840000gn/T/8879a0102a3e5106a583b9332f250073.png',1,'2023-12-16 21:20:18','2023-12-16 21:20:18'),(51,'tenedor','tenedor sopero','PRO250DOR',10.00,900,'/tenedor/test/dada',0,'2023-12-18 04:56:46','2023-12-18 16:22:14');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-18 12:28:33
