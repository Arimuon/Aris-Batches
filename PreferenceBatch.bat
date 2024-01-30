@ECHO OFF
ECHO Preference Automation
:: Off by default, change to "True" if you want to run this on startup
set "RunOnStartup=False"
:: Off by default, change to "True" if you want to change Chrome's Download location
set "ChangeDownloadFolder=False"
:: On by default, change to "False" if you don't want to change the default browser to Chrome
set "ChangeDefaultBrowser=True"
:: On by default, change to "False" if you don't want to change the personalisation settings
set "ChangePersonalisation=True"
:: On by default, change to "True" if you want to open the webpages
set "OpenWebpages=True"
:: Change this to where you want your browser to download files to
set "DownloadFolder=%USERPROFILE%\Downloads"
:: Change this to the path of any browser of your choice
set "DefaultBrowser=C:\Program Files\Google\Chrome\Application\chrome.exe"

if "%ChangePersonalisation%"=="True" (
    ECHO Applying Personalisation Settings
    :: Sets apps to dark theme
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /F
    :: Sets system to dark theme
    REG add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /F
    REG add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /F
    :: On Windows 11 Alligns taskbar to the left
    REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /F
    :: Shows file extentions
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /F
    :: Enables file check boxes
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v AutoCheckSelect /t REG_DWORD /d 1 /F
    :: Disables menu accent colors
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v AccentColorMenu /d 0 /F
    :: Shows no color on start/taskbar
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowColorOnStartAndTaskbar /t REG_DWORD /d 0 /F
    :: Disables taskbar transparency
    REG add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /F
    ECHO Applied Personalisation Settings
    ) else (
    ECHO Change personalisation skipped!
)

if "%ChangeDefaultBrowser%"=="True" (
    ECHO Modifying Registry for Default Browser
    :: Changes the default browser to whatever is in the "DefaultBrowser" variable
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileAssoc.html\shell\open\command" /v "(Default)" /t reg_sz /d "%DefaultBrowser%" /F
    ECHO Default Browser Changed!
    ) else (
    ECHO Change default browser skipped!
)

if "%ChangeDownloadFolder%"=="True" (
    ECHO Changing Chrome Download Folder
    REG add "HKCU\Software\Google\Chrome\Default" /v DownloadDirectory /t REG_SZ /d "%DownloadFolder%" /F
    ECHO Chrome Download Folder Changed
    ) else (
    ECHO Change download folder skipped!
)

if "%OpenWebPages%"=="True" (
    ECHO Opening Bitwarden Extension
    start "" "%DefaultBrowser%" https://chromewebstore.google.com/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb 
    ECHO Opening Google Sign In
    start "" "%DefaultBrowser%" https://accounts.google.com/ 
    ECHO Opening Github Sign In
    start "" "%DefaultBrowser%" https://github.com/login/ 
    ) else (
    ECHO Web pages skipped!
)

if "%RunOnStartup%"=="True" (
    set batchPath=%~dp0
    set startupPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
    copy "%~dp0%~nx0" "%startupPath%"
    ECHO This batch was set to run on start up
    ) else (
    ECHO Set run on startup skipped!
)
pause
