REM enabler script

:enableConfirm
cls
CALL screen.bat :sizeScreen
echo The process of enabling Windows Defender, wait until it's finished.
echo Reset Windows Defender after restarting, boss.
echo Windows Defender policies have been successfully removed, next?
timeout /t 5 /nobreak
pause
goto enable

:enable
color 0f
echo]
echo Closing system security...
echo]
echo Setting Windows Defender...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /f > nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center" /f > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center" /f > nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /f > nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /f > nul
reg delete "HKCU\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /f > nul
reg delete "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /f > nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /f > nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /f > nul
echo]
echo Explore Windows Defender processes and services...
reg add "HKLM\SYSTEM\ControlSet001\Services\SgrmAgent" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdnisdrv" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mssecflt" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "2" /f
echo]
echo Turning on tasks...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Enable > nul
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Enable > nul
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Enable > nul
echo]
echo The process of turning on Windows Defender, please wait
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
echo]
echo Recover Windows Defender as before...
if not exist "C:\ProgramData\Microsoft\Windows Defender\Platform" (
	cd /d "C:\ProgramData\Microsoft\Windows Defender" > nul
	ren "Platform1" "Platform" > nul
)
if not exist "C:\Program Files\Windows Defender" (
	cd /d "C:\Program Files" > nul
	ren "Windows Defender1" "Windows Defender" > nul
)
echo]
color 0a
echo Windows Defender is on
echo Note: If there is an error, run the script again!!!
shutdown.exe /r /t 30 /c "Turn on Windows Defender, wait 30 seconds, boss..
timeout /t 3 /nobreak
pause
color 07
exit