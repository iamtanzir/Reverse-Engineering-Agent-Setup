# Reverse Engineering Agent — Guida completa all'installazione

> **Lingue:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (principale / autorevole) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md)
>
> ℹ️ Questa traduzione riflette l'originale inglese. In caso di divergenze **vince l'inglese**. Blocchi di codice, percorsi e comandi non vengono mai tradotti.

> **REA — Reverse Engineer Anything**
> Un server MCP (Model Context Protocol) + una capacità di indagine che dà al tuo agente di coding strumenti per ispezionare software — binari native, app JavaScript/Electron, browser, .NET, Android, firmware e altro.

- **Sito ufficiale:** https://rea.tools/
- **Codice sorgente ufficiale:** https://github.com/morluto/rea
- **Pacchetto npm:** `rea-agents`
- **Licenza:** MIT (il REA stesso). Gli strumenti di analisi di terze parti hanno le proprie licenze.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (in inglese) — installazione passo passo per piattaforma (prima Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) con risoluzione dei problemi
- **📦 Backup offline incluso** — mirror non ufficiale del repo ufficiale + tarball npm; solo se le fonti ufficiali scompaiono. Vedi **[Sezione 20 — Backup / Mirror offline (non ufficiale)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Importante:** Scarica REA solo da `morluto/rea`, `rea.tools` o dal pacchetto npm `rea-agents`. Un nome di repository simile non prova un rilascio ufficiale.

---

## Indice

1. Cos'è REA (e cosa non è)
2. Uso legale e responsabile
3. Cosa puoi analizzare
4. Requisiti di sistema
5. Passo 1 — Prepara il computer
6. Passo 2 — Scegli un agente di coding
7. Passo 3 — Collega REA
8. Passo 4 — Verifica l'installazione
9. Passo 5 — La tua prima indagine (esempio Notes)
10. Analisi native (binari / EXE / DLL)
11. App JavaScript & Electron
12. Osservazione del browser
13. Altri target e strumenti necessari
14. Costruire ambienti RL
15. Usare REA dal terminale (CLI)
16. Aggiornare o rimuovere REA
17. Risoluzione dei problemi
18. Dati, privacy e sicurezza
19. Checklist di riferimento rapido
20. Backup / Mirror offline (non ufficiale)

---

## 1. Cos'è REA (e cosa non è)

**REA è:**
- Un server MCP locale + capacità dell'agente — consente **al tuo agente di coding** di ispezionare il software che hai in locale.
- Restituisce **prove**: assembly, pseudocodice, mappe dei moduli, associazioni di canali IPC, traffico di rete catturato, posizioni sorgente — non il codice sorgente originale.
- L'analisi gira **sulla tua macchina**. La tua app non viene caricata da REA; il provider del modello del tuo agente vede i risultati (vedi [Dati e privacy](#18-data-privacy--security)).

**REA non è:**
- Un pulsante magico "riporta al codice sorgente". I risultati sono assembly/pseudocodice e riferimenti; il tuo agente spiega e ti aiuta a ricostruire il comportamento.
- Uno strumento per craccare licenze/DRM o aggirare l'attivazione a pagamento. Non usarlo per questo.
- Un elusione dell'offuscamento. Target pesantemente impacchettati/protetti (VMProtect, Themida, anti-tamper) restano estremamente difficili.
- Un accesso al lato server. Un server dietro un'API non si ispeziona; solo il lato client/rete è visibile.

---

## 2. Uso legale e responsabile

Il reverse engineering può essere legale per interoperabilità, ricerca sulla sicurezza, debugging e analisi di software che **possiedi** — ma leggi e licenze variano per giurisdizione.

**Dovresti:**
- Analizzare software che possiedi, per cui hai una licenza o il permesso di ispezionare.
- Rispettare accordi di licenza, Termini di servizio e regole anti-elusione della DMCA.
- Usare i risultati per interoperabilità, formazione e sicurezza difensiva.

**Non dovresti:**
- Eludere DRM, attivazione di licenza o protezione anticopia.
- Distribuire codice crackato/trapelato di software proprietario.
- Analizzare target che non hai diritto di possedere o ispezionare.

Questa guida non è un parere legale. Nel dubbio, consulta un avvocato.

---

## 3. Cosa puoi analizzare

| Target | Cosa restituisce REA | Motore native necessario? |
|---|---|---|
| Binari native / librerie (EXE, DLL, ELF, Mach-O) | Funzioni, assembly, pseudocodice, chiamanti, xrefs, costanti | Sì — Hopper, Ghidra o IDA |
| App JavaScript & Electron | Moduli, import, canali IPC + handler, posizioni sorgente | No |
| Pagine del browser (runtime) | Richieste/risposte, script, forme dei body JSON, finestra di osservazione | Browser famiglia Chrome |
| Assembly .NET / Flutter / pacchetti | Ispezione di moduli e risorse | No |
| APK Android / dispositivi / risorse | Classi decompilate, risorse, interazione con dispositivi | JADX / adb / Apktool |
| Firmware | Filesystem/blob estratti | Binwalk / Unblob (Linux) |
| WASM | Ispezione di moduli e funzioni | WABT |
| Database SQLite | Ispezione di schema e query | Node.js 24.15+ / 26+ |
| Bytecode EVM | Struttura del contratto | Node.js (Linux x64) |
| Catture HAR / SAZ / mitmproxy | Prova di traffico analizzato | Node.js / mitmdump |
| PCAP / PCAPNG | Fatti di pacchetti/protocolli | TShark / capinfos (Linux) |

---

## 4. Requisiti di sistema

**Minimo:**
- Node.js **22.23.4+**, **24.22.1+** o **26+ (>= 26.12.1)** (npm incluso)
- Un agente di coding supportato (passo 2)
- Una directory di lavoro per le tue indagini

**Per l'analisi native (binaria)** — uno tra:
- **Ghidra 12.1.x** + **JDK 21+** a 64 bit (gratis, consigliato su Windows)
- **IDA** (commerciale; profili verificati: GUI legacy Windows + supervisor headless)
- **Hopper** (commerciale; macOS e parte di Linux — **non disponibile su Windows**)

**Note sul SO:**
- Windows: usa **PowerShell**; racchiudi tra virgolette i percorsi con spazi. Se il tuo agente gira in WSL, installa Node.js + REA **dentro** WSL e usa percorsi Linux.
- Linux: un `ps` compatibile con `procps` sul `PATH` (per avviare Ghidra/JADX/firmware e analisi statica).
- macOS: usa Terminal; alcuni passaggi richiedono Xcode Command Line Tools (compilazione del decompilatore Ghidra su arm64).

---

## 5. Passo 1 — Prepara il computer

### 5.1 Controlla Node.js

```powershell
node -v
npm -v
```

Atteso: `v22.23.4+`, `v24.22.1+` o `v26.12.1+`. Più vecchio → installa Node.js 24 LTS.

### 5.2 Installa Node.js su Windows (se manca)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Digita `Y` se ti viene chiesto di accettare i termini, chiudi e riapri PowerShell e ricontrolla `node -v`. (Alternativa: scarica l'installer LTS da https://nodejs.org/.)

> **Peculiarità di PowerShell:** se `npx` fallisce con "running scripts is disabled on this system", usa `npx.cmd` e `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Scarica il `.pkg` di Node.js 24 LTS, oppure con Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# riapri la shell, poi:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Crea una cartella di lavoro

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Passo 2 — Scegli un agente di coding

REA supporta qualsiasi agente che parli **MCP** locale. Scegline uno — tutti gli esempi usano lo **setup ID** del client (`--client <id>`).

| Client | Setup ID | Installazione / note |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Installa l'app, accedi, poi `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` o script di installazione · accedi con ChatGPT |
| Cursor | `cursor` | Installa l'editor, apri la cartella di lavoro, modalità Agent |
| Windsurf | `windsurf` | Stesso schema; chat dell'agente |
| VS Code | `vscode` | Prima configura GitHub Copilot, poi modalità Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, lancia `opencode`, `/connect` per il modello, poi `--client opencode` |
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

**Grok Bot:** nella chat del bot, chiedigli di aggiungere un server MCP personalizzato chiamato `rea` sul suo computer ospitato:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Passo 3 — Collega REA

### Opzione A — Lascia fare al tuo agente (consigliato)

Incolla nella chat del tuo agente:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

L'agente esegue setup, mostra il piano e lo applica dopo la tua approvazione.

### Opzione B — Esegui tu setup

```powershell
npx rea-agents@latest setup
```

Per un client specifico:

```powershell
npx rea-agents@latest setup --client opencode
```

Durante setup:
- **Frecce** per spostarti, **Spazio** per selezionare, **Invio** per continuare.
- REA aggiunge una **connessione MCP** + la **capacità di indagine**, e **esegue il backup** della configurazione esistente prima di modificarla.
- Le modifiche si applicano solo dopo la tua approvazione.
- Nel primo esercizio puoi saltare l'installazione opzionale di Hopper.

### Riavvia il client dopo setup

- App desktop (Claude Desktop, Cursor, Windsurf, VS Code): **esci completamente** e riapri (Windows: anche dall'icona nell'area di notifica).
- Agenti da terminale (Claude Code, Codex, Gemini CLI, OpenCode): chiudi la sessione e riavvia.

---

## 8. Passo 4 — Verifica l'installazione

Esegui il controllo doctor per il tuo client (sostituisci `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Un report sano mostra `"healthy": true`. Poi chiedi al tuo agente:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Passo 5 — La tua prima indagine (esempio Notes)

L'esempio ufficiale è una piccola app Electron con un pulsante **Export notes**. Non serve installare Electron — l'agente legge il codice.

Incolla nel tuo agente:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Risultato atteso: il clic su Export invia un messaggio IPC `notes:export`; il processo principale formatta le note in CSV e scrive `notes.csv` (colonne: `id`, `title`) nella cartella Download.

Analisi manuale dal terminale:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Analisi native (binari / EXE / DLL)

L'analisi native profonda richiede un provider. Su **Windows** usa **Ghidra** o **IDA** (Hopper non è disponibile su Windows).

### 10.1 Ghidra (gratis) — configurazione su Windows

1. Installa un **JDK 64 bit 21 o più recente** (con compilatore). Controlla:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Scarica **Ghidra 12.1.4** dall'elenco *Assets* della release ed estrai `ghidra_…_PUBLIC_….zip` (l'archivio della release, **non** "Source code").
3. Annota la cartella estratta con `ghidraRun.bat` — è il tuo `GHIDRA_INSTALL_DIR`.
4. In PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # cartella indicata da java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Adegua i percorsi alle tue installazioni. Esamina il piano setup aggiornato, approva e **riavvia il tuo agente**.

