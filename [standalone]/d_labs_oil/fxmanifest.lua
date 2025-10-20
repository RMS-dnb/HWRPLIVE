fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
lua54 'yes'

author 'D-Labs'
version '1.1.3'
description 'Oil Factory (Unlocked)'


-- escrow_ignore {
-- 	'config.lua',
--     'server/*.lua',
--     'client/*.lua',
--     'shared/*.lua',
-- }

shared_script {
    'config.lua', 
    'shared/utils.lua',
    'shared/bridge.lua',
}

client_scripts {
    'not.js',
    'client/client_open.lua',
	'client/client.lua',
}

files {
    'not.js',
    "html/*.*",
    "html/css/*",
    "html/js/*",
    "html/image/*",
}

ui_page 'html/index.html'

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/open_server.lua'
}

dependency 'redemrp_menu_base'

