/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : lost_property

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-02-28 20:08:06
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

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
INSERT INTO `tb_comment` VALUES ('7544406749069924', '155117471786043', 'adsfwesadfesd', '2019-02-27 15:56:38', '2019-02-27 15:56:38', '2019-02-27 15:56:38');
INSERT INTO `tb_comment` VALUES ('7570312108605347', '154859009886768', 'dxfbgsrefx dr', '2019-02-27 16:00:57', '2019-02-27 16:00:57', '2019-02-27 16:00:57');
INSERT INTO `tb_comment` VALUES ('11812177952265255', '154858977146124', '成年人情绪稳定的秘诀之一：总是把对他人的期待放到最低。', '2019-02-14 19:21:20', '2019-02-14 19:21:20', '2019-02-14 19:21:20');
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
  `found_place` varchar(50) NOT NULL,
  `found_time` datetime NOT NULL,
  `infoTitle` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `images` varchar(255) DEFAULT NULL COMMENT '物品图片',
  `status` int(1) NOT NULL COMMENT '0/未审核，1/审核通过，2/审核未通过',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `QQ` varchar(50) DEFAULT NULL COMMENT '联系QQ',
  `email` varchar(50) NOT NULL COMMENT '联系邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `password` varchar(20) NOT NULL COMMENT '删除、修改密码',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id2` (`category_id`),
  CONSTRAINT `category_id2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_found
-- ----------------------------
INSERT INTO `tb_found` VALUES ('154752221029729', '5', '天津市红桥区', '2019-01-09 00:00:00', '小米手机一部', '于1月9日在天津市红桥区拾取', 'images/2019/01/15/1376290283731136044.jpg', '0', '王先生', '123456', '77777', '123456@qq.com', null, '123456', '2019-01-15 11:16:50', '2019-01-27 12:00:39');
INSERT INTO `tb_found` VALUES ('154752383719702', '1', '大学路西大侧门', '2018-12-24 00:00:00', '招领钱包', '昨晚在大学路西大侧门酒店停车场拾获钱包1个，内有身份证、社保卡等多样物品。身份证姓名为马青兰。', 'images/2019/01/24/370490353830218117.jpg', '1', '卢维明', '123456', '77777', '123456@qq.com', '广西南宁市联通', '123456', '2019-01-15 11:43:57', '2019-01-24 22:08:01');
INSERT INTO `tb_found` VALUES ('154781364597976', '4', '东花坛邮政银行ATM自动取款机', '2018-12-17 00:00:00', '洛阳东花坛附近邮政银行卡', '我在东花坛邮政取钱时自动取款机吐出来一张银行卡没人要我就扔了要的联系我邮政卡号是621********03327970看到的加我QQ1169088943要是有问题随便回答', 'images/2019/01/18/1667739945066679222.jpg', '0', '王一凡', '123456', '77777', 'bineawu@163.com', '洛阳市洛龙区瀍河区', '123456', '2019-01-18 20:14:06', '2019-01-18 20:14:06');
INSERT INTO `tb_found` VALUES ('154859029628249', '11', '240公交车上', '2019-01-10 00:00:00', '卡培他滨 药物', '我老公是240驾驶员，捡到四盒卡培他滨药物', 'images/2019/01/27/623041955675802256.jpg', '1', '张艳', '4653456', '77777', '1342323@qq.com', '红旗街与宽平大路交汇处无', '123456', '2019-01-27 19:58:16', '2019-01-27 20:16:50');
INSERT INTO `tb_found` VALUES ('154859042291358', '4', '嘉禾望岗科甲水', '2019-01-25 00:00:00', 'Tae Yeon拾到了证件', '在科甲水绿呗烘焙附近捡到一张身份证和驾驶证银行卡姓名李秀雨请快快联系我！', 'images/2019/01/27/622012767024798258.jpg', '0', 'Tae Yeon', '657456', '77777', '3244532@qq.com', null, '123456', '2019-01-27 20:00:23', '2019-01-27 20:00:23');
INSERT INTO `tb_found` VALUES ('154859054097473', '3', '北京 > 海淀 > 不详', '2018-11-17 00:00:00', '雪纳瑞狗', '黑白色雪纳瑞一只有狗链见小孩爱叫', 'images/2019/01/27/622990308180721634.jpg', '0', '周女士', '8756675', '77777', '2342365465@qq.com', '北京市海淀区联通', '123456', '2019-01-27 20:02:21', '2019-01-27 20:15:57');
INSERT INTO `tb_found` VALUES ('154859063562834', '9', '四川 > 泸州 > 出租车', '2018-11-20 00:00:00', '招领棕色行李箱', '出租车师傅拾到棕色行李箱。失主看到请联系', 'images/2019/01/27/622220963781556848.jpg', '1', 'andy', '456288762', '999', '145467967@qq.com', '四川省泸州市电信', '123456', '2019-01-27 20:03:56', '2019-02-14 19:22:45');
INSERT INTO `tb_found` VALUES ('154859074815160', '11', '四川 > 泸州 > 泸州市迎宾大道一段', '2018-11-04 00:00:00', '拾到一把吉他', '在十五中学上的的士车，掉的吉他', 'images/2019/01/27/622320541901751726.jpg', '1', 'kitty', '1213253', '77777', '5460982@qq.com', '四川省泸州市电信', '123456', '2019-01-27 20:05:48', '2019-01-27 20:05:48');
INSERT INTO `tb_found` VALUES ('154859087790528', '3', '浙江 > 杭州 > 杭州下沙东部医药小镇', '2018-10-24 00:00:00', '宠物狗', '捡到萨摩耶一只，有50斤重吧，望失主看到信息尽早认领。', 'images/2019/01/27/622462474052308210.jpg', '0', 'rtew', '34634345', '77777', '1242315325@qq.com', '杭州下沙', '123456', '2019-01-27 20:07:58', '2019-01-27 20:07:58');
INSERT INTO `tb_found` VALUES ('154859098696882', '5', '云南 > 昆明 > 昆明62路公交车上', '2018-10-13 00:00:00', '16GB金士顿u盘', '于2018年10月13日下午四点左右在昆明62路双层公交下层拾到一个16GB金士顿u盘，请失主看到后及时联系招领。', 'images/2019/01/27/622566107823972839.jpg', '1', '刀刀', '342523623', '77777', '435233241@qq.com', '昆明市官渡区大板桥', '123456', '2019-01-27 20:09:47', '2019-01-27 20:09:47');
INSERT INTO `tb_found` VALUES ('155014204225454', '2', 'gerdsa', '2019-02-02 00:00:00', 'asdfdasf', 'dasgaegvra', null, '1', '已保密', '已保密', '已保密', '已保密', '已保密', '123456', '2019-02-14 19:00:42', '2019-02-14 19:00:42');
INSERT INTO `tb_found` VALUES ('155117488493455', '4', '河南 > 郑州 > 毛庄老社区内部主干道幼儿园对面', '2019-02-19 00:00:00', '段晓玲的身份证及驾照', '19号晚六点半到七点中间，我去毛庄社区农贸市场买元宵，在幼儿园对面的路边捡到一个证件夹（粉色）', null, '1', '李小姐', '345234', '32412512', '534234@qq.com', '河南省郑州市移动', '123456', '2019-02-26 17:54:45', '2019-02-26 17:54:45');
INSERT INTO `tb_found` VALUES ('155135328848634', '6', '54yrs5', '2019-02-07 00:00:00', 'sery54sr', 'rfgujtfkt', null, '1', 'drty', 'drt', 'gserhy5se', 'setfr@gersrsdf', 'rgs5y', '123456', '2019-02-28 19:28:08', '2019-02-28 19:28:08');

-- ----------------------------
-- Table structure for tb_lost
-- ----------------------------
DROP TABLE IF EXISTS `tb_lost`;
CREATE TABLE `tb_lost` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '物品分类ID',
  `lost_place` varchar(50) NOT NULL COMMENT '丢失地点',
  `lost_time` datetime NOT NULL COMMENT '丢失日期',
  `infoTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息标题',
  `rewards` varchar(100) DEFAULT NULL COMMENT '报酬方式',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情描述',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物品图片',
  `status` int(1) NOT NULL COMMENT '0/未审核，1/审核通过，2/审核未通过',
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '联系人',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `password` varchar(20) NOT NULL COMMENT '删除、修改密码',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lost
-- ----------------------------
INSERT INTO `tb_lost` VALUES ('154752159872591', '11', '天津河东区唐口长征路三条一排3-4', '2019-01-12 00:00:00', '寻观音菩萨莲花坐像', '500元', '2019/1/12中午，因拆迁家人整理东西，将10厘米左右观音菩萨莲花彩色瓷坐像，放在院内我家左侧住宅窗台外，被别人偷走，这是讲究缘分的，没有缘分，是偷！就会给人带来不幸，灾祸！手机：123456，酬金可议', 'images/2019/01/26/517000402915060980.jpg', '1', '张玉梅', '123456', '66666', 'bineawu@163.com', '天津河东区唐口长征路3条一排3-4', '123456pwd', '2019-01-15 11:06:39', '2019-01-26 19:58:16');
INSERT INTO `tb_lost` VALUES ('154752432618431', '6', '洲洋宾馆附近', '2019-01-09 00:00:00', '丢失布袋，内装有学生证，身份证若干', null, '在洲洋宾馆附近丢失布袋，内装有学生证，身份证，港澳台通行证，银行卡请捡到的好心人联系我，学生证是西安交通大学的', null, '1', '杨涛', '123123', '66666', 'bineawu@163.com', '北京市海淀区知春路洲洋宾馆', '123456', '2019-01-15 11:52:06', '2019-01-26 20:13:31');
INSERT INTO `tb_lost` VALUES ('154781351248543', '8', '大理花语牧场', '2018-12-01 00:00:00', '寻项链，意义非凡，酬金高', '1500元', '丢失金项链带个小红宝石吊坠，沙金不值钱，但对我而言意义，是重要的人送的，酬金为东西的原价，只想找回。', 'images/2019/01/18/1667608732116831918.jpg', '0', '安琪', '123456', '66666', '123@qq.com', '辽宁省沈阳市移动', '123456', '2019-01-18 20:11:52', '2019-01-18 20:11:52');
INSERT INTO `tb_lost` VALUES ('154781380741737', '4', '欣苑小区', '2019-01-18 00:00:00', '邓益恒钱包身份证驾驶证', null, '17日晚到18日早在晚安欣苑小区到郑家寺村丢失本人钱包一个，内含身份证驾驶证银行卡现金，如有好心人捡到必有重报', 'images/2019/01/18/1667906122270718595.jpg', '1', '邓益恒', '123456', '66666', '1@qq.com', '西安市', '123456', '2019-01-18 20:16:47', '2019-01-18 20:16:47');
INSERT INTO `tb_lost` VALUES ('154781392231049', '5', '忘记了--', '2019-01-16 00:00:00', '舒欢丢失了数码产品', '7777RMB', '一个黑色的泡沫箱，里面是一个单反稳定器，一般的人也用不到，是我吃饭的东西，希望拿走的人可以联系我，必有重谢！！！！！！', 'images/2019/01/18/1668014121063881453.jpg', '1', '舒欢', '123456', '66666', '123456@qq.com', '未知电信', '123456', '2019-01-18 20:18:42', '2019-01-27 11:38:28');
INSERT INTO `tb_lost` VALUES ('154858964259491', '1', '25路公交车', '2019-01-27 00:00:00', '寻找粉色钱包', null, '1.27早上8点左右。在25路公交车上丢失粉色钱包。里面有20元现金2张银行卡', 'images/2019/01/27/621205997866006266.jpg', '0', '小车', '18081533229', '66666', '324213@qq.com', '蜻蜓网吧', '123456', '2019-01-27 19:47:23', '2019-01-27 19:47:23');
INSERT INTO `tb_lost` VALUES ('154858977146124', '7', '伟星城一期向东—涌金西路向南—沈巷路—赤铸山中路—赤铸山东路向南—河清路—仁和天地，沿路', '2019-01-26 00:00:00', '本人于1.26晚骑车过程中丢失红脸相间棉服一件，里边有重要证件', '50  元', '1.26晚7:05-7:25之间，衣物放在车后包里 路上遗失却不自知，具体位置不确定，望好心人拾到归还，非常感谢！', 'images/2019/01/27/621351222100816634.jpg', '0', '王女士', '2543534', '88888888', '234212342@qq.com', '浙江省温州市电信', '123456', '2019-01-27 19:49:31', '2019-02-14 19:19:53');
INSERT INTO `tb_lost` VALUES ('154858988208910', '1', '滨江南岸晶都豆豆网咖', '2019-01-24 00:00:00', '滨江南岸晶都豆豆网咖', '100  元', '16点40多到71号机上网直至凌晨2点，期间钱包不慎遗漏至沙发上，希望好心人能够归还，就要过年回家了，证件很重要，里面的卡也没钱，也没现金，旁边72号机的龙小毅先生如果你有帮我保管的话，希望归还，谢谢。', 'images/2019/01/27/621455457893402306.jpg', '1', '程凯', '535645634', '66666', '35123423@qq.com', '滨江长江西苑', '123456', '2019-01-27 19:51:22', '2019-01-27 19:51:22');
INSERT INTO `tb_lost` VALUES ('154858999172743', '6', '南二环（省体育场-永松路）之间', '2019-01-24 00:00:00', '深蓝色手提包不慎丢失，，，急急急', '500  元', '本人1月24晚七点10分，从省体坐了个摩的到永松路，路上不慎将公文包遗失，包里有几把钥匙，充电器、还有很重要的工作资料，，，，是一个深蓝色公文包，，，，如有见到，请联系聂之涛，136********，，万分感激，有重谢、、、', 'images/2019/01/27/621580083252257682.jpg', '1', '聂涛', '156786578567', '66666', '3532534@qq.com', '西安经开区凤城二路天心大厦', '123456', '2019-01-27 19:53:12', '2019-01-27 19:53:12');
INSERT INTO `tb_lost` VALUES ('154859009886768', '5', '广东省广州市海珠区珠江南岸至尊披萨琶洲店北200米路东', '2019-01-23 00:00:00', '李先生丢失大疆无人机', '200  元', '本人不慎将一灰黑色方形包拉在广州市海珠区珠江南岸至尊披萨琶洲店往北路东200米处一共享单车栏内，包内有大疆无人机御2一部及相关配件，请捡到此包的好心人联系我,有重谢！联系电话189********', 'images/2019/01/27/621672548782276914.jpg', '1', '李先生', '13435423532', '66666', '45456475@qq.com', '陕西省西安市电信', '123456', '2019-01-27 19:54:59', '2019-01-27 19:54:59');
INSERT INTO `tb_lost` VALUES ('155014251353177', '1', '福建 > 厦门 > 夏门市鹭江道路口客运码头路口靠近斑马线附近', '2019-02-08 00:00:00', '丢失一小钱包咖啡色内装项链', '1000  元', '母亲于2019年2月8日大年初四早晨9时左右在鹭江道客运码头十字路口丢失一小钱包咖啡色内装项链一小包，因此母亲着急上火被紧急送医救治，望有爱心的男士捡到后归还母亲，定重谢！当时报案看了视频是一位男士弯腰捡到，望爱心归还，以解母之忧！谢谢！', null, '0', '姬女士', '1234123', '66666', '2124@qq.com', '浙江嘉兴秀洲区洪高路大成春天里8-2-1509', '123456', '2019-02-14 19:08:34', '2019-02-14 19:08:34');
INSERT INTO `tb_lost` VALUES ('155014258308778', '4', 'geresdfvgds', '2019-02-11 00:00:00', 'sdfgsdgs', null, '3强253245让4', null, '1', '已保密', '已保密', '已保密', '已保密', '已保密', '123456', '2019-02-14 19:09:43', '2019-02-14 19:09:43');
INSERT INTO `tb_lost` VALUES ('155014291853561', '6', 'werwesda', '2019-02-08 00:00:00', '2142342', null, 'ferferfsaf', null, '0', '已保密', '已保密', '已保密', '已保密', '已保密', '123456', '2019-02-14 19:15:19', '2019-02-14 19:15:19');
INSERT INTO `tb_lost` VALUES ('155015241205863', '6', '广东 > 东莞 > 黄江镇华诚小区附近的马路上', '2019-02-01 00:00:00', '急寻在黄江镇华诚小区路口那边丢失一个红色单肩包.', '2000  元', '急寻2019.2.1在东莞黄江镇华诚小区路口那边丢失一个红色单肩包.内有身份证毕业证银行卡，姓名 李玲珊，现金2000元，金饰品，希望找到的人可以归还，现金不要，有重赏，qq1148387622', null, '1', '李玲珊', '32134', '12533254', '1234@efw324', '湖南省郴州市移动', '123456', '2019-02-14 21:53:32', '2019-02-14 21:53:32');
INSERT INTO `tb_lost` VALUES ('155117471786043', '6', '广西 > 南宁 > 南宁市广西大学至民族大学路段', '2019-02-26 00:00:00', '黑背包瑞士军刀', '1000  元', '瑞士军刀黑色背包，里有本人身份证，驾驶证，行驶证，社保卡，银行卡，信用卡，车钥匙，锂电池逆变器，找到的请联系我谢谢，捡到原封不动，给1000', null, '0', '晨先生', '18697940250', 'dsferd', '234231@qq.com', '西乡塘', '123456', '2019-02-26 17:51:58', '2019-02-26 17:51:58');
INSERT INTO `tb_lost` VALUES ('155135325402358', '6', 'fdgre', '2019-02-19 00:00:00', 'dsgvs', 'kjhliu', 'trdghtrs', null, '1', 'retgerd', 'feserf', 'sfrse', 'htr@gregvfd', 'gtrdh', '123456', '2019-02-28 19:27:34', '2019-02-28 19:27:34');

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
  `status` int(1) NOT NULL COMMENT '状态：0/寻找中，1/已失效',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_textinfo
