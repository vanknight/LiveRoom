-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: live_system
-- ------------------------------------------------------
-- Server version	5.7.17-log

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

DROP DATABASE IF EXISTS `live_system`;
CREATE DATABASE `live_system`;
USE `live_system`;

--
-- Table structure for table `live_barrage`
--

DROP TABLE IF EXISTS `live_barrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_barrage` (
  `lbid` varchar(32) NOT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `lrid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`lbid`),
  KEY `live_barrage___fk_lrid` (`lrid`),
  KEY `live_barrage___fk_uid` (`uid`),
  CONSTRAINT `live_barrage___fk_lrid` FOREIGN KEY (`lrid`) REFERENCES `live_room` (`lrid`),
  CONSTRAINT `live_barrage___fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_barrage`
--

LOCK TABLES `live_barrage` WRITE;
/*!40000 ALTER TABLE `live_barrage` DISABLE KEYS */;
INSERT INTO `live_barrage` VALUES ('9068c4be263246c3966a690b801ea106','3','233333','2018-12-29 12:32:25','1');
/*!40000 ALTER TABLE `live_barrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_gift`
--

DROP TABLE IF EXISTS `live_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_gift` (
  `lgid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `describe` text,
  `img` varchar(255) DEFAULT NULL,
  `price` float(32,2) DEFAULT '0.00',
  PRIMARY KEY (`lgid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_gift`
--

LOCK TABLES `live_gift` WRITE;
/*!40000 ALTER TABLE `live_gift` DISABLE KEYS */;
INSERT INTO `live_gift` VALUES (1,'棒棒糖','一个甜甜的棒棒糖，代表你的心意！','/static/gift/棒棒糖.png',1.00),(2,'血瓶','神器的血瓶，可以在紧急的时候救命！','/static/gift/血瓶.png',5.00),(3,'荧光棒','我是一个小小荧光棒，啦啦啦~','/static/gift/荧光棒.png',10.00),(4,'菊花','哦，啊~~~~','/static/gift/菊花.png',50.00),(5,'火箭','一飞冲天，世界聚焦于你！','/static/gift/火箭.png',100.00),(6,'魔法书','写有控制世界的魔法咒语的书，不要随便赠送！','/static/gift/魔法书.png',5000.00);
/*!40000 ALTER TABLE `live_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_gift_giver`
--

DROP TABLE IF EXISTS `live_gift_giver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_gift_giver` (
  `lggid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` float(32,2) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `lgid` int(11) DEFAULT NULL,
  `lrid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`lggid`),
  KEY `live_gift_giver___fk_lgid` (`lgid`),
  KEY `live_gift_giver___fk_lrid` (`lrid`),
  KEY `live_gift_giver___fk_uid` (`uid`),
  CONSTRAINT `live_gift_giver___fk_lgid` FOREIGN KEY (`lgid`) REFERENCES `live_gift` (`lgid`),
  CONSTRAINT `live_gift_giver___fk_lrid` FOREIGN KEY (`lrid`) REFERENCES `live_room` (`lrid`),
  CONSTRAINT `live_gift_giver___fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_gift_giver`
--

LOCK TABLES `live_gift_giver` WRITE;
/*!40000 ALTER TABLE `live_gift_giver` DISABLE KEYS */;
INSERT INTO `live_gift_giver` VALUES ('4d091f732e814bd59460eea20f87f916',1,10.00,'2018-12-29 12:33:30','4',3,'1');
/*!40000 ALTER TABLE `live_gift_giver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_room`
--

DROP TABLE IF EXISTS `live_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_room` (
  `lrid` varchar(32) NOT NULL,
  `roomid` varchar(16) DEFAULT NULL,
  `room_name` varchar(100) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `stream_name` varchar(32) DEFAULT NULL,
  `state` char(1) DEFAULT '0',
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`lrid`),
  KEY `live_room___fk_uid` (`uid`),
  CONSTRAINT `live_room___fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_room`
--

LOCK TABLES `live_room` WRITE;
/*!40000 ALTER TABLE `live_room` DISABLE KEYS */;
INSERT INTO `live_room` VALUES ('1','101','进入我的直播间你就发现新世界','2018-12-24 12:01:25','8rnn7xezkotm8e7lhhv398a5wu5mqjv','1','1'),('2','102','我是另一个房间名','2018-11-09 15:46:32','abcd02','0','2'),('3','103','房间三号','2018-11-23 16:58:29','upv84bt95m4a4p7wx99','0','3'),('ead438b7d5044137bc4fcd9e95f4a4ab','104','Test04的直播间','2018-11-16 09:11:30','n8b2b81t639l1m228u5lu6satve1pmw','0','4');
/*!40000 ALTER TABLE `live_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT '男',
  `state` char(1) DEFAULT '0',
  `integral` float(32,2) DEFAULT NULL COMMENT '积分',
  `wealth` float(32,2) DEFAULT NULL COMMENT '财富/余额',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','Test01','000000000000','1000.0','男','1',1000.00,1000.00),('2','Test02','000000000000','2000.0','女','1',2000.00,2000.00),('3','Test03','000000000000',NULL,'男','1',3000.00,3000.00),('4','Test04','000000000000',NULL,'女','1',4000.00,4000.00),('5','Test05','000000000000',NULL,'男','1',5000.00,5000.00);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-09 19:50:39
