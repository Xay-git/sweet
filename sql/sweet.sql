/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sweet

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-12-06 18:33:29
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
  `file_sys_path` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

-- ----------------------------
-- Records of t_file_info
-- ----------------------------
INSERT INTO `t_file_info` VALUES ('0400c658d62546ee321c23b9b172455c', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (2).jpg', 'jpg', '62', '0400c658d62546ee321c23b9b172455c.jpg', '/upload/avatar/0400c658d62546ee321c23b9b172455c.jpg', '2019-12-06 17:54:28', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\0400c658d62546ee321c23b9b172455c.jpg');
INSERT INTO `t_file_info` VALUES ('71fc33ae51539e1a36e27e44336a0e68', 'a67fca449a6d1976cdb20719d495b9af', null, 'xiaoxin (1).jpg', 'jpg', '53', '71fc33ae51539e1a36e27e44336a0e68.jpg', '/upload/avatar/71fc33ae51539e1a36e27e44336a0e68.jpg', '2019-12-06 17:53:46', null, '1', null, '1', 'd:\\sweetUpload\\avatar\\71fc33ae51539e1a36e27e44336a0e68.jpg');
INSERT INTO `t_file_info` VALUES ('a67fca449a6d1976cdb20719d495b9af', '/', null, 'avatar', 'dir', null, 'avatar', null, '2019-12-06 17:53:46', null, null, null, '0', 'd:\\sweetUpload\\avatar');

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
INSERT INTO `t_menu` VALUES ('12c75cf93e74dbbff4e872f634a700e9', '5ad3caa634c441a58118ec2ffb424ee7', '数据库监控', '/admin/druid/', null, null, '0', '6', '2019-12-04 16:23:09', null);
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
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('00214970016a00e043ad0b9e19b8e87e', '2', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('09cbbd2ec024c389b3c710b269217542', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('1e8f1b2b4f25c699d0204d420f35a6d3', '2', '12c75cf93e74dbbff4e872f634a700e9');
INSERT INTO `t_role_menu` VALUES ('227fb2e3c69d6415db5bbe811b324a37', '2', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('2651f3ab64e5f984104eba4a11e325e5', '2', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('3427f6f766cb578c9df8c55c139d4e65', '1', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('3654901ee33f293b6d59a8462e5531b8', '1', '12c75cf93e74dbbff4e872f634a700e9');
INSERT INTO `t_role_menu` VALUES ('3d969c1990625060cb5bddb07fdc75c9', '1', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('42e7eac80fc5b11337594c013fafb593', '2', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('5769026f6a060ceb9c1797f2d889cb8e', '2', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('5973e120c6b6259885da2342aaed2e84', '2', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('72df8f47e610e6ff5ad4d8d432d70963', '2', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('7cf5b18519d2665df4f0f1383792ea0c', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('883eaab9c246d634ef651b867e29a3d3', '2', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('8b26837aff3844e1830df7f0618cb090', '1', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('8d9d28e04210737e70f84d0dc6a36058', '2', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('94a68ead020f670b5c80a2cf3dba2d8f', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('967eb93e2009fcb1d4530f88d53877cf', '1', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('9e2daa11d1bb4658d51563c4336ce4ce', '1', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('bbde4a2546e7683bf9b20b1dc0539399', '1', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('c14638d640d5b685e9f91984905e3b1b', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('c3c6f0d9a7fce3de2abea9ef19109b12', '2', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('c8415f063786507294c76ac0844a1364', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('e7066c6a8f8ad8953cfef4faf68d5c3c', '1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('eb1e3fb93fcf7c6698e99e08b5dca521', '2', '16446826125a42216f692db7db5fd91c');

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
INSERT INTO `t_user` VALUES ('7f50d476d439534feef16728613e2396', 'kobe', 'e283671f405c40d88b9017e5d07f3a97', null, '1', '2019-12-04 15:35:33', '61d59fc36dfd9e0f8d477faa2b3f545f');

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
INSERT INTO `t_user_role` VALUES ('55de843eb318bab914218a775c3a9d79', '1', '2');
INSERT INTO `t_user_role` VALUES ('593d9e51247fdba9db7425fa60eff9a3', '7f50d476d439534feef16728613e2396', '2');
