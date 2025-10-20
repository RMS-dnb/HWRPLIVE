fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

server_scripts {
    'config.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

shared_script {
    '@rsg-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
    'server/*.lua',
	'locales/*.lua',
}