/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : reggie

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 29/05/2023 17:11:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人',
  `sex` tinyint(4) NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1654777228318023682, 1654744865034850305, '彭于晏', 1, '13100001234', NULL, NULL, NULL, NULL, NULL, NULL, '江西省九江市共青城市江西信息应用职业技术学院', '学校', 1, '2023-05-06 17:16:50', '2023-05-10 21:56:49', 1654744865034850305, 1654744865034850305, 0);
INSERT INTO `address_book` VALUES (1654777508468170753, 1654744865034850305, '张婧仪', 0, '13112341234', NULL, NULL, NULL, NULL, NULL, NULL, '江西省萍乡市上栗县上栗镇', '家', 0, '2023-05-06 17:17:57', '2023-05-10 21:56:27', 1654744865034850305, 1654744865034850305, 0);
INSERT INTO `address_book` VALUES (1656951397690200065, 1655741458689122306, '佘颖欣', 1, '13899998888', NULL, NULL, NULL, NULL, NULL, NULL, '福建省厦门市', '家', 1, '2023-05-12 17:16:13', '2023-05-12 17:16:16', 1655741458689122306, 1655741458689122306, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1397844303408574465, 1, '川菜', 2, '2021-05-27 09:17:07', '2021-06-02 14:27:22', 1, 1);
INSERT INTO `category` VALUES (1397844391040167938, 1, '粤菜', 3, '2021-05-27 09:17:28', '2021-07-09 14:37:13', 1, 1);
INSERT INTO `category` VALUES (1413341197421846529, 1, '饮品', 11, '2021-07-09 11:36:15', '2021-07-09 14:39:15', 1, 1);
INSERT INTO `category` VALUES (1413384954989060097, 1, '主食', 12, '2021-07-09 14:30:07', '2021-07-09 14:39:19', 1, 1);
INSERT INTO `category` VALUES (1413386191767674881, 2, '儿童套餐', 6, '2021-07-09 14:35:02', '2021-07-09 14:39:05', 1, 1);
INSERT INTO `category` VALUES (1645783957874737154, 1, '赣菜', 4, '2023-04-11 21:40:47', '2023-04-11 21:40:47', 1, 1);
INSERT INTO `category` VALUES (1645788900811661314, 2, '超值午餐', 6, '2023-04-11 22:00:26', '2023-04-11 22:00:26', 1, 1);
INSERT INTO `category` VALUES (1645788940997287937, 2, '超值晚餐', 8, '2023-04-11 22:00:35', '2023-04-11 22:00:35', 1, 1);
INSERT INTO `category` VALUES (1645789015093862402, 1, '精品湘菜', 1, '2023-04-11 22:00:53', '2023-04-11 22:00:53', 1, 1);
INSERT INTO `category` VALUES (1645794763802767361, 1, '湘菜', 0, '2023-04-11 22:23:44', '2023-04-11 23:35:08', 1, 1);
INSERT INTO `category` VALUES (1645809898063736834, 2, '商务套餐', 18, '2023-04-11 23:23:52', '2023-04-11 23:23:52', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1397849739276890114, '辣子鸡', 1645794763802767361, 7800.00, '222222222', '0bca7dfd-b3cf-4863-ba8a-ab13d79d5e65.jpg', '来自鲜嫩美味的小鸡，值得一尝', 1, 0, '2021-05-27 09:38:43', '2023-04-24 21:57:22', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860578738352129, '白切鸡', 1397844391040167938, 6600.00, '12345678654', '8a3b0c4c-4189-42ba-8ac7-61f4759b1996.jpeg', '白切鸡是一道色香味俱全的特色传统名肴，又叫白斩鸡，是粤菜系鸡肴中的一种，始于清代的民间。白切鸡通常选用细骨农家鸡与沙姜、蒜茸等食材，慢火煮浸白切鸡皮爽肉滑，清淡鲜美。著名的泮溪酒家白切鸡，曾获商业部优质产品金鼎奖。湛江白切鸡更是驰名粤港澳。粤菜厨坛中，鸡的菜式有200余款之多，而最为人常食不厌的正是白切鸡，深受食家青睐。', 1, 0, '2021-05-27 10:21:48', '2023-05-09 11:03:18', 1, 1, 0);
INSERT INTO `dish` VALUES (1397861683434139649, '清蒸河鲜海鲜', 1397844391040167938, 13800.00, '1234567876543213456', 'ce6b78f1-a31c-45f7-8a9f-cade593aa917.jpg', '新鲜的海鲜，清蒸是最好的处理方式。鲜，体会为什么叫海鲜。清蒸是广州最经典的烹饪手法，过去岭南地区由于峻山大岭阻隔，交通不便，经济发展起步慢，自家打的鱼放在锅里煮了就吃，没有太多的讲究，但却发现这清淡的煮法能使鱼的鲜甜跃然舌尖。', 1, 0, '2021-05-27 10:26:11', '2023-04-24 21:56:52', 1, 1, 0);
INSERT INTO `dish` VALUES (1397862198033297410, '老火靓汤', 1397844391040167938, 9800.00, '123456786532455', '3bbf07c6-7d97-40d5-aba7-48653fa10c4a.jpeg', '老火靓汤又称广府汤，是广府人传承数千年的食补养生秘方，慢火煲煮的中华老火靓汤，火候足，时间长，既取药补之效，又取入口之甘甜。 广府老火汤种类繁多，可以用各种汤料和烹调方法，烹制出各种不同口味、不同功效的汤来。', 1, 0, '2021-05-27 10:28:14', '2023-04-24 21:56:35', 1, 1, 0);
INSERT INTO `dish` VALUES (1397862477831122945, '上汤焗龙虾', 1397844391040167938, 108.00, '1234567865432', 'edf91f7f-65ec-4b87-91df-efd4b5fda9f2.jpeg', '上汤焗龙虾是一道色香味俱全的传统名菜，属于粤菜系。此菜以龙虾为主料，配以高汤制成的一道海鲜美食。本品肉质洁白细嫩，味道鲜美，蛋白质含量高，脂肪含量低，营养丰富。是色香味俱全的传统名菜。', 1, 0, '2021-05-27 10:29:20', '2023-04-24 21:56:07', 1, 1, 0);
INSERT INTO `dish` VALUES (1413342036832100354, '北冰洋', 1413341197421846529, 500.00, '', '964fb370-aa8f-40e0-ade7-ef06316f358f.png', '', 1, 0, '2021-07-09 11:39:35', '2023-04-24 21:55:25', 1, 1, 0);
INSERT INTO `dish` VALUES (1413384757047271425, '王老吉', 1413341197421846529, 600.00, '', 'ada19b1a-7039-4d65-80b2-c2a021f8520c.png', '怕上火？就喝王老吉！', 1, 0, '2021-07-09 14:29:20', '2023-05-27 17:10:36', 1, 1, 0);
INSERT INTO `dish` VALUES (1413385247889891330, '米饭', 1413384954989060097, 200.00, '', 'd85138f8-2240-4268-a9a5-e2e9b65b2eec.png', '', 1, 0, '2021-07-09 14:31:17', '2023-04-24 21:55:15', 1, 1, 0);
INSERT INTO `dish` VALUES (1646165018144206850, '宫保鸡丁', 1645789015093862402, 6800.00, '', '7da90638-64e5-477b-9f73-06794fdf271e.jpg', '宫保鸡丁！！', 1, 0, '2023-04-12 22:54:59', '2023-04-24 21:02:54', 1, 1, 0);
INSERT INTO `dish` VALUES (1650497486544543746, '萍乡烟熏肉', 1645783957874737154, 4500.00, '', '341d9143-0cef-43cc-9ca5-5407cce4d67b.jpg', '萍乡腊肉堪称一绝，易经上就有\"晞于阳而炀于火，曰腊肉\"的记载。', 1, 0, '2023-04-24 21:50:40', '2023-04-24 21:50:40', 1, 1, 0);
INSERT INTO `dish` VALUES (1650497809703084034, '莲花血鸭', 1645783957874737154, 8800.00, '', '7163cc6b-4e4c-4c4f-91e7-ef0cdc724179.jpg', '莲花血鸭因具有“色美味香、鲜嫩可口”的特点而被列入“十大赣菜”之一。 ', 1, 0, '2023-04-24 21:51:57', '2023-04-24 21:51:57', 1, 1, 0);
INSERT INTO `dish` VALUES (1655765082317856770, '香辣小龙虾', 1645789015093862402, 8800.00, '', 'c755d120-bbed-4739-9031-ffbdb8c508c1.jpg', '香辣小龙虾', 1, 0, '2023-05-09 10:42:13', '2023-05-09 10:42:13', 1, 1, 0);
INSERT INTO `dish` VALUES (1655765217085038593, '福鼎肉片', 1397844391040167938, 6800.00, '', 'e61aec09-928b-4f9f-9070-81446684bd08.jpg', '福鼎肉片', 1, 0, '2023-05-09 10:42:45', '2023-05-09 10:42:45', 1, 1, 0);
INSERT INTO `dish` VALUES (1655765353261506562, '肉蟹煲', 1645789015093862402, 12800.00, '', '9be0eb94-620c-4b87-914a-4a62ca80df61.jpg', '肉蟹煲', 1, 0, '2023-05-09 10:43:18', '2023-05-09 11:03:03', 1, 1, 0);
INSERT INTO `dish` VALUES (1655765498719969281, '鸭头', 1645789015093862402, 6800.00, '', 'f39a4f75-fca4-4eab-b749-9fee83c80dcc.jpg', '鸭头', 1, 0, '2023-05-09 10:43:52', '2023-05-09 10:43:52', 1, 1, 0);
INSERT INTO `dish` VALUES (1655766235789205506, '鱼香肉丝', 1397844303408574465, 8800.00, '', 'ea47e9b9-cadc-4fe0-85e6-515d9b1bd227.jpg', '鱼香肉丝', 1, 0, '2023-05-09 10:46:48', '2023-05-09 10:46:48', 1, 1, 0);
INSERT INTO `dish` VALUES (1655766314231078914, '麻婆豆腐', 1397844303408574465, 6800.00, '', '8c4d119d-ef70-49cb-9653-e4e1f3ee6d97.jpg', '麻婆豆腐', 1, 0, '2023-05-09 10:47:07', '2023-05-09 10:47:07', 1, 1, 0);
INSERT INTO `dish` VALUES (1655870059813900289, '辣椒炒肉', 1645789015093862402, 6800.00, '', '2f76bc21-d878-43f8-a5d5-dd5e4c17f458.jpg', '辣椒炒肉', 1, 0, '2023-05-09 17:39:21', '2023-05-09 17:39:21', 1, 1, 0);
INSERT INTO `dish` VALUES (1662371372143792130, '冰红茶', 1413341197421846529, 500.00, '', 'f0794f05-ac9c-4fb9-8120-e460b3827397.jpg', '冰红茶', 1, 0, '2023-05-27 16:13:15', '2023-05-27 17:10:59', 1, 1, 0);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1397849417888346113, 1397849417854791681, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849739297861633, 1397849739276890114, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-04-24 21:57:22', '2023-04-24 21:57:22', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849739323027458, 1397849739276890114, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-04-24 21:57:22', '2023-04-24 21:57:22', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849936421761025, 1397849936404983809, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849936438538241, 1397849936404983809, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850141015715841, 1397850140982161409, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850141040881665, 1397850140982161409, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850392120307713, 1397850392090947585, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850392137084929, 1397850392090947585, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850630734262274, 1397850630700707841, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850630755233794, 1397850630700707841, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850851274960898, 1397850851245600769, '忌口', '[\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850851283349505, 1397850851245600769, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851099523231745, 1397851099502260226, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851099527426050, 1397851099502260226, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658754, 1397851370462687234, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658755, 1397851370462687234, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658756, 1397851370462687234, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851668283437058, 1397851668262465537, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397852391180120065, 1397852391150759938, '忌口', '[\"不要葱\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397852391196897281, 1397852391150759938, '辣度', '[\"不辣\",\"微辣\",\"重辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853183307984898, 1397853183287013378, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853423486414850, 1397853423461249026, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853709126905857, 1397853709101740034, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853890283089922, 1397853890262118402, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854133632413697, 1397854133603053569, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854652623007745, 1397854652581064706, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854652635590658, 1397854652581064706, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854865735593986, 1397854865672679425, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397855742303186946, 1397855742273826817, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397855906497605633, 1397855906468245506, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397856190573621250, 1397856190540066818, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859056709316609, 1397859056684150785, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859277837217794, 1397859277812051969, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859487502086146, 1397859487476920321, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859757061615618, 1397859757036449794, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397860242086735874, 1397860242057375745, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397860963918065665, 1397860963880316929, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861135754506242, 1397861135733534722, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861370035744769, 1397861370010578945, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861683459305474, 1397861683434139649, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-04-24 21:56:52', '2023-04-24 21:56:52', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861898467717121, 1397861898438356993, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397862198054268929, 1397862198033297410, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-04-24 21:56:35', '2023-04-24 21:56:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397862477835317250, 1397862477831122945, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2023-04-24 21:56:07', '2023-04-24 21:56:07', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398089545865015297, 1398089545676271617, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398089782323097601, 1398089782285348866, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090003262255106, 1398090003228700673, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090264554811394, 1398090264517062657, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090455399837698, 1398090455324340225, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090685449023490, 1398090685419663362, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090825358422017, 1398090825329061889, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091007051476993, 1398091007017922561, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091296164851713, 1398091296131297281, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091546531246081, 1398091546480914433, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091729809747969, 1398091729788776450, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091889499484161, 1398091889449152513, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398092095179763713, 1398092095142014978, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398092283877306370, 1398092283847946241, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398094018939236354, 1398094018893099009, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398094391494094850, 1398094391456346113, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1399574026165727233, 1399305325713600514, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', 1399309715396669441, 1399309715396669441, 0);
INSERT INTO `dish_flavor` VALUES (1413389540592263169, 1413384757047271425, '温度', '[\"常温\",\"冷藏\"]', '2023-05-27 17:10:36', '2023-05-27 17:10:36', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1413389684020682754, 1413342036832100354, '温度', '[\"常温\",\"冷藏\"]', '2023-04-24 21:55:25', '2023-04-24 21:55:25', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646165018274230273, 1646165018144206850, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-04-18 22:24:25', '2023-04-18 22:24:25', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1646165018337144833, 1646165018144206850, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-04-18 22:24:25', '2023-04-18 22:24:25', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1648331651814060034, 1646165018144206850, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-04-18 22:24:25', '2023-04-18 22:24:25', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1650497486682955778, 1650497486544543746, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-04-24 21:50:40', '2023-04-24 21:50:40', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1650497809703084035, 1650497809703084034, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2023-04-24 21:51:57', '2023-04-24 21:51:57', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1650497809703084036, 1650497809703084034, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-04-24 21:51:57', '2023-04-24 21:51:57', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655765082317856771, 1655765082317856770, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-05-09 10:42:13', '2023-05-09 10:42:13', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655765082317856772, 1655765082317856770, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-05-09 10:42:13', '2023-05-09 10:42:13', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655765217085038594, 1655765217085038593, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-05-09 10:42:45', '2023-05-09 10:42:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655765217085038595, 1655765217085038593, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-05-09 10:42:45', '2023-05-09 10:42:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655765498719969282, 1655765498719969281, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-05-09 10:43:52', '2023-05-09 10:43:52', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655765498719969283, 1655765498719969281, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-05-09 10:43:52', '2023-05-09 10:43:52', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655766235789205507, 1655766235789205506, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-05-09 10:46:48', '2023-05-09 10:46:48', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655766314231078915, 1655766314231078914, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-05-09 10:47:07', '2023-05-09 10:47:07', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655766314231078916, 1655766314231078914, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-05-09 10:47:07', '2023-05-09 10:47:07', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655770324962902017, 1655765353261506562, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-05-09 11:03:03', '2023-05-09 11:03:03', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655770388066205697, 1397860578738352129, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-05-09 11:03:18', '2023-05-09 11:03:18', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655770388066205698, 1397860578738352129, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2023-05-09 11:03:18', '2023-05-09 11:03:18', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1655870059813900290, 1655870059813900289, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2023-05-09 17:39:21', '2023-05-09 17:39:21', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1662371372143792131, 1662371372143792130, '温度', '[\"常温\",\"多冰\"]', '2023-05-27 17:10:59', '2023-05-27 17:10:59', 1, 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2021-05-10 02:24:09', 1, 1);
INSERT INTO `employee` VALUES (1643614986702422018, '张三', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13011112222', '1', '111222333444555666', 1, '2023-04-05 22:02:04', '2023-04-05 22:02:04', 1, 1);
INSERT INTO `employee` VALUES (1643619105953591298, '李四', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '13100001234', '1', '111222333444555666', 1, '2023-04-05 22:18:26', '2023-04-05 22:18:26', 1, 1);
INSERT INTO `employee` VALUES (1643810877524979714, '张小明', 'xiaoming', 'e10adc3949ba59abbe56e057f20f883e', '13800001111', '1', '111222333444555666', 1, '2023-04-06 11:00:28', '2023-04-11 15:42:13', 1, 1);
INSERT INTO `employee` VALUES (1645695976954449921, '小李', 'test001', 'e10adc3949ba59abbe56e057f20f883e', '13100005555', '1', '111222333444555666', 1, '2023-04-11 15:51:11', '2023-04-11 16:16:41', 1, 1);
INSERT INTO `employee` VALUES (1645702533708529666, 'test', 'test', 'e10adc3949ba59abbe56e057f20f883e', '13112312312', '1', '111222333444555666', 1, '2023-04-11 16:17:14', '2023-04-11 16:17:14', 1, 1);
INSERT INTO `employee` VALUES (1645703146475372545, 'test2', 'test2', 'e10adc3949ba59abbe56e057f20f883e', '13145343411', '1', '111222333444555666', 0, '2023-04-11 16:19:40', '2023-04-24 17:00:31', 1643614986702422018, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1656203934211780611, '辣子鸡', '0bca7dfd-b3cf-4863-ba8a-ab13d79d5e65.jpg', 1656203934211780609, 1397849739276890114, NULL, '不要蒜,中辣', 1, 78.00);
INSERT INTO `order_detail` VALUES (1656203934211780612, '北冰洋', '964fb370-aa8f-40e0-ade7-ef06316f358f.png', 1656203934211780609, 1413342036832100354, NULL, '冷藏', 2, 5.00);
INSERT INTO `order_detail` VALUES (1656203934211780613, '米饭', 'd85138f8-2240-4268-a9a5-e2e9b65b2eec.png', 1656203934211780609, 1413385247889891330, NULL, NULL, 2, 2.00);
INSERT INTO `order_detail` VALUES (1656291937586081796, '辣椒炒肉', '2f76bc21-d878-43f8-a5d5-dd5e4c17f458.jpg', 1656291937586081794, 1655870059813900289, NULL, '中辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (1656291937648996353, '麻婆豆腐', '8c4d119d-ef70-49cb-9653-e4e1f3ee6d97.jpg', 1656291937586081794, 1655766314231078914, NULL, '无糖,中辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (1656291937648996354, '老火靓汤', '3bbf07c6-7d97-40d5-aba7-48653fa10c4a.jpeg', 1656291937586081794, 1397862198033297410, NULL, '不要蒜', 1, 98.00);
INSERT INTO `order_detail` VALUES (1656291937648996355, '米饭', 'd85138f8-2240-4268-a9a5-e2e9b65b2eec.png', 1656291937586081794, 1413385247889891330, NULL, NULL, 6, 2.00);
INSERT INTO `order_detail` VALUES (1656291937648996356, '王老吉', 'ada19b1a-7039-4d65-80b2-c2a021f8520c.png', 1656291937586081794, 1413384757047271425, NULL, '冷藏', 6, 5.00);
INSERT INTO `order_detail` VALUES (1656292127571275780, '白切鸡', '8a3b0c4c-4189-42ba-8ac7-61f4759b1996.jpeg', 1656292127571275778, 1397860578738352129, NULL, '无糖,常温', 1, 66.00);
INSERT INTO `order_detail` VALUES (1656292127571275781, '米饭', 'd85138f8-2240-4268-a9a5-e2e9b65b2eec.png', 1656292127571275778, 1413385247889891330, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (1656951486336815106, '麻婆豆腐', '8c4d119d-ef70-49cb-9653-e4e1f3ee6d97.jpg', 1656951486273900546, 1655766314231078914, NULL, '无糖,中辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (1656951486336815107, '莲花血鸭', '7163cc6b-4e4c-4c4f-91e7-ef0cdc724179.jpg', 1656951486273900546, 1650497809703084034, NULL, '不要蒜,中辣', 1, 88.00);
INSERT INTO `order_detail` VALUES (1656958947735187458, '辣子鸡', '0bca7dfd-b3cf-4863-ba8a-ab13d79d5e65.jpg', 1656958947693244418, 1397849739276890114, NULL, '不要蒜,中辣', 1, 78.00);
INSERT INTO `order_detail` VALUES (1656958947735187459, '辣椒炒肉', '2f76bc21-d878-43f8-a5d5-dd5e4c17f458.jpg', 1656958947693244418, 1655870059813900289, NULL, '中辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (1656958947735187460, '香辣小龙虾', 'c755d120-bbed-4739-9031-ffbdb8c508c1.jpg', 1656958947693244418, 1655765082317856770, NULL, '中辣,无糖', 1, 88.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1656203934211780610, '1656203934211780609', 4, 1654744865034850305, 1654777228318023682, '2023-05-10 15:46:03', '2023-05-10 15:46:03', 1, 92.00, 'Hello，第一个订单', '13100001234', '江西省九江市共青城市江西信息应用职业技术学院', NULL, '彭于晏');
INSERT INTO `orders` VALUES (1656291937586081795, '1656291937586081794', 3, 1654744865034850305, 1654777508468170753, '2023-05-10 21:35:45', '2023-05-10 21:35:45', 1, 276.00, 'Hi，第二笔订单', '13112341234', '江西省萍乡市上栗县上栗镇', NULL, '张婧仪');
INSERT INTO `orders` VALUES (1656292127571275779, '1656292127571275778', 2, 1654744865034850305, 1654777508468170753, '2023-05-10 21:36:30', '2023-05-10 21:36:30', 1, 68.00, '', '13112341234', '江西省萍乡市上栗县上栗镇', NULL, '张婧仪');
INSERT INTO `orders` VALUES (1656951486336815105, '1656951486273900546', 2, 1655741458689122306, 1656951397690200065, '2023-05-12 17:16:34', '2023-05-12 17:16:34', 1, 156.00, '杀猪饲料', '13899998888', '福建省厦门市', NULL, '佘颖欣');
INSERT INTO `orders` VALUES (1656958947693244419, '1656958947693244418', 2, 1654744865034850305, 1654777228318023682, '2023-05-12 17:46:13', '2023-05-12 17:46:13', 1, 234.00, '', '13100001234', '江西省九江市共青城市江西信息应用职业技术学院', NULL, '彭于晏');

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1650506038096990209, 1645809898063736834, '商务套餐A计划', 4800.00, 1, '', '高端商务套餐', 'f2473d82-0e13-42b9-9be2-9531499d12cf.jpg', '2023-04-24 22:24:39', '2023-04-26 09:56:23', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1650674916045725698, 1645788900811661314, '聚会午餐套餐', 34800.00, 1, '', '聚会午餐套餐', '469f7792-a742-4ffa-a1b8-6ca9c79dca2f.jpg', '2023-04-25 09:35:43', '2023-04-26 09:56:23', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1650675268925104130, 1645788940997287937, '聚会晚餐', 19800.00, 1, '', '聚会晚餐', '92239972-7463-4aa4-aa26-50018bb9f61f.jpg', '2023-04-25 09:37:07', '2023-04-26 09:56:23', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1651043169716727810, 1413386191767674881, '儿童套餐A计划', 6800.00, 1, '', '儿童套餐A计划', '7bc296de-1a0e-40af-a1ed-fbb698aee295.jpg', '2023-04-26 09:59:01', '2023-04-27 22:55:54', 1, 1, 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int(11) NOT NULL COMMENT '份数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1650506038096990210, '1650506038096990209', '1650497486544543746', '萍乡烟熏肉', 4500.00, 1, 0, '2023-04-24 22:24:39', '2023-04-24 22:24:39', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650506038096990211, '1650506038096990209', '1413342036832100354', '北冰洋', 500.00, 1, 0, '2023-04-24 22:24:39', '2023-04-24 22:24:39', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650506038096990212, '1650506038096990209', '1413385247889891330', '米饭', 200.00, 2, 0, '2023-04-24 22:24:39', '2023-04-24 22:24:39', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725699, '1650674916045725698', '1646165018144206850', '宫保鸡丁', 6800.00, 1, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725700, '1650674916045725698', '1650497809703084034', '莲花血鸭', 8800.00, 1, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725701, '1650674916045725698', '1397853890262118402', '鱼香肉丝', 3800.00, 1, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725702, '1650674916045725698', '1397862198033297410', '老火靓汤', 49800.00, 1, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725703, '1650674916045725698', '1413342036832100354', '北冰洋', 500.00, 6, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725704, '1650674916045725698', '1413384757047271425', '王老吉', 500.00, 6, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650674916045725705, '1650674916045725698', '1413385247889891330', '米饭', 200.00, 12, 0, '2023-04-25 09:35:43', '2023-04-25 09:35:43', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650675268925104131, '1650675268925104130', '1397851099502260226', '全家福', 11800.00, 1, 0, '2023-04-25 09:37:07', '2023-04-25 09:37:07', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650675268925104132, '1650675268925104130', '1413384757047271425', '王老吉', 500.00, 2, 0, '2023-04-25 09:37:07', '2023-04-25 09:37:07', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650675268925104133, '1650675268925104130', '1413385247889891330', '米饭', 200.00, 4, 0, '2023-04-25 09:37:07', '2023-04-25 09:37:07', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1650675268925104134, '1650675268925104130', '1397862198033297410', '老火靓汤', 9800.00, 1, 0, '2023-04-25 09:37:07', '2023-04-25 09:37:07', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1651601066919809026, '1651043169716727810', '1413384757047271425', '王老吉', 500.00, 1, 0, '2023-04-27 22:55:54', '2023-04-27 22:55:54', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1651601066919809027, '1651043169716727810', '1413385247889891330', '米饭', 200.00, 1, 0, '2023-04-27 22:55:54', '2023-04-27 22:55:54', 1, 1, 0);
INSERT INTO `setmeal_dish` VALUES (1651601066919809028, '1651043169716727810', '1646165018144206850', '宫保鸡丁', 6800.00, 1, 0, '2023-04-27 22:55:54', '2023-04-27 22:55:54', 1, 1, 0);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1656973667238158337, '辣子鸡', '0bca7dfd-b3cf-4863-ba8a-ab13d79d5e65.jpg', 1654744865034850305, 1397849739276890114, NULL, '不要蒜,中辣', 1, 78.00, NULL);
INSERT INTO `shopping_cart` VALUES (1656973667238158338, '北冰洋', '964fb370-aa8f-40e0-ade7-ef06316f358f.png', 1654744865034850305, 1413342036832100354, NULL, '冷藏', 2, 5.00, NULL);
INSERT INTO `shopping_cart` VALUES (1656973667305267201, '米饭', 'd85138f8-2240-4268-a9a5-e2e9b65b2eec.png', 1654744865034850305, 1413385247889891330, NULL, NULL, 2, 2.00, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1654744865034850305, NULL, '13100001234', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1655741458689122306, NULL, '19100001234', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1656971895216021505, NULL, '13112341234', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1662370441910079490, NULL, '13012341234', NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
