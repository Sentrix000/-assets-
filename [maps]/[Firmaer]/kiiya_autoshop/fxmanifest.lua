
fx_version 'bodacious'
game 'gta5'
description 'AutoShop: Los Santos v1.0.'

this_is_a_map 'yes'
lua54 'yes'


data_file 'TIMECYCLEMOD_FILE' 'kiiya_timecycle.xml'
data_file 'AUDIO_GAMEDATA' 'autoshop_game.dat'

files {
  'kiiya_timecycle.xml',
  'autoshop_game.dat151.rel',
}

client_scripts {
    'config.lua',
    'client.lua'
}
dependency '/assetpacks'