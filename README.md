# Reverse Engineering Agent — Full Setup Guideline

> **Languages:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](i18n/README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](i18n/README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](i18n/README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](i18n/README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](i18n/README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](i18n/README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](i18n/README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](i18n/README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](i18n/README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](i18n/README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](i18n/README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](i18n/README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](i18n/README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](i18n/README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](i18n/README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](i18n/README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](i18n/README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](i18n/README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](i18n/README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](i18n/README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](i18n/README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](i18n/README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](i18n/README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](i18n/README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](i18n/README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](i18n/README.hi.md)
>
> ℹ️ Translations mirror the English master. If they disagree, **English wins**. Code blocks, paths and commands are never translated.

> **REA — Reverse Engineer Anything**
> An MCP (Model Context Protocol) server + investigation skill that gives your coding agent the tools to inspect software: native binaries, JavaScript/Electron apps, browsers, .NET, Android, firmware, and more.

- **Official website:** https://rea.tools/
- **Official source code:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **License:** MIT (REA itself). Third-party analysis tools have their own licenses.
- **📚 [PLATFORM-GUIDE.md](PLATFORM-GUIDE.md)** — per-platform, Windows-first, step-by-step setup (Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) with troubleshooting
- **📦 Offline backup included** — unofficial mirror of the official repo + npm tarball, for use only if the official sources disappear. See **[Section 20 — Offline Backup / Mirror](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Important:** Only download REA from `morluto/rea`, `rea.tools`, or the `rea-agents` npm package. Similar repository names do not establish an official release.

---

## Table of Contents

1. [What REA Is (and Is Not)](#1-what-rea-is-and-is-not)
2. [Legal & Responsible Use](#2-legal--responsible-use)
3. [What You Can Analyze](#3-what-you-can-analyze)
4. [System Requirements](#4-system-requirements)
5. [Step 1 — Prepare Your Computer](#5-step-1--prepare-your-computer)
6. [Step 2 — Choose a Coding Agent](#6-step-2--choose-a-coding-agent)
7. [Step 3 — Connect REA](#7-step-3--connect-rea)
8. [Step 4 — Verify the Installation](#8-step-4--verify-the-installation)
9. [Step 5 — Your First Investigation (Notes Example)](#9-step-5--your-first-investigation-notes-example)
10. [Native Analysis (Binaries / EXE / DLL)](#10-native-analysis-binaries--exe--dll)
11. [JavaScript & Electron Apps](#11-javascript--electron-apps)
12. [Browser Observation](#12-browser-observation)
13. [Other Targets & Required Tools](#13-other-targets--required-tools)
14. [Build RL Environments](#14-build-rl-environments)
15. [Use REA from the Terminal (CLI)](#15-use-rea-from-the-terminal-cli)
16. [Updating or Removing REA](#16-updating-or-removing-rea)
17. [Troubleshooting](#17-troubleshooting)
18. [Data, Privacy & Security](#18-data-privacy--security)
19. [Quick Reference Checklist](#19-quick-reference-checklist)
20. [Offline Backup / Mirror (Unofficial)](#20-offline-backup--mirror-unofficial)

---

## 1. What REA Is (and Is Not)

**REA is:**
- A local MCP server + agent skill that lets your **coding agent** inspect software you have locally.
- Returns **evidence**: assembly, pseudocode, module maps, IPC channel pairings, captured network traffic, source locations — not the original source code.
- Analysis runs **on your machine**. Your app is not uploaded by REA; your agent's model provider sees the results (see [Data & Privacy](#18-data-privacy--security)).

**REA is not:**
- A magic "decompile to original source" button. Results are assembly/pseudocode and references; your agent explains and helps you rebuild the behavior.
- A tool for cracking licenses/DRM or bypassing paid activation. Don't use it for that.
- A bypass for obfuscation. Heavily packed/protected targets (VMProtect, Themida, anti-tamper) remain extremely hard.
- Server-side access. It cannot inspect a server behind an API; it sees the client/network side only.

---

## 2. Legal & Responsible Use

Reverse engineering may be legal for interoperability, security research, debugging, and analysis of software you **own** — but laws and licenses differ by jurisdiction.

You **should**:
- Analyze software you own, are licensed to use, or have permission to inspect.
- Respect license agreements, Terms of Service, and DMCA anti-circumvention rules.
- Use findings for interoperability, education, and defensive security.

You **should NOT**:
- Bypass DRM, license activation, or copy protection.
- Distribute cracked/leaked code of proprietary software.
- Analyze targets you have no right to possess or inspect.

This guide is not legal advice. When in doubt, consult a lawyer.

---

## 3. What You Can Analyze

| Target | What REA returns | Native engine needed? |
|---|---|---|
| Native binaries / libraries (EXE, DLL, ELF, Mach-O) | Functions, assembly, pseudocode, callers, xrefs, constants | Yes — Hopper, Ghidra, or IDA |
| JavaScript & Electron apps | Modules, imports, IPC channels + handlers, source locations | No |
| Browser pages (runtime) | Requests/responses, scripts, JSON body shapes, observation window | Chrome-family browser |
| .NET assemblies / Flutter / packages | Module & resource inspection | No |
| Android APKs / devices / resources | Decompiled classes, resources, device interaction | JADX / adb / Apktool |
| Firmware | Extracted filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module & function inspection | WABT |
| SQLite databases | Schema & query inspection | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract structure | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy captures | Parsed traffic evidence | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol facts | TShark / capinfos (Linux) |

---

## 4. System Requirements

**Minimum:**
- Node.js **22.23.4+**, **24.22.1+**, or **26+ (>= 26.12.1)** (npm included)
- A supported coding agent (see Step 2)
- A working directory for your investigations

**For native (binary) analysis:** one of —
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (free, recommended on Windows)
- **IDA** (commercial; verified Windows legacy GUI + headless supervisor profiles)
- **Hopper** (commercial; macOS & some Linux — **not available on Windows**)

**OS notes:**
- Windows: use **PowerShell**; for paths with spaces, wrap in quotes. If your agent runs inside WSL, install Node.js + REA **inside** WSL and use Linux paths.
- Linux: a `procps`-compatible `ps` must be on `PATH` for Ghidra/JADX/firmware launches and static analysis.
- macOS: use Terminal; some steps require Xcode Command Line Tools (building Ghidra decompiler on arm64).

---

## 5. Step 1 — Prepare Your Computer

### 5.1 Check Node.js

```powershell
node -v
npm -v
```

Expected: `v22.23.4+`, `v24.22.1+`, or `v26.12.1+`. Older → install Node.js 24 LTS.

### 5.2 Install Node.js on Windows (if missing)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Type `Y` if asked to accept terms, close and reopen PowerShell, then re-check `node -v`. (Fallback: download the Node.js LTS installer from https://nodejs.org/)

> **PowerShell quirk:** if `npx` fails with "running scripts is disabled on this system", use `npx.cmd` and `npm.cmd` instead:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Download the Node.js 24 LTS `.pkg`, or with Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# reopen shell, then:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Make a working folder

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Step 2 — Choose a Coding Agent

REA supports any agent that speaks local **MCP**. Pick one — all examples below use the client's **setup ID** for `--client <id>`.

| Client | Setup ID | Install / notes |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Install app, sign in, then `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` or install script · sign in with ChatGPT |
| Cursor | `cursor` | Install editor, open working folder, Agent mode |
| Windsurf | `windsurf` | Same pattern; agent chat |
| VS Code | `vscode` | Set up GitHub Copilot first, then Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`, run `opencode`, `/connect` your model, then `--client opencode` |
| Gemini CLI | `gemini_cli` | |
| Devin | `devin` | |
| GitHub Copilot CLI | `copilot_cli` | |
| Antigravity | `antigravity` | |
| Qwen Code | `qwen_code` | |
| Kimi Code | `kimi` | |
| Grok Build | `grok_build` | |
| Command Code | `commandcode` | |
| OMP | `omp` | |
| Pi | `pi` | |
| Hermes | `hermes` | |
| Qoder | `qoder` | |
| Factory Droid | `droid` | (npm ≥ 6.5.0) |
| Trae | `trae` | (npm ≥ 6.5.0) |
| WorkBuddy | `workbuddy` | (npm ≥ 6.5.0) |
| ZCode | `zcode` | (npm ≥ 6.5.0) |
| DeepSeek Harness | `dsh` | (npm ≥ 6.5.0) |
| FreeBuff | `freebuff` | (npm ≥ 6.8.0) |

**Grok Bot:** in the bot's chat, ask it to add a custom MCP server named `rea` with on its hosted computer:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Step 3 — Connect REA

### Option A — Ask your agent (recommended)

Paste this into your agent's chat:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

The agent runs setup, shows you a plan, and applies it after your approval.

### Option B — Run setup yourself

```powershell
npx rea-agents@latest setup
```

Or for one specific client:

```powershell
npx rea-agents@latest setup --client opencode
```

During setup:
- Use **arrow keys** to move, **Space** to select clients, **Enter** to continue.
- REA adds an **MCP connection** + **investigation skill**, and **backs up existing configuration** first.
- You approve the plan before anything changes.
- You may skip the optional Hopper installation for your first exercise.

### Restart your client after setup

- Desktop apps (Claude Desktop, Cursor, Windsurf, VS Code): **quit completely** and reopen (Windows: also quit from the tray icon).
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): exit the session and start it again.

---

## 8. Step 4 — Verify the Installation

Run the doctor check for your client (replace `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

A healthy report shows `"healthy": true`. Then ask your agent:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Step 5 — Your First Investigation (Notes Example)

The official example is a small Electron app with an **Export notes** button. No Electron install required — the agent reads the code.

Paste into your agent:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Expected finding: clicking Export sends a `notes:export` IPC message; the main process formats notes as CSV and writes `notes.csv` (columns: `id`, `title`) into your Downloads folder.

Manual analysis from the terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native Analysis (Binaries / EXE / DLL)

Deep native analysis needs one provider. On **Windows**, use **Ghidra** or **IDA** (Hopper is not available on Windows).

### 10.1 Ghidra (free) — Windows setup

1. Install a **64-bit JDK 21 or newer** with the compiler. Check:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Download **Ghidra 12.1.4** from the *Assets* list of the release and extract the `ghidra_…_PUBLIC_….zip` (choose the release archive, **not** "Source code").
3. Note the extracted folder containing `ghidraRun.bat` — that's your `GHIDRA_INSTALL_DIR`.
4. In PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # folder from java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Replace the paths with your installs. Review setup's updated plan, approve, and **restart your agent**.

> Windows Ghidra support is **experimental, read-only** for native x86/x64 PE applications and DLLs on fixed local **NTFS** drives.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

On macOS arm64 and Linux arm64, build Ghidra's native decompiler first (macOS needs Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Install and configure the upstream IDA MCP server per the IDA provider guide.
2. Save its working registration as `ida-mcp.json`. Example (headless supervisor with `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   For an attached legacy 1.4.0 GUI server, copy its working command/args/env (open the binary in IDA and start the plugin first).
3. Connect:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   On macOS/Linux use `export` instead of `$env:`. Restart your agent after setup.

> Verified IDA profiles include the Windows legacy GUI and headless supervisor, plus macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 does not include the macOS headless profile / native GUI bridge — those require a REA source build.

### 10.4 Hopper (macOS / Linux only)

Setup can detect an existing Hopper or propose an installation plan. On macOS choose demo mode or activate your license on first open. Automated Linux setup requires an x86_64 host on Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS, or Omarchy. On Linux arm64, use Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Using a provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI one-off function analysis (Ghidra must be configured):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron Apps

No native engine required. Point your agent at the app **folder** or **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Where Electron keeps `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: often `/opt/<App>/resources/app.asar`

Static analysis from the terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Look at `normalized_result.summary.ipc` for matched channels/handlers and `normalized_result.graph` for source locations. Computed channel names may stay unresolved — use browser observation (next section) for the runtime side.

---

## 12. Browser Observation

1. Open the target page with Chrome-family remote debugging, e.g.:

   **Windows (PowerShell):**
   ```powershell
   & "C:\Program Files\Google\Chrome\Application\chrome.exe" `
     --remote-debugging-port=9222 `
     --user-data-dir="$env:TEMP\rea-browser" `
     https://rea.tools/examples/notes-web/
   ```
   **Linux:**
   ```bash
   google-chrome --remote-debugging-port=9222 --user-data-dir=/tmp/rea-notes-browser https://rea.tools/examples/notes-web/
   ```

2. Ask your agent:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Give it the endpoint `http://127.0.0.1:9222` and the page URL. Start the capture **before** clicking.

   Or from the terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

For HTTP bodies, Fiddler Everywhere (SAZ/HAR 1.2) exports can feed REA capture Evidence, or connect Everywhere's MCP server.

---

## 13. Other Targets & Required Tools

| Target | Tools to prepare | Notes |
|---|---|---|
| JavaScript / Electron | Node.js + npm | No engine needed |
| Website | Chrome / Chromium / Edge | Remote debugging port |
| .NET / Flutter / packages | Node.js + npm | Static inspection |
| Android APK | JADX + JDK 17+ | Decompile `classes.dex` |
| Android device | adb | USB debugging enabled |
| Android resources | Apktool + Java | Unpacks resources & manifest |
| JEB project | JEB + MCP | Commercial decompiler |
| Firmware | Binwalk / Unblob | **Linux only** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite database | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Linux x64** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Offline capture parsing |
| PCAP / PCAPNG | TShark / capinfos | **Linux only** |
| Logic signals | sigrok-cli | **Linux only** |
| Process behavior | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM, and full investigation guides: see https://rea.tools/guides.

---

## 14. Build RL Environments

REA can record a test web app session and export an **AgentEnv** environment for training/evaluating agents.

1. Prepare a **test** app instance where the agent may create/edit/delete data.
2. Ask your agent (example for folders):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Keep the password in the MCP server's environment (`APP_PASSWORD`), not in the prompt.
3. Or build directly from a HAR recording:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` reviews the report without writing files.
4. Run it:
   ```bash
   agent-env run ./my-env
   ```
   REA's compatibility check uses **AgentEnv 0.9.1334 + Python 3.12**; Docker must be running.
5. Only operations whose **effects** were recorded are supported (e.g., delete needs the missing-item response and the updated list recorded). Before sharing, review retained response bodies — credentials may remain in the recording.

---

## 15. Use REA from the Terminal (CLI)

Without installing globally:

```powershell
npx -y rea-agents@latest --help
```

Install the `rea` command permanently:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux curl installer (Node.js required first):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Common commands:

| Command | Purpose |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Map modules, imports, IPC, boundaries |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analyze one native function |
| `rea-agents list-browser-targets <endpoint> --json` | List debuggable browser pages |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Observe page network/scripts |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Build RL environment |
| `rea-agents environment-compare … --json` | Compare environment vs. live app |
| `rea-agents doctor --client <id> --json` | Check one client connection |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Check one native provider |
| `rea-agents update` | Update the CLI |
| `rea-agents uninstall` | Remove REA client config + skill |

---

## 16. Updating or Removing REA

**Update:**
```powershell
rea update                       # if global CLI installed
npx rea-agents@latest setup      # refresh agent connection + skill; approve plan, restart agent
```

**Remove:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Troubleshooting

**Agent can't see REA tools**
1. Restart/reconnect the client completely (tray icons included).
2. `npx -y rea-agents@latest doctor --client <id> --json` — if registration is missing/stale: `npx rea-agents@latest setup --client <id>`, restart.
3. Still missing: check the client's MCP connection error; in editor clients enable REA in MCP settings and allow its tools.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Use `npx.cmd` / `npm.cmd`, or `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Paths with spaces**
Quote them: `"D:/my apps/tool.exe"`. In WSL, use Linux paths and install REA inside WSL.

**Windows Ghidra limits**
Experimental, read-only, x86/x64 PE only, fixed local NTFS drives. Linux alternative: Ghidra/Hopper. Native x64 Linux ELF crash analysis: pwntools.

**macOS asks for Automation permission (Hopper)**
System Settings → Privacy & Security → Automation → allow the app that starts REA, retry.

**Hopper first-run**
Complete demo-vs-license choice before unattended analysis.

**Linux `ps` missing**
Install `procps` (Debian/Ubuntu: `sudo apt install procps`); REA needs it for process ownership checks.

**A bug?**
Update REA, restart, retry. Then open an issue with: REA version, OS, target type, repro steps, error output, provider name. See https://github.com/morluto/rea/issues.

---

## 18. Data, Privacy & Security

- REA analyzes targets **on your machine**; your app is **not** uploaded by REA.
- Your **agent's model provider** receives the results — its data/retention policy applies. Don't paste secrets or customer data into prompts.
- MCP input schemas are compact by default; set `REA_MCP_INPUT_SCHEMA_PROFILE=full` in the MCP registration for complete field guidance. Output schemas can be bounded with `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (or `off`).
- RL environment recordings may retain credentials in bodies/headers — review before sharing. Credential-name warnings flag spots to review; they do **not** strip values.
- Keep `APP_PASSWORD`-style secrets in the MCP server environment, not in chat.
- Only install REA from `morluto/rea`, `rea.tools`, or npm `rea-agents`.

---

## 19. Quick Reference Checklist

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent installed (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (review & approve plan)
[ ] Client fully restarted
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] First investigation: notes-example.zip  →  find notes:export / notes.csv
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → re-run setup → restart agent
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: you own / are licensed to analyze the target
```

---

## 20. Offline Backup / Mirror (Unofficial)

> ⚠️ **Read this first.**
> There is no such thing as an "official backup" of an official project. The only official REA is **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, and the **`rea-agents` npm package**.
> What this repo provides is a complete, license-compliant **unofficial mirror / archive** of the official project, with the original MIT license and copyright notices preserved. It exists so that **if the official repository, website, or npm package ever disappears**, you can still obtain REA here — nothing more, nothing less.
> If the official sources exist, **use them**. Do not present this backup as "official", and do not redistribute it as "the official REA". This repo is not affiliated with or endorsed by the REA authors.

**License:** REA is MIT-licensed, which permits copying, modification and redistribution with notice. The full license, copyright headers and third-party notices are preserved in both the mirror branch and the npm tarball. No warranty of any kind is provided.

### What's in the backup

| Backup piece | Where | What it is |
|---|---|---|
| Source mirror | Branch **`mirror/rea`** | Complete git history of official `morluto/rea` `main` (as of the last sync — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | All official release tags, pointing at the exact official commits (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | The official npm package, prebuilt (`dist/` included) — installs fully **offline** |
| Sync script | **`scripts/sync-backup.ps1`** | Refreshes the mirror branch, tags and newest npm tarball from the official sources |
| Restore script | **`scripts/restore-backup.ps1`** | One-shot offline install of the tarball + prints next steps |
| The guide | `README.md` (this file) | Full setup guideline; valid regardless of which source REA comes from |

### Keep the backup fresh

Run weekly (or before you rely on it):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

It fetches `upstream/main` + all tags, force-updates `mirror/rea`, pushes the tags, `npm pack`s the newest `rea-agents-*.*.*` release into `backup/`, and prints the final `git add`/`commit`/`push` commands for the tarball.

### Restore scenarios

**Scenario A — GitHub is down, npm works:** nothing to restore. Keep using `npx rea-agents@latest setup`.

**Scenario B — GitHub + npm are down:** install the prebuilt tarball from this repo (no network, no build tools needed):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# or manually:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```

`rea setup` registers the MCP server + skill with your agent exactly as the official `npx rea-agents setup` would — offline, because it does not touch the registry.

**Scenario C — You also want the full source/history:**

```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Full official source at whatever the last sync captured.
```

Building from source requires Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ and network access to the npm registry for dependencies (it is a turbo monorepo; `npm ci && npm run build`). The tarball path (Scenario B) needs neither — always prefer it for restore.

### Verify what you restored

```powershell
# Source mirror integrity — commit should match the last synced upstream/main:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # after cloning the mirror branch
# Tarball integrity — version reported by the CLI itself:
rea --version
```

If the hashes drift from what you recorded at backup time, treat the copy as suspect and re-sync from the official sources (if they are back) before trusting it.

### What this backup does NOT guarantee

- No security patches after the last sync — an abandoned backup is an outdated snapshot.
- The official npm package may carry newer hotfixes than `mirror/rea` or the tarball.
- Side services (rea.tools website, Discord, release notes, docs site) are reference material, not code you can restore from here.
- If REA is later re-released under a different name/owner, this snapshot still works as the archived upstream — migrate deliberately, don't assume compatibility.

---

**Links**
- Website: https://rea.tools/ · Get started: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (see rea.tools footer) · X: https://x.com/reatools
- **This repo's backup:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
