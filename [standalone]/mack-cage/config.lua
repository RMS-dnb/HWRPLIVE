Config = Config or {}

-- Distance in front of the player to place the prop
Config.ForwardDistance = 2.5

-- Prop options for placement
Config.PropOptions = {
    ["cage1"] = { label = "Prison Cage", model = "p_prisoncage02x" },
    ["cage2"] = { label = "Small Cell", model = "mp005_p_wildanimalcage01" }
}

-- Prompt settings for placement
Config.PromptGroupName = 'Place Equipment'
Config.PromptCancelName = 'Cancel'
Config.PromptPlaceName = 'Place'
Config.PromptRotateLeft = 'Rotate Left'
Config.PromptRotateRight = 'Rotate Right'
