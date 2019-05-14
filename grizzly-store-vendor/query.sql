CREATE SCHEMA `grizzly` ;

CREATE TABLE `brand_table` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(45) NOT NULL DEFAULT 'DFLT_BR',
  PRIMARY KEY (`brand_id`,`brand_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `grizzly`.`brand_table` (`brand_id`, `brand_name`) VALUES ('1', 'DFLT_BR');
INSERT INTO `grizzly`.`brand_table` (`brand_name`) VALUES ('Braun');
INSERT INTO `grizzly`.`brand_table` (`brand_name`) VALUES ('Apple');
INSERT INTO `grizzly`.`brand_table` (`brand_name`) VALUES ('Sakura Pigma');
INSERT INTO `grizzly`.`brand_table` (`brand_name`) VALUES ('Copic');
INSERT INTO `grizzly`.`brand_table` (`brand_name`) VALUES ('Philips');
INSERT INTO `grizzly`.`brand_table` (`brand_name`) VALUES ('Lenovo');


CREATE TABLE `category_table` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`,`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `grizzly`.`category_table` (`category_id`, `category_name`) VALUES ('1', 'Personal Care');
INSERT INTO `grizzly`.`category_table` (`category_name`) VALUES ('Laptops');
INSERT INTO `grizzly`.`category_table` (`category_name`) VALUES ('Art Supplies');
INSERT INTO `grizzly`.`category_table` (`category_name`) VALUES ('Electronics');
INSERT INTO `grizzly`.`category_table` (`category_name`) VALUES ('Books');
INSERT INTO `grizzly`.`category_table` (`category_name`) VALUES ('Home Decor');
INSERT INTO `grizzly`.`category_table` (`category_name`) VALUES ('Toys');

CREATE TABLE `grizzly`.`user_details` (
  `user_id` VARCHAR(15) NOT NULL,
  `user_name` VARCHAR(15) NULL,
  `password` VARCHAR(16) NULL,
  `status` INT NULL,
  `desgination` VARCHAR(15) NULL,
  `office` VARCHAR(15) NULL,
  `created_on` TIMESTAMP NULL,
  `last_updated` TIMESTAMP NULL,
  PRIMARY KEY (`user_id`));

INSERT INTO `grizzly`.`user_details` (`user_id`, `user_name`, `password`, `status`, `desgination`, `office`, `created_on`, `last_updated`) VALUES ('GRZLY00001', 'John Silver', 'root', '1', 'Admin', 'NYC,US', now(), now());
INSERT INTO `grizzly`.`user_details` (`user_id`, `user_name`, `password`, `status`, `desgination`, `office`, `created_on`, `last_updated`) VALUES ('GRZLY00002', 'Jane Doe', 'root', '1', 'Admin', 'NYC,US', now(), now());
INSERT INTO `grizzly`.`user_details` (`user_id`, `user_name`, `password`, `status`, `desgination`, `office`, `created_on`, `last_updated`) VALUES ('GRZLY00003', 'Mary', 'root', '1', 'Sr. Admin', 'NYC,US', now(), now());

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `brand_id` int(11) DEFAULT '1',
  `rating` decimal(10,1) DEFAULT '4.5',
  PRIMARY KEY (`product_id`,`product_name`,`category`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  KEY `fk_br_idx` (`brand_id`),
  CONSTRAINT `fk_br` FOREIGN KEY (`brand_id`) REFERENCES `brand_table` (`brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`, `brand_id`, `rating`) VALUES ('1', 'Trimmer', 'Personal Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '5000', '6', '4.7');
INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`, `brand_id`, `rating`) VALUES ('2', 'Shaver', 'Personal Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2500', '2', '4.8');
INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`, `brand_id`, `rating`) VALUES ('3', 'Macbook Pro', 'Laptops', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '45000', '3', '4.9');
INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`, `brand_id`, `rating`) VALUES ('4', 'iPod', 'Electronics', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '40000', '3', '4.2');
INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`, `brand_id`, `rating`) VALUES ('5', 'Micron Pens', 'Art Supplies', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '200', '4', '4.1');
INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`, `brand_id`, `rating`) VALUES ('6', 'Paint Markers', 'Art Supplies', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2500', '5', '4.3');

CREATE TABLE `vendor_details` (
  `product_id` int(11) NOT NULL,
  `in_stock` int(11) DEFAULT '0',
  `buffer` int(11) DEFAULT '0',
  `offer` float DEFAULT '0',
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  CONSTRAINT `fk_id` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `grizzly`.`vendor_details` (`product_id`, `in_stock`, `buffer`, `offer`) VALUES ('1', '25', '0', '20');
INSERT INTO `grizzly`.`vendor_details` (`product_id`, `in_stock`, `buffer`, `offer`) VALUES ('2', '20', '35', '15');
INSERT INTO `grizzly`.`vendor_details` (`product_id`, `in_stock`, `buffer`, `offer`) VALUES ('3', '85', '500', '25.5');
INSERT INTO `grizzly`.`vendor_details` (`product_id`, `in_stock`, `buffer`, `offer`) VALUES ('4', '10', '15', '2');
INSERT INTO `grizzly`.`vendor_details` (`product_id`, `in_stock`, `buffer`, `offer`) VALUES ('6', '58', '85', '21');
INSERT INTO `grizzly`.`vendor_details` (`product_id`) VALUES ('5');

CREATE TABLE `vendor_user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `contact` bigint(10) NOT NULL,
  `rating` decimal(10,1) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `grizzly`.`vendor_user_details` (`user_id`, `user_name`, `password`, `address`, `contact`, `rating`, `status`) VALUES ('1', 'root', 'root', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '9876543210', '4.8', '1');
INSERT INTO `grizzly`.`vendor_user_details` (`user_id`, `user_name`, `password`, `address`, `contact`, `rating`, `status`) VALUES ('2', 'toor', 'toor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '9909908800', '4.2', '1');
INSERT INTO `grizzly`.`vendor_user_details` (`user_id`, `user_name`, `password`, `address`, `contact`, `rating`, `status`) VALUES ('3', 'groot', 'groot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1234567890', '5', '1');

