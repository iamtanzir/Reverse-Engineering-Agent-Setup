<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — Guide d'installation complet

> **Langues :** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Cette traduction reflète le maître anglais. En cas de divergence, **l'anglais l'emporte**. Les blocs de code, les chemins et les commandes ne sont jamais traduits.

> **REA — Reverse Engineer Anything**
> Un serveur MCP (Model Context Protocol) + une compétence d'investigation, donnant à votre agent de codage des outils pour inspecter des logiciels : binaires natifs, apps JavaScript/Electron, navigateurs, .NET, Android, firmware et plus.

- **Site officiel :** https://rea.tools/
- **Code source officiel :** https://github.com/morluto/rea
- **Paquet npm :** `rea-agents`
- **Licence :** MIT (REA lui-même). Les outils d'analyse tiers ont leurs propres licences.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (en anglais) — installation pas à pas par plateforme (Windows d'abord : Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) avec dépannage
- **📦 Sauvegarde hors ligne incluse** — miroir non officiel du dépôt officiel + tarball npm ; uniquement si les sources officielles disparaissent. Voir **[Section 20 — Sauvegarde / miroir hors ligne (non officiel)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Important :** Téléchargez REA uniquement depuis `morluto/rea`, `rea.tools` ou le paquet npm `rea-agents`. Un nom de dépôt similaire ne prouve pas une version officielle.

---

## Sommaire

1. Ce qu'est REA (et ce que ce n'est pas)
2. Usage légal et responsable
3. Ce que vous pouvez analyser
4. Configuration requise
5. Étape 1 — Préparez votre ordinateur
6. Étape 2 — Choisissez un agent de codage
7. Étape 3 — Connectez REA
8. Étape 4 — Vérifiez l'installation
9. Étape 5 — Votre première investigation (exemple Notes)
10. Analyse native (binaires / EXE / DLL)
11. Apps JavaScript & Electron
12. Observation du navigateur
13. Autres cibles et outils requis
14. Construire des environnements RL
15. Utiliser REA depuis le terminal (CLI)
16. Mettre à jour ou désinstaller REA
17. Dépannage
18. Données, confidentialité et sécurité
19. Checklist de référence rapide
20. Sauvegarde / miroir hors ligne (non officiel)

---

## 1. Ce qu'est REA (et ce que ce n'est pas)

**REA est :**
- Un serveur MCP local + une compétence d'agent — il permet à **votre agent de codage** d'inspecter des logiciels que vous avez localement.
- Il renvoie des **preuves** : assembleur, pseudocode, cartes de modules, appariements de canaux IPC, trafic réseau capturé, emplacements de source — pas le code source original.
- L'analyse s'exécute **sur votre machine**. Votre app n'est pas téléversée par REA ; le fournisseur du modèle de votre agent voit les résultats (voir [Données et confidentialité](#18-data-privacy--security)).

**REA n'est pas :**
- Un bouton magique pour « revenir au code source ». Les résultats sont assembleur/pseudocode et références ; votre agent explique et vous aide à reconstruire le comportement.
- Un outil pour craquer des licences/DRM ou contourner l'activation payante. Ne l'utilisez pas pour cela.
- Un contournement d'obfuscation. Les cibles lourdement empaquetées/protégées (VMProtect, Themida, anti-tamper) restent extrêmement difficiles.
- Un accès côté serveur. Il ne peut pas inspecter un serveur derrière une API ; seul le côté client/réseau est visible.

---

## 2. Usage légal et responsable

L'ingénierie inverse peut être légale pour l'interopérabilité, la recherche en sécurité, le débogage et l'analyse de logiciels que vous **possédez** — les lois et licences varient selon les juridictions.

**Vous devez :**
- Analyser des logiciels que vous possédez, avez le droit d'utiliser ou la permission d'inspecter.
- Respecter les accords de licence, les Conditions d'utilisation et les règles anti-contournement du DMCA.
- Utiliser les résultats pour l'interopérabilité, l'éducation et la sécurité défensive.

**Vous ne devez pas :**
- Contourner un DRM, une activation de licence ou une protection anticopie.
- Distribuer du code cracké/fuité de logiciels propriétaires.
- Analyser des cibles que vous n'avez pas le droit de posséder ou d'inspecter.

Ce guide n'est pas un conseil juridique. En cas de doute, consultez un avocat.

