Citizen.CreateThread(function()
    

    for k, v in pairs(locations) do
        RequestModel(v.model)
        print(v.model)
        while not HasModelLoaded(v.model) do Wait(0) end
        
        locations[k].prop = CreateObject(v.model, v.coords.x, v.coords.y, v.coords.z-1, false, false, true)
        while not DoesEntityExist(locations[k].prop) do Wait(0) end
        local coords = GetEntityCoords(locations[k].prop)
        SetEntityCoords(locations[k].prop, coords.x, coords.y, coords.z, true, true, true, true)
        PlaceObjectOnGroundProperly(locations[k].prop)
        FreezeEntityPosition(locations[k].prop, true)
        SetEntityHeading(locations[k].prop, v.heading)

        SetModelAsNoLongerNeeded(v.model)
        Wait(5000)
    end


end)