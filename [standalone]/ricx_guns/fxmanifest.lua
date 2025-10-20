
fx_version "cerulean"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
games {"rdr3"}
lua54 "yes"

escrow_ignore {
    'server.lua',
	'config.lua',
    'fw_func.lua',
}

files {
    'not.js',
}

shared_scripts {
    'config.lua',
}

client_scripts {
    '@dataview_lua/client.lua',
    'client.lua',
    'not.js'
}


server_scripts {
    'fw_func.lua',
    'server.lua',
}
dependency '/assetpacks'