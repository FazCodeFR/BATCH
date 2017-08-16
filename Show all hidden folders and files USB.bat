@echo off
cls & color 0A & echo.
Mode con cols=75 lines=7
Title Show all hidden folders and files on your USB key by Hackoo 2016
:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment">nul 2>&1
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo.
ECHO                    **************************************
ECHO                     Running Admin shell... Please wait...
ECHO                    **************************************

Goto UACPrompt
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
Set TmpLog=%tmp%\Tmp.txt
Set Log=%tmp%\USBLog.txt
If exist %TmpLog% Del %TmpLog%
for /f "tokens=2" %%i in ('wmic logicaldisk where "drivetype=2" ^|find /i ":"') do (Set MyUSB=%%i)
cls
setlocal ENABLEDELAYEDEXPANSION
set _drive=%MyUSB%
If Exist !_drive! (
cls
echo.
echo           #########################################################
echo                        Your usb key is connected as !_drive!
echo           #########################################################
echo.
pause
Attrib -s -h -r !_drive!\*.* /S /D >> !TmpLog! 2>&1
Cmd /U /C Type !TmpLog! > !Log!
If exist !TmpLog! Del !TmpLog!
Explorer "!_drive!\"
) ELSE (
cls
color 0C
echo.
echo           #########################################################
echo                         Your usb key is not detected
echo           #########################################################
echo.
pause
Exit
)