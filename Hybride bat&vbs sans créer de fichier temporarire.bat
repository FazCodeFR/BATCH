::' VBS/Batch Hybrid 
::' --- Batch portion ---------
::' Executer du code bat et vbs dans un même fichier sans passer par un fichier temporaire
rem^ &@echo off
rem^ &call :'sub
rem^ &exit /b

:'sub
rem^ &echo J'ENTRE DANS LE BATCH
rem^ &cscript //nologo //e:vbscript "%~f0"
rem^ &echo JE SORT DU BATCH
rem^ &exit /b

'----- VBS portion ------------
wscript.echo "J'ENTRE DANS LE VBS"
msgbox "le mail n'a pas pu être envoyé !",16,"Information"
wscript.echo "JE SORT DU VBS"
'wscript.quit(0)