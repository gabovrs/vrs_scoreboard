fx_version 'adamant'

game 'gta5'

client_scripts {
    "client.lua"
}

server_scripts {
    "server.lua"
}

ui_page {
	'html/index.html'
}

files {
	'html/*',
    'html/fonts/*'
}

shared_script '@es_extended/imports.lua'