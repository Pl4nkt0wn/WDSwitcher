:: main program

@echo off
chcp 65001 >nul 2>&1
title Modified by @anonBSOD
color 0c

CALL Script/detect.bat :detectArch

:main
mode con:cols=59 lines=16
cls
echo:
echo:
echo        ""                                         "" 
echo      "  "                                         "  "  
echo     "   "                                         "   "
echo    "    "                                         "    "
echo    \\   \\═════                              ════//   //
echo     ║======   \\ Windows Defender Switcher //   ======║
echo     ╠═════════════════════════════════════════════════╣
echo     ║ 1) Switch Off                                   ║
echo     ║ 2) Switch On                                    ║
echo     ║ 3) Exit                                         ║
echo     \\═══════════════════════════════════════════════//
pushd "%~dp0"
for /f %%A in ('forfiles /m "%~nx0" /c "cmd /c echo(0x08"') do (
    set "\B=%%A"
)

CHOICE /N /C:123 /M ".%\B%              Insert option 1 or 2 or 3 ->"
IF %ERRORLEVEL%==1 (
    CALL Script/interface.bat :disable
    CALL Script/disable.bat :disableConfirm
    CALL Script/interface.bat :enable
    goto close
) ELSE IF %ERRORLEVEL%==2 (
    CALL Script/interface.bat :enable
    CALL Script/enable.bat :enableConfirm
    CALL Script/interface.bat :disable
    goto close
) ELSE (
    goto close
)

:close
color 07
exit