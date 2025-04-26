-- MySQL dump 10.13  Distrib 8.4.2, for Linux (x86_64)
--
-- Host: localhost    Database: ich_final_project
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_renter` tinyint(1) NOT NULL,
  `is_landlord` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add Token',7,'add_tokenproxy'),(26,'Can change Token',7,'change_tokenproxy'),(27,'Can delete Token',7,'delete_tokenproxy'),(28,'Can view Token',7,'view_tokenproxy'),(29,'Can add blacklisted token',8,'add_blacklistedtoken'),(30,'Can change blacklisted token',8,'change_blacklistedtoken'),(31,'Can delete blacklisted token',8,'delete_blacklistedtoken'),(32,'Can view blacklisted token',8,'view_blacklistedtoken'),(33,'Can add outstanding token',9,'add_outstandingtoken'),(34,'Can change outstanding token',9,'change_outstandingtoken'),(35,'Can delete outstanding token',9,'delete_outstandingtoken'),(36,'Can view outstanding token',9,'view_outstandingtoken'),(37,'Can add user',10,'add_customuser'),(38,'Can change user',10,'change_customuser'),(39,'Can delete user',10,'delete_customuser'),(40,'Can view user',10,'view_customuser'),(41,'Can add booking',11,'add_booking'),(42,'Can change booking',11,'change_booking'),(43,'Can delete booking',11,'delete_booking'),(44,'Can view booking',11,'view_booking'),(45,'Can add estate',12,'add_estate'),(46,'Can change estate',12,'change_estate'),(47,'Can delete estate',12,'delete_estate'),(48,'Can view estate',12,'view_estate'),(49,'Can add review',13,'add_review'),(50,'Can change review',13,'change_review'),(51,'Can delete review',13,'delete_review'),(52,'Can view review',13,'view_review'),(53,'Can add search query',14,'add_searchquery'),(54,'Can change search query',14,'change_searchquery'),(55,'Can delete search query',14,'delete_searchquery'),(56,'Can view search query',14,'view_searchquery'),(57,'Can add view record',15,'add_viewrecord'),(58,'Can change view record',15,'change_viewrecord'),(59,'Can delete view record',15,'delete_viewrecord'),(60,'Can view view record',15,'view_viewrecord');
LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_booking`
--

DROP TABLE IF EXISTS `bookings_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `estate_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_booking_estate_id_3759fe87_fk_estates_estate_id` (`estate_id`),
  KEY `bookings_booking_user_id_834dfc23_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `bookings_booking_estate_id_3759fe87_fk_estates_estate_id` FOREIGN KEY (`estate_id`) REFERENCES `estates_estate` (`id`),
  CONSTRAINT `bookings_booking_user_id_834dfc23_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking`
--

