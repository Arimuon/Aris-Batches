@ECHO OFF
ECHO Preference Automation

REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /F
REG add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /F
REG add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /F
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /F
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /F
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v AutoCheckSelect /t REG_DWORD /d 1 /F
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v AccentColorMenu /d 0 /F
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowColorOnStartAndTaskbar /t REG_DWORD /d 0 /F
REG add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /F
ECHO Applied Personalisation Settings

ECHO Modifying Registry for Default Browser
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileAssoc.html\shell\open\command" /v "(Default)" /t reg_sz /d "C:\Program Files\Google\Chrome\Application\chrome.exe" /F
ECHO Chrome Made Default Browser
ECHO Applying Chrome Settings
REG add "HKCU\Software\Google\Chrome\Default" /v DownloadDirectory /t REG_SZ /d "C:\Users\%USERPROFILE%\OneDrive - Cheshire College South & West\Downloads" /F

ECHO Opening Bitwarden Extension
start chrome https://chromewebstore.google.com/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb
ECHO Opening Google Sign In
start chrome https://accounts.google.com/
ECHO Opening Github Sign In
start chrome https://github.com/login/

:: Set your own file path
set batchPath=""
set startupPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
copy "%batchPath%" "%startupPath%"
ECHO Batch set to run on start up
