# Reverse Engineering Agent — पूर्ण सेटअप गाइडलाइन

> **भाषाएँ:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ यह अनुवाद अंग्रेज़ी मास्टर से मेल खाता है। अंतर आने पर **अंग्रेज़ी मान्य होगी**। Code blocks, paths और commands कभी अनुवादित नहीं होते।

> **REA — Reverse Engineer Anything**
> एक MCP (Model Context Protocol) server + investigation skill: आपके coding agent को software inspect करने के tools देता है — native binaries, JavaScript/Electron apps, browsers, .NET, Android, firmware और भी बहुत कुछ।

- **Official website:** https://rea.tools/
- **Official source code:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **License:** MIT (REA खुद)। Third-party analysis tools के अपने licenses हैं।
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (अंग्रेज़ी में) — platform के हिसाब से step-by-step setup (पहले Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) troubleshooting सहित
- **📦 Offline backup शामिल है** — official repo का unofficial mirror + npm tarball; सिर्फ़ जब official sources गायब हो जाएं। देखें **[Section 20 — Offline Backup / Mirror (Unofficial)](#20-offline-backup--mirror-unofficial)**।

> ⚠️ **ज़रूरी:** REA सिर्फ़ `morluto/rea`, `rea.tools`, या `rea-agents` npm package से download करें। मिलता-जुलता repo नाम official release साबित नहीं करता।

---

## विषय सूची

1. REA क्या है (और क्या नहीं है)
2. कानूनी और ज़िम्मेदारी भरा उपयोग
3. आप क्या analyze कर सकते हैं
4. System requirements
5. चरण 1 — अपना कंप्यूटर तैयार करें
6. चरण 2 — Coding agent चुनें
7. चरण 3 — REA connect करें
8. चरण 4 — Installation verify करें
9. चरण 5 — आपकी पहली investigation (Notes example)
10. Native analysis (binaries / EXE / DLL)
11. JavaScript & Electron apps
12. Browser observation
13. अन्य targets और ज़रूरी tools
14. RL environments बनाएं
15. Terminal से REA इस्तेमाल करें (CLI)
16. REA update या remove करें
17. Troubleshooting
18. Data, privacy और security
19. Quick reference checklist
20. Offline Backup / Mirror (Unofficial)

---

## 1. REA क्या है (और क्या नहीं है)

**REA है:**
- एक local MCP server + agent skill — आपके **coding agent** को आपके local software inspect करने देता है।
- **Evidence** लौटाता है: assembly, pseudocode, module maps, IPC channel pairings, captured network traffic, source locations — original source code नहीं।
- Analysis **आपकी machine पर** चलती है। आपकी app REA के ज़रिये upload नहीं होती; आपके agent का model provider नतीजे देखता है (देखें [Data & Privacy](#18-data-privacy--security))।

**REA नहीं है:**
- "Source code में वापस बदलने" वाला magic button। नतीजे assembly/pseudocode और references हैं; आपका agent समझाता है और behavior rebuild करने में मदद करता है।
- License/DRM तोड़ने या paid activation bypass करने का tool। इसके लिए इस्तेमाल न करें।
- Obfuscation bypass। मज़बूत packed/protected targets (VMProtect, Themida, anti-tamper) बहुत कठिन हैं।
- Server-side access। API के पीछे के server को inspect नहीं किया जा सकता; सिर्फ़ client/network side दिखती है।

---

## 2. कानूनी और ज़िम्मेदारी भरा उपयोग

अपनी **मालिकी** के software को analyze करना, interoperability, security research, debugging — इनके लिए reverse engineering कानूनी हो सकती है — लेकिन कानून और licenses देश के हिसाब से बदलते हैं।

**आपको करना चाहिए:**
- अपने, licensed, या inspect करने की अनुमति वाले software analyze करना।
- License agreements, Terms of Service, और DMCA anti-circumvention नियमों का सम्मान करना।
- findings को interoperability, शिक्षा और defensive security के लिए इस्तेमाल करना।

**आपको नहीं करना चाहिए:**
- DRM, license activation या copy protection bypass करना।
- Proprietary software का cracked/leaked code बांटना।
- ऐसे targets analyze करना जिन पर आपका अधिकार नहीं है।

यह गाइड कानूनी सलाह नहीं है। शक हो तो lawyer से पूछें।

---

## 3. आप क्या analyze कर सकते हैं

| Target | REA क्या लौटाता है | Native engine चाहिए? |
|---|---|---|
| Native binaries / libraries (EXE, DLL, ELF, Mach-O) | Functions, assembly, pseudocode, callers, xrefs, constants | हाँ — Hopper, Ghidra या IDA |
| JavaScript & Electron apps | Modules, imports, IPC channels + handlers, source locations | नहीं |
| Browser pages (runtime) | Requests/responses, scripts, JSON body shapes, observation window | Chrome-family browser |
| .NET assemblies / Flutter / packages | Module व resource inspection | नहीं |
| Android APK / devices / resources | Decompiled classes, resources, device interaction | JADX / adb / Apktool |
| Firmware | Extracted filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module व function inspection | WABT |
| SQLite databases | Schema व query inspection | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract structure | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy captures | Parsed traffic evidence | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol facts | TShark / capinfos (Linux) |

---

## 4. System requirements

**न्यूनतम:**
- Node.js **22.23.4+**, **24.22.1+**, या **26+ (>= 26.12.1)** (npm सहित)
- एक supported coding agent (चरण 2)
- आपकी investigations के लिए working directory

**Native (binary) analysis के लिए** — इनमें से एक:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (फ्री, Windows पर recommended)
- **IDA** (commercial; verified Windows legacy GUI + headless supervisor profiles)
- **Hopper** (commercial; macOS व कुछ Linux — **Windows पर उपलब्ध नहीं**)

**OS नोट्स:**
- Windows: **PowerShell** इस्तेमाल करें; spaces वाले paths quotes में रखें। अगर आपका agent WSL में चलता है, तो Node.js + REA WSL के **अंदर** install करके Linux paths इस्तेमाल करें।
- Linux: Ghidra/JADX/firmware launches और static analysis के लिए `procps`-compatible `ps` `PATH` में होना चाहिए।
- macOS: Terminal इस्तेमाल करें; कुछ चरणों को Xcode Command Line Tools चाहिए (arm64 पर Ghidra decompiler build)।

---

## 5. चरण 1 — अपना कंप्यूटर तैयार करें

### 5.1 Node.js जांचें

```powershell
node -v
npm -v
```

अपेक्षित: `v22.23.4+`, `v24.22.1+`, या `v26.12.1+`। पुराना हो तो → Node.js 24 LTS install करें।

### 5.2 Windows पर Node.js install करें (न हो तो)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Terms accept करने को कहे तो `Y` दबाएं, PowerShell बंद करके फिर खोलें, `node -v` दोबारा देखें। (वैकल्पिक: https://nodejs.org/ से LTS installer download करें।)

> **PowerShell की खास बात:** अगर `npx` «running scripts is disabled on this system» के साथ fail हो, तो `npx.cmd` और `npm.cmd` इस्तेमाल करें:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS का `.pkg` download करें, या Homebrew से: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# shell दोबारा खोलें, फिर:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 एक working folder बनाएं

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. चरण 2 — Coding agent चुनें

REA हर उस agent को support करता है जो local **MCP** बोलता है। एक चुनें — सभी उदाहरण client का **setup ID** इस्तेमाल करते हैं (`--client <id>`)।

| Client | Setup ID | Install / नोट |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | App install करके sign in करें, फिर `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` या install script · ChatGPT से sign in |
| Cursor | `cursor` | Editor install करें, working folder खोलें, Agent mode |
| Windsurf | `windsurf` | वही pattern; agent chat |
| VS Code | `vscode` | पहले GitHub Copilot set up करें, फिर Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` चलाएं, `/connect` से model जोड़ें, फिर `--client opencode` |
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

**Grok Bot:** bot के chat में उससे कहें कि इसके hosted computer पर `rea` नाम का custom MCP server जोड़े:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. चरण 3 — REA connect करें

### Option A — अपने agent से करवाएं (recommended)

अपने agent के chat में paste करें:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent setup run करता है, plan दिखाता है और आपकी approval के बाद apply करता है।

### Option B — खुद setup चलाएं

```powershell
npx rea-agents@latest setup
```

किसी specific client के लिए:

```powershell
npx rea-agents@latest setup --client opencode
```

setup के दौरान:
- चलने के लिए **arrow keys**, चुनने के लिए **Space**, आगे बढ़ने के लिए **Enter**।
- REA **MCP connection** + **investigation skill** जोड़ता है, और बदलाव से पहले current config का **backup** लेता है।
- बदलाव सिर्फ़ आपकी approval के बाद apply होते हैं।
- पहले exercise में optional Hopper installation skip किया जा सकता है।

### setup के बाद client restart करें

- Desktop apps (Claude Desktop, Cursor, Windsurf, VS Code): **पूरी तरह** quit करके फिर खोलें (Windows: tray icon से भी quit करें)।
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): session exit करके फिर शुरू करें।

---

## 8. चरण 4 — Installation verify करें

अपने client का doctor check चलाएं (`<client_id>` बदलें):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Healthy report में `"healthy": true` दिखेगा। फिर अपने agent से पूछें:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. चरण 5 — आपकी पहली investigation (Notes example)

Official example एक छोटा Electron app है जिसमें **Export notes** button है। Electron install करने की ज़रूरत नहीं — agent code पढ़ता है।

अपने agent में paste करें:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

अपेक्षित परिणाम: Export क्लिक करने पर `notes:export` IPC message जाता है; main process notes को CSV में format करके `notes.csv` (columns: `id`, `title`) आपके Downloads folder में लिखता है।

Terminal से manual analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native analysis (binaries / EXE / DLL)

गहरे native analysis के लिए provider चाहिए। **Windows** पर **Ghidra** या **IDA** इस्तेमाल करें (Hopper Windows पर नहीं है)।

### 10.1 Ghidra (फ्री) — Windows setup

1. **64-bit JDK 21 या नया** install करें (compiler सहित)। जांचें:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Release की *Assets* list से **Ghidra 12.1.4** download करके `ghidra_…_PUBLIC_….zip` extract करें (release archive, **"Source code" नहीं**)।
3. `ghidraRun.bat` वाला extracted folder नोट करें — यही आपका `GHIDRA_INSTALL_DIR` है।
4. PowerShell में:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home वाला folder
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Path अपने installation के हिसाब से बदलें। setup का updated plan देखकर approve करें और **agent restart करें**।

> Windows पर Ghidra support **experimental, read-only** है — सिर्फ़ local fixed **NTFS** drives पर x86/x64 PE apps और DLLs के लिए।

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 और Linux arm64 पर पहले Ghidra का native decompiler build करें (macOS को Xcode Command Line Tools, make, bison चाहिए)।

### 10.3 IDA

1. IDA provider guide के मुताबिक upstream IDA MCP server install और configure करें।
2. काम कर रहा registration `ida-mcp.json` नाम से save करें। उदाहरण (`idb_open`/`idb_list`/`idb_close` वाला headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Attached legacy 1.4.0 GUI server के लिए, इसका काम कर रहे command/args/env कॉपी करें (पहले IDA में binary खोलकर plugin शुरू करें)।
3. Connect करें:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux पर `$env:` की जगह `export` इस्तेमाल करें। setup के बाद agent restart करें।

> Verified IDA profiles: Windows legacy GUI और headless supervisor, साथ में macOS arm64 headless supervisor (IDA Professional 9.1)। npm 6.4.0 में macOS headless profile / native GUI bridge नहीं — उन्हें REA source build चाहिए।

### 10.4 Hopper (सिर्फ़ macOS / Linux)

Setup existing Hopper detect कर सकता है या installation plan propose कर सकता है। macOS पर पहली बार खोलने पर demo mode चुनें या license activate करें। Linux पर automated setup के लिए x86_64 host और Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS या Omarchy चाहिए। Linux arm64 पर Ghidra इस्तेमाल करें।

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Provider इस्तेमाल करना

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI से one-off function analysis (Ghidra configured होना चाहिए):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron apps

Native engine की ज़रूरत नहीं। अपने agent को app के **folder** या **.asar** की ओर point करें:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron apps में `app.asar` कहाँ होता है:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: अक्सर `/opt/<App>/resources/app.asar`

Terminal से static analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

`normalized_result.summary.ipc` में matched channels/handlers और `normalized_result.graph` में source locations देखें। Computed channel names unresolved रह सकते हैं — तब browser observation इस्तेमाल करें (अगला section)।

---

## 12. Browser observation

1. Chrome-family browser में remote debugging के साथ target page खोलें, जैसे:

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

2. अपने agent से पूछें:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   इसे endpoint `http://127.0.0.1:9222` और page URL दें। क्लिक करने से **पहले** capture शुरू करें।

   या terminal से:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP bodies के लिए, Fiddler Everywhere के exports (SAZ/HAR 1.2) REA capture Evidence के रूप में इस्तेमाल किए जा सकते हैं, या Everywhere का MCP server connect करें।

---

## 13. अन्य targets और ज़रूरी tools

| Target | तैयार करने वाले tools | नोट |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Engine नहीं चाहिए |
| Website | Chrome / Chromium / Edge | Remote debugging port |
| .NET / Flutter / packages | Node.js + npm | Static inspection |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android device | adb | USB debugging enable करें |
| Android resources | Apktool + Java | resources और manifest unpack करता है |
| JEB project | JEB + MCP | Commercial decompiler |
| Firmware | Binwalk / Unblob | **सिर्फ़ Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite database | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **सिर्फ़ Linux x64** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Captures का offline parsing |
| PCAP / PCAPNG | TShark / capinfos | **सिर्फ़ Linux** |
| Logic signals | sigrok-cli | **सिर्फ़ Linux** |
| Process behavior | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM और पूरी investigation guides: https://rea.tools/guides.

---

## 14. RL environments बनाएं

REA एक test web app session record करके **AgentEnv** environment export कर सकता है, agents की training/evaluation के लिए।

1. एक **test** app instance तैयार करें जहां agent data create/edit/delete कर सके।
2. अपने agent से पूछें (folders का उदाहरण):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Password MCP server environment (`APP_PASSWORD`) में रखें, prompt में नहीं।
3. या सीधे HAR recording से build करें:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` बिना files लिखे report review करता है।
4. Run करें:
   ```bash
   agent-env run ./my-env
   ```
   REA की compatibility check **AgentEnv 0.9.1334 + Python 3.12** इस्तेमाल करती है; Docker चलता होना चाहिए।
5. सिर्फ उन operations की **effects** record हुई हैं वही supported हैं (जैसे delete के लिए missing-item response और updated list record होनी चाहिए)। Share करने से पहले retained response bodies review करें — credentials रह सकते हैं।

---

## 15. Terminal से REA इस्तेमाल करें (CLI)

Global install के बिना:

```powershell
npx -y rea-agents@latest --help
```

`rea` command स्थायी रूप से install करें:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux के लिए curl installer (पहले Node.js चाहिए):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

आम commands:

| Command | काम |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modules, imports, IPC, boundaries map करें |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | एक native function analyze करें |
| `rea-agents list-browser-targets <endpoint> --json` | Debug-able browser pages list करें |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Page network/scripts observe करें |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL environment build करें |
| `rea-agents environment-compare … --json` | Environment vs live app compare करें |
| `rea-agents doctor --client <id> --json` | Client connection check करें |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Native provider check करें |
| `rea-agents update` | CLI update करें |
| `rea-agents uninstall` | REA client config + skill remove करें |

---

## 16. REA update या remove करें

**Update:**
```powershell
rea update                       # अगर global CLI install है
npx rea-agents@latest setup      # agent connection + skill refresh करें; plan approve करके restart करें
```

**Remove:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Troubleshooting

**Agent REA tools नहीं देख पा रहा**
1. Client पूरी तरह restart/reconnect करें (tray icon सहित)।
2. `npx -y rea-agents@latest doctor --client <id> --json` — registration missing/stale हो तो: `npx rea-agents@latest setup --client <id>`, restart करें।
3. फिर भी न दिखे: client का MCP connection error देखें; editor clients में MCP settings में REA enable करके इसके tools allow करें।

**`npx` — «running scripts is disabled» (Windows PowerShell)**
`npx.cmd` / `npm.cmd` इस्तेमाल करें, या `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`।

**Spaces वाले paths**
Quotes में रखें: `"D:/my apps/tool.exe"`। WSL में Linux paths इस्तेमाल करें और REA WSL के अंदर install करें।

**Windows Ghidra limits**
Experimental, read-only, सिर्फ़ x86/x64 PE, fixed local NTFS drives। Linux alternative: Ghidra/Hopper। Native x64 Linux ELF crash analysis: pwntools।

**macOS Automation permission मांगता है (Hopper)**
System Settings → Privacy & Security → Automation → REA start करने वाले app को allow करें, फिर कोशिश करें।

**Hopper first-run**
Unattended analysis से पहले demo mode vs license activation का चुनाव पूरा करें।

**Linux में `ps` नहीं है**
`procps` install करें (Debian/Ubuntu: `sudo apt install procps`); REA को process ownership checks के लिए चाहिए।

**Bug मिला?**
REA update, restart, retry। फिर issue खोलें: REA version, OS, target type, repro steps, error output, provider नाम। https://github.com/morluto/rea/issues.

---

## 18. Data, privacy और security

- REA targets **आपकी machine पर** analyze करता है; आपकी app REA के ज़रिये upload **नहीं** होती।
- **आपके agent का model provider** results पाता है — इसकी data/retention policy लागू होती है। Prompt में secrets या customer data paste न करें।
- MCP input schemas default में compact हैं; full field guidance के लिए MCP registration में `REA_MCP_INPUT_SCHEMA_PROFILE=full` set करें। Output schemas को `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (या `off`) से bound किया जा सकता है।
- RL environment recordings bodies/headers में credentials रख सकती हैं — share करने से पहले review करें। Credential-name warnings जगहें चिह्नित करते हैं; values **remove नहीं करते**।
- `APP_PASSWORD` जैसे secrets MCP server environment में रखें, chat में नहीं।
- REA सिर्फ़ `morluto/rea`, `rea.tools`, या npm `rea-agents` से install करें।

---

## 19. Quick reference checklist

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent install हुआ (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (plan review और approve करें)
[ ] Client पूरी तरह restart
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] पहली investigation: notes-example.zip  →  notes:export / notes.csv ढ़ूंढें
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup फिर चलाएं → agent restart करें
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: आप target के मालिक हैं / analyze करने की license है
```

---

## 20. Offline Backup / Mirror (Unofficial)

> ⚠️ **पहले यह पढ़ें।**
> किसी official project का कोई «official backup» नहीं होता। इकलौता official REA है **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, और **`rea-agents`** npm package।
> यह repo official project का पूरा, license-compliant **unofficial mirror / archive** देता है, जिसमें मूल MIT license और copyright notices सुरक्षित हैं। यह इसीलिए है कि **अगर official repo, website या npm package गायब हो जाए**, तो आप REA यहां से पा सकते हैं — इससे ज़्यादा कुछ नहीं।
> जब तक official sources मौजूद हैं, **उन्हें ही इस्तेमाल करें**। इस backup को «official» न कहें, और न ही «official REA» के रूप में redistribute करें। यह repo REA के लेखकों से जुड़ा या उनके द्वारा endorsed नहीं है।

**License:** REA MIT licensed है — notice के साथ copy, modify, redistribute allowed है। पूरा license, copyright headers और third-party notices mirror branch और npm tarball दोनों में सुरक्षित हैं। कोई warranty नहीं दी जाती।

### Backup में क्या-क्या है

| Backup piece | कहां | क्या है |
|---|---|---|
| Source mirror | Branch **`mirror/rea`** | Official `morluto/rea` `main` का पूरा git history (आखिरी sync के समय — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | सभी official release tags, exact official commits की ओर point करते हुए (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Official npm package, prebuilt (`dist/` सहित) — **पूरी तरह offline** install |
| Sync script | **`scripts/sync-backup.ps1`** | Mirror branch, tags और latest npm tarball को official sources से refresh करता है |
| Restore script | **`scripts/restore-backup.ps1`** | tarball का one-shot offline install + अगले steps print करता है |
| Guide | `README.md` (English master) | पूरी setup guideline; REA कहीं से भी आए, valid |

### Backup fresh रखें

हफ्ते में एक बार चलाएं (या इस पर निर्भर होने से पहले):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

यह `upstream/main` + सभी tags fetch करता है, `mirror/rea` force-update करता है, tags push करता है, latest `rea-agents-*.*.*` को `npm pack` करके `backup/` में डालता है, और tarball के आखिरी `git add`/`commit`/`push` commands print करता है।

### Restore scenarios

**Scenario A — GitHub down, npm ठीक है:** कुछ restore करने की ज़रूरत नहीं। `npx rea-agents@latest setup` जारी रखें।

**Scenario B — GitHub + npm दोनों down:** इस repo से prebuilt tarball install करें (network नहीं, build tools नहीं):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# या खुद:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` आपके agent के साथ MCP server + skill बिल्कुल ऑफिशियल `npx rea-agents setup` की तरह register करता है — पूरी तरह offline, registry को छूता नहीं।

**Scenario C — पूरा source/history भी चाहिए:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# आखिरी sync के समय का पूरा official source.
```

Source से build करने के लिए Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ और npm registry तक network access चाहिए (turbo monorepo; `npm ci && npm run build`)। tarball path (Scenario B) को दोनों की ज़रूरत नहीं — restore के समय हमेशा यही चुनें।

### Restore किया हुआ verify करें
```powershell
# Source mirror integrity — commit आखिरी synced upstream/main से मेल खाना चाहिए:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # mirror branch clone करने के बाद
# tarball integrity — CLI खुद जो version report करती है:
rea --version
```

अगर hashes backup के समय के records से अलग हों, तो उस copy को संदिग्ध मानें और भरोसा करने से पहले official sources से (अगर वे वापस आएं) फिर से sync करें।

### यह backup क्या-क्या गारंटी नहीं देता

- आखिरी sync के बाद security patches नहीं — abandoned backup एक outdated snapshot है।
- Official npm package में `mirror/rea` या tarball से नए hotfixes हो सकते हैं।
- Side services (rea.tools website, Discord, release notes, docs site) reference material हैं, यहां से restore होने वाला code नहीं।
- अगर REA बाद में दूसरे नाम/मालिक के साथ re-release हो, यह snapshot archived upstream के रूप में काम करेगा — सोच-समझकर migrate करें, compatibility मानकर न चलें।

---

**Links**
- Website: https://rea.tools/ · Get started: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (rea.tools footer देखें) · X: https://x.com/reatools
- **इस repo का backup:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
