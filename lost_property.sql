/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : lost_property

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-01-01 23:25:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_aboutus
-- ----------------------------
DROP TABLE IF EXISTS `tb_aboutus`;
CREATE TABLE `tb_aboutus` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '信息标题',
  `us_text` text NOT NULL COMMENT '关于我们正文',
  `images` varchar(255) DEFAULT NULL COMMENT '图片',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_aboutus
-- ----------------------------

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL COMMENT '物品分类名',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '钱包', '2018-12-09 21:20:35', '2018-12-09 21:20:38');
INSERT INTO `tb_category` VALUES ('2', '钥匙', '2018-12-09 21:20:59', '2018-12-09 21:21:01');
INSERT INTO `tb_category` VALUES ('3', '宠物', '2018-12-09 21:21:16', '2018-12-09 21:21:18');
INSERT INTO `tb_category` VALUES ('4', '卡类/证书', '2018-12-09 21:21:43', '2018-12-09 21:21:45');
INSERT INTO `tb_category` VALUES ('5', '数码产品', '2018-12-09 21:22:01', '2018-12-09 21:22:04');
INSERT INTO `tb_category` VALUES ('6', '手袋/挎包', '2018-12-09 21:22:26', '2018-12-09 21:22:29');
INSERT INTO `tb_category` VALUES ('7', '衣服/鞋帽', '2018-12-09 21:22:53', '2018-12-09 21:22:56');
INSERT INTO `tb_category` VALUES ('8', '首饰/挂饰', '2018-12-09 21:23:12', '2018-12-09 21:23:15');
INSERT INTO `tb_category` VALUES ('9', '行李/包裹', '2018-12-09 21:23:36', '2018-12-09 21:23:38');
INSERT INTO `tb_category` VALUES ('10', '书籍/文件', '2018-12-09 21:23:53', '2018-12-09 21:23:59');
INSERT INTO `tb_category` VALUES ('11', '其他', '2018-12-09 21:24:12', '2018-12-09 21:24:15');
INSERT INTO `tb_category` VALUES ('18', '钱钱钱￥￥￥', '2018-12-13 09:40:12', '2018-12-13 09:40:28');
INSERT INTO `tb_category` VALUES ('23', 'lklk', '2018-12-29 19:44:56', '2018-12-29 19:44:56');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_text` text NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_found
-- ----------------------------
DROP TABLE IF EXISTS `tb_found`;
CREATE TABLE `tb_found` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '物品分类',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `found_place` varchar(50) NOT NULL,
  `found_time` datetime NOT NULL,
  `infoTitle` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `images` varchar(255) DEFAULT NULL COMMENT '物品图片',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `QQ` varchar(50) DEFAULT NULL COMMENT '联系QQ',
  `email` varchar(50) NOT NULL COMMENT '联系邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id2` (`user_id`),
  KEY `category_id2` (`category_id`),
  CONSTRAINT `category_id2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_found
-- ----------------------------
INSERT INTO `tb_found` VALUES ('4', '3', '2', '博爱医院附近', '2018-11-27 00:00:00', '宠物狗认领', '博爱医院附近捡到一只萨摩，望失主尽快与我联系。', null, '111', '13546475665', '111', '156669011@qq.com', '威宁火车站', '2018-12-17 21:52:12', '2018-12-13 21:52:17');
INSERT INTO `tb_found` VALUES ('5', '7', '2', '55', '2019-01-23 21:54:27', 'GXG', '555', null, '55', '54', '5', '55', '55', '2018-12-22 21:54:40', '2018-12-20 21:54:43');
INSERT INTO `tb_found` VALUES ('6', '10', '2', '555', '2018-12-15 21:55:29', '白夜行', '666', null, '666', '32', '66', '6', '66', '2018-12-15 21:55:51', '2018-11-22 21:55:53');
INSERT INTO `tb_found` VALUES ('3141235', '1', '2', '333', '2018-12-22 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3211215', '9', '2', '888', '2018-12-16 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3221225', '10', '2', 'sdf', '2018-12-17 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3231285', '11', '2', 'fgh', '2018-12-18 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3242286', '7', '2', '134', '2018-12-20 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3243296', '8', '2', 'zxcv', '2018-12-19 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3244297', '9', '2', '泉afsd', '2018-12-18 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3245298', '10', '2', 'u655', '2018-12-17 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3246299', '11', '2', '32d3', '2018-12-16 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3251295', '2', '2', 'qewr', '2018-12-19 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3261291', '3', '2', '999', '2018-12-20 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3271292', '4', '2', '泉retw', '2018-12-21 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3281293', '5', '2', '泉vx', '2018-12-22 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3291294', '6', '2', 'ewr', '2018-12-21 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3341236', '2', '2', '111', '2018-12-21 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3441237', '3', '2', '222', '2018-12-20 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3541238', '4', '2', '333', '2018-12-19 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3641239', '5', '2', '444', '2018-12-18 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3741255', '6', '2', '555', '2018-12-17 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3841245', '7', '2', '666', '2018-12-16 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('3941275', '8', '2', '777', '2018-12-15 00:00:00', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 14:42:54', '2018-12-22 14:42:54');
INSERT INTO `tb_found` VALUES ('34536452', '8', '2', 'erewqr', '2018-12-31 14:05:40', 'qewr', 'qwer', null, 'qwer', null, 'weqr', 'dsf@qd', 'asdf', '2018-12-31 14:05:58', '2018-12-31 14:06:02');
INSERT INTO `tb_found` VALUES ('523452423', '6', '2', '南区食堂', '2018-12-23 16:12:24', '学生卡一张', '在南区食堂楼梯处捡到学生卡一张', null, 'Mason', '123456', '123456', '666@qq.com', '南区', '2018-12-23 16:13:58', '2018-12-23 16:14:01');
INSERT INTO `tb_found` VALUES ('154624358292343', '7', '2', '哈尔滨', '2018-12-29 08:00:00', '捡到了个东西', '在哈尔滨捡到了一只阿拉斯加狗', null, null, null, null, '321@qq.com', null, '2018-12-31 16:06:23', '2018-12-31 16:06:23');
INSERT INTO `tb_found` VALUES ('154624413261105', '8', '2', '澳大利亚', '2018-12-30 08:00:00', '在澳大利亚捡到了一件物品', '在澳大利亚捡到了一只考拉', null, null, null, null, '123@qq.com', null, '2018-12-31 16:15:33', '2018-12-31 16:15:33');
INSERT INTO `tb_found` VALUES ('154624517114952', '4', '2', '成都春熙路潮流易购广场门口', '2018-12-19 00:00:00', '身份证丢失的看过来哦', '官雪梅，，，， \n本来想一脚踏过去的，但是看到了还是捡了起来，非常抱歉捡走了你的身份证，但是我不捡走别人也会捡走，甚至拿去干别样，所以小妹纸不要怪姐姐哈', 'images/2018/12/31/99104996764376558.jpg', null, null, null, 'ewqrqwr@qq', null, '2018-12-31 16:32:51', '2018-12-31 16:32:51');

-- ----------------------------
-- Table structure for tb_lost
-- ----------------------------
DROP TABLE IF EXISTS `tb_lost`;
CREATE TABLE `tb_lost` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '物品分类ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `lost_place` varchar(50) NOT NULL COMMENT '丢失地点',
  `lost_time` datetime NOT NULL COMMENT '丢失日期',
  `infoTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息标题',
  `rewards` varchar(100) DEFAULT NULL COMMENT '报酬方式',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情描述',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物品图片',
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '联系人',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lost
-- ----------------------------
INSERT INTO `tb_lost` VALUES ('1', '1', '2', '湖北武汉武昌', '2018-10-01 21:40:54', '1000元赏金寻找钱包', '1000元', '本人2018.10.1日中午，在武昌火车站附近，不幸遗失黑色钱包，内有本人身份证、港澳通行证、银行卡、自学准考证、十堰图书馆借阅证等。身份信息：袁凯、男、身份证后四位:153 X。若有好心拾到者，请速与本人联系，找回愿付1000元赏金以表感谢，手机：一七七一七四七八零零九。', null, '袁凯', '1', '1', '156669011@qq.com', '上海市电信', '2018-12-13 21:43:22', '2018-12-13 21:43:24');
INSERT INTO `tb_lost` VALUES ('2', '5', '2', '22', '2018-06-13 21:46:27', 'iphone xs max 256G', '11', '11', null, '11', '11', '11', '11', '11', '2018-12-13 21:46:49', '2018-12-13 21:47:01');
INSERT INTO `tb_lost` VALUES ('3', '6', '2', '333', '2018-01-11 21:47:51', '香奈儿包', '22', '22', null, '22', '22', '22', '22', '22', '2018-12-13 21:48:06', '2018-12-13 21:48:12');
INSERT INTO `tb_lost` VALUES ('231432', '7', '2', '主五', '2018-12-24 21:12:01', '丢失U盘一个', '1000元', '在主五#402丢失U盘一个', null, '111', '11', '11', '111', '111', '2018-12-24 21:13:39', '2018-12-24 21:13:48');
INSERT INTO `tb_lost` VALUES ('3241215', '9', '2', '888', '2018-12-22 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241225', '10', '2', 'sdf', '2018-12-21 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241234', '3', '2', '泉州西湖', '2018-12-20 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:02:24', '2018-12-22 11:02:24');
INSERT INTO `tb_lost` VALUES ('3241235', '1', '2', '333', '2018-12-19 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241236', '2', '2', '111', '2018-12-18 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241237', '3', '2', '222', '2018-12-17 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241238', '4', '2', '333', '2018-12-16 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241239', '5', '2', '444', '2018-12-15 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241245', '7', '2', '666', '2018-12-22 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241255', '6', '2', '555', '2018-12-21 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241275', '8', '2', '777', '2018-12-20 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241285', '11', '2', 'fgh', '2018-12-19 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241286', '7', '2', '134', '2018-12-18 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241291', '3', '2', '999', '2018-12-17 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241292', '4', '2', '泉retw', '2018-12-16 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241293', '5', '2', '泉vx', '2018-12-15 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241294', '6', '2', 'ewr', '2018-12-22 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241295', '2', '2', 'qewr', '2018-12-21 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241296', '8', '2', 'zxcv', '2018-12-20 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241297', '9', '2', '泉afsd', '2018-12-19 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241298', '10', '2', 'u655', '2018-12-18 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3241299', '11', '2', '32d3', '2018-12-17 00:00:00', '1', '111', '11', null, '12', '12', '312', '312', '423', '2018-12-22 11:10:31', '2018-12-22 11:10:31');
INSERT INTO `tb_lost` VALUES ('3452367', '3', '2', '山亭大集附近  ', '2018-12-24 21:18:00', '何丽丢失了宠物', '333元', '虽然只是一只土狗，但是依然爱你，有事出门放姐姐家待几天，不幸让人偷走了，希望你不要伤害它，它还小……希望偷狗的良心发现放过它吧，希望能早日见到它，麻烦山东的朋友们帮忙留意一下，谢谢了', null, '222', '222', '222', '222', '22', '2018-12-24 21:18:35', '2018-12-24 21:18:41');
INSERT INTO `tb_lost` VALUES ('3563456', '4', '2', '火车站旁 ', '2018-12-24 21:14:56', '在北师大的培训证书', '1111元', '内有从北京带的特产，一根充电线，耳机，水杯。', null, '333', '33', '333', '33', '333', '2018-12-24 21:15:50', '2018-12-24 21:15:55');
INSERT INTO `tb_lost` VALUES ('154623913235785', '2', '2', '666', '2018-12-31 00:00:00', '666', '6666', '66666666666', 'images/2018/12/31/93097707996342485.jpg', null, null, null, '666@666', null, '2018-12-31 14:52:12', '2018-12-31 14:52:12');
INSERT INTO `tb_lost` VALUES ('154623920805961', '5', '2', '7777', '2018-12-20 00:00:00', '77777', '7777', '77777', 'images/2018/12/31/93191531220812336.jpg', null, null, null, '777@77', null, '2018-12-31 14:53:28', '2018-12-31 14:53:28');
INSERT INTO `tb_lost` VALUES ('154631247434542', '1', '2', '555', '2018-12-31 00:00:00', '555', null, '555', null, null, null, null, '555@qq', null, '2019-01-01 11:14:34', '2019-01-01 11:14:34');
INSERT INTO `tb_lost` VALUES ('918381170435125', '2', '2', 'gdfsgsd', '2018-12-15 00:00:00', 'dfgfsd', null, 'asdf', null, null, null, null, 'sdaf@Qq.com', null, '2018-12-30 15:33:08', '2018-12-30 15:33:08');
INSERT INTO `tb_lost` VALUES ('976783433233043', '6', '2', 'fgdhdfgh', '2018-12-18 00:00:00', 'hhfdg', null, 'gfdhrtxdf', null, null, null, null, 'ertyre@qq.coms', null, '2018-12-30 15:42:52', '2018-12-30 15:42:52');
INSERT INTO `tb_lost` VALUES ('1110580542341068', '3', '2', 'qwerwq', '2018-12-30 00:00:00', 'adsfsad', 'fsdf', 'dsaf', null, null, null, null, 'fasd@qq', null, '2018-12-30 16:05:10', '2018-12-30 16:05:10');
INSERT INTO `tb_lost` VALUES ('1120542284026637', '1', '2', 'sfdg', '2018-12-30 00:00:00', 'gfxf', 'sdf', 'gsdf', null, 'sdfg', 'gfsd', null, 'fsdgs@qq.com', null, '2018-12-30 16:06:49', '2018-12-30 16:06:49');
INSERT INTO `tb_lost` VALUES ('1226222979039844', '7', '2', 'adsfa', '2018-12-30 00:00:00', 'dfgda', 'gfds', 'sadfsadgr', null, 'adsafas', null, null, 'asdfsd@qq', null, '2018-12-30 16:24:26', '2018-12-30 16:24:26');
INSERT INTO `tb_lost` VALUES ('1254776406208853', '6', '2', 'fewfwesa', '2018-12-30 00:00:00', 'dsafsa', 'fasd', 'sdafasd', null, 'werqw', null, null, 'asdfasdg@Qq', null, '2018-12-30 16:29:11', '2018-12-30 16:29:11');
INSERT INTO `tb_lost` VALUES ('1280032276602544', '2', '2', 'sdfger', '2018-12-30 00:00:00', 'gfsd', 'egsfd', 'gfsdgr', null, null, null, null, 'sdfg@qq', null, '2018-12-30 16:33:24', '2018-12-30 16:33:24');
INSERT INTO `tb_lost` VALUES ('1375085616701338', '5', '2', 'resvfd', '2018-12-27 00:00:00', 'gdfsger', 'sdfg', 'sdfg', null, null, null, null, 'sdfgerdfzsgefrg@q', null, '2018-12-30 16:49:15', '2018-12-30 16:49:15');
INSERT INTO `tb_lost` VALUES ('2054068993013896', '5', '2', 'asdfs', '2018-12-30 00:00:00', 'dsafas', 'fasdfew', 'sadfasdf', null, null, null, null, 'sadf@Qq', null, '2018-12-30 18:42:24', '2018-12-30 18:42:24');
INSERT INTO `tb_lost` VALUES ('2184676528132766', '1', '2', 'qqqq', '2018-12-30 00:00:00', 'qqqq', 'qqqqq', 'qweqwe', null, null, null, null, 'sdafsa@qqq', null, '2018-12-30 19:04:10', '2018-12-30 19:04:10');
INSERT INTO `tb_lost` VALUES ('2246105044638460', '2', '2', 'dsafsadfas', '2018-12-19 00:00:00', 'sdfadfsd', 'sdafwea', 'dafead', null, null, null, null, 'fwetwq@qqq', null, '2018-12-30 19:14:25', '2018-12-30 19:14:25');
INSERT INTO `tb_lost` VALUES ('2260621967169931', '3', '2', 'asdfasd', '2018-12-30 00:00:00', 'vasdfvas', 'xczvwa', 'sadfasd', null, null, null, null, 'werfwad@qq', null, '2018-12-30 19:16:50', '2018-12-30 19:16:50');
INSERT INTO `tb_lost` VALUES ('2315563703544093', '6', '2', 'sadf', '2018-12-30 00:00:00', 'sdafasdf', 'dsafwe', 'asdfas', null, 'wewsda', 'asd', null, 'sa23@1', 'dsad', '2018-12-30 19:25:59', '2018-12-30 19:25:59');
INSERT INTO `tb_lost` VALUES ('2323559600170056', '2', '2', 'asdfsad', '2018-12-27 00:00:00', 'dsafsda', 'sadf', 'sadfsa', null, null, null, null, 'dsa!Q@dsa', null, '2018-12-30 19:27:19', '2018-12-30 19:27:19');
INSERT INTO `tb_lost` VALUES ('2332580276896874', '1', '2', 'sadfsa', '2018-12-19 00:00:00', 'sdaca', 'sdfsda', 'fsasa', null, 'scda', null, null, 'sad@sa', null, '2018-12-30 19:28:50', '2018-12-30 19:28:50');
INSERT INTO `tb_lost` VALUES ('2344521732260017', '3', '2', 'dfsafds', '2018-12-29 00:00:00', 'sdafa', 'sdaf', 'sadf', 'images/2018/12/30/23417534111747194.jpg', 'sdaf', 'sad', null, 'sdaf@1', 'sadsda', '2018-12-30 19:30:49', '2018-12-30 19:30:49');
INSERT INTO `tb_lost` VALUES ('2351115497206574', '2', '2', 'dsaf', '2018-12-20 00:00:00', 'sdafsa', 'fsadf', 'sadfsa', 'images/2018/12/30/23499352707300817.jpg', 'sadfsa', 'dfas', null, 'asdf@qq', 'sdafsad', '2018-12-30 19:31:55', '2018-12-30 19:31:55');
INSERT INTO `tb_lost` VALUES ('2406600447196853', '5', '2', '丰台区张仪村月宫路口出租车上', '2018-12-30 19:05:05', '苹果ipad', '5000  元', '本人2018年十二月二十五号在丰台区张仪村月宫路口打了一个出租车 半路停车了 出租师傅走了 苹果平板电脑丢车上了 望师傅看见联系我 必有重谢!', 'images/2018/12/30/24019829321092129.jpg', '王延敏', '123456', null, '123@qq.com', '77777', '2018-12-30 19:41:10', '2018-12-30 19:41:10');
INSERT INTO `tb_lost` VALUES ('2942346978246131', '2', '2', 'fasdfasd', '2018-12-30 00:00:00', 'dsafasd', 'fdsafsad', 'asdfsadfewzc', 'images/2018/12/30/29410556447212257.jpg', 'sadfsadew', 'sdafasd', null, 'sadfasd@qq', null, '2018-12-30 21:10:27', '2018-12-30 21:10:27');
INSERT INTO `tb_lost` VALUES ('3009997676133112', '3', '2', 'fasdf', '2018-12-30 00:00:00', 'fsadfasd', 'asdf', 'asdf', 'images/2018/12/30/30086239771821813.jpg', null, null, null, 'asdfsa@qq', null, '2018-12-30 21:21:44', '2018-12-30 21:21:44');
INSERT INTO `tb_lost` VALUES ('3047163873921064', '3', '2', 'sdfasd', '2018-12-26 00:00:00', 'zfdsafsad', 'asdfsa', 'dfsadf', 'images/2018/12/30/30462192337397082.jpg', 'adsfsad', 'fsadf', null, 'fsafd@qq', 'efaefsad', '2018-12-30 21:27:55', '2018-12-30 21:27:55');
INSERT INTO `tb_lost` VALUES ('3068556615707581', '2', '2', 'sadfwe', '2018-12-20 00:00:00', 'sdafasdfewq', 'fwef', 'sadfsa', 'images/2018/12/30/30676950127526515.jpg', 'fasdf', 'sdafsa', null, 'fas@qq', 'asdf', '2018-12-30 21:31:29', '2018-12-30 21:31:29');
INSERT INTO `tb_lost` VALUES ('3076065303736352', '3', '2', 'sadfsad', '2018-12-28 00:00:00', 'fasdfas', 'adsfsad', 'fsadfasd', 'images/2018/12/30/30754025146856388.jpg', 'asdf', 'adsf', null, 'f@qq', null, '2018-12-30 21:32:44', '2018-12-30 21:32:44');
INSERT INTO `tb_lost` VALUES ('3122870742414291', '2', '2', 'dfasdf', '2018-12-20 00:00:00', 'sadfasd', 'asdfasd', 'faseawdas', 'images/2018/12/30/31221278864444464.jpg', null, null, null, 'fasd@qqq', null, '2018-12-30 21:40:32', '2018-12-30 21:40:32');
INSERT INTO `tb_lost` VALUES ('3126687619058638', '2', '2', 'asdfdsa', '2018-12-29 00:00:00', 'dvsavz', 'xzcvsd', 'csd', 'images/2018/12/30/31258843737704787.jpg', 'dsafs', 'dsaf', null, 'zxcsa@qqq', null, '2018-12-30 21:41:11', '2018-12-30 21:41:11');
INSERT INTO `tb_lost` VALUES ('46642565826769591', '6', '2', '安溪万达', '2018-12-29 08:00:00', '丢失啦啦啦', null, '在安溪万达丢失一只哈巴狗', null, null, null, null, '123@qq.com', null, '2018-12-29 20:34:21', '2018-12-29 20:34:21');
INSERT INTO `tb_lost` VALUES ('47520733635285112', '7', '2', '哈尔滨', '2018-12-29 08:00:00', '丢失了东西', null, '在哈尔滨丢失一只阿拉斯加狗', null, null, null, null, '321@qq.com', null, '2018-12-29 23:00:43', '2018-12-29 23:00:43');
INSERT INTO `tb_lost` VALUES ('47735582477413474', '3', '2', '意大利', '2018-12-27 00:00:00', '大白失踪了', '1000元', '失踪了，好伤心！', null, 'kitty', '123456', null, '1123@qq.com', '海南', '2018-12-29 23:36:31', '2018-12-29 23:36:31');

