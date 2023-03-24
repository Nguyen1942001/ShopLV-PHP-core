/*
 Navicat Premium Data Transfer

 Source Server         : MariaDBConnection
 Source Server Type    : MariaDB
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : web

 Target Server Type    : MariaDB
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 01/07/2022 19:20:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 'view_product', 'Hiển thị danh sách sản phẩm');
INSERT INTO `action` VALUES (2, 'add_product', 'Thêm sản phẩm');
INSERT INTO `action` VALUES (3, 'edit_product', 'Cập nhật sản phẩm');
INSERT INTO `action` VALUES (4, 'delete_product', 'Xóa sản phẩm');
INSERT INTO `action` VALUES (5, 'view_staff', 'Hiển thị danh sách nhân viên');
INSERT INTO `action` VALUES (6, 'add_staff', 'Tạo nhân viên');
INSERT INTO `action` VALUES (7, 'edit_staff', 'Cập nhật nhân viên');
INSERT INTO `action` VALUES (8, 'delete_staff', 'Xóa nhân viên');
INSERT INTO `action` VALUES (9, 'view_order', 'Hiển thị danh sách đơn hàng');
INSERT INTO `action` VALUES (10, 'add_order', 'Thêm đơn hàng');
INSERT INTO `action` VALUES (11, 'edit_order', 'Cập nhật đơn hàng');
INSERT INTO `action` VALUES (12, 'delete_order', 'Xóa đơn hàng');
INSERT INTO `action` VALUES (13, 'view_customer', 'Hiển thị danh sách khách hàng');
INSERT INTO `action` VALUES (14, 'add_customer', 'Thêm khách hàng');
INSERT INTO `action` VALUES (15, 'edit_customer', 'Cập nhật khách hàng');
INSERT INTO `action` VALUES (16, 'delete_customer', 'Xóa khách hàng');
INSERT INTO `action` VALUES (17, 'view_category', 'Hiển thị danh sách danh mục');
INSERT INTO `action` VALUES (18, 'add_category', 'Thêm danh mục');
INSERT INTO `action` VALUES (19, 'edit_category', 'Cập nhật danh mục');
INSERT INTO `action` VALUES (20, 'delete_category', 'Xóa danh mục');
INSERT INTO `action` VALUES (21, 'view_transport', 'Hiển thị danh sách phí giao hàng');
INSERT INTO `action` VALUES (22, 'add_transport', 'Thêm phí giao hàng');
INSERT INTO `action` VALUES (23, 'edit_transport', 'Cập nhật phí giao hàng');
INSERT INTO `action` VALUES (24, 'delete_transport', 'Xóa phí giao hàng');
INSERT INTO `action` VALUES (25, 'view_brand', 'Hiển thị danh sách nhãn hàng');
INSERT INTO `action` VALUES (26, 'add_brand', 'Thêm nhãn hàng');
INSERT INTO `action` VALUES (27, 'edit_brand', 'Cập nhật nhãn hàng');
INSERT INTO `action` VALUES (28, 'delete_brand', 'Xóa nhãn hàng');
INSERT INTO `action` VALUES (29, 'view_staff', 'Hiển thị danh sách nhân viên');
INSERT INTO `action` VALUES (30, 'add_staff', 'Thêm nhân viên');
INSERT INTO `action` VALUES (31, 'edit_staff', 'Cập nhật nhân viên');
INSERT INTO `action` VALUES (32, 'delete_staff', 'Xóa nhân viên');
INSERT INTO `action` VALUES (33, 'view_status', 'Hiển thị danh sách trạng thái đơn hàng');
INSERT INTO `action` VALUES (34, 'add_status', 'Thêm trạng thái đơn hàng');
INSERT INTO `action` VALUES (35, 'edit_status', 'Cập nhật trạng thái đơn hàng');
INSERT INTO `action` VALUES (36, 'delete_status', 'Xóa trạng thái đơn hàng');
INSERT INTO `action` VALUES (37, 'view_newsletter', 'Hiển thị danh sách newsletter');
INSERT INTO `action` VALUES (38, 'add_newsletter', 'Thêm newsletter');
INSERT INTO `action` VALUES (39, 'edit_newsletter', 'Cập nhật newsletter');
INSERT INTO `action` VALUES (40, 'delete_newsletter', 'Xóa newsletter');
INSERT INTO `action` VALUES (41, 'view_permission', 'Hiển thị danh sách quyền');
INSERT INTO `action` VALUES (42, 'add_permission', 'Thêm quyền');
INSERT INTO `action` VALUES (43, 'edit_permission', 'Cập nhật quyền');
INSERT INTO `action` VALUES (44, 'delete_permission', 'Xóa quyền');
INSERT INTO `action` VALUES (45, 'view_comment', 'Hiển thị danh sách đánh giá');
INSERT INTO `action` VALUES (46, 'add_comment', 'Thêm đánh giá');
INSERT INTO `action` VALUES (47, 'edit_comment', 'Cập nhật đánh giá');
INSERT INTO `action` VALUES (48, 'delete_comment', 'Xóa đánh giá');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Trang Phục');
INSERT INTO `category` VALUES (2, 'Túi Xách');
INSERT INTO `category` VALUES (3, 'Trang Sức');
INSERT INTO `category` VALUES (4, 'Giày');
INSERT INTO `category` VALUES (5, 'Đồng Hồ');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FULLNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATED_DATE` datetime(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (7, 1, 'khoinguyen1942001@gmail.com', 'Nguyễn Đình Khôi Nguyên', '2022-06-17 11:08:28', 'Test 1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOGIN_BY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MOBILE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_ACTIVE` int(1) NOT NULL DEFAULT 0 COMMENT '1 = Active, 0 = Chưa Active',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (8, 'Nguyễn Đình Khôi Nguyên', '$2y$10$QkfgOhFPHj2szFVrPvhKRe2AisZfmypuO2GwHYd3vG/4XP0KOM2F6', 'khoinguyen1942001@gmail.com', 'form', '0333232451', '65/22 Phan Sào Nam, phường 11, quận Tân Bình, TPHCM', 1);
INSERT INTO `customer` VALUES (9, 'Tiến Đức', '', 'louisdeptrai1904@gmail.com', 'google', '0904081327', 'Bitexco', 1);
INSERT INTO `customer` VALUES (11, 'Nguyễn Đình Khôi Nguyên', '', 'khoinguyen190401@gmail.com', 'facebook', '', '', 1);
INSERT INTO `customer` VALUES (12, 'Khách Vãng Lai', '', 'khachvanglai@gmail.com', '', '', NULL, 0);
INSERT INTO `customer` VALUES (13, 'Đoàn Thảo Vy', '123456', 'doanvy05062001@gmail.com', 'form', '0904836501', 'TPHCM', 0);
INSERT INTO `customer` VALUES (16, 'Gia Bảo', '$2y$10$vAh4Icf4YcvkuMeMYwBEXOOx03t78rMMVqE.AbwoNy5qN0fFFgFtG', 'giabao@gmail.com', 'form', '0123456789', 'Tân Bình', 1);

-- ----------------------------
-- Table structure for image_item
-- ----------------------------
DROP TABLE IF EXISTS `image_item`;
CREATE TABLE `image_item`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_item
-- ----------------------------
INSERT INTO `image_item` VALUES (0, 0, '');
INSERT INTO `image_item` VALUES (1, 1, '2.jpg');
INSERT INTO `image_item` VALUES (2, 1, '3.jpg');
INSERT INTO `image_item` VALUES (3, 1, '4.jpg');
INSERT INTO `image_item` VALUES (4, 2, '2.jpg');
INSERT INTO `image_item` VALUES (5, 3, '2.jpg');
INSERT INTO `image_item` VALUES (6, 4, '2.jpg');
INSERT INTO `image_item` VALUES (7, 4, '3.jpg');
INSERT INTO `image_item` VALUES (8, 4, '4.jpg');
INSERT INTO `image_item` VALUES (9, 4, '5.jpg');
INSERT INTO `image_item` VALUES (10, 5, '2.jpg');
INSERT INTO `image_item` VALUES (11, 5, '3.jpg');
INSERT INTO `image_item` VALUES (12, 6, '2.jpg');
INSERT INTO `image_item` VALUES (13, 6, '3.jpg');
INSERT INTO `image_item` VALUES (14, 8, '2.jpg');
INSERT INTO `image_item` VALUES (15, 8, '3.jpg');
INSERT INTO `image_item` VALUES (16, 8, '4.jpg');
INSERT INTO `image_item` VALUES (17, 9, '2.jpg');
INSERT INTO `image_item` VALUES (18, 9, '3.jpg');
INSERT INTO `image_item` VALUES (19, 10, '2.jpg');
INSERT INTO `image_item` VALUES (20, 10, '3.jpg');
INSERT INTO `image_item` VALUES (21, 10, '4.jpg');
INSERT INTO `image_item` VALUES (22, 11, '2.jpg');
INSERT INTO `image_item` VALUES (23, 11, '3.jpg');
INSERT INTO `image_item` VALUES (24, 11, '4.jpg');
INSERT INTO `image_item` VALUES (25, 11, '5.jpg');
INSERT INTO `image_item` VALUES (26, 12, '2.jpg');
INSERT INTO `image_item` VALUES (27, 12, '3.jpg');
INSERT INTO `image_item` VALUES (28, 12, '4.jpg');
INSERT INTO `image_item` VALUES (29, 12, '5.jpg');
INSERT INTO `image_item` VALUES (30, 13, '2.jpg');
INSERT INTO `image_item` VALUES (31, 13, '3.jpg');
INSERT INTO `image_item` VALUES (32, 13, '4.jpg');
INSERT INTO `image_item` VALUES (33, 14, '2.jpg');
INSERT INTO `image_item` VALUES (34, 14, '3.jpg');
INSERT INTO `image_item` VALUES (35, 14, '4.jpg');
INSERT INTO `image_item` VALUES (36, 15, '2.jpg');
INSERT INTO `image_item` VALUES (37, 15, '3.jpg');
INSERT INTO `image_item` VALUES (38, 15, '4.jpg');
INSERT INTO `image_item` VALUES (39, 16, '2.jpg');
INSERT INTO `image_item` VALUES (40, 16, '3.jpg');
INSERT INTO `image_item` VALUES (41, 16, '4.jpg');
INSERT INTO `image_item` VALUES (42, 16, '5.jpg');
INSERT INTO `image_item` VALUES (43, 17, '2.jpg');
INSERT INTO `image_item` VALUES (44, 17, '3.jpg');
INSERT INTO `image_item` VALUES (45, 17, '4.jpg');
INSERT INTO `image_item` VALUES (46, 17, '5.jpg');
INSERT INTO `image_item` VALUES (47, 18, '2.jpg');
INSERT INTO `image_item` VALUES (48, 18, '3.jpg');
INSERT INTO `image_item` VALUES (49, 18, '4.jpg');
INSERT INTO `image_item` VALUES (50, 18, '5.jpg');
INSERT INTO `image_item` VALUES (51, 19, '2.jpg');
INSERT INTO `image_item` VALUES (52, 20, '2.jpg');
INSERT INTO `image_item` VALUES (53, 20, '3.jpg');
INSERT INTO `image_item` VALUES (54, 21, '2.jpg');
INSERT INTO `image_item` VALUES (55, 21, '3.jpg');
INSERT INTO `image_item` VALUES (56, 21, '4.jpg');
INSERT INTO `image_item` VALUES (57, 22, '2.jpg');
INSERT INTO `image_item` VALUES (58, 22, '3.jpg');
INSERT INTO `image_item` VALUES (59, 23, '1.jpg');
INSERT INTO `image_item` VALUES (60, 24, '2.jpg');
INSERT INTO `image_item` VALUES (61, 24, '3.jpg');
INSERT INTO `image_item` VALUES (62, 25, '2.jpg');
INSERT INTO `image_item` VALUES (63, 25, '3.jpg');
INSERT INTO `image_item` VALUES (64, 25, '4.jpg');
INSERT INTO `image_item` VALUES (65, 25, '5.jpg');
INSERT INTO `image_item` VALUES (69, 34, '2.jpg');
INSERT INTO `image_item` VALUES (70, 34, '1.jpg');

-- ----------------------------
-- Table structure for newsletter
-- ----------------------------
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter`  (
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newsletter
-- ----------------------------
INSERT INTO `newsletter` VALUES ('a10@gmail.com');
INSERT INTO `newsletter` VALUES ('a11@gmail.com');
INSERT INTO `newsletter` VALUES ('a12@gmail.com');
INSERT INTO `newsletter` VALUES ('a13@gmail.com');
INSERT INTO `newsletter` VALUES ('a1@gmail.com');
INSERT INTO `newsletter` VALUES ('a2@gmail.com');
INSERT INTO `newsletter` VALUES ('a3@gmail.com');
INSERT INTO `newsletter` VALUES ('a4@gmail.com');
INSERT INTO `newsletter` VALUES ('a5@gmail.com');
INSERT INTO `newsletter` VALUES ('a6@gmail.com');
INSERT INTO `newsletter` VALUES ('a7@gmail.com');
INSERT INTO `newsletter` VALUES ('a8@gmail.com');
INSERT INTO `newsletter` VALUES ('a9@gmail.com');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_DATE` datetime(0) NOT NULL,
  `ORDER_STATUS_ID` int(2) NOT NULL,
  `STAFF_ID` int(10) NULL DEFAULT NULL,
  `CUSTOMER_ID` int(10) NOT NULL,
  `SHIPPING_FULLNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SHIPPING_MOBILE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PAYMENT_METHOD` tinyint(4) NOT NULL COMMENT '0: COD, 1: Bank',
  `ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DELIVERED_DATE` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CUSTOMER_ID`(`CUSTOMER_ID`) USING BTREE,
  INDEX `ORDER_STATUS_ID`(`ORDER_STATUS_ID`) USING BTREE,
  INDEX `STAFF_ID`(`STAFF_ID`) USING BTREE,
  CONSTRAINT `CUSTOMER_ID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ORDER_STATUS_ID` FOREIGN KEY (`ORDER_STATUS_ID`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (11, '2022-06-14 08:36:06', 2, 6, 8, 'Thảo Vy', '0333232451', 0, 'phường 11, quận Tân Bình, TPHCM', '2022-06-17');
INSERT INTO `order` VALUES (13, '2022-06-14 12:08:30', 2, 0, 8, 'Nguyễn Đình Khôi Nguyên', '0333232451', 0, '65/22 Phan Sào Nam, phường 11, quận Tân Bình, TPHCM', '2022-06-17');
INSERT INTO `order` VALUES (14, '2022-06-14 12:17:11', 1, 0, 8, 'Nguyễn Đình Khôi Nguyên', '0333232451', 0, '65/22 Phan Sào Nam, phường 11, quận Tân Bình, TPHCM', '2022-06-17');
INSERT INTO `order` VALUES (15, '2022-06-14 12:18:00', 1, 0, 8, 'Nguyễn Đình Khôi Nguyên', '0333232451', 0, '65/22 Phan Sào Nam, phường 11, quận Tân Bình, TPHCM', '2022-06-17');
INSERT INTO `order` VALUES (16, '2022-06-14 12:22:56', 1, 0, 8, 'Nguyễn Đình Khôi Nguyên', '0333232451', 0, '65/22 Phan Sào Nam, phường 11, quận Tân Bình, TPHCM', '2022-06-17');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `PRODUCT_ID` int(10) NOT NULL,
  `ORDER_ID` int(10) NOT NULL,
  `QTY` int(4) NOT NULL,
  `SIZE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UNIT_PRICE` int(11) NOT NULL,
  `TOTAL_PRICE` int(10) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`, `ORDER_ID`, `SIZE`) USING BTREE,
  INDEX `ORDER_ID`(`ORDER_ID`) USING BTREE,
  CONSTRAINT `ORDER_ID` FOREIGN KEY (`ORDER_ID`) REFERENCES `order` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PRODUCT_ID` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (2, 11, 2, 'L', 1500000, 3000000);
INSERT INTO `order_item` VALUES (4, 14, 2, 'S', 3500000, 7000000);
INSERT INTO `order_item` VALUES (10, 13, 1, '', 2000000, 2000000);
INSERT INTO `order_item` VALUES (10, 15, 2, '', 4000000, 8000000);
INSERT INTO `order_item` VALUES (10, 16, 2, '', 4000000, 8000000);
INSERT INTO `order_item` VALUES (12, 13, 1, 'S', 500000, 500000);
INSERT INTO `order_item` VALUES (14, 13, 1, '', 2200000, 2200000);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PRICE` int(10) NOT NULL,
  `FEATURED_IMAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `CREATED_DATE` datetime(0) NOT NULL,
  `SHORT_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULL_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEATURED` int(1) NULL DEFAULT NULL COMMENT '1 = Sản phẩm nổi bật, 0 = Ko',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CATEGORY_ID`(`CATEGORY_ID`) USING BTREE,
  CONSTRAINT `CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'ALMA BB', 500000, 'ALMA BB.jpg', 2, '2022-05-18 12:49:36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (2, 'DRAPY MULE', 1500000, 'DRAPY MULE.jpg', 4, '2022-05-17 12:50:03', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (3, 'FAME PLATFORM PUMP', 2500000, 'FAME PLATFORM PUMP.jpg', 4, '2022-05-16 12:50:11', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (4, 'GRADIENT LV CIRCLE SELF-TIE T-SHIRT', 3500000, 'GRADIENT LV CIRCLE SELF-TIE T-SHIRT.jpg', 1, '2022-05-15 12:50:15', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (5, 'IDYLLE BLOSSOM CHARMS NECKLACE, 3 GOLDS AND DIAMONDS', 500000, 'IDYLLE BLOSSOM CHARMS NECKLACE, 3 GOLDS AND DIAMONDS.jpg', 3, '2022-05-14 12:50:19', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (6, 'IDYLLE BLOSSOM MONOGRAM BRACELET, WHITE GOLD AND DIAMONDS', 4000000, 'IDYLLE BLOSSOM MONOGRAM BRACELET, WHITE GOLD AND DIAMONDS.jpg', 3, '2022-05-13 12:50:23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (7, 'IDYLLE BLOSSOM RING, 3 GOLDS AND DIAMONDS', 2500000, 'IDYLLE BLOSSOM RING, 3 GOLDS AND DIAMONDS.jpg', 3, '2022-05-13 12:50:27', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (8, 'IDYLLE BLOSSOM TWO-ROW BRACELET, PINK GOLD AND DIAMONDS', 1500000, 'IDYLLE BLOSSOM TWO-ROW BRACELET, PINK GOLD AND DIAMONDS.jpg', 3, '2022-05-12 12:50:36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (9, 'LV ARCHLIGHT SNEAKER', 3500000, 'LV ARCHLIGHT SNEAKER.jpg', 4, '2022-05-11 12:50:40', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (10, 'LV PONT 9 SOFT MM', 4000000, 'LV PONT 9 SOFT MM.jpg', 2, '2022-05-10 12:50:45', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (11, 'MONOGRAM CLOUD BOMBER JACKET', 6000000, 'MONOGRAM CLOUD BOMBER JACKET.jpg', 1, '2022-05-09 12:50:49', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (12, 'MONOGRAM RELIEF SHIRT DRESS', 500000, 'MONOGRAM RELIEF SHIRT DRESS.jpg', 1, '2022-05-08 12:50:52', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (13, 'NEVERFULL GM', 2500000, 'NEVERFULL GM.jpg', 2, '2022-05-06 12:50:57', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (14, 'ONTHEGO MM', 2200000, 'ONTHEGO MM.jpg', 2, '2022-04-19 12:51:01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (15, 'PAPILLON BB', 1500000, 'PAPILLON BB.jpg', 2, '2022-04-20 12:51:07', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (16, 'PASTEL MONOGRAM KNIT TUBE SKIRT', 2500000, 'PASTEL MONOGRAM KNIT TUBE SKIRT.jpg', 1, '2022-05-18 12:51:15', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (17, 'PIXEL DAMIER SKIRT', 6500000, 'PIXEL DAMIER SKIRT.jpg', 1, '2022-05-18 12:51:22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (18, 'REVERSIBLE LV POLKA DOT JACKET', 4600000, 'REVERSIBLE LV POLKA DOT JACKET.jpg', 1, '2022-05-19 12:51:25', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (19, 'SUNNY FLAT THONG', 1500000, 'SUNNY FLAT THONG.jpg', 4, '2022-05-01 12:51:29', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (20, 'TAMBOUR HORIZON LIGHT UP CONNECTED WATCH PINK', 1700000, 'TAMBOUR HORIZON LIGHT UP CONNECTED WATCH PINK.jpg', 5, '2022-05-18 12:51:34', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (21, 'TAMBOUR HORIZON LIGHT UP CONNECTED WATCH BROWN', 9000000, 'TAMBOUR HORIZON LIGHT UP CONNECTED WATCH BROWN.jpg', 5, '2022-05-08 12:51:36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (22, 'TAMBOUR MONOGRAM 34MM', 1500000, 'TAMBOUR MONOGRAM 34MM.jpg', 5, '2022-05-12 12:51:41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (23, 'TAMBOUR MOON STAR WHITE 28', 6200000, 'TAMBOUR MOON STAR WHITE 28.jpg', 5, '2022-05-02 12:51:45', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (24, 'TAMBOUR SLIM MONOGRAM 28', 700000, 'TAMBOUR SLIM MONOGRAM 28.jpg', 5, '2022-05-03 12:51:49', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 1);
INSERT INTO `product` VALUES (25, 'TAMBOUR STREET DIVER', 5900000, 'TAMBOUR STREET DIVER.jpg', 5, '2022-05-04 12:51:54', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', NULL);
INSERT INTO `product` VALUES (34, 'RUN 55 SNEAKER', 3600000, 'RUN 55 SNEAKER.jpg', 4, '2022-06-17 19:20:49', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum ipsum dicta quod, quia doloremque aut deserunt commodi quis. Totam a consequatur beatae nostrum, earum consequuntur? Eveniet consequatur ipsum dicta recusandae.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?', 0);

-- ----------------------------
-- Table structure for product_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE `product_detail`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(4) NOT NULL,
  `SIZE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QTY` int(4) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_detail
-- ----------------------------
INSERT INTO `product_detail` VALUES (1, 4, 'S', 3);
INSERT INTO `product_detail` VALUES (2, 4, 'M', 6);
INSERT INTO `product_detail` VALUES (3, 4, 'L', 7);
INSERT INTO `product_detail` VALUES (4, 4, 'XL', 8);
INSERT INTO `product_detail` VALUES (5, 11, 'S', 5);
INSERT INTO `product_detail` VALUES (6, 11, 'M', 6);
INSERT INTO `product_detail` VALUES (7, 11, 'L', 7);
INSERT INTO `product_detail` VALUES (8, 11, 'XL', 8);
INSERT INTO `product_detail` VALUES (9, 12, 'S', 1);
INSERT INTO `product_detail` VALUES (10, 12, 'M', 6);
INSERT INTO `product_detail` VALUES (11, 12, 'L', 4);
INSERT INTO `product_detail` VALUES (12, 12, 'XL', 8);
INSERT INTO `product_detail` VALUES (13, 16, 'S', 0);
INSERT INTO `product_detail` VALUES (14, 16, 'M', 0);
INSERT INTO `product_detail` VALUES (15, 16, 'L', 0);
INSERT INTO `product_detail` VALUES (16, 16, 'XL', 8);
INSERT INTO `product_detail` VALUES (17, 17, 'S', 5);
INSERT INTO `product_detail` VALUES (18, 17, 'M', 6);
INSERT INTO `product_detail` VALUES (19, 17, 'L', 7);
INSERT INTO `product_detail` VALUES (20, 17, 'XL', 8);
INSERT INTO `product_detail` VALUES (21, 18, 'S', 5);
INSERT INTO `product_detail` VALUES (22, 18, 'M', 5);
INSERT INTO `product_detail` VALUES (23, 18, 'L', 6);
INSERT INTO `product_detail` VALUES (24, 18, 'XL', 10);
INSERT INTO `product_detail` VALUES (25, 2, 'S', 1);
INSERT INTO `product_detail` VALUES (26, 2, 'M', 2);
INSERT INTO `product_detail` VALUES (27, 2, 'L', 1);
INSERT INTO `product_detail` VALUES (28, 2, 'XL', 5);
INSERT INTO `product_detail` VALUES (29, 3, 'S', 5);
INSERT INTO `product_detail` VALUES (30, 3, 'M', 0);
INSERT INTO `product_detail` VALUES (31, 3, 'L', 0);
INSERT INTO `product_detail` VALUES (32, 3, 'XL', 0);
INSERT INTO `product_detail` VALUES (33, 9, 'S', 6);
INSERT INTO `product_detail` VALUES (34, 9, 'M', 4);
INSERT INTO `product_detail` VALUES (35, 9, 'L', 7);
INSERT INTO `product_detail` VALUES (36, 9, 'XL', 0);
INSERT INTO `product_detail` VALUES (37, 19, 'S', 0);
INSERT INTO `product_detail` VALUES (38, 19, 'M', 0);
INSERT INTO `product_detail` VALUES (39, 19, 'L', 0);
INSERT INTO `product_detail` VALUES (40, 19, 'XL', 0);
INSERT INTO `product_detail` VALUES (41, 1, NULL, 10);
INSERT INTO `product_detail` VALUES (42, 10, NULL, 8);
INSERT INTO `product_detail` VALUES (43, 13, NULL, 10);
INSERT INTO `product_detail` VALUES (44, 14, NULL, 10);
INSERT INTO `product_detail` VALUES (45, 15, NULL, 10);
INSERT INTO `product_detail` VALUES (46, 5, NULL, 10);
INSERT INTO `product_detail` VALUES (47, 6, '', 10);
INSERT INTO `product_detail` VALUES (48, 7, NULL, 10);
INSERT INTO `product_detail` VALUES (49, 8, NULL, 10);
INSERT INTO `product_detail` VALUES (50, 20, NULL, 10);
INSERT INTO `product_detail` VALUES (51, 21, NULL, 10);
INSERT INTO `product_detail` VALUES (52, 22, NULL, 10);
INSERT INTO `product_detail` VALUES (53, 23, NULL, 10);
INSERT INTO `product_detail` VALUES (54, 24, NULL, 10);
INSERT INTO `product_detail` VALUES (55, 25, NULL, 10);
INSERT INTO `product_detail` VALUES (60, 34, 'S', 5);
INSERT INTO `product_detail` VALUES (61, 34, 'M', 6);
INSERT INTO `product_detail` VALUES (62, 34, 'L', 7);
INSERT INTO `product_detail` VALUES (63, 34, 'XL', 8);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Quản Trị Viên');
INSERT INTO `role` VALUES (2, 'Thành Viên');
INSERT INTO `role` VALUES (3, 'Vaitro1');
INSERT INTO `role` VALUES (4, 'Vai tro 2');

-- ----------------------------
-- Table structure for role_action
-- ----------------------------
DROP TABLE IF EXISTS `role_action`;
CREATE TABLE `role_action`  (
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `action_id`) USING BTREE,
  INDEX `role_action_role_fk_1`(`role_id`) USING BTREE,
  INDEX `role_action_action_fk_1`(`action_id`) USING BTREE,
  CONSTRAINT `role_action_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_action_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_action
-- ----------------------------
INSERT INTO `role_action` VALUES (1, 1);
INSERT INTO `role_action` VALUES (1, 2);
INSERT INTO `role_action` VALUES (1, 3);
INSERT INTO `role_action` VALUES (1, 4);
INSERT INTO `role_action` VALUES (1, 5);
INSERT INTO `role_action` VALUES (1, 6);
INSERT INTO `role_action` VALUES (1, 7);
INSERT INTO `role_action` VALUES (1, 8);
INSERT INTO `role_action` VALUES (1, 9);
INSERT INTO `role_action` VALUES (1, 10);
INSERT INTO `role_action` VALUES (1, 11);
INSERT INTO `role_action` VALUES (1, 12);
INSERT INTO `role_action` VALUES (1, 13);
INSERT INTO `role_action` VALUES (1, 14);
INSERT INTO `role_action` VALUES (1, 15);
INSERT INTO `role_action` VALUES (1, 16);
INSERT INTO `role_action` VALUES (1, 17);
INSERT INTO `role_action` VALUES (1, 18);
INSERT INTO `role_action` VALUES (1, 19);
INSERT INTO `role_action` VALUES (1, 20);
INSERT INTO `role_action` VALUES (1, 21);
INSERT INTO `role_action` VALUES (1, 22);
INSERT INTO `role_action` VALUES (1, 23);
INSERT INTO `role_action` VALUES (1, 24);
INSERT INTO `role_action` VALUES (1, 25);
INSERT INTO `role_action` VALUES (1, 26);
INSERT INTO `role_action` VALUES (1, 27);
INSERT INTO `role_action` VALUES (1, 28);
INSERT INTO `role_action` VALUES (1, 29);
INSERT INTO `role_action` VALUES (1, 30);
INSERT INTO `role_action` VALUES (1, 31);
INSERT INTO `role_action` VALUES (1, 32);
INSERT INTO `role_action` VALUES (1, 33);
INSERT INTO `role_action` VALUES (1, 34);
INSERT INTO `role_action` VALUES (1, 35);
INSERT INTO `role_action` VALUES (1, 36);
INSERT INTO `role_action` VALUES (1, 37);
INSERT INTO `role_action` VALUES (1, 38);
INSERT INTO `role_action` VALUES (1, 39);
INSERT INTO `role_action` VALUES (1, 40);
INSERT INTO `role_action` VALUES (1, 41);
INSERT INTO `role_action` VALUES (1, 42);
INSERT INTO `role_action` VALUES (1, 43);
INSERT INTO `role_action` VALUES (1, 44);
INSERT INTO `role_action` VALUES (1, 45);
INSERT INTO `role_action` VALUES (1, 46);
INSERT INTO `role_action` VALUES (1, 47);
INSERT INTO `role_action` VALUES (1, 48);
INSERT INTO `role_action` VALUES (2, 1);
INSERT INTO `role_action` VALUES (2, 2);
INSERT INTO `role_action` VALUES (2, 3);
INSERT INTO `role_action` VALUES (2, 4);
INSERT INTO `role_action` VALUES (2, 41);
INSERT INTO `role_action` VALUES (3, 34);
INSERT INTO `role_action` VALUES (3, 36);
INSERT INTO `role_action` VALUES (3, 38);
INSERT INTO `role_action` VALUES (4, 1);
INSERT INTO `role_action` VALUES (4, 2);
INSERT INTO `role_action` VALUES (4, 3);
INSERT INTO `role_action` VALUES (4, 4);
INSERT INTO `role_action` VALUES (4, 5);
INSERT INTO `role_action` VALUES (4, 6);
INSERT INTO `role_action` VALUES (4, 7);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`, `email`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `username_2`(`username`) USING BTREE,
  INDEX `staff_role_fk_1`(`role_id`) USING BTREE,
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (6, 1, 'Nguyễn Đình Khôi Nguyên', '0333232451', 'khoinguyen', 'e10adc3949ba59abbe56e057f20f883e', 'khoinguyen1942001@gmail.com', 1);
INSERT INTO `staff` VALUES (7, 2, 'Nhân Viên', '0123456789', 'nhanvien', 'e10adc3949ba59abbe56e057f20f883e', 'nhanvien@gmail.com', 1);

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'ordered', 'Đã đặt hàng thành công');
INSERT INTO `status` VALUES (2, 'confirmed', 'Đã xác nhận đơn hàng');
INSERT INTO `status` VALUES (3, 'packaged', 'Hoàn tất đóng gói');
INSERT INTO `status` VALUES (4, 'shipping', 'Đang giao hàng');
INSERT INTO `status` VALUES (5, 'deliveried', 'Đã giao hàng');
INSERT INTO `status` VALUES (6, 'canceled', 'Đơn hàng bị hủy');

SET FOREIGN_KEY_CHECKS = 1;
