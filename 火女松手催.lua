On = false
KG = 4
Count = 2
EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg, pressCount)
    OutputLogMessage("Event: "..event.." Arg: "..arg.."Count"..Count.."\n")
	if event == "MOUSE_BUTTON_PRESSED"then
		if arg == KG then
		   On = not On
		   Count = 2
			if (On)then
				OutputLogMessage("Kai\n")
			else
				OutputLogMessage("Guan\n")
			end
		elseif arg == 1 and On then
			Count = Count+1
		end
	elseif event ==  "MOUSE_BUTTON_RELEASED"and arg == 1 and On then
			cuihua()
		else Count = 2
		
	end
end
function cuihua()
	if Count % 2 ==1 then
		PressKey("q")
		Sleep(1)
		ReleaseKey("q")
		Sleep(275)
		PressMouseButton(1)
		Sleep(30)
		ReleaseMouseButton(1)
		Sleep(80)
		PressKey("q")
		Sleep(1)
		ReleaseKey("q")
		Count = 2
	end
end