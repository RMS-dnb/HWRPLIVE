
DROP TABLE IF EXISTS `panboo_farm_animals`;
CREATE TABLE IF NOT EXISTS `panboo_farm_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(50) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `stored` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `growth` int(11) NOT NULL DEFAULT 0 CHECK (`growth` between 0 and 100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

