author "Snapopotamus"
fx_version "cerulean"
lua54 "yes"

games {"rdr3"}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
   'config.lua',
   'client/client.lua'
}

shared_scripts {
   '@ox_lib/init.lua',
   
}

server_scripts {
   'config.lua',
   'server/server.lua'
}