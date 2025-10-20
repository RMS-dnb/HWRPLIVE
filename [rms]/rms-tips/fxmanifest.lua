fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Phil and Mack'
description 'Criminal Activity Tracker with Zone Data and Lawmen Menu for RSG-Core'
version '1.0.0'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

client_scripts {
  'client.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server.lua'
}

dependencies {
  'ox_lib',
  'oxmysql',
  'rsg-core'
}

lua54 'yes'