$ErrorActionPreference='Stop'
$dist=Join-Path $PSScriptRoot 'dist'
[void](New-Item -ItemType Directory -Path $dist -Force)
$claude=Join-Path $dist 'claude-skill.zip'
Compress-Archive -LiteralPath (Join-Path $PSScriptRoot 'skill/tiktok-ops-toolkit') -DestinationPath $claude -Force
$entries=@('README.md','START-HERE.md','START-WINDOWS.cmd','INSTALL.ps1','skill') | ForEach-Object {Join-Path $PSScriptRoot $_}
$entries+=$claude
$bundle=Join-Path $dist 'TikTok-Ops-Kit-0.1.0.zip'
Compress-Archive -LiteralPath $entries -DestinationPath $bundle -Force
$hashes=@($claude,$bundle) | ForEach-Object { $h=Get-FileHash -LiteralPath $_ -Algorithm SHA256; "$($h.Hash)  $([IO.Path]::GetFileName($_))" }
[IO.File]::WriteAllLines((Join-Path $dist 'SHA256SUMS.txt'),$hashes)
Write-Output $hashes
