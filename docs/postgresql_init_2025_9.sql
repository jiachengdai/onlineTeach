-- PostgreSQL database initialization script

-- Drop and create tables with PostgreSQL syntax
DROP TABLE IF EXISTS chapter_progress CASCADE;
DROP TABLE IF EXISTS chapter_file CASCADE;
DROP TABLE IF EXISTS chapter CASCADE;

-- Create chapter table with PostgreSQL syntax
CREATE TABLE chapter (
  chapterId SERIAL PRIMARY KEY,
  courseId VARCHAR(20) NOT NULL,
  title VARCHAR(100) NOT NULL,
  orderNum INTEGER,
  description VARCHAR(200)
);

-- Create chapter_file table
CREATE TABLE chapter_file (
  fileId SERIAL PRIMARY KEY,
  chapterId INTEGER NOT NULL REFERENCES chapter(chapterId) ON DELETE CASCADE,
  fileName VARCHAR(100) NOT NULL,
  fileUrl VARCHAR(255) NOT NULL,
  fileType VARCHAR(20),
  uploadTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  description VARCHAR(200)
);

-- Create chapter_progress table
CREATE TABLE chapter_progress (
  progressId SERIAL PRIMARY KEY,
  stuId VARCHAR(20) NOT NULL,
  chapterId INTEGER NOT NULL REFERENCES chapter(chapterId),
  completed BOOLEAN DEFAULT FALSE,
  completedTime TIMESTAMP,
  UNIQUE (stuId, chapterId)
);

-- Insert sample data (same as original)
INSERT INTO chapter (courseId, title, orderNum, description) VALUES 
('10001', '第一章 课程介绍', 1, '介绍课程的基本内容和学习目标'),
('10001', '第二章 基础知识', 2, '讲解课程的基础理论知识'),
('10001', '第三章 进阶内容', 3, '深入探讨课程的核心概念'),
('10001', '第四章 实践应用', 4, '通过实例讲解课程的应用场景'),
('10001', '第五章 前沿技术', 5, '介绍该领域的最新研究成果和技术趋势'),
('10001', '第六章 总结与展望', 6, '总结课程内容并展望未来发展方向');

INSERT INTO chapter_file (chapterId, fileName, fileUrl, fileType, description) VALUES 
(1, '课程介绍.pdf', 'https://big-event0713.oss-cn-shanghai.aliyuncs.com/0%20%E8%AF%BE%E7%A8%8B%E5%AE%89%E6%8E%92.ppt', 'pdf', '课程介绍文档'),
(1, '课程介绍视频', 'https://big-event0713.oss-cn-shanghai.aliyuncs.com/TRAVLE%20WITH%20ME%20-%20Google%20Chrome%202024-05-22%2016-54-33.mp4', 'video', '课程介绍视频'),
(2, '基础知识PPT', 'https://big-event0713.oss-cn-shanghai.aliyuncs.com/0%20%E8%AF%BE%E7%A8%8B%E5%AE%89%E6%8E%92.ppt', 'ppt', '基础知识讲解幻灯片'),
(3, '进阶内容讲解', 'https://big-event0713.oss-cn-shanghai.aliyuncs.com/0%20%E8%AF%BE%E7%A8%8B%E5%AE%89%E6%8E%92.ppt', 'ppt', '进阶内容讲解幻灯片'),
(4, '实践案例视频', 'https://big-event0713.oss-cn-shanghai.aliyuncs.com/TRAVLE%20WITH%20ME%20-%20Google%20Chrome%202024-05-22%2016-54-33.mp4', 'video', '实践案例视频讲解');

INSERT INTO chapter_progress (stuId, chapterId, completed, completedTime) VALUES 
('221310411', 1, TRUE, NOW());

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS account CASCADE;
CREATE TABLE account (
  accId SERIAL PRIMARY KEY,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(200) NOT NULL,
  avatar VARCHAR(200) DEFAULT NULL,
  type INTEGER NOT NULL
);

--
-- Dumping data for table `account`
--

