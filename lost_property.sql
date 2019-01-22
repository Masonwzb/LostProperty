/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : lost_property

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-01-22 22:42:42
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL COMMENT '物品ID',
  `comment_text` text NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166830142462742880 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('1', '154752159872591', '清晨午后黄昏的巴黎，一直是我记忆中最美的瞬间', '2019-01-17 17:54:28', '2019-01-17 17:54:31', '2019-01-17 17:54:33');
INSERT INTO `tb_comment` VALUES ('2', '154752432618431', '往后余生 吃不胖的是你 巨有钱的是你 拥有一切美好的 还是你', '2019-01-17 17:55:17', '2019-01-17 17:55:20', '2019-01-17 17:55:23');
INSERT INTO `tb_comment` VALUES ('3', '154752221029729', '离乱中寻觅一张安静的书桌，未曾向洋已经砺就了锋锷。受命之日，寝不安席，当年吴钩，申城淬火，十月出塞，大器初成。一句嘱托，许下了一生;一声巨响，惊诧了世界;一个名字，荡涤了人心。', '2019-01-17 17:56:15', '2019-01-17 17:56:18', '2019-01-17 17:56:21');
INSERT INTO `tb_comment` VALUES ('4', '154752383719702', '亲戚或余悲，他人亦已歌，斯人虽逝，但星空，将与世长存。', '2019-01-17 17:57:01', '2019-01-17 17:57:04', '2019-01-17 17:57:07');
INSERT INTO `tb_comment` VALUES ('5', '154752432618431', '总会有一个人，即使你满身是刺，也会张开双手拥抱你', '2019-01-18 17:24:59', '2019-01-18 17:25:02', '2019-01-18 17:25:06');
INSERT INTO `tb_comment` VALUES ('6', '154752432618431', '等你长大就会发现，当你满身是刺，依然会爱你拥抱你的，只有家人。', '2019-01-18 17:25:42', '2019-01-18 17:25:44', '2019-01-18 17:25:46');
INSERT INTO `tb_comment` VALUES ('7', '154752432618431', '“对于有社交恐惧的人来说，他们的自学能力都来自于不好意思开口问别人” ​​​​', '2019-01-18 17:27:51', '2019-01-18 17:27:55', '2019-01-18 17:27:57');
INSERT INTO `tb_comment` VALUES ('8', '154752432618431', '感谢父母给我的一首好牌。', '2019-01-18 17:29:05', '2019-01-18 17:29:09', '2019-01-18 17:29:12');
INSERT INTO `tb_comment` VALUES ('9', '154752432618431', '“他那么小你让着他怎么了？”，有时候特别讨厌这句话，不是年纪小就可以是非不分。心疼台上和台下的两个小女孩。 ​​​​', '2019-01-18 17:30:52', '2019-01-18 17:30:54', '2019-01-18 17:30:57');
INSERT INTO `tb_comment` VALUES ('10', '154752432618431', '你不知道我当年受过的苦，就不要劝我大度。', '2019-01-18 17:31:28', '2019-01-18 17:31:30', '2019-01-18 17:31:33');
INSERT INTO `tb_comment` VALUES ('11130320861774166', '154781351248543', '“其实所有纠结做选择的人心里早就有了答案，咨询只是想得到内心所倾向的选择。\n最终的所谓命运，还是自己一步步走出来的。”\n                       \n——东野圭吾 ​​​​', '2019-01-21 22:08:36', '2019-01-21 22:08:36', '2019-01-21 22:08:36');
INSERT INTO `tb_comment` VALUES ('18303074615998782', '154814930597209', 'dfhtngcxdh', '2019-01-22 18:03:57', '2019-01-22 18:03:57', '2019-01-22 18:03:57');
INSERT INTO `tb_comment` VALUES ('19309106130847592', '154814930597209', 'dfxh\'', '2019-01-22 20:51:37', '2019-01-22 20:51:37', '2019-01-22 20:51:37');
INSERT INTO `tb_comment` VALUES ('19311251662226993', '154815058711758', '更换玫瑰花', '2019-01-22 20:51:59', '2019-01-22 20:51:59', '2019-01-22 20:51:59');
INSERT INTO `tb_comment` VALUES ('166394754873962191', '154752432618431', '“你的人生只有你是主角，没关系，一定会很顺利的。” ​​​​', '2019-01-18 19:09:54', '2019-01-18 19:09:54', '2019-01-18 19:09:54');
INSERT INTO `tb_comment` VALUES ('166403130552262600', '154752432618431', '每个人又忙又累，又没有感觉真的得到什么。这种巨大的疲惫感和虚无感总是不间断地出现，凶狠地笼罩着这个世界。', '2019-01-18 19:11:18', '2019-01-18 19:11:18', '2019-01-18 19:11:18');
INSERT INTO `tb_comment` VALUES ('166419454930839932', '154752383719702', '像我这样冷漠不爱社交懒得回消息的人，如果每天都会和你说一大堆的废话，一定是非常喜欢你了', '2019-01-18 19:14:01', '2019-01-18 19:14:01', '2019-01-18 19:14:01');
INSERT INTO `tb_comment` VALUES ('166517153001397562', '154752221029729', '人们的疲劳通常不是由于工作本身，而是由于忧虑、紧张和不快。', '2019-01-18 19:30:18', '2019-01-18 19:30:18', '2019-01-18 19:30:18');
INSERT INTO `tb_comment` VALUES ('166683153169422468', '154752432618431', '这个世界还有很多你未曾体验的美好，所以你千万不要放弃，最好的东西，总是压轴的。', '2019-01-18 19:57:58', '2019-01-18 19:57:58', '2019-01-18 19:57:58');
INSERT INTO `tb_comment` VALUES ('166709212212275075', '154752383719702', '超过一定的年龄之后，所谓人生，无非是一个不断丧失的过程而已。宝贵的东西，便会像梳子豁了齿一样从手中滑落下去。你所爱的人就会一个接着一个，从身旁悄然消逝。\n\n——村上春树 ​​​​', '2019-01-18 20:02:19', '2019-01-18 20:02:19', '2019-01-18 20:02:19');
INSERT INTO `tb_comment` VALUES ('166713903200812246', '154752221029729', '“我在自己周围筑起高墙，没有哪个人能够入内，也尽量不放自己出去。”\n\n——村上春树 ​​​​', '2019-01-18 20:03:06', '2019-01-18 20:03:06', '2019-01-18 20:03:06');
INSERT INTO `tb_comment` VALUES ('166736011955897025', '154752432618431', '我喜欢我的懦弱，痛苦和难堪也喜欢。\n喜欢夏天的光照，风的气息，蝉的鸣叫，\n喜欢这些，喜欢得不得了。\n\n——村上春树 ​​​​', '2019-01-18 20:06:47', '2019-01-18 20:06:47', '2019-01-18 20:06:47');
INSERT INTO `tb_comment` VALUES ('166816131294454597', '154781364597976', '“我们要去变得更好\n不要总是回头 ​” ​​​​', '2019-01-18 20:20:08', '2019-01-18 20:20:08', '2019-01-18 20:20:08');
INSERT INTO `tb_comment` VALUES ('166821549148243374', '154781392231049', '熟悉又温暖的，还是这人间烟火啊 ​​​​', '2019-01-18 20:21:02', '2019-01-18 20:21:02', '2019-01-18 20:21:02');
INSERT INTO `tb_comment` VALUES ('166825620060179330', '154781380741737', '很多人都说你很懂事，但是没人问你快不快乐', '2019-01-18 20:21:43', '2019-01-18 20:21:43', '2019-01-18 20:21:43');
INSERT INTO `tb_comment` VALUES ('166830142462742879', '154781351248543', '这个世界沒有什么好畏懼的，\n反正我们只来一次。 ​​​​', '2019-01-18 20:22:28', '2019-01-18 20:22:28', '2019-01-18 20:22:28');

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
  `password` varchar(20) NOT NULL COMMENT '删除、修改密码',
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
INSERT INTO `tb_found` VALUES ('154752221029729', '5', '2', '天津市红桥区', '2019-01-09 00:00:00', '小米手机一部', '于1月9日在天津市红桥区拾取', 'images/2019/01/15/1376290283731136044.jpg', '王先生', '123456', null, '123456@qq.com', null, '123456', '2019-01-15 11:16:50', '2019-01-15 11:16:50');
INSERT INTO `tb_found` VALUES ('154752383719702', '1', '2', '大学路西大侧门', '2018-12-24 00:00:00', '招领钱包', '昨晚在大学路西大侧门酒店停车场拾获钱包1个，内有身份证、社保卡等多样物品。身份证姓名为马青兰。', 'images/2019/01/15/1377928829323658689.jpg', '卢维明', '123456', null, '123456@qq.com', '广西南宁市联通', '123456', '2019-01-15 11:43:57', '2019-01-15 11:43:57');
INSERT INTO `tb_found` VALUES ('154781364597976', '4', '2', '东花坛邮政银行ATM自动取款机', '2018-12-17 00:00:00', '洛阳东花坛附近邮政银行卡', '我在东花坛邮政取钱时自动取款机吐出来一张银行卡没人要我就扔了要的联系我邮政卡号是621********03327970看到的加我QQ1169088943要是有问题随便回答', 'images/2019/01/18/1667739945066679222.jpg', '王一凡', '123456', null, '12@qq.com', '洛阳市洛龙区瀍河区', '123456', '2019-01-18 20:14:06', '2019-01-18 20:14:06');
INSERT INTO `tb_found` VALUES ('154815058711758', '8', '2', 'gasddsfg', '2019-01-10 00:00:00', 'dsafa', 'gergdsxf', null, null, null, null, 'fs@gsfge', null, '123456', '2019-01-22 17:49:47', '2019-01-22 17:49:47');

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
  `password` varchar(20) NOT NULL COMMENT '删除、修改密码',
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
INSERT INTO `tb_lost` VALUES ('154752159872591', '11', '2', '天津河东区唐口长征路三条一排3-4', '2019-01-12 00:00:00', '寻观音菩萨莲花坐像', '500元', '2019/1/12中午，因拆迁家人整理东西，将10厘米左右观音菩萨莲花彩色瓷坐像，放在院内我家左侧住宅窗台外，被别人偷走，这是讲究缘分的，没有缘分，是偷！就会给人带来不幸，灾祸！手机：123456，酬金可议', null, '张玉梅', '123456', null, '123456@qq.com', '天津河东区唐口长征路3条一排3-4', '123456pwd', '2019-01-15 11:06:39', '2019-01-15 11:06:39');
INSERT INTO `tb_lost` VALUES ('154752432618431', '6', '2', '洲洋宾馆附近', '2019-01-09 00:00:00', '丢失布袋，内装有学生证，身份证若干', null, '在洲洋宾馆附近丢失布袋，内装有学生证，身份证，港澳台通行证，银行卡请捡到的好心人联系我，学生证是西安交通大学的', null, '杨涛', null, null, '123456@qq.com', '北京市海淀区知春路洲洋宾馆', '123456', '2019-01-15 11:52:06', '2019-01-15 11:52:06');
INSERT INTO `tb_lost` VALUES ('154781351248543', '8', '2', '大理花语牧场', '2018-12-01 00:00:00', '寻项链，意义非凡，酬金高', '1500元', '丢失金项链带个小红宝石吊坠，沙金不值钱，但对我而言意义，是重要的人送的，酬金为东西的原价，只想找回。', 'images/2019/01/18/1667608732116831918.jpg', '安琪', '123456', null, '123@qq.com', '辽宁省沈阳市移动', '123456', '2019-01-18 20:11:52', '2019-01-18 20:11:52');
INSERT INTO `tb_lost` VALUES ('154781380741737', '4', '2', '欣苑小区', '2019-01-18 00:00:00', '邓益恒钱包身份证驾驶证', null, '17日晚到18日早在晚安欣苑小区到郑家寺村丢失本人钱包一个，内含身份证驾驶证银行卡现金，如有好心人捡到必有重报', 'images/2019/01/18/1667906122270718595.jpg', '邓益恒', '123456', null, '1@qq.com', '西安市', '123456', '2019-01-18 20:16:47', '2019-01-18 20:16:47');
INSERT INTO `tb_lost` VALUES ('154781392231049', '5', '2', '忘记了', '2019-01-17 00:00:00', '舒欢丢失了数码产品', null, '一个黑色的泡沫箱，里面是一个单反稳定器，一般的人也用不到，是我吃饭的东西，希望拿走的人可以联系我，必有重谢?????????', 'images/2019/01/18/1668014121063881453.jpg', '舒欢', '123456', null, '12345@qq.com', '未知电信', '123456', '2019-01-18 20:18:42', '2019-01-18 20:18:42');
INSERT INTO `tb_lost` VALUES ('154814930597209', '2', '2', 'sdaf', '2019-01-11 00:00:00', 'csad', null, 'sdaf', null, null, null, null, 'fwe@as', null, '123456', '2019-01-22 17:28:26', '2019-01-22 17:28:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_textinfo
-- ----------------------------
INSERT INTO `tb_textinfo` VALUES ('1', '154752159872591', '2019-01-15 11:06:39', '24', '0', '2019-01-15 11:06:39', '2019-01-22 22:40:18');
INSERT INTO `tb_textinfo` VALUES ('2', '154752221029729', '2019-01-15 11:16:50', '11', '0', '2019-01-15 11:16:50', '2019-01-18 20:05:56');
INSERT INTO `tb_textinfo` VALUES ('4', '154752383719702', '2019-01-15 11:43:57', '19', '0', '2019-01-15 11:43:57', '2019-01-22 20:15:57');
INSERT INTO `tb_textinfo` VALUES ('5', '154752432618431', '2019-01-15 11:52:06', '61', '0', '2019-01-15 11:52:06', '2019-01-21 22:01:06');
INSERT INTO `tb_textinfo` VALUES ('6', '154781351248543', '2019-01-18 20:11:52', '9', '0', '2019-01-18 20:11:52', '2019-01-22 21:14:35');
INSERT INTO `tb_textinfo` VALUES ('7', '154781364597976', '2019-01-18 20:14:06', '5', '0', '2019-01-18 20:14:06', '2019-01-18 20:24:02');
INSERT INTO `tb_textinfo` VALUES ('8', '154781380741737', '2019-01-18 20:16:47', '8', '0', '2019-01-18 20:16:47', '2019-01-22 20:51:11');
INSERT INTO `tb_textinfo` VALUES ('9', '154781392231049', '2019-01-18 20:18:42', '17', '0', '2019-01-18 20:18:42', '2019-01-22 22:37:30');
INSERT INTO `tb_textinfo` VALUES ('10', '154814930597209', '2019-01-22 17:28:26', '32', '0', '2019-01-22 17:28:26', '2019-01-22 20:51:38');
INSERT INTO `tb_textinfo` VALUES ('11', '154815058711758', '2019-01-22 17:49:47', '3', '0', '2019-01-22 17:49:47', '2019-01-22 20:51:59');

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
