# Reverse Engineering Agent — Guía de configuración completa

> **Idiomas:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (principal / autoritativo) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [தமிழ்](README.ta.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md) · <img src="https://flagcdn.com/w20/bd.png" width="20" height="15" alt="BD"> [বাংলা](README.bn.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [हिन्दी](README.hi.md)
>
> ℹ️ Esta traducción refleja el original en inglés. Si hay discrepancias, **gana el inglés**. Los bloques de código, rutas y comandos nunca se traducen.

> **REA — Reverse Engineer Anything**
> Un servidor MCP (Model Context Protocol) + habilidad de investigación que da a su agente de programación herramientas para inspeccionar software: binarios nativos, apps JavaScript/Electron, navegadores, .NET, Android, firmware y más.

- **Sitio web oficial:** https://rea.tools/
- **Código fuente oficial:** https://github.com/morluto/rea
- **Paquete npm:** `rea-agents`
- **Licencia:** MIT (el propio REA). Las herramientas de análisis de terceros tienen sus propias licencias.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (en inglés) — configuración paso a paso por plataforma (Windows primero: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) con solución de problemas
- **📦 Respaldo offline incluido** — espejo no oficial del repo oficial + tarball npm; solo si las fuentes oficiales desaparecen. Ver **[Sección 20 — Respaldo / espejo offline (no oficial)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Importante:** Descargue REA solo desde `morluto/rea`, `rea.tools` o el paquete npm `rea-agents`. Un nombre similar de repositorio no prueba un lanzamiento oficial.

---

## Índice

1. Qué es REA (y qué no es)
2. Uso legal y responsable
3. Qué puede analizar
4. Requisitos del sistema
5. Paso 1 — Prepare su computadora
6. Paso 2 — Elija un agente de programación
7. Paso 3 — Conecte REA
8. Paso 4 — Verifique la instalación
9. Paso 5 — Su primera investigación (ejemplo Notes)
10. Análisis nativo (binarios / EXE / DLL)
11. Apps JavaScript & Electron
12. Observación del navegador
13. Otros objetivos y herramientas necesarias
14. Construya entornos RL
15. Use REA desde la terminal (CLI)
16. Actualizar o eliminar REA
17. Solución de problemas
18. Datos, privacidad y seguridad
19. Lista de verificación rápida
20. Respaldo / espejo offline (no oficial)

---

## 1. Qué es REA (y qué no es)

**REA es:**
- Un servidor MCP local + habilidad de agente — le permite a **su agente de programación** inspeccionar software que tiene localmente.
- Devuelve **evidencia**: ensamblador, pseudocódigo, mapas de módulos, emparejamientos de canales IPC, tráfico de red capturado, ubicaciones de origen — no el código fuente original.
- El análisis se ejecuta **en su máquina**. Su app no es subida por REA; el proveedor del modelo de su agente ve los resultados (ver [Datos y privacidad](#18-data-privacy--security)).

**REA no es:**
- Un botón mágico de "volver al código fuente". Los resultados son ensamblador/pseudocódigo y referencias; su agente explica y ayuda a reconstruir el comportamiento.
- Una herramienta para crackear licencias/DRM ni para saltarse la activación de pago. No la use para eso.
- Una elusión de ofuscación. Objetivos muy empaquetados/protegidos (VMProtect, Themida, anti-tamper) siguen siendo extremadamente difíciles.
- Acceso del lado del servidor. No puede inspeccionar un servidor tras una API; solo ve el lado cliente/red.

---

## 2. Uso legal y responsable

La ingeniería inversa puede ser legal para interoperabilidad, investigación de seguridad, depuración y análisis de software que **posee** — pero las leyes y licencias varían según la jurisdicción.

**Usted debe:**
- Analizar software que posee, tiene licencia para usar o permiso para inspeccionar.
- Respetar acuerdos de licencia, Términos del servicio y normas anti-elusión de la DMCA.
- Usar los hallazgos para interoperabilidad, educación y seguridad defensiva.

**Usted no debe:**
- Eludir DRM, activación de licencias o protección anti-copia.
- Distribuir código crackeado/filtrado de software propietario.
- Analizar objetivos que no tiene derecho a poseer o inspeccionar.

Esta guía no es asesoría legal. Ante la duda, consulte a un abogado.

---

## 3. Qué puede analizar

| Objetivo | Qué devuelve REA | ¿Motor nativo necesario? |
|---|---|---|
| Binarios nativos / bibliotecas (EXE, DLL, ELF, Mach-O) | Funciones, ensamblador, pseudocódigo, llamadores, xrefs, constantes | Sí — Hopper, Ghidra o IDA |
| Apps JavaScript & Electron | Módulos, imports, canales IPC + manejadores, ubicaciones de origen | No |
| Páginas de navegador (runtime) | Peticiones/respuestas, scripts, formas de cuerpo JSON, ventana de observación | Navegador familia Chrome |
| Ensamblados .NET / Flutter / paquetes | Inspección de módulos y recursos | No |
| APK de Android / dispositivos / recursos | Clases descompiladas, recursos, interacción con dispositivos | JADX / adb / Apktool |
| Firmware | Sistemas de archivos/blobs extraídos | Binwalk / Unblob (Linux) |
| WASM | Inspección de módulos y funciones | WABT |
| Bases de datos SQLite | Inspección de esquema y consultas | Node.js 24.15+ / 26+ |
| Bytecode EVM | Estructura del contrato | Node.js (Linux x64) |
| Capturas HAR / SAZ / mitmproxy | Evidencia de tráfico parseado | Node.js / mitmdump |
| PCAP / PCAPNG | Datos de paquetes/protocolos | TShark / capinfos (Linux) |

---

## 4. Requisitos del sistema

**Mínimo:**
- Node.js **22.23.4+**, **24.22.1+** o **26+ (>= 26.12.1)** (npm incluido)
- Un agente de programación compatible (paso 2)
- Un directorio de trabajo para sus investigaciones

**Para análisis nativo (binario)** — uno de:
- **Ghidra 12.1.x** + **JDK 21+** de 64 bits (gratis, recomendado en Windows)
- **IDA** (comercial; perfiles verificados: GUI heredada de Windows + supervisor headless)
- **Hopper** (comercial; macOS y parte de Linux — **no disponible en Windows**)

**Notas de SO:**
- Windows: use **PowerShell**; entre comillas las rutas con espacios. Si su agente corre en WSL, instale Node.js + REA **dentro** de WSL y use rutas de Linux.
- Linux: un `ps` compatible con `procps` en `PATH` (para lanzamientos de Ghidra/JADX/firmware y análisis estático).
- macOS: use Terminal; algunos pasos requieren Xcode Command Line Tools (compilar el descompilador de Ghidra en arm64).

---

## 5. Paso 1 — Prepare su computadora

### 5.1 Verifique Node.js

```powershell
node -v
npm -v
```

Esperado: `v22.23.4+`, `v24.22.1+` o `v26.12.1+`. Más antiguo → instale Node.js 24 LTS.

### 5.2 Instale Node.js en Windows (si falta)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Escriba `Y` si se le piden aceptar términos, cierre y reabra PowerShell y verifique `node -v`. (Alternativa: descargue el instalador LTS de https://nodejs.org/.)

> **Peculiaridad de PowerShell:** si `npx` falla con "running scripts is disabled on this system", use `npx.cmd` y `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Descargue el `.pkg` de Node.js 24 LTS, o con Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# reabra la shell, luego:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Cree una carpeta de trabajo

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Paso 2 — Elija un agente de programación

REA soporta cualquier agente que hable **MCP** local. Elija uno — todos los ejemplos usan el **setup ID** del cliente (`--client <id>`).

| Cliente | Setup ID | Instalación / notas |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Instale la app, inicie sesión, luego `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` o script de instalación · inicie sesión con ChatGPT |
| Cursor | `cursor` | Instale el editor, abra la carpeta de trabajo, modo Agent |
| Windsurf | `windsurf` | Mismo patrón; chat del agente |
| VS Code | `vscode` | Configure GitHub Copilot primero, luego modo Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, ejecute `opencode`, `/connect` para su modelo, luego `--client opencode` |
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

**Grok Bot:** en el chat del bot, pídale que añada un servidor MCP personalizado llamado `rea` en su computadora alojada:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Paso 3 — Conecte REA

### Opción A — Deje que su agente lo haga (recomendado)

Pegue en el chat de su agente:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

El agente ejecuta setup, muestra el plan y lo aplica tras su aprobación.

### Opción B — Ejecute setup usted mismo

```powershell
npx rea-agents@latest setup
```

Para un cliente específico:

```powershell
npx rea-agents@latest setup --client opencode
```

Durante setup:
- **Flechas** para moverse, **Espacio** para seleccionar, **Enter** para continuar.
- REA añade una **conexión MCP** + la **habilidad de investigación**, y **respalda** la configuración existente antes del cambio.
- Los cambios se aplican solo tras su aprobación.
- En el primer ejercicio puede omitir la instalación opcional de Hopper.

### Reinicie el cliente tras setup

- Apps de escritorio (Claude Desktop, Cursor, Windsurf, VS Code): **salga por completo** y reabra (Windows: también desde el icono de la bandeja).
- Agentes de terminal (Claude Code, Codex, Gemini CLI, OpenCode): cierre la sesión y reinicie.

---

## 8. Paso 4 — Verifique la instalación

Ejecute la verificación doctor para su cliente (cambie `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Un informe sano muestra `"healthy": true`. Luego pregunte a su agente:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Paso 5 — Su primera investigación (ejemplo Notes)

El ejemplo oficial es una pequeña app Electron con un botón **Export notes**. No necesita instalar Electron — el agente lee el código.

Pegue en su agente:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Resultado esperado: clic en Export envía un mensaje IPC `notes:export`; el proceso principal formatea las notas como CSV y escribe `notes.csv` (columnas: `id`, `title`) en su carpeta Descargas.

Análisis manual desde la terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Análisis nativo (binarios / EXE / DLL)

El análisis nativo profundo necesita un proveedor. En **Windows** use **Ghidra** o **IDA** (Hopper no está disponible en Windows).

### 10.1 Ghidra (gratis) — configuración en Windows

1. Instale un **JDK de 64 bits 21 o superior** (con compilador). Verifique:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Descargue **Ghidra 12.1.4** desde la lista *Assets* del lanzamiento y extraiga `ghidra_…_PUBLIC_….zip` (el archivo del lanzamiento, **no** "Source code").
3. Anote la carpeta extraída con `ghidraRun.bat` — ese es su `GHIDRA_INSTALL_DIR`.
4. En PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # carpeta indicada por java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Sustituya las rutas por sus instalaciones. Revise el plan actualizado de setup, apruébelo y **reinicie su agente**.

> El soporte de Ghidra en Windows es **experimental y de solo lectura**, para apps/DLL PE x86/x64 nativos en unidades **NTFS** locales fijas.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

En macOS arm64 y Linux arm64, construya primero el descompilador nativo de Ghidra (en macOS se requieren Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Instale y configure el servidor MCP ascendente de IDA según la guía del proveedor IDA.
2. Guarde la configuración funcional como `ida-mcp.json`. Ejemplo (supervisor headless con `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Para un servidor GUI 1.4.0 heredado conectado, copie su command/args/env funcional (abra el binario en IDA e inicie el plugin primero).
3. Conecte:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   En macOS/Linux use `export` en lugar de `$env:`. Reinicie su agente tras setup.

> Perfiles IDA verificados: GUI heredada de Windows y supervisor headless, además del supervisor headless arm64 de macOS (IDA Professional 9.1). npm 6.4.0 no incluye el perfil headless de macOS / el puente GUI nativo — requieren una compilación de REA desde el código.

### 10.4 Hopper (solo macOS / Linux)

Setup puede detectar una instalación existente de Hopper o proponer un plan de instalación. En macOS, en el primer inicio elija modo demo o active su licencia. La instalación automática en Linux requiere un host x86_64 con Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS o Omarchy. En Linux arm64, use Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Usar un proveedor

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Análisis puntual de una función desde la CLI (Ghidra debe estar configurado):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Apps JavaScript & Electron

No se requiere motor nativo. Apunte su agente a la **carpeta** de la app o al **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Dónde guardan las apps Electron el `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: a menudo `/opt/<App>/resources/app.asar`

Análisis estático desde la terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Revise `normalized_result.summary.ipc` para canales/manejadores emparejados y `normalized_result.graph` para ubicaciones de origen. Los nombres de canal calculados pueden quedar sin resolver — use la observación del navegador (siguiente sección).

---

## 12. Observación del navegador

1. Abra la página objetivo con un navegador familia Chrome con depuración remota, p. ej.:

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

2. Pregunte a su agente:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Pásele el endpoint `http://127.0.0.1:9222` y la URL de la página. Inicie la captura **antes** de hacer clic.

   O desde la terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Para cuerpos HTTP, las exportaciones de Fiddler Everywhere (SAZ/HAR 1.2) pueden alimentar la Evidence de captura de REA, o conecte el servidor MCP de Everywhere.

---

## 13. Otros objetivos y herramientas necesarias

| Objetivo | Herramientas a preparar | Notas |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Sin motor |
| Sitio web | Chrome / Chromium / Edge | Puerto de depuración remota |
| .NET / Flutter / paquetes | Node.js + npm | Inspección estática |
| APK de Android | JADX + JDK 17+ | Descompilar `classes.dex` |
| Dispositivo Android | adb | Activar depuración USB |
| Recursos de Android | Apktool + Java | Desempaqueta recursos y manifiesto |
| Proyecto JEB | JEB + MCP | Descompilador comercial |
| Firmware | Binwalk / Unblob | **Solo Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Base de datos SQLite | Node.js 24.15+ / 26+ | |
| Bytecode EVM | Node.js | **Solo Linux x64** |
| ELF / crash de Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Análisis offline de capturas |
| PCAP / PCAPNG | TShark / capinfos | **Solo Linux** |
| Señales lógicas | sigrok-cli | **Solo Linux** |
| Comportamiento de procesos | PTY | **Linux / macOS** |

Flutter, paquetes/recursos, EVM y guías de investigación completas: https://rea.tools/guides.

---

## 14. Construya entornos RL

REA puede grabar una sesión de una app web de prueba y exportar un entorno **AgentEnv** para entrenar/evaluar agentes.

1. Prepare una instancia de app **de prueba** donde el agente pueda crear/editar/eliminar datos.
2. Pregunte a su agente (ejemplo con carpetas):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Guarde la contraseña en el entorno del servidor MCP (`APP_PASSWORD`), no en el prompt.
3. O construya directamente desde una grabación HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` revisa el informe sin escribir archivos.
4. Ejecútelo:
   ```bash
   agent-env run ./my-env
   ```
   La comprobación de compatibilidad de REA usa **AgentEnv 0.9.1334 + Python 3.12**; Docker debe estar en ejecución.
5. Solo se soportan las operaciones cuyos **efectos** se grabaron (p. ej. eliminar requiere la respuesta de elemento inexistente y la lista actualizada). Antes de compartir, revise los cuerpos de respuesta retenidos — pueden contener credenciales.

---

## 15. Use REA desde la terminal (CLI)

Sin instalar globalmente:

```powershell
npx -y rea-agents@latest --help
```

Instale el comando `rea` permanentemente:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Instalador curl para macOS / Linux (requiere Node.js primero):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Comandos frecuentes:

| Comando | Propósito |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Mapear módulos, imports, IPC, límites |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analizar una función nativa |
| `rea-agents list-browser-targets <endpoint> --json` | Listar páginas de navegador depurables |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Observar red/scripts de la página |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Construir entorno RL |
| `rea-agents environment-compare … --json` | Comparar entorno con la app real |
| `rea-agents doctor --client <id> --json` | Verificar conexión del cliente |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Verificar proveedor nativo |
| `rea-agents update` | Actualizar la CLI |
| `rea-agents uninstall` | Eliminar configuración de cliente + habilidad |

---

## 16. Actualizar o eliminar REA

**Actualizar:**
```powershell
rea update                       # si la CLI global está instalada
npx rea-agents@latest setup      # renovar conexión + habilidad; apruebe el plan, reinicie el agente
```

**Eliminar:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Solución de problemas

**El agente no ve las herramientas REA**
1. Reinicie/reconecte el cliente por completo (incluido el icono de la bandeja).
2. `npx -y rea-agents@latest doctor --client <id> --json` — si el registro falta/está obsoleto: `npx rea-agents@latest setup --client <id>`, reinicie.
3. Sigue sin aparecer: revise el error de conexión MCP del cliente; en editores, active REA en los ajustes MCP y permita sus herramientas.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Use `npx.cmd` / `npm.cmd` o `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Rutas con espacios**
Entre comillas: `"D:/my apps/tool.exe"`. En WSL, use rutas Linux e instale REA dentro de WSL.

**Límites de Ghidra en Windows**
Experimental, solo lectura, solo PE x86/x64, unidades NTFS locales fijas. Alternativa en Linux: Ghidra/Hopper. Análisis de crashes ELF nativos x64 en Linux: pwntools.

**macOS pide permiso de Automatización (Hopper)**
Ajustes del Sistema → Privacidad y seguridad → Automatización → permita la app que inicia REA, reintente.

**Primer inicio de Hopper**
Complete la elección demo vs activación de licencia antes del análisis desatendido.

**Falta `ps` en Linux**
Instale `procps` (Debian/Ubuntu: `sudo apt install procps`); REA lo necesita para comprobaciones de propiedad de procesos.

**¿Un bug?**
Actualice REA, reinicie, reintente. Luego abra un issue con: versión de REA, SO, tipo de objetivo, pasos de reproducción, salida de error, nombre del proveedor. https://github.com/morluto/rea/issues.

---

## 18. Datos, privacidad y seguridad

- REA analiza objetivos **en su máquina**; su app **no** es subida por REA.
- **El proveedor del modelo de su agente** recibe los resultados — rige su política de datos/retención. No pegue secretos ni datos de clientes en los prompts.
- Los esquemas de entrada MCP son compactos por defecto; configure `REA_MCP_INPUT_SCHEMA_PROFILE=full` en el registro MCP para guía de campos completa. Los esquemas de salida se pueden limitar con `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (o `off`).
- Las grabaciones RL pueden retener credenciales en cuerpos/encabezados — revíselas antes de compartir. Las advertencias credential-name señalan dónde revisar; **no** eliminan valores.
- Secretos tipo `APP_PASSWORD` van en el entorno del servidor MCP, no en el chat.
- Instale REA solo desde `morluto/rea`, `rea.tools` o npm `rea-agents`.

---

## 19. Lista de verificación rápida

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agente de programación instalado (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (revise y apruebe el plan)
[ ] Cliente reiniciado por completo
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Primera investigación: notes-example.zip  →  encontrar notes:export / notes.csv
[ ] (Opcional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → vuelva a ejecutar setup → reinicie el agente
[ ] (Opcional) Navegador: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: usted posee / está licenciado para analizar el objetivo
```

---

## 20. Respaldo / espejo offline (no oficial)

> ⚠️ **Lea esto primero.**
> No existe algo como un "respaldo oficial" de un proyecto oficial. El único REA oficial es **morluto/rea** (https://github.com/morluto/rea), **rea.tools** y el paquete npm **`rea-agents`**.
> Este repositorio ofrece un **espejo / archivo no oficial** completo y compatible con la licencia, conservando la licencia MIT original y los avisos de copyright. Existe para que, **si el repositorio, sitio web o paquete npm oficial desaparece**, pueda seguir obteniendo REA aquí — nada más.
> Mientras las fuentes oficiales existan, **úselas**. No presente este respaldo como "oficial" ni lo redistribuya como "el REA oficial". Este repositorio no está afiliado ni respaldado por los autores de REA.

**Licencia:** REA usa MIT — permite copia, modificación y redistribución con aviso. La licencia completa, encabezados de copyright y avisos de terceros se conservan en la rama espejo y en el tarball npm. Sin garantía de ningún tipo.

### Qué incluye el respaldo

| Parte del respaldo | Dónde | Qué es |
|---|---|---|
| Espejo de fuente | Rama **`mirror/rea`** | Historial git completo del `main` oficial de `morluto/rea` (al último sync — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Etiquetas de lanzamiento | Etiquetas **`rea-agents-*.*.*`** | Todas las etiquetas de lanzamiento oficiales, apuntando a los commits oficiales exactos (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | El paquete npm oficial, preconstruido (incluye `dist/`) — instala **completamente offline** |
| Script de sincronización | **`scripts/sync-backup.ps1`** | Actualiza la rama espejo, etiquetas y el tarball npm más reciente desde las fuentes oficiales |
| Script de restauración | **`scripts/restore-backup.ps1`** | Instalación offline de una pasada del tarball + pasos siguientes |
| La guía | `README.md` (maestro en inglés) | Guía de configuración completa; válida sin importar la fuente de REA |

### Mantenga el respaldo actualizado

Ejecútelo semanalmente (o antes de depender de él):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Hace fetch de `upstream/main` + todas las etiquetas, actualiza por la fuerza `mirror/rea`, hace push de las etiquetas, empaqueta el último `rea-agents-*.*.*` en `backup/` con `npm pack` e imprime los comandos finales `git add`/`commit`/`push` para el tarball.

### Escenarios de restauración

**Escenario A — GitHub caído, npm funciona:** nada que restaurar. Siga usando `npx rea-agents@latest setup`.

**Escenario B — GitHub + npm caídos:** instale el tarball preconstruido desde este repo (sin red, sin herramientas de build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# o manualmente:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
`rea setup` registra el servidor MCP + la habilidad con su agente igual que el `npx rea-agents setup` oficial — completamente offline, sin tocar el registro.

**Escenario C — También quiere la fuente/historial completo:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Fuente oficial completa al momento del último sync.
```

Construir desde la fuente requiere Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ y acceso de red al registro npm (turbo monorepo; `npm ci && npm run build`). La vía del tarball (Escenario B) no requiere ninguno — prefiera siempre esta para restaurar.

### Verifique lo restaurado
```powershell
# Integridad del espejo — el commit debe coincidir con el último upstream/main sincronizado:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # tras clonar la rama espejo
# Integridad del tarball — versión reportada por la propia CLI:
rea --version
```

Si los hashes se desvían de lo registrado al hacer el respaldo, trate la copia como sospechosa y vuelva a sincronizar desde las fuentes oficiales (si están de vuelta) antes de confiar en ella.

### Lo que este respaldo NO garantiza

- Sin parches de seguridad tras el último sync — un respaldo abandonado es una instantánea obsoleta.
- El paquete npm oficial puede traer hotfixes más recientes que `mirror/rea` o el tarball.
- Los servicios anexos (sitio rea.tools, Discord, notas de lanzamiento, sitio de docs) son material de referencia, no código restaurable desde aquí.
- Si REA se relanza después con otro nombre/propietario, esta instantánea sigue funcionando como upstream archivado — migre deliberadamente, no asuma compatibilidad.

---

**Enlaces**
- Sitio: https://rea.tools/ · Empezar: https://rea.tools/get-started/ · Guías: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Fuente: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Comunidad: Discord (ver pie de rea.tools) · X: https://x.com/reatools
- **Respaldo de este repo:** rama `mirror/rea` · etiquetas `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
