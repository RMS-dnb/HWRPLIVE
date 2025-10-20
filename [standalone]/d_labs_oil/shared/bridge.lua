local SERVER = IsDuplicityVersion()
local CLIENT = not IsDuplicityVersion()

Config.Framework = false
local manually = false
local findFramework = false

if Config.Server.CustomFramework == true or Config.Server.CustomFramework == false then
	if GetResourceState('rsg-core') == 'started' then
		Config.Framework = 'RSG'
		findFramework = true
	elseif GetResourceState('vorp_core') == 'started' then
		Config.Framework = 'VORP'
		findFramework = true
	elseif GetResourceState('redem_roleplay') == 'started' then
		Config.Framework = 'REDEMRP_2023'
		findFramework = true
	elseif GetResourceState('qbr-core') == 'started' then
		Config.Framework = 'QBR'
		findFramework = true
	end
elseif Config.Server.CustomFramework == true then
	Config.Framework = 'custom'
else 
	manually = true
	Config.Framework = Config.Server.CustomFramework
	printInfo('Framework','set manually to ' .. Config.Framework)
end

if SERVER then
	if Config.Framework ~= false and Config.Framework ~= 'custom' and not manually and not findFramework then
		printInfo('Framework','not found')
	elseif Config.Framework == 'custom' then
		printInfo('Framework','set to custom')
	elseif not manually then
		printInfo('Framework','Found ' .. Config.Framework)
	end
end


if SERVER then
	local resourceName = GetCurrentResourceName()
	local currentVersion = GetResourceMetadata(resourceName, 'version')
	local fileName = 'oil'  

    local function printDecorative(color, message)
        local colors = {
            green = "\x1b[32m",  
            light_red = "\x1b[91m",
            reset = "\x1b[0m"   
        }
       
		print('\x1b[34m┌───────────────────────────────────────────────────┐\x1b[0m')
		print('                  [VERSION CHECK]                    ')
		print('                  ['..resourceName..']                    ')
		print(' ')
        print(colors[color] .. message)
		print(' ')
        print("    Discord: https://discord.gg/M3VaDXvvVh")
        print("    Keymaster: http://keymaster.fivem.net/assets")
		print("    Docs: http://www.d-labs.site")
		print('\x1b[34m└───────────────── d-labs.tebex.io ─────────────────┘\x1b[0m')
    end

    local function checkversion()
        if currentVersion then
            local url = 'https://raw.githubusercontent.com/RealDubi/CheckVersion/main/' .. fileName
            
            PerformHttpRequest(url, function(err, text, headers)
                if err == 200 then
                    local latestVersion = text:match('^(%S+)')

                    if latestVersion then
                        latestVersion = latestVersion:gsub('%s+', '')

                        if currentVersion == latestVersion then
                            printInfo("VERSION CHECK", "\x1b[32mVersion is up to date ("..currentVersion..")")
                        else
                            printDecorative("light_red", "Version is NOT up to date! Please update from Keymaster! \n Script Version: "..latestVersion.." | Server Version: "..currentVersion)
                        end
                    else
						printInfo("VERSION CHECK", "\x1b[91mScript versions cannot be verified.")
                    end
                else
					printInfo("VERSION CHECK", "\x1b[91mScript versions cannot be verified.")
                end
            end)
        else
			printInfo("VERSION CHECK", "\x1b[91mScript versions cannot be verified.")
        end
    end

	Citizen.Wait(800)
	--checkversion()
end

