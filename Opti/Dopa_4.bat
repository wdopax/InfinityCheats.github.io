@echo off
color A
title @DOPA7HACKS

call :checkPermissions
call :Dopa7Hacks
cls

echo Limpiando...
ipconfig /flushdns
ipconfig /release
ipconfig /renew

rd /s /f /q c:\windows\temp\*.* >nul 2>&1
rd /s /q c:\windows\temp >nul 2>&1
md c:\windows\temp >nul 2>&1
del /s /f /q C:\WINDOWS\Prefetch >nul 2>&1
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1
deltree /y c:\windows\tempor~1 >nul 2>&1
deltree /y c:\windows\temp >nul 2>&1
deltree /y c:\windows\tmp >nul 2>&1
deltree /y c:\windows\ff*.tmp >nul 2>&1
deltree /y c:\windows\history >nul 2>&1
deltree /y c:\windows\cookies >nul 2>&1
deltree /y c:\windows\recent >nul 2>&1
deltree /y c:\windows\spool\printers >nul 2>&1
del c:\WIN386.SWP >nul 2>&1

for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

cls
call :Dopa7Hacks
echo all clean bitch!
echo.
exit

:checkPermissions
fsutil dirty query %systemdrive% >nul
if %errorLevel% NEQ 0 (
	echo Try again as Administrator.
	echo.
	echo Press any key to exit...
	pause > nul
	exit
)
exit /b

:do_clear
echo Borrando %1
wevtutil.exe cl %1
goto :eof

:Dopa7Hacks
echo. PC PRIVATE CLEANING @Dopa7Hacks
exit /b
