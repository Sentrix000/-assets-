fx_version 'cerulean'
game 'gta5'
author 'ONX'
description 'WiseGuy Civilian Vehicles Pack'
version '2.0.1'
lua54 'yes'

data_file 'AUDIO_GAMEDATA' 'audioconfig/onxcustom_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/nsandstorm_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/tfbison_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/tftowstorm_game.dat'

data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'WEAPONINFO_FILE' 'data/vehicleweapons.meta'
data_file 'CARCOLS_FILE' 'data/carcols_sirens.meta'

files {
   'audioconfig/*.dat10',
   'audioconfig/*.dat10.rel',
   'audioconfig/*.dat16',
   'audioconfig/*.dat16.rel',
   'audioconfig/*.dat151',
   'audioconfig/*.dat151.rel',
   'audioconfig/*.dat54',
   'audioconfig/*.dat54.rel',
   'sfx/**/*.awc',
  'data/*.meta'
}

client_script 'data/vehicle_names.lua'