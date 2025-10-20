local WebhookConfig = {
	[1] = {
		webhook = "webhook here", botname = "RicX Camps - Meat Delivery Start", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},   
	[2] = {
		webhook = "webhook here", botname = "RicX Camps - Pelt Delivery Start", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	}, 
	[3] = {
		webhook = "webhook here", botname = "RicX Camps - Finished Meat Delivery", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	}, 
	[4] = {
		webhook = "webhook here", botname = "RicX Camps - Finished Pelt Delivery", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[5] = {
		webhook = "https://discord.com/api/webhooks/1368263559540113558/bGXSAkdYhOPbHZPqVmTRZTumcXjNcCOZNQOH8TmLBN1kV7sAvv_DFOMdJIGAtikvShMA", botname = "RicX Camps - Supply Added", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[6] = {
		webhook = "webhook here", botname = "RicX Camps - Pelt Added", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[7] = {
		webhook = "webhook here", botname = "RicX Camps - Meat Added", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[8] = {
		webhook = "https://discord.com/api/webhooks/1368263559540113558/bGXSAkdYhOPbHZPqVmTRZTumcXjNcCOZNQOH8TmLBN1kV7sAvv_DFOMdJIGAtikvShMA", botname = "RicX Camps - Item Supply Added", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[9] = {
		webhook = "https://discord.com/api/webhooks/1368263559540113558/bGXSAkdYhOPbHZPqVmTRZTumcXjNcCOZNQOH8TmLBN1kV7sAvv_DFOMdJIGAtikvShMA", botname = "RicX Camps - Money Deposit", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[10] = {
		webhook = "https://discord.com/api/webhooks/1368263559540113558/bGXSAkdYhOPbHZPqVmTRZTumcXjNcCOZNQOH8TmLBN1kV7sAvv_DFOMdJIGAtikvShMA", botname = "RicX Camps - Money Withdraw", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
	[11] = {
		webhook = "https://discord.com/api/webhooks/1368263559540113558/bGXSAkdYhOPbHZPqVmTRZTumcXjNcCOZNQOH8TmLBN1kV7sAvv_DFOMdJIGAtikvShMA", botname = "RicX Camps - Supply Buy", icon_url = "https://i.imgur.com/R66g1Pe.jpg", color = 15248975,
	},
}

local CampIDHooks = {
	--define here different webhooks for different camp IDs
	[1] = "webhook for camp ID 1", --Remove if not wanting to separate webhooks per Camps
}

function RicXCampsWebhook(id, wd)
    wd.title = "RicX Camps"
	if id == 1 then 
    	wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." started Meat Delivery"
	elseif id == 2 then 
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." started Pelt Delivery (Pelt ID: "..wd.pelt.." | Amount: "..wd.amount..")"
	elseif id == 3 then 
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Finished Meat Delivery | Earnings: $"..wd.price.." | Items: "..wd.itemst
	elseif id == 4 then 
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Finished Pelt Delivery (Pelt ID: "..wd.pelt.." | Amount: "..wd.amount..") | Earnings: $"..wd.price.." | Items: "..wd.itemst
	elseif id == 5 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Supply Added | Amount: "..wd.amount.." | New Amount at Camp: "..wd.new_supply
	elseif id == 6 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Pelt Added | Pelt ID: "..wd.pelt.." | Pelt Name: "..wd.pelt_name.." | Changed Amount from "..wd.amounts.old.." to "..wd.amounts.new
	elseif id == 7 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Meat Added | Changed Amount from "..wd.amounts.old.." to "..wd.amounts.new
	elseif id == 8 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Item Supply Added | Amount: "..wd.amount.." | Item Removed: "..wd.item.name.." ("..wd.item.amount..")".." | New Amount at Camp: "..wd.new_supply
	elseif id == 9 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Deposit Done | Amount: $"..wd.amount.." | New Bank at Camp: "..wd.new_bank
	elseif id == 10 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Withdraw Done | Amount: $"..wd.amount.." | New Bank at Camp: "..wd.new_bank
	elseif id == 11 then
		wd.description = "Source: "..wd.source.." (Camp: "..wd.campid..")".." Supply Bought | Amount: "..wd.amount.." | New Amount at Camp: "..wd.new_supply.." | Price: $"..wd.price
	end
    if Config.Debug then 
        print("Camps Webhook id: "..id.." | "..wd.title.." | "..wd.description.." | Source: "..wd.source.." | Camp: "..wd.campid)
    end
    local timestamp = createTimestamp()
	local wh = WebhookConfig[id]
	local final_webhook = wh.webhook
	if CampIDHooks[wd.campid] then 
		final_webhook = CampIDHooks[wd.campid]
		wd.title = wd.title.." | Camp "..wd.campid
	end
    local embeds = {
        {
            author = {
                name = wh.botname,
                icon_url = wh.icon_url,
            },
            color = wh.color,
            title = wd.title,
            description = wd.description,
            footer = {
                text= wh.botname,
            },
            fields = {
				{
                    name = "Player ID",
                    value = "Identifier: "..wd.identifier.." | Charid: "..wd.charid.." | Source: "..wd.source,
                    inline = false
                },
                {
                    name = "Server Date",
                    value = timestamp,
                    inline = true
                }
            }
        },
    }
    PerformHttpRequest(final_webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embeds, username = wh.botname}), { ['Content-Type'] = 'application/json' })
end