---

## 3. Ce que vous pouvez analyser

| Cible | Ce que REA renvoie | Moteur natif requis ? |
|---|---|---|
| Binaires natifs / bibliothèques (EXE, DLL, ELF, Mach-O) | Fonctions, assembleur, pseudocode, appelants, xrefs, constantes | Oui — Hopper, Ghidra ou IDA |
| Apps JavaScript & Electron | Modules, imports, canaux IPC + gestionnaires, emplacements de source | Non |
| Pages de navigateur (exécution) | Requêtes/réponses, scripts, formes de corps JSON, fenêtre d'observation | Navigateur famille Chrome |
| Assemblys .NET / Flutter / paquets | Inspection de modules et ressources | Non |
| APK Android / appareils / ressources | Classes décompilées, ressources, interaction appareil | JADX / adb / Apktool |
| Firmware | Systèmes de fichiers/blobs extraits | Binwalk / Unblob (Linux) |
| WASM | Inspection de modules et fonctions | WABT |
| Bases de données SQLite | Inspection de schéma et requêtes | Node.js 24.15+ / 26+ |
| Bytecode EVM | Structure du contrat | Node.js (Linux x64) |
| Captures HAR / SAZ / mitmproxy | Preuves de trafic analysées | Node.js / mitmdump |
| PCAP / PCAPNG | Faits paquets/protocoles | TShark / capinfos (Linux) |

---

## 4. Configuration requise

**Minimum :**
- Node.js **22.23.4+**, **24.22.1+** ou **26+ (>= 26.12.1)** (npm inclus)
- Un agent de codage pris en charge (étape 2)
- Un répertoire de travail pour vos investigations

**Pour l'analyse native (binaire)** — l'un de :
- **Ghidra 12.1.x** + **JDK 21+** 64 bits (gratuit, recommandé sous Windows)
- **IDA** (commerciale ; profils vérifiés : GUI héritée Windows + superviseur headless)
- **Hopper** (commerciale ; macOS et certaines distros Linux — **indisponible sous Windows**)

