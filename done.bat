@echo off
setlocal

echo ============================================
echo   SATISFACTORY SAVE SYNC - Wrapping Up
echo ============================================
echo.

REM Check if there's anything to commit
git status --porcelain > temp_status.txt
set /p STATUS=<temp_status.txt
del temp_status.txt

if "%STATUS%"=="" (
    echo No changes detected in save files. Nothing to push.
    echo.
    echo Press any key to close...
    pause >nul
    exit /b 0
)

REM Stage all save files
echo [1/3] Staging save files...
git add -A

REM Auto-generate a commit message with timestamp and Windows username
echo [2/3] Committing...
for /f "tokens=1-5 delims=/ " %%a in ('date /t') do set MYDATE=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set MYTIME=%%a:%%b
git commit -m "Save: %USERNAME% on %MYDATE% %MYTIME%"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Commit failed!
    pause
    exit /b 1
)

REM Push to remote
echo [3/3] Pushing to remote...
git push origin main

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push failed! Check your connection.
    pause
    exit /b 1
)

echo.
echo ============================================
echo   All saves pushed! See you next time.
echo ============================================
echo.
echo Press any key to close...
pause >nul
