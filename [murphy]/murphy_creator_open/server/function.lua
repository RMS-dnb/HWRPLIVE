RegisterNetEvent("murphy_creator:RemovePlayerFromInstance", function ()
    RemovePlayerFromInstance(source)
end)


function PutPlayerinInstance(id)
    local randomRoutingBucket = math.random(1000000, 99999999)
    SetRoutingBucketPopulationEnabled(randomRoutingBucket, false)
    SetPlayerRoutingBucket(id, randomRoutingBucket)
end

function RemovePlayerFromInstance(id)
    SetPlayerRoutingBucket(id, 0)
end