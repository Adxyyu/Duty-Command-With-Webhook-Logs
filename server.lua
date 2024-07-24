local cfg = Config
local dutyCommand = "duty"
local kickOffDutyCommand = "kickoffduty"

function SendNotify(source, message, type)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, {
        type = type,
        text = message,
        length = 2500,
        style = { ['background-color'] = '#1e87f0', ['color'] = '#ffffff' }
    })
end

function GiveDutyWeapons(playerId, department)
    local deptInfo = Config.departments[department]
    if deptInfo then
        for _, weapon in ipairs(deptInfo.weapons) do
            GiveWeaponToPed(GetPlayerPed(playerId), GetHashKey(weapon.name), weapon.ammo, false, false)
        end
    else
        SendNotify(playerId, "Invalid department.", "error")
    end
end

function HasPermission(playerId, permission)
    return IsPlayerAceAllowed(playerId, permission)
end

local playerDuty = {}

function GetDiscordId(playerId)
    local identifiers = GetPlayerIdentifiers(playerId)
    for _, identifier in ipairs(identifiers) do
        if string.find(identifier, "discord:") then
            return string.sub(identifier, 9)
        end
    end
    return nil
end

function DiscordMention(discordId)
    return "<@" .. discordId .. ">"
end

function SendToDiscord(webhook, gameName, playerName, action, department, callsign, duration, discordId)
    local mention = DiscordMention(discordId)
    local actionText = action == "gone off" and "gone off duty" or "gone on duty"
    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "Duty Log",
            ["description"] = string.format("%s **%s** has %s as %s with callsign (%s)", mention, gameName, actionText, department, callsign),
            ["footer"] = {
                ["text"] = string.format("Timestamp: %s", os.date("%Y-%m-%d %H:%M:%S")),
            }
        }
    }
    if action == "gone off" then
        embed[1].description = string.format("%s **%s** has gone off duty as %s after %d minutes", mention, gameName, department, duration)
    end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand(dutyCommand, function(source, args)
    local department = args[1] and args[1]:lower()
    local callsign = args[2] or "Unknown"
    local playerId = source

    if department then
        local deptInfo = Config.departments[department]
        if deptInfo then
            if HasPermission(playerId, 'department.' .. department .. '.officer') then
                if not playerDuty[playerId] or not playerDuty[playerId].isInDuty then
                    playerDuty[playerId] = {
                        isInDuty = true,
                        dutyStart = os.time(),
                        department = department,
                        callsign = callsign
                    }
                    GiveDutyWeapons(playerId, department)
                    SendNotify(playerId, "You are now on duty as " .. deptInfo.name .. " (" .. callsign .. ")", "success")
                    local discordId = GetDiscordId(playerId)
                    SendToDiscord(Config.discordWebhook, GetPlayerName(playerId), GetPlayerName(playerId), "gone on", deptInfo.name, callsign, nil, discordId)
                else
                    local dutyDuration = os.difftime(os.time(), playerDuty[playerId].dutyStart)
                    local minutes = math.floor(dutyDuration / 60)
                    SendNotify(playerId, "You are now off duty after " .. minutes .. " minutes", "error")
                    local discordId = GetDiscordId(playerId)
                    SendToDiscord(Config.discordWebhook, GetPlayerName(playerId), GetPlayerName(playerId), "gone off", deptInfo.name, playerDuty[playerId].callsign, minutes, discordId)
                    playerDuty[playerId] = {
                        isInDuty = false,
                        dutyStart = 0,
                        department = nil,
                        callsign = nil
                    }
                    RemoveAllPedWeapons(GetPlayerPed(playerId), true)
                end
            else
                SendNotify(playerId, "You do not have permission to go on duty for " .. deptInfo.name, "error")
            end
        else
            SendNotify(playerId, "Invalid department.", "error")
        end
    else
        if playerDuty[playerId] and playerDuty[playerId].isInDuty then
            local dutyDuration = os.difftime(os.time(), playerDuty[playerId].dutyStart)
            local minutes = math.floor(dutyDuration / 60)
            SendNotify(playerId, "You are now off duty after " .. minutes .. " minutes", "error")
            local discordId = GetDiscordId(playerId)
            SendToDiscord(Config.discordWebhook, GetPlayerName(playerId), GetPlayerName(playerId), "gone off", playerDuty[playerId].department, playerDuty[playerId].callsign, minutes, discordId)
            playerDuty[playerId] = {
                isInDuty = false,
                dutyStart = 0,
                department = nil,
                callsign = nil
            }
            RemoveAllPedWeapons(GetPlayerPed(playerId), true)
        else
            SendNotify(playerId, "Usage: " .. dutyCommand .. " (department) (callsign)", "error")
        end
    end
end, false)

RegisterCommand('dutytime', function(source, args)
    local playerId = source
    if playerDuty[playerId] and playerDuty[playerId].isInDuty then
        local dutyStart = playerDuty[playerId].dutyStart
        local currentTime = os.time()
        local dutyDuration = os.difftime(currentTime, dutyStart)
        local minutes = math.floor(dutyDuration / 60)
        local seconds = dutyDuration % 60
        SendNotify(playerId, string.format("You have been on duty for %d minutes and %d seconds.", minutes, seconds), "info")
    else
        SendNotify(playerId, "You are currently not on duty.", "error")
    end
end, false)

RegisterCommand(kickOffDutyCommand, function(source, args)
    local playerId = source
    local department = playerDuty[playerId] and playerDuty[playerId].department

    if department then
	if HasPermission(playerId, 'kick.off.duty') then
            local targetPlayer = tonumber(args[1])
            local targetPlayerDuty = playerDuty[targetPlayer]
            if targetPlayerDuty and targetPlayerDuty.isInDuty then
                local dutyDuration = os.difftime(os.time(), targetPlayerDuty.dutyStart)
                local minutes = math.floor(dutyDuration / 60)
                SendNotify(targetPlayer, "You have been kicked off duty by a supervisor.", "error")
                local discordId = GetDiscordId(targetPlayer)
                SendToDiscord(Config.discordWebhook, GetPlayerName(targetPlayer), GetPlayerName(targetPlayer), "gone off", targetPlayerDuty.department, targetPlayerDuty.callsign, minutes, discordId)
                playerDuty[targetPlayer] = {
                    isInDuty = false,
                    dutyStart = 0,
                    department = nil,
                    callsign = nil
                }
                RemoveAllPedWeapons(GetPlayerPed(targetPlayer), true)
                SendNotify(playerId, "You have kicked " .. GetPlayerName(targetPlayer) .. " off duty.", "success")
            else
                SendNotify(playerId, "Player is not on duty.", "error")
            end
        else
            SendNotify(playerId, "You do not have permission to use this command.", "error")
        end
    else
        SendNotify(playerId, "You are not on duty.", "error")
    end
end, false)


function RemoveRestrictedWeapons(playerId, department)
    local ped = GetPlayerPed(playerId)
    local currentWeapon = GetSelectedPedWeapon(ped)
    local deptInfo = Config.departments[department]
    if deptInfo then
        for _, weaponInfo in ipairs(deptInfo.restrictedWeapons) do
            local restrictedWeaponHash = GetHashKey(weaponInfo)
            if currentWeapon == restrictedWeaponHash then
                RemoveWeaponFromPed(ped, restrictedWeaponHash)
                SendNotify(playerId, "The use of this weapon is restricted while on duty.", "error")
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for playerId, dutyInfo in pairs(playerDuty) do
            if dutyInfo.isInDuty then
                RemoveRestrictedWeapons(playerId, dutyInfo.department)
            end
        end
    end
end)
