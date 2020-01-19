/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sweet

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2020-01-19 16:49:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_account
-- ----------------------------
DROP TABLE IF EXISTS `business_account`;
CREATE TABLE `business_account` (
  `ID` varchar(32) NOT NULL,
  `SITE_NAME` varchar(255) DEFAULT NULL COMMENT '网站名称',
  `URL` varchar(1000) DEFAULT NULL COMMENT 'URL',
  `ACCOUNT` varchar(255) DEFAULT NULL COMMENT '账号',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开发账号';

-- ----------------------------
-- Records of business_account
-- ----------------------------
INSERT INTO `business_account` VALUES ('00f3cbdd015b2f8c50522b3fd4364056', '耳说服务器', 'http://39.97.246.12', 'administrator', 'esjk@123456', '2020-01-10 10:34:05');
INSERT INTO `business_account` VALUES ('1745ae1dc6934179b600b17bf8d61c82', '阿里云-耳说', 'https://account.aliyun.com/login/qr_login.htm', 'ershuohealth', 'esjk@123456', '2020-01-13 17:39:36');
INSERT INTO `business_account` VALUES ('2edc9797e5ba1542144dd2b115846d2e', '耳说公众号', 'https://mp.weixin.qq.com/', '913202475@qq.com', 'esjk@123456', '2020-01-10 11:33:20');
INSERT INTO `business_account` VALUES ('32fba25ed87431119e7b5de68fe37ecb', 'GunsGit', 'https://git.stylefeng.cn/users/sign_in', '459699496@qq.com', 'ldl102000', '2020-01-10 11:33:22');
INSERT INTO `business_account` VALUES ('48db6044743b46cdae624466b0eeeb8e', '阿里云-公司', 'https://account.aliyun.com/login/qr_login.htm', 'zhijianyiliao', 'zhijian789', '2020-01-13 17:38:52');
INSERT INTO `business_account` VALUES ('5db8ecc36660f3af79eb769ebc742f37', 'LayAdmin ', 'https://fly.layui.com/user/login/', '15038119925 ', 'zhijian789', '2020-01-10 12:21:43');
INSERT INTO `business_account` VALUES ('6a14f22e8838d906efa24fa935488fd0', '看云', 'https://www.kancloud.cn/auth/login', '2122490375@qq.com', 'xayxay12', '2020-01-10 11:41:21');
INSERT INTO `business_account` VALUES ('9a1d11a89abbe2423e0f8740cae31c38', '百度云vip', 'https://pan.baidu.com', '墨缘堂', 'yulei180', '2020-01-10 11:39:20');
INSERT INTO `business_account` VALUES ('a909add659b24528ecbf7d924e220bf9', '宁寿堂', 'https://mp.weixin.qq.com/', '582449205@qq.com', 'hnnst1230', '2020-01-12 17:21:57');
INSERT INTO `business_account` VALUES ('b9c242ebbdeb698a1de2bcb94d43ca84', '阿里云-个人', 'https://account.aliyun.com/login/qr_login.htm', '459699496@qq.com', 'ldl102000', '2020-01-13 17:38:12');
INSERT INTO `business_account` VALUES ('d634190ef92eba7fdedb4a2f6b72e511', '彭氏', 'https://vip5.sentree.com.cn/shair/', '彭世练习号', '789456', '2020-01-10 11:37:08');
INSERT INTO `business_account` VALUES ('f7d3a7cd20482b91da925a5c05579e68', '耳说-云片', 'https://www.yunpian.com/entry', '18737155606', 'ldl102000', '2020-01-10 11:38:19');

-- ----------------------------
-- Table structure for business_article
-- ----------------------------
DROP TABLE IF EXISTS `business_article`;
CREATE TABLE `business_article` (
  `ARTICLE_ID` varchar(32) NOT NULL,
  `ARTICLE_NAME` varchar(1000) DEFAULT NULL COMMENT '文章名称',
  `SNIPPET` text COMMENT '文章摘要',
  `ARTICLE_TYPE` varchar(255) DEFAULT NULL COMMENT '文章类型',
  `AUTHOR` varchar(32) DEFAULT NULL COMMENT '作者',
  `CONTENT` text COMMENT '内容',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` bigint(20) DEFAULT NULL COMMENT '乐观锁保留字段',
  PRIMARY KEY (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章';

-- ----------------------------
-- Records of business_article
-- ----------------------------
INSERT INTO `business_article` VALUES ('bedde6280b4d902dd5f97b9bd7377979', 'springboot shiro 自定义拦截器', 'springboot shiro 自定义拦截器的创建和使用', 'c6a924d457da38a163a6a4d7650286de', '1', '<p><span style=\"font-size: 14px;\">shiro可以通过url配置和注解来完成权限控制，今天记录一下url拦截。</span></p><p><span style=\"font-size: 14px;\">使用url拦截好处</span></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><span style=\"font-size: 14px;\">权限刻度更精细</span></p></li><li><p><span style=\"font-size: 14px;\">可以通过后台配置，更加灵活</span></p></li></ol><p><span style=\"font-size: 14px;\">但是也有许多问题比如不同模块之间的接口调用 比如用户管理加载了 部门数据</span></p><p><span style=\"font-size: 14px;\">这时你就要考虑分配用户管理后还要额外分配部门管理的权限</span></p><p><span style=\"font-size: 14px;\">下面直接讲解如何完成一个url拦截器的开发</span></p><p><span style=\"font-size: 14px;\">直接贴代码！</span></p><pre class=\"brush:java;toolbar:false\">@Slf4j\n@Component\npublic&nbsp;class&nbsp;URLPathMatchingFilter&nbsp;extends&nbsp;PathMatchingFilter&nbsp;{\n\n&nbsp;&nbsp;&nbsp;&nbsp;@Override\n&nbsp;&nbsp;&nbsp;&nbsp;protected&nbsp;boolean&nbsp;onPreHandle(ServletRequest&nbsp;request,&nbsp;ServletResponse&nbsp;response,&nbsp;Object&nbsp;mappedValue)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throws&nbsp;Exception&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HttpServletRequest&nbsp;httpServletRequest&nbsp;=&nbsp;WebUtils.toHttp(request)&nbsp;;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HttpServletResponse&nbsp;httpServletResponse&nbsp;=&nbsp;WebUtils.toHttp(response);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserService&nbsp;userService&nbsp;=&nbsp;SpringContextUtil.getApplicationContext().getBean(UserService.class);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ResultError&nbsp;resultError;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;requestURI&nbsp;=&nbsp;getPathWithinApplication(request);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;log.debug(&quot;begin&nbsp;=&gt;&nbsp;:&nbsp;URLPathMatchingFilter&nbsp;request_url&nbsp;=&gt;&nbsp;:&quot;&nbsp;+&nbsp;requestURI);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!ShiroKit.isUser())&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;如果没有登录,&nbsp;直接返回false&nbsp;进入登录流程\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(HttpContext.isAjax(httpServletRequest)){\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;resultError&nbsp;=&nbsp;ResultError.error(LOGIN_FAILURE_EXCEPTION);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HttpContext.write(httpServletResponse,resultError);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WebUtils.issueRedirect(request,&nbsp;response,&nbsp;&quot;/admin/auth/login&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User&nbsp;user&nbsp;=&nbsp;ShiroKit.getUser();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;userName&nbsp;=&nbsp;user.getUserName();\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Set&lt;String&gt;&nbsp;roleSet&nbsp;=&nbsp;userService.getUserRole(userName);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;log.debug(&quot;hasRole&nbsp;=&gt;&nbsp;:&nbsp;&quot;+roleSet);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果是管理员直接放行\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(roleSet.contains(&quot;admin&quot;)){\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//创建权限标记\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;boolean&nbsp;hasPermission&nbsp;=&nbsp;false;\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果url大于三层分割为两层\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String[]&nbsp;str&nbsp;=&nbsp;requestURI.split(&quot;/&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(str.length&nbsp;&gt;&nbsp;3)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;requestURI&nbsp;=&nbsp;&quot;/&quot;&nbsp;+&nbsp;str[1]&nbsp;+&nbsp;&quot;/&quot;&nbsp;+&nbsp;str[2];\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Set&lt;String&gt;&nbsp;menuSet&nbsp;=&nbsp;userService.getUserMenu(userName);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;log.debug(&quot;hasMenu&nbsp;=&gt;&nbsp;:&nbsp;&quot;+menuSet);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(String&nbsp;url&nbsp;:&nbsp;menuSet)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(url!=null){\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(requestURI.equals(url))&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hasPermission&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//直接跳出循环无需额外判断\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果拥有权限放行\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(hasPermission)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(HttpContext.isAjax(httpServletRequest)){\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw&nbsp;new&nbsp;ServiceException(NO_PERMISSION_EXCEPTION);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//否则跳转到未授权页面\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WebUtils.issueRedirect(request,&nbsp;response,&nbsp;&quot;/error/unauthorized&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre><p>重写onPreHanle 首先查询用户所有的权限 当用户包含该次请求的url则通过</p><p>可以将用户菜单权限放到缓存当中避免重复查询</p><pre class=\"brush:java;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;@Bean\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;ShiroFilterFactoryBean&nbsp;shiroFilterFactoryBean(SecurityManager&nbsp;securityManager)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ShiroFilterFactoryBean&nbsp;shiroFilterFactoryBean&nbsp;=&nbsp;new&nbsp;ShiroFilterFactoryBean();\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;设置securityManager\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shiroFilterFactoryBean.setSecurityManager(securityManager);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//自定义拦截器\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Map&lt;String,&nbsp;Filter&gt;&nbsp;filtersMap&nbsp;=&nbsp;new&nbsp;LinkedHashMap&lt;String,&nbsp;Filter&gt;();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//访问权限配置\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filtersMap.put(&quot;requestURL&quot;,&nbsp;new&nbsp;URLPathMatchingFilter());\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filtersMap.put(&quot;jwt&quot;,&nbsp;new&nbsp;JWTFilter());\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shiroFilterFactoryBean.setFilters(filtersMap);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;登录的url\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shiroFilterFactoryBean.setLoginUrl(&quot;/admin/auth/login&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;登录成功后跳转的url\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shiroFilterFactoryBean.setSuccessUrl(&quot;/admin&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;未授权url\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shiroFilterFactoryBean.setUnauthorizedUrl(&quot;/error/unauthorized&quot;);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LinkedHashMap&lt;String,&nbsp;String&gt;&nbsp;filterChainDefinitionMap&nbsp;=&nbsp;new&nbsp;LinkedHashMap&lt;&gt;();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;配置映射关系*/\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//authc:所有url都必须认证通过才可以访问;&nbsp;anon:所有url都都可以匿名访问;user用户可以访问包含记住我\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;定义filterChain，静态资源不拦截\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/css/**&quot;,&nbsp;&quot;anon&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/js/**&quot;,&nbsp;&quot;anon&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/fonts/**&quot;,&nbsp;&quot;anon&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/img/**&quot;,&nbsp;&quot;anon&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/upload/**&quot;,&nbsp;&quot;anon&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;配置退出过滤器，其中具体的退出代码Shiro已经替我们实现了\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/admin/auth/logout&quot;,&nbsp;&quot;logout&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/admin/auth/**&quot;,&nbsp;&quot;anon&quot;);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/swagger-ui.html/**&quot;,&nbsp;&quot;user&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;除上以外所有url都必须认证通过才可以访问，未通过认证自动访问LoginUrl\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/admin&quot;,&nbsp;&quot;user&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/admin/common/**&quot;,&nbsp;&quot;user&quot;);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/admin/**&quot;,&nbsp;&quot;user&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/admin/**&quot;,&nbsp;&quot;requestURL&quot;);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/weixin/login**&quot;,&nbsp;&quot;anon&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;filterChainDefinitionMap.put(&quot;/weixin/**&quot;,&nbsp;&quot;jwt&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;shiroFilterFactoryBean;\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p>之后在shiroConfig中将其注入 并在你需要进行url拦截的地方进行权限拦截<br/></p>', '2020-01-15 17:39:24', '2020-01-19 09:29:44', '5');

-- ----------------------------
-- Table structure for business_wxmenu
-- ----------------------------
DROP TABLE IF EXISTS `business_wxmenu`;
CREATE TABLE `business_wxmenu` (
  `BUTTON_ID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `PARENT_ID` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '父级ID 如果是菜单则为 appId 子菜单则为底部菜单id',
  `BUTTON_INDEX` int(10) DEFAULT NULL COMMENT 'button索引',
  `TYPE` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单类型',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单名称',
  `URL` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT 'url',
  `MEDIA_ID` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '素材ID',
  `PAGEPATH` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序地址',
  `APPID` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序ID',
  `KEY` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '点击事件',
  `TIER` tinyint(2) DEFAULT NULL COMMENT '层级 1底部菜单 2子菜单',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MATERIAL_TITLE` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '素材标题',
  `MATERIAL_URL` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '素材URL',
  `CONTENT` text COMMENT '自定义内容',
  PRIMARY KEY (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信菜单';

-- ----------------------------
-- Records of business_wxmenu
-- ----------------------------
INSERT INTO `business_wxmenu` VALUES ('092e41e7b1fdae020c2d52d94747853e', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '3', 'view', 'openid获取', 'http://zhq.ngrock.buyerhou.top/weixin', '', '', '', '', '2', '2020-01-12 17:51:13', '', '', '');
INSERT INTO `business_wxmenu` VALUES ('0f0ba7717576e71d089b33b927257a11', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '1', 'view', '跳转网页', 'https://www.baidu.com/', '', '', '', '', '2', '2020-01-12 17:44:47', '', '', '');
INSERT INTO `business_wxmenu` VALUES ('1bac7d6627157621c6e1c33dcf8e8f7e', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '0', 'text', '普通文本', '', '', '', '', 'text:1bac7d6627157621c6e1c33dcf8e8f7e', '2', '2020-01-12 17:43:35', '', '', 'hello world ✨');
INSERT INTO `business_wxmenu` VALUES ('d12f80e308b5a15beead4d225e08350c', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '2', 'click', '自定义事件', '', '', '', '', 'Hello', '2', '2020-01-12 17:48:30', '', '', '');
INSERT INTO `business_wxmenu` VALUES ('efedd537af7b01f135ee5f29ca8b64f3', 'wxe5c669f557bf72e5', '0', 'view', '接口测试', '', '', '', '', '', '1', '2020-01-12 17:43:29', '', '', '');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `DEPT_ID` varchar(32) NOT NULL COMMENT '部门ID',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '上级部门ID',
  `PARENT_IDS` varchar(1000) DEFAULT NULL COMMENT '父级ID集合',
  `DEPT_NAME` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('24c43877d7cc4e1a4b7957a4324843a3', '0', '0', '默认机构', null, '2020-01-15 09:58:38', '2020-01-15 11:26:08');

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
INSERT INTO `t_dict` VALUES ('0c6fa308e608d160ecfc5e1bd7c80915', '100edb6ca33a00a5bf28d6592738523c', '01', 'java', null, null, '2020-01-14 15:59:25');
INSERT INTO `t_dict` VALUES ('14cf6666e3b857186d22e45bd00a03fc', 'bab335395f4601b68977eb37e0f20431', '01', '支付宝支付', '1', '支付宝支付', '2019-12-17 09:56:35');
INSERT INTO `t_dict` VALUES ('6bf2f9bf0e35e5578ddecc7f2d763ed1', '072bc1f49bd310dfbe5773062e83684f', '01', '上门客人', '1', '上门客人', '2019-12-27 03:23:29');
INSERT INTO `t_dict` VALUES ('80849d8869ccc24dbc6f4a1b0ad2869b', '072bc1f49bd310dfbe5773062e83684f', '05', '美团', '5', '美团', '2019-12-27 03:25:59');
INSERT INTO `t_dict` VALUES ('817e3f4683aac952d3a14689da4df0b7', '072bc1f49bd310dfbe5773062e83684f', '06', '支付宝', '6', '支付宝', '2019-12-27 03:26:18');
INSERT INTO `t_dict` VALUES ('92e3119ad443a02c7a468a99a6aa35a1', '072bc1f49bd310dfbe5773062e83684f', '04', '大众点评', '4', '大众点评', '2019-12-27 03:25:49');
INSERT INTO `t_dict` VALUES ('94d43fe61b6e36c967616db8aae356df', '072bc1f49bd310dfbe5773062e83684f', '03', '客带客', '3', '客带客', '2019-12-27 03:25:37');
INSERT INTO `t_dict` VALUES ('c4405fe3289b8807c7fd186f1ea772f0', '072bc1f49bd310dfbe5773062e83684f', '02', '员工带客', '2', '员工带客', '2019-12-27 03:24:07');
INSERT INTO `t_dict` VALUES ('c6a924d457da38a163a6a4d7650286de', '100edb6ca33a00a5bf28d6592738523c', '02', 'springboot', null, null, '2020-01-14 15:59:33');
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
INSERT INTO `t_dict_type` VALUES ('072bc1f49bd310dfbe5773062e83684f', 'MEMBER_SOURCE', '客户来源', '客户来源', '2', '2019-12-27 03:18:09');
INSERT INTO `t_dict_type` VALUES ('100edb6ca33a00a5bf28d6592738523c', 'ARTICLE_TYPE', '文章类型', '文章类型', '3', '2020-01-14 15:58:51');
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
INSERT INTO `t_file_info` VALUES ('3e68156a4c011e9d22674a2d4b5fd996', 'cf03621340c8cdad5b6adc040992de30', null, 'ningshoutang.png', 'png', '474', '3e68156a4c011e9d22674a2d4b5fd996.png', '/upload/avatar/3e68156a4c011e9d22674a2d4b5fd996.png', '2020-01-15 16:45:35', null, '1', null, '1', 'd:\\sweet\\avatar\\3e68156a4c011e9d22674a2d4b5fd996.png');
INSERT INTO `t_file_info` VALUES ('cf03621340c8cdad5b6adc040992de30', '/', null, 'avatar', 'dir', null, 'avatar', null, '2020-01-15 16:44:15', null, null, null, '0', 'd:\\sweet\\avatar');
INSERT INTO `t_file_info` VALUES ('f6559da69635590ae2883fc874521ec4', 'cf03621340c8cdad5b6adc040992de30', null, 'message.png', 'png', '2', 'f6559da69635590ae2883fc874521ec4.png', '/upload/avatar/f6559da69635590ae2883fc874521ec4.png', '2020-01-15 16:47:44', null, '1', null, '1', 'd:\\sweet\\avatar\\f6559da69635590ae2883fc874521ec4.png');

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
INSERT INTO `t_menu` VALUES ('3317e854e1ae21ede63918d7c8aeff3d', '0', '文章管理', '', '', 'layui-icon-read', '0', '5', '2020-01-14 14:33:30', '2020-01-14 14:34:17');
INSERT INTO `t_menu` VALUES ('386ee4b7e303d7424f13618b62cee614', 'd0e9331c64a05907b32652cd80cfed17', '商城页面', '/shop', '', '', '0', '2', '2020-01-08 06:27:30', '2020-01-15 17:25:49');
INSERT INTO `t_menu` VALUES ('393f9ed5e481494bcb8a14599272c68e', '5ad3caa634c441a58118ec2ffb424ee7', '数据字典', '/admin/dictType/dictType_list', '', '', '0', '6', '2019-12-16 05:01:32', '2019-12-16 10:00:25');
INSERT INTO `t_menu` VALUES ('40a6ffbcb9045452e7d20a22b68f57a2', 'd0e9331c64a05907b32652cd80cfed17', '卡片', '/admin/demo/card', '', '', '0', '1', '2020-01-07 06:35:58', '2020-01-08 06:24:17');
INSERT INTO `t_menu` VALUES ('41ec8e23c8af3244a4057e5832d87e2f', '3317e854e1ae21ede63918d7c8aeff3d', '文章列表', '/admin/article/article_list', '', '', '0', '1', '2020-01-14 14:34:35', null);
INSERT INTO `t_menu` VALUES ('4996271f4e62082b81957b4ce9fdb1c6', '881bac77e0690244cba83867665ffb5a', '开发账号', '/admin/account/account_list', '', '', '0', '1', '2020-01-10 03:18:33', null);
INSERT INTO `t_menu` VALUES ('5ad3caa634c441a58118ec2ffb424ee7', '0', '系统管理', null, null, 'layui-icon-set', '0', '1', '2019-12-02 10:40:33', '2019-12-03 15:19:55');
INSERT INTO `t_menu` VALUES ('881bac77e0690244cba83867665ffb5a', '0', '开发工具', null, null, 'layui-icon-util', '0', '2', '2019-12-02 11:34:22', null);
INSERT INTO `t_menu` VALUES ('8c7fb301d2aab801523166b601998378', '5ad3caa634c441a58118ec2ffb424ee7', '在线用户', '/admin/online', null, null, '0', '5', '2019-12-06 18:26:56', null);
INSERT INTO `t_menu` VALUES ('9891bdfd6fae9d5bcb5ac4533927a20e', 'd0e9331c64a05907b32652cd80cfed17', '博客', '/blog', '', '', '0', '4', '2020-01-15 16:57:15', null);
INSERT INTO `t_menu` VALUES ('9eb38e58ce3af6e3831fa824aa2cf65c', '0', '微信营销', null, null, 'layui-icon-login-wechat', '0', '3', '2019-12-04 16:10:39', null);
INSERT INTO `t_menu` VALUES ('ad30e1e6db74ac19d0f628f5df8c1c68', '881bac77e0690244cba83867665ffb5a', '接口文档', '/swagger-ui.html', null, null, '0', '2', '2019-12-05 11:08:22', null);
INSERT INTO `t_menu` VALUES ('d0e9331c64a05907b32652cd80cfed17', '0', '常用页面', '', 'user:system', 'layui-icon-template', '0', '3', '2020-01-07 06:35:32', null);
INSERT INTO `t_menu` VALUES ('d8936d67e0b7eefabee083346c30be93', 'd0e9331c64a05907b32652cd80cfed17', '富文本编辑器', '/admin/demo/rich_text', '', '', '0', '3', '2020-01-14 09:52:48', null);
INSERT INTO `t_menu` VALUES ('ef092fbc62b691e3e3fc71ab795d804c', '9eb38e58ce3af6e3831fa824aa2cf65c', '公众号管理', '/admin/wxmenu', '', '', '0', '1', '2019-12-04 16:17:11', '2020-01-09 01:45:29');

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
INSERT INTO `t_role_menu` VALUES ('0959883f793b5a1bd34cdba022e24ec7', '1', '3317e854e1ae21ede63918d7c8aeff3d');
INSERT INTO `t_role_menu` VALUES ('14b730c3b6dee240f71c2896153d3b51', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('1bcde75993213fc6d2b080ea7c627dac', '1', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('1c845167d79777522cd1d0cdc106e7c4', '1', '9891bdfd6fae9d5bcb5ac4533927a20e');
INSERT INTO `t_role_menu` VALUES ('2d840c8b16c93f513de9f81b0f00d73f', '1', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('31815c83f83b616d6c2ec71067f58d3a', '1', '4996271f4e62082b81957b4ce9fdb1c6');
INSERT INTO `t_role_menu` VALUES ('44bc74c44269656993012033c0b05a06', '1', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('466611317b130c40497d3e7f16d35a38', '1', 'd8936d67e0b7eefabee083346c30be93');
INSERT INTO `t_role_menu` VALUES ('5257826ab813aed573c176f307bda9dd', '1', 'd0e9331c64a05907b32652cd80cfed17');
INSERT INTO `t_role_menu` VALUES ('5547f42f4bfb8b5320bba48449b56cc9', '1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('59d79e89b0c7a6433794ec20ac6edc16', '1', '393f9ed5e481494bcb8a14599272c68e');
INSERT INTO `t_role_menu` VALUES ('6cc76bcfe2d2d6dfbdb80ed9610b2d73', '1', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('752a2265fdce4b9b693521fbd9214648', '2', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('81c5a7b0ff9c0918131ecf0de8a34227', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('823c21a36749ef0758934a11464e0316', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('99f88acbe930298f2dde896c885b3e1c', '1', '386ee4b7e303d7424f13618b62cee614');
INSERT INTO `t_role_menu` VALUES ('9bd2699f42bd1a991b145675c47a2c6e', '1', '41ec8e23c8af3244a4057e5832d87e2f');
INSERT INTO `t_role_menu` VALUES ('ab3c221519912e3c6890a49e065ec9df', '1', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('bd7f3fe2221a04e5d57c396b9232b3c1', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('bf6e51432877014a3fb5be391a0410f4', '2', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('d3e9e35d30dfa18685efcdd734ad8e81', '1', '40a6ffbcb9045452e7d20a22b68f57a2');
INSERT INTO `t_role_menu` VALUES ('d67a3104e2a13cd474b6df6a1aff4e17', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('d7309aff2ace7e4c4636e2d9f1a34ef5', '1', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('f3e4f62c85e884f516d6945ae3c52005', '2', '1649ebe3eeb624b25e5914d8b1ce904b');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT '' COMMENT '用户名',
  `REAL_NAME` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` tinyint(2) DEFAULT NULL COMMENT '用户状态',
  `AVATAR` varchar(1000) DEFAULT NULL COMMENT '头像',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  `USER_TYPE` tinyint(2) DEFAULT NULL COMMENT '1 系统人员 2 用户',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '王旭磊', 'c7242b2bc2435c1ead6b89f85d9e6a96', '2019-12-02 00:00:00', '1', '', '2019-12-03 15:14:39', '24c43877d7cc4e1a4b7957a4324843a3', '1');
INSERT INTO `t_user` VALUES ('9270c3ce9a5dca2ebcf412fd8cb88566', 'test', '测试', '9428ddf84c99cdfd521d326455de18b2', '2020-01-15 00:00:00', '1', '', '2020-01-15 17:20:57', '24c43877d7cc4e1a4b7957a4324843a3', '1');

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
INSERT INTO `t_user_role` VALUES ('2c19bb75708a81bdacd1c9da9aaf3159', '9270c3ce9a5dca2ebcf412fd8cb88566', '2');
INSERT INTO `t_user_role` VALUES ('3bcd3ea138497c203a4325b090303277', 'd220e9c5e748136fedfe14babb3c4ab5', '2');
INSERT INTO `t_user_role` VALUES ('819d20e1417b3c11be5135a984f9881a', 'c0169915834b22bdd118b77f49f494ab', '1');
INSERT INTO `t_user_role` VALUES ('b2a2f3a90c68dd120007fd9d2d9c33bd', 'f8afb945878ef6548cb71bb782eb842c', '2');
INSERT INTO `t_user_role` VALUES ('b69dcc236cf975a4c832b7ebceffd889', '383fdad03d7d1573e45ce5de7e49ef99', '2');
INSERT INTO `t_user_role` VALUES ('c70316f22294e7869fa9f9bc3c098950', '7f50d476d439534feef16728613e2396', '2');
INSERT INTO `t_user_role` VALUES ('cc4796dc8c6a59cd98d65b5bf03f5b3d', '1', '1');
