/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : wyus

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 15/05/2022 14:11:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `stuId` int(11) NOT NULL COMMENT '学生编号',
  `achId` int(11) NOT NULL COMMENT '成绩编号',
  `ach` int(11) NULL DEFAULT 0 COMMENT '成绩'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of achievement
-- ----------------------------
INSERT INTO `achievement` VALUES (2021011002, 101, 80);
INSERT INTO `achievement` VALUES (2021011002, 102, 78);
INSERT INTO `achievement` VALUES (2021011002, 103, 99);
INSERT INTO `achievement` VALUES (2021011002, 104, 88);
INSERT INTO `achievement` VALUES (2021011002, 105, 65);
INSERT INTO `achievement` VALUES (2021011001, 102, 66);
INSERT INTO `achievement` VALUES (2021011001, 103, 65);
INSERT INTO `achievement` VALUES (2021011001, 104, 77);
INSERT INTO `achievement` VALUES (2021011001, 105, 45);
INSERT INTO `achievement` VALUES (2021011005, 102, 65);
INSERT INTO `achievement` VALUES (2021011005, 104, 88);
INSERT INTO `achievement` VALUES (2021011005, 105, 87);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courId` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `courName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名字',
  `semester` enum('1','2','3','4','5','6','7','8') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程所属学期',
  `period` int(11) NULL DEFAULT NULL COMMENT '学时',
  `credit` int(11) NULL DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`courId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (101, '计算机基础', '1', 80, 5);
INSERT INTO `course` VALUES (102, '程序设计语言', '2', 48, 4);
INSERT INTO `course` VALUES (103, '计算机原理', '3', 60, 3);
INSERT INTO `course` VALUES (104, '数据库原理', '2', 50, 3);
INSERT INTO `course` VALUES (105, '软件工程', '2', 60, 4);
INSERT INTO `course` VALUES (106, '计算机网络工程', '3', 60, 3);
INSERT INTO `course` VALUES (107, '操作系统', '3', 50, 2);
INSERT INTO `course` VALUES (108, 'Web程序设计', '3', 46, 4);
INSERT INTO `course` VALUES (109, 'Js前端设计', '1', 50, 4);
INSERT INTO `course` VALUES (110, 'Mysql数据库', '1', 50, 4);
INSERT INTO `course` VALUES (111, 'UML数据建模', '3', 40, 3);
INSERT INTO `course` VALUES (112, '数据密码学', '4', 50, 3);
INSERT INTO `course` VALUES (113, 'Java框架开发', '5', 60, 4);
INSERT INTO `course` VALUES (114, '程序设计语言', '1', 42, 2);
INSERT INTO `course` VALUES (115, '高等数学', '1', 50, 2);
INSERT INTO `course` VALUES (116, '大学英语', '1', 50, 3);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `majorId` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业编号',
  `majorName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名字',
  `amount` int(11) NULL DEFAULT 0 COMMENT '人数',
  `assistant` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅导员',
  PRIMARY KEY (`majorId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '软件工程', 150, '东方不败');
INSERT INTO `major` VALUES (2, '通信工程', 160, '段誉');
INSERT INTO `major` VALUES (3, '计算机科学与技术', 171, '王语嫣');
INSERT INTO `major` VALUES (4, '物联网工程', 143, '虚竹');
INSERT INTO `major` VALUES (5, '工商管理', 100, '王嘉陵');
INSERT INTO `major` VALUES (6, '网络安全', 180, '令狐冲');
INSERT INTO `major` VALUES (7, '人工智能', 130, '欧阳锋');
INSERT INTO `major` VALUES (10, '计算机网络通信', 80, '李莫愁');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `courId` int(11) NULL DEFAULT NULL COMMENT '课程编号',
  INDEX `xskcb_xh_fk`(`userId`) USING BTREE,
  INDEX `xskcb_kch_fk`(`courId`) USING BTREE,
  CONSTRAINT `xskcb_kch_fk` FOREIGN KEY (`courId`) REFERENCES `course` (`courId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `xskcb_xh_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (NULL, 101);
INSERT INTO `schedule` VALUES (NULL, 103);
INSERT INTO `schedule` VALUES (NULL, 104);
INSERT INTO `schedule` VALUES (2021011002, 101);
INSERT INTO `schedule` VALUES (2021011002, 102);
INSERT INTO `schedule` VALUES (NULL, 101);
INSERT INTO `schedule` VALUES (2021011007, 106);
INSERT INTO `schedule` VALUES (2021011005, 101);
INSERT INTO `schedule` VALUES (2021011005, 102);
INSERT INTO `schedule` VALUES (NULL, 102);
INSERT INTO `schedule` VALUES (NULL, 108);
INSERT INTO `schedule` VALUES (NULL, 104);
INSERT INTO `schedule` VALUES (NULL, 106);
INSERT INTO `schedule` VALUES (NULL, 107);
INSERT INTO `schedule` VALUES (2021011013, 101);
INSERT INTO `schedule` VALUES (2021011013, 110);
INSERT INTO `schedule` VALUES (2021011013, 102);
INSERT INTO `schedule` VALUES (2021011013, 107);
INSERT INTO `schedule` VALUES (1000000001, 101);
INSERT INTO `schedule` VALUES (NULL, 103);
INSERT INTO `schedule` VALUES (NULL, 110);
INSERT INTO `schedule` VALUES (2021011002, 106);
INSERT INTO `schedule` VALUES (2021011002, 107);
INSERT INTO `schedule` VALUES (2021011002, 109);
INSERT INTO `schedule` VALUES (2021011002, 110);
INSERT INTO `schedule` VALUES (2021011002, 104);
INSERT INTO `schedule` VALUES (2021011002, 116);
INSERT INTO `schedule` VALUES (2021011002, 105);
INSERT INTO `schedule` VALUES (2021011026, 101);
INSERT INTO `schedule` VALUES (2021011026, 102);
INSERT INTO `schedule` VALUES (2021011026, 104);
INSERT INTO `schedule` VALUES (2021011026, 109);
INSERT INTO `schedule` VALUES (2021011026, 110);
INSERT INTO `schedule` VALUES (2021011026, 107);
INSERT INTO `schedule` VALUES (2021011026, 105);
INSERT INTO `schedule` VALUES (2021011026, 106);
INSERT INTO `schedule` VALUES (2021011026, 116);
INSERT INTO `schedule` VALUES (2021011026, 113);
INSERT INTO `schedule` VALUES (2021011004, 101);
INSERT INTO `schedule` VALUES (2021011004, 106);
INSERT INTO `schedule` VALUES (2021011004, 110);
INSERT INTO `schedule` VALUES (2021011004, 109);
INSERT INTO `schedule` VALUES (2021011004, 103);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '性别',
  `role` int(2) NOT NULL DEFAULT 0 COMMENT '角色',
  `creationTime` date NOT NULL COMMENT '创建时间',
  `majorId` int(11) NOT NULL DEFAULT 1 COMMENT '专业编号',
  `totalCredits` int(11) NOT NULL DEFAULT 0 COMMENT '总学分',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '照片',
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `xsb_zy_id_fk`(`majorId`) USING BTREE,
  CONSTRAINT `xsb_fk_zyid` FOREIGN KEY (`majorId`) REFERENCES `major` (`majorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2021011165 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1000000001, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', 1, '2021-11-28', 1, 0, '管理员', 'head.jpg');
INSERT INTO `user` VALUES (1000000002, 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '1', 1, '2021-11-11', 1, 0, '管理员', 'head.jpg');
INSERT INTO `user` VALUES (1000000003, 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '1', 1, '2021-11-09', 1, 0, '管理员', 'head.jpg');
INSERT INTO `user` VALUES (1000000004, 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '0', 1, '2021-11-24', 1, 0, '管理员', 'head.jpg');
INSERT INTO `user` VALUES (1000000005, 'admin4', 'e10adc3949ba59abbe56e057f20f883e', '0', 1, '2021-12-22', 1, 0, '管理员', 'head.jpg');
INSERT INTO `user` VALUES (2021011002, '陈明', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1987-10-12', 2, 50, '提前修完数据结构并获得学分', 'head.jpg');
INSERT INTO `user` VALUES (2021011003, '王燕', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1987-10-12', 3, 50, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011004, '魏艳萍', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1987-10-12', 2, 50, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011005, '李芳芳', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1987-03-12', 2, 32, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011007, '东方不败', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '2001-08-12', 1, 52, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011008, '令狐冲', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1987-10-12', 1, 50, '已经提前修完一门课', 'head.jpg');
INSERT INTO `user` VALUES (2021011010, '小师妹', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '2021-10-02', 4, 55, '转专业学习', 'head.jpg');
INSERT INTO `user` VALUES (2021011011, '林一帆', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '2012-02-03', 1, 50, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011012, '张飞', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '2011-02-04', 2, 44, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011013, '王艳艳', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '2011-04-04', 4, 56, '三好生', 'head.jpg');
INSERT INTO `user` VALUES (2021011014, '庞华雨', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-12', 1, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011015, '周志鹏', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-13', 1, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011016, '刘伟', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-14', 1, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011018, '吴斯杰', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-16', 1, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011019, '赖航飞', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-17', 1, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011020, '黄升华', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-18', 1, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011022, '沈泽欣', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-20', 1, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011023, '李华乐', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-21', 1, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011024, '车健华', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-22', 1, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011025, '朱文滨', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-23', 1, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011026, '麦浩城', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-24', 1, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011027, '罗浩智', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-25', 1, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011028, '朱有权', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-26', 1, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011029, '魏敦松', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-27', 1, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011030, '林嘉悦', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-28', 1, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011031, '侯创豪', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-29', 1, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011032, '黄天赐', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-30', 1, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011033, '邓剑', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-10-31', 1, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011034, '钟泽移', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1999-02-03', 1, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011035, '梁英迅', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-03', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011036, '罗中威', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-04', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011037, '汤铖斌', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-05', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011038, '薛魁', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-06', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011039, '徐剑铭', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-07', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011040, '封韵哲', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-08', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011041, '张劲锋', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-09', 2, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011042, '林华沥', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-10', 2, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011043, '纪坤毅', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-11', 2, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011044, '许旺邦', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-12', 2, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011045, '林杰斌', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1988-09-13', 2, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011046, '陈晓鑫', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-14', 2, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011047, '冯才斌', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-15', 2, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011048, '李树新', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-16', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011049, '黄伟强', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-17', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011050, '邸国梁', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-18', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011051, '高金铎', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-19', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011052, '黄振中', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-20', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011053, '肖天河', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-21', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011054, '戴振刚', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-22', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011055, '蓝浩月', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-23', 2, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011056, '陈丹敏', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-24', 2, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011057, '梁珊珊', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-25', 2, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011058, '吴颖怡', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-26', 2, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011059, '林雨婷', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-27', 2, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011060, '金美欣', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-28', 2, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011061, '梁晓榆', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-29', 2, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011062, '邓芷悦', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1988-09-30', 2, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011063, '林妍', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-01', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011064, '戴青', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-02', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011065, '许年钊', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-03', 2, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011066, '梁熠棠', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-04', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011067, '李吻春', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-05', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011068, '陈宇浩', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-06', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011069, '罗昊', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-07', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011070, '冯仕康', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-08', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011071, '陈嘉泽', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-09', 3, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011072, '赵锦杰', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-10', 3, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011073, '朱迪成', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-11', 3, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011074, '谢力行', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-12', 3, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011075, '陈荣基', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-13', 3, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011076, '张劭炜', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-14', 3, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011077, '郑鑫', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-15', 3, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011078, '麦子彬', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-16', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011079, '梁传林', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-17', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011080, '侯飞龙', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-18', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011081, '李东阳', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-19', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011082, '张灯珍', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-20', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011083, '胡景富', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-21', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011084, '刘福翔', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-22', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011085, '陆逊宇', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-23', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011086, '周源昊', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-24', 3, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011087, '陈树耿', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-25', 3, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011088, '邱文斌', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-26', 3, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011089, '叶恒生', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-27', 3, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011090, '曾梓浩', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-28', 3, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011091, '谢锦民', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-29', 3, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011092, '容永康', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1989-07-30', 3, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011093, '陈璟锋', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-01', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011094, '陈伟胜', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-02', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011095, '杨雨轩', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-03', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011096, '骆明金', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-04', 3, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011097, '周裕景', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-05', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011098, '李好', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-06', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011099, '李拓', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-07', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011100, '文国鸿', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-08', 3, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011101, '彭俊浩', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-09', 3, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011102, '梁柏才', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-10', 4, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011103, '胡国泰', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-11', 4, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011104, '曹衡', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-12', 4, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011105, '康成成', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-13', 4, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011106, '彭友能', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-14', 4, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011107, '郭明亮', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-15', 4, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011108, '毛佩珊', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-16', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011109, '杨颖锋', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-17', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011110, '王若楠', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-18', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011111, '赵雯仪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-19', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011112, '唐嘉炜', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-20', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011113, '郑锦茹', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-21', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011114, '梁自能', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-22', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011115, '刘嘉豪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-23', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011116, '李家雄', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-24', 4, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011117, '李宇杰', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-25', 4, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011118, '曾庆龙', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-26', 4, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011119, '肖嘉辉', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-27', 4, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011120, '刘宗峻', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-28', 4, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011121, '吴迪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-29', 4, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011122, '张泽锋', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1990-06-30', 4, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011123, '林楚超', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-01', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011124, '梁宇赐', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-02', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011125, '黄佳奇', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-03', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011126, '黄智豪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-04', 4, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011127, '梁源斌', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-05', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011128, '石孔霖', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-06', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011129, '廖熙洋', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-07', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011130, '高智领', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-08', 4, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011131, '张君涛', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-09', 4, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011132, '何春霖', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-10', 4, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011133, '聂子龙', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-11', 5, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011134, '舒乙青', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-12', 5, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011135, '张高肇', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-13', 5, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011136, '邓智聪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-05-14', 5, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011137, '李嘉浩', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-15', 5, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011138, '李堃俊', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-16', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011139, '骆玮宁', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-17', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011140, '李锦财', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-18', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011141, '谭泽林', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-19', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011142, '李焕滨', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-20', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011143, '李怡达', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-21', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011144, '黄浩', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-22', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011145, '陈诺', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-23', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011146, '卢嘉鹏', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-24', 5, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011147, '马朗瑶', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-25', 5, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011148, '林惜华', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-26', 5, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011149, '谢咏妍', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-27', 5, 44, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011150, '苏倩盈', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-28', 5, 46, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011151, '邓雨虹', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-29', 5, 48, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011152, '邝洁莹', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-05-30', 5, 50, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011153, '张露露', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-04-01', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011154, '梁坚仪', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-04-02', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011155, '林梦妮', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-04-03', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011156, '陆楚唯', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-04-04', 5, 52, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011157, '林美滢', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-04-05', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011158, '王安颖', 'e10adc3949ba59abbe56e057f20f883e', '1', 0, '1991-04-06', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011159, '周子琪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-04-07', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011160, '陈艳仪', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-04-08', 5, 55, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011161, '陈慧璇', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-04-09', 5, 40, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011162, '余钰', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '1991-04-10', 5, 42, '', 'head.jpg');
INSERT INTO `user` VALUES (2021011164, '邓恺璐', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, '2022-05-14', 1, 0, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;