RSHIFT::Suspend
!F4::Return 
*RCTRL::
*z::Send {LButton Down}
*RCTRL UP::
*z Up::Send {LButton Up}
*/::
*c::Send {RButton Down}
/ UP::
*c UP::Send {RButton Up}
Up::
	gosub Move
return

Left::
	gosub Move
return

Right::
	gosub Move
return

Down::
	gosub Move
return

Move:
	Rate := 0
	Loop
	{
		X := Y := 0
		if GetKeyState("left", "P" )
{
			Rate:=Rate+2
			X := -Rate
}
		else if GetKeyState("right", "P")
{
			Rate:=Rate+2
			X := Rate
}
		if GetKeyState("up", "P")
{
			Rate:=Rate+2
			Y := -Rate
}
		else if GetKeyState("down", "P")
{
			Rate:=Rate+2
			Y := Rate
}
		if (!X and !Y)
			return
		else
			MouseMove, X, Y,,R
	}
return


