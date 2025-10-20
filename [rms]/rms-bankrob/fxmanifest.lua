

fx_version 'cerulean'
lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'robbery'

version '1.1.0'

shared_scripts {
    '@ox_lib/init.lua',
	'config.lua'
    
}

client_scripts {
	
	'client/main.lua'
}

server_scripts {
	'server/server.lua'
}

dependencies {
    'rsg-core',
    'rsg-inventory',
    'ox_lib'
}

lua54 'yes'