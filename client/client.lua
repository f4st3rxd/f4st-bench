CreateThread(function()
    local sleep = 2000

    while true do 
        local EntityCoords = GetEntityCoords(PlayerPedId())

        for k , v in pairs(StandCoords) do 
            local dist = #(EntityCoords - v.coords) 

            if dist <= 3 then 
                sleep = 1
                ShowFloatingHelpNotification(BenchText, v.coords, 2.0)

                if dist <= 2 then 
                    if IsControlJustPressed(0, 38) then 
                        OpenJobStand(v.name)
                    end
                end
            else 
                sleep = 2000
            end
        end
        Wait(sleep)
    end
end)

function OpenJobStand(stand)
    TriggerServerEvent("f4st-stand:RegisterStash", "Tezgah_".. stand) 
    exports.ox_inventory:openInventory('stash',"Tezgah_".. stand)
end

function ShowFloatingHelpNotification(msg, coords,r)
    AddTextEntry('FloatingHelpNotification'..'_'..r, msg)
    SetFloatingHelpTextWorldPosition(1, coords.x,coords.y,coords.z + 0.2)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('FloatingHelpNotification'..'_'..r)
    EndTextCommandDisplayHelp(2, false, false, -1)
end
