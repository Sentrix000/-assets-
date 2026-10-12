
fx_version 'cerulean'
game 'gta5'
author 'Nordic Mods'
lua54 'yes'

files {
    'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
    'handling.meta',
}

client_scripts {
    "script/client.lua"
}

escrow_ignore {
    "script/*.lua"
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
dependency '/assetpacks'