INSERT INTO account VALUES (1,'221310411','e10adc3949ba59abbe56e057f20f883e','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg',2),(2,'221310332','e10adc3949ba59abbe56e057f20f883e','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg',2),(5,'221310410','e10adc3949ba59abbe56e057f20f883e','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg',1),(6,'10320101','e10adc3949ba59abbe56e057f20f883e','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg',3),(52,'100001','e10adc3949ba59abbe56e057f20f883e',NULL,0),(55,'123298890','e10adc3949ba59abbe56e057f20f883e',NULL,0),(56,'10000013','password',NULL,0),(57,'10000013','password',NULL,0),(58,'10000013','password',NULL,0);

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS admin CASCADE;
CREATE TABLE admin (
  adminId SERIAL PRIMARY KEY,
  sex VARCHAR(4) DEFAULT NULL,
  job VARCHAR(20) DEFAULT NULL,
  accId INTEGER NOT NULL,
  CONSTRAINT admin_ibfk_1 FOREIGN KEY (accId) REFERENCES account (accId)
);

--
-- Dumping data for table `admin`
--

INSERT INTO admin VALUES (1,'男','教务处',6),(7,'男','学工部',52),(8,'男','xs',55);

--
-- Table structure for table `ansrecord`
--

DROP TABLE IF EXISTS ansrecord CASCADE;
CREATE TABLE ansrecord (
  stuId VARCHAR(20) NOT NULL,
  paperExeId SMALLINT NOT NULL,
  stuAns TEXT DEFAULT NULL,
  stuScore SMALLINT DEFAULT NULL,
  PRIMARY KEY (stuId,paperExeId)
);

--
-- Dumping data for table `ansrecord`
--

INSERT INTO ansrecord VALUES ('221310411',47,'111',0),('221310411',48,'A',3),('221310411',49,'1',3);

--
-- Table structure for table `blank`
--

DROP TABLE IF EXISTS blank CASCADE;
CREATE TABLE blank (
  blankId SERIAL PRIMARY KEY,
  exeId SMALLINT NOT NULL,
  question TEXT DEFAULT NULL,
  ans VARCHAR(20) DEFAULT NULL,
  ansText TEXT DEFAULT NULL
);

--
-- Dumping data for table `blank`
--

INSERT INTO blank VALUES (6,123,'1','1','1');

--
-- Table structure for table `choose`
--

DROP TABLE IF EXISTS choose CASCADE;
CREATE TABLE choose (
  chooseId SERIAL PRIMARY KEY,
  exeId SMALLINT NOT NULL,
  question TEXT DEFAULT NULL,
  ans VARCHAR(4) DEFAULT NULL,
  optionA VARCHAR(100) DEFAULT NULL,
  optionB VARCHAR(100) DEFAULT NULL,
  optionC VARCHAR(100) DEFAULT NULL,
  optionD VARCHAR(100) DEFAULT NULL,
  ansText TEXT DEFAULT NULL
);

--
-- Dumping data for table `choose`
--

INSERT INTO choose VALUES (12,15,'AAA1','A','AAAA1','AAA','AA','A','A');

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS class CASCADE;
CREATE TABLE class (
  classId SERIAL PRIMARY KEY,
  stuNum SMALLINT DEFAULT NULL,
  courseId VARCHAR(20) DEFAULT NULL,
  teaId VARCHAR(20) DEFAULT NULL,
  logo VARCHAR(150) DEFAULT NULL
);

--
-- Dumping data for table `class`
--

INSERT INTO class VALUES (3,0,'10001','221310410','https://big-event0713.oss-cn-shanghai.aliyuncs.com/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202025-04-18%20165205.png'),(6,0,'10002','221310410','https://big-event0713.oss-cn-shanghai.aliyuncs.com/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202025-04-18%20165205.png'),(7,0,'10003','221310410','https://big-event0713.oss-cn-shanghai.aliyuncs.com/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202025-04-18%20165205.png'),(9,NULL,'10004','221310410','https://big-event0713.oss-cn-shanghai.aliyuncs.com/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202025-04-18%20165205.png'),(12,0,'10006','221310410','https://big-event0713.oss-cn-shanghai.aliyuncs.com/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202025-04-18%20165205.png'),(13,0,'1021021','221310410','https://big-event0713.oss-cn-shanghai.aliyuncs.com/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202025-04-18%20165205.png');

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS comment CASCADE;
CREATE TABLE comment (
  commentId SMALLINT NOT NULL,
  commentUser INTEGER NOT NULL,
  type SMALLINT DEFAULT NULL,
  replyToId INTEGER DEFAULT NULL,
  content TEXT DEFAULT NULL,
  classId INTEGER DEFAULT NULL,
  commentName VARCHAR(20) DEFAULT NULL,
  commentLogo VARCHAR(90) DEFAULT NULL,
  commentTime VARCHAR(50) DEFAULT NULL
);

