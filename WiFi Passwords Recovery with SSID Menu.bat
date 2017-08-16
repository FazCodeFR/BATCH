@echo off & Setlocal enabledelayedexpansion
Title WiFi Passwords Recovery with SSID Menu by Hackoo 2017
:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" >nul 2>&1
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo.
ECHO                 **************************************
ECHO                  Running Admin shell... Please wait...
ECHO                 **************************************

    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
:Main
Call :CountLines
%Mod%
set "Input="
set "pwd="
set Count=0
echo   ***************************************************************
echo                                Menu 
echo   ***************************************************************
echo [N][SSID] 
echo    --------------------------------------------------------------
for /f "skip=2 delims=: tokens=2" %%a in ('netsh wlan show profiles') do (
    if not "%%a"=="" (
        set "ssid=%%a"
        set "ssid=!ssid:~1!"
        set /a Count+=1
        echo [!Count!][!ssid!]
        set "N[!Count!]=!ssid!"
    )
)
echo    --------------------------------------------------------------
Set /p "Input=Type the SSID's number to show its password : "
cls
Mode con cols=85 lines=5
for /L %%i in (1,1,%Count%) do (
    If "!Input!" EQU "%%i" (
        Set "Input=!N[%%i]!"
    )
)
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles name^="!Input!" key^=clear ^|find /I "Cont"') do (
    set "pwd=%%a"
)
    If defined pwd (
        echo(
        echo  The password of the SSID [!Input!] is ==^> "!pwd:~1!" without double quotes
    ) else (
        echo(
        color 0C
        echo The password of the SSID [!Input!] is empty or not defined !
    )
echo(
echo Hit any key to return to SSID Menu
Pause>nul & goto Main
::******************************************************************************?*******
:CountLines
set count=
set lines=
set Mod=
for /f "skip=2 delims=: tokens=2" %%a in ('netsh wlan show profiles') do (
    if not "%%a"=="" (
        set /a Count+=1
    )
)
set /a lines=!Count! + 10
Set Mod=Color 9E & Mode con cols=70 lines=!lines!
exit /b
::******************************************************************************?******* 