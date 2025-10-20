-- Role(s) that are allowed to go through the queue, you may leave it empty if you want everyone in your server to be able to join
local allowlistedRoles = {
    "1102355253699027074" -- redm
}

-- Put in what priority their Discord role should have, the higher they are on the list the higher priority they have.
local priorityRoles = {
    "91075306420439896128", --Staff
    "1186523675340591166", --diamond
    "1186523505324466247", --gold
    "1186523362114158602", --silver
    "1186521163745210489", --bronze
    "1102355253699027074" --redm role
    
    
}

return {
    allowlistedRoles = allowlistedRoles,
    priorityRoles = priorityRoles
}
