-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: webproject
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_chatmessage`
--

DROP TABLE IF EXISTS `accounts_chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_chatmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) DEFAULT NULL,
  `message` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `room_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_chatmessage_user_id_d497f551_fk_auth_user_id` (`user_id`),
  KEY `accounts_chatmessage_room_id_88ff919d_fk_accounts_chatroom_id` (`room_id`),
  CONSTRAINT `accounts_chatmessage_room_id_88ff919d_fk_accounts_chatroom_id` FOREIGN KEY (`room_id`) REFERENCES `accounts_chatroom` (`id`),
  CONSTRAINT `accounts_chatmessage_user_id_d497f551_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_chatmessage`
--

LOCK TABLES `accounts_chatmessage` WRITE;
/*!40000 ALTER TABLE `accounts_chatmessage` DISABLE KEYS */;
INSERT INTO `accounts_chatmessage` VALUES (1,'TestUser','Hello From Shell!','2025-02-23 17:47:26.553208',1,1),(2,'TestUser','Hi','2025-02-23 23:27:46.754777',3,1),(3,'Ady','HI','2025-02-23 23:51:50.157539',3,1),(4,'Ady','??','2025-02-23 23:52:13.580327',3,1),(5,'Ady','Hello','2025-02-24 00:02:52.573427',3,3),(6,'Ady','afkanf','2025-02-24 00:15:36.410376',3,4),(7,'Ady','hi','2025-02-24 01:43:53.814509',3,4),(8,'Ady','hu','2025-02-24 04:05:02.252840',3,1),(9,'Ady','Hi Walkers!','2025-02-24 04:11:22.399942',3,7),(10,'Ady','????','2025-02-24 04:11:26.717433',3,7),(11,'Ady','Hi','2025-02-24 05:51:20.704436',3,3),(12,'Ady','Hello From Ady!!!!!!','2025-02-24 05:52:33.838128',3,8),(13,'Ady','hui','2025-02-25 04:16:33.897407',3,1),(14,'cheenu0123@gmail.com','Hi','2025-03-03 07:24:11.704741',1,7),(15,'alex123@gmail.com','HI','2025-03-04 06:29:09.528631',6,4),(16,'cheenu0123@gmail.com','Hello','2025-03-04 06:29:19.758360',1,4),(17,'vikas121@gmail.com','Hi this is vikas a newbie here !','2025-03-06 10:03:47.078082',7,1),(18,'cheenu0123@gmail.com','Hola!','2025-03-06 10:04:35.872447',1,1),(19,'alan_1212@gmail.com','Hello Ady!','2025-03-19 22:39:44.546765',8,8),(20,'alan_1212@gmail.com','Amigoes!!!','2025-03-19 22:39:54.327786',8,1),(21,'alan_1212@gmail.com','Hi Walkers!','2025-03-19 22:40:06.904524',8,7),(22,'cheenu0123@gmail.com','Hi','2025-03-20 11:25:18.411943',1,1),(23,'cheenu0123@gmail.com','Hi','2025-03-20 11:50:16.059475',1,1),(24,'cheenu0123@gmail.com','hello','2025-03-20 11:50:19.995086',1,1),(25,'cheenu0123@gmail.com','Hi','2025-03-20 20:26:06.885308',1,1),(26,'cheenu0123@gmail.com','HIIIII','2025-03-20 20:26:12.379371',1,1);
/*!40000 ALTER TABLE `accounts_chatmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_chatroom`
--

DROP TABLE IF EXISTS `accounts_chatroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_chatroom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_chatroom`
--

LOCK TABLES `accounts_chatroom` WRITE;
/*!40000 ALTER TABLE `accounts_chatroom` DISABLE KEYS */;
INSERT INTO `accounts_chatroom` VALUES (6,'akex'),(7,'alanwalkerfanclub'),(5,'alen'),(4,'alla'),(1,'general'),(8,'myfm'),(3,'test_room');
/*!40000 ALTER TABLE `accounts_chatroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_hackathon`
--

DROP TABLE IF EXISTS `accounts_hackathon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_hackathon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(200) NOT NULL,
  `end_date` date NOT NULL,
  `is_online` tinyint(1) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_hackathon`
--

LOCK TABLES `accounts_hackathon` WRITE;
/*!40000 ALTER TABLE `accounts_hackathon` DISABLE KEYS */;
INSERT INTO `accounts_hackathon` VALUES (30,'Building the Next-Gen Agentic App with GraphRAG & NVIDIA cuGraph','https://arangodbhackathon.devpost.com/','2025-03-09',1,'Online','2025-02-10'),(31,'Predictive AI In Healthcare with FHIR®','https://meldrx-predictive-ai.devpost.com/','2025-02-23',1,'Online','2025-02-23'),(32,'One Trillion Agents Hackathon','https://1t-agents.devpost.com/','2025-03-02',1,'Online','2025-01-31'),(33,'Azure AI Developer Hackathon','https://azureaidev.devpost.com/','2025-03-28',1,'Online','2025-02-18'),(34,'SANS AI Cybersecurity Hackathon','https://ai-cybersecurity-hackathon.devpost.com/','2025-03-15',1,'Online','2025-02-15'),(35,'Electroneum Hackathon 2025','https://electroneum-hackathon-2025.devpost.com/','2025-03-07',1,'Online','2025-01-08'),(36,'NextAI Hack (Students Only) (Open-Ended)','https://nextai-hack-students-only.devpost.com/','2025-03-01',1,'Online','2025-01-01'),(37,'Windows on Snapdragon AI Hackathon','https://wos-ai.devpost.com/','2025-02-24',1,'Online','2025-01-13'),(38,'Global AI Agents League','https://fetch-ai-hackathon.devpost.com/','2025-04-08',1,'Online','2025-02-14'),(39,'Build Your Own AI Chat Bot','https://build-your-own-ai-chat-bot.devpost.com/','2025-03-14',1,'Online','2025-01-25'),(40,'Digital Jam','https://digital-jam.devpost.com/','2025-03-28',1,'Online','2025-02-04'),(41,'Hack Reddit 2025','https://hackreddit.devpost.com/','2025-03-28',1,'Online','2025-02-27'),(42,'Agentforce Virtual Hackathon','https://agentforcehackathon.devpost.com/','2025-04-30',1,'Online','2025-03-05'),(43,'Meta Horizon Creator Competition: Mobile Genre Showdown','https://mhcp-mobile-genre-competition.devpost.com/','2025-05-09',1,'Online','2025-03-11'),(44,'GNEC Hackathon 2025 Spring - Compete For UN-Affiliated/NGO Internships & Prizes','https://gnec-hackathon-2025-spring.devpost.com/','2025-05-10',1,'Online','2025-03-12'),(45,'IngeniumSTEM Winter Hacks 1.0','https://ingeniumstem-winter-hacks-1-0.devpost.com/','2025-03-30',1,'Online','2025-01-17'),(46,'Hackonomics 2025','https://hackonomics25.devpost.com/','2025-06-15',1,'Online','2025-02-01');
/*!40000 ALTER TABLE `accounts_hackathon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_internshipresource`
--

DROP TABLE IF EXISTS `accounts_internshipresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_internshipresource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_internshipresource`
--

LOCK TABLES `accounts_internshipresource` WRITE;
/*!40000 ALTER TABLE `accounts_internshipresource` DISABLE KEYS */;
INSERT INTO `accounts_internshipresource` VALUES (1,'LinkedIn Jobs','https://www.linkedin.com/jobs/'),(2,'Internshala','https://internshala.com/'),(3,'Naukri Internships','https://www.naukri.com/internship-jobs'),(4,'Glassdoor Internships','https://www.glassdoor.com/Job/internship-jobs-SRCH_KO0,10.htm'),(5,'Wellfound (formerly AngelList Talent)','https://angel.co/jobs'),(6,'Unstop (For Tech & Analytics Internships)','https://unstop.com/'),(7,'HackerEarth Jobs','https://www.hackerearth.com/jobs/'),(8,'Google Careers (SWE Internships)','https://careers.google.com/'),(9,'Microsoft Internships','https://careers.microsoft.com/students/us/en/'),(10,'IBM Internships','https://www.ibm.com/employment/internships/'),(11,'Resume Guide by GeeksforGeeks','https://www.geeksforgeeks.org/how-to-make-a-resume-that-stands-out/'),(12,'Leetcode Interview Question','https://leetcode.com/discuss/interview-question/'),(13,'Tech Interview Handbook','https://www.techinterviewhandbook.org/'),(14,'Mock Interviews (Pramp)','https://www.pramp.com/'),(15,'System Design Prep','https://github.com/donnemartin/system-design-primer'),(16,'Behavioral Interview Guide','https://www.interviewbit.com/blog/behavioral-interview-questions/'),(17,'Facebook Research Internships','https://research.facebook.com/careers/'),(18,'GFG top 50 interview prep questions','https://www.geeksforgeeks.org/common-interview-questions-and-answers/');
/*!40000 ALTER TABLE `accounts_internshipresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_resource`
--

DROP TABLE IF EXISTS `accounts_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `link` varchar(200) NOT NULL,
  `description` longtext NOT NULL DEFAULT (_utf8mb3'1'),
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_resource`
--

LOCK TABLES `accounts_resource` WRITE;
/*!40000 ALTER TABLE `accounts_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_roadmap`
--

DROP TABLE IF EXISTS `accounts_roadmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_roadmap` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `steps` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `is_tracked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_roadmap_user_id_4f172d4d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `accounts_roadmap_user_id_4f172d4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_roadmap`
--

LOCK TABLES `accounts_roadmap` WRITE;
/*!40000 ALTER TABLE `accounts_roadmap` DISABLE KEYS */;
INSERT INTO `accounts_roadmap` VALUES (1,'Web Developer','## Web Developer Learning Roadmap\n\nThis roadmap focuses on becoming a full-stack web developer proficient in both front-end and back-end technologies.  It\'s broken down into stages with estimated completion times and resources.  Adjust the timeline based on your learning pace and dedication.\n\n**Stage 1: Front-End Fundamentals (8-12 weeks)**\n\n* **Goal:** Build static web pages and understand core front-end concepts.\n* **Topics:**\n    * HTML: Learn the structure of web pages (1 week).\n        * Resources: MDN Web Docs, freeCodeCamp, Codecademy.\n    * CSS: Style web pages and create layouts (2-3 weeks).\n        * Resources: MDN Web Docs, CSS-Tricks, freeCodeCamp.\n    * JavaScript: Add interactivity and dynamic behavior (4-5 weeks).\n        * Resources: MDN Web Docs, freeCodeCamp, JavaScript.info.\n* **Projects:** Build several small projects like a landing page, a simple calculator, or a to-do list.\n* **Completion Time:** 8-12 weeks.\n\n\n**Stage 2: Front-End Frameworks (6-8 weeks)**\n\n* **Goal:**  Master a popular JavaScript framework for building complex user interfaces.\n* **Topics:**\n    * Choose a framework: React, Vue, or Angular (Research and choose one that suits you).\n    * Learn the framework\'s core concepts, components, state management, and routing (4-6 weeks).\n        * Resources: Official documentation for your chosen framework, Udemy, Coursera, YouTube tutorials.\n    * Build a more complex project using the chosen framework, incorporating API interaction (2 weeks).\n* **Projects:** Build a single-page application like an e-commerce product page, a blog, or a social media feed.\n* **Completion Time:** 6-8 weeks.\n\n\n**Stage 3: Back-End Fundamentals (8-12 weeks)**\n\n* **Goal:** Understand server-side programming, databases, and APIs.\n* **Topics:**\n    * Choose a server-side language: Node.js (JavaScript), Python (Django/Flask), Ruby on Rails, Java (Spring), PHP, etc. (1 week)\n    * Learn the basics of your chosen language and its web framework. (3-4 weeks)\n        * Resources: Official documentation, online tutorials, books specific to your chosen language/framework.\n    * Databases: Learn SQL and NoSQL databases (MongoDB, PostgreSQL, MySQL). (2-3 weeks)\n        * Resources: MongoDB University, PostgreSQL Tutorial, MySQL Tutorial.\n    * APIs: Learn how to create and consume RESTful APIs. (2-3 weeks)\n        * Resources: MDN Web Docs, REST API Tutorial.\n* **Projects:** Build a simple API for a blog or a to-do list, including CRUD operations.\n* **Completion Time:** 8-12 weeks.\n\n\n\n**Stage 4: Version Control & Deployment (2-3 weeks)**\n\n* **Goal:** Learn to manage code effectively and deploy web applications.\n* **Topics:**\n    * Git: Learn version control and collaborate on projects. (1-2 weeks)\n        * Resources: GitHub Learning Lab, Git - the simple guide.\n    * Deployment: Learn how to deploy your projects to platforms like Netlify, Vercel, Heroku, AWS, or Google Cloud. (1 week)\n        * Resources: Platform-specific documentation and tutorials.\n* **Projects:** Deploy your front-end and back-end projects to a live server.\n* **Completion Time:** 2-3 weeks.\n\n\n\n\n**Stage 5: Advanced Concepts & Specialization (Ongoing)**\n\n* **Goal:**  Deepen your knowledge in specific areas based on your interests and career goals.\n* **Topics:**\n    * Testing (Unit, Integration, End-to-End)\n    * Security best practices\n    * Performance optimization\n    * Design patterns\n    * Specific frameworks or libraries (e.g., Redux, GraphQL)\n    * DevOps and CI/CD\n    * Accessibility (a11y)\n    * Mobile development (React Native, Flutter)\n* **Projects:** Contribute to open-source projects, build complex web applications, or specialize in a particular area like front-end performance or back-end security.\n* **Completion Time:** Ongoing.\n\n\n\n**Important Notes:**\n\n* This roadmap is a guideline. Adjust it based on your interests and learning style.\n* Focus on building projects.  Practical experience is crucial.\n* Don\'t be afraid to experiment and learn from your mistakes.\n* Join online communities and connect with other developers.\n* Continuously learn and stay updated with the latest technologies.  Web development is a constantly evolving field. \n\n\nThis roadmap provides a solid foundation for your journey as a web developer.  Be patient, persistent, and enjoy the process! \n','2025-03-20 02:22:11.974471',1,0),(2,'Web Development','<ul><h3>## Web Development Learning Roadmap</h3>\n<li>*I. Foundational Front-End (Client-Side):**</li>\n<li>**HTML (HyperText Markup Language):**</li>\n<li>Learn basic HTML tags (headings, paragraphs, lists, links, images, etc.)</li>\n<li>Understand HTML structure and semantics.</li>\n<li>Practice building simple web pages.</li>\n<li>Explore HTML5 semantic elements and multimedia.</li>\n<li>**CSS (Cascading Style Sheets):**</li>\n<li>Learn CSS selectors, properties, and values.</li>\n<li>Understand the box model, positioning, and layouts.</li>\n<li>Practice styling HTML elements and creating responsive designs.</li>\n<li>Explore CSS frameworks (Bootstrap, Tailwind CSS).</li>\n<li>Learn CSS preprocessors (Sass, Less).</li>\n<li>**JavaScript:**</li>\n<li>Learn JavaScript fundamentals (variables, data types, operators, control flow).</li>\n<li>Understand DOM manipulation and event handling.</li>\n<li>Practice building interactive web pages.</li>\n<li>Learn asynchronous JavaScript (Promises, Async/Await).</li>\n<li>Explore popular JavaScript libraries and frameworks (React, Angular, Vue.js).</li>\n<li>*II. Back-End (Server-Side):**</li>\n<li>**Choose a Server-Side Language:** (e.g., Node.js, Python, Ruby, PHP, Java)</li>\n<li>Learn the syntax and core concepts of the chosen language.</li>\n<li>Understand server-side programming paradigms.</li>\n<li>**Databases:**</li>\n<li>Learn about relational databases (SQL) and NoSQL databases.</li>\n<li>Choose a database technology (e.g., MySQL, PostgreSQL, MongoDB).</li>\n<li>Practice writing database queries and managing data.</li>\n<li>**Server Management:**</li>\n<li>Learn basic server administration (setting up a server, deploying applications).</li>\n<li>Understand concepts like HTTP requests and responses.</li>\n<li>Familiarize yourself with server-side frameworks (e.g., Express.js for Node.js, Django for Python, Ruby on Rails).</li>\n<li>**APIs (Application Programming Interfaces):**</li>\n<li>Learn how to create and consume RESTful APIs.</li>\n<li>Understand API design principles and best practices.</li>\n<li>**Security:**</li>\n<li>Learn about common web security vulnerabilities (e.g., XSS, SQL injection).</li>\n<li>Implement security best practices in your code.</li>\n<li>*III. Advanced Concepts & Tools:**</li>\n<li>**Version Control (Git):**</li>\n<li>Learn how to use Git for code management and collaboration.</li>\n<li>Understand branching, merging, and pull requests.</li>\n<li>**Testing and Debugging:**</li>\n<li>Learn how to write unit tests and integration tests.</li>\n<li>Use debugging tools to identify and fix code errors.</li>\n<li>**Performance Optimization:**</li>\n<li>Learn techniques for optimizing website performance (e.g., caching, code minification).</li>\n<li>**Deployment and Hosting:**</li>\n<li>Learn how to deploy web applications to different platforms (e.g., Heroku, AWS, Netlify).</li>\n<li>Understand different hosting options.</li>\n<li>**Accessibility and SEO:**</li>\n<li>Learn how to make websites accessible to users with disabilities.</li>\n<li>Implement SEO best practices to improve website visibility.</li>\n<li>*IV. Continuous Learning:**</li>\n<li>**Stay up-to-date with the latest web development trends and technologies.**</li>\n<li>**Contribute to open-source projects.**</li>\n<li>**Join online communities and attend conferences.**</li>\n<li>**Build personal projects to practice and expand your skills.**</li>\n<li>**Consider specializing in a specific area of web development (e.g., front-end frameworks, back-end development, DevOps).**</li>\n<h3>This roadmap provides a general guideline. You can adjust it based on your specific goals and interests.  Remember that consistency and practice are key to becoming a successful web developer.</h3>\n</ul>','2025-03-20 02:25:26.001115',1,0);
/*!40000 ALTER TABLE `accounts_roadmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_sdesheet`
--

DROP TABLE IF EXISTS `accounts_sdesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_sdesheet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_sdesheet`
--

LOCK TABLES `accounts_sdesheet` WRITE;
/*!40000 ALTER TABLE `accounts_sdesheet` DISABLE KEYS */;
INSERT INTO `accounts_sdesheet` VALUES (1,'Striver’s SDE Sheet','https://takeuforward.org/interviews/strivers-sde-sheet-top-coding-interview-problems/'),(2,'Love Babbar’s 450 DSA Sheet','https://450dsa.com/'),(3,'A2OJ DSA Ladder','https://a2oj.com/'),(4,'Neetcode DSA List','https://neetcode.io/roadmap'),(5,'Codeforces Problem Set (sorted by difficulty)','https://codeforces.com/problemset'),(6,'GeeksforGeeks DSA Practice','https://practice.geeksforgeeks.org/explore?page=1&sortBy=submissions'),(7,'Codeforces','https://codeforces.com/'),(8,'CodeChef Long Challenges','https://www.codechef.com/contests'),(9,'System Design Primer (GitHub)','https://github.com/donnemartin/system-design-primer'),(10,'CS50 Harvard Course (Free CS Basics)','https://cs50.harvard.edu/'),(11,'Andrew Ng’s Machine Learning Cheat Sheet','https://cs229.stanford.edu/syllabus-spring2022.html'),(12,'Striver’s SDE Sheet (TakeUForward)','https://takeuforward.org/interview-experience/strivers-sde-sheet-top-coding-interview-problems/'),(13,'Love Babbar’s 450 DSA Sheet','https://drive.google.com/file/d/1PRL3US1mHdw1GEikKnBZYblUT1tLzI0O/view'),(14,'GeeksforGeeks SDE Cheat Sheet','https://www.geeksforgeeks.org/sde-sheet-a-complete-guide-for-sde-preparation/');
/*!40000 ALTER TABLE `accounts_sdesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_videolecture`
--

DROP TABLE IF EXISTS `accounts_videolecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_videolecture` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_videolecture`
--

LOCK TABLES `accounts_videolecture` WRITE;
/*!40000 ALTER TABLE `accounts_videolecture` DISABLE KEYS */;
INSERT INTO `accounts_videolecture` VALUES (1,'Data Structures & Algorithms (DSA)','https://www.youtube.com/playlist?list=PLDzeHZWIZsTo87y1ytEAqp7wYlEP3nner'),(2,'Data Structures & Algorithms (DSA','https://www.youtube.com/playlist?list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ'),(3,'Operating Systems (OS)','https://www.youtube.com/playlist?list=PLxCzCOWd7aiGFBD2-2joCpWOLUrDLvVV_'),(4,'Operating Systems (OS)','https://www.youtube.com/playlist?list=PLmGElG-9wxc9Us6IK6Qy-KHlG_F3IS6Q9'),(5,'Database Management System (DBMS)','https://www.youtube.com/playlist?list=PLxCzCOWd7aiGmiGl_DOuRMJYG8tOVuapB'),(6,'Database Management System (DBMS)','https://www.youtube.com/playlist?list=PLdo5W4Nhv31YvlDpJhvDczGGMk2mpnqxI'),(7,'System Design','https://www.youtube.com/playlist?list=PLMCXHnjXnTnvQVrWOrEfwWYXtt5YoYoZL'),(8,'System Design','https://www.youtube.com/playlist?list=PLo8y_ynzHX0mBvFskG9DuqXBm2xHoWnWY'),(9,'Computer Networks (CN)','https://www.youtube.com/playlist?list=PLxCzCOWd7aiEed7bL0aD7xz7pJ3gQp9F9'),(10,'Computer Networks(CN)','https://www.youtube.com/playlist?list=PLmGElG-9wxc8ZpPdnXqVxpzL2Q5K4iE6r'),(11,'Aptitude & Logical Reasoning','https://www.youtube.com/playlist?list=PLKQu-ix31TLJ4zBV91x0U4yAF7-ZXyXWj'),(12,'Aptitude & Logical Reasoning','https://www.youtube.com/playlist?list=PL3K1pzqH3wRzxS-Jwp8i_LG2FMuM4gS9R');
/*!40000 ALTER TABLE `accounts_videolecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'EcoAddress'),(1,'general'),(2,'Room1'),(3,'Room2');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,2,1),(70,2,2),(71,2,3),(72,2,4),(73,2,5),(74,2,6),(75,2,7),(76,2,8),(77,2,9),(78,2,10),(79,2,11),(80,2,12),(81,2,13),(82,2,14),(83,2,15),(84,2,16),(85,2,17),(86,2,18),(87,2,19),(88,2,20),(89,2,21),(90,2,22),(91,2,23),(92,2,24),(93,2,25),(94,2,26),(95,2,27),(96,2,28),(97,2,29),(98,2,30),(99,2,31),(100,2,32),(101,2,33),(102,2,34),(103,2,35),(104,2,36),(105,2,37),(106,2,38),(107,2,39),(108,2,40),(109,2,41),(110,2,42),(111,2,43),(112,2,44),(113,2,45),(114,2,46),(115,2,47),(116,2,48),(117,2,49),(118,2,50),(119,2,51),(120,2,52),(121,2,53),(122,2,54),(123,2,55),(124,2,56),(125,2,57),(126,2,58),(127,2,59),(128,2,60),(129,2,61),(130,2,62),(131,2,63),(132,2,64),(133,2,65),(134,2,66),(135,2,67),(136,2,68),(137,3,1),(138,3,2),(139,3,3),(140,3,4),(141,3,5),(142,3,6),(143,3,7),(144,3,8),(145,3,9),(146,3,10),(147,3,11),(148,3,12),(149,3,13),(150,3,14),(151,3,15),(152,3,16),(153,3,17),(154,3,18),(155,3,19),(156,3,20),(157,3,21),(158,3,22),(159,3,23),(160,3,24),(161,3,25),(162,3,26),(163,3,27),(164,3,28),(165,3,29),(166,3,30),(167,3,31),(168,3,32),(169,3,33),(170,3,34),(171,3,35),(172,3,36),(173,3,37),(174,3,38),(175,3,39),(176,3,40),(177,3,41),(178,3,42),(179,3,43),(180,3,44),(181,3,45),(182,3,46),(183,3,47),(184,3,48),(185,3,49),(186,3,50),(187,3,51),(188,3,52),(189,3,53),(190,3,54),(191,3,55),(192,3,56),(193,3,57),(194,3,58),(195,3,59),(196,3,60),(197,3,61),(198,3,62),(199,3,63),(200,3,64),(201,3,65),(202,3,66),(203,3,67),(204,3,68),(205,4,1),(206,4,2),(207,4,3),(208,4,4),(209,4,5),(210,4,6),(211,4,7),(212,4,8),(213,4,9),(214,4,10),(215,4,11),(216,4,12),(217,4,13),(218,4,14),(219,4,15),(220,4,16),(221,4,17),(222,4,18),(223,4,19),(224,4,20),(225,4,21),(226,4,22),(227,4,23),(228,4,24),(229,4,25),(230,4,26),(231,4,27),(232,4,28),(233,4,29),(234,4,30),(235,4,31),(236,4,32),(237,4,33),(238,4,34),(239,4,35),(240,4,36),(241,4,37),(242,4,38),(243,4,39),(244,4,40),(245,4,41),(246,4,42),(247,4,43),(248,4,44),(249,4,45),(250,4,46),(251,4,47),(252,4,48),(253,4,49),(254,4,50),(255,4,51),(256,4,52),(257,4,53),(258,4,54),(259,4,55),(260,4,56),(261,4,57),(262,4,58),(263,4,59),(264,4,60),(265,4,61),(266,4,62),(267,4,63),(268,4,64),(269,4,65),(270,4,66),(271,4,67),(272,4,68);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add hackathon',8,'add_hackathon'),(30,'Can change hackathon',8,'change_hackathon'),(31,'Can delete hackathon',8,'delete_hackathon'),(32,'Can view hackathon',8,'view_hackathon'),(33,'Can add blog',9,'add_blog'),(34,'Can change blog',9,'change_blog'),(35,'Can delete blog',9,'delete_blog'),(36,'Can view blog',9,'view_blog'),(37,'Can add roadmap',10,'add_roadmap'),(38,'Can change roadmap',10,'change_roadmap'),(39,'Can delete roadmap',10,'delete_roadmap'),(40,'Can view roadmap',10,'view_roadmap'),(41,'Can add subject',11,'add_subject'),(42,'Can change subject',11,'change_subject'),(43,'Can delete subject',11,'delete_subject'),(44,'Can view subject',11,'view_subject'),(45,'Can add resource',12,'add_resource'),(46,'Can change resource',12,'change_resource'),(47,'Can delete resource',12,'delete_resource'),(48,'Can view resource',12,'view_resource'),(49,'Can add internship resource',13,'add_internshipresource'),(50,'Can change internship resource',13,'change_internshipresource'),(51,'Can delete internship resource',13,'delete_internshipresource'),(52,'Can view internship resource',13,'view_internshipresource'),(53,'Can add sde sheet',14,'add_sdesheet'),(54,'Can change sde sheet',14,'change_sdesheet'),(55,'Can delete sde sheet',14,'delete_sdesheet'),(56,'Can view sde sheet',14,'view_sdesheet'),(57,'Can add video lecture',15,'add_videolecture'),(58,'Can change video lecture',15,'change_videolecture'),(59,'Can delete video lecture',15,'delete_videolecture'),(60,'Can view video lecture',15,'view_videolecture'),(61,'Can add chat room',16,'add_chatroom'),(62,'Can change chat room',16,'change_chatroom'),(63,'Can delete chat room',16,'delete_chatroom'),(64,'Can view chat room',16,'view_chatroom'),(65,'Can add chat message',17,'add_chatmessage'),(66,'Can change chat message',17,'change_chatmessage'),(67,'Can delete chat message',17,'delete_chatmessage'),(68,'Can view chat message',17,'view_chatmessage'),(69,'Can add site',18,'add_site'),(70,'Can change site',18,'change_site'),(71,'Can delete site',18,'delete_site'),(72,'Can view site',18,'view_site'),(73,'Can add email address',19,'add_emailaddress'),(74,'Can change email address',19,'change_emailaddress'),(75,'Can delete email address',19,'delete_emailaddress'),(76,'Can view email address',19,'view_emailaddress'),(77,'Can add email confirmation',20,'add_emailconfirmation'),(78,'Can change email confirmation',20,'change_emailconfirmation'),(79,'Can delete email confirmation',20,'delete_emailconfirmation'),(80,'Can view email confirmation',20,'view_emailconfirmation'),(81,'Can add social account',21,'add_socialaccount'),(82,'Can change social account',21,'change_socialaccount'),(83,'Can delete social account',21,'delete_socialaccount'),(84,'Can view social account',21,'view_socialaccount'),(85,'Can add social application',22,'add_socialapp'),(86,'Can change social application',22,'change_socialapp'),(87,'Can delete social application',22,'delete_socialapp'),(88,'Can view social application',22,'view_socialapp'),(89,'Can add social application token',23,'add_socialtoken'),(90,'Can change social application token',23,'change_socialtoken'),(91,'Can delete social application token',23,'delete_socialtoken'),(92,'Can view social application token',23,'view_socialtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$NsyRWIFgeX2lS4RpDVWinr$IRsSsTLTo+orzpx6XtRHlfu2TV8o9F/AVoCgcO4CAl8=','2025-03-21 10:46:08.053062',0,'cheenu0123@gmail.com','ADARSH','AGRAWAL','cheenu0123@gmail.com',0,1,'2025-02-16 15:56:19.635631'),(2,'pbkdf2_sha256$870000$xuE1F8V7KoT3fqQZv0Yt7o$EN2BuYtGn8ld6gGEPF3qPa2CPFsn2sj8ZUQIzuXaPnw=','2025-02-17 08:26:42.743030',0,'rajendrasinghpareste@gmail.com','Rajendra','Singh','rajendrasinghpareste@gmail.com',0,1,'2025-02-17 08:26:18.679581'),(3,'pbkdf2_sha256$870000$ihnjLbgtBTNm0yOaO4uJ6F$1PAMiRAjNQHn6rOygJYCtjwtYksFgsOlO5WeFCRYDA4=','2025-03-21 10:28:29.632310',1,'Ady','','','cheenu0123@gmail.com',1,1,'2025-02-19 10:48:00.588817'),(4,'pbkdf2_sha256$870000$297dawJIAT3vnSIxY74xER$Bc6jWwaFgXDbwEVVUBFjB/hwT6ksIrewAvOouJ5YQu8=','2025-02-20 07:58:13.485818',0,'silentwolf09082004@gmail.com','ADARSH','AGRAWAL','silentwolf09082004@gmail.com',0,1,'2025-02-20 07:58:00.555497'),(5,'pbkdf2_sha256$870000$Gf6FSRIgLkF9Sm7yatqm3B$7qXFD6PDGo2bi4/B/r/j5qQLPb+5GNlMDgI/RCa/WJw=','2025-03-20 08:50:23.845961',0,'alex@gmail.com','Alex','Watcher','alex@gmail.com',0,1,'2025-02-20 09:13:59.660434'),(6,'pbkdf2_sha256$870000$uca3tgfO7QhyGVQm4cDFfG$OUacGOGXW1SFLEQyfSQW6rsdUMOYAmUzfHFnHm6fzJU=','2025-03-04 06:28:59.270612',0,'alex123@gmail.com','Alex','Watcher','alex123@gmail.com',0,1,'2025-03-04 06:28:45.869854'),(7,'pbkdf2_sha256$870000$hxWx6sZ3103UnYcC0bn4Uc$BMnhiC2zg8EDY95cq1qOs7KixOPcRbxVApRB++9aHn4=','2025-03-06 10:03:26.156027',0,'vikas121@gmail.com','Vikas','Singh','vikas121@gmail.com',0,1,'2025-03-06 10:03:19.681406'),(8,'pbkdf2_sha256$870000$OOwVybKIeKZrlkoqzAdWiz$5a0hn41+8OMxjG2kRmyrJLYoFZ/uG3gy8iIdtt3nC3s=','2025-03-19 22:39:14.479873',0,'alan_1212@gmail.com','Alex','Walker','alan_1212@gmail.com',0,1,'2025-03-19 22:39:05.833072');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-02-19 10:53:24.504034','1','1 - Major League Hacking (MLH) Hackathons',1,'[{\"added\": {}}]',8,3),(2,'2025-02-19 10:54:25.765924','2','1 - Google Solution Challenge',1,'[{\"added\": {}}]',8,3),(3,'2025-02-19 11:04:17.444326','3','1 - Hacktoberfest',1,'[{\"added\": {}}]',8,3),(4,'2025-02-19 11:05:18.035768','4','2 - Smart India Hackathon (SIH)',1,'[{\"added\": {}}]',8,3),(5,'2025-02-19 11:06:07.869536','5','2 - Microsoft Imagine Cup',1,'[{\"added\": {}}]',8,3),(6,'2025-02-19 11:07:35.049668','6','3 - Google Hash Code',1,'[{\"added\": {}}]',8,3),(7,'2025-02-19 11:08:28.924925','7','4 - Google Summer of Code (GSoC)',1,'[{\"added\": {}}]',8,3),(8,'2025-02-20 13:02:59.797426','1','SdeSheet object (1)',1,'[{\"added\": {}}]',14,3),(9,'2025-02-20 13:03:19.023245','2','SdeSheet object (2)',1,'[{\"added\": {}}]',14,3),(10,'2025-02-20 13:03:37.628349','3','SdeSheet object (3)',1,'[{\"added\": {}}]',14,3),(11,'2025-02-20 13:04:02.256310','4','SdeSheet object (4)',1,'[{\"added\": {}}]',14,3),(12,'2025-02-20 13:04:16.994073','5','SdeSheet object (5)',1,'[{\"added\": {}}]',14,3),(13,'2025-02-20 13:04:37.260633','6','SdeSheet object (6)',1,'[{\"added\": {}}]',14,3),(14,'2025-02-20 13:05:00.041296','7','SdeSheet object (7)',1,'[{\"added\": {}}]',14,3),(15,'2025-02-20 13:05:16.220299','8','SdeSheet object (8)',1,'[{\"added\": {}}]',14,3),(16,'2025-02-20 13:05:34.948390','9','SdeSheet object (9)',1,'[{\"added\": {}}]',14,3),(17,'2025-02-20 13:05:53.270417','10','SdeSheet object (10)',1,'[{\"added\": {}}]',14,3),(18,'2025-02-20 13:14:17.887533','1','InternshipResource object (1)',1,'[{\"added\": {}}]',13,3),(19,'2025-02-20 13:14:31.247725','2','InternshipResource object (2)',1,'[{\"added\": {}}]',13,3),(20,'2025-02-20 13:14:42.994719','3','InternshipResource object (3)',1,'[{\"added\": {}}]',13,3),(21,'2025-02-20 13:14:57.476859','4','InternshipResource object (4)',1,'[{\"added\": {}}]',13,3),(22,'2025-02-20 13:15:14.209444','5','InternshipResource object (5)',1,'[{\"added\": {}}]',13,3),(23,'2025-02-20 13:15:27.287701','6','InternshipResource object (6)',1,'[{\"added\": {}}]',13,3),(24,'2025-02-20 13:15:40.057282','7','InternshipResource object (7)',1,'[{\"added\": {}}]',13,3),(25,'2025-02-20 13:15:53.990288','8','InternshipResource object (8)',1,'[{\"added\": {}}]',13,3),(26,'2025-02-20 13:16:06.781122','9','InternshipResource object (9)',1,'[{\"added\": {}}]',13,3),(27,'2025-02-20 13:16:16.732772','10','InternshipResource object (10)',1,'[{\"added\": {}}]',13,3),(28,'2025-02-20 13:16:40.107583','11','InternshipResource object (11)',1,'[{\"added\": {}}]',13,3),(29,'2025-02-20 13:16:49.317770','12','InternshipResource object (12)',1,'[{\"added\": {}}]',13,3),(30,'2025-02-20 13:16:59.798318','13','InternshipResource object (13)',1,'[{\"added\": {}}]',13,3),(31,'2025-02-20 13:17:11.749028','14','InternshipResource object (14)',1,'[{\"added\": {}}]',13,3),(32,'2025-02-20 13:17:26.409413','15','InternshipResource object (15)',1,'[{\"added\": {}}]',13,3),(33,'2025-02-20 13:17:38.251166','16','InternshipResource object (16)',1,'[{\"added\": {}}]',13,3),(34,'2025-02-20 13:17:53.562830','17','InternshipResource object (17)',1,'[{\"added\": {}}]',13,3),(35,'2025-02-20 13:46:35.142360','11','SdeSheet object (11)',1,'[{\"added\": {}}]',14,3),(36,'2025-02-20 13:48:08.351324','12','SdeSheet object (12)',1,'[{\"added\": {}}]',14,3),(37,'2025-02-20 13:48:26.789108','13','SdeSheet object (13)',1,'[{\"added\": {}}]',14,3),(38,'2025-02-20 13:48:38.565546','14','SdeSheet object (14)',1,'[{\"added\": {}}]',14,3),(39,'2025-02-20 13:51:00.168223','1','VideoLecture object (1)',1,'[{\"added\": {}}]',15,3),(40,'2025-02-20 13:51:13.908082','2','VideoLecture object (2)',1,'[{\"added\": {}}]',15,3),(41,'2025-02-20 13:51:25.165815','3','VideoLecture object (3)',1,'[{\"added\": {}}]',15,3),(42,'2025-02-20 13:51:37.905339','4','VideoLecture object (4)',1,'[{\"added\": {}}]',15,3),(43,'2025-02-20 13:51:49.657325','5','VideoLecture object (5)',1,'[{\"added\": {}}]',15,3),(44,'2025-02-20 13:52:00.149292','6','VideoLecture object (6)',1,'[{\"added\": {}}]',15,3),(45,'2025-02-20 13:52:22.416763','7','VideoLecture object (7)',1,'[{\"added\": {}}]',15,3),(46,'2025-02-20 13:52:32.530350','8','VideoLecture object (8)',1,'[{\"added\": {}}]',15,3),(47,'2025-02-20 13:52:45.314546','9','VideoLecture object (9)',1,'[{\"added\": {}}]',15,3),(48,'2025-02-20 13:53:02.530470','10','VideoLecture object (10)',1,'[{\"added\": {}}]',15,3),(49,'2025-02-20 13:53:14.499137','11','VideoLecture object (11)',1,'[{\"added\": {}}]',15,3),(50,'2025-02-20 13:53:30.373417','12','VideoLecture object (12)',1,'[{\"added\": {}}]',15,3),(51,'2025-02-23 15:30:07.049508','1','general',1,'[{\"added\": {}}]',3,3),(52,'2025-02-23 18:47:25.072977','2','Room1',1,'[{\"added\": {}}]',3,3),(53,'2025-02-23 18:47:32.312685','3','Room2',1,'[{\"added\": {}}]',3,3),(54,'2025-02-23 18:47:43.552958','4','EcoAddress',1,'[{\"added\": {}}]',3,3),(55,'2025-03-06 10:02:08.432102','18','InternshipResource object (18)',1,'[{\"added\": {}}]',13,3),(56,'2025-03-20 09:27:13.643272','3','Web development - cheenu0123@gmail.com',3,'',10,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (19,'account','emailaddress'),(20,'account','emailconfirmation'),(9,'accounts','blog'),(17,'accounts','chatmessage'),(16,'accounts','chatroom'),(7,'accounts','customuser'),(8,'accounts','hackathon'),(13,'accounts','internshipresource'),(12,'accounts','resource'),(10,'accounts','roadmap'),(14,'accounts','sdesheet'),(11,'accounts','subject'),(15,'accounts','videolecture'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(18,'sites','site'),(21,'socialaccount','socialaccount'),(22,'socialaccount','socialapp'),(23,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-16 13:57:02.367383'),(2,'contenttypes','0002_remove_content_type_name','2025-02-16 13:57:02.475061'),(3,'auth','0001_initial','2025-02-16 13:57:03.392397'),(4,'auth','0002_alter_permission_name_max_length','2025-02-16 13:57:03.553030'),(5,'auth','0003_alter_user_email_max_length','2025-02-16 13:57:03.585655'),(6,'auth','0004_alter_user_username_opts','2025-02-16 13:57:03.596241'),(7,'auth','0005_alter_user_last_login_null','2025-02-16 13:57:03.706131'),(8,'auth','0006_require_contenttypes_0002','2025-02-16 13:57:03.709996'),(9,'auth','0007_alter_validators_add_error_messages','2025-02-16 13:57:03.718906'),(10,'auth','0008_alter_user_username_max_length','2025-02-16 13:57:03.817807'),(11,'auth','0009_alter_user_last_name_max_length','2025-02-16 13:57:03.919320'),(12,'auth','0010_alter_group_name_max_length','2025-02-16 13:57:03.950956'),(13,'auth','0011_update_proxy_permissions','2025-02-16 13:57:03.963663'),(14,'auth','0012_alter_user_first_name_max_length','2025-02-16 13:57:04.057532'),(15,'accounts','0001_initial','2025-02-16 13:57:04.472081'),(16,'admin','0001_initial','2025-02-16 13:57:04.670879'),(17,'admin','0002_logentry_remove_auto_add','2025-02-16 13:57:04.681713'),(18,'admin','0003_logentry_add_action_flag_choices','2025-02-16 13:57:04.696174'),(19,'sessions','0001_initial','2025-02-16 13:57:04.747245'),(20,'accounts','0002_hackathon','2025-02-19 10:44:25.563932'),(21,'accounts','0003_blog_roadmap_subject_resource','2025-02-19 11:20:18.247496'),(22,'accounts','0004_delete_blog_delete_roadmap_remove_resource_subject_and_more','2025-02-20 11:30:09.306677'),(23,'accounts','0005_internshipresource_sdesheet_videolecture_and_more','2025-02-20 11:55:19.498468'),(24,'accounts','0006_remove_hackathon_benefits_and_more','2025-02-23 10:48:16.311872'),(25,'accounts','0007_chatroom_chatmessage','2025-02-23 15:16:36.715024'),(26,'accounts','0008_delete_customuser','2025-02-23 18:40:16.077479'),(27,'accounts','0009_roadmap','2025-03-20 02:04:53.279512'),(28,'accounts','0010_roadmap_is_tracked','2025-03-20 02:46:23.414282'),(29,'account','0001_initial','2025-03-20 19:10:26.316441'),(30,'account','0002_email_max_length','2025-03-20 19:10:26.340575'),(31,'account','0003_alter_emailaddress_create_unique_verified_email','2025-03-20 19:10:26.383954'),(32,'account','0004_alter_emailaddress_drop_unique_email','2025-03-20 19:10:26.442193'),(33,'account','0005_emailaddress_idx_upper_email','2025-03-20 19:10:26.473993'),(34,'account','0006_emailaddress_lower','2025-03-20 19:10:26.489529'),(35,'account','0007_emailaddress_idx_email','2025-03-20 19:10:26.542830'),(36,'account','0008_emailaddress_unique_primary_email_fixup','2025-03-20 19:10:26.559053'),(37,'account','0009_emailaddress_unique_primary_email','2025-03-20 19:10:26.568838'),(38,'sites','0001_initial','2025-03-20 19:10:26.592107'),(39,'sites','0002_alter_domain_unique','2025-03-20 19:10:26.609724'),(40,'socialaccount','0001_initial','2025-03-20 19:10:27.042433'),(41,'socialaccount','0002_token_max_lengths','2025-03-20 19:10:27.096731'),(42,'socialaccount','0003_extra_data_default_dict','2025-03-20 19:10:27.105550'),(43,'socialaccount','0004_app_provider_id_settings','2025-03-20 19:10:27.253328'),(44,'socialaccount','0005_socialtoken_nullable_app','2025-03-20 19:10:27.387705'),(45,'socialaccount','0006_alter_socialaccount_extra_data','2025-03-20 19:10:27.450112');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ouqr8quevzel9grxk1848k8tsc01u3t4','.eJxVjLEOwjAMRP8lM4qaKE4MIzvfUNmxSwsokZp2Qvw7rdQBttO9d_c2Pa3L2K9N534SczHOnH47pvzUsgN5ULlXm2tZ5ontrtiDNnuroq_r4f4djNTGbU0JsHMOnQfIeM6SusgpQhARjD7BMDhCDmlwGgOT6hYBOkHvAyubzxfFrjev:1tvZtA:qLTNo48i-99Mg9wBt9TVt2uOBIxi0_DtmRKNqYbms3k','2025-04-04 10:46:08.056384'),('u91v8mhwby7p6tvuwk91vrx7xctt6vhb','.eJxVjLEOwjAMRP8lM4qaKE4MIzvfUNmxSwsokZp2Qvw7rdQBttO9d_c2Pa3L2K9N534SczHOnH47pvzUsgN5ULlXm2tZ5ontrtiDNnuroq_r4f4djNTGbU0JsHMOnQfIeM6SusgpQhARjD7BMDhCDmlwGgOT6hYBOkHvAyubzxfFrjev:1tq85c:Lwd1RMZsdHoNaeLYS-FdIX7MvqdEHkn0aUdBI55NvYs','2025-03-20 10:04:28.186098'),('xbv7531bbdr6ni2lcrf819q3hhrvgfj4','.eJxVkMFuwyAQRP9lz5YFBAz2qcq9X1BF1gLrmDaGyGClVZR_r2lzyW2082ZWmjugc2mLZcStzBRLcFhCiuNCZU4-w_Bxh38NA1wx51taPTSABQaupVCCHzrTil4I3ssGtkxrxIV22s1EcWNcHN7OC4ZL69ICj1MDf7_GSo6h1nJ4uVl0XxSr4T8xntOei2UNtq1I-3Rz-548XY5P9qVgxjzvadTKMM4NF0o50zuvWWd1p6T33nRCq2niaKzUE6dOWiTapVLMGyGkJVtLM-Vc56Dva1h_YGCPX98VZN8:1tvRPM:WH1yt0CCfVE2t80vAwUiwPxGYiSLUh_6VaG0dwwXSO4','2025-04-04 01:42:48.316109'),('zgwj4qado6smmx8k3r09t6g38ll64dyx','.eJxVjMsOwiAUBf-FtSFAy8ule7-B3AeVqoGktCvjv2uTLnR7Zua8RIJtLWnreUkzi7Nw4vS7IdAj1x3wHeqtSWp1XWaUuyIP2uW1cX5eDvfvoEAv39oYiwHRRnIqRj0xGVLWDhqJgjcuo4JIynsPYRhZB6dGRuemaIhUsOL9AdqWN3g:1tpLlz:a_NvtoL7gdt6DjnU5CqOVXeZuodvMzumekDCvmAAlBc','2025-03-18 06:28:59.274915');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com'),(2,'127.0.0.1:8000','localhost');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-21 16:59:12
