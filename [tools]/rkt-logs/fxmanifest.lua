fx_version 'cerulean'
lua54 'yes'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

client_scripts {
	"client/*.lua"
}

server_scripts {
	"server/*.lua"
}

shared_scripts {'@ox_lib/init.lua', 'shared/*.lua' }