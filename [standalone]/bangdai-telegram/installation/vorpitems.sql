INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('letter', 'Letter', 10, 1, 'item_standard', 1)
ON DUPLICATE KEY UPDATE `item`='letter', `label`='Letter', `limit`=10, `can_remove`=1, `type`='item_standard', `usable`=1;

INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('paper', 'Paper', 10, 1, 'item_standard', 1)
ON DUPLICATE KEY UPDATE `item`='paper', `label`='Paper', `limit`=10, `can_remove`=1, `type`='item_standard', `usable`=1;

INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('birdpost', 'Bird Post', 10, 1, 'item_standard', 1)
ON DUPLICATE KEY UPDATE `item`='birdpost', `label`='Bird Post', `limit`=10, `can_remove`=1, `type`='item_standard', `usable`=1;