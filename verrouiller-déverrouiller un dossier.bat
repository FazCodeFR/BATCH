@echo off
title Verrouiller/Deverrouiler un dossier
rem NUM est le nombre de départ.
rem MAXNUM est égal à au nombre maximun de dossiers.
set /a NUM = 1000
set /a MAXNUM = 1000
set /a RESULTAT = %NUM% + %MAXNUM%
:BEGINNING
cls
echo Verrouillage/Deverrouillage de dossiers :
echo Nom du dossier :
set /p "dossierName=>"
:VERIFICATION
if %NUM% == %RESULTAT% goto MDLOCKER
if NOT EXIST "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}" goto CONFIRM
if EXIST "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DV1%dossierName%.txt" goto UNLOCK
set /a NUM = NUM + 1
goto VERIFICATION
:fin
:CONFIRM
if not exist %dossierName% goto MDLOCKER
echo Etes vous sur de vouloir verrouiller le dossier %dossierName%.(o/n)
set/p "cho=>"
if /i %cho%==O goto LOCK
if /i %cho%==N goto END
echo Repondre par "o" ou par "n".
goto CONFIRM
:LOCK
echo Choisissez un mot de passe :
set/p "pass=>"
ren %dossierName% "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}"
:il suffit de mettre n'importe quelle variable, ici c'est "cho"
echo %cho%>> "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DV1%dossierName%.txt"
attrib +h +s "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DV1%dossierName%.txt"
echo %cho%>> "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DPV1%pass%.txt"
attrib +h +s "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DPV1%pass%.txt"
echo Dossier verrouille avec succes
goto End
:UNLOCK
echo Entrer le mot de passe pour deverrouiller le dossier %dossierName% :
set/p "pass=>"
if not exist "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DPV1%pass%.txt"  goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DV1%dossierName%.txt"
del "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DV1%dossierName%.txt"
attrib -h -s "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DPV1%pass%.txt"
del "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}\V3DPV1%pass%.txt"
attrib -h -s "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-%NUM%-A2DD-08002B30309D}" %dossierName%
cls
echo.
echo Dossier deverrouille avec succes
echo.
pause
goto End
:FAIL
cls
echo Mot de passe errone
echo.
echo.
pause
cls
goto UNLOCK
:MDLOCKER
echo Le dossier n'existe pas, voulez-vous
echo le creer ou reessayer (o/n/r)
set/p "cho=>"
if /i %cho%==O goto MDLOCKERYES
if /i %cho%==N goto END
if /i %cho%==R goto BEGINNING
echo Repondre par "o" ou "n" ou "r".
goto MDLOCKER
:MDLOCKERYES
md %dossierName%
cls
echo.
echo %dossierName% a ete cree avec succes
echo.
pause
:End