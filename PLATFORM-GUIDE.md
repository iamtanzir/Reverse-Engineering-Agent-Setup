# Platform-by-Platform Reverse Engineering Setup — Step by Step (Windows)

> ⚠️ **Legal scope first — read this once.**
> Use this guide only on software you **own**, are **licensed** to analyze, or have **written permission** to inspect (interoperability, security research, debugging, education). Bypassing license activation/DRM, cracking, or extracting secrets from other people's software is out of scope and may be illegal in your country. This document contains tooling instructions, not a license to analyze anything you like.

Everything below was chosen to work on **Windows 11/10**. Commands are PowerShell. If a tool has no Windows build, the workflow uses **WSL2 (Ubuntu)** instead — noted explicitly.

**Golden rule for all platforms:** always quote paths with spaces (`"C:/my apps/app.asar"`), always work on a **copy** of the target (never the only original), and keep notes of what you changed.

**REA reminder (all platforms):** REA's MCP server ships with your agent after `npx rea-agents@latest setup`. Each section ends with the exact prompt to give your coding agent.

---

## 0. One-time base setup (everyone needs this)

```powershell
# 1) Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ (LTS recommended)
winget install --exact --id OpenJS.NodeJS.LTS
# close & reopen PowerShell
node -v ; npm -v

# 2) Git
winget install --exact --id Git.Git

# 3) 7-Zip (the extractor for most tools below)
winget install --exact --id 7zip.7zip
# close & reopen PowerShell after each winget install

# 4) REA (works offline from this repo's tarball if the registry is down)
npx rea-agents@latest setup --client opencode   # or claude_code / codex / cursor / ...
npx -y rea-agents@latest doctor --client opencode --json   # expect "healthy": true
```

If PowerShell says scripts are disabled: use `npx.cmd` / `npm.cmd`, or run once:
`Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`

---

## 1. JavaScript & Electron apps — ⭐ easiest, no extra tools

**Works on:** Windows/macOS/Linux · **Examples:** VS Code, Discord, Slack, Notion, Figma desktop, custom Electron builds, minified web JS.

**Setup:** nothing beyond Section 0. Electron apps hide their code in `resources/app.asar` — REA reads the folder directly (no unpack/install needed).