--
-- Dumping data for table `comment`
--

INSERT INTO comment VALUES (47,1,0,NULL,'这是',3,'代佳诚','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg','2024-07-29 16:50:28'),(48,1,0,NULL,'发送\n',3,'代佳诚','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg','2024-07-29 16:50:41'),(51,1,0,NULL,'f',3,'代佳诚','https://big-event0713.oss-cn-shanghai.aliyuncs.com/71e360b3f7d360efe6e50741762e3e0.jpg','2024-07-31 14:12:24');

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS course CASCADE;
CREATE TABLE course (
  courseId VARCHAR(20) NOT NULL PRIMARY KEY,
  courseName VARCHAR(20) DEFAULT NULL,
  credit INTEGER DEFAULT NULL,
  courseTime VARCHAR(20) DEFAULT NULL,
  place VARCHAR(20) DEFAULT NULL,
  term VARCHAR(20) DEFAULT NULL,
  syllabus VARCHAR(100) DEFAULT NULL,
  syllabusUrl VARCHAR(400) DEFAULT NULL
);

--
-- Dumping data for table `course`
--

INSERT INTO course VALUES ('10001','机器学习12',2,'周一5-9','松1221','2022s-2023a','解机器学习的概念、技术','http://big-event0713.oss-cn-shanghai.aliyuncs.com/eafd4bfc-0ba1-4c2d-9cb0-231a88a6f180.pdf'),('10002','操作系统原理',2,'周一5-9','松1225','2022s-2023a','OS大纲',''),('10003','计算机组成原理',2,'周一5-9','松1225','2022s-2023a','计组大纲','http://www.baidu.com'),('10004','数据库系统原理',2,'1-16周 周四7-9节','松1443','2025s','',''),('10005','离散数学',3,'1-16周 周四7-9节','松1442','2024s','',''),('10006','人工智能',2,'1-8周 周四10-11','1246','2024a','',''),('1021021','C++',3,'1-16周 周三8-9','松1229','2024a','C++','');

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS examrecord CASCADE;
CREATE TABLE examrecord (
  stuId VARCHAR(20) NOT NULL,
  paperId SMALLINT NOT NULL,
  time SMALLINT DEFAULT NULL,
  score SMALLINT DEFAULT NULL,
  state INTEGER DEFAULT NULL,
  PRIMARY KEY (stuId,paperId)
);

--
-- Dumping data for table `examrecord`
--

INSERT INTO examrecord VALUES ('221310411',7,0,6,0);

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS exercise CASCADE;
CREATE TABLE exercise (
  exeId SERIAL PRIMARY KEY,
  type VARCHAR(20) DEFAULT NULL,
  updateTime TIMESTAMP DEFAULT NULL,
  classId INTEGER DEFAULT NULL
);

--
-- Dumping data for table `exercise`
--

INSERT INTO exercise VALUES (1,'选择题','2024-07-28 09:37:47',3),(2,'选择题','2024-07-20 19:20:29',3),(4,'填空题','2024-07-20 20:26:12',3),(6,'判断题','2024-07-20 21:10:57',3),(9,'简答题','2024-07-20 21:14:39',3),(10,'选择题','2024-07-26 12:10:27',3),(15,'选择题','2024-07-28 14:07:05',3),(121,'简答题','2024-07-30 20:25:59',3),(122,'判断题','2024-07-29 21:52:24',3),(123,'填空题','2024-07-31 14:06:40',3),(144,'填空题','2024-07-29 21:52:02',3),(145,'选择题','2024-07-29 21:51:44',3);

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS judge CASCADE;
CREATE TABLE judge (
  judgeId SERIAL PRIMARY KEY,
  exeId SMALLINT NOT NULL,
  question TEXT DEFAULT NULL,
  ans INTEGER DEFAULT NULL,
  ansText TEXT DEFAULT NULL
);

--
-- Dumping data for table `judge`
--

