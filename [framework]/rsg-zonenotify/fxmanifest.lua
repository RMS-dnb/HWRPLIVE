fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author '@CKAJIA'
description 'Zone Notify - there are all zones'
version '1.0.0'

client_scripts {
    'client/client.lua',
	'client/dataview.lua',
	'config.lua'
}

server_scripts {
    'server/versionchecker.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
    'config.lua',
}

dependencies {
    'rsg-core',
    'ox_lib',
}

lua54 'yes'
