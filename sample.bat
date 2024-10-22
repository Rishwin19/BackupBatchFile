@echo off
cls


set srcDir = C:\TestFiles
set backupDir = D:\Backups

for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do set "dt=%%a"
set "YYYYMMDD=%dt:~0,8%"

if not exist "%TestFiles%" mkdir "%TestFiles2%"
if not exist "%backupDir%\%YYYYMMDD%" mkdir "%backupDir%\%YYYYMMDD%"

xcopy /s /y "%srcDir%\*.*" "%backupDir%\%YYYYMMDD%\"

echo %date% %time% - Backup completed. %errorlevel% files copied. >> "%backupDir%\%YYYYMMDD%\backup_log.txt"

forfiles /p "%backupDir%" /d -7 /c "cmd /c rmdir /s /q @file"

echo Backup and cleanup completed.
pause