<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — Повний посібник з налаштування

> **Мови:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Цей переклад відповідає англійському оригіналу. У разі розбіжностей **перемагає англійська**. Блоки коду, шляхи та команди ніколи не перекладаються.

> **REA — Reverse Engineer Anything**
> Сервер MCP (Model Context Protocol) + навичка розслідування: дає вашому агенту кодування інструменти для вивчення ПЗ — нативні бінарні файли, застосунки JavaScript/Electron, браузери, .NET, Android, прошивки та інше.

- **Офіційний сайт:** https://rea.tools/
- **Офіційний вихідний код:** https://github.com/morluto/rea
- **npm-пакет:** `rea-agents`
- **Ліцензія:** MIT (сам REA). Сторонні засоби аналізу мають власні ліцензії.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (англійською) — покрокове налаштування за платформами (насамперед Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) разом із вирішенням проблем
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — повністю безкоштовні coding-агенти для REA (OpenCode з безкоштовними моделями, локальний Ollama, Gemini CLI, Qwen Code). REA — це MCP-сервер, а не AI-модель.
- **📦 Додано офлайн-копію** — неофіційне дзеркало офіційного репозиторію + npm tarball; лише на випадок зникнення офіційних джерел. Див. **[Розділ 20 — Офлайн-копія / дзеркало (неофіційне)](#20-офлайн-копія--дзеркало-неофіційне)**.

> ⚠️ **Важливо:** Завантажуйте REA тільки з `morluto/rea`, `rea.tools` або npm-пакета `rea-agents`. Схожі назви репозиторіїв не доводять офіційність релізу.

---

## Зміст

1. Що таке REA (і чим не є)
2. Законне та відповідальне використання
3. Що можна аналізувати
4. Системні вимоги
5. Крок 1 — Підготуйте комп'ютер
6. Крок 2 — Виберіть агента кодування
7. Крок 3 — Підключіть REA
8. Крок 4 — Перевірте встановлення
9. Крок 5 — Ваше перше розслідування (приклад Notes)
10. Нативний аналіз (бінарні файли / EXE / DLL)
11. Застосунки JavaScript & Electron
12. Спостереження за браузером
13. Інші цілі та потрібні інструменти
14. Створення RL-середовищ
15. Використання REA з терміналу (CLI)
16. Оновлення або видалення REA
17. Усунення несправностей
18. Дані, конфіденційність і безпека
19. Контрольний список-довідник
20. Офлайн-копія / дзеркало (неофіційне)

---

## 1. Що таке REA (і чим не є)

**REA — це:**
- Локальний MCP-сервер + навичка агента — дозволяє **вашому агенту кодування** інспектувати ПЗ у вас на комп'ютері.
- Повертає **докази**: асемблер, псевдокод, карти модулів, пари IPC-каналів, перехоплений мережевий трафік, розташування коду — не оригінальний код.
- Аналіз виконується **на вашій машині**. Ваш застосунок не завантажується REA; провайдер моделі вашого агента бачить результати (див. [Дані та конфіденційність](#18-дані-конфіденційність-і-безпека)).

**REA — це не:**
- Магічна кнопка «перетворити на вихідний код». Результати — асемблер/псевдокод і посилання; агент пояснює й допомагає відтворити поведінку.
- Інструмент для зламу ліцензій/DRM або обходу платної активації. Не використовуйте його для цього.
- Обхід обфускації. Сильно упаковані/захищені цілі (VMProtect, Themida, анти-тампер) залишаються надзвичайно складними.
- Доступ до серверного боку. Сервер за API проаналізувати не можна; видно лише клієнтську/мережеву частину.

---

## 2. Законне та відповідальне використання

Зворотна розробка може бути законною для інтероперабельності, досліджень безпеки, налагодження та аналізу ПЗ, яким ви **володієте** — але закони та ліцензії різняться за юрисдикція.

**Вам слід:**
- Аналізувати ПЗ, яким ви володієте, на яке маєте ліцензію або дозвіл на інспекцію.
- Поважати ліцензійні угоди, Умови використання та антиобхідні норми DMCA.
- Використовувати результати для інтероперабельності, освіти й оборонної безпеки.

**Вам не слід:**
- Обходити DRM, активацію ліцензій або захист від копіювання.
- Поширювати зламаний/викрадений код пропрієтарного ПЗ.
- Аналізувати цілі, на які ви не маєте прав.

Цей посібник не є юридичною консультацією. У сумнівах зверніться до юриста.

---

## 3. Що можна аналізувати

| Ціль | Що повертає REA | Потрібен нативний рушій? |
|---|---|---|
| Нативні бінарні файли / бібліотеки (EXE, DLL, ELF, Mach-O) | Функції, асемблер, псевдокод, викликачі, xrefs, константи | Так — Hopper, Ghidra або IDA |
| Застосунки JavaScript & Electron | Модулі, імпорти, IPC-канали + обробники, розташування коду | Ні |
| Сторінки браузера (runtime) | Запити/відповіді, скрипти, форми JSON-тіла, вікно спостереження | Браузер родини Chrome |
| Збірки .NET / Flutter / пакети | Інспекція модулів і ресурсів | Ні |
| Android APK / пристрої / ресурси | Декомпільовані класи, ресурси, взаємодія з пристроєм | JADX / adb / Apktool |
| Прошивки | Видобуті файлові системи/блоби | Binwalk / Unblob (Linux) |
| WASM | Інспекція модулів і функцій | WABT |
| Бази SQLite | Інспекція схеми та запитів | Node.js 24.15+ / 26+ |
| EVM bytecode | Структура контракту | Node.js (Linux x64) |
| Захоплення HAR / SAZ / mitmproxy | Розібрані докази трафіку | Node.js / mitmdump |
| PCAP / PCAPNG | Факти пакетів/протоколів | TShark / capinfos (Linux) |

---

## 4. Системні вимоги

**Мінімум:**
- Node.js **22.23.4+**, **24.22.1+** або **26+ (>= 26.12.1)** (npm включено)
- Підтримуваний агент кодування (крок 2)
- Робочий каталог для розслідувань

**Для нативного (бінарного) аналізу** — один із:
- **Ghidra 12.1.x** + 64-розрядний **JDK 21+** (безкоштовно, рекомендовано для Windows)
- **IDA** (комерційна; перевірені профілі Windows legacy GUI + headless supervisor)
- **Hopper** (комерційна; macOS і деякі Linux — **на Windows недоступна**)

**Нотатки щодо ОС:**
- Windows: використовуйте **PowerShell**; шляхи з пробілами — у лапках. Якщо агент працює у WSL, ставте Node.js + REA **усередині** WSL і використовуйте шляхи Linux.
- Linux: `ps`, сумісний із `procps`, у `PATH` (для запуску Ghidra/JADX/прошивок і статичного аналізу).
- macOS: використовуйте Terminal; деякі кроки потребують Xcode Command Line Tools (збірка декомпілятора Ghidra на arm64).

---

## 5. Крок 1 — Підготуйте комп'ютер

### 5.1 Перевірте Node.js

```powershell
node -v
npm -v
```

Очікувано: `v22.23.4+`, `v24.22.1+` або `v26.12.1+`. Старіший → встановіть Node.js 24 LTS.

### 5.2 Встановіть Node.js на Windows (якщо немає)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Введіть `Y`, якщо просять прийняти умови, закрийте й відкрийте PowerShell знову, перевірте `node -v`. (Альтернатива: інсталятор із https://nodejs.org/.)

> **Особливість PowerShell:** якщо `npx` падає з «running scripts is disabled on this system», використовуйте `npx.cmd` і `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Завантажте `.pkg` Node.js 24 LTS або через Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# перевідкрийте shell, потім:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Створіть робочу теку

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Крок 2 — Виберіть агента кодування

REA підтримує будь-якого агента з локальним **MCP**. Виберіть один — усі приклади нижче використовують **setup ID** клієнта (`--client <id>`).

| Клієнт | Setup ID | Встановлення / примітки |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Встановіть застосунок, увійдіть, потім `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` або скрипт встановлення · вхід через ChatGPT |
| Cursor | `cursor` | Встановіть редактор, відкрийте робочу теку, режим Agent |
| Windsurf | `windsurf` | Та сама схема; чат агента |
| VS Code | `vscode` | Спочатку налаштуйте GitHub Copilot, потім режим Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, запустіть `opencode`, `/connect` для вашої моделі, потім `--client opencode` |
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

**Grok Bot:** у чаті бота попросіть додати на його розміщеній машині власний MCP-сервер з ім'ям `rea`:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Крок 3 — Підключіть REA

### Варіант A — Нехай робить агент (рекомендовано)

Вставте у чат агента:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Агент виконає setup, покаже план і застосує його після вашого схвалення.

### Варіант B — Запустіть setup самостійно

```powershell
npx rea-agents@latest setup
```

Для конкретного клієнта:

```powershell
npx rea-agents@latest setup --client opencode
```

Під час setup:
- **Стрілки** для переміщення, **Space** для вибору, **Enter** для продовження.
- REA додає **MCP-з'єднання** + **навичку розслідування** та **створює резервну копію** наявної конфігурації перед змінами.
- Зміни застосовуються тільки після вашого схвалення.
- Для першого вправи необов'язкове встановлення Hopper можна пропустити.

### Перезапустіть клієнт після setup

- Десктопні застосунки (Claude Desktop, Cursor, Windsurf, VS Code): **повністю закрийте** й відкрийте знову (Windows: також через значок у треї).
- Термінальні агенти (Claude Code, Codex, Gemini CLI, OpenCode): завершіть і запустіть знову.

---

## 8. Крок 4 — Перевірте встановлення

Запустіть перевірку doctor для вашого клієнта (замініть `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Справний звіт показує `"healthy": true`. Потім запитайте агента:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Крок 5 — Ваше перше розслідування (приклад Notes)

Офіційний приклад — маленький застосунок Electron з кнопкою **Export notes**. Встановлювати Electron не треба — агент читає код.

Вставте агенту:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Очікуваний результат: клік Export надсилає IPC-повідомлення `notes:export`; головний процес форматує записи у CSV і записує `notes.csv` (колонки: `id`, `title`) у теку «Завантаження».

Ручний аналіз із терміналу:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Нативний аналіз (бінарні файли / EXE / DLL)

Глибокий нативний аналіз потребує провайдера. На **Windows** використовуйте **Ghidra** або **IDA** (Hopper на Windows недоступна).

### 10.1 Ghidra (безкоштовно) — налаштування для Windows

1. Встановіть **64-розрядний JDK 21 або новіший** (із компілятором). Перевірка:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Завантажте **Ghidra 12.1.4** зі списку *Assets* релізу та розпакуйте `ghidra_…_PUBLIC_….zip` (саме архів релізу, **не** «Source code»).
3. Запам'ятайте розпаковану теку з `ghidraRun.bat` — це ваш `GHIDRA_INSTALL_DIR`.
4. У PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # тека з java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Замініть шляхи своїми. Перегляньте оновлений план setup, схваліть і **перезапустіть агента**.

> Підтримка Ghidra у Windows — **експериментальна, тільки читання**, для нативних x86/x64 PE на локальних **NTFS**-дисках.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

На macOS arm64 і Linux arm64 спочатку зберіть нативний декомпілятор Ghidra (macOS потребує Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Встановіть і налаштуйте upstream IDA MCP за посібником провайдера IDA.
2. Збережіть робочу реєстрацію як `ida-mcp.json`. Приклад (headless supervisor із `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Для підключеного legacy 1.4.0 GUI скопіюйте його робочі command/args/env (спочатку відкрийте бінарний файл в IDA та запустіть плагін).
3. Підключіть:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   На macOS/Linux використовуйте `export` замість `$env:`. Після setup перезапустіть агента.

> Перевірені профілі IDA: Windows legacy GUI і headless supervisor, а також macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 не містить профілю headless для macOS / нативного GUI-мосту — потрібна збірка REA з джерел.

### 10.4 Hopper (лише macOS / Linux)

Setup може виявити наявну установку Hopper або запропонувати план. На macOS при першому запуску виберіть демо-режим або активуйте ліцензію. Автоматичне встановлення Linux вимагає x86_64 та Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS або Omarchy. На Linux arm64 використовуйте Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Використання провайдера

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Разовий аналіз функції з CLI (потрібен налаштований Ghidra):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Застосунки JavaScript & Electron

Нативний рушій не потрібен. Вкажіть агенту **теку** застосунку або **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Де Electron зберігає `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: зазвичай `/opt/<App>/resources/app.asar`

Статичний аналіз із терміналу:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Дивіться `normalized_result.summary.ipc` для збігшихся каналів/обробників і `normalized_result.graph` для розташування коду. Обчислювані імена каналів можуть лишитися невирішеними — тоді використовуйте спостереження за браузером (наступний розділ).

---

## 12. Спостереження за браузером

1. Відкрийте цільову сторінку у браузері родини Chrome з віддаленою відладкою, напр.:

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

2. Запитайте агента:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Передайте йому endpoint `http://127.0.0.1:9222` і URL сторінки. Запускайте захоплення **до** кліку.

   Або з терміналу:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Для тіл HTTP експорт Fiddler Everywhere (SAZ/HAR 1.2) може слугувати REA capture Evidence, або підключіть MCP-сервер Everywhere.

---

## 13. Інші цілі та потрібні інструменти

| Ціль | Інструменти | Нотатки |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Рушій не потрібен |
| Вебсайт | Chrome / Chromium / Edge | Порт віддаленої відладки |
| .NET / Flutter / пакети | Node.js + npm | Статична інспекція |
| Android APK | JADX + JDK 17+ | Декомпіляція `classes.dex` |
| Пристрій Android | adb | Увімкнути налагодження USB |
| Ресурси Android | Apktool + Java | Розпаковує ресурси та маніфест |
| Проєкт JEB | JEB + MCP | Комерційний декомпілятор |
| Прошивка | Binwalk / Unblob | **Лише Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| База SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Лише Linux x64** |
| ELF / збій Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Офлайн-розбір захоплень |
| PCAP / PCAPNG | TShark / capinfos | **Лише Linux** |
| Логічні сигнали | sigrok-cli | **Лише Linux** |
| Поведінка процесів | PTY | **Linux / macOS** |

Flutter, пакети/ресурси, EVM і повні посібники з розслідування: https://rea.tools/guides.

---

## 14. Створення RL-середовищ

REA може записати сесію тестового веб-застосунку та експортувати середовище **AgentEnv** для навчання/оцінювання агентів.

1. Підготуйте **тестову** інстанцію застосунку, де агент може створювати/редагувати/видаляти дані.
2. Запитайте агента (приклад із теками):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Пароль тримайте в оточенні MCP-сервера (`APP_PASSWORD`), не у промпті.
3. Або зберіть напряму з HAR-запису:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` — лише перегляд звіту без запису файлів.
4. Запустіть:
   ```bash
   agent-env run ./my-env
   ```
   Перевірка сумісності REA використовує **AgentEnv 0.9.1334 + Python 3.12**; Docker має бути запущений.
5. Підтримуються лише операції, чиї **ефекти** були записані (наприклад, для видалення потрібні відповідь про відсутність елемента й оновлений список). Перед поширенням перевірте збережені тіла відповідей — там можуть бути облікові дані.

---

## 15. Використання REA з терміналу (CLI)

Без глобального встановлення:

```powershell
npx -y rea-agents@latest --help
```

Постійне встановлення команди `rea`:

```powershell
npm install --global rea-agents
rea --help
rea update
```

curl-інсталятор для macOS / Linux (спочатку потрібен Node.js):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Поширені команди:

| Команда | Призначення |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Мапа модулів, імпортів, IPC, меж |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Аналіз однієї нативної функції |
| `rea-agents list-browser-targets <endpoint> --json` | Список сторінок для відладки |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Спостереження мережі/скриптів сторінки |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Збірка RL-середовища |
| `rea-agents environment-compare … --json` | Порівняння середовища з живим застосунком |
| `rea-agents doctor --client <id> --json` | Перевірка з'єднання клієнта |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Перевірка нативного провайдера |
| `rea-agents update` | Оновлення CLI |
| `rea-agents uninstall` | Видалення конфігурації клієнта + навички |

---

## 16. Оновлення або видалення REA

**Оновити:**
```powershell
rea update                       # якщо встановлено глобальний CLI
npx rea-agents@latest setup      # оновити з'єднання + навичку; схваліть план, перезапустіть агента
```

**Видалити:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Усунення несправностей

**Агент не бачить інструментів REA**
1. Повністю перезапустіть/перепідключіть клієнт (включно з іконкою трею).
2. `npx -y rea-agents@latest doctor --client <id> --json` — якщо реєстрація відсутня/застаріла: `npx rea-agents@latest setup --client <id>`, перезапустіть.
3. Усе ще не видно: перевірте помилку з'єднання MCP клієнта; у редакторах увімкніть REA в налаштуваннях MCP і дозволіть її інструменти.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
Використовуйте `npx.cmd` / `npm.cmd` або `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Шляхи з пробілами**
У лапки: `"D:/my apps/tool.exe"`. У WSL — Linux-шляхи та REA всередині WSL.

**Обмеження Ghidra для Windows**
Експериментальна, тільки читання, лише x86/x64 PE, локальні NTFS-диски. Альтернатива Linux: Ghidra/Hopper. Аналіз збоїв нативного x64 Linux ELF: pwntools.

**macOS просить дозвіл на автоматизацію (Hopper)**
Системні параметри → Конфіденційність і безпека → Автоматизація → дозвольте застосунку, що запускає REA, повторіть.

**Перший запуск Hopper**
Завершіть вибір демо-режиму чи активації ліцензії до безнаглядного аналізу.

**У Linux немає `ps`**
Встановіть `procps` (Debian/Ubuntu: `sudo apt install procps`); REA потрібна для перевірки права власності на процеси.

**Знайшли баг?**
Оновіть REA, перезапустіть, повторіть. Потім відкрийте issue з: версією REA, ОС, типом цілі, кроками відтворення, виводом помилки, назвою провайдера. https://github.com/morluto/rea/issues.

---

## 18. Дані, конфіденційність і безпека

- REA аналізує цілі **на вашій машині**; ваш застосунок **не** завантажується REA.
- **Провайдер моделі вашого агента** отримує результати — діє його політика даних/зберігання. Не вставляйте секрети чи дані клієнтів у промпти.
- Вхідні схеми MCP типово компактні; для повних підказок полів задайте `REA_MCP_INPUT_SCHEMA_PROFILE=full` у реєстрації MCP. Вихідні схеми обмежуйте `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (або `off`).
- Записи RL-середовищ можуть зберігати облікові дані в тілах/заголовках — переглядайте перед поширенням. Попередження credential-name вказують на місця для перевірки; вони **не видаляють** значень.
- Секрети типу `APP_PASSWORD` — в оточенні MCP-сервера, не в чаті.
- Встановлюйте REA лише з `morluto/rea`, `rea.tools` або npm `rea-agents`.

---

## 19. Контрольний список-довідник

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Агент кодування встановлено (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (перегляньте й схваліть план)
[ ] Клієнт повністю перезапущено
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Перше розслідування: notes-example.zip  →  знайти notes:export / notes.csv
[ ] (Необов'язково) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → повторіть setup → перезапустіть агента
[ ] (Необов'язково) Браузер: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Юридично: ви є власником / маєте право аналізувати ціль
```

---

## 20. Офлайн-копія / дзеркало (неофіційне)

> ⚠️ **Спочатку прочитайте це.**
> Офіційної «офіційної копії» не існує. Єдина офіційна REA — **morluto/rea** (https://github.com/morluto/rea), **rea.tools** та npm-пакет **`rea-agents`**.
> Цей репозиторій надає повне, сумісне з ліцензією **неофіційне дзеркало / архів** офіційного проєкту зі збереженням оригінальної ліцензії MIT і повідомлень про авторство. Він існує, щоб, **якщо офіційний репозиторій, сайт або npm-пакет зникнуть**, ви могли отримати REA звідси — і все.
> Поки офіційні джерела існують, **використовуйте їх**. Не подавайте цю копію як «офіційну» і не розповсюджуйте її як «офіційну REA». Цей репозиторій не пов'язаний з авторами REA і не схвалений ними.

**Ліцензія:** REA поширюється за MIT — копіювання, зміна й розповсюдження з повідомленням дозволені. Повна ліцензія, заголовки авторства й сторонні повідомлення збережені і у дзеркальній гілці, і в npm tarball. Жодних гарантій.

### Що містить копія

| Частина копії | Де | Що це |
|---|---|---|
| Дзеркало коду | Гілка **`mirror/rea`** | Повна git-історія офіційного `morluto/rea` `main` (стан на останню синхронізацію — v6.9.0, коміт `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Релізні теги | Теги **`rea-agents-*.*.*`** | Усі офіційні релізні теги, що вказують на точні офіційні коміти (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Офіційний npm-пакет, зібраний наперед (із `dist/`) — встановлення **повністю офлайн** |
| Скрипт синхронізації | **`scripts/sync-backup.ps1`** | Оновлює дзеркальну гілку, теги та свіжий npm tarball з офіційних джерел |
| Скрипт відновлення | **`scripts/restore-backup.ps1`** | Одноразове офлайн-встановлення tarball + наступні кроки |
| Посібник | `README.md` (англійський майстер) | Повний посібник з налаштування; чинний незалежно від джерела REA |

### Тримайте копію свіжою

Виконуйте щотижня (або перед тим, як покладатися на неї):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Він робить fetch `upstream/main` + усіх тегів, примусово оновлює `mirror/rea`, пушить теги, пакує найновіший `rea-agents-*.*.*` у `backup/` через `npm pack` і друкує фінальні команди `git add`/`commit`/`push` для tarball.

### Сценарії відновлення

**Сценарій A — GitHub упав, npm працює:** відновлювати нічого. Продовжуйте `npx rea-agents@latest setup`.

**Сценарій B — GitHub + npm недоступні:** встановіть готовий tarball із цього репозиторію (без мережі, без інструментів збірки):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# або вручну:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` зареєструє MCP-сервер + навичку у вашому агенті так само, як офіційний `npx rea-agents setup` — повністю офлайн, без звернення до реєстру.

**Сценарій C — Вам також потрібні повний код/історія:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Повний офіційний код на момент останньої синхронізації.
```

Збірка з джерел потребує Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ і доступу до npm registry (turbo monorepo; `npm ci && npm run build`). Шлях tarball (Сценарій B) не потребує нічого з цього — завжди надавайте йому перевагу під час відновлення.

### Перевірте відновлене
```powershell
# Цілісність дзеркала коду — коміт має збігатися з останнім upstream/main:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # після клонування дзеркальної гілки
# Цілісність tarball — версія, яку повідомляє сама CLI:
rea --version
```

Якщо геші відхиляються від записаних під час копіювання, вважайте копію підозрілою й перейтирайте з офіційних джерел (якщо вони повернулися), перш ніж довіряти їй.

### Чого ця копія НЕ гарантує

- Немає патчів безпеки після останньої синхронізації — покинута копія — це застарілий знімок.
- Офіційний npm-пакет може містити новіші хотфікси, ніж `mirror/rea` або tarball.
- Додаткові сервіси (сайт rea.tools, Discord, нотатки релізів, документація) — довідковий матеріал, не код, що підлягає відновленню звідси.
- Якщо REA пізніше перевипустять під іншою назвою/власником, цей знімок і далі працюватиме як архівний upstream — мігруйте свідомо, не припускайте сумісності.

---

**Посилання**
- Сайт: https://rea.tools/ · Початок: https://rea.tools/get-started/ · Посібники: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Вітрина: https://rea.tools/showcases/
- Код: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Спільнота: Discord (див. футер rea.tools) · X: https://x.com/reatools
- **Копія цього репозиторію:** гілка `mirror/rea` · теги `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