/*!40000 ALTER TABLE `bookings_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(11,'bookings','booking'),(4,'contenttypes','contenttype'),(12,'estates','estate'),(13,'reviews','review'),(5,'sessions','session'),(8,'token_blacklist','blacklistedtoken'),(9,'token_blacklist','outstandingtoken'),(14,'tracking','searchquery'),(15,'tracking','viewrecord');
LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-18 07:24:21.615088'),(2,'contenttypes','0002_remove_content_type_name','2025-04-18 07:24:21.672147'),(3,'auth','0001_initial','2025-04-18 07:24:21.890794'),(4,'auth','0002_alter_permission_name_max_length','2025-04-18 07:24:21.943054'),(5,'auth','0003_alter_user_email_max_length','2025-04-18 07:24:21.947601'),(6,'auth','0004_alter_user_username_opts','2025-04-18 07:24:21.952726'),(7,'auth','0005_alter_user_last_login_null','2025-04-18 07:24:21.957229'),(8,'auth','0006_require_contenttypes_0002','2025-04-18 07:24:21.959650'),(9,'auth','0007_alter_validators_add_error_messages','2025-04-18 07:24:21.964228'),(10,'auth','0008_alter_user_username_max_length','2025-04-18 07:24:21.968056'),(11,'auth','0009_alter_user_last_name_max_length','2025-04-18 07:24:21.972174'),(12,'auth','0010_alter_group_name_max_length','2025-04-18 07:24:21.983266'),(13,'auth','0011_update_proxy_permissions','2025-04-18 07:24:21.988181'),(14,'auth','0012_alter_user_first_name_max_length','2025-04-18 07:24:21.993267'),(15,'accounts','0001_initial','2025-04-18 07:24:22.255220'),(16,'admin','0001_initial','2025-04-18 07:24:22.378418'),(17,'admin','0002_logentry_remove_auto_add','2025-04-18 07:24:22.385716'),(18,'admin','0003_logentry_add_action_flag_choices','2025-04-18 07:24:22.390529'),(19,'authtoken','0001_initial','2025-04-18 07:24:22.457362'),(20,'authtoken','0002_auto_20160226_1747','2025-04-18 07:24:22.472344'),(21,'authtoken','0003_tokenproxy','2025-04-18 07:24:22.475148'),(22,'authtoken','0004_alter_tokenproxy_options','2025-04-18 07:24:22.478942'),(23,'estates','0001_initial','2025-04-18 07:24:22.553088'),(24,'bookings','0001_initial','2025-04-18 07:24:22.680108'),(25,'estates','0002_alter_estate_type','2025-04-18 07:24:22.686620'),(26,'reviews','0001_initial','2025-04-18 07:24:22.814021'),(27,'sessions','0001_initial','2025-04-18 07:24:22.843223'),(28,'token_blacklist','0001_initial','2025-04-18 07:24:22.976480'),(29,'token_blacklist','0002_outstandingtoken_jti_hex','2025-04-18 07:24:22.997128'),(30,'token_blacklist','0003_auto_20171017_2007','2025-04-18 07:24:23.006678'),(31,'token_blacklist','0004_auto_20171017_2013','2025-04-18 07:24:23.065926'),(32,'token_blacklist','0005_remove_outstandingtoken_jti','2025-04-18 07:24:23.109295'),(33,'token_blacklist','0006_auto_20171017_2113','2025-04-18 07:24:23.132499'),(34,'token_blacklist','0007_auto_20171017_2214','2025-04-18 07:24:23.287491'),(35,'token_blacklist','0008_migrate_to_bigautofield','2025-04-18 07:24:23.475943'),(36,'token_blacklist','0010_fix_migrate_to_bigautofield','2025-04-18 07:24:23.485171'),(37,'token_blacklist','0011_linearizes_history','2025-04-18 07:24:23.487256'),(38,'token_blacklist','0012_alter_outstandingtoken_user','2025-04-18 07:24:23.495544'),(39,'tracking','0001_initial','2025-04-18 07:24:23.679128');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estates_estate`
--

DROP TABLE IF EXISTS `estates_estate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estates_estate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `location` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rooms` int unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `views` int unsigned NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estates_estate_owner_id_ce0fe236_fk_accounts_customuser_id` (`owner_id`),
  CONSTRAINT `estates_estate_owner_id_ce0fe236_fk_accounts_customuser_id` FOREIGN KEY (`owner_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `estates_estate_chk_1` CHECK ((`rooms` >= 0)),
  CONSTRAINT `estates_estate_chk_2` CHECK ((`views` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estates_estate`
--

LOCK TABLES `estates_estate` WRITE;
/*!40000 ALTER TABLE `estates_estate` DISABLE KEYS */;
INSERT INTO `estates_estate` VALUES (1,'Landlord`s First Apartments','Landlord`s First Apartments','Center of somewhere',12300.00,3,'apartment',1,'2025-04-18 07:57:14.151284','2025-04-18 07:57:14.151304',0,1),(2,'Landlord`s House','Landlord`s House','Out of somewhere',8000.00,6,'house',1,'2025-04-18 07:57:22.910155','2025-04-18 07:59:43.233646',1,1),(3,'Apartments outside the ring road','I bought it but I don\'t live there','Outside the ring road',8000.00,1,'apartment',1,'2025-04-18 07:57:51.855334','2025-04-18 07:57:51.855350',0,2);
LOCK TABLES `reviews_review` WRITE;
/*!40000 ALTER TABLE `reviews_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_accounts_` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_searchquery`
--

DROP TABLE IF EXISTS `tracking_searchquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_searchquery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tracking_searchquery_user_id_ff52912f_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `tracking_searchquery_user_id_ff52912f_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_searchquery`
--

LOCK TABLES `tracking_searchquery` WRITE;
/*!40000 ALTER TABLE `tracking_searchquery` DISABLE KEYS */;
LOCK TABLES `tracking_viewrecord` WRITE;
/*!40000 ALTER TABLE `tracking_viewrecord` DISABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-26  4:20:08
