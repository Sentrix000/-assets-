-- Decrypted with https://discord.gg/enetkit - https://enetkit.dev

client_script '@ElectronAC/src/include/client.lua'
fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Prodigy Studios"
description "Prodigy Studios Housing Loader"
version "1.0.0"

shared_script "@ox_lib/init.lua"

client_scripts {
    "client/main.lua",
    "houses/*.lua",
}

escrow_ignore {
    "houses/*.lua",
    "client/main.lua"
}
dependency '/assetpacks'
