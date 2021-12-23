Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("TacoDuty", vector3(20.28, -1601.92, 29.38), 1.4, 1.2, {
		name = "TacoDuty",
		heading = 32,
		debugPoly = false,
		minZ=28.0,
		maxZ=30.0,
	}, {
		options = {
		    {  
			event = "qb-taco:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "taco",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("taco_tray_1", vector3(7.39, -1602.23, 29.37), 1.05, 1.0, {
			name = "taco_tray_1",
			heading = 35.0,
			debugPoly = false,
			minZ=29.5,
			maxZ=29.57,
		}, {
			options = {
			    {
				event = "qb-taco:Tray1",
				icon = "far fa-clipboard",
				label = "Tray 1",
			    },
			},
			distance = 1.5
		})
    
    exports['qb-target']:AddBoxZone("taco_tray_2", vector3(6.57, -1604.98, 29.37), 0.5, 0.7, {
		name="taco_tray_2",
		heading=318,
		debugPoly=false,
		minZ=29.5,
		maxZ=29.57,
	}, {
		options = {
		    {
			event = "qb-taco:Tray4",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("taco_tray_3", vector3(7.31, -1607.19, 29.37), 1, 1, {
		name="taco_tray_3",
		heading=350,
		debugPoly=false,
		minZ=29.5,
		maxZ=29.57,
	}, {
		options = {
		    {
			event = "qb-taco:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 3.5
	})

         exports['qb-target']:AddBoxZone("tacofridge", vector3(17.03, -1599.7, 29.38), 0.7, 1, {
            name="tacofridge",
            heading=50,
            debugPoly=false,
            minZ=29.0,
            maxZ=30.6,
        }, {
                options = {
                    {
                        event = "qb-menu:OrderMenuTaco",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "taco",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("tacoshotdisplay", vector3(12.67, -1600.28, 29.38), 1.3, 1.0, {
            name="tacoshotdisplay",
            heading=50,
            debugPoly=false,
            minZ=28.0,
            maxZ=30.0,
        }, {
                options = {
                    {
                        event = "qb-taco:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "taco",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("crafttaco", vector3(10.7, -1599.02, 29.35), 1.8, 0.7, {
            name="crafttaco",
            heading=140,
            debugPoly=false,
            minZ=28.0,
            maxZ=30.0,
        }, {
                options = {
                    {
                        event = "qb-menu:Taco",
                        icon = "fas fa-box",
                        label = "Taco Work Station",
                        job = "taco",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("Taco_register_1", vector3(9.93, -1606.03, 29.28), 1.0, 0.8, {
            name="Taco_register_1",
            debugPoly=false,
            heading=125,
            minZ=29.0,
            maxZ=30.5,
        }, {
                options = {
                    {
                        event = "qb-taco:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "taco",
                    },
                },
                distance = 1.5
            })

end)

RegisterNetEvent('qb-menu:Taco', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "Available Tacos",
            txt = "",
        },
        {
            header = "Make a Taco",
            txt = "Bun , Cooked Patty , oil , Lettuce",
            params = {
                event = "qb-taco:BleederTaco"
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


RegisterNetEvent('qb-menu:OrderMenuTaco', function(data)
exports['qb-menu']:openMenu({
        {
            header = "Fridge",
            isMenuHeader = true
        },
        {
            header = "Order Items",
            txt = "Order New Ingredients",
            params = {
                event = "qb-taco:shop"
            }
        },
        {
            header = "Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-taco:Storage"
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

RegisterNetEvent("qb-taco:bill")
AddEventHandler("qb-taco:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-taco:bill:player", bill[1].input, bill[2].input)
    end
end)

