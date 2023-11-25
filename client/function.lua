-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ███ ██ ▄▄▄█ ▄▄▀█▄▄ ▄▄██ ██ ██ ▄▄▄██ ▄▄▀████ ▄▄▀██ ▄▄▄ ██ ▀██ ██ ▄▄▀█▄ ▄█▄▄ ▄▄█▄ ▄██ ▄▄▄ ██ ▀██ ██ ▄▄▄ ███████▄▄ ▄▄█▄ ▄██ ▄▀▄ ██ ▄▄▄
-- ██ █ █ ██ ▄▄▄█ ▀▀ ███ ████ ▄▄ ██ ▄▄▄██ ▀▀▄████ █████ ███ ██ █ █ ██ ██ ██ ████ ████ ███ ███ ██ █ █ ██▄▄▄▀▀█████████ ████ ███ █ █ ██ ▄▄▄
-- ██▄▀▄▀▄██ ▀▀▀█ ██ ███ ████ ██ ██ ▀▀▀██ ██ ████ ▀▀▄██ ▀▀▀ ██ ██▄ ██ ▀▀ █▀ ▀███ ███▀ ▀██ ▀▀▀ ██ ██▄ ██ ▀▀▀ █████████ ███▀ ▀██ ███ ██ ▀▀▀
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

function SetWeatherType(weatherType)
    if weatherType then
        SetWeatherTypeNowPersist(weatherType)

        lib.notify({
            title = locale('title_notify'),
            description = locale('description_weather_changed') .. weatherType,
            type = locale('type_notify_success')
        })
    else
        lib.notify({
            title = locale('title_notify'),
            description = locale('description_select_valid_weather'),
            type = locale('type_notify_error')
        })
    end
end

function SetGameTime(hours, minutes)

    if hours >= 0 and hours <= 23 and minutes >= 0 and minutes <= 59 then
       
        NetworkOverrideClockTime(hours, minutes, 0)

        lib.notify({
            title = locale('title_notify'),
            description = string.format(locale('description_time_set'), hours, minutes),
            type = locale('type_notify_success')
        })

    else
        lib.notify({
            title = locale('title_notify'),
            description = locale('description_notify_time'),
            type = locale('type_notify_error')
        })
    end
end

function Tempo(data)
    
    local playerPed = cache.ped

    lib.callback("krs_time:gruppoAdmin", false, function(group)

        if group == "admin" or group == "superadmin" then
        
            local input = lib.inputDialog(locale('title_time'), {

                {type = 'select', label = locale('title_time_change'), icon = Config.IconTime, options = { 

                    {label = "06:00", value =  6},
                    {label = "12:00", value = 12},
                    {label = "18:00", value = 18},
                    {label = "00:00", value =  0},
                  
                }},
            })

            if not input then return 
                lib.showContext(locale('id_menu'))
            end
        
            if input and #input > 0 then
                TriggerServerEvent('krs_weather:SyncTime', input[1])
            end
        else
            lib.notify({
                title = locale('title_notify'),
                description = locale('description_notify_admin'),
                type = locale('type_notify_error')
            })
        end
    end)
end

function CambiaTempo(data)
    
    local playerPed = cache.ped

    lib.callback("krs_time:gruppoAdmin", false, function(group)

        if group == "admin" or group == "superadmin" then
        
            local input = lib.inputDialog(locale('title_weather'), {

                {type = 'select', label = locale('title_weather_change'), icon = Config.IconWeather, options = { 

                    { value = 'BLIZZARD', label = 'BLIZZARD'},
                    { value = 'CLEAR', label = 'CLEAR'},
                    { value = 'CLEARING', label = 'CLEARING'},
                    { value = 'CLOUDS', label = 'CLOUDS'},
                    { value = 'EXTRASUNNY', label = 'EXTRASUNNY'},
                    { value = 'FOGGY', label = 'FOGGY'},
                    { value = 'HALLOWEEN', label = 'HALLOWEEN'},
                    { value = 'NEUTRAL', label = 'NEUTRAL'},
                    { value = 'OVERCAST', label = 'OVERCAST'},
                    { value = 'RAIN', label = 'RAIN'},
                    { value = 'SMOG', label = 'SMOG'},
                    { value = 'SNOW', label = 'SNOW'},
                    { value = 'SNOWLIGHT', label = 'SNOWLIGHT'},
                    { value = 'THUNDER', label = 'THUNDER'},
                    { value = 'XMAS', label = 'XMAS'},
                }},
            })

            if not input then return 
                lib.showContext(locale('id_menu'))
            end
        
            if input and #input > 0 then
                TriggerServerEvent('krs_weather:SyncWeather', input[1])
            end
        else
            lib.notify({
                title = locale('title_notify'),
                description = locale('description_notify_admin'),
                type = locale('type_notify_error')
            })
        end
    end)
end

RegisterNetEvent('krs_weather:cl_SyncWeather', function(tempo)
    ClearOverrideWeather()
    SetWeatherTypeNow(tempo)
    SetWeatherTypeNowPersist(tempo)
end)

RegisterNetEvent('krs_weather:cl_SyncTime', function(orario)
    SetGameTime(orario, 0)
end)