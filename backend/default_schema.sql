-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tibia_depressao_zerada
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `account_ban_history`
--

DROP TABLE IF EXISTS `account_ban_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_ban_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `banned_by` (`banned_by`),
  KEY `account_id_2` (`account_id`),
  KEY `account_id_3` (`account_id`),
  KEY `account_id_4` (`account_id`),
  KEY `account_id_5` (`account_id`),
  CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_ban_history`
--

LOCK TABLES `account_ban_history` WRITE;
/*!40000 ALTER TABLE `account_ban_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_ban_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_bans`
--

DROP TABLE IF EXISTS `account_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_bans`
--

LOCK TABLES `account_bans` WRITE;
/*!40000 ALTER TABLE `account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_character_sale`
--

DROP TABLE IF EXISTS `account_character_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_character_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `price_type` tinyint(4) NOT NULL,
  `price_coins` int(11) DEFAULT NULL,
  `price_gold` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL,
  `dta_valid` datetime NOT NULL,
  `dta_sale` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_player_UNIQUE` (`id_player`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_character_sale`
--

LOCK TABLES `account_character_sale` WRITE;
/*!40000 ALTER TABLE `account_character_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_character_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_character_sale_history`
--

DROP TABLE IF EXISTS `account_character_sale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_character_sale_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_old_account` int(11) DEFAULT NULL,
  `id_player` int(11) DEFAULT NULL,
  `id_new_account` int(11) DEFAULT NULL,
  `price_type` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dta_sale` datetime DEFAULT NULL,
  `extornada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_old_acc_idx` (`id_old_account`) USING BTREE,
  KEY `id_new_acc_idx` (`id_new_account`) USING BTREE,
  KEY `id_player_idx` (`id_player`) USING BTREE,
  CONSTRAINT `id_new_acc` FOREIGN KEY (`id_new_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `id_old_acc` FOREIGN KEY (`id_old_account`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_player` FOREIGN KEY (`id_player`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_character_sale_history`
--

LOCK TABLES `account_character_sale_history` WRITE;
/*!40000 ALTER TABLE `account_character_sale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_character_sale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_viplist`
--

DROP TABLE IF EXISTS `account_viplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_viplist`
--

LOCK TABLES `account_viplist` WRITE;
/*!40000 ALTER TABLE `account_viplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_viplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `coins` int(12) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `secret_status` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` int(11) unsigned NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL DEFAULT '0',
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0',
  `passed` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `refresh` int(11) NOT NULL DEFAULT '0',
  `birth_date` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(20) NOT NULL DEFAULT '',
  `loyalty_points` bigint(20) NOT NULL DEFAULT '0',
  `authToken` varchar(100) NOT NULL DEFAULT '',
  `player_sell_bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_options`
--

DROP TABLE IF EXISTS `accounts_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_options` (
  `account_id` int(11) NOT NULL,
  `options` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_options`
--

LOCK TABLES `accounts_options` WRITE;
/*!40000 ALTER TABLE `accounts_options` DISABLE KEYS */;
INSERT INTO `accounts_options` VALUES (2,'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'),(1,'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\n'),(3,'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\niueqASgnYjJKUqkum/4P3g520g=='),(11,'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'),(12,'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\nLA//1UTMJiQT6vL5/wFnB3X6');
/*!40000 ALTER TABLE `accounts_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blessings_history`
--

DROP TABLE IF EXISTS `blessings_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blessings_history`
--

LOCK TABLES `blessings_history` WRITE;
/*!40000 ALTER TABLE `blessings_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `blessings_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_reward_history`
--

DROP TABLE IF EXISTS `daily_reward_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_reward_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `streak` smallint(2) NOT NULL DEFAULT '0',
  `event` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `instant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `daily_reward_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_reward_history`
--

LOCK TABLES `daily_reward_history` WRITE;
/*!40000 ALTER TABLE `daily_reward_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_reward_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_storage`
--

DROP TABLE IF EXISTS `global_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_storage`
--

LOCK TABLES `global_storage` WRITE;
/*!40000 ALTER TABLE `global_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_invites`
--

DROP TABLE IF EXISTS `guild_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_invites`
--

LOCK TABLES `guild_invites` WRITE;
/*!40000 ALTER TABLE `guild_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_membership`
--

DROP TABLE IF EXISTS `guild_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`player_id`),
  KEY `guild_id` (`guild_id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_membership`
--

LOCK TABLES `guild_membership` WRITE;
/*!40000 ALTER TABLE `guild_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_ranks`
--

DROP TABLE IF EXISTS `guild_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_ranks`
--

LOCK TABLES `guild_ranks` WRITE;
/*!40000 ALTER TABLE `guild_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_wars`
--

DROP TABLE IF EXISTS `guild_wars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild1` int(11) NOT NULL DEFAULT '0',
  `guild2` int(11) NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `started` bigint(15) NOT NULL DEFAULT '0',
  `ended` bigint(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `guild1` (`guild1`),
  KEY `guild2` (`guild2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_wars`
--

LOCK TABLES `guild_wars` WRITE;
/*!40000 ALTER TABLE `guild_wars` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_wars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_execute_points` int(11) NOT NULL DEFAULT '0',
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guildwar_kills`
--

DROP TABLE IF EXISTS `guildwar_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warid` (`warid`),
  CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guildwar_kills`
--

LOCK TABLES `guildwar_kills` WRITE;
/*!40000 ALTER TABLE `guildwar_kills` DISABLE KEYS */;
/*!40000 ALTER TABLE `guildwar_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_lists`
--

DROP TABLE IF EXISTS `house_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_lists`
--

LOCK TABLES `house_lists` WRITE;
/*!40000 ALTER TABLE `house_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL DEFAULT '0',
  `bid_end` int(11) NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `highest_bidder` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `beds` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `town_id` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3531 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (2,0,0,0,'Market Street 4 (Shop)',5105,1,0,0,0,0,208,3),(4,0,0,0,'Market Street 3',3475,1,0,0,0,0,150,2),(5,0,0,0,'Market Street 2',4925,1,0,0,0,0,207,3),(6,0,0,0,'Market Street 1',6680,1,0,0,0,0,258,3),(7,0,0,0,'Old Lighthouse',3610,1,0,0,0,0,177,2),(8,0,0,0,'Seagull Walk 1',5095,1,0,0,0,0,208,2),(9,0,0,0,'Seagull Walk 2',2765,1,0,0,0,0,132,3),(10,0,0,0,'Dream Street 4',3765,1,0,0,0,0,168,4),(11,0,0,0,'Elm Street 2',2665,1,0,0,0,0,112,2),(12,0,0,0,'Elm Street 1',2710,1,0,0,0,0,120,2),(13,0,0,0,'Elm Street 3',2855,1,0,0,0,0,126,3),(14,0,0,0,'Elm Street 4',3765,1,0,0,0,0,118,2),(15,0,0,0,'Dream Street 3',2710,1,0,0,0,0,122,2),(16,0,1527989802,0,'Dream Street 2',3340,1,0,0,0,0,153,2),(18,0,0,0,'Paupers Palace, Flat 13',450,1,0,0,0,0,19,1),(19,0,0,0,'Paupers Palace, Flat 12',685,1,0,0,0,0,26,2),(23,0,0,0,'Paupers Palace, Flat 14',585,1,0,0,0,0,25,1),(24,0,0,0,'Paupers Palace, Flat 15',450,1,0,0,0,0,20,1),(25,0,0,0,'Paupers Palace, Flat 16',585,1,0,0,0,0,28,1),(26,0,0,0,'Paupers Palace, Flat 17',450,1,0,0,0,0,20,1),(27,0,0,0,'Paupers Palace, Flat 18',315,1,0,0,0,0,20,1),(28,0,0,0,'Paupers Palace, Flat 01',405,1,0,0,0,0,24,1),(29,0,0,0,'Paupers Palace, Flat 02',450,1,0,0,0,0,25,1),(30,0,0,0,'Paupers Palace, Flat 03',405,1,0,0,0,0,20,1),(31,0,0,0,'Paupers Palace, Flat 04',450,1,0,0,0,0,25,1),(32,0,0,0,'Paupers Palace, Flat 05',315,1,0,0,0,0,15,1),(33,0,0,0,'Paupers Palace, Flat 06',450,1,0,0,0,0,20,1),(34,0,0,0,'Paupers Palace, Flat 07',685,1,0,0,0,0,22,2),(35,0,0,0,'Paupers Palace, Flat 21',315,1,0,0,0,0,20,1),(36,0,0,0,'Paupers Palace, Flat 22',450,1,0,0,0,0,20,1),(37,0,0,0,'Paupers Palace, Flat 23',585,1,0,0,0,0,29,1),(38,0,0,0,'Paupers Palace, Flat 24',450,1,0,0,0,0,12,1),(39,0,0,0,'Paupers Palace, Flat 26',450,1,0,0,0,0,23,1),(40,0,0,0,'Paupers Palace, Flat 28',315,1,0,0,0,0,16,1),(41,0,0,0,'Paupers Palace, Flat 27',685,1,0,0,0,0,25,2),(42,0,0,0,'Paupers Palace, Flat 25',585,1,0,0,0,0,25,1),(43,0,0,0,'Paupers Palace, Flat 31',855,1,0,0,0,0,39,1),(44,0,0,0,'Paupers Palace, Flat 32',1135,1,0,0,0,0,40,2),(45,0,0,0,'Paupers Palace, Flat 33',765,1,0,0,0,0,36,1),(46,0,0,0,'Paupers Palace, Flat 34',1675,1,0,0,0,0,61,2),(47,0,0,0,'Salvation Street 1 (Shop)',6240,1,0,0,0,0,249,4),(49,0,0,0,'Dream Street 1 (Shop)',4330,1,0,0,0,0,190,2),(50,0,0,0,'Blessed Shield Guildhall',8090,1,0,0,0,0,298,9),(51,0,0,0,'Dagger Alley 1',2665,1,0,0,0,0,126,2),(52,0,0,0,'Steel Home',13845,1,0,0,0,0,460,13),(53,0,0,0,'Iron Alley 1',3450,1,0,0,0,0,120,4),(54,0,0,0,'Iron Alley 2',3450,1,0,0,0,0,145,4),(55,0,0,0,'Swamp Watch',11090,1,0,0,0,0,360,12),(57,0,0,0,'Salvation Street 2',3790,1,0,0,0,0,138,2),(60,0,0,0,'Salvation Street 3',3790,1,0,0,0,0,158,2),(61,0,0,0,'Silver Street 3',1980,1,0,0,0,0,64,1),(62,0,0,0,'Golden Axe Guildhall',10485,1,0,0,0,0,395,10),(63,0,0,0,'Silver Street 1',2565,1,0,0,0,0,129,1),(64,0,0,0,'Silver Street 2',1980,1,0,0,0,0,105,1),(66,0,0,0,'Silver Street 4',3295,1,0,0,0,0,153,2),(67,0,0,0,'Mystic Lane 2',2980,1,0,0,0,0,140,2),(69,0,0,0,'Mystic Lane 1',2945,1,0,0,0,0,112,3),(70,0,0,0,'Loot Lane 1 (Shop)',4565,1,0,0,0,0,207,3),(71,0,0,0,'Market Street 6',5485,1,0,0,0,0,216,5),(72,0,0,0,'Market Street 7',2305,1,0,0,0,0,114,2),(73,0,0,0,'Market Street 5 (Shop)',6375,1,0,0,0,0,242,4),(194,0,0,0,'Lucky Lane 1 (Shop)',6960,1,0,0,0,0,270,4),(208,0,0,0,'Underwood 1',1495,5,0,0,0,0,41,2),(209,0,0,0,'Underwood 2',1495,5,0,0,0,0,41,2),(210,0,0,0,'Underwood 5',1370,5,0,0,0,0,35,3),(211,0,0,0,'Underwood 3',1685,5,0,0,0,0,44,3),(212,0,0,0,'Underwood 4',2235,5,0,0,0,0,56,4),(213,0,0,0,'Underwood 10',585,5,0,0,0,0,20,1),(214,0,0,0,'Underwood 6',1595,5,0,0,0,0,42,3),(215,0,0,0,'Great Willow 1a',500,5,0,0,0,0,16,1),(216,0,0,0,'Great Willow 1b',650,5,0,0,0,0,22,1),(217,0,0,0,'Great Willow 1c',650,5,0,0,0,0,22,1),(218,0,0,0,'Great Willow 2d',450,5,0,0,0,0,10,1),(219,0,0,0,'Great Willow 2c',650,5,0,0,0,0,21,1),(220,0,0,0,'Great Willow 2b',450,5,0,0,0,0,16,1),(221,0,0,0,'Great Willow 2a',650,5,0,0,0,0,17,1),(222,0,0,0,'Great Willow 3d',450,5,0,0,0,0,17,1),(223,0,0,0,'Great Willow 3c',650,5,0,0,0,0,21,1),(224,0,0,0,'Great Willow 3b',450,5,0,0,0,0,16,1),(225,0,0,0,'Great Willow 3a',650,5,0,0,0,0,20,1),(226,0,0,0,'Great Willow 4b',950,5,0,0,0,0,25,2),(227,0,0,0,'Great Willow 4c',950,5,0,0,0,0,25,2),(228,0,0,0,'Great Willow 4d',750,5,0,0,0,0,26,1),(229,0,0,0,'Great Willow 4a',950,5,0,0,0,0,25,2),(230,0,0,0,'Underwood 7',1460,5,0,0,0,0,39,2),(231,0,0,0,'Shadow Caves 3',300,5,0,0,0,0,16,1),(232,0,0,0,'Shadow Caves 4',300,5,0,0,0,0,18,1),(233,0,0,0,'Shadow Caves 2',300,5,0,0,0,0,18,1),(234,0,0,0,'Shadow Caves 1',300,5,0,0,0,0,16,1),(235,0,0,0,'Shadow Caves 17',300,5,0,0,0,0,16,1),(236,0,0,0,'Shadow Caves 18',300,5,0,0,0,0,17,1),(237,0,0,0,'Shadow Caves 15',300,5,0,0,0,0,16,1),(238,0,0,0,'Shadow Caves 16',300,5,0,0,0,0,17,1),(239,0,0,0,'Shadow Caves 13',300,5,0,0,0,0,16,1),(240,0,0,0,'Shadow Caves 14',300,5,0,0,0,0,19,1),(241,0,0,0,'Shadow Caves 11',300,5,0,0,0,0,16,1),(242,0,0,0,'Shadow Caves 12',300,5,0,0,0,0,18,1),(243,0,0,0,'Shadow Caves 27',300,5,0,0,0,0,14,1),(244,0,0,0,'Shadow Caves 28',300,5,0,0,0,0,17,1),(245,0,0,0,'Shadow Caves 25',300,5,0,0,0,0,16,1),(246,0,0,0,'Shadow Caves 26',300,5,0,0,0,0,17,1),(247,0,0,0,'Shadow Caves 23',300,5,0,0,0,0,16,1),(248,0,0,0,'Shadow Caves 24',300,5,0,0,0,0,19,1),(249,0,0,0,'Shadow Caves 21',300,5,0,0,0,0,16,1),(250,0,0,0,'Shadow Caves 22',300,5,0,0,0,0,17,1),(251,0,0,0,'Underwood 9',585,5,0,0,0,0,17,1),(252,0,0,0,'Treetop 13',1400,5,0,0,0,0,33,2),(254,0,0,0,'Underwood 8',865,5,0,0,0,0,25,2),(255,0,0,0,'Mangrove 4',950,5,0,0,0,0,25,2),(256,0,0,0,'Coastwood 10',1630,5,0,0,0,0,36,3),(257,0,0,0,'Mangrove 1',1750,5,0,0,0,0,42,3),(258,0,0,0,'Coastwood 1',980,5,0,0,0,0,24,2),(259,0,0,0,'Coastwood 2',980,5,0,0,0,0,24,2),(260,0,0,0,'Mangrove 2',1350,5,0,0,0,0,33,2),(262,0,0,0,'Mangrove 3',1150,5,0,0,0,0,29,2),(263,0,0,0,'Coastwood 9',935,5,0,0,0,0,22,1),(264,0,0,0,'Coastwood 8',1255,5,0,0,0,0,31,2),(265,0,0,0,'Coastwood 6 (Shop)',1595,5,0,0,0,0,44,1),(266,0,0,0,'Coastwood 7',660,5,0,0,0,0,19,1),(267,0,0,0,'Coastwood 5',1530,5,0,0,0,0,35,2),(268,0,0,0,'Coastwood 4',1145,5,0,0,0,0,30,2),(269,0,0,0,'Coastwood 3',1310,5,0,0,0,0,34,2),(270,0,0,0,'Treetop 11',900,5,0,0,0,0,26,2),(271,0,0,0,'Treetop 5 (Shop)',1350,5,0,0,0,0,40,1),(272,0,0,0,'Treetop 7',800,5,0,0,0,0,24,1),(273,0,0,0,'Treetop 6',450,5,0,0,0,0,15,1),(274,0,0,0,'Treetop 8',800,5,0,0,0,0,23,1),(275,0,0,0,'Treetop 9',1150,5,0,0,0,0,30,2),(276,0,0,0,'Treetop 10',1150,5,0,0,0,0,34,2),(277,0,0,0,'Treetop 4 (Shop)',1250,5,0,0,0,0,40,1),(278,0,0,0,'Treetop 3 (Shop)',1250,5,0,0,0,0,38,1),(279,0,0,0,'Treetop 2',650,5,0,0,0,0,21,1),(280,0,0,0,'Treetop 1',650,5,0,0,0,0,19,1),(281,0,0,0,'Treetop 12 (Shop)',1350,5,0,0,0,0,40,1),(469,0,0,0,'Darashia 2, Flat 07',1000,10,0,0,0,0,48,1),(470,0,0,0,'Darashia 2, Flat 01',1000,10,0,0,0,0,48,1),(471,0,0,0,'Darashia 2, Flat 02',1000,10,0,0,0,0,42,1),(472,0,0,0,'Darashia 2, Flat 06',520,10,0,0,0,0,24,1),(473,0,0,0,'Darashia 2, Flat 05',1260,10,0,0,0,0,48,2),(474,0,0,0,'Darashia 2, Flat 04',520,10,0,0,0,0,24,1),(475,0,0,0,'Darashia 2, Flat 03',1160,10,0,0,0,0,42,1),(476,0,0,0,'Darashia 2, Flat 13',1160,10,0,0,0,0,42,1),(477,0,0,0,'Darashia 2, Flat 12',520,10,0,0,0,0,24,1),(478,0,0,0,'Darashia 2, Flat 11',1000,10,0,0,0,0,42,1),(479,0,0,0,'Darashia 2, Flat 14',520,10,0,0,0,0,24,1),(480,0,0,0,'Darashia 2, Flat 15',1260,10,0,0,0,0,47,2),(481,0,0,0,'Darashia 2, Flat 16',680,10,0,0,0,0,30,1),(482,0,0,0,'Darashia 2, Flat 17',1000,10,0,0,0,0,48,1),(483,0,0,0,'Darashia 2, Flat 18',680,10,0,0,0,0,30,1),(484,0,0,0,'Darashia 1, Flat 05',1100,10,0,0,0,0,48,2),(485,0,0,0,'Darashia 1, Flat 01',1100,10,0,0,0,0,49,2),(486,0,0,0,'Darashia 1, Flat 04',1000,10,0,0,0,0,42,1),(487,0,0,0,'Darashia 1, Flat 03',2660,10,0,0,0,0,96,4),(488,0,0,0,'Darashia 1, Flat 02',1000,10,0,0,0,0,41,1),(490,0,0,0,'Darashia 1, Flat 12',1780,10,0,0,0,0,66,2),(491,0,0,0,'Darashia 1, Flat 11',1100,10,0,0,0,0,41,2),(492,0,0,0,'Darashia 1, Flat 13',1780,10,0,0,0,0,72,2),(493,0,0,0,'Darashia 1, Flat 14',2760,10,0,0,0,0,108,5),(494,0,0,0,'Darashia 4, Flat 01',1000,10,0,0,0,0,48,1),(495,0,0,0,'Darashia 4, Flat 05',1100,10,0,0,0,0,48,2),(496,0,0,0,'Darashia 4, Flat 04',1780,10,0,0,0,0,72,2),(497,0,0,0,'Darashia 4, Flat 03',1000,10,0,0,0,0,42,1),(498,0,0,0,'Darashia 4, Flat 02',1780,10,0,0,0,0,66,2),(499,0,0,0,'Darashia 4, Flat 13',1780,10,0,0,0,0,78,2),(500,0,0,0,'Darashia 4, Flat 14',1780,10,0,0,0,0,72,2),(501,0,0,0,'Darashia 4, Flat 11',1000,10,0,0,0,0,41,1),(502,0,0,0,'Darashia 4, Flat 12',2560,10,0,0,0,0,96,3),(503,0,0,0,'Darashia 7, Flat 05',1225,10,0,0,0,0,40,2),(504,0,0,0,'Darashia 7, Flat 01',1125,10,0,0,0,0,40,1),(505,0,0,0,'Darashia 7, Flat 02',1125,10,0,0,0,0,41,1),(506,0,0,0,'Darashia 7, Flat 03',2955,10,0,0,0,0,108,4),(507,0,0,0,'Darashia 7, Flat 04',1125,10,0,0,0,0,42,1),(508,0,0,0,'Darashia 7, Flat 14',2955,10,0,0,0,0,108,4),(509,0,0,0,'Darashia 7, Flat 13',1125,10,0,0,0,0,42,1),(510,0,0,0,'Darashia 7, Flat 11',1125,10,0,0,0,0,41,1),(511,0,0,0,'Darashia 7, Flat 12',2955,10,0,0,0,0,95,4),(512,0,0,0,'Darashia 5, Flat 01',1000,10,0,0,0,0,38,1),(513,0,0,0,'Darashia 5, Flat 05',1000,10,0,0,0,0,48,1),(514,0,0,0,'Darashia 5, Flat 02',1620,10,0,0,0,0,57,2),(515,0,0,0,'Darashia 5, Flat 03',1000,10,0,0,0,0,41,1),(516,0,0,0,'Darashia 5, Flat 04',1620,10,0,0,0,0,66,2),(517,0,0,0,'Darashia 5, Flat 11',1780,10,0,0,0,0,66,2),(518,0,0,0,'Darashia 5, Flat 12',1620,10,0,0,0,0,65,2),(519,0,0,0,'Darashia 5, Flat 13',1780,10,0,0,0,0,78,2),(520,0,0,0,'Darashia 5, Flat 14',1620,10,0,0,0,0,66,2),(521,0,0,0,'Darashia 6a',3115,10,0,0,0,0,117,2),(522,0,0,0,'Darashia 6b',3430,10,0,0,0,0,139,2),(523,0,0,0,'Darashia, Villa',5385,10,0,0,0,0,233,4),(525,0,0,0,'Darashia, Western Guildhall',10435,10,0,0,0,0,376,14),(526,0,0,0,'Darashia 3, Flat 01',1100,10,0,0,0,0,40,2),(527,0,0,0,'Darashia 3, Flat 05',1000,10,0,0,0,0,40,1),(529,0,0,0,'Darashia 3, Flat 02',1620,10,0,0,0,0,65,2),(530,0,0,0,'Darashia 3, Flat 03',1100,10,0,0,0,0,42,2),(531,0,0,0,'Darashia 3, Flat 04',1620,10,0,0,0,0,72,2),(532,0,0,0,'Darashia 3, Flat 13',1100,10,0,0,0,0,42,2),(533,0,0,0,'Darashia 3, Flat 14',2400,10,0,0,0,0,102,3),(534,0,0,0,'Darashia 3, Flat 11',1000,10,0,0,0,0,41,1),(535,0,0,0,'Darashia 3, Flat 12',2600,10,0,0,0,0,90,5),(541,0,0,0,'Darashia 8, Flat 11',1990,10,0,0,0,0,66,2),(542,0,0,0,'Darashia 8, Flat 12',1810,10,0,0,0,0,65,2),(544,0,0,0,'Darashia 8, Flat 14',1810,10,0,0,0,0,66,2),(545,0,0,0,'Darashia 8, Flat 13',1990,10,0,0,0,0,78,2),(574,0,0,0,'Oskahl I j',680,9,0,0,0,0,25,1),(575,0,0,0,'Oskahl I f',840,9,0,0,0,0,34,1),(576,0,0,0,'Oskahl I i',840,9,0,0,0,0,30,1),(577,0,0,0,'Oskahl I g',1140,9,0,0,0,0,42,2),(578,0,0,0,'Oskahl I h',1760,9,0,0,0,0,63,3),(579,0,0,0,'Oskahl I d',1140,9,0,0,0,0,36,2),(580,0,0,0,'Oskahl I b',840,9,0,0,0,0,30,1),(581,0,0,0,'Oskahl I c',680,9,0,0,0,0,29,1),(582,0,0,0,'Oskahl I e',840,9,0,0,0,0,33,1),(583,0,0,0,'Oskahl I a',1580,9,0,0,0,0,52,2),(584,0,0,0,'Chameken I',850,9,0,0,0,0,30,1),(585,0,0,0,'Charsirakh III',680,9,0,0,0,0,30,1),(586,0,0,0,'Murkhol I d',440,9,0,0,0,0,21,1),(587,0,0,0,'Murkhol I c',440,9,0,0,0,0,18,1),(588,0,0,0,'Murkhol I b',440,9,0,0,0,0,18,1),(589,0,0,0,'Murkhol I a',440,9,0,0,0,0,20,1),(590,0,0,0,'Charsirakh II',1140,9,0,0,0,0,39,2),(591,0,0,0,'Thanah II h',1400,9,0,0,0,0,40,2),(592,0,0,0,'Thanah II g',1650,9,0,0,0,0,45,2),(593,0,0,0,'Thanah II f',2850,9,0,0,0,0,80,3),(594,0,0,0,'Thanah II b',450,9,0,0,0,0,20,1),(595,0,0,0,'Thanah II c',450,9,0,0,0,0,15,1),(596,0,0,0,'Thanah II d',350,9,0,0,0,0,16,1),(597,0,0,0,'Thanah II e',350,9,0,0,0,0,12,1),(599,0,0,0,'Thanah II a',850,9,0,0,0,0,37,1),(600,0,0,0,'Thrarhor I c (Shop)',1050,9,0,0,0,0,28,1),(601,0,0,0,'Thrarhor I d (Shop)',1050,9,0,0,0,0,21,1),(602,0,0,0,'Thrarhor I a (Shop)',1050,9,0,0,0,0,32,1),(603,0,0,0,'Thrarhor I b (Shop)',1050,9,0,0,0,0,24,1),(604,0,0,0,'Thanah I c',3250,9,0,0,0,0,91,3),(605,0,0,0,'Thanah I d',2900,9,0,0,0,0,80,4),(606,0,0,0,'Thanah I b',3000,9,0,0,0,0,84,3),(607,0,0,0,'Thanah I a',850,9,0,0,0,0,27,1),(608,0,0,0,'Harrah I',5740,9,0,0,0,0,190,10),(609,0,0,0,'Charsirakh I b',1580,9,0,0,0,0,51,2),(610,0,0,0,'Charsirakh I a',280,9,0,0,0,0,15,1),(611,0,0,0,'Othehothep I d',2020,9,0,0,0,0,68,4),(612,0,0,0,'Othehothep I c',1720,9,0,0,0,0,58,3),(613,0,0,0,'Othehothep I b',1380,9,0,0,0,0,49,2),(614,0,0,0,'Othehothep I a',280,9,0,0,0,0,14,1),(615,0,0,0,'Othehothep II e',1340,9,0,0,0,0,44,2),(616,0,0,0,'Othehothep II f',1340,9,0,0,0,0,44,2),(617,0,0,0,'Othehothep II d',840,9,0,0,0,0,32,1),(618,0,0,0,'Othehothep II c',840,9,0,0,0,0,30,1),(619,0,0,0,'Othehothep II b',1920,9,0,0,0,0,67,3),(620,0,0,0,'Othehothep II a',400,9,0,0,0,0,18,1),(621,0,0,0,'Mothrem I',1140,9,0,0,0,0,38,2),(622,0,0,0,'Arakmehn I',1320,9,0,0,0,0,41,3),(623,0,0,0,'Othehothep III d',1040,9,0,0,0,0,36,1),(624,0,0,0,'Othehothep III c',940,9,0,0,0,0,30,2),(625,0,0,0,'Othehothep III e',840,9,0,0,0,0,32,1),(626,0,0,0,'Othehothep III f',680,9,0,0,0,0,27,1),(627,0,0,0,'Othehothep III b',1340,9,0,0,0,0,49,2),(628,0,0,0,'Othehothep III a',280,9,0,0,0,0,14,1),(629,0,0,0,'Unklath I d',1680,9,0,0,0,0,49,3),(630,0,0,0,'Unklath I e',1580,9,0,0,0,0,51,2),(631,0,0,0,'Unklath I g',1480,9,0,0,0,0,51,1),(632,0,0,0,'Unklath I f',1580,9,0,0,0,0,51,2),(633,0,0,0,'Unklath I c',1460,9,0,0,0,0,50,2),(634,0,0,0,'Unklath I b',1460,9,0,0,0,0,50,2),(635,0,0,0,'Unklath I a',1140,9,0,0,0,0,38,2),(636,0,0,0,'Arakmehn II',1040,9,0,0,0,0,38,1),(637,0,0,0,'Arakmehn III',1140,9,0,0,0,0,38,2),(638,0,0,0,'Unklath II b',680,9,0,0,0,0,25,1),(639,0,0,0,'Unklath II c',680,9,0,0,0,0,27,1),(640,0,0,0,'Unklath II d',1580,9,0,0,0,0,52,2),(641,0,0,0,'Unklath II a',1040,9,0,0,0,0,36,1),(642,0,0,0,'Arakmehn IV',1220,9,0,0,0,0,41,2),(643,0,0,0,'Rathal I b',680,9,0,0,0,0,25,1),(644,0,0,0,'Rathal I c',680,9,0,0,0,0,27,1),(645,0,0,0,'Rathal I e',780,9,0,0,0,0,27,2),(646,0,0,0,'Rathal I d',780,9,0,0,0,0,27,2),(647,0,0,0,'Rathal I a',1140,9,0,0,0,0,36,2),(648,0,0,0,'Rathal II b',680,9,0,0,0,0,25,1),(649,0,0,0,'Rathal II c',680,9,0,0,0,0,27,1),(650,0,0,0,'Rathal II d',1460,9,0,0,0,0,52,2),(651,0,0,0,'Rathal II a',1040,9,0,0,0,0,38,1),(653,0,0,0,'Esuph II a',280,9,0,0,0,0,14,1),(654,0,0,0,'Uthemath II',4460,9,0,0,0,0,138,8),(655,0,0,0,'Uthemath I e',940,9,0,0,0,0,32,2),(656,0,0,0,'Uthemath I d',840,9,0,0,0,0,30,1),(657,0,0,0,'Uthemath I f',2440,9,0,0,0,0,86,3),(658,0,0,0,'Uthemath I b',800,9,0,0,0,0,32,1),(659,0,0,0,'Uthemath I c',900,9,0,0,0,0,34,2),(660,0,0,0,'Uthemath I a',400,9,0,0,0,0,18,1),(661,0,0,0,'Botham I c',1700,9,0,0,0,0,49,2),(662,0,0,0,'Botham I e',1650,9,0,0,0,0,44,2),(663,0,0,0,'Botham I d',3050,9,0,0,0,0,80,3),(664,0,0,0,'Botham I b',3000,9,0,0,0,0,83,3),(666,0,0,0,'Horakhal',9420,9,0,0,0,0,277,14),(667,0,0,0,'Esuph III b',1340,9,0,0,0,0,49,2),(668,0,0,0,'Esuph III a',280,9,0,0,0,0,14,1),(669,0,0,0,'Esuph IV b',400,9,0,0,0,0,16,1),(670,0,0,0,'Esuph IV c',400,9,0,0,0,0,18,1),(671,0,0,0,'Esuph IV d',800,9,0,0,0,0,34,1),(672,0,0,0,'Esuph IV a',400,9,0,0,0,0,16,1),(673,0,0,0,'Botham II e',1650,9,0,0,0,0,42,2),(674,0,0,0,'Botham II g',1400,9,0,0,0,0,38,2),(675,0,0,0,'Botham II f',1650,9,0,0,0,0,44,2),(676,0,0,0,'Botham II d',1950,9,0,0,0,0,49,2),(677,0,0,0,'Botham II c',1250,9,0,0,0,0,38,2),(678,0,0,0,'Botham II b',1600,9,0,0,0,0,47,2),(679,0,0,0,'Botham II a',850,9,0,0,0,0,25,1),(680,0,0,0,'Botham III g',1650,9,0,0,0,0,42,2),(681,0,0,0,'Botham III f',2350,9,0,0,0,0,56,3),(682,0,0,0,'Botham III h',3750,9,0,0,0,0,98,3),(683,0,0,0,'Botham III d',850,9,0,0,0,0,27,1),(684,0,0,0,'Botham III e',850,9,0,0,0,0,27,1),(685,0,0,0,'Botham III b',950,9,0,0,0,0,25,2),(686,0,0,0,'Botham III c',850,9,0,0,0,0,27,1),(687,0,0,0,'Botham III a',1400,9,0,0,0,0,36,2),(688,0,0,0,'Botham IV i',1800,9,0,0,0,0,51,3),(689,0,0,0,'Botham IV h',1850,9,0,0,0,0,49,1),(690,0,0,0,'Botham IV f',1700,9,0,0,0,0,49,2),(691,0,0,0,'Botham IV g',1650,9,0,0,0,0,49,2),(692,0,0,0,'Botham IV c',850,9,0,0,0,0,27,1),(693,0,0,0,'Botham IV e',850,9,0,0,0,0,27,1),(694,0,0,0,'Botham IV d',850,9,0,0,0,0,27,1),(695,0,0,0,'Botham IV b',850,9,0,0,0,0,25,1),(696,0,0,0,'Botham IV a',1400,9,0,0,0,0,36,2),(697,0,0,0,'Ramen Tah',7650,9,0,0,0,0,184,16),(698,0,0,0,'Banana Bay 1',450,8,0,0,0,0,25,1),(699,0,0,0,'Banana Bay 2',765,8,0,0,0,0,36,1),(700,0,0,0,'Banana Bay 3',450,8,0,0,0,0,25,1),(701,0,0,0,'Banana Bay 4',450,8,0,0,0,0,25,1),(702,0,0,0,'Shark Manor',8780,8,0,0,0,0,286,15),(703,0,0,0,'Coconut Quay 1',1765,8,0,0,0,0,64,2),(704,0,0,0,'Coconut Quay 2',1045,8,0,0,0,0,42,2),(705,0,0,0,'Coconut Quay 3',2145,8,0,0,0,0,70,4),(706,0,0,0,'Coconut Quay 4',2135,8,0,0,0,0,72,3),(707,0,0,0,'Crocodile Bridge 3',1270,8,0,0,0,0,49,2),(708,0,0,0,'Crocodile Bridge 2',865,8,0,0,0,0,36,2),(709,0,0,0,'Crocodile Bridge 1',1045,8,0,0,0,0,42,2),(710,0,0,0,'Bamboo Garden 1',1640,8,0,0,0,0,63,3),(711,0,0,0,'Crocodile Bridge 4',4755,8,0,0,0,0,176,4),(712,0,0,0,'Crocodile Bridge 5',3970,8,0,0,0,0,157,2),(713,0,0,0,'Woodway 1',765,8,0,0,0,0,36,1),(714,0,0,0,'Woodway 2',585,8,0,0,0,0,30,1),(715,0,0,0,'Woodway 3',1540,8,0,0,0,0,65,2),(716,0,0,0,'Woodway 4',405,8,0,0,0,0,24,1),(717,0,0,0,'Flamingo Flats 5',1845,8,0,0,0,0,84,1),(718,0,0,0,'Bamboo Fortress',21970,8,0,0,0,0,848,20),(719,0,0,0,'Bamboo Garden 3',1540,8,0,0,0,0,63,2),(720,0,0,0,'Bamboo Garden 2',1045,8,0,0,0,0,42,2),(721,0,0,0,'Flamingo Flats 4',865,8,0,0,0,0,36,2),(722,0,0,0,'Flamingo Flats 2',1045,8,0,0,0,0,42,2),(723,0,0,0,'Flamingo Flats 3',685,8,0,0,0,0,30,2),(724,0,0,0,'Flamingo Flats 1',685,8,0,0,0,0,30,2),(725,0,0,0,'Jungle Edge 4',865,8,0,0,0,0,36,2),(726,0,0,0,'Jungle Edge 5',865,8,0,0,0,0,36,2),(727,0,0,0,'Jungle Edge 6',450,8,0,0,0,0,25,1),(728,0,0,0,'Jungle Edge 2',3170,8,0,0,0,0,128,3),(729,0,0,0,'Jungle Edge 3',865,8,0,0,0,0,36,2),(730,0,0,0,'Jungle Edge 1',2495,8,0,0,0,0,98,3),(731,0,0,0,'Haggler\'s Hangout 6',6450,8,0,0,0,0,208,4),(732,0,0,0,'Haggler\'s Hangout 5 (Shop)',1550,8,0,0,0,0,56,1),(733,0,0,0,'Haggler\'s Hangout 4a (Shop)',1850,8,0,0,0,0,56,1),(734,0,0,0,'Haggler\'s Hangout 4b (Shop)',1550,8,0,0,0,0,56,1),(735,0,0,0,'Haggler\'s Hangout 3',7550,8,0,0,0,0,256,4),(736,0,0,0,'Haggler\'s Hangout 2',1300,8,0,0,0,0,49,1),(737,0,0,0,'Haggler\'s Hangout 1',1400,8,0,0,0,0,49,2),(738,0,0,0,'River Homes 1',3485,8,0,0,0,0,128,3),(739,0,0,0,'River Homes 2a',1270,8,0,0,0,0,42,2),(740,0,0,0,'River Homes 2b',1595,8,0,0,0,0,56,3),(741,0,0,0,'River Homes 3',5055,8,0,0,0,0,176,7),(742,0,0,0,'The Treehouse',24120,8,0,0,0,0,897,23),(743,0,0,0,'Corner Shop (Shop)',2215,12,0,0,0,0,96,2),(744,0,0,0,'Tusk Flats 1',765,12,0,0,0,0,40,2),(745,0,0,0,'Tusk Flats 2',835,12,0,0,0,0,42,2),(746,0,0,0,'Tusk Flats 3',660,12,0,0,0,0,34,2),(747,0,0,0,'Tusk Flats 4',315,12,0,0,0,0,24,1),(748,0,0,0,'Tusk Flats 6',660,12,0,0,0,0,35,2),(749,0,0,0,'Tusk Flats 5',455,12,0,0,0,0,30,1),(750,0,0,0,'Shady Rocks 5',2890,12,0,0,0,0,110,2),(751,0,0,0,'Shady Rocks 4 (Shop)',2710,12,0,0,0,0,110,2),(752,0,0,0,'Shady Rocks 3',4115,12,0,0,0,0,154,3),(753,0,0,0,'Shady Rocks 2',2010,12,0,0,0,0,77,4),(754,0,0,0,'Shady Rocks 1',3630,12,0,0,0,0,132,4),(755,0,0,0,'Crystal Glance',19625,12,0,0,0,0,569,24),(756,0,0,0,'Arena Walk 3',3550,12,0,0,0,0,126,3),(757,0,0,0,'Arena Walk 2',1400,12,0,0,0,0,54,2),(758,0,0,0,'Arena Walk 1',3250,12,0,0,0,0,128,3),(759,0,0,0,'Bears Paw 2',2305,12,0,0,0,0,100,2),(760,0,0,0,'Bears Paw 1',1810,12,0,0,0,0,72,2),(761,0,0,0,'Spirit Homes 5',1450,12,0,0,0,0,56,2),(762,0,0,0,'Glacier Side 3',1950,12,0,0,0,0,75,2),(763,0,0,0,'Glacier Side 2',4750,12,0,0,0,0,154,3),(764,0,0,0,'Glacier Side 1',1600,12,0,0,0,0,65,2),(765,0,0,0,'Spirit Homes 1',1700,12,0,0,0,0,56,2),(766,0,0,0,'Spirit Homes 2',1900,12,0,0,0,0,72,2),(767,0,0,0,'Spirit Homes 3',4250,12,0,0,0,0,128,3),(768,0,0,0,'Spirit Homes 4',1100,12,0,0,0,0,49,1),(770,0,0,0,'Glacier Side 4',2050,12,0,0,0,0,75,1),(771,0,0,0,'Shelf Site',4800,12,0,0,0,0,160,3),(772,0,0,0,'Raven Corner 1',855,12,0,0,0,0,45,1),(773,0,0,0,'Raven Corner 2',1685,12,0,0,0,0,60,3),(774,0,0,0,'Raven Corner 3',855,12,0,0,0,0,45,1),(775,0,0,0,'Bears Paw 3',2090,12,0,0,0,0,82,3),(776,0,0,0,'Bears Paw 4',5205,12,0,0,0,0,189,4),(778,0,0,0,'Bears Paw 5',2045,12,0,0,0,0,81,3),(779,0,0,0,'Trout Plaza 5 (Shop)',3880,12,0,0,0,0,144,2),(780,0,0,0,'Pilchard Bin 1',685,12,0,0,0,0,30,2),(781,0,0,0,'Pilchard Bin 2',685,12,0,0,0,0,24,2),(782,0,0,0,'Pilchard Bin 3',585,12,0,0,0,0,24,1),(783,0,0,0,'Pilchard Bin 4',585,12,0,0,0,0,24,1),(784,0,0,0,'Pilchard Bin 5',685,12,0,0,0,0,24,2),(785,0,0,0,'Pilchard Bin 10',450,12,0,0,0,0,20,1),(786,0,0,0,'Pilchard Bin 9',450,12,0,0,0,0,20,1),(787,0,0,0,'Pilchard Bin 8',450,12,0,0,0,0,20,2),(789,0,0,0,'Pilchard Bin 7',450,12,0,0,0,0,20,1),(790,0,0,0,'Pilchard Bin 6',450,12,0,0,0,0,25,1),(791,0,0,0,'Trout Plaza 1',2395,12,0,0,0,0,112,2),(792,0,0,0,'Trout Plaza 2',1540,12,0,0,0,0,64,2),(793,0,0,0,'Trout Plaza 3',900,12,0,0,0,0,36,1),(794,0,0,0,'Trout Plaza 4',900,12,0,0,0,0,45,1),(795,0,0,0,'Skiffs End 1',1540,12,0,0,0,0,70,2),(796,0,0,0,'Skiffs End 2',910,12,0,0,0,0,42,2),(797,0,0,0,'Furrier Quarter 3',1010,12,0,0,0,0,54,2),(798,0,0,0,'Mammoth Belly',22810,12,0,0,0,0,634,30),(799,0,0,0,'Furrier Quarter 2',1045,12,0,0,0,0,56,2),(800,0,0,0,'Furrier Quarter 1',1635,12,0,0,0,0,84,3),(801,0,0,0,'Fimbul Shelf 3',1255,12,0,0,0,0,66,2),(802,0,0,0,'Fimbul Shelf 4',1045,12,0,0,0,0,56,2),(803,0,0,0,'Fimbul Shelf 2',1045,12,0,0,0,0,56,2),(804,0,0,0,'Fimbul Shelf 1',975,12,0,0,0,0,48,2),(805,0,0,0,'Frost Manor',26370,12,0,0,0,0,806,24),(831,0,0,0,'Marble Guildhall',16810,3,0,0,0,0,530,17),(832,0,0,0,'Iron Guildhall',15560,3,0,0,0,0,464,17),(833,0,0,0,'The Market 1 (Shop)',650,3,0,0,0,0,25,1),(834,0,0,0,'The Market 3 (Shop)',1450,3,0,0,0,0,40,1),(835,0,0,0,'The Market 2 (Shop)',1100,3,0,0,0,0,40,1),(836,0,0,0,'The Market 4 (Shop)',1800,3,0,0,0,0,48,1),(837,0,0,0,'Granite Guildhall',17845,3,0,0,0,0,530,17),(838,0,0,0,'Upper Barracks 1',210,3,0,0,0,0,14,1),(850,0,0,0,'Upper Barracks 13',580,3,0,0,0,0,24,2),(851,0,0,0,'Nobility Quarter 4',765,3,0,0,0,0,25,1),(852,0,0,0,'Nobility Quarter 5',765,3,0,0,0,0,25,1),(853,0,0,0,'Nobility Quarter 7',765,3,0,0,0,0,25,1),(854,0,0,0,'Nobility Quarter 6',765,3,0,0,0,0,26,1),(855,0,0,0,'Nobility Quarter 8',765,3,0,0,0,0,26,1),(856,0,0,0,'Nobility Quarter 9',765,3,0,0,0,0,26,1),(857,0,0,0,'Nobility Quarter 2',1865,3,0,0,0,0,50,3),(858,0,0,0,'Nobility Quarter 3',1865,3,0,0,0,0,50,3),(859,0,0,0,'Nobility Quarter 1',1865,3,0,0,0,0,50,3),(863,0,0,0,'The Farms 6, Fishing Hut',1255,3,0,0,0,0,32,2),(864,0,0,0,'The Farms 5',1530,3,0,0,0,0,36,2),(866,0,0,0,'The Farms 3',1530,3,0,0,0,0,36,2),(867,0,0,0,'The Farms 2',1530,3,0,0,0,0,36,2),(868,0,0,0,'The Farms 1',2510,3,0,0,0,0,60,3),(886,0,0,0,'Outlaw Castle',8000,3,0,0,0,0,307,9),(889,0,0,0,'Tunnel Gardens 3',2000,3,0,0,0,0,43,3),(890,0,0,0,'Tunnel Gardens 4',2000,3,0,0,0,0,42,3),(892,0,0,0,'Tunnel Gardens 5',1360,3,0,0,0,0,35,2),(893,0,0,0,'Tunnel Gardens 6',1360,3,0,0,0,0,38,2),(894,0,0,0,'Tunnel Gardens 8',1360,3,0,0,0,0,35,2),(895,0,0,0,'Tunnel Gardens 7',1360,3,0,0,0,0,35,2),(900,0,0,0,'Wolftower',21550,3,0,0,0,0,638,23),(901,0,0,0,'Paupers Palace, Flat 11',315,1,0,0,0,0,16,1),(905,0,0,0,'Botham I a',950,9,0,0,0,0,36,1),(906,0,0,0,'Esuph I',680,9,0,0,0,0,39,1),(907,0,0,0,'Esuph II b',1380,9,0,0,0,0,51,2),(1883,0,0,0,'Aureate Court 1',5240,13,0,0,0,0,276,3),(1884,0,0,0,'Aureate Court 2',4860,13,0,0,0,0,201,2),(1885,0,0,0,'Aureate Court 3',4300,13,0,0,0,0,228,2),(1886,0,0,0,'Aureate Court 4',3980,13,0,0,0,0,210,4),(1887,0,0,0,'Fortune Wing 1',10180,13,0,0,0,0,422,4),(1888,0,0,0,'Fortune Wing 2',5580,13,0,0,0,0,260,2),(1889,0,0,0,'Fortune Wing 3',5740,13,0,0,0,0,258,2),(1890,0,0,0,'Fortune Wing 4',5740,13,0,0,0,0,306,4),(1891,0,0,0,'Luminous Arc 1',6460,13,0,0,0,0,344,2),(1892,0,0,0,'Luminous Arc 2',6460,13,0,0,0,0,301,4),(1893,0,0,0,'Luminous Arc 3',5400,13,0,0,0,0,249,3),(1894,0,0,0,'Luminous Arc 4',8000,13,0,0,0,0,343,5),(1895,0,0,0,'Radiant Plaza 1',5620,13,0,0,0,0,276,4),(1896,0,0,0,'Radiant Plaza 2',3820,13,0,0,0,0,179,2),(1897,0,0,0,'Radiant Plaza 3',4900,13,0,0,0,0,257,2),(1898,0,0,0,'Radiant Plaza 4',7460,13,0,0,0,0,367,3),(1899,0,0,0,'Sun Palace',23120,13,0,0,0,0,976,27),(1900,0,0,0,'Halls of Serenity',23360,13,0,0,0,0,1093,33),(1901,0,0,0,'Cascade Towers',19500,13,0,0,0,0,811,33),(1902,0,0,0,'Sorcerer\'s Avenue 5',2695,2,0,0,0,0,96,1),(1903,0,0,0,'Sorcerer\'s Avenue 1a',1255,2,0,0,0,0,42,2),(1904,0,0,0,'Sorcerer\'s Avenue 1b',1035,2,0,0,0,0,36,2),(1905,0,0,0,'Sorcerer\'s Avenue 1c',1255,2,0,0,0,0,36,2),(1906,0,0,0,'Beach Home Apartments, Flat 06',1145,2,0,0,0,0,40,2),(1907,0,0,0,'Beach Home Apartments, Flat 01',715,2,0,0,0,0,30,1),(1908,0,0,0,'Beach Home Apartments, Flat 02',715,2,0,0,0,0,25,1),(1909,0,0,0,'Beach Home Apartments, Flat 03',715,2,0,0,0,0,30,1),(1910,0,0,0,'Beach Home Apartments, Flat 04',715,2,0,0,0,0,24,1),(1911,0,0,0,'Beach Home Apartments, Flat 05',715,2,0,0,0,0,24,1),(1912,0,0,0,'Beach Home Apartments, Flat 16',1145,2,0,0,0,0,40,2),(1913,0,0,0,'Beach Home Apartments, Flat 11',715,2,0,0,0,0,30,1),(1914,0,0,0,'Beach Home Apartments, Flat 12',880,2,0,0,0,0,30,1),(1915,0,0,0,'Beach Home Apartments, Flat 13',880,2,0,0,0,0,29,1),(1916,0,0,0,'Beach Home Apartments, Flat 14',385,2,0,0,0,0,15,1),(1917,0,0,0,'Beach Home Apartments, Flat 15',385,2,0,0,0,0,15,1),(1918,0,0,0,'Thais Clanhall',8420,2,0,0,0,0,370,10),(1919,0,0,0,'Harbour Street 4',935,2,0,0,0,0,30,1),(1920,0,0,0,'Thais Hostel',6980,2,0,0,0,0,171,24),(1921,0,0,0,'Lower Swamp Lane 1',4740,2,0,0,0,0,166,4),(1923,0,0,0,'Lower Swamp Lane 3',4740,2,0,0,0,0,161,4),(1924,0,0,0,'Sunset Homes, Flat 01',520,2,0,0,0,0,25,1),(1925,0,0,0,'Sunset Homes, Flat 02',520,2,0,0,0,0,30,1),(1926,0,0,0,'Sunset Homes, Flat 03',520,2,0,0,0,0,30,1),(1927,0,0,0,'Sunset Homes, Flat 14',520,2,0,0,0,0,30,1),(1929,0,0,0,'Sunset Homes, Flat 13',860,2,0,0,0,0,35,2),(1930,0,0,0,'Sunset Homes, Flat 12',520,2,0,0,0,0,25,1),(1932,0,0,0,'Sunset Homes, Flat 11',520,2,0,0,0,0,25,1),(1935,0,0,0,'Sunset Homes, Flat 24',520,2,0,0,0,0,30,1),(1936,0,0,0,'Sunset Homes, Flat 23',860,2,0,0,0,0,35,2),(1937,0,0,0,'Sunset Homes, Flat 22',520,2,0,0,0,0,25,1),(1938,0,0,0,'Sunset Homes, Flat 21',520,2,0,0,0,0,25,1),(1939,0,0,0,'Harbour Place 1 (Shop)',1100,2,0,0,0,0,37,1),(1940,0,0,0,'Harbour Place 2 (Shop)',1300,2,0,0,0,0,48,1),(1941,0,1527989802,0,'Warriors Guildhall',14725,2,0,0,0,0,522,11),(1942,0,0,0,'Farm Lane, 1st floor (Shop)',945,2,0,0,0,0,42,0),(1943,0,0,0,'Farm Lane, Basement (Shop)',945,2,0,0,0,0,36,0),(1944,0,0,0,'Main Street 9, 1st floor (Shop)',1440,2,0,0,0,0,47,0),(1945,0,0,0,'Main Street 9a, 2nd floor (Shop)',765,2,0,0,0,0,30,0),(1946,0,0,0,'Main Street 9b, 2nd floor (Shop)',1260,2,0,0,0,0,48,0),(1947,0,0,0,'Farm Lane, 2nd Floor (Shop)',945,2,0,0,0,0,42,0),(1948,0,0,0,'The City Wall 5a',585,2,0,0,0,0,24,1),(1949,0,0,0,'The City Wall 5c',585,2,0,0,0,0,24,1),(1950,0,0,0,'The City Wall 5e',585,2,0,0,0,0,30,1),(1951,0,0,0,'The City Wall 5b',585,2,0,0,0,0,24,1),(1952,0,0,0,'The City Wall 5d',585,2,0,0,0,0,24,1),(1953,0,0,0,'The City Wall 5f',585,2,0,0,0,0,30,1),(1954,0,0,0,'The City Wall 3a',1045,2,0,0,0,0,42,2),(1955,0,0,0,'The City Wall 3b',1045,2,0,0,0,0,35,2),(1956,0,0,0,'The City Wall 3c',1045,2,0,0,0,0,35,2),(1957,0,0,0,'The City Wall 3d',1045,2,0,0,0,0,41,2),(1958,0,0,0,'The City Wall 3e',1045,2,0,0,0,0,30,2),(1959,0,0,0,'The City Wall 3f',1045,2,0,0,0,0,31,2),(1960,0,0,0,'The City Wall 1a',1270,2,0,0,0,0,49,2),(1961,0,0,0,'Mill Avenue 3',1400,2,0,0,0,0,49,2),(1962,0,0,0,'The City Wall 1b',1270,2,0,0,0,0,49,2),(1963,0,0,0,'Mill Avenue 4',1400,2,0,0,0,0,49,2),(1964,0,0,0,'Mill Avenue 5',3250,2,0,0,0,0,128,4),(1965,0,0,0,'Mill Avenue 1 (Shop)',1300,2,0,0,0,0,54,1),(1966,0,0,0,'Mill Avenue 2 (Shop)',2350,2,0,0,0,0,80,2),(1967,0,0,0,'The City Wall 7c',865,2,0,0,0,0,36,2),(1968,0,0,0,'The City Wall 7a',585,2,0,0,0,0,30,1),(1969,0,0,0,'The City Wall 7e',865,2,0,0,0,0,36,2),(1970,0,0,0,'The City Wall 7g',585,2,0,0,0,0,30,1),(1971,0,0,0,'The City Wall 7d',865,2,0,0,0,0,36,2),(1972,0,0,0,'The City Wall 7b',585,2,0,0,0,0,30,1),(1973,0,0,0,'The City Wall 7f',865,2,0,0,0,0,35,2),(1974,0,0,0,'The City Wall 7h',585,2,0,0,0,0,30,1),(1975,0,0,0,'The City Wall 9',955,2,0,0,0,0,50,2),(1976,0,0,0,'Upper Swamp Lane 12',3800,2,0,0,0,0,116,3),(1977,0,0,0,'Upper Swamp Lane 10',2060,2,0,0,0,0,70,3),(1978,0,0,0,'Upper Swamp Lane 8',8120,2,0,0,0,0,216,3),(1979,0,0,0,'Southern Thais Guildhall',22440,2,0,0,0,0,596,16),(1980,0,0,0,'Alai Flats, Flat 04',765,2,0,0,0,0,30,1),(1981,0,0,0,'Alai Flats, Flat 05',1225,2,0,0,0,0,38,2),(1982,0,0,0,'Alai Flats, Flat 06',1225,2,0,0,0,0,48,2),(1983,0,0,0,'Alai Flats, Flat 07',765,2,0,0,0,0,30,1),(1984,0,0,0,'Alai Flats, Flat 08',765,2,0,0,0,0,30,1),(1985,0,0,0,'Alai Flats, Flat 03',765,2,0,0,0,0,36,1),(1986,0,0,0,'Alai Flats, Flat 01',765,2,0,0,0,0,26,1),(1987,0,0,0,'Alai Flats, Flat 02',765,2,0,0,0,0,34,1),(1988,0,0,0,'Alai Flats, Flat 14',900,2,0,0,0,0,33,1),(1989,0,0,0,'Alai Flats, Flat 15',1450,2,0,0,0,0,48,2),(1990,0,0,0,'Alai Flats, Flat 16',1450,2,0,0,0,0,54,2),(1991,0,0,0,'Alai Flats, Flat 17',900,2,0,0,0,0,38,1),(1992,0,0,0,'Alai Flats, Flat 18',900,2,0,0,0,0,38,1),(1993,0,0,0,'Alai Flats, Flat 13',765,2,0,0,0,0,36,1),(1994,0,0,0,'Alai Flats, Flat 12',765,2,0,0,0,0,25,1),(1995,0,0,0,'Alai Flats, Flat 11',765,2,0,0,0,0,35,1),(1996,0,0,0,'Alai Flats, Flat 24',900,2,0,0,0,0,36,1),(1997,0,0,0,'Alai Flats, Flat 25',1450,2,0,0,0,0,52,2),(1998,0,0,0,'Alai Flats, Flat 26',1450,2,0,0,0,0,60,2),(1999,0,0,0,'Alai Flats, Flat 27',900,2,0,0,0,0,38,1),(2000,0,0,0,'Alai Flats, Flat 28',900,2,0,0,0,0,38,1),(2001,0,0,0,'Alai Flats, Flat 23',765,2,0,0,0,0,35,1),(2002,0,0,0,'Alai Flats, Flat 22',765,2,0,0,0,0,25,1),(2003,0,0,0,'Alai Flats, Flat 21',765,2,0,0,0,0,36,1),(2004,0,0,0,'Upper Swamp Lane 4',4740,2,0,0,0,0,165,4),(2005,0,0,0,'Upper Swamp Lane 2',4740,2,0,0,0,0,159,4),(2006,0,0,0,'Sorcerer\'s Avenue Labs 2c',715,2,0,0,0,0,20,1),(2007,0,0,0,'Sorcerer\'s Avenue Labs 2d',715,2,0,0,0,0,20,1),(2008,0,0,0,'Sorcerer\'s Avenue Labs 2e',715,2,0,0,0,0,20,1),(2009,0,0,0,'Sorcerer\'s Avenue Labs 2f',715,2,0,0,0,0,20,1),(2010,0,0,0,'Sorcerer\'s Avenue Labs 2b',715,2,0,0,0,0,24,1),(2011,0,0,0,'Sorcerer\'s Avenue Labs 2a',715,2,0,0,0,0,24,1),(2012,0,0,0,'Ivory Circle 1',4280,7,0,0,0,0,160,2),(2013,0,0,0,'Admiral\'s Avenue 3',4115,7,0,0,0,0,142,2),(2014,0,0,0,'Admiral\'s Avenue 2',5470,7,0,0,0,0,176,4),(2015,0,0,0,'Admiral\'s Avenue 1',5105,7,0,0,0,0,168,2),(2016,0,0,0,'Sugar Street 5',1350,7,0,0,0,0,48,2),(2017,0,0,0,'Freedom Street 1',2450,7,0,0,0,0,84,2),(2018,0,0,0,'Freedom Street 2',6050,7,0,0,0,0,208,4),(2019,0,0,0,'Trader\'s Point 2 (Shop)',5350,7,0,0,0,0,198,2),(2020,0,0,0,'Trader\'s Point 3 (Shop)',5950,7,0,0,0,0,195,2),(2021,0,0,0,'Ivory Circle 2',7030,7,0,0,0,0,214,2),(2022,0,0,0,'The Tavern 1a',2750,7,0,0,0,0,72,4),(2023,0,0,0,'The Tavern 1b',1900,7,0,0,0,0,54,2),(2024,0,0,0,'The Tavern 1c',4150,7,0,0,0,0,132,3),(2025,0,0,0,'The Tavern 1d',1550,7,0,0,0,0,48,2),(2026,0,0,0,'The Tavern 2d',1350,7,0,0,0,0,40,2),(2027,0,0,0,'The Tavern 2c',950,7,0,0,0,0,32,1),(2028,0,0,0,'The Tavern 2b',1700,7,0,0,0,0,62,2),(2029,0,0,0,'The Tavern 2a',5550,7,0,0,0,0,163,5),(2030,0,0,0,'Straycat\'s Corner 4',210,7,0,0,0,0,20,1),(2031,0,0,0,'Straycat\'s Corner 3',210,7,0,0,0,0,20,1),(2032,0,0,0,'Straycat\'s Corner 2',660,7,0,0,0,0,49,1),(2033,0,0,0,'Litter Promenade 5',580,7,0,0,0,0,35,2),(2034,0,0,0,'Litter Promenade 4',390,7,0,0,0,0,30,1),(2035,0,0,0,'Litter Promenade 3',450,7,0,0,0,0,36,1),(2036,0,0,0,'Litter Promenade 2',300,7,0,0,0,0,25,1),(2037,0,0,0,'Litter Promenade 1',400,7,0,0,0,0,25,2),(2038,0,0,0,'The Shelter',13590,7,0,0,0,0,560,31),(2039,0,0,0,'Straycat\'s Corner 6',300,7,0,0,0,0,25,1),(2040,0,0,0,'Straycat\'s Corner 5',760,7,0,0,0,0,48,2),(2042,0,0,0,'Rum Alley 3',330,7,0,0,0,0,28,1),(2043,0,0,0,'Straycat\'s Corner 1',300,7,0,0,0,0,25,1),(2044,0,0,0,'Rum Alley 2',300,7,0,0,0,0,25,1),(2045,0,0,0,'Rum Alley 1',510,7,0,0,0,0,36,1),(2046,0,0,0,'Smuggler Backyard 3',700,7,0,0,0,0,40,2),(2048,0,0,0,'Shady Trail 3',300,7,0,0,0,0,25,1),(2049,0,0,0,'Shady Trail 1',1150,7,0,0,0,0,48,5),(2050,0,0,0,'Shady Trail 2',490,7,0,0,0,0,30,2),(2051,0,0,0,'Smuggler Backyard 5',610,7,0,0,0,0,35,2),(2052,0,0,0,'Smuggler Backyard 4',390,7,0,0,0,0,30,1),(2053,0,0,0,'Smuggler Backyard 2',670,7,0,0,0,0,40,2),(2054,0,0,0,'Smuggler Backyard 1',670,7,0,0,0,0,40,2),(2055,0,0,0,'Sugar Street 2',2550,7,0,0,0,0,84,3),(2056,0,0,0,'Sugar Street 1',3000,7,0,0,0,0,84,3),(2057,0,0,0,'Sugar Street 3a',1650,7,0,0,0,0,54,3),(2058,0,0,0,'Sugar Street 3b',2050,7,0,0,0,0,60,3),(2059,0,0,0,'Harvester\'s Haven, Flat 01',950,7,0,0,0,0,36,2),(2060,0,0,0,'Harvester\'s Haven, Flat 03',950,7,0,0,0,0,30,2),(2061,0,0,0,'Harvester\'s Haven, Flat 05',950,7,0,0,0,0,30,2),(2062,0,0,0,'Harvester\'s Haven, Flat 02',950,7,0,0,0,0,36,2),(2063,0,0,0,'Harvester\'s Haven, Flat 04',950,7,0,0,0,0,30,2),(2064,0,0,0,'Harvester\'s Haven, Flat 06',950,7,0,0,0,0,30,2),(2065,0,0,0,'Harvester\'s Haven, Flat 07',950,7,0,0,0,0,30,2),(2066,0,0,0,'Harvester\'s Haven, Flat 09',950,7,0,0,0,0,30,2),(2067,0,0,0,'Harvester\'s Haven, Flat 11',950,7,0,0,0,0,36,2),(2068,0,0,0,'Harvester\'s Haven, Flat 12',950,7,0,0,0,0,36,2),(2069,0,0,0,'Harvester\'s Haven, Flat 10',950,7,0,0,0,0,30,2),(2070,0,0,0,'Harvester\'s Haven, Flat 08',950,7,0,0,0,0,30,2),(2071,0,0,0,'Marble Lane 4',6350,7,0,0,0,0,192,4),(2072,0,0,0,'Marble Lane 2',6415,7,0,0,0,0,200,3),(2073,0,0,0,'Marble Lane 3',8055,7,0,0,0,0,240,4),(2074,0,0,0,'Marble Lane 1',11060,7,0,0,0,0,320,6),(2075,0,0,0,'Ivy Cottage',30650,7,0,0,0,0,858,26),(2076,0,0,0,'Sugar Street 4d',750,7,0,0,0,0,24,2),(2077,0,0,0,'Sugar Street 4c',650,7,0,0,0,0,24,1),(2078,0,0,0,'Sugar Street 4b',950,7,0,0,0,0,36,2),(2079,0,0,0,'Sugar Street 4a',950,7,0,0,0,0,30,2),(2080,0,0,0,'Trader\'s Point 1',2200,7,0,0,0,0,77,2),(2081,0,0,0,'Mountain Hideout',15550,7,0,0,0,0,486,17),(2082,0,0,0,'Dark Mansion',17845,2,0,0,0,0,573,17),(2083,0,0,0,'Halls of the Adventurers',15380,2,0,0,0,0,518,18),(2084,0,0,0,'Castle of Greenshore',18860,2,0,0,0,0,600,12),(2085,0,0,0,'Greenshore Clanhall',10800,2,0,0,0,0,312,10),(2086,0,0,0,'Greenshore Village 1',2420,2,0,0,0,0,64,3),(2087,0,0,0,'Greenshore Village, Shop',1800,2,0,0,0,0,56,1),(2088,0,0,0,'Greenshore Village, Villa',8700,2,0,0,0,0,263,4),(2089,0,0,0,'Greenshore Village 2',780,2,0,0,0,0,30,1),(2090,0,0,0,'Greenshore Village 3',780,2,0,0,0,0,25,1),(2091,0,0,0,'Greenshore Village 5',780,2,0,0,0,0,30,1),(2092,0,0,0,'Greenshore Village 4',780,2,0,0,0,0,25,1),(2093,0,0,0,'Greenshore Village 6',4360,2,0,0,0,0,118,2),(2094,0,0,0,'Greenshore Village 7',1260,2,0,0,0,0,42,1),(2095,0,0,0,'The Tibianic',34500,2,0,0,0,0,862,22),(2097,0,0,0,'Fibula Village 5',1790,2,0,0,0,0,42,2),(2098,0,0,0,'Fibula Village 4',1790,2,0,0,0,0,42,2),(2099,0,0,0,'Fibula Village, Tower Flat',5105,2,0,0,0,0,161,2),(2100,0,0,0,'Fibula Village 1',845,2,0,0,0,0,30,1),(2101,0,0,0,'Fibula Village 2',845,2,0,0,0,0,30,1),(2102,0,0,0,'Fibula Village 3',3810,2,0,0,0,0,110,4),(2103,0,0,0,'Mercenary Tower',41955,2,0,0,0,0,996,26),(2104,0,0,0,'Guildhall of the Red Rose',27725,2,0,0,0,0,571,15),(2105,0,0,0,'Fibula Village, Bar',5235,2,0,0,0,0,122,2),(2106,0,0,0,'Fibula Village, Villa',11490,2,0,0,0,0,402,5),(2107,0,0,0,'Fibula Clanhall',11430,2,0,0,0,0,290,10),(2108,0,0,0,'Spiritkeep',19210,2,0,0,0,0,783,23),(2109,0,0,0,'Snake Tower',29720,2,0,0,0,0,1064,21),(2110,0,0,0,'Bloodhall',15270,2,0,0,0,0,569,15),(2111,0,0,0,'Senja Clanhall',10575,4,0,0,0,0,396,9),(2112,0,0,0,'Senja Village 2',765,4,0,0,0,0,36,1),(2113,0,0,0,'Senja Village 1a',765,4,0,0,0,0,36,1),(2114,0,0,0,'Senja Village 1b',1630,4,0,0,0,0,66,2),(2115,0,0,0,'Senja Village 4',765,4,0,0,0,0,30,1),(2116,0,0,0,'Senja Village 3',1765,4,0,0,0,0,72,2),(2117,0,0,0,'Senja Village 6b',765,4,0,0,0,0,30,1),(2118,0,0,0,'Senja Village 6a',765,4,0,0,0,0,30,1),(2119,0,0,0,'Senja Village 5',1225,4,0,0,0,0,48,2),(2120,0,0,0,'Senja Village 10',1485,4,0,0,0,0,72,1),(2121,0,0,0,'Senja Village 11',2620,4,0,0,0,0,96,2),(2122,0,0,0,'Senja Village 9',2575,4,0,0,0,0,103,2),(2123,0,0,0,'Senja Village 8',1675,4,0,0,0,0,57,2),(2124,0,0,0,'Senja Village 7',865,4,0,0,0,0,37,2),(2125,0,0,0,'Rosebud C',1340,4,0,0,0,0,70,0),(2127,0,0,0,'Rosebud A',1000,4,0,0,0,0,60,1),(2128,0,0,0,'Rosebud B',1000,4,0,0,0,0,60,1),(2129,0,0,0,'Nordic Stronghold',18400,4,0,0,0,0,718,21),(2130,0,0,0,'Northport Village 2',1475,4,0,0,0,0,40,2),(2131,0,0,0,'Northport Village 1',1475,4,0,0,0,0,48,2),(2132,0,0,0,'Northport Village 3',5435,4,0,0,0,0,178,2),(2133,0,0,0,'Northport Village 4',2630,4,0,0,0,0,81,2),(2134,0,0,0,'Northport Village 5',1805,4,0,0,0,0,56,2),(2135,0,0,0,'Northport Village 6',2135,4,0,0,0,0,64,2),(2136,0,0,0,'Seawatch',25010,4,0,0,0,0,749,19),(2137,0,0,0,'Northport Clanhall',9810,4,0,0,0,0,292,10),(2138,0,0,0,'Druids Retreat D',1180,4,0,0,0,0,54,2),(2139,0,0,0,'Druids Retreat A',1340,4,0,0,0,0,60,2),(2140,0,0,0,'Druids Retreat C',980,4,0,0,0,0,45,2),(2141,0,0,0,'Druids Retreat B',980,4,0,0,0,0,55,2),(2142,0,0,0,'Theater Avenue 14 (Shop)',2115,4,0,0,0,0,83,1),(2143,0,0,0,'Theater Avenue 12',955,4,0,0,0,0,28,2),(2144,0,0,0,'Theater Avenue 10',1090,4,0,0,0,0,45,2),(2145,0,0,0,'Theater Avenue 11c',585,4,0,0,0,0,24,1),(2146,0,0,0,'Theater Avenue 11b',585,4,0,0,0,0,24,1),(2147,0,0,0,'Theater Avenue 11a',1405,4,0,0,0,0,54,2),(2148,0,0,0,'Magician\'s Alley 1',1050,4,0,0,0,0,35,2),(2149,0,0,0,'Magician\'s Alley 1a',700,4,0,0,0,0,29,2),(2150,0,0,0,'Magician\'s Alley 1d',450,4,0,0,0,0,24,1),(2151,0,0,0,'Magician\'s Alley 1b',750,4,0,0,0,0,24,2),(2152,0,0,0,'Magician\'s Alley 1c',500,4,0,0,0,0,20,1),(2153,0,0,0,'Magician\'s Alley 5a',350,4,0,0,0,0,14,1),(2154,0,0,0,'Magician\'s Alley 5b',500,4,0,0,0,0,25,1),(2155,0,0,0,'Magician\'s Alley 5d',500,4,0,0,0,0,20,1),(2156,0,0,0,'Magician\'s Alley 5e',500,4,0,0,0,0,25,1),(2157,0,0,0,'Magician\'s Alley 5c',1150,4,0,0,0,0,35,2),(2158,0,0,0,'Magician\'s Alley 5f',1150,4,0,0,0,0,42,2),(2159,0,0,0,'Carlin Clanhall',10750,4,0,0,0,0,364,10),(2160,0,0,0,'Magician\'s Alley 4',2750,4,0,0,0,0,96,4),(2161,0,0,0,'Lonely Sea Side Hostel',10540,4,0,0,0,0,454,8),(2162,0,0,0,'Suntower',10080,4,0,0,0,0,450,7),(2163,0,0,0,'Harbour Lane 3',3560,4,0,0,0,0,145,3),(2164,0,0,0,'Harbour Flats, Flat 11',520,4,0,0,0,0,24,1),(2165,0,0,0,'Harbour Flats, Flat 13',520,4,0,0,0,0,24,1),(2166,0,0,0,'Harbour Flats, Flat 15',360,4,0,0,0,0,18,1),(2167,0,0,0,'Harbour Flats, Flat 17',360,4,0,0,0,0,24,1),(2168,0,0,0,'Harbour Flats, Flat 12',400,4,0,0,0,0,20,1),(2169,0,0,0,'Harbour Flats, Flat 14',400,4,0,0,0,0,20,1),(2170,0,0,0,'Harbour Flats, Flat 16',400,4,0,0,0,0,20,1),(2171,0,0,0,'Harbour Flats, Flat 18',400,4,0,0,0,0,25,1),(2172,0,0,0,'Harbour Flats, Flat 21',860,4,0,0,0,0,35,2),(2173,0,0,0,'Harbour Flats, Flat 22',980,4,0,0,0,0,45,2),(2174,0,0,0,'Harbour Flats, Flat 23',400,4,0,0,0,0,25,1),(2175,0,0,0,'Harbour Lane 2a (Shop)',680,4,0,0,0,0,32,0),(2176,0,0,0,'Harbour Lane 2b (Shop)',680,4,0,0,0,0,40,0),(2177,0,0,0,'Harbour Lane 1 (Shop)',1040,4,0,0,0,0,54,0),(2178,0,0,0,'Theater Avenue 6e',820,4,0,0,0,0,31,2),(2179,0,0,0,'Theater Avenue 6c',225,4,0,0,0,0,12,1),(2180,0,0,0,'Theater Avenue 6a',820,4,0,0,0,0,35,2),(2181,0,0,0,'Theater Avenue 6f',820,4,0,0,0,0,31,2),(2182,0,0,0,'Theater Avenue 6d',225,4,0,0,0,0,12,1),(2183,0,0,0,'Theater Avenue 6b',820,4,0,0,0,0,35,2),(2184,0,0,0,'East Lane 1a',2260,4,0,0,0,0,95,2),(2185,0,0,0,'East Lane 1b',1700,4,0,0,0,0,83,2),(2186,0,0,0,'East Lane 2',3900,4,0,0,0,0,172,2),(2191,0,0,0,'Northern Street 5',1980,4,0,0,0,0,94,2),(2192,0,0,0,'Northern Street 7',1700,4,0,0,0,0,83,2),(2193,0,0,0,'Northern Street 3a',740,4,0,0,0,0,31,2),(2194,0,0,0,'Northern Street 3b',780,4,0,0,0,0,36,2),(2195,0,0,0,'Northern Street 1c',740,4,0,0,0,0,31,2),(2196,0,0,0,'Northern Street 1b',740,4,0,0,0,0,37,2),(2197,0,0,0,'Northern Street 1a',940,4,0,0,0,0,41,2),(2198,0,0,0,'Theater Avenue 7, Flat 06',315,4,0,0,0,0,20,1),(2199,0,0,0,'Theater Avenue 7, Flat 01',315,4,0,0,0,0,15,1),(2200,0,0,0,'Theater Avenue 7, Flat 05',405,4,0,0,0,0,20,1),(2201,0,0,0,'Theater Avenue 7, Flat 02',405,4,0,0,0,0,20,1),(2202,0,0,0,'Theater Avenue 7, Flat 04',495,4,0,0,0,0,20,1),(2203,0,0,0,'Theater Avenue 7, Flat 03',405,4,0,0,0,0,19,1),(2204,0,0,0,'Theater Avenue 7, Flat 14',495,4,0,0,0,0,20,1),(2205,0,0,0,'Theater Avenue 7, Flat 13',405,4,0,0,0,0,17,1),(2206,0,0,0,'Theater Avenue 7, Flat 15',405,4,0,0,0,0,19,1),(2207,0,0,0,'Theater Avenue 7, Flat 16',405,4,0,0,0,0,20,1),(2208,0,0,0,'Theater Avenue 7, Flat 11',495,4,0,0,0,0,23,1),(2209,0,0,0,'Theater Avenue 7, Flat 12',405,4,0,0,0,0,15,1),(2210,0,0,0,'Theater Avenue 8a',1270,4,0,0,0,0,50,2),(2211,0,0,0,'Theater Avenue 8b',1370,4,0,0,0,0,49,3),(2212,0,0,0,'Central Plaza 3',600,4,0,0,0,0,20,0),(2213,0,0,0,'Central Plaza 2',600,4,0,0,0,0,20,0),(2214,0,0,0,'Central Plaza 1',600,4,0,0,0,0,20,0),(2215,0,0,0,'Park Lane 1a',1220,4,0,0,0,0,53,2),(2216,0,0,0,'Park Lane 3a',1220,4,0,0,0,0,48,2),(2217,0,0,0,'Park Lane 1b',1380,4,0,0,0,0,64,2),(2218,0,0,0,'Park Lane 3b',1100,4,0,0,0,0,48,2),(2219,0,0,0,'Park Lane 4',980,4,0,0,0,0,42,2),(2220,0,0,0,'Park Lane 2',980,4,0,0,0,0,42,2),(2221,0,0,0,'Magician\'s Alley 8',1400,4,0,0,0,0,42,2),(2222,0,0,0,'Moonkeep',13020,4,0,0,0,0,522,16),(2225,0,0,0,'Castle, Basement, Flat 01',585,11,0,0,0,0,30,1),(2226,0,0,0,'Castle, Basement, Flat 02',585,11,0,0,0,0,20,1),(2227,0,0,0,'Castle, Basement, Flat 03',585,11,0,0,0,0,20,1),(2228,0,0,0,'Castle, Basement, Flat 04',585,11,0,0,0,0,20,1),(2229,0,0,0,'Castle, Basement, Flat 07',585,11,0,0,0,0,20,1),(2230,0,0,0,'Castle, Basement, Flat 08',585,11,0,0,0,0,20,1),(2231,0,0,0,'Castle, Basement, Flat 09',585,11,0,0,0,0,24,1),(2232,0,0,0,'Castle, Basement, Flat 06',585,11,0,0,0,0,24,1),(2233,0,0,0,'Castle, Basement, Flat 05',585,11,0,0,0,0,24,1),(2234,0,0,0,'Castle Shop 1',1890,11,0,0,0,0,67,1),(2235,0,0,0,'Castle Shop 2',1890,11,0,0,0,0,70,1),(2236,0,0,0,'Castle Shop 3',1890,11,0,0,0,0,67,1),(2237,0,0,0,'Castle, 4th Floor, Flat 09',720,11,0,0,0,0,28,1),(2238,0,0,0,'Castle, 4th Floor, Flat 08',945,11,0,0,0,0,42,1),(2239,0,0,0,'Castle, 4th Floor, Flat 06',945,11,0,0,0,0,36,1),(2240,0,0,0,'Castle, 4th Floor, Flat 07',720,11,0,0,0,0,30,1),(2241,0,0,0,'Castle, 4th Floor, Flat 05',765,11,0,0,0,0,30,1),(2242,0,0,0,'Castle, 4th Floor, Flat 04',585,11,0,0,0,0,25,1),(2243,0,0,0,'Castle, 4th Floor, Flat 03',585,11,0,0,0,0,30,1),(2244,0,0,0,'Castle, 4th Floor, Flat 02',765,11,0,0,0,0,30,1),(2245,0,0,0,'Castle, 4th Floor, Flat 01',585,11,0,0,0,0,30,1),(2246,0,0,0,'Castle, 3rd Floor, Flat 01',585,11,0,0,0,0,30,1),(2247,0,0,0,'Castle, 3rd Floor, Flat 02',765,11,0,0,0,0,30,1),(2248,0,0,0,'Castle, 3rd Floor, Flat 03',585,11,0,0,0,0,25,1),(2249,0,0,0,'Castle, 3rd Floor, Flat 05',765,11,0,0,0,0,30,1),(2250,0,0,0,'Castle, 3rd Floor, Flat 04',585,11,0,0,0,0,25,1),(2251,0,0,0,'Castle, 3rd Floor, Flat 06',1045,11,0,0,0,0,36,2),(2252,0,0,0,'Castle, 3rd Floor, Flat 07',720,11,0,0,0,0,30,1),(2253,0,0,0,'Castle Street 1',2900,11,0,0,0,0,112,3),(2254,0,0,0,'Castle Street 2',1495,11,0,0,0,0,56,2),(2255,0,0,0,'Castle Street 3',1765,11,0,0,0,0,56,2),(2256,0,0,0,'Castle Street 4',1765,11,0,0,0,0,64,2),(2257,0,0,0,'Castle Street 5',1765,11,0,0,0,0,61,2),(2258,0,0,0,'Edron Flats, Basement Flat 2',1540,11,0,0,0,0,48,2),(2259,0,0,0,'Edron Flats, Basement Flat 1',1540,11,0,0,0,0,48,2),(2260,0,0,0,'Edron Flats, Flat 01',400,11,0,0,0,0,20,1),(2261,0,0,0,'Edron Flats, Flat 02',860,11,0,0,0,0,28,2),(2262,0,0,0,'Edron Flats, Flat 03',400,11,0,0,0,0,20,1),(2263,0,0,0,'Edron Flats, Flat 04',400,11,0,0,0,0,20,1),(2264,0,0,0,'Edron Flats, Flat 06',400,11,0,0,0,0,20,1),(2265,0,0,0,'Edron Flats, Flat 05',400,11,0,0,0,0,20,1),(2266,0,0,0,'Edron Flats, Flat 07',400,11,0,0,0,0,20,1),(2267,0,0,0,'Edron Flats, Flat 08',400,11,0,0,0,0,20,1),(2268,0,0,0,'Edron Flats, Flat 11',400,11,0,0,0,0,25,1),(2269,0,0,0,'Edron Flats, Flat 12',400,11,0,0,0,0,25,1),(2270,0,0,0,'Edron Flats, Flat 14',400,11,0,0,0,0,25,1),(2271,0,0,0,'Edron Flats, Flat 13',400,11,0,0,0,0,25,1),(2272,0,0,0,'Edron Flats, Flat 16',400,11,0,0,0,0,20,1),(2273,0,0,0,'Edron Flats, Flat 15',400,11,0,0,0,0,20,1),(2274,0,0,0,'Edron Flats, Flat 18',400,11,0,0,0,0,20,1),(2275,0,0,0,'Edron Flats, Flat 17',400,11,0,0,0,0,20,1),(2276,0,0,0,'Edron Flats, Flat 22',400,11,0,0,0,0,25,1),(2277,0,0,0,'Edron Flats, Flat 21',860,11,0,0,0,0,40,2),(2278,0,0,0,'Edron Flats, Flat 24',400,11,0,0,0,0,20,1),(2279,0,0,0,'Edron Flats, Flat 23',400,11,0,0,0,0,25,1),(2280,0,0,0,'Edron Flats, Flat 26',400,11,0,0,0,0,20,1),(2281,0,0,0,'Edron Flats, Flat 27',400,11,0,0,0,0,20,1),(2282,0,0,0,'Edron Flats, Flat 28',400,11,0,0,0,0,20,1),(2283,0,0,0,'Edron Flats, Flat 25',400,11,0,0,0,0,20,1),(2284,0,0,0,'Central Circle 1',3020,11,0,0,0,0,119,2),(2285,0,0,0,'Central Circle 2',3300,11,0,0,0,0,109,2),(2286,0,0,0,'Central Circle 3',4160,11,0,0,0,0,147,5),(2287,0,0,0,'Central Circle 4',4160,11,0,0,0,0,147,5),(2288,0,0,0,'Central Circle 5',4160,11,0,0,0,0,161,5),(2289,0,0,0,'Central Circle 6 (Shop)',3980,11,0,0,0,0,182,2),(2290,0,0,0,'Central Circle 7 (Shop)',3980,11,0,0,0,0,161,2),(2291,0,0,0,'Central Circle 8 (Shop)',3980,11,0,0,0,0,166,2),(2292,0,0,0,'Central Circle 9a',940,11,0,0,0,0,42,2),(2293,0,0,0,'Central Circle 9b',940,11,0,0,0,0,44,2),(2294,0,0,0,'Sky Lane, Guild 1',21145,11,0,0,0,0,666,23),(2295,0,0,0,'Sky Lane, Guild 2',19300,11,0,0,0,0,672,14),(2296,0,0,0,'Sky Lane, Guild 3',17315,11,0,0,0,0,564,18),(2297,0,0,0,'Sky Lane, Sea Tower',4775,11,0,0,0,0,196,6),(2298,0,0,0,'Wood Avenue 6a',1450,11,0,0,0,0,56,2),(2299,0,0,0,'Wood Avenue 9a',1540,11,0,0,0,0,56,2),(2300,0,0,0,'Wood Avenue 10a',1540,11,0,0,0,0,64,2),(2301,0,0,0,'Wood Avenue 11',7205,11,0,0,0,0,253,6),(2302,0,0,0,'Wood Avenue 8',5960,11,0,0,0,0,198,3),(2303,0,0,0,'Wood Avenue 7',5960,11,0,0,0,0,191,3),(2304,0,0,0,'Wood Avenue 6b',1450,11,0,0,0,0,56,2),(2305,0,0,0,'Wood Avenue 9b',1495,11,0,0,0,0,56,2),(2306,0,0,0,'Wood Avenue 10b',1595,11,0,0,0,0,64,3),(2307,0,0,0,'Wood Avenue 5',1765,11,0,0,0,0,64,2),(2308,0,0,0,'Wood Avenue 4a',1495,11,0,0,0,0,56,2),(2309,0,0,0,'Wood Avenue 4b',1495,11,0,0,0,0,56,2),(2310,0,0,0,'Wood Avenue 4c',1765,11,0,0,0,0,56,2),(2311,0,0,0,'Wood Avenue 4',1765,11,0,0,0,0,64,2),(2312,0,0,0,'Wood Avenue 3',1765,11,0,0,0,0,56,2),(2313,0,0,0,'Wood Avenue 2',1765,11,0,0,0,0,49,2),(2314,0,0,0,'Wood Avenue 1',1765,11,0,0,0,0,64,2),(2315,0,0,0,'Magic Academy, Guild',12025,11,0,0,0,0,414,14),(2316,0,0,0,'Magic Academy, Flat 1',1465,11,0,0,0,0,57,3),(2317,0,0,0,'Magic Academy, Flat 2',1530,11,0,0,0,0,55,2),(2318,0,0,0,'Magic Academy, Flat 3',1430,11,0,0,0,0,55,1),(2319,0,0,0,'Magic Academy, Flat 4',1530,11,0,0,0,0,55,2),(2320,0,0,0,'Magic Academy, Flat 5',1430,11,0,0,0,0,55,1),(2321,0,0,0,'Magic Academy, Shop',1595,11,0,0,0,0,48,1),(2322,0,0,0,'Stonehome Village 1',1780,11,0,0,0,0,74,2),(2323,0,0,0,'Stonehome Flats, Flat 05',400,11,0,0,0,0,20,1),(2324,0,0,0,'Stonehome Flats, Flat 04',400,11,0,0,0,0,25,1),(2325,0,0,0,'Stonehome Flats, Flat 06',400,11,0,0,0,0,20,1),(2326,0,0,0,'Stonehome Flats, Flat 03',400,11,0,0,0,0,20,1),(2327,0,0,0,'Stonehome Flats, Flat 01',400,11,0,0,0,0,20,1),(2328,0,0,0,'Stonehome Flats, Flat 02',740,11,0,0,0,0,30,2),(2329,0,0,0,'Stonehome Flats, Flat 11',740,11,0,0,0,0,35,2),(2330,0,0,0,'Stonehome Flats, Flat 12',740,11,0,0,0,0,35,2),(2331,0,0,0,'Stonehome Flats, Flat 13',400,11,0,0,0,0,20,1),(2332,0,0,0,'Stonehome Flats, Flat 14',400,11,0,0,0,0,20,1),(2333,0,0,0,'Stonehome Flats, Flat 16',400,11,0,0,0,0,20,1),(2334,0,0,0,'Stonehome Flats, Flat 15',400,11,0,0,0,0,20,1),(2335,0,0,0,'Stonehome Village 2',640,11,0,0,0,0,35,1),(2336,0,0,0,'Stonehome Village 3',680,11,0,0,0,0,36,1),(2337,0,0,0,'Stonehome Village 4',940,11,0,0,0,0,42,2),(2338,0,0,0,'Stonehome Village 6',1300,11,0,0,0,0,55,2),(2339,0,0,0,'Stonehome Village 5',1140,11,0,0,0,0,56,2),(2340,0,0,0,'Stonehome Village 7',1140,11,0,0,0,0,49,2),(2341,0,0,0,'Stonehome Village 8',680,11,0,0,0,0,36,1),(2342,0,0,0,'Stonehome Village 9',680,11,0,0,0,0,36,1),(2343,0,0,0,'Stonehome Clanhall',8580,11,0,0,0,0,345,9),(2344,0,0,0,'Cormaya 1',1270,11,0,0,0,0,49,2),(2345,0,0,0,'Cormaya 2',3710,11,0,0,0,0,145,3),(2346,0,0,0,'Cormaya Flats, Flat 01',450,11,0,0,0,0,20,1),(2347,0,0,0,'Cormaya Flats, Flat 02',450,11,0,0,0,0,20,1),(2348,0,0,0,'Cormaya Flats, Flat 03',820,11,0,0,0,0,30,2),(2349,0,0,0,'Cormaya Flats, Flat 06',450,11,0,0,0,0,20,1),(2350,0,0,0,'Cormaya Flats, Flat 05',450,11,0,0,0,0,20,1),(2351,0,0,0,'Cormaya Flats, Flat 04',820,11,0,0,0,0,30,2),(2352,0,0,0,'Cormaya Flats, Flat 13',820,11,0,0,0,0,30,2),(2353,0,0,0,'Cormaya Flats, Flat 14',820,11,0,0,0,0,35,2),(2354,0,0,0,'Cormaya Flats, Flat 15',450,11,0,0,0,0,20,1),(2355,0,0,0,'Cormaya Flats, Flat 16',450,11,0,0,0,0,20,1),(2356,0,0,0,'Cormaya Flats, Flat 11',450,11,0,0,0,0,20,1),(2357,0,0,0,'Cormaya Flats, Flat 12',450,11,0,0,0,0,20,1),(2358,0,0,0,'Cormaya 3',2035,11,0,0,0,0,72,2),(2359,0,0,0,'Castle of the White Dragon',25110,11,0,0,0,0,761,19),(2360,0,0,0,'Cormaya 4',1720,11,0,0,0,0,63,2),(2361,0,0,0,'Cormaya 5',4250,11,0,0,0,0,167,3),(2362,0,0,0,'Cormaya 6',2395,11,0,0,0,0,84,2),(2363,0,0,0,'Cormaya 7',2395,11,0,0,0,0,84,2),(2364,0,0,0,'Cormaya 8',2710,11,0,0,0,0,113,2),(2365,0,0,0,'Cormaya 9b',2620,11,0,0,0,0,88,2),(2366,0,0,0,'Cormaya 9a',1225,11,0,0,0,0,48,2),(2367,0,0,0,'Cormaya 9c',1225,11,0,0,0,0,48,2),(2368,0,0,0,'Cormaya 9d',2620,11,0,0,0,0,88,2),(2369,0,0,0,'Cormaya 10',3800,11,0,0,0,0,140,3),(2370,0,0,0,'Cormaya 11',2035,11,0,0,0,0,72,2),(2371,0,0,0,'Demon Tower',3340,2,0,0,0,0,127,2),(2372,0,0,0,'Nautic Observer',6540,4,0,0,0,0,300,4),(2373,0,0,0,'Riverspring',19450,3,0,0,0,0,565,18),(2374,0,0,0,'House of Recreation',22540,4,0,0,0,0,702,16),(2375,0,0,0,'Valorous Venore',14435,1,0,0,0,0,508,9),(2376,0,0,0,'Ab\'Dendriel Clanhall',14850,5,0,0,0,0,405,10),(2377,0,0,0,'Castle of the Winds',23885,5,0,0,0,0,842,18),(2378,0,0,0,'The Hideout',20800,5,0,0,0,0,597,20),(2379,0,0,0,'Shadow Towers',21800,5,0,0,0,0,750,18),(2380,0,0,0,'Hill Hideout',13950,3,0,0,0,0,346,15),(2381,0,0,0,'Meriana Beach',8230,7,0,0,0,0,184,3),(2382,0,0,0,'Darashia 8, Flat 01',2485,10,0,0,0,0,80,2),(2383,0,0,0,'Darashia 8, Flat 02',3385,10,0,0,0,0,114,2),(2384,0,0,0,'Darashia 8, Flat 03',4700,10,0,0,0,0,171,3),(2385,0,0,0,'Darashia 8, Flat 04',2845,10,0,0,0,0,90,2),(2386,0,0,0,'Darashia 8, Flat 05',2665,10,0,0,0,0,85,2),(2387,0,0,0,'Darashia, Eastern Guildhall',12660,10,0,0,0,0,444,16),(2388,0,0,0,'Theater Avenue 5a',450,4,0,0,0,0,20,1),(2389,0,0,0,'Theater Avenue 5b',450,4,0,0,0,0,19,1),(2390,0,0,0,'Theater Avenue 5c',450,4,0,0,0,0,16,1),(2391,0,0,0,'Theater Avenue 5d',450,4,0,0,0,0,16,1),(2392,0,0,0,'Outlaw Camp 1',1660,3,0,0,0,0,52,2),(2393,0,0,0,'Outlaw Camp 2',280,3,0,0,0,0,12,1),(2394,0,0,0,'Outlaw Camp 3',740,3,0,0,0,0,27,2),(2395,0,0,0,'Outlaw Camp 4',200,3,0,0,0,0,9,1),(2396,0,0,0,'Outlaw Camp 5',200,3,0,0,0,0,9,1),(2397,0,0,0,'Outlaw Camp 6',200,3,0,0,0,0,9,1),(2398,0,0,0,'Outlaw Camp 7',780,3,0,0,0,0,27,2),(2399,0,0,0,'Outlaw Camp 8',280,3,0,0,0,0,12,1),(2400,0,0,0,'Outlaw Camp 9',200,3,0,0,0,0,9,1),(2401,0,0,0,'Outlaw Camp 10',200,3,0,0,0,0,9,1),(2402,0,0,0,'Outlaw Camp 11',200,3,0,0,0,0,9,1),(2404,0,0,0,'Outlaw Camp 12 (Shop)',280,3,0,0,0,0,7,0),(2405,0,0,0,'Outlaw Camp 13 (Shop)',280,3,0,0,0,0,7,0),(2406,0,0,0,'Outlaw Camp 14 (Shop)',640,3,0,0,0,0,16,0),(2407,0,0,0,'Open-Air Theatre',2700,2,0,0,0,0,60,1),(2408,0,0,0,'The Lair',7625,1,0,0,0,0,435,3),(2409,0,0,0,'Upper Barracks 2',210,3,0,0,0,0,13,1),(2410,0,0,0,'Upper Barracks 3',210,3,0,0,0,0,13,1),(2411,0,0,0,'Upper Barracks 4',210,3,0,0,0,0,14,1),(2412,0,0,0,'Upper Barracks 5',210,3,0,0,0,0,12,1),(2413,0,0,0,'Upper Barracks 6',210,3,0,0,0,0,12,1),(2414,0,0,0,'Upper Barracks 7',210,3,0,0,0,0,12,1),(2415,0,0,0,'Upper Barracks 8',210,3,0,0,0,0,13,1),(2416,0,0,0,'Upper Barracks 9',210,3,0,0,0,0,13,1),(2417,0,0,0,'Upper Barracks 10',210,3,0,0,0,0,13,1),(2418,0,0,0,'Upper Barracks 11',210,3,0,0,0,0,14,1),(2419,0,0,0,'Upper Barracks 12',210,3,0,0,0,0,12,1),(2420,0,0,0,'Low Waters Observatory',17165,9,0,0,0,0,760,5),(2421,0,0,0,'Eastern House of Tranquility',11120,14,0,0,0,0,356,5),(2422,0,0,0,'Mammoth House',9300,12,0,0,0,0,218,6),(2427,0,0,0,'Lower Barracks 1',300,3,0,0,0,0,17,1),(2428,0,0,0,'Lower Barracks 2',300,3,0,0,0,0,16,1),(2429,0,0,0,'Lower Barracks 3',300,3,0,0,0,0,17,1),(2430,0,0,0,'Lower Barracks 4',300,3,0,0,0,0,16,1),(2431,0,0,0,'Lower Barracks 5',300,3,0,0,0,0,17,1),(2432,0,0,0,'Lower Barracks 6',300,3,0,0,0,0,15,1),(2433,0,0,0,'Lower Barracks 7',300,3,0,0,0,0,17,1),(2434,0,0,0,'Lower Barracks 8',300,3,0,0,0,0,16,1),(2435,0,0,0,'Lower Barracks 9',300,3,0,0,0,0,17,1),(2436,0,0,0,'Lower Barracks 10',300,3,0,0,0,0,16,1),(2437,0,0,0,'Lower Barracks 11',300,3,0,0,0,0,17,1),(2438,0,0,0,'Lower Barracks 12',300,3,0,0,0,0,16,1),(2439,0,0,0,'Lower Barracks 13',300,3,0,0,0,0,17,1),(2440,0,0,0,'Lower Barracks 14',300,3,0,0,0,0,16,1),(2441,0,0,0,'Lower Barracks 15',300,3,0,0,0,0,17,1),(2442,0,0,0,'Lower Barracks 16',300,3,0,0,0,0,16,1),(2443,0,0,0,'Lower Barracks 17',300,3,0,0,0,0,17,1),(2444,0,0,0,'Lower Barracks 18',300,3,0,0,0,0,16,1),(2445,0,0,0,'Lower Barracks 19',300,3,0,0,0,0,17,1),(2446,0,0,0,'Lower Barracks 20',300,3,0,0,0,0,16,1),(2447,0,0,0,'Lower Barracks 21',300,3,0,0,0,0,17,1),(2448,0,0,0,'Lower Barracks 22',300,3,0,0,0,0,16,1),(2449,0,0,0,'Lower Barracks 23',300,3,0,0,0,0,17,1),(2450,0,0,0,'Lower Barracks 24',300,3,0,0,0,0,16,1),(2451,0,0,0,'The Farms 4',1530,3,0,0,0,0,36,2),(2452,0,0,0,'Tunnel Gardens 1',2000,3,0,0,0,0,40,3),(2455,0,0,0,'Tunnel Gardens 2',2000,3,0,0,0,0,39,3),(2456,0,0,0,'The Yeah Beach Project',6525,7,0,0,0,0,183,3),(2460,0,0,0,'Hare\'s Den',7500,3,0,0,0,0,233,4),(2461,0,0,0,'Lost Cavern',14730,3,0,0,0,0,621,7),(2462,0,0,0,'Caveman Shelter',3780,14,0,0,0,0,92,4),(2463,0,0,0,'Old Sanctuary of God King Qjell',21940,28,0,0,0,0,854,6),(2464,0,0,0,'Wallside Lane 1',7590,33,0,0,0,0,295,4),(2465,0,0,0,'Wallside Residence',6680,33,0,0,0,0,223,4),(2466,0,0,0,'Wallside Lane 2',8445,33,0,0,0,0,294,4),(2467,0,0,0,'Antimony Lane 3',3665,33,0,0,0,0,126,3),(2468,0,0,0,'Antimony Lane 2',4745,33,0,0,0,0,159,3),(2469,0,0,0,'Vanward Flats B',7410,33,0,0,0,0,245,4),(2470,0,0,0,'Vanward Flats A',7410,33,0,0,0,0,222,4),(2471,0,0,0,'Bronze Brothers Bastion',35205,33,0,0,0,0,1181,15),(2472,0,0,0,'Antimony Lane 1',7105,33,0,0,0,0,242,5),(2473,0,0,0,'Rathleton Hills Estate',20685,33,0,0,0,0,646,13),(2474,0,0,0,'Rathleton Hills Residence',7085,33,0,0,0,0,228,3),(2475,0,0,0,'Rathleton Plaza 1',2890,33,0,0,0,0,95,2),(2476,0,0,0,'Rathleton Plaza 2',2620,33,0,0,0,0,99,2),(2478,0,0,0,'Antimony Lane 4',5150,33,0,0,0,0,176,3),(2480,0,0,0,'Old Heritage Estate',12075,33,0,0,0,0,402,7),(2481,0,0,0,'Cistern Ave',3745,33,0,0,0,0,173,2),(2482,0,0,0,'Rathleton Plaza 4',5005,33,0,0,0,0,193,2),(2483,0,0,0,'Rathleton Plaza 3',5735,33,0,0,0,0,193,3),(2488,0,0,0,'Thrarhor V e (Shop)',3000,9,0,0,0,0,36,1),(2491,0,0,0,'Isle of Solitude House',3000,31,0,0,0,0,529,14),(2492,0,0,0,'',0,0,0,0,0,0,208,3),(2493,0,0,0,'',0,0,0,0,0,0,150,2),(2494,0,0,0,'',0,0,0,0,0,0,207,3),(2495,0,0,0,'',0,0,0,0,0,0,258,3),(2496,0,0,0,'',0,0,0,0,0,0,177,2),(2497,0,0,0,'',0,0,0,0,0,0,208,2),(2498,0,0,0,'',0,0,0,0,0,0,132,3),(2499,0,0,0,'',0,0,0,0,0,0,168,4),(2500,0,0,0,'',0,0,0,0,0,0,112,2),(2501,0,0,0,'',0,0,0,0,0,0,120,2),(2502,0,0,0,'',0,0,0,0,0,0,126,3),(2503,0,0,0,'',0,0,0,0,0,0,118,2),(2504,0,0,0,'',0,0,0,0,0,0,122,2),(2505,0,0,0,'',0,0,0,0,0,0,153,2),(2506,0,0,0,'',0,0,0,0,0,0,19,1),(2507,0,0,0,'',0,0,0,0,0,0,26,2),(2508,0,0,0,'',0,0,0,0,0,0,25,1),(2509,0,0,0,'',0,0,0,0,0,0,20,1),(2510,0,0,0,'',0,0,0,0,0,0,28,1),(2511,0,0,0,'',0,0,0,0,0,0,20,1),(2512,0,0,0,'',0,0,0,0,0,0,20,1),(2513,0,0,0,'',0,0,0,0,0,0,24,1),(2514,0,0,0,'',0,0,0,0,0,0,25,1),(2515,0,0,0,'',0,0,0,0,0,0,20,1),(2516,0,0,0,'',0,0,0,0,0,0,25,1),(2517,0,0,0,'',0,0,0,0,0,0,15,1),(2518,0,0,0,'',0,0,0,0,0,0,20,1),(2519,0,0,0,'',0,0,0,0,0,0,22,2),(2520,0,0,0,'',0,0,0,0,0,0,20,1),(2521,0,0,0,'',0,0,0,0,0,0,20,1),(2522,0,0,0,'',0,0,0,0,0,0,29,1),(2523,0,0,0,'',0,0,0,0,0,0,12,1),(2524,0,0,0,'',0,0,0,0,0,0,23,1),(2525,0,0,0,'',0,0,0,0,0,0,16,1),(2526,0,0,0,'',0,0,0,0,0,0,25,2),(2527,0,0,0,'',0,0,0,0,0,0,25,1),(2528,0,0,0,'',0,0,0,0,0,0,39,1),(2529,0,0,0,'',0,0,0,0,0,0,40,2),(2530,0,0,0,'',0,0,0,0,0,0,36,1),(2531,0,0,0,'',0,0,0,0,0,0,61,2),(2532,0,0,0,'',0,0,0,0,0,0,249,4),(2533,0,0,0,'',0,0,0,0,0,0,190,2),(2534,0,0,0,'',0,0,0,0,0,0,298,9),(2535,0,0,0,'',0,0,0,0,0,0,126,2),(2536,0,0,0,'',0,0,0,0,0,0,460,13),(2537,0,0,0,'',0,0,0,0,0,0,120,4),(2538,0,0,0,'',0,0,0,0,0,0,145,4),(2539,0,0,0,'',0,0,0,0,0,0,360,12),(2540,0,0,0,'',0,0,0,0,0,0,138,2),(2541,0,0,0,'',0,0,0,0,0,0,158,2),(2542,0,0,0,'',0,0,0,0,0,0,64,1),(2543,0,0,0,'',0,0,0,0,0,0,395,10),(2544,0,0,0,'',0,0,0,0,0,0,129,1),(2545,0,0,0,'',0,0,0,0,0,0,105,1),(2546,0,0,0,'',0,0,0,0,0,0,153,2),(2547,0,0,0,'',0,0,0,0,0,0,140,2),(2548,0,0,0,'',0,0,0,0,0,0,112,3),(2549,0,0,0,'',0,0,0,0,0,0,207,3),(2550,0,0,0,'',0,0,0,0,0,0,216,5),(2551,0,0,0,'',0,0,0,0,0,0,114,2),(2552,0,0,0,'',0,0,0,0,0,0,242,4),(2553,0,0,0,'',0,0,0,0,0,0,270,4),(2554,0,0,0,'',0,0,0,0,0,0,41,2),(2555,0,0,0,'',0,0,0,0,0,0,41,2),(2556,0,0,0,'',0,0,0,0,0,0,35,3),(2557,0,0,0,'',0,0,0,0,0,0,44,3),(2558,0,0,0,'',0,0,0,0,0,0,56,4),(2559,0,0,0,'',0,0,0,0,0,0,20,1),(2560,0,0,0,'',0,0,0,0,0,0,42,3),(2561,0,0,0,'',0,0,0,0,0,0,16,1),(2562,0,0,0,'',0,0,0,0,0,0,22,1),(2563,0,0,0,'',0,0,0,0,0,0,22,1),(2564,0,0,0,'',0,0,0,0,0,0,10,1),(2565,0,0,0,'',0,0,0,0,0,0,21,1),(2566,0,0,0,'',0,0,0,0,0,0,16,1),(2567,0,0,0,'',0,0,0,0,0,0,17,1),(2568,0,0,0,'',0,0,0,0,0,0,17,1),(2569,0,0,0,'',0,0,0,0,0,0,21,1),(2570,0,0,0,'',0,0,0,0,0,0,16,1),(2571,0,0,0,'',0,0,0,0,0,0,20,1),(2572,0,0,0,'',0,0,0,0,0,0,25,2),(2573,0,0,0,'',0,0,0,0,0,0,25,2),(2574,0,0,0,'',0,0,0,0,0,0,26,1),(2575,0,0,0,'',0,0,0,0,0,0,25,2),(2576,0,0,0,'',0,0,0,0,0,0,39,2),(2577,0,0,0,'',0,0,0,0,0,0,16,1),(2578,0,0,0,'',0,0,0,0,0,0,18,1),(2579,0,0,0,'',0,0,0,0,0,0,18,1),(2580,0,0,0,'',0,0,0,0,0,0,16,1),(2581,0,0,0,'',0,0,0,0,0,0,16,1),(2582,0,0,0,'',0,0,0,0,0,0,17,1),(2583,0,0,0,'',0,0,0,0,0,0,16,1),(2584,0,0,0,'',0,0,0,0,0,0,17,1),(2585,0,0,0,'',0,0,0,0,0,0,16,1),(2586,0,0,0,'',0,0,0,0,0,0,19,1),(2587,0,0,0,'',0,0,0,0,0,0,16,1),(2588,0,0,0,'',0,0,0,0,0,0,18,1),(2589,0,0,0,'',0,0,0,0,0,0,14,1),(2590,0,0,0,'',0,0,0,0,0,0,17,1),(2591,0,0,0,'',0,0,0,0,0,0,16,1),(2592,0,0,0,'',0,0,0,0,0,0,17,1),(2593,0,0,0,'',0,0,0,0,0,0,16,1),(2594,0,0,0,'',0,0,0,0,0,0,19,1),(2595,0,0,0,'',0,0,0,0,0,0,16,1),(2596,0,0,0,'',0,0,0,0,0,0,17,1),(2597,0,0,0,'',0,0,0,0,0,0,17,1),(2598,0,0,0,'',0,0,0,0,0,0,33,2),(2599,0,0,0,'',0,0,0,0,0,0,25,2),(2600,0,0,0,'',0,0,0,0,0,0,25,2),(2601,0,0,0,'',0,0,0,0,0,0,36,3),(2602,0,0,0,'',0,0,0,0,0,0,42,3),(2603,0,0,0,'',0,0,0,0,0,0,24,2),(2604,0,0,0,'',0,0,0,0,0,0,24,2),(2605,0,0,0,'',0,0,0,0,0,0,33,2),(2606,0,0,0,'',0,0,0,0,0,0,29,2),(2607,0,0,0,'',0,0,0,0,0,0,22,1),(2608,0,0,0,'',0,0,0,0,0,0,31,2),(2609,0,0,0,'',0,0,0,0,0,0,44,1),(2610,0,0,0,'',0,0,0,0,0,0,19,1),(2611,0,0,0,'',0,0,0,0,0,0,35,2),(2612,0,0,0,'',0,0,0,0,0,0,30,2),(2613,0,0,0,'',0,0,0,0,0,0,34,2),(2614,0,0,0,'',0,0,0,0,0,0,26,2),(2615,0,0,0,'',0,0,0,0,0,0,40,1),(2616,0,0,0,'',0,0,0,0,0,0,24,1),(2617,0,0,0,'',0,0,0,0,0,0,15,1),(2618,0,0,0,'',0,0,0,0,0,0,23,1),(2619,0,0,0,'',0,0,0,0,0,0,30,2),(2620,0,0,0,'',0,0,0,0,0,0,34,2),(2621,0,0,0,'',0,0,0,0,0,0,40,1),(2622,0,0,0,'',0,0,0,0,0,0,38,1),(2623,0,0,0,'',0,0,0,0,0,0,21,1),(2624,0,0,0,'',0,0,0,0,0,0,19,1),(2625,0,0,0,'',0,0,0,0,0,0,40,1),(2626,0,0,0,'',0,0,0,0,0,0,48,1),(2627,0,0,0,'',0,0,0,0,0,0,48,1),(2628,0,0,0,'',0,0,0,0,0,0,42,1),(2629,0,0,0,'',0,0,0,0,0,0,24,1),(2630,0,0,0,'',0,0,0,0,0,0,48,2),(2631,0,0,0,'',0,0,0,0,0,0,24,1),(2632,0,0,0,'',0,0,0,0,0,0,42,1),(2633,0,0,0,'',0,0,0,0,0,0,42,1),(2634,0,0,0,'',0,0,0,0,0,0,24,1),(2635,0,0,0,'',0,0,0,0,0,0,42,1),(2636,0,0,0,'',0,0,0,0,0,0,24,1),(2637,0,0,0,'',0,0,0,0,0,0,47,2),(2638,0,0,0,'',0,0,0,0,0,0,30,1),(2639,0,0,0,'',0,0,0,0,0,0,48,1),(2640,0,0,0,'',0,0,0,0,0,0,30,1),(2641,0,0,0,'',0,0,0,0,0,0,48,2),(2642,0,0,0,'',0,0,0,0,0,0,49,2),(2643,0,0,0,'',0,0,0,0,0,0,42,1),(2644,0,0,0,'',0,0,0,0,0,0,96,4),(2645,0,0,0,'',0,0,0,0,0,0,41,1),(2646,0,0,0,'',0,0,0,0,0,0,66,2),(2647,0,0,0,'',0,0,0,0,0,0,41,2),(2648,0,0,0,'',0,0,0,0,0,0,72,2),(2649,0,0,0,'',0,0,0,0,0,0,108,5),(2650,0,0,0,'',0,0,0,0,0,0,48,1),(2651,0,0,0,'',0,0,0,0,0,0,48,2),(2652,0,0,0,'',0,0,0,0,0,0,72,2),(2653,0,0,0,'',0,0,0,0,0,0,42,1),(2654,0,0,0,'',0,0,0,0,0,0,66,2),(2655,0,0,0,'',0,0,0,0,0,0,78,2),(2656,0,0,0,'',0,0,0,0,0,0,72,2),(2657,0,0,0,'',0,0,0,0,0,0,41,1),(2658,0,0,0,'',0,0,0,0,0,0,96,3),(2659,0,0,0,'',0,0,0,0,0,0,40,2),(2660,0,0,0,'',0,0,0,0,0,0,40,1),(2661,0,0,0,'',0,0,0,0,0,0,41,1),(2662,0,0,0,'',0,0,0,0,0,0,108,4),(2663,0,0,0,'',0,0,0,0,0,0,42,1),(2664,0,0,0,'',0,0,0,0,0,0,108,4),(2665,0,0,0,'',0,0,0,0,0,0,42,1),(2666,0,0,0,'',0,0,0,0,0,0,41,1),(2667,0,0,0,'',0,0,0,0,0,0,95,4),(2668,0,0,0,'',0,0,0,0,0,0,38,1),(2669,0,0,0,'',0,0,0,0,0,0,48,1),(2670,0,0,0,'',0,0,0,0,0,0,57,2),(2671,0,0,0,'',0,0,0,0,0,0,41,1),(2672,0,0,0,'',0,0,0,0,0,0,66,2),(2673,0,0,0,'',0,0,0,0,0,0,66,2),(2674,0,0,0,'',0,0,0,0,0,0,65,2),(2675,0,0,0,'',0,0,0,0,0,0,78,2),(2676,0,0,0,'',0,0,0,0,0,0,66,2),(2677,0,0,0,'',0,0,0,0,0,0,117,2),(2678,0,0,0,'',0,0,0,0,0,0,139,2),(2679,0,0,0,'',0,0,0,0,0,0,233,4),(2680,0,0,0,'',0,0,0,0,0,0,376,14),(2681,0,0,0,'',0,0,0,0,0,0,40,2),(2682,0,0,0,'',0,0,0,0,0,0,40,1),(2683,0,0,0,'',0,0,0,0,0,0,65,2),(2684,0,0,0,'',0,0,0,0,0,0,42,2),(2685,0,0,0,'',0,0,0,0,0,0,72,2),(2686,0,0,0,'',0,0,0,0,0,0,42,2),(2687,0,0,0,'',0,0,0,0,0,0,102,3),(2688,0,0,0,'',0,0,0,0,0,0,41,1),(2689,0,0,0,'',0,0,0,0,0,0,90,5),(2690,0,0,0,'',0,0,0,0,0,0,66,2),(2691,0,0,0,'',0,0,0,0,0,0,65,2),(2692,0,0,0,'',0,0,0,0,0,0,66,2),(2693,0,0,0,'',0,0,0,0,0,0,78,2),(2694,0,0,0,'',0,0,0,0,0,0,25,1),(2695,0,0,0,'',0,0,0,0,0,0,34,1),(2696,0,0,0,'',0,0,0,0,0,0,30,1),(2697,0,0,0,'',0,0,0,0,0,0,42,2),(2698,0,0,0,'',0,0,0,0,0,0,63,3),(2699,0,0,0,'',0,0,0,0,0,0,36,2),(2700,0,0,0,'',0,0,0,0,0,0,30,1),(2701,0,0,0,'',0,0,0,0,0,0,29,1),(2702,0,0,0,'',0,0,0,0,0,0,33,1),(2703,0,0,0,'',0,0,0,0,0,0,52,2),(2704,0,0,0,'',0,0,0,0,0,0,30,1),(2705,0,0,0,'',0,0,0,0,0,0,30,1),(2706,0,0,0,'',0,0,0,0,0,0,21,1),(2707,0,0,0,'',0,0,0,0,0,0,18,1),(2708,0,0,0,'',0,0,0,0,0,0,18,1),(2709,0,0,0,'',0,0,0,0,0,0,20,1),(2710,0,0,0,'',0,0,0,0,0,0,39,2),(2711,0,0,0,'',0,0,0,0,0,0,40,2),(2712,0,0,0,'',0,0,0,0,0,0,45,2),(2713,0,0,0,'',0,0,0,0,0,0,80,3),(2714,0,0,0,'',0,0,0,0,0,0,20,1),(2715,0,0,0,'',0,0,0,0,0,0,15,1),(2716,0,0,0,'',0,0,0,0,0,0,16,1),(2717,0,0,0,'',0,0,0,0,0,0,12,1),(2718,0,0,0,'',0,0,0,0,0,0,37,1),(2719,0,0,0,'',0,0,0,0,0,0,28,1),(2720,0,0,0,'',0,0,0,0,0,0,21,1),(2721,0,0,0,'',0,0,0,0,0,0,32,1),(2722,0,0,0,'',0,0,0,0,0,0,24,1),(2723,0,0,0,'',0,0,0,0,0,0,91,3),(2724,0,0,0,'',0,0,0,0,0,0,80,4),(2725,0,0,0,'',0,0,0,0,0,0,84,3),(2726,0,0,0,'',0,0,0,0,0,0,27,1),(2727,0,0,0,'',0,0,0,0,0,0,190,10),(2728,0,0,0,'',0,0,0,0,0,0,51,2),(2729,0,0,0,'',0,0,0,0,0,0,15,1),(2730,0,0,0,'',0,0,0,0,0,0,68,4),(2731,0,0,0,'',0,0,0,0,0,0,58,3),(2732,0,0,0,'',0,0,0,0,0,0,49,2),(2733,0,0,0,'',0,0,0,0,0,0,14,1),(2734,0,0,0,'',0,0,0,0,0,0,44,2),(2735,0,0,0,'',0,0,0,0,0,0,44,2),(2736,0,0,0,'',0,0,0,0,0,0,32,1),(2737,0,0,0,'',0,0,0,0,0,0,30,1),(2738,0,0,0,'',0,0,0,0,0,0,67,3),(2739,0,0,0,'',0,0,0,0,0,0,18,1),(2740,0,0,0,'',0,0,0,0,0,0,38,2),(2741,0,0,0,'',0,0,0,0,0,0,41,3),(2742,0,0,0,'',0,0,0,0,0,0,36,1),(2743,0,0,0,'',0,0,0,0,0,0,30,2),(2744,0,0,0,'',0,0,0,0,0,0,32,1),(2745,0,0,0,'',0,0,0,0,0,0,27,1),(2746,0,0,0,'',0,0,0,0,0,0,49,2),(2747,0,0,0,'',0,0,0,0,0,0,14,1),(2748,0,0,0,'',0,0,0,0,0,0,49,3),(2749,0,0,0,'',0,0,0,0,0,0,51,2),(2750,0,0,0,'',0,0,0,0,0,0,51,1),(2751,0,0,0,'',0,0,0,0,0,0,51,2),(2752,0,0,0,'',0,0,0,0,0,0,50,2),(2753,0,0,0,'',0,0,0,0,0,0,50,2),(2754,0,0,0,'',0,0,0,0,0,0,38,2),(2755,0,0,0,'',0,0,0,0,0,0,38,1),(2756,0,0,0,'',0,0,0,0,0,0,38,2),(2757,0,0,0,'',0,0,0,0,0,0,25,1),(2758,0,0,0,'',0,0,0,0,0,0,27,1),(2759,0,0,0,'',0,0,0,0,0,0,52,2),(2760,0,0,0,'',0,0,0,0,0,0,36,1),(2761,0,0,0,'',0,0,0,0,0,0,41,2),(2762,0,0,0,'',0,0,0,0,0,0,25,1),(2763,0,0,0,'',0,0,0,0,0,0,27,1),(2764,0,0,0,'',0,0,0,0,0,0,27,2),(2765,0,0,0,'',0,0,0,0,0,0,27,2),(2766,0,0,0,'',0,0,0,0,0,0,36,2),(2767,0,0,0,'',0,0,0,0,0,0,25,1),(2768,0,0,0,'',0,0,0,0,0,0,27,1),(2769,0,0,0,'',0,0,0,0,0,0,52,2),(2770,0,0,0,'',0,0,0,0,0,0,38,1),(2771,0,0,0,'',0,0,0,0,0,0,14,1),(2772,0,0,0,'',0,0,0,0,0,0,138,8),(2773,0,0,0,'',0,0,0,0,0,0,32,2),(2774,0,0,0,'',0,0,0,0,0,0,30,1),(2775,0,0,0,'',0,0,0,0,0,0,86,3),(2776,0,0,0,'',0,0,0,0,0,0,32,1),(2777,0,0,0,'',0,0,0,0,0,0,34,2),(2778,0,0,0,'',0,0,0,0,0,0,18,1),(2779,0,0,0,'',0,0,0,0,0,0,49,2),(2780,0,0,0,'',0,0,0,0,0,0,44,2),(2781,0,0,0,'',0,0,0,0,0,0,80,3),(2782,0,0,0,'',0,0,0,0,0,0,83,3),(2783,0,0,0,'',0,0,0,0,0,0,277,14),(2784,0,0,0,'',0,0,0,0,0,0,49,2),(2785,0,0,0,'',0,0,0,0,0,0,14,1),(2786,0,0,0,'',0,0,0,0,0,0,16,1),(2787,0,0,0,'',0,0,0,0,0,0,18,1),(2788,0,0,0,'',0,0,0,0,0,0,34,1),(2789,0,0,0,'',0,0,0,0,0,0,16,1),(2790,0,0,0,'',0,0,0,0,0,0,42,2),(2791,0,0,0,'',0,0,0,0,0,0,38,2),(2792,0,0,0,'',0,0,0,0,0,0,44,2),(2793,0,0,0,'',0,0,0,0,0,0,49,2),(2794,0,0,0,'',0,0,0,0,0,0,38,2),(2795,0,0,0,'',0,0,0,0,0,0,47,2),(2796,0,0,0,'',0,0,0,0,0,0,25,1),(2797,0,0,0,'',0,0,0,0,0,0,42,2),(2798,0,0,0,'',0,0,0,0,0,0,56,3),(2799,0,0,0,'',0,0,0,0,0,0,98,3),(2800,0,0,0,'',0,0,0,0,0,0,27,1),(2801,0,0,0,'',0,0,0,0,0,0,27,1),(2802,0,0,0,'',0,0,0,0,0,0,25,2),(2803,0,0,0,'',0,0,0,0,0,0,27,1),(2804,0,0,0,'',0,0,0,0,0,0,36,2),(2805,0,0,0,'',0,0,0,0,0,0,51,3),(2806,0,0,0,'',0,0,0,0,0,0,49,1),(2807,0,0,0,'',0,0,0,0,0,0,49,2),(2808,0,0,0,'',0,0,0,0,0,0,49,2),(2809,0,0,0,'',0,0,0,0,0,0,27,1),(2810,0,0,0,'',0,0,0,0,0,0,27,1),(2811,0,0,0,'',0,0,0,0,0,0,27,1),(2812,0,0,0,'',0,0,0,0,0,0,25,1),(2813,0,0,0,'',0,0,0,0,0,0,36,2),(2814,0,0,0,'',0,0,0,0,0,0,184,16),(2815,0,0,0,'',0,0,0,0,0,0,25,1),(2816,0,0,0,'',0,0,0,0,0,0,36,1),(2817,0,0,0,'',0,0,0,0,0,0,25,1),(2818,0,0,0,'',0,0,0,0,0,0,25,1),(2819,0,0,0,'',0,0,0,0,0,0,286,15),(2820,0,0,0,'',0,0,0,0,0,0,64,2),(2821,0,0,0,'',0,0,0,0,0,0,42,2),(2822,0,0,0,'',0,0,0,0,0,0,70,4),(2823,0,0,0,'',0,0,0,0,0,0,72,3),(2824,0,0,0,'',0,0,0,0,0,0,49,2),(2825,0,0,0,'',0,0,0,0,0,0,36,2),(2826,0,0,0,'',0,0,0,0,0,0,42,2),(2827,0,0,0,'',0,0,0,0,0,0,63,3),(2828,0,0,0,'',0,0,0,0,0,0,176,4),(2829,0,0,0,'',0,0,0,0,0,0,157,2),(2830,0,0,0,'',0,0,0,0,0,0,36,1),(2831,0,0,0,'',0,0,0,0,0,0,30,1),(2832,0,0,0,'',0,0,0,0,0,0,65,2),(2833,0,0,0,'',0,0,0,0,0,0,24,1),(2834,0,0,0,'',0,0,0,0,0,0,84,1),(2835,0,0,0,'',0,0,0,0,0,0,848,20),(2836,0,0,0,'',0,0,0,0,0,0,63,2),(2837,0,0,0,'',0,0,0,0,0,0,42,2),(2838,0,0,0,'',0,0,0,0,0,0,36,2),(2839,0,0,0,'',0,0,0,0,0,0,42,2),(2840,0,0,0,'',0,0,0,0,0,0,30,2),(2841,0,0,0,'',0,0,0,0,0,0,30,2),(2842,0,0,0,'',0,0,0,0,0,0,36,2),(2843,0,0,0,'',0,0,0,0,0,0,36,2),(2844,0,0,0,'',0,0,0,0,0,0,25,1),(2845,0,0,0,'',0,0,0,0,0,0,128,3),(2846,0,0,0,'',0,0,0,0,0,0,36,2),(2847,0,0,0,'',0,0,0,0,0,0,98,3),(2848,0,0,0,'',0,0,0,0,0,0,208,4),(2849,0,0,0,'',0,0,0,0,0,0,56,1),(2850,0,0,0,'',0,0,0,0,0,0,56,1),(2851,0,0,0,'',0,0,0,0,0,0,56,1),(2852,0,0,0,'',0,0,0,0,0,0,256,4),(2853,0,0,0,'',0,0,0,0,0,0,49,1),(2854,0,0,0,'',0,0,0,0,0,0,49,2),(2855,0,0,0,'',0,0,0,0,0,0,128,3),(2856,0,0,0,'',0,0,0,0,0,0,42,2),(2857,0,0,0,'',0,0,0,0,0,0,56,3),(2858,0,0,0,'',0,0,0,0,0,0,176,7),(2859,0,0,0,'',0,0,0,0,0,0,897,23),(2860,0,0,0,'',0,0,0,0,0,0,96,2),(2861,0,0,0,'',0,0,0,0,0,0,40,2),(2862,0,0,0,'',0,0,0,0,0,0,42,2),(2863,0,0,0,'',0,0,0,0,0,0,34,2),(2864,0,0,0,'',0,0,0,0,0,0,24,1),(2865,0,0,0,'',0,0,0,0,0,0,35,2),(2866,0,0,0,'',0,0,0,0,0,0,30,1),(2867,0,0,0,'',0,0,0,0,0,0,110,2),(2868,0,0,0,'',0,0,0,0,0,0,110,2),(2869,0,0,0,'',0,0,0,0,0,0,154,3),(2870,0,0,0,'',0,0,0,0,0,0,77,4),(2871,0,0,0,'',0,0,0,0,0,0,132,4),(2872,0,0,0,'',0,0,0,0,0,0,569,24),(2873,0,0,0,'',0,0,0,0,0,0,126,3),(2874,0,0,0,'',0,0,0,0,0,0,54,2),(2875,0,0,0,'',0,0,0,0,0,0,128,3),(2876,0,0,0,'',0,0,0,0,0,0,100,2),(2877,0,0,0,'',0,0,0,0,0,0,72,2),(2878,0,0,0,'',0,0,0,0,0,0,56,2),(2879,0,0,0,'',0,0,0,0,0,0,75,2),(2880,0,0,0,'',0,0,0,0,0,0,154,3),(2881,0,0,0,'',0,0,0,0,0,0,65,2),(2882,0,0,0,'',0,0,0,0,0,0,56,2),(2883,0,0,0,'',0,0,0,0,0,0,72,2),(2884,0,0,0,'',0,0,0,0,0,0,128,3),(2885,0,0,0,'',0,0,0,0,0,0,49,1),(2886,0,0,0,'',0,0,0,0,0,0,75,1),(2887,0,0,0,'',0,0,0,0,0,0,160,3),(2888,0,0,0,'',0,0,0,0,0,0,45,1),(2889,0,0,0,'',0,0,0,0,0,0,60,3),(2890,0,0,0,'',0,0,0,0,0,0,45,1),(2891,0,0,0,'',0,0,0,0,0,0,82,3),(2892,0,0,0,'',0,0,0,0,0,0,189,4),(2893,0,0,0,'',0,0,0,0,0,0,81,3),(2894,0,0,0,'',0,0,0,0,0,0,144,2),(2895,0,0,0,'',0,0,0,0,0,0,30,2),(2896,0,0,0,'',0,0,0,0,0,0,24,2),(2897,0,0,0,'',0,0,0,0,0,0,24,1),(2898,0,0,0,'',0,0,0,0,0,0,24,1),(2899,0,0,0,'',0,0,0,0,0,0,24,2),(2900,0,0,0,'',0,0,0,0,0,0,20,1),(2901,0,0,0,'',0,0,0,0,0,0,20,1),(2902,0,0,0,'',0,0,0,0,0,0,20,2),(2903,0,0,0,'',0,0,0,0,0,0,20,1),(2904,0,0,0,'',0,0,0,0,0,0,25,1),(2905,0,0,0,'',0,0,0,0,0,0,112,2),(2906,0,0,0,'',0,0,0,0,0,0,64,2),(2907,0,0,0,'',0,0,0,0,0,0,36,1),(2908,0,0,0,'',0,0,0,0,0,0,45,1),(2909,0,0,0,'',0,0,0,0,0,0,70,2),(2910,0,0,0,'',0,0,0,0,0,0,42,2),(2911,0,0,0,'',0,0,0,0,0,0,54,2),(2912,0,0,0,'',0,0,0,0,0,0,634,30),(2913,0,0,0,'',0,0,0,0,0,0,56,2),(2914,0,0,0,'',0,0,0,0,0,0,84,3),(2915,0,0,0,'',0,0,0,0,0,0,66,2),(2916,0,0,0,'',0,0,0,0,0,0,56,2),(2917,0,0,0,'',0,0,0,0,0,0,56,2),(2918,0,0,0,'',0,0,0,0,0,0,48,2),(2919,0,0,0,'',0,0,0,0,0,0,806,24),(2920,0,0,0,'',0,0,0,0,0,0,530,17),(2921,0,0,0,'',0,0,0,0,0,0,464,17),(2922,0,0,0,'',0,0,0,0,0,0,25,1),(2923,0,0,0,'',0,0,0,0,0,0,40,1),(2924,0,0,0,'',0,0,0,0,0,0,40,1),(2925,0,0,0,'',0,0,0,0,0,0,48,1),(2926,0,0,0,'',0,0,0,0,0,0,530,17),(2927,0,0,0,'',0,0,0,0,0,0,14,1),(2928,0,0,0,'',0,0,0,0,0,0,24,2),(2929,0,0,0,'',0,0,0,0,0,0,25,1),(2930,0,0,0,'',0,0,0,0,0,0,25,1),(2931,0,0,0,'',0,0,0,0,0,0,25,1),(2932,0,0,0,'',0,0,0,0,0,0,26,1),(2933,0,0,0,'',0,0,0,0,0,0,26,1),(2934,0,0,0,'',0,0,0,0,0,0,26,1),(2935,0,0,0,'',0,0,0,0,0,0,50,3),(2936,0,0,0,'',0,0,0,0,0,0,50,3),(2937,0,0,0,'',0,0,0,0,0,0,50,3),(2938,0,0,0,'',0,0,0,0,0,0,32,2),(2939,0,0,0,'',0,0,0,0,0,0,36,2),(2940,0,0,0,'',0,0,0,0,0,0,36,2),(2941,0,0,0,'',0,0,0,0,0,0,36,2),(2942,0,0,0,'',0,0,0,0,0,0,60,3),(2943,0,0,0,'',0,0,0,0,0,0,307,9),(2944,0,0,0,'',0,0,0,0,0,0,43,3),(2945,0,0,0,'',0,0,0,0,0,0,42,3),(2946,0,0,0,'',0,0,0,0,0,0,35,2),(2947,0,0,0,'',0,0,0,0,0,0,38,2),(2948,0,0,0,'',0,0,0,0,0,0,35,2),(2949,0,0,0,'',0,0,0,0,0,0,35,2),(2950,0,0,0,'',0,0,0,0,0,0,638,23),(2951,0,0,0,'',0,0,0,0,0,0,16,1),(2952,0,0,0,'',0,0,0,0,0,0,36,1),(2953,0,0,0,'',0,0,0,0,0,0,39,1),(2954,0,0,0,'',0,0,0,0,0,0,51,2),(2955,0,0,0,'',0,0,0,0,0,0,276,3),(2956,0,0,0,'',0,0,0,0,0,0,201,2),(2957,0,0,0,'',0,0,0,0,0,0,228,2),(2958,0,0,0,'',0,0,0,0,0,0,210,4),(2959,0,0,0,'',0,0,0,0,0,0,422,4),(2960,0,0,0,'',0,0,0,0,0,0,260,2),(2961,0,0,0,'',0,0,0,0,0,0,258,2),(2962,0,0,0,'',0,0,0,0,0,0,306,4),(2963,0,0,0,'',0,0,0,0,0,0,344,2),(2964,0,0,0,'',0,0,0,0,0,0,301,4),(2965,0,0,0,'',0,0,0,0,0,0,249,3),(2966,0,0,0,'',0,0,0,0,0,0,343,5),(2967,0,0,0,'',0,0,0,0,0,0,276,4),(2968,0,0,0,'',0,0,0,0,0,0,179,2),(2969,0,0,0,'',0,0,0,0,0,0,257,2),(2970,0,0,0,'',0,0,0,0,0,0,367,3),(2971,0,0,0,'',0,0,0,0,0,0,976,27),(2972,0,0,0,'',0,0,0,0,0,0,1093,33),(2973,0,0,0,'',0,0,0,0,0,0,811,33),(2974,0,0,0,'',0,0,0,0,0,0,96,1),(2975,0,0,0,'',0,0,0,0,0,0,42,2),(2976,0,0,0,'',0,0,0,0,0,0,36,2),(2977,0,0,0,'',0,0,0,0,0,0,36,2),(2978,0,0,0,'',0,0,0,0,0,0,40,2),(2979,0,0,0,'',0,0,0,0,0,0,30,1),(2980,0,0,0,'',0,0,0,0,0,0,25,1),(2981,0,0,0,'',0,0,0,0,0,0,30,1),(2982,0,0,0,'',0,0,0,0,0,0,24,1),(2983,0,0,0,'',0,0,0,0,0,0,24,1),(2984,0,0,0,'',0,0,0,0,0,0,40,2),(2985,0,0,0,'',0,0,0,0,0,0,30,1),(2986,0,0,0,'',0,0,0,0,0,0,30,1),(2987,0,0,0,'',0,0,0,0,0,0,29,1),(2988,0,0,0,'',0,0,0,0,0,0,15,1),(2989,0,0,0,'',0,0,0,0,0,0,15,1),(2990,0,0,0,'',0,0,0,0,0,0,370,10),(2991,0,0,0,'',0,0,0,0,0,0,30,1),(2992,0,0,0,'',0,0,0,0,0,0,171,24),(2993,0,0,0,'',0,0,0,0,0,0,166,4),(2994,0,0,0,'',0,0,0,0,0,0,161,4),(2995,0,0,0,'',0,0,0,0,0,0,25,1),(2996,0,0,0,'',0,0,0,0,0,0,30,1),(2997,0,0,0,'',0,0,0,0,0,0,30,1),(2998,0,0,0,'',0,0,0,0,0,0,30,1),(2999,0,0,0,'',0,0,0,0,0,0,35,2),(3000,0,0,0,'',0,0,0,0,0,0,25,1),(3001,0,0,0,'',0,0,0,0,0,0,25,1),(3002,0,0,0,'',0,0,0,0,0,0,30,1),(3003,0,0,0,'',0,0,0,0,0,0,35,2),(3004,0,0,0,'',0,0,0,0,0,0,25,1),(3005,0,0,0,'',0,0,0,0,0,0,25,1),(3006,0,0,0,'',0,0,0,0,0,0,37,1),(3007,0,0,0,'',0,0,0,0,0,0,48,1),(3008,0,0,0,'',0,0,0,0,0,0,522,11),(3009,0,0,0,'',0,0,0,0,0,0,42,0),(3010,0,0,0,'',0,0,0,0,0,0,36,0),(3011,0,0,0,'',0,0,0,0,0,0,47,0),(3012,0,0,0,'',0,0,0,0,0,0,30,0),(3013,0,0,0,'',0,0,0,0,0,0,48,0),(3014,0,0,0,'',0,0,0,0,0,0,42,0),(3015,0,0,0,'',0,0,0,0,0,0,24,1),(3016,0,0,0,'',0,0,0,0,0,0,24,1),(3017,0,0,0,'',0,0,0,0,0,0,30,1),(3018,0,0,0,'',0,0,0,0,0,0,24,1),(3019,0,0,0,'',0,0,0,0,0,0,24,1),(3020,0,0,0,'',0,0,0,0,0,0,30,1),(3021,0,0,0,'',0,0,0,0,0,0,42,2),(3022,0,0,0,'',0,0,0,0,0,0,35,2),(3023,0,0,0,'',0,0,0,0,0,0,35,2),(3024,0,0,0,'',0,0,0,0,0,0,41,2),(3025,0,0,0,'',0,0,0,0,0,0,30,2),(3026,0,0,0,'',0,0,0,0,0,0,31,2),(3027,0,0,0,'',0,0,0,0,0,0,49,2),(3028,0,0,0,'',0,0,0,0,0,0,49,2),(3029,0,0,0,'',0,0,0,0,0,0,49,2),(3030,0,0,0,'',0,0,0,0,0,0,49,2),(3031,0,0,0,'',0,0,0,0,0,0,128,4),(3032,0,0,0,'',0,0,0,0,0,0,54,1),(3033,0,0,0,'',0,0,0,0,0,0,80,2),(3034,0,0,0,'',0,0,0,0,0,0,36,2),(3035,0,0,0,'',0,0,0,0,0,0,30,1),(3036,0,0,0,'',0,0,0,0,0,0,36,2),(3037,0,0,0,'',0,0,0,0,0,0,30,1),(3038,0,0,0,'',0,0,0,0,0,0,36,2),(3039,0,0,0,'',0,0,0,0,0,0,30,1),(3040,0,0,0,'',0,0,0,0,0,0,35,2),(3041,0,0,0,'',0,0,0,0,0,0,30,1),(3042,0,0,0,'',0,0,0,0,0,0,50,2),(3043,0,0,0,'',0,0,0,0,0,0,116,3),(3044,0,0,0,'',0,0,0,0,0,0,70,3),(3045,0,0,0,'',0,0,0,0,0,0,216,3),(3046,0,0,0,'',0,0,0,0,0,0,596,16),(3047,0,0,0,'',0,0,0,0,0,0,30,1),(3048,0,0,0,'',0,0,0,0,0,0,38,2),(3049,0,0,0,'',0,0,0,0,0,0,48,2),(3050,0,0,0,'',0,0,0,0,0,0,30,1),(3051,0,0,0,'',0,0,0,0,0,0,30,1),(3052,0,0,0,'',0,0,0,0,0,0,36,1),(3053,0,0,0,'',0,0,0,0,0,0,26,1),(3054,0,0,0,'',0,0,0,0,0,0,34,1),(3055,0,0,0,'',0,0,0,0,0,0,33,1),(3056,0,0,0,'',0,0,0,0,0,0,48,2),(3057,0,0,0,'',0,0,0,0,0,0,54,2),(3058,0,0,0,'',0,0,0,0,0,0,38,1),(3059,0,0,0,'',0,0,0,0,0,0,38,1),(3060,0,0,0,'',0,0,0,0,0,0,36,1),(3061,0,0,0,'',0,0,0,0,0,0,25,1),(3062,0,0,0,'',0,0,0,0,0,0,35,1),(3063,0,0,0,'',0,0,0,0,0,0,36,1),(3064,0,0,0,'',0,0,0,0,0,0,52,2),(3065,0,0,0,'',0,0,0,0,0,0,60,2),(3066,0,0,0,'',0,0,0,0,0,0,38,1),(3067,0,0,0,'',0,0,0,0,0,0,38,1),(3068,0,0,0,'',0,0,0,0,0,0,35,1),(3069,0,0,0,'',0,0,0,0,0,0,25,1),(3070,0,0,0,'',0,0,0,0,0,0,36,1),(3071,0,0,0,'',0,0,0,0,0,0,165,4),(3072,0,0,0,'',0,0,0,0,0,0,159,4),(3073,0,0,0,'',0,0,0,0,0,0,20,1),(3074,0,0,0,'',0,0,0,0,0,0,20,1),(3075,0,0,0,'',0,0,0,0,0,0,20,1),(3076,0,0,0,'',0,0,0,0,0,0,20,1),(3077,0,0,0,'',0,0,0,0,0,0,24,1),(3078,0,0,0,'',0,0,0,0,0,0,24,1),(3079,0,0,0,'',0,0,0,0,0,0,160,2),(3080,0,0,0,'',0,0,0,0,0,0,142,2),(3081,0,0,0,'',0,0,0,0,0,0,176,4),(3082,0,0,0,'',0,0,0,0,0,0,168,2),(3083,0,0,0,'',0,0,0,0,0,0,48,2),(3084,0,0,0,'',0,0,0,0,0,0,84,2),(3085,0,0,0,'',0,0,0,0,0,0,208,4),(3086,0,0,0,'',0,0,0,0,0,0,198,2),(3087,0,0,0,'',0,0,0,0,0,0,195,2),(3088,0,0,0,'',0,0,0,0,0,0,214,2),(3089,0,0,0,'',0,0,0,0,0,0,72,4),(3090,0,0,0,'',0,0,0,0,0,0,54,2),(3091,0,0,0,'',0,0,0,0,0,0,132,3),(3092,0,0,0,'',0,0,0,0,0,0,48,2),(3093,0,0,0,'',0,0,0,0,0,0,40,2),(3094,0,0,0,'',0,0,0,0,0,0,32,1),(3095,0,0,0,'',0,0,0,0,0,0,62,2),(3096,0,0,0,'',0,0,0,0,0,0,163,5),(3097,0,0,0,'',0,0,0,0,0,0,20,1),(3098,0,0,0,'',0,0,0,0,0,0,20,1),(3099,0,0,0,'',0,0,0,0,0,0,49,1),(3100,0,0,0,'',0,0,0,0,0,0,35,2),(3101,0,0,0,'',0,0,0,0,0,0,30,1),(3102,0,0,0,'',0,0,0,0,0,0,36,1),(3103,0,0,0,'',0,0,0,0,0,0,25,1),(3104,0,0,0,'',0,0,0,0,0,0,25,2),(3105,0,0,0,'',0,0,0,0,0,0,560,31),(3106,0,0,0,'',0,0,0,0,0,0,25,1),(3107,0,0,0,'',0,0,0,0,0,0,48,2),(3108,0,0,0,'',0,0,0,0,0,0,28,1),(3109,0,0,0,'',0,0,0,0,0,0,25,1),(3110,0,0,0,'',0,0,0,0,0,0,25,1),(3111,0,0,0,'',0,0,0,0,0,0,36,1),(3112,0,0,0,'',0,0,0,0,0,0,40,2),(3113,0,0,0,'',0,0,0,0,0,0,25,1),(3114,0,0,0,'',0,0,0,0,0,0,48,5),(3115,0,0,0,'',0,0,0,0,0,0,30,2),(3116,0,0,0,'',0,0,0,0,0,0,35,2),(3117,0,0,0,'',0,0,0,0,0,0,30,1),(3118,0,0,0,'',0,0,0,0,0,0,40,2),(3119,0,0,0,'',0,0,0,0,0,0,40,2),(3120,0,0,0,'',0,0,0,0,0,0,84,3),(3121,0,0,0,'',0,0,0,0,0,0,84,3),(3122,0,0,0,'',0,0,0,0,0,0,54,3),(3123,0,0,0,'',0,0,0,0,0,0,60,3),(3124,0,0,0,'',0,0,0,0,0,0,36,2),(3125,0,0,0,'',0,0,0,0,0,0,30,2),(3126,0,0,0,'',0,0,0,0,0,0,30,2),(3127,0,0,0,'',0,0,0,0,0,0,36,2),(3128,0,0,0,'',0,0,0,0,0,0,30,2),(3129,0,0,0,'',0,0,0,0,0,0,30,2),(3130,0,0,0,'',0,0,0,0,0,0,30,2),(3131,0,0,0,'',0,0,0,0,0,0,30,2),(3132,0,0,0,'',0,0,0,0,0,0,36,2),(3133,0,0,0,'',0,0,0,0,0,0,36,2),(3134,0,0,0,'',0,0,0,0,0,0,30,2),(3135,0,0,0,'',0,0,0,0,0,0,30,2),(3136,0,0,0,'',0,0,0,0,0,0,192,4),(3137,0,0,0,'',0,0,0,0,0,0,200,3),(3138,0,0,0,'',0,0,0,0,0,0,240,4),(3139,0,0,0,'',0,0,0,0,0,0,320,6),(3140,0,0,0,'',0,0,0,0,0,0,858,26),(3141,0,0,0,'',0,0,0,0,0,0,24,2),(3142,0,0,0,'',0,0,0,0,0,0,24,1),(3143,0,0,0,'',0,0,0,0,0,0,36,2),(3144,0,0,0,'',0,0,0,0,0,0,30,2),(3145,0,0,0,'',0,0,0,0,0,0,77,2),(3146,0,0,0,'',0,0,0,0,0,0,486,17),(3147,0,0,0,'',0,0,0,0,0,0,573,17),(3148,0,0,0,'',0,0,0,0,0,0,518,18),(3149,0,0,0,'',0,0,0,0,0,0,600,12),(3150,0,0,0,'',0,0,0,0,0,0,312,10),(3151,0,0,0,'',0,0,0,0,0,0,64,3),(3152,0,0,0,'',0,0,0,0,0,0,56,1),(3153,0,0,0,'',0,0,0,0,0,0,263,4),(3154,0,0,0,'',0,0,0,0,0,0,30,1),(3155,0,0,0,'',0,0,0,0,0,0,25,1),(3156,0,0,0,'',0,0,0,0,0,0,30,1),(3157,0,0,0,'',0,0,0,0,0,0,25,1),(3158,0,0,0,'',0,0,0,0,0,0,118,2),(3159,0,0,0,'',0,0,0,0,0,0,42,1),(3160,0,0,0,'',0,0,0,0,0,0,862,22),(3161,0,0,0,'',0,0,0,0,0,0,42,2),(3162,0,0,0,'',0,0,0,0,0,0,42,2),(3163,0,0,0,'',0,0,0,0,0,0,161,2),(3164,0,0,0,'',0,0,0,0,0,0,30,1),(3165,0,0,0,'',0,0,0,0,0,0,30,1),(3166,0,0,0,'',0,0,0,0,0,0,110,4),(3167,0,0,0,'',0,0,0,0,0,0,996,26),(3168,0,0,0,'',0,0,0,0,0,0,571,15),(3169,0,0,0,'',0,0,0,0,0,0,122,2),(3170,0,0,0,'',0,0,0,0,0,0,402,5),(3171,0,0,0,'',0,0,0,0,0,0,290,10),(3172,0,0,0,'',0,0,0,0,0,0,783,23),(3173,0,0,0,'',0,0,0,0,0,0,1064,21),(3174,0,0,0,'',0,0,0,0,0,0,569,15),(3175,0,0,0,'',0,0,0,0,0,0,396,9),(3176,0,0,0,'',0,0,0,0,0,0,36,1),(3177,0,0,0,'',0,0,0,0,0,0,36,1),(3178,0,0,0,'',0,0,0,0,0,0,66,2),(3179,0,0,0,'',0,0,0,0,0,0,30,1),(3180,0,0,0,'',0,0,0,0,0,0,72,2),(3181,0,0,0,'',0,0,0,0,0,0,30,1),(3182,0,0,0,'',0,0,0,0,0,0,30,1),(3183,0,0,0,'',0,0,0,0,0,0,48,2),(3184,0,0,0,'',0,0,0,0,0,0,72,1),(3185,0,0,0,'',0,0,0,0,0,0,96,2),(3186,0,0,0,'',0,0,0,0,0,0,103,2),(3187,0,0,0,'',0,0,0,0,0,0,57,2),(3188,0,0,0,'',0,0,0,0,0,0,37,2),(3189,0,0,0,'',0,0,0,0,0,0,70,0),(3190,0,0,0,'',0,0,0,0,0,0,60,1),(3191,0,0,0,'',0,0,0,0,0,0,60,1),(3192,0,0,0,'',0,0,0,0,0,0,718,21),(3193,0,0,0,'',0,0,0,0,0,0,40,2),(3194,0,0,0,'',0,0,0,0,0,0,48,2),(3195,0,0,0,'',0,0,0,0,0,0,178,2),(3196,0,0,0,'',0,0,0,0,0,0,81,2),(3197,0,0,0,'',0,0,0,0,0,0,56,2),(3198,0,0,0,'',0,0,0,0,0,0,64,2),(3199,0,0,0,'',0,0,0,0,0,0,749,19),(3200,0,0,0,'',0,0,0,0,0,0,292,10),(3201,0,0,0,'',0,0,0,0,0,0,54,2),(3202,0,0,0,'',0,0,0,0,0,0,60,2),(3203,0,0,0,'',0,0,0,0,0,0,45,2),(3204,0,0,0,'',0,0,0,0,0,0,55,2),(3205,0,0,0,'',0,0,0,0,0,0,83,1),(3206,0,0,0,'',0,0,0,0,0,0,28,2),(3207,0,0,0,'',0,0,0,0,0,0,45,2),(3208,0,0,0,'',0,0,0,0,0,0,24,1),(3209,0,0,0,'',0,0,0,0,0,0,24,1),(3210,0,0,0,'',0,0,0,0,0,0,54,2),(3211,0,0,0,'',0,0,0,0,0,0,35,2),(3212,0,0,0,'',0,0,0,0,0,0,29,2),(3213,0,0,0,'',0,0,0,0,0,0,24,1),(3214,0,0,0,'',0,0,0,0,0,0,24,2),(3215,0,0,0,'',0,0,0,0,0,0,20,1),(3216,0,0,0,'',0,0,0,0,0,0,14,1),(3217,0,0,0,'',0,0,0,0,0,0,25,1),(3218,0,0,0,'',0,0,0,0,0,0,20,1),(3219,0,0,0,'',0,0,0,0,0,0,25,1),(3220,0,0,0,'',0,0,0,0,0,0,35,2),(3221,0,0,0,'',0,0,0,0,0,0,42,2),(3222,0,0,0,'',0,0,0,0,0,0,364,10),(3223,0,0,0,'',0,0,0,0,0,0,96,4),(3224,0,0,0,'',0,0,0,0,0,0,454,8),(3225,0,0,0,'',0,0,0,0,0,0,450,7),(3226,0,0,0,'',0,0,0,0,0,0,145,3),(3227,0,0,0,'',0,0,0,0,0,0,24,1),(3228,0,0,0,'',0,0,0,0,0,0,24,1),(3229,0,0,0,'',0,0,0,0,0,0,18,1),(3230,0,0,0,'',0,0,0,0,0,0,24,1),(3231,0,0,0,'',0,0,0,0,0,0,20,1),(3232,0,0,0,'',0,0,0,0,0,0,20,1),(3233,0,0,0,'',0,0,0,0,0,0,20,1),(3234,0,0,0,'',0,0,0,0,0,0,25,1),(3235,0,0,0,'',0,0,0,0,0,0,35,2),(3236,0,0,0,'',0,0,0,0,0,0,45,2),(3237,0,0,0,'',0,0,0,0,0,0,25,1),(3238,0,0,0,'',0,0,0,0,0,0,32,0),(3239,0,0,0,'',0,0,0,0,0,0,40,0),(3240,0,0,0,'',0,0,0,0,0,0,54,0),(3241,0,0,0,'',0,0,0,0,0,0,31,2),(3242,0,0,0,'',0,0,0,0,0,0,12,1),(3243,0,0,0,'',0,0,0,0,0,0,35,2),(3244,0,0,0,'',0,0,0,0,0,0,31,2),(3245,0,0,0,'',0,0,0,0,0,0,12,1),(3246,0,0,0,'',0,0,0,0,0,0,35,2),(3247,0,0,0,'',0,0,0,0,0,0,95,2),(3248,0,0,0,'',0,0,0,0,0,0,83,2),(3249,0,0,0,'',0,0,0,0,0,0,172,2),(3250,0,0,0,'',0,0,0,0,0,0,94,2),(3251,0,0,0,'',0,0,0,0,0,0,83,2),(3252,0,0,0,'',0,0,0,0,0,0,31,2),(3253,0,0,0,'',0,0,0,0,0,0,36,2),(3254,0,0,0,'',0,0,0,0,0,0,31,2),(3255,0,0,0,'',0,0,0,0,0,0,37,2),(3256,0,0,0,'',0,0,0,0,0,0,41,2),(3257,0,0,0,'',0,0,0,0,0,0,20,1),(3258,0,0,0,'',0,0,0,0,0,0,15,1),(3259,0,0,0,'',0,0,0,0,0,0,20,1),(3260,0,0,0,'',0,0,0,0,0,0,20,1),(3261,0,0,0,'',0,0,0,0,0,0,20,1),(3262,0,0,0,'',0,0,0,0,0,0,19,1),(3263,0,0,0,'',0,0,0,0,0,0,20,1),(3264,0,0,0,'',0,0,0,0,0,0,17,1),(3265,0,0,0,'',0,0,0,0,0,0,19,1),(3266,0,0,0,'',0,0,0,0,0,0,20,1),(3267,0,0,0,'',0,0,0,0,0,0,23,1),(3268,0,0,0,'',0,0,0,0,0,0,15,1),(3269,0,0,0,'',0,0,0,0,0,0,50,2),(3270,0,0,0,'',0,0,0,0,0,0,49,3),(3271,0,0,0,'',0,0,0,0,0,0,20,0),(3272,0,0,0,'',0,0,0,0,0,0,20,0),(3273,0,0,0,'',0,0,0,0,0,0,20,0),(3274,0,0,0,'',0,0,0,0,0,0,53,2),(3275,0,0,0,'',0,0,0,0,0,0,48,2),(3276,0,0,0,'',0,0,0,0,0,0,64,2),(3277,0,0,0,'',0,0,0,0,0,0,48,2),(3278,0,0,0,'',0,0,0,0,0,0,42,2),(3279,0,0,0,'',0,0,0,0,0,0,42,2),(3280,0,0,0,'',0,0,0,0,0,0,42,2),(3281,0,0,0,'',0,0,0,0,0,0,522,16),(3282,0,0,0,'',0,0,0,0,0,0,30,1),(3283,0,0,0,'',0,0,0,0,0,0,20,1),(3284,0,0,0,'',0,0,0,0,0,0,20,1),(3285,0,0,0,'',0,0,0,0,0,0,20,1),(3286,0,0,0,'',0,0,0,0,0,0,20,1),(3287,0,0,0,'',0,0,0,0,0,0,20,1),(3288,0,0,0,'',0,0,0,0,0,0,24,1),(3289,0,0,0,'',0,0,0,0,0,0,24,1),(3290,0,0,0,'',0,0,0,0,0,0,24,1),(3291,0,0,0,'',0,0,0,0,0,0,67,1),(3292,0,0,0,'',0,0,0,0,0,0,70,1),(3293,0,0,0,'',0,0,0,0,0,0,67,1),(3294,0,0,0,'',0,0,0,0,0,0,28,1),(3295,0,0,0,'',0,0,0,0,0,0,42,1),(3296,0,0,0,'',0,0,0,0,0,0,36,1),(3297,0,0,0,'',0,0,0,0,0,0,30,1),(3298,0,0,0,'',0,0,0,0,0,0,30,1),(3299,0,0,0,'',0,0,0,0,0,0,25,1),(3300,0,0,0,'',0,0,0,0,0,0,30,1),(3301,0,0,0,'',0,0,0,0,0,0,30,1),(3302,0,0,0,'',0,0,0,0,0,0,30,1),(3303,0,0,0,'',0,0,0,0,0,0,30,1),(3304,0,0,0,'',0,0,0,0,0,0,30,1),(3305,0,0,0,'',0,0,0,0,0,0,25,1),(3306,0,0,0,'',0,0,0,0,0,0,30,1),(3307,0,0,0,'',0,0,0,0,0,0,25,1),(3308,0,0,0,'',0,0,0,0,0,0,36,2),(3309,0,0,0,'',0,0,0,0,0,0,30,1),(3310,0,0,0,'',0,0,0,0,0,0,112,3),(3311,0,0,0,'',0,0,0,0,0,0,56,2),(3312,0,0,0,'',0,0,0,0,0,0,56,2),(3313,0,0,0,'',0,0,0,0,0,0,64,2),(3314,0,0,0,'',0,0,0,0,0,0,61,2),(3315,0,0,0,'',0,0,0,0,0,0,48,2),(3316,0,0,0,'',0,0,0,0,0,0,48,2),(3317,0,0,0,'',0,0,0,0,0,0,20,1),(3318,0,0,0,'',0,0,0,0,0,0,28,2),(3319,0,0,0,'',0,0,0,0,0,0,20,1),(3320,0,0,0,'',0,0,0,0,0,0,20,1),(3321,0,0,0,'',0,0,0,0,0,0,20,1),(3322,0,0,0,'',0,0,0,0,0,0,20,1),(3323,0,0,0,'',0,0,0,0,0,0,20,1),(3324,0,0,0,'',0,0,0,0,0,0,20,1),(3325,0,0,0,'',0,0,0,0,0,0,25,1),(3326,0,0,0,'',0,0,0,0,0,0,25,1),(3327,0,0,0,'',0,0,0,0,0,0,25,1),(3328,0,0,0,'',0,0,0,0,0,0,25,1),(3329,0,0,0,'',0,0,0,0,0,0,20,1),(3330,0,0,0,'',0,0,0,0,0,0,20,1),(3331,0,0,0,'',0,0,0,0,0,0,20,1),(3332,0,0,0,'',0,0,0,0,0,0,20,1),(3333,0,0,0,'',0,0,0,0,0,0,25,1),(3334,0,0,0,'',0,0,0,0,0,0,40,2),(3335,0,0,0,'',0,0,0,0,0,0,20,1),(3336,0,0,0,'',0,0,0,0,0,0,25,1),(3337,0,0,0,'',0,0,0,0,0,0,20,1),(3338,0,0,0,'',0,0,0,0,0,0,20,1),(3339,0,0,0,'',0,0,0,0,0,0,20,1),(3340,0,0,0,'',0,0,0,0,0,0,20,1),(3341,0,0,0,'',0,0,0,0,0,0,119,2),(3342,0,0,0,'',0,0,0,0,0,0,109,2),(3343,0,0,0,'',0,0,0,0,0,0,147,5),(3344,0,0,0,'',0,0,0,0,0,0,147,5),(3345,0,0,0,'',0,0,0,0,0,0,161,5),(3346,0,0,0,'',0,0,0,0,0,0,182,2),(3347,0,0,0,'',0,0,0,0,0,0,161,2),(3348,0,0,0,'',0,0,0,0,0,0,166,2),(3349,0,0,0,'',0,0,0,0,0,0,42,2),(3350,0,0,0,'',0,0,0,0,0,0,44,2),(3351,0,0,0,'',0,0,0,0,0,0,666,23),(3352,0,0,0,'',0,0,0,0,0,0,672,14),(3353,0,0,0,'',0,0,0,0,0,0,564,18),(3354,0,0,0,'',0,0,0,0,0,0,196,6),(3355,0,0,0,'',0,0,0,0,0,0,56,2),(3356,0,0,0,'',0,0,0,0,0,0,56,2),(3357,0,0,0,'',0,0,0,0,0,0,64,2),(3358,0,0,0,'',0,0,0,0,0,0,253,6),(3359,0,0,0,'',0,0,0,0,0,0,198,3),(3360,0,0,0,'',0,0,0,0,0,0,191,3),(3361,0,0,0,'',0,0,0,0,0,0,56,2),(3362,0,0,0,'',0,0,0,0,0,0,56,2),(3363,0,0,0,'',0,0,0,0,0,0,64,3),(3364,0,0,0,'',0,0,0,0,0,0,64,2),(3365,0,0,0,'',0,0,0,0,0,0,56,2),(3366,0,0,0,'',0,0,0,0,0,0,56,2),(3367,0,0,0,'',0,0,0,0,0,0,56,2),(3368,0,0,0,'',0,0,0,0,0,0,64,2),(3369,0,0,0,'',0,0,0,0,0,0,56,2),(3370,0,0,0,'',0,0,0,0,0,0,49,2),(3371,0,0,0,'',0,0,0,0,0,0,64,2),(3372,0,0,0,'',0,0,0,0,0,0,414,14),(3373,0,0,0,'',0,0,0,0,0,0,57,3),(3374,0,0,0,'',0,0,0,0,0,0,55,2),(3375,0,0,0,'',0,0,0,0,0,0,55,1),(3376,0,0,0,'',0,0,0,0,0,0,55,2),(3377,0,0,0,'',0,0,0,0,0,0,55,1),(3378,0,0,0,'',0,0,0,0,0,0,48,1),(3379,0,0,0,'',0,0,0,0,0,0,74,2),(3380,0,0,0,'',0,0,0,0,0,0,20,1),(3381,0,0,0,'',0,0,0,0,0,0,25,1),(3382,0,0,0,'',0,0,0,0,0,0,20,1),(3383,0,0,0,'',0,0,0,0,0,0,20,1),(3384,0,0,0,'',0,0,0,0,0,0,20,1),(3385,0,0,0,'',0,0,0,0,0,0,30,2),(3386,0,0,0,'',0,0,0,0,0,0,35,2),(3387,0,0,0,'',0,0,0,0,0,0,35,2),(3388,0,0,0,'',0,0,0,0,0,0,20,1),(3389,0,0,0,'',0,0,0,0,0,0,20,1),(3390,0,0,0,'',0,0,0,0,0,0,20,1),(3391,0,0,0,'',0,0,0,0,0,0,20,1),(3392,0,0,0,'',0,0,0,0,0,0,35,1),(3393,0,0,0,'',0,0,0,0,0,0,36,1),(3394,0,0,0,'',0,0,0,0,0,0,42,2),(3395,0,0,0,'',0,0,0,0,0,0,55,2),(3396,0,0,0,'',0,0,0,0,0,0,56,2),(3397,0,0,0,'',0,0,0,0,0,0,49,2),(3398,0,0,0,'',0,0,0,0,0,0,36,1),(3399,0,0,0,'',0,0,0,0,0,0,36,1),(3400,0,0,0,'',0,0,0,0,0,0,345,9),(3401,0,0,0,'',0,0,0,0,0,0,49,2),(3402,0,0,0,'',0,0,0,0,0,0,145,3),(3403,0,0,0,'',0,0,0,0,0,0,20,1),(3404,0,0,0,'',0,0,0,0,0,0,20,1),(3405,0,0,0,'',0,0,0,0,0,0,30,2),(3406,0,0,0,'',0,0,0,0,0,0,20,1),(3407,0,0,0,'',0,0,0,0,0,0,20,1),(3408,0,0,0,'',0,0,0,0,0,0,30,2),(3409,0,0,0,'',0,0,0,0,0,0,30,2),(3410,0,0,0,'',0,0,0,0,0,0,35,2),(3411,0,0,0,'',0,0,0,0,0,0,20,1),(3412,0,0,0,'',0,0,0,0,0,0,20,1),(3413,0,0,0,'',0,0,0,0,0,0,20,1),(3414,0,0,0,'',0,0,0,0,0,0,20,1),(3415,0,0,0,'',0,0,0,0,0,0,72,2),(3416,0,0,0,'',0,0,0,0,0,0,761,19),(3417,0,0,0,'',0,0,0,0,0,0,63,2),(3418,0,0,0,'',0,0,0,0,0,0,167,3),(3419,0,0,0,'',0,0,0,0,0,0,84,2),(3420,0,0,0,'',0,0,0,0,0,0,84,2),(3421,0,0,0,'',0,0,0,0,0,0,113,2),(3422,0,0,0,'',0,0,0,0,0,0,88,2),(3423,0,0,0,'',0,0,0,0,0,0,48,2),(3424,0,0,0,'',0,0,0,0,0,0,48,2),(3425,0,0,0,'',0,0,0,0,0,0,88,2),(3426,0,0,0,'',0,0,0,0,0,0,140,3),(3427,0,0,0,'',0,0,0,0,0,0,72,2),(3428,0,0,0,'',0,0,0,0,0,0,127,2),(3429,0,0,0,'',0,0,0,0,0,0,300,4),(3430,0,0,0,'',0,0,0,0,0,0,565,18),(3431,0,0,0,'',0,0,0,0,0,0,702,16),(3432,0,0,0,'',0,0,0,0,0,0,508,9),(3433,0,0,0,'',0,0,0,0,0,0,405,10),(3434,0,0,0,'',0,0,0,0,0,0,842,18),(3435,0,0,0,'',0,0,0,0,0,0,597,20),(3436,0,0,0,'',0,0,0,0,0,0,750,18),(3437,0,0,0,'',0,0,0,0,0,0,346,15),(3438,0,0,0,'',0,0,0,0,0,0,184,3),(3439,0,0,0,'',0,0,0,0,0,0,80,2),(3440,0,0,0,'',0,0,0,0,0,0,114,2),(3441,0,0,0,'',0,0,0,0,0,0,171,3),(3442,0,0,0,'',0,0,0,0,0,0,90,2),(3443,0,0,0,'',0,0,0,0,0,0,85,2),(3444,0,0,0,'',0,0,0,0,0,0,444,16),(3445,0,0,0,'',0,0,0,0,0,0,20,1),(3446,0,0,0,'',0,0,0,0,0,0,19,1),(3447,0,0,0,'',0,0,0,0,0,0,16,1),(3448,0,0,0,'',0,0,0,0,0,0,16,1),(3449,0,0,0,'',0,0,0,0,0,0,52,2),(3450,0,0,0,'',0,0,0,0,0,0,12,1),(3451,0,0,0,'',0,0,0,0,0,0,27,2),(3452,0,0,0,'',0,0,0,0,0,0,9,1),(3453,0,0,0,'',0,0,0,0,0,0,9,1),(3454,0,0,0,'',0,0,0,0,0,0,9,1),(3455,0,0,0,'',0,0,0,0,0,0,27,2),(3456,0,0,0,'',0,0,0,0,0,0,12,1),(3457,0,0,0,'',0,0,0,0,0,0,9,1),(3458,0,0,0,'',0,0,0,0,0,0,9,1),(3459,0,0,0,'',0,0,0,0,0,0,9,1),(3460,0,0,0,'',0,0,0,0,0,0,7,0),(3461,0,0,0,'',0,0,0,0,0,0,7,0),(3462,0,0,0,'',0,0,0,0,0,0,16,0),(3463,0,0,0,'',0,0,0,0,0,0,60,1),(3464,0,0,0,'',0,0,0,0,0,0,435,3),(3465,0,0,0,'',0,0,0,0,0,0,13,1),(3466,0,0,0,'',0,0,0,0,0,0,13,1),(3467,0,0,0,'',0,0,0,0,0,0,14,1),(3468,0,0,0,'',0,0,0,0,0,0,12,1),(3469,0,0,0,'',0,0,0,0,0,0,12,1),(3470,0,0,0,'',0,0,0,0,0,0,12,1),(3471,0,0,0,'',0,0,0,0,0,0,13,1),(3472,0,0,0,'',0,0,0,0,0,0,13,1),(3473,0,0,0,'',0,0,0,0,0,0,13,1),(3474,0,0,0,'',0,0,0,0,0,0,14,1),(3475,0,0,0,'',0,0,0,0,0,0,12,1),(3476,0,0,0,'',0,0,0,0,0,0,760,5),(3477,0,0,0,'',0,0,0,0,0,0,356,5),(3478,0,0,0,'',0,0,0,0,0,0,218,6),(3479,0,0,0,'',0,0,0,0,0,0,17,1),(3480,0,0,0,'',0,0,0,0,0,0,16,1),(3481,0,0,0,'',0,0,0,0,0,0,17,1),(3482,0,0,0,'',0,0,0,0,0,0,16,1),(3483,0,0,0,'',0,0,0,0,0,0,17,1),(3484,0,0,0,'',0,0,0,0,0,0,15,1),(3485,0,0,0,'',0,0,0,0,0,0,17,1),(3486,0,0,0,'',0,0,0,0,0,0,16,1),(3487,0,0,0,'',0,0,0,0,0,0,17,1),(3488,0,0,0,'',0,0,0,0,0,0,16,1),(3489,0,0,0,'',0,0,0,0,0,0,17,1),(3490,0,0,0,'',0,0,0,0,0,0,16,1),(3491,0,0,0,'',0,0,0,0,0,0,17,1),(3492,0,0,0,'',0,0,0,0,0,0,16,1),(3493,0,0,0,'',0,0,0,0,0,0,17,1),(3494,0,0,0,'',0,0,0,0,0,0,16,1),(3495,0,0,0,'',0,0,0,0,0,0,17,1),(3496,0,0,0,'',0,0,0,0,0,0,16,1),(3497,0,0,0,'',0,0,0,0,0,0,17,1),(3498,0,0,0,'',0,0,0,0,0,0,16,1),(3499,0,0,0,'',0,0,0,0,0,0,17,1),(3500,0,0,0,'',0,0,0,0,0,0,16,1),(3501,0,0,0,'',0,0,0,0,0,0,17,1),(3502,0,0,0,'',0,0,0,0,0,0,16,1),(3503,0,0,0,'',0,0,0,0,0,0,36,2),(3504,0,0,0,'',0,0,0,0,0,0,40,3),(3505,0,0,0,'',0,0,0,0,0,0,39,3),(3506,0,0,0,'',0,0,0,0,0,0,183,3),(3507,0,0,0,'',0,0,0,0,0,0,233,4),(3508,0,0,0,'',0,0,0,0,0,0,621,7),(3509,0,0,0,'',0,0,0,0,0,0,92,4),(3510,0,0,0,'',0,0,0,0,0,0,854,6),(3511,0,0,0,'',0,0,0,0,0,0,295,4),(3512,0,0,0,'',0,0,0,0,0,0,223,4),(3513,0,0,0,'',0,0,0,0,0,0,294,4),(3514,0,0,0,'',0,0,0,0,0,0,126,3),(3515,0,0,0,'',0,0,0,0,0,0,159,3),(3516,0,0,0,'',0,0,0,0,0,0,245,4),(3517,0,0,0,'',0,0,0,0,0,0,222,4),(3518,0,0,0,'',0,0,0,0,0,0,1181,15),(3519,0,0,0,'',0,0,0,0,0,0,242,5),(3520,0,0,0,'',0,0,0,0,0,0,646,13),(3521,0,0,0,'',0,0,0,0,0,0,228,3),(3522,0,0,0,'',0,0,0,0,0,0,95,2),(3523,0,0,0,'',0,0,0,0,0,0,99,2),(3524,0,0,0,'',0,0,0,0,0,0,176,3),(3525,0,0,0,'',0,0,0,0,0,0,402,7),(3526,0,0,0,'',0,0,0,0,0,0,173,2),(3527,0,0,0,'',0,0,0,0,0,0,193,2),(3528,0,0,0,'',0,0,0,0,0,0,193,3),(3529,0,0,0,'',0,0,0,0,0,0,36,1),(3530,0,0,0,'',0,0,0,0,0,0,529,14);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_bans`
--

DROP TABLE IF EXISTS `ip_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_bans` (
  `ip` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`ip`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_bans`
--

LOCK TABLES `ip_bans` WRITE;
/*!40000 ALTER TABLE `ip_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `account_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `code_date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (2,'4fk81d9ifs29gxyf1ziz',1511455577),(2,'lt24v13q86zftfkkamjs',1511455706),(2,'hnknh81ndvdl4zljtgta',1511455834),(2,'qtoo8izrxokmoeb7hvue',1511456604),(2,'lxwvn23vewy6ygxjijbe',1511456697),(2,'obtz6n9ogbd1wsn6xhjv',1511457088),(2,'b398t3bz2yor7z64rhcm',1511457123),(2,'izgvqkx4raxheb6d7afk',1511457136),(2,'alblovs4x5itfsb68nbf',1511457351),(2,'egis4rq22856h3wg7ibo',1511457607),(2,'65lumrid6mlfzac9n1ek',1511469083),(2,'7btltu7gt31w4z7gx3aa',1511469112),(2,'sobo1mcf5a4afv5vo3j9',1511470343),(2,'nkj7st8j3gukrhsg3ryn',1511470604),(2,'a928tdbc93dynfg12hun',1511470634),(2,'c3zuzbnqajgmk98iugyw',1511478372),(2,'roknvek3tmwu61ob9s91',1511478912);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_casts`
--

DROP TABLE IF EXISTS `live_casts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT '0',
  `version` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`),
  CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_casts`
--

LOCK TABLES `live_casts` WRITE;
/*!40000 ALTER TABLE `live_casts` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_casts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_history`
--

DROP TABLE IF EXISTS `market_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `expires_at` bigint(20) unsigned NOT NULL,
  `inserted` bigint(20) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`,`sale`),
  CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_history`
--

LOCK TABLES `market_history` WRITE;
/*!40000 ALTER TABLE `market_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_offers`
--

DROP TABLE IF EXISTS `market_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sale` (`sale`,`itemtype`),
  KEY `created` (`created`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_offers`
--

LOCK TABLES `market_offers` WRITE;
/*!40000 ALTER TABLE `market_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsticker`
--

DROP TABLE IF EXISTS `newsticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsticker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsticker`
--

LOCK TABLES `newsticker` WRITE;
/*!40000 ALTER TABLE `newsticker` DISABLE KEYS */;
INSERT INTO `newsticker` VALUES (2,1492017311,'<b>[FIX]</b> <font color=\"green\"><b>Desert Quest</b></font> reward.','newsicon_technical'),(3,1492341184,'<b>[FIX]</b> Stamina ao sair do Trainer.','newsicon_technical'),(6,1530642688,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','newsicon_technical');
/*!40000 ALTER TABLE `newsticker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagseguro`
--

DROP TABLE IF EXISTS `pagseguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagseguro` (
  `date` datetime NOT NULL,
  `code` varchar(50) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lastEventDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagseguro`
--

LOCK TABLES `pagseguro` WRITE;
/*!40000 ALTER TABLE `pagseguro` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagseguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagseguro_transactions`
--

DROP TABLE IF EXISTS `pagseguro_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `status` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `payment_amount` float DEFAULT '0',
  UNIQUE KEY `transaction_code` (`transaction_code`,`status`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagseguro_transactions`
--

LOCK TABLES `pagseguro_transactions` WRITE;
/*!40000 ALTER TABLE `pagseguro_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagseguro_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagsegurotransacoes`
--

DROP TABLE IF EXISTS `pagsegurotransacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  KEY `Referencia` (`Referencia`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagsegurotransacoes`
--

LOCK TABLES `pagsegurotransacoes` WRITE;
/*!40000 ALTER TABLE `pagsegurotransacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagsegurotransacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_transactions`
--

DROP TABLE IF EXISTS `paypal_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(70) NOT NULL DEFAULT '',
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `payer_id` varchar(255) NOT NULL DEFAULT '',
  `item_number1` varchar(255) NOT NULL DEFAULT '',
  `mc_gross` float NOT NULL,
  `mc_currency` varchar(5) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_transactions`
--

LOCK TABLES `paypal_transactions` WRITE;
/*!40000 ALTER TABLE `paypal_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_deaths`
--

DROP TABLE IF EXISTS `player_deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`),
  KEY `killed_by` (`killed_by`),
  KEY `mostdamage_by` (`mostdamage_by`),
  CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_deaths`
--

LOCK TABLES `player_deaths` WRITE;
/*!40000 ALTER TABLE `player_deaths` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_depotitems`
--

DROP TABLE IF EXISTS `player_depotitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_depotitems`
--

LOCK TABLES `player_depotitems` WRITE;
/*!40000 ALTER TABLE `player_depotitems` DISABLE KEYS */;
INSERT INTO `player_depotitems` VALUES (6,101,1,2365,1,''),(6,102,101,2365,1,''),(6,103,101,2365,1,''),(6,104,101,2365,1,''),(6,105,101,2365,1,''),(6,106,101,2365,1,''),(6,107,101,2365,1,''),(6,108,101,2365,1,''),(6,109,101,2365,1,''),(6,110,101,2365,1,''),(6,111,101,2365,1,''),(6,112,101,2365,1,''),(6,113,101,2365,1,''),(6,114,101,2365,1,''),(6,115,101,2365,1,''),(6,116,101,2365,1,''),(6,117,101,2365,1,''),(6,118,101,2365,1,''),(6,119,101,2365,1,''),(6,120,101,2365,1,''),(6,121,101,2365,1,''),(6,122,101,2365,1,''),(6,123,101,2365,1,''),(6,124,101,2365,1,''),(6,125,101,2365,1,''),(6,126,102,2365,1,''),(6,127,102,2365,1,''),(6,128,102,2365,1,''),(6,129,102,2365,1,''),(6,130,102,2365,1,''),(6,131,102,2365,1,''),(6,132,102,2365,1,''),(6,133,102,2365,1,''),(6,134,102,2365,1,''),(6,135,102,2365,1,''),(6,136,102,2365,1,''),(6,137,102,2365,1,''),(6,138,102,2365,1,''),(6,139,102,2365,1,''),(6,140,102,2365,1,''),(6,141,102,2365,1,''),(6,142,102,2365,1,''),(6,143,102,2365,1,''),(6,144,102,2365,1,''),(6,145,102,2365,1,''),(6,146,102,2365,1,''),(6,147,102,2365,1,''),(6,148,102,2365,1,''),(6,149,102,2365,1,''),(6,150,103,2365,1,''),(6,151,103,2365,1,''),(6,152,103,2365,1,''),(6,153,103,2365,1,''),(6,154,103,2365,1,''),(6,155,103,2365,1,''),(6,156,103,2365,1,''),(6,157,103,2365,1,''),(6,158,103,2365,1,''),(6,159,103,2365,1,''),(6,160,103,2365,1,''),(6,161,103,2365,1,''),(6,162,103,2365,1,''),(6,163,103,2365,1,''),(6,164,103,2365,1,''),(6,165,103,2365,1,''),(6,166,103,2365,1,''),(6,167,103,2365,1,''),(6,168,103,2365,1,''),(6,169,103,2365,1,''),(6,170,103,2365,1,''),(6,171,103,2365,1,''),(6,172,103,2365,1,''),(6,173,103,2365,1,''),(6,174,104,2365,1,''),(6,175,104,2365,1,''),(6,176,104,2365,1,''),(6,177,104,2365,1,''),(6,178,104,2365,1,''),(6,179,104,2365,1,''),(6,180,104,2365,1,''),(6,181,104,2365,1,''),(6,182,104,2365,1,''),(6,183,104,2365,1,''),(6,184,104,2365,1,''),(6,185,104,2365,1,''),(6,186,104,2365,1,''),(6,187,104,2365,1,''),(6,188,104,2365,1,''),(6,189,104,2365,1,''),(6,190,104,2365,1,''),(6,191,104,2365,1,''),(6,192,104,2365,1,''),(6,193,104,2365,1,''),(6,194,104,2365,1,''),(6,195,104,2365,1,''),(6,196,104,2365,1,''),(6,197,104,2365,1,''),(6,198,105,2365,1,''),(6,199,105,2365,1,''),(6,200,105,2365,1,''),(6,201,105,2365,1,''),(6,202,105,2365,1,''),(6,203,105,2365,1,''),(6,204,105,2365,1,''),(6,205,105,2365,1,''),(6,206,105,2365,1,''),(6,207,105,2365,1,''),(6,208,105,2365,1,''),(6,209,105,2365,1,''),(6,210,105,2365,1,''),(6,211,105,2365,1,''),(6,212,105,2365,1,''),(6,213,105,2365,1,''),(6,214,105,2365,1,''),(6,215,105,2365,1,''),(6,216,105,2365,1,''),(6,217,105,2365,1,''),(6,218,105,2365,1,''),(6,219,105,2365,1,''),(6,220,105,2365,1,''),(6,221,105,2365,1,''),(6,222,106,2365,1,''),(6,223,106,2365,1,''),(6,224,106,2365,1,''),(6,225,106,2365,1,''),(6,226,106,2365,1,''),(6,227,106,2365,1,''),(6,228,106,2365,1,''),(6,229,106,2365,1,''),(6,230,106,2365,1,''),(6,231,106,2365,1,''),(6,232,106,2365,1,''),(6,233,106,2365,1,''),(6,234,106,2365,1,''),(6,235,106,2365,1,''),(6,236,106,2365,1,''),(6,237,106,2365,1,''),(6,238,106,2365,1,''),(6,239,106,2365,1,''),(6,240,106,2365,1,''),(6,241,106,2365,1,''),(6,242,106,2365,1,''),(6,243,106,2365,1,''),(6,244,106,2365,1,''),(6,245,106,2365,1,''),(6,246,107,2365,1,''),(6,247,107,2365,1,''),(6,248,107,2365,1,''),(6,249,107,2365,1,''),(6,250,107,2365,1,''),(6,251,107,2365,1,''),(6,252,107,2365,1,''),(6,253,107,2365,1,''),(6,254,107,2365,1,''),(6,255,107,2365,1,''),(6,256,107,2365,1,''),(6,257,107,2365,1,''),(6,258,107,2365,1,''),(6,259,107,2365,1,''),(6,260,107,2365,1,''),(6,261,107,2365,1,''),(6,262,107,2365,1,''),(6,263,107,2365,1,''),(6,264,107,2365,1,''),(6,265,107,2365,1,''),(6,266,107,2365,1,''),(6,267,107,2365,1,''),(6,268,107,2365,1,''),(6,269,107,2365,1,''),(6,270,108,2365,1,''),(6,271,108,2365,1,''),(6,272,108,2365,1,''),(6,273,108,2365,1,''),(6,274,108,2365,1,''),(6,275,108,2365,1,''),(6,276,108,2365,1,''),(6,277,108,2365,1,''),(6,278,108,2365,1,''),(6,279,108,2365,1,''),(6,280,108,2365,1,''),(6,281,108,2365,1,''),(6,282,108,2365,1,''),(6,283,108,2365,1,''),(6,284,108,2365,1,''),(6,285,108,2365,1,''),(6,286,108,2365,1,''),(6,287,108,2365,1,''),(6,288,108,2365,1,''),(6,289,108,2365,1,''),(6,290,108,2365,1,''),(6,291,108,2365,1,''),(6,292,108,2365,1,''),(6,293,108,2365,1,''),(6,294,109,2365,1,''),(6,295,109,2365,1,''),(6,296,109,2365,1,''),(6,297,109,2365,1,''),(6,298,109,2365,1,''),(6,299,109,2365,1,''),(6,300,109,2365,1,''),(6,301,109,2365,1,''),(6,302,109,2365,1,''),(6,303,109,2365,1,''),(6,304,109,2365,1,''),(6,305,109,2365,1,''),(6,306,109,2365,1,''),(6,307,109,2365,1,''),(6,308,109,2365,1,''),(6,309,109,2365,1,''),(6,310,109,2365,1,''),(6,311,109,2365,1,''),(6,312,109,2365,1,''),(6,313,109,2365,1,''),(6,314,109,2365,1,''),(6,315,109,2365,1,''),(6,316,109,2365,1,''),(6,317,109,2365,1,''),(6,318,110,2365,1,''),(6,319,110,2365,1,''),(6,320,110,2365,1,''),(6,321,110,2365,1,''),(6,322,110,2365,1,''),(6,323,110,2365,1,''),(6,324,110,2365,1,''),(6,325,110,2365,1,''),(6,326,110,2365,1,''),(6,327,110,2365,1,''),(6,328,110,2365,1,''),(6,329,110,2365,1,''),(6,330,110,2365,1,''),(6,331,110,2365,1,''),(6,332,110,2365,1,''),(6,333,110,2365,1,''),(6,334,110,2365,1,''),(6,335,110,2365,1,''),(6,336,110,2365,1,''),(6,337,110,2365,1,''),(6,338,110,2365,1,''),(6,339,110,2365,1,''),(6,340,110,2365,1,''),(6,341,110,2365,1,''),(6,342,111,2365,1,''),(6,343,111,2365,1,''),(6,344,111,2365,1,''),(6,345,111,2365,1,''),(6,346,111,2365,1,''),(6,347,111,2365,1,''),(6,348,111,2365,1,''),(6,349,111,2365,1,''),(6,350,111,2365,1,''),(6,351,111,2365,1,''),(6,352,111,2365,1,''),(6,353,111,2365,1,''),(6,354,111,2365,1,''),(6,355,111,2365,1,''),(6,356,111,2365,1,''),(6,357,111,2365,1,''),(6,358,111,2365,1,''),(6,359,111,2365,1,''),(6,360,111,2365,1,''),(6,361,111,2365,1,''),(6,362,111,2365,1,''),(6,363,111,2365,1,''),(6,364,111,2365,1,''),(6,365,111,2365,1,''),(6,366,112,2365,1,''),(6,367,112,2365,1,''),(6,368,112,2365,1,''),(6,369,112,2365,1,''),(6,370,112,2365,1,''),(6,371,112,2365,1,''),(6,372,112,2365,1,''),(6,373,112,2365,1,''),(6,374,112,2365,1,''),(6,375,112,2365,1,''),(6,376,112,2365,1,''),(6,377,112,2365,1,''),(6,378,112,2365,1,''),(6,379,112,2365,1,''),(6,380,112,2365,1,''),(6,381,112,2365,1,''),(6,382,112,2365,1,''),(6,383,112,2365,1,''),(6,384,112,2365,1,''),(6,385,112,2365,1,''),(6,386,112,2365,1,''),(6,387,112,2365,1,''),(6,388,112,2365,1,''),(6,389,112,2365,1,''),(6,390,113,2365,1,''),(6,391,113,2365,1,''),(6,392,113,2365,1,''),(6,393,113,2365,1,''),(6,394,113,2365,1,''),(6,395,113,2365,1,''),(6,396,113,2365,1,''),(6,397,113,2365,1,''),(6,398,113,2365,1,''),(6,399,113,2365,1,''),(6,400,113,2365,1,''),(6,401,113,2365,1,''),(6,402,113,2365,1,''),(6,403,113,2365,1,''),(6,404,113,2365,1,''),(6,405,113,2365,1,''),(6,406,113,2365,1,''),(6,407,113,2365,1,''),(6,408,113,2365,1,''),(6,409,113,2365,1,''),(6,410,113,2365,1,''),(6,411,113,2365,1,''),(6,412,113,2365,1,''),(6,413,113,2365,1,''),(6,414,114,2365,1,''),(6,415,114,2365,1,''),(6,416,114,2365,1,''),(6,417,114,2365,1,''),(6,418,114,2365,1,''),(6,419,114,2365,1,''),(6,420,114,2365,1,''),(6,421,114,2365,1,''),(6,422,114,2365,1,''),(6,423,114,2365,1,''),(6,424,114,2365,1,''),(6,425,114,2365,1,''),(6,426,114,2365,1,''),(6,427,114,2365,1,''),(6,428,114,2365,1,''),(6,429,114,2365,1,''),(6,430,114,2365,1,''),(6,431,114,2365,1,''),(6,432,114,2365,1,''),(6,433,114,2365,1,''),(6,434,114,2365,1,''),(6,435,114,2365,1,''),(6,436,114,2365,1,''),(6,437,114,2365,1,''),(6,438,115,2365,1,''),(6,439,115,2365,1,''),(6,440,115,2365,1,''),(6,441,115,2365,1,''),(6,442,115,2365,1,''),(6,443,115,2365,1,''),(6,444,115,2365,1,''),(6,445,115,2365,1,''),(6,446,115,2365,1,''),(6,447,115,2365,1,''),(6,448,115,2365,1,''),(6,449,115,2365,1,''),(6,450,115,2365,1,''),(6,451,115,2365,1,''),(6,452,115,2365,1,''),(6,453,115,2365,1,''),(6,454,115,2365,1,''),(6,455,115,2365,1,''),(6,456,115,2365,1,''),(6,457,115,2365,1,''),(6,458,115,2365,1,''),(6,459,115,2365,1,''),(6,460,115,2365,1,''),(6,461,115,2365,1,''),(6,462,116,2365,1,''),(6,463,116,2365,1,''),(6,464,116,2365,1,''),(6,465,116,2365,1,''),(6,466,116,2365,1,''),(6,467,116,2365,1,''),(6,468,116,2365,1,''),(6,469,116,2365,1,''),(6,470,116,2365,1,''),(6,471,116,2365,1,''),(6,472,116,2365,1,''),(6,473,116,2365,1,''),(6,474,116,2365,1,''),(6,475,116,2365,1,''),(6,476,116,2365,1,''),(6,477,116,2365,1,''),(6,478,116,2365,1,''),(6,479,116,2365,1,''),(6,480,116,2365,1,''),(6,481,116,2365,1,''),(6,482,116,2365,1,''),(6,483,116,2365,1,''),(6,484,116,2365,1,''),(6,485,116,2365,1,''),(6,486,117,2365,1,''),(6,487,117,2365,1,''),(6,488,117,2365,1,''),(6,489,117,2365,1,''),(6,490,117,2365,1,''),(6,491,117,2365,1,''),(6,492,117,2365,1,''),(6,493,117,2365,1,''),(6,494,117,2365,1,''),(6,495,117,2365,1,''),(6,496,117,2365,1,''),(6,497,117,2365,1,''),(6,498,117,2365,1,''),(6,499,117,2365,1,''),(6,500,117,2365,1,''),(6,501,117,2365,1,''),(6,502,117,2365,1,''),(6,503,117,2365,1,''),(6,504,117,2365,1,''),(6,505,117,2365,1,''),(6,506,117,2365,1,''),(6,507,117,2365,1,''),(6,508,117,2365,1,''),(6,509,117,2365,1,''),(6,510,118,2365,1,''),(6,511,118,2365,1,''),(6,512,118,2365,1,''),(6,513,118,2365,1,''),(6,514,118,2365,1,''),(6,515,118,2365,1,''),(6,516,118,2365,1,''),(6,517,118,2365,1,''),(6,518,118,2365,1,''),(6,519,118,2365,1,''),(6,520,118,2365,1,''),(6,521,118,2365,1,''),(6,522,118,2365,1,''),(6,523,118,2365,1,''),(6,524,118,2365,1,''),(6,525,118,2365,1,''),(6,526,118,2365,1,''),(6,527,118,2365,1,''),(6,528,118,2365,1,''),(6,529,118,2365,1,''),(6,530,118,2365,1,''),(6,531,118,2365,1,''),(6,532,118,2365,1,''),(6,533,118,2365,1,''),(6,534,119,2365,1,''),(6,535,119,2365,1,''),(6,536,119,2365,1,''),(6,537,119,2365,1,''),(6,538,119,2365,1,''),(6,539,119,2365,1,''),(6,540,119,2365,1,''),(6,541,119,2365,1,''),(6,542,119,2365,1,''),(6,543,119,2365,1,''),(6,544,119,2365,1,''),(6,545,119,2365,1,''),(6,546,119,2365,1,''),(6,547,119,2365,1,''),(6,548,119,2365,1,''),(6,549,119,2365,1,''),(6,550,119,2365,1,''),(6,551,119,2365,1,''),(6,552,119,2365,1,''),(6,553,119,2365,1,''),(6,554,119,2365,1,''),(6,555,119,2365,1,''),(6,556,119,2365,1,''),(6,557,119,2365,1,''),(6,558,120,2365,1,''),(6,559,120,2365,1,''),(6,560,120,2365,1,''),(6,561,120,2365,1,''),(6,562,120,2365,1,''),(6,563,120,2365,1,''),(6,564,120,2365,1,''),(6,565,120,2365,1,''),(6,566,120,2365,1,''),(6,567,120,2365,1,''),(6,568,120,2365,1,''),(6,569,120,2365,1,''),(6,570,120,2365,1,''),(6,571,120,2365,1,''),(6,572,120,2365,1,''),(6,573,120,2365,1,''),(6,574,120,2365,1,''),(6,575,120,2365,1,''),(6,576,120,2365,1,''),(6,577,120,2365,1,''),(6,578,120,2365,1,''),(6,579,120,2365,1,''),(6,580,120,2365,1,''),(6,581,120,2365,1,''),(6,582,121,2365,1,''),(6,583,121,2365,1,''),(6,584,121,2365,1,''),(6,585,121,2365,1,''),(6,586,121,2365,1,''),(6,587,121,2365,1,''),(6,588,121,2365,1,''),(6,589,121,2365,1,''),(6,590,121,2365,1,''),(6,591,121,2365,1,''),(6,592,121,2365,1,''),(6,593,121,2365,1,''),(6,594,121,2365,1,''),(6,595,121,2365,1,''),(6,596,121,2365,1,''),(6,597,121,2365,1,''),(6,598,121,2365,1,''),(6,599,121,2365,1,''),(6,600,121,2365,1,''),(6,601,121,2365,1,''),(6,602,121,2365,1,''),(6,603,121,2365,1,''),(6,604,121,2365,1,''),(6,605,121,2365,1,''),(6,606,122,2365,1,''),(6,607,122,2365,1,''),(6,608,122,2365,1,''),(6,609,122,2365,1,''),(6,610,122,2365,1,''),(6,611,122,2365,1,''),(6,612,122,2365,1,''),(6,613,122,2365,1,''),(6,614,122,2365,1,''),(6,615,122,2365,1,''),(6,616,122,2365,1,''),(6,617,122,2365,1,''),(6,618,122,2365,1,''),(6,619,122,2365,1,''),(6,620,122,2365,1,''),(6,621,122,2365,1,''),(6,622,122,2365,1,''),(6,623,122,2365,1,''),(6,624,122,2365,1,''),(6,625,122,2365,1,''),(6,626,122,2365,1,''),(6,627,122,2365,1,''),(6,628,122,2365,1,''),(6,629,122,2365,1,''),(6,630,123,2365,1,''),(6,631,123,2365,1,''),(6,632,123,2365,1,''),(6,633,123,2365,1,''),(6,634,123,2365,1,''),(6,635,123,2365,1,''),(6,636,123,2365,1,''),(6,637,123,2365,1,''),(6,638,123,2365,1,''),(6,639,123,2365,1,''),(6,640,123,2365,1,''),(6,641,123,2365,1,''),(6,642,123,2365,1,''),(6,643,123,2365,1,''),(6,644,123,2365,1,''),(6,645,123,2365,1,''),(6,646,123,2365,1,''),(6,647,123,2365,1,''),(6,648,123,2365,1,''),(6,649,123,2365,1,''),(6,650,123,2365,1,''),(6,651,123,2365,1,''),(6,652,123,2365,1,''),(6,653,123,2365,1,''),(6,654,124,2365,1,''),(6,655,124,2365,1,''),(6,656,124,2365,1,''),(6,657,124,2365,1,''),(6,658,124,2365,1,''),(6,659,124,2365,1,''),(6,660,124,2365,1,''),(6,661,124,2365,1,''),(6,662,124,2365,1,''),(6,663,124,2365,1,''),(6,664,124,2365,1,''),(6,665,124,2365,1,''),(6,666,124,2365,1,''),(6,667,124,2365,1,''),(6,668,124,2365,1,''),(6,669,124,2365,1,''),(6,670,124,2365,1,''),(6,671,124,2365,1,''),(6,672,124,2365,1,''),(6,673,124,2365,1,''),(6,674,124,2365,1,''),(6,675,124,2365,1,''),(6,676,124,2365,1,''),(6,677,124,2365,1,''),(6,678,125,2365,1,''),(6,679,125,2365,1,''),(6,680,125,2365,1,''),(6,681,125,2365,1,''),(6,682,125,2365,1,''),(6,683,125,2365,1,''),(6,684,125,2365,1,''),(6,685,125,2365,1,''),(6,686,125,2365,1,''),(6,687,125,2365,1,''),(6,688,125,2365,1,''),(6,689,125,2365,1,''),(6,690,125,2365,1,''),(6,691,125,2365,1,''),(6,692,125,2365,1,''),(6,693,125,2365,1,''),(6,694,125,2365,1,''),(6,695,125,2365,1,''),(6,696,125,2365,1,''),(6,697,125,2365,1,''),(6,698,125,2365,1,''),(6,699,125,2365,1,''),(6,700,125,2365,1,''),(6,701,125,2365,1,''),(6,702,126,2365,1,'$\0\0\0\0'),(6,703,126,2365,1,''),(6,704,126,2365,1,''),(6,705,126,2365,1,''),(6,706,126,2365,1,''),(6,707,126,2365,1,''),(6,708,126,2365,1,''),(6,709,126,2365,1,''),(6,710,126,2365,1,''),(6,711,126,2365,1,''),(6,712,126,2365,1,''),(6,713,126,2365,1,''),(6,714,126,2365,1,''),(6,715,126,2365,1,''),(6,716,126,2365,1,''),(6,717,126,2365,1,''),(6,718,126,2365,1,''),(6,719,126,2365,1,''),(6,720,126,2365,1,''),(6,721,126,2365,1,''),(6,722,126,2365,1,''),(6,723,126,2365,1,''),(6,724,126,2365,1,''),(6,725,126,2365,1,''),(6,726,127,2365,1,''),(6,727,127,2365,1,''),(6,728,127,2365,1,''),(6,729,127,2365,1,''),(6,730,127,2365,1,''),(6,731,127,2365,1,''),(6,732,127,2365,1,''),(6,733,127,2365,1,''),(6,734,127,2365,1,''),(6,735,127,2365,1,''),(6,736,127,2365,1,''),(6,737,127,2365,1,''),(6,738,127,2365,1,''),(6,739,127,2365,1,''),(6,740,127,2365,1,''),(6,741,127,2365,1,''),(6,742,127,2365,1,''),(6,743,127,2365,1,''),(6,744,127,2365,1,''),(6,745,127,2365,1,''),(6,746,127,2365,1,''),(6,747,127,2365,1,''),(6,748,127,2365,1,''),(6,749,127,2365,1,''),(6,750,128,2365,1,''),(6,751,128,2365,1,''),(6,752,128,2365,1,''),(6,753,128,2365,1,''),(6,754,128,2365,1,''),(6,755,128,2365,1,''),(6,756,128,2365,1,''),(6,757,128,2365,1,''),(6,758,128,2365,1,''),(6,759,128,2365,1,''),(6,760,128,2365,1,''),(6,761,128,2365,1,''),(6,762,128,2365,1,''),(6,763,128,2365,1,''),(6,764,128,2365,1,''),(6,765,128,2365,1,''),(6,766,128,2365,1,''),(6,767,128,2365,1,''),(6,768,128,2365,1,''),(6,769,128,2365,1,''),(6,770,128,2365,1,''),(6,771,128,2365,1,''),(6,772,128,2365,1,''),(6,773,128,2365,1,''),(6,774,129,2365,1,''),(6,775,129,2365,1,''),(6,776,129,2365,1,''),(6,777,129,2365,1,''),(6,778,129,2365,1,''),(6,779,129,2365,1,''),(6,780,129,2365,1,''),(6,781,129,2365,1,''),(6,782,129,2365,1,''),(6,783,129,2365,1,''),(6,784,129,2365,1,''),(6,785,129,2365,1,''),(6,786,129,2365,1,''),(6,787,129,2365,1,''),(6,788,129,2365,1,''),(6,789,129,2365,1,''),(6,790,129,2365,1,''),(6,791,129,2365,1,''),(6,792,129,2365,1,''),(6,793,129,2365,1,''),(6,794,129,2365,1,''),(6,795,129,2365,1,''),(6,796,129,2365,1,''),(6,797,129,2365,1,''),(6,798,130,2365,1,''),(6,799,130,2365,1,''),(6,800,130,2365,1,''),(6,801,130,2365,1,''),(6,802,130,2365,1,''),(6,803,130,2365,1,''),(6,804,130,2365,1,''),(6,805,130,2365,1,''),(6,806,130,2365,1,''),(6,807,130,2365,1,''),(6,808,130,2365,1,''),(6,809,130,2365,1,''),(6,810,130,2365,1,''),(6,811,130,2365,1,''),(6,812,130,2365,1,''),(6,813,130,2365,1,''),(6,814,130,2365,1,''),(6,815,130,2365,1,''),(6,816,130,2365,1,''),(6,817,130,2365,1,''),(6,818,130,2365,1,''),(6,819,130,2365,1,''),(6,820,130,2365,1,''),(6,821,130,2365,1,''),(6,822,131,2365,1,''),(6,823,131,2365,1,''),(6,824,131,2365,1,''),(6,825,131,2365,1,''),(6,826,131,2365,1,''),(6,827,131,2365,1,''),(6,828,131,2365,1,''),(6,829,131,2365,1,''),(6,830,131,2365,1,''),(6,831,131,2365,1,''),(6,832,131,2365,1,''),(6,833,131,2365,1,''),(6,834,131,2365,1,''),(6,835,131,2365,1,''),(6,836,131,2365,1,''),(6,837,131,2365,1,''),(6,838,131,2365,1,''),(6,839,131,2365,1,''),(6,840,131,2365,1,''),(6,841,131,2365,1,''),(6,842,131,2365,1,''),(6,843,131,2365,1,''),(6,844,131,2365,1,''),(6,845,131,2365,1,''),(6,846,132,2365,1,''),(6,847,132,2365,1,''),(6,848,132,2365,1,''),(6,849,132,2365,1,''),(6,850,132,2365,1,''),(6,851,132,2365,1,''),(6,852,132,2365,1,''),(6,853,132,2365,1,''),(6,854,132,2365,1,''),(6,855,132,2365,1,''),(6,856,132,2365,1,''),(6,857,132,2365,1,''),(6,858,132,2365,1,''),(6,859,132,2365,1,''),(6,860,132,2365,1,''),(6,861,132,2365,1,''),(6,862,132,2365,1,''),(6,863,132,2365,1,''),(6,864,132,2365,1,''),(6,865,132,2365,1,''),(6,866,132,2365,1,''),(6,867,132,2365,1,''),(6,868,132,2365,1,''),(6,869,132,2365,1,''),(6,870,133,2365,1,''),(6,871,133,2365,1,''),(6,872,133,2365,1,''),(6,873,133,2365,1,''),(6,874,133,2365,1,''),(6,875,133,2365,1,''),(6,876,133,2365,1,''),(6,877,133,2365,1,''),(6,878,133,2365,1,''),(6,879,133,2365,1,''),(6,880,133,2365,1,''),(6,881,133,2365,1,''),(6,882,133,2365,1,''),(6,883,133,2365,1,''),(6,884,133,2365,1,''),(6,885,133,2365,1,''),(6,886,133,2365,1,''),(6,887,133,2365,1,''),(6,888,133,2365,1,''),(6,889,133,2365,1,''),(6,890,133,2365,1,''),(6,891,133,2365,1,''),(6,892,133,2365,1,''),(6,893,133,2365,1,''),(6,894,134,2365,1,''),(6,895,134,2365,1,''),(6,896,134,2365,1,''),(6,897,134,2365,1,''),(6,898,134,2365,1,''),(6,899,134,2365,1,''),(6,900,134,2365,1,''),(6,901,134,2365,1,''),(6,902,134,2365,1,''),(6,903,134,2365,1,''),(6,904,134,2365,1,''),(6,905,134,2365,1,''),(6,906,134,2365,1,''),(6,907,134,2365,1,''),(6,908,134,2365,1,''),(6,909,134,2365,1,''),(6,910,134,2365,1,''),(6,911,134,2365,1,''),(6,912,134,2365,1,''),(6,913,134,2365,1,''),(6,914,134,2365,1,''),(6,915,134,2365,1,''),(6,916,134,2365,1,''),(6,917,134,2365,1,''),(6,918,135,2365,1,''),(6,919,135,2365,1,''),(6,920,135,2365,1,''),(6,921,135,2365,1,''),(6,922,135,2365,1,''),(6,923,135,2365,1,''),(6,924,135,2365,1,''),(6,925,135,2365,1,''),(6,926,135,2365,1,''),(6,927,135,2365,1,''),(6,928,135,2365,1,''),(6,929,135,2365,1,''),(6,930,135,2365,1,''),(6,931,135,2365,1,''),(6,932,135,2365,1,''),(6,933,135,2365,1,''),(6,934,135,2365,1,''),(6,935,135,2365,1,''),(6,936,135,2365,1,''),(6,937,135,2365,1,''),(6,938,135,2365,1,''),(6,939,135,2365,1,''),(6,940,135,2365,1,''),(6,941,135,2365,1,''),(6,942,136,2365,1,''),(6,943,136,2365,1,''),(6,944,136,2365,1,''),(6,945,136,2365,1,''),(6,946,136,2365,1,''),(6,947,136,2365,1,''),(6,948,136,2365,1,''),(6,949,136,2365,1,''),(6,950,136,2365,1,''),(6,951,136,2365,1,''),(6,952,136,2365,1,''),(6,953,136,2365,1,''),(6,954,136,2365,1,''),(6,955,136,2365,1,''),(6,956,136,2365,1,''),(6,957,136,2365,1,''),(6,958,136,2365,1,''),(6,959,136,2365,1,''),(6,960,136,2365,1,''),(6,961,136,2365,1,''),(6,962,136,2365,1,''),(6,963,136,2365,1,''),(6,964,136,2365,1,''),(6,965,136,2365,1,''),(6,966,137,2365,1,''),(6,967,137,2365,1,''),(6,968,137,2365,1,''),(6,969,137,2365,1,''),(6,970,137,2365,1,''),(6,971,137,2365,1,''),(6,972,137,2365,1,''),(6,973,137,2365,1,''),(6,974,137,2365,1,''),(6,975,137,2365,1,''),(6,976,137,2365,1,''),(6,977,137,2365,1,''),(6,978,137,2365,1,''),(6,979,137,2365,1,''),(6,980,137,2365,1,''),(6,981,137,2365,1,''),(6,982,137,2365,1,''),(6,983,137,2365,1,''),(6,984,137,2365,1,''),(6,985,137,2365,1,''),(6,986,137,2365,1,''),(6,987,137,2365,1,''),(6,988,137,2365,1,''),(6,989,137,2365,1,''),(6,990,138,2365,1,''),(6,991,138,2365,1,''),(6,992,138,2365,1,''),(6,993,138,2365,1,''),(6,994,138,2365,1,''),(6,995,138,2365,1,''),(6,996,138,2365,1,''),(6,997,138,2365,1,''),(6,998,138,2365,1,''),(6,999,138,2365,1,''),(6,1000,138,2365,1,''),(6,1001,138,2365,1,''),(6,1002,138,2365,1,''),(6,1003,138,2365,1,''),(6,1004,138,2365,1,''),(6,1005,138,2365,1,''),(6,1006,138,2365,1,''),(6,1007,138,2365,1,''),(6,1008,138,2365,1,''),(6,1009,138,2365,1,''),(6,1010,138,2365,1,''),(6,1011,138,2365,1,''),(6,1012,138,2365,1,''),(6,1013,138,2365,1,''),(6,1014,139,2365,1,''),(6,1015,139,2365,1,''),(6,1016,139,2365,1,''),(6,1017,139,2365,1,''),(6,1018,139,2365,1,''),(6,1019,139,2365,1,''),(6,1020,139,2365,1,''),(6,1021,139,2365,1,''),(6,1022,139,2365,1,''),(6,1023,139,2365,1,''),(6,1024,139,2365,1,''),(6,1025,139,2365,1,''),(6,1026,139,2365,1,''),(6,1027,139,2365,1,''),(6,1028,139,2365,1,''),(6,1029,139,2365,1,''),(6,1030,139,2365,1,''),(6,1031,139,2365,1,''),(6,1032,139,2365,1,''),(6,1033,139,2365,1,''),(6,1034,139,2365,1,''),(6,1035,139,2365,1,''),(6,1036,139,2365,1,''),(6,1037,139,2365,1,''),(6,1038,140,2365,1,''),(6,1039,140,2365,1,''),(6,1040,140,2365,1,''),(6,1041,140,2365,1,''),(6,1042,140,2365,1,''),(6,1043,140,2365,1,''),(6,1044,140,2365,1,''),(6,1045,140,2365,1,''),(6,1046,140,2365,1,''),(6,1047,140,2365,1,''),(6,1048,140,2365,1,''),(6,1049,140,2365,1,''),(6,1050,140,2365,1,''),(6,1051,140,2365,1,''),(6,1052,140,2365,1,''),(6,1053,140,2365,1,''),(6,1054,140,2365,1,''),(6,1055,140,2365,1,''),(6,1056,140,2365,1,''),(6,1057,140,2365,1,''),(6,1058,140,2365,1,''),(6,1059,140,2365,1,''),(6,1060,140,2365,1,''),(6,1061,140,2365,1,''),(6,1062,141,2365,1,''),(6,1063,141,2365,1,''),(6,1064,141,2365,1,''),(6,1065,141,2365,1,''),(6,1066,141,2365,1,''),(6,1067,141,2365,1,''),(6,1068,141,2365,1,''),(6,1069,141,2365,1,''),(6,1070,141,2365,1,''),(6,1071,141,2365,1,''),(6,1072,141,2365,1,''),(6,1073,141,2365,1,''),(6,1074,141,2365,1,''),(6,1075,141,2365,1,''),(6,1076,141,2365,1,''),(6,1077,141,2365,1,''),(6,1078,141,2365,1,''),(6,1079,141,2365,1,''),(6,1080,141,2365,1,''),(6,1081,141,2365,1,''),(6,1082,141,2365,1,''),(6,1083,141,2365,1,''),(6,1084,141,2365,1,''),(6,1085,141,2365,1,''),(6,1086,142,2365,1,''),(6,1087,142,2365,1,''),(6,1088,142,2365,1,''),(6,1089,142,2365,1,''),(6,1090,142,2365,1,''),(6,1091,142,2365,1,''),(6,1092,142,2365,1,''),(6,1093,142,2365,1,''),(6,1094,142,2365,1,''),(6,1095,142,2365,1,''),(6,1096,142,2365,1,''),(6,1097,142,2365,1,''),(6,1098,142,2365,1,''),(6,1099,142,2365,1,''),(6,1100,142,2365,1,''),(6,1101,142,2365,1,''),(6,1102,142,2365,1,''),(6,1103,142,2365,1,''),(6,1104,142,2365,1,''),(6,1105,142,2365,1,''),(6,1106,142,2365,1,''),(6,1107,142,2365,1,''),(6,1108,142,2365,1,''),(6,1109,142,2365,1,''),(6,1110,143,2365,1,''),(6,1111,143,2365,1,''),(6,1112,143,2365,1,''),(6,1113,143,2365,1,''),(6,1114,143,2365,1,''),(6,1115,143,2365,1,''),(6,1116,143,2365,1,''),(6,1117,143,2365,1,''),(6,1118,143,2365,1,''),(6,1119,143,2365,1,''),(6,1120,143,2365,1,''),(6,1121,143,2365,1,''),(6,1122,143,2365,1,''),(6,1123,143,2365,1,''),(6,1124,143,2365,1,''),(6,1125,143,2365,1,''),(6,1126,143,2365,1,''),(6,1127,143,2365,1,''),(6,1128,143,2365,1,''),(6,1129,143,2365,1,''),(6,1130,143,2365,1,''),(6,1131,143,2365,1,''),(6,1132,143,2365,1,''),(6,1133,143,2365,1,''),(6,1134,144,2365,1,''),(6,1135,144,2365,1,''),(6,1136,144,2365,1,''),(6,1137,144,2365,1,''),(6,1138,144,2365,1,''),(6,1139,144,2365,1,''),(6,1140,144,2365,1,''),(6,1141,144,2365,1,''),(6,1142,144,2365,1,''),(6,1143,144,2365,1,''),(6,1144,144,2365,1,''),(6,1145,144,2365,1,''),(6,1146,144,2365,1,''),(6,1147,144,2365,1,''),(6,1148,144,2365,1,''),(6,1149,144,2365,1,''),(6,1150,144,2365,1,''),(6,1151,144,2365,1,''),(6,1152,144,2365,1,''),(6,1153,144,2365,1,''),(6,1154,144,2365,1,''),(6,1155,144,2365,1,''),(6,1156,144,2365,1,''),(6,1157,144,2365,1,''),(6,1158,145,2365,1,''),(6,1159,145,2365,1,''),(6,1160,145,2365,1,''),(6,1161,145,2365,1,''),(6,1162,145,2365,1,''),(6,1163,145,2365,1,''),(6,1164,145,2365,1,''),(6,1165,145,2365,1,''),(6,1166,145,2365,1,''),(6,1167,145,2365,1,''),(6,1168,145,2365,1,''),(6,1169,145,2365,1,''),(6,1170,145,2365,1,''),(6,1171,145,2365,1,''),(6,1172,145,2365,1,''),(6,1173,145,2365,1,''),(6,1174,145,2365,1,''),(6,1175,145,2365,1,''),(6,1176,145,2365,1,''),(6,1177,145,2365,1,''),(6,1178,145,2365,1,''),(6,1179,145,2365,1,''),(6,1180,145,2365,1,''),(6,1181,145,2365,1,''),(6,1182,146,2365,1,''),(6,1183,146,2365,1,''),(6,1184,146,2365,1,''),(6,1185,146,2365,1,''),(6,1186,146,2365,1,''),(6,1187,146,2365,1,''),(6,1188,146,2365,1,''),(6,1189,146,2365,1,''),(6,1190,146,2365,1,''),(6,1191,146,2365,1,''),(6,1192,146,2365,1,''),(6,1193,146,2365,1,''),(6,1194,146,2365,1,''),(6,1195,146,2365,1,''),(6,1196,146,2365,1,''),(6,1197,146,2365,1,''),(6,1198,146,2365,1,''),(6,1199,146,2365,1,''),(6,1200,146,2365,1,''),(6,1201,146,2365,1,''),(6,1202,146,2365,1,''),(6,1203,146,2365,1,''),(6,1204,146,2365,1,''),(6,1205,146,2365,1,''),(6,1206,147,2365,1,''),(6,1207,147,2365,1,''),(6,1208,147,2365,1,''),(6,1209,147,2365,1,''),(6,1210,147,2365,1,''),(6,1211,147,2365,1,''),(6,1212,147,2365,1,''),(6,1213,147,2365,1,''),(6,1214,147,2365,1,''),(6,1215,147,2365,1,''),(6,1216,147,2365,1,''),(6,1217,147,2365,1,''),(6,1218,147,2365,1,''),(6,1219,147,2365,1,''),(6,1220,147,2365,1,''),(6,1221,147,2365,1,''),(6,1222,147,2365,1,''),(6,1223,147,2365,1,''),(6,1224,147,2365,1,''),(6,1225,147,2365,1,''),(6,1226,147,2365,1,''),(6,1227,147,2365,1,''),(6,1228,147,2365,1,''),(6,1229,147,2365,1,''),(6,1230,148,2365,1,''),(6,1231,148,2365,1,''),(6,1232,148,2365,1,''),(6,1233,148,2365,1,''),(6,1234,148,2365,1,''),(6,1235,148,2365,1,''),(6,1236,148,2365,1,''),(6,1237,148,2365,1,''),(6,1238,148,2365,1,''),(6,1239,148,2365,1,''),(6,1240,148,2365,1,''),(6,1241,148,2365,1,''),(6,1242,148,2365,1,''),(6,1243,148,2365,1,''),(6,1244,148,2365,1,''),(6,1245,148,2365,1,''),(6,1246,148,2365,1,''),(6,1247,148,2365,1,''),(6,1248,148,2365,1,''),(6,1249,148,2365,1,''),(6,1250,148,2365,1,''),(6,1251,148,2365,1,''),(6,1252,148,2365,1,''),(6,1253,148,2365,1,''),(6,1254,149,2365,1,''),(6,1255,149,2365,1,''),(6,1256,149,2365,1,''),(6,1257,149,2365,1,''),(6,1258,149,2365,1,''),(6,1259,149,2365,1,''),(6,1260,149,2365,1,''),(6,1261,149,2365,1,''),(6,1262,149,2365,1,''),(6,1263,149,2365,1,''),(6,1264,149,2365,1,''),(6,1265,149,2365,1,''),(6,1266,149,2365,1,''),(6,1267,149,2365,1,''),(6,1268,149,2365,1,''),(6,1269,149,2365,1,''),(6,1270,149,2365,1,''),(6,1271,149,2365,1,''),(6,1272,149,2365,1,''),(6,1273,149,2365,1,''),(6,1274,149,2365,1,''),(6,1275,149,2365,1,''),(6,1276,149,2365,1,''),(6,1277,149,2365,1,''),(6,1278,150,2365,1,''),(6,1279,150,2365,1,''),(6,1280,150,2365,1,''),(6,1281,150,2365,1,''),(6,1282,150,2365,1,''),(6,1283,150,2365,1,''),(6,1284,150,2365,1,''),(6,1285,150,2365,1,''),(6,1286,150,2365,1,''),(6,1287,150,2365,1,''),(6,1288,150,2365,1,''),(6,1289,150,2365,1,''),(6,1290,150,2365,1,''),(6,1291,150,2365,1,''),(6,1292,150,2365,1,''),(6,1293,150,2365,1,''),(6,1294,150,2365,1,''),(6,1295,150,2365,1,''),(6,1296,150,2365,1,''),(6,1297,150,2365,1,''),(6,1298,150,2365,1,''),(6,1299,150,2365,1,''),(6,1300,150,2365,1,''),(6,1301,150,2365,1,''),(6,1302,151,2365,1,''),(6,1303,151,2365,1,''),(6,1304,151,2365,1,''),(6,1305,151,2365,1,''),(6,1306,151,2365,1,''),(6,1307,151,2365,1,''),(6,1308,151,2365,1,''),(6,1309,151,2365,1,''),(6,1310,151,2365,1,''),(6,1311,151,2365,1,''),(6,1312,151,2365,1,''),(6,1313,151,2365,1,''),(6,1314,151,2365,1,''),(6,1315,151,2365,1,''),(6,1316,151,2365,1,''),(6,1317,151,2365,1,''),(6,1318,151,2365,1,''),(6,1319,151,2365,1,''),(6,1320,151,2365,1,''),(6,1321,151,2365,1,''),(6,1322,151,2365,1,''),(6,1323,151,2365,1,''),(6,1324,151,2365,1,''),(6,1325,151,2365,1,''),(6,1326,152,2365,1,''),(6,1327,152,2365,1,''),(6,1328,152,2365,1,''),(6,1329,152,2365,1,''),(6,1330,152,2365,1,''),(6,1331,152,2365,1,''),(6,1332,152,2365,1,''),(6,1333,152,2365,1,''),(6,1334,152,2365,1,''),(6,1335,152,2365,1,''),(6,1336,152,2365,1,''),(6,1337,152,2365,1,''),(6,1338,152,2365,1,''),(6,1339,152,2365,1,''),(6,1340,152,2365,1,''),(6,1341,152,2365,1,''),(6,1342,152,2365,1,''),(6,1343,152,2365,1,''),(6,1344,152,2365,1,''),(6,1345,152,2365,1,''),(6,1346,152,2365,1,''),(6,1347,152,2365,1,''),(6,1348,152,2365,1,''),(6,1349,152,2365,1,''),(6,1350,153,2365,1,''),(6,1351,153,2365,1,''),(6,1352,153,2365,1,''),(6,1353,153,2365,1,''),(6,1354,153,2365,1,''),(6,1355,153,2365,1,''),(6,1356,153,2365,1,''),(6,1357,153,2365,1,''),(6,1358,153,2365,1,''),(6,1359,153,2365,1,''),(6,1360,153,2365,1,''),(6,1361,153,2365,1,''),(6,1362,153,2365,1,''),(6,1363,153,2365,1,''),(6,1364,153,2365,1,''),(6,1365,153,2365,1,''),(6,1366,153,2365,1,''),(6,1367,153,2365,1,''),(6,1368,153,2365,1,''),(6,1369,153,2365,1,''),(6,1370,153,2365,1,''),(6,1371,153,2365,1,''),(6,1372,153,2365,1,''),(6,1373,153,2365,1,''),(6,1374,154,2365,1,''),(6,1375,154,2365,1,''),(6,1376,154,2365,1,''),(6,1377,154,2365,1,''),(6,1378,154,2365,1,''),(6,1379,154,2365,1,''),(6,1380,154,2365,1,''),(6,1381,154,2365,1,''),(6,1382,154,2365,1,''),(6,1383,154,2365,1,''),(6,1384,154,2365,1,''),(6,1385,154,2365,1,''),(6,1386,154,2365,1,''),(6,1387,154,2365,1,''),(6,1388,154,2365,1,''),(6,1389,154,2365,1,''),(6,1390,154,2365,1,''),(6,1391,154,2365,1,''),(6,1392,154,2365,1,''),(6,1393,154,2365,1,''),(6,1394,154,2365,1,''),(6,1395,154,2365,1,''),(6,1396,154,2365,1,''),(6,1397,154,2365,1,''),(6,1398,155,2365,1,''),(6,1399,155,2365,1,''),(6,1400,155,2365,1,''),(6,1401,155,2365,1,''),(6,1402,155,2365,1,''),(6,1403,155,2365,1,''),(6,1404,155,2365,1,''),(6,1405,155,2365,1,''),(6,1406,155,2365,1,''),(6,1407,155,2365,1,''),(6,1408,155,2365,1,''),(6,1409,155,2365,1,''),(6,1410,155,2365,1,''),(6,1411,155,2365,1,''),(6,1412,155,2365,1,''),(6,1413,155,2365,1,''),(6,1414,155,2365,1,''),(6,1415,155,2365,1,''),(6,1416,155,2365,1,''),(6,1417,155,2365,1,''),(6,1418,155,2365,1,''),(6,1419,155,2365,1,''),(6,1420,155,2365,1,''),(6,1421,155,2365,1,''),(6,1422,156,2365,1,''),(6,1423,156,2365,1,''),(6,1424,156,2365,1,''),(6,1425,156,2365,1,''),(6,1426,156,2365,1,''),(6,1427,156,2365,1,''),(6,1428,156,2365,1,''),(6,1429,156,2365,1,''),(6,1430,156,2365,1,''),(6,1431,156,2365,1,''),(6,1432,156,2365,1,''),(6,1433,156,2365,1,''),(6,1434,156,2365,1,''),(6,1435,156,2365,1,''),(6,1436,156,2365,1,''),(6,1437,156,2365,1,''),(6,1438,156,2365,1,''),(6,1439,156,2365,1,''),(6,1440,156,2365,1,''),(6,1441,156,2365,1,''),(6,1442,156,2365,1,''),(6,1443,156,2365,1,''),(6,1444,156,2365,1,''),(6,1445,156,2365,1,''),(6,1446,157,2365,1,''),(6,1447,157,2365,1,''),(6,1448,157,2365,1,''),(6,1449,157,2365,1,''),(6,1450,157,2365,1,''),(6,1451,157,2365,1,''),(6,1452,157,2365,1,''),(6,1453,157,2365,1,''),(6,1454,157,2365,1,''),(6,1455,157,2365,1,''),(6,1456,157,2365,1,''),(6,1457,157,2365,1,''),(6,1458,157,2365,1,''),(6,1459,157,2365,1,''),(6,1460,157,2365,1,''),(6,1461,157,2365,1,''),(6,1462,157,2365,1,''),(6,1463,157,2365,1,''),(6,1464,157,2365,1,''),(6,1465,157,2365,1,''),(6,1466,157,2365,1,''),(6,1467,157,2365,1,''),(6,1468,157,2365,1,''),(6,1469,157,2365,1,''),(6,1470,158,2365,1,''),(6,1471,158,2365,1,''),(6,1472,158,2365,1,''),(6,1473,158,2365,1,''),(6,1474,158,2365,1,''),(6,1475,158,2365,1,''),(6,1476,158,2365,1,''),(6,1477,158,2365,1,''),(6,1478,158,2365,1,''),(6,1479,158,2365,1,''),(6,1480,158,2365,1,''),(6,1481,158,2365,1,''),(6,1482,158,2365,1,''),(6,1483,158,2365,1,''),(6,1484,158,2365,1,''),(6,1485,158,2365,1,''),(6,1486,158,2365,1,''),(6,1487,158,2365,1,''),(6,1488,158,2365,1,''),(6,1489,158,2365,1,''),(6,1490,158,2365,1,''),(6,1491,158,2365,1,''),(6,1492,158,2365,1,''),(6,1493,158,2365,1,''),(6,1494,159,2365,1,''),(6,1495,159,2365,1,''),(6,1496,159,2365,1,''),(6,1497,159,2365,1,''),(6,1498,159,2365,1,''),(6,1499,159,2365,1,''),(6,1500,159,2365,1,''),(6,1501,159,2365,1,''),(6,1502,159,2365,1,''),(6,1503,159,2365,1,''),(6,1504,159,2365,1,''),(6,1505,159,2365,1,''),(6,1506,159,2365,1,''),(6,1507,159,2365,1,''),(6,1508,159,2365,1,''),(6,1509,159,2365,1,''),(6,1510,159,2365,1,''),(6,1511,159,2365,1,''),(6,1512,159,2365,1,''),(6,1513,159,2365,1,''),(6,1514,159,2365,1,''),(6,1515,159,2365,1,''),(6,1516,159,2365,1,''),(6,1517,159,2365,1,''),(6,1518,160,2365,1,''),(6,1519,160,2365,1,''),(6,1520,160,2365,1,''),(6,1521,160,2365,1,''),(6,1522,160,2365,1,''),(6,1523,160,2365,1,''),(6,1524,160,2365,1,''),(6,1525,160,2365,1,''),(6,1526,160,2365,1,''),(6,1527,160,2365,1,''),(6,1528,160,2365,1,''),(6,1529,160,2365,1,''),(6,1530,160,2365,1,''),(6,1531,160,2365,1,''),(6,1532,160,2365,1,''),(6,1533,160,2365,1,''),(6,1534,160,2365,1,''),(6,1535,160,2365,1,''),(6,1536,160,2365,1,''),(6,1537,160,2365,1,''),(6,1538,160,2365,1,''),(6,1539,160,2365,1,''),(6,1540,160,2365,1,''),(6,1541,160,2365,1,''),(6,1542,161,2365,1,''),(6,1543,161,2365,1,''),(6,1544,161,2365,1,''),(6,1545,161,2365,1,''),(6,1546,161,2365,1,''),(6,1547,161,2365,1,''),(6,1548,161,2365,1,''),(6,1549,161,2365,1,''),(6,1550,161,2365,1,''),(6,1551,161,2365,1,''),(6,1552,161,2365,1,''),(6,1553,161,2365,1,''),(6,1554,161,2365,1,''),(6,1555,161,2365,1,''),(6,1556,161,2365,1,''),(6,1557,161,2365,1,''),(6,1558,161,2365,1,''),(6,1559,161,2365,1,''),(6,1560,161,2365,1,''),(6,1561,161,2365,1,''),(6,1562,161,2365,1,''),(6,1563,161,2365,1,''),(6,1564,161,2365,1,''),(6,1565,161,2365,1,''),(6,1566,162,2365,1,''),(6,1567,162,2365,1,''),(6,1568,162,2365,1,''),(6,1569,162,2365,1,''),(6,1570,162,2365,1,''),(6,1571,162,2365,1,''),(6,1572,162,2365,1,''),(6,1573,162,2365,1,''),(6,1574,162,2365,1,''),(6,1575,162,2365,1,''),(6,1576,162,2365,1,''),(6,1577,162,2365,1,''),(6,1578,162,2365,1,''),(6,1579,162,2365,1,''),(6,1580,162,2365,1,''),(6,1581,162,2365,1,''),(6,1582,162,2365,1,''),(6,1583,162,2365,1,''),(6,1584,162,2365,1,''),(6,1585,162,2365,1,''),(6,1586,162,2365,1,''),(6,1587,162,2365,1,''),(6,1588,162,2365,1,''),(6,1589,162,2365,1,''),(6,1590,163,2365,1,''),(6,1591,163,2365,1,''),(6,1592,163,2365,1,''),(6,1593,163,2365,1,''),(6,1594,163,2365,1,''),(6,1595,163,2365,1,''),(6,1596,163,2365,1,''),(6,1597,163,2365,1,''),(6,1598,163,2365,1,''),(6,1599,163,2365,1,''),(6,1600,163,2365,1,''),(6,1601,163,2365,1,''),(6,1602,163,2365,1,''),(6,1603,163,2365,1,''),(6,1604,163,2365,1,''),(6,1605,163,2365,1,''),(6,1606,163,2365,1,''),(6,1607,163,2365,1,''),(6,1608,163,2365,1,''),(6,1609,163,2365,1,''),(6,1610,163,2365,1,''),(6,1611,163,2365,1,''),(6,1612,163,2365,1,''),(6,1613,163,2365,1,''),(6,1614,164,2365,1,''),(6,1615,164,2365,1,''),(6,1616,164,2365,1,''),(6,1617,164,2365,1,''),(6,1618,164,2365,1,''),(6,1619,164,2365,1,''),(6,1620,164,2365,1,''),(6,1621,164,2365,1,''),(6,1622,164,2365,1,''),(6,1623,164,2365,1,''),(6,1624,164,2365,1,''),(6,1625,164,2365,1,''),(6,1626,164,2365,1,''),(6,1627,164,2365,1,''),(6,1628,164,2365,1,''),(6,1629,164,2365,1,''),(6,1630,164,2365,1,''),(6,1631,164,2365,1,''),(6,1632,164,2365,1,''),(6,1633,164,2365,1,''),(6,1634,164,2365,1,''),(6,1635,164,2365,1,''),(6,1636,164,2365,1,''),(6,1637,164,2365,1,''),(6,1638,165,2365,1,''),(6,1639,165,2365,1,''),(6,1640,165,2365,1,''),(6,1641,165,2365,1,''),(6,1642,165,2365,1,''),(6,1643,165,2365,1,''),(6,1644,165,2365,1,''),(6,1645,165,2365,1,''),(6,1646,165,2365,1,''),(6,1647,165,2365,1,''),(6,1648,165,2365,1,''),(6,1649,165,2365,1,''),(6,1650,165,2365,1,''),(6,1651,165,2365,1,''),(6,1652,165,2365,1,''),(6,1653,165,2365,1,''),(6,1654,165,2365,1,''),(6,1655,165,2365,1,''),(6,1656,165,2365,1,''),(6,1657,165,2365,1,''),(6,1658,165,2365,1,''),(6,1659,165,2365,1,''),(6,1660,165,2365,1,''),(6,1661,165,2365,1,''),(6,1662,166,2365,1,''),(6,1663,166,2365,1,''),(6,1664,166,2365,1,''),(6,1665,166,2365,1,''),(6,1666,166,2365,1,''),(6,1667,166,2365,1,''),(6,1668,166,2365,1,''),(6,1669,166,2365,1,''),(6,1670,166,2365,1,''),(6,1671,166,2365,1,''),(6,1672,166,2365,1,''),(6,1673,166,2365,1,''),(6,1674,166,2365,1,''),(6,1675,166,2365,1,''),(6,1676,166,2365,1,''),(6,1677,166,2365,1,''),(6,1678,166,2365,1,''),(6,1679,166,2365,1,''),(6,1680,166,2365,1,''),(6,1681,166,2365,1,''),(6,1682,166,2365,1,''),(6,1683,166,2365,1,''),(6,1684,166,2365,1,''),(6,1685,166,2365,1,''),(6,1686,167,2365,1,''),(6,1687,167,2365,1,''),(6,1688,167,2365,1,''),(6,1689,167,2365,1,''),(6,1690,167,2365,1,''),(6,1691,167,2365,1,''),(6,1692,167,2365,1,''),(6,1693,167,2365,1,''),(6,1694,167,2365,1,''),(6,1695,167,2365,1,''),(6,1696,167,2365,1,''),(6,1697,167,2365,1,''),(6,1698,167,2365,1,''),(6,1699,167,2365,1,''),(6,1700,167,2365,1,''),(6,1701,167,2365,1,''),(6,1702,167,2365,1,''),(6,1703,167,2365,1,''),(6,1704,167,2365,1,''),(6,1705,167,2365,1,''),(6,1706,167,2365,1,''),(6,1707,167,2365,1,''),(6,1708,167,2365,1,''),(6,1709,167,2365,1,''),(6,1710,168,2365,1,''),(6,1711,168,2365,1,''),(6,1712,168,2365,1,''),(6,1713,168,2365,1,''),(6,1714,168,2365,1,''),(6,1715,168,2365,1,''),(6,1716,168,2365,1,''),(6,1717,168,2365,1,''),(6,1718,168,2365,1,''),(6,1719,168,2365,1,''),(6,1720,168,2365,1,''),(6,1721,168,2365,1,''),(6,1722,168,2365,1,''),(6,1723,168,2365,1,''),(6,1724,168,2365,1,''),(6,1725,168,2365,1,''),(6,1726,168,2365,1,''),(6,1727,168,2365,1,''),(6,1728,168,2365,1,''),(6,1729,168,2365,1,''),(6,1730,168,2365,1,''),(6,1731,168,2365,1,''),(6,1732,168,2365,1,''),(6,1733,168,2365,1,''),(6,1734,169,2365,1,''),(6,1735,169,2365,1,''),(6,1736,169,2365,1,''),(6,1737,169,2365,1,''),(6,1738,169,2365,1,''),(6,1739,169,2365,1,''),(6,1740,169,2365,1,''),(6,1741,169,2365,1,''),(6,1742,169,2365,1,''),(6,1743,169,2365,1,''),(6,1744,169,2365,1,''),(6,1745,169,2365,1,''),(6,1746,169,2365,1,''),(6,1747,169,2365,1,''),(6,1748,169,2365,1,''),(6,1749,169,2365,1,''),(6,1750,169,2365,1,''),(6,1751,169,2365,1,''),(6,1752,169,2365,1,''),(6,1753,169,2365,1,''),(6,1754,169,2365,1,''),(6,1755,169,2365,1,''),(6,1756,169,2365,1,''),(6,1757,169,2365,1,''),(6,1758,170,2365,1,''),(6,1759,170,2365,1,''),(6,1760,170,2365,1,''),(6,1761,170,2365,1,''),(6,1762,170,2365,1,''),(6,1763,170,2365,1,''),(6,1764,170,2365,1,''),(6,1765,170,2365,1,''),(6,1766,170,2365,1,''),(6,1767,170,2365,1,''),(6,1768,170,2365,1,''),(6,1769,170,2365,1,''),(6,1770,170,2365,1,''),(6,1771,170,2365,1,''),(6,1772,170,2365,1,''),(6,1773,170,2365,1,''),(6,1774,170,2365,1,''),(6,1775,170,2365,1,''),(6,1776,170,2365,1,''),(6,1777,170,2365,1,''),(6,1778,170,2365,1,''),(6,1779,170,2365,1,''),(6,1780,170,2365,1,''),(6,1781,170,2365,1,''),(6,1782,171,2365,1,''),(6,1783,171,2365,1,''),(6,1784,171,2365,1,''),(6,1785,171,2365,1,''),(6,1786,171,2365,1,''),(6,1787,171,2365,1,''),(6,1788,171,2365,1,''),(6,1789,171,2365,1,''),(6,1790,171,2365,1,''),(6,1791,171,2365,1,''),(6,1792,171,2365,1,''),(6,1793,171,2365,1,''),(6,1794,171,2365,1,''),(6,1795,171,2365,1,''),(6,1796,171,2365,1,''),(6,1797,171,2365,1,''),(6,1798,171,2365,1,''),(6,1799,171,2365,1,''),(6,1800,171,2365,1,''),(6,1801,171,2365,1,''),(6,1802,171,2365,1,''),(6,1803,171,2365,1,''),(6,1804,171,2365,1,''),(6,1805,171,2365,1,''),(6,1806,172,2365,1,''),(6,1807,172,2365,1,''),(6,1808,172,2365,1,''),(6,1809,172,2365,1,''),(6,1810,172,2365,1,''),(6,1811,172,2365,1,''),(6,1812,172,2365,1,''),(6,1813,172,2365,1,''),(6,1814,172,2365,1,''),(6,1815,172,2365,1,''),(6,1816,172,2365,1,''),(6,1817,172,2365,1,''),(6,1818,172,2365,1,''),(6,1819,172,2365,1,''),(6,1820,172,2365,1,''),(6,1821,172,2365,1,''),(6,1822,172,2365,1,''),(6,1823,172,2365,1,''),(6,1824,172,2365,1,''),(6,1825,172,2365,1,''),(6,1826,172,2365,1,''),(6,1827,172,2365,1,''),(6,1828,172,2365,1,''),(6,1829,172,2365,1,''),(6,1830,173,2365,1,''),(6,1831,173,2365,1,''),(6,1832,173,2365,1,''),(6,1833,173,2365,1,''),(6,1834,173,2365,1,''),(6,1835,173,2365,1,''),(6,1836,173,2365,1,''),(6,1837,173,2365,1,''),(6,1838,173,2365,1,''),(6,1839,173,2365,1,''),(6,1840,173,2365,1,''),(6,1841,173,2365,1,''),(6,1842,173,2365,1,''),(6,1843,173,2365,1,''),(6,1844,173,2365,1,''),(6,1845,173,2365,1,''),(6,1846,173,2365,1,''),(6,1847,173,2365,1,''),(6,1848,173,2365,1,''),(6,1849,173,2365,1,''),(6,1850,173,2365,1,''),(6,1851,173,2365,1,''),(6,1852,173,2365,1,''),(6,1853,173,2365,1,''),(6,1854,174,2365,1,''),(6,1855,174,2365,1,''),(6,1856,174,2365,1,''),(6,1857,174,2365,1,''),(6,1858,174,2365,1,''),(6,1859,174,2365,1,''),(6,1860,174,2365,1,''),(6,1861,174,2365,1,''),(6,1862,174,2365,1,''),(6,1863,174,2365,1,''),(6,1864,174,2365,1,''),(6,1865,174,2365,1,''),(6,1866,174,2365,1,''),(6,1867,174,2365,1,''),(6,1868,174,2365,1,''),(6,1869,174,2365,1,''),(6,1870,174,2365,1,''),(6,1871,174,2365,1,''),(6,1872,174,2365,1,''),(6,1873,174,2365,1,''),(6,1874,174,2365,1,''),(6,1875,174,2365,1,''),(6,1876,174,2365,1,''),(6,1877,174,2365,1,''),(6,1878,175,2365,1,''),(6,1879,175,2365,1,''),(6,1880,175,2365,1,''),(6,1881,175,2365,1,''),(6,1882,175,2365,1,''),(6,1883,175,2365,1,''),(6,1884,175,2365,1,''),(6,1885,175,2365,1,''),(6,1886,175,2365,1,''),(6,1887,175,2365,1,''),(6,1888,175,2365,1,''),(6,1889,175,2365,1,''),(6,1890,175,2365,1,''),(6,1891,175,2365,1,''),(6,1892,175,2365,1,''),(6,1893,175,2365,1,''),(6,1894,175,2365,1,''),(6,1895,175,2365,1,''),(6,1896,175,2365,1,''),(6,1897,175,2365,1,''),(6,1898,175,2365,1,''),(6,1899,175,2365,1,''),(6,1900,175,2365,1,''),(6,1901,175,2365,1,''),(6,1902,176,2365,1,''),(6,1903,176,2365,1,''),(6,1904,176,2365,1,''),(6,1905,176,2365,1,''),(6,1906,176,2365,1,''),(6,1907,176,2365,1,''),(6,1908,176,2365,1,''),(6,1909,176,2365,1,''),(6,1910,176,2365,1,''),(6,1911,176,2365,1,''),(6,1912,176,2365,1,''),(6,1913,176,2365,1,''),(6,1914,176,2365,1,''),(6,1915,176,2365,1,''),(6,1916,176,2365,1,''),(6,1917,176,2365,1,''),(6,1918,176,2365,1,''),(6,1919,176,2365,1,''),(6,1920,176,2365,1,''),(6,1921,176,2365,1,''),(6,1922,176,2365,1,''),(6,1923,176,2365,1,''),(6,1924,176,2365,1,''),(6,1925,176,2365,1,''),(6,1926,177,2365,1,''),(6,1927,177,2365,1,''),(6,1928,177,2365,1,''),(6,1929,177,2365,1,''),(6,1930,177,2365,1,''),(6,1931,177,2365,1,''),(6,1932,177,2365,1,''),(6,1933,177,2365,1,''),(6,1934,177,2365,1,''),(6,1935,177,2365,1,''),(6,1936,177,2365,1,''),(6,1937,177,2365,1,''),(6,1938,177,2365,1,''),(6,1939,177,2365,1,''),(6,1940,177,2365,1,''),(6,1941,177,2365,1,''),(6,1942,177,2365,1,''),(6,1943,177,2365,1,''),(6,1944,177,2365,1,''),(6,1945,177,2365,1,''),(6,1946,177,2365,1,''),(6,1947,177,2365,1,''),(6,1948,177,2365,1,''),(6,1949,177,2365,1,''),(6,1950,178,2365,1,''),(6,1951,178,2365,1,''),(6,1952,178,2365,1,''),(6,1953,178,2365,1,''),(6,1954,178,2365,1,''),(6,1955,178,2365,1,''),(6,1956,178,2365,1,''),(6,1957,178,2365,1,''),(6,1958,178,2365,1,''),(6,1959,178,2365,1,''),(6,1960,178,2365,1,''),(6,1961,178,2365,1,''),(6,1962,178,2365,1,''),(6,1963,178,2365,1,''),(6,1964,178,2365,1,''),(6,1965,178,2365,1,''),(6,1966,178,2365,1,''),(6,1967,178,2365,1,''),(6,1968,178,2365,1,''),(6,1969,178,2365,1,''),(6,1970,178,2365,1,''),(6,1971,178,2365,1,''),(6,1972,178,2365,1,''),(6,1973,178,2365,1,''),(6,1974,179,2365,1,''),(6,1975,179,2365,1,''),(6,1976,179,2365,1,''),(6,1977,179,2365,1,''),(6,1978,179,2365,1,''),(6,1979,179,2365,1,''),(6,1980,179,2365,1,''),(6,1981,179,2365,1,''),(6,1982,179,2365,1,''),(6,1983,179,2365,1,''),(6,1984,179,2365,1,''),(6,1985,179,2365,1,''),(6,1986,179,2365,1,''),(6,1987,179,2365,1,''),(6,1988,179,2365,1,''),(6,1989,179,2365,1,''),(6,1990,179,2365,1,''),(6,1991,179,2365,1,''),(6,1992,179,2365,1,''),(6,1993,179,2365,1,''),(6,1994,179,2365,1,''),(6,1995,179,2365,1,''),(6,1996,179,2365,1,''),(6,1997,179,2365,1,''),(6,1998,180,2365,1,''),(6,1999,180,2365,1,''),(6,2000,180,2365,1,''),(6,2001,180,2365,1,''),(6,2002,180,2365,1,''),(6,2003,180,2365,1,''),(6,2004,180,2365,1,''),(6,2005,180,2365,1,''),(6,2006,180,2365,1,''),(6,2007,180,2365,1,''),(6,2008,180,2365,1,''),(6,2009,180,2365,1,''),(6,2010,180,2365,1,''),(6,2011,180,2365,1,''),(6,2012,180,2365,1,''),(6,2013,180,2365,1,''),(6,2014,180,2365,1,''),(6,2015,180,2365,1,''),(6,2016,180,2365,1,''),(6,2017,180,2365,1,''),(6,2018,180,2365,1,''),(6,2019,180,2365,1,''),(6,2020,180,2365,1,''),(6,2021,180,2365,1,''),(6,2022,181,2365,1,''),(6,2023,181,2365,1,''),(6,2024,181,2365,1,''),(6,2025,181,2365,1,''),(6,2026,181,2365,1,''),(6,2027,181,2365,1,''),(6,2028,181,2365,1,''),(6,2029,181,2365,1,''),(6,2030,181,2365,1,''),(6,2031,181,2365,1,''),(6,2032,181,2365,1,''),(6,2033,181,2365,1,''),(6,2034,181,2365,1,''),(6,2035,181,2365,1,''),(6,2036,181,2365,1,''),(6,2037,181,2365,1,''),(6,2038,181,2365,1,''),(6,2039,181,2365,1,''),(6,2040,181,2365,1,''),(6,2041,181,2365,1,''),(6,2042,181,2365,1,''),(6,2043,181,2365,1,''),(6,2044,181,2365,1,''),(6,2045,181,2365,1,''),(6,2046,182,2365,1,''),(6,2047,182,2365,1,''),(6,2048,182,2365,1,''),(6,2049,182,2365,1,''),(6,2050,182,2365,1,''),(6,2051,182,2365,1,''),(6,2052,182,2365,1,''),(6,2053,182,2365,1,''),(6,2054,182,2365,1,''),(6,2055,182,2365,1,''),(6,2056,182,2365,1,''),(6,2057,182,2365,1,''),(6,2058,182,2365,1,''),(6,2059,182,2365,1,''),(6,2060,182,2365,1,''),(6,2061,182,2365,1,''),(6,2062,182,2365,1,''),(6,2063,182,2365,1,''),(6,2064,182,2365,1,''),(6,2065,182,2365,1,''),(6,2066,182,2365,1,''),(6,2067,182,2365,1,''),(6,2068,182,2365,1,''),(6,2069,182,2365,1,''),(6,2070,183,2365,1,''),(6,2071,183,2365,1,''),(6,2072,183,2365,1,''),(6,2073,183,2365,1,''),(6,2074,183,2365,1,''),(6,2075,183,2365,1,''),(6,2076,183,2365,1,''),(6,2077,183,2365,1,''),(6,2078,183,2365,1,''),(6,2079,183,2365,1,''),(6,2080,183,2365,1,''),(6,2081,183,2365,1,''),(6,2082,183,2365,1,''),(6,2083,183,2365,1,''),(7,101,2,2470,1,''),(7,102,2,7417,1,''),(7,103,2,7382,1,''),(7,104,2,7407,1,''),(7,105,2,7411,1,''),(7,106,2,8926,1,''),(7,107,2,2514,1,''),(7,108,2,2472,1,''),(7,109,2,2520,1,''),(7,110,2,8930,1,''),(7,111,2,8885,1,''),(7,112,2,8918,1,''),(10,101,1,7636,8,''),(10,102,1,2148,66,'B'),(10,103,2,2187,1,''),(10,104,2,2145,2,''),(10,105,2,2187,1,''),(10,106,2,2434,1,''),(10,107,2,2392,1,''),(10,108,2,2480,1,''),(10,109,2,2187,1,''),(10,110,2,5877,1,''),(10,111,2,2146,1,''),(10,112,2,5920,5,''),(10,113,2,5882,1,''),(13,101,1,2498,1,''),(13,102,1,2528,1,''),(13,103,1,7389,1,''),(13,104,1,7380,1,''),(13,105,1,2392,1,''),(13,106,1,2392,1,''),(13,107,1,2392,1,''),(13,108,1,2392,1,''),(13,109,1,2392,1,''),(13,110,1,2492,1,''),(13,111,1,2528,1,''),(13,112,1,2392,1,''),(13,113,1,2392,1,''),(13,114,1,2528,1,''),(13,115,1,2392,1,''),(13,116,1,2392,1,''),(20,101,1,2173,1,'\0'),(20,102,1,2173,1,'\0'),(20,103,1,7380,1,''),(20,104,1,2645,1,''),(20,105,1,7378,2,''),(21,101,2,2152,1,''),(21,102,2,2160,2,''),(21,103,2,2152,100,'d'),(21,104,2,2148,1,''),(43,101,1,26148,1,''),(63,101,1,2358,1,''),(63,102,1,2488,1,''),(63,103,1,11301,1,''),(63,104,1,7620,24,''),(63,105,1,2480,1,''),(63,106,2,20132,1,''),(63,107,2,2392,1,''),(63,108,2,2487,1,''),(63,109,2,2519,1,''),(63,110,2,2392,1,''),(63,111,2,2430,1,''),(63,112,2,2476,1,''),(63,113,2,5807,1,'l\0It is given to the courageous victor of the barbarian arena in greenhorn difficulty. Awarded to Panca Junior'),(63,114,2,7392,1,''),(63,115,2,7589,90,'Z'),(63,116,2,12448,1,''),(65,101,1,5925,2,''),(65,102,1,22532,1,''),(65,103,1,5880,2,''),(65,104,1,7407,1,''),(65,105,1,11306,1,''),(65,106,1,9971,1,''),(65,107,1,7407,1,''),(65,108,1,22533,9,'	'),(65,109,1,7418,1,''),(65,110,1,22534,3,''),(65,111,1,7885,1,''),(65,112,1,7454,1,''),(65,113,1,7413,1,''),(65,114,1,7404,1,''),(65,115,1,5893,16,''),(65,116,1,2150,12,''),(65,117,1,5930,1,''),(65,118,1,2519,1,''),(65,119,1,2476,1,''),(65,120,1,2430,1,''),(65,121,1,2392,1,''),(65,122,1,2434,1,''),(65,123,1,11113,2,''),(65,124,1,2493,1,''),(65,125,1,5906,10,'\n'),(65,126,1,2536,1,''),(65,127,1,2520,1,''),(65,128,1,7434,1,''),(65,129,1,2525,1,''),(65,130,1,11196,1,''),(65,131,1,11199,4,''),(65,132,1,2177,1,''),(65,133,1,2146,7,''),(65,134,1,7380,1,''),(65,135,1,7389,1,''),(65,136,1,2425,1,''),(65,137,1,10609,1,''),(65,138,1,8602,1,''),(65,139,1,2439,1,''),(65,140,1,10574,3,''),(65,141,2,5805,1,'e\0It is given to the courageous victor of the barbarian arena in warlord difficulty. Awarded to Cjaker.'),(65,142,2,5806,1,'f\0It is given to the courageous victor of the barbarian arena in scrapper difficulty. Awarded to Cjaker.'),(65,143,2,5807,1,'f\0It is given to the courageous victor of the barbarian arena in greenhorn difficulty. Awarded to Cjaker');
/*!40000 ALTER TABLE `player_depotitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_former_names`
--

DROP TABLE IF EXISTS `player_former_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_former_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `former_name` varchar(35) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_former_names`
--

LOCK TABLES `player_former_names` WRITE;
/*!40000 ALTER TABLE `player_former_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_former_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_inboxitems`
--

DROP TABLE IF EXISTS `player_inboxitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_inboxitems`
--

LOCK TABLES `player_inboxitems` WRITE;
/*!40000 ALTER TABLE `player_inboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_inboxitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_items`
--

DROP TABLE IF EXISTS `player_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL DEFAULT '0',
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  KEY `player_id` (`player_id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_items`
--

LOCK TABLES `player_items` WRITE;
/*!40000 ALTER TABLE `player_items` DISABLE KEYS */;
INSERT INTO `player_items` VALUES (19,11,101,26052,1,''),(30,2,101,2661,1,''),(30,3,102,1988,1,''),(30,6,103,8602,1,''),(30,8,104,2643,1,''),(30,11,105,26052,1,''),(30,102,106,2195,1,''),(30,102,107,5942,1,''),(30,102,108,2120,1,''),(30,102,109,7618,1,''),(30,102,110,2554,1,''),(30,102,111,2439,1,''),(34,1,101,2502,1,''),(34,2,102,2173,1,'\0'),(34,3,103,1988,1,''),(34,4,104,25174,1,''),(34,5,105,2523,1,''),(34,6,106,8931,1,''),(34,7,107,15412,1,''),(34,8,108,2195,1,''),(34,11,109,26052,1,''),(34,103,110,7383,1,''),(34,103,111,7635,7,''),(34,103,112,22606,1,''),(34,103,113,5929,1,''),(34,103,114,22400,1,''),(34,103,115,22613,1,''),(34,103,116,18415,1,''),(34,103,117,2158,1,''),(34,103,118,2160,96,'`'),(34,103,119,2365,1,''),(34,103,120,10519,1,''),(34,103,121,5942,1,''),(34,103,122,2554,1,''),(34,103,123,2120,1,''),(34,119,124,2495,1,''),(34,119,125,22397,1,''),(34,119,126,18416,4,''),(34,119,127,22610,1,''),(34,119,128,22416,1,''),(34,119,129,22400,1,''),(34,119,130,11262,1,''),(34,119,131,5914,1,''),(34,119,132,18418,25,''),(34,119,133,18414,30,''),(34,119,134,22612,1,''),(34,119,135,7899,1,''),(34,119,136,11260,2,''),(34,119,137,22608,1,''),(34,119,138,22611,1,''),(34,119,139,2365,1,''),(34,120,140,5911,1,''),(34,120,141,22608,1,''),(34,120,142,22614,1,''),(34,120,143,22613,1,''),(34,120,144,22611,1,''),(34,120,145,22598,3,''),(34,120,146,18415,5,''),(34,120,147,11261,1,''),(34,120,148,7899,1,''),(34,120,149,2195,1,''),(34,120,150,6529,1,''),(34,120,151,2158,1,''),(34,120,152,18414,11,''),(34,120,153,7899,1,''),(34,120,154,22608,1,''),(34,120,155,11258,1,''),(34,120,156,2168,1,''),(34,120,157,22613,1,''),(34,120,158,10519,1,''),(34,139,159,5954,1,''),(34,139,160,2365,1,''),(34,158,161,26199,1,''),(34,158,162,25176,1,''),(34,158,163,25412,1,''),(34,158,164,2390,1,''),(34,158,165,18410,1,''),(34,158,166,2408,1,''),(34,158,167,22598,2,''),(34,158,168,7899,1,''),(34,158,169,22614,1,''),(34,158,170,11258,1,''),(34,158,171,18418,7,''),(34,158,172,22397,1,''),(34,158,173,2158,1,''),(34,158,174,5914,1,''),(34,158,175,7632,1,''),(34,158,176,10519,1,''),(34,176,177,8473,51,'3'),(34,176,178,8473,100,'d'),(34,176,179,8473,100,'d'),(34,176,180,8473,100,'d'),(34,176,181,7620,52,'4'),(34,176,182,7620,100,'d'),(34,176,183,7620,100,'d'),(34,176,184,7620,100,'d'),(34,176,185,7620,100,'d'),(34,176,186,7620,100,'d'),(34,176,187,7620,100,'d'),(34,176,188,7620,100,'d'),(34,176,189,7620,100,'d'),(34,176,190,7620,100,'d'),(34,176,191,7620,100,'d'),(34,176,192,7620,100,'d'),(34,176,193,7620,100,'d'),(34,176,194,7620,100,'d'),(34,176,195,8473,100,'d'),(34,176,196,8473,100,'d'),(25,1,101,2480,1,''),(25,2,102,2661,1,''),(25,3,103,1988,1,''),(25,4,104,2465,1,''),(25,5,105,2525,1,''),(25,6,106,8602,1,''),(25,7,107,2478,1,''),(25,8,108,2195,1,''),(25,11,109,26052,1,''),(25,103,110,2643,1,''),(25,103,111,5880,100,'d'),(25,103,112,5892,1,''),(25,103,113,7636,1,''),(25,103,114,2160,100,'d'),(25,103,115,5942,1,''),(25,103,116,2412,1,''),(25,103,117,2554,1,''),(25,103,118,2120,1,''),(25,103,119,2439,1,''),(27,1,101,2480,1,''),(27,2,102,2661,1,''),(27,3,103,1987,1,''),(27,4,104,2464,1,''),(27,5,105,2510,1,''),(27,7,106,2468,1,''),(27,11,107,26052,1,''),(27,103,108,7589,10,'\n'),(27,107,109,26377,1,''),(31,1,101,2471,1,'\"m\0{[1] = \"Powerful Precision\",[2] = \"Powerful Void\",[4] = 65460,[5] = 65460,[7] = 1520221115,[8] = 1520221115,}'),(31,2,102,8266,1,''),(31,3,103,1988,1,''),(31,4,104,15407,1,'\"t\0{[1] = \"Powerful Vampirism\",[2] = \"Powerful Hide Dragon\",[4] = 63300,[5] = 63300,[7] = 1520221115,[8] = 1520221115,}'),(31,6,105,16111,1,'\"�\0{[1] = \"Powerful Strike\",[2] = \"Powerful Void\",[3] = \"Powerful Vampirism\",[4] = 65820,[5] = 65820,[6] = 65820,[7] = 1520221115,[8] = 1520221115,[9] = 1520221115,}'),(31,7,106,18405,1,''),(31,8,107,2646,1,'\":\0{[1] = \"Powerful Swiftness\",[4] = 51300,[7] = 1520221111,}'),(31,9,108,21693,1,''),(31,10,109,6529,100,'d'),(31,11,110,26052,1,''),(31,103,111,19742,50,'2'),(31,103,112,7383,1,''),(31,103,113,26401,1,''),(31,103,114,26399,1,''),(31,103,115,26406,1,''),(31,103,116,26654,92,'\\'),(31,103,117,2152,4,''),(31,103,118,1988,1,''),(31,103,119,18422,2,''),(31,103,120,18457,30,''),(31,103,121,2522,1,''),(31,103,122,2365,1,''),(31,103,123,2358,1,''),(31,103,124,2520,1,''),(31,103,125,7635,100,'d'),(31,103,126,6500,2,''),(31,103,127,23782,1,''),(31,103,128,1988,1,''),(31,103,129,5942,1,''),(31,110,130,7620,10,'\n'),(31,110,131,26377,1,''),(31,118,132,13939,99,'c'),(31,118,133,13939,100,'d'),(31,118,134,7635,3,''),(31,118,135,12437,45,'-'),(31,118,136,10502,1,'A\0Daniel Paladino & CipSoft forever - married on February 22, 2018.'),(31,118,137,18219,1,''),(31,118,138,8473,1,''),(31,118,139,10577,1,''),(31,118,140,11229,2,''),(31,118,141,11223,3,''),(31,118,142,6500,3,''),(31,118,143,5944,3,''),(31,118,144,2179,1,''),(31,118,145,1988,1,''),(31,122,146,10609,1,''),(31,122,147,2696,1,''),(31,122,148,6529,84,'T'),(31,122,149,6529,100,'d'),(31,122,150,6529,100,'d'),(31,122,151,6529,100,'d'),(31,122,152,6529,100,'d'),(31,122,153,6529,100,'d'),(31,122,154,6529,100,'d'),(31,122,155,6529,100,'d'),(31,122,156,6529,100,'d'),(31,127,157,2274,100,'d'),(31,127,158,2293,91,'['),(31,127,159,2274,100,'d'),(31,127,160,2305,84,'T'),(31,127,161,2305,100,'d'),(31,127,162,2303,93,']'),(31,127,163,2293,100,'d'),(31,127,164,23782,1,''),(31,128,165,2195,1,''),(31,128,166,2646,1,'\"1\0{[1] = \"Powerful Swiftness\",[4] = 72000,[7] = 0,}'),(31,128,167,15407,1,'\"b\0{[1] = \"Powerful Vampirism\",[2] = \"Powerful Hide Dragon\",[4] = 72000,[5] = 72000,[7] = 0,[8] = 0,}'),(31,128,168,2471,1,'\"[\0{[1] = \"Powerful Precision\",[2] = \"Powerful Void\",[4] = 72000,[5] = 72000,[7] = 0,[8] = 0,}'),(31,128,169,16111,1,'\"�\0{[1] = \"Powerful Strike\",[2] = \"Powerful Vampirism\",[3] = \"Powerful Void\",[4] = 72000,[5] = 72000,[6] = 72000,[7] = 0,[8] = 0,[9] = 0,}'),(31,164,170,7635,66,'B'),(31,164,171,7635,100,'d'),(31,164,172,7635,100,'d'),(31,164,173,2279,100,'d'),(31,164,174,2279,100,'d'),(31,164,175,2279,100,'d'),(31,164,176,2289,99,'c'),(31,164,177,2289,100,'d'),(31,164,178,2289,100,'d'),(31,164,179,2303,96,'`'),(31,164,180,2262,98,'b'),(31,164,181,2262,100,'d'),(31,164,182,2262,100,'d'),(31,164,183,2286,95,'_'),(31,164,184,2286,100,'d'),(31,164,185,2286,100,'d'),(31,164,186,2261,100,'d'),(31,164,187,2261,100,'d'),(31,164,188,2274,100,'d'),(24,1,101,5903,1,''),(24,2,102,2661,1,''),(24,3,103,1987,1,''),(24,5,104,2175,1,''),(24,6,105,7383,1,''),(24,7,106,2468,1,''),(24,8,107,2195,1,''),(24,11,108,26052,1,''),(24,103,109,26654,1,''),(24,103,110,26654,1,''),(24,103,111,26654,1,''),(24,103,112,26654,1,''),(24,103,113,26654,1,''),(24,103,114,26654,1,''),(24,103,115,9778,1,'\"-\0{[1] = \"Basic Epiphany\",[4] = 72000,[7] = 0,}'),(24,103,116,26654,95,'_'),(32,2,101,2661,1,''),(32,3,102,1987,1,''),(32,5,103,2525,1,''),(32,6,104,2190,1,''),(32,11,105,26052,1,''),(32,102,106,2160,98,'b'),(32,102,107,2468,1,''),(32,102,108,8820,1,''),(32,102,109,8819,1,''),(32,102,110,2175,1,''),(32,102,111,2554,1,''),(32,102,112,2120,1,''),(23,1,101,2480,1,''),(23,3,102,1987,1,''),(23,6,103,7383,1,''),(23,7,104,2468,1,''),(23,8,105,2195,1,''),(23,11,106,26052,1,''),(23,102,107,18559,1,''),(23,102,108,26401,1,''),(23,102,109,26399,1,''),(23,102,110,26406,1,''),(23,102,111,26654,46,'.'),(23,102,112,19742,50,'2'),(35,3,101,1987,1,''),(35,11,102,26052,1,''),(37,1,101,2460,1,''),(37,2,102,2661,1,''),(37,3,103,1988,1,''),(37,4,104,2650,1,''),(37,5,105,2525,1,''),(37,6,106,7383,1,''),(37,7,107,2478,1,''),(37,8,108,2195,1,''),(37,11,109,26052,1,''),(37,103,110,26401,1,''),(37,103,111,26399,1,''),(37,103,112,26401,1,''),(37,103,113,26406,1,''),(37,103,114,2643,1,''),(37,103,115,7636,1,''),(37,103,116,26654,1,''),(37,103,117,5942,1,''),(37,103,118,12437,6,''),(37,103,119,18559,1,''),(37,103,120,2554,1,''),(37,103,121,2120,1,''),(37,103,122,8602,1,''),(39,1,101,2480,1,''),(39,3,102,1987,1,''),(39,4,103,2464,1,''),(39,5,104,2510,1,''),(39,6,105,2412,1,''),(39,7,106,2468,1,''),(39,8,107,2643,1,''),(39,11,108,26052,1,''),(39,102,109,2554,1,''),(39,102,110,2666,1,''),(39,102,111,2120,1,''),(28,1,101,2480,1,''),(28,3,102,1987,1,''),(28,5,103,2510,1,''),(28,6,104,2412,1,''),(28,7,105,2468,1,''),(28,8,106,2643,1,''),(28,11,107,26052,1,''),(28,102,108,5880,100,'d'),(28,102,109,5892,1,''),(28,102,110,2148,80,'P'),(28,102,111,2152,47,'/'),(33,3,101,1987,1,''),(33,11,102,26052,1,''),(38,1,101,2480,1,''),(38,3,102,1987,1,''),(38,4,103,2464,1,''),(38,5,104,2510,1,''),(38,6,105,2412,1,''),(38,7,106,2468,1,''),(38,8,107,2643,1,''),(38,11,108,26052,1,''),(38,102,109,2554,1,''),(38,102,110,2666,1,''),(38,102,111,2120,1,''),(40,1,101,2480,1,''),(40,3,102,1987,1,''),(40,4,103,2464,1,''),(40,5,104,2510,1,''),(40,6,105,2412,1,''),(40,7,106,2468,1,''),(40,8,107,2643,1,''),(40,11,108,26052,1,''),(40,102,109,2554,1,''),(40,102,110,2666,1,''),(40,102,111,2120,1,''),(22,2,101,2661,1,''),(22,3,102,5801,1,''),(22,5,103,2510,1,''),(22,6,104,7383,1,''),(22,8,105,2195,1,''),(22,11,106,26052,1,''),(22,102,107,26480,1,''),(22,102,108,26480,1,''),(22,102,109,26480,1,''),(22,102,110,26478,1,''),(22,102,111,2152,8,''),(22,102,112,11213,50,'2'),(22,102,113,7590,1,''),(22,102,114,25172,2,''),(22,102,115,8930,1,''),(22,102,116,2148,78,'N'),(22,102,117,2120,1,''),(22,102,118,2554,1,''),(22,102,119,2160,11,''),(22,102,120,11243,1,''),(22,120,121,26406,1,''),(22,120,122,26401,1,''),(22,120,123,26399,1,''),(22,120,124,5942,1,''),(22,120,125,11134,1,''),(22,120,126,2553,1,''),(22,120,127,7494,1,''),(22,120,128,12643,1,''),(22,120,129,9778,1,''),(22,120,130,9690,5,''),(22,120,131,26654,30,''),(22,120,132,5944,4,''),(22,120,133,12318,1,''),(29,1,101,2471,1,'\"l\0{[1] = \"Powerful Void\",[2] = \"Powerful Blockade\",[4] = 61320,[5] = 61320,[7] = 1521825682,[8] = 1521825682,}'),(29,2,102,21691,1,''),(29,3,103,27061,1,''),(29,4,104,2503,1,'\"t\0{[1] = \"Powerful Vampirism\",[2] = \"Powerful Lich Shroud\",[4] = 67020,[5] = 67020,[7] = 1521825712,[8] = 1521825712,}'),(29,5,105,2522,1,'\"<\0{[1] = \"Powerful Hide Dragon\",[4] = 70080,[7] = 1521825686,}'),(29,6,106,7383,1,''),(29,7,107,2469,1,''),(29,8,108,2646,1,'\":\0{[1] = \"Powerful Swiftness\",[4] = 58440,[7] = 1521825678,}'),(29,10,109,21703,1,''),(29,11,110,26052,1,''),(29,103,111,2148,50,'2'),(29,103,112,2152,52,'4'),(29,103,113,29002,1,''),(29,103,114,19742,50,'2'),(29,103,115,12437,50,'2'),(29,103,116,7383,1,''),(29,103,117,2278,100,'d'),(29,103,118,2268,56,'8'),(29,103,119,2268,99,'c'),(29,103,120,2268,100,'d'),(29,103,121,2269,100,'d'),(29,103,122,2293,98,'b'),(29,103,123,2789,26,'\Z'),(29,103,124,2268,100,'d'),(29,103,125,2167,1,''),(29,103,126,20620,1,''),(29,103,127,20620,1,''),(29,110,128,26029,10,'\n'),(29,110,129,26377,1,''),(29,126,130,26406,1,''),(29,126,131,26401,1,''),(29,126,132,26399,1,''),(29,126,133,7635,3,''),(29,126,134,7635,100,'d'),(29,126,135,26029,91,'['),(29,126,136,26029,100,'d'),(29,126,137,26029,100,'d'),(29,126,138,26029,100,'d'),(29,126,139,26029,100,'d'),(29,127,140,2160,65,'A'),(29,127,141,2160,100,'d'),(29,127,142,2160,100,'d'),(29,127,143,2160,100,'d'),(29,127,144,2160,100,'d'),(29,127,145,2160,100,'d'),(29,127,146,2392,1,''),(21,1,101,2493,1,'\"i\0{[1] = \"Powerful Void\",[2] = \"Powerful Slash\",[4] = 42720,[5] = 42720,[7] = 1521859681,[8] = 1521859681,}'),(21,2,102,2661,1,''),(21,3,103,1988,1,''),(21,4,104,2494,1,'\"t\0{[1] = \"Powerful Vampirism\",[2] = \"Powerful Lich Shroud\",[4] = 38520,[5] = 38520,[7] = 1521859681,[8] = 1521859681,}'),(21,6,105,7383,1,''),(21,7,106,2495,1,''),(21,8,107,2195,1,''),(21,10,108,2361,1,''),(21,11,109,26052,1,''),(21,103,110,2667,42,'*'),(21,103,111,2089,1,'\�'),(21,103,112,7620,10,'\n'),(21,103,113,2393,1,''),(21,103,114,2438,1,''),(21,103,115,2293,93,']'),(21,103,116,2313,99,'c'),(21,103,117,22396,2,''),(21,103,118,25377,1,''),(21,103,119,25172,1,''),(21,103,120,27632,1,''),(21,103,121,2152,1,''),(21,103,122,26478,1,''),(21,103,123,26480,1,''),(21,103,124,26480,1,''),(21,103,125,26480,1,''),(21,103,126,26401,1,''),(21,103,127,26406,1,''),(21,103,128,5801,1,''),(21,109,129,26031,10,'\n'),(21,109,130,7591,10,'\n'),(21,128,131,5801,1,''),(21,128,132,2301,90,'Z'),(21,128,133,2293,94,'^'),(21,128,134,2152,34,'\"'),(21,128,135,2160,1,''),(21,128,136,25377,3,''),(21,128,137,2149,5,''),(21,128,138,26478,1,''),(21,128,139,22516,1,''),(21,128,140,19742,50,'2'),(21,128,141,11243,1,''),(21,128,142,26654,92,'\\'),(21,128,143,22604,1,''),(21,128,144,5942,1,''),(21,128,145,7618,55,'7'),(21,128,146,2549,1,''),(21,128,147,2553,1,''),(21,128,148,2088,1,'�'),(21,128,149,2554,1,''),(21,131,150,5710,1,''),(21,131,151,5468,1,''),(21,131,152,10033,7,''),(21,131,153,10034,1,''),(21,131,154,10034,1,''),(21,131,155,8309,50,'2'),(21,131,156,2557,1,''),(21,131,157,5901,54,'6'),(21,131,158,10033,100,'d'),(21,131,159,2558,1,''),(21,131,160,10034,1,''),(21,131,161,10511,1,''),(21,131,162,5801,1,''),(21,141,163,27632,1,''),(21,141,164,2148,21,''),(21,141,165,2393,1,'\"J\0{[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0,[9] = 0,}'),(21,141,166,2520,1,''),(21,141,167,26406,1,''),(21,141,168,26401,1,''),(21,141,169,26399,1,''),(21,141,170,2147,7,''),(21,141,171,2536,1,''),(21,141,172,1988,1,''),(21,141,173,11134,1,''),(21,141,174,11076,1,''),(21,141,175,2195,1,''),(21,141,176,2472,1,''),(21,141,177,9776,1,''),(21,141,178,9778,1,''),(21,141,179,2522,1,''),(21,162,180,5941,1,''),(21,162,181,18559,1,''),(21,162,182,7498,1,''),(21,162,183,7494,1,''),(21,162,184,2006,0,'\0'),(21,162,185,9778,1,''),(21,162,186,9933,1,''),(21,162,187,2033,0,'\0'),(21,162,188,2553,1,''),(21,162,189,9933,1,''),(21,162,190,9970,3,''),(21,162,191,9971,1,''),(21,162,192,5461,1,''),(21,162,193,12643,1,''),(21,162,194,11243,1,''),(21,162,195,12629,3,''),(21,172,196,9778,1,''),(21,172,197,2646,1,''),(21,172,198,2447,1,''),(21,172,199,8884,1,''),(21,172,200,7433,1,''),(21,172,201,7405,1,''),(21,172,202,7423,1,''),(21,172,203,8926,1,''),(21,172,204,8918,1,''),(21,172,205,8868,1,''),(21,172,206,2539,1,''),(21,172,207,2542,1,''),(21,172,208,8885,1,''),(21,172,209,12646,1,''),(21,172,210,12318,1,''),(21,172,211,5942,1,''),(21,172,212,7618,1,''),(21,194,213,4869,1,''),(21,194,214,7380,1,''),(21,194,215,1988,1,''),(21,194,216,7389,1,''),(21,215,217,1987,1,''),(21,215,218,12318,1,''),(21,215,219,11260,1,''),(21,215,220,12382,1,''),(21,215,221,12328,1,''),(21,215,222,12320,1,''),(21,215,223,2553,1,''),(21,215,224,5908,1,''),(21,215,225,2554,1,''),(21,215,226,12284,1,''),(21,215,227,9778,1,''),(21,215,228,8918,1,''),(21,215,229,10021,1,''),(21,215,230,2549,1,''),(21,215,231,11116,1,''),(21,215,232,11134,1,''),(21,215,233,2420,1,''),(21,217,234,12651,1,''),(21,217,235,2158,1,''),(21,217,236,2144,10,'\n'),(21,217,237,9971,5,''),(21,217,238,5882,10,'\n'),(26,1,101,2480,1,''),(26,2,102,2661,1,''),(26,3,103,1987,1,''),(26,4,104,2464,1,''),(26,7,105,2468,1,''),(26,8,106,2643,1,''),(26,11,107,26052,1,''),(26,103,108,27628,1,''),(26,103,109,2525,1,''),(26,103,110,8601,1,''),(26,103,111,2412,1,''),(26,103,112,2553,1,''),(26,103,113,2554,1,''),(26,103,114,2120,1,''),(26,107,115,26031,10,'\n'),(26,107,116,2358,1,''),(56,1,101,2480,1,''),(56,2,102,2661,1,''),(56,3,103,1988,1,''),(56,4,104,2492,1,''),(56,6,105,22421,1,''),(56,7,106,9777,1,''),(56,8,107,2195,1,''),(56,11,108,26052,1,''),(56,103,109,2160,100,'d'),(56,103,110,2160,100,'d'),(56,103,111,2160,100,'d'),(56,103,112,2358,1,''),(62,1,101,8820,1,''),(62,2,102,2661,1,''),(62,3,103,1988,1,''),(62,4,104,8819,1,''),(62,5,105,2175,1,''),(62,6,106,2182,1,''),(62,7,107,2468,1,''),(62,8,108,2643,1,''),(62,11,109,26052,1,''),(62,103,110,2480,1,''),(62,103,111,2554,1,''),(62,103,112,2120,1,''),(62,109,113,2287,10,'\n'),(57,1,101,9778,1,''),(57,2,102,2661,1,''),(57,3,103,29079,1,''),(57,4,104,15489,1,''),(57,5,105,2510,1,''),(57,6,106,8910,1,''),(57,7,107,2468,1,''),(57,8,108,2195,1,''),(57,11,109,26052,1,''),(57,103,110,27632,1,''),(57,103,111,26478,1,''),(57,103,112,26401,1,''),(57,103,113,26406,1,''),(57,103,114,26399,1,''),(57,103,115,26654,1,''),(57,103,116,10519,1,''),(57,109,117,7635,9,'	'),(57,109,118,26029,1,''),(57,109,119,2596,1,'\0250x Sudden Death Rune package.'),(57,109,120,2488,1,''),(57,109,121,2520,1,''),(57,116,122,18413,4,''),(57,116,123,2213,1,'�\0'),(57,116,124,2214,1,''),(57,116,125,2667,2,''),(57,116,126,26654,10,'\n'),(57,116,127,2148,48,'0'),(57,116,128,2152,93,']'),(57,116,129,2285,84,'T'),(57,116,130,2269,82,'R'),(57,116,131,2305,57,'9'),(57,116,132,2279,27,''),(57,116,133,2304,37,'%'),(57,116,134,2304,100,'d'),(57,116,135,2274,99,'c'),(57,116,136,5942,1,''),(57,116,137,2554,1,''),(57,116,138,2120,1,''),(57,116,139,10519,1,''),(57,119,140,2268,42,'*'),(57,119,141,2268,100,'d'),(57,119,142,2268,100,'d'),(57,139,143,7635,21,''),(57,139,144,7635,100,'d'),(57,139,145,7635,100,'d'),(57,139,146,7635,100,'d'),(57,139,147,26029,79,'O'),(57,139,148,26029,100,'d'),(57,139,149,2160,69,'E'),(57,139,150,2160,100,'d'),(57,139,151,2160,100,'d'),(57,139,152,2160,100,'d'),(57,139,153,26029,100,'d'),(57,139,154,7635,100,'d'),(57,139,155,2175,1,''),(57,139,156,26029,100,'d'),(57,139,157,26029,100,'d'),(57,139,158,26029,100,'d'),(57,139,159,2268,98,'b'),(57,139,160,10519,1,''),(58,1,101,2498,1,''),(58,3,102,1988,1,''),(58,4,103,11301,1,''),(58,6,104,22421,1,''),(58,7,105,9777,1,''),(58,8,106,2646,1,''),(58,9,107,24324,1,''),(58,10,108,29057,54,'6\�a6\0'),(58,11,109,26052,1,''),(58,102,110,29056,39,'\'�B)\0'),(58,102,111,22418,1,''),(58,102,112,8855,1,''),(58,102,113,2195,1,''),(58,102,114,8930,1,''),(58,102,115,27632,1,''),(58,102,116,11119,1,''),(58,102,117,11119,1,''),(58,102,118,2358,1,''),(58,102,119,2175,1,''),(58,102,120,5942,1,''),(58,102,121,2554,1,''),(58,102,122,2120,1,''),(58,109,123,26377,1,''),(58,109,124,26377,1,''),(58,116,125,2646,1,''),(58,116,126,26481,1,''),(58,116,127,26478,1,''),(58,116,128,13938,1,''),(58,116,129,26401,1,''),(58,116,130,26402,1,''),(58,117,131,7635,100,'d'),(58,117,132,7635,100,'d'),(58,117,133,2522,1,''),(58,117,134,7635,100,'d'),(58,117,135,29056,100,'d\0p\0'),(58,117,136,2667,14,''),(58,117,137,26030,40,'('),(58,117,138,26030,100,'d'),(58,117,139,26030,100,'d'),(58,117,140,26030,100,'d'),(58,123,141,2160,43,'+'),(58,123,142,2160,100,'d'),(58,123,143,2160,100,'d'),(58,123,144,2160,100,'d'),(58,123,145,2160,100,'d'),(58,123,146,2160,100,'d'),(58,123,147,2160,100,'d'),(58,123,148,2160,100,'d'),(58,123,149,2160,100,'d'),(58,123,150,2160,100,'d'),(58,123,151,2160,100,'d'),(58,123,152,2160,100,'d'),(58,123,153,2160,100,'d'),(60,1,101,9778,1,''),(60,2,102,2661,1,''),(60,3,103,1988,1,''),(60,4,104,15489,1,''),(60,5,105,8904,1,''),(60,6,106,2190,1,''),(60,7,107,7885,1,''),(60,8,108,2195,1,''),(60,9,109,2204,1,'p�\0'),(60,11,110,26052,1,''),(60,103,111,27632,1,''),(60,103,112,2160,100,'d'),(60,103,113,2160,100,'d'),(60,103,114,2789,9,'	'),(60,103,115,11213,50,'2'),(60,103,116,2160,100,'d'),(60,103,117,2160,100,'d'),(60,103,118,2160,100,'d'),(60,103,119,2160,100,'d'),(60,103,120,2160,100,'d'),(60,103,121,10519,1,''),(60,103,122,23782,1,''),(60,103,123,2195,1,''),(60,103,124,2358,1,''),(60,103,125,5942,1,''),(60,103,126,2554,1,''),(60,103,127,2120,1,''),(60,121,128,7635,2,''),(60,121,129,7635,100,'d'),(60,121,130,2268,98,'b'),(60,121,131,2268,100,'d'),(60,121,132,2268,100,'d'),(60,121,133,2293,2,''),(60,121,134,2293,100,'d'),(60,121,135,2305,60,'<'),(60,121,136,2261,100,'d'),(60,121,137,2268,100,'d'),(60,121,138,2268,100,'d'),(60,121,139,2268,100,'d'),(60,121,140,10519,1,''),(60,122,141,7635,15,''),(60,122,142,7635,100,'d'),(60,122,143,2213,1,'؎\0'),(60,122,144,7635,100,'d'),(60,122,145,25172,1,''),(60,122,146,26478,1,''),(60,122,147,26399,1,''),(60,122,148,26402,1,''),(60,122,149,26401,1,''),(60,122,150,2213,1,''),(60,122,151,2213,1,''),(60,122,152,2268,81,'Q'),(60,122,153,2293,99,'c'),(60,122,154,2293,100,'d'),(60,122,155,26029,83,'S'),(60,140,156,2274,85,'U'),(60,140,157,2274,100,'d'),(60,140,158,2274,100,'d'),(60,140,159,2274,100,'d'),(60,140,160,2304,62,'>'),(60,140,161,2304,100,'d'),(60,140,162,2304,100,'d'),(60,140,163,26029,98,'b'),(60,140,164,26029,100,'d'),(60,140,165,26029,100,'d'),(60,140,166,26029,100,'d'),(60,140,167,2167,1,''),(60,140,168,2167,1,''),(60,140,169,2167,1,''),(60,140,170,2160,42,'*'),(60,140,171,2160,100,'d'),(60,140,172,2160,100,'d'),(60,140,173,2160,100,'d'),(60,140,174,10519,1,''),(60,174,175,10519,1,''),(60,175,176,10519,1,''),(60,176,177,10519,1,''),(60,177,178,10519,1,''),(60,178,179,10519,1,''),(60,179,180,10519,1,''),(60,180,181,10519,1,''),(64,2,101,2661,1,''),(64,3,102,1987,1,''),(64,5,103,2510,1,''),(64,6,104,2389,5,''),(64,8,105,2195,1,''),(64,11,106,26052,1,''),(64,102,107,5942,1,''),(64,102,108,2148,12,''),(64,102,109,2554,1,''),(64,102,110,2120,1,''),(64,106,111,2498,1,''),(64,106,112,11301,1,''),(64,106,113,2488,1,''),(64,106,114,2195,1,''),(64,106,115,2498,1,''),(63,1,101,9778,1,''),(63,2,102,2661,1,''),(63,3,103,29079,1,''),(63,4,104,2464,1,''),(63,5,105,2520,1,''),(63,6,106,2183,1,''),(63,7,107,2649,1,''),(63,8,108,2195,1,''),(63,11,109,26052,1,''),(63,103,110,2148,45,'-'),(63,103,111,7891,1,''),(63,103,112,2152,53,'5'),(63,103,113,2305,90,'Z'),(63,103,114,2305,100,'d'),(63,103,115,2002,1,''),(63,103,116,2789,81,'Q'),(63,103,117,2789,100,'d'),(63,103,118,2789,100,'d'),(63,103,119,2262,100,'d'),(63,103,120,2262,100,'d'),(63,103,121,2302,100,'d'),(63,103,122,2293,96,'`'),(63,103,123,2278,100,'d'),(63,103,124,2269,100,'d'),(63,103,125,2160,17,''),(63,103,126,2358,1,''),(63,103,127,2000,1,''),(63,103,128,2000,1,''),(63,103,129,2000,1,''),(63,103,130,5942,1,''),(63,103,131,2323,1,''),(63,103,132,2120,1,''),(63,103,133,2554,1,''),(63,115,134,8855,1,''),(63,115,135,18415,2,''),(63,115,136,2002,1,''),(63,115,137,2002,1,''),(63,115,138,2002,1,''),(63,127,139,2315,51,'3'),(63,127,140,2315,100,'d'),(63,127,141,2315,100,'d'),(63,127,142,2315,100,'d'),(63,127,143,2315,100,'d'),(63,127,144,2315,100,'d'),(63,127,145,2315,100,'d'),(63,127,146,2315,100,'d'),(63,127,147,2315,100,'d'),(63,127,148,2315,100,'d'),(63,127,149,2315,100,'d'),(63,127,150,2315,100,'d'),(63,127,151,2315,100,'d'),(63,127,152,2315,100,'d'),(63,127,153,2315,100,'d'),(63,127,154,2315,100,'d'),(63,127,155,2315,100,'d'),(63,127,156,2315,100,'d'),(63,127,157,2315,100,'d'),(63,127,158,2315,100,'d'),(63,128,159,2268,75,'K'),(63,128,160,2268,100,'d'),(63,128,161,2268,100,'d'),(63,128,162,2268,100,'d'),(63,128,163,2268,100,'d'),(63,128,164,2268,100,'d'),(63,128,165,2268,100,'d'),(63,128,166,2268,100,'d'),(63,128,167,2268,100,'d'),(63,128,168,2268,100,'d'),(63,129,169,2528,1,''),(63,129,170,7635,26,'\Z'),(63,129,171,7635,100,'d'),(63,129,172,26029,71,'G'),(63,129,173,26029,100,'d'),(63,136,174,2304,68,'D'),(63,136,175,2304,100,'d'),(63,136,176,2304,100,'d'),(63,136,177,2304,100,'d'),(63,136,178,2304,100,'d'),(63,136,179,2304,100,'d'),(63,136,180,2304,100,'d'),(63,136,181,2304,100,'d'),(63,136,182,2304,100,'d'),(63,136,183,2304,100,'d'),(63,137,184,2274,4,''),(63,137,185,2274,100,'d'),(63,137,186,2274,100,'d'),(63,137,187,2274,100,'d'),(63,137,188,2274,100,'d'),(63,137,189,2274,100,'d'),(63,137,190,2274,100,'d'),(3,11,101,26052,1,''),(5,11,101,26052,1,''),(1,11,101,26052,1,''),(2,11,101,26052,1,''),(4,11,101,26052,1,''),(68,1,101,2480,1,''),(68,2,102,2661,1,''),(68,3,103,1988,1,''),(68,4,104,2660,1,''),(68,5,105,2525,1,''),(68,6,106,2389,8,''),(68,7,107,8923,1,''),(68,8,108,2643,1,''),(68,11,109,26052,1,''),(68,103,110,2152,1,''),(68,103,111,2148,10,'\n'),(68,103,112,2691,3,''),(68,103,113,12399,4,''),(68,103,114,12400,1,''),(68,103,115,2671,1,''),(68,103,116,2666,2,''),(68,103,117,2120,1,''),(68,103,118,2554,1,''),(68,103,119,7618,11,''),(68,103,120,2554,1,''),(65,1,101,2475,1,''),(65,2,102,2661,1,''),(65,3,103,1988,1,''),(65,4,104,2487,1,''),(65,6,105,2454,1,'\"�\0{[1] = \"Powerful Strike\",[2] = \"Powerful Electrify\",[3] = \"Powerful Vampirism\",[4] = 71820,[5] = 71820,[6] = 71820,[7] = 1524956468,[8] = 1524956468,[9] = 1524956468,}'),(65,7,106,11304,1,''),(65,8,107,2195,1,''),(65,11,108,26052,1,''),(65,103,109,2148,10,'\n'),(65,103,110,2152,19,''),(65,103,111,2645,1,''),(65,103,112,2000,1,''),(65,103,113,5942,1,''),(65,103,114,10519,1,''),(65,103,115,5908,1,''),(65,103,116,2120,1,''),(65,103,117,2554,1,''),(65,112,118,2168,1,''),(65,112,119,15481,1,''),(65,112,120,2168,1,''),(65,112,121,15482,2,''),(65,112,122,15486,3,''),(65,112,123,15484,1,''),(65,112,124,2000,1,''),(65,114,125,7620,81,'Q'),(65,114,126,7591,66,'B'),(65,114,127,2789,76,'L'),(65,114,128,7591,100,'d'),(65,114,129,7591,100,'d'),(65,114,130,7620,100,'d'),(65,114,131,7620,100,'d'),(65,124,132,2000,1,''),(65,132,133,2000,1,''),(65,133,134,2000,1,''),(65,134,135,2000,1,''),(65,135,136,2000,1,''),(65,136,137,2000,1,''),(65,137,138,2000,1,''),(65,138,139,2000,1,''),(71,1,101,2460,1,''),(71,2,102,2661,1,''),(71,3,103,1988,1,''),(71,4,104,2476,1,''),(71,5,105,2525,1,''),(71,6,106,8601,1,''),(71,7,107,2478,1,''),(71,8,108,2643,1,''),(71,11,109,26052,1,''),(71,103,110,2152,1,''),(71,103,111,7618,4,''),(71,103,112,2554,1,''),(71,103,113,2120,1,''),(46,1,101,2480,1,''),(46,2,102,2661,1,''),(46,3,103,1987,1,''),(46,4,104,2464,1,''),(46,5,105,2510,1,''),(46,6,106,7383,1,''),(46,7,107,2468,1,''),(46,11,108,26052,1,''),(69,1,101,2480,1,''),(69,2,102,2661,1,''),(69,3,103,1988,1,''),(69,4,104,2660,1,''),(69,5,105,2525,1,''),(69,6,106,2389,5,''),(69,7,107,8923,1,''),(69,8,108,2643,1,''),(69,11,109,26052,1,''),(69,103,110,7636,10,'\n'),(69,103,111,2456,1,''),(69,103,112,7618,5,''),(69,103,113,2554,1,''),(69,103,114,2120,1,''),(69,109,115,23722,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,116,2287,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,117,2285,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,118,2266,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,119,26031,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,120,8473,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,121,7620,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,122,7618,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,123,7591,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(69,109,124,7588,1,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(45,1,101,2480,1,''),(45,2,102,2661,1,''),(45,3,103,1988,1,''),(45,4,104,2464,1,''),(45,5,105,2510,1,''),(45,6,106,7383,1,''),(45,7,107,2468,1,''),(45,8,108,2195,1,''),(45,11,109,26052,1,''),(45,103,110,13247,1,''),(45,103,111,2169,1,''),(45,103,112,2148,100,'d'),(45,103,113,2148,100,'d'),(45,103,114,2148,100,'d'),(45,103,115,2148,100,'d'),(45,103,116,2148,100,'d'),(45,103,117,2152,8,''),(45,103,118,2557,1,''),(45,103,119,5908,1,''),(45,103,120,2160,10,'\n'),(45,103,121,2397,1,''),(72,11,101,26052,1,''),(55,1,101,2480,1,''),(55,3,102,1987,1,''),(55,5,103,2510,1,''),(55,6,104,2412,1,''),(55,7,105,2468,1,''),(55,8,106,2643,1,''),(55,11,107,26052,1,''),(55,102,108,2195,1,''),(55,102,109,5942,1,''),(55,102,110,13541,1,''),(55,102,111,13544,1,''),(55,102,112,13545,1,''),(55,102,113,2554,1,''),(73,1,101,8820,1,''),(73,2,102,2661,1,''),(73,3,103,1988,1,'$\0\0\0'),(73,4,104,8819,1,''),(73,5,105,2175,1,''),(73,6,106,2190,1,''),(73,7,107,2468,1,''),(73,8,108,2643,1,''),(73,11,109,26052,1,''),(73,103,110,7636,4,''),(73,103,111,7620,1,''),(73,103,112,2554,1,''),(73,103,113,2120,1,''),(74,1,101,8820,1,''),(74,2,102,2661,1,''),(74,3,103,1988,1,'$\0\0\0'),(74,4,104,8819,1,''),(74,5,105,2175,1,''),(74,6,106,2182,1,''),(74,7,107,2468,1,''),(74,8,108,2643,1,''),(74,11,109,26052,1,''),(74,103,110,7620,5,''),(74,103,111,2554,1,''),(74,103,112,2120,1,''),(75,1,101,8820,1,''),(75,2,102,2661,1,''),(75,3,103,1988,1,''),(75,4,104,8819,1,''),(75,5,105,2175,1,''),(75,6,106,2190,1,''),(75,7,107,2468,1,''),(75,8,108,2643,1,''),(75,11,109,26052,1,''),(75,103,110,7620,5,''),(75,103,111,2554,1,''),(75,103,112,2120,1,''),(76,1,101,2480,1,''),(76,2,102,2661,1,''),(76,3,103,1988,1,''),(76,4,104,2660,1,''),(76,5,105,2525,1,''),(76,6,106,2389,5,''),(76,7,107,8923,1,''),(76,8,108,2643,1,''),(76,10,109,2544,50,'2'),(76,11,110,26052,1,''),(76,103,111,2456,1,''),(76,103,112,7618,5,''),(76,103,113,2554,1,''),(76,103,114,2120,1,''),(78,1,101,8820,1,'\"\0{[\"imbuingGuid\"] = 78,}'),(78,2,102,2661,1,''),(78,3,103,1988,1,'$\0\0\0'),(78,4,104,8819,1,''),(78,5,105,2175,1,''),(78,6,106,2182,1,''),(78,7,107,2468,1,''),(78,8,108,2643,1,''),(78,11,109,26052,1,''),(78,103,110,7620,5,''),(78,103,111,2554,1,''),(78,103,112,2120,1,''),(79,3,101,1988,1,'\"L\0{[1] = \"Powerful Backpack doidona\",[4] = 72000,[\"imbuingGuid\"] = 0,[7] = 0,}'),(79,11,102,26052,1,''),(59,1,101,2493,1,'\"l\0{[1] = \"Powerful Void\",[2] = \"Powerful Blockade\",[4] = 65520,[5] = 65520,[7] = 1526844497,[8] = 1526844497,}'),(59,2,102,23541,1,''),(59,3,103,29079,1,'$\0\0\0'),(59,4,104,2494,1,'\"t\0{[1] = \"Powerful Vampirism\",[2] = \"Powerful Lich Shroud\",[4] = 67140,[5] = 67140,[7] = 1526844043,[8] = 1526844043,}'),(59,5,105,2522,1,'\"9\0{[1] = \"Powerful Blockade\",[4] = 65760,[7] = 1526844497,}'),(59,6,106,2400,1,'\"m\0{[1] = \"Powerful Vampirism\",[2] = \"Powerful Void\",[4] = 68100,[5] = 68100,[7] = 1526844043,[8] = 1526844043,}'),(59,7,107,2504,1,''),(59,8,108,2646,1,'\":\0{[1] = \"Powerful Swiftness\",[4] = 64020,[7] = 1526844479,}'),(59,10,109,2361,1,''),(59,11,110,26052,1,''),(59,103,111,7383,1,''),(59,103,112,5903,1,''),(59,103,113,27632,1,''),(59,103,114,7635,70,'F'),(59,103,115,26478,1,''),(59,103,116,26401,1,''),(59,103,117,26402,1,''),(59,103,118,26399,1,''),(59,103,119,26654,1,''),(59,103,120,2293,39,'\''),(59,103,121,2293,100,'d'),(59,103,122,2293,100,'d'),(59,103,123,2152,80,'P'),(59,103,124,29079,1,''),(59,103,125,2789,29,''),(59,103,126,29079,1,''),(59,110,127,2596,1,'\0250x Sudden Death Rune package.'),(59,124,128,29002,1,''),(59,124,129,29004,1,''),(59,124,130,2160,85,'U'),(59,126,131,7635,74,'J'),(59,126,132,7635,100,'d'),(59,126,133,7635,100,'d'),(59,126,134,7635,100,'d'),(59,126,135,7635,100,'d'),(59,126,136,7635,100,'d'),(59,126,137,7635,100,'d'),(59,126,138,2268,37,'%'),(59,126,139,2268,100,'d'),(59,126,140,2268,100,'d'),(59,126,141,2274,75,'K'),(59,126,142,2274,100,'d'),(59,126,143,2274,100,'d'),(59,126,144,2274,100,'d'),(59,126,145,2274,100,'d'),(59,126,146,2274,100,'d'),(59,126,147,2274,100,'d'),(59,126,148,2274,100,'d'),(59,126,149,26029,26,'\Z'),(59,126,150,26029,100,'d'),(59,126,151,2160,44,','),(59,126,152,2160,100,'d'),(59,126,153,2160,100,'d'),(70,1,101,8820,1,''),(70,2,102,2661,1,''),(70,3,103,1988,1,''),(70,4,104,8819,1,''),(70,6,105,2190,1,''),(70,7,106,2468,1,''),(70,8,107,2643,1,''),(70,11,108,26052,1,''),(70,103,109,7620,5,''),(70,103,110,2554,1,''),(70,103,111,2120,1,''),(81,1,101,2460,1,''),(81,2,102,2661,1,''),(81,3,103,1988,1,'$\0\0\0'),(81,4,104,2465,1,''),(81,5,105,2525,1,''),(81,6,106,7383,1,''),(81,7,107,2478,1,''),(81,8,108,2195,1,''),(81,11,109,26052,1,''),(81,103,110,7636,10,'\n'),(81,103,111,7635,17,''),(81,103,112,1987,1,''),(81,103,113,2645,1,''),(81,103,114,7620,72,'H'),(81,103,115,2383,1,'�\0\0'),(81,103,116,2148,39,'\''),(81,103,117,8473,4,''),(81,103,118,2146,2,''),(81,103,119,26191,3,''),(81,103,120,7427,1,''),(81,103,121,7588,50,'2'),(81,103,122,7588,99,'c'),(81,103,123,7588,100,'d'),(81,103,124,26031,29,''),(81,103,125,18457,6,''),(81,103,126,5942,1,''),(81,103,127,2554,1,''),(81,103,128,2120,1,''),(81,109,129,2596,1,'\0250x Mana Potion package.'),(81,109,130,2596,1,'\0250x Mana Potion package.'),(81,112,131,2160,20,''),(81,112,132,26181,1,''),(81,112,133,26165,1,''),(81,112,134,26168,1,''),(81,112,135,26192,1,''),(81,112,136,25377,1,''),(81,130,137,7620,100,'d'),(80,1,101,8820,1,''),(80,2,102,2661,1,''),(80,3,103,1988,1,'$\0\0\0'),(80,4,104,8819,1,''),(80,5,105,2175,1,''),(80,6,106,2383,1,'\'\0\0'),(80,7,107,2468,1,''),(80,8,108,2643,1,''),(80,11,109,26052,1,''),(80,103,110,25521,1,''),(80,103,111,1987,1,'$\0\0\0\0'),(80,103,112,2268,97,'a'),(80,103,113,7620,4,''),(80,103,114,2554,1,''),(80,103,115,2120,1,''),(43,1,101,2493,1,''),(43,2,102,14333,1,''),(43,3,103,10518,1,'$\0\0\0'),(43,4,104,2494,1,'\"_\0{[1] = 0,[2] = \"Powerful Snake Skin\",[4] = 0,[5] = 72000,[7] = 0,[8] = 0,[\"imbuingGuid\"] = 43,}'),(43,5,105,2520,1,''),(43,6,106,7383,1,''),(43,7,107,2495,1,''),(43,8,108,24637,1,'\"\Z\0{[1] = 0,[4] = 0,[7] = 0,}'),(43,10,109,2547,1,''),(43,11,110,26052,1,'$\0\0\0\0'),(43,103,111,2554,1,''),(43,103,112,2548,1,''),(43,103,113,2551,1,''),(43,103,114,2552,1,''),(43,103,115,2550,1,''),(43,103,116,2549,1,''),(43,103,117,2553,1,''),(43,110,118,7620,20,'\"&\0{[\"RewardStoreInboxNotMoveable\"] = 1,}'),(44,1,101,2480,1,''),(44,3,102,2365,1,'$\0\0\0'),(44,4,103,2464,1,''),(44,5,104,6433,1,''),(44,6,105,7383,1,''),(44,7,106,2468,1,''),(44,8,107,2195,1,''),(44,11,108,26052,1,''),(44,102,109,21401,3,''),(44,102,110,2554,1,''),(44,102,111,24850,2,''),(44,102,112,1987,1,'$\0\0\0\0'),(44,102,113,7426,1,''),(44,102,114,2787,10,'\n'),(44,102,115,7427,1,''),(44,102,116,5882,1,''),(44,102,117,25377,10,'\n'),(44,102,118,2383,1,'�\0\0'),(44,102,119,2554,1,''),(44,102,120,2120,1,''),(44,102,121,2152,8,''),(44,102,122,2412,1,''),(44,102,123,2089,1,'\�'),(44,102,124,2089,1,'\�'),(44,102,125,2089,1,'\�'),(44,102,126,18559,1,''),(44,102,127,2365,1,''),(44,108,128,2596,1,'\0250x Mana Potion package.'),(44,108,129,2596,1,'#\0250x Supreme Health Potion package.'),(44,108,130,2596,1,'#\0250x Supreme Health Potion package.'),(44,108,131,2596,1,'\0250x Mana Potion package.'),(44,108,132,2596,1,'\0250x Mana Potion package.'),(44,108,133,2596,1,'#\0250x Supreme Health Potion package.$\0\0\0\0'),(44,112,134,2160,20,''),(44,112,135,26181,1,''),(44,112,136,26168,1,''),(44,112,137,26192,1,''),(44,127,138,7618,1,''),(44,127,139,26054,1,'�o\�\0\0C\0Unwrap it in your own house to create a <great spirit potion cask>.'),(44,127,140,26054,1,'\�e'),(44,127,141,5886,90,'Z'),(44,127,142,1988,1,''),(44,127,143,5941,1,''),(44,127,144,13542,1,''),(44,127,145,13544,1,''),(44,127,146,13543,1,''),(44,127,147,5942,1,''),(44,127,148,5894,30,''),(44,127,149,5911,80,'P'),(44,127,150,5883,60,'<'),(44,127,151,5922,65,'A'),(44,127,152,5881,40,'('),(44,127,153,5882,60,'<'),(44,127,154,5904,85,'U'),(44,127,155,5905,70,'F'),(44,128,156,7636,25,''),(44,128,157,7636,100,'d'),(44,128,158,7620,25,''),(44,128,159,7620,100,'d'),(44,129,160,7635,28,''),(44,129,161,7635,100,'d'),(44,129,162,7635,100,'d'),(44,129,163,26031,22,''),(44,130,164,7635,30,''),(44,130,165,7635,100,'d'),(44,130,166,7635,100,'d'),(44,130,167,26031,20,''),(44,131,168,7636,50,'2'),(44,131,169,7636,100,'d'),(44,131,170,7636,100,'d'),(44,132,171,7636,72,'H'),(44,132,172,7620,78,'N'),(44,132,173,7620,100,'d'),(44,133,174,7635,5,''),(44,133,175,26031,44,','),(44,133,176,26031,100,'d'),(44,133,177,26031,100,'d'),(44,142,178,2000,1,''),(44,142,179,1988,1,'$\0\0\0'),(44,179,180,8187,1,''),(44,179,181,1988,1,''),(44,179,182,24838,1,''),(44,179,183,2120,1,''),(44,179,184,1988,1,''),(44,184,185,5937,1,''),(44,184,186,5877,4,''),(44,184,187,2146,97,'a'),(44,184,188,2147,98,'b'),(44,184,189,2149,97,'a'),(44,184,190,2150,97,'a'),(44,184,191,26054,1,'�o\�\0\0E\0Unwrap it in your own house to create a <supreme health potion cask>.'),(44,184,192,26031,2,''),(44,184,193,8473,93,']'),(44,184,194,12400,20,''),(44,184,195,15433,1,''),(44,184,196,2420,1,''),(44,184,197,15432,1,''),(44,184,198,2557,1,''),(44,184,199,5908,1,''),(44,184,200,2439,1,''),(67,1,101,8820,1,''),(67,2,102,2661,1,''),(67,3,103,1988,1,''),(67,4,104,8819,1,''),(67,5,105,2175,1,''),(67,6,106,2182,1,''),(67,7,107,2468,1,''),(67,8,108,2643,1,''),(66,1,101,2480,1,''),(66,2,102,2661,1,''),(66,3,103,1987,1,''),(66,4,104,2464,1,''),(66,5,105,2510,1,''),(66,6,106,2412,1,''),(66,7,107,2468,1,''),(66,8,108,2643,1,''),(66,103,109,2554,1,''),(66,103,110,2120,1,''),(61,1,101,2498,1,''),(61,2,102,2661,1,''),(61,3,103,1988,1,''),(61,4,104,9776,1,''),(61,5,105,2520,1,''),(61,6,106,7383,1,''),(61,7,107,2488,1,''),(61,8,108,2195,1,''),(61,103,109,7636,1,''),(61,103,110,7383,1,''),(61,103,111,2431,1,''),(61,103,112,5877,1,''),(61,103,113,5908,1,''),(61,103,114,2494,1,''),(61,103,115,10602,75,'K'),(61,103,116,10550,85,'U'),(61,103,117,10580,95,'_'),(61,103,118,2667,79,'O'),(61,103,119,2213,1,''),(61,103,120,5942,1,''),(61,103,121,2554,1,''),(61,103,122,2120,1,''),(77,1,101,2480,1,''),(77,2,102,2661,1,''),(77,3,103,1988,1,''),(77,4,104,2660,1,''),(77,5,105,2525,1,''),(77,6,106,2389,5,''),(77,7,107,2647,1,''),(77,8,108,2195,1,''),(77,10,109,2544,40,'('),(77,103,110,2151,1,''),(77,103,111,1955,1,'�\0Uhgly beholda stollen ki we gut from slain humi nigt. Tohk it 2 stinky place, noone will go thare fur guud king of cyclops. Beholda bat und ughly, to manni eyes!'),(77,103,112,1987,1,''),(77,103,113,1987,1,''),(77,103,114,2152,56,'8'),(77,103,115,7636,4,''),(77,103,116,5461,1,''),(77,103,117,10522,1,''),(77,103,118,5022,13,'\r'),(77,103,119,5942,1,''),(77,103,120,4856,1,''),(77,103,121,1987,1,''),(77,103,122,2195,1,''),(77,103,123,5942,1,''),(77,103,124,7618,5,''),(77,103,125,2554,1,''),(77,103,126,2120,1,''),(77,112,127,2129,1,''),(77,112,128,2213,1,''),(77,113,129,2143,1,''),(77,117,130,10522,1,''),(77,117,131,10522,1,''),(77,121,132,2089,1,'\�'),(77,121,133,2089,1,'\�'),(77,121,134,2089,1,'\�'),(77,121,135,2089,1,'\�'),(77,131,136,10522,1,''),(42,3,101,26181,1,''),(42,4,102,2494,1,''),(42,6,103,7383,1,''),(42,8,104,2195,1,''),(42,101,105,5879,1,''),(42,101,106,2365,1,''),(42,101,107,1966,1,'�Tunnelling guide\n----------------\nby Gromward Hammerfist\n\'The art of building a tunnel lies in the nature of dwarfes.\' That\'s what my grand grand grandfather used to say. First of all I\'d like to give you a small historical review of tunnelling. .....<you skip the first 1000 pages containing dwarfen tunnelling history>.\nRepairing collapsed tunnels:\nEquipment: Pick, tree or bricklayers kit\nBefore picking away the rubble you need to place a buttress otherwise the tunnel will collapse over and over again. If you don\'t have a matching tree at hand you could still build a brickwall to stabilize the tunnel. Good luck!\nRepairing gaps:\nEquipment: Wood, wooden ties, hammer, nails, metal fitting\nFor each missing part (on the basis of a standard rail) I recommend to use three pieces of wood. Lock them in position by at least 6 nails. For the rail itself use a saw on a piece of wood to build your wooden ties. Then place two metal fittings on them and you can make your first ride on your new rail. Congratulations!\nBuilding a rail on lava:\nI advice not to try that until you have at least 20 years experience in rail construction......<Well, seems like you don\'t match the premises.>\n\nAdventuring old tunnels:\nBe aware that our kind mastered the art of tunnelling. It may take you a whole life to understand the techniques that are used and it takes generations to know all the tunnels of a mine and all their exits. You even may find an exit that you never expected to.\n\nTo sum up\nIf you are no dwarf don\'t even try to think that you have a chance of mastering the art of tunnelling. If you are a dwarf I wish you good luck and don\'t abandon faith. There is a light at the end of the tunnel.\n\nYours\nGromward Hammerfist'),(42,106,108,2268,83,'S'),(42,106,109,10034,1,''),(42,106,110,10034,1,''),(42,106,111,8309,3,''),(42,106,112,10033,1,''),(42,106,113,2557,1,''),(41,1,101,2493,1,''),(41,2,102,2171,1,''),(41,3,103,2365,1,''),(41,4,104,2494,1,''),(41,5,105,2520,1,''),(41,6,106,18465,1,''),(41,7,107,2495,1,''),(41,8,108,2640,1,'X��\0'),(41,9,109,2121,1,''),(41,10,110,18304,15,''),(41,103,111,2148,40,'('),(41,103,112,2195,1,''),(41,103,113,7383,1,''),(41,103,114,2187,1,''),(41,103,115,2148,100,'d'),(41,103,116,2787,10,'\n'),(41,103,117,18422,2,''),(41,103,118,18457,5,''),(41,103,119,2145,10,'\n'),(41,103,120,10614,1,''),(41,103,121,2152,28,''),(41,103,122,24850,2,''),(41,103,123,18559,1,''),(41,103,124,26130,1,''),(41,103,125,25377,22,''),(41,103,126,2293,30,''),(41,103,127,1987,1,''),(41,103,128,2000,1,''),(41,103,129,2120,1,''),(41,103,130,2420,1,''),(41,103,131,1988,1,''),(41,103,132,2553,1,''),(41,103,133,7620,34,'\"'),(41,127,134,26185,1,''),(41,127,135,5878,4,''),(41,127,136,2566,1,''),(41,127,137,8187,1,''),(41,127,138,1987,1,''),(41,127,139,1987,1,''),(41,127,140,1955,1,'\�\0Dear diary,\nmy son Kruzak is constantly nagging me to resign as emperor and pass the leadership to him. \nWhat does this youngster of a few hundreds years think? \nI rather shave my beard then to step back!'),(41,127,141,2566,1,''),(41,128,142,7491,1,''),(41,128,143,7590,1,''),(41,128,144,2565,1,''),(41,128,145,5909,5,''),(41,128,146,2000,1,''),(41,131,147,25377,1,''),(41,131,148,2152,16,''),(41,131,149,2566,1,''),(41,131,150,15433,1,''),(41,131,151,15432,1,''),(41,131,152,22612,1,''),(41,131,153,13601,1,''),(41,131,154,11258,1,''),(41,131,155,22615,1,''),(41,131,156,22608,1,''),(41,131,157,22611,1,''),(41,131,158,7494,1,''),(41,131,159,8930,1,''),(41,131,160,22396,5,''),(41,131,161,2798,1,''),(41,131,162,2365,1,''),(41,131,163,1988,1,''),(41,131,164,1987,1,''),(41,138,165,2213,1,''),(41,138,166,2146,2,''),(41,138,167,2199,150,'�\0'),(41,139,168,2148,94,'^'),(41,139,169,2672,11,''),(41,139,170,24763,1,''),(41,139,171,25377,13,'\r'),(41,139,172,2268,61,'='),(41,139,173,2089,1,'\�'),(41,146,174,2006,15,''),(41,146,175,2006,15,''),(41,162,176,1955,1,')\0Askuro\nMantar\nIldoni\nMaxmof\nXemodo\nOxanti'),(41,162,177,2638,8,''),(41,162,178,2639,12,''),(41,162,179,5914,1,''),(41,162,180,8878,1,''),(41,162,181,11261,1,''),(41,162,182,8931,1,''),(41,162,183,18416,7,''),(41,162,184,18415,4,''),(41,162,185,18418,13,'\r'),(41,162,186,5022,2,''),(41,162,187,1988,1,''),(41,162,188,1988,1,''),(41,162,189,2365,1,''),(41,163,190,8293,1,''),(41,163,191,1988,1,''),(41,164,192,7846,1,''),(41,164,193,7845,1,''),(41,164,194,6499,1,''),(41,164,195,7845,1,''),(41,164,196,2006,15,''),(41,187,197,2146,95,'_'),(41,187,198,2147,91,'['),(41,187,199,2150,94,'^'),(41,187,200,5894,90,'Z'),(41,187,201,5461,1,''),(41,187,202,9970,94,'^'),(41,187,203,5942,1,''),(41,187,204,5921,70,'F'),(41,187,205,2554,1,''),(41,187,206,7633,1,''),(41,187,207,22613,1,''),(41,187,208,7735,1,''),(41,187,209,26054,1,'�o\�\0\0=\0Unwrap it in your own house to create a <health potion cask>.'),(41,187,210,2645,1,''),(41,187,211,6093,1,''),(41,187,212,7618,1,''),(41,187,213,2006,2,''),(41,187,214,5942,1,''),(41,188,215,6391,1,''),(41,188,216,5930,99,'c'),(41,188,217,2012,0,'\0'),(41,188,218,5885,1,''),(41,188,219,2420,1,''),(41,188,220,2550,1,''),(41,188,221,2405,1,''),(41,188,222,5886,90,'Z'),(41,188,223,5909,50,'2'),(41,188,224,5914,50,'2'),(41,188,225,5913,30,''),(41,188,226,5910,50,'2'),(41,188,227,5911,50,'2'),(41,188,228,5912,50,'2'),(41,188,229,5906,90,'Z'),(41,188,230,5905,80,'P'),(41,188,231,5895,80,'P'),(41,188,232,5881,70,'F'),(41,188,233,5882,90,'Z'),(41,188,234,5898,70,'F'),(6,1,101,5461,1,''),(6,2,102,2661,1,''),(6,3,103,2000,1,''),(6,6,104,2455,1,''),(6,7,105,2478,1,''),(6,8,106,10021,1,''),(6,10,107,26342,1,''),(6,103,108,2148,93,']'),(6,103,109,7383,1,''),(6,103,110,2413,1,''),(6,103,111,2438,1,''),(6,103,112,2160,1,''),(6,103,113,2148,100,'d'),(6,103,114,2152,22,''),(6,103,115,2143,3,''),(6,103,116,26194,1,''),(6,103,117,2115,1,''),(6,103,118,2199,1,'\0'),(6,103,119,24763,1,''),(6,103,120,18457,97,'a');
/*!40000 ALTER TABLE `player_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_killers`
--

DROP TABLE IF EXISTS `player_killers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_killers`
--

LOCK TABLES `player_killers` WRITE;
/*!40000 ALTER TABLE `player_killers` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_killers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_kills`
--

DROP TABLE IF EXISTS `player_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_kills`
--

LOCK TABLES `player_kills` WRITE;
/*!40000 ALTER TABLE `player_kills` DISABLE KEYS */;
INSERT INTO `player_kills` VALUES (27,1516571896,35,1),(27,1516571983,35,1),(27,1516572032,35,1),(21,1519485543,31,1),(21,1519486623,29,1),(21,1520091520,29,1),(60,1523229449,61,1),(45,1523227509,58,1),(45,1523227510,57,1),(59,1523236619,58,1),(41,1526843956,59,1);
/*!40000 ALTER TABLE `player_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_misc`
--

DROP TABLE IF EXISTS `player_misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_misc`
--

LOCK TABLES `player_misc` WRITE;
/*!40000 ALTER TABLE `player_misc` DISABLE KEYS */;
INSERT INTO `player_misc` VALUES (11,'{}'),(14,'{}'),(10,'{}'),(18,'{}'),(20,'{}'),(13,'{}'),(12,'{}'),(9,'{}'),(7,'{}'),(19,'{}'),(30,'{}'),(34,'{}'),(25,'{}'),(27,'{}'),(31,'{}'),(24,'{}'),(32,'{}'),(23,'{}'),(35,'{}'),(37,'{}'),(39,'{}'),(28,'{}'),(33,'{}'),(38,'{}'),(40,'{}'),(22,'{}'),(29,'{}'),(21,'{}'),(26,'{}'),(62,'{}'),(57,'{}'),(58,'{}'),(60,'{}'),(64,'{}'),(63,'{}'),(3,'{}'),(5,'{}'),(1,'{}'),(2,'{}'),(4,'{}'),(68,'{}'),(65,'{}'),(71,'{}'),(46,'{}'),(69,'{}'),(45,'{}'),(66,'{}'),(55,'{}'),(73,'{}'),(74,'{}'),(75,'{}'),(76,'{}'),(61,'{}'),(78,'{}'),(67,'{}'),(79,'{}'),(77,'{}'),(59,'{}'),(70,'{}'),(81,'{}'),(80,'{}'),(43,'{}'),(42,'{}'),(6,'{}'),(41,'{}'),(44,'{}');
/*!40000 ALTER TABLE `player_misc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_namelocks`
--

DROP TABLE IF EXISTS `player_namelocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `namelocked_by` (`namelocked_by`),
  CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_namelocks`
--

LOCK TABLES `player_namelocks` WRITE;
/*!40000 ALTER TABLE `player_namelocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_namelocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_prey`
--

DROP TABLE IF EXISTS `player_prey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mindex` smallint(6) NOT NULL,
  `mcolumn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_prey`
--

LOCK TABLES `player_prey` WRITE;
/*!40000 ALTER TABLE `player_prey` DISABLE KEYS */;
INSERT INTO `player_prey` VALUES (19,'blood beast',0,0),(19,'wereboar',1,0),(19,'midnight asura',2,0),(19,'smuggler',3,0),(19,'poison spider',4,0),(19,'ashmunrah',5,0),(19,'crypt shambler',6,0),(19,'efreet',7,0),(19,'dworc fleshhunter',8,0),(19,'phantasm',0,1),(19,'spectre',1,1),(19,'troll',2,1),(19,'lizard magistratus',3,1),(19,'dark apprentice',4,1),(19,'glooth brigand',5,1),(19,'deepling tyrant',6,1),(19,'elf scout',7,1),(19,'diabolic imp',8,1),(22,'mahrdis',0,0),(22,'skeleton',1,0),(22,'high voltage elemental',2,0),(22,'azerus2',3,0),(22,'ice dragon',4,0),(22,'lizard magistratus',5,0),(22,'glooth anemone',6,0),(22,'cobra',7,0),(22,'orc spearman',8,0),(22,'crustacea gigantica',0,1),(22,'death priest',1,1),(22,'crystal wolf',2,1),(22,'diseased bill',3,1),(22,'sparkion',4,1),(22,'charged energy elemental',5,1),(22,'pirate buccaneer',6,1),(22,'vexclaw',7,1),(22,'renegade knight',8,1),(23,'lost soul',0,0),(23,'troll legionnaire',1,0),(23,'furious troll',2,0),(23,'the collector',3,0),(23,'winter wolf',4,0),(23,'corym charlatan',5,0),(23,'lion',6,0),(23,'son of verminor',7,0),(23,'death priest',8,0),(23,'quara constrictor scout',0,1),(23,'renegade quara predator',1,1),(23,'dragon lord',2,1),(23,'golgordan',3,1),(23,'bog raider',4,1),(23,'dread intruder',5,1),(23,'guilt',6,1),(23,'askarak demon',7,1),(23,'toad',8,1),(24,'little corym charlatan',0,0),(24,'glooth golem',1,0),(24,'forest fury',2,0),(24,'ice golem',3,0),(24,'dark faun',4,0),(24,'worm priestess',5,0),(24,'wolfold',6,0),(24,'chakoya tribewarden',7,0),(24,'behemoth',8,0),(24,'quara hydromancer scout',0,1),(24,'dark magician',1,1),(24,'insect swarm',2,1),(24,'spit nettle',3,1),(24,'mutated rat',4,1),(24,'demon outcast',5,1),(24,'tarantula',6,1),(24,'dawn scorpion',7,1),(24,'hive overseer',8,1),(25,'worm priestess',0,0),(25,'crimson frog',1,0),(25,'pirate buccaneer',2,0),(25,'gozzler',3,0),(25,'enslaved dwarf',4,0),(25,'eternal guardian',5,0),(25,'muddy earth elemental',6,0),(25,'shark',7,0),(25,'sight of surrender',8,0),(25,'gang member',0,1),(25,'furious troll',1,1),(25,'mutated rat',2,1),(25,'undead mine worker',3,1),(25,'dipthrah',4,1),(25,'mahrdis',5,1),(25,'hyaena',6,1),(25,'lancer beetle',7,1),(25,'haunted dragon',8,1),(26,'mutated bat',0,1),(26,'damaged worker golem',1,1),(26,'the masked marauder',2,1),(26,'inky',3,1),(26,'guilt',4,1),(26,'barbarian skullhunter',5,1),(26,'choking fear',6,1),(26,'rat',7,1),(26,'dirtbeard',8,1),(27,'firestarter',0,0),(27,'dark faun',1,0),(27,'gang member',2,0),(27,'draken elite',3,0),(27,'ghastly dragon',4,0),(27,'hunter',5,0),(27,'azerus2',6,0),(27,'bandit',7,0),(27,'armadile',8,0),(27,'crocodile',0,1),(27,'skeleton warrior',1,1),(27,'lost soul',2,1),(27,'shadow pupil',3,1),(27,'worm priestess',4,1),(27,'hive overseer',5,1),(27,'golden servant replica',6,1),(27,'grim reaper',7,1),(27,'fire elemental',8,1),(27,'warlock',0,2),(27,'marsh stalker',1,2),(27,'frazzlemaw',2,2),(27,'nightfiend',3,2),(27,'dworc fleshhunter',4,2),(27,'corym vanguard',5,2),(27,'assassin',6,2),(27,'young troll',7,2),(27,'rift scythe',8,2),(30,'diamond servant',0,0),(30,'jagged earth elemental',1,0),(30,'shard of corruption',2,0),(30,'carrion worm',3,0),(30,'serpent spawn',4,0),(30,'cyclops drone',5,0),(30,'orewalker',6,0),(30,'hive overseer',7,0),(30,'enslaved dwarf',8,0),(30,'gargoyle',0,1),(30,'deepling elite',1,1),(30,'orc warlord',2,1),(30,'black knight',3,1),(30,'lizard templar',4,1),(30,'hydra',5,1),(30,'forest fury',6,1),(30,'rotworm',7,1),(30,'choking fear',8,1),(32,'troll guard',0,0),(32,'quara hydromancer',1,0),(32,'fire elemental',2,0),(32,'little corym charlatan',3,0),(32,'terrorsleep',4,0),(32,'chakoya toolshaper',5,0),(32,'vexclaw',6,0),(32,'warlock',7,0),(32,'corym skirmisher',8,0),(32,'dragon lord hatchling',0,1),(32,'cave rat',1,1),(32,'polar bear',2,1),(32,'lizard magistratus',3,1),(32,'badger',4,1),(32,'betrayed wraith',5,1),(32,'slick water elemental',6,1),(32,'glitterscale',7,1),(32,'magma crawler',8,1),(29,'spectre',0,1),(29,'tortoise',1,1),(29,'wolfold',2,1),(29,'warlock',3,1),(29,'swamp troll',4,1),(29,'guzzlemaw',5,1),(29,'ghastly dragon',6,1),(29,'wyvern',7,1),(29,'gnarlhound',8,1),(29,'hellgorak',0,2),(29,'winter wolf',1,2),(29,'dworc venomsniper',2,2),(29,'lost basher',3,2),(29,'frazzlemaw',4,2),(29,'enlightened of the cult',5,2),(29,'dark torturer',6,2),(29,'tarnished spirit',7,2),(29,'gravedigger',8,2),(34,'glooth anemone',0,0),(34,'glooth bandit',1,0),(34,'pirate corsair',2,0),(34,'quara pincher scout',3,0),(34,'braindeath',4,0),(34,'sandcrawler',5,0),(34,'efreet',6,0),(34,'lizard dragon priest',7,0),(34,'minotaur poacher',8,0),(34,'goblin leader',0,1),(34,'waspoid',1,1),(34,'tortoise',2,1),(34,'vicious manbat',3,1),(34,'elder bonelord',4,1),(34,'infected weeper',5,1),(34,'minotaur mage',6,1),(34,'banshee',7,1),(34,'woodling',8,1),(35,'spitter',0,0),(35,'frazzlemaw',1,0),(35,'gang member',2,0),(35,'gravedigger',3,0),(35,'bugold',4,0),(35,'leaf golem',5,0),(35,'dworc voodoomaster',6,0),(35,'grimeleech',7,0),(35,'necromancer',8,0),(35,'enraged crystal golem',0,1),(35,'ogre shaman',1,1),(35,'pirate corsair',2,1),(35,'orc rider',3,1),(35,'crypt shambler',4,1),(35,'drillworm',5,1),(35,'toad',6,1),(35,'wyrm',7,1),(35,'wolf',8,1),(26,'kraknaknork',0,0),(26,'omruc',1,0),(26,'deepling worker',2,0),(26,'broken shaper',3,0),(26,'crypt shambler',4,0),(26,'larva',5,0),(26,'vicious manbat',6,0),(26,'wilting leaf golem',7,0),(26,'troll champion',8,0),(26,'hideous fungus',0,2),(26,'scar tribe warrior',1,2),(26,'lich',2,2),(26,'orc',3,2),(26,'mammoth',4,2),(26,'quara pincher',5,2),(26,'marsh stalker',6,2),(26,'vexclaw',7,2),(26,'dipthrah',8,2),(31,'the count',0,0),(31,'leaf golem',1,0),(31,'giant spider',2,0),(31,'troll-trained salamander',3,0),(31,'haunted dragon',4,0),(31,'necromancer',5,0),(31,'lizard high guard',6,0),(31,'crazed dwarf',7,0),(31,'yalaharimonster',8,0),(31,'smuggler',0,1),(31,'rift scythe',1,1),(31,'diamond servant',2,1),(31,'insect swarm',3,1),(31,'quara constrictor',4,1),(31,'ogre savage',5,1),(31,'barbarian headsplitter',6,1),(31,'worker golem',7,1),(31,'larva',8,1),(31,'scar tribe shaman',0,2),(31,'carrion worm',1,2),(31,'berserker chicken',2,2),(31,'vicious squire',3,2),(31,'priestess',4,2),(31,'minotaur occultist',5,2),(31,'renegade quara pincher',6,2),(31,'weeper',7,2),(31,'bonelordold',8,2),(37,'clomp',0,0),(37,'omnivora',1,0),(37,'morguthis',2,0),(37,'banshee',3,0),(37,'morguthis',4,0),(37,'boar',5,0),(37,'green djinn',6,0),(37,'toad',7,0),(37,'dawn scorpion',8,0),(37,'cliff strider',0,1),(37,'swan maiden',1,1),(37,'quara hydromancer',2,1),(37,'larva',3,1),(37,'deepling tyrant',4,1),(37,'omnivora',5,1),(37,'rift scythe',6,1),(37,'ogre shaman',7,1),(37,'goblin leader',8,1),(21,'swarmer',0,1),(21,'slug',1,1),(21,'hellspawn',2,1),(21,'gang member',3,1),(21,'golgordan',4,1),(21,'diseased fred',5,1),(21,'blood hand',6,1),(21,'vulcongra',7,1),(21,'abyssal calamary',8,1),(21,'kongra',0,2),(21,'poacher',1,2),(21,'monk',2,2),(21,'dark apprentice',3,2),(21,'sharptooth',4,2),(21,'rift brood',5,2),(21,'dragon lord',6,2),(21,'snake god essence',7,2),(21,'ice golem',8,2),(21,'quara mantassin',0,0),(21,'draken abomination',1,0),(21,'outburst',2,0),(21,'lost soul',3,0),(21,'damaged worker golem',4,0),(21,'manta ray',5,0),(21,'serpent spawn',6,0),(21,'spidris',7,0),(21,'boogey',8,0),(29,'braindeath',0,0),(29,'massive water elemental',1,0),(29,'minotaur amazon',2,0),(29,'swarmer',3,0),(29,'frazzlemaw',4,0),(29,'bugold',5,0),(29,'vicious squire',6,0),(29,'behemoth',7,0),(29,'mercury blob',8,0),(45,'reality reaver',0,0),(45,'deepling worker',1,0),(45,'cyclops',2,0),(45,'dragon lord',3,0),(45,'tarnished spirit',4,0),(45,'banshee',5,0),(45,'efreet',6,0),(45,'minotaur occultist',7,0),(45,'pirate cutthroat',8,0),(45,'werebear',0,1),(45,'walker',1,1),(45,'bonelordold',2,1),(45,'shard of corruption',3,1),(45,'slick water elemental',4,1),(45,'vexclaw',5,1),(45,'blood hand',6,1),(45,'worker golem',7,1),(45,'spit nettle',8,1),(44,'glooth bandit',0,0),(44,'thornback tortoise',1,0),(44,'stone rhino',2,0),(44,'dark monk',3,0),(44,'war golem',4,0),(44,'lizard chosen',5,0),(44,'blood crab',6,0),(44,'pirate corsair',7,0),(44,'vile grandmaster',8,0),(44,'chakoya tribewarden',0,1),(44,'rift brood',1,1),(44,'terrorsleep',2,1),(44,'instable breach brood',3,1),(44,'wolfold',4,1),(44,'enraged crystal golem',5,1),(44,'war wolf',6,1),(44,'minotaur',7,1),(44,'ogre brute',8,1),(46,'abyssal calamary',0,0),(46,'hellfire fighter',1,0),(46,'sea serpent',2,0),(46,'enlightened of the cult',3,0),(46,'glooth bandit',4,0),(46,'dawnfly',5,0),(46,'behemoth',6,0),(46,'mad scientist',7,0),(46,'stone rhino',8,0),(46,'lizard noble',0,1),(46,'defiler',1,1),(46,'sparkion',2,1),(46,'shaper matriarch',3,1),(46,'ladybug',4,1),(46,'lancer beetle',5,1),(46,'humongous fungus',6,1),(46,'magma crawler',7,1),(46,'crawler',8,1),(57,'insectoid worker',0,0),(57,'waspoid',1,0),(57,'spitter',2,0),(57,'black knight',3,0),(57,'shaper matriarch',4,0),(57,'instable sparkion',5,0),(57,'broken shaper',6,0),(57,'glooth powered minotaur',7,0),(57,'salamander',8,0),(57,'gargoyle',0,1),(57,'stone devourer',1,1),(57,'warlock',2,1),(57,'dragon lord hatchling',3,1),(57,'gnarlhound',4,1),(57,'evil sheep',5,1),(57,'gargoyle',6,1),(57,'orc warrior',7,1),(57,'gozzler',8,1),(58,'elf scout',0,0),(58,'barbarian headsplitter',1,0),(58,'juggernaut',2,0),(58,'barbarian brutetamer',3,0),(58,'thalas',4,0),(58,'deepling guard',5,0),(58,'crawler',6,0),(58,'moohtant',7,0),(58,'troll guard',8,0),(58,'jagged earth elemental',0,1),(58,'acolyte of the cult',1,1),(58,'pirate cutthroat',2,1),(58,'instable sparkion',3,1),(58,'ladybug',4,1),(58,'elder wyrm',5,1),(58,'sibang',6,1),(58,'orc',7,1),(58,'glooth blob',8,1),(60,'infernalist',0,0),(60,'draken spellweaver',1,0),(60,'elder mummy',2,0),(60,'adept of the cult',3,0),(60,'minotaur bruiser',4,0),(60,'fire elemental',5,0),(60,'bog raider',6,0),(60,'quara mantassin scout',7,0),(60,'demon',8,0),(60,'spitter',0,1),(60,'dragon lord hatchling',1,1),(60,'feeble glooth horror',2,1),(60,'fire devil',3,1),(60,'orc marauder',4,1),(60,'werewolf',5,1),(60,'dragon lord',6,1),(60,'pixie',7,1),(60,'rat',8,1),(59,'weakened frazzlemaw',0,2),(59,'sea serpent',1,2),(59,'wilting leaf golem',2,2),(59,'frost giantess',3,2),(59,'nightmare',4,2),(59,'scarab',5,2),(59,'tarnished spirit',6,2),(59,'salamander',7,2),(59,'askarak demon',8,2),(59,'frost giantess',0,0),(59,'defiler',1,0),(59,'ghoulish hyaena',2,0),(59,'smuggler',3,0),(59,'mutated tiger',4,0),(59,'lizard sentinel',5,0),(59,'salamander',6,0),(59,'frazzlemaw',7,0),(59,'hellfire fighter',8,0),(59,'necromancer',0,1),(59,'bearold',1,1),(59,'hand of cursed fate',2,1),(59,'instable breach brood',3,1),(59,'doom deer',4,1),(59,'pirate marauder',5,1),(59,'worm priestess',6,1),(59,'charged energy elemental',7,1),(59,'troll',8,1),(61,'ice witch',0,0),(61,'hyaena',1,0),(61,'valkyrie',2,0),(61,'guzzlemaw',3,0),(61,'sight of surrender',4,0),(61,'renegade quara hydromancer',5,0),(61,'diamond servant replica',6,0),(61,'sandcrawler',7,0),(61,'cobra',8,0),(62,'forest fury',0,0),(62,'ogre savage',1,0),(62,'swarmer',2,0),(62,'sandstone scorpion',3,0),(62,'enraged crystal golem',4,0),(62,'pirate buccaneer',5,0),(62,'white shade',6,0),(62,'corym charlatan',7,0),(62,'minotaur amazon',8,0),(62,'lizard chosen',0,1),(62,'drillworm',1,1),(62,'water buffalo',2,1),(62,'dark faun',3,1),(62,'lizard chosen',4,1),(62,'glooth anemone',5,1),(62,'crawler',6,1),(62,'swamp troll',7,1),(62,'deepling worker',8,1),(58,'lost husher',0,2),(58,'energy elemental',1,2),(58,'barbarian headsplitter',2,2),(58,'scarab',3,2),(58,'orclops doomhauler',4,2),(58,'elf arcanist',5,2),(58,'tomb servant',6,2),(58,'blightwalker',7,2),(58,'renegade quara hydromancer',8,2),(63,'ashmunrah',0,2),(63,'nightmare',1,2),(63,'cave rat',2,2),(63,'dragon lord',3,2),(63,'swan maiden',4,2),(63,'gargoyle',5,2),(63,'hellhound',6,2),(63,'merlkin',7,2),(63,'crazed beggar',8,2),(63,'sandstone scorpion',0,0),(63,'blood priest',1,0),(63,'hellfire fighter',2,0),(63,'monk',3,0),(63,'dragon lord',4,0),(63,'worm priestess',5,0),(63,'vexclaw',6,0),(63,'instable breach brood',7,0),(63,'choking fear',8,0),(63,'iron servant',0,1),(63,'rat',1,1),(63,'moohtant',2,1),(63,'swan maiden',3,1),(63,'nightmare',4,1),(63,'orc warlord',5,1),(63,'lost berserker',6,1),(63,'dragon',7,1),(63,'fire devil',8,1),(64,'dark torturer',0,0),(64,'chakoya windcaller',1,0),(64,'minotaur mage',2,0),(64,'hero',3,0),(64,'barbarian headsplitter',4,0),(64,'barbarian brutetamer',5,0),(64,'outburst',6,0),(64,'orewalker',7,0),(64,'ghoul',8,0),(64,'cave rat',0,1),(64,'deepling warrior',1,1),(64,'infected weeper',2,1),(64,'spectre',3,1),(64,'quara mantassin',4,1),(64,'jagged earth elemental',5,1),(64,'smuggler',6,1),(64,'sea serpent',7,1),(64,'orclops ravager',8,1),(65,'lost soul',0,0),(65,'banshee',1,0),(65,'slime',2,0),(65,'renegade quara hydromancer',3,0),(65,'diamond servant',4,0),(65,'pirate marauder',5,0),(65,'priestess',6,0),(65,'blue djinn',7,0),(65,'breach brood',8,0),(65,'orclops ravager',0,1),(65,'polar bear',1,1),(65,'lizard magistratus',2,1),(65,'insectoid worker',3,1),(65,'quara hydromancer scout',4,1),(65,'juggernaut',5,1),(65,'quara pincher',6,1),(65,'quara pincher scout',7,1),(65,'salamander',8,1),(3,'nightmare',0,0),(3,'wyvern',1,0),(3,'lost soul',2,0),(3,'frost dragon',3,0),(3,'demon outcast',4,0),(3,'ghost',5,0),(3,'mooh\'tah warrior',6,0),(3,'spider',7,0),(3,'wild warrior',8,0),(3,'crawler',0,1),(3,'dark monk',1,1),(3,'war golem',2,1),(3,'gazer',3,1),(3,'orc warrior',4,1),(3,'dipthrah',5,1),(3,'shock head',6,1),(3,'drillworm',7,1),(3,'chakoya tribewarden',8,1),(2,'bug',0,0),(2,'mooh\'tah warrior',1,0),(2,'dark torturer',2,0),(2,'guilt',3,0),(2,'ghastly dragon',4,0),(2,'ghost',5,0),(2,'hero',6,0),(2,'acid blob',7,0),(2,'quara mantassin',8,0),(2,'noble lion',0,1),(2,'elder mummy',1,1),(2,'vile grandmaster',2,1),(2,'crawler',3,1),(2,'leaf golem',4,1),(2,'dwarf geomancer',5,1),(2,'barbarian skullhunter',6,1),(2,'minotaur invader',7,1),(2,'chakoya windcaller',8,1),(4,'mutated human',0,0),(4,'roaring lion',1,0),(4,'sea serpent',2,0),(4,'frozen minion',3,0),(4,'slime',4,0),(4,'renegade quara pincher',5,0),(4,'hellspawn',6,0),(4,'skeleton warrior',7,0),(4,'hive overseer',8,0),(4,'diabolic imp',0,1),(4,'quara constrictor',1,1),(4,'insectoid worker',2,1),(4,'fire elemental',3,1),(4,'mad scientist',4,1),(4,'assassin',5,1),(4,'tomb servant',6,1),(4,'orc shaman',7,1),(4,'twisted shaper',8,1),(5,'shadow pupil',0,0),(5,'terror bird',1,0),(5,'banshee',2,0),(5,'worker golem',3,0),(5,'ashmunrah',4,0),(5,'hyaena',5,0),(5,'dworc voodoomaster',6,0),(5,'twisted pooka',7,0),(5,'wild warrior',8,0),(5,'lizard snakecharmer',0,1),(5,'war golem',1,1),(5,'dragon',2,1),(5,'draken elite',3,1),(5,'reality reaver',4,1),(5,'wyrm',5,1),(5,'moohtant',6,1),(5,'crazed beggar',7,1),(5,'swan maiden',8,1),(61,'dragon lord',0,1),(61,'ice golem',1,1),(61,'breach brood',2,1),(61,'mutated rat',3,1),(61,'blood beast',4,1),(61,'golden servant',5,1),(61,'salamander',6,1),(61,'sandcrawler',7,1),(61,'deepling scout',8,1),(66,'gozzler',0,0),(66,'vexclaw',1,0),(66,'damaged worker golem',2,0),(66,'kollos',3,0),(66,'worker golem',4,0),(66,'nightmare scion',5,0),(66,'green djinn',6,0),(66,'hellhound',7,0),(66,'midnight asura',8,0),(66,'nomadfemale',0,1),(66,'cobra',1,1),(66,'frost troll',2,1),(66,'monk',3,1),(66,'green djinn',4,1),(66,'dipthrah',5,1),(66,'wolf',6,1),(66,'quara pincher',7,1),(66,'wyrm',8,1),(67,'humongous fungus',0,0),(67,'frost dragon',1,0),(67,'instable breach brood',2,0),(67,'blood crab',3,0),(67,'renegade quara pincher',4,0),(67,'elf scout',5,0),(67,'instable breach brood',6,0),(67,'rot elemental',7,0),(67,'troll champion',8,0),(67,'swampling',0,1),(67,'nomadfemale',1,1),(67,'scorpion',2,1),(67,'magma crawler',3,1),(67,'deepling scout',4,1),(67,'destroyer',5,1),(67,'feversleep',6,1),(67,'tomb servant',7,1),(67,'choking fear',8,1),(43,'tortoise',0,0),(43,'witch',1,0),(43,'souleater',2,0),(43,'quara hydromancer',3,0),(43,'sea serpent',4,0),(43,'scarab',5,0),(43,'betrayed wraith',6,0),(43,'scorpion',7,0),(43,'shock head',8,0),(43,'retching horror',0,1),(43,'destroyer',1,1),(43,'insect swarm',2,1),(43,'quara predator scout',3,1),(43,'haunted treeling',4,1),(43,'slug',5,1),(43,'deepling worker',6,1),(43,'crystal spider',7,1),(43,'orc warlord',8,1),(43,'lizard snakecharmer',0,2),(43,'minotaur hunter',1,2),(43,'cyclops smith',2,2),(43,'cyclops drone',3,2),(43,'enslaved dwarf',4,2),(43,'marid',5,2),(43,'pirate corsair',6,2),(43,'wereboar',7,2),(43,'massive fire elemental',8,2),(6,'orc shaman',0,1),(6,'vexclaw',1,1),(6,'behemoth',2,1),(6,'spitter',3,1),(6,'grave guard',4,1),(6,'gnarlhound',5,1),(6,'muddy earth elemental',6,1),(6,'massive energy elemental',7,1),(6,'minotaur',8,1),(69,'amazon',0,0),(69,'barbarian brutetamer',1,0),(69,'quara constrictor scout',2,0),(69,'efreet',3,0),(69,'corym skirmisher',4,0),(69,'draken spellweaver',5,0),(69,'twisted pooka',6,0),(69,'skeleton',7,0),(69,'scorpion',8,0),(69,'troll champion',0,1),(69,'muddy earth elemental',1,1),(69,'dark magician',2,1),(69,'wereboar',3,1),(69,'crab',4,1),(69,'lich',5,1),(69,'spidris elite',6,1),(69,'crimson frog',7,1),(69,'minotaur amazon',8,1),(70,'chakoya toolshaper',0,0),(70,'deepling warrior',1,0),(70,'skeleton warrior',2,0),(70,'scarab',3,0),(70,'little corym charlatan',4,0),(70,'bonelord',5,0),(70,'braindeath',6,0),(70,'cyclops drone',7,0),(70,'hero',8,0),(70,'silencer',0,1),(70,'dark torturer',1,1),(70,'sacred spider',2,1),(70,'dark magician',3,1),(70,'hand of cursed fate',4,1),(70,'smuggler',5,1),(70,'spidris elite',6,1),(70,'banshee',7,1),(70,'lost berserker',8,1),(6,'cave rat',0,0),(6,'nightmare scion',1,0),(6,'thalas',2,0),(6,'quara predator scout',3,0),(6,'betrayed wraith',4,0),(6,'medusa',5,0),(6,'nomad',6,0),(6,'mutated rat',7,0),(6,'devourer',8,0),(41,'dark magician',0,0),(41,'goblin scavenger',1,0),(41,'dragon lord',2,0),(41,'black knight',3,0),(41,'orclops doomhauler',4,0),(41,'corym vanguard',5,0),(41,'crazed beggar',6,0),(41,'barbarian bloodwalker',7,0),(41,'chakoya tribewarden',8,0),(41,'blood beast',0,1),(41,'minotaur amazon',1,1),(41,'vampire viscount',2,1),(41,'orewalker',3,1),(41,'quara pincher scout',4,1),(41,'pirate ghost',5,1),(41,'efreet',6,1),(41,'tortoise',7,1),(41,'wolf',8,1),(41,'swan maiden',0,2),(41,'braindeath',1,2),(41,'seacrest serpent',2,2),(41,'kollos',3,2),(41,'overcharged energy elemental',4,2),(41,'deepling tyrant',5,2),(41,'dragon',6,2),(41,'clay guardian',7,2),(41,'mutated human',8,2),(73,'draken elite',0,0),(73,'ghastly dragon',1,0),(73,'efreet',2,0),(73,'hideous fungus',3,0),(73,'dragon lord hatchling',4,0),(73,'vile grandmaster',5,0),(73,'sandstone scorpion',6,0),(73,'wyrm',7,0),(73,'nomadfemale',8,0),(73,'feversleep',0,1),(73,'behemoth',1,1),(73,'firestarter',2,1),(73,'wild warrior',3,1),(73,'shadow pupil',4,1),(73,'spidris',5,1),(73,'ice golem',6,1),(73,'silencer',7,1),(73,'mutated rat',8,1),(74,'quara predator scout',0,0),(74,'tarnished spirit',1,0),(74,'minotaur archer',2,0),(74,'ashmunrah',3,0),(74,'draken warmaster',4,0),(74,'swamp troll',5,0),(74,'infernalist',6,0),(74,'choking fear',7,0),(74,'wiggler',8,0),(74,'vile grandmaster',0,1),(74,'midnight asura',1,1),(74,'deepling scout',2,1),(74,'fire devil',3,1),(74,'crystal spider',4,1),(74,'corym vanguard',5,1),(74,'ice golem',6,1),(74,'shock head',7,1),(74,'high voltage elemental',8,1),(42,'orc rider',0,1),(42,'demon',1,1),(42,'devourer',2,1),(42,'barbarian headsplitter',3,1),(42,'nightstalker',4,1),(42,'troll legionnaire',5,1),(42,'pirate skeleton',6,1),(42,'ironblight',7,1),(42,'orc warrior',8,1),(42,'noble lion',0,0),(42,'deepling worker',1,0),(42,'efreet',2,0),(42,'demon outcast',3,0),(42,'warlock',4,0),(42,'hunter',5,0),(42,'corym charlatan',6,0),(42,'weakened frazzlemaw',7,0),(42,'lizard sentinel',8,0),(75,'roaring lion',0,0),(75,'ghoul',1,0),(75,'nomadfemale',2,0),(75,'little corym charlatan',3,0),(75,'carrion worm',4,0),(75,'devourer',5,0),(75,'pirate corsair',6,0),(75,'draken elite',7,0),(75,'renegade quara predator',8,0),(75,'thalas',0,1),(75,'pirate buccaneer',1,1),(75,'iron servant',2,1),(75,'haunted treeling',3,1),(75,'bonebeast',4,1),(75,'minotaur amazon',5,1),(75,'lizard zaogun',6,1),(75,'wyrm',7,1),(75,'troll',8,1),(76,'gazer',0,0),(76,'orc shaman',1,0),(76,'lizard noble',2,0),(76,'water elemental',3,0),(76,'undead dragon',4,0),(76,'shadow pupil',5,0),(76,'chakoya windcaller',6,0),(76,'dark apprentice',7,0),(76,'thalas',8,0),(76,'mutated human',0,1),(76,'blood crab',1,1),(76,'nomadfemale',2,1),(76,'grave robber',3,1),(76,'smuggler',4,1),(76,'iron servant',5,1),(76,'thornback tortoise',6,1),(76,'poacher',7,1),(76,'weeper',8,1),(77,'overcharged energy elemental',0,0),(77,'hive overseer',1,0),(77,'marid',2,0),(77,'roaring water elemental',3,0),(77,'cyclops smith',4,0),(77,'gladiator',5,0),(77,'vile grandmaster',6,0),(77,'grave guard',7,0),(77,'terramite',8,0),(77,'valkyrie',0,1),(77,'snake',1,1),(77,'lizard legionnaire',2,1),(77,'energy elemental',3,1),(77,'chakoya windcaller',4,1),(77,'crimson frog',5,1),(77,'renegade quara constrictor',6,1),(77,'hero',7,1),(77,'choking fear',8,1),(78,'destroyer',0,0),(78,'chakoya toolshaper',1,0),(78,'toad',2,0),(78,'dwarf soldier',3,0),(78,'massive water elemental',4,0),(78,'retching horror',5,0),(78,'gravedigger',6,0),(78,'roaring water elemental',7,0),(78,'sparkion',8,0),(78,'armadile',0,1),(78,'crocodile',1,1),(78,'dragon hatchling',2,1),(78,'sight of surrender',3,1),(78,'minotaur archer',4,1),(78,'metal gargoyle',5,1),(78,'troll champion',6,1),(78,'little corym charlatan',7,1),(78,'chakoya windcaller',8,1),(79,'mutated rat',0,0),(79,'crawler',1,0),(79,'coral frog',2,0),(79,'insect swarm',3,0),(79,'firestarter',4,0),(79,'pirate buccaneer',5,0),(79,'lizard magistratus',6,0),(79,'war golem',7,0),(79,'larva',8,0),(79,'swamp troll',0,1),(79,'death blob',1,1),(79,'destroyer',2,1),(79,'mercury blob',3,1),(79,'mad scientist',4,1),(79,'worm priestess',5,1),(79,'wasp',6,1),(79,'novice of the cult',7,1),(79,'draken elite',8,1),(80,'lizard templar',0,0),(80,'frazzlemaw',1,0),(80,'dragon hatchling',2,0),(80,'lizard sentinel',3,0),(80,'sight of surrender',4,0),(80,'enraged crystal golem',5,0),(80,'energy elemental',6,0),(80,'warlock',7,0),(80,'wilting leaf golem',8,0),(80,'defiler',0,1),(80,'goblin scavenger',1,1),(80,'skunk',2,1),(80,'orc warlord',3,1),(80,'cliff strider',4,1),(80,'vulcongra',5,1),(80,'boogy',6,1),(80,'tarantula',7,1),(80,'massive water elemental',8,1),(81,'vampire',0,0),(81,'draken abomination',1,0),(81,'dworc voodoomaster',2,0),(81,'minion of versperoth',3,0),(81,'hive overseer',4,0),(81,'island troll',5,0),(81,'hellhound',6,0),(81,'barbarian brutetamer',7,0),(81,'mummy',8,0),(81,'tortoise',0,1),(81,'kongra',1,1),(81,'rorc',2,1),(81,'terror bird',3,1),(81,'renegade quara hydromancer',4,1),(81,'dark apprentice',5,1),(81,'hero',6,1),(81,'feversleep',7,1),(81,'lost thrower',8,1);
/*!40000 ALTER TABLE `player_prey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_preytimes`
--

DROP TABLE IF EXISTS `player_preytimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_preytimes` (
  `player_id` int(11) NOT NULL,
  `bonus_type1` int(11) NOT NULL,
  `bonus_value1` int(11) NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int(11) NOT NULL,
  `bonus_value2` int(11) NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int(11) NOT NULL,
  `bonus_value3` int(11) NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_preytimes`
--

LOCK TABLES `player_preytimes` WRITE;
/*!40000 ALTER TABLE `player_preytimes` DISABLE KEYS */;
INSERT INTO `player_preytimes` VALUES (19,0,0,'',0,0,'',0,0,''),(21,3,13,'Damaged Worker Golem',2,40,'Golgordan',3,40,'Snake God Essence'),(6,0,0,'',0,0,'',0,0,''),(22,0,0,'',0,0,'',0,0,''),(23,0,0,'',0,0,'',0,0,''),(24,0,0,'',0,0,'',0,0,''),(25,0,0,'',0,0,'',0,0,''),(26,0,9,'Wilting Leaf Golem',1,14,'Guilt',2,16,'Vexclaw'),(27,3,40,'Ghastly Dragon',1,16,'Grim Reaper',0,9,'Warlock'),(28,0,0,'',0,0,'',0,0,''),(29,2,40,'Frazzlemaw',2,40,'Guzzlemaw',2,40,'Frazzlemaw'),(30,0,0,'',0,0,'',0,0,''),(31,3,25,'Haunted Dragon',3,19,'Rift Scythe',1,20,'Priestess'),(32,0,0,'',0,0,'',0,0,''),(33,0,0,'',0,0,'',0,0,''),(34,0,0,'',0,0,'',0,0,''),(35,0,0,'',0,0,'',0,0,''),(37,0,0,'',0,0,'',0,0,''),(38,0,0,'',0,0,'',0,0,''),(39,0,0,'',0,0,'',0,0,''),(40,0,0,'',0,0,'',0,0,''),(41,0,0,'',0,0,'',0,0,''),(42,0,0,'',1,18,'Demon',0,0,''),(43,0,0,'',0,0,'',0,0,''),(44,0,0,'',0,0,'',0,0,''),(45,0,0,'',0,0,'',0,0,''),(46,0,0,'',0,0,'',0,0,''),(55,0,0,'',0,0,'',0,0,''),(57,0,0,'',0,0,'',0,0,''),(56,0,0,'',0,0,'',0,0,''),(58,1,14,'Thalas',0,0,'',0,0,''),(59,1,14,'Frazzlemaw',0,0,'',0,0,''),(60,0,0,'',0,0,'',0,0,''),(61,0,0,'',0,0,'',0,0,''),(62,0,0,'',0,0,'',0,0,''),(63,2,40,'Dragon Lord',1,28,'Dragon',2,40,'Dragon Lord'),(64,0,0,'',0,0,'',0,0,''),(65,2,16,'Pirate Marauder',3,31,'Orclops Ravager',0,0,''),(3,0,0,'',0,0,'',0,0,''),(2,0,0,'',0,0,'',0,0,''),(4,0,0,'',0,0,'',0,0,''),(1,0,0,'',0,0,'',0,0,''),(5,0,0,'',0,0,'',0,0,''),(66,0,0,'',0,0,'',0,0,''),(67,0,0,'',0,0,'',0,0,''),(68,0,0,'',0,0,'',0,0,''),(69,0,0,'',0,0,'',0,0,''),(70,0,0,'',0,0,'',0,0,''),(71,0,0,'',0,0,'',0,0,''),(73,0,0,'',0,0,'',0,0,''),(74,0,0,'',0,0,'',0,0,''),(75,0,0,'',0,0,'',0,0,''),(76,3,37,'Undead Dragon',1,22,'Weeper',0,0,''),(77,0,0,'',0,0,'',0,0,''),(78,0,0,'',0,0,'',0,0,''),(79,0,0,'',0,0,'',0,0,''),(80,0,0,'',0,0,'',0,0,''),(81,0,0,'',0,0,'',0,0,'');
/*!40000 ALTER TABLE `player_preytimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_rewards`
--

DROP TABLE IF EXISTS `player_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_rewards`
--

LOCK TABLES `player_rewards` WRITE;
/*!40000 ALTER TABLE `player_rewards` DISABLE KEYS */;
INSERT INTO `player_rewards` VALUES (6,101,1,21518,1,'H�['),(6,102,2,21518,1,'��['),(6,103,3,21518,1,'C['),(6,104,101,7427,1,''),(6,105,101,26191,1,''),(6,106,101,2146,2,''),(6,107,101,18413,3,''),(6,108,101,7590,2,''),(6,109,101,8473,2,''),(6,110,101,2152,7,''),(6,111,101,2148,40,'('),(6,112,101,2148,8,''),(6,113,102,7427,1,''),(6,114,102,18414,2,''),(6,115,102,2146,1,''),(6,116,102,7590,3,''),(6,117,102,8473,3,''),(6,118,102,2152,3,''),(6,119,102,2148,14,''),(6,120,102,2148,70,'F'),(6,121,103,25377,12,''),(6,122,103,2146,1,''),(6,123,103,2149,13,'\r'),(6,124,103,8473,1,''),(6,125,103,2152,1,''),(6,126,103,2148,34,'\"'),(21,101,1,21518,1,'\�e�Z'),(21,102,2,21518,1,'Ym�Z'),(21,103,3,21518,1,'\�m�Z'),(21,104,4,21518,1,'�p�Z'),(21,105,5,21518,1,',s�Z'),(21,106,6,21518,1,'\�t�Z'),(21,107,7,21518,1,'Su�Z'),(21,108,8,21518,1,'e��Z'),(21,109,9,21518,1,'��Z'),(21,110,10,21518,1,'\"ϲZ'),(21,111,11,21518,1,'nݲZ'),(21,112,12,21518,1,'�޲Z'),(21,113,13,21518,1,'�߲Z'),(21,114,14,21518,1,'\'\�Z'),(21,115,15,21518,1,'�\�Z'),(21,116,16,21518,1,'\�\�Z'),(21,117,17,21518,1,'�\�Z'),(21,118,18,21518,1,')?�Z'),(21,119,19,21518,1,'zA�Z'),(21,120,20,21518,1,'`B�Z'),(21,121,21,21518,1,'�B�Z'),(21,122,22,21518,1,'lC�Z'),(21,123,23,21518,1,'�D�Z'),(21,124,24,21518,1,'\�F�Z'),(21,125,25,21518,1,'?L�Z'),(21,126,26,21518,1,'	P�Z'),(21,127,27,21518,1,'lQ�Z'),(21,128,28,21518,1,'\nR�Z'),(21,129,29,21518,1,'�R�Z'),(21,130,30,21518,1,']U�Z'),(21,131,31,21518,1,'�U�Z'),(21,132,32,21518,1,'Ҭ�Z'),(21,133,33,21518,1,'Z��Z'),(21,134,34,21518,1,'ұ�Z'),(21,135,35,21518,1,'���Z'),(21,136,36,21518,1,'s��Z'),(21,137,37,21518,1,'��Z'),(21,138,38,21518,1,'��Z'),(21,139,39,21518,1,'��Z'),(21,140,40,21518,1,'��Z'),(21,141,41,21518,1,'!��Z'),(21,142,42,21518,1,'W��Z'),(21,143,43,21518,1,'n��Z'),(21,144,44,21518,1,'	��Z'),(21,145,45,21518,1,'x��Z'),(21,146,101,2152,4,''),(21,147,101,18413,1,''),(21,148,101,8472,3,''),(21,149,101,2148,67,'C'),(21,150,101,2148,1,''),(21,151,101,2148,100,'d'),(21,152,102,7440,1,''),(21,153,102,18415,2,''),(21,154,102,2152,19,''),(21,155,103,2436,1,''),(21,156,103,18415,1,''),(21,157,103,18414,2,''),(21,158,103,2152,22,''),(21,159,104,2147,7,''),(21,160,104,2152,20,''),(21,161,105,2150,5,''),(21,162,105,18413,1,''),(21,163,106,2148,81,'Q'),(21,164,106,2152,18,''),(21,165,107,2123,1,''),(21,166,107,2152,20,''),(21,167,108,7290,1,''),(21,168,108,2479,1,''),(21,169,108,2146,1,''),(21,170,108,2396,1,'\0'),(21,171,108,2145,3,''),(21,172,108,7589,1,''),(21,173,108,7588,2,''),(21,174,108,2152,1,''),(21,175,108,2148,23,''),(21,176,109,2152,3,''),(21,177,109,2148,40,'('),(21,178,109,2148,100,'d'),(21,179,110,25377,1,''),(21,180,110,2152,6,''),(21,181,110,2148,8,''),(21,182,111,2147,8,''),(21,183,111,2148,73,'I'),(21,184,112,2148,12,''),(21,185,112,2148,100,'d'),(21,186,112,18415,2,''),(21,187,112,8473,3,''),(21,188,112,2152,28,''),(21,189,113,2147,2,''),(21,190,113,22537,1,''),(21,191,113,18414,3,''),(21,192,113,2152,10,'\n'),(21,193,113,2148,28,''),(21,194,114,2150,2,''),(21,195,114,9971,1,''),(21,196,114,2148,11,''),(21,197,114,2148,25,''),(21,198,115,2396,1,'\0'),(21,199,115,2145,1,''),(21,200,115,7589,1,''),(21,201,115,7588,1,''),(21,202,115,7441,1,''),(21,203,115,2152,2,''),(21,204,115,2148,5,''),(21,205,116,8472,3,''),(21,206,116,2149,2,''),(21,207,116,2152,6,''),(21,208,116,2148,30,''),(21,209,116,2148,100,'d'),(21,210,117,26189,1,''),(21,211,117,2152,5,''),(21,212,117,2148,9,'	'),(21,213,117,2148,100,'d'),(21,214,118,18414,2,''),(21,215,118,2148,14,''),(21,216,118,2152,25,''),(21,217,119,7590,2,''),(21,218,119,2152,14,''),(21,219,120,7440,1,''),(21,220,120,2152,2,''),(21,221,121,2148,46,'.'),(21,222,122,2145,4,''),(21,223,122,2148,72,'H'),(21,224,123,9970,9,'	'),(21,225,123,2152,22,''),(21,226,124,2150,1,''),(21,227,124,18414,2,''),(21,228,124,2148,14,''),(21,229,125,7440,1,''),(21,230,125,2152,23,''),(21,231,126,2158,1,''),(21,232,126,2148,21,''),(21,233,126,18414,2,''),(21,234,126,2152,11,''),(21,235,127,2150,5,''),(21,236,127,2145,10,'\n'),(21,237,127,7633,1,''),(21,238,127,25377,1,''),(21,239,128,8901,1,''),(21,240,128,2150,10,'\n'),(21,241,128,7633,1,''),(21,242,128,22396,2,''),(21,243,128,25377,1,''),(21,244,128,2148,81,'Q'),(21,245,129,2150,8,''),(21,246,129,2152,3,''),(21,247,130,7440,1,''),(21,248,130,2147,10,'\n'),(21,249,130,18413,2,''),(21,250,131,2150,2,''),(21,251,131,2145,1,''),(21,252,131,25172,1,''),(21,253,131,18413,2,''),(21,254,132,2147,5,''),(21,255,132,18414,4,''),(21,256,132,6500,1,''),(21,257,132,2152,23,''),(21,258,132,2148,1,''),(21,259,133,2152,5,''),(21,260,133,8473,1,''),(21,261,133,2148,62,'>'),(21,262,133,2148,13,'\r'),(21,263,134,2146,1,''),(21,264,134,2396,1,'\0'),(21,265,134,2145,4,''),(21,266,134,7589,2,''),(21,267,134,7588,1,''),(21,268,134,7441,1,''),(21,269,134,2152,2,''),(21,270,134,2148,6,''),(21,271,135,7892,1,''),(21,272,135,2145,5,''),(21,273,135,7589,2,''),(21,274,135,7588,1,''),(21,275,135,2152,1,''),(21,276,135,2148,46,'.'),(21,277,135,10578,1,''),(21,278,136,2152,5,''),(21,279,136,2148,2,''),(21,280,136,2148,100,'d'),(21,281,137,9970,1,''),(21,282,137,7590,2,''),(21,283,137,18414,3,''),(21,284,137,2152,15,''),(21,285,137,2148,31,''),(21,286,137,2479,1,''),(21,287,137,2145,3,''),(21,288,137,7589,3,''),(21,289,137,2152,2,''),(21,290,137,2148,52,'4'),(21,291,137,2148,38,'&'),(21,292,137,2152,22,''),(21,293,138,7451,1,''),(21,294,138,18413,2,''),(21,295,138,2148,60,'<'),(21,296,138,2152,1,''),(21,297,138,7368,4,''),(21,298,138,5948,1,''),(21,299,138,2148,4,''),(21,300,138,2148,84,'T'),(21,301,139,27757,1,''),(21,302,139,26031,5,''),(21,303,139,2158,1,''),(21,304,139,2152,25,''),(21,305,139,2148,71,'G'),(21,306,139,2148,100,'d'),(21,307,140,7892,1,''),(21,308,140,2145,3,''),(21,309,140,7589,3,''),(21,310,140,7588,2,''),(21,311,140,7441,1,''),(21,312,140,2152,2,''),(21,313,140,2148,50,'2'),(21,314,140,21697,1,''),(21,315,140,2152,1,''),(21,316,140,18413,5,''),(21,317,140,18415,3,''),(21,318,140,5882,1,''),(21,319,140,2148,58,':'),(21,320,140,2148,46,'.'),(21,321,140,18413,4,''),(21,322,140,2148,20,''),(21,323,140,2152,13,'\r'),(21,324,140,24851,1,''),(21,325,140,7590,2,''),(21,326,140,2147,3,''),(21,327,140,6500,1,''),(21,328,140,2152,7,''),(21,329,140,2148,24,''),(21,330,141,8472,1,''),(21,331,141,2152,31,''),(21,332,141,2148,71,'G'),(21,333,142,5909,4,''),(21,334,142,2152,30,''),(21,335,142,2148,72,'H'),(21,336,143,24849,1,''),(21,337,143,8472,4,''),(21,338,143,2152,34,'\"'),(21,339,143,2148,5,''),(21,340,143,2148,100,'d'),(21,341,144,26031,4,''),(21,342,144,26164,1,''),(21,343,144,2152,7,''),(21,344,144,2148,73,'I'),(21,345,144,2148,100,'d'),(21,346,144,18413,3,''),(21,347,145,5909,1,''),(21,348,145,25377,2,''),(21,349,145,2152,17,''),(21,350,145,2148,42,'*'),(21,351,145,2148,100,'d'),(22,101,1,21518,1,'Su�Z'),(22,102,101,8903,1,''),(22,103,101,22396,2,''),(22,104,101,25377,1,''),(23,101,1,21518,1,'HQ�Z'),(23,102,2,21518,1,'�[�Z'),(23,103,101,2150,1,''),(23,104,101,2145,10,'\n'),(23,105,101,7590,2,''),(23,106,101,18415,2,''),(23,107,102,2148,90,'Z'),(23,108,102,2148,100,'d'),(23,109,102,2147,3,''),(23,110,102,5891,1,''),(23,111,102,2152,2,''),(29,101,1,21518,1,'�O�Z'),(29,102,101,5880,1,''),(29,103,101,2149,14,''),(29,104,101,2152,31,''),(29,105,101,2148,14,''),(29,106,101,2148,100,'d'),(31,101,1,21518,1,'\��Z'),(31,102,2,21518,1,'��Z'),(31,103,101,2148,52,'4'),(31,104,101,2152,2,''),(31,105,102,2147,9,'	'),(31,106,102,2152,11,''),(34,101,1,21518,1,'dZ'),(34,102,2,21518,1,'&dZ'),(34,103,3,21518,1,'�dZ'),(34,104,4,21518,1,'�dZ'),(34,105,5,21518,1,'�dZ'),(34,106,101,8472,90,'Z'),(34,107,102,7590,88,'X'),(34,108,102,2152,45,'-'),(34,109,102,7590,3,''),(34,110,102,2168,1,''),(34,111,102,2158,1,''),(34,112,102,7590,14,''),(34,113,102,8473,46,'.'),(34,114,103,7590,28,''),(34,115,103,8473,96,'`'),(34,116,103,7368,33,'!'),(34,117,104,8472,24,''),(34,118,104,7368,50,'2'),(34,119,105,6529,1,''),(34,120,105,7590,45,'-'),(34,121,105,8473,90,'Z'),(34,122,105,7368,72,'H'),(42,101,1,21518,1,'�C['),(42,102,2,21518,1,'qD['),(42,103,3,21518,1,'�D['),(42,104,4,21518,1,'�=['),(42,105,5,21518,1,'5?['),(42,106,6,21518,1,'@['),(42,107,7,21518,1,'2@['),(42,108,8,21518,1,'�@['),(42,109,9,21518,1,'�@['),(42,110,10,21518,1,'�@['),(42,111,11,21518,1,'\�@['),(42,112,12,21518,1,'$A['),(42,113,13,21518,1,'\�A['),(42,114,14,21518,1,'&B['),(42,115,15,21518,1,'kB['),(42,116,16,21518,1,'C['),(42,117,101,25377,5,''),(42,118,101,26133,1,''),(42,119,101,2153,1,''),(42,120,101,7901,1,''),(42,121,101,2155,1,''),(42,122,101,2470,1,''),(42,123,101,7633,1,''),(42,124,101,26164,1,''),(42,125,101,2147,14,''),(42,126,101,2150,2,''),(42,127,101,8473,5,''),(42,128,101,2148,87,'W'),(42,129,102,25377,6,''),(42,130,102,2470,1,''),(42,131,102,2146,1,''),(42,132,102,2147,7,''),(42,133,102,18413,2,''),(42,134,102,7590,3,''),(42,135,102,8473,3,''),(42,136,102,2148,22,''),(42,137,103,25377,4,''),(42,138,103,7901,1,''),(42,139,103,2146,2,''),(42,140,103,7590,5,''),(42,141,103,8473,5,''),(42,142,103,2152,16,''),(42,143,104,26166,1,''),(42,144,104,26165,1,''),(42,145,104,25377,3,''),(42,146,104,7427,1,''),(42,147,104,26130,1,''),(42,148,104,7451,1,''),(42,149,104,26187,1,''),(42,150,104,26185,1,''),(42,151,104,7901,1,''),(42,152,104,2155,1,''),(42,153,104,2158,1,''),(42,154,104,18414,5,''),(42,155,104,8473,2,''),(42,156,104,9970,5,''),(42,157,104,2145,5,''),(42,158,104,2150,6,''),(42,159,104,18415,2,''),(42,160,104,26201,1,''),(42,161,104,2152,7,''),(42,162,104,2148,12,''),(42,163,104,2148,100,'d'),(42,164,105,26191,4,''),(42,165,105,18414,2,''),(42,166,105,18415,3,''),(42,167,105,8473,2,''),(42,168,105,2152,3,''),(42,169,105,2148,86,'V'),(42,170,105,2148,22,''),(42,171,106,26162,1,''),(42,172,106,26191,2,''),(42,173,106,2146,2,''),(42,174,106,18413,1,''),(42,175,106,7590,2,''),(42,176,106,8473,4,''),(42,177,106,2152,3,''),(42,178,106,2148,89,'Y'),(42,179,106,2148,7,''),(42,180,107,26191,3,''),(42,181,107,18413,2,''),(42,182,107,8473,2,''),(42,183,107,2152,1,''),(42,184,107,2148,72,'H'),(42,185,107,2148,57,'9'),(42,186,108,26165,1,''),(42,187,108,26191,4,''),(42,188,108,8473,2,''),(42,189,108,2152,4,''),(42,190,108,2148,1,''),(42,191,108,2148,22,''),(42,192,109,26165,1,''),(42,193,109,25377,1,''),(42,194,109,26162,1,''),(42,195,109,26191,5,''),(42,196,109,2146,1,''),(42,197,109,8473,1,''),(42,198,109,2152,5,''),(42,199,109,2148,36,'$'),(42,200,109,2148,42,'*'),(42,201,110,26165,1,''),(42,202,110,26191,5,''),(42,203,110,8473,2,''),(42,204,110,2148,40,'('),(42,205,110,2148,1,''),(42,206,111,8473,2,''),(42,207,111,2152,1,''),(42,208,111,2148,6,''),(42,209,111,2148,59,';'),(42,210,112,25377,1,''),(42,211,112,8901,1,''),(42,212,112,8903,1,''),(42,213,112,26189,1,''),(42,214,112,26185,1,''),(42,215,112,2155,1,''),(42,216,112,26191,1,''),(42,217,112,2445,1,''),(42,218,112,18414,2,''),(42,219,112,2147,5,''),(42,220,112,2152,7,''),(42,221,112,2148,1,''),(42,222,112,2148,100,'d'),(42,223,112,2148,46,'.'),(42,224,113,25377,9,'	'),(42,225,113,26189,1,''),(42,226,113,26130,1,''),(42,227,113,2155,1,''),(42,228,113,26164,1,''),(42,229,113,2146,2,''),(42,230,113,2147,11,''),(42,231,113,2149,4,''),(42,232,113,8472,5,''),(42,233,113,8473,2,''),(42,234,113,2152,10,'\n'),(42,235,113,2148,66,'B'),(42,236,114,25377,3,''),(42,237,114,2645,1,''),(42,238,114,8901,1,''),(42,239,114,26174,1,''),(42,240,114,26187,1,''),(42,241,114,26176,1,''),(42,242,114,2155,1,''),(42,243,114,2158,1,''),(42,244,114,18414,1,''),(42,245,114,9970,5,''),(42,246,114,2150,4,''),(42,247,114,8472,5,''),(42,248,114,2152,4,''),(42,249,114,2148,50,'2'),(42,250,114,2148,78,'N'),(42,251,115,26162,1,''),(42,252,115,26191,1,''),(42,253,115,18414,2,''),(42,254,115,2146,2,''),(42,255,115,2150,1,''),(42,256,115,8473,2,''),(42,257,115,2152,7,''),(42,258,115,2148,85,'U'),(42,259,115,2148,94,'^'),(42,260,116,26166,1,''),(42,261,116,26165,1,''),(42,262,116,25377,2,''),(42,263,116,7427,1,''),(42,264,116,26130,1,''),(42,265,116,26187,1,''),(42,266,116,26185,1,''),(42,267,116,7898,1,''),(42,268,116,7901,1,''),(42,269,116,2155,1,''),(42,270,116,26167,1,''),(42,271,116,9970,4,''),(42,272,116,2145,3,''),(42,273,116,2150,7,''),(42,274,116,18415,1,''),(42,275,116,2152,29,''),(42,276,116,2148,78,'N'),(44,101,1,21518,1,'�['),(44,102,2,21518,1,'��['),(44,103,3,21518,1,'V�['),(44,104,4,21518,1,'��['),(44,105,5,21518,1,'\��['),(44,106,6,21518,1,'C['),(44,107,101,26191,2,''),(44,108,101,8473,3,''),(44,109,101,2152,6,''),(44,110,101,2148,26,'\Z'),(44,111,101,2148,34,'\"'),(44,112,102,26166,1,''),(44,113,102,25377,3,''),(44,114,102,26130,1,''),(44,115,102,26187,1,''),(44,116,102,26185,1,''),(44,117,102,7895,1,''),(44,118,102,7901,1,''),(44,119,102,2155,1,''),(44,120,102,18450,1,''),(44,121,102,8473,2,''),(44,122,102,9970,3,''),(44,123,102,2145,7,''),(44,124,102,2150,4,''),(44,125,102,18415,1,''),(44,126,102,2152,13,'\r'),(44,127,102,2148,72,'H'),(44,128,102,2148,100,'d'),(44,129,103,7427,1,''),(44,130,103,26191,3,''),(44,131,103,2146,1,''),(44,132,103,18413,3,''),(44,133,103,7590,2,''),(44,134,103,8473,1,''),(44,135,103,2152,6,''),(44,136,103,2148,79,'O'),(44,137,104,26165,1,''),(44,138,104,18413,1,''),(44,139,104,8473,4,''),(44,140,104,2152,6,''),(44,141,104,2148,94,'^'),(44,142,104,2148,76,'L'),(44,143,105,2645,1,''),(44,144,105,8903,1,''),(44,145,105,26174,1,''),(44,146,105,26189,1,''),(44,147,105,2155,1,''),(44,148,105,18414,3,''),(44,149,105,9970,3,''),(44,150,105,2150,1,''),(44,151,105,2152,9,'	'),(44,152,105,2148,61,'='),(44,153,105,2148,23,''),(44,154,106,26133,1,''),(44,155,106,26130,1,''),(44,156,106,2146,1,''),(44,157,106,2147,15,''),(44,158,106,2149,4,''),(44,159,106,2150,4,''),(44,160,106,18413,3,''),(44,161,106,8473,4,''),(44,162,106,2152,5,''),(44,163,106,2148,60,'<'),(57,101,1,21518,1,'�\�Z'),(57,102,2,21518,1,'��\�Z'),(57,103,3,21518,1,'F�\�Z'),(57,104,4,21518,1,'L�\�Z'),(57,105,5,21518,1,'\�\�Z'),(57,106,6,21518,1,'��\�Z'),(57,107,7,21518,1,'Ž\�Z'),(57,108,101,2156,1,''),(57,109,102,2148,1,''),(57,110,102,2152,8,''),(57,111,103,2152,28,''),(57,112,103,2148,51,'3'),(57,113,104,6500,1,''),(57,114,104,2152,8,''),(57,115,104,2148,30,''),(57,116,104,2155,1,''),(57,117,105,2152,2,''),(57,118,105,2148,15,''),(57,119,105,2148,13,'\r'),(57,120,106,2147,10,'\n'),(57,121,106,25377,1,''),(57,122,106,2152,20,''),(57,123,106,2148,21,''),(57,124,106,18413,2,''),(57,125,107,9970,42,'*'),(57,126,107,7417,1,''),(57,127,107,7633,1,''),(57,128,107,7632,2,''),(57,129,107,7451,1,''),(57,130,107,7895,1,''),(57,131,107,2127,1,''),(57,132,107,2542,1,''),(57,133,107,7894,1,''),(57,134,107,8885,1,''),(57,135,107,2520,1,''),(57,136,107,8902,1,''),(57,137,107,2470,1,''),(57,138,107,8903,1,''),(57,139,107,9971,1,''),(57,140,107,2148,23,''),(57,141,107,2148,100,'d'),(57,142,8,21518,1,''),(57,143,142,11262,1,''),(57,144,142,5911,1,''),(57,145,142,5914,1,''),(57,146,142,18414,12,''),(57,147,142,2158,1,''),(57,148,142,22598,3,''),(57,149,142,7368,86,''),(58,101,1,21518,1,'F�\�Z'),(58,102,2,21518,1,'L�\�Z'),(58,103,3,21518,1,'\�\�Z'),(58,104,4,21518,1,'��\�Z'),(58,105,5,21518,1,'Ž\�Z'),(58,106,6,21518,1,'H�\�Z'),(58,107,7,21518,1,'y�\�Z'),(58,108,8,21518,1,'\��\�Z'),(58,109,9,21518,1,'\�\�Z'),(58,110,101,2152,25,''),(58,111,101,2148,43,'+'),(58,112,101,2148,100,'d'),(58,113,101,18413,4,''),(58,114,102,2152,5,''),(58,115,102,2148,8,''),(58,116,103,2152,4,''),(58,117,103,5882,1,''),(58,118,103,2148,40,'('),(58,119,103,2148,9,'	'),(58,120,104,7440,1,''),(58,121,104,8472,3,''),(58,122,104,2152,13,'\r'),(58,123,104,2148,19,''),(58,124,104,2148,100,'d'),(58,125,104,18413,1,''),(58,126,105,5944,3,''),(58,127,105,7407,1,''),(58,128,105,8926,1,''),(58,129,105,7417,1,''),(58,130,105,7632,1,''),(58,131,105,7451,1,''),(58,132,105,7405,1,''),(58,133,105,7885,1,''),(58,134,105,2539,1,''),(58,135,105,7896,1,''),(58,136,105,2542,1,''),(58,137,105,8885,1,''),(58,138,105,2466,1,''),(58,139,105,8903,1,''),(58,140,105,9971,1,''),(58,141,105,2148,73,'I'),(58,142,105,2148,100,'d'),(58,143,106,8904,1,''),(58,144,106,8901,1,''),(58,145,106,8473,1,''),(58,146,106,7405,1,''),(58,147,106,6500,1,''),(58,148,106,6300,1,''),(58,149,106,5954,2,''),(58,150,106,2214,1,''),(58,151,106,2178,1,''),(58,152,106,2174,1,''),(58,153,106,2164,1,'\0'),(58,154,106,2158,1,''),(58,155,106,2152,39,'\''),(58,156,106,2151,6,''),(58,157,106,2150,9,'	'),(58,158,106,2145,3,''),(58,159,107,11259,1,''),(58,160,107,22401,1,''),(58,161,107,5914,1,''),(58,162,107,8472,52,'4'),(58,163,107,7590,88,'X'),(58,164,107,8473,93,']'),(58,165,107,22598,1,''),(58,166,107,2152,21,''),(58,167,108,15412,1,''),(58,168,108,15406,1,''),(58,169,109,2152,25,''),(58,170,109,2148,50,'2'),(58,171,109,2148,100,'d'),(60,101,1,21518,1,'�\�Z'),(60,102,2,21518,1,'��\�Z'),(60,103,3,21518,1,'F�\�Z'),(60,104,4,21518,1,'L�\�Z'),(60,105,5,21518,1,'\�\�Z'),(60,106,6,21518,1,'��\�Z'),(60,107,7,21518,1,'Ž\�Z'),(60,108,8,21518,1,'\'�\�Z'),(60,109,9,21518,1,'H�\�Z'),(60,110,10,21518,1,'y�\�Z'),(60,111,11,21518,1,'\�\�Z'),(60,112,101,2453,1,''),(60,113,102,2149,3,''),(60,114,102,2148,94,'^'),(60,115,102,2148,100,'d'),(60,116,102,2152,18,''),(60,117,103,22537,1,''),(60,118,103,9970,5,''),(60,119,103,18414,2,''),(60,120,103,2152,27,''),(60,121,103,2148,33,'!'),(60,122,103,2148,100,'d'),(60,123,104,2158,1,''),(60,124,104,2152,18,''),(60,125,104,2148,45,'-'),(60,126,104,2148,100,'d'),(60,127,105,2152,4,''),(60,128,105,2148,21,''),(60,129,105,2148,15,''),(60,130,106,2152,27,''),(60,131,106,2148,57,'9'),(60,132,107,7422,1,''),(60,133,107,9970,13,'\r'),(60,134,107,7427,1,''),(60,135,107,2514,1,''),(60,136,107,7885,1,''),(60,137,107,2539,1,''),(60,138,107,7896,1,''),(60,139,107,2127,1,''),(60,140,107,7894,1,''),(60,141,107,8885,1,''),(60,142,107,2520,1,''),(60,143,107,8868,1,''),(60,144,107,2470,1,''),(60,145,107,8903,1,''),(60,146,107,9971,2,''),(60,147,107,2148,70,'F'),(60,148,107,2148,100,'d'),(60,149,108,8473,1,''),(60,150,108,7590,1,''),(60,151,108,7368,37,'%'),(60,152,108,6500,1,''),(60,153,108,6300,1,''),(60,154,108,5954,1,''),(60,155,108,2520,1,''),(60,156,108,2472,1,''),(60,157,108,2470,1,''),(60,158,108,2393,1,''),(60,159,108,2214,1,''),(60,160,108,2152,62,'>'),(60,161,108,2151,2,''),(60,162,108,2150,6,''),(60,163,108,2149,1,''),(60,164,108,2146,2,''),(60,165,108,2145,5,''),(60,166,108,2144,6,''),(60,167,108,2143,9,'	'),(60,168,108,2125,1,''),(60,169,108,2033,1,''),(60,170,109,8904,1,''),(60,171,109,8901,1,''),(60,172,109,8473,1,''),(60,173,109,8472,1,''),(60,174,109,6553,1,''),(60,175,109,6500,1,''),(60,176,109,5954,1,''),(60,177,109,2178,1,''),(60,178,109,2158,1,''),(60,179,109,2152,67,'C'),(60,180,109,2151,1,''),(60,181,109,2150,12,''),(60,182,109,2146,9,'	'),(60,183,109,2143,2,''),(60,184,109,2124,1,''),(60,185,110,11258,1,''),(60,186,110,11259,1,''),(60,187,110,11262,1,''),(60,188,110,22611,1,''),(60,189,110,5954,1,''),(60,190,110,18415,2,''),(60,191,111,2152,20,''),(60,192,111,2148,26,'\Z'),(81,101,1,21518,1,'H�['),(81,102,2,21518,1,'��['),(81,103,3,21518,1,'V�['),(81,104,4,21518,1,'��['),(81,105,5,21518,1,'\��['),(81,106,6,21518,1,'C['),(81,107,101,26165,1,''),(81,108,101,26166,1,''),(81,109,101,7427,1,''),(81,110,101,26191,4,''),(81,111,101,2146,2,''),(81,112,101,2150,2,''),(81,113,101,18413,1,''),(81,114,101,7590,2,''),(81,115,101,8473,5,''),(81,116,101,2152,6,''),(81,117,101,2148,93,']'),(81,118,101,2148,14,''),(81,119,102,26166,1,''),(81,120,102,26165,1,''),(81,121,102,25377,2,''),(81,122,102,26130,1,''),(81,123,102,26187,1,''),(81,124,102,26185,1,''),(81,125,102,7895,1,''),(81,126,102,7901,1,''),(81,127,102,2155,1,''),(81,128,102,18414,4,''),(81,129,102,9970,5,''),(81,130,102,2145,1,''),(81,131,102,18415,1,''),(81,132,102,2152,11,''),(81,133,102,2148,69,'E'),(81,134,103,26165,1,''),(81,135,103,26166,1,''),(81,136,103,26191,1,''),(81,137,103,18414,2,''),(81,138,103,2146,1,''),(81,139,103,7590,2,''),(81,140,103,8473,5,''),(81,141,103,2152,7,''),(81,142,103,2148,89,'Y'),(81,143,103,2148,28,''),(81,144,104,26191,2,''),(81,145,104,2146,1,''),(81,146,104,2150,2,''),(81,147,104,18413,1,''),(81,148,104,7590,4,''),(81,149,104,8473,2,''),(81,150,104,2152,6,''),(81,151,104,2148,53,'5'),(81,152,104,2148,45,'-'),(81,153,105,26165,1,''),(81,154,105,25377,1,''),(81,155,105,8901,1,''),(81,156,105,26189,1,''),(81,157,105,26187,1,''),(81,158,105,26185,1,''),(81,159,105,2445,1,''),(81,160,105,2158,1,''),(81,161,105,18414,2,''),(81,162,105,2147,3,''),(81,163,105,2150,3,''),(81,164,105,2152,3,''),(81,165,105,2148,65,'A'),(81,166,105,2148,5,''),(81,167,106,25172,1,''),(81,168,106,25377,6,''),(81,169,106,26133,1,''),(81,170,106,2153,1,''),(81,171,106,2149,19,''),(81,172,106,7590,2,''),(81,173,106,8472,2,''),(81,174,106,8473,3,''),(81,175,106,2148,4,'');
/*!40000 ALTER TABLE `player_rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_spells`
--

DROP TABLE IF EXISTS `player_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_spells`
--

LOCK TABLES `player_spells` WRITE;
/*!40000 ALTER TABLE `player_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_storage`
--

DROP TABLE IF EXISTS `player_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`player_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_storage`
--

LOCK TABLES `player_storage` WRITE;
/*!40000 ALTER TABLE `player_storage` DISABLE KEYS */;
INSERT INTO `player_storage` VALUES (1,12130,1),(1,12131,3),(1,12132,6),(1,12133,3),(1,12134,2),(1,12135,7),(1,12136,3),(1,12137,3),(1,12138,2),(1,12200,1),(1,12201,3),(1,12202,5),(1,12203,3),(1,12204,2),(1,12205,6),(1,12206,8),(1,12207,3),(1,12208,4),(1,12209,2),(1,12210,2),(1,12211,2),(1,12212,6),(1,50722,1523386600),(1,69801,0),(1,69802,1523386595),(1,151610,1),(1,151620,1),(1,151630,1),(1,151640,1),(2,12130,1),(2,12131,3),(2,12132,6),(2,12133,3),(2,12134,2),(2,12135,7),(2,12136,3),(2,12137,3),(2,12138,2),(2,12200,1),(2,12201,3),(2,12202,5),(2,12203,3),(2,12204,2),(2,12205,6),(2,12206,8),(2,12207,3),(2,12208,4),(2,12209,2),(2,12210,2),(2,12211,2),(2,12212,6),(2,50722,1523386602),(2,69801,0),(2,69802,1523386597),(2,151610,1),(2,151620,1),(2,151630,1),(2,151640,1),(2,8420390,0),(2,8420391,0),(3,12130,1),(3,12131,3),(3,12132,6),(3,12133,3),(3,12134,2),(3,12135,7),(3,12136,3),(3,12137,3),(3,12138,2),(3,12200,1),(3,12201,3),(3,12202,5),(3,12203,3),(3,12204,2),(3,12205,6),(3,12206,8),(3,12207,3),(3,12208,4),(3,12209,2),(3,12210,2),(3,12211,2),(3,12212,6),(3,50722,1523386593),(3,69801,0),(3,69802,1523386588),(3,151610,1),(3,151620,1),(3,151630,1),(3,151640,1),(3,8420390,0),(3,8420391,0),(4,12130,1),(4,12131,3),(4,12132,6),(4,12133,3),(4,12134,2),(4,12135,7),(4,12136,3),(4,12137,3),(4,12138,2),(4,12200,1),(4,12201,3),(4,12202,5),(4,12203,3),(4,12204,2),(4,12205,6),(4,12206,8),(4,12207,3),(4,12208,4),(4,12209,2),(4,12210,2),(4,12211,2),(4,12212,6),(4,50722,1523386598),(4,69801,0),(4,69802,1523386599),(4,151610,1),(4,151620,1),(4,151630,1),(4,151640,1),(4,8420390,0),(4,8420391,0),(5,12130,1),(5,12131,3),(5,12132,6),(5,12133,3),(5,12134,2),(5,12135,7),(5,12136,3),(5,12137,3),(5,12138,2),(5,12200,1),(5,12201,3),(5,12202,5),(5,12203,3),(5,12204,2),(5,12205,6),(5,12206,8),(5,12207,3),(5,12208,4),(5,12209,2),(5,12210,2),(5,12211,2),(5,12212,6),(5,50722,1523386596),(5,69801,0),(5,69802,1523386591),(5,151610,1),(5,151620,1),(5,151630,1),(5,151640,1),(5,8420390,0),(5,8420391,0),(6,0,5),(6,1,1526705061),(6,90,1),(6,91,5),(6,106,31),(6,500,1),(6,501,1522614122),(6,502,0),(6,503,1522614124),(6,900,1),(6,1014,1),(6,1826,1),(6,1827,1),(6,1828,1),(6,2085,1),(6,2087,1),(6,2089,1),(6,2924,0),(6,3001,1),(6,3006,1),(6,3938,3),(6,3939,3),(6,3940,5),(6,3941,15),(6,8000,1),(6,9206,1),(6,9212,1),(6,9213,1),(6,9217,1),(6,9229,1),(6,10001,1),(6,10018,0),(6,10019,1),(6,10142,1),(6,10143,3),(6,10144,5),(6,10158,1525114556),(6,10162,1525109038),(6,10168,1),(6,10195,1),(6,12050,1),(6,12051,1),(6,12052,1),(6,12120,1),(6,12121,18),(6,12130,3),(6,12132,6),(6,12133,3),(6,12134,2),(6,12135,7),(6,12136,3),(6,12137,3),(6,12138,2),(6,12200,1),(6,12201,3),(6,12202,5),(6,12203,3),(6,12204,2),(6,12205,6),(6,12206,8),(6,12207,3),(6,12208,4),(6,12209,2),(6,12210,2),(6,12211,2),(6,12212,6),(6,12650,1),(6,12651,3),(6,12652,6),(6,12653,4),(6,12700,1),(6,12701,3),(6,12702,2),(6,12703,1),(6,12704,3),(6,12705,5),(6,12706,1),(6,12707,1),(6,12710,4),(6,20003,2),(6,20024,2),(6,20149,6),(6,20162,13),(6,20201,1),(6,20202,5),(6,20279,77),(6,38412,75),(6,39401,1),(6,41121,1527117586),(6,41131,1),(6,41132,1),(6,41314,1),(6,41320,1),(6,41334,1),(6,42421,1),(6,44741,1),(6,44874,0),(6,44875,0),(6,49825,1),(6,49826,1525490092),(6,49828,1525560951),(6,49830,1527464239),(6,49831,1527464339),(6,50722,0),(6,50892,1522285515),(6,51052,0),(6,53051,1),(6,56530,2),(6,69799,1526709600),(6,69800,1526688029),(6,69801,0),(6,69802,1527513781),(6,69803,6),(6,72326,1),(6,72328,3),(6,83783,1),(6,88419,1),(6,99963,1),(6,99964,1),(6,99965,1),(6,99966,1),(6,99969,1),(6,99970,1),(6,99971,1),(6,100157,1),(6,151610,1),(6,151620,1),(6,151630,1),(6,151640,1),(6,151650,1),(6,151660,1),(6,151670,1),(6,151680,1),(6,180810,1),(6,243325,1),(6,494934,1525127557),(6,507244,1),(6,641311,1),(6,666999,0),(6,8420390,0),(6,8420391,0),(6,10002011,1),(6,234124124,1),(21,9130,1),(21,12600,1),(21,12603,2),(21,12604,6),(21,12606,3),(21,12608,2),(41,0,1527385704),(41,1,1522108720),(41,83,1),(41,90,1),(41,200,0),(41,201,0),(41,202,0),(41,203,0),(41,204,0),(41,205,0),(41,258,2),(41,900,25),(41,901,112),(41,902,6),(41,903,2),(41,904,3126),(41,905,3127),(41,906,3124),(41,907,3125),(41,908,3126),(41,909,3126),(41,910,3124),(41,911,8),(41,921,10),(41,930,0),(41,931,1526781436),(41,933,0),(41,935,1526781439),(41,1007,1),(41,1008,1),(41,1010,4),(41,1013,3),(41,1014,5),(41,1016,1),(41,1100,1),(41,1534,0),(41,1535,0),(41,1537,0),(41,1544,0),(41,2085,1),(41,2087,1),(41,2212,1),(41,2213,2),(41,2214,1),(41,2215,2),(41,2500,11),(41,2924,0),(41,3040,1),(41,3250,1),(41,3900,31),(41,3901,2),(41,3902,2),(41,3903,2),(41,3904,3),(41,3905,3),(41,3906,5),(41,3907,2),(41,3908,5),(41,3909,4),(41,3910,1),(41,3913,1525118273),(41,3914,1),(41,3915,1),(41,3916,4),(41,3917,1),(41,3918,1),(41,3919,1),(41,3920,1),(41,3922,1),(41,3923,1),(41,3924,2),(41,3925,1),(41,3926,1),(41,3927,1),(41,3929,1),(41,3930,1),(41,3931,1),(41,3932,1),(41,3933,1),(41,3934,1),(41,3938,3),(41,3939,3),(41,3940,5),(41,3941,15),(41,4000,1),(41,4002,1),(41,4004,1),(41,8000,1),(41,8288,11),(41,8289,11),(41,8290,11),(41,8291,11),(41,9050,1),(41,9054,1),(41,9127,1),(41,9193,1),(41,9197,1),(41,9198,1),(41,9229,1),(41,10018,0),(41,10019,0),(41,10140,1),(41,10141,1),(41,10143,0),(41,10144,0),(41,10149,1524387470),(41,10150,1523893492),(41,10151,1524266970),(41,10152,1525994995),(41,10153,1524267065),(41,10154,1525103952),(41,10155,1524266708),(41,10157,1524266801),(41,10158,1525993435),(41,10159,1524267332),(41,10161,1525923970),(41,10195,1),(41,12000,1),(41,12001,1),(41,12002,1),(41,12003,1),(41,12004,1),(41,12005,6),(41,12006,1),(41,12007,1),(41,12008,0),(41,12009,0),(41,12010,1),(41,12011,2),(41,12012,3),(41,12013,10),(41,12014,2),(41,12015,17),(41,12016,1522026575),(41,12017,1521944298),(41,12018,6),(41,12019,1),(41,12020,1),(41,12050,1),(41,12051,1),(41,12052,1),(41,12053,1),(41,12054,1),(41,12055,5),(41,12066,7),(41,12067,7),(41,12068,2),(41,12071,1),(41,12120,1),(41,12121,18),(41,12122,1),(41,12130,3),(41,12132,6),(41,12133,3),(41,12134,2),(41,12135,7),(41,12136,3),(41,12137,3),(41,12138,2),(41,12153,2),(41,12154,0),(41,12155,7),(41,12156,1521995252),(41,12160,25),(41,12161,7),(41,12162,3),(41,12163,6),(41,12164,3),(41,12165,3),(41,12166,3),(41,12167,5),(41,12170,1),(41,12171,1),(41,12172,1),(41,12173,1),(41,12174,1),(41,12175,20),(41,12176,6),(41,12177,1),(41,12178,1),(41,12200,1),(41,12201,3),(41,12202,5),(41,12203,3),(41,12204,2),(41,12205,6),(41,12206,8),(41,12207,3),(41,12208,4),(41,12209,2),(41,12210,2),(41,12211,2),(41,12212,6),(41,12400,1),(41,12401,2),(41,12403,12),(41,12650,1),(41,12651,3),(41,12652,6),(41,12653,4),(41,12700,1),(41,12701,3),(41,12702,4),(41,12703,1),(41,12704,3),(41,12705,5),(41,12706,1),(41,12707,1),(41,12710,4),(41,13100,1),(41,18999,2),(41,20003,4),(41,20024,4),(41,20068,2),(41,20162,9),(41,20279,12),(41,20300,3),(41,22029,1),(41,22030,1),(41,22222,1),(41,22223,1),(41,22555,1),(41,22556,0),(41,23042,1),(41,23043,1),(41,23543,2),(41,23619,1),(41,25521,1),(41,26587,1),(41,26588,1),(41,27079,1),(41,30018,1),(41,35018,1),(41,35019,1),(41,35021,1),(41,35027,1),(41,37121,1),(41,38412,9),(41,41114,1),(41,41115,1),(41,41121,1526875717),(41,41132,1),(41,41133,1),(41,41300,1),(41,41314,1),(41,41319,1),(41,41320,1),(41,41330,1),(41,41331,1),(41,41334,1),(41,42421,1),(41,44741,1),(41,44874,0),(41,44875,0),(41,47706,2),(41,47707,1),(41,47708,1),(41,48984,3),(41,48985,1),(41,48987,1),(41,48994,1),(41,49825,1),(41,49826,1526091002),(41,49827,1526704701),(41,49828,1526712248),(41,49829,1526775146),(41,49830,1526790103),(41,49831,1526875254),(41,50032,1),(41,50033,1),(41,50035,1),(41,50036,1),(41,50037,1),(41,50080,9),(41,50081,8),(41,50083,4),(41,50095,1),(41,50137,2),(41,50138,5),(41,50140,1),(41,50250,10),(41,50251,4),(41,50252,3),(41,50253,4),(41,50254,1),(41,50722,0),(41,50892,1522286051),(41,51052,0),(41,51053,1524797797),(41,53051,1),(41,56530,1),(41,56531,1),(41,56532,1),(41,56533,1),(41,56534,1),(41,60045,1522786210),(41,65044,666),(41,69799,1526796000),(41,69800,1526710968),(41,69801,0),(41,69802,1527543552),(41,69803,3),(41,72326,5),(41,72328,4),(41,83783,1),(41,83784,1),(41,83785,1),(41,91017,1),(41,99963,1),(41,99964,1),(41,99965,1),(41,99966,1),(41,99969,1),(41,99970,1),(41,99971,1),(41,100157,1),(41,151610,1),(41,151620,1),(41,151630,1),(41,151640,1),(41,151650,1),(41,151660,1),(41,151670,1),(41,151680,1),(41,242925,1),(41,243025,1),(41,243325,1),(41,300010,1),(41,300019,1),(41,300022,1),(41,300029,1),(41,300039,1),(41,300040,1),(41,300095,1),(41,300112,1),(41,300128,1),(41,300141,1),(41,300147,1),(41,300226,1),(41,300230,1),(41,300268,1),(41,300273,1),(41,300297,1),(41,300300,1),(41,300303,1),(41,324329,1522033410),(41,412431,1),(41,494934,1522025632),(41,507244,1),(41,641311,1),(41,641312,1),(41,641313,1),(41,666999,0),(41,6874100,1),(41,6874101,100),(41,6874102,100),(41,6874107,100),(41,8420390,0),(41,8420391,0),(41,10001001,8912899),(41,10001002,8388611),(41,10001003,8454147),(41,10001004,8978435),(41,10001005,8585219),(41,10001006,9109507),(41,10001007,9043971),(41,10001008,8716291),(41,10001009,62586883),(41,10001010,62652419),(41,10001011,9240579),(41,10001012,8519683),(41,10001013,9699331),(41,10001014,9437187),(41,10001015,9633795),(41,10001016,9371651),(41,10001017,9175043),(41,10001018,8650755),(41,10001019,9830403),(41,10001020,9568259),(41,10001021,9306115),(41,10001022,8781827),(41,10001023,9502723),(41,10001024,9764867),(41,10001025,28180483),(41,10001026,28246019),(41,10001027,10223617),(41,10001028,9961475),(41,10001029,10027011),(41,10001030,10289155),(41,10001031,17629187),(41,10001032,17563651),(41,10001033,37683203),(41,10001034,37617667),(41,10001035,33619971),(41,10001036,33554435),(41,10001037,35454979),(41,10001038,35520515),(41,10001039,18874371),(41,10001040,18939907),(41,10001041,37814275),(41,10001042,37879811),(41,10001043,28311555),(41,10001044,28377091),(41,10001045,30343171),(41,10001046,30408707),(41,10001047,17694721),(41,10001048,17891329),(41,10002002,768),(41,10002003,16777216),(41,10002004,3674161),(41,10002011,87),(42,0,1),(42,1,1522089708),(42,90,62),(42,92,1),(42,93,2),(42,94,1),(42,96,1),(42,97,1),(42,98,1),(42,99,1),(42,100,1),(42,900,5),(42,901,91),(42,954,3),(42,959,1),(42,1007,1),(42,1541,1),(42,2089,1),(42,2500,100),(42,2924,0),(42,3001,1),(42,3006,1),(42,3040,1),(42,3250,1),(42,3938,3),(42,3939,3),(42,3940,5),(42,3941,15),(42,4001,1),(42,4002,1),(42,9054,1),(42,9184,1),(42,9186,1),(42,9221,1),(42,9222,1),(42,9223,1),(42,9876,1),(42,9920,1),(42,9921,1),(42,9922,1),(42,9923,1),(42,9924,1),(42,9925,1),(42,9926,1),(42,9927,1),(42,9928,1),(42,9929,1),(42,9930,1),(42,9931,1),(42,9932,1),(42,9933,1),(42,9934,1),(42,9935,1),(42,9936,1),(42,9937,1),(42,9938,1),(42,9939,1),(42,9940,1),(42,9941,1),(42,9942,1),(42,9943,1),(42,9944,1),(42,9945,1),(42,9949,2),(42,9950,1),(42,9951,1),(42,9952,1),(42,9953,1),(42,9954,1),(42,9955,1),(42,9956,1),(42,9957,1),(42,9958,1),(42,9959,1),(42,9960,1),(42,9961,1),(42,9962,1),(42,9963,1),(42,9965,1),(42,9966,1),(42,9967,1),(42,9968,1),(42,9969,1),(42,9970,1),(42,9971,1),(42,9972,1),(42,9973,1),(42,9974,1),(42,9975,1),(42,9976,1),(42,9977,1),(42,9978,1),(42,9979,1),(42,9980,1),(42,9981,1),(42,9982,1),(42,9983,1),(42,9984,1),(42,9985,1),(42,9986,1),(42,9987,1),(42,9988,1),(42,9989,1),(42,9990,1),(42,9991,1),(42,9992,1),(42,9993,1),(42,9994,1),(42,9995,1),(42,9996,1),(42,9997,1),(42,9998,1),(42,9999,1),(42,12010,1),(42,12061,6),(42,12067,4),(42,12120,1),(42,12121,18),(42,12130,3),(42,12132,6),(42,12133,3),(42,12134,2),(42,12135,7),(42,12136,3),(42,12137,3),(42,12138,2),(42,12200,1),(42,12201,3),(42,12202,5),(42,12203,3),(42,12204,2),(42,12205,6),(42,12206,8),(42,12207,3),(42,12208,4),(42,12209,2),(42,12210,2),(42,12211,2),(42,12212,6),(42,12600,1),(42,12602,1),(42,12603,1),(42,12607,1),(42,12650,1),(42,12651,3),(42,12652,6),(42,12653,4),(42,12700,1),(42,12701,3),(42,12702,2),(42,12703,1),(42,12704,3),(42,12705,5),(42,12706,1),(42,12707,1),(42,12710,4),(42,12902,1),(42,12903,1),(42,20162,70),(42,20279,15),(42,22409,1),(42,22732,1),(42,25521,1),(42,30018,1),(42,38412,13),(42,41114,1),(42,41115,1),(42,41121,1527464530),(42,41132,1),(42,41314,1),(42,41319,1),(42,41320,1),(42,41330,1),(42,41334,1),(42,41600,3),(42,42421,1),(42,42600,2),(42,42610,1),(42,44741,1),(42,49825,1),(42,49826,1527463160),(42,49827,1527463715),(42,49828,1527463766),(42,49829,1527464588),(42,49830,1527464536),(42,49831,1527464339),(42,50083,4),(42,50702,2),(42,50712,1),(42,50722,0),(42,50892,1522285762),(42,56530,0),(42,56531,1),(42,56532,1),(42,56533,1),(42,56534,1),(42,65041,0),(42,69799,1524722400),(42,69800,1524718250),(42,69801,0),(42,69802,1527462774),(42,69803,1),(42,83783,1),(42,99963,1),(42,99964,1),(42,99965,1),(42,99966,1),(42,99969,1),(42,99970,1),(42,99971,1),(42,100157,1),(42,151610,1),(42,151620,1),(42,151630,1),(42,151640,1),(42,151650,1),(42,151660,1),(42,151670,1),(42,151680,1),(42,157443,1),(42,180810,1),(42,300141,1),(42,300273,1),(42,300303,1),(42,324329,1522074567),(42,324330,1522034934),(42,494934,1522026949),(42,507244,1),(42,641311,1),(42,641312,1),(42,641313,1),(42,666999,0),(42,790014,1525956402),(42,6874100,1),(42,6874101,100),(42,6874102,100),(42,6874107,100),(42,8420390,0),(42,8420391,0),(42,10001001,9175042),(42,10001002,8650754),(42,10001003,9240578),(42,10001004,8519682),(42,10001005,28180483),(42,10001006,28246019),(42,10001007,17629187),(42,10001008,17563651),(42,10001009,37683203),(42,10001010,37617667),(42,10001011,63438851),(42,10001012,63504387),(42,10001013,30343168),(42,10001014,30408704),(42,10002001,1812852467),(42,10002002,13513),(42,10002003,16777220),(42,10002004,49),(42,10002011,87),(43,0,0),(43,1,1526340474),(43,90,7),(43,102,7),(43,118,4),(43,200,0),(43,900,12),(43,901,223),(43,904,3127),(43,905,3124),(43,906,3127),(43,907,3127),(43,908,3124),(43,909,3126),(43,910,3124),(43,911,1),(43,1014,5),(43,1100,4),(43,1103,1),(43,1105,1),(43,1107,1),(43,2209,1),(43,2210,1),(43,3001,1),(43,4001,1),(43,4002,1),(43,8818,1),(43,9183,1),(43,9184,1),(43,9221,1),(43,9222,1),(43,9223,1),(43,10018,0),(43,10019,1),(43,10132,1),(43,10134,1),(43,10140,1),(43,10141,1),(43,10142,1),(43,10149,1524268053),(43,10151,1524266970),(43,10153,1524267065),(43,10155,1524266708),(43,10157,1524266801),(43,10158,1525106109),(43,10159,1524267332),(43,10161,1525923970),(43,10162,1525037404),(43,10163,1),(43,10167,1),(43,12008,2),(43,12009,0),(43,12010,0),(43,12011,2),(43,12012,2),(43,12017,1526715121),(43,12050,1),(43,12051,1),(43,12052,1),(43,12053,1),(43,12176,1),(43,12570,1),(43,13100,0),(43,20024,2),(43,20279,43),(43,25610,1),(43,25611,1),(43,25612,1),(43,26100,1),(43,26300,1),(43,26587,1),(43,26588,1),(43,27100,1),(43,27300,1),(43,28100,1),(43,28300,1),(43,38412,41),(43,41114,1),(43,41115,1),(43,41121,1527464058),(43,41320,1),(43,41330,1),(43,41334,1),(43,42421,1),(43,44741,1),(43,49825,1),(43,49826,1525565813),(43,49827,1526700480),(43,49831,1527464339),(43,50140,2),(43,50141,2),(43,50142,2),(43,50702,1),(43,50712,1),(43,50715,1),(43,50722,0),(43,51052,0),(43,51053,1522786910),(43,56530,0),(43,69799,1526709600),(43,69800,1526688396),(43,69801,0),(43,69802,1527462775),(43,69803,4),(43,72328,3),(43,83783,1),(43,83784,1),(43,83785,1),(43,99963,1),(43,99964,1),(43,99965,1),(43,99966,1),(43,99969,1),(43,99970,1),(43,99971,1),(43,100157,1),(43,242925,1),(43,243125,1),(43,243325,1),(43,243525,1),(43,300084,1),(43,300168,1),(43,300298,1),(43,324329,1522033726),(43,494934,1523281801),(43,507244,1),(43,666999,0),(43,8420390,0),(43,8420391,0),(43,10001001,8912898),(43,10001002,8388610),(43,10002011,96),(44,1,1524923353),(44,90,1),(44,1534,0),(44,1544,0),(44,1826,1),(44,1827,1),(44,1828,1),(44,2089,1),(44,3044,1),(44,4001,1),(44,4002,1),(44,9054,1),(44,10018,0),(44,10136,1),(44,10167,1),(44,12000,1),(44,12001,1),(44,12002,1),(44,12003,1),(44,12004,1),(44,12005,1),(44,12006,1),(44,12007,1),(44,12010,0),(44,12062,2),(44,12063,0),(44,12064,11),(44,12400,1),(44,12403,1),(44,20279,957),(44,22222,1),(44,22223,1),(44,22409,1),(44,22555,1),(44,22556,1),(44,35018,1),(44,35027,1),(44,38412,955),(44,41114,1),(44,41115,1),(44,41121,1527120048),(44,41131,1),(44,41314,1),(44,41319,1),(44,41320,1),(44,41330,1),(44,41331,1),(44,41334,1),(44,42421,1),(44,44741,1),(44,48984,1),(44,48994,1),(44,49825,1),(44,49826,1527118019),(44,49827,1527116996),(44,49828,1527118237),(44,49829,1527119240),(44,49830,1527119743),(44,49831,1527120106),(44,50084,4),(44,50712,1),(44,50722,0),(44,51052,0),(44,51053,1523109321),(44,69799,1524808800),(44,69800,1524725501),(44,69801,0),(44,69802,1527546124),(44,69803,1),(44,99963,1),(44,99964,1),(44,99965,1),(44,99966,1),(44,99969,1),(44,99970,1),(44,99971,1),(44,100157,1),(44,243325,1),(44,300010,1),(44,300025,1),(44,300147,1),(44,300285,1),(44,300301,1),(44,324329,1522033423),(44,494934,1525123447),(44,507244,1),(44,641311,1),(44,641312,1),(44,641313,1),(44,666999,0),(44,6874100,1),(44,6874101,100),(44,6874102,100),(44,6874107,100),(44,8420390,0),(44,8420391,0),(44,10001001,9043971),(44,10001002,8716291),(44,10001003,28180483),(44,10001004,28246019),(44,10001005,18284547),(44,10001006,18219011),(44,10001007,37683203),(44,10001008,37617667),(44,10002004,1),(45,0,41650),(45,2924,0),(45,3938,3),(45,3939,3),(45,3940,5),(45,3941,15),(45,12120,1),(45,12121,18),(45,12130,3),(45,12132,6),(45,12133,3),(45,12134,2),(45,12135,7),(45,12136,3),(45,12137,3),(45,12138,2),(45,12200,1),(45,12201,3),(45,12202,5),(45,12203,3),(45,12204,2),(45,12205,6),(45,12206,8),(45,12207,3),(45,12208,4),(45,12209,2),(45,12210,2),(45,12211,2),(45,12212,6),(45,12650,1),(45,12651,3),(45,12652,6),(45,12653,4),(45,12700,1),(45,12701,3),(45,12702,2),(45,12703,1),(45,12704,3),(45,12705,5),(45,12706,1),(45,12707,1),(45,12710,4),(45,30018,1),(45,37121,1),(45,42600,2),(45,42610,2),(45,42620,2),(45,43600,1524857863),(45,50722,0),(45,69801,0),(45,69802,1525631938),(45,99963,1),(45,99964,1),(45,99965,1),(45,99966,1),(45,99969,1),(45,99970,1),(45,99971,1),(45,151610,1),(45,151620,1),(45,151630,1),(45,151640,1),(45,151650,1),(45,151660,1),(45,151670,1),(45,151680,1),(45,180810,1),(45,507244,1),(45,666999,0),(45,8420390,0),(45,8420391,0),(45,10001001,28180483),(45,10001002,28246019),(45,10001003,30343168),(45,10001004,30408704),(45,10002001,1048576),(45,10002011,21),(46,3938,3),(46,3939,3),(46,3940,5),(46,3941,15),(46,12120,1),(46,12121,18),(46,12130,3),(46,12132,6),(46,12133,3),(46,12134,2),(46,12135,7),(46,12136,3),(46,12137,3),(46,12138,2),(46,12200,1),(46,12201,3),(46,12202,5),(46,12203,3),(46,12204,2),(46,12205,6),(46,12206,8),(46,12207,3),(46,12208,4),(46,12209,2),(46,12210,2),(46,12211,2),(46,12212,6),(46,12650,1),(46,12651,3),(46,12652,6),(46,12653,4),(46,12700,1),(46,12701,3),(46,12702,2),(46,12703,1),(46,12704,3),(46,12705,5),(46,12706,1),(46,12707,1),(46,12710,4),(46,50722,1525130817),(46,69801,0),(46,69802,1525130812),(46,99963,1),(46,99964,1),(46,99965,1),(46,99966,1),(46,99969,1),(46,99970,1),(46,99971,1),(46,151610,1),(46,151620,1),(46,151630,1),(46,151640,1),(46,151650,1),(46,151660,1),(46,151670,1),(46,151680,1),(46,180810,1),(46,8420390,0),(46,8420391,0),(46,10001001,28180481),(46,10001002,28246017),(55,10136,1),(55,10167,1),(55,50722,0),(55,51052,0),(55,51053,1523112325),(55,69801,0),(55,69802,1525627544),(55,99963,1),(55,99964,1),(55,99965,1),(55,99966,1),(55,99969,1),(55,99970,1),(55,99971,1),(55,243325,1),(55,10001001,28180483),(55,10001002,28246019),(56,3938,3),(56,3939,3),(56,3940,5),(56,3941,15),(56,12120,1),(56,12121,18),(56,12130,3),(56,12132,6),(56,12133,3),(56,12134,2),(56,12135,7),(56,12136,3),(56,12137,3),(56,12138,2),(56,12200,1),(56,12201,3),(56,12202,5),(56,12203,3),(56,12204,2),(56,12205,6),(56,12206,8),(56,12207,3),(56,12208,4),(56,12209,2),(56,12210,2),(56,12211,2),(56,12212,6),(56,12650,1),(56,12651,3),(56,12652,6),(56,12653,4),(56,12700,1),(56,12701,3),(56,12702,2),(56,12703,1),(56,12704,3),(56,12705,5),(56,12706,1),(56,12707,1),(56,12710,4),(56,50722,0),(56,69801,0),(56,69802,1523227675),(56,99963,1),(56,99964,1),(56,99965,1),(56,99966,1),(56,99969,1),(56,99970,1),(56,99971,1),(56,151610,1),(56,151620,1),(56,151630,1),(56,151640,1),(56,151650,1),(56,151660,1),(56,151670,1),(56,151680,1),(56,180810,1),(57,0,1523228685),(57,1,1523229250),(57,3938,3),(57,3939,3),(57,3940,5),(57,3941,15),(57,10132,1),(57,10133,1),(57,10134,1),(57,10135,1),(57,10136,1),(57,10137,1),(57,10139,1),(57,10140,1),(57,10141,1),(57,10142,1),(57,10143,0),(57,10144,0),(57,10145,5),(57,10149,1523303489),(57,10150,1525031729),(57,10151,1523304378),(57,10152,1525032687),(57,10153,1523305312),(57,10154,1525033862),(57,10155,1523306587),(57,10156,1525035054),(57,10157,1523307362),(57,10159,1523307845),(57,10160,1525036089),(57,10163,1),(57,10164,1),(57,10166,1),(57,10167,1),(57,10168,1),(57,12120,1),(57,12121,18),(57,12130,3),(57,12132,6),(57,12133,3),(57,12134,2),(57,12135,7),(57,12136,3),(57,12137,3),(57,12138,2),(57,12200,1),(57,12201,3),(57,12202,5),(57,12203,3),(57,12204,2),(57,12205,6),(57,12206,8),(57,12207,3),(57,12208,4),(57,12209,2),(57,12210,2),(57,12211,2),(57,12212,6),(57,12650,1),(57,12651,3),(57,12652,6),(57,12653,4),(57,12700,1),(57,12701,3),(57,12702,2),(57,12703,1),(57,12704,3),(57,12705,5),(57,12706,1),(57,12707,1),(57,12710,4),(57,20279,431),(57,24883,1),(57,26587,1),(57,26588,1),(57,30018,1),(57,38412,429),(57,50722,0),(57,51052,0),(57,51053,1523234401),(57,69799,1523253600),(57,69800,1523236782),(57,69801,1),(57,69802,1523236787),(57,69803,1),(57,99963,1),(57,99964,1),(57,99965,1),(57,99966,1),(57,99969,1),(57,99970,1),(57,99971,1),(57,151610,1),(57,151620,1),(57,151630,1),(57,151640,1),(57,151650,1),(57,151660,1),(57,151670,1),(57,151680,1),(57,180810,1),(57,242925,1),(57,243025,1),(57,243125,1),(57,243225,1),(57,243325,1),(57,243425,1),(57,507244,1),(57,666999,1),(57,935481,1),(57,8420390,0),(57,8420391,0),(57,10001001,55902211),(57,10001002,55836675),(57,10002002,131072),(57,10002004,2097152),(57,10002011,49),(58,0,1523228875),(58,1,1523229325),(58,3938,3),(58,3939,3),(58,3940,5),(58,3941,15),(58,10132,1),(58,10133,1),(58,10134,1),(58,10135,1),(58,10136,1),(58,10137,1),(58,10140,1),(58,10141,1),(58,10142,1),(58,10143,0),(58,10144,0),(58,10145,7),(58,10149,1523303489),(58,10150,1525031729),(58,10151,1523304378),(58,10152,1525032687),(58,10153,1523305312),(58,10154,1525033868),(58,10155,1523306587),(58,10156,1525035054),(58,10157,1523307362),(58,10159,1523307845),(58,10160,1525036089),(58,10162,1525037404),(58,10163,1),(58,10164,1),(58,10166,1),(58,10167,1),(58,10168,1),(58,12120,1),(58,12121,18),(58,12130,3),(58,12132,6),(58,12133,3),(58,12134,2),(58,12135,7),(58,12136,3),(58,12137,3),(58,12138,2),(58,12200,1),(58,12201,3),(58,12202,5),(58,12203,3),(58,12204,2),(58,12205,6),(58,12206,8),(58,12207,3),(58,12208,4),(58,12209,2),(58,12210,2),(58,12211,2),(58,12212,6),(58,12650,1),(58,12651,3),(58,12652,6),(58,12653,4),(58,12700,1),(58,12701,3),(58,12702,2),(58,12703,1),(58,12704,3),(58,12705,5),(58,12706,1),(58,12707,1),(58,12710,4),(58,20279,612),(58,24883,1),(58,26587,1),(58,26588,1),(58,30018,1),(58,38412,610),(58,50722,0),(58,51052,0),(58,51053,1523237589),(58,69799,1523253600),(58,69800,1523226747),(58,69801,1),(58,69802,1523237764),(58,69803,1),(58,99963,1),(58,99964,1),(58,99965,1),(58,99966,1),(58,99969,1),(58,99970,1),(58,99971,1),(58,151610,1),(58,151620,1),(58,151630,1),(58,151640,1),(58,151650,1),(58,151660,1),(58,151670,1),(58,151680,1),(58,180810,1),(58,242925,1),(58,243025,1),(58,243125,1),(58,243225,1),(58,243325,1),(58,243425,1),(58,243525,1),(58,507244,1),(58,666999,1),(58,8420390,0),(58,8420391,0),(58,10001001,63045635),(58,10001002,63111171),(58,10001003,44826627),(58,10001004,44761091),(58,10002002,16),(58,10002004,2097152),(58,10002011,115),(59,0,0),(59,1,1523228347),(59,3938,3),(59,3939,3),(59,3940,5),(59,3941,15),(59,10132,1),(59,10133,1),(59,10134,1),(59,10135,1),(59,10136,1),(59,10137,1),(59,10139,1),(59,10140,1),(59,10141,1),(59,10142,1),(59,10143,0),(59,10144,0),(59,10145,5),(59,10149,1523303489),(59,10150,1525031729),(59,10151,1523304378),(59,10152,1525032687),(59,10153,1523305312),(59,10154,1525033868),(59,10155,1523306587),(59,10156,1525035054),(59,10157,1523307362),(59,10159,1523307845),(59,10160,1525036089),(59,10163,1),(59,10164,1),(59,10166,1),(59,10167,1),(59,10168,1),(59,12120,1),(59,12121,18),(59,12130,3),(59,12132,6),(59,12133,3),(59,12134,2),(59,12135,7),(59,12136,3),(59,12137,3),(59,12138,2),(59,12200,1),(59,12201,3),(59,12202,5),(59,12203,3),(59,12204,2),(59,12205,6),(59,12206,8),(59,12207,3),(59,12208,4),(59,12209,2),(59,12210,2),(59,12211,2),(59,12212,6),(59,12650,1),(59,12651,3),(59,12652,6),(59,12653,4),(59,12700,1),(59,12701,3),(59,12702,2),(59,12703,1),(59,12704,3),(59,12705,5),(59,12706,1),(59,12707,1),(59,12710,4),(59,20279,875),(59,24883,1),(59,26587,1),(59,26588,1),(59,30018,1),(59,38412,873),(59,44741,1),(59,50722,0),(59,69801,0),(59,69802,1526844168),(59,99963,1),(59,99964,1),(59,99965,1),(59,99966,1),(59,99969,1),(59,99970,1),(59,99971,1),(59,151610,1),(59,151620,1),(59,151630,1),(59,151640,1),(59,151650,1),(59,151660,1),(59,151670,1),(59,151680,1),(59,180810,1),(59,242925,1),(59,243025,1),(59,243125,1),(59,243225,1),(59,243325,1),(59,243425,1),(59,507244,1),(59,666999,0),(59,935481,1),(59,8420390,0),(59,8420391,0),(59,10001001,63438851),(59,10001002,63504387),(59,10001003,28180483),(59,10001004,28246019),(59,10002003,4),(59,10002011,65),(60,0,6),(60,1,1523231905),(60,3938,3),(60,3939,3),(60,3940,5),(60,3941,15),(60,10132,1),(60,10133,1),(60,10134,1),(60,10135,1),(60,10136,1),(60,10137,1),(60,10139,1),(60,10140,1),(60,10141,1),(60,10142,1),(60,10143,0),(60,10144,0),(60,10145,10),(60,10149,1523303489),(60,10150,1525031729),(60,10151,1523304378),(60,10152,1525032687),(60,10153,1523305312),(60,10154,1525033868),(60,10155,1523306587),(60,10156,1525035054),(60,10157,1523307362),(60,10159,1523307845),(60,10160,1525036089),(60,10163,1),(60,10164,1),(60,10166,1),(60,10167,1),(60,10168,1),(60,12120,1),(60,12121,18),(60,12130,3),(60,12132,6),(60,12133,3),(60,12134,2),(60,12135,7),(60,12136,3),(60,12137,3),(60,12138,2),(60,12200,1),(60,12201,3),(60,12202,5),(60,12203,3),(60,12204,2),(60,12205,6),(60,12206,8),(60,12207,3),(60,12208,4),(60,12209,2),(60,12210,2),(60,12211,2),(60,12212,6),(60,12650,1),(60,12651,3),(60,12652,6),(60,12653,4),(60,12700,1),(60,12701,3),(60,12702,2),(60,12703,1),(60,12704,3),(60,12705,5),(60,12706,1),(60,12707,1),(60,12710,4),(60,20279,721),(60,24883,1),(60,26587,1),(60,26588,1),(60,30018,1),(60,38412,719),(60,50722,0),(60,69801,0),(60,69802,1523237681),(60,99963,1),(60,99964,1),(60,99965,1),(60,99966,1),(60,99969,1),(60,99970,1),(60,99971,1),(60,151610,1),(60,151620,1),(60,151630,1),(60,151640,1),(60,151650,1),(60,151660,1),(60,151670,1),(60,151680,1),(60,180810,1),(60,242925,1),(60,243025,1),(60,243125,1),(60,243225,1),(60,243325,1),(60,243425,1),(60,507244,1),(60,666999,1),(60,8420390,0),(60,8420391,0),(60,10001001,63045635),(60,10001002,63111171),(60,10002004,64),(60,10002011,100),(61,0,1523384720),(61,1,1523229446),(61,1100,2),(61,3250,1),(61,3938,3),(61,3939,3),(61,3940,5),(61,3941,15),(61,10132,1),(61,10133,1),(61,10134,1),(61,10135,1),(61,10136,1),(61,10137,1),(61,10139,1),(61,10140,1),(61,10141,1),(61,10142,1),(61,10143,0),(61,10144,0),(61,10145,6),(61,10149,1523303489),(61,10150,1525031729),(61,10151,1523304378),(61,10152,1525032687),(61,10153,1523305312),(61,10154,1525033868),(61,10155,1523306587),(61,10156,1525035054),(61,10157,1523307362),(61,10159,1523307845),(61,10160,1525036089),(61,10163,1),(61,10164,1),(61,10166,1),(61,10167,1),(61,10168,1),(61,12120,1),(61,12121,18),(61,12130,3),(61,12132,6),(61,12133,3),(61,12134,2),(61,12135,7),(61,12136,3),(61,12137,3),(61,12138,2),(61,12200,1),(61,12201,3),(61,12202,5),(61,12203,3),(61,12204,2),(61,12205,6),(61,12206,8),(61,12207,3),(61,12208,4),(61,12209,2),(61,12210,2),(61,12211,2),(61,12212,6),(61,12650,1),(61,12651,3),(61,12652,6),(61,12653,4),(61,12700,1),(61,12701,3),(61,12702,2),(61,12703,1),(61,12704,3),(61,12705,5),(61,12706,1),(61,12707,1),(61,12710,4),(61,13100,1),(61,20279,1724),(61,24883,1),(61,26100,1),(61,26587,1),(61,26588,1),(61,30018,1),(61,38412,1722),(61,44421,4),(61,50140,2),(61,50141,1),(61,50722,1526186930),(61,69801,0),(61,69802,1526186926),(61,99963,1),(61,99964,1),(61,99965,1),(61,99966,1),(61,99969,1),(61,99970,1),(61,99971,1),(61,151610,1),(61,151620,1),(61,151630,1),(61,151640,1),(61,151650,1),(61,151660,1),(61,151670,1),(61,151680,1),(61,180810,1),(61,242925,1),(61,243025,1),(61,243125,1),(61,243225,1),(61,243325,1),(61,243425,1),(61,300084,1),(61,507244,1),(61,666999,0),(61,935481,1),(61,8420390,0),(61,8420391,0),(61,10001001,62586883),(61,10001002,62652419),(61,10001003,28180480),(61,10001004,28246016),(61,10001005,30343168),(61,10001006,30408704),(61,10002002,16384),(61,10002011,46),(62,3938,3),(62,3939,3),(62,3940,5),(62,3941,15),(62,12120,1),(62,12121,18),(62,12130,3),(62,12132,6),(62,12133,3),(62,12134,2),(62,12135,7),(62,12136,3),(62,12137,3),(62,12138,2),(62,12200,1),(62,12201,3),(62,12202,5),(62,12203,3),(62,12204,2),(62,12205,6),(62,12206,8),(62,12207,3),(62,12208,4),(62,12209,2),(62,12210,2),(62,12211,2),(62,12212,6),(62,12650,1),(62,12651,3),(62,12652,6),(62,12653,4),(62,12700,1),(62,12701,3),(62,12702,2),(62,12703,1),(62,12704,3),(62,12705,5),(62,12706,1),(62,12707,1),(62,12710,4),(62,20279,2),(62,38412,0),(62,50722,0),(62,69799,1523253600),(62,69800,1523231183),(62,69801,1),(62,69802,1523232673),(62,69803,1),(62,99963,1),(62,151610,1),(62,151620,1),(62,151630,1),(62,151640,1),(62,151650,1),(62,151660,1),(62,151670,1),(62,151680,1),(62,180810,1),(62,8420390,0),(62,8420391,0),(63,0,1523328858),(63,1,1523307105),(63,83,1),(63,490,1),(63,491,1),(63,900,1),(63,1100,2),(63,1103,1),(63,3938,3),(63,3939,3),(63,3940,5),(63,3941,15),(63,12120,1),(63,12121,18),(63,12130,3),(63,12132,6),(63,12133,3),(63,12134,2),(63,12135,7),(63,12136,3),(63,12137,3),(63,12138,2),(63,12200,1),(63,12201,3),(63,12202,5),(63,12203,3),(63,12204,2),(63,12205,6),(63,12206,8),(63,12207,3),(63,12208,4),(63,12209,2),(63,12210,2),(63,12211,2),(63,12212,6),(63,12650,1),(63,12651,3),(63,12652,6),(63,12653,4),(63,12700,1),(63,12701,3),(63,12702,2),(63,12703,1),(63,12704,3),(63,12705,5),(63,12706,1),(63,12707,1),(63,12710,4),(63,13100,0),(63,20201,9),(63,20202,3),(63,20279,169),(63,26100,1),(63,26300,1),(63,30018,1),(63,38412,167),(63,50035,1),(63,50036,1),(63,50037,1),(63,50140,2),(63,50722,0),(63,51052,0),(63,51053,1523303478),(63,69799,1523340000),(63,69800,1523255597),(63,69801,2),(63,69802,1523328555),(63,69803,2),(63,99963,1),(63,99964,1),(63,99965,1),(63,99966,1),(63,99969,1),(63,99970,1),(63,99971,1),(63,151610,1),(63,151620,1),(63,151630,1),(63,151640,1),(63,151650,1),(63,151660,1),(63,151670,1),(63,151680,1),(63,180810,1),(63,300084,1),(63,494934,1523306421),(63,507244,1),(63,666999,1),(63,941119,1),(63,8420390,0),(63,8420391,0),(63,10001001,41549827),(63,10001002,41615363),(63,10001003,55902211),(63,10001004,55836675),(63,10001005,63045635),(63,10001006,63111171),(63,10002002,524288),(63,10002003,32768),(63,10002011,78),(64,3938,3),(64,3939,3),(64,3940,5),(64,3941,15),(64,12120,1),(64,12121,18),(64,12130,3),(64,12132,6),(64,12133,3),(64,12134,2),(64,12135,7),(64,12136,3),(64,12137,3),(64,12138,2),(64,12200,1),(64,12201,3),(64,12202,5),(64,12203,3),(64,12204,2),(64,12205,6),(64,12206,8),(64,12207,3),(64,12208,4),(64,12209,2),(64,12210,2),(64,12211,2),(64,12212,6),(64,12650,1),(64,12651,3),(64,12652,6),(64,12653,4),(64,12700,1),(64,12701,3),(64,12702,2),(64,12703,1),(64,12704,3),(64,12705,5),(64,12706,1),(64,12707,1),(64,12710,4),(64,50722,1523291867),(64,69801,0),(64,69802,1523291862),(64,99963,1),(64,99964,1),(64,99965,1),(64,99966,1),(64,99969,1),(64,99970,1),(64,99971,1),(64,151610,1),(64,151620,1),(64,151630,1),(64,151640,1),(64,151650,1),(64,151660,1),(64,151670,1),(64,151680,1),(64,180810,1),(64,666999,0),(64,8420390,0),(64,8420391,0),(64,10001001,41549827),(64,10001002,41615363),(64,10001003,59506691),(64,10001004,59572227),(64,10002002,16793600),(64,10002003,262160),(64,10002011,67),(65,0,1523331145),(65,1,1523329921),(65,490,1),(65,491,1),(65,1100,4),(65,1103,1),(65,1105,1),(65,1107,1),(65,2212,1),(65,2213,1),(65,2214,1),(65,3938,3),(65,3939,3),(65,3940,5),(65,3941,15),(65,10167,1),(65,12120,1),(65,12121,18),(65,12130,3),(65,12132,6),(65,12133,3),(65,12134,2),(65,12135,7),(65,12136,3),(65,12137,3),(65,12138,2),(65,12200,1),(65,12201,3),(65,12202,5),(65,12203,3),(65,12204,2),(65,12205,6),(65,12206,8),(65,12207,3),(65,12208,4),(65,12209,2),(65,12210,2),(65,12211,2),(65,12212,6),(65,12570,1),(65,12650,1),(65,12651,3),(65,12652,6),(65,12653,4),(65,12700,1),(65,12701,3),(65,12702,2),(65,12703,1),(65,12704,3),(65,12705,5),(65,12706,1),(65,12707,1),(65,12710,4),(65,13100,0),(65,20024,3),(65,20201,22),(65,20202,24),(65,20279,1010),(65,26100,1),(65,26300,1),(65,27100,1),(65,27300,1),(65,28100,1),(65,28300,1),(65,30018,1),(65,38412,1008),(65,50035,1),(65,50036,1),(65,50037,1),(65,50140,2),(65,50141,2),(65,50142,2),(65,50722,1524956713),(65,69799,1523340000),(65,69800,1523325745),(65,69801,0),(65,69802,1524956708),(65,69803,1),(65,99963,1),(65,99964,1),(65,99965,1),(65,99966,1),(65,99969,1),(65,99970,1),(65,99971,1),(65,151610,1),(65,151620,1),(65,151630,1),(65,151640,1),(65,151650,1),(65,151660,1),(65,151670,1),(65,151680,1),(65,180810,1),(65,300084,1),(65,300168,1),(65,300298,1),(65,494934,1523326507),(65,507244,1),(65,666999,0),(65,8420390,0),(65,8420391,0),(65,10001001,63045635),(65,10001002,63111171),(65,10002004,2097152),(65,10002011,115),(66,3938,3),(66,3939,3),(66,3940,5),(66,3941,15),(66,12120,1),(66,12121,18),(66,12130,3),(66,12132,6),(66,12133,3),(66,12134,2),(66,12135,7),(66,12136,3),(66,12137,3),(66,12138,2),(66,12200,1),(66,12201,3),(66,12202,5),(66,12203,3),(66,12204,2),(66,12205,6),(66,12206,8),(66,12207,3),(66,12208,4),(66,12209,2),(66,12210,2),(66,12211,2),(66,12212,6),(66,12650,1),(66,12651,3),(66,12652,6),(66,12653,4),(66,12700,1),(66,12701,3),(66,12702,2),(66,12703,1),(66,12704,3),(66,12705,5),(66,12706,1),(66,12707,1),(66,12710,4),(66,20024,2),(66,44421,4),(66,50722,1525919147),(66,51052,0),(66,51053,1524725568),(66,69801,0),(66,69802,1525627553),(66,99963,1),(66,151610,1),(66,151620,1),(66,151630,1),(66,151640,1),(66,151650,1),(66,151660,1),(66,151670,1),(66,151680,1),(66,180810,1),(66,8420390,0),(66,8420391,0),(66,10001001,30343168),(66,10001002,30408704),(67,3938,3),(67,3939,3),(67,3940,5),(67,3941,15),(67,12120,1),(67,12121,18),(67,12130,3),(67,12132,6),(67,12133,3),(67,12134,2),(67,12135,7),(67,12136,3),(67,12137,3),(67,12138,2),(67,12200,1),(67,12201,3),(67,12202,5),(67,12203,3),(67,12204,2),(67,12205,6),(67,12206,8),(67,12207,3),(67,12208,4),(67,12209,2),(67,12210,2),(67,12211,2),(67,12212,6),(67,12650,1),(67,12651,3),(67,12652,6),(67,12653,4),(67,12700,1),(67,12701,3),(67,12702,2),(67,12703,1),(67,12704,3),(67,12705,5),(67,12706,1),(67,12707,1),(67,12710,4),(67,20024,4),(67,44421,4),(67,50722,0),(67,69799,1526364000),(67,69800,1526352044),(67,69801,1),(67,69802,1526352049),(67,69803,2),(67,99963,1),(67,151610,1),(67,151620,1),(67,151630,1),(67,151640,1),(67,151650,1),(67,151660,1),(67,151670,1),(67,151680,1),(67,180810,1),(67,8420390,0),(67,8420391,0),(67,10001001,30343168),(67,10001002,30408704),(68,0,1523491725),(68,3938,3),(68,3939,3),(68,3940,5),(68,3941,15),(68,12120,1),(68,12121,18),(68,12130,3),(68,12132,6),(68,12133,3),(68,12134,2),(68,12135,7),(68,12136,3),(68,12137,3),(68,12138,2),(68,12200,1),(68,12201,3),(68,12202,5),(68,12203,3),(68,12204,2),(68,12205,6),(68,12206,8),(68,12207,3),(68,12208,4),(68,12209,2),(68,12210,2),(68,12211,2),(68,12212,6),(68,12650,1),(68,12651,3),(68,12652,6),(68,12653,4),(68,12700,1),(68,12701,3),(68,12702,2),(68,12703,1),(68,12704,3),(68,12705,5),(68,12706,1),(68,12707,1),(68,12710,4),(68,50561,1523578016),(68,50722,0),(68,69799,1523512800),(68,69800,1523491690),(68,69801,1),(68,69802,1523491695),(68,69803,1),(68,99963,1),(68,99964,1),(68,151610,1),(68,151620,1),(68,151630,1),(68,151640,1),(68,151650,1),(68,151660,1),(68,151670,1),(68,151680,1),(68,180810,1),(68,300137,1),(68,10002001,16777216),(68,10002011,25),(69,1,1524780881),(69,3938,3),(69,3939,3),(69,3940,5),(69,3941,15),(69,12120,1),(69,12121,18),(69,12130,3),(69,12132,6),(69,12133,3),(69,12134,2),(69,12135,7),(69,12136,3),(69,12137,3),(69,12138,2),(69,12200,1),(69,12201,3),(69,12202,5),(69,12203,3),(69,12204,2),(69,12205,6),(69,12206,8),(69,12207,3),(69,12208,4),(69,12209,2),(69,12210,2),(69,12211,2),(69,12212,6),(69,12650,1),(69,12651,3),(69,12652,6),(69,12653,4),(69,12700,1),(69,12701,3),(69,12702,2),(69,12703,1),(69,12704,3),(69,12705,5),(69,12706,1),(69,12707,1),(69,12710,4),(69,20279,11),(69,38412,9),(69,50722,0),(69,69799,1525413600),(69,69800,1525377951),(69,69801,1),(69,69802,1525377956),(69,69803,3),(69,99963,1),(69,151610,1),(69,151620,1),(69,151630,1),(69,151640,1),(69,151650,1),(69,151660,1),(69,151670,1),(69,151680,1),(69,180810,1),(69,8420390,0),(69,8420391,0),(70,3938,3),(70,3939,3),(70,3940,5),(70,3941,15),(70,12120,1),(70,12121,18),(70,12130,3),(70,12132,6),(70,12133,3),(70,12134,2),(70,12135,7),(70,12136,3),(70,12137,3),(70,12138,2),(70,12200,1),(70,12201,3),(70,12202,5),(70,12203,3),(70,12204,2),(70,12205,6),(70,12206,8),(70,12207,3),(70,12208,4),(70,12209,2),(70,12210,2),(70,12211,2),(70,12212,6),(70,12650,1),(70,12651,3),(70,12652,6),(70,12653,4),(70,12700,1),(70,12701,3),(70,12702,2),(70,12703,1),(70,12704,3),(70,12705,5),(70,12706,1),(70,12707,1),(70,12710,4),(70,44741,1),(70,50722,1526872802),(70,69801,0),(70,69802,1526872797),(70,99963,1),(70,151610,1),(70,151620,1),(70,151630,1),(70,151640,1),(70,151650,1),(70,151660,1),(70,151670,1),(70,151680,1),(70,180810,1),(70,8420390,0),(70,8420391,0),(71,3938,3),(71,3939,3),(71,3940,5),(71,3941,15),(71,12120,1),(71,12121,18),(71,12130,3),(71,12132,6),(71,12133,3),(71,12134,2),(71,12135,7),(71,12136,3),(71,12137,3),(71,12138,2),(71,12200,1),(71,12201,3),(71,12202,5),(71,12203,3),(71,12204,2),(71,12205,6),(71,12206,8),(71,12207,3),(71,12208,4),(71,12209,2),(71,12210,2),(71,12211,2),(71,12212,6),(71,12650,1),(71,12651,3),(71,12652,6),(71,12653,4),(71,12700,1),(71,12701,3),(71,12702,2),(71,12703,1),(71,12704,3),(71,12705,5),(71,12706,1),(71,12707,1),(71,12710,4),(71,20024,2),(71,20279,2),(71,38412,0),(71,50722,0),(71,69801,0),(71,69802,1524956893),(71,99963,1),(71,151610,1),(71,151620,1),(71,151630,1),(71,151640,1),(71,151650,1),(71,151660,1),(71,151670,1),(71,151680,1),(71,180810,1),(73,3938,3),(73,3939,3),(73,3940,5),(73,3941,15),(73,12120,1),(73,12121,18),(73,12130,3),(73,12132,6),(73,12133,3),(73,12134,2),(73,12135,7),(73,12136,3),(73,12137,3),(73,12138,2),(73,12200,1),(73,12201,3),(73,12202,5),(73,12203,3),(73,12204,2),(73,12205,6),(73,12206,8),(73,12207,3),(73,12208,4),(73,12209,2),(73,12210,2),(73,12211,2),(73,12212,6),(73,12650,1),(73,12651,3),(73,12652,6),(73,12653,4),(73,12700,1),(73,12701,3),(73,12702,2),(73,12703,1),(73,12704,3),(73,12705,5),(73,12706,1),(73,12707,1),(73,12710,4),(73,20279,5),(73,38412,3),(73,50722,0),(73,69801,0),(73,69802,1525919471),(73,99963,1),(73,151610,1),(73,151620,1),(73,151630,1),(73,151640,1),(73,151650,1),(73,151660,1),(73,151670,1),(73,151680,1),(73,180810,1),(73,8420390,0),(73,8420391,0),(74,3938,3),(74,3939,3),(74,3940,5),(74,3941,15),(74,12120,1),(74,12121,18),(74,12130,3),(74,12132,6),(74,12133,3),(74,12134,2),(74,12135,7),(74,12136,3),(74,12137,3),(74,12138,2),(74,12200,1),(74,12201,3),(74,12202,5),(74,12203,3),(74,12204,2),(74,12205,6),(74,12206,8),(74,12207,3),(74,12208,4),(74,12209,2),(74,12210,2),(74,12211,2),(74,12212,6),(74,12650,1),(74,12651,3),(74,12652,6),(74,12653,4),(74,12700,1),(74,12701,3),(74,12702,2),(74,12703,1),(74,12704,3),(74,12705,5),(74,12706,1),(74,12707,1),(74,12710,4),(74,50722,0),(74,69801,0),(74,69802,1525919912),(74,99963,1),(74,151610,1),(74,151620,1),(74,151630,1),(74,151640,1),(74,151650,1),(74,151660,1),(74,151670,1),(74,151680,1),(74,180810,1),(74,8420390,0),(74,8420391,0),(75,3938,3),(75,3939,3),(75,3940,5),(75,3941,15),(75,12120,1),(75,12121,18),(75,12130,3),(75,12132,6),(75,12133,3),(75,12134,2),(75,12135,7),(75,12136,3),(75,12137,3),(75,12138,2),(75,12200,1),(75,12201,3),(75,12202,5),(75,12203,3),(75,12204,2),(75,12205,6),(75,12206,8),(75,12207,3),(75,12208,4),(75,12209,2),(75,12210,2),(75,12211,2),(75,12212,6),(75,12650,1),(75,12651,3),(75,12652,6),(75,12653,4),(75,12700,1),(75,12701,3),(75,12702,2),(75,12703,1),(75,12704,3),(75,12705,5),(75,12706,1),(75,12707,1),(75,12710,4),(75,50722,1525920151),(75,69801,0),(75,69802,1525920146),(75,99963,1),(75,151610,1),(75,151620,1),(75,151630,1),(75,151640,1),(75,151650,1),(75,151660,1),(75,151670,1),(75,151680,1),(75,180810,1),(75,8420390,0),(75,8420391,0),(76,3938,3),(76,3939,3),(76,3940,5),(76,3941,15),(76,12120,1),(76,12121,18),(76,12130,3),(76,12132,6),(76,12133,3),(76,12134,2),(76,12135,7),(76,12136,3),(76,12137,3),(76,12138,2),(76,12200,1),(76,12201,3),(76,12202,5),(76,12203,3),(76,12204,2),(76,12205,6),(76,12206,8),(76,12207,3),(76,12208,4),(76,12209,2),(76,12210,2),(76,12211,2),(76,12212,6),(76,12650,1),(76,12651,3),(76,12652,6),(76,12653,4),(77,0,1526180713),(77,1,1526180080),(77,90,62),(77,91,1),(77,92,1),(77,93,3),(77,94,1),(77,96,1),(77,97,1),(77,98,2),(77,99,1),(77,100,1),(77,102,7),(77,103,16),(77,104,26),(77,105,29),(77,106,32),(77,107,35),(77,108,38),(77,109,41),(77,111,47),(77,112,50),(77,113,55),(77,114,56),(77,115,59),(77,116,62),(77,117,44),(77,118,4),(77,9183,1),(77,9184,1),(77,9186,1),(77,9221,1),(77,9222,1),(77,9223,1),(77,20279,5),(77,38412,3),(77,44741,1),(77,50722,0),(77,69799,1526709600),(77,69800,1526684013),(77,69801,1),(77,69802,1526684018),(77,69803,2),(77,99963,1),(77,99964,1),(77,99965,1),(77,99966,1),(77,99969,1),(77,99970,1),(77,99971,1),(77,666999,0),(77,8420390,0),(77,8420391,0),(78,3938,3),(78,3939,3),(78,3940,5),(78,3941,15),(78,12120,1),(78,12121,18),(78,12130,3),(78,12132,6),(78,12133,3),(78,12134,2),(78,12135,7),(78,12136,3),(78,12137,3),(78,12138,2),(78,12200,1),(78,12201,3),(78,12202,5),(78,12203,3),(78,12204,2),(78,12205,6),(78,12206,8),(78,12207,3),(78,12208,4),(78,12209,2),(78,12210,2),(78,12211,2),(78,12212,6),(78,12650,1),(78,12651,3),(78,12652,6),(78,12653,4),(78,12700,1),(78,12701,3),(78,12702,2),(78,12703,1),(78,12704,3),(78,12705,5),(78,12706,1),(78,12707,1),(78,12710,4),(78,50722,0),(78,69801,0),(78,99963,1),(78,151610,1),(78,151620,1),(78,151630,1),(78,151640,1),(78,151650,1),(78,151660,1),(78,151670,1),(78,151680,1),(78,180810,1),(78,8420390,0),(78,8420391,0),(79,3938,3),(79,3939,3),(79,3940,5),(79,3941,15),(79,12120,1),(79,12121,18),(79,12130,3),(79,12132,6),(79,12133,3),(79,12134,2),(79,12135,7),(79,12136,3),(79,12137,3),(79,12138,2),(79,12200,1),(79,12201,3),(79,12202,5),(79,12203,3),(79,12204,2),(79,12205,6),(79,12206,8),(79,12207,3),(79,12208,4),(79,12209,2),(79,12210,2),(79,12211,2),(79,12212,6),(79,12650,1),(79,12651,3),(79,12652,6),(79,12653,4),(79,12700,1),(79,12701,3),(79,12702,2),(79,12703,1),(79,12704,3),(79,12705,5),(79,12706,1),(79,12707,1),(79,12710,4),(79,44741,1),(79,50722,0),(79,69801,0),(79,69802,1526516601),(79,99963,1),(79,151610,1),(79,151620,1),(79,151630,1),(79,151640,1),(79,151650,1),(79,151660,1),(79,151670,1),(79,151680,1),(79,180810,1),(79,8420390,0),(79,8420391,0),(80,3938,3),(80,3939,3),(80,3940,5),(80,3941,15),(80,12120,1),(80,12121,18),(80,12130,3),(80,12132,6),(80,12133,3),(80,12134,2),(80,12135,7),(80,12136,3),(80,12137,3),(80,12138,2),(80,12200,1),(80,12201,3),(80,12202,5),(80,12203,3),(80,12204,2),(80,12205,6),(80,12206,8),(80,12207,3),(80,12208,4),(80,12209,2),(80,12210,2),(80,12211,2),(80,12212,6),(80,12650,1),(80,12651,3),(80,12652,6),(80,12653,4),(80,12700,1),(80,12701,3),(80,12702,2),(80,12703,1),(80,12704,3),(80,12705,5),(80,12706,1),(80,12707,1),(80,12710,4),(80,25521,1),(80,41114,1),(80,41115,0),(80,41121,1526875196),(80,41319,1),(80,41320,1),(80,41331,1),(80,41334,1),(80,44741,1),(80,49827,1526704701),(80,49828,1526712248),(80,49829,1526773486),(80,49830,1526790103),(80,49831,1526875254),(80,50722,0),(80,69801,0),(80,69802,1527304016),(80,99963,1),(80,151610,1),(80,151620,1),(80,151630,1),(80,151640,1),(80,151650,1),(80,151660,1),(80,151670,1),(80,151680,1),(80,180810,1),(80,8420390,0),(80,8420391,0),(80,10002003,16777216),(80,10002011,99),(81,1,1526703162),(81,900,1),(81,3938,3),(81,3939,3),(81,3940,5),(81,3941,15),(81,12120,1),(81,12121,18),(81,12130,3),(81,12132,6),(81,12133,3),(81,12134,2),(81,12135,7),(81,12136,3),(81,12137,3),(81,12138,2),(81,12200,1),(81,12201,3),(81,12202,5),(81,12203,3),(81,12204,2),(81,12205,6),(81,12206,8),(81,12207,3),(81,12208,4),(81,12209,2),(81,12210,2),(81,12211,2),(81,12212,6),(81,12650,1),(81,12651,3),(81,12652,6),(81,12653,4),(81,12700,1),(81,12701,3),(81,12702,2),(81,12703,1),(81,12704,3),(81,12705,5),(81,12706,1),(81,12707,1),(81,12710,4),(81,20279,1057),(81,22409,1),(81,38412,1055),(81,41114,1),(81,41115,1),(81,41121,1527119685),(81,41314,1),(81,41319,1),(81,41320,1),(81,41330,1),(81,41331,1),(81,41334,1),(81,42421,1),(81,44741,1),(81,49825,1),(81,49826,1527118019),(81,49827,1527116996),(81,49828,1527118237),(81,49829,1527119240),(81,49830,1527119743),(81,49831,1527120106),(81,50722,0),(81,69801,0),(81,69802,1527120183),(81,99963,1),(81,99964,1),(81,99965,1),(81,99966,1),(81,99969,1),(81,99970,1),(81,99971,1),(81,151610,1),(81,151620,1),(81,151630,1),(81,151640,1),(81,151650,1),(81,151660,1),(81,151670,1),(81,151680,1),(81,180810,1),(81,507244,1),(81,8420390,0),(81,8420391,0),(81,10002004,1),(81,10002011,94);
/*!40000 ALTER TABLE `player_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) unsigned NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) unsigned NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) unsigned NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `blessings1` tinyint(4) NOT NULL DEFAULT '0',
  `blessings2` tinyint(4) NOT NULL DEFAULT '0',
  `blessings3` tinyint(4) NOT NULL DEFAULT '0',
  `blessings4` tinyint(4) NOT NULL DEFAULT '0',
  `blessings5` tinyint(4) NOT NULL DEFAULT '0',
  `blessings6` tinyint(4) NOT NULL DEFAULT '0',
  `blessings7` tinyint(4) NOT NULL DEFAULT '0',
  `blessings8` tinyint(4) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) unsigned NOT NULL DEFAULT '2520',
  `skill_fist` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_club` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_sword` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_axe` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_dist` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_shielding` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_fishing` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) unsigned NOT NULL DEFAULT '0',
  `create_date` int(11) unsigned NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `cast` tinyint(1) NOT NULL DEFAULT '0',
  `skill_critical_hit_chance` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_critical_hit_chance_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_critical_hit_damage` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_critical_hit_damage_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_life_leech_chance` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_life_leech_chance_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_life_leech_amount` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_life_leech_amount_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_mana_leech_chance` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_mana_leech_chance_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_mana_leech_amount` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_mana_leech_amount_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_criticalhit_chance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_criticalhit_damage` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_lifeleech_chance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_lifeleech_amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_manaleech_chance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_manaleech_amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT '1',
  `bonus_reroll` int(11) NOT NULL DEFAULT '0',
  `xpboost_stamina` smallint(5) DEFAULT NULL,
  `xpboost_value` tinyint(4) DEFAULT NULL,
  `marriage_status` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hide_skills` int(11) DEFAULT NULL,
  `hide_set` int(11) DEFAULT NULL,
  `former` varchar(255) NOT NULL DEFAULT '-',
  `signature` varchar(255) NOT NULL,
  `marriage_spouse` int(11) NOT NULL DEFAULT '-1',
  `loyalty_ranking` tinyint(1) NOT NULL DEFAULT '0',
  `madphp_signature` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Absolute Mango © MadPHP.org',
  `madphp_signature_bg` varchar(50) NOT NULL COMMENT 'Absolute Mango © MadPHP.org',
  `madphp_signature_eqs` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Absolute Mango © MadPHP.org',
  `madphp_signature_bars` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Absolute Mango © MadPHP.org',
  `madphp_signature_cache` int(11) NOT NULL COMMENT 'Absolute Mango © MadPHP.org',
  `lookmount` int(11) NOT NULL DEFAULT '0',
  `sbw_points` int(11) NOT NULL DEFAULT '0',
  `InstantRewardTokens` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `account_id` (`account_id`),
  KEY `vocation` (`vocation`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players_online`
--

DROP TABLE IF EXISTS `players_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_online`
--

LOCK TABLES `players_online` WRITE;
/*!40000 ALTER TABLE `players_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_attributes`
--

DROP TABLE IF EXISTS `s_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_attributes` (
  `item_id` int(11) NOT NULL,
  `attack` varchar(11) DEFAULT NULL,
  `armor` varchar(11) DEFAULT NULL,
  `defense` varchar(11) DEFAULT NULL,
  `extraDef` varchar(4) DEFAULT NULL,
  `range` varchar(11) DEFAULT NULL,
  `speed` varchar(4) DEFAULT NULL,
  `elementFire` varchar(11) DEFAULT NULL,
  `elementIce` varchar(11) DEFAULT NULL,
  `elementEarth` varchar(11) DEFAULT NULL,
  `elementEnergy` varchar(11) DEFAULT NULL,
  `skillShield` varchar(4) DEFAULT NULL,
  `skillDist` varchar(4) DEFAULT NULL,
  `skillFist` varchar(4) DEFAULT NULL,
  `skillClub` varchar(4) DEFAULT NULL,
  `skillAxe` varchar(4) DEFAULT NULL,
  `skillSword` varchar(4) DEFAULT NULL,
  `magicLevelPoints` varchar(4) DEFAULT NULL,
  `absorbPercentAll` varchar(3) DEFAULT NULL,
  `absorbPercentFire` varchar(3) DEFAULT NULL,
  `absorbPercentEarth` varchar(3) DEFAULT NULL,
  `absorbPercentEnergy` varchar(3) DEFAULT NULL,
  `absorbPercentIce` varchar(3) DEFAULT NULL,
  `absorbPercentDeath` varchar(3) DEFAULT NULL,
  `absorbPercentHoly` varchar(3) DEFAULT NULL,
  `absorbPercentPhysical` varchar(3) DEFAULT NULL,
  `absorbPercentManaDrain` varchar(3) DEFAULT NULL,
  `absorbPercentLifeDrain` varchar(3) DEFAULT NULL,
  `charges` varchar(11) DEFAULT NULL,
  `duration` varchar(11) DEFAULT NULL,
  `preventDrop` varchar(11) DEFAULT NULL,
  `containerSize` varchar(11) DEFAULT NULL,
  `hitChance` varchar(11) DEFAULT NULL,
  `shootType` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_attributes`
--

LOCK TABLES `s_attributes` WRITE;
/*!40000 ALTER TABLE `s_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_items`
--

DROP TABLE IF EXISTS `s_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `descr` text,
  `weight` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2426 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_items`
--

LOCK TABLES `s_items` WRITE;
/*!40000 ALTER TABLE `s_items` DISABLE KEYS */;
INSERT INTO `s_items` VALUES (1,'Void','',0,100),(2,'Earth','',0,101),(3,'Dirt','',0,103),(4,'Sand','',0,104),(5,'Grass','',0,106),(6,'Flowers','',0,0),(7,'Dirt','',0,194),(8,'Sand','',0,231),(9,'Earth ground','',0,280),(10,'Grass','',0,293),(11,'Pitfall','',0,294),(12,'Dirt floor','',0,0),(13,'Muddy floor','',0,0),(14,'Dirt wall','',0,0),(15,'Earth ground','',0,368),(16,'Trapdoor','',0,0),(17,'Stone wall','',0,0),(18,'Hole','',0,383),(19,'Rope spot','There is a hole in the ceiling.',0,384),(20,'Small hole','It seems too narrow to climb through.',0,385),(21,'Stalagmites','',0,0),(22,'Lava hole','It seems to be inactive.',0,388),(23,'Lava hole','It emits heat and light.',0,389),(24,'Stalagmites','',0,0),(25,'Hole','',0,392),(26,'Wooden flooring','',0,405),(27,'White marble tile','',0,406),(28,'Black marble tile','',0,407),(29,'Trapdoor','',0,0),(30,'Stairs','',0,0),(31,'Sandstone tile','',0,412),(32,'Stone tile','',0,413),(33,'Tiled floor','',0,414),(34,'Stone tile','',0,415),(35,'Stone tile','It seems to be a switch.',0,0),(36,'Stone tile','There is a hole in the ceiling.',0,418),(37,'Sandstone tile','',0,419),(38,'Tiled floor','',0,420),(39,'Sandstone floor','',0,0),(40,'Stairs','',0,423),(41,'Stone tile','',0,424),(42,'Stone tile','It seems to be a switch.',0,0),(43,'Trapdoor','',0,427),(44,'Ladder','',0,428),(45,'Trapdoor','',0,429),(46,'Sewer grate','',0,430),(47,'Stone floor','',0,431),(48,'Stairs','',0,0),(49,'Wooden floor','',0,0),(50,'Wooden floor','It seems to be a switch.',0,0),(51,'Wooden floor','',0,0),(52,'White stone tile','',0,457),(53,'Wooden floor','',0,458),(54,'Stairs','',0,459),(55,'Void','',0,460),(56,'Closed trapdoor','',0,461),(57,'Open trapdoor','',0,462),(58,'Pedestal','',0,463),(59,'Sandstone wall','',0,464),(60,'Stone tile','It seems to be a switch.',0,465),(61,'Sandstone wall','',0,466),(62,'Stone tile','It seems to be a switch.',0,467),(63,'Loose stone pile','',0,468),(64,'Hole','',0,469),(65,'Hole','',0,470),(66,'Time tile','',0,0),(67,'Hole','',0,0),(68,'Ramp','',0,0),(69,'Hole','',0,0),(70,'Loose stone pile','',0,481),(71,'Hole','',0,482),(72,'Loose ice pile','',0,483),(73,'Hole','',0,484),(74,'Hole','',0,485),(75,'Heap of snow','',0,486),(76,'Ramp','',0,0),(77,'Hole','',0,489),(78,'Water','',0,493),(79,'Lava','',0,0),(80,'Snow','',0,670),(81,'Ice','',0,671),(82,'Tar','',0,0),(83,'Cobbled pavement','',0,724),(84,'Sandstone floor','',0,0),(85,'Grass','',0,791),(86,'Dirt','',0,804),(87,'Dirt','',0,806),(88,'Sand','',0,836),(89,'Mountain','',0,0),(90,'Rocks','',0,0),(91,'Mountain','',0,0),(92,'Archway','',0,0),(93,'Mountain','',0,0),(94,'Flat roof','',0,0),(95,'Trapdoor','',0,924),(96,'Tiled roof','',0,0),(97,'Wooden roof','',0,0),(98,'Chess board','',0,0),(99,'Mill board','',0,0),(100,'Tic-tac-toe board','',0,0),(101,'Brick wall','',0,0),(102,'Framework wall','',0,0),(103,'Stone wall','',0,0),(104,'Sandstone wall','',0,0),(105,'Sandstone','',0,1071),(106,'Sandstone roof','',0,0),(107,'Broken wall','',0,0),(108,'Metal wall','',0,0),(109,'Metal wall','',0,0),(110,'Sandstone wall','',0,0),(111,'White stone wall','',0,0),(112,'Archway','',0,0),(113,'Ornamented wall','',0,0),(114,'Wall fountain','',0,0),(115,'Archway','',0,0),(116,'Ornamented wall','',0,0),(117,'Paravent','',0,0),(118,'Ornamented wall','',0,0),(119,'Wall fountain','',0,0),(120,'Lava wall','',0,0),(121,'Archway','',0,0),(122,'Closed door','It is locked.',0,0),(123,'Open door','',0,1211),(124,'Closed door','It is locked.',0,1212),(125,'Closed door','',0,1213),(126,'Open door','',0,1214),(127,'Buttress','',0,0),(128,'Closed door','',0,1219),(129,'Open door','',0,1220),(130,'Closed door','',0,1221),(131,'Open door','',0,1222),(132,'Closed door','',0,1223),(133,'Open door','',0,1224),(134,'Closed door','',0,1225),(135,'Open door','',0,1226),(136,'Gate of expertise','',0,1227),(137,'Gate of expertise','',0,1228),(138,'Gate of expertise','',0,1229),(139,'Gate of expertise','',0,1230),(140,'Closed door','It is locked.',0,1231),(141,'Closed door','',0,1232),(142,'Open door','',0,1233),(143,'Closed door','It is locked.',0,1234),(144,'Closed door','',0,1235),(145,'Open door','',0,1236),(146,'Closed door','',0,1237),(147,'Open door','',0,1238),(148,'Closed door','',0,1239),(149,'Open door','',0,1240),(150,'Closed door','',0,1241),(151,'Open door','',0,1242),(152,'Closed door','',0,1243),(153,'Open door','',0,1244),(154,'Gate of expertise','',0,1245),(155,'Gate of expertise','',0,1246),(156,'Gate of expertise','',0,1247),(157,'Gate of expertise','',0,1248),(158,'Closed door','It is locked.',0,1249),(159,'Closed door','',0,1250),(160,'Open door','',0,1251),(161,'Closed door','It is locked.',0,1252),(162,'Closed door','',0,1253),(163,'Open door','',0,1254),(164,'Closed door','',0,1255),(165,'Open door','',0,1256),(166,'Closed door','',0,1257),(167,'Open door','',0,1258),(168,'Gate of expertise','',0,1259),(169,'Gate of expertise','',0,1260),(170,'Gate of expertise','',0,1261),(171,'Gate of expertise','',0,1262),(172,'Framework window','',0,0),(173,'Brick window','',0,0),(174,'Stone window','',0,0),(175,'White stone wall window','',0,0),(176,'Sandstone window','',0,0),(177,'Wooden pillar','',0,1277),(178,'Sail','',0,0),(179,'Rudder of the boat','',0,0),(180,'Drawbridge','',0,1284),(181,'Stone','',0,0),(182,'Stone','',1500,1293),(183,'Small stone','',360,1294),(184,'Stone','',3000,1295),(185,'Stone','',0,0),(186,'Mossy stone','',0,1353),(187,'Stone','',0,0),(188,'Fountain','',0,0),(189,'Water basin','',0,0),(190,'Draw well','',0,0),(191,'Marble fountain','',0,0),(192,'Small basin','',0,1378),(193,'Mill','',0,0),(194,'Stairs','',0,1385),(195,'Ladder','',0,1386),(196,'Magic forcefield','You can see the other side through it.',0,1387),(197,'Ramp','',0,1388),(198,'Ramp','',0,1389),(199,'Ramp','',0,1390),(200,'Ramp','',0,1391),(201,'Ramp','',0,1392),(202,'Ramp','',0,1393),(203,'Ramp','',0,1394),(204,'Ramp','',0,1395),(205,'Stairs','',0,1396),(206,'Mystic flame','',0,1397),(207,'Ramp','',0,1398),(208,'Ramp','',0,1399),(209,'Ramp','',0,1400),(210,'Ramp','',0,1401),(211,'Ramp','',0,1402),(212,'Ramp','',0,1403),(213,'Ramp','',0,1404),(214,'Ramp','',0,1405),(215,'Grave','',0,1406),(216,'Gravestone','',0,0),(217,'Stone coffin','',0,1410),(218,'Stone coffin','',0,1411),(219,'Stone coffin','',0,0),(220,'Buried coffin','',0,0),(221,'Sarcophagus','',0,1417),(222,'Sarcophagus','',0,1418),(223,'Sarcophagus','',0,1419),(224,'Sarcophagus','',0,1420),(225,'Campfire','',0,0),(226,'Campfire','',0,0),(227,'Unlit campfire','',0,1426),(228,'Campfire','',0,0),(229,'Sign','',0,0),(230,'Dragon flag','',0,1435),(231,'Castle flag','',0,1436),(232,'Flag of Tibia','',0,1437),(233,'Street sign','',0,0),(234,'Sign','',0,0),(235,'Knight statue','',0,1442),(236,'Knight statue','',0,1443),(237,'Hero statue','',0,1444),(238,'Monument','',0,1445),(239,'Minotaur statue','',0,1446),(240,'Goblin statue','',0,1447),(241,'Angel statue','',0,1448),(242,'Dwarven statue','',0,1449),(243,'Watchdog statue','',0,1450),(244,'Sandstone statue','',0,1451),(245,'Gargoyle statue','',0,0),(246,'Pedestal','',0,0),(247,'Minotaur statue','',0,1460),(248,'Minotaur statue','',0,1461),(249,'Minotaur statue','',0,1462),(250,'Goblin statue','',0,1463),(251,'Goblin statue','',0,1464),(252,'Goblin statue','',0,1465),(253,'Pedestal','',0,1466),(254,'Cobra statue','',0,0),(255,'Pedestal','',0,1469),(256,'Cobra statue','',0,0),(257,'Knight statue','',0,1476),(258,'Knight statue','',0,1477),(259,'Knight statue','',0,1478),(260,'Street lamp','',0,0),(261,'Coal basin','',0,0),(262,'Stone coal basin','',0,1486),(263,'Fire field','',0,1487),(264,'Fire field','',0,1488),(265,'Fire field','',0,1489),(266,'Poison field','',0,1490),(267,'Energy field','',0,1491),(268,'Fire field','',0,1492),(269,'Fire field','',0,1493),(270,'Fire field','',0,1494),(271,'Energy field','',0,1495),(272,'Poison field','',0,1496),(273,'Magic wall','',0,1497),(274,'Magic wall','',0,1498),(275,'Rush wood','',0,1499),(276,'Fire field','',0,1500),(277,'Fire field','',0,1501),(278,'Fire field','',0,1502),(279,'Poison gas','',0,1503),(280,'Energy field','',0,1504),(281,'Smoke','',0,1505),(282,'Searing fire','',0,1506),(283,'Searing fire','',0,1507),(284,'Ashes','',0,1508),(285,'Lava','',0,1509),(286,'Slits','',0,1510),(287,'Blades','',0,1511),(288,'Holes','',0,1512),(289,'Spikes','',0,1513),(290,'Pillar','',0,1514),(291,'Marble pillar','',0,1515),(292,'Wooden railing','',0,0),(293,'Stone railing','',0,0),(294,'Fence','',0,0),(295,'Closed fence gate','',0,1539),(296,'Open fence gate','',0,1540),(297,'Closed fence gate','',0,1541),(298,'Open fence gate','',0,1542),(299,'Fence','',0,0),(300,'Strange carving','',0,1548),(301,'Sandstone pillar','',0,1549),(302,'Sandstone statue','',0,1550),(303,'Oriental pillar','',0,1551),(304,'Ramp','',0,1552),(305,'Ramp','',0,1553),(306,'Ramp','',0,1554),(307,'Ramp','',0,1555),(308,'Ramp','',0,1556),(309,'Ramp','',0,1557),(310,'Ramp','',0,1558),(311,'Ramp','',0,1559),(312,'Obelisk','',0,1560),(313,'Broken obelisk','',0,1561),(314,'Sandstone railing','',0,0),(315,'Sandstone','',0,0),(316,'White stone railing','',0,0),(317,'Metal railing','',0,0),(318,'Big table','',0,0),(319,'Square table','',0,1615),(320,'Small round table','',0,1616),(321,'Counter','',0,0),(322,'Small table','',0,1619),(323,'Counter','',0,0),(324,'Table','',0,0),(325,'Table','',0,0),(326,'Table','',0,1639),(327,'Table','',0,0),(328,'Altar stone','',0,0),(329,'Throne','',0,0),(330,'Wooden chair','',0,1650),(331,'Wooden chair','',0,1651),(332,'Wooden chair','',0,1652),(333,'Wooden chair','',0,1653),(334,'Throne','',0,0),(335,'Sofa chair','',0,1658),(336,'Sofa chair','',0,1659),(337,'Sofa chair','',0,1660),(338,'Sofa chair','',0,1661),(339,'Bench','',0,0),(340,'Red cushioned chair','',0,1666),(341,'Red cushioned chair','',0,1667),(342,'Red cushioned chair','',0,1668),(343,'Red cushioned chair','',0,1669),(344,'Green cushioned chair','',0,1670),(345,'Green cushioned chair','',0,1671),(346,'Green cushioned chair','',0,1672),(347,'Green cushioned chair','',0,1673),(348,'Rocking chair','',0,1674),(349,'Rocking chair','',0,1675),(350,'Rocking chair','',0,1676),(351,'Rocking chair','',0,1677),(352,'Small purple pillow','',1200,1678),(353,'Small green pillow','',1200,1679),(354,'Small red pillow','',1200,1680),(355,'Small blue pillow','',1200,1681),(356,'Small orange pillow','',1200,1682),(357,'Small turqoise pillow','',1200,1683),(358,'Small white pillow','',1200,1684),(359,'Heart pillow','',1700,1685),(360,'Blue pillow','',1600,1686),(361,'Red pillow','',1600,1687),(362,'Green pillow','',1600,1688),(363,'Yellow pillow','',1600,1689),(364,'Round blue pillow','',1500,1690),(365,'Round red pillow','',1500,1691),(366,'Round purple pillow','',1500,1692),(367,'Round turquoise round pillow','',1500,1693),(368,'Sofa','',0,0),(369,'Wardrobe','',0,0),(370,'Drawers','',0,1714),(371,'Drawers','',0,1715),(372,'Drawers','',0,1716),(373,'Drawers','',0,1717),(374,'Bookcase','',0,0),(375,'Dresser','',0,1724),(376,'Dresser','',0,1725),(377,'Dresser','',0,1726),(378,'Dresser','',0,1727),(379,'Pendulum clock','',0,1728),(380,'Pendulum clock','',0,1729),(381,'Pendulum clock','',0,1730),(382,'Pendulum clock','',0,1731),(383,'Locker','',0,1732),(384,'Locker','',0,1733),(385,'Locker','',0,1734),(386,'Locker','',0,1735),(387,'Standing mirror','',0,1736),(388,'Standing mirror','',0,1737),(389,'Box','',8000,1738),(390,'Crate','',8000,1739),(391,'Chest','',12000,1740),(392,'Box','',12000,1741),(393,'Wooden coffin','',0,0),(394,'Treasure chest','',12000,1746),(395,'Chest','',12000,1747),(396,'Chest','',12000,1748),(397,'Chest','',12000,1749),(398,'Large trunk','',0,1750),(399,'Large trunk','',0,1751),(400,'Large trunk','',0,1752),(401,'Large trunk','',0,1753),(402,'Bed','',0,1754),(403,'Bed','',0,1755),(404,'Cot','',0,1756),(405,'Cot','',0,1757),(406,'Cot','',0,1758),(407,'Cot','',0,1759),(408,'Bed','',0,1760),(409,'Bed','',0,1761),(410,'Bed','',0,1762),(411,'Bed','',0,1763),(412,'Bed','',0,1764),(413,'Bed','',0,1765),(414,'Cot','',0,1766),(415,'Cot','',0,1767),(416,'Cot','',0,1768),(417,'Cot','',0,1769),(418,'Barrel','',0,1770),(419,'Water cask','',0,1771),(420,'Beer cask','',0,1772),(421,'Wine cask','',0,1773),(422,'Barrel','',0,1774),(423,'Trough','',0,1775),(424,'Lemonade cask','',0,1776),(425,'Dustbin','',0,1777),(426,'Big wine cask','',0,0),(427,'Oven','',0,0),(428,'Red carpet','',0,0),(429,'Oriental carpet','',0,0),(430,'Painting','',0,1809),(431,'Blackboard','',0,1810),(432,'Blackboard','',0,1811),(433,'Tapestry','',0,0),(434,'Painting','',0,1814),(435,'Blackboard','',0,1815),(436,'Mirror','',0,0),(437,'Blackboard','',0,1818),(438,'Banner','',0,1819),(439,'Emblem','',0,1820),(440,'Banner','',0,0),(441,'Painting','',0,0),(442,'Picture','',0,0),(443,'Wall mirror','',0,0),(444,'Wall mirror','',600,1845),(445,'Wall mirror','',0,0),(446,'Wall mirror','',1000,1848),(447,'Wall mirror','',0,0),(448,'Wall mirror','',700,1851),(449,'Picture','',200,0),(450,'Purple tapestry','',0,0),(451,'Purple tapestry','',1000,1857),(452,'Green tapestry','',0,0),(453,'Green tapestry','',1000,1860),(454,'Yellow tapestry','',0,0),(455,'Yellow tapestry','',1000,1863),(456,'Orange tapestry','',0,0),(457,'Orange tapestry','',1000,1866),(458,'Red tapestry','',0,0),(459,'Red tapestry','',1000,1869),(460,'Blue tapestry','',0,0),(461,'Blue tapestry','',1000,1872),(462,'Cuckoo clock','',0,0),(463,'Cuckoo clock','',1500,1877),(464,'White tapestry','',0,0),(465,'White tapestry','',1000,1880),(466,'Cuckoo clock','',1500,1881),(467,'Demon trophy','',0,0),(468,'Wolf trophy','',0,0),(469,'Orc trophy','',0,0),(470,'Behemnot trophy','',0,0),(471,'Deer trophy','',0,0),(472,'Cyclops trophy','',0,0),(473,'Dragon trophy','',0,0),(474,'Lion trophy','',0,0),(475,'Minotaur trophy','',0,0),(476,'Bloodspot','',0,0),(477,'Cobwebs','',0,0),(478,'Flowery wall','',0,0),(479,'Mossy wall','',0,0),(480,'Mossy wall','',0,0),(481,'Mossy wall','',0,0),(482,'Switch','',0,0),(483,'Blank paper','',100,1947),(484,'Parchment','',200,1948),(485,'Scroll','',50,1949),(486,'Brown book','',1300,1950),(487,'Parchment','',200,1951),(488,'Document','',150,1952),(489,'Parchment','',200,1953),(490,'Paper','',100,1954),(491,'Black book','',1300,1955),(492,'Map','',830,1956),(493,'Map','',790,1957),(494,'Grey small book','',1300,1958),(495,'Brown thin book','',1300,1959),(496,'Brown square book','',1300,1960),(497,'Red square book','',1300,1961),(498,'Orange book','',1300,1962),(499,'Blue book','',1300,1963),(500,'Big blue demona book','',1300,1964),(501,'Green book','',1300,1965),(502,'Fat green book','',1300,1966),(503,'Parchment','',200,1967),(504,'Document','',150,1968),(505,'Written parchment','',200,1969),(506,'Holy tible','',1300,1970),(507,'Brown book','',1300,1971),(508,'Black book','',1300,1972),(509,'Grey small book','',1300,1973),(510,'Brown thin book','',1300,1974),(511,'Brown square book','',1300,1975),(512,'Gemmed book','',1300,1976),(513,'Orange book','',1300,1977),(514,'Blue book','',1300,1978),(515,'Big blue demona book','',1300,1979),(516,'Green book','',1300,1980),(517,'Fat green book','',1300,1981),(518,'Purple tome','It is a volume of The Mystic Secrets of Tibia.',1900,1982),(519,'Green tome','It is a volume of The Mystic Secrets of Tibia.',1900,1983),(520,'Blue tome','It is a volume of The Mystic Secrets of Tibia.',1900,1984),(521,'Grey tome','It is a volume of The Mystic Secrets of Tibia.',1900,1985),(522,'Red tome','It is a volume of The Mystic Secrets of Tibia.',1900,1986),(523,'Bag','',800,1987),(524,'Backpack','',1800,1988),(525,'Basket','',950,1989),(526,'Present','',600,1990),(527,'Green bag','',800,1991),(528,'Yellow bag','',800,1992),(529,'Red bag','',800,1993),(530,'Purple bag','',800,1994),(531,'Blue bag','',800,1995),(532,'Grey bag','',800,1996),(533,'Golden bag','',800,1997),(534,'Green backpack','',1800,1998),(535,'Yellow backpack','',1800,1999),(536,'Red backpack','',1800,2000),(537,'Purple backpack','',1800,2001),(538,'Blue backpack','',1800,2002),(539,'Grey backpack','',1800,2003),(540,'Golden backpack','',1800,2004),(541,'Bucket','',2000,2005),(542,'Vial','',180,2006),(543,'Blue bottle','',250,2007),(544,'Vase','',940,2008),(545,'Green flask','',300,2009),(546,'Broken bottle','',100,2010),(547,'Blue amphora','',850,2011),(548,'Mug','',250,2012),(549,'Cup','',200,2013),(550,'Jug','',750,2014),(551,'Brown flask','',250,2015),(552,'Pool','',0,2016),(553,'Pool','',0,2017),(554,'Pool','',0,2018),(555,'Pool','',0,2019),(556,'Pool','',0,2020),(557,'Pool','',0,2021),(558,'Broken bottle','',80,2022),(559,'Amphora','',9700,2023),(560,'Broken brown glass','',100,2024),(561,'Pool','',0,0),(562,'Waterskin','',800,2031),(563,'Bowl','',380,2032),(564,'Golden mug','',470,2033),(565,'Large amphora','',0,2034),(566,'Plate','',150,2035),(567,'Watch','',50,2036),(568,'Wall lamp','',0,2037),(569,'Lit wall lamp','',0,2038),(570,'Wall lamp','',0,2039),(571,'Lit wall lamp','',0,2040),(572,'Candelabrum','',500,2041),(573,'Candelabrum','',500,2042),(574,'Used candelabrum','',300,2043),(575,'Lamp','',3000,2044),(576,'Lamp','',3000,2045),(577,'Lamp','',3000,2046),(578,'Candlestick','',300,2047),(579,'Candlestick','',300,2048),(580,'Candlestick','',200,2049),(581,'Torch','',500,2050),(582,'Torch','',500,2051),(583,'Torch','',500,2052),(584,'Torch','',500,2053),(585,'Torch','',500,2054),(586,'Torch','',500,2055),(587,'Torch','',500,2056),(588,'Candelabrum','',500,2057),(589,'Torch bearer','',0,2058),(590,'Lit torch bearer','',0,2059),(591,'Torch bearer','',0,2060),(592,'Lit torch bearer','',0,2061),(593,'Small oil lamp','',100,2062),(594,'Small oil lamp','',100,2063),(595,'Table lamp','',0,0),(596,'Wall lamp','',0,0),(597,'Flute','',200,2070),(598,'Lyre','',1250,2071),(599,'Lute','',3400,2072),(600,'Drum','',3200,2073),(601,'Panpipes','',100,2074),(602,'Simple fanfare','',2200,2075),(603,'Fanfare','',2300,2076),(604,'Royal fanfare','',2300,2077),(605,'Post horn','',1500,2078),(606,'Horn','',100,2079),(607,'Piano','',0,2080),(608,'Piano','',0,2081),(609,'Piano','',0,2082),(610,'Piano','',0,2083),(611,'Harp','',0,2084),(612,'Harp','',0,2085),(613,'Purple key','',100,2086),(614,'Wooden key','',100,2087),(615,'Silver key','',100,2088),(616,'Copper key','',100,2089),(617,'Crystal key','',100,2090),(618,'Golden key','',100,2091),(619,'Bone key','',100,2092),(620,'Water-pipe','',200,2093),(621,'Birdcage','',9200,2094),(622,'Birdcage','You see a little bird inside.',9200,2095),(623,'Pumpkinhead','',500,0),(624,'Globe','',0,2098),(625,'Water-pipe','',300,2099),(626,'God flowers','',1100,2100),(627,'Indoor plant','',0,2101),(628,'Flower bowl','',1100,2102),(629,'Honey flower','',1000,2103),(630,'Potted flower','',2300,2104),(631,'Christmas tree','',0,2105),(632,'Big flowerpot','',0,2106),(633,'Exotic flower','',100,2107),(634,'Wooden doll','',860,2108),(635,'Football','',0,2109),(636,'Doll','',650,2110),(637,'Snowball','',80,2111),(638,'Teddy bear','',700,2112),(639,'Model ship','',1300,2113),(640,'Piggy bank','',150,2114),(641,'Broken piggy bank','',100,2115),(642,'Rocking horse','',0,2116),(643,'Rocking horse','',0,2117),(644,'Rocking horse','',0,2118),(645,'Rocking horse','',0,2119),(646,'Rope','',1800,2120),(647,'Wedding ring','',40,2121),(648,'Elven brooch','',100,2122),(649,'Ring of the sky','',40,2123),(650,'Crystal ring','',90,2124),(651,'Crystal necklace','',490,2125),(652,'Bronzen necklace','',700,2126),(653,'Emerald bangle','',170,2127),(654,'Crown','A hermit near Carlin might be able to tell you more about it.',200,2128),(655,'Wolf tooth chain','',330,2129),(656,'Golden amulet','Many gems glitter on the amulet.',830,2130),(657,'Star amulet','',660,2131),(658,'Silver necklace','',550,2132),(659,'Ruby necklace','',570,2133),(660,'Silver brooch','',110,2134),(661,'Scarab amulet','',120,2135),(662,'Demonbone amulet','',700,2136),(663,'Some golden fruits','',300,2137),(664,'Starlight amulet','',5200,2138),(665,'Ancient tiara','',450,2139),(666,'Holy scarab','',500,2140),(667,'Holy falcon','',840,2141),(668,'Ancient amulet','',840,2142),(669,'White pearl','',20,2143),(670,'Black pearl','',20,2144),(671,'Small diamond','',10,2145),(672,'Small sapphire','',10,2146),(673,'Small ruby','',10,2147),(674,'Gold coin','',10,2148),(675,'Small emerald','',10,2149),(676,'Small amethyst','',10,2150),(677,'Talon','There are many rumours about these magic gems.',20,2151),(678,'Platinum coin','',10,2152),(679,'Violet gem','',30,2153),(680,'Yellow gem','',30,2154),(681,'Green gem','',150,2155),(682,'Red gem','',30,2156),(683,'Gold nugget','',10,2157),(684,'Blue gem','',100,2158),(685,'Scarab coin','',100,2159),(686,'Crystal coin','',10,2160),(687,'Strange talisman','',290,2161),(688,'Magic lightwand','',1500,2162),(689,'Magic lightwand','',1500,2163),(690,'Might ring','',100,2164),(691,'Stealth ring','',100,2165),(692,'Power ring','',80,2166),(693,'Energy ring','',80,2167),(694,'Life ring','',80,2168),(695,'Time ring','',90,2169),(696,'Silver amulet','',500,2170),(697,'Platinum amulet','It is an amulet of protection.',600,2171),(698,'Bronze amulet','',500,2172),(699,'Amulet of loss','',420,2173),(700,'Strange symbol','',200,2174),(701,'Spellbook','It shows your spells and can also shield against attack when worn.',5800,2175),(702,'Orb','',800,2176),(703,'Life crystal','',250,2177),(704,'Mind stone','',250,2178),(705,'Gold ring','',100,2179),(706,'Orb of nature','',0,2180),(707,'Terra rod','Small stones are flying from its tip.',2500,2181),(708,'Snakebite rod','It seems to twitch and quiver as if trying to escape your grip.',4300,2182),(709,'Hailstorm rod','It grants you the power of striking your foes with furious hailstorms.',2700,2183),(710,'Crystal wand','',2800,2184),(711,'Necrotic rod','It was brought up from hell to deliver death.',2300,2185),(712,'Moonlight rod','Icecold rays of moonlight shimmer on its tip.',2100,2186),(713,'Wand of inferno','It unleashes the very fires of hell.',2700,2187),(714,'Wand of decay','It is half-rotten itself and reeks terribly.',2300,2188),(715,'Wand of cosmic energy','The energy of a radiant star is trapped inside its globe.',2500,2189),(716,'Wand of vortex','Surges of energy rush through the tip of this wand.',1900,2190),(717,'Wand of dragonbreath','Legends say that this wand holds the soul of a young dragon.',2300,2191),(718,'Crystal ball','',3400,2192),(719,'Ankh','',420,2193),(720,'Mysterious fetish','',490,2194),(721,'Boots of haste','',750,2195),(722,'Broken amulet','',420,2196),(723,'Stone skin amulet','',760,2197),(724,'Elven amulet','',270,2198),(725,'Garlic necklace','',380,2199),(726,'Protection amulet','',550,2200),(727,'Dragon necklace','',630,2201),(728,'Stealth ring','',100,2202),(729,'Power ring','',80,2203),(730,'Energy ring','',80,2204),(731,'Life ring','',80,2205),(732,'Time ring','',90,2206),(733,'Sword ring','',90,2207),(734,'Axe ring','',90,2208),(735,'Club ring','',90,2209),(736,'Sword ring','',90,2210),(737,'Axe ring','',90,2211),(738,'Club ring','',90,2212),(739,'Dwarven ring','',110,2213),(740,'Ring of healing','',80,2214),(741,'Dwarven ring','',110,2215),(742,'Ring of healing','',100,2216),(743,'Spellbook','',5800,2217),(744,'Paw amulet','',1000,2218),(745,'Banana skin','',30,2219),(746,'Dirty fur','',200,2220),(747,'Old twig','',50,2221),(748,'Some wood','',40,2222),(749,'Rubbish','',10,0),(750,'Piece of iron','',10,2225),(751,'Fishbone','',70,2226),(752,'Rotten meat','',60,2227),(753,'Broken pottery','',180,2228),(754,'Skull','',2180,2229),(755,'Bone','',950,2230),(756,'Big bone','',1900,2231),(757,'Broken brown glass','',250,2232),(758,'Broken green glass','',170,2233),(759,'Broken sword','',3500,2234),(760,'Moldy cheese','',400,2235),(761,'Torn book','',1100,2236),(762,'Dirty cape','',500,2237),(763,'Worn leather boots','',400,2238),(764,'Burnt scroll','',40,2239),(765,'Fish remains','',110,2240),(766,'Rubbish','',50,2241),(767,'Rubbish','',60,0),(768,'Leaves','',80,2244),(769,'Twigs','',80,2245),(770,'Burnt down firewood','',420,2246),(771,'Skull','',0,0),(772,'Smoke','',0,2249),(773,'Wooden trash','',100,0),(774,'Metal trash','',300,0),(775,'Golden trash','',200,2258),(776,'Stone rubbish','',200,2259),(777,'Blank rune','',210,2260),(778,'Destroy field rune','',70,2261),(779,'Energy bomb rune','',105,2262),(780,'Spell rune','',120,0),(781,'Intense healing rune','',210,2265),(782,'Antidote rune','',210,2266),(783,'Spell rune','',120,2267),(784,'Sudden death rune','',70,2268),(785,'Wild growth rune','',105,2269),(786,'Spell rune','',120,2270),(787,'Icicle rune','',42,2271),(788,'Spell rune','',120,2272),(789,'Ultimate healing rune','',210,2273),(790,'Avalanche rune','',52,2274),(791,'Spell rune','',120,0),(792,'Energy field rune','',70,2277),(793,'Paralyze rune','',210,2278),(794,'Energy wall rune','',52,2279),(795,'Spell rune','',120,0),(796,'Poison field rune','',70,2285),(797,'Poison bomb rune','',105,2286),(798,'Light magic missile rune','',21,2287),(799,'Stone shower rune','',52,2288),(800,'Poison wall rune','',52,2289),(801,'Convince creature rune','',210,2290),(802,'Chameleon rune','',210,2291),(803,'Stalagmite rune','',21,2292),(804,'Magic wall rune','',70,2293),(805,'Spell rune','',120,2294),(806,'Holy missile rune','',42,2295),(807,'Spell rune','',120,0),(808,'Fire field rune','',70,2301),(809,'Fireball rune','',42,2302),(810,'Fire wall rune','',52,2303),(811,'Great fireball rune','',52,2304),(812,'Firebomb rune','',105,2305),(813,'Spell rune','',120,0),(814,'Soulfire rune','',70,2308),(815,'Spell rune','',120,2309),(816,'Desintegrate rune','',70,2310),(817,'Heavy magic missile rune','',21,2311),(818,'Spell rune','',120,2312),(819,'Explosion rune','',35,2313),(820,'Spell rune','',120,2314),(821,'Thunderstorm rune','',52,2315),(822,'Animate dead rune','',210,2316),(823,'Dead human','',0,2317),(824,'Brooch','',101,2318),(825,'Strange symbol','',200,2319),(826,'Skull','',2180,2320),(827,'Giant smithhammer','This cyclopean hammer seems to be an awesome smithing tool.',6800,2321),(828,'Voodoo doll','It looks like a little king.',650,2322),(829,'Hat of the mad','You have a vague feeling that it looks somewhat silly.',700,2323),(830,'Broom','',1100,2324),(831,'Black book','',1300,2325),(832,'Annihilation bear','I braved the Annihilator and all I got is this lousy teddy bear.',4300,2326),(833,'Ankh','',300,2327),(834,'Phoenix egg','',30,2328),(835,'Document','',105,2329),(836,'Bag','',800,2330),(837,'Present','',600,2331),(838,'Post horn','It\'s property of the Postmaster\'s Guild and only rewarded to loyal members.',1500,2332),(839,'Stamped letter','',50,2333),(840,'Mailbox','Royal Tibia Mail.',0,2334),(841,'Helmet ornament','This item seems to be a single part of a bigger object.',160,2335),(842,'Gem holder','This item seems to be a single part of a bigger object.',80,2336),(843,'Right horn','This item seems to be a single part of a bigger object.',140,2337),(844,'Left horn','This item seems to be a single part of a bigger object.',140,2338),(845,'Damaged helmet','This item seems to have several parts missing.',1800,2339),(846,'Helmet piece','This item seems to be a single part of a bigger object.',260,2340),(847,'Helmet adornment','This item seems to be a single part of a bigger object.',180,2341),(848,'Helmet of the ancients','The gem of the helmet is burned out and should be replaced.',2760,2342),(849,'Helmet of the ancients','The gem is glowing with power.',2760,2343),(850,'Oil lamp','',500,2344),(851,'Town scroll','This item can teleport you to your home town. Put the scroll in your hand to use it.',100,2345),(852,'Tear of daraman','',30,2346),(853,'Cookbook','',1500,2347),(854,'Ancient rune','This rune vibrates with ancient powers. It seems to be rotting rapidly.',300,2348),(855,'Blue note','The blue crystal is softly humming a ghostly melody. It seems to be rotting rapidly.',250,2349),(856,'Sword hilt','It was once part of a formidable two handed weapon. It seems to be rotting rapidly.',900,2350),(857,'Cobrafang dagger','This ritual weapon was forged from the sharp fang of a giant cobra. It seems to be rotting rapidly.',600,2351),(858,'Crystal arrow','This arrow seems not suitable for the use with ordinary bows. It seems to be rotting rapidly.',100,2352),(859,'Burning heart','It is still beating with unholy life. It seems to be rotting rapidly.',400,2353),(860,'Ornamented ankh','This ancient relic shows signs of untold age. It seems to be rotting rapidly.',200,2354),(861,'Stuffed rabbit','',200,2355),(862,'Small oil lamp','',500,2356),(863,'Ring of wishes','',90,2357),(864,'Boots of waterwalking','',800,2358),(865,'Small oil lamp','',900,2359),(866,'Portable hole','',0,2360),(867,'Frozen starlight','',20,2361),(868,'Carrot of doom','',200,2362),(869,'Blood orb','',150,2363),(870,'Post horn','',1500,2364),(871,'Backpack of holding','',1500,2365),(872,'Roc feather','',100,2366),(873,'Drum','',3200,2367),(874,'Simple fanfare','',2200,2368),(875,'Cornucopia','',1400,2369),(876,'Lute','',3400,2370),(877,'Horn of sundering','',1500,2371),(878,'Lyre','',1250,2372),(879,'Panpipes','',820,2373),(880,'Wooden flute','',200,2374),(881,'Gemmed lamp','It is the djinn leader\'s sleeping lamp.',1300,2375),(882,'Sword','',3500,2376),(883,'Two handed sword','',7000,2377),(884,'Battle axe','',5000,2378),(885,'Dagger','',950,2379),(886,'Hand axe','',1800,2380),(887,'Halberd','',9000,2381),(888,'Club','',2500,2382),(889,'Spike sword','',5000,2383),(890,'Rapier','',1500,2384),(891,'Sabre','',2500,2385),(892,'Axe','',4000,2386),(893,'Double axe','',7000,2387),(894,'Hatchet','',3500,2388),(895,'Spear','',2000,2389),(896,'Magic longsword','It is the magic Cyclopmania Sword.',4300,2390),(897,'War hammer','',8500,2391),(898,'Fire sword','The blade is a magic flame.',2300,2392),(899,'Giant sword','This sword has been forged by ancient giants.',18000,2393),(900,'Morning star','',5400,2394),(901,'Carlin sword','',4000,2395),(902,'Ice rapier','A deadly but fragile weapon.',1500,2396),(903,'Longsword','',4200,2397),(904,'Mace','',2800,2398),(905,'Throwing star','',200,2399),(906,'Magic sword','It is the Sword of Valor.',4200,2400),(907,'Staff','',3800,2401),(908,'Silver dagger','',1019,2402),(909,'Knife','',420,2403),(910,'Combat knife','',869,2404),(911,'Sickle','',1050,2405),(912,'Short sword','',3500,2406),(913,'Bright sword','The blade shimmers in light blue.',2900,2407),(914,'Warlord sword','Strong powers flow in this magic sword.',6400,2408),(915,'Serpent sword','',4100,2409),(916,'Throwing knife','',500,2410),(917,'Poison dagger','',880,2411),(918,'Katana','',3100,2412),(919,'Broadsword','',5250,2413),(920,'Dragon lance','The extraordinary sharp blade penetrates every armor.',6700,2414),(921,'Great axe','A masterpiece of a dwarven smith.',9000,2415),(922,'Crowbar','',2100,2416),(923,'Battle hammer','',6800,2417),(924,'Golden sickle','',1950,2418),(925,'Scimitar','',2900,2419),(926,'Machete','',1650,2420),(927,'Thunder hammer','It is blessed by the gods of Tibia.',12500,2421),(928,'Iron hammer','',6600,2422),(929,'Clerical mace','',5800,2423),(930,'Silver mace','',6700,2424),(931,'Obsidian lance','',8000,2425),(932,'Naginata','',8000,2426),(933,'Guardian halberd','',11000,2427),(934,'Orcish axe','',4500,2428),(935,'Barbarian axe','',5100,2429),(936,'Knight axe','',5900,2430),(937,'Stonecutter axe','You feel the power of this mighty axe.',9900,2431),(938,'Fire axe','The blade is a magic flame.',4000,2432),(939,'Enchanted staff','Temporary magic powers enchant this staff.',3800,2433),(940,'Dragon hammer','',9700,2434),(941,'Dwarven axe','',8200,2435),(942,'Skull staff','The staff longs for death.',1700,2436),(943,'Light mace','',5000,2437),(944,'Epee','',1500,2438),(945,'Daramanian mace','',6800,2439),(946,'Daramanian waraxe','',5250,2440),(947,'Daramanian axe','',5250,2441),(948,'Heavy machete','',1839,2442),(949,'Ravager\'s axe','A power weapon made only for royal guards of the pharaoh.',5250,2443),(950,'Hammer of maveria','',7000,2444),(951,'Crystal mace','',8000,2445),(952,'Pharaoh sword','',19000,2446),(953,'Twin axe','',6400,2447),(954,'Studded club','',3500,2448),(955,'Bone club','',3900,2449),(956,'Bone sword','',1900,2450),(957,'Djinn blade','',2450,2451),(958,'Heavy mace','',11000,2452),(959,'Arcane staff','',4000,2453),(960,'War axe','',6150,2454),(961,'Crossbow','',4000,2455),(962,'Bow','',3100,2456),(963,'Steel helmet','',4600,2457),(964,'Chain helmet','',4200,2458),(965,'Iron helmet','',3000,2459),(966,'Brass helmet','',2700,2460),(967,'Leather helmet','',2200,2461),(968,'Devil helmet','',5000,2462),(969,'Plate armor','',12000,2463),(970,'Chain armor','',10000,2464),(971,'Brass armor','',8000,2465),(972,'Golden armor','It is an enchanted armor.',8000,2466),(973,'Leather armor','',6000,2467),(974,'Studded legs','',2600,2468),(975,'Gladiator legs','',4800,2469),(976,'Golden legs','',5600,2470),(977,'Golden helmet','It is the famous Helmet of the Stars.',3200,2471),(978,'Magic plate armor','An enchanted gem glows on the plate armor.',8500,2472),(979,'Viking helmet','',3900,2473),(980,'Sniper helmet','It is the Helmet of Hermes.',1200,2474),(981,'Warrior helmet','',6800,2475),(982,'Knight armor','',12000,2476),(983,'Knight legs','',7000,2477),(984,'Brass legs','',3800,2478),(985,'Strange helmet','',4600,2479),(986,'Legion helmet','',3100,2480),(987,'Soldier helmet','',3200,2481),(988,'Studded helmet','',2450,2482),(989,'Scale armor','',10500,2483),(990,'Studded armor','',7100,2484),(991,'Doublet','',2500,2485),(992,'Noble armor','',12000,2486),(993,'Crown armor','',9900,2487),(994,'Crown legs','',6500,2488),(995,'Dark armor','',12000,2489),(996,'Dark helmet','',4600,2490),(997,'Crown helmet','',2950,2491),(998,'Dragon scale mail','',11400,2492),(999,'Demon helmet','You hear an evil whispering from the inside.',2950,2493),(1000,'Demon armor','',8000,2494),(1001,'Demon legs','',7000,2495),(1002,'Gladiator helmet','',5100,2496),(1003,'Crusader helmet','',5200,2497),(1004,'Royal helmet','An excellent masterpiece of a smith.',4800,2498),(1005,'Amazon helmet','',2950,2499),(1006,'Amazon armor','',9900,2500),(1007,'Ceremonial mask','',1200,2501),(1008,'Dwarven helmet','',4200,2502),(1009,'Dwarven armor','',13000,2503),(1010,'Alchemist legs','',4000,2504),(1011,'Elven armor','',11400,2505),(1012,'Dragon scale helmet','It is made of dragon scales.',6000,2506),(1013,'Sniper legs','',1200,2507),(1014,'Native armor','',5000,2508),(1015,'Steel shield','',6900,2509),(1016,'Plate shield','',6500,2510),(1017,'Brass shield','',6000,2511),(1018,'Wooden shield','',4000,2512),(1019,'Battle shield','',6200,2513),(1020,'Mastermind shield','It is an enchanted shield.',5700,2514),(1021,'Guardian shield','',5500,2515),(1022,'Dragon shield','',6000,2516),(1023,'Shield of honour','A mighty shield warded by the gods of Tibia.',5400,2517),(1024,'Beholder shield','',4700,2518),(1025,'Crown shield','',6200,2519),(1026,'Demon shield','This powerful shield seems to be as light as air.',2600,2520),(1027,'Dark shield','',5200,2521),(1028,'Great shield','The shield is made of dragon scales.',8400,2522),(1029,'Blessed shield','The shield grants divine protection.',6800,2523),(1030,'Ornamented shield','Many gems sparkle on the shield.',6700,2524),(1031,'Dwarven shield','',5500,2525),(1032,'Studded shield','',5900,2526),(1033,'Rose shield','',5200,2527),(1034,'Tower shield','',8200,2528),(1035,'Black shield','An unholy creature covers the shield.',4200,2529),(1036,'Copper shield','',6300,2530),(1037,'Viking shield','',6600,2531),(1038,'Ancient shield','',6100,2532),(1039,'Griffin shield','',5000,2533),(1040,'Vampire shield','Dark powers enchant this shield.',3800,2534),(1041,'Castle shield','',4900,2535),(1042,'Medusa shield','',5800,2536),(1043,'Amazon shield','',6200,2537),(1044,'Eagle shield','',6000,2538),(1045,'Maveria shield','This shield feels warm to the touch.',3500,2539),(1046,'Scarab shield','',4700,2540),(1047,'Bone shield','',5500,2541),(1048,'Tempest shield','',5100,2542),(1049,'Bolt','',80,2543),(1050,'Arrow','',70,2544),(1051,'Poison arrow','',80,2545),(1052,'Burst arrow','',90,2546),(1053,'Power bolt','',80,2547),(1054,'Pitch fork','',2500,2548),(1055,'Rake','',1500,2549),(1056,'Scythe','',3000,2550),(1057,'Broom','',1100,2551),(1058,'Hoe','',2800,2552),(1059,'Pick','',3500,2553),(1060,'Shovel','',3500,2554),(1061,'Anvil','',0,2555),(1062,'Wooden hammer','',600,2556),(1063,'Carpenter hammer','',800,2557),(1064,'Saw','',1400,2558),(1065,'Small axe','',2000,2559),(1066,'Mirror','',950,2560),(1067,'Baking tray','',1200,2561),(1068,'Pot','',5250,2562),(1069,'Pan','',1800,2563),(1070,'Fork','',100,2564),(1071,'Spoon','',100,2565),(1072,'Knife','',100,2566),(1073,'Wooden spoon','',100,2567),(1074,'Cleaver','',660,2568),(1075,'Oven spatula','',1400,2569),(1076,'Rolling pin','',500,2570),(1077,'Bowl','',1000,0),(1078,'White vase','',1500,2574),(1079,'Yellow vase','',1500,2575),(1080,'Blue vase','',1500,2576),(1081,'Green vase','',1500,2577),(1082,'Closed trap','',2100,2578),(1083,'Open trap','',2100,2579),(1084,'Fishing rod','',850,2580),(1085,'Telescope','',0,2581),(1086,'Telescope','',0,2582),(1087,'Telescope','',0,2583),(1088,'Telescope','',0,2584),(1089,'Ship\'s telescope','',0,2585),(1090,'Ship\'s telescope','',0,2586),(1091,'Ship\'s telescope','',0,2587),(1092,'Ship\'s telescope','',0,2588),(1093,'Locker','',0,0),(1094,'Mailbox','Royal Tibia Mail.',0,2593),(1095,'Depot chest','',0,2594),(1096,'Parcel','',1800,2595),(1097,'Stamped parcel','',1800,2596),(1098,'Letter','',50,2597),(1099,'Stamped letter','',30,2598),(1100,'Label','',10,2599),(1101,'Inkwell','',200,2600),(1102,'Coal basin','',0,0),(1103,'Altar','',0,0),(1104,'Sacrifical stone','',0,0),(1105,'Altar','',0,0),(1106,'Sacrifical stone','',0,0),(1107,'Black token','',500,2624),(1108,'White token','',500,2625),(1109,'White pawn','',500,2626),(1110,'White castle','',500,2627),(1111,'White knight','',500,2628),(1112,'White bishop','',500,2629),(1113,'White queen','',500,2630),(1114,'White king','',500,2631),(1115,'Black pawn','',500,2632),(1116,'Black castle','',500,2633),(1117,'Black knight','',500,2634),(1118,'Black bishop','',500,2635),(1119,'Black queen','',500,2636),(1120,'Black king','',500,2637),(1121,'Tic-tac-toe token','',500,0),(1122,'Pair of soft boots','',800,2640),(1123,'Traper boots','',900,2641),(1124,'Sandals','',600,2642),(1125,'Leather boots','',900,2643),(1126,'Bunny slippers','',1200,2644),(1127,'Steel boots','',2900,2645),(1128,'Golden boots','',3200,2646),(1129,'Plate legs','',5000,2647),(1130,'Chain legs','',3500,2648),(1131,'Leather legs','',1800,2649),(1132,'Jacket','',2400,2650),(1133,'Coat','',2700,2651),(1134,'Green tunic','',930,2652),(1135,'Red tunic','',3000,2653),(1136,'Cape','',3200,2654),(1137,'Red robe','',2600,2655),(1138,'Blue robe','It is a magic robe.',2200,2656),(1139,'Simple dress','',2400,2657),(1140,'White dress','',2400,2658),(1141,'Ball gown','',2500,2659),(1142,'Ranger\'s cloak','',4800,2660),(1143,'Scarf','',200,2661),(1144,'Magician hat','',750,2662),(1145,'Mystic turban','Something is strange about this turban.',850,2663),(1146,'Cowl','',700,2664),(1147,'Post officers hat','This hat is the insignia of all tibian post officers.',700,2665),(1148,'Meat','',1300,2666),(1149,'Fish','',520,2667),(1150,'Salmon','',320,2668),(1151,'Northern pike','',120,2669),(1152,'Shrimp','',30,2670),(1153,'Ham','',2000,2671),(1154,'Dragon ham','It still contains a small part of the power of a dragon.',3000,2672),(1155,'Pear','',140,2673),(1156,'Red apple','',150,2674),(1157,'Orange','',110,2675),(1158,'Banana','',180,2676),(1159,'Blueberry','',20,2677),(1160,'Coconut','',480,2678),(1161,'Cherry','',20,2679),(1162,'Strawberry','',20,2680),(1163,'Grapes','',250,2681),(1164,'Melon','',950,2682),(1165,'Pumpkin','',1200,2683),(1166,'Carrot','',200,2684),(1167,'Tomato','',100,2685),(1168,'Corncob','',350,2686),(1169,'Cookie','',10,2687),(1170,'Candy cane','',50,2688),(1171,'Bread','',500,2689),(1172,'Roll','',80,2690),(1173,'Brown bread','',400,2691),(1174,'Flour','',500,2692),(1175,'Lump of dough','',500,2693),(1176,'Bunch of wheat','',1250,2694),(1177,'Egg','',30,2695),(1178,'Cheese','',400,2696),(1179,'Snowy dead tree','',0,2697),(1180,'Snowy fir tree','',0,2698),(1181,'Magic tree','',0,2699),(1182,'Fir tree','',0,2700),(1183,'Sycamore','',0,2701),(1184,'Willow','',0,2702),(1185,'Plum tree','',0,2703),(1186,'Red maple','',0,2704),(1187,'Pear tree','',0,2705),(1188,'Yellow maple','',0,2706),(1189,'Beech','',0,2707),(1190,'Poplar','',0,2708),(1191,'Dead tree','',0,0),(1192,'Dwarf tree','',0,2711),(1193,'Pine','',0,2712),(1194,'Dead tree','',0,0),(1195,'Old rush wood','',0,2721),(1196,'Old tree','',0,2722),(1197,'Cactus','',0,0),(1198,'Palm','',0,2725),(1199,'Coconut palm','',0,2726),(1200,'Cactus','',0,0),(1201,'Wheat','',0,2737),(1202,'Wheat','It is not mature yet.',0,2738),(1203,'Wheat','',0,2739),(1204,'Moon flowers','',0,2740),(1205,'Moon flower','',10,2741),(1206,'White flower','',0,2742),(1207,'Heaven blossom','',0,2743),(1208,'Red rose','',80,2744),(1209,'Blue rose','',80,2745),(1210,'Yellow rose','',80,2746),(1211,'Grave flower','',60,2747),(1212,'Love flower','',0,2748),(1213,'Pink royal blossom','',0,2749),(1214,'Yellow royal blossom','',0,2750),(1215,'Red royal blossom','',0,2751),(1216,'Sunflowers','',0,2752),(1217,'Sunflower','',0,2753),(1218,'Tulip','',50,2754),(1219,'Water lily','',0,0),(1220,'Orange star','',70,2759),(1221,'Goat grass','',80,2760),(1222,'Orchid','',0,2761),(1223,'Rose bush','',0,0),(1224,'Bush','',0,2767),(1225,'Small fir tree','',0,2768),(1226,'Bush','',0,2769),(1227,'Branch','',0,2770),(1228,'Swamp plant','',0,0),(1229,'Mud whip','',0,2773),(1230,'Swamp plant','',0,2774),(1231,'Swamp lilly','',0,2775),(1232,'Swamp plant','',0,2776),(1233,'Bog fingers plant','',0,2777),(1234,'Swamp plant','',0,2778),(1235,'Frog leaf','',0,2779),(1236,'Swamp plant','',0,2780),(1237,'Jungle grass','',0,2781),(1238,'Jungle grass','',0,2782),(1239,'Swamp flower','',0,2783),(1240,'Dry bush','',0,2784),(1241,'Blueberry bush','',0,2785),(1242,'Blueberry bush','',0,2786),(1243,'White mushroom','',40,2787),(1244,'Red mushroom','',50,2788),(1245,'Brown mushroom','',20,2789),(1246,'Orange mushroom','',30,2790),(1247,'Wood mushroom','',30,2791),(1248,'Dark mushroom','',10,2792),(1249,'Mushrooms','',10,0),(1250,'Fire mushroom','',10,2795),(1251,'Green mushroom','',10,2796),(1252,'Stone','',0,2797),(1253,'Blood herb','',120,2798),(1254,'Stone herb','',20,2799),(1255,'Star herb','',30,2800),(1256,'Fern','',30,2801),(1257,'Sling herb','',90,2802),(1258,'Powder herb','',50,2803),(1259,'Shadow herb','',100,2804),(1260,'Troll green','',100,2805),(1261,'Dead troll','',60000,2806),(1262,'Dead spider','',4600,2807),(1263,'Dead cyclops','',0,2808),(1264,'Slain skeleton','',60000,2809),(1265,'Dead troll','',50000,2810),(1266,'Dead troll','',30000,2811),(1267,'Dead rat','',6300,2813),(1268,'Dead rat','',4400,2814),(1269,'Dead rat','',3000,2815),(1270,'Dead rat','',2000,2816),(1271,'Dead snake','',1200,2817),(1272,'Dead snake','',840,2818),(1273,'Dead snake','',620,2819),(1274,'Dead orc','',0,2820),(1275,'Dead orc','',0,2821),(1276,'Dead spider','',1000,2822),(1277,'Dead spider','',1000,2823),(1278,'Dead rotworm','',0,2824),(1279,'Dead rotworm','',0,2825),(1280,'Dead wolf','',26000,2826),(1281,'Dead wolf','',20000,2827),(1282,'Dead wolf','',8000,2828),(1283,'Dead wolf','',4000,2829),(1284,'Dead minotaur','',130000,2830),(1285,'Dead minotaur','',105000,2831),(1286,'Dead minotaur','',85000,2832),(1287,'Dead minotaur','',60000,2833),(1288,'Dead minotaur','',60000,2834),(1289,'Dead deer','',68000,2835),(1290,'Dead deer','',68000,2836),(1291,'Dead deer','',5000,2837),(1292,'Dead deer','',5000,2838),(1293,'Dead dog','',1000,2839),(1294,'Dead dog','',21000,2840),(1295,'Dead dog','',1000,2841),(1296,'Dead dog','',700,2842),(1297,'Slain skeleton','',40000,2843),(1298,'Dead dragon','',0,2844),(1299,'Dead dragon','',0,2845),(1300,'Slain ghoul','',0,2846),(1301,'Dead dragon','',0,2847),(1302,'Dead spider','',9000,2848),(1303,'Dead bear','',0,2849),(1304,'Dead bear','',0,2850),(1305,'Dead bear','',0,2851),(1306,'Dead bear','',0,2852),(1307,'Slain ghoul','',60200,2853),(1308,'Slain ghoul','',60200,0),(1309,'Dead giant spider','',0,2857),(1310,'Dead giant spider','',0,2858),(1311,'Dead giant spider','',0,2859),(1312,'Dead orc','',120000,2860),(1313,'Dead orc','',120000,2861),(1314,'Dead orc','',120000,2862),(1315,'Dead orc','',120000,2863),(1316,'Dead orc','',120000,2864),(1317,'Dead orc','',120000,2865),(1318,'Dead minotaur','',60000,2866),(1319,'Dead minotaur','',60000,2867),(1320,'Dead minotaur','',67520,2868),(1321,'Dead minotaur','',60000,0),(1322,'Dead minotaur','',60000,2871),(1323,'Dead minotaur','',60000,2872),(1324,'Dead minotaur','',67520,2873),(1325,'Dead minotaur','',60000,0),(1326,'Dead minotaur','',60000,2876),(1327,'Dead minotaur','',60000,2877),(1328,'Dead minotaur','',60000,2878),(1329,'Dead minotaur','',60000,0),(1330,'Dead dragon lord','',0,2881),(1331,'Dead dragon','',0,2882),(1332,'Dead dragon','',0,2883),(1333,'Dead dragon','',0,2884),(1334,'Dead spider','',1000,2885),(1335,'Dead fire devil','',100000,2886),(1336,'Dead fire devil','',100000,2887),(1337,'Dead fire devil','',100000,2888),(1338,'Dead lion','',0,2889),(1339,'Dead lion','',0,2890),(1340,'Dead lion','',0,2891),(1341,'Dead lion','',0,2892),(1342,'Dead bear','',0,2893),(1343,'Dead bear','',0,2894),(1344,'Dead bear','',0,2895),(1345,'Dead bear','',0,2896),(1346,'Dead scorpion','',1000,2897),(1347,'Dead scorpion','',1000,2898),(1348,'Dead wasp','',1000,2899),(1349,'Dead wasp','',1000,2900),(1350,'Dead wasp','',1000,2901),(1351,'Dead bug','',1000,2902),(1352,'Dead bug','',1000,2903),(1353,'Dead bug','',1000,2904),(1354,'Dead sheep','',1000,2905),(1355,'Dead sheep','',1000,2906),(1356,'Dead sheep','',1000,2907),(1357,'Dead beholder','',0,2908),(1358,'Dead beholder','',0,2909),(1359,'Dead beholder','',0,2910),(1360,'Dead cyclops','',0,0),(1361,'Remains of a ghost','',1000,2913),(1362,'Dead sheep','',1000,2914),(1363,'Dead sheep','',1000,2915),(1364,'Slain demon','',0,2916),(1365,'Slain demon','',0,2917),(1366,'Slain demon','',0,2918),(1367,'Slain demon','',0,2919),(1368,'Dead orc','',90000,2920),(1369,'Dead orc','',90000,2921),(1370,'Slain skeleton','',60000,2922),(1371,'Slain skeleton','',60000,2923),(1372,'Dead wolf','',8000,2924),(1373,'Dead wolf','',8000,2925),(1374,'Dead wolf','',8000,2926),(1375,'Dead wolf','',4000,2927),(1376,'Dead troll','',60000,2928),(1377,'Dead troll','',60000,2929),(1378,'Dead troll','',60000,2930),(1379,'Dead behemoth','',0,2931),(1380,'Dead behemoth','',0,2932),(1381,'Dead behemoth','',0,2933),(1382,'Dead behemoth','',0,2934),(1383,'Dead pig','',1000,2935),(1384,'Dead pig','',1000,2936),(1385,'Dead pig','',1000,2937),(1386,'Dead orc','',120000,2938),(1387,'Dead orc','',120000,2939),(1388,'Dead goblin','',4000,2940),(1389,'Dead goblin','',4000,2941),(1390,'Dead goblin','',4000,2942),(1391,'Dead goblin','',4000,2943),(1392,'Dead spider','',1000,2944),(1393,'Dead elf','',100000,2945),(1394,'Dead elf','',100000,2946),(1395,'Dead elf','',60000,2947),(1396,'Dead elf','',50000,2948),(1397,'Slain mummy','',1000,2949),(1398,'Slain mummy','',1000,2950),(1399,'Slain mummy','',1000,2951),(1400,'Dead stone golem','',0,2952),(1401,'Dead stone golem','',0,2953),(1402,'Dead stone golem','',0,2954),(1403,'Dead stone golem','',0,2955),(1404,'Slain vampire','',100000,2956),(1405,'Slain vampire','',100000,2957),(1406,'Slain vampire','',100000,2958),(1407,'Slain vampire','',60000,2959),(1408,'Dead dwarf','',60000,2960),(1409,'Dead dwarf','',60000,2961),(1410,'Dead dwarf','',60000,2962),(1411,'Dead dwarf','',60000,2963),(1412,'Dead rotworm','',10000,2964),(1413,'Dead scorpion','',1000,2965),(1414,'Dead orc','',10000,2966),(1415,'Dead orc','',120000,2967),(1416,'Dead orc','',120000,2968),(1417,'Dead wolf','',0,2969),(1418,'Dead wolf','',0,2970),(1419,'Dead wolf','',0,2971),(1420,'Dead orc','',0,2972),(1421,'Dead orc','',0,2973),(1422,'Dead orc','',0,2974),(1423,'Slain skeleton','',10000,2975),(1424,'Slain skeleton','',10000,2976),(1425,'Remains of a ghost','',1000,2977),(1426,'Remains of a ghost','',1000,2978),(1427,'Dead elf','',100000,2979),(1428,'Dead elf','',100000,2980),(1429,'Dead elf','',100000,2981),(1430,'Dead elf','',100000,2982),(1431,'Dead dwarf','',60000,2983),(1432,'Dead dwarf','',60000,2984),(1433,'Dead dwarf','',60000,2985),(1434,'Dead dwarf','',60000,2986),(1435,'Dead dwarf','',60000,2987),(1436,'Dead dwarf','',60000,2988),(1437,'Dead djinn','',0,2989),(1438,'Dead djinn','',0,2990),(1439,'Dead djinn','',0,2991),(1440,'Dead rabbit','',1000,2992),(1441,'Dead rabbit','',3070,2993),(1442,'Dead rabbit','',2070,2994),(1443,'Dead troll','',60000,2995),(1444,'Dead troll','',60000,2996),(1445,'Dead troll','',60000,2997),(1446,'Slain banshee','',1000,2998),(1447,'Slain banshee','',1000,2999),(1448,'Slain banshee','',1000,3000),(1449,'Dead djinn','',0,3001),(1450,'Dead djinn','',0,3002),(1451,'Dead djinn','',0,3003),(1452,'Dead ancient scarab','',0,3004),(1453,'Dead ancient scarab','',0,3005),(1454,'Dead ancient scarab','',0,3006),(1455,'Dead cobra','',6000,3007),(1456,'Dead cobra','',6000,3008),(1457,'Dead cobra','',6000,3009),(1458,'Dead larva','',1000,3010),(1459,'Dead larva','',1000,3011),(1460,'Dead larva','',1000,3012),(1461,'Dead scarab','',2000,3013),(1462,'Dead scarab','',2000,3014),(1463,'Dead scarab','',2000,3015),(1464,'Dead pharaoh','',0,3016),(1465,'Dead pharaoh','',0,3017),(1466,'Dead pharaoh','',0,3018),(1467,'Dead hyaena','',8000,3019),(1468,'Dead hyaena','',8000,3020),(1469,'Dead hyaena','',8000,3021),(1470,'Dead gargoyle','',0,3022),(1471,'Dead gargoyle','',0,3023),(1472,'Dead gargoyle','',0,3024),(1473,'Slain lich','',0,3025),(1474,'Slain lich','',0,3026),(1475,'Slain lich','',0,3027),(1476,'Slain crypt shambler','',100000,3028),(1477,'Slain crypt shambler','',100000,3029),(1478,'Slain crypt shambler','',100000,3030),(1479,'Slain bonebeast','',0,3031),(1480,'Slain bonebeast','',0,3032),(1481,'Slain bonebeast','',0,3033),(1482,'Dead pharaoh','',0,3034),(1483,'Dead pharaoh','',0,3035),(1484,'Dead pharaoh','',0,3036),(1485,'Dead djinn','',0,3037),(1486,'Dead djinn','',0,3038),(1487,'Dead djinn','',0,3039),(1488,'Dead djinn','',0,3040),(1489,'Dead djinn','',0,3041),(1490,'Dead djinn','',0,3042),(1491,'Dead badger','',1000,3043),(1492,'Dead badger','',1000,3044),(1493,'Dead badger','',1000,3045),(1494,'Dead skunk','',1000,3046),(1495,'Dead skunk','',1000,3047),(1496,'Dead skunk','',1000,3048),(1497,'Dead gazer','',1000,3049),(1498,'Dead gazer','',1000,3050),(1499,'Dead gazer','',1000,3051),(1500,'Dead beholder','',0,3052),(1501,'Dead beholder','',0,3053),(1502,'Dead beholder','',0,3054),(1503,'Dead yeti','',0,3055),(1504,'Dead yeti','',0,3056),(1505,'Dead yeti','',0,3057),(1506,'Dead human','',0,3058),(1507,'Dead human','',0,3059),(1508,'Dead human','',50000,3060),(1509,'Dead human','',60000,0),(1510,'Dead human','',50000,3064),(1511,'Dead human','',0,3065),(1512,'Dead human','',0,3066),(1513,'Dead troll','',60000,3067),(1514,'Dead spider','',1000,3068),(1515,'Dead cyclops','',0,3069),(1516,'Dead troll','',25040,3070),(1517,'Dead troll','',20040,3071),(1518,'Dead troll','',20040,3072),(1519,'Dead rat','',6800,3073),(1520,'Dead rat','',6800,3074),(1521,'Dead rat','',6000,3075),(1522,'Dead rat','',5400,3076),(1523,'Dead snake','',1200,3077),(1524,'Dead snake','',800,3078),(1525,'Dead snake','',500,3079),(1526,'Dead orc','',16740,3080),(1527,'Dead orc','',16000,3081),(1528,'Dead spider','',4800,3082),(1529,'Dead spider','',4000,3083),(1530,'Dead rotworm','',8500,3084),(1531,'Dead rotworm','',8000,3085),(1532,'Dead wolf','',11950,3086),(1533,'Dead wolf','',11500,3087),(1534,'Dead wolf','',8000,3088),(1535,'Dead wolf','',8000,3089),(1536,'Dead minotaur','',67520,3090),(1537,'Dead minotaur','',67520,3091),(1538,'Dead minotaur','',60000,3092),(1539,'Dead minotaur','',60000,3093),(1540,'Dead minotaur','',60000,3094),(1541,'Dead deer','',25000,3095),(1542,'Dead deer','',24000,3096),(1543,'Dead deer','',21000,3097),(1544,'Dead deer','',18000,3098),(1545,'Dead dog','',1000,3099),(1546,'Dead dog','',1000,3100),(1547,'Dead dog','',700,0),(1548,'Dead skeleton','',10000,3103),(1549,'Dead dragon','',0,3104),(1550,'Dead dragon','',0,3105),(1551,'Dead dragon','',0,3106),(1552,'Dead dragon','',0,3107),(1553,'Remains of a ghost','',1000,3108),(1554,'Dead bear','',0,3109),(1555,'Dead bear','',0,3110),(1556,'Dead bear','',0,3111),(1557,'Dead bear','',0,3112),(1558,'Slain ghoul','',60000,3113),(1559,'Slain ghoul','',60000,3114),(1560,'Slain ghoul','',60000,3115),(1561,'Slain ghoul','',60200,3116),(1562,'Dead cyclops','',0,3117),(1563,'Dead cyclops','',0,3118),(1564,'Dead rabbit','',1000,3119),(1565,'Dead rabbit','',1000,3120),(1566,'Dead rabbit','',1000,3121),(1567,'Dead dragon','',0,0),(1568,'Dead human','',0,3128),(1569,'Dead human','',0,3129),(1570,'Dead human','',120000,3130),(1571,'Dead human','',120000,3131),(1572,'Dead human','',120000,3132),(1573,'Dead human','',60000,3133),(1574,'Dead human','',60000,3134),(1575,'Ladder','',0,0),(1576,'Trapdoor','',0,3137),(1577,'Stairway','',0,3138),(1578,'Wooden floor','',0,0),(1579,'Stone floor','',0,0),(1580,'Strange carving','',0,0),(1581,'Carved stone tile','',0,3169),(1582,'Strange carving','',0,0),(1583,'Ornamented floor','',0,0),(1584,'Carved stone tile','',0,3177),(1585,'Ornamented floor','',0,0),(1586,'Strange carving','',0,0),(1587,'Stone roof','',0,0),(1588,'Strange carving','',0,0),(1589,'Strange carving','It seems to be a switch.',0,3202),(1590,'Strange carving','',0,0),(1591,'Strange carving','It seems to be a switch.',0,3215),(1592,'Wooden tile','It seems to be a switch.',0,0),(1593,'Stone roof','',0,3218),(1594,'Stone stairway','',0,0),(1595,'Stone roof','',0,0),(1596,'Wooden roof','',0,0),(1597,'Stone roof','',0,0),(1598,'Wooden flooring','',0,0),(1599,'Jungle grass','',0,3263),(1600,'Ground','',0,0),(1601,'Jungle grass','',0,0),(1602,'Mud stain','',0,3310),(1603,'Pitfall','',0,3311),(1604,'Ant trail','',0,0),(1605,'Anthill','',0,3323),(1606,'Pitfall','',0,3324),(1607,'Rock','',0,0),(1608,'Dried grass roof','',0,3348),(1609,'Wooden roof','',0,0),(1610,'Stone wall','',0,0),(1611,'Bamboo wall','',0,0),(1612,'Stone archway','',0,0),(1613,'Bamboo wall','',0,0),(1614,'Window','',0,3449),(1615,'Bamboo wall','',0,0),(1616,'Window','',0,3452),(1617,'Broken bamboo','',0,3453),(1618,'Stone wall','',0,0),(1619,'Window','',0,3467),(1620,'Stone wall','',0,0),(1621,'Window','',0,3471),(1622,'Stone wall','',0,0),(1623,'Stone archway','',0,0),(1624,'Stone wall','',0,0),(1625,'Grass wall','',0,0),(1626,'Window','',0,3499),(1627,'Grass wall','',0,0),(1628,'Window','',0,3502),(1629,'Grass wall','',0,3503),(1630,'Grass archway','',0,0),(1631,'Liane','',0,0),(1632,'Palisade','',0,0),(1633,'Stone wall','',0,0),(1634,'Closed door','It is locked.',0,3535),(1635,'Closed door','',0,3536),(1636,'Open door','',0,3537),(1637,'Closed door','',0,3538),(1638,'Open door','',0,3539),(1639,'Gate of expertise','',0,3540),(1640,'Gate of expertise','',0,3541),(1641,'Closed door','',0,3542),(1642,'Open door','',0,3543),(1643,'Closed door','It is locked.',0,3544),(1644,'Closed door','',0,3545),(1645,'Open door','',0,3546),(1646,'Closed door','',0,3547),(1647,'Open door','',0,3548),(1648,'Gate of expertise','',0,3549),(1649,'Gate of expertise','',0,3550),(1650,'Closed door','',0,3551),(1651,'Open door','',0,3552),(1652,'Waterfall','',0,0),(1653,'Small boat','',0,0),(1654,'Sail','',0,0),(1655,'Paddle','',0,0),(1656,'Boat','',0,0),(1657,'Stone','',0,0),(1658,'Stones','',0,0),(1659,'Stone','',0,0),(1660,'Mossy stone','',0,0),(1661,'Stone','',0,0),(1662,'Ladder','',0,3678),(1663,'Ramp','',0,3679),(1664,'Ramp','',0,3680),(1665,'Ramp','',0,3681),(1666,'Ramp','',0,3682),(1667,'Ramp','',0,3683),(1668,'Ramp','',0,3684),(1669,'Ramp','',0,3685),(1670,'Ramp','',0,3686),(1671,'Stone stairs','',0,3687),(1672,'Stone stairs','',0,3688),(1673,'Large cauldron','',0,0),(1674,'Statue','',0,0),(1675,'Dried well','',0,0),(1676,'Poison well','',0,0),(1677,'Statue','',0,0),(1678,'Huntress statue','',0,0),(1679,'Lantern','',0,0),(1680,'Bamboo fence','',0,0),(1681,'Bridge','',0,0),(1682,'Pillar','',0,3766),(1683,'Broken pillar','',0,3767),(1684,'Bridge','',0,0),(1685,'Stone wall','',0,0),(1686,'Bamboo wall','',0,0),(1687,'Statue','',0,0),(1688,'Stone table','',0,3805),(1689,'Stone table','',0,3806),(1690,'Tusk table','',0,3807),(1691,'Tusk table','',0,3808),(1692,'Bamboo table','',0,3809),(1693,'Bamboo table','',0,3810),(1694,'Tree stump','',0,3811),(1695,'Time table','',0,3812),(1696,'Tusk chair','',0,3813),(1697,'Tusk chair','',0,3814),(1698,'Tusk chair','',0,3815),(1699,'Tusk chair','',0,3816),(1700,'Ivory chair','',0,3817),(1701,'Ivory chair','',0,3818),(1702,'Ivory chair','',0,3819),(1703,'Vory chair','',0,3820),(1704,'Tree stump','',0,3821),(1705,'Bookcase','',0,0),(1706,'Bamboo shelf','',0,0),(1707,'Bookcase','',0,0),(1708,'Bookcase','',0,0),(1709,'Bamboo drawer','',0,3832),(1710,'Bamboo drawer','',0,3833),(1711,'Bamboo drawer','',0,3834),(1712,'Bamboo drawer','',0,3835),(1713,'Hammock','',0,3836),(1714,'Hammock','',0,3837),(1715,'Hammock','',0,3838),(1716,'Hammock','',0,3839),(1717,'Hammock','',0,3840),(1718,'Hammock','',0,3841),(1719,'Hammock','',0,3842),(1720,'Hammock','',0,3843),(1721,'Grass','',0,0),(1722,'Hay','',0,0),(1723,'Bear skin rug','',0,0),(1724,'Skunk skin rug','',0,3860),(1725,'Hung cloak','',0,0),(1726,'Cloth wall','',0,0),(1727,'Pile of chopped wood','',0,3871),(1728,'Block of wood','It\'s a lumberjack\'s working place.',0,3872),(1729,'Some pieces of wood','',0,3873),(1730,'Fishing net','',0,0),(1731,'Big footprint','',0,0),(1732,'Cloth wall','',0,0),(1733,'Tiger skin','',0,0),(1734,'Strange carving','',0,3900),(1735,'Furniture package','It is a kit for a wooden chair.',2500,3901),(1736,'Furniture package','It is a kit for a sofa chair.',2500,3902),(1737,'Furniture package','It is a kit for a red cushioned chair.',2500,3903),(1738,'Furniture package','It is a kit for a green cushioned chair.',2500,3904),(1739,'Furniture package','It is a kit for a tusk chair.',2500,3905),(1740,'Furniture package','It is a kit for an ivory chair.',2500,3906),(1741,'Furniture package','It is a kit for an small trunk.',2500,3907),(1742,'Furniture package','It is a kit for a small table.',2500,3908),(1743,'Furniture package','It is a kit for a big table.',2500,3909),(1744,'Furniture package','It is a kit for a square table.',2500,3910),(1745,'Furniture package','It is a kit for a round table.',2500,3911),(1746,'Furniture package','It is a kit for a coal basin.',2500,3912),(1747,'Furniture package','It is a kit for a carved stone table.',2500,3913),(1748,'Furniture package','It is a kit for a tusk table.',2500,3914),(1749,'Furniture package','It is a kit for a drawer.',2500,3915),(1750,'Furniture package','It is a kit for a dresser.',2500,3916),(1751,'Furniture package','It is a kit for a pendulum clock.',2500,3917),(1752,'Furniture package','It is a kit for a locker.',2500,3918),(1753,'Furniture package','It is a kit for a bamboo table.',2500,3919),(1754,'Furniture package','It is a kit for a thick trunk.',2500,3920),(1755,'Furniture package','It is a kit for a harp.',2500,3921),(1756,'Furniture package','It is a kit for a birdcage.',2500,3922),(1757,'Furniture package','It is a kit for a globe.',2500,3923),(1758,'Furniture package','It is a kit for a table lamp.',2500,3924),(1759,'Furniture package','It is a kit for a rocking chair.',2500,3925),(1760,'Furniture package','It is a kit for a piano.',2500,3926),(1761,'Furniture package','It is a kit for a knight statue.',2500,3927),(1762,'Furniture package','It is a kit for a minotaur statue.',2500,3928),(1763,'Furniture package','It is a kit for a large amphora.',2500,3929),(1764,'Furniture package','It is a kit for a goblin statue.',2500,3930),(1765,'Furniture package','It is a kit for an indoor plant.',2500,3931),(1766,'Furniture package','It is a kit for a barrel.',2500,3932),(1767,'Furniture package','It is a kit for a christmas tree.',2500,3933),(1768,'Furniture package','It is a kit for a rocking horse.',2500,3934),(1769,'Furniture package','It is a kit for a telescope.',2500,3935),(1770,'Furniture package','It is a kit for a bamboo drawer.',2500,3936),(1771,'Furniture package','It is a kit for a trough.',2500,3937),(1772,'Furniture package','It is a kit for a large trunk.',2500,3938),(1773,'Camouflage bag','',800,3939),(1774,'Camouflage backpack','',1800,3940),(1775,'Cup','',200,0),(1776,'Wall candle','',0,3943),(1777,'Lit wall candle','',0,3944),(1778,'Wall candle','',0,3945),(1779,'Lit wall candle','',0,3946),(1780,'Wall lamp','',0,3947),(1781,'Lit wall lamp','',0,3948),(1782,'Wall lamp','',0,3949),(1783,'Lit wall lamp','',0,3950),(1784,'Drum','',4500,3951),(1785,'Didgeridoo','',2600,3952),(1786,'Drum','',3200,3953),(1787,'Bear','',650,3954),(1788,'Voodoo doll','',500,3955),(1789,'Elephant tusk','',1500,3956),(1790,'War horn','',150,3957),(1791,'Garbage','',0,0),(1792,'Old and used backpack','A label on the backpack reads: Property of Sam, Thais.',1800,3960),(1793,'Lich staff','',8000,3961),(1794,'Beastslayer axe','',6150,3962),(1795,'Templar scytheblade','',4500,3963),(1796,'Ripper lance','',8000,3964),(1797,'Hunting spear','',2200,3965),(1798,'Banana staff','',5000,3966),(1799,'Tribal mask','',2500,3967),(1800,'Gladiator armor','',9500,3968),(1801,'Horseman helmet','',4200,3969),(1802,'Feather headdress','',2100,3970),(1803,'Charmer tiara','',2200,3971),(1804,'Beholder helmet','',4600,3972),(1805,'Tusk shield','',6900,3973),(1806,'Sentinel shield','',4900,3974),(1807,'Salamander shield','',7200,3975),(1808,'Worm','',20,3976),(1809,'Crane','',0,0),(1810,'Mailbox','',0,3981),(1811,'Crocodile boots','',900,3982),(1812,'Diamond skirt','',1000,3983),(1813,'Jungle grass','',0,3984),(1814,'Jungle grass','',0,3985),(1815,'Thorn bush','',0,0),(1816,'Orange tree','',0,4006),(1817,'Thread tree','',0,4007),(1818,'Jungle dweller bush','',0,4008),(1819,'Amazonian tree','',0,4009),(1820,'Bush','',0,0),(1821,'Plant','',0,0),(1822,'Dragons nest tree','',0,4016),(1823,'Purple kiss bush','',0,4017),(1824,'Plant','',0,4018),(1825,'Jungle umbrella','',0,0),(1826,'Bamboo plant','',0,0),(1827,'Tree','',0,0),(1828,'Tree stump','',0,0),(1829,'Skinny branch','',0,0),(1830,'Wild vines','',0,0),(1831,'Liana','',0,0),(1832,'Tree','',0,0),(1833,'Chill nettle','',0,4134),(1834,'Monkey tail','',0,4135),(1835,'Fairy queen','',0,4136),(1836,'Crane plant','',0,4137),(1837,'Jungle bells','',0,4138),(1838,'Dawn singer','',0,4139),(1839,'Turtle sprouter','',0,4140),(1840,'Bees ballroom','',0,4141),(1841,'Giant jungle rose','',0,4142),(1842,'Jungle rose','',0,4143),(1843,'Titans orchid','',0,0),(1844,'Purple cardinal','',0,4148),(1845,'Witches cauldron','',0,4149),(1846,'Weeds','',0,0),(1847,'Meadow star','',0,0),(1848,'Tulip','',0,4155),(1849,'Dew kisser flower','',0,4156),(1850,'Dew kisser flowers','',0,0),(1851,'Velvet petal','',0,0),(1852,'Wild plant','',0,4163),(1853,'Pearl flower','',0,0),(1854,'Mushrooms','',0,0),(1855,'Moldy mushroom','',0,0),(1856,'Mushrooms','',0,0),(1857,'Pack of mushrooms','',0,4181),(1858,'Small mushroom','',0,4182),(1859,'Small mushrooms','',0,4183),(1860,'Giant mushroom','',0,4184),(1861,'Large pearl flower','',0,4185),(1862,'Log','',0,0),(1863,'Vine','',0,0),(1864,'Jungle maw','',0,0),(1865,'Log','',0,0),(1866,'Tree stump','',0,0),(1867,'Branch','',0,0),(1868,'Log covered in moss','',0,0),(1869,'Dead lizard','',0,4251),(1870,'Dead elephant','',0,4252),(1871,'Dead crab','',500,4253),(1872,'Dead crab','',400,4254),(1873,'Dead crab','',300,4255),(1874,'Dead lizard','',0,4256),(1875,'Dead lizard','',0,4257),(1876,'Dead lizard','',0,4258),(1877,'Dead lizard','',0,4259),(1878,'Dead lizard','',0,4260),(1879,'Dead lizard','',0,4261),(1880,'Dead lizard','',0,4262),(1881,'Dead lizard','',0,4263),(1882,'Dead lizard','',0,4264),(1883,'Dead chicken','',500,4265),(1884,'Dead chicken','',400,4266),(1885,'Dead chicken','',300,4267),(1886,'Dead ape','',0,4268),(1887,'Dead ape','',0,4269),(1888,'Dead ape','',0,4270),(1889,'Dead ape','',0,4271),(1890,'Dead ape','',0,4272),(1891,'Dead ape','',0,4273),(1892,'Dead ape','',0,4274),(1893,'Dead ape','',0,4275),(1894,'Dead ape','',0,4276),(1895,'Dead crocodile','',0,4277),(1896,'Dead crocodile','',0,4278),(1897,'Dead crocodile','',0,4279),(1898,'Dead carniphila','',0,4280),(1899,'Dead carniphila','',0,4281),(1900,'Dead carniphila','',0,4282),(1901,'Dead hydra','',0,4283),(1902,'Dead hydra','',0,4284),(1903,'Dead hydra','',0,4285),(1904,'Dead panda','',0,4286),(1905,'Dead panda','',0,4287),(1906,'Dead panda','',0,4288),(1907,'Dead centipede','',0,4289),(1908,'Dead centipede','',0,4290),(1909,'Dead centipede','',0,4291),(1910,'Dead tiger','',0,4292),(1911,'Dead tiger','',0,4293),(1912,'Dead tiger','',0,4294),(1913,'Dead elephant','',0,4295),(1914,'Dead elephant','',0,4296),(1915,'Dead elephant','',0,4297),(1916,'Dead bat','',500,4298),(1917,'Dead bat','',400,4299),(1918,'Dead bat','',300,4300),(1919,'Dead flamingo','',0,4301),(1920,'Dead flamingo','',0,4302),(1921,'Dead flamingo','',0,4303),(1922,'Dead dworc','',0,4304),(1923,'Dead dworc','',0,4305),(1924,'Dead dworc','',0,4306),(1925,'Dead dworc','',0,4307),(1926,'Dead dworc','',0,4308),(1927,'Dead dworc','',0,4309),(1928,'Dead dworc','',0,4310),(1929,'Dead dworc','',0,4311),(1930,'Dead dworc','',0,4312),(1931,'Dead butterfly','',10,4313),(1932,'Dead parrot','',2000,4314),(1933,'Dead parrot','',1500,4315),(1934,'Dead parrot','',1000,4316),(1935,'Dead terror bird','',0,4317),(1936,'Dead terror bird','',0,4318),(1937,'Dead terror bird','',0,4319),(1938,'Dead tarantula','',0,4320),(1939,'Dead tarantula','',0,4321),(1940,'Dead tarantula','',0,4322),(1941,'Dead serpent spawn','',0,4323),(1942,'Dead serpent spawn','',0,4324),(1943,'Dead serpent spawn','',0,4325),(1944,'Lifeless nettle','',0,4326),(1945,'Lifeless nettle','',0,4327),(1946,'Red carpet','',0,0),(1947,'Mast','',0,4403),(1948,'Wooden lamp','',0,4404),(1949,'Rocks','',0,0),(1950,'Rocks','',0,0),(1951,'Mountain','',0,0),(1952,'Rocks','',0,0),(1953,'Grass','',0,0),(1954,'Rocks','',0,0),(1955,'Rocks','',0,0),(1956,'Grass','',0,0),(1957,'Rocks','',0,0),(1958,'Shallow water','You see the silvery movement of fish.',0,0),(1959,'Shallow water','',0,4614),(1960,'Shallow water','',0,4615),(1961,'Shallow water','',0,4616),(1962,'Shallow water','',0,4617),(1963,'Shallow water','',0,4618),(1964,'Shallow water','',0,4619),(1965,'Shallow water','',0,0),(1966,'Shallow water','',0,0),(1967,'Shallow water','',0,0),(1968,'Shallow water','',0,0),(1969,'Dirt','',0,0),(1970,'Swamp','',0,0),(1971,'Swamp','',0,0),(1972,'Snow','',0,0),(1973,'Swamp','',0,0),(1974,'Sand','',0,0),(1975,'Grass','',0,0),(1976,'Dirt','',0,0),(1977,'Shallow water','',0,0),(1978,'Mountain','',0,0),(1979,'Shallow water','',0,0),(1980,'Dirt','',0,0),(1981,'Stairs','',0,0),(1982,'Stone herb','',20,4838),(1983,'Bottle','',300,4839),(1984,'Small mushroom','',100,4840),(1985,'Parchment','',100,4842),(1986,'Giant ape\'s hair','',2000,4843),(1987,'Silver brooch','',100,4845),(1988,'Iron hammer','',6600,4846),(1989,'Spectral dress','',1000,4847),(1990,'Icicle','It is melting rapidly.',1900,4848),(1991,'Flour','',500,4849),(1992,'Hydra egg','',500,4850),(1993,'Life crystal','',600,4851),(1994,'Black stone','',200,4852),(1995,'Blank paper','',100,4853),(1996,'Paper','',100,4854),(1997,'Big blue demona book','',1300,4855),(1998,'Ice pick','It might come in handy in cold regions.',7000,4856),(1999,'Parchment','',100,4857),(2000,'Funeral urn','It contains the ashes of a lizard high priest.',10000,4858),(2001,'Small cask','It is filled with the blood of the snake god.',0,4859),(2002,'Wooden trash','',0,4860),(2003,'Cobra statue','',0,4861),(2004,'Metal trash','',0,4862),(2005,'Ectoplasm container','it is empty.',600,4863),(2006,'Ectoplasm container','it is full.',800,4864),(2007,'Butterfly conservation kit','it is empty.',700,4865),(2008,'Butterfly conservation kit','contains a red butterfly.',800,4866),(2009,'Butterfly conservation kit','contains a blue butterfly.',800,4867),(2010,'Butterfly conservation kit','contains a pink butterfly.',800,4868),(2011,'Botanist\'s container','it is empty.',1800,4869),(2012,'Botanist\'s container','',2000,0),(2013,'Brooch','',90,4873),(2014,'Dwarven pickaxe','',6000,11421),(2015,'Hydra eggs','',0,4875),(2016,'Swamp','',0,0),(2017,'Ship','',0,0),(2018,'Ship cabin wall','',0,0),(2019,'Closed door','It is locked.',0,4913),(2020,'Closed door','',0,4914),(2021,'Open door','',0,4915),(2022,'Closed door','It is locked.',0,4916),(2023,'Closed door','',0,4917),(2024,'Open door','',0,4918),(2025,'Ship railing','',0,4919),(2026,'Ship cabin wall','',0,0),(2027,'Ship railing','',0,0),(2028,'Mast','',0,0),(2029,'Sail','',0,0),(2030,'Steering wheel','',0,0),(2031,'Rudder blade','',0,0),(2032,'Ventilation grille','',0,4972),(2033,'Bollard','',0,4973),(2034,'Ship','',0,4974),(2035,'Mast','',0,0),(2036,'Ship','',0,4977),(2037,'Hawser','',0,0),(2038,'Cleat','',0,0),(2039,'White flag','',0,4990),(2040,'Pirate flag','',0,4991),(2041,'Exotic butterfly','',100,0),(2042,'Ice stalagmite','',0,4995),(2043,'Big anphora','',0,4996),(2044,'Stone rubbish','',0,4997),(2045,'Hawser','',0,0),(2046,'Ship cabin wall','',0,0),(2047,'Metal wall','',0,5009),(2048,'Ornamented wall','',0,0),(2049,'Lava wall','',0,0),(2050,'Exotic butterfly','',100,5014),(2051,'Mandrake','This rare root is often used for shamanic medicines.',180,5015),(2052,'Skull','',0,0),(2053,'Skulls','',0,0),(2054,'Burning skull','',0,0),(2055,'Orichalcum pearl','',30,5022),(2056,'Magic forcefield','',0,0),(2057,'Wooden lamp','',0,0),(2058,'Flat roof','',0,5045),(2059,'Monkey statue','The words \'See no evil\' are engraved on it.',0,5046),(2060,'Flat roof','',0,0),(2061,'Monkey statue','The words \'Hear no evil\' are engraved on it.',0,5055),(2062,'Monkey statue','The words \'Speak no evil\' are engraved on it.',0,5056),(2063,'Stone cobra head','',0,0),(2064,'Lava wall','',0,0),(2065,'Electric sparks','',0,0),(2066,'Electric iron bars','',0,0),(2067,'Lava fountain','',0,0),(2068,'Stony pond','',0,0),(2069,'Panda bear','',600,5080),(2070,'Trapdoor','',0,5081),(2071,'Closed door','',0,5082),(2072,'Open door','',0,5083),(2073,'Closed door','',0,5084),(2074,'Open door','',0,5085),(2075,'Furniture package','It is a kit for a monkey statue.',2500,0),(2076,'Butterfly conservation kit','It contains a butterfly.',800,5089),(2077,'Treasure map','',830,5091),(2078,'Palm','',0,0),(2079,'Mango','',180,5097),(2080,'Closed door','It is locked.',0,5098),(2081,'Closed door','',0,5099),(2082,'Open door','',0,5100),(2083,'Closed door','',0,5101),(2084,'Open door','',0,5102),(2085,'Gate of expertise','',0,5103),(2086,'Gate of expertise','',0,5104),(2087,'Closed door','',0,5105),(2088,'Open door','',0,5106),(2089,'Closed door','It is locked.',0,5107),(2090,'Closed door','',0,5108),(2091,'Open door','',0,5109),(2092,'Closed door','',0,5110),(2093,'Open door','',0,5111),(2094,'Gate of expertise','',0,5112),(2095,'Gate of expertise','',0,5113),(2096,'Closed door','',0,5114),(2097,'Open door','',0,5115),(2098,'Closed door','It is locked.',0,5116),(2099,'Closed door','',0,5117),(2100,'Open door','',0,5118),(2101,'Closed door','',0,5119),(2102,'Open door','',0,5120),(2103,'Gate of expertise','',0,5121),(2104,'Gate of expertise','',0,5122),(2105,'Closed door','',0,5123),(2106,'Open door','',0,5124),(2107,'Closed door','It is locked.',0,5125),(2108,'Closed door','',0,5126),(2109,'Open door','',0,5127),(2110,'Closed door','',0,5128),(2111,'Open door','',0,5129),(2112,'Gate of expertise','',0,5130),(2113,'Gate of expertise','',0,5131),(2114,'Closed door','',0,5132),(2115,'Open door','',0,5133),(2116,'Closed door','It is locked.',0,5134),(2117,'Closed door','',0,5135),(2118,'Open door','',0,5136),(2119,'Closed door','It is locked.',0,5137),(2120,'Closed door','',0,5138),(2121,'Open door','',0,5139),(2122,'Closed door','It is locked.',0,5140),(2123,'Closed door','',0,5141),(2124,'Open door','',0,5142),(2125,'Closed door','It is locked.',0,5143),(2126,'Closed door','',0,5144),(2127,'Open door','',0,5145),(2128,'Framework wall','',0,0),(2129,'Mango tree','',0,0),(2130,'Striped marquee','',0,0),(2131,'Marquee','',0,0),(2132,'Wooden railing','',0,0),(2133,'Window','',0,0),(2134,'Stairs','',0,5258),(2135,'Stairs','',0,5259),(2136,'Stairs','',0,5260),(2137,'Wooden wall','',0,0),(2138,'Wooden wall window','',0,0),(2139,'Closed door','It is locked.',0,5278),(2140,'Closed door','',0,5279),(2141,'Open door','',0,5280),(2142,'Closed door','It is locked.',0,5281),(2143,'Closed door','',0,5282),(2144,'Open door','',0,5283),(2145,'Closed door','',0,5284),(2146,'Open door','',0,5285),(2147,'Closed door','',0,5286),(2148,'Open door','',0,5287),(2149,'Closed door','',0,5288),(2150,'Open door','',0,5289),(2151,'Closed door','',0,5290),(2152,'Open door','',0,5291),(2153,'Gate of expertise','',0,5292),(2154,'Gate of expertise','',0,5293),(2155,'Gate of expertise','',0,5294),(2156,'Gate of expertise','',0,5295),(2157,'Wooden plank','',0,0),(2158,'Wooden planks','',0,5302),(2159,'White stone wall window','',0,0),(2160,'White stone railing','',0,0),(2161,'White stone pillar','',0,5308),(2162,'White stone railing','',0,0),(2163,'Wooden railing','',0,0),(2164,'Wooden pillar','',0,0),(2165,'Sign','',0,0),(2166,'Tree','',0,0),(2167,'Dead tree','',0,5392),(2168,'Tree','',0,5393),(2169,'Dead tree','',0,5394),(2170,'Tree','',0,5395),(2171,'Plant','',0,0),(2172,'Window','',0,0),(2173,'Bamboo lamp','',0,0),(2174,'Shallow water','',0,0),(2175,'Rocks','',0,0),(2176,'Coral reef','',0,0),(2177,'Sea star','',0,5417),(2178,'Coral','',0,5418),(2179,'Bubbles','',0,0),(2180,'Algae','',0,5421),(2181,'Coral reef','',0,0),(2182,'Water wheel','',0,0),(2183,'Stearing wheell','',0,5426),(2184,'Shallow water','',0,0),(2185,'Steering wheel','',0,0),(2186,'Damaged mast','',0,0),(2187,'Broken anchor','',0,5444),(2188,'Damaged mast','',0,0),(2189,'Damaged ship cabin','',0,5450),(2190,'Damaged mast','',0,5451),(2191,'Damaged ship cabin','',0,0),(2192,'Damaged ship railing','',0,0),(2193,'Damaged ship','',0,0),(2194,'Damaged ventilation grill','',0,5460),(2195,'Helmet of the deep','',21000,5461),(2196,'Pirate boots','',800,5462),(2197,'Sugar cane','',0,5463),(2198,'Sugar cane','',0,5464),(2199,'Burning sugar cane','',0,5465),(2200,'Sugar cane','',0,5466),(2201,'Bunch of sugar cane','',2250,5467),(2202,'Fire bug','',3050,5468),(2203,'Distillery','',0,0),(2204,'Sugar cane','',0,5471),(2205,'Chain ball','',0,0),(2206,'Torture locker','',0,0),(2207,'Pillory','',0,0),(2208,'Stone wall','',0,0),(2209,'Cat\'s paw','',1000,5480),(2210,'Little scope','',0,0),(2211,'Wall chain cuffs','',0,0),(2212,'Straw mat','',0,0),(2213,'Straw mat','',0,5496),(2214,'Straw mat','',0,5497),(2215,'Straw mat','',0,5498),(2216,'Straw mat','',0,5499),(2217,'Straw mat','',0,5500),(2218,'Straw mat','',0,5501),(2219,'Straw mat','',0,5502),(2220,'Straw mat','',0,5503),(2221,'Wooden pillar','',0,5504),(2222,'Pulley','',0,0),(2223,'Distillery','',0,5513),(2224,'Distillery','',0,5514),(2225,'Closed door','',0,5515),(2226,'Open door','',0,5516),(2227,'Closed door','',0,5517),(2228,'Open door','',0,5518),(2229,'Stone wall','',0,0),(2230,'Wooden railing','',0,5521),(2231,'Dead quara','',0,5522),(2232,'Dead quara','',0,5523),(2233,'Dead quara','',0,5524),(2234,'Dead quara','',0,5525),(2235,'Dead quara','',0,5526),(2236,'Demon dust','',0,5527),(2237,'Demon dust','',0,5528),(2238,'Dead quara','',0,5529),(2239,'Dead quara','',0,5530),(2240,'Dead quara','',0,5531),(2241,'Dead quara','',0,5532),(2242,'Dead quara','',0,5533),(2243,'Dead quara','',0,5534),(2244,'Dead quara','',0,5535),(2245,'Dead quara','',0,5536),(2246,'Dead quara','',0,5537),(2247,'Dead quara','',0,5538),(2248,'Rum cask','',0,5539),(2249,'Dead carrion worm','',0,5540),(2250,'Dead carrion worm','',0,5541),(2251,'Dead carrion worm','',4000,5542),(2252,'Rope-ladder','',0,5543),(2253,'Cart','',0,5544),(2254,'Ladder','',0,5545),(2255,'Cart','',0,0),(2256,'Sugar cane','',0,0),(2257,'Rum flask','',280,5553),(2258,'Gold fish','',0,5554),(2259,'Hay','',0,0),(2260,'Mossy wall','',0,0),(2261,'Small branches','',0,0),(2262,'Slimy wall','',0,0),(2263,'Slain skeleton','',40000,5565),(2264,'Slain pirate ghost','',20000,5566),(2265,'Slain pirate ghost','',20000,5567),(2266,'Slain pirate ghost','',20000,5568),(2267,'Blue carpet','',0,0),(2268,'Green carpet','',0,0),(2269,'Brown carpet','',0,0),(2270,'Swords','',0,0),(2271,'Catapult','',0,0),(2272,'Pirate tapestry','',0,0),(2273,'Pirate tapestry','',1000,5616),(2274,'Pirate emblem','',0,0),(2275,'Rubble','',0,0),(2276,'Dead tortoise','',1500,5625),(2277,'Dead tortoise','',1000,5626),(2278,'Dead tortoise','',1000,5627),(2279,'Dead thornback tortoise','',0,5628),(2280,'Dead thornback tortoise','',0,5629),(2281,'Dead thornback tortoise','',6000,5630),(2282,'Dirt wall','',0,0),(2283,'Stone wall','',0,0),(2284,'Dirt wall','',0,5647),(2285,'Stone wall','',0,5648),(2286,'Dirt wall','',0,0),(2287,'Stone wall','',0,0),(2288,'Map','',0,0),(2289,'Blooming griffinclaw','',0,5659),(2290,'Water source','',0,0),(2291,'Dead mammoth','',0,5666),(2292,'Dead mammoth','',0,5667),(2293,'Dead mammoth','',0,5668),(2294,'Voodoo skull','',1000,5669),(2295,'Voodoo skull','',1000,5670),(2296,'Pirate statue','',0,0),(2297,'Treasure chest','',0,0),(2298,'Tortoise\'s nest','',0,5677),(2299,'Tortoise egg','',30,5678),(2300,'Shells','',0,0),(2301,'Some broken shells','',0,5681),(2302,'Piece of a shell','',0,5682),(2303,'Dirt wall','',0,5683),(2304,'Stone wall','',0,5684),(2305,'Dirt wall','',0,5685),(2306,'Stone wall','',0,5686),(2307,'Dry griffinclaw','',0,5687),(2308,'Dead blood crab','',0,5688),(2309,'Dead blood crab','',0,5689),(2310,'Dead blood crab','',0,5690),(2311,'Trapdoor','',0,5691),(2312,'Ballista','',0,0),(2313,'Shark','',0,0),(2314,'Treasure map','',830,5706),(2315,'Rocks','',0,0),(2316,'Light shovel','',1500,5710),(2317,'Ground','',0,0),(2318,'Dead seagull','',1000,5727),(2319,'Dead seagull','',800,5728),(2320,'Dead seagull','',500,5729),(2321,'Hole','',0,5731),(2322,'Closed bars','They are locked.',0,5732),(2323,'Closed bars','',0,5733),(2324,'Open bars','',0,5734),(2325,'Closed bars','They are locked.',0,5735),(2326,'Closed bars','',0,5736),(2327,'Open bars','',0,5737),(2328,'Shark','',0,5738),(2329,'Fountain','',0,0),(2330,'Skull helmet','',4200,5741),(2331,'Wooden flooring','',0,0),(2332,'Closed door','The door seems to be sealed against unwanted intrueders.',0,5745),(2333,'Open door','The door seems to be sealed against unwanted intrueders.',0,5746),(2334,'Rocks','',0,5747),(2335,'Closed door','The door seems to be sealed against unwanted intrueders.',0,5748),(2336,'Open door','The door seems to be sealed against unwanted intrueders.',0,5749),(2337,'Rocks','',0,0),(2338,'Turtle','',0,0),(2339,'Dead quara','',0,5762),(2340,'Ladder','',0,5763),(2341,'Ventilation grille','',0,5764),(2342,'Dead toad','',0,5765),(2343,'Dead toad','',0,5766),(2344,'Dead toad','',0,5767),(2345,'Drawbridge','',0,0),(2346,'Metal fittings','',0,0),(2347,'Marksman target','',0,0),(2348,'Arrow','',0,0),(2349,'Medal of honour','',100,5785),(2350,'Wooden whistle','',100,5786),(2351,'Target','',0,0),(2352,'Stuck axe','',0,0),(2353,'Stuffed dragon','',850,5791),(2354,'Dice','',200,0),(2355,'Abacus','',2000,5798),(2356,'Golden figurine','',1500,5799),(2357,'Grappling hook','',0,5800),(2358,'Key ring','',50,5801),(2359,'Bottle with a message','',2500,5802),(2360,'Arbalest','It is a bit heavy due to the iron mounting, but very precise.',9500,5803),(2361,'Nose ring','',50,5804),(2362,'Golden goblet','',1500,5805),(2363,'Silver goblet','',1500,5806),(2364,'Bronze goblet','',1500,5807),(2365,'Orshabaal\'s brain','',3500,5808),(2366,'Soul stone','',30,5809),(2367,'Pirate voodoo doll','It looks like a small pirate.',650,5810),(2368,'Mermaid','',0,5811),(2369,'Skull candle','',2200,5812),(2370,'Skull candle','',0,5813),(2371,'Melting ground','',0,0),(2372,'Gravel','',0,0),(2373,'Melting ground','',0,0),(2374,'Weapon rack','',0,0),(2375,'Lance','',0,0),(2376,'Weapon rack','',0,0),(2377,'Scimitar','',0,0),(2378,'Armour rack','',0,0),(2379,'Juice squeezer','',1500,5865),(2380,'Rocks','',0,0),(2381,'Swamp source','',0,0),(2382,'Sniper gloves','They are the pride of the paladin guild.',400,5875),(2383,'Lizard leather','',50,5876),(2384,'Green dragon leather','',60,5877),(2385,'Minotaur leather','',40,5878),(2386,'Spider silk','',10,5879),(2387,'Iron ore','',200,5880),(2388,'Lizard scale','',80,5881),(2389,'Red dragon scale','',90,5882),(2390,'Ape fur','',120,5883),(2391,'Fighting spirit','It contains pure fighting spirit.',600,5884),(2392,'Warrior\'s sweat','It contains the sweat spilled in many battles and is said to be used for certain perfumes too.',300,5885),(2393,'Spool of yarn','It is made from fine giant spider silk.',100,5886),(2394,'Piece of royal steel','Even the king would be proud to wear an armour made of this refined steel.',450,5887),(2395,'Piece of hell steel','This rare metal must have been refined in the depths of Tibia.',600,5888),(2396,'Piece of draconian steel','An armour made of this steel is said to protect against firy dragon breath.',300,5889),(2397,'Chicken feather','Some thousands of these would probably make an extremely comfortable pillow.',10,5890),(2398,'Enchanted chicken wing','It is said to make your feet fly.',1000,5891),(2399,'Huge chunk of crude iron','',5000,5892),(2400,'Perfect behemoth fang','Collector\'s all around the world crave for this item.',500,5893),(2401,'Bat wing','',100,5894),(2402,'Fish fin','It once belonged to a mighty Quara.',120,5895),(2403,'Bear paw','',120,5896),(2404,'Wolf paw','',80,5897),(2405,'Beholder eye','You could swear it just winked at you.',500,5898),(2406,'Turtle shell','',500,5899),(2407,'Dwarven beard','It was once worn proudly by a dwarfish warrior - or maiden.',50,5900),(2408,'Wood','',500,5901),(2409,'Honeycomb','Some people swear that honey makes excellent glue.',80,5902),(2410,'Ferumbras\' hat','It is the proof that Ferumbras has fallen. For now. The Edron Academy should be interested in this.',850,5903),(2411,'Magic sulphur','',100,5904),(2412,'Vampire dust','Sun can be a merciless killer, but so can you.',500,5905),(2413,'Demon dust','It reeks of hatred and malice.',600,5906),(2414,'Slingshot','A hermit near Carlin might be able to tell you more about it.',200,5907),(2415,'Obsidian knife','Sharp and light, this is a useful tool for tanners, doctors and assassins.',100,5908),(2416,'White piece of cloth','',500,5909),(2417,'Green piece of cloth','',500,5910),(2418,'Red piece of cloth','',500,5911),(2419,'Blue piece of cloth','',500,5912),(2420,'Brown piece of cloth','',500,5913),(2421,'Yellow piece of cloth','',500,5914),(2422,'Large throne','',0,0),(2423,'Bandana','',850,5917),(2424,'Pirate knee breeches','',1200,5918),(2425,'Dragon claw','',1250,5919);
/*!40000 ALTER TABLE `s_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellchar`
--

DROP TABLE IF EXISTS `sellchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellchar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `vocation` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `oldid` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellchar`
--

LOCK TABLES `sellchar` WRITE;
/*!40000 ALTER TABLE `sellchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_config`
--

DROP TABLE IF EXISTS `server_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_config`
--

LOCK TABLES `server_config` WRITE;
/*!40000 ALTER TABLE `server_config` DISABLE KEYS */;
INSERT INTO `server_config` VALUES ('db_version','30'),('double','active'),('motd_hash','8b5e2fedfd3231aa0dac9230c5514131dfce1a7e'),('motd_num','10'),('players_record','8');
/*!40000 ALTER TABLE `server_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snowballwar`
--

DROP TABLE IF EXISTS `snowballwar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snowballwar`
--

LOCK TABLES `snowballwar` WRITE;
/*!40000 ALTER TABLE `snowballwar` DISABLE KEYS */;
/*!40000 ALTER TABLE `snowballwar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_history`
--

DROP TABLE IF EXISTS `store_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_history` (
  `account_id` int(11) NOT NULL,
  `mode` smallint(2) NOT NULL,
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT '0',
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_history`
--

LOCK TABLES `store_history` WRITE;
/*!40000 ALTER TABLE `store_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_subject` varchar(45) NOT NULL DEFAULT '',
  `ticket_author` varchar(255) NOT NULL DEFAULT '',
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(45) NOT NULL DEFAULT '',
  `ticket_admin_reply` int(11) NOT NULL,
  `ticket_date` datetime NOT NULL,
  `ticket_ended` varchar(45) NOT NULL DEFAULT '',
  `ticket_status` varchar(45) NOT NULL DEFAULT '',
  `ticket_category` varchar(45) NOT NULL DEFAULT '',
  `ticket_description` text NOT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  KEY `tickets_ibfk_1_idx` (`ticket_author_acc_id`) USING BTREE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_reply`
--

DROP TABLE IF EXISTS `tickets_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_reply` (
  `ticket_replyid` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `reply_author` varchar(255) DEFAULT NULL,
  `reply_message` text,
  `reply_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_replyid`) USING BTREE,
  KEY `ticket_id_idx` (`ticket_id`) USING BTREE,
  CONSTRAINT `ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_reply`
--

LOCK TABLES `tickets_reply` WRITE;
/*!40000 ALTER TABLE `tickets_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tile_store`
--

DROP TABLE IF EXISTS `tile_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tile_store`
--

LOCK TABLES `tile_store` WRITE;
/*!40000 ALTER TABLE `tile_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tile_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` int(11) NOT NULL,
  `link` varchar(11) NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_categorias`
--

DROP TABLE IF EXISTS `videos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos_categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_categorias`
--

LOCK TABLES `videos_categorias` WRITE;
/*!40000 ALTER TABLE `videos_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_comentarios`
--

DROP TABLE IF EXISTS `videos_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `character` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `topico` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_comentarios`
--

LOCK TABLES `videos_comentarios` WRITE;
/*!40000 ALTER TABLE `videos_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_changelogs`
--

DROP TABLE IF EXISTS `z_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_changelogs` (
  `id_changelog` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_changelog`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_changelogs`
--

LOCK TABLES `z_changelogs` WRITE;
/*!40000 ALTER TABLE `z_changelogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_changelogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_forum`
--

DROP TABLE IF EXISTS `z_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(11) NOT NULL,
  `news_icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_forum`
--

LOCK TABLES `z_forum` WRITE;
/*!40000 ALTER TABLE `z_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_helpdesk`
--

DROP TABLE IF EXISTS `z_helpdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_helpdesk` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_id` varchar(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_helpdesk`
--

LOCK TABLES `z_helpdesk` WRITE;
/*!40000 ALTER TABLE `z_helpdesk` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_helpdesk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_network_box`
--

DROP TABLE IF EXISTS `z_network_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_network_box`
--

LOCK TABLES `z_network_box` WRITE;
/*!40000 ALTER TABLE `z_network_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_network_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_news_tickers`
--

DROP TABLE IF EXISTS `z_news_tickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_news_tickers`
--

LOCK TABLES `z_news_tickers` WRITE;
/*!40000 ALTER TABLE `z_news_tickers` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_news_tickers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_comunication`
--

DROP TABLE IF EXISTS `z_ots_comunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_comunication`
--

LOCK TABLES `z_ots_comunication` WRITE;
/*!40000 ALTER TABLE `z_ots_comunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_comunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_guildcomunication`
--

DROP TABLE IF EXISTS `z_ots_guildcomunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_guildcomunication`
--

LOCK TABLES `z_ots_guildcomunication` WRITE;
/*!40000 ALTER TABLE `z_ots_guildcomunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_guildcomunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls`
--

DROP TABLE IF EXISTS `z_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls`
--

LOCK TABLES `z_polls` WRITE;
/*!40000 ALTER TABLE `z_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls_answers`
--

DROP TABLE IF EXISTS `z_polls_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls_answers`
--

LOCK TABLES `z_polls_answers` WRITE;
/*!40000 ALTER TABLE `z_polls_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_category`
--

DROP TABLE IF EXISTS `z_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `button` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_category`
--

LOCK TABLES `z_shop_category` WRITE;
/*!40000 ALTER TABLE `z_shop_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_donate_confirm`
--

DROP TABLE IF EXISTS `z_shop_donate_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_donate_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `donate_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_donate_confirm`
--

LOCK TABLES `z_shop_donate_confirm` WRITE;
/*!40000 ALTER TABLE `z_shop_donate_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_donate_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_donates`
--

DROP TABLE IF EXISTS `z_shop_donates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_donates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `points` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_donates`
--

LOCK TABLES `z_shop_donates` WRITE;
/*!40000 ALTER TABLE `z_shop_donates` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_donates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_history_item`
--

DROP TABLE IF EXISTS `z_shop_history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_history_item`
--

LOCK TABLES `z_shop_history_item` WRITE;
/*!40000 ALTER TABLE `z_shop_history_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_offer`
--

DROP TABLE IF EXISTS `z_shop_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `price` varchar(50) NOT NULL DEFAULT '',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `mount_id` varchar(100) NOT NULL DEFAULT '',
  `addon_name` varchar(100) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL DEFAULT '',
  `offer_date` int(11) NOT NULL,
  `default_image` varchar(50) NOT NULL DEFAULT '',
  `hide` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_offer`
--

LOCK TABLES `z_shop_offer` WRITE;
/*!40000 ALTER TABLE `z_shop_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_payment`
--

DROP TABLE IF EXISTS `z_shop_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `points` int(11) unsigned NOT NULL,
  `coins` int(11) unsigned NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waiting',
  `date` int(11) NOT NULL,
  `gift` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_payment`
--

LOCK TABLES `z_shop_payment` WRITE;
/*!40000 ALTER TABLE `z_shop_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shopguild_history_item`
--

DROP TABLE IF EXISTS `z_shopguild_history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shopguild_history_item`
--

LOCK TABLES `z_shopguild_history_item` WRITE;
/*!40000 ALTER TABLE `z_shopguild_history_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shopguild_history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shopguild_history_pacc`
--

DROP TABLE IF EXISTS `z_shopguild_history_pacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shopguild_history_pacc`
--

LOCK TABLES `z_shopguild_history_pacc` WRITE;
/*!40000 ALTER TABLE `z_shopguild_history_pacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shopguild_history_pacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shopguild_offer`
--

DROP TABLE IF EXISTS `z_shopguild_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shopguild_offer`
--

LOCK TABLES `z_shopguild_offer` WRITE;
/*!40000 ALTER TABLE `z_shopguild_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shopguild_offer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-03 23:19:56

-- New commands by Movie
CREATE TABLE IF NOT EXISTS `castle` (
  `name` varchar(255) NOT NULL, 
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `castle` (`name`, `guild_id`) VALUES ('Guild', '-1');

INSERT INTO `z_shop_category` (`id`, `name`, `desc`, `button`, `hide`) VALUES
(2, 'Extra Services', 'Buy an extra service to transfer a character to another game world, to change your character name or sex, to change your account name, or to get a new recovery key.', '_sbutton_getextraservice.gif', 0),
(3, 'Outfits', 'Buy your characters one or more of the fancy outfits offered here.', '_sbutton_getoutfit.gif', 1),
(4, 'Items', 'Buy items for your character be more stronger in the game.', '_sbutton_getextraservice.gif', 1);

INSERT INTO `z_shop_offer` (`id`, `category`, `coins`, `price`, `itemid`, `mount_id`, `addon_name`, `count`, `offer_type`, `offer_description`, `offer_name`, `offer_date`, `default_image`, `hide`) VALUES
(5, 2, 250, '', 0, '', '', 1, 'changename', 'Buy a character name change to rename one of your characters.', 'Character Change Name', 1416865577, 'changename.png', 0),
(6, 2, 10, '', 0, '', '', 1, 'changesex', 'Buy a character sex change to turn your male character into a female one, or your female character into a male one.', 'Character Change Sex', 1416874417, 'changesex.png', 1),
(7, 2, 250, '', 0, '', '', 1, 'changeaccountname', 'Buy an account name change to select a different name for your account.', 'Account Name Change', 1416874601, 'changeaccountname.png', 0),
(8, 2, 300, '', 0, '', '', 1, 'newrk', 'If you need a new recovery key, you can order it here. Note that the letter for the new recovery key can only be sent to the address in the account registration.', 'Recovery Key', 1416874816, 'newrk.png', 0);

DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
//
DELIMITER;