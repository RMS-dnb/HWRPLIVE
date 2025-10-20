game 'rdr3'
lua54 'yes'
version '0.7'
author 'Areski'
fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script {
	'config.lua',
	'prompt.lua',
	'client.lua',
	'event.lua',	
}

server_script {
	'config.lua',
    'server.lua'
}

escrow_ignore {
	'config.lua',
	'event.lua'
}
dependency '/assetpacks'