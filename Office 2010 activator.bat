@echo off
@color 0C
title IORRT 3.0

REM Variables
set InstallRoot=
set OfficeArchType=

REM Check Office Architecture Type
if '%processor_architecture%'=='x86' Set OfficeArchType=32 && Goto:EndArchCheck
goto:WOWCheck

:WOWCheck
2>nul REG QUERY HKLM\SOFTWARE\Microsoft\Office\14.0\Common | find /i "InstallRoot" 1>nul
IF ERRORLEVEL 1 Set OfficeArchType=WOW && Goto:EndArchCheck
Set OfficeArchType=64

:EndArchCheck

REM Get Office Installed Path
if %OfficeArchType%==WOW (
FOR /F "tokens=2* delims=     " %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\14.0\Common\InstallRoot?" /v Path') DO SET InstallRoot=%%B 
Goto:FoundPath
)
FOR /F "tokens=2* delims=     " %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\14.0\Common\InstallRoot" /v Path') DO SET InstallRoot=%%B

:FoundPath

REM Start OSPPSVC (To make sure it is started to prevent strange cases where it doesn't start automatically from failing (XP))
1>nul 2>nul net start osppsvc

:MAINMENU
mode con: cols=45 lines=10
CLS
echo.
echo.
echo. 
echo. InfiniteOfficeRestoreRearmTask (IORRT) 
echo. 
echo. A. Install
echo. B. Uninstall
echo. C. Restore/Rearm
echo. D. Status
echo. E. Exit
echo.

:CHOOSEACTION
set /p userinp= ^ Make your selection: 
set userinp=%userinp:~0,1%
if /i "%userinp%"=="A" goto Install
if /i "%userinp%"=="B" goto Uninstall
if /i "%userinp%"=="C" goto Restore/Rearm
if /i "%userinp%"=="D" goto Status
if /i "%userinp%"=="E" goto Exit
echo.Try Again...
GOTO CHOOSEACTION

:Install
CLS
mode con: cols=64 lines=21
title IORRT 3.0
schtasks /query | FINDSTR /I "IORRT" >NUL 
IF ERRORLEVEL 1 (
echo Checking rearm status...
echo.
) ELSE (
echo IORRT has already been installed...
echo.
echo Press any key to return to the main menu
PAUSE 1>nul
GOTO MAINMENU
)
mkdir "%SystemDrive%\Check"
net stop osppsvc
xcopy /cheriky "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" "%SystemDrive%\Check\Backup\Files\Tokens"
mkdir "%SystemDrive%\Check\Backup\Registry"
reg save "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\Check\Backup\Registry\OfficeSPPInfo.hiv
net start osppsvc
IF Exist "%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" ( 
"%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" 
) ELSE ( "%commonprogramfiles(x86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" 
)
if errorlevel==0 goto Pass
net stop osppsvc
xcopy /cheriky "%SystemDrive%\Check\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform"
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\Check\Backup\Registry\OfficeSPPInfo.hiv
net start osppsvc
DEL "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\Backup.hiv"
SET file=%SystemDrive%\Check
IF EXIST %file% attrib -h %file%
RD /S /Q %file%
echo.
echo.No rearms detected... 
echo.
echo.Press any key to return to the main menu
pause > nul
GOTO MAINMENU
)
:Pass
net stop osppsvc
xcopy /cheriky "%SystemDrive%\Check\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform"
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\Check\Backup\Registry\OfficeSPPInfo.hiv
net start osppsvc
DEL "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\Backup.hiv"
SET file=%SystemDrive%\Check
IF EXIST %file% attrib -h %file%
RD /S /Q %file%
echo.
echo Installing IORRT...
echo.
mkdir "%SystemDrive%\IORRT"
net stop osppsvc
xcopy /cheriky "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" "%SystemDrive%\IORRT\Backup\Files\Tokens"
mkdir "%SystemDrive%\IORRT\Backup\Registry"
reg save "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv
net start osppsvc
SET file=%SystemDrive%\IORRT\IORRT.bat
IF EXIST %file% attrib -h %file% 
echo @echo off >%file%
echo net stop osppsvc >>%file%
echo xcopy /cheriky "%SystemDrive%\IORRT\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" >>%file%
echo REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >>%file%
echo REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >>%file%
echo reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv >>%file%
echo net start osppsvc >>%file%
echo IF Exist "%COMMONPROGRAMFILES%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" ( >>%file%
echo "%COMMONPROGRAMFILES%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >>%file%
echo ) ELSE ( "%COMMONPROGRAMFILES(X86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >>%file%
echo ) >>%file%
echo schtasks /delete /tn "IORRT" /f >>%file%
echo schtasks /create /tn "IORRT" /tr "%SystemDrive%\IORRT\IORRT.bat" /sc daily /mo 1 /ru "" >>%file%
IF Exist "%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" ( 
"%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" 
) ELSE ( "%commonprogramfiles(x86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" 
)
schtasks /create /tn "Hybrid" /tr "%SystemDrive%\IORRT\IORRT.bat" /sc onstart /ru ""
schtasks /create /tn "IORRT" /tr "%SystemDrive%\IORRT\IORRT.bat" /sc daily /mo 1 /ru ""
echo.
cd /d "%InstallRoot%"
cscript OSPP.VBS /dstatus
schtasks /query | FINDSTR /I "IORRT"
echo.Press any key to return to the main menu
pause > nul
GOTO MAINMENU
)

