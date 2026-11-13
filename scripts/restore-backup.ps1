# Restore REA from this repo's offline backup (unofficial backup of morluto/rea)
# Usage:  powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1 [version]
#
# Use this ONLY if the official sources are gone (rea.tools, github.com/morluto/rea,
# npm registry 'rea-agents'). Otherwise always use the official sources.
#
# Two restore paths are provided:
#   A) npm tarball  (backup/rea-agents-<version>.tgz) - fully offline install, PREBUILT. Recommended.
#   B) git mirror   (branch 'mirror/rea')             - full source + history; needs network for deps.
#
# This script performs path A.

param(
  [string]$Version = "6.9.0"
)

$ErrorActionPreference = "Stop"
$repoRoot = (git rev-parse --show-toplevel)
$tarball  = Join-Path $repoRoot "backup\rea-agents-$Version.tgz"

Write-Host "== REA restore from offline npm tarball ==" -ForegroundColor Cyan

if (-not (Test-Path $tarball)) {
  $available = Get-ChildItem (Join-Path $repoRoot "backup") -Filter "rea-agents-*.tgz" -ErrorAction SilentlyContinue
  if ($available) {
    Write-Host "Available backups:"; $available.Name | ForEach-Object { Write-Host "  $_" }
  }
  throw "Tarball not found: $tarball"
}

Write-Host "Installing globally from $tarball ..."
npm install --global $tarball

Write-Host ""
Write-Host "Installed. Verify with:  rea --help" -ForegroundColor Green
Write-Host "Connect your agent:      rea setup        (interactive, works offline - no registry access needed)"
Write-Host ""
Write-Host "Note: 'rea setup' registers the MCP server + skill with your agent,"
Write-Host "exactly as 'npx rea-agents setup' would with the official package."
