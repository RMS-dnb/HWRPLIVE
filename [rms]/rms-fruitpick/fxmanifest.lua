fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

description 'A Pick up Herbs script for RSG core framework'


shared_script 'config.lua'
client_script 'client/client.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}


