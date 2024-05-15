:: smartscreen activator script

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /ve /t REG_DWORD /d "1" /f > nul
del "%~f0"