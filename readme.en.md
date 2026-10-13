# How to Take Smart Notes (smart-notes)

[English](readme.en.md) | [简体中文](README.md)

![Version](https://img.shields.io/badge/version-v1.1.1-blue) ![Release](https://img.shields.io/github/v/release/yxdwind/smart-notes) ![License](https://img.shields.io/github/license/yxdwind/smart-notes) ![Agent Skills](https://img.shields.io/badge/Agent-Skills-blue)

> An Agent skill library distilled from *How to Take Smart Notes* (Sönke Ahrens; Chinese edition trans. Chen Lin, Posts & Telecom Press 2021) — not a book summary, but an executable Zettelkasten methodology toolkit, including a reading-intake pipeline: WeRead highlights → literature notes → permanent notes → cross-book links → cloud-notes import.

## What is this

An Agent Skills–standard, cross-tool compatible skill directory (Claude Code / OpenClaw / Codex / Cursor / Cline / CodeBuddy / ZCode, etc.; the install script auto-detects installed tools, others can copy the `SKILL.md` directory manually). It breaks the book's eleven units into:

- **Named frameworks & principles** — preserving the author's own terms: fleeting / literature / permanent notes, literature card box vs. permanent card box, "writing is the only thing that matters"
- **Executable steps** — every method written as *when to use / how to do it*
- **Anti-patterns** — the mistakes the author keeps warning about, and why
- **Worked examples** — Luhmann's card box, the psychology/education experiments cited in the book, the flomo practice chapters (by Liu Shaonan)
- **Decision cheat sheet** — the author's judgment logic condensed into scannable rules
- **Reading-to-box pipeline** — turns WeRead highlights into card-box assets and imports them into cloud notes (ima / Yuque / Youdao): two-layer architecture, directory conventions, permanent-note standards, weekly upgrade ritual

Dual purpose:

1. **For AI** — run book notes, knowledge management, paper/article writing, and note-system design tasks according to this skill's methodology
2. **For humans** — look up the book's ideas and methods by chapter or topic

## Install

**Option 1 · Agent Skills standard (recommended)**

```bash
npx skills add yxdwind/smart-notes -g
```

**Option 2 · Install script (auto-detects installed tool directories)**

```powershell
# Windows PowerShell
irm https://raw.githubusercontent.com/yxdwind/smart-notes/main/install.ps1 | iex
```

```bash
# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/yxdwind/smart-notes/main/install.sh | bash
```

**Option 3 · Manual**

```bash
git clone https://github.com/yxdwind/smart-notes.git
# Copy the repo directory (with SKILL.md) into your AI tool's skill directory,
# e.g. ~/.agents/skills/smart-notes or ~/.claude/skills/smart-notes
```

To update an installed skill: `npx skills update smart-notes`, or re-run the install script (with `-Force`/`--force` to overwrite). Pinned downloads: [Releases](https://github.com/yxdwind/smart-notes/releases).

## Example prompts

One-line invocations (full walkthroughs in [examples/](examples/)):

| You say | What the AI does |
|---------|------------------|
| "Organize this book's highlights into my card box with Smart Notes" | Highlights → literature notes → permanent notes → links, with a placement for every note ([Example 1](examples/example-1-book-to-zettelkasten.md)) |
| "An article is due next week — which clusters in my note box are ready?" | Card-box storm: find clusters by link density, draft the structure, flag argument gaps ([Example 2](examples/example-2-article-from-box.md)) |
| "Help me set up a personal note system with Smart Notes" | Four-tool selection + a daily 15-minute routine + a first-week minimal start ([Example 3](examples/example-3-notes-system-setup.md)) |
| "Design a content pipeline for my health-science channel to kill topic anxiety" | Motif deep-dive → cluster growth → parallel drafts ([Example 4](examples/example-4-selfmedia-topic-pipeline.md)) |
| "Turn this user research into reusable insight assets" | Paraphrased insight cards → confrontation with old notes → cluster density sets decision timing ([Example 5](examples/example-5-research-insights.md)) |
| "Three months to learn a new field — design my learning note system" | Desirable difficulty + retrieval practice loop, flagging the habits this book rejects ([Example 6](examples/example-6-learning-system.md)) |
| "Organize my WeRead highlights into the card box" | Highlights → thematic literature notes → selective promotion → confrontation & linking → cloud-notes import pack ([Example 7](examples/example-7-weread-to-box.md)) |

## Directory

| File | What it is |
|------|------------|
| [SKILL.md](SKILL.md) | Core framework + chapter index + topic index (entry point) |
| [chapters/](chapters/) | Eleven units, chapter by chapter (load on demand): [ch01 Prefaces](chapters/ch01-prefaces.md) · [ch02 Introduction](chapters/ch02-introduction.md) · [ch03 Ch.1 Overview](chapters/ch03-writing-overview.md) · [ch04 Four Principles](chapters/ch04-four-principles.md) · [ch05 Step 1](chapters/ch05-step1-separate-tasks.md) · [ch06 Step 2](chapters/ch06-step2-read-understand.md) · [ch07 Step 3](chapters/ch07-step3-take-notes.md) · [ch08 Step 4](chapters/ch08-step4-develop-ideas.md) · [ch09 Step 5](chapters/ch09-step5-share-insights.md) · [ch10 Step 6 + Afterword](chapters/ch10-step6-habits-afterword.md) · [ch11 Practice (Liu Shaonan)](chapters/ch11-practice-notes.md) |
| [examples/](examples/) | Seven full walkthroughs (reading / writing / system / self-media / research / learning / highlights-to-box), linked row by row in the table above |
| [glossary.md](glossary.md) | Glossary of the book's key terms |
| [patterns.md](patterns.md) | All methods & patterns (when / how / trade-offs) |
| [cheatsheet.md](cheatsheet.md) | Decision cheat sheet (if-then rules + thresholds + red flags) |
| [cloud-notes.md](cloud-notes.md) | Cloud-notes adapter: local production layer + ima / Yuque / Youdao consumption layer |
| [overview.html](overview.html) | Visual overview page |
| [install.ps1](install.ps1) / [install.sh](install.sh) | Install scripts (auto-detect skill directories) |
| [LICENSE](LICENSE) | MIT (see file for rights-holder notes on the original book) |
| [AUDIT_REPORT.md](AUDIT_REPORT.md) | Audit & fix records (three rounds) |
| [README.md](README.md) / [readme.en.md](readme.en.md) | This file (Chinese / English) |

## Usage

**In an Agent** (OpenClaw / Claude Code, etc., after placing this directory in the skills folder):

- Say "use the Smart Notes skill to organize this book's reading notes" → loads the core framework
- Ask a specific topic, e.g. "difference between permanent and literature notes" or "how do I link notes" → locates the right chapter
- Ask for "ch07" → loads Step 3 (taking permanent notes)

**For humans**: start from the indexes in [SKILL.md](SKILL.md) and open chapters as needed.

## Changelog

- **v1.1.1 (2026-10-12) · Third audit round**: factual corrections in [cloud-notes.md](cloud-notes.md) (ima / Youdao API claims, P1) + 9 consistency fixes (nav wording, glossary ordering & renaming, status-field enum, examples aligned with the pipeline standard, etc.); also fixed release-page rendering glitches (code fence & bold) in the v1.0.0/v1.1.0 release notes
- **v1.1.0 (2026-10-05) · Reading-to-box pipeline**: new "pipeline" section in SKILL.md (two-layer architecture / directory conventions / permanent-note standards / weekly upgrade ritual / cross-book links); new [cloud-notes.md](cloud-notes.md) (ima import pack & official OpenAPI / Yuque API / Youdao minimal flow); new Example 7 (highlights → card box → cloud notes)
- **v1.0.0 (2026-10-05) · First official release**: 11 chapter breakdowns + glossary/patterns/cheatsheet support layer + 6 worked examples, with a three-track audit (general health / fidelity to the book / publish readiness) — see [AUDIT_REPORT.md](AUDIT_REPORT.md)

## How it was generated

Produced by the OpenClaw book-to-skill pipeline: EPUB → full-text extraction in spine order (137,122 Chinese characters) → structure analysis → chapter-by-chapter distillation → safety scan. Distillation follows "extract structure, don't copy text"; framework names keep the author's original wording.

## Related repos

- [how-to-run-meetings](https://github.com/yxdwind/how-to-run-meetings) — 《怎样开会》 (Ren Zhoran)
- [how-to-research](https://github.com/yxdwind/how-to-research) — 《怎样调研》 (Ren Zhoran)
- [how-to-write](https://github.com/yxdwind/how-to-write) — 《怎样写作》 (Ren Zhoran)
- smart-notes (this repo) — *How to Take Smart Notes* (Sönke Ahrens)

## Copyright

The original book is copyrighted by its author, translator, and publisher (Posts & Telecom Press), and the "practice chapters" by Liu Shaonan. This repository contains only a distillation and paraphrase of the book's methodology (fair use), not the original text.
