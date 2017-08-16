@echo off & setlocal enabledelayedexpansion enableextensions
 
set "str=%*"
if not defined str (set /p str=Entrez une chaine: %)
echo.
 
call :length  "%str%"
call :count   "%str%"
call :reverse "%str%"
call :ucase   "%str%"
call :2hexa   "%str%"
 
set length
set [
set reverse
set ucase
set hexa
 
pause
endlocal & goto:eof
 
:length
for /f "tokens=1* delims=][" %%a in ('
  "%comspec% /u /c echo:%~1|more|find /n /v """
 ') do Set /A "length=%%a-4"
goto:eof
 
:count
for /f %%: in ('
  "%comspec% /u /c echo:%~1|more|sort"
 ') do Set /A "[%%:]+=1"
goto:eof
 
:reverse
for /f "tokens=1* delims=:" %%a in ('
    "%comspec% /u /c echo:%~1|more|findstr /o ."
 ') do Set "reverse=%%b!reverse!"
goto:eof
 
:ucase
for /f "tokens=1* delims=µ" %%a in ('
      "tree \µµµ%1|find ":\""
 ') do Set "ucase=%%b"
goto:eof
 
:2hexa
<nul>$asc$ set/p"=%~1"
for /l %%i in (1 1 %length%) do <nul>>$hex$ set/p"=µ"
for /f "skip=1 tokens=3" %%i in ('
     fc /b $hex$ $asc$
 ') do Set "hexa=!hexa!%%i-"
set "hexa=%hexa:~0,-1%" & del $asc$ $hex$
goto:eof