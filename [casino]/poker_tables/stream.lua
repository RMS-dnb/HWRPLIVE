local streamCache = {}
local objects = {
    {
        vector = vector3(2716.85, -1285.56, 60.37),
        layout = {
            's_tablefarkle01x', -- POKER TABLE OBJECT
            -- MUST BE 6 chairs important!
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
        }
    },

    {
        vector = vector3(2880.44, -1411.56, 43.39),
    
        layout = {
            'p_tablepoker01x', -- POKER TABLE OBJECT
            -- MUST BE 6 chairs important!
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
        }
    },

    {
        vector = vector3(2635.57, -1228.24, 49.57),
    
        layout = {
            'p_tablepoker01x', -- POKER TABLE OBJECT
            -- MUST BE 6 chairs important!
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
            'p_windsorchair03x',
        }
    },
}

function attributes(object, visibility, heading, collision)
    SetEntityVisible(object, visibility)
    SetEntityHeading(object, heading)
    SetEntityCollision(object, collision, collision)
    PlaceObjectOnGroundProperly(object, false)
    PlaceObjectOnGroundProperly(object, false)
    PlaceObjectOnGroundProperly(object, false)
    FreezeEntityPosition(object, true)
    PlaceObjectOnGroundProperly(object, false)
    PlaceObjectOnGroundProperly(object, false)
    PlaceObjectOnGroundProperly(object, false)
end

function removeEntities(key)
    for k,v in pairs(streamCache[key]) do
        DeleteEntity(v)
    end
end

Citizen.CreateThread(function ()
    RequestModel(GetHashKey('p_tiptray01x'))
    while not HasModelLoaded(GetHashKey('p_tiptray01x')) do
        RequestModel(GetHashKey('p_tiptray01x'))
        Wait(0)
    end
    for _,o in pairs(objects) do
        for k,v in pairs(o.layout) do
            RequestModel(GetHashKey(v))
            while not HasModelLoaded(GetHashKey(v)) do
                RequestModel(GetHashKey(v))
                Wait(0)
            end
        end
    end
    while true do
        Wait(1000)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(objects) do
            if type(v) == 'table' and type(v.vector) == 'vector3' and type(v.layout) == 'table' and #v.layout == 7 then
                if not streamCache[k] and #(playerCoords - v.vector) <= 85 then
                    local founder = CreateObject(GetHashKey('p_tiptray01x'), v.vector, false, false, false, false, false)
                    attributes(founder, false, 0.0, false)
                    local angle = {0.0,0.0,60.0,120.0,180.0,-120.0,-60.0}
                    streamCache[k] = {}
                    for i=2,7 do
                        SetEntityHeading(founder, angle[i])
                        Wait(200)
                        local fVector = GetEntityCoords(founder)+GetEntityForwardVector(founder)*1.1807247400284
                        local chair = CreateObject(GetHashKey(v.layout[i]), fVector, false, false, false, false, false)
                        local dh = GetHeadingFromVector_2d(fVector.x-v.vector.x, fVector.y-v.vector.y)
                        streamCache[k][i] = chair
                        attributes(chair, true, dh, true)
                    end
                    DeleteEntity(founder)
                    streamCache[k][1] = CreateObject(GetHashKey(v.layout[1]), v.vector, false, false, false, false, false)
                    attributes(streamCache[k][1], true, 0.0, true)
                elseif streamCache[k] and #(playerCoords - v.vector) > 85 then
                    removeEntities(k)
                    streamCache[k] = nil
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function (resourceName)
    if GetCurrentResourceName() == resourceName then
        for _ in pairs(streamCache) do
            removeEntities(_)
        end
    end
end)