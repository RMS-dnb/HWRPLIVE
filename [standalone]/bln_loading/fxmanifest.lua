fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

version '1.0.0'
author 'BLN Studio <bln-studio.com>'

client_scripts {
    'c/*.lua'
}

server_scripts {
    's/*.lua'
}

files({
	"ui/index.html",
	"ui/logo.png",
	"ui/assets/*.*",
	"ui/sources/*.*",
	"ui/config.js",
})

loadscreen 'ui/index.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'
dependency '/assetpacks'