-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: online_edu
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can view group',3,'view_group'),(12,'Can view permission',2,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户信息',6,'add_userprofile'),(22,'Can change 用户信息',6,'change_userprofile'),(23,'Can delete 用户信息',6,'delete_userprofile'),(24,'Can add 邮箱验证码',7,'add_emailverifyrecord'),(25,'Can change 邮箱验证码',7,'change_emailverifyrecord'),(26,'Can delete 邮箱验证码',7,'delete_emailverifyrecord'),(27,'Can add 轮播图',8,'add_banner'),(28,'Can change 轮播图',8,'change_banner'),(29,'Can delete 轮播图',8,'delete_banner'),(30,'Can view 轮播图',8,'view_banner'),(31,'Can view 邮箱验证码',7,'view_emailverifyrecord'),(32,'Can view 用户信息',6,'view_userprofile'),(33,'Can add 课程',9,'add_course'),(34,'Can change 课程',9,'change_course'),(35,'Can delete 课程',9,'delete_course'),(36,'Can add 章节',10,'add_lesson'),(37,'Can change 章节',10,'change_lesson'),(38,'Can delete 章节',10,'delete_lesson'),(39,'Can add 视频',11,'add_video'),(40,'Can change 视频',11,'change_video'),(41,'Can delete 视频',11,'delete_video'),(42,'Can add 课程资源',12,'add_courseresource'),(43,'Can change 课程资源',12,'change_courseresource'),(44,'Can delete 课程资源',12,'delete_courseresource'),(45,'Can view 课程',9,'view_course'),(46,'Can view 课程资源',12,'view_courseresource'),(47,'Can view 章节',10,'view_lesson'),(48,'Can view 视频',11,'view_video'),(49,'Can add 用户咨询',13,'add_userask'),(50,'Can change 用户咨询',13,'change_userask'),(51,'Can delete 用户咨询',13,'delete_userask'),(52,'Can add 课程评论',14,'add_coursecomments'),(53,'Can change 课程评论',14,'change_coursecomments'),(54,'Can delete 课程评论',14,'delete_coursecomments'),(55,'Can add 用户收藏',15,'add_userfavorite'),(56,'Can change 用户收藏',15,'change_userfavorite'),(57,'Can delete 用户收藏',15,'delete_userfavorite'),(58,'Can add 用户消息',16,'add_usermessage'),(59,'Can change 用户消息',16,'change_usermessage'),(60,'Can delete 用户消息',16,'delete_usermessage'),(61,'Can add 用户课程',17,'add_usercourse'),(62,'Can change 用户课程',17,'change_usercourse'),(63,'Can delete 用户课程',17,'delete_usercourse'),(64,'Can view 课程评论',14,'view_coursecomments'),(65,'Can view 用户咨询',13,'view_userask'),(66,'Can view 用户课程',17,'view_usercourse'),(67,'Can view 用户收藏',15,'view_userfavorite'),(68,'Can view 用户消息',16,'view_usermessage'),(69,'Can add 城市',18,'add_citydict'),(70,'Can change 城市',18,'change_citydict'),(71,'Can delete 城市',18,'delete_citydict'),(72,'Can add 课程机构',19,'add_courseorg'),(73,'Can change 课程机构',19,'change_courseorg'),(74,'Can delete 课程机构',19,'delete_courseorg'),(75,'Can add 教师',20,'add_teacher'),(76,'Can change 教师',20,'change_teacher'),(77,'Can delete 教师',20,'delete_teacher'),(78,'Can view 城市',18,'view_citydict'),(79,'Can view 课程机构',19,'view_courseorg'),(80,'Can view 教师',20,'view_teacher'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8_bin NOT NULL,
  `response` varchar(32) COLLATE utf8_bin NOT NULL,
  `hashkey` varchar(40) COLLATE utf8_bin NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `desc` varchar(300) COLLATE utf8_bin NOT NULL,
  `detail` longtext COLLATE utf8_bin NOT NULL,
  `degree` varchar(20) COLLATE utf8_bin NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `tag` varchar(10) COLLATE utf8_bin NOT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` (`course_org_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'python入门','python入门','python入门','cj',60,100,20,'courses/2018/01/下载_zHJZKzn.png',1,'2018-01-19 01:45:00.000000','python','python developing',1),(2,'python入门','python入门','python入门','cj',60,100,20,'courses/2018/01/下载_nbhsQg3.png',0,'2018-01-19 01:50:00.000000','python','python developing',2),(3,'python入门','python入门','python入门','cj',60,100,0,'courses/2018/01/下载_TLZvyhs.png',0,'2018-01-19 01:50:00.000000','python','python developing',3),(4,'django入门','django入门','django入门','cj',60,100,0,'courses/2018/01/下载_1.png',0,'2018-01-19 01:50:00.000000','django','django developing',4),(5,'PHP入门','PHP入门','PHP入门','cj',60,100,0,'courses/2018/01/php2.png',0,'2018-01-19 01:50:00.000000','PHP','PHP developing',5),(6,'JavaScript入门','JavaScript入门','JavaScript入门','cj',60,100,0,'courses/2018/01/下载_4.png',0,'2018-01-19 01:51:00.000000','JavaScript','JavaScript developing',6),(7,'python入门','python入门','python入门','cj',60,100,0,'courses/2018/01/下载_6LAYpWE.png',1,'2018-01-19 01:51:00.000000','python','python developing',7),(8,'django入门','django入门','django入门','cj',60,100,0,'courses/2018/01/django_es_facil.jpeg',0,'2018-01-19 01:51:00.000000','django','django developing',8),(9,'jQuery入门','jQuery入门','jQuery入门','cj',60,100,0,'courses/2018/01/下载_3.png',0,'2018-01-19 01:51:00.000000','jQuery','jQuery developing',9),(10,'PHP入门','PHP入门','PHP入门','cj',60,100,0,'courses/2018/01/php.png',0,'2018-01-19 01:51:00.000000','PHP','PHP developing',10),(11,'Django 入门','Django 入门','Django 入门','zj',30,20,0,'courses/2018/01/django.jpeg',0,'2018-01-19 01:54:00.000000','django','Django developing',11),(12,'Django 入门','Django 入门','Django 入门','zj',30,20,0,'courses/2018/01/django_NHWvTh2.jpeg',2,'2018-01-19 01:55:00.000000','django','Django developing',12);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `download` varchar(100) COLLATE utf8_bin NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(9,'courses','course'),(12,'courses','courseresource'),(10,'courses','lesson'),(11,'courses','video'),(14,'operation','coursecomments'),(13,'operation','userask'),(17,'operation','usercourse'),(15,'operation','userfavorite'),(16,'operation','usermessage'),(18,'organization','citydict'),(19,'organization','courseorg'),(20,'organization','teacher'),(5,'sessions','session'),(8,'users','banner'),(7,'users','emailverifyrecord'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
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
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-18 15:03:04.067108'),(2,'contenttypes','0002_remove_content_type_name','2018-01-18 15:03:04.116167'),(3,'auth','0001_initial','2018-01-18 15:03:04.244910'),(4,'auth','0002_alter_permission_name_max_length','2018-01-18 15:03:04.278224'),(5,'auth','0003_alter_user_email_max_length','2018-01-18 15:03:04.291113'),(6,'auth','0004_alter_user_username_opts','2018-01-18 15:03:04.307124'),(7,'auth','0005_alter_user_last_login_null','2018-01-18 15:03:04.321733'),(8,'auth','0006_require_contenttypes_0002','2018-01-18 15:03:04.324209'),(9,'auth','0007_alter_validators_add_error_messages','2018-01-18 15:03:04.339171'),(10,'users','0001_initial','2018-01-18 15:03:04.485873'),(11,'admin','0001_initial','2018-01-18 15:03:04.536892'),(12,'admin','0002_logentry_remove_auto_add','2018-01-18 15:03:04.570707'),(13,'captcha','0001_initial','2018-01-18 15:03:04.592682'),(14,'organization','0001_initial','2018-01-18 15:03:04.674774'),(15,'courses','0001_initial','2018-01-18 15:03:04.820831'),(16,'operation','0001_initial','2018-01-18 15:03:04.916328'),(17,'operation','0002_auto_20180118_1502','2018-01-18 15:03:05.234078'),(18,'sessions','0001_initial','2018-01-18 15:03:05.263570'),(19,'xadmin','0001_initial','2018-01-18 15:03:05.450324'),(20,'xadmin','0002_log','2018-01-18 15:03:05.527902'),(21,'xadmin','0003_auto_20160715_0100','2018-01-18 15:03:05.592045');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jap13ob29f0ne3kxxy1tjv8hvkwchols','NWRkYTY1YmU4ZDlhZWQ0MWRjYjcxY2RmMjk0OTVmNWYxMzg3YmI3MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sib3BlcmF0aW9uIiwidXNlcmNvdXJzZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiY2Q1M2Y5NDM4NmZjNmJjYjQzMjMyYTRmYjgxM2Y5ZTE2Nzc3Y2ExMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==','2018-02-02 01:57:42.880000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(20) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_ea134da7` (`course_id`),
  KEY `operation_coursecomments_e8701ad4` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(11) COLLATE utf8_bin NOT NULL,
  `course_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_ea134da7` (`course_id`),
  KEY `operation_usercourse_e8701ad4` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2018-01-19 01:56:00.000000',11,2),(2,'2018-01-19 01:56:00.000000',1,2),(3,'2018-01-19 01:57:00.000000',5,1),(4,'2018-01-19 01:57:00.000000',9,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_e8701ad4` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `desc` varchar(200) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京市','2018-01-19 01:33:00.000000'),(2,'天津市','天津市','2018-01-19 01:33:00.000000'),(3,'上海市','上海市','2018-01-19 01:33:00.000000'),(4,'深圳市','深圳市','2018-01-19 01:34:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `desc` longtext COLLATE utf8_bin NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  `address` varchar(150) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `students` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'小学僧在线','小学僧在线',10,10,'org/2018/01/小学僧在线网.png','北京市','2018-01-19 01:34:00.000000','public',1,1,1),(2,'小学僧在线2班','小学僧在线2班',10,10,'org/2018/01/小学僧在线网_HdNpiSE.png','北京市','2018-01-19 01:35:00.000000','public',1,1,1),(3,'小学僧在线3班','小学僧在线3班',10,10,'org/2018/01/小学僧在线网_PRPXo67.png','北京市','2018-01-19 01:35:00.000000','public',1,1,1),(4,'学前班在线网','学前班在线网',10,10,'org/2018/01/学前班在线网_cSl8gwI.png','上海市','2018-01-19 01:35:00.000000','public',1,1,3),(5,'学前班在线网2班','学前班在线网2班',10,10,'org/2018/01/学前班在线网_GpvxVir.png','上海市','2018-01-19 01:36:00.000000','public',1,1,3),(6,'学前班在线网3班','学前班在线网3班',10,10,'org/2018/01/学前班在线网_JpJ1kDw.png','上海市','2018-01-19 01:36:00.000000','public',1,1,3),(7,'托儿所在线网','托儿所在线网',10,10,'org/2018/01/托儿所在线网_tXh1GV3.png','天津市','2018-01-19 01:36:00.000000','public',1,1,2),(8,'托儿所在线网2班','托儿所在线网2班',10,10,'org/2018/01/托儿所在线网.png','天津市','2018-01-19 01:37:00.000000','public',1,1,2),(9,'托儿所在线网3班','托儿所在线网3班',10,10,'org/2018/01/托儿所在线网_YLAqSMP.png','天津市','2018-01-19 01:37:00.000000','public',1,1,2),(10,'幼儿园在线','幼儿园在线',10,10,'org/2018/01/幼儿园在线网_xgKNe48.png','深圳市','2018-01-19 01:38:00.000000','public',10,0,4),(11,'幼儿园在线2班','幼儿园在线2班',10,10,'org/2018/01/幼儿园在线网_muMtICz.png','深圳市','2018-01-19 01:38:00.000000','public',10,0,4),(12,'幼儿园在线3班','幼儿园在线3班',10,10,'org/2018/01/幼儿园在线网_W3mGnbk.png','深圳市','2018-01-19 01:39:00.000000','public',10,0,4);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) COLLATE utf8_bin NOT NULL,
  `position` varchar(50) COLLATE utf8_bin NOT NULL,
  `points` varchar(50) COLLATE utf8_bin NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'apolo',10,'小学僧在线','教师','活泼热情',100,10,'org/teacher/2018/01/站长阿波罗_k9NgcaS.jpeg','2018-01-19 01:39:00.000000',1),(2,'小金',10,'小学僧在线2班','教师','活泼热情',100,10,'org/teacher/2018/01/小金_mw8eAl9.png','2018-01-19 01:39:00.000000',2),(3,'小金',10,'小学僧在线3班','教师','活泼热情',100,10,'org/teacher/2018/01/小金_Bk1pqoL.png','2018-01-19 01:40:00.000000',3),(4,'小萨',10,'学前班在线','教师','活泼热情',100,10,'org/teacher/2018/01/小萨摩_PTWxpMr.jpg','2018-01-19 01:40:00.000000',4),(5,'小萨',10,'学前班在线2班','教师','活泼热情',100,10,'org/teacher/2018/01/小萨摩_PYJaRwx.jpg','2018-01-19 01:41:00.000000',5),(6,'小萨',10,'学前班在线3班','教师','活泼热情',100,10,'org/teacher/2018/01/小萨摩_q7zrWCb.jpg','2018-01-19 01:41:00.000000',6),(7,'小哈',10,'托儿所在线网','教师','活泼热情',100,10,'org/teacher/2018/01/小哈.png','2018-01-19 01:41:00.000000',7),(8,'小哈',10,'托儿所在线网2班','教师','活泼热情',100,10,'org/teacher/2018/01/小哈_wCn8gH9.png','2018-01-19 01:41:00.000000',8),(9,'小哈',10,'托儿所在线网3班','教师','活泼热情',100,10,'org/teacher/2018/01/小哈_PykI9IS.png','2018-01-19 01:41:00.000000',9),(10,'小哈',10,'幼儿园在线网','教师','活泼热情',100,10,'org/teacher/2018/01/小金_PX4p3Nr.png','2018-01-19 01:41:00.000000',10),(11,'小哈',10,'幼儿园在线网2班','教师','活泼热情',100,10,'org/teacher/2018/01/小金_KjBXRZS.png','2018-01-19 01:42:00.000000',11),(12,'小哈',10,'幼儿园在线网3班','教师','活泼热情',100,10,'org/teacher/2018/01/小金_UNcVd8S.png','2018-01-19 01:42:00.000000',12);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  `url` varchar(200) COLLATE utf8_bin NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `send_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$24000$kw1Dc3qk0pfO$0s2zcltO5yaGIHVfBK5sTAlxZowrMAKGYrTqIE+mEcg=','2018-01-19 01:32:00.000000',1,'apolo','阿波罗','杜','dudueasy@126.com',1,1,'2018-01-19 01:31:00.000000','apolodu',NULL,'male','china','','image/2018/01/站长阿波罗_JdoB1Z1.jpeg'),(2,'pbkdf2_sha256$24000$Zj3xrIMeETtK$EGX2F+wWqLJDyaPYzlPi/Fhr5CUEW8KKZkHZ+AP9HAI=',NULL,0,'apolo1','','','',0,1,'2018-01-19 01:32:00.000000','dudu',NULL,'male','china','','image/2018/01/高达2_amsjfTa.jpeg'),(3,'pbkdf2_sha256$24000$ivVLDMcP3h4a$eaTETsf6sD8qR+Myf/ks6eg0d0d3/jUQs4XX29PvS4M=',NULL,0,'apolo2','','','',0,1,'2018-01-19 01:33:00.000000','du',NULL,'male','china','','image/2018/01/高达_6QmD6w7.jpeg');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `url_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `query` varchar(1000) COLLATE utf8_bin NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) COLLATE utf8_bin DEFAULT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` varchar(32) COLLATE utf8_bin NOT NULL,
  `message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-01-19 01:32:51.230000','127.0.0.1','2','apolo1','create','已添加。',6,1),(2,'2018-01-19 01:33:13.338000','127.0.0.1','3','apolo2','create','已添加。',6,1),(3,'2018-01-19 01:33:42.296000','127.0.0.1','1','北京市','create','已添加。',18,1),(4,'2018-01-19 01:33:54.646000','127.0.0.1','2','天津市','create','已添加。',18,1),(5,'2018-01-19 01:34:02.117000','127.0.0.1','3','上海市','create','已添加。',18,1),(6,'2018-01-19 01:34:16.106000','127.0.0.1','4','深圳市','create','已添加。',18,1),(7,'2018-01-19 01:35:15.146000','127.0.0.1','1','小学僧在线','create','已添加。',19,1),(8,'2018-01-19 01:35:34.670000','127.0.0.1','2','小学僧在线2班','create','已添加。',19,1),(9,'2018-01-19 01:35:43.956000','127.0.0.1','3','小学僧在线3班','create','已添加。',19,1),(10,'2018-01-19 01:36:22.448000','127.0.0.1','4','学前班在线网','create','已添加。',19,1),(11,'2018-01-19 01:36:35.233000','127.0.0.1','5','学前班在线网2班','create','已添加。',19,1),(12,'2018-01-19 01:36:46.947000','127.0.0.1','6','学前班在线网3班','create','已添加。',19,1),(13,'2018-01-19 01:37:10.253000','127.0.0.1','7','托儿所在线网','create','已添加。',19,1),(14,'2018-01-19 01:37:42.060000','127.0.0.1','8','托儿所在线网2班','create','已添加。',19,1),(15,'2018-01-19 01:37:55.386000','127.0.0.1','9','托儿所在线网3班','create','已添加。',19,1),(16,'2018-01-19 01:38:11.091000','127.0.0.1','7','托儿所在线网','change','已修改 image 。',19,1),(17,'2018-01-19 01:38:45.577000','127.0.0.1','10','幼儿园在线','create','已添加。',19,1),(18,'2018-01-19 01:39:01.286000','127.0.0.1','11','幼儿园在线2班','create','已添加。',19,1),(19,'2018-01-19 01:39:09.401000','127.0.0.1','12','幼儿园在线3班','create','已添加。',19,1),(20,'2018-01-19 01:39:49.821000','127.0.0.1','1','apolo','create','已添加。',20,1),(21,'2018-01-19 01:40:21.914000','127.0.0.1','2','小金','create','已添加。',20,1),(22,'2018-01-19 01:40:34.800000','127.0.0.1','3','小金','create','已添加。',20,1),(23,'2018-01-19 01:41:05.254000','127.0.0.1','4','小萨','create','已添加。',20,1),(24,'2018-01-19 01:41:10.433000','127.0.0.1','5','小萨','create','已添加。',20,1),(25,'2018-01-19 01:41:21.202000','127.0.0.1','6','小萨','create','已添加。',20,1),(26,'2018-01-19 01:41:44.502000','127.0.0.1','7','小哈','create','已添加。',20,1),(27,'2018-01-19 01:41:50.841000','127.0.0.1','8','小哈','create','已添加。',20,1),(28,'2018-01-19 01:41:55.783000','127.0.0.1','9','小哈','create','已添加。',20,1),(29,'2018-01-19 01:42:17.812000','127.0.0.1','10','小哈','create','已添加。',20,1),(30,'2018-01-19 01:42:28.046000','127.0.0.1','11','小哈','create','已添加。',20,1),(31,'2018-01-19 01:42:34.758000','127.0.0.1','12','小哈','create','已添加。',20,1),(32,'2018-01-19 01:42:55.867000','127.0.0.1','8','小哈','change','已修改 work_company 。',20,1),(33,'2018-01-19 01:43:03.118000','127.0.0.1','9','小哈','change','已修改 work_company 。',20,1),(34,'2018-01-19 01:43:09.791000','127.0.0.1','5','小萨','change','已修改 work_company 。',20,1),(35,'2018-01-19 01:44:04.508000','127.0.0.1','1','apolo','change','已修改 last_login，first_name，last_name，nick_name，gender，address 和 image 。',6,1),(36,'2018-01-19 01:44:28.364000','127.0.0.1','2','apolo1','change','已修改 nick_name，gender，address 和 image 。',6,1),(37,'2018-01-19 01:44:55.396000','127.0.0.1','3','apolo2','change','已修改 nick_name，gender，address 和 image 。',6,1),(38,'2018-01-19 01:45:11.105000','127.0.0.1','1','apolo','change','已修改 image 。',6,1),(39,'2018-01-19 01:50:22.741000','127.0.0.1','1','python入门','create','已添加。',9,1),(40,'2018-01-19 01:50:31.036000','127.0.0.1','2','python入门','create','已添加。',9,1),(41,'2018-01-19 01:50:37.891000','127.0.0.1','3','python入门','create','已添加。',9,1),(42,'2018-01-19 01:50:53.298000','127.0.0.1','4','python入门','create','已添加。',9,1),(43,'2018-01-19 01:51:03.176000','127.0.0.1','5','python入门','create','已添加。',9,1),(44,'2018-01-19 01:51:12.595000','127.0.0.1','6','python入门','create','已添加。',9,1),(45,'2018-01-19 01:51:22.353000','127.0.0.1','7','python入门','create','已添加。',9,1),(46,'2018-01-19 01:51:35.420000','127.0.0.1','8','python入门','create','已添加。',9,1),(47,'2018-01-19 01:51:45.941000','127.0.0.1','9','python入门','create','已添加。',9,1),(48,'2018-01-19 01:52:17.538000','127.0.0.1','10','PHP入门','create','已添加。',9,1),(49,'2018-01-19 01:52:47.253000','127.0.0.1','4','django入门','change','已修改 name，desc，detail，tag 和 category 。',9,1),(50,'2018-01-19 01:53:18.824000','127.0.0.1','5','PHP入门','change','已修改 name，desc，detail，tag 和 category 。',9,1),(51,'2018-01-19 01:53:38.445000','127.0.0.1','6','JavaScript入门','change','已修改 name，desc，detail，tag 和 category 。',9,1),(52,'2018-01-19 01:54:03.100000','127.0.0.1','8','django入门','change','已修改 name，desc，detail，tag 和 category 。',9,1),(53,'2018-01-19 01:54:17.692000','127.0.0.1','9','jQuery入门','change','已修改 name，desc，detail，tag 和 category 。',9,1),(54,'2018-01-19 01:55:11.076000','127.0.0.1','11','Django 入门','create','已添加。',9,1),(55,'2018-01-19 01:55:31.232000','127.0.0.1','12','Django 入门','create','已添加。',9,1),(56,'2018-01-19 01:56:28.462000','127.0.0.1','1','apolo1 : Django 入门','create','已添加。',17,1),(57,'2018-01-19 01:56:39.388000','127.0.0.1','2','apolo1 : python入门','create','已添加。',17,1),(58,'2018-01-19 01:57:30.426000','127.0.0.1','3','apolo : PHP入门','create','已添加。',17,1),(59,'2018-01-19 01:57:36.063000','127.0.0.1','4','apolo : jQuery入门','create','已添加。',17,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-19  6:20:23
