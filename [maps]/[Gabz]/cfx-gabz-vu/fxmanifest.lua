fx_version 'cerulean'

game 'gta5'

author 'Gabz'

description 'Vanilla Unicorn'

version '1.0.2'

lua54 'yes'

this_is_a_map 'yes'

dependencies { 

    '/server:4960',
    '/gameBuild:2545',
    'cfx-gabz-mapdata',
}

server_scripts {

    'version_check.lua',

}

escrow_ignore {

    'stream/**/*.ytd',

}

dependency '/assetpacks'