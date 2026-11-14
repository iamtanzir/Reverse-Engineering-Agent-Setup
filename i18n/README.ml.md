# Reverse Engineering Agent — പൂർണ്ണ സജ്ജീകരണ മാർഗ്ഗനിർദ്ദേശം

> **ഭാഷകൾ:** 🇬🇧 [English](../README.md) (പ്രധാന / അംഗീകൃതം) · 🇨🇳 [简体中文](README.zh-CN.md) · 🇹🇼 [繁體中文](README.zh-TW.md) · 🇯🇵 [日本語](README.ja.md) · 🇰🇷 [한국어](README.ko.md) · 🇹🇷 [Türkçe](README.tr.md) · 🇷🇺 [Русский](README.ru.md) · 🇻🇳 [Tiếng Việt](README.vi.md) · 🇹🇭 [ไทย](README.th.md) · 🇩🇪 [Deutsch](README.de.md) · 🇪🇸 [Español](README.es.md) · 🇫🇷 [Français](README.fr.md) · 🇺🇦 [Українська](README.uk.md) · 🇵🇱 [Polski](README.pl.md) · 🇧🇷 [Português (Brasil)](README.pt-BR.md) · 🇸🇦 [العربية](README.ar.md) · 🇮🇷 [فارسی](README.fa.md) · 🇮🇩 [Bahasa Indonesia](README.id.md) · 🇮🇹 [Italiano](README.it.md) · 🇬🇷 [Ελληνικά](README.el.md) · 🇮🇳 [മലയാളം](README.ml.md) · 🇵🇰 [Roman Urdu](README.ur-Latn.md) · 🇷🇴 [Română](README.ro.md) · 🇧🇬 [Български](README.bg.md)
>
> ℹ️ ഈ പരിഭാഷ ഇംഗ്ലീഷ് മൂലവുമായി യോജിക്കുന്നു. വ്യത്യാസമുണ്ടെങ്കിൽ **ഇംഗ്ലീഷ് ആണു ജയിക്കുന്നത്**. കോഡ് ബ്ലോക്കുകൾ, പാതകൾ, കമാൻഡുകൾ ഒരിക്കലും പരിഭാഷിപ്പിക്കില്ല.

> **REA — Reverse Engineer Anything**
> ഒരു MCP (Model Context Protocol) സെർവറും അന്വേഷണ കഴിവും — നിങ്ങളുടെ കോഡിംഗ് ഏജന്റിന് സോഫ്റ്റ്‌വെയർ പരിശോധിക്കാനുള്ള ഉപകരണങ്ങൾ നൽകുന്നു: native binaries, JavaScript/Electron ആപ്പുകൾ, ബ്രൗസറുകൾ, .NET, Android, firmware തുടങ്ങിയവ.

