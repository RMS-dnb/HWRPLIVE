fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
lua54 'yes'

author 'HAWK-SCRIPT'
description 'gold smelt by hawk-script'
version '1.0'

client_scripts {
  'client/client.lua',
  'client/function.lua'
}

server_scripts {
  'server/server.lua'
}

shared_scripts {
  'config.lua'
}

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/sounds/*.mp3'
}

escrow_ignore {
  'client/client.lua',
  'server/server.lua',
  'config.lua'
}
dependency '/assetpacks'