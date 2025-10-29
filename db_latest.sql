-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: startsmartz
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('1035143a-a326-48b5-8e6f-5e6965d1317b','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',NULL,'20250826062900_add_otp','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250826062900_add_otp\n\nDatabase error code: 1065\n\nDatabase error:\nQuery was empty\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250826062900_add_otp\"\n             at schema-engine/connectors/sql-schema-connector/src/apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20250826062900_add_otp\"\n             at schema-engine/commands/src/commands/apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine/core/src/state.rs:236','2025-09-02 18:19:03.937','2025-08-26 06:29:04.027',0),('4a92274a-50bb-452e-a4da-c4ea4cf9e6c6','26abe666429942abebb56ce37d82f237852f8d8823383c4e264b1f1daa258ae2','2025-09-17 06:31:40.751','20250917055222_init','',NULL,'2025-09-17 06:31:40.751',0),('850e2fb6-1196-4615-bf10-6ba5b321c10b','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','2025-09-02 18:19:03.943','20250826062900_add_otp','',NULL,'2025-09-02 18:19:03.943',0),('8a65cb9c-2c6a-400c-ba20-91abee1b81ed','84c6c5d7ca8426d1188414411efee05fb807b350d479864bd9d427ffd7216ef6','2025-08-26 06:28:35.582','20250825181241_init','',NULL,'2025-08-26 06:28:35.582',0),('93df5826-2d19-488b-9cb2-201d184cb55e','26abe666429942abebb56ce37d82f237852f8d8823383c4e264b1f1daa258ae2','2025-09-25 08:41:00.042','20250925083112_init','',NULL,'2025-09-25 08:41:00.042',0),('aaee118b-e6cb-46c0-95da-3c0030ce63f2','26abe666429942abebb56ce37d82f237852f8d8823383c4e264b1f1daa258ae2',NULL,'20250925083112_init','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250925083112_init\n\nDatabase error code: 1050\n\nDatabase error:\nTable \'User\' already exists\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250925083112_init\"\n             at schema-engine/connectors/sql-schema-connector/src/apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20250925083112_init\"\n             at schema-engine/commands/src/commands/apply_migrations.rs:95\n   2: schema_core::state::ApplyMigrations\n             at schema-engine/core/src/state.rs:236','2025-09-25 08:41:00.034','2025-09-25 08:38:26.965',0),('bdec4479-55d2-45ea-8afc-b71f36f25a61','9650185ab1e44eae8fe886c9b55bb7c43eeac9eb1402e5fc4849b3a07953bfac',NULL,'20250905105453_init','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250905105453_init\n\nDatabase error code: 1050\n\nDatabase error:\nTable \'User\' already exists\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250905105453_init\"\n             at schema-engine/connectors/sql-schema-connector/src/apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20250905105453_init\"\n             at schema-engine/commands/src/commands/apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine/core/src/state.rs:236','2025-09-17 04:36:14.882','2025-09-08 03:27:29.849',0),('c8f1d8f2-62a1-4760-9a87-fcf341408435','b2b5d608d36b3eeb049ff3b417c3eb545c5e3177e5c26fbdaecedcc434b0fe6f',NULL,'20250902110953_init','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250902110953_init\n\nDatabase error code: 1050\n\nDatabase error:\nTable \'User\' already exists\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250902110953_init\"\n             at schema-engine/connectors/sql-schema-connector/src/apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20250902110953_init\"\n             at schema-engine/commands/src/commands/apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine/core/src/state.rs:236','2025-09-03 04:19:51.938','2025-09-02 18:19:15.768',0),('ca11bfdf-7fce-4bcf-a2bb-c5e5db9045b6','b2b5d608d36b3eeb049ff3b417c3eb545c5e3177e5c26fbdaecedcc434b0fe6f','2025-09-03 04:19:51.946','20250902110953_init','',NULL,'2025-09-03 04:19:51.946',0),('e27ad6e4-d575-47f7-8f8b-f82705e36a86','26abe666429942abebb56ce37d82f237852f8d8823383c4e264b1f1daa258ae2',NULL,'20250917055222_init','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250917055222_init\n\nDatabase error code: 1050\n\nDatabase error:\nTable \'User\' already exists\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250917055222_init\"\n             at schema-engine/connectors/sql-schema-connector/src/apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20250917055222_init\"\n             at schema-engine/commands/src/commands/apply_migrations.rs:95\n   2: schema_core::state::ApplyMigrations\n             at schema-engine/core/src/state.rs:236','2025-09-17 06:31:40.743','2025-09-17 06:26:56.441',0);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_us_information`
--

DROP TABLE IF EXISTS `about_us_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_us_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `About_Us_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `About_Us_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_us_information`
--

LOCK TABLES `about_us_information` WRITE;
/*!40000 ALTER TABLE `about_us_information` DISABLE KEYS */;
INSERT INTO `about_us_information` VALUES (7,'Innovation fuels our every move Excellence shapes what we achieve',NULL,'Through strategic thinking and practical expertise, we design solutions that solve complex problems, maximize efficiency, and support lasting success for enterprises and startups alike.','mission-vision-headline',NULL,'2025-09-02 04:25:11.117','2025-10-21 09:27:31.879'),(14,'Our Mission',NULL,'To deliver easy-to-use software and smart branding that help businesses grow, by providing reliable solutions on time with clear communication and continuous learning.','mission-vision-data',NULL,'2025-09-19 05:54:55.289','2025-10-21 09:22:28.272'),(18,'Our Vision ',NULL,'To empower organizations worldwide with trusted technology that grows and changes with their needs, helping them succeed in a fast-changing digital world. By staying flexible and learning new things constantly, we aim to be a reliable partner that supports lasting growth and positive change.','mission-vision-data',NULL,'2025-09-26 05:03:58.291','2025-10-21 09:22:43.839'),(19,'Welcome to Startsmartz','Where Technology Meets Excellence!','Empowering businesses with innovative, reliable, and future-ready solutions where technology meets excellence','about-us',NULL,'2025-10-22 06:17:04.004','2025-10-22 06:17:04.004');
/*!40000 ALTER TABLE `about_us_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_us_information_file`
--

DROP TABLE IF EXISTS `about_us_information_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_us_information_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `about_us_information_id` int NOT NULL,
  `file_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `About_Us_Information_File_about_us_information_id_file_id_key` (`about_us_information_id`,`file_id`),
  KEY `About_Us_Information_File_file_id_fkey` (`file_id`),
  CONSTRAINT `About_Us_Information_File_about_us_information_id_fkey` FOREIGN KEY (`about_us_information_id`) REFERENCES `about_us_information` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `About_Us_Information_File_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_us_information_file`
--

LOCK TABLES `about_us_information_file` WRITE;
/*!40000 ALTER TABLE `about_us_information_file` DISABLE KEYS */;
INSERT INTO `about_us_information_file` VALUES (36,18,487,'2025-09-26 05:10:52.298','2025-09-26 05:10:52.298'),(37,14,577,'2025-10-04 05:13:51.401','2025-10-04 05:13:51.401'),(57,19,681,'2025-10-22 06:17:04.016','2025-10-22 06:17:04.016'),(58,19,682,'2025-10-22 06:17:04.016','2025-10-22 06:17:04.016'),(59,19,683,'2025-10-22 06:17:04.016','2025-10-22 06:17:04.016');
/*!40000 ALTER TABLE `about_us_information_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `estimated_reading_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `article_category_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Article_file_id_fkey` (`file_id`),
  KEY `Article_article_category_id_fkey` (`article_category_id`),
  CONSTRAINT `Article_article_category_id_fkey` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Article_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (24,'Flutter 3.35 – What’s New in the Latest Release','<p>Flutter just keeps getting better. The brand-new <strong>Flutter 3.35 update (released August 2025)</strong> brings a bunch of exciting improvements that make life easier for developers. This version focuses on speed, smarter tools, and stronger security exactly what we need when building modern apps.</p><p>Let’s break down the highlights:</p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hot Reload on the Web</strong></p><p>Hot reload has always been one of Flutter’s magic tricks. Write code, hit save, and instantly see the changes. Now, with Flutter 3.35, you can finally enjoy that same magic on the <strong>web</strong>—no extra setup, no workarounds. Just write your code, refresh, and watch updates appear instantly in your browser. Web development with Flutter feels smoother than ever.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create with AI</strong></p><p>AI is everywhere right now, and Flutter is making sure developers don’t miss out. The new Create with AI guide introduces tools like:</p><ul><li>Gemini Code Assist</li><li>GeminiCLI</li><li>Dart &amp; Flutter MCP Server</li></ul><p>These tools are designed to help you add AI features to your apps more easily. Whether it’s generating code or building smarter user experiences, Flutter is giving us a way to experiment with AI without the headache.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Widget Previewer in Chrome</strong></p><p>If you’ve ever wished you could test a widget without running your full app, this one’s for you. The new Widget Previewer lets you quickly check how your widgets look and behave directly in Chrome. It saves time and makes polishing your UI a whole lot easier.</p><p><strong>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Protecting Sensitive Content on Android</strong></p><p>Security is a big deal, especially if your app handles private data. Flutter 3.35 now gives Android apps a way to hide sensitive information during screen sharing. So, if a user shares their screen, things like financial details or personal data stay hidden. It’s a small feature, but it goes a long way toward building user trust.</p><p><strong>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Updated Platform Support</strong></p><p>As with every release, the list of officially supported platforms has been refreshed. This makes it easier to know which platforms are stable and safe to build for before kicking off your next project.</p><p><strong>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Breaking Changes &amp; Migration</strong></p><p>Big releases usually come with some breaking changes, and Flutter 3.35 is no exception. If you’re upgrading an existing project, make sure to check the migration guide. It’ll save you from unexpected errors and make the update process smoother.</p><p><strong>Final Thoughts</strong></p><p>Flutter 3.35 feels like one of those updates that focuses on things developers care about: <strong>faster workflows, smarter tools, and stronger security.</strong></p><p>With hot reload on the web, new AI tools, widget previews, improved Android privacy, and clear platform support, this release is definitely worth the upgrade.</p><p>If you haven’t tried it yet, now’s the perfect time to <strong>install Flutter 3.35</strong> and see what it brings to your projects.</p>','2025-09-30 09:35:38.434','2-3 min',564,13,'2025-09-30 09:35:38.434','2025-09-30 09:35:38.434'),(25,'Web Development in 2025: Trends, Skills, and Opportunities','<p>The web is no longer a static space of simple pages and basic content. In 2025, it evolved into a powerful, intelligent, and secure ecosystem that connects people and businesses across every industry. At the heart of this transformation are developers, the architects who design, build, and maintain digital platforms that shape how we shop, learn, communicate, and work.</p><p>The role of web developers has expanded significantly. What was once about building basic websites is now about creating end-to-end digital experiences that are scalable, innovative, and user centric. Let’s take a closer look at the emerging trends, essential skills, and why web development continues to matter more than ever.</p><p>&nbsp;</p><p><strong>Emerging Trends Defining the Web</strong></p><p>One of the most exciting aspects of web development today is how new technologies are reshaping what’s possible.</p><p>Artificial intelligence is at the forefront. From personalized recommendations to chatbots that provide 24/7 support, AI-driven applications are making websites smarter and more intuitive. At the same time, blockchain and Web3 technologies are introducing decentralized apps and secure transactions, particularly in areas like finance, digital identity, and healthcare.</p><p>The shift to cloud-native development is also changing the game. Platforms like AWS, Azure, and Google Cloud are allowing developers to build applications that scale seamlessly, handle traffic spikes, and remain reliable without heavy infrastructure costs. Meanwhile, progressive web apps (PWAs) are blurring the line between traditional websites and mobile apps—offering offline access, push notifications, and lightning-fast load speeds.</p><p>Together, these innovations are creating a web that is more connected, intelligent, and user-friendly than ever before.</p><p>&nbsp;</p><p><strong>Skills That Set Developers Apart</strong></p><p>As the web grows more complex, so do the skills developers need to succeed.</p><p>Frontend frameworks like React.js and Next.js dominate the industry, empowering developers to create responsive, interactive interfaces. On the backend, technologies such as Node.js, Django, and Spring Boot enable developers to handle logic, databases, and APIs that power modern applications.</p><p>But technical skills don’t stop there. Understanding databases like PostgreSQL, MySQL, and MongoDB, along with DevOps tools like Docker and Kubernetes, is becoming essential for developers who want to build scalable, production-ready solutions.</p><p>For aspiring developers, the choice is wide:</p><ul><li>Those with a creative eye may thrive in frontend development, designing engaging user experiences.</li><li>Problem-solvers drawn to logic and data may find backend development more rewarding.</li><li>And for those who want the best of both worlds, full-stack development offers the flexibility to work across the entire product lifecycle.</li></ul><p>&nbsp;</p><p><strong>Why Web Development Matters in 2025</strong></p><p>Beyond the tools and trends, it’s important to remember why web development is so impactful. Every new platform, application, or digital experience starts with code written by developers.</p><p>Web development is not just about creating websites—it’s about solving real-world problems. It’s about designing user experiences that feel effortless, enabling businesses to scale globally, and giving individuals access to services and opportunities they might not otherwise have.</p><p>In a world that runs on digital connectivity, web developers aren’t just building websites, they’re shaping the future.</p><p>&nbsp;</p><p><strong>Final Thoughts</strong></p><p>The future of web development is bright and full of possibilities. In 2025, success belongs to those who remain adaptable, continue learning, and embrace innovation. For young developers, it’s the perfect time to dive because web development today is more than a career path.</p><p>It’s a gateway to creativity, growth, and global impact. Whether you’re crafting your first landing page or leading enterprise-level projects, the opportunities to make a difference are endless.</p>','2025-09-30 09:43:35.837','2-3 min',565,14,'2025-09-30 09:43:35.837','2025-09-30 09:43:35.837');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Article_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Article_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (13,'Flutter Updates','Explore what’s new in Flutter 3.35, hot reload on the web, AI-powered tools, widget previews, Android privacy updates, and more. A must-read for developers looking to stay ahead.',NULL,'2025-09-30 09:24:37.279','2025-09-30 09:24:37.279'),(14,'Web Development','Discover the future of web development in 2025. Explore key trends, essential skills, and why web development continues to shape innovation and global opportunities.',NULL,'2025-09-30 09:37:33.690','2025-09-30 09:37:33.690');
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_content_image`
--

DROP TABLE IF EXISTS `article_content_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_content_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `file_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_article_file` (`article_id`,`file_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `Article_Content_Image_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Article_Content_Image_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_content_image`
--

