:: detector architecture script

:detectArch
whoami /user | find /i "S-1-5-18" >nul 2>&1
if %errorlevel%==0 (
	goto targetCheck
) else (
    goto pazUkan
)

:pazUkan
set ArchDir=Win32
if %PROCESSOR_ARCHITECTURE%==AMD64 set ArchDir=x64
if %PROCESSOR_ARCHITECTURE%==ARM set ArchDir=ARM
if %PROCESSOR_ARCHITECTURE%==ARM64 set ArchDir=ARM64
cd "%~dp0%ArchDir%" >nul 2>&1
if exist NSudoLG.exe (
	nsudolg.exe -U:T -P:E "%~dpnx0" && exit
) else (
    goto pazPath
)

:pazPath
where /q nsudo.exe >nul 2>&1
if %ERRORLEVEL%==0 (
    set nsudoexe=nsudo.exe
)
where /q nsudolg.exe >nul 2>&1
if %ERRORLEVEL%==0 (
    set nsudoexe=nsudolg.exe
) else (
    goto pazFail
)
%nsudoexe% -U:T -P:E "%~dpnx0" && exit
pause

:pazFail
echo Make sure the files are complete.
echo If there is a notification, just accept it.
pause
exit /b

:targetCheck
sc query WinDefend | find /i "does not exist as an installed service" >nul 2>&1
if %errorlevel%==0 (
	echo Windows Defender service not found
	echo Sorry I can't continue, try checking the condition of your Windows Defender first
	pause
    color 07
	exit /b
) else (
    CALL main.cmd :main
)