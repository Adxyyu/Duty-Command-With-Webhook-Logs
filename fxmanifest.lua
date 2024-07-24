fx_version 'cerulean'
game 'gta5'

name 'dutyscript'
description '/duty script with discord webhooks.'
author 'Phoenixx1225'
version '1.0.0'

-- Specify the scripts used
server_script 'server.lua'
server_script 'config.lua'
client_script 'client.lua'

dependencies {
    'mythic_notify'
}
