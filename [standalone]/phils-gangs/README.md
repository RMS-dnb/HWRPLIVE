RSG Gangs Script for RedM
A comprehensive gang management script for RedM using RSGCore, ox_lib, MySQL, and rsg-inventory. Players can create and manage gangs, deposit/withdraw funds, access a gang stash, and assign a boss role with exclusive permissions. The script includes a menu system, a /ganginfo command to view gang details, and an admin command /setgangboss for manual boss assignment.
Features

Gang Creation: Players can create a gang for a configurable cost (default: $500).
Role System: Supports boss, leader, and member roles.
Boss: Exclusive permissions to withdraw funds, disband the gang, and set a new boss.
Leader/Member: Can deposit funds and access the gang stash.


Fund Management: Deposit funds to a shared gang account; only the boss can withdraw.
Gang Stash: Shared storage 
Boss Promotion: The boss can promote another member to boss via the gang menu or use the /setgangboss admin command.
Gang Info Command: /ganginfo displays the player's gang, role, and a list of all gangs.
Menu System: Accessible via /gangmenu 
Notifications: Hardcoded English notifications using ox_lib, no locales.

Dependencies

rsg-core
ox_lib
rsg-inventory
oxmysql

Installation

Clone or Download:

Place the script folder (e.g., rsg-gangs) in your server's resources directory.


Add to Server Config:

Add ensure rsg-gangs to your server.cfg after the dependencies.


Set Up Database:

Import the following SQL to create the required tables:
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


Ensure the players table exists with citizenid and charname columns for member names in the promotion menu.



Configure Settings:

Edit config.lua to adjust:
Config.GangCreationCost: Cost to create a gang (default: 500).
Config.StashMaxWeight: Maximum stash weight (default: 100000).
Config.StashMaxSlots: Maximum stash slots (default: 50).




Restart Server:

Restart your server or use refresh and start rsg-gangs in the server console.



Usage

Create a Gang:

Use /gangmenu or press G to open the gang menu.
Select "Create Gang", enter a name, and pay the creation cost.


Manage Gang:

In the gang menu:
Open Stash: Access the gang's shared storage (gang_<gang_id>).
Deposit Funds: Add money to the gang's funds (all roles).
Withdraw Funds: Remove money (boss only).
Set New Boss: Promote a member to boss (boss only).
Disband Gang: Delete the gang (boss only).




View Gang Info:

Use /ganginfo to see your gang, role (Boss, Leader, or Member), and a list of all gangs.


Set Boss Manually:

Admins can use /setgangboss <citizenid> to set any gang member as the boss.
Example: /setgangboss ABC123 (replace ABC123 with the player's citizenid).



Commands

/gangmenu: Opens the gang management menu (also bound to G key).
/ganginfo: Displays your gang details and lists all gangs.
/setgangboss <citizenid>: Admin command to set a gang member as boss.



Use /ganginfo to confirm you're the boss ("Role: Boss").


exports

TriggerServerEvent('rsg-gangs:server:addgangfunds', MySQL.query.await('SELECT g.gang_id FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { RSGCore.Functions.GetPlayer(source).PlayerData.citizenid })[1].gang_id, 500) 
--- 500 being cash 
