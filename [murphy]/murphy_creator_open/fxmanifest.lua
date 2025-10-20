fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
version '1.8.0'
client_scripts {
    'config/**.lua',
    'shared/**.lua',
    'client/**.lua',
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',    
    'config/**.lua',
    'shared/**.lua',
	'server/**.lua',
}

escrow_ignore {
    'shared/**.lua',
	'client/**.lua',
	'server/**.lua',
}

files {
    'ui/**/*', 
    'ui/*',    
}

ui_page 'ui/index.html'

lua54 'yes'
dependency '/assetpacks'