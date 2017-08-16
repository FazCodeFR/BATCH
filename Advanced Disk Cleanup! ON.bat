@echo off
title Disk Cleanup
color 0a
cd %SystemRoot%\System32
echo Starting disk cleanup...
cmd.exe /c Cleanmgr /sageset:65535 & Cleanmgr /sagerun:65535
echo Press any key to close the disk cleanup .
pause >nul