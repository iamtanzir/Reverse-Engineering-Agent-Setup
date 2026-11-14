# Reverse Engineering Agent — Panduan Penyiapan Lengkap

> **Bahasa:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (utama / otoritatif) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Terjemahan ini selaras dengan aslinya dalam bahasa Inggris. Jika ada perbedaan, **bahasa Inggris yang menang**. Blok kode, path, dan perintah tidak pernah diterjemahkan.

> **REA — Reverse Engineer Anything**
> Server MCP (Model Context Protocol) + kemampuan investigasi: memberi agen coding Anda alat untuk memeriksa perangkat lunak — binary native, aplikasi JavaScript/Electron, browser, .NET, Android, firmware, dan lainnya.

- **Situs web resmi:** https://rea.tools/
- **Kode sumber resmi:** https://github.com/morluto/rea
- **Paket npm:** `rea-agents`
- **Lisensi:** MIT (REA sendiri). Alat analisis pihak ketiga punya lisensi masing-masing.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (Inggris) — penyiapan langkah demi langkah per platform (utamakan Windows: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) beserta pemecahan masalah
- **📦 Termasuk backup offline** — mirror tidak resmi dari repo resmi + tarball npm; hanya jika sumber resmi hilang. Lihat **[Bagian 20 — Backup / Mirror offline (tidak resmi)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Penting:** Unduh REA hanya dari `morluto/rea`, `rea.tools`, atau paket npm `rea-agents`. Nama repo yang mirip bukan bukti rilis resmi.

---

## Daftar isi

1. Apa itu REA (dan apa yang bukan)
2. Penggunaan legal dan bertanggung jawab
3. Apa yang bisa Anda analisis
4. Persyaratan sistem
5. Langkah 1 — Siapkan komputer Anda
6. Langkah 2 — Pilih agen coding
7. Langkah 3 — Hubungkan REA
8. Langkah 4 — Verifikasi instalasi
9. Langkah 5 — Investigasi pertama Anda (contoh Notes)
10. Analisis native (binary / EXE / DLL)
11. Aplikasi JavaScript & Electron
12. Observasi browser
13. Target lain & alat yang dibutuhkan
14. Bangun lingkungan RL
15. Gunakan REA dari terminal (CLI)
16. Memperbarui atau menghapus REA
17. Pemecahan masalah
18. Data, privasi & keamanan
19. Checklist referensi cepat
20. Backup / Mirror offline (tidak resmi)

---

## 1. Apa itu REA (dan apa yang bukan)

**REA adalah:**
- Server MCP lokal + kemampuan agen — memungkinkan **agen coding Anda** memeriksa perangkat lunak yang ada di mesin Anda.
- Mengembalikan **bukti**: assembly, pseudocode, peta modul, pasangan channel IPC, lalu lintas jaringan yang ditangkap, lokasi sumber — bukan kode sumber asli.
- Analisis berjalan **di mesin Anda**. Aplikasi Anda tidak diunggah oleh REA; penyedia model agen Anda melihat hasilnya (lihat [Data & Privasi](#18-data-privacy--security)).

**REA bukan:**
- Tombol ajaib "kembalikan ke kode sumber". Hasilnya adalah assembly/pseudocode dan referensi; agen Anda menjelaskan dan membantu membangun kembali perilakunya.
- Alat untuk membobol lisensi/DRM atau melewati aktivasi berbayar. Jangan gunakan untuk itu.
- Jalan pintas melewati obfuscation. Target yang dikemas/dilindungi berat (VMProtect, Themida, anti-tamper) tetap sangat sulit.
- Akses sisi server. Server di balik API tidak bisa diperiksa; hanya sisi klien/jaringan yang terlihat.

---

## 2. Penggunaan legal dan bertanggung jawab

Reverse engineering bisa legal untuk interoperabilitas, riset keamanan, debugging, dan analisis perangkat lunak yang Anda **miliki** — tetapi hukum dan lisensi berbeda di tiap yurisdiksi.

**Anda harus:**
- Menganalisis perangkat lunak yang Anda miliki, punya lisensi untuk digunakan, atau izin untuk diperiksa.
- Menghormati perjanjian lisensi, Ketentuan Layanan, dan aturan anti-pelolosan DMCA.
- Menggunakan temuan untuk interoperabilitas, pendidikan, dan keamanan defensif.

**Anda tidak boleh:**
- Meloloskan DRM, aktivasi lisensi, atau proteksi anti-salinan.
- Mendistribusikan kode bobol/bocor dari perangkat lunak kepemilikan.
- Menganalisis target yang tidak Anda miliki hak untuk dimiliki/diperiksa.

Panduan ini bukan nasihat hukum. Jika ragu, konsultasikan dengan pengacara.

---

## 3. Apa yang bisa Anda analisis

| Target | Yang dikembalikan REA | Perlu engine native? |
|---|---|---|
| Binary native / library (EXE, DLL, ELF, Mach-O) | Fungsi, assembly, pseudocode, pemanggil, xref, konstanta | Ya — Hopper, Ghidra, atau IDA |
| Aplikasi JavaScript & Electron | Modul, import, channel IPC + handler, lokasi sumber | Tidak |
| Halaman browser (runtime) | Request/response, skrip, bentuk body JSON, jendela observasi | Browser keluarga Chrome |
| Assembly .NET / Flutter / paket | Pemeriksaan modul & resource | Tidak |
| Android APK / perangkat / resource | Class hasil dekompilasi, resource, interaksi perangkat | JADX / adb / Apktool |
| Firmware | Filesystem/blob yang diekstrak | Binwalk / Unblob (Linux) |
| WASM | Pemeriksaan modul & fungsi | WABT |
| Database SQLite | Pemeriksaan skema & query | Node.js 24.15+ / 26+ |
| EVM bytecode | Struktur kontrak | Node.js (Linux x64) |
| Tangkapan HAR / SAZ / mitmproxy | Bukti lalu lintas hasil parsing | Node.js / mitmdump |
| PCAP / PCAPNG | Fakta paket/protokol | TShark / capinfos (Linux) |

---

## 4. Persyaratan sistem

**Minimum:**
- Node.js **22.23.4+**, **24.22.1+**, atau **26+ (>= 26.12.1)** (npm disertakan)
- Agen coding yang didukung (langkah 2)
- Direktori kerja untuk investigasi Anda

**Untuk analisis native (binary)** — salah satu:
- **Ghidra 12.1.x** + **JDK 21+** 64-bit (gratis, direkomendasikan di Windows)
- **IDA** (komersial; profil Windows legacy GUI + headless supervisor terverifikasi)
- **Hopper** (komersial; macOS & sebagian Linux — **tidak tersedia di Windows**)

**Catatan OS:**
- Windows: gunakan **PowerShell**; beri tanda kutip pada path dengan spasi. Jika agen Anda berjalan di WSL, instal Node.js + REA **di dalam** WSL dan gunakan path Linux.
- Linux: `ps` yang kompatibel dengan `procps` harus ada di `PATH` (untuk Ghidra/JADX/firmware dan analisis statis).
- macOS: gunakan Terminal; beberapa langkah memerlukan Xcode Command Line Tools (membangun decompiler Ghidra di arm64).

---

## 5. Langkah 1 — Siapkan komputer Anda

### 5.1 Periksa Node.js

```powershell
node -v
npm -v
```

Harusnya: `v22.23.4+`, `v24.22.1+`, atau `v26.12.1+`. Lebih lama → instal Node.js 24 LTS.

### 5.2 Instal Node.js di Windows (jika belum ada)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Ketik `Y` jika diminta menerima syarat, tutup dan buka PowerShell lagi, periksa `node -v`. (Alternatif: unduh installer LTS dari https://nodejs.org/.)

> **Keunikan PowerShell:** jika `npx` gagal dengan "running scripts is disabled on this system", gunakan `npx.cmd` dan `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Unduh `.pkg` Node.js 24 LTS, atau dengan Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# buka shell lagi, lalu:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Buat folder kerja

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Langkah 2 — Pilih agen coding

REA mendukung agen apa pun yang berbicara **MCP** lokal. Pilih satu — semua contoh memakai **setup ID** klien (`--client <id>`).

| Klien | Setup ID | Instalasi / catatan |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Instal aplikasi, masuk, lalu `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` atau skrip instalasi · masuk dengan ChatGPT |
| Cursor | `cursor` | Instal editor, buka folder kerja, mode Agent |
| Windsurf | `windsurf` | Pola sama; chat agen |
| VS Code | `vscode` | Siapkan GitHub Copilot dulu, lalu mode Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, jalankan `opencode`, `/connect` untuk model, lalu `--client opencode` |
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

**Grok Bot:** di chat bot, minta ia menambahkan server MCP kustom bernama `rea` di komputer host-nya:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Langkah 3 — Hubungkan REA

### Opsi A — Biarkan agen Anda yang melakukannya (direkomendasikan)

Tempel di chat agen Anda:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Agen menjalankan setup, menampilkan rencana, lalu menerapkannya setelah Anda menyetujui.

### Opsi B — Jalankan setup sendiri

```powershell
npx rea-agents@latest setup
```

Untuk klien tertentu:

```powershell
npx rea-agents@latest setup --client opencode
```

Selama setup:
- **Panah** untuk bergerak, **Space** untuk memilih, **Enter** untuk melanjutkan.
- REA menambahkan **koneksi MCP** + **kemampuan investigasi**, dan **membuat backup** konfigurasi yang ada sebelumnya.
- Perubahan hanya berlaku setelah Anda menyetujui.
- Pada latihan pertama, pemasangan Hopper opsional boleh dilewati.

### Mulai ulang klien setelah setup

- Aplikasi desktop (Claude Desktop, Cursor, Windsurf, VS Code): **keluar sepenuhnya** lalu buka lagi (Windows: juga dari ikon tray).
- Agen terminal (Claude Code, Codex, Gemini CLI, OpenCode): akhiri sesi dan mulai lagi.

---

## 8. Langkah 4 — Verifikasi instalasi

Jalankan pemeriksaan doctor untuk klien Anda (ganti `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Laporan sehat menampilkan `"healthy": true`. Lalu tanya agen Anda:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Langkah 5 — Investigasi pertama Anda (contoh Notes)

Contoh resmi adalah aplikasi Electron kecil dengan tombol **Export notes**. Tidak perlu menginstal Electron — agen membaca kodenya.

Tempel ke agen Anda:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Hasil yang diharapkan: klik Export mengirim pesan IPC `notes:export`; proses utama memformat catatan menjadi CSV dan menulis `notes.csv` (kolom: `id`, `title`) ke folder Downloads Anda.

Analisis manual dari terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Analisis native (binary / EXE / DLL)

Analisis native mendalam butuh provider. Di **Windows** gunakan **Ghidra** atau **IDA** (Hopper tidak tersedia di Windows).

### 10.1 Ghidra (gratis) — penyiapan Windows

1. Instal **JDK 64-bit 21 atau lebih baru** (dengan compiler). Periksa:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Unduh **Ghidra 12.1.4** dari daftar *Assets* rilis dan ekstrak `ghidra_…_PUBLIC_….zip` (arsip rilis, **bukan** "Source code").
3. Catat folder hasil ekstraksi yang berisi `ghidraRun.bat` — itu `GHIDRA_INSTALL_DIR` Anda.
4. Di PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # folder yang ditunjuk java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Sesuaikan path dengan instalasi Anda. Tinjau rencana setup yang diperbarui, setujui, dan **mulai ulang agen Anda**.

> Dukungan Ghidra di Windows bersifat **eksperimental, hanya-baca**, untuk aplikasi/DLL PE x86/x64 native pada drive **NTFS** lokal yang tetap.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

Di macOS arm64 dan Linux arm64, bangun dulu decompiler native Ghidra (macOS memerlukan Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Instal dan konfigurasikan server MCP upstream IDA sesuai panduan provider IDA.
2. Simpan pendaftaran yang berfungsi sebagai `ida-mcp.json`. Contoh (headless supervisor dengan `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Untuk server GUI legacy 1.4.0 yang terhubung, salin command/args/env yang berfungsi (buka binary di IDA dan mulai pluginnya dulu).
3. Hubungkan:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   Di macOS/Linux gunakan `export` sebagai ganti `$env:`. Mulai ulang agen Anda setelah setup.

> Profil IDA terverifikasi: Windows legacy GUI dan headless supervisor, serta macOS arm64 headless supervisor (IDA Professional 9.1). npm 6.4.0 tidak menyertakan profil headless macOS / jembatan GUI native — keduanya memerlukan build REA dari sumber.

### 10.4 Hopper (hanya macOS / Linux)

Setup bisa mendeteksi Hopper yang terpasang atau mengusulkan rencana instalasi. Di macOS, pada pembukaan pertama pilih mode demo atau aktifkan lisensi Anda. Instalasi otomatis Linux memerlukan x86_64 dan Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS, atau Omarchy. Di Linux arm64, gunakan Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Menggunakan provider

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Analisis satu fungsi sekali jalan lewat CLI (Ghidra harus dikonfigurasi):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Aplikasi JavaScript & Electron

Tidak butuh engine native. Arahkan agen Anda ke **folder** aplikasi atau **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Di mana Electron menyimpan `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: sering di `/opt/<App>/resources/app.asar`

Analisis statis dari terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Lihat `normalized_result.summary.ipc` untuk channel/handler yang cocok dan `normalized_result.graph` untuk lokasi sumber. Nama channel yang dihitung secara dinamis bisa jadi tidak terselesaikan — gunakan observasi browser (bagian berikutnya).

---

## 12. Observasi browser

1. Buka halaman target di browser keluarga Chrome dengan remote debugging, mis.:

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

2. Tanya agen Anda:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Berikan endpoint `http://127.0.0.1:9222` dan URL halaman. Mulai tangkapan **sebelum** mengklik.

   Atau dari terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Untuk body HTTP, ekspor Fiddler Everywhere (SAZ/HAR 1.2) dapat menjadi REA capture Evidence, atau hubungkan server MCP Everywhere.

---

## 13. Target lain & alat yang dibutuhkan

| Target | Alat yang disiapkan | Catatan |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Tanpa engine |
| Website | Chrome / Chromium / Edge | Port remote debugging |
| .NET / Flutter / paket | Node.js + npm | Inspeksi statis |
| Android APK | JADX + JDK 17+ | Dekompilasi `classes.dex` |
| Perangkat Android | adb | Aktifkan USB debugging |
| Resource Android | Apktool + Java | Membongkar resource & manifest |
| Proyek JEB | JEB + MCP | Decompiler komersial |
| Firmware | Binwalk / Unblob | **Hanya Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Database SQLite | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Hanya Linux x64** |
| ELF / crash Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Analisis offline tangkapan |
| PCAP / PCAPNG | TShark / capinfos | **Hanya Linux** |
| Sinyal logika | sigrok-cli | **Hanya Linux** |
| Perilaku proses | PTY | **Linux / macOS** |

Flutter, paket/resource, EVM, dan panduan investigasi lengkap: https://rea.tools/guides.

---

## 14. Bangun lingkungan RL

REA dapat merekam sesi aplikasi web uji dan mengekspor lingkungan **AgentEnv** untuk melatih/mengevaluasi agen.

1. Siapkan instance aplikasi **uji** tempat agen boleh membuat/mengubah/menghapus data.
2. Tanya agen Anda (contoh folder):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Simpan kata sandi di lingkungan server MCP (`APP_PASSWORD`), bukan di prompt.
3. Atau bangun langsung dari rekaman HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` meninjau laporan tanpa menulis file.
4. Jalankan:
   ```bash
   agent-env run ./my-env
   ```
   Pemeriksaan kompatibilitas REA memakai **AgentEnv 0.9.1334 + Python 3.12**; Docker harus berjalan.
5. Hanya operasi yang **efeknya** terekam yang didukung (mis. hapus butuh respons item-hilang dan daftar yang diperbarui). Sebelum membagikan, tinjau body respons yang tersimpan — bisa mengandung kredensial.

---

## 15. Gunakan REA dari terminal (CLI)

Tanpa instalasi global:

```powershell
npx -y rea-agents@latest --help
```

Instal perintah `rea` permanen:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Installer curl untuk macOS / Linux (perlu Node.js dulu):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Perintah umum:

| Perintah | Tujuan |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Peta modul, import, IPC, batas |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analisis satu fungsi native |
| `rea-agents list-browser-targets <endpoint> --json` | Daftar halaman browser yang bisa di-debug |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Amati jaringan/skrip halaman |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Bangun lingkungan RL |
| `rea-agents environment-compare … --json` | Bandingkan lingkungan vs aplikasi asli |
| `rea-agents doctor --client <id> --json` | Periksa koneksi klien |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Periksa provider native |
| `rea-agents update` | Perbarui CLI |
| `rea-agents uninstall` | Hapus konfigurasi klien + kemampuan REA |

---

## 16. Memperbarui atau menghapus REA

**Memperbarui:**
```powershell
rea update                       # jika CLI global terinstal
npx rea-agents@latest setup      # segarkan koneksi + kemampuan agen; setujui rencana, mulai ulang agen
```

**Menghapus:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Pemecahan masalah

**Agen tidak melihat alat REA**
1. Mulai ulang/sambungkan ulang klien sepenuhnya (termasuk ikon tray).
2. `npx -y rea-agents@latest doctor --client <id> --json` — jika pendaftaran hilang/kedaluwarsa: `npx rea-agents@latest setup --client <id>`, mulai ulang.
3. Masih tidak terlihat: periksa galat koneksi MCP klien; di editor, aktifkan REA di pengaturan MCP dan izinkan alatnya.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Gunakan `npx.cmd` / `npm.cmd`, atau `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Path dengan spasi**
Beri tanda kutip: `"D:/my apps/tool.exe"`. Di WSL, gunakan path Linux dan instal REA di dalam WSL.

**Batasan Ghidra di Windows**
Eksperimental, hanya-baca, hanya PE x86/x64, drive NTFS lokal tetap. Alternatif Linux: Ghidra/Hopper. Analisis crash ELF native x64 Linux: pwntools.

**macOS meminta izin Automation (Hopper)**
System Settings → Privacy & Security → Automation → izinkan aplikasi yang menjalankan REA, coba lagi.

**Hopper pertama kali dibuka**
Selesaikan pilihan mode demo vs aktivasi lisensi sebelum analisis tanpa pengawasan.

**Linux tidak punya `ps`**
Instal `procps` (Debian/Ubuntu: `sudo apt install procps`); REA membutuhkannya untuk pemeriksaan kepemilikan proses.

**Menemukan bug?**
Perbarui REA, mulai ulang, coba lagi. Lalu buka issue dengan: versi REA, OS, jenis target, langkah reproduksi, keluaran galat, nama provider. https://github.com/morluto/rea/issues.

---

## 18. Data, privasi & keamanan

- REA menganalisis target **di mesin Anda**; aplikasi Anda **tidak** diunggah oleh REA.
- **Penyedia model agen Anda** menerima hasilnya — kebijakan data/retensi mereka berlaku. Jangan tempel rahasia atau data pelanggan ke prompt.
- Skema input MCP ringkas secara bawaan; setel `REA_MCP_INPUT_SCHEMA_PROFILE=full` di pendaftaran MCP untuk panduan field lengkap. Skema output bisa dibatasi dengan `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (atau `off`).
- Rekaman lingkungan RL bisa menyimpan kredensial di body/header — tinjau sebelum berbagi. Peringatan credential-name menandai tempat yang perlu ditinjau; **tidak** menghapus nilainya.
- Rahasia seperti `APP_PASSWORD` simpan di lingkungan server MCP, bukan di chat.
- Instal REA hanya dari `morluto/rea`, `rea.tools`, atau npm `rea-agents`.

---

## 19. Checklist referensi cepat

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agen coding terinstal (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (tinjau & setujui rencana)
[ ] Klien dimulai ulang sepenuhnya
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Investigasi pertama: notes-example.zip  →  temukan notes:export / notes.csv
[ ] (Opsional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → jalankan setup lagi → mulai ulang agen
[ ] (Opsional) Browser: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: Anda memiliki / berlisensi untuk menganalisis target
```

---

## 20. Backup / Mirror offline (tidak resmi)

> ⚠️ **Baca ini dulu.**
> Tidak ada yang namanya "backup resmi" untuk proyek resmi. Satu-satunya REA resmi adalah **morluto/rea** (https://github.com/morluto/rea), **rea.tools**, dan paket npm **`rea-agents`**.
> Repo ini menyediakan **mirror / arsip tidak resmi** yang lengkap dan sesuai lisensi, dengan lisensi MIT asli dan pemberitahuan hak cipta tetap ada. Keberadaannya agar **jika repo resmi, situs web, atau paket npm resmi hilang**, Anda masih bisa mendapatkan REA dari sini — tidak lebih.
> Selama sumber resmi ada, **gunakan sumber resmi**. Jangan menyebut backup ini "resmi" atau mendistribusikannya sebagai "REA resmi". Repo ini tidak berafiliasi dengan atau disetujui oleh penulis REA.

**Lisensi:** REA berlisensi MIT — penggandaan, modifikasi, dan distribusi dengan pemberitahuan diperbolehkan. Lisensi lengkap, header hak cipta, dan pemberitahuan pihak ketiga tetap ada di cabang mirror dan tarball npm. Tidak ada jaminan apa pun.

### Apa saja yang ada di backup

| Bagian backup | Lokasi | Isinya |
|---|---|---|
| Mirror sumber | Cabang **`mirror/rea`** | Riwayat git lengkap `main` resmi `morluto/rea` (saat sinkronisasi terakhir — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Tag rilis | Tag **`rea-agents-*.*.*`** | Semua tag rilis resmi, menunjuk commit resmi yang persis (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | Paket npm resmi, pra-bangun (termasuk `dist/`) — instal **sepenuhnya offline** |
| Skrip sinkronisasi | **`scripts/sync-backup.ps1`** | Menyegarkan cabang mirror, tag, dan tarball npm terbaru dari sumber resmi |
| Skrip pemulihan | **`scripts/restore-backup.ps1`** | Instalasi tarball offline sekali jalan + petunjuk langkah berikutnya |
| Panduan | `README.md` (master Inggris) | Panduan penyiapan lengkap; berlaku tanpa memandang sumber REA |

### Jaga backup tetap segar

Jalankan mingguan (atau sebelum mengandalkannya):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Ia melakukan fetch `upstream/main` + semua tag, memaksa pembaruan `mirror/rea`, mem-push tag, `npm pack` rilis `rea-agents-*.*.*` terbaru ke `backup/`, dan mencetak perintah `git add`/`commit`/`push` terakhir untuk tarball.

### Skenario pemulihan

**Skenario A — GitHub mati, npm hidup:** tidak ada yang perlu dipulihkan. Terus gunakan `npx rea-agents@latest setup`.

**Skenario B — GitHub + npm mati semua:** instal tarball pra-bangun dari repo ini (tanpa jaringan, tanpa alat build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# atau manual:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` mendaftarkan server MCP + kemampuan ke agen Anda persis seperti `npx rea-agents setup` resmi — sepenuhnya offline, tanpa menyentuh registry.

**Skenario C — Anda juga ingin sumber/riwayat lengkap:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Sumber resmi lengkap pada saat sinkronisasi terakhir.
```

Membangun dari sumber memerlukan Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ dan akses jaringan ke npm registry (turbo monorepo; `npm ci && npm run build`). Jalur tarball (Skenario B) tidak memerlukan keduanya — selalu pilih itu untuk pemulihan.

### Verifikasi yang Anda pulihkan
```powershell
# Integritas mirror sumber — commit harus cocok dengan upstream/main hasil sinkron terakhir:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # setelah clone cabang mirror
# Integritas tarball — versi yang dilaporkan CLI itu sendiri:
rea --version
```

Jika hash menyimpang dari catatan saat backup dibuat, anggap salinan itu mencurigakan dan sinkronisasi ulang dari sumber resmi (jika sudah kembali) sebelum memercayainya.

### Yang TIDAK dijamin backup ini

- Tidak ada patch keamanan setelah sinkronisasi terakhir — backup yang terbengkalai adalah snapshot usang.
- Paket npm resmi bisa memuat hotfix lebih baru daripada `mirror/rea` atau tarball.
- Layanan pendamping (situs rea.tools, Discord, catatan rilis, situs dokumentasi) adalah materi referensi, bukan kode yang bisa dipulihkan dari sini.
- Jika REA kemudian dirilis ulang dengan nama/pemilik berbeda, snapshot ini tetap berfungsi sebagai upstream yang diarsipkan — migrasikan dengan sengaja, jangan menganggap kompatibel.

---

**Tautan**
- Situs: https://rea.tools/ · Memulai: https://rea.tools/get-started/ · Panduan: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Sumber: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Komunitas: Discord (lihat footer rea.tools) · X: https://x.com/reatools
- **Backup repo ini:** cabang `mirror/rea` · tag `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
