@echo off
setlocal
echo ============================================
echo   SATISFACTORY SAVE SYNC - Wrapping Up
echo ============================================
echo.

cd /d "%~dp0.."
echo Working in: %CD%
echo.

git status --short
echo.

git add -A
git commit -m "Save: %USERNAME%"
git push origin main

echo.
echo Done! Press any key to close.
pause >nul