fx_version 'adamant'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Mosquito'
description 'Simple refined ragdoll script.'
version '1.0.0'


client_scripts {
    'config.lua',
    'client.lua',
}
escrow_ignore {
	'config.lua',
}

lua54 'yes'

dependency '/assetpacks'