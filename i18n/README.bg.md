<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — Пълно ръководство за инсталация

> **Езици:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Този превод съответства на английския оригинал. При разминаване **английският е меродавен**. Блоковете код, пътищата и командите никога не се превеждат.

> **REA — Reverse Engineer Anything**
> MCP (Model Context Protocol) сървър + способност за разследване: дава на вашия кодинг агент инструменти за инспектиране на софтуер — native двоични файлове, JavaScript/Electron приложения, браузъри, .NET, Android, firmware и др.

- **Официален уебсайт:** https://rea.tools/
- **Официален код:** https://github.com/morluto/rea
- **npm пакет:** `rea-agents`
- **Лиценз:** MIT (самият REA). Инструментите за анализ на трети страни имат собствени лицензи.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (на английски) — настройка стъпка по стъпка за всяка платформа (първо Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) с отстраняване на проблеми
- **📦 Включено offline копие** — неофициално огледало на официалното repo + npm tarball; само ако официалните източници изчезнат. Вижте **[Раздел 20 — Offline копие / огледало (неофициално)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Важно:** Изтегляйте REA само от `morluto/rea`, `rea.tools` или npm пакета `rea-agents`. Подобно име на repo не доказва официално издание.

---

## Съдържание

1. Какво е REA (и какво не е)
2. Законна и отговорна употреба
3. Какво можете да анализирате
4. Системни изисквания
5. Стъпка 1 — Подгответе компютъра
6. Стъпка 2 — Изберете кодинг агент
7. Стъпка 3 — Свържете REA
8. Стъпка 4 — Проверете инсталацията
9. Стъпка 5 — Вашето първо разследване (пример Notes)
10. Native анализ (двоични / EXE / DLL)
11. JavaScript & Electron приложения
12. Наблюдение на браузъра
13. Други целеви обекти и нужни инструменти
14. Изграждане на RL среди
15. Използване на REA от терминала (CLI)
16. Актуализиране или премахване на REA
17. Отстраняване на неизправности
18. Данни, поверителност и сигурност
19. Контролен списък за бърза справка
20. Offline копие / огледало (неофициално)

---

## 1. Какво е REA (и какво не е)

**REA е:**
- Локален MCP сървър + способност на агента — позволява на **вашия кодинг агент** да инспектира софтуер, който имате локално.
- Връща **доказателства**: асемблер, псевдокод, карти на модули, двойки IPC канали, заловен мрежов трафик, локации на изходния код — не оригиналния код.
- Анализът се изпълнява **на вашата машина**. Вашето приложение не се качва от REA; доставчикът на модела на вашия агент вижда резултатите (виж [Данни и поверителност](#18-data-privacy--security)).

**REA не е:**
- Магически бутон „върни към изходен код". Резултатите са асемблер/псевдокод и препратки; агентът обяснява и ви помага да възстановите поведението.
- Инструмент за разбиване на лицензи/DRM или заобикаляне на платено активиране. Не го използвайте за това.
- Заобикаляне на обфускация. Силно опаковани/защитени цели (VMProtect, Themida, anti-tamper) остават изключително трудни.
- Достъп до сървърната страна. Сървър зад API не може да се инспектира; само клиентската/мрежовата страна е видима.

---

## 2. Законна и отговорна употреба

Обратното инженерство може да е законно за оперативна съвместимост, изследвания по сигурността, отстраняване на грешки и анализ на софтуер, който **притежавате** — но законите и лицензите се различават по юрисдикция.

**Трябва да:**
- Анализирате софтуер, който притежавате, имате лиценз да използвате или разрешение да инспектирате.
- Зачитате лицензионните споразумения, Условията на услугата и правилата DMCA anti-circumvention.
- Използвате резултатите за оперативна съвместимост, образование и защитна сигурност.

**Не трябва да:**
- Заобикаляте DRM, активиране на лиценза или защита срещу копиране.
- Разпространявате разбит/изтекъл код на собствен софтуер.
- Анализирате цели, за които нямате права да притежавате или инспектирате.

Това ръководство не е юридически съвет. При съмнение се консултирайте с адвокат.

---

## 3. Какво можете да анализирате

| Цел | Какво връща REA | Нужна ли е native машина? |
|---|---|---|
| Native двоични / библиотеки (EXE, DLL, ELF, Mach-O) | Функции, асемблер, псевдокод, извикващи, xrefs, константи | Да — Hopper, Ghidra или IDA |
| JavaScript & Electron приложения | Модули, imports, IPC канали + handlers, локации на източника | Не |
| Страници на браузъра (runtime) | Заявки/отговори, скриптове, форми на JSON тела, прозорец за наблюдение | Браузър от семейството Chrome |
| .NET assembly-та / Flutter / пакети | Инспекция на модули и ресурси | Не |
| Android APK / устройства / ресурси | Декомпилирани класове, ресурси, взаимодействие с устройства | JADX / adb / Apktool |
| Firmware | Извлечени файлови системи/blobs | Binwalk / Unblob (Linux) |
| WASM | Инспекция на модули и функции | WABT |
| SQLite бази данни | Инспекция на схема и заявки | Node.js 24.15+ / 26+ |
| EVM bytecode | Структура на контракта | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy записи | Анализирани доказателства за трафик | Node.js / mitmdump |
| PCAP / PCAPNG | Факти за пакети/протоколи | TShark / capinfos (Linux) |

---

## 4. Системни изисквания

**Минимум:**
- Node.js **22.23.4+**, **24.22.1+** или **26+ (>= 26.12.1)** (с npm)
- Поддържан кодинг агент (стъпка 2)
- Работна директория за разследванията ви

**За native (двоичен) анализ** — едно от:
- **Ghidra 12.1.x** + 64-битов **JDK 21+** (безплатно, препоръчително за Windows)
- **IDA** (търговска; проверени профили Windows legacy GUI + headless supervisor)
- **Hopper** (търговска; macOS и част от Linux — **недостъпна за Windows**)

**Бележки по ОС:**
- Windows: използвайте **PowerShell**; оградете пътища с интервали в кавички. Ако агентът ви работи във WSL, инсталирайте Node.js + REA **вътре** във WSL и използвайте Linux пътища.
- Linux: `ps`, съвместим с `procps`, трябва да е в `PATH` (за стартиране на Ghidra/JADX/firmware и статичен анализ).
- macOS: използвайте Terminal; някои стъпки изискват Xcode Command Line Tools (компилиране на декомпилатора на Ghidra на arm64).

---

## 5. Стъпка 1 — Подгответе компютъра

### 5.1 Проверете Node.js

```powershell
node -v
npm -v
```

Очаквано: `v22.23.4+`, `v24.22.1+` или `v26.12.1+`. По-стара → инсталирайте Node.js 24 LTS.

### 5.2 Инсталирайте Node.js на Windows (ако липсва)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Въведете `Y`, ако бъдете помолени да приемете условията, затворете и отворете отново PowerShell и проверете `node -v`. (Алтернатива: изтеглете LTS инсталатора от https://nodejs.org/.)

> **Особеност на PowerShell:** ако `npx` се провали с „running scripts is disabled on this system", използвайте `npx.cmd` и `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Изтеглете `.pkg` файла на Node.js 24 LTS или с Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# отворете отново shell-а, след това:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Създайте работна папка

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Стъпка 2 — Изберете кодинг агент

REA поддържа всеки агент, който говори локален **MCP**. Изберете един — всички примери използват **setup ID** на клиента (`--client <id>`).

| Клиент | Setup ID | Инсталация / бележки |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Инсталирайте приложението, влезте, след това `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` или инсталационен скрипт · вход с ChatGPT |
| Cursor | `cursor` | Инсталирайте редактора, отворете работната папка, режим Agent |
| Windsurf | `windsurf` | Същият модел; чат на агента |
| VS Code | `vscode` | Първо настройте GitHub Copilot, после режим Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, стартирайте `opencode`, `/connect` за модела, след това `--client opencode` |
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

**Grok Bot:** в чата на бота го помолете да добави персонализиран MCP сървър с име `rea` на своя хостван компютър:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Стъпка 3 — Свържете REA

### Вариант A — Оставете агента да го направи (препоръчително)

Поставете в чата на агента:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Агентът изпълнява setup, показва плана и го прилага след одобрението ви.

### Вариант B — Изпълнете setup сами

```powershell
npx rea-agents@latest setup
```

За конкретен клиент:

```powershell
npx rea-agents@latest setup --client opencode
```

По време на setup:
- **Стрелки** за преместване, **Space** за избор, **Enter** за продължаване.
- REA добавя **MCP връзка** + **способност за разследване** и прави **резервно копие** на съществуващата конфигурация преди промяна.
- Промените се прилагат едва след одобрението ви.
- При първото упражнение инсталацията на Hopper може да бъде пропусната.

### Рестартирайте клиента след setup

- Десктоп приложения (Claude Desktop, Cursor, Windsurf, VS Code): **излезте напълно** и отворете отново (Windows: и от иконата в системния трей).
- Терминални агенти (Claude Code, Codex, Gemini CLI, OpenCode): затворете сесията и стартирайте отново.

---

## 8. Стъпка 4 — Проверете инсталацията

Изпълнете проверката doctor за вашия клиент (заменете `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Здравият отчет показва `"healthy": true`. После попитайте агента:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Стъпка 5 — Вашето първо разследване (пример Notes)

Официалният пример е малко Electron приложение с бутон **Export notes**. Не е нужно да инсталирате Electron — агентът чете кода.

Поставете в агента:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Очакван резултат: клик върху Export изпраща IPC съобщение `notes:export`; главният процес форматира бележките като CSV и записва `notes.csv` (колони: `id`, `title`) в папката Изтеглени.

Ръчен анализ от терминала:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native анализ (двоични / EXE / DLL)

Дълбокият native анализ изисква доставчик. На **Windows** използвайте **Ghidra** или **IDA** (Hopper не е налична за Windows).

### 10.1 Ghidra (безплатно) — настройка за Windows

1. Инсталирайте **64-битов JDK 21 или по-нов** (с компилатор). Проверете:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Изтеглете **Ghidra 12.1.4** от списъка *Assets* на изданието и разархивирайте `ghidra_…_PUBLIC_….zip` (архивът на изданието, **не** „Source code").
3. Запишете разархивираната папка с `ghidraRun.bat` — тя е вашият `GHIDRA_INSTALL_DIR`.
4. В PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # папката, посочена от java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Настройте пътищата спрямо инсталацията си. Прегледайте актуализирания план на setup, одобрете и **рестартирайте агента**.

> Поддръжката на Ghidra в Windows е **експериментална, само за четене**, за native x86/x64 PE приложения и DLL-и на локални **NTFS** дискове.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

На macOS arm64 и Linux arm64 първо компилирайте native декомпилатора на Ghidra (macOS изисква Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Инсталирайте и конфигурирайте upstream MCP сървъра на IDA според ръководството на доставчика на IDA.
2. Запазете работещата регистрация като `ida-mcp.json`. Пример (headless supervisor с `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   За свързан legacy 1.4.0 GUI сървър копирайте неговия работещ command/args/env (първо отворете двоичния файл в IDA и стартирайте плъгина).
3. Свържете:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   На macOS/Linux използвайте `export` вместо `$env:`. Рестартирайте агента след setup.

> Проверени профили IDA: Windows legacy GUI и headless supervisor, плюс macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 не включва профила headless за macOS / native GUI мост — изискват build на REA от източника.

### 10.4 Hopper (само macOS / Linux)

Setup може да открие съществуваща Hopper инсталация или да предложи план. На macOS при първо стартиране изберете демо режим или активирайте лиценза си. Автоматичната инсталация на Linux изисква x86_64 и Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS или Omarchy. На Linux arm64 използвайте Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Използване на доставчик

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Еднократен анализ на функция от CLI (Ghidra трябва да е конфигуриран):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron приложения

Не е нужна native машина. Насочете агента към **папката** на приложението или към **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Къде Electron държи `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: често `/opt/<App>/resources/app.asar`

Статичен анализ от терминала:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Вижте `normalized_result.summary.ipc` за съвпаднали канали/handlers и `normalized_result.graph` за локации на източника. Динамично изчислените имена на канали може да останат нерешени — тогава използвайте наблюдението на браузъра (следващият раздел).

---

## 12. Наблюдение на браузъра

1. Отворете целевата страница в браузър от семейството Chrome с отдалечено debugging, напр.:

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

2. Попитайте агента:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Дайте му endpoint-а `http://127.0.0.1:9222` и URL на страницата. Стартирайте заснемането **преди** клика.

   Или от терминала:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

За HTTP тела експортите от Fiddler Everywhere (SAZ/HAR 1.2) могат да подават REA capture Evidence или свържете MCP сървъра на Everywhere.

---

## 13. Други целеви обекти и нужни инструменти

| Цел | Инструменти | Бележки |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Без машина |
| Уебсайт | Chrome / Chromium / Edge | Порт за отдалечено debugging |
| .NET / Flutter / пакети | Node.js + npm | Статична инспекция |
| Android APK | JADX + JDK 17+ | Декомпилиране на `classes.dex` |
| Android устройство | adb | Активирайте USB debugging |
| Android ресурси | Apktool + Java | Разопакова ресурси и манифест |
| JEB проект | JEB + MCP | Търговски декомпилатор |
| Firmware | Binwalk / Unblob | **Само Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite база данни | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Само Linux x64** |
| ELF / crash Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Offline анализ на записи |
| PCAP / PCAPNG | TShark / capinfos | **Само Linux** |
| Логически сигнали | sigrok-cli | **Само Linux** |
| Поведение на процеси | PTY | **Linux / macOS** |

Flutter, пакети/ресурси, EVM и пълни ръководства за разследване: https://rea.tools/guides.

---

## 14. Изграждане на RL среди

REA може да запише сесия на тестово уеб приложение и да експортира среда **AgentEnv** за трениране/оценка на агенти.

1. Подгответе **тестова** инстанция на приложението, в което агентът може да създава/редактира/изтрива данни.
2. Попитайте агента (пример с папки):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Пазете паролата в средата на MCP сървъра (`APP_PASSWORD`), а не в prompt-а.
3. Или изградете директно от HAR запис:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` преглежда отчета без писане на файлове.
4. Стартирайте:
   ```bash
   agent-env run ./my-env
   ```
   Проверката за съвместимост на REA използва **AgentEnv 0.9.1334 + Python 3.12**; Docker трябва да работи.
5. Поддържат се само операции, чиито **ефекти** са записани (напр. изтриването изисква отговор за липсващ елемент и актуализирания списък). Преди споделяне прегледайте запазените тела на отговори — може да съдържат идентификационни данни.

---

## 15. Използване на REA от терминала (CLI)

Без глобална инсталация:

```powershell
npx -y rea-agents@latest --help
```

Постоянна инсталация на командата `rea`:

```powershell
npm install --global rea-agents
rea --help
rea update
```

curl инсталатор за macOS / Linux (изисква Node.js първо):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Често използвани команди:

| Команда | Цел |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Карта на модули, imports, IPC, граници |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Анализ на една native функция |
| `rea-agents list-browser-targets <endpoint> --json` | Списък на страници на браузър за debugging |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Наблюдение на мрежата/скриптовете на страницата |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Изграждане на RL среда |
| `rea-agents environment-compare … --json` | Сравняване на средата с реалното приложение |
| `rea-agents doctor --client <id> --json` | Проверка на връзката на клиента |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Проверка на native доставчика |
| `rea-agents update` | Актуализиране на CLI |
| `rea-agents uninstall` | Премахване на конфигурацията на клиента + способността |

---

## 16. Актуализиране или премахване на REA

**Актуализация:**
```powershell
rea update                       # ако глобалният CLI е инсталиран
npx rea-agents@latest setup      # обновяване на връзката + способността; одобрете плана, рестартирайте агента
```

**Премахване:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Отстраняване на неизправности

**Агентът не вижда инструментите на REA**
1. Рестартирайте/свържете отново клиента изцяло (включително иконата в системния трей).
2. `npx -y rea-agents@latest doctor --client <id> --json` — ако регистрацията липсва/е стара: `npx rea-agents@latest setup --client <id>`, рестартирайте.
3. Все още нищо: проверете грешката на MCP връзката на клиента; в редактори активирайте REA в MCP настройките и ѝ позволете инструментите.

**`npx` — „running scripts is disabled" (Windows PowerShell)**
Използвайте `npx.cmd` / `npm.cmd` или `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Пътища с интервали**
В кавички: `"D:/my apps/tool.exe"`. В WSL, използвайте Linux пътища и инсталирайте REA вътре в WSL.

**Ограничения на Ghidra в Windows**
Експериментално, само за четене, само PE x86/x64, фиксирани локални NTFS дискове. Алтернатива за Linux: Ghidra/Hopper. Анализ на native x64 Linux ELF crash-ове: pwntools.

**macOS иска разрешение за автоматизация (Hopper)**
Системни настройки → Поверителност и сигурност → Автоматизация → разрешете приложението, което стартира REA, опитайте отново.

**Първо стартиране на Hopper**
Завършете избора между демо режим и активиране на лиценза преди несъпровождан анализ.

**Липсва `ps` на Linux**
Инсталирайте `procps` (Debian/Ubuntu: `sudo apt install procps`); REA се нуждае от него за проверките на собствеността на процесите.

**Открихте бъг?**
Актуализирайте REA, рестартирайте, опитайте отново. После отворете issue с: версия на REA, ОС, тип цел, стъпки за възпроизвеждане, изход на грешката, име на доставчика. https://github.com/morluto/rea/issues.

---

## 18. Данни, поверителност и сигурност

- REA анализира целите **на вашата машина**; вашето приложение **не** се качва от REA.
- **Доставчикът на модела на вашия агент** получава резултатите — важи неговата политика за данни/съхранение. Не поставяйте тайни или клиентски данни в prompt-овете.
- Входните схеми на MCP са компактни по подразбиране; задайте `REA_MCP_INPUT_SCHEMA_PROFILE=full` в регистрацията на MCP за пълни указания за полетата. Изходните схеми се ограничават с `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (или `off`).
- Записите на RL среди могат да запазват креденшъли в тела/заглавки — прегледайте преди споделяне. Предупрежденията credential-name посочват местата; те **не премахват** стойности.
- Тайни от типа `APP_PASSWORD` — в средата на MCP сървъра, не в чата.
- Инсталирайте REA само от `morluto/rea`, `rea.tools` или npm `rea-agents`.

---

## 19. Контролен списък за бърза справка

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Кодинг агент инсталиран (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (прегледайте и одобрете плана)
[ ] Клиентът е рестартиран напълно
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Първо разследване: notes-example.zip  →  открийте notes:export / notes.csv
[ ] (По избор) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → пуснете setup отново → рестартирайте агента
[ ] (По избор) Браузър: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Правно: притежавате / лицензирани сте да анализирате целта
```

---

## 20. Offline копие / огледало (неофициално)

> ⚠️ **Прочетете това първо.**
> Не съществува такова нещо като „официално копие" на официален проект. Единственият официален REA е **morluto/rea** (https://github.com/morluto/rea), **rea.tools** и npm пакетът **`rea-agents`**.
> Това repo предоставя пълно, съответстващо на лиценза **неофициално огледало / архив** на официалния проект, със запазване на оригиналния MIT лиценз и уведомленията за авторски права. То съществува, за да можете, **ако официалното repo, сайтът или npm пакетът изчезнат**, да получите REA оттук — нищо повече.
> Докато официалните източници съществуват, **използвайте тях**. Не представяйте това копие като „официално" и не го разпространявайте като „официалният REA". Това repo не е свързано нито одобрено от авторите на REA.

**Лиценз:** REA е под MIT — копиране, модифициране и разпространение с уведомление са разрешени. Пълният лиценз, авторските заглавки и бележките на трети страни са запазени както в огледалния клон, така и в npm tarball-а. Не се дават гаранции.

### Какво съдържа копието

| Част от копието | Къде | Какво е |
|---|---|---|
| Огледало на източника | Клон **`mirror/rea`** | Пълна git история на официалния `morluto/rea` `main` (към последната синхронизация — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Тагове на издания | Тагове **`rea-agents-*.*.*`** | Всички официални тагове на издания, сочещи точните официални commits (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Официалният npm пакет, предварително изграден (с `dist/`) — инсталация **изцяло offline** |
| Скрипт за синхронизация | **`scripts/sync-backup.ps1`** | Опреснява огледалния клон, таговете и най-новия npm tarball от официалните източници |
| Скрипт за възстановяване | **`scripts/restore-backup.ps1`** | Еднократна offline инсталация на tarball-а + следващи стъпки |
| Ръководството | `README.md` (английският оригинал) | Пълно ръководство за инсталация; валидно независимо от източника на REA |

### Поддържайте копието актуално

Пускайте седмично (или преди да разчитате на него):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Прави fetch на `upstream/main` + всички тагове, принудително актуализира `mirror/rea`, push-ва таговете, пакетира най-новото `rea-agents-*.*.*` в `backup/` с `npm pack` и извежда финалните команди `git add`/`commit`/`push` за tarball-а.

### Сценарии за възстановяване

**Сценарий A — GitHub е недостъпен, npm работи:** няма какво да се възстановява. Продължете `npx rea-agents@latest setup`.

**Сценарий B — GitHub + npm са недостъпни:** инсталирайте предварително изградения tarball от това repo (без мрежа, без инструменти за build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# или ръчно:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` регистрира MCP сървъра + способността при вашия агент точно като официалния `npx rea-agents setup` — напълно offline, без докосване до registry.

**Сценарий C — Искате и пълния изходен код/история:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Пълен официален изходен код към момента на последната синхронизация.
```

Build от източника изисква Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ и мрежов достъп до npm registry (turbo monorepo; `npm ci && npm run build`). Пътят през tarball (Сценарий B) не изисква нито едно — винаги го предпочитайте при възстановяване.

### Проверете какво сте възстановили
```powershell
# Цялост на огледалото — commit-ът трябва да съвпада с последно синхронизирания upstream/main:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # след клониране на огледалния клон
# Цялост на tarball-а — версията, докладвана от самото CLI:
rea --version
```

Ако хешовете се разминават с тези, записани при създаване на копието, считайте копието за съмнително и синхронизирайте отново от официалните източници (ако са се върнали), преди да му се доверите.

### Какво това копие НЕ гарантира

- Без пачове за сигурност след последната синхронизация — изоставено копие е остарял моментен снимък.
- Официалният npm пакет може да съдържа по-нови hotfix-ове от `mirror/rea` или tarball-а.
- Допълнителните услуги (сайтът rea.tools, Discord, бележките за издания, сайтът с документация) са справочни материали, не код, който се възстановява оттук.
- Ако REA бъде преиздаден под друго име/собственик, това копие продължава да работи като архивиран upstream — мигрирайте съзнателно, не предполагайте съвместимост.

---

**Връзки**
- Сайт: https://rea.tools/ · Първи стъпки: https://rea.tools/get-started/ · Ръководства: https://rea.tools/guides/
- ЧЗВ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Източник: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Общност: Discord (виж долния колонтитул на rea.tools) · X: https://x.com/reatools
- **Копието на това repo:** клон `mirror/rea` · тагове `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
