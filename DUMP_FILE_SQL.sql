-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: attendance_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `admin_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,2030),(2,2031),(3,2032),(4,2033),(5,2034),(6,2035),(7,2036),(8,2037),(9,2038),(10,2039);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_date`
--

DROP TABLE IF EXISTS `attendance_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_date` (
  `working_Date` date NOT NULL,
  PRIMARY KEY (`working_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_date`
--

LOCK TABLES `attendance_date` WRITE;
/*!40000 ALTER TABLE `attendance_date` DISABLE KEYS */;
INSERT INTO `attendance_date` VALUES ('2023-04-01'),('2023-04-02'),('2023-04-03'),('2023-04-04'),('2023-04-05'),('2023-04-06'),('2023-04-07'),('2023-04-08'),('2023-04-09'),('2023-04-10');
/*!40000 ALTER TABLE `attendance_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attends`
--

DROP TABLE IF EXISTS `attends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attends` (
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_student_class` (`student_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `attends_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attends_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class1` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES (1,1),(5,1),(10,1),(2,2),(1,3),(2,3),(4,4),(9,4),(4,5),(5,6),(6,6),(6,7),(8,8),(3,9),(8,9),(3,10),(10,10);
/*!40000 ALTER TABLE `attends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class1`
--

DROP TABLE IF EXISTS `class1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class1` (
  `class_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) NOT NULL,
  `class_section` varchar(30) NOT NULL,
  `start_time` datetime NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class1`
--

LOCK TABLES `class1` WRITE;
/*!40000 ALTER TABLE `class1` DISABLE KEYS */;
INSERT INTO `class1` VALUES (1,'Math','A','2023-04-10 09:00:00'),(2,'Science','B','2023-04-10 11:00:00'),(3,'English','C','2023-04-10 13:00:00'),(4,'History','A','2023-04-11 10:00:00'),(5,'Math','B','2023-04-11 12:00:00'),(6,'Science','C','2023-04-11 14:00:00'),(7,'English','A','2023-04-12 11:00:00'),(8,'History','B','2023-04-12 13:00:00'),(9,'Math','C','2023-04-12 15:00:00'),(10,'Science','A','2023-04-13 10:00:00');
/*!40000 ALTER TABLE `class1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_in`
--

DROP TABLE IF EXISTS `enrolled_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled_in` (
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_student_class` (`student_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `enrolled_in_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrolled_in_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class1` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_in`
--

LOCK TABLES `enrolled_in` WRITE;
/*!40000 ALTER TABLE `enrolled_in` DISABLE KEYS */;
INSERT INTO `enrolled_in` VALUES (1,1),(10,1),(1,2),(2,2),(2,3),(3,3),(3,4),(4,4),(4,5),(5,5),(5,6),(6,6),(6,7),(7,7),(7,8),(8,8),(8,9),(9,9),(9,10),(10,10);
/*!40000 ALTER TABLE `enrolled_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_absent`
--

DROP TABLE IF EXISTS `is_absent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is_absent` (
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `excused` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `unique_student_class` (`student_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `is_absent_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `is_absent_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class1` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_absent`
--

LOCK TABLES `is_absent` WRITE;
/*!40000 ALTER TABLE `is_absent` DISABLE KEYS */;
INSERT INTO `is_absent` VALUES (1,2,0),(3,3,0),(3,4,0),(5,5,0),(7,7,0),(7,8,0),(9,9,0),(9,10,0);
/*!40000 ALTER TABLE `is_absent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_present`
--

DROP TABLE IF EXISTS `is_present`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is_present` (
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `is_present_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `is_present_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class1` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_present`
--

LOCK TABLES `is_present` WRITE;
/*!40000 ALTER TABLE `is_present` DISABLE KEYS */;
INSERT INTO `is_present` VALUES (1,1),(10,1),(2,2),(2,3),(4,4),(4,5),(5,6),(6,6),(6,7),(8,8),(8,9),(10,10);
/*!40000 ALTER TABLE `is_present` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff1`
--

DROP TABLE IF EXISTS `staff1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff1` (
  `staff_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `staff1_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff1`
--

LOCK TABLES `staff1` WRITE;
/*!40000 ALTER TABLE `staff1` DISABLE KEYS */;
INSERT INTO `staff1` VALUES (1,2020),(2,2021),(3,2022),(4,2023),(5,2024),(6,2025),(7,2026),(8,2027),(9,2028),(10,2029);
/*!40000 ALTER TABLE `staff1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_is_present`
--

DROP TABLE IF EXISTS `staff_is_present`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_is_present` (
  `staff_id` int unsigned NOT NULL,
  `working_Date` date NOT NULL,
  UNIQUE KEY `unique_staff_day` (`staff_id`,`working_Date`),
  KEY `working_Date` (`working_Date`),
  CONSTRAINT `staff_is_present_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff1` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_is_present_ibfk_2` FOREIGN KEY (`working_Date`) REFERENCES `attendance_date` (`working_Date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_is_present`
--

LOCK TABLES `staff_is_present` WRITE;
/*!40000 ALTER TABLE `staff_is_present` DISABLE KEYS */;
INSERT INTO `staff_is_present` VALUES (2,'2023-04-01'),(3,'2023-04-01'),(4,'2023-04-01'),(5,'2023-04-01'),(6,'2023-04-01'),(7,'2023-04-01'),(1,'2023-04-02'),(2,'2023-04-02'),(5,'2023-04-02'),(7,'2023-04-02'),(9,'2023-04-02'),(10,'2023-04-02'),(2,'2023-04-03'),(4,'2023-04-03'),(6,'2023-04-03'),(7,'2023-04-03'),(9,'2023-04-03'),(10,'2023-04-03'),(1,'2023-04-04'),(3,'2023-04-04'),(4,'2023-04-04'),(5,'2023-04-04'),(6,'2023-04-04'),(7,'2023-04-04'),(8,'2023-04-04'),(9,'2023-04-04'),(10,'2023-04-04'),(1,'2023-04-05'),(4,'2023-04-05'),(5,'2023-04-05'),(6,'2023-04-05'),(8,'2023-04-05'),(10,'2023-04-05'),(8,'2023-04-06'),(10,'2023-04-06'),(2,'2023-04-07'),(3,'2023-04-07'),(4,'2023-04-07'),(6,'2023-04-07'),(7,'2023-04-07'),(10,'2023-04-07'),(1,'2023-04-08'),(5,'2023-04-08'),(10,'2023-04-08'),(1,'2023-04-09'),(2,'2023-04-09'),(3,'2023-04-09'),(4,'2023-04-09'),(5,'2023-04-09'),(6,'2023-04-09'),(7,'2023-04-09'),(8,'2023-04-09'),(9,'2023-04-09'),(10,'2023-04-09'),(4,'2023-04-10'),(5,'2023-04-10'),(6,'2023-04-10'),(7,'2023-04-10');
/*!40000 ALTER TABLE `staff_is_present` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,2000),(2,2001),(3,2002),(4,2003),(5,2004),(6,2005),(7,2006),(8,2007),(9,2008),(10,2009);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,2010),(2,2011),(3,2012),(4,2013),(5,2014),(6,2015),(7,2016),(8,2017),(9,2018),(10,2019);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_is_present`
--

DROP TABLE IF EXISTS `teacher_is_present`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_is_present` (
  `teacher_id` int unsigned NOT NULL,
  `working_Date` date NOT NULL,
  UNIQUE KEY `unique_teacher_day` (`teacher_id`,`working_Date`),
  KEY `working_Date` (`working_Date`),
  CONSTRAINT `teacher_is_present_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_is_present_ibfk_2` FOREIGN KEY (`working_Date`) REFERENCES `attendance_date` (`working_Date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_is_present`
--

LOCK TABLES `teacher_is_present` WRITE;
/*!40000 ALTER TABLE `teacher_is_present` DISABLE KEYS */;
INSERT INTO `teacher_is_present` VALUES (1,'2023-04-01'),(2,'2023-04-01'),(3,'2023-04-01'),(4,'2023-04-01'),(5,'2023-04-01'),(6,'2023-04-01'),(7,'2023-04-01'),(1,'2023-04-02'),(2,'2023-04-02'),(3,'2023-04-02'),(4,'2023-04-02'),(5,'2023-04-02'),(7,'2023-04-02'),(9,'2023-04-02'),(10,'2023-04-02'),(2,'2023-04-03'),(3,'2023-04-03'),(4,'2023-04-03'),(6,'2023-04-03'),(7,'2023-04-03'),(9,'2023-04-03'),(10,'2023-04-03'),(1,'2023-04-04'),(2,'2023-04-04'),(3,'2023-04-04'),(4,'2023-04-04'),(5,'2023-04-04'),(6,'2023-04-04'),(7,'2023-04-04'),(8,'2023-04-04'),(9,'2023-04-04'),(10,'2023-04-04'),(1,'2023-04-05'),(4,'2023-04-05'),(5,'2023-04-05'),(6,'2023-04-05'),(8,'2023-04-05'),(10,'2023-04-05'),(4,'2023-04-06'),(8,'2023-04-06'),(10,'2023-04-06'),(2,'2023-04-07'),(3,'2023-04-07'),(4,'2023-04-07'),(7,'2023-04-07'),(10,'2023-04-07'),(1,'2023-04-08'),(5,'2023-04-08'),(10,'2023-04-08'),(1,'2023-04-09'),(2,'2023-04-09'),(3,'2023-04-09'),(4,'2023-04-09'),(5,'2023-04-09'),(6,'2023-04-09'),(7,'2023-04-09'),(8,'2023-04-09'),(9,'2023-04-09'),(10,'2023-04-09'),(3,'2023-04-10'),(4,'2023-04-10'),(5,'2023-04-10'),(6,'2023-04-10'),(7,'2023-04-10');
/*!40000 ALTER TABLE `teacher_is_present` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `teacher_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  UNIQUE KEY `unique_teacher_class` (`teacher_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class1` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES (3,1),(2,2),(1,3),(4,4),(6,5),(1,6),(7,7),(2,8),(8,9),(5,10);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2000,'John Doe','johndoe@example.com','password','student'),(2001,'Jane Doe','janedoe@example.com','password','student'),(2002,'Bob Smith','bobsmith@example.com','password','student'),(2003,'Alice Johnson','alicejohnson@example.com','password','student'),(2004,'Mike Brown','mikebrown@example.com','password','student'),(2005,'Newname','Newemail@example.com','passwordischanged','student'),(2006,'David Lee','davidlee@example.com','password','student'),(2007,'Mary Thompson','marythompson@example.com','password','student'),(2008,'Tom Wilson','tomwilson@example.com','password','student'),(2009,'Kate Johnson','katejohnson@example.com','password','student'),(2010,'Mark Davis','markdavis@example.com','password','teacher'),(2011,'Emily Jackson','emilyjackson@example.com','password','teacher'),(2012,'Ryan Clark','ryanclark@example.com','password','teacher'),(2013,'Sophia Green','sophiagreen@example.com','password','teacher'),(2014,'Jack Martinez','jackmartinez@example.com','password','teacher'),(2015,'Isabella Thompson','isabellathompson@example.com','password','teacher'),(2016,'Jacob Adams','jacobadams@example.com','password','teacher'),(2017,'Olivia Carter','oliviacarter@example.com','password','teacher'),(2018,'William Baker','williambaker@example.com','password','teacher'),(2019,'Ava Turner','avaturner@example.com','password','teacher'),(2020,'Chris Brown','chrisbrown@example.com','password','staff'),(2021,'Taylor Johnson','taylorjohnson@example.com','password','staff'),(2022,'Timothy Scott','timothyscott@example.com','password','staff'),(2023,'Rebecca Turner','rebeccaturner@example.com','password','staff'),(2024,'Brandon Davis','brandondavis@example.com','password','staff'),(2025,'Madison Baker','madisonbaker@example.com','password','staff'),(2026,'Benjamin Wilson','benjaminwilson@example.com','password','staff'),(2027,'Chloe Clark','chloeclark@example.com','password','staff'),(2028,'Andrew Adams','andrewadams@example.com','password','staff'),(2029,'Natalie Smith','nataliesmith@example.com','password','staff'),(2030,'Adam Lee','adamlee@example.com','password','administrator'),(2031,'Jessica King','jessicaking@example.com','password','administrator'),(2032,'Tyler Johnson','tylerjohnson@example.com','password','administrator'),(2033,'Lauren Brown','laurenbrown@example.com','password','administrator'),(2034,'Joshua Davis','joshuadavis@example.com','password','administrator'),(2035,'Kayla Baker','kaylabaker@example.com','password','administrator'),(2036,'Kevin Wilson','kevinwilson@example.com','password','administrator'),(2037,'Ashley Clark','ashleyclark@example.com','password','administrator'),(2038,'Patrick Adams','patrickadams@example.com','password','administrator'),(2039,'Emma Smith','emmasmith@example.com','password','administrator'),(2040,'John DoeNot','johndoenot@example.com','password','student');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'attendance_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `absent_without_permission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `absent_without_permission`(
    IN p_class_id INT
)
BEGIN
    DECLARE v_user_id INT;
    DECLARE v_count INT;

    -- Check if the class exists
    SELECT COUNT(*) INTO v_count FROM Class1 WHERE class_id = p_class_id;
    IF v_count = 0 THEN
        SELECT 'Error: class_id not found' AS error_message;
    ELSE
        -- Get the student_id and name of all students who are absent but not excused
        SELECT s.student_id, u.name 
        FROM Student s 
        JOIN User u ON s.user_id = u.user_id 
        WHERE s.student_id NOT IN (
            SELECT student_id 
            FROM is_Absent 
            WHERE class_id = p_class_id AND excused = TRUE
        )
        AND s.student_id IN (
            SELECT student_id 
            FROM is_Absent 
            WHERE class_id = p_class_id AND excused = FALSE
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(IN p_name VARCHAR(50), IN p_email VARCHAR(50), IN p_password VARCHAR(50), IN p_role VARCHAR(20), IN u_id INT)
BEGIN
    DECLARE user_role VARCHAR(15);
    
    -- Check if the user making the request is an administrator
    SELECT role INTO user_role
    FROM User
    WHERE user_id = u_id; 
    
    IF user_role IS NULL OR user_role != 'administrator' THEN
        SELECT 'Error: You do not have permission to perform this action.' AS '';
    ELSE
        -- If the user making the request is an administrator, insert the new user into the User table
        INSERT INTO User (name, email, password, role) VALUES (p_name, p_email, p_password, p_role);
        SELECT CONCAT('Success: New user added with ID ', LAST_INSERT_ID()) AS '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_working_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_working_date`(IN input_date DATE)
BEGIN
    -- Check if the date already exists in the attendance_date table
    IF EXISTS (SELECT * FROM attendance_date WHERE working_date = input_date) THEN
        SELECT 'Error: Date already exists in attendance_date table.' AS message;
    ELSE
        -- Insert the new working date into the attendance_date table
        INSERT INTO attendance_date (working_date) VALUES (input_date);

        -- Display success message 
        SELECT 'Successfully added working date.' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_tables`()
BEGIN
-- ----------------------------------------------------------------------------------------------------
-- ENTITIES
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE
    User (
        user_id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(20) NOT NULL,
        email VARCHAR(30) UNIQUE NOT NULL,
        password VARCHAR(20) NOT NULL,
        role VARCHAR(15) NOT NULL,
        PRIMARY KEY (user_id)
    );

CREATE TABLE
    Administrator (
        admin_id INT unsigned NOT NULL auto_increment,
        user_id INT NOT NULL UNIQUE,
        PRIMARY KEY (admin_id),
        FOREIGN KEY (user_id) REFERENCES User (user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    Teacher (
        teacher_id INT unsigned NOT NULL auto_increment,
        user_id INT NOT NULL UNIQUE,
        PRIMARY KEY (teacher_id),
        FOREIGN KEY (user_id) REFERENCES User (user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    Staff1 (
        staff_id INT unsigned NOT NULL auto_increment,
        user_id INT NOT NULL UNIQUE,
        PRIMARY KEY (staff_id),
        FOREIGN KEY (user_id) REFERENCES User (user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    Student (
        student_id INT unsigned NOT NULL auto_increment,
        user_id INT NOT NULL UNIQUE,
        PRIMARY KEY (student_id),
        FOREIGN KEY (user_id) REFERENCES User (user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    Class1 (
        class_id INT unsigned NOT NULL auto_increment,
        class_name VARCHAR(30) NOT NULL,
        class_section VARCHAR(30) NOT NULL,
        start_time DATETIME NOT NULL,
        PRIMARY KEY (class_id)
    );

CREATE TABLE
    Attendance_Date (
        working_Date DATE NOT NULL,
        PRIMARY KEY (working_Date)
    );
-- ----------------------------------------------------------------------------------------------------
-- RELATIONSHIPS
-- ----------------------------------------------------------------------------------------------------
CREATE TABLE
    enrolled_In (
        student_id INT unsigned NOT NULL,
        class_id INT unsigned NOT NULL,
        
        FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (class_id) REFERENCES Class1 (class_id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY unique_student_class (student_id, class_id)
    );

CREATE TABLE
    attends (
        student_id INT unsigned NOT NULL,
        class_id INT unsigned NOT NULL,
        
        FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (class_id) REFERENCES Class1 (class_id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY unique_student_class (student_id, class_id)
    );

CREATE TABLE
    is_Absent (
        student_id INT unsigned NOT NULL,
        class_id INT unsigned NOT NULL,
        excused BOOLEAN NOT NULL DEFAULT FALSE,
        
        FOREIGN KEY (student_id) REFERENCES Student (student_id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (class_id) REFERENCES Class1 (class_id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY unique_student_class (student_id, class_id)
    );

CREATE TABLE
    teaches (
        teacher_id INT unsigned NOT NULL,
        class_id INT unsigned NOT NULL,
        
        FOREIGN KEY (teacher_id) REFERENCES Teacher (teacher_id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (class_id) REFERENCES Class1 (class_id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY unique_teacher_class (teacher_id, class_id)
    );

CREATE TABLE
    teacher_is_Present (
        teacher_id INT unsigned NOT NULL,
        working_Date DATE NOT NULL,
        
        FOREIGN KEY (teacher_id) REFERENCES Teacher (teacher_id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (working_Date) REFERENCES Attendance_Date (working_Date) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY unique_teacher_day (teacher_id, working_Date)
    );

CREATE TABLE
    staff_is_Present (
        staff_id INT unsigned NOT NULL,
        working_Date DATE NOT NULL,
        
        FOREIGN KEY (staff_id) REFERENCES Staff1 (staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (working_Date) REFERENCES Attendance_Date (working_Date) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY unique_staff_day (staff_id, working_Date)
    );

create table 
	is_present( 
		student_id INT unsigned NOT NULL,
		class_id INT unsigned NOT NULL,
		FOREIGN KEY (student_id) REFERENCES Student(student_id) ON UPDATE CASCADE ON DELETE CASCADE, 
		FOREIGN KEY (class_id) REFERENCES Class1(class_id) ON UPDATE CASCADE ON DELETE CASCADE
	); 
  
SELECT
    CONCAT ('TABLES CREATED') AS '';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drop_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drop_all_tables`()
BEGIN

drop table teacher_is_present;

drop table staff_is_present;

drop table is_Absent;

drop table is_Present; 

drop table enrolled_In;

drop table attends;

drop table teaches;


drop table administrator;

drop table teacher;

drop table staff1;

drop table student;

drop table class1;

drop table attendance_date;

drop table user;

SELECT
    CONCAT ('TABLES DROPPED') AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `enroll_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `enroll_student`(
    IN student_id INT unsigned,
    IN class_id INT unsigned
)
BEGIN
    -- Check if the student exists
    SELECT COUNT(*) INTO @student_count FROM Student WHERE student_id = student_id;
    IF @student_count = 0 THEN
        SELECT 'Student not found';
    END IF;
    
    -- Check if the class exists
    SELECT COUNT(*) INTO @class_count FROM Class1 WHERE class_id = class_id;
    IF @class_count = 0 THEN
        SELECT 'Class not found';
    END IF;
    
    -- Enroll the student in the class
    INSERT INTO enrolled_In (student_id, class_id) VALUES (student_id, class_id);
    
    -- Output success message
    SELECT CONCAT('Student ', student_id, ' enrolled in class ', class_id) AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fill_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_data`()
BEGIN
-- ----------------------------------------------------------------------------------------------------
-- Adding 10 records per role in the User Table (FILLING DUMMY DATA)
-- ----------------------------------------------------------------------------------------------------
INSERT INTO
    User (user_id, name, email, password, role)
VALUES
    (
        2000,
        'John Doe',
        'johndoe@example.com',
        'password',
        'student'
    ),
    (
        2001,
        'Jane Doe',
        'janedoe@example.com',
        'password',
        'student'
    ),
    (
        2002,
        'Bob Smith',
        'bobsmith@example.com',
        'password',
        'student'
    ),
    (
        2003,
        'Alice Johnson',
        'alicejohnson@example.com',
        'password',
        'student'
    ),
    (
        2004,
        'Mike Brown',
        'mikebrown@example.com',
        'password',
        'student'
    ),
    (
        2005,
        'Sarah Wilson',
        'sarahwilson@example.com',
        'password',
        'student'
    ),
    (
        2006,
        'David Lee',
        'davidlee@example.com',
        'password',
        'student'
    ),
    (
        2007,
        'Mary Thompson',
        'marythompson@example.com',
        'password',
        'student'
    ),
    (
        2008,
        'Tom Wilson',
        'tomwilson@example.com',
        'password',
        'student'
    ),
    (
        2009,
        'Kate Johnson',
        'katejohnson@example.com',
        'password',
        'student'
    ),
    (
        2010,
        'Mark Davis',
        'markdavis@example.com',
        'password',
        'teacher'
    ),
    (
        2011,
        'Emily Jackson',
        'emilyjackson@example.com',
        'password',
        'teacher'
    ),
    (
        2012,
        'Ryan Clark',
        'ryanclark@example.com',
        'password',
        'teacher'
    ),
    (
        2013,
        'Sophia Green',
        'sophiagreen@example.com',
        'password',
        'teacher'
    ),
    (
        2014,
        'Jack Martinez',
        'jackmartinez@example.com',
        'password',
        'teacher'
    ),
    (
        2015,
        'Isabella Thompson',
        'isabellathompson@example.com',
        'password',
        'teacher'
    ),
    (
        2016,
        'Jacob Adams',
        'jacobadams@example.com',
        'password',
        'teacher'
    ),
    (
        2017,
        'Olivia Carter',
        'oliviacarter@example.com',
        'password',
        'teacher'
    ),
    (
        2018,
        'William Baker',
        'williambaker@example.com',
        'password',
        'teacher'
    ),
    (
        2019,
        'Ava Turner',
        'avaturner@example.com',
        'password',
        'teacher'
    ),
    (
        2020,
        'Chris Brown',
        'chrisbrown@example.com',
        'password',
        'staff'
    ),
    (
        2021,
        'Taylor Johnson',
        'taylorjohnson@example.com',
        'password',
        'staff'
    ),
    (
        2022,
        'Timothy Scott',
        'timothyscott@example.com',
        'password',
        'staff'
    ),
    (
        2023,
        'Rebecca Turner',
        'rebeccaturner@example.com',
        'password',
        'staff'
    ),
    (
        2024,
        'Brandon Davis',
        'brandondavis@example.com',
        'password',
        'staff'
    ),
    (
        2025,
        'Madison Baker',
        'madisonbaker@example.com',
        'password',
        'staff'
    ),
    (
        2026,
        'Benjamin Wilson',
        'benjaminwilson@example.com',
        'password',
        'staff'
    ),
    (
        2027,
        'Chloe Clark',
        'chloeclark@example.com',
        'password',
        'staff'
    ),
    (
        2028,
        'Andrew Adams',
        'andrewadams@example.com',
        'password',
        'staff'
    ),
    (
        2029,
        'Natalie Smith',
        'nataliesmith@example.com',
        'password',
        'staff'
    ),
    (
        2030,
        'Adam Lee',
        'adamlee@example.com',
        'password',
        'administrator'
    ),
    (
        2031,
        'Jessica King',
        'jessicaking@example.com',
        'password',
        'administrator'
    ),
    (
        2032,
        'Tyler Johnson',
        'tylerjohnson@example.com',
        'password',
        'administrator'
    ),
    (
        2033,
        'Lauren Brown',
        'laurenbrown@example.com',
        'password',
        'administrator'
    ),
    (
        2034,
        'Joshua Davis',
        'joshuadavis@example.com',
        'password',
        'administrator'
    ),
    (
        2035,
        'Kayla Baker',
        'kaylabaker@example.com',
        'password',
        'administrator'
    ),
    (
        2036,
        'Kevin Wilson',
        'kevinwilson@example.com',
        'password',
        'administrator'
    ),
    (
        2037,
        'Ashley Clark',
        'ashleyclark@example.com',
        'password',
        'administrator'
    ),
    (
        2038,
        'Patrick Adams',
        'patrickadams@example.com',
        'password',
        'administrator'
    ),
    (
        2039,
        'Emma Smith',
        'emmasmith@example.com',
        'password',
        'administrator'
    );
--  ---------------------------------------------------------------------------------------------------
-- Inserting User Table records into the sub-tables according to the role
-- ----------------------------------------------------------------------------------------------------
-- Inserting into the Student table
INSERT into
    Student (user_id)
SELECT
    user_id
FROM
    User
WHERE
    role='student';

-- Inserting into the Teacher table
INSERT INTO
    Teacher (user_id)
SELECT
    user_id
FROM
    User
WHERE
    role='teacher';

-- Inserting into the Administrator table
INSERT INTO
    Administrator (user_id)
SELECT
    user_id
FROM
    User
WHERE
    role='administrator';

-- Inserting into the Staff table
INSERT INTO
    Staff1 (user_id)
SELECT
    user_id
FROM
    User
WHERE
    role='staff';

--  ---------------------------------------------------------------------------------------------------------
-- Inserting records into the Class1, Attendance_Date ENTITY tables
-- ----------------------------------------------------------------------------------------------------------
-- Inserting into the Class1 table
INSERT INTO
    Class1 (class_name, class_section, start_time)
VALUES
    ('Math', 'A', '2023-04-10 09:00:00'),
    ('Science', 'B', '2023-04-10 11:00:00'),
    ('English', 'C', '2023-04-10 13:00:00'),
    ('History', 'A', '2023-04-11 10:00:00'),
    ('Math', 'B', '2023-04-11 12:00:00'),
    ('Science', 'C', '2023-04-11 14:00:00'),
    ('English', 'A', '2023-04-12 11:00:00'),
    ('History', 'B', '2023-04-12 13:00:00'),
    ('Math', 'C', '2023-04-12 15:00:00'),
    ('Science', 'A', '2023-04-13 10:00:00');

-- Inserting into the Attendance_Date table
INSERT INTO
    Attendance_Date (working_Date)
VALUES
    ('2023-04-01'),
    ('2023-04-02'),
    ('2023-04-03'),
    ('2023-04-04'),
    ('2023-04-05'),
    ('2023-04-06'),
    ('2023-04-07'),
    ('2023-04-08'),
    ('2023-04-09'),
    ('2023-04-10');

--  ---------------------------------------------------------------------------------------------------------
-- Inserting records into the RELATIONSHIP tables
-- ----------------------------------------------------------------------------------------------------------
-- Inserting records into the enrolled_in table: DESCRIBES WHICH STUDENT IS ENROLLED IN WHICH CLASS
INSERT INTO
    enrolled_In (student_id, class_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 3),
    (3, 4),
    (4, 4),
    (4, 5),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 7),
    (7, 7),
    (7, 8),
    (8, 8),
    (8, 9),
    (9, 9),
    (9, 10),
    (10, 10),
    (10, 1);

-- Inserting records into the attends table: DESCRIBES WHICH STUDENT ATTENDED WHICH CLASS
INSERT INTO
    attends (student_id, class_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 2),
    (2, 3),
    (3, 10),
    (3, 9),
    (4, 4),
    (4, 5),
    (5, 1),
    (5, 6),
    (6, 6),
    (6, 7),
    (8, 8),
    (8, 9),
    (9, 4),
    (10, 10),
    (10, 1);

-- Inserting records into the teaches table: DESCRIBES WHICH TEACHER TEACHES WHICH CLASS
INSERT INTO
    Teaches (teacher_id, class_id)
VALUES
    (1, 6),
    (1, 3),
    (8, 9),
    (2, 2),
    (2, 8),
    (3, 1),
    (4, 4),
    (5, 10),
    (6, 5),
    (7, 7);

-- Inserting into the teacher_is_Present table: USED TO DESCRIBE WHICH TEACHER WAS PRESENT ON WHICH DATE
INSERT INTO
    teacher_is_Present (working_date, teacher_id)
values
    ('2023-04-01', 1),
    ('2023-04-01', 2),
    ('2023-04-01', 3),
    ('2023-04-01', 4),
    ('2023-04-01', 5),
    ('2023-04-01', 6),
    ('2023-04-01', 7),
    ('2023-04-02', 1),
    ('2023-04-02', 2),
    ('2023-04-02', 3),
    ('2023-04-02', 4),
    ('2023-04-02', 5),
    ('2023-04-02', 10),
    ('2023-04-02', 9), 
    ('2023-04-02', 7),
    ('2023-04-03', 2),
    ('2023-04-03', 3),
    ('2023-04-03', 10),
    ('2023-04-03', 9),
    ('2023-04-03', 4),
    ('2023-04-03', 6),
    ('2023-04-03', 7),
    ('2023-04-04', 2),
    ('2023-04-04', 4),
    ('2023-04-04', 6),
    ('2023-04-04', 8),
    ('2023-04-04', 10),
    ('2023-04-04', 1),
    ('2023-04-04', 3),
    ('2023-04-04', 5),
    ('2023-04-04', 7),
    ('2023-04-04', 9),
    ('2023-04-05', 1),
    ('2023-04-05', 4),
    ('2023-04-05', 8),
    ('2023-04-05', 10),
    ('2023-04-05', 5),
    ('2023-04-05', 6),
    ('2023-04-06', 10),
    ('2023-04-06', 4),
    ('2023-04-06', 8),
    ('2023-04-07', 10),
    ('2023-04-07', 2),
    ('2023-04-07', 4),
    ('2023-04-07', 7),
    ('2023-04-07', 3),
    ('2023-04-08', 1),
    ('2023-04-08', 5),
    ('2023-04-08', 10),
    ('2023-04-09', 3),
    ('2023-04-09', 6),
    ('2023-04-09', 9),
    ('2023-04-09', 5),
    ('2023-04-09', 1),
    ('2023-04-09', 2),
    ('2023-04-09', 4),
    ('2023-04-09', 7),
    ('2023-04-09', 8),
    ('2023-04-09', 10),
    ('2023-04-10', 4),
    ('2023-04-10', 6),
    ('2023-04-10', 5),
    ('2023-04-10', 3),
    ('2023-04-10', 7);

-- Inserting into the staff_is_Present table: USED TO DESCRIBE WHICH STAFF WAS PRESENT ON WHICH DATE
INSERT INTO
    staff_is_Present (working_date, staff_id)
VALUES
    ('2023-04-01', 2),
    ('2023-04-01', 3),
    ('2023-04-01', 4),
    ('2023-04-01', 5),
    ('2023-04-01', 6),
    ('2023-04-01', 7),
    ('2023-04-02', 1),
    ('2023-04-02', 2),
    ('2023-04-02', 5),
    ('2023-04-02', 10),
    ('2023-04-02', 9),
    ('2023-04-02', 7),
    ('2023-04-03', 2),
    ('2023-04-03', 10),
    ('2023-04-03', 9),
    ('2023-04-03', 4),
    ('2023-04-03', 6),
    ('2023-04-03', 7),
    ('2023-04-04', 4),
    ('2023-04-04', 6),
    ('2023-04-04', 8),
    ('2023-04-04', 10),
    ('2023-04-04', 1),
    ('2023-04-04', 3),
    ('2023-04-04', 5),
    ('2023-04-04', 7),
    ('2023-04-04', 9),
    ('2023-04-05', 1),
    ('2023-04-05', 4),
    ('2023-04-05', 8),
    ('2023-04-05', 10),
    ('2023-04-05', 5),
    ('2023-04-05', 6),
    ('2023-04-06', 10),
    ('2023-04-06', 8),
    ('2023-04-07', 10),
    ('2023-04-07', 2),
    ('2023-04-07', 4),
    ('2023-04-07', 7),
    ('2023-04-07', 3),
    ('2023-04-07', 6),
    ('2023-04-08', 1),
    ('2023-04-08', 5),
    ('2023-04-08', 10),
    ('2023-04-09', 3),
    ('2023-04-09', 6),
    ('2023-04-09', 9),
    ('2023-04-09', 5),
    ('2023-04-09', 1),
    ('2023-04-09', 2),
    ('2023-04-09', 4),
    ('2023-04-09', 7),
    ('2023-04-09', 8),
    ('2023-04-09', 10),
    ('2023-04-10', 4),
    ('2023-04-10', 6),
    ('2023-04-10', 5),
    ('2023-04-10', 7);

-- Inserting into the is_present table: USED TO CALCULATE THE ENROLLED STUDENTS PRESENT IN THE CLASS    
INSERT INTO is_present (student_id, class_id)
SELECT e.student_id, e.class_id
FROM enrolled_in e
INNER JOIN attends a ON e.student_id = a.student_id AND e.class_id = a.class_id;

-- Inserting into the is_Absent table: USED TO CALCULATE ABSENTEES
INSERT INTO
    is_Absent (student_id, class_id)
SELECT
    e.student_id,
    e.class_id
FROM
    enrolled_in e
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            attends a
        WHERE
            a.student_id=e.student_id
            AND a.class_id=e.class_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_attendance_summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attendance_summary`(IN input_month INT, IN input_year INT, IN input_id INT, IN input_role VARCHAR(15))
BEGIN
DECLARE total_days INT;
DECLARE present_days INT;
DECLARE id_exists INT;
-- Check if the input role is teacher or staff
IF input_role = 'teacher' THEN
    -- Check if the input teacher_id exists in the database
    SELECT COUNT(*) INTO id_exists FROM teacher WHERE teacher_id = input_id;
 
    IF id_exists = 0 THEN
        SELECT 'Invalid teacher ID entered.' AS attendance_summary;
    ELSE
        -- Find the total number of working days in the input month and year for the teacher
        SELECT COUNT(*) INTO total_days FROM attendance_date WHERE MONTH(working_date) = input_month AND YEAR(working_date) = input_year;

        -- Find the number of days the teacher was present in the input month and year
        SELECT COUNT(*) INTO present_days FROM teacher_is_present WHERE teacher_id = input_id AND MONTH(working_date) = input_month AND YEAR(working_date) = input_year;

        -- Display the attendance summary
        SELECT CONCAT('Out of ', total_days, ' working days in ', DATE_FORMAT(CONCAT(input_year, '-', input_month, '-01'), '%M %Y'), ', Teacher with ID ', input_id, ' was present for ', present_days, ' days.') AS attendance_summary;
    END IF;

ELSEIF input_role = 'staff' THEN
    -- Check if the input staff_id exists in the database
    SELECT COUNT(*) INTO id_exists FROM staff WHERE staff_id = input_id;

    IF id_exists = 0 THEN
        SELECT 'Invalid staff ID entered.' AS attendance_summary;
    ELSE
        -- Find the total number of working days in the input month and year for the staff
        SELECT COUNT(*) INTO total_days FROM attendance_date WHERE MONTH(working_date) = input_month AND YEAR(working_date) = input_year;

        -- Find the number of days the staff was present in the input month and year
        SELECT COUNT(*) INTO present_days FROM staff_is_present WHERE staff_id = input_id AND MONTH(working_date) = input_month AND YEAR(working_date) = input_year;

        -- Display the attendance summary
        SELECT CONCAT('Out of ', total_days, ' working days in ', DATE_FORMAT(CONCAT(input_year, '-', input_month, '-01'), '%M %Y'), ', Staff with ID ', input_id, ' was present for ', present_days, ' days.') AS attendance_summary;
    END IF;

ELSE
    SELECT 'Invalid role specified. Please enter either "teacher" or "staff".' AS attendance_summary;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mark_staff_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_staff_attendance`(IN p_staff_id INT, IN p_working_date DATE, IN u_id INT)
BEGIN
    DECLARE user_role VARCHAR(15);

    -- Check if the user making the request is an administrator
    SELECT role INTO user_role
    FROM User
    WHERE user_id = u_id;

    IF user_role IS NULL OR user_role != 'administrator' THEN
        SELECT 'Error: You do not have permission to perform this action.' AS '';
    ELSE 
        -- Check if the staff member exists
        IF NOT EXISTS (SELECT * FROM Staff WHERE staff_id = p_staff_id) THEN
            SELECT 'Error: Staff member does not exist.' AS '';
        END IF;

        -- Check if the working date exists in the Working_Dates table
        IF NOT EXISTS (SELECT * FROM attendance_date WHERE working_date = p_working_date) THEN
            SELECT 'Error: Working date does not exist.' AS '';
        END IF;

        -- Check if the staff member is already present on the given working date
        IF EXISTS (SELECT * FROM Staff_Is_Present WHERE staff_id = p_staff_id AND working_date = p_working_date) THEN
            SELECT 'Error: Staff member is already marked present on this date.' AS '';
        END IF;

        -- If all checks pass, insert the staff member's attendance into Staff_Is_Present table
        INSERT INTO Staff_Is_Present (staff_id, working_date) VALUES (p_staff_id, p_working_date);
        SELECT CONCAT('Success: Staff member with ID ', p_staff_id, ' marked present on ', p_working_date) AS '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mark_student_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_student_attendance`(
    IN t_id INT, 
    IN c_id INT,
    IN s_id INT
)
BEGIN
    DECLARE teach_count INT;
    DECLARE class_count INT; 
    DECLARE student_count INT;
    DECLARE present_count INT;

    SELECT COUNT(*) INTO teach_count FROM teaches WHERE teacher_id = t_id AND class_id = c_id;
    SELECT COUNT(*) INTO class_count FROM Class1 WHERE class_id = c_id;
    SELECT COUNT(*) INTO student_count FROM Student WHERE student_id = s_id;
    SELECT COUNT(*) INTO present_count FROM is_Absent WHERE student_id = s_id AND class_id = c_id;

    IF teach_count = 0 THEN
        SELECT 'Error: Teacher is not authorized to mark attendance for this class.' AS '';
    ELSEIF class_count = 0 THEN
        SELECT 'Error: Invalid class ID.' AS '';
    ELSEIF student_count = 0 THEN
        SELECT 'Error: Invalid student ID.' AS '';
    ELSEIF present_count > 0 THEN
        SELECT 'Error: Attendance already marked for this student in the given class.' AS '';
    ELSE
        INSERT INTO is_Absent (student_id, class_id) VALUES (s_id, c_id);
        SELECT 'Attendance marked successfully.' AS '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mark_teacher_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mark_teacher_attendance`(IN p_teacher_id INT, IN p_working_date DATE, IN u_id INT)
BEGIN
    DECLARE user_role VARCHAR(15);
    
    -- Check if the user making the request is an administrator
    SELECT role INTO user_role
    FROM User
    WHERE user_id = u_id;
    
    IF user_role IS NULL OR user_role != 'administrator' THEN
        SELECT 'Error: You do not have permission to perform this action.' AS ''; 
    ELSE
        -- Check if the teacher exists
        IF NOT EXISTS (SELECT * FROM Teacher WHERE teacher_id = p_teacher_id) THEN
            SELECT 'Error: Teacher does not exist.' AS '';
        -- Check if the working date exists in the Working_Dates table
        ELSEIF NOT EXISTS (SELECT * FROM attendance_date WHERE working_date = p_working_date) THEN
            SELECT 'Error: Working date does not exist.' AS '';
        -- Check if the teacher is already present on the given working date
        ELSEIF EXISTS (SELECT * FROM Teacher_Is_Present WHERE teacher_id = p_teacher_id AND working_date = p_working_date) THEN
            SELECT 'Error: Teacher is already marked present on this date.' AS '';
        -- If all checks pass, insert the teacher's attendance into Teacher_Is_Present table
        ELSE
            INSERT INTO Teacher_Is_Present (teacher_id, working_date) VALUES (p_teacher_id, p_working_date);
            SELECT CONCAT('Success: Teacher with ID ', p_teacher_id, ' marked present on ', p_working_date) AS '';
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_attendance_count_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_attendance_count_by_name`(
    IN student_name_param VARCHAR(20)
)
BEGIN
    -- check if the student name exists in the user table
    IF NOT EXISTS (
        SELECT user_id FROM user
        WHERE name = student_name_param
    ) THEN
        SELECT 'The given student name does not exist.' AS '';
    ELSE 
        SELECT COUNT(is_present.class_id) AS attendance_count
        FROM user
        INNER JOIN student ON user.user_id = student.user_id
        LEFT JOIN is_present ON student.student_id = is_present.student_id
        WHERE user.name = student_name_param
        GROUP BY user.name;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_students_by_attendance_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_students_by_attendance_count`(
    IN min_attendance_count_param INT
)
BEGIN
    SELECT user.name, COUNT(is_present.class_id) AS attendance_count
    FROM user 
    INNER JOIN student ON user.user_id = student.user_id
    LEFT JOIN is_present ON student.student_id = is_present.student_id
    GROUP BY user.name
    HAVING COUNT(is_present.class_id) >= min_attendance_count_param
    ORDER BY COUNT(is_present.class_id) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_staff_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_staff_info`(
    IN p_staff_id INT,
    IN p_name VARCHAR(20),
    IN p_email VARCHAR(30),
    IN p_password VARCHAR(20)
)
BEGIN
    DECLARE user_id INT;
    
    -- check if the provided staff_id exists in the Staff1 table
    SELECT user_id INTO user_id FROM Staff1 WHERE staff_id = p_staff_id;
    IF user_id IS NULL THEN
        SELECT 'Error: Provided staff_id does not exist' AS '!ERROR!';
    END IF;
    
    -- find the corresponding user_id for the given staff_id
    SELECT user_id INTO user_id FROM Staff1 WHERE staff_id = p_staff_id;
    
    -- update the corresponding user's information
    UPDATE User SET name = p_name, email = p_email, password = p_password WHERE user_id = user_id;
    
    SELECT 'Your information was updated successfully!' AS '';
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_student_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_student_info`(
    IN p_student_id INT,
    IN p_name VARCHAR(20),
    IN p_email VARCHAR(30),
    IN p_password VARCHAR(20)
)
BEGIN
    DECLARE user_id INT; 
    
    -- check if the provided student_id exists in the Student table
    SELECT user_id INTO user_id FROM Student WHERE student_id = p_student_id;
    IF user_id IS NULL THEN
        SELECT 'Error: Provided student_id does not exist' AS '!ERROR!';
    END IF;
    
    -- find the corresponding user_id for the given student_id
    SELECT user_id INTO user_id FROM Student WHERE student_id = p_student_id;
    
    -- update the corresponding user's information
    UPDATE User SET name = p_name, email = p_email, password = p_password WHERE user_id = user_id;
    
    SELECT 'Your information was updated successfully!' AS '';
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_teacher_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_teacher_info`(
    IN p_teacher_id INT,
    IN p_name VARCHAR(20),
    IN p_email VARCHAR(30),
    IN p_password VARCHAR(20)
)
BEGIN
    DECLARE user_id INT;
     
    -- check if the provided teacher_id exists in the Teacher table
    SELECT user_id INTO user_id FROM Teacher WHERE teacher_id = p_teacher_id;
    IF user_id IS NULL THEN
        SELECT 'Error: Provided teacher_id does not exist' AS '!ERROR!';
    END IF;
    
    -- find the corresponding user_id for the given teacher_id
    SELECT user_id INTO user_id FROM Teacher WHERE teacher_id = p_teacher_id;
    
    -- update the corresponding user's information
    UPDATE User SET name = p_name, email = p_email, password = p_password WHERE user_id = user_id;
    
    SELECT 'Your information was updated successfully!' AS '';
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(IN p_user_id INT, IN p_name VARCHAR(50), IN p_email VARCHAR(50), IN p_password VARCHAR(50), IN p_role VARCHAR(20), IN u_id INT)
BEGIN
    DECLARE user_role VARCHAR(15);
    
    -- Check if the user making the request is an administrator
    SELECT role INTO user_role
    FROM User
    WHERE user_id = u_id;
     
    -- Check if the user ID entered exists in the User table
    IF NOT EXISTS(SELECT * FROM User WHERE user_id = p_user_id) THEN
        SELECT 'Error: User ID does not exist.' AS '';
    ELSEIF user_role IS NULL OR user_role != 'administrator' THEN
        SELECT 'Error: You do not have permission to perform this action.' AS '';
    ELSE
        -- If the user making the request is an administrator and the user ID exists, update the user's details in the User table
        UPDATE User
        SET name = p_name, email = p_email, password = p_password, role = p_role
        WHERE user_id = p_user_id;
        SELECT CONCAT('Success: User ', p_user_id, ' updated.') AS '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(IN p_email VARCHAR(30), IN p_password VARCHAR(20))
BEGIN

	DECLARE user_role VARCHAR(15);
    DECLARE u_id INT;
    -- Check if user exists and verify password
    SELECT role, user_id INTO user_role, u_id 
    FROM User
    WHERE email = p_email AND password = p_password;

    IF user_role IS NULL THEN
        SELECT 'Invalid email or password.' AS '';
    ELSE
        SELECT 'Login Successful!!' AS '';
        -- Display message according to user role
        IF user_role = 'administrator' THEN
            
            SELECT CONCAT('Welcome Administrator! Your credentials are: ') AS '', CONCAT(user_id) AS 'User ID', CONCAT(name) AS 'Name', CONCAT(email) AS 'Email', CONCAT(password) AS 'Password' FROM User WHERE user_id = u_id;
            SELECT CONCAT('You are allowed to do the following:') AS '';
			
            SELECT CONCAT('Add a new user.') AS 'FUNCTIONALITY', CONCAT('call add_user(Name, Email, Password, Role, Your User ID(important))') AS 'SYNTAX';
			
            SELECT CONCAT('Update user details.') AS 'FUNCTIONALITY', CONCAT('call update_user(User ID, New_Name, New_Email, New_Password, New_Role, Your User ID(important))') AS 'SYNTAX';
            
            SELECT '*** Attendance Date Table ***' AS '';
            SELECT CONCAT('Working Date: ', working_Date) AS 'Working Date' FROM Attendance_Date;
            
            SELECT '*** Teacher Table ***' AS '';
			SELECT CONCAT('Teacher ID: ', teacher_id) AS 'Teacher ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Teacher;
            
            SELECT CONCAT('Mark Teacher Attendance.') AS 'FUNCTIONALITY', CONCAT('call mark_teacher_attendance(Teacher ID, Working Date(YYYY-MM-DD), Your User ID(important))') AS 'SYNTAX';
            
            SELECT '*** Staff Table ***' AS '';
			SELECT CONCAT('Staff ID: ', staff_id) AS 'Staff ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM staff1;
            
            SELECT CONCAT('Mark Staff Attendance.') AS 'FUNCTIONALITY', CONCAT('call mark_staff_attendance(Staff ID, Working Date(YYYY-MM-DD), Your User ID(important))') AS 'SYNTAX';
			 
            SELECT '*** Student Table ***' AS '';
			SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Student;
            
            SELECT CONCAT('Check Students who were absent without permission.') AS 'FUNCTIONALITY', CONCAT('call absent_without_permission(Class ID)') AS 'SYNTAX';
			
            SELECT CONCAT('Add a working date.') AS 'FUNCTIONALITY', CONCAT('add_working_date(YYYY-MM-DD)') AS 'SYNTAX';
            
            SELECT CONCAT('Get Attendance Summary') AS 'FUNCTIONALITY', CONCAT('get_attendance_summary(Month(MM), YEAR(YYYY), Teacher/Staff ID, Role)') AS 'SYNTAX';
            
            SELECT CONCAT('Get Attendance Rate of a class') AS 'FUNCTIONALITY', CONCAT('view_attendance_percentage(Class Name)') AS 'SYNTAX';
            
            SELECT CONCAT('Get Attendance Count of a student') AS 'FUNCTIONALITY', CONCAT('search_attendance_count_by_name(Student Name)') AS 'SYNTAX';
				
        ELSEIF user_role = 'teacher' THEN
            SELECT CONCAT('Welcome Teacher! Your credentials are: ') AS '', CONCAT(teacher_id) AS 'Teacher ID' FROM Teacher where user_id = u_id;
            SELECT CONCAT(name) AS 'Name', CONCAT(email) AS 'Email', CONCAT(password) AS 'Password' FROM User WHERE user_id = u_id;
            
            SELECT CONCAT('Update your information.') AS 'FUNCTIONALITY', CONCAT('call update_teacher_info(Your Teacher ID, New Name, New Email, New Password)') AS 'SYNTAX';
            
            SELECT '*** Teaches Table : DESCRIBES WHICH TEACHER TEACHES WHICH CLASS ***' AS '';
			SELECT CONCAT('Teacher ID: ', teacher_id) AS 'Teacher ID', CONCAT('Class ID: ', class_id) AS 'Class ID' FROM teaches;
            
			SELECT '*** Class Table ***' AS '';
			SELECT CONCAT('Class ID: ', class_id) AS 'Class ID', CONCAT('Class Name: ', class_name) AS 'Class Name', CONCAT('Class Section: ', class_section) AS 'Class Section', CONCAT('Start Time: ', start_time) AS 'Start Time' FROM Class1;
            
            SELECT '*** Student Table ***' AS '';
            SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Student;
            
            SELECT CONCAT('Mark Student Attendance.') AS 'FUNCTIONALITY', CONCAT('call mark_student_attendance(Your Teacher ID, Student ID, Class ID of your class)') AS 'SYNTAX';
            
            SELECT CONCAT('View Attendance Report by Class.') AS 'FUNCTIONALITY', CONCAT('view_attendance_report_by_Class(Name of the Class)') AS 'SYNTAX';
            
            SELECT CONCAT('Get Attendance Count of a student') AS 'FUNCTIONALITY', CONCAT('search_attendance_count_by_name(Student Name)') AS 'SYNTAX';
            
        ELSEIF user_role = 'staff' THEN
            SELECT CONCAT('Welcome Staff! Your credentials are: ') AS '', CONCAT(staff_id) AS 'Staff ID' FROM Staff1 where user_id = u_id;
            SELECT CONCAT(name) AS 'Name', CONCAT(email) AS 'Email', CONCAT(password) AS 'Password' FROM User WHERE user_id = u_id;
		
        ELSEIF user_role = 'student' THEN
            SELECT CONCAT('Welcome Student! Your credentials are: ') AS '', CONCAT(student_id) AS 'Student ID' FROM Student where user_id - u_id;
            SELECT CONCAT(name) AS 'Name', CONCAT(email) AS 'Email', CONCAT(password) AS 'Password' FROM User WHERE user_id = u_id;
            
        END IF;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_attendance_percentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_attendance_percentage`(IN class_name_param VARCHAR(30))
BEGIN
    DECLARE total_students INT;
    DECLARE present_students INT;
    DECLARE absent_students INT;
    DECLARE attendance_percentage FLOAT;

    -- Get the total number of students in the class
    SELECT COUNT(DISTINCT student_id) INTO total_students
    FROM enrolled_In
    WHERE class_id IN (SELECT class_id FROM Class1 WHERE class_name = class_name_param);

    -- Get the number of students who are present
    SELECT COUNT(DISTINCT student_id) INTO present_students
    FROM is_Absent
    WHERE class_id IN (SELECT class_id FROM Class1 WHERE class_name = class_name_param) AND excused = FALSE;

    -- Get the number of students who are absent
    SET absent_students = total_students - present_students;

    -- Calculate the attendance percentage
    IF total_students > 0 THEN
        SET attendance_percentage = (present_students / total_students) * 100;
    ELSE
        SET attendance_percentage = 0;
    END IF;

    -- Output the results 
    SELECT CONCAT('Attendance Percentage for ', class_name_param, ':') AS 'Attendance Report';
    SELECT CONCAT(present_students, ' Present,', absent_students, ' Absent') AS 'Attendance Count';
    SELECT CONCAT(attendance_percentage, '%') AS 'Attendance Percentage';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_attendance_report_by_Class` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_attendance_report_by_Class`(IN className VARCHAR(30))
BEGIN
  DECLARE classExists INT;
  
  -- check if the class name exists in the class1 table
  SELECT COUNT(*) INTO classExists FROM class1 WHERE class_name = className;
  
  IF classExists = 0 THEN
    -- if the class name does not exist, return an error message
    SELECT 'Error: Class name does not exist.';
  ELSE
    -- otherwise, run the query to get the attendance report
    SELECT 
      s.student_id, 
      s.user_id, 
      u.name,
      COUNT(*) AS total_classes, 
      COUNT(IF(a.class_id = c.class_id, 1, NULL)) AS present_count, 
      COUNT(*) - COUNT(IF(a.class_id = c.class_id, 1, NULL)) AS absent_count
    FROM 
      is_present a 
      JOIN student s ON a.student_id = s.student_id 
      JOIN class1 c ON a.class_id = c.class_id
      JOIN user u ON s.user_id = u.user_id 
    WHERE 
      c.class_name = className 
    GROUP BY 
      s.student_id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_data`()
BEGIN
    SELECT '*** User Table ***' AS '';
    SELECT CONCAT('User ID: ', user_id) AS 'User ID', CONCAT('Name: ', name) AS 'Name', CONCAT('Email: ', email) AS 'Email', CONCAT('Password: ', password) AS 'Password', CONCAT('Role: ', role) AS 'Role' FROM User;

    SELECT '*** Administrator Table ***' AS '';
    SELECT CONCAT('Admin ID: ', admin_id) AS 'Admin ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Administrator;
 
    SELECT '*** Teacher Table ***' AS '';
    SELECT CONCAT('Teacher ID: ', teacher_id) AS 'Teacher ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Teacher;

    SELECT '*** Staff Table ***' AS '';
    SELECT CONCAT('Staff ID: ', staff_id) AS 'Staff ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Staff1;

    SELECT '*** Student Table ***' AS '';
    SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('User ID: ', user_id) AS 'User ID' FROM Student;

    SELECT '*** Class Table ***' AS '';
    SELECT CONCAT('Class ID: ', class_id) AS 'Class ID', CONCAT('Class Name: ', class_name) AS 'Class Name', CONCAT('Class Section: ', class_section) AS 'Class Section', CONCAT('Start Time: ', start_time) AS 'Start Time' FROM Class1;

    SELECT '*** Attendance Date Table ***' AS '';
    SELECT CONCAT('Working Date: ', working_Date) AS 'Working Date' FROM Attendance_Date;

    SELECT '*** Enrolled In Table : DESCRIBES WHICH STUDENT IS ENROLLED IN WHICH CLASS ***' AS '';
    SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('Class ID: ', class_id) AS 'Class ID' FROM enrolled_In;

    SELECT '*** Attends Table : DESCRIBES WHICH STUDENT ATTENDED WHICH CLASS ***' AS '';
    SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('Class ID: ', class_id) AS 'Class ID' FROM attends;

    SELECT '*** Teaches Table : DESCRIBES WHICH TEACHER TEACHES WHICH CLASS ***' AS '';
    SELECT CONCAT('Teacher ID: ', teacher_id) AS 'Teacher ID', CONCAT('Class ID: ', class_id) AS 'Class ID' FROM teaches;
	
    SELECT '*** Is Absent Table : DESCRIBES WHICH STUDENT WAS ABSENT IN WHICH CLASS ***' AS '';
    SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('Class ID: ', class_id) AS 'Class ID', CONCAT('Excused: ', excused) AS 'Excused' FROM is_Absent;
    
    SELECT '*** Is Present Table : DESCRIBES WHICH STUDENT WAS PRESENT IN WHICH CLASS but only the enrolled ones***' AS '';
    SELECT CONCAT('Student ID: ', student_id) AS 'Student ID', CONCAT('Class ID: ', class_id) AS 'Class ID'FROM is_present;
    
    SELECT '*** Teacher is Present Table ***' AS '';
    SELECT CONCAT('Teacher ID: ', teacher_id) AS 'Teacher ID', CONCAT('Working Date: ', working_Date) AS 'Working Date' FROM teacher_is_Present;

    SELECT '*** Staff is Present Table ***' AS '';
    SELECT CONCAT('Staff ID: ', staff_id) AS 'Staff ID', CONCAT('Working Date: ', working_Date) AS 'Working Date' FROM staff_is_Present;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_weekly_attendance_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_weekly_attendance_report`(
    IN student_id_param INT,
    IN start_date_param DATE
)
BEGIN
    DECLARE end_date_param DATE;
    DECLARE no_classes_scheduled BOOLEAN DEFAULT FALSE;
    DECLARE student_exists BOOLEAN DEFAULT FALSE;
    
    -- check if the student exists in the student table
    SELECT 1 INTO student_exists FROM student WHERE student_id = student_id_param;
    
    -- return error message if the student does not exist
    IF NOT student_exists THEN
        SELECT 'ERROR: The specified student does not exist.' AS '';
    END IF;
    
    SET end_date_param = DATE_ADD(start_date_param, INTERVAL 7 DAY);

    -- select class name, start time, and count of attendance for the given student in the given time period
    SELECT class1.class_name, class1.start_time, COUNT(attends.class_id) AS attendance_count
    FROM class1
    LEFT JOIN attends ON class1.class_id = attends.class_id
    WHERE
        attends.student_id = student_id_param
        AND class1.start_time BETWEEN start_date_param AND end_date_param
    GROUP BY class1.class_id
    ORDER BY class1.start_time ASC;
    
    -- check if there were no classes scheduled in the given time period
    IF NOT EXISTS (
        SELECT class_id FROM class1
        WHERE start_time BETWEEN start_date_param AND end_date_param
    ) THEN
        SET no_classes_scheduled = TRUE;
    END IF;
    
    -- display message if there were no classes scheduled
    IF no_classes_scheduled THEN
        SELECT 'No classes scheduled in the given time period.' AS '';
    END IF;
    
    -- display message if the student didn't attend any class in the given time period
    IF NOT EXISTS (
        SELECT attends.student_id FROM attends
        INNER JOIN class1 ON attends.class_id = class1.class_id
        WHERE
            attends.student_id = student_id_param
            AND class1.start_time BETWEEN start_date_param AND end_date_param 
    ) THEN
        SELECT 'The student did not attend any class in the given time period.' AS '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12  0:29:11
