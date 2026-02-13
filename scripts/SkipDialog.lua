local sampEvents = require("lib.samp.events")

local lastVehicle = nil

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then
        return
    end

    while not isSampAvailable() do
        wait(100)
    end

    while true do
        wait(0)

        if isCharInAnyCar(PLAYER_PED) then
            local currentVehicle = storeCarCharIsInNoSave(PLAYER_PED)

            if doesVehicleExist(currentVehicle) and (not lastVehicle or lastVehicle ~= currentVehicle) then
                local vehicleModel = getCarModel(currentVehicle)

                if vehicleModel and vehicleModel ~= 0 then
                    lastVehicle = currentVehicle
                end
            end
        else
            lastVehicle = nil
        end
    end
end

function sampEvents.onPutPlayerInVehicle(playerId, vehicleId)
    lua_thread.create(function()
        wait(1000)

        if isCharInAnyCar(PLAYER_PED) then
            local currentVehicle = storeCarCharIsInNoSave(PLAYER_PED)

            if doesVehicleExist(currentVehicle) then
                local vehicleModel = getCarModel(currentVehicle)

                if vehicleModel and vehicleModel ~= 0 then
                end
            end
        end
    end)

    return true
end

function sampEvents.onShowDialog(dialogId, style, title, button1, button2, text)
    if dialogId == 1096 then
        if isCharInAnyCar(PLAYER_PED) then
            local currentVehicle = storeCarCharIsInNoSave(PLAYER_PED)

            if doesVehicleExist(currentVehicle) then
                local vehicleModel = getCarModel(currentVehicle)
                
                if vehicleModel == 519 or vehicleModel == 12205 or vehicleModel == 476 then
                    lua_thread.create(function()
                        wait(100)
                        sampSendDialogResponse(1096, 1, 2, "")
                        
                        if vehicleModel == 519 then
                            sampAddChatMessage("{2CDDDC}[Shamal]{FFFFFF}: Cкипнул диалог by {2CDDDC}Luffich!", -1)
                        elseif vehicleModel == 12205 then
                            sampAddChatMessage("{2CDDDC}[Kрокодил Gена]{FFFFFF}: Cкипнул диалог by {2CDDDC}Luffich!", -1)
                        elseif vehicleModel == 476 then
                            sampAddChatMessage("{2CDDDC}[Rustler]{FFFFFF}: Cкипнул диалог by {2CDDDC}Luffich!", -1)
                        end
                    end)

                    return false
                end
            end
        end

        return true
    end

    return true
end