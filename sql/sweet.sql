/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sweet

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-11-29 17:45:27
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
INSERT INTO `t_dept` VALUES ('24c43877d7cc4e1a4b7957a4324843a3', '0', 'NBA', null, '2019-11-29 16:42:51', null, '0');
INSERT INTO `t_dept` VALUES ('61d59fc36dfd9e0f8d477faa2b3f545f', '24c43877d7cc4e1a4b7957a4324843a3', '湖人队', null, '2019-11-29 16:43:01', null, '0,24c43877d7cc4e1a4b7957a4324843a3');

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
INSERT INTO `t_menu` VALUES ('2143ca29d50ce8fe877a6b1589ccd50b', '0', '未命名', null, null, null, '0', null, '2019-11-28 10:28:34', null);
INSERT INTO `t_menu` VALUES ('4e22cef5667769e1e7ef38a4f7fdd621', '0', '未命名', null, null, null, '0', null, '2019-11-28 10:27:30', null);
INSERT INTO `t_menu` VALUES ('535c9e82f95efad034120ebb459c464d', '0', '系统管理', null, 'user:system', 'layui-icon-face-surprised', '0', '1', '2019-11-25 16:19:57', null);
INSERT INTO `t_menu` VALUES ('6aaab46f304dc3cb60d8d769e3707b15', '535c9e82f95efad034120ebb459c464d', '菜单管理', null, null, 'layui-icon-snowflake', '0', '2', '2019-11-27 18:45:27', null);
INSERT INTO `t_menu` VALUES ('d9a9fee6994e62a019dd69583f175272', '0', '开发工具', null, 'user:dev', 'layui-icon-refresh-1', '0', '1', '2019-11-27 18:43:00', null);
INSERT INTO `t_menu` VALUES ('f78e6e398b8e369621f02fb929eb4015', '0', '测试菜单', null, null, 'layui-icon-login-weibo', '0', '3', '2019-11-27 18:43:41', null);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'user:user', '/user');
INSERT INTO `t_permission` VALUES ('2', 'user:add', '/user/add');
INSERT INTO `t_permission` VALUES ('3', 'user:delete', '/user/delete');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '超级管理员');
INSERT INTO `t_role` VALUES ('2', 'test', '测试账户');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `ID` varchar(32) NOT NULL,
  `RID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `PID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1', '1');
INSERT INTO `t_role_permission` VALUES ('2', '1', '2');
INSERT INTO `t_role_permission` VALUES ('3', '1', '3');
INSERT INTO `t_role_permission` VALUES ('4', '2', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` varchar(255) DEFAULT NULL COMMENT '用户状态',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'c7242b2bc2435c1ead6b89f85d9e6a96', null, '1', null, null);
INSERT INTO `t_user` VALUES ('840dbb43e8154d7934a4216fdb5d4ba9', 'lebron', '01ea695061b338a72ff4cbfb9be15e1d', '2019-11-29 00:00:00', '1', '2019-11-29 17:30:41', '61d59fc36dfd9e0f8d477faa2b3f545f');
INSERT INTO `t_user` VALUES ('b9c8823c9f171a1c715bbfc51f6e4aea', 'admn', '9c7fc4d69a6612fb26077360a38b7cd5', '2019-11-29 00:00:00', '1', '2019-11-29 17:03:18', '24c43877d7cc4e1a4b7957a4324843a3');
INSERT INTO `t_user` VALUES ('c44207743115b2547750be8bc82ea321', 'kobe', 'e283671f405c40d88b9017e5d07f3a97', '2019-11-29 00:00:00', '1', '2019-11-29 17:30:34', '61d59fc36dfd9e0f8d477faa2b3f545f');

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
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2', '2');
