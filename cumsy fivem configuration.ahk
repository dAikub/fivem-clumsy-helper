#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





































































































































































































#SingleInstance, force
oldbutton = NULL
time_values = 50
normal = 0
hits_cooldown = 0
hotkey_dummy_home = 1
stealth_mode = 0
timefor_pool = 0
stealth_modetime = 1000
bottle_mode = 1
button_w = Space
button_w2 =LShift
backstep_mode = 1
freeze_in = 0
enable_kill_reviver = 1
status = inbound
swingswag = 1



if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"	


IfWinExist, clumsy 0.3
{

}
else
{
	Exitapp
	return
}
Gui, Color, c282828, Verdana
Gui, Font, s8, Calisto MT

Gui, Add, Picture, x25 Y25 gBestSettingsButton Group,%a_workingdir%\button.png
Gui, Add, Text, x50 y37 cWhite center +BackgroundTrans vBestSettingsButtontext, 
Gui, Add, Text, x150 y26 cWhite center +BackgroundTrans vTextjd, Button
Gui, Add, DropDownList, x150 y40 vButtonChosse gChangeButton, LShift

Gui, Show, W320 H100, -
return

ChangeButton:
{
    GuiControlGet, checkifnull,,ButtonChosse
    if checkifnull = null
    {
        if oldbutton = NULL
        {
            return
        }
        else
        {
            HotKey, ~%var% & LButton, Off
            HotKey, ~%var% & ~f, Off
	    HotKey, ~f, Off
	    HotKey, ~%button_w% & ~%button_w2% , Off
	    ;HotKey, ~s, Off
	    ;HotKey, ~%var% & ~s, Off
	HotKey, ~%var% & ~4, Off
	HotKey, ~4, Off
	;HotKey, ~D & ~SPACE, Off

            return
        }
        return
    }
    if oldbutton = NULL
    {
        GuiControlGet, var,,ButtonChosse
        HotKey, ~%var% & LButton, StartLag
        HotKey, ~%var% & ~f, StartLag2
	HotKey, ~%var% & ~4, BACKSTEP
	HotKey, ~4, BACKSTEP
	;HotKey, ~D & ~SPACE, BACKSTEP
	
	HotKey, ~f, StartLag2
	;HotKey, ~XButton2, StartLag3
	;HotKey, ~%var% & ~s, StartLag3
        oldbutton = %var%
    }
    else
    {
        HotKey, %oldbutton% & LShift, Off
        GuiControlGet, var,,ButtonChosse
        HotKey, ~%var% & LButton, StartLag
        HotKey, ~%var% & ~f, StartLag2
	HotKey, ~%var% & ~4, BACKSTEP
	HotKey, ~4, BACKSTEP
	;HotKey, ~D & ~SPACE, BACKSTEP
	HotKey, ~f, StartLag2
	;HotKey, ~s, StartLag3
	;HotKey, ~%var% & ~s, StartLag3
        oldbutton = %var%
    }
    return
}

return
BestSettingsButton:
{
	;ControlClick, Button2, clumsy 0.2
	ControlGet, var,Checked,,Button4,clumsy 0.2
	loop
	{
		ControlGet, var,Checked,,Button4,clumsy 0.2
		if var = 0
		{
			ControlFocus, Button4, clumsy 0.2
			sleep 10
			ControlClick, Button4, clumsy 0.2
			ControlClick, Button4, clumsy 0.2
		}
		else
		{
			Break
		}
	}
	Sleep 50
	ControlClick, Button7, clumsy 0.2
	Sleep 50
	ControlClick, Button10, clumsy 0.2
	Sleep 50
	ControlClick, Button13, clumsy 0.2
	Sleep 50
	ControlSetText, Edit6, 0, clumsy 0.2
	Sleep 50
	ControlSetText, Edit7, 0, clumsy 0.2
	Sleep 50
	ControlSetText, Edit2, 0, clumsy 0.2
	sleep 50
	ControlSetText, Edit3, 100.0, clumsy 0.2
	sleep 50
	ControlSetText, Edit4, 0, clumsy 0.2
	sleep 50
	ControlSetText, Edit5, 100.0, clumsy 0.2
	sleep 50
	ControlGet, var, Choice,,Edit1,clumsy 0.2
	sleep 50



	ControlSetText, Edit1, inbound, clumsy 0.2
	sleep 50

	msgbox, Start
	return
}

return

ExitApptray:
{
	Exitapp
	return
}
RunWekeSite:
{
	return
}
 
GuiClose:
ExitApp
return


~[ & ~]::
{
	if backstep_mode = 1
	{
		;HotKey, ~RButton   & ~A, BACKSTEP
		;HotKey, ~RButton  & ~A, On
		;HotKey, ~RButton  & ~D , BACKSTEP
		;HotKey, ~RButton  & ~D , On
		;HotKey, ~RButton  & ~W , BACKSTEP
		;HotKey, ~RButton  & ~W , On
		HotKey, ~D  & ~S , BACKSTEP
		HotKey, ~D  & ~S , On
		backstep_mode = 0
	}
	else
	{
		backstep_mode = 1
		;HotKey, ~RButton  & ~A, Off
		HotKey, ~D & ~S, Off
		;HotKey, ~RButton & ~D , Off
		;HotKey, ~RButton & ~W , Off
	}
}
return

~LShift & ~V::
{
	if backstep_mode = 1
	{
		HotKey, ~D & ~S, BACKSTEP
		HotKey, ~D & ~S, On
		backstep_mode = 0
	}
	else
	{
		backstep_mode = 1
		HotKey, ~D & ~S, Off
	}
}
return

;เปิดรำไม้คลิกปกติ
~END::
{	
	if hotkey_dummy_home = 1
	{
		status = outbound
		hotkey_dummy_home = 0
	}
	else
	{
		status = inbound
		hotkey_dummy_home = 1
		
	}
}
return

