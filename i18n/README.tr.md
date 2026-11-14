# Reverse Engineering Agent — Tam Kurulum Kılavuzu

> **Diller:** 🇬🇧 [English](../README.md) (ana / yetkili sürümü) · 🇨🇳 [简体中文](README.zh-CN.md) · 🇹🇼 [繁體中文](README.zh-TW.md) · 🇯🇵 [日本語](README.ja.md) · 🇰🇷 [한국어](README.ko.md) · 🇹🇷 [Türkçe](README.tr.md) · 🇷🇺 [Русский](README.ru.md) · 🇻🇳 [Tiếng Việt](README.vi.md) · 🇹🇭 [ไทย](README.th.md) · 🇩🇪 [Deutsch](README.de.md) · 🇪🇸 [Español](README.es.md) · 🇫🇷 [Français](README.fr.md) · 🇺🇦 [Українська](README.uk.md) · 🇵🇱 [Polski](README.pl.md) · 🇧🇷 [Português (Brasil)](README.pt-BR.md) · 🇸🇦 [العربية](README.ar.md) · 🇮🇷 [فارسی](README.fa.md) · 🇮🇩 [Bahasa Indonesia](README.id.md) · 🇮🇹 [Italiano](README.it.md) · 🇬🇷 [Ελληνικά](README.el.md) · 🇮🇳 [മലയാളം](README.ml.md) · 🇵🇰 [Roman Urdu](README.ur-Latn.md) · 🇷🇴 [Română](README.ro.md) · 🇧🇬 [Български](README.bg.md)
>
> ℹ️ Bu çeviri İngilizce ana sürümle aynıdır. Çelişki durumunda **İngilizce geçerlidir**. Kod blokları, yollar ve komutlar hiçbir zaman çevrilmez.

> **REA — Reverse Engineer Anything**
> MCP (Model Context Protocol) sunucusu + inceleme yeteneği; kodlama aracınıza yazılımı denetleme araçları sağlar: yerel ikili dosyalar, JavaScript/Electron uygulamaları, tarayıcılar, .NET, Android, firmware ve daha fazlası.

