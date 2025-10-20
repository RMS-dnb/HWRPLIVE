fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
lua54 'yes'


author 'Dietrich Development'
description 'Prop Placer'
version '1.0.0'


shared_scripts {
	'config/*.lua',
	'frameworkBridge.lua',
}

client_scripts {	
    'client/cl_main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}


escrow_ignore {
    'config/*.lua',
    'frameworkBridge.lua',
}
dependency '/assetpacks'
dependency 'oxmysql'
dependency '/assetpacks'