# Claude skills

Three reusable skills for [Claude](https://claude.ai) and Claude Code, distilled from real projects.

| Skill | What it does |
|---|---|
| [`solveweb`](skills/solveweb) | Playbook and working templates for building and shipping full-stack web apps (React + Vite, Express + MongoDB): shared backend, Google sign-in, password reset, email on free hosting, live API docs, maps, Paystack/MoMo payments, live updates, PWA, Render deploys. |
| [`web-across-platform`](skills/web-across-platform) | Take one React/Vite website to Android (TWA APK), Android TV, Windows (Electron), iPhone/iPad/Mac (PWA), with a download page and Web Push calls. |
| [`umat-thesis-format-word`](skills/umat-thesis-format-word) | Create, rewrite, format or check a UMaT (University of Mines and Technology, Tarkwa) thesis or BSc project report as a Word .docx in the official UMaT format, including UMaT Harvard referencing. |

## Install

**Claude Code** (any project, or globally):

```bash
npx skills add abakahjay/claude-skills
```

or copy a skill folder into `~/.claude/skills/`.

**Claude.ai**: zip a skill folder (for example `skills/solveweb`) and upload it under Customize > Skills > Add > Upload skill.

Some templates mention Ghana-specific services (MoMo, GhanaPost); adapt names and locale to your project.

## Also included

- **linkedin-post** - draft a LinkedIn post in your own voice from a topic or rough notes (skills/linkedin-post).
