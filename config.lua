Config = {
    discordWebhook = 'UR_DISCORD_WEBHOOK',

    departments = {
        sasp = {
            name = "San Andreas State Police",
            ranks = {
                officer = "Trooper",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        lspd = {
            name = "Los Santos Police Department",
            ranks = {
                officer = "Officer",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        bcso = {
            name = "Blaine County Sheriff's Office",
            ranks = {
                deputy = "Deputy",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        fbi = {
            name = "Federal Bureau of Investigation",
            ranks = {
                agent = "Agent",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        dod = {
            name = "Department Of Defense",
            ranks = {
                soldier = "Soldier",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        safr = {
            name = "San Andreas Fire Rescue",
            ranks = {
                firefighter = "Firefighter",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        sadot = {
            name = "San Andreas Department Of Transportation",
            ranks = {
                worker = "Worker",
                supervisor = "Supervisor",
                command = "Command"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_CARBINERIFLE", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = { "WEAPON_COMBATPISTOL" }
        },
        pub = {
            name = "Community Officer",
            ranks = {
                officer = "Officer"
            },
            weapons = {
                { name = "WEAPON_COMBATPISTOL", ammo = 100 },
                { name = "WEAPON_NIGHTSTICK", ammo = 100 },
                { name = "WEAPON_FLASHLIGHT", ammo = 100 }
            },
            restrictedWeapons = {
                "WEAPON_KNIFE",
                "WEAPON_HAMMER",
                "WEAPON_BAT",
                "WEAPON_GOLFCLUB",
                "WEAPON_CROWBAR",
                "WEAPON_BOTTLE",
                "WEAPON_DAGGER",
                "WEAPON_HATCHET",
                "WEAPON_MACHETE",
                "WEAPON_SWITCHBLADE",
                "WEAPON_POOLCUE",
                "WEAPON_WRENCH",
                "WEAPON_BATTLEAXE",
                "WEAPON_STONE_HATCHET",
                "WEAPON_PISTOL",
                "WEAPON_APPISTOL",
                "WEAPON_PISTOL50",
                "WEAPON_REVOLVER",
                "WEAPON_SNSPISTOL",
                "WEAPON_HEAVYPISTOL",
                "WEAPON_VINTAGEPISTOL",
                "WEAPON_MARKSMANPISTOL",
                "WEAPON_MACHINEPISTOL",
                "WEAPON_REVOLVER_MK2",
                "WEAPON_DOUBLEACTION",
                "WEAPON_RAYPISTOL",
                "WEAPON_NAVYREVOLVER",
                "WEAPON_PUMPSHOTGUN",
                "WEAPON_SAWNOFFSHOTGUN",
                "WEAPON_ASSAULTSHOTGUN",
                "WEAPON_BULLPUPSHOTGUN",
                "WEAPON_HEAVYSHOTGUN",
                "WEAPON_DBSHOTGUN",
                "WEAPON_AUTOSHOTGUN",
                "WEAPON_MICROSMG",
                "WEAPON_SMG",
                "WEAPON_ASSAULTSMG",
                "WEAPON_COMBATPDW",
                "WEAPON_MACHINEPISTOL",
                "WEAPON_MINISMG",
                "WEAPON_SMG_MK2",
                "WEAPON_ASSAULTRIFLE",
                "WEAPON_CARBINERIFLE",
                "WEAPON_ADVANCEDRIFLE",
                "WEAPON_SPECIALCARBINE",
                "WEAPON_BULLPUPRIFLE",
                "WEAPON_COMPACTRIFLE",
                "WEAPON_ASSAULTRIFLE_MK2",
                "WEAPON_MG",
                "WEAPON_COMBATMG",
                "WEAPON_SNIPERRIFLE",
                "WEAPON_HEAVYSNIPER",
                "WEAPON_MARKSMANRIFLE",
                "WEAPON_HEAVYSNIPER_MK2",
                "WEAPON_RPG",
                "WEAPON_GUSENBERG",
                "WEAPON_MINIGUN",
                "WEAPON_FIREWORK",
                "WEAPON_HOMINGLAUNCHER",
                "WEAPON_COMPACTLAUNCHER",
                "WEAPON_RAILGUN",
                "WEAPON_GRENADELAUNCHER",
                "WEAPON_GRENADELAUNCHER_SMOKE",
                "WEAPON_PIPEBOMB",
                "WEAPON_PROXMINE",
                "WEAPON_SMOKEGRENADE",
                "WEAPON_STICKYBOMB",
                "WEAPON_RAYCARBINE",
                "WEAPON_PETROLCAN",
                "WEAPON_DIGISCANNER",
                "WEAPON_BRIEFCASE",
                "WEAPON_FLARE"
            }
        }
    }
}
