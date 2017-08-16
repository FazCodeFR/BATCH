@Echo Off

Rem Menu



REM -----Menu------
echo Cacher un texte ou lire un texte cacher ?
echo.
echo 1. Cacher
echo 2. Lire
echo.
set/p choix=Choisissez (1 ou 2):
If "%choix%"=="1" (goto Cacher)
If "%choix%"=="2" (goto Lire)

:Cacher
set /p fichier= Entrez le nom du fichier (ne pas oublier l'extension du fichier) :
set /p text= Entrez le texte a cache :
echo "%texte%" > %fichier%:secret
Pause
Exit

:Lire
set /p fichier= Entrez le nom du fichier (ne pas oublier l'extension du fichier) :
set /p  secret= more < %fichier%:secret
Echo Le texte secret est  : %secret%
Pause
Exit

