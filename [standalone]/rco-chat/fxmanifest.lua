fx_version 'cerulean'
game 'rdr3'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Rust Co.'
description 'Chat System - React + Vite + Mantine'
version '1.0.0'

shared_scripts {
  '@jo_libs/init.lua',
  '@ox_lib/init.lua',
  'config.lua'
}

client_scripts {'client/*.lua'}
server_scripts {'server/*.lua'}

ui_page 'web/build/index.html'

files {
  'modules/nui.lua', 
  'web/build/index.html', 
  'web/build/**/*',
  'locales/*.json'
}

dependencies {
  'ox_lib',
  'jo_libs'
}

escrow_ignore {
    "config.lua",
    "modules/nui.lua"
}
dependency '/assetpacks'