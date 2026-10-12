fx_version 'cerulean'

game 'gta5'

author 'Gabz'

description 'Mapdata'

version '1.0.4'

lua54 'yes'

this_is_a_map 'yes'

dependencies { 

    '/server:4960',
    '/gameBuild:2545',
}

files {

    'gabz_timecycle_mods1.xml',

    'cfx-gabz-mapdata_cache_y.dat'

}

data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods1.xml'

client_script {

    'gabz_entityset_mods1.lua',

    'gabz_ipl_blockers.lua',

}

server_scripts {



}

escrow_ignore {

    'gabz-doorlocks/*.lua',

    'gabz_entityset_mods1.lua',

}

dependency '/assetpacks'