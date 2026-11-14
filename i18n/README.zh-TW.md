# Reverse Engineering Agent — 完整安裝指南

> **語言：** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md)（主語言 / 權威版本） · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md)
>
> ℹ️ 本翻譯與英文主版本一致。如有分歧，**以英文為準**。程式碼區塊、路徑與指令從不翻譯。

> **REA — Reverse Engineer Anything**
> 一個 MCP（Model Context Protocol）伺服器 + 調查技能，讓你的程式設計代理能夠檢查軟體：原生二進位、JavaScript/Electron 應用、瀏覽器、.NET、Android、韌體等等。

- **官方網站：** https://rea.tools/
- **官方原始碼：** https://github.com/morluto/rea
- **npm 套件：** `rea-agents`
- **授權：** MIT（REA 本身）。第三方分析工具有各自的授權。
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)**（英文）— 按平台逐步安裝指南（Windows 優先：Electron、Web、.NET、Android、WASM、Native/Ghidra、WSL2），含疑難排解
- **📦 包含離線備份** — 官方倉庫的非官方映像 + npm tarball，僅在官方來源消失時使用。參見 **[第 20 節 — 離線備份 / 映像（非官方）](#20-offline-backup--mirror-unofficial)**。

> ⚠️ **重要：** 只能從 `morluto/rea`、`rea.tools` 或 `rea-agents` npm 套件下載 REA。相似的倉庫名稱不能證明它是官方版本。

---

## 目錄

1. REA 是什麼（不是什麼）
2. 合法與負責任的使用
3. 可以分析什麼
4. 系統需求
5. 第 1 步 — 準備你的電腦
6. 第 2 步 — 選擇程式設計代理
7. 第 3 步 — 連接 REA
8. 第 4 步 — 驗證安裝
9. 第 5 步 — 首次調查（Notes 範例）
10. 原生分析（二進位 / EXE / DLL）
11. JavaScript & Electron 應用
12. 瀏覽器觀察
13. 其他目標與所需工具
14. 建置 RL 環境
15. 從終端機使用 REA（CLI）
16. 更新或移除 REA
17. 疑難排解
18. 資料、隱私與安全
19. 快速參考清單
20. 離線備份 / 映像（非官方）

---

## 1. REA 是什麼（不是什麼）

**REA 是：**
- 本機 MCP 伺服器 + 代理技能，讓你的**程式設計代理**檢查你本機擁有的軟體。
- 回傳**證據**：組合語言、虛擬碼、模組地圖、IPC 通道配對、擷取的網路流量、原始碼位置 — 而不是原始程式碼。
- 分析在**你的機器上**執行。你的應用程式不會被 REA 上傳；你的代理所用模型供應商會看到結果（參見[資料與隱私](#18-data-privacy--security)）。

**REA 不是：**
- 一個「把二進位變回原始程式碼」的魔法按鈕。結果是組合語言/虛擬碼和參照；你的代理解釋並協助你重建行為。
- 用於破解授權/DRM 或繞過付費啟用的工具。不要這樣使用。
- 繞過混淆的工具。大量打包/保護的目標（VMProtect、Themida、防篡改）仍然極其困難。
- 存取伺服器端的能力。它無法檢查 API 背後的伺服器；只能看到用戶端/網路一側。

---

## 2. 合法與負責任的使用

出於互通性、安全研究、除錯和分析你**擁有**的軟體，逆向工程可能是合法的 — 但法律和授權因司法轄區而異。

你**應該**：
- 分析你擁有、獲授權使用或有權檢查的軟體。
- 尊重授權條款、服務條款和 DMCA 反規避規則。
- 將研究成果用於互通性、教育和防禦性安全。

你**不應該**：
- 繞過 DRM、授權啟用或複製保護。
- 散布專有軟體的破解/外洩程式碼。
- 分析你沒有權利擁有或檢查的目標。

本指南不構成法律建議。如有疑問，請諮詢律師。

---

## 3. 可以分析什麼

| 目標 | REA 回傳的內容 | 需要原生引擎？ |
|---|---|---|
| 原生二進位 / 函式庫（EXE、DLL、ELF、Mach-O） | 函式、組合語言、虛擬碼、呼叫端、交叉參照、常數 | 是 — Hopper、Ghidra 或 IDA |
| JavaScript & Electron 應用 | 模組、匯入、IPC 通道 + 處理常式、原始碼位置 | 否 |
| 瀏覽器頁面（執行時） | 請求/回應、腳本、JSON 主體結構、觀察視窗 | Chrome 系瀏覽器 |
| .NET 組件 / Flutter / 套件 | 模組和資源檢查 | 否 |
| Android APK / 裝置 / 資源 | 反編譯的類別、資源、裝置互動 | JADX / adb / Apktool |
| 韌體 | 擷取的檔案系統/二進位區塊 | Binwalk / Unblob（Linux） |
| WASM | 模組和函式檢查 | WABT |
| SQLite 資料庫 | 結構描述和查詢檢查 | Node.js 24.15+ / 26+ |
| EVM 位元組碼 | 合約結構 | Node.js（Linux x64） |
| HAR / SAZ / mitmproxy 擷取 | 解析的流量證據 | Node.js / mitmdump |
| PCAP / PCAPNG | 封包/協定事實 | TShark / capinfos（Linux） |

---

## 4. 系統需求

**最低需求：**
- Node.js **22.23.4+**、**24.22.1+** 或 **26+ (>= 26.12.1)**（含 npm）
- 一個受支援的程式設計代理（見第 2 步）
- 用於調查的工作目錄

**原生（二進位）分析需要**以下之一：
- **Ghidra 12.1.x** + 64 位元 **JDK 21+**（免費，Windows 上建議）
- **IDA**（商業版；已驗證 Windows 舊版 GUI 和 headless supervisor 設定）
- **Hopper**（商業版；macOS 及部分 Linux — **Windows 不可用**）

**作業系統說明：**
- Windows：使用 **PowerShell**；路徑含空格時用引號包圍。如果你的代理在 WSL 中執行，請在 WSL **內部**安裝 Node.js + REA 並使用 Linux 路徑。
- Linux：`procps` 相容的 `ps` 必須在 `PATH` 上，用於 Ghidra/JADX/韌體啟動和靜態分析。
- macOS：使用 Terminal；某些步驟需要 Xcode Command Line Tools（arm64 上建置 Ghidra 反編譯器）。

---

## 5. 第 1 步 — 準備你的電腦

### 5.1 檢查 Node.js

```powershell
node -v
npm -v
```

預期輸出：`v22.23.4+`、`v24.22.1+` 或 `v26.12.1+`。更舊 → 安裝 Node.js 24 LTS。

### 5.2 在 Windows 上安裝 Node.js（如缺少）

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

如要求接受條款請輸入 `Y`，關閉並重新開啟 PowerShell，然後重新檢查 `node -v`。（備用：從 https://nodejs.org/ 下載 Node.js LTS 安裝程式。）

> **PowerShell 注意點：** 如果 `npx` 回報 "running scripts is disabled on this system"，請改用 `npx.cmd` 和 `npm.cmd`：
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3（macOS）

下載 Node.js 24 LTS `.pkg`，或用 Homebrew：`brew install node`。

### 5.4（Linux）

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# 重新開啟 shell，然後：
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 建立工作資料夾

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. 第 2 步 — 選擇程式設計代理

REA 支援任何支援本機 **MCP** 的代理。選一個 — 下面所有範例都使用用戶端的 **setup ID**（`--client <id>`）。

| 用戶端 | Setup ID | 安裝 / 說明 |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex`（Win）· `curl -fsSL https://claude.ai/install.sh \| bash`（macOS/Linux） |
| Claude Desktop | `claude_desktop` | 安裝應用程式，登入，然後 `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` 或安裝腳本 · 使用 ChatGPT 登入 |
| Cursor | `cursor` | 安裝編輯器，開啟工作資料夾，Agent 模式 |
| Windsurf | `windsurf` | 同上；agent 聊天 |
| VS Code | `vscode` | 先設定 GitHub Copilot，然後 Agent 模式 |
| OpenCode | `opencode` | `npm install --global opencode-ai`，執行 `opencode`，`/connect` 你的模型，然後 `--client opencode` |
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
| Factory Droid | `droid` |（npm ≥ 6.5.0）|
| Trae | `trae` |（npm ≥ 6.5.0）|
| WorkBuddy | `workbuddy` |（npm ≥ 6.5.0）|
| ZCode | `zcode` |（npm ≥ 6.5.0）|
| DeepSeek Harness | `dsh` |（npm ≥ 6.5.0）|
| FreeBuff | `freebuff` |（npm ≥ 6.8.0）|

**Grok Bot：** 在機器人的聊天中，讓它在自己的託管電腦上新增名為 `rea` 的自訂 MCP 伺服器：
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. 第 3 步 — 連接 REA

### 方案 A — 讓你的代理完成（建議）

把這段話貼到你的代理聊天中：

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

代理會執行 setup，展示計畫，並在你批准後套用。

### 方案 B — 自己執行 setup

```powershell
npx rea-agents@latest setup
```

或指定某個用戶端：

```powershell
npx rea-agents@latest setup --client opencode
```

Setup 過程中：
- 使用**方向鍵**移動，**空格**選擇用戶端，**Enter** 繼續。
- REA 會新增 **MCP 連線** + **調查技能**，並在修改前**備份現有設定**。
- 任何變更生效前都需要你的批准。
- 第一次練習可以略過可選的 Hopper 安裝。

### 完成 setup 後重新啟動用戶端

- 桌面應用（Claude Desktop、Cursor、Windsurf、VS Code）：**完全結束**並重新開啟（Windows：同時從系統匣圖示結束）。
- 終端機代理（Claude Code、Codex、Gemini CLI、OpenCode）：結束工作階段並重新啟動。

---

## 8. 第 4 步 — 驗證安裝

執行你的用戶端的 doctor 檢查（替換 `<client_id>`）：

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

健康的報告會顯示 `"healthy": true`。然後問你的代理：

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. 第 5 步 — 首次調查（Notes 範例）

官方範例是一個帶有 **Export notes** 按鈕的小 Electron 應用。不需要安裝 Electron — 代理直接讀取程式碼。

貼到你的代理：

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

預期結果：點擊 Export 發送 `notes:export` IPC 訊息；主程序將筆記格式化為 CSV 並把 `notes.csv`（欄位：`id`、`title`）寫入你的下載資料夾。

從終端機手動分析：

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. 原生分析（二進位 / EXE / DLL）

深度原生分析需要一個提供者。在 **Windows** 上請使用 **Ghidra** 或 **IDA**（Hopper 在 Windows 上不可用）。

### 10.1 Ghidra（免費）— Windows 安裝

1. 安裝 **64 位元 JDK 21 或更新版本**（含編譯器）。檢查：
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. 從 release 的 *Assets* 清單下載 **Ghidra 12.1.4**，解壓縮 `ghidra_…_PUBLIC_….zip`（選擇發布壓縮檔，**不是** "Source code"）。
3. 記下包含 `ghidraRun.bat` 的解壓縮目錄 — 它就是你的 `GHIDRA_INSTALL_DIR`。
4. 在 PowerShell 中：
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home 回報的目錄
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   用你的實際安裝路徑替換。檢視 setup 更新的計畫，核准，並**重新啟動代理**。

> Windows Ghidra 支援是**實驗性、唯讀**的，僅適用於本機固定 **NTFS** 磁碟上的原生 x86/x64 PE 應用程式和 DLL。

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

在 macOS arm64 和 Linux arm64 上，需先建置 Ghidra 的原生反編譯器（macOS 需要 Xcode Command Line Tools、make、bison）。

### 10.3 IDA

1. 按照 IDA provider 指南安裝並設定上游 IDA MCP 伺服器。
2. 將其可用的註冊儲存為 `ida-mcp.json`。範例（headless supervisor，含 `idb_open`/`idb_list`/`idb_close`）：
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   對於已連接的舊版 1.4.0 GUI 伺服器，複製其可用的 command/args/env（先在 IDA 中開啟二進位並啟動外掛）。
3. 連接：
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux 上用 `export` 代替 `$env:`。setup 完成後重新啟動代理。

> 已驗證的 IDA 設定包括 Windows 舊版 GUI 和 headless supervisor，以及 macOS arm64 headless supervisor（IDA Professional 9.1）。npm 6.4.0 不包含 macOS headless 設定 / 原生 GUI 橋接 — 這些需要 REA 原始碼建置。

### 10.4 Hopper（僅 macOS / Linux）

Setup 可以偵測現有 Hopper 安裝或提出安裝計畫。在 macOS 上首次開啟時選擇示範模式或啟用授權。Linux 自動安裝要求 x86_64 主機執行 Ubuntu 24.04+、Fedora 41+、Nobara 44+、Arch、CachyOS 或 Omarchy。Linux arm64 請使用 Ghidra。

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 使用提供者

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI 單次函式分析（需先設定 Ghidra）：

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron 應用

不需要原生引擎。把你的代理指向應用**資料夾**或 **.asar**：

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron 應用的 `app.asar` 位置：
- Windows：`C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS：`/Applications/<App>.app/Contents/Resources/app.asar`
- Linux：通常在 `/opt/<App>/resources/app.asar`

從終端機靜態分析：

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

檢視 `normalized_result.summary.ipc` 取得匹配的通道/處理常式，檢視 `normalized_result.graph` 取得原始碼位置。動態計算的通道名可能無法解析 — 執行時請使用瀏覽器觀察（下一節）。

---

## 12. 瀏覽器觀察

1. 用 Chrome 系瀏覽器開啟目標頁面並開啟遠端偵錯，例如：

   **Windows（PowerShell）：**
   ```powershell
   & "C:\Program Files\Google\Chrome\Application\chrome.exe" `
     --remote-debugging-port=9222 `
     --user-data-dir="$env:TEMP\rea-browser" `
     https://rea.tools/examples/notes-web/
   ```
   **Linux：**
   ```bash
   google-chrome --remote-debugging-port=9222 --user-data-dir=/tmp/rea-notes-browser https://rea.tools/examples/notes-web/
   ```

2. 問你的代理：
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   給它端點 `http://127.0.0.1:9222` 和頁面 URL。在點擊**之前**啟動擷取。

   或從終端機：
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

對於 HTTP 主體，Fiddler Everywhere（SAZ/HAR 1.2）匯出可作為 REA capture Evidence 輸入，或連接 Everywhere 的 MCP 伺服器。

---

## 13. 其他目標與所需工具

| 目標 | 需要準備的工具 | 說明 |
|---|---|---|
| JavaScript / Electron | Node.js + npm | 無需引擎 |
| 網站 | Chrome / Chromium / Edge | 遠端偵錯連接埠 |
| .NET / Flutter / 套件 | Node.js + npm | 靜態檢查 |
| Android APK | JADX + JDK 17+ | 反編譯 `classes.dex` |
| Android 裝置 | adb | 啟用 USB 偵錯 |
| Android 資源 | Apktool + Java | 解包資源和資訊清單 |
| JEB 專案 | JEB + MCP | 商業反編譯器 |
| 韌體 | Binwalk / Unblob | **僅限 Linux** |
| WASM | WABT（`wat2wasm`、`wasm2wat`） | |
| SQLite 資料庫 | Node.js 24.15+ / 26+ | |
| EVM 位元組碼 | Node.js | **僅限 Linux x64** |
| ELF / Linux 當機 | pwntools、GDB、pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | 離線擷取解析 |
| PCAP / PCAPNG | TShark / capinfos | **僅限 Linux** |
| 邏輯訊號 | sigrok-cli | **僅限 Linux** |
| 程序行為 | PTY | **Linux / macOS** |

Flutter、套件/資源、EVM 及完整調查指南：見 https://rea.tools/guides。

---

## 14. 建置 RL 環境

REA 可以錄製一個測試 Web 應用工作階段並匯出 **AgentEnv** 環境，用於訓練/評估代理。

1. 準備一個**測試**應用執行個體，代理可以在其中建立/編輯/刪除資料。
2. 問你的代理（以資料夾為例）：
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   密碼保存在 MCP 伺服器環境（`APP_PASSWORD`）中，不要寫進提示詞。
3. 或直接從 HAR 錄製建置：
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` 只檢視報告，不寫檔案。
4. 執行：
   ```bash
   agent-env run ./my-env
   ```
   REA 的相容性檢查使用 **AgentEnv 0.9.1334 + Python 3.12**；Docker 必須在執行。
5. 只有**效果**被錄製的操作才受支援（例如 delete 需要錄製缺失項目回應和更新後的清單）。分享前請檢視保留的回應主體 — 錄製中可能含有憑證。

---

## 15. 從終端機使用 REA（CLI）

不安裝全域套件：

```powershell
npx -y rea-agents@latest --help
```

永久安裝 `rea` 指令：

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux curl 安裝程式（需先安裝 Node.js）：

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

常用指令：

| 指令 | 用途 |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | 對應模組、匯入、IPC、邊界 |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | 分析單一原生函式 |
| `rea-agents list-browser-targets <endpoint> --json` | 列出可偵錯的瀏覽器頁面 |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | 觀察頁面網路/腳本 |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | 建置 RL 環境 |
| `rea-agents environment-compare … --json` | 比對環境與線上應用 |
| `rea-agents doctor --client <id> --json` | 檢查用戶端連線 |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | 檢查原生提供者 |
| `rea-agents update` | 更新 CLI |
| `rea-agents uninstall` | 移除 REA 用戶端設定 + 技能 |

---

## 16. 更新或移除 REA

**更新：**
```powershell
rea update                       # 如已安裝全域 CLI
npx rea-agents@latest setup      # 重新整理代理連線 + 技能；核准計畫，重新啟動代理
```

**移除：**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. 疑難排解

**代理看不到 REA 工具**
1. 完全重新啟動/重新連接用戶端（包括系統匣圖示）。
2. `npx -y rea-agents@latest doctor --client <id> --json` — 如註冊缺失/過期：`npx rea-agents@latest setup --client <id>`，重新啟動。
3. 仍然沒有：檢查用戶端的 MCP 連線錯誤；在編輯器用戶端中，在 MCP 設定中啟用 REA 並允許其工具。

**`npx` — "running scripts is disabled"（Windows PowerShell）**
使用 `npx.cmd` / `npm.cmd`，或 `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`。

**路徑含空格**
用引號包圍：`"D:/my apps/tool.exe"`。在 WSL 中使用 Linux 路徑並在 WSL 內安裝 REA。

**Windows Ghidra 限制**
實驗性、唯讀、僅 x86/x64 PE，固定本機 NTFS 磁碟。Linux 替代：Ghidra/Hopper。原生 x64 Linux ELF 當機分析：pwntools。

**macOS 請求自動化權限（Hopper）**
系統設定 → 隱私權與安全性 → 自動化 → 允許啟動 REA 的應用程式，重試。

**Hopper 首次執行**
在無人值守分析前完成示範模式 vs 授權啟用的選擇。

**Linux 缺少 `ps`**
安裝 `procps`（Debian/Ubuntu：`sudo apt install procps`）；REA 需要它做程序擁有權檢查。

**遇到 bug？**
更新 REA、重新啟動、重試。然後提交 issue，包含：REA 版本、作業系統、目標類型、重現步驟、錯誤輸出、提供者名稱。見 https://github.com/morluto/rea/issues。

---

## 18. 資料、隱私與安全

- REA 在**你的機器上**分析目標；你的應用程式**不會**被 REA 上傳。
- 你的**代理模型供應商**會收到結果 — 適用其資料/保留政策。不要把密鑰或客戶資料貼到提示詞中。
- MCP 輸入 schema 預設精簡；如需完整欄位說明，在 MCP 註冊中設定 `REA_MCP_INPUT_SCHEMA_PROFILE=full`。可用 `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact`（或 `off`）限制輸出 schema。
- RL 環境錄製可能保留主體/請求標頭中的憑證 — 分享前請檢視。Credential-name 警告會標出需檢視位置；它們**不會**刪除值。
- `APP_PASSWORD` 之類的密鑰放在 MCP 伺服器環境中，不要放進聊天。
- 只從 `morluto/rea`、`rea.tools` 或 npm `rea-agents` 安裝 REA。

---

## 19. 快速參考清單

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] 已安裝程式設計代理（OpenCode / Claude Code / Codex / Cursor / ...）
[ ] npx rea-agents@latest setup --client <id>   （檢視並核准計畫）
[ ] 用戶端完全重新啟動
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] 首次調查：notes-example.zip  →  找到 notes:export / notes.csv
[ ]（選用）原生：JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → 重新執行 setup → 重新啟動代理
[ ]（選用）瀏覽器：Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] 法律：你擁有 / 有權分析該目標
```

---

## 20. 離線備份 / 映像（非官方）

> ⚠️ **先讀這裡。**
> 官方專案不存在所謂的「官方備份」。唯一的官方 REA 是 **morluto/rea**（https://github.com/morluto/rea）、**rea.tools** 和 **`rea-agents` npm 套件**。
> 本倉庫提供的是官方專案的完整、授權相容的**非官方映像 / 存檔**，保留了原始 MIT 授權和版權聲明。它的存在是為了：**當官方倉庫、網站或 npm 套件消失時**，你仍然可以從這裡取得 REA — 僅此而已。
> 只要官方來源存在，**就使用官方來源**。不要把本備份稱為「官方」，也不要把它作為「官方 REA」散布。本倉庫與 REA 作者無任何關聯，也未獲其背書。

**授權：** REA 採用 MIT 授權，允許在保留聲明的前提下複製、修改和散布。完整的授權、版權標頭和第三方聲明均保留在映像分支和 npm tarball 中。不提供任何形式的擔保。

### 備份裡有什麼

| 備份部分 | 位置 | 說明 |
|---|---|---|
| 原始碼映像 | 分支 **`mirror/rea`** | 官方 `morluto/rea` `main` 的完整 git 歷史（截至上次同步 — v6.9.0，提交 `cdc4541ef707f256f83abe5018df01a25182cf0b`）|
| 發布標籤 | 標籤 **`rea-agents-*.*.*`** | 全部官方發布標籤，指向確切的官方提交（v2.7.0 → v6.9.0）|
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | 官方 npm 套件，預建置（含 `dist/`）— 完全**離線**安裝 |
| 同步腳本 | **`scripts/sync-backup.ps1`** | 從官方來源重新整理映像分支、標籤和最新 npm tarball |
| 還原腳本 | **`scripts/restore-backup.ps1`** | 一鍵離線安裝 tarball 並列印後續步驟 |
| 指南 | `README.md`（英文主檔）| 完整安裝指南；無論 REA 從哪個來源取得都適用 |

### 保持備份新鮮

每週執行（或在你依賴它之前）：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

它會 fetch `upstream/main` + 所有標籤，強制更新 `mirror/rea`，推送標籤，`npm pack` 最新的 `rea-agents-*.*.*` 發布版本到 `backup/`，並列印 tarball 的最終 `git add`/`commit`/`push` 指令。

### 還原場景

**場景 A — GitHub 掛了，npm 還在：** 無需還原。繼續使用 `npx rea-agents@latest setup`。

**場景 B — GitHub + npm 都掛了：** 從本倉庫安裝預建置的 tarball（無需網路、無需建置工具）：
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# 或手動：
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` 會像官方 `npx rea-agents setup` 一樣向你的代理註冊 MCP 伺服器 + 技能 — 完全離線，因為它不存取註冊表。

**場景 C — 你還需要完整原始碼/歷史：**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# 完整官方原始碼，截至上次同步。
```

從原始碼建置需要 Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ 以及存取 npm 註冊表的網路（它是 turbo monorepo；`npm ci && npm run build`）。tarball 路徑（場景 B）兩者都不需要 — 還原時請優先使用它。

### 驗證你還原的內容
```powershell
# 原始碼映像完整性 — 提交應與上次同步的 upstream/main 一致：
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # 複製映像分支後
# Tarball 完整性 — CLI 自身回報的版本：
rea --version
```

如果雜湊值與備份時記錄的不一致，在恢復信任之前，請將該副本視為不可信，並重新從官方來源同步（如果它們回來了）。

### 本備份不保證什麼

- 最後一次同步之後沒有安全性修補 — 被遺棄的備份就是過時的快照。
- 官方 npm 套件可能包含比 `mirror/rea` 或 tarball 更新的熱修復。
- 附屬服務（rea.tools 網站、Discord、發布說明、文件站）是參考資料，不是你從這裡能還原的程式碼。
- 如果 REA 日後以不同名稱/擁有者重新發布，本快照仍可作為封存的上游使用 — 請有意地遷移，不要假定相容。

---

**連結**
- 網站：https://rea.tools/ · 入門：https://rea.tools/get-started/ · 指南：https://rea.tools/guides/
- 常見問題：https://rea.tools/faq/ · 案例集：https://rea.tools/showcases/
- 原始碼：https://github.com/morluto/rea（MIT）· 問題：https://github.com/morluto/rea/issues
- 社群：Discord（見 rea.tools 頁尾）· X：https://x.com/reatools
- **本倉庫的備份：** 分支 `mirror/rea` · 標籤 `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
