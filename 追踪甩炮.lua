ZU = 0    --X���ƶ�����
YO = 50   --Y���ƶ�����

KG = 5    --����5��Ϊ�꿪��
On = false --�趨��ʼ״̬Ϊ�ر�
function OnEvent(event, arg)
OutputLogMessage("event = %s, arg = %s\n", event, arg)  --��ʾ��갴��״̬
EnablePrimaryMouseButtonEvents(1)
if (event == "MOUSE_BUTTON_PRESSED" and arg == KG) then  --���������KG������ͷ�趨�ĺ꿪��
	On = not On                                       --�л�On��״̬
	if(On)then
		OutputLogMessage("Kai \n")                 --���������Ϣ
	else
		OutputLogMessage("Guan \n")                --���������Ϣ
	end

end
if (event == "MOUSE_BUTTON_PRESSED" and arg == 4 and On) then  --����������1ʱ��ִ���Զ��庯��shuaipao����
	shuaipao()
end
function shuaipao()
	for i = 0, 4 do                                  --��0��4ִ��4������ƶ�����
		MoveMouseRelative(ZU,-YO)                 --���Ͻ�Ϊ��0,0�������½�Ϊ��65535,65535��
	Sleep(5)
end
	Sleep(9)
	PressMouseButton(1)                              --��������1
	Sleep(9)
	ReleaseMouseButton(1)                            --�ͷ�����1
	Sleep(9)
	for i = 0, 4 do
		MoveMouseRelative(-ZU,YO)                 --�ص�ԭλ
	Sleep(5)
end
end
end