/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sweet

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-12-03 18:49:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` varchar(32) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `OPERATION` varchar(255) DEFAULT NULL COMMENT '用户操作',
  `TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `METHOD` varchar(255) DEFAULT NULL COMMENT '请求方法',
  `PARAMS` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1c16e1e0c14bedc54599cd65d39a180b', null, null, null, null, null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('293c7490ee7950968f98a1d379947edb', null, null, null, null, null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('509a7d1b17a9d42fcd7dcc66f5e8c07c', null, null, null, null, null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('8e69ab5893e3781e3517753e682bb127', null, null, null, null, null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('c13537aaf6f06a684d77bbf52e1b1e6e', null, null, null, null, null, '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('c6466998eac85e5104afa67f685ddf1b', null, null, null, null, null, '127.0.0.1', null);

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
INSERT INTO `t_dept` VALUES ('61d59fc36dfd9e0f8d477faa2b3f545f', '24c43877d7cc4e1a4b7957a4324843a3', '湖人队', '2', '2019-11-29 16:43:01', '2019-12-03 15:15:28', '0,24c43877d7cc4e1a4b7957a4324843a3');

-- ----------------------------
-- Table structure for t_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_file_info`;
CREATE TABLE `t_file_info` (
  `file_id` varchar(50) NOT NULL COMMENT '主键id',
  `file_bucket` varchar(100) DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `file_suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀',
  `file_size_kb` bigint(20) DEFAULT NULL COMMENT '文件大小kb',
  `final_name` varchar(100) NOT NULL COMMENT '文件唯一标识id',
  `file_path` varchar(1000) DEFAULT NULL COMMENT '存储路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

-- ----------------------------
-- Records of t_file_info
-- ----------------------------

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
INSERT INTO `t_menu` VALUES ('0bf58ce456662b9f186683e41df1d92d', '5ad3caa634c441a58118ec2ffb424ee7', '部门管理', '/admin/dept', null, null, '0', '2', '2019-12-02 11:05:45', null);
INSERT INTO `t_menu` VALUES ('0c6bce3dd7d7a352acfbfcba16617709', '5ad3caa634c441a58118ec2ffb424ee7', '菜单管理', '/admin/menu', null, null, '0', '1', '2019-12-02 11:02:38', null);
INSERT INTO `t_menu` VALUES ('16446826125a42216f692db7db5fd91c', '5ad3caa634c441a58118ec2ffb424ee7', '用户管理', '/admin/user', null, null, '0', '3', '2019-12-02 11:09:16', null);
INSERT INTO `t_menu` VALUES ('1649ebe3eeb624b25e5914d8b1ce904b', '5ad3caa634c441a58118ec2ffb424ee7', '角色管理', '/admin/role', null, null, '0', '4', '2019-12-02 11:09:38', null);
INSERT INTO `t_menu` VALUES ('1f4efbedfbed0c9b1c8d6f56ea789f91', '881bac77e0690244cba83867665ffb5a', '代码生成', '/admin/gen', null, null, '0', '1', '2019-12-02 11:34:42', null);
INSERT INTO `t_menu` VALUES ('3ba68944d827f39dfa13f5e9a6d91fdb', '5ad3caa634c441a58118ec2ffb424ee7', '后台管理主页', '/admin', null, null, '0', '5', '2019-12-03 18:42:42', null);
INSERT INTO `t_menu` VALUES ('5ad3caa634c441a58118ec2ffb424ee7', '0', '系统管理', null, null, 'layui-icon-set', '0', '1', '2019-12-02 10:40:33', '2019-12-03 15:19:55');
INSERT INTO `t_menu` VALUES ('881bac77e0690244cba83867665ffb5a', '0', '开发工具', null, null, 'layui-icon-util', '0', '2', '2019-12-02 11:34:22', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ROLE_ID` varchar(32) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '超级管理员', '2019-12-02 10:23:49');
INSERT INTO `t_role` VALUES ('2', 'test', '测试账户', '2019-12-02 10:23:52');
INSERT INTO `t_role` VALUES ('a168a6a2220399254b46045241905296', '老板', '老板', '2019-12-03 15:55:26');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `ID` varchar(32) NOT NULL,
  `RID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `MID` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('04e38aff27af6a913d97664d22a681da', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('1144516d369343ac00a2cb425acda17d', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('1c1d729440f2fcde5e64c06cd921494f', '2', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('2f9401575ba891d036ae96972d8d9c65', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('35ff13df852f99f125d839f38eefd83f', '2', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('393f65ad04edb8cf76c3426d068b503c', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('4c3d47c3a5de22a2cab740282417333d', '2', '3ba68944d827f39dfa13f5e9a6d91fdb');
INSERT INTO `t_role_menu` VALUES ('6e9373f68e2c3c20ed77568524bd6b90', 'a168a6a2220399254b46045241905296', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('c344df38c05f81f34e08b4b6bcaed200', 'a168a6a2220399254b46045241905296', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('d5ca5e9cb438e4d58d2932c37a9ca4e0', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('e71ce685114a84a0f7f9dba66da90ce6', '2', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('f9a65fdcb4dffe52cc1a60310cd32021', '2', '5ad3caa634c441a58118ec2ffb424ee7');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` varchar(255) DEFAULT NULL COMMENT '用户状态',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'c7242b2bc2435c1ead6b89f85d9e6a96', '2019-12-03 00:00:00', '1', '2019-12-03 15:14:39', '24c43877d7cc4e1a4b7957a4324843a3');
INSERT INTO `t_user` VALUES ('d6c636ecf1790eaa3d9cf8a8c7c728da', 'Pope', '0703758e3ad97ed11f3df58619193c41', '2019-12-03 00:00:00', '1', '2019-12-03 15:42:05', '61d59fc36dfd9e0f8d477faa2b3f545f');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `ID` varchar(32) NOT NULL,
  `UID` varchar(32) DEFAULT NULL,
  `RID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('131559e4c14238cbbc1a4c133a8c9b1b', '1', '1');
INSERT INTO `t_user_role` VALUES ('2f51c59f845700a97eb32420c47e0298', 'd6c636ecf1790eaa3d9cf8a8c7c728da', '2');
INSERT INTO `t_user_role` VALUES ('55de843eb318bab914218a775c3a9d79', '1', '2');
