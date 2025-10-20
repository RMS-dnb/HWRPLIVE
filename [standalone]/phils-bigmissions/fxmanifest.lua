fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'phils missions'
version '1.0.0'
lua54 'yes'
author 'phil'
shared_scripts {
    '@rsg-core/shared/locale.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

dependencies {
    'oxmysql',
    'rsg-core',
    'ox_target',
    'rco-dialogs',
    'ox_lib'
} 