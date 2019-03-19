/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.34-log : Database - easyweb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`easyweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `easyweb`;

/*Table structure for table `oauth_token` */

DROP TABLE IF EXISTS `oauth_token`;

CREATE TABLE `oauth_token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `permissions` varchar(512) DEFAULT NULL,
  `roles` varchar(512) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `oauth_token` */

insert  into `oauth_token`(`token_id`,`access_token`,`user_id`,`permissions`,`roles`,`refresh_token`,`expire_time`,`create_time`,`update_time`) values (1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiZXhwIjoxNTQ2Njc1NDcyfQ.-d6vmUtPorYgdkIRyEFPF1wFg8i85SqVrc9skSrm4Tc','1','[\"delete:/oauth/client/{clientId}\",\"delete:/role/{id}\",\"get:/authority\",\"get:/oauth/client\",\"get:/oauth/client/{clientId}\",\"get:/role\",\"get:/userInfo\",\"post:/authority/role\",\"post:/authority/sync\",\"post:/oauth/client\",\"post:/role\",\"post:/user\",\"post:/user/query\",\"put:/oauth/client/{clientId}\",\"put:/role\",\"put:/user\",\"put:/user/psw\",\"put:/user/psw/{id}\",\"put:/user/state\",\"delete:/authority/role\"]','[\"1\"]',NULL,'2019-01-05 16:04:32','2019-01-04 16:04:32','2019-01-04 16:04:32'),(2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiZXhwIjoxNTQ2Njc5NDQ2fQ.kqgH6OcBd20JH0p8gni9N9vyYdVCNGg_OQarzWptTF8','1','[\"delete:/oauth/client/{clientId}\",\"delete:/role/{id}\",\"get:/authority\",\"get:/oauth/client\",\"get:/oauth/client/{clientId}\",\"get:/role\",\"get:/userInfo\",\"post:/authority/role\",\"post:/authority/sync\",\"post:/oauth/client\",\"post:/role\",\"post:/user\",\"post:/user/query\",\"put:/oauth/client/{clientId}\",\"put:/role\",\"put:/user\",\"put:/user/psw\",\"put:/user/psw/{id}\",\"put:/user/state\",\"delete:/authority/role\"]','[\"1\"]',NULL,'2019-01-05 17:10:47','2019-01-04 17:10:46','2019-01-04 17:10:46'),(3,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiZXhwIjoxNTQ2NjgwMTM3fQ.l8t3ls6zPRawB2cqIHjjuqQ3Sr3EFLXLJGOOqg3QZYo','1','[\"delete:/oauth/client/{clientId}\",\"delete:/role/{id}\",\"get:/authority\",\"get:/oauth/client\",\"get:/oauth/client/{clientId}\",\"get:/role\",\"get:/userInfo\",\"post:/authority/role\",\"post:/authority/sync\",\"post:/oauth/client\",\"post:/role\",\"post:/user\",\"post:/user/query\",\"put:/oauth/client/{clientId}\",\"put:/role\",\"put:/user\",\"put:/user/psw\",\"put:/user/psw/{id}\",\"put:/user/state\",\"delete:/authority/role\"]','[\"1\"]',NULL,'2019-01-05 17:22:18','2019-01-04 17:22:18','2019-01-04 17:22:18');

/*Table structure for table `oauth_token_key` */

DROP TABLE IF EXISTS `oauth_token_key`;

CREATE TABLE `oauth_token_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_key` varchar(128) NOT NULL COMMENT '生成token时的key',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `oauth_token_key` */

insert  into `oauth_token_key`(`id`,`token_key`,`create_time`) values (1,'87b5b5c6cb2306a48b70744c78e6ab9af288b40ce5d5c4bc85f9896236e2baf0','2019-01-04 16:04:32');

/*Table structure for table `sys_authority` */

DROP TABLE IF EXISTS `sys_authority`;

CREATE TABLE `sys_authority` (
  `authority` varchar(128) NOT NULL COMMENT '授权标识',
  `authority_name` varchar(128) NOT NULL COMMENT '名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权限';

/*Data for the table `sys_authority` */

insert  into `sys_authority`(`authority`,`authority_name`,`create_time`) values ('delete:/authority/role','移除角色权限','2018-12-19 23:10:15'),('delete:/oauth/client/{clientId}','delete','2018-12-19 23:10:15'),('delete:/role/{id}','删除角色','2018-12-19 23:10:15'),('get:/authority','查询所有权限','2018-12-19 23:10:15'),('get:/oauth/client','list','2018-12-19 23:10:15'),('get:/oauth/client/{clientId}','get','2018-12-19 23:10:15'),('get:/role','查询所有角色','2018-12-19 23:10:15'),('get:/userInfo','获取个人信息','2018-12-19 23:10:15'),('post:/authority/role','给角色添加权限','2018-12-19 23:10:15'),('post:/authority/sync','同步权限','2018-12-19 23:10:15'),('post:/oauth/client','add','2018-12-19 23:10:15'),('post:/role','添加角色','2018-12-19 23:10:15'),('post:/user','添加用户','2018-12-19 23:10:15'),('post:/user/query','查询所有用户','2018-12-19 23:10:15'),('put:/oauth/client/{clientId}','update','2018-12-19 23:10:15'),('put:/role','修改角色','2018-12-19 23:10:15'),('put:/user','修改用户','2018-12-19 23:10:15'),('put:/user/psw','修改自己密码','2018-12-19 23:10:15'),('put:/user/psw/{id}','重置密码','2018-12-19 23:10:15'),('put:/user/state','修改用户状态','2018-12-19 23:10:15');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `comments` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`comments`,`create_time`,`update_time`) values (1,'管理员','管理员','2018-12-19 23:11:29','2018-12-19 23:11:29'),(2,'普通用户','普通用户','2018-12-19 23:12:09','2018-12-19 23:12:09'),(3,'sdsada','sdsada','2019-01-04 16:29:53','2019-01-04 16:29:53');

/*Table structure for table `sys_role_authority` */

DROP TABLE IF EXISTS `sys_role_authority`;

CREATE TABLE `sys_role_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `authority` varchar(128) NOT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_sys_role_permission_pm` (`authority`),
  KEY `FK_sys_role_permission_role` (`role_id`),
  CONSTRAINT `sys_role_authority_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色权限';

/*Data for the table `sys_role_authority` */

insert  into `sys_role_authority`(`id`,`role_id`,`authority`,`create_time`) values (3,1,'delete:/oauth/client/{clientId}','2018-12-19 23:11:35'),(4,1,'delete:/role/{id}','2018-12-19 23:11:36'),(5,1,'get:/authority','2018-12-19 23:11:37'),(6,1,'get:/oauth/client','2018-12-19 23:11:37'),(7,1,'get:/oauth/client/{clientId}','2018-12-19 23:11:38'),(8,1,'get:/role','2018-12-19 23:11:40'),(9,1,'get:/userInfo','2018-12-19 23:11:41'),(10,1,'post:/authority/role','2018-12-19 23:11:41'),(11,1,'post:/authority/sync','2018-12-19 23:11:42'),(12,1,'post:/oauth/client','2018-12-19 23:11:42'),(13,1,'post:/role','2018-12-19 23:11:43'),(14,1,'post:/user','2018-12-19 23:11:44'),(15,1,'post:/user/query','2018-12-19 23:11:44'),(16,1,'put:/oauth/client/{clientId}','2018-12-19 23:11:46'),(17,1,'put:/role','2018-12-19 23:11:46'),(18,1,'put:/user','2018-12-19 23:11:46'),(19,1,'put:/user/psw','2018-12-19 23:11:47'),(20,1,'put:/user/psw/{id}','2018-12-19 23:11:47'),(21,1,'put:/user/state','2018-12-19 23:11:50'),(22,2,'get:/authority','2018-12-19 23:12:35'),(23,2,'get:/oauth/client','2018-12-19 23:12:40'),(24,2,'get:/oauth/client/{clientId}','2018-12-19 23:12:41'),(25,2,'get:/role','2018-12-19 23:13:06'),(26,2,'get:/userInfo','2018-12-19 23:13:10'),(28,2,'post:/oauth/client','2018-12-19 23:13:21'),(29,2,'post:/role','2018-12-19 23:13:22'),(30,2,'post:/user','2018-12-19 23:13:23'),(31,2,'post:/user/query','2018-12-19 23:13:25'),(32,2,'put:/user/psw','2018-12-19 23:13:40'),(33,1,'delete:/authority/role','2018-12-26 10:32:09');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(32) NOT NULL COMMENT '账号',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(256) DEFAULT NULL COMMENT '头像',
  `sex` varchar(1) NOT NULL DEFAULT '男' COMMENT '性别',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `email` varchar(256) DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(1) DEFAULT '0' COMMENT '邮箱是否验证，0未验证，1已验证',
  `true_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0正常，1冻结',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_account` (`username`),
  KEY `FK_sys_user` (`true_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`nick_name`,`avatar`,`sex`,`phone`,`email`,`email_verified`,`true_name`,`id_card`,`birthday`,`department_id`,`state`,`create_time`,`update_time`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','管理员',NULL,'男','12345678901',NULL,0,NULL,NULL,NULL,NULL,0,'2018-12-19 23:30:05','2019-01-04 15:54:57'),(2,'demo','e10adc3949ba59abbe56e057f20f883e','Demo01',NULL,'男','12345678901',NULL,0,NULL,NULL,NULL,NULL,0,'2018-12-19 23:31:25','2019-01-04 17:24:32');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_sys_user_role` (`user_id`),
  KEY `FK_sys_user_role_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`,`create_time`) values (1,1,1,'2018-12-19 23:30:06'),(3,2,2,'2019-01-04 17:18:10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
