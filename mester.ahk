#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LongWait = 250
SmallWait = 15
CountOverwrite = 0
CountLoop = 0

Escape::
ExitApp
Return

^Esc::

Loop 200 {

CountLoop++

WinActivate, Mester - Google Chrome
WinWaitActive, Mester - Google Chrome

WinGetTitle, title, A
if( title != "Mester - Google Chrome" )
{
	MsgBox, nem a mester
	Exit
}

; feladatok menüpont
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {space}

sleep LongWait

; legördülő menü nyitás
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {down}
sleep SmallWait

; kiválasztott string kimásolás
send, ^l
sleep LongWait
send, javascript:prompt('', document.getElementById('form:name').options[document.getElementById('form:name').value].text.replaceAll(' *','').replaceAll('*','').replaceAll('.',' -').replaceAll(':','').replaceAll('?',''));
sleep LongWait
send, {enter}
sleep LongWait
send, ^c
sleep LongWait
send, {tab}
send, {tab}
send, {enter}

sleep SmallWait

; kiválaszt gomb
send, {tab}
sleep SmallWait
send, {space}

sleep LongWait

; megjenelít gomb
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {space}

sleep LongWait*6

; nyomtatás
send, ^p
sleep LongWait*6
send, {enter}
sleep LongWait
send, ^v
sleep LongWait
send, {enter}

sleep 1000

; ha létezik, felülírás
if WinExist("Mentés másként megerősítése")
{
send, {tab}
send, {enter}
CountOverwrite++
	if(CountOverwrite>1)
	{
	MsgBox, CountLoop
	Return
	}
}

sleep LongWait

; bezárás
send, ^w

sleep LongWait

send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
send, {tab}
sleep SmallWait
}

;send, ^f
;send, megjelenít
;send, ^{Enter}

return