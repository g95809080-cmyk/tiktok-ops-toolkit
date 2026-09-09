[CmdletBinding(SupportsShouldProcess=$true)]
param(
    [ValidateSet('codex','antigravity','claude-code')]
    [string]$Target,
    [string]$SkillsRoot
)
$ErrorActionPreference = 'Stop'
if (-not $Target) {
    $Target = Read-Host 'Target: codex / antigravity / claude-code'
    if ($Target -notin @('codex','antigravity','claude-code')) { throw 'Unknown target.' }
}
$profileDir = [Environment]::GetFolderPath('UserProfile')
if (-not $SkillsRoot) {
    switch ($Target) {
        'codex' { $SkillsRoot = Join-Path $profileDir '.agents/skills' }
        'antigravity' { $SkillsRoot = Join-Path $profileDir '.gemini/config/skills' }
        'claude-code' { $SkillsRoot = Join-Path $profileDir '.claude/skills' }
    }
}
$root = [IO.Path]::GetFullPath($SkillsRoot)
$source = Join-Path $PSScriptRoot 'skill/tiktok-ops-toolkit'
$destination = Join-Path $root 'tiktok-ops-toolkit'
if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md') -PathType Leaf)) {
    throw 'Incomplete package. Extract the entire ZIP before installing.'
}
if (Test-Path -LiteralPath $destination) {
    throw "Already exists: $destination. Nothing changed. Back up or rename it before upgrading."
}
Write-Host "Target: $Target"
Write-Host "Destination: $destination"
if ($PSCmdlet.ShouldProcess($destination, 'Install skill files (no network or account changes)')) {
    [void](New-Item -ItemType Directory -Force -Path $root)
    Copy-Item -LiteralPath $source -Destination $destination -Recurse -ErrorAction Stop
    foreach ($file in Get-ChildItem -LiteralPath $source -File) {
        $installed = Join-Path $destination $file.Name
        if ((Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $installed).Hash) {
            throw "Verification failed: $installed. Do not use this partial installation."
        }
    }
    Write-Host 'Installed and verified. Start a new session and ask to use tiktok-ops-toolkit.'
    Write-Host 'To uninstall, move only the displayed tiktok-ops-toolkit folder out of the skills directory.'
}
