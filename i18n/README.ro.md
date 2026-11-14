# Reverse Engineering Agent — Ghid complet de instalare

> **Limbi:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Această traducere reflectă varianta engleză. În caz de divergențe, **engleza are prioritate**. Blocurile de cod, căile și comenzile nu se traduc niciodată.

> **REA — Reverse Engineer Anything**
> Un server MCP (Model Context Protocol) + abilitate de investigație: oferă agentului tău de coding instrumente pentru a inspecta software — binare native, aplicații JavaScript/Electron, browsere, .NET, Android, firmware și altele.

- **Site oficial:** https://rea.tools/
- **Cod sursă oficial:** https://github.com/morluto/rea
- **Pachet npm:** `rea-agents`
- **Licență:** MIT (REA însuși). Instrumentele de analiză de la terți au propriile licențe.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (în engleză) — configurare pas cu pas pe platformă (întâi Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2), cu depanare
- **📦 Backup offline inclus** — mirror neoficial al repo-ului oficial + tarball npm; doar dacă sursele oficiale dispar. Vezi **[Secțiunea 20 — Backup / Mirror offline (neoficial)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Important:** Descarcă REA doar de la `morluto/rea`, `rea.tools` sau pachetul npm `rea-agents`. Un nume similar de repo nu dovedește o lansare oficială.

---

## Cuprins

1. Ce este REA (și ce nu este)
2. Utilizare legală și responsabilă
3. Ce poți analiza
4. Cerințe de sistem
5. Pasul 1 — Pregătește calculatorul
6. Pasul 2 — Alege un agent de coding
7. Pasul 3 — Conectează REA
8. Pasul 4 — Verifică instalarea
9. Pasul 5 — Prima ta investigație (exemplul Notes)
10. Analiză nativă (binare / EXE / DLL)
11. Aplicații JavaScript & Electron
12. Observarea browserului
13. Alte ținte și unelte necesare
14. Construiește medii RL
15. Folosește REA din terminal (CLI)
16. Actualizează sau dezinstalează REA
17. Depanare
18. Date, confidențialitate și securitate
19. Checklist de referință rapidă
20. Backup / Mirror offline (neoficial)

---

## 1. Ce este REA (și ce nu este)

**REA este:**
- Un server MCP local + abilitate a agentului — permite **agentului tău de coding** să inspecteze software-ul pe care îl ai local.
- Returnează **dovezi**: assembly, pseudocod, hărți de module, perechi de canale IPC, trafic de rețea capturat, locații ale sursei — nu codul sursă original.
- Analiza rulează **pe mașina ta**. Aplicația ta nu este încărcată de REA; furnizorul modelului agentului vede rezultatele (vezi [Date și confidențialitate](#18-data-privacy--security)).

**REA nu este:**
- Un buton magic de „revenire la codul sursă". Rezultatele sunt assembly/pseudocod și referințe; agentul tău explică și te ajută să reconstruiești comportamentul.
- Un instrument pentru spargerea licențelor/DRM sau ocolirea activării plătite. Nu îl folosi pentru asta.
- Ocolire a obfuscării. Țintele puternic împachetate/protejate (VMProtect, Themida, anti-tamper) rămân extrem de dificile.
- Acces pe partea de server. Un server din spatele unui API nu poate fi inspectat; doar partea client/rețea este vizibilă.

---

## 2. Utilizare legală și responsabilă

Reverse engineering-ul poate fi legal pentru interoperabilitate, cercetare în securitate, depanare și analiza software-ului pe care **îl deții** — dar legile și licențele diferă în funcție de jurisdicție.

**Ar trebui să:**
- Analizezi software pe care îl deții, pentru care ai licență sau permisiunea de a-l inspecta.
- Respecți acordurile de licență, Termenii serviciului și regulile DMCA anti-circumvenție.
- Folosești concluziile pentru interoperabilitate, educație și securitate defensivă.

**Nu ar trebui să:**
- Ocoleasti DRM, activarea licenței sau protecția anti-copiere.
- Distribui cod spart/scurs al software-ului proprietar.
- Analizezi ținte pe care nu ai dreptul să le deții sau inspectezi.

Acest ghid nu este consultanță juridică. În dubiu, consultă un avocat.

---

## 3. Ce poți analiza

| Țintă | Ce returnează REA | Este necesar un motor native? |
|---|---|---|
| Binare native / biblioteci (EXE, DLL, ELF, Mach-O) | Funcții, assembly, pseudocod, apelanți, xrefs, constante | Da — Hopper, Ghidra sau IDA |
| Aplicații JavaScript & Electron | Module, imports, canale IPC + handle-uri, locații ale sursei | Nu |
| Pagini de browser (runtime) | Cereri/răspunduri, scripturi, forme de corp JSON, fereastră de observare | Browser din familia Chrome |
| Asamblări .NET / Flutter / pachete | Inspecția modulelor și resurselor | Nu |
| Android APK / dispozitive / resurse | Clase decompilate, resurse, interacțiune cu dispozitivul | JADX / adb / Apktool |
| Firmware |Sisteme de fișiere/blob-uri extrase | Binwalk / Unblob (Linux) |
| WASM | Inspecție de module și funcții | WABT |
| Baze de date SQLite | Inspecția schemei și a interogărilor | Node.js 24.15+ / 26+ |
| EVM bytecode | Structura contractului | Node.js (Linux x64) |
| Capturi HAR / SAZ / mitmproxy | Dovezi de trafic analizate | Node.js / mitmdump |
| PCAP / PCAPNG | Fapte pachete/protocoale | TShark / capinfos (Linux) |

---

## 4. Cerințe de sistem

**Minim:**
- Node.js **22.23.4+**, **24.22.1+** sau **26+ (>= 26.12.1)** (npm inclus)
- Un agent de coding acceptat (pasul 2)
- Un director de lucru pentru investigațiile tale

**Pentru analiză native (binară)** — unul din următoarele:
- **Ghidra 12.1.x** + **JDK 21+** pe 64 de biți (gratuit, recomandat pe Windows)
- **IDA** (comercial; profiluri verificate: GUI legacy Windows + supervisor headless)
- **Hopper** (comercial; macOS și o parte din Linux — **indisponibil pe Windows**)

**Note despre OS:**
- Windows: folosește **PowerShell**; pune căile cu spații între ghilimele. Dacă agentul tău rulează în WSL, instalează Node.js + REA **înăuntru** în WSL și folosește căi Linux.
- Linux: un `ps` compatibil cu `procps` trebuie să fie în `PATH` (pentru pornirea Ghidra/JADX/firmware și analiza statică).
- macOS: folosește Terminal; anumiți pași necesită Xcode Command Line Tools (compilarea decompilatorului Ghidra pe arm64).

---

## 5. Pasul 1 — Pregătește calculatorul

### 5.1 Verifică Node.js

```powershell
node -v
npm -v
```

Așteptat: `v22.23.4+`, `v24.22.1+` sau `v26.12.1+`. Mai vechi → instalează Node.js 24 LTS.

### 5.2 Instalează Node.js pe Windows (dacă lipsește)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Tastează `Y` dacă ți se cere să accepți termenii, închide și redeschide PowerShell și reverifică `node -v`. (Alternativă: descarcă instalatorul LTS de la https://nodejs.org/.)

> **Particularitate PowerShell:** dacă `npx` eșuează cu „running scripts is disabled on this system", folosește `npx.cmd` și `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Descarcă `.pkg`-ul Node.js 24 LTS sau cu Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# redeschide shell-ul, apoi:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Creează un folder de lucru

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Pasul 2 — Alege un agent de coding

REA acceptă orice agent care vorbește **MCP** local. Alege unul — toate exemplele folosesc **setup ID**-ul clientului (`--client <id>`).

| Client | Setup ID | Instalare / note |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Instalează aplicația, autentifică-te, apoi `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` sau scriptul de instalare · autentificare cu ChatGPT |
| Cursor | `cursor` | Instalează editorul, deschide folderul de lucru, modul Agent |
| Windsurf | `windsurf` | Același model; chatul agentului |
| VS Code | `vscode` | Configurează întâi GitHub Copilot, apoi modul Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, rulează `opencode`, `/connect` pentru modelul tău, apoi `--client opencode` |
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

**Grok Bot:** în chatul botului, cere-i să adauge un server MCP personalizat numit `rea` pe computerul său găzduit:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Pasul 3 — Conectează REA

### Opțiunea A — Lasă agentul să o facă (recomandat)

Lipește în chatul agentului:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agentul rulează setup, arată planul și îl aplică după aprobarea ta.

### Opțiunea B — Rulează setup singur

```powershell
npx rea-agents@latest setup
```

Pentru un client anume:

```powershell
npx rea-agents@latest setup --client opencode
```

În timpul setup:
- **Săgețile** pentru deplasare, **Spațiu** pentru selecție, **Enter** pentru a continua.
- REA adaugă o **conexiune MCP** + **abilitatea de investigație**, și face **backup** configurației existente înainte de modificare.
- Modificările se aplică doar după aprobarea ta.
- La primul exercițiu, instalarea opțională a Hopper poate fi omisă.

### Repornește clientul după setup

- Aplicații desktop (Claude Desktop, Cursor, Windsurf, VS Code): **închide complet** și redeschide (Windows: și din pictograma de tavă).
- Agenți de terminal (Claude Code, Codex, Gemini CLI, OpenCode): închide sesiunea și repornește.

---

## 8. Pasul 4 — Verifică instalarea

Rulează verificarea doctor pentru clientul tău (înlocuiește `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Un raport sănătos afișează `"healthy": true`. Apoi întreabă agentul:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Pasul 5 — Prima ta investigație (exemplul Notes)

Exemplul oficial este o aplicație Electron mică cu un buton **Export notes**. Nu e nevoie să instalezi Electron — agentul citește codul.

Lipește în agent:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Rezultat așteptat: click pe Export trimite un mesaj IPC `notes:export`; procesul principal formatează notițele ca CSV și scrie `notes.csv` (coloanele: `id`, `title`) în folderul Descărcări.

Analiză manuală din terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Analiză nativă (binare / EXE / DLL)

Analiza nativă profundă necesită un provider. Pe **Windows** folosește **Ghidra** sau **IDA** (Hopper nu este disponibil pe Windows).

### 10.1 Ghidra (gratuit) — configurare Windows

1. Instalează un **JDK 64 de biți 21 sau mai nou** (cu compilator). Verifică:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Descarcă **Ghidra 12.1.4** din lista *Assets* a lansării și extrage `ghidra_…_PUBLIC_….zip` (arhiva lansării, **nu** „Source code").
3. Notează folderul extras care conține `ghidraRun.bat` — acesta este `GHIDRA_INSTALL_DIR`.
4. În PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # folderul indicat de java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Ajustează căile la instalările tale. Revizuiește planul setup actualizat, aprobă și **repornește agentul**.

> Suportul Ghidra pe Windows este **experimental, doar-citire**, pentru aplicații/DLL-uri PE x86/x64 native pe unități **NTFS** locale fixe.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Pe macOS arm64 și Linux arm64, compilează mai întâi decompilatorul native al Ghidra (macOS necesită Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Instalează și configurează serverul MCP upstream al IDA conform ghidului providerului IDA.
2. Salvează înregistrarea funcțională ca `ida-mcp.json`. Exemplu (supervisor headless cu `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Pentru un server GUI legacy 1.4.0 conectat, copiază command/args/env care funcționează (deschide binarul în IDA și pornește pluginul mai întâi).
3. Conectează:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Pe macOS/Linux folosește `export` în loc de `$env:`. Repornește agentul după setup.

> Profiluri IDA verificate: Windows legacy GUI și supervisor headless, plus supervisorul headless arm64 macOS (IDA Professional 9.1). npm 6.4.0 nu include profilul headless macOS / podul GUI native — acestea necesită build REA din sursă.

### 10.4 Hopper (doar macOS / Linux)

Setup poate detecta un Hopper existent sau propune un plan de instalare. Pe macOS, la prima pornire, alege modul demo sau activează-ți licența. Instalarea automată Linux cere x86_64 și Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS ori Omarchy. Pe Linux arm64, folosește Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Utilizarea unui provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Analiză unică a unei funcții din CLI (Ghidra trebuie configurat):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Aplicații JavaScript & Electron

Nu e nevoie de motor native. Indică agentului **folderul** aplicației sau **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Unde țin aplicațiile Electron `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: adesea `/opt/<App>/resources/app.asar`

Analiză statică din terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Vezi `normalized_result.summary.ipc` pentru canale/handler-e potrivite și `normalized_result.graph` pentru locațiile sursei. Numele de canale calculate dinamic pot rămâne nerezolvate — folosește observarea browserului (secțiunea următoare).

---

## 12. Observarea browserului

1. Deschide pagina țintă într-un browser din familia Chrome cu debugging la distanță, ex.:

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

2. Întreabă agentul:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Oferă-i endpoint-ul `http://127.0.0.1:9222` și URL-ul paginii. Pornește captura **înainte** de click.

   Sau din terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Pentru corpuri HTTP, exporturile Fiddler Everywhere (SAZ/HAR 1.2) pot alimenta REA capture Evidence sau conectează serverul MCP al Everywhere.

---

## 13. Alte ținte și unelte necesare

| Țintă | Unelte necesare | Note |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Fără motor |
| Website | Chrome / Chromium / Edge | Port de debugging la distanță |
| .NET / Flutter / pachete | Node.js + npm | Inspecție statică |
| Android APK | JADX + JDK 17+ | Decompilare `classes.dex` |
| Dispozitiv Android | adb | Activează debugging USB |
| Resurse Android | Apktool + Java | Dezarhivează resurse și manifest |
| Proiect JEB | JEB + MCP | Decompilator comercial |
| Firmware | Binwalk / Unblob | **Doar Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Bază de date SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Doar Linux x64** |
| ELF / crash Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Analiză offline a capturilor |
| PCAP / PCAPNG | TShark / capinfos | **Doar Linux** |
| Semnale logice | sigrok-cli | **Doar Linux** |
| Comportament procese | PTY | **Linux / macOS** |

Flutter, pachete/resurse, EVM și ghiduri complete de investigație: https://rea.tools/guides.

---

## 14. Construiește medii RL

REA poate înregistra o sesiune a unei aplicații web de test și exporta un mediu **AgentEnv** pentru antrenarea/evaluarea agenților.

1. Pregătește o instanță de aplicație **de test** în care agentul poate crea/edita/șterge date.
2. Întreabă agentul (exemplu cu foldere):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Păstrează parola în mediul serverului MCP (`APP_PASSWORD`), nu în prompt.
3. Sau construiește direct dintr-o înregistrare HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` examinează raportul fără a scrie fișiere.
4. Rulează:
   ```bash
   agent-env run ./my-env
   ```
   Verificarea de compatibilitate REA folosește **AgentEnv 0.9.1334 + Python 3.12**; Docker trebuie să ruleze.
5. Sunt acceptate doar operațiunile ale căror **efecte** au fost înregistrate (ex. ștergerea necesită răspunsul element-lipsă și lista actualizată). Înainte de a partaja, revizuiește corpurile reținute — pot conține credențiale.

---

## 15. Folosește REA din terminal (CLI)

Fără instalare globală:

```powershell
npx -y rea-agents@latest --help
```

Instalează comanda `rea` permanent:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Instalator curl pentru macOS / Linux (necesită Node.js întâi):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Comenzi frecvente:

| Comandă | Scop |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Hartă module, importuri, IPC, limite |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analizează o funcție native |
| `rea-agents list-browser-targets <endpoint> --json` | Listează paginile de browser depanabile |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Observă rețeaua/scripturile paginii |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Construiește un mediu RL |
| `rea-agents environment-compare … --json` | Compară mediul cu aplicația reală |
| `rea-agents doctor --client <id> --json` | Verifică conexiunea clientului |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Verifică providerul native |
| `rea-agents update` | Actualizează CLI-ul |
| `rea-agents uninstall` | Șterge configurația clientului + abilitatea |

---

## 16. Actualizează sau dezinstalează REA

**Actualizare:**
```powershell
rea update                       # dacă CLI-ul global e instalat
npx rea-agents@latest setup      # reîmprospătează conexiunea + abilitatea; aprobă planul, repornește agentul
```

**Dezinstalare:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Depanare

**Agentul nu vede uneltele REA**
1. Repornește/reconectează clientul complet (inclusiv pictograma din tavă).
2. `npx -y rea-agents@latest doctor --client <id> --json` — dacă înregistrarea lipsește/e veche: `npx rea-agents@latest setup --client <id>`, repornește.
3. Tot nu apare: verifică eroarea de conectare MCP a clientului; în editoare, activează REA în setările MCP și permite-i uneltele.

**`npx` — „running scripts is disabled" (Windows PowerShell)**
Folosește `npx.cmd` / `npm.cmd` sau `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Căi cu spații**
Între ghilimele: `"D:/my apps/tool.exe"`. În WSL, folosește căi Linux și instalează REA în WSL.

**Limitări Ghidra pe Windows**
Experimental, doar-citire, doar PE x86/x64, unități NTFS locale fixe. Alternativă Linux: Ghidra/Hopper. Analiza crash-urilor ELF native x64 pe Linux: pwntools.

**macOS cere permisiune de Automatizare (Hopper)**
System Settings → Privacy & Security → Automation → permite aplicația care pornește REA, reîncearcă.

**Prima pornire a Hopper**
Finalizază alegerea mod demo vs activarea licenței înainte de analiză nesupravegheată.

**Lipsește `ps` pe Linux**
Instalează `procps` (Debian/Ubuntu: `sudo apt install procps`); REA are nevoie de el pentru verificările de proprietar al proceselor.

**Ai găsit un bug?**
Actualizează REA, repornește, reîncearcă. Apoi deschide un issue cu: versiunea REA, OS, tipul țintei, pași de reproducere, ieșirea erorii, numele providerului. https://github.com/morluto/rea/issues.

---

## 18. Date, confidențialitate și securitate

- REA analizează țintele **pe mașina ta**; aplicația ta **nu** este încărcată de REA.
- **Furnizorul modelului agentului** primește rezultatele — se aplică politica sa de date/reținere. Nu lipi secrete sau date de clienți în prompturi.
- Schemele de intrare MCP sunt compacte implicit; setează `REA_MCP_INPUT_SCHEMA_PROFILE=full` în înregistrarea MCP pentru îndrumare completă a câmpurilor. Schemele de ieșire pot fi limitate cu `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (sau `off`).
- Înregistrările mediilor RL pot păstra credențiale în corpuri/headere — revizuiește înainte de a partaja. Avertismentele credential-name marchează locurile de revizuit; ele **nu** elimină valorile.
- Secrete precum `APP_PASSWORD` merg în mediul serverului MCP, nu în chat.
- Instalează REA doar de la `morluto/rea`, `rea.tools` sau npm `rea-agents`.

---

## 19. Checklist de referință rapidă

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agent de coding instalat (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (revizuiește și aprobă planul)
[ ] Client repornit complet
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Prima investigație: notes-example.zip  →  găsește notes:export / notes.csv
[ ] (Opțional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → rulează setup din nou → repornește agentul
[ ] (Opțional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: deții ținta / ai licență să o analizezi
```

---

## 20. Backup / Mirror offline (neoficial)

> ⚠️ **Citește asta mai întâi.**
> Nu există așa ceva ca „backup oficial" al unui proiect oficial. Singurul REA oficial este **morluto/rea** (https://github.com/morluto/rea), **rea.tools** și pachetul npm **`rea-agents`**.
> Acest repo oferă un **mirror / arhivă neoficială** completă și conformă cu licența, păstrând licența MIT originală și notificările de copyright. Există pentru cazul în care **repo-ul oficial, site-ul sau pachetul npm oficial dispar**, ca să poți obține REA de aici — nimic mai mult.
> Cât timp sursele oficiale există, **folosește-le**. Nu prezenta acest backup ca „oficial" și nu-l redistribui ca „REA oficial". Acest repo nu este afiliat cu și nici atestat de autorii REA.

**Licență:** REA este sub MIT — copia, modificarea și redistribuirea cu notificare sunt permise. Licența completă, antetele de copyright și notificările terților sunt păstrate atât în ramura-mirror, cât și în tarball-ul npm. Fără garanție de niciun fel.

### Ce conține backup-ul

| Parte a backup-ului | Unde | Ce este |
|---|---|---|
| Mirror-ul sursei | Ramura **`mirror/rea`** | Istoria git completă a `main`-ului oficial `morluto/rea` (la ultima sincronizare — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Taguri de rilis | Tagurile **`rea-agents-*.*.*`** | Toate tagurile de rilis oficiale, indicând commiturile oficiale exacte (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | Pachetul npm oficial, precompilat (cu `dist/`) — instalare **complet offline** |
| Script de sincronizare | **`scripts/sync-backup.ps1`** | Reîmprospătează ramura mirror, tagurile și cel mai nou tarball npm din sursele oficiale |
| Script de restaurare | **`scripts/restore-backup.ps1`** | Instalare offline într-un pas a tarball-ului + pași următori |
| Ghidul | `README.md` (masterul englez) | Ghid complet de instalare; valabil indiferent de sursa REA |

### Păstrează backup-ul actualizat

Rulează săptămânal (sau înainte să te bazezi pe el):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Face fetch `upstream/main` + toate tagurile, actualizează forțat `mirror/rea`, împinge tagurile, împachetează cea mai nouă `rea-agents-*.*.*` în `backup/` cu `npm pack` și afișează comenzile finale `git add`/`commit`/`push` pentru tarball.

### Scenarii de restaurare

**Scenariul A — GitHub e jos, npm funcționează:** nimic de restaurat. Continuă `npx rea-agents@latest setup`.

**Scenariul B — GitHub + npm sunt ambele jos:** instalează tarball-ul precompilat din acest repo (fără rețea, fără unelte de build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# sau manual:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` înregistrează serverul MCP + abilitatea la agentul tău exact ca `npx rea-agents setup` oficial — complet offline, fără a atinge registry-ul.

**Scenariul C — Vrei și sursa/istoricul complet:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Sursa oficială completă la momentul ultimei sincronizări.
```

Build din sursă necesită Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ și acces la rețea spre npm registry (turbo monorepo; `npm ci && npm run build`). Calea tarball (Scenariul B) nu necesită nici unul — prefer-o mereu pentru restaurare.

### Verifică ce ai restaurat
```powershell
# Integritatea mirror-ului — commitul trebuie să corespundă cu upstream/main sincronizat ultima dată:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # după clonarea ramurii mirror
# Integritatea tarball-ului — versiunea raportată de CLI-ul însuși:
rea --version
```

Dacă hash-urile diferă de cele notate la momentul backup-ului, consideră copia suspectă și re-sincronizează din sursele oficiale (dacă au revenit) înainte să ai încredere în ea.

### Ce NU garantează acest backup

- Fără patch-uri de securitate după ultima sincronizare — un backup abandonat este un snapshot învechit.
- Pachetul npm oficial poate conține hotfix-uri mai noi decât `mirror/rea` sau tarball-ul.
- Serviciile anexe (site-ul rea.tools, Discord, note de lansare, site-ul de documentație) sunt material de referință, nu cod restaurabil de aici.
- Dacă REA va fi relansat ulterior sub alt nume/proprietar, acest snapshot funcționează în continuare ca upstream arhivat — migrează conștient, nu presupune compatibilitate.

---

**Linkuri**
- Site: https://rea.tools/ · Început: https://rea.tools/get-started/ · Ghiduri: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Sursă: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Comunitate: Discord (vezi subsolul rea.tools) · X: https://x.com/reatools
- **Backup-ul acestui repo:** ramura `mirror/rea` · tagurile `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
