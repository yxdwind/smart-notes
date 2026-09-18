# 卡片笔记写作法 (smart-notes)

> 从《卡片笔记写作法：如何实现从阅读到写作》（申克·阿伦斯著，陈琳译，人民邮电出版社 2021）提炼的 Agent 技能库——不是书的摘要，而是一套可执行的卡片笔记方法论工具箱。

## 这是什么

一个 OpenClaw / Claude Code / Copilot CLI / Amp 兼容的 skill 目录，把全书十二个单元的卡片笔记方法论拆解为：

- **命名框架与原则**——保留作者原话表述（如"闪念笔记/文献笔记/永久笔记"、"文献卡片盒与主卡片盒"、"写作是唯一重要的事情"）
- **可执行的操作步骤**——每章的方法都写成"何时用 / 怎么做"
- **反面模式**——作者反复警示的错误做法及原因
- **实例拆解**——卢曼卡片盒、书中引用的心理学/教育学实验、flomo 实践篇等案例的压缩重述
- **决策速查表**——把作者的判断逻辑浓缩成一眼可查的规则

双用途设计：

1. **给 AI 用**——做读书笔记、知识管理、论文/文章写作、笔记系统设计（Obsidian/flomo/Logseq 等）类任务时，按本 skill 的方法论干活
2. **给自己用**——按章节或主题快速检索书中观点与方法

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
