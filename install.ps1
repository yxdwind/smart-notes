#requires -Version 5.1
<#
.SYNOPSIS
  安装/卸载本 skill 到已检测到的 AI 工具技能目录。
.EXAMPLE
  .\install.ps1              # 安装（自动探测，无提示覆盖需加 -Force）
  .\install.ps1 -Force       # 已存在时直接覆盖
  .\install.ps1 -Uninstall   # 卸载
#>
param(
    [switch]$Uninstall,
    [switch]$Force
)
$ErrorActionPreference = 'Stop'
$SkillName = 'smart-notes'   # ← 每个仓库替换为自己的 skill 名
$RepoDir   = $PSScriptRoot

# 候选技能目录（父目录存在 = 对应工具大概率已安装）
$Candidates = @(
    "$env:USERPROFILE\.agents\skills",           # skills.sh 通用 / OpenClaw
    "$env:USERPROFILE\.claude\skills",           # Claude Code
    "$env:USERPROFILE\.codex\skills",            # Codex
    "$env:USERPROFILE\.cursor\skills",           # Cursor
    "$env:USERPROFILE\.cline\skills",            # Cline
    "$env:USERPROFILE\.codebuddy\skills",        # CodeBuddy
    "$env:USERPROFILE\.openclaw\skills",         # OpenClaw
    "$env:USERPROFILE\.openclaw-autoclaw\skills" # OpenClaw(AutoClaw)
)

$targets = @($Candidates | Where-Object { Test-Path (Split-Path $_ -Parent) })
if ($targets.Count -eq 0) {
    $targets = @("$env:USERPROFILE\.agents\skills")
    Write-Host "[i] 未检测到已知 AI 工具，安装到默认目录: $targets"
}

# 复制内容 = 仓库内除 .git 外全部文件
function Copy-Skill($dest) {
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Get-ChildItem $RepoDir | Where-Object { $_.Name -ne '.git' } | ForEach-Object {
        Copy-Item $_.FullName $dest -Recurse -Force
    }
}

foreach ($t in $targets) {
    $dest = Join-Path $t $SkillName
    if ($Uninstall) {
        if (Test-Path $dest) { Remove-Item $dest -Recurse -Force; Write-Host "[✓] 已卸载: $dest" }
        else { Write-Host "[i] 不存在，跳过: $dest" }
        continue
    }
    if ((Test-Path $dest) -and -not $Force) {
        Write-Host "[!] 已存在: $dest （加 -Force 覆盖）" -ForegroundColor Yellow
        continue
    }
    Copy-Skill $dest
    Write-Host "[✓] 已安装 $SkillName -> $dest"
}
if (-not $Uninstall) {
    Write-Host ""
    Write-Host "完成。在你的 AI 工具里即可发现并调用 '$SkillName'。"
}
