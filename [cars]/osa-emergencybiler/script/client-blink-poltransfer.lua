local vehicleHash = `poltransfer`

-- Gør det muligt at skifte i mellem blink pattern for blink på taget ved brug af knappen G (Kan self altid ændres)

RegisterKeyMapping('sirenpattern-kuppel-transfer', 'Skift blink pattern for blink på taget', 'keyboard', 'g')

RegisterCommand('sirenpattern-kuppel-transfer', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        if GetEntityModel(vehicle) == vehicleHash then
            SetVehicleAutoRepairDisabled(vehicle, true)
            local dict = "veh@driveby@first_person@driver@1h"
            local anim = "outro_90r"
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, dict, anim, 2.0, -2.0, -1, 50, 0, false, false, false)
            if IsVehicleExtraTurnedOn(vehicle, 1) == 1 then
                SetVehicleExtra(vehicle, 1, true)
                SetVehicleExtra(vehicle, 2, false)
            else 
                SetVehicleExtra(vehicle, 1, false)
                SetVehicleExtra(vehicle, 2, true)
            end
            Citizen.Wait(100)
            StopAnimTask(playerPed, dict, anim, 1.0)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= 0 then
            if GetEntityModel(vehicle) == vehicleHash then
                if IsVehicleSirenOn(vehicle) == false then
                    if IsVehicleExtraTurnedOn(vehicle, 1) == 1 and IsVehicleExtraTurnedOn(vehicle, 2) == 1 then
                        SetVehicleExtra(vehicle, 2, true)
                    end
                    if IsVehicleExtraTurnedOn(vehicle, 1) == false and IsVehicleExtraTurnedOn(vehicle, 2) == false then
                        if math.random(1, 2) == 1 then
                            SetVehicleExtra(vehicle, 1, false)
                        else
                            SetVehicleExtra(vehicle, 2, false)
                        end
                    end
                end
            end
        end 
    end
end)