local QBCore = exports['qb-core']:GetCoreObject()

-- GPS command
RegisterCommand('gps', function(source, args, raw)
 TriggerClientEvent('esx_rpchat:getCoords', source, source);
end)

RegisterServerEvent('esx_rpchat:showCoord')
AddEventHandler('esx_rpchat:showCoord', function(source, msg)
  TriggerClientEvent('chat:addMessage', source, {
     template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(0, 90, 90, 0.6); border-radius: 10px;"><i class="fas fa-map-marker-alt"></i> GPS: {0}</div>',
        args = { msg }
    })
end)

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()

    if Config.EnableESXIdentity then name = GetCharacterName(source) end

    TriggerClientEvent('esx_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end)

RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })
  TriggerClientEvent('3dme:triggerDisplay', -1, args, source)
end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  TriggerClientEvent('3ddo:triggerDisplay', -1, args, source)
end)

RegisterCommand('doc', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end
  if args == nil then
  print('source .. args .. rawCommand')
  return
  end
  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end
  local counter_doc = 0
  local pocetOpakovani = tonumber(args)
  if pocetOpakovani < 101 then
    while counter_doc < pocetOpakovani do
        counter_doc = counter_doc + 1 
        TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, counter_doc .. "/" .. pocetOpakovani , { 255, 198, 0 })
        TriggerClientEvent('3ddoa:triggerDisplay', -1, counter_doc .. "/" .. pocetOpakovani, source)
        Citizen.Wait(2000)
    end 
  end
end)

