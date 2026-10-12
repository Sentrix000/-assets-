local iplBlockerGroups = {

    {

        name = "Hornys",

        ymap = {

            "gabz_ipl_hornys_blocker",
            "gabz_ipl_hornys_blocker_occl",
        },

    },

    {

        name = "Mirrorpark1",

        ymap = {

            "gabz_ipl_mirrorpark1_blocker",
            "gabz_ipl_mirrorpark1_blocker_occl",
        },

    },

    {

        name = "Catcafe",

        ymap = {

            "gabz_ipl_catcafe_blocker",
        },

    },

    {

        name = "Triads",

        ymap = {

            "gabz_ipl_triads_blocker",
        },

    },

    {

        name = "Diner",

        ymap = {

            "gabz_ipl_diner_ext",
            "gabz_ipl_diner_lod",
            "gabz_ipl_diner_slod",
        },

    },

    {

        name = "Ottos",

        ymap = {

            "gabz_ipl_otto_ext",
            "gabz_ipl_otto_lod",
            "gabz_ipl_otto_slod",
        },

    },

}

local conditionalIplGroups = {

    {

        name = "Ottos247",

        ymap = {

            "gabz_ipl_vanilla_247_otto_milo",
            "gabz_ipl_vanilla_247_otto_lod",
        },

    },

    {

        name = "OttosGabz247",

        ymap = {

            "gabz_247_ipl_otto_milo",
            "gabz_247_ipl_otto_lod",
        },

    },

}

local staticEmitterDisables = {

    {

        associatedInterior = "Pearls",

        generatedName      = "se_racing_ferris_utopia",

        actualName         = nil,
    },

    {

        associatedInterior = "Burgershot",

        generatedName      = "se_restaurants_fucker_gasdoor_bearsy",

        actualName         = nil,
    },

}

--   Function: threadMain()

--   Purpose:  Entry point. Runs at resource start inside a FiveM thread.

--             1. Disables all static ambient emitters in staticEmitterDisables.

--             2. RequestIpl() for every ymap in every iplBlockerGroups entry.

--             3. Enumerates all currently started resources.

--             4. For each known gabz resource that is running, removes the

--                corresponding blocker IPLs (because the gabz resource

--                supplies its own geometry and does not need the blockers).

--             5. Handles the Ottos / 247 conditional swap via

--                conditional_ipl_check().

--   Params:   none

--   Returns:  none

CreateThread(function()

    local isOttosActive = false

    for _, emitterEntry in pairs(staticEmitterDisables) do

        local emitterName

        if emitterEntry.actualName then

            emitterName = emitterEntry.actualName

        else

            emitterName = emitterEntry.generatedName

        end

        SetStaticEmitterEnabled(emitterName, false)
    end

    for _, blockerGroup in ipairs(iplBlockerGroups) do

        for _, ymapName in ipairs(blockerGroup.ymap) do

            RequestIpl(ymapName)
        end

    end

    local startedResources = {}

    for i = 0, GetNumResources() do
        local resourceName = GetResourceByFindIndex(i)
        if resourceName then

            if GetResourceState(resourceName) == "started" then
                table.insert(startedResources, resourceName)

            end

        end

    end

    for _, resourceName in ipairs(startedResources) do

        if resourceName == "cfx-gabz-hornys" then

            disable_IplbyName("Hornys")

        end

        if resourceName == "cfx-gabz-mirrorpark1" then

            disable_IplbyName("Mirrorpark1")

        end

        if resourceName == "cfx-gabz-catcafe" then

            disable_IplbyName("Catcafe")

        end

        if resourceName == "cfx-gabz-triads" then

            disable_IplbyName("Triads")

        end

        if resourceName == "cfx-gabz-pizzeria" then

            disable_IplbyName("Diner")

        end

        if resourceName == "cfx-gabz-ottos" then

            disable_IplbyName("Ottos")

            enable_conditional_IplbyName("Ottos247")

            isOttosActive = true

        end

    end

    conditional_ipl_check(startedResources, isOttosActive)
end)

--   Function: conditional_ipl_check(startedResources, isOttosActive)

--   Purpose:  Checks whether cfx-gabz-247 is running AND Otto's

--             gabz resource was also detected. If both are true,

--             removes the vanilla-247 Otto blocker (Ottos247) and

--             loads the gabz-247 variant (OttosGabz247) instead.

--   Params:   startedResources (table)  — list of started resource name strings

--             isOttosActive    (boolean) — whether cfx-gabz-ottos was found running

--   Returns:  none

function conditional_ipl_check(startedResources, isOttosActive)

    for _, resourceName in ipairs(startedResources) do

        if resourceName == "cfx-gabz-247" and isOttosActive then

            disable_conditional_IplbyName("Ottos247")

            enable_conditional_IplbyName("OttosGabz247")

        end

    end

end

--   Function: disable_IplbyName(groupName)

--   Purpose:  Finds the named group inside iplBlockerGroups and

--             calls RemoveIpl() on every ymap in that group.

--             Used to unload standard blocker IPLs when the

--             corresponding gabz resource is active.

--   Params:   groupName (string) — the .name field to match in iplBlockerGroups

--   Returns:  none

function disable_IplbyName(groupName)

    for _, blockerGroup in ipairs(iplBlockerGroups) do

        if blockerGroup.name == groupName then

            for _, ymapName in ipairs(blockerGroup.ymap) do

                RemoveIpl(ymapName)
            end

        end

    end

end

--   Function: disable_conditional_IplbyName(groupName)

--   Purpose:  Finds the named group inside conditionalIplGroups

--             and calls RemoveIpl() on every ymap in that group.

--             Used to unload conditional IPLs during the 247 swap.

--   Params:   groupName (string) — the .name field to match in conditionalIplGroups

--   Returns:  none

function disable_conditional_IplbyName(groupName)

    for _, conditionalGroup in ipairs(conditionalIplGroups) do

        if conditionalGroup.name == groupName then

            for _, ymapName in ipairs(conditionalGroup.ymap) do

                RemoveIpl(ymapName)
            end

        end

    end

end

--   Function: enable_conditional_IplbyName(groupName)

--   Purpose:  Finds the named group inside conditionalIplGroups

--             and calls RequestIpl() on every ymap in that group.

--             Used to load conditional IPLs (e.g. the correct

--             247 storefront variant for Otto's).

--   Params:   groupName (string) — the .name field to match in conditionalIplGroups

--   Returns:  none

function enable_conditional_IplbyName(groupName)

    for _, conditionalGroup in ipairs(conditionalIplGroups) do

        if conditionalGroup.name == groupName then

            for _, ymapName in ipairs(conditionalGroup.ymap) do

                RequestIpl(ymapName)
            end

        end

    end

end