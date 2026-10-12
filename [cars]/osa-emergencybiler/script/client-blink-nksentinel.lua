-- nksentinel — blink i grillen via extras.
--
-- Bilen har extra_1 til extra_6 i modellen, men der laa ingen scriptfil for
-- den. Paa den her server er der ingen generel extras-menu: hver politibil har
-- sin egen fil her i mappen, og uden en fil er der ingen maade at taende
-- extras paa. Derfor "virkede extra-funktionerne ikke".
--
-- Selve udrykningslyset (lygtebom, siren1-20) koerer gennem carcols' siren-
-- opsaetning og har intet med det her at goere — det er kun de extras der er
-- monteret paa bilen.

local vehicleHash = `nksentinel`

-- Hvilke extras der taendes/slukkes med tasten.
--
-- Modellen har seks, og hvilken der er grillen kan kun ses i spillet. Brug
-- /nkextra <1-6> til at taende dem én ad gangen, find grillen, og skriv
-- nummeret ind her — saa rammer tasten praecis den.
local BLINK_EXTRAS = { 1, 2, 3, 4, 5, 6 }

local function inNkSentinel()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return nil end
    if GetEntityModel(veh) ~= vehicleHash then return nil end
    return veh
end

-- SetVehicleExtra's anden parameter er "skal den vaere SLUKKET" — false taender.
local function setExtra(veh, id, on)
    SetVehicleExtra(veh, id, not on)
end

RegisterKeyMapping('nksentinel-blink', 'Blink i grillen (Sentinel)', 'keyboard', 'h')

RegisterCommand('nksentinel-blink', function()
    local veh = inNkSentinel()
    if not veh then return end

    SetVehicleAutoRepairDisabled(veh, true)

    -- Er bare én af dem taendt, slukker vi dem alle. Ellers taendes de.
    local anyOn = false
    for _, id in ipairs(BLINK_EXTRAS) do
        if IsVehicleExtraTurnedOn(veh, id) == 1 then anyOn = true break end
    end

    for _, id in ipairs(BLINK_EXTRAS) do
        setExtra(veh, id, not anyOn)
    end
end, false)

-- Findehjaelp: taend/sluk én extra ad gangen, saa man kan se hvad der sidder
-- hvor. Kan fjernes naar BLINK_EXTRAS er sat rigtigt.
RegisterCommand('nkextra', function(_, args)
    local veh = inNkSentinel()
    if not veh then
        return lib and lib.notify and lib.notify({
            type = 'error', description = 'Du sidder ikke i en nksentinel.' })
    end

    local id = tonumber(args[1])
    if not id or id < 1 or id > 12 then
        return lib and lib.notify and lib.notify({
            type = 'error', description = 'Brug: /nkextra <1-12>' })
    end

    local on = IsVehicleExtraTurnedOn(veh, id) == 1
    SetVehicleAutoRepairDisabled(veh, true)
    setExtra(veh, id, not on)

    if lib and lib.notify then
        lib.notify({
            type = 'inform',
            description = ('Extra %d %s'):format(id, on and 'slukket' or 'taendt'),
        })
    end
end, false)
