<p align="center">
  <img src="../assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Reverse Engineering Agent — 完全セットアップガイド

> **言語：** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (main / authoritative) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [اردو](README.ur.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ この翻訳は英語マスターと一致しています。矛盾がある場合は**英語が優先されます**。コードブロック、パス、コマンドは翻訳されません。

> **REA — Reverse Engineer Anything**
> MCP（Model Context Protocol）サーバー + 調査スキルで、コーディングエージェントにソフトウェアを検査するツールを提供します：ネイティブバイナリ、JavaScript/Electron アプリ、ブラウザー、.NET、Android、ファームウェアなど。

- **公式ウェブサイト：** https://rea.tools/
- **公式ソースコード：** https://github.com/morluto/rea
- **npm パッケージ：** `rea-agents`
- **ライセンス：** MIT（REA 本体）。サードパーティ解析ツールには各自のライセンスがあります。
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)**（英語）— プラットフォーム別ステップバイステップセットアップ（Windows 優先：Electron、Web、.NET、Android、WASM、Native/Ghidra、WSL2）、トラブルシューティング付き
- **🆓 [FREE-AGENTS.md](../FREE-AGENTS.md)** — REA と組み合わせられる完全無料の coding agent（無料モデル付き OpenCode、ローカル Ollama、Gemini CLI、Qwen Code）。REA 自体は MCP サーバーであり、AI モデルではありません。
- **📦 オフラインバックアップ同梱** — 公式リポジトリの非公式ミラー + npm tarball。公式ソースが消滅した場合のみ使用。**[セクション 20 — オフラインバックアップ / ミラー（非公式）](#20-オフラインバックアップ--ミラー非公式)** を参照。

> ⚠️ **重要：** REA は `morluto/rea`、`rea.tools`、または `rea-agents` npm パッケージからのみダウンロードしてください。類似のリポジトリ名は公式リリースを意味しません。

---

## 目次

1. REA とは（何ではないか）
2. 合法かつ責任ある使用
3. 解析できるもの
4. システム要件
5. ステップ 1 — コンピューターの準備
6. ステップ 2 — コーディングエージェントの選択
7. ステップ 3 — REA の接続
8. ステップ 4 — インストールの検証
9. ステップ 5 — 初回調査（Notes サンプル）
10. ネイティブ解析（バイナリ / EXE / DLL）
11. JavaScript & Electron アプリ
12. ブラウザー観察
13. その他の対象と必要なツール
14. RL 環境の構築
15. ターミナルから REA を使用（CLI）
16. REA の更新または削除
17. トラブルシューティング
18. データ、プライバシー、セキュリティ
19. クイックリファレンスチェックリスト
20. オフラインバックアップ / ミラー（非公式）

---

## 1. REA とは（何ではないか）

**REA は：**
- ローカル MCP サーバー + エージェントスキル。お使いの**コーディングエージェント**がローカルにあるソフトウェアを検査できます。
- **証拠**を返します：アセンブリ、疑似コード、モジュールマップ、IPC チャネルの対応、キャプチャされたネットワークトラフィック、ソース位置 — 元のソースコードではありません。
- 解析は**あなたのマシン上**で実行されます。アプリが REA によってアップロードされることはありません。エージェントが使うモデルプロバイダーは結果を見ます（[データとプライバシー](#18-データプライバシーセキュリティ)を参照）。

**REA は次ではありません：**
- 「元のソースコードに戻す」魔法のボタンではありません。結果はアセンブリ/疑似コードと参照であり、エージェントが説明し、挙動の再構築を支援します。
- ライセンス/DRM のクラックや有料アクティベーションの回避に使うツールではありません。それには使用しないでください。
- 難読化を回避するものではありません。強力にパック/保護された対象（VMProtect、Themida、改ざん防止）は極めて困難です。
- サーバーサイドへのアクセスではありません。API の背後にあるサーバーは検査できず、クライアント/ネットワーク側のみが見えます。

---

## 2. 合法かつ責任ある使用

相互運用性、セキュリティ研究、デバッグ、そして自分が**所有**するソフトウェアの解析のためのリバースエンジニアリングは適法となる場合があります — ただし法とライセンスは国・地域によって異なります。

**すべきこと：**
- 所有している、使用許諾を得ている、または検査を許可されているソフトウェアを解析する。
- ライセンス契約、利用規約、DMCA の技術的保護手段回避禁止規定を尊重する。
- 調査結果を相互運用性、教育、防御的セキュリティに使用する。

**すべきではないこと：**
- DRM、ライセンスアクティベーション、コピー保護を回避すること。
- 独自ソフトウェアのクラック/流出コードを配布すること。
- 所有・検査する権利のない対象を解析すること。

本ガイドは法的助言ではありません。不明な場合は弁護士に相談してください。

---

## 3. 解析できるもの

| 対象 | REA が返すもの | ネイティブエンジンが必要？ |
|---|---|---|
| ネイティブバイナリ / ライブラリ（EXE、DLL、ELF、Mach-O） | 関数、アセンブリ、疑似コード、呼び出し元、相互参照、定数 | 必要 — Hopper、Ghidra、または IDA |
| JavaScript & Electron アプリ | モジュール、インポート、IPC チャネル + ハンドラー、ソース位置 | 不要 |
| ブラウザーページ（ランタイム） | リクエスト/レスポンス、スクリプト、JSON ボディの形状、観察ウィンドウ | Chrome 系ブラウザー |
| .NET アセンブリ / Flutter / パッケージ | モジュールとリソースの検査 | 不要 |
| Android APK / デバイス / リソース | 逆コンパイルされたクラス、リソース、デバイス操作 | JADX / adb / Apktool |
| ファームウェア | 抽出されたファイルシステム/ブロブ | Binwalk / Unblob（Linux） |
| WASM | モジュールと関数の検査 | WABT |
| SQLite データベース | スキーマとクエリの検査 | Node.js 24.15+ / 26+ |
| EVM バイトコード | コントラクト構造 | Node.js（Linux x64） |
| HAR / SAZ / mitmproxy キャプチャ | 解析済みトラフィックの証拠 | Node.js / mitmdump |
| PCAP / PCAPNG | パケット/プロトコルの事実 | TShark / capinfos（Linux） |

---

## 4. システム要件

**最低要件：**
- Node.js **22.23.4+**、**24.22.1+**、または **26+（>= 26.12.1）**（npm 同梱）
- サポートされているコーディングエージェント（ステップ 2 を参照）
- 調査用の作業ディレクトリ

**ネイティブ（バイナリ）解析には**以下のいずれか：
- **Ghidra 12.1.x** + 64 ビット **JDK 21+**（無料、Windows 推奨）
- **IDA**（商用；Windows 旧 GUI と headless supervisor プロファイルを検証済み）
- **Hopper**（商用；macOS と一部 Linux — **Windows では利用不可**）

**OS に関する注意：**
- Windows：**PowerShell** を使用；空白を含むパスはクォートで囲む。エージェントを WSL で実行する場合は、WSL **内** に Node.js + REA をインストールし Linux パスを使用してください。
- Linux：Ghidra/JADX/ファームウェアの起動と静的解析には、`procps` 互換の `ps` が `PATH` に必要です。
- macOS：Terminal を使用；一部の手順では Xcode Command Line Tools が必要です（arm64 での Ghidra デコンパイラービルド）。

---

## 5. ステップ 1 — コンピューターの準備

### 5.1 Node.js を確認

```powershell
node -v
npm -v
```

期待値：`v22.23.4+`、`v24.22.1+`、または `v26.12.1+`。それ以前 → Node.js 24 LTS をインストール。

### 5.2 Windows に Node.js をインストール（未インストールの場合）

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

規約に同意を求められたら `Y` と入力し、PowerShell を閉じて開き直してから `node -v` を再確認してください。（代替：https://nodejs.org/ から Node.js LTS インストーラーをダウンロード。）

> **PowerShell の注意点：** `npx` が "running scripts is disabled on this system" と失敗する場合は、`npx.cmd` と `npm.cmd` を使用してください：
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3（macOS）

Node.js 24 LTS の `.pkg` をダウンロードするか、Homebrew の場合：`brew install node`。

### 5.4（Linux）

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# シェルを開き直してから：
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 作業フォルダーを作成

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. ステップ 2 — コーディングエージェントの選択

REA はローカル **MCP** を話す任意のエージェントをサポートします。1 つ選んでください — 以下のすべての例はクライアントの **setup ID**（`--client <id>`）を使用します。

| クライアント | Setup ID | インストール / メモ |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex`（Win）· `curl -fsSL https://claude.ai/install.sh \| bash`（macOS/Linux） |
| Claude Desktop | `claude_desktop` | アプリをインストールしサインイン、次に `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` またはインストールスクリプト · ChatGPT でサインイン |
| Cursor | `cursor` | エディターをインストールし、作業フォルダーを開き、Agent モード |
| Windsurf | `windsurf` | 同様；エージェントチャット |
| VS Code | `vscode` | まず GitHub Copilot をセットアップ、次に Agent モード |
| OpenCode | `opencode` | `npm install --global opencode-ai`、`opencode` を実行、`/connect` でモデル接続、その後 `--client opencode` |
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

**Grok Bot：** ボットのチャットで、ホストされた自分のコンピューターに `rea` という名前のカスタム MCP サーバーを追加するよう依頼してください：
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. ステップ 3 — REA の接続

### オプション A — エージェントに依頼（推奨）

これをエージェントのチャットに貼り付けてください：

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

エージェントが setup を実行し、計画を表示し、承認後に適用します。

### オプション B — 自分で setup を実行

```powershell
npx rea-agents@latest setup
```

特定のクライアントの場合：

```powershell
npx rea-agents@latest setup --client opencode
```

Setup 中：
- **矢印キー**で移動、**スペース**でクライアント選択、**Enter** で続行。
- REA は **MCP 接続** + **調査スキル** を追加し、既存設定を変更前に**バックアップ**します。
- 変更が適用される前にあなたの承認が必要です。
- 初回演習ではオプションの Hopper インストールはスキップできます。

### setup 後はクライアントを再起動

- デスクトップアプリ（Claude Desktop、Cursor、Windsurf、VS Code）：**完全に終了**して再開（Windows：トレイアイコンからも終了）。
- ターミナルエージェント（Claude Code、Codex、Gemini CLI、OpenCode）：セッションを終了して再起動。

---

## 8. ステップ 4 — インストールの検証

クライアントの doctor チェックを実行（`<client_id>` を置き換え）：

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

健全なレポートは `"healthy": true` を示します。次にエージェントに尋ねてください：

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. ステップ 5 — 初回調査（Notes サンプル）

公式サンプルは **Export notes** ボタン付きの小さな Electron アプリです。Electron のインストールは不要 — エージェントがコードを読みます。

エージェントに貼り付け：

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

期待される結果：Export をクリックすると `notes:export` IPC メッセージが送信され、メインプロセスがノートを CSV に整形して `notes.csv`（列：`id`、`title`）をダウンロードフォルダーに書き込みます。

ターミナルからの手動解析：

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. ネイティブ解析（バイナリ / EXE / DLL）

深いネイティブ解析にはプロバイダーが必要です。**Windows** では **Ghidra** または **IDA** を使用してください（Hopper は Windows では利用不可）。

### 10.1 Ghidra（無料）— Windows セットアップ

1. **64 ビット JDK 21 以降**（コンパイラー含む）をインストール。確認：
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. リリースの *Assets* リストから **Ghidra 12.1.4** をダウンロードし、`ghidra_…_PUBLIC_….zip` を展開（"Source code" ではなくリリースアーカイブを選択）。
3. `ghidraRun.bat` を含む展開フォルダー — それが `GHIDRA_INSTALL_DIR` です。
4. PowerShell で：
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home が示すフォルダー
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   パスを実際のインストールに置き換えてください。setup の更新プランを確認し承認し、**エージェントを再起動**します。

> Windows Ghidra サポートは**実験的、読み取り専用**で、ローカルの固定 **NTFS** ドライブ上のネイティブ x86/x64 PE アプリケーションと DLL のみ対象です。

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 と Linux arm64 では、先に Ghidra のネイティブデコンパイラーをビルドしてください（macOS は Xcode Command Line Tools、make、bison が必要）。

### 10.3 IDA

1. IDA provider ガイドに従って上流の IDA MCP サーバーをインストール・設定します。
2. 動作する登録を `ida-mcp.json` として保存。例（`idb_open`/`idb_list`/`idb_close` を持つ headless supervisor）：
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   接続済みの旧 1.4.0 GUI サーバーの場合は、動作する command/args/env をコピー（まず IDA でバイナリを開きプラグインを起動）。
3. 接続：
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux では `$env:` の代わりに `export` を使用。setup 後はエージェントを再起動してください。

> 検証済みの IDA プロファイルは、Windows 旧 GUI と headless supervisor、および macOS arm64 headless supervisor（IDA Professional 9.1）を含みます。npm 6.4.0 には macOS headless プロファイル / ネイティブ GUI ブリッジは含まれません — それらには REA ソースビルドが必要です。

### 10.4 Hopper（macOS / Linux のみ）

Setup は既存の Hopper を検出するか、インストール計画を提案できます。macOS では初回起動時にデモモードを選ぶかライセンスをアクティベートしてください。Linux 自動セットアップには、Ubuntu 24.04+、Fedora 41+、Nobara 44+、Arch、CachyOS、Omarchy の x86_64 ホストが必要です。Linux arm64 では Ghidra を使用してください。

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 プロバイダーの使用

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

CLI での単発関数解析（Ghidra の設定が必要）：

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron アプリ

ネイティブエンジンは不要です。エージェントをアプリの**フォルダー**または **.asar** に向けてください：

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron アプリの `app.asar` の場所：
- Windows：`C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS：`/Applications/<App>.app/Contents/Resources/app.asar`
- Linux：多くの場合 `/opt/<App>/resources/app.asar`

ターミナルからの静的解析：

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

一致したチャネル/ハンドラーは `normalized_result.summary.ipc`、ソース位置は `normalized_result.graph` を確認してください。動的に計算されるチャネル名は未解決のままになることがあります — その場合は次のセクションのブラウザー観察を使用してください。

---

## 12. ブラウザー観察

1. 対象ページを Chrome 系ブラウザーでリモートデバッグ付きで開きます。例：

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

2. エージェントに尋ねます：
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   エンドポイント `http://127.0.0.1:9222` とページ URL を伝えます。クリック**前**にキャプチャを開始してください。

   またはターミナルから：
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP ボディには、Fiddler Everywhere（SAZ/HAR 1.2）のエクスポートを REA capture Evidence として与えるか、Everywhere の MCP サーバーに接続してください。

---

## 13. その他の対象と必要なツール

| 対象 | 準備するツール | メモ |
|---|---|---|
| JavaScript / Electron | Node.js + npm | エンジン不要 |
| Web サイト | Chrome / Chromium / Edge | リモートデバッグポート |
| .NET / Flutter / パッケージ | Node.js + npm | 静的検査 |
| Android APK | JADX + JDK 17+ | `classes.dex` の逆コンパイル |
| Android デバイス | adb | USB デバッグを有効化 |
| Android リソース | Apktool + Java | リソースとマニフェストを展開 |
| JEB プロジェクト | JEB + MCP | 商用デコンパイラー |
| ファームウェア | Binwalk / Unblob | **Linux のみ** |
| WASM | WABT（`wat2wasm`、`wasm2wat`） | |
| SQLite データベース | Node.js 24.15+ / 26+ | |
| EVM バイトコード | Node.js | **Linux x64 のみ** |
| ELF / Linux クラッシュ | pwntools、GDB、pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | オフラインキャプチャ解析 |
| PCAP / PCAPNG | TShark / capinfos | **Linux のみ** |
| ロジック信号 | sigrok-cli | **Linux のみ** |
| プロセス挙動 | PTY | **Linux / macOS** |

Flutter、パッケージ/リソース、EVM、完全な調査ガイド：https://rea.tools/guides. を参照。

---

## 14. RL 環境の構築

REA はテスト Web アプリのセッションを記録し、エージェントの訓練/評価用 **AgentEnv** 環境をエクスポートできます。

1. エージェントがデータを作成/編集/削除できる**テスト**アプリのインスタンスを用意します。
2. エージェントに尋ねます（フォルダーの例）：
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   パスワードは MCP サーバーの環境（`APP_PASSWORD`）に保持し、プロンプトには書かないでください。
3. または HAR 記録から直接ビルド：
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` はファイルを書かずにレポートのみ確認します。
4. 実行：
   ```bash
   agent-env run ./my-env
   ```
   REA の互換性チェックは **AgentEnv 0.9.1334 + Python 3.12** を使用します。Docker が実行されている必要があります。
5. **効果**が記録された操作のみサポートされます（例：削除には存在しないアイテムのレスポンスと更新後リストの記録が必要）。共有前に保持されたレスポンスボディを確認してください — 認証情報が残る場合があります。

---

## 15. ターミナルから REA を使用（CLI）

グローバルインストールなしで：

```powershell
npx -y rea-agents@latest --help
```

`rea` コマンドを永続的にインストール：

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux の curl インストーラー（先に Node.js が必要）：

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

よく使うコマンド：

| コマンド | 用途 |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | モジュール、インポート、IPC、境界のマッピング |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | ネイティブ関数を 1 つ解析 |
| `rea-agents list-browser-targets <endpoint> --json` | デバッグ可能なブラウザーページを一覧 |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | ページのネットワーク/スクリプトを観察 |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL 環境をビルド |
| `rea-agents environment-compare … --json` | 環境と実アプリを比較 |
| `rea-agents doctor --client <id> --json` | クライアント接続を確認 |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | ネイティブプロバイダーを確認 |
| `rea-agents update` | CLI を更新 |
| `rea-agents uninstall` | REA クライアント設定 + スキルを削除 |

---

## 16. REA の更新または削除

**更新：**
```powershell
rea update                       # グローバル CLI がインストールされている場合
npx rea-agents@latest setup      # エージェント接続 + スキルを更新；プランを承認、再起動
```

**削除：**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. トラブルシューティング

**エージェントが REA ツールを認識しない**
1. クライアントを完全に再起動/再接続します（トレイアイコン含む）。
2. `npx -y rea-agents@latest doctor --client <id> --json` — 登録が欠落/古い場合：`npx rea-agents@latest setup --client <id>` を実行し再起動。
3. それでも認識しない場合：クライアントの MCP 接続エラーを確認；エディタークライアントでは、MCP 設定で REA を有効化し、ツールを許可してください。

**`npx` — 「このシステムではスクリプトの実行が無効です」（Windows PowerShell）**
`npx.cmd` / `npm.cmd` を使用するか、`Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` を実行。

**空白を含むパス**
クォートで囲んでください：`"D:/my apps/tool.exe"`。WSL では Linux パスを使い、WSL 内に REA をインストールしてください。

**Windows Ghidra の制限**
実験的、読み取り専用、x86/x64 PE のみ、固定ローカル NTFS ドライブ。Linux の代替：Ghidra/Hopper。ネイティブ x64 Linux ELF クラッシュ解析：pwntools。

**macOS が自動化許可を求める（Hopper）**
システム設定 → プライバシーとセキュリティ → 自動化 → REA を起動するアプリを許可して再試行。

**Hopper の初回起動**
無人解析の前に、デモモード vs ライセンスアクティベーションの選択を完了してください。

**Linux に `ps` がない**
`procps` をインストール（Debian/Ubuntu：`sudo apt install procps`）；REA はプロセス所有権チェックに必要です。

**バグが発生した？**
REA を更新し、再起動して再試行。その後、REA バージョン、OS、対象タイプ、再現手順、エラー出力、プロバイダー名を添えて issue を開いてください。https://github.com/morluto/rea/issues. を参照。

---

## 18. データ、プライバシー、セキュリティ

- REA は**あなたのマシン上**で対象を解析します。アプリが REA によってアップロードされることは**ありません**。
- **エージェントのモデルプロバイダー**が結果を受け取ります — そのデータ/保持ポリシーが適用されます。シークレットや顧客データをプロンプトに貼らないでください。
- MCP の入力スキーマはデフォルトでコンパクトです；完全なフィールドガイダンスが必要な場合は MCP 登録で `REA_MCP_INPUT_SCHEMA_PROFILE=full` を設定。`REA_MCP_OUTPUT_SCHEMA_PROFILE=compact`（または `off`）で出力スキーマを制限できます。
- RL 環境の記録にはボディ/ヘッダーに認証情報が残る場合があります — 共有前に確認してください。Credential-name 警告は確認すべき箇所を示しますが、値を**削除はしません**。
- `APP_PASSWORD` のようなシークレットは MCP サーバーの環境に置き、チャットには書かないでください。
- REA は `morluto/rea`、`rea.tools`、npm `rea-agents` からのみインストールしてください。

---

## 19. クイックリファレンスチェックリスト

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] コーディングエージェントがインストール済み（OpenCode / Claude Code / Codex / Cursor / ...）
[ ] npx rea-agents@latest setup --client <id>   （プランを確認・承認）
[ ] クライアントを完全に再起動
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] 初回調査：notes-example.zip  →  notes:export / notes.csv を特定
[ ]（任意）ネイティブ：JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup を再実行 → エージェント再起動
[ ]（任意）ブラウザー：Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] 法的確認：対象を所有 / 解析許可あり
```

---

## 20. オフラインバックアップ / ミラー（非公式）

> ⚠️ **まずお読みください。**
> 公式プロジェクトに「公式バックアップ」というものは存在しません。唯一の公式 REA は **morluto/rea**（https://github.com/morluto/rea）、**rea.tools**、そして **`rea-agents` npm パッケージ** です。
> このリポジトリが提供するのは、公式プロジェクトの完全でライセンス準拠の**非公式ミラー / アーカイブ**であり、元の MIT ライセンスと著作権表示を保持しています。これが存在する理由は、**公式リポジトリ・ウェブサイト・npm パッケージが消滅した場合**、ここから REA を入手できるようにするためです — それだけです。
> 公式ソースが存在する限り、**それを使用してください**。このバックアップを「公式」と表示したり、「公式 REA」として再配布したりしないでください。本リポジトリは REA 作者と提携・推奨関係にはありません。

**ライセンス：** REA は MIT ライセンスで、通知を保持すれば複製・改変・再配布が許可されます。完全なライセンス、著作権ヘッダー、サードパーティ表示は、ミラーブランチと npm tarball の両方に保持されています。いかなる保証も提供されません。

### バックアップに含まれるもの

| バックアップ部分 | 場所 | 内容 |
|---|---|---|
| ソースミラー | ブランチ **`mirror/rea`** | 公式 `morluto/rea` `main` の完全な git 履歴（最終同期時点 — v6.9.0、コミット `cdc4541ef707f256f83abe5018df01a25182cf0b`）|
| リリースタグ | タグ **`rea-agents-*.*.*`** | すべての公式リリースタグ（正確な公式コミットを指す）（v2.7.0 → v6.9.0）|
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | 公式 npm パッケージ、プリビルド（`dist/` 同梱）— 完全**オフライン**インストール |
| 同期スクリプト | **`scripts/sync-backup.ps1`** | 公式ソースからミラーブランチ、タグ、最新 npm tarball を更新 |
| 復元スクリプト | **`scripts/restore-backup.ps1`** | tarball をワンショットでオフラインインストールし、次の手順を表示 |
| ガイド | `README.md`（英語マスター）| 完全セットアップガイドライン；REA の入手元に関わらず有効 |

### バックアップを最新に保つ

毎週（または使用前に）実行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

`upstream/main` + 全タグを fetch し、`mirror/rea` を強制更新し、タグをプッシュし、最新の `rea-agents-*.*.*` リリースを `npm pack` して `backup/` に配置し、tarball の最終的な `git add`/`commit`/`push` コマンドを表示します。

### 復元シナリオ

**シナリオ A — GitHub がダウン、npm は生きている：** 復元不要。`npx rea-agents@latest setup` を引き続き使用。

**シナリオ B — GitHub + npm 両方ダウン：** このリポジトリからプリビルド tarball をインストール（ネットワーク不要、ビルドツール不要）：
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# または手動で：
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` は公式 `npx rea-agents setup` と同様に MCP サーバー + スキルをエージェントに登録します — 完全オフライン、レジストリに触れません。

**シナリオ C — 完全なソース/履歴も必要な場合：**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# 最終同期時点の完全な公式ソース。
```

ソースビルドには Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ と npm レジストリへのネットワークアクセスが必要です（turbo monorepo；`npm ci && npm run build`）。tarball 方式（シナリオ B）はどちらも不要 — 復元時は常にこれを優先してください。

### 復元したものの検証
```powershell
# ソースミラーの整合性 — コミットは最終同期時の upstream/main と一致するはず：
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # ミラーブランチのクローン後
# Tarball の整合性 — CLI 自身が報告するバージョン：
rea --version
```

ハッシュがバックアップ時の記録とずれている場合、そのコピーを信頼できないものとして扱い、信頼を回復する前に公式ソースから再同期してください（復活していれば）。

### このバックアップが保証しないこと

- 最終同期以降のセキュリティパッチなし — 放置されたバックアップは古いスナップショットです。
- 公式 npm パッケージは `mirror/rea` や tarball より新しいホットフィックスを含む場合があります。
- 付属サービス（rea.tools ウェブサイト、Discord、リリースノート、ドキュメントサイト）は参考資料であり、ここから復元できるコードではありません。
- REA が後に別名/別所有者で再リリースされた場合、このスナップショットはアーカイブ済み上流として引き続き機能します — 互換性を仮定せず、意図的に移行してください。

---

**リンク**
- ウェブサイト：https://rea.tools/ · はじめる：https://rea.tools/get-started/ · ガイド：https://rea.tools/guides/
- FAQ：https://rea.tools/faq/ · ショーケース：https://rea.tools/showcases/
- ソース：https://github.com/morluto/rea（MIT）· Issue：https://github.com/morluto/rea/issues
- コミュニティ：Discord（rea.tools のフッター参照）· X: https://x.com/reatools
- **このリポジトリのバックアップ：** ブランチ `mirror/rea` · タグ `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
