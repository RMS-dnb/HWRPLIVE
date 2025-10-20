fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'rsg-npcdoc'
version '1.0.3'

shared_scripts {
    '@rsg-core/shared/locale.lua',
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

lua54 'yes'

dependencies {
    'rsg-core',
    'rsg-medic',
    'ox_lib'
}
