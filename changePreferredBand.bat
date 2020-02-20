@echo off

:: Trigger Windows UAC to retrive elevated priviliges for CMD

mkdir "%windir%\BatchGotAdmin"
if '%errorlevel%' == '0' (
rmdir "%windir%\BatchGotAdmin" & goto gotAdmin
) else ( goto UACPrompt )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute %0, "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned -File src/workhorse.ps1

pause
