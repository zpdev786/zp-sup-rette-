local ESX = exports['es_extended']:getSharedObject()

-- Spawn des peds + ox_target + blip
CreateThread(function()
    for i, coords in ipairs(Config.PosLiquor) do
        local model = joaat(Config.PedModel)
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(10) end

        local ped = CreatePed(0, model, coords.xyz, coords.w, false, true)
        SetEntityInvincible(ped, Config.PedInvincible)
        FreezeEntityPosition(ped, Config.PedFrozen)
        SetBlockingOfNonTemporaryEvents(ped, true)

        if Config.UseOxTarget then
            exports.ox_target:addLocalEntity(ped, {
                {
                    name = 'shop_' .. i,
                    icon = 'fa-solid fa-shop',
                    label = Config.all.titletarget,
                    onSelect = function()
                        OpenLiqMenu()
                    end
                }
            })
        else
            -- Notification "Appuyez sur E"
    local inZone = false

    lib.zones.sphere({
        coords = coords.xyz,
        radius = 2.5,
        debug = false,
        onEnter = function()
            inZone = true
            lib.showTextUI('[E] - ' .. Config.all.titleliquor, {
                position = Config.all.placenotif,
                icon = 'fa-solid fa-hand-point-right',
                style = {
                    borderRadius = 0,
                    backgroundColor = Config.all.colornotif,
                    color = 'white'
                }
            })
        end,
        onExit = function()
            inZone = false
            lib.hideTextUI()
        end
    })

    CreateThread(function()
        while true do
            Wait(0)
            if inZone and IsControlJustPressed(0, 38) then -- E
                OpenLiqMenu()
            end
        end
    end)
end

        if Config.ShowBlips then
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, Config.Blip.liq) -- Magasin
                SetBlipDisplay(blip, Config.Blip.affichage)
                SetBlipScale(blip, Config.Blip.tailleliq)
                SetBlipColour(blip, Config.Blip.couleurliq)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.all.title)
                EndTextCommandSetBlipName(blip)
        end
    end
end)


-- Ouvre le menu de sélection d'items
function OpenLiqMenu()
    local options = {}

    for _, item in pairs(Config.Liquoritem) do
        table.insert(options, {
            title = item.label,
            description = string.format("%s\nPrix unitaire : %s$", item.description, item.price ),
            icon = 'box',
            onSelect = function()
                OpenQuantityMenu(item)
            end
        })
    end

    lib.registerContext({
        id = 'zejay_liquor',
        title = Config.all.title,
        options = options
    })

    lib.showContext('zejay_liquor')
end

-- Ouvre le menu pour choisir la quantité
function OpenQuantityMenu(item)
    local input = lib.inputDialog(('Acheter : %s'):format(item.label), {
        {
            type = 'number',
            label = 'Quantité',
            description = 'Combien voulez-vous en acheter ?',
            required = true,
            icon = 'hashtag',
            min = 1
        }
    })

    if input and input[1] then
        local quantity = tonumber(input[1])
        if quantity and quantity > 0 then
            TriggerServerEvent('zejay:buyItem', item.name, quantity)
        else
            lib.notify({
                title = 'Erreur',
                description = 'Quantité invalide.',
                type = 'error'
            })
        end
    end
end
