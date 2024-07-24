--Ace Perms-- 

Your ace perms would be your department short for example

        sasp = {
            name = "San Andreas State Police",
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },


your ace perms for this would be department.sasp

department.sasp
department.lspd
department.bcso
department.safr
department.dod
department.sadot
department.pub

add_ace group.owner department.sasp allow
add_ace group.owner department.lspd allow
add_ace group.owner department.bcso allow
add_ace group.owner department.dod allow
add_ace group.owner department.sadot allow
add_ace group.owner department.safr allow
add_ace group.owner department.pub allow


--aceperms for kickoffduty--

kick.off.duty
add_ace group.owner kick.off.duty allow



--Web Hooks--

in config.lua you will find discordWebhook = 'Your_WeebHook' you will replace this with the channel webhook you want messages to go into.


--How to add a new department--

To add a new department its very simple all you have to do is add

        sasp = {
            name = "San Andreas State Police",
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },

but if your going to make that your last department you create ensure you remove the "," from "}," if you need any help pls contact me on the forums!


