@echo off
setlocal
title CrowdStrike Falcon KB5042421-KB5042426 Fixer
echo Program Name: CrowdStrike Falcon KB5042421-KB5042426 Fixer
echo Version: 1.0.2
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net user > nul 2>&1
if "%errorlevel%"=="0" goto NotWindowsRecoveryEnvironment
goto DriveLetter

:NotWindowsRecoveryEnvironment
echo.
echo You are not Windows Recovery Environment! You must run this option from in Windows Recovery Environment. Press any key to close this batch file.
pause > nul 2>&1
goto Close

:DriveLetter
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter that Windows is installed on? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto SureDriveLetter
if /i "%DriveLetter%"=="B:" goto SureDriveLetter
if /i "%DriveLetter%"=="C:" goto SureDriveLetter
if /i "%DriveLetter%"=="D:" goto SureDriveLetter
if /i "%DriveLetter%"=="E:" goto SureDriveLetter
if /i "%DriveLetter%"=="F:" goto SureDriveLetter
if /i "%DriveLetter%"=="G:" goto SureDriveLetter
if /i "%DriveLetter%"=="H:" goto SureDriveLetter
if /i "%DriveLetter%"=="I:" goto SureDriveLetter
if /i "%DriveLetter%"=="J:" goto SureDriveLetter
if /i "%DriveLetter%"=="K:" goto SureDriveLetter
if /i "%DriveLetter%"=="L:" goto SureDriveLetter
if /i "%DriveLetter%"=="M:" goto SureDriveLetter
if /i "%DriveLetter%"=="N:" goto SureDriveLetter
if /i "%DriveLetter%"=="O:" goto SureDriveLetter
if /i "%DriveLetter%"=="P:" goto SureDriveLetter
if /i "%DriveLetter%"=="Q:" goto SureDriveLetter
if /i "%DriveLetter%"=="R:" goto SureDriveLetter
if /i "%DriveLetter%"=="S:" goto SureDriveLetter
if /i "%DriveLetter%"=="T:" goto SureDriveLetter
if /i "%DriveLetter%"=="U:" goto SureDriveLetter
if /i "%DriveLetter%"=="V:" goto SureDriveLetter
if /i "%DriveLetter%"=="W:" goto SureDriveLetter
if /i "%DriveLetter%"=="X:" goto SureDriveLetter
if /i "%DriveLetter%"=="Y:" goto SureDriveLetter
if /i "%DriveLetter%"=="Z:" goto SureDriveLetter
echo Invalid syntax!
goto DriveLetter

:SureDriveLetter
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter that Windows is installed on? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto CheckExistDriveLetter
if /i "%SureDriveLetter%"=="No" goto DriveLetter
echo Invalid syntax!
goto SureDriveLetter

:CheckExistDriveLetter
if not exist "%DriveLetter%" goto NotExist
goto Start

:NotExist
echo "%DriveLetter%" does not exist. Please try again.
goto DriveLetter

:Start
echo.
echo Checking CrowdStrike Falcon status.
if exist "%DriveLetter%\Windows\System32\drivers\CrowdStrike" goto BugCheck
echo CrowdStrike Falcon not installed! Press any key to close this batch file.
pause > nul 2>&1
goto Close

:BugCheck
if exist "%DriveLetter%\Windows\System32\drivers\CrowdStrike\C-00000291*.sys" goto CrowdStrike
echo CrowdStrike Falcon installed but no problems found! Press any key to close this batch file.
pause > nul 2>&1

:CrowdStrike
echo CrowdStrike Falcon installed and may have problems!
set CrowdStrike=
set /p CrowdStrike="Did this PC BSOD on startup? (Yes/No) "
if /i "%CrowdStrike%"=="Yes" goto Fix
if /i "%CrowdStrike%"=="No" goto Close

:Fix
del "%DriveLetter%\Windows\System32\Drivers\C-00000291*.sys" /f /q
if not "%errorlevel%"=="0" goto Error
echo.
echo CrowdStrike Falcon fixed! Press any key to reboot this PC.
pause > nul 2>&1
endlocal
wpeutil reboot
exit

:Error
echo.
echo There has been an error! You can try again.
goto CrowdStrike

:Close
endlocal
exit
