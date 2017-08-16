@echo off
Color 0A & Mode con cols=65 lines=3 
Title Profils with Wifi Passwords Keys - By Hackoo
echo.
Echo      Please Wait ... Export Wifi profiles is in progress ...
netsh wlan show profiles  | Findstr /i "Profil" > Profiles.txt
for /f "delims=: Tokens=2" %%a in (Profiles.txt) do (netsh wlan show profiles key=clear name=%%a >> Profiles_WifiTmp.txt)
Cmd /U /C Type Profiles_WifiTmp.txt > Profiles_Wifi.txt
Del Profiles_WifiTmp.txt & Del Profiles.txt
start profiles_Wifi.txt