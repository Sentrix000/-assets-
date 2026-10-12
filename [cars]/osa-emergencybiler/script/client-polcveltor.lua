local vehicleHash = `polcveltor`

-- Gør det muligt at tilføje/fjerne blink på taget ved brug af knappen G (Kan self altid ændres)

RegisterKeyMapping('polcveltor-kuppel', 'Tilføj/fjern blink på taget af civil politi bil.', 'keyboard', 'g')

RegisterCommand('polcveltor-kuppel', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        if GetEntityModel(vehicle) == vehicleHash then
            local dict = "veh@driveby@first_person@driver@throw"
            local anim = "throw_180r"
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, dict, anim, 2.0, -2.0, -1, 50, 0, false, false, false)
            SetVehicleAutoRepairDisabled(vehicle, true)
            RollDownWindow(vehicle, 0)
            Citizen.Wait(300)
            if IsVehicleExtraTurnedOn(vehicle, 1) == 1 then
                SetVehicleExtra(vehicle, 1, true)
            else 
                SetVehicleExtra(vehicle, 1, false)
            end
            Citizen.Wait(430)
            RollUpWindow(vehicle, 0)
            StopAnimTask(playerPed, 'veh@driveby@first_person@driver@throw', 'throw_180r', 1.0)
        end
    end
end)