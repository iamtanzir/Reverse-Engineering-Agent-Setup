<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — 完整安装指南

> **语言：** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ 本翻译与英文主版本一致。如有分歧，**以英文为准**。代码块、路径和命令从不翻译。

> **REA — Reverse Engineer Anything**
> 一个 MCP（Model Context Protocol）服务器 + 调查技能，让你的编程代理能够检查软件：原生二进制、JavaScript/Electron 应用、浏览器、.NET、Android、固件等等。

- **官方网站：** https://rea.tools/
- **官方源代码：** https://github.com/morluto/rea
- **npm 包：** `rea-agents`
- **许可证：** MIT（REA 本身）。第三方分析工具有各自的许可证。
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)**（英文）— 按平台逐步安装指南（Windows 优先：Electron、Web、.NET、Android、WASM、Native/Ghidra、WSL2），含故障排查
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — 与 REA 搭配使用的完全免费的 coding agent（OpenCode + 免费模型、本地 Ollama、Gemini CLI、Qwen Code）。REA 本身是 MCP 服务器，不是 AI 模型。
- **📦 包含离线备份** — 官方仓库的非官方镜像 + npm tarball，仅在官方来源消失时使用。参见 **[第 20 节 — 离线备份 / 镜像（非官方）](#20-离线备份--镜像非官方)**。

> ⚠️ **重要：** 只能从 `morluto/rea`、`rea.tools` 或 `rea-agents` npm 包下载 REA。相似的仓库名称不能证明它是官方版本。

---

## 目录

1. REA 是什么（不是什么）
2. 合法与负责任的使用
3. 可以分析什么
4. 系统要求
5. 第 1 步 — 准备你的电脑
6. 第 2 步 — 选择编程代理
7. 第 3 步 — 连接 REA
8. 第 4 步 — 验证安装
9. 第 5 步 — 首次调查（Notes 示例）
10. 原生分析（二进制 / EXE / DLL）
11. JavaScript & Electron 应用
12. 浏览器观察
13. 其他目标与所需工具
14. 构建 RL 环境
15. 从终端使用 REA（CLI）
16. 更新或卸载 REA
17. 故障排查
18. 数据、隐私与安全
19. 快速参考清单
20. 离线备份 / 镜像（非官方）

---

## 1. REA 是什么（不是什么）

**REA 是：**
- 本地 MCP 服务器 + 代理技能，让你的**编程代理**检查你本地拥有的软件。
- 返回**证据**：汇编、伪代码、模块地图、IPC 通道配对、捕获的网络流量、源码位置 — 而不是原始源代码。
- 分析在**你的机器上**运行。你的应用不会被 REA 上传；你的代理所用模型提供商会看到结果（参见[数据与隐私](#18-数据隐私与安全)）。

**REA 不是：**
- 一个“把二进制变回原始源代码”的魔法按钮。结果是汇编/伪代码和引用；你的代理负责解释并帮助你重建行为。
- 用于破解许可证/DRM 或绕过付费激活的工具。不要这样使用。
- 绕过混淆的工具。大量打包/保护的目标（VMProtect、Themida、防篡改）仍然极其困难。
- 访问服务器端的能力。它无法检查 API 背后的服务器；只能看到客户端/网络一侧。

---

## 2. 合法与负责任的使用

出于互操作性、安全研究、调试和分析你**拥有**的软件，逆向工程可能是合法的 — 但法律和许可证因司法辖区而异。

你**应该**：
- 分析你拥有、获得许可使用或有权检查的软件。
- 尊重许可协议、服务条款和 DMCA 反规避规则。
- 将研究成果用于互操作性、教育和防御性安全。

你**不应该**：
- 绕过 DRM、许可证激活或复制保护。
- 分发专有软件的破解/泄露代码。
- 分析你没有权利拥有或检查的目标。

本指南不构成法律建议。如有疑问，请咨询律师。

---

## 3. 可以分析什么

| 目标 | REA 返回的内容 | 需要原生引擎？ |
|---|---|---|
| 原生二进制 / 库（EXE、DLL、ELF、Mach-O） | 函数、汇编、伪代码、调用者、交叉引用、常量 | 是 — Hopper、Ghidra 或 IDA |
| JavaScript & Electron 应用 | 模块、导入、IPC 通道 + 处理程序、源码位置 | 否 |
| 浏览器页面（运行时） | 请求/响应、脚本、JSON 主体结构、观察窗口 | Chrome 系浏览器 |
| .NET 程序集 / Flutter / 包 | 模块和资源检查 | 否 |
| Android APK / 设备 / 资源 | 反编译的类、资源、设备交互 | JADX / adb / Apktool |
| 固件 | 提取的文件系统/二进制块 | Binwalk / Unblob（Linux） |
| WASM | 模块和函数检查 | WABT |
| SQLite 数据库 | 模式和查询检查 | Node.js 24.15+ / 26+ |
| EVM 字节码 | 合约结构 | Node.js（Linux x64） |
| HAR / SAZ / mitmproxy 捕获 | 解析的流量证据 | Node.js / mitmdump |
| PCAP / PCAPNG | 数据包/协议事实 | TShark / capinfos（Linux） |

---

## 4. 系统要求

**最低要求：**
- Node.js **22.23.4+**、**24.22.1+** 或 **26+ (>= 26.12.1)**（含 npm）
- 一个受支持的编程代理（见第 2 步）
- 用于调查的工作目录

**原生（二进制）分析需要**以下之一：
- **Ghidra 12.1.x** + 64 位 **JDK 21+**（免费，Windows 上推荐）
- **IDA**（商业版；已验证 Windows 旧版 GUI 和 headless supervisor 配置）
- **Hopper**（商业版；macOS 及部分 Linux — **Windows 不可用**）

**操作系统说明：**
- Windows：使用 **PowerShell**；路径含空格时用引号包围。如果你的代理在 WSL 中运行，请在 WSL **内部**安装 Node.js + REA 并使用 Linux 路径。
- Linux：`procps` 兼容的 `ps` 必须在 `PATH` 上，用于 Ghidra/JADX/固件启动和静态分析。
- macOS：使用 Terminal；某些步骤需要 Xcode Command Line Tools（arm64 上构建 Ghidra 反编译器）。

---

## 5. 第 1 步 — 准备你的电脑

### 5.1 检查 Node.js

```powershell
node -v
npm -v
```

预期输出：`v22.23.4+`、`v24.22.1+` 或 `v26.12.1+`。更旧 → 安装 Node.js 24 LTS。

### 5.2 在 Windows 上安装 Node.js（如缺失）

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

如要求接受条款请输入 `Y`，关闭并重新打开 PowerShell，然后重新检查 `node -v`。（备用：从 https://nodejs.org/ 下载 Node.js LTS 安装程序。）

> **PowerShell 注意点：** 如果 `npx` 报错 "running scripts is disabled on this system"，请改用 `npx.cmd` 和 `npm.cmd`：
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3（macOS）

下载 Node.js 24 LTS `.pkg`，或用 Homebrew：`brew install node`。

### 5.4（Linux）

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# 重新打开 shell，然后：
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 创建工作文件夹

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. 第 2 步 — 选择编程代理

REA 支持任何支持本地 **MCP** 的代理。选一个 — 下面所有示例都使用客户端的 **setup ID**（`--client <id>`）。

| 客户端 | Setup ID | 安装 / 说明 |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex`（Win）· `curl -fsSL https://claude.ai/install.sh \| bash`（macOS/Linux） |
| Claude Desktop | `claude_desktop` | 安装应用，登录，然后 `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` 或安装脚本 · 使用 ChatGPT 登录 |
| Cursor | `cursor` | 安装编辑器，打开工作文件夹，Agent 模式 |
| Windsurf | `windsurf` | 同上；agent 聊天 |
| VS Code | `vscode` | 先配置 GitHub Copilot，然后 Agent 模式 |
| OpenCode | `opencode` | `npm install --global opencode-ai`，运行 `opencode`，`/connect` 你的模型，然后 `--client opencode` |
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

**Grok Bot：** 在机器人的聊天中，让它在自己的托管电脑上添加名为 `rea` 的自定义 MCP 服务器：
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. 第 3 步 — 连接 REA

### 方案 A — 让你的代理完成（推荐）

把这段话粘贴到你的代理聊天中：

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

代理会运行 setup，展示计划，并在你批准后应用。

### 方案 B — 自己运行 setup

```powershell
npx rea-agents@latest setup
```

或指定某个客户端：

```powershell
npx rea-agents@latest setup --client opencode
```

Setup 过程中：
- 使用**方向键**移动，**空格**选择客户端，**回车**继续。
- REA 会添加 **MCP 连接** + **调查技能**，并在修改前**备份现有配置**。
- 任何更改生效前都需要你的批准。
- 第一次练习可以跳过可选的 Hopper 安装。

### 完成 setup 后重启客户端

- 桌面应用（Claude Desktop、Cursor、Windsurf、VS Code）：**完全退出**并重新打开（Windows：同时从托盘图标退出）。
- 终端代理（Claude Code、Codex、Gemini CLI、OpenCode）：退出会话并重新启动。

---

## 8. 第 4 步 — 验证安装

运行你的客户端的 doctor 检查（替换 `<client_id>`）：

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

健康的报告会显示 `"healthy": true`。然后问你的代理：

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. 第 5 步 — 首次调查（Notes 示例）

官方示例是一个带有 **Export notes** 按钮的小 Electron 应用。不需要安装 Electron — 代理直接读取代码。

粘贴到你的代理：

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

预期结果：点击 Export 发送 `notes:export` IPC 消息；主进程将笔记格式化为 CSV 并把 `notes.csv`（列：`id`、`title`）写入你的下载文件夹。

从终端手动分析：

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. 原生分析（二进制 / EXE / DLL）

深度原生分析需要一个提供程序。在 **Windows** 上请使用 **Ghidra** 或 **IDA**（Hopper 在 Windows 上不可用）。

### 10.1 Ghidra（免费）— Windows 安装

1. 安装 **64 位 JDK 21 或更新版本**（含编译器）。检查：
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. 从 release 的 *Assets* 列表下载 **Ghidra 12.1.4**，解压 `ghidra_…_PUBLIC_….zip`（选择发布压缩包，**不是** "Source code"）。
3. 记下包含 `ghidraRun.bat` 的解压目录 — 它就是你的 `GHIDRA_INSTALL_DIR`。
4. 在 PowerShell 中：
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home 报告的目录
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   用你的实际安装路径替换。审阅 setup 更新的计划，批准，并**重启代理**。

> Windows Ghidra 支持是**实验性、只读**的，仅适用于本地固定 **NTFS** 驱动器上的原生 x86/x64 PE 应用和 DLL。

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

在 macOS arm64 和 Linux arm64 上，需先构建 Ghidra 的原生反编译器（macOS 需要 Xcode Command Line Tools、make、bison）。

### 10.3 IDA

1. 按照 IDA provider 指南安装并配置上游 IDA MCP 服务器。
2. 将其可用的注册保存为 `ida-mcp.json`。示例（headless supervisor，含 `idb_open`/`idb_list`/`idb_close`）：
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   对于已连接的旧版 1.4.0 GUI 服务器，复制其可用的 command/args/env（先在 IDA 中打开二进制并启动插件）。
3. 连接：
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux 上用 `export` 代替 `$env:`。setup 完成后重启代理。

> 已验证的 IDA 配置包括 Windows 旧版 GUI 和 headless supervisor，以及 macOS arm64 headless supervisor（IDA Professional 9.1）。npm 6.4.0 不包含 macOS headless 配置 / 原生 GUI 桥接 — 这些需要 REA 源码构建。

### 10.4 Hopper（仅 macOS / Linux）

Setup 可以检测现有 Hopper 安装或提出安装计划。在 macOS 上首次打开时选择演示模式或激活许可证。Linux 自动安装要求 x86_64 主机运行 Ubuntu 24.04+、Fedora 41+、Nobara 44+、Arch、CachyOS 或 Omarchy。Linux arm64 请使用 Ghidra。

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 使用提供程序

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI 单次函数分析（需先配置 Ghidra）：

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron 应用

不需要原生引擎。把你的代理指向应用**文件夹**或 **.asar**：

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron 应用的 `app.asar` 位置：
- Windows：`C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS：`/Applications/<App>.app/Contents/Resources/app.asar`
- Linux：通常在 `/opt/<App>/resources/app.asar`

从终端静态分析：

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

查看 `normalized_result.summary.ipc` 获取匹配的通道/处理程序，查看 `normalized_result.graph` 获取源码位置。动态计算的通道名可能无法解析 — 运行时请使用浏览器观察（下一节）。

---

## 12. 浏览器观察

1. 用 Chrome 系浏览器打开目标页面并开启远程调试，例如：

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

2. 问你的代理：
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   给它端点 `http://127.0.0.1:9222` 和页面 URL。在点击**之前**启动捕获。

   或从终端：
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

对于 HTTP 主体，Fiddler Everywhere（SAZ/HAR 1.2）导出可作为 REA capture Evidence 输入，或连接 Everywhere 的 MCP 服务器。

---

## 13. 其他目标与所需工具

| 目标 | 需要准备的工具 | 说明 |
|---|---|---|
| JavaScript / Electron | Node.js + npm | 无需引擎 |
| 网站 | Chrome / Chromium / Edge | 远程调试端口 |
| .NET / Flutter / 包 | Node.js + npm | 静态检查 |
| Android APK | JADX + JDK 17+ | 反编译 `classes.dex` |
| Android 设备 | adb | 启用 USB 调试 |
| Android 资源 | Apktool + Java | 解包资源和清单 |
| JEB 项目 | JEB + MCP | 商业反编译器 |
| 固件 | Binwalk / Unblob | **仅限 Linux** |
| WASM | WABT（`wat2wasm`、`wasm2wat`） | |
| SQLite 数据库 | Node.js 24.15+ / 26+ | |
| EVM 字节码 | Node.js | **仅限 Linux x64** |
| ELF / Linux 崩溃 | pwntools、GDB、pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | 离线捕获解析 |
| PCAP / PCAPNG | TShark / capinfos | **仅限 Linux** |
| 逻辑信号 | sigrok-cli | **仅限 Linux** |
| 进程行为 | PTY | **Linux / macOS** |

Flutter、包/资源、EVM 及完整调查指南：见 https://rea.tools/guides.

---

## 14. 构建 RL 环境

REA 可以录制一个测试 Web 应用会话并导出 **AgentEnv** 环境，用于训练/评估代理。

1. 准备一个**测试**应用实例，代理可以在其中创建/编辑/删除数据。
2. 问你的代理（以文件夹为例）：
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   密码保存在 MCP 服务器环境（`APP_PASSWORD`）中，不要写进提示词。
3. 或直接从 HAR 录制构建：
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` 只审阅报告，不写文件。
4. 运行：
   ```bash
   agent-env run ./my-env
   ```
   REA 的兼容性检查使用 **AgentEnv 0.9.1334 + Python 3.12**；Docker 必须在运行。
5. 只有**效果**被录制的操作才受支持（例如 delete 需要录制缺失项响应和更新后的列表）。分享前请审阅保留的响应主体 — 录制中可能含有凭据。

---

## 15. 从终端使用 REA（CLI）

不安装全局包：

```powershell
npx -y rea-agents@latest --help
```

永久安装 `rea` 命令：

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux curl 安装器（需先安装 Node.js）：

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

常用命令：

| 命令 | 用途 |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | 映射模块、导入、IPC、边界 |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | 分析单个原生函数 |
| `rea-agents list-browser-targets <endpoint> --json` | 列出可调试的浏览器页面 |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | 观察页面网络/脚本 |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | 构建 RL 环境 |
| `rea-agents environment-compare … --json` | 对比环境与线上应用 |
| `rea-agents doctor --client <id> --json` | 检查客户端连接 |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | 检查原生提供程序 |
| `rea-agents update` | 更新 CLI |
| `rea-agents uninstall` | 移除 REA 客户端配置 + 技能 |

---

## 16. 更新或卸载 REA

**更新：**
```powershell
rea update                       # 如已安装全局 CLI
npx rea-agents@latest setup      # 刷新代理连接 + 技能；批准计划，重启代理
```

**卸载：**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. 故障排查

**代理看不到 REA 工具**
1. 完全重启/重连客户端（包括托盘图标）。
2. `npx -y rea-agents@latest doctor --client <id> --json` — 如注册缺失/过期：`npx rea-agents@latest setup --client <id>`，重启。
3. 仍然没有：检查客户端的 MCP 连接错误；在编辑器客户端中，在 MCP 设置中启用 REA 并允许其工具。

**`npx` — "running scripts is disabled"（Windows PowerShell）**
使用 `npx.cmd` / `npm.cmd`，或 `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`。

**路径含空格**
用引号包围：`"D:/my apps/tool.exe"`。在 WSL 中使用 Linux 路径并在 WSL 内安装 REA。

**Windows Ghidra 限制**
实验性、只读、仅 x86/x64 PE，固定本地 NTFS 驱动器。Linux 替代：Ghidra/Hopper。原生 x64 Linux ELF 崩溃分析：pwntools。

**macOS 请求自动化权限（Hopper）**
系统设置 → 隐私与安全性 → 自动化 → 允许启动 REA 的应用，重试。

**Hopper 首次运行**
在无人值守分析前完成演示模式 vs 许可证激活的选择。

**Linux 缺少 `ps`**
安装 `procps`（Debian/Ubuntu：`sudo apt install procps`）；REA 需要它做进程所有权检查。

**遇到 bug？**
更新 REA、重启、重试。然后提交 issue，包含：REA 版本、操作系统、目标类型、复现步骤、错误输出、提供程序名称。见 https://github.com/morluto/rea/issues.

---

## 18. 数据、隐私与安全

- REA 在**你的机器上**分析目标；你的应用**不会**被 REA 上传。
- 你的**代理模型提供商**会收到结果 — 适用其数据/保留政策。不要把密钥或客户数据粘贴到提示词中。
- MCP 输入 schema 默认紧凑；如需完整字段说明，在 MCP 注册中设置 `REA_MCP_INPUT_SCHEMA_PROFILE=full`。可用 `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact`（或 `off`）限制输出 schema。
- RL 环境录制可能保留主体/请求头中的凭据 — 分享前请审阅。Credential-name 警告会标出需审阅位置；它们**不会**删除值。
- `APP_PASSWORD` 之类的密钥放在 MCP 服务器环境中，不要放进聊天。
- 只从 `morluto/rea`、`rea.tools` 或 npm `rea-agents` 安装 REA。

---

## 19. 快速参考清单

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] 已安装编程代理（OpenCode / Claude Code / Codex / Cursor / ...）
[ ] npx rea-agents@latest setup --client <id>   （审阅并批准计划）
[ ] 客户端完全重启
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] 首次调查：notes-example.zip  →  找到 notes:export / notes.csv
[ ]（可选）原生：JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → 重新运行 setup → 重启代理
[ ]（可选）浏览器：Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] 法律：你拥有 / 有权分析该目标
```

---

## 20. 离线备份 / 镜像（非官方）

> ⚠️ **先读这里。**
> 官方项目不存在所谓的“官方备份”。唯一的官方 REA 是 **morluto/rea**（https://github.com/morluto/rea）、**rea.tools** 和 **`rea-agents` npm 包**。
> 本仓库提供的是官方项目的完整、许可证兼容的**非官方镜像 / 存档**，保留了原始 MIT 许可证和版权声明。它的存在是为了：**当官方仓库、网站或 npm 包消失时**，你仍然可以从这里获得 REA — 仅此而已。
> 只要官方来源存在，**就使用官方来源**。不要把本备份称为“官方”，也不要把它作为“官方 REA”分发。本仓库与 REA 作者无任何关联，也未获其背书。

**许可证：** REA 采用 MIT 许可证，允许在保留声明的前提下复制、修改和分发。完整的许可证、版权头和第三方声明均保留在镜像分支和 npm tarball 中。不提供任何形式的担保。

### 备份里有什么

| 备份部分 | 位置 | 说明 |
|---|---|---|
| 源码镜像 | 分支 **`mirror/rea`** | 官方 `morluto/rea` `main` 的完整 git 历史（截至上次同步 — v6.9.0，提交 `cdc4541ef707f256f83abe5018df01a25182cf0b`）|
| 发布标签 | 标签 **`rea-agents-*.*.*`** | 全部官方发布标签，指向确切的官方提交（v2.7.0 → v6.9.0）|
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | 官方 npm 包，预构建（含 `dist/`）— 完全**离线**安装 |
| 同步脚本 | **`scripts/sync-backup.ps1`** | 从官方来源刷新镜像分支、标签和最新 npm tarball |
| 恢复脚本 | **`scripts/restore-backup.ps1`** | 一键离线安装 tarball 并打印后续步骤 |
| 指南 | `README.md`（英文主文件）| 完整安装指南；无论 REA 从哪个来源获取都适用 |

### 保持备份新鲜

每周运行（或在你依赖它之前）：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

它会 fetch `upstream/main` + 所有标签，强制更新 `mirror/rea`，推送标签，`npm pack` 最新的 `rea-agents-*.*.*` 发布版本到 `backup/`，并打印 tarball 的最终 `git add`/`commit`/`push` 命令。

### 恢复场景

**场景 A — GitHub 挂了，npm 还在：** 无需恢复。继续使用 `npx rea-agents@latest setup`。

**场景 B — GitHub + npm 都挂了：** 从本仓库安装预构建的 tarball（无需网络、无需构建工具）：
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# 或手动：
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` 会像官方 `npx rea-agents setup` 一样向你的代理注册 MCP 服务器 + 技能 — 完全离线，因为它不访问注册表。

**场景 C — 你还需要完整源码/历史：**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# 完整官方源码，截止于上次同步。
```

从源码构建需要 Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ 以及访问 npm 注册表的网络（它是 turbo monorepo；`npm ci && npm run build`）。tarball 路径（场景 B）两者都不需要 — 恢复时请优先使用它。

### 验证你恢复的内容
```powershell
# 源码镜像完整性 — 提交应与上次同步的 upstream/main 一致：
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # 克隆镜像分支后
# Tarball 完整性 — CLI 自身报告的版本：
rea --version
```

如果哈希值与备份时记录的不一致，在恢复信任之前，请视该副本为不可信，并重新从官方来源同步（如果它们回来了）。

### 本备份不保证什么

- 最后一次同步之后没有安全补丁 — 被遗弃的备份就是过时的快照。
- 官方 npm 包可能包含比 `mirror/rea` 或 tarball 更新的热修复。
- 附属服务（rea.tools 网站、Discord、发布说明、文档站）是参考资料，不是你从这里能恢复的代码。
- 如果 REA 日后以不同名称/所有者重新发布，本快照仍可作为归档的上游使用 — 请有意地迁移，不要假定兼容。

---

**链接**
- 网站：https://rea.tools/ · 入门：https://rea.tools/get-started/ · 指南：https://rea.tools/guides/
- 常见问题：https://rea.tools/faq/ · 案例集：https://rea.tools/showcases/
- 源码：https://github.com/morluto/rea（MIT）· 问题：https://github.com/morluto/rea/issues
- 社区：Discord（见 rea.tools 页脚）· X：https://x.com/reatools
- **本仓库的备份：** 分支 `mirror/rea` · 标签 `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