- **Resmi web sitesi:** https://rea.tools/
- **Resmi kaynak kodu:** https://github.com/morluto/rea
- **npm paketi:** `rea-agents`
- **Lisans:** MIT (REA'nın kendisi). Üçüncü taraf analiz araçlarının kendi lisansları vardır.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (İngilizce) — Platforma özel adım adım kurulum (Windows öncelikli: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2), sorun giderme dahil
- **📦 Çevrimdışı yedek dahildir** — resmi deponun gayriresmi aynısı + npm tarball; yalnızca resmi kaynaklar kaybolursa kullanılır. **[Bölüm 20 — Çevrimdışı Yedek / Ayna (Gayriresmi)](#20-offline-backup--mirror-unofficial)**'ye bakın.

> ⚠️ **Önemli:** REA'yı yalnızca `morluto/rea`, `rea.tools` veya `rea-agents` npm paketinden indirin. Benzer depo adları resmi bir yayın anlamına gelmez.

---

## İçindekiler

1. REA nedir (ne değildir)
2. Yasal ve sorumlu kullanım
3. Neleri analiz edebilirsiniz
4. Sistem gereksinimleri
5. Adım 1 — Bilgisayarınızı hazırlayın
6. Adım 2 — Bir kodlama aracı seçin
7. Adım 3 — REA'yı bağlayın
8. Adım 4 — Kurulumu doğrulayın
9. Adım 5 — İlk incelemeniz (Notes örneği)
10. Yerel analiz (ikili dosyalar / EXE / DLL)
11. JavaScript & Electron uygulamaları
12. Tarayıcı gözlemi
13. Diğer hedefler ve gerekli araçlar
14. RL ortamları oluşturun
15. REA'yı terminalden kullanın (CLI)
16. REA'yı güncelleyin veya kaldırın
17. Sorun giderme
18. Veri, gizlilik ve güvenlik
19. Hızlı başvuru kontrol listesi
20. Çevrimdışı Yedek / Ayna (Gayriresmi)

---

## 1. REA nedir (ne değildir)

**REA şunlardır:**
- Yerel MCP sunucusu + ajan yeteneği — **kodlama aracınıza** yerel olarak sahip olduğunuz yazılımları denetleme imkânı verir.
- **Kanıt** döndürür: assembly, sözde kod, modül haritaları, IPC kanal eşlemeleri, yakalanan ağ trafiği, kaynak konumlar — orijinal kaynak kodu değil.
- Analiz **kendi makinenizde** çalışır. Uygulamanız REA tarafından yüklenmez; ajanınızın kullandığı model sağlayıcısı sonuçları görür (bkz. [Veri ve Gizlilik](#18-data-privacy--security)).

**REA şunlar değildir:**
- "İkili dosyayı orijinal kaynağa çeviren" sihirli bir düğme değil. Sonuçlar assembly/sözde kod ve referanslardır; ajanınız açıklar ve davranışı yeniden oluşturmanıza yardımcı olur.
- Lisans/DRM kırmak veya ücretli etkinleştirmeyi atlamak için bir araç değil. Bunun için kullanmayın.
- Karartmayı aşma aracı değil. Yoğun paketlenmiş/korunan hedefler (VMProtect, Themida, kurcalama önleme) son derece zordur.
- Sunucu tarafına erişim değil. Bir API'nin arkasındaki sunucuyu denetleyemez; yalnızca istemci/ağ tarafını görür.

---

## 2. Yasal ve sorumlu kullanım

Birlikte çalışabilirlik, güvenlik araştırması, hata ayıklama ve **sahip olduğunuz** yazılımı analiz etme amacıyla tersine mühendislik yasal olabilir — ancak kanunlar ve lisanslar ülkeye göre değişir.

**Yapmalısınız:**
- Sahip olduğunuz, kullanma lisansına sahip olduğunuz veya denetleme izni aldığınız yazılımı analiz edin.
- Lisans sözleşmelerine, Hizmet Şartlarına ve DMCA anti-circumvention kurallarına saygı gösterin.
- Bulguları birlikte çalışabilirlik, eğitim ve savunma güvenliği için kullanın.

**Yapmamalısınız:**
- DRM, lisans etkinleştirme veya kopya korumasını atlamak.
- Tescilli yazılımın kırılmış/sızdırılmış kodunu dağıtmak.
- Sahip olma veya denetleme hakkınız olmayan hedefleri analiz etmek.

Bu kılavuz hukuki tavsiye değildir. Şüphede kalırsanız bir avukata danışın.

---

## 3. Neleri analiz edebilirsiniz

| Hedef | REA'nın döndürdükleri | Yerel motor Gerekli? |
|---|---|---|
| Yerel ikili dosyalar / kütüphaneler (EXE, DLL, ELF, Mach-O) | Fonksiyonlar, assembly, sözde kod, çağıranlar, çapraz referanslar, sabitler | Evet — Hopper, Ghidra veya IDA |
| JavaScript & Electron uygulamaları | Modüller, içe aktarmalar, IPC kanalları + işleyiciler, kaynak konumlar | Hayır |
| Tarayıcı sayfaları (çalışma zamanı) | İstekler/yanıtlar, betikler, JSON gövde yapıları, gözlem penceresi | Chrome ailesi tarayıcı |
| .NET derlemeleri / Flutter / paketler | Modül ve kaynak denetimi | Hayır |
| Android APK'ları / cihazlar / kaynaklar | Decompile edilmiş sınıflar, kaynaklar, cihaz etkileşimi | JADX / adb / Apktool |
| Firmware | Çıkarılan dosya sistemi/blob'ları | Binwalk / Unblob (Linux) |
| WASM | Modül ve fonksiyon denetimi | WABT |
| SQLite veritabanları | Şema ve sorgu denetimi | Node.js 24.15+ / 26+ |
| EVM bytecode | Kontrat yapısı | Node.js (Linux x64) |
| HAR / SAZ / mitmproxy yakalamaları | Ayrıştırılmış trafik kanıtları | Node.js / mitmdump |
| PCAP / PCAPNG | Paket/protokol gerçekleri | TShark / capinfos (Linux) |

---

## 4. Sistem gereksinimleri

**Minimum:**
- Node.js **22.23.4+**, **24.22.1+** veya **26+ (>= 26.12.1)** (npm dahil)
- Desteklenen bir kodlama aracı (Adım 2'ye bakın)
- İncelemeleriniz için bir çalışma dizini

**Yerel (ikili) analiz için** biri:
- **Ghidra 12.1.x** + 64 bit **JDK 21+** (ücretsiz, Windows'ta önerilir)
- **IDA** (ticari; doğrulanmış Windows eski GUI + headless supervisor profilleri)
- **Hopper** (ticari; macOS ve bazı Linux — **Windows'ta yok**)

**OS notları:**
- Windows: **PowerShell** kullanın; boşluk içeren yolları tırnak içine alın. Ajanınız WSL içinde çalışıyorsa, Node.js + REA'yı WSL **içine** kurun ve Linux yolları kullanın.
- Linux: Ghidra/JADX/firmware başlatmaları ve statik analiz için `PATH` üzerinde `procps` uyumlu `ps` gerekir.
- macOS: Terminal kullanın; bazı adımlar Xcode Command Line Tools gerektirir (arm64'te Ghidra decompiler derleme).

---

## 5. Adım 1 — Bilgisayarınızı hazırlayın

### 5.1 Node.js'i kontrol edin

```powershell
node -v
npm -v
```

Beklenen: `v22.23.4+`, `v24.22.1+` veya `v26.12.1+`. Daha eskiyse → Node.js 24 LTS kurun.

### 5.2 Windows'a Node.js kurun (eksikse)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Koşulları kabul etmeniz istenirse `Y` yazın, PowerShell'i kapatıp yeniden açın ve `node -v`'yi tekrar kontrol edin. (Alternatif: https://nodejs.org/ adresinden Node.js LTS yükleyicisini indirin.)

> **PowerShell tuhaflığı:** `npx` "running scripts is disabled on this system" hatası verirse, `npx.cmd` ve `npm.cmd` kullanın:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Node.js 24 LTS `.pkg` dosyasını indirin veya Homebrew ile: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# kabuğu yeniden açın, sonra:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Çalışma klasörü oluşturun

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Adım 2 — Bir kodlama aracı seçin

REA, yerel **MCP** konuşan her aracı destekler. Birini seçin — aşağıdaki tüm örnekler istemcinin **setup ID**'sini kullanır (`--client <id>`).

| İstemci | Setup ID | Kurulum / notlar |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Uygulamayı kurun, giriş yapın, sonra `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` veya kurulum betiği · ChatGPT ile giriş |
| Cursor | `cursor` | Editörü kurun, çalışma klasörünü açın, Agent modu |
| Windsurf | `windsurf` | Aynı desen; ajan sohbeti |
| VS Code | `vscode` | Önce GitHub Copilot'u kurun, sonra Agent modu |
| OpenCode | `opencode` | `npm install --global opencode-ai`, `opencode` çalıştırın, `/connect` ile modelinizi bağlayın, sonra `--client opencode` |
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

**Grok Bot:** botun sohbetinde, barındırılan kendi bilgisayarında `rea` adlı özel bir MCP sunucusu eklemesini isteyin:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Adım 3 — REA'yı bağlayın

### Seçenek A — Ajanınıza bırakın (önerilir)

Bunu ajanınızın sohbetine yapıştırın:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

Ajanınız setup'ı çalıştırır, planı gösterir ve onayınızın ardından uygular.

### Seçenek B — setup'ı kendiniz çalıştırın

```powershell
npx rea-agents@latest setup
```

Belirli bir istemci için:

```powershell
npx rea-agents@latest setup --client opencode
```

Setup sırasında:
- Hareket için **ok tuşları**, istemci seçmek için **Space**, devam için **Enter**.
- REA bir **MCP bağlantısı** + **inceleme yeteneği** ekler ve mevcut yapılandırmayı değiştirmeden önce **yedekler**.
- Değişiklikler uygulanmadan önce onayınız gerekir.
- İlk alıştırmanız için isteğe bağlı Hopper kurulumunu atlayabilirsiniz.

### setup'tan sonra istemcinizi yeniden başlatın

- Masaüstü uygulamalar (Claude Desktop, Cursor, Windsurf, VS Code): **tamamen çıkın** ve yeniden açın (Windows: ayrıca tepsi simgesinden de çıkın).
- Terminal ajanları (Claude Code, Codex, Gemini CLI, OpenCode): oturumu kapatıp yeniden başlatın.

---

## 8. Adım 4 — Kurulumu doğrulayın

İstemcinizin doctor denetimini çalıştırın (`<client_id>` değiştirin):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Sağlıklı bir rapor `"healthy": true` gösterir. Ardından ajanınıza sorun:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Adım 5 — İlk incelemeniz (Notes örneği)

Resmi örnek, **Export notes** düğmeli küçük bir Electron uygulamasıdır. Electron kurulumu gerekmez — ajan kodu okur.

Ajanınıza yapıştırın:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Beklenen bulgu: Export'a tıklamak `notes:export` IPC mesajı gönderir; ana süreç notları CSV'ye biçimler ve `notes.csv`'i (sütunlar: `id`, `title`) İndirilenler klasörünüze yazar.

Terminalden manuel analiz:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Yerel analiz (ikili dosyalar / EXE / DLL)

Derin yerel analiz bir sağlayıcı gerektirir. **Windows**'ta **Ghidra** veya **IDA** kullanın (Hopper Windows'ta yok).

### 10.1 Ghidra (ücretsiz) — Windows kurulumu

1. **64 bit JDK 21 veya üzeri** kurun (derleyici dahil). Kontrol edin:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Sürümün *Assets* listesinden **Ghidra 12.1.4**'ü indirin ve `ghidra_…_PUBLIC_….zip` arşivini çıkarın ("Source code" değil).
3. `ghidraRun.bat`'ı içeren çıkarılan klasörü not edin — bu sizin `GHIDRA_INSTALL_DIR`'inizdir.
4. PowerShell'de:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # java.home'un gösterdiği klasör
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Yolları gerçek kurulumlarınızla değiştirin. setup'ın güncel planını gözden geçirin, onaylayın ve **ajanınızı yeniden başlatın**.

> Windows Ghidra desteği **deneysel, salt okunur** olup yerel sabit **NTFS** sürücülerdeki x86/x64 PE uygulamaları ve DLL'ler ile sınırlıdır.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

macOS arm64 ve Linux arm64'te önce Ghidra'nın yerel decompiler'ını derleyin (macOS Xcode Command Line Tools, make, bison gerektirir).

### 10.3 IDA

1. IDA provider kılavuzuna göre upstream IDA MCP sunucusunu kurun ve yapılandırın.
2. Çalışan kaydı `ida-mcp.json` olarak kaydedin. Örnek (`idb_open`/`idb_list`/`idb_close` sunan headless supervisor):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Bağlı eski 1.4.0 GUI sunucusu için, çalışan command/args/env'i kopyalayın (önce IDA'da ikiliyi açıp eklentiyi başlatın).
3. Bağlanın:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   macOS/Linux'ta `$env:` yerine `export` kullanın. setup'tan sonra ajanınızı yeniden başlatın.

> Doğrulanmış IDA profilleri, Windows eski GUI ve headless supervisor ile macOS arm64 headless supervisor'ını (IDA Professional 9.1) içerir. npm 6.4.0, macOS headless profilini / yerel GUI köprüsünü içermez — bunlar REA kaynak derlemesi gerektirir.

### 10.4 Hopper (yalnızca macOS / Linux)

Setup mevcut Hopper'ı algılayabilir veya kurulum planı önerebilir. macOS'ta ilk açılışta demo modu seçin veya lisansınızı etkinleştirin. Linux otomatik kurulumu Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS veya Omarchy çalıştıran x86_64 ana makine gerektirir. Linux arm64'te Ghidra kullanın.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Bir sağlayıcı kullanma

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Tek seferlik CLI fonksiyon analizi (Ghidra yapılandırılmalı):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. JavaScript & Electron uygulamaları

Yerel motor gerekmez. Ajanınızı uygulamanın **klasörüne** veya **.asar** dosyasına yönlendirin:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Electron uygulamalarında `app.asar`'ın bulunduğu yer:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: genellikle `/opt/<App>/resources/app.asar`

Terminalden statik analiz:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Eşleşen kanallar/işleyiciler için `normalized_result.summary.ipc`'e, kaynak konumlar için `normalized_result.graph`'a bakın. Dinamik hesaplanan kanal adları çözülememiş kalabilir — bu durumda bir sonraki bölümdeki tarayıcı gözlemini kullanın.

---

## 12. Tarayıcı gözlemi

1. Hedef sayfayı Chrome ailesi tarayıcıyla uzaktan hata ayıklama açık şekilde açın, örneğin:

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

2. Ajanınıza sorun:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Uç noktayı `http://127.0.0.1:9222` ve sayfa URL'sini verin. Yakalamayı tıklamadan **önce** başlatın.

   Veya terminalden:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

HTTP gövdeleri için Fiddler Everywhere (SAZ/HAR 1.2) dışa aktarmaları REA capture Evidence'a beslenebilir veya Everywhere'in MCP sunucusuna bağlanır.

---

## 13. Diğer hedefler ve gerekli araçlar

| Hedef | Hazırlanacak araçlar | Notlar |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Motor gerekmez |
| Web sitesi | Chrome / Chromium / Edge | Uzaktan hata ayıklama portu |
| .NET / Flutter / paketler | Node.js + npm | Statik denetim |
| Android APK | JADX + JDK 17+ | `classes.dex` decompile |
| Android cihaz | adb | USB hata ayıklama açık |
| Android kaynakları | Apktool + Java | Kaynakları ve manifesti açar |
| JEB projesi | JEB + MCP | Ticari decompiler |
| Firmware | Binwalk / Unblob | **Yalnızca Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| SQLite veritabanı | Node.js 24.15+ / 26+ | |
| EVM bytecode | Node.js | **Yalnızca Linux x64** |
| ELF / Linux crash | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Çevrimdışı yakalama ayrıştırma |
| PCAP / PCAPNG | TShark / capinfos | **Yalnızca Linux** |
| Mantık sinyalleri | sigrok-cli | **Yalnızca Linux** |
| Süreç davranışı | PTY | **Linux / macOS** |

Flutter, paketler/kaynaklar, EVM ve tam inceleme kılavuzları: https://rea.tools/guides.

---

## 14. RL ortamları oluşturun

REA bir test web uygulaması oturumunu kaydedebilir ve ajanları eğitmek/değerlendirmek için bir **AgentEnv** ortamına dışa aktarabilir.

1. Ajanın veri oluşturabileceği/düzenleyebileceği/silebileceği bir **test** uygulama örneği hazırlayın.
2. Ajanınıza sorun (klasör örneği):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Şifreyi MCP sunucusu ortamında (`APP_PASSWORD`) tutun, isteme yazmayın.
3. Veya doğrudan bir HAR kaydından derleyin:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` raporu dosya yazmadan gözden geçirir.
4. Çalıştırın:
   ```bash
   agent-env run ./my-env
   ```
   REA'nın uyumluluk denetimi **AgentEnv 0.9.1334 + Python 3.12** kullanır; Docker çalışıyor olmalıdır.
5. Yalnızca **etkileri** kaydedilen işlemler desteklenir (ör. silme için eksik öğe yanıtı ve güncellenen listenin kaydı gerekir). Paylaşmadan önce kalan yanıt gövdelerini gözden geçirin — kimlik bilgileri kalabilir.

---

## 15. REA'yı terminalden kullanın (CLI)

Genel kurulum yapmadan:

```powershell
npx -y rea-agents@latest --help
```

`rea` komutunu kalıcı olarak kurun:

```powershell
npm install --global rea-agents
rea --help
rea update
```

macOS / Linux curl yükleyicisi (önce Node.js gerekir):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Sık kullanılan komutlar:

| Komut | Amaç |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Modülleri, içe aktarmaları, IPC'yi, sınırları haritala |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Tek bir yerel fonksiyonu analiz et |
| `rea-agents list-browser-targets <endpoint> --json` | Hata ayıklanabilir tarayıcı sayfalarını listele |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Sayfa ağı/betiklerini gözlemle |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | RL ortamı derle |
| `rea-agents environment-compare … --json` | Ortamı canlı uygulamayla karşılaştır |
| `rea-agents doctor --client <id> --json` | İstemci bağlantısını denetle |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Yerel sağlayıcıyı denetle |
| `rea-agents update` | CLI'yı güncelle |
| `rea-agents uninstall` | REA istemci yapılandırmasını + yeteneği kaldır |

---

## 16. REA'yı güncelleyin veya kaldırın

**Güncelle:**
```powershell
rea update                       # genel CLI kuruluysa
npx rea-agents@latest setup      # ajan bağlantısını + yeteneği yenile; planı onaylayıp yeniden başlatın
```

**Kaldır:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Sorun giderme

**Ajan REA araçlarını görmüyor**
1. İstemciyi tamamen yeniden başlatın/yeniden bağlayın (tepsi simgeleri dahil).
2. `npx -y rea-agents@latest doctor --client <id> --json` — kayıt eksik/eskiyse: `npx rea-agents@latest setup --client <id>`, yeniden başlatın.
3. Hâlâ görünmüyorsa: istemcinin MCP bağlantı hatasını kontrol edin; editör istemcilerde MCP ayarlarında REA'yı etkinleştirin ve araçlarına izin verin.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
`npx.cmd` / `npm.cmd` kullanın veya `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Boşluk içeren yollar**
Tırnak içine alın: `"D:/my apps/tool.exe"`. WSL'de Linux yolları kullanın ve REA'yı WSL içinde kurun.

**Windows Ghidra sınırları**
Deneysel, salt okunur, yalnızca x86/x64 PE, sabit yerel NTFS sürücüler. Linux alternatifi: Ghidra/Hopper. Yerel x64 Linux ELF crash analizi: pwntools.

**macOS Otomasyon izni istiyor (Hopper)**
Sistem Ayarları → Gizlilik ve Güvenlik → Otomasyon → REA'yı başlatan uygulamaya izin verin, yeniden deneyin.

**Hopper ilk çalıştırma**
Gözetimsiz analizden önce demo modu vs lisans etkinleştirme seçimini tamamlayın.

**Linux'ta `ps` eksik**
`procps` kurun (Debian/Ubuntu: `sudo apt install procps`); REA süreç sahipliği denetimleri için gerekir.

**Bir hata mı var?**
REA'yı güncelleyin, yeniden başlatın, tekrar deneyin. Ardından REA sürümü, OS, hedef türü, yeniden üretme adımları, hata çıktısı ve sağlayıcı adıyla bir issue açın. https://github.com/morluto/rea/issues.

---

## 18. Veri, gizlilik ve güvenlik

- REA hedefleri **kendi makinenizde** analiz eder; uygulamanız REA tarafından **yüklenmez**.
- **Ajanınızın model sağlayıcısı** sonuçları alır — o sağlayıcının veri/saklama politikası geçerlidir. Gizli bilgileri veya müşteri verilerini isteme yapıştırmayın.
- MCP giriş şemaları varsayılan olarak sıkıştırılmıştır; tam alan rehberliği için MCP kaydına `REA_MCP_INPUT_SCHEMA_PROFILE=full` ayarlayın. Çıkış şemalarını `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (veya `off`) ile sınırlayabilirsiniz.
- RL ortamı kayıtları, gövdelerde/başlıklarda kimlik bilgilerini tutabilir — paylaşmadan önce gözden geçirin. credential-name uyarıları incelenecek yerleri işaretler; değerleri **silmez**.
- `APP_PASSWORD` benzeri sırlar MCP sunucusu ortamında tutulmalı, sohbetlere yazılmamalıdır.
- REA'yı yalnızca `morluto/rea`, `rea.tools` veya npm `rea-agents`'tan kurun.

---

## 19. Hızlı başvuru kontrol listesi

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Kodlama aracı kurulu (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (planı gözden geçirin ve onaylayın)
[ ] İstemci tamamen yeniden başlatıldı
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] İlk inceleme: notes-example.zip  →  notes:export / notes.csv'i bulun
[ ] (İsteğe bağlı) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → setup'ı yeniden çalıştırın → ajanı yeniden başlatın
[ ] (İsteğe bağlı) Tarayıcı: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Yasal: hedefi sahipleniyor / analiz izniniz var
```

---

## 20. Çevrimdışı Yedek / Ayna (Gayriresmi)

> ⚠️ **Önce bunu okuyun.**
> Resmi projenin "resmi yedeği" diye bir şey yoktur. Tek resmi REA **morluto/rea** (https://github.com/morluto/rea), **rea.tools** ve **`rea-agents` npm paketidir**.
> Bu deponun sağladığı şey, resmi projenin eksiksiz ve lisansa uygun **gayriresmi aynısı / arşividir**; orijinal MIT lisansı ve telif bildirimleri korunur. Var olma sebebi: **resmi depo, web sitesi veya npm paketi bir gün kaybolursa**, REA'yı buradan edinebilmeniz — hepsi bu.
> Resmi kaynaklar mevcutsa **onları kullanın**. Bu yedeği "resmi" olarak sunmayın ve "resmi REA" olarak dağıtmayın. Bu depo REA yazarlarıyla bağlantılı değildir veya onların onayını taşımaz.

**Lisans:** REA MIT lisanslıdır; bildirimi koruyarak kopyalama, değiştirme ve dağıtıma izin verir. Tam lisans, telif başlıkları ve üçüncü taraf bildirimleri hem ayna dalında hem de npm tarball'ında korunur. Hiçbir garanti verilmez.

### Yedekte neler var

| Yedek parçası | Nerede | Ne olduğu |
|---|---|---|
| Kaynak aynası | Dal **`mirror/rea`** | Resmi `morluto/rea` `main` dalının tam git geçmişi (son senkronizasyon anı — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Sürüm etiketleri | Etiketler **`rea-agents-*.*.*`** | Tüm resmi sürüm etiketleri, tam resmi commit'leri işaret eder (v2.7.0 → v6.9.0) |
| npm tarball | **`backup/rea-agents-6.9.0.tgz`** | Resmi npm paketi, önceden derlenmiş (`dist/` dahil) — tamamen **çevrimdışı** kurulum |
| Senkronizasyon betiği | **`scripts/sync-backup.ps1`** | Ayna dalını, etiketleri ve en yeni npm tarball'ını resmi kaynaklardan yeniler |
| Geri yükleme betiği | **`scripts/restore-backup.ps1`** | Tarball'ı tek seferde çevrimdışı kurar ve sonraki adımları yazdırır |
| Kılavuz | `README.md` (İngilizce ana) | Tam kurulum kılavuzu; REA'nın hangi kaynaktan alındığından bağımsız geçerlidir |

### Yedeği taze tutun

Haftalık çalıştırın (veya ona güvenmeden önce):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

`upstream/main` + tüm etiketleri fetch eder, `mirror/rea`'yı zorla günceller, etiketleri push eder, en yeni `rea-agents-*.*.*` sürümünü `backup/`'a `npm pack`'ler ve tarball'ın son `git add`/`commit`/`push` komutlarını yazar.

### Geri yükleme senaryoları

**Senaryo A — GitHub çöktü, npm çalışıyor:** geri yükleme gerekmez. `npx rea-agents@latest setup` kullanmaya devam edin.

**Senaryo B — GitHub + npm ikisi de çöktü:** bu depodaki önceden derlenmiş tarball'ı kurun (ağ yok, derleme aracı yok):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# veya elle:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup`, MCP sunucusunu + yeteneği ajanınıza tıpkı resmi `npx rea-agents setup` gibi kaydeder — tamamen çevrimdışı, registry'ye dokunmaz.

**Senaryo C — Tam kaynak/geçmişi de istiyorsanız:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Son senkronizasyon anındaki tam resmi kaynak.
```

Kaynaktan derleme Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ ve npm registry'ye ağ erişimi gerektirir (turbo monorepo; `npm ci && npm run build`). Tarball yolu (Senaryo B) hiçbirini gerektirmez — geri yüklemede her zaman onu tercih edin.

### Geri yüklediğinizi doğrulayın
```powershell
# Kaynak aynası bütünlüğü — commit, son senkronize edilen upstream/main ile eşleşmeli:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # ayna dalını klonladıktan sonra
# Tarball bütünlüğü — CLI'nın kendi bildirdiği sürüm:
rea --version
```

Hash'ler yedek anındaki kayıtlarınızdan saparsa, kopyayı şüpheli kabul edin ve güvenmeden önce resmi kaynaklardan yeniden senkronize edin (geri geldilerse).

### Bu yedeğin garanti etmedikleri

- Son senkronizasyondan sonra güvenlik yamaları yoktur — terk edilen yedek eski bir anlık görüntüdür.
- Resmi npm paketi `mirror/rea` veya tarball'dan daha yeni hotfix'ler içerebilir.
- Yan hizmetler (rea.tools web sitesi, Discord, sürüm notları, belge sitesi) referans materyaldir, buradan geri yükleyebileceğiniz kod değildir.
- REA daha sonra farklı bir ad/sahiple yeniden yayımlanırsa, bu anlık görüntü arşivlenmiş upstream olarak çalışmaya devam eder — uyumluluğu varsaymayın, bilinçli olarak geçin.

---

**Bağlantılar**
- Web sitesi: https://rea.tools/ · Başlangıç: https://rea.tools/get-started/ · Kılavuzlar: https://rea.tools/guides/
- SSS: https://rea.tools/faq/ · Vitrin: https://rea.tools/showcases/
- Kaynak: https://github.com/morluto/rea (MIT) · Sorunlar: https://github.com/morluto/rea/issues
- Topluluk: Discord (rea.tools altbilgisine bakın) · X: https://x.com/reatools
- **Bu deponun yedeği:** dal `mirror/rea` · etiketler `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
