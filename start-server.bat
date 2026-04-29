@echo off
echo ==========================================
echo   EasyLiving AI Website Local Server
echo ==========================================
echo.

where node >nul 2>nul
if %errorlevel% == 0 (
    echo Starting Node.js server...
    node server.js
) else (
    echo Node.js not found. Trying Python...
    python -m http.server 8080
)

echo.
echo Server stopped.
pause