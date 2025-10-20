fx_version "cerulean"
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

author 'adnanberandai'
description 'Telegram-System'
version '3.2.0'

shared_script {
	'@ox_lib/init.lua',
	'config.lua',
	'utils/shared.lua'
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'bridge/*.lua'
}

ui_page "nui/dist/index.html"

files {
	'nui/dist/**',
	'locales/**',
}

escrow_ignore {
	'utils/shared.lua',
	'installation/*.lua',
	'config.lua',
	'locales/**',
	'bridge/*.lua',
	'client/*.lua',
	'server/*.lua',
}
dependency '/assetpacks'