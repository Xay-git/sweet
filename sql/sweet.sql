/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sweet

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-12-27 11:07:30
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
INSERT INTO `t_dept` VALUES ('24c43877d7cc4e1a4b7957a4324843a3', '0', '默认机构', '1', '2019-11-29 16:42:51', '2019-12-26 06:37:25', '0');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `DICT_ID` varchar(32) NOT NULL COMMENT '字典id',
  `DICT_TYPE_ID` varchar(32) NOT NULL COMMENT '所属字典类型的id',
  `CODE` varchar(50) NOT NULL COMMENT '字典编码',
  `NAME` varchar(255) NOT NULL COMMENT '字典名称',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '字典的描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`DICT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础字典';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('14cf6666e3b857186d22e45bd00a03fc', 'bab335395f4601b68977eb37e0f20431', '01', '支付宝支付', '1', '支付宝支付', '2019-12-17 09:56:35');
INSERT INTO `t_dict` VALUES ('c7d49be5970734983c2e8d7ac3b7b849', 'bab335395f4601b68977eb37e0f20431', '02', '微信支付', '2', '微信支付', '2019-12-17 01:55:09');

-- ----------------------------
-- Table structure for t_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_type`;
CREATE TABLE `t_dict_type` (
  `DICT_TYPE_ID` varchar(32) NOT NULL COMMENT '字典类型id',
  `CODE` varchar(255) NOT NULL COMMENT '字典类型编码',
  `NAME` varchar(255) NOT NULL COMMENT '字典类型名称',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '字典描述',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`DICT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of t_dict_type
-- ----------------------------
INSERT INTO `t_dict_type` VALUES ('bab335395f4601b68977eb37e0f20431', 'PAY_AWAY', '支付方式', '支付方式', '1', '2019-12-16 17:18:28');

-- ----------------------------
-- Table structure for t_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_file_info`;
CREATE TABLE `t_file_info` (
  `FILE_ID` varchar(50) NOT NULL COMMENT '主键id',
  `PARENT_ID` varchar(50) DEFAULT NULL,
  `FILE_BUCKET` varchar(100) DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `FILE_NAME` varchar(100) NOT NULL COMMENT '文件名称',
  `FILE_SUFFIX` varchar(50) DEFAULT NULL COMMENT '文件后缀',
  `FILE_SIZE_KB` bigint(20) DEFAULT NULL COMMENT '文件大小kb',
  `FINAL_NAME` varchar(100) NOT NULL COMMENT '文件唯一标识id',
  `FILE_PATH` varchar(1000) DEFAULT NULL COMMENT '存储路径',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(32) DEFAULT NULL COMMENT '修改用户',
  `FILE_TYPE` tinyint(2) DEFAULT NULL COMMENT '0文件夹 1文件',
  `FILE_SYS_PATH` varchar(1000) DEFAULT NULL COMMENT '存放的系统路径',
  PRIMARY KEY (`FILE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