**Locate the ASAR:**
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- Portable/custom installs: search the app folder for `app.asar`.
- **Copy** the target folder/`app.asar` into a work folder, e.g. `rea-work\target\`.

**Verify (works without any agent):**
```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\rea-work\target" --json
```
Look for `normalized_result.summary.ipc` (matched channels/handlers) and `normalized_result.graph` (source locations).

**Agent prompt:**
```text
Use REA to analyze the app at C:\rea-work\target. Find how it [exports data / checks updates / stores settings].
Show the relevant files and lines.
```

**Common failures & fixes:**
- *"Path not found / asar unreadable"* → you pointed at the wrong file; must be the `.asar` itself or its extracted folder, with quotes.
- *Minified code looks like soup* → normal; REA works on structure/imports. Ask for the specific feature, not "explain everything".
- *Computed IPC channel names unresolved* → switch to runtime capture (Section 2).

---

## 2. Website / browser runtime behavior

**Works on:** Windows/macOS/Linux · **Examples:** single-page apps, download flows, auth redirects, analytics calls.

**Setup:** Chrome/Edge/Chromium with remote debugging. Nothing to install.

```powershell
& "C:\Program Files\Google\Chrome\Application\chrome.exe" --remote-debugging-port=9222 --user-data-dir="$env:TEMP\rea-browser" "https://example.com/"
```
Keep that browser open; do not close it mid-capture.

**Capture from the agent** (start capture *before* clicking):
```text
Use REA to inspect this page while I click [Export/Login].
Debugging endpoint: http://127.0.0.1:9222 — page: https://example.com/
What request does it make and how is the response used?
```

**Or from the CLI:**
```powershell
npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
```

**For HTTPS bodies / full API traffic:** Fiddler Everywhere (exports HAR/SAZ) or mitmproxy (`pip install mitmproxy`, run `mitmdump` behind your own browser profile). Feed the capture to REA as evidence (HAR) — never capture traffic you are not authorized to inspect.

**Common failures & fixes:**
- *Port 9222 already in use* → close stale Chrome debug instances or use `--remote-debugging-port=9223`.
- *"No targets found"* → you launched a normal Chrome window, not the debug one; use the command above verbatim.
- *Corp proxy blocks the page* → analyze a local copy of the site or use offline HAR instead.

---

## 3. .NET assemblies (C# / VB / F#) — DLLs & EXEs

**Works on:** Windows/macOS/Linux · **Examples:** line-of-business tools, game mods, plugins, ASP.NET DLLs.

**Setup:** Node.js (Section 0) is enough for REA's static pass. For eyeballing decompiled C#, optionally install the .NET SDK and ILSpy:
```powershell
winget install --exact --id Microsoft.DotNet.SDK.9
dotnet tool install --global ilspycmd
ilspycmd "C:\path\to\App.dll" -o il-output\n```

**Agent prompt:**
```text
Use REA to analyze the .NET assembly at C:\path\to\App.dll. List classes and find the code path for [login/export/license check removal policy is OFF-LIMITS — instead: 'how it parses its config file']. Show evidence.
```
Stay inside interoperability/debugging scope; **do not** use this to strip or forge license checks.

**Common failures & fixes:**
- *ReadyToRun/NativeAOT binaries* → little managed IL remains; treat as native (Section 7) instead.
- *Obfuscated (ConfuserEx etc.)* → names will be garbage; request behavior and string constants, not identifier names.

---

## 4. Android apps (APK) — the decompile kingdom

**Works on:** Windows/macOS/Linux · **Scope:** apps you own/are authorized to analyze; paid APKs/DRM remain off-limits.

**Prerequisites:** JDK 17+ (Temurin 21 works for everything below), JADX, Apktool, adb.

```powershell
winget install --exact --id EclipseAdoptium.Temurin.21.JDK
java -version ; javac -version
```

**JADX (decompile APK → Java):**
1. Download the latest `jadx-<version>.zip` from `github.com/skylot/jadx/releases`.
2. Extract to `C:\tools\jadx`.
3. Add `C:\tools\jadx\bin` to PATH (User PATH in System Properties, or for the session: `$env:Path += ";C:\tools\jadx\bin"`).
4. Verify: `jadx --version`
5. Decompile: `jadx -d C:\rea-work\out "C:\rea-work\app.apk"`

Tip: on huge APKs, JADX can run out of memory → run with more heap:
`set JADX_OPTS=-Xmx4g` before calling `jadx`.

**Apktool (resources, manifest, smali):**
1. Download `apktool.jar` (`apktool.org` → install) + `apktool.bat` wrapper into `C:\tools\apktool`, add to PATH.
2. Verify: `apktool --version`
3. Decode resources: `apktool d "C:\rea-work\app.apk" -o C:\rea-work\apk-decoded`

**adb (installed app on a real device / emulator):**
```powershell
winget install --exact --id Google.PlatformTools   # or download platform-tools zip; already ZIP is on your C: drive
adb devices                    # accept the USB-debugging prompt on the phone
adb shell pm list packages | findstr <name>
adb pull /data/app/<pkg>-xxx/base.apk C:\rea-work\
```

**Agent prompt:**
```text
Use REA to analyze the APK at C:\rea-work\app.apk (decompiled at C:\rea-work\out).
Find how it [syncs data / stores the auth token / parses files]. Show classes and lines.
```

**Common failures & fixes:**
- *`d8` / dex errors* → APK is split (`.xapk`/`.apks`); install with `adb install-multiple` or use `apktool` on each split.
- *`jadx` hangs/OOM* → `-Xmx4g`, close other apps.
- *Device shows "unauthorized"* → revoke USB debugging on phone, replug, accept prompt, `adb kill-server; adb devices`.
- *Native `.so` libs inside APK* → those are native binaries: Ghidra (Section 7).

---

## 5. Flutter & Dart apps

**Works on:** Windows/macOS · **Reality check:** Flutter release builds are Dart **AOT-compiled**; REA's package/resource inspection helps, but logic usually lives in native code (Section 7) or in the kernel snapshot.

**Setup:** Section 0 only. Point REA at the extracted APK/IPA folder or the `libapp.so`.
**Common fixes:** treat `libapp.so` as an ARM64/x64 native library; `blutter`-class tools can recover Dart object pools for **your own** apps — not shipped with REA, and out of scope for anti-piracy bypass.

---

## 6. WASM (WebAssembly binaries)

**Works on:** any OS with WABT.

**Setup:**
```powershell
# Download the latest wabt-*-windows-x64.zip from github.com/WebAssembly/wabt/releases
# Extract to C:\tools\wabt, add C:\tools\wabt\bin to PATH
wat2wasm --version
```

**Workflow:** `wasm2wat app.wasm -o app.wat` → text form; or give REA the `.wasm` file directly and ask for modules/imports/exports.
**REA prompt:** `Use REA to analyze C:\path\app.wasm. List its imports and exports and what the exported functions do.`

---

## 7. Native Windows binaries (C/C++/Rust EXE/DLL) — Ghidra path

**Works on:** Windows (experimental, **read-only**, x86/x64 **PE**, fixed local **NTFS** drives) · **Examples:** small utilities, games, installers' native stubs.

**Setup (bug-free checklist):**
1. **JDK 21+ x64** — `winget install --exact --id EclipseAdoptium.Temurin.21.JDK`
   ```powershell
   java -XshowSettings:properties -version   # shows java.home
   javac -version
   ```
2. **Ghidra 12.1.4** — from the official `NationalSecurityAgency/ghidra` releases page (https://github.com/NationalSecurityAgency/ghidra/releases), download the **Assets** `ghidra_12.1.4_PUBLIC_*.zip` (NOT "Source code"), extract to `C:\tools\ghidra_12.1.4_PUBLIC`.
3. **Tell REA where they live (same session):**
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"   # folder with ghidraRun.bat
   $env:JAVA_HOME = "C:/tools/jdk-21"                          # your JDK folder, e.g. java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   (Runtime-only env vars; to persist, set them as **User** environment variables.)

**Agent prompt:**
```text
Use REA with the Ghidra provider to inspect C:\path\target.exe.
List functions and strings, then explain the part that [handles input / parses config], with references.
```

**CLI check of one function without the agent:**
```powershell
npx -y rea-agents@latest function "C:\path\target.exe" main --provider ghidra --json
```

**Common failures & fixes:**
- *`ghidraRun.bat` not found* → you extracted the Source zip; re-download the Assets zip.
- *Slow first analysis* → normal; Ghidra auto-saves a project next to the target; keep target and project on NTFS, not a network drive.
- *"arm64 / mixed PE"* → unsupported; only x86/x64 PE on Windows.
- *Packed binary (UPX etc.)* → unpack **your own** binary first (`upx -d`), then analyze.
- **Hopper is NOT available on Windows.** IDA works: `$env:REA_IDA_MCP_CONFIG` + `$env:REA_ANALYSIS_PROVIDER="ida"` per `README.md` Section 10.3.

---

## 8. Linux / macOS binaries & crash dumps

**macOS:** Hopper (commercial; setup can propose install) or Ghidra/IDA. `export GHIDRA_INSTALL_DIR / JAVA_HOME` as usual. Apple Silicon: build Ghidra's native decompiler (Xcode CLT + make + bison).
**Linux ELF + crashes:** `wsl --install`, then inside Ubuntu: `sudo apt install binwalk unblob tshark pwntools gdb`. pwndbg/pwntools work on cores and ELF.
**Firmware:** strictly Linux (binwalk/unblob) — do it in WSL2 or a VM, never on someone else's device.
**PCAP:** `tshark -r dump.pcap` in WSL2; or import evidence into REA.

---

## 9. SQLite databases (app data stores)

**Setup:** Node.js 24.15+/26 (your machine: v26.13.0 ✅). Read-only!
**Agent prompt:** `Use REA to inspect C:\path\app.db. List tables and the schema; sample rows for [settings / history]; do not modify the file.`
**Tip:** always work on a copy (`copy app.db app-copy.db`).

---

## 10. HAR / SAZ / HTTP(S) capture files

**Capture:** browser DevTools → Network → right-click → *Save all as HAR*, or Fiddler Everywhere → export.
**Analyze:** `npx rea-agents@latest environment-build ./session.har ./out --name app-env --dry-run --json` (review report) or feed to the agent:
```text
Use REA to analyze the HAR at C:\path\session.har. List endpoints, methods, and auth-relevant headers (redacted). Summarize the API shape.
```

---

## 11. iOS (IPA) — honest status

REA v6.9.0 has **no IPA workflow**. For authorized research only: a jailbroken device or a decrypted IPA of **your own** app, plus Frida/objection — outside REA, outside this guide. Expect binary analysis of arm64 Mach-O via Ghidra/Hopper for your own builds. Distributing or cracking third-party iOS apps is piracy — not covered.

---

## 12. Troubleshooting matrix (read this before filing bugs)

| Symptom | Cause | Fix |
|---|---|---|
| `npx` script disabled | PS execution policy | `npx.cmd …` or `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` |
| Agent sees no REA tools | client not restarted | full quit incl. tray icon; `doctor --client <id> --json` |
| `doctor` red items | provider not configured | re-run `setup`, approve, restart agent |
| Paths with spaces | quoting | always `"..."` |
| Huge APK decompile OOM | default heap | `set JADX_OPTS=-Xmx4g` |
| Ghidra "not found" | wrong env var folder | point at folder containing `ghidraRun.bat` |
| First Ghidra analysis "empty" | still analyzing | wait; re-query functions |
| WSL tools missing | wrong distro | `wsl -l -v`; install Ubuntu; `sudo apt install …` |
| HTTPS capture empty | wrong proxy profile | use a dedicated debug profile; install proxy CA on YOUR device only |
| Anything else | actual bug | Collect: REA version (`rea --version`), OS, target type, full error text → https://github.com/morluto/rea/issues |

---

## 13. Suggested learning order (bug-free ramp-up)

1. Section 2 (browser) → 2. Section 1 (Electron) → 3. Section 3 (.NET) → 4. Section 4 (Android) → 5. Section 6 (WASM/SQLite) → 6. Section 7 (native) → 7. Section 8 (firmware/PCAP in WSL2).

Do **not** start with packed native malware. Learn on small, known programs first — that is what rea.tools' own Notes example does.

---
*Legal reminder: only software you own, are licensed to analyze, or have permission for. Documentation here ≠ permission. MIT-licensed guide; no warranty.*
