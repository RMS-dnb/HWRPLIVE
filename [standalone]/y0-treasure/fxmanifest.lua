fx_version 'cerulean'
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'y0-treasure'
version '0.1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    '@jo_libs/init.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

files {
    'locales/*.json',
    'html/index.html',
    'html/index.js'
}

lua54 'yes'


ui_page 'html/index.html'
