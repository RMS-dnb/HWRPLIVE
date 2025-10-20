fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'rms-moonshiner'
version '1.0.7'

shared_scripts {
    '@ox_lib/init.lua',
    '@rsg-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

client_scripts {
    'client/client.lua',
    
    
    'client/moonshine.lua',
    'client/placeprop.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/versionchecker.lua'
}

dependencies {
    'rsg-core',
    'rsg-target',
    'ox_lib',
}

escrow_ignore {
    'client',
    'installation',
    'locales',
    'server',
    'config.lua',
    'README.md',
    'rms-moonshiner.sql'
}

lua54 'yes'