-- ----------------------------
-- Table structure for tb_soulmate
-- ----------------------------
DROP TABLE IF EXISTS `tb_soulmate`;
CREATE TABLE `tb_soulmate` (
  `id` bigint(11) NOT NULL,
  `infoTitle` varchar(50) NOT NULL COMMENT '信息标题',
  `meet_time` datetime NOT NULL COMMENT '相遇时间',
  `meet_place` varchar(100) NOT NULL COMMENT '相遇地点',
  `description` text NOT NULL COMMENT '详细描述',
  `photo` varchar(255) DEFAULT NULL COMMENT '照片',
  `contactWay` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `email` varchar(50) NOT NULL COMMENT '联系邮箱',
  `password` varchar(20) NOT NULL COMMENT '管理密码',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_soulmate
-- ----------------------------

-- ----------------------------
-- Table structure for tb_textinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_textinfo`;
CREATE TABLE `tb_textinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '物品ID',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `page_view` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT '状态：0/寻找中，1/已找到',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_textinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_thanks
-- ----------------------------
DROP TABLE IF EXISTS `tb_thanks`;
CREATE TABLE `tb_thanks` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '感谢信标题',
  `thanks_text` text NOT NULL COMMENT '感谢信正文',
  `images` varchar(255) DEFAULT NULL COMMENT '图片',
  `letter_view` int(11) NOT NULL COMMENT '浏览次数',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_thanks
-- ----------------------------

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(30) NOT NULL COMMENT '密码',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1', 'admin', '123456', '123456', '123@qq.com', '2018-12-13 21:36:10', '2018-12-13 21:36:12');
INSERT INTO `tb_users` VALUES ('2', 'user1', '654321', '654321', '654@qq.com', '2018-12-13 21:36:47', '2018-12-13 21:36:52');
