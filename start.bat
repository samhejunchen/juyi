@echo off
cd /d D:\juyiweb
C:\Users\Administrator\.workbuddy\binaries\python\versions\3.13.12\python.exe -c "import http.server; import socketserver; h=http.server.SimpleHTTPRequestHandler; h.extensions_map={'': 'text/html'}; s=socketserver.TCPServer(('', 8081), h); print('Server running at http://127.0.0.1:8081'); s.serve_forever()"
echo.
echo Server stopped.
pause