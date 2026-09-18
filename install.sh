#!/usr/bin/env bash
# 安装/卸载本 skill 到已检测到的 AI 工具技能目录。
# 用法：
#   ./install.sh              # 安装（自动探测）
#   ./install.sh --force      # 已存在时直接覆盖
#   ./install.sh --uninstall  # 卸载
set -euo pipefail

SKILL_NAME="smart-notes"   # ← 每个仓库替换为自己的 skill 名
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

UNINSTALL=0
FORCE=0
for arg in "$@"; do
  case "$arg" in
    --uninstall) UNINSTALL=1 ;;
    --force) FORCE=1 ;;
    *) echo "未知参数: $arg"; exit 1 ;;
  esac
done

# 候选技能目录（父目录存在 = 对应工具大概率已安装）
CANDIDATES=(
  "$HOME/.agents/skills"           # skills.sh 通用 / OpenClaw
  "$HOME/.claude/skills"           # Claude Code
  "$HOME/.codex/skills"            # Codex
  "$HOME/.cursor/skills"           # Cursor
  "$HOME/.cline/skills"            # Cline
  "$HOME/.codebuddy/skills"        # CodeBuddy
  "$HOME/.openclaw/skills"         # OpenClaw
)

TARGETS=()
for c in "${CANDIDATES[@]}"; do
  parent="$(dirname "$c")"
  if [ -d "$parent" ]; then TARGETS+=("$c"); fi
done
if [ ${#TARGETS[@]} -eq 0 ]; then
  TARGETS=("$HOME/.agents/skills")
  echo "[i] 未检测到已知 AI 工具，安装到默认目录: $HOME/.agents/skills"
fi

copy_skill() {
  local dest="$1"
  mkdir -p "$dest"
  # 复制仓库内容（除 .git 外全部）
  (cd "$REPO_DIR" && find . -mindepth 1 -maxdepth 1 ! -name '.git' -exec cp -r {} "$dest/" \;)
}

for t in "${TARGETS[@]}"; do
  dest="$t/$SKILL_NAME"
  if [ "$UNINSTALL" -eq 1 ]; then
    if [ -d "$dest" ]; then rm -rf "$dest"; echo "[✓] 已卸载: $dest"; else echo "[i] 不存在，跳过: $dest"; fi
    continue
  fi
  if [ -d "$dest" ] && [ "$FORCE" -ne 1 ]; then
    echo "[!] 已存在: $dest （加 --force 覆盖）"
    continue
  fi
  copy_skill "$dest"
  echo "[✓] 已安装 $SKILL_NAME -> $dest"
done

if [ "$UNINSTALL" -ne 1 ]; then
  echo ""
  echo "完成。在你的 AI 工具里即可发现并调用 '$SKILL_NAME'。"
fi
