ESX = nil
ESXLoad = false 
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(zBlipsConfig.eventEsx, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    ESXLoad = true
end)

CreateThread(function()


    while not ESXLoad do 
        Wait(1)
    end
   print('Zblips loaded succesfully')
    Wait(300)

    for k, v in pairs(zBlipsConfig.Blips) do 


      local blips = AddBlipForCoord(v.coords)
      SetBlipSprite(blips, v.id)
      SetBlipDisplay(blips, 4)
      SetBlipScale(blips, 0.7)
      SetBlipColour(blips, v.colour)
      SetBlipAsShortRange(blips, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(v.title)
      EndTextCommandSetBlipName(blips)
    end
end)
