param(
    [ValidateSet('all','prompt','quickstart','examples','folder','copy')]
    [string]$Mode = 'all'
)

$base       = 'E:\Hermes\Product\Router_MVP_Public'
$promptFile = Join-Path $base 'router_prompt.txt'
$quickFile  = Join-Path $base 'quickstart.md'
$exFile     = Join-Path $base 'examples.md'
$readmeFile = Join-Path $base 'README.md'

$required = @($promptFile, $quickFile, $exFile, $readmeFile)

$missing = $required | Where-Object { -not (Test-Path -LiteralPath $_) }
if ($missing.Count -gt 0) {
    Write-Host "STOP: missing files:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host $_ -ForegroundColor Red }
    exit 1
}

function Open-ItemSafe([string]$Path) {
    if (Test-Path -LiteralPath $Path) {
        Start-Process $Path
        Write-Host "OPENED: $Path" -ForegroundColor Green
    }
}

switch ($Mode) {
    'all' {
        Open-ItemSafe $base
        Open-ItemSafe $readmeFile
        Open-ItemSafe $promptFile
        Open-ItemSafe $quickFile
        Open-ItemSafe $exFile
    }
    'prompt'     { Open-ItemSafe $promptFile }
    'quickstart' { Open-ItemSafe $quickFile }
    'examples'   { Open-ItemSafe $exFile }
    'folder'     { Open-ItemSafe $base }
    'copy' {
        $text = Get-Content -LiteralPath $promptFile -Raw -Encoding UTF8
        Set-Clipboard -Value $text
        Write-Host "COPIED TO CLIPBOARD: $promptFile" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "DONE. MODE: $Mode" -ForegroundColor Magenta