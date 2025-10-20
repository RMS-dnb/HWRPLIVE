fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'panboo-ranching'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

client_scripts {
    'client/client.lua'
}

ui_page('html/ui.html')

files {
    'locales/*.json',
    'html/ui.html',
    'html/style.css',
    'html/script.js',
    'html/*.png',
}

dependencies {
    'rsg-core',
    'ox_lib'
}


lua54 'yes'
