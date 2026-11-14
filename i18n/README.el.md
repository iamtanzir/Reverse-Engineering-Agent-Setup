# Reverse Engineering Agent — Πλήρης οδηγός εγκατάστασης

> **Γλώσσες:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (κύρια / αυθεντική) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md)
>
> ℹ️ Αυτή η μετάφραση αντικατοπτρίζει το αγγλικό πρωτότυπο. Σε περίπτωση διαφωνίας **υπερισχύει η αγγλική**. Τα μπλοκ κώδικα, οι διαδρομές και οι εντολές δεν μεταφράζονται ποτέ.

> **REA — Reverse Engineer Anything**
> Ένας διακομιστής MCP (Model Context Protocol) + ικανότητα διερεύνησης: δίνει στον agent κώδικά σας εργαλεία για να επιθεωρεί λογισμικό — εγγενή binaries, εφαρμογές JavaScript/Electron, browsers, .NET, Android, firmware και άλλα.

- **Επίσημος ιστότοπος:** https://rea.tools/
- **Επίσημος πηγαίος κώδικας:** https://github.com/morluto/rea
- **Πακέτο npm:** `rea-agents`
- **Άδεια:** MIT (το ίδιο το REA). Τα εργαλεία ανάλυσης τρίτων έχουν τις δικές τους άδειες.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (στα αγγλικά) — βήμα-βήμα εγκατάσταση ανά πλατφόρμα (πρώτα Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) με αντιμετώπιση προβλημάτων
- **📦 Συμπεριλαμβάνεται offline αντίγραφο** — μη επίσημο mirror του επίσημου repo + tarball npm· μόνο αν εξαφανιστούν οι επίσημες πηγές. Δείτε **[Ενότητα 20 — Offline αντίγραφο / mirror (μη επίσημο)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Σημαντικό:** Κατεβάστε το REA μόνο από `morluto/rea`, `rea.tools` ή το npm package `rea-agents`. Ένα παρόμοιο όνομα repo δεν αποδεικνύει επίσημη κυκλοφορία.

---

## Περιεχόμενα

1. Τι είναι το REA (και τι δεν είναι)
2. Νόμιμη και υπεύθυνη χρήση
3. Τι μπορείτε να αναλύσετε
4. Απαιτήσεις συστήματος
5. Βήμα 1 — Προετοιμάστε τον υπολογιστή σας
6. Βήμα 2 — Επιλέξτε agent κώδικα
7. Βήμα 3 — Συνδέστε το REA
8. Βήμα 4 — Επαληθεύστε την εγκατάσταση
9. Βήμα 5 — Η πρώτη σας διερεύνηση (παράδειγμα Notes)
10. Εγγενής ανάλυση (binaries / EXE / DLL)
11. Εφαρμογές JavaScript & Electron
12. Παρατήρηση browser
13. Άλλοι στόχοι και απαιτούμενα εργαλεία
14. Δημιουργία RL περιβαλλόντων
15. Χρήση του REA από το τερματικό (CLI)
16. Ενημέρωση ή αφαίρεση του REA
17. Αντιμετώπιση προβλημάτων
18. Δεδομένα, απόρρητο και ασφάλεια
19. Λίστα ελέγχου γρήγορης αναφοράς
20. Offline αντίγραφο / mirror (μη επίσημο)

---

## 1. Τι είναι το REA (και τι δεν είναι)

**Το REA είναι:**
- Ένας τοπικός διακομιστής MCP + ικανότητα agent — επιτρέπει **στον agent κώδικά σας** να επιθεωρεί λογισμικό που έχετε τοπικά.
- Επιστρέφει **αποδείξεις**: assembly, ψευδοκώδικα, χάρτες ενοτήτων, ζευγάρια καναλιών IPC, καταγεγραμμένη κίνηση δικτύου, θέσεις πηγαίου κώδικα — όχι τον αρχικό πηγαίο κώδικα.
- Η ανάλυση εκτελείται **στον υπολογιστή σας**. Η εφαρμογή σας δεν ανεβαίνει από το REA· ο πάροχος μοντέλου του agent σας βλέπει τα αποτελέσματα (δείτε [Δεδομένα και απόρρητο](#18-data-privacy--security)).

**Το REA δεν είναι:**
- Μαγικό κουμπί «μετατροπή σε πηγαίο κώδικα». Τα αποτελέσματα είναι assembly/ψευδοκώδικας και αναφορές· ο agent σας εξηγεί και σας βοηθά να ανακατασκευάσετε τη συμπεριφορά.
- Εργαλείο για σπάσιμο αδειών/DRM ή παράκαμψη επί πληρωμή ενεργοποίησης. Μη το χρησιμοποιείτε για αυτό.
- Παράκαμψη απόκρυψης (obfuscation). Στόχοι με βαριά συσκευασία/προστασία (VMProtect, Themida, anti-tamper) παραμένουν εξαιρετικά δύσκολοι.
- Πρόσβαση πλευράς διακομιστή. Δεν μπορεί να επιθεωρήσει διακομιστή πίσω από API· μόνο η πλευρά client/δικτύου είναι ορατή.

---

## 2. Νόμιμη και υπεύθυνη χρήση

Η reverse engineering μπορεί να είναι νόμιμη για διαλειτουργικότητα, έρευνα ασφάλειας, debugging και ανάλυση λογισμικού που **κατέχετε** — αλλά οι νόμοι και οι άδειες διαφέρουν ανά δικαιοδοσία.

**Θα πρέπει:**
- Να αναλύετε λογισμικό που κατέχετε, έχετε άδεια χρήσης ή άδεια επιθεώρησης.
- Να σέβεστε τις άδειες χρήσης, τους Όρους Παροχής Υπηρεσιών και τους κανόνες anti-circumvention του DMCA.
- Να χρησιμοποιείτε τα ευρήματα για διαλειτουργικότητα, εκπαίδευση και αμυντική ασφάλεια.

**Δεν θα πρέπει:**
- Να παρακάμπτετε DRM, ενεργοποίηση άδειας ή προστασία κατά της αντιγραφής.
- Να διανέμετε σπασμένο/διαρρεύσαντα κώδικα ιδιόκτητου λογισμικού.
- Να αναλύετε στόχους που δεν δικαιούστε να κατέχετε ή να επιθεωρείτε.

Αυτός ο οδηγός δεν είναι νομική συμβουλή. Σε αμφιβολία, συμβουλευτείτε δικηγόρο.

---

## 3. Τι μπορείτε να αναλύσετε

| Στόχος | Τι επιστρέφει το REA | Απαιτείται εγγενής μηχανή; |
|---|---|---|
| Εγγενή binaries / βιβλιοθήκες (EXE, DLL, ELF, Mach-O) | Συναρτήσεις, assembly, ψευδοκώδικας, καλούντες, xrefs, σταθερές | Ναι — Hopper, Ghidra ή IDA |
| Εφαρμογές JavaScript & Electron | Ενότητες, imports, κανάλια IPC + handlers, θέσεις πηγαίου | Όχι |
| Σελίδες browser (runtime) | Αιτήματα/απαντήσεις, scripts, σχήματα σωμάτων JSON, παράθυρο παρατήρησης | Browser οικογένειας Chrome |
| Assembly .NET / Flutter / πακέτα | Επιθεώρηση ενοτήτων και πόρων | Όχι |
| Android APK / συσκευές / πόροι | Απομεταγλωττισμένες κλάσεις, πόροι, αλληλεπίδραση με συσκευή | JADX / adb / Apktool |
| Firmware | Εξαγμένοι filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Επιθεώρηση ενοτήτων και συναρτήσεων | WABT |
| Βάσεις SQLite | Επιθεώρηση σχήματος και ερωτημάτων | Node.js 24.15+ / 26+ |
| EVM bytecode | Δομή συμβολαίου | Node.js (Linux x64) |
| Καταγραφές HAR / SAZ / mitmproxy | Αναλυμένες αποδείξεις κίνησης | Node.js / mitmdump |
| PCAP / PCAPNG | Στοιχεία πακέτων/πρωτοκόλλων | TShark / capinfos (Linux) |

---

## 4. Απαιτήσεις συστήματος

**Ελάχιστο:**
- Node.js **22.23.4+**, **24.22.1+** ή **26+ (>= 26.12.1)** (με npm)
- Ένας υποστηριζόμενος agent κώδικα (βήμα 2)
- Ένας φάκελος εργασίας για τις διερευνήσεις σας

**Για εγγενή (binary) ανάλυση** — ένα από:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (δωρεάν, συνιστάται στα Windows)
- **IDA** (εμπορική· επαληθευμένα προφίλ Windows legacy GUI + headless supervisor)
- **Hopper** (εμπορική· macOS και μέρος Linux — **μη διαθέσιμη στα Windows**)

**Σημειώσεις ΛΣ:**
- Windows: χρησιμοποιήστε **PowerShell**· βάλτε διαδρομές με κενά σε εισαγωγικά. Αν ο agent σας τρέχει σε WSL, εγκαταστήστε Node.js + REA **μέσα** στο WSL και χρησιμοποιήστε διαδρομές Linux.
- Linux: `ps` συμβατό με `procps` στο `PATH` (για εκκίνηση Ghidra/JADX/firmware και στατική ανάλυση).
- macOS: χρησιμοποιήστε Terminal· ορισμένα βήματα απαιτούν Xcode Command Line Tools (μεταγλώττιση decompiler Ghidra σε arm64).

---

## 5. Βήμα 1 — Προετοιμάστε τον υπολογιστή σας

### 5.1 Ελέγξτε το Node.js

```powershell
node -v
npm -v
```

Αναμενόμενο: `v22.23.4+`, `v24.22.1+` ή `v26.12.1+`. Παλαιότερο → εγκαταστήστε Node.js 24 LTS.

### 5.2 Εγκαταστήστε το Node.js στα Windows (αν λείπει)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Πατήστε `Y` αν σας ζητηθεί αποδοχή όρων, κλείστε και ανοίξτε ξανά το PowerShell και ελέγξτε `node -v`. (Εναλλακτική: κατεβάστε τον εγκαταστάτη LTS από https://nodejs.org/.)

> **Ιδιαιτερότητα PowerShell:** αν το `npx` αποτύχει με «running scripts is disabled on this system», χρησιμοποιήστε `npx.cmd` και `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Κατεβάστε το `.pkg` του Node.js 24 LTS, ή με Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# ανοίξτε ξανά το shell, μετά:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Δημιουργήστε φάκελο εργασίας

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Βήμα 2 — Επιλέξτε agent κώδικα

Το REA υποστηρίζει οποιονδήποτε agent που μιλά τοπικό **MCP**. Διαλέξτε έναν — όλα τα παραδείγματα χρησιμοποιούν το **setup ID** του client (`--client <id>`).

| Client | Setup ID | Εγκατάσταση / σημειώσεις |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Εγκαταστήστε την εφαρμογή, συνδεθείτε, μετά `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` ή script εγκατάστασης · σύνδεση με ChatGPT |
| Cursor | `cursor` | Εγκαταστήστε τον editor, ανοίξτε τον φάκελο εργασίας, λειτουργία Agent |
| Windsurf | `windsurf` | Ίδιο μοτίβο· chat του agent |
| VS Code | `vscode` | Ρυθμίστε πρώτα το GitHub Copilot, μετά λειτουργία Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, εκτελέστε `opencode`, `/connect` για το μοντέλο σας, μετά `--client opencode` |
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

**Grok Bot:** στο chat του bot, ζητήστε του να προσθέσει έναν προσαρμοσμένο διακομιστή MCP με όνομα `rea` στον φιλοξενούμενο υπολογιστή του:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Βήμα 3 — Συνδέστε το REA

### Επιλογή A — Αφήστε τον agent σας να το κάνει (συνιστάται)

Επικολλήστε στο chat του agent σας:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Ο agent εκτελεί setup, εμφανίζει το πλάνο και το εφαρμόζει μετά την έγκρισή σας.

### Επιλογή B — Εκτελέστε εσείς το setup

```powershell
npx rea-agents@latest setup
```

Για συγκεκριμένο client:

```powershell
npx rea-agents@latest setup --client opencode
```

Κατά το setup:
- **Βέλη** για κίνηση, **Space** για επιλογή, **Enter** για συνέχεια.
- Το REA προσθέτει **σύνδεση MCP** + την **ικανότητα διερεύνησης**, και **κρατά αντίγραφο ασφαλείας** της υπάρχουσας ρύθμισης πριν την αλλαγή.
- Οι αλλαγές εφαρμόζονται μόνο μετά την έγκρισή σας.
- Στην πρώτη άσκηση μπορείτε να παραλείψετε την προαιρετική εγκατάσταση του Hopper.

### Επανεκκινήστε τον client μετά το setup

- Εφαρμογές γραφείου (Claude Desktop, Cursor, Windsurf, VS Code): **κλείστε πλήρως** και ανοίξτε ξανά (Windows: επίσης από το εικονίδιο στο δίσκο συστήματος).
- Agents τερματικού (Claude Code, Codex, Gemini CLI, OpenCode): τερματίστε τη συνεδρία και ξεκινήστε ξανά.

---

## 8. Βήμα 4 — Επαληθεύστε την εγκατάσταση

Εκτελέστε τον έλεγχο doctor για τον client σας (αντικαταστήστε `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Μια υγιής αναφορά εμφανίζει `"healthy": true`. Έπειτα ρωτήστε τον agent σας:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Βήμα 5 — Η πρώτη σας διερεύνηση (παράδειγμα Notes)

Το επίσημο παράδειγμα είναι μια μικρή εφαρμογή Electron με κουμπί **Export notes**. Δεν χρειάζεται εγκατάσταση Electron — ο agent διαβάζει τον κώδικα.

Επικολλήστε στον agent σας:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Αναμενόμενο αποτέλεσμα: το κλικ στο Export στέλνει ένα IPC μήνυμα `notes:export`· η κύρια διεργασία μορφοποιεί τις σημειώσεις σε CSV και γράφει `notes.csv` (στήλες: `id`, `title`) στον φάκελο Λήψεις σας.

Χειροκίνητη ανάλυση από το τερματικό:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Εγγενής ανάλυση (binaries / EXE / DLL)

Η βαθιά εγγενής ανάλυση χρειάζεται έναν provider. Στα **Windows** χρησιμοποιήστε **Ghidra** ή **IDA** (το Hopper δεν είναι διαθέσιμο στα Windows).

### 10.1 Ghidra (δωρεάν) — εγκατάσταση στα Windows

1. Εγκαταστήστε **64-bit JDK 21 ή νεότερο** (με compiler). Ελέγξτε:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Κατεβάστε το **Ghidra 12.1.4** από τη λίστα *Assets* της έκδοσης και αποσυμπιέστε το `ghidra_…_PUBLIC_….zip` (το archive της έκδοσης, **όχι** «Source code»).
3. Σημειώστε τον φάκελο που περιέχει το `ghidraRun.bat` — αυτό είναι το `GHIDRA_INSTALL_DIR` σας.
4. Στο PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # φάκελος που υποδεικνύει το java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Προσαρμόστε τις διαδρομές στις εγκαταστάσεις σας. Εξετάστε το ενημερωμένο πλάνο του setup, εγκρίνετε και **επανεκκινήστε τον agent σας**.

> Η υποστήριξη Ghidra στα Windows είναι **πειραματική, μόνο-ανάγνωση**, για εγγενείς εφαρμογές/DLL PE x86/x64 σε σταθερούς τοπικούς δίσκους **NTFS**.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Σε macOS arm64 και Linux arm64, πρώτα χτίστε τον εγγενή decompiler του Ghidra (το macOS απαιτεί Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Εγκαταστήστε και ρυθμίστε τον upstream server IDA MCP σύμφωνα με τον οδηγό του provider IDA.
2. Αποθηκεύστε τη λειτουργική εγγραφή ως `ida-mcp.json`. Παράδειγμα (headless supervisor με `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Για συνδεδεμένο legacy 1.4.0 GUI server, αντιγράψτε το λειτουργικό command/args/env του (ανοίξτε πρώτα το binary στο IDA και ξεκινήστε το plugin).
3. Συνδέστε:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Σε macOS/Linux χρησιμοποιήστε `export` αντί για `$env:`. Επανεκκινήστε τον agent σας μετά το setup.

> Επαληθευμένα προφίλ IDA: Windows legacy GUI και headless supervisor, καθώς και macOS arm64 headless supervisor (IDA Professional 9.1). Το npm 6.4.0 δεν περιέχει το προφίλ headless του macOS / τη εγγενή γέφυρα GUI — απαιτούν build του REA από τον πηγαίο κώδικα.

### 10.4 Hopper (μόνο macOS / Linux)

Το setup μπορεί να εντοπίσει υπάρχον Hopper ή να προτείνει σχέδιο εγκατάστασης. Στο macOS, στην πρώτη εκκίνηση, επιλέξτε demo mode ή ενεργοποιήστε την άδειά σας. Η αυτόματη εγκατάσταση Linux απαιτεί x86_64 και Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS ή Omarchy. Σε Linux arm64, χρησιμοποιήστε Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Χρήση provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Εφάπαξ ανάλυση συνάρτησης από το CLI (το Ghidra πρέπει να έχει ρυθμιστεί):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Εφαρμογές JavaScript & Electron

Δεν απαιτείται εγγενής μηχανή. Δείξτε τον agent σας στον **φάκελο** της εφαρμογής ή στο **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Πού φυλά οι εφαρμογές Electron το `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: συχνά `/opt/<App>/resources/app.asar`

Στατική ανάλυση από το τερματικό:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Δείτε `normalized_result.summary.ipc` για ταιριασμένα κανάλια/handlers και `normalized_result.graph` για θέσεις πηγαίου. Ονόματα καναλιών που υπολογίζονται δυναμικά μπορεί να μείνουν άλυτα — τότε χρησιμοποιήστε παρατήρηση browser (επόμενη ενότητα).

---

## 12. Παρατήρηση browser

1. Ανοίξτε τη σελίδα-στόχο σε browser οικογένειας Chrome με απομακρυσμένο debugging, π.χ.:

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

2. Ρωτήστε τον agent σας:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Δώστε του το endpoint `http://127.0.0.1:9222` και το URL της σελίδας. Ξεκινήστε την καταγραφή **πριν** το κλικ.

   Ή από το τερματικό:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Για σώματα HTTP, οι εξαγωγές Fiddler Everywhere (SAZ/HAR 1.2) μπορούν να τροφοδοτήσουν την REA capture Evidence, ή συνδέστε τον MCP server του Everywhere.

---

## 13. Άλλοι στόχοι και απαιτούμενα εργαλεία

| Στόχος | Εργαλεία | Σημειώσεις |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Χωρίς μηχανή |
| Ιστότοπος | Chrome / Chromium / Edge | Θύρα απομακρυσμένου debugging |
| .NET / Flutter / πακέτα | Node.js + npm | Στατική επιθεώρηση |
| Android APK | JADX + JDK 17+ | Decompile του `classes.dex` |
| Συσκευή Android | adb | Ενεργοποιήστε USB debugging |
| Πόροι Android | Apktool + Java | Αποσυμπιέζει πόρους και manifest |
| Έργο JEB | JEB + MCP | Εμπορικός decompiler |
| Firmware | Binwalk / Unblob | **Μόνο Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Βάση SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Μόνο Linux x64** |
| ELF / crashes Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Offline ανάλυση καταγραφών |
| PCAP / PCAPNG | TShark / capinfos | **Μόνο Linux** |
| Λογικά σήματα | sigrok-cli | **Μόνο Linux** |
| Συμπεριφορά process | PTY | **Linux / macOS** |

Flutter, πακέτα/πόροι, EVM και πλήρεις οδηγοί διερεύνησης: https://rea.tools/guides.

---

## 14. Δημιουργία RL περιβαλλόντων

Το REA μπορεί να καταγράψει συνεδρία μιας δοκιμαστικής web εφαρμογής και να εξάγει ένα περιβάλλον **AgentEnv** για εκπαίδευση/αξιολόγηση agents.

1. Ετοιμάστε μια **δοκιμαστική** παρουσία εφαρμογής όπου ο agent μπορεί να δημιουργεί/τροποποιεί/διαγράφει δεδομένα.
2. Ρωτήστε τον agent σας (παράδειγμα με φακέλους):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Κρατήστε τον κωδικό στο περιβάλλον του διακομιστή MCP (`APP_PASSWORD`), όχι στο prompt.
3. Ή χτίστε απευθείας από καταγραφή HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   Το `--dry-run` εξετάζει την αναφορά χωρίς να γράφει αρχεία.
4. Εκτελέστε:
   ```bash
   agent-env run ./my-env
   ```
   Ο έλεγχος συμβατότητας του REA χρησιμοποιεί **AgentEnv 0.9.1334 + Python 3.12**· το Docker πρέπει να τρέχει.
5. Υποστηρίζονται μόνο λειτουργίες των οποίων τα **αποτελέσματα** καταγράφηκαν (π.χ. διαγραφή απαιτεί απάντηση στοιχείου-που-λείπει και λίστα ενημερωμένη). Πριν τη κοινοποίηση, εξετάστε τα αποθηκευμένα σώματα απαντήσεων — ενδέχεται να περιέχουν credentials.

---

## 15. Χρήση του REA από το τερματικό (CLI)

Χωρίς καθολική εγκατάσταση:

```powershell
npx -y rea-agents@latest --help
```

Οριστική εγκατάσταση της εντολής `rea`:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Installer curl για macOS / Linux (απαιτείται Node.js πρώτα):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Συνηθισμένες εντολές:

| Εντολή | Σκοπός |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Χάρτης ενοτήτων, imports, IPC, όρια |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Ανάλυση εγγενής συνάρτησης |
| `rea-agents list-browser-targets <endpoint> --json` | Λίστα σελίδων browser για debugging |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Παρατήρηση δικτύου/scripts της σελίδας |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Κατασκευή RL περιβάλλοντος |
| `rea-agents environment-compare … --json` | Σύγκριση περιβάλλοντος με πραγματική εφαρμογή |
| `rea-agents doctor --client <id> --json` | Έλεγχος σύνδεσης client |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Έλεγχος εγγενούς provider |
| `rea-agents update` | Ενημέρωση CLI |
| `rea-agents uninstall` | Αφαίρεση ρύθμισης client + ικανότητας |

---

## 16. Ενημέρωση ή αφαίρεση του REA

**Ενημέρωση:**
```powershell
rea update                       # αν το καθολικό CLI είναι εγκατεστημένο
npx rea-agents@latest setup      # ανανέωση σύνδεσης + ικανότητας· εγκρίνετε το πλάνο, επανεκκινήστε τον agent
```

**Αφαίρεση:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Αντιμετώπιση προβλημάτων

**Ο agent δεν βλέπει τα εργαλεία του REA**
1. Κάντε πλήρη επανεκκίνηση/επανασύνδεση του client (συμπεριλαμβανομένου του εικονιδίου στο δίσκο).
2. `npx -y rea-agents@latest doctor --client <id> --json` — αν η εγγραφή λείπει/παλιά: `npx rea-agents@latest setup --client <id>`, επανεκκινήστε.
3. Ακόμη αόρατα: ελέγξτε το σφάλμα σύνδεσης MCP του client· σε editors, ενεργοποιήστε το REA στις ρυθμίσεις MCP και επιτρέψτε τα εργαλεία του.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
Χρησιμοποιήστε `npx.cmd` / `npm.cmd` ή `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Διαδρομές με κενά**
Σε εισαγωγικά: `"D:/my apps/tool.exe"`. Στο WSL, χρησιμοποιήστε διαδρομές Linux και εγκαταστήστε το REA μέσα στο WSL.

**Περιορισμοί Ghidra στα Windows**
Πειραματικό, μόνο-ανάγνωση, μόνο PE x86/x64, σταθεροί τοπικοί δίσκοι NTFS. Εναλλακτική Linux: Ghidra/Hopper. Ανάλυση crash εγγενών x64 Linux ELF: pwntools.

**Το macOS ζητά άδεια Αυτοματοποίησης (Hopper)**
Ρυθμίσεις Συστήματος → Απόρρητο και Ασφάλεια → Αυτοματοποίηση → επιτρέψτε την εφαρμογή που εκκινεί το REA, ξαναδοκιμάστε.

**Πρώτη εκκίνηση του Hopper**
Ολοκληρώστε την επιλογή demo mode έναντι ενεργοποίησης άδειας πριν από ανεπιτήρητη ανάλυση.

**Λείπει το `ps` στο Linux**
Εγκαταστήστε το `procps` (Debian/Ubuntu: `sudo apt install procps`)· το REA το χρειάζεται για τους ελέγχους ιδιοκτησίας διεργασιών.

**Βρήκατε bug;**
Ενημερώστε το REA, επανεκκινήστε, ξαναδοκιμάστε. Στη συνέχεια ανοίξτε issue με: έκδοση REA, ΛΣ, τύπο στόχου, βήματα αναπαραγωγής, έξοδο σφάλματος, όνομα provider. https://github.com/morluto/rea/issues.

---

## 18. Δεδομένα, απόρρητο και ασφάλεια

- Το REA αναλύει στόχους **στον υπολογιστή σας**· η εφαρμογή σας **δεν** ανεβαίνει από το REA.
- **Ο πάροχος μοντέλου του agent σας** λαμβάνει τα αποτελέσματα — ισχύει η πολιτική δεδομένων/διατήρησής του. Μην επικολλάτε μυστικά ή δεδομένα πελατών στα prompts.
- Τα σχήματα εισόδου MCP είναι συμπιεσμένα από προεπιλογή· ορίστε `REA_MCP_INPUT_SCHEMA_PROFILE=full` στην εγγραφή MCP για πλήρη οδηγία πεδίων. Τα σχήματα εξόδου περιορίζονται με `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (ή `off`).
- Οι καταγραφές RL περιβαλλόντων μπορεί να διατηρούν credentials σε σώματα/κεφαλίδες — ελέγξτε πριν τη κοινοποίηση. Οι προειδοποιήσεις credential-name επισημαίνουν σημεία για έλεγχο· **δεν** αφαιρούν τιμές.
- Μυστικά τύπου `APP_PASSWORD` στο περιβάλλον του διακομιστή MCP, όχι στο chat.
- Εγκαταστήστε το REA μόνο από `morluto/rea`, `rea.tools` ή npm `rea-agents`.

---

## 19. Λίστα ελέγχου γρήγορης αναφοράς

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agent κώδικα εγκατεστημένος (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (εξετάστε & εγκρίνετε το πλάνο)
[ ] Ο client επανεκκινήθηκε πλήρως
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Πρώτη διερεύνηση: notes-example.zip  →  βρείτε notes:export / notes.csv
[ ] (Προαιρετικό) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → ξανατρέξτε setup → επανεκκινήστε τον agent
[ ] (Προαιρετικό) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Νομικά: κατέχετε / έχετε άδεια να αναλύσετε τον στόχο
```

---

## 20. Offline αντίγραφο / mirror (μη επίσημο)

> ⚠️ **Διαβάστε πρώτα αυτό.**
> Δεν υπάρχει κάτι σαν «επίσημο αντίγραφο ασφαλείας» για ένα επίσημο έργο. Το μόνο επίσημο REA είναι το **morluto/rea** (https://github.com/morluto/rea), το **rea.tools** και το npm package **`rea-agents`**.
> Αυτό το repository παρέχει ένα πλήρες, συμβατό με την άδεια **μη επίσημο mirror / αρχείο** του επίσημου έργου, με διατήρηση της αρχικής άδειας MIT και των σημειώσεων πνευματικών δικαιωμάτων. Υπάρχει για την περίπτωση που **το επίσημο repository, ο ιστότοπος ή το npm package εξαφανιστούν**, ώστε να μπορείτε ακόμη να αποκτήσετε το REA εδώ — τίποτα περισσότερο.
> Όσο οι επίσημες πηγές υπάρχουν, **χρησιμοποιήστε τις**. Μην παρουσιάζετε αυτό το αντίγραφο ως «επίσημο» και μην το αναδιανέμετε ως «το επίσημο REA». Αυτό το repository δεν είναι συνδεδεμένο με ή εγκεκριμένο από τους συγγραφείς του REA.

**Άδεια:** το REA διατίθεται με MIT — επιτρέπονται αντιγραφή, τροποποίηση και αναδιανομή με σημείωση. Η πλήρης άδεια, οι κεφαλίδες πνευματικών δικαιωμάτων και οι σημειώσεις τρίτων διατηρούνται τόσο σε αυτό το branch καθρέφτη όσο και στο npm tarball. Δεν παρέχεται καμία εγγύηση.

### Τι περιλαμβάνει το αντίγραφο

| Τμήμα αντιγράφου | Πού | Τι είναι |
|---|---|---|
| Καθρέφτης πηγής | Branch **`mirror/rea`** | Πλήρες ιστορικό git του επίσημου `morluto/rea` `main` (κατά τον τελευταίο συγχρονισμό — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Tags εκδόσεων | Tags **`rea-agents-*.*.*`** | Όλα τα επίσημα release tags, που δείχνουν τα ακριβή επίσημα commits (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Το επίσημο npm package, προκατασκευασμένο (με `dist/`) — εγκατάσταση **πλήρως offline** |
| Script συγχρονισμού | **`scripts/sync-backup.ps1`** | Ανανεώνει το branch-καθρέφτη, τα tags και το νεότερο npm tarball από τις επίσημες πηγές |
| Script επαναφοράς | **`scripts/restore-backup.ps1`** | Offline εγκατάσταση του tarball σε ένα βήμα + επόμενα βήματα |
| Ο οδηγός | `README.md` (αγγλικό πρωτότυπο) | Πλήρης οδηγός εγκατάστασης· ισχύει ανεξάρτητα από την πηγή του REA |

### Κρατήστε το αντίγραφο ενημερωμένο

Εκτελέστε εβδομαδιαία (ή πριν βασιστείτε σε αυτό):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Κάνει fetch `upstream/main` + όλα τα tags, ενημερώνει αναγκαστικά το `mirror/rea`, ωθεί τα tags, πακετάρει το νεότερο `rea-agents-*.*.*` στο `backup/` με `npm pack` και εκτυπώνει τις τελικές εντολές `git add`/`commit`/`push` για το tarball.

### Σενάρια επαναφοράς

**Σενάριο A — GitHub έπεσε, το npm δουλεύει:** τίποτα να επαναφέρετε. Συνεχίστε `npx rea-agents@latest setup`.

**Σενάριο B — GitHub + npm εκτός:** εγκαταστήστε το προκατασκευασμένο tarball από αυτό το repo (χωρίς δίκτυο, χωρίς εργαλεία build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# ή χειροκίνητα:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
Το `rea setup` καταχωρεί τον διακομιστή MCP + την ικανότητα στον agent σας ακριβώς όπως το επίσημο `npx rea-agents setup` — πλήρως offline, χωρίς πρόσβαση στο registry.

**Σενάριο C — Θέλετε και τον πλήρη πηγαίο κώδικα/ιστορικό:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Πλήρης επίσημος πηγαίος κατά τον τελευταίο συγχρονισμό.
```

Η κατασκευή από πηγή απαιτεί Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ και πρόσβαση δικτύου στο npm registry (turbo monorepo· `npm ci && npm run build`). Η διαδρομή tarball (Σενάριο B) δεν απαιτεί κανένα από τα δύο — προτιμήστε την πάντα για επαναφορά.

### Επαληθεύστε ό,τι επαναφέρατε
```powershell
# Ακεραιότητα καθρέφτη πηγής — το commit πρέπει να ταιριάζει με τελευταίο upstream/main:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # μετά το clone του branch-καθρέφτη
# Ακεραιότητα tarball — έκδοση που αναφέρει το ίδιο το CLI:
rea --version
```

Αν τα hashes διαφέρουν από ό,τι καταγράψατε κατά το αντίγραφο, θεωρήστε το αντίγραφο ύποπτο και επανασυγχρονιστείτε από τις επίσημες πηγές (αν επέστρεψαν) πριν το εμπιστευτείτε.

### Τι ΔΕΝ εγγυάται αυτό το αντίγραφο

- Καμία επιδιόρθωση ασφάλειας μετά τον τελευταίο συγχρονισμό — ένα εγκαταλελειμμένο αντίγραφο είναι απαρχαιωμένο snapshot.
- Το επίσημο npm package μπορεί να φέρει νεότερα hotfixes από το `mirror/rea` ή το tarball.
- Οι συνοδευτικές υπηρεσίες (ιστότοπος rea.tools, Discord, σημειώσεις εκδόσεων, ιστότοπος τεκμηρίωσης) είναι υλικό αναφοράς, όχι κώδικας που επαναφέρεται από εδώ.
- Αν το REA επανακυκλοφορήσει αργότερα με άλλο όνομα/ιδιοκτήτη, αυτό το snapshot συνεχίζει να λειτουργεί ως αρχειοθετημένο upstream — μεταβείτε σκόπιμα, μην υποθέτετε συμβατότητα.

---

**Σύνδεσμοι**
- Ιστότοπος: https://rea.tools/ · Ξεκινήστε: https://rea.tools/get-started/ · Οδηγοί: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Πηγή: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Κοινότητα: Discord (δείτε το υποσέλιδο του rea.tools) · X: https://x.com/reatools
- **Αντίγραφο αυτού του repo:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