:Uninstall
mode con: cols=64 lines=21
title IORRT 3.0
schtasks /query | FINDSTR /I "IORRT" >NUL
IF '%ERRORLEVEL%' EQU '0' (
echo Uninstalling IORRT...
echo.
) ELSE (
echo IORRT is already uninstalled...
echo.
echo Press any key to return to the main menu
PAUSE 1>nul
GOTO MAINMENU
)
net stop osppsvc
xcopy /cheriky "%SystemDrive%\IORRT\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform"
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv
net start osppsvc
DEL "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\Backup.hiv"
SET file=%SystemDrive%\IORRT
IF EXIST %file% attrib -h %file%
RD /S /Q %file%
schtasks /delete /tn "Hybrid" /f
schtasks /delete /tn "IORRT" /f
cd /d "%InstallRoot%"
cscript OSPP.VBS /dstatus
schtasks /query | FINDSTR /I "IORRT"
echo.
echo.Press any key to return to the main menu
pause > nul
GOTO MAINMENU
)

:Restore/Rearm
mode con: cols=64 lines=21
title IORRT 3.0
schtasks /query | FINDSTR /I "IORRT" >NUL 
IF '%ERRORLEVEL%' EQU '0' (
echo Restoring/Rearming...
echo.
) ELSE (
echo Install IORRT before you Restore/Rearm...
echo.
echo Press any key to return to the main menu
PAUSE 1>nul
GOTO MAINMENU
)
net stop osppsvc
xcopy /cheriky "%SystemDrive%\IORRT\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform"
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv
net start osppsvc
IF Exist "%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" ( 
"%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" 
) ELSE ( "%commonprogramfiles(x86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" 
)
schtasks /delete /tn "IORRT" /f 
schtasks /create /tn "IORRT" /tr '"%SystemDrive%\IORRT\IORRT.bat"' /sc daily /mo 1 /ru ""
cd /d "%InstallRoot%"
cscript OSPP.VBS /dstatus
schtasks /query | FINDSTR /I "IORRT"
echo.Press any key to return to the main menu
pause > nul
GOTO MAINMENU
)

:Status
mode con: cols=64 lines=21
title IORRT 3.0
cd /D "%InstallRoot%"
cscript OSPP.VBS /dstatus
schtasks /query | FINDSTR /I "IORRT"
IF ERRORLEVEL 1 echo IORRT is not yet Installed
echo.
echo.Press any key to return to the main menu
pause > nul
GOTO MAINMENU
)

:Exit
PM Find TS Quote  Quote this post Report
03