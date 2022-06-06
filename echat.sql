-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: echat
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `user_id` char(255) NOT NULL,
  `session_id` int NOT NULL,
  `log_content` varchar(1024) DEFAULT NULL,
  `log_time` timestamp NOT NULL,
  KEY `log___fk_user` (`user_id`),
  KEY `log___fk_session` (`session_id`),
  CONSTRAINT `log___fk_session` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `log___fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('FaultyChow@ProtonMail.com',7,'群组聊天中文测试','2022-06-04 15:36:07'),('test@qq.com',7,'Group Chat Englis message test...','2022-06-04 15:37:22'),('test2@qq.com',7,'群组聊天中文长消息测试：这是一条很长很长很长的消息，用于测试聊天框在容纳需要换行的文本时的表现。','2022-06-04 15:38:52'),('FaultyChow@ProtonMail.com',7,'群组聊天消息实时推送测试1','2022-06-05 07:02:24'),('874318263@qq.com',7,'群组聊天消息实时推送测试2','2022-06-05 07:02:48'),('FaultyChow@ProtonMail.com',7,'群组聊天消息实时推送测试3','2022-06-05 07:03:04'),('874318263@qq.com',7,'群组聊天消息实时推送4','2022-06-05 07:03:15'),('test@qq.com',7,'hai','2022-06-05 08:46:04'),('874318263@qq.com',7,'群组聊天测试','2022-06-05 17:10:31'),('FaultyChow@ProtonMail.com',7,'应答','2022-06-05 17:10:42');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `from_user_id` char(255) NOT NULL,
  `to_user_id` char(255) NOT NULL,
  `msg_content` varchar(1024) DEFAULT NULL,
  `send_time` timestamp NOT NULL,
  KEY `msg___fk_user_1` (`from_user_id`),
  KEY `msg___fk_user_2` (`to_user_id`),
  CONSTRAINT `msg___fk_user_1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `msg___fk_user_2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('FaultyChow@ProtonMail.com','874318263@qq.com','在吗？','2022-06-04 13:28:09'),('FaultyChow@ProtonMail.com','874318263@qq.com','能借我100元吗？','2022-06-04 13:28:58'),('874318263@qq.com','FaultyChow@ProtonMail.com','抱歉，没钱','2022-06-04 13:29:20'),('FaultyChow@ProtonMail.com','874318263@qq.com','gun','2022-06-04 13:29:52'),('FaultyChow@ProtonMail.com','test@qq.com','私信聊天中文发送测试','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','在吗？','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','在吗？','2022-06-04 16:00:00'),('FaultyChow@ProtonMail.com','874318263@qq.com','在','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','找？','2022-06-04 16:00:00'),('FaultyChow@ProtonMail.com','874318263@qq.com','私聊消息推送测试1','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','私聊消息推送测试2','2022-06-04 16:00:00'),('FaultyChow@ProtonMail.com','874318263@qq.com','私聊消息推送测试3','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','私聊消息推送测试4','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','私聊消息弹窗测试','2022-06-04 16:00:00'),('FaultyChow@ProtonMail.com','874318263@qq.com','私聊消息弹窗测试1','2022-06-04 16:00:00'),('874318263@qq.com','FaultyChow@ProtonMail.com','？？？','2022-06-04 16:00:00'),('test@qq.com','FaultyChow@ProtonMail.com','ggggggg','2022-06-04 16:00:00'),('FaultyChow@ProtonMail.com','test@qq.com','bbbbnnnnn','2022-06-04 16:00:00'),('test@qq.com','FaultyChow@ProtonMail.com','fouyou','2022-06-04 16:00:00'),('test@qq.com','FaultyChow@ProtonMail.com','中文测试','2022-06-04 16:00:00');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofextcomponentconf`
--

