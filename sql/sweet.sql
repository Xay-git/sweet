/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sweet

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-12-11 19:09:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `DEPT_ID` varchar(32) NOT NULL COMMENT '部门ID',
  `PARENT_ID` varchar(32) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PARENT_IDS` varchar(1000) DEFAULT NULL COMMENT '父级ID集合',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('24c43877d7cc4e1a4b7957a4324843a3', '0', 'NBA', '1', '2019-11-29 16:42:51', '2019-12-03 15:16:11', '0');
INSERT INTO `t_dept` VALUES ('61d59fc36dfd9e0f8d477faa2b3f545f', '24c43877d7cc4e1a4b7957a4324843a3', '湖人队', '2', '2019-11-29 16:43:01', '2019-12-05 10:58:43', '0,24c43877d7cc4e1a4b7957a4324843a3');

-- ----------------------------
-- Table structure for t_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_file_info`;
CREATE TABLE `t_file_info` (
  `file_id` varchar(50) NOT NULL COMMENT '主键id',
  `parent_id` varchar(50) DEFAULT NULL,
  `file_bucket` varchar(100) DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `file_suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀',
  `file_size_kb` bigint(20) DEFAULT NULL COMMENT '文件大小kb',
  `final_name` varchar(100) NOT NULL COMMENT '文件唯一标识id',
  `file_path` varchar(1000) DEFAULT NULL COMMENT '存储路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建用户',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改用户',
  `file_type` tinyint(2) DEFAULT NULL COMMENT '0文件夹 1文件',
  `file_sys_path` varchar(1000) DEFAULT NULL COMMENT '存放的系统路径',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

-- ----------------------------
-- Records of t_file_info
-- ----------------------------
INSERT INTO `t_file_info` VALUES ('00d7c82c27c6d89fbb2b63d81200a9c6', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '00d7c82c27c6d89fbb2b63d81200a9c6.jpg', '/upload/avatar/00d7c82c27c6d89fbb2b63d81200a9c6.jpg', '2019-12-11 11:03:47', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\00d7c82c27c6d89fbb2b63d81200a9c6.jpg');
INSERT INTO `t_file_info` VALUES ('01606fe0ddf2a680739b74ba2abe919e', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '01606fe0ddf2a680739b74ba2abe919e.jpg', '/upload/avatar/01606fe0ddf2a680739b74ba2abe919e.jpg', '2019-12-11 10:25:47', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\01606fe0ddf2a680739b74ba2abe919e.jpg');
INSERT INTO `t_file_info` VALUES ('0203072b855a5f9a14b5a59470641fb9', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', '0203072b855a5f9a14b5a59470641fb9.jpg', '/upload/avatar/0203072b855a5f9a14b5a59470641fb9.jpg', '2019-12-11 10:07:33', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\0203072b855a5f9a14b5a59470641fb9.jpg');
INSERT INTO `t_file_info` VALUES ('0400c658d62546ee321c23b9b172455c', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', '0400c658d62546ee321c23b9b172455c.jpg', '/upload/avatar/0400c658d62546ee321c23b9b172455c.jpg', '2019-12-06 17:54:28', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\0400c658d62546ee321c23b9b172455c.jpg');
INSERT INTO `t_file_info` VALUES ('08b1bbb9621e1998a50a03f6edf9f058', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '08b1bbb9621e1998a50a03f6edf9f058.jpg', '/upload/avatar/08b1bbb9621e1998a50a03f6edf9f058.jpg', '2019-12-11 10:31:44', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\08b1bbb9621e1998a50a03f6edf9f058.jpg');
INSERT INTO `t_file_info` VALUES ('08c5328b768025369c3e14261d4aae6a', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', '08c5328b768025369c3e14261d4aae6a.jpg', '/upload/avatar/08c5328b768025369c3e14261d4aae6a.jpg', '2019-12-11 06:10:55', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\08c5328b768025369c3e14261d4aae6a.jpg');
INSERT INTO `t_file_info` VALUES ('0baba00dc77029a1f69415044f238d8d', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '0baba00dc77029a1f69415044f238d8d.jpg', '/upload/avatar/0baba00dc77029a1f69415044f238d8d.jpg', '2019-12-11 10:08:23', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\0baba00dc77029a1f69415044f238d8d.jpg');
INSERT INTO `t_file_info` VALUES ('12b22a6786fd8fb7a4f5e08dbb6612ac', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (3).jpg', 'jpg', '46', '12b22a6786fd8fb7a4f5e08dbb6612ac.jpg', '/upload/avatar/12b22a6786fd8fb7a4f5e08dbb6612ac.jpg', '2019-12-11 09:54:36', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\12b22a6786fd8fb7a4f5e08dbb6612ac.jpg');
INSERT INTO `t_file_info` VALUES ('1782e53f41d09ee82fc9b832242f9639', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (9).jpg', 'jpg', '37', '1782e53f41d09ee82fc9b832242f9639.jpg', '/upload/avatar/1782e53f41d09ee82fc9b832242f9639.jpg', '2019-12-11 09:50:58', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\1782e53f41d09ee82fc9b832242f9639.jpg');
INSERT INTO `t_file_info` VALUES ('23f9c6b5f3f88455fb9a6352281b8f4c', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (10).jpg', 'jpg', '78', '23f9c6b5f3f88455fb9a6352281b8f4c.jpg', '/upload/avatar/23f9c6b5f3f88455fb9a6352281b8f4c.jpg', '2019-12-11 09:44:13', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\23f9c6b5f3f88455fb9a6352281b8f4c.jpg');
INSERT INTO `t_file_info` VALUES ('26d678a15f1d74dbb164f317c6d756fb', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '26d678a15f1d74dbb164f317c6d756fb.jpg', '/upload/avatar/26d678a15f1d74dbb164f317c6d756fb.jpg', '2019-12-11 06:10:53', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\26d678a15f1d74dbb164f317c6d756fb.jpg');
INSERT INTO `t_file_info` VALUES ('2725b97b07b1f7b7ca92f392c2f076d7', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (3).jpg', 'jpg', '46', '2725b97b07b1f7b7ca92f392c2f076d7.jpg', '/upload/avatar/2725b97b07b1f7b7ca92f392c2f076d7.jpg', '2019-12-11 10:17:41', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\2725b97b07b1f7b7ca92f392c2f076d7.jpg');
INSERT INTO `t_file_info` VALUES ('317f95c607a9a6ecd8bc35d2317859f8', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (6).jpg', 'jpg', '52', '317f95c607a9a6ecd8bc35d2317859f8.jpg', '/upload/avatar/317f95c607a9a6ecd8bc35d2317859f8.jpg', '2019-12-11 10:17:45', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\317f95c607a9a6ecd8bc35d2317859f8.jpg');
INSERT INTO `t_file_info` VALUES ('31c0c69e38302cbabde055394e5dad73', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', '31c0c69e38302cbabde055394e5dad73.jpg', '/upload/avatar/31c0c69e38302cbabde055394e5dad73.jpg', '2019-12-11 10:34:31', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\31c0c69e38302cbabde055394e5dad73.jpg');
INSERT INTO `t_file_info` VALUES ('32f464a89fb82c1b8979510c80979700', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (3).jpg', 'jpg', '46', '32f464a89fb82c1b8979510c80979700.jpg', '/upload/avatar/32f464a89fb82c1b8979510c80979700.jpg', '2019-12-11 09:50:06', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\32f464a89fb82c1b8979510c80979700.jpg');
INSERT INTO `t_file_info` VALUES ('33addc0fec06495d18f98c22899f1c2d', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (6).jpg', 'jpg', '52', '33addc0fec06495d18f98c22899f1c2d.jpg', '/upload/avatar/33addc0fec06495d18f98c22899f1c2d.jpg', '2019-12-11 11:03:52', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\33addc0fec06495d18f98c22899f1c2d.jpg');
INSERT INTO `t_file_info` VALUES ('340ed3d64f541f9226c20f33ccb9e526', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (6).jpg', 'jpg', '52', '340ed3d64f541f9226c20f33ccb9e526.jpg', '/upload/avatar/340ed3d64f541f9226c20f33ccb9e526.jpg', '2019-12-11 09:53:35', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\340ed3d64f541f9226c20f33ccb9e526.jpg');
INSERT INTO `t_file_info` VALUES ('375cfc987c5dd1812c3b174724cfec5e', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', '375cfc987c5dd1812c3b174724cfec5e.jpg', '/upload/avatar/375cfc987c5dd1812c3b174724cfec5e.jpg', '2019-12-11 10:12:31', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\375cfc987c5dd1812c3b174724cfec5e.jpg');
INSERT INTO `t_file_info` VALUES ('39b4074bbbdc45ef1bca98f5637d4dc6', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '39b4074bbbdc45ef1bca98f5637d4dc6.jpg', '/upload/avatar/39b4074bbbdc45ef1bca98f5637d4dc6.jpg', '2019-12-11 10:07:16', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\39b4074bbbdc45ef1bca98f5637d4dc6.jpg');
INSERT INTO `t_file_info` VALUES ('3a428ab804836177d7f93d3957f7c144', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', '3a428ab804836177d7f93d3957f7c144.jpg', '/upload/avatar/3a428ab804836177d7f93d3957f7c144.jpg', '2019-12-11 10:10:31', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\3a428ab804836177d7f93d3957f7c144.jpg');
INSERT INTO `t_file_info` VALUES ('3c849256e113aa5017fc3e88bb15e89d', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '3c849256e113aa5017fc3e88bb15e89d.jpg', '/upload/avatar/3c849256e113aa5017fc3e88bb15e89d.jpg', '2019-12-11 09:55:59', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\3c849256e113aa5017fc3e88bb15e89d.jpg');
INSERT INTO `t_file_info` VALUES ('3f118f73f780216ff04fa145758a2dcb', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (6).jpg', 'jpg', '52', '3f118f73f780216ff04fa145758a2dcb.jpg', '/upload/avatar/3f118f73f780216ff04fa145758a2dcb.jpg', '2019-12-11 10:29:49', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\3f118f73f780216ff04fa145758a2dcb.jpg');
INSERT INTO `t_file_info` VALUES ('3f71c168a9d4659f4a1c5b2eaa53d4da', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '3f71c168a9d4659f4a1c5b2eaa53d4da.jpg', '/upload/avatar/3f71c168a9d4659f4a1c5b2eaa53d4da.jpg', '2019-12-11 09:57:18', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\3f71c168a9d4659f4a1c5b2eaa53d4da.jpg');
INSERT INTO `t_file_info` VALUES ('413f695bc17baa02b72b02b8b9efd6a2', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '413f695bc17baa02b72b02b8b9efd6a2.jpg', '/upload/avatar/413f695bc17baa02b72b02b8b9efd6a2.jpg', '2019-12-11 10:28:43', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\413f695bc17baa02b72b02b8b9efd6a2.jpg');
INSERT INTO `t_file_info` VALUES ('420f3efe75d0fd16e59feae6a944d369', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', '420f3efe75d0fd16e59feae6a944d369.jpg', '/upload/avatar/420f3efe75d0fd16e59feae6a944d369.jpg', '2019-12-11 10:57:37', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\420f3efe75d0fd16e59feae6a944d369.jpg');
INSERT INTO `t_file_info` VALUES ('430ae5dd4d5707a75515d84bbb5c8e66', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', '430ae5dd4d5707a75515d84bbb5c8e66.jpg', '/upload/avatar/430ae5dd4d5707a75515d84bbb5c8e66.jpg', '2019-12-11 09:50:40', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\430ae5dd4d5707a75515d84bbb5c8e66.jpg');
INSERT INTO `t_file_info` VALUES ('44fe32430f5e1befd74f9e7b666805e7', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '44fe32430f5e1befd74f9e7b666805e7.jpg', '/upload/avatar/44fe32430f5e1befd74f9e7b666805e7.jpg', '2019-12-11 10:01:38', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\44fe32430f5e1befd74f9e7b666805e7.jpg');
INSERT INTO `t_file_info` VALUES ('460bb2ba3da93462daf22c09a99b74bd', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', '460bb2ba3da93462daf22c09a99b74bd.jpg', '/upload/avatar/460bb2ba3da93462daf22c09a99b74bd.jpg', '2019-12-11 10:29:38', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\460bb2ba3da93462daf22c09a99b74bd.jpg');
INSERT INTO `t_file_info` VALUES ('4e60399582d3bb2fb86a1ecb80be7222', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '4e60399582d3bb2fb86a1ecb80be7222.jpg', '/upload/avatar/4e60399582d3bb2fb86a1ecb80be7222.jpg', '2019-12-11 10:29:22', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\4e60399582d3bb2fb86a1ecb80be7222.jpg');
INSERT INTO `t_file_info` VALUES ('5441fae82defc09ebc211a89706d0cb3', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (10).jpg', 'jpg', '78', '5441fae82defc09ebc211a89706d0cb3.jpg', '/upload/avatar/5441fae82defc09ebc211a89706d0cb3.jpg', '2019-12-11 09:47:30', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\5441fae82defc09ebc211a89706d0cb3.jpg');
INSERT INTO `t_file_info` VALUES ('57f0faff14e6a01ea8225457dab50720', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '57f0faff14e6a01ea8225457dab50720.jpg', '/upload/avatar/57f0faff14e6a01ea8225457dab50720.jpg', '2019-12-11 10:27:36', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\57f0faff14e6a01ea8225457dab50720.jpg');
INSERT INTO `t_file_info` VALUES ('5d1dee171292d32232980cd7db6721a7', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '5d1dee171292d32232980cd7db6721a7.jpg', '/upload/avatar/5d1dee171292d32232980cd7db6721a7.jpg', '2019-12-11 09:56:30', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\5d1dee171292d32232980cd7db6721a7.jpg');
INSERT INTO `t_file_info` VALUES ('6012c73332b4d3e99c7c16d3bf593b93', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', '6012c73332b4d3e99c7c16d3bf593b93.jpg', '/upload/avatar/6012c73332b4d3e99c7c16d3bf593b93.jpg', '2019-12-11 10:22:19', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\6012c73332b4d3e99c7c16d3bf593b93.jpg');
INSERT INTO `t_file_info` VALUES ('62df0bff799bfab1dcfbb91634c9eb15', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (8).jpg', 'jpg', '40', '62df0bff799bfab1dcfbb91634c9eb15.jpg', '/upload/avatar/62df0bff799bfab1dcfbb91634c9eb15.jpg', '2019-12-11 09:49:23', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\62df0bff799bfab1dcfbb91634c9eb15.jpg');
INSERT INTO `t_file_info` VALUES ('66a4f297c35aa4ecd36e313691605a4d', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', '66a4f297c35aa4ecd36e313691605a4d.jpg', '/upload/avatar/66a4f297c35aa4ecd36e313691605a4d.jpg', '2019-12-11 10:30:23', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\66a4f297c35aa4ecd36e313691605a4d.jpg');
INSERT INTO `t_file_info` VALUES ('692cadeba069a966d9c37de39fe41921', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '692cadeba069a966d9c37de39fe41921.jpg', '/upload/avatar/692cadeba069a966d9c37de39fe41921.jpg', '2019-12-11 10:24:57', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\692cadeba069a966d9c37de39fe41921.jpg');
INSERT INTO `t_file_info` VALUES ('6da700f68f691700c636d68384a3faf6', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (10).jpg', 'jpg', '78', '6da700f68f691700c636d68384a3faf6.jpg', '/upload/avatar/6da700f68f691700c636d68384a3faf6.jpg', '2019-12-11 09:54:29', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\6da700f68f691700c636d68384a3faf6.jpg');
INSERT INTO `t_file_info` VALUES ('71fc33ae51539e1a36e27e44336a0e68', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '71fc33ae51539e1a36e27e44336a0e68.jpg', '/upload/avatar/71fc33ae51539e1a36e27e44336a0e68.jpg', '2019-12-06 17:53:46', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\71fc33ae51539e1a36e27e44336a0e68.jpg');
INSERT INTO `t_file_info` VALUES ('7aef20098fdeaf489b1270e77b6eb844', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '7aef20098fdeaf489b1270e77b6eb844.jpg', '/upload/avatar/7aef20098fdeaf489b1270e77b6eb844.jpg', '2019-12-11 10:27:54', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\7aef20098fdeaf489b1270e77b6eb844.jpg');
INSERT INTO `t_file_info` VALUES ('7b89940b77cd4f1088f5b6d264de3fc3', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', '7b89940b77cd4f1088f5b6d264de3fc3.jpg', '/upload/avatar/7b89940b77cd4f1088f5b6d264de3fc3.jpg', '2019-12-11 10:30:15', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\7b89940b77cd4f1088f5b6d264de3fc3.jpg');
INSERT INTO `t_file_info` VALUES ('7bf8610d908b197164cc8adeab373dbf', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '7bf8610d908b197164cc8adeab373dbf.jpg', '/upload/avatar/7bf8610d908b197164cc8adeab373dbf.jpg', '2019-12-11 10:22:17', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\7bf8610d908b197164cc8adeab373dbf.jpg');
INSERT INTO `t_file_info` VALUES ('88acd36a93e1195360a99e33d4694137', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '88acd36a93e1195360a99e33d4694137.jpg', '/upload/avatar/88acd36a93e1195360a99e33d4694137.jpg', '2019-12-11 09:55:08', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\88acd36a93e1195360a99e33d4694137.jpg');
INSERT INTO `t_file_info` VALUES ('8d8c079f522c5407ff3758a0126d795e', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', '8d8c079f522c5407ff3758a0126d795e.jpg', '/upload/avatar/8d8c079f522c5407ff3758a0126d795e.jpg', '2019-12-11 10:09:55', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\8d8c079f522c5407ff3758a0126d795e.jpg');
INSERT INTO `t_file_info` VALUES ('8e508ac812ddf89a69cea5f6b3271b27', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '8e508ac812ddf89a69cea5f6b3271b27.jpg', '/upload/avatar/8e508ac812ddf89a69cea5f6b3271b27.jpg', '2019-12-11 07:49:02', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\8e508ac812ddf89a69cea5f6b3271b27.jpg');
INSERT INTO `t_file_info` VALUES ('91098cb43c0b9544160885de59d339f5', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '91098cb43c0b9544160885de59d339f5.jpg', '/upload/avatar/91098cb43c0b9544160885de59d339f5.jpg', '2019-12-11 10:15:46', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\91098cb43c0b9544160885de59d339f5.jpg');
INSERT INTO `t_file_info` VALUES ('9dbbd230c05d6916dceae4af4f14637d', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (3).jpg', 'jpg', '46', '9dbbd230c05d6916dceae4af4f14637d.jpg', '/upload/avatar/9dbbd230c05d6916dceae4af4f14637d.jpg', '2019-12-11 10:01:41', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\9dbbd230c05d6916dceae4af4f14637d.jpg');
INSERT INTO `t_file_info` VALUES ('a1a59baa622e018ca17916c78407cc63', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'a1a59baa622e018ca17916c78407cc63.jpg', '/upload/avatar/a1a59baa622e018ca17916c78407cc63.jpg', '2019-12-11 10:00:40', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\a1a59baa622e018ca17916c78407cc63.jpg');
INSERT INTO `t_file_info` VALUES ('a1ffbcac63807b29116ab082834b735a', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'a1ffbcac63807b29116ab082834b735a.jpg', '/upload/avatar/a1ffbcac63807b29116ab082834b735a.jpg', '2019-12-11 10:30:47', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\a1ffbcac63807b29116ab082834b735a.jpg');
INSERT INTO `t_file_info` VALUES ('a347414de3ce482f45daae61d7a22bcf', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (6).jpg', 'jpg', '52', 'a347414de3ce482f45daae61d7a22bcf.jpg', '/upload/avatar/a347414de3ce482f45daae61d7a22bcf.jpg', '2019-12-11 09:50:17', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\a347414de3ce482f45daae61d7a22bcf.jpg');
INSERT INTO `t_file_info` VALUES ('a67fca449a6d1976cdb20719d495b9af', '/', null, 'avatar', 'dir', null, 'avatar', null, '2019-12-06 17:53:46', null, null, null, '0', 'd:\\sweetUpload\\avatar');
INSERT INTO `t_file_info` VALUES ('a79eeaff5a8087c7157922c6ad2f78fd', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', 'a79eeaff5a8087c7157922c6ad2f78fd.jpg', '/upload/avatar/a79eeaff5a8087c7157922c6ad2f78fd.jpg', '2019-12-11 09:51:19', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\a79eeaff5a8087c7157922c6ad2f78fd.jpg');
INSERT INTO `t_file_info` VALUES ('aa085197ca1ae01e0c2b05e020ee8b3c', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', 'aa085197ca1ae01e0c2b05e020ee8b3c.jpg', '/upload/avatar/aa085197ca1ae01e0c2b05e020ee8b3c.jpg', '2019-12-11 10:08:16', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\aa085197ca1ae01e0c2b05e020ee8b3c.jpg');
INSERT INTO `t_file_info` VALUES ('ac08860793ffa2b635044411eee8d763', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (10).jpg', 'jpg', '78', 'ac08860793ffa2b635044411eee8d763.jpg', '/upload/avatar/ac08860793ffa2b635044411eee8d763.jpg', '2019-12-11 10:33:47', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\ac08860793ffa2b635044411eee8d763.jpg');
INSERT INTO `t_file_info` VALUES ('b59519d27f26e78c1deaa97b649fd197', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', 'b59519d27f26e78c1deaa97b649fd197.jpg', '/upload/avatar/b59519d27f26e78c1deaa97b649fd197.jpg', '2019-12-11 09:38:55', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\b59519d27f26e78c1deaa97b649fd197.jpg');
INSERT INTO `t_file_info` VALUES ('bbc08c3a224d92f85e20f6a2d49dfb53', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'bbc08c3a224d92f85e20f6a2d49dfb53.jpg', '/upload/avatar/bbc08c3a224d92f85e20f6a2d49dfb53.jpg', '2019-12-11 10:00:36', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\bbc08c3a224d92f85e20f6a2d49dfb53.jpg');
INSERT INTO `t_file_info` VALUES ('bd7312fbfb27e7b3b6df525cddc987ae', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'bd7312fbfb27e7b3b6df525cddc987ae.jpg', '/upload/avatar/bd7312fbfb27e7b3b6df525cddc987ae.jpg', '2019-12-11 10:04:38', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\bd7312fbfb27e7b3b6df525cddc987ae.jpg');
INSERT INTO `t_file_info` VALUES ('bd7731f7182c345b7986bc3456da5932', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', 'bd7731f7182c345b7986bc3456da5932.jpg', '/upload/avatar/bd7731f7182c345b7986bc3456da5932.jpg', '2019-12-11 10:27:40', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\bd7731f7182c345b7986bc3456da5932.jpg');
INSERT INTO `t_file_info` VALUES ('bf2c50a00ce1df27533ba6136d46658e', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', 'bf2c50a00ce1df27533ba6136d46658e.jpg', '/upload/avatar/bf2c50a00ce1df27533ba6136d46658e.jpg', '2019-12-11 09:51:29', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\bf2c50a00ce1df27533ba6136d46658e.jpg');
INSERT INTO `t_file_info` VALUES ('c6f92b5eee28c938575df13688955d70', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (10).jpg', 'jpg', '78', 'c6f92b5eee28c938575df13688955d70.jpg', '/upload/avatar/c6f92b5eee28c938575df13688955d70.jpg', '2019-12-11 07:48:52', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\c6f92b5eee28c938575df13688955d70.jpg');
INSERT INTO `t_file_info` VALUES ('c8efada75abf76802a832635b89c4ca2', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'c8efada75abf76802a832635b89c4ca2.jpg', '/upload/avatar/c8efada75abf76802a832635b89c4ca2.jpg', '2019-12-11 09:59:10', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\c8efada75abf76802a832635b89c4ca2.jpg');
INSERT INTO `t_file_info` VALUES ('c9c5a4c1feb9ed3f0a8dbf80ca7f7127', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', 'c9c5a4c1feb9ed3f0a8dbf80ca7f7127.jpg', '/upload/avatar/c9c5a4c1feb9ed3f0a8dbf80ca7f7127.jpg', '2019-12-11 10:10:05', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\c9c5a4c1feb9ed3f0a8dbf80ca7f7127.jpg');
INSERT INTO `t_file_info` VALUES ('cf514b9270eca03feeefb0908b563ae4', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', 'cf514b9270eca03feeefb0908b563ae4.jpg', '/upload/avatar/cf514b9270eca03feeefb0908b563ae4.jpg', '2019-12-11 10:25:01', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\cf514b9270eca03feeefb0908b563ae4.jpg');
INSERT INTO `t_file_info` VALUES ('d399d30b1f8bca5590ecc91f63033656', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'd399d30b1f8bca5590ecc91f63033656.jpg', '/upload/avatar/d399d30b1f8bca5590ecc91f63033656.jpg', '2019-12-11 10:25:22', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\d399d30b1f8bca5590ecc91f63033656.jpg');
INSERT INTO `t_file_info` VALUES ('db8c57c5afaab04dab7ad24c7ed29933', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'db8c57c5afaab04dab7ad24c7ed29933.jpg', '/upload/avatar/db8c57c5afaab04dab7ad24c7ed29933.jpg', '2019-12-11 10:09:21', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\db8c57c5afaab04dab7ad24c7ed29933.jpg');
INSERT INTO `t_file_info` VALUES ('e0f5f7b15bc5be69a2520ff9c789efa5', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'e0f5f7b15bc5be69a2520ff9c789efa5.jpg', '/upload/avatar/e0f5f7b15bc5be69a2520ff9c789efa5.jpg', '2019-12-11 09:53:32', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\e0f5f7b15bc5be69a2520ff9c789efa5.jpg');
INSERT INTO `t_file_info` VALUES ('e40e73288347b226fa1d5d6fe280b9ee', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (7).jpg', 'jpg', '34', 'e40e73288347b226fa1d5d6fe280b9ee.jpg', '/upload/avatar/e40e73288347b226fa1d5d6fe280b9ee.jpg', '2019-12-11 10:08:14', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\e40e73288347b226fa1d5d6fe280b9ee.jpg');
INSERT INTO `t_file_info` VALUES ('e4e89ecec121eaa4e8fb1b8d704d5e75', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (6).jpg', 'jpg', '52', 'e4e89ecec121eaa4e8fb1b8d704d5e75.jpg', '/upload/avatar/e4e89ecec121eaa4e8fb1b8d704d5e75.jpg', '2019-12-11 10:07:18', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\e4e89ecec121eaa4e8fb1b8d704d5e75.jpg');
INSERT INTO `t_file_info` VALUES ('e6df730ecd71f48bdb669f723d3a9167', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (7).jpg', 'jpg', '34', 'e6df730ecd71f48bdb669f723d3a9167.jpg', '/upload/avatar/e6df730ecd71f48bdb669f723d3a9167.jpg', '2019-12-11 09:49:19', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\e6df730ecd71f48bdb669f723d3a9167.jpg');
INSERT INTO `t_file_info` VALUES ('e7106906f1397fe3bccb6da12651f3da', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (5).jpg', 'jpg', '66', 'e7106906f1397fe3bccb6da12651f3da.jpg', '/upload/avatar/e7106906f1397fe3bccb6da12651f3da.jpg', '2019-12-11 10:10:23', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\e7106906f1397fe3bccb6da12651f3da.jpg');
INSERT INTO `t_file_info` VALUES ('eb02f68766aaef0427f980d9e0381986', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', 'eb02f68766aaef0427f980d9e0381986.jpg', '/upload/avatar/eb02f68766aaef0427f980d9e0381986.jpg', '2019-12-11 10:08:11', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\eb02f68766aaef0427f980d9e0381986.jpg');
INSERT INTO `t_file_info` VALUES ('ef4ec98afab1449319b9602771edc34c', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (4).jpg', 'jpg', '57', 'ef4ec98afab1449319b9602771edc34c.jpg', '/upload/avatar/ef4ec98afab1449319b9602771edc34c.jpg', '2019-12-11 09:49:16', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\ef4ec98afab1449319b9602771edc34c.jpg');
INSERT INTO `t_file_info` VALUES ('fc8e71eefa898cae2003c8a135d9bb17', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', 'fc8e71eefa898cae2003c8a135d9bb17.jpg', '/upload/avatar/fc8e71eefa898cae2003c8a135d9bb17.jpg', '2019-12-11 10:27:02', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\fc8e71eefa898cae2003c8a135d9bb17.jpg');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `MENU_ID` varchar(32) NOT NULL COMMENT '菜单/按钮ID',
  `PARENT_ID` varchar(32) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('0718706302ad70da58dae8bee3181dda', '881bac77e0690244cba83867665ffb5a', '文件管理', '/admin/file', null, '', '0', '3', '2019-12-05 15:59:09', '2019-12-05 16:04:20');
INSERT INTO `t_menu` VALUES ('0bf58ce456662b9f186683e41df1d92d', '5ad3caa634c441a58118ec2ffb424ee7', '部门管理', '/admin/dept', null, null, '0', '2', '2019-12-02 11:05:45', null);
INSERT INTO `t_menu` VALUES ('0c6bce3dd7d7a352acfbfcba16617709', '5ad3caa634c441a58118ec2ffb424ee7', '菜单管理', '/admin/menu', null, null, '0', '1', '2019-12-02 11:02:38', null);
INSERT INTO `t_menu` VALUES ('16446826125a42216f692db7db5fd91c', '5ad3caa634c441a58118ec2ffb424ee7', '用户管理', '/admin/user', null, null, '0', '3', '2019-12-02 11:09:16', null);
INSERT INTO `t_menu` VALUES ('1649ebe3eeb624b25e5914d8b1ce904b', '5ad3caa634c441a58118ec2ffb424ee7', '角色管理', '/admin/role', null, null, '0', '4', '2019-12-02 11:09:38', null);
INSERT INTO `t_menu` VALUES ('1f4efbedfbed0c9b1c8d6f56ea789f91', '881bac77e0690244cba83867665ffb5a', '代码生成', '/admin/gen', null, null, '0', '1', '2019-12-02 11:34:42', null);
INSERT INTO `t_menu` VALUES ('5ad3caa634c441a58118ec2ffb424ee7', '0', '系统管理', null, null, 'layui-icon-set', '0', '1', '2019-12-02 10:40:33', '2019-12-03 15:19:55');
INSERT INTO `t_menu` VALUES ('881bac77e0690244cba83867665ffb5a', '0', '开发工具', null, null, 'layui-icon-util', '0', '2', '2019-12-02 11:34:22', null);
INSERT INTO `t_menu` VALUES ('8c7fb301d2aab801523166b601998378', '5ad3caa634c441a58118ec2ffb424ee7', '在线用户', '/admin/online', null, null, '0', '5', '2019-12-06 18:26:56', null);
INSERT INTO `t_menu` VALUES ('9eb38e58ce3af6e3831fa824aa2cf65c', '0', '微信营销', null, null, 'layui-icon-login-wechat', '0', '3', '2019-12-04 16:10:39', null);
INSERT INTO `t_menu` VALUES ('ad30e1e6db74ac19d0f628f5df8c1c68', '881bac77e0690244cba83867665ffb5a', '接口文档', '/swagger-ui.html', null, null, '0', '2', '2019-12-05 11:08:22', null);
INSERT INTO `t_menu` VALUES ('ef092fbc62b691e3e3fc71ab795d804c', '9eb38e58ce3af6e3831fa824aa2cf65c', '公众号管理', '/admin/wxmp', null, null, '0', '1', '2019-12-04 16:17:11', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ROLE_ID` varchar(32) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '超级管理员', '2019-12-02 10:23:49');
INSERT INTO `t_role` VALUES ('2', 'test', '测试账户', '2019-12-02 10:23:52');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `ID` varchar(32) NOT NULL,
  `RID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `MID` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单角色表';

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('00214970016a00e043ad0b9e19b8e87e', '2', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('03caaea82fc91569eaec189fd3c8edbc', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('183fd256d48889b4b77e1abe3565dfb5', '1', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('1d6525839164c0aee1ef6cd64fc9bded', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('227fb2e3c69d6415db5bbe811b324a37', '2', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('2651f3ab64e5f984104eba4a11e325e5', '2', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('3164ba5c236cff5bf60f02aed834eb32', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('42e7eac80fc5b11337594c013fafb593', '2', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('5107f3ee916ea37eccb81752d7b6f907', '1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('5260c30e5a185b67e86ce059e5436d20', '1', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('5769026f6a060ceb9c1797f2d889cb8e', '2', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('5973e120c6b6259885da2342aaed2e84', '2', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('72df8f47e610e6ff5ad4d8d432d70963', '2', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('883eaab9c246d634ef651b867e29a3d3', '2', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('8d8d86f9da2beb2af416d65274a25782', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('8d9d28e04210737e70f84d0dc6a36058', '2', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('a247e628ab38e3456df89d052a327bc8', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('b3456ded72c63fc78bab2bb381ba955a', '1', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('c3c6f0d9a7fce3de2abea9ef19109b12', '2', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('c438390cd596f0c39fcbb0e7bdf4a442', '1', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('ca6a7569b468d33198b6dc27e61487cf', '1', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('eb1e3fb93fcf7c6698e99e08b5dca521', '2', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('fb061abed105a3d396e741270e9e67a2', '1', 'ef092fbc62b691e3e3fc71ab795d804c');

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT '' COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` varchar(255) DEFAULT NULL COMMENT '用户状态',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES ('988c5162bc94649353340f2841661701', '2', null, null, null, null, null);
INSERT INTO `t_test` VALUES ('a16bca04a56694e2895842842c18e29e', 'Pope', '1', null, null, null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT '' COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` varchar(255) DEFAULT NULL COMMENT '用户状态',
  `AVATAR` varchar(1000) DEFAULT NULL COMMENT '头像',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'c7242b2bc2435c1ead6b89f85d9e6a96', '2019-12-03 00:00:00', '1', null, '2019-12-03 15:14:39', '24c43877d7cc4e1a4b7957a4324843a3');
INSERT INTO `t_user` VALUES ('7f50d476d439534feef16728613e2396', 'kobe', 'e283671f405c40d88b9017e5d07f3a97', null, '1', '00d7c82c27c6d89fbb2b63d81200a9c6,33addc0fec06495d18f98c22899f1c2d', '2019-12-04 15:35:33', '61d59fc36dfd9e0f8d477faa2b3f545f');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `ID` varchar(32) NOT NULL,
  `UID` varchar(32) DEFAULT NULL,
  `RID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('131559e4c14238cbbc1a4c133a8c9b1b', '1', '1');
INSERT INTO `t_user_role` VALUES ('55de843eb318bab914218a775c3a9d79', '1', '2');
INSERT INTO `t_user_role` VALUES ('f142e15d2bcf999ce989b43032d78ce1', '7f50d476d439534feef16728613e2396', '2');
