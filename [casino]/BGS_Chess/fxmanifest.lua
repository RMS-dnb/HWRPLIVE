--       ___          ___          ___
--      /\  \        /\  \        /\  \
--     /::\  \      /::\  \      /::\  \
--    /:/\:\  \    /:/\:\  \    /:/\ \  \
--   /::\~\:\__\  /:/  \:\  \  _\:\~\ \  \
--  /:/\:\ \:|__|/:/__/_\:\__\/\ \:\ \ \__\
--  \:\~\:\/:/  /\:\  /\ \/__/\:\ \:\ \/__/
--   \:\ \::/  /  \:\ \:\__\   \:\ \:\__\
--    \:\/:/  /    \:\/:/  /    \:\/:/  /
--     \::/  /      \::/  /      \::/  /
--      \/__/        \/__/        \/__/

-- BGS Chess
-- Author: Snapopotamus
-- © 2024
-- A chess game system for RedM servers.
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
	'client/dataview.lua',
	'client/client.lua',
}

server_script 'server/server.lua'

escrow_ignore {
	'config.lua',
	'fxmanifest.lua',
}

files {
	'stream/*.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'
dependency '/assetpacks'
dependency '/assetpacks-redm'