:: interface script

:enable
cls
@echo off
for /f "tokens=1,2,3,4 delims= " %%A in ('netsh interface show interface ^| findstr /C:"Disconnected"') do (
    netsh interface set interface name="%%D" admin=enable
    echo %%D enabled
)
exit /b

:disable
cls
@echo off
for /f "tokens=1,2,3,4 delims= " %%A in ('netsh interface show interface ^| findstr /C:"Connected"') do (
    netsh interface set interface name="%%D" admin=disable
    echo %%D disabled
)
exit /b