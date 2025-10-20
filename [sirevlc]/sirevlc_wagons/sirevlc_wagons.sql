CREATE TABLE IF NOT EXISTS `sirevlc_wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `charid` int(5) NOT NULL,
  `model` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `equipment`  varchar(5000) NOT NULL,
  `price` int(8) NOT NULL DEFAULT 0,
  `destroyed` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
 