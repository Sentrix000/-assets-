fx_version 'cerulean'

game 'gta5'

author 'Gabz '

description 'PDM '

version '1.0.2'

lua54 'yes'

this_is_a_map 'yes'

dependencies { 

    '/server:4960',
    '/gameBuild:2545',
    'cfx-gabz-mapdata',
}

files {

    'cfx-gabz-pdm_cache_y.dat'

}

server_scripts {



}

escrow_ignore {

    'stream/**/*.ytd',

    'stream/vanilla/*.*',

    'stream/ydr/gabz_pdm_flag1.yft',

    'stream/ydr/gabz_pdm_flag2.yft',

}

dependency '/assetpacks'