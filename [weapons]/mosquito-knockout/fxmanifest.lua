fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Mosquito'
description 'A more polished and realistic knockout effect script.'
lua54 'yes'

client_scripts {
	'client.lua',
	'config.lua'
}

escrow_ignore {
    'config.lua',
}

dependency '/assetpacks'