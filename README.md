# Taco Job for QBCore Framework
Taco job with target 

## Dependencies :
QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-menu - https://github.com/qbcore-framework/qb-menu

nh-keyboard - https://github.com/nerohiro/nh-keyboard

mlo - https://www.gta5-mods.com/maps/taco-restaurant-mlo-add-on-fivem-pablitomamutopaputo

## The script original 
https://github.com/Zach488/qb-burgershot

## add job taco to shared
```
    ["taco"] = {
		label = "Taco",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Flipper",
                payment = 100
            },
			['3'] = {
                name = "Manager",
                payment = 125
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 150
            },
        },
	},
  ```
 ## add to qb-bossmenu
 ```
     ['taco'] = vector3(20.45, -1602.09, 29.38),
 ```
 
 ## add to qb-target / targetmodels
 ```
    ["tacogarage"] = {
        models = {
            "a_f_y_hipster_02"
        },
        options = {
            {
                type = "client",
                event = "garage:TacoGarage",
                icon = "fas fa-car",
                label = "Taco Garage",
                job = "taco",
            }
        },
    distance = 2.5,
    },
 ```
 
 ## add item taco to shared
```
	["taco"] 		 	             = {["name"] = "taco", 			                ["label"] = "Taco", 				      ["weight"] = 100, 		["type"] = "item", 		["image"] = "taco.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["lettuce"] 		 	         = {["name"] = "lettuce", 			            ["label"] = "lettuce", 				    ["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["bun"] 		 	             = {["name"] = "bun", 			                ["label"] = "bun", 				        ["weight"] = 100, 		["type"] = "item", 		["image"] = "bun.png", 			        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["oil"] 		 	             = {["name"] = "oil", 			                ["label"] = "oil", 				        ["weight"] = 100, 		["type"] = "item", 		["image"] = "oil.png", 			        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	['meat'] 			        	   = {['name'] = 'meat', 			        	  	  ['label'] = 'meat', 				     	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'meat.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
```

## add taco to qb-smallresources
# config / Consumeables
```
    ["taco"] = math.random(25, 34),
```
# server/consumables.lua
```
QBCore.Functions.CreateUseableItem("taco", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
```