Home::
{	
	if swingswag = 1
	{
		timefor_pool = 1000
		swingswag = 0
	}
	else
	{
		timefor_pool = 0
		swingswag = 1
		
	}
}
return

MButton::
{
	if stealth_mode = 0
	{
		stealth_mode = 1
		stealth_modetime = 1650
	}else{
		stealth_mode = 0
		stealth_modetime = 900
	}
}
return

XButton2::
{
	time_values = 500
	normal = 0
}
return


XButton1::
{
	time_values = 700
	normal = 0
}
return

~LShift & ~L::
{
	time_values = 100
	normal = 0
}
return

RAlt:: 
{
	normal = 1
}
return

LShift & XButton1::
{
	time_values = 700
	normal = 0
}
return

LShift & XButton2::
{
	time_values = 500
	normal = 0
}
return

LShift & RAlt::
{
	normal = 1
}
return



;LShift & E::
;{
	
;	if enable_kill_reviver = 1
;	{
;		enable_kill_reviver = 0
;		HotKey, ~LShift & ~s, Revive_kill
;		HotKey, ~s, Revive_kill
;		HotKey, ~LShift & ~s, On
;		HotKey, ~s, On


;	}
;	else
;	{
;		enable_kill_reviver = 1
;		HotKey, ~LShift & ~s, Off
;		HotKey, ~s, Off
;	}
;}
;return

	




;BOTTLE MODE
~RCtrl::
{
	if bottle_mode = 1

	{
		GuiControlGet, var,,ButtonChosse
       		HotKey, ~LShift & ~w, Bottle
		bottle_mode = 0
		HotKey, ~LShift & ~w, On 
		;HotKey, ~%var% & LButton, Off



	}
	else
	{
		
		HotKey, ~LShift & ~w , Off
		;HotKey, ~%var% & LButton, On
		bottle_mode = 1
	}
}
return


;~F::
;	SendInput, {LShift}
;return

~F9::
	Sendinput {Enter}{Enter}
return


StartLag:
{
	GuiControlGet, var,,ButtonChosse
	if normal = 1
	{
		return
	}
	else
	{
		ControlSetText, Edit1, %status%, clumsy 0.2
		HotKey, ~%var% & ~f, Off
		HotKey, ~f, Off
		HotKey, ~%var% & ~4, Off
		HotKey, ~4, Off
		Sleep timefor_pool
		
		ControlClick, Button2, clumsy 0.2
		;SoundBeep ,400
		Sleep time_values
		ControlClick, Button2, clumsy 0.2
		;Sleep 800
		;ControlClick, Button2, clumsy 0.2
		;Sleep 700
		;ControlClick, Button2, clumsy 0.2
		
		
   	       	HotKey, ~%var% & ~f, On
		HotKey, ~f, On
		HotKey, ~%var% & ~4, On
		HotKey, ~4, On

		Sleep stealth_modetime

		if stealth_mode = 1
			if hits_cooldown = 1
			{
				Sleep 1800
				hits_cooldown = 0
			}
			else
			{
				hits_cooldown = 1            
			}
			return	

	}
}




BACKSTEP:
{	
	ControlGet, var, Choice,,Edit1,clumsy 0.2
	if freeze_in = 0
	{
		ControlSetText, Edit1, outbound, clumsy 0.2
		ControlClick, Button2, clumsy 0.2
		;Sleep 150
		Sleep 300
		ControlClick, Button2, clumsy 0.2

		
		ControlSetText, Edit1, %status%, clumsy 0.2
		Sleep 300
	}
}
return



Bottle:
{
	if freeze_in = 0
	{
		ControlSetText, Edit1,status, clumsy 0.2
		ControlSetText, Edit2, 3000, clumsy 0.2
		ControlClick, Button2, clumsy 0.2
		Sleep 600
		ControlClick, Button2, clumsy 0.2
		


		
		Sleep 1800
		ControlSetText, Edit1,inbound, clumsy 0.2
		ControlSetText, Edit2, 3000, clumsy 0.2
		;if hits_cooldown = 1
		;{
			;Sleep 1800
		;	Sleep 800
		;	hits_cooldown = 0
		;}
		;else
		;{
		;	hits_cooldown = 1            
		;}
		;return		
		
	}

}
return

Revive_kill:
{
	GuiControlGet, var,,ButtonChosse
	ControlSetText, Edit1,inbound, clumsy 0.2
	Sleep 1500
	ControlClick, Button2, clumsy 0.2
	Sleep 400
	ControlClick, Button2, clumsy 0.2

}
return



StartLag2:
{
	GuiControlGet, var,,ButtonChosse
	ControlSetText, Edit1,inbound, clumsy 0.2
	ControlClick, Button2, clumsy 0.2
		

	if freeze_in = 0
	{			
		bottle_mode = 0
		ControlSetText, Edit2, 3000, clumsy 0.2
		sleep 50
		ControlSetText, Edit3, 0, clumsy 0.2
		sleep 50
		ControlSetText, Edit4, 1000, clumsy 0.2
		sleep 50

		HotKey, ~%var% & LButton, Off
		HotKey, ~%var% & ~4, Off
		HotKey, ~4, Off
		freeze_in = 1



		
		
	}else{
	    
		HotKey, ~%var% & LButton, On
		HotKey, ~%var% & ~4, On
		HotKey, ~4, On
		bottle_mode = bottle_mode_default
		freeze_in = 0
		ControlSetText, Edit2, 0, clumsy 0.2
		sleep 50
		ControlSetText, Edit3, 100.0, clumsy 0.2
		sleep 50
		ControlSetText, Edit4, 0, clumsy 0.2
		sleep 50


	}

}


