fx_version "cerulean"
game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."


author "Mosquito"
description "A script that changes the Carcano Sniper rifle to be more like the loved M1918 BAR."
lua54 'yes'

escrow_ignore {
    'fxmanifest.lua',
    'stream/**',
    'sc.lua',
}

client_scripts {
    'sc.lua',
}

file 'weaponinfo_main.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weaponinfo_main.meta'

dependency '/assetpacks'

-- file ' weaponcomponents.meta'
-- data_file 'WEAPONCOMPONENTSINFO_FILE' 'weaponcomponents.meta'
dependency '/assetpacks'