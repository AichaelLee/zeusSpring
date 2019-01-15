/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : dms

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-15 14:57:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for flow_attr
-- ----------------------------
DROP TABLE IF EXISTS `flow_attr`;
CREATE TABLE `flow_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attr_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `max_length` double DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `check_js` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_attr
-- ----------------------------

-- ----------------------------
-- Table structure for flow_form
-- ----------------------------
DROP TABLE IF EXISTS `flow_form`;
CREATE TABLE `flow_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `html_form` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_form
-- ----------------------------

-- ----------------------------
-- Table structure for flow_form_attr
-- ----------------------------
DROP TABLE IF EXISTS `flow_form_attr`;
CREATE TABLE `flow_form_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `attr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_form_attr
-- ----------------------------

-- ----------------------------
-- Table structure for flow_form_content
-- ----------------------------
DROP TABLE IF EXISTS `flow_form_content`;
CREATE TABLE `flow_form_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `attr_id` int(11) DEFAULT NULL,
  `attr_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `operationLog_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_form_content
-- ----------------------------

-- ----------------------------
-- Table structure for flow_step
-- ----------------------------
DROP TABLE IF EXISTS `flow_step`;
CREATE TABLE `flow_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_step
-- ----------------------------

-- ----------------------------
-- Table structure for flow_step_check_state
-- ----------------------------
DROP TABLE IF EXISTS `flow_step_check_state`;
CREATE TABLE `flow_step_check_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isEnd` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operationlog_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `auditor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_step_check_state
-- ----------------------------

-- ----------------------------
-- Table structure for flow_step_rule
-- ----------------------------
DROP TABLE IF EXISTS `flow_step_rule`;
CREATE TABLE `flow_step_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) DEFAULT NULL,
  `attr_id` int(11) DEFAULT NULL,
  `operators` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `threshold` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `next_step` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of flow_step_rule
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, null, '所有', null, null, null, null, '1');
INSERT INTO `menu` VALUES ('2', '/', '/home', 'Home', '用户设置', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '/', '/home', 'Home', '账号管理', 'fa fa-address-card-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('4', '/', '/home', 'Home', '数据库管理', 'fa fa-money', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('5', '/', '/home', 'Home', '日志管理', 'fa fa-bar-chart', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('6', '/', '/home', 'Home', '用户管理', 'fa fa-windows', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('7', '/notice/basic/**', '/general/basic', 'NoticeManager', '修改密码', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('8', '/notice/advanced/**', '/general/adv', 'NoCustomForm', '查看自定义表单', null, null, '1', '3', '0');
INSERT INTO `menu` VALUES ('9', '/thesis/emp/**', '/thesis/report', 'ThesisProposal', '查看开题报告', null, null, '1', '3', '0');
INSERT INTO `menu` VALUES ('10', '/thesis/ec/**', '/thesis/ec', 'ThesisMidCheck', '表格预览', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('11', '/thesis/train/**', '/thesis/train', 'ThGuidenceRecord', '导出文件', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('12', '/thesis/salary/**', '/thesis/salary', 'ThForeignDoc', '查看外文和原件', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('13', '/thesis/literature/**', '/thesis/mv', 'ThLiteratureView', '数据库列表', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('14', '/account/sob/**', '/account/teacher', 'AcTeacherAccount', '用户列表', null, null, '1', null, '1');
INSERT INTO `menu` VALUES ('19', '/statistics/all/**', '/sta/all', 'StLogView', '管理员日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('21', '/statistics/personnel/**', '/sta/pers', 'StTaskInfo', 'SQL日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('22', '/statistics/recored/**', '/sta/record', 'StuStatistic', '用户操作日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('23', '/system/basic/**', '/sys/basic', 'SysBasic', '权限管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('24', '/system/cfg/**', '/sys/cfg', 'SysCfg', '后台接口查看', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('25', '/system/log/**', '/sys/dataWatch', 'SysLog', 'SQL日志', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('26', '/system/hr/**', '/sys/processManage', 'SysProcessManage', '流程管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('27', '/system/data/**', '/sys/data', 'SysData', '统计列表', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('28', '/system/init/**', '/sys/init', 'SysInit ', '登陆统计列表', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('29', '/system/basic/*', '/role', 'Role', '角色切换', null, null, '1', null, '1');
INSERT INTO `menu` VALUES ('30', '/', '/home', 'Home', 'APP服务', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('31', '/system/basic/*', '/sys/resetPassword', 'SysPasswordReset', '查看个人信息', '', null, '1', '30', '1');
INSERT INTO `menu` VALUES ('32', '/system/basic/*', '/sys/allUsers', 'SysAllUseManage', '用户管理', '', null, '1', '30', '1');
INSERT INTO `menu` VALUES ('33', '/system/basic/*', '/sys/menuManage', 'AcMenuManage', '菜单管理', '', null, '1', null, '1');
INSERT INTO `menu` VALUES ('34', '/', '/home', 'Home', 'APP121212务', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('35', '/', '/home', 'Home', '微信服务', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('36', '/', '/home', 'Home', '短信服务', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('37', '/', '/home', 'Home', '数据统计', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('38', '/', '/home', 'Home', 'CO升级服务', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('42', '/statistics/personnel/**', '/sta/log4net', 'StLogView', 'Log4Net', '', null, '1', '5', '1');
INSERT INTO `menu` VALUES ('43', '/statistics/personnel/**', '/sta/appLog', 'StLogView', 'APP日志', '', null, '1', '5', '1');
INSERT INTO `menu` VALUES ('44', '/statistics/personnel/**', '/sta/bindOpeLog', 'StLogView', '绑定手机日志', '', null, '1', '5', '1');
INSERT INTO `menu` VALUES ('45', '/statistics/personnel/**', '/sta/mobileLog', 'StLogView', '手机操作日志', '', null, '1', '5', '1');
INSERT INTO `menu` VALUES ('46', '/statistics/personnel/**', '/sta/updateConfig', 'StLogView', '升级配置', '', null, '1', '38', '1');
INSERT INTO `menu` VALUES ('47', '/statistics/personnel/**', '/sta/updatePkg', 'StLogView', '升级包', '', null, '1', '38', '1');
INSERT INTO `menu` VALUES ('48', '/statistics/personnel/**', '/sta/wechatUserList', 'StLogView', '微信绑定用户列表', '', null, '1', '35', '1');
INSERT INTO `menu` VALUES ('49', '/statistics/personnel/**', '/sta/smsUserList', 'StLogView', '短信用户列表', '', null, '1', '36', '1');
INSERT INTO `menu` VALUES ('50', '/statistics/personnel/**', '/sta/smsList', 'StLogView', '短信列表', '', null, '1', '36', '1');
INSERT INTO `menu` VALUES ('51', '/statistics/personnel/**', '/sta/smsPlatformList', 'StLogView', '短信平台列表', '', null, '1', '36', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8;

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
INSERT INTO `menu_role` VALUES ('1164', '33', '3', null);
INSERT INTO `menu_role` VALUES ('1165', '34', '3', null);
INSERT INTO `menu_role` VALUES ('1166', '35', '3', null);
INSERT INTO `menu_role` VALUES ('1167', '36', '3', null);
INSERT INTO `menu_role` VALUES ('1168', '37', '3', null);
INSERT INTO `menu_role` VALUES ('1169', '38', '3', null);
INSERT INTO `menu_role` VALUES ('1170', '39', '3', null);
INSERT INTO `menu_role` VALUES ('1171', '42', '3', null);
INSERT INTO `menu_role` VALUES ('1172', '43', '3', null);
INSERT INTO `menu_role` VALUES ('1173', '44', '3', null);
INSERT INTO `menu_role` VALUES ('1174', '45', '3', null);
INSERT INTO `menu_role` VALUES ('1175', '46', '3', null);
INSERT INTO `menu_role` VALUES ('1176', '47', '3', null);
INSERT INTO `menu_role` VALUES ('1177', '48', '3', null);
INSERT INTO `menu_role` VALUES ('1178', '49', '3', null);
INSERT INTO `menu_role` VALUES ('1179', '50', '3', null);
INSERT INTO `menu_role` VALUES ('1180', '51', '3', null);
INSERT INTO `menu_role` VALUES ('1181', '52', '3', null);
INSERT INTO `menu_role` VALUES ('1182', '53', '3', null);

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
  `ip_address` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'P地址I',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('190', '登录操作', '王五 用户登录成功', '2019-01-07 09:13:35', '王五', null, '研发经理', null);
INSERT INTO `sys_log` VALUES ('191', '登录操作', '王五 用户登录成功', '2019-01-07 09:15:46', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('192', '登录操作', '王五 用户登录成功', '2019-01-08 09:26:09', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('193', '登录操作', '王五 用户登录成功', '2019-01-08 09:31:50', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('194', '登录操作', '王五 用户登录成功', '2019-01-08 09:32:49', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('195', '登录操作', '王五 用户登录成功', '2019-01-08 09:37:58', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('196', '登录操作', '王五 用户登录成功', '2019-01-08 09:38:55', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('197', '流程操作', '查询系统中的所有用户', '2019-01-08 09:39:00', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('198', '流程操作', '查询系统中的所有用户', '2019-01-08 09:39:06', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('199', '登录操作', '王五 用户登录成功', '2019-01-08 09:40:11', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('200', '流程操作', '查询系统中的所有用户', '2019-01-08 09:42:51', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('201', '登录操作', '王五 用户登录成功', '2019-01-08 10:33:56', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('202', '流程操作', '查询系统中的所有用户', '2019-01-08 10:38:15', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('203', '登录操作', '王五 用户登录成功', '2019-01-08 11:17:03', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('204', '登录操作', '王五 用户登录成功', '2019-01-08 13:03:28', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('205', '登录操作', '王五 用户登录成功', '2019-01-11 16:57:41', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('206', '流程操作', '查询系统中的所有用户', '2019-01-11 16:58:05', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('207', '登录操作', '王五 用户登录成功', '2019-01-11 16:59:51', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('208', '登录操作', '王五 用户登录成功', '2019-01-14 08:56:12', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('209', '登录操作', '王五 用户登录成功', '2019-01-14 09:33:30', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('210', '登录操作', '王五 用户登录成功', '2019-01-14 10:19:02', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('211', '登录操作', '王五 用户登录成功', '2019-01-14 10:21:34', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('212', '登录操作', '王五 用户登录成功', '2019-01-14 10:21:54', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('213', '登录操作', '王五 用户登录成功', '2019-01-14 10:22:10', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('214', '登录操作', '王五 用户登录成功', '2019-01-14 10:23:50', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('215', '登录操作', '王五 用户登录成功', '2019-01-14 10:27:38', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('216', '登录操作', '王五 用户登录成功', '2019-01-14 10:30:31', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('217', '登录操作', '王五 用户登录成功', '2019-01-14 10:31:05', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('218', '登录操作', '王五 用户登录成功', '2019-01-14 10:31:30', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('219', '登录操作', '王五 用户登录成功', '2019-01-14 10:34:27', '王五', null, '研发经理', '192.168.25.84');
INSERT INTO `sys_log` VALUES ('220', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:14:23', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('221', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:14:45', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('222', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:14:55', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('223', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:15:29', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('224', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:16:47', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('225', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:25:28', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('226', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:25:50', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('227', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:25:57', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('228', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:26:09', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('229', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:26:24', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('230', '登录操作', '王五 用户登录成功', '2019-01-14 16:26:59', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('231', '登录操作', '王五 用户登录成功', '2019-01-14 16:46:40', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('232', '登录操作', '王五 用户登录成功', '2019-01-14 16:57:03', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('233', '登录操作', '王五 用户登录成功', '2019-01-15 09:03:58', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('234', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:04:06', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('235', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:07:32', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('236', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:07:46', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('237', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:09:48', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('238', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:10:38', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('239', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:12:31', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('240', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:17:45', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('241', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:18:16', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('242', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:18:23', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('243', '登录操作', '王五 用户登录成功', '2019-01-15 10:26:55', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('244', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:27:01', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('245', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:27:12', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('246', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:28:42', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('247', '登录操作', '王五 用户登录成功', '2019-01-15 10:28:46', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('248', '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-15 10:32:03', null, null, '未知', null);
INSERT INTO `sys_log` VALUES ('249', '登录操作', '王五 用户登录成功', '2019-01-15 10:33:02', '王五', null, '研发经理', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('250', '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:36:30', null, null, '未知', null);

-- ----------------------------
-- Table structure for sys_school
-- ----------------------------
DROP TABLE IF EXISTS `sys_school`;
CREATE TABLE `sys_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL COMMENT '学校编号',
  `school_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学校名称',
  `domain_prefix` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '域名前綴',
  `database_ip_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库服务器ip对应的datasource表中的key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_school
-- ----------------------------
INSERT INTO `sys_school` VALUES ('1', '1', '中国人民大学', 'ccpy', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_system
-- ----------------------------
DROP TABLE IF EXISTS `sys_system`;
CREATE TABLE `sys_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) DEFAULT NULL,
  `system_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `system_domainAlies` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '系统域名别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_system
-- ----------------------------
INSERT INTO `sys_system` VALUES ('1', '1', '\n“中国知网”教学改革研究项目管理系统', null);
INSERT INTO `sys_system` VALUES ('2', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_teacher_base
-- ----------------------------
INSERT INTO `tbl_teacher_base` VALUES ('3', 'uniAdmin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '李某某', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'limoumou@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', null, null, '2018-12-27 17:04:14', '4');
INSERT INTO `tbl_teacher_base` VALUES ('4', 'lizhizhong', '$2a$2a$10$A6uaRwrmg8eNf4Es7A62luOcxWTMogwq.USEUtUVnppWpJFuvaoU2', '1', '1', '阿斯顿发生的大师傅', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'lizhizhong@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-04 15:42:36', '4');
INSERT INTO `tbl_teacher_base` VALUES ('5', 'profession', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '张三', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'zhangsan@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2018-12-26 16:11:23', '4');
INSERT INTO `tbl_teacher_base` VALUES ('6', 'admin', '$2a$10$dkfC/5xDiC/l9dqnyQVrdu72TUj4o49tSpmIe0xoKwjpv8hTDCHrO', '1', '1', '王五', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'wangwu@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-04 16:19:34', '4');
INSERT INTO `tbl_teacher_base` VALUES ('7', 'zhaoliu', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', '赵六', '博士', '北京大学', '教授', '博士', '1', '49', '12312311111', 'zhaoliu@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2018-12-24 14:51:18', '4');
INSERT INTO `tbl_teacher_base` VALUES ('8', 'zhouqi', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '1', '1', 'hahahahahahahahahahahahaah', null, null, null, '博士', '1', '49', '12312311111', 'zhouqi@sina.com', '1', 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-04 14:37:57', '4');
INSERT INTO `tbl_teacher_base` VALUES ('13', 'test', '$2a$10$A6uaRwrmg8eNf4Es7A62luOcxWTMogwq.USEUtUVnppWpJFuvaoU2', null, null, 'testsetset', null, null, null, null, null, null, null, null, null, null, '2019-01-04 15:42:25', null, null, '2019-01-04 15:42:25', null);

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
