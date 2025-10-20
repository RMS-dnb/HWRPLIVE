--[[ 
    Adapt the webhook to your likings :)
]]
---@param webhookurl is using the value from the scripts config file.
---@param title holds usually the table name/id
---@param description holds the detailed information about what happened
---@param avatar is using the value from the scripts config file.

function SendWebhook(webhookurl, title, description, avatar)
    if tostring(webhookurl) == "" or webhookurl == nil or webhookurl == false then return end
    PerformHttpRequest(tostring(webhookurl), function(err, text, headers) end, 'POST', json.encode({
        embeds = {
            {
                ["color"] = "6073182",
                ["author"] = {
                    ["name"] = "BLACKJACK @ "..tostring(title),
                    ["icon_url"] = "http://femga.com/images/samples/ui_textures_no_bg/ui_hud/toast_log_blips/blip_mg_blackjack.png",
                },
                ["description"] = tostring(description),
                ["footer"] = {
                    ["text"] = GetCurrentResourceName() .. " • " .. os.date("%x %X %p")
                },
            },
        },
        avatar_url = avatar or "http://femga.com/images/samples/ui_textures_no_bg/ui_hud/toast_log_blips/blip_mg_blackjack.png"
    }), {
    ['Content-Type'] = 'application/json'})
end