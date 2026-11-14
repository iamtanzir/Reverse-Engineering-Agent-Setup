<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — مکمل سیٹ اپ گائیڈ

> **زبانیں:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ یہ ترجمہ انگریزی ماسٹر کاپی کے مطابق ہے۔ اختلاف کی صورت میں **انگریزی ہی معتبر** ہے۔ کوڈ بلاک، پاتھ اور کمانڈ کبھی ترجمہ نہیں ہوتے۔

> **REA — Reverse Engineer Anything**
> ایک MCP (Model Context Protocol) سرور + investigation skill جو آپ کے coding agent کو سافٹ ویئر inspect کرنے کے tools دیتا ہے — native binaries، JavaScript/Electron ایپس، browsers، .NET، Android، firmware اور بہت کچھ۔

- **Official website:** https://rea.tools/
- **Official source code:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **License:** MIT (خود REA)۔ تھرڈ پارٹی analysis tools کے اپنے licenses ہیں۔
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (انگریزی میں) — ہر پلیٹ فارم کے لیے مرحلہ وار سیٹ اپ (پہلے Windows: Electron، Web، .NET، Android، WASM، Native/Ghidra، WSL2) مع troubleshooting
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — REA کے ساتھ استعمال کے لیے مکمل مفت coding agents (OpenCode مع مفت ماڈلز، مقامی Ollama، Gemini CLI، Qwen Code)۔ REA خود ایک MCP سرور ہے، کوئی AI ماڈل نہیں۔
- **📦 Offline backup شامل ہے** — آفیشل repo کا غیر سرکاری mirror + npm tarball؛ صرف اسی وقت استعمال کریں جب آفیشل ذرائع غائب ہو جائیں۔ دیکھیں **[سیکشن 20 — Offline Backup / Mirror (غیر سرکاری)](#20-offline-backup--mirror-غیر-سرکاری)**۔

> ⚠️ **اہم:** REA صرف `morluto/rea`، `rea.tools` یا `rea-agents` npm پیکیج سے ڈاؤن لوڈ کریں۔ ملتا جلتا repo نام آفیشل ریلیز ثابت نہیں کرتا۔

---

## فہرست

1. REA کیا ہے (اور کیا نہیں ہے)
2. قانونی اور ذمہ دارانہ استعمال
3. آپ کیا تحلیل کر سکتے ہیں
4. سسٹم کی ضروریات
5. مرحلہ 1 — اپنا کمپیوٹر تیار کریں
6. مرحلہ 2 — coding agent منتخب کریں
7. مرحلہ 3 — REA کو منسلک کریں
8. مرحلہ 4 — انسٹالیشن کی تصدیق کریں
9. مرحلہ 5 — آپ کی پہلی investigation (Notes مثال)
10. Native analysis (binaries / EXE / DLL)
11. JavaScript اور Electron ایپس
12. Browser observation
13. دیگر targets اور درکار tools
14. RL environments بنائیں
15. ٹرمینل سے REA استعمال کریں (CLI)
16. REA کو اپ ڈیٹ یا حذف کریں
17. خرابیوں کا ازالہ
18. ڈیٹا، رازداری اور سیکیورٹی
19. فوری حوالہ چیک لسٹ
20. Offline Backup / Mirror (غیر سرکاری)

---

## 1. REA کیا ہے (اور کیا نہیں ہے)

**REA یہ ہے:**
- ایک local MCP سرور + agent skill — آپ کے **coding agent** کو مقامی سافٹ ویئر inspect کرنے دیتا ہے۔
- **Evidence** واپس کرتا ہے: assembly، pseudocode، module maps، IPC channel pairings، captured network traffic، source locations — اصل source code نہیں۔
- Analysis **آپ کے کمپیوٹر پر** چلتی ہے۔ آپ کی ایپ REA کے ذریعے اپ لوڈ نہیں ہوتی؛ آپ کے agent کا model provider نتائج دیکھتا ہے (دیکھیں [ڈیٹا اور رازداری](#18-ڈیٹا-رازداری-اور-سیکیورٹی))۔

**REA یہ نہیں ہے:**
- "source code میں واپس بدلنے" کا جادوئی بٹن۔ نتائج assembly/pseudocode اور references ہیں؛ آپ کا agent سمجھاتا ہے اور دوبارہ بنانے میں مدد کرتا ہے۔
- licenses/DRM توڑنے یا paid activation bypass کرنے کا tool۔ اس کے لیے استعمال نہ کریں۔
- obfuscation bypass۔ سخت packed/protected targets (VMProtect، Themida، anti-tamper) بہت مشکل ہیں۔
- server-side access۔ API کے پیچھے والا سرور inspect نہیں ہو سکتا؛ صرف client/network طرف نظر آتی ہے۔

---

## 2. قانونی اور ذمہ دارانہ استعمال

اپنی **ذاتی** سافٹ ویئر کو interoperability، security research، debugging اور تحلیل کے لیے reverse engineer کرنا قانونی ہو سکتا ہے — لیکن قانون اور licenses ہر ملک میں مختلف ہوتے ہیں۔

**آپ کو کرنا چاہیے:**
- وہ سافٹ ویئر تحلیل کریں جو آپ کا اپنا ہو، جس کا آپ کو استعمال کا license ہو، یا جسے inspect کرنے کی اجازت ہو۔
- license agreements، Terms of Service اور DMCA anti-circumvention قواعد کا احترام کریں۔
- نتائج صرف interoperability، تعلیم اور دفاعی سیکیورٹی کے لیے استعمال کریں۔

**آپ کو نہیں کرنا چاہیے:**
- DRM، license activation یا copy protection bypass کرنا۔
- proprietary سافٹ ویئر کا cracked/leaked code تقسیم کرنا۔
- ایسے targets تحلیل کرنا جن پر آپ کا کوئی حق نہیں۔

یہ گائیڈ قانونی مشورہ نہیں ہے۔ شک ہو تو کسی وکیل سے رجوع کریں۔

---

## 3. آپ کیا تحلیل کر سکتے ہیں

| Target | REA کیا واپس کرتا ہے | Native engine ضروری؟ |
|---|---|---|
| Native binaries / libraries (EXE, DLL, ELF, Mach-O) | Functions، assembly، pseudocode، callers، xrefs، constants | ہاں — Hopper، Ghidra یا IDA |
| JavaScript & Electron ایپس | Modules، imports، IPC channels + handlers، source locations | نہیں |
| Browser pages (runtime) | Requests/responses، scripts، JSON body shapes، observation window | Chrome فیملی browser |
| .NET assemblies / Flutter / packages | Module اور resource inspection | نہیں |
| Android APK / devices / resources | Decompiled classes، resources، device interaction | JADX / adb / Apktool |
| Firmware | Extracted filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module اور function inspection | WABT |
| SQLite databases | Schema اور query inspection | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract structure | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy captures | Parsed traffic evidence | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol facts | TShark / capinfos (Linux) |

---

## 4. سسٹم کی ضروریات

**کم از کم:**
- Node.js **22.23.4+**، **24.22.1+** یا **26+ (>= 26.12.1)** (npm کے ساتھ)
- معاون coding agent (مرحلہ 2)
- investigations کے لیے working directory

**Native (binary) analysis کے لیے** — ان میں سے ایک:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (مفت، Windows پر تجویز کردہ)
- **IDA** (commercial؛ verified Windows legacy GUI + headless supervisor profiles)
- **Hopper** (commercial؛ macOS اور کچھ Linux — **Windows پر دستیاب نہیں**)

**OS نوٹس:**
- Windows: **PowerShell** استعمال کریں؛ spaces والے paths quotes میں رکھیں۔ اگر آپ کا agent WSL میں چلتا ہے تو Node.js + REA کو WSL کے **اندر** نصب کریں اور Linux paths استعمال کریں۔
- Linux: `procps`-مطابق `ps` کا `PATH` پر ہونا ضروری ہے (Ghidra/JADX/firmware launches اور static analysis کے لیے)۔
- macOS: Terminal استعمال کریں؛ کچھ مراحل میں Xcode Command Line Tools درکار ہیں (arm64 پر Ghidra decompiler build)۔

---

## 5. مرحلہ 1 — اپنا کمپیوٹر تیار کریں

### 5.1 Node.js کی تصدیق کریں

```powershell
node -v
npm -v
```

متوقع: `v22.23.4+`، `v24.22.1+` یا `v26.12.1+`۔ پرانا ہو تو Node.js 24 LTS نصب کریں۔

### 5.2 Windows پر Node.js نصب کریں (اگر موجود نہ ہو)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

اگر Terms قبول کرنے کو کہا جائے تو `Y` لکھیں، PowerShell بند کر کے دوبارہ کھولیں، پھر `node -v` دوبارہ چیک کریں۔ (متبادل: https://nodejs.org/ سے LTS installer ڈاؤن لوڈ کریں۔)

> **PowerShell کی خاص بات:** اگر `npx` «running scripts is disabled on this system» کے ساتھ ناکام ہو تو `npx.cmd` اور `npm.cmd` استعمال کریں:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS کا `.pkg` ڈاؤن لوڈ کریں، یا Homebrew سے: `brew install node`۔

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# shell دوبارہ کھولیں، پھر:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 ایک working folder بنائیں

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. مرحلہ 2 — coding agent منتخب کریں

REA ہر اس agent کو سپورٹ کرتا ہے جو local **MCP** بولتا ہے۔ ایک منتخب کریں — تمام مثالیں client کے **setup ID** (`--client <id>`) استعمال کرتی ہیں۔

| Client | Setup ID | Install / نوٹ |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | App نصب کریں اور sign in کریں، پھر `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` یا install script · ChatGPT سے sign in |
| Cursor | `cursor` | Editor نصب کریں، working folder کھولیں، Agent mode |
| Windsurf | `windsurf` | وہی pattern؛ agent chat |
| VS Code | `vscode` | پہلے GitHub Copilot سیٹ اپ کریں، پھر Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`، `opencode` چلائیں، `/connect` سے model جوڑیں، پھر `--client opencode` |
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

**Grok Bot:** bot کی chat میں اسے کہیں کہ اس کے hosted computer پر `rea` نام کا custom MCP سرور شامل کرے:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. مرحلہ 3 — REA کو منسلک کریں

### آپشن A — اپنے agent سے کروائیں (تجویز کردہ)

اپنے agent کی chat میں چسپاں کریں:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent setup چلاتا ہے، plan دکھاتا ہے، اور آپ کی منظوری کے بعد apply کرتا ہے۔

### آپشن B — setup خود چلائیں

```powershell
npx rea-agents@latest setup
```

کسی مخصوص client کے لیے:

```powershell
npx rea-agents@latest setup --client opencode
```

setup کے دوران:
- حرکت کے لیے **arrow keys**، انتخاب کے لیے **Space**، جاری رکھنے کے لیے **Enter**۔
- REA **MCP connection** + **investigation skill** شامل کرتا ہے اور تبدیلیوں سے پہلے موجودہ config کا **backup** لیتا ہے۔
- تبدیلیاں صرف آپ کی منظوری کے بعد apply ہوتی ہیں۔
- پہلی مشق میں optional Hopper installation چھوڑ سکتے ہیں۔

### setup کے بعد client کو restart کریں

- Desktop apps (Claude Desktop، Cursor، Windsurf، VS Code): **مکمل** بند کریں اور دوبارہ کھولیں (Windows: tray icon سے بھی quit کریں)۔
- Terminal agents (Claude Code، Codex، Gemini CLI، OpenCode): session ختم کر کے دوبارہ شروع کریں۔

---

## 8. مرحلہ 4 — انسٹالیشن کی تصدیق کریں

اپنے client کا doctor چیک چلائیں (`<client_id>` بدلیں):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

صحت مند رپورٹ `"healthy": true` دکھاتی ہے۔ پھر اپنے agent سے پوچھیں:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. مرحلہ 5 — آپ کی پہلی investigation (Notes مثال)

آفیشل مثال ایک چھوٹی Electron ایپ ہے جس میں **Export notes** بٹن ہے۔ Electron نصب کرنے کی ضرورت نہیں — agent code پڑھتا ہے۔

اپنے agent میں چسپاں کریں:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

متوقع نتیجہ: Export پر کلک کرنے سے `notes:export` IPC پیغام جاتا ہے؛ main process notes کو CSV میں بدل کر `notes.csv` (کالم: `id`، `title`) آپ کے Downloads فولڈر میں لکھتا ہے۔

ٹرمینل سے دستی analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native analysis (binaries / EXE / DLL)

گہرے native analysis کے لیے provider درکار ہے۔ **Windows** پر **Ghidra** یا **IDA** استعمال کریں (Hopper Windows پر دستیاب نہیں)۔

### 10.1 Ghidra (مفت) — Windows سیٹ اپ

1. **64-bit JDK 21 یا نیا** نصب کریں (compiler کے ساتھ)۔ تصدیق کریں:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Release کی *Assets* فہرست سے **Ghidra 12.1.4** ڈاؤن لوڈ کریں اور `ghidra_…_PUBLIC_….zip` extract کریں (release archive، **"Source code" نہیں**)۔
3. `ghidraRun.bat` والا extracted فولڈر نوٹ کریں — یہی آپ کا `GHIDRA_INSTALL_DIR` ہے۔
4. PowerShell میں:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # وہ فولڈر جو java.home دکھاتا ہے
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx -y rea-agents@latest setup
   ```
   Paths اپنی installation کے مطابق بدلیں۔ setup کا updated plan دیکھیں، approve کریں اور **agent کو restart کریں**۔

> Windows پر Ghidra سپورٹ **experimental، read-only** ہے — صرف مقامی مستقل **NTFS** drives پر x86/x64 PE apps اور DLLs کے لیے۔

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx -y rea-agents@latest setup
```

macOS arm64 اور Linux arm64 پر پہلے Ghidra کا native decompiler build کریں (macOS کو Xcode Command Line Tools، make اور bison درکار ہیں)۔

### 10.3 IDA

1. IDA provider guide کے مطابق upstream IDA MCP سرور نصب اور configure کریں۔
2. کام کرنے والی registration کو `ida-mcp.json` کے نام سے محفوظ کریں۔ مثال (`idb_open`/`idb_list`/`idb_close` والا headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   attached legacy 1.4.0 GUI سرور کے لیے اس کا working command/args/env نقل کریں (پہلے IDA میں binary کھول کر plugin شروع کریں)۔
3. منسلک کریں:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx -y rea-agents@latest setup
   ```
   macOS/Linux پر `$env:` کی جگہ `export` استعمال کریں۔ setup کے بعد agent restart کریں۔

> Verified IDA profiles: Windows legacy GUI اور headless supervisor، نیز macOS arm64 headless supervisor (IDA Professional 9.1)۔ npm 6.4.0 میں macOS headless profile / native GUI bridge شامل نہیں — ان کے لیے REA source build درکار ہے۔

### 10.4 Hopper (صرف macOS / Linux)

setup موجودہ Hopper کو detect کر سکتا ہے یا installation plan تجویز کر سکتا ہے۔ macOS پر پہلی بار کھولتے وقت demo mode منتخب کریں یا license activate کریں۔ Linux پر خودکار setup کے لیے x86_64 host اور Ubuntu 24.04+، Fedora 41+، Nobara 44+، Arch، CachyOS یا Omarchy درکار ہے۔ Linux arm64 پر Ghidra استعمال کریں۔

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 provider کا استعمال

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI سے ایک بار function analysis (Ghidra configured ہونا چاہیے):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript اور Electron ایپس

Native engine کی ضرورت نہیں۔ اپنے agent کو ایپ کے **folder** یا **.asar** کی طرف اشارہ کریں:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron ایپس میں `app.asar` کہاں ہوتا ہے:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: عموماً `/opt/<App>/resources/app.asar`

ٹرمینل سے static analysis:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

`normalized_result.summary.ipc` میں matched channels/handlers اور `normalized_result.graph` میں source locations دیکھیں۔ dynamically computed channel names حل نہ ہو سکیں تو browser observation استعمال کریں (اگلا حصہ)۔

---

## 12. Browser observation

1. Target page کو Chrome فیملی browser میں remote debugging کے ساتھ کھولیں، مثلاً:

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

2. اپنے agent سے پوچھیں:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   اسے endpoint `http://127.0.0.1:9222` اور page کا URL دیں۔ کلک کرنے سے **پہلے** capture شروع کریں۔

   یا ٹرمینل سے:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP bodies کے لیے Fiddler Everywhere کے exports (SAZ/HAR 1.2) REA capture Evidence بن سکتے ہیں، یا Everywhere کا MCP سرور منسلک کریں۔

---

## 13. دیگر targets اور درکار tools

| Target | تیار کرنے والے tools | نوٹ |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Engine کی ضرورت نہیں |
| Website | Chrome / Chromium / Edge | Remote debugging port |
| .NET / Flutter / packages | Node.js + npm | Static inspection |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android device | adb | USB debugging فعال کریں |
| Android resources | Apktool + Java | resources اور manifest unpack کرتا ہے |
| JEB project | JEB + MCP | Commercial decompiler |
| Firmware | Binwalk / Unblob | **صرف Linux** |
| WASM | WABT (`wat2wasm`، `wasm2wat`) | |
| SQLite database | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **صرف Linux x64** |
| ELF / Linux crash | pwntools، GDB، pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Captures کی offline parsing |
| PCAP / PCAPNG | TShark / capinfos | **صرف Linux** |
| Logic signals | sigrok-cli | **صرف Linux** |
| Process behavior | PTY | **Linux / macOS** |

Flutter، packages/resources، EVM اور مکمل investigation guides: https://rea.tools/guides۔

---

## 14. RL environments بنائیں

REA ایک test web app session ریکارڈ کر کے اسے **AgentEnv** environment کے طور پر export کر سکتا ہے — agents کو train/evaluate کرنے کے لیے۔

1. ایک **test** app instance تیار کریں جہاں agent data create/edit/delete کر سکے۔
2. اپنے agent سے پوچھیں (folders والی مثال):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Password MCP server environment (`APP_PASSWORD`) میں رکھیں، prompt میں نہیں۔
3. یا براہِ راست HAR recording سے build کریں:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` بغیر فائل لکھے report کا جائزہ لیتا ہے۔
4. چلائیں:
   ```bash
   agent-env run ./my-env
   ```
   REA کا compatibility check **AgentEnv 0.9.1334 + Python 3.12** استعمال کرتا ہے؛ Docker چل رہا ہونا چاہیے۔
5. صرف وہی operations سپورٹ ہیں جن کے **effects** ریکارڈ ہوئے ہوں (مثلاً delete کے لیے missing-item response اور updated list ریکارڈ ہونی چاہیے)۔ شیئر کرنے سے پہلے retained response bodies چیک کریں — credentials ہو سکتے ہیں۔

---

## 15. ٹرمینل سے REA استعمال کریں (CLI)

Global install کے بغیر:

```powershell
npx -y rea-agents@latest --help
```

`rea` کمانڈ مستقل نصب کریں:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux کے لیے curl installer (پہلے Node.js درکار):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

عام کمانڈز:

| Command | مقصد |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modules، imports، IPC، boundaries کا map |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | ایک native function کا analysis |
| `rea-agents list-browser-targets <endpoint> --json` | Debug-able browser pages کی فہرست |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Page network/scripts کا observation |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL environment build |
| `rea-agents environment-compare … --json` | Environment بمقابلہ live app موازنہ |
| `rea-agents doctor --client <id> --json` | Client connection check |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Native provider check |
| `rea-agents update` | CLI update |
| `rea-agents uninstall` | REA client config + skill حذف |

---

## 16. REA کو اپ ڈیٹ یا حذف کریں

**اپ ڈیٹ:**
```powershell
rea update                       # اگر global CLI نصب ہے
npx rea-agents@latest setup      # agent connection + skill refresh؛ plan approve کریں اور restart
```

**حذف:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. خرابیوں کا ازالہ

**Agent کو REA tools نظر نہیں آتے**
1. Client کو مکمل restart/reconnect کریں (tray icon سمیت)۔
2. `npx -y rea-agents@latest doctor --client <id> --json` — اگر registration missing/stale ہو: `npx rea-agents@latest setup --client <id>`، پھر restart کریں۔
3. پھر بھی نہ ہو تو client کا MCP connection error دیکھیں؛ editor clients میں MCP settings میں REA enable کریں اور اس کے tools allow کریں۔

**`npx` — «running scripts is disabled» (Windows PowerShell)**
`npx.cmd` / `npm.cmd` استعمال کریں، یا `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`۔

**Spaces والے paths**
Quotes میں رکھیں: `"D:/my apps/tool.exe"`۔ WSL میں Linux paths استعمال کریں اور REA WSL کے اندر نصب کریں۔

**Windows Ghidra کی حدود**
Experimental، read-only، صرف x86/x64 PE، مقامی مستقل NTFS drives۔ Linux متبادل: Ghidra/Hopper۔ native x64 Linux ELF crash analysis: pwntools۔

**macOS Automation permission مانگتا ہے (Hopper)**
System Settings → Privacy & Security → Automation → REA چلانے والی app کو allow کریں، دوبارہ کوشش کریں۔

**Hopper first-run**
غیر نگرانی والی analysis سے پہلے demo mode بمقابلہ license activation کا انتخاب مکمل کریں۔

**Linux میں `ps` موجود نہیں**
`procps` نصب کریں (Debian/Ubuntu: `sudo apt install procps`)؛ REA کو process ownership checks کے لیے درکار ہے۔

**Bug ملا؟**
REA update، restart، retry۔ پھر issue کھولیں مع: REA version، OS، target type، repro steps، error output، provider نام۔ https://github.com/morluto/rea/issues۔

---

## 18. ڈیٹا، رازداری اور سیکیورٹی

- REA targets کو **آپ کے کمپیوٹر پر** تحلیل کرتا ہے؛ آپ کی ایپ REA کے ذریعے اپ لوڈ **نہیں** ہوتی۔
- **آپ کے agent کا model provider** نتائج وصول کرتا ہے — اس کی data/retention policy لاگو ہوتی ہے۔ Prompt میں secrets یا customer data چسپاں نہ کریں۔
- MCP input schemas بطور ڈیفالٹ compact ہیں؛ مکمل field guidance کے لیے MCP registration میں `REA_MCP_INPUT_SCHEMA_PROFILE=full` سیٹ کریں۔ Output schemas `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (یا `off`) سے محدود کیے جا سکتے ہیں۔
- RL environment recordings کے bodies/headers میں credentials محفوظ رہ سکتے ہیں — شیئر کرنے سے پہلے چیک کریں۔ Credential-name warnings صرف جگہیں نشان زد کرتی ہیں؛ values کو **حذف نہیں کرتیں**۔
- `APP_PASSWORD` جیسے secrets MCP server environment میں رکھیں، chat میں نہیں۔
- REA صرف `morluto/rea`، `rea.tools` یا npm `rea-agents` سے نصب کریں۔

---

## 19. فوری حوالہ چیک لسٹ

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent نصب (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (plan review اور approve)
[ ] Client مکمل restart
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] پہلی investigation: notes-example.zip  →  notes:export / notes.csv تلاش کریں
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR، JAVA_HOME
[ ]     doctor --provider ghidra --json → setup دوبارہ چلائیں → agent restart
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] قانونی: آپ target کے مالک ہیں / تحلیل کی اجازت رکھتے ہیں
```

---

## 20. Offline Backup / Mirror (غیر سرکاری)

> ⚠️ **پہلے یہ پڑھیں۔**
> کسی آفیشل پروجیکٹ کا «آفیشل بیک اپ» نام کی کوئی چیز نہیں ہوتی۔ واحد آفیشل REA ہے **morluto/rea** (https://github.com/morluto/rea)، **rea.tools** اور **`rea-agents`** npm پیکیج۔
> یہ repo آفیشل پروجیکٹ کا مکمل، license کے مطابق **غیر سرکاری mirror / archive** فراہم کرتا ہے، اصل MIT license اور copyright notices کے ساتھ۔ یہ اسی لیے ہے کہ **اگر آفیشل repo، website یا npm پیکیج غائب ہو جائے** تو آپ REA یہاں سے حاصل کر سکیں — بس۔
> جب تک آفیشل ذرائع موجود ہیں **وہی استعمال کریں**۔ اس بیک اپ کو «آفیشل» نہ کہیں، اور نہ «آفیشل REA» کے طور پر تقسیم کریں۔ یہ repo REA کے مصنفین سے وابستہ نہیں اور نہ ان کی طرف سے توثیق شدہ ہے۔

**License:** REA MIT license کے تحت ہے — notice کے ساتھ copy، modify اور redistribute کی اجازت ہے۔ مکمل license، copyright headers اور third-party notices mirror branch اور npm tarball دونوں میں محفوظ ہیں۔ کوئی warranty نہیں دی جاتی۔

### بیک اپ میں کیا شامل ہے

| بیک اپ حصہ | کہاں | کیا ہے |
|---|---|---|
| Source mirror | Branch **`mirror/rea`** | آفیشل `morluto/rea` کے `main` کی مکمل git history (آخری sync کے وقت — v6.9.0، commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | تمام آفیشل release tags، عین آفیشل commits کی طرف اشارہ کرتے ہوئے (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | آفیشل npm پیکیج، پہلے سے built (`dist/` سمیت) — **مکمل offline** install |
| Sync script | **`scripts/sync-backup.ps1`** | mirror branch، tags اور تازہ npm tarball کو آفیشل ذرائع سے refresh کرتا ہے |
| Restore script | **`scripts/restore-backup.ps1`** | tarball کا one-shot offline install + اگلے مراحل پرنٹ کرتا ہے |
| Guide | `README.md` (انگریزی ماسٹر) | مکمل سیٹ اپ گائیڈ؛ REA کہیں سے بھی ہو، لاگو ہے |

### بیک اپ تازہ رکھیں

ہفتہ وار چلائیں (یا اس پر انحصار کرنے سے پہلے):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

یہ `upstream/main` + تمام tags fetch کرتا ہے، `mirror/rea` کو force-update کرتا ہے، tags push کرتا ہے، تازہ `rea-agents-*.*.*` کو `npm pack` کر کے `backup/` میں رکھتا ہے، اور tarball کے حتمی `git add`/`commit`/`push` کمانڈز پرنٹ کرتا ہے۔

### Restore کے منظرنامے

**منظرنامہ A — GitHub down، npm ٹھیک ہے:** restore کی ضرورت نہیں۔ `npx rea-agents@latest setup` جاری رکھیں۔

**منظرنامہ B — GitHub + npm دونوں down:** اسی repo سے prebuilt tarball نصب کریں (نہ network، نہ build tools):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# یا دستی طور پر:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` آپ کے agent میں MCP سرور + skill بالکل اسی طرح register کرتا ہے جیسے آفیشل `npx rea-agents setup` — مکمل offline، registry کو چھوئے بغیر۔

**منظرنامہ C — آپ کو مکمل source/history بھی چاہیے:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# آخری sync کے وقت کا مکمل آفیشل source۔
```

Source سے build کرنے کے لیے Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ اور npm registry تک network access درکار ہے (turbo monorepo؛ `npm ci && npm run build`)۔ tarball راستہ (منظرنامہ B) کو کسی کی ضرورت نہیں — restore کے وقت ہمیشہ اسی کو ترجیح دیں۔

### restore کی تصدیق کریں
```powershell
# Source mirror integrity — commit آخری synced upstream/main سے ملنا چاہیے:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # mirror branch clone کرنے کے بعد
# tarball integrity — CLI خود جو version بتاتی ہے:
rea --version
```

اگر hashes بیک اپ کے وقت کے records سے مختلف ہوں تو اس copy کو مشتبہ سمجھیں اور آفیشل ذرائع سے (اگر واپس آ جائیں) دوبارہ sync کر کے ہی اعتماد کریں۔

### یہ بیک اپ کس چیز کی ضمانت نہیں دیتا

- آخری sync کے بعد security patches نہیں — abandoned بیک اپ ایک پرانا snapshot ہے۔
- آفیشل npm پیکیج میں `mirror/rea` یا tarball سے نئے hotfixes ہو سکتے ہیں۔
- ضمنی خدمات (rea.tools website، Discord، release notes، docs site) reference material ہیں، یہاں سے restore ہونے والا code نہیں۔
- اگر REA بعد میں کسی اور نام/مالک کے ساتھ دوبارہ release ہو تو یہ snapshot archived upstream کے طور پر چلتا رہے گا — سوچ سمجھ کر migrate کریں، compatibility فرض نہ کریں۔

---

**لنکس**
- Website: https://rea.tools/ · Get started: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (rea.tools کے footer میں دیکھیں) · X: https://x.com/reatools
- **اس repo کا بیک اپ:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
