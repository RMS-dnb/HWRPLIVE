fx_version 'adamant'
games { "rdr3" }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'
author 'Lumen Works'
description 'lumen_music multiCore'
version 'Version 1.92'

client_script {
    "@uiprompt/uiprompt.lua",
    'config.lua',
    'notifications/dataview.lua',
    'notifications/cl_notification.js',
    'notifications/cl_notification.lua',
    'client/c_main.lua',

}
server_script {
    'config.lua',
    'server/s_main.lua',
}

escrow_ignore {
	'config.lua',  
}
dependency '/assetpacks'