fx_version "cerulean"
game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."


author "Mosquito"
lua54 'yes'

client_script 'sc.lua'

file 'weaponinfo_main.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weaponinfo_main.meta'

escrow_ignore {
    'sc.lua',
    'weaponinfo_main.meta',
}
dependency '/assetpacks'
dependency '/assetpacks-redm'