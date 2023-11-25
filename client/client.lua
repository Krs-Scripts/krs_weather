-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▀▄ ██ ▄▄▄██ ▀██ ██ ██ ████ ███ ██ ▄▄▄█ ▄▄▀█▄▄ ▄▄██ ██ ██ ▄▄▄██ ▄▄▀
-- ██ █ █ ██ ▄▄▄██ █ █ ██ ██ ████ █ █ ██ ▄▄▄█ ▀▀ ███ ████ ▄▄ ██ ▄▄▄██ ▀▀▄
-- ██ ███ ██ ▀▀▀██ ██▄ ██▄▀▀▄████▄▀▄▀▄██ ▀▀▀█ ██ ███ ████ ██ ██ ▀▀▀██ ██ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
local keybind = lib.addKeybind({

    name = 'krs_weather',
    description = 'press J to open menu',
    defaultKey = Config.KeybindWeather,
    
    onPressed = function(data)

        local playerPed = cache.ped

        lib.registerContext({
            id = locale('id_menu'),
            title = locale('title_menu_time'),
            options = {
        
                
                {
                    title = locale('title_time'),
                    icon = Config.IconTime, 
                    description = locale('description_time'),
                    iconColor = Config.ColorsIcon,
                    onSelect = function(data)
                        Tempo()
                    end,
                },
                {
                    title = locale('title_weather'),
                    icon = Config.IconWeather,
                    description = locale('description_weather'),
                    iconColor = Config.ColorsIcon,
                    onSelect = function(data)
                        CambiaTempo()
                    end,
                },
               
            },
        })
    
        lib.showContext(locale('id_menu'))
        
    end,
   
})