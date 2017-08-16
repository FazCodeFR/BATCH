@echo off
REM ::Updated on 03/03/2017 @ 10:05
REM ::Determine if the OS is (32/64 bits) to set the correct path of VirusTotalUploaderTool.
Color 9B & Mode con cols=90 lines=5
Title "%~nx0" for Multi-files VirusTotal Uploader by Hackoo 2017
:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
Set TmpLogFile=%tmp%\TmpLog.txt
If Exist %TmpLogFile% Del %TmpLogFile%
REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" >%TmpLogFile% 2>&1
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo.
ECHO                      **************************************
ECHO                       Running Admin shell... Please wait...
ECHO                      **************************************
 
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
Title "%~nx0" for Multi-files VirusTotal Uploader by Hackoo 2017
:Main
Mode con cols=90 lines=3 & color 9E
REM Determine if the OS is (32/64 bits) to set the correct path of VirusTotalUploaderTool.
IF /I "%PROCESSOR_ARCHITECTURE%"=="x86" (
       Set "VirusTotalUploaderTool=%ProgramFiles%\VirusTotalUploader2\VirusTotalUploader2.2.exe"
   ) else (
       Set "VirusTotalUploaderTool=%programfiles(x86)%\VirusTotalUploader2\VirusTotalUploader2.2.exe"
)
 
If Not Exist "%VirusTotalUploaderTool%" ( Call:Downloading )
Set "Files_List2Upload=%~dp0ListFiles.txt"
echo(
echo           Creating a list of all *.exe files located on your temporary folder ...
Timeout /t 4 /NoBreak>nul
Dir /b /s /A:-D  "%Temp%\*.exe" > "%Files_List2Upload%"
If Not Exist "%Files_List2Upload%" ( Goto :Error )
For /f "delims=" %%f in ('Type "%Files_List2Upload%"') Do (
    Call:Upload2VirusTotal "%%~f"
)
Taskkill /im "VirusTotalUploader2.2.exe" /f >nul 2>&1
Exit
::*********************************************************************************
:Upload2VirusTotal <File>
Title "%~nx0" for Multi-files VirusTotal Uploader by Hackoo 2017
Cls
Set "File2Upload=%~1"
echo(
echo     Please wait a while ! Uploading file "%~nx1" to VirusTotal is in progress ...
Start "" "%VirusTotalUploaderTool%" "%File2Upload%"
Timeout /t 10 /nobreak>nul
exit /b
::*********************************************************************************
:Downloading
Title Downloading VirusTotal Uploader Tool v2.2 by Hackoo 2017
Set "URL=https://www.virustotal.com/static/bin/vtuploader2.2.exe"
Rem Create "MyDownload" folder in the temporary folder
set "MyDownload_Folder=%temp%\MyDownload"
If Not Exist "%MyDownload_Folder%" MD "%MyDownload_Folder%"
Set "Setup_File=%MyDownload_Folder%\vtuploader2.2.exe"
echo(
echo       Please wait a while ! downloading "vtuploader2.2.exe" is in progress ...
Rem Downloading vtuploader2.2.exe to the temporary folder
Call :Download "%URL%" "%Setup_File%"
cls
Color 9A
Title Installing "vtuploader2.2.exe" is in progress ...
echo(
echo                 Installing "vtuploader2.2.exe" is in progress ...
Rem Silent installation of vtuploader2.2.exe the uploading tool
Call :Install_Silently %Setup_File%
Rem Removing the download folder
Call :Clean %MyDownload_Folder%
Goto Main
::*********************************************************************************
:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
exit /b
::*********************************************************************************
:Install_Silently <Setup_File>
"%~1" /S
exit /b
::*********************************************************************************
:Clean <Folder_Setup>
RD "%~1" /S /Q >nul
exit /b
::*********************************************************************************
:Error
cls & Color 4C
echo(
echo   The file "%Files_List2Upload%" dos not exist !
Pause>nul
exit /b
::*********************************************************************************