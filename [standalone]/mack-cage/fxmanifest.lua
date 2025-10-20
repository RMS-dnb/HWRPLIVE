fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'mack-cage'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/client.lua',
    'client/placeprop.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/versioncheck.lua'
}

dependencies {
    'rsg-core',
    'ox_lib',
}

escrow_ignore {
    'installation/*.png',
    'installation/*.lua',
    'installation/*.sql',
    'config.lua'
}

lua54 'yes'

dependency '/assetpacks'
dependency '/assetpacks-redm'