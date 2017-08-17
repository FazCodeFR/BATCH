%homedrive%
cd\
cd \windows\system32
@echo off
title=MultiCrack *Le debloqueur*
color 03
:début
cls
echo ***********************************************************************
echo *************************** Le debloqueur *****************************
echo ***********************************************************************
echo ***********************************************************************
echo * 1 : Avoir acces a l'invite de commande.                             *
echo * 2 : Avoir l'acces au Panneau de configuration.                      *
echo * 3 : Activer l'acces a l'element : Ajout suppression de programmes.  *
echo * 4 : Activer l'element : Options des dossiers.                       *
echo * 5 : Activer le menu contextuel de la barre des taches.              *
echo * 6 : Activer le menu contextuel du Bureau.                           *
echo * 7 : Reactiver la restoration systeme.                               *
echo * 8 : Reactiver le gestionnaire des taches                            *
echo * 9 : Autoriser les instalation poour tout les utilisateurs.          *
echo * 10: Reactiver le Registre.                                          *
echo * 11: Reactiver l'ajout d'icone sur le bureau.                        *
echo * 12: Reactiver le chamgement de papier paint.                        *
echo * 13: Reactiver la modification de la barre d'outils.                 *
echo * 14: Reactiver la supression d'icones.                               *
echo * 15: Reactiver la commande executer.                                 *
echo * 16: Reactiver la modification des proprietes de la barre des taches.*
echo * 17: Reactiver le panneau d'affichage.                               *
echo * 18: Fermer l'application.                                           *
echo ***********************************************************************
set /p choix=Quel action voulez-vous faire ? :
(
if not %choix%=='' set choix=%choix:~0,1%
if %choix%==1 goto cmd
if %choix%==2 goto cp
if %choix%==3 goto noaddre
if %choix%==4 goto nfo
if %choix%==5 goto menubdt
if %choix%==6 goto menub
if %choix%==7 goto RS
if %choix%==8 goto TaskMgr
if %choix%==9 goto USI
if %choix%==10 goto grt
if %choix%==11 goto GIOD
if %choix%==12 goto GCWP
if %choix%==13 goto GDB
if %choix%==14 goto GDI
if %choix%==15 goto GR
if %choix%==16 goto GPTB
if %choix%==17 goto GDCPL
if %choix%==18 goto end
)
echo %choix% n'est pas bon !
goto début
:cmd
echo Vous avez choisi d'obtenir l'acces a l'invite de commande
reg delete HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /f
pause
goto début
:cp
echo Vous avez choisi d'obtenir l'acces aux Panneau de configuration.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /f
pause
goto début
:noaddre
echo Vous avez choisi d'obtenir l'acces l'element : Ajout suppression de programmes.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall /v NoAddRemovePrograms /f
pause
goto début
:nfo
echo Vous avez choisi d'obtenir l'acces a l'element : Options des dossier.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /f
pause
goto début
:menubdt
echo Vous avez choisi d'obtenir l'acces au menu contextuel de la barre des taches.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /f
pause
goto début
:menub
echo Vous avez choisi d'obtenir l'acces au le menu contextuel du Bureau.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /f
pause
goto début
:RS
echo Vous avez choisi de reactiver la restoration systeme.
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /f
pause
goto début
:TaskMgr
echo Vous avec choisi de reactiver le gestionnaire des taches. Attention necessite un reboot.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f
pause
goto début
:USI
echo Vous avez choisi d'autoriser les instalations pour tout les utilisateurs de l'ordinateur.
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v DisableUserInstalls /f
pause
goto début
:grt
echo Vous avez choisi de réactiver le Registre.
reg delete HKCU\Software\Microsoft\Windows\currentVersion\Policies\System /v DisableRegistryTools /f
pause
goto début
:GIOD
echo Vous avez choisi de reactiver l'ajout d'icones sur le bureau.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoAddingComponents /f
pause
goto début
:GCWP
echo Vous avez choisi de reactiver le changement de papier paint.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoChangingWallPaper /f
pause
goto début
:GDB
echo Vous avez choisi de reactiver la modification de la barre d'outil.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoCloseDragDropBands /f
pause
goto début
:GDI
echo Vous avez choisi de reactiver la supression d'icones.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoDeletingComponents /f
pause
goto début
:GR
echo Vous avez choisi de reactiver la commande executer.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /f
pause
goto début
:GPTB
echo Vous avez choisi de reactiver la modification des proprietes de la barre des taches.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /f
pause
goto début
:GDCPL
echo Vous avez choisi de reactiver le panneau d'affichage du panneau de configuration.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v NoDispCPL /f
pause
goto début
:end
color 02
cls
echo ***************************************************************
echo *************************** Bye Bye ***************************
echo ***************************************************************
echo ***************************************************************
echo Vous avez choisi de quitter l'application.
pause
