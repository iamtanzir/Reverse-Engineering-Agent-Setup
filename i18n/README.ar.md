# Reverse Engineering Agent — دليل الإعداد الكامل

> **اللغات:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (الأساسية / المعتمدة) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ هذه الترجمة تطابق النسخة الإنجليزية الأصلية. عند أي اختلاف **الإنجليزية هي المرجع**. كتل الشيفرة والمسارات والأوامر لا تُترجم أبدًا.

> **REA — Reverse Engineer Anything**
> خادم MCP (Model Context Protocol) + مهارة تحقيق: يمنح وكيل البرمجة الخاص بك أدوات لفحص البرمجيات — ثنائيات native، تطبيقات JavaScript/Electron، المتصفحات، .NET، Android، البرامج الثابتة والمزيد.

- **الموقع الرسمي:** https://rea.tools/
- **الشيفرة المصدرية الرسمية:** https://github.com/morluto/rea
- **حزمة npm:** `rea-agents`
- **الرخصة:** MIT (لمشروع REA نفسه). أدوات التحليل من جهات خارجية لها رخصها الخاصة.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (بالإنجليزية) — إعداد خطوة بخطوة حسب المنصة (Windows أولًا: Electron، ويب، .NET، Android، WASM، Native/Ghidra، WSL2) مع استكشاف الأخطاء
- **📦 نسخة احتياطية offline مرفقة** — مرآة غير رسمية للريبو الرسمي + tarball npm؛ فقط في حال اختفى المصدر الرسمي. انظر **[القسم 20 — نسخة احتياطية / مرآة offline (غير رسمية)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **مهم:** حمّل REA فقط من `morluto/rea` أو `rea.tools` أو حزمة npm `rea-agents`. الاسم المتشابه للريبو لا يثبت أنه إصدار رسمي.

---

## المحتويات

1. ما هو REA (وما ليس هو)
2. الاستخدام القانوني والمسؤول
3. ماذا يمكنك تحليله
4. متطلبات النظام
5. الخطوة 1 — جهّز حاسوبك
6. الخطوة 2 — اختر وكيل برمجة
7. الخطوة 3 — اربط REA
8. الخطوة 4 — تحقق من التثبيت
9. الخطوة 5 — تحقيقك الأول (مثال Notes)
10. تحليل native (ثنائيات / EXE / DLL)
11. تطبيقات JavaScript & Electron
12. مراقبة المتصفح
13. أهداف أخرى وأدوات مطلوبة
14. بناء بيئات RL
15. استخدام REA من الطرفية (CLI)
16. تحديث أو إزالة REA
17. استكشاف الأخطاء وإصلاحها
18. البيانات والخصوصية والأمان
19. قائمة مرجعية سريعة
20. نسخة احتياطية / مرآة offline (غير رسمية)

---

## 1. ما هو REA (وما ليس هو)

**REA هو:**
- خادم MCP محلي + مهارة وكيل — يتيح **لوكيل البرمجة الخاص بك** فحص البرمجيات الموجودة محليًا.
- يعيد **أدلة**: أسمبلي، pseudocode، خرائط وحدات، أزواج قنوات IPC، حركة مرور شبكة ملتقطة، مواقع المصدر — وليس الشيفرة الأصلية.
- التحليل يعمل **على جهازك**. تطبيقك لا يُرفع عبر REA؛ مزوّد نموذج الوكيل الخاص بك يرى النتائج (انظر [البيانات والخصوصية](#18-data-privacy--security)).

**REA ليس:**
- زرًا سحريًا «إرجاع الكود الأصلي». النتائج هي أسمبلي/pseudocode ومراجع؛ الوكيل يشرح ويساعدك على إعادة بناء السلوك.
- أداة لكسر التراخيص/DRM أو تجاوز التفعيل المدفوع. لا تستخدمه لذلك.
- التفافًا على التعمية (obfuscation). الأهداف المحزّمة/المحمية بقوة (VMProtect، Themida، مقاومة العبث) تبقى صعبة للغاية.
- وصولًا لجهة الخادم. لا يمكنه فحص خادم خلف API؛ فقط جهة العميل/الشبكة مرئية.

---

## 2. الاستخدام القانوني والمسؤول

الهندسة العكسية قد تكون قانونية للتشغيل البيني، أبحاث الأمن، التنقيح وتحليل برمجيات تملكها — لكن القوانين والرخص تختلف حسب الدولة.

**يجب عليك:**
- تحليل برمجيات تملكها، أو مرخّصة لك، أو لديك إذن بفحصها.
- احترام اتفاقيات الترخيص وشروط الخدمة وقواعد DMCA لمكافحة الالتفاف.
- استخدام النتائج للتشغيل البيني والتعليم والأمن الدفاعي.

**يجب ألا:**
- تلتف على DRM أو تفعيل الترخيص أو الحماية من النسخ.
- توزع كودًا مكسورًا/مسرّبًا لبرمجيات مملوكة.
- تحلل أهدافًا لا تملك حق امتلاكها أو فحصها.

هذا الدليل ليس استشارة قانونية. عند الشك استشر محاميًا.

---

## 3. ماذا يمكنك تحليله

| الهدف | ما يعيده REA | هل يلزم محرك native؟ |
|---|---|---|
| ثنائيات/مكتبات native (EXE، DLL، ELF، Mach-O) | دوال، أسمبلي، pseudocode، المستدعون، xrefs، ثوابت | نعم — Hopper أو Ghidra أو IDA |
| تطبيقات JavaScript & Electron | وحدات، imports، قنوات IPC + معالجات، مواقع المصدر | لا |
| صفحات المتصفح (runtime) | طلبات/استجابات، سكربتات، أشكال أجسام JSON، نافذة مراقبة | متصفح عائلة Chrome |
| تجميعات .NET / Flutter / حزم | فحص الوحدات والموارد | لا |
| Android APK / أجهزة / موارد | أصناف مفكوكة، موارد، تفاعل مع الأجهزة | JADX / adb / Apktool |
| Firmware | أنظمة ملفات/blobs مستخرجة | Binwalk / Unblob (Linux) |
| WASM | فحص الوحدات والدوال | WABT |
| قواعد SQLite | فحص المخطط والاستعلامات | Node.js 24.15+ / 26+ |
| EVM bytecode | بنية العقد | Node.js (Linux x64) |
| التقاطات HAR / SAZ / mitmproxy | أدلة حركة مرور محللة | Node.js / mitmdump |
| PCAP / PCAPNG | حقائق الحزم/البروتوكولات | TShark / capinfos (Linux) |

---

## 4. متطلبات النظام

**الحد الأدنى:**
- Node.js **22.23.4+** أو **24.22.1+** أو **26+ (>= 26.12.1)** (npm متضمن)
- وكيل برمجة مدعوم (الخطوة 2)
- مجلد عمل لتحقيقاتك

**للتحليل native (الثنائي)** — واحد من:
- **Ghidra 12.1.x** + **JDK 21+** 64-بت (مجاني، موصى به على Windows)
- **IDA** (تجاري؛ ملفات تعريف Windows legacy GUI + headless supervisor موثقة)
- **Hopper** (تجاري؛ macOS وبعض Linux — **غير متاح على Windows**)

**ملاحظات النظام:**
- Windows: استخدم **PowerShell**؛ ضع المسارات التي تحتوي مسافات بين علامتي اقتباس. إن كان الوكيل يعمل داخل WSL، ثبّت Node.js + REA **داخل** WSL واستخدم مسارات Linux.
- Linux: يجب أن يكون `ps` المتوافق مع `procps` على `PATH` (لتشغيل Ghidra/JADX/firmware وللتحليل الساكن).
- macOS: استخدم Terminal؛ بعض الخطوات تتطلب Xcode Command Line Tools (بناء مفكك Ghidra على arm64).

---

## 5. الخطوة 1 — جهّز حاسوبك

### 5.1 تحقق من Node.js

```powershell
node -v
npm -v
```

المتوقع: `v22.23.4+` أو `v24.22.1+` أو `v26.12.1+`. أقدم → ثبّت Node.js 24 LTS.

### 5.2 ثبّت Node.js على Windows (إن لم يكن موجودًا)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

اكتب `Y` إذا طُلب منك قبول الشروط، أغلق وافتح PowerShell مجددًا، تحقق من `node -v`. (بديل: نزّل مثبّت LTS من https://nodejs.org/.)

> **خصوصية PowerShell:** إذا فشل `npx` مع «running scripts is disabled on this system»، استخدم `npx.cmd` و `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

نزّل ملف `.pkg` الخاص بـ Node.js 24 LTS، أو عبر Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# أعد فتح الطرفية، ثم:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 أنشئ مجلد عمل

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. الخطوة 2 — اختر وكيل برمجة

يدعم REA أي وكيل يتحدث **MCP** محلي. اختر واحدًا — كل الأمثلة تستخدم **setup ID** الخاص بالعميل (`--client <id>`).

| العميل | Setup ID | التثبيت / ملاحظات |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | ثبّت التطبيق وسجّل الدخول، ثم `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` أو سكربت التثبيت · تسجيل الدخول بـ ChatGPT |
| Cursor | `cursor` | ثبّت المحرر، افتح مجلد العمل، وضع Agent |
| Windsurf | `windsurf` | نفس النمط؛ دردشة الوكيل |
| VS Code | `vscode` | أعد GitHub Copilot أولًا، ثم وضع Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`، شغّل `opencode`، `/connect` للنموذج، ثم `--client opencode` |
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

**Grok Bot:** اطلب من البوت في محادثته أن يضيف خادم MCP مخصصًا باسم `rea` على حاسوبه المستضاف:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. الخطوة 3 — اربط REA

### الخيار أ — دع وكيلك يقوم بذلك (موصى به)

الصق في محادثة الوكيل:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

ينفذ الوكيل setup، يعرض الخطة، ويطبقها بعد موافقتك.

### الخيار ب — شغّل setup بنفسك

```powershell
npx rea-agents@latest setup
```

لعميل محدد:

```powershell
npx rea-agents@latest setup --client opencode
```

أثناء setup:
- **الأسهم** للتحرك، **Space** للاختيار، **Enter** للمتابعة.
- يضيف REA **اتصال MCP** + **مهارة التحقيق**، و**ينسخ احتياطيًا** الإعداد الحالي قبل التغيير.
- التغييرات تُطبق فقط بعد موافقتك.
- في التمرين الأول يمكن تخطي تثبيت Hopper الاختياري.

### أعد تشغيل العميل بعد setup

- تطبيقات سطح المكتب (Claude Desktop, Cursor, Windsurf, VS Code): **اخرج تمامًا** وأعد الفتح (Windows: أيضًا من أيقونة علبة النظام).
- وكلاء الطرفية (Claude Code, Codex, Gemini CLI, OpenCode): أنهِ الجلسة وابدأ من جديد.

---

## 8. الخطوة 4 — تحقق من التثبيت

شغّل فحص doctor لعميلك (استبدل `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

تقرير سليم يعرض `"healthy": true`. ثم اسأل الوكيل:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. الخطوة 5 — تحقيقك الأول (مثال Notes)

المثال الرسمي تطبيق Electron صغير فيه زر **Export notes**. لا حاجة لتثبيت Electron — الوكيل يقرأ الكود.

الصق في وكيلك:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

النتيجة المتوقعة: النقر على Export يرسل رسالة IPC ‏`notes:export`؛ تهيئة الرئيسي تشكل الملاحظات كـ CSV وتكتب `notes.csv` (الأعمدة: `id`، `title`) في مجلد Downloads.

التحليل اليدوي من الطرفية:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. تحليل native (ثنائيات / EXE / DLL)

التحليل native العميق يحتاج مزودًا. على **Windows** استخدم **Ghidra** أو **IDA** (Hopper غير متاح على Windows).

### 10.1 Ghidra (مجاني) — إعداد Windows

1. ثبّت **JDK 64-بت 21 أو أحدث** (مع المترجم). تحقق:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. نزّل **Ghidra 12.1.4** من قائمة *Assets* الخاصة بالإصدار وفك ضغط `ghidra_…_PUBLIC_….zip` (أرشيف الإصدار، **وليس** «Source code»).
3. احفظ المجلد المفكوك الذي يحتوي `ghidraRun.bat` — إنه `GHIDRA_INSTALL_DIR` الخاص بك.
4. في PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # المجلد الذي تشير إليه java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   عدّل المسارات حسب تثبيتك. راجع خطة setup المحدثة، وافق، و**أعد تشغيل الوكيل**.

> دعم Ghidra على Windows **تجريبي، للقراءة فقط**، لتطبيقات/DLLs PE x86/x64 native على أقراص **NTFS** محلية ثابتة.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

على macOS arm64 و Linux arm64، ابنِ مفكك Ghidra native أولًا (macOS يتطلب Xcode Command Line Tools، make، bison).

### 10.3 IDA

1. ثبّت وأعد upstream IDA MCP حسب دليل مزود IDA.
2. احفظ التسجيل الفعال باسم `ida-mcp.json`. مثال (headless supervisor مع `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   للسيرفر GUI legacy 1.4.0 المتصل، انسخ command/args/env الفعالة الخاصة به (افتح الثنائي في IDA وابدأ الإضافة أولًا).
3. اتصل:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   على macOS/Linux استخدم `export` بدل `$env:`. أعد تشغيل الوكيل بعد setup.

> ملفات تعريف IDA الموثقة: Windows legacy GUI و headless supervisor، إضافة إلى macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 لا يشمل ملف تعريف headless لـ macOS / جسر GUI native — تتطلب بناء REA من المصدر.

### 10.4 Hopper (macOS / Linux فقط)

يمكن لـ setup اكتشاف Hopper الموجود أو اقتراح خطة تثبيت. على macOS، عند أول تشغيل اختر وضع demo أو فعّل رخصتك. التثبيت التلقائي على Linux يتطلب x86_64 و Ubuntu 24.04+، Fedora 41+، Nobara 44+، Arch، CachyOS أو Omarchy. على Linux arm64 استخدم Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 استخدام مزود

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

تحليل دالة واحدة من CLI (Ghidra يجب أن يكون مُعدًّا):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. تطبيقات JavaScript & Electron

لا حاجة لمحرك native. وجّه الوكيل إلى **مجلد** التطبيق أو **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

أين تخزن تطبيقات Electron ملف `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: غالبًا `/opt/<App>/resources/app.asar`

التحليل الساكن من الطرفية:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

راجع `normalized_result.summary.ipc` للقنوات/المعالجات المطابقة و `normalized_result.graph` لمواقع المصدر. أسماء القنوات المحسوبة قد تبقى غير محلولة — عندها استخدم مراقبة المتصفح (القسم التالي).

---

## 12. مراقبة المتصفح

1. افتح الصفحة الهدف بمتصفح عائلة Chrome مع التنقيح عن بُعد، مثلًا:

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

2. اسأل الوكيل:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   أعطه endpoint ‏`http://127.0.0.1:9222` ورابط الصفحة. ابدأ الالتقاط **قبل** النقر.

   أو من الطرفية:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

لأجسام HTTP، يمكن لصادرات Fiddler Everywhere (SAZ/HAR 1.2) أن تغذي REA capture Evidence، أو اربط خادم MCP الخاص بـ Everywhere.

---

## 13. أهداف أخرى وأدوات مطلوبة

| الهدف | الأدوات | ملاحظات |
|---|---|---|
| JavaScript / Electron | Node.js + npm | بدون محرك |
| موقع ويب | Chrome / Chromium / Edge | منفذ التنقيح عن بُعد |
| .NET / Flutter / حزم | Node.js + npm | فحص ساكن |
| Android APK | JADX + JDK 17+ | فك تجميع `classes.dex` |
| جهاز Android | adb | فعّل تنقيخ USB |
| موارد Android | Apktool + Java | يفك الموارد والـ manifest |
| مشروع JEB | JEB + MCP | مفكك تجاري |
| Firmware | Binwalk / Unblob | **Linux فقط** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| قاعدة SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Linux x64 فقط** |
| ELF / أعطال Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | تحليل offline للالتقاطات |
| PCAP / PCAPNG | TShark / capinfos | **Linux فقط** |
| إشارات منطقية | sigrok-cli | **Linux فقط** |
| سلوك العمليات | PTY | **Linux / macOS** |

Flutter والحزم/الموارد و EVM ودلائل التحقيق الكاملة: https://rea.tools/guides.

---

## 14. بناء بيئات RL

يمكن لـ REA تسجيل جلسة تطبيق ويب اختباري وتصدير بيئة **AgentEnv** لتدريب/تقييم الوكلاء.

1. جهّز نسخة **اختبار** من التطبيق يستطيع الوكيل فيها إنشاء/تعديل/حذف البيانات.
2. اسأل وكيلك (مثال المجلدات):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   أبقِ كلمة المرور في بيئة خادم MCP (`APP_PASSWORD`)، لا في الموجّه.
3. أو ابنِ مباشرة من تسجيل HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   ‏`--dry-run` للاطلاع على التقرير دون كتابة ملفات.
4. شغّل:
   ```bash
   agent-env run ./my-env
   ```
   فحص توافق REA يستخدم **AgentEnv 0.9.1334 + Python 3.12**؛ يجب أن يعمل Docker.
5. فقط العمليات التي **سُجلت آثارها** مدعومة (مثلًا الحذف يتطلب استجابة «العنصر مفقود» والقائمة المحدثة). قبل المشاركة، راجع أجسام الاستجابات المحتفظ بها — قد تحتوي بيانات اعتماد.

---

## 15. استخدام REA من الطرفية (CLI)

دون تثبيت عام:

```powershell
npx -y rea-agents@latest --help
```

تثبيت أمر `rea` دائمًا:

```powershell
npm install --global rea-agents
rea --help
rea update
```

مثبّت curl لـ macOS / Linux (يتطلب Node.js أولًا):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

أوامر شائعة:

| الأمر | الغرض |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | خريطة الوحدات، imports، IPC، الحدود |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | تحليل دالة native واحدة |
| `rea-agents list-browser-targets <endpoint> --json` | سرد صفحات المتصفح القابلة للتنقيح |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | مراقبة شبكة/سكربتات الصفحة |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | بناء بيئة RL |
| `rea-agents environment-compare … --json` | مقارنة البيئة بالتطبيق الفعلي |
| `rea-agents doctor --client <id> --json` | فحص اتصال العميل |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | فحص مزود native |
| `rea-agents update` | تحديث CLI |
| `rea-agents uninstall` | إزالة إعداد عميل REA + المهارة |

---

## 16. تحديث أو إزالة REA

**التحديث:**
```powershell
rea update                       # إن كان CLI العام مثبتًا
npx rea-agents@latest setup      # تجديد اتصال الوكيل + المهارة؛ وافق على الخطة، أعد تشغيل الوكيل
```

**الإزالة:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. استكشاف الأخطاء وإصلاحها

**الوكيل لا يرى أدوات REA**
1. أعد تشغيل/ربط العميل بالكامل (بما في ذلك أيقونة علبة النظام).
2. `npx -y rea-agents@latest doctor --client <id> --json` — إن كان التسجيل مفقودًا/قديمًا: `npx rea-agents@latest setup --client <id>`، ثم أعد التشغيل.
3. ما زال غير مرئي: تحقق من خطأ اتصال MCP في العميل؛ في المحررات فعّل REA في إعدادات MCP وامنحها الإذن.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
استخدم `npx.cmd` / `npm.cmd` أو `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**مسارات بمسافات**
بين علامتي اقتباس: `"D:/my apps/tool.exe"`. في WSL، استخدم مسارات Linux وثبّت REA داخل WSL.

**قيود Ghidra على Windows**
تجريبية، للقراءة فقط، PE x86/x64 فقط، أقراص NTFS محلية ثابتة. بديل Linux: Ghidra/Hopper. تحليل أعطال ELF native x64 Linux: pwntools.

**macOS يطلب إذن أتمتة (Hopper)**
System Settings → Privacy & Security → Automation → اسمح للتطبيق الذي يشغّل REA، حاول مجددًا.

**أول تشغيل لـ Hopper**
أكمل اختيار وضع demo مقابل تفعيل الرخصة قبل التحليل بدون إشراف.

**لا يوجد `ps` على Linux**
ثبّت `procps` (Debian/Ubuntu: `sudo apt install procps`)؛ يحتاجها REA لفحوص ملكية العمليات.

**وجدت خطأ؟**
حدّث REA، أعد التشغيل، حاول مجددًا. ثم افتح issue مع: إصدار REA، النظام، نوع الهدف، خطوات إعادة الإنتاج، مخرجات الخطأ، اسم المزود. https://github.com/morluto/rea/issues.

---

## 18. البيانات والخصوصية والأمان

- يحلل REA الأهداف **على جهازك**؛ تطبيقك **لا** يرفعه REA.
- **مزوّد نموذج الوكيل** يتلقى النتائج — سياسات بياناته/احتفاظه تنطبق. لا تلصق أسرارًا أو بيانات عملاء في الموجّهات.
- مخططات إدخال MCP مدمجة افتراضيًا؛ اضبط `REA_MCP_INPUT_SCHEMA_PROFILE=full` في تسجيل MCP لإرشاد كامل للحقول. يمكن تحديد مخططات الإخراج عبر `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (أو `off`).
- تسجيلات بيئات RL قد تحتفظ ببيانات اعتماد في الأجسام/الترويسات — راجع قبل المشاركة. تحذيرات credential-name تحدد الأماكن؛ هي **لا تزيل** القيم.
- أسرار من نوع `APP_PASSWORD` تذهب لبيئة خادم MCP، لا للمحادثة.
- ثبّت REA فقط من `morluto/rea` أو `rea.tools` أو npm `rea-agents`.

---

## 19. قائمة مرجعية سريعة

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] وكيل برمجة مثبت (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (راجع ووافق على الخطة)
[ ] أُعيد تشغيل العميل بالكامل
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] التحقيق الأول: notes-example.zip  →  جد notes:export / notes.csv
[ ] (اختياري) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → أعد setup → أعد تشغيل الوكيل
[ ] (اختياري) متصفح: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] قانوني: أنت تملك / مرخّص لك بتحليل الهدف
```

---

## 20. نسخة احتياطية / مرآة offline (غير رسمية)

> ⚠️ **اقرأ هذا أولًا.**
> لا يوجد شيء اسمه «نسخة احتياطية رسمية» لمشروع رسمي. REA الرسمية الوحيدة هي **morluto/rea** (https://github.com/morluto/rea) و **rea.tools** وحزمة npm ‏**`rea-agents`**.
> هذا الريبو يوفر **مرآة/أرشيفًا غير رسمي** كاملًا ومتوافقًا مع الرخصة، مع الحفاظ على رخصة MIT الأصلية وإشعارات حقوق النشر. إنه موجود حتى **إذا اختفى الريبو الرسمي أو الموقع أو حزمة npm الرسمية**، يمكنك الحصول على REA من هنا — لا أكثر.
> ما دامت المصادر الرسمية موجودة، **استخدمها**. لا تعرض هذه النسخة كـ«رسمية» ولا تعد توزيعها بوصفها «REA الرسمي». هذا الريبو غير منتسب ولا مُقر من مؤلفي REA.

**الرخصة:** REA مرخّصة بـ MIT — تسمح بالنسخ والتعديل والتوزيع مع الإشعار. الرخصة الكاملة ورؤوس حقوق النشر وإشعارات الطرف الثالث محفوظة في فرع المرآة وفي tarball npm. لا تُمنح أي ضمانات.

### ماذا تتضمن النسخة الاحتياطية

| الجزء | أين | ما هو |
|---|---|---|
| مرآة المصدر | الفرع **`mirror/rea`** | تاريخ git كامل لـ `main` الرسمي في `morluto/rea` (وقت آخر مزامنة — v6.9.0، الالتزام `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| وسوم الإصدارات | الوسوم **`rea-agents-*.*.*`** | كل وسوم الإصدارات الرسمية، تشّير إلى الالتزامات الرسمية الدقيقة (v2.7.0 → v6.9.0) |
| tarball npm | **`backup/rea-agents-6.9.0.tgz`** | حزمة npm الرسمية مُجمّعة مسبقًا (تشمل `dist/`) — تثبيت **offline بالكامل** |
| سكربت المزامنة | **`scripts/sync-backup.ps1`** | يحدّث فرع المرآة والوسوم وأحدث tarball npm من المصادر الرسمية |
| سكربت الاستعادة | **`scripts/restore-backup.ps1`** | تثبيت offline بنقرة واحدة للـ tarball + الخطوات التالية |
| الدليل | `README.md` (الإنجليزية الأصلية) | دليل إعداد كامل؛ صالح أيًّا كان مصدر REA |

### حافظ على النسخة محدثة

شغّله أسبوعيًا (أو قبل أن تعتمد عليه):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

يجرّي fetch لـ `upstream/main` + كل الوسوم، ويحدّث `mirror/rea` قسرًا، ويدفع الوسوم، ويحزم أحدث `rea-agents-*.*.*` إلى `backup/` عبر `npm pack`، ويطبع أوامر `git add`/`commit`/`push` الأخيرة للـ tarball.

### سيناريوهات الاستعادة

**السيناريو أ — GitHub معطل، npm يعمل:** لا شيء للاستعادة. واصل `npx rea-agents@latest setup`.

**السيناريو ب — GitHub + npm معطلان:** ثبّت الـ tarball المُجمّع مسبقًا من هذا الريبو (بلا شبكة، بلا أدوات بناء):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# أو يدويًا:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
يسجّل `rea setup` خادم MCP + المهارة لدى وكيلك تمامًا كما يفعل `npx rea-agents setup` الرسمي — offline تمامًا، دون لمس الـ registry.

**السيناريو ج — تريد أيضًا المصدر/التاريخ كاملًا:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# المصدر الرسمي الكامل وقت آخر مزامنة.
```

البناء من المصدر يتطلب Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ ووصول شبكة إلى npm registry (turbo monorepo; `npm ci && npm run build`). مسار الـ tarball (السيناريو ب) لا يتطلب أيًّا منهما — فضّله دائمًا للاستعادة.

### تحقق مما استعدته
```powershell
# سلامة مرآة المصدر — يجب أن يطابق الالتزام upstream/main وقت آخر مزامنة:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # بعد استنساخ فرع المرآة
# سلامة الـ tarball — الإصدار الذي تعلنه CLI نفسها:
rea --version
```

إذا انحرفت hashes عن المسجلة وقت النسخ، اعتبر النسخة مشبوهة وأعد المزامنة من المصادر الرسمية (إن عادت) قبل الوثوق بها.

### ما لا تضمنه هذه النسخة

- لا رقع أمنية بعد آخر مزامنة — نسخة مهجورة هي لقطة قديمة.
- قد تحمل حزمة npm الرسمية إصلاحات أحدث من `mirror/rea` أو الـ tarball.
- الخدمات المرافقة (موقع rea.tools، Discord، ملاحظات الإصدارات، موقع التوثيق) مواد مرجعية، ليست كودًا يُستعاد من هنا.
- إذا أعيد إصدار REA لاحقًا باسم/مالك مختلف، تبقى هذه اللقطة تعمل كـ upstream مؤرشف — هاجر بوعي، لا تفترض التوافق.

---

**روابط**
- الموقع: https://rea.tools/ · البدء: https://rea.tools/get-started/ · الأدلة: https://rea.tools/guides/
- الأسئلة الشائعة: https://rea.tools/faq/ · العروض: https://rea.tools/showcases/
- المصدر: https://github.com/morluto/rea (MIT) · المشكلات: https://github.com/morluto/rea/issues
- المجتمع: Discord (انظر تذييل rea.tools) · X: https://x.com/reatools
- **نسخة هذا الريبو:** الفرع `mirror/rea` · الوسوم `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
