--       ___          ___          ___
--      /\  \        /\  \        /\  \
--     /::\  \      /::\  \      /::\  \
--    /:/\:\  \    /:/\:\  \    /:/\ \  \
--   /::\~\:\__\  /:/  \:\  \  _\:\~\ \  \
--  /:/\:\ \:|__|/:/__/_\:\__\/\ \:\ \ \__\
--  \:\~\:\/:/  /\:\  /\ \/__/\:\ \:\ \/__/
--   \:\ \::/  /  \:\ \:\__\   \:\ \:\__\
--    \:\/:/  /    \:\/:/  /    \:\/:/  /
--     \::/__/      \::/  /      \::/  /
--      ‾‾           \/__/        \/__/

-- BGS Slot Machine
-- Author: Snapopotamus
-- © 2024
-- A slot machine game system for RedM servers.
-- Compatible with RSGCore and VORPCore.

---------------------------------------------------------------------------------------------

author "Snapopotamus"
fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

shared_scripts {
	'config.lua'
}
client_scripts {
	'client/*'
}
server_scripts {
	'server/*.lua'
}

ui_page 'nui/index.html'

files {
	'nui/fonts/*',
	'nui/images/*',
	'nui/*',
	'stream/slots_001.ytyp',
	'stream/slots_002.ytyp',
	'stream/slots_005.ytyp',
}

escrow_ignore {
	'config.lua',
	'fxmanifest.lua',
	'nui/**',
}

data_file 'DLC_ITYP_REQUEST' 'stream/slots_001.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/slots_002.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/slots_005.ytyp'
dependency '/assetpacks'
dependency '/assetpacks-redm'