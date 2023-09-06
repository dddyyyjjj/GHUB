time = GetDate()
On = false
KG = 3
lastRightClickTime = 0
Count = 0

function OnEvent(event, arg, pressCount)
    OutputLogMessage("Event: "..event.." Arg: "..arg.."Count:"..Count.."\n")

    if event == "MOUSE_BUTTON_PRESSED" then
        if arg == KG then
            On = not On
            Count = 0
			if(On)then
				OutputLogMessage("Kai \n") 
			else
				OutputLogMessage("Guan \n")
			end
        elseif arg == 2 and On then
            lastRightClickTime = GetRunningTime()
		   	
        end
    elseif event == "MOUSE_BUTTON_RELEASED" and arg == 2 and On then
        local currentTime = GetRunningTime()
        local clickDuration = currentTime - lastRightClickTime

        if clickDuration < 200 then
           Count = Count + 1
		  print("Count:", Count)
           shunju()
	    else Count = 1
                
         end
    end
end

function shunju()
	if Count % 2 == 1 then
    		PressMouseButton(1)
    		Sleep(1)
    		ReleaseMouseButton(1)
    		Sleep(21)
    		PressKey("q")
    		Sleep(26)
    		ReleaseMouseButton(2)
    		Sleep(30)
   		 ReleaseKey("q")
    		PressKey("q")
    		Sleep(72)
    		ReleaseKey("q")
		Count = 0
	end
end