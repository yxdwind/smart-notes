# 卡片笔记写作法 (smart-notes)

> 从《卡片笔记写作法：如何实现从阅读到写作》（申克·阿伦斯著，陈琳译，人民邮电出版社 2021）提炼的 Agent 技能库——不是书的摘要，而是一套可执行的卡片笔记方法论工具箱。

## 这是什么

一个 OpenClaw / Claude Code / Copilot CLI / Amp 兼容的 skill 目录，把全书十一个单元的卡片笔记方法论拆解为：

- **命名框架与原则**——保留作者原话表述（如"闪念笔记/文献笔记/永久笔记"、"文献卡片盒与主卡片盒"、"写作是唯一重要的事情"）
- **可执行的操作步骤**——每章的方法都写成"何时用 / 怎么做"
- **反面模式**——作者反复警示的错误做法及原因
- **实例拆解**——卢曼卡片盒、书中引用的心理学/教育学实验、flomo 实践篇等案例的压缩重述
- **决策速查表**——把作者的判断逻辑浓缩成一眼可查的规则

双用途设计：

1. **给 AI 用**——做读书笔记、知识管理、论文/文章写作、笔记系统设计（Obsidian/flomo/Logseq 等）类任务时，按本 skill 的方法论干活
2. **给自己用**——按章节或主题快速检索书中观点与方法

## 安装

**方式一 · Agent Skills 标准（推荐）**

```bash
npx skills add yxdwind/smart-notes -g
```

**方式二 · 安装脚本（自动探测 Claude Code / OpenClaw / Codex / Cursor / Cline 等已装目录）**

```powershell
# Windows PowerShell
irm https://raw.githubusercontent.com/yxdwind/smart-notes/main/install.ps1 | iex
```

```bash
# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/yxdwind/smart-notes/main/install.sh | bash
```

**方式三 · 手动**

```bash
git clone https://github.com/yxdwind/smart-notes.git
# 把仓库目录（含 SKILL.md）复制到你的 AI 技能目录，
# 如 ~/.agents/skills/smart-notes 或 ~/.claude/skills/smart-notes
```

更新已装的 skill：`npx skills update smart-notes`，或重跑安装脚本（加 -Force/--force 覆盖）。

## 使用案例

一句话调用示例（完整实战见 [examples/](examples/) 目录）：

| 你说 | AI 会做什么 |
|------|------------|
| "用卡片笔记写作法把这本书的划线整理进我的卡片盒" | 划线→文献笔记→永久笔记→建立链接，输出每条成品与入库位置（[案例1](examples/example-1-book-to-zettelkasten.md)） |
| "下周要交公众号文章，看我的笔记库哪些集群能成文" | 卡片盒风暴：按链接密度找集群、生成结构、标出论证缺口（[案例2](examples/example-2-article-from-box.md)） |
| "帮我按卡片笔记法搭一套自己的笔记系统" | 工具四件套选型 + 每日 15 分钟流程 + 第一周最小启动方案（[案例3](examples/example-3-notes-system-setup.md)） |
| "给健康科普号设计一条内容流水线，解决选题焦虑" | 母题深挖→集群生长→多稿并行的一体化流水线（[案例4](examples/example-4-selfmedia-topic-pipeline.md)） |
| "把这份用户调研变成可复用的洞察资产" | 转述式洞察卡→新旧对质→集群密度决定决策时机（[案例5](examples/example-5-research-insights.md)） |
| "我要三个月入门一个新领域，设计学习笔记系统" | 必要难度+提取练习的学习闭环，标注被本书否定的流行做法（[案例6](examples/example-6-learning-system.md)） |

## 目录结构

```
smart-notes/
├── SKILL.md              # 核心框架 + 章节索引 + 主题索引（入口文件）
├── chapters/             # 十一个单元逐章拆解（按需加载）
│   ├── ch01-prefaces.md                 # 序言集：为什么是卡片笔记写作法
│   ├── ch02-introduction.md             # 导论：写作是学术工作的核心
│   ├── ch03-writing-overview.md         # 第一章 绪论：关于写作，你需要知道的
│   ├── ch04-four-principles.md          # 第二章 有效写作的四个基本原则
│   ├── ch05-step1-separate-tasks.md     # 步骤一 明确区分独立而又相关联的任务
│   ├── ch06-step2-read-understand.md    # 步骤二 阅读和理解
│   ├── ch07-step3-take-notes.md         # 步骤三 记卡片盒笔记
│   ├── ch08-step4-develop-ideas.md      # 步骤四 发展想法
│   ├── ch09-step5-share-insights.md     # 步骤五 分享你的洞见
│   ├── ch10-step6-habits-afterword.md   # 步骤六 养成习惯（附后记）
│   └── ch11-practice-notes.md           # 实践篇：卡片笔记写作法实践（刘少楠）
├── examples/             # 六个完整实战案例（读书/写作/系统/自媒体/调研/学习）
├── glossary.md           # 全书术语表
├── patterns.md           # 方法与模式全集
├── cheatsheet.md         # 决策速查表（最实用的一层）
├── overview.html         # 可视化总览页
└── README.md
```

## 用法

**Agent 里**（OpenClaw / Claude Code 等，将本目录放入技能目录后）：

- 直接说"用卡片笔记写作法这个 skill 帮我整理这本书的读书笔记"→ 加载核心框架
- 问具体主题，如"永久笔记和文献笔记有什么区别""怎么给笔记建立链接"→ 自动定位到对应章节细读
- 问"ch07"→ 加载步骤三（记卡片盒笔记）

**人读**：从 [SKILL.md](SKILL.md) 的索引进入，按需点开各章。

## 生成方式

由 OpenClaw book-to-skill 流水线生成：EPUB → 按 spine 顺序提取全文（137,180 字）→ 结构分析 → 逐章提炼 → 安全扫描。提炼遵循"提取结构，不抄原文"原则，框架命名保留作者原话。

## 机关工作实务四部曲

- [how-to-run-meetings](https://github.com/yxdwind/how-to-run-meetings) —— 《怎样开会》（任仲然）
- [how-to-research](https://github.com/yxdwind/how-to-research) —— 《怎样调研》（任仲然）
- [how-to-write](https://github.com/yxdwind/how-to-write) —— 《怎样写作》（任仲然）
- smart-notes（本仓库）—— 《卡片笔记写作法》（申克·阿伦斯）

## 版权说明

本书版权归原作者、译者及出版社（人民邮电出版社）所有。本仓库仅包含对书中方法论的提炼与转述（合理使用），不包含原文文本。
