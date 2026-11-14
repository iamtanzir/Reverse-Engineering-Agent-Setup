<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — முழுமையான அமைப்பு வழிகாட்டி

> **மொழிகள்:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ இந்த மொழிபெயர்ப்பு ஆங்கில நகல் உடன் பொருந்தும். முரண்பாடு இருந்தால் **ஆங்கிலமே வெல்லும்**. Code blocks, paths, commands ஒருபோதும் மொழிபெயர்க்கப்படமாட்டாது.

> **REA — Reverse Engineer Anything**
> ஒரு MCP (Model Context Protocol) சேவையகம் + விசாரணைத் திறமை: உங்கள் coding agent-க்கு மென்பொருளை ஆய்வு செய்ய கருவிகளை வழங்குகிறது — native binaries, JavaScript/Electron apps, browsers, .NET, Android, firmware மற்றும் பலவும்.

- **அதிகாரப்பூர்வ இணையதளம்:** https://rea.tools/
- **அதிகாரப்பூர்வ மூலக் குறியீடு:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **உரிமம்:** MIT (REA தானே)। மூன்றாம் தரப்பு பகுப்பாய்வு கருவிகளுக்கு அவற்றின் சொந்த உரிமங்கள் உள்ளன.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (ஆங்கிலத்தில்) — இயங்குதள வாரியாக படிப்படியான அமைப்பு (முதலில் Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) பிழை திருத்தம்களுடன்
- **📦 offline காப்புப்பிரதி சேர்க்கப்பட்டுள்ளது** — அதிகாரப்பூர்வ repo-வின் முறையற்ற mirror + npm tarball; அதிகாரப்பூர்வ மூலங்கள் மறைந்தால் மட்டும் பயன்படுத்தவும். காண்க **[பிரிவு 20 — Offline காப்புப்பிரதி / mirror (முறையற்றது)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **முக்கியம்:** REA-வை `morluto/rea`, `rea.tools`, அல்லது `rea-agents` npm package-இலிருந்து மட்டும் பதிவிறக்கவும். ஒத்த repo பெயர்கள் அதிகாரப்பூர்வ வெளியீட்டை நிரூபிக்காது.

---

## உள்ளடக்கம்

1. REA என்றால் என்ன (என்ன அல்ல)
2. சட்டப்பூர்வமான மற்றும் பொறுப்பான பயன்பாடு
3. நீங்கள் என்னவெல்லாம் பகுப்பாய்வு செய்யலாம்
4. அமைப்புத் தேவைகள்
5. படி 1 — உங்கள் கணினியைத் தயார் செய்யுங்கள்
6. படி 2 — coding agent-ஐத் தேர்ந்தெடுக்கவும்
7. படி 3 — REA-ஐ இணைக்கவும்
8. படி 4 — நிறுவலைச் சரிபார்க்கவும்
9. படி 5 — உங்கள் முதல் விசாரணை (Notes உதாரணம்)
10. Native பகுப்பாய்வு (binaries / EXE / DLL)
11. JavaScript & Electron apps
12. Browser கவனிப்பு
13. பிற இலக்குகள் மற்றும் தேவையான கருவிகள்
14. RL சூழல்கள் உருவாக்கவும்
15. டெர்மினலில் REA பயன்படுத்தவும் (CLI)
16. REA-ஐ புதுப்பிக்கவும் அல்லது நீக்கவும்
17. பிழை திருத்தம்
18. தரவு, தனியுரிமை & பாதுகாப்பு
19. விரைவு குறிப்பு சரிபார் பட்டியல்
20. Offline காப்புப்பிரதி / mirror (முறையற்றது)

---

## 1. REA என்றால் என்ன (என்ன அல்ல)

**REA என்பது:**
- ஒரு local MCP சேவையகம் + agent திறன் — உங்கள் **coding agent**-க்கு உங்களிடமுள்ள மென்பொருளை ஆய்வு செய்ய உதவுகிறது.
- **ஆதாரங்களை** வழங்குகிறது: assembly, pseudocode, module maps, IPC channel pairings, பிடிக்கப்பட்ட network traffic, source locations — அசல் source code அல்ல.
- பகுப்பாய்வு **உங்கள் இயந்திரத்திலேயே** நடைபெறுகிறது. உங்கள் app REA மூலம் பதிவேற்றப்படாது; உங்கள் agent-இன் model provider முடிவுகளைக் காண்பார் (காண்க [தரவு & தனியுரிமை](#18-data-privacy--security)).

**REA அல்ல:**
- "Source code-க்கு மாற்றும்" மந்திரப் பொத்தான். முடிவுகள் assembly/pseudocode மற்றும் references; உங்கள் agent விளக்குகிறார், behavior-ஐ மீண்டும் உருவாக்க உதவுகிறார்.
- Licenses/DRM முறியடிக்கும் அல்லது paid activation தவிர்க்கும் கருவி. அப்படிப் பயன்படுத்த வேண்டாம்.
- Obfuscation தவிர்க்கும் கருவி. பலமாக packed/protected இலக்குகள் (VMProtect, Themida, anti-tamper) மிகவும் கடினம்.
- Server-side அணுகல். API-க்கு பின்னால் உள்ள server-ஐ ஆய்வு செய்ய முடியாது; client/network பக்கம் மட்டுமே தெரியும்.

---

## 2. சட்டப்பூர்வமான மற்றும் பொறுப்பான பயன்பாடு

உங்களுக்குச் **சொந்தமான** மென்பொருளை interoperability, பாதுகாப்பு ஆராய்ச்சி, debugging-க்காக reverse engineering செய்வது சட்டப்பூர்வமாக இருக்கலாம் — ஆனால் சட்டம் மற்றும் உரிமங்கள் நாட்டுக்கு ஏற்ப மாறுபடும்.

**நீங்கள் செய்ய வேண்டியது:**
- உங்களுக்குச் சொந்தமான, பயன்பாட்டு உரிமம் பெற்ற அல்லது ஆய்வு செய்ய அனுமதி பெற்ற மென்பொருளை ஆய்வு செய்யுங்கள்.
- உரிம ஒப்பந்தங்கள், சேவை விதிமுறைகள் மற்றும் DMCA anti-circumvention விதிகளை மதித்து நடக்கவும்.
- கண்டுபிடிப்புகளை interoperability, கல்வி மற்றும் தற்காப்பு பாதுகாப்புக்காகப் பயன்படுத்துங்கள்.

**நீங்கள் செய்யக்கூடாதது:**
- DRM, license activation அல்லது copy protection தவிர்க்கவும்.
- உரிம மென்பொருளின் cracked/leaked code விநியோகிக்கவும்.
- உங்களுக்கு உரிமையில்லாத இலக்குகளை ஆய்வு செய்யவும்.

இந்த வழிகாட்டி சட்ட ஆலோசனை அல்ல. சந்தேகம் இருந்தால் வழக்கறிஞரை அணுகவும்.

---

## 3. நீங்கள் என்னவெல்லாம் பகுப்பாய்வு செய்யலாம்

| Target | REA தருவது | Native engine தேவையா? |
|---|---|---|
| Native binaries / libraries (EXE, DLL, ELF, Mach-O) | Functions, assembly, pseudocode, callers, xrefs, constants | ஆம் — Hopper, Ghidra அல்லது IDA |
| JavaScript & Electron apps | Modules, imports, IPC channels + handlers, source locations | இல்லை |
| Browser pages (runtime) | Requests/responses, scripts, JSON body shapes, observation window | Chrome-family browser |
| .NET assemblies / Flutter / packages | Module & resource inspection | இல்லை |
| Android APK / devices / resources | Decompiled classes, resources, device interaction | JADX / adb / Apktool |
| Firmware | Extracted filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module & function inspection | WABT |
| SQLite databases | Schema & query inspection | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract structure | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy captures | Parsed traffic evidence | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol facts | TShark / capinfos (Linux) |

---

## 4. அமைப்புத் தேவைகள்

**குறைந்தபட்சம்:**
- Node.js **22.23.4+**, **24.22.1+**, அல்லது **26+ (>= 26.12.1)** (npm உடன் சேர்ந்தது)
- ஆதரிக்கப்படும் coding agent (படி 2)
- உங்கள் விசாரணைகளுக்கான working directory

**Native (binary) பகுப்பாய்வுக்கு** — இவற்றில் ஒன்று:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (இலவசம், Windows-இல் பரிந்துரை)
- **IDA** (வணிகம்; verified Windows legacy GUI + headless supervisor profiles)
- **Hopper** (வணிகம்; macOS & சில Linux — **Windows-இல் கிடைக்காது**)

**OS குறிப்புகள்:**
- Windows: **PowerShell** பயன்படுத்துங்கள்; இடைவெளி உள்ள path-களை quotes-இல் வைக்கவும். உங்கள் agent WSL-இல் இயங்கினால், Node.js + REA-வை WSL-யின் **உள்ளே** நிறுவி Linux paths பயன்படுத்துங்கள்.
- Linux: Ghidra/JADX/firmware launches மற்றும் static analysis-க்கு `PATH`-இல் `procps`-பொருத்தமான `ps` இருக்க வேண்டும்.
- macOS: Terminal பயன்படுத்துங்கள்; சில படிகளுக்கு Xcode Command Line Tools தேவை (arm64-இல் Ghidra decompiler build).

---

## 5. படி 1 — உங்கள் கணினியைத் தயார் செய்யுங்கள்

### 5.1 Node.js சரிபார்க்கவும்

```powershell
node -v
npm -v
```

எதிர்பார்க்கப்படுவது: `v22.23.4+`, `v24.22.1+`, அல்லது `v26.12.1+`. பழையது → Node.js 24 LTS நிறுவவும்.

### 5.2 Windows-இல் Node.js நிறுவவும் (இல்லை என்றால்)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Terms ஏற்க கேட்டால் `Y` கொடுக்கவும், PowerShell மூடி மீண்டும் திறக்கவும், `node -v` மீண்டும் சோதிக்கவும். (மாற்று: https://nodejs.org/-இல் இருந்து LTS installer பதிவிறக்கவும்.)

> **PowerShell விசேடம்:** `npx` «running scripts is disabled on this system» பிழையுடன் தோல்வியுற்றால், `npx.cmd` மற்றும் `npm.cmd` பயன்படுத்துங்கள்:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS-இன் `.pkg` பதிவிறக்கவும், அல்லது Homebrew மூலம்: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# shell மீண்டும் திறக்கவும், பிறகு:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 ஒரு working folder உருவாக்கவும்

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. படி 2 — coding agent-ஐத் தேர்ந்தெடுக்கவும்

REA எந்த agent-ஐயும் ஆதரிக்கிறது — உள்ளூர் **MCP** பேசும் அனைத்தும். ஒன்றைத் தேர்ந்தெடுக்கவும் — அனைத்து உதாரணங்களும் client-இன் **setup ID** (`--client <id>`) பயன்படுத்துகின்றன.

| Client | Setup ID | Install / குறிப்பு |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | App நிறுவி sign in செய்யவும், பிறகு `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` அல்லது install script · ChatGPT sign in |
| Cursor | `cursor` | Editor நிறுவி working folder திறக்கவும், Agent mode |
| Windsurf | `windsurf` | அதே pattern; agent chat |
| VS Code | `vscode` | முதலில் GitHub Copilot set up செய்யவும், பிறகு Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` இயக்கி `/connect` மூலம் model சேர்க்கவும், பிறகு `--client opencode` |
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

**Grok Bot:** bot-இன் chat-இல், அதன் hosted computer-இல் `rea` என்ற custom MCP server சேர்க்கச் சொல்லுங்கள்:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. படி 3 — REA-ஐ இணைக்கவும்

### Option A — உங்கள் agent-ஐ செய்ய விடவும் (பரிந்துரை)

உங்கள் agent-இன் chat-இல் ஒட்டவும்:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent setup-ஐ இயக்கி, plan காட்டி, உங்கள் அனுமதிக்குப் பிறகு apply செய்யும்.

### Option B — நீங்களே setup இயக்கவும்

```powershell
npx rea-agents@latest setup
```

குறிப்பிட்ட client-க்கு:

```powershell
npx rea-agents@latest setup --client opencode
```

setup-இன் போது:
- நகர **arrow keys**, தேர்ந்தெடுக்க **Space**, தொடர **Enter**.
- REA **MCP connection** + **investigation skill** சேர்த்து, மாற்றங்களுக்கு முன் தற்போதைய config-க்கு **backup** எடுக்கிறது.
- மாற்றங்கள் உங்கள் அனுமதிக்குப் பிறகே apply ஆகும்.
- முதல் பயிற்சியில் optional Hopper installation-ஐ தவிர்க்கலாம்.

### setup-க்குப் பிறகு client-ஐ restart செய்யவும்

- Desktop apps (Claude Desktop, Cursor, Windsurf, VS Code): **முழுமையாக** quit செய்து மீண்டும் திறக்கவும் (Windows: tray icon-இலிருந்தும் quit).
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): session exit செய்து மீண்டும் தொடங்கவும்.

---

## 8. படி 4 — நிறுவலைச் சரிபார்க்கவும்

உங்கள் client-இன் doctor சரிபார்ப்பை இயக்கவும் (`<client_id>` மாற்றவும்):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Healthy report-இல் `"healthy": true` காண்பிக்கும். பிறகு agent-ஐ கேளுங்கள்:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. படி 5 — உங்கள் முதல் விசாரணை (Notes உதாரணம்)

அதிகாரப்பூர்வ உதாரணம் ஒரு சிறிய Electron app — **Export notes** button உள்ளது. Electron-ஐ install செய்யத் தேவையில்லை — agent code-ஐப் படிக்கிறது.

உங்கள் agent-இல் ஒட்டவும்:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

எதிர்பார்க்கப்படும் முடிவு: Export கிளிக் செய்யும்போது `notes:export` IPC message செல்கிறது; main process notes-ஐ CSV-ஆக வடிவமைத்து `notes.csv`-ஐ (columns: `id`, `title`) உங்கள் Downloads folder-இல் எழுதுகிறது.

டெர்மினலில் இருந்து manual analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native பகுப்பாய்வு (binaries / EXE / DLL)

ஆழமான native analysis-க்கு provider தேவை. **Windows**-இல் **Ghidra** அல்லது **IDA** பயன்படுத்துங்கள் (Hopper Windows-இல் இல்லை).

### 10.1 Ghidra (இலவசம்) — Windows setup

1. **64-bit JDK 21 அல்லது அதற்கு மேல்** நிறுவவும் (compiler உடன்). சரிபார்க்கவும்:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Release-இல் உள்ள *Assets* பட்டியலிலிருந்து **Ghidra 12.1.4** பதிவிறக்கி `ghidra_…_PUBLIC_….zip`-ஐ extract செய்யவும் (release-இன் archive, **"Source code" அல்ல**).
3. `ghidraRun.bat` உடைய extracted folder-ஐ குறிக்கவும் — அதுவே உங்கள் `GHIDRA_INSTALL_DIR`.
4. PowerShell-இல்:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home காட்டும் folder
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Path-களை உங்கள் installation অনুযায়ী மாற்றவும். setup-இன் updated plan-ஐப் பரிசீலித்து approve செய்து **agent-ஐ restart செய்யவும்**.

> Windows-இல் Ghidra support **experimental, read-only** — நிலையான உள்ளூர் **NTFS** drives-இல் x86/x64 PE apps மற்றும் DLLs-க்கு மட்டும்.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 மற்றும் Linux arm64-இல் முதலில் Ghidra-இன் native decompiler build செய்யவும் (macOS-க்கு Xcode Command Line Tools, make, bison தேவை).

### 10.3 IDA

1. IDA provider guide-இன் படி upstream IDA MCP server install & configure செய்யவும்.
2. செயல்படும் registration-ஐ `ida-mcp.json` என சேமிக்கவும். உதாரணம் (`idb_open`/`idb_list`/`idb_close` கொண்ட headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   இணைக்கப்பட்ட legacy 1.4.0 GUI server-க்கு, அதன் செயல்படும் command/args/env-ஐ நகலெடுக்கவும் (முதலில் IDA-இல் binary திறந்து plugin-ஐ தொடங்கவும்).
3. Connect:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux-இல் `$env:`-க்குப் பதிலாக `export` பயன்படுத்துங்கள். setup-க்குப் பிறகு agent-ஐ restart செய்யவும்.

> Verified IDA profiles: Windows legacy GUI மற்றும் headless supervisor, மேலும் macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0-இல் macOS headless profile / native GUI bridge இல்லை — அவற்றுக்கு REA source build தேவை.

### 10.4 Hopper (macOS / Linux மட்டும்)

setup இருக்கும் Hopper-ஐக் கண்டறிந்து அல்லது installation plan முன்மொழியலாம். macOS-இல் முதல் திறப்பில் demo mode தேர்ந்தெடுக்கவும் அல்லது license activate செய்யவும். Linux-இல் automated setup-க்கு x86_64 host மற்றும் Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS அல்லது Omarchy தேவை. Linux arm64-இல் Ghidra பயன்படுத்தவும்.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 provider பயன்படுத்துவது

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI-இல் one-off function analysis (Ghidra configured இருக்க வேண்டும்):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron apps

Native engine தேவையில்லை. உங்கள் agent-ஐ app-இன் **folder** அல்லது **.asar** நோக்கிச் சுட்டவும்:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron apps-இல் `app.asar` எங்கே:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: பெரும்பாலும் `/opt/<App>/resources/app.asar`

Terminal-இல் இருந்து static analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

`normalized_result.summary.ipc`-இல் பொருந்திய channels/handlers மற்றும் `normalized_result.graph`-இல் source locations பார்க்கவும். Computed channel names unresolved ஆக இருக்கலாம் — அப்போது browser observation பயன்படுத்தவும் (அடுத்த பகுதி).

---

## 12. Browser கவனிப்பு

1. Chrome-family browser-இல் remote debugging உடன் target page-ஐத் திறக்கவும், உதா:

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

2. உங்கள் agent-ஐக் கேளுங்கள்:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   அதற்கு endpoint `http://127.0.0.1:9222` மற்றும் page URL கொடுங்கள். கிளிக் செய்வதற்கு **முன்** capture தொடங்குங்கள்.

   அல்லது terminal-இல்:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP bodies-க்கு, Fiddler Everywhere-இன் exports (SAZ/HAR 1.2) REA capture Evidence ஆகப் பயன்படும், அல்லது Everywhere-இன் MCP server-ஐ connect செய்யவும்.

---

## 13. பிற இலக்குகள் மற்றும் தேவையான கருவிகள்

| Target | தயார் செய்ய வேண்டியவை | குறிப்பு |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Engine தேவையில்லை |
| Website | Chrome / Chromium / Edge | Remote debugging port |
| .NET / Flutter / packages | Node.js + npm | Static inspection |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android device | adb | USB debugging இயக்கவும் |
| Android resources | Apktool + Java | resources & manifest unpack செய்கிறது |
| JEB project | JEB + MCP | Commercial decompiler |
| Firmware | Binwalk / Unblob | **Linux மட்டும்** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite database | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Linux x64 மட்டும்** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Captures-இன் offline parsing |
| PCAP / PCAPNG | TShark / capinfos | **Linux மட்டும்** |
| Logic signals | sigrok-cli | **Linux மட்டும்** |
| Process behavior | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM மற்றும் முழு investigation guides: https://rea.tools/guides.

---

## 14. RL சூழல்கள் உருவாக்கவும்

REA ஒரு test web app session-ஐ record செய்து **AgentEnv** சூழலாக export செய்ய முடியும் — agents-ஐ train/evaluate செய்ய.

1. agent data create/edit/delete செய்யக்கூடிய **test** app instance தயார் செய்யவும்.
2. உங்கள் agent-ஐக் கேளுங்கள் (folders உதாரணம்):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Password-ஐ MCP server environment-இல் (`APP_PASSWORD`) வைத்துக் கொள்ளுங்கள், prompt-இல் அல்ல.
3. அல்லது நேரடியாக HAR recording-இலிருந்து build:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` எந்த file-யும் எழுதாமல் report review செய்கிறது.
4. Run:
   ```bash
   agent-env run ./my-env
   ```
   REA-இன் compatibility check **AgentEnv 0.9.1334 + Python 3.12** பயன்படுத்துகிறது; Docker இயங்க வேண்டும்.
5. **effects** record செய்யப்பட்ட operations மட்டுமே support செய்யப்படும் (எ.கா. delete-க்கு missing-item response மற்றும் updated list record ஆகியிருக்க வேண்டும்). Share செய்வதற்கு முன் retained response bodies சரிபார்க்கவும் — credentials இருக்கலாம்.

---

## 15. டெர்மினலில் REA பயன்படுத்தவும் (CLI)

Global install இன்றி:

```powershell
npx -y rea-agents@latest --help
```

`rea` command-ஐ நிரந்தரமாக install:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux-க்கான curl installer (முதலில் Node.js தேவை):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

பொது commands:

| Command | நோக்கம் |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modules, imports, IPC, boundaries map |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | ஒரு native function பகுப்பாய்வு |
| `rea-agents list-browser-targets <endpoint> --json` | Debug-able browser pages பட்டியல் |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Page network/scripts கவனிக்க |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL environment build |
| `rea-agents environment-compare … --json` | Environment vs live app compare |
| `rea-agents doctor --client <id> --json` | Client connection check |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Native provider check |
| `rea-agents update` | CLI update |
| `rea-agents uninstall` | REA client config + skill remove |

---

## 16. REA-ஐ புதுப்பிக்கவும் அல்லது நீக்கவும்

**Update:**
```powershell
rea update                       # global CLI install ஆகியிருந்தால்
npx rea-agents@latest setup      # agent connection + skill refresh; plan approve செய்து restart
```

**Remove:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. பிழை திருத்தம்

**Agent REA tools-ஐ பார்க்கவில்லை**
1. Client-ஐ முழுமையாக restart/reconnect செய்யவும் (tray icon உட்பட).
2. `npx -y rea-agents@latest doctor --client <id> --json` — registration missing/stale ஆக இருந்தால்: `npx rea-agents@latest setup --client <id>`, restart செய்யவும்.
3. இன்னும் வரவில்லை என்றால்: client-இன் MCP connection error பார்க்கவும்; editor clients-இல் MCP settings-இல் REA-ஐ enable செய்து அதன் tools-ஐ allow செய்யவும்.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
`npx.cmd` / `npm.cmd` பயன்படுத்துங்கள், அல்லது `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**இடைவெளி உள்ள paths**
Quotes-இல்: `"D:/my apps/tool.exe"`. WSL-இல் Linux paths மற்றும் WSL-க்குள் REA install.

**Windows Ghidra வரம்புகள்**
Experimental, read-only, x86/x64 PE மட்டும், நிலையான உள்ளூர் NTFS drives. Linux மாற்று: Ghidra/Hopper. Native x64 Linux ELF crash analysis: pwntools.

**macOS Automation permission கேட்கிறது (Hopper)**
System Settings → Privacy & Security → Automation → REA-ஐ தொடங்கும் app-ஐ allow செய்து, மீண்டும் முயற்சிக்கவும்.

**Hopper first-run**
கண்காணிப்பற்ற பகுப்பாய்வுக்கு முன் demo mode vs license activation தேர்வை முடிக்கவும்.

**Linux-இல் `ps` இல்லை**
`procps` நிறுவவும் (Debian/Ubuntu: `sudo apt install procps`); REA-க்கு process ownership checks-க்கு இது தேவை.

**ஒரு bug கிடைத்ததா?**
REA update, restart, retry. பிறகு issue திறக்கவும்: REA version, OS, target type, repro steps, error output, provider பெயர். https://github.com/morluto/rea/issues.

---

## 18. தரவு, தனியுரிமை & பாதுகாப்பு

- REA இலக்குகளை **உங்கள் இயந்திரத்திலேயே** பகுப்பாய்வு செய்கிறது; உங்கள் app REA மூலம் **பதிவேற்றப்படாது**.
- **நீங்கள் பயன்படுத்தும் agent-இன் model provider** முடிவுகளைப் பெறுகிறது — அதன் data/retention policy பொருந்தும். Prompt-இல் secrets அல்லது customer data ஒட்ட வேண்டாம்.
- MCP input schemas default-ஆக compact; முழு field guidance-க்கு MCP registration-இல் `REA_MCP_INPUT_SCHEMA_PROFILE=full` அமைக்கவும். Output schemas `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (அல்லது `off`) மூலம் கட்டுப்படுத்தலாம்.
- RL environment recordings bodies/headers-இல் credentials வைத்திருக்கலாம் — share செய்வதற்கு முன் சரிபார்க்கவும். Credential-name warnings இடங்களை குறிக்கின்றன; மதிப்புகளை **அவை நீக்காது**.
- `APP_PASSWORD` போன்ற secrets-ஐ MCP server environment-இல் வைக்கவும், chat-இல் அல்ல.
- REA-ஐ `morluto/rea`, `rea.tools`, அல்லது npm `rea-agents`-இலிருந்து மட்டுமே install செய்யவும்.

---

## 19. விரைவு குறிப்பு சரிபார் பட்டியல்

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent install ஆகியிருக்கிறதா (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (plan review & approve)
[ ] Client முழுமையாக restart
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] முதல் விசாரணை: notes-example.zip  →  notes:export / notes.csv கண்டுபிடிக்கவும்
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup மீண்டும் இயக்கி agent restart
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] சட்டப்படி: நீங்கள் target-இன் உரிமையாளர் / analyze செய்ய உரிமம் உள்ளது
```

---

## 20. Offline காப்புப்பிரதி / mirror (முறையற்றது)

> ⚠️ **முதலில் இதனைப் படியுங்கள்.**
> ஒரு அதிகாரப்பூர்வ திட்டத்திற்கு «அதிகாரப்பூர்வ காப்புப்பிரதி» என்ற ஒன்று இல்லை. ஒரே அதிகாரப்பூர்வ REA என்பது **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, மற்றும் **`rea-agents`** npm package.
> இந்த repo அதிகாரப்பூர்வ திட்டத்தின் முழுமையான, உரிமத்துடன் பொருந்திய **முறையற்ற mirror / பதிவு** வழங்குகிறது, அசல் MIT உரிமம் மற்றும் copyright குறிப்புகளுடன். இது இதற்காக உள்ளது: **அதிகாரப்பூர்வ repo, website அல்லது npm package மறைந்துவிட்டால்**, நீங்கள் REA-ஐ இங்கே பெறலாம் — அவ்வளவுதான்.
> அதிகாரப்பூர்வ மூலங்கள் இருக்கும் வரை **அவற்றையே பயன்படுத்துங்கள்**. இந்த காப்புப்பிரதியை «அதிகாரப்பூர்வம்» என்று கூறாதீர்கள், «அதிகாரப்பூர்வ REA» என்றும் விநியோகிக்காதீர்கள். இந்த repo REA-இன் ஆசிரியர்களுடன் தொடர்புடையதல்ல, அவர்களால் அங்கீகரிக்கப்பட்டதும் அல்ல.

**உரிமம்:** REA MIT உரிமம் — குறிப்புடன் நகல், மாற்றம், விநியோகம் அனுமதி. முழு உரிமம், copyright headers மற்றும் மூன்றாம் தரப்பு குறிப்புகள் mirror branch மற்றும் npm tarball இரண்டிலும் உள்ளன. எந்த உத்தரவாதமும் இல்லை.

### காப்புப்பிரதியில் என்ன இருக்கிறது

| பகுதி | எங்கே | என்ன |
|---|---|---|
| Source mirror | Branch **`mirror/rea`** | அதிகாரப்பூர்வ `morluto/rea` `main`-இன் முழு git வரலாறு (கடைசி sync-இல் — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | அனைத்து அதிகாரப்பூர்வ release tags, exact அதிகாரப்பூர்வ commits-ஐ காட்டுகின்றன (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | அதிகாரப்பூர்வ npm package, முன்கூட்டியே build செய்யப்பட்டது (`dist/` உடன்) — **முழுமையாக offline** install |
| Sync script | **`scripts/sync-backup.ps1`** | mirror branch, tags மற்றும் சமீபத்திய npm tarball-ஐ அதிகாரப்பூர்வ மூலங்களிலிருந்து புதுப்பிக்கிறது |
| Restore script | **`scripts/restore-backup.ps1`** | tarball-இன் one-shot offline install + அடுத்த steps print |
| Guide | `README.md` (ஆங்கில master) | முழுமையான அமைப்பு வழிகாட்டி; REA எங்கிருந்து வந்தாலும் பொருந்தும் |

### காப்புப்பிரதியைப் புதிதாக வைத்திருங்கள்

வாரந்தோறும் இயக்கவும் (அல்லது அதனை நம்புவதற்கு முன்):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

இது `upstream/main` + அனைத்து tags-ஐ fetch செய்கிறது, `mirror/rea`-ஐ force-update செய்கிறது, tags push செய்கிறது, சமீபத்திய `rea-agents-*.*.*`-ஐ `npm pack` செய்து `backup/`-இல் போடுகிறது, tarball-இன் இறுதி `git add`/`commit`/`push` commands-ஐ print செய்கிறது.

### Restore சூழல்கள்

**சூழல் A — GitHub down, npm வேலை செய்கிறது:** restore தேவையில்லை. `npx rea-agents@latest setup` தொடர்ந்து பயன்படுத்துங்கள்.

**சூழல் B — GitHub + npm இரண்டும் down:** இந்த repo-இலிருந்து prebuilt tarball-ஐ install செய்யுங்கள் (network இல்லை, build tools இல்லை):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# அல்லது கைமுறையாக:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` உங்கள் agent-இல் MCP server + skill-ஐ அதிகாரப்பூர்வ `npx rea-agents setup` போலவே பதிவு செய்கிறது — முழுமையாக offline, registry-ஐ தொடாது.

**சூழல் C — முழு source/history-யும் வேண்டும்:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# கடைசி sync நேரத்தின் முழு அதிகாரப்பூர்வ source.
```

Source-இலிருந்து build செய்ய Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ மற்றும் npm registry-க்கான network access தேவை (turbo monorepo; `npm ci && npm run build`). tarball path (சூழல் B) எதுவும் தேவையில்லை — restore-க்கு எப்போதுமே அதையே தேர்ந்தெடுக்கவும்.

### restore செய்ததை verify செய்யவும்
```powershell
# Source mirror integrity — commit கடைசியில் synced upstream/main-உடன் பொருந்த வேண்டும்:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # mirror branch clone செய்த பிறகு
# tarball integrity — CLI தானே report செய்யும் version:
rea --version
```

hash-கள் backup நேரப் பதிவுகளிலிருந்து மாறுபட்டால், அந்த copy-ஐ சந்தேகத்துடன் கையாண்டு, அதிகாரப்பூர்வ மூலங்களிலிருந்து (அவை திரும்பி வந்தால்) மீண்டும் sync செய்து பிறகே நம்புங்கள்.

### இந்த காப்புப்பிரதி எதில் உத்தரவாதம் அளிக்காது

- கடைசி sync-க்குப் பிறகு security patches இல்லை — கைவிடப்பட்ட காப்புப்பிரதி ஒரு காலாவதியான snapshot.
- அதிகாரப்பூர்வ npm package-இல் `mirror/rea` அல்லது tarball-ஐ விட புதிய hotfixes இருக்கலாம்.
- துணைச் சேவைகள் (rea.tools website, Discord, release notes, docs site) reference material, இங்கிருந்து restore செய்யக்கூடிய code அல்ல.
- REA பின்னாளில் வேறு பெயரில்/உரிமையாளரில் re-release ஆகினால், இந்த snapshot archived upstream ஆகவே இயங்கும் — கவனத்துடன் migrate செய்யவும், compatibility assumed ஆக எடுக்காதீர்கள்.

---

**இணைப்புகள்**
- Website: https://rea.tools/ · தொடக்கம்: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (rea.tools footer பார்க்கவும்) · X: https://x.com/reatools
- **இந்த repo-வின் காப்புப்பிரதி:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