LOCK TABLES `article_content_image` WRITE;
/*!40000 ALTER TABLE `article_content_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_content_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_seo`
--

DROP TABLE IF EXISTS `article_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_seo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `article_id` int NOT NULL,
  `meta_image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`),
  KEY `fk_article_file` (`meta_image_id`),
  CONSTRAINT `fk_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_article_file` FOREIGN KEY (`meta_image_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_seo`
--

LOCK TABLES `article_seo` WRITE;
/*!40000 ALTER TABLE `article_seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career_introduction`
--

DROP TABLE IF EXISTS `career_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Career_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Career_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career_introduction`
--

LOCK TABLES `career_introduction` WRITE;
/*!40000 ALTER TABLE `career_introduction` DISABLE KEYS */;
INSERT INTO `career_introduction` VALUES (7,'Build Your Future with Startsmartz','Bridging For Progress','At Startsmartz Technologies, we believe people are at the heart of innovation. We’re a team of passionate problem-solvers, experienced leaders and young minds who work together to build solutions that transform industries. Join us, and you’ll find more than a workplace; you’ll find a space to learn, grow, and make a real impact.','about-us',NULL,'2025-09-17 06:02:12.293','2025-09-29 10:36:13.824');
/*!40000 ALTER TABLE `career_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career_introduction_file`
--

DROP TABLE IF EXISTS `career_introduction_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career_introduction_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `career_introduction_id` int NOT NULL,
  `file_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Career_Introduction_File_career_introduction_id_file_id_key` (`career_introduction_id`,`file_id`),
  KEY `Career_Introduction_File_file_id_fkey` (`file_id`),
  CONSTRAINT `Career_Introduction_File_career_introduction_id_fkey` FOREIGN KEY (`career_introduction_id`) REFERENCES `career_introduction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Career_Introduction_File_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career_introduction_file`
--

LOCK TABLES `career_introduction_file` WRITE;
/*!40000 ALTER TABLE `career_introduction_file` DISABLE KEYS */;
INSERT INTO `career_introduction_file` VALUES (17,7,531,'2025-09-29 10:36:13.814','2025-09-29 10:36:13.814');
/*!40000 ALTER TABLE `career_introduction_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatbot`
--

DROP TABLE IF EXISTS `chatbot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatbot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatbot`
--

LOCK TABLES `chatbot` WRITE;
/*!40000 ALTER TABLE `chatbot` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatbot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_feedback`
--

DROP TABLE IF EXISTS `client_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_profile_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_profile_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_profile_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Client_Feedback_file_id_fkey` (`file_id`),
  CONSTRAINT `Client_Feedback_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_feedback`
--

LOCK TABLES `client_feedback` WRITE;
/*!40000 ALTER TABLE `client_feedback` DISABLE KEYS */;
INSERT INTO `client_feedback` VALUES (15,'Rashed Kabir','CEO','LLS','Shodei Super Shop is a modern retail store offering a wide range of everyday essentials — from fresh groceries and household items to personal care products and snacks. It focuses on convenience, affordability, and quality, making it a one-stop solution for busy shoppers. With a clean layout, friendly service, and regular discounts, Shodei Super Shop aims to provide a smooth and enjoyable shopping experience for individuals and families alike.','','','',365,'2025-09-17 05:25:35.858','2025-09-17 05:25:35.858'),(16,'tasmia','SQA','drthtru','drsgreheh','','','',433,'2025-09-17 10:37:53.827','2025-09-17 10:37:53.827'),(17,'dfdeg','dfege','dgfg','fsfgf','','','',434,'2025-09-17 10:38:05.337','2025-09-17 10:38:05.337'),(18,'faef','aefaef','afaf','afafqf','','','',435,'2025-09-17 10:38:16.210','2025-09-17 10:38:16.210'),(19,'afdaff','afafaf','afafa','afaafasfa','','','',436,'2025-09-17 10:38:26.289','2025-09-17 10:38:26.289');
/*!40000 ALTER TABLE `client_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_trust_information`
--

DROP TABLE IF EXISTS `client_trust_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_trust_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Client_Trust_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Client_Trust_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_trust_information`
--

LOCK TABLES `client_trust_information` WRITE;
/*!40000 ALTER TABLE `client_trust_information` DISABLE KEYS */;
INSERT INTO `client_trust_information` VALUES (1,'Experiences That Inspire','At Startsmartz, we measure our success by the value we create for our clients. Our clients aren’t just customers—they’re partners in innovation. Every project is a collaboration that transforms bold ideas into powerful, real-world solutions.',NULL,NULL,'2025-08-27 03:05:58.652','2025-09-13 05:18:25.962');
/*!40000 ALTER TABLE `client_trust_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_form`
--

DROP TABLE IF EXISTS `contact_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_form`
--

LOCK TABLES `contact_form` WRITE;
/*!40000 ALTER TABLE `contact_form` DISABLE KEYS */;
INSERT INTO `contact_form` VALUES (1,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','hi','2025-08-30 06:58:49.246','2025-08-30 06:58:49.246'),(2,'Faizul Bitto','faizulbitto123@gmail.com','+8801707595893','Hello there','2025-09-02 10:10:00.983','2025-09-02 10:10:00.983'),(3,'faizul bitto','faizulbitto123@gmail.com','+8801707595893','asdasdadasdasdasdasdsa','2025-09-03 10:49:39.687','2025-09-03 10:49:39.687'),(4,'Test User','test@example.com','+8801700000000','Hello from cURL','2025-09-03 17:20:36.553','2025-09-03 17:20:36.553'),(5,'Abrar Mahir Uddin Sahil','abrar.sahil3501@gmail.com','+8801521536334','sfdsafdc','2025-09-04 05:00:05.189','2025-09-04 05:00:05.189'),(6,'Test User','test@example.com','+8801700000000','Hello from cURL','2025-09-04 05:17:37.032','2025-09-04 05:17:37.032'),(7,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','hiiiiiiiiiiiiiiiiiiiiiiiiiiiii','2025-09-09 05:02:54.917','2025-09-09 05:02:54.917'),(8,'Faizul Bitto','faizulbitto123@gmail.com','+8801707595893','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','2025-09-09 08:54:39.447','2025-09-09 08:54:39.447'),(9,'asdf','lol@gmail.com','+8801999482235','this is test mail ','2025-09-10 03:03:48.354','2025-09-10 03:03:48.354'),(10,'Faizul Bitto','faizulbitto123@gmail.com','+8801707595893','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','2025-09-11 07:02:46.042','2025-09-11 07:02:46.042'),(11,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','sssssssssssssssssss','2025-09-11 09:50:08.329','2025-09-11 09:50:08.329'),(12,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','hi','2025-09-13 04:36:10.189','2025-09-13 04:36:10.189'),(13,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','hlw','2025-09-15 05:20:46.284','2025-09-15 05:20:46.284'),(14,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','hjyfyu','2025-09-17 05:17:01.285','2025-09-17 05:17:01.285'),(15,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','rygeryh','2025-09-18 06:25:08.633','2025-09-18 06:25:08.633'),(16,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','qq','2025-09-18 06:28:26.725','2025-09-18 06:28:26.725'),(17,'Tasmia','17tasmiakhan@gmail.com','+8801621296671','77','2025-09-18 10:40:36.741','2025-09-18 10:40:36.741'),(18,'Masud','masudrana@gmail.comm','+8801951835496','test','2025-09-27 04:21:23.988','2025-09-27 04:21:23.988'),(19,'Abrar Mahir Uddin Sahil','abrar.sahil3501@gmail.com','+8801521536334','hello','2025-10-04 05:44:42.678','2025-10-04 05:44:42.678');
/*!40000 ALTER TABLE `contact_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information`
--

DROP TABLE IF EXISTS `contact_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Contact_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Contact_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information`
--

LOCK TABLES `contact_information` WRITE;
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
INSERT INTO `contact_information` VALUES (6,'Give us a call','+8809653214109','contact',NULL,'2025-10-22 11:26:59.119','2025-10-22 11:26:59.119'),(7,'Send us an email','info@startsmartz.net','mail',NULL,'2025-10-22 11:27:16.855','2025-10-22 11:27:16.855'),(8,'Visit us','Shahid Abdul Aziz Road, Jogonathpur, Vatara, Dhaka, Bangladesh – 1229','location',NULL,'2025-10-22 11:27:35.152','2025-10-22 11:27:35.152');
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us_introduction`
--

DROP TABLE IF EXISTS `contact_us_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Contact_Us_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Contact_Us_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us_introduction`
--

LOCK TABLES `contact_us_introduction` WRITE;
/*!40000 ALTER TABLE `contact_us_introduction` DISABLE KEYS */;
INSERT INTO `contact_us_introduction` VALUES (1,'We’re Just a Message Away','Whether you’re a startup with a vision or an enterprise with big goals, we’d love to hear from you. Let’s turn your ideas into reality.',NULL,NULL,'2025-08-30 06:55:08.498','2025-09-17 05:41:44.941');
/*!40000 ALTER TABLE `contact_us_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailverification`
--

DROP TABLE IF EXISTS `emailverification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailverification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime(3) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EmailVerification_token_key` (`token`),
  KEY `EmailVerification_user_id_fkey` (`user_id`),
  CONSTRAINT `EmailVerification_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailverification`
--

LOCK TABLES `emailverification` WRITE;
/*!40000 ALTER TABLE `emailverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_URL` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_extension` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'upload',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=832 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (67,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 05:58:07.086','2025-08-30 05:58:07.086'),(68,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 05:58:12.292','2025-08-30 05:58:12.292'),(69,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 05:58:19.972','2025-08-30 05:58:19.972'),(70,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 05:58:39.623','2025-08-30 05:58:39.623'),(71,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 05:58:46.982','2025-08-30 05:58:46.982'),(72,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 05:58:51.429','2025-08-30 05:58:51.429'),(73,'devicon--java-wordmark.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/devicon--java-wordmark.svg','image','svg','link','2025-08-30 06:00:20.623','2025-08-30 06:00:20.623'),(75,'0*y6IcBe5J1AdALzXw.png','https://miro.medium.com/v2/resize:fit:1400/0*y6IcBe5J1AdALzXw.png','external','link','link','2025-08-30 06:01:27.019','2025-08-30 06:01:27.019'),(76,'0*y6IcBe5J1AdALzXw.png','https://miro.medium.com/v2/resize:fit:1400/0*y6IcBe5J1AdALzXw.png','external','link','link','2025-08-30 06:01:32.810','2025-08-30 06:01:32.810'),(77,'0*y6IcBe5J1AdALzXw.png','https://miro.medium.com/v2/resize:fit:1400/0*y6IcBe5J1AdALzXw.png','external','link','link','2025-08-30 06:01:37.690','2025-08-30 06:01:37.690'),(89,'UI+UX.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI+UX.svg','image','svg','link','2025-08-30 06:13:52.719','2025-08-30 06:13:52.719'),(92,'Mobile.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Mobile.svg','image','svg','link','2025-08-30 06:15:53.149','2025-08-30 06:15:53.149'),(95,'Backend.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Backend.svg','image','svg','link','2025-08-30 06:19:10.159','2025-08-30 06:19:10.159'),(96,'Frontend.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Frontend.svg','image','svg','link','2025-08-30 06:19:27.237','2025-08-30 06:19:27.237'),(97,'Ruby.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Ruby.svg','image','svg','link','2025-08-30 09:51:12.530','2025-08-30 09:51:12.530'),(98,'Ruby.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Ruby.svg','image','svg','link','2025-08-30 09:51:54.702','2025-08-30 09:51:54.702'),(99,'PHP.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/PHP.svg','image','svg','link','2025-08-30 09:52:38.319','2025-08-30 09:52:38.319'),(100,'Python.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Python.svg','image','svg','link','2025-08-30 09:53:15.799','2025-08-30 09:53:15.799'),(101,'Java.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Java.svg','image','svg','link','2025-08-30 09:53:41.151','2025-08-30 09:53:41.151'),(102,'Swift.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Swift.svg','image','svg','link','2025-08-30 09:54:15.977','2025-08-30 09:54:15.977'),(103,'Javascript.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Javascript.svg','image','svg','link','2025-08-30 09:59:26.533','2025-08-30 09:59:26.533'),(104,'Kotlin.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Kotlin.svg','image','svg','link','2025-08-30 10:00:33.602','2025-08-30 10:00:33.602'),(105,'Tasmiakhan_SQA.pdf','/uploads/1756705460366-498485426.pdf','application','pdf','upload','2025-09-01 05:44:20.369','2025-09-01 05:44:20.369'),(108,'React.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/React.svg','image','svg','link','2025-09-01 06:05:32.487','2025-09-01 06:05:32.487'),(110,'Angular.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Angular.svg','image','svg','link','2025-09-01 06:08:56.048','2025-09-01 06:08:56.048'),(111,'Vuejs.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Vuejs.svg','image','svg','link','2025-09-01 06:10:41.695','2025-09-01 06:10:41.695'),(112,'Tailwindcss.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Tailwindcss.svg','image','svg','link','2025-09-01 06:12:26.073','2025-09-01 06:12:26.073'),(113,'Bootstrap.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Bootstrap.svg','image','svg','link','2025-09-01 06:13:00.522','2025-09-01 06:13:00.522'),(140,'Widget%20(1).webp','https://dj3dqs5w58slz.cloudfront.net/uploads/my-images/Business%20Analytics/Widget%20(1).webp','image','webp','link','2025-09-01 09:52:06.876','2025-09-01 09:52:06.876'),(141,'Widget%20(1).webp','https://dj3dqs5w58slz.cloudfront.net/uploads/my-images/Business%20Analytics/Widget%20(1).webp','image','webp','link','2025-09-01 09:56:11.787','2025-09-01 09:56:11.787'),(142,'images.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images.png','image','png','link','2025-09-01 10:46:08.421','2025-09-01 10:46:08.421'),(143,'DevOps+Server.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps+Server.svg','image','svg','link','2025-09-01 10:47:31.104','2025-09-01 10:47:31.104'),(144,'png-clipart-devops-business-process-software-devel','https://s3.ap-south-1.amazonaws.com/emr.buckett/png-clipart-devops-business-process-software-development-process-implementation-business-text-people.png','image','png','link','2025-09-01 10:50:39.273','2025-09-01 10:50:39.273'),(145,'vector-illustration-ci-cd-continuous-600nw-2243991','https://s3.ap-south-1.amazonaws.com/emr.buckett/vector-illustration-ci-cd-continuous-600nw-2243991131.webp','image','webp','link','2025-09-01 10:51:53.945','2025-09-01 10:51:53.945'),(146,'OIP.webp','https://s3.ap-south-1.amazonaws.com/emr.buckett/OIP.webp','image','webp','link','2025-09-01 10:54:14.573','2025-09-01 10:54:14.573'),(147,'Jenkins_logo.svg.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Jenkins_logo.svg.png','image','png','link','2025-09-01 10:54:45.990','2025-09-01 10:54:45.990'),(148,'Kubernetes_logo_without_workmark.svg.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Kubernetes_logo_without_workmark.svg.png','image','png','link','2025-09-01 10:55:35.091','2025-09-01 10:55:35.091'),(149,'Untitled.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled.jpg','image','jpg','link','2025-09-01 10:56:59.368','2025-09-01 10:56:59.368'),(150,'Ansible_Logo.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Ansible_Logo.png','image','png','link','2025-09-01 10:57:40.497','2025-09-01 10:57:40.497'),(151,'Figma.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Figma.svg','image','svg','link','2025-09-01 10:58:13.781','2025-09-01 10:58:13.781'),(152,'Adobe-xd.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Adobe-xd.svg','image','svg','link','2025-09-01 10:58:40.969','2025-09-01 10:58:40.969'),(153,'expressjs.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/expressjs.svg','image','svg','link','2025-09-01 11:01:18.166','2025-09-01 11:01:18.166'),(154,'Django.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Django.svg','image','svg','link','2025-09-01 11:01:51.971','2025-09-01 11:01:51.971'),(155,'terfrom.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/terfrom.png','image','png','link','2025-09-01 11:03:35.012','2025-09-01 11:03:35.012'),(156,'graphana.webp','https://s3.ap-south-1.amazonaws.com/emr.buckett/graphana.webp','image','webp','link','2025-09-01 11:04:35.481','2025-09-01 11:04:35.481'),(157,'Flask.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Flask.svg','image','svg','link','2025-09-01 11:08:26.985','2025-09-01 11:08:26.985'),(158,'Laravel.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Laravel.svg','image','svg','link','2025-09-01 11:09:03.057','2025-09-01 11:09:03.057'),(159,'Spring+Boot.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Spring+Boot.svg','image','svg','link','2025-09-01 11:09:48.668','2025-09-01 11:09:48.668'),(160,'Dot+net+core.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Dot+net+core.svg','image','svg','link','2025-09-01 11:11:31.746','2025-09-01 11:11:31.746'),(161,'Flutter.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Flutter.svg','image','svg','link','2025-09-01 11:13:54.881','2025-09-01 11:13:54.881'),(162,'Ruby.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Ruby.svg','image','svg','link','2025-09-01 11:25:24.861','2025-09-01 11:25:24.861'),(163,'Nestjs.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Nestjs.svg','image','svg','link','2025-09-01 11:29:06.094','2025-09-01 11:29:06.094'),(164,'Fastify.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Fastify.svg','image','svg','link','2025-09-01 11:29:41.227','2025-09-01 11:29:41.227'),(165,'Fast+api.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Fast+api.svg','image','svg','link','2025-09-01 11:30:31.839','2025-09-01 11:30:31.839'),(166,'Phoenix.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Phoenix.svg','image','svg','link','2025-09-01 11:30:58.146','2025-09-01 11:30:58.146'),(167,'Gin.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Gin.svg','image','svg','link','2025-09-01 11:31:39.650','2025-09-01 11:31:39.650'),(170,'Threejs.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Threejs.svg','image','svg','link','2025-09-02 05:37:13.694','2025-09-02 05:37:13.694'),(171,'AI.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI.svg','image','svg','link','2025-09-02 09:58:43.307','2025-09-02 09:58:43.307'),(172,'Machine+Learning.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Machine+Learning.svg','image','svg','link','2025-09-02 10:14:19.497','2025-09-02 10:14:19.497'),(173,'Artificial+Neural+Network.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Artificial+Neural+Network.svg','image','svg','link','2025-09-02 10:15:27.519','2025-09-02 10:15:27.519'),(174,'generative-AI.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/generative-AI.png','image','png','link','2025-09-02 10:16:08.330','2025-09-02 10:16:08.330'),(175,'Agentic+AI.jfif.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Agentic+AI.jfif.jpg','image','jpg','link','2025-09-02 10:16:42.203','2025-09-02 10:16:42.203'),(176,'Multi-Modal+AI.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Multi-Modal+AI.jpg','image','jpg','link','2025-09-02 10:17:11.326','2025-09-02 10:17:11.326'),(177,'Artificial+General+Intelligence.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Artificial+General+Intelligence.jpg','image','jpg','link','2025-09-02 10:17:56.812','2025-09-02 10:17:56.812'),(178,'Computer+Vision+%26+Image+Processing.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Computer+Vision+%26+Image+Processing.png','image','png','link','2025-09-02 10:18:26.236','2025-09-02 10:18:26.236'),(179,'Multi-Repo_Microservice_Architecture_(_We_are_following_Multi-Repo_setup_).pdf','/uploads/1756808331705-983192596.pdf','application','pdf','upload','2025-09-02 10:18:51.707','2025-09-02 10:18:51.707'),(180,'Deep+Reinforcement+Learning.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Deep+Reinforcement+Learning.png','image','png','link','2025-09-02 10:19:07.038','2025-09-02 10:19:07.038'),(181,'Natural+Language+Processing.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Natural+Language+Processing.png','image','png','link','2025-09-02 10:19:33.641','2025-09-02 10:19:33.641'),(182,'large-language-model-icon-on-260nw-2426097131.webp','https://s3.ap-south-1.amazonaws.com/emr.buckett/large-language-model-icon-on-260nw-2426097131.webp','image','webp','link','2025-09-02 10:20:07.831','2025-09-02 10:20:07.831'),(183,'MLOps+and+LLMOps.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/MLOps+and+LLMOps.jpg','image','jpg','link','2025-09-02 10:20:37.399','2025-09-02 10:20:37.399'),(188,'Widget%20(1).webp','https://dj3dqs5w58slz.cloudfront.net/uploads/my-images/Business%20Analytics/Widget%20(1).webp','image','webp','link','2025-09-03 05:49:47.825','2025-09-03 05:49:47.825'),(191,'Multi-Repo_Microservice_Architecture_(_We_are_following_Multi-Repo_setup_).pdf','/uploads/1756896748103-83387325.pdf','application','pdf','upload','2025-09-03 10:52:28.106','2025-09-03 10:52:28.106'),(253,'Language-line.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Language-line.svg','image','svg','link','2025-09-09 04:46:44.105','2025-09-09 04:46:44.105'),(256,'Tasmiakhan_SQA.pdf','/uploads/1757393737166-873712931.pdf','application','pdf','upload','2025-09-09 04:55:37.168','2025-09-09 04:55:37.168'),(317,'9oq4EG2TBGU?si=0bueG2wDyFdE8eEd','https://www.youtube.com/embed/9oq4EG2TBGU?si=0bueG2wDyFdE8eEd','video','youtube','link','2025-09-13 09:47:41.000','2025-09-13 09:47:41.000'),(356,'WhatsApp Image 2025-09-02 at 11.26.15 AM (1).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-02 at 11.26.15 AM (1).jpeg','image','jpeg','s3','2025-09-16 07:13:21.714','2025-09-16 07:13:21.714'),(357,'WhatsApp Image 2025-09-16 at 1.20.07 PM.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-16 at 1.20.07 PM.jpeg','image','jpeg','s3','2025-09-16 07:21:17.958','2025-09-16 07:21:17.958'),(365,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-17 05:25:35.848','2025-09-17 05:25:35.848'),(366,'WhatsApp Image 2025-08-28 at 14.03.03 (1).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (1).jpeg','image','jpeg','s3','2025-09-17 05:26:50.763','2025-09-17 05:26:50.763'),(367,'WhatsApp Image 2025-08-28 at 14.03.03 (1).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (1).jpeg','image','jpeg','s3','2025-09-17 05:26:54.876','2025-09-17 05:26:54.876'),(374,'WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','image','jpeg','s3','2025-09-17 05:39:53.088','2025-09-17 05:39:53.088'),(375,'WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','image','jpeg','s3','2025-09-17 05:39:57.094','2025-09-17 05:39:57.094'),(378,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-17 05:58:37.323','2025-09-17 05:58:37.323'),(379,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-17 05:59:44.055','2025-09-17 05:59:44.055'),(385,'WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','image','jpeg','s3','2025-09-17 06:45:35.328','2025-09-17 06:45:35.328'),(386,'WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','image','jpeg','s3','2025-09-17 06:45:36.438','2025-09-17 06:45:36.438'),(387,'WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','image','jpeg','s3','2025-09-17 06:45:37.615','2025-09-17 06:45:37.615'),(388,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 07:46:20.259','2025-09-17 07:46:20.259'),(390,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:36:02.987','2025-09-17 08:36:02.987'),(391,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:38:40.140','2025-09-17 08:38:40.140'),(392,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:40:19.274','2025-09-17 08:40:19.274'),(393,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:42:37.110','2025-09-17 08:42:37.110'),(394,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:51:27.152','2025-09-17 08:51:27.152'),(395,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:51:27.250','2025-09-17 08:51:27.250'),(396,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:51:27.348','2025-09-17 08:51:27.348'),(397,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:52:24.582','2025-09-17 08:52:24.582'),(398,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:52:24.708','2025-09-17 08:52:24.708'),(399,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:52:24.770','2025-09-17 08:52:24.770'),(400,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:52:59.437','2025-09-17 08:52:59.437'),(401,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:52:59.549','2025-09-17 08:52:59.549'),(402,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:52:59.603','2025-09-17 08:52:59.603'),(403,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:53:18.929','2025-09-17 08:53:18.929'),(404,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:53:35.987','2025-09-17 08:53:35.987'),(405,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:53:36.138','2025-09-17 08:53:36.138'),(406,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:53:56.547','2025-09-17 08:53:56.547'),(407,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:53:56.571','2025-09-17 08:53:56.571'),(408,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:53:56.702','2025-09-17 08:53:56.702'),(409,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:54:43.274','2025-09-17 08:54:43.274'),(410,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:54:43.299','2025-09-17 08:54:43.299'),(411,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:54:43.323','2025-09-17 08:54:43.323'),(412,'WhatsApp Image 2025-09-15 at 13.11.29.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.11.29.jpeg','image','jpeg','s3','2025-09-17 08:54:43.402','2025-09-17 08:54:43.402'),(413,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:54:43.499','2025-09-17 08:54:43.499'),(414,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:56:31.828','2025-09-17 08:56:31.828'),(415,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-09-17 08:56:31.851','2025-09-17 08:56:31.851'),(416,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 08:56:31.871','2025-09-17 08:56:31.871'),(417,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-17 08:56:31.956','2025-09-17 08:56:31.956'),(418,'WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-08-28 at 14.03.03 (2).jpeg','image','jpeg','s3','2025-09-17 09:03:58.614','2025-09-17 09:03:58.614'),(419,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 09:05:32.572','2025-09-17 09:05:32.572'),(420,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 09:06:06.608','2025-09-17 09:06:06.608'),(421,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 09:28:04.492','2025-09-17 09:28:04.492'),(422,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 09:29:06.914','2025-09-17 09:29:06.914'),(423,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 09:29:51.478','2025-09-17 09:29:51.478'),(424,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 09:33:56.713','2025-09-17 09:33:56.713'),(425,'download (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/download (1).png','image','png','s3','2025-09-17 09:35:17.044','2025-09-17 09:35:17.044'),(429,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 10:05:25.307','2025-09-17 10:05:25.307'),(430,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 10:05:42.307','2025-09-17 10:05:42.307'),(431,'images (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/images (1).png','image','png','s3','2025-09-17 10:05:59.011','2025-09-17 10:05:59.011'),(432,'WhatsApp Image 2025-09-15 at 13.07.49_a2a88f6f.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.07.49_a2a88f6f.jpg','image','jpg','s3','2025-09-17 10:11:57.797','2025-09-17 10:11:57.797'),(433,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 10:37:53.819','2025-09-17 10:37:53.819'),(434,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 10:38:05.327','2025-09-17 10:38:05.327'),(435,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 10:38:16.203','2025-09-17 10:38:16.203'),(436,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-17 10:38:26.282','2025-09-17 10:38:26.282'),(437,'WhatsApp Image 2025-09-15 at 13.07.49_a2a88f6f.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.07.49_a2a88f6f.jpg','image','jpg','s3','2025-09-17 10:45:10.311','2025-09-17 10:45:10.311'),(439,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-18 03:40:50.455','2025-09-18 03:40:50.455'),(440,'assets_task_01k3qp822ee3084jv2bhjjh24w_1756363085_img_1.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/assets_task_01k3qp822ee3084jv2bhjjh24w_1756363085_img_1.jpg','image','jpg','s3','2025-09-18 03:42:03.393','2025-09-18 03:42:03.393'),(441,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-18 03:44:41.199','2025-09-18 03:44:41.199'),(442,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-18 03:44:47.456','2025-09-18 03:44:47.456'),(444,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-18 03:58:29.344','2025-09-18 03:58:29.344'),(445,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-18 04:04:50.740','2025-09-18 04:04:50.740'),(451,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-18 10:43:39.568','2025-09-18 10:43:39.568'),(452,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-18 10:44:52.100','2025-09-18 10:44:52.100'),(453,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-18 10:46:19.909','2025-09-18 10:46:19.909'),(456,'9oq4EG2TBGU?si=0bueG2wDyFdE8eEd','https://www.youtube.com/embed/9oq4EG2TBGU?si=0bueG2wDyFdE8eEd','video','youtube','link','2025-09-19 05:16:12.943','2025-09-19 05:16:12.943'),(458,'logos--facebook.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/logos--facebook.svg','image','svg','s3','2025-09-19 05:31:26.734','2025-09-19 05:31:26.734'),(459,'skill-icons--instagram.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/skill-icons--instagram.svg','image','svg','s3','2025-09-19 05:36:45.791','2025-09-19 05:36:45.791'),(460,'skill-icons--linkedin.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/skill-icons--linkedin.svg','image','svg','s3','2025-09-19 05:38:05.577','2025-09-19 05:38:05.577'),(463,'logos--youtube-icon.svg','https://s3.ap-south-1.amazonaws.com/emr.buckett/logos--youtube-icon.svg','image','svg','s3','2025-09-24 04:42:23.228','2025-09-24 04:42:23.228'),(464,'Untitled design (13).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (13).png','image','png','s3','2025-09-24 10:07:41.253','2025-09-24 10:07:41.253'),(465,'Shodei Customer Mobile App.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei Customer Mobile App.jpg','image','jpg','s3','2025-09-24 10:17:02.352','2025-09-24 10:17:02.352'),(487,'Untitled design (11).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (11).jpg','image','jpg','s3','2025-09-26 05:10:52.286','2025-09-26 05:10:52.286'),(498,'Hotel Management Software Solutions.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel Management Software Solutions.png','image','png','s3','2025-09-26 06:19:11.905','2025-09-26 06:19:11.905'),(499,'Pharmacy Management System Software.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy Management System Software.png','image','png','s3','2025-09-26 06:22:09.839','2025-09-26 06:22:09.839'),(500,'Linxtream â Video Streaming Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Linxtream â Video Streaming Platform.png','image','png','s3','2025-09-26 06:25:48.070','2025-09-26 06:25:48.070'),(504,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-27 05:16:38.136','2025-09-27 05:16:38.136'),(505,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-27 05:23:10.724','2025-09-27 05:23:10.724'),(506,'linxtream.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/linxtream.jpeg','image','jpeg','s3','2025-09-27 05:29:26.059','2025-09-27 05:29:26.059'),(507,'linxtream.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/linxtream.jpeg','image','jpeg','s3','2025-09-27 05:41:26.563','2025-09-27 05:41:26.563'),(508,'sq-logo.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/sq-logo.png','image','png','s3','2025-09-27 06:10:03.033','2025-09-27 06:10:03.033'),(510,'Work Suit by Startsmartz â Business Management Software - Dashbord.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work Suit by Startsmartz â Business Management Software - Dashbord.jpg','image','jpg','s3','2025-09-27 09:19:05.488','2025-09-27 09:19:05.488'),(511,'Work Suit by Startsmartz â Business Management Software - Notice Bord.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work Suit by Startsmartz â Business Management Software - Notice Bord.jpg','image','jpg','s3','2025-09-27 09:19:45.925','2025-09-27 09:19:45.925'),(512,'Work Suit by Startsmartz â Business Management Software.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work Suit by Startsmartz â Business Management Software.jpg','image','jpg','s3','2025-09-27 09:21:13.353','2025-09-27 09:21:13.353'),(513,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-27 10:53:46.902','2025-09-27 10:53:46.902'),(515,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-09-29 03:56:15.033','2025-09-29 03:56:15.033'),(516,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-29 04:41:11.044','2025-09-29 04:41:11.044'),(517,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-29 04:46:26.097','2025-09-29 04:46:26.097'),(518,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-29 04:58:49.282','2025-09-29 04:58:49.282'),(519,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-29 05:21:31.566','2025-09-29 05:21:31.566'),(520,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-29 05:38:17.243','2025-09-29 05:38:17.243'),(521,'Untitled design (9).jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Untitled design (9).jpg','image','jpg','s3','2025-09-29 05:54:48.998','2025-09-29 05:54:48.998'),(529,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-29 09:54:07.408','2025-09-29 09:54:07.408'),(531,'Career Opportunities at Startsmartz.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Career Opportunities at Startsmartz.png','image','png','s3','2025-09-29 10:36:13.801','2025-09-29 10:36:13.801'),(532,'Worksuit.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Worksuit.png','image','png','s3','2025-09-30 03:36:41.930','2025-09-30 03:36:41.930'),(533,'ph 1.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/ph 1.jpg','image','jpg','s3','2025-09-30 03:56:09.766','2025-09-30 03:56:09.766'),(534,'Worksuit (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Worksuit (1).png','image','png','s3','2025-09-30 04:18:13.455','2025-09-30 04:18:13.455'),(535,'Screenshot 2025-09-24 172240.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-24 172240.png','image','png','s3','2025-09-30 05:14:00.102','2025-09-30 05:14:00.102'),(536,'Screenshot 2025-09-24 172240.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-24 172240.png','image','png','s3','2025-09-30 05:16:02.618','2025-09-30 05:16:02.618'),(537,'Screenshot 2025-09-04 094206.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-04 094206.png','image','png','s3','2025-09-30 05:16:02.729','2025-09-30 05:16:02.729'),(538,'Screenshot 2025-09-04 094206.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-04 094206.png','image','png','s3','2025-09-30 05:17:44.770','2025-09-30 05:17:44.770'),(539,'Screenshot 2025-09-04 094206.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-04 094206.png','image','png','s3','2025-09-30 05:17:54.290','2025-09-30 05:17:54.290'),(540,'Screenshot 2025-09-24 172240.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-24 172240.png','image','png','s3','2025-09-30 05:20:43.319','2025-09-30 05:20:43.319'),(541,'Screenshot 2025-09-24 172240.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-24 172240.png','image','png','s3','2025-09-30 05:33:58.193','2025-09-30 05:33:58.193'),(542,'Screenshot 2025-09-24 172240.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-24 172240.png','image','png','s3','2025-09-30 05:33:58.294','2025-09-30 05:33:58.294'),(543,'Worksuit (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Worksuit (2).png','image','png','s3','2025-09-30 05:36:27.770','2025-09-30 05:36:27.770'),(544,'HR 1.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/HR 1.jpg','image','jpg','s3','2025-09-30 05:44:34.381','2025-09-30 05:44:34.381'),(545,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-30 06:16:05.469','2025-09-30 06:16:05.469'),(546,'WhatsApp Image 2025-09-15 at 13.13.52.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.13.52.jpeg','image','jpeg','s3','2025-09-30 06:16:28.300','2025-09-30 06:16:28.300'),(547,'Screenshot 2025-09-30 113932.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-30 113932.png','image','png','s3','2025-09-30 06:17:26.503','2025-09-30 06:17:26.503'),(548,'Screenshot 2025-09-30 113932.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Screenshot 2025-09-30 113932.png','image','png','s3','2025-09-30 06:17:26.770','2025-09-30 06:17:26.770'),(549,'Worksuit.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Worksuit.png','image','png','s3','2025-09-30 06:24:20.550','2025-09-30 06:24:20.550'),(550,'Fire Stick Upgrade _ Family Entertainment Hub.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Fire Stick Upgrade _ Family Entertainment Hub.jpeg','image','jpeg','s3','2025-09-30 06:27:34.928','2025-09-30 06:27:34.928'),(551,'Hotel Managment.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel Managment.png','image','png','s3','2025-09-30 06:28:00.488','2025-09-30 06:28:00.488'),(552,'c9829bdf20e4775a34df99505729ba0c.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/c9829bdf20e4775a34df99505729ba0c.jpg','image','jpg','s3','2025-09-30 06:29:18.444','2025-09-30 06:29:18.444'),(553,'Linxtream.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Linxtream.png','image','png','s3','2025-09-30 06:31:44.195','2025-09-30 06:31:44.195'),(554,'Pharmacy.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy.png','image','png','s3','2025-09-30 06:35:55.327','2025-09-30 06:35:55.327'),(555,'Shodei (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei (1).png','image','png','s3','2025-09-30 07:08:58.277','2025-09-30 07:08:58.277'),(556,'hotel.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/hotel.jpg','image','jpg','s3','2025-09-30 07:11:46.377','2025-09-30 07:11:46.377'),(557,'h3.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/h3.jpg','image','jpg','s3','2025-09-30 07:13:22.133','2025-09-30 07:13:22.133'),(558,'Pharmacy management software by Startsmartz Technology - D.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - D.jpg','image','jpg','s3','2025-09-30 09:04:29.917','2025-09-30 09:04:29.917'),(559,'Pharmacy management software by Startsmartz Technology - Dashboard.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - Dashboard.jpg','image','jpg','s3','2025-09-30 09:04:44.173','2025-09-30 09:04:44.173'),(560,'Pharmacy management software by Startsmartz Technology - purchase.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - purchase.jpg','image','jpg','s3','2025-09-30 09:05:01.375','2025-09-30 09:05:01.375'),(561,'Pharmacy management software by Startsmartz Technology - Supplier list.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - Supplier list.jpg','image','jpg','s3','2025-09-30 09:05:24.969','2025-09-30 09:05:24.969'),(562,'ds.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/ds.jpg','image','jpg','s3','2025-09-30 09:12:41.357','2025-09-30 09:12:41.357'),(563,'e1317fd12bf55bd7075d3aa9001dce8b.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/e1317fd12bf55bd7075d3aa9001dce8b.jpg','image','jpg','s3','2025-09-30 09:14:06.843','2025-09-30 09:14:06.843'),(564,'f.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/f.jpg','image','jpg','s3','2025-09-30 09:35:38.421','2025-09-30 09:35:38.421'),(565,'web.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/web.jpg','image','jpg','s3','2025-09-30 09:43:35.824','2025-09-30 09:43:35.824'),(566,'Shodei.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei.png','image','png','s3','2025-10-03 04:51:36.779','2025-10-03 04:51:36.779'),(567,'Shodei.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei.png','image','png','s3','2025-10-03 05:44:47.621','2025-10-03 05:44:47.621'),(572,'Shodei.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei.png','image','png','s3','2025-10-03 06:45:02.026','2025-10-03 06:45:02.026'),(574,'Boost Productivity.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity.png','image','png','s3','2025-10-03 09:44:43.616','2025-10-03 09:44:43.616'),(575,'Boost Productivity.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity.png','image','png','s3','2025-10-04 05:06:17.406','2025-10-04 05:06:17.406'),(576,'Boost Productivity (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (1).png','image','png','s3','2025-10-04 05:06:17.640','2025-10-04 05:06:17.640'),(577,'Our Mission.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Our Mission.jpg','image','jpg','s3','2025-10-04 05:13:51.386','2025-10-04 05:13:51.386'),(581,'WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','image','jpg','s3','2025-10-04 07:09:01.619','2025-10-04 07:09:01.619'),(582,'WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','image','jpg','s3','2025-10-04 07:14:04.413','2025-10-04 07:14:04.413'),(583,'WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','image','jpg','s3','2025-10-04 07:14:04.551','2025-10-04 07:14:04.551'),(584,'WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg','image','jpg','s3','2025-10-04 07:14:34.642','2025-10-04 07:14:34.642'),(585,'WhatsApp Image 2025-10-04 at 13.13.28_5516863b.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.13.28_5516863b.jpg','image','jpg','s3','2025-10-04 07:14:34.745','2025-10-04 07:14:34.745'),(586,'WhatsApp Image 2025-10-04 at 13.19.36_35826393.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.19.36_35826393.jpg','image','jpg','s3','2025-10-04 07:24:05.876','2025-10-04 07:24:05.876'),(587,'WhatsApp Image 2025-10-04 at 13.23.28_0bba62cf.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.23.28_0bba62cf.jpg','image','jpg','s3','2025-10-04 07:24:05.955','2025-10-04 07:24:05.955'),(588,'Boost Productivity.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity.png','image','png','s3','2025-10-04 08:45:35.434','2025-10-04 08:45:35.434'),(589,'Boost Productivity (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (1).png','image','png','s3','2025-10-04 08:45:35.500','2025-10-04 08:45:35.500'),(590,'Boost Productivity.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity.png','image','png','s3','2025-10-04 08:48:54.292','2025-10-04 08:48:54.292'),(591,'Boost Productivity (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (1).png','image','png','s3','2025-10-04 08:48:54.334','2025-10-04 08:48:54.334'),(592,'WhatsApp Image 2025-10-04 at 14.48.55_6b0b180f.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 14.48.55_6b0b180f.jpg','image','jpg','s3','2025-10-04 08:52:33.550','2025-10-04 08:52:33.550'),(593,'Boost Productivity (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (2).png','image','png','s3','2025-10-04 08:52:33.618','2025-10-04 08:52:33.618'),(594,'Boost Productivity (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (2).png','image','png','s3','2025-10-04 08:53:18.031','2025-10-04 08:53:18.031'),(595,'WhatsApp Image 2025-10-04 at 14.48.55_6b0b180f.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 14.48.55_6b0b180f.jpg','image','jpg','s3','2025-10-04 08:53:18.066','2025-10-04 08:53:18.066'),(596,'MD Abdullah AL Roman New.pdf','https://s3.ap-south-1.amazonaws.com/emr.buckett/MD Abdullah AL Roman New.pdf','application','pdf','s3','2025-10-07 06:24:45.558','2025-10-07 06:24:45.558'),(597,'inbound6480911592850066145.pdf','https://s3.ap-south-1.amazonaws.com/emr.buckett/inbound6480911592850066145.pdf','application','pdf','s3','2025-10-11 19:24:37.569','2025-10-11 19:24:37.569'),(598,'Abu Bashir - Startsmartz Technology.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/Abu Bashir - Startsmartz Technology.jpg','image','jpg','s3','2025-10-16 05:22:32.217','2025-10-16 05:22:32.217'),(599,'WhatsApp Image 2025-10-18 at 9.50.02 AM.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-18 at 9.50.02 AM.jpeg','image','jpeg','s3','2025-10-18 03:51:14.253','2025-10-18 03:51:14.253'),(600,'CV-Junaed Mahfuz.pdf','https://s3.ap-south-1.amazonaws.com/emr.buckett/CV-Junaed Mahfuz.pdf','application','pdf','s3','2025-10-18 05:04:19.398','2025-10-18 05:04:19.398'),(605,'Startsmartz_Logo[2].png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Startsmartz_Logo[2].png','image','png','s3','2025-10-20 11:15:29.343','2025-10-20 11:15:29.343'),(606,'Startsmartz_Logo[2].png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Startsmartz_Logo[2].png','image','png','s3','2025-10-20 11:16:07.773','2025-10-20 11:16:07.773'),(614,'Hotel Management System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel Management System.png','image','png','s3','2025-10-21 04:55:32.319','2025-10-21 04:55:32.319'),(615,'Video Streaming & Content Delivery Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Video Streaming & Content Delivery Platform.png','image','png','s3','2025-10-21 04:55:54.376','2025-10-21 04:55:54.376'),(616,'Learning Management & Virtual Training Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Learning Management & Virtual Training Platform.png','image','png','s3','2025-10-21 04:56:10.165','2025-10-21 04:56:10.165'),(617,'AI-Integrated Electronic Medical Records System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI-Integrated Electronic Medical Records System.png','image','png','s3','2025-10-21 04:56:28.603','2025-10-21 04:56:28.603'),(618,'Hospital & Pharmacy Management.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hospital & Pharmacy Management.png','image','png','s3','2025-10-21 04:56:45.110','2025-10-21 04:56:45.110'),(619,'E-Commerce & Retail Management Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/E-Commerce & Retail Management Platform.png','image','png','s3','2025-10-21 04:56:56.556','2025-10-21 04:56:56.556'),(620,'HR & Workforce Management System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/HR & Workforce Management System.png','image','png','s3','2025-10-21 04:57:21.620','2025-10-21 04:57:21.620'),(622,'Education.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Education.png','image','png','s3','2025-10-21 05:57:25.239','2025-10-21 05:57:25.239'),(623,'Healthcare.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Healthcare.png','image','png','s3','2025-10-21 05:58:05.043','2025-10-21 05:58:05.043'),(625,'Retail & E-Commerce.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Retail & E-Commerce.png','image','png','s3','2025-10-21 05:58:58.989','2025-10-21 05:58:58.989'),(626,'HR & Workforce.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/HR & Workforce.png','image','png','s3','2025-10-21 05:59:19.333','2025-10-21 05:59:19.333'),(627,'Media & Streaming.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Media & Streaming.png','image','png','s3','2025-10-21 05:59:51.720','2025-10-21 05:59:51.720'),(628,'Real Estate.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Real Estate.png','image','png','s3','2025-10-21 06:00:57.370','2025-10-21 06:00:57.370'),(630,'Government & Public Sector.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Government & Public Sector.png','image','png','s3','2025-10-21 06:01:31.426','2025-10-21 06:01:31.426'),(632,'HR & Workforce Management System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/HR & Workforce Management System.png','image','png','s3','2025-10-21 06:23:13.222','2025-10-21 06:23:13.222'),(633,'Video Streaming & Content Delivery Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Video Streaming & Content Delivery Platform.png','image','png','s3','2025-10-21 06:24:15.498','2025-10-21 06:24:15.498'),(634,'Hotel Management System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel Management System.png','image','png','s3','2025-10-21 06:26:33.061','2025-10-21 06:26:33.061'),(635,'E-Commerce & Retail Management Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/E-Commerce & Retail Management Platform.png','image','png','s3','2025-10-21 06:27:28.372','2025-10-21 06:27:28.372'),(636,'Learning Management & Virtual Training Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Learning Management & Virtual Training Platform.png','image','png','s3','2025-10-21 06:32:04.166','2025-10-21 06:32:04.166'),(637,'AI-Integrated Electronic Medical Records System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI-Integrated Electronic Medical Records System.png','image','png','s3','2025-10-21 06:32:45.696','2025-10-21 06:32:45.696'),(645,'SaaS Product Engineering (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (1).png','image','png','s3','2025-10-21 07:00:26.133','2025-10-21 07:00:26.133'),(649,'ai.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/ai.png','image','png','link','2025-10-21 09:05:53.666','2025-10-21 09:05:53.666'),(653,'Logistics & Supply Chain.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Logistics & Supply Chain.png','image','png','s3','2025-10-21 09:14:36.709','2025-10-21 09:14:36.709'),(655,'FinTech (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/FinTech (1).png','image','png','s3','2025-10-21 09:26:20.401','2025-10-21 09:26:20.401'),(656,'Pink Purple Gradient Modern Technology Logo (7).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pink Purple Gradient Modern Technology Logo (7).png','image','png','s3','2025-10-21 09:48:21.119','2025-10-21 09:48:21.119'),(681,'aboutus3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/aboutus3.png','image','png','s3','2025-10-22 06:17:01.685','2025-10-22 06:17:01.685'),(682,'aboutus2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/aboutus2.png','image','png','s3','2025-10-22 06:17:02.763','2025-10-22 06:17:02.763'),(683,'aboutus1.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/aboutus1.png','image','png','s3','2025-10-22 06:17:03.987','2025-10-22 06:17:03.987'),(684,'WhatsApp Image 2025-10-22 at 12.43.44.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-22 at 12.43.44.jpeg','image','jpeg','s3','2025-10-22 06:45:37.688','2025-10-22 06:45:37.688'),(685,'WhatsApp Image 2025-10-22 at 12.43.44.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-22 at 12.43.44.jpeg','image','jpeg','s3','2025-10-22 06:49:04.320','2025-10-22 06:49:04.320'),(686,'WhatsApp Image 2025-10-22 at 12.42.23.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-22 at 12.42.23.jpeg','image','jpeg','s3','2025-10-22 06:49:56.204','2025-10-22 06:49:56.204'),(688,'Masud (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Masud (1).png','image','png','s3','2025-10-22 06:51:08.470','2025-10-22 06:51:08.470'),(689,'Mohasin.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Mohasin.png','image','png','s3','2025-10-22 06:51:32.990','2025-10-22 06:51:32.990'),(690,'Shahanaj.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shahanaj.png','image','png','s3','2025-10-22 06:51:53.230','2025-10-22 06:51:53.230'),(691,'Sahil (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Sahil (1).png','image','png','link','2025-10-22 06:52:23.015','2025-10-22 06:52:23.015'),(697,'AI, IoT & Cloud.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI, IoT & Cloud.png','image','png','s3','2025-10-23 11:18:26.193','2025-10-23 11:18:26.193'),(698,'Logistics & Supply Chain.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Logistics & Supply Chain.png','image','png','s3','2025-10-23 11:18:26.369','2025-10-23 11:18:26.369'),(699,'SaaS Product Engineering.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering.png','image','png','s3','2025-10-23 11:18:26.535','2025-10-23 11:18:26.535'),(700,'WhatsApp Image 2025-09-15 at 13.08.40.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 13.08.40.jpeg','image','jpeg','s3','2025-10-23 11:31:59.433','2025-10-23 11:31:59.433'),(701,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-10-23 11:31:59.674','2025-10-23 11:31:59.674'),(702,'ddd.ico','https://s3.ap-south-1.amazonaws.com/emr.buckett/ddd.ico','image','ico','s3','2025-10-23 11:31:59.818','2025-10-23 11:31:59.818'),(703,'Startsmartz_Logo[2].png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Startsmartz_Logo[2].png','image','png','s3','2025-10-23 11:31:59.956','2025-10-23 11:31:59.956'),(704,'79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/79904e8c-8d9b-49ce-a5a6-df67e6c9b425.jpg','image','jpg','s3','2025-10-23 11:32:19.879','2025-10-23 11:32:19.879'),(705,'WhatsApp Image 2025-09-15 at 12.09.48.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-09-15 at 12.09.48.jpeg','image','jpeg','s3','2025-10-23 11:32:20.136','2025-10-23 11:32:20.136'),(706,'Startsmartz_Logo[2].png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Startsmartz_Logo[2].png','image','png','s3','2025-10-23 11:32:20.297','2025-10-23 11:32:20.297'),(707,'the-batman-1646069186545.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/the-batman-1646069186545.jpg','image','jpg','s3','2025-10-23 11:32:20.720','2025-10-23 11:32:20.720'),(708,'Custom Software Development.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development.png','image','png','s3','2025-10-25 03:45:36.315','2025-10-25 03:45:36.315'),(709,'Custom Software Development2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development2.png','image','png','s3','2025-10-25 03:45:36.599','2025-10-25 03:45:36.599'),(710,'Custom Software Development3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development3.png','image','png','s3','2025-10-25 03:45:36.776','2025-10-25 03:45:36.776'),(711,'Custom Software Development4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development4.png','image','png','s3','2025-10-25 03:45:36.996','2025-10-25 03:45:36.996'),(712,'Custom Software Development.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development.png','image','png','s3','2025-10-25 03:47:26.506','2025-10-25 03:47:26.506'),(713,'Custom Software Development2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development2.png','image','png','s3','2025-10-25 03:47:26.714','2025-10-25 03:47:26.714'),(714,'Custom Software Development3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development3.png','image','png','s3','2025-10-25 03:47:26.916','2025-10-25 03:47:26.916'),(715,'Custom Software Development4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development4.png','image','png','s3','2025-10-25 03:47:27.133','2025-10-25 03:47:27.133'),(716,'Custom Software Development.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development.png','image','png','s3','2025-10-25 05:54:51.966','2025-10-25 05:54:51.966'),(717,'Custom Software Development2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development2.png','image','png','s3','2025-10-25 05:54:52.302','2025-10-25 05:54:52.302'),(718,'Custom Software Development3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development3.png','image','png','s3','2025-10-25 05:54:52.696','2025-10-25 05:54:52.696'),(719,'Custom Software Development4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development4.png','image','png','s3','2025-10-25 05:54:53.232','2025-10-25 05:54:53.232'),(721,'We Build Solutions for Your Bottom Line.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Build Solutions for Your Bottom Line.png','image','png','s3','2025-10-25 06:14:19.383','2025-10-25 06:14:19.383'),(722,'Clear Communication and Zero Surprises 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Clear Communication and Zero Surprises 2.png','image','png','s3','2025-10-25 06:14:41.949','2025-10-25 06:14:41.949'),(723,'Peace of Mind Through Effortless Scaling.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Peace of Mind Through Effortless Scaling.png','image','png','s3','2025-10-25 06:15:09.371','2025-10-25 06:15:09.371'),(724,'We Protect You Like Our Own Business.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Protect You Like Our Own Business.png','image','png','s3','2025-10-25 06:15:31.589','2025-10-25 06:15:31.589'),(725,'We Build Your Future-Proof Platform .png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Build Your Future-Proof Platform .png','image','png','s3','2025-10-25 06:15:54.424','2025-10-25 06:15:54.424'),(726,'Real Partnership, Not Just a Transaction 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Real Partnership, Not Just a Transaction 2.png','image','png','s3','2025-10-25 06:16:56.110','2025-10-25 06:16:56.110'),(727,'AI & Data Solutions 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions 2.png','image','png','s3','2025-10-25 09:37:52.362','2025-10-25 09:37:52.362'),(728,'AI & Data Solutions 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions 3.png','image','png','s3','2025-10-25 09:37:52.568','2025-10-25 09:37:52.568'),(729,'AI & Data Solutions 4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions 4.png','image','png','s3','2025-10-25 09:37:52.737','2025-10-25 09:37:52.737'),(730,'AI & Data Solutions.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions.png','image','png','s3','2025-10-25 09:37:52.932','2025-10-25 09:37:52.932'),(731,'Guaranteed ROI Focus 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Guaranteed ROI Focus 3.png','image','png','s3','2025-10-25 10:09:19.749','2025-10-25 10:09:19.749'),(732,'Full-Stack Data Expertise.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Full-Stack Data Expertise.png','image','png','s3','2025-10-25 10:09:39.786','2025-10-25 10:09:39.786'),(733,'Rapid Time-to-Value 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Rapid Time-to-Value 3.png','image','png','s3','2025-10-25 10:09:54.571','2025-10-25 10:09:54.571'),(734,'Scalable, Future-Proof Architecture 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Scalable, Future-Proof Architecture 3.png','image','png','s3','2025-10-25 10:10:10.571','2025-10-25 10:10:10.571'),(735,'Ethical & Compliant AI 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Ethical & Compliant AI 2.png','image','png','s3','2025-10-25 10:10:25.153','2025-10-25 10:10:25.153'),(736,'Cross-Functional Elite Team 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Cross-Functional Elite Team 3.png','image','png','s3','2025-10-25 10:10:38.096','2025-10-25 10:10:38.096'),(737,'Digital Marketing & Brand Growth (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth (2).png','image','png','s3','2025-10-25 10:12:26.109','2025-10-25 10:12:26.109'),(738,'Digital Marketing & Brand Growth (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth (3).png','image','png','s3','2025-10-25 10:12:26.271','2025-10-25 10:12:26.271'),(739,'Digital Marketing & Brand Growth (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth (4).png','image','png','s3','2025-10-25 10:12:26.433','2025-10-25 10:12:26.433'),(740,'Digital Marketing & Brand Growth.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth.png','image','png','s3','2025-10-25 10:12:26.593','2025-10-25 10:12:26.593'),(741,'We Guarantee Your Project Stays on Budget 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Guarantee Your Project Stays on Budget 2.png','image','png','s3','2025-10-25 10:20:32.335','2025-10-25 10:20:32.335'),(742,'Built to Integrate, Not to Replace 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Built to Integrate, Not to Replace 2.png','image','png','s3','2025-10-25 10:20:43.915','2025-10-25 10:20:43.915'),(743,'We Solve Problems, We Donât Just Take Orders 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Solve Problems, We Donât Just Take Orders 3.png','image','png','s3','2025-10-25 10:20:56.235','2025-10-25 10:20:56.235'),(744,'Architecture Designed to Handle âViralâ Moments 2 .png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Architecture Designed to Handle âViralâ Moments 2 .png','image','png','s3','2025-10-25 10:21:11.927','2025-10-25 10:21:11.927'),(745,'Your Dedicated âTech Whispererâ on Demand.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Your Dedicated âTech Whispererâ on Demand.png','image','png','s3','2025-10-25 10:21:47.985','2025-10-25 10:21:47.985'),(746,'We Only Take On Projects We Truly Believe In.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Only Take On Projects We Truly Believe In.png','image','png','s3','2025-10-25 10:22:06.735','2025-10-25 10:22:06.735'),(747,'UI_UX (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX (2).png','image','png','s3','2025-10-25 10:23:31.456','2025-10-25 10:23:31.456'),(748,'UI_UX (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX (3).png','image','png','s3','2025-10-25 10:23:31.626','2025-10-25 10:23:31.626'),(749,'UI_UX (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX (4).png','image','png','s3','2025-10-25 10:23:31.806','2025-10-25 10:23:31.806'),(750,'UI_UX.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX.png','image','png','s3','2025-10-25 10:23:32.329','2025-10-25 10:23:32.329'),(752,'We Solve Problems, We Donât Just Take Orders .png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Solve Problems, We Donât Just Take Orders .png','image','png','s3','2025-10-25 10:34:18.044','2025-10-25 10:34:18.044'),(753,'Architecture Designed to Handle âViralâ Moments  (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Architecture Designed to Handle âViralâ Moments  (2).png','image','png','s3','2025-10-25 10:34:33.690','2025-10-25 10:34:33.690'),(754,'We Embed with Your Team, We Donât Work in a Bubble (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Embed with Your Team, We Donât Work in a Bubble (1).png','image','png','s3','2025-10-25 10:34:52.408','2025-10-25 10:34:52.408'),(755,'Real Quality Assurance, Not Just a Checklist 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Real Quality Assurance, Not Just a Checklist 3.png','image','png','s3','2025-10-25 10:35:06.532','2025-10-25 10:35:06.532'),(756,'We Only Take On Projects We Truly Believe In (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Only Take On Projects We Truly Believe In (1).png','image','png','s3','2025-10-25 10:35:19.284','2025-10-25 10:35:19.284'),(763,'WhatsApp Image 2025-10-25 at 16.44.08.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-25 at 16.44.08.jpeg','image','jpeg','s3','2025-10-25 10:58:38.941','2025-10-25 10:58:38.941'),(764,'SaaS Product Engineering (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (2).png','image','png','s3','2025-10-25 10:59:58.230','2025-10-25 10:59:58.230'),(765,'SaaS Product Engineering (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (3).png','image','png','s3','2025-10-25 10:59:58.485','2025-10-25 10:59:58.485'),(766,'SaaS Product Engineering (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (4).png','image','png','s3','2025-10-25 10:59:58.665','2025-10-25 10:59:58.665'),(767,'SaaS Product Engineering.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering.png','image','png','s3','2025-10-25 10:59:58.827','2025-10-25 10:59:58.827'),(768,'We Guarantee Absolute Customer Data Privacy.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Guarantee Absolute Customer Data Privacy.png','image','png','s3','2025-10-25 11:03:02.163','2025-10-25 11:03:02.163'),(769,'Your First Feature Release Will Be Your Fastest 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Your First Feature Release Will Be Your Fastest 2.png','image','png','s3','2025-10-25 11:03:14.267','2025-10-25 11:03:14.267'),(770,'Pricing & Billing That Never Causes Churn 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pricing & Billing That Never Causes Churn 2.png','image','png','s3','2025-10-25 11:03:26.595','2025-10-25 11:03:26.595'),(771,'Engineered to Crush the Next Growth Surge 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Engineered to Crush the Next Growth Surge 3.png','image','png','s3','2025-10-25 11:03:41.085','2025-10-25 11:03:41.085'),(772,'We Prevent Vendor Lock-in (Itâs Your Product).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Prevent Vendor Lock-in (Itâs Your Product).png','image','png','s3','2025-10-25 11:03:52.841','2025-10-25 11:03:52.841'),(773,'Continuous Updates Without Crashing the System (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Continuous Updates Without Crashing the System (1).png','image','png','s3','2025-10-25 11:04:03.858','2025-10-25 11:04:03.858'),(774,'DevOps (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (2).png','image','png','s3','2025-10-25 11:05:30.682','2025-10-25 11:05:30.682'),(775,'DevOps (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (3).png','image','png','s3','2025-10-25 11:05:30.885','2025-10-25 11:05:30.885'),(776,'DevOps (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (4).png','image','png','s3','2025-10-25 11:05:31.078','2025-10-25 11:05:31.078'),(777,'DevOps.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps.png','image','png','s3','2025-10-25 11:05:31.271','2025-10-25 11:05:31.271'),(778,'We Guarantee Near-Zero Downtime for Updates.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Guarantee Near-Zero Downtime for Updates.png','image','png','s3','2025-10-25 11:08:35.004','2025-10-25 11:08:35.004'),(780,'We Turn Your Cloud Bill Into a Predictable Cost 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Turn Your Cloud Bill Into a Predictable Cost 2.png','image','png','s3','2025-10-25 11:08:54.881','2025-10-25 11:08:54.881'),(781,'You Stop Paying for Servers Sitting Idle 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/You Stop Paying for Servers Sitting Idle 2.png','image','png','s3','2025-10-25 11:09:12.874','2025-10-25 11:09:12.874'),(782,'We Engineer Security Scans Directly into the Process 3 (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/We Engineer Security Scans Directly into the Process 3 (1).png','image','png','s3','2025-10-25 11:09:48.085','2025-10-25 11:09:48.085'),(783,'Your Developers Get Their Time Back to Build Features 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Your Developers Get Their Time Back to Build Features 3.png','image','png','s3','2025-10-25 11:10:02.404','2025-10-25 11:10:02.404'),(784,'Disaster Recovery Becomes a Single-Button Click 2 .png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Disaster Recovery Becomes a Single-Button Click 2 .png','image','png','s3','2025-10-25 11:10:17.628','2025-10-25 11:10:17.628'),(785,'Education (2) (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Education (2) (1).png','image','png','s3','2025-10-25 11:11:55.789','2025-10-25 11:11:55.789'),(787,'disital3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/disital3.png','image','png','s3','2025-10-25 11:13:10.782','2025-10-25 11:13:10.782'),(788,'uiux4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/uiux4.png','image','png','s3','2025-10-26 03:53:59.920','2025-10-26 03:53:59.920'),(790,'AI-Integrated Electronic Medical Records System.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI-Integrated Electronic Medical Records System.png','image','png','s3','2025-10-26 04:16:06.374','2025-10-26 04:16:06.374'),(791,'Video Streaming & Content Delivery Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Video Streaming & Content Delivery Platform.png','image','png','s3','2025-10-26 06:23:52.300','2025-10-26 06:23:52.300'),(792,'EMR 1 image.jpg','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 1 image.jpg','image','jpg','s3','2025-10-26 06:29:03.970','2025-10-26 06:29:03.970'),(793,'emr image 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/emr image 2.png','image','png','s3','2025-10-26 06:29:04.350','2025-10-26 06:29:04.350'),(794,'WhatsApp Image 2025-10-26 at 16.50.07.jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-26 at 16.50.07.jpeg','image','jpeg','s3','2025-10-26 11:02:38.875','2025-10-26 11:02:38.875'),(795,'Learning Management & Virtual Training Platform.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Learning Management & Virtual Training Platform.png','image','png','s3','2025-10-27 05:43:17.243','2025-10-27 05:43:17.243'),(796,'EMR 1.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 1.png','image','png','s3','2025-10-27 06:13:04.118','2025-10-27 06:13:04.118'),(797,'EMR 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 2.png','image','png','s3','2025-10-27 06:13:25.474','2025-10-27 06:13:25.474'),(798,'EMR 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 3.png','image','png','s3','2025-10-27 06:14:10.535','2025-10-27 06:14:10.535'),(799,'EMR 4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 4.png','image','png','s3','2025-10-27 06:14:32.049','2025-10-27 06:14:32.049'),(800,'LMS 1.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/LMS 1.png','image','png','s3','2025-10-27 06:17:03.570','2025-10-27 06:17:03.570'),(801,'LMS 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/LMS 2.png','image','png','s3','2025-10-27 06:17:36.685','2025-10-27 06:17:36.685'),(802,'LMS 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/LMS 3.png','image','png','s3','2025-10-27 06:17:56.239','2025-10-27 06:17:56.239'),(803,'image.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/image.png','image','png','s3','2025-10-27 09:32:52.483','2025-10-27 09:32:52.483'),(804,'image.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/image.png','image','png','s3','2025-10-27 09:34:34.671','2025-10-27 09:34:34.671'),(805,'image (1).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/image (1).png','image','png','s3','2025-10-27 09:34:35.261','2025-10-27 09:34:35.261'),(806,'WhatsApp Image 2025-10-26 at 16.52.36 (1).jpeg','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-26 at 16.52.36 (1).jpeg','image','jpeg','s3','2025-10-27 09:38:06.989','2025-10-27 09:38:06.989'),(807,'DevOps (3)1234.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (3)1234.png','image','png','s3','2025-10-27 10:00:06.598','2025-10-27 10:00:06.598'),(808,'Custom Software Development2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development2.png','image','png','s3','2025-10-27 10:17:12.577','2025-10-27 10:17:12.577'),(809,'Custom Software Development3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development3.png','image','png','s3','2025-10-27 10:17:12.915','2025-10-27 10:17:12.915'),(810,'Custom Software Development4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development4.png','image','png','s3','2025-10-27 10:17:13.218','2025-10-27 10:17:13.218'),(811,'Custom Software Development123456.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Custom Software Development123456.png','image','png','s3','2025-10-27 10:17:13.470','2025-10-27 10:17:13.470'),(812,'AI & Data Solutions 2.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions 2.png','image','png','s3','2025-10-27 10:21:12.698','2025-10-27 10:21:12.698'),(813,'AI & Data Solutions 3.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions 3.png','image','png','s3','2025-10-27 10:21:12.963','2025-10-27 10:21:12.963'),(814,'AI & Data Solutions 4.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions 4.png','image','png','s3','2025-10-27 10:21:13.263','2025-10-27 10:21:13.263'),(815,'AI & Data Solutions.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/AI & Data Solutions.png','image','png','s3','2025-10-27 10:21:13.555','2025-10-27 10:21:13.555'),(816,'Digital Marketing & Brand Growth (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth (2).png','image','png','s3','2025-10-27 10:22:01.369','2025-10-27 10:22:01.369'),(817,'Digital Marketing & Brand Growth (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth (3).png','image','png','s3','2025-10-27 10:22:01.589','2025-10-27 10:22:01.589'),(818,'Digital Marketing & Brand Growth (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth (4).png','image','png','s3','2025-10-27 10:22:01.890','2025-10-27 10:22:01.890'),(819,'Digital Marketing & Brand Growth.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/Digital Marketing & Brand Growth.png','image','png','s3','2025-10-27 10:22:02.145','2025-10-27 10:22:02.145'),(820,'UI_UX (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX (2).png','image','png','s3','2025-10-27 10:22:50.246','2025-10-27 10:22:50.246'),(821,'UI_UX (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX (3).png','image','png','s3','2025-10-27 10:22:50.502','2025-10-27 10:22:50.502'),(822,'UI_UX (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX (4).png','image','png','s3','2025-10-27 10:22:50.778','2025-10-27 10:22:50.778'),(823,'UI_UX.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/UI_UX.png','image','png','s3','2025-10-27 10:22:51.136','2025-10-27 10:22:51.136'),(824,'SaaS Product Engineering (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (2).png','image','png','s3','2025-10-27 10:23:30.051','2025-10-27 10:23:30.051'),(825,'SaaS Product Engineering (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (3).png','image','png','s3','2025-10-27 10:23:30.390','2025-10-27 10:23:30.390'),(826,'SaaS Product Engineering (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering (4).png','image','png','s3','2025-10-27 10:23:30.702','2025-10-27 10:23:30.702'),(827,'SaaS Product Engineering.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/SaaS Product Engineering.png','image','png','s3','2025-10-27 10:23:30.902','2025-10-27 10:23:30.902'),(828,'DevOps (2).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (2).png','image','png','s3','2025-10-27 10:24:07.038','2025-10-27 10:24:07.038'),(829,'DevOps (3).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (3).png','image','png','s3','2025-10-27 10:24:07.320','2025-10-27 10:24:07.320'),(830,'DevOps (4).png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps (4).png','image','png','s3','2025-10-27 10:24:07.863','2025-10-27 10:24:07.863'),(831,'DevOps.png','https://s3.ap-south-1.amazonaws.com/emr.buckett/DevOps.png','image','png','s3','2025-10-27 10:24:08.066','2025-10-27 10:24:08.066');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_expertise_category`
--

DROP TABLE IF EXISTS `industry_expertise_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry_expertise_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Industry_Expertise_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Industry_Expertise_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_expertise_category`
--

LOCK TABLES `industry_expertise_category` WRITE;
/*!40000 ALTER TABLE `industry_expertise_category` DISABLE KEYS */;
INSERT INTO `industry_expertise_category` VALUES (1,'EdTech',NULL,622,'2025-09-05 04:58:09.629','2025-10-21 05:57:25.250'),(2,'Healthcare',NULL,623,'2025-09-05 04:58:30.357','2025-10-21 05:58:05.053'),(3,'Fintech & Insurance',NULL,655,'2025-09-05 04:59:20.307','2025-10-21 09:26:20.416'),(4,'Retail & E-Commerce',NULL,625,'2025-09-05 04:59:39.642','2025-10-21 05:58:59.005'),(5,'HR & Workforce',NULL,626,'2025-09-05 04:59:54.622','2025-10-21 05:59:19.351'),(6,'Media & Streaming',NULL,627,'2025-09-05 05:00:20.318','2025-10-21 05:59:51.736'),(7,'Hospitality & Real Estate',NULL,628,'2025-09-05 05:00:46.322','2025-10-21 06:00:57.380'),(8,'Logistics & Supply Chain',NULL,653,'2025-09-05 05:01:02.648','2025-10-21 09:14:36.762'),(13,'Government & Public Sector',NULL,630,'2025-10-21 06:01:31.444','2025-10-21 06:01:31.444'),(14,'AI, IoT & Cloud',NULL,656,'2025-10-21 06:01:45.308','2025-10-21 09:48:21.155');
/*!40000 ALTER TABLE `industry_expertise_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_expertise_information`
--

DROP TABLE IF EXISTS `industry_expertise_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry_expertise_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Industry_Expertise_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Industry_Expertise_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_expertise_information`
--

LOCK TABLES `industry_expertise_information` WRITE;
/*!40000 ALTER TABLE `industry_expertise_information` DISABLE KEYS */;
INSERT INTO `industry_expertise_information` VALUES (1,'Industry Expertise','At Startsmartz, we combine youthful passion and veteran expertise to deliver modern, trend-aware solutions that empower startups and enterprises, solving real business challenges efficiently and effectively.',NULL,NULL,'2025-08-27 03:05:51.196','2025-10-27 10:01:09.060');
/*!40000 ALTER TABLE `industry_expertise_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_feature`
--

DROP TABLE IF EXISTS `industry_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `industry_id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Industry_Feature_industry_id_sort_order_idx` (`industry_id`,`sort_order`),
  KEY `Industry_Feature_file_id_fkey` (`file_id`),
  CONSTRAINT `Industry_Feature_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Industry_Feature_industry_id_fkey` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_feature`
--

LOCK TABLES `industry_feature` WRITE;
/*!40000 ALTER TABLE `industry_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introduction_information`
--

DROP TABLE IF EXISTS `introduction_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `introduction_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Introduction_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Introduction_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introduction_information`
--

LOCK TABLES `introduction_information` WRITE;
/*!40000 ALTER TABLE `introduction_information` DISABLE KEYS */;
INSERT INTO `introduction_information` VALUES (2,'Bridging For Progress','At Startsmartz, we deliver practical technology that empowers businesses by understanding challenges and providing the right tools for success',NULL,NULL,'2025-09-18 10:39:56.163','2025-10-21 09:04:04.679');
/*!40000 ALTER TABLE `introduction_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application`
--

DROP TABLE IF EXISTS `job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_experience` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_expectation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int DEFAULT NULL,
  `job_offer_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Job_Application_file_id_fkey` (`file_id`),
  KEY `Job_Application_job_offer_id_fkey` (`job_offer_id`),
  CONSTRAINT `Job_Application_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Job_Application_job_offer_id_fkey` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
INSERT INTO `job_application` VALUES (15,'Md Abdullah Al Roman','abdullahalroman003@gmail.com','+8801732808547','5','40000',596,10,'2025-10-07 06:24:45.614','2025-10-07 06:24:45.614'),(16,'Ibrahim Bhuiyan','ibrahim.bhuiyan.783@gmail.com','+8801837333995','1','25000',597,10,'2025-10-11 19:24:37.583','2025-10-11 19:24:37.583'),(17,'Junaed Mahfuz','junaed.mahfuz@gmail.com','+8801705039166','19','60000',600,10,'2025-10-18 05:04:19.411','2025-10-18 05:04:19.411');
/*!40000 ALTER TABLE `job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offer`
--

DROP TABLE IF EXISTS `job_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vacancy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Job_Offer_file_id_fkey` (`file_id`),
  CONSTRAINT `Job_Offer_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer`
--

LOCK TABLES `job_offer` WRITE;
/*!40000 ALTER TABLE `job_offer` DISABLE KEYS */;
INSERT INTO `job_offer` VALUES (10,'Marketing Executive ','IT Website Promotion & Branding','Overview: The Marketing Executive will be responsible for planning, executing, and managing online and offline marketing strategies to increase the visibility, credibility, and reach of Startsmartz Technologies. The candidate must have a strong background in IT marketing, branding, website promotion, and digital campaigns.\n',NULL,NULL,NULL,'2025-10-04 05:22:28.334','2025-10-04 05:24:34.240');
/*!40000 ALTER TABLE `job_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offer_seo`
--

DROP TABLE IF EXISTS `job_offer_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer_seo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `job_offer_id` int NOT NULL,
  `meta_image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_offer_id` (`job_offer_id`),
  KEY `fk_job_offer_file` (`meta_image_id`),
  CONSTRAINT `fk_job_offer` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_job_offer_file` FOREIGN KEY (`meta_image_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer_seo`
--

LOCK TABLES `job_offer_seo` WRITE;
/*!40000 ALTER TABLE `job_offer_seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_offer_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_opening_introduction`
--

DROP TABLE IF EXISTS `job_opening_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_opening_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Job_Opening_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Job_Opening_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_opening_introduction`
--

LOCK TABLES `job_opening_introduction` WRITE;
/*!40000 ALTER TABLE `job_opening_introduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_opening_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_requirement`
--

DROP TABLE IF EXISTS `job_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_requirement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_offer_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Job_Requirement_job_offer_id_fkey` (`job_offer_id`),
  CONSTRAINT `Job_Requirement_job_offer_id_fkey` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requirement`
--

LOCK TABLES `job_requirement` WRITE;
/*!40000 ALTER TABLE `job_requirement` DISABLE KEYS */;
INSERT INTO `job_requirement` VALUES (7,'Qualifications & Requirements','Bachelor’s degree in marketing, Business Administration, or related field.',10,'2025-10-04 05:25:46.966','2025-10-04 05:25:46.966'),(8,'Qualifications & Requirements','3–4 years of professional experience in marketing (preferably in the IT or software industry).',10,'2025-10-04 05:26:13.763','2025-10-04 05:26:13.763'),(9,'Qualifications & Requirements','Strong knowledge of digital marketing tools and platforms (Google Ads, Facebook Ads, LinkedIn, Analytics, SEO/SEM).',10,'2025-10-04 05:26:45.260','2025-10-04 05:26:45.260'),(10,'Qualifications & Requirements','Excellent communication and interpersonal skills in English and Bangla.',10,'2025-10-04 05:27:06.590','2025-10-04 05:27:06.590'),(11,'Qualifications & Requirements','Creative mindset with a strategic approach to brand positioning.',10,'2025-10-04 05:32:24.154','2025-10-04 05:32:24.154'),(12,'Qualifications & Requirements','Ability to work independently and as part of a dynamic team.',10,'2025-10-04 05:32:43.614','2025-10-04 05:32:43.614'),(13,'Qualifications & Requirements','Proven track record in branding and corporate promotion.',10,'2025-10-04 05:33:00.668','2025-10-04 05:33:00.668');
/*!40000 ALTER TABLE `job_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_benefits`
--

DROP TABLE IF EXISTS `key_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_benefits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_benefits`
--

LOCK TABLES `key_benefits` WRITE;
/*!40000 ALTER TABLE `key_benefits` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_benefits_feature`
--

DROP TABLE IF EXISTS `key_benefits_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_benefits_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_benefits_id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Key_Benefits_Feature_key_benefits_id_sort_order_idx` (`key_benefits_id`,`sort_order`),
  KEY `Key_Benefits_Feature_file_id_fkey` (`file_id`),
  CONSTRAINT `Key_Benefits_Feature_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Key_Benefits_Feature_key_benefits_id_fkey` FOREIGN KEY (`key_benefits_id`) REFERENCES `key_benefits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_benefits_feature`
--

LOCK TABLES `key_benefits_feature` WRITE;
/*!40000 ALTER TABLE `key_benefits_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_benefits_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadership_team_insight_introduction`
--

DROP TABLE IF EXISTS `leadership_team_insight_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leadership_team_insight_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Leadership_Team_Insight_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Leadership_Team_Insight_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadership_team_insight_introduction`
--

LOCK TABLES `leadership_team_insight_introduction` WRITE;
/*!40000 ALTER TABLE `leadership_team_insight_introduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `leadership_team_insight_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadership_team_insight_member`
--

DROP TABLE IF EXISTS `leadership_team_insight_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leadership_team_insight_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Leadership_Team_Insight_Member_file_id_fkey` (`file_id`),
  CONSTRAINT `Leadership_Team_Insight_Member_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadership_team_insight_member`
--

LOCK TABLES `leadership_team_insight_member` WRITE;
/*!40000 ALTER TABLE `leadership_team_insight_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `leadership_team_insight_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` json DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (9,'📬 New Contact Form Submission','You have received a new contact form submission from Masud (masudrana@gmail.comm).','contact_form',1,'{\"name\": \"Masud\", \"email\": \"masudrana@gmail.comm\", \"phone\": \"+8801951835496\", \"message\": \"test\", \"timestamp\": \"2025-09-27T04:21:27.418Z\", \"contactFormId\": 18}','2025-09-27 04:21:27.419','2025-09-27 04:21:37.010'),(10,'📬 New Contact Form Submission','You have received a new contact form submission from Abrar Mahir Uddin Sahil (abrar.sahil3501@gmail.com).','contact_form',1,'{\"name\": \"Abrar Mahir Uddin Sahil\", \"email\": \"abrar.sahil3501@gmail.com\", \"phone\": \"+8801521536334\", \"message\": \"hello\", \"timestamp\": \"2025-10-04T05:44:45.728Z\", \"contactFormId\": 19}','2025-10-04 05:44:45.734','2025-10-04 05:44:57.380');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `otp_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime(3) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `OTP_user_id_fkey` (`user_id`),
  CONSTRAINT `OTP_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp`
--

LOCK TABLES `otp` WRITE;
/*!40000 ALTER TABLE `otp` DISABLE KEYS */;
INSERT INTO `otp` VALUES (123,'402933','2025-10-22 05:50:36.305',1,0,4,'2025-10-22 05:48:36.322','2025-10-22 05:49:13.359');
/*!40000 ALTER TABLE `otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `our_leadership_team_introduction`
--

DROP TABLE IF EXISTS `our_leadership_team_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `our_leadership_team_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Our_Leadership_Team_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Our_Leadership_Team_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `our_leadership_team_introduction`
--

LOCK TABLES `our_leadership_team_introduction` WRITE;
/*!40000 ALTER TABLE `our_leadership_team_introduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `our_leadership_team_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `our_leadership_team_member`
--

DROP TABLE IF EXISTS `our_leadership_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `our_leadership_team_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Our_Leadership_Team_Member_file_id_fkey` (`file_id`),
  CONSTRAINT `Our_Leadership_Team_Member_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `our_leadership_team_member`
--

LOCK TABLES `our_leadership_team_member` WRITE;
/*!40000 ALTER TABLE `our_leadership_team_member` DISABLE KEYS */;
INSERT INTO `our_leadership_team_member` VALUES (13,'Abu Zakir',' Managing Director & Owner',NULL,599,'2025-10-03 06:33:54.832','2025-10-18 03:51:14.263'),(14,'Abu Bashir','Chief Executive Officer',NULL,598,'2025-10-16 05:22:32.229','2025-10-16 05:22:32.229'),(15,'Abu Safayet Sifat','Executive Director',NULL,684,'2025-10-20 10:54:15.465','2025-10-22 06:45:37.704');
/*!40000 ALTER TABLE `our_leadership_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overview_information`
--

DROP TABLE IF EXISTS `overview_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overview_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Overview_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Overview_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overview_information`
--

LOCK TABLES `overview_information` WRITE;
/*!40000 ALTER TABLE `overview_information` DISABLE KEYS */;
INSERT INTO `overview_information` VALUES (4,' A Quick Look at Startsmartz','Learn how Startsmartz combines innovation and technology to bring meaningful value to customers through clear and effective approaches.',NULL,456,'2025-09-13 05:11:40.742','2025-09-19 05:16:12.959');
/*!40000 ALTER TABLE `overview_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `short_tagline` varchar(191) DEFAULT NULL,
  `description` text,
  `hero_title` varchar(191) DEFAULT NULL,
  `hero_subtitle` varchar(191) DEFAULT NULL,
  `hero_image` varchar(191) DEFAULT NULL,
  `product_category_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `slug_2` (`slug`),
  KEY `product_category_id` (`product_category_id`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (6,'e-commerce-retail-management-platform','E-Commerce & Retail Management Platform','Sales simplified, brand amplified.','Transform data into decisions. Accelerate growth with connected sales, inventory, and customer insights',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/E-Commerce & Retail Management Platform.png',NULL,'2025-09-24 10:07:41','2025-10-21 06:35:11'),(7,'hotel-management-system','Hotel Management System','The key to effortless hospitality','Focus on your guests, not the grind. Manage bookings, operations, and experiences effortlessly.',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel Management System.png',NULL,'2025-09-26 06:19:12','2025-10-21 06:26:33'),(8,'hospital-pharmacy-management','Hospital & Pharmacy Management','Smarter care, stronger trust','Unified control from patient admission to pharmacy operations, all in one system.',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/Hospital & Pharmacy Management.png',NULL,'2025-09-26 06:22:10','2025-10-21 04:56:45'),(9,'video-streaming-content-delivery-platform','Video Streaming & Content Delivery Platform','Content that connects and captivates.','High-speed, reliable video delivery built for modern content creators and audiences.',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/Video Streaming & Content Delivery Platform.png',NULL,'2025-09-26 06:25:48','2025-10-21 06:24:16'),(10,'hr-workforce-management-system','HR & Workforce Management System','Better teams, brighter workplace.','From hire to inspire, a unified platform that turns HR chaos into clarity and performance.',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/HR & Workforce Management System.png',NULL,'2025-09-27 06:10:03','2025-10-21 06:27:48'),(13,'learning-management-virtual-training-platform','Learning Management & Virtual Training Platform','Click, learn, conquer','Engaging digital learning that adapts to every learner’s pace and need.',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/Learning Management & Virtual Training Platform.png',NULL,'2025-10-21 06:32:04','2025-10-21 06:32:04'),(14,'ai-integrated-electronic-medical-records-system','AI-Integrated Electronic Medical Records System','Helping hospitals run smoothly and shine in care','Smarter patient management through connected, AI-powered healthcare data.',NULL,NULL,'https://s3.ap-south-1.amazonaws.com/emr.buckett/AI-Integrated Electronic Medical Records System.png',NULL,'2025-10-21 06:32:46','2025-10-21 06:32:46');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Product_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feature`
--

DROP TABLE IF EXISTS `product_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `heading` varchar(191) NOT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_feature` (`product_id`,`sort_order`),
  CONSTRAINT `Product_Feature_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feature`
--

LOCK TABLES `product_feature` WRITE;
/*!40000 ALTER TABLE `product_feature` DISABLE KEYS */;
INSERT INTO `product_feature` VALUES (4,8,'Powerful Features for Smarter Pharmacy Management',0,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(5,10,'Powerful Features for Smarter Business Management',0,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(7,9,'Everything You Need to Run a Successful Streaming Business',0,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(8,7,'Smarter Features for Seamless Hospitality',0,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(9,6,'All-in-One Tools to Power Your Online Business',0,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(10,14,'Core Features ',0,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(11,13,'Smarter Features for Seamless Learning',0,'2025-10-27 09:14:02','2025-10-27 09:14:44');
/*!40000 ALTER TABLE `product_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feature_group`
--

DROP TABLE IF EXISTS `product_feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feature_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` text,
  `icon_emoji` varchar(50) DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_group` (`product_id`,`sort_order`),
  CONSTRAINT `Product_Feature_Group_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feature_group`
--

LOCK TABLES `product_feature_group` WRITE;
/*!40000 ALTER TABLE `product_feature_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feature_item`
--

DROP TABLE IF EXISTS `product_feature_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feature_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `feature_id` int NOT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `group_order` int DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` text,
  `emoji` varchar(50) DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_fitem1` (`product_id`,`sort_order`),
  KEY `idx_fitem2` (`feature_id`,`sort_order`),
  KEY `idx_fitem3` (`feature_id`,`group_order`,`sort_order`),
  CONSTRAINT `Product_Feature_Item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Product_Feature_Item_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `product_feature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feature_item`
--

LOCK TABLES `product_feature_item` WRITE;
/*!40000 ALTER TABLE `product_feature_item` DISABLE KEYS */;
INSERT INTO `product_feature_item` VALUES (10,8,4,NULL,NULL,'Dashboard & Analytics','Get real-time insights on sales, purchases, and stock with interactive visual charts for quick decision-making.','📊',0,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(11,8,4,NULL,NULL,'Customer Management','Maintain patient and customer records with ease, ensuring faster service and improved care.','👥',10,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(12,8,4,NULL,NULL,'Supplier Management','Track supplier details, purchase history, and streamline supplier relationships in one place.','👥',20,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(13,8,4,NULL,NULL,'Medicine Management','Add medicines and FMCG products, track them by unit, batch, or expiry date, and stay ahead with low-stock and expiry alerts.','💊',100,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(14,8,4,NULL,NULL,'Inventory & Stock Control','Monitor stock levels in real time, reduce wastage, and never run out of essential medicines.','📦',110,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(15,8,4,NULL,NULL,'Purchase Management','Record purchases, review purchase history, and manage returns effortlessly.','🛒',200,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(16,8,4,NULL,NULL,'Sales & Billing','Generate invoices instantly, track sales history, and manage returns with integrated POS support.','🛒',210,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(17,8,4,NULL,NULL,'Expense Tracking','Track expenses, manage payables and receivables, and monitor cash flow effectively.','💰',300,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(18,8,4,NULL,NULL,'Accounts Management','Manage account types, track transactions, and generate key financial statements including balance sheet, income statement, and trial balance.','📑',310,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(19,8,4,NULL,NULL,'Bank Account Management','Handle multiple bank accounts, transactions, and reconciliations for smooth financial operations.','💰',320,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(20,8,4,NULL,NULL,'Comprehensive Reports','Generate daily, monthly, and yearly reports on sales, purchases, suppliers, and medicines. Export to Excel or PDF for audits and compliance.','📑',400,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(21,8,4,NULL,NULL,'Payment Methods','Offer flexible payment options including cash, card, and mobile banking for seamless transactions.','💳',410,'2025-09-30 05:05:05','2025-09-30 05:05:05'),(22,10,5,NULL,NULL,'Dashboard & Analytics','Get a centralized view of projects, tasks, HR activities, and company events in one place. Smart notifications and activity tracking keep you informed and in control.','📊',0,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(23,10,5,NULL,NULL,'Customer Relationship Management (CRM)','Manage leads, track prospects, and streamline sales pipelines with built-in follow-up tools. Stay on top of customer relationships to close deals faster.','🎯',100,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(24,10,5,NULL,NULL,'Human Resources (HR)','Simplify HR operations with leave and attendance tracking, employee onboarding, holiday calendars, and appreciation features that boost engagement.','👥',200,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(25,10,5,NULL,NULL,'Project & Task Management','Plan, assign, and track projects and tasks with ease. Built-in timesheets and collaboration tools ensure accountability and faster delivery.','📂',300,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(26,10,5,NULL,NULL,'Communication Tools','Integrated messaging and notifications keep your teams connected—no need to switch apps to collaborate effectively.','💬',310,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(27,10,5,NULL,NULL,'Finance Management','Track expenses, generate invoices, and manage approvals in one secure platform. Stay on top of cash flow and financial records effortlessly.','💰',400,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(28,10,5,NULL,NULL,'Ticketing System','Manage internal or external support requests, track ticket status, and ensure timely resolution for smooth operations.','🎫',410,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(29,10,5,NULL,NULL,'Events & Notice Board','Organize meetings, schedule events, and share company-wide announcements and policies from a central notice board.','📅',420,'2025-09-30 06:02:45','2025-09-30 06:02:45'),(31,9,7,NULL,NULL,'Video on Demand','Offer movies, series, and shows with HD/4K adaptive streaming and personalized recommendations.','🎥',0,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(32,9,7,NULL,NULL,'Live Streaming','Host live events, sports, concerts, or webinars with real-time audience interaction.','📡',10,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(33,9,7,NULL,NULL,'Multi-Device Support','Deliver a seamless experience on web, mobile apps, smart TVs, and tablets.','📱',100,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(34,9,7,NULL,NULL,'Branding & Customization','Launch a fully white-labeled platform with your logo, design, and domain for complete brand ownership.','🎨',110,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(35,9,7,NULL,NULL,'Revenue Models','Generate income through subscriptions, pay-per-view, and ad-based streaming all built in.','💳',200,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(36,9,7,NULL,NULL,'Analytics & Reports','Gain insights into user engagement, viewership, churn, and revenue to optimize growth.','📊',210,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(37,9,7,NULL,NULL,'Content Protection','Safeguard your content with DRM, watermarking, and secure CDN delivery to prevent piracy.','🔒',300,'2025-09-30 06:35:34','2025-09-30 06:35:34'),(38,7,8,NULL,NULL,'Room & Reservation Management','Easily manage room availability, reservations, and occupancy with automated booking synchronization.','🏨',0,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(39,7,8,NULL,NULL,'Customer Management','Maintain guest profiles, preferences, and stay history for personalized service.','👤',10,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(40,7,8,NULL,NULL,'Complaint Handling','Track and resolve guest complaints quickly to ensure satisfaction.','📑',20,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(41,7,8,NULL,NULL,'Staff Management','Monitor employee records, shifts, roles, and performance with role-based access control.','👥',100,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(42,7,8,NULL,NULL,'Inventory & Expenses','Track stock usage, purchases, and expenses to cut costs and prevent wastage.','📦',110,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(43,7,8,NULL,NULL,'Laundry & Services','Automate laundry services and additional guest amenities with integrated billing.','🧺',120,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(44,7,8,NULL,NULL,'Restaurant & Kitchen Order Management','Manage menus, food items, and integrate with KOT for faster order processing.','🍴',200,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(45,7,8,NULL,NULL,'Spa & Wellness','Enable spa bookings and additional wellness services with automated scheduling and billing.','💆',210,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(46,7,8,NULL,NULL,'Billing & Payments','Generate invoices with tax and multi-currency support. Track payments, subscriptions, and refunds.','🧾',300,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(47,7,8,NULL,NULL,'Dashboard & Reports','Real-time insights into revenue, occupancy, and performance with customizable financial and operational reports.','📊',310,'2025-09-30 07:20:06','2025-09-30 07:20:06'),(48,6,9,NULL,NULL,'Order Management','Automate the entire order lifecycle packaging, delivery, cancellations, returns, and refunds—with full visibility and tracking.','📦',0,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(49,6,9,NULL,NULL,'Dashboard & Business Analytics','Monitor orders, earnings, delivery charges, taxes, and top-performing products in real time for smarter decisions.','📊',10,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(50,6,9,NULL,NULL,'Product Management','Set up categories, brands, and attributes; add or bulk import products; and manage vendor contributions with ease.','🛍',100,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(51,6,9,NULL,NULL,'Promotion & Marketing','Run targeted campaigns with banners, deals, discounts, and customer notifications to boost engagement and sales.','🎯',110,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(52,6,9,NULL,NULL,'User & Vendor Management','Oversee customers, manage multiple vendors, track delivery staff, and build loyalty with newsletter subscribers.','👥',200,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(53,6,9,NULL,NULL,'Support & Messaging','Enhance customer experience with built-in messaging, inbox features, and ticket-based support.','💬',210,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(54,6,9,NULL,NULL,'Reports & Analytics','Generate detailed sales, transaction, and performance reports with export options for compliance and analysis.','📑',300,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(55,6,9,NULL,NULL,'System & Integrations','Easily configure business preferences, integrate third-party services, and manage media or content seamlessly.','⚙',310,'2025-09-30 09:18:20','2025-09-30 09:18:20'),(56,14,10,NULL,NULL,'Longitudinal Health Record System','A highly structured database designed for long-term data accessibility, tracking patient health across multiple encounters, providers, and years with built-in data integrity checks.','📚',0,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(57,14,10,NULL,NULL,'AI-Optimised Revenue Cycle Engine','Automates the entire financial process from service documentation (charge capture) to final payment posting, utilizing AI for superior claims management and denial prediction/prevention.','🤖',100,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(58,14,10,NULL,NULL,'Predictive Healthcare Analytics','Provides critical foresight into patient outcomes (e.g., readmission risk), departmental efficiency, and potential financial bottlenecks, enabling proactive management and strategic planning.','📊',200,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(59,14,10,NULL,NULL,'Single Sign-On (SSO) & Multi-Factor Auth','Secure, enterprise-grade access control utilising industry-standard identity protocols to simplify user login while enforcing strong security policies and compliance.','🔐',300,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(60,14,10,NULL,NULL,'Automated Regulatory Audit Logging','Continuous, real-time monitoring and logging of all data access and modifications, providing unalterable audit trails required for seamless state/federal regulatory compliance and peace of mind.','🧮',400,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(61,14,10,NULL,NULL,'Drug & Allergy Interaction Flagging','An intelligent system that cross-references patient allergies and existing medications against prescribed treatments, issuing immediate, high-priority warnings to prevent adverse events.','💊',500,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(62,14,10,NULL,NULL,'Structured Data Capture & Interoperability','Moves beyond simple notes by encoding clinical information into standardized formats (e.g., LOINC, SNOMED), making data usable for analytics and facilitating seamless exchange with external systems.','🔗',510,'2025-10-26 04:23:41','2025-10-26 04:23:41'),(68,13,11,'Store management',0,'Integrated Content Builder','If you can build a presentation, you can build a course. Easily weave together your videos, PDFs, and tests in minutes.','📝',0,'2025-10-27 09:14:44','2025-10-27 09:14:44'),(69,13,11,'Store management',0,'Centralized Knowledge Base','A single, secure place for every document and course, so outdated materials and version confusion are a problem of the past.','📖',1,'2025-10-27 09:14:44','2025-10-27 09:14:44'),(70,13,11,'Payment Processing',1,'Role Based Auto Assignment','Automatically enroll entire departments or specific new hires based on simple rules, freeing you from manual enrollment lists forever.','📝',100,'2025-10-27 09:14:44','2025-10-27 09:14:44'),(71,13,11,'Payment Processing',1,'White Labeling & Branding','Easily customize the entire platform to look and feel like your company, reinforcing your brand and culture in every lesson.','🏅',101,'2025-10-27 09:14:44','2025-10-27 09:14:44'),(72,13,11,'Payment Processing',1,'Multi-Tenancy Portals','Instantly create branded, separate portals for partners, customers, or specific teams, ensuring everyone sees only what they need to see.','💡',102,'2025-10-27 09:14:44','2025-10-27 09:14:44'),(73,13,11,'Engagement & Gamification',2,'Gamified Learning Engine','Use automated badges and leaderboards to reward success and create a friendly competition that keeps people coming back for more.','🧩',200,'2025-10-27 09:14:44','2025-10-27 09:14:44');
/*!40000 ALTER TABLE `product_feature_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feature_point`
--

DROP TABLE IF EXISTS `product_feature_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feature_point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feature_group_id` int NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text,
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_point` (`feature_group_id`,`sort_order`),
  CONSTRAINT `Product_Feature_Point_ibfk_1` FOREIGN KEY (`feature_group_id`) REFERENCES `product_feature_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feature_point`
--

LOCK TABLES `product_feature_point` WRITE;
/*!40000 ALTER TABLE `product_feature_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_feature_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_industry_item`
--

DROP TABLE IF EXISTS `product_industry_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_industry_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `industry_section_id` int NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text,
  `emoji` varchar(50) DEFAULT NULL,
  `image_url` varchar(191) DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `file_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_item` (`industry_section_id`,`title`),
  KEY `idx_industry` (`industry_section_id`,`sort_order`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `Product_Industry_Item_ibfk_1` FOREIGN KEY (`industry_section_id`) REFERENCES `product_industry_section` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Product_Industry_Item_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_industry_item`
--

LOCK TABLES `product_industry_item` WRITE;
/*!40000 ALTER TABLE `product_industry_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_industry_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_industry_section`
--

DROP TABLE IF EXISTS `product_industry_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_industry_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product` (`product_id`),
  CONSTRAINT `Product_Industry_Section_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_industry_section`
--

LOCK TABLES `product_industry_section` WRITE;
/*!40000 ALTER TABLE `product_industry_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_industry_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_information`
--

DROP TABLE IF EXISTS `product_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Product_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_information`
--

LOCK TABLES `product_information` WRITE;
/*!40000 ALTER TABLE `product_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_key_benefit_item`
--

DROP TABLE IF EXISTS `product_key_benefit_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_key_benefit_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_benefits_section_id` int NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text,
  `image_url` varchar(191) DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `file_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_item` (`key_benefits_section_id`,`title`),
  KEY `idx_benefit` (`key_benefits_section_id`,`sort_order`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `Product_Key_Benefit_Item_ibfk_1` FOREIGN KEY (`key_benefits_section_id`) REFERENCES `product_key_benefits_section` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Product_Key_Benefit_Item_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_key_benefit_item`
--

LOCK TABLES `product_key_benefit_item` WRITE;
/*!40000 ALTER TABLE `product_key_benefit_item` DISABLE KEYS */;
INSERT INTO `product_key_benefit_item` VALUES (45,6,'Productivity & Collaboration','Worksuit brings together all the essential tools your team needs in one place—making daily operations smoother, faster, and more transparent. From better communication to smarter workflows, your teams stay aligned and more productive.','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity.png',0,575,'2025-10-04 05:06:17','2025-10-04 05:06:17'),(46,6,'Efficiency & Growth','Designed to scale with your business, Worksuit optimizes project delivery, financial tracking, and employee engagement while adapting to teams of all sizes. It ensures long-term growth and stronger organizational performance.','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (1).png',1,576,'2025-10-04 05:06:18','2025-10-04 05:06:18'),(50,7,'Guest Experience & Operations','Deliver exceptional guest satisfaction while simplifying daily hotel operations. From smart reservations to seamless check-ins, HMS ensures a smooth guest journey at every step.','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.00.40_926c520d.jpg',0,584,'2025-10-04 07:14:35','2025-10-04 07:14:35'),(51,7,'Efficiency & Cost Savings','Optimize hotel operations with automation, real-time insights, and centralized controls. HMS helps reduce expenses while boosting performance and profitability.','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.13.28_5516863b.jpg',1,585,'2025-10-04 07:14:35','2025-10-04 07:14:35'),(52,4,'Unmatched Smart Stock & Expiry Control','Never worry about expired medicines again. Our advanced tracking system gives real-time alerts for low-stock and upcoming expirations, ensuring 100% compliance and saving pharmacies from costly losses. This level of precision sets PMS apart as the most reliable pharmacy software.','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.19.36_35826393.jpg',0,586,'2025-10-04 07:24:06','2025-10-04 07:24:06'),(53,4,'Lightning-Fast Billing & Seamless Operations','Say goodbye to slow counters. With automated invoicing and powerful POS integration, PMS accelerates billing by up to 60%. Pharmacies deliver faster service, boost customer satisfaction, and run smoother than ever—making it the ultimate solution for modern pharmacy management.','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 13.23.28_0bba62cf.jpg',1,587,'2025-10-04 07:24:06','2025-10-04 07:24:06'),(56,8,'Content & Audience Experience','Create a seamless entertainment experience powered by smart recommendations, flawless playback, and secure delivery.','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity.png',0,590,'2025-10-04 08:48:54','2025-10-04 08:48:54'),(57,8,'Monetization & Growth','Maximize revenue and scalability with flexible monetization models, real-time analytics, and full control over branding and platform expansion.','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (1).png',1,591,'2025-10-04 08:48:54','2025-10-04 08:48:54'),(60,5,'Sales & Customer Engagement','Boost sales and keep customers coming back with smart promotions, simplified shopping experiences, and powerful order management.','https://s3.ap-south-1.amazonaws.com/emr.buckett/Boost Productivity (2).png',0,594,'2025-10-04 08:53:18','2025-10-04 08:53:18'),(61,5,'Efficiency & Marketplace Growth','Run your e-commerce business efficiently with full visibility of operations, vendor management, and real-time analytics, scaling effortlessly as you grow.','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-04 at 14.48.55_6b0b180f.jpg',1,595,'2025-10-04 08:53:18','2025-10-04 08:53:18'),(62,9,'Advancing Healthcare','These systems enhance safety by reducing medical errors and driving enhanced care coordination across providers. They dramatically boost efficiency and workflow by automating processes, while empowering patients through improved engagement via portals.','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 1 image.jpg',0,792,'2025-10-26 06:29:04','2025-10-26 06:29:04'),(63,9,'Optimizing Health Systems','EMRs lead to an improved quality of care and generate significant cost savings through operational efficiencies. They provide legible and organized records, eliminating paper issues and ensuring robust enhanced data security for patient privacy.','https://s3.ap-south-1.amazonaws.com/emr.buckett/emr image 2.png',1,793,'2025-10-26 06:29:04','2025-10-26 06:29:04'),(65,10,'People & Performance Optimization','Our LMS empowers managers with tools, boosts team confidence with clear learning paths, automates compliance, and cultivates your next generation of leaders from within. It\'s about making every person in your organization more capable and secure in their role.','https://s3.ap-south-1.amazonaws.com/emr.buckett/image.png',0,804,'2025-10-27 09:34:35','2025-10-27 09:34:35'),(66,10,'Operational Efficiency & Experience','This system offers improved quality of care and generates quantifiable cost savings by digitizing training. It ensures all documentation is legible and organized, supporting audit-ready records, while also allowing organizations to manage patient engagement better.','https://s3.ap-south-1.amazonaws.com/emr.buckett/image (1).png',1,805,'2025-10-27 09:34:35','2025-10-27 09:34:35');
/*!40000 ALTER TABLE `product_key_benefit_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_key_benefits_section`
--

DROP TABLE IF EXISTS `product_key_benefits_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_key_benefits_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product` (`product_id`),
  CONSTRAINT `Product_Key_Benefits_Section_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_key_benefits_section`
--

LOCK TABLES `product_key_benefits_section` WRITE;
/*!40000 ALTER TABLE `product_key_benefits_section` DISABLE KEYS */;
INSERT INTO `product_key_benefits_section` VALUES (4,8,'PMS is more than a pharmacy management tool, it’s a complete solution that gives pharmacies, hospitals, and distributors a competitive edge. With smart inventory control, faster billing, and compliance-ready reporting, PMS helps businesses save time, reduce costs, and deliver better service.','2025-09-30 05:14:00','2025-10-04 07:24:06'),(5,6,'Smarter operations, higher sales, and stronger customer loyalty','2025-09-30 06:16:05','2025-10-04 08:53:18'),(6,10,'Measurable results that drive your business forward','2025-10-03 04:51:37','2025-10-04 05:06:17'),(7,7,'Seamless operations, delighted guests, and higher profits','2025-10-04 07:09:02','2025-10-04 07:14:35'),(8,9,'Stream smarter, grow faster, and own your entertainment brand','2025-10-04 08:45:35','2025-10-04 08:48:54'),(9,14,'Smarter operations, higher sales, and stronger customer loyalty','2025-10-26 06:29:04','2025-10-26 06:29:04'),(10,13,'Make informed decisions with detailed analytics','2025-10-27 09:32:52','2025-10-27 09:34:35');
/*!40000 ALTER TABLE `product_key_benefits_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_media`
--

DROP TABLE IF EXISTS `product_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `type` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `alt_text` varchar(191) DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `file_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_media` (`product_id`,`sort_order`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `Product_Media_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Product_Media_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_media`
--

LOCK TABLES `product_media` WRITE;
/*!40000 ALTER TABLE `product_media` DISABLE KEYS */;
INSERT INTO `product_media` VALUES (16,6,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei/Shodei/Shodei+%E2%80%93+E-commerce+Platform+by+Startsmartz+-+admin+dashbord.jpg','Admin',0,NULL,'2025-09-24 10:18:16','2025-09-24 10:18:16'),(17,6,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work+Suit/Work+Suit/Shodei+Customer+Pannel/Shodei+Customer+Pannel/Shodei+%E2%80%93+E-commerce+Platform+by+Startsmartz+-+home+Page.jpg','Home',10,NULL,'2025-09-24 10:19:05','2025-09-24 10:19:05'),(18,6,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Shodei+e-commerce+platform+by+Startsmartz+Technologies.png','Mobile',20,NULL,'2025-09-24 10:19:24','2025-09-24 10:19:24'),(19,9,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Linx+Stream/Linx+Stream/Linx+Stream+%E2%80%93+Video+Streaming+Platform+by+Startsmartz+-+Login.jpg','Login',0,NULL,'2025-09-26 09:38:57','2025-09-26 09:38:57'),(20,9,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Linx+Stream/Linx+Stream/Linx+Stream+%E2%80%93+Video+Streaming+Platform+by+Startsmartz+-home+page.jpg','Home',10,NULL,'2025-09-26 09:39:24','2025-09-26 09:39:24'),(21,9,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Linx+Stream/Linx+Stream/Linx+Stream+%E2%80%93+Video+Streaming+Platform+by+Startsmartz+-subscrription.jpg','Subscription ',20,NULL,'2025-09-26 09:40:41','2025-09-26 09:40:41'),(22,7,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel/Hotel/Hotel+Management+System+%E2%80%93+Startsmartz+Technologies+-+Dashbord.jpg','Dashbord',0,NULL,'2025-09-26 09:54:25','2025-09-26 09:54:25'),(23,7,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel/Hotel/Hotel+Management+System+%E2%80%93+Startsmartz+Technologies+-+Inventory.jpg','Inventory',10,NULL,'2025-09-26 09:54:46','2025-09-26 09:54:46'),(24,7,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel/Hotel/Hotel+Management+System+%E2%80%93+Startsmartz+Technologies+-+Reservation.jpg','Reservation',20,NULL,'2025-09-26 09:55:03','2025-09-26 09:55:03'),(25,7,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Hotel/Hotel/Hotel+Management+System+%E2%80%93+Startsmartz+Technologies+-+Room+Booking.jpg','Room Booking',30,NULL,'2025-09-26 09:55:31','2025-09-26 09:55:31'),(26,10,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work Suit by Startsmartz â Business Management Software - Dashbord.jpg','Dashboard',0,510,'2025-09-27 09:19:06','2025-09-27 09:19:06'),(27,10,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work Suit by Startsmartz â Business Management Software - Notice Bord.jpg','Notice Board ',10,511,'2025-09-27 09:19:46','2025-09-27 09:19:46'),(28,10,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Work Suit by Startsmartz â Business Management Software.jpg','leaves ',20,512,'2025-09-27 09:21:13','2025-09-27 09:21:13'),(29,8,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - D.jpg','Report',0,558,'2025-09-30 09:04:30','2025-09-30 09:04:30'),(30,8,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - Dashboard.jpg','Dashboard',10,559,'2025-09-30 09:04:44','2025-09-30 09:04:44'),(31,8,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - purchase.jpg',' Purchase',20,560,'2025-09-30 09:05:01','2025-09-30 09:05:01'),(32,8,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/Pharmacy management software by Startsmartz Technology - Supplier list.jpg','Supplier list',30,561,'2025-09-30 09:05:25','2025-09-30 09:05:25'),(33,14,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 1.png','Patient Profile',0,796,'2025-10-27 06:13:04','2025-10-27 06:13:55'),(34,14,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 2.png','Patient Dashboard',10,797,'2025-10-27 06:13:26','2025-10-27 06:15:19'),(36,14,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/EMR 4.png','Patient Appointment',30,799,'2025-10-27 06:14:32','2025-10-27 06:14:32'),(37,13,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/LMS 1.png','Student Dashboard',0,800,'2025-10-27 06:17:04','2025-10-27 06:17:12'),(38,13,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/LMS 2.png','User System settings',10,801,'2025-10-27 06:17:37','2025-10-27 06:18:25'),(39,13,'screenshot','https://s3.ap-south-1.amazonaws.com/emr.buckett/LMS 3.png','Student Analytics',20,802,'2025-10-27 06:17:56','2025-10-27 06:17:56');
/*!40000 ALTER TABLE `product_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_overview`
--

DROP TABLE IF EXISTS `product_overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_overview` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `short_description` text,
  `image_url` varchar(191) DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `idx_overview` (`product_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `Product_Overview_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Product_Overview_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_overview`
--

LOCK TABLES `product_overview` WRITE;
/*!40000 ALTER TABLE `product_overview` DISABLE KEYS */;
INSERT INTO `product_overview` VALUES (5,8,'PMS – Smarter Pharmacy & Inventory Management','PMS is a complete pharmacy management solution designed to streamline day-to-day operations of pharmacies, medical stores, and hospital dispensaries. From managing prescriptions to monitoring medicine stock and tracking sales, PMS ensures accuracy, compliance, and efficiency.','https://s3.ap-south-1.amazonaws.com/emr.buckett/ph 1.jpg',533,'2025-09-30 03:56:10','2025-09-30 04:12:35'),(6,10,'All in One Business Management Suite','A modern, all-in-one business management software that unifies CRM, HR, project management, and finance into a single easy-to-use platform. From managing employees to tracking sales leads and monitoring projects, it helps teams stay productive, connected, and focused on growth.','https://s3.ap-south-1.amazonaws.com/emr.buckett/HR 1.jpg',544,'2025-09-30 05:44:34','2025-09-30 05:44:34'),(7,9,'Everything You Need to Run a Successful Streaming Business','A next generation OTT solution that lets you build and manage your own Netflix style streaming platform. With support for on demand videos, live streaming, and multi-category content, it gives you complete control over your brand, audience, and monetization.','https://s3.ap-south-1.amazonaws.com/emr.buckett/c9829bdf20e4775a34df99505729ba0c.jpg',552,'2025-09-30 06:27:35','2025-09-30 06:29:18'),(8,7,'Smarter Features for Seamless Hospitality','An all-in-one hotel management solution designed to simplify and centralize operations for hotels, resorts, and service apartments. From reservations and staff to restaurants, inventory, and guest services, it helps businesses deliver seamless guest experiences while boosting efficiency and revenue.','https://s3.ap-south-1.amazonaws.com/emr.buckett/h3.jpg',557,'2025-09-30 07:11:46','2025-09-30 07:13:22'),(9,6,'All in One Tools to Power Your Online Business','A complete e-commerce management solution designed for online stores, vendors, and marketplace operators. From managing products and orders to handling promotions, analytics, and user control, it centralizes every operation into one powerful platform for smooth, scalable business growth.','https://s3.ap-south-1.amazonaws.com/emr.buckett/e1317fd12bf55bd7075d3aa9001dce8b.jpg',563,'2025-09-30 09:12:41','2025-09-30 09:14:07'),(10,14,'Helping Hospitals Run Smoothly And Shine In Care','A next-generation AI-powered Electronic Medical Record (EMR) system built to streamline clinical workflows, improve diagnostic accuracy, and enhance the overall patient-care experience. ','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-26 at 16.50.07.jpeg',794,'2025-10-26 04:16:06','2025-10-26 11:02:39'),(11,13,'Connect Your People with Their Potential','A Learning Management System built for the people who teach and the people who learn. We turn training from a necessary hassle into your biggest strategic advantage for growth.','https://s3.ap-south-1.amazonaws.com/emr.buckett/WhatsApp Image 2025-10-26 at 16.52.36 (1).jpeg',806,'2025-10-27 05:43:17','2025-10-27 09:38:07');
/*!40000 ALTER TABLE `product_overview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_overview_feature`
--

DROP TABLE IF EXISTS `product_overview_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_overview_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `overview_id` int DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` text,
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ovf1` (`product_id`,`sort_order`),
  KEY `idx_ovf2` (`overview_id`,`sort_order`),
  CONSTRAINT `Product_Overview_Feature_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Product_Overview_Feature_ibfk_2` FOREIGN KEY (`overview_id`) REFERENCES `product_overview` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_overview_feature`
--

LOCK TABLES `product_overview_feature` WRITE;
/*!40000 ALTER TABLE `product_overview_feature` DISABLE KEYS */;
INSERT INTO `product_overview_feature` VALUES (30,8,5,'Dashboard & Analytics','Real-time insights with visual reports to track sales, purchases, and inventory at a glance.',0,'2025-09-30 04:12:35','2025-09-30 04:12:35'),(31,8,5,'Customer & Supplier Management','Easily manage patients, customers, suppliers, and their histories in one place.',10,'2025-09-30 04:12:35','2025-09-30 04:12:35'),(32,8,5,'Inventory & Stock Control','Monitor stock levels in real time, avoid shortages, and reduce wastage.',20,'2025-09-30 04:12:35','2025-09-30 04:12:35'),(33,8,5,'Finance & Accounts','Manage expenses, accounts, transactions, bank records, and generate balance sheets and statements.',30,'2025-09-30 04:12:35','2025-09-30 04:12:35'),(34,8,5,'Flexible Payments','Multiple payment methods including cash, card, and mobile banking.',40,'2025-09-30 04:12:35','2025-09-30 04:12:35'),(35,10,6,'CRM','Easily manage leads and prospects while tracking your entire sales pipeline. Stay organized with smart follow-ups to close deals faster.',0,'2025-09-30 05:44:34','2025-09-30 05:44:34'),(36,10,6,'HR Management','Simplify HR operations with leave, attendance, and onboarding tools. Boost transparency and engagement with holiday calendars and appreciation features.',10,'2025-09-30 05:44:34','2025-09-30 05:44:34'),(37,10,6,'Project & Task Management','Create, assign, and track projects with built-in timesheets and progress monitoring. Keep teams aligned with seamless collaboration tools.',20,'2025-09-30 05:44:34','2025-09-30 05:44:34'),(38,10,6,'Events & Notice Board','rganize meetings, company events, and schedules from a central hub. Publish announcements, policies, and updates to keep everyone informed',30,'2025-09-30 05:44:34','2025-09-30 05:44:34'),(39,10,6,'Communication Tools','Collaborate with your team using built-in chat and notifications. Reduce app-switching and keep all communication in one place.',40,'2025-09-30 05:44:34','2025-09-30 05:44:34'),(45,9,7,'End to End Streaming','Offer both on-demand and live streaming with HD/4K quality and personalized recommendations.',0,'2025-09-30 06:29:18','2025-09-30 06:29:18'),(46,9,7,'Cross Platform Access','Seamless viewing on web, mobile apps, smart TVs, and tablets.',10,'2025-09-30 06:29:18','2025-09-30 06:29:18'),(47,9,7,'Flexible Monetization','Earn revenue through subscriptions, ads, and pay-per-view models.',20,'2025-09-30 06:29:18','2025-09-30 06:29:18'),(48,9,7,'Content Security','Protect your videos with DRM, watermarking, and secure CDN delivery.',30,'2025-09-30 06:29:18','2025-09-30 06:29:18'),(49,9,7,'Analytics & Customization','Track audience insights, revenue, and fully brand the platform with your own design and domain.',40,'2025-09-30 06:29:18','2025-09-30 06:29:18'),(55,7,8,'Centralized Reservation','Smart booking system with customer profiles and complaint tracking.',0,'2025-09-30 07:13:22','2025-09-30 07:13:22'),(56,7,8,'Staff & Operations Control','Role-based staff management, inventory, and expense tracking.',10,'2025-09-30 07:13:22','2025-09-30 07:13:22'),(57,7,8,'Restaurant & Spa Integration','Built-in restaurant ordering, KOT, and wellness scheduling.',20,'2025-09-30 07:13:22','2025-09-30 07:13:22'),(58,7,8,'Finance & Billing Automation','Multi-currency invoicing, payments, and subscription management.',30,'2025-09-30 07:13:22','2025-09-30 07:13:22'),(59,7,8,'Analytics & Reports','Real-time dashboards and detailed financial/operational reports.',40,'2025-09-30 07:13:22','2025-09-30 07:13:22'),(65,6,9,'Order & Sales Management','End-to-end automation of orders, returns, refunds, and tracking.',0,'2025-09-30 09:14:07','2025-09-30 09:14:07'),(66,6,9,'Product & Vendor Control','Easy setup, bulk uploads, and multi-seller marketplace support.',10,'2025-09-30 09:14:07','2025-09-30 09:14:07'),(67,6,9,'Promotions & Marketing','Campaigns, deals, banners, and customer engagement tools.',20,'2025-09-30 09:14:07','2025-09-30 09:14:07'),(68,6,9,'Customer & Support Tools','Centralized customer database, delivery tracking, and ticket-based support.',30,'2025-09-30 09:14:07','2025-09-30 09:14:07'),(69,6,9,'Analytics & Integrations','Real-time dashboards, exportable reports, and third-party service integrations.',40,'2025-09-30 09:14:07','2025-09-30 09:14:07'),(80,14,10,'AI-Powered Clinical Decision Support','Leverage machine learning to analyze patient data, flagging potential risks, suggesting differential diagnoses, and ensuring adherence to the latest clinical guidelines, acting as a tireless assistant to clinicians.',0,'2025-10-26 11:02:39','2025-10-26 11:02:39'),(81,14,10,'Smart Clinical Charting','Drastically cut down on documentation time with customizable, specialty-specific templates and a powerful, integrated voice-to-text transcription engine. Capture complete, accurate notes faster than ever.',10,'2025-10-26 11:02:39','2025-10-26 11:02:39'),(82,14,10,'Interoperability and Integrations','Effortlessly share and receive patient data across different systems. Direct links to major labs, imaging centers, and pharmacy benefit managers (PBMs) ensure a holistic patient record is always available.',20,'2025-10-26 11:02:39','2025-10-26 11:02:39'),(83,14,10,'Revenue Cycle Management (RCM)','Accelerate payment with features like automated claim scrubbing, pre-authorization management, and an integrated patient payment portal, ensuring maximum reimbursement and a healthier bottom line.',30,'2025-10-26 11:02:39','2025-10-26 11:02:39'),(84,14,10,'Security and Compliance','Maintain the highest standards of data integrity and patient privacy with multi-factor authentication, granular access controls, and a platform built to exceed HIPAA/HITECH compliance requirements.',40,'2025-10-26 11:02:39','2025-10-26 11:02:39'),(90,13,11,'A \"Your Career\" GPS for Every User','Guide employees with personalized learning paths that connect directly to their job and future goals, replacing generic training with purposeful learning.',0,'2025-10-27 09:38:07','2025-10-27 09:38:07'),(91,13,11,'Instant, Relevant Skill-Building','Deliver the right knowledge at the moment of need using smart, personalized recommendations. No more mandatory time-wasters, just valuable, focused content.',10,'2025-10-27 09:38:07','2025-10-27 09:38:07'),(92,13,11,'Proving the Value of Every Hour','Stop guessing if training works. Get clear, simple reports that show exactly how learning impacts performance, compliance, and team readiness.',20,'2025-10-27 09:38:07','2025-10-27 09:38:07'),(93,13,11,'Easy Answers, Zero Paperwork','Instantly create official, trackable certifications and assessments. Validate skills and meet compliance requirements without the manual administrative burden.',30,'2025-10-27 09:38:07','2025-10-27 09:38:07'),(94,13,11,'Learn on the Commute, Not Just the Desk','Your teams are mobile; their training should be too. Enable seamless learning on any phone or tablet, with the ability to download courses for true on-the-go progress.',40,'2025-10-27 09:38:07','2025-10-27 09:38:07');
/*!40000 ALTER TABLE `product_overview_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_section`
--

DROP TABLE IF EXISTS `product_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT '1',
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`product_id`,`sort_order`),
  CONSTRAINT `Product_Section_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_section`
--

LOCK TABLES `product_section` WRITE;
/*!40000 ALTER TABLE `product_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_section_item`
--

DROP TABLE IF EXISTS `product_section_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_section_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_id` int NOT NULL,
  `title` varchar(191) NOT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `icon_emoji` varchar(50) DEFAULT NULL,
  `rich_text` text,
  `meta_json` json DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_item` (`section_id`,`sort_order`),
  CONSTRAINT `Product_Section_Item_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `product_section` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_section_item`
--

LOCK TABLES `product_section_item` WRITE;
/*!40000 ALTER TABLE `product_section_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_section_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seo`
--

DROP TABLE IF EXISTS `product_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `product_id` int NOT NULL,
  `meta_image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `fk_product_file` (`meta_image_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_file` FOREIGN KEY (`meta_image_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seo`
--

LOCK TABLES `product_seo` WRITE;
/*!40000 ALTER TABLE `product_seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sub_category`
--

DROP TABLE IF EXISTS `product_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sub_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Sub_Category_product_category_id_fkey` (`product_category_id`),
  KEY `Product_Sub_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Product_Sub_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Product_Sub_Category_product_category_id_fkey` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sub_category`
--

LOCK TABLES `product_sub_category` WRITE;
/*!40000 ALTER TABLE `product_sub_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sub_category_description`
--

DROP TABLE IF EXISTS `product_sub_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sub_category_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sub_category_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Sub_Category_Description_product_sub_category_id_fkey` (`product_sub_category_id`),
  CONSTRAINT `Product_Sub_Category_Description_product_sub_category_id_fkey` FOREIGN KEY (`product_sub_category_id`) REFERENCES `product_sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sub_category_description`
--

LOCK TABLES `product_sub_category_description` WRITE;
/*!40000 ALTER TABLE `product_sub_category_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sub_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_why_choose_us_content`
--

DROP TABLE IF EXISTS `product_why_choose_us_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_why_choose_us_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Why_Choose_Us_Content_product_category_id_fkey` (`product_category_id`),
  KEY `Product_Why_Choose_Us_Content_file_id_fkey` (`file_id`),
  CONSTRAINT `Product_Why_Choose_Us_Content_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Product_Why_Choose_Us_Content_product_category_id_fkey` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_why_choose_us_content`
--

LOCK TABLES `product_why_choose_us_content` WRITE;
/*!40000 ALTER TABLE `product_why_choose_us_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_why_choose_us_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_why_choose_us_introduction`
--

DROP TABLE IF EXISTS `product_why_choose_us_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_why_choose_us_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Why_Choose_Us_Introduction_product_category_id_fkey` (`product_category_id`),
  KEY `Product_Why_Choose_Us_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Product_Why_Choose_Us_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Product_Why_Choose_Us_Introduction_product_category_id_fkey` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_why_choose_us_introduction`
--

LOCK TABLES `product_why_choose_us_introduction` WRITE;
/*!40000 ALTER TABLE `product_why_choose_us_introduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_why_choose_us_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorded_project`
--

DROP TABLE IF EXISTS `recorded_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recorded_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Recorded_Project_file_id_fkey` (`file_id`),
  CONSTRAINT `Recorded_Project_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorded_project`
--

LOCK TABLES `recorded_project` WRITE;
/*!40000 ALTER TABLE `recorded_project` DISABLE KEYS */;
INSERT INTO `recorded_project` VALUES (2,'Startsmartz in Action: Building the Future of Technology','At StartSmartz, every project is a journey of innovation. In this video, we share how we combine creativity, technology, and strategy to build scalable solutions that empower businesses to grow smarter and faster.',NULL,317,'2025-08-27 06:25:22.060','2025-09-13 09:47:41.019');
/*!40000 ALTER TABLE `recorded_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_category`
--

DROP TABLE IF EXISTS `service_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_category`
--

LOCK TABLES `service_category` WRITE;
/*!40000 ALTER TABLE `service_category` DISABLE KEYS */;
INSERT INTO `service_category` VALUES (14,'Custom Software Development','Smart, reliable solutions built to power business success.','custom-software-development',785,'2025-09-25 09:06:40.435','2025-10-25 11:11:55.799'),(15,'AI & Data Solutions','Modern web solutions designed to accelerate business growth.','ai--data-solutions',649,'2025-09-25 09:07:11.476','2025-10-21 09:05:53.674'),(16,'Digital Marketing & Brand Growth','Reach the right audience through smart digital strategies','digital-marketing--brand-growth',787,'2025-09-25 09:07:50.454','2025-10-25 11:13:10.791'),(17,'UI/UX & Product Design','Designs that elevate usability, beauty, and user experience.','uiux--product-design',788,'2025-09-25 09:08:30.339','2025-10-26 03:53:59.958'),(18,'SaaS Product Engineering','Scalable cloud-based products engineered for performance and reliability.','saas-product-engineering',645,'2025-09-25 09:08:59.419','2025-10-21 07:00:26.153'),(19,'DevOps & CI/CD Automation','Continuous integration and delivery pipelines that accelerate innovation','devops--cicd-automation',807,'2025-09-25 09:09:28.051','2025-10-27 10:00:06.690');
/*!40000 ALTER TABLE `service_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_category_seo`
--

DROP TABLE IF EXISTS `service_category_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_category_seo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `service_category_id` int NOT NULL,
  `meta_image_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_category_id` (`service_category_id`),
  KEY `fk_service_category_file` (`meta_image_id`),
  CONSTRAINT `fk_service_category` FOREIGN KEY (`service_category_id`) REFERENCES `service_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_service_category_file` FOREIGN KEY (`meta_image_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_category_seo`
--

LOCK TABLES `service_category_seo` WRITE;
/*!40000 ALTER TABLE `service_category_seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_category_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_hero_section`
--

DROP TABLE IF EXISTS `service_hero_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_hero_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_category_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Service_Hero_Section_service_category_id_key` (`service_category_id`),
  CONSTRAINT `Service_Hero_Section_service_category_id_fkey` FOREIGN KEY (`service_category_id`) REFERENCES `service_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_hero_section`
--

LOCK TABLES `service_hero_section` WRITE;
/*!40000 ALTER TABLE `service_hero_section` DISABLE KEYS */;
INSERT INTO `service_hero_section` VALUES (1,'Custom ','Software Page','At Startsmartz, we transform your vision into innovative, high-performance software. We partner with you from concept to launch, delivering custom and scalable solutions engineered for your unique business challenges. Let us build the competitive advantage you need for lasting digital success.',14,'2025-10-27 10:17:13.484','2025-10-27 10:17:13.484'),(2,'AI &','Data Solutions ','Our AI & Data Solutions practice specializes in transforming your data assets into intelligent systems and actionable insights that automate processes and inform strategic decisions.',15,'2025-10-27 10:21:13.607','2025-10-27 10:21:13.607'),(3,'Digital Marketing ','and Brand Growth ','Our Digital Marketing & Brand Growth service goes beyond basic campaigns — it’s a strategic partnership focused on driving real results: reaching new markets, attracting qualified leads, and achieving lasting revenue growth.',16,'2025-10-27 10:22:02.199','2025-10-27 10:22:02.199'),(4,' UI/UX',' & Product Design','Great ideas deserve designs that feel natural and effortless. Through our UI/UX & Product Design service, every interaction is crafted to solve real user needs clear, intuitive, and impactful. Each screen connects emotion with purpose, turning experiences into growth. Designed for people, built for progress.\r\n',17,'2025-10-27 10:22:51.173','2025-10-27 10:22:51.173'),(5,'SaaS ','Product Engineering',' High-performance, subscription-based software deserves engineering built for scale and impact. Through SaaS Product Engineering, each platform is crafted to be secure, reliable, and rich in features — built to drive recurring revenue, keep users engaged, and grow effortlessly from day one.',18,'2025-10-27 10:23:30.955','2025-10-27 10:23:30.955'),(6,'DevOps &',' CI/CD Automation','Our DevOps & CI/CD Automation service is a strategic shift, replacing manual errors and downtime with automated efficiency, iron-clad reliability, and lower operational costs. We engineer speed and stability directly into your delivery pipeline. ',19,'2025-10-27 10:24:08.081','2025-10-27 10:24:08.081');
/*!40000 ALTER TABLE `service_hero_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_hero_section_file`
--

DROP TABLE IF EXISTS `service_hero_section_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_hero_section_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_hero_section_id` int NOT NULL,
  `file_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Service_Hero_Section_File_service_hero_section_id_file_id_key` (`service_hero_section_id`,`file_id`),
  KEY `Service_Hero_Section_File_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Hero_Section_File_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Service_Hero_Section_File_service_hero_section_id_fkey` FOREIGN KEY (`service_hero_section_id`) REFERENCES `service_hero_section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_hero_section_file`
--

LOCK TABLES `service_hero_section_file` WRITE;
/*!40000 ALTER TABLE `service_hero_section_file` DISABLE KEYS */;
INSERT INTO `service_hero_section_file` VALUES (1,1,808,'2025-10-27 10:17:13.502','2025-10-27 10:17:13.502'),(2,1,809,'2025-10-27 10:17:13.502','2025-10-27 10:17:13.502'),(3,1,810,'2025-10-27 10:17:13.502','2025-10-27 10:17:13.502'),(4,1,811,'2025-10-27 10:17:13.502','2025-10-27 10:17:13.502'),(5,2,812,'2025-10-27 10:21:13.619','2025-10-27 10:21:13.619'),(6,2,813,'2025-10-27 10:21:13.619','2025-10-27 10:21:13.619'),(7,2,814,'2025-10-27 10:21:13.619','2025-10-27 10:21:13.619'),(8,2,815,'2025-10-27 10:21:13.619','2025-10-27 10:21:13.619'),(9,3,816,'2025-10-27 10:22:02.209','2025-10-27 10:22:02.209'),(10,3,817,'2025-10-27 10:22:02.209','2025-10-27 10:22:02.209'),(11,3,818,'2025-10-27 10:22:02.209','2025-10-27 10:22:02.209'),(12,3,819,'2025-10-27 10:22:02.209','2025-10-27 10:22:02.209'),(13,4,820,'2025-10-27 10:22:51.187','2025-10-27 10:22:51.187'),(14,4,821,'2025-10-27 10:22:51.187','2025-10-27 10:22:51.187'),(15,4,822,'2025-10-27 10:22:51.187','2025-10-27 10:22:51.187'),(16,4,823,'2025-10-27 10:22:51.187','2025-10-27 10:22:51.187'),(17,5,824,'2025-10-27 10:23:30.967','2025-10-27 10:23:30.967'),(18,5,825,'2025-10-27 10:23:30.967','2025-10-27 10:23:30.967'),(19,5,826,'2025-10-27 10:23:30.967','2025-10-27 10:23:30.967'),(20,5,827,'2025-10-27 10:23:30.967','2025-10-27 10:23:30.967'),(21,6,828,'2025-10-27 10:24:08.092','2025-10-27 10:24:08.092'),(22,6,829,'2025-10-27 10:24:08.092','2025-10-27 10:24:08.092'),(23,6,830,'2025-10-27 10:24:08.092','2025-10-27 10:24:08.092'),(24,6,831,'2025-10-27 10:24:08.092','2025-10-27 10:24:08.092');
/*!40000 ALTER TABLE `service_hero_section_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_information`
--

DROP TABLE IF EXISTS `service_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_information`
--

LOCK TABLES `service_information` WRITE;
/*!40000 ALTER TABLE `service_information` DISABLE KEYS */;
INSERT INTO `service_information` VALUES (1,'Services We Provide','At Startsmartz, we create intelligent, future-ready solutions that help businesses innovate, scale, and operate securely through compliance-driven, cloud-native technology and digital transformation.',NULL,NULL,'2025-08-27 06:05:36.518','2025-10-21 09:04:52.931');
/*!40000 ALTER TABLE `service_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_sub_category`
--

DROP TABLE IF EXISTS `service_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_sub_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_Sub_Category_service_category_id_fkey` (`service_category_id`),
  KEY `Service_Sub_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Sub_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Service_Sub_Category_service_category_id_fkey` FOREIGN KEY (`service_category_id`) REFERENCES `service_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_sub_category`
--

LOCK TABLES `service_sub_category` WRITE;
/*!40000 ALTER TABLE `service_sub_category` DISABLE KEYS */;
INSERT INTO `service_sub_category` VALUES (32,'Web Applications',14,NULL,'2025-09-26 05:06:13.182','2025-10-25 06:00:25.829'),(33,'Mobile Apps',14,NULL,'2025-09-26 05:06:16.009','2025-10-25 06:00:59.670'),(34,'Enterprise Websites & Cloud Solutions ',14,NULL,'2025-09-26 05:06:17.340','2025-10-25 06:12:46.881'),(43,'Data Engineering & Cloud Foundation',15,NULL,'2025-09-26 05:11:28.324','2025-10-25 09:38:31.957'),(45,'Intelligent Automation (MLOps)',15,NULL,'2025-09-26 07:02:14.562','2025-10-25 09:38:56.182'),(48,'Business Intelligence & Reporting',15,NULL,'2025-09-26 08:43:10.010','2025-10-25 09:39:14.667'),(52,'Content Marketing',16,NULL,'2025-09-26 09:22:51.811','2025-10-25 10:15:27.931'),(53,'Search Engine Optimization (SEO)',16,NULL,'2025-09-26 09:23:14.029','2025-10-25 10:15:41.039'),(54,'Performance Analytics ',16,NULL,'2025-09-26 09:24:08.479','2025-10-25 10:15:56.687'),(58,'User Experience (UX) Research',17,NULL,'2025-09-26 09:26:31.050','2025-10-25 10:23:50.852'),(59,'Information Architecture (IA)',17,NULL,'2025-09-26 09:26:53.987','2025-10-25 10:24:06.802'),(60,'User Interface (UI) Design',17,NULL,'2025-09-26 09:27:26.410','2025-10-25 10:24:21.547'),(64,'Architecture Design',18,NULL,'2025-09-29 09:27:01.240','2025-10-25 11:00:21.600'),(65,'DevOps & Delivery',18,NULL,'2025-09-29 09:27:30.725','2025-10-25 11:00:45.746'),(66,'Monitoring & Analytics',18,NULL,'2025-09-29 09:27:58.226','2025-10-25 11:01:15.195'),(71,'CI/CD Pipeline Setup',19,NULL,'2025-09-29 09:52:57.104','2025-10-25 11:05:54.002'),(72,'Infrastructure as Code (IaC)',19,NULL,'2025-09-29 09:53:17.745','2025-10-25 11:06:10.602'),(73,'DevSecOps Integration',19,NULL,'2025-09-29 09:53:48.831','2025-10-25 11:06:26.085');
/*!40000 ALTER TABLE `service_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_sub_category_description`
--

DROP TABLE IF EXISTS `service_sub_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_sub_category_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_sub_category_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_Sub_Category_Description_service_sub_category_id_fkey` (`service_sub_category_id`),
  CONSTRAINT `Service_Sub_Category_Description_service_sub_category_id_fkey` FOREIGN KEY (`service_sub_category_id`) REFERENCES `service_sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_sub_category_description`
--

LOCK TABLES `service_sub_category_description` WRITE;
/*!40000 ALTER TABLE `service_sub_category_description` DISABLE KEYS */;
INSERT INTO `service_sub_category_description` VALUES (40,'<p class=\"ql-align-justify\">Less manual work, faster decisions. We build the central, intelligent web platform that runs your business whether it\'s managing operations, sales, or data. Think of it as the custom headquarters for your team</p>',32,'2025-09-26 05:06:13.430','2025-10-25 06:00:25.879'),(41,'<p class=\"ql-align-justify\">We create beautiful, high-speed mobile apps for iPhone and Android that let your customers and employees interact with your service seamlessly, on the go.</p>',33,'2025-09-26 05:06:16.117','2025-10-25 06:00:59.716'),(42,'<p class=\"ql-align-justify\">Trust, Authority, and Sales Reliability and the freedom to grow. We build scalable,Direct applications &amp; secure corporate sites and powerful e-commerce platforms that don\'t just look professional they convert visitors into long-term clients.</p>',34,'2025-09-26 05:06:17.471','2025-10-25 06:12:46.919'),(51,'<p class=\"ql-align-justify\">Design and build robust, scalable data warehouses and data lakes on platforms like AWS, Azure, or GCP. We ensure data is clean, secure, and ready for modeling.</p>',43,'2025-09-26 05:11:28.474','2025-10-25 09:38:31.999'),(53,'<p class=\"ql-align-justify\">Establish MLOps pipelines for continuous monitoring, retraining, and deployment of models, ensuring your AI stays accurate and delivers value at scale.</p>',45,'2025-09-26 07:02:14.703','2025-10-25 09:38:56.216'),(56,'<p class=\"ql-align-justify\">Create advanced interactive dashboards (e.g., Power BI, Tableau) and data visualizations that give leadership real-time, strategic insights into performance.</p>',48,'2025-09-26 08:43:10.434','2025-10-25 09:39:14.706'),(60,'<p class=\"ql-align-justify\">Become the industry expert. We create helpful, valuable content that builds your authority and answers customer questions, steadily turning readers into reliable leads.</p>',52,'2025-09-26 09:22:51.962','2025-10-25 10:15:27.972'),(61,'<p class=\"ql-align-justify\">Be the first answer people find. We organize your website\'s \'DNA\' so search engines trust you and confidently put you at the top of the results page, bringing you qualified traffic.</p>',53,'2025-09-26 09:23:14.170','2025-10-25 10:15:41.074'),(62,'<p class=\"ql-align-justify\">Clear visibility and smarter spending. We connect all your data sources to give you a simple, single view of your ROI, so you always know where your marketing money is making the most impact.</p>',54,'2025-09-26 09:24:08.666','2025-10-25 10:15:56.717'),(66,'<p class=\"ql-align-justify\">In-depth analysis using Heuristic Evaluation, Competitive Audits, and Persona Mapping. We conduct moderated and unmoderated user interviews to validate concepts</p>',58,'2025-09-26 09:26:31.182','2025-10-25 10:23:50.892'),(67,'<p class=\"ql-align-justify\">Creating a clear, logical content structure using Card Sorting and Tree Testing. We develop detailed site maps and wireframes to define hierarchy and functional paths</p>',59,'2025-09-26 09:26:54.121','2025-10-25 10:24:06.841'),(68,'<p class=\"ql-align-justify\">Production of high-fidelity mockups, including design systems, component libraries, and style guides (typography, color).&nbsp;</p>',60,'2025-09-26 09:27:26.836','2025-10-25 10:24:21.589'),(72,'<p class=\"ql-align-justify\">Built to handle millions of users. We design the \"behind-the-scenes\" structure of your app to be incredibly efficient, ensuring your platform never crashes when you hit a major growth milestone</p>',64,'2025-09-29 09:27:01.380','2025-10-25 11:00:21.637'),(73,'<p class=\"ql-align-justify\">Daily improvements, no interruptions. We set up automated tools that let us release new features and fixes without ever taking your system offline, so your users always have the best version.</p>',65,'2025-09-29 09:27:30.879','2025-10-25 11:00:45.779'),(74,'<p class=\"ql-align-justify\">&nbsp;Clear visibility into success. We set up smart dashboards that track key business numbers (like user churn and recurring revenue), so you always know what\'s making you money and why.</p>',66,'2025-09-29 09:27:58.370','2025-10-25 11:01:15.224'),(79,'<p class=\"ql-align-justify\">Designing and implementing YAML-based CI/CD pipelines using tools like GitLab CI, GitHub Actions, or Jenkins.</p>',71,'2025-09-29 09:52:57.268','2025-10-25 11:05:54.045'),(80,'<p class=\"ql-align-justify\">Using Terraform or AWS CloudFormation to provision and manage cloud resources (servers, networks, databases).&nbsp;</p>',72,'2025-09-29 09:53:17.915','2025-10-25 11:06:10.628'),(81,'<p class=\"ql-align-justify\">Embedding automated security checks (SAST/DAST scanning, secret management) directly into the CI pipeline.&nbsp;</p>',73,'2025-09-29 09:53:48.968','2025-10-25 11:06:26.115');
/*!40000 ALTER TABLE `service_sub_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_sub_category_description_file`
--

DROP TABLE IF EXISTS `service_sub_category_description_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_sub_category_description_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_sub_category_description_id` int NOT NULL,
  `file_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Service_Sub_Category_Description_File_service_sub_category_d_key` (`service_sub_category_description_id`,`file_id`),
  KEY `Service_Sub_Category_Description_File_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Sub_Category_Description_File_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Service_Sub_Category_Description_File_service_sub_category__fkey` FOREIGN KEY (`service_sub_category_description_id`) REFERENCES `service_sub_category_description` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_sub_category_description_file`
--

LOCK TABLES `service_sub_category_description_file` WRITE;
/*!40000 ALTER TABLE `service_sub_category_description_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_sub_category_description_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_why_choose_us_content`
--

DROP TABLE IF EXISTS `service_why_choose_us_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_why_choose_us_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_Why_Choose_Us_Content_service_category_id_fkey` (`service_category_id`),
  KEY `Service_Why_Choose_Us_Content_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Why_Choose_Us_Content_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Service_Why_Choose_Us_Content_service_category_id_fkey` FOREIGN KEY (`service_category_id`) REFERENCES `service_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_why_choose_us_content`
--

LOCK TABLES `service_why_choose_us_content` WRITE;
/*!40000 ALTER TABLE `service_why_choose_us_content` DISABLE KEYS */;
INSERT INTO `service_why_choose_us_content` VALUES (42,NULL,'We Build Solutions for Your Bottom Line',14,721,'2025-10-25 06:14:19.397','2025-10-25 06:14:19.397'),(43,NULL,'Clear Communication and Zero Surprises',14,722,'2025-10-25 06:14:41.966','2025-10-25 06:14:41.966'),(44,NULL,'Peace of Mind Through Effortless Scaling',14,723,'2025-10-25 06:15:09.385','2025-10-25 06:15:09.385'),(45,NULL,'We Protect You Like Our Own Business',14,724,'2025-10-25 06:15:31.602','2025-10-25 06:15:31.602'),(46,NULL,'We Build Your Future-Proof Platform',14,725,'2025-10-25 06:15:54.441','2025-10-25 06:15:54.441'),(47,NULL,'Real Partnership, Not Just a Transaction',14,726,'2025-10-25 06:16:56.128','2025-10-25 06:16:56.128'),(48,NULL,'Guaranteed ROI Focus',15,731,'2025-10-25 10:09:19.768','2025-10-25 10:09:19.768'),(49,NULL,'Full-Stack Data Expertise',15,732,'2025-10-25 10:09:39.799','2025-10-25 10:09:39.799'),(50,NULL,'Rapid Time-to-Value',15,733,'2025-10-25 10:09:54.590','2025-10-25 10:09:54.590'),(51,NULL,'Scalable, Future-Proof Architecture',15,734,'2025-10-25 10:10:10.587','2025-10-25 10:10:10.587'),(52,NULL,'Ethical & Compliant AI',15,735,'2025-10-25 10:10:25.162','2025-10-25 10:10:25.162'),(53,NULL,'Cross-Functional Elite Team',15,736,'2025-10-25 10:10:38.113','2025-10-25 10:10:38.113'),(54,NULL,'We Guarantee Your Project Stays on Budget',16,741,'2025-10-25 10:20:32.354','2025-10-25 10:20:32.354'),(55,NULL,'Built to Integrate, Not to Replace',16,742,'2025-10-25 10:20:43.935','2025-10-25 10:20:43.935'),(56,NULL,'We Solve Problems, We Don\'t Just Take Orders',16,743,'2025-10-25 10:20:56.249','2025-10-25 10:20:56.249'),(57,NULL,'Architecture Designed to Handle \"Viral\" Moments',16,744,'2025-10-25 10:21:11.947','2025-10-25 10:21:11.947'),(58,NULL,'Your Dedicated \"Tech Whisperer\" on Demand',16,745,'2025-10-25 10:21:48.003','2025-10-25 10:21:48.003'),(59,NULL,'We Only Take On Projects We Truly Believe In',16,746,'2025-10-25 10:22:06.751','2025-10-25 10:22:06.751'),(60,NULL,'You Own the Code, 100% of the Time',17,763,'2025-10-25 10:32:38.864','2025-10-25 10:58:38.957'),(61,NULL,'We Solve Problems, We Don\'t Just Take Orders',17,752,'2025-10-25 10:34:18.063','2025-10-25 10:34:18.063'),(62,NULL,'Architecture Designed to Handle \"Viral\" Moments',17,753,'2025-10-25 10:34:33.711','2025-10-25 10:34:33.711'),(63,NULL,'We Embed with Your Team, We Don\'t Work in a Bubble',17,754,'2025-10-25 10:34:52.420','2025-10-25 10:34:52.420'),(64,NULL,'Real Quality Assurance, Not Just a Checklist',17,755,'2025-10-25 10:35:06.551','2025-10-25 10:35:06.551'),(65,NULL,'We Only Take On Projects We Truly Believe In',17,756,'2025-10-25 10:35:19.303','2025-10-25 10:35:19.303'),(67,NULL,'We Guarantee Absolute Customer Data Privacy',18,768,'2025-10-25 11:03:02.179','2025-10-25 11:03:02.179'),(68,NULL,'Your First Feature Release Will Be Your Fastest',18,769,'2025-10-25 11:03:14.290','2025-10-25 11:03:14.290'),(69,NULL,'Pricing & Billing That Never Causes Churn',18,770,'2025-10-25 11:03:26.612','2025-10-25 11:03:26.612'),(70,NULL,'Engineered to Crush the Next Growth Surge',18,771,'2025-10-25 11:03:41.098','2025-10-25 11:03:41.098'),(71,NULL,'We Prevent Vendor Lock-in (It\'s Your Product)',18,772,'2025-10-25 11:03:52.857','2025-10-25 11:03:52.857'),(72,NULL,'Continuous Updates Without Crashing the System',18,773,'2025-10-25 11:04:03.867','2025-10-25 11:04:03.867'),(73,NULL,'We Guarantee Near-Zero Downtime for Updates',19,778,'2025-10-25 11:08:35.020','2025-10-25 11:08:35.020'),(75,NULL,'We Turn Your Cloud Bill Into a Predictable Cost',19,780,'2025-10-25 11:08:54.895','2025-10-25 11:08:54.895'),(76,NULL,'You Stop Paying for Servers Sitting Idle',19,781,'2025-10-25 11:09:12.891','2025-10-25 11:09:12.891'),(77,NULL,'We Engineer Security Scans Directly into the Process',19,782,'2025-10-25 11:09:48.099','2025-10-25 11:09:48.099'),(78,NULL,'Your Developers Get Their Time Back to Build Features',19,783,'2025-10-25 11:10:02.423','2025-10-25 11:10:02.423'),(79,NULL,'Disaster Recovery Becomes a Single-Button Click',19,784,'2025-10-25 11:10:17.639','2025-10-25 11:10:17.639');
/*!40000 ALTER TABLE `service_why_choose_us_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_why_choose_us_introduction`
--

DROP TABLE IF EXISTS `service_why_choose_us_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_why_choose_us_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Service_Why_Choose_Us_Introduction_service_category_id_fkey` (`service_category_id`),
  KEY `Service_Why_Choose_Us_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Service_Why_Choose_Us_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Service_Why_Choose_Us_Introduction_service_category_id_fkey` FOREIGN KEY (`service_category_id`) REFERENCES `service_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_why_choose_us_introduction`
--

LOCK TABLES `service_why_choose_us_introduction` WRITE;
/*!40000 ALTER TABLE `service_why_choose_us_introduction` DISABLE KEYS */;
INSERT INTO `service_why_choose_us_introduction` VALUES (7,'Why Choose Us ?','We do not just build software; we build solutions that grow with your business. What sets us apart is the perfect blend of experience, innovation, and a people-first approach. Unlike many IT companies that focus only on delivery, we focus on impact. ',14,NULL,'2025-09-26 05:47:49.923','2025-10-27 10:09:01.056'),(8,'Why Choose Us ?','We do not just build websites; we create digital experiences that grow your business. Our web development service is all about combining creativity, technology, and strategy to deliver platforms that are fast, secure, and built to last. ',15,NULL,'2025-09-29 04:17:09.092','2025-10-27 10:25:17.621'),(9,'Why Choose us?','we do not just build apps, we craft experiences. In a world where mobile is the first touchpoint for customers, we design apps that are fast, intuitive, and future-ready. What sets us apart is our unique blend of experience, creativity, and startup agility.',16,NULL,'2025-09-29 08:55:50.525','2025-10-27 10:25:31.679'),(10,'Why choose us?','We do not just design interfaces, we design experiences. Our approach to UI/UX goes beyond colors and layouts; it’s about creating products that feel natural, intuitive, and delightful to use. ',17,NULL,'2025-09-29 09:06:13.525','2025-10-27 10:25:42.023'),(11,'Why choose us?','SEO isn’t just about keywords, it’s about creating visibility, trust, and growth for your brand. Unlike traditional IT companies, we combine technical expertise with creative strategies to deliver long-lasting results. ',18,NULL,'2025-09-29 09:35:15.663','2025-10-27 10:25:50.039'),(12,'Why choose us ?','Digital marketing is more than ads and clicks, it’s about telling your story, reaching the right audience, and turning engagement into real business growth. At Startsmartz, we combine creativity, data-driven strategies, and the latest tools to make your brand stand out. ',19,NULL,'2025-09-29 09:58:05.287','2025-10-27 10:26:04.110');
/*!40000 ALTER TABLE `service_why_choose_us_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_link`
--

DROP TABLE IF EXISTS `social_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Social_Link_file_id_fkey` (`file_id`),
  CONSTRAINT `Social_Link_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_link`
--

LOCK TABLES `social_link` WRITE;
/*!40000 ALTER TABLE `social_link` DISABLE KEYS */;
INSERT INTO `social_link` VALUES (9,'Facebook','https://www.facebook.com/profile.php?id=61577706041136',458,'2025-09-19 05:31:26.745','2025-09-19 05:31:26.745'),(10,'Instagram','https://www.instagram.com/techmartz23/',459,'2025-09-19 05:36:45.800','2025-09-19 05:36:45.800'),(11,'LinkedIn','https://www.linkedin.com/company/startsmartz-technologies-bangladesh',460,'2025-09-19 05:38:05.591','2025-09-19 05:38:05.591'),(12,'Youtube','https://www.youtube.com/@StartsmartzTechnologies',463,'2025-09-24 04:41:41.550','2025-09-24 04:42:23.237');
/*!40000 ALTER TABLE `social_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_information`
--

DROP TABLE IF EXISTS `team_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Team_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Team_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_information`
--

LOCK TABLES `team_information` WRITE;
/*!40000 ALTER TABLE `team_information` DISABLE KEYS */;
INSERT INTO `team_information` VALUES (1,'Meet the Intellectual Properties Behind Startsmartz','Meet the people behind our amazing venture—leaders with experience and young minds with innovation.',NULL,NULL,'2025-08-27 04:39:03.636','2025-10-21 09:23:38.705');
/*!40000 ALTER TABLE `team_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Team_Member_file_id_fkey` (`file_id`),
  CONSTRAINT `Team_Member_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
INSERT INTO `team_member` VALUES (29,'Akhil Raj',1,'Project Management',NULL,685,'2025-10-22 06:49:04.342','2025-10-22 06:49:04.342'),(30,'Ashraf Uddin',2,'Business Development Manager',NULL,686,'2025-10-22 06:49:56.225','2025-10-22 06:49:56.225'),(31,'Abrar Mahir Uddin Sahil',3,'Business Analyst',NULL,691,'2025-10-22 06:50:44.055','2025-10-22 06:52:23.027'),(32,'Masud Rana',4,'Digital Marketing Executive',NULL,688,'2025-10-22 06:51:08.487','2025-10-22 06:51:08.487'),(33,'Mohsin Miah',5,'Backed Team Lead',NULL,689,'2025-10-22 06:51:33.010','2025-10-22 06:51:33.010'),(34,'Shahanaj Parvin',6,'Frontend Team Lead',NULL,690,'2025-10-22 06:51:53.246','2025-10-22 06:51:53.246');
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_category`
--

DROP TABLE IF EXISTS `technology_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Technology_Category_file_id_fkey` (`file_id`),
  CONSTRAINT `Technology_Category_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_category`
--

LOCK TABLES `technology_category` WRITE;
/*!40000 ALTER TABLE `technology_category` DISABLE KEYS */;
INSERT INTO `technology_category` VALUES (3,'Languages',253,'2025-08-30 06:03:17.937','2025-09-09 04:46:44.115'),(4,'Frontend',95,'2025-08-30 06:04:35.481','2025-08-30 06:19:10.169'),(5,'Backend',96,'2025-08-30 06:13:14.327','2025-08-30 06:19:27.245'),(6,'UI/UX',89,'2025-08-30 06:13:52.728','2025-08-30 06:13:52.728'),(7,'DevOps - Services',143,'2025-08-30 06:14:48.735','2025-09-01 10:47:31.112'),(8,'Artificial Intelligence',171,'2025-08-30 06:15:18.799','2025-09-02 09:58:43.315'),(9,'Mobile',92,'2025-08-30 06:15:53.156','2025-08-30 06:15:53.156');
/*!40000 ALTER TABLE `technology_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_information`
--

DROP TABLE IF EXISTS `technology_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Technology_Information_file_id_fkey` (`file_id`),
  CONSTRAINT `Technology_Information_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_information`
--

LOCK TABLES `technology_information` WRITE;
/*!40000 ALTER TABLE `technology_information` DISABLE KEYS */;
INSERT INTO `technology_information` VALUES (1,'The Startsmartz Stack','StartSmartz combines frameworks, cloud infrastructure, and innovative design approaches to deliver secure, scalable solutions that drives a lasting growth for our clients.',NULL,NULL,'2025-08-27 03:05:44.712','2025-10-21 09:13:52.969');
/*!40000 ALTER TABLE `technology_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_product`
--

DROP TABLE IF EXISTS `technology_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `technology_category_id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Technology_Product_technology_category_id_fkey` (`technology_category_id`),
  KEY `Technology_Product_file_id_fkey` (`file_id`),
  CONSTRAINT `Technology_Product_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Technology_Product_technology_category_id_fkey` FOREIGN KEY (`technology_category_id`) REFERENCES `technology_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_product`
--

LOCK TABLES `technology_product` WRITE;
/*!40000 ALTER TABLE `technology_product` DISABLE KEYS */;
INSERT INTO `technology_product` VALUES (10,'Ruby',3,98,'2025-08-30 09:51:54.710','2025-08-30 09:51:54.710'),(11,'php',3,99,'2025-08-30 09:52:38.327','2025-08-30 09:52:38.327'),(12,'Python',3,100,'2025-08-30 09:53:15.807','2025-08-30 09:53:15.807'),(13,'Java',3,101,'2025-08-30 09:53:41.161','2025-08-30 09:53:41.161'),(14,'Swift',3,102,'2025-08-30 09:54:15.984','2025-08-30 09:54:15.984'),(15,'Javascript',3,103,'2025-08-30 09:59:26.544','2025-08-30 09:59:26.544'),(16,'Kotlin',3,104,'2025-08-30 10:00:33.611','2025-08-30 10:00:33.611'),(17,'React',4,108,'2025-09-01 06:05:32.496','2025-09-01 06:05:32.496'),(18,'Next.js',4,356,'2025-09-01 06:07:49.805','2025-09-16 07:13:21.724'),(19,'Angular',4,110,'2025-09-01 06:08:56.057','2025-09-01 06:08:56.057'),(20,'Vuejs',4,111,'2025-09-01 06:10:41.704','2025-09-01 06:10:41.704'),(21,'Tailwindcss',4,112,'2025-09-01 06:12:26.081','2025-09-01 06:12:26.081'),(22,'Bootstrap',4,113,'2025-09-01 06:13:00.530','2025-09-01 06:13:00.530'),(23,'AWS',7,142,'2025-09-01 10:46:08.431','2025-09-01 10:46:08.431'),(24,'Operation',7,144,'2025-09-01 10:50:39.282','2025-09-01 10:50:39.282'),(25,'CI/CD',7,145,'2025-09-01 10:51:53.956','2025-09-01 10:51:53.956'),(26,'Docker',7,146,'2025-09-01 10:54:14.580','2025-09-01 10:54:14.580'),(27,'Jenkins',7,147,'2025-09-01 10:54:45.998','2025-09-01 10:54:45.998'),(28,'Kubernetes',7,148,'2025-09-01 10:55:35.100','2025-09-01 10:55:35.100'),(29,'Datadog',7,149,'2025-09-01 10:56:59.379','2025-09-01 10:56:59.379'),(30,'Ansible',7,150,'2025-09-01 10:57:40.505','2025-09-01 10:57:40.505'),(31,'Figma',6,151,'2025-09-01 10:58:13.788','2025-09-01 10:58:13.788'),(32,'Adobe-xd',6,152,'2025-09-01 10:58:40.977','2025-09-01 10:58:40.977'),(33,'Express js',5,153,'2025-09-01 11:01:18.176','2025-09-01 11:01:18.176'),(34,'Django',5,154,'2025-09-01 11:01:51.979','2025-09-01 11:01:51.979'),(35,'Terraform',7,155,'2025-09-01 11:03:35.022','2025-09-01 11:03:35.022'),(36,'Prometheus & Grafana',7,156,'2025-09-01 11:04:35.489','2025-09-01 11:04:35.489'),(37,'Flask',5,157,'2025-09-01 11:08:26.993','2025-09-01 11:08:26.993'),(38,'Laravel',5,158,'2025-09-01 11:09:03.067','2025-09-01 11:09:03.067'),(39,'Spring Boot',5,159,'2025-09-01 11:09:48.675','2025-09-01 11:09:48.675'),(40,'.Net Core',5,160,'2025-09-01 11:11:31.754','2025-09-01 11:11:31.754'),(41,'Flutter',9,161,'2025-09-01 11:13:54.888','2025-09-01 11:13:54.888'),(42,'Ruby',5,162,'2025-09-01 11:25:24.871','2025-09-01 11:25:24.871'),(43,'Nestjs',5,163,'2025-09-01 11:29:06.104','2025-09-01 11:29:06.104'),(44,'Fastify',5,164,'2025-09-01 11:29:41.235','2025-09-01 11:29:41.235'),(45,'FastAPI',5,165,'2025-09-01 11:30:31.850','2025-09-01 11:30:31.850'),(46,'Phoenix',5,166,'2025-09-01 11:30:58.153','2025-09-01 11:30:58.153'),(47,'Gin',5,167,'2025-09-01 11:31:39.658','2025-09-01 11:31:39.658'),(48,'Threejs',4,170,'2025-09-02 05:37:13.703','2025-09-02 05:37:13.703'),(49,'Machine Learning',8,172,'2025-09-02 10:14:19.505','2025-09-02 10:14:19.505'),(50,'Artificial Neural Network',8,173,'2025-09-02 10:15:27.528','2025-09-02 10:15:27.528'),(51,'Generative AI',8,174,'2025-09-02 10:16:08.339','2025-09-02 10:16:08.339'),(52,'Agentic AI',8,175,'2025-09-02 10:16:42.212','2025-09-02 10:16:42.212'),(53,'Multi-Modal AI',8,176,'2025-09-02 10:17:11.334','2025-09-02 10:17:11.334'),(54,'Artificial General Intelligence',8,177,'2025-09-02 10:17:56.820','2025-09-02 10:17:56.820'),(55,'Computer Vision & Image Processing',8,178,'2025-09-02 10:18:26.245','2025-09-02 10:18:26.245'),(56,'Deep Reinforcement Learning',8,180,'2025-09-02 10:19:07.046','2025-09-02 10:19:07.046'),(57,'Natural Language Processing',8,181,'2025-09-02 10:19:33.649','2025-09-02 10:19:33.649'),(58,'Large Language Model',8,182,'2025-09-02 10:20:07.839','2025-09-02 10:20:07.839'),(59,'MLOps and LLMOps',8,183,'2025-09-02 10:20:37.408','2025-09-02 10:20:37.408'),(61,'React Native',9,357,'2025-09-16 07:21:17.970','2025-09-16 07:21:17.970');
/*!40000 ALTER TABLE `technology_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin@gmail.com','$2b$10$5qNdSu8VgpbJvRXbke9W2.u4IXjEPakWbYGMG0XkfL6GnC47a2X3C','2025-07-07 07:05:44.000','2025-07-07 07:05:44.000'),(4,'Super Admin','17tasmiakhan@gmail.com','$2b$10$fy.A.QqwP4Hxc.M./Lt4Ae6ulWp5y1T5uUaDh61rXY7rXBQKwPYN2','2025-09-18 10:33:51.809','2025-10-28 04:27:40.521');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `why_work_here_introduction`
--

DROP TABLE IF EXISTS `why_work_here_introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `why_work_here_introduction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Why_Work_Here_Introduction_file_id_fkey` (`file_id`),
  CONSTRAINT `Why_Work_Here_Introduction_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `why_work_here_introduction`
--

LOCK TABLES `why_work_here_introduction` WRITE;
/*!40000 ALTER TABLE `why_work_here_introduction` DISABLE KEYS */;
INSERT INTO `why_work_here_introduction` VALUES (1,'Where Talent Meets Quality','Working at Startsmartz means being part of a culture that values collaboration, learning, and growth. Just as technology evolves every day, we believe our people should, too. We encourage continuous learning, knowledge sharing, and mutual support. Because when one of us grows, we all grow. Just like technology, we do not stand still, we evolve, adapt, and improve every day.',NULL,NULL,'2025-09-01 05:20:02.733','2025-09-19 06:29:24.624');
/*!40000 ALTER TABLE `why_work_here_introduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `why_work_here_reason`
--

DROP TABLE IF EXISTS `why_work_here_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `why_work_here_reason` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Why_Work_Here_Reason_file_id_fkey` (`file_id`),
  CONSTRAINT `Why_Work_Here_Reason_file_id_fkey` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `why_work_here_reason`
--

LOCK TABLES `why_work_here_reason` WRITE;
/*!40000 ALTER TABLE `why_work_here_reason` DISABLE KEYS */;
INSERT INTO `why_work_here_reason` VALUES (2,'People First Culture','At Startsmartz, you’re not just an employee, you’re a valued member of a family that builds, learns, and grows together.',NULL,NULL,'2025-09-01 05:23:15.927','2025-09-19 06:28:46.386'),(3,'Continuous Learning','In today’s fast-changing tech world, learning never stops. We provide the resources and culture to keep you ahead.',NULL,NULL,'2025-09-11 10:34:22.168','2025-09-11 10:34:22.168'),(5,'Innovation at the Core','We thrive on creativity and problem-solving. Here, you’ll work on exciting projects that push boundaries and make a real impact.\n',NULL,NULL,'2025-09-19 06:27:07.632','2025-09-19 06:27:07.632'),(6,'Empowerment & Trust','We give you the freedom to take ownership of your work, share ideas, and make decisions that drive real change.\n\n',NULL,NULL,'2025-09-19 06:27:31.224','2025-09-19 06:27:31.224');
/*!40000 ALTER TABLE `why_work_here_reason` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 10:49:00
