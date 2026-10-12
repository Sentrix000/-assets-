Citizen.CreateThread(function()

    Citizen.Wait(5000)

    local function versionStringToNumber(versionString)

        return tonumber(versionString)

    end

    local currentResourceName = GetCurrentResourceName()

    local currentVersion = GetResourceMetadata(currentResourceName, "version", 0)

    local githubVersionUrl = "https://raw.githubusercontent.com/GabzV/Gabz_Versions/master/" .. currentResourceName .. ".txt"

    PerformHttpRequest(

        githubVersionUrl,

        function(httpStatusCode, responseBody, responseHeaders)

            if not responseBody then

                print("^1Version check disabled because github is down.^0")

                return

            end

            local versionData = json.decode(responseBody)

            local latestVersionNumber = versionStringToNumber(versionData.version:gsub("%.", ""))

            local currentVersionNumber = versionStringToNumber(currentVersion:gsub("%.", ""))

            if latestVersionNumber > currentVersionNumber then

                local randomColorCode = "^" .. math.random(1, 9)

                local separatorLine = randomColorCode

                local separatorLength = 26 + #currentResourceName

                for i = 1, separatorLength, 1 do

                    separatorLine = separatorLine .. "="

                end

                separatorLine = separatorLine .. "^0"

                print(separatorLine)

                local updateMessage = "^2[" .. currentResourceName .. "] - New Update Available.^0\n" ..

                                     "Current Version: ^5" .. currentVersion .. "^0.\n" ..

                                     "New Version: ^5" .. versionData.version .. "^0.\n" ..

                                     "Notes: ^5" .. versionData.notes .. "^0."

                print(updateMessage)

                print(separatorLine)

            end

        end,

        "GET"

    )

end)