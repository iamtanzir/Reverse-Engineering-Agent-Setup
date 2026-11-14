# Reverse Engineering Agent — Hướng dẫn cài đặt đầy đủ

> **Ngôn ngữ:** 🇬🇧 [English](../README.md) (chính / có thẩm quyền) · 🇨🇳 [简体中文](README.zh-CN.md) · 🇹🇼 [繁體中文](README.zh-TW.md) · 🇯🇵 [日本語](README.ja.md) · 🇰🇷 [한국어](README.ko.md) · 🇹🇷 [Türkçe](README.tr.md) · 🇷🇺 [Русский](README.ru.md) · 🇻🇳 [Tiếng Việt](README.vi.md) · 🇹🇭 [ไทย](README.th.md) · 🇩🇪 [Deutsch](README.de.md) · 🇪🇸 [Español](README.es.md) · 🇫🇷 [Français](README.fr.md) · 🇺🇦 [Українська](README.uk.md) · 🇵🇱 [Polski](README.pl.md) · 🇧🇷 [Português (Brasil)](README.pt-BR.md) · 🇸🇦 [العربية](README.ar.md) · 🇮🇷 [فارسی](README.fa.md) · 🇮🇩 [Bahasa Indonesia](README.id.md) · 🇮🇹 [Italiano](README.it.md) · 🇬🇷 [Ελληνικά](README.el.md) · 🇮🇳 [മലയാളം](README.ml.md) · 🇵🇰 [Roman Urdu](README.ur-Latn.md) · 🇷🇴 [Română](README.ro.md) · 🇧🇬 [Български](README.bg.md)
>
> ℹ️ Bản dịch này khớp với bản tiếng Anh gốc. Nếu có khác biệt, **bản tiếng Anh thắng**. Khối lệnh, đường dẫn và lệnh không bao giờ được dịch.

> **REA — Reverse Engineer Anything**
> MCP (Model Context Protocol) server + kỹ năng điều tra: cung cấp cho coding agent của bạn công cụ để kiểm tra phần mềm — binary native, ứng dụng JavaScript/Electron, trình duyệt, .NET, Android, firmware, v.v.