> Il supporto Ghidra su Windows è **sperimentale e in sola lettura**, per app/DLL PE x86/x64 native su unità **NTFS** locali fisse.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Su macOS arm64 e Linux arm64, compila prima il decompilatore native di Ghidra (macOS richiede Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Installa e configura il server MCP upstream di IDA seguendo la guida del provider IDA.
2. Salva la configurazione funzionante come `ida-mcp.json`. Esempio (supervisor headless con `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Per un server GUI legacy 1.4.0 collegato, copia il suo command/args/env funzionante (apri il binario in IDA e avvia il plugin prima).
3. Connetti:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Su macOS/Linux usa `export` al posto di `$env:`. Riavvia il tuo agente dopo setup.

> Profili IDA verificati: GUI legacy Windows e supervisor headless, più il supervisor headless arm64 macOS (IDA Professional 9.1). npm 6.4.0 non include il profilo headless macOS / il ponte GUI native — richiedono una build di REA dal sorgente.

### 10.4 Hopper (solo macOS / Linux)

Setup può rilevare un Hopper esistente o proporre un piano di installazione. Su macOS, al primo avvio, scegli la modalità demo o attiva la licenza. L'installazione automatica su Linux richiede un host x86_64 con Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS o Omarchy. Su Linux arm64, usa Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Usare un provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Analisi una tantum di una funzione dalla CLI (Ghidra deve essere configurato):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. App JavaScript & Electron

Nessun motore native richiesto. Indica al tuo agente la **cartella** dell'app o il **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Dove le app Electron tengono `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: spesso `/opt/<App>/resources/app.asar`

Analisi statica dal terminale:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Consulta `normalized_result.summary.ipc` per canali/handler abbinati e `normalized_result.graph` per le posizioni sorgente. I nomi di canale calcolati possono restare irrisolti — in tal caso usa l'osservazione del browser (sezione successiva).

---

## 12. Osservazione del browser

1. Apri la pagina target in un browser famiglia Chrome con debugging remoto, ad es.:

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

2. Chiedi al tuo agente:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Passagli l'endpoint `http://127.0.0.1:9222` e l'URL della pagina. Avvia la cattura **prima** di cliccare.

   Oppure dal terminale:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Per i body HTTP, le esportazioni di Fiddler Everywhere (SAZ/HAR 1.2) possono alimentare la Evidence di cattura di REA, oppure collega il server MCP di Everywhere.

---

## 13. Altri target e strumenti necessari

| Target | Strumenti da preparare | Note |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Senza motore |
| Sito web | Chrome / Chromium / Edge | Porta di debugging remoto |
| .NET / Flutter / pacchetti | Node.js + npm | Ispezione statica |
| APK Android | JADX + JDK 17+ | Decompilare `classes.dex` |
| Dispositivo Android | adb | Attiva debugging USB |
| Risorse Android | Apktool + Java | Decomprime risorse e manifest |
| Progetto JEB | JEB + MCP | Decompilatore commerciale |
| Firmware | Binwalk / Unblob | **Solo Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Database SQLite | Node.js 24.15+ / 26+ | |
| Bytecode EVM | Node.js | **Solo Linux x64** |
| ELF / crash Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Analisi offline delle catture |
| PCAP / PCAPNG | TShark / capinfos | **Solo Linux** |
| Segnali logici | sigrok-cli | **Solo Linux** |
| Comportamento processi | PTY | **Linux / macOS** |

Flutter, pacchetti/risorse, EVM e guide di indagine complete: https://rea.tools/guides.

---

## 14. Costruire ambienti RL

REA può registrare una sessione di app web di test ed esportare un ambiente **AgentEnv** per addestrare/valutare agenti.

1. Prepara un'istanza di app **di test** in cui l'agente possa creare/modificare/eliminare dati.
2. Chiedi al tuo agente (esempio con le cartelle):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Tieni la password nell'ambiente del server MCP (`APP_PASSWORD`), non nel prompt.
3. Oppure costruisci direttamente da una registrazione HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` esamina il report senza scrivere file.
4. Eseguilo:
   ```bash
   agent-env run ./my-env
   ```
   Il controllo di compatibilità di REA usa **AgentEnv 0.9.1334 + Python 3.12**; Docker deve essere in esecuzione.
5. Sono supportate solo le operazioni i cui **effetti** sono stati registrati (es. eliminare richiede la risposta elemento assente e l'elenco aggiornato). Prima di condividere, esamina i body di risposta conservati — possono contenere credenziali.

---

## 15. Usare REA dal terminale (CLI)

Senza installazione globale:

```powershell
npx -y rea-agents@latest --help
```

Installa il comando `rea` in modo permanente:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Installer curl per macOS / Linux (richiede Node.js):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Comandi comuni:

| Comando | Scopo |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Mappa moduli, import, IPC, confini |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analizza una funzione native |
| `rea-agents list-browser-targets <endpoint> --json` | Elenca pagine del browser debuggabili |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Osserva rete/script della pagina |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Costruisce un ambiente RL |
| `rea-agents environment-compare … --json` | Confronta ambiente e app reale |
| `rea-agents doctor --client <id> --json` | Verifica la connessione del client |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Verifica il provider native |
| `rea-agents update` | Aggiorna la CLI |
| `rea-agents uninstall` | Rimuove configurazione client + capacità |

---

## 16. Aggiornare o rimuovere REA

**Aggiornare:**
```powershell
rea update                       # se la CLI globale è installata
npx rea-agents@latest setup      # rinnova connessione + capacità; approva il piano, riavvia l'agente
```

**Rimuovere:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Risoluzione dei problemi

**L'agente non vede gli strumenti di REA**
1. Riavvia/ricollega il client completamente (inclusa l'icona nell'area di notifica).
2. `npx -y rea-agents@latest doctor --client <id> --json` — se la registrazione manca/è obsoleta: `npx rea-agents@latest setup --client <id>`, riavvia.
3. Ancora nulla: controlla l'errore di connessione MCP del client; negli editor, attiva REA nelle impostazioni MCP e consenti i suoi strumenti.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Usa `npx.cmd` / `npm.cmd` oppure `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Percorsi con spazi**
Tra virgolette: `"D:/my apps/tool.exe"`. In WSL, percorsi Linux e REA installato dentro WSL.

**Limiti di Ghidra su Windows**
Sperimentale, sola lettura, solo PE x86/x64, unità NTFS locali fisse. Alternativa Linux: Ghidra/Hopper. Analisi dei crash ELF native x64 su Linux: pwntools.

**macOS chiede il permesso di Automazione (Hopper)**
Impostazioni di Sistema → Privacy e Sicurezza → Automazione → consenti l'app che avvia REA, riprova.

**Primo avvio di Hopper**
Completa la scelta tra modalità demo e attivazione della licenza prima dell'analisi non supervisionata.

**`ps` mancante su Linux**
Installa `procps` (Debian/Ubuntu: `sudo apt install procps`); REA ne ha bisogno per i controlli di proprietà dei processi.

**Hai trovato un bug?**
Aggiorna REA, riavvia, riprova. Poi apri una issue con: versione di REA, SO, tipo di target, passi di riproduzione, output dell'errore, nome del provider. https://github.com/morluto/rea/issues.

---

## 18. Dati, privacy e sicurezza

- REA analizza i target **sulla tua macchina**; la tua app **non** viene caricata da REA.
- **Il provider del modello del tuo agente** riceve i risultati — vale la sua politica sui dati/conservazione. Non incollare segreti o dati dei clienti nei prompt.
- Gli schemi di input MCP sono compatti di default; imposta `REA_MCP_INPUT_SCHEMA_PROFILE=full` nella registrazione MCP per una guida completa dei campi. Gli schemi di output si limitano con `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (o `off`).
- Le registrazioni degli ambienti RL possono conservare credenziali in body/header — controlla prima di condividere. Gli avvisi credential-name indicano dove rivedere; **non** eliminano i valori.
- I segreti tipo `APP_PASSWORD` vanno nell'ambiente del server MCP, non nella chat.
- Installa REA solo da `morluto/rea`, `rea.tools` o npm `rea-agents`.

---

## 19. Checklist di riferimento rapido

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agente di coding installato (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (esamina e approva il piano)
[ ] Client riavviato completamente
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Prima indagine: notes-example.zip  →  trova notes:export / notes.csv
[ ] (Opzionale) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → riesegui setup → riavvia l'agente
[ ] (Opzionale) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legale: possiedi / hai licenza per analizzare il target
```

---

## 20. Backup / Mirror offline (non ufficiale)

> ⚠️ **Leggi prima questo.**
> Non esiste un "backup ufficiale" per un progetto ufficiale. L'unico REA ufficiale è **morluto/rea** (https://github.com/morluto/rea), **rea.tools** e il pacchetto npm **`rea-agents`**.
> Questo repository fornisce un **mirror / archivio non ufficiale** completo e conforme alla licenza, conservando la licenza MIT originale e gli avvisi di copyright. Esiste perché, **se il repository, il sito o il pacchetto npm ufficiale scompaiono**, tu possa ottenere REA qui — niente di più.
> Finché le fonti ufficiali esistono, **usa quelle**. Non presentare questo backup come "ufficiale" né distribuirlo come "il REA ufficiale". Questo repository non è affiliato né approvato dagli autori di REA.

**Licenza:** REA è sotto MIT — copia, modifica e distribuzione con avviso consentite. La licenza completa, le intestazioni di copyright e gli avvisi di terze parti sono conservati sia nel ramo mirror sia nel tarball npm. Nessuna garanzia di alcun tipo.

### Cosa contiene il backup

| Parte del backup | Dove | Cos'è |
|---|---|---|
| Mirror del sorgente | Ramo **`mirror/rea`** | Storia git completa del `main` ufficiale `morluto/rea` (al momento dell'ultimo sync — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Tag di rilascio | Tag **`rea-agents-*.*.*`** | Tutti i tag di rilascio ufficiali, che puntano ai commit ufficiali esatti (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | Il pacchetto npm ufficiale, precompilato (incl. `dist/`) — installazione **completamente offline** |
| Script di sincronizzazione | **`scripts/sync-backup.ps1`** | Aggiorna il ramo mirror, i tag e il tarball npm più recente dalle fonti ufficiali |
| Script di ripristino | **`scripts/restore-backup.ps1`** | Installazione offline in un unico passo del tarball + passaggi successivi |
| La guida | `README.md` (master inglese) | Guida completa all'installazione; valida indipendentemente dalla fonte di REA |

### Mantieni il backup aggiornato

Eseguilo settimanalmente (o prima di farci affidamento):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Fa fetch di `upstream/main` + tutti i tag, aggiorna forzatamente `mirror/rea`, pusha i tag, impacchetta la `rea-agents-*.*.*` più recente in `backup/` con `npm pack` e stampa i comandi finali `git add`/`commit`/`push` per il tarball.

### Scenari di ripristino

**Scenario A — GitHub giù, npm funziona:** niente da ripristinare. Continua `npx rea-agents@latest setup`.

**Scenario B — GitHub + npm giù:** installa il tarball precompilato da questo repo (senza rete, senza strumenti di build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# oppure manualmente:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` registra il server MCP + la capacità presso il tuo agente esattamente come il `npx rea-agents setup` ufficiale — completamente offline, senza toccare il registro.

**Scenario C — Vuoi anche il sorgente/storia completi:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Sorgente ufficiale completo al momento dell'ultimo sync.
```

La build dal sorgente richiede Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ e accesso di rete al registro npm (turbo monorepo; `npm ci && npm run build`). Il percorso tarball (Scenario B) non richiede né l'uno né l'altro — in caso di ripristino preferisci sempre quello.

### Verifica ciò che hai ripristinato
```powershell
# Integrità del mirror — il commit deve corrispondere all'ultimo upstream/main sincronizzato:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # dopo il clone del ramo mirror
# Integrità del tarball — versione riportata dalla CLI stessa:
rea --version
```

Se gli hash divergono da quelli annotati al momento del backup, considera la copia sospetta e risincronizza dalle fonti ufficiali (se sono tornate) prima di fidartene.

### Cosa questo backup NON garantisce

- Nessuna patch di sicurezza dopo l'ultimo sync — un backup abbandonato è uno snapshot obsoleto.
- Il pacchetto npm ufficiale può contenere hotfix più recenti di `mirror/rea` o del tarball.
- I servizi accessori (sito rea.tools, Discord, note di rilascio, sito documentazione) sono materiale di riferimento, non codice ripristinabile da qui.
- Se REA verrà ripubblicato con un altro nome/proprietario, questo snapshot funzionerà ancora come upstream archiviato — migra deliberatamente, non presumere compatibilità.

---

**Link**
- Sito: https://rea.tools/ · Inizia: https://rea.tools/get-started/ · Guide: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Sorgente: https://github.com/morluto/rea (MIT) · Issue: https://github.com/morluto/rea/issues
- Community: Discord (vedi il piè di pagina di rea.tools) · X: https://x.com/reatools
- **Backup di questo repo:** ramo `mirror/rea` · tag `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
