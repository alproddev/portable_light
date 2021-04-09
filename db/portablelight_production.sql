-- MySQL dump 10.10
--
-- Host: localhost    Database: portablelight_production
-- ------------------------------------------------------
-- Server version	5.0.22

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `intro` text,
  `body` text,
  `is_visible` tinyint(1) NOT NULL default '0',
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `image_file_name` varchar(255) default NULL,
  `image_content_type` varchar(255) default NULL,
  `image_file_size` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--


/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
LOCK TABLES `posts` WRITE;
INSERT INTO `posts` VALUES (1,'2009 INDEX Awards Finalist','We\'re excited to announce that the Portable Light Project has been selected as a Finalist for the INDEX Award, the prestigious European design prize! Our entry is in the INDEX Award Work category.','Please visit [designtoimprovelife.dk](http://designtoimprovelife.dk) to see our entry online and to find the schedule for the INDEX traveling exhibit that will feature Portable Light solar textiles starting in August in Copenhagen!',1,5,'2009-07-02 22:05:52','2009-09-22 21:47:16','pl_alt.jpg','image/jpeg',3839),(2,'Portable Light in South Africa','The Portable Light team is working with the iTEACH Program in Zwa-Zulu Natal and the Massachusetts General Hospital to provide energy harvesting blankets as part of a home care treatment program for rural patients with multi-drug resistant tuberculosis (MDR TB) and HIV. Portable Light home care blankets enables patients to generate power and light for their family during treatment.','Multi-drug resistant tuberculosis, a co-epidemic of HIV, is a leading cause of death in many communities in South Africa, especially in Kwa Zulu Natal. The numbers of deaths is staggering and it is impossible for many people to come to hospital for treatment. A home-based, MDR TB treatment program and home care kit is being developed by the iTEACH, Program in South Africa, an affiliate of Massachusetts General Hospital, and the Portable Light Team.\r\n\r\nThe sterilizing effect of the sun\'s UV rays and fresh air can help keep the spread of drug-resistant strains of the disease to a minimum. However, many MDR TB patients and their families face economic hardships that complicate the completion of these treatment programs, among these the lack of blankets for patients to keep warm outdoors and little or no access to electrical power. Lack of hope often further reduces the patient\'s ability to adhere to lengthy and critical medication and treatment regimes.\r\n\r\nThe Portable Light iTeach Blanket is designed to help reduce the strain of TB on patients and their family care takers by loaning them a warming blanket that includes integrated flexible solar panels and a detachable textile-integrated LED lantern. Patients who are outdoors during the day are kept warm, and are also able to harvest sunlight to charge the LED lantern and other small devices such as cell phones.\r\n\r\nPatients and their families benefit from the Portable Light Blanket throughout the daily routine of home based treatment. The patient benefits by day, using the blanket to stay warm and com-fortable during exposure to fresh air and sunlight. The sun charges the flexible Portable Light solar panels in three hours (1), creating 4 watts of power which is stored in a rechargeable battery. At night, Portable Light provides over 8 hours bright white light which benefits patient and family and greatly facilitates the necessary night time home care treatment regime established by the iTEACH Program. The next day, the Portable Light blanket is re-charged by the patient, who figuratively and literally helps to power his or her own treatment. As an incentive to prevent the rise of drug-resistant strains, patients earn ownership of the blankets upon completion of the treatment program.\r\n\r\nMore information about [iTEACH](http://aids.med.harvard.edu/oip/intlresearch/iteach.htm).',1,6,'2009-07-02 22:05:52','2009-09-22 21:47:16','sa.jpg','image/jpeg',12971),(3,'Portable Light in Nicaragua','The Portable Light Team is working with Paso Pacifico to train villagers in conservation,enabling local people protect biodiversity in Nicaragua. Portable Light textiles in conservation packs will provide needed employment in remote land bridge areas where endangered turtles come to lay eggs at night.','More information about [Paso Pacifico](http://www.pasopacifico.org/index.html).',1,7,'2009-07-02 22:05:53','2009-09-22 21:47:16','ni.jpg','image/jpeg',9339),(4,'Portable Light in Las Guayabas','With a grant from ArtVenture, the Portable Light team will lead a pilot project in the Sierra to enable women to weave energy harvesting bags using the traditional backstrap loom. The stories of the women and their bags will be documented over the course of the next year - check back often for field reports from team members and users!','More information about [ArtVenture](http://www.artventure.com/).',1,8,'2009-07-02 22:05:53','2009-09-22 21:47:16','lg.jpg','image/jpeg',13376),(7,'FLAP Bags in Africa!','<object width=\"400\" height=\"300\"><param name=\"allowfullscreen\" value=\"true\" /><param name=\"allowscriptaccess\" value=\"always\" /><param name=\"movie\" value=\"http://vimeo.com/moogaloop.swf?clip_id=6205964&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1\" /><embed src=\"http://vimeo.com/moogaloop.swf?clip_id=6205964&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1\" type=\"application/x-shockwave-flash\" allowfullscreen=\"true\" allowscriptaccess=\"always\" width=\"400\" height=\"300\"></embed></object><p><a href=\"http://vimeo.com/6205964\">Electrical Students in Ghana take on the FLAP bag</a> from <a href=\"http://vimeo.com/whiteafrican\">WhiteAfrican</a> on <a href=\"http://vimeo.com\">Vimeo</a>.</p>\r\n\r\nThe FLAPs project is now in Africa! FLAPs (Flexible Light and Power) provides an adaptable new form of portable power and light to people without access to the electrical grid or in contexts where electrical power is unreliable. FLAPs is a collaborative effort launched by a world-class group of partners including <a href=\"http://www.portablelight.org/\">The Portable Light Project</a>, <a href=\"www.timbuk2.com/\">Timbuk2</a>, and <a href=\"http://www.poptech.org/blog/index.php/archives/4797\">PopTech</a>.\r\n\r\nWeâ€™re using an open integration approach, based on the idea that people can co-create and adopt the ways that FLAP solar kits are used to suit their needs. <a href=\"http://www.afrigadget.com/category/flap-bag-project\">Follow FLAPs news on the ground in Africa, at http://www.afrigadget.com/category/flap-bag-project</a> with our friends Erik Hersman (Afrigaget), Henry Addo in Ghana (Ushahidi) and David Ngigi in Kenya (a young videographer) as they ask people how they would adopt these kits, look for inventiveness, and explore how FLAPs can be usable and adaptable to everyday life in Africa.\r\n','The FLAPs project integrates a new 2 watt lighting and cell phone charging resource created by the Portable Light Team into the flap of a new type of messenger bag, created by Timbuk2. FLAPs power high brightness solid state lighting for 10 hours with a 6 hour solar charge and provide clean energy through a USB port for charging cell phones, medical devices, radios and many other devices. FLAPs can provide mobile power and light for people with cottage industries and small business, for village schools, for mobile doctors and nurses, citizen journalists and conservation workers. Through modular design and global scaling, the FLAPs project holds the potential to be the first affordable, rugged and fully portable resource for clean energy and light. ',1,4,'2009-08-13 16:53:19','2009-09-22 22:07:37','henry-showing-mechanics.jpg','image/jpeg',22532),(8,'INDEX: People\'s Choice Award','The time has come for Portable Light\'s supporters to make their voices heard! Log on to http://www.DesignToImproveLife.com to cast your vote for the Portable Light as the INDEX Design Awards\' People\'s Choice! Worldwide voting opens Thursday August 20 at13:00 GMT. Hit the \"Connect with Facebook\" button on the site to share your vote with your social network!\r\n','Thanks to Facebook, the INDEX AWARDS will broadcast the Awards Show live on August 28th (starting at 18:00 GMT) on http://www.DesignToImproveLife.com ',0,3,'2009-08-19 19:29:21','2009-09-22 21:47:16','banner_149_72.jpg','image/jpeg',9416),(9,'The Portable Light Project and Paso Pacifico Launch Conservation Programs','The Portable Light Project has launched  a new phase of economically sustainable Conservation work with NGO <a href=\"http://www.pasopacifico.org/\">Paso Pacifico</a> in the Paso del Istmo region of Nicaragua.  Portable Light solar textiles harvest sunlight on locally produced conservation tool bags. At night, the lanterns provide light in local schools where people learn to work in local conservation businesses. Portable Light textiles provide USB clean energy to charge cell phones, enabling cellular service provider Movistar to accelerate connectivity in the region.  ','Paso Pacifico rangers use Portable light solar textiles at night to protect endangered sea turtle eggs and nests. The participants in this program will receive up to $50 USD for every nest protected. There are hundreds of nests on these beaches each year.\r\n\r\nDescargar la Nota de Prensa Paso Pacifico y Portable Light (en Espanol)  attached \r\n\r\n<a href=\"http://www.aspenenvironment.org/2009-forum-highlights\">See Sheila Kennedy speak on the new intersection of clean energy and conservation at the Aspen Instituteâ€™s 2009 Forum on Energy and the Environment, â€œBig Dreams Closing Sessionâ€.</a> \r\n\r\n<embed src=\"http://blip.tv/play/AfmVbo7+Bg\" type=\"application/x-shockwave-flash\" width=\"320\" height=\"210\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></embed> ',1,2,'2009-09-22 21:29:46','2009-09-22 21:56:54','PASO_5675.jpg','image/jpeg',19465),(10,'The Portable Light Project partners with Paso Pacifico at  2009 Clinton Global Initiative','â€œHow can you empower people economically in ways that also lift a country? How can you figure out a way to get all the kids in the world in school? How can you fight climate change by making investments that are actually profitable in the long run? <a href=\"http://www.huffingtonpost.com/2009/09/21/bill-clinton-discusses-up_n_293502.html\">President Bill Clinton, Clinton Global Initiative, 2009</a>\r\n\r\n<a href=\"http://www.pasopacifico.org/\">Paso Pacifico</a> teams with the Portable Light Project at the 5th Annual <a href=\"http://www.clintonglobalinitiative.org/\">Clinton Global Initiative</a> to advance women and girls as environmental leaders in Nicaragua and raise awareness about the leadership roles for women and girls across Central America. Paso Pacifico will provide training and tools to local women as they develop ocean conservation and tree nursery businesses to mitigate climate change.  With Portable Light solar textiles, Paso Pacifico will use sustainable technology and market-based approaches to empower women in resource protection and sustainable enterprise development, while also building capacity through education and training in eco-tourism, resource management, and organizational leadership. ','Paso Pacifico and The Portable Light Project are working together on CGI innovation programs that will directly benefit the lives of four hundred women and girls in rural Nicaragua, increasing economic and leadership opportunities linked to the environment. Thirty Portable Light solar kits will be distributed to women and girls in communities without electricity. This sustainable technology will provide increased opportunity for education because it will allow work and study during evening hours. In Performance-based Incentives for Conservation,  Paso Pacifico and the Paso del Istmo community will designate a beach for a sea turtle hatchery to be managed solely by women.  Women will receive Portable Light solar textiles and training in methods for turtle monitoring.  The participants in this program will receive up to $50 USD for every nest protected. There are hundreds of nests on these beaches each year. \r\n',1,1,'2009-09-22 21:47:08','2009-09-22 21:59:05','paso_bags.jpg','image/jpeg',29408);
UNLOCK TABLES;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--


/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
LOCK TABLES `schema_migrations` WRITE;
INSERT INTO `schema_migrations` VALUES ('20080829162739'),('20090701190049'),('20090701194010'),('20090701200225');
UNLOCK TABLES;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) default NULL,
  `name` varchar(100) default '',
  `email` varchar(100) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(40) default NULL,
  `remember_token_expires_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'admin@crushlovely.com','Crush + Lovely','admin@crushlovely.com','c97bd7f2cec9ffb9248e6d9b20bddc94a3627282','cb58bdf22001540637bf10bea3463849bd70c888','2009-07-02 22:05:46','2009-07-02 22:05:46',NULL,NULL),(2,'cgarcia@kvarch.net','Charles Garcia','cgarcia@kvarch.net','91b259ed51d050d62fe5db2e62423b738a43a362','a4084b24d86897d5f5ffa5e88fa68318f6974c3b','2009-07-02 22:05:47','2009-07-02 22:05:47',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

