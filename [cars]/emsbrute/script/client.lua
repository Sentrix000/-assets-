local vehicleHash = `emsbrute`
local isextra8theonlylight = nil

-- Gør det muligt at tænde det udvendige arbejdslys på ambulanen ved brug af knappen G (Kan self altid ændres)

RegisterKeyMapping('ambulance-worklights', 'Tænd/sluk arbejdslys på ambulancen', 'keyboard', 'g')

RegisterCommand('ambulance-worklights', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        if GetEntityModel(vehicle) == vehicleHash then
            SetVehicleAutoRepairDisabled(vehicle, true)
            if IsVehicleExtraTurnedOn(vehicle, 8) == 1 then
                if isextra8theonlylight then
                    SetVehicleSiren(vehicle, false)
                    SetVehicleExtra(vehicle, 1, false)
                    SetVehicleExtra(vehicle, 2, false)
                    SetVehicleExtra(vehicle, 3, false)
                    SetVehicleExtra(vehicle, 4, false)
                    SetVehicleExtra(vehicle, 5, false)
                    SetVehicleExtra(vehicle, 6, false)
                    SetVehicleExtra(vehicle, 7, false)
                    SetVehicleExtra(vehicle, 8, true)
                    isextra8theonlylight = nil
                else
                    SetVehicleExtra(vehicle, 8, true)
                end
            else
                if IsVehicleSirenOn(vehicle) then
                    SetVehicleExtra(vehicle, 8, false)
                else
                    SetVehicleExtra(vehicle, 1, true)
                    SetVehicleExtra(vehicle, 2, true)
                    SetVehicleExtra(vehicle, 3, true)
                    SetVehicleExtra(vehicle, 4, true)
                    SetVehicleExtra(vehicle, 5, true)
                    SetVehicleExtra(vehicle, 6, true)
                    SetVehicleExtra(vehicle, 7, true)
                    SetVehicleExtra(vehicle, 8, false)
                    SetVehicleSiren(vehicle, true)
                    isextra8theonlylight = true
                end
            end
        end
    end
end)

-- Sikre så de blå blink altid kan tændes, uden først at slå arbejdslyset fra

CreateThread(function()
    while true do
        Wait(500)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then
            if GetEntityModel(vehicle) == vehicleHash then
                if IsVehicleSirenOn(vehicle) == false and IsVehicleExtraTurnedOn(vehicle, 8) == 1 then
                    SetVehicleExtra(vehicle, 1, false)
                    SetVehicleExtra(vehicle, 2, false)
                    SetVehicleExtra(vehicle, 3, false)
                    SetVehicleExtra(vehicle, 4, false)
                    SetVehicleExtra(vehicle, 5, false)
                    SetVehicleExtra(vehicle, 6, false)
                    SetVehicleExtra(vehicle, 7, false)
                    SetVehicleExtra(vehicle, 8, true)
                    isextra8theonlylight = nil
                elseif IsVehicleSirenOn(vehicle) == false and IsVehicleExtraTurnedOn(vehicle, 7) == false then
                    SetVehicleExtra(vehicle, 1, false)
                    SetVehicleExtra(vehicle, 2, false)
                    SetVehicleExtra(vehicle, 3, false)
                    SetVehicleExtra(vehicle, 4, false)
                    SetVehicleExtra(vehicle, 5, false)
                    SetVehicleExtra(vehicle, 6, false)
                    SetVehicleExtra(vehicle, 7, false)
                    SetVehicleExtra(vehicle, 8, true)
                    SetVehicleExtra(vehicle, 12, false) -- Fjern denne linje hvis I ikke ønsker at båren skal spawne som default
                end
            end
        end
    end
end)