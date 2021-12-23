PlayerData = {}
local pedspawned = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    	PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     	PlayerData.job = job
end)

RegisterNetEvent('QBCore:Player:SetPlayerData')
AddEventHandler('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.GaragePedLocations) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
			
			if dist < 40 and not pedspawned then
				TriggerEvent('qb-taco:spawn:ped', v.coords)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('qb-taco:spawn:ped')
AddEventHandler('qb-taco:spawn:ped',function(coords)
	local hash = `a_f_y_hipster_02`

	RequestModel(hash)
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    	pedspawned = true
	npc = CreatePed(5, hash, coords.x, coords.y, coords.z - 1.0, coords.w, false, false)
	FreezeEntityPosition(npc, true)
    	SetBlockingOfNonTemporaryEvents(npc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0)
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

function closeMenuFull()
exports['qb-menu']:closeMenu()
end

RegisterNetEvent('qb-taco:garage')
AddEventHandler('qb-taco:garage', function(bs)
    local vehicle = bs.vehicle
    local coords = vector4(25.16, -1613.0, 29.21, 143.02)
        if PlayerData.job.name == "taco" then
            if vehicle == 'taco' then		
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "TACO"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.w)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else
        QBCore.Functions.Notify('You are not an employee of Taco', 'error')
    end
end)

RegisterNetEvent('qb-taco:storecar')
AddEventHandler('qb-taco:storecar', function()
    QBCore.Functions.Notify('Work Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)


RegisterNetEvent('garage:TacoGarage', function()
      exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Taco Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Taco Car",
            txt = "Take Vehicle",
            params = {
                event = "qb-taco:garage",
                args = {
                    vehicle = 'taco',
                }
            }
        },
        {
            id = 3,
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "qb-taco:storecar",
                args = {
                    
                }
            }
        },
        {
            header = "⬅ Close",
            txt = '',
            params = {
                event = 'qb-menu:closeMenu',
            }
        }
    })
end)
