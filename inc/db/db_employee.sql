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

SET FOREIGN_KEY_CHECKS = 1;
