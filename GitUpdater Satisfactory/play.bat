@echo off
setlocal

echo ============================================
echo   SATISFACTORY SAVE SYNC - Starting Up
echo ============================================
echo.

REM Move up one level to the repo root (where the .sav files live)
cd /d "%~dp0.."

REM Pull latest saves from remote
echo [1/2] Pulling latest saves from remote...
git pull origin main
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] git pull failed! Check your connection or resolve conflicts.
    pause
    exit /b 1
)

echo.
echo [2/2] Saves are up to date! Happy playing :^)
echo.

REM Optional: launch Satisfactory automatically
REM Uncomment the line below to auto-launch the game after pulling
REM start steam://rungameid/526870

echo Press any key to close...
pause >nul
