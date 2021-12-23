fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua',
    '@qb-core/import.lua'
}

client_scripts {
	'client/main.lua',
	'client/garage.lua',
	'client/menus.lua'
}

server_script 'server/*.lua'
