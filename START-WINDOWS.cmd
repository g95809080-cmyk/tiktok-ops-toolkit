@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0INSTALL.ps1"
if errorlevel 1 echo Installation failed. Read the error above. Existing skills are not overwritten.
pause
