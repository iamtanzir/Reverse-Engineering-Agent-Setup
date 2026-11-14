# Reverse Engineering Agent — Vollständige Einrichtungsanleitung

> **Sprachen:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (Haupt-/Autoritätsversion) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md)
>
> ℹ️ Diese Übersetzung entspricht dem englischen Master. Bei Abweichungen **gewinnt das Englische**. Codeblöcke, Pfade und Befehle werden nie übersetzt.

> **REA — Reverse Engineer Anything**
> Ein MCP-Server (Model Context Protocol) + Untersuchungsfähigkeit, der Ihrem Coding-Agent Werkzeuge zur Inspektion von Software gibt: native Binärdateien, JavaScript/Electron-Apps, Browser, .NET, Android, Firmware und mehr.

- **Offizielle Website:** https://rea.tools/
- **Offizieller Quellcode:** https://github.com/morluto/rea
- **npm-Paket:** `rea-agents`
- **Lizenz:** MIT (REA selbst). Analysewerkzeuge Dritter haben eigene Lizenzen.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (Englisch) — Schritt-für-Schritt-Einrichtung pro Plattform (Windows zuerst: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) mit Fehlerbehandlung
- **📦 Offline-Backup enthalten** — inoffizielles Mirror des offiziellen Repos + npm-Tarball; nur für den Fall, dass die offiziellen Quellen verschwinden. Siehe **[Abschnitt 20 — Offline-Backup / Mirror (inoffiziell)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Wichtig:** Laden Sie REA nur von `morluto/rea`, `rea.tools` oder dem npm-Paket `rea-agents` herunter. Ähnliche Repositorynamen beweisen keine offizielle Veröffentlichung.

---

## Inhaltsverzeichnis

1. Was REA ist (und was nicht)
2. Legale und verantwortungsvolle Nutzung
3. Was Sie analysieren können
4. Systemanforderungen
5. Schritt 1 — Bereiten Sie Ihren Computer vor
6. Schritt 2 — Wählen Sie einen Coding-Agent
7. Schritt 3 — Verbinden Sie REA
8. Schritt 4 — Installation überprüfen
9. Schritt 5 — Ihre erste Untersuchung (Notes-Beispiel)
10. Native Analyse (Binaries / EXE / DLL)
11. JavaScript & Electron-Apps
12. Browser-Beobachtung
13. Weitere Ziele & erforderliche Tools
14. RL-Umgebungen bauen
15. REA aus dem Terminal nutzen (CLI)
16. REA aktualisieren oder entfernen
17. Fehlerbehebung
18. Daten, Datenschutz & Sicherheit
19. Schnellreferenz-Checkliste
20. Offline-Backup / Mirror (inoffiziell)

---

## 1. Was REA ist (und was nicht)

**REA ist:**
- Lokaler MCP-Server + Agent-Fähigkeit — Ihr **Coding-Agent** kann Software inspizieren, die Sie lokal haben.
- Liefert **Beweise**: Assembly, Pseudocode, Modul-Maps, IPC-Kanal-Paarungen, erfasster Netzwerkverkehr, Quellpositionen — nicht den Originalquelltext.
- Analyse läuft **auf Ihrem Rechner**. Ihre App wird von REA nicht hochgeladen; der Modell-Anbieter Ihres Agenten sieht die Ergebnisse (siehe [Daten & Datenschutz](#18-data-privacy--security)).

**REA ist nicht:**
- Kein magischer „Zurück in Quellcode"-Knopf. Ergebnisse sind Assembly/Pseudocode und Referenzen; Ihr Agent erklärt und hilft, das Verhalten nachzubauen.
- Kein Werkzeug zum Knacken von Lizenzen/DRM oder Umgehen kostenpflichtiger Aktivierung. Nutzen Sie es nicht dafür.
- Kein Ausweichmanöver für Obfuskation. Stark gepackte/geschützte Ziele (VMProtect, Themida, Anti-Tamper) bleiben extrem schwierig.
- Kein Zugriff auf die Serverseite. Einen Server hinter einer API können Sie nicht inspizieren; nur die Client-/Netzwerkseite ist sichtbar.

---

## 2. Legale und verantwortungsvolle Nutzung

Reverse Engineering kann für Interoperabilität, Sicherheitsforschung, Debugging und die Analyse von Software, die Sie **besitzen**, legal sein — Gesetze und Lizenzen unterscheiden sich jedoch je nach Rechtsgebiet.

**Sie sollten:**
- Software analysieren, die Sie besitzen, für die Sie eine Lizenz haben oder die Sie inspizieren dürfen.
- Lizenzvereinbarungen, Nutzungsbedingungen und DMCA-Anti-Umgehungsregeln respektieren.
- Ergebnisse für Interoperabilität, Bildung und defensive Sicherheit verwenden.

**Sie sollten nicht:**
- DRM, Lizenzaktivierung oder Kopierschutz umgehen.
- Gecrackten/ge leakten Code proprietärer Software verbreiten.
- Ziele analysieren, die Sie nicht besitzen oder nicht inspizieren dürfen.

Dieser Leitfaden ist keine Rechtsberatung. Im Zweifel fragen Sie einen Anwalt.

---

## 3. Was Sie analysieren können

| Ziel | Was REA zurückgibt | Native Engine nötig? |
|---|---|---|
| Native Binaries / Bibliotheken (EXE, DLL, ELF, Mach-O) | Funktionen, Assembly, Pseudocode, Aufrufer, Xrefs, Konstanten | Ja — Hopper, Ghidra oder IDA |
| JavaScript & Electron-Apps | Module, Imports, IPC-Kanäle + Handler, Quellpositionen | Nein |
| Browserseiten (Laufzeit) | Requests/Responses, Skripte, JSON-Body-Formen, Beobachtungsfenster | Chrome-basierter Browser |
| .NET-Assemblys / Flutter / Pakete | Modul- & Ressourcen-Inspektion | Nein |
| Android-APKs / Geräte / Ressourcen | Dekompilierte Klassen, Ressourcen, Geräteinteraktion | JADX / adb / Apktool |
| Firmware | Extrahierte Dateisysteme/Blobs | Binwalk / Unblob (Linux) |
| WASM | Modul- & Funktionsinspektion | WABT |
| SQLite-Datenbanken | Schema- & Abfrageinspektion | Node.js 24.15+ / 26+ |
| EVM-Bytecode | Vertragsstruktur | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy-Aufnahmen | Geparste Verkehrsbeweise | Node.js / mitmdump |
| PCAP / PCAPNG | Paket-/Protokollfakten | TShark / capinfos (Linux) |

---

## 4. Systemanforderungen

**Minimum:**
- Node.js **22.23.4+**, **24.22.1+** oder **26+ (>= 26.12.1)** (npm inklusive)
- Ein unterstützter Coding-Agent (siehe Schritt 2)
- Ein Arbeitsverzeichnis für Ihre Untersuchungen

**Für native (Binary-)Analyse** — eines von:
- **Ghidra 12.1.x** + 64-Bit **JDK 21+** (kostenlos, empfohlen unter Windows)
- **IDA** (kommerziell; verifizierte Windows-Legacy-GUI- und Headless-Supervisor-Profile)
- **Hopper** (kommerziell; macOS & teils Linux — **unter Windows nicht verfügbar**)

**OS-Hinweise:**
- Windows: **PowerShell** verwenden; Pfade mit Leerzeichen in Anführungszeichen. Wenn Ihr Agent in WSL läuft, installieren Sie Node.js + REA **innerhalb** von WSL und nutzen Sie Linux-Pfade.
- Linux: `procps`-kompatibles `ps` muss im `PATH` sein (für Ghidra/JADX/Firmware und statische Analyse).
- macOS: Terminal verwenden; einige Schritte brauchen Xcode Command Line Tools (Ghidra-Decompiler-Build auf arm64).

---

## 5. Schritt 1 — Bereiten Sie Ihren Computer vor

### 5.1 Node.js prüfen

```powershell
node -v
npm -v
```

Erwartet: `v22.23.4+`, `v24.22.1+` oder `v26.12.1+`. Älter → Node.js 24 LTS installieren.

### 5.2 Node.js unter Windows installieren (falls nicht vorhanden)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Geben Sie `Y` ein, wenn Sie zur Annahme der Bedingungen aufgefordert werden, schließen und öffnen Sie PowerShell erneut und prüfen Sie `node -v`. (Alternativ: Node.js-LTS-Installer von https://nodejs.org/ herunterladen.)

> **PowerShell-Eigenheit:** Wenn `npx` mit „running scripts is disabled on this system" fehlschlägt, verwenden Sie `npx.cmd` und `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Laden Sie das Node.js-24-LTS-`.pkg` herunter oder mit Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# Shell neu öffnen, dann:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Arbeitsverzeichnis erstellen

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Schritt 2 — Wählen Sie einen Coding-Agent

REA unterstützt jeden Agenten, der lokales **MCP** spricht. Wählen Sie einen — alle Beispiele unten verwenden die **Setup-ID** des Clients (`--client <id>`).

| Client | Setup-ID | Installation / Hinweise |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | App installieren, anmelden, dann `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` oder Installationsskript · Anmeldung mit ChatGPT |
| Cursor | `cursor` | Editor installieren, Arbeitsordner öffnen, Agent-Modus |
| Windsurf | `windsurf` | Gleiches Muster; Agent-Chat |
| VS Code | `vscode` | Zuerst GitHub Copilot einrichten, dann Agent-Modus |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` ausführen, `/connect` für Ihr Modell, dann `--client opencode` |
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

**Grok Bot:** Bitten Sie den Bot im Chat, auf seinem gehosteten Computer einen benutzerdefinierten MCP-Server namens `rea` hinzuzufügen:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Schritt 3 — Verbinden Sie REA

### Option A — Ihren Agenten machen lassen (empfohlen)

In den Chat einfügen:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Der Agent führt setup aus, zeigt den Plan und wendet ihn nach Ihrer Freigabe an.

### Option B — Setup selbst ausführen

```powershell
npx rea-agents@latest setup
```

Für einen bestimmten Client:

```powershell
npx rea-agents@latest setup --client opencode
```

Während setup:
- **Pfeiltasten** zum Bewegen, **Space** zum Auswählen, **Enter** zum Fortfahren.
- REA fügt eine **MCP-Verbindung** + die **Untersuchungs-Fähigkeit** hinzu und **sichert** die vorhandene Konfiguration vorher.
- Änderungen gelten erst nach Ihrer Freigabe.
- Beim ersten Übungsdurchlauf können Sie die optionale Hopper-Installation überspringen.

### Client nach dem Setup neu starten

- Desktop-Apps (Claude Desktop, Cursor, Windsurf, VS Code): **vollständig beenden** und neu öffnen (Windows: auch aus dem Infobereich beenden).
- Terminal-Agenten (Claude Code, Codex, Gemini CLI, OpenCode): Sitzung beenden und neu starten.

---

## 8. Schritt 4 — Installation überprüfen

Führen Sie die Doctor-Prüfung für Ihren Client aus (`<client_id>` ersetzen):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Ein gesunder Bericht zeigt `"healthy": true`. Fragen Sie dann Ihren Agenten:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Schritt 5 — Ihre erste Untersuchung (Notes-Beispiel)

Das offizielle Beispiel ist eine kleine Electron-App mit einem **Export notes**-Button. Keine Electron-Installation nötig — der Agent liest den Code.

An den Agenten senden:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Erwartetes Ergebnis: Klick auf Export sendet eine IPC-Nachricht `notes:export`; der Hauptprozess formatiert die Notizen als CSV und schreibt `notes.csv` (Spalten: `id`, `title`) in Ihren Downloads-Ordner.

Manuelle Analyse aus dem Terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native Analyse (Binaries / EXE / DLL)

Tiefe native Analyse braucht einen Provider. Unter **Windows** nutzen Sie **Ghidra** oder **IDA** (Hopper ist unter Windows nicht verfügbar).

### 10.1 Ghidra (kostenlos) — Windows-Setup

1. **64-Bit-JDK 21 oder neuer** installieren (inkl. Compiler). Prüfen:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. **Ghidra 12.1.4** aus der *Assets*-Liste des Releases herunterladen und `ghidra_…_PUBLIC_….zip` entpacken (Release-Archiv, **nicht** „Source code").
3. Merken Sie sich den Entpackordner mit `ghidraRun.bat` — das ist Ihr `GHIDRA_INSTALL_DIR`.
4. In PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # Ordner aus java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Pfade an Ihre Installation anpassen. Verwenden Sie den aktualisierten Setup-Plan, genehmigen Sie und **starten Sie Ihren Agenten neu**.

> Ghidra unter Windows ist **experimentell, schreibgeschützt**, nur für native x86/x64-PE-Anwendungen und DLLs auf festen lokalen **NTFS**-Laufwerken.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Auf macOS arm64 und Linux arm64 zuerst den nativen Decompiler von Ghidra bauen (macOS benötigt Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Installieren und konfigurieren Sie den Upstream-IDA-MCP-Server gemäß dem IDA-Provider-Leitfaden.
2. Speichern Sie die funktionierende Registrierung als `ida-mcp.json`. Beispiel (Headless-Supervisor mit `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Für einen verbundenen 1.4.0-Legacy-GUI-Server kopieren Sie dessen funktionierende command/args/env (vorher das Binary in IDA öffnen und das Plugin starten).
3. Verbinden:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Auf macOS/Linux `export` statt `$env:` verwenden. Nach dem Setup Agenten neu starten.

> Verifizierte IDA-Profile: Windows-Legacy-GUI und Headless-Supervisor sowie macOS-arm64-Headless-Supervisor (IDA Professional 9.1). npm 6.4.0 enthält das macOS-Headless-Profil / die native GUI-Bridge nicht — dafür ist ein REA-Quellbuild nötig.

### 10.4 Hopper (nur macOS / Linux)

Setup kann eine vorhandene Hopper-Installation erkennen oder einen Installationsplan vorschlagen. Auf macOS beim ersten Start Demo-Modus wählen oder Lizenz aktivieren. Automatisches Linux-Setup erfordert einen x86_64-Host mit Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS oder Omarchy. Auf Linux arm64: Ghidra verwenden.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Einen Provider verwenden

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Einmalige Funktionsanalyse per CLI (Ghidra muss konfiguriert sein):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron-Apps

Keine native Engine nötig. Richten Sie Ihren Agenten auf den App-**Ordner** oder die **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

So finden Sie `app.asar` von Electron-Apps:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: oft `/opt/<App>/resources/app.asar`

Statische Analyse aus dem Terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Beachten Sie `normalized_result.summary.ipc` für passende Kanäle/Handler und `normalized_result.graph` für Quellpositionen. Dynamisch berechnete Kanalnamen können ungelöst bleiben — nutzen Sie dann die Browser-Beobachtung (nächster Abschnitt).

---

## 12. Browser-Beobachtung

1. Öffnen Sie die Zielseite in einem Chrome-basierten Browser mit Remote-Debugging, z. B.:

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

2. Fragen Sie Ihren Agenten:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Geben Sie den Endpunkt `http://127.0.0.1:9222` und die Seiten-URL an. Starten Sie die Aufnahme **vor** dem Klick.

   Oder aus dem Terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Für HTTP-Bodies können Fiddler-Everywhere-Exporte (SAZ/HAR 1.2) als REA-Capture-Evidence dienen oder der MCP-Server von Everywhere verbunden werden.

---

## 13. Weitere Ziele & erforderliche Tools

| Ziel | Vorbereitung | Hinweise |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Keine Engine nötig |
| Website | Chrome / Chromium / Edge | Remote-Debugging-Port |
| .NET / Flutter / Pakete | Node.js + npm | Statische Inspektion |
| Android-APK | JADX + JDK 17+ | `classes.dex` dekompilieren |
| Android-Gerät | adb | USB-Debugging aktivieren |
| Android-Ressourcen | Apktool + Java | Entpackt Ressourcen & Manifest |
| JEB-Projekt | JEB + MCP | Kommerzieller Decompiler |
| Firmware | Binwalk / Unblob | **Nur Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite-Datenbank | Node.js 24.15+ / 26+ | |
| EVM-Bytecode | Node.js | **Nur Linux x64** |
| ELF / Linux-Crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Offline-Parsing von Mitschnitten |
| PCAP / PCAPNG | TShark / capinfos | **Nur Linux** |
| Logiksignale | sigrok-cli | **Nur Linux** |
| Prozessverhalten | PTY | **Linux / macOS** |

Flutter, Pakete/Ressourcen, EVM und vollständige Untersuchungsleitfäden: https://rea.tools/guides.

---

## 14. RL-Umgebungen bauen

REA kann eine Test-Web-App-Sitzung aufzeichnen und eine **AgentEnv**-Umgebung zum Trainieren/Bewerten von Agenten exportieren.

1. Bereiten Sie eine **Test**-App-Instanz vor, in der der Agent Daten erstellen/ändern/löschen darf.
2. Fragen Sie Ihren Agenten (Beispiel mit Ordnern):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Halten Sie das Passwort in der MCP-Server-Umgebung (`APP_PASSWORD`), nicht im Prompt.
3. Oder direkt aus einer HAR-Aufnahme bauen:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` prüft den Bericht, ohne Dateien zu schreiben.
4. Ausführen:
   ```bash
   agent-env run ./my-env
   ```
   REAs Kompatibilitätsprüfung nutzt **AgentEnv 0.9.1334 + Python 3.12**; Docker muss laufen.
5. Nur Operationen, deren **Effekte** aufgezeichnet wurden, werden unterstützt (z. B. braucht Löschen die Missing-Item-Antwort und die aktualisierte Liste). Prüfen Sie vor dem Teilen die gespeicherten Antwortkörper — sie können Zugangsdaten enthalten.

---

## 15. REA aus dem Terminal nutzen (CLI)

Ohne globale Installation:

```powershell
npx -y rea-agents@latest --help
```

Den `rea`-Befehl dauerhaft installieren:

```powershell
npm install --global rea-agents
rea --help
rea update
```

curl-Installer für macOS / Linux (zuerst Node.js erforderlich):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Häufige Befehle:

| Befehl | Zweck |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Module, Imports, IPC, Grenzen abbilden |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Eine native Funktion analysieren |
| `rea-agents list-browser-targets <endpoint> --json` | Debugbare Browserseiten auflisten |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Netzwerk/Skripte der Seite beobachten |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL-Umgebung bauen |
| `rea-agents environment-compare … --json` | Umgebung mit Live-App vergleichen |
| `rea-agents doctor --client <id> --json` | Client-Verbindung prüfen |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Nativen Provider prüfen |
| `rea-agents update` | CLI aktualisieren |
| `rea-agents uninstall` | REA-Client-Konfiguration + Fähigkeit entfernen |

---

## 16. REA aktualisieren oder entfernen

**Aktualisieren:**
```powershell
rea update                       # wenn globale CLI installiert ist
npx rea-agents@latest setup      # Agentenverbindung + Fähigkeit aktualisieren; Plan genehmigen, neu starten
```

**Entfernen:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Fehlerbehebung

**Agent sieht die REA-Werkzeuge nicht**
1. Client vollständig neu starten/verbinden (inkl. Infobereich).
2. `npx -y rea-agents@latest doctor --client <id> --json` — bei fehlender/veralteter Registrierung: `npx rea-agents@latest setup --client <id>`, neu starten.
3. Immer noch nichts: MCP-Verbindungsfehler des Clients prüfen; in Editoren REA in den MCP-Einstellungen aktivieren und Werkzeuge freigeben.

**`npx` — „running scripts is disabled" (Windows PowerShell)**
`npx.cmd` / `npm.cmd` verwenden oder `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Pfade mit Leerzeichen**
In Anführungszeichen setzen: `"D:/my apps/tool.exe"`. In WSL Linux-Pfade nutzen und REA in WSL installieren.

**Windows-Ghidra-Grenzen**
Experimentell, schreibgeschützt, nur x86/x64-PE, feste lokale NTFS-Laufwerke. Linux-Alternative: Ghidra/Hopper. Nativer x64-Linux-ELF-Crash-Analyse: pwntools.

**macOS fragt nach Automation-Berechtigung (Hopper)**
Systemeinstellungen → Datenschutz & Sicherheit → Automation → die REA startende App erlauben, erneut versuchen.

**Hopper erster Start**
Vor unbeaufsichtigter Analyse Demo-Modus vs. Lizenzaktivierung abschließen.

**Fehlendes `ps` unter Linux**
`procps` installieren (Debian/Ubuntu: `sudo apt install procps`); REA braucht es für Prüfungen der Prozesseigentümerschaft.

**Ein Bug?**
REA aktualisieren, neu starten, erneut versuchen. Dann ein Issue öffnen mit: REA-Version, OS, Zieltyp, Reproduktionsschritte, Fehlerausgabe, Provider-Name. https://github.com/morluto/rea/issues.

---

## 18. Daten, Datenschutz & Sicherheit

- REA analysiert Ziele **auf Ihrem Rechner**; Ihre App wird **nicht** von REA hochgeladen.
- **Der Modell-Anbieter Ihres Agenten** erhält die Ergebnisse — dessen Daten-/Aufbewahrungsrichtlinie gilt. Fügen Sie keine Geheimnisse oder Kundendaten in Prompts ein.
- MCP-Eingabeschemas sind standardmäßig kompakt; für vollständige Feldhinweise `REA_MCP_INPUT_SCHEMA_PROFILE=full` in der MCP-Registrierung setzen. Ausgabeschemas begrenzbar mit `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (oder `off`).
- RL-Umgebungsaufzeichnungen können Zugangsdaten in Bodies/Headern enthalten — vor dem Teilen prüfen. Credential-Name-Warnungen markieren Stellen — sie **entfernen** keine Werte.
- `APP_PASSWORD`-ähnliche Geheimnisse gehören in die MCP-Server-Umgebung, nicht in den Chat.
- REA nur von `morluto/rea`, `rea.tools` oder npm `rea-agents` installieren.

---

## 19. Schnellreferenz-Checkliste

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding-Agent installiert (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (Plan prüfen & genehmigen)
[ ] Client vollständig neu gestartet
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Erste Untersuchung: notes-example.zip  →  notes:export / notes.csv finden
[ ] (Optional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup erneut → Agent neu starten
[ ] (Optional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Rechtlich: Sie besitzen / dürfen das Ziel analysieren
```

---

## 20. Offline-Backup / Mirror (inoffiziell)

> ⚠️ **Lesen Sie zuerst dies.**
> Es gibt kein „offizielles Backup" eines offiziellen Projekts. Das einzige offizielle REA ist **morluto/rea** (https://github.com/morluto/rea), **rea.tools** und das npm-Paket **`rea-agents`**.
> Dieses Repository bietet ein vollständiges, lizenzkonformes **inoffizielles Mirror / Archiv** des offiziellen Projekts, mit erhaltener MIT-Lizenz und Copyright-Hinweisen. Es existiert, damit Sie **falls das offizielle Repository, die Website oder das npm-Paket verschwindet**, REA hier weiter erhalten können — weiter nichts.
> Solange die offiziellen Quellen existieren, **nutzen Sie diese**. Stellen Sie dieses Backup nicht als „offiziell" dar und verbreiten Sie es nicht als „das offizielle REA". Dieses Repository ist nicht mit den REA-Autoren verbunden oder von ihnen gebilligt.

**Lizenz:** REA ist MIT-lizenziert — Kopieren, Ändern, Verbreiten mit Hinweis erlaubt. Vollständige Lizenz, Copyright-Header und Dritt-Hinweise sind im Mirror-Branch und im npm-Tarball erhalten. Keine Gewährleistung.

### Was das Backup enthält

| Backup-Teil | Wo | Was es ist |
|---|---|---|
| Quell-Mirror | Branch **`mirror/rea`** | Vollständige Git-Historie des offiziellen `morluto/rea` `main` (Stand letzte Synchronisation — v6.9.0, Commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release-Tags | Tags **`rea-agents-*.*.*`** | Alle offiziellen Release-Tags auf exakten offiziellen Commits (v2.7.0 → v6.9.0) |
| npm-Tarball | **`backup/rea-agents-6.9.0.tgz`** | Offizielles npm-Paket, vorgebaut (mit `dist/`) — installiert **komplett offline** |
| Sync-Skript | **`scripts/sync-backup.ps1`** | Aktualisiert Mirror-Branch, Tags und neuesten npm-Tarball aus den offiziellen Quellen |
| Restore-Skript | **`scripts/restore-backup.ps1`** | One-shot-Offline-Installation des Tarballs + nächste Schritte |
| Anleitung | `README.md` (englischer Master) | Vollständige Einrichtungsanleitung; unabhängig von der REA-Quelle gültig |

### Das Backup aktuell halten

Wöchentlich ausführen (oder bevor Sie sich darauf verlassen):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Es führt fetch von `upstream/main` + allen Tags aus, aktualisiert `mirror/rea` per Force-Push, pusht die Tags, packt das neueste `rea-agents-*.*.*` in `backup/` via `npm pack` und gibtdie abschließenden `git add`/`commit`/`push`-Befehle aus.

### Wiederherstellungsszenarien

**Szenario A — GitHub down, npm läuft:** nichts wiederherzustellen. Weiter `npx rea-agents@latest setup` verwenden.

**Szenario B — GitHub + npm beide down:** den vorgebauten Tarball aus diesem Repo installieren (ohne Netz, ohne Build-Tools):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# oder manuell:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` registriert MCP-Server + Fähigkeit bei Ihrem Agenten — exakt wie das offizielle `npx rea-agents setup`, komplett offline, ohne Registry.

**Szenario C — Sie wollen auch die kompletten Quellen/Historie:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Vollständige offizielle Quellen zum Zeitpunkt der letzten Synchronisation.
```

Build aus Quellen erfordert Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ und Netz-Zugriff auf die npm-Registry (turbo monorepo; `npm ci && npm run build`). Der Tarball-Weg (Szenario B) braucht beides nicht — bevorzugen Sie ihn bei der Wiederherstellung.

### Das Wiederhergestellte verifizieren
```powershell
# Integrität des Quell-Mirrors — Commit muss mit letztem upstream/main übereinstimmen:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # nach dem Klonen des Mirror-Branches
# Tarball-Integrität — Version, die die CLI selbst meldet:
rea --version
```

Wenn die Hashes vom Stand beim Backup abweichen, behandeln Sie die Kopie als verdächtig und synchronisieren Sie erneut aus den offiziellen Quellen (falls sie zurück sind), bevor Sie ihr vertrauen.

### Was dieses Backup NICHT garantiert

- Keine Sicherheitspatches nach der letzten Synchronisation — ein verwaistes Backup ist eine veraltete Momentaufnahme.
- Das offizielle npm-Paket kann neuere Hotfixes als `mirror/rea` oder der Tarball enthalten.
- Zusatzdienste (rea.tools-Website, Discord, Release Notes, Doku-Site) sind Referenzmaterial, kein von hier wiederherstellbarer Code.
- Wird REA später unter anderem Namen/Eigner neu veröffentlicht, funktioniert dieser Snapshot weiter als archiviertes Upstream — migrieren Sie bewusst, gehen Sie nicht von Kompatibilität aus.

---

**Links**
- Website: https://rea.tools/ · Einstieg: https://rea.tools/get-started/ · Anleitungen: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Quelle: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Community: Discord (siehe rea.tools-Fußzeile) · X: https://x.com/reatools
- **Backup dieses Repos:** Branch `mirror/rea` · Tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
