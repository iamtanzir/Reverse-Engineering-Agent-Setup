<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — Mukammal Setup Guideline

> **Languages:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Yeh tarjuma English master ke mutabiq hai. Ikhtilaf ki surat mein **English won**. Code blocks, paths aur commands kabhi translate nahi hote.

> **REA — Reverse Engineer Anything**
> Ek MCP (Model Context Protocol) server + investigation skill: aapke coding agent ko software inspect karne ke tools deta hai — native binaries, JavaScript/Electron apps, browsers, .NET, Android, firmware aur zyada.

- **Official website:** https://rea.tools/
- **Official source code:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **License:** MIT (REA khud). Third-party analysis tools ke apne licenses hain.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (English mein) — platform ke hisab se step-by-step setup (Windows pehle: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) troubleshooting samet
- **📦 Offline backup shamil hai** — official repo ka unofficial mirror + npm tarball; sirf jab official sources gayab ho jaayein. Dekhein **[Section 20 — Offline Backup / Mirror (Unofficial)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Zaroori:** REA sirf `morluto/rea`, `rea.tools` ya `rea-agents` npm package se download karein. Milta jula repo naam official release nahi prove karta.

---

## Fahrist (Index)

1. REA kya hai (aur kya nahi hai)
2. Qanooni aur zimmedaar istemal
3. Aap kya analyze kar sakte hain
4. System requirements
5. Step 1 — Apna computer tayyar karein
6. Step 2 — Coding agent choose karein
7. Step 3 — REA connect karein
8. Step 4 — Installation verify karein
9. Step 5 — Aapki pehli investigation (Notes example)
10. Native analysis (binaries / EXE / DLL)
11. JavaScript & Electron apps
12. Browser observation
13. Doosre targets aur zaroori tools
14. RL environments banayein
15. REA terminal se istemal karein (CLI)
16. REA update ya remove karein
17. Troubleshooting
18. Data, privacy aur security
19. Quick reference checklist
20. Offline Backup / Mirror (Unofficial)

---

## 1. REA kya hai (aur kya nahi hai)

**REA yeh hai:**
- Local MCP server + agent skill — aapke **coding agent** ko local software inspect karne deta hai.
- **Evidence** return karta hai: assembly, pseudocode, module maps, IPC channel pairings, captured network traffic, source locations — original source code nahi.
- Analysis **aapke machine par** chalti hai. Aapki app REA ke zariye upload nahi hoti; aapke agent ka model provider results dekhta hai (dekhein [Data & Privacy](#18-data-privacy-aur-security)).

**REA yeh nahi hai:**
- "Source code mein wapas badalne" wala magic button. Results assembly/pseudocode aur references hain; aapka agent samjhata hai aur rebuild karne mein madad karta hai.
- Licenses/DRM todne ya paid activation bypass karne ka tool. Iske liye istemal na karein.
- Obfuscation bypass. Sakht packed/protected targets (VMProtect, Themida, anti-tamper) bohot mushkil hain.
- Server-side access. API ke piche ka server inspect nahi ho sakta; sirf client/network side dikhti hai.

---

## 2. Qanooni aur zimmedaar istemal

Reverse engineering interoperability, security research, debugging aur apni **own** software analyze karne ke liye legal ho sakti hai — lekin kanun aur licenses jurisdiction ke hisab se alag hote hain.

**Aap ko chahiye:**
- Woh software analyze karein jo aap ki hai, jise use karne ki license hai, ya inspect karne ki permission hai.
- License agreements, Terms of Service, aur DMCA anti-circumvention rules respect karein.
- Findings sirf interoperability, education aur defensive security ke liye istemal karein.

**Aap ko nahi karna chahiye:**
- DRM, license activation ya copy protection bypass karna.
- Proprietary software ka cracked/leaked code distribute karna.
- Aise targets analyze karna jin ka aap ko koi haq nahi.

Yeh guide legal advice nahi hai. Shak ho to kisi lawyer se baat karein.

---

## 3. Aap kya analyze kar sakte hain

| Target | REA kya return karta hai | Native engine zaroori? |
|---|---|---|
| Native binaries / libraries (EXE, DLL, ELF, Mach-O) | Functions, assembly, pseudocode, callers, xrefs, constants | Haan — Hopper, Ghidra ya IDA |
| JavaScript & Electron apps | Modules, imports, IPC channels + handlers, source locations | Nahi |
| Browser pages (runtime) | Requests/responses, scripts, JSON body shapes, observation window | Chrome family browser |
| .NET assemblies / Flutter / packages | Module & resource inspection | Nahi |
| Android APK / devices / resources | Decompiled classes, resources, device interaction | JADX / adb / Apktool |
| Firmware | Extracted filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module & function inspection | WABT |
| SQLite databases | Schema & query inspection | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract structure | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy captures | Parsed traffic evidence | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol facts | TShark / capinfos (Linux) |

---

## 4. System requirements

**Minimum:**
- Node.js **22.23.4+**, **24.22.1+**, ya **26+ (>= 26.12.1)** (npm shamil)
- Supported coding agent (step 2)
- Investigations ke liye working directory

**Native (binary) analysis ke liye** — in mein se ek:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (free, Windows par recommended)
- **IDA** (commercial; verified Windows legacy GUI + headless supervisor profiles)
- **Hopper** (commercial; macOS & kuch Linux — **Windows par available nahi**)

**OS notes:**
- Windows: **PowerShell** istemal karein; spaces wale paths quotes mein rakhein. Agar aapka agent WSL mein chalta hai, Node.js + REA WSL ke **andar** install karein aur Linux paths use karein.
- Linux: `procps`-compatible `ps` PATH par hona chahiye (Ghidra/JADX/firmware launches aur static analysis ke liye).
- macOS: Terminal istemal karein; kuch steps Xcode Command Line Tools chahte hain (arm64 par Ghidra decompiler build).

---

## 5. Step 1 — Apna computer tayyar karein

### 5.1 Node.js check karein

```powershell
node -v
npm -v
```

Expected: `v22.23.4+`, `v24.22.1+`, ya `v26.12.1+`. Purana → Node.js 24 LTS install karein.

### 5.2 Windows par Node.js install karein (agar nahi hai)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Terms accept karne ka kaha jaye to `Y` type karein, PowerShell band karke doबारा kholein, phir `node -v` dekhein. (Alternative: https://nodejs.org/ se LTS installer download karein.)

> **PowerShell quirk:** agar `npx` fail ho «running scripts is disabled on this system» ke sath, to `npx.cmd` aur `npm.cmd` use karein:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS ka `.pkg` download karein, ya Homebrew se: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# shell dobara kholein, phir:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Ek working folder banayein

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Step 2 — Coding agent choose karein

REA har us agent ko support karta hai jo local **MCP** bolta hai. Ek choose karein — sab examples client ke **setup ID** (`--client <id>`) use karte hain.

| Client | Setup ID | Installation / notes |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | App install karke sign in karein, phir `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` ya install script · ChatGPT se sign in |
| Cursor | `cursor` | Editor install, working folder kholein, Agent mode |
| Windsurf | `windsurf` | Same pattern; agent chat |
| VS Code | `vscode` | Pehle GitHub Copilot set up karein, phir Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` chalayein, `/connect` se model jodein, phir `--client opencode` |
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

**Grok Bot:** bot ke chat mein usse kahein ke iske hosted computer par `rea` naam ka custom MCP server add kare:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Step 3 — REA connect karein

### Option A — Apna agent karwayein (recommended)

Apne agent ke chat mein paste karein:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent setup run karta hai, plan dikhata hai, aur aapki approval ke baad apply karta hai.

### Option B — setup khud chalayein

```powershell
npx rea-agents@latest setup
```

Specific client ke liye:

```powershell
npx rea-agents@latest setup --client opencode
```

setup ke dauran:
- Move karne ke liye **arrow keys**, select karne ke liye **Space**, continue ke liye **Enter**.
- REA **MCP connection** + **investigation skill** add karta hai, aur maujooda config ka **backup** pehle leyta hai.
- Changes aapki approval ke baad hi apply hote hain.
- Pehle exercise mein optional Hopper installation skip kar sakte hain.

### setup ke baad client restart karein

- Desktop apps (Claude Desktop, Cursor, Windsurf, VS Code): **poori tarah** quit karke dobara kholein (Windows: tray icon se bhi quit karein).
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): session exit karke dobara start karein.

---

## 8. Step 4 — Installation verify karein

Apne client ka doctor check chalayein (`<client_id>` badlein):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Healthy report `"healthy": true` dikhata hai. Phir apne agent se poochein:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Step 5 — Aapki pehli investigation (Notes example)

Official example ek chhota Electron app hai jisme **Export notes** button hai. Electron install karne ki zaroorat nahi — agent code padhta hai.

Agent mein paste karein:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Expected result: Export click karne par `notes:export` IPC message jata hai; main process notes ko CSV format karke `notes.csv` (columns: `id`, `title`) aapke Downloads folder mein likhta hai.

Terminal se manual analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native analysis (binaries / EXE / DLL)

Deep native analysis ke liye provider chahiye. **Windows** par **Ghidra** ya **IDA** use karein (Hopper Windows par available nahi).

### 10.1 Ghidra (free) — Windows setup

1. **64-bit JDK 21 ya newer** install karein (compiler samet). Check karein:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Release ke *Assets* list se **Ghidra 12.1.4** download karein aur `ghidra_…_PUBLIC_….zip` extract karein (release archive, **"Source code" nahi**).
3. `ghidraRun.bat` wala extracted folder note karein — yeh aapka `GHIDRA_INSTALL_DIR` hai.
4. PowerShell mein:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home wala folder
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Paths apne installation se badlein. setup ka updated plan review karein, approve karein, aur **agent restart karein**.

> Windows par Ghidra support **experimental, read-only** hai — sirf local fixed **NTFS** drives par x86/x64 PE apps aur DLLs ke liye.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 aur Linux arm64 par pehle Ghidra ka native decompiler build karein (macOS ko Xcode Command Line Tools, make, bison chahiye).

### 10.3 IDA

1. IDA provider guide ke hisab se upstream IDA MCP server install aur configure karein.
2. Working registration ko `ida-mcp.json` ke naam se save karein. Example (`idb_open`/`idb_list`/`idb_close` wala headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Attached legacy 1.4.0 GUI server ke liye, uska working command/args/env copy karein (pehle IDA mein binary open karke plugin start karein).
3. Connect karein:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux par `$env:` ki jagah `export` use karein. setup ke baad agent restart karein.

> Verified IDA profiles: Windows legacy GUI aur headless supervisor, sath hi macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 mein macOS headless profile / native GUI bridge shamil nahi — unhein REA source build chahiye.

### 10.4 Hopper (sirf macOS / Linux)

Setup existing Hopper detect kar sakta hai ya installation plan propose kar sakta hai. macOS par pehli baar open hone par demo mode choose karein ya license activate karein. Linux par automated setup ke liye x86_64 host chahiye aur Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS ya Omarchy. Linux arm64 par Ghidra use karein.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Provider istemal karna

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI se ek-baar function analysis (Ghidra configured hona chahiye):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron apps

Native engine ki zaroorat nahi. Agent ko app ke **folder** ya **.asar** ki taraf point karein:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron apps mein `app.asar` kahan hota hai:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: aksar `/opt/<App>/resources/app.asar`

Terminal se static analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

`normalized_result.summary.ipc` mein matched channels/handlers aur `normalized_result.graph` mein source locations dekhein. Dynamically computed channel names unresolved reh sakte hain — us surat mein browser observation use karein (agla section).

---

## 12. Browser observation

1. Target page Chrome-family browser mein remote debugging ke sath kholein, jaise:

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

2. Apne agent se poochein:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Usay endpoint `http://127.0.0.1:9222` aur page ka URL dein. Click karne se **pehle** capture start karein.

   Ya terminal se:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP bodies ke liye, Fiddler Everywhere ke exports (SAZ/HAR 1.2) REA capture Evidence ban sakte hain, ya Everywhere ka MCP server connect karein.

---

## 13. Doosre targets aur zaroori tools

| Target | Tools jo tayyar karne hain | Notes |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Engine ki zaroorat nahi |
| Website | Chrome / Chromium / Edge | Remote debugging port |
| .NET / Flutter / packages | Node.js + npm | Static inspection |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android device | adb | USB debugging enable karein |
| Android resources | Apktool + Java | resources aur manifest unpack karta hai |
| JEB project | JEB + MCP | Commercial decompiler |
| Firmware | Binwalk / Unblob | **Sirf Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite database | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Sirf Linux x64** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Captures ka offline parsing |
| PCAP / PCAPNG | TShark / capinfos | **Sirf Linux** |
| Logic signals | sigrok-cli | **Sirf Linux** |
| Process behavior | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM aur full investigation guides: https://rea.tools/guides.

---

## 14. RL environments banayein

REA ek test web app session record karke ek **AgentEnv** environment export kar sakta hai, agents ko train/evaluate karne ke liye.

1. Ek **test** app instance tayyar karein jahan agent data create/edit/delete kar sake.
2. Apne agent se poochein (folders wala example):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Password MCP server environment (`APP_PASSWORD`) mein rakhein, prompt mein nahi.
3. Ya seedha HAR recording se build karein:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` report review karta hai bina files likhe.
4. Run karein:
   ```bash
   agent-env run ./my-env
   ```
   REA ka compatibility check **AgentEnv 0.9.1334 + Python 3.12** use karta hai; Docker chal raha ho.
5. Sirf wo operations supported hain jinki **effects** record hui hain (masalan delete ke liye missing-item response aur updated list record karni hogi). Share karne se pehle retained response bodies review karein — credentials ho sakte hain.

---

## 15. REA terminal se istemal karein (CLI)

Global install ke bina:

```powershell
npx -y rea-agents@latest --help
```

`rea` command permanently install karein:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux ke liye curl installer (pehle Node.js chahiye):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Common commands:

| Command | Maqsad |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modules, imports, IPC, boundaries map karein |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Ek native function analyze karein |
| `rea-agents list-browser-targets <endpoint> --json` | Debug-able browser pages list karein |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Page network/scripts observe karein |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL environment build karein |
| `rea-agents environment-compare … --json` | Environment vs live app compare karein |
| `rea-agents doctor --client <id> --json` | Client connection check karein |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Native provider check karein |
| `rea-agents update` | CLI update karein |
| `rea-agents uninstall` | REA client config + skill remove karein |

---

## 16. REA update ya remove karein

**Update:**
```powershell
rea update                       # agar global CLI installed hai
npx rea-agents@latest setup      # agent connection + skill refresh karein; plan approve karke restart karein
```

**Remove:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Troubleshooting

**Agent REA tools nahi dekh sakta**
1. Client poori tarah restart/reconnect karein (tray icon samet).
2. `npx -y rea-agents@latest doctor --client <id> --json` — agar registration missing/stale hai: `npx rea-agents@latest setup --client <id>`, restart karein.
3. Abhi bhi nahi dikhra: client ka MCP connection error check karein; editor clients mein MCP settings mein REA enable karke uske tools allow karein.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
`npx.cmd` / `npm.cmd` use karein, ya `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Spaces wale paths**
Quotes mein rakhein: `"D:/my apps/tool.exe"`. WSL mein Linux paths use karein aur REA WSL ke andar install karein.

**Windows Ghidra limits**
Experimental, read-only, sirf x86/x64 PE, fixed local NTFS drives. Linux alternative: Ghidra/Hopper. Native x64 Linux ELF crash analysis: pwntools.

**macOS Automation permission maangta hai (Hopper)**
System Settings → Privacy & Security → Automation → REA start karne wali app allow karein, retry karein.

**Hopper first-run**
Unattended analysis se pehle demo mode vs license activation ka choice complete karein.

**Linux mein `ps` nahi hai**
`procps` install karein (Debian/Ubuntu: `sudo apt install procps`); REA ko process ownership checks ke liye chahiye.

**Bug mila?**
REA update, restart, retry. Phir issue kholein with: REA version, OS, target type, repro steps, error output, provider naam. https://github.com/morluto/rea/issues.

---

## 18. Data, privacy aur security

- REA targets ko **aapke machine par** analyze karta hai; aapki app REA ke zariye upload **nahi** hoti.
- **Aapke agent ka model provider** results receive karta hai — uski data/retention policy apply hoti hai. Prompt mein secrets ya customer data paste na karein.
- MCP input schemas default mein compact hain; full field guidance ke liye MCP registration mein `REA_MCP_INPUT_SCHEMA_PROFILE=full` set karein. Output schemas `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (ya `off`) se bound ho sakte hain.
- RL environment recordings bodies/headers mein credentials retain kar sakti hain — share karne se pehle review karein. Credential-name warnings jagahein flag karti hain; values **remove nahi karti**.
- `APP_PASSWORD` jaise secrets MCP server environment mein rakhein, chat mein nahi.
- REA sirf `morluto/rea`, `rea.tools`, ya npm `rea-agents` se install karein.

---

## 19. Quick reference checklist

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent installed (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (plan review & approve karein)
[ ] Client poori tarah restart
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Pehli investigation: notes-example.zip  →  notes:export / notes.csv dhundhein
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup dobara chalayein → agent restart karein
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: aap target ka malik hain / analyze karne ki license hai
```

---

## 20. Offline Backup / Mirror (Unofficial)

> ⚠️ **Pehle yeh padhein.**
> Official project ka koi «official backup» nahi hota. Sirf ek official REA hai: **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, aur **`rea-agents`** npm package.
> Yeh repo official project ka complete, license-compliant **unofficial mirror / archive** deta hai, original MIT license aur copyright notices ke sath. Yeh is liye hai ke **agar official repo, website ya npm package gayab ho jaye**, to aap REA yahan se hasil kar sakein — aur kuch nahi.
> Jab tak official sources maujood hain, **unhein istemal karein**. Is backup ko «official» na kahein, aur na «official REA» ke taur par redistribute karein. Yeh repo REA ke authors se affiliated nahi, aur na unke endorsed hain.

**License:** REA MIT licensed hai — copy, modify, redistribute with notice allowed hai. Full license, copyright headers aur third-party notices mirror branch aur npm tarball dono mein preserved hain. Koi warranty nahi di jati.

### Backup mein kya shamil hai

| Backup piece | Kahan | Kya hai |
|---|---|---|
| Source mirror | Branch **`mirror/rea`** | Official `morluto/rea` `main` ki complete git history (aakhri sync ke waqt — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | Sab official release tags, exact official commits par point karte hue (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Official npm package, prebuilt (`dist/` samet) — **poori tarah offline** install |
| Sync script | **`scripts/sync-backup.ps1`** | Mirror branch, tags aur naye npm tarball ko official sources se refresh karta hai |
| Restore script | **`scripts/restore-backup.ps1`** | tarball ka one-shot offline install + agle steps print karta hai |
| Guide | `README.md` (English master) | Full setup guideline; REA kahin se bhi aaye, valid hai |

### Backup fresh rakhein

Weekly run karein (ya jab tak is par depend karne lagay hain):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Yeh `upstream/main` + sab tags fetch karta hai, `mirror/rea` ko force-update karta hai, tags push karta hai, latest `rea-agents-*.*.*` ko `npm pack` karke `backup/` mein daalta hai, aur tarball ke final `git add`/`commit`/`push` commands print karta hai.

### Restore scenarios

**Scenario A — GitHub down, npm theek hai:** kuch restore karne ki zaroorat nahi. `npx rea-agents@latest setup` jaari rakhein.

**Scenario B — GitHub + npm dono down:** is repo se prebuilt tarball install karein (no network, no build tools):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# ya manually:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` aapke agent ke sath MCP server + skill exactly usi tarah register karta hai jaise official `npx rea-agents setup` — poori tarah offline, registry ko touch nahi karta.

**Scenario C — Aapko full source/history bhi chahiye:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Aakhri sync ke waqt ka complete official source.
```

Source se build karne ke liye Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ aur npm registry tak network access chahiye (turbo monorepo; `npm ci && npm run build`). tarball path (Scenario B) ko dono ki zaroorat nahi — restore ke waqt hamesha usi ko prefer karein.

### Jo restore kiya usay verify karein
```powershell
# Source mirror integrity — commit aakhri synced upstream/main se match hona chahiye:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # mirror branch clone karne ke baad
# tarball integrity — khud CLI jo version report karti hai:
rea --version
```

Agar hashes backup ke waqt ke records se drift karte hain, to copy ko suspicious samjhein aur official sources se (agar wo wapas aa gaye hain) dobara sync karein uspar trust karne se pehle.

### Yeh backup kya guarantee NAHI karta

- Aakhri sync ke baad security patches nahi — abandoned backup ek outdated snapshot hai.
- Official npm package mein `mirror/rea` ya tarball se naye hotfixes ho sakte hain.
- Side services (rea.tools website, Discord, release notes, docs site) reference material hain, yahan se restore hone wala code nahi.
- Agar REA baad mein doosre naam/owner ke sath re-release ho, yeh snapshot archived upstream ke taur par chalta rahega — soch samajh kar migrate karein, compatibility assume na karein.

---

**Links**
- Website: https://rea.tools/ · Get started: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (dekhein rea.tools footer) · X: https://x.com/reatools
- **Is repo ka backup:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
