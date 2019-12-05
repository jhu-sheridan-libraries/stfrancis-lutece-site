-- MySQL dump 10.13  Distrib 5.6.46, for Linux (x86_64)
--
-- Host: localhost    Database: lutece
-- ------------------------------------------------------
-- Server version	5.6.46

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
-- Table structure for table `appointment_appointment`
--

DROP TABLE IF EXISTS `appointment_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_appointment` (
  `id_appointment` int(11) NOT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `nb_places` int(11) NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `id_action_cancelled` int(11) DEFAULT NULL,
  `notification` int(11) NOT NULL DEFAULT '0',
  `id_admin_user` int(11) DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `id_slot` int(11) NOT NULL,
  PRIMARY KEY (`id_appointment`,`id_user`,`id_slot`),
  KEY `fk_appointment_appointment_appointment_user_idx` (`id_user`),
  KEY `fk_appointment_appointment_appointment_slot_idx` (`id_slot`),
  KEY `reference_idx` (`reference`),
  CONSTRAINT `fk_appointment_appointment_appointment_slot` FOREIGN KEY (`id_slot`) REFERENCES `appointment_slot` (`id_slot`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_appointment_appointment_user` FOREIGN KEY (`id_user`) REFERENCES `appointment_user` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment`
--

LOCK TABLES `appointment_appointment` WRITE;
/*!40000 ALTER TABLE `appointment_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_appointment_response`
--

DROP TABLE IF EXISTS `appointment_appointment_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_appointment_response` (
  `id_appointment_response` int(11) NOT NULL,
  `id_response` int(11) NOT NULL,
  `id_appointment` int(11) NOT NULL,
  PRIMARY KEY (`id_appointment_response`,`id_response`,`id_appointment`),
  UNIQUE KEY `unique_index` (`id_appointment`,`id_response`),
  KEY `fk_appointment_appointment_response_appointment_appointment_idx` (`id_appointment`),
  CONSTRAINT `fk_appointment_appointment_response_appointment_appointment` FOREIGN KEY (`id_appointment`) REFERENCES `appointment_appointment` (`id_appointment`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment_response`
--

LOCK TABLES `appointment_appointment_response` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_calendar_template`
--

DROP TABLE IF EXISTS `appointment_calendar_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_calendar_template` (
  `id_calendar_template` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_calendar_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_calendar_template`
--

LOCK TABLES `appointment_calendar_template` WRITE;
/*!40000 ALTER TABLE `appointment_calendar_template` DISABLE KEYS */;
INSERT INTO `appointment_calendar_template` VALUES (1,'Calendrier','Calendrier des crÃ©neaux disponibles et indisponibles','skin/plugins/appointment/calendar/appointment_form_calendar.html'),(2,'Calendrier jours ouverts','Calendrier des crÃ©neaux disponibles et indisponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_calendar_opendays.html'),(3,'Liste des creneaux disponibles','Liste des crÃ©neaux disponibles','skin/plugins/appointment/calendar/appointment_form_list_open_slots.html'),(4,'Liste des creneaux disponibles jours ouverts','Liste des crÃ©neaux disponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_list_open_slots_opendays.html');
/*!40000 ALTER TABLE `appointment_calendar_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_category`
--

DROP TABLE IF EXISTS `appointment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_category` (
  `id_category` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `unique_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_category`
--

LOCK TABLES `appointment_category` WRITE;
/*!40000 ALTER TABLE `appointment_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_closing_day`
--

DROP TABLE IF EXISTS `appointment_closing_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_closing_day` (
  `id_closing_day` int(11) NOT NULL,
  `date_of_closing_day` date NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_closing_day`,`id_form`),
  UNIQUE KEY `unique_index` (`id_form`,`date_of_closing_day`),
  KEY `fk_appointment_closing_day_appointment_form_idx` (`id_form`),
  KEY `date_of_closing_day` (`date_of_closing_day`),
  CONSTRAINT `fk_appointment_closing_day_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_closing_day`
--

LOCK TABLES `appointment_closing_day` WRITE;
/*!40000 ALTER TABLE `appointment_closing_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_closing_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_display`
--

DROP TABLE IF EXISTS `appointment_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_display` (
  `id_display` int(11) NOT NULL,
  `display_title_fo` tinyint(1) NOT NULL DEFAULT '0',
  `icon_form_content` mediumblob,
  `icon_form_mime_type` varchar(255) DEFAULT NULL,
  `nb_weeks_to_display` int(11) NOT NULL DEFAULT '0',
  `is_displayed_on_portlet` tinyint(1) NOT NULL DEFAULT '1',
  `id_calendar_template` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_display`,`id_calendar_template`,`id_form`),
  UNIQUE KEY `unique_index` (`id_form`),
  KEY `fk_appointment_display_appointment_calendar_template_idx` (`id_calendar_template`),
  KEY `fk_appointment_display_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_display_appointment_calendar_template` FOREIGN KEY (`id_calendar_template`) REFERENCES `appointment_calendar_template` (`id_calendar_template`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_display_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_display`
--

LOCK TABLES `appointment_display` WRITE;
/*!40000 ALTER TABLE `appointment_display` DISABLE KEYS */;
INSERT INTO `appointment_display` VALUES (1,1,'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\02\0\0\02\0\0\0?±\0\0\0sBIT|d\0\0\0	pHYs\0\0\r×\0\0\r×B(x\0\0\0tEXtSoftware\0www.inkscape.orgî<\Z\0\0\0ÚIDAThíÙß\n0á·è\"º¦¼Ô:¨*¢?àI×`­PéÄÍoú{`\'FºÙY¸\0U&ãì|!7W_È÷Ç\\4æ»p\"£R5\n±F!Ö(Ä\ZX£kbB¬Q5\n±f6!Ï±^	ýÌæ($±­r	éä[ìun@õ;ò8Xî¾©?ôZ¾·´B\nF»þl¶ß¡![à4`¨úKàèÎÌx»Ñ>a¯H;w°¡-ö£þØÈâ½ÍÈYXö\0\0\0\0IEND®B`','image/png',4,1,1,1),(2,0,'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\02\0\0\02\0\0\0?±\0\0\0sBIT|d\0\0\0	pHYs\0\0\r×\0\0\r×B(x\0\0\0tEXtSoftware\0www.inkscape.orgî<\Z\0\0OIDAThímUEÇ÷îZ)øAIKµÕV%T²7\nÄÊBìC&F`Qm¢d}®(ü\ZDùIÄX×5ÝÒ^X_(ÖÝ»ÙëÝ5g»»çmfÎMXöÃÝsîüÿÏ3³gþç¹0À ¢­x$\'·h+÷,°¸½ø4Ó±Ú;Ük	Ü`M}R	IÔ¶Rø3¸U ©N¹ÂD\" -Ûôäào­_úÿäHä¯î¬Ü,\']	(ÕKØg ßæèÓpÿÄ¥|ùb9ÙÆ)ü×3¸çuÊ}6¥$òF·ø,Û<Za^}ÚÚsr°/Ä~àO®ÒqÄ ¼\n|àà-àüyÀÀ)åþ\nìVè`°øøØ\r< úñï\'tKÀàb¯xÌ!~&&ßÄ2í0Uû¶$ô¹<£ý^îËñÑ\0|\"bÚwÈÌõï¸>ÿSj´¥èCÊ×øXCÄ´ålHéófvRÅ¯ÄEÐ!åÌùî8ò¨Ì©Ñn^:cú/.¡Èâ¬)Á_ ½ô)Ï3Ø(&ÄE·PU®Óô+T\'ëÜ#0) ~,¾r:¬&½nÕk×yZïÍõBÆ.Nàç:%äEúJ@üXAÊô,NdmûEåû¸Î³ª×è?ÓRDNb÷ÔOé½f½nsqÙzm&Ã%~&Æ©pâUäÙnÆk%H9×ë=×¹1*ðCüÂÐßD¹È\0°±è$ï>B^lÝØ\nupÖön~&ÌunNcÏÆØÑØÝËú]&æûr$±¡ØÑÇuV`·¶·\0ûsÆ¯­\Za)ÐëHY\'`ÄÇuLpvÍåi½Àâ¡hÒÄòvá>®3Kµ\\ã÷(÷\nÚ=DLk:+¸»Îîø_\Z{DL[\\^ÜSDü2°* 	¡G8ó·Ø¢±xXÁõÁ*ÝYÈlt7«àÈ±NgÖõfê`Crè7§Ú°¢[ß¸g±ÿfdàÇ9gâ}Mdºç¬ö µÈ£7± IìÐÙ«\Zã¿¯Æ@>ÕÎd=ôþÄW£x¼¾ÐÏ\"\\Çh|îÉ¯Ç£äãú¹$µW>\r<:Õµ÷EÀÀ¤\"¬úýym§A¬GÜ¢[Æû¢\nEjµf:R!¬ÔW)pÆ¾>Â×HÆxãÿþ\r±nH\r|]¯ÿ\nÐ	ÂràGü×ÆQ\n(\\üÝ{!p\'âz³±7AãÇéEôë­í(F.¸O÷]ÿ?x\0\0\0\0IEND®B`','image/png',4,0,1,2),(6,0,'','NULL',52,1,1,6),(7,0,'','NULL',52,1,1,7),(11,1,'','NULL',4,1,1,11),(12,1,'','NULL',4,1,1,12),(13,0,'','NULL',54,1,1,13),(14,0,'','NULL',45,1,1,14);
/*!40000 ALTER TABLE `appointment_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form`
--

DROP TABLE IF EXISTS `appointment_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form` (
  `id_form` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `starting_validity_date` date DEFAULT NULL,
  `ending_validity_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `id_workflow` int(11) DEFAULT NULL,
  `workgroup` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_form`),
  KEY `starting_validity_date_idx` (`starting_validity_date`),
  KEY `ending_validity_date_idx` (`ending_validity_date`),
  KEY `fk_appointment_form_appointment_category_idx` (`id_category`),
  CONSTRAINT `fk_appointment_form_appointment_category` FOREIGN KEY (`id_category`) REFERENCES `appointment_category` (`id_category`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form`
--

LOCK TABLES `appointment_form` WRITE;
/*!40000 ALTER TABLE `appointment_form` DISABLE KEYS */;
INSERT INTO `appointment_form` VALUES (1,'Open Computer Lab','This is open computer lab from 10am to 3pm, Monday through Thursday. If you need another time/date, please reach out and schedule an appointment with Torbin Green at tgreen@stfranciscenter.org. No need to sign up.','',NULL,'2018-01-03',NULL,1,-1,'events'),(2,'Narcotics Anonymous','Primary Contact: Reggie, 443-207-3372','',NULL,'2018-01-03',NULL,1,-1,'events'),(6,'Multi-Purpose Room Reservation','Seats 60 without tables; seats 30 with tables.','',NULL,'2018-06-03',NULL,1,-1,'events'),(7,'1st Floor Meeting Room Reservations','Seats 30 without tables; seats 20 with tables.','',NULL,'2018-06-03',NULL,1,-1,'events'),(11,'Sunday Morning Yoga','Space is limited. Sign ups are required.','',NULL,'2018-01-04',NULL,1,-1,'events'),(12,'Wednesday Night Yoga','Space is limited. Sign ups are required.','',NULL,'2018-01-04',NULL,1,-1,'events'),(13,'Zumba','Dance and workout in one','',NULL,'2018-05-03',NULL,1,-1,'events'),(14,'Nutrition Classes','Come learn about nutrition and improve your diet','',NULL,'2018-05-03',NULL,1,-1,'events');
/*!40000 ALTER TABLE `appointment_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_message`
--

DROP TABLE IF EXISTS `appointment_form_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form_message` (
  `id_form_message` int(11) NOT NULL,
  `calendar_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_firstname_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_firstname_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_lastname_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_lastname_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_email_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_email_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_confirmationEmail_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_confirmationEmail_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_appointment_created` text COLLATE utf8_unicode_ci NOT NULL,
  `url_redirect_after_creation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_appointment_canceled` text COLLATE utf8_unicode_ci NOT NULL,
  `label_button_redirection` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_available_slot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calendar_description` text COLLATE utf8_unicode_ci NOT NULL,
  `calendar_reserve_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calendar_full_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_form_message`,`id_form`),
  KEY `fk_appointment_form_message_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_form_message_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_message`
--

LOCK TABLES `appointment_form_message` WRITE;
/*!40000 ALTER TABLE `appointment_form_message` DISABLE KEYS */;
INSERT INTO `appointment_form_message` VALUES (1,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','<p>Thank you for the registration. Your registration number is&nbsp;%%REF%%.</p>','jsp/site/Portal.jsp','<p>Your reservation has been cancelled.</p>','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Complete',1),(2,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','<p>Your reservation has been made successfully. Your reference number is %%REF%%.</p>','jsp/site/Portal.jsp','<p>Your reservation has been cancelled.</p>','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',2),(6,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','<p>Your reservation has been made successfully. Your reference number is %%REF%%.</p>','jsp/site/Portal.jsp','<p>Your reservation has been cancelled.</p>','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',6),(7,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','<p>Your reservation has been made successfully. Your reference number is %%REF%%.</p>','jsp/site/Portal.jsp','<p>Your reservation has been cancelled.</p>','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',7),(11,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','<p>Your reservation has been made successfully. Your reference number is %%REF%%.</p>','jsp/site/Portal.jsp','<p>Your reservation has been cancelled.</p>','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',11),(12,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','<p>Your reservation has been made successfully. Your reference number is %%REF%%.</p>','jsp/site/Portal.jsp','<p>Your reservation has been cancelled.</p>','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',12),(13,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','Your reservation has been made successfully. Your reference number is %%REF%%.','jsp/site/Portal.jsp','Your reservation has been cancelled.','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',13),(14,'Choose a Date','First Name','','Last Name','','Email','','Confirmation Email','','Your reservation has been made successfully. Your reference number is %%REF%%.','jsp/site/Portal.jsp','Your reservation has been cancelled.','Done','This time slot is not available. Please search for a different time slot.','','Reserve','Full',14);
/*!40000 ALTER TABLE `appointment_form_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_portlet`
--

DROP TABLE IF EXISTS `appointment_form_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form_portlet` (
  `id_portlet` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_portlet`,`id_form`),
  KEY `fk_appointment_form_portlet_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_form_portlet_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_portlet`
--

LOCK TABLES `appointment_form_portlet` WRITE;
/*!40000 ALTER TABLE `appointment_form_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_rule`
--

DROP TABLE IF EXISTS `appointment_form_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form_rule` (
  `id_form_rule` int(11) NOT NULL,
  `is_captcha_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_mandatory_email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_active_authentication` tinyint(1) NOT NULL DEFAULT '0',
  `nb_days_before_new_appointment` int(11) NOT NULL DEFAULT '0',
  `min_time_before_appointment` int(11) NOT NULL DEFAULT '0',
  `nb_max_appointments_per_user` int(11) NOT NULL DEFAULT '0',
  `nb_days_for_max_appointments_per_user` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_form_rule`,`id_form`),
  UNIQUE KEY `unique_index` (`id_form`),
  KEY `fk_appointment_form_rule_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_form_rule_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_rule`
--

LOCK TABLES `appointment_form_rule` WRITE;
/*!40000 ALTER TABLE `appointment_form_rule` DISABLE KEYS */;
INSERT INTO `appointment_form_rule` VALUES (1,0,0,0,0,0,0,0,1),(2,0,0,0,0,0,0,0,2),(6,0,0,0,0,30,0,0,6),(7,0,0,0,0,30,0,0,7),(11,0,0,0,0,0,0,0,11),(12,0,0,0,0,0,0,0,12),(13,0,0,0,0,0,0,0,13),(14,0,0,0,0,0,0,0,14);
/*!40000 ALTER TABLE `appointment_form_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_localization`
--

DROP TABLE IF EXISTS `appointment_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_localization` (
  `id_localization` int(11) NOT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_localization`,`id_form`),
  KEY `fk_appointment_localization_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_localization_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_localization`
--

LOCK TABLES `appointment_localization` WRITE;
/*!40000 ALTER TABLE `appointment_localization` DISABLE KEYS */;
INSERT INTO `appointment_localization` VALUES (1,NULL,NULL,NULL,1),(2,NULL,NULL,NULL,2),(6,NULL,NULL,NULL,6),(7,NULL,NULL,NULL,7),(11,NULL,NULL,NULL,11),(12,NULL,NULL,NULL,12),(13,NULL,NULL,NULL,13),(14,NULL,NULL,NULL,14);
/*!40000 ALTER TABLE `appointment_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_reservation_rule`
--

DROP TABLE IF EXISTS `appointment_reservation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_reservation_rule` (
  `id_reservation_rule` int(11) NOT NULL,
  `date_of_apply` date NOT NULL,
  `max_capacity_per_slot` int(11) NOT NULL DEFAULT '0',
  `max_people_per_appointment` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_reservation_rule`,`id_form`),
  UNIQUE KEY `unique_index_date_of_apply` (`id_form`,`date_of_apply`),
  KEY `fk_appointment_reservation_rule_appointment_form_idx` (`id_form`),
  KEY `date_of_apply_idx` (`date_of_apply`),
  CONSTRAINT `fk_appointment_reservation_rule_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_reservation_rule`
--

LOCK TABLES `appointment_reservation_rule` WRITE;
/*!40000 ALTER TABLE `appointment_reservation_rule` DISABLE KEYS */;
INSERT INTO `appointment_reservation_rule` VALUES (1,'2018-03-01',999,1,1),(2,'2018-03-01',30,1,2),(3,'2018-01-03',30,1,2),(7,'2018-03-06',1,1,6),(8,'2018-03-06',1,1,7),(12,'2018-03-29',20,1,11),(13,'2018-03-29',20,1,12),(14,'2018-01-04',10,1,2),(15,'2018-05-03',20,1,13),(16,'2018-05-03',15,15,14);
/*!40000 ALTER TABLE `appointment_reservation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_slot`
--

DROP TABLE IF EXISTS `appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_slot` (
  `id_slot` int(11) NOT NULL,
  `starting_date_time` timestamp NULL DEFAULT NULL,
  `ending_date_time` timestamp NULL DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `is_specific` tinyint(1) NOT NULL DEFAULT '0',
  `max_capacity` int(11) NOT NULL DEFAULT '0',
  `nb_remaining_places` int(11) NOT NULL DEFAULT '0',
  `nb_potential_remaining_places` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_slot`,`id_form`),
  UNIQUE KEY `unique_index_starting_date_time` (`id_form`,`starting_date_time`),
  UNIQUE KEY `unique_index_ending_date_time` (`id_form`,`ending_date_time`),
  KEY `fk_appointment_slot_appointment_form_idx` (`id_form`),
  KEY `starting_date_time_idx` (`starting_date_time`),
  KEY `ending_date_time_idx` (`ending_date_time`),
  CONSTRAINT `fk_appointment_slot_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_slot`
--

LOCK TABLES `appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_time_slot`
--

DROP TABLE IF EXISTS `appointment_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_time_slot` (
  `id_time_slot` int(11) NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity` int(11) NOT NULL DEFAULT '0',
  `id_working_day` int(11) NOT NULL,
  PRIMARY KEY (`id_time_slot`,`id_working_day`),
  UNIQUE KEY `unique_index_starting_time` (`id_working_day`,`starting_time`),
  UNIQUE KEY `unique_index_ending_time` (`id_working_day`,`ending_time`),
  KEY `fk_appointment_time_slot_appointment_working_day_idx` (`id_working_day`),
  KEY `starting_time_idx` (`starting_time`),
  KEY `ending_time_idx` (`ending_time`),
  CONSTRAINT `fk_appointment_time_slot_appointment_working_day` FOREIGN KEY (`id_working_day`) REFERENCES `appointment_working_day` (`id_working_day`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_time_slot`
--

LOCK TABLES `appointment_time_slot` WRITE;
/*!40000 ALTER TABLE `appointment_time_slot` DISABLE KEYS */;
INSERT INTO `appointment_time_slot` VALUES (1,'10:00:00','15:00:00',1,999,1),(2,'10:00:00','15:00:00',1,999,2),(3,'10:00:00','15:00:00',1,999,3),(4,'10:00:00','15:00:00',1,999,4),(5,'18:00:00','19:00:00',1,30,5),(6,'18:00:00','19:00:00',1,30,6),(7,'18:00:00','19:00:00',1,30,7),(8,'18:00:00','19:00:00',1,30,8),(9,'18:00:00','19:00:00',1,30,9),(13,'09:00:00','10:00:00',1,1,13),(14,'10:00:00','11:00:00',1,1,13),(15,'11:00:00','12:00:00',1,1,13),(16,'12:00:00','13:00:00',1,1,13),(17,'13:00:00','14:00:00',1,1,13),(18,'14:00:00','15:00:00',1,1,13),(19,'15:00:00','16:00:00',1,1,13),(20,'16:00:00','17:00:00',1,1,13),(21,'09:00:00','10:00:00',1,1,14),(22,'10:00:00','11:00:00',1,1,14),(23,'11:00:00','12:00:00',1,1,14),(24,'12:00:00','13:00:00',1,1,14),(25,'13:00:00','14:00:00',1,1,14),(26,'14:00:00','15:00:00',1,1,14),(27,'15:00:00','16:00:00',1,1,14),(28,'16:00:00','17:00:00',1,1,14),(29,'09:00:00','10:00:00',1,1,15),(30,'10:00:00','11:00:00',1,1,15),(31,'11:00:00','12:00:00',1,1,15),(32,'12:00:00','13:00:00',1,1,15),(33,'13:00:00','14:00:00',1,1,15),(34,'14:00:00','15:00:00',1,1,15),(35,'15:00:00','16:00:00',1,1,15),(36,'16:00:00','17:00:00',1,1,15),(37,'09:00:00','10:00:00',1,1,16),(38,'10:00:00','11:00:00',1,1,16),(39,'11:00:00','12:00:00',1,1,16),(40,'12:00:00','13:00:00',1,1,16),(41,'13:00:00','14:00:00',1,1,16),(42,'14:00:00','15:00:00',1,1,16),(43,'15:00:00','16:00:00',1,1,16),(44,'16:00:00','17:00:00',1,1,16),(45,'09:00:00','10:00:00',1,1,17),(46,'10:00:00','11:00:00',1,1,17),(47,'11:00:00','12:00:00',1,1,17),(48,'12:00:00','13:00:00',1,1,17),(49,'13:00:00','14:00:00',1,1,17),(50,'14:00:00','15:00:00',1,1,17),(51,'15:00:00','16:00:00',1,1,17),(52,'16:00:00','17:00:00',1,1,17),(53,'09:00:00','10:00:00',1,1,18),(54,'10:00:00','11:00:00',1,1,18),(55,'11:00:00','12:00:00',1,1,18),(56,'12:00:00','13:00:00',1,1,18),(57,'13:00:00','14:00:00',1,1,18),(58,'14:00:00','15:00:00',1,1,18),(59,'15:00:00','16:00:00',1,1,18),(60,'16:00:00','17:00:00',1,1,18),(61,'09:00:00','10:00:00',1,1,19),(62,'10:00:00','11:00:00',1,1,19),(63,'11:00:00','12:00:00',1,1,19),(64,'12:00:00','13:00:00',1,1,19),(65,'13:00:00','14:00:00',1,1,19),(66,'14:00:00','15:00:00',1,1,19),(67,'15:00:00','16:00:00',1,1,19),(68,'16:00:00','17:00:00',1,1,19),(69,'09:00:00','10:00:00',1,1,20),(70,'10:00:00','11:00:00',1,1,20),(71,'11:00:00','12:00:00',1,1,20),(72,'12:00:00','13:00:00',1,1,20),(73,'13:00:00','14:00:00',1,1,20),(74,'14:00:00','15:00:00',1,1,20),(75,'15:00:00','16:00:00',1,1,20),(76,'16:00:00','17:00:00',1,1,20),(77,'09:00:00','10:00:00',1,1,21),(78,'10:00:00','11:00:00',1,1,21),(79,'11:00:00','12:00:00',1,1,21),(80,'12:00:00','13:00:00',1,1,21),(81,'13:00:00','14:00:00',1,1,21),(82,'14:00:00','15:00:00',1,1,21),(83,'15:00:00','16:00:00',1,1,21),(84,'16:00:00','17:00:00',1,1,21),(85,'09:00:00','10:00:00',1,1,22),(86,'10:00:00','11:00:00',1,1,22),(87,'11:00:00','12:00:00',1,1,22),(88,'12:00:00','13:00:00',1,1,22),(89,'13:00:00','14:00:00',1,1,22),(90,'14:00:00','15:00:00',1,1,22),(91,'15:00:00','16:00:00',1,1,22),(92,'16:00:00','17:00:00',1,1,22),(113,'09:30:00','10:30:00',1,20,35),(114,'18:30:00','19:30:00',1,20,36),(115,'18:00:00','19:00:00',1,10,37),(116,'18:00:00','19:00:00',1,10,38),(117,'18:00:00','19:00:00',1,10,39),(118,'11:00:00','12:00:00',1,20,40),(119,'11:00:00','12:00:00',1,20,41),(120,'11:00:00','12:00:00',1,20,42),(121,'10:00:00','11:00:00',1,15,43),(122,'10:00:00','11:00:00',1,15,44);
/*!40000 ALTER TABLE `appointment_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_user`
--

DROP TABLE IF EXISTS `appointment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_user` (
  `id_user` int(11) NOT NULL,
  `id_lutece_user` int(11) DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `last_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `unique_index_email` (`first_name`,`last_name`,`email`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_user`
--

LOCK TABLES `appointment_user` WRITE;
/*!40000 ALTER TABLE `appointment_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_week_definition`
--

DROP TABLE IF EXISTS `appointment_week_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_week_definition` (
  `id_week_definition` int(11) NOT NULL,
  `date_of_apply` date NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_week_definition`,`id_form`),
  UNIQUE KEY `unique_index_date_of_apply` (`id_form`,`date_of_apply`),
  KEY `fk_appointment_week_type_appointment_form_idx` (`id_form`),
  KEY `date_of_apply_idx` (`date_of_apply`),
  CONSTRAINT `fk_appointment_week_definition_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_week_definition`
--

LOCK TABLES `appointment_week_definition` WRITE;
/*!40000 ALTER TABLE `appointment_week_definition` DISABLE KEYS */;
INSERT INTO `appointment_week_definition` VALUES (3,'2018-01-03',2),(14,'2018-01-04',2),(1,'2018-03-01',1),(2,'2018-03-01',2),(7,'2018-03-06',6),(8,'2018-03-06',7),(12,'2018-03-29',11),(13,'2018-03-29',12),(15,'2018-05-03',13),(16,'2018-05-03',14);
/*!40000 ALTER TABLE `appointment_week_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_working_day`
--

DROP TABLE IF EXISTS `appointment_working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_working_day` (
  `id_working_day` int(11) NOT NULL,
  `day_of_week` int(11) NOT NULL,
  `id_week_definition` int(11) NOT NULL,
  PRIMARY KEY (`id_working_day`,`id_week_definition`),
  UNIQUE KEY `unique_index` (`id_week_definition`,`day_of_week`),
  KEY `fk_appointment_working_day_appointment_week_definition_idx` (`id_week_definition`),
  CONSTRAINT `fk_appointment_working_day_appointment_week_definition` FOREIGN KEY (`id_week_definition`) REFERENCES `appointment_week_definition` (`id_week_definition`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_working_day`
--

LOCK TABLES `appointment_working_day` WRITE;
/*!40000 ALTER TABLE `appointment_working_day` DISABLE KEYS */;
INSERT INTO `appointment_working_day` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,2,2),(6,4,2),(7,2,3),(8,4,3),(9,6,3),(13,1,7),(14,2,7),(15,3,7),(16,4,7),(17,5,7),(18,1,8),(19,2,8),(20,3,8),(21,4,8),(22,5,8),(35,7,12),(36,3,13),(37,2,14),(38,4,14),(39,6,14),(40,1,15),(41,3,15),(42,5,15),(43,6,16),(44,7,16);
/*!40000 ALTER TABLE `appointment_working_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_agendas`
--

DROP TABLE IF EXISTS `calendar_agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_agendas` (
  `id_agenda` int(11) NOT NULL DEFAULT '0',
  `agenda_name` varchar(130) DEFAULT NULL,
  `agenda_image` varchar(130) DEFAULT NULL,
  `agenda_prefix` varchar(130) DEFAULT NULL,
  `role` varchar(130) NOT NULL,
  `workgroup_key` varchar(50) DEFAULT NULL,
  `role_manage` varchar(130) DEFAULT NULL,
  `is_notify` smallint(6) NOT NULL DEFAULT '0',
  `period_validity` int(11) DEFAULT '-1',
  PRIMARY KEY (`id_agenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_agendas`
--

LOCK TABLES `calendar_agendas` WRITE;
/*!40000 ALTER TABLE `calendar_agendas` DISABLE KEYS */;
INSERT INTO `calendar_agendas` VALUES (1,'Test','images/local/skin/plugins/calendar/dots/blue.png','','none','events','none',0,-1);
/*!40000 ALTER TABLE `calendar_agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_category`
--

DROP TABLE IF EXISTS `calendar_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_category` (
  `id_category` int(11) NOT NULL,
  `calendar_category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon_content` mediumblob,
  `icon_mime_type` varchar(100) DEFAULT NULL,
  `workgroup_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_category`
--

LOCK TABLES `calendar_category` WRITE;
/*!40000 ALTER TABLE `calendar_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_category_link`
--

DROP TABLE IF EXISTS `calendar_category_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_category_link` (
  `id_event` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id_event`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_category_link`
--

LOCK TABLES `calendar_category_link` WRITE;
/*!40000 ALTER TABLE `calendar_category_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_category_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events` (
  `id_event` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL DEFAULT '0',
  `event_date` date NOT NULL,
  `event_date_end` date DEFAULT NULL,
  `event_time_start` varchar(5) DEFAULT NULL,
  `event_time_end` varchar(5) DEFAULT NULL,
  `event_title` varchar(60) NOT NULL,
  `event_date_occurence` int(11) DEFAULT NULL,
  `event_date_periodicity` int(11) DEFAULT NULL,
  `event_date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_excluded_day` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
INSERT INTO `calendar_events` VALUES (1,1,'2018-03-14','2018-03-14','07:00','08:00','Yoga test',0,7,'2018-03-06 04:24:50','');
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events_features`
--

DROP TABLE IF EXISTS `calendar_events_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events_features` (
  `id_feature` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `feature_description` mediumtext NOT NULL,
  `feature_tags` varchar(130) DEFAULT NULL,
  `feature_location` varchar(60) DEFAULT NULL,
  `feature_location_town` varchar(60) DEFAULT NULL,
  `feature_location_zip` varchar(20) DEFAULT NULL,
  `feature_location_address` varchar(130) DEFAULT NULL,
  `feature_map_url` varchar(130) DEFAULT NULL,
  `feature_link_url` varchar(130) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `feature_page_url` varchar(300) DEFAULT NULL,
  `feature_top_event` int(11) DEFAULT '0',
  `feature_image` mediumblob,
  `image_mime_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events_features`
--

LOCK TABLES `calendar_events_features` WRITE;
/*!40000 ALTER TABLE `calendar_events_features` DISABLE KEYS */;
INSERT INTO `calendar_events_features` VALUES (1,1,'<p>Hello!</p>','','','','','','','',-1,'',1,NULL,NULL);
/*!40000 ALTER TABLE `calendar_events_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events_occurrences`
--

DROP TABLE IF EXISTS `calendar_events_occurrences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events_occurrences` (
  `id_occurrence` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL,
  `occurrence_date` date NOT NULL,
  `occurrence_time_start` varchar(5) DEFAULT NULL,
  `occurrence_time_end` varchar(5) DEFAULT NULL,
  `occurrence_title` varchar(60) NOT NULL,
  `occurrence_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_occurrence`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events_occurrences`
--

LOCK TABLES `calendar_events_occurrences` WRITE;
/*!40000 ALTER TABLE `calendar_events_occurrences` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events_occurrences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events_users`
--

DROP TABLE IF EXISTS `calendar_events_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events_users` (
  `id_event` int(11) NOT NULL,
  `user_login` varchar(100) NOT NULL,
  PRIMARY KEY (`id_event`,`user_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events_users`
--

LOCK TABLES `calendar_events_users` WRITE;
/*!40000 ALTER TABLE `calendar_events_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_export_stylesheets`
--

DROP TABLE IF EXISTS `calendar_export_stylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_export_stylesheets` (
  `id_stylesheet` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `source` mediumblob,
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_export_stylesheets`
--

LOCK TABLES `calendar_export_stylesheets` WRITE;
/*!40000 ALTER TABLE `calendar_export_stylesheets` DISABLE KEYS */;
INSERT INTO `calendar_export_stylesheets` VALUES (1,'Exportation rss','calendar_rss.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"html\" />\r\n	\r\n	<xsl:template match=\"events\">\r\n	\r\n		<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\r\n	    <channel>\r\n	        <title>Calendar RSS</title>\r\n	        <description>Calendar RSS</description>\r\n	        <link>portal.jsp</link>	\r\n		<xsl:apply-templates select=\"event\" />\r\n	    </channel>\r\n		</rss>	    \r\n		</xsl:template>\r\n	\r\n		<xsl:template match=\"event\">\r\n	        <item>\r\n	            <title><xsl:value-of select=\"event-summary\" disable-output-escaping=\"yes\" /></title>\r\n	            <description><xsl:value-of select=\"event-description\" disable-output-escaping=\"yes\" /></description>\r\n	            <pubDate><xsl:value-of select=\"event-creation-date\" disable-output-escaping=\"yes\" /></pubDate>\r\n	            <link><xsl:value-of select=\"event-url\"  /></link>\r\n	        </item>\r\n		</xsl:template>\r\n</xsl:stylesheet>\r\n','xml'),(2,'Exportation format Ical','ics_export_calendar.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"text\" \r\nindent=\"no\"/>\r\n<xsl:variable name=\"header\">\r\nBEGIN:VCALENDAR\r\nVERSION:2.0\r\nX-WR-CALNAME:Agenda\r\nPRODID:-//Mairie de Paris Inc//iCal 2.0//EN\r\nCALSCALE:GREGORIAN\r\n</xsl:variable>\r\n<xsl:variable name=\"footer\">\r\nEND:VCALENDA\r\n</xsl:variable>\r\n<xsl:template match=\"events\">		\r\n<xsl:copy-of select=\"$header\" />\r\n<xsl:apply-templates select=\"event\" />\r\n<xsl:copy-of select=\"$footer\" />\r\n</xsl:template >\r\n<xsl:template match=\"event\">\r\nBEGIN:VEVENT	\r\nSUMMARY:<xsl:value-of select=\"event-summary\" />\r\nLOCATION:<xsl:value-of select=\"event-location\" />\r\nDESCRIPTION:<xsl:value-of select=\"event-description\" />\r\nCATEGORIES:<xsl:value-of select=\"event-categories\" />\r\nSTATUS:<xsl:value-of select=\"event-status\" />\r\nDTSTART;TZID=Europe/Paris:<xsl:value-of select=\"event-date\" /><xsl:if test=\"event-date-time-start != \'\' \">T<xsl:value-of select=\"event-date-time-start\" />00</xsl:if>\r\n<xsl:if test=\"event-date-time-end != \'\' \">DTEND;TZID=Europe/Paris:<xsl:value-of select=\"event-date\" />T<xsl:value-of select=\"event-date-time-end\" />00</xsl:if>\r\nEND:VEVENT        	\r\n</xsl:template>\r\n</xsl:stylesheet>','ics'),(3,'Exportation xml','xml_export_calendar.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"xml\" version=\"1.0\"\r\nencoding=\"iso-8859-1\" indent=\"yes\"/>\r\n	<xsl:template match=\"/\">\r\n		<xsl:copy-of select=\"events\" />\r\n	</xsl:template >\r\n</xsl:stylesheet>\r\n','xml');
/*!40000 ALTER TABLE `calendar_export_stylesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_mini_portlet`
--

DROP TABLE IF EXISTS `calendar_mini_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_mini_portlet` (
  `top_event` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`top_event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_mini_portlet`
--

LOCK TABLES `calendar_mini_portlet` WRITE;
/*!40000 ALTER TABLE `calendar_mini_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_mini_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_notify_key`
--

DROP TABLE IF EXISTS `calendar_notify_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_notify_key` (
  `key_email` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `date_expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`key_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_notify_key`
--

LOCK TABLES `calendar_notify_key` WRITE;
/*!40000 ALTER TABLE `calendar_notify_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_notify_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_parameter`
--

DROP TABLE IF EXISTS `calendar_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_parameter` (
  `parameter_key` varchar(100) NOT NULL,
  `parameter_value` varchar(100) NOT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_parameter`
--

LOCK TABLES `calendar_parameter` WRITE;
/*!40000 ALTER TABLE `calendar_parameter` DISABLE KEYS */;
INSERT INTO `calendar_parameter` VALUES ('dashboard_nb_events','3'),('dashboard_n_next_days','3');
/*!40000 ALTER TABLE `calendar_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_portlet`
--

DROP TABLE IF EXISTS `calendar_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_portlet` (
  `id_portlet` int(11) NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `code_agenda_name` varchar(255) NOT NULL,
  `number_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_portlet`,`code_agenda_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_portlet`
--

LOCK TABLES `calendar_portlet` WRITE;
/*!40000 ALTER TABLE `calendar_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_subscriber`
--

DROP TABLE IF EXISTS `calendar_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_subscriber` (
  `id_subscriber` int(11) NOT NULL DEFAULT '0',
  `id_agenda` int(11) NOT NULL DEFAULT '0',
  `date_subscription` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_subscriber`,`id_agenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_subscriber`
--

LOCK TABLES `calendar_subscriber` WRITE;
/*!40000 ALTER TABLE `calendar_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_subscriber_details`
--

DROP TABLE IF EXISTS `calendar_subscriber_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_subscriber_details` (
  `id_subscriber` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_subscriber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_subscriber_details`
--

LOCK TABLES `calendar_subscriber_details` WRITE;
/*!40000 ALTER TABLE `calendar_subscriber_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_subscriber_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `childpages_portlet`
--

DROP TABLE IF EXISTS `childpages_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childpages_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `id_child_page` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_child_page`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `childpages_portlet`
--

LOCK TABLES `childpages_portlet` WRITE;
/*!40000 ALTER TABLE `childpages_portlet` DISABLE KEYS */;
INSERT INTO `childpages_portlet` VALUES (83,1);
/*!40000 ALTER TABLE `childpages_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_dashboard`
--

DROP TABLE IF EXISTS `core_admin_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_dashboard` (
  `dashboard_name` varchar(100) NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_dashboard`
--

LOCK TABLES `core_admin_dashboard` WRITE;
/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` VALUES ('calendarAdminDashboardComponent',1,1),('formAdminDashboardComponent',1,1),('searchAdminDashboardComponent',1,2),('usersAdminDashboardComponent',1,1),('workflowAdminDashboardComponent',1,1);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist`
--

DROP TABLE IF EXISTS `core_admin_mailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_mailinglist` (
  `id_mailinglist` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `workgroup` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist`
--

LOCK TABLES `core_admin_mailinglist` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist` VALUES (1,'admin','admin','all');
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist_filter`
--

DROP TABLE IF EXISTS `core_admin_mailinglist_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_mailinglist_filter` (
  `id_mailinglist` int(11) NOT NULL DEFAULT '0',
  `workgroup` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist_filter`
--

LOCK TABLES `core_admin_mailinglist_filter` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist_filter` VALUES (1,'all','super_admin');
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_right`
--

DROP TABLE IF EXISTS `core_admin_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_right` (
  `id_right` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `level_right` smallint(6) DEFAULT NULL,
  `admin_url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_updatable` int(11) NOT NULL DEFAULT '0',
  `plugin_name` varchar(50) DEFAULT NULL,
  `id_feature_group` varchar(50) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `documentation_url` varchar(255) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `is_external_feature` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_right`),
  KEY `index_right` (`level_right`,`admin_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_right`
--

LOCK TABLES `core_admin_right` WRITE;
/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` VALUES ('APPOINTMENT_CALENDAR_TEMPLATE','appointment.adminFeature.manageCalendarTemplates.name',0,'jsp/admin/plugins/appointment/ManageCalendarTemplates.jsp','appointment.adminFeature.manageCalendarTemplates.name',0,'appointment',NULL,NULL,NULL,4,0),('APPOINTMENT_CATEGORY_MANAGEMENT','appointment.adminFeature.manageCategories.name',2,'jsp/admin/plugins/appointment/ManageAppointmentCategory.jsp','appointment.adminFeature.manageCategories.name',0,'appointment',NULL,NULL,NULL,5,0),('APPOINTMENT_FORM_MANAGEMENT','appointment.adminFeature.ManageAppointmentForm.name',2,'jsp/admin/plugins/appointment/ManageAppointmentForms.jsp','appointment.adminFeature.ManageAppointmentForm.description',0,'appointment',NULL,NULL,NULL,4,0),('CALENDAR_MANAGEMENT','calendar.adminFeature.calendar_management.name',1,'jsp/admin/plugins/calendar/ManageCalendars.jsp','calendar.adminFeature.calendar_management.description',0,'calendar',NULL,NULL,NULL,9,0),('CORE_ADMINDASHBOARD_MANAGEMENT','portal.admindashboard.adminFeature.right_management.name',0,'jsp/admin/admindashboard/ManageAdminDashboards.jsp','portal.admindashboard.adminFeature.right_management.description',0,'','SYSTEM','images/admin/skin/features/manage_admindashboards.png',NULL,7,0),('CORE_ADMIN_SITE','portal.site.adminFeature.admin_site.name',2,'jsp/admin/site/AdminSite.jsp','portal.site.adminFeature.admin_site.description',1,NULL,'SITE','images/admin/skin/features/admin_site.png','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site',1,0),('CORE_CACHE_MANAGEMENT','portal.system.adminFeature.cache_management.name',0,'jsp/admin/system/ManageCaches.jsp','portal.system.adminFeature.cache_management.description',1,'','SYSTEM','images/admin/skin/features/manage_caches.png',NULL,0,0),('CORE_DAEMONS_MANAGEMENT','portal.system.adminFeature.daemons_management.name',0,'jsp/admin/system/ManageDaemons.jsp','portal.system.adminFeature.daemons_management.description',0,'','SYSTEM',NULL,NULL,6,0),('CORE_DASHBOARD_MANAGEMENT','portal.dashboard.adminFeature.dashboard_management.name',0,'jsp/admin/dashboard/ManageDashboards.jsp','portal.dashboard.adminFeature.dashboard_management.description',0,'','SYSTEM','images/admin/skin/features/manage_dashboards.png',NULL,8,0),('CORE_EXTERNAL_FEATURES_MANAGEMENT','portal.system.adminFeature.external_features_management.name',1,'jsp/admin/features/ManageExternalFeatures.jsp','portal.system.adminFeature.external_features_management.description',1,'','SYSTEM',NULL,NULL,10,0),('CORE_FEATURES_MANAGEMENT','portal.admin.adminFeature.features_management.name',0,'jsp/admin/features/DispatchFeatures.jsp','portal.admin.adminFeature.features_management.description',0,'','SYSTEM','images/admin/skin/features/manage_features.png',NULL,5,0),('CORE_GLOBAL_MANAGEMENT','portal.globalmanagement.adminFeature.global_management.name',2,'jsp/admin/globalmanagement/GetGlobalManagement.jsp','portal.globalmanagement.adminFeature.global_management.description',1,'','SYSTEM',NULL,NULL,9,0),('CORE_LEVEL_RIGHT_MANAGEMENT','portal.users.adminFeature.level_right_management.name',2,'jsp/admin/features/ManageLevels.jsp','portal.users.adminFeature.level_right_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_LINK_SERVICE_MANAGEMENT','portal.insert.adminFeature.linkService_management.name',2,NULL,'portal.insert.adminFeature.linkService_management.description',0,'',NULL,NULL,NULL,0,0),('CORE_LOGS_VISUALISATION','portal.system.adminFeature.logs_visualisation.name',0,'jsp/admin/system/ManageFilesSystem.jsp','portal.system.adminFeature.logs_visualisation.description',1,'','SYSTEM','images/admin/skin/features/view_logs.png',NULL,3,0),('CORE_MAILINGLISTS_MANAGEMENT','portal.mailinglist.adminFeature.mailinglists_management.name',2,'jsp/admin/mailinglist/ManageMailingLists.jsp','portal.mailinglist.adminFeature.mailinglists_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_mailinglists.png',NULL,4,0),('CORE_MODES_MANAGEMENT','portal.style.adminFeature.modes_management.name',0,'jsp/admin/style/ManageModes.jsp','portal.style.adminFeature.modes_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_modes.png',NULL,1,0),('CORE_PAGE_TEMPLATE_MANAGEMENT','portal.style.adminFeature.page_template_management.name',0,'jsp/admin/style/ManagePageTemplates.jsp','portal.style.adminFeature.page_template_management.description',0,NULL,'STYLE','images/admin/skin/features/manage_page_templates.png',NULL,2,0),('CORE_PLUGINS_MANAGEMENT','portal.system.adminFeature.plugins_management.name',0,'jsp/admin/system/ManagePlugins.jsp','portal.system.adminFeature.plugins_management.description',1,'','SYSTEM','images/admin/skin/features/manage_plugins.png',NULL,4,0),('CORE_PROPERTIES_MANAGEMENT','portal.site.adminFeature.properties_management.name',2,'jsp/admin/ManageProperties.jsp','portal.site.adminFeature.properties_management.description',0,NULL,'SITE',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties',2,0),('CORE_RBAC_MANAGEMENT','portal.rbac.adminFeature.rbac_management.name',0,'jsp/admin/rbac/ManageRoles.jsp','portal.rbac.adminFeature.rbac_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rbac.png',NULL,2,0),('CORE_RIGHT_MANAGEMENT','portal.users.adminFeature.right_management.name',0,'jsp/admin/features/ManageRights.jsp','portal.users.adminFeature.right_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_ROLES_MANAGEMENT','portal.role.adminFeature.roles_management.name',2,'jsp/admin/role/ManagePageRole.jsp','portal.role.adminFeature.roles_management.description',0,NULL,'USERS','images/admin/skin/features/manage_roles.png',NULL,1,0),('CORE_SEARCH_INDEXATION','portal.search.adminFeature.indexer.name',0,'jsp/admin/search/ManageSearchIndexation.jsp','portal.search.adminFeature.indexer.description',0,'','SYSTEM',NULL,NULL,1,0),('CORE_SEARCH_MANAGEMENT','portal.search.adminFeature.search_management.name',0,'jsp/admin/search/ManageSearch.jsp','portal.search.adminFeature.search_management.description',0,'','SYSTEM',NULL,NULL,2,0),('CORE_STYLESHEET_MANAGEMENT','portal.style.adminFeature.stylesheet_management.name',0,'jsp/admin/style/ManageStyleSheets.jsp','portal.style.adminFeature.stylesheet_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_stylesheets.png',NULL,3,0),('CORE_STYLES_MANAGEMENT','portal.style.adminFeature.styles_management.name',0,'jsp/admin/style/ManageStyles.jsp','portal.style.adminFeature.styles_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_styles.png',NULL,4,0),('CORE_USERS_MANAGEMENT','portal.users.adminFeature.users_management.name',2,'jsp/admin/user/ManageUsers.jsp','portal.users.adminFeature.users_management.description',1,'','MANAGERS','images/admin/skin/features/manage_users.png',NULL,1,0),('CORE_WORKGROUPS_MANAGEMENT','portal.workgroup.adminFeature.workgroups_management.name',2,'jsp/admin/workgroup/ManageWorkgroups.jsp','portal.workgroup.adminFeature.workgroups_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_workgroups.png',NULL,3,0),('CORE_XSL_EXPORT_MANAGEMENT','portal.xsl.adminFeature.xsl_export_management.name',2,'jsp/admin/xsl/ManageXslExport.jsp','portal.xsl.adminFeature.xsl_export_management.description',1,'','SYSTEM',NULL,NULL,9,0),('ENROLL_MANAGEMENT','enroll.adminFeature.ManageEnroll.name',0,'jsp/admin/plugins/enroll/ManageProjects.jsp','enroll.adminFeature.ManageEnroll.description',0,'enroll',NULL,NULL,NULL,8,0),('FORM_MANAGEMENT','form.adminFeature.form_management.name',2,'jsp/admin/plugins/form/ManageForm.jsp','form.adminFeature.form_management.description',0,'form',NULL,NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-form',6,0),('REGULAR_EXPRESSION_MANAGEMENT','regularexpression.adminFeature.regularexpression_management.name',0,'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp','regularexpression.adminFeature.regularexpression_management.description',0,'regularexpression',NULL,NULL,NULL,3,0),('WORKFLOW_MANAGEMENT','workflow.adminFeature.workflow_management.name',3,'jsp/admin/plugins/workflow/ManageWorkflow.jsp','workflow.adminFeature.workflow_management.description',0,'workflow',NULL,NULL,NULL,2,0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role`
--

DROP TABLE IF EXISTS `core_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_role` (
  `role_key` varchar(50) NOT NULL DEFAULT '',
  `role_description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role`
--

LOCK TABLES `core_admin_role` WRITE;
/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` VALUES ('all_site_manager','Site Manager'),('calendar_manager','Calendar management'),('form_manager','Gestion des formulaires'),('form_manager_admin','Administration des formulaires'),('super_admin','Super Administrateur'),('workflow_manager','Workflow management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role_resource`
--

DROP TABLE IF EXISTS `core_admin_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_role_resource` (
  `rbac_id` int(11) NOT NULL DEFAULT '0',
  `role_key` varchar(50) NOT NULL DEFAULT '',
  `resource_type` varchar(50) NOT NULL DEFAULT '',
  `resource_id` varchar(50) NOT NULL DEFAULT '',
  `permission` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`rbac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role_resource`
--

LOCK TABLES `core_admin_role_resource` WRITE;
/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` VALUES (57,'all_site_manager','PAGE','*','VIEW'),(58,'all_site_manager','PAGE','*','MANAGE'),(77,'super_admin','INSERT_SERVICE','*','*'),(101,'all_site_manager','PORTLET_TYPE','*','*'),(111,'all_site_manager','ADMIN_USER','*','*'),(137,'all_site_manager','SEARCH_SERVICE','*','*'),(164,'all_site_manager','XSL_EXPORT','*','*'),(250,'calendar_manager','CALENDAR','*','*'),(905,'form_manager_admin','FORM_EXPORT_FORMAT_TYPE','*','*'),(906,'form_manager_admin','FORM_DEFAULT_MESSAGE_TYPE','*','*'),(907,'form_manager','FORM_FORM_TYPE','*','*'),(912,'workflow_manager','WORKFLOW_ACTION_TYPE','*','*'),(923,'workflow_manager','WORKFLOW_STATE_TYPE','*','*'),(1026,'super_admin','APPOINTMENT_FORM','*','*');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user`
--

DROP TABLE IF EXISTS `core_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `access_code` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(256) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `password` mediumtext,
  `locale` varchar(10) NOT NULL DEFAULT 'fr',
  `level_user` smallint(6) NOT NULL DEFAULT '0',
  `reset_password` smallint(6) NOT NULL DEFAULT '0',
  `accessibility_mode` smallint(6) NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1980-01-01 05:00:00',
  `workgroup_key` varchar(50) DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user`
--

LOCK TABLES `core_admin_user` WRITE;
/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` VALUES (1,'admin','Admin','admin','admin@lutece.fr',0,'PLAINTEXT:adminadmin','fr',0,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all'),(2,'lutece','Lutce','lutece','lutece@lutece.fr',1,'PLAINTEXT:adminadmin','fr',1,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all'),(3,'redac','redac','redac','redac@lutece.fr',1,'PLAINTEXT:adminadmin','fr',2,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all'),(4,'valid','valid','valid','valid@lutece.fr',1,'PLAINTEXT:adminadmin','fr',3,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_anonymize_field`
--

DROP TABLE IF EXISTS `core_admin_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user_anonymize_field` (
  `field_name` varchar(100) NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_anonymize_field`
--

LOCK TABLES `core_admin_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` VALUES ('access_code',1),('email',1),('first_name',1),('last_name',1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_field`
--

DROP TABLE IF EXISTS `core_admin_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user_field` (
  `id_user_field` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `user_field_value` mediumtext,
  PRIMARY KEY (`id_user_field`),
  KEY `core_admin_user_field_idx_file` (`id_file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_field`
--

LOCK TABLES `core_admin_user_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_preferences`
--

DROP TABLE IF EXISTS `core_admin_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user_preferences` (
  `id_user` varchar(100) NOT NULL,
  `pref_key` varchar(100) NOT NULL,
  `pref_value` mediumtext,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_preferences`
--

LOCK TABLES `core_admin_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup`
--

DROP TABLE IF EXISTS `core_admin_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_workgroup` (
  `workgroup_key` varchar(50) NOT NULL,
  `workgroup_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup`
--

LOCK TABLES `core_admin_workgroup` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
INSERT INTO `core_admin_workgroup` VALUES ('events','Appointments, Sign Ups, and Events');
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup_user`
--

DROP TABLE IF EXISTS `core_admin_workgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup_user`
--

LOCK TABLES `core_admin_workgroup_user` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
INSERT INTO `core_admin_workgroup_user` VALUES ('events',1);
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute`
--

DROP TABLE IF EXISTS `core_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_attribute` (
  `id_attribute` int(11) NOT NULL DEFAULT '0',
  `type_class_name` varchar(255) DEFAULT NULL,
  `title` mediumtext,
  `help_message` mediumtext,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_shown_in_search` smallint(6) DEFAULT '0',
  `is_shown_in_result_list` smallint(6) DEFAULT '0',
  `is_field_in_line` smallint(6) DEFAULT '0',
  `attribute_position` int(11) DEFAULT '0',
  `plugin_name` varchar(255) DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute`
--

LOCK TABLES `core_attribute` WRITE;
/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute_field`
--

DROP TABLE IF EXISTS `core_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_attribute_field` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `DEFAULT_value` mediumtext,
  `is_DEFAULT_value` smallint(6) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT '0',
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute_field`
--

LOCK TABLES `core_attribute_field` WRITE;
/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_connections_log`
--

DROP TABLE IF EXISTS `core_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_connections_log` (
  `access_code` varchar(100) DEFAULT NULL,
  `ip_address` varchar(63) DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int(11) DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_connections_log`
--

LOCK TABLES `core_connections_log` WRITE;
/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
INSERT INTO `core_connections_log` VALUES ('admin','0:0:0:0:0:0:0:1','2018-02-27 03:15:58',0),('admin','0:0:0:0:0:0:0:1','2018-03-01 00:19:40',0),('admin','75.102.135.243','2018-03-28 13:23:40',0),('','0:0:0:0:0:0:0:1','2018-03-29 21:31:27',0),('admin','0:0:0:0:0:0:0:1','2018-04-26 00:34:30',0),('admin','173.73.4.52','2018-07-09 19:37:58',0),('admin','173.73.4.52','2018-07-09 19:38:22',0),('admin','173.73.4.52','2018-07-09 19:44:24',0),('admin','173.73.4.52','2018-07-09 19:50:44',0),('admin','213.41.85.162','2018-12-13 16:42:03',0),('root','162.129.251.87','2019-10-29 14:46:34',0),('root','162.129.251.87','2019-10-29 15:08:42',0),('','128.220.159.92','2019-11-06 20:56:37',0),('admin','128.220.159.92','2019-11-06 20:57:18',0),('admin','162.129.251.105','2019-11-12 15:54:26',0),('admin','162.129.251.85','2019-11-12 16:23:59',0),('admin','128.220.159.92','2019-11-12 19:30:16',0),('admin','73.173.160.110','2019-11-13 17:43:03',0),('admin','172.19.0.1','2019-12-05 15:12:08',0),('admin','172.19.0.1','2019-12-05 15:12:26',0),('admin','172.19.0.1','2019-12-05 15:12:43',0),('admin','172.19.0.1','2019-12-05 15:13:00',0),('admin','172.19.0.1','2019-12-05 15:13:14',0);
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_dashboard`
--

DROP TABLE IF EXISTS `core_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_dashboard` (
  `dashboard_name` varchar(100) NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_dashboard`
--

LOCK TABLES `core_dashboard` WRITE;
/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` VALUES ('APPOINTMENT_FORM',3,2),('CALENDAR',3,1),('CORE_PAGES',2,1),('CORE_SYSTEM',1,2),('CORE_USER',4,1),('CORE_USERS',1,1),('FORM',3,1),('WORKFLOW',3,1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_datastore`
--

DROP TABLE IF EXISTS `core_datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_datastore` (
  `entity_key` varchar(255) NOT NULL,
  `entity_value` mediumtext,
  PRIMARY KEY (`entity_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_datastore`
--

LOCK TABLES `core_datastore` WRITE;
/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` VALUES ('core.advanced_parameters.access_failures_captcha','1'),('core.advanced_parameters.access_failures_interval','10'),('core.advanced_parameters.access_failures_max','3'),('core.advanced_parameters.account_life_time','12'),('core.advanced_parameters.account_reactivated_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.account_reactivated_mail_subject','Votre compte a bien Ã©tÃ© rÃ©activÃ©'),('core.advanced_parameters.default_user_language','en'),('core.advanced_parameters.default_user_level','0'),('core.advanced_parameters.default_user_notification','1'),('core.advanced_parameters.default_user_status','0'),('core.advanced_parameters.email_pattern','^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),('core.advanced_parameters.email_pattern_verify_by',''),('core.advanced_parameters.expired_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.expired_alert_mail_subject','Votre compte a expirÃ©'),('core.advanced_parameters.first_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.first_alert_mail_subject','Votre compte va bientÃ´t expirer'),('core.advanced_parameters.force_change_password_reinit','false'),('core.advanced_parameters.lock_reset_token_to_session','false'),('core.advanced_parameters.maximum_number_password_change',''),('core.advanced_parameters.nb_alert_account','2'),('core.advanced_parameters.notify_user_password_expired',''),('core.advanced_parameters.other_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.other_alert_mail_subject','Votre compte va bientÃ´t expirer'),('core.advanced_parameters.password_duration','120'),('core.advanced_parameters.password_expired_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.password_expired_mail_subject','Votre mot de passe a expirÃ©'),('core.advanced_parameters.password_format_numero','false'),('core.advanced_parameters.password_format_special_characters','false'),('core.advanced_parameters.password_format_upper_lower_case','false'),('core.advanced_parameters.password_history_size',''),('core.advanced_parameters.password_minimum_length','8'),('core.advanced_parameters.reset_token_validity','60'),('core.advanced_parameters.time_before_alert_account','30'),('core.advanced_parameters.time_between_alerts_account','10'),('core.advanced_parameters.tsw_size_password_change',''),('core.advanced_parameters.use_advanced_security_parameters',''),('core.backOffice.defaultEditor','tinymce'),('core.cache.status.appointment.appointmentFormCacheService.enabled','1'),('core.cache.status.asynchronousupload.asynchronousUploadCacheService.enabled','0'),('core.cache.status.BaseUserPreferencesCacheService.enabled','1'),('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory','1000'),('core.cache.status.CalendarCacheService.enabled','0'),('core.cache.status.CalendarEventListCacheService.enabled','0'),('core.cache.status.DatastoreCacheService.enabled','0'),('core.cache.status.EntryTypeServiceManagerCache.enabled','1'),('core.cache.status.LinksIncludeCacheService.enabled','1'),('core.cache.status.LuteceUserCacheService.enabled','1'),('core.cache.status.LuteceUserCacheService.maxElementsInMemory','1000'),('core.cache.status.MailAttachmentCacheService.diskPersistent','true'),('core.cache.status.MailAttachmentCacheService.enabled','1'),('core.cache.status.MailAttachmentCacheService.maxElementsInMemory','10'),('core.cache.status.MailAttachmentCacheService.overflowToDisk','true'),('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds','7200'),('core.cache.status.MyPortalWidgetContentService.enabled','1'),('core.cache.status.MyPortalWidgetService.enabled','1'),('core.cache.status.PageCacheService.enabled','1'),('core.cache.status.PageCachingFilter(CAUTION:NEVERUSEWITHUSERDYNAMICDATA).enabled','0'),('core.cache.status.PageCachingFilter.enabled','0'),('core.cache.status.pathCacheService.enabled','1'),('core.cache.status.PortalMenuService.enabled','1'),('core.cache.status.PortletCacheService.enabled','0'),('core.cache.status.SiteMapService.enabled','1'),('core.cache.status.StaticFilesCachingFilter.enabled','1'),('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds','604800'),('core.cache.status.XMLTransformerCacheService(XSLT).enabled','1'),('core.daemon.accountLifeTimeDaemon.interval','86400'),('core.daemon.accountLifeTimeDaemon.onStartUp','true'),('core.daemon.anonymizationDaemon.interval','86400'),('core.daemon.anonymizationDaemon.onStartUp','false'),('core.daemon.automaticActionDaemon.interval','14400'),('core.daemon.automaticActionDaemon.onStartUp','true'),('core.daemon.calendarNotificationCleaner.interval','45000'),('core.daemon.calendarNotificationCleaner.onStartUp','true'),('core.daemon.formExportResponses.interval','80000'),('core.daemon.formExportResponses.onStartUp','false'),('core.daemon.formPublication.interval','60'),('core.daemon.formPublication.onStartUp','true'),('core.daemon.formRemoveResponses.interval','86400'),('core.daemon.formRemoveResponses.onStartUp','false'),('core.daemon.indexer.interval','300'),('core.daemon.indexer.onStartUp','true'),('core.daemon.mailSender.interval','86400'),('core.daemon.mailSender.onStartUp','true'),('core.daemon.threadLauncherDaemon.interval','86400'),('core.daemon.threadLauncherDaemon.onStartUp','true'),('core.frontOffice.defaultEditor','markitupbbcode'),('core.plugins.status.appointment.installed','true'),('core.plugins.status.appointment.pool','portal'),('core.plugins.status.asynchronous-upload.installed','true'),('core.plugins.status.asynchronous-upload.pool','portal'),('core.plugins.status.calendar.installed','true'),('core.plugins.status.calendar.pool','portal'),('core.plugins.status.childpages.installed','true'),('core.plugins.status.core_extensions.installed','true'),('core.plugins.status.enroll.installed','true'),('core.plugins.status.enroll.pool','portal'),('core.plugins.status.form.installed','true'),('core.plugins.status.form.pool','portal'),('core.plugins.status.genericattributes.installed','true'),('core.plugins.status.genericattributes.pool','portal'),('core.plugins.status.html.installed','true'),('core.plugins.status.lucene.installed','true'),('core.plugins.status.regularexpression.installed','true'),('core.plugins.status.regularexpression.pool','portal'),('core.plugins.status.rest.installed','true'),('core.plugins.status.workflow.installed','true'),('core.plugins.status.workflow.pool','portal'),('core.startup.time','Dec 5, 2019 3:11:46 PM'),('core_banned_domain_names','yopmail.com'),('portal.site.site_property.admin_home_url','jsp/admin/AdminMenu.jsp'),('portal.site.site_property.avatar_default','images/admin/skin/unknown.png'),('portal.site.site_property.back_images','\'images/admin/skin/bg_login1.jpg\' , \'images/admin/skin/bg_login2.jpg\' , \'images/admin/skin/bg_login3.jpg\' , \'images/admin/skin/bg_login4.jpg\''),('portal.site.site_property.email','<webmaster email>'),('portal.site.site_property.home_url','jsp/site/Portal.jsp'),('portal.site.site_property.locale.default','en'),('portal.site.site_property.logo_url','images/logo-header-icon.png'),('portal.site.site_property.menu.position','top'),('portal.site.site_property.meta.author','<author>'),('portal.site.site_property.meta.copyright','<copyright>'),('portal.site.site_property.meta.description','<description>'),('portal.site.site_property.meta.keywords','<keywords>'),('portal.site.site_property.name','LUTECE'),('portal.site.site_property.noreply_email','no-reply@mydomain.com'),('portal.site.site_property.popup_credits.textblock','&lt;credits text&gt;'),('portal.site.site_property.popup_legal_info.copyright.textblock','&lt;copyright text&gt;'),('portal.site.site_property.popup_legal_info.privacy.textblock','&lt;privacy text&gt;');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_feature_group`
--

DROP TABLE IF EXISTS `core_feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_feature_group` (
  `id_feature_group` varchar(50) NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) DEFAULT NULL,
  `feature_group_label` varchar(100) DEFAULT NULL,
  `feature_group_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_feature_group`
--

LOCK TABLES `core_feature_group` WRITE;
/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` VALUES ('APPLICATIONS','portal.features.group.applications.description','portal.features.group.applications.label',3),('CONTENT','portal.features.group.content.description','portal.features.group.content.label',1),('MANAGERS','portal.features.group.managers.description','portal.features.group.managers.label',5),('SITE','portal.features.group.site.description','portal.features.group.site.label',2),('STYLE','portal.features.group.charter.description','portal.features.group.charter.label',6),('SYSTEM','portal.features.group.system.description','portal.features.group.system.label',7),('USERS','portal.features.group.users.description','portal.features.group.users.label',4);
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_file`
--

DROP TABLE IF EXISTS `core_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_file` (
  `id_file` int(11) NOT NULL DEFAULT '0',
  `title` mediumtext,
  `id_physical_file` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_file`
--

LOCK TABLES `core_file` WRITE;
/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` VALUES (125,'export_users_csv.xml',125,2523,'application/xml','2005-10-10 14:10:10'),(126,'export_users_xml.xml',126,259,'application/xml','2005-10-10 14:10:10');
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_id_generator`
--

DROP TABLE IF EXISTS `core_id_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_id_generator` (
  `class_name` varchar(250) NOT NULL DEFAULT '',
  `current_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_id_generator`
--

LOCK TABLES `core_id_generator` WRITE;
/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_indexer_action`
--

DROP TABLE IF EXISTS `core_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_indexer_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `id_document` varchar(255) NOT NULL,
  `id_task` int(11) NOT NULL DEFAULT '0',
  `indexer_name` varchar(255) NOT NULL,
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_indexer_action`
--

LOCK TABLES `core_indexer_action` WRITE;
/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_level_right`
--

DROP TABLE IF EXISTS `core_level_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_level_right` (
  `id_level` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_level_right`
--

LOCK TABLES `core_level_right` WRITE;
/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` VALUES (0,'Niveau 0 - Droits de l\'administrateur technique'),(1,'Niveau 1 - Droits de l\'administrateur fonctionnel'),(2,'Niveau 2 - Droits du webmestre'),(3,'Niveau 3 - Droits de l\'assistant webmestre');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_item`
--

DROP TABLE IF EXISTS `core_mail_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_mail_item` (
  `id_mail_queue` int(11) NOT NULL DEFAULT '0',
  `mail_item` mediumblob,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_item`
--

LOCK TABLES `core_mail_item` WRITE;
/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_queue`
--

DROP TABLE IF EXISTS `core_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_mail_queue` (
  `id_mail_queue` int(11) NOT NULL AUTO_INCREMENT,
  `is_locked` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_queue`
--

LOCK TABLES `core_mail_queue` WRITE;
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mode`
--

DROP TABLE IF EXISTS `core_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_mode` (
  `id_mode` int(11) NOT NULL DEFAULT '0',
  `description_mode` varchar(255) DEFAULT NULL,
  `path` varchar(50) NOT NULL DEFAULT '',
  `output_xsl_method` varchar(50) DEFAULT NULL,
  `output_xsl_version` varchar(50) DEFAULT NULL,
  `output_xsl_media_type` varchar(50) DEFAULT NULL,
  `output_xsl_encoding` varchar(50) DEFAULT NULL,
  `output_xsl_indent` varchar(50) DEFAULT NULL,
  `output_xsl_omit_xml_dec` varchar(50) DEFAULT NULL,
  `output_xsl_standalone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mode`
--

LOCK TABLES `core_mode` WRITE;
/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` VALUES (0,'Normal','normal/','xml','1.0','text/xml','UTF-8','yes','yes','yes'),(1,'Administration','admin/','xml','1.0','text/xml','UTF-8','yes','yes','yes'),(2,'Wap','wml/','xml','1.0','text/xml','UTF-8','yes','yes','yes');
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_page` (
  `id_page` int(11) NOT NULL DEFAULT '0',
  `id_parent` int(11) DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` mediumtext,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) DEFAULT NULL,
  `page_order` int(11) DEFAULT '0',
  `id_template` int(11) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `code_theme` varchar(80) DEFAULT NULL,
  `node_status` smallint(6) NOT NULL DEFAULT '1',
  `image_content` mediumblob,
  `mime_type` varchar(255) DEFAULT 'NULL',
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `id_authorization_node` int(11) DEFAULT NULL,
  `display_date_update` smallint(6) NOT NULL DEFAULT '0',
  `is_manual_date_update` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `index_page` (`id_template`,`id_parent`),
  KEY `index_childpage` (`id_parent`,`page_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page`
--

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES (1,0,'Home','','2018-03-28 19:20:49',1,1,4,'2003-09-09 04:38:01','none','default',0,'','application/octet-stream',NULL,NULL,1,0,0),(2,1,'Development Programs','','2018-03-28 19:21:03',0,1,1,'2018-03-28 19:21:03','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(4,1,'Room Reservations','','2018-03-28 19:21:44',0,3,1,'2018-03-28 19:21:44','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(5,1,'Volunteering','','2018-03-28 19:22:18',0,4,1,'2018-03-28 19:22:18','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(6,1,'Contact Us','','2018-03-29 16:52:50',0,5,5,'2018-03-28 19:22:34','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(7,1,'Activities and Events','','2018-03-29 04:01:02',0,2,1,'2018-03-29 04:01:02','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(8,7,'Mental and Physical Health','','2018-03-29 05:44:06',0,1,1,'2018-03-29 05:44:06','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(9,7,'Professional Assistance','','2018-03-29 05:44:56',0,2,1,'2018-03-29 05:44:56','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(10,7,'Community Events','','2018-03-29 05:45:07',0,3,1,'2018-03-29 05:45:07','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(12,2,'Summer','','2018-03-29 06:35:13',0,2,1,'2018-03-29 06:35:13','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(13,2,'School Year','','2018-03-29 16:23:00',0,1,1,'2018-03-29 16:23:00','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(14,6,'Staff Login','','2018-03-29 18:08:51',0,1,1,'2018-03-29 18:03:39','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(15,13,'Power Project','','2018-03-29 18:19:19',0,1,1,'2018-03-29 18:19:19','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(16,13,'Intern Program','','2018-03-29 18:23:02',0,1,1,'2018-03-29 18:23:02','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(17,12,'Summer of Service','','2018-03-29 18:23:39',0,1,1,'2018-03-29 18:23:39','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(18,12,'Youth Workers','','2018-03-29 18:24:01',0,2,1,'2018-03-29 18:24:01','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(19,7,'Community Meditation','','2018-04-26 19:13:08',0,2,1,'2018-04-26 19:13:08','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(20,9,'Computer Classes','','2018-04-26 19:16:16',0,2,1,'2018-04-26 19:16:16','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(21,10,'Family Engagement Night','','2018-04-26 19:18:24',0,3,1,'2018-04-26 19:18:24','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(22,10,'Corpus Christi Grocery Program','','2018-04-26 19:18:50',0,3,1,'2018-04-26 19:18:50','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(23,10,'Stoop Nights','','2018-04-26 19:19:02',0,3,1,'2018-04-26 19:19:02','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(24,10,'Reservoir Hill Resource Fair','','2018-04-26 19:19:16',0,3,1,'2018-04-26 19:19:16','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0),(25,10,'Community Clean Ups','','2018-04-26 19:19:29',0,3,1,'2018-04-26 19:19:29','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_page_template` (
  `id_template` int(11) NOT NULL DEFAULT '0',
  `description` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page_template`
--

LOCK TABLES `core_page_template` WRITE;
/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` VALUES (1,'One column','skin/site/page_template1.html','page_template1.gif'),(2,'Two columns','skin/site/page_template2.html','page_template2.gif'),(3,'Three columns','skin/site/page_template3.html','page_template3.gif'),(4,'1 + 2 columns','skin/site/page_template4.html','page_template4.gif'),(5,'Two equal columns','skin/site/page_template5.html','page_template5.gif'),(6,'Three equal columns','skin/site/page_template6.html','page_template6.gif');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_physical_file`
--

DROP TABLE IF EXISTS `core_physical_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_physical_file` (
  `id_physical_file` int(11) NOT NULL DEFAULT '0',
  `file_value` mediumblob,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_physical_file`
--

LOCK TABLES `core_physical_file` WRITE;
/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` VALUES (125,'<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"locale\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"level\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"must_change_password\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"accessibility_mode\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"date_last_login\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"rights\" />\r\n		<xsl:apply-templates select=\"workgroups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"rights\">\r\n		<xsl:apply-templates select=\"right\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"right\">\r\n		<xsl:text>;\"right:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroups\">\r\n		<xsl:apply-templates select=\"workgroup\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroup\">\r\n		<xsl:text>;\"workgroup:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),(126,'<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>');
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portal_component`
--

DROP TABLE IF EXISTS `core_portal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portal_component` (
  `id_portal_component` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portal_component`
--

LOCK TABLES `core_portal_component` WRITE;
/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` VALUES (0,'Rubrique'),(1,'Article'),(2,'Rubrique Liste Article'),(3,'Menu Init'),(4,'Menu Principal'),(5,'Chemin Page'),(6,'Plan du site'),(7,'Arborescence'),(8,'Plan du site admin');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet`
--

DROP TABLE IF EXISTS `core_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `id_portlet_type` varchar(50) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `name` varchar(70) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `portlet_order` int(11) DEFAULT NULL,
  `column_no` int(11) DEFAULT NULL,
  `id_style` int(11) DEFAULT NULL,
  `accept_alias` smallint(6) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `display_portlet_title` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) DEFAULT NULL,
  `device_display_flags` int(11) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id_portlet`),
  KEY `index_portlet` (`id_page`,`id_portlet_type`,`id_style`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet`
--

LOCK TABLES `core_portlet` WRITE;
/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
INSERT INTO `core_portlet` VALUES (83,'CHILDPAGES_PORTLET',1,'Pages filles','2007-11-24 21:11:33',0,1,5,300,0,'2007-11-24 21:11:33',1,NULL,15),(96,'HTML_PORTLET',1,'Welcome','2018-03-29 16:14:53',0,1,1,100,0,'2018-02-27 03:34:48',1,'none',4369),(112,'HTML_PORTLET',1,'Authentication','2018-03-01 20:24:07',0,1,4,100,0,'2018-03-01 20:24:07',0,'none',4369),(113,'HTML_PORTLET',1,'Back Office','2018-03-28 19:24:53',0,1,3,100,0,'2018-03-01 20:25:43',1,'none',4369),(115,'HTML_PORTLET',7,'Sign Ups','2018-05-03 18:55:57',0,2,1,100,0,'2018-03-29 04:03:31',1,'none',4369),(117,'HTML_PORTLET',7,'Nav Bar','2018-03-29 06:13:23',0,1,1,100,0,'2018-03-29 05:46:07',1,'none',4369),(118,'HTML_PORTLET',8,'Nav Bar','2018-03-29 06:13:37',0,1,1,100,0,'2018-03-29 05:46:32',1,'none',4369),(119,'HTML_PORTLET',8,'Sign Ups','2018-04-26 19:15:49',0,2,1,100,0,'2018-03-29 05:46:56',1,'none',4369),(120,'HTML_PORTLET',9,'Sign Ups','2018-04-26 19:16:08',0,2,1,100,0,'2018-03-29 05:48:05',1,'none',4369),(121,'HTML_PORTLET',9,'Nav Bar','2018-03-29 06:13:52',0,1,1,100,0,'2018-03-29 05:48:51',1,'none',4369),(122,'HTML_PORTLET',10,'Nav Bar','2018-03-29 06:14:40',0,1,1,100,0,'2018-03-29 06:08:21',1,'none',4369),(123,'HTML_PORTLET',10,'Sign Ups','2018-04-26 19:19:57',0,2,1,100,0,'2018-03-29 06:10:54',1,'none',4369),(125,'HTML_PORTLET',2,'Nav Bar','2018-03-29 18:10:40',0,1,1,100,0,'2018-03-29 06:34:30',1,'none',4369),(127,'HTML_PORTLET',12,'Nav Bar','2018-03-29 18:11:03',0,1,1,100,0,'2018-03-29 06:35:59',1,'none',4369),(128,'HTML_PORTLET',2,'Sign Ups','2018-03-29 18:27:32',0,2,1,100,0,'2018-03-29 16:22:37',1,'none',4369),(129,'HTML_PORTLET',13,'Sign Ups','2018-03-29 18:28:11',0,2,1,100,0,'2018-03-29 16:23:11',1,'none',4369),(130,'HTML_PORTLET',13,'Nav Bar','2018-03-29 18:10:52',0,1,1,100,0,'2018-03-29 16:23:44',1,'none',4369),(131,'HTML_PORTLET',12,'Sign Ups','2018-03-29 18:27:53',0,2,1,100,0,'2018-03-29 16:25:54',1,'none',4369),(132,'HTML_PORTLET',6,'Map','2018-03-29 16:52:47',0,1,1,100,0,'2018-03-29 16:29:13',1,'none',4369),(133,'HTML_PORTLET',6,'Specific Contacts','2018-04-26 19:06:52',0,1,2,100,0,'2018-03-29 16:47:12',1,'none',4369),(134,'HTML_PORTLET',14,'TBD','2018-03-29 18:05:16',0,1,1,100,0,'2018-03-29 18:05:16',1,'none',4369),(137,'HTML_PORTLET',17,'TBD','2018-04-26 19:10:41',0,1,1,100,0,'2018-03-29 18:23:51',1,'none',4369),(138,'HTML_PORTLET',18,'Description','2018-04-26 19:11:36',0,1,1,100,0,'2018-03-29 18:24:14',1,'none',4369),(139,'HTML_PORTLET',5,'TBD','2018-04-26 19:27:20',0,1,1,100,0,'2018-03-29 18:37:10',1,'none',4369),(140,'HTML_PORTLET',15,'Desciption','2018-04-05 14:24:29',0,1,1,100,0,'2018-04-05 14:20:51',1,'none',4369),(142,'HTML_PORTLET',16,'Description','2018-04-05 14:27:35',0,1,1,100,0,'2018-04-05 14:27:35',1,'none',4369),(143,'ENROLL_PORTLET',16,'Form','2018-04-05 14:28:36',0,2,1,0,0,'2018-04-05 14:28:36',1,'none',4369),(144,'ENROLL_PORTLET',15,'Enrollment Form','2018-04-25 23:29:09',0,2,1,0,0,'2018-04-25 23:29:09',1,'none',4369),(145,'ENROLL_PORTLET',17,'Enrollment Form','2018-04-26 01:05:01',0,2,1,0,0,'2018-04-26 01:05:01',1,'none',4369),(146,'ENROLL_PORTLET',18,'Enrollment Form','2018-04-26 19:11:46',0,2,1,0,0,'2018-04-26 19:11:42',1,'none',4369),(147,'HTML_PORTLET',19,'Description','2018-04-26 19:14:35',0,1,1,100,0,'2018-04-26 19:14:35',1,'none',4369),(148,'ENROLL_PORTLET',19,'Community Meditation','2018-04-26 19:14:46',0,2,1,0,0,'2018-04-26 19:14:46',1,'none',4369),(149,'HTML_PORTLET',20,'Description','2018-04-26 19:17:29',0,1,1,100,0,'2018-04-26 19:17:29',1,'none',4369),(150,'ENROLL_PORTLET',20,'Enrollment Form','2018-04-26 19:17:38',0,2,1,0,0,'2018-04-26 19:17:38',1,'none',4369),(151,'HTML_PORTLET',21,'Description','2018-04-26 19:21:59',0,1,1,100,0,'2018-04-26 19:20:50',1,'none',4369),(152,'ENROLL_PORTLET',21,'Enrollment Form','2018-04-26 19:21:01',0,2,1,0,0,'2018-04-26 19:21:01',1,'none',4369),(153,'HTML_PORTLET',22,'Description','2018-04-26 19:22:58',0,1,1,100,0,'2018-04-26 19:22:58',1,'none',4369),(154,'HTML_PORTLET',23,'Description','2018-04-26 19:23:39',0,1,1,100,0,'2018-04-26 19:23:39',1,'none',4369),(155,'ENROLL_PORTLET',23,'Enrollment Form','2018-04-26 19:23:48',0,2,1,0,0,'2018-04-26 19:23:48',1,'none',4369),(156,'HTML_PORTLET',24,'Description','2018-04-26 19:24:57',0,1,1,100,0,'2018-04-26 19:24:57',1,'none',4369),(157,'HTML_PORTLET',25,'Description','2018-04-26 19:26:09',0,1,1,100,0,'2018-04-26 19:26:09',1,'none',4369),(158,'ENROLL_PORTLET',25,'Enrollment Form','2018-04-26 19:26:16',0,2,1,0,0,'2018-04-26 19:26:16',1,'none',4369),(159,'ENROLL_PORTLET',5,'Enrollment Form','2018-04-26 19:27:27',0,2,1,0,0,'2018-04-26 19:27:27',1,'none',4369),(160,'HTML_PORTLET',4,'Room reservations','2018-05-03 18:43:53',0,1,1,100,0,'2018-04-26 22:53:32',1,'none',4369);
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_alias`
--

DROP TABLE IF EXISTS `core_portlet_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portlet_alias` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `id_alias` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_alias`
--

LOCK TABLES `core_portlet_alias` WRITE;
/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_type`
--

DROP TABLE IF EXISTS `core_portlet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portlet_type` (
  `id_portlet_type` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `url_creation` varchar(255) DEFAULT NULL,
  `url_update` varchar(255) DEFAULT NULL,
  `home_class` varchar(255) DEFAULT NULL,
  `plugin_name` varchar(50) DEFAULT NULL,
  `url_docreate` varchar(255) DEFAULT NULL,
  `create_script` varchar(255) DEFAULT NULL,
  `create_specific` varchar(255) DEFAULT NULL,
  `create_specific_form` varchar(255) DEFAULT NULL,
  `url_domodify` varchar(255) DEFAULT NULL,
  `modify_script` varchar(255) DEFAULT NULL,
  `modify_specific` varchar(255) DEFAULT NULL,
  `modify_specific_form` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_portlet_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_type`
--

LOCK TABLES `core_portlet_type` WRITE;
/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` VALUES ('ALIAS_PORTLET','portal.site.portletAlias.name','plugins/alias/CreatePortletAlias.jsp','plugins/alias/ModifyPortletAlias.jsp','fr.paris.lutece.portal.business.portlet.AliasPortletHome','alias','plugins/alias/DoCreatePortletAlias.jsp','/admin/portlet/script_create_portlet.html','/admin/portlet/alias/create_portlet_alias.html','','plugins/alias/DoModifyPortletAlias.jsp','/admin/portlet/script_modify_portlet.html','/admin/portlet/alias/modify_portlet_alias.html',''),('APPOINTMENT_FORM_LIST_PORTLET','appointment.portlet.appointmentFormListPortlet.name','plugins/appointment/CreatePortletAppointmentFormList.jsp','plugins/appointment/ModifyPortletAppointmentFormList.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentFormListPortletHome','appointment','plugins/appointment/DoCreatePortletAppointmentFormList.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointmentformlist.html','','plugins/appointment/DoModifyPortletAppointmentFormList.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointmentformlist.html',''),('APPOINTMENT_FORM_PORTLET','appointment.appointmentForm.name','plugins/appointment/CreatePortletAppointmentForm.jsp','plugins/appointment/ModifyPortletAppointmentForm.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentFormPortletHome','appointment','plugins/appointment/DoCreatePortletAppointmentForm.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointmentform.html','','plugins/appointment/DoModifyPortletAppointmentForm.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointmentform.html',''),('APPOINTMENT_PORTLET','appointment.myAppointments.name','plugins/appointment/CreatePortletAppointment.jsp','plugins/appointment/ModifyPortletAppointment.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentPortletHome','appointment','plugins/appointment/DoCreatePortletAppointment.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointment.html','','plugins/appointment/DoModifyPortletAppointment.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointment.html',''),('CALENDAR_PORTLET','calendar.portlet.name','plugins/calendar/CreatePortletCalendar.jsp','plugins/calendar/ModifyPortletCalendar.jsp','fr.paris.lutece.plugins.calendar.business.portlet.CalendarPortletHome','calendar','plugins/calendar/DoCreatePortletCalendar.jsp','/admin/portlet/script_create_portlet.html','','','plugins/calendar/DoModifyPortletCalendar.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/calendar/portlet_modify_calendar.html',''),('CHILDPAGES_PORTLET','childpages.portlet.name','plugins/childpages/CreatePortletChildPages.jsp','plugins/childpages/ModifyPortletChildPages.jsp','fr.paris.lutece.plugins.childpages.business.portlet.ChildPagesPortletHome','childpages','plugins/childpages/DoCreatePortletChildPages.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/childpages/value_id_parent.html','','plugins/childpages/DoModifyPortletChildPages.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/childpages/value_id_parent.html',''),('ENROLL_PORTLET','enroll.portlet.enrollEnrollPortlet.name','plugins/enroll/CreatePortletEnroll.jsp','plugins/enroll/ModifyPortletEnroll.jsp','fr.paris.lutece.plugins.enroll.business.portlet.EnrollPortletHome','enroll','plugins/enroll/DoCreatePortletEnroll.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/enroll/portlet/create_portletenroll.html','','plugins/enroll/DoModifyPortletEnroll.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/enroll/portlet/modify_portletenroll.html',''),('FORM_PORTLET','form.portlet.name','plugins/form/CreateFormPortlet.jsp','plugins/form/ModifyFormPortlet.jsp','fr.paris.lutece.plugins.form.business.portlet.FormPortletHome','form','plugins/form/DoCreateFormPortlet.jsp','','/admin/plugins/form/list_form.html','','plugins/form/DoModifyFormPortlet.jsp','','/admin/plugins/form/list_form.html',''),('HTML_PORTLET','html.portlet.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html',''),('MINI_CALENDAR_PORTLET','calendar.portlet.mini_agenda.name','plugins/calendar/CreatePortletMiniCalendar.jsp','plugins/calendar/ModifyPortletMiniCalendar.jsp','fr.paris.lutece.plugins.calendar.business.portlet.MiniCalendarPortletHome','calendar','plugins/calendar/DoCreatePortletMiniCalendar.jsp','/admin/portlet/script_create_portlet.html','','','plugins/calendar/DoModifyPortletMiniCalendar.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/calendar/portlet_modify_mini_calendar.html','');
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_role`
--

DROP TABLE IF EXISTS `core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_role` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `role_description` varchar(255) DEFAULT NULL,
  `workgroup_key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role`
--

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_search_parameter`
--

DROP TABLE IF EXISTS `core_search_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_search_parameter` (
  `parameter_key` varchar(100) NOT NULL,
  `parameter_value` mediumtext,
  PRIMARY KEY (`parameter_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_search_parameter`
--

LOCK TABLES `core_search_parameter` WRITE;
/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` VALUES ('date_filter','0'),('default_operator','OR'),('help_message','Message d aide pour la recherche'),('taglist',NULL),('tag_filter','0'),('type_filter','none');
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style`
--

DROP TABLE IF EXISTS `core_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_style` (
  `id_style` int(11) NOT NULL DEFAULT '0',
  `description_style` varchar(100) NOT NULL DEFAULT '',
  `id_portlet_type` varchar(50) DEFAULT NULL,
  `id_portal_component` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`),
  KEY `index_style` (`id_portlet_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style`
--

LOCK TABLES `core_style` WRITE;
/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` VALUES (3,'Menu Init','',3),(4,'Main Menu','',4),(5,'Chemin Page','',5),(6,'Plan du site','',6),(7,'Arborescence','',7),(8,'Plan du Site Admin',NULL,8),(100,'DÃ©faut','HTML_PORTLET',0),(101,'Fond colorÃ©','HTML_PORTLET',0),(300,'DÃ©faut','CHILDPAGES_PORTLET',0),(301,'Image + lien','CHILDPAGES_PORTLET',0),(1200,'Calendar-DÃ©faut','CALENDAR_PORTLET',0),(1201,'MiniAgenda','MINI_CALENDAR_PORTLET',0),(1202,'Calendar-Organizedevent','CALENDAR_PORTLET',0),(1500,'DÃ©faut','FORM_PORTLET',0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style_mode_stylesheet`
--

DROP TABLE IF EXISTS `core_style_mode_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_style_mode_stylesheet` (
  `id_style` int(11) NOT NULL DEFAULT '0',
  `id_mode` int(11) NOT NULL DEFAULT '0',
  `id_stylesheet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style_mode_stylesheet`
--

LOCK TABLES `core_style_mode_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` VALUES (100,0,10),(300,0,30),(3,0,211),(4,0,213),(5,0,215),(6,0,217),(7,0,253),(8,1,279),(101,0,285),(1200,0,1200),(1201,0,1201),(1202,0,1202),(1500,0,1500),(301,0,9006),(1500,0,9007);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stylesheet`
--

DROP TABLE IF EXISTS `core_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stylesheet` (
  `id_stylesheet` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `source` mediumblob,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stylesheet`
--

LOCK TABLES `core_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` VALUES (10,'Rubrique HTML - DÃ©faut','portlet_html.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n<xsl:variable name=\"device_class\">\r\n<xsl:choose>\r\n	<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n	<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n	<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n	<xsl:otherwise></xsl:otherwise>\r\n</xsl:choose>\r\n</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n	<xsl:choose>\r\n	<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n	<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:when>\r\n	<xsl:otherwise>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:otherwise>\r\n</xsl:choose>\r\n</div>\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n\r\n\r\n\r\n'),(30,'Rubrique Pages filles - DÃ©faut','portlet_childpages_simple.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n	<div class=\"portlet {$device_class}\">\r\n        <xsl:if test=\"not(string(display-portlet-title)=\'1\')\">\r\n			<div class=\"portlet-header -top\">\r\n				<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n			</div>\r\n        </xsl:if>\r\n		<xsl:if test=\"not(string(display-portlet-title)=\'1\')\">\r\n			<div>\r\n				<xsl:apply-templates select=\"child-pages-portlet\" />\r\n			</div>\r\n        </xsl:if>\r\n		<xsl:if test=\"string(display-portlet-title)=\'1\'\">\r\n			<div class=\"portlet-content\">\r\n				<xsl:apply-templates select=\"child-pages-portlet\" />\r\n			</div>\r\n        </xsl:if>\r\n	</div>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"child-pages-portlet\">\r\n	<ul>\r\n	    <xsl:apply-templates select=\"child-page\" />\r\n	</ul>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"child-page\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={child-page-id}\" target=\"_top\">\r\n			<b><xsl:value-of select=\"child-page-name\" /></b>\r\n		</a><br/>\r\n		<xsl:value-of select=\"child-page-description\" /><br/>\r\n	</li>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>'),(211,'Menu Init','menu_init.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n<br /><br />\r\n	<div id=\"menu-init\">\r\n		<div id=\"menu-init-content\">\r\n            <ul id=\"menu-verti\">\r\n                <xsl:apply-templates select=\"menu\" />\r\n            </ul>\r\n        </div>\r\n     </div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n\r\n    <xsl:if test=\"$index &gt; 7\">\r\n        <li class=\"first-verti\">\r\n        	<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n          		<xsl:value-of select=\"page-name\" />\r\n	        </a>\r\n    	    <xsl:apply-templates select=\"sublevel-menu-list\" />\r\n        </li>\r\n   </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" >\r\n	<ul>\r\n    	<li class=\"last-verti\">\r\n		 	<xsl:apply-templates select=\"sublevel-menu\" />\r\n 	    </li>\r\n    </ul>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n\r\n   <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n		<span><xsl:value-of select=\"page-name\" /></span>\r\n   </a>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(213,'Menu principal','menu_main.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\"\r\n	xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n	<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n	<xsl:template match=\"menu-list\">\r\n		<xsl:apply-templates select=\"menu\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"menu\">\r\n		<li>\r\n			<a href=\"{$site-path}?page_id={page-id}\" class=\"first-level\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n			</a>\r\n		</li>\r\n	</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n'),(215,'Chemin page','page_path.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page_link\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?{page-url}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>'),(217,'Plan du site','site_map.xsl','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page[page-level=0]\">\r\n	<div class=\"span-15 prepend-1 append-1 append-bottom\">\r\n		<div class=\"portlet -lutece-border-radius\">\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level=1]\" >\r\n<ul class=\"site-map-level-one\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"page-image\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	    <xsl:text disable-output-escaping=\"yes\">\r\n		    <![CDATA[<div class=\"clear\">&#160;</div>]]>\r\n	    </xsl:text>\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level=2]\" >\r\n<ul class=\"site-map-level-two\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level>2]\" >\r\n<ul class=\"site-map-level-highest\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page-description\">\r\n	<br /><xsl:value-of select=\".\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=0]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=1]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=2]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"child-pages-list[page-level>2]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page-image\">\r\n	<div class=\"level-one-image\">\r\n    	<div class=\"polaroid\">\r\n		<img  border=\"0\" width=\"80\" height=\"80\" src=\"images/local/data/pages/{.}\" alt=\"\" />\r\n         </div>\r\n	</div >\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>\r\n'),(253,'Pages filles - Arborescence','menu_tree.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n	<xsl:variable name=\"menu-list\" select=\"menu\" />\r\n\r\n	<script type=\"text/javascript\">\r\n		$(document).ready(function(){\r\n			$(\"#tree\").treeview({\r\n				animated: \"fast\",\r\n				collapsed: false,\r\n				unique: true,\r\n				persist: \"cookie\"\r\n			});\r\n		\r\n		});\r\n	</script>    \r\n	\r\n	<!-- Menu Tree -->      \r\n	<xsl:if test=\"not(string(menu)=\'\')\">\r\n	    <xsl:text disable-output-escaping=\"yes\">		    \r\n            <div class=\"tree4\">		\r\n			<h2>&#160;</h2>\r\n			<ul id=\"tree\" class=\"tree4\">\r\n                <xsl:apply-templates select=\"menu\" />        \r\n			</ul>	\r\n			</div>\r\n		 	 <br />\r\n		</xsl:text> \r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n		<li>\r\n    <!--<xsl:if test=\"$index &lt; 7\">-->        \r\n          <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\" >\r\n               <xsl:value-of select=\"page-name\" />\r\n           </a>	   \r\n		   <br />\r\n		   <xsl:value-of select=\"page-description\" />\r\n		   <!--<xsl:value-of select=\"page-description\" /><br />-->		   			\r\n			<xsl:apply-templates select=\"sublevel-menu-list\" /> \r\n			\r\n		</li> 	\r\n    <!--</xsl:if>-->\r\n		\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" > \r\n	\r\n	<xsl:apply-templates select=\"sublevel-menu\" /> 	    	\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n		 <ul >\r\n			<li>\r\n<!--	<span> -->\r\n				<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n				</a>\r\n			</li>			\r\n		</ul>\r\n	<!--</span>	-->\r\n		\r\n   \r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(279,'Plan du Site module d\'Administration','admin_site_map_admin.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n<xsl:variable name=\"current-page-id\" select=\"current-page-id\" />\r\n\r\n<xsl:template match=\"page[page-level=0]\"> \r\n	<div id=\"tree\" class=\"jstree-default\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\" >\r\n			<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\"> \r\n				<strong><xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n				<xsl:value-of select=\"page-role\" /></strong>\r\n			</xsl:if>            \r\n		</a>\r\n		<ul>\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</ul>\r\n	</div>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"page[page-level>0]\" >\r\n	<xsl:variable name=\"index\" select=\"page-id\" />\r\n	<xsl:variable name=\"description\" select=\"page-description\" />\r\n	\r\n	<li id=\"node-{$index}\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\">\r\n		<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\">\r\n				<strong>\r\n				  <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text><xsl:value-of select=\"page-role\" />\r\n				</strong>\r\n			</xsl:if>\r\n		</a>\r\n		<xsl:choose>\r\n			<xsl:when test=\"count(child-pages-list/*)>0\">\r\n				<ul>\r\n				   <xsl:apply-templates select=\"child-pages-list\" />\r\n				</ul>\r\n			</xsl:when>\r\n		   <xsl:otherwise>\r\n				<xsl:apply-templates select=\"child-pages-list\" />\r\n		   </xsl:otherwise>\r\n		</xsl:choose>\r\n	</li>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"child-pages-list\">\r\n	<xsl:apply-templates select=\"page\" />\r\n</xsl:template>\r\n    \r\n</xsl:stylesheet>\r\n'),(285,'Rubrique HTML - Fond colorÃ©','portlet_html_background.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n		<xsl:choose>\r\n			<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h2>\r\n					<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n				</h2>\r\n				<div class=\"portlet-background-content -lutece-border-radius-bottom\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<div class=\"portlet-background-content -lutece-border-radius\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n		</div>\r\n    </div>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>'),(1200,'Calendar-DÃ©faut','portlet_calendar.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n	<xsl:param name=\"site-path\" select=\"site-path\" />\r\n	<xsl:variable name=\"portlet-id\" select=\"portlet/portlet-id\" />\r\n\r\n	<xsl:template match=\"portlet\">\r\n	\r\n		\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n		<div class=\"append-bottom  {$device_class}\">\r\n			<xsl:choose>\r\n				<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n					<h3 class=\"portlet-background-header -lutece-border-radius-top\">\r\n						<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n					</h3>\r\n					<div class=\"portlet-background-content -lutece-border-radius-bottom\" >\r\n						<xsl:apply-templates select=\"calendar-filtered-list\" />\r\n						<xsl:text disable-output-escaping=\"yes\">\r\n							<![CDATA[<div class=\"clear\">&#160;</div>]]>\r\n						</xsl:text>\r\n					</div>\r\n				</xsl:when>\r\n				<xsl:otherwise>\r\n					<div class=\"portlet-background-content -lutece-border-radius\" >\r\n						<xsl:apply-templates select=\"calendar-filtered-list\" />\r\n						<xsl:text disable-output-escaping=\"yes\">\r\n							<![CDATA[<div class=\"clear\">&#160;</div>]]>\r\n						</xsl:text>\r\n					</div>\r\n				</xsl:otherwise>\r\n			</xsl:choose>\r\n		</div>        \r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"calendar-filtered-list\">\r\n		<xsl:apply-templates select=\"events\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"events\">    \r\n		<xsl:apply-templates select=\"event\" /> \r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"event\">\r\n		[\r\n        <xsl:value-of select=\"date-local\" /> \r\n        ]\r\n		<a href=\"{$site-path}?page=calendar&#38;agenda={agenda-id}&#38;date={event-date}\" target=\"_top\" title=\" {agenda-name}:{event-title} \">          \r\n			<xsl:value-of select=\"event-title\" /> \r\n		</a>\r\n		<br />\r\n	</xsl:template>\r\n</xsl:stylesheet>\r\n'),(1201,'Miniagendastylesheet','portlet_mini_calendar.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"html\"/>\r\n	<xsl:variable name=\"url\"><xsl:value-of select=\"portlet/url\"/></xsl:variable>\r\n    <xsl:variable name=\"page-id\"><xsl:value-of select=\"portlet/page-id\"/></xsl:variable>\r\n	<xsl:template match=\"portlet\">\r\n		<link rel=\"stylesheet\"  href=\"css/plugins/calendar/calendar.css\" type=\"text/css\"  media=\"screen\" />\r\n		\r\n		<xsl:apply-templates select=\"top-events\" />\r\n		\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n		<div class=\"portlet-background-content {$device_class} -lutece-border-radius-bottom span-6 calendar-mini\">\r\n			<xsl:apply-templates select=\"month\" />\r\n			<xsl:text disable-output-escaping=\"yes\">\r\n				</xsl:text>\r\n			<xsl:apply-templates select=\"events\" />\r\n		</div>   					\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"month\">\r\n	    <table class=\"calendar-smallmonth\" cellspacing=\"0\">\r\n        <tr>\r\n            <th class=\"calendar-smallmonth\" colspan=\"7\">\r\n            	<a class=\"left\" href=\"{$url}{$page-id}&amp;month=prev\">&lt;&lt;</a>\r\n				<xsl:value-of select=\"month-label\" disable-output-escaping=\"yes\" />\r\n				<a class=\"right\" href=\"{$url}{$page-id}&amp;month=next\">&gt;&gt;</a>\r\n            </th>\r\n        </tr>\r\n		<xsl:apply-templates select=\"weeks\"/>				\r\n		</table>\r\n		<xsl:apply-templates select=\"week-shortcuts\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"weeks\"> \r\n		<tr>\r\n			<xsl:apply-templates select=\"day-label\" />\r\n		</tr>	\r\n		\r\n		<xsl:apply-templates select=\"week\" />\r\n		\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"day-label\">\r\n			<th class=\"calendar-smallmonth\"><xsl:apply-templates /></th>\r\n	</xsl:template> \r\n	\r\n	<xsl:template match=\"week\">    \r\n		<tr>\r\n			<xsl:apply-templates select=\"day\"/> \r\n		</tr>\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"day\">\r\n		<xsl:value-of select=\"day-code\" disable-output-escaping=\"yes\" /> \r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"week-shortcuts\">\r\n		<xsl:apply-templates select=\"week-shortcut\"/> \r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"week-shortcut\">	\r\n			<img height=\"16\" border=\"0\"  width=\"16\" title=\"Agenda\" alt=\"Agenda\" src=\"images/local/skin/plugins/calendar/mini_calendar.png\"/>		\r\n				<xsl:text disable-output-escaping=\"yes\">\r\n						<![CDATA[&nbsp;]]>\r\n				</xsl:text>\r\n			<a href=\"jsp/site/Portal.jsp?page_id={$page-id}&amp;date={week-shortcut-date-start}&amp;date_end={week-shortcut-date-end}\">\r\n			<xsl:value-of select=\"week-shortcut-label\" disable-output-escaping=\"yes\" /></a>				\r\n		<br/>\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"top-events\">	\r\n	<div class=\"span-15\" >\r\n	<div id=\"top-event\" class=\"galleryview\">\r\n		<xsl:apply-templates select=\"top-event\"/>\r\n	</div>\r\n	</div>\r\n	</xsl:template>\r\n	<xsl:template match=\"top-event\">\r\n		<div class=\"panel\">\r\n			<img src=\"image?resource_type=image_event&amp;id={event-id}\" /> \r\n			<div class=\"panel-overlay\">\r\n				<h4><a href=\"jsp/site/Portal.jsp?page=calendar&amp;action=show_result&amp;event_id={event-id}&amp;agenda={agenda-id}\" target=\"_blank\"><xsl:value-of select=\"top-event-title\" disable-output-escaping=\"yes\" /></a></h4>				\r\n			</div>\r\n		</div>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"events\">\r\n		<br/>\r\n		<xsl:apply-templates select=\"event\" /> \r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"event\">\r\n	<div>\r\n		[<xsl:value-of select=\"date\" />\r\n		<xsl:if test=\"date-end != \'\'\">\r\n			-&#160;<xsl:value-of select=\"date-end\" />\r\n		</xsl:if>]\r\n		<span class = \"calendar-event-list-header\">\r\n			<xsl:value-of select=\"event-title\" /> \r\n		</span>\r\n		<xsl:if test=\"not(event-datetime-begin=\'\')\">\r\n			-\r\n			<xsl:value-of select=\"event-datetime-begin\" /> \r\n		</xsl:if> \r\n		:\r\n		<a href=\"jsp/site/Portal.jsp?page=calendar&amp;action=show_result&amp;event_id={event-id}\" target=\"_blank\">\r\n		 	<xsl:value-of select=\"event-description\" /> \r\n		</a>\r\n	</div>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>\r\n'),(1202,'Calendar-Organizedevent','portlet_calendar_organized_events.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n	<xsl:param name=\"site-path\" select=\"site-path\" />\r\n	<xsl:variable name=\"portlet-id\" select=\"portlet/portlet-id\" />\r\n\r\n	<xsl:template match=\"portlet\">\r\n	\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n		<div class=\"{$device_class} append-bottom\" >\r\n			<div class=\"portlet-background-content -lutece-border-radius-bottom span-6 calendar-mini calendar-search-float-left\">\r\n				<xsl:apply-templates select=\"month\" />\r\n				<xsl:text disable-output-escaping=\"yes\">\r\n					</xsl:text>\r\n			</div> \r\n			<div class=\"portlet-background-content -lutece-border-radius calendar-search-float-left span-13\" >\r\n				<xsl:apply-templates select=\"calendar-filtered-list\" />\r\n				<xsl:text disable-output-escaping=\"yes\">\r\n					<![CDATA[<div class=\"clear\">&#160;</div>]]>\r\n				</xsl:text>\r\n			</div>\r\n		</div>\r\n		<div class=\"calendar-clearboth\"></div>        \r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"month\">\r\n	    <table class=\"calendar-smallmonth\" cellspacing=\"0\">\r\n        <tr>\r\n            <th class=\"calendar-smallmonth\" colspan=\"7\">\r\n				<xsl:value-of select=\"month-label\" disable-output-escaping=\"yes\" />\r\n            </th>\r\n        </tr>\r\n		<xsl:apply-templates select=\"weeks\"/>				\r\n		</table>\r\n		<xsl:apply-templates select=\"week-shortcuts\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"weeks\"> \r\n		<tr>\r\n			<xsl:apply-templates select=\"day-label\" />\r\n		</tr>	\r\n		\r\n		<xsl:apply-templates select=\"week\" />\r\n		\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"day-label\">\r\n			<th class=\"calendar-smallmonth\"><xsl:apply-templates /></th>\r\n	</xsl:template> \r\n	\r\n	<xsl:template match=\"week\">    \r\n		<tr>\r\n			<xsl:apply-templates select=\"day\"/> \r\n		</tr>\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"day\">\r\n		<xsl:value-of select=\"day-code\" disable-output-escaping=\"yes\" /> \r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"week-shortcuts\">\r\n		<xsl:apply-templates select=\"week-shortcut\"/> \r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"week-shortcut\">	\r\n			<img height=\"16\" border=\"0\"  width=\"16\" title=\"Agenda\" alt=\"Agenda\" src=\"images/local/skin/plugins/calendar/mini_calendar.png\"/>		\r\n				<xsl:text disable-output-escaping=\"yes\">\r\n						<![CDATA[&nbsp;]]>\r\n				</xsl:text>\r\n			<a href=\"jsp/site/Portal.jsp?page=calendar&amp;action=do_search&amp;date_start={week-shortcut-date-start}&amp;date_end={week-shortcut-date-end}&amp;period={week-shortcut-period}\">\r\n			<xsl:value-of select=\"week-shortcut-label\" disable-output-escaping=\"yes\" /></a>				\r\n			 \r\n		<br/>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"calendar-filtered-list\">\r\n		<xsl:apply-templates select=\"events\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"events\">    \r\n		<xsl:apply-templates select=\"event\" /> \r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"event\">	\r\n		<p class=\"calendar-organized-event\">\r\n	        <a href=\"jsp/site/Portal.jsp?page=calendar&amp;action=show_result&amp;event_id={event-id}&amp;agenda={agenda-id}\" target=\"_blank\">\r\n	        	<xsl:value-of select=\"event-title\" disable-output-escaping=\"yes\" />\r\n	        </a>\r\n        </p>\r\n\r\n	</xsl:template>\r\n</xsl:stylesheet>\r\n'),(9006,'Rubrique Liste de pages filles - Image','portlet_childpages_image.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n		<xsl:if test=\"not(string(display-portlet-title)=\'1\')\">\r\n			<h3>\r\n				<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n			</h3>\r\n		</xsl:if>\r\n		<xsl:if test=\"not(string(display-portlet-title)=\'1\')\">\r\n			<xsl:apply-templates select=\"child-pages-portlet\" />\r\n			<xsl:text disable-output-escaping=\"yes\">\r\n					<![CDATA[<div class=\"clearfix\">&#160;</div>]]>\r\n				</xsl:text>\r\n		</xsl:if>\r\n		<xsl:if test=\"string(display-portlet-title)=\'1\'\">\r\n				<xsl:apply-templates select=\"child-pages-portlet\" />\r\n				<xsl:text disable-output-escaping=\"yes\">\r\n					<![CDATA[<div class=\"clearfix\">&#160;</div>]]>\r\n				</xsl:text>\r\n		</xsl:if>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-portlet\">\r\n	<ul class=\"unstyled\">\r\n		<xsl:apply-templates select=\"child-page\" />\r\n	</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-page\">\r\n	<li>\r\n 		<a href=\"{$site-path}?page_id={child-page-id}\" target=\"_top\">\r\n		<xsl:apply-templates select=\"child-page-image\" />\r\n			<strong><xsl:value-of select=\"child-page-name\" /></strong>\r\n		</a>\r\n		<br />\r\n		<xsl:value-of select=\"child-page-description\" />\r\n	</li>\r\n</xsl:template>\r\n\r\n\r\n<!-- Format image polaroid -->\r\n<xsl:template match=\"child-page-image\">\r\n    <div class=\"img-polaroid span3\">\r\n       <img src=\"{.}\" alt=\"{../child-page-name}\" />\r\n    </div>\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>'),(9007,'Rubrique Formulaire - DÃ©faut','portlet_form.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n<xsl:template match=\"portlet\">\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n	<div class=\"portlet {$device_class}\">\r\n		<xsl:apply-templates select=\"form-portlet\" />\r\n	</div>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"form-portlet\">\r\n	<xsl:apply-templates select=\"form-portlet-content\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"form-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>');
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_template`
--

DROP TABLE IF EXISTS `core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_template` (
  `template_name` varchar(100) NOT NULL,
  `template_value` mediumtext,
  PRIMARY KEY (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_template`
--

LOCK TABLES `core_template` WRITE;
/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` VALUES ('core_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien Ã©tÃ© rÃ©activÃ©. Il est dÃ©sormais valable jusqu\'au ${date_valid}.'),('core_expiration_mail','Bonjour ${first_name} ! Votre compte a expirÃ©. Vous ne pourrez plus vous connecter avec, et les donnÃ©es vous concernant ont Ã©tÃ© anonymisÃ©es'),('core_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive Ã  expiration. Pour prolonger sa validitÃ©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera dÃ©sactivÃ©.'),('core_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive Ã  expiration. Pour prolonger sa validitÃ©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera dÃ©sactivÃ©.'),('core_password_expired','Bonjour ! Votre mot de passe a expirÃ©. Lors de votre prochaine connexion, vous pourrez le changer.');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_text_editor`
--

DROP TABLE IF EXISTS `core_text_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_text_editor` (
  `editor_name` varchar(255) NOT NULL,
  `editor_description` varchar(255) NOT NULL,
  `backOffice` smallint(6) NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_text_editor`
--

LOCK TABLES `core_text_editor` WRITE;
/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` VALUES ('','portal.globalmanagement.editors.labelFrontNoEditor',0),('','portal.globalmanagement.editors.labelBackNoEditor',1),('markitupbbcode','portal.globalmanagement.editors.labelFrontMarkitupBBCode',0),('tinymce','portal.globalmanagement.editors.labelBackTinyMCE',1);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_password_history`
--

DROP TABLE IF EXISTS `core_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_password_history` (
  `id_user` int(11) NOT NULL,
  `password` mediumtext NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_password_history`
--

LOCK TABLES `core_user_password_history` WRITE;
/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_preferences`
--

DROP TABLE IF EXISTS `core_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_preferences` (
  `id_user` varchar(100) NOT NULL,
  `pref_key` varchar(100) NOT NULL,
  `pref_value` mediumtext,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_preferences`
--

LOCK TABLES `core_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_right`
--

DROP TABLE IF EXISTS `core_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_right` (
  `id_right` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_right`
--

LOCK TABLES `core_user_right` WRITE;
/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` VALUES ('APPOINTMENT_CALENDAR_TEMPLATE',1),('APPOINTMENT_CATEGORY_MANAGEMENT',1),('APPOINTMENT_FORM_MANAGEMENT',1),('CORE_ADMINDASHBOARD_MANAGEMENT',1),('CORE_ADMIN_SITE',1),('CORE_CACHE_MANAGEMENT',1),('CORE_DAEMONS_MANAGEMENT',1),('CORE_DASHBOARD_MANAGEMENT',1),('CORE_EXTERNAL_FEATURES_MANAGEMENT',1),('CORE_FEATURES_MANAGEMENT',1),('CORE_GLOBAL_MANAGEMENT',1),('CORE_LEVEL_RIGHT_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',1),('CORE_LOGS_VISUALISATION',1),('CORE_MAILINGLISTS_MANAGEMENT',1),('CORE_MODES_MANAGEMENT',1),('CORE_PAGE_TEMPLATE_MANAGEMENT',1),('CORE_PLUGINS_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',1),('CORE_RBAC_MANAGEMENT',1),('CORE_RIGHT_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',1),('CORE_SEARCH_INDEXATION',1),('CORE_SEARCH_MANAGEMENT',1),('CORE_STYLESHEET_MANAGEMENT',1),('CORE_STYLES_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',1),('CORE_WORKGROUPS_MANAGEMENT',1),('CORE_XSL_EXPORT_MANAGEMENT',1),('ENROLL_MANAGEMENT',1),('FORM_MANAGEMENT',1),('REGULAR_EXPRESSION_MANAGEMENT',1),('WORKFLOW_MANAGEMENT',1);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_role`
--

DROP TABLE IF EXISTS `core_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_role` (
  `role_key` varchar(50) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_role`
--

LOCK TABLES `core_user_role` WRITE;
/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` VALUES ('all_site_manager',1),('calendar_manager',1),('form_manager',1),('form_manager_admin',1),('super_admin',1),('workflow_manager',1);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_xsl_export`
--

DROP TABLE IF EXISTS `core_xsl_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_xsl_export` (
  `id_xsl_export` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `plugin` varchar(255) DEFAULT '',
  PRIMARY KEY (`id_xsl_export`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_xsl_export`
--

LOCK TABLES `core_xsl_export` WRITE;
/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` VALUES (125,'Coeur - Export CSV des administrateurs','Export des utilisateurs back office dans un fichier CSV','csv',125,'core'),(126,'Coeur - Export XML des administrateurs','Export des utilisateurs back office dans un fichier XML','xml',126,'core');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_enrollment`
--

DROP TABLE IF EXISTS `enroll_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll_enrollment` (
  `id_enrollment` int(6) NOT NULL,
  `program` varchar(250) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `phone` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_enrollment`
--

LOCK TABLES `enroll_enrollment` WRITE;
/*!40000 ALTER TABLE `enroll_enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enroll_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_portlet`
--

DROP TABLE IF EXISTS `enroll_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll_portlet` (
  `id_project` int(11) NOT NULL,
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `enroll_feed_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_portlet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_portlet`
--

LOCK TABLES `enroll_portlet` WRITE;
/*!40000 ALTER TABLE `enroll_portlet` DISABLE KEYS */;
INSERT INTO `enroll_portlet` VALUES (2,143,NULL),(0,144,NULL),(0,145,NULL),(0,146,NULL),(0,148,NULL),(0,150,NULL),(0,152,NULL),(0,155,NULL),(0,158,NULL),(0,159,NULL);
/*!40000 ALTER TABLE `enroll_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_project`
--

DROP TABLE IF EXISTS `enroll_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll_project` (
  `id_project` int(6) NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `size` int(6) NOT NULL DEFAULT '0',
  `currentsize` int(6) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_project`
--

LOCK TABLES `enroll_project` WRITE;
/*!40000 ALTER TABLE `enroll_project` DISABLE KEYS */;
INSERT INTO `enroll_project` VALUES (1,'Power Project',20,0,1),(2,'High School Leadership Intern Project',30,0,1),(3,'Summer of Service Excursion',25,0,1),(4,'Youth Workers',50,0,1),(5,'Community Meditation',0,0,1),(6,'Computer Classes',0,0,1),(7,'Family Engagement Night',0,0,1),(8,'Stoop Nights',0,0,1),(9,'Community Clean Ups',0,0,1),(10,'Volunteering',10,0,1);
/*!40000 ALTER TABLE `enroll_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_action`
--

DROP TABLE IF EXISTS `form_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `name_key` varchar(100) DEFAULT NULL,
  `description_key` varchar(100) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `action_permission` varchar(255) DEFAULT NULL,
  `form_state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_action`
--

LOCK TABLES `form_action` WRITE;
/*!40000 ALTER TABLE `form_action` DISABLE KEYS */;
INSERT INTO `form_action` VALUES (1,'form.action.modify.name','form.action.modify.description','jsp/admin/plugins/form/ModifyForm.jsp','edit','MODIFY',0),(2,'form.action.modify.name','form.action.modify.description','jsp/admin/plugins/form/ModifyForm.jsp','edit','MODIFY',1),(3,'form.action.viewRecap.name','form.action.viewRecap.description','jsp/admin/plugins/form/ModifyRecap.jsp','list','MODIFY',0),(4,'form.action.viewRecap.name','form.action.viewRecap.description','jsp/admin/plugins/form/ModifyRecap.jsp','list','MODIFY',1),(5,'form.action.modifyMessage.name','form.action.modifyMessage.description','jsp/admin/plugins/form/ModifyMessage.jsp','comment','MODIFY',0),(6,'form.action.modifyMessage.name','form.action.modifyMessage.description','jsp/admin/plugins/form/ModifyMessage.jsp','comment','MODIFY',1),(7,'form.action.viewResult.name','form.action.viewResult.description','jsp/admin/plugins/form/Result.jsp','tasks','VIEW_RESULT',0),(8,'form.action.viewResult.name','form.action.viewResult.description','jsp/admin/plugins/form/Result.jsp','tasks','VIEW_RESULT',1),(9,'form.action.test.name','form.action.test.description','jsp/admin/plugins/form/TestForm.jsp','cog','TEST',0),(10,'form.action.test.name','form.action.test.description','jsp/admin/plugins/form/TestForm.jsp','cog','TEST',1),(11,'form.action.disable.name','form.action.disable.description','jsp/admin/plugins/form/ConfirmDisableForm.jsp','remove','CHANGE_STATE',1),(12,'form.action.enable.name','form.action.enable.description','jsp/admin/plugins/form/DoEnableForm.jsp','check','CHANGE_STATE',0),(13,'form.action.copy.name','form.action.copy.description','jsp/admin/plugins/form/DoCopyForm.jsp','copy','COPY',0),(14,'form.action.copy.name','form.action.copy.description','jsp/admin/plugins/form/DoCopyForm.jsp','copy','COPY',1),(15,'form.action.manageOutputProcessor.name','form.action.manageOutputProcessor.description','jsp/admin/plugins/form/ManageOutputProcessor.jsp','wrench','MANAGE_OUTPUT_PROCESSOR',1),(16,'form.action.manageOutputProcessor.name','form.action.manageOutputProcessor.description','jsp/admin/plugins/form/ManageOutputProcessor.jsp','wrench','MANAGE_OUTPUT_PROCESSOR',0),(17,'form.action.delete.name','form.action.delete.description','jsp/admin/plugins/form/ConfirmRemoveForm.jsp','trash','DELETE',0),(18,'form.action.disable.name','form.action.disableAuto.description','jsp/admin/plugins/form/ConfirmDisableAutoForm.jsp','check','CHANGE_STATE_AUTO_PUBLICATION',1),(19,'form.action.enable.name','form.action.enableAuto.description','jsp/admin/plugins/form/DoEnableAutoForm.jsp','check','CHANGE_STATE_AUTO_PUBLICATION',0),(20,'form.action.manageValidator.name','form.action.manageValidator.description','jsp/admin/plugins/form/ManageValidator.jsp','check','MANAGE_VALIDATOR',1),(21,'form.action.manageValidator.name','form.action.manageValidator.description','jsp/admin/plugins/form/ManageValidator.jsp','check','MANAGE_VALIDATOR',0);
/*!40000 ALTER TABLE `form_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_anonymize_fields`
--

DROP TABLE IF EXISTS `form_anonymize_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_anonymize_fields` (
  `id_form` int(11) NOT NULL DEFAULT '0',
  `id_entry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_form`,`id_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_anonymize_fields`
--

LOCK TABLES `form_anonymize_fields` WRITE;
/*!40000 ALTER TABLE `form_anonymize_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_anonymize_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_category`
--

DROP TABLE IF EXISTS `form_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_category` (
  `id_category` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_category`
--

LOCK TABLES `form_category` WRITE;
/*!40000 ALTER TABLE `form_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_default_message`
--

DROP TABLE IF EXISTS `form_default_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_default_message` (
  `welcome_message` mediumtext,
  `unavailability_message` mediumtext,
  `requirement_message` mediumtext,
  `recap_message` mediumtext,
  `libelle_validate_button` varchar(255) DEFAULT NULL,
  `libelle_reset_button` varchar(255) DEFAULT NULL,
  `back_url` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_default_message`
--

LOCK TABLES `form_default_message` WRITE;
/*!40000 ALTER TABLE `form_default_message` DISABLE KEYS */;
INSERT INTO `form_default_message` VALUES ('Message de bienvenue','Message d\'indisponibilitÃ©','Conditions d\'utilisation','Message du rÃ©capitulatif','Soumettre','','jsp/site/Portal.jsp?page=form');
/*!40000 ALTER TABLE `form_default_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_entry_parameter`
--

DROP TABLE IF EXISTS `form_entry_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_entry_parameter` (
  `parameter_key` varchar(100) NOT NULL,
  `parameter_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_entry_parameter`
--

LOCK TABLES `form_entry_parameter` WRITE;
/*!40000 ALTER TABLE `form_entry_parameter` DISABLE KEYS */;
INSERT INTO `form_entry_parameter` VALUES ('field_in_line','1'),('file_max_size','2097152'),('height','50'),('height_text_area','5'),('mandatory','0'),('max_files','1'),('max_size_enter','250'),('width','50'),('width_text','0'),('width_text_area','45');
/*!40000 ALTER TABLE `form_entry_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_export_format`
--

DROP TABLE IF EXISTS `form_export_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_export_format` (
  `id_export` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `xsl_file` mediumblob,
  PRIMARY KEY (`id_export`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_export_format`
--

LOCK TABLES `form_export_format` WRITE;
/*!40000 ALTER TABLE `form_export_format` DISABLE KEYS */;
INSERT INTO `form_export_format` VALUES (1,'csv','exporter les rÃ©ponses au format csv','csv','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"text\"/>\r\n\r\n<xsl:template match=\"/\">\r\n	<xsl:apply-templates select=\"form/form-entries/form-entry\" />\r\n	<xsl:text>&#10;</xsl:text>\r\n	<xsl:apply-templates select=\"form/submits/submit\"/>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"form/form-entries/form-entry\">\r\n	<xsl:text>\"</xsl:text>\r\n	<xsl:value-of select=\"form-entry-title\" /> \r\n	<xsl:text>\";</xsl:text>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"form/submits/submit\">\r\n	<xsl:variable name=\"submit-id\" select=\"submit-id\" />\r\n	<xsl:for-each select=\"../../form-entries/form-entry\">\r\n		<xsl:variable name=\"form-entry-id\" select=\"form-entry-id\" />\r\n		<xsl:variable name=\"form-entry-iteration-number\" select=\"form-entry-iteration-number\" />\r\n		<xsl:choose>\r\n			<xsl:when test=\"string(../../submits/submit[submit-id=$submit-id]/questions/question[question-id=$form-entry-id][iteration-number=$form-entry-iteration-number])\">\r\n				<xsl:apply-templates select=\"../../submits/submit[submit-id=$submit-id]/questions/question[question-id=$form-entry-id][iteration-number=$form-entry-iteration-number]\"/>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<xsl:text>\"\";</xsl:text>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n	</xsl:for-each>\r\n	<xsl:text>&#10;</xsl:text>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"questions/question\">\r\n	<xsl:apply-templates select=\"responses\"/> \r\n</xsl:template>\r\n\r\n<xsl:template match=\"questions/question/responses\">\r\n	<xsl:text>\"</xsl:text>\r\n	<xsl:apply-templates select=\"response\"/>\r\n	<xsl:text>\";</xsl:text>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"questions/question/responses/response\">\r\n	<xsl:value-of select=\".\"/>\r\n	<xsl:if test=\"position()!=last()\">\r\n		<xsl:text>;</xsl:text>\r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(2,'xml','exporter les rÃ©ponses au format xml','xml','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"xml\" version=\"1.0\" encoding=\"UTF-8\" indent=\"yes\" cdata-section-elements=\"response question-title form-title\"/>\r\n<xsl:template match=\"/\">\r\n <xsl:apply-templates select=\"form\"/> \r\n</xsl:template>\r\n\r\n<xsl:template match=\"form\">\r\n	<form>\r\n		<form-title>\r\n			<xsl:value-of select=\"form-title\"/>\r\n		</form-title>\r\n		<submits>\r\n			<xsl:apply-templates select=\"submits/submit\"/> \r\n		</submits>\r\n	</form>	\r\n</xsl:template>\r\n\r\n<xsl:template match=\"submit\">\r\n	<submit>\r\n		<submit-id>\r\n			<xsl:value-of select=\"submit-id\"/>\r\n		</submit-id>\r\n		<submit-date>\r\n			<xsl:value-of select=\"submit-date\"/>\r\n		</submit-date>\r\n		<submit-ip>\r\n			<xsl:value-of select=\"submit-ip\"/>\r\n		</submit-ip>\r\n		<questions>\r\n			<xsl:apply-templates select=\"questions/question\"/> \r\n		</questions>\r\n	</submit>\r\n</xsl:template>\r\n<xsl:template match=\"question\">\r\n	<question>\r\n		<question-id>\r\n			<xsl:value-of select=\"question-id\"/>\r\n		</question-id>\r\n		<iteration-number>\r\n			<xsl:value-of select=\"iteration-number\"/>\r\n		</iteration-number>\r\n		<question-title>\r\n			<xsl:value-of select=\"question-title\"/>\r\n		</question-title>\r\n		<responses>\r\n			<xsl:apply-templates select=\"responses/response\"/> \r\n		</responses>\r\n	</question>\r\n</xsl:template>\r\n<xsl:template match=\"response\">\r\n	<response>\r\n		<xsl:value-of select=\".\"/>\r\n	</response>\r\n</xsl:template>\r\n</xsl:stylesheet>'),(3,'csv_daemon','exporter les rÃ©ponses au format csv pour le daemon d\'export','csv','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"text\"/>\r\n\r\n<xsl:template match=\"/\">\r\n	<xsl:apply-templates select=\"form/form-entries/form-entry\" />\r\n	<xsl:text>&#10;</xsl:text>\r\n	<xsl:apply-templates select=\"form/submits/submit\"/>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"form/form-entries/form-entry\">\r\n	<xsl:text>\"</xsl:text>\r\n	<xsl:value-of select=\"form-entry-title\" /> \r\n	<xsl:text>\";</xsl:text>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"form/submits/submit\">\r\n	<xsl:variable name=\"submit-id\" select=\"submit-id\" />\r\n	<xsl:for-each select=\"../../form-entries/form-entry\">\r\n		<xsl:variable name=\"form-entry-id\" select=\"form-entry-id\" />\r\n		<xsl:variable name=\"form-entry-iteration-number\" select=\"form-entry-iteration-number\" />\r\n		<xsl:choose>\r\n			<xsl:when test=\"string(../../submits/submit[submit-id=$submit-id]/questions/question[question-id=$form-entry-id][iteration-number=$form-entry-iteration-number])\">\r\n				<xsl:apply-templates select=\"../../submits/submit[submit-id=$submit-id]/questions/question[question-id=$form-entry-id][iteration-number=$form-entry-iteration-number]\"/>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<xsl:text>\"\";</xsl:text>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n	</xsl:for-each>\r\n	<xsl:text>&#10;</xsl:text>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"questions/question\">\r\n	<xsl:apply-templates select=\"responses\"/> \r\n</xsl:template>\r\n\r\n<xsl:template match=\"questions/question/responses\">\r\n	<xsl:text>\"</xsl:text>\r\n	<xsl:apply-templates select=\"response\"/>\r\n	<xsl:text>\";</xsl:text>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"questions/question/responses/response\">\r\n	<xsl:value-of select=\".\"/>\r\n	<xsl:if test=\"position()!=last()\">\r\n		<xsl:text>;</xsl:text>\r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(4,'xml_daemon','exporter les rÃ©ponses au format XML pour le daemon d\'export','xml','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"xml\" version=\"1.0\" encoding=\"UTF-8\" indent=\"yes\" cdata-section-elements=\"response question-title form-title\"/>\r\n<xsl:template match=\"/\">\r\n <xsl:apply-templates select=\"form\"/> \r\n</xsl:template>\r\n\r\n<xsl:template match=\"form\">\r\n	<form>\r\n		<form-title>\r\n			<xsl:value-of select=\"form-title\"/>\r\n		</form-title>\r\n		<submits>\r\n			<xsl:apply-templates select=\"submits/submit\"/> \r\n		</submits>\r\n	</form>	\r\n</xsl:template>\r\n\r\n<xsl:template match=\"submit\">\r\n	<submit>\r\n		<submit-id>\r\n			<xsl:value-of select=\"submit-id\"/>\r\n		</submit-id>\r\n		<submit-date>\r\n			<xsl:value-of select=\"submit-date\"/>\r\n		</submit-date>\r\n		<submit-ip>\r\n			<xsl:value-of select=\"submit-ip\"/>\r\n		</submit-ip>\r\n		<questions>\r\n			<xsl:apply-templates select=\"questions/question\"/> \r\n		</questions>\r\n	</submit>\r\n</xsl:template>\r\n<xsl:template match=\"question\">\r\n	<question>\r\n		<question-id>\r\n			<xsl:value-of select=\"question-id\"/>\r\n		</question-id>\r\n		<iteration-number>\r\n			<xsl:value-of select=\"iteration-number\"/>\r\n		</iteration-number>\r\n		<question-title>\r\n			<xsl:value-of select=\"question-title\"/>\r\n		</question-title>\r\n		<responses>\r\n			<xsl:apply-templates select=\"responses/response\"/> \r\n		</responses>\r\n	</question>\r\n</xsl:template>\r\n<xsl:template match=\"response\">\r\n	<response>\r\n		<xsl:value-of select=\".\"/>\r\n	</response>\r\n</xsl:template>\r\n</xsl:stylesheet>');
/*!40000 ALTER TABLE `form_export_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_form`
--

DROP TABLE IF EXISTS `form_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_form` (
  `id_form` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `welcome_message` mediumtext,
  `unavailability_message` mediumtext,
  `requirement_message` mediumtext,
  `workgroup` varchar(255) DEFAULT NULL,
  `id_mailing_list` int(11) DEFAULT NULL,
  `active_captcha` smallint(6) DEFAULT NULL,
  `active_store_adresse` smallint(6) DEFAULT NULL,
  `libelle_validate_button` varchar(255) DEFAULT NULL,
  `libelle_reset_button` varchar(255) DEFAULT NULL,
  `date_begin_disponibility` date DEFAULT NULL,
  `date_end_disponibility` date DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `auto_publication` smallint(6) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `limit_number_response` smallint(6) DEFAULT NULL,
  `id_recap` int(11) DEFAULT NULL,
  `active_requirement` smallint(6) DEFAULT NULL,
  `information_1` varchar(255) DEFAULT NULL,
  `information_2` varchar(255) DEFAULT NULL,
  `information_3` varchar(255) DEFAULT NULL,
  `information_4` varchar(255) DEFAULT NULL,
  `information_5` varchar(255) DEFAULT NULL,
  `supports_https` smallint(6) DEFAULT '0',
  `code_theme` varchar(25) DEFAULT NULL,
  `active_mylutece_authentification` smallint(6) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `front_office_title` varchar(255) DEFAULT NULL,
  `is_shown_front_office_title` smallint(6) DEFAULT '0',
  `automatic_cleaning` smallint(6) DEFAULT '0',
  `cleaning_by_removal` smallint(6) DEFAULT '0',
  `nb_days_before_cleaning` int(11) DEFAULT '0',
  `max_number_response` int(11) DEFAULT '0',
  `is_shown_front_office_picture` smallint(6) DEFAULT '0',
  `id_file_front_office_picture` int(11) DEFAULT '0',
  PRIMARY KEY (`id_form`),
  KEY `index_form_form_recap` (`id_recap`),
  KEY `fk_form_form_category` (`id_category`),
  CONSTRAINT `fk_form_form_category` FOREIGN KEY (`id_category`) REFERENCES `form_category` (`id_category`),
  CONSTRAINT `fk_form_form_recap` FOREIGN KEY (`id_recap`) REFERENCES `form_recap` (`id_recap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_form`
--

LOCK TABLES `form_form` WRITE;
/*!40000 ALTER TABLE `form_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_form_parameter`
--

DROP TABLE IF EXISTS `form_form_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_form_parameter` (
  `parameter_key` varchar(100) NOT NULL,
  `parameter_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_form_parameter`
--

LOCK TABLES `form_form_parameter` WRITE;
/*!40000 ALTER TABLE `form_form_parameter` DISABLE KEYS */;
INSERT INTO `form_form_parameter` VALUES ('active_captcha','0'),('active_mylutece_authentification','0'),('active_requirement','1'),('active_store_adresse','0'),('export_csv_encoding','ISO-8859-1'),('export_daemon_type','full'),('export_xml_encoding','UTF-8'),('file_export_daemon_type','form'),('front_office_picture_max_size','2097152'),('id_export_format_daemon','3'),('id_theme_list','blue'),('limit_number_response','0'),('support_https','0');
/*!40000 ALTER TABLE `form_form_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_form_processor`
--

DROP TABLE IF EXISTS `form_form_processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_form_processor` (
  `id_form` int(11) NOT NULL DEFAULT '0',
  `key_processor` varchar(255) NOT NULL,
  PRIMARY KEY (`id_form`,`key_processor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_form_processor`
--

LOCK TABLES `form_form_processor` WRITE;
/*!40000 ALTER TABLE `form_form_processor` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_form_processor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_graph_type`
--

DROP TABLE IF EXISTS `form_graph_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_graph_type` (
  `id_graph_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_graph_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_graph_type`
--

LOCK TABLES `form_graph_type` WRITE;
/*!40000 ALTER TABLE `form_graph_type` DISABLE KEYS */;
INSERT INTO `form_graph_type` VALUES (1,'Histogramme','fr.paris.lutece.plugins.form.business.GraphTypeBarChart'),(2,'Camembert','fr.paris.lutece.plugins.form.business.GraphTypePieChart');
/*!40000 ALTER TABLE `form_graph_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_notify_sender_configuration`
--

DROP TABLE IF EXISTS `form_notify_sender_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_notify_sender_configuration` (
  `id_form` int(11) NOT NULL DEFAULT '0',
  `id_entry_email_sender` int(11) NOT NULL DEFAULT '0',
  `message` mediumtext,
  `send_attachments` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_form`,`id_entry_email_sender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_notify_sender_configuration`
--

LOCK TABLES `form_notify_sender_configuration` WRITE;
/*!40000 ALTER TABLE `form_notify_sender_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_notify_sender_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_portlet`
--

DROP TABLE IF EXISTS `form_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_portlet` (
  `id_portlet` int(11) DEFAULT NULL,
  `id_form` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_portlet`
--

LOCK TABLES `form_portlet` WRITE;
/*!40000 ALTER TABLE `form_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_recap`
--

DROP TABLE IF EXISTS `form_recap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_recap` (
  `id_recap` int(11) NOT NULL DEFAULT '0',
  `back_url` mediumtext,
  `id_graph_type` int(11) DEFAULT NULL,
  `recap_message` mediumtext,
  `recap_data` smallint(6) DEFAULT NULL,
  `graph` smallint(6) DEFAULT NULL,
  `graph_three_dimension` smallint(6) DEFAULT NULL,
  `graph_legende` smallint(6) DEFAULT NULL,
  `graph_value_legende` varchar(255) DEFAULT NULL,
  `graph_label` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_recap`),
  KEY `index_form_recap_graph_type` (`id_graph_type`),
  CONSTRAINT `fk_form_recap_graph_type` FOREIGN KEY (`id_graph_type`) REFERENCES `form_graph_type` (`id_graph_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_recap`
--

LOCK TABLES `form_recap` WRITE;
/*!40000 ALTER TABLE `form_recap` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_recap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_response_submit`
--

DROP TABLE IF EXISTS `form_response_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_response_submit` (
  `id_response` int(11) NOT NULL DEFAULT '0',
  `id_form_submit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_response`,`id_form_submit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_response_submit`
--

LOCK TABLES `form_response_submit` WRITE;
/*!40000 ALTER TABLE `form_response_submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_response_submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_rss_cf`
--

DROP TABLE IF EXISTS `form_rss_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_rss_cf` (
  `id_rss` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL DEFAULT '0',
  `is_submit_rss` smallint(6) NOT NULL DEFAULT '0',
  `id_form_submit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rss`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_rss_cf`
--

LOCK TABLES `form_rss_cf` WRITE;
/*!40000 ALTER TABLE `form_rss_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_rss_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_submit`
--

DROP TABLE IF EXISTS `form_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_submit` (
  `id_form_submit` int(11) NOT NULL DEFAULT '0',
  `date_response` timestamp NULL DEFAULT NULL,
  `day_date_response` smallint(6) DEFAULT NULL,
  `week_date_response` smallint(6) DEFAULT NULL,
  `month_date_response` smallint(6) DEFAULT NULL,
  `year_date_response` smallint(6) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `id_form` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_form_submit`),
  KEY `index_form_submit_form` (`id_form`),
  CONSTRAINT `fk_form_submit_form` FOREIGN KEY (`id_form`) REFERENCES `form_form` (`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_submit`
--

LOCK TABLES `form_submit` WRITE;
/*!40000 ALTER TABLE `form_submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry`
--

DROP TABLE IF EXISTS `genatt_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_entry` (
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) NOT NULL,
  `id_type` int(11) NOT NULL DEFAULT '0',
  `id_parent` int(11) DEFAULT NULL,
  `title` mediumtext,
  `code` varchar(20) DEFAULT NULL,
  `help_message` mediumtext,
  `comment` mediumtext,
  `mandatory` smallint(6) DEFAULT NULL,
  `fields_in_line` smallint(6) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `id_field_depend` int(11) DEFAULT NULL,
  `confirm_field` smallint(6) DEFAULT NULL,
  `confirm_field_title` mediumtext,
  `field_unique` smallint(6) DEFAULT NULL,
  `map_provider` varchar(45) DEFAULT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `pos_conditional` int(11) DEFAULT '0',
  `error_message` mediumtext,
  `num_row` smallint(6) DEFAULT '0',
  `num_column` smallint(6) DEFAULT '0',
  `is_role_associated` smallint(6) DEFAULT '0',
  `is_only_display_back` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_entry`),
  KEY `index_genatt_entry_resource` (`id_resource`),
  KEY `index_genatt_entry_parent` (`id_parent`),
  KEY `fk_genatt_entry_type` (`id_type`),
  CONSTRAINT `fk_genatt_entry_type` FOREIGN KEY (`id_type`) REFERENCES `genatt_entry_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry`
--

LOCK TABLES `genatt_entry` WRITE;
/*!40000 ALTER TABLE `genatt_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry_type`
--

DROP TABLE IF EXISTS `genatt_entry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_entry_type` (
  `id_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `is_group` smallint(6) DEFAULT NULL,
  `is_comment` int(11) DEFAULT NULL,
  `is_mylutece_user` smallint(6) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `plugin` varchar(255) NOT NULL,
  PRIMARY KEY (`id_type`),
  KEY `index_genatt_entry_type_plugin` (`plugin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry_type`
--

LOCK TABLES `genatt_entry_type` WRITE;
/*!40000 ALTER TABLE `genatt_entry_type` DISABLE KEYS */;
INSERT INTO `genatt_entry_type` VALUES (101,'Bouton radio',0,0,0,'appointment.entryTypeRadioButton','appointment'),(102,'Case Ã  cocher',0,0,0,'appointment.entryTypeCheckBox','appointment'),(103,'Commentaire',0,1,0,'appointment.entryTypeComment','appointment'),(104,'Date',0,0,0,'appointment.entryTypeDate','appointment'),(105,'Liste dÃ©roulante',0,0,0,'appointment.entryTypeSelect','appointment'),(106,'Zone de texte court',0,0,0,'appointment.entryTypeText','appointment'),(107,'Zone de texte long',0,0,0,'appointment.entryTypeTextArea','appointment'),(108,'NumÃ©rotation',0,0,0,'appointment.entryTypeNumbering','appointment'),(109,'Regroupement',1,0,0,'appointment.entryTypeGroup','appointment'),(110,'Liste dÃ©roulante SQL',0,0,0,'appointment.entryTypeSelectSQL','appointment'),(111,'GÃ©olocalisation',0,0,0,'appointment.entryTypeGeolocation','appointment'),(112,'Session',0,0,0,'appointment.entryTypeSession','appointment'),(113,'Utilisateur MyLutece',0,0,1,'appointment.entryTypeMyLuteceUser','appointment'),(114,'Image',0,0,0,'appointment.entryTypeImage','appointment'),(115,'Fichier',0,0,0,'appointment.entryTypeFile','appointment'),(116,'NumÃ©ro de tÃ©lÃ©phone',0,0,0,'appointment.entryTypePhone','appointment');
/*!40000 ALTER TABLE `genatt_entry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_field`
--

DROP TABLE IF EXISTS `genatt_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_field` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `value` mediumtext,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `default_value` smallint(6) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint(6) DEFAULT NULL,
  `comment` mediumtext,
  `role_key` varchar(50) DEFAULT NULL,
  `image_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_field`),
  KEY `index_genatt_field_entry` (`id_entry`),
  CONSTRAINT `fk_genatt_field_entry` FOREIGN KEY (`id_entry`) REFERENCES `genatt_entry` (`id_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_field`
--

LOCK TABLES `genatt_field` WRITE;
/*!40000 ALTER TABLE `genatt_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_response`
--

DROP TABLE IF EXISTS `genatt_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_response` (
  `id_response` int(11) NOT NULL DEFAULT '0',
  `response_value` mediumtext,
  `id_entry` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id_response`),
  KEY `index_genatt_response_entry` (`id_entry`),
  CONSTRAINT `fk_genatt_response_entry` FOREIGN KEY (`id_entry`) REFERENCES `genatt_entry` (`id_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_response`
--

LOCK TABLES `genatt_response` WRITE;
/*!40000 ALTER TABLE `genatt_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_verify_by`
--

DROP TABLE IF EXISTS `genatt_verify_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_verify_by` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_expression` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`,`id_expression`),
  KEY `index_genatt_verify_by_field` (`id_field`),
  CONSTRAINT `fk_genatt_verify_by_field` FOREIGN KEY (`id_field`) REFERENCES `genatt_field` (`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_verify_by`
--

LOCK TABLES `genatt_verify_by` WRITE;
/*!40000 ALTER TABLE `genatt_verify_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_verify_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `html_portlet`
--

DROP TABLE IF EXISTS `html_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `html_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `html` mediumtext,
  PRIMARY KEY (`id_portlet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `html_portlet`
--

LOCK TABLES `html_portlet` WRITE;
/*!40000 ALTER TABLE `html_portlet` DISABLE KEYS */;
INSERT INTO `html_portlet` VALUES (96,'<div class=\"jumbotron\"> \n <h3 style=\"text-align: center;\">Welcome to the scheduling portal for St. Francis Neighborhood Center!</h3> \n <p>&nbsp;</p> \n <p style=\"text-align: center;\">On this portal, you may browse through the various programs, activities, volunteering opportunities, and other events the center provides. You may submit your enrollment applications, sign up for activities, reserve rooms, and join mailiing lists. Please follow the tabs above to view more information.</p> \n <p style=\"text-align: center;\">Feel free to contact us if you have any questions or run into any difficulties!</p> \n <p style=\"text-align: center;\">Click <a style=\"text-decoration: none;\" href=\"http://stfranciscenter.org\"><button class=\"btn btn-success\" type=\"button\">here</button></a> to view our main website.</p> \n</div> \n<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"2000\"> \n <ol class=\"carousel-indicators\"> \n  <li class=\"active\" data-target=\"#myCarousel\" data-slide-to=\"0\">&nbsp;</li> \n  <li data-target=\"#myCarousel\" data-slide-to=\"1\">&nbsp;</li> \n  <li data-target=\"#myCarousel\" data-slide-to=\"2\">&nbsp;</li> \n </ol> \n <div class=\"carousel-inner\"> \n  <div class=\"item active\">\n   <img style=\"width: 100%;\" src=\"images/local/skin/carousel1.jpg\">\n  </div> \n  <div class=\"item\">\n   <img style=\"width: 100%;\" src=\"images/local/skin/carousel2.png\">\n  </div> \n  <div class=\"item\">\n   <img style=\"width: 100%;\" src=\"images/local/skin/carousel3.jpg\">\n  </div> \n </div> \n <a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\"> <span class=\"glyphicon glyphicon-chevron-left\">&nbsp;</span> <span class=\"sr-only\">Previous</span> </a> \n <a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\"> <span class=\"glyphicon glyphicon-chevron-right\">&nbsp;</span> <span class=\"sr-only\">Next</span> </a>\n</div> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p>'),(112,''),(113,'<h3 style=\"text-align: right;\">Back Office</h3> \n<p style=\"text-align: right;\">&nbsp;</p> \n<p style=\"text-align: right;\"><a style=\"text-decoration: none;\" href=\"jsp/admin/AdminMenu.jsp\"><button class=\"btn btn-info\" type=\"button\">Login</button></a></p>'),(115,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=11\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/yoga.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=11\">SUNDAY MORNING YOGA</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=12\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/nightyoga.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=12\">WEDNESDAY NIGHT YOGA</a>\n  </div> \n </div> \n</div> \n<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=2\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/narcotics.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=2\">NARCOTICS ANONYMOUS</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=19\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/meditation.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=19\">COMMUNITY MEDITATION</a>\n  </div> \n </div> \n</div> \n<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=13\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/zumba.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=13\">ZUMBA</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=14\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/groceries.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=14\">NUTRITION</a>\n  </div> \n </div> \n</div>'),(117,'<div class=\"row\"> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n <div class=\"cold-md-6\"> \n  <ul class=\"nav nav-pills\"> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=8\">Mental &amp; Physical Health</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=9\">Professional Assistance</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=10\">Community Events</a></li> \n  </ul> \n </div> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n</div>'),(118,'<div class=\"row\"> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n <div class=\"cold-md-6\"> \n  <ul class=\"nav nav-pills\"> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=8\">Mental &amp; Physical Health</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=9\">Professional Assistance</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=10\">Community Events</a></li> \n  </ul> \n </div> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n</div>'),(119,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=11\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/yoga.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=11\">SUNDAY MORNING YOGA</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=12\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/nightyoga.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=12\">WEDNESDAY NIGHT YOGA</a>\n  </div> \n </div> \n</div> \n<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=2\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/narcotics.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=2\">NARCOTICS ANONYMOUS</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=19\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/meditation.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=19\">COMMUNITY MEDITATION</a>\n  </div> \n </div> \n</div>'),(120,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=1\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/lab.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=1\">COMPUTER LAB</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=20\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/classes.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=20\">COMPUTER CLASSES</a>\n  </div> \n </div> \n</div>'),(121,'<div class=\"row\"> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n <div class=\"cold-md-6\"> \n  <ul class=\"nav nav-pills\"> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=8\">Mental &amp; Physical Health</a></li> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=9\">Professional Assistance</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=10\">Community Events</a></li> \n  </ul> \n </div> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n</div>'),(122,'<div class=\"row\"> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n <div class=\"col-md-6\"> \n  <ul class=\"nav nav-pills\"> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=8\">Mental &amp; Physical Health</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=9\">Professional Assistance</a></li> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=10\">Community Events</a></li> \n  </ul> \n </div> \n <div class=\"col-md-3\">\n  &nbsp;\n </div> \n</div>'),(123,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=21\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/family.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=21\">FAMILY ENGAGEMENT NIGHT</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=22\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/groceries.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=22\">CORPUS CHRISTI GROCERY PROGRAM</a>\n  </div> \n </div> \n</div> \n<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=23\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/stoop.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=23\">STOOP NIGHTS</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=24\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/fair.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=24\">RESERVOIR HILL RESOURCE FAIR</a>\n  </div> \n </div> \n</div> \n<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=25\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/clean.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=25\">COMMUNITY CLEAN UPS</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  &nbsp;\n </div> \n</div>'),(125,'<div class=\"row\"> \n <div class=\"col-md-5\">\n  &nbsp;\n </div> \n <div class=\"cold-md-2\"> \n  <ul class=\"nav nav-pills\"> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=13\">School Year</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=12\">Summer</a></li> \n  </ul> \n </div> \n <div class=\"col-md-5\">\n  &nbsp;\n </div> \n</div>'),(127,'<div class=\"row\"> \n <div class=\"col-md-5\">\n  &nbsp;\n </div> \n <div class=\"cold-md-2\"> \n  <ul class=\"nav nav-pills\"> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=13\">School Year</a></li> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=12\">Summer</a></li> \n  </ul> \n </div> \n <div class=\"col-md-5\">\n  &nbsp;\n </div> \n</div>'),(128,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=15\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/power.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=15\">POWER PROJECT</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=16\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/highschool.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=16\">HIGH SCHOOL INTERN LEADERSHIP PROGRAM</a>\n  </div> \n </div> \n</div>'),(129,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=15\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/power.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=15\">POWER PROJECT</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=16\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/highschool.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=16\">HIGH SCHOOL INTERN LEADERSHIP PROGRAM</a>\n  </div> \n </div> \n</div>'),(130,'<div class=\"row\"> \n <div class=\"col-md-5\">\n  &nbsp;\n </div> \n <div class=\"cold-md-2\"> \n  <ul class=\"nav nav-pills\"> \n   <li class=\"active\"><a href=\"jsp/site/Portal.jsp?page_id=13\">School Year</a></li> \n   <li><a href=\"jsp/site/Portal.jsp?page_id=12\">Summer</a></li> \n  </ul> \n </div> \n <div class=\"col-md-5\">\n  &nbsp;\n </div> \n</div>'),(131,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=17\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/service.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=17\">SUMMER OF SERVICE EXCURSION</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page_id=18\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/workers.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page_id=18\">YOUTH WORKERS</a>\n  </div> \n </div> \n</div>'),(132,'<div class=\"jumbotron\"> \n <p style=\"text-align: center;\">Do not hesitate to contact us if you have any questions or difficulties navigating the portal.</p> \n <p style=\"text-align: center;\">Phone: (410) 669-2612</p> \n <p style=\"text-align: center;\">Email: <em><a href=\"mailto:info@stfranciscenter.org\">info@stfranciscenter.org</a>&nbsp;</em></p> \n</div> \n<p style=\"text-align: center;\"><iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.8556793258686!2d-76.63773788456548!3d39.314194779508654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c804c9619ba81f%3A0x34a3a2a41ecee5b4!2sSt.+Francis+Neighborhood+Center!5e0!3m2!1sen!2sus!4v1522342142701\" width=\"400\" height=\"300\" frameborder=\"0\"></iframe></p>'),(133,'<div class=\"jumbotron\"> \n <p style=\"text-align: center;\">Youth Development Programs: <em><a href=\"mailto:jchildress@stfranciscenter.org\"><button class=\"btn btn-info\" type=\"button\">Jessica Childress</button></a>&nbsp;</em></p> \n <p style=\"text-align: center;\">High School Programs: <em><a href=\"mailto:emayock@stfranciscenter.org\"><button class=\"btn btn-info\" type=\"button\">Emily Mayock</button></a>&nbsp;</em></p> \n <p style=\"text-align: center;\">Family Resources: <em><a href=\"mailto:sdickerson@stfranciscenter.org\"><button class=\"btn btn-info\" type=\"button\">Shawnda Dickerson</button></a>&nbsp;</em></p> \n <p style=\"text-align: center;\">Donations and Fundraising: <em><a href=\"mailto:mruhnke@stfranciscenter.org\"><button class=\"btn btn-info\" type=\"button\">Morganne Ruhnke</button></a>&nbsp;</em></p> \n <p style=\"text-align: center;\">Room Reservations: <em><a href=\"mailto:tgreen@stfranciscenter.org\"><button class=\"btn btn-info\" type=\"button\">Torbin Green</button></a>&nbsp;</em></p> \n</div>'),(134,'<div class=\"jumbotron\"> \n <p>Under development. Please check back later!</p> \n</div>'),(137,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Summer of Service Excursion</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Description TBA</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(138,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Youth Workers</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Description TBA</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(139,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Volunteering</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>We wouldn\'t be able to do it all without our volunteers! Please enroll below if you would like to be on the mailing list for volunteering opportunities. We will contact you when the next opportunity is coming up!</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(140,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Power Project</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>The Power Project consists of three major components: education, mentoring, and the arts. This program provides disadvantaged youth living below poverty in the Reservoir Hill neighborhood, ages 5 to 15, with the opportunity to receive academic enrichment, one-on-one tutoring, attend educational seminars and workshops, participate in our dance, art and music groups, and establish valuable relationships with caring and responsible individuals who will serve as positive role models in their lives.</p> \n     <p>The after school program is at no cost to youth and families and is held at the Center Monday through Thursday from 3:00 to 6:15 pm during the school year with snacks and dinner provided. The program can accommodate on average, 50 children at a time.</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(142,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span>High School Leadership Intern Project</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Desciption TBA</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(147,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Community Meditation</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Please enroll below if you would like to be on our mailing list for community meditations. We will contact you when the next session is coming up!</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(149,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Computer Classes</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Please enroll below if you would like to be on our mailing list for computer classes. These classes help you prepare for job interviews, as well as use technology on everyday basis. We will contact you when the next class is coming up!</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(151,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Family Engagement Night</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Please enroll below if you would like to be on our mailing list for family engagement nights. We will contact you when the next engagement night is coming up!</p> \n     <p>Note: These nights are only for families of students who are enrolled in our youth development programs.</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(153,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Corpus Christi Grocery Program</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Corpus Christi Grocery Program takes place every Monday at 9am. There\'s no need to sign up. We work on the first come - first serve basis.</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(154,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Stoop Nights</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>Please enroll below if you would like to be on our mailing list for stoop nights. We will contact you when the next event is coming up!</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(156,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Reservoir Hill Resource Fair</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>The next Reservoir Hill Resource Fair will be taking place on August 19-21. It is open to all! Please come by and have fun!</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(157,'<div class=\"row nextStepTitleRow\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container\"> \n   <h2 class=\"stepTitle next\"><span class=\"stepTitleNumber previous\"><em class=\"fa fa-check\">&nbsp;</em></span> Community Clean Ups</h2> \n  </div> \n </div> \n</div> \n<div class=\"row steps\"> \n <div class=\"col-xs-12\"> \n  <div class=\"container recap\"> \n   <div class=\"row\"> \n    <div class=\"col-xs-12 col-sm-9 col-md-9\"> \n     <p>We rely on and appreciate all the help that our residents provide to keep St Francis clean. Please enroll below if you would like to be on the mailing list for community clean ups. We will contact you when the next event is coming up!</p> \n    </div> \n    <div class=\"col-xs-12 col-sm-4 col-md-3 stepRecapButtonMargin\">\n     &nbsp;\n    </div> \n   </div> \n  </div> \n </div> \n</div>'),(160,'<p>&nbsp;</p> \n<div class=\"row\" style=\"width: 100%;\"> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=7\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/power.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=7\">1st FLOOR MEETING ROOM RESERVATIONS</a>\n  </div> \n </div> \n <div class=\"col-md-6\" style=\"position: relative; text-align: center;\">\n  <a href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=6\"><img class=\"img-rounded\" style=\"width: 75%; filter: brightness(50%);\" src=\"images/local/skin/highschool.jpg\"></a> \n  <div class=\"centered\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\n   <a style=\"text-decoration: none; font-size: 250%; color: white;\" href=\"jsp/site/Portal.jsp?page=appointment&amp;view=getViewAppointmentCalendar&amp;id_form=6\">MULTI-PURPOSE ROOM RESERVATIONS</a>\n  </div> \n </div> \n</div>');
/*!40000 ALTER TABLE `html_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regularexpression_regular_expression`
--

DROP TABLE IF EXISTS `regularexpression_regular_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regularexpression_regular_expression` (
  `id_expression` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `regular_expression_value` mediumtext,
  `valid_exemple` mediumtext,
  `information_message` mediumtext,
  `error_message` mediumtext,
  PRIMARY KEY (`id_expression`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regularexpression_regular_expression`
--

LOCK TABLES `regularexpression_regular_expression` WRITE;
/*!40000 ALTER TABLE `regularexpression_regular_expression` DISABLE KEYS */;
INSERT INTO `regularexpression_regular_expression` VALUES (1,'Fichier JPG','image/jpeg','image/jpeg','Expression rÃ©guliÃ¨re pour les fichiers de type jpeg.','Le format du fichier n\'est pas valide. Veuillez choisir une image de type jpeg.'),(2,'Email','(^([a-zA-Z0-9]+(([\\.\\-\\_]?[a-zA-Z0-9]+)+)?)\\@(([a-zA-Z0-9]+[\\.\\-\\_])+[a-zA-Z]{2,4})$)|(^$)','admin@lutece.fr','Expression rÃ©guliÃ¨re pour les emails.','Le format de l\'email est incorrect.');
/*!40000 ALTER TABLE `regularexpression_regular_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action`
--

DROP TABLE IF EXISTS `workflow_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `id_workflow` int(11) DEFAULT NULL,
  `id_state_before` int(11) DEFAULT NULL,
  `id_state_after` int(11) DEFAULT NULL,
  `id_icon` int(11) DEFAULT NULL,
  `is_automatic` smallint(6) DEFAULT '0',
  `is_mass_action` smallint(6) DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  `is_automatic_reflexive_action` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_action`),
  KEY `action_id_workflow_fk` (`id_workflow`),
  KEY `action_id_state_before_fk` (`id_state_before`),
  KEY `action_id_state_after_fk` (`id_state_after`),
  KEY `action_id_icon_fk` (`id_icon`),
  CONSTRAINT `fk_action_id_icon` FOREIGN KEY (`id_icon`) REFERENCES `workflow_icon` (`id_icon`),
  CONSTRAINT `fk_action_id_state_after` FOREIGN KEY (`id_state_after`) REFERENCES `workflow_state` (`id_state`),
  CONSTRAINT `fk_action_id_state_before` FOREIGN KEY (`id_state_before`) REFERENCES `workflow_state` (`id_state`),
  CONSTRAINT `fk_action_id_workflow` FOREIGN KEY (`id_workflow`) REFERENCES `workflow_workflow` (`id_workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action`
--

LOCK TABLES `workflow_action` WRITE;
/*!40000 ALTER TABLE `workflow_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action_action`
--

DROP TABLE IF EXISTS `workflow_action_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_action_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `id_linked_action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`,`id_linked_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action_action`
--

LOCK TABLES `workflow_action_action` WRITE;
/*!40000 ALTER TABLE `workflow_action_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assignment_history`
--

DROP TABLE IF EXISTS `workflow_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assignment_history` (
  `id_history` int(11) NOT NULL DEFAULT '0',
  `id_task` int(11) NOT NULL,
  `workgroup_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`workgroup_key`),
  KEY `assignment_id_history_fk` (`id_history`),
  KEY `assignment_id_task_fk` (`id_task`),
  CONSTRAINT `fk_assignment_id_history` FOREIGN KEY (`id_history`) REFERENCES `workflow_resource_history` (`id_history`),
  CONSTRAINT `fk_assignment_id_task` FOREIGN KEY (`id_task`) REFERENCES `workflow_task` (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assignment_history`
--

LOCK TABLES `workflow_assignment_history` WRITE;
/*!40000 ALTER TABLE `workflow_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_icon`
--

DROP TABLE IF EXISTS `workflow_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(50) DEFAULT NULL,
  `file_value` mediumblob,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_icon`
--

LOCK TABLES `workflow_icon` WRITE;
/*!40000 ALTER TABLE `workflow_icon` DISABLE KEYS */;
INSERT INTO `workflow_icon` VALUES (1,'Valider','image/png','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0×©ï¿½ï¿½\0\0ï¿½PLTEï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ó²ï¿½Û³ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îï¿½ï¿½wï¿½ï¿½cï¿½ï¿½}}}O~ï¿½Gqï¿½NNN\rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Êºï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ã¯ï¿½Ï­ï¿½Ø©ï¿½Ö¤ï¿½Õ£ï¿½Ô´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ç§ï¿½ï¿½ï¿½ï¿½Éï¿½É£ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½Âï¿½ï¿½zï¿½ï¿½xï¿½ï¿½vï¿½ï¿½ï¿½ï¿½ï¿½rï¿½ï¿½ï¿½ï¿½ï¿½fï¿½ï¿½bï¿½ï¿½_ï¿½ï¿½]ï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½ï¿½Xï¿½ï¿½Wï¿½ï¿½Uï¿½ï¿½Tï¿½ï¿½yyywwwuuuN}ï¿½sssLyï¿½nnnItï¿½Hsï¿½Grï¿½[htGlï¿½Bjï¿½Biï¿½___@fï¿½]^^=bï¿½<`ï¿½VY[<_~PZ`VVV5VtOOOKOR3Rn3Qk2Qm@LT:M^HHH<AC<?A)AX<<<1>I(=Q&<Q$:O\'9J&9I$7I,5;-01!2B&08,,,-=+:\'\'\'#(,%%%$$$(	ï¿½S%\0\0\0tRNS\0@ï¿½ï¿½f\0\0\0ï¿½IDATxï¿½c`ï¿½ï¿½ï¿½Fflï¿½\\bb\Zï¿½X$llï¿½Kx90ï¿½\rï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½)ï¿½Uï¿½/ï¿½fï¿½ï¿½Ueâºï¿½\Zï¿½ï¿½uï¿½;yYï¿½|V&ï¿½\Zï¿½S?ï¿½Xuï¿½7Øï¿½ï¿½Yï¿½6ï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½5pVï¿½ï¿½;ï¿½10ï¿½ï¿½ï¿½ï¿½ï¿½r#ï¿½fvï¿½ï¿½ï¿½ï¿½cï¿½rï¿½Îï¿½Ædï¿½tï¿½ï¿½gï¿½OtOX{ï¿½ï¿½J\05\nï¿½ï¿½ï¿½ï¿½L\nTFq+Kzï¿½ï¿½ï¿½ï¿½}Tmï¿½ï¿½[BBEï¿½%R5Ñï¿½É®N$&ï¿½Rï¿½Iï¿½ï¿½2i	ï¿½z,ï¿½ï¿½ï¿½Uï¿½!é¢%ï¿½Ù\'Gpï¿½`ï¿½:%v5Viï¿½ï¿½ï¿½\0\0ï¿½K+ï¿½; ï¿½ï¿½\0\0\0\0IENDï¿½B`ï¿½',14,14),(2,'Refuser','image/png','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0×©ï¿½ï¿½\0\0CPLTEï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½L6ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½;\"ï¿½:\"ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ç´ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Å¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½xhqqqï¿½N7ï¿½M7ï¿½M6mmmï¿½;\"ï¿½;\"ï¿½;\"___ï¿½;\"ï¿½;\"ï¿½;\"ï¿½;$ï¿½9\"\\\\\\ï¿½8!WWWTTTï¿½.NL<--ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½pï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½p[ï¿½o[ï¿½raï¿½raï¿½ï¿½ï¿½ï¿½m[ï¿½n^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fSï¿½cNï¿½_I~~~zzzï¿½cTxxxvvvï¿½VAï¿½R:tttï¿½[Jrrrnnnï¿½M6llljjjï¿½F/ï¿½A)cccï¿½F2ï¿½?\'ï¿½?(ï¿½=%ï¿½;\"ï¿½>\'ï¿½<$ï¿½=&ï¿½:\"ï¿½:#ï¿½9\"ï¿½9\"ï¿½7 ï¿½6 ï¿½:&ï¿½5!QQQï¿½1ï¿½1ï¿½/ï¿½0ï¿½/ï¿½/ï¿½,ï¿½&ï¿½&>>>P3.;86e$F/*\\%50.W!B 9\";\Z&&&<N\rI$$$3A7\Z5.- ,.107%\Z&\Z/$(\n\"\r#%\n,!			Vï¿½o\0\0\0tRNS\0@ï¿½ï¿½f\0\0sIDATxï¿½c`ï¿½.ï¿½ï¿½fcï¿½qï¿½ï¿½1sï¿½kï¿½ï¿½AØKï¿½qAï¿½ï¿½fï¿½dï¿½ï¿½r0Ù¾kSï¿½7Kï¿½1ï¿½%ï¿½eï¿½ï¿½Yï¿½\nq00ï¿½.ï¿½ï¿½4ï¿½ï¿½ï¿½\rï¿½ï¿½<ï¿½ESK}Fï¿½8ï¿½ï¿½ï¿½xï¿½Iï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½YxxXfï¿½lInï¿½ï¿½ï¿½Lï¿½jWï¿½5ï¿½ï¿½ï¿½ï¿½è®ï¿½ï¿½;ï¿½ï¿½ï¿½`Ndï¿½ï¿½bï¿½ï¿½7,*ï¿½ï¿½Wï¿½ ï¿½ï¿½\nw/+{ï¿½%/ï¿½jë¶©ï¿½ï¿½ï¿½ï¿½H^ï¿½ï¿½6Zï¿½ï¿½ï¿½ï¿½klï¿½!iï¿½ï¿½w&ï¿½\rï¿½5Mï¿½ï¿½zmVï¿½ÜH>ï¿½ï¿½k\'l-ï¿½ï¿½nï¿½ï¿½fGØï¿½PÙ wwï¿½ï¿½(ï¿½ï¿½-kï¿½ï¿½ï¿½Êï¿½ï¿½lï¿½\'[ï¿½[eï¿½ï¿½ï¿½fï¿½j.ï¿½?ï¿½ï¿½%ï¿½ï¿½ï¿½(Wï¿½bï¿½0ï¿½Pï¿½ï¿½X%\"ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½dï¿½Yï¿½$Lï¿½Uï¿½V	Aï¿½bï¿½[ï¿½]\'ï¿½ï¿½h\'ï¿½ï¿½Îuï¿½ï¿½ï¿½PKï¿½ï¿½Edï¿½ï¿½ï¿½ï¿½ï¿½Uvï¿½ï¿½#ï¿½ï¿½ï¿½=ï¿½ï¿½lï¿½ï¿½nN6Hï¿½ï¿½c3ï¿½qï¿½ï¿½K\071Pï¿½ï¿½ï¿½ï¿½ï¿½\0\0\0\0IENDï¿½B`ï¿½',14,14),(3,'Commentaire','image/png','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzï¿½\0\0\0gAMA\0\0ï¿½Ü²ï¿½\0\0xIDATxï¿½ÅMlï¿½ï¿½ï¿½ï¿½eï¿½ï¿½Íï¿½ï¿½\rdï¿½ï¿½4Âï¿½ï¿½!(@ï¿½\"N8Jï¿½{ï¿½mÃ¡jï¿½Hï¿½ï¿½Qï¿½ï¿½R7ï¿½jï¿½*=ï¿½ï¿½*Uï¿½ï¿½ï¿½ï¿½\n@|ï¿½@Lï¿½lï¿½ÞuL$\'1ï¿½ï¿½g<ï¿½ï¿½3ï¿½>=ï¿½DÙ¬ï¿½vï¿½~ï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½yï¿½yï¿½ï¿½\0ï¿½g	ï¿½nÜ¿ï¿½ï¿½Ó§Oï¿½<ï¿½Ë²ï¿½ï¿½4-ï¿½ï¿½\0+ï¿½xï¿½Ô©ï¿½ï¿½ï¿½ï¿½ß¬ï¿½ï¿½ï¿½ï¿½Û·ï¿½x<ï¿½M$ï¿½ï¿½ï¿½ï¿½	ï¿½ï¿½ï¿½H$ï¿½m:ï¿½~ï¿½]\0ï¿½ï¿½sï¿½ï¿½Õ«ï¿½w:ï¿½wuuï¿½ï¿½ï¿½vlAï¿½$Iï¿½ï¿½ï¿½rH&ï¿½ï¿½ï¿½xï¿½ï¿½KKKQÆVï¿½l\"ï¿½$I\\ ï¿½ï¿½ï¿½~Y	`ï¿½ï¿½ï¿½lï¿½ï¿½T(H7Ê&es9ï¿½fï¿½ï¿½ï¿½ï¿½(ï¿½ï¿½Sï¿½Pï¿½J511ï¿½È°ï¿½ï¿½Ü¹sï¿½ÞµkWï¿½ï¿½Hï¿½2ï¿½dlnï¿½ï¿½	Nï¿½@ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½eï¿½q0Msï¿½ï¿½ï¿½j\rï¿½B!ï¿½\\	xï¿½GNï¿½ï¿½ï¿½ï¿½ï¿½Lb~dz>ï¿½ï¿½\Z ï¿½qï¿½Zï¿½1ï¿½Ü¹ï¿½vhhï¿½ï¿½ï¿½ï¿½ï¿½vï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Y\nï¿½ï¿½P]Ws|ZK,}}\0cï¿½\\aQqï¿½p8ï¿½]$Yï¿½=:244tï¿½ÆI$Yï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½ï¿½ï¿½,X\Z\Zï¿½:0\0ï¿½iÂªï¿½ï¿½ ï¿½ï¿½ï¿½}ï¿½Å[,ï¿½ï¿½á®ï¿½	ï¿½Ò¥KWcï¿½ï¿½ï¿½ï¿½Åï¿½uttï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?-,,ï¿½cE?ï¿½ï¿½ï¿½8ï¿½ï¿½ï¿½4ï¿½ï¿½\n\0ï¿½ï¿½ï¿½ï¿½\0Y ï¿½ï¿½`0ï¿½ï¿½ï¿½ï¿½=ï¿½gï¿½ï¿½Þ½{ï¿½aØï¿½ï¿½Ûï¿½ï¿½ï¿½ï¿½ï¿½nï¿½ï¿½^Vd3ï¿½<ï¿½ï¿½ï¿½%	*ï¿½ï¿½\r	ï¿½\0UU166v+ï¿½=\0è±ï¿½ï¿½Oï¿½ï¿½Nï¿½Rï¿½ï¿½ï¿½ï¿½]ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ß½{Wï¿½oï¿½>ï¿½ï¿½ï¿½ï¿½=ï¿½ï¿½$aï¿½ï¿½/Pï¿½Nï¿½ï¿½ï¿½xï¿½ZY+]ï¿½$!ï¿½HÐµkï¿½FEï¿½f=ï¿½<ï¿½^ï¿½zï¿½*\nÙNï¿½Þï¿½ï¿½ï¿½ï¿½ï¿½nW>ï¿½ï¿½(ï¿½ï¿½$ï¿½ï¿½ï¿½_ce~mï¿½Ã°UUï¿½ï¿½vï¿½ï¿½ï¿½`0ï¿½\Zï¿½3ï¿½ï¿½ï¿½\Zï¿½\0ï¿½gï¿½<yï¿½X,ï¿½ï¿½ï¿½ï¿½ï¿½x<ï¿½ï¿½(Hï¿½*ÒÒ|ï¿½ï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½(ï¿½Ù³gï¿½ï¿½ï¿½ï¿½ï¿½\0dï¿½^\"ï¿½R%899ï¿½eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½xï¿½ï¿½pï¿½ï¿½ï¿½?ï¿½ï¿½Q]U\"ï¿½Vï¿½ï¿½\0/_ï¿½\\ï¿½}ï¿½ï¿½ï¿½\0ï¿½ï¿½Xï¿½uï¿½ï¿½wï¿½ï¿½ï¿½Rï¿½e<ï¿½]ï¿½ï¿½nï¿½Eï¿½qxï¿½/[ï¿½ï¿½ï¿½×µï¿½}K9aï¿½ï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½F4\Zï¿½ï¿½ï¿½0ï¿½ZPï¿½ï¿½ï¿½Yo]ï¿½ï¿½yï¿½ï¿½È®ï¿½.ï¿½ ï¿½zï¿½ï¿½ï¿½lï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½ï¿½ï¿½Â\'ï¿½rï¿½`hÍ7ï¿½\nSLï¿½\0Dï¿½ß¿oï¿½à¦¦&:tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½@(ï¿½ï¿½ï¿½\08\0ï¿½ï¿½2,Rï¿½l6[ï¿½ï¿½ï¿½ï¿½ï¿½T*EDDï¿½aï¿½aï¿½(\n]ï¿½|ï¿½DQï¿½;vÐ#Gï¿½Ö­[DDdï¿½&iï¿½Fï¿½ï¿½Q>ï¿½ï¿½ï¿½ï¿½/[UURUï¿½2ï¿½Ý¼y3\0ï¿½ï¿½$@gggï¿½ï¿½ï¿½K&ï¿½ï¿½0Mï¿½ï¿½ï¿½ï¿½Ý»Gï¿½wï¿½&\0ï¿½ï¿½ï¿½JWï¿½\\!UUIï¿½uï¿½4m#ï¿½:@&ï¿½!EQï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0Ô8{ï¿½ï¿½oï¿½ï¿½,-//`3Ä7ohppï¿½\0ï¿½ï¿½ï¿½ï¿½L&Cï¿½ï¿½ï¿½ï¿½UUï¿½Ø¯i\Zï¿½ï¿½Iï¿½?ï¿½ZZZï¿½\0ï¿½ï¿½HÎ?ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½ï¿½v;\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½pï¿½ï¿½Iï¿½|>ï¿½ï¿½ï¿½Bï¿½$477ï¿½jï¿½ï¿½1ï¿½0 ï¿½\"ï¿½\0cï¿½@ï¿½8sï¿½ï¿½Wï¿½Dï¿½ï¿½\0JÎï¿½ï¿½Nï¿½ï¿½ï¿½Qï¿½4ï¿½ï¿½ï¿½ï¿½Ú£Gï¿½ï¿½Î;ï¿½)ï¿½ï¿½S*ï¿½\"EQ(ï¿½JQ8ï¿½ï¿½ï¿½ï¿½Y\0{ï¿½i^ï¿½1pï¿½ï¿½Zï¿½ï¿½ï¿½~ï¿½ï¿½1ï¿½ï¿½	ï¿½ï¿½qï¿½ï¿½á \"èºl6ï¿½ï¿½ï¿½9Hï¿½ï¿½0\0ï¿½ï¿½ï¿½ï¿½Jï¿½\'ï¿½ kjjï¿½ï¿½ï¿½Åï¿½rC&cï¿½Lï¿½$]ï¿½ï¿½0\"\"Z]]ï¿½h4J<ï¿½H$BDDÇï¿½ï¿½ï¿½@?ï¿½ï¿½4$ï¿½ÉBï¿½ï¿½i9ï¿½ï¿½ï¿½kï¿½&ï¿½ï¿½4^ï¿½~ï¿½t:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½@ï¿½eï¿½Fï¿½* \0ï¿½ï¿½.ï¿½ï¿½nï¿½ï¿½ï¿½b>ï¿½ï¿½ Qï¿½ï¿½ï¿½ï¿½kï¿½nwC{{{CgggM__ï¿½V+\0`qqï¿½ï¿½x<>_)ï¿½ï¿½ÞBï¿½?ï¿½ï¿½iï¿½ï¿½7@ï¿½Zï¿½ï¿½?rï¿½\\nï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½ï¿½Oï¿½ï¿½%\0ï¿½\0ï¿½\0ï¿½ï¿½hï¿½0@ï¿½oï¿½zï¿½*ï¿½ï¿½ï¿½ï¿½ï¿½M]<6ï¿½H \0\0\0\0IENDï¿½B`ï¿½',14,14);
/*!40000 ALTER TABLE `workflow_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite`
--

DROP TABLE IF EXISTS `workflow_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_prerequisite` (
  `id_prerequisite` int(11) NOT NULL,
  `id_action` int(11) NOT NULL,
  `prerequisite_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite`
--

LOCK TABLES `workflow_prerequisite` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite_duration_cf`
--

DROP TABLE IF EXISTS `workflow_prerequisite_duration_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_prerequisite_duration_cf` (
  `id_prerequisite` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite_duration_cf`
--

LOCK TABLES `workflow_prerequisite_duration_cf` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_history`
--

DROP TABLE IF EXISTS `workflow_resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_resource_history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `id_action` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_access_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_history`),
  KEY `history_id_workflow_fk` (`id_workflow`),
  KEY `history_id_action_fk` (`id_action`),
  CONSTRAINT `fk_history_id_action` FOREIGN KEY (`id_action`) REFERENCES `workflow_action` (`id_action`),
  CONSTRAINT `fk_history_id_workflow` FOREIGN KEY (`id_workflow`) REFERENCES `workflow_workflow` (`id_workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_history`
--

LOCK TABLES `workflow_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workflow`
--

DROP TABLE IF EXISTS `workflow_resource_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_resource_workflow` (
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) NOT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_workflow` int(11) NOT NULL,
  `id_external_parent` int(11) DEFAULT NULL,
  `is_associated_workgroups` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_resource`,`resource_type`,`id_workflow`),
  KEY `workflow_resource_workflow_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workflow_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workflow_id_workflow_fk` (`id_workflow`),
  KEY `fk_document_id_state` (`id_state`),
  CONSTRAINT `fk_document_id_state` FOREIGN KEY (`id_state`) REFERENCES `workflow_state` (`id_state`),
  CONSTRAINT `fk_document_id_workflow` FOREIGN KEY (`id_workflow`) REFERENCES `workflow_workflow` (`id_workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workflow`
--

LOCK TABLES `workflow_resource_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workgroup`
--

DROP TABLE IF EXISTS `workflow_resource_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_resource_workgroup` (
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `workgroup_key` varchar(255) DEFAULT NULL,
  KEY `workflow_resource_workgroup_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workgroup_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workgroup_id_workflow_fk` (`id_workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workgroup`
--

LOCK TABLES `workflow_resource_workgroup` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state`
--

DROP TABLE IF EXISTS `workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `id_workflow` int(11) DEFAULT NULL,
  `is_initial_state` smallint(6) DEFAULT '0',
  `is_required_workgroup_assigned` smallint(6) DEFAULT '0',
  `id_icon` int(11) DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `fk_state_id_workflow` (`id_workflow`),
  CONSTRAINT `fk_state_id_workflow` FOREIGN KEY (`id_workflow`) REFERENCES `workflow_workflow` (`id_workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state`
--

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task`
--

DROP TABLE IF EXISTS `workflow_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `task_type_key` varchar(50) DEFAULT NULL,
  `id_action` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_task`),
  KEY `task_id_action_fk` (`id_action`),
  CONSTRAINT `fk_task_id_action` FOREIGN KEY (`id_action`) REFERENCES `workflow_action` (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task`
--

LOCK TABLES `workflow_task` WRITE;
/*!40000 ALTER TABLE `workflow_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_assignment_cf`
--

DROP TABLE IF EXISTS `workflow_task_assignment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_assignment_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `is_multiple_owner` smallint(6) DEFAULT '0',
  `is_notify` smallint(6) DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `is_use_user_name` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_assignment_cf`
--

LOCK TABLES `workflow_task_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_config`
--

DROP TABLE IF EXISTS `workflow_task_comment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_comment_config` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_richtext` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_config`
--

LOCK TABLES `workflow_task_comment_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_value`
--

DROP TABLE IF EXISTS `workflow_task_comment_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_comment_value` (
  `id_history` int(11) NOT NULL DEFAULT '0',
  `id_task` int(11) NOT NULL,
  `comment_value` mediumtext,
  PRIMARY KEY (`id_history`,`id_task`),
  KEY `comment_value_id_history_fk` (`id_history`),
  KEY `comment_value_id_task_fk` (`id_task`),
  CONSTRAINT `fk_comment_value_id_history` FOREIGN KEY (`id_history`) REFERENCES `workflow_resource_history` (`id_history`),
  CONSTRAINT `fk_comment_value_id_task` FOREIGN KEY (`id_task`) REFERENCES `workflow_task` (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_value`
--

LOCK TABLES `workflow_task_comment_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notification_cf`
--

DROP TABLE IF EXISTS `workflow_task_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_notification_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `id_mailing_list` int(11) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notification_cf`
--

LOCK TABLES `workflow_task_notification_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notification_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflow`
--

DROP TABLE IF EXISTS `workflow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workflow` (
  `id_workflow` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_enabled` smallint(6) DEFAULT '0',
  `workgroup_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflow`
--

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workgroup_cf`
--

DROP TABLE IF EXISTS `workflow_workgroup_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workgroup_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `workgroup_key` varchar(255) NOT NULL,
  `id_mailing_list` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`,`workgroup_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workgroup_cf`
--

LOCK TABLES `workflow_workgroup_cf` WRITE;
/*!40000 ALTER TABLE `workflow_workgroup_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_workgroup_cf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05 15:16:24
