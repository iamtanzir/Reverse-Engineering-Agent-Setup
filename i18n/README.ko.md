<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — 전체 설정 가이드라인

> **언어:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ 이 번역본은 영어 마스터와 동일합니다. 불일치 시 **영어가 우선**합니다. 코드 블록, 경로, 명령어는 번역되지 않습니다.

> **REA — Reverse Engineer Anything**
> MCP(Model Context Protocol) 서버 + 조사 스킬로, 코딩 에이전트에 소프트웨어를 검사하는 도구를 제공합니다: 네이티브 바이너리, JavaScript/Electron 앱, 브라우저, .NET, Android, 펌웨어 등.

- **공식 웹사이트:** https://rea.tools/
- **공식 소스 코드:** https://github.com/morluto/rea
- **npm 패키지:** `rea-agents`
- **라이선스:** MIT(REA 자체). 서드파티 분석 도구는 각자의 라이선스를 따릅니다.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)**(영어) — 플랫폼별 단계별 설정(Windows 우선: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2), 문제 해결 포함
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — REA와 함께 쓰는 완전 무료 coding agent(무료 모델 OpenCode, 로컬 Ollama, Gemini CLI, Qwen Code). REA 자체는 MCP 서버이며 AI 모델이 아닙니다.
- **📦 오프라인 백업 포함** — 공식 저장소의 비공식 미러 + npm tarball. 공식 소스가 사라진 경우에만 사용. **[섹션 20 — 오프라인 백업 / 미러(비공식)](#20-오프라인-백업--미러비공식)** 참조.

> ⚠️ **중요:** REA는 `morluto/rea`, `rea.tools`, 또는 `rea-agents` npm 패키지에서만 다운로드하세요. 유사한 저장소 이름은 공식 릴리스를 의미하지 않습니다.

---

## 목차

1. REA란 무엇인가 (무엇이 아닌가)
2. 합법적이고 책임 있는 사용
3. 분석 가능한 대상
4. 시스템 요구 사항
5. 1단계 — 컴퓨터 준비
6. 2단계 — 코딩 에이전트 선택
7. 3단계 — REA 연결
8. 4단계 — 설치 검증
9. 5단계 — 첫 조사(Notes 예제)
10. 네이티브 분석(바이너리 / EXE / DLL)
11. JavaScript & Electron 앱
12. 브라우저 관찰
13. 기타 대상과 필요한 도구
14. RL 환경 구축
15. 터미널에서 REA 사용(CLI)
16. REA 업데이트 또는 제거
17. 문제 해결
18. 데이터, 개인정보 및 보안
19. 빠른 참조 체크리스트
20. 오프라인 백업 / 미러(비공식)

---

## 1. REA란 무엇인가 (무엇이 아닌가)

**REA는:**
- 로컬 MCP 서버 + 에이전트 스킬 — **코딩 에이전트**가 로컬에 있는 소프트웨어를 검사할 수 있게 합니다.
- **증거**를 반환합니다: 어셈블리, 의사코드, 모듈 맵, IPC 채널 쌍, 캡처된 네트워크 트래픽, 소스 위치 — 원본 소스 코드가 아닙니다.
- 분석은 **사용자 컴퓨터에서** 실행됩니다. 사용자의 앱은 REA에 업로드되지 않습니다. 에이전트가 쓰는 모델 제공자는 결과를 보게 됩니다([데이터 & 개인정보](#18-데이터-개인정보-및-보안) 참조).

**REA가 아닌 것:**
- "원래 소스 코드로 되돌리는" 마법의 버튼이 아닙니다. 결과는 어셈블리/의사코드와 참조이며, 에이전트가 설명하고 동작 재구축을 도와줍니다.
- 라이선스/DRM 크랙이나 유료 활성화 우회 도구가 아닙니다. 그런 용도로 쓰지 마세요.
- 난독화 우회 도구가 아닙니다. 강력하게 패킹/보호된 대상(VMProtect, Themida, 변조 방지)은 매우 어렵습니다.
- 서버 측 접근 수단이 아닙니다. API 뒤의 서버는 검사할 수 없고, 클라이언트/네트워크 측만 볼 수 있습니다.

---

## 2. 합법적이고 책임 있는 사용

상호운용성, 보안 연구, 디버깅, 그리고 사용자가 **소유**한 소프트웨어의 분석을 위한 리버스 엔지니어링은 합법일 수 있습니다 — 다만 법률과 라이선스는 관할 지역마다 다릅니다.

**해야 할 것:**
- 소유하고 있거나, 사용 라이선스가 있거나, 검사할 권한이 있는 소프트웨어를 분석하기.
- 라이선스 계약, 서비스 약관, DMCA 기술적 보호 조치 우회 금지 규정을 존중하기.
- 조사 결과를 상호운용성, 교육, 방어적 보안에 사용하기.

**해서는 안 되는 것:**
- DRM, 라이선스 활성화, 복제 방지를 우회하는 것.
- 상용 소프트웨어의 크랙/유출 코드를 배포하는 것.
- 소유하거나 검사할 권리가 없는 대상을 분석하는 것.

본 가이드는 법률 자문이 아닙니다. 확실하지 않으면 변호사와 상담하세요.

---

## 3. 분석 가능한 대상

| 대상 | REA가 반환하는 것 | 네이티브 엔진 필요? |
|---|---|---|
| 네이티브 바이너리 / 라이브러리(EXE, DLL, ELF, Mach-O) | 함수, 어셈블리, 의사코드, 호출자, 상호 참조, 상수 | 필요 — Hopper, Ghidra 또는 IDA |
| JavaScript & Electron 앱 | 모듈, 임포트, IPC 채널 + 핸들러, 소스 위치 | 불필요 |
| 브라우저 페이지(런타임) | 요청/응답, 스크립트, JSON 바디 구조, 관찰 창 | Chrome 계열 브라우저 |
| .NET 어셈블리 / Flutter / 패키지 | 모듈 및 리소스 검사 | 불필요 |
| Android APK / 기기 / 리소스 | 역컴파일된 클래스, 리소스, 기기 상호작용 | JADX / adb / Apktool |
| 펌웨어 | 추출된 파일시스템/블롭 | Binwalk / Unblob(Linux) |
| WASM | 모듈 및 함수 검사 | WABT |
| SQLite 데이터베이스 | 스키마 및 쿼리 검사 | Node.js 24.15+ / 26+ |
| EVM 바이트코드 | 컨트랙트 구조 | Node.js(Linux x64) |
| HAR / SAZ / mitmproxy 캡처 | 파싱된 트래픽 증거 | Node.js / mitmdump |
| PCAP / PCAPNG | 패킷/프로토콜 사실 | TShark / capinfos(Linux) |

---

## 4. 시스템 요구 사항

**최소:**
- Node.js **22.23.4+**, **24.22.1+**, 또는 **26+ (>= 26.12.1)** (npm 포함)
- 지원되는 코딩 에이전트(2단계 참조)
- 조사를 위한 작업 디렉터리

**네이티브(바이너리) 분석에는** 다음 중 하나:
- **Ghidra 12.1.x** + 64비트 **JDK 21+** (무료, Windows에서 권장)
- **IDA** (상용; 검증된 Windows 레거시 GUI + headless supervisor 프로필)
- **Hopper** (상용; macOS & 일부 Linux — **Windows에서는 사용 불가**)

**OS 참고:**
- Windows: **PowerShell** 사용; 공백이 있는 경로는 따옴표로 감싸세요. 에이전트를 WSL에서 실행한다면 WSL **안에** Node.js + REA를 설치하고 Linux 경로를 사용하세요.
- Linux: Ghidra/JADX/펌웨어 실행과 정적 분석을 위해 `procps` 호환 `ps`가 `PATH`에 있어야 합니다.
- macOS: Terminal 사용; 일부 단계는 Xcode Command Line Tools 필요(arm64에서 Ghidra 디컴파일러 빌드).

---

## 5. 1단계 — 컴퓨터 준비

### 5.1 Node.js 확인

```powershell
node -v
npm -v
```

예상: `v22.23.4+`, `v24.22.1+`, 또는 `v26.12.1+`. 더 오래된 경우 → Node.js 24 LTS 설치.

### 5.2 Windows에 Node.js 설치(없을 경우)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

약관 동의를 묻으면 `Y` 입력 후 PowerShell을 닫았다 다시 열고 `node -v`를 다시 확인하세요. (대안: https://nodejs.org/ 에서 Node.js LTS 설치 프로그램 다운로드.)

> **PowerShell 참고:** `npx`가 "running scripts is disabled on this system"로 실패하면 `npx.cmd`와 `npm.cmd`를 사용하세요:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3(macOS)

Node.js 24 LTS `.pkg`를 다운로드하거나, Homebrew라면: `brew install node`.

### 5.4(Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# 셸을 다시 연 다음:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 작업 폴더 만들기

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. 2단계 — 코딩 에이전트 선택

REA는 로컬 **MCP**를 사용하는 모든 에이전트를 지원합니다. 하나를 고르세요 — 아래 모든 예제는 클라이언트의 **setup ID**(`--client <id>`)를 사용합니다.

| 클라이언트 | Setup ID | 설치 / 참고 |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | 앱 설치·로그인 후 `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` 또는 설치 스크립트 · ChatGPT로 로그인 |
| Cursor | `cursor` | 에디터 설치, 작업 폴더 열기, Agent 모드 |
| Windsurf | `windsurf` | 동일 패턴; 에이전트 채팅 |
| VS Code | `vscode` | 먼저 GitHub Copilot을 설정한 다음 Agent 모드 |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` 실행, `/connect`로 모델 연결, 이후 `--client opencode` |
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

**Grok Bot:** 봇의 채팅에서, 호스팅된 자신의 컴퓨터에 `rea`라는 이름의 커스텀 MCP 서버를 추가하도록 요청하세요:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. 3단계 — REA 연결

### 옵션 A — 에이전트에게 맡기기(권장)

에이전트 채팅에 다음을 붙여넣으세요:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

에이전트가 setup을 실행하고 계획을 보여주며, 승인 후 적용합니다.

### 옵션 B — 직접 setup 실행

```powershell
npx rea-agents@latest setup
```

특정 클라이언트의 경우:

```powershell
npx rea-agents@latest setup --client opencode
```

Setup 중:
- **화살표 키**로 이동, **Space**로 클라이언트 선택, **Enter**로 계속.
- REA는 **MCP 연결** + **조사 스킬**을 추가하고, 기존 설정을 수정 전에 **백업**합니다.
- 변경 적용 전 사용자 승인이 필요합니다.
- 첫 연습에서는 선택 사항인 Hopper 설치를 건너뛰어도 됩니다.

### setup 후 클라이언트 재시작

- 데스크톱 앱(Claude Desktop, Cursor, Windsurf, VS Code): **완전히 종료** 후 다시 열기(Windows: 트레이 아이콘에서도 종료).
- 터미널 에이전트(Claude Code, Codex, Gemini CLI, OpenCode): 세션을 종료하고 다시 시작.

---

## 8. 4단계 — 설치 검증

클라이언트의 doctor 검사를 실행(`<client_id>` 교체):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

정상 보고서는 `"healthy": true`를 표시합니다. 그런 다음 에이전트에게 물어보세요:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. 5단계 — 첫 조사(Notes 예제)

공식 예제는 **Export notes** 버튼이 있는 작은 Electron 앱입니다. Electron 설치 불필요 — 에이전트가 코드를 읽습니다.

에이전트에 붙여넣기:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

예상 결과: Export를 클릭하면 `notes:export` IPC 메시지가 전송되고, 메인 프로세스가 노트를 CSV로 포맷하여 `notes.csv`(열: `id`, `title`)를 다운로드 폴더에 씁니다.

터미널에서 수동 분석:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. 네이티브 분석(바이너리 / EXE / DLL)

깊은 네이티브 분석에는 제공자가 필요합니다. **Windows**에서는 **Ghidra** 또는 **IDA**를 사용하세요(Hopper는 Windows에서 사용 불가).

### 10.1 Ghidra(무료) — Windows 설정

1. **64비트 JDK 21 이상**(컴파일러 포함)을 설치. 확인:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. 릴리스의 *Assets* 목록에서 **Ghidra 12.1.4**를 다운로드하고 `ghidra_…_PUBLIC_….zip`을 압축 해제("Source code"가 아닌 릴리스 아카이브 선택).
3. `ghidraRun.bat`을 포함하는 압축 해제 폴더를 메모 — 그것이 `GHIDRA_INSTALL_DIR`입니다.
4. PowerShell에서:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home이 알려주는 폴더
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   경로를 실제 설치 위치로 바꾸세요. setup의 업데이트된 계획을 검토하고 승인한 뒤 **에이전트를 재시작**하세요.

> Windows Ghidra 지원은 **실험적, 읽기 전용**이며 로컬의 고정 **NTFS** 드라이브에 있는 네이티브 x86/x64 PE 애플리케이션과 DLL만 대상입니다.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 및 Linux arm64에서는 먼저 Ghidra의 네이티브 디컴파일러를 빌드하세요(macOS는 Xcode Command Line Tools, make, bison 필요).

### 10.3 IDA

1. IDA provider 가이드에 따라 업스트림 IDA MCP 서버를 설치하고 설정합니다.
2. 작동하는 등록을 `ida-mcp.json`으로 저장. 예시(`idb_open`/`idb_list`/`idb_close`를 가진 headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   연결된 레거시 1.4.0 GUI 서버의 경우, 작동하는 command/args/env를 복사하세요(먼저 IDA에서 바이너리를 열고 플러그인을 시작).
3. 연결:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux에서는 `$env:` 대신 `export`를 사용. setup 후 에이전트를 재시작하세요.

> 검증된 IDA 프로필은 Windows 레거시 GUI와 headless supervisor, 그리고 macOS arm64 headless supervisor(IDA Professional 9.1)를 포함합니다. npm 6.4.0에는 macOS headless 프로필 / 네이티브 GUI 브리지가 포함되지 않습니다 — 그것은 REA 소스 빌드가 필요합니다.

### 10.4 Hopper(macOS / Linux 전용)

Setup은 기존 Hopper를 감지하거나 설치 계획을 제안할 수 있습니다. macOS에서는 첫 실행 시 데모 모드를 선택하거나 라이선스를 활성화하세요. Linux 자동 설정은 Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS, Omarchy의 x86_64 호스트가 필요합니다. Linux arm64에서는 Ghidra를 사용하세요.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 제공자 사용

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI로 일회성 함수 분석(Ghidra 설정 필요):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron 앱

네이티브 엔진이 필요 없습니다. 에이전트를 앱 **폴더** 또는 **.asar**로 지정하세요:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron 앱의 `app.asar` 위치:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: 보통 `/opt/<App>/resources/app.asar`

터미널에서 정적 분석:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

일치하는 채널/핸들러는 `normalized_result.summary.ipc`, 소스 위치는 `normalized_result.graph`를 확인하세요. 동적으로 계산되는 채널 이름은 미해결로 남을 수 있습니다 — 이 경우 다음 섹션의 브라우저 관찰을 사용하세요.

---

## 12. 브라우저 관찰

1. 대상 페이지를 Chrome 계열 브라우저로 원격 디버깅하여 엽니다. 예:

   **Windows(PowerShell):**
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

2. 에이전트에게 물어보세요:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   엔드포인트 `http://127.0.0.1:9222`와 페이지 URL을 알려주세요. **클릭 전**에 캡처를 시작하세요.

   또는 터미널에서:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP 바디의 경우 Fiddler Everywhere(SAZ/HAR 1.2) 내보내기를 REA capture Evidence로 전달하거나 Everywhere의 MCP 서버에 연결하세요.

---

## 13. 기타 대상과 필요한 도구

| 대상 | 준비할 도구 | 비고 |
|---|---|---|
| JavaScript / Electron | Node.js + npm | 엔진 불필요 |
| 웹사이트 | Chrome / Chromium / Edge | 원격 디버깅 포트 |
| .NET / Flutter / 패키지 | Node.js + npm | 정적 검사 |
| Android APK | JADX + JDK 17+ | `classes.dex` 디컴파일 |
| Android 기기 | adb | USB 디버깅 활성화 |
| Android 리소스 | Apktool + Java | 리소스 및 매니페스트 언팩 |
| JEB 프로젝트 | JEB + MCP | 상용 디컴파일러 |
| 펌웨어 | Binwalk / Unblob | **Linux 전용** |
| WASM | WABT(`wat2wasm`, `wasm2wat`) | |
| SQLite 데이터베이스 | Node.js 24.15+ / 26+ | |
| EVM 바이트코드 | Node.js | **Linux x64 전용** |
| ELF / Linux 크래시 | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | 오프라인 캡처 파싱 |
| PCAP / PCAPNG | TShark / capinfos | **Linux 전용** |
| 로직 신호 | sigrok-cli | **Linux 전용** |
| 프로세스 동작 | PTY | **Linux / macOS** |

Flutter, 패키지/리소스, EVM 및 전체 조사 가이드: https://rea.tools/guides 참조.

---

## 14. RL 환경 구축

REA는 테스트 웹 앱 세션을 기록하고 에이전트 학습/평가용 **AgentEnv** 환경을 내보낼 수 있습니다.

1. 에이전트가 데이터를 생성/편집/삭제할 수 있는 **테스트** 앱 인스턴스를 준비하세요.
2. 에이전트에게 물어보세요(폴더 예시):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   비밀번호는 MCP 서버 환경(`APP_PASSWORD`)에 보관하고 프롬프트에 쓰지 마세요.
3. 또는 HAR 기록에서 직접 빌드:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run`은 파일을 쓰지 않고 보고서만 검토합니다.
4. 실행:
   ```bash
   agent-env run ./my-env
   ```
   REA의 호환성 검사는 **AgentEnv 0.9.1334 + Python 3.12**를 사용합니다; Docker가 실행 중이어야 합니다.
5. **효과**가 기록된 작업만 지원됩니다(예: 삭제는 누락 항목 응답과 업데이트된 목록 기록이 필요). 공유 전에 유지된 응답 바디를 검토하세요 — 자격 증명이 남아 있을 수 있습니다.

---

## 15. 터미널에서 REA 사용(CLI)

글로벌 설치 없이:

```powershell
npx -y rea-agents@latest --help
```

`rea` 명령을 영구 설치:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux curl 설치 스크립트(Node.js 먼저 필요):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

자주 쓰는 명령:

| 명령 | 용도 |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | 모듈, 임포트, IPC, 경계 매핑 |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | 네이티브 함수 하나 분석 |
| `rea-agents list-browser-targets <endpoint> --json` | 디버그 가능한 브라우저 페이지 목록 |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | 페이지 네트워크/스크립트 관찰 |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL 환경 빌드 |
| `rea-agents environment-compare … --json` | 환경과 실제 앱 비교 |
| `rea-agents doctor --client <id> --json` | 클라이언트 연결 확인 |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | 네이티브 제공자 확인 |
| `rea-agents update` | CLI 업데이트 |
| `rea-agents uninstall` | REA 클라이언트 설정 + 스킬 제거 |

---

## 16. REA 업데이트 또는 제거

**업데이트:**
```powershell
rea update                       # 글로벌 CLI가 설치된 경우
npx rea-agents@latest setup      # 에이전트 연결 + 스킬 갱신; 계획 승인 후 재시작
```

**제거:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. 문제 해결

**에이전트가 REA 도구를 인식하지 못함**
1. 클라이언트를 완전히 재시작/재연결(트레이 아이콘 포함).
2. `npx -y rea-agents@latest doctor --client <id> --json` — 등록이 없거나 오래됨: `npx rea-agents@latest setup --client <id>` 실행 후 재시작.
3. 그래도 인식 안 됨: 클라이언트의 MCP 연결 오류를 확인; 에디터 클라이언트에서는 MCP 설정에서 REA를 활성화하고 도구를 허용하세요.

**`npx` — "running scripts is disabled"(Windows PowerShell)**
`npx.cmd` / `npm.cmd`를 사용하거나 `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` 실행.

**공백이 있는 경로**
따옴표로 감싸세요: `"D:/my apps/tool.exe"`. WSL에서는 Linux 경로를 쓰고 WSL 안에 REA를 설치하세요.

**Windows Ghidra 제한**
실험적, 읽기 전용, x86/x64 PE만, 고정 로컬 NTFS 드라이브. Linux 대안: Ghidra/Hopper. 네이티브 x64 Linux ELF 크래시 분석: pwntools.

**macOS가 자동화 권한을 요청(Hopper)**
시스템 설정 → 개인 정보 보호 및 보안 → 자동화 → REA를 시작하는 앱을 허용 후 다시 시도.

**Hopper 첫 실행**
무인 분석 전에 데모 모드 vs 라이선스 활성화 선택을 완료하세요.

**Linux에 `ps`가 없음**
`procps` 설치(Debian/Ubuntu: `sudo apt install procps`); REA는 프로세스 소유권 검사에 필요합니다.

**버그 발생?**
REA를 업데이트하고 재시작 후 재시도. 그런 다음 REA 버전, OS, 대상 유형, 재현 단계, 오류 출력, 제공자 이름을 포함해 이슈를 여세요. https://github.com/morluto/rea/issues 참조.

---

## 18. 데이터, 개인정보 및 보안

- REA는 **사용자 컴퓨터에서** 대상을 분석합니다; 사용자의 앱은 REA에 의해 업로드되지 **않습니다**.
- **에이전트의 모델 제공자**가 결과를 받습니다 — 해당 제공자의 데이터/보존 정책이 적용됩니다. 시크릿이나 고객 데이터를 프롬프트에 붙여넣지 마세요.
- MCP 입력 스키마는 기본적으로 압축형입니다; 전체 필드 안내가 필요하면 MCP 등록에 `REA_MCP_INPUT_SCHEMA_PROFILE=full`을 설정하세요. `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact`(또는 `off`)로 출력 스키마를 제한할 수 있습니다.
- RL 환경 기록은 바디/헤더에 자격 증명을 유지할 수 있습니다 — 공유 전 검토하세요. credential-name 경고는 검토할 위치를 표시하지만 값을 **제거하지는 않습니다**.
- `APP_PASSWORD` 같은 시크릿은 MCP 서버 환경에 두고 채팅에 쓰지 마세요.
- REA는 `morluto/rea`, `rea.tools`, npm `rea-agents`에서만 설치하세요.

---

## 19. 빠른 참조 체크리스트

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] 코딩 에이전트 설치됨(OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (계획 검토 및 승인)
[ ] 클라이언트 완전 재시작
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] 첫 조사: notes-example.zip  →  notes:export / notes.csv 찾기
[ ] (선택) 네이티브: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup 재실행 → 에이전트 재시작
[ ] (선택) 브라우저: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] 법적 확인: 대상을 소유 / 분석 허가 있음
```

---

## 20. 오프라인 백업 / 미러(비공식)

> ⚠️ **먼저 읽어보세요.**
> 공식 프로젝트에 "공식 백업" 같은 것은 존재하지 않습니다. 유일한 공식 REA는 **morluto/rea**(https://github.com/morluto/rea), **rea.tools**, 그리고 **`rea-agents` npm 패키지**입니다.
> 이 저장소가 제공하는 것은 공식 프로젝트의 완전하고 라이선스에 맞는 **비공식 미러 / 아카이브**이며, 원래의 MIT 라이선스와 저작권 표기를 보존합니다. 그 존재 이유는 **공식 저장소, 웹사이트 또는 npm 패키지가 사라질 경우** 여기서 REA를 얻을 수 있도록 하기 위함입니다 — 그게 전부입니다.
> 공식 소스가 존재한다면, **그것들을 사용하세요**. 이 백업을 "공식"으로 표시하거나 "공식 REA"로 재배포하지 마세요. 이 저장소는 REA 저자와 제휴/보증 관계에 있지 않습니다.

**라이선스:** REA는 MIT 라이선스로, 고지 보존 시 복제, 수정, 재배포가 허용됩니다. 전체 라이선스, 저작권 헤더, 서드파티 고지는 미러 브랜치와 npm tarball에 모두 보존되어 있습니다. 어떤 보증도 제공되지 않습니다.

### 백업에 포함된 것

| 백업 항목 | 위치 | 설명 |
|---|---|---|
| 소스 미러 | 브랜치 **`mirror/rea`** | 공식 `morluto/rea` `main`의 완전한 git 이력(마지막 동기화 시점 — v6.9.0, 커밋 `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| 릴리스 태그 | 태그 **`rea-agents-*.*.*`** | 모든 공식 릴리스 태그, 정확한 공식 커밋을 가리킴(v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | 공식 npm 패키지, 사전 빌드(`dist/` 포함) — 완전 **오프라인** 설치 |
| 동기화 스크립트 | **`scripts/sync-backup.ps1`** | 공식 소스에서 미러 브랜치, 태그, 최신 npm tarball을 갱신 |
| 복원 스크립트 | **`scripts/restore-backup.ps1`** | tarball을 원샷 오프라인 설치하고 다음 단계 출력 |
| 가이드 | `README.md`(영어 마스터) | 전체 설정 가이드라인; REA를 어디서 얻든 유효 |

### 백업을 최신으로 유지

매주(또는 의존하기 전에) 실행:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

이 스크립트는 `upstream/main` + 모든 태그를 fetch하고, `mirror/rea`를 강제 업데이트하고, 태그를 푸시하고, 최신 `rea-agents-*.*.*` 릴리스를 `backup/`에 `npm pack`한 뒤 tarball의 최종 `git add`/`commit`/`push` 명령을 출력합니다.

### 복원 시나리오

**시나리오 A — GitHub 다운, npm 작동:** 복원 불필요. `npx rea-agents@latest setup`을 계속 사용하세요.

**시나리오 B — GitHub + npm 모두 다운:** 이 저장소에서 사전 빌드된 tarball을 설치(네트워크 불필요, 빌드 도구 불필요):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# 또는 수동으로:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup`은 공식 `npx rea-agents setup`과 동일하게 MCP 서버 + 스킬을 에이전트에 등록합니다 — 완전히 오프라인이며 레지스트리를 건드리지 않습니다.

**시나리오 C — 전체 소스/이력도 필요한 경우:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# 마지막 동기화 시점의 완전한 공식 소스.
```

소스 빌드에는 Node.js 22.23.4+ / 24.22.1+ / 26.12.1+과 npm 레지스트리 네트워크 접근이 필요합니다(turbo monorepo; `npm ci && npm run build`). tarball 방식(시나리오 B)은 둘 다 필요 없습니다 — 복원 시 항상 이것을 우선하세요.

### 복원한 것 검증
```powershell
# 소스 미러 무결성 — 커밋은 마지막 동기화 시점의 upstream/main과 일치해야 함:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # 미러 브랜치 클론 후
# Tarball 무결성 — CLI 자체가 보고하는 버전:
rea --version
```

해시가 백업 당시 기록과 다르면, 그 복사본을 의심스러운 것으로 취급하고, 신뢰를 회복하기 전에 공식 소스에서 다시 동기화하세요(복구되었다면).

### 이 백업이 보장하지 않는 것

- 마지막 동기화 이후의 보안 패치 없음 — 방치된 백업은 오래된 스냅샷입니다.
- 공식 npm 패키지는 `mirror/rea`나 tarball보다 새로운 핫픽스를 포함할 수 있습니다.
- 부속 서비스(rea.tools 웹사이트, Discord, 릴리스 노트, 문서 사이트)는 참고 자료이지, 여기서 복원할 수 있는 코드가 아닙니다.
- REA가 이후 다른 이름/소유자로 재출시되면, 이 스냅샷은 아카이브된 업스트림으로 계속 작동합니다 — 호환성을 가정하지 말고 의도적으로 마이그레이션하세요.

---

**링크**
- 웹사이트: https://rea.tools/ · 시작하기: https://rea.tools/get-started/ · 가이드: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · 쇼케이스: https://rea.tools/showcases/
- 소스: https://github.com/morluto/rea (MIT) · 이슈: https://github.com/morluto/rea/issues
- 커뮤니티: Discord(rea.tools 푸터 참조) · X: https://x.com/reatools
- **이 저장소의 백업:** 브랜치 `mirror/rea` · 태그 `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
