@ECHO OFF
ECHO BeamMP Automatic Setup
:: This script is for Windows only (ONLY Windows 10.0.17063 or later, otherwise it will not work)
:: This script will automatically download, install, and launch the BeamMP launcher
:: Make sure a legit version of BeamNG.drive is installed before running this script and that the game is closed
:: Made by Arimuon, report issues on GitHub: https://github.com/Arimuon/Aris-Batches/issues

:: Script configuration settings
:: Change this to where your browser downloads files to
set "DownloadFolder=%USERPROFILE%\Downloads"
:: Name of the BeamMP launcher installer zip file
set "ZipFile=BeamMP_Installer.zip"



:: Script code

:: Opens the default browser to the BeamMP launcher installer download and automatically starts the download
start "" "https://beammp.com/installer/%ZipFile%"
:: Changes the directory to the download folder where the installer is downloaded to
cd "%DownloadFolder%"

:: Wait for the download to complete
:: This is a simple way to pause the script, but it might not be long enough if the download takes a long time
:: Change this to a longer time if the download takes longer than 3 seconds
timeout /t 3

:: Installation + Extraction Cleanup Operations
if exist "%DownloadFolder%\%ZipFile%" del "%DownloadFolder%\%ZipFile%"
ECHO Installation cleanup complete!

:: Install BeamMP launcher
ECHO Installing BeamMP launcher...
start "" "%DownloadFolder%\BeamMP_Installer.exe" /SILENT

:: Launch BeamMP launcher
timeout /t 1
ECHO Launching BeamMP launcher...
start "" "%USERPROFILE%\AppData\Roaming\BeamMP-Launcher\BeamMP-Launcher.exe"

ECHO BeamMP installation complete!
:: Keeps the terminal open to see the output/error messages
pause
:: End of script
