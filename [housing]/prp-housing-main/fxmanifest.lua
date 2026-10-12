-- Decrypted with https://discord.gg/enetkit - https://enetkit.dev

client_script '@ElectronAC/src/include/client.lua'
fx_version "cerulean"
game "gta5"
lua54 "yes"
this_is_a_map "yes"

author "Prodigy Studios"
description "Prodigy Studios Housing Main"

escrow_ignore {
    "stream/prp_housing_main_txd.ytd",
    "client/*.lua"
}

client_script {
    "client/*.lua",
}

files {
    "audio/prp_housing_game.dat151.rel"
}

data_file "AUDIO_GAMEDATA" "audio/prp_housing_game.dat"
dependency '/assetpacks'