<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — คู่มือการติดตั้งฉบับสมบูรณ์

> **ภาษา:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ คำแปลนี้ตรงกับต้นฉบับภาษาอังกฤษ หากขัดแย้งกัน **ภาษาอังกฤษยึดก่อน** บล็อกโค้ด พาธ และคำสั่งไม่ถูกแปล

> **REA — Reverse Engineer Anything**
> เซิร์ฟเวอร์ MCP (Model Context Protocol) + ทักษะการสืบสวน ให้เครื่องมือแก่ coding agent ของคุณในการตรวจสอบซอฟต์แวร์ —ไบนารี native, แอป JavaScript/Electron, เบราว์เซอร์, .NET, Android, firmware และอื่นๆ

- **เว็บไซต์ทางการ:** https://rea.tools/
- **ซอร์สโค้ดทางการ:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **ไลเซนส์:** MIT (ตัว REA เอง) เครื่องมือวิเคราะห์ของบุคคลที่สามมีไลเซนส์ของตัวเอง
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (ภาษาอังกฤษ) — ติดตั้งทีละขั้นตามแพลตฟอร์ม (เน้น Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) พร้อมแก้ปัญหา
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — coding agent ฟรีทั้งหมดสำหรับใช้กับ REA (OpenCode พร้อมโมเดลฟรี, Ollama ในเครื่อง, Gemini CLI, Qwen Code) REA เป็น MCP server ไม่ใช่โมเดล AI
- **📦 มีแบ็กอัปออฟไลน์** — mirror ไม่ทางการของ repo ทางการ + npm tarball ใช้เฉพาะกรณีแหล่งทางการหายไป ดู **[ส่วนที่ 20 — แบ็กอัป / Mirror ออฟไลน์ (ไม่ทางการ)](#20-แบ็กอัป--mirror-ออฟไลน์-ไม่ทางการ)**

> ⚠️ **สำคัญ:** ดาวน์โหลด REA เฉพาะจาก `morluto/rea`, `rea.tools` หรือ npm package `rea-agents` เท่านั้น ชื่อ repo คล้ายกันไม่ได้แปลว่าเป็นรุ่นทางการ

---

## สารบัญ

1. REA คืออะไร (และไม่ใช่อะไร)
2. การใช้งานที่ถูกกฎหมายและรับผิดชอบ
3. สิ่งที่วิเคราะห์ได้
4. ความต้องการของระบบ
5. ขั้นที่ 1 — เตรียมเครื่องคอมพิวเตอร์
6. ขั้นที่ 2 — เลือก coding agent
7. ขั้นที่ 3 — เชื่อมต่อ REA
8. ขั้นที่ 4 — ตรวจสอบการติดตั้ง
9. ขั้นที่ 5 — การสืบสวนครั้งแรก (ตัวอย่าง Notes)
10. การวิเคราะห์ native (binary / EXE / DLL)
11. แอป JavaScript & Electron
12. การสังเกตเบราว์เซอร์
13. เป้าหมายอื่น & เครื่องมือที่ต้องเตรียม
14. สร้าง RL environments
15. ใช้ REA จาก terminal (CLI)
16. อัปเดตหรือถอน REA
17. การแก้ปัญหา
18. ข้อมูล ความเป็นส่วนตัว & ความปลอดภัย
19. เช็กลิสต์อ้างอิงด่วน
20. แบ็กอัป / Mirror ออฟไลน์ (ไม่ทางการ)

---

## 1. REA คืออะไร (และไม่ใช่อะไร)

**REA คือ:**
- เซิร์ฟเวอร์ MCP ในเครื่อง + ทักษะของ agent — ให้ **coding agent** ของคุณตรวจสอบซอฟต์แวร์ที่มีในเครื่อง
- ส่งคืน **หลักฐาน**: assembly, pseudocode, แผนที่ module, คู่ IPC channel, ทราฟฟิกเครือข่ายที่จับได้, ตำแหน่ง source — ไม่ใช่ซอร์สโค้ดต้นฉบับ
- การวิเคราะห์ทำงาน **บนเครื่องของคุณ** แอปของคุณไม่ถูก REA อัปโหลด ผู้ให้บริการ model ของ agent จะเห็นผลลัพธ์ (ดู [ข้อมูลและความเป็นส่วนตัว](#18-ข้อมูล-ความเป็นส่วนตัว--ความปลอดภัย))

**REA ไม่ใช่:**
- ปุ่มวิเศษ "ย้อนกลับเป็นซอร์สโค้ดต้นฉบับ" ผลลัพธ์คือ assembly/pseudocode และการอ้างอิง; agent อธิบายและช่วยคุณสร้างพฤติกรรมใหม่
- เครื่องมือแคร็ก license/DRM หรือหลีกเลี่ยง activation แบบเสียเงิน ห้ามใช้เพื่อสิ่งนั้น
- เครื่องมือหลบ obfuscation เป้าหมายที่ถูก pack/ป้องกันหนัก (VMProtect, Themida, ต่อต้านการแก้ไข) ยากมาก
- การเข้าถึงฝั่ง server ไม่สามารถตรวจสอบ server หลัง API ได้ เห็นเฉพาะฝั่ง client/เครือข่าย

---

## 2. การใช้งานที่ถูกกฎหมายและรับผิดชอบ

Reverse engineering อาจถูกกฎหมายเพื่อ interoperability, วิจัยความปลอดภัย, debug และวิเคราะห์ซอฟต์แวร์ที่คุณ **เป็นเจ้าของ** — แต่กฎหมายและไลเซนส์ต่างกันตามเขตอำนาจ

**คุณควร:**
- วิเคราะห์ซอฟต์แวร์ที่คุณเป็นเจ้าของ มีไลเซนส์ใช้งาน หรือได้รับอนุญาตให้ตรวจสอบ
- เคารพข้อตกลงไลเซนส์, Terms of Service และกฎ anti-circumvention ของ DMCA
- ใช้ผลการวิจัยเพื่อ interoperability, การศึกษา และความปลอดภัยเชิงป้องกันเท่านั้น

**คุณไม่ควร:**
- หลีกเลี่ยง DRM, activation license หรือการป้องกันการคัดลอก
- แจกจ่ายโค้ดที่แคร็ก/รั่วไหลของซอฟต์แวร์เชิงพาณิชย์
- วิเคราะห์เป้าหมายที่คุณไม่มีสิทธิ์ครอบครอง/ตรวจสอบ

คู่มือนี้ไม่ใช่คำปรึกษาทางกฎหมาย หากสงสัยโปรดปรึกษาทนาย

---

## 3. สิ่งที่วิเคราะห์ได้

| เป้าหมาย | สิ่งที่ REA ส่งคืน | ต้องใช้ engine native? |
|---|---|---|
| binary native / library (EXE, DLL, ELF, Mach-O) | functions, assembly, pseudocode, callers, xrefs, constants | ใช่ — Hopper, Ghidra หรือ IDA |
| แอป JavaScript & Electron | modules, imports, IPC channels + handlers, ตำแหน่ง source | ไม่ |
| หน้าเว็บ (runtime) | requests/responses, scripts, โครงสร้าง JSON body, หน้าต่างสังเกต | เบราว์เซอร์สาย Chrome |
| .NET assemblies / Flutter / packages | ตรวจสอบ module & resource | ไม่ |
| Android APK / อุปกรณ์ / resources | class ที่ decompile, resources, โต้ตอบกับอุปกรณ์ | JADX / adb / Apktool |
| Firmware | filesystem/blob ที่แตกออก | Binwalk / Unblob (Linux) |
| WASM | ตรวจสอบ module & function | WABT |
| ฐานข้อมูล SQLite | ตรวจสอบ schema & query | Node.js 24.15+ / 26+ |
| EVM bytecode | โครงสร้าง contract | Node.js (Linux x64) |
| ไฟล์ HAR / SAZ / mitmproxy | หลักฐาน traffic ที่ parse | Node.js / mitmdump |
| PCAP / PCAPNG | ข้อเท็จจริง packet/protocol | TShark / capinfos (Linux) |

---

## 4. ความต้องการของระบบ

**ขั้นต่ำ:**
- Node.js **22.23.4+**, **24.22.1+** หรือ **26+ (>= 26.12.1)** (รวม npm)
- coding agent ที่รองรับ (ดูขั้นตอนที่ 2)
- โฟลเดอร์ทำงานสำหรับการสืบสวน

**สำหรับการวิเคราะห์ native (binary)** — หนึ่งใน:
- **Ghidra 12.1.x** + **JDK 21+** 64-bit (ฟรี, แนะนำบน Windows)
- **IDA** (เชิงพาณิชย์; ตรวจสอบแล้วสำหรับ Windows legacy GUI + headless supervisor profiles)
- **Hopper** (เชิงพาณิชย์; macOS & Linux บางส่วน — **ไม่มีบน Windows**)

**หมายเหตุ OS:**
- Windows: ใช้ **PowerShell**; พาธที่มีช่องว่างต้องใส่เครื่องหมายคำพูด ถ้า agent รันใน WSL ให้ติดตั้ง Node.js + REA **ภายใน** WSL และใช้พาธ Linux
- Linux: `ps` ที่เข้ากันได้กับ `procps` ต้องอยู่ใน `PATH` (สำหรับ Ghidra/JADX/firmware และวิเคราะห์แบบ static)
- macOS: ใช้ Terminal; บางขั้นตอนต้องใช้ Xcode Command Line Tools (build decompiler Ghidra บน arm64)

---

## 5. ขั้นที่ 1 — เตรียมเครื่องคอมพิวเตอร์

### 5.1 ตรวจสอบ Node.js

```powershell
node -v
npm -v
```

คาดว่า: `v22.23.4+`, `v24.22.1+` หรือ `v26.12.1+` ถ้าเก่ากว่า → ติดตั้ง Node.js 24 LTS

### 5.2 ติดตั้ง Node.js บน Windows (ถ้ายังไม่มี)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

พิมพ์ `Y` ถ้าถูกถามให้ยอมรับข้อตกลง ปิดแล้วเปิด PowerShell ใหม่ ตรวจสอบ `node -v` อีกครั้ง (ทางเลือกสำรอง: ดาวน์โหลด installer จาก https://nodejs.org/)

> **หมายเหตุ PowerShell:** ถ้า `npx` ขึ้น "running scripts is disabled on this system" ให้ใช้ `npx.cmd` และ `npm.cmd` แทน:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

ดาวน์โหลดไฟล์ `.pkg` ของ Node.js 24 LTS หรือถ้ามี Homebrew: `brew install node`

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# เปิด shell ใหม่ จากนั้น:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 สร้างโฟลเดอร์ทำงาน

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. ขั้นที่ 2 — เลือก coding agent

REA รองรับ agent ที่พูด **MCP** ในเครื่องได้ทุกตัว เลือกหนึ่งตัว — ตัวอย่างทั้งหมดด้านล่างใช้ **setup ID** ของ client (`--client <id>`)

| Client | Setup ID | การติดตั้ง / หมายเหตุ |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | ติดตั้งแอป ลงชื่อเข้าใช้ แล้วรัน `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` หรือสคริปต์ติดตั้ง · ลงชื่อเข้าใช้ด้วย ChatGPT |
| Cursor | `cursor` | ติดตั้ง editor เปิดโฟลเดอร์ทำงาน โหมด Agent |
| Windsurf | `windsurf` | แบบเดียวกัน; แชท agent |
| VS Code | `vscode` | ตั้งค่า GitHub Copilot ก่อน แล้วใช้โหมด Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai` รัน `opencode` `/connect` model แล้ว `--client opencode` |
| Gemini CLI | `gemini_cli` | `npm i -g @google/gemini-cli` → `gemini` |
| Devin | `devin` | `irm https://static.devin.ai/cli/setup.ps1 \| iex` (Win) · `curl -fsSL https://cli.devin.ai/install.sh \| bash` (macOS/Linux) |
| GitHub Copilot CLI | `copilot_cli` | `npm i -g @github/copilot` → `copilot` |
| Antigravity | `antigravity` | Download IDE: https://antigravity.google/ |
| Qwen Code | `qwen_code` | `npm i -g @qwen-code/qwen-code@latest` → `qwen` |
| Kimi Code | `kimi` | `npm i -g @moonshot-ai/kimi-code` → `kimi` |
| Grok Build | `grok_build` | `irm https://x.ai/cli/install.ps1 \| iex` (Win) · `curl -fsSL https://x.ai/cli/install.sh \| bash` (macOS/Linux) |
| Command Code | `commandcode` | `npm i -g command-code` → `commandcode` |
| OMP | `omp` | `irm https://omp.sh/install.ps1 \| iex` (Win) · `curl -fsSL https://omp.sh/install \| sh` (macOS/Linux) |
| Pi | `pi` | `irm https://pi.dev/install.ps1 \| iex` (Win) · `curl -fsSL https://pi.dev/install.sh \| sh` (macOS/Linux) |
| Hermes | `hermes` | `iex (irm https://hermes-agent.nousresearch.com/install.ps1)` (Win) · `curl -fsSL https://hermes-agent.nousresearch.com/install.sh \| bash` (macOS/Linux) |
| Qoder | `qoder` | Download IDE: https://qoder.com/download |
| Factory Droid | `droid` | `npm i -g droid` (Win) · `curl -fsSL https://app.factory.ai/cli \| sh` (macOS/Linux) |
| Trae | `trae` | Download IDE: https://www.trae.ai/ |
| WorkBuddy | `workbuddy` | Download app: https://www.workbuddy.ai/ |
| ZCode | `zcode` | Download app: https://zcode.z.ai/ |
| DeepSeek Harness | `dsh` | `npm i -g @deepseek-ai/dsh` |
| FreeBuff | `freebuff` | `npm install -g freebuff` |

**Grok Bot:** ในแชทของบอท ให้สั่งเพิ่ม MCP server ชื่อ `rea` บนเครื่องในโฮสต์ของมันเอง:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. ขั้นที่ 3 — เชื่อมต่อ REA

### วิธี A — ให้ agent ทำ (แนะนำ)

วางในแชทของ agent:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

agent รัน setup แสดงแผน แล้วใช้หลังคุณอนุมัติ

### วิธี B — รัน setup เอง

```powershell
npx rea-agents@latest setup
```

สำหรับ client เฉพาะเจาะจง:

```powershell
npx rea-agents@latest setup --client opencode
```

ระหว่าง setup:
- **ปุ่มลูกศร** เพื่อเลื่อน, **Space** เพื่อเลือก, **Enter** เพื่อดำเนินการต่อ
- REA เพิ่ม **การเชื่อมต่อ MCP** + **ทักษะการสืบสวน** และ **สำรอง** การตั้งค่าเดิมก่อนเปลี่ยน
- การเปลี่ยนแปลงจะใช้หลังคุณอนุมัติเท่านั้น
- แบบฝึกหัดแรกข้ามการติดตั้ง Hopper ได้

### รีสตาร์ท client หลัง setup

- แอปเดสก์ท็อป (Claude Desktop, Cursor, Windsurf, VS Code): **ปิดให้สนิท** แล้วเปิดใหม่ (Windows: ปิดจากถาดระบบด้วย)
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): ออกจากเซสชันแล้วเริ่มใหม่

---

## 8. ขั้นที่ 4 — ตรวจสอบการติดตั้ง

รัน doctor สำหรับ client ของคุณ (แทน `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

รายงานที่ healthy จะแสดง `"healthy": true` จากนั้นถาม agent:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. ขั้นที่ 5 — การสืบสวนครั้งแรก (ตัวอย่าง Notes)

ตัวอย่างทางการคือแอป Electron เล็กๆ ที่มีปุ่ม **Export notes** ไม่ต้องติดตั้ง Electron — agent อ่านโค้ดเอง

วางใน agent:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

ผลที่คาดหวัง: การกด Export ส่ง IPC message `notes:export`; main process จัดรูปแบบ notes เป็น CSV แล้วเขียน `notes.csv` (คอลัมน์ `id`, `title`) ลงโฟลเดอร์ Downloads

วิเคราะห์ด้วยตนเองจาก terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. การวิเคราะห์ native (binary / EXE / DLL)

การวิเคราะห์ native เชิงลึกต้องมี provider บน **Windows** ใช้ **Ghidra** หรือ **IDA** (Hopper ไม่มีบน Windows)

### 10.1 Ghidra (ฟรี) — ติดตั้งบน Windows

1. ติดตั้ง **JDK 64-bit 21 ขึ้นไป** (รวม compiler) ตรวจสอบ:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. ดาวน์โหลด **Ghidra 12.1.4** จากรายการ *Assets* ของ release แล้วแตกไฟล์ `ghidra_…_PUBLIC_….zip` (เลือก archive release **ไม่ใช่** "Source code")
3. จดโฟลเดอร์ที่มี `ghidraRun.bat` — นั่นคือ `GHIDRA_INSTALL_DIR` ของคุณ
4. ใน PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # โฟลเดอร์จาก java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   แทนพาธด้วยค่าติดตั้งจริง ตรวจแผนที่ setup อัปเดต อนุมัติ แล้ว**รีสตาร์ท agent**

> Ghidra บน Windows เป็น **แบบทดลอง อ่านอย่างเดียว** สำหรับแอป/DLL PE x86/x64 native บนไดรฟ์ **NTFS** ในเครื่องเท่านั้น

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

บน macOS arm64 และ Linux arm64 ให้ build native decompiler ของ Ghidra ก่อน (macOS ต้องมี Xcode Command Line Tools, make, bison)

### 10.3 IDA

1. ติดตั้งและตั้งค่า upstream IDA MCP ตามคู่มือของ IDA provider
2. บันทึก registration ที่ใช้ได้เป็น `ida-mcp.json` ตัวอย่าง (headless supervisor ที่มี `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   สำหรับ legacy 1.4.0 GUI ที่เชื่อมต่อแล้ว ให้คัดลอก command/args/env ที่ทำงานได้ (เปิด binary ใน IDA และเริ่ม plugin ก่อน)
3. เชื่อมต่อ:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   บน macOS/Linux ใช้ `export` แทน `$env:` รีสตาร์ท agent หลัง setup

> โปรไฟล์ IDA ที่ตรวจสอบแล้ว: Windows legacy GUI และ headless supervisor รวมถึง macOS arm64 headless supervisor (IDA Professional 9.1) npm 6.4.0 ไม่รวม macOS headless profile / native GUI bridge — ต้อง build REA จาก source

### 10.4 Hopper (macOS / Linux เท่านั้น)

Setup ตรวจจับ Hopper ที่มีอยู่หรือเสนอแผนติดตั้ง บน macOS ครั้งแรกให้เลือก demo mode หรือเปิดใช้งาน license การติดตั้งอัตโนมัติบน Linux ต้อง x86_64 และ Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS หรือ Omarchy บน Linux arm64 ให้ใช้ Ghidra

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 ใช้ provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

วิเคราะห์ function หนึ่งครั้งจาก CLI (ต้องตั้งค่า Ghidra ก่อน):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. แอป JavaScript & Electron

ไม่ต้องใช้ engine native ชี้ agent ไปที่**โฟลเดอร์**แอปหรือ **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

ตำแหน่ง `app.asar` ของ Electron:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: มักจะเป็น `/opt/<App>/resources/app.asar`

วิเคราะห์แบบ static จาก terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

ดู `normalized_result.summary.ipc` สำหรับ channels/handlers ที่ตรงกัน และ `normalized_result.graph` สำหรับตำแหน่ง source ชื่อ channel ที่คำนวณแบบ dynamic อาจไม่ถูก resolve — ให้ใช้การสังเกตเบราว์เซอร์ (หัวข้อถัดไป)

---

## 12. การสังเกตเบราว์เซอร์

1. เปิดหน้าเป้าหมายด้วยเบราว์เซอร์สาย Chrome ที่เปิด remote debugging เช่น:

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

2. ถาม agent:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   ให้ endpoint `http://127.0.0.1:9222` และ URL ของหน้า เริ่ม capture **ก่อน**กด

   หรือจาก terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

สำหรับ HTTP body ให้ใช้ export ของ Fiddler Everywhere (SAZ/HAR 1.2) เป็น REA capture Evidence หรือเชื่อมต่อ MCP server ของ Everywhere

---

## 13. เป้าหมายอื่น & เครื่องมือที่ต้องเตรียม

| เป้าหมาย | เครื่องมือ | หมายเหตุ |
|---|---|---|
| JavaScript / Electron | Node.js + npm | ไม่ต้องใช้ engine |
| Website | Chrome / Chromium / Edge | พอร์ต remote debugging |
| .NET / Flutter / packages | Node.js + npm | ตรวจสอบแบบ static |
| Android APK | JADX + JDK 17+ | decompile `classes.dex` |
| อุปกรณ์ Android | adb | เปิด USB debugging |
| Android resources | Apktool + Java | แตก resources & manifest |
| โปรเจกต์ JEB | JEB + MCP | decompiler เชิงพาณิชย์ |
| Firmware | Binwalk / Unblob | **Linux เท่านั้น** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| ฐานข้อมูล SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Linux x64 เท่านั้น** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | วิเคราะห์ capture แบบ offline |
| PCAP / PCAPNG | TShark / capinfos | **Linux เท่านั้น** |
| Logic signals | sigrok-cli | **Linux เท่านั้น** |
| พฤติกรรม process | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM และคู่มือการสืบสวนทั้งหมด: https://rea.tools/guides

---

## 14. สร้าง RL environments

REA บันทึกเซสชันเว็บแอปทดสอบแล้ว export เป็น environment **AgentEnv** เพื่อฝึก/ประเมิน agent

1. เตรียม instance แอป **ทดสอบ** ที่ agent สร้าง/แก้/ลบข้อมูลได้
2. ถาม agent (ตัวอย่างโฟลเดอร์):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   เก็บรหัสผ่านไว้ในสภาพแวดล้อมของ MCP server (`APP_PASSWORD`) อย่าเขียนใน prompt
3. หรือ build จากไฟล์ HAR โดยตรง:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` ดูรายงานโดยไม่เขียนไฟล์
4. รัน:
   ```bash
   agent-env run ./my-env
   ```
   การตรวจความเข้ากันได้ของ REA ใช้ **AgentEnv 0.9.1334 + Python 3.12**; Docker ต้องทำงานอยู่
5. รองรับเฉพาะการกระทำที่ **ผล** ถูกบันทึกแล้ว (เช่น การลบต้องมี response item-missing กับ list ที่อัปเดตถูกบันทึก) ก่อนแชร์ให้ตรวจสอบ response body ที่เก็บไว้ — อาจมี credentials

---

## 15. ใช้ REA จาก terminal (CLI)

ไม่ต้องติดตั้ง global:

```powershell
npx -y rea-agents@latest --help
```

ติดตั้งคำสั่ง `rea` ถาวร:

```powershell
npm install --global rea-agents
rea --help
rea update
```

curl installer สำหรับ macOS / Linux (ต้องมี Node.js ก่อน):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

คำสั่งที่ใช้บ่อย:

| คำสั่ง | วัตถุประสงค์ |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | แผนที่ modules, imports, IPC, ขอบเขต |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | วิเคราะห์ function native หนึ่งตัว |
| `rea-agents list-browser-targets <endpoint> --json` | แสดงหน้าเบราว์เซอร์ที่ debug ได้ |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | สังเกต network/scripts ของหน้า |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | build RL environment |
| `rea-agents environment-compare … --json` | เทียบ environment กับแอปจริง |
| `rea-agents doctor --client <id> --json` | ตรวจสอบการเชื่อมต่อ client |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | ตรวจสอบ provider native |
| `rea-agents update` | อัปเดต CLI |
| `rea-agents uninstall` | ถอนคอนฟิก client + skill ของ REA |

---

## 16. อัปเดตหรือถอน REA

**อัปเดต:**
```powershell
rea update                       # ถ้าติดตั้ง CLI global แล้ว
npx rea-agents@latest setup      # รีเฟรชการเชื่อมต่อ + skill; อนุมัติแผน รีสตาร์ท agent
```

**ถอน:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. การแก้ปัญหา

**agent ไม่เห็นเครื่องมือ REA**
1. รีสตาร์ท/เชื่อมต่อ client ใหม่ทั้งหมด (รวมไอคอนถาดระบบ)
2. `npx -y rea-agents@latest doctor --client <id> --json` — ถ้า registration หาย/เก่า: `npx rea-agents@latest setup --client <id>` แล้วรีสตาร์ท
3. ยังไม่เห็น: ตรวจสอบ error การเชื่อมต่อ MCP ของ client; ใน editor ให้เปิด REA ในการตั้งค่า MCP และอนุญาตเครื่องมือของมัน

**`npx` — "running scripts is disabled" (Windows PowerShell)**
ใช้ `npx.cmd` / `npm.cmd` หรือ `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`

**พาธที่มีช่องว่าง**
ใส่ในเครื่องหมายคำพูด: `"D:/my apps/tool.exe"` ใน WSL ใช้พาธ Linux และติดตั้ง REA ใน WSL

**ข้อจำกัด Ghidra บน Windows**
ทดลอง, อ่านอย่างเดียว, เฉพาะ PE x86/x64, ไดรฟ์ NTFS ในเครื่อง ทางเลือกบน Linux: Ghidra/Hopper วิเคราะห์ crash ELF native x64 Linux: pwntools

**macOS ขอสิทธิ์ Automation (Hopper)**
System Settings → Privacy & Security → Automation → อนุญาตแอปที่เริ่ม REA ลองใหม่

**Hopper รันครั้งแรก**
ทำตัวเลือก demo mode vs เปิดใช้งาน license ให้เสร็จก่อนวิเคราะห์แบบไม่มีคนดู

**Linux ไม่มี `ps`**
ติดตั้ง `procps` (Debian/Ubuntu: `sudo apt install procps`); REA ต้องใช้ตรวจสอบความเป็นเจ้าของ process

**พบ bug?**
อัปเดต REA รีสตาร์ทแล้วลองใหม่ จากนั้นเปิด issue พร้อม: เวอร์ชัน REA, OS, ประเภทเป้าหมาย, ขั้นตอนที่ทำให้เกิดซ้ำ, output ข้อผิดพลาด, ชื่อ provider https://github.com/morluto/rea/issues

---

## 18. ข้อมูล ความเป็นส่วนตัว & ความปลอดภัย

- REA วิเคราะห์เป้าหมาย **บนเครื่องของคุณ**; แอปของคุณ **ไม่** ถูกอัปโหลดโดย REA
- **ผู้ให้บริการ model ของ agent** ได้รับผลลัพธ์ — นโยบายข้อมูล/การเก็บของพวกเขามีผล อย่าวางความลับหรือข้อมูลลูกค้าลงใน prompt
- Schema อินพุตของ MCP แบบย่อโดยค่าเริ่มต้น; ตั้งค่า `REA_MCP_INPUT_SCHEMA_PROFILE=full` ใน registration MCP เพื่อคำแนะนำฟิลด์ครบถ้วน จำกัด schema เอาต์พุตด้วย `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (หรือ `off`)
- บันทึก RL environment อาจเก็บ credentials ใน body/headers — ตรวจสอบก่อนแชร์ คำเตือน credential-name ชี้ตำแหน่งที่ต้องดู; มัน **ไม่** ลบค่า
- ความลับแบบ `APP_PASSWORD` อยู่ในสภาพแวดล้อมของ MCP server ไม่เขียนในแชท
- ติดตั้ง REA เฉพาะจาก `morluto/rea`, `rea.tools` หรือ npm `rea-agents`

---

## 19. เช็กลิสต์อ้างอิงด่วน

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] ติดตั้ง coding agent แล้ว (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (ตรวจแผน & อนุมัติ)
[ ] รีสตาร์ท client ให้สนิท
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] การสืบสวนครั้งแรก: notes-example.zip  →  หา notes:export / notes.csv
[ ] (ตัวเลือก) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → รัน setup ใหม่ → รีสตาร์ท agent
[ ] (ตัวเลือก) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] กฎหมาย: คุณเป็นเจ้าของ / มีสิทธิ์วิเคราะห์เป้าหมาย
```

---

## 20. แบ็กอัป / Mirror ออฟไลน์ (ไม่ทางการ)

> ⚠️ **อ่านก่อน**
> โปรเจกต์ทางการไม่มีสิ่งที่เรียกว่า "แบ็กอัปทางการ" REA ทางการเพียงหนึ่งเดียวคือ **morluto/rea** (https://github.com/morluto/rea), **rea.tools** และ npm package **`rea-agents`**
> repo นี้ให้ **mirror / archive ไม่ทางการ** ที่สมบูรณ์และสอดคล้องไลเซนส์ของโปรเจกต์ทางการ พร้อมคงไลเซนส์ MIT และประกาศลิขสิทธิ์ต้นฉบับ มันมีไว้เพื่อ **หาก repo, เว็บไซต์ หรือ npm package ทางการหายไป** คุณยังได้ REA จากที่นี่ — เท่านั้นเอง
> ถ้าแหล่งทางการยังมีอยู่ **ให้ใช้พวกมัน** อย่าเรียกแบ็กอัปนี้ว่า "ทางการ" หรือแจกจ่ายซ้ำเป็น "official REA" repo นี้ไม่ได้เกี่ยวข้อง/ไม่ได้รับการรับรองจากผู้เขียน REA

**ไลเซนส์:** REA ใช้ MIT — อนุญาตให้คัดลอก แก้ไข และแจกจ่ายโดยคงประกาศ ไลเซนส์เต็ม, copyright headers และประกาศของบุคคลที่สามถูกเก็บทั้งในกิ่ง mirror และ npm tarball ไม่มีการรับประกันใดๆ

### สิ่งที่มีในแบ็กอัป

| ส่วนของแบ็กอัป | ที่อยู่ | คืออะไร |
|---|---|---|
| Source mirror | กิ่ง **`mirror/rea`** | git history ทั้งหมดของ `morluto/rea` `main` ทางการ (ณ การ sync ล่าสุด — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | tag release ทางการทั้งหมด ชี้ไปยัง commit ทางการที่แน่นอน (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | npm package ทางการ prebuilt (รวม `dist/`) — ติดตั้ง **ออฟไลน์ทั้งหมด** |
| สคริปต์ sync | **`scripts/sync-backup.ps1`** | รีเฟรชกิ่ง mirror, tags และ npm tarball ล่าสุดจากแหล่งทางการ |
| สคริปต์ restore | **`scripts/restore-backup.ps1`** | ติดตั้ง tarball ออฟไลน์ทีเดียว + พิมพ์ขั้นตอนถัดไป |
| คู่มือ | `README.md` (ต้นฉบับอังกฤษ) | คู่มือติดตั้งฉบับสมบูรณ์ ใช้ได้ไม่ว่า REA จะมาจากแหล่งใด |

### ทำให้แบ็กอัปทันสมัยอยู่เสมอ

รันทุกสัปดาห์ (หรือก่อนพึ่งพามัน):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

มัน fetch `upstream/main` + tags ทั้งหมด, force-update `mirror/rea`, push tags, `npm pack` รุ่น `rea-agents-*.*.*` ล่าสุดลง `backup/` และพิมพ์คำสั่ง `git add`/`commit`/`push` สุดท้ายสำหรับ tarball

### สถานการณ์การกู้คืน

**สถานการณ์ A — GitHub ล่ม npm ยังอยู่:** ไม่ต้องกู้คืน ใช้ `npx rea-agents@latest setup` ต่อไป

**สถานการณ์ B — GitHub + npm ล่มทั้งคู่:** ติดตั้ง tarball prebuilt จาก repo นี้ (ไม่มีเน็ต ไม่ต้องมี build tools):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# หรือด้วยตนเอง:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` ลงทะเบียน MCP server + skill กับ agent ของคุณเหมือน `npx rea-agents setup` ทางการ — ออฟไลน์ทั้งหมด ไม่แตะ registry

**สถานการณ์ C — คุณต้องการ source/history เต็ม:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# source ทางการเต็ม ณ เวลา sync ล่าสุด
```

build จาก source ต้องการ Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ และ network ไปยัง npm registry (turbo monorepo; `npm ci && npm run build`) เส้นทาง tarball (สถานการณ์ B) ไม่ต้องการทั้งสองอย่าง — เมื่อกู้คืนให้เลือกอันนี้เสมอ

### ตรวจสอบสิ่งที่กู้คืน
```powershell
# ความสมบูรณ์ของ source mirror — commit ต้องตรงกับ upstream/main ที่ sync ล่าสุด:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # หลัง clone กิ่ง mirror
# ความสมบูรณ์ tarball — เวอร์ชันที่ CLI รายงานเอง:
rea --version
```

ถ้า hash ต่างจากบันทึกตอน backup ให้ถือว่าเป็นสำเนาที่ไม่น่าเชื่อถือ และ sync ใหม่จากแหล่งทางการ (หากกลับมาแล้ว) ก่อนไว้วางใจ

### สิ่งที่แบ็กอัปนี้ไม่รับประกัน

- ไม่มี security patch หลังการ sync ล่าสุด — แบ็กอัปที่ถูกทิ้งคือสแนปช็อตล้าสมัย
- npm package ทางการอาจมี hotfix ใหม่กว่า `mirror/rea` หรือ tarball
- บริการเสริม (เว็บไซต์ rea.tools, Discord, release notes, เว็บเอกสาร) เป็นเอกสารอ้างอิง ไม่ใช่โค้ดที่กู้คืนจากที่นี่ได้
- หาก REA กลับมาเผยแพร่ในชื่อ/เจ้าของใหม่ สแนปช็อตนี้ยังทำงานเป็น upstream ที่เก็บถาวร — ย้ายอย่างมีแผน อย่าสันนิษฐานว่าเข้ากันได้

---

**ลิงก์**
- เว็บไซต์: https://rea.tools/ · เริ่มต้น: https://rea.tools/get-started/ · คู่มือ: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- ชุมชน: Discord (ดูท้าย rea.tools) · X: https://x.com/reatools
- **แบ็กอัปของ repo นี้:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
