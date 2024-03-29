CREATE DATABASE  IF NOT EXISTS `car_sharing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `car_sharing`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: car_sharing
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `accidents`
--

DROP TABLE IF EXISTS `accidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accidents` (
  `START_DATE` timestamp NOT NULL,
  `CAR_ID` int NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `MISCHANCE_ID` int NOT NULL,
  PRIMARY KEY (`MISCHANCE_ID`,`START_DATE`,`CAR_ID`,`CLIENT_ID`),
  KEY `START_DATE` (`START_DATE`),
  KEY `CAR_ID` (`CAR_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `accidents_ibfk_1` FOREIGN KEY (`START_DATE`) REFERENCES `ride` (`START_DATE`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `accidents_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `ride` (`CAR_ID`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `accidents_ibfk_3` FOREIGN KEY (`CLIENT_ID`) REFERENCES `ride` (`CLIENT_ID`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `accidents_ibfk_4` FOREIGN KEY (`MISCHANCE_ID`) REFERENCES `mischance` (`MISCHANCE_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidents`
--

LOCK TABLES `accidents` WRITE;
/*!40000 ALTER TABLE `accidents` DISABLE KEYS */;
INSERT INTO `accidents` VALUES ('2018-02-01 23:43:00',2,116,1),('2018-02-18 18:06:00',9,30,1),('2020-05-25 03:24:00',45,55,2);
/*!40000 ALTER TABLE `accidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `CAR_ID` int NOT NULL AUTO_INCREMENT,
  `BRAND` varchar(15) DEFAULT NULL,
  `PLATE_NUM` varchar(7) NOT NULL,
  `MODEL` varchar(10) NOT NULL,
  PRIMARY KEY (`CAR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'Volkswagen','RD3517','T-Roc'),(2,'Ford','WD2649','Focus'),(3,' Toyota','LX1423','Yaris'),(4,' Ford','HC4671','Focus '),(5,'Fiat','GH6157','Panda'),(6,'Dacia','ID6635','Sandero'),(7,' Fiat','IA1228','Panda '),(8,' Peugeot','KY5398','208'),(9,' Volkswagen','AA9010','Polo '),(10,' Fiat','KR3905','500 '),(11,'Ford','BG5134','Focus'),(12,'Fiat','PA2896','Panda'),(13,' Audi','XY3018','A3 '),(14,' Ford','II4638','Focus '),(15,' Toyota','ET5022','Yaris'),(16,' Volkswagen','PY1994','Passat'),(17,' Ford','TI9903','Fiesta '),(18,' Fiat','BL7096','Panda '),(19,' Ford','YE3018','Fiesta '),(20,' Peugeot','IY7863','208'),(21,' Ford','LP1856','Fiesta '),(22,' Peugeot','MX6401','208'),(23,' Fiat','RO2858','Panda '),(24,'Citroen','TV8273','C3'),(25,' Volkswagen','WY2659','Polo '),(26,' Toyota','QU9872','Yaris'),(27,' Toyota','RE7150','Yaris'),(28,' Ford','JX2044','Focus '),(29,' Opel','DK2642','Corsa '),(30,'Ford','KT9856','Focus'),(31,'Hyundai','AR9138','Tucson'),(32,' Skoda','DK3998','Fabia'),(33,' Opel','MP8273','Astra'),(34,'Ford','QH6644','Focus'),(35,' Dacia','BE6586','Sandero'),(36,' Nissan','XC5835','Qashqai '),(37,' Volkswagen','WW2458','Polo '),(38,' Volkswagen','QK1668','Polo '),(39,' Toyota','QR4124','Yaris'),(40,' Ford','XY2921','Fiesta '),(41,' Renault','TH2565','Clio'),(42,' Ford','HV3438','Focus '),(43,' Opel','WP5708','Corsa '),(44,' Fiat','RH4983','500 '),(45,' Skoda','VJ6238','Fabia'),(46,'Citroen','SQ3636','C3'),(47,' Fiat','PU8711','Panda '),(48,' Toyota','IY1650','Yaris'),(49,' Volkswagen','NA3262','Passat'),(50,' Skoda','RR2410','Octavia');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_port`
--

DROP TABLE IF EXISTS `charging_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_port` (
  `PORT_ID` int NOT NULL AUTO_INCREMENT,
  `STATION_ID` int NOT NULL,
  `PORT_NUMBER` tinyint NOT NULL,
  PRIMARY KEY (`PORT_ID`),
  KEY `STATION_ID` (`STATION_ID`),
  CONSTRAINT `charging_port_ibfk_1` FOREIGN KEY (`STATION_ID`) REFERENCES `charging_station` (`STATION_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_port`
--

LOCK TABLES `charging_port` WRITE;
/*!40000 ALTER TABLE `charging_port` DISABLE KEYS */;
INSERT INTO `charging_port` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37);
/*!40000 ALTER TABLE `charging_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station`
--

DROP TABLE IF EXISTS `charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station` (
  `STATION_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(25) NOT NULL,
  `CITY_ID` int NOT NULL,
  PRIMARY KEY (`STATION_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `charging_station_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station`
--

LOCK TABLES `charging_station` WRITE;
/*!40000 ALTER TABLE `charging_station` DISABLE KEYS */;
INSERT INTO `charging_station` VALUES (1,'Ams',1),(2,'Ant',2),(3,'Ath',3),(4,'Bar',4),(5,'Ber',5),(6,'Ber',6),(7,'Bru',7),(8,'Cal',8),(9,'Col',9),(10,'Cop',10),(11,'Edi',11),(12,'Fra',12),(13,'Gen',13),(14,'Gen',14),(15,'Ham',15),(16,'LeH',16),(17,'Lis',17),(18,'Lon',18),(19,'Lux',19),(20,'Lyo',20),(21,'Mad',21),(22,'Mar',22),(23,'Mil',23),(24,'Mun',24),(25,'Nap',25),(26,'Nic',26),(27,'Par',27),(28,'Pra',28),(29,'Rom',29),(30,'Rot',30),(31,'Str',31),(32,'Stu',32),(33,'The',33),(34,'Tur',34),(35,'Ven',35),(36,'Vie',36),(37,'Zur',37);
/*!40000 ALTER TABLE `charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `CITY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(25) NOT NULL,
  `COUNTRY_ID` varchar(2) NOT NULL,
  PRIMARY KEY (`CITY_ID`),
  KEY `COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Amsterdam','15'),(2,'Antwerp','2'),(3,'Athens','8'),(4,'Barcelona','13'),(5,'Berlin','7'),(6,'Bern','14'),(7,'Brussels','2'),(8,'Calais','6'),(9,'Cologne','10'),(10,'Copenhagen','4'),(11,'Edinburgh','9'),(12,'Frankfurt','7'),(13,'Geneva','10'),(14,'Genoa','10'),(15,'Hamburg','7'),(16,'Le Havre','6'),(17,'Lisbon','12'),(18,'London','5'),(19,'Luxembourg','11'),(20,'Lyon','6'),(21,'Madrid','13'),(22,'Marseille','6'),(23,'Milan','10'),(24,'Munich','7'),(25,'Naples','10'),(26,'Nice','6'),(27,'Paris','6'),(28,'Prague','3'),(29,'Rome','10'),(30,'Rotterdam','15'),(31,'Strasbourg','6'),(32,'Stuttgart','7'),(33,'The Hague','15'),(34,'Turin','10'),(35,'Venice','10'),(36,'Vienna','1'),(37,'Zurich','14');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `CLIENT_ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(15) NOT NULL,
  `LAST_NAME` varchar(15) NOT NULL,
  `PHONE_NUMBER` varchar(20) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `ZIP_CODE` varchar(10) NOT NULL,
  `ADDRESS` varchar(60) NOT NULL,
  `JOIN_DATE` timestamp NULL DEFAULT NULL,
  `PRICING_ID` int NOT NULL,
  `CARD_NUMBER` bigint NOT NULL,
  `LICENSE_NUMBER` varchar(10) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`),
  KEY `PRICING_ID` (`PRICING_ID`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`PRICING_ID`) REFERENCES `pricing` (`PRICING_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Stanley','Smith','3.51966E+11','Stanley@gmail.com','5461-501','N246 295  Apto. 889','2017-12-31 23:00:00',2,4594662128561461,'54621A'),(2,'Alexandra','Werner','3.51929E+11','Alexandra@gmail.com','6397-199','N4 73  Casa 1','2018-01-26 23:00:00',1,4582567943451054,'59750Q'),(3,'Maren','Galloway','3.51923E+11','Maren@gmail.com','7681-575','Rua José Cruz 2  Lote 99','2018-01-28 23:00:00',1,4576313125021231,'56965Z'),(4,'Colt','Mcdaniel','3.51922E+11','Colt@gmail.com','9534-722','Praça Elias Matos 8  Lote 66','2018-01-31 23:00:00',1,4579247028681803,'52195R'),(5,'Jaelyn','Maldonado','3.51966E+11','Jaelyn@gmail.com','3042-503','N586 4751  Apto. 622','2018-02-01 23:00:00',2,4577548368241857,'63906R'),(6,'Lesly','Willis','35177155530','Lesly@gmail.com','4547-651','N640-7 1  Casa 7','2018-02-12 23:00:00',1,4589219510971072,'67017R'),(7,'Gerald','Gaines','3.51966E+11','Gerald@gmail.com','2225-684','N779 693  Casa 3','2018-02-14 23:00:00',1,4587306794371642,'64989E'),(8,'Allisson','Parker','3.51929E+11','Allisson@gmail.com','5250-633','N824-6 79  Bloco 47','2018-02-15 23:00:00',2,45977570311696,'73735F'),(9,'Jameson','Blake','3.51916E+11','Jameson@gmail.com','3628-316','N3 7  Lote 39','2018-02-17 23:00:00',2,4585581921451245,'67643J'),(10,'Charlie','Lin','3.51102E+11','Charlie@gmail.com','2473-210','N953 2  Bloco 84','2018-02-19 23:00:00',1,4577508446401809,'55610P'),(11,'Adriana','Walter','3.51966E+11','Adriana@gmail.com','3037-505','N628-0 7261  Casa 0','2018-02-22 23:00:00',2,4584267677161639,'79265P'),(12,'Dayanara','Molina','3.51922E+11','Dayanara@gmail.com','7527-920','N91 990  Bloco 78','2018-02-23 23:00:00',2,457030198431173,'74936T'),(13,'Isabela','Benton','3.51936E+11','Isabela@gmail.com','3863-490','N5 6495  Apto. 561','2018-03-16 23:00:00',2,4597309396011256,'53493P'),(14,'Maya','Durham','3.51916E+11','Maya@gmail.com','0299-538','N65 3569  Apto. 193','2018-03-20 23:00:00',1,4584301473601426,'63519L'),(15,'Hugh','Perry','35191555391','Hugh@gmail.com','7594-535','N8 824  Bloco 60','2018-03-21 23:00:00',1,4581640397041534,'51195T'),(16,'Justus','Hurley','3.51922E+11','Justus@gmail.com','0100-219','N17 2785  Apto. 002','2018-03-23 23:00:00',2,4577537937401767,'54021S'),(17,'Dana','Vance','3.51936E+11','Dana@gmail.com','3955-672','N110-5 5378  Apto. 409','2018-04-01 22:00:00',1,4587270780761676,'69416C'),(18,'Lincoln','Medina','3.51922E+11','Lincoln@gmail.com','7153-631','N129 50  Bloco 36','2018-04-06 22:00:00',2,4585302851631231,'73280E'),(19,'Harmony','Aguirre','3.51916E+11','Harmony@gmail.com','3478-736','N000-3 99  Apto. 035','2018-04-06 22:00:00',1,4595625695511902,'73322L'),(20,'Denisse','Schwartz','3.51922E+11','Denisse@gmail.com','0224-821','Jardim Sofia Silva 6  Apto. 849','2018-04-20 22:00:00',2,4591588138351049,'76420O'),(21,'Lena','Cabrera','4.20602E+11','Lena@gmail.com','548 15','U Štěpu 685  Suite 626','2018-04-23 22:00:00',1,4593763993751166,'71403K'),(22,'Nathanael','Holder','4.20606E+11','Nathanael@gmail.com','717-62','Předbořská 592  Suite 087','2018-04-27 22:00:00',1,4586419372421818,'61498F'),(23,'Cameron','Long','4.20736E+11','Cameron@gmail.com','735 44','Štolmířská 761  Suite 706','2018-05-02 22:00:00',2,4582309868601833,'56616E'),(24,'Elena','Crane','4.20736E+11','Elena@gmail.com','376-98','Hrušínského 6  Suite 400','2018-05-03 22:00:00',1,4585677897621443,'72788R'),(25,'Kyleigh','Stokes','4.20791E+11','Kyleigh@gmail.com','50371','Procházkova 7  Apt. 111','2018-05-25 22:00:00',1,4568544018641965,'73690O'),(26,'Luca','Mendoza','4.20703E+11','Luca@gmail.com','90076','Nad Rybníčky 00  Apt. 968','2018-05-29 22:00:00',1,4596750567771665,'64299L'),(27,'Corinne','Stanton','4.20605E+11','Corinne@gmail.com','34127','Na Krčské Stráni 5  Apt. 465','2018-06-02 22:00:00',1,4573401939931468,'55547K'),(28,'Seamus','Mcconnell','4.20791E+11','Seamus@gmail.com','700 99','Petrbokova 5  Suite 665','2018-06-16 22:00:00',1,4593511820241311,'51996V'),(29,'Gillian','Hensley','4.20703E+11','Gillian@gmail.com','44665','Kožíškova 414  Suite 875','2018-06-20 22:00:00',1,4591491819831078,'76981H'),(30,'Makaila','Tanner','42060555542','Makaila@gmail.com','52665','Hokejová 66  Suite 479','2018-06-26 22:00:00',2,4579364495111248,'65805D'),(31,'Jaydan','Krause','4.20776E+11','Jaydan@gmail.com','19110','Mladenovova 913  Apt. 050','2018-07-01 22:00:00',2,4572715198041054,'78293B'),(32,'Dallas','Clarke','4.20703E+11','Dallas@gmail.com','75171','Novákovo Náměstí 156  Apt. 826','2018-07-12 22:00:00',2,4596471832361227,'67745V'),(33,'Esperanza','Carson','4.20736E+11','Esperanza@gmail.com','626 16','Panenská 606  Apt. 178','2018-08-22 22:00:00',1,4574552397841437,'55386I'),(34,'Hannah','Nash','4.20703E+11','Hannah@gmail.com','93731','Na Pláni 742  Apt. 548','2018-09-03 22:00:00',1,458644768871781,'54912P'),(35,'Jerimiah','Fernandez','42060555545','Jerimiah@gmail.com','889-39','Klikatá 76  Apt. 922','2018-09-11 22:00:00',2,4580743022771700,'69326L'),(36,'Leonardo','Robertson','4.20776E+11','Leonardo@gmail.com','96466','Na Jabloňce 810  Apt. 660','2018-09-13 22:00:00',1,4572270994401774,'62353H'),(37,'Billy','Hahn','4.20776E+11','Billy@gmail.com','416-18','Cafourkova 3  Apt. 840','2018-09-15 22:00:00',2,4592513183341562,'66818O'),(38,'Angelica','Solis','4.20703E+11','Angelica@gmail.com','028 76','Boleratická 04  Suite 475','2018-09-16 22:00:00',2,4598545181581979,'59681J'),(39,'Philip','Barry','4.20791E+11','Philip@gmail.com','522 32','Pod Garážemi 313  Suite 156','2018-09-26 22:00:00',2,4589220447221525,'63392L'),(40,'Sandra','Schaefer','42070255576','Sandra@gmail.com','583-73','Hviezdoslavova 281  Suite 432','2018-09-29 22:00:00',2,4598230777951044,'74982T'),(41,'Haven','Burton','4.91606E+11','Haven@gmail.com','84918','Friedhofstr. 78b  Zimmer 546','2018-10-11 22:00:00',1,4580751845241371,'51142M'),(42,'Steven','Kemp','4.91596E+11','Steven@gmail.com','54835','Am Wasserturm 33c  3 OG','2018-10-26 22:00:00',1,458538968001360,'75121O'),(43,'Aron','Bishop','4.91516E+11','Aron@gmail.com','42062','Karl-Marx-Str. 18c  Apt. 449','2018-10-28 23:00:00',2,4596772834381503,'64294Z'),(44,'Olivia','Whitaker','4.91576E+11','Olivia@gmail.com','21481','Lehner Mühle 48  Zimmer 002','2018-11-09 23:00:00',2,4586553687081644,'72116Z'),(45,'Amanda','Mckee','4.91576E+11','Amanda@gmail.com','55449','Jahnstr. 94c  8 OG','2018-11-12 23:00:00',2,4577241768741437,'65858D'),(46,'Kaylin','Sims','4.91556E+11','Kaylin@gmail.com','88707','Zedernweg 05  Zimmer 219','2018-11-18 23:00:00',1,4585778877201590,'57503I'),(47,'Cristian','Burgess','4.91516E+11','Cristian@gmail.com','3278','Kandinskystr. 6  7 OG','2018-11-19 23:00:00',2,456921236161545,'79345C'),(48,'Madeleine','Downs','49172555262','Madeleine@gmail.com','65311','Friedlieb-Ferdinand-Runge-Str. 862  Zimmer 307','2018-12-05 23:00:00',2,4582388177771484,'57848X'),(49,'Anabella','Deleon','4.91606E+11','Anabella@gmail.com','37754','Am Sportplatz 88  0 OG','2019-01-08 23:00:00',2,4595664970601013,'59984V'),(50,'Cory','Dillon','4.91636E+11','Cory@gmail.com','46786','Pescher Busch 1  Apt. 686','2019-01-16 23:00:00',2,4572634897891295,'55722Y'),(51,'Briana','Hahn','4.91596E+11','Briana@gmail.com','20571','Schlehdornstr. 9  Zimmer 851','2019-01-21 23:00:00',2,4596365178791319,'64468A'),(52,'Abraham','Atkins','49155555856','Abraham@gmail.com','48898','Niederblecher 97  8 OG','2019-01-23 23:00:00',2,458078302961643,'68924Q'),(53,'Allison','Preston','4.91556E+11','Allison@gmail.com','76183','Gerhard-Domagk-Str. 85b  6 OG','2019-01-25 23:00:00',1,4568637397851720,'52551X'),(54,'Darren','Watson','4.91526E+11','Darren@gmail.com','62090','Dhünnberg 90c  Zimmer 386','2019-02-04 23:00:00',2,459562189451189,'55454Y'),(55,'Mara','Shepard','4.91556E+11','Mara@gmail.com','81697','Ratiborer Str. 32a  Zimmer 904','2019-02-09 23:00:00',1,4593718768421395,'72021D'),(56,'Alfred','Poole','4.91746E+11','Alfred@gmail.com','92096','Albert-Schweitzer-Str. 193  Zimmer 889','2019-02-13 23:00:00',2,4580287793711910,'68464U'),(57,'Anaya','Jenkins','4.91776E+11','Anaya@gmail.com','80961','Stöckenstr. 7  2 OG','2019-02-15 23:00:00',1,4590711581861582,'67194K'),(58,'Regan','Duffy','4.91766E+11','Regan@gmail.com','6584','Kleinheider Weg 0  Apt. 699','2019-02-19 23:00:00',1,4579537526931356,'59920Q'),(59,'Lorena','Simmons','4.91516E+11','Lorena@gmail.com','26783','Schellingstr. 5  3 OG','2019-03-08 23:00:00',2,4580572154351727,'57238E'),(60,'Bradley','Gonzales','4.91786E+11','Bradley@gmail.com','92344','Am Hohen Ufer 6  8 OG','2019-03-21 23:00:00',2,4584709593291467,'62489B'),(61,'Karina','Wilkinson','4.91596E+11','Karina@gmail.com','89746','Elsbachstr. 81  Apt. 520','2019-03-23 23:00:00',2,4576494799701233,'66247A'),(62,'Damari','Torres','4.91736E+11','Damari@gmail.com','69797','Pregelstr. 646  Zimmer 994','2019-03-24 23:00:00',1,45867348581167,'65744T'),(63,'Greyson','Elliott','4.91626E+11','Greyson@gmail.com','45463','Farnweg 54c  Apt. 894','2019-03-25 23:00:00',1,459833322821100,'79584N'),(64,'Tamia','Burgess','4.91636E+11','Tamia@gmail.com','65462','Gustav-Radbruch-Str. 86b  9 OG','2019-03-26 23:00:00',1,4577591320181208,'59418I'),(65,'Kaleigh','Brown','4.91526E+11','Kaleigh@gmail.com','13863','Romberg 66c  Zimmer 206','2019-04-21 22:00:00',2,4568540475751938,'79000H'),(66,'Baylee','Cortez','49163555368','Baylee@gmail.com','56055','Carl-Maria-von-Weber-Platz 71c  3 OG','2019-04-29 22:00:00',1,4593510344091865,'77473F'),(67,'Abril','Fitzpatrick','4.91636E+11','Abril@gmail.com','89650','Görlitzer Str. 52c  Zimmer 321','2019-05-18 22:00:00',1,4575337221171043,'69015R'),(68,'Dylan','Riddle','4.91626E+11','Dylan@gmail.com','78539','Paracelsusstr. 58c  Zimmer 807','2019-06-05 22:00:00',2,457457259551399,'76687B'),(69,'Cortez','Sheppard','4.91786E+11','Cortez@gmail.com','28807','Im Jücherfeld 0  0 OG','2019-06-06 22:00:00',2,459465165161405,'55448F'),(70,'Antony','Doyle','4.91526E+11','Antony@gmail.com','4674','Schöneberger Str. 24b  2 OG','2019-06-16 22:00:00',2,4589689445441057,'78969M'),(71,'Kyleigh','Lowe','4.91626E+11','Kyleigh@gmail.com','20326','Freiherr-vom-Stein-Str. 36  Apt. 723','2019-06-20 22:00:00',2,4575466640941761,'72111N'),(72,'Alexa','Terrell','4.91606E+11','Alexa@gmail.com','82404','In der Wüste 19a  Apt. 316','2019-06-28 22:00:00',2,4584361516211872,'74032P'),(73,'Kieran','Doyle','4.91556E+11','Kieran@gmail.com','42890','Altstadtstr. 9  0 OG','2019-07-18 22:00:00',1,4595357656041486,'57984U'),(74,'Sergio','Newman','4.91726E+11','Sergio@gmail.com','94983','Schumannstr. 297  Zimmer 510','2019-07-22 22:00:00',2,4597791919411214,'67259O'),(75,'Adrienne','Ponce','4.91636E+11','Adrienne@gmail.com','66015','Carl-Maria-von-Weber-Str. 19b  Apt. 525','2019-07-24 22:00:00',1,4569732390631850,'78070O'),(76,'Anika','Walls','4.91576E+11','Anika@gmail.com','17479','Elsbachstr. 54b  8 OG','2019-07-29 22:00:00',1,4588718436551756,'69660V'),(77,'Kade','Chase','49163555251','Kade@gmail.com','89086','Auf dem Herberg 4  Zimmer 944','2019-08-20 22:00:00',1,4595784084411411,'75931V'),(78,'Pablo','Shepherd','4.91556E+11','Pablo@gmail.com','79834','Freiheitstr. 81b  Zimmer 866','2019-08-31 22:00:00',1,458644078261356,'58248Z'),(79,'Tara','Zimmerman','4.91556E+11','Tara@gmail.com','34741','Fröbelstr. 82a  Apt. 536','2019-09-18 22:00:00',2,45834556781818,'63110J'),(80,'Larissa','Sloan','4.91576E+11','Larissa@gmail.com','10759','Kochergarten 35c  9 OG','2019-09-21 22:00:00',1,4571258152281792,'69920Y'),(81,'Gustavo','Barker','4.36506E+11','Gustavo@gmail.com','6685','Kinderheimgasse 89  Zimmer 014','2019-09-22 22:00:00',2,4593732535711359,'79823C'),(82,'Armani','Ortiz','4.36506E+11','Armani@gmail.com','7150','Krankenhausstraße 86b  Zimmer 389','2019-09-27 22:00:00',2,4587373668851296,'66624J'),(83,'Kallie','Cook','4.36996E+12','Kallie@gmail.com','4761','Keltenberg-Eponaweg 21  Apt. 300','2019-10-01 22:00:00',2,4595461038091789,'69238B'),(84,'Mauricio','Page','4.36606E+12','Mauricio@gmail.com','70','Blasiussteig 6  Apt. 817','2019-10-02 22:00:00',2,4574369564431021,'68721V'),(85,'Bryanna','Mason','4.36816E+12','Bryanna@gmail.com','6344','Römerweg 43b  Apt. 531','2019-10-17 22:00:00',1,4583414078441161,'67681T'),(86,'Leila','Glenn','4.36886E+11','Leila@gmail.com','3951','Hütten 99c  Apt. 685','2019-10-29 23:00:00',1,4578779145821655,'59992W'),(87,'Guillermo','Mercado','4.36606E+11','Guillermo@gmail.com','4628','Kubinstraße 53  5 OG','2019-10-29 23:00:00',2,4580538264571135,'58773J'),(88,'Erika','Hunt','4.36506E+12','Erika@gmail.com','5799','Kegelprielstraße 2  Zimmer 957','2019-11-01 23:00:00',1,45773805581100,'53967D'),(89,'Maryjane','Kelley','4.36996E+12','Maryjane@gmail.com','1399','Erlenstraße 8  Apt. 996','2019-11-19 23:00:00',1,4592778216431485,'57368W'),(90,'Micaela','Short','4.36506E+12','Micaela@gmail.com','9742','Berggasse 6  7 OG','2019-11-21 23:00:00',2,4574604281321354,'72606A'),(91,'Dayanara','Pollard','4.36506E+12','Dayanara@gmail.com','3604','Mühle 033  9 OG','2019-11-23 23:00:00',1,4577706710801958,'68185X'),(92,'Gabriel','Lucero','43680555913','Gabriel@gmail.com','2877','Kubinstraße 09  Apt. 709','2019-11-26 23:00:00',1,4591546216601295,'78842T'),(93,'Ryland','Walters','4.36766E+11','Ryland@gmail.com','2990','Franz-von-Assisi-Straße 5  Zimmer 134','2019-11-27 23:00:00',2,4591773049261070,'61514U'),(94,'Melody','Nolan','4.36806E+12','Melody@gmail.com','3756','St.Ulrich 4  Apt. 400','2019-11-28 23:00:00',1,4591259161501574,'57918S'),(95,'Lukas','Berger','4.36816E+11','Lukas@gmail.com','1120','Oberbödenalm 171  5 OG','2019-12-05 23:00:00',2,4595514877681290,'75576O'),(96,'Sadie','Waller','31655584833','Sadie@gmail.com','0704 RK','Koningsteeg 717 II  3 hoog achter','2019-12-08 23:00:00',2,4590604637651471,'61327A'),(97,'Lailah','Gill','31655567897','Lailah@gmail.com','3414 CB','Meerstraat 551b  2 hoog','2019-12-09 23:00:00',2,4580581253371319,'64691D'),(98,'Ean','Oneal','31655547469','Ean@gmail.com','2933 HY','Thijsweg 914  2 hoog','2019-12-10 23:00:00',1,4577209265551336,'76211C'),(99,'Miracle','Frazier','31655511308','Miracle@gmail.com','8630 AW','Nielshof 919 III  1 hoog','2019-12-15 23:00:00',1,4587575280481987,'52443U'),(100,'June','Hardy','3165558774','June@gmail.com','1709 AD','Noamarkt 71  1 hoog','2019-12-25 23:00:00',1,4598460390961921,'62155C'),(101,'Eli','Stevenson','31655553110','Eli@gmail.com','6108 ZJ','Lottegracht 303c  3 hoog achter','2019-12-31 23:00:00',1,4589659920951480,'53729C'),(102,'Camryn','Grant','31655528657','Camryn@gmail.com','3773 HW','Vriesplein 383c  2 hoog','2020-01-07 23:00:00',1,4595212783971399,'65944V'),(103,'Mary','Glenn','31655526123','Mary@gmail.com','2492 QT','Noapark 038 II  2 hoog','2020-01-07 23:00:00',2,4595397074381638,'71528X'),(104,'Skyler','Choi','31655550920','Skyler@gmail.com','2579 MU','Kleinmarkt 1  2 hoog','2020-01-08 23:00:00',2,4582230497851788,'58774V'),(105,'Jamiya','Church','31655504594','Jamiya@gmail.com','6290 MJ','Peterslaan 137 III  3 hoog','2020-01-09 23:00:00',1,4577390960951318,'79545I'),(106,'Abel','Vasquez','31655502390','Abel@gmail.com','7174 DI','Vriesdijk 066 I  3 hoog','2020-01-15 23:00:00',1,4588655711171119,'64285F'),(107,'Darren','Shah','31655517458','Darren@gmail.com','0579 FN','Johannesstraat 4  2 hoog','2020-02-02 23:00:00',2,4593657073971425,'65102Q'),(108,'Ray','Smith','31655540206','Ray@gmail.com','8890 BI','Kevindijk 220 II  3 hoog','2020-02-07 23:00:00',1,4588635554291631,'78168Y'),(109,'Rashad','Turner','31655505135','Rashad@gmail.com','2632 RD','Leeuwenplein 077 II  2 hoog','2020-02-12 23:00:00',1,4597765997201065,'75064F'),(110,'Efrain','Morse','31655505754','Efrain@gmail.com','0236 GS','Boersloot 062 I  1 hoog','2020-02-22 23:00:00',2,4574570329141147,'58838C'),(111,'Shyla','Duffy','4795552864','Shyla@gmail.com','230','Korstunet 2  Oppgang A','2020-03-15 23:00:00',1,4595658583521390,'79940Y'),(112,'Kolby','Riley','4745558029','Kolby@gmail.com','903','Nedre Granittløkka 4  Oppgang B','2020-04-06 22:00:00',1,4590480150711086,'61582Q'),(113,'Byron','Strickland','4759555637','Byron@gmail.com','572','Aass Vei 01  Oppgang A','2020-04-20 22:00:00',2,4569279615091034,'61829R'),(114,'Marlee','Bush','4745551159','Marlee@gmail.com','9518','Mikkelsgate 5  Leil. 639','2020-04-21 22:00:00',1,4591598248031865,'54336G'),(115,'Matilda','Stewart','4745550140','Matilda@gmail.com','976','Magnussvei 2  Leil. 129','2020-04-28 22:00:00',2,4590491815171838,'53118S'),(116,'Faith','Zamora','4795555684','Faith@gmail.com','406','Theodorgata 48  Oppgang A','2020-05-17 22:00:00',2,4595593749461374,'69876S'),(117,'Esther','Mclean','479555117','Esther@gmail.com','9673','Østre Hestemyrskrenten 3  Leil. 358','2020-05-23 22:00:00',2,4583714730781188,'69874M'),(118,'Ibrahim','Reyes','4745559937','Ibrahim@gmail.com','659','Søndre Litjstubben 32  Leil. 838','2020-05-25 22:00:00',1,458479553671277,'63818M'),(119,'Sariah','Bryan','4795555731','Sariah@gmail.com','996','Presteflata 55  Oppgang B','2020-06-03 22:00:00',1,4569366336261518,'56091B'),(120,'Hillary','Arias','4745551118','Hillary@gmail.com','1052','Rognestykket 3  Oppgang B','2020-06-03 22:00:00',2,4586430932361961,'71975C'),(121,'Jazmin','Christensen','479555524','Jazmin@gmail.com','5937','Sofies Gate 7  Oppgang A','2020-06-18 22:00:00',2,4584636569861659,'78875A'),(122,'Emery','Lawson','4795552487','Emery@gmail.com','1309','Østre Granvollen 12  Leil. 646','2020-06-27 22:00:00',2,4579443732931754,'62362C'),(123,'Julianna','Rogers','4795550257','Julianna@gmail.com','8414','Søndre Klokkerberget 95  Leil. 778','2020-06-29 22:00:00',1,4589482980961472,'65698Z'),(124,'Ezra','Ross','4759555956','Ezra@gmail.com','2093','Camillasvei 5  Leil. 122','2020-06-29 22:00:00',2,4587298359131576,'55067B'),(125,'Victor','Mata','4745557819','Victor@gmail.com','2648','Korsvika 4  Leil. 612','2020-07-01 22:00:00',2,4584330168031043,'51794C'),(126,'Travis','Matthews','3.93286E+13','Travis@gmail.com','13246','Borgo Torquato 4  Appartamento 28','2020-07-02 22:00:00',1,45942704781239,'68941N'),(127,'Stanley','Gilmore','3.93776E+14','Stanley@gmail.com','95230','Strada Cascone 6  Piano 4','2020-07-29 22:00:00',1,4586461959781760,'56476F'),(128,'George','Merritt','3.93816E+11','George@gmail.com','1686','Via Guerrini 88  Appartamento 76','2020-08-04 22:00:00',1,4579576771441335,'56227U'),(129,'Jack','Shepard','3.93116E+11','Jack@gmail.com','16073','Rotonda Leopoldo 83  Appartamento 62','2020-08-13 22:00:00',1,4581588145581207,'54631F'),(130,'Izabella','Wyatt','3.93226E+11','Izabella@gmail.com','31207','Borgo Fabbri 14  Appartamento 96','2020-08-14 22:00:00',2,4590788878471404,'59930I'),(131,'Adelaide','Short','3.93112E+12','Adelaide@gmail.com','50353','Contrada Carrieri 731  Piano 1','2020-09-09 22:00:00',1,4584271522811489,'79670A'),(132,'Yasmin','Middleton','3.93976E+14','Yasmin@gmail.com','26673','Strada Spano 7  Appartamento 25','2020-09-11 22:00:00',2,4597588550751390,'64599K'),(133,'Raelynn','Hogan','3.93112E+13','Raelynn@gmail.com','23661','Strada De Santis 18  Appartamento 45','2020-09-13 22:00:00',2,4588740340001353,'77363V'),(134,'Cash','Haley','3.93506E+14','Cash@gmail.com','34376','Borgo Filippi 419  Appartamento 45','2020-09-15 22:00:00',1,4595237718171180,'72932V'),(135,'Octavio','Schwartz','3.93976E+13','Octavio@gmail.com','41860','Rotonda Neopolo 2  Piano 2','2020-09-26 22:00:00',1,4593441458311422,'74753A'),(136,'Jaydan','Harper','39370555518','Jaydan@gmail.com','5504','Strada Mancuso 587  Piano 4','2020-10-04 22:00:00',1,4597758740921999,'73923P'),(137,'Luna','Vasquez','3.93116E+11','Luna@gmail.com','26194','Contrada Vichi 076  Appartamento 19','2020-10-10 22:00:00',2,457552569891633,'71358L'),(138,'Augustus','Byrd','3.93206E+11','Augustus@gmail.com','40632','Borgo Alfredo 817  Appartamento 45','2020-10-12 22:00:00',1,4575604782421021,'58117E'),(139,'Emelia','Cook','3.93976E+13','Emelia@gmail.com','48281','Piazza Moreno 0  Piano 1','2020-10-23 22:00:00',1,4584300081351412,'52708Z'),(140,'Alyssa','Holmes','3.93836E+13','Alyssa@gmail.com','52495','Rotonda Pavan 202  Appartamento 18','2020-11-02 23:00:00',2,4578306081071505,'69742K'),(141,'Vanessa','Chen','3.93976E+11','Vanessa@gmail.com','9173','Rotonda Proserpina 424  Piano 8','2020-11-07 23:00:00',1,4574234229731340,'76782B'),(142,'Curtis','Mullins','3.93506E+14','Curtis@gmail.com','87747','Via Lazzaro 341  Appartamento 15','2020-11-09 23:00:00',1,4589567686921184,'73014P'),(143,'Odin','Donovan','3.93506E+14','Odin@gmail.com','20072','Rotonda Carmine 3  Piano 6','2020-11-11 23:00:00',2,4580423793741643,'65017D'),(144,'Estrella','Chang','39360555132','Estrella@gmail.com','62014','Incrocio Ulpiano 91  Appartamento 21','2020-11-11 23:00:00',2,4569614134201697,'66716O'),(145,'Beckett','Hester','3.93513E+14','Beckett@gmail.com','75616','Via Canepa 2  Piano 3','2020-11-26 23:00:00',1,4596781550041393,'73530W'),(146,'Blaze','Cooke','3.93826E+11','Blaze@gmail.com','30938','Borgo Rosso 314  Piano 0','2020-11-27 23:00:00',1,4594402688841794,'51336A'),(147,'Marley','Donovan','39360555896','Marley@gmail.com','55265','Strada Viscardo 406  Appartamento 54','2020-11-27 23:00:00',2,4587693575671087,'67076L'),(148,'Noah','Rodriguez','3.93276E+14','Noah@gmail.com','60948','Rotonda Spina 228  Appartamento 07','2020-11-28 23:00:00',1,459826223371337,'52510N'),(149,'Remington','Chan','39385555141','Remington@gmail.com','45669','Borgo De Luca 86  Piano 6','2020-12-02 23:00:00',2,4573601326841416,'67062T'),(150,'Raymond','Singleton','3935155578','Raymond@gmail.com','41284','Rotonda Liberata 262  Piano 1','2020-12-07 23:00:00',2,4576358360341210,'72959D'),(151,'Elsa','Freeman','4174555050','Elsa@gmail.com','4294','465 Antonio Island  Suite 742','2020-12-15 23:00:00',1,4581290644971937,'59507Q'),(152,'Milo','Lester','41765550339','Milo@gmail.com','5550','14841 Meier Grove  Suite 565','2021-01-10 23:00:00',2,4577620652451595,'72784Y'),(153,'Kamron','Clay','41755559840','Kamron@gmail.com','7902','34270 Johann Course  Suite 538','2021-01-13 23:00:00',2,4589398865781261,'75463M'),(154,'Ariel','Khan','41775556240','Ariel@gmail.com','8073','247 Hafner Junctions  Apt. 501','2021-01-20 23:00:00',1,4581574734641120,'54609E'),(155,'Claire','Lucero','41745553538','Claire@gmail.com','4598','538 Meister Cliff  Suite 987','2021-01-22 23:00:00',2,4569356740101078,'62927O'),(156,'Eve','Bauer','4179555969','Eve@gmail.com','6343','092 Steiger Way  Apt. 949','2021-02-03 23:00:00',2,4584496327931047,'71494Z'),(157,'Mariana','Woodward','41775558536','Mariana@gmail.com','9609','001 Claudine Club  Suite 308','2021-02-05 23:00:00',1,4582526638541483,'66601R'),(158,'Malaki','May','41755551474','Malaki@gmail.com','3495','1768 Marlène Trail  Apt. 198','2021-02-12 23:00:00',2,4574758470311122,'54399O'),(159,'Dalia','Cameron','41745550656','Dalia@gmail.com','9367','011 Nadja Valley  Apt. 793','2021-02-14 23:00:00',1,4597552967511358,'65172H'),(160,'Scarlet','Lang','41745551597','Scarlet@gmail.com','7281','900 Theodor Curve  Suite 761','2021-02-17 23:00:00',2,4593588174721157,'71667F'),(161,'Krista','Lloyd','41745554645','Krista@gmail.com','7915','82720 Ackermann Walk  Apt. 450','2021-02-25 23:00:00',2,4574669365341261,'62124S'),(162,'Braedon','Nichols','41785553906','Braedon@gmail.com','8330','7496 Hartmann Islands  Suite 146','2021-02-28 23:00:00',1,4594734928291336,'61733M'),(163,'Kendrick','Doyle','41745557524','Kendrick@gmail.com','7618','0066 Cornelia Lake  Suite 894','2021-03-06 23:00:00',2,4596509372381616,'72728R'),(164,'Jordyn','Evans','41765559420','Jordyn@gmail.com','6959','09820 Rey Highway  Apt. 541','2021-03-07 23:00:00',2,4584682033281658,'58542U'),(165,'Semaj','Giles','41795553335','Semaj@gmail.com','7423','156 Christine Unions  Apt. 903','2021-03-13 23:00:00',2,4580758343301129,'65928E'),(166,'Emelia','Noble','41765559577','Emelia@gmail.com','3583','6067 Urs Valleys  Apt. 715','2021-03-17 23:00:00',1,4568718118781899,'59488T'),(167,'Cortez','Farmer','41745555979','Cortez@gmail.com','9133','556 Micheline Stravenue  Apt. 991','2021-03-19 23:00:00',1,4589517647241390,'69594M'),(168,'Cierra','Gibson','41755555890','Cierra@gmail.com','4127','641 Iris Park  Apt. 583','2021-03-21 23:00:00',2,4571776929991845,'71969V'),(169,'Darian','Doyle','41755552431','Darian@gmail.com','7859','7033 Elsbeth Well  Suite 192','2021-03-26 23:00:00',2,4569331595081269,'72628L'),(170,'Jamar','Singleton','41755558243','Jamar@gmail.com','5751','7614 Patricia Glens  Suite 706','2021-04-24 22:00:00',1,459535914731720,'54835S'),(171,'Yasmin','Wells','33785557513','Yasmin@gmail.com','14083','61 Voie Delesseux  0 étage','2021-05-04 22:00:00',1,4578449737231386,'51208E'),(172,'Shyanne','Huff','33765551670','Shyanne@gmail.com','40434','5443 Impasse Montorgueil  Apt. 925','2021-05-27 22:00:00',2,4569275089421184,'68202N'),(173,'Roberto','Sanford','33700555549','Roberto@gmail.com','51573','1052 Impasse de Provence  2 étage','2021-06-04 22:00:00',1,4589295635881754,'53332R'),(174,'Atticus','Bender','33700555350','Atticus@gmail.com','29440','065 Place du Dahomey  Apt. 499','2021-06-26 22:00:00',1,4572381540071200,'55020F'),(175,'Rayne','Thompson','33765554577','Rayne@gmail.com','59622','51 Allée de la Paix  3 étage','2021-07-04 22:00:00',2,4585644372491673,'55589A'),(176,'Tiana','Decker','336555150','Tiana@gmail.com','82662','33 Place Saint-Séverin  Apt. 765','2021-07-08 22:00:00',2,4576377326891239,'53165G'),(177,'Jazmine','Orozco','33785557852','Jazmine@gmail.com','43327','2432 Avenue Saint-Séverin  Apt. 358','2021-07-17 22:00:00',2,458828727291523,'72305D'),(178,'Cael','Ortiz','33745559649','Cael@gmail.com','61657','76 Passage Zadkine  Apt. 687','2021-07-27 22:00:00',2,4587386064301536,'78103U'),(179,'Ahmed','Allen','33735556886','Ahmed@gmail.com','4473','2776 Passage de la Chaussée-d\'Antin  7 étage','2021-08-06 22:00:00',1,4592513776651792,'78393G'),(180,'Macy','Sheppard','33700555781','Macy@gmail.com','7473','1 Voie d\'Abbeville  9 étage','2021-08-20 22:00:00',1,4585333350951465,'76912G'),(181,'Clare','Cisneros','33655585491','Clare@gmail.com','52313','61 Quai de la Bûcherie  1 étage','2021-08-31 22:00:00',2,457577061841572,'79428H'),(182,'Arnav','Owen','33655502978','Arnav@gmail.com','88157','25 Boulevard Marcadet  5 étage','2021-10-02 22:00:00',2,4595594834241883,'67824F'),(183,'Ibrahim','Duffy','33655556272','Ibrahim@gmail.com','29617','3 Boulevard des Lombards  0 étage','2021-10-03 22:00:00',1,4593602528401443,'57503A'),(184,'Samara','Coffey','3370055520','Samara@gmail.com','60120','4 Place Saint-Bernard  1 étage','2021-10-04 22:00:00',2,4578737181741131,'67573U'),(185,'Georgia','Saunders','33700555487','Georgia@gmail.com','16032','08 Place du Faubourg-Saint-Denis  3 étage','2021-10-05 22:00:00',1,4581267891131837,'77750C'),(186,'Jett','Mccann','33655577686','Jett@gmail.com','49310','686 Allée de la Huchette  Apt. 371','2021-10-21 22:00:00',1,4589786831401023,'75447S'),(187,'Noel','Burns','33655519621','Noel@gmail.com','43057','567 Voie de la Ferronnerie  6 étage','2021-10-22 22:00:00',2,4597549069891365,'57502V'),(188,'Karli','Mays','33700555113','Karli@gmail.com','76686','6173 Avenue des Francs-Bourgeois  Apt. 258','2021-10-29 22:00:00',2,457326346691522,'69206H'),(189,'Felipe','Blanchard','33785556574','Felipe@gmail.com','90824','221 Impasse Pierre Charron  0 étage','2021-11-09 23:00:00',2,4586778097391002,'78729B'),(190,'Ricardo','Bender','33655570896','Ricardo@gmail.com','87462','396 Avenue Marcadet  Apt. 021','2021-11-14 23:00:00',1,4594725949911980,'54908D'),(191,'Moriah','Pennington','33700555902','Moriah@gmail.com','76227','26 Boulevard Du Sommerard  Apt. 947','2021-11-16 23:00:00',2,4589533217071302,'61940N'),(192,'Charity','Ingram','3370055599','Charity@gmail.com','47531','0883 Passage Saint-Denis  Apt. 384','2021-11-26 23:00:00',1,4572522287891665,'53622R'),(193,'Freddy','Stafford','33655520413','Freddy@gmail.com','98177','836 Quai du Havre  8 étage','2021-12-11 23:00:00',2,4587695926581610,'63338A'),(194,'Kaydence','Riggs','33655573416','Kaydence@gmail.com','87472','489 Avenue de Richelieu  Apt. 308','2021-12-16 23:00:00',2,4577421377481792,'54687K'),(195,'Mckayla','Gilbert','3370055573','Mckayla@gmail.com','70466','9091 Rue Saint-Bernard  Apt. 176','2021-12-22 23:00:00',1,4589320314351423,'59454C'),(196,'River','Hobbs','346555122','River@gmail.com','9353','Rincón Ernesto 2','2021-12-28 23:00:00',1,4576663755861596,'77949T'),(197,'Alaina','Wong','346555630','Alaina@gmail.com','11744','Calleja Jesús Merino 86 Puerta 697  Puerta 960','2021-07-17 22:00:00',1,45775774121328,'66221Z'),(198,'Liliana','Randall','346555009','Liliana@gmail.com','59144','Chalet Andrea 4','2021-07-27 22:00:00',1,4585277949841526,'72824F'),(199,'Jasmin','Miranda','347555328','Jasmin@gmail.com','51783','Camino Mateo 95 Puerta 805  Esc. 175','2021-08-06 22:00:00',1,4598521134441871,'72536F'),(200,'Saniyah','Blair','346555030','Saniyah@gmail.com','95349','Puente Gilberto Nájera 6  Esc. 957','2021-08-20 22:00:00',2,4598284333431420,'76886N'),(201,'Diego','Christian','346555093','Diego@gmail.com','41226','Glorieta Bernardo  7 Puerta 202','2021-08-31 22:00:00',2,4588775778211560,'54855I'),(202,'Heather','Davenport','346555661','Heather@gmail.com','7444','Bajada Lucía García  13 Puerta 083','2021-10-02 22:00:00',1,4594406456621354,'64374Q'),(203,'Dominik','Bentley','347555160','Dominik@gmail.com','74055','Conjunto Reina Granados 7 Esc. 417  Puerta 054','2021-10-03 22:00:00',2,4575744426441932,'64887R'),(204,'Jennifer','Sullivan','347555288','Jennifer@gmail.com','69507','Calleja Lilia 85 Puerta 317  Puerta 043','2021-10-04 22:00:00',1,4578542963291534,'56796N'),(205,'Dillan','Howell','347555474','Dillan@gmail.com','64228','Rambla Sofía 85','2021-10-05 22:00:00',1,4580637566371983,'63001C'),(206,'Roger','Wallace','346555658','Roger@gmail.com','78268','Pasaje Mariana Gámez s/n. Puerta 958  Puerta 059','2021-10-21 22:00:00',2,4597327070731724,'61652N'),(207,'Roman','Mcbride','347555403','Roman@gmail.com','50322','Explanada Arturo Hinojosa  4 Esc. 667','2021-10-22 22:00:00',2,4587339381071814,'68396F'),(208,'Eli','Chavez','347555367','Eli@gmail.com','26287','Vía Pública Conchita 5  Puerta 410','2021-10-29 22:00:00',1,4584637235031454,'64949W'),(209,'Jovan','Greene','347555686','Jovan@gmail.com','2247','Bajada Ricardo s/n. Esc. 906  Puerta 731','2021-11-09 23:00:00',2,4574478513091663,'51257I'),(210,'Demarion','Horne','347555147','Demarion@gmail.com','94453','Conjunto Carmen Cepeda 5 Esc. 918  Puerta 313','2021-11-14 23:00:00',1,4580568726541214,'57317G'),(211,'Xiomara','Mcdowell','347555955','Xiomara@gmail.com','33723','Sector Óscar s/n. Puerta 705  Puerta 083','2021-11-16 23:00:00',1,4577527789581166,'59641U'),(212,'Naomi','Avery','347555490','Naomi@gmail.com','71094','Senda Ernesto 86  Esc. 024','2021-11-26 23:00:00',2,4580502568661282,'61701R'),(213,'Sarah','Cherry','347555272','Sarah@gmail.com','57374','Urbanización Victoria s/n.  Esc. 065','2021-12-11 23:00:00',2,4598283369631388,'78331F'),(214,'Shyla','Bennett','346555607','Shyla@gmail.com','60421','Puerta Juan Carlos 0 Puerta 051  Puerta 632','2021-12-16 23:00:00',1,4591690072931461,'55659O'),(215,'Makenzie','Scott','347555945','Makenzie@gmail.com','7391','Puente Gabriel Alcántar 68','2021-12-22 23:00:00',2,4585710350981011,'75126W'),(216,'Kasey','Newton','346555079','Kasey@gmail.com','55638','Glorieta Rodrigo Ibarra 0','2021-12-28 23:00:00',2,4571518460501295,'78158Z'),(217,'Sydney','Dickerson','347555532','Sydney@gmail.com','68888','Lugar Juana Cadena  99 Esc. 988','2021-07-17 22:00:00',1,4578318546541181,'56408R'),(218,'Raina','Curtis','346555097','Raina@gmail.com','63612','Calle Yolanda Sosa  98 Esc. 192','2021-07-27 22:00:00',1,457968797381766,'79399X'),(219,'Madison','Terrell','347555460','Madison@gmail.com','66769','Ramal Juan Carlos 4 Puerta 010  Esc. 957','2021-08-06 22:00:00',2,4575580731501898,'76648H'),(220,'Payton','Novak','347555951','Payton@gmail.com','47503','Glorieta Francisca  30 Esc. 515','2021-08-20 22:00:00',1,4574711487571315,'66199N'),(221,'Chase','Everett','4.2195E+11','Chase@gmail.com','85072','Révová 675  Suite 499','2021-08-31 22:00:00',2,458254941481665,'74720N'),(222,'Mariam','Beltran','4.21916E+11','Mariam@gmail.com','964 77','Zámocké schody 8  Suite 817','2021-10-02 22:00:00',2,4587569158841883,'52704K'),(223,'Reese','Carroll','4.2195E+11','Reese@gmail.com','5366','Čečinová 637  Suite 639','2021-10-03 22:00:00',1,4578674292731748,'68393O'),(224,'Mario','Curry','4.21916E+11','Mario@gmail.com','888 69','Haydnova 71  Apt. 449','2021-10-04 22:00:00',2,4576444231071986,'57306H'),(225,'Edward','Weaver','4.21919E+11','Edward@gmail.com','10 941','Levočská 35  Suite 546','2021-10-05 22:00:00',1,4571745432371301,'75475A'),(226,'Giada','Mcmillan','4.21951E+11','Giada@gmail.com','38717','Plynárenská 18  Suite 611','2021-10-21 22:00:00',1,4590242428151103,'52861Q'),(227,'Holden','Moore','4.21941E+11','Holden@gmail.com','85246','Valchárska 47  Apt. 332','2021-10-22 22:00:00',2,4595230516061635,'51088T'),(228,'Mollie','Acevedo','4.21911E+11','Mollie@gmail.com','049 76','Fándlyho 295  Apt. 643','2021-10-29 22:00:00',2,4592456478611920,'69296I'),(229,'Samara','Estrada','4.21906E+11','Samara@gmail.com','96428','Jadrová 9  Suite 148','2021-11-09 23:00:00',2,4594620462551161,'67154X'),(230,'Kadyn','Smith','4.21945E+11','Kadyn@gmail.com','288 41','Seberíniho 28  Apt. 938','2021-11-14 23:00:00',1,4588557817661890,'55985G'),(231,'Adyson','Brooks','4.21949E+11','Adyson@gmail.com','281 82','Priemyselná 9  Suite 161','2021-11-16 23:00:00',1,4586543166271627,'57770O'),(232,'Milo','James','4.21918E+11','Milo@gmail.com','49 645','Záhradnícka 51  Suite 533','2021-11-26 23:00:00',2,4573733931592,'71892D'),(233,'Jimena','Davila','4.21941E+11','Jimena@gmail.com','95967','Pri strelnici 22  Suite 132','2021-12-11 23:00:00',1,4571218455101718,'71497R'),(234,'Charlie','Freeman','4.21941E+11','Charlie@gmail.com','19544','Podniková 9  Suite 076','2021-12-16 23:00:00',2,4598572838861434,'63188T'),(235,'Darius','Stewart','4.21909E+11','Darius@gmail.com','777 81','Nad Sihoťou 5  Apt. 234','2021-12-22 23:00:00',1,4569651033861511,'67793I'),(236,'Rosemary','Berger','30695555696','Rosemary@gmail.com','54817','70700 Μπότσαρης Radial  Apt. 109','2021-12-28 23:00:00',2,4576236894751127,'79734H'),(237,'Jamarcus','Roy','3.06976E+11','Jamarcus@gmail.com','52423','684 Φώτιος Ridge  Suite 252','2021-07-17 22:00:00',2,4584314097201079,'73784W'),(238,'America','Frost','30 69555862','America@gmail.com','16688','068 Στυλιανός Mountain  Apt. 119','2021-07-27 22:00:00',2,4576506961301957,'61030N'),(239,'Kobe','Jefferson','30 69555098','Kobe@gmail.com','78437-4330','1836 Ανδρεάδης Mountain  Apt. 625','2021-08-06 22:00:00',2,4571572642701981,'76255R'),(240,'Siena','Warren','3.06946E+11','Siena@gmail.com','67431-9783','6141 Λόντος Junction  Apt. 037','2021-08-20 22:00:00',1,4596422161551328,'68435M'),(241,'Cortez','Haas','3.06956E+11','Cortez@gmail.com','84780-9512','16979 Κανακάρης-Ρούφος Divide  Suite 070','2021-08-31 22:00:00',2,4568665827241065,'65716E'),(242,'Tatum','Beasley','30 69555652','Tatum@gmail.com','87320','03313 Γεωργίου Square  Apt. 196','2021-10-02 22:00:00',2,4591623473731406,'79195I'),(243,'Dale','Schwartz','3.06946E+11','Dale@gmail.com','27180','4023 Αρβανίτης Ports  Apt. 203','2021-10-03 22:00:00',2,4591744724091421,'53162S'),(244,'Ali','Woodward','30 69555004','Ali@gmail.com','79054','27467 Καραμανλής Trafficway  Suite 079','2021-10-04 22:00:00',2,4594251153081649,'77317G'),(245,'Boston','Atkins','30 69555344','Boston@gmail.com','80791-4804','3210 Διονύσιος Street  Suite 149','2021-10-05 22:00:00',1,459743119811555,'71399J'),(246,'Emanuel','Ford','3.06996E+11','Emanuel@gmail.com','22196-4081','8298 Μαλαξός Causeway  Apt. 549','2021-10-21 22:00:00',2,4573335079651421,'53471O'),(247,'Tommy','Hill','30 69555796','Tommy@gmail.com','44651','3061 Παναγιώτης Forest  Suite 697','2021-10-22 22:00:00',1,4571202589521188,'51399B'),(248,'Natalya','Zimmerman','3.06986E+11','Natalya@gmail.com','68001','8181 Σπύρος Gateway  Suite 907','2021-10-29 22:00:00',1,4577536486121711,'62608Y'),(249,'Sierra','Shelton','3.06946E+11','Sierra@gmail.com','87802','889 Μελετόπουλος Avenue  Apt. 689','2021-11-09 23:00:00',1,4593753453691176,'67044L'),(250,'Felix','Padilla','30 69555333','Felix@gmail.com','39779-1606','861 Αριστείδης Crescent  Suite 084','2021-11-14 23:00:00',1,4573710241541549,'76524A');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `CURRENCY_ID` int NOT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `CURRENCY_ID` (`CURRENCY_ID`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`CURRENCY_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('1','Austria',1),('10','Italy',1),('11','Luxembourg',1),('12','Portugal',1),('13','Spain',1),('14','Switzerland',5),('15','The Netherlands',1),('2','Belgium',1),('3','Czech Republic',2),('4','Denmark',3),('5','England',4),('6','France',1),('7','Germany',1),('8','Greece',1),('9','Ireland',1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `CURRENCY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`CURRENCY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'Euro'),(2,'Czech Corona'),(3,'Danish Krone'),(4,'Pound sterling'),(5,'Swiss Franc');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `START_DATE` timestamp NOT NULL,
  `CAR_ID` int NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `PRICING_ID` int NOT NULL,
  PRIMARY KEY (`PRICING_ID`,`START_DATE`,`CAR_ID`,`CLIENT_ID`),
  KEY `START_DATE` (`START_DATE`),
  KEY `CAR_ID` (`CAR_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`START_DATE`) REFERENCES `ride` (`START_DATE`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `ride` (`CAR_ID`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`CLIENT_ID`) REFERENCES `ride` (`CLIENT_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `START_DATE` timestamp NOT NULL,
  `END_DATE` timestamp NOT NULL,
  `CAR_ID` int NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `KM` int NOT NULL,
  `PORT_START` int NOT NULL,
  `PORT_END` int NOT NULL,
  `TIMESTAMP_CHANGE` timestamp NOT NULL,
  `TYPE_OF_CHANGE` varchar(1) NOT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mischance`
--

DROP TABLE IF EXISTS `mischance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mischance` (
  `MISCHANCE_ID` int NOT NULL,
  `DESCRIPTION` varchar(25) NOT NULL,
  PRIMARY KEY (`MISCHANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mischance`
--

LOCK TABLES `mischance` WRITE;
/*!40000 ALTER TABLE `mischance` DISABLE KEYS */;
INSERT INTO `mischance` VALUES (1,'Accident'),(2,'Flat tire'),(3,'Run out of gas'),(4,'Malfunctioning'),(5,'Other');
/*!40000 ALTER TABLE `mischance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing` (
  `PRICING_ID` int NOT NULL AUTO_INCREMENT,
  `COST_PER_MIN` float NOT NULL,
  `COST_PER_KM` float NOT NULL,
  `FIXED_COST` int NOT NULL,
  PRIMARY KEY (`PRICING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
INSERT INTO `pricing` VALUES (1,0.18,13,0),(2,0.2,15,1);
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `Rating_ID` int NOT NULL,
  `Rating` int NOT NULL,
  `Comment` varchar(45) NOT NULL,
  `CLIENT_ID` int NOT NULL,
  PRIMARY KEY (`Rating_ID`),
  KEY `fk_rating_client1_idx` (`CLIENT_ID`),
  CONSTRAINT `fk_rating_client1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`)
  ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,5,'excellent',200),(2,3,'mediocre',243),(3,3,'mediocre',144),(4,1,'awful',159),(5,3,'mediocre',103),(6,3,'mediocre',172),(7,5,'excellent',31),(8,3,'mediocre',207),(9,5,'excellent',16),(10,1,'awful',190),(11,1,'awful',56),(12,4,'good',60),(13,1,'awful',34),(14,5,'excellent',122),(15,3,'mediocre',187),(16,5,'excellent',109),(17,2,'bad',83),(18,1,'awful',133),(19,1,'awful',119),(20,4,'good',200),(21,4,'good',180),(22,3,'mediocre',247),(23,5,'excellent',199),(24,3,'mediocre',107),(25,5,'excellent',237),(26,1,'awful',146),(27,1,'awful',50),(28,5,'excellent',155),(29,1,'awful',233),(30,3,'mediocre',43),(31,5,'excellent',119),(32,2,'bad',66),(33,3,'mediocre',51),(34,5,'excellent',133),(35,5,'excellent',53),(36,3,'mediocre',206),(37,3,'mediocre',92),(38,4,'good',243),(39,1,'awful',211),(40,1,'awful',131),(41,2,'bad',139),(42,4,'good',70),(43,5,'excellent',59),(44,2,'bad',228),(45,2,'bad',204),(46,3,'mediocre',188),(47,3,'mediocre',231),(48,5,'excellent',78),(49,2,'bad',210),(50,1,'awful',87),(51,1,'awful',212),(52,5,'excellent',196),(53,5,'excellent',182),(54,2,'bad',85),(55,4,'good',117),(56,4,'good',45),(57,4,'good',210),(58,1,'awful',22),(59,3,'mediocre',80),(60,4,'good',210),(61,3,'mediocre',4),(62,5,'excellent',207),(63,5,'excellent',221),(64,4,'good',215),(65,1,'awful',194),(66,1,'awful',104),(67,1,'awful',68),(68,1,'awful',167),(69,5,'excellent',3),(70,5,'excellent',13),(71,1,'awful',145),(72,4,'good',13),(73,4,'good',67),(74,4,'good',64),(75,2,'bad',65),(76,1,'awful',132),(77,4,'good',119),(78,2,'bad',116),(79,4,'good',156),(80,5,'excellent',225),(81,5,'excellent',249),(82,1,'awful',48),(83,1,'awful',16),(84,2,'bad',197),(85,4,'good',13),(86,3,'mediocre',244),(87,4,'good',35),(88,3,'mediocre',110),(89,4,'good',72),(90,3,'mediocre',29),(91,5,'excellent',155),(92,3,'mediocre',36),(93,5,'excellent',38),(94,1,'awful',220),(95,1,'awful',72),(96,5,'excellent',204),(97,4,'good',237),(98,2,'bad',196),(99,3,'mediocre',61),(100,4,'good',154),(101,3,'mediocre',241),(102,3,'mediocre',60),(103,5,'excellent',196),(104,1,'awful',59),(105,2,'bad',116),(106,3,'mediocre',130),(107,4,'good',106),(108,3,'mediocre',165),(109,4,'good',212),(110,1,'awful',120),(111,5,'excellent',118),(112,3,'mediocre',243),(113,3,'mediocre',14),(114,2,'bad',126),(115,4,'good',40),(116,2,'bad',99),(117,5,'excellent',153),(118,2,'bad',22),(119,3,'mediocre',242),(120,4,'good',56),(121,1,'awful',78),(122,2,'bad',105),(123,5,'excellent',229),(124,2,'bad',65),(125,2,'bad',149),(126,1,'awful',200),(127,2,'bad',243),(128,1,'awful',99),(129,2,'bad',53),(130,3,'mediocre',157),(131,1,'awful',186),(132,2,'bad',146),(133,2,'bad',99),(134,4,'good',121),(135,5,'excellent',40),(136,1,'awful',203),(137,2,'bad',87),(138,2,'bad',96),(139,4,'good',235),(140,3,'mediocre',39),(141,2,'bad',78),(142,2,'bad',40),(143,5,'excellent',194),(144,5,'excellent',157),(145,1,'awful',3),(146,1,'awful',111),(147,3,'mediocre',57),(148,3,'mediocre',168),(149,1,'awful',44),(150,4,'good',53),(151,1,'awful',172),(152,2,'bad',66),(153,2,'bad',244),(154,3,'mediocre',30),(155,4,'good',7),(156,2,'bad',159),(157,2,'bad',98),(158,2,'bad',228),(159,3,'mediocre',230),(160,5,'excellent',89),(161,5,'excellent',37),(162,5,'excellent',226),(163,3,'mediocre',219),(164,3,'mediocre',38),(165,5,'excellent',31),(166,4,'good',169),(167,5,'excellent',18),(168,3,'mediocre',16),(169,2,'bad',207),(170,3,'mediocre',138),(171,5,'excellent',12),(172,1,'awful',138),(173,2,'bad',236),(174,4,'good',31),(175,5,'excellent',19),(176,4,'good',207),(177,1,'awful',205),(178,2,'bad',54),(179,3,'mediocre',155),(180,5,'excellent',2),(181,3,'mediocre',103),(182,3,'mediocre',228),(183,3,'mediocre',73),(184,5,'excellent',114),(185,5,'excellent',173),(186,5,'excellent',52),(187,2,'bad',100),(188,1,'awful',246),(189,3,'mediocre',69),(190,1,'awful',216),(191,5,'excellent',64),(192,1,'awful',19),(193,3,'mediocre',10),(194,2,'bad',228),(195,5,'excellent',173),(196,2,'bad',124);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride`
--

DROP TABLE IF EXISTS `ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ride` (
  `START_DATE` timestamp NOT NULL,
  `END_DATE` timestamp NOT NULL,
  `CAR_ID` int NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `KM` int NOT NULL,
  `PORT_START` int NOT NULL,
  `PORT_END` int NOT NULL,
  PRIMARY KEY (`START_DATE`,`CLIENT_ID`,`CAR_ID`),
  KEY `PORT_START` (`PORT_START`),
  KEY `PORT_END` (`PORT_END`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `CAR_ID` (`CAR_ID`),
  CONSTRAINT `ride_ibfk_1` FOREIGN KEY (`PORT_START`) REFERENCES `charging_port` (`PORT_ID`) 
  ON UPDATE CASCADE  ,
  CONSTRAINT `ride_ibfk_2` FOREIGN KEY (`PORT_END`) REFERENCES `charging_port` (`PORT_ID`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `ride_ibfk_3` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`)
  ON UPDATE CASCADE  ,
  CONSTRAINT `ride_ibfk_4` FOREIGN KEY (`CAR_ID`) REFERENCES `car` (`CAR_ID`) 
  ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


drop trigger if exists invoice_generator ;
-- TRIGGER 1
-- inserts invoice record when a ride is inserted
CREATE TRIGGER invoice_generator
AFTER INSERT ON ride
FOR EACH ROW 
INSERT INTO invoice(START_DATE, CAR_ID, CLIENT_ID, PRICING_ID) 
    (SELECT START_DATE, CAR_ID, c.CLIENT_ID, c.PRICING_ID
    FROM ride r
    JOIN client c ON r.CLIENT_ID = c.CLIENT_ID
    WHERE r.START_DATE = new.START_DATE 
    AND r.CAR_ID = new.CAR_ID
    AND r.CLIENT_ID = new.CLIENT_ID)
;
drop trigger if exists invoice_update;
-- TRIGGER 2 (UPDATE TRIGGER)
-- updates foreign keys from invoice table when an update in the ride table is made for the row effected 
-- (ex. the wrong car was used in the ride table, so also the invoice is updated)
DELIMITER $$
CREATE TRIGGER invoice_update
AFTER UPDATE ON `ride` 
FOR EACH ROW
BEGIN
    IF old.client_id <> new.client_id OR new.car_id <> old.client_id OR new.start_date <> old.start_date THEN
        DELETE FROM invoice
            WHERE client_id = old.client_id
            AND car_id = old.car_id
            AND start_date = old.start_date;
        
        INSERT INTO invoice
            (SELECT r.START_DATE, r.CAR_ID, r.CLIENT_ID, c.PRICING_ID
            FROM ride r
            JOIN client c ON c.CLIENT_ID = r.CLIENT_ID
            WHERE r.client_id = new.client_id
            AND r.start_date = new.start_date
            AND r.car_id = new.car_id
            );
	END IF;
END$$    
DELIMITER ;

drop trigger if exists log_populator_insert;
drop trigger if exists log_populator_update;
drop trigger if exists log_populator_delete;
-- TRIGGER 3-4-5 (INSERT INTO LOG TABLE)
-- keeps records of each state of each ride record
-- (ex. the wrong car was used in the ride table, so also the invoice is updated)
CREATE TRIGGER log_populator_insert
AFTER INSERT ON ride
FOR EACH ROW 
    INSERT INTO log (START_DATE, END_DATE, CAR_ID, CLIENT_ID, KM, PORT_START, PORT_END, TIMESTAMP_CHANGE, TYPE_OF_CHANGE) 
    VALUES
    (new.START_DATE, new.END_DATE, new.CAR_ID, new.CLIENT_ID, new.KM, new.PORT_START, new.PORT_END, now(), "I")
;
CREATE TRIGGER log_populator_update
AFTER UPDATE ON ride
FOR EACH ROW 
    INSERT INTO log (START_DATE, END_DATE, CAR_ID, CLIENT_ID, KM, PORT_START, PORT_END, TIMESTAMP_CHANGE, TYPE_OF_CHANGE) 
    VALUES
    (new.START_DATE, new.END_DATE, new.CAR_ID, new.CLIENT_ID, new.KM, new.PORT_START, new.PORT_END, now(), "U")
;
CREATE TRIGGER log_populator_delete
BEFORE DELETE ON ride
FOR EACH ROW 
    INSERT INTO log (START_DATE, END_DATE, CAR_ID, CLIENT_ID, KM, PORT_START, PORT_END, TIMESTAMP_CHANGE, TYPE_OF_CHANGE) 
    VALUES
    (old.START_DATE, old.END_DATE, old.CAR_ID, old.CLIENT_ID, old.KM, old.PORT_START, old.PORT_END, now(), "D")
;


--
-- Dumping data for table `ride`
--

LOCK TABLES `ride` WRITE;
/*!40000 ALTER TABLE `ride` DISABLE KEYS */;
INSERT INTO `ride` VALUES ('2018-01-01 08:13:00','2018-01-01 15:22:00',34,27,1955,21,35),('2018-01-27 22:51:00','2018-01-30 02:52:00',19,201,1180,2,36),('2018-01-30 07:57:00','2018-02-02 07:10:00',8,48,787,30,37),('2018-02-01 23:43:00','2018-02-02 05:41:00',2,116,1299,25,20),('2018-02-02 17:51:00','2018-02-13 20:47:00',21,250,789,35,20),('2018-02-14 01:47:00','2018-02-16 18:02:00',1,185,1206,9,11),('2018-02-16 11:34:00','2018-02-17 04:18:00',15,148,583,24,19),('2018-02-16 21:09:00','2018-02-18 15:49:00',8,13,355,34,20),('2018-02-18 18:06:00','2018-02-20 19:49:00',9,30,666,5,36),('2018-02-21 18:07:00','2018-02-24 07:54:00',25,177,458,36,24),('2018-02-23 19:40:00','2018-02-25 00:18:00',20,185,484,19,13),('2018-02-25 10:30:00','2018-03-17 09:28:00',36,76,870,2,28),('2018-03-17 11:19:00','2018-03-21 15:53:00',37,60,1708,35,10),('2018-03-21 08:44:00','2018-03-23 01:16:00',29,181,712,5,33),('2018-03-23 17:09:00','2018-03-24 15:43:00',13,134,218,31,37),('2018-03-24 16:22:00','2018-04-03 08:26:00',50,248,1090,14,7),('2018-04-02 23:25:00','2018-04-07 14:00:00',26,245,1313,21,26),('2018-04-07 10:48:00','2018-04-08 13:16:00',10,157,1370,28,28),('2018-04-08 05:03:00','2018-04-21 16:34:00',45,99,1142,33,11),('2018-04-22 10:02:00','2018-04-25 06:35:00',44,51,906,6,15),('2018-04-25 02:49:00','2018-04-28 10:10:00',29,86,209,7,1),('2018-04-28 09:47:00','2018-05-03 16:32:00',36,84,220,19,31),('2018-05-03 20:38:00','2018-05-04 16:10:00',43,11,671,7,20),('2018-05-05 03:34:00','2018-05-26 18:23:00',1,216,1005,2,11),('2018-05-26 13:01:00','2018-05-30 13:59:00',23,39,570,5,12),('2018-05-31 06:28:00','2018-06-03 06:41:00',9,176,552,28,12),('2018-06-03 12:33:00','2018-06-18 04:52:00',16,123,2737,29,17),('2018-06-17 23:55:00','2018-06-21 14:56:00',1,156,1349,4,24),('2018-06-22 04:01:00','2018-06-27 05:44:00',32,165,385,8,1),('2018-06-27 20:42:00','2018-07-03 00:11:00',3,225,363,28,24),('2018-07-03 08:21:00','2018-07-13 11:40:00',43,116,2382,3,12),('2018-07-13 10:29:00','2018-08-23 15:52:00',18,209,1785,33,29),('2018-08-23 12:11:00','2018-09-04 14:35:00',13,163,146,30,7),('2018-09-04 06:31:00','2018-09-13 06:43:00',36,56,1446,32,25),('2018-09-13 06:50:00','2018-09-14 20:22:00',2,117,2377,17,32),('2018-09-14 17:54:00','2018-09-16 13:05:00',31,245,1743,11,24),('2018-09-16 13:59:00','2018-09-17 22:33:00',8,180,1277,26,7),('2018-09-18 10:27:00','2018-09-27 05:06:00',41,161,1382,16,35),('2018-09-27 06:23:00','2018-10-01 02:38:00',31,123,2666,15,17),('2018-09-30 17:08:00','2018-10-13 04:59:00',23,195,825,6,33),('2018-10-13 06:18:00','2018-10-28 05:22:00',38,27,2242,14,3),('2018-10-28 15:34:00','2018-10-29 20:50:00',47,42,820,8,13),('2018-10-29 19:37:00','2018-11-11 00:58:00',41,40,730,9,9),('2018-11-11 12:19:00','2018-11-13 12:02:00',30,82,160,2,1),('2018-11-13 21:26:00','2018-11-20 16:18:00',1,7,1555,11,15),('2018-11-19 23:18:00','2018-11-21 00:21:00',10,185,3940,21,3),('2018-11-20 12:13:00','2018-12-07 04:06:00',24,2,836,27,34),('2018-12-06 23:55:00','2019-01-09 14:35:00',46,5,486,30,15),('2019-01-09 11:53:00','2019-01-18 07:34:00',19,227,973,1,28),('2019-01-18 20:51:00','2019-01-22 06:16:00',27,63,1015,34,9),('2019-01-22 15:40:00','2019-01-24 08:35:00',37,166,2014,26,10),('2019-01-25 01:04:00','2019-01-27 18:48:00',15,188,1531,13,10),('2019-01-26 23:46:00','2019-02-06 10:51:00',2,123,1229,35,7),('2019-02-06 03:56:00','2019-02-10 20:44:00',34,169,801,31,5),('2019-02-10 23:59:00','2019-02-14 10:05:00',15,37,2302,37,17),('2019-02-15 06:56:00','2019-02-16 15:48:00',26,98,986,29,37),('2019-02-16 19:35:00','2019-02-20 09:30:00',3,144,412,13,23),('2019-02-20 14:41:00','2019-03-10 06:17:00',31,140,1014,1,13),('2019-03-09 18:49:00','2019-03-23 06:53:00',9,50,1496,16,36),('2019-03-23 16:07:00','2019-03-24 03:52:00',21,37,2382,12,3),('2019-03-24 12:42:00','2019-03-25 18:02:00',13,233,486,15,30),('2019-03-26 07:13:00','2019-03-26 20:27:00',34,219,587,22,22),('2019-03-26 18:58:00','2019-03-27 12:49:00',11,226,227,32,37),('2019-03-27 16:13:00','2019-04-23 05:48:00',37,199,515,22,4),('2019-04-23 07:42:00','2019-05-01 08:04:00',19,102,730,9,10),('2019-05-01 01:31:00','2019-05-19 22:26:00',45,32,827,24,27),('2019-05-19 23:32:00','2019-06-06 10:39:00',32,74,1057,23,8),('2019-06-06 17:06:00','2019-06-08 07:15:00',12,130,1057,23,8),('2019-06-07 18:49:00','2019-06-17 13:27:00',19,117,1093,29,13),('2019-06-17 07:05:00','2019-06-21 08:09:00',14,199,1899,4,4),('2019-06-22 04:02:00','2019-06-29 18:21:00',28,133,1995,35,3),('2019-06-29 23:21:00','2019-07-19 17:47:00',31,20,2294,9,17),('2019-07-19 23:36:00','2019-07-23 12:04:00',18,180,1102,4,23),('2019-07-23 05:24:00','2019-07-25 18:43:00',24,136,585,12,13),('2019-07-26 04:15:00','2019-07-30 18:55:00',49,22,725,23,12),('2019-07-31 02:42:00','2019-08-21 10:18:00',32,99,799,25,35),('2019-08-22 05:17:00','2019-09-01 07:39:00',39,224,1589,33,4),('2019-09-01 16:37:00','2019-09-19 15:29:00',14,131,998,8,24),('2019-09-20 09:26:00','2019-09-22 03:05:00',1,90,827,24,30),('2019-09-22 16:51:00','2019-09-24 01:23:00',11,71,1541,21,6),('2019-09-23 18:27:00','2019-09-28 04:02:00',27,125,1349,24,4),('2019-09-28 08:17:00','2019-10-02 17:03:00',21,133,1531,16,10),('2019-10-02 19:24:00','2019-10-04 05:53:00',37,24,278,37,13),('2019-10-04 08:48:00','2019-10-18 08:33:00',33,110,915,9,36),('2019-10-18 05:32:00','2019-10-30 12:05:00',34,239,1425,25,31),('2019-10-30 19:14:00','2019-10-30 17:36:00',22,128,2774,3,20),('2019-10-30 23:18:00','2019-11-02 11:04:00',16,149,1047,16,34),('2019-11-02 19:06:00','2019-11-21 20:43:00',19,245,996,11,7),('2019-11-21 13:09:00','2019-11-22 17:50:00',31,3,1395,11,11),('2019-11-22 10:48:00','2019-11-24 22:09:00',41,65,2597,10,21),('2019-11-25 00:16:00','2019-11-27 02:41:00',32,28,1989,36,4),('2019-11-27 17:10:00','2019-11-28 10:01:00',49,136,305,23,37),('2019-11-28 09:04:00','2019-11-29 22:12:00',50,93,801,5,31),('2019-11-29 12:56:00','2019-12-06 18:52:00',49,182,2666,17,15),('2019-12-07 06:58:00','2019-12-09 11:33:00',16,25,1449,35,1),('2019-12-09 20:45:00','2019-12-10 21:38:00',11,172,792,32,8),('2019-12-11 08:04:00','2019-12-11 11:45:00',40,48,1263,4,32),('2019-12-12 00:04:00','2019-12-16 15:08:00',2,176,347,6,23),('2019-12-16 22:41:00','2019-12-27 01:54:00',47,121,2352,29,10),('2019-12-27 02:00:00','2020-01-01 21:09:00',36,220,945,20,33),('2020-01-02 07:44:00','2020-01-09 14:59:00',12,115,2945,28,17),('2020-01-08 05:55:00','2020-01-10 03:36:00',48,158,432,12,37),('2020-01-09 15:34:00','2020-01-08 10:30:00',2,239,379,27,19),('2020-01-10 07:17:00','2020-01-10 22:50:00',13,236,205,12,32),('2020-01-11 00:03:00','2020-01-16 12:36:00',27,70,488,31,7),('2020-01-16 14:58:00','2020-02-03 10:00:00',13,72,46,2,7),('2020-02-03 14:22:00','2020-02-08 17:34:00',30,78,585,12,12),('2020-02-08 09:44:00','2020-02-13 11:48:00',3,46,1562,21,7),('2020-02-13 03:10:00','2020-02-23 18:41:00',18,40,1233,14,16),('2020-02-24 11:05:00','2020-03-16 20:29:00',5,36,186,34,14),('2020-03-17 09:03:00','2020-04-07 16:36:00',12,195,767,16,37),('2020-04-08 01:02:00','2020-04-21 07:15:00',36,52,2302,17,37),('2020-04-21 22:26:00','2020-04-22 15:04:00',6,161,587,22,22),('2020-04-30 15:38:00','2020-05-18 12:11:00',12,240,1206,11,19),('2020-05-18 10:27:00','2020-05-24 21:30:00',39,198,1603,28,25),('2020-05-25 03:24:00','2020-05-26 23:26:00',45,55,765,9,13),('2020-05-27 01:24:00','2020-06-05 12:17:00',42,72,1894,2,25),('2020-06-04 07:00:00','2020-06-20 02:38:00',24,137,4578,17,3),('2020-06-04 16:08:00','2020-06-04 14:18:00',37,168,644,30,30),('2020-06-19 08:27:00','2020-06-28 09:58:00',38,147,484,19,13),('2020-06-28 07:11:00','2020-06-30 22:38:00',13,188,414,18,27),('2020-06-30 16:15:00','2020-07-02 23:58:00',24,72,162,13,20),('2020-06-30 18:43:00','2020-06-30 13:59:00',21,112,1106,19,10),('2020-07-03 05:25:00','2020-07-03 14:36:00',39,82,205,12,32),('2020-07-03 11:11:00','2020-07-31 08:10:00',11,226,1189,25,22),('2020-07-31 15:23:00','2020-08-05 02:33:00',33,50,725,12,36),('2020-08-05 06:27:00','2020-08-14 07:42:00',15,249,463,12,33),('2020-08-15 03:40:00','2020-08-15 23:30:00',41,44,1028,28,33),('2020-08-16 10:03:00','2020-09-10 22:05:00',47,83,1263,32,4),('2020-09-10 15:10:00','2020-09-12 23:59:00',34,234,998,24,8),('2020-09-13 06:39:00','2020-09-14 21:37:00',15,214,455,1,15),('2020-09-15 11:10:00','2020-09-16 09:17:00',48,129,757,13,16),('2020-09-16 05:08:00','2020-09-27 12:54:00',25,85,1299,25,20),('2020-09-27 10:46:00','2020-10-06 09:43:00',28,24,337,2,18),('2020-10-06 14:22:00','2020-10-11 07:18:00',18,73,1169,36,30),('2020-10-11 20:24:00','2020-10-13 21:21:00',47,110,414,19,8),('2020-10-14 03:59:00','2020-10-25 08:02:00',49,161,2368,17,23),('2020-10-24 13:50:00','2020-11-03 09:49:00',25,109,896,15,36),('2020-11-03 20:55:00','2020-11-09 12:24:00',1,146,212,12,31),('2020-11-09 07:12:00','2020-11-10 22:24:00',9,9,1639,4,1),('2020-11-10 14:05:00','2020-11-13 09:49:00',6,238,1188,14,5),('2020-11-12 04:10:00','2020-11-28 09:25:00',40,163,896,36,15),('2020-11-13 01:28:00','2020-11-12 23:19:00',28,216,204,26,14),('2020-11-27 23:08:00','2020-11-29 08:20:00',10,242,721,22,37),('2020-11-29 11:03:00','2020-11-29 13:29:00',8,144,610,36,35),('2020-11-29 13:32:00','2020-12-03 21:30:00',7,21,2551,3,29),('2020-11-29 19:21:00','2020-11-29 03:31:00',20,124,363,24,28),('2020-12-04 05:15:00','2020-12-08 03:36:00',29,179,683,1,31),('2020-12-09 01:18:00','2020-12-17 00:23:00',9,124,854,6,8),('2020-12-17 13:38:00','2021-01-12 03:27:00',49,172,907,6,36),('2021-01-12 04:06:00','2021-01-14 04:42:00',23,249,1496,36,16),('2021-01-14 00:38:00','2021-01-21 17:15:00',23,142,1125,27,4),('2021-01-21 12:13:00','2021-01-23 17:04:00',47,148,598,22,6),('2021-01-23 16:11:00','2021-02-05 06:16:00',34,67,557,2,15),('2021-02-05 03:41:00','2021-02-06 16:34:00',4,166,218,32,24),('2021-02-07 06:07:00','2021-02-14 05:54:00',1,201,3021,3,7),('2021-02-14 07:50:00','2021-02-15 10:04:00',37,192,233,25,29),('2021-02-16 04:22:00','2021-02-18 13:01:00',41,239,1137,20,15),('2021-02-18 17:12:00','2021-02-27 07:40:00',36,205,915,9,36),('2021-02-27 01:03:00','2021-03-01 21:30:00',34,6,875,23,28),('2021-03-02 09:49:00','2021-03-08 03:06:00',6,141,1446,32,25),('2021-03-08 01:16:00','2021-03-08 14:13:00',37,177,2080,17,7),('2021-03-08 14:25:00','2021-03-15 06:01:00',48,153,676,37,28),('2021-03-14 19:30:00','2021-03-18 11:03:00',45,115,655,6,6),('2021-03-18 05:41:00','2021-03-21 01:02:00',37,137,885,19,36),('2021-03-21 05:49:00','2021-03-22 16:51:00',23,32,1527,34,10),('2021-03-23 05:16:00','2021-03-28 13:31:00',13,42,305,37,23),('2021-03-27 20:24:00','2021-04-25 22:15:00',49,96,911,28,7),('2021-04-25 19:21:00','2021-05-05 17:26:00',38,223,321,15,10),('2021-05-05 13:06:00','2021-05-29 04:23:00',9,148,195,19,9),('2021-05-28 20:33:00','2021-06-06 06:46:00',49,58,444,12,30),('2021-06-06 03:11:00','2021-06-27 15:44:00',26,241,1196,1,36),('2021-06-27 03:26:00','2021-07-05 22:05:00',1,192,644,20,4),('2021-07-06 12:44:00','2021-07-09 17:56:00',23,248,123,37,6),('2021-07-09 16:01:00','2021-07-19 00:11:00',49,228,1886,36,3),('2021-07-18 20:16:00','2021-07-28 15:45:00',16,166,866,32,18),('2021-07-28 16:44:00','2021-08-07 02:35:00',44,202,683,1,31),('2021-08-07 22:23:00','2021-08-21 14:35:00',39,62,360,23,26),('2021-08-21 03:50:00','2021-09-01 13:32:00',30,160,2585,10,25),('2021-09-01 07:51:00','2021-10-03 13:05:00',8,22,577,16,33),('2021-10-03 07:42:00','2021-10-05 11:27:00',39,169,954,13,28),('2021-10-05 04:10:00','2021-10-05 21:46:00',32,98,1776,21,9),('2021-10-05 20:26:00','2021-10-06 14:11:00',6,208,2368,23,17),('2021-10-07 11:31:00','2021-10-22 11:34:00',34,149,1347,26,18),('2021-10-22 12:06:00','2021-10-23 03:14:00',35,80,568,13,13),('2021-10-23 06:22:00','2021-10-31 14:57:00',12,149,431,9,8),('2021-10-31 06:55:00','2021-11-10 19:02:00',46,12,1378,15,14),('2021-11-10 21:00:00','2021-11-15 20:02:00',43,12,1608,2,21),('2021-11-15 22:19:00','2021-11-17 11:30:00',44,163,2449,37,3),('2021-11-18 02:09:00','2021-11-28 15:02:00',7,220,670,1,16),('2021-11-28 19:50:00','2021-12-12 12:34:00',19,36,1819,9,25),('2021-12-12 05:06:00','2021-12-17 22:55:00',14,45,406,18,16),('2021-12-18 00:43:00','2021-12-23 08:41:00',10,247,1385,26,33);
/*!40000 ALTER TABLE `ride` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 17:51:40
