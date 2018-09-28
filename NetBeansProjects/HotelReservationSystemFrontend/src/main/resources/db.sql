CREATE DATABASE  IF NOT EXISTS `cs544`;
USE `cs544`;



-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
----- inserting data for guest
INSERT INTO `guest` VALUES (2,'lynn','john','4198000071','johnlynn@gmail.com'),(3,'ryan','peter','4197558623','ryanpeter@gmail.com'),(4,'joe','smith','20248760025','jsmith@gmail.com');

-- Table structure for table `room`

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `size` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` float(10, 2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
----- inserting data for room
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '1', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '1', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '1', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '1', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '1', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '1', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '2', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '2', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '2', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '2', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '2', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '2', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '3', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Simple', '1000', '3', '100');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Deluxe', '2000', '3', '500');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('King Size', '4023', '3', '1000');
INSERT INTO `cs544`.`room` (`category`, `size`, `floor`, `price`) VALUES ('Presidential', '10424', '4', '10000');
-- Table structure for table `booking`
--
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datefrom` DATE NOT NULL,
  `dateto` DATE NOT NULL,
  `status` int(1) NOT NULL,
  `guest_id` int(11) NOT NULL ,
  `room_id` int(11) NOT NULL ,
   FOREIGN KEY (`guest_id`) REFERENCES guest(`id`),
   FOREIGN KEY (`room_id`) REFERENCES room(`id`),
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-----
----- inserting data for booking
INSERT INTO `booking` VALUES (2,'2018-07-20','2018-07-30',0,2,2),(3,'2018-07-21','2018-07-29',0,3,3),(4,'2018-06-30','2018-07-19',2,3,4);
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-- insert data for table `user`
INSERT INTO `user` VALUES (4,'manager','$2a$11$x.4qjG8Sdpz.F/IuYPNyNOBMsDcmiEbfnj88D0PEhPxvEB9jTyR5u'),(5,'receptionist','$2a$11$NXWDp1Rzg/qmlCgm.IySlu2b8aJJDpBOiYaPXbk9u86GEc7Zw6jtW'),(6,'thomas','$2a$11$MXSYEoJCaIdaNoXzGZkDheDkBuy1SxJVs/UU6Qehhpf5REGERcTUW'),(7,'maxthierry','$2a$11$M.LtYZ0PEk..YzWjpAyVrOsUSbf6dLJUTYWcWQQeVWPtPOPvVEDwC');
-- Table structure for table `role`
--
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- insert data for table `role`
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_MANAGER');

-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_roleid_idx` (`role_id`),
  CONSTRAINT `fk_user_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- insert data for table `user_role`
INSERT INTO `user_role` VALUES (5,1),(6,1),(7,1),(4,2);