-- Created by Taco
-- Created by Taco
erigang = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Ped = GetPlayerPed(-1)
        if erigang == true then
                if GetDistanceBetweenCoords(GetEntityCoords(Ped),-353.3889465332,-2265.4453125,7.6081833839417,true) <= 2 then
                    DrawText3D(-353.3889465332,-2265.4453125,7.6081833839417,"~w~Tryk [~b~E~w~] for at sælge 1 fisk")
                    DrawMarker(1, -353.3889465332,-2265.4453125,6.6081833839417, 0, 0, 0, 0, 0, 100.0, 2.4, 2.4, 2.4, 0, 228, 255, 155, 0, 0, 2, 2, 0, 0, 0)
                    if IsControlJustPressed(1, 38) then
                        TriggerServerEvent("solg1234")
                    end
                end
            end
        end
    end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Ped = GetPlayerPed(-1)
        local coordsMe = GetEntityCoords(GetPlayerPed(Ped), false)
        if erigang == true then
                if GetDistanceBetweenCoords(GetEntityCoords(Ped),-350.91387939453,-2242.3664550781,7.0081504821777,true) <= 5 then
                    DrawText3D(-350.91387939453,-2242.3664550781,7.6081504821777, "~w~Tryk [~r~E~w~] for at fiske")
                    DrawMarker(1, -350.91387939453,-2242.3664550781,6.6081504821777, 0, 0, 0, 0, 0, 100.0, 7.4, 7.4, 7.4, 0, 228, 255, 155, 0, 0, 2, 2, 0, 0, 0)
                    if IsControlJustPressed(1, 38) then
                        RequestAnimDict("mp_common")
            while not HasAnimDictLoaded('mp_common') do
                Citizen.Wait(100)
            end
 
            TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_FISHING', 0, true)
            exports['progressBars']:startUI(10000, "fisker....")
            Citizen.Wait(10000)
            ClearPedTasksImmediately(GetPlayerPed(-1))
                        TriggerServerEvent("fisk")
                    end
                end
            end
        end
    end)


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

    local npc = {
      {-353.3889465332,-2265.4453125,6.6081833839417,"sælger",15.15406799316,0x62018559,"s_m_y_airworker"},
    }
    
    Citizen.CreateThread(function()
    
      for k,v in pairs(npc) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
          Wait(1)
        end
    
        RequestAnimDict("timetable@amanda@ig_3")
        while not HasAnimDictLoaded("timetable@amanda@ig_3") do
          Wait(1)
        end
        ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(ped, v[5])
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskPlayAnim(ped,"timetable@amanda@ig_3","ig_3_base_tracy", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
      end
    end)

    RegisterCommand("KS:getCoordsH", function(source,args)
        print(GetEntityCoords(PlayerPedId()).." "..GetEntityHeading(PlayerPedId()))
    end)
