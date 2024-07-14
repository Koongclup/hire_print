/*
 Navicat Premium Data Transfer

 Source Server         : 50
 Source Server Type    : MySQL
 Source Server Version : 100114 (10.1.14-MariaDB)
 Source Host           : 192.168.212.50:3306
 Source Schema         : db_employee

 Target Server Type    : MySQL
 Target Server Version : 100114 (10.1.14-MariaDB)
 File Encoding         : 65001

 Date: 14/07/2024 22:00:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL,
  `UserName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '1234', 'Liam Moore', 'admin@mail.com', '2023-10-04 09:54:27');
INSERT INTO `admin` VALUES (2, 'bruno', '5f4dcc3b5aa765d61d8327deb882cf99', 'Bruno Den', 'itsbruno@mail.com', '2022-02-09 22:15:50');
INSERT INTO `admin` VALUES (3, 'greenwood', '5f4dcc3b5aa765d61d8327deb882cf99', 'Johnny Greenwood', 'greenwood@mail.com', '2022-02-09 22:15:54');

-- ----------------------------
-- Table structure for leave_2
-- ----------------------------
DROP TABLE IF EXISTS `leave_2`;
CREATE TABLE `leave_2`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leave_status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `approve` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sumdate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leave_2
-- ----------------------------

-- ----------------------------
-- Table structure for leave_status
-- ----------------------------
DROP TABLE IF EXISTS `leave_status`;
CREATE TABLE `leave_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `leave_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `leave_status` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leave_status
-- ----------------------------
INSERT INTO `leave_status` VALUES (1, 'การลาป่วย', 'Y');
INSERT INTO `leave_status` VALUES (2, 'การลาคลอดบุตร', 'Y');
INSERT INTO `leave_status` VALUES (3, 'การลาไปช่วยเหลือภริยาที่คลอดบุตร', 'Y');
INSERT INTO `leave_status` VALUES (4, 'การลากิจส่วนตัว', 'Y');
INSERT INTO `leave_status` VALUES (5, 'การลาพักผ่อน', 'Y');
INSERT INTO `leave_status` VALUES (6, 'การลาอุปสมบทหรือการลาไปประกอบพิธีฮัจย์', 'Y');
INSERT INTO `leave_status` VALUES (7, 'การลาเข้ารับการตรวจเลือกหรือเข้ารับการเตรียมพล', 'Y');
INSERT INTO `leave_status` VALUES (8, 'การลาไปศึกษา ฝึกอบรม ปฏิบัติการวิจัย หรือดูงาน', 'Y');
INSERT INTO `leave_status` VALUES (9, 'การลาไปปฏิบัติงานในองค์การระหว่างประเทศ', 'Y');
INSERT INTO `leave_status` VALUES (10, 'การลาติดตามคู่สมรส', 'Y');
INSERT INTO `leave_status` VALUES (11, 'การลาไปฟื้นฟูสมรรถภาพด้านอาชีพ', 'Y');

-- ----------------------------
-- Table structure for leaves
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves`  (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event_approve` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event_start_date` date NULL DEFAULT NULL,
  `event_end_date` date NULL DEFAULT NULL,
  `color` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depart` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `event_id`(`event_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leaves
-- ----------------------------
INSERT INTO `leaves` VALUES (56, 'sss', 'นายเกียรติศักดิ์ ถนอม', NULL, NULL, '2023-10-24', '2023-10-27', '#FFBF00', NULL, NULL);
INSERT INTO `leaves` VALUES (57, 'eee', 'นายฐากูร หมู่มาก', NULL, NULL, '2023-10-25', '2023-10-28', '#9FE2BF', NULL, NULL);
INSERT INTO `leaves` VALUES (58, 'เกือบขิต', 'นายเรวัต สุขดี', NULL, NULL, '2023-10-31', '2023-11-01', '#800080', NULL, NULL);
INSERT INTO `leaves` VALUES (59, 'test', 'นายสนั่น  เทียนทอง', NULL, NULL, '2023-11-01', '2023-11-03', '#800000', NULL, NULL);
INSERT INTO `leaves` VALUES (60, 'rrrrr', 'น.ส.วรัญช์ธิตา  จิรสิริโภคิน', NULL, NULL, '2023-11-01', '2023-11-02', '#FFFF00', NULL, NULL);
INSERT INTO `leaves` VALUES (61, 'eeeeee', 'น.ส.ศิวพร  พึ่งภพ', NULL, NULL, '2023-11-02', '2023-11-03', '#FF00FF', NULL, NULL);
INSERT INTO `leaves` VALUES (62, 'ssss', 'น.ส.กมลญาณินี จันทร์สว่าง', NULL, NULL, '2023-11-03', '2023-11-04', '#DE3163', NULL, NULL);
INSERT INTO `leaves` VALUES (63, 'test', 'น.ส.นันทิยา เทพแสง', NULL, NULL, '2023-11-08', '2023-11-09', '#FF7F50', NULL, NULL);
INSERT INTO `leaves` VALUES (66, 'การลาคลอดบุตร', 'นายวรวัช ศรีสมบัติ', NULL, NULL, '2023-11-09', '2023-11-11', '#6495ED', NULL, NULL);
INSERT INTO `leaves` VALUES (68, 'test', 'นายฐากูร หมู่มาก', NULL, NULL, '2023-11-20', '2023-11-25', '#9FE2BF', NULL, NULL);
INSERT INTO `leaves` VALUES (69, 'การลาป่วย', 'น.ส.สุภารัตน์ ศรีลาชัย', NULL, NULL, '2023-11-07', '2023-11-08', '#CCCCFF', NULL, NULL);
INSERT INTO `leaves` VALUES (70, 'การลาเข้ารับการตรวจเลือกหรือเข้ารับการเตรียมพล', 'นายกล้าณรงค์ ศรียันต์', NULL, NULL, '2023-11-07', '2023-11-08', '#0000FF', NULL, NULL);
INSERT INTO `leaves` VALUES (71, 'เลือก', 'นายธนัฐ สารีบุตร', NULL, NULL, '2023-11-13', '2023-11-16', '#40E0D0', NULL, NULL);
INSERT INTO `leaves` VALUES (73, 'เลือก', 'เลือก', NULL, NULL, '2023-11-27', '2023-11-30', '', NULL, NULL);
INSERT INTO `leaves` VALUES (76, 'การลาไปช่วยเหลือภริยาที่คลอดบุตร', 'เลือก', NULL, NULL, '2023-11-23', '2023-11-24', '', NULL, NULL);
INSERT INTO `leaves` VALUES (77, 'การลาไปช่วยเหลือภริยาที่คลอดบุตร', 'นายเกียรติศักดิ์ ถนอม', NULL, NULL, '2023-11-23', '2023-11-24', '#FFBF00', NULL, NULL);
INSERT INTO `leaves` VALUES (78, 'การลาคลอดบุตร', 'นายวรวัช ศรีสมบัติ', NULL, NULL, '2023-12-06', '2023-12-07', '#6495ED', NULL, NULL);
INSERT INTO `leaves` VALUES (79, 'การลาคลอดบุตร', 'นายเรวัต สุขดี', NULL, NULL, '2023-11-02', '2023-11-03', '#800080', NULL, NULL);
INSERT INTO `leaves` VALUES (82, 'การลาไปช่วยเหลือภริยาที่คลอดบุตร', 'นายธนัฐ สารีบุตร', NULL, NULL, '2023-11-16', '2023-11-17', '#40E0D0', NULL, NULL);
INSERT INTO `leaves` VALUES (84, 'การลากิจส่วนตัว', 'นายเกียรติศักดิ์ ถนอม', NULL, NULL, '2023-11-29', '2023-12-01', '#FFBF00', NULL, NULL);
INSERT INTO `leaves` VALUES (85, 'การลาเข้ารับการตรวจเลือกหรือเข้ารับการเตรียมพล', 'นายช่วงโชติ จันทร์ทอง', NULL, NULL, '2023-12-07', '2023-12-10', '#FF0000', NULL, NULL);
INSERT INTO `leaves` VALUES (90, 'การลากิจส่วนตัว', 'นายฐากูร หมู่มาก', NULL, NULL, '2023-11-24', '2023-11-25', '#9FE2BF', NULL, NULL);
INSERT INTO `leaves` VALUES (93, 'การลาป่วย', 'นายฐากูร หมู่มาก', NULL, NULL, '2023-11-03', '2023-11-03', '#9FE2BF', NULL, NULL);
INSERT INTO `leaves` VALUES (94, 'การลาพักผ่อน', 'นายธนัฐ สารีบุตร', NULL, NULL, '2023-11-04', '2023-11-04', '#40E0D0', NULL, NULL);
INSERT INTO `leaves` VALUES (96, 'การลาป่วย', 'นายกล้าณรงค์ ศรียันต์', NULL, NULL, '2023-11-03', '2023-11-03', '#0000FF', NULL, NULL);
INSERT INTO `leaves` VALUES (97, 'การลาอุปสมบทหรือการลาไปประกอบพิธีฮัจย์', 'น.ส.นันทิยา เทพแสง', NULL, NULL, '2023-11-07', '2023-11-07', '#FF7F50', NULL, NULL);
INSERT INTO `leaves` VALUES (98, 'การลาพักผ่อน', 'นายสมพร  มาดี', NULL, NULL, '2023-11-22', '2023-12-06', '#008080', NULL, NULL);
INSERT INTO `leaves` VALUES (99, 'การลาพักผ่อน', 'น.ส.นันทิยา เทพแสง', NULL, NULL, '2023-11-03', '2023-11-04', '#FF7F50', NULL, NULL);
INSERT INTO `leaves` VALUES (100, 'การลาป่วย', 'น.ส.นันทิยา เทพแสง', NULL, NULL, '1970-01-01', '1970-01-01', '#FF7F50', NULL, NULL);
INSERT INTO `leaves` VALUES (101, 'การลาไปช่วยเหลือภริยาที่คลอดบุตร', 'นายวรวัช ศรีสมบัติ', NULL, NULL, '1970-01-01', '1970-01-01', '#6495ED', NULL, NULL);
INSERT INTO `leaves` VALUES (102, 'การลาไปปฏิบัติงานในองค์การระหว่างประเทศ', 'นายฐากูร หมู่มาก', NULL, NULL, '2023-11-17', '2023-11-17', '#9FE2BF', NULL, NULL);
INSERT INTO `leaves` VALUES (103, 'การลาพักผ่อน', 'นายเกียรติศักดิ์ ถนอม', NULL, NULL, '2023-11-01', '2024-04-02', '#FFBF00', NULL, NULL);

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department`  (
  `depart_id` int NOT NULL AUTO_INCREMENT,
  `depart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `main_dep` int NOT NULL,
  `main_dep_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`depart_id`) USING BTREE,
  INDEX `depart_id`(`depart_id` ASC) USING BTREE,
  INDEX `dcode`(`dcode` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES (1, 'องค์กรแพทย์', 5, 'กลุ่มงานการแพทย์  ', 'MED');
INSERT INTO `tb_department` VALUES (2, 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', 1, 'กลุ่มงานบริหารทั่วไป', 'MAN');
INSERT INTO `tb_department` VALUES (3, 'บริหารงานฯ-การเงิน', 1, 'กลุ่มงานบริหารทั่วไป', 'ACC');
INSERT INTO `tb_department` VALUES (4, 'งานพัสดุ-จัดซื้อ', 1, 'กลุ่มงานบริหารทั่วไป', 'ASS');
INSERT INTO `tb_department` VALUES (5, 'งานสารสนเทศทางการแพทย์', 9, 'กลุ่มงานประกันสุขภาพ  ยุทธศาสตร์และสารสนเทศทางการแพทย์  ', 'MIS');
INSERT INTO `tb_department` VALUES (6, 'งานประกันสุขภาพและยุทธศาสตร์', 9, 'กลุ่มงานประกันสุขภาพ  ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'INS');
INSERT INTO `tb_department` VALUES (7, 'งานการพยาบาล', 11, 'กลุ่มงานการพยาบาล', 'NUR');
INSERT INTO `tb_department` VALUES (8, 'สุขภิบาลและป้องกันโรค ', 10, 'กลุ่มงานบริการปฐมภูมิและองค์รวม ', 'SAN');
INSERT INTO `tb_department` VALUES (9, 'ส่งเสริมสุขภาพ', 10, 'กลุ่มงานบริการปฐมภูมิและองค์รวม ', 'CHN');
INSERT INTO `tb_department` VALUES (10, 'เภสัชกรรม', 4, 'กลุ่มเภสัชกรรมและคุ้มครองผู้บริโภค ', 'PHA');
INSERT INTO `tb_department` VALUES (11, 'ทันตกรรม', 3, 'กลุ่มงานทันตกรรม', 'DEN');
INSERT INTO `tb_department` VALUES (12, 'อุบัติเหตุ-ฉุกเฉิน', 11, 'กลุ่มงานการพยาบาล  ', 'EMR');
INSERT INTO `tb_department` VALUES (13, 'ผู้ป่วยนอก', 11, 'กลุ่มงานการพยาบาล  ', 'OPD');
INSERT INTO `tb_department` VALUES (14, 'รังสีการแพทย์', 7, 'กลุ่มงานรังสีวิทยา', 'RAD');
INSERT INTO `tb_department` VALUES (15, 'เวชสถติและงานข้อมูล ', 9, 'กลุ่มงานประกันสุขภาพ  ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'MDR');
INSERT INTO `tb_department` VALUES (16, 'ห้องบัตร', 9, 'กลุ่มงานประกันสุขภาพ  ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'MRL');
INSERT INTO `tb_department` VALUES (17, 'ศูนย์คุณภาพ', 14, 'ทีมนำ', 'QMC');
INSERT INTO `tb_department` VALUES (19, 'คณะกรรมการป้องกันและควบคุมการติดเชื้อ', 14, 'ทีมนำ', 'ICC');
INSERT INTO `tb_department` VALUES (20, 'แพทย์แผนไทย', 12, 'กลุ่มงานงานแพทย์แผนไทยและการแพทย์ทางเลือก', 'TTM');
INSERT INTO `tb_department` VALUES (21, 'กายภาพบำบัด', 8, 'กลุ่มงานเวชกรรมฟื้นฟู ', 'PTH');
INSERT INTO `tb_department` VALUES (22, 'ห้องคลอด', 11, 'กลุ่มงานการพยาบาล ', 'OBS');
INSERT INTO `tb_department` VALUES (23, 'เทคนิคการแพทย์', 2, 'กลุ่มงานเทคนิคการแพทย์ ', 'LAB');
INSERT INTO `tb_department` VALUES (24, 'ผ่าตัดและวิสัญญี', 11, 'กลุ่มงานการพยาบาล ', 'OPR');
INSERT INTO `tb_department` VALUES (25, 'ศูนย์ดูแลต่อเนื่องที่บ้าน', 10, 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'COC');
INSERT INTO `tb_department` VALUES (26, 'งานการพยาบาลผู้ป่วยในชาย', 11, 'กลุ่มงานการพยาบาล ', 'IPM');
INSERT INTO `tb_department` VALUES (27, 'งานการพยาบาลผู้ป่วยในเด็ก', 11, 'กลุ่มงานการพยาบาล ', 'IPC');
INSERT INTO `tb_department` VALUES (28, 'งานการพยาบาลผู้ป่วยในหญิง', 11, 'กลุ่มงานการพยาบาล ', 'IPW');
INSERT INTO `tb_department` VALUES (29, 'งานการพยาบาลผู้ป่วยหนัก', 11, 'กลุ่มงานการพยาบาล ', 'ICU');
INSERT INTO `tb_department` VALUES (30, 'งานการพยาบาลผู้ป่วยในศัลยกรรม', 11, 'กลุ่มงานการพยาบาล ', 'IPS');
INSERT INTO `tb_department` VALUES (31, 'คลีนิกพิเศษ-NCD', 11, 'กลุ่มงานการพยาบาล ', 'NCD');
INSERT INTO `tb_department` VALUES (32, 'โภชนศาสตร์', 6, 'กลุ่มงานโภชนศาสตร์', 'NUT');
INSERT INTO `tb_department` VALUES (33, 'จ่ายกลาง/ซักฟอก', 11, 'กลุ่มงานการพยาบาล ', 'SUP');
INSERT INTO `tb_department` VALUES (34, 'ซ่อมบำรุง', 1, 'กลุ่มงานบริหารทั่วไป', 'SER');
INSERT INTO `tb_department` VALUES (35, 'งานยานพาหนะ', 1, 'กลุ่มงานบริหารทั่วไป', 'TRN');
INSERT INTO `tb_department` VALUES (36, 'งานคุ้มครองผู้บริโภค', 4, 'กลุ่มเภสัชกรรมและคุ้มครองผู้บริโภค ', 'CON');
INSERT INTO `tb_department` VALUES (37, 'ศูนย์สุขภาพชุมชนห้วยเหนือ', 10, 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'CMU');
INSERT INTO `tb_department` VALUES (38, 'คณะกรรมการบริหารความเสี่ยง', 11, 'กลุ่มงานการพยาบาล ', 'RMT');
INSERT INTO `tb_department` VALUES (39, 'จิตเวชและยาเสพติด', 13, 'กลุ่มงานยาเสพติดและจิตเวช', 'DRU');
INSERT INTO `tb_department` VALUES (40, 'งานโสตทัศนศึกษา ', 1, 'กลุ่มงานบริหารทั่วไป', 'AVE');
INSERT INTO `tb_department` VALUES (41, 'คณะกรรมการสิ่งแวดล้อมและความปลอดภัย', 14, 'ทีมนำ', 'ENV');
INSERT INTO `tb_department` VALUES (42, 'คณะกรรมการความปลอดภัยด้านยา', 14, 'ทีมนำ', 'PTC');
INSERT INTO `tb_department` VALUES (43, 'คณะกรรมการการเงินการคลัง', 14, 'ทีมนำ', 'CFO');
INSERT INTO `tb_department` VALUES (44, 'คณะกรรมการพัฒนาบุคลากร', 14, 'ทีมนำ', 'HRD');
INSERT INTO `tb_department` VALUES (45, 'คณะกรรมการลูกค้าสัมพันธ์', 14, 'ทีมนำ', 'CRT');
INSERT INTO `tb_department` VALUES (46, 'ทีมดูแลและพัฒนากระบวนการการดูแลผู้ป่วยอายุรกรรม', 14, 'ทีมนำ', 'MED');
INSERT INTO `tb_department` VALUES (47, 'ทีมดูแลและพัฒนากระบวนการการดูแลผู้ป่วยกุมารเวชกรรม', 14, 'ทีมนำ', 'PED');
INSERT INTO `tb_department` VALUES (48, 'ทีมดูแลและพัฒนากระบวนการการดูแลผู้ป่วยสูติกรรม', 14, 'ทีมนำ', 'OBS');
INSERT INTO `tb_department` VALUES (49, 'ทีมดูแลและพัฒนากระบวนการการดูแลผู้ป่วยศัลยกรรม', 14, 'ทีมนำ', 'SUR');
INSERT INTO `tb_department` VALUES (50, 'คณะกรรมการโรคและภัยสุขภาพและงานชุมชน', 14, 'ทีมนำ', 'PHC');
INSERT INTO `tb_department` VALUES (51, 'คณะกรรมการสารสนเทศ', 14, 'ทีมนำ', 'IMT');

-- ----------------------------
-- Table structure for tb_events
-- ----------------------------
DROP TABLE IF EXISTS `tb_events`;
CREATE TABLE `tb_events`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start` date NULL DEFAULT NULL,
  `end` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_events
-- ----------------------------
INSERT INTO `tb_events` VALUES (5, 'dsdsfs', '2020-10-23', '2020-10-24');
INSERT INTO `tb_events` VALUES (6, 'sdsdfd', '2020-10-28', '2020-10-29');
INSERT INTO `tb_events` VALUES (7, 'sdsd', '2020-10-25', '2020-10-26');
INSERT INTO `tb_events` VALUES (9, 'fredrick BirthDay', '2020-10-08', '2020-10-09');
INSERT INTO `tb_events` VALUES (10, 'test', '2023-10-24', '2023-10-26');
INSERT INTO `tb_events` VALUES (11, 'test', '2023-10-25', '2023-10-27');
INSERT INTO `tb_events` VALUES (12, 'test2', '2023-10-26', '2023-10-29');
INSERT INTO `tb_events` VALUES (13, 'test', '2023-10-25', '2023-10-27');
INSERT INTO `tb_events` VALUES (14, 'test2', '2023-11-02', '2023-11-04');
INSERT INTO `tb_events` VALUES (15, 'iiii', '2023-10-10', '2023-10-13');
INSERT INTO `tb_events` VALUES (16, 'ooo', '2023-10-10', '2023-10-12');

-- ----------------------------
-- Table structure for tb_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `team` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  `lastlog` varchar(255) CHARACTER SET tis620 COLLATE tis620_thai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = tis620 COLLATE = tis620_thai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_member
-- ----------------------------
INSERT INTO `tb_member` VALUES (1, 'admin', 'admin123', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_depart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 407 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES (1, 'นางธัญรัศมิ์  เกตุวงษา', 'จพ.การเงินและบัญชี', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '1');
INSERT INTO `tb_users` VALUES (2, 'นางพวงผกา  บุตะเคียน', 'นักวิชาการพัสดุ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '2');
INSERT INTO `tb_users` VALUES (3, 'นางสาวกรวรรณ  ลอทอง', 'พนักงานธุรการ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '3');
INSERT INTO `tb_users` VALUES (4, 'นายประเทือง  ศรีลาชัย', 'พนักงานเกษตรพื้นฐาน', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '4');
INSERT INTO `tb_users` VALUES (5, 'นายธนกร  ชื่นจิตร', 'พนักงานเกษตรพื้นฐาน', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '5');
INSERT INTO `tb_users` VALUES (6, 'นายเกษมศักดิ์  สถานพงษ์', 'พนักงานเกษตรพื้นฐาน', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '6');
INSERT INTO `tb_users` VALUES (7, 'นายบรรดิษฐ  เชิญรัมย์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '7');
INSERT INTO `tb_users` VALUES (8, 'นายสมบัติ  อ่อนคำ', 'พนักงานเกษตรพื้นฐาน', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '8');
INSERT INTO `tb_users` VALUES (9, 'นายสมจิตร  มากนวน', 'พนักงานเกษตรพื้นฐาน', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานธุรการ/งานการเจ้าหน้าที่/งานอาคารสถานที่', '9');
INSERT INTO `tb_users` VALUES (10, 'นางภัทราพร  อนุสรณ์', 'จพ.การเงินและบัญชี', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานบริหารทั่วไป', 'งานการเงินและบัญชี', '10');
INSERT INTO `tb_users` VALUES (11, 'นางสาวนิภาพร  พันธ์งาม', 'นวก.การเงินและบัญชี', '-', 'พรก.', 'กลุ่มงานบริหารทั่วไป', 'งานการเงินและบัญชี', '11');
INSERT INTO `tb_users` VALUES (12, 'นางสาวนลวรรณ  ปัญหา', 'นวก.การเงินและบัญชี', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานการเงินและบัญชี', '12');
INSERT INTO `tb_users` VALUES (13, 'นางสาวสุพรรษา  บุญนะรา', 'พนักงานการเงินและบัญชี', '-', 'ลจช.รายวัน', 'กลุ่มงานบริหารทั่วไป', 'งานการเงินและบัญชี', '13');
INSERT INTO `tb_users` VALUES (14, 'นางสาวกานทิตา  ภูมิดอนชัย', 'จพ.การเงินและบัญชี', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานการเงินและบัญชี', '14');
INSERT INTO `tb_users` VALUES (15, 'นางสาวธีร์ชญาน์  วงษ์ขันธ์', 'นักจัดการงานทั่วไป', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '15');
INSERT INTO `tb_users` VALUES (16, 'นายณัฐนันท์  คนยืน', 'เจ้าพนักงานพัสดุ', '-', 'พรก.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '16');
INSERT INTO `tb_users` VALUES (17, 'นายพิทักษ์  บุญใบ', 'เจ้าพนักงานธุรการ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '17');
INSERT INTO `tb_users` VALUES (18, 'นางสาวลลิตา  ขวาน้ำคำ', 'เจ้าพนักงานธุรการ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '18');
INSERT INTO `tb_users` VALUES (19, 'นางสาวกนกวรรณ  วงษ์วาน', 'พนักงานพัสดุ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '19');
INSERT INTO `tb_users` VALUES (20, 'นายทินกร  พัฒโท', 'ช่างไฟฟ้าและเทคนิคทรอนิกส์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '20');
INSERT INTO `tb_users` VALUES (21, 'นายเอียม  ดวงอินทร์', 'ช่างไฟฟ้าและเทคนิคทรอนิกส์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '21');
INSERT INTO `tb_users` VALUES (22, 'นายสิทธิพงษ์  ยงกุล', 'ช่างไฟฟ้าและเทคนิคทรอนิกส์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '22');
INSERT INTO `tb_users` VALUES (23, 'นายณัฏฐชัย  มโนมัย', 'ช่างไฟฟ้าและเทคนิคทรอนิกส์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '23');
INSERT INTO `tb_users` VALUES (24, 'นายชัยญา  ผาธรรม', 'พนักงานเกษตรพื้นฐาน', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '24');
INSERT INTO `tb_users` VALUES (25, 'นายสุทิต  พิมาไทย', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานพัสดุ/ซ่อมบำรุง', '25');
INSERT INTO `tb_users` VALUES (26, 'นายอรรฆพล  แสงคำ', 'จพ.โสตทัศนศึกษา', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานโสตทัศนศึกษา', '26');
INSERT INTO `tb_users` VALUES (27, 'นางสาวพิชญ์สินี  สอนหอม', 'จพ.โสตทัศนศึกษา', '-', 'ลจช.', 'กลุ่มงานบริหารทั่วไป', 'งานโสตทัศนศึกษา', '27');
INSERT INTO `tb_users` VALUES (28, 'นายณรงค์ฤทธิ์  ดัชถุยาวัตร', 'ช่างศิลป์', NULL, 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานโสตทัศนศึกษา', '28');
INSERT INTO `tb_users` VALUES (29, 'นายพิพัฒน์  ปัญญาวชิรากุล', 'พนักงานขับรถยนต์', NULL, 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '29');
INSERT INTO `tb_users` VALUES (30, 'นายอุทัย  ขันคูณ', 'พนักงานขับรถยนต์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '30');
INSERT INTO `tb_users` VALUES (31, 'นายศุภรานนท์  บุญขาว', 'พนักงานขับรถยนต์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '31');
INSERT INTO `tb_users` VALUES (32, 'นายธนูศร  บุญจูง', 'พนักงานขับรถยนต์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '32');
INSERT INTO `tb_users` VALUES (33, 'นายบุญรัก  สีหะวงษ์', 'พนักงานขับรถยนต์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '33');
INSERT INTO `tb_users` VALUES (34, 'นายพีรศักดิ์  พิมโคตร', 'พนักงานขับรถยนต์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '34');
INSERT INTO `tb_users` VALUES (35, 'นายวิลัย  นรสิงห์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '35');
INSERT INTO `tb_users` VALUES (36, 'นายประดิษฐ  ชนะวงษา', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '36');
INSERT INTO `tb_users` VALUES (37, 'นายนิวัฒนะ  ไตรยสุทธิ์', 'พนักงานขับรถยนต์', '-', 'พกส.', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '37');
INSERT INTO `tb_users` VALUES (38, 'นายสุวัฒชัย  ไชยหงษ์', 'พนักงานขับรถยนต์', '-', 'ลจช.รายวัน', 'กลุ่มงานบริหารทั่วไป', 'งานยานพาหนะ', '38');
INSERT INTO `tb_users` VALUES (39, 'นายยุทธนา  อินทนนท์', 'นักเทคนิคการแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '39');
INSERT INTO `tb_users` VALUES (40, 'นางกฤษตยา  จันทร์เทศ', 'จพ.วิทยาศาสตร์การแพทย์', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '40');
INSERT INTO `tb_users` VALUES (41, 'นางธันยพร  คนยืน', 'นักเทคนิคการแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '41');
INSERT INTO `tb_users` VALUES (42, 'นางสุภัทรา  สีสมบา', 'นักเทคนิคการแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '42');
INSERT INTO `tb_users` VALUES (43, 'นางสาวสินีนาถ  แสงงาม', 'นักเทคนิคการแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '43');
INSERT INTO `tb_users` VALUES (44, 'นางสาวปนัยดา  แก้วเกล้า', 'นักเทคนิคการแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '44');
INSERT INTO `tb_users` VALUES (45, 'นางปัญญาพร  แสงบุญ', 'นักเทคนิคการแพทย์', '-', 'พกส.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '45');
INSERT INTO `tb_users` VALUES (46, 'นางพัชรินทร์  สุนทร', 'นักเทคนิคการแพทย์', '-', 'ลจช.รายวัน', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '46');
INSERT INTO `tb_users` VALUES (47, 'นายอนุวัฒน์  อินทนนท์', 'พนักงานห้องชันสูตร', '-', 'พกส.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '47');
INSERT INTO `tb_users` VALUES (48, 'นายชยพล  ใจโปร์', 'พนักงานประจำห้องทดลอง', '-', 'พกส.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '48');
INSERT INTO `tb_users` VALUES (49, 'นางสาวชุดาวรรณ  สาระภูมิ', 'พนักงานประจำห้องทดลอง', '-', 'ลจช.', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '49');
INSERT INTO `tb_users` VALUES (50, 'นายกธาวุฒิ  ยืนนาน', 'พนักงานประจำห้องทดลอง', '-', 'ลจช.รายวัน', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '50');
INSERT INTO `tb_users` VALUES (51, 'นางสาวนลินี  กระโพธิ์', 'พนักงานประจำห้องทดลอง', '-', 'ลจช.รายวัน', 'กลุ่มงานเทคนิคการแพทย์', 'งานเทคนิคการแพทย์', '51');
INSERT INTO `tb_users` VALUES (52, 'นางเสาวนีย์  บุพตา', 'ทันตแพทย์', 'ชำนาญการพิเศษ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '52');
INSERT INTO `tb_users` VALUES (53, 'นายชินพัทธ์  ธนกาญจน์', 'ทันตแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '53');
INSERT INTO `tb_users` VALUES (54, 'นางสาวอัณณ์ศรา  ชิณโชติ', 'ทันตแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '54');
INSERT INTO `tb_users` VALUES (55, 'นายแทนพร  เลิศวงศ์ไพศาล', 'ทันตแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '55');
INSERT INTO `tb_users` VALUES (56, 'นางสาวปฐมาวดี  บุญตระการ', 'ทันตแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '56');
INSERT INTO `tb_users` VALUES (57, 'นางสาววรางคณา  แสนสุข', 'ทันตแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '57');
INSERT INTO `tb_users` VALUES (58, 'นางสาวณัฐฐิตชา  วิริยะวงศ์', 'ทันตแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '58');
INSERT INTO `tb_users` VALUES (59, 'นายพชร  อินทรการุณเวช', 'ทันตแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '59');
INSERT INTO `tb_users` VALUES (60, 'นายศุภวรรษ  จันทนะ', 'ทันตแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '60');
INSERT INTO `tb_users` VALUES (61, 'นางรัชกร  วารินทร์', 'จพ.ทันตสาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '61');
INSERT INTO `tb_users` VALUES (62, 'นางประยูรวรรณ  คัมภิรา', 'จพ.ทันตสาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '62');
INSERT INTO `tb_users` VALUES (63, 'นายจีระวัฒน์  มาลี', 'จพ.ทันตสาธารณสุข', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '63');
INSERT INTO `tb_users` VALUES (64, 'นางสาวชญานุตม์  รวมจิตร', 'นวก.สาธารณสุข', '-', 'พกส.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '64');
INSERT INTO `tb_users` VALUES (65, 'นายสมาน  เพ็ชล้วน', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '65');
INSERT INTO `tb_users` VALUES (66, 'นายกฤษดา  สถานพงษ์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '66');
INSERT INTO `tb_users` VALUES (67, 'นายทรงชัย  การะเกด', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '67');
INSERT INTO `tb_users` VALUES (68, 'นายประพันธ์  ใจสุระ', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '68');
INSERT INTO `tb_users` VALUES (69, 'นายคมกฤษ  พงษ์สุวรรณ', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '69');
INSERT INTO `tb_users` VALUES (70, 'นางสาวจิราภรณ์  บุญขาว', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '70');
INSERT INTO `tb_users` VALUES (71, 'นายหัสชัย  พลภักดี', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '71');
INSERT INTO `tb_users` VALUES (72, 'นางสว่าง  ศรีลาชัย', 'พนักงานทำความสะอาด', '-', 'ลจช.รายวัน', 'กลุ่มงานทันตกรรม', 'งานทันตกรรม', '72');
INSERT INTO `tb_users` VALUES (73, 'นายนพพร  สุทธิพันธ์', 'เภสัชกร', 'ชำนาญการพิเศษ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '73');
INSERT INTO `tb_users` VALUES (74, 'นายเด่นชัย  ดอกพอง', 'เภสัชกร', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '74');
INSERT INTO `tb_users` VALUES (75, 'นางสาวกัลยา  วงศ์วาน', 'เภสัชกร', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '75');
INSERT INTO `tb_users` VALUES (76, 'นางสาวสุปราณี  สุวันที', 'เภสัชกร', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '76');
INSERT INTO `tb_users` VALUES (77, 'นางสาวมาลัย  ศิลารัตน์', 'เภสัชกร', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '77');
INSERT INTO `tb_users` VALUES (78, 'นางมัติกาญจน์  ธนกาญจน์', 'เภสัชกร', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '78');
INSERT INTO `tb_users` VALUES (79, 'นางสาวนพมาศ  รัตนพันธ์', 'เภสัชกร', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '79');
INSERT INTO `tb_users` VALUES (80, 'นายรณชัย  ชมเมือง', 'เภสัชกร', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '80');
INSERT INTO `tb_users` VALUES (81, 'นางพิชญาภา  นวลสาย', 'เภสัชกร', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '81');
INSERT INTO `tb_users` VALUES (82, 'นายธัญรักษ์  ปู่เมือง', 'เภสัชกร', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '82');
INSERT INTO `tb_users` VALUES (83, 'นางสาวกัญญณัช  หอมคำ', 'เภสัชกร', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '83');
INSERT INTO `tb_users` VALUES (84, 'นายวรากร  วงษ์ขันธ์', 'เภสัชกร', '-', 'พรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '84');
INSERT INTO `tb_users` VALUES (85, 'นางวิภานันท์  ทันวัน', 'เจ้าพนักงานเภสัชกรรม', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '85');
INSERT INTO `tb_users` VALUES (86, 'นางสาวสายใจ  ศาลาสุข', 'เจ้าพนักงานเภสัชกรรม', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '86');
INSERT INTO `tb_users` VALUES (87, 'นางสาวจันทร์สุดา  มะณี', 'เจ้าพนักงานเภสัชกรรม', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '87');
INSERT INTO `tb_users` VALUES (88, 'นางสาวนงค์ลักษ์  เบิกบาน', 'เจ้าพนักงานเภสัชกรรม', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '88');
INSERT INTO `tb_users` VALUES (89, 'นางสาววชิราภรณ์  ตุลยเสวี', 'เจ้าพนักงานเภสัชกรรม', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '89');
INSERT INTO `tb_users` VALUES (90, 'นางรัตนาภรณ์  อภัยสม', 'เจ้าพนักงานเภสัชกรรม', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '90');
INSERT INTO `tb_users` VALUES (91, 'นางสาวกมลเนตร  สว่างภพ', 'เจ้าพนักงานเภสัชกรรม', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '91');
INSERT INTO `tb_users` VALUES (92, 'นางสาวญานีรัตน์  โยธะกา', 'เจ้าพนักงานเภสัชกรรม', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '92');
INSERT INTO `tb_users` VALUES (93, 'นางสาวดารุณี  มูลดับ', 'เจ้าพนักงานเภสัชกรรม', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '93');
INSERT INTO `tb_users` VALUES (94, 'นางสาวพรพิมล  ดวงใจ', 'นวก.สาธารณสุข', '-', 'ลจช.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '94');
INSERT INTO `tb_users` VALUES (95, 'นางวิชุดา  ถนอมศรี', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจป.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '95');
INSERT INTO `tb_users` VALUES (96, 'นายสุเหมือนรัตน์  สุขกาย', 'พนักงานบัตรรายงานโรค', '-', 'พกส.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '96');
INSERT INTO `tb_users` VALUES (97, 'นายเชิดชัย  คงราช', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '97');
INSERT INTO `tb_users` VALUES (98, 'นายไพจิตร  ธรรมบรรเทิง', 'พนักงานประจำห้องยา', '-', 'พกส.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '98');
INSERT INTO `tb_users` VALUES (99, 'นายประพันธ์  ดีใจ', 'พนักงานประจำห้องยา', '-', 'พกส.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '99');
INSERT INTO `tb_users` VALUES (100, 'นางสุนันทา  บุญเลิศ', 'พนักงานประจำห้องยา', '-', 'พกส.', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '100');
INSERT INTO `tb_users` VALUES (101, 'นางสาวบรรจบ  ทองอินทร์', 'พนักงานประจำห้องยา', '-', 'ลจช.รายวัน', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '101');
INSERT INTO `tb_users` VALUES (102, 'นายจักรกริช  ตั้งสกุล', 'พนักงานประจำห้องยา', '-', 'ลจช.รายวัน', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '102');
INSERT INTO `tb_users` VALUES (103, 'นายประวิทย์  เสรีขจรจารุ', 'นายแพทย์(ผู้อำนวยการ)', 'เชี่ยวชาญ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '103');
INSERT INTO `tb_users` VALUES (104, 'นางชโยมนต์  ดอกพอง', 'นายแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '104');
INSERT INTO `tb_users` VALUES (105, 'นางสาววทัศมล  ดวนใหญ่', 'นายแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '105');
INSERT INTO `tb_users` VALUES (106, 'นางสาวประภาพร  ศรีชัยบาล', 'นายแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '106');
INSERT INTO `tb_users` VALUES (107, 'นายทรงวิทย์  อินธิปัญญา', 'นายแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '107');
INSERT INTO `tb_users` VALUES (108, 'นายชยานันท์  เชาวนวรกุล', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '108');
INSERT INTO `tb_users` VALUES (109, 'นางสาววิรดา  พงษ์ศิริรัชกุล', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '109');
INSERT INTO `tb_users` VALUES (110, 'นางสาวภูมิสิริ  ชุณหอังกูรเวช', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '110');
INSERT INTO `tb_users` VALUES (111, 'นายจิรทีปต์  อารีย์', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '111');
INSERT INTO `tb_users` VALUES (112, 'นายวัชรพงษ์  เมืองหงษ์', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '112');
INSERT INTO `tb_users` VALUES (113, 'นายสนั่น  เตชะเฉลิมชัยวัมน์', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '113');
INSERT INTO `tb_users` VALUES (114, 'นายศรุต  โกมลกิตติวัฒนา', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '114');
INSERT INTO `tb_users` VALUES (115, 'นายธิติวัฒน์  ประเสริฐกุลไชย', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '115');
INSERT INTO `tb_users` VALUES (116, 'นายอภิรักษ์  วงกตธนภูมิ', 'นายแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการแพทย์', 'งานการแพทย์', '116');
INSERT INTO `tb_users` VALUES (117, 'นางพัชรา  วงศ์หมั้น', 'โภชนากร', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '117');
INSERT INTO `tb_users` VALUES (118, 'นายภราดร  ประชุมฉลาด', 'โภชนากร', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '118');
INSERT INTO `tb_users` VALUES (119, 'นางอุไร  อัมลา', 'พนักงานประกอบอาหาร', '-', 'พกส.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '119');
INSERT INTO `tb_users` VALUES (120, 'นางรัชนี  ปารมี', 'พนักงานประกอบอาหาร', '-', 'พกส.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '120');
INSERT INTO `tb_users` VALUES (121, 'นางสาวนิจิตรา  กตัญญุตาวงศ์', 'พนักงานประกอบอาหาร', '-', 'พกส.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '121');
INSERT INTO `tb_users` VALUES (122, 'นางสาวนิยม  รสหอม', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '122');
INSERT INTO `tb_users` VALUES (123, 'นางสาวสุภาพร  มากนวล', 'พนักงานประกอบอาหาร', '-', 'พกส.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '123');
INSERT INTO `tb_users` VALUES (124, 'นางสาวธิดารัตน์  บุตะเคียน', 'พนักงานประกอบอาหาร', '-', 'พกส.', 'กลุ่มงานโภชนศาสตร์', 'งานโภชนศาสตร์', '124');
INSERT INTO `tb_users` VALUES (125, 'นายสุริยันต์  ไพเตี้ย', 'นักรังสีการแพทย์', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานรังสีวิทยา', 'งานรังสีวิทยา', '125');
INSERT INTO `tb_users` VALUES (126, 'นางสาวนิตยา  อินตะนัย', 'นักรังสีการแพทย์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานรังสีวิทยา', 'งานรังสีวิทยา', '126');
INSERT INTO `tb_users` VALUES (127, 'นายครรชิต  สายแก้ว', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานรังสีวิทยา', 'งานรังสีวิทยา', '127');
INSERT INTO `tb_users` VALUES (128, 'นายนรากรณ์  ปัญญา', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานรังสีวิทยา', 'งานรังสีวิทยา', '128');
INSERT INTO `tb_users` VALUES (129, 'นางสาวสุธาสินี  สืบสนธ์', 'นักกายภาพบำบัด', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานเวชกรรมฟื้นฟู', 'งานเวชกรรมฟื้นฟู', '129');
INSERT INTO `tb_users` VALUES (130, 'นายธนินท์รัฐ  บุญใส', 'นักกายภาพบำบัด', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเวชกรรมฟื้นฟู', 'งานเวชกรรมฟื้นฟู', '130');
INSERT INTO `tb_users` VALUES (131, 'นางสาวณิชกานต์  ศุขแจ้ง', 'นักกายภาพบำบัด', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานเวชกรรมฟื้นฟู', 'งานเวชกรรมฟื้นฟู', '131');
INSERT INTO `tb_users` VALUES (132, 'นางสาวณภัทรชา  กุลวงษ์', 'พนักงานช่วยการพยาบาล', '-', 'พกส.', 'กลุ่มงานเวชกรรมฟื้นฟู', 'งานเวชกรรมฟื้นฟู', '132');
INSERT INTO `tb_users` VALUES (133, 'นายสนั่น  เทียนทอง', 'นวก.สาธารณสุข', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '133');
INSERT INTO `tb_users` VALUES (134, 'นางสาวนันทิยา  เทพแสง', 'จพ.เวชสถิติ', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '134');
INSERT INTO `tb_users` VALUES (135, 'นางสาววรัญช์ธิตา  จิรสิริโภคิน', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '135');
INSERT INTO `tb_users` VALUES (136, 'นายชญาธนุส  เซี้ยมกั้ง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '136');
INSERT INTO `tb_users` VALUES (137, 'นางสาวรสสุคนธ์  รัตนกำพล', 'นกว.สาธารณสุข', '-', 'ลจช.รายวัน', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '137');
INSERT INTO `tb_users` VALUES (138, 'นางสาวกมลญาณินี  จันทร์สว่าง', 'จพ.ธุรการ', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '138');
INSERT INTO `tb_users` VALUES (139, 'นางสาวสุภารัตน์  ศรีลาชัย', 'พนักงานธุรการ', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานประกันสุขภาพและยุทธศาสตร์', '139');
INSERT INTO `tb_users` VALUES (140, 'นายช่วงโชติ  จันทร์ทอง', 'จพ.เวชสถิติ', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '140');
INSERT INTO `tb_users` VALUES (141, 'นางสาวพิชญา  สุตะพันธ์', 'จพ.เวชระเบียน', '-', 'ลจช.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '141');
INSERT INTO `tb_users` VALUES (142, 'นายกล้าณรงค์  ศรียันต์', 'นวก.สาธารณสุข', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '142');
INSERT INTO `tb_users` VALUES (143, 'นางอนุชฑิตา  ศรีมงคล', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจป.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '143');
INSERT INTO `tb_users` VALUES (144, 'นายคงฤทธิ์  ผาสุข', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '144');
INSERT INTO `tb_users` VALUES (145, 'นายจักรพนธ์  อำพันธ์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '145');
INSERT INTO `tb_users` VALUES (146, 'นายสนั่น  คำมั่น', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '146');
INSERT INTO `tb_users` VALUES (147, 'นายศักดิ์ดา  กุลวงษ์', 'พนักงานเปล', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานเวชสถิติและข้อมูล', '147');
INSERT INTO `tb_users` VALUES (148, 'นายธนัฐ  สารีบุตร', 'นวก.คอมพิวเตอร์', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานสารสนเทศทางการแพทย์', '148');
INSERT INTO `tb_users` VALUES (149, 'นายเรวัต  สุขดี', 'นวก.คอมพิวเตอร์', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานสารสนเทศทางการแพทย์', '149');
INSERT INTO `tb_users` VALUES (150, 'นายฐากูร  หมู่มาก', 'นวก.คอมพิวเตอร์', '-', 'ลจช.รายวัน', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานสารสนเทศทางการแพทย์', '150');
INSERT INTO `tb_users` VALUES (151, 'นายวรวัช  ศรีสมบัติ', 'จพ.เครื่องคอมพิวเตอร์', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานสารสนเทศทางการแพทย์', '151');
INSERT INTO `tb_users` VALUES (152, 'นายเกียรติศักดิ์  ถนอม', 'จพ.เครื่องคอมพิวเตอร์', '-', 'พกส.', 'กลุ่มงานประกันสุขภาพ ยุทธศาสตร์และสารสนเทศทางการแพทย์', 'งานสารสนเทศทางการแพทย์', '152');
INSERT INTO `tb_users` VALUES (153, 'นางสมจันทร์  บัวเขียว', 'พยาบาลวิชาชีพ', 'ชำนาญการพิเศษ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '153');
INSERT INTO `tb_users` VALUES (154, 'นางกานต์รวี  ศรีวัฒนะเลิศ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '154');
INSERT INTO `tb_users` VALUES (155, 'นางปัณฑารีย์  อุ่มคำ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '155');
INSERT INTO `tb_users` VALUES (156, 'นางลภัสรดา  คันธชาติ', 'จพ.ทันตสาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '156');
INSERT INTO `tb_users` VALUES (157, 'นางสาววิรันตรี  นัยนิตย์', 'เจ้าพนักงานเภสัชกรรม', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '157');
INSERT INTO `tb_users` VALUES (158, 'นางสาวจารุวรรณ  ถนอม', 'นวก.สาธารณสุข', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '158');
INSERT INTO `tb_users` VALUES (159, 'นางสาวศิวพร  พึ่งภพ', 'นวก.สาธารณสุข', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '159');
INSERT INTO `tb_users` VALUES (160, 'นายไพฑูรย์  ธรรมบรรเทิง', 'จพ.สาธารณสุข', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '160');
INSERT INTO `tb_users` VALUES (161, 'นางวิภาวรรณ  สุดแสวง', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '161');
INSERT INTO `tb_users` VALUES (162, 'นางสาวภรณ์ณภัส  ธนพัชทิพบำรุง', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '162');
INSERT INTO `tb_users` VALUES (163, 'นางอรทัย  บุญพิมล', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจป.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '163');
INSERT INTO `tb_users` VALUES (164, 'นายสุภาพ  พลแก้ว', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '164');
INSERT INTO `tb_users` VALUES (165, 'นายสุทธิกรณ์  บุญขาว', 'พนักงานขับรถยนต์', '-', 'ลจช.รายวัน', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '165');
INSERT INTO `tb_users` VALUES (166, 'นายจรูญศักดิ์  บุญขาว', 'พนักงานขับรถยนต์', '-', 'ลจช.รายวัน', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '166');
INSERT INTO `tb_users` VALUES (167, 'นายกฤษณพล  ศรศรี', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '167');
INSERT INTO `tb_users` VALUES (168, 'นายเพชร  กิคำ', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '168');
INSERT INTO `tb_users` VALUES (169, 'นายอัครพงษ์  พรมแย้ม', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์สุขภาพชุมชนเมืองห้วยเหนือ ', '169');
INSERT INTO `tb_users` VALUES (170, 'นางชื่นจิต  ชาญจิตร', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '170');
INSERT INTO `tb_users` VALUES (171, 'นางไขนภา  จันทะหิน', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '171');
INSERT INTO `tb_users` VALUES (172, 'นางวรัญชยา  เดชตระกูล', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '172');
INSERT INTO `tb_users` VALUES (173, 'นางสาวนราธร  ไชยงาม', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '173');
INSERT INTO `tb_users` VALUES (174, 'นางสาวรัชดาภรณ์  ฉิมพินิจ', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '174');
INSERT INTO `tb_users` VALUES (175, 'นางสาวศิรษา  ครบสุวรรณ', 'นวก.สาธารณสุข', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '175');
INSERT INTO `tb_users` VALUES (176, 'นางสาวนงพงา  ดีผิว', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานส่งเสริมสุขภาพ', '176');
INSERT INTO `tb_users` VALUES (177, 'นายณรงค์กฤษฏิ์  พลคำ', 'นวก.สาธารณสุข', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานสุขภิบาลและป้องกันโรค', '177');
INSERT INTO `tb_users` VALUES (178, 'นายสัตยา  หิรัญประเสริฐกุล', 'จพ.สาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานสุขภิบาลและป้องกันโรค', '178');
INSERT INTO `tb_users` VALUES (179, 'นางสาวจิราวรรณ  คำศรี', 'นวก.สาธารณสุข', '-', 'พกส.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานสุขภิบาลและป้องกันโรค', '179');
INSERT INTO `tb_users` VALUES (180, 'นายสืบสิทธิ์  คำแสน', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'งานสุขภิบาลและป้องกันโรค', '180');
INSERT INTO `tb_users` VALUES (181, 'นายแสวงชัย  มีแสง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานบริหารการพยาบาล  ', '181');
INSERT INTO `tb_users` VALUES (182, 'นางกรณ์ณภัสสร์  ศรีสมบัติ', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานบริหารการพยาบาล  ', '182');
INSERT INTO `tb_users` VALUES (183, 'นางสาวนวรัตน์  อุดมหอม', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '183');
INSERT INTO `tb_users` VALUES (184, 'นางสมใจ  ทองมนต์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '184');
INSERT INTO `tb_users` VALUES (185, 'นางเสาวนีย์  ทองผิว', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '185');
INSERT INTO `tb_users` VALUES (186, 'นางสาวเจนเนตร  กฤชทับทอง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '186');
INSERT INTO `tb_users` VALUES (187, 'นางสาวชนกนาถ  คำบุธีรโชติ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '187');
INSERT INTO `tb_users` VALUES (188, 'นางรัตนา  อุตสาหะ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '188');
INSERT INTO `tb_users` VALUES (189, 'นางสาวชนิตร์นันท์  พัฒนาอนุสรณ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '189');
INSERT INTO `tb_users` VALUES (190, 'นางสายชล  บุตรวงศ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '190');
INSERT INTO `tb_users` VALUES (191, 'นางฉัตรนภา  ไกรวิเศษ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '191');
INSERT INTO `tb_users` VALUES (192, 'นางสาวกิตติยา  จินดาวงษ์', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '192');
INSERT INTO `tb_users` VALUES (193, 'นางสาวภิตะวัน  พิมพ์พร', 'พยาบาลวิชาชีพ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '193');
INSERT INTO `tb_users` VALUES (194, 'นางเยี่ยม  ศรีจักร์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '194');
INSERT INTO `tb_users` VALUES (195, 'นางสาวเทพนิมิตร  พลหาญ', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '195');
INSERT INTO `tb_users` VALUES (196, 'นางสาวแสงอรุณ  ศรีพิพัฒน์', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '196');
INSERT INTO `tb_users` VALUES (197, 'นางสาวพัฒน์นรี  จันทิพย์', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '197');
INSERT INTO `tb_users` VALUES (198, 'นางสาวอนุชฑิตา  ทองไสล', 'พนักงานช่วยเหลือคนไข้', NULL, 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '198');
INSERT INTO `tb_users` VALUES (199, 'นายทวี  แพงไธสง', 'พนักงานเปล', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '199');
INSERT INTO `tb_users` VALUES (200, 'นายชาญณุวัตร  พันธุชาติ', 'พนักงานเปล', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '200');
INSERT INTO `tb_users` VALUES (201, 'นายฉัตรถพล  แก้วไสย์', 'พนักงานเปล', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '201');
INSERT INTO `tb_users` VALUES (202, 'นายนพคุณ  เทพแสง', 'พนักงานเปล', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '202');
INSERT INTO `tb_users` VALUES (203, 'นายสมชาย  บุญขาว', 'พนักงานเปล', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '203');
INSERT INTO `tb_users` VALUES (204, 'นายกาญจน์  คำผง', 'พนักงานเปล', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยนอก', '204');
INSERT INTO `tb_users` VALUES (205, 'นางนภาผ่อง  แสนทวีสุข', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '205');
INSERT INTO `tb_users` VALUES (206, 'นางบุญหนา  สว่างภพ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '206');
INSERT INTO `tb_users` VALUES (207, 'นายพงษ์ศักดิ์  วรวิรัช', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '207');
INSERT INTO `tb_users` VALUES (208, 'นางจิราภรณ์  พิมพ์แก้ว', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '208');
INSERT INTO `tb_users` VALUES (209, 'นางอัศวินี  มีแสง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '209');
INSERT INTO `tb_users` VALUES (210, 'นายศรานนท์  วรรณวงษ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '210');
INSERT INTO `tb_users` VALUES (211, 'นางสาวภัทรกานต์  บุญรังศรี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '211');
INSERT INTO `tb_users` VALUES (212, 'นางเพลินจิตร  สิทธิสงค์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '212');
INSERT INTO `tb_users` VALUES (213, 'นางพัทธยา  เอกสุข', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '213');
INSERT INTO `tb_users` VALUES (214, 'นางสาวนัฐทิตา  ดอกพอง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '214');
INSERT INTO `tb_users` VALUES (215, 'นางสาวเปรมจิต  สิงหร', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '215');
INSERT INTO `tb_users` VALUES (216, 'นายวัชรพงษ์  ศรีจักร์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '216');
INSERT INTO `tb_users` VALUES (217, 'นางสมใจ  สุคนธจินดา', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '217');
INSERT INTO `tb_users` VALUES (218, 'นางสาวสุนันทา  อุตมาน', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '218');
INSERT INTO `tb_users` VALUES (219, 'นางดวงนภา  สีหะวงษ์', 'จพ.สาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '219');
INSERT INTO `tb_users` VALUES (220, 'นายเฉลิมชัย  จันทอง', 'จพ.สาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '220');
INSERT INTO `tb_users` VALUES (221, 'นางเมตตา  ใจโปร์', 'จพ.สาธารณสุข', 'ชำนาญงาน', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '221');
INSERT INTO `tb_users` VALUES (222, 'นางสาวพรพิมล  สาระโท', 'จพ.สาธารณสุข', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '222');
INSERT INTO `tb_users` VALUES (223, 'นางสาวสลิลทิพย์  จันทร์โสภา', 'จพ.สาธารณสุข', 'ปฏิบัติงาน', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '223');
INSERT INTO `tb_users` VALUES (224, 'นางสาวสมฤดี  ศรีวรกุล', 'จพ.สาธารณสุข', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '224');
INSERT INTO `tb_users` VALUES (225, 'นายยุทธนา  หิตะชาติ', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '225');
INSERT INTO `tb_users` VALUES (226, 'นายชโยธรณ์  คันธชาติ', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '226');
INSERT INTO `tb_users` VALUES (227, 'นายศาสตรา  สว่างภพ', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '227');
INSERT INTO `tb_users` VALUES (228, 'นายบวรกฤษฏิ์  แก้วกัณหา', 'พนักงานเปล', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '228');
INSERT INTO `tb_users` VALUES (229, 'นางสาวรัตนาภรณ์  เนาวรัตน์', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '229');
INSERT INTO `tb_users` VALUES (230, 'นางโชติยา  ศิลาภา', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '230');
INSERT INTO `tb_users` VALUES (231, 'นางสุนันทา  ศรีกุล', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '231');
INSERT INTO `tb_users` VALUES (232, 'นางสาวศันสนีย์  สตารัตน์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '232');
INSERT INTO `tb_users` VALUES (233, 'นางสาวเสาวภา  ศรีแก้ว', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '233');
INSERT INTO `tb_users` VALUES (234, 'นางสางวิภาพร  เทศขันธ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '234');
INSERT INTO `tb_users` VALUES (235, 'นางสาววิสุธาสินี  เทพแสง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '235');
INSERT INTO `tb_users` VALUES (236, 'นายณรงค์ชัย  คัมภิรา', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '236');
INSERT INTO `tb_users` VALUES (237, 'นางสาวภัทรพร  ศรีจักร์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '237');
INSERT INTO `tb_users` VALUES (238, 'นางสาวรุจิรา  ถานุ', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '238');
INSERT INTO `tb_users` VALUES (239, 'นางสาวเบญจวรรณ  ทันเกตุ', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '239');
INSERT INTO `tb_users` VALUES (240, 'นางสาวช่อฟ้า  มนทอง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '240');
INSERT INTO `tb_users` VALUES (241, 'นางสุภาวดี  ปราบสกุล', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '241');
INSERT INTO `tb_users` VALUES (242, 'นางสาววิลาวรรณ  บุตะเคียน', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '242');
INSERT INTO `tb_users` VALUES (243, 'นางสาวอัจฉราภรณ์  ปัดจำหาร', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '243');
INSERT INTO `tb_users` VALUES (244, 'นายอนพัทย์  ชูสิทธิ์', 'พยาบาลวิชาชีพ', '-', 'ลจช.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '244');
INSERT INTO `tb_users` VALUES (245, 'นางสาวภัทราวดี  ศรีบริบูรณ์', 'พยาบาลวิชาชีพ', '-', 'ลจช.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '245');
INSERT INTO `tb_users` VALUES (246, 'นางสาวสุนิษา  สิทธิศร', 'พยาบาลวิชาชีพ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '246');
INSERT INTO `tb_users` VALUES (247, 'นางสาวสุชาดา  พวงมาลี', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '247');
INSERT INTO `tb_users` VALUES (248, 'นางสาวกรรณิกา  แสงลอย', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '248');
INSERT INTO `tb_users` VALUES (249, 'นายณัฏฐพล  ปรางมาศ', 'พนักงานประจำตึก', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '249');
INSERT INTO `tb_users` VALUES (250, 'นายทรงเกียรติ  บุตรดาห์', 'พนักงานประจำตึก', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '250');
INSERT INTO `tb_users` VALUES (251, 'นายนรากรณ์  ปัญญา', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '251');
INSERT INTO `tb_users` VALUES (252, 'นางสาววิไลลักษณ์  พลคำ', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '252');
INSERT INTO `tb_users` VALUES (253, 'นางสาวศิริภา  สิงหะ', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '253');
INSERT INTO `tb_users` VALUES (254, 'นางสาวเสาวลักษณ์  เสาทอง', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '254');
INSERT INTO `tb_users` VALUES (255, 'นางสาวจันทิมา  วงษ์ขันธ์', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '255');
INSERT INTO `tb_users` VALUES (256, 'นายณัฐพล  สุคะตะ', 'พนักงานประจำตึก', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในชาย', '256');
INSERT INTO `tb_users` VALUES (257, 'นางศลิษา  ตัณฑกูล', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '257');
INSERT INTO `tb_users` VALUES (258, 'นางแววปราชญ์  ซ่อนกลิ่น', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '258');
INSERT INTO `tb_users` VALUES (259, 'นางอริยะ  ช่างทำ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '259');
INSERT INTO `tb_users` VALUES (260, 'นางณัฐกร  เลิศศรี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '260');
INSERT INTO `tb_users` VALUES (261, 'นางสุริวรรณ  เลิศล้ำ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '261');
INSERT INTO `tb_users` VALUES (262, 'นางสาวนิชานันท์  ใชยมาศ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '262');
INSERT INTO `tb_users` VALUES (263, 'นางอัจฉริยาภรณ์  นนทะพันธ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '263');
INSERT INTO `tb_users` VALUES (264, 'นางสาวทิพญานี  ชำบุญมี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '264');
INSERT INTO `tb_users` VALUES (265, 'นางลลิดา  สารีบุตร', 'พยาบาลวิชาชีพ', 'ชำนาญการ', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '265');
INSERT INTO `tb_users` VALUES (266, 'นางสุภาพร  บุญตา', 'พยาบาลวิชาชีพ', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '266');
INSERT INTO `tb_users` VALUES (267, 'นางดวงฤดี  บัวเขียว', 'พยาบาลวิชาชีพ', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '267');
INSERT INTO `tb_users` VALUES (268, 'นางสาวพนิตา  สิทธิศร', 'พยาบาลวิชาชีพ', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '268');
INSERT INTO `tb_users` VALUES (269, 'นางสาววนิช  กตัญญุตาวงศ์', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '269');
INSERT INTO `tb_users` VALUES (270, 'นางพัชริญา  บุญเกิด', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '270');
INSERT INTO `tb_users` VALUES (271, 'นางสาวเบญจวรรณ  สายเนตร', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '271');
INSERT INTO `tb_users` VALUES (272, 'นางสาวณัตติยาภรณ์  ลิ้มสวัสดิ์', 'พนักงานช่วยเหลือคนไข้', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '272');
INSERT INTO `tb_users` VALUES (273, 'นายธีระยุทธ  โพธิ์มูล', 'พนักงานประจำตึก', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '273');
INSERT INTO `tb_users` VALUES (274, 'นายอดิสร  บุญขาว', 'พนักงานประจำตึก', '-', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในเด็ก', '274');
INSERT INTO `tb_users` VALUES (275, 'นางจุฑามาศ  อานไธสง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '275');
INSERT INTO `tb_users` VALUES (276, 'นางบุศราคัม  โพธิ์งาม', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '276');
INSERT INTO `tb_users` VALUES (277, 'นางเสาวภา  ทองศรี', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '277');
INSERT INTO `tb_users` VALUES (278, 'นางสาวพรรณทิพ  แสงสว่าง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '278');
INSERT INTO `tb_users` VALUES (279, 'นางพรปวีณ์  อานไธสง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '279');
INSERT INTO `tb_users` VALUES (280, 'นางสาววิรารัตน์  โพธิ์ชาติปาน', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '280');
INSERT INTO `tb_users` VALUES (281, 'นางบุหลัน  บัวมาศ', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '281');
INSERT INTO `tb_users` VALUES (282, 'นางสาวจันทร์เพ็ญ  รับรอง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '282');
INSERT INTO `tb_users` VALUES (283, 'นางสาวศิรินันท์  ใจนวน', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '283');
INSERT INTO `tb_users` VALUES (284, 'นางจันทร์เพ็ญ  สากาง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '284');
INSERT INTO `tb_users` VALUES (285, 'นางมัทรี  ศรีสวัสดิ์', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '285');
INSERT INTO `tb_users` VALUES (286, 'นางสาวปาฏิหาริย์  รุ้งแก้ว', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '286');
INSERT INTO `tb_users` VALUES (287, 'นางสาวกิตติยา  แสนทวีสุข', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '287');
INSERT INTO `tb_users` VALUES (288, 'นางสาวณัฐกุล  สุภารัตน์', 'พยาบาลวิชาชีพ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '288');
INSERT INTO `tb_users` VALUES (289, 'นางสาวสวรรยา  เกษศิริ', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '289');
INSERT INTO `tb_users` VALUES (290, 'นางสาวสุวรรณี  ตองอบ', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '290');
INSERT INTO `tb_users` VALUES (291, 'นายโอรส  ดวงใจ', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '291');
INSERT INTO `tb_users` VALUES (292, 'นายบุญเรน  ศรีดาชาติ', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '292');
INSERT INTO `tb_users` VALUES (293, 'นางสาวปวีณา  สมหวัง', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '293');
INSERT INTO `tb_users` VALUES (294, 'นางสาวกิตติญากานต์  สุคะตะ', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '294');
INSERT INTO `tb_users` VALUES (295, 'นางสาวพยอม  ไชยโพธิ์', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '295');
INSERT INTO `tb_users` VALUES (296, 'นางสาวอรพรรณ  ประดับศรี', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '296');
INSERT INTO `tb_users` VALUES (297, 'นางสาวจารุญา  จงหาญ', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '297');
INSERT INTO `tb_users` VALUES (298, 'นางสาวบังอร  ศิริจันดา', 'พนักงานช่วยเหลือคนไข้', 'รายวัน', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '298');
INSERT INTO `tb_users` VALUES (299, 'นางเอื้อง  คำมา', 'พนักงานประจำตึก', 'รายวัน', NULL, 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในหญิง', '299');
INSERT INTO `tb_users` VALUES (300, 'นางมะลิวาส  สุทธิพันธ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '300');
INSERT INTO `tb_users` VALUES (301, 'นางภัชราพร  โคกกลาง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '301');
INSERT INTO `tb_users` VALUES (302, 'นางสาวนพนิต  จันหอม', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '302');
INSERT INTO `tb_users` VALUES (303, 'นางสาววิราภรณ์  ดวงมณี', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '303');
INSERT INTO `tb_users` VALUES (304, 'นางสาววัลลี  ปรือปรัง', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '304');
INSERT INTO `tb_users` VALUES (305, 'นางสาวอรณี  มูลจัด', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '305');
INSERT INTO `tb_users` VALUES (306, 'นางสาวกัลยาณี  ทองทวี', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '306');
INSERT INTO `tb_users` VALUES (307, 'นายกฤษดา  การัตน์', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '307');
INSERT INTO `tb_users` VALUES (308, 'นางสาวรัชนีกร  พิมศร', 'พยาบาลวิชาชีพ', '-', 'ลจช.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '308');
INSERT INTO `tb_users` VALUES (309, 'นางกองทรัพย์  ทองอินทร์', 'พยาบาลวิชาชีพ', '-', 'ลจช.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '309');
INSERT INTO `tb_users` VALUES (310, 'นางสาวฐิมากูล  บุญสาร', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '310');
INSERT INTO `tb_users` VALUES (311, 'นางสาวศรีวตาภรณ์  ธรรมคุณ', 'พยาบาลวิชาชีพ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '311');
INSERT INTO `tb_users` VALUES (312, 'นางสาววารุณี  วงษ์พินิจ', 'นวก.สาธารณสุข', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '312');
INSERT INTO `tb_users` VALUES (313, 'นางสาวณัฏฐกานต์  ใจมี', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '313');
INSERT INTO `tb_users` VALUES (314, 'นางสาวชลธิยา  สายเนตร', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '314');
INSERT INTO `tb_users` VALUES (315, 'นางสาวน้ำฝน  เพ็งแจ่ม', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '315');
INSERT INTO `tb_users` VALUES (316, 'นางณัฏฐ์พัชร์  สถานพงษ์', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '316');
INSERT INTO `tb_users` VALUES (317, 'นายโกศล  อินยาพงษ์', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '317');
INSERT INTO `tb_users` VALUES (318, 'นายองอาจ  อัมลา', 'พนักงานประจำตึก', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยในศัลยกรรม', '318');
INSERT INTO `tb_users` VALUES (319, 'นางปิยดา  สอนพูด', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '319');
INSERT INTO `tb_users` VALUES (320, 'นางรุ่งฤดี  สว่างภพ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '320');
INSERT INTO `tb_users` VALUES (321, 'นางแรมจันทร์  จันทรารินทร์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '321');
INSERT INTO `tb_users` VALUES (322, 'นางสาววีนัส  แสงแก้ว', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '322');
INSERT INTO `tb_users` VALUES (323, 'นางอลิษา  สมรัตน์', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '323');
INSERT INTO `tb_users` VALUES (324, 'นางสาวมีนา  บุญพามา', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '324');
INSERT INTO `tb_users` VALUES (325, 'นางสาวชนิษฐา  ถนอมศรี', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '325');
INSERT INTO `tb_users` VALUES (326, 'นางสุภาพร  ขัดสี', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '326');
INSERT INTO `tb_users` VALUES (327, 'นางสาวกมลชนก  นิลเพชร', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '327');
INSERT INTO `tb_users` VALUES (328, 'นางสาวอรวรรณ  ศรีแก้ว', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '328');
INSERT INTO `tb_users` VALUES (329, 'นางสาวนัทศิมา  จันเทียม', 'พยาบาลวิชาชีพ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '329');
INSERT INTO `tb_users` VALUES (330, 'นางสาวกัลยาณี  พันธ์คำ', 'พยาบาลวิชาชีพ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '330');
INSERT INTO `tb_users` VALUES (331, 'นางสาวธิชานันท์  เตารัตน์', 'พยาบาลวิชาชีพ', '-', 'ลจช.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '331');
INSERT INTO `tb_users` VALUES (332, 'นางสาวพรชิตา  พูลทา', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '332');
INSERT INTO `tb_users` VALUES (333, 'นางสาวพนิดา  อายุวงษ์', 'นวส.สาธารณสุข', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '333');
INSERT INTO `tb_users` VALUES (334, 'นางกรกัญญาจิตรสินี  พลาดอินทร์', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '334');
INSERT INTO `tb_users` VALUES (335, 'นางสาววริศรา  วงษ์ขันธ์', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '335');
INSERT INTO `tb_users` VALUES (336, 'นางอมรรัตน์  รักษากิจ', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '336');
INSERT INTO `tb_users` VALUES (337, 'นางสาวชุติยา  กิตติอัมพรวงศ์', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '337');
INSERT INTO `tb_users` VALUES (338, 'นายสุระเพชร  สัมดี', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '338');
INSERT INTO `tb_users` VALUES (339, 'นายพลเลิศ  พงษ์สุวรรณ', 'พนักงานประจำตึก', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '339');
INSERT INTO `tb_users` VALUES (340, 'นายวรรณสิงห์  ธนาพงษ์วิศาล', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '340');
INSERT INTO `tb_users` VALUES (341, 'นางอำไพร  บรรลังค์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '341');
INSERT INTO `tb_users` VALUES (342, 'นางนุชจรี  สุขดี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '342');
INSERT INTO `tb_users` VALUES (343, 'นางสาวสุจี  อ่อนคำ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '343');
INSERT INTO `tb_users` VALUES (344, 'นางธีรดา  แซ่จึง', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '344');
INSERT INTO `tb_users` VALUES (345, 'นางสาวภาวรรณ  ใจนวน', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '345');
INSERT INTO `tb_users` VALUES (346, 'นางสาวเย็นนภา  บุญขาว', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '346');
INSERT INTO `tb_users` VALUES (347, 'นางสาวธัญญา  อาจภักดี', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '347');
INSERT INTO `tb_users` VALUES (348, 'นางสุมาลี  ศรีสุภาพ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '348');
INSERT INTO `tb_users` VALUES (349, 'นางสาวศรีสุดา  ชวดพงษ์', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '349');
INSERT INTO `tb_users` VALUES (350, 'นางคำปอง  สอนสระคู', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจป.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '350');
INSERT INTO `tb_users` VALUES (351, 'นายอานนท์  แสงเนตร์', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '351');
INSERT INTO `tb_users` VALUES (352, 'นายสุริยา  จันภักดี', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '352');
INSERT INTO `tb_users` VALUES (353, 'นายธรรมรัตน์  ใจดี', 'พนักงานบริการ', 'รายคาบ', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '353');
INSERT INTO `tb_users` VALUES (354, 'นางพนิดา  ศรีสำราญ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '354');
INSERT INTO `tb_users` VALUES (355, 'นางสงวนศรี  ศรีลาชัย', 'พยาบาลเทคนิค', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '355');
INSERT INTO `tb_users` VALUES (356, 'นางปาริชาติ  แพงมาก', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '356');
INSERT INTO `tb_users` VALUES (357, 'นายมูน  แพงมาก', 'พนักงานบัตรรายงานโรค', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '357');
INSERT INTO `tb_users` VALUES (358, 'นายมนต์ชัย  พรมศักดิ์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '358');
INSERT INTO `tb_users` VALUES (359, 'นายสันติ  รมไธสง', 'พนักงานซักฟอก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '359');
INSERT INTO `tb_users` VALUES (360, 'นายสุทธิพันธ์  แสงเนตร์', 'พนักงานซักฟอก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '360');
INSERT INTO `tb_users` VALUES (361, 'นายพรพจน์  ศรีลาชัย', 'พนักงานซักฟอก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '361');
INSERT INTO `tb_users` VALUES (362, 'นายกิตติ  ศรีดาชาติ', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '362');
INSERT INTO `tb_users` VALUES (363, 'นายชัชพงษ์  ทองภา', 'พนักงานซักฟอก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '363');
INSERT INTO `tb_users` VALUES (364, 'นายยงยุทธ  เตียนจันทึก', 'พนักงานซักฟอก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '364');
INSERT INTO `tb_users` VALUES (365, 'นายอุเทน  บุญมา', 'พนักงานซักฟอก', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '365');
INSERT INTO `tb_users` VALUES (366, 'นางสาวสุวรรณ  วงษ์ขันธ์', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '366');
INSERT INTO `tb_users` VALUES (367, 'นายจิรพงษ์  บุญขาว', 'พนักงานบริการ', '-', 'ลจช.รายวัน', 'กลุ่มงานการพยาบาล', 'งานจ่ายกลาง-ซักฟอก', '367');
INSERT INTO `tb_users` VALUES (368, 'นางวัธนี  อินยาพงษ์', 'พยาบาลวิลาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '368');
INSERT INTO `tb_users` VALUES (369, 'นางสาวณัฏฐ์ชุดา  รุ่งโรจน์บวรกิจ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '369');
INSERT INTO `tb_users` VALUES (370, 'นางสาวเกื้อกูล  โสริยาตร', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '370');
INSERT INTO `tb_users` VALUES (371, 'นางจิตตรากรณ์  เสนาะ', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '371');
INSERT INTO `tb_users` VALUES (372, 'นางสาวอรวรรณ  ตะเคียนศก', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '372');
INSERT INTO `tb_users` VALUES (373, 'นางพรนิดา  นางวงศ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '373');
INSERT INTO `tb_users` VALUES (374, 'นางสาวปทุมทิพย์  สมคณะ', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '374');
INSERT INTO `tb_users` VALUES (375, 'นางสาวปิ่นทอง  พัวพิทยาเลิศ', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '375');
INSERT INTO `tb_users` VALUES (376, 'นางสาวรัชดา  สาระชาติ', 'พยาบาลวิชาชีพ', '-', 'ลจช.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '376');
INSERT INTO `tb_users` VALUES (377, 'นางสาวกรรณกา  พันธ์แก่น', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '377');
INSERT INTO `tb_users` VALUES (378, 'นางสาวมณฑกานต์  ขุนพรม', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '378');
INSERT INTO `tb_users` VALUES (379, 'นางสาวจุฑามาศ  พงษ์ชาติ', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '379');
INSERT INTO `tb_users` VALUES (380, 'นางสาคร  จำปาโคกกรวด', 'พนักงานช่วยเหลือคนไข้', '-', 'ลจป.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '380');
INSERT INTO `tb_users` VALUES (381, 'นางอุบลศรี  เพ็ชล้วน', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '381');
INSERT INTO `tb_users` VALUES (382, 'นางพัทธนันท์  ลัดดากลม', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '382');
INSERT INTO `tb_users` VALUES (383, 'นายภูษิต  สถานพงษ์', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '383');
INSERT INTO `tb_users` VALUES (384, 'นายสุกิจ  บุญขาว', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '384');
INSERT INTO `tb_users` VALUES (385, 'นางสาวดวงหทัย  ศรีลาชัย', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '385');
INSERT INTO `tb_users` VALUES (386, 'นางสาวนงลักษ์  ใจดี', 'พนักงานช่วยเหลือคนไข้', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้คลอด', '386');
INSERT INTO `tb_users` VALUES (387, 'นางกาญจนา  นามบุตรดี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '387');
INSERT INTO `tb_users` VALUES (388, 'นางรมิดา  พันธ์ภักดี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '388');
INSERT INTO `tb_users` VALUES (389, 'นายบุญทิต  อสิพงษ์', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '389');
INSERT INTO `tb_users` VALUES (390, 'นางศิริปทุม  เพชรล้วน', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '390');
INSERT INTO `tb_users` VALUES (391, 'นางทริกาญจน์  ยศวิจิตร', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '391');
INSERT INTO `tb_users` VALUES (392, 'นายรังสิมันต์  วงษา', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '392');
INSERT INTO `tb_users` VALUES (393, 'นายพรชัย  สัปทนต์', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '393');
INSERT INTO `tb_users` VALUES (394, 'นายสุรพงษ์  สายเนตร', 'พนักงานประจำตึก', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานควบคุมโรคไม่ติดต่อเรื้อรัง', '394');
INSERT INTO `tb_users` VALUES (395, 'นางอังคณาลักษณ์  แสวงดี', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์ดูแลต่อเนื่องที่บ้าน  ', '395');
INSERT INTO `tb_users` VALUES (396, 'นางสาวทวิกา  รสสุพล', 'พยาบาลวิชาชีพ', 'ปฏิบัติการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์ดูแลต่อเนื่องที่บ้าน  ', '396');
INSERT INTO `tb_users` VALUES (397, 'นางกุลชญา  พันธ์แก่น', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานบริการปฐมภูมิและองค์รวม', 'ศูนย์ดูแลต่อเนื่องที่บ้าน  ', '397');
INSERT INTO `tb_users` VALUES (398, 'นางชยิสรา  คำแสน', 'แพทย์แผนไทย', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานแพทย์แผนไทยและการแพทย์ทางเลือก', 'งานแพทย์แผนไทยและการแพทย์ทางเลือก', '398');
INSERT INTO `tb_users` VALUES (399, 'นางสาวกัญญาณัฐ  แสนสุภา', 'แพทย์แผนไทย', '-', 'ลจช.', 'กลุ่มงานแพทย์แผนไทยและการแพทย์ทางเลือก', 'งานแพทย์แผนไทยและการแพทย์ทางเลือก', '399');
INSERT INTO `tb_users` VALUES (400, 'นางสาวจิรภา  วงษ์วิลา', 'แพทย์แผนไทย', '-', 'พกส.', 'กลุ่มงานแพทย์แผนไทยและการแพทย์ทางเลือก', 'งานแพทย์แผนไทยและการแพทย์ทางเลือก', '400');
INSERT INTO `tb_users` VALUES (401, 'นางพรพิมล  แสงเนตร์', 'พนักงานช่วยการพยาบาล', '-', 'พกส.', 'กลุ่มงานแพทย์แผนไทยและการแพทย์ทางเลือก', 'งานแพทย์แผนไทยและการแพทย์ทางเลือก', '401');
INSERT INTO `tb_users` VALUES (402, 'นางนพนิต  เหล่าแค', 'พยาบาลวิชาชีพ', 'ชำนาญการ', 'ขรก.', 'กลุ่มงานยาเสพติดและจิตเวช', 'งานยาเสพติดและจิตเวช', '402');
INSERT INTO `tb_users` VALUES (403, 'นางสาวสุภาวดี  บุตรมาลา', 'พนักงานบริการ', '-', 'พกส.', 'กลุ่มงานยาเสพติดและจิตเวช', 'งานยาเสพติดและจิตเวช', '403');
INSERT INTO `tb_users` VALUES (404, 'นางสาวอริสา  มุระดา', 'นักวิชาการการเงินและบัญชี', '-', 'ลูกจ้างรายวัน', 'กลุ่มงานบริหารทั่วไป', 'งานการเงินและบัญชี', '404');
INSERT INTO `tb_users` VALUES (405, 'นางสาวจีรนันท์  ดอนวิชัย', 'เภสัชกร', NULL, 'พนักงานราชการ', 'กลุ่มงานเภสัชกรรมและคุ้มครองผู้บริโภค', 'งานเภสัชกรรมและคุ้มครองผู้บริโภค', '405');
INSERT INTO `tb_users` VALUES (406, 'นางสาวรัตนา  โยธา', 'พยาบาลวิชาชีพ', '-', 'พกส.', 'กลุ่มงานการพยาบาล', 'งานการพยาบาลผู้ป่วยหนัก', '406');

-- ----------------------------
-- Table structure for tbl_level
-- ----------------------------
DROP TABLE IF EXISTS `tbl_level`;
CREATE TABLE `tbl_level`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_level
-- ----------------------------
INSERT INTO `tbl_level` VALUES (1, 'ไม่มี', NULL);
INSERT INTO `tbl_level` VALUES (2, 'ปฏิบัติการ', NULL);
INSERT INTO `tbl_level` VALUES (3, 'ชำนาญการ', NULL);
INSERT INTO `tbl_level` VALUES (4, 'ชำนาญงาน', NULL);
INSERT INTO `tbl_level` VALUES (5, 'ชำนาญการพิเศษ', NULL);
INSERT INTO `tbl_level` VALUES (6, 'ชำนาญงานพิเศษ', NULL);

-- ----------------------------
-- Table structure for tbl_position
-- ----------------------------
DROP TABLE IF EXISTS `tbl_position`;
CREATE TABLE `tbl_position`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_position
-- ----------------------------
INSERT INTO `tbl_position` VALUES (1, 'นักวิชาการสาธารณสุข', NULL);
INSERT INTO `tbl_position` VALUES (2, 'เจ้าพนักงานเครื่องคอมพิวเตอร์', NULL);
INSERT INTO `tbl_position` VALUES (3, 'นักวิชาการคอมพิวเตอร์', NULL);
INSERT INTO `tbl_position` VALUES (4, 'พนักงานบัตรรายงานโรค', NULL);
INSERT INTO `tbl_position` VALUES (5, 'พยาบาลวิชาชีพ', NULL);
INSERT INTO `tbl_position` VALUES (6, 'เจ้าพนักงานธุรการ', NULL);
INSERT INTO `tbl_position` VALUES (7, 'เจ้าพนักงานเวชสถิติ', NULL);

-- ----------------------------
-- Table structure for tbldepartments
-- ----------------------------
DROP TABLE IF EXISTS `tbldepartments`;
CREATE TABLE `tbldepartments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DepartmentShortName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DepartmentCode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbldepartments
-- ----------------------------
INSERT INTO `tbldepartments` VALUES (1, 'Human Resource', 'HR', 'HR160', '2020-11-01 14:16:25');
INSERT INTO `tbldepartments` VALUES (2, 'Information Technology', 'IT', 'IT807', '2020-11-01 14:19:37');
INSERT INTO `tbldepartments` VALUES (3, 'Operations', 'OP', 'OP640', '2020-12-03 04:28:56');
INSERT INTO `tbldepartments` VALUES (4, 'Volunteer', 'VL', 'VL9696', '2021-03-03 15:27:52');
INSERT INTO `tbldepartments` VALUES (5, 'Marketing', 'MK', 'MK369', '2021-03-03 17:53:52');
INSERT INTO `tbldepartments` VALUES (6, 'Finance', 'FI', 'FI123', '2021-03-03 17:54:27');
INSERT INTO `tbldepartments` VALUES (7, 'Sales', 'SS', 'SS469', '2021-03-03 17:55:24');
INSERT INTO `tbldepartments` VALUES (8, 'Research', 'RS', 'RS666', '2021-03-03 23:39:03');

-- ----------------------------
-- Table structure for tblemployees
-- ----------------------------
DROP TABLE IF EXISTS `tblemployees`;
CREATE TABLE `tblemployees`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmpId` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FirstName` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastName` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `EmailId` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Gender` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Dob` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Department` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `City` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Country` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Phonenumber` char(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Status` int NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblemployees
-- ----------------------------
INSERT INTO `tblemployees` VALUES (1, 'ASTR001245', 'Johnny', 'Scott', 'johnny@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Male', '1996-06-12', 'Information Technology', '49 Arron Smith Drive', 'Honolulu', 'US', '7854785477', 1, '2020-11-10 18:29:59');
INSERT INTO `tblemployees` VALUES (2, 'ASTR001369', 'Milton', 'Doe', 'milt@mail.com', 'f925916e2754e5e03f75dd58a5733251', 'Male', '1990-02-02', 'Operations', '15 Kincheloe Road', 'Salem', 'US', '8587944255', 1, '2020-11-10 20:40:02');
INSERT INTO `tblemployees` VALUES (3, 'ASTR004699', 'Shawn', 'Den', 'Shawnden@mail.com', '3b87c97d15e8eb11e51aa25e9a5770e9', 'Male', '1995-03-22', 'Human Resource', '239 Desert Court', 'Wayne', 'US', '7458887169', 1, '2021-03-03 14:24:17');
INSERT INTO `tblemployees` VALUES (4, 'ASTR002996', 'Carol', 'Reed', 'carol@mail.com', '723e1489a45d2cbaefec82eee410abd5', 'Female', '1989-03-23', 'Volunteer', 'Demo Address', 'Demo City', 'Demo Country', '7854448550', 1, '2021-03-03 17:44:13');
INSERT INTO `tblemployees` VALUES (5, 'ASTR001439', 'Danny', 'Wood', 'danny@mail.com', 'b7bee6b36bd35b773132d4e3a74c2bb5', 'Male', '1986-03-12', 'Research', '11 Rardin Drive', 'San Francisco', 'US', '4587777744', 1, '2021-03-05 00:14:48');
INSERT INTO `tblemployees` VALUES (6, 'ASTR006946', 'Shawn', 'Martin', 'shawn@mail.com', 'a3cceba83235dc95f750108d22c14731', 'Male', '1992-08-28', 'Finance', '3259 Ray Court', 'Wilmington', 'US', '8520259670', 1, '2021-03-05 00:46:02');
INSERT INTO `tblemployees` VALUES (7, 'ASTR000084', 'Jennifer', 'Foltz', 'jennifer@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Female', '1992-12-11', 'Marketing', '977 Smithfield Avenue', 'Elkins', 'US', '7401256696', 1, '2022-02-09 22:29:00');
INSERT INTO `tblemployees` VALUES (8, 'ASTR012447', 'Will', 'Williams', 'williams@mail.com', '1234', 'Male', '1992-02-15', 'Research', '366 Cemetery Street', 'Houston', 'US', '7854000065', 1, '2022-02-10 22:52:32');

-- ----------------------------
-- Table structure for tblleaves
-- ----------------------------
DROP TABLE IF EXISTS `tblleaves`;
CREATE TABLE `tblleaves`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(110) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ToDate` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FromDate` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Description` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `AdminRemarkDate` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Status` int NOT NULL,
  `IsRead` int NOT NULL,
  `empid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UserEmail`(`empid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblleaves
-- ----------------------------
INSERT INTO `tblleaves` VALUES (7, 'Casual Leave', '30/11/2020', '29/10/2020', 'Test Test Demo Test Test Demo Test Test Demo', '2020-11-19 20:11:21', 'A demo Admin Remarks for Testing!', '2020-12-02 23:26:27 ', 2, 1, 1);
INSERT INTO `tblleaves` VALUES (8, 'Medical Leave', '21/10/2020', '25/10/2020', 'Test Test Demo Test Test Demo Test Test Demo Test Test Demo', '2020-11-20 18:14:14', 'A demo Admin Remarks for Testing!', '2020-12-02 23:24:39 ', 1, 1, 1);
INSERT INTO `tblleaves` VALUES (9, 'Medical Leave', '08/12/2020', '12/12/2020', 'This is a demo description for testing purpose', '2020-12-03 01:26:01', 'All good make your time and hope you\'ll be fine and get back to work asap! Best Regards, Admin.', '2021-03-03 11:19:29 ', 1, 1, 2);
INSERT INTO `tblleaves` VALUES (10, 'Restricted Holiday', '25/12/2020', '25/12/2020', 'This is a demo description for testing purpose', '2020-12-03 15:29:07', 'A demo Admin Remarks for Testing!', '2020-12-03 14:06:12 ', 1, 1, 1);
INSERT INTO `tblleaves` VALUES (11, 'Medical Leave', '02/12/2020', '06/12/2020', 'This is a demo description for testing purpose', '2020-04-29 22:01:14', 'A demo Admin Remarks for Testing!', '2020-04-29 20:33:21 ', 1, 1, 1);
INSERT INTO `tblleaves` VALUES (12, 'Casual Leave', '02/02/2020', '03/03/2020', 'This is a demo description for testing purpose', '2020-07-03 15:11:11', 'A demo Admin Remarks for Testing!', '2020-07-03 13:42:05 ', 1, 1, 1);
INSERT INTO `tblleaves` VALUES (14, 'Medical Leave', '2020-03-05', '2020-06-05', 'This is a demo description for testing purpose', '2021-03-02 16:31:01', NULL, NULL, 0, 1, 2);
INSERT INTO `tblleaves` VALUES (15, 'Casual Leave', '2021-03-15', '2021-03-05', 'None, Testing', '2021-03-02 16:32:42', 'casual leave not allowed for a week, the company\'s gotta huge project which should be completed within this week.', '2021-03-03 11:47:33 ', 2, 1, 1);
INSERT INTO `tblleaves` VALUES (17, 'Paternity Leave', '2021-03-03', '2021-03-10', 'Being a father i\'ve got to look after my new borns and spend some time with my families too!', '2021-03-03 17:58:18', NULL, NULL, 0, 1, 3);
INSERT INTO `tblleaves` VALUES (18, 'Medical Leave', '2021-03-04', '2021-03-05', 'i\'ve to go for my body checkup. got an appointment for tommorow', '2021-03-03 19:09:44', 'No comments on it.', '2021-03-04 22:56:24 ', 1, 1, 4);
INSERT INTO `tblleaves` VALUES (19, 'Compensatory Leave', '2021-03-05', '2021-03-06', 'been working over time since last night, so i\'d like a day off', '2021-03-03 19:24:15', NULL, NULL, 0, 1, 1);
INSERT INTO `tblleaves` VALUES (20, 'Casual Leave', '2022-02-09', '2022-02-12', 'None, Test Mode', '2022-02-09 22:31:15', NULL, NULL, 0, 0, 7);
INSERT INTO `tblleaves` VALUES (21, 'Self-Quarantine Leave', '2022-02-11', '2022-02-18', 'This is just a demo condition for testing purpose!!', '2022-02-10 23:05:30', 'No comments!!', '2022-02-10 21:37:15 ', 1, 1, 8);
INSERT INTO `tblleaves` VALUES (22, 'Casual Leave', '2020-03-05', '2020-03-05', '', '2023-10-04 09:54:14', 'ok', '2023-10-04 8:43:00 ', 1, 1, 8);

-- ----------------------------
-- Table structure for tblleavetype
-- ----------------------------
DROP TABLE IF EXISTS `tblleavetype`;
CREATE TABLE `tblleavetype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Description` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tblleavetype
-- ----------------------------
INSERT INTO `tblleavetype` VALUES (1, 'Casual Leave', 'Provided for urgent or unforeseen matters to the employees.', '2020-11-01 19:07:56');
INSERT INTO `tblleavetype` VALUES (2, 'Medical Leave', 'Related to Health Problems of Employee', '2020-11-06 20:16:09');
INSERT INTO `tblleavetype` VALUES (3, 'Restricted Holiday', 'Holiday that is optional', '2020-11-06 20:16:38');
INSERT INTO `tblleavetype` VALUES (5, 'Paternity Leave', 'To take care of newborns', '2021-03-03 17:46:31');
INSERT INTO `tblleavetype` VALUES (6, 'Bereavement Leave', 'Grieve their loss of losing loved ones', '2021-03-03 17:47:48');
INSERT INTO `tblleavetype` VALUES (7, 'Compensatory Leave', 'For Overtime workers', '2021-03-03 17:48:37');
INSERT INTO `tblleavetype` VALUES (8, 'Maternity Leave', 'Taking care of newborn ,recoveries', '2021-03-03 17:50:17');
INSERT INTO `tblleavetype` VALUES (9, 'Religious Holidays', 'Based on employee\'s followed religion', '2021-03-03 17:51:26');
INSERT INTO `tblleavetype` VALUES (10, 'Adverse Weather Leave', 'In terms of extreme weather conditions', '2021-03-03 20:18:26');
INSERT INTO `tblleavetype` VALUES (11, 'Voting Leave', 'For official election day', '2021-03-03 20:19:06');
INSERT INTO `tblleavetype` VALUES (12, 'Self-Quarantine Leave', 'Related to COVID-19 issues', '2021-03-03 20:19:48');
INSERT INTO `tblleavetype` VALUES (13, 'Personal Time Off', 'To manage some private matters', '2021-03-03 20:21:10');

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `full` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `work_year` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_month` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hire_rate` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paypost` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workday` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hire_group` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_dated` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 'นายเรวัต สุขดี', '(นายเรวัต สุขดี)', '3330501393228', 'นักวิชาการคอมพิวเตอร์', '1', '2022-05-22', '1', '4', '0', '1700', '22', '2', 'Y', 'ไม่มี', '#800080', '2022-06-01');
INSERT INTO `user_group` VALUES (2, 'นายฐากูร หมู่มาก', '(นายฐากูร หมู่มาก)', '1330500209508', 'นักวิชาการคอมพิวเตอร์', '1', '2020-03-01', '4', '5', '750', '2300', '19', '3', 'Y', 'ไม่มี', '#9FE2BF', '2020-03-01');
INSERT INTO `user_group` VALUES (3, 'นายธนัฐ สารีบุตร', '(นายธนัฐ สารีบุตร)', '1329900016373', 'นักวิชาการคอมพิวเตอร์', '1', '2012-01-01', '11', '9', '0', '2500', '22', '1', 'Y', 'ปฏิบัติการ', '#40E0D0', '2012-01-01');
INSERT INTO `user_group` VALUES (4, 'นายเกียรติศักดิ์ ถนอม', '(นายเกียรติศักดิ์ ถนอม)', '3330501222750', 'เจ้าพนักงานเครื่องคอมพิวเตอร์', '2', '2012-04-01', '11', '6', '0', '1500', '22', '2', 'Y', 'ไม่มี', '#FFBF00', '2012-04-01');
INSERT INTO `user_group` VALUES (5, 'นายวรวัช ศรีสมบัติ', '(นายวรวัช ศรีสมบัติ)', '5330500009137', 'เจ้าพนักงานเครื่องคอมพิวเตอร์', '2', '2014-06-02', '12', '9', '0', '1200', '22', '2', 'N', 'ไม่มี', '#6495ED', '2014-06-02');
INSERT INTO `user_group` VALUES (6, 'น.ส.นันทิยา เทพแสง', '(น.ส.นันทิยา เทพแสง)', '3330501202732', 'เจ้าพนักงานเวชสถิติ', '2', '2010-08-02', '12', '9', '0', '1500', '22', '1', 'Y', 'ชำนาญงาน', '#FF7F50', '2010-08-02');
INSERT INTO `user_group` VALUES (7, 'น.ส.กมลญาณินี จันทร์สว่าง', '(น.ส.กมลญาณินี จันทร์สว่าง)', '3330501145500', 'เจ้าพนักงานธุรการ', '2', '2022-05-22', '1', '4', '0', '1000', '22', '2', 'Y', 'ไม่มี', '#DE3163', '2022-06-01');
INSERT INTO `user_group` VALUES (8, 'น.ส.สุภารัตน์ ศรีลาชัย', '(น.ส.สุภารัตน์ ศรีลาชัย)', '1330500233743', 'เจ้าพนักงานธุรการ', '2', '2023-09-01', '0', '0', '410', '1000', '19', '3', 'Y', 'ไม่มี', '#CCCCFF', '2023-09-01');
INSERT INTO `user_group` VALUES (9, 'นายช่วงโชติ จันทร์ทอง', '(นายช่วงโชติ จันทร์ทอง)', '3330501207769', 'เจ้าพนักงานเวชสถิติ', '2', '2010-08-02', '13', '2', '0', '1500', '22', '1', 'Y', 'ชำนาญงาน', '#FF0000', '2010-08-02');
INSERT INTO `user_group` VALUES (10, 'น.ส.พิชญา สุตะพันธ์', '(น.ส.พิชญา สุตะพันธ์)', '1101501000737', 'เจ้าพนักงานเวชสถิติ', '2', '2019-08-01', '4', '2', '0', '1200', '22', '2', 'N', 'ไม่มี', '#00FF00', '2019-08-01');
INSERT INTO `user_group` VALUES (11, 'นายกล้าณรงค์ ศรียันต์', '(นายกล้าณรงค์ ศรียันต์)', '1331001332453', 'นักวิชาการสาธารณสุข', '3', '2023-04-03', '0', '6', '0', '2200', '22', '2', 'Y', 'ไม่มี', '#0000FF', '2023-04-03');
INSERT INTO `user_group` VALUES (12, 'นายสนั่น  เทียนทอง', NULL, '3321001134496', 'นักวิชาการสาธารณสุข', '3', '1986-06-01', NULL, NULL, NULL, '3000', NULL, '1', 'Y', 'ชำนาญการ', '#800000', '1986-06-01');
INSERT INTO `user_group` VALUES (13, 'น.ส.วรัญช์ธิตา  จิรสิริโภคิน', NULL, '1330700091047', 'พยาบาลวิชาชีพ', '4', '2011-04-01', NULL, NULL, NULL, '3200', NULL, '1', 'Y', 'ปฏิบัติการ', '#FFFF00', '2011-04-01');
INSERT INTO `user_group` VALUES (14, 'น.ส.ศิวพร  พึ่งภพ', NULL, '1349900437425', 'นักวิชาการสาธารณสุข', '3', '2012-04-02', NULL, NULL, NULL, '3000', NULL, '1', 'N', 'ปฏิบัติการ', '#FF00FF', '2012-04-02');
INSERT INTO `user_group` VALUES (15, 'น.ส.รสสุคนธ์  รัตนกำพล', NULL, '1103700462848', 'นักวิชาการสาธารณสุข', '3', '2022-02-01', NULL, NULL, '515', '2200', '19', '3', 'Y', 'ไม่มี', '#008000', '2022-02-01');
INSERT INTO `user_group` VALUES (16, 'น.ส.พรพิมล  ดวงใจ', NULL, '1339900203793', 'นักวิชาการสาธารณสุข', '3', '2021-08-01', NULL, NULL, NULL, '2200', NULL, '2', 'Y', 'ไม่มี', NULL, '2021-08-01');
INSERT INTO `user_group` VALUES (60, 'นายกมลศิลป์  พันธ์ดี', NULL, '1340400028552', 'นักวิชาการสาธารณสุข', NULL, '2010-06-09', NULL, NULL, NULL, '3000', NULL, NULL, 'Y', 'ชำนาญการ', NULL, '2010-07-01');

SET FOREIGN_KEY_CHECKS = 1;
