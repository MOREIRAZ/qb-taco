isLoggedIn = true
local onDuty = true

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	if PlayerData.job.onduty then
	    if PlayerData.job.name == "taco" then
		TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    if PlayerData.job.name == 'taco' then
    	onDuty = duty
    end
end)

Citizen.CreateThread(function()
    Taco = AddBlipForCoord(12.04, -1602.41, 29.37)
    SetBlipSprite (Taco, 209)
    SetBlipDisplay(Taco, 4)
    SetBlipScale  (Taco, 0.6)
    SetBlipAsShortRange(Taco, true)
    SetBlipColour(Taco, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Taco")
    EndTextCommandSetBlipName(Taco)
end) 

RegisterNetEvent("qb-taco:DutyB")
AddEventHandler("qb-taco:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-taco:Tray1")
AddEventHandler("qb-taco:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacotray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacotray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-taco:Tray4")
AddEventHandler("qb-taco:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacotray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacotray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-taco:Tray3")
AddEventHandler("qb-taco:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacotray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacotray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-taco:Storage")
AddEventHandler("qb-taco:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacostorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacostorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-taco:BleederTaco")
AddEventHandler("qb-taco:BleederTaco", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-taco:server:get:ingredientTaco', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Taco", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "meat", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "lettuce", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "bun", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "oil", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "taco", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taco"], "add",1)
                    QBCore.Functions.Notify("You made a Bleeder Taco", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-taco:shop")
AddEventHandler("qb-taco:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "taco", Config.Items)
end)