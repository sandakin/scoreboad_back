-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: scoreboard
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_game`
--

DROP TABLE IF EXISTS `api_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(100) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) DEFAULT NULL,
  `tournament_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_game_tournament_id_17da2c3e_fk_api_tournament_id` (`tournament_id`),
  CONSTRAINT `api_game_tournament_id_17da2c3e_fk_api_tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `api_tournament` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_game`
--

LOCK TABLES `api_game` WRITE;
/*!40000 ALTER TABLE `api_game` DISABLE KEYS */;
INSERT INTO `api_game` VALUES (3,'GAME-01','2019-12-16','NONE','18:00:00.000000','19:00:00.000000',2),(4,'GAME-02','2019-12-17','NONE','18:00:00.000000','19:00:00.000000',2),(5,'GAME-03','2019-12-18','NONE','18:00:00.000000','19:00:00.000000',2),(6,'GAME-04','2019-12-19','NONE','18:00:00.000000','19:00:00.000000',2),(7,'GAME-05','2019-12-20','NONE','18:00:00.000000','19:00:00.000000',2),(8,'GAME-06','2019-12-21','NONE','18:00:00.000000','19:00:00.000000',2),(9,'GAME-07','2019-12-22','NONE','18:00:00.000000','19:00:00.000000',2),(10,'GAME-08','2019-12-23','NONE','18:00:00.000000','19:00:00.000000',2);
/*!40000 ALTER TABLE `api_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_gamescore`
--

DROP TABLE IF EXISTS `api_gamescore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_gamescore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `is_win` tinyint(1) NOT NULL,
  `game_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_gamescore_game_id_8198b404_fk_api_game_id` (`game_id`),
  KEY `api_gamescore_team_id_6a25bf06_fk_api_team_id` (`team_id`),
  CONSTRAINT `api_gamescore_game_id_8198b404_fk_api_game_id` FOREIGN KEY (`game_id`) REFERENCES `api_game` (`id`),
  CONSTRAINT `api_gamescore_team_id_6a25bf06_fk_api_team_id` FOREIGN KEY (`team_id`) REFERENCES `api_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_gamescore`
--

LOCK TABLES `api_gamescore` WRITE;
/*!40000 ALTER TABLE `api_gamescore` DISABLE KEYS */;
INSERT INTO `api_gamescore` VALUES (6,10,20,15,18,0,3,4),(7,18,20,12,30,1,3,12),(8,15,20,15,30,1,4,5),(9,10,20,30,12,0,4,13),(10,12,8,18,20,0,5,6),(11,14,15,20,30,1,5,14),(12,16,20,22,18,1,6,7),(13,15,14,22,18,0,6,15),(14,22,14,15,18,0,7,8),(15,14,18,18,20,1,7,16),(16,14,17,15,18,1,8,9),(17,10,30,12,10,0,8,17),(18,15,22,21,18,1,9,10),(19,18,22,20,22,0,9,18),(20,17,12,11,10,0,10,11),(21,16,15,12,22,1,10,19);
/*!40000 ALTER TABLE `api_gamescore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_player`
--

DROP TABLE IF EXISTS `api_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `rank` varchar(20) NOT NULL,
  `height` double NOT NULL,
  `dob` date NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `api_player_team_id_df5bf8ad_fk_api_team_id` (`team_id`),
  CONSTRAINT `api_player_team_id_df5bf8ad_fk_api_team_id` FOREIGN KEY (`team_id`) REFERENCES `api_team` (`id`),
  CONSTRAINT `api_player_user_id_9570d7b5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_player`
--

LOCK TABLES `api_player` WRITE;
/*!40000 ALTER TABLE `api_player` DISABLE KEYS */;
INSERT INTO `api_player` VALUES (2,'AP1','NONE',5,'2019-12-23',4,7),(3,'AP2','NONE',5,'2019-12-23',4,8),(4,'AP3','NONE',5,'2019-12-23',4,9),(5,'AP4','NONE',5,'2019-12-23',4,10),(6,'AP5','NONE',5,'2019-12-23',4,11),(7,'AP6','NONE',5,'2019-12-23',4,12),(8,'AP7','NONE',5,'2019-12-23',4,13),(9,'AP8','NONE',5,'2019-12-23',4,14),(10,'AP9','NONE',5,'2019-12-23',4,15),(11,'AP10','NONE',5,'2019-12-23',4,16),(12,'BP1','NONE',5,'2019-12-23',5,17),(13,'BP2','NONE',5,'2019-12-23',5,18),(14,'BP3','NONE',5,'2019-12-23',5,19),(15,'BP4','NONE',5,'2019-12-23',5,20),(16,'BP5','NONE',5,'2019-12-23',5,21),(17,'BP6','NONE',5,'2019-12-23',5,22),(18,'BP7','NONE',5,'2019-12-23',5,23),(19,'BP8','NONE',5,'2019-12-23',5,24),(20,'BP9','NONE',5,'2019-12-23',5,25),(21,'BP10','NONE',5,'2019-12-23',5,26),(22,'CP1','NONE',5,'2019-12-23',6,27),(23,'CP2','NONE',5,'2019-12-23',6,28),(24,'CP3','NONE',5,'2019-12-23',6,29),(25,'CP4','NONE',5,'2019-12-23',6,30),(26,'CP5','NONE',5,'2019-12-23',6,31),(27,'CP6','NONE',5,'2019-12-23',6,32),(28,'CP7','NONE',5,'2019-12-23',6,33),(29,'CP8','NONE',5,'2019-12-23',6,34),(30,'CP9','NONE',5,'2019-12-23',6,35),(31,'CP10','NONE',5,'2019-12-23',6,36),(32,'DP1','NONE',5,'2019-12-23',7,37),(33,'DP2','NONE',5,'2019-12-23',7,38),(34,'DP3','NONE',5,'2019-12-23',7,39),(35,'DP4','NONE',5,'2019-12-23',7,40),(36,'DP5','NONE',5,'2019-12-23',7,41),(37,'DP6','NONE',5,'2019-12-23',7,42),(38,'DP7','NONE',5,'2019-12-23',7,43),(39,'DP8','NONE',5,'2019-12-23',7,44),(40,'DP9','NONE',5,'2019-12-23',7,45),(41,'DP10','NONE',5,'2019-12-23',7,46),(42,'EP1','NONE',5,'2019-12-23',8,47),(43,'EP2','NONE',5,'2019-12-23',8,48),(44,'EP3','NONE',5,'2019-12-23',8,49),(45,'EP4','NONE',5,'2019-12-23',8,50),(46,'EP5','NONE',5,'2019-12-23',8,51),(47,'EP6','NONE',5,'2019-12-23',8,52),(48,'EP7','NONE',5,'2019-12-23',8,53),(49,'EP8','NONE',5,'2019-12-23',8,54),(50,'EP9','NONE',5,'2019-12-23',8,55),(51,'EP10','NONE',5,'2019-12-23',8,56),(52,'FP1','NONE',5,'2019-12-23',9,57),(53,'FP2','NONE',5,'2019-12-23',9,58),(54,'FP3','NONE',5,'2019-12-23',9,59),(55,'FP4','NONE',5,'2019-12-23',9,60),(56,'FP5','NONE',5,'2019-12-23',9,61),(57,'FP6','NONE',5,'2019-12-23',9,62),(58,'FP7','NONE',5,'2019-12-23',9,63),(59,'FP8','NONE',5,'2019-12-23',9,64),(60,'FP9','NONE',5,'2019-12-23',9,65),(61,'FP10','NONE',5,'2019-12-23',9,66),(62,'GP1','NONE',5,'2019-12-23',10,67),(63,'GP2','NONE',5,'2019-12-23',10,68),(64,'GP3','NONE',5,'2019-12-23',10,69),(65,'GP4','NONE',5,'2019-12-23',10,70),(66,'GP5','NONE',5,'2019-12-23',10,71),(67,'GP6','NONE',5,'2019-12-23',10,72),(68,'GP7','NONE',5,'2019-12-23',10,73),(69,'GP8','NONE',5,'2019-12-23',10,74),(70,'GP9','NONE',5,'2019-12-23',10,75),(71,'GP10','NONE',5,'2019-12-23',10,76),(72,'HP1','NONE',5,'2019-12-23',11,77),(73,'HP2','NONE',5,'2019-12-23',11,78),(74,'HP3','NONE',5,'2019-12-23',11,79),(75,'HP4','NONE',5,'2019-12-23',11,80),(76,'HP5','NONE',5,'2019-12-23',11,81),(77,'HP6','NONE',5,'2019-12-23',11,82),(78,'HP7','NONE',5,'2019-12-23',11,83),(79,'HP8','NONE',5,'2019-12-23',11,84),(80,'HP9','NONE',5,'2019-12-23',11,85),(81,'HP10','NONE',5,'2019-12-23',11,86),(82,'IP1','NONE',5,'2019-12-23',12,87),(83,'IP2','NONE',5,'2019-12-23',12,88),(84,'IP3','NONE',5,'2019-12-23',12,89),(85,'IP4','NONE',5,'2019-12-23',12,90),(86,'IP5','NONE',5,'2019-12-23',12,91),(87,'IP6','NONE',5,'2019-12-23',12,92),(88,'IP7','NONE',5,'2019-12-23',12,93),(89,'IP8','NONE',5,'2019-12-23',12,94),(90,'IP9','NONE',5,'2019-12-23',12,95),(91,'IP10','NONE',5,'2019-12-23',12,96),(92,'JP1','NONE',5,'2019-12-23',13,97),(93,'JP2','NONE',5,'2019-12-23',13,98),(94,'JP3','NONE',5,'2019-12-23',13,99),(95,'JP4','NONE',5,'2019-12-23',13,100),(96,'JP5','NONE',5,'2019-12-23',13,101),(97,'JP6','NONE',5,'2019-12-23',13,102),(98,'JP7','NONE',5,'2019-12-23',13,103),(99,'JP8','NONE',5,'2019-12-23',13,104),(100,'JP9','NONE',5,'2019-12-23',13,105),(101,'JP10','NONE',5,'2019-12-23',13,106),(102,'KP1','NONE',5,'2019-12-23',14,107),(103,'KP2','NONE',5,'2019-12-23',14,108),(104,'KP3','NONE',5,'2019-12-23',14,109),(105,'KP4','NONE',5,'2019-12-23',14,110),(106,'KP5','NONE',5,'2019-12-23',14,111),(107,'KP6','NONE',5,'2019-12-23',14,112),(108,'KP7','NONE',5,'2019-12-23',14,113),(109,'KP8','NONE',5,'2019-12-23',14,114),(110,'KP9','NONE',5,'2019-12-23',14,115),(111,'KP10','NONE',5,'2019-12-23',14,116),(112,'LP1','NONE',5,'2019-12-23',15,117),(113,'LP2','NONE',5,'2019-12-23',15,118),(114,'LP3','NONE',5,'2019-12-23',15,119),(115,'LP4','NONE',5,'2019-12-23',15,120),(116,'LP5','NONE',5,'2019-12-23',15,121),(117,'LP6','NONE',5,'2019-12-23',15,122),(118,'LP7','NONE',5,'2019-12-23',15,123),(119,'LP8','NONE',5,'2019-12-23',15,124),(120,'LP9','NONE',5,'2019-12-23',15,125),(121,'LP10','NONE',5,'2019-12-23',15,126),(122,'MP1','NONE',5,'2019-12-23',16,127),(123,'MP2','NONE',5,'2019-12-23',16,128),(124,'MP3','NONE',5,'2019-12-23',16,129),(125,'MP4','NONE',5,'2019-12-23',16,130),(126,'MP5','NONE',5,'2019-12-23',16,131),(127,'MP6','NONE',5,'2019-12-23',16,132),(128,'MP7','NONE',5,'2019-12-23',16,133),(129,'MP8','NONE',5,'2019-12-23',16,134),(130,'MP9','NONE',5,'2019-12-23',16,135),(131,'MP10','NONE',5,'2019-12-23',16,136),(132,'NP1','NONE',5,'2019-12-23',17,137),(133,'NP2','NONE',5,'2019-12-23',17,138),(134,'NP3','NONE',5,'2019-12-23',17,139),(135,'NP4','NONE',5,'2019-12-23',17,140),(136,'NP5','NONE',5,'2019-12-23',17,141),(137,'NP6','NONE',5,'2019-12-23',17,142),(138,'NP7','NONE',5,'2019-12-23',17,143),(139,'NP8','NONE',5,'2019-12-23',17,144),(140,'NP9','NONE',5,'2019-12-23',17,145),(141,'NP10','NONE',5,'2019-12-23',17,146),(142,'OP1','NONE',5,'2019-12-23',18,147),(143,'OP2','NONE',5,'2019-12-23',18,148),(144,'OP3','NONE',5,'2019-12-23',18,149),(145,'OP4','NONE',5,'2019-12-23',18,150),(146,'OP5','NONE',5,'2019-12-23',18,151),(147,'OP6','NONE',5,'2019-12-23',18,152),(148,'OP7','NONE',5,'2019-12-23',18,153),(149,'OP8','NONE',5,'2019-12-23',18,154),(150,'OP9','NONE',5,'2019-12-23',18,155),(151,'OP10','NONE',5,'2019-12-23',18,156),(152,'PP1','NONE',5,'2019-12-23',19,157),(153,'PP2','NONE',5,'2019-12-23',19,158),(154,'PP3','NONE',5,'2019-12-23',19,159),(155,'PP4','NONE',5,'2019-12-23',19,160),(156,'PP5','NONE',5,'2019-12-23',19,161),(157,'PP6','NONE',5,'2019-12-23',19,162),(158,'PP7','NONE',5,'2019-12-23',19,163),(159,'PP8','NONE',5,'2019-12-23',19,164),(160,'PP9','NONE',5,'2019-12-23',19,165),(161,'PP10','NONE',5,'2019-12-23',19,166);
/*!40000 ALTER TABLE `api_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_playerscore`
--

DROP TABLE IF EXISTS `api_playerscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_playerscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minutes_played` int(11) NOT NULL,
  `rebounds` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_playerscore_game_id_58fcbda4_fk_api_game_id` (`game_id`),
  KEY `api_playerscore_player_id_cce4e254_fk_api_player_id` (`player_id`),
  CONSTRAINT `api_playerscore_game_id_58fcbda4_fk_api_game_id` FOREIGN KEY (`game_id`) REFERENCES `api_game` (`id`),
  CONSTRAINT `api_playerscore_player_id_cce4e254_fk_api_player_id` FOREIGN KEY (`player_id`) REFERENCES `api_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_playerscore`
--

LOCK TABLES `api_playerscore` WRITE;
/*!40000 ALTER TABLE `api_playerscore` DISABLE KEYS */;
INSERT INTO `api_playerscore` VALUES (1,60,10,10,55,3,2),(2,60,10,10,3,3,3),(3,60,10,10,2,3,4),(4,60,10,10,1,3,5),(5,60,10,10,2,3,6),(6,60,10,10,70,3,82),(7,60,10,10,2,3,83),(8,60,10,10,3,3,84),(9,60,10,10,3,3,85),(10,60,10,10,2,3,86),(11,60,10,10,70,4,12),(12,60,10,10,2,4,13),(13,60,10,10,3,4,14),(14,60,10,10,3,4,15),(15,60,10,10,2,4,16),(16,60,10,10,60,4,92),(17,60,10,10,3,4,93),(18,60,10,10,3,4,94),(19,60,10,10,3,4,95),(20,60,10,10,3,4,96),(21,60,10,10,50,5,22),(22,60,10,10,2,5,23),(23,60,10,10,2,5,24),(24,60,10,10,2,5,25),(25,60,10,10,2,5,26),(26,60,10,10,70,5,102),(27,60,10,10,3,5,103),(28,60,10,10,2,5,104),(29,60,10,10,2,5,105),(30,60,10,10,2,5,106),(31,60,10,10,70,6,32),(32,60,10,10,2,6,33),(33,60,10,10,2,6,34),(34,60,10,10,1,6,35),(35,60,10,10,1,6,36),(36,60,10,10,60,6,112),(37,60,10,10,2,6,113),(38,60,10,10,2,6,114),(39,60,10,10,2,6,115),(40,60,10,10,3,6,116),(41,60,10,10,60,7,42),(42,60,10,10,2,7,43),(43,60,10,10,2,7,44),(44,60,10,10,2,7,45),(45,60,10,10,3,7,46),(46,60,10,10,60,7,122),(47,60,10,10,2,7,123),(48,60,10,10,2,7,124),(49,60,10,10,2,7,125),(50,60,10,10,4,7,126),(51,60,10,10,58,8,52),(52,60,10,10,2,8,53),(53,60,10,10,2,8,54),(54,60,10,10,1,8,55),(55,60,10,10,1,8,56),(56,60,10,10,55,8,132),(57,60,10,10,2,8,133),(58,60,10,10,2,8,134),(59,60,10,10,3,8,135),(60,60,10,10,2,8,136),(61,60,10,10,70,9,62),(62,60,10,10,2,9,63),(63,60,10,10,2,9,64),(64,60,10,10,1,9,65),(65,60,10,10,1,9,66),(66,60,10,10,65,9,142),(67,60,10,10,2,9,143),(68,60,10,10,2,9,144),(69,60,10,10,2,9,145),(70,60,10,10,1,9,146),(71,60,10,10,40,10,72),(72,60,10,10,2,10,73),(73,60,10,10,2,10,74),(74,60,10,10,2,10,75),(75,60,10,10,4,10,76),(76,60,10,10,55,10,152),(77,60,10,10,2,10,153),(78,60,10,10,2,10,154),(79,60,10,10,2,10,155),(80,60,10,10,4,10,156);
/*!40000 ALTER TABLE `api_playerscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_staff`
--

DROP TABLE IF EXISTS `api_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(20) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `api_staff_team_id_d8ccafca_fk_api_team_id` (`team_id`),
  CONSTRAINT `api_staff_team_id_d8ccafca_fk_api_team_id` FOREIGN KEY (`team_id`) REFERENCES `api_team` (`id`),
  CONSTRAINT `api_staff_user_id_eef0210c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_staff`
--

LOCK TABLES `api_staff` WRITE;
/*!40000 ALTER TABLE `api_staff` DISABLE KEYS */;
INSERT INTO `api_staff` VALUES (3,'A-COACH','COACH',4,167),(4,'B-COACH','COACH',5,168),(5,'C-COACH','COACH',6,169),(6,'D-COACH','COACH',7,170),(7,'E-COACH','COACH',8,171),(8,'F-COACH','COACH',9,172),(9,'G-COACH','COACH',10,173),(10,'H-COACH','COACH',11,174),(11,'I-COACH','COACH',12,175),(12,'J-COACH','COACH',13,176),(13,'K-COACH','COACH',14,177),(14,'L-COACH','COACH',15,178),(15,'M-COACH','COACH',16,179),(16,'N-COACH','COACH',17,180),(17,'0-COACH','COACH',18,181),(18,'P-COACH','COACH',19,182);
/*!40000 ALTER TABLE `api_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_team`
--

DROP TABLE IF EXISTS `api_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_team`
--

LOCK TABLES `api_team` WRITE;
/*!40000 ALTER TABLE `api_team` DISABLE KEYS */;
INSERT INTO `api_team` VALUES (4,'TEAM A','1.jpeg'),(5,'TEAM B','2.jpeg'),(6,'TEAM C','3.png'),(7,'TEAM D','4.png'),(8,'TEAM E','5.png'),(9,'TEAM F','6.png'),(10,'TEAM G','7.jpeg'),(11,'TEAM H','8.png'),(12,'TEAM I','9.jpeg'),(13,'TEAM J','10.png'),(14,'TEAM K','11.png'),(15,'TEAM L','12.png'),(16,'TEAM M','13.png'),(17,'TEAM N','14.png'),(18,'TEAM O','15.png'),(19,'TEAM P','16.png');
/*!40000 ALTER TABLE `api_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_teamscore`
--

DROP TABLE IF EXISTS `api_teamscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_teamscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_field_goals` int(11) NOT NULL,
  `success_field_goals` int(11) NOT NULL,
  `total_points` int(11) NOT NULL,
  `success_points` int(11) NOT NULL,
  `total_free_throws` int(11) NOT NULL,
  `success_free_throws` int(11) NOT NULL,
  `rebounds` int(11) NOT NULL,
  `offensive` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `blocks` int(11) NOT NULL,
  `steals` int(11) NOT NULL,
  `turnovers` int(11) NOT NULL,
  `points_in_the_paint` int(11) NOT NULL,
  `fouls_personal` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_teamscore_game_id_986aa7dd_fk_api_game_id` (`game_id`),
  KEY `api_teamscore_team_id_31404d29_fk_api_team_id` (`team_id`),
  CONSTRAINT `api_teamscore_game_id_986aa7dd_fk_api_game_id` FOREIGN KEY (`game_id`) REFERENCES `api_game` (`id`),
  CONSTRAINT `api_teamscore_team_id_31404d29_fk_api_team_id` FOREIGN KEY (`team_id`) REFERENCES `api_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_teamscore`
--

LOCK TABLES `api_teamscore` WRITE;
/*!40000 ALTER TABLE `api_teamscore` DISABLE KEYS */;
INSERT INTO `api_teamscore` VALUES (3,50,20,63,63,10,10,10,10,10,10,10,10,10,10,3,4),(4,10,80,80,10,10,10,10,10,10,10,10,10,10,10,3,12),(5,10,10,80,80,10,10,10,10,10,10,10,10,10,10,4,5),(6,10,10,72,72,10,10,10,10,10,10,10,10,10,10,4,13),(7,10,10,58,58,10,10,10,10,10,10,10,10,10,10,5,6),(8,10,10,79,79,10,10,10,10,10,10,10,10,10,10,5,14),(9,10,10,76,76,10,10,10,10,10,10,10,10,10,10,6,7),(10,10,10,69,69,10,10,10,10,10,10,10,10,10,10,6,15),(11,10,10,69,69,10,10,10,10,10,10,10,10,10,10,7,8),(12,10,10,70,70,10,10,10,10,10,10,10,10,10,10,7,16),(13,10,10,64,64,10,10,10,10,10,10,10,10,10,10,8,9),(14,10,10,62,62,10,10,10,10,10,10,10,10,10,10,8,17),(15,10,10,76,76,10,10,10,10,10,10,10,10,10,10,9,10),(16,10,10,50,50,10,10,10,10,10,10,10,10,10,10,10,11),(17,10,10,65,65,10,10,10,10,10,10,10,10,10,10,10,19);
/*!40000 ALTER TABLE `api_teamscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tournament`
--

DROP TABLE IF EXISTS `api_tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tournament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `no_of_games` int(11) NOT NULL,
  `sponsor` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tournament`
--

LOCK TABLES `api_tournament` WRITE;
/*!40000 ALTER TABLE `api_tournament` DISABLE KEYS */;
INSERT INTO `api_tournament` VALUES (2,'2019-12-23 11:38:30.000000','2019-12-31 11:38:38.000000',16,'BANK OF AUSTRALIA','BASKET BALL TOURNAMENT');
/*!40000 ALTER TABLE `api_tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userstate`
--

DROP TABLE IF EXISTS `api_userstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_userstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_ping` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `num_of_login` int(11) NOT NULL,
  `tot_time_spend` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `api_userstate_user_id_367cd675_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userstate`
--

LOCK TABLES `api_userstate` WRITE;
/*!40000 ALTER TABLE `api_userstate` DISABLE KEYS */;
INSERT INTO `api_userstate` VALUES (1,'2019-12-24 03:50:31.202248',1,2,53945);
/*!40000 ALTER TABLE `api_userstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add application',7,'add_application'),(26,'Can change application',7,'change_application'),(27,'Can delete application',7,'delete_application'),(28,'Can view application',7,'view_application'),(29,'Can add access token',8,'add_accesstoken'),(30,'Can change access token',8,'change_accesstoken'),(31,'Can delete access token',8,'delete_accesstoken'),(32,'Can view access token',8,'view_accesstoken'),(33,'Can add grant',9,'add_grant'),(34,'Can change grant',9,'change_grant'),(35,'Can delete grant',9,'delete_grant'),(36,'Can view grant',9,'view_grant'),(37,'Can add refresh token',10,'add_refreshtoken'),(38,'Can change refresh token',10,'change_refreshtoken'),(39,'Can delete refresh token',10,'delete_refreshtoken'),(40,'Can view refresh token',10,'view_refreshtoken'),(41,'Can add cors model',11,'add_corsmodel'),(42,'Can change cors model',11,'change_corsmodel'),(43,'Can delete cors model',11,'delete_corsmodel'),(44,'Can view cors model',11,'view_corsmodel'),(45,'Can add game',12,'add_game'),(46,'Can change game',12,'change_game'),(47,'Can delete game',12,'delete_game'),(48,'Can view game',12,'view_game'),(49,'Can add player',13,'add_player'),(50,'Can change player',13,'change_player'),(51,'Can delete player',13,'delete_player'),(52,'Can view player',13,'view_player'),(53,'Can add team',14,'add_team'),(54,'Can change team',14,'change_team'),(55,'Can delete team',14,'delete_team'),(56,'Can view team',14,'view_team'),(57,'Can add tournament',15,'add_tournament'),(58,'Can change tournament',15,'change_tournament'),(59,'Can delete tournament',15,'delete_tournament'),(60,'Can view tournament',15,'view_tournament'),(61,'Can add team score',16,'add_teamscore'),(62,'Can change team score',16,'change_teamscore'),(63,'Can delete team score',16,'delete_teamscore'),(64,'Can view team score',16,'view_teamscore'),(65,'Can add staff',17,'add_staff'),(66,'Can change staff',17,'change_staff'),(67,'Can delete staff',17,'delete_staff'),(68,'Can view staff',17,'view_staff'),(69,'Can add player score',18,'add_playerscore'),(70,'Can change player score',18,'change_playerscore'),(71,'Can delete player score',18,'delete_playerscore'),(72,'Can view player score',18,'view_playerscore'),(73,'Can add game score',19,'add_gamescore'),(74,'Can change game score',19,'change_gamescore'),(75,'Can delete game score',19,'delete_gamescore'),(76,'Can view game score',19,'view_gamescore'),(77,'Can add user state',20,'add_userstate'),(78,'Can change user state',20,'change_userstate'),(79,'Can delete user state',20,'delete_userstate'),(80,'Can view user state',20,'view_userstate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$L3uDpC9lxl4U$0cthlR+loiOssffq16pNX7+/yjAd2MXTatzPuu2i56A=','2019-12-23 18:09:46.742401',1,'admin','','','',1,1,'2019-12-22 12:28:24.229575'),(7,'pbkdf2_sha256$180000$eULfU4OmWQto$qklOcRXo0gtJwfMwrvfOuFOR8QQQlcRs8DfeJI5oxsk=',NULL,0,'AP1','','','',0,1,'2019-12-23 12:28:20.117929'),(8,'pbkdf2_sha256$180000$NNdxSZxv6RdO$Tbkwer7Sx7za0T5OuGI4R/RzUgSPEY54DN+WkDJOSsg=',NULL,0,'AP2','','','',0,1,'2019-12-23 12:28:29.623482'),(9,'pbkdf2_sha256$180000$6ND4NGNsZ7a8$81uB5QaMQUU7CCjBaGmE7LbLxRxwtZi1Hf+/JtHbjnY=',NULL,0,'AP3','','','',0,1,'2019-12-23 12:28:38.742777'),(10,'pbkdf2_sha256$180000$it83FpA3lrCC$ofws3MKVPKA9o3AeoFAL0tcYciDLp2UcYev2nwSNYBA=',NULL,0,'AP4','','','',0,1,'2019-12-23 12:28:50.849325'),(11,'pbkdf2_sha256$180000$LE79cs1FfdL3$Kfc6d/982gav8EBeimwPGqOXGWCbQDtWGSPKwIu7GoU=',NULL,0,'AP5','','','',0,1,'2019-12-23 12:29:03.534306'),(12,'pbkdf2_sha256$180000$E2ANt0KwWp81$J9yXLtjbUFRwHX+aIe7++KqUNlwoQfDWI1fmTUbuqA8=',NULL,0,'AP6','','','',0,1,'2019-12-23 12:29:13.350829'),(13,'pbkdf2_sha256$180000$cuwHd4X7MkH3$UdS0kiIXN8rc7VGuH/jO8V+jafLTaymZJhej+gaX00c=',NULL,0,'AP7','','','',0,1,'2019-12-23 12:29:24.930407'),(14,'pbkdf2_sha256$180000$09RfGJrZQAVT$1VEZQPmN+bk6f1q6wRIn/Er0VRGMJq47QshJD/YWe6Q=',NULL,0,'AP8','','','',0,1,'2019-12-23 12:29:35.488254'),(15,'pbkdf2_sha256$180000$YpE3yRy7unpj$8d5aS0RLIudLV+FzC5M3RYPJfERtR6zcxHUWL27nwBI=',NULL,0,'AP9','','','',0,1,'2019-12-23 12:30:44.515374'),(16,'pbkdf2_sha256$180000$nBHho6HwHou4$u1WCv3x8Jq2xHXdrZhaHWkVgWDQwdIjhCQe49iSsTzU=',NULL,0,'AP10','','','',0,1,'2019-12-23 12:30:57.705673'),(17,'pbkdf2_sha256$180000$v142hMF4JTus$OEAcrBSTXzwHUtyAW6fR5bY9s+jkVu1KMPSGlzgsnao=',NULL,0,'BP1','','','',0,1,'2019-12-23 12:31:46.394293'),(18,'pbkdf2_sha256$180000$W0nFNvv8RkSs$51SDdcl6iJFJvYpxgzJKj45XeT3JCnh5E0YBy/y7d0k=',NULL,0,'BP2','','','',0,1,'2019-12-23 12:31:55.308393'),(19,'pbkdf2_sha256$180000$sArMdFvsT19p$qCzT+ReVXDpqitsIeU2rDF4YPnu8K6Du5WpZqZeL0QE=',NULL,0,'BP3','','','',0,1,'2019-12-23 12:32:27.108055'),(20,'pbkdf2_sha256$180000$gUhvBHPoJp0T$2SK3OXkIAgyTKmZkjq9THdcONNAwRFJEjRE6H/2RvOE=',NULL,0,'BP4','','','',0,1,'2019-12-23 12:32:36.548130'),(21,'pbkdf2_sha256$180000$MS9vMHgkWBAq$SVVhncLHAhYB+rb5XPoRZVNbNM/66xkeCZFYddUDzF0=',NULL,0,'BP5','','','',0,1,'2019-12-23 12:32:45.649018'),(22,'pbkdf2_sha256$180000$YoCiJtXsloE2$Fd1MB0j1lUAiOJ93dIZluv+3TW5ILd1BLKZy8xj+4GM=',NULL,0,'BP6','','','',0,1,'2019-12-23 12:32:55.594746'),(23,'pbkdf2_sha256$180000$4YPtrrDSz6So$G/sJH4/BpNNJpo11v3E495yPTLjIDQdShYdi9Py5fbU=',NULL,0,'BP7','','','',0,1,'2019-12-23 12:33:04.556017'),(24,'pbkdf2_sha256$180000$2SUtq7EFIW1z$vGxKErF48kHlvMPk3esbiXd13Y3J1dWpsthDb8a0YR4=',NULL,0,'BP8','','','',0,1,'2019-12-23 12:33:24.469056'),(25,'pbkdf2_sha256$180000$bv86IeT5BwQp$O+jYQaBHkESabRhvZJVRjo0D2ASMFjBVCjuyiabC7QE=',NULL,0,'BP9','','','',0,1,'2019-12-23 12:33:33.988603'),(26,'pbkdf2_sha256$180000$m1ebRV3xxelX$c1YdzhWSVGkVPkvHRXg9xVlneLEzXwD0ZBwKYXF1Msw=',NULL,0,'BP10','','','',0,1,'2019-12-23 12:33:44.938963'),(27,'pbkdf2_sha256$180000$HAXhczGXqcD2$/KcjkvBhMcCZ1HOHXOcaUvQ3X3cls/bAcYXYkj/cTkg=',NULL,0,'CP1','','','',0,1,'2019-12-23 12:33:57.636664'),(28,'pbkdf2_sha256$180000$vjd6awyBJunF$wJclB8+oYEqoQuQLeUVvDPqejfgY8xKSVQvtFR+Rno8=',NULL,0,'CP2','','','',0,1,'2019-12-23 12:34:05.563807'),(29,'pbkdf2_sha256$180000$fFkfv5DNk1Ll$mjcn0z1UoHauZ97ff1Scyz3TwSFAk35mBTttqtWEcIk=',NULL,0,'CP3','','','',0,1,'2019-12-23 12:34:12.744803'),(30,'pbkdf2_sha256$180000$BIFliIq7F3Gl$NB2OHQAL4jUP8gP3qlfaTGs+51wtEkDPgxDq9PYJf/4=',NULL,0,'CP4','','','',0,1,'2019-12-23 12:34:20.636232'),(31,'pbkdf2_sha256$180000$fJ25WjESOTPW$KFJG6RS4vQcnWXnMDwpHmgRhlucfrb7VNIfv7c/kirs=',NULL,0,'CP5','','','',0,1,'2019-12-23 12:34:33.060472'),(32,'pbkdf2_sha256$180000$KJsUkWAsYd9j$T0xJs46rt7O+3EZXU6UO2sPrNfx5qgfYyjA8uVnWErM=',NULL,0,'CP6','','','',0,1,'2019-12-23 12:34:46.365514'),(33,'pbkdf2_sha256$180000$TbNjH3uAwBCa$RU3LFZMcf+pisCrY0bvJfV4OOZXKFinu4Ub0Vxrk9bE=',NULL,0,'CP7','','','',0,1,'2019-12-23 12:34:55.303237'),(34,'pbkdf2_sha256$180000$s9peMKBgsvRH$TRTyl/zeyoCpvIwLMOuKnQCNCtJHp2KlUnE57jwlpYw=',NULL,0,'CP8','','','',0,1,'2019-12-23 12:35:04.747822'),(35,'pbkdf2_sha256$180000$gcZDOwe2wo9V$6eNXvpGSFHZiNDoACoJYovVS7MrREoX7DIrBczLGdoQ=',NULL,0,'CP9','','','',0,1,'2019-12-23 12:35:14.203139'),(36,'pbkdf2_sha256$180000$5oZNzBmeygZ5$xEOqUZnOXJdYyPqGYzAVh6fERAjTU2gf/e2hBRFlvt0=',NULL,0,'CP10','','','',0,1,'2019-12-23 12:35:22.724783'),(37,'pbkdf2_sha256$180000$VGqPN6cTGanE$qceB5WzMzvsMLIMDwzuj0sqPS3/tnbHb7y7NhH/MIlA=',NULL,0,'DP1','','','',0,1,'2019-12-23 12:36:52.836250'),(38,'pbkdf2_sha256$180000$wRHThPaFlsV6$t4FVhHbAN/PgV/lxO341D9OZsmclzkFgmnpsLPNPfec=',NULL,0,'DP2','','','',0,1,'2019-12-23 12:37:01.248104'),(39,'pbkdf2_sha256$180000$imtnn4yN6Xpf$/TgH7+tC7K9L2ozicbK6ZnV0zvOxJ0jQOQb95a/NT/8=',NULL,0,'DP3','','','',0,1,'2019-12-23 12:37:08.732668'),(40,'pbkdf2_sha256$180000$tewchg5Ohdpj$5gpyMFSL2LBqy2IM7fOCkoLgD1tS35hMOG4JpbE16HA=',NULL,0,'DP4','','','',0,1,'2019-12-23 12:37:17.073180'),(41,'pbkdf2_sha256$180000$I4eMQqKozMUJ$FXGiDnYfJ7R+822fJM2LiepPp1PGrIhNYEf6tsRwgl0=',NULL,0,'DP5','','','',0,1,'2019-12-23 12:37:25.510506'),(42,'pbkdf2_sha256$180000$m3VHwabgfEkz$wUp+wr4xr174WpMDnvaZLDjA+epraVh/Fi3A3RsSurY=',NULL,0,'DP6','','','',0,1,'2019-12-23 12:37:34.130667'),(43,'pbkdf2_sha256$180000$N0ywcAyz4OP0$xCJtTiC4rWHqFxj2iXXqFR4wKsrHyoQSzz0uAn6sUWc=',NULL,0,'DP7','','','',0,1,'2019-12-23 12:37:43.690689'),(44,'pbkdf2_sha256$180000$Oacj5YRZpxYt$yqdZ3jRPRFDZXQEDCChai58b7GoKef8qkGn8vluslkI=',NULL,0,'DP8','','','',0,1,'2019-12-23 12:37:52.966662'),(45,'pbkdf2_sha256$180000$zVD7iv6neL4D$izCGTOZXEG6TM40tMz9P5oG8KUJkh773Hl4dFKD9IKA=',NULL,0,'DP9','','','',0,1,'2019-12-23 12:38:02.218924'),(46,'pbkdf2_sha256$180000$OKbsqRMnP053$WHGQeJ1fd/NxOxbjIlzBXQ6NZVrc1kS3Rb+q8Kc3O1U=',NULL,0,'DP10','','','',0,1,'2019-12-23 12:38:11.012078'),(47,'pbkdf2_sha256$180000$nYcVYMeMqiSq$8+6krh/Mx9YXojDfKr4jhb7FPZAy5d62wV0CyVW3eHA=',NULL,0,'EP1','','','',0,1,'2019-12-23 12:38:23.102771'),(48,'pbkdf2_sha256$180000$YOHX0sNDRSAL$T+s+BvMmcAk1fN2LPt634jOURXoCwI+/4DvAQP/SOUQ=',NULL,0,'EP2','','','',0,1,'2019-12-23 12:38:31.219772'),(49,'pbkdf2_sha256$180000$5e5nJEdOTSa6$qlZ+ZvsoywPRlOQnN7U5gXyJRGs3a0924ERMyckO4mw=',NULL,0,'EP3','','','',0,1,'2019-12-23 12:38:43.635010'),(50,'pbkdf2_sha256$180000$4jO8RdHP6A7w$Nr+w7NZfyoA0NBO1Yk+3HUvOICelx+KFpCE+FQJQPJ8=',NULL,0,'EP4','','','',0,1,'2019-12-23 12:38:52.280710'),(51,'pbkdf2_sha256$180000$kOlvCBDI3eWD$JNnF+5KShhpCbSxidIeazCxhD0vlQpya8Y2bSYo7zjw=',NULL,0,'EP5','','','',0,1,'2019-12-23 12:39:09.270099'),(52,'pbkdf2_sha256$180000$tdKfnnHHIbY3$mUNMQCKjWzddO6/8PRs0smfp22QazVYwdM7xdZpvb+g=',NULL,0,'EP6','','','',0,1,'2019-12-23 12:39:17.186309'),(53,'pbkdf2_sha256$180000$aKtbPp1IT6wl$gBzS3pWkD13LagmpvzQleHaoHnjS0d2/P7ucmJ9x7tQ=',NULL,0,'EP7','','','',0,1,'2019-12-23 12:39:24.844474'),(54,'pbkdf2_sha256$180000$U6iyKPi2CT6u$t+LflRB3v0gvHn8QmVu99UxvuDHHCk8QRpo2x1cDKk8=',NULL,0,'EP8','','','',0,1,'2019-12-23 12:39:36.751521'),(55,'pbkdf2_sha256$180000$q1eByioTem79$eq2J5G064k8F2URtR1fV8nQK0WHdGv5B/UYFyIveh88=',NULL,0,'EP9','','','',0,1,'2019-12-23 12:39:46.633036'),(56,'pbkdf2_sha256$180000$hiSWQD6nbnJR$coL6xDs8fv7u7pe8YRVpb22IMQEMcyX5tUxF0o5z1ks=',NULL,0,'EP10','','','',0,1,'2019-12-23 12:39:56.566566'),(57,'pbkdf2_sha256$180000$6YKJTlwJkN0n$i4+/Q2QTnCJo9jxhOfeAR3spTRpTETwUxY9yq3kogx0=',NULL,0,'FP1','','','',0,1,'2019-12-23 12:40:10.920513'),(58,'pbkdf2_sha256$180000$DqxzSSpmV9ju$W5y+B0TDFS+Q07JVpk1Savlp93L80GZamoRVXQ04z74=',NULL,0,'FP2','','','',0,1,'2019-12-23 12:40:19.309807'),(59,'pbkdf2_sha256$180000$91G40m2tJk5v$ViMD8I5buWPb28cg/5r5wkAEjZODzFLnHnoyRzPCLBE=',NULL,0,'FP3','','','',0,1,'2019-12-23 12:40:28.681780'),(60,'pbkdf2_sha256$180000$tIuclzuacHOQ$iTdtjn7g4fsBFJT2aVk9QaYK+/4KeBAVUH/03SZVYKw=',NULL,0,'FP4','','','',0,1,'2019-12-23 12:40:36.090977'),(61,'pbkdf2_sha256$180000$NxctUQigu7or$pnDAJexUOJ3AVX5/bfm+iHV9/MRVabydBPbuRH+4a6c=',NULL,0,'FP5','','','',0,1,'2019-12-23 12:40:46.249189'),(62,'pbkdf2_sha256$180000$Hrg1BAuHSisC$3AnAykD5EIXRvZaLOL7p5B1nbYpUgoFcQp68iz5n470=',NULL,0,'FP6','','','',0,1,'2019-12-23 12:40:57.050463'),(63,'pbkdf2_sha256$180000$cVBx6bPnoC7A$SUdbQjkOBKSf+BoSPZ4kx5uDKPDziFp7nmX5QuTDOhI=',NULL,0,'FP7','','','',0,1,'2019-12-23 12:41:47.339279'),(64,'pbkdf2_sha256$180000$Be4LEZRdNLAz$1suGvDjI+r5UfIED4d7Sx8dpXF5+7xDFA/Z1l7r4M+M=',NULL,0,'FP8','','','',0,1,'2019-12-23 12:41:56.764080'),(65,'pbkdf2_sha256$180000$yTvoZh0zzQ3l$Sd/n8a9J06dmKhYqh84ZHWq1n5htBB0YXoWViiJAU+E=',NULL,0,'FP9','','','',0,1,'2019-12-23 12:42:05.469950'),(66,'pbkdf2_sha256$180000$6pztIT2KmabA$ntcKKydc7AVd69gxHZC06XgyJO1NIcOtbT4PCXI3zBg=',NULL,0,'FP10','','','',0,1,'2019-12-23 12:42:15.809355'),(67,'pbkdf2_sha256$180000$D2qtk5F9ycNT$qObCHoV3Qv/G8qv0IVjAr7Us6MLuT8KzTuIC6VEzvUo=',NULL,0,'GP1','','','',0,1,'2019-12-23 12:42:30.662985'),(68,'pbkdf2_sha256$180000$94q25joAE8Nv$jvHiv651CkQy32XWyBBuzY89IjumbNTyZ1EEPMEGg1k=',NULL,0,'GP2','','','',0,1,'2019-12-23 12:42:38.231364'),(69,'pbkdf2_sha256$180000$OsJqZgY0S4Gv$1bIlcVt9f1dd4FDeUH+WHv4uQcNWEJN09Oe7OIBgtd0=',NULL,0,'GP3','','','',0,1,'2019-12-23 12:42:46.959353'),(70,'pbkdf2_sha256$180000$1YXuFiJQrg8A$jL9VRb1m+PvRMwn3mlyDswGGNdhMC0Wy0WSqYO4DCKQ=',NULL,0,'GP4','','','',0,1,'2019-12-23 12:42:55.033326'),(71,'pbkdf2_sha256$180000$CVwlxXp3hWoZ$6XWwXWwBJ50Yeub/NaoKzTHACEZQlfuwNAJNjAfqQvs=',NULL,0,'GP5','','','',0,1,'2019-12-23 12:43:03.455312'),(72,'pbkdf2_sha256$180000$WiAx2ODI1wGf$D26f69h5M270tibyLK+eoW/FhJR47aw6slsm0Cn5pp0=',NULL,0,'GP6','','','',0,1,'2019-12-23 12:43:37.534974'),(73,'pbkdf2_sha256$180000$ZJoNOR2vs2wM$3m4mk3gwufBFWJ6CwrS6T7Ku+YmmXuC62Z3lqpNAPX0=',NULL,0,'GP7','','','',0,1,'2019-12-23 12:43:47.300009'),(74,'pbkdf2_sha256$180000$s8l5Xq2mDpfR$Tdi+0o4GeuSUAay7bRlgHj6HYoqnmA9o9f3+EbBJX3U=',NULL,0,'GP8','','','',0,1,'2019-12-23 12:43:55.711258'),(75,'pbkdf2_sha256$180000$mADKjKTzrKOh$7Bs6ec9iPW5PQifuXMtm+Bmyp3IAeMBrZauZZcTDMcY=',NULL,0,'GP9','','','',0,1,'2019-12-23 12:44:18.269828'),(76,'pbkdf2_sha256$180000$sTq7GXmLVdp6$6GG3Mj+zbCXfgONhx2lTl6uE+e/pTzB/ppKfEkXvXm8=',NULL,0,'GP10','','','',0,1,'2019-12-23 12:44:28.833716'),(77,'pbkdf2_sha256$180000$kaNKgYDJ8J1M$0qpy5VvyeYqpRmbnNpJBk1FqzQXHBcf6ssQj2oj1IZk=',NULL,0,'HP1','','','',0,1,'2019-12-23 12:44:46.844658'),(78,'pbkdf2_sha256$180000$qXhX9iJcE3gO$4mkgT2njXwmgqYMrm6YV2nOhMFtnGXEZedoIRYGr5UU=',NULL,0,'HP2','','','',0,1,'2019-12-23 12:44:57.589287'),(79,'pbkdf2_sha256$180000$w19zWFx1pzYg$6V38A0rgJDq7XjlAbv2NefMghbIUMv8eZ66pF1LulHg=',NULL,0,'HP3','','','',0,1,'2019-12-23 12:45:12.283330'),(80,'pbkdf2_sha256$180000$fbfwmFMxvNvr$SunOzDwONxBmMBlC6nKJgo5mdd0l+U+KnZv6akGZJGU=',NULL,0,'HP4','','','',0,1,'2019-12-23 12:45:20.468446'),(81,'pbkdf2_sha256$180000$I2XGv7xZoR8B$gd4kV/qNg596A0geVvr7nx8Uy9Ic11oimWAFB9UEQJA=',NULL,0,'HP5','','','',0,1,'2019-12-23 12:45:28.688088'),(82,'pbkdf2_sha256$180000$iXRkCcMmoNvx$iyGXfKpvSJCuY136wNC3+f30JVMcetjOQidnA0deTvw=',NULL,0,'HP6','','','',0,1,'2019-12-23 12:45:36.199197'),(83,'pbkdf2_sha256$180000$xrYrzqX2sOeb$oqcK+4kbRdI8v4TDfTc8UVA1nmPXmsXVLH7quGl2NsU=',NULL,0,'HP7','','','',0,1,'2019-12-23 12:45:47.466902'),(84,'pbkdf2_sha256$180000$AjjdTdA11kFc$I8QDPxKMlT9v5OqVqzicsYmNgrp299koZ7GqQBwM0B8=',NULL,0,'HP8','','','',0,1,'2019-12-23 12:45:59.427773'),(85,'pbkdf2_sha256$180000$X9qzbC4fJILO$TfvdMSlrGCaBFIcL7vqMQ46B5LAAD+pn25VmlJJSaUg=',NULL,0,'HP9','','','',0,1,'2019-12-23 12:46:08.191367'),(86,'pbkdf2_sha256$180000$zf06fyIY4VzZ$hKXRsage0+o4yIswn5JsU0xPpQ9nlxUZRLYyHAAowFY=',NULL,0,'HP10','','','',0,1,'2019-12-23 12:46:21.569653'),(87,'pbkdf2_sha256$180000$3VTJfKQvZvA3$kjh5/qbmNCzMzru0L5UWhvDc2sHqhzw/pIxJNdbvACc=',NULL,0,'IP1','','','',0,1,'2019-12-23 12:46:44.606662'),(88,'pbkdf2_sha256$180000$kJvifU1E296U$PFyO2aqMgmMAJsfd/avJCWJ5yKeHJmXn94RN29vjeeU=',NULL,0,'IP2','','','',0,1,'2019-12-23 12:46:53.125084'),(89,'pbkdf2_sha256$180000$xipgIaTXyFjr$UsoKQTzaWc2Lkmw5esE5cvKv1MHwzRzQ0H7r1czXccE=',NULL,0,'IP3','','','',0,1,'2019-12-23 12:47:05.209742'),(90,'pbkdf2_sha256$180000$T1FwLBASYc2g$NSY5mtew3PD0SGYIXbeT6IKDrrhYLokLVB6OUSnJU14=',NULL,0,'IP4','','','',0,1,'2019-12-23 12:47:12.854923'),(91,'pbkdf2_sha256$180000$t1OmBbmBoO9b$Ef5G3FiCmXHbydkzaeNqdVhF/IgMY9pCotU5/B4rkRY=',NULL,0,'IP5','','','',0,1,'2019-12-23 12:47:37.369481'),(92,'pbkdf2_sha256$180000$BdnJOHfzIgDJ$H4RJQWhQ94mhIN/P0hxXOVW8pcpcoBXF7CR8mQG7H5Q=',NULL,0,'IP6','','','',0,1,'2019-12-23 12:47:46.625143'),(93,'pbkdf2_sha256$180000$QKQY203tfmgv$ceRIZigYmIlj9KbGsAghcbBdqCNn8LBVMo8fPQTscu0=',NULL,0,'IP7','','','',0,1,'2019-12-23 12:47:55.907716'),(94,'pbkdf2_sha256$180000$uZuAIv8QsFTW$1bYWHlOYCnx9K9xoJU7i767kJaUIiedIZDE+QqOtuPY=',NULL,0,'IP8','','','',0,1,'2019-12-23 12:48:06.332084'),(95,'pbkdf2_sha256$180000$y7S5vv7cCzIQ$HlNU5euC2+qk6KDopvXMSc6nemp+7qecz6DFO+Yy9oQ=',NULL,0,'IP9','','','',0,1,'2019-12-23 12:48:14.675286'),(96,'pbkdf2_sha256$180000$hsZxZ7TrL9Go$KAayRdF+j86mZ83gGZmDORrZr9q8vu83SNLs30CbGO0=',NULL,0,'IP10','','','',0,1,'2019-12-23 12:48:22.811301'),(97,'pbkdf2_sha256$180000$WcC9S0hAzjdw$Ujmka+eaOegVFT3wr9nwTWxiNGDWwwSyGxeUt2Zm4Z8=',NULL,0,'JP1','','','',0,1,'2019-12-23 12:49:38.911747'),(98,'pbkdf2_sha256$180000$n79FH9QO73k1$3B7k+KzOKuY8RAHe6jOUWKfwSDFwPJgui/Vb6AjuGvQ=',NULL,0,'JP2','','','',0,1,'2019-12-23 12:49:47.528200'),(99,'pbkdf2_sha256$180000$3ODicWlZ6UuR$o7s4DfeuK1EQ13qGsnV22v+9xQlWKieargxS1VS2/X0=',NULL,0,'JP3','','','',0,1,'2019-12-23 12:49:57.511693'),(100,'pbkdf2_sha256$180000$TX6zlx5RaIk9$Zey3QsERKvOVm/q68c539csQCikwBZW85cZhodNQvRo=',NULL,0,'JP4','','','',0,1,'2019-12-23 12:50:05.230496'),(101,'pbkdf2_sha256$180000$omJgu98csKoU$7paN7tYleHYPlXHPsC9Nrghr3xvXFh21j1i9W6hhGOM=',NULL,0,'JP5','','','',0,1,'2019-12-23 12:50:15.058047'),(102,'pbkdf2_sha256$180000$xKS8mYwOl0l9$04CRQmt+Llgn64VqkCJ4Al0nLTohv2g3IcmnPFVbAN8=',NULL,0,'JP6','','','',0,1,'2019-12-23 12:50:26.214526'),(103,'pbkdf2_sha256$180000$31rjl6nj4Fk3$IRcFtUmJHwqU2R173v2WBrV81kAIWvi4j7tmhyToIsA=',NULL,0,'JP7','','','',0,1,'2019-12-23 12:50:33.725083'),(104,'pbkdf2_sha256$180000$PUGXEzqlxonN$9+5PfVBWRqFg6fPlK6giMlFE/XNRLmyWLdThvSK/g2s=',NULL,0,'JP8','','','',0,1,'2019-12-23 12:51:15.216146'),(105,'pbkdf2_sha256$180000$Gz6oiZMx94k4$KdDDe4GNhT1qc/VSS2euNLBCLfAD2qIRgMx6NfzbD2M=',NULL,0,'JP9','','','',0,1,'2019-12-23 12:51:23.947501'),(106,'pbkdf2_sha256$180000$itewIMmx4hSb$EIN72ikMMxmae9TQgp8fQZfki5Mht8K3bpH8LHmbSCk=',NULL,0,'JP10','','','',0,1,'2019-12-23 12:51:32.334480'),(107,'pbkdf2_sha256$180000$vDz9WcMWe3dD$WH7M8evLKG9cmeNvyLuotT2DT1FuOjN6TMIDkvxmyv8=',NULL,0,'KP1','','','',0,1,'2019-12-23 12:51:47.516101'),(108,'pbkdf2_sha256$180000$OaXjsNFLv3sj$3geLGbNhCtRJrYWO3+jXSSpqhYQjtTfotmTRPcqaRuU=',NULL,0,'KP2','','','',0,1,'2019-12-23 12:51:54.550278'),(109,'pbkdf2_sha256$180000$n2tCuSOi82Jg$NMkVFDRxb6fNYI9ZybOgJtkXLq/EGsC2EsAAd6zYn7w=',NULL,0,'KP3','','','',0,1,'2019-12-23 12:52:02.152515'),(110,'pbkdf2_sha256$180000$DwUIoRN6SFEV$+dUT4/23Mub4K9wz0WYBc/7Fq3TWqkf10pDYeRiOVNw=',NULL,0,'KP4','','','',0,1,'2019-12-23 12:52:10.017979'),(111,'pbkdf2_sha256$180000$0GZJoYT9ywe8$eqwt1XQCGc3FxaecpnSD7eoqdB3h0gTu+SHWqzW3QgM=',NULL,0,'KP5','','','',0,1,'2019-12-23 12:52:18.485646'),(112,'pbkdf2_sha256$180000$ruWokzzP9GpS$TBFPItT3pAg5kopaJIvowk+8OdkNAYJGTpLYcX33xrI=',NULL,0,'KP6','','','',0,1,'2019-12-23 12:52:26.766854'),(113,'pbkdf2_sha256$180000$bvfAUiLsf1gy$6uOi4P4Y0cxx7aq3wE7ZC1oyglteqQC0YiH2/QfZ5C4=',NULL,0,'KP7','','','',0,1,'2019-12-23 12:52:34.482758'),(114,'pbkdf2_sha256$180000$VzRhDNEIJRdC$fJC49nHwiiAfE8HoQ2msDhR9G4DvZTGwrleCbLQFL4A=',NULL,0,'KP8','','','',0,1,'2019-12-23 12:52:44.372239'),(115,'pbkdf2_sha256$180000$pUXJGCzqK3pv$goQ3AB/3osjPe+k5he7wjf8C1bOnI3vrB9j4YmLExms=',NULL,0,'KP9','','','',0,1,'2019-12-23 12:52:53.345793'),(116,'pbkdf2_sha256$180000$T0PajjxaVVS1$jrWsIQAq5zo2dbTm73ps2qfCgDz2dUp56R14JyTMYY0=',NULL,0,'KP10','','','',0,1,'2019-12-23 12:53:02.611686'),(117,'pbkdf2_sha256$180000$xDEwkXonGLOw$vLbGrWLc8G/YtbWF9/mqzSOaJsaGxBeRx+39PhOkLuc=',NULL,0,'LP1','','','',0,1,'2019-12-23 12:53:15.886031'),(118,'pbkdf2_sha256$180000$uKzHaPVCHMUQ$iEjU/EtXaTRobkgPKEyjI73C8BL/UqUsayHUU9et0Hs=',NULL,0,'LP2','','','',0,1,'2019-12-23 12:53:23.784651'),(119,'pbkdf2_sha256$180000$ziPsT5qGaEq5$sfF+BDnij9oILGua5QWCgU6gD1skoGXCHxFaaJh6Hco=',NULL,0,'LP3','','','',0,1,'2019-12-23 12:53:31.258971'),(120,'pbkdf2_sha256$180000$tLBiei1VjTtS$UwVmkqnEXWuIcITdJc6beEYyUyM4ogSodrK4oQSkVGw=',NULL,0,'LP4','','','',0,1,'2019-12-23 12:53:39.732007'),(121,'pbkdf2_sha256$180000$BLgwQ0TjR2Ao$3UL6Sd+8t3vLhujRQFF5sWgGnM2j4bMnHWo1jSSMD9Y=',NULL,0,'LP5','','','',0,1,'2019-12-23 12:53:50.510475'),(122,'pbkdf2_sha256$180000$S2kM8Lzusldr$Hx1qd1t7NUqXfe3u+7iuyrHDFfMrXlWhn6Qt/GqNu3o=',NULL,0,'LP6','','','',0,1,'2019-12-23 12:53:59.792207'),(123,'pbkdf2_sha256$180000$m8mGOKOd5Fga$m2yQFs6Ho3ddAh5UyWa1ymZDdDyOLFdI053DnAjXH/w=',NULL,0,'LP7','','','',0,1,'2019-12-23 12:54:09.484635'),(124,'pbkdf2_sha256$180000$7AJVK3E06euQ$EhiYqNXlpL/MqtAFZAmw9p8lDo8Y73wERihOOdIQzHA=',NULL,0,'LP8','','','',0,1,'2019-12-23 12:54:19.246313'),(125,'pbkdf2_sha256$180000$9ong6UxDy4vl$yKHBdO5p+kc+J70NOL5tMKa4g7xLSK36cLx6PXLo5O8=',NULL,0,'LP9','','','',0,1,'2019-12-23 12:54:27.948876'),(126,'pbkdf2_sha256$180000$5lrYKOolIrbu$WZfr+ZKeMzlA9v0H49j3c03XoCt0oDqEj62dFHmxllU=',NULL,0,'LP10','','','',0,1,'2019-12-23 12:54:38.195485'),(127,'pbkdf2_sha256$180000$Pvfg03upOqHx$MX26xzzaxWfR14fZmp0JTR/WysXpu0u9iEMHpzErGCI=',NULL,0,'MP1','','','',0,1,'2019-12-23 12:54:51.725926'),(128,'pbkdf2_sha256$180000$t42pD05KkWVd$RFn+htMXpQSmThZ9nZ/gg4faM5oWGIjgf3dNIowlXUg=',NULL,0,'MP2','','','',0,1,'2019-12-23 12:54:59.370725'),(129,'pbkdf2_sha256$180000$xcbGVpSiHkfQ$pWvi681yZ2KjNTmoQs7WhWeLidgOQKhmWC/XyzjX3VY=',NULL,0,'MP3','','','',0,1,'2019-12-23 12:55:06.872261'),(130,'pbkdf2_sha256$180000$GSccdYjY9bpH$393s+MekptNP/f+0ds+NSuSygsGBqd03LfVNOSm0sHI=',NULL,0,'MP4','','','',0,1,'2019-12-23 12:55:14.701945'),(131,'pbkdf2_sha256$180000$0I2zEQPuzgmZ$urywA1xDYuj7ARWQ4AH8P6pZaIY0QREVSo9h7WgKckA=',NULL,0,'MP5','','','',0,1,'2019-12-23 12:55:23.101620'),(132,'pbkdf2_sha256$180000$B9eCuE5Jcxb9$Wbf2lZvL7fPYHz5bO+eCZGVxkQV6FRxT4CdX2jSnINI=',NULL,0,'MP6','','','',0,1,'2019-12-23 12:55:35.330553'),(133,'pbkdf2_sha256$180000$uVSAkIHYX2uA$GVq713VYuPX4cSPDR1j3FMmAon9vDVyebJp9S/BYZ+U=',NULL,0,'MP7','','','',0,1,'2019-12-23 12:55:43.694605'),(134,'pbkdf2_sha256$180000$INbVjcN1ryZI$jGMi1iP4zlLGQAIXEUcKfY+0HqED7bc1js+FbRr3/n8=',NULL,0,'MP8','','','',0,1,'2019-12-23 12:55:51.484915'),(135,'pbkdf2_sha256$180000$FVwirOr2oaox$GkYBHd5FCkopfKb7wLg5ilqzsYmWZy8tguR4/JbTMUI=',NULL,0,'MP9','','','',0,1,'2019-12-23 12:55:59.431130'),(136,'pbkdf2_sha256$180000$gLlxWXWFfScR$GuaS7h3FK/GfJRdTencMbAXLwW8o5OAxeJ3A7WbhJYs=',NULL,0,'MP10','','','',0,1,'2019-12-23 12:56:09.131121'),(137,'pbkdf2_sha256$180000$ADdkLsA1SgsO$0P90CbsMISSMNCK0LhxPrDIZbRqys0D+wGcb56BGdzY=',NULL,0,'NP1','','','',0,1,'2019-12-23 12:56:20.286812'),(138,'pbkdf2_sha256$180000$GVY4nu6TqdIr$hjmdRW2ycSSDD4Ifu1Nhr4HXr2mhlrqJqzY0HO4mg2w=',NULL,0,'NP2','','','',0,1,'2019-12-23 12:56:28.091173'),(139,'pbkdf2_sha256$180000$UuSgCUuXzjuI$0W8RyHkf9zNyIsFM+ZZnXgw+rNreLzQOtrS2XCcx1p0=',NULL,0,'NP3','','','',0,1,'2019-12-23 12:56:36.270284'),(140,'pbkdf2_sha256$180000$GL4aahjFFSLJ$jRXhKl+nKUqqUr48+T0LOkKO0P8NKhFi7Ye9a/gLgLg=',NULL,0,'NP4','','','',0,1,'2019-12-23 12:56:44.665627'),(141,'pbkdf2_sha256$180000$8FofU0y5Mn81$j6fS6OGIOesD3yTyI8rDojTXKbIT5HdDfUXz2sOhe4A=',NULL,0,'NP5','','','',0,1,'2019-12-23 12:56:52.999704'),(142,'pbkdf2_sha256$180000$YQLDthFf6xZN$CMYHLMBaqqILGhPXscHtHDXcgPsnLQBKhvGk9pXy5qE=',NULL,0,'NP6','','','',0,1,'2019-12-23 12:57:01.451891'),(143,'pbkdf2_sha256$180000$KnIMDyrVjbTh$BU51VVW7aLkzDza5vQHZAzBDSnBlOrf+F1jG9+N+5/E=',NULL,0,'NP7','','','',0,1,'2019-12-23 12:57:09.631868'),(144,'pbkdf2_sha256$180000$yZG647QmYl87$WOqiI2nhLC3kIoGSw7ZRqLg+TtN5nGS5jkZRzmLs8Vo=',NULL,0,'NP8','','','',0,1,'2019-12-23 12:57:17.938861'),(145,'pbkdf2_sha256$180000$RFKSWJCFDSno$QUlVsNpWfhaJmxPIKH6+JEj6qnUv66J091kLSZoFYqM=',NULL,0,'NP9','','','',0,1,'2019-12-23 12:57:27.119898'),(146,'pbkdf2_sha256$180000$V6yYuBgpdzjK$SUzP5fiZsRO9w43tDo8coMNCcq6gXf/P8BtXUHe4HYg=',NULL,0,'NP10','','','',0,1,'2019-12-23 12:57:35.795710'),(147,'pbkdf2_sha256$180000$vOLJ5TsVRptb$R8h++l/3tnWDZYcfwxEO0WL79sGZExbjmjJSEQLIojY=',NULL,0,'OP1','','','',0,1,'2019-12-23 12:57:47.350030'),(148,'pbkdf2_sha256$180000$NEB2WbksIg0x$8Z9i/p8djHc2pzxFEjF/n7w++/gjzSE7iP5UHxWh5Y8=',NULL,0,'OP2','','','',0,1,'2019-12-23 12:57:54.436474'),(149,'pbkdf2_sha256$180000$sO5B6gNh6Yvu$pOskaRcdlmmawrdOHR9dKMoWV4dPlWfC6rUBh7DBib4=',NULL,0,'OP3','','','',0,1,'2019-12-23 12:58:06.810485'),(150,'pbkdf2_sha256$180000$L6hQN4qSFpPT$F9wOAYjls3N8ObKSGzAl1f+kSzzIswLoUwvqAkiutwU=',NULL,0,'OP4','','','',0,1,'2019-12-23 12:58:15.805421'),(151,'pbkdf2_sha256$180000$T8MR92z2JUgi$6kUK/ehDHpaZNet/6NKQdr0mH058j9vqYikmQyw2wMo=',NULL,0,'OP5','','','',0,1,'2019-12-23 12:58:23.190964'),(152,'pbkdf2_sha256$180000$35DgZJNjZPo0$O0LwDwgGk/C7UAUXq/LvSi+zQKEf5PuLgZh/Q/qmS+I=',NULL,0,'OP6','','','',0,1,'2019-12-23 12:58:30.804686'),(153,'pbkdf2_sha256$180000$rZKZRJ0YqOv4$C13/mxWJOJUHQSycjomPPgsPsIaUepl80gl0K0srtFw=',NULL,0,'OP7','','','',0,1,'2019-12-23 12:58:38.482365'),(154,'pbkdf2_sha256$180000$p7OIerZYXXlU$+tgyshJjc76eL3axmsgdcAOdbrFOaHiphqjGHxKPvPY=',NULL,0,'OP8','','','',0,1,'2019-12-23 12:58:49.412181'),(155,'pbkdf2_sha256$180000$1k17LjDFeSU7$9Y/2wLCDSdhuPuPwDD8oVwim5tYic1RYLN1Ayd+K/zM=',NULL,0,'OP9','','','',0,1,'2019-12-23 12:58:57.473571'),(156,'pbkdf2_sha256$180000$dGg4wjAbmsyv$0uuFLHq45tIRyinlcROKDdeVQP/v1OPm5Q1xzbAVDiE=',NULL,0,'OP10','','','',0,1,'2019-12-23 12:59:05.075374'),(157,'pbkdf2_sha256$180000$3LcHPBcVi60y$IxGdTvu5QaRoPR+A3RwfstRxBbE99zgeFZw8dlqzbCw=',NULL,0,'PP1','','','',0,1,'2019-12-23 12:59:17.031286'),(158,'pbkdf2_sha256$180000$75fm9FWOIws2$szIMHPf8+u7JPzYpOSovtKaoo6AcbBh1VjfPtClLv5s=',NULL,0,'PP2','','','',0,1,'2019-12-23 12:59:24.086075'),(159,'pbkdf2_sha256$180000$xZQ2igxr3egs$u6yymRVxbWUItTbBZTY5HtW178B57b/v56RyF/X3Uvc=',NULL,0,'PP3','','','',0,1,'2019-12-23 12:59:32.830598'),(160,'pbkdf2_sha256$180000$9djE5O7G4KvW$xPTOZQrsHCFbn0O7K/cwoxATw0NJMe2iow/by43PBAU=',NULL,0,'PP4','','','',0,1,'2019-12-23 12:59:41.825915'),(161,'pbkdf2_sha256$180000$GnN2GL5hQ9jm$H1SdmchjqyDqeQdGncDWunnqkB+1kxrakmEAn5Cddvs=',NULL,0,'PP5','','','',0,1,'2019-12-23 12:59:49.750078'),(162,'pbkdf2_sha256$180000$MoiyGDbWb1Rx$SiZiHrF00tJV6ww8syUUKVPMfWX2khI1S2NTkbH+9X4=',NULL,0,'PP6','','','',0,1,'2019-12-23 12:59:58.124867'),(163,'pbkdf2_sha256$180000$dtUd9Vd8S76I$w3YY2ztt6gXrCGm+VDUNlRguH0NKlWMiAWHNS6xkg94=',NULL,0,'PP7','','','',0,1,'2019-12-23 13:00:06.813840'),(164,'pbkdf2_sha256$180000$TSllxwRlSwf0$l+fAW9HaE1nvx2pv4cEpLiIOQShgOLE6kS5No1SLzMo=',NULL,0,'PP8','','','',0,1,'2019-12-23 13:00:14.764571'),(165,'pbkdf2_sha256$180000$2TnVVuYwNmzu$B0yqUR9dzBijOImto4O+l4SygNH3ZYIbibVcRsN+FFc=',NULL,0,'PP9','','','',0,1,'2019-12-23 13:00:22.717089'),(166,'pbkdf2_sha256$180000$PlS1l0bv6mmq$AcoW7HHgykFIbtc+mQQPi8/q8KgdRNU74MydMcWv7X8=',NULL,0,'PP10','','','',0,1,'2019-12-23 13:00:30.953575'),(167,'pbkdf2_sha256$180000$hnmRb9CEgoci$qxTmgVVjfAQzsmxQuujZv1mnAXPbsbM42Imc5qex5vI=',NULL,0,'AS1','','','',0,1,'2019-12-23 13:01:28.965568'),(168,'pbkdf2_sha256$180000$9kFNVujWtq8i$Nm6FcZu0mpj3PnSjkwAxvA1hqVGgBDC+WHVFoTG3Dwk=',NULL,0,'BS1','','','',0,1,'2019-12-23 13:01:39.691171'),(169,'pbkdf2_sha256$180000$a5CMYzAGFJVv$xfHNvMSQ0r3PDA3ZXnyxOTzPOxJNbUlBeJswAdoWcXo=',NULL,0,'CS1','','','',0,1,'2019-12-23 13:01:47.097629'),(170,'pbkdf2_sha256$180000$vz8VF0N0eZfc$LsyBDdpl6qm/rDyRToCQUnPj5gAXbHD9tkmaMMp7uo8=',NULL,0,'DS1','','','',0,1,'2019-12-23 13:01:56.865324'),(171,'pbkdf2_sha256$180000$1qyANKSNBm93$Ib44tynHxE37TS+0Kvqi3uPjZXkdKL2CoL2R3AQcPkU=',NULL,0,'ES1','','','',0,1,'2019-12-23 13:02:28.350996'),(172,'pbkdf2_sha256$180000$uEgiCPK29B68$Kj6BCpJrmQgtMDYIDm2SMgPiUmx9W50TJrifoZ7tLBs=',NULL,0,'FS1','','','',0,1,'2019-12-23 13:02:37.920371'),(173,'pbkdf2_sha256$180000$IeKqBRrHb9JH$NWs+PWGxiC9+FuZ5lF2aTECxZ6AT5o8kN9NADfBkYlU=',NULL,0,'GS1','','','',0,1,'2019-12-23 13:02:47.591556'),(174,'pbkdf2_sha256$180000$NndTtXA0dX6x$L9i0UjL3X9JUPR4wswUd5llo8WcBGpt82gwa891VWA0=',NULL,0,'HS1','','','',0,1,'2019-12-23 13:02:58.751596'),(175,'pbkdf2_sha256$180000$AxvrGuVFQoTy$7T6RSXjknyKTvedopq4FQl14y2Eq4/+Yf1bE6q2m4Tg=',NULL,0,'IS1','','','',0,1,'2019-12-23 13:04:37.545408'),(176,'pbkdf2_sha256$180000$SMhAAQrBsPr9$ZV1ojoLN3+WfZzhbYz6HSMbd5JCVlNBSA2bQSzXQdYI=',NULL,0,'JS1','','','',0,1,'2019-12-23 13:04:46.990236'),(177,'pbkdf2_sha256$180000$b04KROjcEgo1$fskSLNsgqkC1e8xFSAtHisarYZHOfCAqPkbVWpi5RCw=',NULL,0,'KS1','','','',0,1,'2019-12-23 13:04:55.946104'),(178,'pbkdf2_sha256$180000$HAiaoe6zRtZK$AI8v7wlVBoqIc8+w5Icu7zZbuISOxZVRDndN5IR9qu8=',NULL,0,'LS1','','','',0,1,'2019-12-23 13:05:09.372012'),(179,'pbkdf2_sha256$180000$EtqL4nfR1xaR$NHKHAwXFrVfo5XCM5EL2tSOR5I2BkRNlJ9Aa7WR4lXo=',NULL,0,'MS1','','','',0,1,'2019-12-23 13:05:18.103420'),(180,'pbkdf2_sha256$180000$k88SyJ8xH5s0$yVlL77iqnqTVzpDdB4M5IjotnNVyVb2CZuwqnagAOsQ=',NULL,0,'NS1','','','',0,1,'2019-12-23 13:05:27.041392'),(181,'pbkdf2_sha256$180000$kbKslDscRBIs$m2xaklCEYmLJBijhk+TkYYCDimWxaXh6GY0mVeYHdpE=',NULL,0,'OS1','','','',0,1,'2019-12-23 13:05:36.869109'),(182,'pbkdf2_sha256$180000$8mtpTWffyOIT$LN9zULK6TV0h7QIifMcz4mRkO1NdTPcwz1C3WIfHB08=',NULL,0,'PS1','','','',0,1,'2019-12-23 13:05:44.381008');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-12-22 12:29:45.343559','1','webapp',1,'[{\"added\": {}}]',7,1),(2,'2019-12-22 16:41:41.178023','2','player1',1,'[{\"added\": {}}]',4,1),(3,'2019-12-22 17:16:41.548021','3','staff1',1,'[{\"added\": {}}]',4,1),(4,'2019-12-23 11:36:49.652877','1','Player object (1)',3,'',13,1),(5,'2019-12-23 11:37:06.045382','3','team 3',3,'',14,1),(6,'2019-12-23 11:37:06.047405','2','Team 2',3,'',14,1),(7,'2019-12-23 11:37:06.050057','1','Team 1',3,'',14,1),(8,'2019-12-23 11:37:34.441037','2','game 2',3,'',12,1),(9,'2019-12-23 11:37:34.444647','1','Game 1',3,'',12,1),(10,'2019-12-23 11:37:49.971852','1','Tournament No: 1',3,'',15,1),(11,'2019-12-23 11:39:31.074720','2','Tournament No: 2',1,'[{\"added\": {}}]',15,1),(12,'2019-12-23 11:44:37.864188','4','TEAM A',1,'[{\"added\": {}}]',14,1),(13,'2019-12-23 12:16:17.956400','5','TEAM B',1,'[{\"added\": {}}]',14,1),(14,'2019-12-23 12:16:59.580024','6','TEAM C',1,'[{\"added\": {}}]',14,1),(15,'2019-12-23 12:17:12.224431','7','TEAM D',1,'[{\"added\": {}}]',14,1),(16,'2019-12-23 12:17:28.454023','8','TEAM E',1,'[{\"added\": {}}]',14,1),(17,'2019-12-23 12:17:54.714979','9','TEAM F',1,'[{\"added\": {}}]',14,1),(18,'2019-12-23 12:18:15.049158','10','TEAM G',1,'[{\"added\": {}}]',14,1),(19,'2019-12-23 12:18:30.095663','11','TEAM H',1,'[{\"added\": {}}]',14,1),(20,'2019-12-23 12:18:44.651525','12','TEAM I',1,'[{\"added\": {}}]',14,1),(21,'2019-12-23 12:19:01.119738','13','TEAM G',1,'[{\"added\": {}}]',14,1),(22,'2019-12-23 12:19:20.705217','14','TEAM K',1,'[{\"added\": {}}]',14,1),(23,'2019-12-23 12:19:46.178805','15','TEAM L',1,'[{\"added\": {}}]',14,1),(24,'2019-12-23 12:20:00.131721','16','TEAM M',1,'[{\"added\": {}}]',14,1),(25,'2019-12-23 12:21:12.430562','17','TEAM N',1,'[{\"added\": {}}]',14,1),(26,'2019-12-23 12:21:43.633769','18','TEAM O',1,'[{\"added\": {}}]',14,1),(27,'2019-12-23 12:22:22.464885','19','TEAM P',1,'[{\"added\": {}}]',14,1),(28,'2019-12-23 12:25:08.245991','2','player1',3,'',4,1),(29,'2019-12-23 12:25:08.248304','3','staff1',3,'',4,1),(30,'2019-12-23 12:25:08.251545','4','staff2',3,'',4,1),(31,'2019-12-23 12:26:44.308180','5','TP1',1,'[{\"added\": {}}]',4,1),(32,'2019-12-23 12:27:13.015413','6','TP2',1,'[{\"added\": {}}]',4,1),(33,'2019-12-23 12:27:30.533988','5','TP1',3,'',4,1),(34,'2019-12-23 12:27:30.537142','6','TP2',3,'',4,1),(35,'2019-12-23 12:28:20.282272','7','AP1',1,'[{\"added\": {}}]',4,1),(36,'2019-12-23 12:28:29.794714','8','AP2',1,'[{\"added\": {}}]',4,1),(37,'2019-12-23 12:28:38.913641','9','AP3',1,'[{\"added\": {}}]',4,1),(38,'2019-12-23 12:28:51.013586','10','AP4',1,'[{\"added\": {}}]',4,1),(39,'2019-12-23 12:29:03.719763','11','AP5',1,'[{\"added\": {}}]',4,1),(40,'2019-12-23 12:29:13.515675','12','AP6',1,'[{\"added\": {}}]',4,1),(41,'2019-12-23 12:29:25.094081','13','AP7',1,'[{\"added\": {}}]',4,1),(42,'2019-12-23 12:29:35.650441','14','AP8',1,'[{\"added\": {}}]',4,1),(43,'2019-12-23 12:30:44.691685','15','AP9',1,'[{\"added\": {}}]',4,1),(44,'2019-12-23 12:30:57.877419','16','AP10',1,'[{\"added\": {}}]',4,1),(45,'2019-12-23 12:31:46.570529','17','BP1',1,'[{\"added\": {}}]',4,1),(46,'2019-12-23 12:31:55.474236','18','BP2',1,'[{\"added\": {}}]',4,1),(47,'2019-12-23 12:32:27.273517','19','BP3',1,'[{\"added\": {}}]',4,1),(48,'2019-12-23 12:32:36.716273','20','BP4',1,'[{\"added\": {}}]',4,1),(49,'2019-12-23 12:32:45.823349','21','BP5',1,'[{\"added\": {}}]',4,1),(50,'2019-12-23 12:32:55.791033','22','BP6',1,'[{\"added\": {}}]',4,1),(51,'2019-12-23 12:33:04.736653','23','BP7',1,'[{\"added\": {}}]',4,1),(52,'2019-12-23 12:33:24.653456','24','BP8',1,'[{\"added\": {}}]',4,1),(53,'2019-12-23 12:33:34.162501','25','BP9',1,'[{\"added\": {}}]',4,1),(54,'2019-12-23 12:33:45.105229','26','BP10',1,'[{\"added\": {}}]',4,1),(55,'2019-12-23 12:33:57.825672','27','CP1',1,'[{\"added\": {}}]',4,1),(56,'2019-12-23 12:34:05.726346','28','CP2',1,'[{\"added\": {}}]',4,1),(57,'2019-12-23 12:34:12.911400','29','CP3',1,'[{\"added\": {}}]',4,1),(58,'2019-12-23 12:34:20.806074','30','CP4',1,'[{\"added\": {}}]',4,1),(59,'2019-12-23 12:34:33.245980','31','CP5',1,'[{\"added\": {}}]',4,1),(60,'2019-12-23 12:34:46.534184','32','CP6',1,'[{\"added\": {}}]',4,1),(61,'2019-12-23 12:34:55.462797','33','CP7',1,'[{\"added\": {}}]',4,1),(62,'2019-12-23 12:35:04.925876','34','CP8',1,'[{\"added\": {}}]',4,1),(63,'2019-12-23 12:35:14.395324','35','CP9',1,'[{\"added\": {}}]',4,1),(64,'2019-12-23 12:35:22.893658','36','CP10',1,'[{\"added\": {}}]',4,1),(65,'2019-12-23 12:36:53.016553','37','DP1',1,'[{\"added\": {}}]',4,1),(66,'2019-12-23 12:37:01.425070','38','DP2',1,'[{\"added\": {}}]',4,1),(67,'2019-12-23 12:37:08.926734','39','DP3',1,'[{\"added\": {}}]',4,1),(68,'2019-12-23 12:37:17.253120','40','DP4',1,'[{\"added\": {}}]',4,1),(69,'2019-12-23 12:37:25.710050','41','DP5',1,'[{\"added\": {}}]',4,1),(70,'2019-12-23 12:37:34.294271','42','DP6',1,'[{\"added\": {}}]',4,1),(71,'2019-12-23 12:37:43.857258','43','DP7',1,'[{\"added\": {}}]',4,1),(72,'2019-12-23 12:37:53.126634','44','DP8',1,'[{\"added\": {}}]',4,1),(73,'2019-12-23 12:38:02.476342','45','DP9',1,'[{\"added\": {}}]',4,1),(74,'2019-12-23 12:38:11.171929','46','DP10',1,'[{\"added\": {}}]',4,1),(75,'2019-12-23 12:38:23.280976','47','EP1',1,'[{\"added\": {}}]',4,1),(76,'2019-12-23 12:38:31.378638','48','EP2',1,'[{\"added\": {}}]',4,1),(77,'2019-12-23 12:38:43.799542','49','EP3',1,'[{\"added\": {}}]',4,1),(78,'2019-12-23 12:38:52.445136','50','EP4',1,'[{\"added\": {}}]',4,1),(79,'2019-12-23 12:39:09.436346','51','EP5',1,'[{\"added\": {}}]',4,1),(80,'2019-12-23 12:39:17.353661','52','EP6',1,'[{\"added\": {}}]',4,1),(81,'2019-12-23 12:39:25.003234','53','EP7',1,'[{\"added\": {}}]',4,1),(82,'2019-12-23 12:39:36.925180','54','EP8',1,'[{\"added\": {}}]',4,1),(83,'2019-12-23 12:39:46.831917','55','EP9',1,'[{\"added\": {}}]',4,1),(84,'2019-12-23 12:39:56.735970','56','EP10',1,'[{\"added\": {}}]',4,1),(85,'2019-12-23 12:40:11.127542','57','FP1',1,'[{\"added\": {}}]',4,1),(86,'2019-12-23 12:40:19.477271','58','FP2',1,'[{\"added\": {}}]',4,1),(87,'2019-12-23 12:40:28.873299','59','FP3',1,'[{\"added\": {}}]',4,1),(88,'2019-12-23 12:40:36.256664','60','FP4',1,'[{\"added\": {}}]',4,1),(89,'2019-12-23 12:40:46.412488','61','FP5',1,'[{\"added\": {}}]',4,1),(90,'2019-12-23 12:40:57.226844','62','FP6',1,'[{\"added\": {}}]',4,1),(91,'2019-12-23 12:41:47.498639','63','FP7',1,'[{\"added\": {}}]',4,1),(92,'2019-12-23 12:41:56.938968','64','FP8',1,'[{\"added\": {}}]',4,1),(93,'2019-12-23 12:42:05.631450','65','FP9',1,'[{\"added\": {}}]',4,1),(94,'2019-12-23 12:42:16.007011','66','FP10',1,'[{\"added\": {}}]',4,1),(95,'2019-12-23 12:42:30.859813','67','GP1',1,'[{\"added\": {}}]',4,1),(96,'2019-12-23 12:42:38.410262','68','GP2',1,'[{\"added\": {}}]',4,1),(97,'2019-12-23 12:42:47.121587','69','GP3',1,'[{\"added\": {}}]',4,1),(98,'2019-12-23 12:42:55.206951','70','GP4',1,'[{\"added\": {}}]',4,1),(99,'2019-12-23 12:43:03.625217','71','GP5',1,'[{\"added\": {}}]',4,1),(100,'2019-12-23 12:43:37.719224','72','GP6',1,'[{\"added\": {}}]',4,1),(101,'2019-12-23 12:43:47.485507','73','GP7',1,'[{\"added\": {}}]',4,1),(102,'2019-12-23 12:43:55.882471','74','GP8',1,'[{\"added\": {}}]',4,1),(103,'2019-12-23 12:44:18.428669','75','GP9',1,'[{\"added\": {}}]',4,1),(104,'2019-12-23 12:44:28.999102','76','GP10',1,'[{\"added\": {}}]',4,1),(105,'2019-12-23 12:44:47.009400','77','HP1',1,'[{\"added\": {}}]',4,1),(106,'2019-12-23 12:44:57.755468','78','HP2',1,'[{\"added\": {}}]',4,1),(107,'2019-12-23 12:45:12.461474','79','HP3',1,'[{\"added\": {}}]',4,1),(108,'2019-12-23 12:45:20.695381','80','HP4',1,'[{\"added\": {}}]',4,1),(109,'2019-12-23 12:45:28.877894','81','HP5',1,'[{\"added\": {}}]',4,1),(110,'2019-12-23 12:45:36.420964','82','HP6',1,'[{\"added\": {}}]',4,1),(111,'2019-12-23 12:45:47.639686','83','HP7',1,'[{\"added\": {}}]',4,1),(112,'2019-12-23 12:45:59.591485','84','HP8',1,'[{\"added\": {}}]',4,1),(113,'2019-12-23 12:46:08.365293','85','HP9',1,'[{\"added\": {}}]',4,1),(114,'2019-12-23 12:46:21.746337','86','HP10',1,'[{\"added\": {}}]',4,1),(115,'2019-12-23 12:46:44.782968','87','IP1',1,'[{\"added\": {}}]',4,1),(116,'2019-12-23 12:46:53.311728','88','IP2',1,'[{\"added\": {}}]',4,1),(117,'2019-12-23 12:47:05.375323','89','IP3',1,'[{\"added\": {}}]',4,1),(118,'2019-12-23 12:47:13.062669','90','IP4',1,'[{\"added\": {}}]',4,1),(119,'2019-12-23 12:47:37.565070','91','IP5',1,'[{\"added\": {}}]',4,1),(120,'2019-12-23 12:47:46.793339','92','IP6',1,'[{\"added\": {}}]',4,1),(121,'2019-12-23 12:47:56.081483','93','IP7',1,'[{\"added\": {}}]',4,1),(122,'2019-12-23 12:48:06.502789','94','IP8',1,'[{\"added\": {}}]',4,1),(123,'2019-12-23 12:48:14.851832','95','IP9',1,'[{\"added\": {}}]',4,1),(124,'2019-12-23 12:48:22.985850','96','IP10',1,'[{\"added\": {}}]',4,1),(125,'2019-12-23 12:49:39.087235','97','JP1',1,'[{\"added\": {}}]',4,1),(126,'2019-12-23 12:49:47.690984','98','JP2',1,'[{\"added\": {}}]',4,1),(127,'2019-12-23 12:49:57.685801','99','JP3',1,'[{\"added\": {}}]',4,1),(128,'2019-12-23 12:50:05.404275','100','JP4',1,'[{\"added\": {}}]',4,1),(129,'2019-12-23 12:50:15.259018','101','JP5',1,'[{\"added\": {}}]',4,1),(130,'2019-12-23 12:50:26.399714','102','JP6',1,'[{\"added\": {}}]',4,1),(131,'2019-12-23 12:50:33.898257','103','JP7',1,'[{\"added\": {}}]',4,1),(132,'2019-12-23 12:51:15.385189','104','JP8',1,'[{\"added\": {}}]',4,1),(133,'2019-12-23 12:51:24.122790','105','JP9',1,'[{\"added\": {}}]',4,1),(134,'2019-12-23 12:51:32.496987','106','JP10',1,'[{\"added\": {}}]',4,1),(135,'2019-12-23 12:51:47.680974','107','KP1',1,'[{\"added\": {}}]',4,1),(136,'2019-12-23 12:51:54.713247','108','KP2',1,'[{\"added\": {}}]',4,1),(137,'2019-12-23 12:52:02.321178','109','KP3',1,'[{\"added\": {}}]',4,1),(138,'2019-12-23 12:52:10.198441','110','KP4',1,'[{\"added\": {}}]',4,1),(139,'2019-12-23 12:52:18.655914','111','KP5',1,'[{\"added\": {}}]',4,1),(140,'2019-12-23 12:52:26.934739','112','KP6',1,'[{\"added\": {}}]',4,1),(141,'2019-12-23 12:52:34.647016','113','KP7',1,'[{\"added\": {}}]',4,1),(142,'2019-12-23 12:52:44.541748','114','KP8',1,'[{\"added\": {}}]',4,1),(143,'2019-12-23 12:52:53.508847','115','KP9',1,'[{\"added\": {}}]',4,1),(144,'2019-12-23 12:53:02.779303','116','KP10',1,'[{\"added\": {}}]',4,1),(145,'2019-12-23 12:53:16.053445','117','LP1',1,'[{\"added\": {}}]',4,1),(146,'2019-12-23 12:53:23.953921','118','LP2',1,'[{\"added\": {}}]',4,1),(147,'2019-12-23 12:53:31.428153','119','LP3',1,'[{\"added\": {}}]',4,1),(148,'2019-12-23 12:53:39.928341','120','LP4',1,'[{\"added\": {}}]',4,1),(149,'2019-12-23 12:53:50.670908','121','LP5',1,'[{\"added\": {}}]',4,1),(150,'2019-12-23 12:53:59.961028','122','LP6',1,'[{\"added\": {}}]',4,1),(151,'2019-12-23 12:54:09.650663','123','LP7',1,'[{\"added\": {}}]',4,1),(152,'2019-12-23 12:54:19.407821','124','LP8',1,'[{\"added\": {}}]',4,1),(153,'2019-12-23 12:54:28.121719','125','LP9',1,'[{\"added\": {}}]',4,1),(154,'2019-12-23 12:54:38.373706','126','LP10',1,'[{\"added\": {}}]',4,1),(155,'2019-12-23 12:54:51.889362','127','MP1',1,'[{\"added\": {}}]',4,1),(156,'2019-12-23 12:54:59.543895','128','MP2',1,'[{\"added\": {}}]',4,1),(157,'2019-12-23 12:55:07.041051','129','MP3',1,'[{\"added\": {}}]',4,1),(158,'2019-12-23 12:55:14.878175','130','MP4',1,'[{\"added\": {}}]',4,1),(159,'2019-12-23 12:55:23.279989','131','MP5',1,'[{\"added\": {}}]',4,1),(160,'2019-12-23 12:55:35.501971','132','MP6',1,'[{\"added\": {}}]',4,1),(161,'2019-12-23 12:55:43.869719','133','MP7',1,'[{\"added\": {}}]',4,1),(162,'2019-12-23 12:55:51.674786','134','MP8',1,'[{\"added\": {}}]',4,1),(163,'2019-12-23 12:55:59.599311','135','MP9',1,'[{\"added\": {}}]',4,1),(164,'2019-12-23 12:56:09.306519','136','MP10',1,'[{\"added\": {}}]',4,1),(165,'2019-12-23 12:56:20.450332','137','NP1',1,'[{\"added\": {}}]',4,1),(166,'2019-12-23 12:56:28.256976','138','NP2',1,'[{\"added\": {}}]',4,1),(167,'2019-12-23 12:56:36.428924','139','NP3',1,'[{\"added\": {}}]',4,1),(168,'2019-12-23 12:56:44.827791','140','NP4',1,'[{\"added\": {}}]',4,1),(169,'2019-12-23 12:56:53.159402','141','NP5',1,'[{\"added\": {}}]',4,1),(170,'2019-12-23 12:57:01.680510','142','NP6',1,'[{\"added\": {}}]',4,1),(171,'2019-12-23 12:57:09.809379','143','NP7',1,'[{\"added\": {}}]',4,1),(172,'2019-12-23 12:57:18.142617','144','NP8',1,'[{\"added\": {}}]',4,1),(173,'2019-12-23 12:57:27.285135','145','NP9',1,'[{\"added\": {}}]',4,1),(174,'2019-12-23 12:57:35.964700','146','NP10',1,'[{\"added\": {}}]',4,1),(175,'2019-12-23 12:57:47.516644','147','OP1',1,'[{\"added\": {}}]',4,1),(176,'2019-12-23 12:57:54.603877','148','OP2',1,'[{\"added\": {}}]',4,1),(177,'2019-12-23 12:58:06.970733','149','OP3',1,'[{\"added\": {}}]',4,1),(178,'2019-12-23 12:58:15.970188','150','OP4',1,'[{\"added\": {}}]',4,1),(179,'2019-12-23 12:58:23.356903','151','OP5',1,'[{\"added\": {}}]',4,1),(180,'2019-12-23 12:58:30.965278','152','OP6',1,'[{\"added\": {}}]',4,1),(181,'2019-12-23 12:58:38.648044','153','OP7',1,'[{\"added\": {}}]',4,1),(182,'2019-12-23 12:58:49.579143','154','OP8',1,'[{\"added\": {}}]',4,1),(183,'2019-12-23 12:58:57.639742','155','OP9',1,'[{\"added\": {}}]',4,1),(184,'2019-12-23 12:59:05.238202','156','OP10',1,'[{\"added\": {}}]',4,1),(185,'2019-12-23 12:59:17.200122','157','PP1',1,'[{\"added\": {}}]',4,1),(186,'2019-12-23 12:59:24.249635','158','PP2',1,'[{\"added\": {}}]',4,1),(187,'2019-12-23 12:59:32.991716','159','PP3',1,'[{\"added\": {}}]',4,1),(188,'2019-12-23 12:59:41.985795','160','PP4',1,'[{\"added\": {}}]',4,1),(189,'2019-12-23 12:59:49.923878','161','PP5',1,'[{\"added\": {}}]',4,1),(190,'2019-12-23 12:59:58.288344','162','PP6',1,'[{\"added\": {}}]',4,1),(191,'2019-12-23 13:00:06.993676','163','PP7',1,'[{\"added\": {}}]',4,1),(192,'2019-12-23 13:00:14.927948','164','PP8',1,'[{\"added\": {}}]',4,1),(193,'2019-12-23 13:00:22.879836','165','PP9',1,'[{\"added\": {}}]',4,1),(194,'2019-12-23 13:00:31.138243','166','PP10',1,'[{\"added\": {}}]',4,1),(195,'2019-12-23 13:01:29.128907','167','AS1',1,'[{\"added\": {}}]',4,1),(196,'2019-12-23 13:01:39.857838','168','BS1',1,'[{\"added\": {}}]',4,1),(197,'2019-12-23 13:01:47.262981','169','CS1',1,'[{\"added\": {}}]',4,1),(198,'2019-12-23 13:01:57.029072','170','DS1',1,'[{\"added\": {}}]',4,1),(199,'2019-12-23 13:02:28.517252','171','ES1',1,'[{\"added\": {}}]',4,1),(200,'2019-12-23 13:02:38.081420','172','FS1',1,'[{\"added\": {}}]',4,1),(201,'2019-12-23 13:02:47.752642','173','GS1',1,'[{\"added\": {}}]',4,1),(202,'2019-12-23 13:02:58.913536','174','HS1',1,'[{\"added\": {}}]',4,1),(203,'2019-12-23 13:04:37.707508','175','IS1',1,'[{\"added\": {}}]',4,1),(204,'2019-12-23 13:04:47.156084','176','JS1',1,'[{\"added\": {}}]',4,1),(205,'2019-12-23 13:04:56.106738','177','KS1',1,'[{\"added\": {}}]',4,1),(206,'2019-12-23 13:05:09.537804','178','LS1',1,'[{\"added\": {}}]',4,1),(207,'2019-12-23 13:05:18.281532','179','MS1',1,'[{\"added\": {}}]',4,1),(208,'2019-12-23 13:05:27.229069','180','NS1',1,'[{\"added\": {}}]',4,1),(209,'2019-12-23 13:05:37.034564','181','OS1',1,'[{\"added\": {}}]',4,1),(210,'2019-12-23 13:05:44.547785','182','PS1',1,'[{\"added\": {}}]',4,1),(211,'2019-12-23 13:07:22.441857','2','Player object (2)',1,'[{\"added\": {}}]',13,1),(212,'2019-12-23 13:08:09.240204','3','Player object (3)',1,'[{\"added\": {}}]',13,1),(213,'2019-12-23 13:08:27.477214','4','Player object (4)',1,'[{\"added\": {}}]',13,1),(214,'2019-12-23 13:08:57.404519','5','Player object (5)',1,'[{\"added\": {}}]',13,1),(215,'2019-12-23 13:09:13.542300','6','Player object (6)',1,'[{\"added\": {}}]',13,1),(216,'2019-12-23 13:09:28.039495','7','Player object (7)',1,'[{\"added\": {}}]',13,1),(217,'2019-12-23 13:09:46.722178','8','Player object (8)',1,'[{\"added\": {}}]',13,1),(218,'2019-12-23 13:10:02.617002','9','Player object (9)',1,'[{\"added\": {}}]',13,1),(219,'2019-12-23 13:10:19.714262','10','Player object (10)',1,'[{\"added\": {}}]',13,1),(220,'2019-12-23 13:10:33.496061','11','Player object (11)',1,'[{\"added\": {}}]',13,1),(221,'2019-12-23 13:10:53.209765','12','Player object (12)',1,'[{\"added\": {}}]',13,1),(222,'2019-12-23 13:11:06.801526','13','Player object (13)',1,'[{\"added\": {}}]',13,1),(223,'2019-12-23 13:11:23.091680','14','Player object (14)',1,'[{\"added\": {}}]',13,1),(224,'2019-12-23 13:11:33.721032','14','Player object (14)',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',13,1),(225,'2019-12-23 13:12:15.418481','15','Player object (15)',1,'[{\"added\": {}}]',13,1),(226,'2019-12-23 13:12:32.512373','16','Player object (16)',1,'[{\"added\": {}}]',13,1),(227,'2019-12-23 13:12:48.688397','17','Player object (17)',1,'[{\"added\": {}}]',13,1),(228,'2019-12-23 13:13:03.676670','18','Player object (18)',1,'[{\"added\": {}}]',13,1),(229,'2019-12-23 13:13:20.210689','19','Player object (19)',1,'[{\"added\": {}}]',13,1),(230,'2019-12-23 13:13:38.171711','20','Player object (20)',1,'[{\"added\": {}}]',13,1),(231,'2019-12-23 13:13:54.660292','21','Player object (21)',1,'[{\"added\": {}}]',13,1),(232,'2019-12-23 13:14:31.386724','22','Player object (22)',1,'[{\"added\": {}}]',13,1),(233,'2019-12-23 13:14:58.019616','23','Player object (23)',1,'[{\"added\": {}}]',13,1),(234,'2019-12-23 13:15:19.166177','24','Player object (24)',1,'[{\"added\": {}}]',13,1),(235,'2019-12-23 13:15:29.329833','24','Player object (24)',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',13,1),(236,'2019-12-23 13:15:53.825585','25','Player object (25)',1,'[{\"added\": {}}]',13,1),(237,'2019-12-23 13:16:18.090531','26','Player object (26)',1,'[{\"added\": {}}]',13,1),(238,'2019-12-23 13:16:37.559077','27','Player object (27)',1,'[{\"added\": {}}]',13,1),(239,'2019-12-23 13:16:55.859693','28','Player object (28)',1,'[{\"added\": {}}]',13,1),(240,'2019-12-23 13:17:12.342010','29','Player object (29)',1,'[{\"added\": {}}]',13,1),(241,'2019-12-23 13:17:30.508832','30','Player object (30)',1,'[{\"added\": {}}]',13,1),(242,'2019-12-23 13:17:48.514921','31','Player object (31)',1,'[{\"added\": {}}]',13,1),(243,'2019-12-23 13:18:19.166883','32','Player object (32)',1,'[{\"added\": {}}]',13,1),(244,'2019-12-23 13:18:35.612172','33','Player object (33)',1,'[{\"added\": {}}]',13,1),(245,'2019-12-23 13:18:50.976962','34','Player object (34)',1,'[{\"added\": {}}]',13,1),(246,'2019-12-23 13:19:06.975837','35','Player object (35)',1,'[{\"added\": {}}]',13,1),(247,'2019-12-23 13:19:25.570681','36','Player object (36)',1,'[{\"added\": {}}]',13,1),(248,'2019-12-23 13:19:43.115796','37','Player object (37)',1,'[{\"added\": {}}]',13,1),(249,'2019-12-23 13:20:24.390155','38','Player object (38)',1,'[{\"added\": {}}]',13,1),(250,'2019-12-23 13:20:40.586381','39','Player object (39)',1,'[{\"added\": {}}]',13,1),(251,'2019-12-23 13:21:10.306720','40','Player object (40)',1,'[{\"added\": {}}]',13,1),(252,'2019-12-23 13:21:28.155153','41','Player object (41)',1,'[{\"added\": {}}]',13,1),(253,'2019-12-23 13:22:04.717003','42','Player object (42)',1,'[{\"added\": {}}]',13,1),(254,'2019-12-23 13:22:29.595969','43','Player object (43)',1,'[{\"added\": {}}]',13,1),(255,'2019-12-23 13:22:45.375037','44','Player object (44)',1,'[{\"added\": {}}]',13,1),(256,'2019-12-23 13:23:00.823396','45','Player object (45)',1,'[{\"added\": {}}]',13,1),(257,'2019-12-23 13:23:16.662559','46','Player object (46)',1,'[{\"added\": {}}]',13,1),(258,'2019-12-23 13:23:32.781732','47','Player object (47)',1,'[{\"added\": {}}]',13,1),(259,'2019-12-23 13:23:52.459562','48','Player object (48)',1,'[{\"added\": {}}]',13,1),(260,'2019-12-23 13:24:07.890537','49','Player object (49)',1,'[{\"added\": {}}]',13,1),(261,'2019-12-23 13:24:22.401611','50','Player object (50)',1,'[{\"added\": {}}]',13,1),(262,'2019-12-23 13:24:39.135717','51','Player object (51)',1,'[{\"added\": {}}]',13,1),(263,'2019-12-23 13:25:02.098562','52','Player object (52)',1,'[{\"added\": {}}]',13,1),(264,'2019-12-23 13:25:18.821163','53','Player object (53)',1,'[{\"added\": {}}]',13,1),(265,'2019-12-23 13:25:36.373023','54','Player object (54)',1,'[{\"added\": {}}]',13,1),(266,'2019-12-23 13:25:56.741305','55','Player object (55)',1,'[{\"added\": {}}]',13,1),(267,'2019-12-23 13:26:14.883759','56','Player object (56)',1,'[{\"added\": {}}]',13,1),(268,'2019-12-23 13:26:36.590447','57','Player object (57)',1,'[{\"added\": {}}]',13,1),(269,'2019-12-23 13:26:55.119912','58','Player object (58)',1,'[{\"added\": {}}]',13,1),(270,'2019-12-23 13:27:17.897563','59','Player object (59)',1,'[{\"added\": {}}]',13,1),(271,'2019-12-23 13:27:36.295026','60','Player object (60)',1,'[{\"added\": {}}]',13,1),(272,'2019-12-23 13:27:52.797636','61','Player object (61)',1,'[{\"added\": {}}]',13,1),(273,'2019-12-23 13:28:17.671794','62','Player object (62)',1,'[{\"added\": {}}]',13,1),(274,'2019-12-23 13:28:35.689911','63','Player object (63)',1,'[{\"added\": {}}]',13,1),(275,'2019-12-23 13:28:51.960186','64','Player object (64)',1,'[{\"added\": {}}]',13,1),(276,'2019-12-23 13:29:08.755891','65','Player object (65)',1,'[{\"added\": {}}]',13,1),(277,'2019-12-23 13:29:25.254530','66','Player object (66)',1,'[{\"added\": {}}]',13,1),(278,'2019-12-23 13:29:41.321182','67','Player object (67)',1,'[{\"added\": {}}]',13,1),(279,'2019-12-23 13:29:58.520649','68','Player object (68)',1,'[{\"added\": {}}]',13,1),(280,'2019-12-23 13:30:15.521776','69','Player object (69)',1,'[{\"added\": {}}]',13,1),(281,'2019-12-23 13:30:34.363190','70','Player object (70)',1,'[{\"added\": {}}]',13,1),(282,'2019-12-23 13:30:52.294616','71','Player object (71)',1,'[{\"added\": {}}]',13,1),(283,'2019-12-23 13:33:24.480264','72','Player object (72)',1,'[{\"added\": {}}]',13,1),(284,'2019-12-23 13:33:45.575175','73','Player object (73)',1,'[{\"added\": {}}]',13,1),(285,'2019-12-23 13:34:01.838070','74','Player object (74)',1,'[{\"added\": {}}]',13,1),(286,'2019-12-23 13:34:42.800815','75','Player object (75)',1,'[{\"added\": {}}]',13,1),(287,'2019-12-23 13:35:00.824431','76','Player object (76)',1,'[{\"added\": {}}]',13,1),(288,'2019-12-23 13:35:21.496575','77','Player object (77)',1,'[{\"added\": {}}]',13,1),(289,'2019-12-23 13:35:39.015862','78','Player object (78)',1,'[{\"added\": {}}]',13,1),(290,'2019-12-23 13:35:57.491957','79','Player object (79)',1,'[{\"added\": {}}]',13,1),(291,'2019-12-23 13:36:15.244622','80','Player object (80)',1,'[{\"added\": {}}]',13,1),(292,'2019-12-23 13:36:33.576562','81','Player object (81)',1,'[{\"added\": {}}]',13,1),(293,'2019-12-23 13:58:36.077038','82','Player object (82)',1,'[{\"added\": {}}]',13,1),(294,'2019-12-23 13:58:53.285412','83','Player object (83)',1,'[{\"added\": {}}]',13,1),(295,'2019-12-23 13:59:15.363204','84','Player object (84)',1,'[{\"added\": {}}]',13,1),(296,'2019-12-23 13:59:41.317130','85','Player object (85)',1,'[{\"added\": {}}]',13,1),(297,'2019-12-23 14:00:23.506470','86','Player object (86)',1,'[{\"added\": {}}]',13,1),(298,'2019-12-23 14:00:40.261752','87','Player object (87)',1,'[{\"added\": {}}]',13,1),(299,'2019-12-23 14:00:59.382278','88','Player object (88)',1,'[{\"added\": {}}]',13,1),(300,'2019-12-23 14:01:15.001803','89','Player object (89)',1,'[{\"added\": {}}]',13,1),(301,'2019-12-23 14:01:31.087318','90','Player object (90)',1,'[{\"added\": {}}]',13,1),(302,'2019-12-23 14:01:46.757123','91','Player object (91)',1,'[{\"added\": {}}]',13,1),(303,'2019-12-23 14:39:29.261285','13','TEAM J',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(304,'2019-12-23 14:40:05.538586','92','Player object (92)',1,'[{\"added\": {}}]',13,1),(305,'2019-12-23 14:40:22.012777','93','Player object (93)',1,'[{\"added\": {}}]',13,1),(306,'2019-12-23 14:40:36.906409','94','Player object (94)',1,'[{\"added\": {}}]',13,1),(307,'2019-12-23 14:40:59.598726','95','Player object (95)',1,'[{\"added\": {}}]',13,1),(308,'2019-12-23 14:41:15.748795','96','Player object (96)',1,'[{\"added\": {}}]',13,1),(309,'2019-12-23 14:41:34.565769','97','Player object (97)',1,'[{\"added\": {}}]',13,1),(310,'2019-12-23 14:41:50.160783','98','Player object (98)',1,'[{\"added\": {}}]',13,1),(311,'2019-12-23 14:42:10.673901','99','Player object (99)',1,'[{\"added\": {}}]',13,1),(312,'2019-12-23 14:42:26.120724','100','Player object (100)',1,'[{\"added\": {}}]',13,1),(313,'2019-12-23 14:42:46.824723','101','Player object (101)',1,'[{\"added\": {}}]',13,1),(314,'2019-12-23 14:43:06.577520','102','Player object (102)',1,'[{\"added\": {}}]',13,1),(315,'2019-12-23 14:43:24.403986','103','Player object (103)',1,'[{\"added\": {}}]',13,1),(316,'2019-12-23 14:43:40.360093','104','Player object (104)',1,'[{\"added\": {}}]',13,1),(317,'2019-12-23 14:43:57.483457','105','Player object (105)',1,'[{\"added\": {}}]',13,1),(318,'2019-12-23 14:44:13.659958','106','Player object (106)',1,'[{\"added\": {}}]',13,1),(319,'2019-12-23 14:44:30.646366','107','Player object (107)',1,'[{\"added\": {}}]',13,1),(320,'2019-12-23 14:44:49.488835','108','Player object (108)',1,'[{\"added\": {}}]',13,1),(321,'2019-12-23 14:45:11.278656','109','Player object (109)',1,'[{\"added\": {}}]',13,1),(322,'2019-12-23 14:45:26.363010','110','Player object (110)',1,'[{\"added\": {}}]',13,1),(323,'2019-12-23 14:45:47.261553','111','Player object (111)',1,'[{\"added\": {}}]',13,1),(324,'2019-12-23 14:47:42.151930','112','Player object (112)',1,'[{\"added\": {}}]',13,1),(325,'2019-12-23 14:48:06.533520','113','Player object (113)',1,'[{\"added\": {}}]',13,1),(326,'2019-12-23 14:48:25.140790','114','Player object (114)',1,'[{\"added\": {}}]',13,1),(327,'2019-12-23 14:48:41.075955','115','Player object (115)',1,'[{\"added\": {}}]',13,1),(328,'2019-12-23 14:48:58.132694','116','Player object (116)',1,'[{\"added\": {}}]',13,1),(329,'2019-12-23 14:49:17.215658','117','Player object (117)',1,'[{\"added\": {}}]',13,1),(330,'2019-12-23 14:49:40.521302','118','Player object (118)',1,'[{\"added\": {}}]',13,1),(331,'2019-12-23 14:49:59.682008','119','Player object (119)',1,'[{\"added\": {}}]',13,1),(332,'2019-12-23 14:50:16.348824','120','Player object (120)',1,'[{\"added\": {}}]',13,1),(333,'2019-12-23 14:50:38.488801','121','Player object (121)',1,'[{\"added\": {}}]',13,1),(334,'2019-12-23 14:51:01.122560','122','Player object (122)',1,'[{\"added\": {}}]',13,1),(335,'2019-12-23 14:51:24.852979','123','Player object (123)',1,'[{\"added\": {}}]',13,1),(336,'2019-12-23 14:51:50.712946','124','Player object (124)',1,'[{\"added\": {}}]',13,1),(337,'2019-12-23 14:52:06.920319','125','Player object (125)',1,'[{\"added\": {}}]',13,1),(338,'2019-12-23 14:52:29.364912','126','Player object (126)',1,'[{\"added\": {}}]',13,1),(339,'2019-12-23 14:53:10.922965','127','Player object (127)',1,'[{\"added\": {}}]',13,1),(340,'2019-12-23 14:53:34.820680','128','Player object (128)',1,'[{\"added\": {}}]',13,1),(341,'2019-12-23 14:53:58.970855','129','Player object (129)',1,'[{\"added\": {}}]',13,1),(342,'2019-12-23 14:54:14.423760','130','Player object (130)',1,'[{\"added\": {}}]',13,1),(343,'2019-12-23 14:54:32.764298','131','Player object (131)',1,'[{\"added\": {}}]',13,1),(344,'2019-12-23 14:55:00.420093','132','Player object (132)',1,'[{\"added\": {}}]',13,1),(345,'2019-12-23 14:55:16.101086','133','Player object (133)',1,'[{\"added\": {}}]',13,1),(346,'2019-12-23 14:55:33.912724','134','Player object (134)',1,'[{\"added\": {}}]',13,1),(347,'2019-12-23 14:55:50.408797','135','Player object (135)',1,'[{\"added\": {}}]',13,1),(348,'2019-12-23 14:56:13.014867','136','Player object (136)',1,'[{\"added\": {}}]',13,1),(349,'2019-12-23 14:56:31.043111','137','Player object (137)',1,'[{\"added\": {}}]',13,1),(350,'2019-12-23 14:56:53.583565','138','Player object (138)',1,'[{\"added\": {}}]',13,1),(351,'2019-12-23 14:57:10.303533','139','Player object (139)',1,'[{\"added\": {}}]',13,1),(352,'2019-12-23 14:57:35.123951','140','Player object (140)',1,'[{\"added\": {}}]',13,1),(353,'2019-12-23 14:57:54.691298','141','Player object (141)',1,'[{\"added\": {}}]',13,1),(354,'2019-12-23 14:59:13.965806','142','Player object (142)',1,'[{\"added\": {}}]',13,1),(355,'2019-12-23 14:59:31.063712','143','Player object (143)',1,'[{\"added\": {}}]',13,1),(356,'2019-12-23 14:59:47.551539','144','Player object (144)',1,'[{\"added\": {}}]',13,1),(357,'2019-12-23 15:00:02.511739','145','Player object (145)',1,'[{\"added\": {}}]',13,1),(358,'2019-12-23 15:00:20.503440','146','Player object (146)',1,'[{\"added\": {}}]',13,1),(359,'2019-12-23 15:00:35.671683','147','Player object (147)',1,'[{\"added\": {}}]',13,1),(360,'2019-12-23 15:00:51.483563','148','Player object (148)',1,'[{\"added\": {}}]',13,1),(361,'2019-12-23 15:01:07.936367','149','Player object (149)',1,'[{\"added\": {}}]',13,1),(362,'2019-12-23 15:01:23.940897','150','Player object (150)',1,'[{\"added\": {}}]',13,1),(363,'2019-12-23 15:01:40.795524','151','Player object (151)',1,'[{\"added\": {}}]',13,1),(364,'2019-12-23 15:02:19.707911','152','Player object (152)',1,'[{\"added\": {}}]',13,1),(365,'2019-12-23 15:02:40.720892','153','Player object (153)',1,'[{\"added\": {}}]',13,1),(366,'2019-12-23 15:02:57.605257','154','Player object (154)',1,'[{\"added\": {}}]',13,1),(367,'2019-12-23 15:03:14.804385','155','Player object (155)',1,'[{\"added\": {}}]',13,1),(368,'2019-12-23 15:03:32.320655','156','Player object (156)',1,'[{\"added\": {}}]',13,1),(369,'2019-12-23 15:03:47.060510','157','Player object (157)',1,'[{\"added\": {}}]',13,1),(370,'2019-12-23 15:04:01.602164','158','Player object (158)',1,'[{\"added\": {}}]',13,1),(371,'2019-12-23 15:04:18.821943','159','Player object (159)',1,'[{\"added\": {}}]',13,1),(372,'2019-12-23 15:04:37.739416','160','Player object (160)',1,'[{\"added\": {}}]',13,1),(373,'2019-12-23 15:04:54.710802','161','Player object (161)',1,'[{\"added\": {}}]',13,1),(374,'2019-12-23 15:06:05.124332','3','Staff object (3)',1,'[{\"added\": {}}]',17,1),(375,'2019-12-23 15:06:28.237459','4','Staff object (4)',1,'[{\"added\": {}}]',17,1),(376,'2019-12-23 15:06:49.428451','5','Staff object (5)',1,'[{\"added\": {}}]',17,1),(377,'2019-12-23 15:07:13.131705','6','Staff object (6)',1,'[{\"added\": {}}]',17,1),(378,'2019-12-23 15:07:39.141391','7','Staff object (7)',1,'[{\"added\": {}}]',17,1),(379,'2019-12-23 15:08:02.958283','8','Staff object (8)',1,'[{\"added\": {}}]',17,1),(380,'2019-12-23 15:08:30.325517','9','Staff object (9)',1,'[{\"added\": {}}]',17,1),(381,'2019-12-23 15:08:53.035946','10','Staff object (10)',1,'[{\"added\": {}}]',17,1),(382,'2019-12-23 15:09:14.551061','11','Staff object (11)',1,'[{\"added\": {}}]',17,1),(383,'2019-12-23 15:09:35.844493','12','Staff object (12)',1,'[{\"added\": {}}]',17,1),(384,'2019-12-23 15:09:58.590481','13','Staff object (13)',1,'[{\"added\": {}}]',17,1),(385,'2019-12-23 15:10:24.756618','14','Staff object (14)',1,'[{\"added\": {}}]',17,1),(386,'2019-12-23 15:10:45.374104','15','Staff object (15)',1,'[{\"added\": {}}]',17,1),(387,'2019-12-23 15:11:04.013595','16','Staff object (16)',1,'[{\"added\": {}}]',17,1),(388,'2019-12-23 15:11:28.680965','17','Staff object (17)',1,'[{\"added\": {}}]',17,1),(389,'2019-12-23 15:11:44.478670','18','Staff object (18)',1,'[{\"added\": {}}]',17,1),(390,'2019-12-23 15:13:43.958616','3','GAME-01',1,'[{\"added\": {}}]',12,1),(391,'2019-12-23 15:14:11.286722','4','GAME-02',1,'[{\"added\": {}}]',12,1),(392,'2019-12-23 15:14:43.467661','5','GAME-03',1,'[{\"added\": {}}]',12,1),(393,'2019-12-23 15:15:09.569711','6','GAME-04',1,'[{\"added\": {}}]',12,1),(394,'2019-12-23 15:15:37.510034','7','GAME-05',1,'[{\"added\": {}}]',12,1),(395,'2019-12-23 15:15:58.718032','8','GAME-06',1,'[{\"added\": {}}]',12,1),(396,'2019-12-23 15:16:25.436901','9','GAME-07',1,'[{\"added\": {}}]',12,1),(397,'2019-12-23 15:16:49.905887','10','GAME-08',1,'[{\"added\": {}}]',12,1),(398,'2019-12-23 16:05:27.342472','6','GameScore object (6)',1,'[{\"added\": {}}]',19,1),(399,'2019-12-23 16:05:59.263483','7','GameScore object (7)',1,'[{\"added\": {}}]',19,1),(400,'2019-12-23 16:06:17.679779','8','GameScore object (8)',1,'[{\"added\": {}}]',19,1),(401,'2019-12-23 16:06:35.805373','9','GameScore object (9)',1,'[{\"added\": {}}]',19,1),(402,'2019-12-23 16:32:45.703170','10','GameScore object (10)',1,'[{\"added\": {}}]',19,1),(403,'2019-12-23 16:33:07.408988','11','GameScore object (11)',1,'[{\"added\": {}}]',19,1),(404,'2019-12-23 16:33:33.531822','12','GameScore object (12)',1,'[{\"added\": {}}]',19,1),(405,'2019-12-23 17:31:18.771568','13','GameScore object (13)',1,'[{\"added\": {}}]',19,1),(406,'2019-12-23 17:31:57.260400','14','GameScore object (14)',1,'[{\"added\": {}}]',19,1),(407,'2019-12-23 17:32:14.246754','15','GameScore object (15)',1,'[{\"added\": {}}]',19,1),(408,'2019-12-23 17:32:27.431175','15','GameScore object (15)',2,'[{\"changed\": {\"fields\": [\"Is win\"]}}]',19,1),(409,'2019-12-23 17:33:03.101657','16','GameScore object (16)',1,'[{\"added\": {}}]',19,1),(410,'2019-12-23 17:33:29.116722','17','GameScore object (17)',1,'[{\"added\": {}}]',19,1),(411,'2019-12-23 17:33:55.124399','18','GameScore object (18)',1,'[{\"added\": {}}]',19,1),(412,'2019-12-23 17:34:15.508667','19','GameScore object (19)',1,'[{\"added\": {}}]',19,1),(413,'2019-12-23 17:34:37.506322','20','GameScore object (20)',1,'[{\"added\": {}}]',19,1),(414,'2019-12-23 17:34:55.052659','21','GameScore object (21)',1,'[{\"added\": {}}]',19,1),(415,'2019-12-23 17:37:27.140231','3','TeamScore object (3)',1,'[{\"added\": {}}]',16,1),(416,'2019-12-23 17:38:09.490044','4','TeamScore object (4)',1,'[{\"added\": {}}]',16,1),(417,'2019-12-23 17:38:50.039817','5','TeamScore object (5)',1,'[{\"added\": {}}]',16,1),(418,'2019-12-23 17:39:19.324367','6','TeamScore object (6)',1,'[{\"added\": {}}]',16,1),(419,'2019-12-23 17:39:47.876494','7','TeamScore object (7)',1,'[{\"added\": {}}]',16,1),(420,'2019-12-23 17:40:15.733764','8','TeamScore object (8)',1,'[{\"added\": {}}]',16,1),(421,'2019-12-23 17:41:15.331877','9','TeamScore object (9)',1,'[{\"added\": {}}]',16,1),(422,'2019-12-23 17:41:54.228078','10','TeamScore object (10)',1,'[{\"added\": {}}]',16,1),(423,'2019-12-23 17:42:34.090463','11','TeamScore object (11)',1,'[{\"added\": {}}]',16,1),(424,'2019-12-23 17:43:03.977806','12','TeamScore object (12)',1,'[{\"added\": {}}]',16,1),(425,'2019-12-23 17:43:34.807573','13','TeamScore object (13)',1,'[{\"added\": {}}]',16,1),(426,'2019-12-23 17:44:06.628612','14','TeamScore object (14)',1,'[{\"added\": {}}]',16,1),(427,'2019-12-23 17:44:33.262652','15','TeamScore object (15)',1,'[{\"added\": {}}]',16,1),(428,'2019-12-23 17:45:09.225108','16','TeamScore object (16)',1,'[{\"added\": {}}]',16,1),(429,'2019-12-23 17:45:34.117406','17','TeamScore object (17)',1,'[{\"added\": {}}]',16,1),(430,'2019-12-23 17:50:35.581595','17','TEAM N',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',14,1),(431,'2019-12-24 03:07:20.480464','1','PlayerScore object (1)',1,'[{\"added\": {}}]',18,1),(432,'2019-12-24 03:07:41.844560','2','PlayerScore object (2)',1,'[{\"added\": {}}]',18,1),(433,'2019-12-24 03:07:54.956976','3','PlayerScore object (3)',1,'[{\"added\": {}}]',18,1),(434,'2019-12-24 03:08:15.197309','4','PlayerScore object (4)',1,'[{\"added\": {}}]',18,1),(435,'2019-12-24 03:08:28.042255','5','PlayerScore object (5)',1,'[{\"added\": {}}]',18,1),(436,'2019-12-24 03:12:04.501942','6','PlayerScore object (6)',1,'[{\"added\": {}}]',18,1),(437,'2019-12-24 03:12:25.429454','7','PlayerScore object (7)',1,'[{\"added\": {}}]',18,1),(438,'2019-12-24 03:12:43.849439','8','PlayerScore object (8)',1,'[{\"added\": {}}]',18,1),(439,'2019-12-24 03:13:03.524354','9','PlayerScore object (9)',1,'[{\"added\": {}}]',18,1),(440,'2019-12-24 03:13:17.276944','10','PlayerScore object (10)',1,'[{\"added\": {}}]',18,1),(441,'2019-12-24 03:13:41.359264','11','PlayerScore object (11)',1,'[{\"added\": {}}]',18,1),(442,'2019-12-24 03:13:56.354526','12','PlayerScore object (12)',1,'[{\"added\": {}}]',18,1),(443,'2019-12-24 03:14:22.267196','13','PlayerScore object (13)',1,'[{\"added\": {}}]',18,1),(444,'2019-12-24 03:14:38.442264','14','PlayerScore object (14)',1,'[{\"added\": {}}]',18,1),(445,'2019-12-24 03:15:00.316419','15','PlayerScore object (15)',1,'[{\"added\": {}}]',18,1),(446,'2019-12-24 03:15:21.686730','16','PlayerScore object (16)',1,'[{\"added\": {}}]',18,1),(447,'2019-12-24 03:15:38.861793','17','PlayerScore object (17)',1,'[{\"added\": {}}]',18,1),(448,'2019-12-24 03:15:50.992269','18','PlayerScore object (18)',1,'[{\"added\": {}}]',18,1),(449,'2019-12-24 03:16:05.533428','19','PlayerScore object (19)',1,'[{\"added\": {}}]',18,1),(450,'2019-12-24 03:16:18.196464','20','PlayerScore object (20)',1,'[{\"added\": {}}]',18,1),(451,'2019-12-24 03:16:44.294730','21','PlayerScore object (21)',1,'[{\"added\": {}}]',18,1),(452,'2019-12-24 03:16:59.852978','22','PlayerScore object (22)',1,'[{\"added\": {}}]',18,1),(453,'2019-12-24 03:17:18.228415','23','PlayerScore object (23)',1,'[{\"added\": {}}]',18,1),(454,'2019-12-24 03:17:30.411285','24','PlayerScore object (24)',1,'[{\"added\": {}}]',18,1),(455,'2019-12-24 03:17:43.868379','25','PlayerScore object (25)',1,'[{\"added\": {}}]',18,1),(456,'2019-12-24 03:19:22.326799','26','PlayerScore object (26)',1,'[{\"added\": {}}]',18,1),(457,'2019-12-24 03:19:41.365594','27','PlayerScore object (27)',1,'[{\"added\": {}}]',18,1),(458,'2019-12-24 03:20:03.330033','28','PlayerScore object (28)',1,'[{\"added\": {}}]',18,1),(459,'2019-12-24 03:20:16.397310','29','PlayerScore object (29)',1,'[{\"added\": {}}]',18,1),(460,'2019-12-24 03:20:29.516791','30','PlayerScore object (30)',1,'[{\"added\": {}}]',18,1),(461,'2019-12-24 03:20:57.418076','31','PlayerScore object (31)',1,'[{\"added\": {}}]',18,1),(462,'2019-12-24 03:21:17.048061','32','PlayerScore object (32)',1,'[{\"added\": {}}]',18,1),(463,'2019-12-24 03:21:40.558163','33','PlayerScore object (33)',1,'[{\"added\": {}}]',18,1),(464,'2019-12-24 03:21:58.084450','34','PlayerScore object (34)',1,'[{\"added\": {}}]',18,1),(465,'2019-12-24 03:22:11.605234','35','PlayerScore object (35)',1,'[{\"added\": {}}]',18,1),(466,'2019-12-24 03:22:34.973042','36','PlayerScore object (36)',1,'[{\"added\": {}}]',18,1),(467,'2019-12-24 03:22:51.021462','37','PlayerScore object (37)',1,'[{\"added\": {}}]',18,1),(468,'2019-12-24 03:23:07.308828','38','PlayerScore object (38)',1,'[{\"added\": {}}]',18,1),(469,'2019-12-24 03:23:21.620240','39','PlayerScore object (39)',1,'[{\"added\": {}}]',18,1),(470,'2019-12-24 03:23:37.474345','40','PlayerScore object (40)',1,'[{\"added\": {}}]',18,1),(471,'2019-12-24 03:26:43.122102','41','PlayerScore object (41)',1,'[{\"added\": {}}]',18,1),(472,'2019-12-24 03:27:04.677602','42','PlayerScore object (42)',1,'[{\"added\": {}}]',18,1),(473,'2019-12-24 03:27:20.167555','43','PlayerScore object (43)',1,'[{\"added\": {}}]',18,1),(474,'2019-12-24 03:27:40.752094','44','PlayerScore object (44)',1,'[{\"added\": {}}]',18,1),(475,'2019-12-24 03:27:55.096728','45','PlayerScore object (45)',1,'[{\"added\": {}}]',18,1),(476,'2019-12-24 03:28:30.561486','46','PlayerScore object (46)',1,'[{\"added\": {}}]',18,1),(477,'2019-12-24 03:28:49.531911','47','PlayerScore object (47)',1,'[{\"added\": {}}]',18,1),(478,'2019-12-24 03:29:05.283822','48','PlayerScore object (48)',1,'[{\"added\": {}}]',18,1),(479,'2019-12-24 03:29:20.240886','49','PlayerScore object (49)',1,'[{\"added\": {}}]',18,1),(480,'2019-12-24 03:29:35.287034','50','PlayerScore object (50)',1,'[{\"added\": {}}]',18,1),(481,'2019-12-24 03:30:12.897804','51','PlayerScore object (51)',1,'[{\"added\": {}}]',18,1),(482,'2019-12-24 03:30:31.184836','52','PlayerScore object (52)',1,'[{\"added\": {}}]',18,1),(483,'2019-12-24 03:31:01.853872','53','PlayerScore object (53)',1,'[{\"added\": {}}]',18,1),(484,'2019-12-24 03:31:14.961119','54','PlayerScore object (54)',1,'[{\"added\": {}}]',18,1),(485,'2019-12-24 03:31:33.763221','55','PlayerScore object (55)',1,'[{\"added\": {}}]',18,1),(486,'2019-12-24 03:32:04.721825','56','PlayerScore object (56)',1,'[{\"added\": {}}]',18,1),(487,'2019-12-24 03:32:27.512862','57','PlayerScore object (57)',1,'[{\"added\": {}}]',18,1),(488,'2019-12-24 03:32:47.283701','58','PlayerScore object (58)',1,'[{\"added\": {}}]',18,1),(489,'2019-12-24 03:33:12.019892','59','PlayerScore object (59)',1,'[{\"added\": {}}]',18,1),(490,'2019-12-24 03:33:28.403659','60','PlayerScore object (60)',1,'[{\"added\": {}}]',18,1),(491,'2019-12-24 03:34:27.539286','61','PlayerScore object (61)',1,'[{\"added\": {}}]',18,1),(492,'2019-12-24 03:34:42.722666','62','PlayerScore object (62)',1,'[{\"added\": {}}]',18,1),(493,'2019-12-24 03:35:06.158074','63','PlayerScore object (63)',1,'[{\"added\": {}}]',18,1),(494,'2019-12-24 03:35:18.631659','64','PlayerScore object (64)',1,'[{\"added\": {}}]',18,1),(495,'2019-12-24 03:35:32.233137','65','PlayerScore object (65)',1,'[{\"added\": {}}]',18,1),(496,'2019-12-24 03:35:55.810211','66','PlayerScore object (66)',1,'[{\"added\": {}}]',18,1),(497,'2019-12-24 03:36:10.166721','67','PlayerScore object (67)',1,'[{\"added\": {}}]',18,1),(498,'2019-12-24 03:36:33.081787','68','PlayerScore object (68)',1,'[{\"added\": {}}]',18,1),(499,'2019-12-24 03:36:47.844777','69','PlayerScore object (69)',1,'[{\"added\": {}}]',18,1),(500,'2019-12-24 03:37:03.846469','70','PlayerScore object (70)',1,'[{\"added\": {}}]',18,1),(501,'2019-12-24 03:37:35.364953','71','PlayerScore object (71)',1,'[{\"added\": {}}]',18,1),(502,'2019-12-24 03:37:48.236243','72','PlayerScore object (72)',1,'[{\"added\": {}}]',18,1),(503,'2019-12-24 03:38:03.395197','73','PlayerScore object (73)',1,'[{\"added\": {}}]',18,1),(504,'2019-12-24 03:38:20.734525','74','PlayerScore object (74)',1,'[{\"added\": {}}]',18,1),(505,'2019-12-24 03:38:41.830220','75','PlayerScore object (75)',1,'[{\"added\": {}}]',18,1),(506,'2019-12-24 03:39:09.702316','76','PlayerScore object (76)',1,'[{\"added\": {}}]',18,1),(507,'2019-12-24 03:39:24.991559','77','PlayerScore object (77)',1,'[{\"added\": {}}]',18,1),(508,'2019-12-24 03:39:40.244211','78','PlayerScore object (78)',1,'[{\"added\": {}}]',18,1),(509,'2019-12-24 03:39:54.806379','79','PlayerScore object (79)',1,'[{\"added\": {}}]',18,1),(510,'2019-12-24 03:40:11.540571','80','PlayerScore object (80)',1,'[{\"added\": {}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(12,'api','game'),(19,'api','gamescore'),(13,'api','player'),(18,'api','playerscore'),(17,'api','staff'),(14,'api','team'),(16,'api','teamscore'),(15,'api','tournament'),(20,'api','userstate'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'corsheaders','corsmodel'),(8,'oauth2_provider','accesstoken'),(7,'oauth2_provider','application'),(9,'oauth2_provider','grant'),(10,'oauth2_provider','refreshtoken'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-22 12:27:58.658393'),(2,'auth','0001_initial','2019-12-22 12:27:58.744389'),(3,'admin','0001_initial','2019-12-22 12:27:58.927661'),(4,'admin','0002_logentry_remove_auto_add','2019-12-22 12:27:58.991628'),(5,'admin','0003_logentry_add_action_flag_choices','2019-12-22 12:27:59.007737'),(6,'api','0001_initial','2019-12-22 12:27:59.441509'),(7,'contenttypes','0002_remove_content_type_name','2019-12-22 12:27:59.689723'),(8,'auth','0002_alter_permission_name_max_length','2019-12-22 12:27:59.701443'),(9,'auth','0003_alter_user_email_max_length','2019-12-22 12:27:59.720490'),(10,'auth','0004_alter_user_username_opts','2019-12-22 12:27:59.736766'),(11,'auth','0005_alter_user_last_login_null','2019-12-22 12:27:59.768542'),(12,'auth','0006_require_contenttypes_0002','2019-12-22 12:27:59.771248'),(13,'auth','0007_alter_validators_add_error_messages','2019-12-22 12:27:59.789902'),(14,'auth','0008_alter_user_username_max_length','2019-12-22 12:27:59.811412'),(15,'auth','0009_alter_user_last_name_max_length','2019-12-22 12:27:59.833090'),(16,'auth','0010_alter_group_name_max_length','2019-12-22 12:27:59.850514'),(17,'auth','0011_update_proxy_permissions','2019-12-22 12:27:59.874004'),(18,'corsheaders','0001_initial','2019-12-22 12:27:59.886097'),(19,'oauth2_provider','0001_initial','2019-12-22 12:28:00.024077'),(20,'oauth2_provider','0002_08_updates','2019-12-22 12:28:00.338021'),(21,'oauth2_provider','0003_auto_20160316_1503','2019-12-22 12:28:00.390893'),(22,'oauth2_provider','0004_auto_20160525_1623','2019-12-22 12:28:00.476446'),(23,'oauth2_provider','0005_auto_20170514_1141','2019-12-22 12:28:01.257801'),(24,'oauth2_provider','0006_auto_20171214_2232','2019-12-22 12:28:01.440435'),(25,'sessions','0001_initial','2019-12-22 12:28:01.455134'),(26,'api','0002_userstate','2019-12-22 15:20:44.129805'),(27,'api','0003_auto_20191222_1702','2019-12-22 17:11:19.951540'),(28,'api','0004_auto_20191223_1602','2019-12-23 16:39:32.469909'),(29,'api','0005_auto_20191223_1607','2019-12-23 16:39:32.604558');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eo022x8x1e3b3ovpqzby11tuu0916cxp','YzYxZWE2YjQ5MjAzODRmOGJlZTZiZDU5M2RkZDczYzQ3Y2IxNTdmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjAyMmM5ZTkxY2IyODg4OTM2YzQ4Y2E1Y2MzN2MwNDdiYzY1M2FhIn0=','2020-01-05 17:16:16.465477'),('qlfzy2m08py7fzwaxume4vmp1dur72f9','YzYxZWE2YjQ5MjAzODRmOGJlZTZiZDU5M2RkZDczYzQ3Y2IxNTdmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjAyMmM5ZTkxY2IyODg4OTM2YzQ4Y2E1Y2MzN2MwNDdiYzY1M2FhIn0=','2020-01-05 12:28:54.906590'),('wqwh86pnvetocirc36ktixl1grs6lios','YzYxZWE2YjQ5MjAzODRmOGJlZTZiZDU5M2RkZDczYzQ3Y2IxNTdmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjAyMmM5ZTkxY2IyODg4OTM2YzQ4Y2E1Y2MzN2MwNDdiYzY1M2FhIn0=','2020-01-06 11:35:57.311997');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_8af090f8_uniq` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_accesstoken_application_id_b22886e1_fk` (`application_id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_application_id_b22886e1_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'Mk2qcY0PfsB8H4gDuWkVMtpyGl1Fbw','2019-12-22 22:29:54.082048','read write',1,1,'2019-12-22 12:29:54.083520','2019-12-22 12:29:54.083564',NULL),(2,'xzw7Z1uBbaOk3aMFCM8Nhn5kUKVoW1','2019-12-23 02:11:30.465912','read write',1,1,'2019-12-22 16:11:30.467104','2019-12-22 16:11:30.467135',NULL),(3,'aL7Yrjx2im0i4HsZWkgrV1EfqdqSmU','2019-12-23 02:21:03.128997','read write',1,1,'2019-12-22 16:21:03.129860','2019-12-22 16:21:03.129890',NULL),(4,'wADFiYCwv17IUTgVqqxtGZeCnuNh9j','2019-12-23 02:30:02.436635','read write',1,1,'2019-12-22 16:30:02.437606','2019-12-22 16:30:02.437662',NULL),(5,'ziqNThnskuCQuC5cHA1CmuR27qe09C','2019-12-23 02:33:31.100897','read write',1,1,'2019-12-22 16:33:31.102306','2019-12-22 16:33:31.102337',NULL),(6,'a6vsCLeYNYwcm9i4H7aOL3cCaTwoSP','2020-01-21 17:16:16.981571','read write',1,1,'2019-12-22 17:16:16.982595','2019-12-22 17:16:16.982624',NULL),(7,'57UoHlPelYdpPBOccZaquOHegpMbbP','2020-01-21 17:19:48.756751','read write',1,1,'2019-12-22 17:19:48.757702','2019-12-22 17:19:48.757731',NULL),(8,'w71OkTfQUWY3s5Rp8Kbva4OIvAAvLl','2020-01-21 17:34:37.409393','read write',1,1,'2019-12-22 17:34:37.410354','2019-12-22 17:34:37.410385',NULL),(9,'Dox21VE7lwisrm1NNW96673LhkeTOM','2020-01-21 17:36:44.476806','read write',1,1,'2019-12-22 17:36:44.477996','2019-12-22 17:36:44.478028',NULL),(10,'Zogc30KrnNM5YKClAUYjWW00JMo1jq','2020-01-21 18:21:05.243828','read write',1,1,'2019-12-22 18:21:05.244708','2019-12-22 18:21:05.244741',NULL),(11,'bMbeCcMvn1aQP5Ub8m6qMkJl4PGjXe','2020-01-21 18:22:21.115622','read write',1,1,'2019-12-22 18:22:21.116635','2019-12-22 18:22:21.116666',NULL),(12,'fkloybpxJRh8Ioc1Jp1Ve1JTceMGmq','2020-01-21 18:33:19.465421','read write',1,1,'2019-12-22 18:33:19.466447','2019-12-22 18:33:19.466477',NULL),(13,'LVPzRXh75hob4KxjEJvkamnPiNj3PY','2020-01-21 20:59:56.792700','read write',1,1,'2019-12-22 20:59:56.794045','2019-12-22 20:59:56.794112',NULL),(14,'VgbIrg78iQG9IUcl1JMLadkEwNhULi','2020-01-22 04:29:47.948373','read write',1,1,'2019-12-23 04:29:47.949580','2019-12-23 04:29:47.949611',NULL),(15,'gXivhqKT4WhH5JQhP922fiTDQLCwRT','2020-01-22 09:37:25.338070','read write',1,1,'2019-12-23 09:37:25.338851','2019-12-23 09:37:25.338881',NULL),(16,'pxGRW6s8cR5Q3ZcgVnaI3Ib3bF14DK','2020-01-22 16:46:26.355161','read write',1,1,'2019-12-23 16:46:26.356130','2019-12-23 16:46:26.356177',NULL),(17,'pYZkLplkdbJQ2uiJ8iehBKlxTNCvqu','2020-01-22 18:09:46.731125','read write',1,1,'2019-12-23 18:09:46.731969','2019-12-23 18:09:46.731999',NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'bvvsLWc39br7yKJV5KjKTCcfdQhBs9Zza6bdVwn0','','confidential','password','cgRRxskW3QjloVOthtvOKP7XsAimhLMHYhDK6tMEvUGyKhuZtTxUihAt7q97AVuHBmeKXBv7Owmz1hMP48yq4rgYuBO3xmLd90MBG1llt7fLBrs2YMcQ9b6JGiL4bhK0','webapp',1,0,'2019-12-22 12:29:45.339887','2019-12-22 12:29:45.339936');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_grant_code_49ab4ddf_uniq` (`code`),
  KEY `oauth2_provider_grant_application_id_81923564_fk` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_grant_application_id_81923564_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'SxcKTnHPmn4kNCt2AHLPihCstlmPLE',1,1,1,'2019-12-22 12:29:54.085086','2019-12-22 12:29:54.085124',NULL),(2,'XEoZ3XRJtQLzjIQRwvAM4FDYh5dzTp',2,1,1,'2019-12-22 16:11:30.473887','2019-12-22 16:11:30.473943',NULL),(3,'47BqX7zjOCKLPo2Go5DVfO8pJDefIm',3,1,1,'2019-12-22 16:21:03.131364','2019-12-22 16:21:03.131404',NULL),(4,'sgIf19SliBPGoI56U5l9hBe45RdLFt',4,1,1,'2019-12-22 16:30:02.444746','2019-12-22 16:30:02.444811',NULL),(5,'Sv2aGOfRFsFXwgKkGWVswgWvGn5Zrn',5,1,1,'2019-12-22 16:33:31.103918','2019-12-22 16:33:31.103974',NULL),(6,'t0lhrhKl9E4Z7G4AJzuifEGgyiXase',6,1,1,'2019-12-22 17:16:16.986709','2019-12-22 17:16:16.986749',NULL),(7,'2qlw9OZXyLkZH7v0EjmwqIjiG7bYwQ',7,1,1,'2019-12-22 17:19:48.759193','2019-12-22 17:19:48.759232',NULL),(8,'CzQBe50GtSOxlmUGCdVJq1PKKw6kVD',8,1,1,'2019-12-22 17:34:37.415400','2019-12-22 17:34:37.415460',NULL),(9,'574ouYgCermP4A3Z5BF5rcLoYng6WI',9,1,1,'2019-12-22 17:36:44.479757','2019-12-22 17:36:44.479835',NULL),(10,'grhETdqrIHs2PGCZM1zEPvhNKbed8a',10,1,1,'2019-12-22 18:21:05.246327','2019-12-22 18:21:05.246366',NULL),(11,'QowUqs5YDXMFJ9ufPmTF1zGS0a0VbO',11,1,1,'2019-12-22 18:22:21.122038','2019-12-22 18:22:21.122087',NULL),(12,'Wc9tQ17TYiLNOqbPEddf04Vs8s85SR',12,1,1,'2019-12-22 18:33:19.467849','2019-12-22 18:33:19.467887',NULL),(13,'ie3K3ZEWwZMfmoW2naE1phbLdir2Nm',13,1,1,'2019-12-22 20:59:56.796182','2019-12-22 20:59:56.796247',NULL),(14,'9Z1o9TmIksOv4OkqbINOL5NclaM8UL',14,1,1,'2019-12-23 04:29:47.956851','2019-12-23 04:29:47.956890',NULL),(15,'T202tJL4VUKK6iwZJ8VBIVK5Gk4jPc',15,1,1,'2019-12-23 09:37:25.340070','2019-12-23 09:37:25.340106',NULL),(16,'zVRBMtD8BVdQOJtMRxb6J1W6WKLX2F',16,1,1,'2019-12-23 16:46:26.357583','2019-12-23 16:46:26.357644',NULL),(17,'Ocma65oHvMuFqtqWYOTmKgj3uaZtYU',17,1,1,'2019-12-23 18:09:46.736637','2019-12-23 18:09:46.736686',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-24  3:50:31