- **ഔദ്യോഗിക വെബ്‌സൈറ്റ്:** https://rea.tools/
- **ഔദ്യോഗിക സോഴ്സ് കോഡ്:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **ലൈസൻസ്:** MIT (REA സ്വയം). മൂന്നാം കക്ഷി വിശകലന ഉപകരണങ്ങൾക്ക് അവരുടേതായ ലൈസൻസുകളുണ്ട്.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (ഇംഗ്ലീഷിൽ) — പ്ലാറ്റ്‌ഫോം പ്രകാരം ഘട്ടംഘട്ട സജ്ജീകരണം (Windows ആദ്യം: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) പിശക് പരിഹാരത്തോടൊപ്പം
- **📦 offline ബാക്കപ്പ് ഉൾപ്പെടുത്തിയിട്ടുണ്ട്** — ഔദ്യോഗിക repo-യുടെ അനൗദ്യോഗിക mirror + npm tarball; ഔദ്യോഗിക ഉറവിടങ്ങൾ അപ്രത്യക്ഷമായാൽ മാത്രം ഉപയോഗിക്കുക. കാണുക **[വിഭാഗം 20 — Offline ബാക്കപ്പ് / mirror (അനൗദ്യോഗികം)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **പ്രധാനം:** REA `morluto/rea`, `rea.tools`, അല്ലെങ്കിൽ `rea-agents` npm package-ൽ നിന്ന് മാത്രം ഡൗൺലോഡ് ചെയ്യുക. സമാനമായ repo പേരുകൾ ഔദ്യോഗിക റിലീസ് ആണെന്ന് തെളിയിക്കില്ല.

---

## ഉള്ളടക്കം

1. REA എന്താണ് (എന്തല്ല)
2. നിയമപരവും ഉത്തരവാദിത്തമുള്ളതുമായ ഉപയോഗം
3. നിങ്ങൾക്ക് എന്ത് വിശകലനം ചെയ്യാം
4. സിസ്റ്റം ആവശ്യകതകൾ
5. ഘട്ടം 1 — നിങ്ങളുടെ കമ്പ്യൂട്ടർ തയ്യാറാക്കുക
6. ഘട്ടം 2 — ഒരു കോഡിംഗ് ഏജന്റ് തിരഞ്ഞെടുക്കുക
7. ഘട്ടം 3 — REA കണക്റ്റ് ചെയ്യുക
8. ഘട്ടം 4 — ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
9. ഘട്ടം 5 — നിങ്ങളുടെ ആദ്യ അന്വേഷണം (Notes ഉദാഹരണം)
10. Native വിശകലനം (binaries / EXE / DLL)
11. JavaScript & Electron ആപ്പുകൾ
12. ബ്രൗസർ നിരീക്ഷണം
13. മറ്റ് ലക്ഷ്യങ്ങളും ആവശ്യമായ ഉപകരണങ്ങളും
14. RL പരിതസ്ഥിതികൾ നിർമ്മിക്കുക
15. ടർമിനലിൽ നിന്ന് REA ഉപയോഗിക്കുക (CLI)
16. REA അപ്ഡേറ്റ് അല്ലെങ്കിൽ നീക്കം ചെയ്യുക
17. തകരാർ പരിഹാരം
18. ഡാറ്റ, സ്വകാര്യത & സുരക്ഷ
19. ദ്രുത റഫറൻസ് ചെക്ക്‌ലിസ്റ്റ്
20. Offline ബാക്കപ്പ് / mirror (അനൗദ്യോഗികം)

---

## 1. REA എന്താണ് (എന്തല്ല)

**REA ആണ്:**
- ഒരു പ്രാദേശിക MCP സെർവറും ഏജന്റ് കഴിവും — നിങ്ങളുടെ **കോഡിംഗ് ഏജന്റിന്** റിലീസായി ഉള്ള സോഫ്റ്റ്‌വെയർ പരിശോധിക്കാൻ അവസരം നൽകുന്നു.
- **തെളിവുകൾ** നൽകുന്നു: assembly, pseudocode, module മാപ്പുകൾ, IPC ചാനൽ ജോഡികൾ, പിടിച്ചെടുത്ത നെറ്റ്‌വർക്ക് ട്രാഫിക്, സോഴ്സ് ലൊക്കേഷനുകൾ — യഥാർത്ഥ സോഴ്സ് കോഡ് അല്ല.
- വിശകലനം **നിങ്ങളുടെ മെഷീനിൽ** നടക്കുന്നു. നിങ്ങളുടെ ആപ്പ് REA അപ്‌ലോഡ് ചെയ്യില്ല; നിങ്ങളുടെ ഏജന്റിന്റെ മോഡൽ ദാതാവ് ഫലങ്ങൾ കാണും ([ഡാറ്റയും സ്വകാര്യതയും](#18-data-privacy--security) കാണുക).

**REA അല്ല:**
- «സോഴ്സ് കോഡിലേക്ക് തിരികെ പരിവർത്തിക്കുക» എന്ന മാജിക് ബട്ടൺ. ഫലങ്ങൾ assembly/pseudocode-ഉം റഫറൻസുകളും ആണ്; നിങ്ങളുടെ ഏജന്റ് വിശദീകരിക്കുകയും പെരുമാറ്റം പുനർനിർമ്മിക്കാൻ സഹായിക്കുകയും ചെയ്യുന്നു.
- ലൈസൻസുകൾ/DRM പൊട്ടിക്കാനോ പണമടച്ചുള്ള ആക്ടിവേഷൻ മറികടക്കാനോ ഉള്ള ഉപകരണം. അതിനായി ഉപയോഗിക്കരുത്.
- obfuscation മറികടക്കാനുള്ളത്. കനത്ത പാക്കിംഗ്/സംരക്ഷണമുള്ള ലക്ഷ്യങ്ങൾ (VMProtect, Themida, anti-tamper) വളരെ ബുദ്ധിമുട്ടുള്ളവയാണ്.
- സെർവർ-വശ ആക്സസ്. API-യുടെ പിന്നിലെ സെർവർ പരിശോധിക്കാൻ കഴിയില്ല; ക്ലയന്റ്/നെറ്റ്‌വർക്ക് വശം മാത്രമേ കാണാവൂ.

---

## 2. നിയമപരവും ഉത്തരവാദിത്തമുള്ളതുമായ ഉപയോഗം

interoperability, സുരക്ഷാ ഗവേഷണം, ഡീബഗ്ഗിംഗ്, നിങ്ങൾ **ഉടമസ്ഥനായ** സോഫ്റ്റ്‌വെയറിന്റെ വിശകലനം — ഇവയ്ക്ക് reverse engineering നിയമപരമാകാം — എന്നാൽ നിയമങ്ങളും ലൈസൻസുകളും അധികാരമേഖല അനുസരിച്ച് വ്യത്യാസപ്പെടും.

**നിങ്ങൾ ശ്രദ്ധിക്കുക:**
- നിങ്ങൾ ഉടമസ്ഥനായ, ഉപയോഗിക്കാൻ ലൈസൻസുള്ള, അല്ലെങ്കിൽ പരിശോധിക്കാൻ അനുമതിയുള്ള സോഫ്റ്റ്‌വെയർ വിശകലനം ചെയ്യുക.
- ലൈസൻസ് കരാറുകൾ, സേവന വ്യവസ്ഥകൾ, DMCA anti-circumvention നിയമങ്ങൾ മാനിക്കുക.
- കണ്ടെത്തലുകൾ interoperability, വിദ്യാഭ്യാസം, പ്രതിരോധ സുരക്ഷയ്ക്ക് ഉപയോഗിക്കുക.

**നിങ്ങൾ ചെയ്യരുത്:**
- DRM, ലൈസൻസ് ആക്ടിവേഷൻ, അല്ലെങ്കിൽ പകർപ്പ്-രഹിത സംരക്ഷണം മറികടക്കുക.
- ഉടമസ്ഥ സോഫ്റ്റ്‌വെയറിന്റെ പൊട്ടിച്ച/ചോർന്ന കോഡ് വിതരണം ചെയ്യുക.
- നിങ്ങൾക്ക് ഉടമസ്ഥാവകാശമോ പരിശോധനാ അനുമതിയോ ഇല്ലാത്ത ലക്ഷ്യങ്ങൾ വിശകലനം ചെയ്യുക.

ഈ ഗൈഡ് നിയമോപദേശമല്ല. സംശയമുണ്ടെങ്കിൽ ഒരു അഭിഭാഷകനെ ഉപദേശിനിക്കുക.

---

## 3. നിങ്ങൾക്ക് എന്ത് വിശകലനം ചെയ്യാം

| ലക്ഷ്യം | REA നൽകുന്നത് | native engine ആവശ്യമാണോ? |
|---|---|---|
| Native binaries / ലൈബ്രറികൾ (EXE, DLL, ELF, Mach-O) | ഫംഗ്ഷനുകൾ, assembly, pseudocode, കോളർമാർ, xrefs, സ്ഥിരാങ്കങ്ങൾ | അതെ — Hopper, Ghidra അല്ലെങ്കിൽ IDA |
| JavaScript & Electron ആപ്പുകൾ | Modules, imports, IPC ചാനലുകൾ + handlers, സോഴ്സ് ലൊക്കേഷനുകൾ | വേണ്ട |
| ബ്രൗസർ പേജുകൾ (runtime) | Requests/responses, scripts, JSON body ആകൃതികൾ, നിരീക്ഷണ വിൻഡോ | Chrome-ഫാമിലി ബ്രൗസർ |
| .NET assemblies / Flutter / packages | Module & resource പരിശോധന | വേണ്ട |
| Android APK / ഉപകരണങ്ങൾ / resources | Decompile ചെയ്ത classes, resources, ഉപകരണ ഇടപെടൽ | JADX / adb / Apktool |
| Firmware | Extract ചെയ്ത filesystems/blobs | Binwalk / Unblob (Linux) |
| WASM | Module & function പരിശോധന | WABT |
| SQLite ഡാറ്റാബേസുകൾ | Schema & query പരിശോധന | Node.js 24.15+ / 26+ |
| EVM bytecode | Contract ഘടന | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy ക്യാപ്ചറുകൾ | Parse ചെയ്ത ട്രാഫിക് തെളിവുകൾ | Node.js / mitmdump |
| PCAP / PCAPNG | Packet/protocol വിവരങ്ങൾ | TShark / capinfos (Linux) |

---

## 4. സിസ്റ്റം ആവശ്യകതകൾ

**കുറഞ്ഞത്:**
- Node.js **22.23.4+**, **24.22.1+**, അല്ലെങ്കിൽ **26+ (>= 26.12.1)** (npm ഉൾപ്പെടെ)
- പിന്തുണയുള്ള ഒരു കോഡിംഗ് ഏജന്റ് (ഘട്ടം 2 കാണുക)
- നിങ്ങളുടെ അന്വേഷണങ്ങൾക്ക് ഒരു വർക്കിംഗ് ഡയറക്ടറി

**Native (binary) വിശകലനത്തിന്** — ഇതിൽ ഒന്ന്:
- **Ghidra 12.1.x** + 64-bit **JDK 21+** (സൗജന്യം, Windows-ൽ ശുപാർശ)
- **IDA** (വാണിജ്യപരം; Windows legacy GUI + headless supervisor പ്രൊഫൈലുകൾ പരിശോധിതം)
- **Hopper** (വാണിജ്യപരം; macOS & കുറച്ച് Linux — **Windows-ൽ ലഭ്യമല്ല**)

**OS കുറിപ്പുകൾ:**
- Windows: **PowerShell** ഉപയോഗിക്കുക; സ്പേസുള്ള പാതകൾ ഉദ്ധരണിക്കുള്ളിൽ നൽകുക. നിങ്ങളുടെ ഏജന്റ് WSL-ൽ പ്രവർത്തിക്കുന്നുവെങ്കിൽ Node.js + REA WSL-ൽ **തന്നെ** ഇൻസ്റ്റാൾ ചെയ്ത് Linux പാതകൾ ഉപയോഗിക്കുക.
- Linux: Ghidra/JADX/firmware ലോഞ്ചുകൾക്കും static വിശകലനത്തിനും `PATH`-ൽ `procps`-അനുയോജ്യമായ `ps` ഉണ്ടായിരിക്കണം.
- macOS: Terminal ഉപയോഗിക്കുക; ചില ഘട്ടങ്ങൾക്ക് Xcode Command Line Tools ആവശ്യമാണ് (arm64-ൽ Ghidra decompiler build).

---

## 5. ഘട്ടം 1 — നിങ്ങളുടെ കമ്പ്യൂട്ടർ തയ്യാറാക്കുക

### 5.1 Node.js പരിശോധിക്കുക

```powershell
node -v
npm -v
```

പ്രതീക്ഷിക്കുന്നത്: `v22.23.4+`, `v24.22.1+`, അല്ലെങ്കിൽ `v26.12.1+`. പഴയത് → Node.js 24 LTS ഇൻസ്റ്റാൾ ചെയ്യുക.

### 5.2 Windows-ൽ Node.js ഇൻസ്റ്റാൾ ചെയ്യുക (ഇല്ലെങ്കിൽ)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

നിബന്ധനകൾ അംഗീകരിക്കാൻ ചോദിച്ചാൽ `Y` നൽകുക, PowerShell അടച്ച് വീണ്ടും തുറക്കുക, `node -v` പരിശോധിക്കുക. (പകരം: https://nodejs.org/-ൽ നിന്ന് LTS ഇൻസ്റ്റാളർ ഡൗൺലോഡ് ചെയ്യുക.)

> **PowerShell-ന്റെ പ്രത്യേകത:** `npx` «running scripts is disabled on this system» എന്ന് പരാജയപ്പെട്ടാൽ `npx.cmd` ഉം `npm.cmd` ഉം ഉപയോഗിക്കുക:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS-ന്റെ `.pkg` ഡൗൺലോഡ് ചെയ്യുക, അല്ലെങ്കിൽ Homebrew വഴി: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# shell വീണ്ടും തുറക്കുക, പിന്നെ:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 ഏതെങ്കിലും ഒരു വർക്കിംഗ് ഫോൾഡർ ഉണ്ടാക്കുക

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. ഘട്ടം 2 — ഒരു കോഡിംഗ് ഏജന്റ് തിരഞ്ഞെടുക്കുക

പ്രാദേശിക **MCP**-യുള്ള ഏതൊരു ഏജന്റിനെയും REA പിന്തുണയ്ക്കുന്നു. ഒന്ന് തിരഞ്ഞെടുക്കുക — എല്ലാ ഉദാഹരണങ്ങളും ക്ലയന്റിന്റെ **setup ID** ഉപയോഗിക്കുന്നു (`--client <id>`).

| Client | Setup ID | ഇൻസ്റ്റലേഷൻ / കുറിപ്പുകൾ |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | ആപ്പ് ഇൻസ്റ്റാൾ ചെയ്ത് സൈൻ ഇൻ ചെയ്യുക, പിന്നെ `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` അല്ലെങ്കിൽ ഇൻസ്റ്റാൾ സ്ക്രിപ്റ്റ് · ChatGPT സൈൻ ഇൻ |
| Cursor | `cursor` | എഡിറ്റർ ഇൻസ്റ്റാൾ ചെയ്ത് വർക്കിംഗ് ഫോൾഡർ തുറക്കുക, Agent മോഡ് |
| Windsurf | `windsurf` | അതേ രീതി; ഏജന്റ് chat |
| VS Code | `vscode` | ആദ്യം GitHub Copilot സജ്ജമാക്കുക, പിന്നെ Agent mode |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` പ്രവർത്തിപ്പിച്ച് `/connect` വഴി മോഡൽ ബന്ധിപ്പിക്കുക, പിന്നെ `--client opencode` |
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

**Grok Bot:** ബോട്ടിന്റെ chat-ൽ, അതിന്റെ ഹോസ്റ്റ് ചെയ്ത കമ്പ്യൂട്ടറിൽ `rea` എന്ന പേരിൽ ഒരു കസ്റ്റം MCP സെർവർ ചേർക്കാൻ പറയുക:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. ഘട്ടം 3 — REA കണക്റ്റ് ചെയ്യുക

### ഓപ്ഷൻ A — നിങ്ങളുടെ ഏജന്റിനെയാണ് ചെയ്യിക്കുക (ശുപാർശ)

ഏജന്റിന്റെ chat-ൽ പേസ്റ്റ് ചെയ്യുക:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

ഏജന്റ് setup പ്രവർത്തിപ്പിച്ച്, പ്ലാൻ കാണിച്ച്, നിങ്ങളുടെ അംഗീകാരത്തിന് ശേഷം പ്രയോഗിക്കുന്നു.

### ഓപ്ഷൻ B — setup സ്വയം പ്രവർത്തിപ്പിക്കുക

```powershell
npx rea-agents@latest setup
```

ഒരു പ്രത്യേക client-ന്:

```powershell
npx rea-agents@latest setup --client opencode
```

setup സമയത്ത്:
- നീങ്ങാൻ **അമ്പടയാളങ്ങൾ**, തിരഞ്ഞെടുക്കാൻ **Space**, തുടരാൻ **Enter**.
- REA **MCP കണക്ഷൻ** + **അന്വേഷണ കഴിവ്** ചേർക്കുന്നു, മാറ്റങ്ങൾക്ക് മുമ്പ് നിലവിലെ ക്രമീകരണം **ബാക്കപ്പ്** ചെയ്യുന്നു.
- നിങ്ങളുടെ അംഗീകാരത്തിനുശേഷം മാത്രമേ മാറ്റങ്ങൾ പ്രയോഗമാകൂ.
- ആദ്യ ദൃശ്യാഭ്യാസത്തിൽ ഓപ്ഷണൽ Hopper ഇൻസ്റ്റലേഷൻ ഒഴിവാക്കാം.

### setup-ന് ശേഷം client പുനഃരാരംഭിക്കുക

- ഡെസ്ക്‌ടോപ്പ് ആപ്പുകൾ (Claude Desktop, Cursor, Windsurf, VS Code): **പൂർണ്ണമായി** പുറത്ത് കടന്ന് വീണ്ടും തുറക്കുക (Windows: ട്രേ ഐക്കൺ വഴിയും).
- ടെർമിനൽ ഏജന്റുകൾ (Claude Code, Codex, Gemini CLI, OpenCode): സെഷൻ അവസാനിപ്പിച്ച് വീണ്ടും ആരംഭിക്കുക.

---

## 8. ഘട്ടം 4 — ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക

നിങ്ങളുടെ client-ന്റെ doctor പരിശോധന പ്രവർത്തിപ്പിക്കുക (`<client_id>` മാറ്റുക):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

ആരോഗ്യകരമായ റിപ്പോർട്ടിൽ `"healthy": true` കാണിക്കുന്നു. പിന്നെ നിങ്ങളുടെ ഏജന്റിനോട് ചോദിക്കുക:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. ഘട്ടം 5 — നിങ്ങളുടെ ആദ്യ അന്വേഷണം (Notes ഉദാഹരണം)

ഔദ്യോഗിക ഉദാഹരണം **Export notes** ബട്ടണുള്ള ഒരു ചെറിയ Electron ആപ്പാണ്. Electron ഇൻസ്റ്റാൾ ചെയ്യേണ്ടതില്ല — ഏജന്റ് കോഡ് വായിക്കുന്നു.

നിങ്ങളുടെ ഏജന്റിൽ പേസ്റ്റ് ചെയ്യുക:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

പ്രതീക്ഷിക്കുന്ന ഫലം: Export ക്ലിക്ക് ചെയ്യുമ്പോൾ `notes:export` എന്ന IPC സന്ദേശം അയക്കുന്നു; പ്രധാന പ്രോസസ് കുറിപ്പുകൾ CSV-യായി ഫോർമാറ്റ് ചെയ്ത് `notes.csv` (കോളങ്ങൾ: `id`, `title`) നിങ്ങളുടെ Downloads ഫോൾഡറിൽ എഴുതുന്നു.

ടർമിനലിൽ നിന്നുള്ള മാനുവൽ വിശകലനം:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Native വിശകലനം (binaries / EXE / DLL)

ആഴത്തിലുള്ള native വിശകലനത്തിന് ഒരു provider വേണം. **Windows**-ൽ **Ghidra** അല്ലെങ്കിൽ **IDA** ഉപയോഗിക്കുക (Hopper Windows-ൽ ഇല്ല).

### 10.1 Ghidra (സൗജന്യം) — Windows സജ്ജീകരണം

1. **64-bit JDK 21 അല്ലെങ്കിൽ പുതിയത്** ഇൻസ്റ്റാൾ ചെയ്യുക (compiler ഉൾപ്പെടെ). പരിശോധിക്കുക:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. റിലീസിന്റെ *Assets* ലിസ്റ്റിൽ നിന്ന് **Ghidra 12.1.4** ഡൗൺലോഡ് ചെയ്ത് `ghidra_…_PUBLIC_….zip` എക്സ്ട്രാക്റ്റ് ചെയ്യുക (റിലീസിന്റെ ആർക്കൈവ്, **"Source code" അല്ല**).
3. `ghidraRun.bat` ഉള്ള എക്സ്ട്രാക്റ്റ് ചെയ്ത ഫോൾഡർ ശ്രദ്ധിക്കുക — അതാണ് നിങ്ങളുടെ `GHIDRA_INSTALL_DIR`.
4. PowerShell-ൽ:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home കാണിക്കുന്ന ഫോൾഡർ
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   പാതകൾ നിങ്ങളുടെ ഇൻസ്റ്റലേഷനനുസരിച്ച് മാറ്റുക. setup-ന്റെ അപ്ഡേറ്റ് ചെയ്ത പ്ലാൻ പരിശോധിച്ച് അംഗീകരിച്ച് **ഏജന്റ് പുനഃരാരംഭിക്കുക**.

> Windows-ൽ Ghidra പിന്തുണ **പരീക്ഷണാത്മകം, വായിക്കാൻ മാത്രം**; സ്ഥിരമായ പ്രാദേശിക **NTFS** ഡ്രൈവുകളിലെ x86/x64 PE ആപ്പുകൾക്കും DLLകൾക്കുമായി മാത്രം.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64-ലും Linux arm64-ലും ആദ്യം Ghidra-യുടെ native decompiler build ചെയ്യുക (macOS-ന് Xcode Command Line Tools, make, bison ആവശ്യമാണ്).

### 10.3 IDA

1. IDA provider ഗൈഡ് അനുസരിച്ച് upstream IDA MCP സെർവർ ഇൻസ്റ്റാൾ ചെയ്ത് ക്രമീകരിക്കുക.
2. പ്രവർത്തിക്കുന്ന രജിസ്ട്രേഷൻ `ida-mcp.json` ആയി സൂക്ഷിക്കുക. ഉദാഹരണം (`idb_open`/`idb_list`/`idb_close` ഉള്ള headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   ഘടിപ്പിച്ച legacy 1.4.0 GUI സെർവറിന്, പ്രവർത്തിക്കുന്ന command/args/env കോപ്പി ചെയ്യുക (ആദ്യം IDA-യിൽ binary തുറന്ന് പ്ലഗിൻ ആരംഭിക്കുക).
3. കണക്റ്റ് ചെയ്യുക:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux-ൽ `$env:`-ന് പകരം `export` ഉപയോഗിക്കുക. setup-നു ശേഷം ഏജന്റ് പുനഃരാരംഭിക്കുക.

> പരിശോധിത IDA പ്രൊഫൈലുകൾ: Windows legacy GUI ഉം headless supervisor ഉം, കൂടാതെ macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0-ൽ macOS headless പ്രൊഫൈൽ / native GUI bridge ഇല്ല — അവയ്ക്ക് REA-യുടെ source build ആവശ്യമാണ്.

### 10.4 Hopper (macOS / Linux മാത്രം)

setup നിലവിലുള്ള Hopper കണ്ടെത്താനോ ഇൻസ്റ്റലേഷൻ പ്ലാൻ നിർദ്ദേശിക്കാനോ കഴിയും. macOS-ൽ ആദ്യ തുറക്കുമ്പോൾ demo മോഡോ ലൈസൻസ് ആക്ടിവേഷനോ തിരഞ്ഞെടുക്കുക. ഓട്ടോ Linux സജ്ജീകരണത്തിന് Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS, അല്ലെങ്കിൽ Omarchy ഉള്ള x86_64 host ആവശ്യമാണ്. Linux arm64-ൽ Ghidra ഉപയോഗിക്കുക.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 ഒരു provider ഉപയോഗിക്കുക

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

ഒറ്റത്തവണ ഫംഗ്ഷൻ വിശകലനം CLI-യിൽ (Ghidra കോൺഫിഗർ ചെയ്തിരിക്കണം):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron ആപ്പുകൾ

native engine ആവശ്യമില്ല. നിങ്ങളുടെ ഏജന്റിനെ ആപ്പിന്റെ **ഫോൾഡർ** അല്ലെങ്കിൽ **.asar**-ലേക്ക് ചൂണ്ടുക:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron ആപ്പുകളുടെ `app.asar` എവിടെ:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: സാധാരണയായി `/opt/<App>/resources/app.asar`

ടർമിനലിൽ നിന്നുള്ള static വിശകലനം:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

പൊരുത്തപ്പെട്ട ചാനലുകൾ/handlers-ന് `normalized_result.summary.ipc` ഉം സോഴ്സ് ലൊക്കേഷനുകൾക്ക് `normalized_result.graph` ഉം നോക്കുക. കണക്കാക്കുന്ന ചാനൽ പേരുകൾ പരിഹരിക്കപ്പെടാതെ തുടരാം — അപ്പോൾ ബ്രൗസർ നിരീക്ഷണം ഉപയോഗിക്കുക (അടുത്ത വിഭാഗം).

---

## 12. ബ്രൗസർ നിരീക്ഷണം

1. Chrome ഫാമിലി ബ്രൗസർ remote debugging തുറന്ന് ലക്ഷ്യ പേജ് തുറക്കുക, ഉദാ:

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

2. നിങ്ങളുടെ ഏജന്റിനോട് ചോദിക്കുക:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   endpoint `http://127.0.0.1:9222` ഉം പേജ് URL ഉം നൽകുക. ക്ലിക്കു ചെയ്യുന്നതിന് **മുമ്പ്** ക്യാപ്ചർ ആരംഭിക്കുക.

   അല്ലെങ്കിൽ ടർമിനലിൽ നിന്ന്:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP body-കൾക്ക്, Fiddler Everywhere-ന്റെ (SAZ/HAR 1.2) എക്സ്പോർട്ടുകൾ REA capture Evidence ആയി നൽകാം, അല്ലെങ്കിൽ Everywhere-ന്റെ MCP സെർവർ ബന്ധിപ്പിക്കുക.

---

## 13. മറ്റ് ലക്ഷ്യങ്ങളും ആവശ്യമായ ഉപകരണങ്ങളും

| ലക്ഷ്യം | തയ്യാറാക്കേണ്ട ഉപകരണങ്ങൾ | കുറിപ്പുകൾ |
|---|---|---|
| JavaScript / Electron | Node.js + npm | എഞ്ചിൻ വേണ്ട |
| വെബ്‌സൈറ്റ് | Chrome / Chromium / Edge | Remote debugging പോർട്ട് |
| .NET / Flutter / packages | Node.js + npm | Static പരിശോധന |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android ഉപകരണം | adb | USB debugging ഓണാക്കുക |
| Android resources | Apktool + Java | resources & manifest അൺപാക്ക് ചെയ്യുന്നു |
| JEB പ്രോജക്റ്റ് | JEB + MCP | വാണിജ്യ decompiler |
| Firmware | Binwalk / Unblob | **Linux മാത്രം** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite ഡാറ്റാബേസ് | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Linux x64 മാത്രം** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | ക്യാപ്ചറുകളുടെ offline വിശകലനം |
| PCAP / PCAPNG | TShark / capinfos | **Linux മാത്രം** |
| ലോജിക് സിഗ്നലുകൾ | sigrok-cli | **Linux മാത്രം** |
| പ്രോസസ് പെരുമാറ്റം | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM, പൂർണ്ണ അന്വേഷണ ഗൈഡുകൾ: https://rea.tools/guides.

---

## 14. RL പരിതസ്ഥിതികൾ നിർമ്മിക്കുക

REA ഒരു ടെസ്റ്റ് വെബ് ആപ്പ് സെഷൻ റെക്കോർഡ് ചെയ്ത **AgentEnv** പരിതസ്ഥിതിയായി എക്സ്പോർട്ട് ചെയ്യാൻ കഴിയും, ഏജന്റുകൾ പരിശീലിക്കാനും/മൂല്യനിർണ്ണയതിക്കാനും.

1. ഡാറ്റ സൃഷ്ടിക്കാനും/തിരുത്താനും/ഇല്ലാതാക്കാനും ഏജന്റിന് അനുവദിക്കുന്ന ഒരു **ടെസ്റ്റ്** ആപ്പ് ഇൻസ്റ്റൻസ് തയ്യാറാക്കുക.
2. നിങ്ങളുടെ ഏജന്റിനോട് ചോദിക്കുക (ഫോൾഡറുകൾ ഉദാഹരണം):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   പാസ്‌വേഡ് MCP സെർവർ പരിതസ്ഥിതിയിൽ (`APP_PASSWORD`) സൂക്ഷിക്കുക, prompt-ൽ അല്ല.
3. അല്ലെങ്കിൽ ഒരു HAR റെക്കോർഡിംഗിൽ നിന്ന് നേരിട്ട് ബിൽഡ് ചെയ്യുക:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` ഫയലുകൾ എഴുതാതെ റിപ്പോർട്ട് പരിശോധിക്കുന്നു.
4. പ്രവർത്തിപ്പിക്കുക:
   ```bash
   agent-env run ./my-env
   ```
   REA-യുടെ കോമ്പറ്റിബിലിറ്റി പരിശോധന **AgentEnv 0.9.1334 + Python 3.12** ഉപയോഗിക്കുന്നു; Docker ഓടണം.
5. **ഫലങ്ങൾ** റെക്കോർഡ് ചെയ്ത പ്രവർത്തനങ്ങൾ മാത്രമേ സപ്പോർട്ട് ഉള്ളൂ (ഉദാ. ഡിലീറ്റിന് missing-item response-ഉം അപ്ഡേറ്റ് ആയ ലിസ്റ്റും വേണം). പങ്കിടുന്നതിന് മുമ്പ് സംരക്ഷിച്ച response bodies പരിശോധിക്കുക — credentials അവശേഷിക്കാം.

---

## 15. ടർമിനലിൽ നിന്ന് REA ഉപയോഗിക്കുക (CLI)

ഗ്ലോബൽ ഇൻസ്റ്റലേഷൻ ഇല്ലാതെ:

```powershell
npx -y rea-agents@latest --help
```

`rea` കമാൻഡ് സ്ഥിരമായി ഇൻസ്റ്റാൾ ചെയ്യുക:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux-നുള്ള curl ഇൻസ്റ്റാളർ (ആദ്യം Node.js ആവശ്യമാണ്):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

സാധാരണ കമാൻഡുകൾ:

| കമാൻഡ് | ലക്ഷ്യം |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modules, imports, IPC, അതിരുകൾ മാപ്പ് ചെയ്യുക |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | ഒരു native ഫംഗ്ഷൻ വിശകലനം ചെയ്യുക |
| `rea-agents list-browser-targets <endpoint> --json` | ഡീബഗ് ചെയ്യാവുന്ന ബ്രൗസർ പേജുകൾ പട്ടികപ്പെടുത്തുക |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | പേജ് നെറ്റ്‌വർക്ക്/സ്ക്രിപ്റ്റുകൾ നിരീക്ഷിക്കുക |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL പരിതസ്ഥിതി ബിൽഡ് ചെയ്യുക |
| `rea-agents environment-compare … --json` | പരിതസ്ഥിതി യഥാർത്ഥ ആപ്പുമായി താരതമ്യം ചെയ്യുക |
| `rea-agents doctor --client <id> --json` | client ബന്ധം പരിശോധിക്കുക |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | native provider പരിശോധിക്കുക |
| `rea-agents update` | CLI അപ്ഡേറ്റ് ചെയ്യുക |
| `rea-agents uninstall` | REA client ക്രമീകരണം + കഴിവ് നീക്കം ചെയ്യുക |

---

## 16. REA അപ്ഡേറ്റ് അല്ലെങ്കിൽ നീക്കം ചെയ്യുക

**അപ്ഡേറ്റ്:**
```powershell
rea update                       # ഗ്ലോബൽ CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ടെങ്കിൽ
npx rea-agents@latest setup      # ഏജന്റ് ബന്ധം + കഴിവ് പുതുക്കുക; പ്ലാൻ അംഗീകരിച്ച് പുനഃരാരംഭിക്കുക
```

**നീക്കം:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. തകരാർ പരിഹാരം

**ഏജന്റിന് REA ടൂളുകൾ കാണുന്നില്ല**
1. client പൂർണ്ണമായി പുനഃരാരംഭിക്കുക/അതിശയമായി വീണ്ടും ബന്ധിപ്പിക്കുക (ട്രേ ഐക്കണും).
2. `npx -y rea-agents@latest doctor --client <id> --json` — രജിസ്ട്രേഷൻ ഇല്ലാതായ/പഴയതായെങ്കിൽ: `npx rea-agents@latest setup --client <id>`, പുനഃരാരംഭിക്കുക.
3. ഇപ്പോഴും കാണുന്നില്ലെങ്കിൽ: client-ന്റെ MCP കണക്ഷൻ പിശക് പരിശോധിക്കുക; എഡിറ്ററുകളിൽ MCP ക്രമീകരണങ്ങളിൽ REA എനേബിൾ ചെയ്ത് അതിന്റെ ടൂളുകൾ അനുവദിക്കുക.

**`npx` — «running scripts is disabled» (Windows PowerShell)**
`npx.cmd` / `npm.cmd` ഉപയോഗിക്കുക, അല്ലെങ്കിൽ `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**സ്പേസുള്ള പാതകൾ**
ഉദ്ധരണിക്കുള്ളിൽ: `"D:/my apps/tool.exe"`. WSL-ൽ Linux പാതകളും WSL-ൽ തന്നെ REA ഇൻസ്റ്റാളേഷനും.

**Windows Ghidra നിയന്ത്രണങ്ങൾ**
പരീക്ഷണാത്മകം, വായിക്കാൻ മാത്രം, x86/x64 PE മാത്രം, സ്ഥിരമായ പ്രാദേശിക NTFS ഡ്രൈവുകൾ. Linux ബദൽ: Ghidra/Hopper. native x64 Linux ELF crash വിശകലനം: pwntools.

**macOS Automation അനുമതി ചോദിക്കുന്നു (Hopper)**
System Settings → Privacy & Security → Automation → REA ആരംഭിക്കുന്ന ആപ്പിനെ അനുവദിച്ച് വീണ്ടും ശ്രമിക്കുക.

**Hopper ആദ്യ പ്രവർത്തനം**
അ-മേൽനോട്ട വിശകലനത്തിന് മുമ്പ് demo മോഡ് / ലൈസൻസ് ആക്ടിവേഷൻ തിരഞ്ഞെടുപ്പ് പൂർത്തിയാക്കുക.

**Linux-ൽ `ps` ഇല്ല**
`procps` ഇൻസ്റ്റാൾ ചെയ്യുക (Debian/Ubuntu: `sudo apt install procps`); പ്രൊസസ് ഓണർഷിപ്പ് പരിശോധനകൾക്ക് REA-യ്ക്ക് ഇത് ആവശ്യമാണ്.

**ഒരു ബഗ് കണ്ടെത്തിയോ?**
REA അപ്ഡേറ്റ്, പുനഃരാരംഭിക്കുക, വീണ്ടും ശ്രമിക്കുക. പിന്നെ ഒരു issue തുറക്കുക: REA പതിപ്പ്, OS, ലക്ഷ്യ തരം, പുനർനിർമ്മിക്കാനുള്ള ഘട്ടങ്ങൾ, പിശക് ഔട്ട്പുട്ട്, provider പേര്. https://github.com/morluto/rea/issues.

---

## 18. ഡാറ്റ, സ്വകാര്യത & സുരക്ഷ

- REA ലക്ഷ്യങ്ങൾ **നിങ്ങളുടെ മെഷീനിൽ** വിശകലനം ചെയ്യുന്നു; നിങ്ങളുടെ ആപ്പ് REA അപ്‌ലോഡ് **ചെയ്യില്ല**.
- **നിങ്ങളുടെ ഏജന്റിന്റെ മോഡൽ ദാതാവ്** ഫലങ്ങൾ സ്വീകരിക്കുന്നു — അദ്ദേഹത്തിന്റെ ഡാറ്റ/സംരക്ഷണ നയം ബാധകമാണ്. രഹസ്യങ്ങളോ ഉപഭോക്തൃ ഡാറ്റയോ prompt-ൽ ഒട്ടിക്കരുത്.
- MCP input സ്കീമകൾ ഡിഫോൾട്ടായി compact ആണ്; പൂർണ്ണ ഫീൽഡ് വഴികാട്ടിക്ക് MCP രജിസ്ട്രേഷനിൽ `REA_MCP_INPUT_SCHEMA_PROFILE=full` സജ്ജമാക്കുക. output സ്കീമകൾ `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (അല്ലെങ്കിൽ `off`) കൊണ്ട് നിയന്ത്രിക്കാം.
- RL പരിതസ്ഥിതി റെക്കോർഡിംഗുകളിൽ bodys/headers-ൽ credentials നിലനിൽക്കാം — പങ്കിടുന്നതിന് മുമ്പ് പരിശോധിക്കുക. credential-name മുന്നറിയിപ്പുകൾ സ്ഥലങ്ങൾ ചൂണ്ടിക്കാണിക്കുന്നു; മൂല്യങ്ങൾ **അവ നീക്കം ചെയ്യില്ല**.
- `APP_PASSWORD` പോലുള്ള രഹസ്യങ്ങൾ MCP സെർവർ പരിതസ്ഥിതിയിൽ സൂക്ഷിക്കുക, chat-ൽ അല്ല.
- REA `morluto/rea`, `rea.tools`, അല്ലെങ്കിൽ npm `rea-agents`-ൽ നിന്ന് മാത്രം ഇൻസ്റ്റാൾ ചെയ്യുക.

---

## 19. ദ്രുത റഫറൻസ് ചെക്ക്‌ലിസ്റ്റ്

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] കോഡിംഗ് ഏജന്റ് ഇൻസ്റ്റാൾ ചെയ്തു (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (പ്ലാൻ പരിശോധിച്ച് അംഗീകരിക്കുക)
[ ] client പൂർണ്ണമായി പുനഃരാരംഭിച്ചു
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] ആദ്യ അന്വേഷണം: notes-example.zip  →  notes:export / notes.csv കണ്ടെത്തുക
[ ] (ഓപ്ഷണൽ) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup വീണ്ടും പ്രവർത്തിപ്പിച്ച് ഏജന്റ് പുനഃരാരംഭിക്കുക
[ ] (ഓപ്ഷണൽ) ബ്രൗസർ: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] നിയമപരം: നിങ്ങൾ ലക്ഷ്യത്തിന്റെ ഉടമസ്ഥൻ / വിശകലനം ചെയ്യാൻ ലൈസൻസ് ഉണ്ട്
```

---

## 20. Offline ബാക്കപ്പ് / mirror (അനൗദ്യോഗികം)

> ⚠️ **ആദ്യം ഇതു വായിക്കുക.**
> ഒരു ഔദ്യോഗിക പ്രോജക്റ്റിന് «ഔദ്യോഗിക ബാക്കപ്പ്» എന്നൊന്നില്ല. ഔദ്യോഗിക REA ഒന്നേ ഉള്ളൂ: **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, കൂടാതെ **`rea-agents`** npm package.
> ഈ repo ഔദ്യോഗിക പ്രോജക്റ്റിന്റെ പൂർണ്ണവും ലൈസൻസുമായി പൊരുത്തപ്പെടുന്നതുമായ **അനൗദ്യോഗിക mirror / ആർക്കൈവ്** നൽകുന്നു, മൂല MIT ലൈസൻസും കോപ്പിറൈറ്റ് കുറിപ്പുകളും നിലനിർത്തുന്നു. ഇതിന്റെ ഉദ്ദേശ്യം: **ഔദ്യോഗിക repo, വെബ്‌സൈറ്റ്, അല്ലെങ്കിൽ npm package അപ്രത്യക്ഷമായാൽ**, നിങ്ങൾക്ക് REA ഇവിടെ നിന്ന് ലഭിക്കും — അത്രമാത്രം.
> ഔദ്യോഗിക ഉറവിടങ്ങൾ നിലവിലുള്ളിടത്തോളം **അവ ഉപയോഗിക്കുക**. ഈ ബാക്കപ്പ് «ഔദ്യോഗികം» എന്ന് അവതരിപ്പിക്കരുത്, «ഔദ്യോഗിക REA» ആയി വിതരണം ചെയ്യരുത്. ഈ repo REA-യുടെ രചയിതാക്കളുമായി ബന്ധപ്പെട്ടതോ അവർ അംഗീകരിച്ചതോ അല്ല.

**ലൈസൻസ്:** REA MIT ലൈസൻസുള്ളതാണ് — കോപ്പി, മാറ്റം, വിതരണം കുറിപ്പോടെ അനുവദിക്കുന്നു. പൂർണ്ണ ലൈസൻസും കോപ്പിറൈറ്റ് ഹെഡറുകളും മൂന്നാം കക്ഷി കുറിപ്പുകളും mirror ബ്രാഞ്ചിലും npm tarball-ലും നിലനിർത്തുന്നു. ഒരു വാറന്റിയും നൽകുന്നില്ല.

### ബാക്കപ്പിൽ എന്തൊക്കെ ഉണ്ട്

| ബാക്കപ്പ് ഭാഗം | എവിടെ | എന്താണ് |
|---|---|---|
| സോഴ്സ് mirror | ബ്രാഞ്ച് **`mirror/rea`** | ഔദ്യോഗിക `morluto/rea` `main`-ന്റെ പൂർണ്ണ git ചരിത്രം (അവസാന sync സമയത്ത് — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| റിലീസ് ടാഗുകൾ | ടാഗുകൾ **`rea-agents-*.*.*`** | എല്ലാ ഔദ്യോഗിക റിലീസ് ടാഗുകളും, കൃത്യമായ ഔദ്യോഗിക commits-ലേക്ക് ചൂണ്ടുന്നവ (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | ഔദ്യോഗിക npm package, മുൻകൂട്ടി build ചെയ്തത് (`dist/` ഉൾപ്പെടെ) — **പൂർണ്ണമായി offline** ഇൻസ്റ്റാൾ |
| sync സ്ക്രിപ്റ്റ് | **`scripts/sync-backup.ps1`** | ഔദ്യോഗിക ഉറവിടങ്ങളിൽ നിന്ന് mirror ബ്രാഞ്ച്, ടാഗുകൾ, ഏറ്റവും പുതിയ npm tarball പുതുക്കുന്നു |
| restore സ്ക്രിപ്റ്റ് | **`scripts/restore-backup.ps1`** | tarball-ന്റെ ഒന്നുകിൽ offline ഇൻസ്റ്റാളേഷൻ + അടുത്ത ഘട്ടങ്ങൾ |
| ഗൈഡ് | `README.md` (ഇംഗ്ലീഷ് മാസ്റ്റർ) | പൂർണ്ണ സജ്ജീകരണ ഗൈഡ്; REA-യുടെ ഉറവിടം ഏതായാലും ബാധകമാണ് |

### ബാക്കപ്പ് പുതുക്കി സൂക്ഷിക്കുക

ആഴ്ചതോറും പ്രവർത്തിപ്പിക്കുക (അല്ലെങ്കിൽ അതിനെ ആശ്രയിക്കുന്നതിന് മുമ്പ്):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

ഇത് `upstream/main` + എല്ലാ ടാഗുകളും fetch ചെയ്യുന്നു, `mirror/rea` ഫോഴ്സ് അപ്ഡേറ്റ് ചെയ്യുന്നു, ടാഗുകൾ push ചെയ്യുന്നു, ഏറ്റവും പുതിയ `rea-agents-*.*.*` `npm pack` ചെയ്ത് `backup/`-ൽ ഇടുന്നു, tarball-ന്റെ അവസാന `git add`/`commit`/`push` കമാൻഡുകൾ പ്രിന്റ് ചെയ്യുന്നു.

### Restore സാഹചര്യങ്ങൾ

**സാഹചര്യം A — GitHub തടഞ്ഞു, npm പ്രവർത്തിക്കുന്നു:** restore ചെയ്യേണ്ടതുണ്ട്. `npx rea-agents@latest setup` തുടർന്ന് ഉപയോഗിക്കുക.

**സാഹചര്യം B — GitHub + npm രണ്ടും തടഞ്ഞു:** ഈ repo-യിൽ നിന്ന് മുൻകൂട്ടി build ചെയ്ത tarball ഇൻസ്റ്റാൾ ചെയ്യുക (നെറ്റ്‌വർക്ക് ഇല്ല, ബിൽഡ് ടൂളുകളില്ല):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# അല്ലെങ്കിൽ മാനുവലായി:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` ഔദ്യോഗിക `npx rea-agents setup` പോലെ തന്നെ നിങ്ങളുടെ ഏജന്റിനോട് MCP സെർവർ + കഴിവ് രജിസ്റ്റർ ചെയ്യുന്നു — പൂർണ്ണമായി offline, registry-യിൽ തൊടുന്നില്ല.

**സാഹചര്യം C — പൂർണ്ണ സോഴ്സ്/ചരിത്രവും വേണം:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# അവസാന sync സമയത്തെ പൂർണ്ണ ഔദ്യോഗിക സോഴ്സ്.
```

സോഴ്സ് ബിൽഡിന് Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ ഉം npm registry-യിലേക്കുള്ള നെറ്റ്‌വർക്കും ആവശ്യമാണ് (turbo monorepo; `npm ci && npm run build`). tarball വഴി (സാഹചര്യം B) ഇവരണ്ടും ആവശ്യമില്ല — restore-ന് എപ്പോഴും ഇതാ തിരഞ്ഞെടുക്കുക.

### നിങ്ങൾ restore ചെയ്തത് പരിശോധിക്കുക
```powershell
# സോഴ്സ് mirror സമഗ്രത — അവസാന sync ചെയ്ത upstream/main-മായി commit പൊരുത്തപ്പെടണം:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # mirror ബ്രാഞ്ച് clone ചെയ്ത ശേഷം
# tarball സമഗ്രത — CLI തന്നെ റിപ്പോർട്ട് ചെയ്യുന്ന പതിപ്പ്:
rea --version
```

hash-കൾ ബാക്കപ്പ് സമയത്തെ റെക്കോർഡുകളിൽ നിന്ന് വ്യത്യാസപ്പെട്ടാൽ, ആ കോപ്പി സംശയകരമായി കണക്കാക്കി, അതിനെ വിശ്വസിക്കുന്നതിന് മുമ്പ് ഔദ്യോഗിക ഉറവിടങ്ങളിൽ നിന്ന് വീണ്ടും sync ചെയ്യുക (അവർ തിരിച്ചെത്തിയെങ്കിൽ).

### ഈ ബാക്കപ്പ് ഉറപ്പുനൽകുന്നില്ല

- അവസാന sync-ന് ശേഷം സുരക്ഷാ പാച്ചുകളില്ല — ഉപേക്ഷിച്ച ബാക്കപ്പ് പഴയ സ്നാപ്ഷോട്ടാണ്.
- ഔദ്യോഗിക npm package-ൽ `mirror/rea` അല്ലെങ്കിൽ tarball-നേക്കാൾ പുതിയ hotfixes ഉണ്ടാകാം.
- അനുബന്ധ സേവനങ്ങൾ (rea.tools വെബ്‌സൈറ്റ്, Discord, റിലീസ് കുറിപ്പുകൾ, ഡോക്യുമെന്റേഷൻ സൈറ്റ്) റഫറൻസ് മെറ്റീരിയലുകളാണ്, ഇവിടെ നിന്ന് restore ചെയ്യാവുന്ന കോഡ് അല്ല.
- REA പിന്നീട് മറ്റൊരു പേരിലോ ഉടമസ്ഥനിലോ റീറിലീസ് ചെയ്താൽ, ഈ സ്നാപ്ഷോട്ട് ഒരു ആർക്കൈവ് upstream ആയി പ്രവർത്തിക്കും — ബോധപൂർവ്വം മൈഗ്രേറ്റ് ചെയ്യുക, കോംപറ്റിബിലിറ്റി കരുതരുത്.

---

**ലിങ്കുകൾ**
- വെബ്‌സൈറ്റ്: https://rea.tools/ · തുടക്കം: https://rea.tools/get-started/ · ഗൈഡുകൾ: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- സോഴ്സ്: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- സമൂഹം: Discord (rea.tools ഫൂട്ടർ കാണുക) · X: https://x.com/reatools
- **ഈ repo-യുടെ ബാക്കപ്പ്:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
