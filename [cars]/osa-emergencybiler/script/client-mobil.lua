--- Gør så der er collision på liften, når den er kørt ned

local vehicleHash = "emsmobil"



Citizen.CreateThread(function()
  local disableH = false
  local playerPed
  local lastVehicle = nil
    while true do
        Citizen.Wait(0)
        letSleep = true
        playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local model = GetEntityModel(vehicle)
            if model == GetHashKey(vehicleHash) then
              letSleep = false
                DisableControlAction(0, 101, true)
                if IsControlJustPressed(0, 73) then
                  if IsVehicleStopped(vehicle) then
                    local state = GetConvertibleRoofState(vehicle)
                    SetVehicleAutoRepairDisabled(vehicle, false)
                    if state == 0 or state == 3 then
                        LowerConvertibleRoof(vehicle)
                        SetVehicleExtra(vehicle, 12, false)
                        SetVehicleExtra(vehicle, 11, true)
                        FreezeVehicleIn7Seconds(vehicle)
                    else
                        RaiseConvertibleRoof(vehicle)
                        FreezeVehicleIn10Seconds(vehicle)
                    end
                  else
                    ShowNotification("~o~~h~Ambulance:~n~~s~Køretøjet skal holde stille, for at køre liften ned/op.")
                  end
                end
            end
        end
        if letSleep then
          Wait(500)
        end
    end
end)

function FreezeVehicleIn7Seconds(vehicle)
	FreezeEntityPosition(vehicle, true)
    Wait(7000)
	FreezeEntityPosition(vehicle, false)
end

function FreezeVehicleIn10Seconds(vehicle)
	FreezeEntityPosition(vehicle, true)
    Wait(10000)
	FreezeEntityPosition(vehicle, false)
    SetVehicleExtra(vehicle, 12, true)
    SetVehicleExtra(vehicle, 11, false)
end

-- Gør det muligt at tænde det udvendige arbejdslys ved brug af knappen G (Kan self altid ændres)

local isextra2theonlylight = nil

RegisterKeyMapping('emsmobil-worklights', 'Tænd/sluk arbejdslys på ambulance lastbil', 'keyboard', 'g')

RegisterCommand('emsmobil-worklights', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        if GetEntityModel(vehicle) == `emsmobil` then
            if IsVehicleExtraTurnedOn(vehicle, 2) == 1 then
                if isextra2theonlylight then
                    SetVehicleSiren(vehicle, false)
                    SetVehicleExtra(vehicle, 1, false)
                    SetVehicleExtra(vehicle, 2, true)
                    SetVehicleExtra(vehicle, 3, false)
                    SetVehicleExtra(vehicle, 4, false)
                    isextra2theonlylight = nil
                else
                    SetVehicleExtra(vehicle, 2, true)
                end
            else
                if IsVehicleSirenOn(vehicle) then
                    SetVehicleExtra(vehicle, 2, false)
                else
                    SetVehicleExtra(vehicle, 1, true)
                    SetVehicleExtra(vehicle, 2, false)
                    SetVehicleExtra(vehicle, 3, true)
                    SetVehicleExtra(vehicle, 4, true)
                    SetVehicleSiren(vehicle, true)
                    isextra2theonlylight = true
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
            if GetEntityModel(vehicle) == `emsmobil` then
                if IsVehicleSirenOn(vehicle) == false and IsVehicleExtraTurnedOn(vehicle, 2) == 1 then
                    SetVehicleExtra(vehicle, 1, false)
                    SetVehicleExtra(vehicle, 3, false)
                    SetVehicleExtra(vehicle, 4, false)
                    SetVehicleExtra(vehicle, 2, true)
                    isextra2theonlylight = nil
                end
                if IsVehicleSirenOn(vehicle) == false and IsVehicleExtraTurnedOn(vehicle, 1) == 1 then
                    if IsVehicleExtraTurnedOn(vehicle, 3) == false then
                        SetVehicleExtra(vehicle, 3, false)
                    end
                    if IsVehicleExtraTurnedOn(vehicle, 4) == false then
                        SetVehicleExtra(vehicle, 4, false)
                    end
                end
                if GetConvertibleRoofState(vehicle) == 0 then
                    if IsVehicleExtraTurnedOn(vehicle, 12) == 1 then
                        SetVehicleExtra(vehicle, 12, true)
                    end
                    if IsVehicleExtraTurnedOn(vehicle, 11) == false then
                        SetVehicleAutoRepairDisabled(vehicle, false)
                        SetVehicleExtra(vehicle, 11, false)
                    end
                end
            end
        end
    end
end)

---

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
  AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end