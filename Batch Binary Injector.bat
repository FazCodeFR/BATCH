@echo off
TITLE Binary-^>Batch Injector - Logic_
echo This Script will combine a Batch File and a Binary into a single Batch File.
echo Please be careful to include all file extensions.
::Read in our files, a Batch File and an Executable.
set /p BatchFile=Batch File:
set /p BinFile=Binary/Executable File:
echo Injecting...
::Use a delimiting string at the start of every instruction to differentiate Batch from Bin.
::Turn echo off, we want to do this silently as not to interrupt normal execution.
echo ;=;=;=;=@ECHO OFF > temp_%BatchFile%
::Within our final file, FINDSTR will extract anything without our delimited string.
echo ;=;=;=;=FINDSTR /v "^;=;=;=;=" "%%~f0" ^> %BinFile% >> temp_%BatchFile%
::Turn echo back on
echo ;=;=;=;=@ECHO ON >> temp_%BatchFile%
::Take every line of the batch file and output it with its delimiter, making sure to exclude empty lines.
for /F "tokens=*" %%A in (%BatchFile%) do (
        IF "%%A" NEQ "" echo ;=;=;=;=%%A >> temp_%BatchFile%
)
::Cleanup our binary after it has been dumped
echo ;=;=;=;=DEL %BinFile% >> temp_%BatchFile%
::Make sure CMD doesn't try and run Binary Code.
echo ;=;=;=;=EXIT /b >> temp_%BatchFile%
::Combine our reformatted Batch File with the Binary using Copy.
copy /a temp_%BatchFile% + /b %BinFile% /b bin_%BatchFile%
::Delete our temp copy
del temp_%BatchFile%
cls
::Give some lovely user output!
IF %ERRORLEVEL% GTR 0 Echo Injection Failed.
IF %ERRORLEVEL% LSS 1 (
        Echo Injection Success!
        Echo Output file: bin_%BatchFile%
)
::Annnddd we're done
Pause > nul