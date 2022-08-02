/*
 Navicat Premium Data Transfer

 Source Server         : nacos
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 02/08/2022 18:01:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '加密盐',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `modified_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '修改人',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '逻辑删除标识(0、否 1、是)',
  PRIMARY KEY (`account_id`) USING BTREE,
  KEY `FK_account_role_id` (`role_id`),
  CONSTRAINT `FK_account_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='账号表';

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES (1, 1, 'mp', '17a1640916cfa8356adc4336a72ac75d', 'ecbe5fac60d1499595fbb98dfa854501', '程序牛人', '男', 'mp@126.com', '2020-11-10 13:46:32', '2020-11-15 17:09:28', NULL, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `modified_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '修改人',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '逻辑删除标识(0、否 1、是)',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (1, '卢本伟', '男', 18, 'lbw@qq.com', '13212311334', '广州市天河区', '2019-01-11 14:20:20', NULL, NULL, NULL, 0);
INSERT INTO `customer` VALUES (2, '董伟', '男', 22, 'dw@pp.com', '15112331151', '广州市黄埔区', '2012-01-11 14:20:20', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父id',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `resource_type` tinyint(4) DEFAULT NULL COMMENT '资源类型(0、目录 1、菜单 2、按钮)',
  `url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `code` varchar(100) DEFAULT NULL COMMENT '权限标识码',
  `sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of resource
-- ----------------------------
BEGIN;
INSERT INTO `resource` VALUES (1, NULL, '系统管理', 0, NULL, NULL, 1);
INSERT INTO `resource` VALUES (2, NULL, '客户管理', 0, NULL, NULL, 2);
INSERT INTO `resource` VALUES (11, 1, '角色管理', 1, 'role/toList', NULL, 1);
INSERT INTO `resource` VALUES (12, 1, '账号管理', 1, 'account/toList', NULL, 2);
INSERT INTO `resource` VALUES (21, 2, '客户管理', 1, 'customer/toList', 'customer', 1);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `modified_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '修改人',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '逻辑删除标识(0、否 1、是)',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, '练习角色', '练习角色', NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `role_resource_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `resource_id` bigint(20) unsigned DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`role_resource_id`) USING BTREE,
  KEY `FK_role_resource_role_id` (`role_id`),
  KEY `FK_role_rerce_resourc_idD2D9` (`resource_id`),
  CONSTRAINT `FK_role_rerce_resourc_idD2D9` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`),
  CONSTRAINT `FK_role_resource_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
BEGIN;
INSERT INTO `role_resource` VALUES (1, 1, 1);
INSERT INTO `role_resource` VALUES (2, 1, 2);
INSERT INTO `role_resource` VALUES (3, 1, 11);
INSERT INTO `role_resource` VALUES (4, 1, 12);
INSERT INTO `role_resource` VALUES (5, 1, 21);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
