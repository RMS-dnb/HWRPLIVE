CREATE TABLE `gangs` (
    `gang_id` VARCHAR(50) NOT NULL,
    `gang_name` VARCHAR(50) NOT NULL,
    `leader_citizenid` VARCHAR(50) NOT NULL,
    `funds` INT DEFAULT 0,
    PRIMARY KEY (`gang_id`)
);

CREATE TABLE `gang_members` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `gang_id` VARCHAR(50) NOT NULL,
    `citizenid` VARCHAR(50) NOT NULL,
    `role` ENUM('boss', 'leader', 'member') NOT NULL,
    FOREIGN KEY (`gang_id`) REFERENCES `gangs`(`gang_id`) ON DELETE CASCADE
);