@echo off
echo Starting HTTP server on port 8080...
echo Open http://127.0.0.1:8080 in your browser
echo.
cd /d D:\juyiweb
python -m http.server 8080
pause