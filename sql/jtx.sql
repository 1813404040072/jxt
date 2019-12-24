/*
 Navicat Premium Data Transfer

 Source Server         : local.mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : jtx

 Target Server Type    : MariaDB
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 31/10/2019 20:09:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES (1, 'mobile Fish 1');
INSERT INTO `author` VALUES (2, 'Home Loan Account Table Computer');
INSERT INTO `author` VALUES (3, 'Trace');
INSERT INTO `author` VALUES (4, 'Savings Account alarm');
INSERT INTO `author` VALUES (5, 'Tasty Metal Bacon');
INSERT INTO `author` VALUES (6, 'red Chips Soap');
INSERT INTO `author` VALUES (7, 'Home Loan Account');
INSERT INTO `author` VALUES (8, 'web-readiness');
INSERT INTO `author` VALUES (9, 'Namibia');
INSERT INTO `author` VALUES (10, 'Steel zero administration');
INSERT INTO `author` VALUES (11, 'thatquan 1');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publication_date` date NULL DEFAULT NULL,
  `price` decimal(21, 2) NOT NULL,
  `name_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_book_name_id`(`name_id`) USING BTREE,
  CONSTRAINT `fk_book_name_id` FOREIGN KEY (`name_id`) REFERENCES `author` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'mobile Fish', 'Home Loan Account Table Computer', '2019-10-25', 45924.00, NULL);
INSERT INTO `book` VALUES (2, 'seamless Metal deposit', 'Producer', '2019-10-24', 93855.00, NULL);
INSERT INTO `book` VALUES (3, 'Electronics', 'Soap methodology Albania', '2019-10-24', 2306.00, NULL);
INSERT INTO `book` VALUES (4, 'Namibia', 'Steel zero administration', '2019-10-25', 23277.00, NULL);
INSERT INTO `book` VALUES (5, 'Licensed Savings Account', 'Cambridgeshire Mississippi', '2019-10-25', 85994.00, NULL);
INSERT INTO `book` VALUES (6, 'Yuan Renminbi Centers', 'Factors', '2019-10-24', 56328.00, NULL);
INSERT INTO `book` VALUES (7, 'envisioneer Music Public-key', 'infomediaries', '2019-10-25', 60999.00, NULL);
INSERT INTO `book` VALUES (8, 'backing up Salad', 'Digitized invoice', '2019-10-25', 42515.00, NULL);
INSERT INTO `book` VALUES (9, 'sky blue Georgia', 'Facilitator', '2019-10-24', 44975.00, NULL);
INSERT INTO `book` VALUES (10, 'e-enable Communications capacitor', 'Awesome', '2019-10-25', 52083.00, NULL);

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('00000000000001', 'jhipster', 'config/liquibase/changelog/00000000000000_initial_schema.xml', '2019-10-23 17:46:30', 1, 'EXECUTED', '8:c5bfc567913b118109a43e981cd02883', 'createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...', '', NULL, '3.6.3', NULL, NULL, '1827589106');
INSERT INTO `databasechangelog` VALUES ('20191025074603-1', 'jhipster', 'config/liquibase/changelog/20191025074603_added_entity_Author.xml', '2019-10-25 14:54:18', 2, 'MARK_RAN', '8:9d82ece3c4c9e1fa32c9ab369cda75a6', 'createTable tableName=author', '', NULL, '3.6.3', NULL, NULL, '1990058820');
INSERT INTO `databasechangelog` VALUES ('20191025074603-1-relations', 'jhipster', 'config/liquibase/changelog/20191025074603_added_entity_Author.xml', '2019-10-25 14:54:18', 3, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '1990058820');
INSERT INTO `databasechangelog` VALUES ('20191025074603-1-data', 'jhipster', 'config/liquibase/changelog/20191025074603_added_entity_Author.xml', '2019-10-25 15:39:37', 4, 'EXECUTED', '8:9f62104922618de2bc89871fd14acf40', 'loadData tableName=author', '', NULL, '3.6.3', 'faker', NULL, '1992777408');
INSERT INTO `databasechangelog` VALUES ('20191025091649-1', 'jhipster', 'config/liquibase/changelog/20191025091649_added_entity_Author.xml', '2019-10-25 16:30:09', 5, 'EXECUTED', '8:c10443244da2949bd131558c968c9c81', 'createTable tableName=author', '', NULL, '3.6.3', NULL, NULL, '1995809311');
INSERT INTO `databasechangelog` VALUES ('20191025091649-1-relations', 'jhipster', 'config/liquibase/changelog/20191025091649_added_entity_Author.xml', '2019-10-25 16:30:09', 6, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '1995809311');
INSERT INTO `databasechangelog` VALUES ('20191025091649-1-data', 'jhipster', 'config/liquibase/changelog/20191025091649_added_entity_Author.xml', '2019-10-25 16:30:09', 7, 'EXECUTED', '8:cde9a46429a3ef4d9c1284a9c85e9338', 'loadData tableName=author', '', NULL, '3.6.3', 'faker', NULL, '1995809311');
INSERT INTO `databasechangelog` VALUES ('20191025092225-1', 'jhipster', 'config/liquibase/changelog/20191025092225_added_entity_Book.xml', '2019-10-25 16:30:09', 8, 'EXECUTED', '8:34ba72c447a688d15554bf02afb2f71a', 'createTable tableName=book', '', NULL, '3.6.3', NULL, NULL, '1995809311');
INSERT INTO `databasechangelog` VALUES ('20191025092225-1-relations', 'jhipster', 'config/liquibase/changelog/20191025092225_added_entity_Book.xml', '2019-10-25 16:30:09', 9, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '1995809311');
INSERT INTO `databasechangelog` VALUES ('20191025092225-1-data', 'jhipster', 'config/liquibase/changelog/20191025092225_added_entity_Book.xml', '2019-10-25 16:30:09', 10, 'EXECUTED', '8:55e40619aa7d2fccf6e0636738333bb1', 'loadData tableName=book', '', NULL, '3.6.3', 'faker', NULL, '1995809311');
INSERT INTO `databasechangelog` VALUES ('20191025092225-2', 'jhipster', 'config/liquibase/changelog/20191025092225_added_entity_constraints_Book.xml', '2019-10-25 16:30:09', 11, 'EXECUTED', '8:cb4a6175783b40b80d825cec4d3db4f9', 'addForeignKeyConstraint baseTableName=book, constraintName=fk_book_name_id, referencedTableName=author', '', NULL, '3.6.3', NULL, NULL, '1995809311');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'1', '2019-10-27 23:38:18', 'DESKTOP-JL7L7EU (192.168.1.105)');

-- ----------------------------
-- Table structure for jhi_authority
-- ----------------------------
DROP TABLE IF EXISTS `jhi_authority`;
CREATE TABLE `jhi_authority`  (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_authority
-- ----------------------------
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN');
INSERT INTO `jhi_authority` VALUES ('ROLE_USER');

-- ----------------------------
-- Table structure for jhi_persistent_audit_event
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
CREATE TABLE `jhi_persistent_audit_event`  (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` timestamp(0) NULL DEFAULT NULL,
  `event_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `idx_persistent_audit_event`(`principal`, `event_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_persistent_audit_event
-- ----------------------------
INSERT INTO `jhi_persistent_audit_event` VALUES (1, 'admin', '2019-10-23 10:50:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (2, 'system', '2019-10-23 10:54:48', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (3, 'user', '2019-10-23 10:54:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (4, 'admin', '2019-10-25 08:31:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (5, 'admin', '2019-10-25 09:33:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (6, 'admin', '2019-10-25 16:39:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (7, 'admin', '2019-10-25 16:54:38', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (8, 'admin', '2019-10-28 04:34:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (9, 'admin', '2019-10-28 04:34:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (10, 'admin', '2019-10-28 04:34:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (11, 'admin', '2019-10-28 04:34:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (12, 'admin', '2019-10-28 04:34:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (13, 'admin', '2019-10-28 04:34:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (14, 'admin', '2019-10-28 04:35:04', 'AUTHENTICATION_SUCCESS');

-- ----------------------------
-- Table structure for jhi_persistent_audit_evt_data
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
CREATE TABLE `jhi_persistent_audit_evt_data`  (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`, `name`) USING BTREE,
  INDEX `idx_persistent_audit_evt_data`(`event_id`) USING BTREE,
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_persistent_audit_evt_data
-- ----------------------------
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (2, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (2, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (8, 'remoteAddress', '127.0.0.1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (9, 'remoteAddress', '127.0.0.1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (10, 'remoteAddress', '127.0.0.1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (11, 'remoteAddress', '127.0.0.1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (12, 'remoteAddress', '127.0.0.1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (13, 'remoteAddress', '127.0.0.1');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (14, 'remoteAddress', '127.0.0.1');

-- ----------------------------
-- Table structure for jhi_user
-- ----------------------------
DROP TABLE IF EXISTS `jhi_user`;
CREATE TABLE `jhi_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activation_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reset_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `reset_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_user_login`(`login`) USING BTREE,
  UNIQUE INDEX `ux_user_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_user
-- ----------------------------
INSERT INTO `jhi_user` VALUES (1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `jhi_user` VALUES (2, 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `jhi_user` VALUES (3, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `jhi_user` VALUES (4, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);

-- ----------------------------
-- Table structure for jhi_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `jhi_user_authority`;
CREATE TABLE `jhi_user_authority`  (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `authority_name`) USING BTREE,
  INDEX `fk_authority_name`(`authority_name`) USING BTREE,
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_user_authority
-- ----------------------------
INSERT INTO `jhi_user_authority` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `jhi_user_authority` VALUES (1, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (3, 'ROLE_ADMIN');
INSERT INTO `jhi_user_authority` VALUES (3, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (4, 'ROLE_USER');

-- ----------------------------
-- Table structure for tx_address
-- ----------------------------
DROP TABLE IF EXISTS `tx_address`;
CREATE TABLE `tx_address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_address
-- ----------------------------
INSERT INTO `tx_address` VALUES (1, NULL, 'Tân House', NULL, NULL);
INSERT INTO `tx_address` VALUES (2, NULL, '-', NULL, NULL);
INSERT INTO `tx_address` VALUES (3, NULL, 'Dung mang về', NULL, NULL);
INSERT INTO `tx_address` VALUES (4, NULL, NULL, NULL, NULL);
INSERT INTO `tx_address` VALUES (5, NULL, 'Dung ship', NULL, NULL);
INSERT INTO `tx_address` VALUES (6, NULL, 'qua lấy', NULL, NULL);
INSERT INTO `tx_address` VALUES (7, NULL, '1 Tôn Thất Tùng, nhà thuốc số 2, cổng đi về hướng Phạm Ngọc Thạch 0904.293.673', NULL, NULL);
INSERT INTO `tx_address` VALUES (8, NULL, '81A Trần Quốc Toản - 01639923468', NULL, NULL);
INSERT INTO `tx_address` VALUES (9, NULL, 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', NULL, NULL);
INSERT INTO `tx_address` VALUES (10, NULL, 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL);
INSERT INTO `tx_address` VALUES (16, NULL, 'Tân House', NULL, NULL);
INSERT INTO `tx_address` VALUES (17, NULL, 'Dung mang về', NULL, NULL);
INSERT INTO `tx_address` VALUES (18, NULL, 'Dung ship', NULL, NULL);
INSERT INTO `tx_address` VALUES (19, NULL, 'qua lấy', NULL, NULL);
INSERT INTO `tx_address` VALUES (20, NULL, '1 Tôn Thất Tùng, nhà thuốc số 2, cổng đi về hướng Phạm Ngọc Thạch 0904.293.673', NULL, NULL);
INSERT INTO `tx_address` VALUES (21, NULL, '81A Trần Quốc Toản - 01639923468', NULL, NULL);
INSERT INTO `tx_address` VALUES (22, NULL, 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', NULL, NULL);
INSERT INTO `tx_address` VALUES (23, NULL, 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL);

-- ----------------------------
-- Table structure for tx_catalog
-- ----------------------------
DROP TABLE IF EXISTS `tx_catalog`;
CREATE TABLE `tx_catalog`  (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catalog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_catalog
-- ----------------------------
INSERT INTO `tx_catalog` VALUES (1, 'PRODUCT_UNIT', 'cuộn');
INSERT INTO `tx_catalog` VALUES (2, 'PRODUCT_UNIT', 'pc');
INSERT INTO `tx_catalog` VALUES (3, 'PRODUCT_UNIT', 'bag');
INSERT INTO `tx_catalog` VALUES (4, 'PRODUCT_UNIT', 'ổ');
INSERT INTO `tx_catalog` VALUES (5, 'PRODUCT_UNIT', '100g');
INSERT INTO `tx_catalog` VALUES (6, 'PRODUCT_UNIT', 'chiếc');
INSERT INTO `tx_catalog` VALUES (7, 'PRODUCT_UNIT', 'túi');
INSERT INTO `tx_catalog` VALUES (8, 'PRODUCT_UNIT', '250g');
INSERT INTO `tx_catalog` VALUES (9, 'PRODUCT_UNIT', 'hộp');

-- ----------------------------
-- Table structure for tx_customer
-- ----------------------------
DROP TABLE IF EXISTS `tx_customer`;
CREATE TABLE `tx_customer`  (
  `customer_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `source_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_date` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `created_by` int(11) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `modified_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_customer
-- ----------------------------
INSERT INTO `tx_customer` VALUES (1, 'Anh Ân', '1 Tôn Thất Tùng, nhà thuốc số 2, cổng đi về hướng Phạm Ngọc Thạch 0904.293.673', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (2, 'Anh Nguyên', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (3, 'Ben', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (4, 'Chị Cúc CSIP', 'qua lấy', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (5, 'Chị Hồng Linh CCIHP', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (6, 'Chị Ly', 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (7, 'Chị Minh (Dung)', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (8, 'Chi Ngạc', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (9, 'Chị Susu', '81A Trần Quốc Toản - 01639923468', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (10, 'Chị Trang', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (11, 'Dung', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (12, 'Đi chợ mùa thu', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (13, 'Giang', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (14, 'Hiếu Blue', 'Dung ship', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (15, 'Hoàng Hiền', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (16, 'Hùng (bạn Nhung)', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (17, 'Lê (bạn Dung)', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (18, 'Ngọc Chu', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (19, 'Nguyễn Mạnh Tùng', 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (20, 'Nhân Trần', 'Dung mang về', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (21, 'SunPlay', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (22, 'Tân House', 'Tân House', '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);
INSERT INTO `tx_customer` VALUES (23, 'Thu SunPlay', NULL, '', NULL, NULL, '2019-01-03 14:27:32', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tx_order
-- ----------------------------
DROP TABLE IF EXISTS `tx_order`;
CREATE TABLE `tx_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `order_date` datetime(0) NULL DEFAULT NULL,
  `invoice_status` int(1) NULL DEFAULT 0,
  `net` decimal(10, 0) NULL DEFAULT NULL,
  `shipping_cost` decimal(10, 2) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total` decimal(11, 0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `modified_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_order
-- ----------------------------
INSERT INTO `tx_order` VALUES (1, 22, '2018-09-03 00:00:00', 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (2, 16, '2018-09-07 00:00:00', 1, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (3, 11, '2018-09-07 00:00:00', 1, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (4, 1, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (5, 17, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (6, 1, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (7, 15, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (8, 18, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (9, 21, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (10, 12, '2018-09-08 00:00:00', 1, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (11, 10, '2018-09-09 00:00:00', 1, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (12, 13, '2018-09-03 00:00:00', 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (13, 23, '2018-09-09 00:00:00', 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (14, 12, '2018-09-09 00:00:00', 1, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (15, 21, '2018-09-10 00:00:00', 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (16, 7, '2018-09-10 00:00:00', 1, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (17, 9, '2018-09-10 00:00:00', 1, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (18, 22, '2018-09-10 00:00:00', 1, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (19, 5, '2018-09-11 00:00:00', 1, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (20, 13, '2018-09-11 00:00:00', 1, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (21, 2, '2018-09-11 00:00:00', 1, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (22, 6, '2018-09-12 00:00:00', 1, NULL, -22.00, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (23, 20, '2018-09-05 00:00:00', 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (24, 2, '2018-09-12 00:00:00', 1, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (25, 13, '2018-09-12 00:00:00', 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (26, 19, '2018-09-12 00:00:00', 1, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (27, 3, '2018-09-12 00:00:00', 1, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (28, 13, '2018-09-13 00:00:00', 1, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (29, 13, '2018-09-05 00:00:00', 1, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (30, 8, '2018-09-05 00:00:00', 1, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (31, 16, '2018-09-06 00:00:00', 1, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (32, 14, '2018-09-07 00:00:00', 1, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (33, 4, '2018-09-07 00:00:00', 1, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `tx_order` VALUES (34, 22, '2018-09-07 00:00:00', 1, NULL, NULL, NULL, 9, '2019-10-27 23:29:39', 4, NULL, NULL);

-- ----------------------------
-- Table structure for tx_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tx_order_item`;
CREATE TABLE `tx_order_item`  (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(10) NULL DEFAULT NULL,
  `adjusted` decimal(10, 0) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_order_item
-- ----------------------------
INSERT INTO `tx_order_item` VALUES (1, 1, 12, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (2, 1, 7, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (3, 1, 9, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (4, 12, 6, 1, -10, NULL);
INSERT INTO `tx_order_item` VALUES (5, 23, 7, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (6, 23, 11, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (7, 29, 6, 1, -10, NULL);
INSERT INTO `tx_order_item` VALUES (8, 29, 11, 1, -5, NULL);
INSERT INTO `tx_order_item` VALUES (9, 30, 16, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (10, 30, 6, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (11, 31, 15, 20, 0, NULL);
INSERT INTO `tx_order_item` VALUES (12, 32, 12, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (13, 32, 15, 20, 0, NULL);
INSERT INTO `tx_order_item` VALUES (14, 32, 8, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (15, 33, 14, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (16, 33, 15, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (17, 34, 6, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (18, 2, 8, 2, -90, NULL);
INSERT INTO `tx_order_item` VALUES (19, 3, 17, 1, -10, NULL);
INSERT INTO `tx_order_item` VALUES (20, 4, 6, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (21, 5, 6, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (22, 5, 4, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (23, 5, 15, 12, 0, NULL);
INSERT INTO `tx_order_item` VALUES (24, 6, 7, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (25, 6, 9, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (26, 6, 11, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (27, 7, 6, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (28, 8, 1, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (29, 9, 10, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (30, 9, 8, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (31, 9, 13, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (32, 9, 9, 1, NULL, NULL);
INSERT INTO `tx_order_item` VALUES (33, 10, 13, 3, 0, NULL);
INSERT INTO `tx_order_item` VALUES (34, 10, 11, 5, 0, NULL);
INSERT INTO `tx_order_item` VALUES (35, 10, 10, 3, 0, NULL);
INSERT INTO `tx_order_item` VALUES (36, 10, 8, 7, 0, NULL);
INSERT INTO `tx_order_item` VALUES (37, 11, 10, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (38, 11, 12, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (39, 13, 1, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (40, 14, 10, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (41, 14, 8, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (42, 14, 13, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (43, 14, 11, 4, 0, NULL);
INSERT INTO `tx_order_item` VALUES (44, 15, 8, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (45, 15, 11, 2, NULL, NULL);
INSERT INTO `tx_order_item` VALUES (46, 16, 10, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (47, 17, 6, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (48, 17, 10, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (49, 18, 12, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (50, 18, 8, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (51, 18, 4, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (52, 19, 1, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (53, 19, 11, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (54, 20, 17, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (55, 21, 19, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (56, 22, 19, 2, 0, NULL);
INSERT INTO `tx_order_item` VALUES (57, 22, 12, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (58, 22, 18, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (59, 22, 15, 6, 0, NULL);
INSERT INTO `tx_order_item` VALUES (60, 24, 7, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (61, 24, 11, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (62, 24, 13, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (63, 24, 18, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (64, 24, 6, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (65, 25, 6, 1, -10, NULL);
INSERT INTO `tx_order_item` VALUES (66, 26, 10, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (67, 26, 8, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (68, 26, 13, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (69, 26, 19, 3, 0, NULL);
INSERT INTO `tx_order_item` VALUES (70, 26, 15, 20, 0, NULL);
INSERT INTO `tx_order_item` VALUES (71, 27, 1, 1, 0, NULL);
INSERT INTO `tx_order_item` VALUES (72, 34, 7, 1, -8, NULL);
INSERT INTO `tx_order_item` VALUES (73, 34, 11, 1, -9, NULL);

-- ----------------------------
-- Table structure for tx_product
-- ----------------------------
DROP TABLE IF EXISTS `tx_product`;
CREATE TABLE `tx_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `unit` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_product
-- ----------------------------
INSERT INTO `tx_product` VALUES (1, 'CUTI', 'Cuộn tinh than tre', 'Không hiểu', 1, 250.00);
INSERT INTO `tx_product` VALUES (2, 'CUMA', 'Cuộn matcha', NULL, 1, 250.00);
INSERT INTO `tx_product` VALUES (3, 'CUSO', 'Cuộn chocolate', NULL, 1, 250.00);
INSERT INTO `tx_product` VALUES (4, 'CULA', 'Cuộn latte', NULL, 1, 250.00);
INSERT INTO `tx_product` VALUES (5, 'CHUm', 'Bánh chuối chocolate (miếng)', NULL, 2, 15.00);
INSERT INTO `tx_product` VALUES (6, 'CHUo', 'Bánh chuối chocolate (ổ)', NULL, 4, 100.00);
INSERT INTO `tx_product` VALUES (7, 'QCHA1', 'Quy chanh cốm 100g', NULL, 3, 40.00);
INSERT INTO `tx_product` VALUES (8, 'QCHA2', 'Quy chanh cốm 250g', NULL, 3, 90.00);
INSERT INTO `tx_product` VALUES (9, 'QCHU1', 'Quy chuối 100g', NULL, 3, 40.00);
INSERT INTO `tx_product` VALUES (10, 'QCHU2', 'Quy chuối 250g', NULL, 3, 90.00);
INSERT INTO `tx_product` VALUES (11, 'QHU1', 'Basil cookies 100g', NULL, 3, 45.00);
INSERT INTO `tx_product` VALUES (12, 'QHU2', 'Basil cookies 250g', NULL, 3, 100.00);
INSERT INTO `tx_product` VALUES (13, 'QHAA1', 'Quy hạnh nhân 100g (cũ)', NULL, 3, 40.00);
INSERT INTO `tx_product` VALUES (14, 'QHAA2', 'Quy hạnh nhân 250g (cũ)', NULL, 3, 90.00);
INSERT INTO `tx_product` VALUES (15, 'QBE', 'Gấu ôm hạnh nhân', NULL, 2, 5.00);
INSERT INTO `tx_product` VALUES (16, 'BR', 'Brownies hạt óc chó', NULL, 2, 60.00);
INSERT INTO `tx_product` VALUES (17, 'BR5', 'Brownies hạt óc chó 50K', NULL, 2, 50.00);
INSERT INTO `tx_product` VALUES (18, 'CUBA', 'Cuộn Earl Grey', NULL, 1, 250.00);
INSERT INTO `tx_product` VALUES (19, 'QVE', 'Vegan chocolate cookies', NULL, 5, 50.00);
INSERT INTO `tx_product` VALUES (20, 'BR3', 'Brownies', NULL, 2, 30.00);
INSERT INTO `tx_product` VALUES (21, 'QVnib', 'Vegan cookies cacao nibs', NULL, 5, 55.00);
INSERT INTO `tx_product` VALUES (22, 'BOLA', 'Bông lan trứng muối', NULL, 1, 250.00);
INSERT INTO `tx_product` VALUES (23, 'CUSN', 'Bánh cuộn sinh nhật', NULL, 6, 175.00);
INSERT INTO `tx_product` VALUES (24, 'BMSA', 'Bánh mỳ sấy', NULL, 7, 60.00);
INSERT INTO `tx_product` VALUES (25, 'CUSOBA', 'Cuộn Chocolate Earl Grey', NULL, 1, 280.00);
INSERT INTO `tx_product` VALUES (26, 'TBOLACL', 'Bông lan chanh leo (Test)', NULL, 4, 75.00);
INSERT INTO `tx_product` VALUES (27, 'QHA1', 'Quy hạnh nhân 100g ', NULL, 3, 45.00);
INSERT INTO `tx_product` VALUES (28, 'QHA2', 'Quy hạnh nhân 250g ', NULL, 3, 100.00);
INSERT INTO `tx_product` VALUES (29, 'CUTIB', 'Cuộn tinh than tre kem đậu biếc', NULL, 1, 300.00);
INSERT INTO `tx_product` VALUES (30, 'CUDFMCL', 'Cuộn củ dền phô mai chanh leo', NULL, 1, 300.00);
INSERT INTO `tx_product` VALUES (31, 'CUCLX', 'Cuộn chanh leo kem xoài', NULL, 1, 300.00);
INSERT INTO `tx_product` VALUES (32, 'QFING', 'Quy ngón tay hộp 20 cái', NULL, 9, 75.00);
INSERT INTO `tx_product` VALUES (33, 'TCHF1', 'Chiffon Cà phê Quế và hạt óc chó', NULL, 4, 180.00);
INSERT INTO `tx_product` VALUES (34, 'QCL', 'Quy mứt chanh leo', NULL, 9, 60.00);
INSERT INTO `tx_product` VALUES (35, 'TCHF2', 'Chiffon Earl Grey (hộp 4 miếng)', NULL, 9, 100.00);
INSERT INTO `tx_product` VALUES (36, 'CUDSO', 'Cuộn lá dứa chocolate', NULL, 1, 300.00);
INSERT INTO `tx_product` VALUES (37, 'CUBASO', 'Cuộn Earl Grey kem chocolate', NULL, 1, 300.00);
INSERT INTO `tx_product` VALUES (38, 'KHOBOLO', 'Khoai tây bỏ lò ', NULL, 9, 50.00);
INSERT INTO `tx_product` VALUES (39, 'CHUCHO', 'Bánh chuối chocolate hạt óc chó', NULL, 4, 150.00);
INSERT INTO `tx_product` VALUES (40, 'QHO1', 'Quy hồng sấy 100g', NULL, 5, 45.00);
INSERT INTO `tx_product` VALUES (41, 'QHO2', 'Quy hồng sấy 250g', NULL, 8, 100.00);
INSERT INTO `tx_product` VALUES (42, 'CHUm2', 'Bánh chuối chocolate (miếng)', NULL, 2, 10.00);
INSERT INTO `tx_product` VALUES (43, 'XMRLL', 'Christmas Roll', NULL, 6, 200.00);
INSERT INTO `tx_product` VALUES (44, 'CHEETA', 'Cheese tart ', NULL, 6, NULL);
INSERT INTO `tx_product` VALUES (45, 'test 1 ', 'te', 'hb', 2, 2.20);

-- ----------------------------
-- Table structure for tx_tmp
-- ----------------------------
DROP TABLE IF EXISTS `tx_tmp`;
CREATE TABLE `tx_tmp`  (
  `tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adjust` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_cost` decimal(10, 2) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  `address_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tmp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tx_tmp
-- ----------------------------
INSERT INTO `tx_tmp` VALUES (1, '2018-09-03 00:00:00', '1', 'Tân House', 'QHU2', '0', 'Done', NULL, '1', 'Tân House', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (2, '2018-09-03 00:00:00', '1', 'Tân House', 'QCHA1', '0', 'Done', NULL, '2', 'Tân House', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (3, '2018-09-03 00:00:00', '1', 'Tân House', 'QCHU1', '0', 'Done', NULL, '2', 'Tân House', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (4, '2018-09-03 00:00:00', '2', 'Giang', 'CHUo', '-10', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (5, '2018-09-05 00:00:00', '3', 'Nhân Trần', 'QCHA1', '0', 'Done', NULL, '1', 'Dung mang về', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (6, '2018-09-05 00:00:00', '3', 'Nhân Trần', 'QHU1', '0', 'Done', NULL, '1', 'Dung mang về', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (7, '2018-09-05 00:00:00', '4', 'Giang', 'CHUo', '-10', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (8, '2018-09-05 00:00:00', '4', 'Giang', 'QHU1', '-4.5', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (9, '2018-09-05 00:00:00', '5', 'Chi Ngạc', 'BR', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (10, '2018-09-05 00:00:00', '5', 'Chi Ngạc', 'CHUo', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (11, '2018-09-06 00:00:00', '6', 'Hùng (bạn Nhung)', 'QBE', '0', 'Done', NULL, '20', NULL, NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (12, '2018-09-07 00:00:00', '7', 'Hiếu Blue', 'QHU2', '0', 'Done', NULL, '2', 'Dung ship', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (13, '2018-09-07 00:00:00', '7', 'Hiếu Blue', 'QBE', '0', 'Done', NULL, '20', 'Dung ship', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (14, '2018-09-07 00:00:00', '7', 'Hiếu Blue', 'QCHA2', '0', 'Done', NULL, '1', 'Dung ship', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (15, '2018-09-07 00:00:00', '8', 'Chị Cúc CSIP', 'QHAA2', '0', 'Done', NULL, '1', 'qua lấy', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (16, '2018-09-07 00:00:00', '8', 'Chị Cúc CSIP', 'QBE', '0', 'Done', NULL, '2', 'qua lấy', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (17, '2018-09-07 00:00:00', '9', 'Tân House', 'CHUo', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (18, '2018-09-07 00:00:00', '10', 'Hùng (bạn Nhung)', 'QCHA2', '-90', 'Done', NULL, '2', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (19, '2018-09-07 00:00:00', '11', 'Dung', 'BR5', '-10', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (20, '2018-09-08 00:00:00', '12', 'Anh Ân', 'CHUo', '0', 'Done', NULL, '2', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (21, '2018-09-08 00:00:00', '13', 'Lê (bạn Dung)', 'ChUo', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (22, '2018-09-08 00:00:00', '13', 'Lê (bạn Dung)', 'CULA', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (23, '2018-09-08 00:00:00', '13', 'Lê (bạn Dung)', 'QBE', '0', 'Done', NULL, '12', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (24, '2018-09-08 00:00:00', '14', 'Anh An ', 'QCHA1', '0', 'Done', NULL, '1', '1 Tôn Thất Tùng, nhà thuốc số 2, cổng đi về hướng Phạm Ngọc Thạch 0904.293.673', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (25, '2018-09-08 00:00:00', '14', 'Anh An ', 'QCHU1', '0', 'Done', NULL, '1', '1 Tôn Thất Tùng, nhà thuốc số 2, cổng đi về hướng Phạm Ngọc Thạch 0904.293.673', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (26, '2018-09-08 00:00:00', '14', 'Anh An ', 'QHU1', '0', 'Done', NULL, '1', '1 Tôn Thất Tùng, nhà thuốc số 2, cổng đi về hướng Phạm Ngọc Thạch 0904.293.673', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (27, '2018-09-08 00:00:00', '15', 'Hoàng Hiền', 'CHUo', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (28, '2018-09-08 00:00:00', '16', 'Ngọc Chu', 'CUTI', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (29, '2018-09-08 00:00:00', '17', 'SunPlay', 'QCHU2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (30, '2018-09-08 00:00:00', '17', 'SunPlay', 'QCHA2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (31, '2018-09-08 00:00:00', '17', 'SunPlay', 'QHAA1', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (32, '2018-09-08 00:00:00', '17', 'SunPlay', 'QCHU1', NULL, 'Done', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (33, '2018-09-08 00:00:00', '18', 'Đi chợ mùa thu', 'QHAA1', '0', 'Done', NULL, '3', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (34, '2018-09-08 00:00:00', '18', 'Đi chợ mùa thu', 'QHU1', '0', 'Done', NULL, '5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (35, '2018-09-08 00:00:00', '18', 'Đi chợ mùa thu', 'QCHU2', '0', 'Done', NULL, '3', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (36, '2018-09-08 00:00:00', '18', 'Đi chợ mùa thu', 'QCHA2', '0', 'Done', NULL, '7', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (37, '2018-09-09 00:00:00', '19', 'Chị Trang', 'QCHU2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (38, '2018-09-09 00:00:00', '19', 'Chị Trang', 'QHU2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (39, '2018-09-09 00:00:00', '20', 'Thu SunPlay', 'CUTI', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (40, '2018-09-09 00:00:00', '21', 'Đi chợ mùa thu', 'QCHU2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (41, '2018-09-09 00:00:00', '21', 'Đi chợ mùa thu', 'QCHA2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (42, '2018-09-09 00:00:00', '21', 'Đi chợ mùa thu', 'QHAA1', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (43, '2018-09-09 00:00:00', '21', 'Đi chợ mùa thu', 'QHU1', '0', 'Done', NULL, '4', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (44, '2018-09-10 00:00:00', '22', 'SunPlay', 'QCHA2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (45, '2018-09-10 00:00:00', '22', 'SunPlay', 'QHU1', NULL, 'Done', NULL, '1.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (46, '2018-09-10 00:00:00', '23', 'Chị Minh (Dung)', 'QCHU2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (47, '2018-09-10 00:00:00', '24', 'Chị Susu', 'CHUo', '0', 'Done', NULL, '2', '81A Trần Quốc Toản - 01639923468', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (48, '2018-09-10 00:00:00', '24', 'Chị Susu', 'QCHU2', '0', 'Done', NULL, '1', '81A Trần Quốc Toản - 01639923468', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (49, '2018-09-10 00:00:00', '25', 'Tân House', 'QHU2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (50, '2018-09-10 00:00:00', '25', 'Tân House', 'QCHA2', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (51, '2018-09-10 00:00:00', '25', 'Tân House', 'CULA', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (52, '2018-09-11 00:00:00', '26', 'Chị Hồng Linh CCIHP', 'CUTI', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (53, '2018-09-11 00:00:00', '26', 'Chị Hồng Linh CCIHP', 'QHU1', '0', 'Done', NULL, '1.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (54, '2018-09-11 00:00:00', '27', 'Giang', 'BR5', '0', 'Done', NULL, '2', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (55, '2018-09-11 00:00:00', '28', 'Anh Nguyên', 'QVE', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (56, '2018-09-12 00:00:00', '29', 'Chị Ly', 'QVE', '0', 'Done', NULL, '2', 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', -22.00, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (57, '2018-09-12 00:00:00', '29', 'Chị Ly', 'QHU2', '0', 'Done', NULL, '1', 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (58, '2018-09-12 00:00:00', '29', 'Chị Ly', 'CUBA', '0', 'Done', NULL, '0.5', 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (59, '2018-09-12 00:00:00', '29', 'Chị Ly', 'QBE', '0', 'Done', NULL, '6', 'Số 20 ngách 35 ngõ 234 Hoàng Ngọc Phách, 0975371939', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (60, '2018-09-12 00:00:00', '30', 'Anh Nguyên', 'QCHA1', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (61, '2018-09-12 00:00:00', '30', 'Anh Nguyên', 'QHU1', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (62, '2018-09-12 00:00:00', '30', 'Anh Nguyên', 'QHAA1', '0', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (63, '2018-09-12 00:00:00', '30', 'Anh Nguyên', 'CUBA', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (64, '2018-09-12 00:00:00', '30', 'Anh Nguyên', 'CHUo', '0', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (65, '2018-09-12 00:00:00', '31', 'Giang', 'CHUo', '-10', 'Done', NULL, '0.5', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (66, '2018-09-12 00:00:00', '32', 'Nguyễn Mạnh Tùng', 'QCHU2', '0', 'Done', NULL, '1', 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (67, '2018-09-12 00:00:00', '32', 'Nguyễn Mạnh Tùng', 'QCHA2', '0', 'Done', NULL, '1', 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (68, '2018-09-12 00:00:00', '32', 'Nguyễn Mạnh Tùng', 'QHAA1', '0', 'Done', NULL, '1', 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (69, '2018-09-12 00:00:00', '32', 'Nguyễn Mạnh Tùng', 'QVE', '0', 'Done', NULL, '2.5', 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (70, '2018-09-12 00:00:00', '32', 'Nguyễn Mạnh Tùng', 'QBE', '0', 'Done', NULL, '20', 'Chung cư chealsea park, ngõ 114 Trung Kính, 0988037893', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (71, '2018-09-12 00:00:00', '33', 'Ben', 'CUTI', '0', 'Done', NULL, '0.5', NULL, NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (72, '2018-09-13 00:00:00', '34', 'Giang', 'QCHA1', '-8', 'Done', NULL, '1', '-', NULL, NULL, NULL);
INSERT INTO `tx_tmp` VALUES (73, '2018-09-13 00:00:00', '34', 'Giang', 'QHU1', '-9', 'Done', NULL, '1', '-', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