-- ----------------------------
-- Records of t_file_info
-- ----------------------------
INSERT INTO `t_file_info` VALUES ('3db9e5e0ffac6096ce1a2c460652a08f', 'ef7255f6240266967d5c9dc1b02512ec', null, 'b7003af33a87e950c1e1a6491a385343fbf2b425.jpg', 'jpg', '105', '3db9e5e0ffac6096ce1a2c460652a08f.jpg', '/upload/avatar/3db9e5e0ffac6096ce1a2c460652a08f.jpg', '2019-12-25 08:44:57', null, '1', null, '1', 'd:\\sweet\\avatar\\3db9e5e0ffac6096ce1a2c460652a08f.jpg');
INSERT INTO `t_file_info` VALUES ('6dbd6c4f39ff914dadcb1eb2994ba650', 'ef7255f6240266967d5c9dc1b02512ec', null, 'b7003af33a87e950c1e1a6491a385343fbf2b425.jpg', 'jpg', '105', '6dbd6c4f39ff914dadcb1eb2994ba650.jpg', '/upload/avatar/6dbd6c4f39ff914dadcb1eb2994ba650.jpg', '2019-12-25 08:44:48', null, '1', null, '1', 'd:\\sweet\\avatar\\6dbd6c4f39ff914dadcb1eb2994ba650.jpg');
INSERT INTO `t_file_info` VALUES ('ef7255f6240266967d5c9dc1b02512ec', '/', null, 'avatar', 'dir', null, 'avatar', null, '2019-12-25 08:44:48', null, null, null, '0', 'd:\\sweet\\avatar');

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
INSERT INTO `t_menu` VALUES ('393f9ed5e481494bcb8a14599272c68e', '5ad3caa634c441a58118ec2ffb424ee7', '数据字典', '/admin/dictType/dictType_list', '', '', '0', '6', '2019-12-16 05:01:32', '2019-12-16 10:00:25');
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
INSERT INTO `t_role` VALUES ('2', 'test', '测试角色', '2019-12-02 10:23:52');

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
INSERT INTO `t_role_menu` VALUES ('0a77c50f58876b6e628c97c98c64ed42', '2', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('111032d95d894977a4f1700c8ab3ad03', '2', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('27ac3253f6737df47c5c79e0d72ad8ed', '1', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('2d3aa6c6f820d1fd98d1049587f51331', '2', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('47fd7fbdd756d3ffa4be4bfc335a57c4', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('5fdc813725d2b046fce92a15f5a15a9e', '2', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('6b038b08f01b0e0d165fbd8b289ae7e4', '2', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('6c68834169755c4f57870f996938faa7', '1', '393f9ed5e481494bcb8a14599272c68e');
INSERT INTO `t_role_menu` VALUES ('8ae165d9d456bcb76564f4df827e27bc', '1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('8dbf14060386236d1bdf85bac968a7cf', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('94f1613f63d7dc1c92baf6a12b587e4a', '2', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('9e0ba077f123fb314c48608aebcf8144', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('ad070054818d615afdbfa152afd2d894', '2', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('b53b564c340c9ac50b1e8b41259bb990', '1', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('b6168b5c55bf781bac7b9e6f2476e515', '2', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('bee57e6c755335fc984035fd61b55415', '2', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('c6b7d0d562765d772b09299b4016ec4b', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('d2b625cab5f84d70d807eb9166e00019', '1', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('dd7e0aa62eada1ba3a0a525dc674c2fc', '1', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('f25587b452374b7ac0c4c22804045849', '1', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('fad60a2b098f69940d5090efb45f20cf', '1', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('fe80c5f7465000cc20d3a441ef5bd286', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('feba0d5f5aeb6bdac54be4efa52fdbf0', '2', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('ff2e1af0c431bcda9ab5e31a06a97e4d', '2', '16446826125a42216f692db7db5fd91c');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT '' COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` tinyint(2) DEFAULT NULL COMMENT '用户状态',
  `AVATAR` varchar(1000) DEFAULT NULL COMMENT '头像',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'c7242b2bc2435c1ead6b89f85d9e6a96', '2019-12-02 16:00:00', '1', '', '2019-12-03 15:14:39', '24c43877d7cc4e1a4b7957a4324843a3');
INSERT INTO `t_user` VALUES ('2c8037a40909a06a69ee97820d53c00d', 'kobe', 'e283671f405c40d88b9017e5d07f3a97', null, '0', null, '2019-12-26 06:46:10', null);
INSERT INTO `t_user` VALUES ('774f9eb6b64eb67c9545dfa1aeb8a0fd', 'kobe1', '79efeab25c588f856172a4538d325a79', null, '0', null, '2019-12-26 06:47:55', null);

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
INSERT INTO `t_user_role` VALUES ('c3cf9485802ace3cc33b924ccebb68cb', '1', '1');
INSERT INTO `t_user_role` VALUES ('c70316f22294e7869fa9f9bc3c098950', '7f50d476d439534feef16728613e2396', '2');
