%homedrive%
cd\
cd \windows\system32
@echo off
title= MultiCrack *Le bloqueur*
color 03
:début
cls
echo ****************************************************************************
echo **************************** Le bloqueur ***********************************
echo ****************************************************************************
echo * 1 : Bloquer l'acces a l'invite de commande.                              *
echo * 2 : Bloquer l'acces au Panneau de configuration.                         *
echo * 3 : Appliquer l'ecran d'accueil classique.                               *
echo * 4 : Appliquer l'ecran d'accueil moderne. Par defaut.                     *
echo * 5 : Bloquer l'acces a l'element : Ajout suppression de programmes.       *
echo * 6 : Bloquer l'element : Options des dossiers.                            *
echo * 7 : Désactiver le menu contextuel de la barre des taches.                *
echo * 8 : Desactiver le menu contextuel du Bureau.                             *
echo * 9 : Desactiver la restoration systeme.                                   *
echo * 10 : Desactiver le gestionnaire des taches.                              *
echo * 11 : Desactiver l'installation de programme pour tous les utilisateurs.  *
echo * 12 : Desactiver les outils de modifications du Registre.                 *
echo * 13 : Desactiver l'ajout d'icone sur le bureau.                           *
echo * 14 : Interdir le changement de papier paint (Images de fond de bureau).  *
echo * 15 : Interdir la modification de la barre d'outils.                      *
echo * 16 : Empecher la supression d'icone.                                     *
echo * 17 : Desactiver la commande executer.                                    *
echo * 18 : Desactiver la modifications des proprietes de la barre des taches.  *
echo * 19 : Desactiver l'acces au panneau d'affichage.                          *
echo * 20 : Fermer l'application.                                               *
echo ****************************************************************************
set /p choix=Quel action voulez-vous faire ? :
(
if not %choix%=='' set choix=%choix:~0,1%
if %choix%==1 goto cmd
if %choix%==2 goto cp
if %choix%==3 goto logon1
if %choix%==4 goto logon2
if %choix%==5 goto noaddre
if %choix%==6 goto nfo
if %choix%==7 goto menubdt
if %choix%==8 goto menub
if %choix%==9 goto RS
if %choix%==10 goto TaskMgr
if %choix%==11 goto USI
if %choix%==12 goto drt
if %choix%==13 goto NIOD
if %choix%==14 goto NCWP
if %choix%==15 goto NMTB
if %choix%==16 goto NDI
if %choix%==17 goto DR
if %choix%==18 goto NPTB
if %choix%==19 goto NDCPL
if %choix%==20 goto end
)
echo %choix% n'est pas bon !
goto début
:cmd
echo Vous avez choisi de bloquer l'acces a l'invite de commande
reg add HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /t REG_DWORD /d 2 /f
pause
goto début
:cp
echo Vous avez choisi de bloquer l'acces aux Panneau de configuration.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 1 /f
pause
goto début
:logon1
echo Vous avez choisi l'ecran d'accueil classique.
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /v LogonType /t REG_DWORD /d 0 /f
pause
goto début
:logon2
echo Vous avez choisi l'ecran d'accueil moderne.
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /v LogonType /f
pause
goto début
:noaddre
echo Vous avez choisi de bloquez l'element : Ajout suppression de programmes.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Uninstall /v NoAddRemovePrograms /t REG_DWORD /d 1 /f
pause
goto début
:nfo
echo Vous avez choisi de bloquez l'acces a l'element : Options des dossier.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f
pause
goto début
:menubdt
echo Vous avez choisi de desactiver le menu contextuel de la barre des taches.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoTrayContextMenu /t REG_DWORD /d 1 /f
pause
goto début
:menub
echo Vous avez choisi de desactiver le menu contextuel du Bureau.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 1 /f
pause
goto début
:RS
echo Vous avez choisi de desactive la restoration systeme.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /t REG_DWORD /d 1 /f
pause
goto début
:TaskMgr
echo Vous avez choisi de desactiver le gestionnaire des taches.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
pause
goto début
:USI
echo Vous avez choisi d'empecher les instalations pour tout les utilisateur de l'ordinateur.
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v DisableUserInstalls /t REG_DWORD /d 2 /f
pause
goto début
:drt
echo Vous avez choisi d'empecher l'ouverture du Registre et empecher la fusion de fichier .reg.
reg add HKCU\Software\Microsoft\Windows\currentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f
pause
goto début
:NIOD
echo Vous avez choisi d'empecher l'ajout d'icones sur le bureau.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoAddingComponents /t REG_DWORD /d 1 /f
pause
goto début
:NCWP
echo Vous avez choisi de desactiver le chamgement des wallpapers (papiers paints) du bureau.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoChangingWallPaper /t REG_DWORD /d 1 /f
pause
goto début
:NMTB
echo Vous avez choisi d'interdir le changement de la barre d'outil.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoCloseDragDropBands /t REG_DWORD /d 1 /f
pause
goto début
:NDI
echo vous avez choisi d'interdir la supression d'icones.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop /v NoDeletingComponents /t REG_DWORD /d 1 /f
pause
goto début
:DR
echo Vous avez choisi de desactiver la commande executer.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f
pause
goto début
:NPTB
echo Vous avez choisi de desactiver la modification des propriétés de la barre des taches.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /t REG_DWORD /d 1 /f
pause
goto début
:NDCPL
echo Vous avez choisi de desactiver la panneau d'affichage.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v NoDispCPL /t REG_DWORD /d 1 /f
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