/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : dms

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-02 11:05:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hibernate_sequences
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------
INSERT INTO `hibernate_sequences` VALUES ('ACT_WO_COMMENTS', '1');

-- ----------------------------
-- Table structure for managers
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `MID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `school_number` int(11) NOT NULL COMMENT '学校编号',
  `servers_number` int(11) NOT NULL COMMENT '服务器编号',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '登陆ip',
  `authority` int(11) NOT NULL COMMENT '权限',
  `status` int(11) NOT NULL COMMENT '状态',
  `expire_date` datetime DEFAULT NULL COMMENT '到期时间',
  `login_token` varchar(255) DEFAULT NULL COMMENT '登陆唯一标识',
  `prefix` varchar(255) DEFAULT NULL COMMENT '前缀',
  `verify_username` varchar(255) DEFAULT NULL COMMENT '检测用户名',
  `verify_password` varchar(255) DEFAULT NULL COMMENT '检测密码',
  `token` varchar(255) DEFAULT NULL COMMENT '令牌',
  `db_ip` varchar(255) DEFAULT NULL COMMENT '数据库服务器ip\r\n',
  `db_name` varchar(255) DEFAULT NULL COMMENT '数据库名称',
  `verify_username2` varchar(255) DEFAULT NULL COMMENT '检测用户名2',
  `verify_password2` varchar(255) DEFAULT NULL COMMENT '检测密码2',
  `verify_address2` varchar(255) DEFAULT NULL COMMENT '检测地址2',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodifytime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后编辑时间',
  `display_scname` int(11) DEFAULT NULL COMMENT '是否显示学校名称',
  `open_scrivener` int(11) NOT NULL COMMENT '是否开通写作助手',
  `open_scrivener_time` datetime DEFAULT NULL COMMENT '开通写作助手时间',
  `group_number` int(11) NOT NULL COMMENT '组号',
  `sys_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
  `export_group` int(11) NOT NULL COMMENT '导出组号',
  `admin_sms` varchar(255) DEFAULT NULL COMMENT '管理员短信功能',
  `teacher_sms` varchar(255) DEFAULT NULL COMMENT '教师短信功能',
  `verify_upload` varchar(255) DEFAULT NULL COMMENT '检测上传功能',
  `stu_batch_import` varchar(255) DEFAULT NULL COMMENT '学生批量导入功能',
  `import_stu_max` varchar(255) NOT NULL COMMENT '学生导入最大数',
  `forgot_password` varchar(255) DEFAULT NULL COMMENT '找回密码功能',
  PRIMARY KEY (`MID`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managers
-- ----------------------------
INSERT INTO `managers` VALUES ('6', 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '李院长', '12312312333', 'mail@sina.com', '11', '19', '192.168,22,19', '1', '1', null, null, null, null, null, null, '1.1.1.1', 'beida', null, null, null, '2018-12-04 08:53:09', '2018-12-30 19:48:29', null, '1', null, '1', '1', '1', '1', '1', '1', '11', '11', '111');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, null, '所有', null, null, null, null, '1');
INSERT INTO `menu` VALUES ('2', '/', '/home', 'Home', '首页管理', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '/', '/home', 'Home', '数据库管理', 'fa fa-address-card-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('4', '/', '/home', 'Home', '用户管理', 'fa fa-money', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('5', '/', '/home', 'Home', '日志管理', 'fa fa-bar-chart', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('6', '/', '/home', 'Home', '数据统计', 'fa fa-windows', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('7', '/notice/basic/**', '/general/basic', 'NoticeManager', '短信服务', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('8', '/notice/advanced/**', '/general/adv', 'NoCustomForm', '查看自定义表单', null, null, '1', '3', '0');
INSERT INTO `menu` VALUES ('9', '/thesis/emp/**', '/thesis/report', 'ThesisProposal', '查看开题报告', null, null, '1', '3', '0');
INSERT INTO `menu` VALUES ('10', '/thesis/ec/**', '/thesis/ec', 'ThesisMidCheck', '预览Excel', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('11', '/thesis/train/**', '/thesis/train', 'ThGuidenceRecord', '导出文件', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('12', '/thesis/salary/**', '/thesis/salary', 'ThForeignDoc', '查看外文和原件', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('13', '/thesis/literature/**', '/thesis/mv', 'ThLiteratureView', '数据库列表', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('14', '/account/sob/**', '/account/teacher', 'AcTeacherAccount', '用户列表', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('19', '/statistics/all/**', '/sta/all', 'StSubjectInfo', '管理员日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('21', '/statistics/personnel/**', '/sta/pers', 'StTaskInfo', '导出日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('22', '/statistics/recored/**', '/sta/record', 'StuStatistic', '数据统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('23', '/system/basic/**', '/sys/basic', 'SysBasic', '权限管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('24', '/system/cfg/**', '/sys/cfg', 'SysCfg', '后台接口查看', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('25', '/system/log/**', '/sys/dataWatch', 'SysLog', 'SQL日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('26', '/system/hr/**', '/sys/processManage', 'SysProcessManage', '流程管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('27', '/system/data/**', '/sys/data', 'SysData', '统计列表', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('28', '/system/init/**', '/sys/init', 'SysInit ', '登陆统计列表', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('29', '/system/basic/*', '/role', 'Role', '角色切换', null, null, '1', null, '1');
INSERT INTO `menu` VALUES ('30', '/', '/home', 'Home', '用户设置', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('31', '/system/basic/*', '/sys/resetPassword', 'SysPasswordReset', '查看个人信息', '', null, '1', '30', '1');
INSERT INTO `menu` VALUES ('32', '/system/basic/*', '/sys/allUsers', 'SysAllUseManage', '用户管理', '', null, '1', '30', '1');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1059', '29', '1', null);
INSERT INTO `menu_role` VALUES ('1060', '7', '1', null);
INSERT INTO `menu_role` VALUES ('1061', '10', '1', null);
INSERT INTO `menu_role` VALUES ('1062', '11', '1', null);
INSERT INTO `menu_role` VALUES ('1063', '12', '1', null);
INSERT INTO `menu_role` VALUES ('1064', '13', '1', null);
INSERT INTO `menu_role` VALUES ('1065', '14', '1', null);
INSERT INTO `menu_role` VALUES ('1066', '15', '1', null);
INSERT INTO `menu_role` VALUES ('1067', '16', '1', null);
INSERT INTO `menu_role` VALUES ('1068', '17', '1', null);
INSERT INTO `menu_role` VALUES ('1069', '18', '1', null);
INSERT INTO `menu_role` VALUES ('1070', '21', '1', null);
INSERT INTO `menu_role` VALUES ('1071', '23', '1', null);
INSERT INTO `menu_role` VALUES ('1072', '24', '1', null);
INSERT INTO `menu_role` VALUES ('1073', '25', '1', null);
INSERT INTO `menu_role` VALUES ('1074', '26', '1', null);
INSERT INTO `menu_role` VALUES ('1075', '27', '1', null);
INSERT INTO `menu_role` VALUES ('1076', '28', '1', null);
INSERT INTO `menu_role` VALUES ('1077', '31', '1', null);
INSERT INTO `menu_role` VALUES ('1078', '32', '1', null);
INSERT INTO `menu_role` VALUES ('1100', '29', '2', null);
INSERT INTO `menu_role` VALUES ('1101', '7', '2', null);
INSERT INTO `menu_role` VALUES ('1102', '10', '2', null);
INSERT INTO `menu_role` VALUES ('1103', '11', '2', null);
INSERT INTO `menu_role` VALUES ('1104', '12', '2', null);
INSERT INTO `menu_role` VALUES ('1105', '13', '2', null);
INSERT INTO `menu_role` VALUES ('1106', '14', '2', null);
INSERT INTO `menu_role` VALUES ('1107', '15', '2', null);
INSERT INTO `menu_role` VALUES ('1108', '16', '2', null);
INSERT INTO `menu_role` VALUES ('1109', '17', '2', null);
INSERT INTO `menu_role` VALUES ('1110', '18', '2', null);
INSERT INTO `menu_role` VALUES ('1111', '20', '2', null);
INSERT INTO `menu_role` VALUES ('1112', '23', '2', null);
INSERT INTO `menu_role` VALUES ('1113', '24', '2', null);
INSERT INTO `menu_role` VALUES ('1114', '25', '2', null);
INSERT INTO `menu_role` VALUES ('1115', '26', '2', null);
INSERT INTO `menu_role` VALUES ('1116', '27', '2', null);
INSERT INTO `menu_role` VALUES ('1117', '28', '2', null);
INSERT INTO `menu_role` VALUES ('1118', '31', '2', null);
INSERT INTO `menu_role` VALUES ('1119', '32', '2', null);
INSERT INTO `menu_role` VALUES ('1120', '29', '4', null);
INSERT INTO `menu_role` VALUES ('1121', '7', '4', null);
INSERT INTO `menu_role` VALUES ('1122', '10', '4', null);
INSERT INTO `menu_role` VALUES ('1123', '11', '4', null);
INSERT INTO `menu_role` VALUES ('1124', '12', '4', null);
INSERT INTO `menu_role` VALUES ('1125', '13', '4', null);
INSERT INTO `menu_role` VALUES ('1126', '14', '4', null);
INSERT INTO `menu_role` VALUES ('1127', '15', '4', null);
INSERT INTO `menu_role` VALUES ('1128', '16', '4', null);
INSERT INTO `menu_role` VALUES ('1129', '17', '4', null);
INSERT INTO `menu_role` VALUES ('1130', '18', '4', null);
INSERT INTO `menu_role` VALUES ('1131', '20', '4', null);
INSERT INTO `menu_role` VALUES ('1132', '21', '4', null);
INSERT INTO `menu_role` VALUES ('1133', '22', '4', null);
INSERT INTO `menu_role` VALUES ('1134', '23', '4', null);
INSERT INTO `menu_role` VALUES ('1135', '24', '4', null);
INSERT INTO `menu_role` VALUES ('1136', '25', '4', null);
INSERT INTO `menu_role` VALUES ('1137', '26', '4', null);
INSERT INTO `menu_role` VALUES ('1138', '27', '4', null);
INSERT INTO `menu_role` VALUES ('1139', '28', '4', null);
INSERT INTO `menu_role` VALUES ('1140', '31', '4', null);
INSERT INTO `menu_role` VALUES ('1141', '32', '4', null);
INSERT INTO `menu_role` VALUES ('1142', '29', '3', null);
INSERT INTO `menu_role` VALUES ('1143', '7', '3', null);
INSERT INTO `menu_role` VALUES ('1144', '10', '3', null);
INSERT INTO `menu_role` VALUES ('1145', '11', '3', null);
INSERT INTO `menu_role` VALUES ('1146', '12', '3', null);
INSERT INTO `menu_role` VALUES ('1147', '13', '3', null);
INSERT INTO `menu_role` VALUES ('1148', '14', '3', null);
INSERT INTO `menu_role` VALUES ('1149', '15', '3', null);
INSERT INTO `menu_role` VALUES ('1150', '16', '3', null);
INSERT INTO `menu_role` VALUES ('1151', '17', '3', null);
INSERT INTO `menu_role` VALUES ('1152', '18', '3', null);
INSERT INTO `menu_role` VALUES ('1153', '19', '3', null);
INSERT INTO `menu_role` VALUES ('1154', '20', '3', null);
INSERT INTO `menu_role` VALUES ('1155', '22', '3', null);
INSERT INTO `menu_role` VALUES ('1156', '23', '3', null);
INSERT INTO `menu_role` VALUES ('1157', '24', '3', null);
INSERT INTO `menu_role` VALUES ('1158', '25', '3', null);
INSERT INTO `menu_role` VALUES ('1159', '26', '3', null);
INSERT INTO `menu_role` VALUES ('1160', '27', '3', null);
INSERT INTO `menu_role` VALUES ('1161', '28', '3', null);
INSERT INTO `menu_role` VALUES ('1162', '31', '3', null);
INSERT INTO `menu_role` VALUES ('1163', '32', '3', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_teacher', '开发人员');
INSERT INTO `role` VALUES ('2', 'ROLE_profession', '客服人员');
INSERT INTO `role` VALUES ('3', 'ROLE_acaAdmin', '研发经理');
INSERT INTO `role` VALUES ('4', 'ROLE_uniAdmin', '部门经理');
INSERT INTO `role` VALUES ('20', 'ROLE_newest', 'xinceshisdf');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `log_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operation_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sys_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `operator_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('17', '审核操作', '得到用户拥有的所有角色', '2018-12-30 13:38:36', 'lizhizhong', null, null);
INSERT INTO `sys_log` VALUES ('18', '审核操作', '选择角色', '2018-12-30 13:38:40', 'lizhizhong', null, null);
INSERT INTO `sys_log` VALUES ('19', '审核操作', '获取系统菜单', '2018-12-30 13:38:40', 'lizhizhong', null, null);
INSERT INTO `sys_log` VALUES ('20', '审核操作', '得到用户拥有的所有角色', '2018-12-30 14:21:04', 'lizhizhong', null, '[ROLE_teacher]');
INSERT INTO `sys_log` VALUES ('21', '审核操作', '选择角色', '2018-12-30 14:21:05', 'lizhizhong', null, '[ROLE_teacher]');
INSERT INTO `sys_log` VALUES ('22', '审核操作', '获取系统菜单', '2018-12-30 14:21:05', 'lizhizhong', null, '[ROLE_teacher]');
INSERT INTO `sys_log` VALUES ('23', '审核操作', '得到用户拥有的所有角色', '2018-12-30 14:37:54', 'acaAdmin', null, '[ROLE_acaAdmin]');
INSERT INTO `sys_log` VALUES ('24', '审核操作', '选择角色', '2018-12-30 14:37:55', 'acaAdmin', null, '[ROLE_acaAdmin]');
INSERT INTO `sys_log` VALUES ('25', '审核操作', '获取系统菜单', '2018-12-30 14:37:55', 'acaAdmin', null, '[ROLE_acaAdmin]');
INSERT INTO `sys_log` VALUES ('26', '审核操作', '得到用户拥有的所有角色', '2018-12-30 14:40:33', 'acaAdmin', null, '[ROLE_acaAdmin]');
INSERT INTO `sys_log` VALUES ('27', '审核操作', '选择角色', '2018-12-30 14:40:35', 'acaAdmin', null, '[ROLE_acaAdmin]');
INSERT INTO `sys_log` VALUES ('28', '审核操作', '获取系统菜单', '2018-12-30 14:40:35', 'acaAdmin', null, '[ROLE_acaAdmin]');
INSERT INTO `sys_log` VALUES ('29', '审核操作', '得到用户拥有的所有角色', '2018-12-30 23:02:32', 'acaAdmin', null, '[ROLE_acaAdmin]');

-- ----------------------------
-- Table structure for sys_school
-- ----------------------------
DROP TABLE IF EXISTS `sys_school`;
CREATE TABLE `sys_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL COMMENT '学校编号',
  `school_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学校名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_school
-- ----------------------------

-- ----------------------------
-- Table structure for sys_system
-- ----------------------------
DROP TABLE IF EXISTS `sys_system`;
CREATE TABLE `sys_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) DEFAULT NULL,
  `system_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_system
-- ----------------------------
INSERT INTO `sys_system` VALUES ('1', null, '\n“中国知网”教学改革研究项目管理系统');
INSERT INTO `sys_system` VALUES ('2', null, null);

-- ----------------------------
-- Table structure for tbl_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_plan`;
CREATE TABLE `tbl_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学年id\r\n',
  `school_num` int(11) DEFAULT NULL COMMENT '学校编号',
  `school_year` varchar(255) DEFAULT NULL COMMENT '学年',
  `default` varchar(255) DEFAULT NULL COMMENT '是否默认学年',
  `opentimenode` varchar(255) DEFAULT NULL COMMENT '是否开启时间节点',
  `allowset` varchar(255) DEFAULT NULL COMMENT '是否允许学院设置',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `begintime` datetime DEFAULT NULL COMMENT '学年开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '学年结束时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_plan
-- ----------------------------
INSERT INTO `tbl_plan` VALUES ('1', '1001', '2015-2016', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:49:54');
INSERT INTO `tbl_plan` VALUES ('2', '1001', '2016-2017', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:50:00');
INSERT INTO `tbl_plan` VALUES ('3', '1001', '2017-2018', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:50:00');
INSERT INTO `tbl_plan` VALUES ('4', '1001', '2018-2019', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:50:00');

-- ----------------------------
-- Table structure for tbl_teacher_base
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_base`;
CREATE TABLE `tbl_teacher_base` (
  `TID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sid',
  `uername` varchar(32) NOT NULL COMMENT '登录名',
  `password` varchar(255) NOT NULL COMMENT '登陆密码',
  `school_num` int(11) DEFAULT NULL COMMENT '学校编号',
  `teacher_num` int(11) DEFAULT NULL COMMENT '教师编号',
  `teacher_name` varchar(30) NOT NULL COMMENT '教师姓名',
  `academic_degree` varchar(255) DEFAULT NULL COMMENT '学位',
  `graduated_university` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `sex` tinyint(255) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `status` varchar(50) DEFAULT NULL COMMENT '状态',
  `login_token` varchar(255) DEFAULT NULL COMMENT '登陆标识',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CID` varchar(50) DEFAULT NULL COMMENT 'cid',
  `APP_KEY` varchar(255) DEFAULT NULL COMMENT 'app密令',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_teacher_base
-- ----------------------------
INSERT INTO `tbl_teacher_base` VALUES ('3', 'uniAdmin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '李某某', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'limoumou@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', null, null, '2018-12-27 17:04:14', '4');
INSERT INTO `tbl_teacher_base` VALUES ('4', 'lizhizhong', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '李志钟', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'lizhizhong@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2018-12-25 15:17:34', '4');
INSERT INTO `tbl_teacher_base` VALUES ('5', 'profession', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '张三', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'zhangsan@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2018-12-26 16:11:23', '4');
INSERT INTO `tbl_teacher_base` VALUES ('6', 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '王五', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'wangwu@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-01 20:08:54', '4');
INSERT INTO `tbl_teacher_base` VALUES ('7', 'zhaoliu', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '赵六', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'zhaoliu@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2018-12-24 14:51:18', '4');
INSERT INTO `tbl_teacher_base` VALUES ('8', 'zhouqi', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '周七', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'zhouqi@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2018-12-24 14:51:13', '4');

-- ----------------------------
-- Table structure for tran_teacher_resume
-- ----------------------------
DROP TABLE IF EXISTS `tran_teacher_resume`;
CREATE TABLE `tran_teacher_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL COMMENT '教师ID',
  `school` varchar(255) DEFAULT NULL COMMENT '所在单位',
  `teache_object` varchar(255) DEFAULT NULL COMMENT '授课对象',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tran_teacher_resume
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('75', '3', '4');
INSERT INTO `user_role` VALUES ('77', '4', '1');
INSERT INTO `user_role` VALUES ('78', '5', '2');
INSERT INTO `user_role` VALUES ('79', '5', '1');
INSERT INTO `user_role` VALUES ('80', '6', '3');
INSERT INTO `user_role` VALUES ('81', '7', '3');
INSERT INTO `user_role` VALUES ('82', '8', '4');
