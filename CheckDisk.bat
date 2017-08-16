@echo off
Title Check Disk drives for errors and fix them by Hackoo 2016
mode con cols=67 lines=5 & Color 0A
:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
set "TmpLog=%Tmp%\TmpLog.txt"
set "Log=%~dp0%computername%_%~n0.txt"
set "MyVBSFile=%~dp0%~n0_On_Boot.vbs"
set "Value=CHKDSK_ON_BOOT"
Set "Key=HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"
If Exist "%TmpLog%" Del "%TmpLog%"
If exist "%Log%" Del "%Log%"
REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" >nul 2>&1
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo.
ECHO                        **************************************
ECHO                         Running Admin shell... Please wait...
ECHO                        **************************************
 
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
::          START         ::
::::::::::::::::::::::::::::
( Echo Scan started @ & Date /T & Time /T & echo ************************ ) > "%TmpLog%"
setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=2" %%i in ('wmic logicaldisk where "drivetype=3" ^|find /i ":"') do (
    set "fix=%%i"
        Call :Affich !fix!
    (
        echo !fix! Drive
        echo ************************
        echo(
        (echo O
        echo Y) | CHKDSK !fix! /f
        echo(
        echo ************************
    )>> "%TmpLog%"
)
EndLocal
Goto Question
Exit /b
::******************************************************************
:Question
( echo Scan finished @ & Date /T & Time /T & echo ************************ )>> "%TmpLog%"
CMD /U /C Type "%TmpLog%" > "%Log%"
If Exist "%TmpLog%" Del "%TmpLog%"
(
    echo    Answ = MsgBox("Did you want to reboot the computer to complete the scanning ?",VbYesNo+VbQuestion,"Reboot the computer to check hard disk drives for errors by Hackoo"^)
    echo    If Answ = VbYes then
    echo        wscript.Quit(0^)
    echo    Else
    echo        wscript.Quit(1^)
    echo    End If
)>"%tmp%\%~n0.vbs"
 
Cscript /nologo "%tmp%\%~n0.vbs"
IF "%errorlevel%" EQU "1" ( goto AddKey ) else ( goto Shutdown )
::******************************************************************
:Shutdown
echo(
cls
echo(
echo     Save your work - Reboot of your computer in 120 seconds
echo(
echo   Enregistrer vos documents - Redemarrage du PC dans 120 seconds
Call:AddKey && Shutdown.exe /r /t 120 /c "Enregistrer vos documents - Redemarrage du PC dans 120 secondes"
pause>nul
exit /b
::******************************************************************
:Affich
Cls
echo(
echo                ***********************************
Echo                 Please wait a while Scanning "%~1"
echo                ***********************************
Timeout /T 2 /nobreak>nul
exit /b
::******************************************************************
:AddKey
reg query "%key%" /v "%Value%" >nul 2>&1
If "%errorlevel%" EQU "0" ( Goto :EOF
    ) Else (
    reg add "%Key%" /v "%Value%" /t REG_SZ /d "%MyVBSFile%">nul
    (
        echo Option Explicit
        echo 'Run as Admin
        echo If Not WScript.Arguments.Named.Exists("elevate"^) Then
        echo    CreateObject("Shell.Application"^).ShellExecute DblQuote(WScript.FullName^) _
        echo    , DblQuote(WScript.ScriptFullName^) ^& " /elevate", "", "runas", 1
        echo     WScript.Quit
        echo End If
        echo Dim ws,PSCommand,LogFile,ret
        echo LogFile = Left(Wscript.ScriptFullName,InstrRev(Wscript.ScriptFullName, "."^)^) ^& "txt"
        echo set ws = createobject("wscript.shell"^)
        echo PSCommand = "cmd /c Powershell -Command ""& ""Get-winevent -FilterHashTable @{logname='Application'; id='1001'}^|?{$_.providername -match 'wininit'} ^| fl timecreated, message ^| out-file "^& SimpleQuote(LogFile^) ^&""
        echo ret = ws.run(PScommand,0,True^)
        echo ws.run DblQuote(LogFile^)
        echo '**************************************
        echo Function DblQuote(Str^)
        echo    DblQuote = chr(34^) ^& Str ^& chr(34^)
        echo End function
        echo '**************************************
        echo Function SimpleQuote(Str^)
        echo    SimpleQuote = ChrW(39^) ^& Str ^& ChrW(39^)
        echo End Function
        echo '**************************************
    )>"%MyVBSFile%"
start "" "%Log%"
)  
Exit /b
::*******************************************************************