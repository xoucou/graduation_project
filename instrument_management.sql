/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : instrument_management

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-20 17:40:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument` (
  `barcode` varchar(20) NOT NULL,
  `instrumentPhoto` varchar(50) DEFAULT NULL,
  `instrumentName` varchar(20) NOT NULL,
  `instrumentType` varchar(20) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  PRIMARY KEY (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instrument
-- ----------------------------

-- ----------------------------
-- Table structure for instrument_type
-- ----------------------------
DROP TABLE IF EXISTS `instrument_type`;
CREATE TABLE `instrument_type` (
  `instrumentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentTypeName` varchar(20) NOT NULL,
  PRIMARY KEY (`instrumentTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instrument_type
-- ----------------------------
INSERT INTO `instrument_type` VALUES ('1', '1111');
INSERT INTO `instrument_type` VALUES ('2', 'aaa');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('aaa', '123456');
INSERT INTO `users` VALUES ('aaaa', '123456');
INSERT INTO `users` VALUES ('admin', '123456');
