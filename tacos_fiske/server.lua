-- Created by Taco
-- Created by Taco
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "tacos_kokainselger") 
vRP = Proxy.getInterface("vRP")

RegisterServerEvent("fisk")
AddEventHandler("fisk", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local reward = math.random(1,5)
    if vRP.hasGroup({user_id, "user"}) then
        vRP.giveInventoryItem({user_id,"fisk",reward,true})
        TriggerClientEvent("retwerfwertwer")
    end
end)

RegisterServerEvent("solg1234")
AddEventHandler("solg1234", function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasInventoryItem({user_id, "fisk", 1, false}) then
        vRP.giveMoney({user_id, 100})
        vRP.tryGetInventoryItem({user_id,"fisk",1})
        TriggerClientEvent("pNotify:SendNotification", source,{text = 'Du modtog 100kr!', type = "success", queue = "global", timeout = 5, layout = "Bottom",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end)

vRP.defInventoryItem({"fisk","Fisk","Kan sælges",
function(args)
    local choices = {}
    choices["> Smid ud"] = {function(player,choice)
        local user_id = vRP.getUserId({player})
        if user_id ~= nil then
                if vRP.hasInventoryItem({user_id, "fisk", 1, false}) then
                    TriggerClientEvent('ertwergwerfwerfgwerg', source)
                else
                    TriggerClientEvent("pNotify:SendNotification", player,{text = "<center>Du har ikke en fisk", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})        
            end
        vRP.closeMenu({player})
    end
end,"sælg"}

return choices
end, 0.5
})