Config = {}

Config.PedModel = 'mp_m_shopkeep_01' -- Modèle du ped
Config.PedInvincible = true -- false : ped vulnérable | true : ped invincible  
Config.PedFrozen = true  -- false : ped qui bouge | true : ped figé
Config.ShowBlips = true -- false : ne pas afficher le blip | true : afficher le blip
Config.UseOxTarget = false -- true = utilise ox_target / false = interaction E


Config.Blip = {
    shop = 59,
    liq = 93,
    tailleshop = 0.7,
    tailleliq = 0.7,
    affichage = 4,
    couleurshop = 2,
    couleurliq = 2,
}

Config.Webhook = 'https://discord.com/api/webhooks/1383115275502747752/y6GkKWYIbQDYReWOADvtWJIEimyLKAOhrkIaZNQ0N7niU1BtzVnzFh1MzYSc78vRWbak'

Config.all = {
    title = "ZP shop",
    titleliquor = "ZP Liquor Store",
    titletarget = "Ouvrir le magasin",
    colornotif = "#ECA60E",
    placenotif = "left-center", -- left-center | top-center | bottom-center | right-center
}

Config.Pos = {
    vector4(1728.0458, 6415.7505, 34.0364, 267.8789),
    vector4(1697.5361, 4923.1943, 41.0636, 317.7825),
    vector4(1959.4950, 3740.9092, 31.3438, 293.1364),
    vector4(549.2922, 2670.1704, 41.1565, 104.7139),
    vector4(2677.4617, 3279.6541, 54.2411, 328.3778),
    vector4(2556.7126, 380.7816, 107.6229, 7.2701),
    vector4(372.6621, 327.0461, 102.5663, 276.8656),
    vector4(24.4516, -1345.5632, 28.4970, 272.2596),
    vector4(-3039.7695, 584.1664, 6.9089, 11.3266),
    vector4(-3243.3833, 1000.0231, 11.8307, 3.7503),
}

Config.PosLiquor = {
    	vector4(1134.1390380859, -982.40930175781, 45.415767669678, 283.23358154297),
		vector4(-1221.8499755859, -908.34899902344, 11.326364517212, 40.984176635742),
	    vector4(-1485.9932861328, -378.19470214844, 39.163379669189, 135.09245300293),
		vector4(-2966.4211425781, 390.25509643555, 14.043318748474, 79.843017578125),
		vector4(1166.2260742188, 2710.8679199219, 37.157649993896, 191.55827331543),
		vector4(1392.0734863281, 3606.1979980469, 33.980869293213, 203.90498352051),
		vector4(-1392.0080566406, -605.20770263672, 29.31880569458, 119.36877441406),
}

-- Items disponibles
Config.Items = {
    {
        name = 'bread', -- Nom de l'item 
        label = 'Pain', -- Nom d'affichage dans le menu
        description = 'Un bon morceau de pain', -- pas besoin d'expliqué je pense 
        price = 10 -- pareil mdr 
    },
    {
        name = 'water',
        label = 'Bouteille d\'eau',
        description = 'Pour rester hydraté',
        price = 5
    },
        {
        name = 'water',
        label = 'ZeJay',
        description = 'ZP DEV',
        price = 5
    },
}

Config.Liquoritem = {
    {
        name = 'cola', -- Nom de l'item 
        label = 'Cola', -- Nom d'affichage dans le menu
        description = 'Cola bien frais chakal', -- pas besoin d'expliqué je pense 
        price = 10 -- pareil mdr 
    },
    {
        name = 'water',
        label = 'Bouteille d\'eau',
        description = 'Pour rester hydraté',
        price = 5
    },
    
}