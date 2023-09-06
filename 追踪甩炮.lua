ZU = 0    --X轴移动距离
YO = 50   --Y轴移动距离

KG = 5    --鼠标键5作为宏开关
On = false --设定初始状态为关闭
function OnEvent(event, arg)
OutputLogMessage("event = %s, arg = %s\n", event, arg)  --显示鼠标按键状态
EnablePrimaryMouseButtonEvents(1)
if (event == "MOUSE_BUTTON_PRESSED" and arg == KG) then  --如果按下了KG，即开头设定的宏开关
	On = not On                                       --切换On的状态
	if(On)then
		OutputLogMessage("Kai \n")                 --输出开关信息
	else
		OutputLogMessage("Guan \n")                --输出开关信息
	end

end
if (event == "MOUSE_BUTTON_PRESSED" and arg == 4 and On) then  --当按下鼠标键1时，执行自定义函数shuaipao（）
	shuaipao()
end
function shuaipao()
	for i = 0, 4 do                                  --从0到4执行4次鼠标移动命令
		MoveMouseRelative(ZU,-YO)                 --左上角为（0,0），右下角为（65535,65535）
	Sleep(5)
end
	Sleep(9)
	PressMouseButton(1)                              --按下鼠标键1
	Sleep(9)
	ReleaseMouseButton(1)                            --释放鼠标键1
	Sleep(9)
	for i = 0, 4 do
		MoveMouseRelative(-ZU,YO)                 --回到原位
	Sleep(5)
end
end
end