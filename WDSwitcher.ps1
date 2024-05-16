$dirNow = Split-Path -Parent $MyInvocation.MyCommand.Definition
$pathBat = "$dirNow\Script\main.bat"
Start-Process cmd -ArgumentList "/c `"$pathBat`"" -Verb RunAs