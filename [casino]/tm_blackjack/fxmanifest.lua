fx_version "adamant"

games { 'rdr3' }

author '@turbomodus'
description 'blackjack script'
version '2.2'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Client Scripts
client_scripts {
    'config.lua',
    'client/utils-c.lua',
    'client/speech-c.lua',
    'client/blackjack-c.lua',
    'client/animations-c.lua',
    'client/cards-c.lua'
} 

-- Server Scripts
server_scripts {
    --"@frp_lib/library/linker.lua", -- IF using FRP Framework, uncomment this
    'config.lua',
    'server/webhook.lua',
    'server/util-s.lua',
    'server/blackjack-s.lua',
    'server/cards-s.lua',
    'server/compatibility.lua',
} 

-- html
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/reset.css',
    'html/style.css',
    'html/img/cards/playing_cards_01/*.png',
    --'html/img/cards/playing_cards_02/*.png',
    --'html/img/cards/playing_cards_03/*.png',
    --'html/img/cards/playing_cards_04/*.png',
    --'html/img/cards/playing_cards_05/*.png',
    --'html/img/cards/playing_cards_06/*.png',
    --'html/img/cards/playing_cards_07/*.png',
    --'html/img/cards/playing_cards_08/*.png',
    --'html/img/cards/playing_cards_09/*.png',
    'html/img/*.png',
    'html/img/*.gif',
    'html/img/*.jpg',
    'html/blackjack.js',
}

escrow_ignore {
    'config.lua', 
    'config_de.lua', 
    'server/compatibility.lua', 
    'server/webhook.lua',
    'yourmaps_blackjack_tables_resource/yourmaps_blackjack_tables/stream/*.*',
    'yourmaps_blackjack_tables_resource/yourmaps_blackjack_tables/*.*'
}
dependency '/assetpacks'