@ECHO OFF
:: This bat file is used for installing Vencord automatically
:: This script will automatically download, install, and launch Vencord
:: Make sure Discord is installed before running this script
:: Made by Arimuon, report issues on GitHub: https://github.com/Arimuon/Aris-Batches/issues


:: Script configuration settings
:: Change this to where your browser downloads files to
set "DownloadFolder=%USERPROFILE%\Downloads"
:: Name of the BeamMP launcher installer zip file
set "VencordFileName=VencordInstaller.exe"


: Script code

:: Opens the default browser to the Vencord installer download and automatically starts the download
start "" "https://github.com/Vencord/Installer/releases/latest/download/%VencordFileName%"
:: Changes the directory to the download folder where the installer is downloaded to
cd "%DownloadFolder%"

:: Wait for the download to complete
:: This is a simple way to pause the script, but it might not be long enough if the download takes a long time
:: Change this to a longer time if the download takes longer than 3 seconds
timeout /t 3

:: Close all versions of Discord if they are running
ECHO Checking for running Discord processes...
set "discordClosed=0"
for %%X in (discord.exe discordcanary.exe discordptb.exe discorddevelopment.exe) do (
    tasklist /FI "IMAGENAME eq %%X" 2>NUL | find /I /N "%%X">NUL
    if "%ERRORLEVEL%"=="0" (
        taskkill /IM %%X /F >NUL 2>&1
        if "%ERRORLEVEL%"=="0" (
            set "discordClosed=1"
        )
    )
)
if "%discordClosed%"=="1" (
    ECHO Discord closed!
    ) else (
    ECHO Discord is not running!
    )
)

:: Install Vencord
ECHO Opening Vencord installer...
start /WAIT "" "%DownloadFolder%\%VencordFileName%"
ECHO Vencord installation complete!

:: Installation Cleanup Operation
ECHO Cleaning up installation files...
if exist "%DownloadFolder%\%VencordFileName%" del "%DownloadFolder%\%VencordFileName%"
ECHO Installation cleanup complete!

:: Keeps the terminal open to see the output/error messages
pause
:: End of script