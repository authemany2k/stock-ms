/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : inventry_db

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-16 21:57:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category_details
-- ----------------------------
DROP TABLE IF EXISTS `category_details`;
CREATE TABLE `category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_details
-- ----------------------------

-- ----------------------------
-- Table structure for category_units_masters
-- ----------------------------
DROP TABLE IF EXISTS `category_units_masters`;
CREATE TABLE `category_units_masters` (
  `cu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `measure_id` int(11) NOT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_units_masters
-- ----------------------------

-- ----------------------------
-- Table structure for customer_details
-- ----------------------------
DROP TABLE IF EXISTS `customer_details`;
CREATE TABLE `customer_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(200) NOT NULL,
  `customer_email` varchar(200) NOT NULL,
  `customer_address` varchar(500) NOT NULL,
  `customer_contact1` bigint(20) DEFAULT NULL,
  `customer_contact2` bigint(20) DEFAULT NULL,
  `balance` double unsigned NOT NULL DEFAULT '0',
  `due` double unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_details
-- ----------------------------
INSERT INTO `customer_details` VALUES ('1', 'srivas', 'srivas@gmail.com', 'address1', '9654659875', '9654659875', '0', '0', '2018-03-17 02:09:46', null, null);
INSERT INTO `customer_details` VALUES ('2', 'edwin', 'edwin@gmail.com', 'address1', '9654659875', '9654659875', '0', '0', '2018-03-17 02:09:46', null, null);
INSERT INTO `customer_details` VALUES ('3', 'srinivas', 'srini@gmail.com', 'address1', '9654659875', '9654659875', '0', '0', '2018-03-17 02:09:46', null, null);

-- ----------------------------
-- Table structure for measures_master
-- ----------------------------
DROP TABLE IF EXISTS `measures_master`;
CREATE TABLE `measures_master` (
  `measure_id` tinyint(1) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of measures_master
-- ----------------------------
INSERT INTO `measures_master` VALUES ('1', 'Length');
INSERT INTO `measures_master` VALUES ('2', 'Breadth');
INSERT INTO `measures_master` VALUES ('3', 'Diametre');
INSERT INTO `measures_master` VALUES ('4', 'Thickness');
INSERT INTO `measures_master` VALUES ('5', 'Weight');
INSERT INTO `measures_master` VALUES ('6', 'Volume');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(256) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_02_06_090059_create_category_details_table', '1');
INSERT INTO `migrations` VALUES ('4', '2017_02_06_090059_create_customer_details_table', '1');
INSERT INTO `migrations` VALUES ('5', '2017_02_06_090059_create_stock_details_table', '1');
INSERT INTO `migrations` VALUES ('6', '2017_02_06_090059_create_stock_sales_table', '1');
INSERT INTO `migrations` VALUES ('7', '2017_02_06_090059_create_stock_user_table', '1');
INSERT INTO `migrations` VALUES ('8', '2017_02_06_090059_create_store_details_table', '1');
INSERT INTO `migrations` VALUES ('9', '2017_02_06_090059_create_supplier_details_table', '1');
INSERT INTO `migrations` VALUES ('10', '2017_02_06_090059_create_transactions_table', '1');
INSERT INTO `migrations` VALUES ('11', '2017_02_06_090059_create_uom_details_table', '1');
INSERT INTO `migrations` VALUES ('12', '2017_02_07_102728_CreatePurchaseDetailsTable', '1');
INSERT INTO `migrations` VALUES ('13', '2017_02_07_125317_create_sales_details_table', '1');
INSERT INTO `migrations` VALUES ('14', '2017_02_14_090631_create_unit_of_measures_master_table', '1');
INSERT INTO `migrations` VALUES ('15', '2017_02_14_103137_create_category_units_masters_table', '1');
INSERT INTO `migrations` VALUES ('16', '2017_02_15_065008_create_stock_units_details_table', '1');
INSERT INTO `migrations` VALUES ('17', '2017_02_16_081323_create_measures_master_table', '1');
INSERT INTO `migrations` VALUES ('18', '2017_03_11_152511_CreatePurchaseProductListTable', '1');
INSERT INTO `migrations` VALUES ('19', '2017_03_11_152511_CreateSalesProductListTable', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_details
-- ----------------------------
DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE `purchase_details` (
  `purchase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(260) NOT NULL,
  `supplier_address` varchar(260) NOT NULL,
  `supplier_contact1` bigint(20) NOT NULL,
  `opening_due` double(10,2) unsigned NOT NULL,
  `opening_balance` double(10,2) unsigned NOT NULL,
  `purchase_total` double(10,2) unsigned NOT NULL,
  `discount_percent` double(10,2) unsigned NOT NULL,
  `discount_amount` double(10,2) unsigned NOT NULL,
  `tax_description` varchar(255) DEFAULT NULL,
  `tax_percent` double(10,2) unsigned NOT NULL,
  `tax_amount` double(10,2) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `grand_total` double(10,2) unsigned NOT NULL,
  `payment` double(10,2) unsigned NOT NULL,
  `closing_due` double(10,2) unsigned NOT NULL,
  `closing_balance` double(10,2) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `billnumber` varchar(120) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_details
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_product_list
-- ----------------------------
DROP TABLE IF EXISTS `purchase_product_list`;
CREATE TABLE `purchase_product_list` (
  `purchase_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `purchase_cost` double(10,2) unsigned DEFAULT NULL,
  `selling_cost` double(10,2) unsigned DEFAULT NULL,
  `opening_stock` int(10) unsigned NOT NULL,
  `closing_stock` int(10) unsigned NOT NULL,
  `purchase_quantity` int(10) unsigned NOT NULL,
  `sub_total` double(10,2) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`purchase_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_product_list
-- ----------------------------

-- ----------------------------
-- Table structure for sales_details
-- ----------------------------
DROP TABLE IF EXISTS `sales_details`;
CREATE TABLE `sales_details` (
  `sales_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(64) NOT NULL,
  `customer_address` varchar(260) NOT NULL,
  `customer_contact1` bigint(20) NOT NULL,
  `opening_balance` double(10,2) unsigned NOT NULL,
  `opening_due` double(10,2) unsigned NOT NULL,
  `sales_total` double(10,2) unsigned NOT NULL,
  `discount_percent` double(10,2) unsigned NOT NULL,
  `discount_amount` double(10,2) unsigned NOT NULL,
  `tax_description` varchar(255) DEFAULT NULL,
  `tax_percent` double(10,2) unsigned NOT NULL,
  `tax_amount` double(10,2) unsigned NOT NULL,
  `sales_description` varchar(255) DEFAULT NULL,
  `grand_total` double(10,2) unsigned NOT NULL,
  `payment` double(10,2) unsigned NOT NULL,
  `closing_balance` double(10,2) unsigned NOT NULL,
  `closing_due` double(10,2) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `billnumber` varchar(120) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales_details
-- ----------------------------

-- ----------------------------
-- Table structure for sales_product_list
-- ----------------------------
DROP TABLE IF EXISTS `sales_product_list`;
CREATE TABLE `sales_product_list` (
  `sales_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `purchase_cost` double(10,2) unsigned DEFAULT NULL,
  `selling_cost` double(10,2) unsigned DEFAULT NULL,
  `opening_stock` int(10) unsigned NOT NULL,
  `closing_stock` int(10) unsigned NOT NULL,
  `sales_quantity` int(10) unsigned NOT NULL,
  `sub_total` double(10,2) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sales_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales_product_list
-- ----------------------------

-- ----------------------------
-- Table structure for stock_details
-- ----------------------------
DROP TABLE IF EXISTS `stock_details`;
CREATE TABLE `stock_details` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(120) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(120) DEFAULT NULL,
  `purchase_cost` double unsigned DEFAULT '0',
  `selling_cost` double unsigned DEFAULT '0',
  `supplier_id` int(10) unsigned NOT NULL,
  `supplier_name` varchar(120) DEFAULT NULL,
  `stock_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_details
-- ----------------------------

-- ----------------------------
-- Table structure for stock_sales
-- ----------------------------
DROP TABLE IF EXISTS `stock_sales`;
CREATE TABLE `stock_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transactionid` varchar(250) NOT NULL,
  `transidnumber` int(11) NOT NULL,
  `stock_name` varchar(200) NOT NULL,
  `category` varchar(120) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `selling_price` decimal(10,2) unsigned NOT NULL,
  `quantity` decimal(10,2) unsigned NOT NULL,
  `amount` decimal(10,2) unsigned NOT NULL,
  `date` date NOT NULL,
  `username` varchar(120) NOT NULL,
  `customer_id` varchar(120) NOT NULL,
  `subtotal` decimal(10,2) unsigned NOT NULL,
  `payment` decimal(10,2) unsigned NOT NULL,
  `balance` decimal(10,2) unsigned NOT NULL,
  `discount` decimal(10,0) unsigned NOT NULL,
  `tax` decimal(10,0) unsigned NOT NULL,
  `tax_dis` varchar(100) NOT NULL,
  `dis_amount` decimal(10,0) unsigned NOT NULL,
  `grand_total` decimal(10,0) unsigned NOT NULL,
  `due` date NOT NULL,
  `mode` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `count1` int(11) NOT NULL,
  `billnumber` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_sales
-- ----------------------------

-- ----------------------------
-- Table structure for stock_units_details
-- ----------------------------
DROP TABLE IF EXISTS `stock_units_details`;
CREATE TABLE `stock_units_details` (
  `sud_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `measure_id` int(11) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_units_details
-- ----------------------------

-- ----------------------------
-- Table structure for stock_user
-- ----------------------------
DROP TABLE IF EXISTS `stock_user`;
CREATE TABLE `stock_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_user
-- ----------------------------

-- ----------------------------
-- Table structure for store_details
-- ----------------------------
DROP TABLE IF EXISTS `store_details`;
CREATE TABLE `store_details` (
  `name` varchar(100) NOT NULL,
  `log` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_details
-- ----------------------------

-- ----------------------------
-- Table structure for supplier_details
-- ----------------------------
DROP TABLE IF EXISTS `supplier_details`;
CREATE TABLE `supplier_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(200) NOT NULL,
  `supplier_email` varchar(200) NOT NULL,
  `supplier_address` varchar(500) NOT NULL,
  `supplier_contact1` varchar(100) NOT NULL,
  `supplier_contact2` varchar(100) NOT NULL,
  `balance` double unsigned NOT NULL DEFAULT '0',
  `due` double unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier_details
-- ----------------------------
INSERT INTO `supplier_details` VALUES ('1', 'arun', 'arun@gmail.com', 'address1', '9654659875', '9654659875', '0', '265', '2018-03-17 02:09:47', null, null);
INSERT INTO `supplier_details` VALUES ('2', 'bharath', 'bharath@gmail.com', 'address1', '9654659875', '9654659875', '0', '698', '2018-03-17 02:09:47', null, null);
INSERT INTO `supplier_details` VALUES ('3', 'Chandru', 'srini@gmail.com', 'address1', '9654659875', '9654659875', '0', '985', '2018-03-17 02:09:47', null, null);

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `subtotal` double(10,2) unsigned NOT NULL,
  `payment` double(10,2) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `balance` double(10,2) unsigned NOT NULL,
  `due` double(10,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transactions
-- ----------------------------

-- ----------------------------
-- Table structure for unit_of_measures_master
-- ----------------------------
DROP TABLE IF EXISTS `unit_of_measures_master`;
CREATE TABLE `unit_of_measures_master` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `symbol` varchar(8) DEFAULT NULL,
  `measure_id` varchar(16) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit_of_measures_master
-- ----------------------------
INSERT INTO `unit_of_measures_master` VALUES ('1', 'Millimeter', 'mm', '1', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('2', 'Centimeter', 'cm', '1', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('3', 'Inch', 'in', '1', '2017-02-14 14:33:24', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('4', 'Metre', 'm', '1', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('5', 'Millimeter', 'mm', '2', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('6', 'Centimeter', 'cm', '2', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('7', 'Inch', 'in', '2', '2017-02-14 14:33:24', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('8', 'Metre', 'm', '2', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('9', 'Millimeter', 'mm', '3', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('10', 'Centimeter', 'cm', '3', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('11', 'Inch', 'in', '3', '2017-02-14 14:33:24', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('12', 'Metre', 'm', '3', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('13', 'Gauge', 'ga.', '4', '2017-02-14 14:29:04', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('14', 'Millimeter', 'mm', '4', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('15', 'Gram', 'g', '5', '2017-02-14 14:30:05', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('16', 'Killogram', 'kg', '5', '2017-02-14 14:33:24', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('17', 'Pounds', 'lbs', '5', '2017-02-14 14:30:40', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('18', 'Millilitre', 'ml', '6', '2017-02-14 14:32:46', null, '1');
INSERT INTO `unit_of_measures_master` VALUES ('19', 'Litre', 'l', '6', '2017-02-14 14:33:24', null, '1');

-- ----------------------------
-- Table structure for uom_details
-- ----------------------------
DROP TABLE IF EXISTS `uom_details`;
CREATE TABLE `uom_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `spec` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uom_details
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Administrator', 'admin@mystocks.in', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', 'XzrnJobwNpoBxeXOkP2Je0RdrbKXv9WSAl3cCMoHMw8AiL3YGghyduYaIuls', '2018-03-17 02:09:45', '2018-03-17 02:09:45');
