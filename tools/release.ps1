# 配布用zipを作り、GitHub Releases に新しい版として公開する
# 使い方: powershell -File tools\release.ps1 -Version v1.2 -Notes "変更内容"
param(
    [Parameter(Mandatory)] [string]$Version,
    [string]$Notes = ""
)
$ErrorActionPreference = "Stop"

$repo  = Split-Path $PSScriptRoot -Parent
$gh    = "C:\Program Files\GitHub CLI\gh.exe"
$stage = Join-Path $env:TEMP "medical-paper-slides-release"
$zip   = Join-Path $env:TEMP "medical-paper-slides.zip"

# 未commitの変更やpush漏れがあれば中止する
if (git -C $repo status --porcelain) { throw "未commitの変更があります。先にcommit・pushしてください。" }
git -C $repo fetch -q
if (git -C $repo log origin/main..main --oneline) { throw "pushしていないcommitがあります。先にpushしてください。" }

# zipの中身はスキル本体のみ（claude.aiにそのままアップロードできる構成）
Remove-Item $stage, $zip -Recurse -Force -ErrorAction SilentlyContinue
$dst = Join-Path $stage "medical-paper-slides"
New-Item -ItemType Directory -Force $dst | Out-Null
Copy-Item (Join-Path $repo "SKILL.md"), (Join-Path $repo "LICENSE") $dst
Copy-Item (Join-Path $repo "references"), (Join-Path $repo "agents") $dst -Recurse
# Compress-Archive は区切りが \ のzipを作り他OSで壊れることがあるため、Windows標準の tar で作る
tar.exe -a -c -f $zip -C $stage "medical-paper-slides"
if ($LASTEXITCODE) { throw "zipの作成に失敗しました。" }

if (-not $Notes) { $Notes = "medical-paper-slides $Version" }
& $gh release create $Version $zip --repo tsushima6010/medical-paper-slides --title $Version --notes $Notes --target main
if ($LASTEXITCODE) { throw "リリースの作成に失敗しました。" }

Remove-Item $stage, $zip -Recurse -Force
Write-Host "公開しました: https://github.com/tsushima6010/medical-paper-slides/releases/latest/download/medical-paper-slides.zip"
