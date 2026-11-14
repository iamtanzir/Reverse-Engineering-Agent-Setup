# Reverse Engineering Agent — সম্পূর্ণ সেটআপ গাইডলাইন

> **Languages:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md)
>
> ℹ️ এই অনুবাদ ইংরেজি মাস্টার কপির সাথে সামঞ্জস্যপূর্ণ। কোনো অমিল হলে **ইংরেজি প্রযোজ্য**। কোড ব্লক, path এবং command কখনো অনুবাদ হয় না।

> **REA — Reverse Engineer Anything**
> একটি MCP (Model Context Protocol) সার্ভার + investigation skill: আপনার coding agent-কে software inspect করার tools দেয় — native binaries, JavaScript/Electron apps, browsers, .NET, Android, firmware এবং আরও অনেক কিছু।

- **Official website:** https://rea.tools/
- **Official source code:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **License:** MIT (REA-এর নিজস্ব)। Third-party analysis tools-এর নিজস্ব license আছে।
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (ইংরেজিতে) — platform অনুযায়ী step-by-step setup (Windows আগে: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) troubleshooting সহ
- **📦 Offline backup অন্তর্ভুক্ত** — official repo-র unofficial mirror + npm tarball; শুধু official source হারিয়ে গেলে ব্যবহার করুন। দেখুন **[Section 20 — Offline Backup / Mirror (Unofficial)](#20-offline-backup--mirror-unofficial)**।

> ⚠️ **গুরুত্বপূর্ণ:** REA শুধু `morluto/rea`, `rea.tools`, অথবা `rea-agents` npm package থেকে download করুন। একই রকম repo নাম মানে সেটা official release নয়।

---

## সূচিপত্র

1. REA কী (এবং কী নয়)
2. আইনি ও দায়িত্বশীল ব্যবহার
3. আপনি কী কী analyze করতে পারেন
4. System requirements
5. ধাপ ১ — আপনার কম্পিউটার প্রস্তুত করুন
6. ধাপ ২ — Coding agent বাছাই করুন
7. ধাপ ৩ — REA connect করুন
8. ধাপ ৪ — Installation verify করুন
9. ধাপ ৫ — আপনার প্রথম investigation (Notes example)
10. Native analysis (binaries / EXE / DLL)
11. JavaScript & Electron apps
12. Browser observation
13. অন্যান্য target ও প্রয়োজনীয় tools
14. RL environment তৈরি করুন
15. Terminal থেকে REA ব্যবহার করুন (CLI)
16. REA update বা remove করুন
17. Troubleshooting
18. Data, privacy ও security
19. Quick reference checklist
20. Offline Backup / Mirror (Unofficial)

---

## 1. REA কী (এবং কী নয়)

**REA হলো:**
- একটি local MCP server + agent skill — আপনার **coding agent**-কে আপনার local software inspect করতে দেয়।
- **Evidence** ফেরত দেয়: assembly, pseudocode, module maps, IPC channel pairings, captured network traffic, source locations — আসল source code নয়।
- Analysis চলে **আপনার machine-এ**। আপনার app REA-এর মাধ্যমে upload হয় না; আপনার agent-এর model provider ফলাফল দেখে (দেখুন [Data & Privacy](#18-data-privacy--security))।

**REA নয়:**
- "Source code-এ ফিরিয়ে আনার" magic button। ফলাফল হলো assembly/pseudocode ও references; আপনার agent বুঝিয়ে দেয় এবং behavior rebuild করতে সাহায্য করে।
- License/DRM ভাঙা বা paid activation bypass করার tool। এজন্য ব্যবহার করবেন না।
- Obfuscation bypass। শক্তভাবে packed/protected targets (VMProtect, Themida, anti-tamper) অত্যন্ত কঠিন।
- Server-side access। API-এর পেছনের server inspect করা যায় না; শুধু client/network side দেখা যায়।

---

## 2. আইনি ও দায়িত্বশীল ব্যবহার

নিজের **মালিকানাধীন** software analyze করা, interoperability, security research, debugging — এসবের জন্য reverse engineering আইনি হতে পারে — তবে আইন ও license দেশভেদে ভিন্ন।

**আপনার উচিত:**
- নিজের, licensed, বা inspect করার অনুমতিপ্রাপ্ত software analyze করা।
- License agreements, Terms of Service, এবং DMCA anti-circumvention নিয়ম সম্মান করা।
- ফলাফল interoperability, শিক্ষা ও defensive security-তে ব্যবহার করা।

**আপনার করা উচিত নয়:**
- DRM, license activation বা copy protection bypass করা।
- Proprietary software-এর cracked/leaked code বিতরণ করা।
- যে target-এ আপনার অধিকার নেই সেটি analyze করা।

এই গাইড আইনি পরামর্শ নয়। সন্দেহে আইনজীবীর পরামর্শ নিন।

---

## 3. আপনি কী কী analyze করতে পারেন

| Target | REA কী ফেরত দেয় | Native engine লাগবে? |
|---|---|---|
| Native binaries / libraries (EXE, DLL, ELF, Mach-O) | Functions, assembly, pseudocode, callers, xrefs, constants | হ্যাঁ — Hopper, Ghidra বা IDA |
| JavaScript & Electron apps | Modules, imports, IPC channels + handlers, source locations | না |
| Browser pages (runtime) | Requests/responses, scripts, JSON body shapes, observation window | Chrome-family browser |
| .NET assemblies / Flutter / packages | Module ও resource inspection | না |
| Android APK / devices / resources | Decompiled classes, resources, device interaction | JADX / adb / Apktool |
| Firmware | Extracted filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module ও function inspection | WABT |
| SQLite databases | Schema ও query inspection | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract structure | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy captures | Parsed traffic evidence | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol facts | TShark / capinfos (Linux) |

---

## 4. System requirements

**সর্বনিম্ন:**
- Node.js **22.23.4+**, **24.22.1+**, বা **26+ (>= 26.12.1)** (npm সহ)
- একটি supported coding agent (ধাপ ২)
- আপনার investigations-এর জন্য working directory

**Native (binary) analysis-এর জন্য** — যেকোনো একটি:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (ফ্রি, Windows-এ recommended)
- **IDA** (বাণিজ্যিক; verified Windows legacy GUI + headless supervisor profiles)
- **Hopper** (বাণিজ্যিক; macOS ও কিছু Linux — **Windows-এ পাওয়া যায় না**)

**OS নোট:**
- Windows: **PowerShell** ব্যবহার করুন; spaces-সহ paths quotes-এ রাখুন। আপনার agent WSL-এ চললে Node.js + REA WSL-এর **ভেতরে** install করে Linux paths ব্যবহার করুন।
- Linux: Ghidra/JADX/firmware launches ও static analysis-এর জন্য `procps`-compatible `ps` `PATH`-এ থাকতে হবে।
- macOS: Terminal ব্যবহার করুন; কিছু ধাপে Xcode Command Line Tools লাগে (arm64-এ Ghidra decompiler build)।

---

## 5. ধাপ ১ — আপনার কম্পিউটার প্রস্তুত করুন

### 5.1 Node.js চেক করুন

```powershell
node -v
npm -v
```

প্রত্যাশিত: `v22.23.4+`, `v24.22.1+`, বা `v26.12.1+`। পুরোনো হলে → Node.js 24 LTS install করুন।

### 5.2 Windows-এ Node.js install করুন (না থাকলে)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Terms accept করতে বললে `Y` দিন, PowerShell বন্ধ করে আবার খুলুন, `node -v` আবার দেখুন। (বিকল্প: https://nodejs.org/ থেকে LTS installer download করুন।)

> **PowerShell-এর একটু ছাঁদে:** `npx` যদি «running scripts is disabled on this system» দিয়ে fail করে, `npx.cmd` ও `npm.cmd` ব্যবহার করুন:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS-এর `.pkg` download করুন, অথবা Homebrew দিয়ে: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# shell আবার খুলুন, তারপর:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 একটি working folder বানান

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. ধাপ ২ — Coding agent বাছাই করুন

REA যেকোনো agent-কে support করে যে local **MCP** বোঝে। একটি বেছে নিন — সব উদাহরণে client-এর **setup ID** ব্যবহার করা হয়েছে (`--client <id>`)।

| Client | Setup ID | Install / নোট |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | App install করে sign in করুন, তারপর `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` বা install script · ChatGPT দিয়ে sign in |
| Cursor | `cursor` | Editor install, working folder খুলুন, Agent mode |
| Windsurf | `windsurf` | একই pattern; agent chat |
| VS Code | `vscode` | আগে GitHub Copilot সেটআপ করুন, তারপর Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` চালান, `/connect` দিয়ে model যোগ করুন, তারপর `--client opencode` |
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

**Grok Bot:** bot-এর chat-এ বলুন এর hosted computer-এ `rea` নামের একটি custom MCP server যোগ করতে:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. ধাপ ৩ — REA connect করুন

### Option A — আপনার agent-কে করতে দিন (recommended)

আপনার agent-এর chat-এ paste করুন:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent setup চালায়, plan দেখায় এবং আপনার approval-এর পরে apply করে।

### Option B — নিজে setup চালান

```powershell
npx rea-agents@latest setup
```

কোনো নির্দিষ্ট client-এর জন্য:

```powershell
npx rea-agents@latest setup --client opencode
```

setup চলাকালে:
- চলাচলের জন্য **arrow keys**, নির্বাচনের জন্য **Space**, পরের ধাপে **Enter**.
- REA **MCP connection** + **investigation skill** যোগ করে, এবং পরিবর্তনের আগে বর্তমান config-এর **backup** নেয়।
- পরিবর্তন শুধু আপনার approval-এর পর apply হয়।
- প্রথম exercise-এ optional Hopper installation skip করা যায়।

### setup-এর পরে client restart করুন

- Desktop apps (Claude Desktop, Cursor, Windsurf, VS Code): **পুরোপুরি** quit করে আবার খুলুন (Windows: tray icon থেকেও quit).
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): session exit করে আবার চালু করুন।

---

## 8. ধাপ ৪ — Installation verify করুন

আপনার client-এর doctor check চালান (`<client_id>` পরিবর্তন করুন):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Healthy report-এ `"healthy": true` দেখাবে। তারপর agent-কে জিজ্ঞেস করুন:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. ধাপ ৫ — আপনার প্রথম investigation (Notes example)

Official example-টি একটি ছোট Electron app যেখানে **Export notes** button আছে। Electron install করতে হবে না — agent code পড়ে।

আপনার agent-এ paste করুন:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

প্রত্যাশিত ফলাফল: Export ক্লিক করলে `notes:export` IPC message যায়; main process notes-কে CSV format করে `notes.csv` (columns: `id`, `title`) আপনার Downloads folder-এ লেখে।

Terminal থেকে manual analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native analysis (binaries / EXE / DLL)

গভীর native analysis-এর জন্য provider লাগে। **Windows**-এ **Ghidra** বা **IDA** ব্যবহার করুন (Hopper Windows-এ নেই)।

### 10.1 Ghidra (ফ্রি) — Windows setup

1. **64-bit JDK 21 বা নতুন** install করুন (compiler সহ)। যাচাই করুন:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Release-এর *Assets* তালিকা থেকে **Ghidra 12.1.4** download করে `ghidra_…_PUBLIC_….zip` extract করুন (release-এর archive, **"Source code" নয়**)।
3. `ghidraRun.bat` থাকা extracted folder মনে রাখুন — এটিই আপনার `GHIDRA_INSTALL_DIR`.
4. PowerShell-এ:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home যে folder দেখায়
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Path আপনার installation অনুযায়ী বসান। setup-এর updated plan দেখে approve করুন এবং **agent restart করুন**।

> Windows-এ Ghidra support **experimental, read-only** — শুধু local fixed **NTFS** drives-এ x86/x64 PE apps এবং DLLs-এর জন্য।

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 ও Linux arm64-এ আগে Ghidra-এর native decompiler build করুন (macOS লাগবে Xcode Command Line Tools, make, bison)।

### 10.3 IDA

1. IDA provider guide অনুযায়ী upstream IDA MCP server install ও configure করুন।
2. কাজ করা registration `ida-mcp.json` নামে সংরক্ষণ করুন। উদাহরণ (`idb_open`/`idb_list`/`idb_close` সহ headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Attached legacy 1.4.0 GUI server-এর জন্য, এর কাজ করা command/args/env কপি করুন (প্রথমে IDA-তে binary খুলে plugin চালু করুন)।
3. Connect করুন:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux-এ `$env:`-এর বদলে `export` ব্যবহার করুন। setup-এর পর agent restart করুন।

> Verified IDA profiles: Windows legacy GUI ও headless supervisor, সাথে macOS arm64 headless supervisor (IDA Professional 9.1)। npm 6.4.0-এ macOS headless profile / native GUI bridge নেই — সেগুলোর জন্য REA source build লাগে।

### 10.4 Hopper (শুধু macOS / Linux)

Setup existing Hopper detect করতে পারে অথবা installation plan propose করতে পারে। macOS-এ প্রথম বার খোলার সময় demo mode বেছে নিন অথবা license activate করুন। Linux-এ automated setup-এর জন্য x86_64 host ও Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS বা Omarchy লাগে। Linux arm64-এ Ghidra ব্যবহার করুন।

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Provider ব্যবহার করা

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI থেকে one-off function analysis (Ghidra configured থাকতে হবে):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron apps

Native engine লাগে না। আপনার agent-কে app-এর **folder** বা **.asar**-এর দিকে point করুন:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron apps-এ `app.asar` কোথায় থাকে:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: প্রায়ই `/opt/<App>/resources/app.asar`

Terminal থেকে static analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

`normalized_result.summary.ipc`-এ matched channels/handlers এবং `normalized_result.graph`-এ source locations দেখুন। Computed channel names unresolved থেকে যেতে পারে — তখন browser observation ব্যবহার করুন (পরের section)।

---

## 12. Browser observation

1. Chrome-family browser-এ remote debugging সহ target page খুলুন, যেমন:

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

2. আপনার agent-কে জিজ্ঞেস করুন:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   একে endpoint `http://127.0.0.1:9222` এবং page URL দিন। ক্লিক করার **আগে** capture শুরু করুন।

   অথবা terminal থেকে:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP bodies-এর জন্য, Fiddler Everywhere-এর exports (SAZ/HAR 1.2) REA capture Evidence হিসেবে ব্যবহার করা যায়, অথবা Everywhere-এর MCP server connect করুন।

---

## 13. অন্যান্য target ও প্রয়োজনীয় tools

| Target | যে tools প্রস্তুত করবেন | নোট |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Engine লাগে না |
| Website | Chrome / Chromium / Edge | Remote debugging port |
| .NET / Flutter / packages | Node.js + npm | Static inspection |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android device | adb | USB debugging enable করুন |
| Android resources | Apktool + Java | resources ও manifest unpack করে |
| JEB project | JEB + MCP | Commercial decompiler |
| Firmware | Binwalk / Unblob | **শুধু Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite database | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **শুধু Linux x64** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Captures-এর offline parsing |
| PCAP / PCAPNG | TShark / capinfos | **শুধু Linux** |
| Logic signals | sigrok-cli | **শুধু Linux** |
| Process behavior | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM এবং সম্পূর্ণ investigation guides: https://rea.tools/guides.

---

## 14. RL environments তৈরি করুন

REA একটি test web app session record করে **AgentEnv** environment export করতে পারে, agents-এর training/evaluation-এর জন্য।

1. একটি **test** app instance প্রস্তুত করুন যেখানে agent data create/edit/delete করতে পারবে।
2. আপনার agent-কে জিজ্ঞেস করুন (folders-এর উদাহরণ):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Password MCP server environment (`APP_PASSWORD`)-এ রাখুন, prompt-এ নয়।
3. অথবা সরাসরি HAR recording থেকে build করুন:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` কোনো file লেখা ছাড়াই report review করে।
4. Run করুন:
   ```bash
   agent-env run ./my-env
   ```
   REA-এর compatibility check **AgentEnv 0.9.1334 + Python 3.12** ব্যবহার করে; Docker চলতে হবে।
5. শুধু যে operations-এর **effects** record হয়েছে সেগুলো supported (যেমন delete-এর জন্য missing-item response এবং updated list record থাকা লাগে)। Share করার আগে retained response bodies review করুন — credentials থেকে যেতে পারে।

---

## 15. Terminal থেকে REA ব্যবহার করুন (CLI)

Global install ছাড়াই:

```powershell
npx -y rea-agents@latest --help
```

`rea` command চিরস্থায়ীভাবে install করুন:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux-এর জন্য curl installer (আগে Node.js লাগবে):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

সাধারণ commands:

| Command | কাজ |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modules, imports, IPC, boundaries map করুন |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | একটি native function analyze করুন |
| `rea-agents list-browser-targets <endpoint> --json` | Debug-able browser pages list করুন |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Page network/scripts observe করুন |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL environment build করুন |
| `rea-agents environment-compare … --json` | Environment vs live app compare করুন |
| `rea-agents doctor --client <id> --json` | Client connection check করুন |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Native provider check করুন |
| `rea-agents update` | CLI update করুন |
| `rea-agents uninstall` | REA client config + skill remove করুন |

---

## 16. REA update বা remove করুন

**Update:**
```powershell
rea update                       # যদি global CLI install থাকে
npx rea-agents@latest setup      # agent connection + skill refresh করুন; plan approve করে restart করুন
```

**Remove:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Troubleshooting

**Agent REA tools দেখতে পাচ্ছে না**
1. Client পুরোপুরি restart/reconnect করুন (tray icon সহ)।
2. `npx -y rea-agents@latest doctor --client <id> --json` — registration missing/stale হলে: `npx rea-agents@latest setup --client <id>`, restart করুন।
3. এখনো দেখা না গেলে: client-এর MCP connection error দেখুন; editor client-এ MCP settings-এ REA enable করে এর tools allow করুন।

**`npx` — «running scripts is disabled» (Windows PowerShell)**
`npx.cmd` / `npm.cmd` ব্যবহার করুন, অথবা `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Spaces-সহ paths**
Quotes-এ রাখুন: `"D:/my apps/tool.exe"`. WSL-এ Linux paths ব্যবহার করুন এবং REA WSL-এর ভেতরে install করুন।

**Windows Ghidra limits**
Experimental, read-only, শুধু x86/x64 PE, fixed local NTFS drives. Linux alternative: Ghidra/Hopper. Native x64 Linux ELF crash analysis: pwntools.

**macOS Automation permission চায় (Hopper)**
System Settings → Privacy & Security → Automation → REA start-করা app-কে allow করুন, আবার চেষ্টা করুন।

**Hopper first-run**
Unattended analysis-এর আগে demo mode vs license activation-এর নির্বাচন শেষ করুন।

**Linux-এ `ps` নেই**
`procps` install করুন (Debian/Ubuntu: `sudo apt install procps`); REA-র process ownership checks-এর জন্য লাগে।

**Bug পেয়েছেন?**
REA update, restart, retry। তারপর issue খুলুন: REA version, OS, target type, repro steps, error output, provider নাম। https://github.com/morluto/rea/issues.

---

## 18. Data, privacy ও security

- REA targets **আপনার machine-এ** analyze করে; আপনার app REA-এর মাধ্যমে upload **হয় না**।
- **আপনার agent-এর model provider** results পায় — এর data/retention policy প্রযোজ্য। Prompt-এ secrets বা customer data paste করবেন না।
- MCP input schemas default-এ compact; full field guidance-এর জন্য MCP registration-এ `REA_MCP_INPUT_SCHEMA_PROFILE=full` set করুন। Output schemas `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (বা `off`) দিয়ে bound করা যায়।
- RL environment recordings bodies/headers-এ credentials রেখে দিতে পারে — share করার আগে review করুন। Credential-name warnings জায়গা নির্দেশ করে; values **remove করে না**।
- `APP_PASSWORD`-ধরনের secrets MCP server environment-এ রাখুন, chat-এ নয়।
- REA `morluto/rea`, `rea.tools`, অথবা npm `rea-agents` থেকেই install করুন।

---

## 19. Quick reference checklist

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent install হয়েছে (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (plan review ও approve করুন)
[ ] Client পুরোপুরি restart
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] প্রথম investigation: notes-example.zip  →  notes:export / notes.csv খুঁজুন
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup আবার চালান → agent restart করুন
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: আপনি target-এর মালিক / analyze করার license আছে
```

---

## 20. Offline Backup / Mirror (Unofficial)

> ⚠️ **প্রথমে এটি পড়ুন।**
> একটি official project-এর কোনো «official backup» থাকে না। একমাত্র official REA হলো **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, এবং **`rea-agents`** npm package.
> এই repo official project-এর সম্পূর্ণ, license-compliant **unofficial mirror / archive** দেয়, যাতে মূল MIT license ও copyright notices সংরক্ষিত আছে। এটি এই কারণে আছে যে **যদি official repo, website বা npm package হারিয়ে যায়**, আপনি REA এখান থেকে পেতে পারেন — আর কিছু নয়।
> যতক্ষণ official sources আছে, **সেগুলোই ব্যবহার করুন**। এই backup-কে «official» বলবেন না, «official REA» হিসেবে redistribute করবেন না। এই repo REA-এর লেখকদের সাথে যুক্ত বা তাদের endorsed নয়।

**License:** REA MIT licensed — notice সহ copy, modify, redistribute allowed। সম্পূর্ণ license, copyright headers ও third-party notices mirror branch এবং npm tarball দু'টোতেই সংরক্ষিত। কোনো warranty দেওয়া হয় না।

### Backup-এ কী কী আছে

| Backup piece | কোথায় | কী এটি |
|---|---|---|
| Source mirror | Branch **`mirror/rea`** | Official `morluto/rea` `main`-এর সম্পূর্ণ git history (শেষ sync-এর সময় — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | সব official release tags, exact official commits-এর দিকে point করে (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Official npm package, prebuilt (`dist/` সহ) — **সম্পূর্ণ offline** install |
| Sync script | **`scripts/sync-backup.ps1`** | Mirror branch, tags এবং সর্বশেষ npm tarball official sources থেকে refresh করে |
| Restore script | **`scripts/restore-backup.ps1`** | tarball-এর one-shot offline install + পরের steps print করে |
| Guide | `README.md` (English master) | সম্পূর্ণ setup guideline; REA যেখান থেকেই আসুক, valid |

### Backup fresh রাখুন

সাপ্তাহে একবার চালান (অথবা এর উপর নির্ভর করার আগে):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

এটি `upstream/main` + সব tags fetch করে, `mirror/rea` force-update করে, tags push করে, সর্বশেষ `rea-agents-*.*.*` `npm pack` করে `backup/`-এ রাখে, এবং tarball-এর শেষ `git add`/`commit`/`push` commands print করে।

### Restore scenarios

**Scenario A — GitHub down, npm ঠিক আছে:** কিছু restore করার দরকার নেই। `npx rea-agents@latest setup` চালিয়ে যান।

**Scenario B — GitHub + npm দু'টোই down:** এই repo থেকে prebuilt tarball install করুন (network নেই, build tools নেই):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# অথবা নিজে:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` আপনার agent-এ MCP server + skill ঠিক অফিসিয়াল `npx rea-agents setup`-এর মতোই register করে — সম্পূর্ণ offline, registry স্পর্শ করে না।

**Scenario C — পূর্ণ source/history-ও চান:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# শেষ sync-এর সময়ের সম্পূর্ণ official source.
```

Source থেকে build করতে Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ এবং npm registry-তে network access লাগে (turbo monorepo; `npm ci && npm run build`)। tarball path (Scenario B) এর কোনোটিরই দরকার নেই — restore-এর সময় সবসময় এটিই ব্যবহার করুন।

### Restore করা জিনিস verify করুন
```powershell
# Source mirror integrity — commit শেষ synced upstream/main-এর সাথে মিলতে হবে:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # mirror branch clone করার পর
# tarball integrity — CLI নিজে যে version report করে:
rea --version
```

Hash-গুলো backup-এর সময়ের records থেকে আলাদা হলে, ঐ copy-কে সন্দেহজনক ভাবুন এবং বিশ্বাস করার আগে official sources থেকে (ফিরে এলে) আবার sync করুন।

### এই backup কী কী গ্যারান্টি দেয় না

- শেষ sync-এর পর security patches নেই — পরিত্যক্ত backup একটি outdated snapshot।
- Official npm package-এ `mirror/rea` বা tarball-এর চেয়ে নতুন hotfixes থাকতে পারে।
- Side services (rea.tools website, Discord, release notes, docs site) reference material, এখান থেকে restore হওয়ার মতো code নয়।
- যদি REA পরবর্তীতে অন্য নামে/মালিকানায় re-release হয়, এই snapshot archived upstream হিসেবে কাজ করবে — সচেতনভাবে migrate করুন, compatibility ধরে নেবেন না।

---

**Links**
- Website: https://rea.tools/ · Get started: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (rea.tools footer দেখুন) · X: https://x.com/reatools
- **এই repo-র backup:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
