/*
 Navicat Premium Data Transfer

 Source Server         : lw
 Source Server Type    : MySQL
 Source Server Version : 50718 (5.7.18-20170830-log)
 Source Host           : cdb-gvebaa90.bj.tencentcdb.com:10179
 Source Schema         : xxl-job-ky

 Target Server Type    : MySQL
 Target Server Version : 50718 (5.7.18-20170830-log)
 File Encoding         : 65001

 Date: 21/12/2023 17:07:31
*/

DROP DATABASE IF EXISTS `xxlxxl_job`;

CREATE DATABASE  `xxl_job` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `xxl_job`;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (3, 'linkwechat-ky-scheduler', 'linkwechat', 1, 'https://127.0.0.1', '2023-05-26 17:23:12');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (1, 3, '动态日报', '2022-11-14 11:06:36', '2023-03-13 11:11:39', 'HaoN', '', 'CRON', '0 0 10 * * ?', 'DO_NOTHING', 'FAILOVER', 'weGroupAndCustomerCountDataTask', '', 'SERIAL_EXECUTION', 10, 0, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:06:36', '', 1, 1700704800000, 1700791200000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (3, 3, '群聊数据拉取任务', '2022-11-14 11:11:42', '2023-05-19 10:44:50', 'sxw', '', 'CRON', '0 0 6 * * ?', 'DO_NOTHING', 'FAILOVER', 'weGroupChatStatisticTask', '', 'SERIAL_EXECUTION', 10, 3, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:11:42', '', 1, 1700690400000, 1700776800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (4, 3, '群聊群主数据拉取任务', '2022-11-14 11:13:48', '2023-05-22 09:42:58', 'sxw', '', 'CRON', '0 0 6 * * ?', 'DO_NOTHING', 'FAILOVER', 'weGroupChatUserStatisticTask', '', 'SERIAL_EXECUTION', 10, 3, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:13:48', '', 1, 1700690400000, 1700776800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (5, 3, '员工活码变更任务', '2022-11-14 11:16:23', '2022-11-14 11:24:52', 'sxw', '', 'CRON', '0 10 * * * ?', 'DO_NOTHING', 'FAILOVER', 'weQrCodeUpdateTask', '', 'SERIAL_EXECUTION', 10, 3, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:16:23', '', 1, 1700709000000, 1700712600000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (6, 3, '提前结束sop提处理', '2022-11-14 11:17:17', '2022-11-14 11:24:49', 'HaoN', '', 'CRON', '0 */5 * * * ?', 'DO_NOTHING', 'FAILOVER', 'earlyEndSopTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:17:17', '', 1, 1700710500000, 1700710800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (7, 3, '创建周期群sop任务', '2022-11-14 11:18:08', '2022-11-14 11:24:46', 'HaoN', '', 'CRON', '0 0 0 ? * MON', 'DO_NOTHING', 'FAILOVER', 'createCycleGroupSopTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:18:08', '', 1, 1700409600000, 1701014400000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (8, 3, 'sop任务每日任务提醒', '2022-11-14 11:18:55', '2022-11-14 11:24:43', 'HaoN', '', 'CRON', '0 0 8 * * ?', 'DO_NOTHING', 'FAILOVER', 'pushWeChatTypeTipTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:18:55', '', 1, 1700697600000, 1700784000000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (9, 3, '联系客户统计数据拉取任务', '2022-11-14 11:24:24', '2023-05-19 10:44:21', 'sxw', '', 'CRON', '0 0 5 * * ?', 'DO_NOTHING', 'FAILOVER', 'weUserBehaviorDataTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2022-11-14 11:24:24', '', 1, 1700686800000, 1700773200000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (10, 3, '智能表单-定时表单任务', '2022-11-18 18:34:25', '2022-12-14 16:05:27', 'HaoN', '', 'CRON', '0 0 0 * * ?', 'DO_NOTHING', 'FIRST', 'weFormSurveyCatalogueTask', '', 'SERIAL_EXECUTION', 0, 2, 'BEAN', '', 'GLUE代码初始化', '2022-11-18 18:34:25', '', 1, 1700668800000, 1700755200000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (11, 3, '应用消息定时发送任务', '2022-11-25 18:27:34', '2022-11-25 18:30:00', 'sxw', '', 'CRON', '0 0/5 * * * ?', 'DO_NOTHING', 'FAILOVER', 'weAgentMsgDelaySendTask', '', 'SERIAL_EXECUTION', 60, 3, 'BEAN', '', 'GLUE代码初始化', '2022-11-25 18:27:34', '', 1, 1700710500000, 1700710800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (12, 3, '商品中心-同步订单', '2022-12-02 16:34:32', '2022-12-02 16:34:53', 'WangYX', '', 'CRON', '0 0 * * * ?', 'DO_NOTHING', 'FIRST', 'weProductOrderSyncTask', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-12-02 16:34:32', '', 1, 1700708400000, 1700712000000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (13, 3, '客服客户质量分析任务', '2023-01-04 10:36:24', '2023-01-04 10:37:15', 'sxw', '', 'CRON', '0 0 2 * * ?', 'DO_NOTHING', 'FAILOVER', 'weKfCustomerStatTask', '', 'SERIAL_EXECUTION', 10, 3, 'BEAN', '', 'GLUE代码初始化', '2023-01-04 10:36:24', '', 1, 1700676000000, 1700762400000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (14, 3, '客服员工质量分析任务', '2023-01-04 10:37:04', '2023-01-04 10:37:12', 'sxw', '', 'CRON', '0 0 2 * * ?', 'DO_NOTHING', 'FAILOVER', 'weKfUserStatTask', '', 'SERIAL_EXECUTION', 10, 30, 'BEAN', '', 'GLUE代码初始化', '2023-01-04 10:37:04', '', 1, 1700676000000, 1700762400000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (15, 3, '短链统计任务', '2023-01-28 10:18:01', '2023-03-17 11:45:55', 'sxw', '', 'CRON', '59 59 23 * * ?', 'DO_NOTHING', 'ROUND', 'weShortLinkStatisticTask', '', 'SERIAL_EXECUTION', 60, 3, 'BEAN', '', 'GLUE代码初始化', '2023-01-28 10:18:01', '', 1, 1700668799000, 1700755199000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (16, 3, '短链推广统计任务', '2023-04-03 09:43:25', '2023-04-03 09:43:34', 'WangYX', '', 'CRON', '59 59 23 * * ?', 'DO_NOTHING', 'FIRST', 'shortLinkPromotionStatisticTask', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2023-04-03 09:43:25', '', 1, 1700668799000, 1700755199000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (17, 3, '裂变处理', '2023-04-10 18:18:27', '2023-06-01 17:37:10', 'HaoN', '', 'CRON', '0 0/2 * * * ?', 'DO_NOTHING', 'FAILOVER', 'weTaskFissionStatusTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-04-10 18:18:27', '', 1, 1700710680000, 1700710800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (18, 3, '质检规则通知任务', '2023-05-11 18:19:00', '2023-05-17 17:31:57', 'sxw', '', 'CRON', '0 0/1 * * * ?', 'DO_NOTHING', 'FAILOVER', 'weChatMsgQiRuleNoticeTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-11 18:19:00', '', 1, 1700710680000, 1700710740000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (19, 3, '获取会话内容存档开启成员列表', '2023-05-18 10:26:01', '2023-05-18 10:59:45', 'sxw', '', 'CRON', '0 0 2 * * ?', 'DO_NOTHING', 'FAILOVER', 'wePermitUserListTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-18 10:26:01', '', 1, 1700676000000, 1700762400000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (20, 3, '获取会话中外部成员的同意情况', '2023-05-18 10:36:18', '2023-05-18 11:31:58', 'sxw', '', 'CRON', '0 0 1 * * ?', 'DO_NOTHING', 'FAILOVER', 'weCheckSingleAgreeTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-18 10:36:18', '', 1, 1700672400000, 1700758800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (21, 3, '获取会话内容存档外部群外部联系人的同意情况', '2023-05-18 10:36:43', '2023-05-18 11:32:02', 'sxw', '', 'CRON', '0 0 3 * * ?', 'DO_NOTHING', 'FAILOVER', 'weCheckRoomAgreeTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-18 10:36:43', '', 1, 1700679600000, 1700766000000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (22, 3, '会话拉取定时任务', '2023-05-22 16:10:02', '2023-09-28 19:21:22', 'sxw', '', 'CRON', '0/5 * * * * ?', 'DO_NOTHING', 'FAILOVER', 'weChatMsgPullTask', '{\"synchAll\":false}', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-22 16:10:02', '', 1, 1700710730000, 1700710735000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (23, 3, '质检周报员工每日计算任务', '2023-05-22 17:22:45', '2023-05-26 10:31:14', 'sxw', '', 'CRON', '0 0 1 * * ?', 'DO_NOTHING', 'FAILOVER', 'weChatMsgQiRuleUserStatisticsTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-22 17:22:45', '', 1, 1700672400000, 1700758800000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (24, 3, '会话质检周报统计任务', '2023-05-22 17:23:34', '2023-05-26 10:31:11', 'sxw', '', 'CRON', '0 0 3 * * ?', 'DO_NOTHING', 'FAILOVER', 'weChatMsgQiRuleWeeklyStatisticsTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-22 17:23:34', '', 1, 1700679600000, 1700766000000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (25, 3, '会话质检周报通知任务', '2023-05-22 17:26:31', '2023-05-26 10:31:06', 'sxw', '', 'CRON', '0 0 18 ? * FRI', 'DO_NOTHING', 'FAILOVER', 'chatMsgQiRuleWeeklyNoticeTask', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-05-22 17:26:31', '', 1, 1700215200000, 1700820000000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (26, 3, '企微发送方式sop提醒', '2023-06-26 19:28:13', '2023-07-09 22:12:06', 'HaoN', '', 'CRON', '0 */1 * * * ?', 'DO_NOTHING', 'FAILOVER', 'builderXkSopPlanTip', '', 'SERIAL_EXECUTION', 10, 2, 'BEAN', '', 'GLUE代码初始化', '2023-06-26 19:28:13', '', 1, 1700710680000, 1700710740000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (27, 3, '通用短链统计任务', '2023-07-24 16:41:02', '2023-11-23 11:33:15', 'sxw', '', 'CRON', '59 59 23 * * ?', 'DO_NOTHING', 'ROUND', 'weCommonLinkStatisticTask', '', 'SERIAL_EXECUTION', 60, 3, 'BEAN', '', 'GLUE代码初始化', '2023-07-24 16:41:02', '', 1, 0, 1700755199000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (28, 3, '线索中心-线索长时间未跟进', '2023-08-22 11:44:00', '2023-08-22 11:45:15', 'WangYX', '', 'CRON', '0 0 0 * * ?', 'DO_NOTHING', 'FIRST', 'leadsLongTimeNotFollowUp', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2023-08-22 11:44:00', '', 1, 1700668800000, 1700755200000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (29, 3, '线索中心-线索自动回收', '2023-08-22 11:44:59', '2023-08-22 11:45:11', 'WangYX', '', 'CRON', '0 0 0 * * ?', 'DO_NOTHING', 'FIRST', 'weLeadsAutoRecoveryTask', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2023-08-22 11:44:59', '', 1, 1700668800000, 1700755200000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (30, 3, '朋友圈任务执行', '2023-11-18 22:58:29', '2023-11-23 11:35:05', 'HaoN', '', 'CRON', '0/5 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendWeMomentHandle', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2023-11-18 22:58:29', '', 1, 1700710730000, 1700710735000);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (31, 3, '通用短链统计任务', '2023-07-24 16:41:02', '2023-11-23 11:33:15', 'sxw', '', 'CRON', '59 59 23 * * ?', 'DO_NOTHING', 'ROUND', 'weCommonLinkStatisticTask', '', 'SERIAL_EXECUTION', 60, 3, 'BEAN', '', 'GLUE代码初始化', '2023-07-24 16:41:02', '', 1, 1701878399000, 1701964799000);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_lock` (`lock_name`) VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1828188 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_registry` (`id`, `registry_group`, `registry_key`, `registry_value`, `update_time`) VALUES (171, 'EXECUTOR', 'linkwechat-scheduler', 'http://101.37.20.232:18081/', '2023-06-02 13:43:24');
INSERT INTO `xxl_job_registry` (`id`, `registry_group`, `registry_key`, `registry_value`, `update_time`) VALUES (206, 'EXECUTOR', 'linkwechat-ky-scheduler', 'http://139.155.191.21:18081/', '2023-06-02 13:43:37');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_user` (`id`, `username`, `password`, `role`, `permission`) VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