- **Trang chính thức:** https://rea.tools/
- **Mã nguồn chính thức:** https://github.com/morluto/rea
- **npm package:** `rea-agents`
- **Giấy phép:** MIT (REA tự thân). Công cụ phân tích của bên thứ ba có giấy phép riêng.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (tiếng Anh) — cài đặt từng bước theo nền tảng (Windows trước: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) kèm xử lý lỗi
- **📦 Có sẵn backup offline** — mirror không chính thức của repo chính thức + npm tarball; chỉ dùng nếu nguồn chính thức biến mất. Xem **[Phần 20 — Backup / Mirror offline (không chính thức)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Quan trọng:** Chỉ tải REA từ `morluto/rea`, `rea.tools`, hoặc npm package `rea-agents`. Tên repo tương tự không chứng minh đó là bản chính thức.

---

## Mục lục

1. REA là gì (và không là gì)
2. Sử dụng hợp pháp và có trách nhiệm
3. Bạn có thể phân tích gì
4. Yêu cầu hệ thống
5. Bước 1 — Chuẩn bị máy tính
6. Bước 2 — Chọn coding agent
7. Bước 3 — Kết nối REA
8. Bước 4 — Xác minh cài đặt
9. Bước 5 — Điều tra đầu tiên (ví dụ Notes)
10. Phân tích native (binary / EXE / DLL)
11. Ứng dụng JavaScript & Electron
12. Quan sát trình duyệt
13. Mục tiêu khác & công cụ cần chuẩn bị
14. Xây dựng RL environments
15. Dùng REA từ terminal (CLI)
16. Cập nhật hoặc gỡ REA
17. Xử lý sự cố
18. Dữ liệu, riêng tư & bảo mật
19. Checklist tham chiếu nhanh
20. Backup / Mirror offline (không chính thức)

---

## 1. REA là gì (và không là gì)

**REA là:**
- MCP server cục bộ + kỹ năng agent — cho **coding agent** của bạn khả năng kiểm tra phần mềm trên máy.
- Trả về **bằng chứng**: assembly, pseudocode, bản đồ module, cặp IPC channel, traffic mạng bị bắt, vị trí source — không phải mã nguồn gốc.
- Phân tích chạy **trên máy bạn**. Ứng dụng của bạn không bị REA upload; nhà cung cấp model của agent sẽ thấy kết quả (xem [Dữ liệu & Riêng tư](#18-data-privacy--security)).

**REA không phải là:**
- Nút ma thuật "biến ngược thành source". Kết quả là assembly/pseudocode và tham chiếu; agent giải thích và giúp bạn dựng lại hành vi.
- Công cụ bẻ khóa license/DRM hay vượt activation trả phí. Đừng dùng cho việc đó.
- Công cụ vượt obfuscation. Mục tiêu bị pack/bảo vệ nặng (VMProtect, Themida, chống sửa đổi) cực kỳ khó.
- Truy cập phía server. Không thể kiểm tra server sau API; chỉ thấy phía client/mạng.

---

## 2. Sử dụng hợp pháp và có trách nhiệm

Reverse engineering có thể hợp pháp cho interoperability, nghiên cứu bảo mật, debug và phân tích phần mềm bạn **sở hữu** — nhưng luật và license khác nhau theo nơi.

**Bạn nên:**
- Phân tích phần mềm bạn sở hữu, có license sử dụng, hoặc được phép kiểm tra.
- Tôn trọng license agreement, Terms of Service, và quy định chống circumvention của DMCA.
- Dùng kết quả cho interoperability, giáo dục, và bảo mật phòng thủ.

**Bạn không nên:**
- Vượt DRM, activation license, hoặc bảo vệ chống sao chép.
- Phân phối code crack/rò rỉ của phần mềm độc quyền.
- Phân tích mục tiêu bạn không có quyền sở hữu/kiểm tra.

Hướng dẫn này không phải tư vấn pháp lý. Khi nghi ngờ, hỏi luật sư.

---

## 3. Bạn có thể phân tích gì

| Mục tiêu | REA trả về | Cần engine native? |
|---|---|---|
| Binary native / thư viện (EXE, DLL, ELF, Mach-O) | Hàm, assembly, pseudocode, caller, xrefs, constants | Có — Hopper, Ghidra hoặc IDA |
| Ứng dụng JavaScript & Electron | Modules, imports, IPC channels + handlers, vị trí source | Không |
| Trang trình duyệt (runtime) | Requests/responses, scripts, cấu trúc JSON body, cửa sổ quan sát | Trình duyệt họ Chrome |
| .NET assemblies / Flutter / packages | Kiểm tra module & resource | Không |
| Android APK / thiết bị / resources | Class đã decompile, resources, tương tác thiết bị | JADX / adb / Apktool |
| Firmware | Filesystem/blob đã trích xuất | Binwalk / Unblob (Linux) |
| WASM | Kiểm tra module & function | WABT |
| Cơ sở dữ liệu SQLite | Kiểm tra schema & query | Node.js 24.15+ / 26+ |
| EVM bytecode | Cấu trúc contract | Node.js (Linux x64) |
| Bản ghi HAR / SAZ / mitmproxy | Bằng chứng traffic đã phân tích | Node.js / mitmdump |
| PCAP / PCAPNG | Sự kiện gói tin/giao thức | TShark / capinfos (Linux) |

---

## 4. Yêu cầu hệ thống

**Tối thiểu:**
- Node.js **22.23.4+**, **24.22.1+**, hoặc **26+ (>= 26.12.1)** (kèm npm)
- Một coding agent được hỗ trợ (bước 2)
- Thư mục làm việc cho các cuộc điều tra

**Cho phân tích native (binary)** — một trong:
- **Ghidra 12.1.x** + **JDK 21+** 64-bit (miễn phí, khuyến nghị trên Windows)
- **IDA** (thương mại; đã xác minh Windows legacy GUI + headless supervisor profiles)
- **Hopper** (thương mại; macOS & một số Linux — **không có trên Windows**)

**Ghi chú hệ điều hành:**
- Windows: dùng **PowerShell**; đường dẫn có khoảng trắng phải đặt trong dấu ngoặc. Nếu agent chạy trong WSL, cài Node.js + REA **trong** WSL và dùng đường dẫn Linux.
- Linux: `ps` tương thích `procps` phải có trên `PATH` (cho Ghidra/JADX/firmware và phân tích tĩnh).
- macOS: dùng Terminal; một số bước cần Xcode Command Line Tools (build decompiler Ghidra trên arm64).

---

## 5. Bước 1 — Chuẩn bị máy tính

### 5.1 Kiểm tra Node.js

```powershell
node -v
npm -v
```

Kỳ vọng: `v22.23.4+`, `v24.22.1+`, hoặc `v26.12.1+`. Cũ hơn → cài Node.js 24 LTS.

### 5.2 Cài Node.js trên Windows (nếu thiếu)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Nhập `Y` nếu được hỏi chấp nhận điều khoản, đóng và mở lại PowerShell, kiểm tra lại `node -v`. (Dự phòng: tải installer từ https://nodejs.org/.)

> **Lưu ý PowerShell:** nếu `npx` báo "running scripts is disabled on this system", hãy dùng `npx.cmd` và `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Tải file `.pkg` Node.js 24 LTS, hoặc với Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# mở shell lại, sau đó:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Tạo thư mục làm việc

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Bước 2 — Chọn coding agent

REA hỗ trợ mọi agent nói **MCP** cục bộ. Chọn một — mọi ví dụ dưới dùng **setup ID** của client (`--client <id>`).

| Client | Setup ID | Cài đặt / ghi chú |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Cài app, đăng nhập, sau đó `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` hoặc script cài · đăng nhập ChatGPT |
| Cursor | `cursor` | Cài editor, mở thư mục làm việc, chế độ Agent |
| Windsurf | `windsurf` | Tương tự; chat agent |
| VS Code | `vscode` | Thiết lập GitHub Copilot trước, sau đó chế độ Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, chạy `opencode`, `/connect` model, sau đó `--client opencode` |
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

**Grok Bot:** trong chat của bot, yêu cầu nó thêm MCP server tên `rea` trên máy chủ riêng của nó:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Bước 3 — Kết nối REA

### Cách A — Để agent làm (khuyến nghị)

Dán vào chat của agent:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agent chạy setup, hiển thị kế hoạch và áp dụng sau khi bạn duyệt.

### Cách B — Tự chạy setup

```powershell
npx rea-agents@latest setup
```

Cho một client cụ thể:

```powershell
npx rea-agents@latest setup --client opencode
```

Trong lúc setup:
- **Phím mũi tên** để di chuyển, **Space** để chọn, **Enter** để tiếp tục.
- REA thêm **kết nối MCP** + **kỹ năng điều tra**, và **sao lưu** cấu hình hiện tại trước khi thay đổi.
- Thay đổi chỉ áp dụng sau khi bạn duyệt.
- Bài tập đầu có thể bỏ qua cài đặt Hopper tùy chọn.

### Khởi động lại client sau setup

- App desktop (Claude Desktop, Cursor, Windsurf, VS Code): **thoát hoàn toàn** rồi mở lại (Windows: cũng thoát khỏi khay hệ thống).
- Terminal agents (Claude Code, Codex, Gemini CLI, OpenCode): thoát phiên và mở lại.

---

## 8. Bước 4 — Xác minh cài đặt

Chạy doctor cho client (thay `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Báo cáo khỏe mạnh hiển thị `"healthy": true`. Sau đó hỏi agent:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Bước 5 — Điều tra đầu tiên (ví dụ Notes)

Ví dụ chính thức là app Electron nhỏ với nút **Export notes**. Không cần cài Electron — agent đọc code.

Dán vào agent:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Kết quả kỳ vọng: bấm Export gửi IPC message `notes:export`; main process format notes thành CSV và ghi `notes.csv` (cột: `id`, `title`) vào thư mục Downloads.

Phân tích thủ công từ terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Phân tích native (binary / EXE / DLL)

Phân tích native sâu cần một provider. Trên **Windows**, dùng **Ghidra** hoặc **IDA** (Hopper không có trên Windows).

### 10.1 Ghidra (miễn phí) — cài trên Windows

1. Cài **JDK 64-bit 21 trở lên** (kèm compiler). Kiểm tra:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Tải **Ghidra 12.1.4** từ danh sách *Assets* của release và giải nén `ghidra_…_PUBLIC_….zip` (chọn archive release, **không** "Source code").
3. Ghi nhớ thư mục chứa `ghidraRun.bat` — đó là `GHIDRA_INSTALL_DIR`.
4. Trong PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # thư mục từ java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Thay đường dẫn bằng cài đặt thật của bạn. Xem lại kế hoạch setup, duyệt và **khởi động lại agent**.

> Ghidra trên Windows là **thử nghiệm, chỉ đọc**, chỉ cho app/DLL PE x86/x64 native trên ổ **NTFS** cục bộ cố định.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Trên macOS arm64 và Linux arm64, hãy build native decompiler của Ghidra trước (macOS cần Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Cài và cấu hình upstream IDA MCP theo hướng dẫn của IDA provider.
2. Lưu đăng ký hoạt động thành `ida-mcp.json`. Ví dụ (headless supervisor với `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Với legacy 1.4.0 GUI đã kết nối, sao chép command/args/env hoạt động của nó (mở binary trong IDA và khởi động plugin trước).
3. Kết nối:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Trên macOS/Linux dùng `export` thay `$env:`. Khởi động lại agent sau setup.

> Các profile IDA đã xác minh: Windows legacy GUI và headless supervisor, cùng macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 không bao gồm macOS headless profile / native GUI bridge — cần build REA từ source.

### 10.4 Hopper (chỉ macOS / Linux)

Setup có thể phát hiện Hopper có sẵn hoặc đề xuất kế hoạch cài đặt. Trên macOS, lần đầu mở hãy chọn demo mode hoặc kích hoạt license. Cài tự động trên Linux yêu cầu x86_64 và Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS hoặc Omarchy. Trên Linux arm64, dùng Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Dùng provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Phân tích một hàm một lần từ CLI (cần cấu hình Ghidra):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Ứng dụng JavaScript & Electron

Không cần engine native. Chỉ agent tới **thư mục** app hoặc **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Vị trí `app.asar` của app Electron:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: thường `/opt/<App>/resources/app.asar`

Phân tích tĩnh từ terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Xem `normalized_result.summary.ipc` cho channels/handlers khớp và `normalized_result.graph` cho vị trí source. Tên channel tính toán động có thể không phân giải được — dùng quan sát trình duyệt (mục tiếp theo).

---

## 12. Quan sát trình duyệt

1. Mở trang mục tiêu bằng trình duyệt họ Chrome với remote debugging, ví dụ:

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

2. Hỏi agent:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Cung cấp endpoint `http://127.0.0.1:9222` và URL trang. Bắt đầu capture **trước khi** bấm.

   Hoặc từ terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Cho body HTTP, export của Fiddler Everywhere (SAZ/HAR 1.2) có thể làm REA capture Evidence, hoặc kết nối MCP server của Everywhere.

---

## 13. Mục tiêu khác & công cụ cần chuẩn bị

| Mục tiêu | Công cụ | Ghi chú |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Không cần engine |
| Website | Chrome / Chromium / Edge | Cổng remote debugging |
| .NET / Flutter / packages | Node.js + npm | Kiểm tra tĩnh |
| Android APK | JADX + JDK 17+ | Decompile `classes.dex` |
| Thiết bị Android | adb | Bật USB debugging |
| Android resources | Apktool + Java | Giải nén resources & manifest |
| JEB project | JEB + MCP | Decompiler thương mại |
| Firmware | Binwalk / Unblob | **Chỉ Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Cơ sở dữ liệu SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Chỉ Linux x64** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Phân tích capture offline |
| PCAP / PCAPNG | TShark / capinfos | **Chỉ Linux** |
| Logic signals | sigrok-cli | **Chỉ Linux** |
| Hành vi process | PTY | **Linux / macOS** |

Flutter, packages/resources, EVM và toàn bộ hướng dẫn điều tra: https://rea.tools/guides.

---

## 14. Xây dựng RL environments

REA có thể ghi lại một phiên web app test và xuất thành môi trường **AgentEnv** để huấn luyện/đánh giá agent.

1. Chuẩn bị instance app **test**, nơi agent có thể tạo/sửa/xóa dữ liệu.
2. Hỏi agent (ví dụ với thư mục):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Giữ mật khẩu trong môi trường MCP server (`APP_PASSWORD`), không viết vào prompt.
3. Hoặc build trực tiếp từ bản ghi HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` chỉ xem báo cáo, không ghi file.
4. Chạy:
   ```bash
   agent-env run ./my-env
   ```
   Kiểm tra tương thích của REA dùng **AgentEnv 0.9.1334 + Python 3.12**; Docker phải đang chạy.
5. Chỉ các thao tác có **hiệu ứng** được ghi lại mới được hỗ trợ (ví dụ xóa cần response item-missing và list đã cập nhật được ghi lại). Trước khi chia sẻ, xem lại response body đã giữ — có thể còn credentials.

---

## 15. Dùng REA từ terminal (CLI)

Không cài global:

```powershell
npx -y rea-agents@latest --help
```

Cài lệnh `rea` vĩnh viễn:

```powershell
npm install --global rea-agents
rea --help
rea update
```

curl installer cho macOS / Linux (cần Node.js trước):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Lệnh thường dùng:

| Lệnh | Mục đích |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Bản đồ modules, imports, IPC, ranh giới |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Phân tích một hàm native |
| `rea-agents list-browser-targets <endpoint> --json` | Liệt kê trang trình duyệt debug được |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Quan sát network/scripts của trang |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Build RL environment |
| `rea-agents environment-compare … --json` | So sánh environment với app thật |
| `rea-agents doctor --client <id> --json` | Kiểm tra kết nối client |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Kiểm tra provider native |
| `rea-agents update` | Cập nhật CLI |
| `rea-agents uninstall` | Gỡ cấu hình client + skill của REA |

---

## 16. Cập nhật hoặc gỡ REA

**Cập nhật:**
```powershell
rea update                       # nếu đã cài CLI global
npx rea-agents@latest setup      # làm mới kết nối + skill; duyệt kế hoạch, khởi động lại agent
```

**Gỡ:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Xử lý sự cố

**Agent không thấy công cụ REA**
1. Khởi động lại/kết nối lại client hoàn toàn (kể cả icon khay hệ thống).
2. `npx -y rea-agents@latest doctor --client <id> --json` — nếu đăng ký thiếu/cũ: `npx rea-agents@latest setup --client <id>`, khởi động lại.
3. Vẫn không thấy: kiểm tra lỗi kết nối MCP của client; trong editor, bật REA trong cài đặt MCP và cho phép công cụ của nó.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Dùng `npx.cmd` / `npm.cmd`, hoặc `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Đường dẫn có khoảng trắng**
Đặt trong dấu ngoặc: `"D:/my apps/tool.exe"`. Trong WSL, dùng đường dẫn Linux và cài REA trong WSL.

**Giới hạn Ghidra trên Windows**
Thử nghiệm, chỉ đọc, chỉ PE x86/x64, ổ NTFS cục bộ cố định. Thay thế trên Linux: Ghidra/Hopper. Phân tích crash ELF native x64 Linux: pwntools.

**macOS yêu cầu quyền Automation (Hopper)**
System Settings → Privacy & Security → Automation → cho phép app khởi chạy REA, thử lại.

**Hopper chạy lần đầu**
Hoàn tất lựa chọn demo mode vs kích hoạt license trước khi phân tích không giám sát.

**Linux thiếu `ps`**
Cài `procps` (Debian/Ubuntu: `sudo apt install procps`); REA cần nó để kiểm tra quyền sở hữu process.

**Gặp bug?**
Cập nhật REA, khởi động lại, thử lại. Sau đó mở issue với: phiên bản REA, OS, loại mục tiêu, các bước tái hiện, output lỗi, tên provider. https://github.com/morluto/rea/issues.

---

## 18. Dữ liệu, riêng tư & bảo mật

- REA phân tích mục tiêu **trên máy bạn**; app của bạn **không** bị REA upload.
- **Nhà cung cấp model của agent** nhận kết quả — chính sách dữ liệu/lưu trữ của họ áp dụng. Đừng dán bí mật hoặc dữ liệu khách hàng vào prompt.
- Schema đầu vào MCP mặc định nhỏ gọn; đặt `REA_MCP_INPUT_SCHEMA_PROFILE=full` trong đăng ký MCP để có hướng dẫn trường đầy đủ. Schema đầu ra có thể giới hạn bằng `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (hoặc `off`).
- Bản ghi RL environment có thể giữ credentials trong body/headers — xem lại trước khi chia sẻ. Cảnh báo credential-name chỉ vị trí cần xem; chúng **không** xóa giá trị.
- Bí mật kiểu `APP_PASSWORD` đặt trong môi trường MCP server, không viết trong chat.
- Chỉ cài REA từ `morluto/rea`, `rea.tools`, hoặc npm `rea-agents`.

---

## 19. Checklist tham chiếu nhanh

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Coding agent đã cài (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (xem lại & duyệt kế hoạch)
[ ] Client khởi động lại hoàn toàn
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Điều tra đầu tiên: notes-example.zip  →  tìm notes:export / notes.csv
[ ] (Tùy chọn) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → chạy lại setup → khởi động lại agent
[ ] (Tùy chọn) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Pháp lý: bạn sở hữu / có quyền phân tích mục tiêu
```

---

## 20. Backup / Mirror offline (không chính thức)

> ⚠️ **Đọc trước.**
> Không tồn tại "backup chính thức" của một dự án chính thức. REA chính thức duy nhất là **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, và npm package **`rea-agents`**.
> Repo này cung cấp một **mirror / archive không chính thức** đầy đủ và tuân thủ giấy phép của dự án chính thức, giữ nguyên giấy phép MIT và thông báo bản quyền. Nó tồn tại để **nếu repo, website hoặc npm package chính thức biến mất**, bạn vẫn lấy được REA ở đây — chỉ vậy thôi.
> Nếu nguồn chính thức còn tồn tại, **hãy dùng chúng**. Đừng gọi backup này là "chính thức" hoặc phân phối lại như "official REA". Repo này không liên kết/không được tác giả REA chứng thực.

**Giấy phép:** REA dùng MIT — cho phép sao chép, sửa đổi và phân phối kèm thông báo. Giấy phép đầy đủ, header bản quyền và thông báo bên thứ ba được giữ trong cả nhánh mirror lẫn npm tarball. Không có bảo hành dưới bất kỳ hình thức nào.

### Backup gồm những gì

| Thành phần backup | Vị trí | Nội dung |
|---|---|---|
| Source mirror | Nhánh **`mirror/rea`** | Toàn bộ git history của `morluto/rea` `main` chính thức (tại lần sync cuối — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Release tags | Tags **`rea-agents-*.*.*`** | Mọi tag release chính thức, trỏ tới commit chính thức chính xác (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Package npm chính thức, prebuilt (kèm `dist/`) — cài **hoàn toàn offline** |
| Script sync | **`scripts/sync-backup.ps1`** | Làm mới nhánh mirror, tags và npm tarball mới nhất từ nguồn chính thức |
| Script khôi phục | **`scripts/restore-backup.ps1`** | Cài tarball một phát offline + in hướng dẫn bước tiếp theo |
| Hướng dẫn | `README.md` (bản tiếng Anh) | Hướng dẫn cài đặt đầy đủ; có hiệu lực bất kể REA lấy từ nguồn nào |

### Giữ backup luôn mới

Chạy hàng tuần (hoặc trước khi phụ thuộc vào nó):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Nó fetch `upstream/main` + mọi tag, force-update `mirror/rea`, push tags, `npm pack` bản `rea-agents-*.*.*` mới nhất vào `backup/`, và in lệnh `git add`/`commit`/`push` cuối cho tarball.

### Kịch bản khôi phục

**Tình huống A — GitHub chết, npm còn sống:** không cần khôi phục. Tiếp tục dùng `npx rea-agents@latest setup`.

**Tình huống B — GitHub + npm đều chết:** cài tarball prebuilt từ repo này (không mạng, không công cụ build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# hoặc thủ công:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` đăng ký MCP server + skill với agent của bạn đúng như `npx rea-agents setup` chính thức — hoàn toàn offline, không đụng registry.

**Tình huống C — Bạn cũng cần full source/history:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Full source chính thức tại thời điểm sync cuối.
```

Build từ source cần Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ và mạng tới npm registry (turbo monorepo; `npm ci && npm run build`). Đường tarball (Tình huống B) không cần cả hai — luôn ưu tiên nó khi khôi phục.

### Xác minh thứ bạn khôi phục
```powershell
# Tính toàn vẹn của source mirror — commit phải khớp với upstream/main sync cuối:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # sau khi clone nhánh mirror
# Tính toàn vẹn tarball — phiên bản CLI tự báo:
rea --version
```

Nếu hash lệch với bản ghi lúc backup, coi bản sao là đáng nghi và sync lại từ nguồn chính thức (nếu nó đã quay lại) trước khi tin tưởng.

### Backup này KHÔNG đảm bảo

- Không có security patch sau lần sync cuối — backup bỏ quên là snapshot lỗi thời.
- Package npm chính thức có thể mang hotfix mới hơn `mirror/rea` hoặc tarball.
- Dịch vụ phụ (website rea.tools, Discord, release notes, docs site) là tài liệu tham khảo, không phải code có thể khôi phục từ đây.
- Nếu REA sau này phát hành lại dưới tên/chủ sở hữu khác, snapshot này vẫn hoạt động như upstream đã lưu trữ — hãy migrate có chủ đích, đừng mặc định tương thích.

---

**Liên kết**
- Website: https://rea.tools/ · Bắt đầu: https://rea.tools/get-started/ · Guides: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Source: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Cộng đồng: Discord (xem footer rea.tools) · X: https://x.com/reatools
- **Backup của repo này:** branch `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
