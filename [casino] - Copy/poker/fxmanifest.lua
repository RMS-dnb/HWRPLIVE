fx_version 'adamant'

game {'rdr3'}
lua54 'yes'

description 'poker'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


client_scripts {
    'client/*.lua'
}

server_script {
    'server/*.lua'
}

shared_script {
    'config.lua',
    'locale.lua'
}

ui_page('hud/index.html')

files({
    'hud/*.*',
    'hud/images/*.*',
})

escrow_ignore{
	'config.lua',
    'locale.lua',
    'hud/*.*',
    'hud/images/*.*',
}
dependency '/assetpacks'