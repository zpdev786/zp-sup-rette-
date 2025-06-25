local ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('zejay:buyItem')
AddEventHandler('zejay:buyItem', function(itemName, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemConfig = nil

    for _, v in pairs(Config.Items) do
        if v.name == itemName then
            itemConfig = v
            break
        end
    end

            for _, v in pairs(Config.Liquoritem) do
        if v.name == itemName then
            itemConfig = v
            break
        end
    end

    if not itemConfig then return end

    local totalPrice = itemConfig.price * quantity

if xPlayer.getMoney() >= totalPrice then
    xPlayer.removeMoney(totalPrice)
    exports.ox_inventory:AddItem(source, itemName, quantity)

    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Achat réussi',
        description = ("Vous avez acheté %d x %s pour %d$"):format(quantity, itemConfig.label, totalPrice),
        type = 'success'
    })

    local playerName = GetPlayerName(source)
    local discordTag = GetDiscordName(source)
    SendDiscordLog("✅ Achat en boutique", ("**%s** (%s)\na acheté **%d x %s** pour **%d$**."):format(playerName, discordTag, quantity, itemConfig.label, totalPrice), 5763719)

else
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Achat échoué',
        description = 'Vous n\'avez pas assez d\'argent.',
        type = 'error'
    })

    local playerName = GetPlayerName(source)
    local discordTag = GetDiscordName(source)
    SendDiscordLog("❌ Achat refusé", ("**%s** (%s)\na tenté d’acheter **%d x %s** pour **%d$** sans avoir assez d’argent."):format(playerName, discordTag, quantity, itemConfig.label, totalPrice), 15158332)
end
end)

function GetDiscordName(src)
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if id:match("discord:") then
            return "<@" .. id:gsub("discord:", "") .. ">"
        end
    end
    return "Inconnu"
end

function SendDiscordLog(title, description, color)
    local embed = {{
        title = title,
        description = description,
        color = color or 3066993,
        footer = { text = os.date('%d/%m/%Y • %H:%M:%S') }
    }}

    PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({
        username = "🛒 Logs ZP SHOP",
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end
