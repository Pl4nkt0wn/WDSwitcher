:: disabler script

:disableConfirm
cls
echo The system restarts immediately after Windows Defender is disabled, please make sure again after restarting
echo SmartScreen and some features have been turned off
timeout /t 10 /nobreak
pause
echo]
echo Wait, boss...

CHOICE /N /M "IS THERE A PENDING WINDOWS UPDATE PROCESS? [Y/N]"
if %errorlevel%==1 (
    CALL update.bat :update
) else if %errorlevel%==2 (
    goto disable
) else (
    goto disable
)

:disable
color 0f
echo]
echo Detect and close System Security...
echo]
echo The process of turning on Windows Defender...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Feature" /v "TamperProtection" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "PUAProtection" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControl" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f > nul
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\SpyNet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d "0" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d "1808" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "LowRiskFileTypes" /t REG_SZ /d ".avi;.bat;.com;.cmd;.exe;.htm;.html;.lnk;.mpg;.mpeg;.mov;.mp3;.msi;.m3u;.rar;.reg;.txt;.vbs;.wav;.zip;" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f > nul
reg add "HKCU\Software\Microsoft\Edge\SmartScreenEnabled" /t REG_DWORD /d "0" /f > nul
reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f > nul
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f > nul
echo]
echo Turning off services and drivers related to system security...
reg add "HKLM\SYSTEM\ControlSet001\Services\SgrmAgent" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdnisdrv" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mssecflt" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f > nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f > nul
echo]
echo Kill task...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable > nul
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable > nul
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable > nul
echo]
echo Kill Windows Defender...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /t REG_SZ /f > nul
echo]
echo System Manipulation Process...
if not exist "C:\ProgramData\Microsoft\Windows Defender\Platform1" (
	cd /d "C:\ProgramData\Microsoft\Windows Defender" > nul
	ren "Platform" "Platform1" > nul
)
if not exist "C:\Program Files\Windows Defender1" (
	cd /d "C:\Program Files" > nul
	ren "Windows Defender" "Windows Defender1" > nul
)
echo]
color 0a
echo Disable System Security
echo Note: If there are still problems, you can check Windows Defender first, or re-run the script
shutdown.exe /r /t 30 /c "Turning off Defender - 30 second shutdown process.
timeout /t 3 /nobreak
exit /b