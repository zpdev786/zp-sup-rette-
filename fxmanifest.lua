fx_version 'cerulean'
lua54 'yes'
game 'gta5'

description 'Shop full configurable de A à Z par ZeJay de chez ZP Développement'
author 'ZeJay | ZP Dev'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependency {
    'es_extended',
    'ox_lib',
    'ox_inventory',
    'ox_target'
}
