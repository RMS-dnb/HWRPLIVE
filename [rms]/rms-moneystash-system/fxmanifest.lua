fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'mack-moneystash'
version '4.0.0'

shared_scripts {
    'config.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}

dependencies {
    'rsg-core',
    'rsg-inventory',
    'rsg-target'  -- or ox_target if you're using that instead
}

lua54 'yes'