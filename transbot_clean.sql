-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: transpobot
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chauffeurs`
--

DROP TABLE IF EXISTS `chauffeurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chauffeurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `numero_permis` varchar(30) NOT NULL,
  `date_embauche` date NOT NULL,
  `statut` enum('actif','suspendu','conge','retraite') NOT NULL DEFAULT 'actif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `numero_permis` (`numero_permis`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chauffeurs de la soci├®t├® de transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chauffeurs`
--

LOCK TABLES `chauffeurs` WRITE;
/*!40000 ALTER TABLE `chauffeurs` DISABLE KEYS */;
INSERT INTO `chauffeurs` VALUES (1,'FALL','Ibrahima','+221771234567','ibrahima.fall@transpobot.sn','SN-P-001234','2018-03-01','actif','2026-04-06 18:38:54'),(2,'DIOP','Moussa','+221772345678','moussa.diop@transpobot.sn','SN-P-002345','2019-06-15','actif','2026-04-06 18:38:54'),(3,'NDIAYE','Fatou','+221773456789','fatou.ndiaye@transpobot.sn','SN-P-003456','2020-01-10','actif','2026-04-06 18:38:54'),(4,'SECK','Oumar','+221774567890','oumar.seck@transpobot.sn','SN-P-004567','2017-09-20','actif','2026-04-06 18:38:54'),(5,'BA','Aminata','+221775678901','aminata.ba@transpobot.sn','SN-P-005678','2021-04-05','actif','2026-04-06 18:38:54'),(6,'GUEYE','Pape','+221776789012','pape.gueye@transpobot.sn','SN-P-006789','2016-11-30','suspendu','2026-04-06 18:38:54'),(7,'DIALLO','Cheikh','+221777890123','cheikh.diallo@transpobot.sn','SN-P-007890','2022-02-14','actif','2026-04-06 18:38:54'),(8,'KANE','Rokhaya','+221778901234','rokhaya.kane@transpobot.sn','SN-P-008901','2023-07-01','actif','2026-04-06 18:38:54'),(9,'THIAM','Serigne','+221779012345','serigne.thiam@transpobot.sn','SN-P-009012','2015-05-18','conge','2026-04-06 18:38:54'),(10,'MBAYE','Nd├®ye','+221770123456','ndeye.mbaye@transpobot.sn','SN-P-010123','2024-01-08','actif','2026-04-06 18:38:54');
/*!40000 ALTER TABLE `chauffeurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trajet_id` int(11) NOT NULL,
  `type_incident` enum('panne','accident','retard','agression','autre') NOT NULL,
  `description` text NOT NULL,
  `date_incident` datetime NOT NULL DEFAULT current_timestamp(),
  `gravite` enum('faible','moyen','grave','critique') NOT NULL DEFAULT 'faible',
  `statut` enum('ouvert','en_cours','resolu','clos') NOT NULL DEFAULT 'ouvert',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_incidents_trajet` (`trajet_id`),
  KEY `idx_incidents_date` (`date_incident`),
  CONSTRAINT `incidents_ibfk_1` FOREIGN KEY (`trajet_id`) REFERENCES `trajets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Incidents signal├®s lors des trajets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,3,'retard','Embouteillage sur la VDN, retard de 20 min.','2026-03-17 07:45:00','faible','clos','2026-04-06 18:38:55'),(2,5,'panne','Crevaison pneu arri├¿re gauche, r├®paration sur place.','2026-03-19 08:15:00','moyen','resolu','2026-04-06 18:38:55'),(3,8,'agression','Tentative de vol ├á la mont├®e au niveau de Sandaga.','2026-03-23 14:30:00','grave','resolu','2026-04-06 18:38:55'),(4,10,'retard','Travaux boulevard de la R├®publique, d├®viation impos├®e.','2026-03-25 07:50:00','faible','clos','2026-04-06 18:38:55'),(5,12,'panne','Surchauffe moteur, arr├¬t 15 min pour refroidissement.','2026-03-27 09:10:00','moyen','resolu','2026-04-06 18:38:55'),(6,14,'accident','Accrochage l├®ger avec un taxi au rond-point Libert├® VI.','2026-03-30 06:20:00','moyen','resolu','2026-04-06 18:38:55'),(7,16,'retard','Fort trafic matin, d├®part en retard de 10 min.','2026-04-01 08:05:00','faible','clos','2026-04-06 18:38:55'),(8,20,'accident','Choc avec moto-jakarta, d├®g├óts mat├®riels mineurs, police inform├®e.','2026-04-04 06:35:00','grave','en_cours','2026-04-06 18:38:55'),(9,21,'panne','Probl├¿me ├®lectrique, feux de signalisation d├®faillants.','2026-04-05 07:40:00','moyen','en_cours','2026-04-06 18:38:55'),(10,19,'retard','Passager malaise ├á bord, attente SAMU 10 min.','2026-04-03 06:30:00','moyen','clos','2026-04-06 18:38:55');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignes`
--

DROP TABLE IF EXISTS `lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lignes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `terminus_depart` varchar(100) NOT NULL,
  `terminus_arrivee` varchar(100) NOT NULL,
  `distance_km` decimal(6,2) NOT NULL,
  `duree_estimee_min` int(11) NOT NULL,
  `statut` enum('active','suspendue','en_travaux') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Lignes de transport urbain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes`
--

LOCK TABLES `lignes` WRITE;
/*!40000 ALTER TABLE `lignes` DISABLE KEYS */;
INSERT INTO `lignes` VALUES (1,'L01','Libert├® VI - Plateau','Libert├® VI','Plateau',12.50,45,'active','2026-04-06 18:38:54'),(2,'L02','Parcelles Assainies - Centre','Parcelles Ass.','March├® Sandaga',15.00,55,'active','2026-04-06 18:38:54'),(3,'L03','Gu├®diawaye - Dakar','Gu├®diawaye','Dakar Plateau',22.00,70,'active','2026-04-06 18:38:54'),(4,'L04','Pikine - Universit├® UCAD','Pikine Gare','UCAD',18.50,60,'active','2026-04-06 18:38:54'),(5,'L05','HLM - A├®roport AIBD','HLM Grand Yoff','AIBD',45.00,120,'active','2026-04-06 18:38:54'),(6,'L06','Ouakam - Corniche','Ouakam','Corniche Ouest',8.00,30,'active','2026-04-06 18:38:54'),(7,'L07','Keur Massar - Plateau','Keur Massar','Plateau',28.00,90,'suspendue','2026-04-06 18:38:54'),(8,'L08','Mbao - Dakar','Mbao','Dakar Plateau',25.00,80,'active','2026-04-06 18:38:54');
/*!40000 ALTER TABLE `lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ligne_id` int(11) NOT NULL,
  `type_passager` enum('normal','etudiant','senior','enfant') NOT NULL DEFAULT 'normal',
  `prix` decimal(8,2) NOT NULL,
  `date_application` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ligne_id` (`ligne_id`),
  CONSTRAINT `tarifs_ibfk_1` FOREIGN KEY (`ligne_id`) REFERENCES `lignes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Grille tarifaire par ligne et type de passager';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifs`
--

LOCK TABLES `tarifs` WRITE;
/*!40000 ALTER TABLE `tarifs` DISABLE KEYS */;
INSERT INTO `tarifs` VALUES (1,1,'normal',300.00,'2025-01-01','2026-04-06 18:38:54'),(2,1,'etudiant',150.00,'2025-01-01','2026-04-06 18:38:54'),(3,1,'senior',200.00,'2025-01-01','2026-04-06 18:38:54'),(4,1,'enfant',100.00,'2025-01-01','2026-04-06 18:38:54'),(5,2,'normal',350.00,'2025-01-01','2026-04-06 18:38:54'),(6,2,'etudiant',175.00,'2025-01-01','2026-04-06 18:38:54'),(7,2,'senior',225.00,'2025-01-01','2026-04-06 18:38:54'),(8,2,'enfant',120.00,'2025-01-01','2026-04-06 18:38:54'),(9,3,'normal',500.00,'2025-01-01','2026-04-06 18:38:54'),(10,3,'etudiant',250.00,'2025-01-01','2026-04-06 18:38:54'),(11,3,'senior',350.00,'2025-01-01','2026-04-06 18:38:54'),(12,3,'enfant',150.00,'2025-01-01','2026-04-06 18:38:54'),(13,4,'normal',450.00,'2025-01-01','2026-04-06 18:38:54'),(14,4,'etudiant',200.00,'2025-01-01','2026-04-06 18:38:54'),(15,4,'senior',300.00,'2025-01-01','2026-04-06 18:38:54'),(16,4,'enfant',150.00,'2025-01-01','2026-04-06 18:38:54'),(17,5,'normal',1500.00,'2025-01-01','2026-04-06 18:38:54'),(18,5,'etudiant',750.00,'2025-01-01','2026-04-06 18:38:54'),(19,5,'senior',1000.00,'2025-01-01','2026-04-06 18:38:54'),(20,5,'enfant',500.00,'2025-01-01','2026-04-06 18:38:54'),(21,6,'normal',250.00,'2025-01-01','2026-04-06 18:38:54'),(22,6,'etudiant',125.00,'2025-01-01','2026-04-06 18:38:54'),(23,6,'senior',175.00,'2025-01-01','2026-04-06 18:38:54'),(24,6,'enfant',100.00,'2025-01-01','2026-04-06 18:38:54'),(25,8,'normal',550.00,'2025-01-01','2026-04-06 18:38:54'),(26,8,'etudiant',275.00,'2025-01-01','2026-04-06 18:38:54'),(27,8,'senior',375.00,'2025-01-01','2026-04-06 18:38:54'),(28,8,'enfant',175.00,'2025-01-01','2026-04-06 18:38:54');
/*!40000 ALTER TABLE `tarifs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trajets`
--

DROP TABLE IF EXISTS `trajets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trajets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicule_id` int(11) NOT NULL,
  `chauffeur_id` int(11) NOT NULL,
  `ligne_id` int(11) NOT NULL,
  `date_heure_depart` datetime NOT NULL,
  `date_heure_arrivee` datetime DEFAULT NULL,
  `nb_passagers` int(11) NOT NULL DEFAULT 0,
  `km_parcourus` decimal(6,2) DEFAULT NULL,
  `recette` decimal(10,2) NOT NULL DEFAULT 0.00,
  `statut` enum('planifie','en_cours','termine','annule') NOT NULL DEFAULT 'planifie',
  `observations` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ligne_id` (`ligne_id`),
  KEY `idx_trajets_statut` (`statut`),
  KEY `idx_trajets_date_depart` (`date_heure_depart`),
  KEY `idx_trajets_chauffeur` (`chauffeur_id`),
  KEY `idx_trajets_vehicule` (`vehicule_id`),
  CONSTRAINT `trajets_ibfk_1` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`),
  CONSTRAINT `trajets_ibfk_2` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeurs` (`id`),
  CONSTRAINT `trajets_ibfk_3` FOREIGN KEY (`ligne_id`) REFERENCES `lignes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Historique de tous les trajets effectu├®s';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trajets`
--

LOCK TABLES `trajets` WRITE;
/*!40000 ALTER TABLE `trajets` DISABLE KEYS */;
INSERT INTO `trajets` VALUES (1,1,1,1,'2026-03-16 06:00:00','2026-03-16 06:47:00',48,12.50,14400.00,'termine',NULL,'2026-04-06 18:38:54'),(2,2,2,2,'2026-03-16 06:30:00','2026-03-16 07:28:00',62,15.00,21700.00,'termine',NULL,'2026-04-06 18:38:54'),(3,3,3,3,'2026-03-17 07:00:00','2026-03-17 08:12:00',55,22.00,27500.00,'termine',NULL,'2026-04-06 18:38:54'),(4,4,4,4,'2026-03-18 06:00:00','2026-03-18 07:02:00',40,18.50,18000.00,'termine',NULL,'2026-04-06 18:38:54'),(5,5,5,6,'2026-03-19 08:00:00','2026-03-19 08:33:00',30,8.00,7500.00,'termine',NULL,'2026-04-06 18:38:54'),(6,7,7,1,'2026-03-20 06:00:00','2026-03-20 06:50:00',52,12.50,15600.00,'termine',NULL,'2026-04-06 18:38:54'),(7,1,1,1,'2026-03-23 06:00:00','2026-03-23 06:45:00',50,12.50,15000.00,'termine',NULL,'2026-04-06 18:38:54'),(8,2,2,2,'2026-03-23 14:00:00','2026-03-23 14:56:00',58,15.00,20300.00,'termine',NULL,'2026-04-06 18:38:54'),(9,3,3,3,'2026-03-24 06:30:00','2026-03-24 07:42:00',60,22.00,30000.00,'termine',NULL,'2026-04-06 18:38:54'),(10,8,8,8,'2026-03-25 07:00:00','2026-03-25 08:22:00',28,25.00,15400.00,'termine',NULL,'2026-04-06 18:38:54'),(11,9,9,4,'2026-03-26 06:00:00','2026-03-26 07:00:00',45,18.50,20250.00,'termine',NULL,'2026-04-06 18:38:54'),(12,7,7,6,'2026-03-27 09:00:00','2026-03-27 09:28:00',22,8.00,5500.00,'termine',NULL,'2026-04-06 18:38:54'),(13,1,1,2,'2026-03-28 06:00:00','2026-03-28 06:58:00',55,15.00,19250.00,'termine',NULL,'2026-04-06 18:38:54'),(14,2,2,1,'2026-03-30 06:00:00','2026-03-30 06:44:00',47,12.50,14100.00,'termine',NULL,'2026-04-06 18:38:54'),(15,3,3,3,'2026-03-31 06:30:00','2026-03-31 07:38:00',63,22.00,31500.00,'termine',NULL,'2026-04-06 18:38:54'),(16,5,5,6,'2026-04-01 08:00:00','2026-04-01 08:31:00',35,8.00,8750.00,'termine',NULL,'2026-04-06 18:38:54'),(17,8,8,8,'2026-04-01 07:00:00','2026-04-01 08:18:00',30,25.00,16500.00,'termine',NULL,'2026-04-06 18:38:54'),(18,9,10,4,'2026-04-02 06:00:00','2026-04-02 07:02:00',50,18.50,22500.00,'termine',NULL,'2026-04-06 18:38:54'),(19,7,7,1,'2026-04-03 06:00:00','2026-04-03 06:48:00',44,12.50,13200.00,'termine',NULL,'2026-04-06 18:38:54'),(20,1,1,2,'2026-04-04 06:00:00','2026-04-04 06:55:00',60,15.00,21000.00,'termine',NULL,'2026-04-06 18:38:54'),(21,2,4,3,'2026-04-05 07:00:00','2026-04-05 08:09:00',58,22.00,29000.00,'termine',NULL,'2026-04-06 18:38:54'),(22,3,2,1,'2026-04-06 06:00:00',NULL,0,NULL,0.00,'en_cours',NULL,'2026-04-06 18:38:54'),(23,5,5,6,'2026-04-06 08:00:00',NULL,0,NULL,0.00,'en_cours',NULL,'2026-04-06 18:38:54'),(24,7,7,4,'2026-04-06 07:00:00','2026-04-06 08:10:00',47,18.50,21150.00,'termine',NULL,'2026-04-06 18:38:54');
/*!40000 ALTER TABLE `trajets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(20) NOT NULL,
  `marque` varchar(50) NOT NULL,
  `modele` varchar(50) NOT NULL,
  `capacite` int(11) NOT NULL,
  `annee_mise_en_service` int(11) NOT NULL,
  `kilometrage` int(11) NOT NULL DEFAULT 0,
  `statut` enum('disponible','en_service','maintenance','hors_service') NOT NULL DEFAULT 'disponible',
  `date_derniere_revision` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `immatriculation` (`immatriculation`),
  KEY `idx_vehicules_statut` (`statut`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flotte de v├®hicules de transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicules`
--

LOCK TABLES `vehicules` WRITE;
/*!40000 ALTER TABLE `vehicules` DISABLE KEYS */;
INSERT INTO `vehicules` VALUES (1,'DK-1001-AA','Tata','Starbus',60,2018,142000,'disponible','2026-01-15','2026-04-06 18:38:54'),(2,'DK-2002-AB','Mercedes','Citaro',80,2019,98000,'en_service','2026-02-10','2026-04-06 18:38:54'),(3,'DK-3003-AC','Yutong','ZK6126',70,2020,75000,'disponible','2026-03-01','2026-04-06 18:38:54'),(4,'DK-4004-AD','King Long','XMQ6127',65,2017,189000,'maintenance','2025-11-20','2026-04-06 18:38:54'),(5,'DK-5005-AE','Tata','LP 909',45,2021,45000,'disponible','2026-03-15','2026-04-06 18:38:54'),(6,'DK-6006-AF','Higer','KLQ6129',72,2016,210000,'hors_service','2025-06-01','2026-04-06 18:38:54'),(7,'DK-7007-AG','Mercedes','Conecto',55,2022,22000,'disponible','2026-04-01','2026-04-06 18:38:54'),(8,'DK-8008-AH','Yutong','ZK6852HG',35,2023,11000,'en_service','2026-04-01','2026-04-06 18:38:54'),(9,'DK-9009-AI','Tata','Starbus AC',60,2020,88000,'disponible','2026-02-25','2026-04-06 18:38:54'),(10,'DK-9012-EF','King Long','XMQ6900',50,2018,78000,'maintenance','2025-12-10','2026-04-06 18:38:54');
/*!40000 ALTER TABLE `vehicules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-09 20:46:21
