CREATE TABLE IF NOT EXISTS `sirevlc_hunting_wagon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `charid` int(5)  NOT NULL,
  `skinned`int(5)  NOT NULL,
  `type`   int(5)  NOT NULL,
  `pelt`   int(55) NOT NULL,
  `quality`int(55) NOT NULL, 
  `outfit` int(55) NOT NULL,
  `model`  int(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
 