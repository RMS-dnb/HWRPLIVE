game 'rdr3'
fx_version 'adamant'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

version '1.0.0'

lua54 'yes'
escrow_ignore {
    'config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_script {
    '@ox_lib/init.lua',
    'shared/config.lua'
}
