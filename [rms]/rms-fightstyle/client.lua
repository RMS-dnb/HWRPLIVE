local RSGCore = exports['rsg-core']:GetCoreObject()


RegisterCommand("brawlstyle", function(source, args)
  local _args = tonumber(args[1])
  local ped = PlayerPedId()
  local style = 0x78BAEF07 -- Default: BS_PLAYER

  if _args ~= nil then
      if _args == 1 then
          style = 0x802C604D -- BS_AI
      elseif _args == 2 then
          style = 0x4FF5F0C7 -- BS_AI_BARBRAWL
      elseif _args == 3 then
          style = 0xD888F2FD -- BS_AI_DEFENSIVE
      elseif _args == 4 then
          style = 0xA01B433A -- BS_AI_MOONSHINE_BARBRAWL
      elseif _args == 5 then
          style = 0x3900654C -- BS_BOUNTY_HUNTER
      elseif _args == 6 then
          style = 0x4514DB61 -- BS_BRUISER
      elseif _args == 7 then
          style = 0x6A3BB2C2 -- BS_FEMALE
      elseif _args == 8 then
          style = 0x4DAFDD84 -- BS_FEMALE_STRONG
    --   elseif _args == 9 then
    --       style = 0x1F0BB27A -- BS_MICAH_FINALE
      elseif _args == 9 then
          style = 0x687BF19F -- BS_PLAYER_MOONSHINER
      elseif _args == 10 then
          style = 0x3C6A802F -- BS_PLAYER_WINTER1
      elseif _args == 11 then
          style = 0xC4CABB1B -- BS_QUICK
      elseif _args == 0 then
          style = 0x78BAEF07 -- BS_PLAYER
      end

      Citizen.InvokeNative(0x8BA83CC4288CD56D, ped, style)
      RSGCore.Functions.Notify("Brawling style set to ID: " .. _args, "success")
  else
      RSGCore.Functions.Notify("Invalid argument. Use 0 - 12.", "error")
  end
end)
