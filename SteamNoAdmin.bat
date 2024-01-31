@ECHO OFF
ECHO Steam Setup Without Admin
:: This script is for Windows only
:: This script will automatically download, install, and launch Steam without admin
:: Made by Arimuon + GergoEB, report issues on GitHub: https://github.com/Arimuon/Aris-Batches/issues

:: Script configuration settings
:: Change this to where your browser downloads files to
set "DownloadFolder=%USERPROFILE%\Downloads"


:: Start 
:: Downloading SteamSetup.exe
ECHO Downloading SteamSetup.exe
curl -L -o SteamSetup.exe https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe


:: Installing Steam without admin and opening installer
ECHO Installing Steam...
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" "SteamSetup.exe" "%USERPROFILE%\Downloads\SteamSetup.exe""


:: Installation + Extraction Cleanup Operations
if exist "%DownloadFolder%\SteamSetup.exe" del "%DownloadFolder%\SteamSetup.exe"
ECHO Installation cleanup complete!
:: End of script
