fx_version 'adamant'

game 'rdr3'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_script{ 
    'config.lua',
	'server.lua',
    'server2.lua',
}

client_script {
    'config.lua',
	'client.lua',
}
ui_page 'html/index.html'

files {
    'html/index.js',
    'html/index.css',
    'html/index.html',
    'html/crock.ttf',
    'html/images/*.png',
}
escrow_ignore {
    'config.lua', 
    'client.lua', 
    'html/*',
  }
  
dependency '/assetpacks'