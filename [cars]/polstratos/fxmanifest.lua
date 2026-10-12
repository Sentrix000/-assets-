fx_version 'cerulean'
game 'gta5'
author 'Nordic Mods'
lua54 'yes'
version '1.0.0'

files {
    'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
    'handling.meta',
}

client_scripts {
    'script/client-blink.lua'
}

escrow_ignore {
    'script/client-blink.lua'
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
dependency '/assetpacks'