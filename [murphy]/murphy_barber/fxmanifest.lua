fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
version '1.12.0'

client_scripts {
	'shared/*', 
	'client/**/*', 
}


server_scripts {
	'@oxmysql/lib/MySQL.lua',     
	'shared/*', 
	'server/adapters/*', 
	'server/*', 
}

files {
    'ui/**/*', 
    'ui/*',    
}

escrow_ignore {
    'shared/config.lua',
	'shared/lang.lua',
	'client/adapters/*.lua',
	'client/**.lua',
	'server/adapters/*.lua',
}

ui_page 'ui/index.html'

lua54 'yes'
dependency '/assetpacks'