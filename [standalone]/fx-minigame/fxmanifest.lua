fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


description 'Fixitfy Minigame'
version '1.0'


ui_page 'ui/index.html'

files {
  "ui/index.html",
  "ui/js/scripts.js",
  "ui/js/jquery.js",
  "ui/css/style.css"
}
client_script {
  "c/c.lua",
}


