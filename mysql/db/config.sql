-- MySQL dump 10.13  Distrib 8.4.2, for Linux (x86_64)
--
-- Host: localhost    Database: lw-config
-- ------------------------------------------------------
-- Server version	8.4.2

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
DROP DATABASE IF EXISTS `lw-config`;

CREATE DATABASE  `lw-config` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `lw-config`;
--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (1,'linkwe-common.yml','DEFAULT_GROUP','linkwechat:\n  # 获取ip地址开关\n  addressEnabled: false\n  #扫码登陆url\n  wecomeLoginUrl: https://open.work.weixin.qq.com/wwopen/sso/qrConnect?appid=ww622fc852f79c3f13&agentid=1000080&redirect_uri=http%3A%2F%2Fdemo.linkwechat.net%2F%23%2FauthRedirect&state=web_login\n  customerServiceQrUrl: https://link-wechat-1251309172.cos.ap-nanjing.myqcloud.com/2022/10/21/957501f7-8517-4186-b6f4-3272ad1b8e33.png\n  demoEnviron: false\n  baiduMapsAk: edGc5mIugVxx7lwUx9YpraKeWmExG64o #百度地图开发者ak\n  authorizeUrl: https://open.weixin.qq.com/connect/oauth2/authorize #js sdk身份认证url，不变\n  h5Domain: http://demo.linkwechat.net/mobile #移动端访问地址\n  taskFissionUrl: NULL/#/taskTreasure?taskId={} #任务宝链接配置\n  guideCodeUrl:  NULL/#/guideCode #导购码\n  guideGroupUrl: NULL/#/storeCode #导购群码\n  lostCustomerRedirectUrl: NULL/#/lostCustomers #客户流失\n  seasRedirectUrl: NULL/#/highSeas #客户公海链接\n  tagRedirectUrl: NULL/#/task #老客标签建群H5链接\n  customerSopRedirectUrl: NULL/#/personalSOPDetails #客户SOP的H5跳转链接\n  groupSopRedirectUrl: NULL/#/customerBaseDetails #客群SOP的H5跳转链接\n  liveUrl: NULL/index-wx.html#/reminder?id={0} #直播页面\n# Spring配置\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  devtools:\n    restart:\n      enabled: true\n  main:\n    allow-bean-definition-overriding: true\n    allow-circular-references: true\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\n    druid:\n      url: jdbc:p6spy:mysql://lw-mysql:3306/lw-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=Asia/Shanghai\n      username: root\n      password: password\n      # 初始连接数\n      initialSize: 5\n      # 最小连接池数量\n      minIdle: 10\n      # 最大连接池数量\n      maxActive: 20\n      # 配置获取连接等待超时的时间\n      maxWait: 60000\n      # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒\n      timeBetweenEvictionRunsMillis: 60000\n      # 配置一个连接在池中最小生存的时间，单位是毫秒\n      minEvictableIdleTimeMillis: 300000\n      # 配置一个连接在池中最大生存的时间，单位是毫秒\n      maxEvictableIdleTimeMillis: 900000\n      # 配置检测连接是否有效\n      validationQuery: SELECT 1 FROM DUAL\n      testWhileIdle: true\n      testOnBorrow: false\n      testOnReturn: false\n      filter:\n        stat:\n          enabled: true\n          # 慢SQL记录\n          log-slow-sql: true\n          slow-sql-millis: 1000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n  # redis 配置\n  redis:\n    # 地址\n    host: lw-redis\n    # 端口，默认为6379\n    port: 6379\n    database: 5\n    # 密码\n    password:\n    # 连接超时时间\n    timeout: 10s\n    lettuce:\n      pool:\n        # 连接池中的最小空闲连接\n        min-idle: 0\n        # 连接池中的最大空闲连接\n        max-idle: 8\n        # 连接池的最大数据库连接数\n        max-active: 8\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1ms\n      cluster:\n        refresh:\n          adaptive: true\n  rabbitmq:\n    host: lw-rabbitmq\n    port: 5672\n    username: lw\n    password: lw\n    virtual-host: linkWeChatCloud\n    #publisher-confirm-type: correlated #消息确认机制\n    listener:\n      simple:\n        acknowledge-mode: manual  #手动 ack\n        default-requeue-rejected: true\n        retry:\n          enabled: true\n          max-attempts: 3\n      direct:\n        acknowledge-mode: manual\n        retry:\n          enabled: true\n\n\nswagger:\n  enabled: true\n  pathMapping: /\n  title: LinkWeChat业务接口\n  description: LinkWeChat业务相关接口\n  version: 3.0\n\nfeign:\n  okhttp:\n    enabled: false\n  httpclient:\n    enabled: true\n  client:\n    refresh-enabled: true\n\nwecom:\n  welcome-msg-default: 您好，欢迎关注LinkWechat,如果对您有帮助，麻烦在码云上帮我们点个star，谢谢！\n  error-code-retry: -1,42001,42009,40082,40014\n  mq:\n    exchange:\n      callback: Ex_CallBack\n      sync: Ex_Sync\n      auth-install-fanout: Ex_AuthInstallFanout\n      delay: Ex_Delay\n      app-msg: Ex_AppMsg\n    route:\n      callback: Rk_CallBack\n      third-callback: Rk_Third_CallBack\n      sync:\n        group-chat: Rk_GroupChat\n        wecustomer: Rk_Wecustomer\n        group-tag: Rk_GroupTag\n        we-moments: Rk_Moments\n        user-depart: Rk_UserDepart\n      delay-group-msg: Rk_DelayGroupMsg\n      group-msg: Rk_GroupMsg\n      app-msg: Rk_AppMsg\n    queue:\n      callback: Qu_CallBack\n      sync:\n        group-chat: Qu_GroupChat\n        wecustomer: Qu_WeCustomer\n        grouptag:  Qu_GroupTag\n        we-moments: Qu_Moments\n        user-depart: Qu_UserDepart\n      delay-group-msg: Qu_DelayGroupMsg\n      group-msg: Qu_GroupMsg\n      app-msg: Qu_AppMsg\n  serve:\n    linkwe-wecom: linkwe-wecom\n    linkwe-auth: linkwe-auth\n    linkwe-file: linkwe-file\n    linkwe-api: linkwe-api','d4b70bb2ae01dac611955edf62f31516','2022-12-09 16:23:48','2022-12-12 06:33:54','nacos','112.26.67.108','','','','','','yaml','',''),(2,'linkwe-api.yml','DEFAULT_GROUP','server:\n  port: 9201\n  servlet:\n    # 应用的访问路径\n    context-path: /open\n  tomcat:\n    # tomcat的URI编码\n    uri-encoding: UTF-8','7c1e9ccf13f49f30bef94c63b1178d70','2022-12-09 16:23:48','2022-12-09 16:29:42','nacos','104.225.156.104','','','','','','yaml','',''),(3,'linkwe-auth.yml','DEFAULT_GROUP','# 项目相关配置\nlinkwechat:\n  # 名称\n  name: linkwe-auth\n  # 版本\n  version: 3.1.0\n  # 版权年份\n  copyrightYear: 2021\n# 开发环境配置\nserver:\n  port: 9200\n  servlet:\n    # 应用的访问路径\n    context-path: /\n  tomcat:\n    # tomcat的URI编码\n    uri-encoding: UTF-8\n\n# PageHelper分页插件\npagehelper:\n  helperDialect: mysql\n  reasonable: true\n  supportMethodsArguments: true\n  params: count=countSql\n\nmybatis-plus:\n  mapper-locations: classpath*:mapper/**/*Mapper.xml\n  type-aliases-package: com.linkwechat.**.domain\n  type-handlers-package: com.linkwechat.common.handler.GenericTypeHandler\n\nrsa:\n  privateKey: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAqhHyZfSsYourNxaY7Nt+PrgrxkiA50efORdI5U5lsW79MmFnusUA355oaSXcLhu5xxB38SMSyP2KvuKNPuH3owIDAQABAkAfoiLyL+Z4lf4Myxk6xUDgLaWGximj20CUf+5BKKnlrK+Ed8gAkM0HqoTt2UZwA5E2MzS4EI2gjfQhz5X28uqxAiEA3wNFxfrCZlSZHb0gn2zDpWowcSxQAgiCstxGUoOqlW8CIQDDOerGKH5OmCJ4Z21v+F25WaHYPxCFMvwxpcw99EcvDQIgIdhDTIqD2jfYjPTY8Jj3EDGPbH2HHuffvflECt3Ek60CIQCFRlCkHpi7hthhYhovyloRYsM+IS9h/0BzlEAuO0ktMQIgSPT3aFAgJYwKpqRYKlLDVcflZFCKY7u3UP8iWi1Qw0Y=\n  publicKey: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKoR8mX0rGKLqzcWmOzbfj64K8ZIgOdHnzkXSOVOZbFu/TJhZ7rFAN+eaGkl3C4buccQd/EjEsj9ir7ijT7h96MCAwEAAQ==','934ba282e5dab612e678ea31b6ad1c33','2022-12-09 16:23:48','2024-08-09 00:59:23',NULL,'192.168.126.231','','','','','','yaml','',''),(4,'linkwe-event-task.yml','DEFAULT_GROUP','server:\n  port: 6092\n','9a654644e0eddac1123843b07218a326','2022-12-09 16:23:48','2022-12-09 16:23:48',NULL,'104.225.156.104','','',NULL,NULL,NULL,'yaml',NULL,''),(5,'linkwe-file.yml','DEFAULT_GROUP','# Tomcat\nserver:\n  port: 9101\n  servlet:\n    # 应用的访问路径\n    context-path: /file\n\n# 项目相关配置\nlinkwechat:\n  # 腾讯云存储\n  file:\n    #单个数据大小,单位MB\n    maxFileSize: 50\n    #总上传数据大小,单位MB\n    maxRequestSize: 100\n    #腾讯云对象存储\n    object: tencentOss\n    cos:\n      secretId: \n      secretKey: \n      region: \n      bucketName: \n      cosImgUrlPrefix: ','29dcc42587e05194ea969a3af6715fad','2022-12-09 16:23:48','2022-12-12 06:40:09','nacos','112.26.67.108','','','','','','yaml','',''),(6,'linkwe-gateway.yml','DEFAULT_GROUP','# Tomcat\nserver:\n  port: 8080\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"\n\nsecurity:\n  ignore:\n    whites:\n      - /auth/**\n      - /open/wecom/**\n      - /open/groupCode/getActualCode/**\n      - /open/form/survey/getInfo/**\n      - /open/form/answer/add\n      - /system/area/list\n      - /open/form/answer/isCompleteSurvey\n      - /open/form/statistic/insertPieValue\n      - /open/form/statistic/siteStas\n      - /wx-api/material/get/**\n      - /wx-api/material/action/addView\n      - /wx-api/track/material/auth/**\n      - /wx-api/groupCode/getActualCode/**\n  captcha:\n    enabled: true\n    type: math\n\nspring:\n  application:\n    name: linkwechat-gateway\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n          filters:\n            - StripPrefix=1\n\nnacos:\n  gateway:\n    route:\n      config:\n        data-id: gateway-router\n        group: DEFAULT_GROUP','7c905e06c2d7d45c20fae33d44a80663','2022-12-09 16:23:48','2022-12-12 06:42:12','nacos','112.26.67.108','','','','','','yaml','',''),(7,'linkwe-scheduler.yml','DEFAULT_GROUP','server:\n  port: 9400\n\nxxl:\n  job:\n    admin:\n      addresses: http://lw-xxl-job:18080/xxl-job-admin\n    accessToken: default_token\n    executor:\n      appname: linkwechat-scheduler\n      address:\n      ip: lw-xxl-job\n      port: 18081\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n\nspring:\n  application:\n    name: linkwechat-scheduler\n','7b8320483b68a75cad2f334b0446a549','2022-12-09 16:23:48','2022-12-10 04:19:13','nacos','104.225.156.104','','','','','','yaml','',''),(8,'linkwe-wecom.yml','DEFAULT_GROUP','server:\n  # 服务器的HTTP端口，默认为8090\n  port: 9203\n  servlet:\n    # 应用的访问路径\n    context-path: /\n  tomcat:\n    # tomcat的URI编码\n    uri-encoding: UTF-8\n\n# forest配置\nforest:\n  backend: okhttp3\n  max-retry-count:  3 # 请求失败后重试次数，默认为0次不重试\n  max-retry-interval: 1000 #重试间隔时间\n  connect-timeout: 3000 #链接超时时间\n  timeout: 3000  # 请求超时时间\n  ## 日志总开关，打开/关闭Forest请求/响应日志（默认为 true）\n  log-enabled: true\n  ## 打开/关闭Forest请求日志（默认为 true）\n  log-request: true\n  ## 打开/关闭Forest响应状态日志（默认为 true）\n  log-response-status: true\n  ## 打开/关闭Forest响应内容日志（默认为 false）\n  log-response-content: true\n  variables:\n    weComServerUrl: https://qyapi.weixin.qq.com/cgi-bin\n    wxServerUrl: https://api.weixin.qq.com/sns\n    wxCommonServerUrl: https://api.weixin.qq.com/cgi-bin\n','f1f3d38423b606b71bf2a8b22dc0dae4','2022-12-09 16:23:48','2022-12-09 16:33:12','nacos','104.225.156.104','','','','','','yaml','',''),(9,'linkwe-wx-api.yml','DEFAULT_GROUP','server:\n  # 服务器的HTTP端口，默认为8090\n  port: 9204\n  servlet:\n    # 应用的访问路径\n    context-path: /wx-api\n  tomcat:\n    # tomcat的URI编码\n    uri-encoding: UTF-8\n','94bb73cf1081f976ddc6e9ba07fc981a','2022-12-09 16:23:48','2022-12-09 16:32:54','nacos','104.225.156.104','','','','','','yaml','',''),(10,'gateway-router','DEFAULT_GROUP','[{\n    \"id\": \"linkwe-auth\",\n    \"order\": 0,\n    \"predicates\": [{\n        \"args\": {\n            \"pattern\": \"/auth/**\"\n        },\n        \"name\": \"Path\"\n    }],\n    \"filters\":[{\n        \"name\":\"ValidateCodeFilter\"\n    },{\n        \"name\":\"CacheRequestFilter\"\n    }\n    ],\n    \"uri\": \"lb://linkwe-auth\"\n},{\n    \"id\": \"linkwe-auth-system\",\n    \"order\": 0,\n    \"predicates\": [{\n        \"args\": {\n            \"pattern\": \"/system/**\"\n        },\n        \"name\": \"Path\"\n    }],\n    \"uri\": \"lb://linkwe-auth\"\n},{\n    \"id\": \"linkwe-wecom\",\n    \"order\": 2,\n    \"predicates\": [{\n        \"args\": {\n            \"pattern\": \"/wecom/**\"\n        },\n        \"name\": \"Path\"\n    }],\n    \"filters\":[{\n        \"args\": {\n            \"_genkey_0\":\"1\"\n        },\n        \"name\":\"StripPrefix\"\n    }],\n    \"uri\": \"lb://linkwe-wecom\"\n},{\n    \"id\": \"linkwe-api\",\n    \"order\": 3,\n    \"predicates\": [{\n        \"args\": {\n            \"pattern\": \"/open/**\"\n        },\n        \"name\": \"Path\"\n    }],\n    \"uri\": \"lb://linkwe-api\"\n},{\n    \"id\": \"linkwe-file\",\n    \"order\": 4,\n    \"predicates\": [{\n        \"args\": {\n            \"pattern\": \"/file/**\"\n        },\n        \"name\": \"Path\"\n    }],\n    \"uri\": \"lb://linkwe-file\"\n},{\n  \"id\": \"linkwe-auth-common\",\n  \"order\": 0,\n  \"predicates\": [{\n    \"args\": {\n      \"pattern\": \"/common/**\"\n    },\n    \"name\": \"Path\"\n  }],\n  \"uri\": \"lb://linkwe-auth\"\n},{\n    \"id\": \"linkwe-wx-api\",\n    \"order\": 3,\n    \"predicates\": [{\n        \"args\": {\n            \"pattern\": \"/wx-api/**\"\n        },\n        \"name\": \"Path\"\n    }],\n    \"uri\": \"lb://linkwe-wx-api\"\n}]','55d6df74c5e0184cbb396d65dceec5a2','2022-12-09 16:23:48','2022-12-12 06:43:09','nacos','112.26.67.108','','','','','','json','','');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (3,34,'linkwe-auth.yml','DEFAULT_GROUP','','# 项目相关配置\nlinkwechat:\n  # 名称\n  name: linkwe-auth\n  # 版本\n  version: 3.1.0\n  # 版权年份\n  copyrightYear: 2021\n\n# 开发环境配置\nserver:\n  port: 9200\n  servlet:\n    # 应用的访问路径\n    context-path: /\n  tomcat:\n    # tomcat的URI编码\n    uri-encoding: UTF-8\n\n# PageHelper分页插件\npagehelper:\n  helperDialect: mysql\n  reasonable: true\n  supportMethodsArguments: true\n  params: count=countSql\n\nmybatis-plus:\n  mapper-locations: classpath*:mapper/**/*Mapper.xml\n  type-aliases-package: com.linkwechat.**.domain\n  type-handlers-package: com.linkwechat.common.handler.GenericTypeHandler','6f264c2c53c8d56f4b6c780b5a553886','2024-08-09 00:56:48','2024-08-08 16:56:49',NULL,'192.168.126.231','U','',''),(3,35,'linkwe-auth.yml','DEFAULT_GROUP','','# 项目相关配置\nlinkwechat:\n  # 名称\n  name: linkwe-auth\n  # 版本\n  version: 3.1.0\n  # 版权年份\n  copyrightYear: 2021\n# 开发环境配置\nserver:\n  port: 6880\n  servlet:\n    # 应用的访问路径\n    context-path: /\n  tomcat:\n    # tomcat的URI编码\n    uri-encoding: UTF-8\n\n# PageHelper分页插件\npagehelper:\n  helperDialect: mysql\n  reasonable: true\n  supportMethodsArguments: true\n  params: count=countSql\n\nmybatis-plus:\n  mapper-locations: classpath*:mapper/**/*Mapper.xml\n  type-aliases-package: com.linkwechat.**.domain\n  type-handlers-package: com.linkwechat.common.handler.GenericTypeHandler\n\nrsa:\n  privateKey: MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAqhHyZfSsYourNxaY7Nt+PrgrxkiA50efORdI5U5lsW79MmFnusUA355oaSXcLhu5xxB38SMSyP2KvuKNPuH3owIDAQABAkAfoiLyL+Z4lf4Myxk6xUDgLaWGximj20CUf+5BKKnlrK+Ed8gAkM0HqoTt2UZwA5E2MzS4EI2gjfQhz5X28uqxAiEA3wNFxfrCZlSZHb0gn2zDpWowcSxQAgiCstxGUoOqlW8CIQDDOerGKH5OmCJ4Z21v+F25WaHYPxCFMvwxpcw99EcvDQIgIdhDTIqD2jfYjPTY8Jj3EDGPbH2HHuffvflECt3Ek60CIQCFRlCkHpi7hthhYhovyloRYsM+IS9h/0BzlEAuO0ktMQIgSPT3aFAgJYwKpqRYKlLDVcflZFCKY7u3UP8iWi1Qw0Y=\n  publicKey: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKoR8mX0rGKLqzcWmOzbfj64K8ZIgOdHnzkXSOVOZbFu/TJhZ7rFAN+eaGkl3C4buccQd/EjEsj9ir7ijT7h96MCAwEAAQ==','3a921a4dbc67fe184fe4ffd4d31f57ce','2024-08-09 00:59:22','2024-08-08 16:59:23',NULL,'192.168.126.231','U','','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-08 17:14:42
