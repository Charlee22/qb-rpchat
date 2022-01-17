RegisterNetEvent('esx_rpchat:sendMe')
AddEventHandler('esx_rpchat:sendMe', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding-top: 0.32vw; padding-bottom: 0.32vw; padding-left: 0.32vw; padding-right: 0.32vw; margin: 0.32vw; background-color: rgba(0, 0, 0, 0.0); font-weight: 100; text-shadow: 1px 1 black, 1 1.0px black, 1.1px 1 black, 1 1px black; box-shadow: 1.5px 1 black, 0 0.5px black, 1.5px 1 black, 1 1px black; border-radius: 5px;">             <font style="background-color:rgba(255, 0, 0, 1.0); font-size: 14px; margin-left: 0px; padding-bottom: 4.5px; padding-left: 4.5px; padding-top: 4.5px; padding-right: 4.5px;border-radius: 5px;"> <b> <font color="#000000"> ME</font></b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> <font color="#ffffff"> {0}</font></font><font style=" font-weight: 500; font-size: 16px; border-radius: 5px;"> -> {1} </font></div>',
        args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendDo')
AddEventHandler('esx_rpchat:sendDo', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding-top: 0.28vw; padding-bottom: 0.28vw; padding-left: 0.28vw; padding-right: 0.28vw; margin: 0.28vw; background-color: rgba(0, 0, 0, 0.0); font-weight: 100; text-shadow: 1px 1 black, 1 1.0px black, 1.1px 1 black, 1 1px black; box-shadow: 1.5px 1 black, 0 0.5px black, 1.5px 1 black, 1 1px black; border-radius: 5px;">            <font style="background-color:rgba(4, 0, 255, 1.0); font-size: 14px; margin-left: 0px; padding-bottom: 4.5px; padding-left: 4.5px; padding-top: 4.5px; padding-right: 4.5px;border-radius: 5px;"> <b> <font color="#000000"> DO</font></b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> <font color="#ffffff"> {0}</font></font><font style=" font-weight: 500; font-size: 16px; border-radius: 5px;"> -> {1} </font></div>',
        args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendLocalOOC')
AddEventHandler('esx_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding-top: 0.32vw; padding-bottom: 0.32vw; padding-left: 0.32vw; padding-right: 0.32vw; margin: 0.32vw; background-color: rgba(0, 0, 0, 0.0); font-weight: 100; text-shadow: 1px 1 black, 1 1.0px black, 1.1px 1 black, 1 1px black; box-shadow: 1.5px 1 black, 0 0.5px black, 1.5px 1 black, 1 1px black; border-radius: 5px;">            <font style="background-color:rgba(199, 254, 255, 1.0); font-size: 14px; margin-left: 0px; padding-bottom: 4.5px; padding-left: 4.5px; padding-top: 4.5px; padding-right: 4.5px;border-radius: 5px;"> <b> <font color="#000000"> L-OOC</font></b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> <font color="#ffffff"> {0}</font></font><font style=" font-weight: 500; font-size: 16px; border-radius: 5px;"> -> {1} </font></div>',
        args = { title, message }
    })
	end
  end
end)

RegisterCommand('try', function(source, args, rawCommand)
	local luck = math.random(1,2)
	if luck == 2 then
	ExecuteCommand('do Ano')
	elseif luck == 1 then 
	ExecuteCommand('do Ne')
  end
  end)

RegisterNetEvent('esx_rpchat:getCoords')
AddEventHandler('esx_rpchat:getCoords', function(player)
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped, false)
    local heading = GetEntityHeading(ped)

    local message = tostring("X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z .. " HEADING: " .. heading)
    TriggerServerEvent('esx_rpchat:showCoord', player, message)

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		--TriggerEvent('chat:removeSuggestion', '/tweet')
		--TriggerEvent('chat:removeSuggestion', '/me')
		--TriggerEvent('chat:removeSuggestion', '/do')
    TriggerEvent('chat:removeSuggestion', '/bm')
    TriggerEvent('chat:removeSuggestion', '/rk')
    TriggerEvent('chat:removeSuggestion', '/rukojmi')
    TriggerEvent('chat:removeSuggestion', '/nazada')
    TriggerEvent('chat:removeSuggestion', '/narameno')
    TriggerEvent('chat:removeSuggestion', '/givecar')
    TriggerEvent('chat:removeSuggestion', '/givecarplate')
	--	TriggerEvent('chat:removeSuggestion', '/news')
		--TriggerEvent('chat:removeSuggestion', '/inzerat')
		TriggerEvent('chat:removeSuggestion', '/gps')
		--*TriggerEvent('chat:removeSuggestion', '/doc')
	end
end)