-- No data for judge table in original script

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS paper CASCADE;
CREATE TABLE paper (
  paperId SERIAL PRIMARY KEY,
  type INTEGER DEFAULT NULL,
  tolScore SMALLINT DEFAULT NULL,
  standardScore SMALLINT DEFAULT NULL,
  startTime VARCHAR(30) DEFAULT NULL,
  endTime VARCHAR(30) DEFAULT NULL,
  updateTime VARCHAR(20) DEFAULT NULL,
  state INTEGER DEFAULT NULL,
  duration INTEGER DEFAULT NULL,
  classId INTEGER DEFAULT NULL,
  paperTitle VARCHAR(30) DEFAULT NULL
);

--
-- Dumping data for table `paper`
--

INSERT INTO paper VALUES (7,0,100,60,'2024-07-21 14:57:20','2024-07-21 16:57:20','2024-07-21 15:57:15',0,120,3,'小测验1'),(8,0,100,60,'2024-07-21 14:57:20','2024-07-21 16:57:20','2024-07-22 15:20:49',1,120,3,'小测验2'),(9,1,100,60,'2024-07-21 14:57:20','2024-07-21 16:57:20','2024-07-22 15:23:24',1,120,3,'小测验3'),(10,0,100,90,'2024-04-03 08:40:00','2024-04-03 09:40:00','2024-07-28 13:01:25',NULL,60,3,NULL),(11,1,100,12,'2024-05-06 08:40:00','2024-05-06 09:40:00','2024-07-28 13:02:56',NULL,60,3,'测验');

--
-- Table structure for table `paperexe`
--

DROP TABLE IF EXISTS paperexe CASCADE;
CREATE TABLE paperexe (
  paperExeId SERIAL PRIMARY KEY,
  paperId SMALLINT DEFAULT NULL,
  exeId SMALLINT NOT NULL,
  score SMALLINT DEFAULT NULL
);

--
-- Dumping data for table `paperexe`
--

INSERT INTO paperexe VALUES (35,8,15,3),(45,8,121,3),(46,8,121,4),(47,7,121,1),(48,7,15,3),(49,7,123,3);

--
-- Table structure for table `shortans`
--

DROP TABLE IF EXISTS shortans CASCADE;
CREATE TABLE shortans (
  shortAnsId SERIAL PRIMARY KEY,
  exeId SMALLINT NOT NULL,
  question TEXT DEFAULT NULL,
  ans TEXT DEFAULT NULL,
  ansText TEXT DEFAULT NULL
);

--
-- Dumping data for table `shortans`
--

INSERT INTO shortans VALUES (5,121,'发的','发发发1','发发发');

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS slides CASCADE;
CREATE TABLE slides (
  slidesId SERIAL PRIMARY KEY,
  courseId VARCHAR(20) DEFAULT NULL,
  title VARCHAR(30) DEFAULT NULL,
  url VARCHAR(100) DEFAULT NULL,
  sectionId INTEGER DEFAULT NULL
);

--
-- Dumping data for table `slides`
--

INSERT INTO slides VALUES (1,'10001','企业JAVA技术1','http://localhost:8080',1),(2,'10001','02 KNN','http://staff.ustc.edu.cn/~xlanchen/2011FallOS/slides/0_start.pdf',2),(3,'10002','同步与互斥','http://big-event0713.oss-cn-shanghai.aliyuncs.com/c7e5b17e-5e08-4aa1-9878-e6b0c6764bbc.pptx',3),(5,'10001','List','http://big-event0713.oss-cn-shanghai.aliyuncs.com/a892358d-868d-46f7-bc9e-1726a001a6c5.pdf',4);

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS student CASCADE;
CREATE TABLE student (
  stuId VARCHAR(20) NOT NULL PRIMARY KEY,
  stuName VARCHAR(10) DEFAULT NULL,
  sex VARCHAR(4) DEFAULT NULL,
  type VARCHAR(5) DEFAULT NULL,
  dept VARCHAR(20) DEFAULT NULL,
  major VARCHAR(20) DEFAULT NULL,
  grade VARCHAR(5) DEFAULT NULL,
  adminClass VARCHAR(10) DEFAULT NULL,
  accId INTEGER NOT NULL
);

--
-- Dumping data for table `student`
--

INSERT INTO student VALUES ('221310411','代佳诚','男','本科生','计算机科学与技术学院','软件工程','2022级','卓越软件2202',1);

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS teacher CASCADE;
CREATE TABLE teacher (
  teaId VARCHAR(20) NOT NULL PRIMARY KEY,
  teaName VARCHAR(20) DEFAULT NULL,
  sex VARCHAR(4) DEFAULT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  email VARCHAR(30) DEFAULT NULL,
  job VARCHAR(20) DEFAULT NULL,
  courses TEXT DEFAULT NULL,
  selfInfo TEXT DEFAULT NULL,
  accId INTEGER DEFAULT NULL
);

