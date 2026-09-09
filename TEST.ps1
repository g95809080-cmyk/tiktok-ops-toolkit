$ErrorActionPreference='Stop'
$testRoot=Join-Path ([IO.Path]::GetTempPath()) ('tkops-test-'+[guid]::NewGuid().ToString('N'))
[void](New-Item -ItemType Directory -Path $testRoot)
try {
 foreach($target in @('codex','antigravity','claude-code')) {
  $root=Join-Path $testRoot $target
  & (Join-Path $PSScriptRoot 'INSTALL.ps1') -Target $target -SkillsRoot $root -WhatIf
  if(Test-Path -LiteralPath $root){throw 'Preview wrote files'}
  & (Join-Path $PSScriptRoot 'INSTALL.ps1') -Target $target -SkillsRoot $root
  $installed=Join-Path $root 'tiktok-ops-toolkit/SKILL.md'
  $before=(Get-FileHash -LiteralPath $installed).Hash
  $blocked=$false
  try { & (Join-Path $PSScriptRoot 'INSTALL.ps1') -Target $target -SkillsRoot $root } catch { if($_ -notmatch 'Already exists'){throw}; $blocked=$true }
  if(!$blocked -or (Get-FileHash -LiteralPath $installed).Hash -ne $before){throw 'Overwrite guard failed'}
 }
 Write-Output 'PASS: 3 targets; preview, installation hash checks, existing-directory protection.'
} finally {
 # Only remove this run's uniquely created test directory.
 $resolved=[IO.Path]::GetFullPath($testRoot)
 $temp=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
 if($resolved.StartsWith($temp,[StringComparison]::OrdinalIgnoreCase) -and [IO.Path]::GetFileName($resolved).StartsWith('tkops-test-')) {
  Remove-Item -LiteralPath $resolved -Recurse -Force
 }
}
