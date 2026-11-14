<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — راهنمای کامل راه‌اندازی

> **زبان‌ها:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ این ترجمه با نسخه انگلیسی اصلی مطابقت دارد. در صورت اختلاف، **انگلیسی مرجع است**. بلوک‌های کد، مسیرها و دستورات هرگز ترجمه نمی‌شوند.

> **REA — Reverse Engineer Anything**
> سرور MCP (Model Context Protocol) + مهارت تحلیل: به عامل برنامه‌نویسی‌تان ابزارهایی می‌دهد تا نرم‌افزار را بررسی کند — باینری‌های native، برنامه‌های JavaScript/Electron، مرورگرها، .NET، Android، firmware و بیشتر.

- **وب‌سایت رسمی:** https://rea.tools/
- **کد منبع رسمی:** https://github.com/morluto/rea
- **بسته npm:** `rea-agents`
- **مجوز:** MIT (خود REA). ابزارهای تحلیل شخص ثالث مجوزهای خود را دارند.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (به انگلیسی) — راه‌اندازی گام‌به‌گام برای هر پلتفرم (اول Windows: Electron، وب، .NET، Android، WASM، Native/Ghidra، WSL2) به‌همراه رفع اشکال
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — عامل‌های کدنویسی کاملاً رایگان برای REA (OpenCode با مدل‌های رایگان، Ollama محلی، Gemini CLI، Qwen Code). REA خودش یک سرور MCP است، نه مدل هوش مصنوعی.
- **📦 پشتیبان offline گنجانده شده** — آینه غیررسمی repo رسمی + tarball npm؛ فقط در صورت ناپدید شدن منابع رسمی. ببینید **[بخش 20 — پشتیبان / آینه offline (غیررسمی)](#20-پشتیبان--آینه-offline-غیررسمی)**.

> ⚠️ **مهم:** REA را فقط از `morluto/rea`، `rea.tools` یا بسته npm `rea-agents` دانلود کنید. نام مشابه repo، انتشار رسمی را ثابت نمی‌کند.

---

## فهرست مطالب

1. REA چیست (و چیست نیست)
2. استفاده قانونی و مسئولانه
3. چه چیزهایی را می‌توان تحلیل کرد
4. نیازمندی‌های سیستم
5. گام 1 — رایانه خود را آماده کنید
6. گام 2 — یک عامل برنامه‌نویسی انتخاب کنید
7. گام 3 — REA را متصل کنید
8. گام 4 — نصب را بررسی کنید
9. گام 5 — اولین بررسی شما (نمونه Notes)
10. تحلیل native (باینری / EXE / DLL)
11. برنامه‌های JavaScript & Electron
12. رصد مرورگر
13. اهداف دیگر و ابزارهای لازم
14. ساخت محیط‌های RL
15. استفاده از REA از ترمینال (CLI)
16. به‌روزرسانی یا حذف REA
17. رفع اشکال
18. داده، حریم خصوصی و امنیت
19. چک‌لیست مرجع سریع
20. پشتیبان / آینه offline (غیررسمی)

---

## 1. REA چیست (و چیست نیست)

**REA این است:**
- یک سرور MCP محلی + مهارت عامل — به **عامل برنامه‌نویسی‌تان** اجازه می‌دهد نرم‌افزارهای موجود در رایانه‌تان را بررسی کند.
- **شواهد** برمی‌گرداند: اسمبلی، pseudocode، نقشه ماژول‌ها، جفت‌های کانال IPC، ترافیک شبکه ضبط‌شده، موقعیت‌های منبع — نه کد منبع اصلی.
- تحلیل **روی دستگاه شما** اجرا می‌شود. برنامه شما توسط REA آپلود نمی‌شود؛ ارائه‌دهنده مدل عامل شما نتایج را می‌بیند (ببینید [داده و حریم خصوصی](#18-داده-حریم-خصوصی-و-امنیت)).

**REA این نیست:**
- دکمه جادویی «برگرداندن کد منبع». نتایج اسمبلی/pseudocode و ارجاع‌ها هستند؛ عامل توضیح می‌دهد و به بازسازی رفتار کمک می‌کند.
- ابزاری برای شکستن لایسنس/DRM یا دور زدن فعال‌سازی پولی. از آن برای این کار استفاده نکنید.
- دور زدن obfuscation. اهداف به‌شدت بسته‌بندی/محافظت‌شده (VMProtect، Themida، ضد دستکاری) همچنان بسیار دشوارند.
- دسترسی به سمت سرور. نمی‌تواند سرور پشت یک API را بررسی کند؛ فقط سمت سرویس‌گیرنده/شبکه دیده می‌شود.

---

## 2. استفاده قانونی و مسئولانه

مهندسی معکوس می‌تواند برای سازگاری متقابل، پژوهش امنیتی، رفع اشکال و تحلیل نرم‌افزاری که **مالک** آن هستید قانونی باشد — اما قوانین و مجوزها بسته به حوزه قضایی متفاوت است.

**باید:**
- نرم‌افزاری را تحلیل کنید که مالک آن هستید، لایسنس استفاده از آن را دارید یا اجازه بررسی آن را دارید.
- به توافق‌نامه‌های لایسنس، شرایط خدمات و مقررات anti-circumvention قانون DMCA احترام بگذارید.
- از یافته‌ها برای سازگاری متقابل، آموزش و امنیت تدافعی استفاده کنید.

**نباید:**
- DRM، فعال‌سازی لایسنس یا محافظت ضدکپی را دور بزنید.
- کد شکسته/درزکرده نرم‌افزارهای اختصاصی را توزیع کنید.
- اهدافی را تحلیل کنید که حق مالکیت یا بررسی آن‌ها را ندارید.

این راهنما مشاوره حقوقی نیست. در شک، با وکیل مشورت کنید.

---

## 3. چه چیزهایی را می‌توان تحلیل کرد

| هدف | REA چه برمی‌گرداند | موتور native لازم است؟ |
|---|---|---|
| باینری/کتابخانه native (EXE، DLL، ELF، Mach-O) | توابع، اسمبلی، pseudocode، فراخوان‌ها، xrefs، ثابت‌ها | بله — Hopper، Ghidra یا IDA |
| برنامه‌های JavaScript & Electron | ماژول‌ها، importها، کانال‌های IPC + هندلرها، موقعیت منبع | خیر |
| صفحات مرورگر (runtime) | درخواست/پاسخ، اسکریپت‌ها، شکل بدنه‌های JSON، پنجره مشاهده | مرورگر خانواده Chrome |
| اسمبلی‌های .NET / Flutter / پکیج‌ها | بررسی ماژول و منبع | خیر |
| Android APK / دستگاه‌ها / منابع | کلاس‌های دیکامپایل‌شده، منابع، تعامل با دستگاه | JADX / adb / Apktool |
| Firmware | فایل‌سیستم/blobهای استخراج‌شده | Binwalk / Unblob (Linux) |
| WASM | بررسی ماژول و تابع | WABT |
| پایگاه‌های SQLite | بررسی schema و کوئری | Node.js 24.15+ / 26+ |
| EVM bytecode | ساختار قرارداد | Node.js (Linux x64) |
| ضبط‌های HAR / SAZ / mitmproxy | شواهد ترافیک تجزیه‌شده | Node.js / mitmdump |
| PCAP / PCAPNG | حقایق بسته/پروتکل | TShark / capinfos (Linux) |

---

## 4. نیازمندی‌های سیستم

**حداقل:**
- Node.js **22.23.4+** یا **24.22.1+** یا **26+ (>= 26.12.1)** (npm شامل است)
- یک عامل برنامه‌نویسی پشتیبانی‌شده (گام 2)
- یک پوشه کاری برای بررسی‌هایتان

**برای تحلیل native (باینری)** — یکی از:
- **Ghidra 12.1.x** + **JDK 21+** 64 بیتی (رایگان، توصیه‌شده در Windows)
- **IDA** (تجاری؛ پروفایل‌های تأییدشده Windows legacy GUI + headless supervisor)
- **Hopper** (تجاری؛ macOS و بخشی از Linux — **در Windows موجود نیست**)

**نکات سیستم‌عامل:**
- Windows: از **PowerShell** استفاده کنید؛ مسیرهای دارای فاصله را در گیومه بگذارید. اگر عامل در WSL اجرا می‌شود، Node.js + REA را **داخل** WSL نصب کنید و از مسیرهای Linux استفاده کنید.
- Linux: `ps` سازگار با `procps` باید در `PATH` باشد (برای راه‌اندازی Ghidra/JADX/firmware و تحلیل ایستا).
- macOS: از Terminal استفاده کنید؛ برخی مراحل به Xcode Command Line Tools نیاز دارند (ساخت decompiler Ghidra روی arm64).

---

## 5. گام 1 — رایانه خود را آماده کنید

### 5.1 Node.js را بررسی کنید

```powershell
node -v
npm -v
```

مورد انتظار: `v22.23.4+`، `v24.22.1+` یا `v26.12.1+`. قدیمی‌تر → Node.js 24 LTS را نصب کنید.

### 5.2 Node.js را روی Windows نصب کنید (اگر نیست)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

اگر شرایط را پرسید `Y` بزنید، PowerShell را ببندید و باز کنید و `node -v` را دوباره چک کنید. (جایگزین: نصاب LTS را از https://nodejs.org/ دانلود کنید.)

> **نکته PowerShell:** اگر `npx` با «running scripts is disabled on this system» خطا داد، از `npx.cmd` و `npm.cmd` استفاده کنید:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

فایل `.pkg` Node.js 24 LTS را دانلود کنید، یا با Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# شل را دوباره باز کنید، سپس:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 یک پوشه کاری بسازید

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. گام 2 — یک عامل برنامه‌نویسی انتخاب کنید

REA هر عاملی که با **MCP** محلی صحبت کند را پشتیبانی می‌کند. یکی را انتخاب کنید — همه مثال‌ها از **setup ID** کلاینت استفاده می‌کنند (`--client <id>`).

| کلاینت | Setup ID | نصب / نکات |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | اپ را نصب کنید، وارد شوید، سپس `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` یا اسکریپت نصب · ورود با ChatGPT |
| Cursor | `cursor` | ادیتور را نصب کنید، پوشه کار را باز کنید، حالت Agent |
| Windsurf | `windsurf` | همان الگو؛ چت عامل |
| VS Code | `vscode` | اول GitHub Copilot را تنظیم کنید، سپس حالت Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`، `opencode` را اجرا کنید، `/connect` برای مدل، سپس `--client opencode` |
| Gemini CLI | `gemini_cli` | `npm i -g @google/gemini-cli` → `gemini` |
| Devin | `devin` | `irm https://static.devin.ai/cli/setup.ps1 \| iex` (Win) · `curl -fsSL https://cli.devin.ai/install.sh \| bash` (macOS/Linux) |
| GitHub Copilot CLI | `copilot_cli` | `npm i -g @github/copilot` → `copilot` |
| Antigravity | `antigravity` | Download IDE: https://antigravity.google/ |
| Qwen Code | `qwen_code` | `npm i -g @qwen-code/qwen-code@latest` → `qwen` |
| Kimi Code | `kimi` | `npm i -g @moonshot-ai/kimi-code` → `kimi` |
| Grok Build | `grok_build` | `irm https://x.ai/cli/install.ps1 \| iex` (Win) · `curl -fsSL https://x.ai/cli/install.sh \| bash` (macOS/Linux) |
| Command Code | `commandcode` | `npm i -g command-code` → `commandcode` |
| OMP | `omp` | `irm https://omp.sh/install.ps1 \| iex` (Win) · `curl -fsSL https://omp.sh/install \| sh` (macOS/Linux) |
| Pi | `pi` | `irm https://pi.dev/install.ps1 \| iex` (Win) · `curl -fsSL https://pi.dev/install.sh \| sh` (macOS/Linux) |
| Hermes | `hermes` | `iex (irm https://hermes-agent.nousresearch.com/install.ps1)` (Win) · `curl -fsSL https://hermes-agent.nousresearch.com/install.sh \| bash` (macOS/Linux) |
| Qoder | `qoder` | Download IDE: https://qoder.com/download |
| Factory Droid | `droid` | `npm i -g droid` (Win) · `curl -fsSL https://app.factory.ai/cli \| sh` (macOS/Linux) |
| Trae | `trae` | Download IDE: https://www.trae.ai/ |
| WorkBuddy | `workbuddy` | Download app: https://www.workbuddy.ai/ |
| ZCode | `zcode` | Download app: https://zcode.z.ai/ |
| DeepSeek Harness | `dsh` | `npm i -g @deepseek-ai/dsh` |
| FreeBuff | `freebuff` | `npm install -g freebuff` |

**Grok Bot:** در چت بات، از آن بخواهید یک سرور MCP سفارشی با نام `rea` روی رایانه میزبان خودش اضافه کند:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. گام 3 — REA را متصل کنید

### گزینه الف — بگذارید عامل انجام دهد (توصیه‌شده)

در چت عامل بچسبانید:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

عامل setup را اجرا می‌کند، طرح را نشان می‌دهد و بعد از تأیید شما اعمال می‌کند.

### گزینه ب — setup را خودتان اجرا کنید

```powershell
npx rea-agents@latest setup
```

برای یک کلاینت مشخص:

```powershell
npx rea-agents@latest setup --client opencode
```

حین setup:
- **پیکان‌ها** برای حرکت، **Space** برای انتخاب، **Enter** برای ادامه.
- REA **اتصال MCP** + **مهارت بررسی** اضافه می‌کند و قبل از تغییر، پیکربندی فعلی را **پشتیبان** می‌گیرد.
- تغییرات فقط پس از تأیید شما اعمال می‌شود.
- در تمرین اول می‌توانید نصب اختیاری Hopper را رد کنید.

### پس از setup، کلاینت را دوباره راه‌اندازی کنید

- اپ‌های دسکتاپ (Claude Desktop, Cursor, Windsurf, VS Code): **کاملاً** خارج شوید و دوباره باز کنید (Windows: همچنین از آیکون سینی سیستم).
- عامل‌های ترمینال (Claude Code, Codex, Gemini CLI, OpenCode): نشست را ببندید و دوباره شروع کنید.

---

## 8. گام 4 — نصب را بررسی کنید

بررسی doctor را برای کلاینت خود اجرا کنید (`<client_id>` را جایگزین کنید):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

گزارش سالم `"healthy": true` را نشان می‌دهد. سپس از عامل بپرسید:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. گام 5 — اولین بررسی شما (نمونه Notes)

نمونه رسمی یک اپ Electron کوچک با دکمه **Export notes** است. نیازی به نصب Electron نیست — عامل کد را می‌خواند.

در عامل بچسبانید:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

نتیجه مورد انتظار: کلیک روی Export یک پیام IPC به نام `notes:export` می‌فرستد؛ فرآیند اصلی نت‌ها را به CSV تبدیل کرده و `notes.csv` (ستون‌ها: `id`، `title`) را در پوشه Downloads می‌نویسد.

تحلیل دستی از ترمینال:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. تحلیل native (باینری / EXE / DLL)

تحلیل native عمیق به یک provider نیاز دارد. روی **Windows** از **Ghidra** یا **IDA** استفاده کنید (Hopper روی Windows موجود نیست).

### 10.1 Ghidra (رایگان) — راه‌اندازی Windows

1. **JDK 64 بیتی 21 یا جدیدتر** را نصب کنید (همراه کامپایلر). بررسی کنید:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. **Ghidra 12.1.4** را از فهرست *Assets* ریلیز دانلود و `ghidra_…_PUBLIC_….zip` را باز کنید (آرشیو ریلیز، **نه** «Source code»).
3. پوشه‌ای که `ghidraRun.bat` دارد را یادداشت کنید — آن `GHIDRA_INSTALL_DIR` شماست.
4. در PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # پوشه‌ای که java.home گزارش می‌دهد
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   مسیرها را با نصب خود جایگزین کنید. طرح به‌روزشده setup را بازبینی، تأیید و **عامل را دوباره راه‌اندازی کنید**.

> پشتیبانی Ghidra در Windows **آزمایشی و فقط خواندنی** است؛ فقط برای اپ/DLLهای PE x86/x64 native روی درایوهای ثابت **NTFS** محلی.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

روی macOS arm64 و Linux arm64 ابتدا decompiler native Ghidra را بسازید (macOS به Xcode Command Line Tools، make، bison نیاز دارد).

### 10.3 IDA

1. سرور MCP upstream IDA را طبق راهنمای provider نصب و پیکربندی کنید.
2. ثبت کارآمد را با نام `ida-mcp.json` ذخیره کنید. مثال (headless supervisor با `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   برای سرور GUI legacy 1.4.0 متصل، command/args/env کارآمد آن را کپی کنید (ابتدا باینری را در IDA باز کرده و افزونه را راه‌اندازی کنید).
3. متصل شوید:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   روی macOS/Linux به‌جای `$env:` از `export` استفاده کنید. بعد از setup، عامل را دوباره راه‌اندازی کنید.

> پروفایل‌های IDA تأییدشده: Windows legacy GUI و headless supervisor، به‌همراه macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 پروفایل headless macOS / پل GUI native را شامل نمی‌شود — به ساخت REA از منبع نیاز دارند.

### 10.4 Hopper (فقط macOS / Linux)

setup می‌تواند Hopper موجود را تشخیص دهد یا طرح نصب پیشنهاد کند. در macOS، در اولین اجرا حالت demo را انتخاب کنید یا لایسنس خود را فعال کنید. نصب خودکار Linux به x86_64 و Ubuntu 24.04+، Fedora 41+، Nobara 44+، Arch، CachyOS یا Omarchy نیاز دارد. روی Linux arm64 از Ghidra استفاده کنید.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 استفاده از provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

تحلیل یک‌باره یک تابع از CLI (Ghidra باید پیکربندی شده باشد):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. برنامه‌های JavaScript & Electron

به موتور native نیاز نیست. عامل را به **پوشه** برنامه یا **.asar** هدایت کنید:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

محل `app.asar` در برنامه‌های Electron:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: اغلب `/opt/<App>/resources/app.asar`

تحلیل ایستا از ترمینال:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

برای کانال/هندلرهای تطبیق‌یافته `normalized_result.summary.ipc` و برای موقعیت‌های منبع `normalized_result.graph` را ببینید. نام کانال‌های محاسبه‌شده ممکن است حل‌نشده بمانند — در آن صورت از رصد مرورگر (بخش بعدی) استفاده کنید.

---

## 12. رصد مرورگر

1. صفحه هدف را با مرورگر خانواده Chrome و دیباگ از راه دور باز کنید، مثلاً:

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

2. از عامل بپرسید:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   endpoint ‏`http://127.0.0.1:9222` و آدرس صفحه را به آن بدهید. ضبط را **قبل از** کلیک شروع کنید.

   یا از ترمینال:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

برای بدنه‌های HTTP، خروجی‌های Fiddler Everywhere (SAZ/HAR 1.2) می‌توانند REA capture Evidence را تغذیه کنند، یا سرور MCP Everywhere را متصل کنید.

---

## 13. اهداف دیگر و ابزارهای لازم

| هدف | ابزارها | نکات |
|---|---|---|
| JavaScript / Electron | Node.js + npm | بدون موتور |
| وب‌سایت | Chrome / Chromium / Edge | پورت دیباگ از راه دور |
| .NET / Flutter / پکیج‌ها | Node.js + npm | بررسی ایستا |
| Android APK | JADX + JDK 17+ | دیکامپایل `classes.dex` |
| دستگاه Android | adb | دیباگ USB را فعال کنید |
| منابع Android | Apktool + Java | منابع و manifest را باز می‌کند |
| پروژه JEB | JEB + MCP | دیکامپایلر تجاری |
| Firmware | Binwalk / Unblob | **فقط Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| پایگاه SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **فقط Linux x64** |
| ELF / کرش Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | تحلیل offline ضبط‌ها |
| PCAP / PCAPNG | TShark / capinfos | **فقط Linux** |
| سیگنال‌های منطقی | sigrok-cli | **فقط Linux** |
| رفتار پروسه | PTY | **Linux / macOS** |

Flutter و پکیج‌ها/منابع و EVM و راهنماهای کامل بررسی: https://rea.tools/guides.

---

## 14. ساخت محیط‌های RL

REA می‌تواند یک نشست اپ وب آزمایشی را ضبط و یک محیط **AgentEnv** را برای آموزش/ارزیابی عامل‌ها export کند.

1. یک نمونه **آزمایشی** از اپ آماده کنید که عامل بتواند داده ایجاد/ویرایش/حذف کند.
2. از عامل بپرسید (نمونه پوشه‌ها):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   رمز را در محیط سرور MCP (`APP_PASSWORD`) نگه دارید، نه در prompt.
3. یا مستقیماً از ضبط HAR بسازید:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   ‏`--dry-run` گزارش را بدون نوشتن فایل بازبینی می‌کند.
4. اجرا کنید:
   ```bash
   agent-env run ./my-env
   ```
   بررسی سازگاری REA از **AgentEnv 0.9.1334 + Python 3.12** استفاده می‌کند؛ Docker باید در حال اجرا باشد.
5. فقط عملیاتی که **اثراتشان** ضبط شده پشتیبانی می‌شوند (مثلاً حذف به پاسخ «آیتم وجود ندارد» و فهرست به‌روز شده نیاز دارد). قبل از اشتراک‌گذاری، بدنه‌های پاسخ نگه‌داشته‌شده را بازبینی کنید — ممکن است credentials داشته باشند.

---

## 15. استفاده از REA از ترمینال (CLI)

بدون نصب سراسری:

```powershell
npx -y rea-agents@latest --help
```

دستور `rea` را برای همیشه نصب کنید:

```powershell
npm install --global rea-agents
rea --help
rea update
```

نصاب curl برای macOS / Linux (اول Node.js لازم است):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

دستورات رایج:

| دستور | هدف |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | نقشه ماژول‌ها، importها، IPC، مرزها |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | تحلیل یک تابع native |
| `rea-agents list-browser-targets <endpoint> --json` | فهرست صفحات مرورگر قابل دیباگ |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | مشاهده شبکه/اسکریپت‌های صفحه |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | ساخت محیط RL |
| `rea-agents environment-compare … --json` | مقایسه محیط با اپ واقعی |
| `rea-agents doctor --client <id> --json` | بررسی اتصال کلاینت |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | بررسی provider native |
| `rea-agents update` | به‌روزرسانی CLI |
| `rea-agents uninstall` | حذف پیکربندی کلاینت REA + مهارت |

---

## 16. به‌روزرسانی یا حذف REA

**به‌روزرسانی:**
```powershell
rea update                       # اگر CLI سراسری نصب شده است
npx rea-agents@latest setup      # تازه‌سازی اتصال عامل + مهارت؛ طرح را تأیید و عامل را راه‌اندازی مجدد کنید
```

**حذف:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. رفع اشکال

**عامل ابزارهای REA را نمی‌بیند**
1. کلاینت را کاملاً دوباره راه‌اندازی/متصل کنید (شامل آیکون سینی سیستم).
2. `npx -y rea-agents@latest doctor --client <id> --json` — اگر ثبت مفقود/قدیمی است: `npx rea-agents@latest setup --client <id>` سپس راه‌اندازی مجدد.
3. هنوز نمی‌بیند: خطای اتصال MCP کلاینت را بررسی کنید؛ در ادیتورها REA را در تنظیمات MCP فعال و ابزارهایش را مجاز کنید.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
از `npx.cmd` / `npm.cmd` یا `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` استفاده کنید.

**مسیرهای دارای فاصله**
در گیومه: `"D:/my apps/tool.exe"`. در WSL، مسیرهای Linux و REA را داخل WSL نصب کنید.

**محدودیت‌های Ghidra در Windows**
آزمایشی، فقط خواندنی، فقط PE x86/x64، درایوهای NTFS محلی ثابت. جایگزین Linux: Ghidra/Hopper. تحلیل کرش ELF native x64 Linux: pwntools.

**macOS اجازه Automation می‌خواهد (Hopper)**
System Settings → Privacy & Security → Automation → به اپی که REA را راه‌اندازی می‌کند اجازه دهید، دوباره تلاش کنید.

**اولین اجرای Hopper**
قبل از تحلیل بدون نظارت، انتخاب حالت demo در برابر فعال‌سازی لایسنس را نهایی کنید.

**`ps` در Linux موجود نیست**
`procps` نصب کنید (Debian/Ubuntu: `sudo apt install procps`)؛ REA برای بررسی مالکیت پروسه‌ها به آن نیاز دارد.

**باگ پیدا کردید؟**
REA را به‌روزرسانی، راه‌اندازی مجدد و دوباره امتحان کنید. سپس issue باز کنید با: نسخه REA، سیستم‌عامل، نوع هدف، مراحل بازتولید، خروجی خطا، نام provider. https://github.com/morluto/rea/issues.

---

## 18. داده، حریم خصوصی و امنیت

- REA اهداف را **روی دستگاه شما** تحلیل می‌کند؛ برنامه شما توسط REA آپلود **نمی‌شود**.
- **ارائه‌دهنده مدل عامل شما** نتایج را دریافت می‌کند — سیاست داده/نگهداری او حاکم است. رازها یا داده‌های مشتری را در prompt نچسبانید.
- اسکیمای ورودی MCP به‌صورت پیش‌فرض فشرده است؛ برای راهنمای کامل فیلدها `REA_MCP_INPUT_SCHEMA_PROFILE=full` را در ثبت MCP تنظیم کنید. اسکیمای خروجی را با `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (یا `off`) محدود کنید.
- ضبط‌های محیط RL ممکن است credentials را در بدنه/سربرگ‌ها نگه دارند — پیش از اشتراک‌گذاری بازبینی کنید. هشدارهای credential-name جاها را نشان می‌دهند؛ مقادیر را **پاک نمی‌کنند**.
- رازهای نوع `APP_PASSWORD` در محیط سرور MCP نگه داشته شوند، نه در چت.
- REA را فقط از `morluto/rea`، `rea.tools` یا npm `rea-agents` نصب کنید.

---

## 19. چک‌لیست مرجع سریع

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] عامل برنامه‌نویسی نصب شده (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (طرح را بازبینی و تأیید کنید)
[ ] کلاینت کاملاً راه‌اندازی مجدد شده
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] اولین بررسی: notes-example.zip  →  notes:export / notes.csv را پیدا کنید
[ ] (اختیاری) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup را دوباره اجرا کنید → عامل را راه‌اندازی مجدد کنید
[ ] (اختیاری) مرورگر: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] قانونی: شما مالک / دارای لایسنس تحلیل هدف هستید
```

---

## 20. پشتیبان / آینه offline (غیررسمی)

> ⚠️ **اول این را بخوانید.**
> چیزی به نام «پشتیبان رسمی» برای پروژه رسمی وجود ندارد. تنها REA رسمی **morluto/rea** (https://github.com/morluto/rea)، **rea.tools** و بسته npm ‏**`rea-agents`** است.
> این repo یک **آینه/بایگانی غیررسمی** کامل و سازگار با لایسنس از پروژه رسمی فراهم می‌کند و لایسنس MIT اصلی و اخطارهای کپی‌رایت را حفظ می‌کند. وجودش برای این است که **اگر repo رسمی، وب‌سایت یا بسته npm رسمی ناپدید شود**، بتوانید REA را از اینجا به دست آورید — همین‌قدر، نه بیشتر.
> تا مادامی که منابع رسمی موجودند، **از آن‌ها استفاده کنید**. این پشتیبان را «رسمی» معرفی نکنید و به‌عنوان «REA رسمی» باز توزیع نکنید. این repo نه وابسته و نه مورد تأیید نویسندگان REA است.

**مجوز:** REA تحت MIT است — کپی، تغییر و توزیع با ذکر اخطار مجاز است. لایسنس کامل، سربرگ‌های کپی‌رایت و اخطارهای شخص ثالث در شاخه آینه و tarball npm هر دو حفظ شده‌اند. هیچ ضمانتی داده نمی‌شود.

### پشتیبان شامل چه چیزهایی است

| بخش پشتیبان | کجا | چیست |
|---|---|---|
| آینه منبع | شاخه **`mirror/rea`** | تاریخچه git کامل `main` رسمی `morluto/rea` (در آخرین sync — v6.9.0، کامیت `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| تگ‌های ریلیز | تگ‌ها **`rea-agents-*.*.*`** | همه تگ‌های ریلیز رسمی، اشاره به کامیت‌های رسمی دقیق (v2.7.0 → v6.9.0) |
| tarball npm | **`backup/rea-agents-6.9.0.tgz`** | بسته npm رسمی، از پیش ساخته‌شده (شامل `dist/`) — نصب **کاملاً offline** |
| اسکریپت همگام‌سازی | **`scripts/sync-backup.ps1`** | شاخه آینه، تگ‌ها و جدیدترین tarball npm را از منابع رسمی تازه می‌کند |
| اسکریپت بازیابی | **`scripts/restore-backup.ps1`** | نصب offline یک‌مرحله‌ای tarball + نمایش مراحل بعدی |
| راهنما | `README.md` (نسخه انگلیسی) | راهنمای کامل راه‌اندازی؛ صرف‌نظر از منبع REA معتبر است |

### پشتیبان را تازه نگه دارید

هر هفته اجرا کنید (یا قبل از اتکا به آن):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

fetch برای `upstream/main` + همه تگ‌ها انجام می‌دهد، `mirror/rea` را با force به‌روز می‌کند، تگ‌ها را push می‌کند، جدیدترین `rea-agents-*.*.*` را با `npm pack` به `backup/` بسته‌بندی می‌کند و دستورات نهایی `git add`/`commit`/`push` برای tarball را چاپ می‌کند.

### سناریوهای بازیابی

**سناریو الف — GitHub از کار افتاده، npm کار می‌کند:** چیزی برای بازیابی نیست. استفاده از `npx rea-agents@latest setup` را ادامه دهید.

**سناریو ب — GitHub + npm هر دو از کار افتاده‌اند:** tarball از پیش ساخته‌شده را از همین repo نصب کنید (بدون شبکه، بدون ابزار build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# یا به‌صورت دستی:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` سرور MCP + مهارت را دقیقاً مثل `npx rea-agents setup` رسمی برای عامل شما ثبت می‌کند — کاملاً offline، بدون دست‌کاری registry.

**سناریو ج — منبع/تاریخچه کامل هم می‌خواهید:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# منبع رسمی کامل در زمان آخرین sync.
```

ساخت از منبع به Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ و دسترسی شبکه به npm registry نیاز دارد (turbo monorepo; `npm ci && npm run build`). مسیر tarball (سناریو ب) به هیچ‌کدام نیاز ندارد — برای بازیابی همیشه آن را ترجیح دهید.

### آنچه بازیابی کرده‌اید را بررسی کنید
```powershell
# یکپارچگی آینه منبع — کامیت باید با upstream/main آخرین sync یکی باشد:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # پس از clone شاخه آینه
# یکپارچگی tarball — نسخه‌ای که خود CLI گزارش می‌دهد:
rea --version
```

اگر hashها با ثبت زمان پشتیبان‌گیری اختلاف داشتند، آن نسخه را مشکوک بدانید و پیش از اعتماد، از منابع رسمی (اگر برگشته‌اند) دوباره sync کنید.

### آنچه این پشتیبان تضمین نمی‌کند

- بدون وصله‌های امنیتی بعد از آخرین sync — پشتیبان رهاشده یک snapshot قدیمی است.
- بسته npm رسمی ممکن است hotfixهای جدیدتری از `mirror/rea` یا tarball داشته باشد.
- سرویس‌های جانبی (وب‌سایت rea.tools، Discord، یادداشت‌های ریلیز، سایت مستندات) مواد مرجع هستند، نه کدی که از اینجا بازیابی شود.
- اگر REA بعداً با نام/مالک دیگری منتشر شود، این snapshot همچنان به‌عنوان upstream بایگانی‌شده کار می‌کند — آگاهانه مهاجرت کنید، سازگاری را فرض نکنید.

---

**لینک‌ها**
- وب‌سایت: https://rea.tools/ · شروع: https://rea.tools/get-started/ · راهنماها: https://rea.tools/guides/
- پرسش‌های متداول: https://rea.tools/faq/ · نمونه‌ها: https://rea.tools/showcases/
- منبع: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- جامعه: Discord (به پانوشت rea.tools ببینید) · X: https://x.com/reatools
- **پشتیبان این repo:** شاخه `mirror/rea` · تگ‌ها `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
