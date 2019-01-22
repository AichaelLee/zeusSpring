/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : dms

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/01/2019 14:10:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flow_attr
-- ----------------------------
DROP TABLE IF EXISTS `flow_attr`;
CREATE TABLE `flow_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `attr_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `max_length` double NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `check_js` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_de_model
-- ----------------------------
DROP TABLE IF EXISTS `flow_de_model`;
CREATE TABLE `flow_de_model`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model_key` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model_comment` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(6) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_updated` datetime(6) NULL DEFAULT NULL,
  `last_updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `model_editor_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thumbnail` longblob NULL,
  `model_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_proc_mod_created`(`created_by`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_form
-- ----------------------------
DROP TABLE IF EXISTS `flow_form`;
CREATE TABLE `flow_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `html_form` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `proc_def_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297509 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_form
-- ----------------------------
INSERT INTO `flow_form` VALUES (297508, '立项审批流程', '立项材料准备->资格审核->立项初审->立项评审->结束', '1', '2019-01-16 17:25:49', NULL, 'proposal_process:');

-- ----------------------------
-- Table structure for flow_form_attr
-- ----------------------------
DROP TABLE IF EXISTS `flow_form_attr`;
CREATE TABLE `flow_form_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NULL DEFAULT NULL,
  `attr_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_form_content
-- ----------------------------
DROP TABLE IF EXISTS `flow_form_content`;
CREATE TABLE `flow_form_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NULL DEFAULT NULL,
  `attr_id` int(11) NULL DEFAULT NULL,
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `operationLog_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `operation_id` int(11) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `flow_hi_taskinst`;
CREATE TABLE `flow_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程定义id',
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `flow_re_procdef`;
CREATE TABLE `flow_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `flow_ru_execution`;
CREATE TABLE `flow_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `flow_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `flow_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `flow_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `flow_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `flow_ru_identitylink`;
CREATE TABLE `flow_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `flow_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `flow_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `flow_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_ru_task`;
CREATE TABLE `flow_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_ru_task
-- ----------------------------
INSERT INTO `flow_ru_task` VALUES ('297528', 1, '297510', '297508', 'proposal_process:', '立项材料审批', '', '', 'sid-614299F0-3C68-497E-84E6-E7C48C2E2F3C', '', 'lizhizhong', '', 50, '2019-01-09 13:28:26.000', '2019-01-16 17:37:18.000', '', 1, '', 'profession_review', '2019-01-16 17:37:37.000');
INSERT INTO `flow_ru_task` VALUES ('297529', 1, '297511', '293453', 'proposal_process:', '资格审核', '', '', 'sid-614299F0-3C68-497E-84E6-E7C48C2E2F3C', '', 'ROLE_ACADMIN', '', 50, '2019-01-09 13:28:26.000', '2019-01-16 17:37:18.000', '', 1, '', 'profession_review', '2019-01-16 17:37:37.000');

-- ----------------------------
-- Table structure for flow_step
-- ----------------------------
DROP TABLE IF EXISTS `flow_step`;
CREATE TABLE `flow_step`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `form_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10006 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_step
-- ----------------------------
INSERT INTO `flow_step` VALUES (10001, '立项材料准备', '哈哈，谁都别拦我，这个节点我要指派给发起人', 297508, NULL);
INSERT INTO `flow_step` VALUES (10002, '资格审核', '嗯嗯，这个节点是院长审核，如果院长通过了就指派给特定专家', 297508, 1);
INSERT INTO `flow_step` VALUES (10003, '立项初审', '这个具体指派人呢，应该是院长指定的院内专家去干这件事', 297508, 2);
INSERT INTO `flow_step` VALUES (10004, '立项评审', '这个指派人呢，应该也是，但是别忘了啊亲们，没准有的学校就是逮住谁就谁审批，要留意点！', 297508, 3);
INSERT INTO `flow_step` VALUES (10005, '结束', '好了，立项审批流程的完美结束', 297508, NULL);

-- ----------------------------
-- Table structure for flow_step_check_state
-- ----------------------------
DROP TABLE IF EXISTS `flow_step_check_state`;
CREATE TABLE `flow_step_check_state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `isEnd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `operationlog_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `operation_id` int(11) NULL DEFAULT NULL,
  `auditor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_step_check_state
-- ----------------------------
INSERT INTO `flow_step_check_state` VALUES (1, 1, '1', '2019-01-24 17:24:45', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for flow_step_rule
-- ----------------------------
DROP TABLE IF EXISTS `flow_step_rule`;
CREATE TABLE `flow_step_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) NULL DEFAULT NULL,
  `attr_id` int(11) NULL DEFAULT NULL,
  `operators` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `threshold` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `next_step` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_step_rule
-- ----------------------------
INSERT INTO `flow_step_rule` VALUES (1, 10001, NULL, '发起人自己干', NULL, '10002');
INSERT INTO `flow_step_rule` VALUES (2, 10002, NULL, '额，刚才那个表都说了，院管理员干，但是这是可以自定义的哦', NULL, '10003');
INSERT INTO `flow_step_rule` VALUES (3, 10003, NULL, '院专家', NULL, '10004');
INSERT INTO `flow_step_rule` VALUES (4, 10004, NULL, '专家', NULL, '10005');
INSERT INTO `flow_step_rule` VALUES (5, 10005, NULL, '下一步0就是结束啦！', NULL, '0');

-- ----------------------------
-- Table structure for hibernate_sequences
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences`  (
  `sequence_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence_next_hi_value` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------
INSERT INTO `hibernate_sequences` VALUES ('ACT_WO_COMMENTS', 1);

-- ----------------------------
-- Table structure for jg_log_err
-- ----------------------------
DROP TABLE IF EXISTS `jg_log_err`;
CREATE TABLE `jg_log_err`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` datetime(0) NULL DEFAULT NULL,
  `thread` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `logger` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `line_number` int(11) NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `exception` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `app_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jg_log_err
-- ----------------------------
INSERT INTO `jg_log_err` VALUES (1, '2019-01-22 13:11:41', 'XNIO-2 task-27', NULL, 'error', 'net.cnki.controller.system.SystemControllertestLog', 160, '好嘛，居然出错了', '[Ljava.lang.StackTraceElement;@baaedb9', NULL);
INSERT INTO `jg_log_err` VALUES (2, '2019-01-22 13:13:52', 'XNIO-2 task-1', NULL, 'error', 'net.cnki.controller.system.SystemControllertestLog.', 160, '好嘛，居然出错了', 'CnkiBizException', NULL);

-- ----------------------------
-- Table structure for managers
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers`  (
  `MID` int(11) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `school_number` int(11) NOT NULL COMMENT '学校编号',
  `servers_number` int(11) NOT NULL COMMENT '服务器编号',
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆ip',
  `authority` int(11) NOT NULL COMMENT '权限',
  `status` int(11) NOT NULL COMMENT '状态',
  `expire_date` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `login_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆唯一标识',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀',
  `verify_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测用户名',
  `verify_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测密码',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '令牌',
  `db_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库服务器ip\r\n',
  `db_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `verify_username2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测用户名2',
  `verify_password2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测密码2',
  `verify_address2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测地址2',
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `lastmodifytime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后编辑时间',
  `display_scname` int(11) NULL DEFAULT NULL COMMENT '是否显示学校名称',
  `open_scrivener` int(11) NOT NULL COMMENT '是否开通写作助手',
  `open_scrivener_time` datetime(0) NULL DEFAULT NULL COMMENT '开通写作助手时间',
  `group_number` int(11) NOT NULL COMMENT '组号',
  `sys_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `export_group` int(11) NOT NULL COMMENT '导出组号',
  `admin_sms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员短信功能',
  `teacher_sms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师短信功能',
  `verify_upload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测上传功能',
  `stu_batch_import` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生批量导入功能',
  `import_stu_max` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生导入最大数',
  `forgot_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找回密码功能',
  PRIMARY KEY (`MID`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of managers
-- ----------------------------
INSERT INTO `managers` VALUES (6, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', '李院长', '12312312333', 'mail@sina.com', 11, 19, '192.168,22,19', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1.1.1.1', 'beida', NULL, NULL, NULL, '2018-12-04 08:53:09', '2018-12-30 19:48:29', NULL, 1, NULL, 1, '1', 1, '1', '1', '1', '11', '11', '111');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint(1) NULL DEFAULT NULL,
  `requireAuth` tinyint(1) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, NULL, '所有', NULL, NULL, NULL, NULL, 1);
INSERT INTO `menu` VALUES (2, '/', '/home', 'Home', '用户设置', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (3, '/', '/home', 'Home', '账号管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (4, '/', '/home', 'Home', '数据库管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (5, '/', '/home', 'Home', '日志管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (6, '/', '/home', 'Home', '用户管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (7, '/notice/basic/**', '/general/basic', 'NoticeManager', '修改密码', NULL, NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (8, '/notice/advanced/**', '/general/adv', 'NoCustomForm', '查看自定义表单', NULL, NULL, 1, 3, 0);
INSERT INTO `menu` VALUES (9, '/thesis/emp/**', '/thesis/report', 'ThesisProposal', '查看开题报告', NULL, NULL, 1, 3, 0);
INSERT INTO `menu` VALUES (10, '/thesis/ec/**', '/thesis/ec', 'ThesisMidCheck', '表格预览', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (11, '/thesis/train/**', '/thesis/train', 'ThGuidenceRecord', '导出文件', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (12, '/thesis/salary/**', '/thesis/salary', 'ThForeignDoc', '查看外文和原件', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (13, '/thesis/literature/**', '/thesis/mv', 'ThLiteratureView', '数据库列表', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (14, '/account/sob/**', '/account/teacher', 'AcTeacherAccount', '用户列表', NULL, NULL, 1, NULL, 1);
INSERT INTO `menu` VALUES (19, '/statistics/all/**', '/sta/all', 'StLogView', '管理员日志', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StTaskInfo', 'SQL日志', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (22, '/statistics/recored/**', '/sta/record', 'StuStatistic', '用户操作日志', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '权限管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '后台接口查看', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (25, '/system/log/**', '/sys/dataWatch', 'SysLog', 'SQL日志', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (26, '/system/hr/**', '/sys/processManage', 'SysProcessManage', '流程管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (27, '/system/data/**', '/sys/data', 'SysData', '统计列表', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (28, '/system/init/**', '/sys/init', 'SysInit ', '登陆统计列表', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (29, '/system/basic/*', '/role', 'Role', '角色切换', NULL, NULL, 1, NULL, 1);
INSERT INTO `menu` VALUES (30, '/', '/home', 'Home', 'APP服务', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (31, '/system/basic/*', '/sys/resetPassword', 'SysPasswordReset', '查看个人信息', '', NULL, 1, 30, 1);
INSERT INTO `menu` VALUES (32, '/system/basic/*', '/sys/allUsers', 'SysAllUseManage', '用户管理', '', NULL, 1, 30, 1);
INSERT INTO `menu` VALUES (33, '/system/basic/*', '/sys/menuManage', 'AcMenuManage', '菜单管理', '', NULL, 1, NULL, 1);
INSERT INTO `menu` VALUES (34, '/', '/home', 'Home', 'APP121212务', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (35, '/', '/home', 'Home', '微信服务', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (36, '/', '/home', 'Home', '短信服务', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (37, '/', '/home', 'Home', '数据统计', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (38, '/', '/home', 'Home', 'CO升级服务', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (42, '/statistics/personnel/**', '/sta/log4net', 'StLogView', 'Log4Net', '', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (43, '/statistics/personnel/**', '/sta/appLog', 'StLogView', 'APP日志', '', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (44, '/statistics/personnel/**', '/sta/bindOpeLog', 'StLogView', '绑定手机日志', '', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (45, '/statistics/personnel/**', '/sta/mobileLog', 'StLogView', '手机操作日志', '', NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (46, '/statistics/personnel/**', '/sta/updateConfig', 'StLogView', '升级配置', '', NULL, 1, 38, 1);
INSERT INTO `menu` VALUES (47, '/statistics/personnel/**', '/sta/updatePkg', 'StLogView', '升级包', '', NULL, 1, 38, 1);
INSERT INTO `menu` VALUES (48, '/statistics/personnel/**', '/sta/wechatUserList', 'StLogView', '微信绑定用户列表', '', NULL, 1, 35, 1);
INSERT INTO `menu` VALUES (49, '/statistics/personnel/**', '/sta/smsUserList', 'StLogView', '短信用户列表', '', NULL, 1, 36, 1);
INSERT INTO `menu` VALUES (50, '/statistics/personnel/**', '/sta/smsList', 'StLogView', '短信列表', '', NULL, 1, 36, 1);
INSERT INTO `menu` VALUES (51, '/statistics/personnel/**', '/sta/smsPlatformList', 'StLogView', '短信平台列表', '', NULL, 1, 36, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  `userType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1227 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1120, 29, 4, NULL);
INSERT INTO `menu_role` VALUES (1121, 7, 4, NULL);
INSERT INTO `menu_role` VALUES (1122, 10, 4, NULL);
INSERT INTO `menu_role` VALUES (1123, 11, 4, NULL);
INSERT INTO `menu_role` VALUES (1124, 12, 4, NULL);
INSERT INTO `menu_role` VALUES (1125, 13, 4, NULL);
INSERT INTO `menu_role` VALUES (1126, 14, 4, NULL);
INSERT INTO `menu_role` VALUES (1127, 15, 4, NULL);
INSERT INTO `menu_role` VALUES (1128, 16, 4, NULL);
INSERT INTO `menu_role` VALUES (1129, 17, 4, NULL);
INSERT INTO `menu_role` VALUES (1130, 18, 4, NULL);
INSERT INTO `menu_role` VALUES (1131, 20, 4, NULL);
INSERT INTO `menu_role` VALUES (1132, 21, 4, NULL);
INSERT INTO `menu_role` VALUES (1133, 22, 4, NULL);
INSERT INTO `menu_role` VALUES (1134, 23, 4, NULL);
INSERT INTO `menu_role` VALUES (1135, 24, 4, NULL);
INSERT INTO `menu_role` VALUES (1136, 25, 4, NULL);
INSERT INTO `menu_role` VALUES (1137, 26, 4, NULL);
INSERT INTO `menu_role` VALUES (1138, 27, 4, NULL);
INSERT INTO `menu_role` VALUES (1139, 28, 4, NULL);
INSERT INTO `menu_role` VALUES (1140, 31, 4, NULL);
INSERT INTO `menu_role` VALUES (1141, 32, 4, NULL);
INSERT INTO `menu_role` VALUES (1185, 29, 1, NULL);
INSERT INTO `menu_role` VALUES (1186, 7, 1, NULL);
INSERT INTO `menu_role` VALUES (1187, 10, 1, NULL);
INSERT INTO `menu_role` VALUES (1188, 13, 1, NULL);
INSERT INTO `menu_role` VALUES (1189, 29, 20, NULL);
INSERT INTO `menu_role` VALUES (1190, 7, 20, NULL);
INSERT INTO `menu_role` VALUES (1191, 10, 20, NULL);
INSERT INTO `menu_role` VALUES (1192, 11, 20, NULL);
INSERT INTO `menu_role` VALUES (1193, 12, 20, NULL);
INSERT INTO `menu_role` VALUES (1194, 13, 20, NULL);
INSERT INTO `menu_role` VALUES (1195, 29, 3, NULL);
INSERT INTO `menu_role` VALUES (1196, 7, 3, NULL);
INSERT INTO `menu_role` VALUES (1197, 10, 3, NULL);
INSERT INTO `menu_role` VALUES (1198, 11, 3, NULL);
INSERT INTO `menu_role` VALUES (1199, 12, 3, NULL);
INSERT INTO `menu_role` VALUES (1200, 13, 3, NULL);
INSERT INTO `menu_role` VALUES (1201, 19, 3, NULL);
INSERT INTO `menu_role` VALUES (1202, 21, 3, NULL);
INSERT INTO `menu_role` VALUES (1203, 22, 3, NULL);
INSERT INTO `menu_role` VALUES (1204, 25, 3, NULL);
INSERT INTO `menu_role` VALUES (1205, 42, 3, NULL);
INSERT INTO `menu_role` VALUES (1206, 43, 3, NULL);
INSERT INTO `menu_role` VALUES (1207, 44, 3, NULL);
INSERT INTO `menu_role` VALUES (1208, 45, 3, NULL);
INSERT INTO `menu_role` VALUES (1209, 23, 3, NULL);
INSERT INTO `menu_role` VALUES (1210, 24, 3, NULL);
INSERT INTO `menu_role` VALUES (1211, 26, 3, NULL);
INSERT INTO `menu_role` VALUES (1212, 27, 3, NULL);
INSERT INTO `menu_role` VALUES (1213, 28, 3, NULL);
INSERT INTO `menu_role` VALUES (1214, 31, 3, NULL);
INSERT INTO `menu_role` VALUES (1215, 32, 3, NULL);
INSERT INTO `menu_role` VALUES (1216, 46, 3, NULL);
INSERT INTO `menu_role` VALUES (1217, 47, 3, NULL);
INSERT INTO `menu_role` VALUES (1218, 48, 3, NULL);
INSERT INTO `menu_role` VALUES (1219, 49, 3, NULL);
INSERT INTO `menu_role` VALUES (1220, 50, 3, NULL);
INSERT INTO `menu_role` VALUES (1221, 51, 3, NULL);
INSERT INTO `menu_role` VALUES (1222, 29, 2, NULL);
INSERT INTO `menu_role` VALUES (1223, 7, 2, NULL);
INSERT INTO `menu_role` VALUES (1224, 10, 2, NULL);
INSERT INTO `menu_role` VALUES (1225, 11, 2, NULL);
INSERT INTO `menu_role` VALUES (1226, 12, 2, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_teacher', '开发人员');
INSERT INTO `role` VALUES (2, 'ROLE_profession', '客服人员');
INSERT INTO `role` VALUES (3, 'ROLE_acaAdmin', '研发经理');
INSERT INTO `role` VALUES (4, 'ROLE_uniAdmin', '部门经理');
INSERT INTO `role` VALUES (20, 'ROLE_newest', 'xinceshisdf');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `log_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `operation_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sys_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operator_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'P地址I',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `school_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2127 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (190, '登录操作', '王五 用户登录成功', '2019-01-07 09:13:35', '王五', NULL, '研发经理', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (191, '登录操作', '王五 用户登录成功', '2019-01-07 09:15:46', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (192, '登录操作', '王五 用户登录成功', '2019-01-08 09:26:09', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (193, '登录操作', '王五 用户登录成功', '2019-01-08 09:31:50', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (194, '登录操作', '王五 用户登录成功', '2019-01-08 09:32:49', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (195, '登录操作', '王五 用户登录成功', '2019-01-08 09:37:58', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (196, '登录操作', '王五 用户登录成功', '2019-01-08 09:38:55', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (197, '流程操作', '查询系统中的所有用户', '2019-01-08 09:39:00', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (198, '流程操作', '查询系统中的所有用户', '2019-01-08 09:39:06', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (199, '登录操作', '王五 用户登录成功', '2019-01-08 09:40:11', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (200, '流程操作', '查询系统中的所有用户', '2019-01-08 09:42:51', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (201, '登录操作', '王五 用户登录成功', '2019-01-08 10:33:56', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (202, '流程操作', '查询系统中的所有用户', '2019-01-08 10:38:15', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (203, '登录操作', '王五 用户登录成功', '2019-01-08 11:17:03', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (204, '登录操作', '王五 用户登录成功', '2019-01-08 13:03:28', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (205, '登录操作', '王五 用户登录成功', '2019-01-11 16:57:41', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (206, '流程操作', '查询系统中的所有用户', '2019-01-11 16:58:05', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (207, '登录操作', '王五 用户登录成功', '2019-01-11 16:59:51', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (208, '登录操作', '王五 用户登录成功', '2019-01-14 08:56:12', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (209, '登录操作', '王五 用户登录成功', '2019-01-14 09:33:30', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (210, '登录操作', '王五 用户登录成功', '2019-01-14 10:19:02', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (211, '登录操作', '王五 用户登录成功', '2019-01-14 10:21:34', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (212, '登录操作', '王五 用户登录成功', '2019-01-14 10:21:54', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (213, '登录操作', '王五 用户登录成功', '2019-01-14 10:22:10', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (214, '登录操作', '王五 用户登录成功', '2019-01-14 10:23:50', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (215, '登录操作', '王五 用户登录成功', '2019-01-14 10:27:38', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (216, '登录操作', '王五 用户登录成功', '2019-01-14 10:30:31', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (217, '登录操作', '王五 用户登录成功', '2019-01-14 10:31:05', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (218, '登录操作', '王五 用户登录成功', '2019-01-14 10:31:30', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (219, '登录操作', '王五 用户登录成功', '2019-01-14 10:34:27', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (220, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:14:23', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (221, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:14:45', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (222, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:14:55', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (223, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:15:29', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (224, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:16:47', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (225, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:25:28', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (226, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:25:50', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (227, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:25:57', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (228, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-14 16:26:09', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (229, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-14 16:26:24', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (230, '登录操作', '王五 用户登录成功', '2019-01-14 16:26:59', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (231, '登录操作', '王五 用户登录成功', '2019-01-14 16:46:40', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (232, '登录操作', '王五 用户登录成功', '2019-01-14 16:57:03', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (233, '登录操作', '王五 用户登录成功', '2019-01-15 09:03:58', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (234, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:04:06', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (235, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:07:32', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (236, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:07:46', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (237, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:09:48', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (238, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:10:38', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (239, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:12:31', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (240, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:17:45', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (241, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:18:16', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (242, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 09:18:23', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (243, '登录操作', '王五 用户登录成功', '2019-01-15 10:26:55', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (244, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:27:01', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (245, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:27:12', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (246, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:28:42', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (247, '登录操作', '王五 用户登录成功', '2019-01-15 10:28:46', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (248, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-15 10:32:03', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (249, '登录操作', '王五 用户登录成功', '2019-01-15 10:33:02', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (250, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 10:36:30', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (251, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:47:14', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (252, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:47:29', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (253, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:47:55', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (254, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:49:11', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (255, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:49:33', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (256, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:50:29', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (257, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:51:26', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (258, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:53:22', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (259, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:54:57', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (260, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:55:52', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (261, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:56:42', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (262, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:56:57', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (263, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 16:57:08', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (264, '登录操作', '王五 用户登录成功', '2019-01-15 17:08:11', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (265, '登录操作', '王五 用户登录成功', '2019-01-15 17:09:14', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (266, '登录操作', '王五 用户登录成功', '2019-01-15 17:09:18', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (267, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 17:09:23', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (268, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 17:09:25', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (269, '登录操作', '王五 用户登录成功', '2019-01-15 17:13:46', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (270, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 17:31:03', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (271, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-15 17:31:09', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (272, '登录操作', '王五 用户登录成功', '2019-01-16 09:26:28', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (273, '登录操作', '王五 用户登录成功', '2019-01-16 15:21:35', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (274, '登录操作', '王五 用户登录成功', '2019-01-16 15:44:43', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (275, '登录操作', '王五 用户登录成功', '2019-01-17 09:23:00', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (276, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 09:28:42', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (277, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 09:34:10', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (278, '登录操作', '王五 用户登录成功', '2019-01-17 09:34:29', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (279, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 09:35:07', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (280, '登录操作', '王五 用户登录成功', '2019-01-17 09:42:02', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (281, '登录操作', '王五 用户登录成功', '2019-01-17 10:03:47', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (282, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:14:12', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (283, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:14:32', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (284, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:14:48', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (285, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:15:05', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (286, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:17:36', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (287, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:18:11', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (288, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:20:33', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (289, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 10:26:58', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (290, '登录操作', '王五 用户登录成功', '2019-01-17 10:47:53', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (291, '登录操作', '王五 用户登录成功', '2019-01-17 10:47:53', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (292, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 11:03:11', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (293, '登录操作', '王五 用户登录成功', '2019-01-17 11:03:41', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (294, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 11:08:23', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (295, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 11:08:28', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (296, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 11:08:34', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (297, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 11:11:26', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (298, '登录操作', '用户登录失败，失败原因null', '2019-01-17 11:14:39', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (299, '登录操作', '用户登录失败，失败原因null', '2019-01-17 11:15:58', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (300, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 11:19:59', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (301, '登录操作', '王五 用户登录成功', '2019-01-17 11:20:03', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (302, '登录操作', '用户手机登录验证失败，失败原因SMS验证码的值不能为空', '2019-01-17 11:20:06', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (303, '登录操作', '用户手机登录验证失败，失败原因SMS验证码的值不能为空', '2019-01-17 11:20:46', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (304, '登录操作', '用户手机登录验证失败，失败原因SMS验证码不存在', '2019-01-17 11:20:49', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (305, '登录操作', '王五 用户登录成功', '2019-01-17 11:20:55', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (306, '登录操作', '王五 用户登录成功', '2019-01-17 11:23:57', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (307, '登录操作', '王五 用户登录成功', '2019-01-17 11:26:05', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (308, '登录操作', '王五 用户登录成功', '2019-01-17 11:27:03', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (309, '登录操作', '用户手机登录验证失败，失败原因IMAGE验证码的值不能为空', '2019-01-17 11:27:35', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (310, '登录操作', '用户手机登录验证失败，失败原因IMAGE验证码的值不能为空', '2019-01-17 11:30:22', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (311, '登录操作', '用户手机登录验证失败，失败原因IMAGE验证码已过期', '2019-01-17 11:30:29', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (312, '登录操作', '王五 用户登录成功', '2019-01-17 11:30:42', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (313, '登录操作', '用户手机登录验证失败，失败原因IMAGE验证码的值不能为空', '2019-01-17 11:31:43', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (314, '登录操作', '用户手机登录验证失败，失败原因IMAGE验证码的值不能为空', '2019-01-17 11:35:22', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (315, '登录操作', '王五 用户登录成功', '2019-01-17 11:37:12', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (316, '流程操作', '查询系统中的所有用户', '2019-01-17 12:03:02', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (317, '登录操作', '王五 用户登录成功', '2019-01-17 13:11:21', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (318, '登录操作', '用户登录失败，失败原因账户被禁用，请联系管理员!', '2019-01-17 13:12:06', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (319, '登录操作', '用户登录失败，失败原因账户被禁用，请联系管理员!', '2019-01-17 13:45:35', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (320, '登录操作', '王五 用户登录成功', '2019-01-17 13:45:52', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (321, '登录操作', '用户登录失败，失败原因其他原因!', '2019-01-17 13:57:35', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (322, '登录操作', '王五 用户登录成功', '2019-01-17 13:59:57', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (323, '登录操作', '王五 用户登录成功', '2019-01-17 14:01:48', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (324, '登录操作', '王五 用户登录成功', '2019-01-17 14:03:34', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (325, '登录操作', '王五 用户登录成功', '2019-01-17 14:34:56', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (326, '登录操作', '王五 用户登录成功', '2019-01-17 14:40:04', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (327, '登录操作', '王五 用户登录成功', '2019-01-17 14:47:50', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (328, '登录操作', '王五 用户登录成功', '2019-01-17 14:47:58', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (329, '登录操作', '王五 用户登录成功', '2019-01-17 14:48:22', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (330, '登录操作', '王五 用户登录成功', '2019-01-17 14:49:19', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (331, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:37:04', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (332, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:37:14', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (333, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:37:33', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (334, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:38:09', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (335, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:38:32', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (336, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:39:41', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (337, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:40:13', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (338, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:40:36', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (339, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:43:23', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (340, '登录', '王五 用户登录成功', '2019-01-17 15:43:24', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (341, '登录操作', '王五 用户登录成功', '2019-01-17 15:44:04', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (342, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:45:58', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (343, '登录操作', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-17 15:46:03', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (344, '登录操作', '王五 用户登录成功', '2019-01-17 15:46:11', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (345, '登录', '王五 用户登录成功', '2019-01-17 16:02:48', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (346, '登录', '王五 用户登录成功', '2019-01-17 16:07:42', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (347, '登录', '王五 用户登录成功', '2019-01-17 16:11:08', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (348, '登录', '王五 用户登录成功', '2019-01-17 16:18:32', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (349, '登录', '王五 用户登录成功', '2019-01-17 16:19:25', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (350, '登录', '王五 用户登录成功', '2019-01-17 16:20:16', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (351, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:21:57', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (352, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:22:42', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (353, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:25:58', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (354, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:25:58', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (355, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:25:58', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (356, '登录', '王五 用户登录成功', '2019-01-17 16:25:59', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (357, '登录', '王五 用户登录成功', '2019-01-17 16:27:10', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (358, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:30:04', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (359, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:30:04', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (360, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:30:04', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (361, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:30:04', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (362, '登录', '王五 用户登录成功', '2019-01-17 16:30:04', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (363, '登录', '王五 用户登录成功', '2019-01-17 16:30:04', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (364, '登录', '王五 用户登录成功', '2019-01-17 16:30:24', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (365, '登录', '王五 用户登录成功', '2019-01-17 16:32:03', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (366, '登录', '王五 用户登录成功', '2019-01-17 16:32:34', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (367, '登录', '王五 用户登录成功', '2019-01-17 16:33:07', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (368, '登录', '王五 用户登录成功', '2019-01-17 16:34:52', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (369, '登录', '王五 用户登录成功', '2019-01-17 16:34:57', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (370, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:36:07', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (371, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:36:12', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (372, '登录', '王五 用户登录成功', '2019-01-17 16:36:19', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (373, '登录', '王五 用户登录成功', '2019-01-17 16:36:41', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (374, '登录', '王五 用户登录成功', '2019-01-17 16:37:50', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (375, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:37:57', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (376, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:38:06', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (377, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:41:25', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (378, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:41:35', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (379, '登录', '王五 用户登录成功', '2019-01-17 16:41:42', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (380, '登录', '王五 用户登录成功', '2019-01-17 16:41:49', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (381, '登录', '王五 用户登录成功', '2019-01-17 16:43:23', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (382, '登录', '王五 用户登录成功', '2019-01-17 16:43:53', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (383, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:45:25', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (384, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:45:27', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (385, '登录', '用户登录失败，失败原因其他原因!', '2019-01-17 16:45:34', NULL, NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (386, '登录', '王五 用户登录成功', '2019-01-17 16:45:41', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (387, '登录', '王五 用户登录成功', '2019-01-17 16:45:46', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (388, '登录', '王五 用户登录成功', '2019-01-17 17:10:37', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (389, '登录', '王五 用户登录成功', '2019-01-17 17:11:27', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (390, '登录', '王五 用户登录成功', '2019-01-17 17:13:25', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (391, '登录', '王五 用户登录成功', '2019-01-17 17:13:58', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (392, '登录', '王五 用户登录成功', '2019-01-17 17:13:58', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (393, '登录', '王五 用户登录成功', '2019-01-17 17:14:59', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (394, '登录', '王五 用户登录成功', '2019-01-17 17:16:48', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (395, '登录', '王五 用户登录成功', '2019-01-17 17:19:00', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (396, '登录', '王五 用户登录成功', '2019-01-17 17:20:33', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (397, '登录', '王五 登录成功', '2019-01-17 17:37:59', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (398, '登录', '王五 登录成功', '2019-01-17 17:38:14', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (399, '流程操作', '查询系统中的所有用户', '2019-01-17 17:39:40', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (400, '流程操作', '查询系统中的所有用户', '2019-01-17 17:50:58', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (401, '流程操作', '查询系统中的所有用户', '2019-01-18 08:39:16', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (402, '登录', '王五 登录成功', '2019-01-18 09:01:32', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (403, '登录', '王五 登录成功', '2019-01-18 09:09:25', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (404, '登录', '王五 登录成功', '2019-01-18 09:11:13', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (405, '登录', '王五 登录成功', '2019-01-18 09:11:45', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (406, '登录', '王五 登录成功', '2019-01-18 09:13:12', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (407, '登录', '王五 登录成功', '2019-01-18 09:15:22', '王五', NULL, '研发经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (408, '登录', '王五 登录成功', '2019-01-18 09:24:46', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (409, '流程操作', '查询系统中的所有用户', '2019-01-18 09:32:28', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (410, '登录', '登录失败', '2019-01-18 09:33:18', 'lizhizhong', NULL, '未知', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (411, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-18 09:33:18', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (412, '登录', '登录失败', '2019-01-18 09:33:24', 'lizhizhong', NULL, '未知', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (413, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-18 09:33:24', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (414, '登录', '登录失败', '2019-01-18 09:33:36', 'lizhizhong', NULL, '未知', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (415, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-18 09:33:36', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (416, '登录', '王五 登录成功', '2019-01-18 09:33:49', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (417, '登录', '登录失败', '2019-01-18 09:34:11', 'lizhizhong', NULL, '未知', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (418, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-18 09:34:11', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (419, '登录', '张三 登录成功', '2019-01-18 09:34:30', '张三', NULL, '客服人员,开发人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (420, '登录', '阿斯顿发生的大师傅 登录成功', '2019-01-18 09:34:50', '阿斯顿发生的大师傅', NULL, '开发人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (421, '登录', '王五 登录成功', '2019-01-18 09:35:00', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (422, '登录', '王五 登录成功', '2019-01-18 09:38:06', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (423, '登录', '张三 登录成功', '2019-01-18 09:38:45', '张三', NULL, '客服人员,开发人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (424, '登录', '阿斯顿发生的大师傅 登录成功', '2019-01-18 09:38:54', '阿斯顿发生的大师傅', NULL, '开发人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (425, '登录', '王五 登录成功', '2019-01-18 09:41:10', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (426, '流程操作', '查询系统中的所有用户', '2019-01-18 09:41:15', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (427, '流程操作', '查询系统中的所有用户', '2019-01-18 09:42:16', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (428, '刪除', '得到用户拥有的所有角色', '2019-01-18 09:42:37', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (429, '刪除', '得到用户拥有的所有角色', '2019-01-18 09:42:39', '王五', NULL, '研发经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (430, '登录', '王五 登录成功', '2019-01-18 10:01:13', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (431, '登录', '张三 登录成功', '2019-01-18 10:01:19', '张三', NULL, '客服人员,开发人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (432, '登录', '王五 登录成功', '2019-01-18 10:01:29', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (433, '登录', 'hahahahahahahahahahahahaah 登录成功', '2019-01-18 10:02:07', 'hahahahahahahahahahahahaah', NULL, '客服人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (434, '登录', '王五 登录成功', '2019-01-18 10:02:14', '王五', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (435, '登录', 'hahahahahahahahahahahahaah 登录成功', '2019-01-18 10:02:39', 'hahahahahahahahahahahahaah', NULL, '客服人员', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (436, '登录', '我是管理員啊 登录成功', '2019-01-18 10:03:16', '我是管理員啊', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (437, '流程操作', '查询系统中的所有用户', '2019-01-18 10:06:29', '我是管理員啊', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (438, '流程操作', '查询系统中的所有用户', '2019-01-18 10:07:31', '我是管理員啊', NULL, '研发经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (439, '登录', '我是管理員啊 登录成功', '2019-01-18 10:08:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (440, '登录', '我是管理員啊 登录成功', '2019-01-18 10:20:24', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (441, '登录', '我是管理員啊 登录成功', '2019-01-18 10:20:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (442, '登录', '登录失败', '2019-01-18 10:35:35', 'admin', NULL, '未知', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (443, '登录', '用户登录失败，失败原因账户名或者密码输入错误!', '2019-01-18 10:35:35', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (444, '登录', '我是管理員啊 登录成功', '2019-01-18 10:36:51', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (445, '登录', '我是管理員啊 登录成功', '2019-01-18 10:43:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (446, '登录', '我是管理員啊 登录成功', '2019-01-18 10:43:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (447, '登录', '我是管理員啊 登录成功', '2019-01-18 10:44:18', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (448, '登录', '我是管理員啊 登录成功', '2019-01-18 10:47:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (449, '登录', '我是管理員啊 登录成功', '2019-01-18 10:53:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (450, '登录', '我是管理員啊 登录成功', '2019-01-18 11:11:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (451, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 11:16:35', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (452, '登录', '我是管理員啊 登录成功', '2019-01-18 11:25:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (453, '流程操作', '查询系统中的所有用户', '2019-01-18 11:28:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (454, '登录', '我是管理員啊 登录成功', '2019-01-18 14:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (455, '流程操作', '查询系统中的所有用户', '2019-01-18 14:12:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (456, '登录', '我是管理員啊 登录成功', '2019-01-18 15:00:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (457, '登录', '我是管理員啊 登录成功', '2019-01-18 16:06:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (458, '登录', '我是管理員啊 登录成功', '2019-01-18 16:10:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (459, '登录', '我是管理員啊 登录成功', '2019-01-18 16:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (460, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 16:11:27', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (461, '登录', '我是管理員啊 登录成功', '2019-01-18 16:11:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (462, '登录', '我是管理員啊 登录成功', '2019-01-18 16:12:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (463, '登录', '我是管理員啊 登录成功', '2019-01-18 16:12:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (464, '登录', '我是管理員啊 登录成功', '2019-01-18 16:14:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (465, '登录', '我是管理員啊 登录成功', '2019-01-18 16:30:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (466, '登录', '我是管理員啊 登录成功', '2019-01-18 16:32:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (467, '登录', '我是管理員啊 登录成功', '2019-01-18 16:38:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (468, '登录', '我是管理員啊 登录成功', '2019-01-18 16:54:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (469, '登录', '我是管理員啊 登录成功', '2019-01-18 16:54:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (470, '登录', '我是管理員啊 登录成功', '2019-01-18 16:56:14', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (471, '登录', '我是管理員啊 登录成功', '2019-01-18 16:56:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (472, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:12:26', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (473, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:13:02', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (474, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:13:07', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (475, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:13:19', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (476, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:13:57', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (477, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:14:07', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (478, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:14:29', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (479, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:14:36', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (480, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:14:41', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (481, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:15:39', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (482, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:16:07', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (483, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:16:54', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (484, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:17:43', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (485, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:18:46', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (486, '登录', '我是管理員啊 登录成功', '2019-01-18 17:24:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (487, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-18 17:24:59', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (488, '登录', '我是管理員啊 登录成功', '2019-01-18 17:29:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (489, '登录', '我是管理員啊 登录成功', '2019-01-21 10:04:18', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (490, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 10:04:47', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (491, '登录', '我是管理員啊 登录成功', '2019-01-21 10:05:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (492, '登录', '我是管理員啊 登录成功', '2019-01-21 10:07:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (493, '登录', '我是管理員啊 登录成功', '2019-01-21 10:07:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (494, '登录', '我是管理員啊 登录成功', '2019-01-21 10:07:17', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (495, '登录', '我是管理員啊 登录成功', '2019-01-21 10:07:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (496, '流程操作', '查询系统中的所有用户', '2019-01-21 10:08:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (497, '登录', '我是管理員啊 登录成功', '2019-01-21 10:09:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (498, '登录', '我是管理員啊 登录成功', '2019-01-21 10:14:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (499, '登录', '我是管理員啊 登录成功', '2019-01-21 10:15:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (500, '登录', '我是管理員啊 登录成功', '2019-01-21 10:17:13', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (501, '登录', '我是管理員啊 登录成功', '2019-01-21 10:31:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (502, '登录', '我是管理員啊 登录成功', '2019-01-21 10:32:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (503, '登录', '我是管理員啊 登录成功', '2019-01-21 11:38:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (504, '登录', '我是管理員啊 登录成功', '2019-01-21 14:05:16', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (505, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:48:08', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (506, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:49:20', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (507, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:50:00', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (508, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:50:30', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (509, '登录', '我是管理員啊 登录成功', '2019-01-21 14:50:31', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (510, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:51:25', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (511, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:51:38', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (512, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:51:47', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (513, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:51:58', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (514, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 14:52:34', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (515, '更改', '更改学校名称', '2019-01-21 14:55:23', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (516, '更改', '更改学校名称', '2019-01-21 15:00:12', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (517, '登录', '我是管理員啊 登录成功', '2019-01-21 15:00:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (518, '更改', '更改学校名称', '2019-01-21 15:01:24', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (519, '更改', '更改学校名称', '2019-01-21 15:03:39', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (520, '登录', '我是管理員啊 登录成功', '2019-01-21 15:06:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (521, '登录', '我是管理員啊 登录成功', '2019-01-21 15:06:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (522, '登录', '我是管理員啊 登录成功', '2019-01-21 15:09:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (523, '登录', '我是管理員啊 登录成功', '2019-01-21 15:25:15', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (524, '登录', '我是管理員啊 登录成功', '2019-01-21 15:25:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (525, '更改', '更改学校名称操作原因：因为我是管理员，所以任性学校编号：1233', '2019-01-21 15:25:49', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (526, '更改', '更改学校名称  操作原因：因为我是管理员，所以任性22222  学校编号：1233', '2019-01-21 15:27:48', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (527, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:29:19', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (528, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:29:41', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (529, '登录', '我是管理員啊 登录成功', '2019-01-21 15:29:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (530, '登录', '我是管理員啊 登录成功', '2019-01-21 15:31:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (531, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:40:42', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (532, '登录', '我是管理員啊 登录成功', '2019-01-21 15:41:17', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (533, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:41:36', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (534, '登录', '我是管理員啊 登录成功', '2019-01-21 15:42:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (535, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:42:44', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (536, '登录', '我是管理員啊 登录成功', '2019-01-21 15:45:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (537, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:46:14', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (538, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:47:41', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (539, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:47:49', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (540, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:48:13', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (541, '登录', '我是管理員啊 登录成功', '2019-01-21 15:48:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (542, '登录', '用户登录失败，失败原因其他未知原因原因!', '2019-01-21 15:48:58', 'who knows', NULL, '未知', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (543, '登录', '我是管理員啊 登录成功', '2019-01-21 15:49:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (544, '登录', '我是管理員啊 登录成功', '2019-01-21 15:53:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (545, '登录', '我是管理員啊 登录成功', '2019-01-21 16:10:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (546, '登录', '我是管理員啊 登录成功', '2019-01-21 16:11:16', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (547, '流程操作', '获取当前用户菜单', '2019-01-21 16:16:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (548, '流程操作', '获取当前用户菜单', '2019-01-21 16:16:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.84', NULL, NULL);
INSERT INTO `sys_log` VALUES (549, '流程操作', '获取当前用户菜单', '2019-01-21 16:45:25', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (550, '登录', '我是管理員啊 登录成功', '2019-01-21 16:51:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (551, '流程操作', '获取当前用户菜单', '2019-01-21 16:52:08', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (552, '流程操作', '获取当前用户菜单', '2019-01-21 16:52:35', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (553, '流程操作', '获取当前用户菜单', '2019-01-21 16:53:48', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (554, '流程操作', '获取当前用户菜单', '2019-01-21 16:57:31', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (555, '流程操作', '获取当前用户菜单', '2019-01-21 16:58:16', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (556, '流程操作', '获取当前用户菜单', '2019-01-21 16:59:00', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (557, '登录', '我是管理員啊 登录成功', '2019-01-21 17:03:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (558, '登录', '我是管理員啊 登录成功', '2019-01-21 17:05:53', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (559, '流程操作', '获取当前用户菜单', '2019-01-21 17:06:06', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (560, '流程操作', '获取当前用户菜单', '2019-01-21 17:07:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (561, '流程操作', '获取当前用户菜单', '2019-01-21 17:08:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (562, '流程操作', '获取当前用户菜单', '2019-01-21 17:09:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (563, '流程操作', '获取当前用户菜单', '2019-01-21 17:09:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (564, '流程操作', '获取当前用户菜单', '2019-01-21 17:10:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (565, '登录', '我是管理員啊 登录成功', '2019-01-21 17:10:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (566, '流程操作', '获取当前用户菜单', '2019-01-21 17:10:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (567, '登录', '我是管理員啊 登录成功', '2019-01-21 17:11:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (568, '流程操作', '获取当前用户菜单', '2019-01-21 17:11:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (569, '流程操作', '获取当前用户菜单', '2019-01-21 17:19:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (570, '流程操作', '获取当前用户菜单', '2019-01-21 17:20:17', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (571, '流程操作', '获取当前用户菜单', '2019-01-21 17:20:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (572, '流程操作', '获取当前用户菜单', '2019-01-21 17:20:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (573, '流程操作', '获取当前用户菜单', '2019-01-21 17:20:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (574, '流程操作', '获取当前用户菜单', '2019-01-21 17:20:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (575, '流程操作', '获取当前用户菜单', '2019-01-21 17:21:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (576, '流程操作', '获取当前用户菜单', '2019-01-21 17:21:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (577, '流程操作', '获取当前用户菜单', '2019-01-21 17:21:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (578, '流程操作', '获取当前用户菜单', '2019-01-21 17:21:32', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (579, '流程操作', '获取当前用户菜单', '2019-01-21 17:21:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (580, '流程操作', '获取当前用户菜单', '2019-01-21 17:22:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (581, '流程操作', '获取当前用户菜单', '2019-01-21 17:22:17', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (582, '流程操作', '获取当前用户菜单', '2019-01-21 17:22:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (583, '流程操作', '获取当前用户菜单', '2019-01-21 17:22:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (584, '流程操作', '获取当前用户菜单', '2019-01-21 17:23:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (585, '流程操作', '获取当前用户菜单', '2019-01-21 17:23:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (586, '流程操作', '获取当前用户菜单', '2019-01-21 17:23:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (587, '流程操作', '获取当前用户菜单', '2019-01-21 17:23:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (588, '流程操作', '获取当前用户菜单', '2019-01-21 17:23:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (589, '流程操作', '获取当前用户菜单', '2019-01-21 17:24:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (590, '流程操作', '获取当前用户菜单', '2019-01-21 17:24:18', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (591, '流程操作', '获取当前用户菜单', '2019-01-21 17:24:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (592, '流程操作', '获取当前用户菜单', '2019-01-21 17:24:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (593, '流程操作', '获取当前用户菜单', '2019-01-21 17:24:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (594, '流程操作', '获取当前用户菜单', '2019-01-21 17:25:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (595, '流程操作', '获取当前用户菜单', '2019-01-21 17:25:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (596, '流程操作', '获取当前用户菜单', '2019-01-21 17:25:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (597, '流程操作', '获取当前用户菜单', '2019-01-21 17:25:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (598, '流程操作', '获取当前用户菜单', '2019-01-21 17:26:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (599, '流程操作', '获取当前用户菜单', '2019-01-21 17:27:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (600, '流程操作', '获取当前用户菜单', '2019-01-21 17:27:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (601, '流程操作', '获取当前用户菜单', '2019-01-21 17:27:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (602, '流程操作', '获取当前用户菜单', '2019-01-21 17:28:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (603, '流程操作', '获取当前用户菜单', '2019-01-21 17:28:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (604, '流程操作', '获取当前用户菜单', '2019-01-21 17:28:32', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (605, '流程操作', '获取当前用户菜单', '2019-01-21 17:28:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (606, '流程操作', '获取当前用户菜单', '2019-01-21 17:28:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (607, '流程操作', '获取当前用户菜单', '2019-01-21 17:29:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (608, '流程操作', '获取当前用户菜单', '2019-01-21 17:29:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (609, '流程操作', '获取当前用户菜单', '2019-01-21 17:29:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (610, '流程操作', '获取当前用户菜单', '2019-01-21 17:29:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (611, '流程操作', '获取当前用户菜单', '2019-01-21 17:30:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (612, '流程操作', '获取当前用户菜单', '2019-01-21 17:30:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (613, '流程操作', '获取当前用户菜单', '2019-01-21 17:30:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (614, '流程操作', '获取当前用户菜单', '2019-01-21 17:30:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (615, '流程操作', '获取当前用户菜单', '2019-01-21 17:31:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (616, '登录', '我是管理員啊 登录成功', '2019-01-22 09:16:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (617, '流程操作', '获取当前用户菜单', '2019-01-22 09:16:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (618, '流程操作', '获取当前用户菜单', '2019-01-22 09:16:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (619, '流程操作', '获取当前用户菜单', '2019-01-22 09:16:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (620, '登录', '我是管理員啊 登录成功', '2019-01-22 09:57:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (621, '流程操作', '获取当前用户菜单', '2019-01-22 09:57:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (622, '流程操作', '获取当前用户菜单', '2019-01-22 09:57:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (623, '流程操作', '获取当前用户菜单', '2019-01-22 09:57:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (624, '流程操作', '获取当前用户菜单', '2019-01-22 09:57:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (625, '流程操作', '获取当前用户菜单', '2019-01-22 10:00:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (626, '登录', '我是管理員啊 登录成功', '2019-01-22 10:00:06', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (627, '流程操作', '获取当前用户菜单', '2019-01-22 10:00:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (628, '流程操作', '获取当前用户菜单', '2019-01-22 10:01:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (629, '流程操作', '查询系统中的所有用户', '2019-01-22 10:02:13', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 0);
INSERT INTO `sys_log` VALUES (630, '流程操作', '获取当前用户菜单', '2019-01-22 10:06:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (631, '流程操作', '获取当前用户菜单', '2019-01-22 10:10:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (632, '流程操作', '获取当前用户菜单', '2019-01-22 10:11:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (633, '流程操作', '获取当前用户菜单', '2019-01-22 10:11:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (634, '流程操作', '获取当前用户菜单', '2019-01-22 10:12:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (635, '流程操作', '获取当前用户菜单', '2019-01-22 10:12:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (636, '流程操作', '获取当前用户菜单', '2019-01-22 10:13:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (637, '流程操作', '获取当前用户菜单', '2019-01-22 10:13:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (638, '流程操作', '获取当前用户菜单', '2019-01-22 10:13:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (639, '流程操作', '获取当前用户菜单', '2019-01-22 10:13:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (640, '流程操作', '获取当前用户菜单', '2019-01-22 10:14:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (641, '流程操作', '获取当前用户菜单', '2019-01-22 10:14:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (642, '流程操作', '获取当前用户菜单', '2019-01-22 10:14:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (643, '流程操作', '获取当前用户菜单', '2019-01-22 10:14:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (644, '流程操作', '获取当前用户菜单', '2019-01-22 10:14:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (645, '流程操作', '获取当前用户菜单', '2019-01-22 10:15:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (646, '流程操作', '获取当前用户菜单', '2019-01-22 10:16:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (647, '流程操作', '获取当前用户菜单', '2019-01-22 10:16:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (648, '流程操作', '获取当前用户菜单', '2019-01-22 10:17:16', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (649, '流程操作', '获取当前用户菜单', '2019-01-22 10:18:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (650, '流程操作', '获取当前用户菜单', '2019-01-22 10:18:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (651, '流程操作', '获取当前用户菜单', '2019-01-22 10:18:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (652, '流程操作', '获取当前用户菜单', '2019-01-22 10:19:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (653, '流程操作', '获取当前用户菜单', '2019-01-22 10:20:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (654, '流程操作', '获取当前用户菜单', '2019-01-22 10:21:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (655, '流程操作', '获取当前用户菜单', '2019-01-22 10:21:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (656, '流程操作', '获取当前用户菜单', '2019-01-22 10:22:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (657, '流程操作', '获取当前用户菜单', '2019-01-22 10:22:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (658, '流程操作', '获取当前用户菜单', '2019-01-22 10:23:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (659, '流程操作', '获取当前用户菜单', '2019-01-22 10:23:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (660, '流程操作', '获取当前用户菜单', '2019-01-22 10:23:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (661, '流程操作', '获取当前用户菜单', '2019-01-22 10:23:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (662, '流程操作', '获取当前用户菜单', '2019-01-22 10:23:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (663, '流程操作', '获取当前用户菜单', '2019-01-22 10:24:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (664, '流程操作', '获取当前用户菜单', '2019-01-22 10:24:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (665, '流程操作', '获取当前用户菜单', '2019-01-22 10:24:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (666, '流程操作', '获取当前用户菜单', '2019-01-22 10:24:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (667, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (668, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (669, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (670, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (671, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (672, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (673, '登录', '我是管理員啊 登录成功', '2019-01-22 10:25:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (674, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (675, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (676, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (677, '流程操作', '获取当前用户菜单', '2019-01-22 10:25:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (678, '流程操作', '获取当前用户菜单', '2019-01-22 10:26:16', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (679, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (680, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (681, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (682, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (683, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (684, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (685, '流程操作', '获取当前用户菜单', '2019-01-22 10:27:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (686, '流程操作', '获取当前用户菜单', '2019-01-22 10:28:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (687, '流程操作', '获取当前用户菜单', '2019-01-22 10:29:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (688, '流程操作', '获取当前用户菜单', '2019-01-22 10:29:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (689, '流程操作', '获取当前用户菜单', '2019-01-22 10:29:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (690, '流程操作', '获取当前用户菜单', '2019-01-22 10:29:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (691, '流程操作', '获取当前用户菜单', '2019-01-22 10:29:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (692, '流程操作', '获取当前用户菜单', '2019-01-22 10:32:16', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (693, '流程操作', '获取当前用户菜单', '2019-01-22 10:32:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (694, '流程操作', '获取当前用户菜单', '2019-01-22 10:33:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (695, '流程操作', '获取当前用户菜单', '2019-01-22 10:33:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (696, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (697, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (698, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (699, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (700, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (701, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (702, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (703, '流程操作', '获取当前用户菜单', '2019-01-22 10:34:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (704, '流程操作', '获取当前用户菜单', '2019-01-22 10:35:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (705, '流程操作', '获取当前用户菜单', '2019-01-22 10:35:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (706, '流程操作', '获取当前用户菜单', '2019-01-22 10:35:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (707, '流程操作', '获取当前用户菜单', '2019-01-22 10:35:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (708, '流程操作', '获取当前用户菜单', '2019-01-22 10:36:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (709, '流程操作', '获取当前用户菜单', '2019-01-22 10:36:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (710, '流程操作', '获取当前用户菜单', '2019-01-22 10:36:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (711, '流程操作', '获取当前用户菜单', '2019-01-22 10:36:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (712, '流程操作', '获取当前用户菜单', '2019-01-22 10:37:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (713, '流程操作', '获取当前用户菜单', '2019-01-22 10:37:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (714, '流程操作', '获取当前用户菜单', '2019-01-22 10:39:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (715, '流程操作', '获取当前用户菜单', '2019-01-22 10:39:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (716, '流程操作', '获取当前用户菜单', '2019-01-22 10:39:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (717, '流程操作', '获取当前用户菜单', '2019-01-22 10:39:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (718, '流程操作', '获取当前用户菜单', '2019-01-22 10:39:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (719, '流程操作', '获取当前用户菜单', '2019-01-22 10:40:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (720, '流程操作', '获取当前用户菜单', '2019-01-22 10:40:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (721, '流程操作', '获取当前用户菜单', '2019-01-22 10:40:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (722, '流程操作', '获取当前用户菜单', '2019-01-22 10:40:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (723, '流程操作', '获取当前用户菜单', '2019-01-22 10:41:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (724, '流程操作', '获取当前用户菜单', '2019-01-22 10:42:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (725, '流程操作', '获取当前用户菜单', '2019-01-22 10:42:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (726, '流程操作', '获取当前用户菜单', '2019-01-22 10:42:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (727, '流程操作', '获取当前用户菜单', '2019-01-22 10:42:14', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (728, '流程操作', '获取当前用户菜单', '2019-01-22 10:43:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (729, '流程操作', '获取当前用户菜单', '2019-01-22 10:43:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (730, '流程操作', '获取当前用户菜单', '2019-01-22 10:44:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (731, '流程操作', '获取当前用户菜单', '2019-01-22 10:44:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (732, '流程操作', '获取当前用户菜单', '2019-01-22 10:44:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (733, '流程操作', '获取当前用户菜单', '2019-01-22 10:45:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (734, '流程操作', '获取当前用户菜单', '2019-01-22 10:45:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (735, '登录', '我是管理員啊 登录成功', '2019-01-22 10:47:02', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (736, '流程操作', '获取当前用户菜单', '2019-01-22 10:47:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (737, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:47:18', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (738, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:47:22', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (739, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:49:13', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (740, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:50:03', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (741, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:50:55', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (742, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:51:55', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (743, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:55:10', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (744, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:56:27', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (745, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 10:56:38', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (746, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:00:06', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (747, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:00:10', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (748, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:00:11', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (749, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:00:12', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (750, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:00:12', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (751, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:01:21', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (752, '流程操作', '获取当前用户菜单', '2019-01-22 11:01:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (753, '流程操作', '获取当前用户菜单', '2019-01-22 11:01:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (754, '流程操作', '获取当前用户菜单', '2019-01-22 11:02:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (755, '流程操作', '获取当前用户菜单', '2019-01-22 11:02:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (756, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:02:55', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (757, '流程操作', '获取当前用户菜单', '2019-01-22 11:02:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (758, '流程操作', '获取当前用户菜单', '2019-01-22 11:03:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (759, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (760, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (761, '登录', '我是管理員啊 登录成功', '2019-01-22 11:05:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (762, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (763, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:32', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (764, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (765, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (766, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (767, '流程操作', '获取当前用户菜单', '2019-01-22 11:05:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (768, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (769, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:06:35', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (770, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (771, '登录', '我是管理員啊 登录成功', '2019-01-22 11:06:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (772, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (773, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (774, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (775, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (776, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (777, '流程操作', '获取当前用户菜单', '2019-01-22 11:06:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (778, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (779, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:14', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (780, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:17', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (781, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:07:24', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (782, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (783, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (784, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (785, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (786, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (787, '流程操作', '获取当前用户菜单', '2019-01-22 11:07:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (788, '流程操作', '获取当前用户菜单', '2019-01-22 11:08:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (789, '流程操作', '获取当前用户菜单', '2019-01-22 11:08:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (790, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:08:16', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (791, '流程操作', '获取当前用户菜单', '2019-01-22 11:08:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (792, '流程操作', '获取当前用户菜单', '2019-01-22 11:08:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (793, '流程操作', '获取当前用户菜单', '2019-01-22 11:09:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (794, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:09:04', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (795, '流程操作', '获取当前用户菜单', '2019-01-22 11:09:13', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (796, '流程操作', '获取当前用户菜单', '2019-01-22 11:09:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (797, '流程操作', '获取当前用户菜单', '2019-01-22 11:09:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (798, '流程操作', '获取当前用户菜单', '2019-01-22 11:09:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (799, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (800, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (801, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (802, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (803, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (804, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (805, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (806, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (807, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (808, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (809, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (810, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (811, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (812, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (813, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (814, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (815, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (816, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (817, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (818, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (819, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (820, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (821, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (822, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (823, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (824, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (825, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (826, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (827, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (828, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (829, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (830, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (831, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (832, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (833, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (834, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (835, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (836, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (837, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (838, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (839, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (840, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (841, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (842, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (843, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (844, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (845, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (846, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (847, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (848, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (849, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (850, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (851, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (852, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (853, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (854, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (855, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (856, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (857, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (858, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (859, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (860, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (861, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (862, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (863, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (864, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:29', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (865, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (866, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (867, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (868, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (869, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (870, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (871, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (872, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (873, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (874, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (875, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (876, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (877, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (878, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (879, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (880, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (881, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (882, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (883, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (884, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (885, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (886, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (887, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (888, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (889, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (890, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (891, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (892, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (893, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (894, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (895, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (896, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (897, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (898, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (899, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (900, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (901, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (902, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (903, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (904, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (905, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (906, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (907, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (908, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (909, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (910, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (911, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (912, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (913, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (914, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (915, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (916, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (917, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (918, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (919, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (920, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (921, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (922, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (923, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (924, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (925, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (926, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (927, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (928, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (929, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (930, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (931, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (932, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (933, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (934, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (935, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (936, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (937, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (938, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (939, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (940, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (941, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (942, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (943, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (944, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (945, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (946, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (947, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (948, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (949, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (950, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (951, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (952, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (953, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (954, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (955, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (956, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (957, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (958, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (959, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (960, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (961, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (962, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (963, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (964, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (965, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (966, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (967, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (968, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (969, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (970, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (971, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (972, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (973, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (974, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (975, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (976, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (977, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (978, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (979, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (980, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (981, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (982, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (983, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (984, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (985, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (986, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (987, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (988, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (989, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (990, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (991, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (992, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (993, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (994, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (995, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (996, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (997, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (998, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (999, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1000, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1001, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1002, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1003, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1004, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1005, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1006, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1007, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1008, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1009, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1010, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1011, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1012, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1013, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1014, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1015, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1016, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1017, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1018, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1019, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1020, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1021, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1022, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1023, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1024, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1025, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1026, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1027, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1028, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1029, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1030, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1031, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1032, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1033, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1034, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1035, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1036, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1037, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1038, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1039, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1040, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1041, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1042, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1043, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1044, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1045, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1046, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1047, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1048, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1049, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1050, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1051, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1052, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1053, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:10:51', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (1054, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1055, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1056, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1057, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1058, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1059, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1060, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1061, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1062, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1063, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1064, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1065, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1066, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1067, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1068, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1069, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1070, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1071, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1072, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1073, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1074, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1075, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1076, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1077, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1078, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1079, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1080, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1081, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1082, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1083, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1084, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1085, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1086, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1087, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1088, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1089, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1090, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1091, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1092, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1093, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1094, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1095, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1096, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1097, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1098, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1099, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1100, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1101, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1102, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1103, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1104, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1105, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1106, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1107, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1108, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1109, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1110, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1111, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1112, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1113, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1114, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1115, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1116, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1117, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1118, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1119, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1120, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1121, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1122, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1123, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1124, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1125, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1126, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1127, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1128, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1129, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1130, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1131, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1132, '流程操作', '获取当前用户菜单', '2019-01-22 11:10:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1133, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1134, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1135, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1136, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1137, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1138, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1139, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1140, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1141, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1142, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1143, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1144, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1145, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1146, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1147, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1148, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1149, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1150, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1151, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1152, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1153, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1154, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1155, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1156, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1157, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1158, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1159, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1160, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1161, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1162, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1163, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1164, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1165, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1166, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1167, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1168, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1169, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1170, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1171, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1172, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1173, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1174, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1175, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1176, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1177, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1178, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1179, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1180, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1181, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1182, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1183, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1184, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1185, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1186, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1187, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1188, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1189, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1190, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1191, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1192, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1193, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1194, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1195, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1196, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1197, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1198, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1199, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1200, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1201, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1202, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1203, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1204, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1205, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1206, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1207, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1208, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1209, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1210, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1211, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1212, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1213, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1214, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1215, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1216, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1217, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1218, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1219, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1220, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1221, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1222, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1223, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1224, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1225, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1226, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1227, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1228, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1229, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1230, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1231, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1232, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1233, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1234, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1235, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1236, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1237, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1238, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1239, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1240, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1241, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1242, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1243, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1244, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1245, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1246, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1247, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1248, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1249, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1250, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1251, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1252, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1253, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1254, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1255, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1256, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1257, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1258, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1259, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1260, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1261, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1262, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1263, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1264, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1265, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1266, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1267, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1268, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1269, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1270, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1271, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1272, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1273, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1274, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1275, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1276, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1277, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1278, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1279, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1280, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1281, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1282, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1283, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1284, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1285, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1286, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1287, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1288, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1289, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1290, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1291, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1292, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1293, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1294, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1295, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1296, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1297, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1298, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1299, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1300, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1301, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1302, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1303, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1304, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1305, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1306, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1307, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1308, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1309, '登录', '我是管理員啊 登录成功', '2019-01-22 11:11:13', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1310, '流程操作', '获取当前用户菜单', '2019-01-22 11:11:13', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1311, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:11:22', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (1312, '登录', '我是管理員啊 登录成功', '2019-01-22 11:17:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1313, '流程操作', '获取当前用户菜单', '2019-01-22 11:17:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1314, '流程操作', '获取当前用户菜单', '2019-01-22 11:17:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1315, '流程操作', '获取当前用户菜单', '2019-01-22 11:17:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1316, '流程操作', '获取当前用户菜单', '2019-01-22 11:17:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1317, '流程操作', '获取当前用户菜单', '2019-01-22 11:17:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1318, '流程操作', '获取当前用户菜单', '2019-01-22 11:17:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1319, '流程操作', '获取当前用户菜单', '2019-01-22 11:18:24', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1320, '流程操作', '获取当前用户菜单', '2019-01-22 11:18:58', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1321, '流程操作', '获取当前用户菜单', '2019-01-22 11:19:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1322, '流程操作', '获取当前用户菜单', '2019-01-22 11:22:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1323, '流程操作', '获取当前用户菜单', '2019-01-22 11:22:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1324, '流程操作', '获取当前用户菜单', '2019-01-22 11:22:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1325, '流程操作', '获取当前用户菜单', '2019-01-22 11:23:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1326, '流程操作', '获取当前用户菜单', '2019-01-22 11:23:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1327, '流程操作', '获取当前用户菜单', '2019-01-22 11:23:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1328, '流程操作', '获取当前用户菜单', '2019-01-22 11:23:43', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1329, '更改', '更改学校名称  操作原因：12t123  学校编号：12312', '2019-01-22 11:23:46', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 12312);
INSERT INTO `sys_log` VALUES (1330, '流程操作', '获取当前用户菜单', '2019-01-22 11:23:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1331, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:24:15', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1332, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:24:56', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1333, '流程操作', '获取当前用户菜单', '2019-01-22 11:25:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1334, '流程操作', '获取当前用户菜单', '2019-01-22 11:25:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1335, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:13', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1336, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:18', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1337, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1338, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:32', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1339, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1340, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1341, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1342, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1343, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1344, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1345, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1346, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1347, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1348, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1349, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1350, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1351, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1352, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1353, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1354, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1355, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1356, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1357, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1358, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1359, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1360, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1361, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1362, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1363, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1364, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1365, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1366, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1367, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1368, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1369, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1370, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1371, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1372, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1373, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1374, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1375, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1376, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1377, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1378, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1379, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1380, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1381, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1382, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1383, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1384, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1385, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1386, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1387, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1388, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1389, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1390, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1391, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1392, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1393, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1394, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1395, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1396, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1397, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1398, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1399, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1400, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1401, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1402, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1403, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1404, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1405, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1406, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1407, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1408, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1409, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1410, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1411, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1412, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1413, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1414, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1415, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1416, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1417, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1418, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1419, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1420, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1421, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1422, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1423, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1424, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1425, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1426, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1427, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1428, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1429, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1430, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1431, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1432, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1433, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1434, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1435, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1436, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1437, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1438, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1439, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1440, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1441, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1442, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1443, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1444, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1445, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1446, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1447, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1448, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1449, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1450, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1451, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1452, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1453, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1454, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1455, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1456, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1457, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1458, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1459, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1460, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1461, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1462, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1463, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1464, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1465, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1466, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1467, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1468, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1469, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1470, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1471, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1472, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1473, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1474, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1475, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1476, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1477, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1478, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1479, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1480, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1481, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1482, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1483, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1484, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1485, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1486, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1487, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1488, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1489, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1490, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1491, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1492, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1493, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1494, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1495, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1496, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1497, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1498, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1499, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1500, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1501, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1502, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1503, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1504, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1505, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1506, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1507, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1508, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1509, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1510, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1511, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1512, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1513, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1514, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1515, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1516, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1517, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1518, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1519, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1520, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1521, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1522, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1523, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1524, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1525, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1526, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1527, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1528, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1529, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1530, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1531, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1532, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1533, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1534, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1535, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1536, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1537, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1538, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1539, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1540, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1541, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1542, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1543, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1544, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1545, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1546, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1547, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1548, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1549, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1550, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1551, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1552, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1553, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1554, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1555, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1556, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1557, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1558, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1559, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1560, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1561, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1562, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1563, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1564, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1565, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1566, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1567, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1568, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1569, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1570, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1571, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1572, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1573, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1574, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1575, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1576, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1577, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1578, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1579, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1580, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1581, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1582, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1583, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1584, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1585, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1586, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1587, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1588, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1589, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1590, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1591, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1592, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1593, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1594, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1595, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1596, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1597, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1598, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1599, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1600, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1601, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1602, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1603, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1604, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1605, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1606, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1607, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1608, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1609, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1610, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1611, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1612, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1613, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1614, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1615, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1616, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1617, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1618, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1619, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1620, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1621, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1622, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1623, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1624, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1625, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1626, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1627, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1628, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1629, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1630, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1631, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1632, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1633, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1634, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1635, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1636, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1637, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1638, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1639, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1640, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1641, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1642, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1643, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1644, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1645, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1646, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1647, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1648, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1649, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1650, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1651, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1652, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1653, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1654, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1655, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1656, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1657, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1658, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1659, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1660, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1661, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1662, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1663, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1664, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1665, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1666, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1667, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1668, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1669, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1670, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1671, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1672, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1673, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1674, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1675, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1676, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1677, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1678, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1679, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1680, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1681, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1682, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1683, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1684, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1685, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1686, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1687, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1688, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1689, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1690, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1691, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1692, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1693, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1694, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1695, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1696, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1697, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1698, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1699, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1700, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1701, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1702, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1703, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1704, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1705, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1706, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1707, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1708, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1709, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1710, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1711, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1712, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1713, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1714, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1715, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1716, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1717, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1718, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1719, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1720, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1721, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1722, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1723, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1724, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1725, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1726, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1727, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1728, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1729, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1730, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1731, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1732, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1733, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1734, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1735, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1736, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1737, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1738, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1739, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1740, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1741, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1742, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1743, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1744, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1745, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1746, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1747, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1748, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1749, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1750, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1751, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1752, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1753, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1754, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1755, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1756, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1757, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1758, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1759, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1760, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1761, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1762, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1763, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1764, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1765, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1766, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1767, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1768, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1769, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1770, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1771, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1772, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1773, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1774, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1775, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1776, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1777, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1778, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1779, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1780, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1781, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1782, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1783, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1784, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1785, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1786, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1787, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1788, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1789, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1790, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1791, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1792, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1793, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1794, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1795, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1796, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1797, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1798, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1799, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1800, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1801, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1802, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1803, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1804, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1805, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1806, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1807, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1808, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1809, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1810, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1811, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1812, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1813, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1814, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1815, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1816, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1817, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1818, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1819, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1820, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1821, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1822, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1823, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1824, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1825, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1826, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1827, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1828, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1829, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1830, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1831, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1832, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1833, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1834, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1835, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1836, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1837, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1838, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1839, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1840, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1841, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1842, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1843, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1844, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1845, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1846, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1847, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1848, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1849, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1850, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1851, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1852, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1853, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1854, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1855, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1856, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1857, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1858, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1859, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1860, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1861, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1862, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1863, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1864, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1865, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1866, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1867, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1868, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1869, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1870, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1871, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1872, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1873, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1874, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1875, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1876, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1877, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1878, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1879, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1880, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1881, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1882, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1883, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1884, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1885, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1886, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1887, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1888, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1889, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1890, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1891, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1892, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1893, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1894, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1895, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1896, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1897, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1898, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1899, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1900, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1901, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1902, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1903, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1904, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1905, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1906, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1907, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1908, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1909, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1910, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1911, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1912, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1913, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1914, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1915, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1916, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1917, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1918, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1919, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1920, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1921, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1922, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1923, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1924, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1925, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1926, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1927, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1928, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1929, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1930, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1931, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1932, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1933, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1934, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1935, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1936, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1937, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1938, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1939, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1940, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1941, '登录', '我是管理員啊 登录成功', '2019-01-22 11:26:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1942, '登录', '我是管理員啊 登录成功', '2019-01-22 11:26:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1943, '流程操作', '获取当前用户菜单', '2019-01-22 11:26:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1944, '流程操作', '获取当前用户菜单', '2019-01-22 11:27:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1945, '流程操作', '获取当前用户菜单', '2019-01-22 11:27:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1946, '流程操作', '获取当前用户菜单', '2019-01-22 11:28:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1947, '流程操作', '获取当前用户菜单', '2019-01-22 11:28:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1948, '流程操作', '获取当前用户菜单', '2019-01-22 11:29:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1949, '流程操作', '获取当前用户菜单', '2019-01-22 11:29:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1950, '流程操作', '获取当前用户菜单', '2019-01-22 11:31:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1951, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1952, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1953, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:31', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1954, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1955, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1956, '登录', '我是管理員啊 登录成功', '2019-01-22 11:32:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1957, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1958, '流程操作', '获取当前用户菜单', '2019-01-22 11:32:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1959, '登录', '我是管理員啊 登录成功', '2019-01-22 11:33:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1960, '流程操作', '获取当前用户菜单', '2019-01-22 11:33:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1961, '流程操作', '获取当前用户菜单', '2019-01-22 11:33:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1962, '流程操作', '获取当前用户菜单', '2019-01-22 11:33:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1963, '流程操作', '获取当前用户菜单', '2019-01-22 11:33:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1964, '流程操作', '获取当前用户菜单', '2019-01-22 11:34:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1965, '流程操作', '获取当前用户菜单', '2019-01-22 11:34:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1966, '流程操作', '获取当前用户菜单', '2019-01-22 11:34:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1967, '流程操作', '获取当前用户菜单', '2019-01-22 11:34:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1968, '登录', '我是管理員啊 登录成功', '2019-01-22 11:34:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1969, '流程操作', '获取当前用户菜单', '2019-01-22 11:34:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1970, '流程操作', '获取当前用户菜单', '2019-01-22 11:35:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1971, '流程操作', '获取当前用户菜单', '2019-01-22 11:35:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1972, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:37:21', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1973, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:37:27', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1974, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:37:45', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1975, '流程操作', '获取当前用户菜单', '2019-01-22 11:39:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1976, '流程操作', '获取当前用户菜单', '2019-01-22 11:40:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1977, '流程操作', '获取当前用户菜单', '2019-01-22 11:40:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1978, '流程操作', '获取当前用户菜单', '2019-01-22 11:40:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1979, '流程操作', '获取当前用户菜单', '2019-01-22 11:40:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1980, '流程操作', '获取当前用户菜单', '2019-01-22 11:41:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1981, '流程操作', '获取当前用户菜单', '2019-01-22 11:41:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1982, '流程操作', '获取当前用户菜单', '2019-01-22 11:42:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1983, '流程操作', '获取当前用户菜单', '2019-01-22 11:42:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1984, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:43:14', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1985, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:44:15', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1986, '流程操作', '获取当前用户菜单', '2019-01-22 11:45:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1987, '流程操作', '获取当前用户菜单', '2019-01-22 11:45:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1988, '更改', '更改学校名称  操作原因：阿斯蒂芬  学校编号：1212', '2019-01-22 11:45:20', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 1212);
INSERT INTO `sys_log` VALUES (1989, '流程操作', '获取当前用户菜单', '2019-01-22 11:45:21', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1990, '流程操作', '获取当前用户菜单', '2019-01-22 11:45:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1991, '流程操作', '获取当前用户菜单', '2019-01-22 11:45:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1992, '流程操作', '获取当前用户菜单', '2019-01-22 11:45:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1993, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1994, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1995, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1996, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:24', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1997, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:32', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1998, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (1999, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2000, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2001, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2002, '流程操作', '获取当前用户菜单', '2019-01-22 11:46:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2003, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:03', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2004, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2005, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:08', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2006, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2007, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2008, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:25', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2009, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2010, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2011, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2012, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2013, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2014, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2015, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2016, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2017, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:55', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2018, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:56', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2019, '流程操作', '获取当前用户菜单', '2019-01-22 11:47:57', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2020, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:27', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2021, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2022, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2023, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2024, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2025, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2026, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2027, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2028, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2029, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:51', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2030, '流程操作', '获取当前用户菜单', '2019-01-22 11:48:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2031, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2032, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2033, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2034, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2035, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2036, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2037, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2038, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2039, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2040, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2041, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2042, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2043, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2044, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:45', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2045, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2046, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:52', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2047, '流程操作', '获取当前用户菜单', '2019-01-22 11:49:53', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2048, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:00', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2049, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2050, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2051, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2052, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2053, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:09', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2054, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2055, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:18', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2056, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2057, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:20', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2058, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:22', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2059, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:24', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2060, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2061, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2062, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2063, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2064, '流程操作', '获取当前用户菜单', '2019-01-22 11:50:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2065, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:23', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2066, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:24', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2067, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2068, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2069, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2070, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2071, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:39', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2072, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:41', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2073, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2074, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2075, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:49', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2076, '流程操作', '获取当前用户菜单', '2019-01-22 11:51:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2077, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:34', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2078, '登录', '我是管理員啊 登录成功', '2019-01-22 11:52:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2079, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:36', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2080, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:38', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2081, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2082, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2083, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:46', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2084, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2085, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:48', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2086, '流程操作', '获取当前用户菜单', '2019-01-22 11:52:50', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2087, '流程操作', '获取当前用户菜单', '2019-01-22 11:53:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2088, '流程操作', '获取当前用户菜单', '2019-01-22 11:53:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2089, '流程操作', '获取当前用户菜单', '2019-01-22 11:53:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2090, '流程操作', '获取当前用户菜单', '2019-01-22 11:53:12', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2091, '流程操作', '获取当前用户菜单', '2019-01-22 11:53:13', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2092, '流程操作', '获取当前用户菜单', '2019-01-22 11:53:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2093, '流程操作', '获取当前用户菜单', '2019-01-22 11:54:18', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2094, '流程操作', '获取当前用户菜单', '2019-01-22 11:54:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2095, '登录', '我是管理員啊 登录成功', '2019-01-22 13:11:13', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', NULL, NULL);
INSERT INTO `sys_log` VALUES (2096, '更改', '更改学校名称  操作原因：123  学校编号：123', '2019-01-22 13:11:41', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 123);
INSERT INTO `sys_log` VALUES (2097, '更改', '更改学校名称  操作原因：123  学校编号：123', '2019-01-22 13:13:52', '我是管理員啊', NULL, '研发经理,部门经理', '127.0.0.1', '成功', 123);
INSERT INTO `sys_log` VALUES (2098, '登录', '我是管理員啊 登录成功', '2019-01-22 14:02:01', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2099, '流程操作', '获取当前用户菜单', '2019-01-22 14:02:02', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2100, '流程操作', '获取当前用户菜单', '2019-01-22 14:02:04', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2101, '流程操作', '获取当前用户菜单', '2019-01-22 14:02:47', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2102, '流程操作', '获取当前用户菜单', '2019-01-22 14:03:07', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2103, '流程操作', '获取当前用户菜单', '2019-01-22 14:04:10', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2104, '流程操作', '获取当前用户菜单', '2019-01-22 14:05:14', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2105, '流程操作', '获取当前用户菜单', '2019-01-22 14:05:59', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2106, '流程操作', '获取当前用户菜单', '2019-01-22 14:06:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2107, '流程操作', '获取当前用户菜单', '2019-01-22 14:06:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2108, '流程操作', '获取当前用户菜单', '2019-01-22 14:07:06', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2109, '流程操作', '获取当前用户菜单', '2019-01-22 14:07:17', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2110, '流程操作', '获取当前用户菜单', '2019-01-22 14:07:37', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2111, '流程操作', '获取当前用户菜单', '2019-01-22 14:07:40', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2112, '流程操作', '获取当前用户菜单', '2019-01-22 14:07:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2113, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2114, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:26', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2115, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:28', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2116, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:30', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2117, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:33', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2118, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:42', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2119, '流程操作', '获取当前用户菜单', '2019-01-22 14:08:44', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2120, '流程操作', '获取当前用户菜单', '2019-01-22 14:09:15', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2121, '流程操作', '获取当前用户菜单', '2019-01-22 14:09:24', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2122, '流程操作', '获取当前用户菜单', '2019-01-22 14:09:35', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2123, '流程操作', '获取当前用户菜单', '2019-01-22 14:09:54', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2124, '流程操作', '获取当前用户菜单', '2019-01-22 14:10:05', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2125, '流程操作', '获取当前用户菜单', '2019-01-22 14:10:11', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);
INSERT INTO `sys_log` VALUES (2126, '流程操作', '获取当前用户菜单', '2019-01-22 14:10:19', '我是管理員啊', NULL, '研发经理,部门经理', '192.168.25.205', NULL, NULL);

-- ----------------------------
-- Table structure for sys_school
-- ----------------------------
DROP TABLE IF EXISTS `sys_school`;
CREATE TABLE `sys_school`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NULL DEFAULT NULL COMMENT '学校编号',
  `school_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学校名称',
  `domain_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '域名前綴',
  `database_ip_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库服务器ip对应的datasource表中的key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_school
-- ----------------------------
INSERT INTO `sys_school` VALUES (1, 1, '中国人民大学', 'ccpy', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_system
-- ----------------------------
DROP TABLE IF EXISTS `sys_system`;
CREATE TABLE `sys_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `system_domainAlies` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统域名别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_system
-- ----------------------------
INSERT INTO `sys_system` VALUES (1, 1, '\n“中国知网”教学改革研究项目管理系统', NULL);
INSERT INTO `sys_system` VALUES (2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_plan`;
CREATE TABLE `tbl_plan`  (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学年id\r\n',
  `school_num` int(11) NULL DEFAULT NULL COMMENT '学校编号',
  `school_year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学年',
  `default` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认学年',
  `opentimenode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启时间节点',
  `allowset` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许学院设置',
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `begintime` datetime(0) NULL DEFAULT NULL COMMENT '学年开始时间',
  `endtime` datetime(0) NULL DEFAULT NULL COMMENT '学年结束时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_plan
-- ----------------------------
INSERT INTO `tbl_plan` VALUES (1, 1001, '2015-2016', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:49:54');
INSERT INTO `tbl_plan` VALUES (2, 1001, '2016-2017', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:50:00');
INSERT INTO `tbl_plan` VALUES (3, 1001, '2017-2018', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:50:00');
INSERT INTO `tbl_plan` VALUES (4, 1001, '2018-2019', '1', '1', '1', '2018-11-21 09:11:51', '2018-06-21 09:11:29', '2019-06-21 09:11:38', '2018-11-30 13:50:00');

-- ----------------------------
-- Table structure for tbl_teacher_base
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher_base`;
CREATE TABLE `tbl_teacher_base`  (
  `TID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sid',
  `uername` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆密码',
  `school_num` int(11) NULL DEFAULT NULL COMMENT '学校编号',
  `teacher_num` int(11) NULL DEFAULT NULL COMMENT '教师编号',
  `teacher_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `academic_degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学位',
  `graduated_university` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `sex` tinyint(255) NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `login_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆标识',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `CID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cid',
  `APP_KEY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app密令',
  `updatetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `plan_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_teacher_base
-- ----------------------------
INSERT INTO `tbl_teacher_base` VALUES (3, 'uniAdmin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 1, 1, '李某某', '博士', '北京大学', '教授', '博士', 1, 49, '123123123123', 'limoumou@sina.com', 1, 'asdfadsf', '2018-12-03 17:11:44', NULL, NULL, '2019-01-17 10:24:56', 4);
INSERT INTO `tbl_teacher_base` VALUES (4, 'lizhizhong', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 1, 1, '阿斯顿发生的大师傅', '博士', '北京大学', '教授', '博士', 1, 49, '123123111114', 'lizhizhong@sina.com', 1, 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-18 09:34:39', 4);
INSERT INTO `tbl_teacher_base` VALUES (5, 'dev', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 1, 1, '我是开发啊', '博士', '北京大学', '教授', '博士', 1, 49, '123123111115', 'zhangsan@sina.com', 1, 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-18 10:03:11', 4);
INSERT INTO `tbl_teacher_base` VALUES (6, 'admin', '$2a$10$dkfC/5xDiC/l9dqnyQVrdu72TUj4o49tSpmIe0xoKwjpv8hTDCHrO', 1, 1, '我是管理員啊', '博士', '北京大学', '教授', '博士', 1, 49, '123123111112', 'wangwu@sina.com', 1, 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-18 10:03:00', 4);
INSERT INTO `tbl_teacher_base` VALUES (7, 'zhaoliu', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 1, 1, '赵六', '博士', '北京大学', '教授', '博士', 1, 49, '123123111114', 'zhaoliu@sina.com', 1, 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-15 16:40:11', 4);
INSERT INTO `tbl_teacher_base` VALUES (8, 'cus', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 1, 1, '我是客服啊啊', NULL, NULL, NULL, '博士', 1, 49, '123123111111', 'zhouqi@sina.com', 1, 'asdfadsf', '2018-12-03 17:11:44', '', '', '2019-01-18 10:02:53', 4);
INSERT INTO `tbl_teacher_base` VALUES (13, 'test', '$2a$10$A6uaRwrmg8eNf4Es7A62luOcxWTMogwq.USEUtUVnppWpJFuvaoU2', NULL, NULL, 'testsetset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-04 15:42:25', NULL, NULL, '2019-01-04 15:42:25', NULL);

-- ----------------------------
-- Table structure for tran_teacher_resume
-- ----------------------------
DROP TABLE IF EXISTS `tran_teacher_resume`;
CREATE TABLE `tran_teacher_resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '教师ID',
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在单位',
  `teache_object` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课对象',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `hr_role_ibfk_1`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (75, 3, 4);
INSERT INTO `user_role` VALUES (77, 4, 1);
INSERT INTO `user_role` VALUES (78, 5, 2);
INSERT INTO `user_role` VALUES (79, 5, 1);
INSERT INTO `user_role` VALUES (80, 6, 3);
INSERT INTO `user_role` VALUES (81, 7, 3);
INSERT INTO `user_role` VALUES (82, 8, 2);
INSERT INTO `user_role` VALUES (83, 6, 4);
INSERT INTO `user_role` VALUES (84, 6, 5);
INSERT INTO `user_role` VALUES (85, 6, 6);

SET FOREIGN_KEY_CHECKS = 1;
