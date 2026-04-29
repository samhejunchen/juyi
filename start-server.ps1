# EasyLiving AI Website Local Server
$port = 8080
$path = "D:\juyiweb"

# Create HTTP listener
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Prefixes.Add("http://127.0.0.1:$port/")

try {
    $listener.Start()
    Write-Host "Server started successfully!" -ForegroundColor Green
    Write-Host "Please open: http://127.0.0.1:$port" -ForegroundColor Yellow
    Write-Host "Press Q to stop" -ForegroundColor Gray
    
    $running = $true
    while ($running) {
        # Check for key press without blocking
        if ([Console]::KeyAvailable) {
            $key = [Console]::ReadKey($true)
            if ($key.Key -eq 'Q') { 
                $running = $false 
                break
            }
        }
        
        # Handle request with timeout
        $asyncResult = $listener.BeginGetContext($null, $null)
        $success = $asyncResult.AsyncWaitHandle.WaitOne(100)
        
        if ($success) {
            $context = $listener.EndGetContext($asyncResult)
            $request = $context.Request
            $response = $context.Response
            
            $filePath = Join-Path $path ($request.Url.LocalPath.TrimStart('/'))
            if ($filePath -eq $path) { $filePath = Join-Path $path "index.html" }
            
            if (Test-Path $filePath -PathType Leaf) {
                $content = [System.IO.File]::ReadAllBytes($filePath)
                $response.ContentLength64 = $content.Length
                $response.OutputStream.Write($content, 0, $content.Length)
            } else {
                $response.StatusCode = 404
            }
            $response.Close()
        }
    }
} finally {
    $listener.Stop()
    Write-Host "Server stopped." -ForegroundColor Red
}