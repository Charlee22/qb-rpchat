local nbrDisplaying = 1

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offsetme = 1.04 + (nbrDisplaying*0.15)
    DisplayMe(GetPlayerFromServerId(source), text, offsetme)
end)

RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
    local offsetdo = 1.30 + (nbrDisplaying*0.15)
    DisplayDo(GetPlayerFromServerId(source), text, offsetdo)
end)

RegisterNetEvent('3ddoa:triggerDisplay')
AddEventHandler('3ddoa:triggerDisplay', function(text, source)
    local offsetdoa = 1.34 + (nbrDisplaying*0.15)
    DisplayDoa(GetPlayerFromServerId(source), text, offsetdoa)
end)

function DisplayMe(mePlayer, text, offsetme)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Dme(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetme-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DisplayDo(mePlayer, text, offsetdo)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(4000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Ddo(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdo-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DisplayDoa(mePlayer, text, offsetdoa)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(1900)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Ddo(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdoa-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3Dme(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
      SetTextScale(0.35, 0.33)
      --SetTextFont(4)
      SetTextFont(13)
      SetTextDropshadow(10, 100, 100, 100, 255)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 255)
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
          local factor = (string.len(text)) / 300
          DrawRect(_x,_y+0.0135, 0.025+ factor, 0.0, 166, 166, 166, 68)
      end
  end
  
  
  
  
  function DrawText3Ddo(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
      SetTextScale(0.35, 0.33)
      --SetTextFont(4)
      SetTextFont(13)
      SetTextDropshadow(10, 100, 100, 100, 255)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 215)
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
          local factor = (string.len(text)) / 300
          DrawRect(_x,_y+0.10, 0.0+ factor, 0.0, 166, 166, 166, 68)
      end
  end
  
  function DrawText3Ddoa(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
      SetTextScale(0.35, 0.35)
      --SetTextFont(4)
      SetTextFont(13)
      SetTextDropshadow(10, 100, 100, 100, 255)
      SetTextProportional(1)
      SetTextColour(97, 22, 182, 215)
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
          local factor = (string.len(text)) / 300
          DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 166, 166, 166, 68)
      end
  end

-- 3D STAV
RegisterNetEvent('esx_rpchat:sendStav')
AddEventHandler('esx_rpchat:sendStav', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
            --template = '<div style="padding-top: 0.22vw; padding-bottom: 0.37vw; padding-left: 1.35vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(105, 105, 105, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.3px black, 0.0px 0 black, 0 0px black; box-shadow: -0.5px 0 black, 0 0.5px black, 0.5px 0 black, 0 -1px black; border-radius: 3px;">             <font style="background-color:rgba(0, 128, 128, 1.0); font-size: 15px; margin-left: 0px; padding-bottom: 3.0px; padding-left: 3.0px; padding-top: 3.0px; padding-right: 3.0px;border-radius: 0px;"> <b> STAV</b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
            template = '<div style="padding-top: 0.22vw; padding-bottom: 0.22vw; padding-left: 0.2vw; padding-right: 0.35vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.45); font-weight: 100; text-shadow: 0px 0 black, 0 0.03px black, 0.0px 0 black, 0 0px black; box-shadow: -100px 100 black, 100 100px black, 100px 100 black, 100 -100px black; border-radius: 3px;">             <font style="background-color:rgba(0, 128, 128, 1.0); font-size: 15px; margin-left: 0px; padding-bottom: 3.0px; padding-left: 3.0px; padding-top: 3.0px; padding-right: 3.0px;border-radius: 0px;"> <b> <font color="#000000"> STAV</font></b></font><font style=" font-weight: 800; font-size: 16px; margin-left: 5px; padding-bottom: 5.2px; border-radius: 0px;"><b> </b> {0} </font><font style=" font-weight: 500; font-size: 16px; border-radius: 0px;">| {1} </font></div>',
            args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('3stav:triggerDisplay')
AddEventHandler('3stav:triggerDisplay', function(text, source)
    local offsetdoa = 2.1 + (nbrDisplaying*0.15)
    local target = GetPlayerFromServerId(source)
    if target ~= -1 then
    DisplayStav(GetPlayerFromServerId(source), text, offsetdoa)
    end
end)

function DisplayStav(mePlayer, text, offsetdo)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(300000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3DStav(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdo-1.250, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3DStav(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.35, 0.35)
    --SetTextFont(4)
    SetTextFont(13)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0125, 0.01+ factor, 0.03, 0, 128, 128, 100)
    end
end

RegisterNetEvent('3stav:stopDisplay')
AddEventHandler('3stav:stopDisplay', function()
    displaying = false
end)
