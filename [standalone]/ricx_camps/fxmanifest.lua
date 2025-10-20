
fx_version "cerulean"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
games {"rdr3"}
lua54 "yes"
version '1.0.55'

escrow_ignore {
	'config.lua',
    'events.lua',
    'public_server.lua',
    'webhook.lua',
    'fw_func.lua',
}

ui_page 'html/index.html'

files {
    'html/js.js',
    'html/index.html',
    'html/style.css',
    'not.js',
    'html/files/*.png',
}


shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client.lua',
    'events.lua',
    'not.js'
}


server_scripts {
    '@oxmysql/lib/MySQL.lua', --delete this line if you are using VORP, FOR QBR/QR/RSG: '@oxmysql/lib/MySQL.lua', FOR REDEMRP: '@mysql-async/lib/MySQL.lua' | FOR REDEMRP-REBOOT: '@oxmysql/lib/MySQL.lua',
    'fw_func.lua',
    'server.lua',
    'public_server.lua',
    'webhook.lua',
}
dependency '/assetpacks'
dependency '/assetpacks-redm'