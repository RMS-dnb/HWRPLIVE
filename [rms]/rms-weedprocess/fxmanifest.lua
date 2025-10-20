fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'rms-weedprocessing'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    '@rsg-core/shared/locale.lua',
    'locales/en.lua', -- preferred language
    'config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
   
    'client/client_processing.lua',
    --'client/client_drugrun.lua',
    'client/client_propplace.lua',
    'client/client_npcs.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
  
    'server/server_processing.lua',
   
    'server/versionchecker.lua'
}

dependencies {
    'rsg-core',
    'rsg-target',
    --'rex-guarma',
    'ox_lib',
}

escrow_ignore {
    'installation',
    'locales',
    'config.lua',
    'README.md',
    'rex-weedsystem.sql'
}



this_is_a_map "yes"

lua54 'yes'
