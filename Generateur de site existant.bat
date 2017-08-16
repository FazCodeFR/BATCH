
:://SachaDee 2013 v2
@Echo Off
 
 
setlocal enabledelayedexpansion
color b
set tester=0
Set marche=0
title %marche% sur %tester%
Echo Le script lance le bruteforce ... 
 
:All
set "$Lcode=4"
set "$l="
for /l %%a in (1,1,%$Lcode%) do call:rand
PING !$l!.com -n 4 > NUL && (
   Color a
   set /a tester+=1 
   set /a marche+=1 
   title %marche% sur %tester%
   >>BruteForceSite.txt ECHO !$l!.com  [EXISTE]
   ECHO !$l!.com  [EXISTE]
   Goto All
) || ( 
   set /a tester+=1 
   title %marche% sur %tester%
   ECHO !$l!.com  [NO] 
   Color b
   Goto All
) 
 
:rand
set /a $n=%random%%%26+97
cmd /c exit %$n%
set "$l=%=exitcodeAscii%!$l!"