-- ----------------------------
INSERT INTO `tb_textinfo` VALUES ('1', '154752159872591', '2019-01-15 11:06:39', '58', '0', '2019-01-15 11:06:39', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('2', '154752221029729', '2019-01-15 11:16:50', '25', '0', '2019-01-15 11:16:50', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('4', '154752383719702', '2019-01-15 11:43:57', '29', '0', '2019-01-15 11:43:57', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('5', '154752432618431', '2019-01-15 11:52:06', '81', '0', '2019-01-15 11:52:06', '2019-02-14 19:26:33');
INSERT INTO `tb_textinfo` VALUES ('6', '154781351248543', '2019-01-18 20:11:52', '32', '0', '2019-01-18 20:11:52', '2019-02-28 10:31:33');
INSERT INTO `tb_textinfo` VALUES ('7', '154781364597976', '2019-01-18 20:14:06', '14', '0', '2019-01-18 20:14:06', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('8', '154781380741737', '2019-01-18 20:16:47', '90', '0', '2019-01-18 20:16:47', '2019-02-26 17:38:08');
INSERT INTO `tb_textinfo` VALUES ('9', '154781392231049', '2019-01-18 20:18:42', '87', '0', '2019-01-18 20:18:42', '2019-01-28 16:10:39');
INSERT INTO `tb_textinfo` VALUES ('18', '154858964259491', '2019-01-27 19:47:23', '0', '0', '2019-01-27 19:47:23', '2019-01-27 19:47:23');
INSERT INTO `tb_textinfo` VALUES ('19', '154858977146124', '2019-01-27 19:49:31', '13', '0', '2019-01-27 19:49:31', '2019-02-26 20:17:24');
INSERT INTO `tb_textinfo` VALUES ('20', '154858988208910', '2019-01-27 19:51:22', '3', '0', '2019-01-27 19:51:22', '2019-02-02 22:18:38');
INSERT INTO `tb_textinfo` VALUES ('21', '154858999172743', '2019-01-27 19:53:12', '1', '0', '2019-01-27 19:53:12', '2019-01-28 11:31:06');
INSERT INTO `tb_textinfo` VALUES ('22', '154859009886768', '2019-01-27 19:54:59', '5', '0', '2019-01-27 19:54:59', '2019-02-27 16:00:57');
INSERT INTO `tb_textinfo` VALUES ('23', '154859029628249', '2019-01-27 19:58:16', '2', '0', '2019-01-27 19:58:16', '2019-01-27 20:16:50');
INSERT INTO `tb_textinfo` VALUES ('24', '154859042291358', '2019-01-27 20:00:23', '1', '0', '2019-01-27 20:00:23', '2019-01-27 20:17:50');
INSERT INTO `tb_textinfo` VALUES ('25', '154859054097473', '2019-01-27 20:02:21', '5', '0', '2019-01-27 20:02:21', '2019-02-14 18:57:58');
INSERT INTO `tb_textinfo` VALUES ('26', '154859063562834', '2019-01-27 20:03:56', '3', '0', '2019-01-27 20:03:56', '2019-02-14 19:22:46');
INSERT INTO `tb_textinfo` VALUES ('27', '154859074815160', '2019-01-27 20:05:48', '0', '0', '2019-01-27 20:05:48', '2019-01-27 20:05:48');
INSERT INTO `tb_textinfo` VALUES ('28', '154859087790528', '2019-01-27 20:07:58', '1', '0', '2019-01-27 20:07:58', '2019-01-27 20:15:11');
INSERT INTO `tb_textinfo` VALUES ('29', '154859098696882', '2019-01-27 20:09:47', '5', '0', '2019-01-27 20:09:47', '2019-01-27 20:13:07');
INSERT INTO `tb_textinfo` VALUES ('34', '155014196786079', '2019-02-14 18:59:28', '5', '1', '2019-02-14 18:59:28', '2019-02-14 22:00:15');
INSERT INTO `tb_textinfo` VALUES ('35', '155014204225454', '2019-02-14 19:00:42', '0', '1', '2019-02-14 19:00:42', '2019-02-14 19:00:42');
INSERT INTO `tb_textinfo` VALUES ('36', '155014251353177', '2019-02-14 19:08:34', '2', '0', '2019-02-14 19:08:34', '2019-02-14 21:57:37');
INSERT INTO `tb_textinfo` VALUES ('37', '155014258308778', '2019-02-14 19:09:43', '5', '1', '2019-02-14 19:09:43', '2019-02-14 21:57:12');
INSERT INTO `tb_textinfo` VALUES ('38', '155014291853561', '2019-02-14 19:15:19', '4', '1', '2019-02-14 19:15:19', '2019-02-14 21:57:05');
INSERT INTO `tb_textinfo` VALUES ('39', '155015241205863', '2019-02-14 21:53:32', '2', '0', '2019-02-14 21:53:32', '2019-02-26 17:57:18');
INSERT INTO `tb_textinfo` VALUES ('40', '155117471786043', '2019-02-26 17:51:58', '5', '0', '2019-02-26 17:51:58', '2019-02-27 16:00:11');
INSERT INTO `tb_textinfo` VALUES ('41', '155117488493455', '2019-02-26 17:54:45', '2', '0', '2019-02-26 17:54:45', '2019-02-26 17:56:49');
INSERT INTO `tb_textinfo` VALUES ('42', '155125414704809', '2019-02-27 15:55:47', '1', '0', '2019-02-27 15:55:47', '2019-02-28 10:35:43');
INSERT INTO `tb_textinfo` VALUES ('44', '155132223957266', '2019-02-28 10:50:40', '0', '0', '2019-02-28 10:50:40', '2019-02-28 10:50:40');
INSERT INTO `tb_textinfo` VALUES ('45', '155132231837260', '2019-02-28 10:51:58', '0', '0', '2019-02-28 10:51:58', '2019-02-28 10:51:58');
INSERT INTO `tb_textinfo` VALUES ('46', '155135290568968', '2019-02-28 19:21:46', '0', '0', '2019-02-28 19:21:46', '2019-02-28 19:21:46');
INSERT INTO `tb_textinfo` VALUES ('47', '155135325402358', '2019-02-28 19:27:34', '0', '0', '2019-02-28 19:27:34', '2019-02-28 19:27:34');
INSERT INTO `tb_textinfo` VALUES ('48', '155135328848634', '2019-02-28 19:28:08', '0', '0', '2019-02-28 19:28:08', '2019-02-28 19:28:08');

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
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1', 'admin', '$2a$10$RLmS1dS5MDjyT3OmZ4W1z.tVWW2H/952e/8ZSZLcHG9ji6yalLKuS', '123456', '123@qq.com', '2018-12-13 21:36:10', '2019-02-26 17:34:28');
INSERT INTO `tb_users` VALUES ('2', 'user1', '654321', '654321', '654@qq.com', '2018-12-13 21:36:47', '2018-12-13 21:36:52');

-- ----------------------------
-- Event structure for change_text_status
-- ----------------------------
DROP EVENT IF EXISTS `change_text_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `change_text_status` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_textinfo SET status=1,updated=SYSDATE() WHERE publish_time NOT BETWEEN DATE_SUB(CURDATE(),INTERVAL 6 MONTH) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_comment_halfYear
-- ----------------------------
DROP EVENT IF EXISTS `delete_comment_halfYear`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_comment_halfYear` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_comment WHERE comment_time NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_found_sixMonth
-- ----------------------------
DROP EVENT IF EXISTS `delete_found_sixMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_found_sixMonth` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_found WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_lost_sixMonth
-- ----------------------------
DROP EVENT IF EXISTS `delete_lost_sixMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_lost_sixMonth` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_lost WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete_text_halfYear
-- ----------------------------
DROP EVENT IF EXISTS `delete_text_halfYear`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `delete_text_halfYear` ON SCHEDULE EVERY 7 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tb_textinfo WHERE publish_time NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 1 YEAR) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for update_found_threeMonth
-- ----------------------------
DROP EVENT IF EXISTS `update_found_threeMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_found_threeMonth` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_found SET contacts="已保密",tel="已保密",QQ="已保密",email="已保密",address="已保密" 
WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 6 MONTH) AND SYSDATE()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for update_lost_threeMonth
-- ----------------------------
DROP EVENT IF EXISTS `update_lost_threeMonth`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_lost_threeMonth` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-29 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_lost SET contacts="已保密",tel="已保密",QQ="已保密",email="已保密",address="已保密"
WHERE created NOT BETWEEN DATE_SUB(SYSDATE(),INTERVAL 6 MONTH) AND SYSDATE()
;;
DELIMITER ;
