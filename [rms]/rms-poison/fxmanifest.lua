fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'RMS (Discord: RMS_dnb)'
discord 'https://discord.gg/EKyaqBHgHP'
description 'RMS-POISON'
version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'dataview.lua',
	'client.lua'
}

escrow_ignore {
	'server.lua', 
	'config.lua',
	'dataview.lua'
	
}
lua54 'yes'
dependency '/assetpacks'

