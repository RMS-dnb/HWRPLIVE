
fx_version 'cerulean'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Erebus'
description 'Erebus scripts - stop hogtie breakouts.'
version '1.0.0'
lua54 'yes'


client_scripts {
    'client/client.lua',

}


server_scripts {
	'server/server.lua',
}

shared_scripts {
	'config.lua',
}
escrow_ignore {
	'config.lua',
}


dependency '/assetpacks'