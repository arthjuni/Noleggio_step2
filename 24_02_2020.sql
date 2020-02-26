-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: esercizio01
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'GROUP_CAPO_NEGOZIO'),(1,'GROUP_CLIENTE'),(3,'GROUP_FORNITORE'),(2,'GROUP_LAVORATORE');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add fornitore',7,'add_fornitore'),(26,'Can change fornitore',7,'change_fornitore'),(27,'Can delete fornitore',7,'delete_fornitore'),(28,'Can view fornitore',7,'view_fornitore'),(29,'Can add localita',8,'add_localita'),(30,'Can change localita',8,'change_localita'),(31,'Can delete localita',8,'delete_localita'),(32,'Can view localita',8,'view_localita'),(33,'Can add video',9,'add_video'),(34,'Can change video',9,'change_video'),(35,'Can delete video',9,'delete_video'),(36,'Can view video',9,'view_video'),(37,'Can add punto vendita',10,'add_puntovendita'),(38,'Can change punto vendita',10,'change_puntovendita'),(39,'Can delete punto vendita',10,'delete_puntovendita'),(40,'Can view punto vendita',10,'view_puntovendita'),(41,'Can add merce',11,'add_merce'),(42,'Can change merce',11,'change_merce'),(43,'Can delete merce',11,'delete_merce'),(44,'Can view merce',11,'view_merce'),(45,'Can add articolo',12,'add_articolo'),(46,'Can change articolo',12,'change_articolo'),(47,'Can delete articolo',12,'delete_articolo'),(48,'Can view articolo',12,'view_articolo'),(49,'Can add testata noleggio',13,'add_testatanoleggio'),(50,'Can change testata noleggio',13,'change_testatanoleggio'),(51,'Can delete testata noleggio',13,'delete_testatanoleggio'),(52,'Can view testata noleggio',13,'view_testatanoleggio'),(53,'Can add cliente',14,'add_cliente'),(54,'Can change cliente',14,'change_cliente'),(55,'Can delete cliente',14,'delete_cliente'),(56,'Can view cliente',14,'view_cliente'),(57,'Can add detail noleggio',15,'add_detailnoleggio'),(58,'Can change detail noleggio',15,'change_detailnoleggio'),(59,'Can delete detail noleggio',15,'delete_detailnoleggio'),(60,'Can view detail noleggio',15,'view_detailnoleggio'),(61,'Can add documento',16,'add_documento'),(62,'Can change documento',16,'change_documento'),(63,'Can delete documento',16,'delete_documento'),(64,'Can view documento',16,'view_documento'),(65,'Can add lavoratore',17,'add_lavoratore'),(66,'Can change lavoratore',17,'change_lavoratore'),(67,'Can delete lavoratore',17,'delete_lavoratore'),(68,'Can view lavoratore',17,'view_lavoratore'),(69,'Can add listvideomerce',18,'add_listvideomerce'),(70,'Can change listvideomerce',18,'change_listvideomerce'),(71,'Can delete listvideomerce',18,'delete_listvideomerce'),(72,'Can view listvideomerce',18,'view_listvideomerce');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$OCMXPnkElzBR$cLMP80nfXmk0MvS3hHMLKaCG1QMT6t5CN4Qa1t3Bm64=','2020-02-24 16:27:32.330453',1,'admin','','','admin@hg.com',1,1,'2020-02-23 10:24:36.912649'),(2,'pbkdf2_sha256$180000$eEirGLN9b2PS$tuSixPNKtSp85zWR7UJrd/j2itu/0w9NiX3E1Ln3tVY=','2020-02-24 16:12:57.956823',0,'test','','','',0,1,'2020-02-23 10:25:46.437535'),(3,'pbkdf2_sha256$180000$1obQFtEFAr8F$MqOGz1rODfmgTAh+oR8PR4XeVEK3tJc6Gz+KuJIGWGk=','2020-02-24 16:29:59.694890',0,'rene','','','',0,1,'2020-02-23 10:34:15.662402'),(4,'pbkdf2_sha256$180000$apZMZ3deDPlK$oeEsG5sNRARDC05NmWGVZpjzDsYwanCcaOKV3mVZN9c=',NULL,0,'etalnan','','','',0,1,'2020-02-24 09:01:50.423032'),(5,'pbkdf2_sha256$180000$hlHE07jYciYA$63u7T8eLrf+ERg3LKz9ySf5I3AXkYyWbYSHdDph8UyY=',NULL,0,'bwilli','','','',0,1,'2020-02-24 09:03:08.510819'),(6,'pbkdf2_sha256$180000$xV7CpYs2QQMD$zKjTvMq7T6LZ23KCgnUajHDxKbVaGwk3gq67oYpQfkk=',NULL,0,'fgarbi','','','',0,1,'2020-02-24 09:04:33.456274'),(7,'pbkdf2_sha256$180000$FeCpgBHC6xuK$VJS6BMbAyscv+ce8Vobr+gWMuqBZI/NEqIPVv5lhpqI=',NULL,0,'fsilvien','','','',0,1,'2020-02-24 09:06:24.771223');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-23 10:25:46.652068','2','test',1,'[{\"added\": {}}]',4,1),(2,'2020-02-23 10:34:15.864426','3','rene',1,'[{\"added\": {}}]',4,1),(3,'2020-02-23 10:35:24.662575','1','Cliente object (1)',1,'[{\"added\": {}}]',14,1),(4,'2020-02-23 10:39:34.761835','1','Lavoratore object (1)',1,'[{\"added\": {}}]',17,1),(5,'2020-02-23 10:40:02.360820','2','Lavoratore object (2)',1,'[{\"added\": {}}]',17,1),(6,'2020-02-24 08:47:31.319546','1','GROUP_CLIENTE',1,'[{\"added\": {}}]',3,1),(7,'2020-02-24 08:47:51.485111','2','GROUP_LAVORATORE',1,'[{\"added\": {}}]',3,1),(8,'2020-02-24 08:48:02.184161','3','FORNITORE',1,'[{\"added\": {}}]',3,1),(9,'2020-02-24 08:48:32.001513','4','GROUP_CAPO_NEGOZIO',1,'[{\"added\": {}}]',3,1),(10,'2020-02-24 08:48:45.676018','3','GROUP_FORNITORE',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(11,'2020-02-24 09:01:50.547202','4','etalnan',1,'[{\"added\": {}}]',4,1),(12,'2020-02-24 09:02:10.550223','2','Cliente object (2)',1,'[{\"added\": {}}]',14,1),(13,'2020-02-24 09:03:08.637098','5','bwilli',1,'[{\"added\": {}}]',4,1),(14,'2020-02-24 09:03:21.989304','3','Cliente object (3)',1,'[{\"added\": {}}]',14,1),(15,'2020-02-24 09:04:33.586984','6','fgarbi',1,'[{\"added\": {}}]',4,1),(16,'2020-02-24 09:05:46.080654','3','Lavoratore object (3)',1,'[{\"added\": {}}]',17,1),(17,'2020-02-24 09:06:24.900474','7','fsilvien',1,'[{\"added\": {}}]',4,1),(18,'2020-02-24 09:06:28.931163','4','Lavoratore object (4)',1,'[{\"added\": {}}]',17,1),(19,'2020-02-24 09:51:28.621385','1','fornitore 1',1,'[{\"added\": {}}]',7,1),(20,'2020-02-24 09:51:51.400594','2','fornotore 2',1,'[{\"added\": {}}]',7,1),(21,'2020-02-24 09:52:18.669998','3','fornitore 3',1,'[{\"added\": {}}]',7,1),(22,'2020-02-24 09:52:32.162456','2','videoshop di cossato',2,'[]',10,1),(23,'2020-02-24 09:52:36.413088','1','fotoshop di biella',2,'[]',10,1),(24,'2020-02-24 09:52:49.204788','3','vercelli',1,'[{\"added\": {}}]',8,1),(25,'2020-02-24 10:05:36.928075','1','Titolo :La vita o la Guerra Genere :Action Description :film d\'action',1,'[{\"added\": {}}]',9,1),(26,'2020-02-24 10:06:51.327241','2','Titolo :Marte Genere :Fantasy Description :la vita su marte',1,'[{\"added\": {}}]',9,1),(27,'2020-02-24 10:10:37.899884','1','Nome del Fornitore  :fornitore 3 quantita di merce  :500 e il Negozio : fotoshop di vercelli',1,'[{\"added\": {}}]',11,1),(28,'2020-02-24 10:10:58.925942','1','Nome del Fornitore  :fornitore 3 quantita di merce  :100 e il Negozio : fotoshop di vercelli',2,'[{\"changed\": {\"fields\": [\"Quantita\"]}}]',11,1),(29,'2020-02-24 10:11:42.922109','1','Nome del Fornitore  :fornitore 3 quantita di merce  :100 e il Negozio : fotoshop di vercelli e di questa 50 quantita',1,'[{\"added\": {}}]',12,1),(30,'2020-02-24 10:12:06.993050','2','Nome del Fornitore  :fornitore 3 quantita di merce  :100 e il Negozio : fotoshop di vercelli e di questa 70 quantita',1,'[{\"added\": {}}]',12,1),(31,'2020-02-24 10:12:31.771291','2','Nome del Fornitore  :fornitore 3 quantita di merce  :100 e il Negozio : fotoshop di vercelli e di questa 50 quantita',2,'[{\"changed\": {\"fields\": [\"Quantita\"]}}]',12,1),(32,'2020-02-24 11:45:31.073556','2','Nome del Fornitore  :fornotore 2 quantita di merce  :500 e il Negozio : fotoshop di biella',1,'[{\"added\": {}}]',11,1),(33,'2020-02-24 11:46:01.064950','3','Nome del Fornitore  :fornitore 1 quantita di merce  :100 e il Negozio : videoshop di cossato',1,'[{\"added\": {}}]',11,1),(34,'2020-02-24 11:47:14.306815','3','Nome del Fornitore  :fornitore 1 quantita di merce  :100 e il Negozio : videoshop di cossato e di questa 50 quantita',1,'[{\"added\": {}}]',12,1),(35,'2020-02-24 11:47:29.297733','4','Nome del Fornitore  :fornitore 1 quantita di merce  :100 e il Negozio : videoshop di cossato e di questa 50 quantita',1,'[{\"added\": {}}]',12,1),(36,'2020-02-24 11:54:53.658205','1','fotoshop di biella',2,'[]',10,1),(37,'2020-02-24 12:26:30.067547','5','Nome del Fornitore  :fornotore 2 quantita di merce  :500 e il Negozio : fotoshop di biella e di questa 100 quantita',1,'[{\"added\": {}}]',12,1),(38,'2020-02-24 12:26:50.805185','6','Nome del Fornitore  :fornotore 2 quantita di merce  :500 e il Negozio : fotoshop di biella e di questa 100 quantita',1,'[{\"added\": {}}]',12,1),(39,'2020-02-24 12:27:05.999117','7','Nome del Fornitore  :fornotore 2 quantita di merce  :500 e il Negozio : fotoshop di biella e di questa 100 quantita',1,'[{\"added\": {}}]',12,1),(40,'2020-02-24 12:27:20.195963','8','Nome del Fornitore  :fornotore 2 quantita di merce  :500 e il Negozio : fotoshop di biella e di questa 100 quantita',1,'[{\"added\": {}}]',12,1),(41,'2020-02-24 12:27:54.595233','9','Nome del Fornitore  :fornotore 2 quantita di merce  :500 e il Negozio : fotoshop di biella e di questa 100 quantita',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(12,'Shop','articolo'),(14,'Shop','cliente'),(15,'Shop','detailnoleggio'),(16,'Shop','documento'),(7,'Shop','fornitore'),(17,'Shop','lavoratore'),(18,'Shop','listvideomerce'),(8,'Shop','localita'),(11,'Shop','merce'),(10,'Shop','puntovendita'),(13,'Shop','testatanoleggio'),(9,'Shop','video');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Shop','0001_initial','2020-02-23 10:17:39.970755'),(2,'contenttypes','0001_initial','2020-02-23 10:17:40.613461'),(3,'auth','0001_initial','2020-02-23 10:17:40.947643'),(4,'admin','0001_initial','2020-02-23 10:17:41.867656'),(5,'admin','0002_logentry_remove_auto_add','2020-02-23 10:17:42.078041'),(6,'admin','0003_logentry_add_action_flag_choices','2020-02-23 10:17:42.093586'),(7,'contenttypes','0002_remove_content_type_name','2020-02-23 10:17:42.330449'),(8,'auth','0002_alter_permission_name_max_length','2020-02-23 10:17:42.454812'),(9,'auth','0003_alter_user_email_max_length','2020-02-23 10:17:42.499618'),(10,'auth','0004_alter_user_username_opts','2020-02-23 10:17:42.512743'),(11,'auth','0005_alter_user_last_login_null','2020-02-23 10:17:42.644525'),(12,'auth','0006_require_contenttypes_0002','2020-02-23 10:17:42.648538'),(13,'auth','0007_alter_validators_add_error_messages','2020-02-23 10:17:42.661464'),(14,'auth','0008_alter_user_username_max_length','2020-02-23 10:17:42.792856'),(15,'auth','0009_alter_user_last_name_max_length','2020-02-23 10:17:42.926770'),(16,'auth','0010_alter_group_name_max_length','2020-02-23 10:17:42.959451'),(17,'auth','0011_update_proxy_permissions','2020-02-23 10:17:42.977682'),(18,'sessions','0001_initial','2020-02-23 10:17:43.046611'),(19,'Shop','0002_auto_20200223_1122','2020-02-23 10:22:20.056699'),(20,'Shop','0003_listvideomerce','2020-02-23 10:23:11.298332');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ha62adlj51oftam0ff570o9z0g6eothz','NmI5ZDU1YmRkMTQ5ZGJiNzlhNGFhN2VmMWMwMjM1YjU2OTEzZDJhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGRlNzkzNmZhNTE3M2VhNjMyM2EwNjE4ZTc4YWNjOTdlODc4YzU3In0=','2020-03-09 06:34:27.167283'),('icy71nve4la6o4yf71td4prpz8dg324j','NmI5ZDU1YmRkMTQ5ZGJiNzlhNGFhN2VmMWMwMjM1YjU2OTEzZDJhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGRlNzkzNmZhNTE3M2VhNjMyM2EwNjE4ZTc4YWNjOTdlODc4YzU3In0=','2020-03-09 08:50:45.190653'),('lje8zeqxl9cedtxa046it9vlubbfyct8','N2RmOGZhOGFiY2QwOWE5ZTdkZjhmOTdkNWQ5NmNkMjgwYzdiOTVmNDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZGY5MzdkYmJiNzY3ZmMwZjhmNzcwY2ZiNmJkZTUyNjgyMzFhZDdjIn0=','2020-03-09 16:29:59.701893');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_articolo`
--

DROP TABLE IF EXISTS `shop_articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_articolo` (
  `Last_update` datetime(6) NOT NULL,
  `Articolo_id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantita` int(11) NOT NULL,
  `Merce_id` int(11) NOT NULL,
  `Video_id` int(11) NOT NULL,
  PRIMARY KEY (`Articolo_id`),
  KEY `Shop_articolo_Merce_id_3633f4dd_fk_Shop_merce_Merce_id` (`Merce_id`),
  KEY `Shop_articolo_Video_id_62b9148b_fk_Shop_video_Video_id` (`Video_id`),
  CONSTRAINT `Shop_articolo_Merce_id_3633f4dd_fk_Shop_merce_Merce_id` FOREIGN KEY (`Merce_id`) REFERENCES `shop_merce` (`Merce_id`),
  CONSTRAINT `Shop_articolo_Video_id_62b9148b_fk_Shop_video_Video_id` FOREIGN KEY (`Video_id`) REFERENCES `shop_video` (`Video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_articolo`
--

LOCK TABLES `shop_articolo` WRITE;
/*!40000 ALTER TABLE `shop_articolo` DISABLE KEYS */;
INSERT INTO `shop_articolo` VALUES ('2020-02-24 10:11:38.000000',1,50,1,1),('2020-02-24 10:06:37.000000',2,50,1,2),('2020-02-24 11:47:04.000000',3,50,3,4),('2020-02-24 11:47:25.000000',4,50,3,5),('2020-02-24 12:26:19.000000',5,100,2,1),('2020-02-24 12:26:46.000000',6,100,2,2),('2020-02-24 12:27:02.000000',7,100,2,3),('2020-02-24 12:27:14.000000',8,100,2,4),('2020-02-24 12:27:33.000000',9,100,2,5);
/*!40000 ALTER TABLE `shop_articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cliente`
--

DROP TABLE IF EXISTS `shop_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_cliente` (
  `Cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `Codicefiscale` varchar(45) DEFAULT NULL,
  `Data_di_nascita` varchar(45) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `Last_update` datetime(6) NOT NULL,
  `Telefono_casa` varchar(45) DEFAULT NULL,
  `Telefono_cellulare` varchar(45) DEFAULT NULL,
  `Documento_id` int(11) NOT NULL,
  `utente_id` int(11) NOT NULL,
  PRIMARY KEY (`Cliente_id`),
  UNIQUE KEY `utente_id` (`utente_id`),
  KEY `Shop_cliente_Documento_id_264d6cc2_fk_Shop_docu` (`Documento_id`),
  CONSTRAINT `Shop_cliente_Documento_id_264d6cc2_fk_Shop_docu` FOREIGN KEY (`Documento_id`) REFERENCES `shop_documento` (`Documento_id`),
  CONSTRAINT `Shop_cliente_utente_id_3dca4f22_fk_auth_user_id` FOREIGN KEY (`utente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cliente`
--

LOCK TABLES `shop_cliente` WRITE;
/*!40000 ALTER TABLE `shop_cliente` DISABLE KEYS */;
INSERT INTO `shop_cliente` VALUES (1,'123ab','1993-12-28',1,'2020-02-23 10:34:29.000000','123456','654321',1,3),(2,'taer12345','1990-01-10',0,'2020-02-24 09:01:58.000000','0635374373','0435374373',1,4),(3,'bouawilli','1990-05-10',0,'2020-02-24 09:03:13.000000','123456','654321',1,5);
/*!40000 ALTER TABLE `shop_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_detailnoleggio`
--

DROP TABLE IF EXISTS `shop_detailnoleggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_detailnoleggio` (
  `Noleggio_id` int(11) NOT NULL AUTO_INCREMENT,
  `Last_update` datetime(6) NOT NULL,
  `DataPrevista` datetime(6) NOT NULL,
  `Prezzo_effettivo` double NOT NULL,
  `Sconto` double NOT NULL,
  `Articolo_id` int(11) NOT NULL,
  `Testata_noleggio_id` int(11) NOT NULL,
  PRIMARY KEY (`Noleggio_id`),
  KEY `Shop_detailnoleggio_Articolo_id_afacd7e4_fk_Shop_arti` (`Articolo_id`),
  KEY `Shop_detailnoleggio_Testata_noleggio_id_7d6552e4_fk_Shop_test` (`Testata_noleggio_id`),
  CONSTRAINT `Shop_detailnoleggio_Articolo_id_afacd7e4_fk_Shop_arti` FOREIGN KEY (`Articolo_id`) REFERENCES `shop_articolo` (`Articolo_id`),
  CONSTRAINT `Shop_detailnoleggio_Testata_noleggio_id_7d6552e4_fk_Shop_test` FOREIGN KEY (`Testata_noleggio_id`) REFERENCES `shop_testatanoleggio` (`Testata_noleggio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_detailnoleggio`
--

LOCK TABLES `shop_detailnoleggio` WRITE;
/*!40000 ALTER TABLE `shop_detailnoleggio` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_detailnoleggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_documento`
--

DROP TABLE IF EXISTS `shop_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_documento` (
  `Documento_id` int(11) NOT NULL AUTO_INCREMENT,
  `Firma` int(11) NOT NULL,
  PRIMARY KEY (`Documento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_documento`
--

LOCK TABLES `shop_documento` WRITE;
/*!40000 ALTER TABLE `shop_documento` DISABLE KEYS */;
INSERT INTO `shop_documento` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `shop_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_fornitore`
--

DROP TABLE IF EXISTS `shop_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_fornitore` (
  `Fornitore_id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`Fornitore_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_fornitore`
--

LOCK TABLES `shop_fornitore` WRITE;
/*!40000 ALTER TABLE `shop_fornitore` DISABLE KEYS */;
INSERT INTO `shop_fornitore` VALUES (1,'fornitore 1','2020-02-24 09:51:27.000000'),(2,'fornotore 2','2019-02-24 09:03:13.000000'),(3,'fornitore 3','2019-02-26 09:52:17.000000');
/*!40000 ALTER TABLE `shop_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_lavoratore`
--

DROP TABLE IF EXISTS `shop_lavoratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_lavoratore` (
  `Lavoratore_id` int(11) NOT NULL AUTO_INCREMENT,
  `Matricola` varchar(45) DEFAULT NULL,
  `Punto_vendita_id` int(11) NOT NULL,
  `Responsabile_id` int(11) DEFAULT NULL,
  `utente_id` int(11) NOT NULL,
  PRIMARY KEY (`Lavoratore_id`),
  UNIQUE KEY `utente_id` (`utente_id`),
  UNIQUE KEY `Responsabile_id` (`Responsabile_id`),
  KEY `Shop_lavoratore_Punto_vendita_id_3c0072c6_fk_Shop_punt` (`Punto_vendita_id`),
  CONSTRAINT `Shop_lavoratore_Punto_vendita_id_3c0072c6_fk_Shop_punt` FOREIGN KEY (`Punto_vendita_id`) REFERENCES `shop_puntovendita` (`Punto_vendita_id`),
  CONSTRAINT `Shop_lavoratore_Responsabile_id_5cb66104_fk_Shop_lavo` FOREIGN KEY (`Responsabile_id`) REFERENCES `shop_lavoratore` (`Lavoratore_id`),
  CONSTRAINT `Shop_lavoratore_utente_id_c753c24a_fk_auth_user_id` FOREIGN KEY (`utente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_lavoratore`
--

LOCK TABLES `shop_lavoratore` WRITE;
/*!40000 ALTER TABLE `shop_lavoratore` DISABLE KEYS */;
INSERT INTO `shop_lavoratore` VALUES (1,'sdfdf',2,NULL,3),(2,'123456ali',2,1,2),(3,'arth123juni',2,NULL,6),(4,'gfdf',1,3,7);
/*!40000 ALTER TABLE `shop_lavoratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `shop_listvideomerce`
--

DROP TABLE IF EXISTS `shop_listvideomerce`;
/*!50001 DROP VIEW IF EXISTS `shop_listvideomerce`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `shop_listvideomerce` AS SELECT 
 1 AS `Listvideomerce_id`,
 1 AS `quantitaM`,
 1 AS `Punto_vendita_id`,
 1 AS `Quantita`,
 1 AS `Nome`,
 1 AS `Titolo`,
 1 AS `Quantita_articolo`,
 1 AS `Autore`,
 1 AS `CasaProdutrice`,
 1 AS `Description`,
 1 AS `Durata`,
 1 AS `Genere`,
 1 AS `Regista`,
 1 AS `Prezzo_listino`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shop_localita`
--

DROP TABLE IF EXISTS `shop_localita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_localita` (
  `Localita_id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_localita` varchar(45) NOT NULL,
  PRIMARY KEY (`Localita_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_localita`
--

LOCK TABLES `shop_localita` WRITE;
/*!40000 ALTER TABLE `shop_localita` DISABLE KEYS */;
INSERT INTO `shop_localita` VALUES (1,'biella'),(2,'cossato'),(3,'vercelli');
/*!40000 ALTER TABLE `shop_localita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_merce`
--

DROP TABLE IF EXISTS `shop_merce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_merce` (
  `Merce_id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantita` int(11) NOT NULL,
  `Last_update` datetime(6) DEFAULT NULL,
  `Fornitore_id` int(11) NOT NULL,
  `Punto_vendita_id` int(11) NOT NULL,
  PRIMARY KEY (`Merce_id`),
  KEY `Shop_merce_Fornitore_id_167657c2_fk_Shop_fornitore_Fornitore_id` (`Fornitore_id`),
  KEY `Shop_merce_Punto_vendita_id_31fdde0f_fk_Shop_punt` (`Punto_vendita_id`),
  CONSTRAINT `Shop_merce_Fornitore_id_167657c2_fk_Shop_fornitore_Fornitore_id` FOREIGN KEY (`Fornitore_id`) REFERENCES `shop_fornitore` (`Fornitore_id`),
  CONSTRAINT `Shop_merce_Punto_vendita_id_31fdde0f_fk_Shop_punt` FOREIGN KEY (`Punto_vendita_id`) REFERENCES `shop_puntovendita` (`Punto_vendita_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_merce`
--

LOCK TABLES `shop_merce` WRITE;
/*!40000 ALTER TABLE `shop_merce` DISABLE KEYS */;
INSERT INTO `shop_merce` VALUES (1,100,'2020-02-24 10:10:36.000000',3,3),(2,500,'2020-02-24 11:45:29.000000',2,1),(3,100,'2020-02-24 11:46:00.000000',1,2);
/*!40000 ALTER TABLE `shop_merce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_puntovendita`
--

DROP TABLE IF EXISTS `shop_puntovendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_puntovendita` (
  `Punto_vendita_id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Last_update` datetime(6) NOT NULL,
  `Localita_id` int(11) NOT NULL,
  PRIMARY KEY (`Punto_vendita_id`),
  KEY `Shop_puntovendita_Localita_id_66ea813d_fk_Shop_loca` (`Localita_id`),
  CONSTRAINT `Shop_puntovendita_Localita_id_66ea813d_fk_Shop_loca` FOREIGN KEY (`Localita_id`) REFERENCES `shop_localita` (`Localita_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_puntovendita`
--

LOCK TABLES `shop_puntovendita` WRITE;
/*!40000 ALTER TABLE `shop_puntovendita` DISABLE KEYS */;
INSERT INTO `shop_puntovendita` VALUES (1,'fotoshop','2020-10-10 00:00:00.000000',1),(2,'videoshop','2019-05-10 00:00:00.000000',2),(3,'fotoshop','2015-10-25 00:00:00.000000',3);
/*!40000 ALTER TABLE `shop_puntovendita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_testatanoleggio`
--

DROP TABLE IF EXISTS `shop_testatanoleggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_testatanoleggio` (
  `Testata_noleggio_id` int(11) NOT NULL AUTO_INCREMENT,
  `Prezzo_definitivo` varchar(45) NOT NULL,
  `Data_fine` datetime(6) NOT NULL,
  `Ricevuta_noleggio` int(11) NOT NULL,
  `Ricevuta_fine` int(11) NOT NULL,
  `Cliente_id` int(11) NOT NULL,
  `Lavoratore_id` int(11) NOT NULL,
  PRIMARY KEY (`Testata_noleggio_id`),
  KEY `Shop_testatanoleggio_Cliente_id_f18d42c8_fk_Shop_clie` (`Cliente_id`),
  KEY `Shop_testatanoleggio_Lavoratore_id_65597715_fk_Shop_lavo` (`Lavoratore_id`),
  CONSTRAINT `Shop_testatanoleggio_Cliente_id_f18d42c8_fk_Shop_clie` FOREIGN KEY (`Cliente_id`) REFERENCES `shop_cliente` (`Cliente_id`),
  CONSTRAINT `Shop_testatanoleggio_Lavoratore_id_65597715_fk_Shop_lavo` FOREIGN KEY (`Lavoratore_id`) REFERENCES `shop_lavoratore` (`Lavoratore_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_testatanoleggio`
--

LOCK TABLES `shop_testatanoleggio` WRITE;
/*!40000 ALTER TABLE `shop_testatanoleggio` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_testatanoleggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_video`
--

DROP TABLE IF EXISTS `shop_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shop_video` (
  `Video_id` int(11) NOT NULL AUTO_INCREMENT,
  `Regista` varchar(100) DEFAULT NULL,
  `Autore` varchar(200) DEFAULT NULL,
  `CasaProdutrice` varchar(45) DEFAULT NULL,
  `Durata` int(11) DEFAULT NULL,
  `Genere` varchar(100) DEFAULT NULL,
  `Titolo` varchar(45) DEFAULT NULL,
  `Last_update` datetime(6) NOT NULL,
  `Prezzo_listino` double NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_video`
--

LOCK TABLES `shop_video` WRITE;
/*!40000 ALTER TABLE `shop_video` DISABLE KEYS */;
INSERT INTO `shop_video` VALUES (1,'Diouf Fall','ben affar','liongate',140,'Action','La vita o la Guerra','2020-02-24 10:05:24.000000',50,'film d\'action'),(2,'arth juni','ben siddi','liongate',70,'Fantasy','Marte','2010-02-24 10:06:37.000000',50,'la vita su marte'),(3,'will smith','brice lee','RAI1',60,'Action','lLa vita','2015-12-13 00:00:00.000000',70,'film comico'),(4,'Arnold S','will smith ,raya kakuta','TF1',80,'Romance','Gestapo','2019-05-15 00:00:00.000000',50,'duex2'),(5,'Freeman','bili jams','TG1',60,'orror','Suangue','2010-05-10 00:00:00.000000',60,'film  di vampir');
/*!40000 ALTER TABLE `shop_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `shop_listvideomerce`
--

/*!50001 DROP VIEW IF EXISTS `shop_listvideomerce`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`E2IKIWHIWB`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shop_listvideomerce` AS select `shop_articolo`.`Articolo_id` AS `Listvideomerce_id`,`shop_merce`.`Quantita` AS `quantitaM`,`shop_merce`.`Punto_vendita_id` AS `Punto_vendita_id`,`shop_articolo`.`Quantita` AS `Quantita`,`shop_fornitore`.`Nome` AS `Nome`,`shop_video`.`Titolo` AS `Titolo`,`shop_articolo`.`Quantita` AS `Quantita_articolo`,`shop_video`.`Autore` AS `Autore`,`shop_video`.`CasaProdutrice` AS `CasaProdutrice`,`shop_video`.`Description` AS `Description`,`shop_video`.`Durata` AS `Durata`,`shop_video`.`Genere` AS `Genere`,`shop_video`.`Regista` AS `Regista`,`shop_video`.`Prezzo_listino` AS `Prezzo_listino`,`auth_user`.`username` AS `username` from ((((`shop_merce` join `shop_articolo`) join `shop_fornitore`) join `shop_video`) join `auth_user`) where ((`shop_articolo`.`Merce_id` = `shop_merce`.`Merce_id`) and (`shop_merce`.`Fornitore_id` = `shop_fornitore`.`Fornitore_id`) and (`shop_articolo`.`Video_id` = `shop_video`.`Video_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-24 18:53:24