**Notes OS :**
- Windows : utilisez **PowerShell** ; mettez les chemins avec espaces entre guillemets. Si votre agent tourne dans WSL, installez Node.js + REA **dans** WSL et utilisez des chemins Linux.
- Linux : un `ps` compatible `procps` sur le `PATH` (pour lancer Ghidra/JADX/firmware et l'analyse statique).
- macOS : utilisez Terminal ; certaines étapes requièrent Xcode Command Line Tools (compilation du décompilateur Ghidra sur arm64).

---

## 5. Étape 1 — Préparez votre ordinateur

### 5.1 Vérifiez Node.js

```powershell
node -v
npm -v
```

Attendu : `v22.23.4+`, `v24.22.1+` ou `v26.12.1+`. Plus ancien → installez Node.js 24 LTS.

### 5.2 Installez Node.js sous Windows (si absent)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Tapez `Y` si on vous demande d'accepter les termes, fermez et rouvrez PowerShell, vérifiez `node -v`. (Alternative : téléchargez l'installateur LTS depuis https://nodejs.org/.)

> **Spécificité PowerShell :** si `npx` échoue avec « running scripts is disabled on this system », utilisez `npx.cmd` et `npm.cmd` :
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Téléchargez le `.pkg` de Node.js 24 LTS, ou avec Homebrew : `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# rouvrez le shell, puis :
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Créez un dossier de travail

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Étape 2 — Choisissez un agent de codage

REA prend en charge tout agent parlant le **MCP** local. Choisissez-en un — tous les exemples utilisent le **setup ID** du client (`--client <id>`).

| Client | Setup ID | Installation / notes |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Installez l'app, connectez-vous, puis `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` ou script d'installation · connexion avec ChatGPT |
| Cursor | `cursor` | Installez l'éditeur, ouvrez le dossier de travail, mode Agent |
| Windsurf | `windsurf` | Même schéma ; chat de l'agent |
| VS Code | `vscode` | Configurez d'abord GitHub Copilot, puis mode Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, lancez `opencode`, `/connect` pour votre modèle, puis `--client opencode` |
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

**Grok Bot :** dans le chat du bot, demandez-lui d'ajouter un serveur MCP personnalisé nommé `rea` sur son propre ordinateur hébergé :
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Étape 3 — Connectez REA

### Option A — Laissez votre agent s'en charger (recommandé)

Collez dans le chat de votre agent :

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

L'agent exécute setup, montre le plan et l'applique après votre approbation.

### Option B — Exécutez setup vous-même

```powershell
npx rea-agents@latest setup
```

Pour un client précis :

```powershell
npx rea-agents@latest setup --client opencode
```

Pendant setup :
- **Flèches** pour vous déplacer, **Espace** pour sélectionner, **Entrée** pour continuer.
- REA ajoute une **connexion MCP** + la **compétence d'investigation**, et **sauvegarde** la config existante avant modification.
- Les changements ne s'appliquent qu'après votre approbation.
- Pour le premier exercice, l'installation facultative de Hopper peut être sautée.

### Redémarrez le client après setup

- Apps de bureau (Claude Desktop, Cursor, Windsurf, VS Code) : **quittez complètement** et rouvrez (Windows : aussi via l'icône de la barre système).
- Agents terminal (Claude Code, Codex, Gemini CLI, OpenCode) : fermez la session et relancez.

---

## 8. Étape 4 — Vérifiez l'installation

Exécutez le contrôle doctor pour votre client (remplacez `<client_id>`) :

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Un rapport sain affiche `"healthy": true`. Demandez ensuite à votre agent :

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Étape 5 — Votre première investigation (exemple Notes)

L'exemple officiel est une petite app Electron avec un bouton **Export notes**. Pas besoin d'installer Electron — l'agent lit le code.

Collez dans votre agent :

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Résultat attendu : le clic sur Export envoie un message IPC `notes:export` ; le processus principal formate les notes en CSV et écrit `notes.csv` (colonnes : `id`, `title`) dans votre dossier Téléchargements.

Analyse manuelle depuis le terminal :

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Analyse native (binaires / EXE / DLL)

L'analyse native approfondie nécessite un fournisseur. Sous **Windows**, utilisez **Ghidra** ou **IDA** (Hopper est indisponible sous Windows).

### 10.1 Ghidra (gratuit) — configuration Windows

1. Installez un **JDK 64 bits 21 ou plus récent** (avec compilateur). Vérifiez :
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Téléchargez **Ghidra 12.1.4** depuis la liste *Assets* de la version et extrayez `ghidra_…_PUBLIC_….zip` (l'archive de la version, **pas** « Source code »).
3. Notez le dossier extrait contenant `ghidraRun.bat` — c'est votre `GHIDRA_INSTALL_DIR`.
4. Dans PowerShell :
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # dossier indiqué par java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Adaptez les chemins à vos installations. Examinez le plan setup mis à jour, approuvez et **redémarrez votre agent**.

> Le support Ghidra sous Windows est **expérimental, en lecture seule**, pour les apps/DLL PE x86/x64 natifs sur des disques **NTFS** locaux fixes.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Sur macOS arm64 et Linux arm64, compilez d'abord le décompilateur natif de Ghidra (macOS requiert Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Installez et configurez le serveur MCP amont d'IDA selon le guide du fournisseur IDA.
2. Enregistrez la configuration fonctionnelle sous `ida-mcp.json`. Exemple (superviseur headless avec `idb_open`/`idb_list`/`idb_close`) :
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Pour un serveur GUI 1.4.0 hérité connecté, copiez son command/args/env fonctionnel (ouvrez le binaire dans IDA et lancez le plugin d'abord).
3. Connexion :
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Sur macOS/Linux utilisez `export` au lieu de `$env:`. Redémarrez votre agent après setup.

> Profils IDA vérifiés : GUI héritée Windows et superviseur headless, plus le superviseur headless arm64 de macOS (IDA Professional 9.1). npm 6.4.0 n'inclut pas le profil headless macOS / le pont GUI natif — ils nécessitent une compilation de REA depuis les sources.

### 10.4 Hopper (macOS / Linux uniquement)

Setup peut détecter une installation Hopper existante ou proposer un plan d'installation. Sur macOS, au premier lancement, choisissez le mode démo ou activez votre licence. L'installation automatique Linux exige un hôte x86_64 sous Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS ou Omarchy. Sur Linux arm64, utilisez Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Utiliser un fournisseur

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Analyse ponctuelle d'une fonction via la CLI (Ghidra doit être configuré) :

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Apps JavaScript & Electron

Aucun moteur natif requis. Pointez votre agent vers le **dossier** de l'app ou le **.asar** :

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Où les apps Electron stockent le `app.asar` :
- Windows : `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS : `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux : souvent `/opt/<App>/resources/app.asar`

Analyse statique depuis le terminal :

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Consultez `normalized_result.summary.ipc` pour les canaux/gestionnaires appariés et `normalized_result.graph` pour les emplacements de source. Les noms de canaux calculés peuvent rester non résolus — utilisez alors l'observation du navigateur (section suivante).

---

## 12. Observation du navigateur

1. Ouvrez la page cible dans un navigateur famille Chrome avec débogage distant, p. ex. :

   **Windows (PowerShell) :**
   ```powershell
   & "C:\Program Files\Google\Chrome\Application\chrome.exe" `
     --remote-debugging-port=9222 `
     --user-data-dir="$env:TEMP\rea-browser" `
     https://rea.tools/examples/notes-web/
   ```
   **Linux :**
   ```bash
   google-chrome --remote-debugging-port=9222 --user-data-dir=/tmp/rea-notes-browser https://rea.tools/examples/notes-web/
   ```

2. Demandez à votre agent :
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Donnez-lui l'endpoint `http://127.0.0.1:9222` et l'URL de la page. Lancez la capture **avant** le clic.

   Ou depuis le terminal :
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Pour les corps HTTP, les exports Fiddler Everywhere (SAZ/HAR 1.2) peuvent alimenter la Evidence de capture de REA, ou connectez le serveur MCP d'Everywhere.

---

## 13. Autres cibles et outils requis

| Cible | Outils à préparer | Notes |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Sans moteur |
| Site web | Chrome / Chromium / Edge | Port de débogage distant |
| .NET / Flutter / paquets | Node.js + npm | Inspection statique |
| APK Android | JADX + JDK 17+ | Décompiler `classes.dex` |
| Appareil Android | adb | Activer le débogage USB |
| Ressources Android | Apktool + Java | Décompresse ressources et manifeste |
| Projet JEB | JEB + MCP | Décompilateur commercial |
| Firmware | Binwalk / Unblob | **Linux uniquement** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Base SQLite | Node.js 24.15+ / 26+ | |
| Bytecode EVM | Node.js | **Linux x64 uniquement** |
| ELF / crash Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Analyse hors ligne de captures |
| PCAP / PCAPNG | TShark / capinfos | **Linux uniquement** |
| Signaux logiques | sigrok-cli | **Linux uniquement** |
| Comportement de processus | PTY | **Linux / macOS** |

Flutter, paquets/ressources, EVM et guides d'investigation complets : https://rea.tools/guides.

---

## 14. Construire des environnements RL

REA peut enregistrer une session d'app web de test et exporter un environnement **AgentEnv** pour entraîner/évaluer des agents.

1. Préparez une instance d'app **de test** où l'agent peut créer/modifier/supprimer des données.
2. Demandez à votre agent (exemple avec des dossiers) :
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Gardez le mot de passe dans l'environnement du serveur MCP (`APP_PASSWORD`), pas dans le prompt.
3. Ou construisez directement depuis un enregistrement HAR :
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` examine le rapport sans écrire de fichiers.
4. Lancez :
   ```bash
   agent-env run ./my-env
   ```
   Le contrôle de compatibilité de REA utilise **AgentEnv 0.9.1334 + Python 3.12** ; Docker doit tourner.
5. Seules les opérations dont les **effets** ont été enregistrés sont prises en charge (p. ex. la suppression exige la réponse élément manquant et la liste mise à jour). Avant de partager, examinez les corps de réponse conservés — des identifiants peuvent y figurer.

---

## 15. Utiliser REA depuis le terminal (CLI)

Sans installation globale :

```powershell
npx -y rea-agents@latest --help
```

Installer la commande `rea` en permanence :

```powershell
npm install --global rea-agents
rea --help
rea update
```

Installateur curl pour macOS / Linux (Node.js requis) :

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Commandes courantes :

| Commande | Utilité |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Cartographier modules, imports, IPC, frontières |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analyser une fonction native |
| `rea-agents list-browser-targets <endpoint> --json` | Lister les pages de navigateur déboguables |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Observer réseau/scripts de la page |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Construire un environnement RL |
| `rea-agents environment-compare … --json` | Comparer l'environnement à l'app réelle |
| `rea-agents doctor --client <id> --json` | Vérifier la connexion du client |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Vérifier le fournisseur natif |
| `rea-agents update` | Mettre à jour la CLI |
| `rea-agents uninstall` | Supprimer la config client + la compétence |

---

## 16. Mettre à jour ou désinstaller REA

**Mettre à jour :**
```powershell
rea update                       # si la CLI globale est installée
npx rea-agents@latest setup      # renouveler connexion + compétence ; approuvez le plan, redémarrez
```

**Désinstaller :**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Dépannage

**L'agent ne voit pas les outils REA**
1. Redémarrez/reconnectez le client complètement (y compris l'icône de la barre système).
2. `npx -y rea-agents@latest doctor --client <id> --json` — si l'enregistrement manque/périmé : `npx rea-agents@latest setup --client <id>`, redémarrez.
3. Toujours rien : consultez l'erreur de connexion MCP du client ; dans les éditeurs, activez REA dans les réglages MCP et autorisez ses outils.

**`npx` — « running scripts is disabled » (Windows PowerShell)**
Utilisez `npx.cmd` / `npm.cmd` ou `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Chemins avec espaces**
Entre guillemets : `"D:/my apps/tool.exe"`. Sous WSL, chemins Linux et REA installé dans WSL.

**Limites de Ghidra sous Windows**
Expérimental, lecture seule, PE x86/x64 uniquement, disques NTFS locaux fixes. Alternative Linux : Ghidra/Hopper. Analyse d'accidents ELF natifs x64 : pwntools.

**macOS demande une autorisation d'automatisation (Hopper)**
Réglages Système → Confidentialité et sécurité → Automatisation → autorisez l'app qui lance REA, réessayez.

**Premier lancement de Hopper**
Terminez le choix mode démo vs activation de licence avant toute analyse non supervisée.

**`ps` manquant sous Linux**
Installez `procps` (Debian/Ubuntu : `sudo apt install procps`) ; REA en a besoin pour les contrôles de propriété de processus.

**Un bug ?**
Mettez REA à jour, redémarrez, réessayez. Puis ouvrez un issue avec : version de REA, OS, type de cible, étapes de reproduction, sortie d'erreur, nom du fournisseur. https://github.com/morluto/rea/issues.

---

## 18. Données, confidentialité et sécurité

- REA analyse les cibles **sur votre machine** ; votre app n'est **pas** téléversée par REA.
- **Le fournisseur de modèle de votre agent** reçoit les résultats — sa politique de données/rétention s'applique. Ne collez pas de secrets ni de données clients dans les prompts.
- Les schémas d'entrée MCP sont compacts par défaut ; définissez `REA_MCP_INPUT_SCHEMA_PROFILE=full` dans l'enregistrement MCP pour un guidage complet des champs. Les schémas de sortie se limitent avec `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (ou `off`).
- Les enregistrements d'environnements RL peuvent conserver des identifiants dans corps/en-têtes — examinez-les avant de partager. Les avertissements credential-name signalent les endroits ; ils n'**effacent** pas les valeurs.
- Les secrets type `APP_PASSWORD` vont dans l'environnement du serveur MCP, pas dans le chat.
- Installez REA uniquement depuis `morluto/rea`, `rea.tools` ou npm `rea-agents`.

---

## 19. Checklist de référence rapide

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agent de codage installé (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (examinez et approuvez le plan)
[ ] Client complètement redémarré
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Première investigation : notes-example.zip  →  trouver notes:export / notes.csv
[ ] (Optionnel) Native : JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → relancez setup → redémarrez l'agent
[ ] (Optionnel) Navigateur : Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Légal : vous possédez / avez le droit d'analyser la cible
```

---

## 20. Sauvegarde / miroir hors ligne (non officiel)

> ⚠️ **Lisez ceci d'abord.**
> Il n'existe pas de « sauvegarde officielle » pour un projet officiel. Le seul REA officiel est **morluto/rea** (https://github.com/morluto/rea), **rea.tools** et le paquet npm **`rea-agents`**.
> Ce dépôt fournit un **miroir / archive non officiel** complet et conforme à la licence, conservant la licence MIT d'origine et les mentions de copyright. Il existe pour que, **si le dépôt officiel, le site ou le paquet npm disparaît**, vous puissiez encore obtenir REA ici — rien de plus.
> Tant que les sources officielles existent, **utilisez-les**. Ne présentez pas cette sauvegarde comme « officielle » et ne la redistribuez pas comme « le REA officiel ». Ce dépôt n'est ni affilié ni approuvé par les auteurs de REA.

**Licence :** REA est sous MIT — copie, modification, redistribution avec mention autorisées. La licence complète, les en-têtes de copyright et les mentions tierces sont conservés dans la branche miroir et le tarball npm. Aucune garantie.

### Ce que contient la sauvegarde

| Partie de la sauvegarde | Où | Ce que c'est |
|---|---|---|
| Miroir de la source | Branche **`mirror/rea`** | Historique git complet du `main` officiel `morluto/rea` (au dernier sync — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Étiquettes de version | Étiquettes **`rea-agents-*.*.*`** | Toutes les étiquettes de version officielles, pointant les commits officiels exacts (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | Le paquet npm officiel, précompilé (incl. `dist/`) — installation **entièrement hors ligne** |
| Script de synchro | **`scripts/sync-backup.ps1`** | Rafraîchit la branche miroir, les étiquettes et le dernier tarball npm depuis les sources officielles |
| Script de restauration | **`scripts/restore-backup.ps1`** | Installation hors ligne en une fois du tarball + étapes suivantes |
| Le guide | `README.md` (maître anglais) | Guide d'installation complet ; valable quelle que soit la source de REA |

### Gardez la sauvegarde à jour

Exécutez hebdomadairement (ou avant d'en dépendre) :

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Il fait le fetch de `upstream/main` + toutes les étiquettes, force la mise à jour de `mirror/rea`, pousse les étiquettes, emballe la plus récente `rea-agents-*.*.*` dans `backup/` via `npm pack` et affiche les commandes `git add`/`commit`/`push` finales pour le tarball.

### Scénarios de restauration

**Scénario A — GitHub hors service, npm fonctionne :** rien à restaurer. Continuez `npx rea-agents@latest setup`.

**Scénario B — GitHub + npm hors service :** installez le tarball précompilé depuis ce dépôt (sans réseau, sans outils de build) :
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# ou manuellement :
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` enregistre le serveur MCP + la compétence auprès de votre agent exactement comme le `npx rea-agents setup` officiel — entièrement hors ligne, sans toucher au registre.

**Scénario C — Vous voulez aussi la source/historique complets :**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Source officielle complète au moment du dernier sync.
```

Construire depuis la source requiert Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ et un accès réseau au registre npm (turbo monorepo ; `npm ci && npm run build`). La voie tarball (Scénario B) ne requiert ni l'un ni l'autre — préférez-la toujours pour la restauration.

### Vérifiez ce que vous avez restauré
```powershell
# Intégrité du miroir — le commit doit correspondre au dernier upstream/main synchronisé :
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # après clonage de la branche miroir
# Intégrité du tarball — version rapportée par la CLI elle-même :
rea --version
```

Si les empreintes divergent de ce que vous avez enregistré au moment de la sauvegarde, considérez la copie comme suspecte et resynchronisez depuis les sources officielles (si elles sont de retour) avant de lui faire confiance.

### Ce que cette sauvegarde NE garantit PAS

- Aucun correctif de sécurité après le dernier sync — une sauvegarde abandonnée est une photo obsolète.
- Le paquet npm officiel peut contenir des hotfixes plus récents que `mirror/rea` ou le tarball.
- Les services annexes (site rea.tools, Discord, notes de version, site de documentation) sont des documents de référence, pas du code restaurable ici.
- Si REA est republiée sous un nom/propriétaire différent, cet instantané fonctionne encore comme upstream archivé — migrez délibérément, ne présumez pas la compatibilité.

---

**Liens**
- Site : https://rea.tools/ · Démarrer : https://rea.tools/get-started/ · Guides : https://rea.tools/guides/
- FAQ : https://rea.tools/faq/ · Showcases : https://rea.tools/showcases/
- Source : https://github.com/morluto/rea (MIT) · Issues : https://github.com/morluto/rea/issues
- Communauté : Discord (voir le pied de page de rea.tools) · X : https://x.com/reatools
- **Sauvegarde de ce dépôt :** branche `mirror/rea` · étiquettes `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
