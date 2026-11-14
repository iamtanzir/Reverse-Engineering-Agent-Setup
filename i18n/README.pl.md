# Reverse Engineering Agent — Kompletny przewodnik instalacji

> **Języki:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ To tłumaczenie odpowiada anglojęzycznemu masterowi. W razie rozbieżności **wygrywa angielski**. Bloki kodu, ścieżki i polecenia nigdy nie są tłumaczone.

> **REA — Reverse Engineer Anything**
> Serwer MCP (Model Context Protocol) + umiejętność dochodzeniowa, dająca Twojemu agentowi kodującemu narzędzia do inspekcji oprogramowania — natywne binaria, aplikacje JavaScript/Electron, przeglądarki, .NET, Android, firmware i więcej.

- **Oficjalna strona:** https://rea.tools/
- **Oficjalny kod źródłowy:** https://github.com/morluto/rea
- **Pakiet npm:** `rea-agents`
- **Licencja:** MIT (sam REA). Narzędzia analityczne stron trzecich mają własne licencje.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (po angielsku) — konfiguracja krok po kroku na platformę (najpierw Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) z rozwiązywaniem problemów
- **📦 W zestawie kopia offline** — nieoficjalne lustro oficjalnego repo + tarball npm; tylko gdy oficjalne źródła znikną. Zobacz **[Sekcja 20 — Kopia offline / lustro (nieoficjalne)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Ważne:** Pobieraj REA tylko z `morluto/rea`, `rea.tools` lub pakietu npm `rea-agents`. Podobna nazwa repo nie dowodzi oficjalnego wydania.

---

## Spis treści

1. Czym jest REA (a czym nie jest)
2. Legalne i odpowiedzialne użycie
3. Co można analizować
4. Wymagania systemowe
5. Krok 1 — Przygotuj komputer
6. Krok 2 — Wybierz agenta kodującego
7. Krok 3 — Połącz REA
8. Krok 4 — Zweryfikuj instalację
9. Krok 5 — Twoje pierwsze dochodzenie (przykład Notes)
10. Analiza natywna (binaria / EXE / DLL)
11. Aplikacje JavaScript & Electron
12. Obserwacja przeglądarki
13. Inne cele i wymagane narzędzia
14. Budowanie środowisk RL
15. Używanie REA z terminala (CLI)
16. Aktualizacja lub usunięcie REA
17. Rozwiązywanie problemów
18. Dane, prywatność i bezpieczeństwo
19. Ściągawka
20. Kopia offline / lustro (nieoficjalne)

---

## 1. Czym jest REA (a czym nie jest)

**REA jest:**
- Lokalnym serwerem MCP + umiejętnością agenta — pozwala **Twojemu agentowi kodującemu** sprawdzać oprogramowanie na Twoim dysku.
- Zwraca **dowody**: asembler, pseudokod, mapy modułów, pary kanałów IPC, przechwycony ruch sieciowy, lokalizacje źródeł — nie oryginalny kod źródłowy.
- Analiza działa **na Twojej maszynie**. Twoja aplikacja nie jest przez REA wysyłana; dostawca modelu Twojego agenta widzi wyniki (zob. [Dane i prywatność](#18-data-privacy--security)).

**REA nie jest:**
- Magicznym przyciskiem "zamień na kod źródłowy". Wyniki to asembler/pseudokod i odwołania; agent wyjaśnia i pomaga odtworzyć zachowanie.
- Narzędziem do łamania licencji/DRM ani obchodzenia płatnej aktywacji. Nie używaj do tego.
- Obchodzeniem obfuskacji. Silnie spakowane/chronione cele (VMProtect, Themida, antytamper) pozostają niezwykle trudne.
- Dostępem do strony serwera. Serwera za API nie da się sprawdzić; widać tylko stronę klienta/sieci.

---

## 2. Legalne i odpowiedzialne użycie

Inżynieria wsteczna może być zgodna z prawem dla interoperacyjności, badań bezpieczeństwa, debugowania i analizy oprogramowania, które **posiadasz** — ale prawo i licencje różnią się w zależności od jurysdykcji.

**Powinieneś:**
- Analizować oprogramowanie, które posiadasz, masz licencję na używanie lub pozwolenie na inspekcję.
- Szanować umowy licencyjne, Regulaminy i przepisy anty-circumvention DMCA.
- Używać wyników do interoperacyjności, edukacji i bezpieczeństwa obronnego.

**Nie powinieneś:**
- Obchodzić DRM, aktywacji licencji lub zabezpieczeń antykopiowych.
- Rozpowszechniać złamanego/wyciekniętego kodu oprogramowania własnościowego.
- Analizować celów, do których nie masz praw.

Ten przewodnik nie jest poradą prawną. W razie wątpliwości skonsultuj się z prawnikiem.

---

## 3. Co można analizować

| Cel | Co zwraca REA | Wymagany silnik natywny? |
|---|---|---|
| Natywne binaria / biblioteki (EXE, DLL, ELF, Mach-O) | Funkcje, asembler, pseudokod, wywołujący, xrefy, stałe | Tak — Hopper, Ghidra lub IDA |
| Aplikacje JavaScript & Electron | Moduły, importy, kanały IPC + handlery, lokalizacje źródeł | Nie |
| Strony przeglądarki (runtime) | Żądania/odpowiedzi, skrypty, struktury body JSON, okno obserwacji | Przeglądarka rodziny Chrome |
| Zespoły .NET / Flutter / pakiety | Inspekcja modułów i zasobów | Nie |
| Android APK / urządzenia / zasoby | Zdekompilowane klasy, zasoby, interakcja z urządzeniem | JADX / adb / Apktool |
| Firmware | Wyodrębnione systemy plików/bloby | Binwalk / Unblob (Linux) |
| WASM | Inspekcja modułów i funkcji | WABT |
| Bazy SQLite | Inspekcja schematu i zapytań | Node.js 24.15+ / 26+ |
| Bytecode EVM | Struktura kontraktu | Node.js (Linux x64) |
| Zrzuty HAR / SAZ / mitmproxy | Sparsowane dowody ruchu | Node.js / mitmdump |
| PCAP / PCAPNG | Fakty pakietów/protokołów | TShark / capinfos (Linux) |

---

## 4. Wymagania systemowe

**Minimum:**
- Node.js **22.23.4+**, **24.22.1+** lub **26+ (>= 26.12.1)** (z npm)
- Obsługiwany agent kodujący (krok 2)
- Katalog roboczy dla dochodzeń

**Do analizy natywnej (binarnej)** — jeden z:
- **Ghidra 12.1.x** + 64-bitowy **JDK 21+** (darmowy, zalecany na Windows)
- **IDA** (komercyjna; zweryfikowane profile Windows legacy GUI + headless supervisor)
- **Hopper** (komercyjna; macOS i część Linux — **niedostępna na Windows**)

**Uwagi o systemie:**
- Windows: używaj **PowerShell**; ścieżki ze spacjami w cudzysłowach. Jeśli agent działa w WSL, zainstaluj Node.js + REA **wewnątrz** WSL i używaj ścieżek Linux.
- Linux: `ps` zgodny z `procps` na `PATH` (dla startu Ghidra/JADX/firmware i analizy statycznej).
- macOS: używaj Terminal; niektóre kroki wymagają Xcode Command Line Tools (budowa dekompilatora Ghidra na arm64).

---

## 5. Krok 1 — Przygotuj komputer

### 5.1 Sprawdź Node.js

```powershell
node -v
npm -v
```

Oczekiwane: `v22.23.4+`, `v24.22.1+` lub `v26.12.1+`. Starsze → zainstaluj Node.js 24 LTS.

### 5.2 Zainstaluj Node.js na Windows (jeśli brak)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Wpisz `Y`, jeśli zostaniesz poproszony o akceptację warunków, zamknij i otwórz PowerShell ponownie, sprawdź `node -v`. (Zamiennie: instalator z https://nodejs.org/.)

> **Uwaga PowerShell:** jeśli `npx` nie działa z "running scripts is disabled on this system", użyj `npx.cmd` i `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Pobierz plik `.pkg` Node.js 24 LTS albo przez Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# otwórz powłokę ponownie, następnie:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Utwórz folder roboczy

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Krok 2 — Wybierz agenta kodującego

REA obsługuje każdego agenta mówiącego lokalnym **MCP**. Wybierz jeden — wszystkie przykłady używają **setup ID** klienta (`--client <id>`).

| Klient | Setup ID | Instalacja / uwagi |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Zainstaluj aplikację, zaloguj się, następnie `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` lub skrypt instalacyjny · logowanie przez ChatGPT |
| Cursor | `cursor` | Zainstaluj edytor, otwórz folder roboczy, tryb Agent |
| Windsurf | `windsurf` | Ten sam schemat; czat agenta |
| VS Code | `vscode` | Najpierw skonfiguruj GitHub Copilot, następnie tryb Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, uruchom `opencode`, `/connect` dla modelu, potem `--client opencode` |
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

**Grok Bot:** w czacie bota poproś o dodanie na jego hostowanej maszynie własnego serwera MCP o nazwie `rea`:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Krok 3 — Połącz REA

### Opcja A — Niech zrobi to agent (zalecane)

Wklej w czacie agenta:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent wykona setup, pokaże plan i zastosuje go po Twojej akceptacji.

### Opcja B — Uruchom setup sam

```powershell
npx rea-agents@latest setup
```

Dla konkretnego klienta:

```powershell
npx rea-agents@latest setup --client opencode
```

Podczas setup:
- **Strzałki** do przemieszczania, **Space** do wyboru, **Enter** do kontynuacji.
- REA dodaje **połączenie MCP** + **umiejętność dochodzeniową** i **tworzy kopię zapasową** obecnej konfiguracji przed zmianami.
- Zmiany wchodzą w życie tylko po Twojej akceptacji.
- W pierwszym ćwiczeniu opcjonalną instalację Hoppera można pominąć.

### Zrestartuj klienta po setup

- Aplikacje desktopowe (Claude Desktop, Cursor, Windsurf, VS Code): **zamknij całkowicie** i otwórz ponownie (Windows: także z ikony w zasobniku).
- Agenci terminalowi (Claude Code, Codex, Gemini CLI, OpenCode): zakończ sesję i uruchom ponownie.

---

## 8. Krok 4 — Zweryfikuj instalację

Uruchom sprawdzenie doctor dla swojego klienta (zamień `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Zdrowy raport pokazuje `"healthy": true`. Następnie zapytaj agenta:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Krok 5 — Twoje pierwsze dochodzenie (przykład Notes)

Oficjalny przykład to mała aplikacja Electron z przyciskiem **Export notes**. Instalacja Electron nie jest potrzebna — agent czyta kod.

Wklej agentowi:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Oczekiwany wynik: kliknięcie Export wysyła wiadomość IPC `notes:export`; proces główny formatuje notatki do CSV i zapisuje `notes.csv` (kolumny: `id`, `title`) w folderze Pobrane.

Analiza ręczna z terminala:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Analiza natywna (binaria / EXE / DLL)

Głęboka analiza natywna wymaga providera. Na **Windows** użyj **Ghidry** lub **IDA** (Hopper nie jest dostępna na Windows).

### 10.1 Ghidra (darmowa) — konfiguracja na Windows

1. Zainstaluj **64-bitowy JDK 21 lub nowszy** (z kompilatorem). Sprawdź:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Pobierz **Ghidra 12.1.4** z listy *Assets* wydania i rozpakuj `ghidra_…_PUBLIC_….zip` (archiwum wydania, **nie** "Source code").
3. Zapamiętaj rozpakowany folder z `ghidraRun.bat` — to Twój `GHIDRA_INSTALL_DIR`.
4. W PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # folder wskazany przez java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Zamień ścieżki na swoje. Przejrzyj zaktualizowany plan setup, zaakceptuj i **zrestartuj agenta**.

> Wsparcie Ghidra na Windows jest **eksperymentalne, tylko do odczytu**, dla natywnych x86/x64 PE na lokalnych dyskach **NTFS**.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Na macOS arm64 i Linux arm64 zbuduj najpierw natywny dekompilator Ghidra (macOS wymaga Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Zainstaluj i skonfiguruj nadrzędny serwer MCP IDA zgodnie z przewodnikiem providera IDA.
2. Zapisz działającą rejestrację jako `ida-mcp.json`. Przykład (headless supervisor z `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Dla podłączonego legacy 1.4.0 GUI skopiuj jego działające command/args/env (najpierw otwórz binarium w IDA i uruchom wtyczkę).
3. Połącz:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Na macOS/Linux użyj `export` zamiast `$env:`. Po setup zrestartuj agenta.

> Zweryfikowane profile IDA: Windows legacy GUI i headless supervisor oraz macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 nie zawiera profilu headless dla macOS / natywnego mostu GUI — wymagają one budowy REA ze źródeł.

### 10.4 Hopper (tylko macOS / Linux)

Setup może wykryć istniejącą Hoppera lub zaproponować plan instalacji. Na macOS przy pierwszym starcie wybierz tryb demo lub aktywuj licencję. Automatyczna instalacja Linux wymaga x86_64 oraz Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS lub Omarchy. Na Linux arm64 użyj Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Użycie providera

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Jednorazowa analiza funkcji z CLI (wymaga skonfigurowanej Ghidry):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Aplikacje JavaScript & Electron

Silnik natywny nie jest potrzebny. Skieruj agenta na **folder** aplikacji lub **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Gdzie Electron trzyma `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: często `/opt/<App>/resources/app.asar`

Analiza statyczna z terminala:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Sprawdź `normalized_result.summary.ipc` dla dopasowanych kanałów/handlerów i `normalized_result.graph` dla lokalizacji źródeł. Obliczone nazwy kanałów mogą pozostać nierozwiązane — wtedy użyj obserwacji przeglądarki (następna sekcja).

---

## 12. Obserwacja przeglądarki

1. Otwórz stronę docelową w przeglądarce rodziny Chrome ze zdalnym debugowaniem, np.:

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

2. Zapytaj agenta:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Podaj mu endpoint `http://127.0.0.1:9222` i adres strony. Rozpocznij przechwytywanie **przed** kliknięciem.

   Albo z terminala:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Dla ciał HTTP eksporty Fiddler Everywhere (SAZ/HAR 1.2) mogą zasilać REA capture Evidence albo połącz serwer MCP Everywhere.

---

## 13. Inne cele i wymagane narzędzia

| Cel | Narzędzia | Uwagi |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Bez silnika |
| Strona WWW | Chrome / Chromium / Edge | Port zdalnego debugowania |
| .NET / Flutter / pakiety | Node.js + npm | Inspekcja statyczna |
| Android APK | JADX + JDK 17+ | Dekompilacja `classes.dex` |
| Urządzenie Android | adb | Włącz debugowanie USB |
| Zasoby Android | Apktool + Java | Rozpakowuje zasoby i manifest |
| Projekt JEB | JEB + MCP | Komercyjny dekompilator |
| Firmware | Binwalk / Unblob | **Tylko Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Baza SQLite | Node.js 24.15+ / 26+ | |
| Bytecode EVM | Node.js | **Tylko Linux x64** |
| ELF / awarie Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Offline'owa analiza zrzutów |
| PCAP / PCAPNG | TShark / capinfos | **Tylko Linux** |
| Sygnały logiczne | sigrok-cli | **Tylko Linux** |
| Zachowanie procesów | PTY | **Linux / macOS** |

Flutter, pakiety/zasoby, EVM i pełne przewodniki: https://rea.tools/guides.

---

## 14. Budowanie środowisk RL

REA może nagrać sesję z testową aplikacją webową i wyeksportować środowisko **AgentEnv** do trenowania/oceny agentów.

1. Przygotuj **testową** instancję aplikacji, w której agent może tworzyć/edytować/usuwać dane.
2. Zapytaj agenta (przykład z folderami):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Hasło trzymaj w środowisku serwera MCP (`APP_PASSWORD`), nie w promptcie.
3. Albo zbuduj bezpośrednio z nagrania HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` — tylko podgląd raportu, bez zapisu plików.
4. Uruchom:
   ```bash
   agent-env run ./my-env
   ```
   Sprawdzenie zgodności REA używa **AgentEnv 0.9.1334 + Python 3.12**; Docker musi działać.
5. Obsługiwane są tylko operacje, których **efekty** zostały nagrane (np. usunięcie wymaga odpowiedzi o braku elementu i zaktualizowanej listy). Przed udostępnieniem przejrzyj zachowane ciała odpowiedzi — mogą zawierać dane logowania.

---

## 15. Używanie REA z terminala (CLI)

Bez globalnej instalacji:

```powershell
npx -y rea-agents@latest --help
```

Stała instalacja polecenia `rea`:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Instalator curl dla macOS / Linux (najpierw wymagany Node.js):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Częste polecenia:

| Polecenie | Cel |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Mapa modułów, importów, IPC, granic |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analiza jednej natywnej funkcji |
| `rea-agents list-browser-targets <endpoint> --json` | Lista stron do debugowania |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Obserwacja sieci/skryptów strony |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Budowa środowiska RL |
| `rea-agents environment-compare … --json` | Porównanie środowiska z żywą aplikacją |
| `rea-agents doctor --client <id> --json` | Sprawdzenie połączenia klienta |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Sprawdzenie natywnego providera |
| `rea-agents update` | Aktualizacja CLI |
| `rea-agents uninstall` | Usunięcie konfiguracji klienta + umiejętności |

---

## 16. Aktualizacja lub usunięcie REA

**Aktualizacja:**
```powershell
rea update                       # jeśli zainstalowane globalne CLI
npx rea-agents@latest setup      # odśwież połączenie + umiejętność; zaakceptuj plan, zrestartuj agenta
```

**Usunięcie:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Rozwiązywanie problemów

**Agent nie widzi narzędzi REA**
1. Zrestartuj/ponownie połącz klienta całkowicie (włącznie z ikoną w zasobniku).
2. `npx -y rea-agents@latest doctor --client <id> --json` — jeśli rejestracja brakująca/nieaktualna: `npx rea-agents@latest setup --client <id>`, zrestartuj.
3. Nadal nie widać: sprawdź błąd połączenia MCP klienta; w edytorach włącz REA w ustawieniach MCP i zezwól na jego narzędzia.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Użyj `npx.cmd` / `npm.cmd` lub `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Ścieżki ze spacjami**
W cudzysłowy: `"D:/my apps/tool.exe"`. W WSL — ścieżki Linux i REA wewnątrz WSL.

**Ograniczenia Ghidra na Windows**
Eksperymentalne, tylko odczyt, wyłącznie x86/x64 PE, lokalne dyski NTFS. Alternatywa Linux: Ghidra/Hopper. Analiza natywnych awarii x64 Linux ELF: pwntools.

**macOS prosi o zgodę na automatyzację (Hopper)**
Ustawienia systemowe → Prywatność i ochrona → Automatyzacja → zezwól aplikacji uruchamiającej REA, spróbuj ponownie.

**Pierwsze uruchomienie Hoppera**
Zakończ wybór trybu demo vs aktywacji licencji przed analizą bez nadzoru.

**Brak `ps` w Linux**
Zainstaluj `procps` (Debian/Ubuntu: `sudo apt install procps`); REA potrzebuje go do sprawdzania własności procesów.

**Znaleziono błąd?**
Zaktualizuj REA, zrestartuj, spróbuj ponownie. Następnie otwórz issue z: wersją REA, systemem, typem celu, krokami odtworzenia, wyjściem błędu, nazwą providera. https://github.com/morluto/rea/issues.

---

## 18. Dane, prywatność i bezpieczeństwo

- REA analizuje cele **na Twojej maszynie**; Twoja aplikacja **nie** jest przez REA wysyłana.
- **Dostawca modelu Twojego agenta** otrzymuje wyniki — obowiązuje jego polityka danych/retencji. Nie wklejaj sekretów ani danych klientów do promptów.
- Schematy wejściowe MCP są domyślnie kompaktowe; ustaw `REA_MCP_INPUT_SCHEMA_PROFILE=full` w rejestracji MCP dla pełnych podpowiedzi pól. Schematy wyjściowe ogranicz przez `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (lub `off`).
- Nagrania środowisk RL mogą zachowywać dane logowania w ciałach/nagłówkach — przejrzyj przed udostępnieniem. Ostrzeżenia credential-name wskazują miejsca do sprawdzenia; **nie** usuwają wartości.
- Sekrety typu `APP_PASSWORD` trzymaj w środowisku serwera MCP, nie w czacie.
- Instaluj REA wyłącznie z `morluto/rea`, `rea.tools` lub npm `rea-agents`.

---

## 19. Ściągawka

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agent kodujący zainstalowany (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (przejrzyj i zaakceptuj plan)
[ ] Klient całkowicie zrestartowany
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Pierwsze dochodzenie: notes-example.zip  →  znaleźć notes:export / notes.csv
[ ] (Opcjonalnie) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → uruchom setup ponownie → zrestartuj agenta
[ ] (Opcjonalnie) Przeglądarka: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Prawnie: jesteś właścicielem / masz licencję na analizę celu
```

---

## 20. Kopia offline / lustro (nieoficjalne)

> ⚠️ **Przeczytaj najpierw.**
> Nie istnieje coś takiego jak "oficjalna kopia" oficjalnego projektu. Jedyną oficjalną REA jest **morluto/rea** (https://github.com/morluto/rea), **rea.tools** i pakiet npm **`rea-agents`**.
> To repozytorium dostarcza kompletne, zgodne z licencją **nieoficjalne lustro / archiwum** oficjalnego projektu z zachowaniem oryginalnej licencji MIT i informacji o prawach autorskich. Istnieje po to, aby **gdyby oficjalne repo, strona lub pakiet npm zniknęły**, można było nadal pozyskać REA tutaj — i nic poza tym.
> Póki oficjalne źródła istnieją, **używaj ich**. Nie przedstawiaj tej kopii jako "oficjalnej" i nie rozpowszechniaj jej jako "oficjalnej REA". To repozytorium nie jest powiązane z autorami REA ani przez nich potwierdzane.

**Licencja:** REA jest na MIT — kopiowanie, modyfikacja i rozpowszechnianie z zachowaniem informacji są dozwolone. Pełna licencja, nagłówki praw autorskich i informacje stron trzecich są zachowane zarówno w gałęzi-lustrze, jak i w tarballu npm. Żadna gwarancja nie jest udzielana.

### Co zawiera kopia

| Część kopii | Gdzie | Czym jest |
|---|---|---|
| Lustro źródeł | Gałąź **`mirror/rea`** | Pełna historia git oficjalnego `morluto/rea` `main` (na dzień ostatniej synchronizacji — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Tagi wydań | Tagi **`rea-agents-*.*.*`** | Wszystkie oficjalne tagi wydań, wskazujące dokładne oficjalne commity (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | Oficjalny pakiet npm, zbudowany wcześniej (z `dist/`) — instalacja **całkowicie offline** |
| Skrypt synchronizacji | **`scripts/sync-backup.ps1`** | Odświeża gałąź-lustro, tagi i najnowszy tarball npm z oficjalnych źródeł |
| Skrypt przywracania | **`scripts/restore-backup.ps1`** | Jednoetapowa instalacja offline tarballa + kolejne kroki |
| Przewodnik | `README.md` (angielski master) | Kompletny przewodnik instalacji; ważny niezależnie od źródła REA |

### Utrzymuj kopię na bieżąco

Uruchamiaj co tydzień (lub zanim zaczniesz na niej polegać):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Wykonuje fetch `upstream/main` + wszystkich tagów, wymusza aktualizację `mirror/rea`, pushuje tagi, pakuje najnowsze `rea-agents-*.*.*` do `backup/` przez `npm pack` i wypisuje końcowe polecenia `git add`/`commit`/`push` dla tarballa.

### Scenariusze odzyskiwania

**Scenariusz A — GitHub padł, npm działa:** nic do odzyskiwania. Nadal używaj `npx rea-agents@latest setup`.

**Scenariusz B — GitHub + npm niedostępne:** zainstaluj gotowy tarball z tego repo (bez sieci, bez narzędzi build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# albo ręcznie:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` zarejestruje serwer MCP + umiejętność w agencie dokładnie jak oficjalny `npx rea-agents setup` — całkowicie offline, bez dotykania registry.

**Scenariusz C — Potrzebujesz też pełnych źródeł/historii:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Pełne oficjalne źródła z momentu ostatniej synchronizacji.
```

Budowa ze źródeł wymaga Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ i dostępu sieci do npm registry (turbo monorepo; `npm ci && npm run build`). Droga tarballa (Scenariusz B) nie wymaga żadnego — zawsze ją preferuj przy odzyskiwaniu.

### Zweryfikuj to, co odzyskałeś
```powershell
# Integralność lustra źródeł — commit musi zgadzać się z ostatnim upstream/main:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # po sklonowaniu gałęzi-lustra
# Integralność tarballa — wersja zgłaszana przez samo CLI:
rea --version
```

Jeśli hashe odbiegają od zapisanych w momencie kopii, traktuj tę kopię jako podejrzaną i zresynchronizuj z oficjalnych źródeł (jeśli wróciły), zanim jej zaufasz.

### Czego ta kopia NIE gwarantuje

- Brak poprawek bezpieczeństwa po ostatniej synchronizacji — porzucona kopia to przestarzała migawka.
- Oficjalny pakiet npm może zawierać nowsze hotfixy niż `mirror/rea` lub tarball.
- Usługi dodatkowe (strona rea.tools, Discord, informacje o wydaniach, dokumentacja) to materiał referencyjny, nie kod do odzyskania stąd.
- Jeśli REA zostanie później wydana ponownie pod inną nazwą/właścicielem, ta migawka nadal działa jako zarchiwizowany upstream — migruj świadomie, nie zakładaj zgodności.

---

**Linki**
- Strona: https://rea.tools/ · Pierwsze kroki: https://rea.tools/get-started/ · Przewodniki: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Źródła: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Społeczność: Discord (zob. stopkę rea.tools) · X: https://x.com/reatools
- **Kopia tego repo:** gałąź `mirror/rea` · tagi `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