DROP TABLE IF EXISTS `ofextcomponentconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofextcomponentconf` (
  `subdomain` varchar(255) NOT NULL,
  `wildcard` tinyint NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY (`subdomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofextcomponentconf`
--

LOCK TABLES `ofextcomponentconf` WRITE;
/*!40000 ALTER TABLE `ofextcomponentconf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofextcomponentconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofgroup`
--

DROP TABLE IF EXISTS `ofgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofgroup` (
  `groupName` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofgroup`
--

LOCK TABLES `ofgroup` WRITE;
/*!40000 ALTER TABLE `ofgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofgroupprop`
--

DROP TABLE IF EXISTS `ofgroupprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofgroupprop` (
  `groupName` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`groupName`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofgroupprop`
--

LOCK TABLES `ofgroupprop` WRITE;
/*!40000 ALTER TABLE `ofgroupprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofgroupprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofgroupuser`
--

DROP TABLE IF EXISTS `ofgroupuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofgroupuser` (
  `groupName` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `administrator` tinyint NOT NULL,
  PRIMARY KEY (`groupName`,`username`,`administrator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofgroupuser`
--

LOCK TABLES `ofgroupuser` WRITE;
/*!40000 ALTER TABLE `ofgroupuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofgroupuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofid`
--

DROP TABLE IF EXISTS `ofid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofid` (
  `idType` int NOT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofid`
--

LOCK TABLES `ofid` WRITE;
/*!40000 ALTER TABLE `ofid` DISABLE KEYS */;
INSERT INTO `ofid` VALUES (18,1),(19,1),(23,1),(25,17),(26,2),(27,1);
/*!40000 ALTER TABLE `ofid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucaffiliation`
--

DROP TABLE IF EXISTS `ofmucaffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucaffiliation` (
  `roomID` bigint NOT NULL,
  `jid` text NOT NULL,
  `affiliation` tinyint NOT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucaffiliation`
--

LOCK TABLES `ofmucaffiliation` WRITE;
/*!40000 ALTER TABLE `ofmucaffiliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofmucaffiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucconversationlog`
--

DROP TABLE IF EXISTS `ofmucconversationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucconversationlog` (
  `roomID` bigint NOT NULL,
  `messageID` bigint NOT NULL,
  `sender` text NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `logTime` char(15) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `stanza` text,
  KEY `ofMucConversationLog_time_idx` (`logTime`),
  KEY `ofMucConversationLog_msg_id` (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucconversationlog`
--

LOCK TABLES `ofmucconversationlog` WRITE;
/*!40000 ALTER TABLE `ofmucconversationlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofmucconversationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucmember`
--

DROP TABLE IF EXISTS `ofmucmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucmember` (
  `roomID` bigint NOT NULL,
  `jid` text NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `faqentry` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucmember`
--

LOCK TABLES `ofmucmember` WRITE;
/*!40000 ALTER TABLE `ofmucmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofmucmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucroom`
--

DROP TABLE IF EXISTS `ofmucroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucroom` (
  `serviceID` bigint NOT NULL,
  `roomID` bigint NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `naturalName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lockedDate` char(15) NOT NULL,
  `emptyDate` char(15) DEFAULT NULL,
  `canChangeSubject` tinyint NOT NULL,
  `maxUsers` int NOT NULL,
  `publicRoom` tinyint NOT NULL,
  `moderated` tinyint NOT NULL,
  `membersOnly` tinyint NOT NULL,
  `canInvite` tinyint NOT NULL,
  `roomPassword` varchar(50) DEFAULT NULL,
  `canDiscoverJID` tinyint NOT NULL,
  `logEnabled` tinyint NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rolesToBroadcast` tinyint NOT NULL,
  `useReservedNick` tinyint NOT NULL,
  `canChangeNick` tinyint NOT NULL,
  `canRegister` tinyint NOT NULL,
  `allowpm` tinyint DEFAULT NULL,
  `fmucEnabled` tinyint DEFAULT NULL,
  `fmucOutboundNode` varchar(255) DEFAULT NULL,
  `fmucOutboundMode` tinyint DEFAULT NULL,
  `fmucInboundNodes` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`name`),
  KEY `ofMucRoom_roomid_idx` (`roomID`),
  KEY `ofMucRoom_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucroom`
--

LOCK TABLES `ofmucroom` WRITE;
/*!40000 ALTER TABLE `ofmucroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofmucroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucroomprop`
--

DROP TABLE IF EXISTS `ofmucroomprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucroomprop` (
  `roomID` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`roomID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucroomprop`
--

LOCK TABLES `ofmucroomprop` WRITE;
/*!40000 ALTER TABLE `ofmucroomprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofmucroomprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucservice`
--

DROP TABLE IF EXISTS `ofmucservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucservice` (
  `serviceID` bigint NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isHidden` tinyint NOT NULL,
  PRIMARY KEY (`subdomain`),
  KEY `ofMucService_serviceid_idx` (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucservice`
--

LOCK TABLES `ofmucservice` WRITE;
/*!40000 ALTER TABLE `ofmucservice` DISABLE KEYS */;
INSERT INTO `ofmucservice` VALUES (1,'conference',NULL,0);
/*!40000 ALTER TABLE `ofmucservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofmucserviceprop`
--

DROP TABLE IF EXISTS `ofmucserviceprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofmucserviceprop` (
  `serviceID` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`serviceID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofmucserviceprop`
--

LOCK TABLES `ofmucserviceprop` WRITE;
/*!40000 ALTER TABLE `ofmucserviceprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofmucserviceprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofoffline`
--

DROP TABLE IF EXISTS `ofoffline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofoffline` (
  `username` varchar(64) NOT NULL,
  `messageID` bigint NOT NULL,
  `creationDate` char(15) NOT NULL,
  `messageSize` int NOT NULL,
  `stanza` text NOT NULL,
  PRIMARY KEY (`username`,`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofoffline`
--

LOCK TABLES `ofoffline` WRITE;
/*!40000 ALTER TABLE `ofoffline` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofoffline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpresence`
--

DROP TABLE IF EXISTS `ofpresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpresence` (
  `username` varchar(64) NOT NULL,
  `offlinePresence` text,
  `offlineDate` char(15) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpresence`
--

LOCK TABLES `ofpresence` WRITE;
/*!40000 ALTER TABLE `ofpresence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofpresence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofprivacylist`
--

DROP TABLE IF EXISTS `ofprivacylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofprivacylist` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isDefault` tinyint NOT NULL,
  `list` text NOT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofPrivacyList_default_idx` (`username`,`isDefault`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofprivacylist`
--

LOCK TABLES `ofprivacylist` WRITE;
/*!40000 ALTER TABLE `ofprivacylist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofprivacylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofproperty`
--

DROP TABLE IF EXISTS `ofproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofproperty` (
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  `encrypted` int DEFAULT NULL,
  `iv` char(24) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofproperty`
--

LOCK TABLES `ofproperty` WRITE;
/*!40000 ALTER TABLE `ofproperty` DISABLE KEYS */;
INSERT INTO `ofproperty` VALUES ('cache.MUCService\'conference\'Rooms.maxLifetime','-1',0,NULL),('cache.MUCService\'conference\'Rooms.size','-1',0,NULL),('passwordKey','e5VoAH9njselLYZ',0,NULL),('provider.admin.className','org.jivesoftware.openfire.admin.DefaultAdminProvider',0,NULL),('provider.auth.className','org.jivesoftware.openfire.auth.DefaultAuthProvider',0,NULL),('provider.group.className','org.jivesoftware.openfire.group.DefaultGroupProvider',0,NULL),('provider.lockout.className','org.jivesoftware.openfire.lockout.DefaultLockOutProvider',0,NULL),('provider.securityAudit.className','org.jivesoftware.openfire.security.DefaultSecurityAuditProvider',0,NULL),('provider.user.className','org.jivesoftware.openfire.user.DefaultUserProvider',0,NULL),('provider.vcard.className','org.jivesoftware.openfire.vcard.DefaultVCardProvider',0,NULL),('update.lastCheck','1654193241500',0,NULL),('xmpp.auth.anonymous','false',0,NULL),('xmpp.domain','192.168.31.229',0,NULL),('xmpp.socket.ssl.active','true',0,NULL);
/*!40000 ALTER TABLE `ofproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubaffiliation`
--

DROP TABLE IF EXISTS `ofpubsubaffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubaffiliation` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `affiliation` varchar(10) NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubaffiliation`
--

LOCK TABLES `ofpubsubaffiliation` WRITE;
/*!40000 ALTER TABLE `ofpubsubaffiliation` DISABLE KEYS */;
INSERT INTO `ofpubsubaffiliation` VALUES ('pubsub','','192.168.31.229','owner');
/*!40000 ALTER TABLE `ofpubsubaffiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubdefaultconf`
--

DROP TABLE IF EXISTS `ofpubsubdefaultconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubdefaultconf` (
  `serviceID` varchar(100) NOT NULL,
  `leaf` tinyint NOT NULL,
  `deliverPayloads` tinyint NOT NULL,
  `maxPayloadSize` int NOT NULL,
  `persistItems` tinyint NOT NULL,
  `maxItems` int NOT NULL,
  `notifyConfigChanges` tinyint NOT NULL,
  `notifyDelete` tinyint NOT NULL,
  `notifyRetract` tinyint NOT NULL,
  `presenceBased` tinyint NOT NULL,
  `sendItemSubscribe` tinyint NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `replyPolicy` varchar(15) DEFAULT NULL,
  `associationPolicy` varchar(15) NOT NULL,
  `maxLeafNodes` int NOT NULL,
  PRIMARY KEY (`serviceID`,`leaf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubdefaultconf`
--

LOCK TABLES `ofpubsubdefaultconf` WRITE;
/*!40000 ALTER TABLE `ofpubsubdefaultconf` DISABLE KEYS */;
INSERT INTO `ofpubsubdefaultconf` VALUES ('pubsub',0,0,0,0,0,1,1,1,0,0,'publishers',1,'open','English',NULL,'all',-1),('pubsub',1,1,10485760,0,1,1,1,1,0,1,'publishers',1,'open','English',NULL,'all',-1);
/*!40000 ALTER TABLE `ofpubsubdefaultconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubitem`
--

DROP TABLE IF EXISTS `ofpubsubitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubitem` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `payload` mediumtext,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubitem`
--

LOCK TABLES `ofpubsubitem` WRITE;
/*!40000 ALTER TABLE `ofpubsubitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofpubsubitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubnode`
--

DROP TABLE IF EXISTS `ofpubsubnode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubnode` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `leaf` tinyint NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `deliverPayloads` tinyint NOT NULL,
  `maxPayloadSize` int DEFAULT NULL,
  `persistItems` tinyint DEFAULT NULL,
  `maxItems` int DEFAULT NULL,
  `notifyConfigChanges` tinyint NOT NULL,
  `notifyDelete` tinyint NOT NULL,
  `notifyRetract` tinyint NOT NULL,
  `presenceBased` tinyint NOT NULL,
  `sendItemSubscribe` tinyint NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint NOT NULL,
  `configSubscription` tinyint NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `payloadType` varchar(100) DEFAULT NULL,
  `bodyXSLT` varchar(100) DEFAULT NULL,
  `dataformXSLT` varchar(100) DEFAULT NULL,
  `creator` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `replyPolicy` varchar(15) DEFAULT NULL,
  `associationPolicy` varchar(15) DEFAULT NULL,
  `maxLeafNodes` int DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubnode`
--

LOCK TABLES `ofpubsubnode` WRITE;
/*!40000 ALTER TABLE `ofpubsubnode` DISABLE KEYS */;
INSERT INTO `ofpubsubnode` VALUES ('pubsub','',0,'001654193204087','001654193204087',NULL,0,0,0,0,1,1,1,0,0,'publishers',1,0,'open','','','','192.168.31.229','','English','',NULL,'all',-1);
/*!40000 ALTER TABLE `ofpubsubnode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubnodegroups`
--

DROP TABLE IF EXISTS `ofpubsubnodegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubnodegroups` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `rosterGroup` varchar(100) NOT NULL,
  KEY `ofPubsubNodeGroups_idx` (`serviceID`,`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubnodegroups`
--

LOCK TABLES `ofpubsubnodegroups` WRITE;
/*!40000 ALTER TABLE `ofpubsubnodegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofpubsubnodegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubnodejids`
--

DROP TABLE IF EXISTS `ofpubsubnodejids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubnodejids` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `associationType` varchar(20) NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubnodejids`
--

LOCK TABLES `ofpubsubnodejids` WRITE;
/*!40000 ALTER TABLE `ofpubsubnodejids` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofpubsubnodejids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofpubsubsubscription`
--

DROP TABLE IF EXISTS `ofpubsubsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofpubsubsubscription` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `state` varchar(15) NOT NULL,
  `deliver` tinyint NOT NULL,
  `digest` tinyint NOT NULL,
  `digest_frequency` int NOT NULL,
  `expire` char(15) DEFAULT NULL,
  `includeBody` tinyint NOT NULL,
  `showValues` varchar(30) DEFAULT NULL,
  `subscriptionType` varchar(10) NOT NULL,
  `subscriptionDepth` tinyint NOT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofpubsubsubscription`
--

LOCK TABLES `ofpubsubsubscription` WRITE;
/*!40000 ALTER TABLE `ofpubsubsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofpubsubsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofremoteserverconf`
--

DROP TABLE IF EXISTS `ofremoteserverconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofremoteserverconf` (
  `xmppDomain` varchar(255) NOT NULL,
  `remotePort` int DEFAULT NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY (`xmppDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofremoteserverconf`
--

LOCK TABLES `ofremoteserverconf` WRITE;
/*!40000 ALTER TABLE `ofremoteserverconf` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofremoteserverconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofroster`
--

DROP TABLE IF EXISTS `ofroster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofroster` (
  `rosterID` bigint NOT NULL,
  `username` varchar(64) NOT NULL,
  `jid` varchar(1024) NOT NULL,
  `sub` tinyint NOT NULL,
  `ask` tinyint NOT NULL,
  `recv` tinyint NOT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `stanza` text,
  PRIMARY KEY (`rosterID`),
  KEY `ofRoster_unameid_idx` (`username`),
  KEY `ofRoster_jid_idx` (`jid`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofroster`
--

LOCK TABLES `ofroster` WRITE;
/*!40000 ALTER TABLE `ofroster` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofroster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofrostergroups`
--

DROP TABLE IF EXISTS `ofrostergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofrostergroups` (
  `rosterID` bigint NOT NULL,
  `rank` tinyint NOT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`rosterID`,`rank`),
  KEY `ofRosterGroup_rosterid_idx` (`rosterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofrostergroups`
--

LOCK TABLES `ofrostergroups` WRITE;
/*!40000 ALTER TABLE `ofrostergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofrostergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofsaslauthorized`
--

DROP TABLE IF EXISTS `ofsaslauthorized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofsaslauthorized` (
  `username` varchar(64) NOT NULL,
  `principal` text NOT NULL,
  PRIMARY KEY (`username`,`principal`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofsaslauthorized`
--

LOCK TABLES `ofsaslauthorized` WRITE;
/*!40000 ALTER TABLE `ofsaslauthorized` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofsaslauthorized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofsecurityauditlog`
--

DROP TABLE IF EXISTS `ofsecurityauditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofsecurityauditlog` (
  `msgID` bigint NOT NULL,
  `username` varchar(64) NOT NULL,
  `entryStamp` bigint NOT NULL,
  `summary` varchar(255) NOT NULL,
  `node` varchar(255) NOT NULL,
  `details` text,
  PRIMARY KEY (`msgID`),
  KEY `ofSecurityAuditLog_tstamp_idx` (`entryStamp`),
  KEY `ofSecurityAuditLog_uname_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofsecurityauditlog`
--

LOCK TABLES `ofsecurityauditlog` WRITE;
/*!40000 ALTER TABLE `ofsecurityauditlog` DISABLE KEYS */;
INSERT INTO `ofsecurityauditlog` VALUES (1,'874318263@qq.com',1654193213648,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 192.168.31.229. '),(2,'874318263@qq.com',1654193257216,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 192.168.31.229. '),(3,'874318263',1654193262831,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 192.168.31.229. '),(4,'admin',1654193325334,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 192.168.31.229. '),(5,'admin',1654193329632,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 192.168.31.229. '),(6,'admin',1654193529533,'Successful admin console login attempt','faultychow','The user logged in successfully to the admin console from address 127.0.0.1. '),(7,'admin',1654193532247,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(8,'admin',1654193532409,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(9,'admin',1654193532578,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(10,'admin',1654193532751,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(11,'admin',1654193532914,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(12,'admin',1654193533060,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(13,'admin',1654193533211,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(14,'admin',1654193533348,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(15,'admin',1654193533487,'Failed admin console login attempt','faultychow','A failed login attempt to the admin console was made from address 127.0.0.1. '),(16,'admin',1654193541662,'Successful admin console login attempt','faultychow','The user logged in successfully to the admin console from address 127.0.0.1. ');
/*!40000 ALTER TABLE `ofsecurityauditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofuser`
--

DROP TABLE IF EXISTS `ofuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofuser` (
  `username` varchar(64) NOT NULL,
  `storedKey` varchar(32) DEFAULT NULL,
  `serverKey` varchar(32) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `iterations` int DEFAULT NULL,
  `plainPassword` varchar(32) DEFAULT NULL,
  `encryptedPassword` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `ofUser_cDate_idx` (`creationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofuser`
--

LOCK TABLES `ofuser` WRITE;
/*!40000 ALTER TABLE `ofuser` DISABLE KEYS */;
INSERT INTO `ofuser` VALUES ('admin','QBJgXEwlqyB4jicSmCEtLUBihbI=','bEViBAoRKcEmTbP6BBySlaU8qhQ=','EWeffs2S5E/og/DOUDMsjtpCraapIrMh',4096,NULL,'36c9027d593a2e32a560877925227ee9d8a11005edd7197fb4398247e175d0e36b864feef4895c47','Administrator','874318263@qq.com','001654193172319','0');
/*!40000 ALTER TABLE `ofuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofuserflag`
--

DROP TABLE IF EXISTS `ofuserflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofuserflag` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `startTime` char(15) DEFAULT NULL,
  `endTime` char(15) DEFAULT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofUserFlag_sTime_idx` (`startTime`),
  KEY `ofUserFlag_eTime_idx` (`endTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofuserflag`
--

LOCK TABLES `ofuserflag` WRITE;
/*!40000 ALTER TABLE `ofuserflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofuserflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofuserprop`
--

DROP TABLE IF EXISTS `ofuserprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofuserprop` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`username`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofuserprop`
--

LOCK TABLES `ofuserprop` WRITE;
/*!40000 ALTER TABLE `ofuserprop` DISABLE KEYS */;
INSERT INTO `ofuserprop` VALUES ('admin','console.rows_per_page','/session-summary.jsp=25,/muc-room-summary.jsp=25,/group-summary.jsp=25');
/*!40000 ALTER TABLE `ofuserprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofvcard`
--

DROP TABLE IF EXISTS `ofvcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofvcard` (
  `username` varchar(64) NOT NULL,
  `vcard` mediumtext NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofvcard`
--

LOCK TABLES `ofvcard` WRITE;
/*!40000 ALTER TABLE `ofvcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofvcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofversion`
--

DROP TABLE IF EXISTS `ofversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofversion` (
  `name` varchar(50) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofversion`
--

LOCK TABLES `ofversion` WRITE;
/*!40000 ALTER TABLE `ofversion` DISABLE KEYS */;
INSERT INTO `ofversion` VALUES ('openfire',33);
/*!40000 ALTER TABLE `ofversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `session_name` char(255) DEFAULT NULL,
  `owner_id` char(255) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `session___fk__user` (`owner_id`),
  CONSTRAINT `session___fk__user` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (5,'猪皮恶霸','test@qq.com'),(7,'Faulty\'s Group','FaultyChow@ProtonMail.com');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_member`
--

DROP TABLE IF EXISTS `session_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_member` (
  `session_id` int NOT NULL,
  `user_id` char(255) NOT NULL,
  KEY `session_member___fk_user` (`user_id`),
  KEY `session_member___fk_session` (`session_id`),
  CONSTRAINT `session_member___fk_session` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `session_member___fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_member`
--

LOCK TABLES `session_member` WRITE;
/*!40000 ALTER TABLE `session_member` DISABLE KEYS */;
INSERT INTO `session_member` VALUES (5,'test@qq.com'),(5,'test0@qq.com'),(5,'test1@qq.com'),(5,'test2@qq.com'),(7,'FaultyChow@ProtonMail.com'),(7,'test@qq.com'),(7,'test2@qq.com'),(7,'874318263@qq.com'),(5,'FaultyChow@ProtonMail.com');
/*!40000 ALTER TABLE `session_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` char(255) NOT NULL,
  `user_name` char(255) NOT NULL,
  `password` char(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('874318263@qq.com','败笔','123456'),('admin','admin','admin'),('FaultyChow@ProtonMail.com','FaultyChow','123456'),('test@qq.com','Test','123456'),('test0@qq.com','测试0','123456'),('test1@qq.com','测试1','123456'),('test2@qq.com','测试2','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `del_friend` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
        DELETE FROM session WHERE session_id IN (SELECT session_id FROM session_member WHERE user_id = OLD.user_id) AND owner_id = 'admin';
    end */;;
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

-- Dump completed on 2022-06-06 14:12:04
