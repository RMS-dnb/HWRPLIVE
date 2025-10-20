fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author "Raider#0101"
description "Advanced Coordinate Management System for FiveM - Save, copy, and teleport with style!"
version '1.0.0'

repository 'https://github.com/Raider/es-coords'
discord 'https://discord.com/invite/EkwWvFS'

client_scripts { 
    "main/client/*.lua"
}

ui_page "index.html"

files {
    'index.html',
    'vue.js',
    'assets/**/*.*',
    'assets/font/*.otf',
}

lua54 'yes'

tags {
    'coordinates',
    'teleport',
    'utility',
    'admin',
    'development',
    'coords',
    'location',
    'management',
    'copier',
    'menu'
}
-- dependency '/assetpacks'