# Sync the REA offline mirror (unofficial backup of morluto/rea)
# Usage:  powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
#
# What it does:
#   1. Fetches the latest main branch + tags from the official upstream (morluto/rea)
#   2. Shows what would change before pushing
#   3. Pushes upstream/main  ->  origin/mirror/rea  (your repo's backup branch)
#   4. Pushes all upstream release tags to origin
#
# Run this periodically (e.g. weekly) to keep the backup fresh.
# If upstream is gone forever, this script is no longer needed - see scripts/restore-backup.ps1

$ErrorActionPreference = "Stop"
$repoRoot = (git rev-parse --show-toplevel)
Set-Location $repoRoot

Write-Host "== REA offline mirror sync ==" -ForegroundColor Cyan

# Ensure the upstream remote exists
$remotes = git remote
if ($remotes -notcontains "upstream") {
  Write-Host "Adding upstream remote (https://github.com/morluto/rea.git)"
  git remote add upstream https://github.com/morluto/rea.git
}

Write-Host "Fetching upstream main + tags..."
git fetch upstream main --tags --prune

$upstreamMain = git rev-parse upstream/main
$localMirror  = (git rev-parse --verify --quiet origin/mirror/rea)
if (-not $localMirror) { $localMirror = (git rev-parse --verify --quiet mirror/rea) }

if ($localMirror -eq $upstreamMain) {
  Write-Host "Mirror is already up to date ($upstreamMain)." -ForegroundColor Green
} else {
  Write-Host "Upstream main moved:"
  Write-Host "  mirror : $localMirror"
  Write-Host "  upstream: $upstreamMain"
  git log --oneline --no-decorate "$localMirror..$upstreamMain" 2>$null | Select-Object -First 10
  git push origin "upstream/main:refs/heads/mirror/rea"
  Write-Host "mirror/rea updated." -ForegroundColor Green
}

Write-Host "Pushing upstream tags..."
git push origin 'refs/tags/*:refs/tags/*'

# Refresh the offline npm tarball of the latest upstream release
$latestTag = git tag --list "rea-agents-*.*.*" --sort=-version:refname | Select-Object -First 1
$latestVer = $latestTag -replace '^rea-agents-', ''
$repoRootForTarball = (git rev-parse --show-toplevel)
$tarballPath = Join-Path $repoRootForTarball "backup\rea-agents-$latestVer.tgz"
if (-not (Test-Path (Join-Path $repoRootForTarball "backup"))) { New-Item -ItemType Directory (Join-Path $repoRootForTarball "backup") | Out-Null }
Write-Host "Packing npm tarball rea-agents@$latestVer ..."
npm pack "rea-agents@$latestVer" --pack-destination (Join-Path $repoRootForTarball "backup") --silent | Out-Null

Write-Host ""
Write-Host "Done. Backup branch: origin/mirror/rea" -ForegroundColor Cyan
Write-Host "Tarball: backup\rea-agents-$latestVer.tgz" -ForegroundColor Cyan
Write-Host "Verify with:  git ls-remote origin | Select-String mirror"
Write-Host "Commit & push the new tarball with:  git add backup; git commit -m 'backup: refresh rea-agents tarball'; git push"
