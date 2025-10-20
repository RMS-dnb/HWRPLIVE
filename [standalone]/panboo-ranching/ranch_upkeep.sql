
DROP TABLE IF EXISTS `ranch_upkeep`;
CREATE TABLE IF NOT EXISTS `ranch_upkeep` (
  `ranchid` varchar(50) NOT NULL,
  `hay_stockpile` int(11) DEFAULT 0,
  `upkeep_percent` int(11) DEFAULT 100,
  PRIMARY KEY (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `ranch_upkeep` (`ranchid`, `hay_stockpile`, `upkeep_percent`) VALUES
	('ranch1', 10, 100),
	('ranch2', 10, 100),
	('ranch3', 10, 100),
	('ranch4', 10, 100),
	('ranch5', 10, 100); --Any Additional Ranches you add will need added here