--
-- Dumping data for table `teacher`
--

INSERT INTO teacher VALUES ('221310410','教师1','男','13023111691','lili@dhu.edu.cn','副教授','离散数学、人工智能、软件测试','毕业于XX大学软件工程专业1',5);

--
-- Table structure for table `xuanxiu`
--

DROP TABLE IF EXISTS xuanxiu CASCADE;
CREATE TABLE xuanxiu (
  stuId VARCHAR(20) NOT NULL,
  classId INTEGER NOT NULL,
  score INTEGER DEFAULT NULL,
  PRIMARY KEY (stuId,classId)
);

--
-- Dumping data for table `xuanxiu`
--

INSERT INTO xuanxiu VALUES ('221310411',3,100),('221310411',7,0);

-- Add foreign key constraints after all tables are created
ALTER TABLE admin ADD CONSTRAINT admin_accId_fkey FOREIGN KEY (accId) REFERENCES account (accId);
ALTER TABLE ansrecord ADD CONSTRAINT ansrecord_stuId_fkey FOREIGN KEY (stuId) REFERENCES student (stuId);
ALTER TABLE ansrecord ADD CONSTRAINT ansrecord_paperExeId_fkey FOREIGN KEY (paperExeId) REFERENCES paperexe (paperExeId);
ALTER TABLE blank ADD CONSTRAINT blank_exeId_fkey FOREIGN KEY (exeId) REFERENCES exercise (exeId);
ALTER TABLE choose ADD CONSTRAINT choose_exeId_fkey FOREIGN KEY (exeId) REFERENCES exercise (exeId) ON DELETE CASCADE;
ALTER TABLE class ADD CONSTRAINT class_teaId_fkey FOREIGN KEY (teaId) REFERENCES teacher (teaId);
ALTER TABLE class ADD CONSTRAINT class_courseId_fkey FOREIGN KEY (courseId) REFERENCES course (courseId);
ALTER TABLE comment ADD CONSTRAINT comment_classId_fkey FOREIGN KEY (classId) REFERENCES class (classId);
ALTER TABLE examrecord ADD CONSTRAINT examrecord_stuId_fkey FOREIGN KEY (stuId) REFERENCES student (stuId);
ALTER TABLE examrecord ADD CONSTRAINT examrecord_paperId_fkey FOREIGN KEY (paperId) REFERENCES paper (paperId);
ALTER TABLE exercise ADD CONSTRAINT exercise_classId_fkey FOREIGN KEY (classId) REFERENCES class (classId);
ALTER TABLE judge ADD CONSTRAINT judge_exeId_fkey FOREIGN KEY (exeId) REFERENCES exercise (exeId);
ALTER TABLE paper ADD CONSTRAINT paper_classId_fkey FOREIGN KEY (classId) REFERENCES class (classId);
ALTER TABLE paperexe ADD CONSTRAINT paperexe_paperId_fkey FOREIGN KEY (paperId) REFERENCES paper (paperId);
ALTER TABLE paperexe ADD CONSTRAINT paperexe_exeId_fkey FOREIGN KEY (exeId) REFERENCES exercise (exeId);
ALTER TABLE shortans ADD CONSTRAINT shortans_exeId_fkey FOREIGN KEY (exeId) REFERENCES exercise (exeId);
ALTER TABLE slides ADD CONSTRAINT slides_courseId_fkey FOREIGN KEY (courseId) REFERENCES course (courseId);
ALTER TABLE student ADD CONSTRAINT student_accId_fkey FOREIGN KEY (accId) REFERENCES account (accId);
ALTER TABLE teacher ADD CONSTRAINT teacher_accId_fkey FOREIGN KEY (accId) REFERENCES account (accId);
ALTER TABLE xuanxiu ADD CONSTRAINT xuanxiu_stuId_fkey FOREIGN KEY (stuId) REFERENCES student (stuId);
ALTER TABLE xuanxiu ADD CONSTRAINT xuanxiu_classId_fkey FOREIGN KEY (classId) REFERENCES class (classId);