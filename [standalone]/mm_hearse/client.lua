local RSGCore = exports['rsg-core']:GetCoreObject()

local spawnedVehicle = nil -- Variable to store the spawned vehicle entity
local attachedObjects = {} -- Table to store attached object entities

-- Function to spawn the wagon03x vehicle and attach objects
function SpawnHearseVehicle()
    local model = "wagon03x" -- The vehicle model
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
	
    if spawnedVehicle and DoesEntityExist(spawnedVehicle) then
        -- If the vehicle exists, delete it
        DeleteVehicle(spawnedVehicle)
        spawnedVehicle = nil -- Reset the spawnedVehicle variable
        
        for _, object in pairs(attachedObjects) do
            -- If objects exist, delete them
            DeleteEntity(object)
        end
        attachedObjects = {} -- Reset the attachedObjects table
    else
        -- Request the vehicle model
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(500)
        end
        
        -- Create the vehicle
        local vehicle = CreateVehicle(model, playerCoords.x + 2.0, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)

        -- Set vehicle tint to black (Tint ID: 5 for dark/black tint)
        Citizen.InvokeNative(0x8268B098F6FCA4E2, vehicle, 5)
        
        -- Set the vehicle as the player's current vehicle
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        
        spawnedVehicle = vehicle -- Store the spawned vehicle entity
        
        -- Define objects to attach
        local objectsToAttach = {
            {model = "p_pot_flowerarng01x", offsetX = -0.49, offsetY = -1.95, offsetZ = 0.6, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_pot_flowerarng01x", offsetX = 0.55, offsetY = 0.72, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_pot_flowerarng01x", offsetX = -0.57, offsetY = 0.7, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_pot_flowerarng01x", offsetX = -0.57, offsetY = 0.39, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_pot_flowerarng01x", offsetX = 0.53, offsetY = 0.37, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_pot_flowerarng01x", offsetX = 0.53, offsetY = -1.64, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_pot_flowerarng01x", offsetX = 0.53, offsetY = -1.97, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_coffin01x", offsetX = 0, offsetY = -0.63, offsetZ = 0.64, pitch = 0.0, roll = 0.0, yaw = 180.0},
            {model = "p_woodboard02x", offsetX = -0.03, offsetY = -1.11, offsetZ = 0.6, pitch = 0.0, roll = 0.0, yaw = 0.0},
            {model = "p_woodboard02x", offsetX = 0, offsetY = 0, offsetZ = 0.6, pitch = 0.0, roll = 0.0, yaw = 0.0},
         --   {model = "p_horsehitchnbd01x", offsetX = -0.56, offsetY = 0.93, offsetZ = 0.62, pitch = 0.0, roll = 0.0, yaw = 0.0},
   -- {model = "p_horsehitchnbd01x", offsetX = 0.54, offsetY = 0.98,  offsetZ = 0.59, pitch = 0.0, roll = 0.0, yaw = 0.0},
   -- {model = "p_horsehitchnbd01x", offsetX = 0.56, offsetY = -1.96, offsetZ = 0.62, pitch = 0.0, roll = 0.0, yaw = 0.0},
   -- {model = "p_horsehitchnbd01x", offsetX = -0.48, offsetY = -1.99, offsetZ = 0.56, pitch = 0.0, roll = 0.0, yaw = 0.0},
	   {model = "p_lanternnbx01x", offsetX = 0, offsetY = 1.02, offsetZ = 1.176, pitch = 0.0, roll = 0.0, yaw = 0.0},
	      {model = "p_pot_flowerarng02x", offsetX = -0.56, offsetY = 1.12, offsetZ = 1.05, pitch = 28.8, roll = 0.0, yaw = 3.0},
    {model = "p_pot_flowerarng02x", offsetX = 0.56, offsetY = 1.12, offsetZ = 1.05, pitch = 28.8, roll = 0.0, yaw = 3.0},
     {model = "p_lanternnbx01x", offsetX = 0.74, offsetY = -2.2, offsetZ = 0.8, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_lanternnbx01x", offsetX = -0.74, offsetY = -2.2, offsetZ = 0.8, pitch = 0.0, roll = 0.0, yaw = 0.0},
	 {model = "p_pot_flowerarng05x", offsetX = 0.54, offsetY = 0.12, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = -0.5, offsetY = 0.08, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = -0.5, offsetY = -0.17, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = -0.5, offsetY = -0.44, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = -0.5, offsetY = -0.74, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = -0.5, offsetY = -0.98, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = -0.5, offsetY = -1.27, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = 0.54, offsetY = -1.36, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = 0.54, offsetY = -1.1, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = 0.54, offsetY = -0.78, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = 0.54, offsetY = -0.45, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
    {model = "p_pot_flowerarng05x", offsetX = 0.54, offsetY = -0.12, offsetZ = 0.26, pitch = 0.0, roll = 0.0, yaw = 0.0},
	  {model = "p_gravestoneclean02ax", offsetX = 0, offsetY = 1.07, offsetZ = 0.79, pitch = 0.0, roll = 0.0, yaw = 0.0},
{model = "p_gravestoneclean02ax", offsetX = 0, offsetY = -2.16, offsetZ = 0.16, pitch = 0.0, roll = 0.0, yaw = 0.0},
	-- Add more objects in a similar format if needed
    -- {model = "next_object_model", offsetX = next_offsetX, offsetY = next_offsetY, offsetZ = next_offsetZ, pitch = next_pitch, roll = next_roll, yaw = next_yaw},

        }
        
        for _, objData in ipairs(objectsToAttach) do
            local objectModel = objData.model
            local offsetX, offsetY, offsetZ = objData.offsetX, objData.offsetY, objData.offsetZ
            local pitch, roll, yaw = objData.pitch, objData.roll, objData.yaw
            
            RequestModel(objectModel)
            while not HasModelLoaded(objectModel) do
                Wait(500)
            end
            
            local attachmentCoords = GetOffsetFromEntityInWorldCoords(vehicle, offsetX, offsetY, offsetZ)
            local object = CreateObjectNoOffset(objectModel, attachmentCoords.x, attachmentCoords.y, attachmentCoords.z, true, true, false)
            
            AttachEntityToEntity(object, vehicle, 0, offsetX, offsetY, offsetZ, pitch, roll, yaw, false, false, true, false, 0, true)
            
            table.insert(attachedObjects, object) -- Store the attached object entity
            
            SetModelAsNoLongerNeeded(objectModel)
        end
    end
end

RegisterCommand("hearse", function()
    local playerData = RSGCore.Functions.GetPlayerData()
    local jobName = playerData.job.name

    if jobName ~= "undertaker" then
        RSGCore.Functions.Notify('Only undertakers can use this command.')
        return
    end

    SpawnHearseVehicle()
end, false)


-- Existing code for NUI callbacks and the 'rcpvehicles' command
-- ... (existing code for NUI callbacks and 'rcpvehicles' command)


