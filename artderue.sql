/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: artderue
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `artiste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `nationalite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9C07354F86CC499D` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artiste`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `artiste` WRITE;
/*!40000 ALTER TABLE `artiste` DISABLE KEYS */;
INSERT INTO `artiste` VALUES
(1,'C215','Christian Guémy','Pochoirs de portraits','Française'),
(2,'Mausa',NULL,'Graffeur local',NULL),
(3,'Zéro',NULL,'Collages urbains','Français');
/*!40000 ALTER TABLE `artiste` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `benevole`
--

DROP TABLE IF EXISTS `benevole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `benevole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benevole`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `benevole` WRITE;
/*!40000 ALTER TABLE `benevole` DISABLE KEYS */;
INSERT INTO `benevole` VALUES
(1,'test@test.fr','[]','$2y$13$LDrw28xDs3Cx6szbizh1U.BUMF3Fi5GssrDajDr8zzDt3SAxN8iSW','Dupont','Jean');
/*!40000 ALTER TABLE `benevole` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES
('App\\Migrations\\Version20261104084919','2026-11-04 08:49:32',228),
('App\\Migrations\\Version20261104133655','2026-11-04 13:37:17',125);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `quartier` varchar(255) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieu`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `lieu` WRITE;
/*!40000 ALTER TABLE `lieu` DISABLE KEYS */;
INSERT INTO `lieu` VALUES
(1,'Mur de la gare','1 rue de la Gare','Centre',47.2184000,-1.5536000),
(2,'Pont du canal',NULL,'Ste Anne',47.2100000,-1.5600000),
(3,'Cour de l’usine','5 rue des Forges','Château',47.2160000,-1.5500000);
/*!40000 ALTER TABLE `lieu` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oeuvre`
--

DROP TABLE IF EXISTS `oeuvre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oeuvre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `est_detruit` tinyint(4) NOT NULL,
  `lieu_id` int(11) NOT NULL,
  `oeuvre_recouverte_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_35FE2EFEEAFC6390` (`oeuvre_recouverte_id`),
  KEY `IDX_35FE2EFE6AB213CC` (`lieu_id`),
  CONSTRAINT `FK_35FE2EFE6AB213CC` FOREIGN KEY (`lieu_id`) REFERENCES `lieu` (`id`),
  CONSTRAINT `FK_35FE2EFEEAFC6390` FOREIGN KEY (`oeuvre_recouverte_id`) REFERENCES `oeuvre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeuvre`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oeuvre` WRITE;
/*!40000 ALTER TABLE `oeuvre` DISABLE KEYS */;
INSERT INTO `oeuvre` VALUES
(4,'Le Chat','2024-02-03','Stylé',0,1,NULL),
(5,'Le Renard','2023-09-12','Renard orange sur brique',0,1,NULL);
/*!40000 ALTER TABLE `oeuvre` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oeuvre_artiste`
--

DROP TABLE IF EXISTS `oeuvre_artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oeuvre_artiste` (
  `oeuvre_id` int(11) NOT NULL,
  `artiste_id` int(11) NOT NULL,
  PRIMARY KEY (`oeuvre_id`,`artiste_id`),
  KEY `IDX_DB75DF1488194DE8` (`oeuvre_id`),
  KEY `IDX_DB75DF1421D25844` (`artiste_id`),
  CONSTRAINT `FK_DB75DF1421D25844` FOREIGN KEY (`artiste_id`) REFERENCES `artiste` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DB75DF1488194DE8` FOREIGN KEY (`oeuvre_id`) REFERENCES `oeuvre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeuvre_artiste`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oeuvre_artiste` WRITE;
/*!40000 ALTER TABLE `oeuvre_artiste` DISABLE KEYS */;
INSERT INTO `oeuvre_artiste` VALUES
(4,1),
(5,1);
/*!40000 ALTER TABLE `oeuvre_artiste` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oeuvre_technique`
--

DROP TABLE IF EXISTS `oeuvre_technique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oeuvre_technique` (
  `oeuvre_id` int(11) NOT NULL,
  `technique_id` int(11) NOT NULL,
  PRIMARY KEY (`oeuvre_id`,`technique_id`),
  KEY `IDX_CEAB50CA88194DE8` (`oeuvre_id`),
  KEY `IDX_CEAB50CA1F8ACB26` (`technique_id`),
  CONSTRAINT `FK_CEAB50CA1F8ACB26` FOREIGN KEY (`technique_id`) REFERENCES `technique` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CEAB50CA88194DE8` FOREIGN KEY (`oeuvre_id`) REFERENCES `oeuvre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeuvre_technique`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oeuvre_technique` WRITE;
/*!40000 ALTER TABLE `oeuvre_technique` DISABLE KEYS */;
INSERT INTO `oeuvre_technique` VALUES
(4,2),
(5,2);
/*!40000 ALTER TABLE `oeuvre_technique` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_prise_vue` date NOT NULL,
  `nom_fichier` varchar(255) NOT NULL,
  `etat_oeuvre` varchar(255) DEFAULT NULL,
  `oeuvre_id` int(11) NOT NULL,
  `benevole_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B7841888194DE8` (`oeuvre_id`),
  KEY `IDX_14B78418E77B7C09` (`benevole_id`),
  CONSTRAINT `FK_14B7841888194DE8` FOREIGN KEY (`oeuvre_id`) REFERENCES `oeuvre` (`id`),
  CONSTRAINT `FK_14B78418E77B7C09` FOREIGN KEY (`benevole_id`) REFERENCES `benevole` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES
(4,'2025-03-31','Photos/chat_01.jpg','Neuve',4,1),
(5,'2022-04-22','Photos/chat_02.jpg','Neuve',4,1),
(6,'2023-09-14','Photos/renard_01.jpg','Neuve',5,1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `technique`
--

DROP TABLE IF EXISTS `technique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `technique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D73B98416C6E55B5` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technique`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `technique` WRITE;
/*!40000 ALTER TABLE `technique` DISABLE KEYS */;
INSERT INTO `technique` VALUES
(1,'Bombe aérosol'),
(3,'Collage'),
(4,'Mosaïque'),
(2,'Pochoir');
/*!40000 ALTER TABLE `technique` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-05 22:14:50
