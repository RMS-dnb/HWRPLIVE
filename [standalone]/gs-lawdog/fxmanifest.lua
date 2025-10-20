fx_version 'cerulean'
game 'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'Law Dog - K9 Patrol Companion (RSGCore)'
author 'GoldSlush (Bohannon) - RSGCore Conversion'
version '1.1.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@rsg-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    '@PolyZone/Client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

dependencies {
    'rsg-core',
    'ox_lib',
    'rsg-inventory'
}