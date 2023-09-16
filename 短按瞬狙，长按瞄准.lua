time = GetDate()                                                                        --枪神纪的游戏宏
On = false
KG = 3                                                                                  --以鼠标键3作为开关，即中键。可以按照自己需求改成别的键位
lastRightClickTime = 0
Count = 0                                                                               --计数器，单数时触发瞬狙，双数时不触发瞬狙
function OnEvent(event, arg, pressCount)
    OutputLogMessage("Event: "..event.." Arg: "..arg.."Count:"..Count.."\n")            --输出鼠标状态信息

    if event == "MOUSE_BUTTON_PRESSED" then                                             --鼠标键按下时
        if arg == KG then                                                               --如果按下的是中键
            On = not On                                                                 --打开开关
            Count = 0                                                                   --计数器清0
			if(On)then
				OutputLogMessage("Kai \n")                              --报告开关状态
			else
				OutputLogMessage("Guan \n")
			end
        elseif arg == 2 and On then                                                     --如果按下的是右键
		   PressKey("f")                                                        --开启爆炸射击
		   Sleep(1)
		   ReleaseKey("f")
		   Sleep(15)
		   PressKey("`")							--开启圣痕技能
		   Sleep(1)
		   ReleaseKey("`")
		   Sleep(1)
           	   lastRightClickTime = GetRunningTime()                         
		   	
        end
    elseif event == "MOUSE_BUTTON_RELEASED" and arg == 2 and On then                     --鼠标右键松开时
        local currentTime = GetRunningTime()
        local clickDuration = currentTime - lastRightClickTime                           --查看鼠标右键按下的时间

        if clickDuration < 200 then                                                      --当按下时间小于200ms，计数器+1。
           Count = Count + 1                                                             --如果上一个操作是开镜，计数器会变成2
		  print("Count:", Count)
           shunju()
	    else Count = 1                                                               --当按下时间大于200ms,计数器等于1，不执行瞬狙
                
         end
    end
end

function shunju()
	if Count % 2 == 1 then                                                            --如果上一个动作是瞬狙，计数器会清0，鼠标右键松开时Count=1，执行瞬狙。如果上一个动作是开镜，计数器为1，第二次点击左键，短按Count=2，长按不会执行瞬狙
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
		Count = 0                                                                  --瞬狙完成后计数器清0
	end
end
