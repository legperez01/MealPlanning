-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: food
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--
USE food;

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet`
--

DROP TABLE IF EXISTS `diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet`
--

LOCK TABLES `diet` WRITE;
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
INSERT INTO `diet` VALUES (2,'Dieta de Definicion de 2000 Calorias');
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet_meal`
--

DROP TABLE IF EXISTS `diet_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_meal` (
  `diet_id` int DEFAULT NULL,
  `meal_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `ix_diet_meal_meal_id` (`meal_id`),
  KEY `ix_diet_meal_diet_id` (`diet_id`),
  CONSTRAINT `fk_diet_meal_diet_id` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`id`),
  CONSTRAINT `fk_diet_meal_meal_id` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_meal`
--

LOCK TABLES `diet_meal` WRITE;
/*!40000 ALTER TABLE `diet_meal` DISABLE KEYS */;
INSERT INTO `diet_meal` VALUES (2,24,1),(2,19,2),(2,21,3),(2,20,4),(2,20,5);
/*!40000 ALTER TABLE `diet_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `calories` double NOT NULL,
  `fat` double NOT NULL,
  `ch` double NOT NULL,
  `protein` double NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `unit` varchar(5) DEFAULT 'g',
  `amount_per` int DEFAULT '100',
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_food_category1_idx` (`category_id`),
  CONSTRAINT `fk_food_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'chiken brast',165,3.6,0,31,NULL,'g',100,NULL),(2,'egg',155,11,1.1,13,NULL,'g',100,NULL),(3,'egg white',52,0.2,0.7,11,NULL,'g',100,NULL),(4,'rice',130,0.3,28,2.7,NULL,'g',100,NULL),(5,'Almond',170,15,7,6,NULL,'g',30,NULL),(6,'Brunswick Pink Salmon',90,5,0,12,NULL,'g',63,NULL),(7,'Avena Quaker',150,3,26,6,NULL,'g',40,NULL),(8,'Sweet Potato',90,0.2,21,2,NULL,'g',100,NULL),(9,'Peanut Butter',190,16,8,7,NULL,'g',33,NULL),(10,'Leche Rica Descremada',86,0.5,12,8,NULL,'ml',250,NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (18,'Rice with Chiken and Almonds'),(19,'Chiken with Almonds'),(20,'Sweet Potato with Scrambled Edds'),(21,'Pink Salmon'),(22,'Batida de Leche con Avena y Mantequilla de Mani'),(23,'Leche con Avena y Mantequilla de Mani'),(24,'Oatmeal with Peanut Butter and Milk');
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_food`
--

DROP TABLE IF EXISTS `meal_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food_id` int DEFAULT NULL,
  `meal_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_food_has_meal_meal1_idx` (`meal_id`),
  KEY `fk_food_has_meal_food_idx` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_food`
--

LOCK TABLES `meal_food` WRITE;
/*!40000 ALTER TABLE `meal_food` DISABLE KEYS */;
INSERT INTO `meal_food` VALUES (1,4,18,150),(2,1,18,100),(3,5,18,30),(4,1,19,100),(5,5,19,30),(6,8,20,200),(7,3,20,200),(8,2,20,100),(9,6,21,220),(10,10,22,250),(11,7,22,50),(12,9,22,20),(13,10,23,250),(14,7,23,50),(15,9,23,33),(16,10,24,250),(17,7,24,50),(18,9,24,33);
/*!40000 ALTER TABLE `meal_food` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-12 23:59:41
