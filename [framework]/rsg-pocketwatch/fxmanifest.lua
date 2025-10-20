author 'Xakra <Discord:Xakra#8145:https://discord.gg/kmsqB6xQjH>'-- Converted to RSG by discord @Biomimetic Join the rsg discord @ https://discord.gg/6WqbVSTDWP 
version '1.0'
description 'rsg-pocketwatch'

fx_version "adamant"
lua54 "on"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"

shared_scripts {
    'config.lua',
}

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/server.lua',
}
