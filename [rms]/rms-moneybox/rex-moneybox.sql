CREATE TABLE `money_boxes` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) DEFAULT NULL,
    `properties` text NOT NULL,
    `propid` int(11) NOT NULL,
    `proptype` varchar(50) DEFAULT NULL,
    `cashamount` double(11,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
