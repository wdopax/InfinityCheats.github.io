Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "C:\Windows\Temp\resume_internet.bat" & Chr(34), 0
Set WshShell = Nothing