-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄ ██ ▄▄▀██ ██ ██ ▄▄ ██ ▄▄ ██ ▄▄▄ ███ ▄▄▀██ ▄▄▀██ ▄▀▄ █▄ ▄██ ▀██ 
-- ██ █▀▀██ ▀▀▄██ ██ ██ ▀▀ ██ ▀▀ ██ ███ ███ ▀▀ ██ ██ ██ █ █ ██ ███ █ █ 
-- ██ ▀▀▄██ ██ ██▄▀▀▄██ █████ █████ ▀▀▀ ███ ██ ██ ▀▀ ██ ███ █▀ ▀██ ██▄ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
lib.callback.register("krs_time:gruppoAdmin", function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        local group = xPlayer.getGroup()

        if group ~= nil then 
            return (group)
        else
            return ("user")
        end
    else
        return ("user")
    end
end)


RegisterNetEvent('krs_weather:SyncWeather', function(tempo)
    TriggerClientEvent('krs_weather:cl_SyncWeather', -1, tempo)
end)

RegisterNetEvent('krs_weather:SyncTime', function(orario)
    TriggerClientEvent('krs_weather:cl_SyncTime', -1, orario)
end)