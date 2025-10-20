fx_version "cerulean"
game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

author "Mosquito"
lua54 'yes'

client_scripts {
    'config.lua',
    'sc.lua',
}

escrow_ignore {
    'weaponsinfo.meta',
    'README.md',
    'stream/*',
    'config.lua'
}

file 'weaponsinfo.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weaponsinfo.meta'

dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks-redm'