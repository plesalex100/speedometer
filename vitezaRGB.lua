function text(content) 
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.9,1.9)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(0.9,0.7)
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false))then
			local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
          --  Draw2Txt(1.407, 1.30, 1.14,1.0,0.45,"Viteza", 255,255,255,255)
          drawTxt(1.407, 1.30, 1.07,1.0,0.55,"" .. math.ceil(speed) .." KM/H" , 255, 255, 255, 255)
        --  drawTxt(1.407, 1.30, 1.04,1.0,0.55, " KMH", 255, 255, 255, 255)
            drawTxt(1.407, 1.30, 1.14,1.0,0.55, " Viteza", 255, 255, 255, 255)
        end
        
	end
    end)


    local function RGBRainbow( frequency )
        local result = {}
        local curtime = GetGameTimer() / 1000
    
        result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
        result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
        result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
    
        return result
    end


    function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
        SetTextFont(4)
        SetTextProportional(0)
        SetTextScale(scale, scale)
        local rainbow = RGBRainbow( 1 )
        SetTextColour( rainbow.r, rainbow.g, rainbow.b, 255 )
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x - width/2, y - height/2 + 0.005)
    end 
