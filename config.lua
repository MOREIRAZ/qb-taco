Config = {}

Config.GaragePedLocations = {
    {coords = vector4(16.96, -1609.38, 29.39, 201.01)}, -- vector3(16.96, -1609.38, 29.39)
}

Config.SQL = 'oxmysql' --- oxmysql or ghmattisql

--if u are not using qb-target uncomment this.

-- Config.Locations = {
--     ["duty"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },    
--     ["tray1"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },
--     ["tray2"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },
--     ["tray3"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },  
--     ["pattycooker"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--         [2] = vector4(0 , 0 , 0, 0),
--     }, 
--     ["fryer"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     }, 
--     ["drinks"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--         [2] = vector4(0 , 0 , 0, 0),
--     },   
--     ["fridge"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },      
--     ["storage"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },
--     ["craftburger"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     },    
--     ["cashregister"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--         [2] = vector4(0 , 0 , 0, 0),
--         [3] = vector4(0 , 0 , 0, 0),
--         [4] = vector4(0 , 0 , 0, 0),
--     },   
--     ["garage"] = {
--         [1] = vector4(0 , 0 , 0, 0),
--     }, 
--  }


Config.Items = {
label = "Shop",
    slots = 7,
    items = {
        [1] = {
            name = "bun",
            price = 0,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "oil",
            price = 0,
            amount = 10,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "lettuce",
            price = 0,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "meat",
            price = 0,
            amount = 10,
            info = {},
            type = "item",
            slot = 4,
        },
    }
}
