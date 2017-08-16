@Echo off && Title LAN IP Scanner
Mode 80,50
Setlocal EnableDelayedExpansion

If Exist Results.txt (
    goto :Intro
) Else (
    goto :DefaultGate_Check
)

:Intro
Set /p showResults=Show previous results? Y/N
If /i %showResults% == y goto :Results
If /i %showResults% == n del /f /s /q "Results.txt"

:DefaultGate_Check
If Exist DefaultGate.sav For /F "tokens=* delims= " %%i in (DefaultGate.sav) do (
        Set defaultGateway=%%i
        Goto :Loop
    )
)

:Main
Echo.
Echo Type first 3 rows of your default gateway.
Echo.
Ipconfig /all | Find /i "Default Gateway"
Echo.
Set /p "defaultGateway=>>: "
Echo %defaultGateway% >> DefaultGate.sav

:Loop
Cls
Echo.
Echo IP range %defaultGateway%.1 - %defaultGateway%.255 now Scanning.
Echo.
Echo This may take a few minutes.
Echo.
echo %Name%|set/pName=[Process
For /L %%a in (1,1,255) do Ping %defaultGateway%.%%a -n 1 | Find /I "TTL" >> "Results.txt" |echo %Name% |set/pName=Û
Echo 100%%]

:Results
Echo.
Echo.
Echo Results:
Type "Results.txt"
Pause > nul
Exit /b 