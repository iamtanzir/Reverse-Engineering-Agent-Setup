# Reverse Engineering Agent — Guia completo de configuração

> **Idiomas:** <img src="https://flagcdn.com/w20/gb.png" width="20" height="15" alt="GB"> [English](../README.md) (principal / autoritativo) · <img src="https://flagcdn.com/w20/cn.png" width="20" height="15" alt="CN"> [简体中文](README.zh-CN.md) · <img src="https://flagcdn.com/w20/tw.png" width="20" height="15" alt="TW"> [繁體中文](README.zh-TW.md) · <img src="https://flagcdn.com/w20/jp.png" width="20" height="15" alt="JP"> [日本語](README.ja.md) · <img src="https://flagcdn.com/w20/kr.png" width="20" height="15" alt="KR"> [한국어](README.ko.md) · <img src="https://flagcdn.com/w20/tr.png" width="20" height="15" alt="TR"> [Türkçe](README.tr.md) · <img src="https://flagcdn.com/w20/ru.png" width="20" height="15" alt="RU"> [Русский](README.ru.md) · <img src="https://flagcdn.com/w20/vn.png" width="20" height="15" alt="VN"> [Tiếng Việt](README.vi.md) · <img src="https://flagcdn.com/w20/th.png" width="20" height="15" alt="TH"> [ไทย](README.th.md) · <img src="https://flagcdn.com/w20/de.png" width="20" height="15" alt="DE"> [Deutsch](README.de.md) · <img src="https://flagcdn.com/w20/es.png" width="20" height="15" alt="ES"> [Español](README.es.md) · <img src="https://flagcdn.com/w20/fr.png" width="20" height="15" alt="FR"> [Français](README.fr.md) · <img src="https://flagcdn.com/w20/ua.png" width="20" height="15" alt="UA"> [Українська](README.uk.md) · <img src="https://flagcdn.com/w20/pl.png" width="20" height="15" alt="PL"> [Polski](README.pl.md) · <img src="https://flagcdn.com/w20/br.png" width="20" height="15" alt="BR"> [Português (Brasil)](README.pt-BR.md) · <img src="https://flagcdn.com/w20/sa.png" width="20" height="15" alt="SA"> [العربية](README.ar.md) · <img src="https://flagcdn.com/w20/ir.png" width="20" height="15" alt="IR"> [فارسی](README.fa.md) · <img src="https://flagcdn.com/w20/id.png" width="20" height="15" alt="ID"> [Bahasa Indonesia](README.id.md) · <img src="https://flagcdn.com/w20/it.png" width="20" height="15" alt="IT"> [Italiano](README.it.md) · <img src="https://flagcdn.com/w20/gr.png" width="20" height="15" alt="GR"> [Ελληνικά](README.el.md) · <img src="https://flagcdn.com/w20/in.png" width="20" height="15" alt="IN"> [മലയാളം](README.ml.md) · <img src="https://flagcdn.com/w20/pk.png" width="20" height="15" alt="PK"> [Roman Urdu](README.ur-Latn.md) · <img src="https://flagcdn.com/w20/ro.png" width="20" height="15" alt="RO"> [Română](README.ro.md) · <img src="https://flagcdn.com/w20/bg.png" width="20" height="15" alt="BG"> [Български](README.bg.md)
>
> ℹ️ Esta tradução reflete o mestre em inglês. Em caso de divergência, **o inglês prevalece**. Blocos de código, caminhos e comandos nunca são traduzidos.

> **REA — Reverse Engineer Anything**
> Um servidor MCP (Model Context Protocol) + habilidade de investigação, dando ao seu agente de código ferramentas para inspecionar software — binários nativos, apps JavaScript/Electron, navegadores, .NET, Android, firmware e mais.

- **Site oficial:** https://rea.tools/
- **Código-fonte oficial:** https://github.com/morluto/rea
- **Pacote npm:** `rea-agents`
- **Licença:** MIT (o próprio REA). As ferramentas de análise de terceiros têm suas próprias licenças.
- **📚 [PLATFORM-GUIDE.md](../PLATFORM-GUIDE.md)** (em inglês) — configuração passo a passo por plataforma (Windows primeiro: Electron, Web, .NET, Android, WASM, Native/Ghidra, WSL2) com solução de problemas
- **📦 Backup offline incluso** — espelho não oficial do repositório oficial + tarball npm; apenas para o caso de as fontes oficiais sumirem. Veja **[Seção 20 — Backup / espelho offline (não oficial)](#20-offline-backup--mirror-unofficial)**.

> ⚠️ **Importante:** Baixe o REA somente de `morluto/rea`, `rea.tools` ou do pacote npm `rea-agents`. Um nome de repositório parecido não é prova de lançamento oficial.

---

## Sumário

1. O que é o REA (e o que não é)
2. Uso legal e responsável
3. O que você pode analisar
4. Requisitos do sistema
5. Etapa 1 — Prepare seu computador
6. Etapa 2 — Escolha um agente de código
7. Etapa 3 — Conecte o REA
8. Etapa 4 — Verifique a instalação
9. Etapa 5 — Sua primeira investigação (exemplo Notes)
10. Análise nativa (binários / EXE / DLL)
11. Apps JavaScript & Electron
12. Observação do navegador
13. Outros alvos e ferramentas necessárias
14. Crie ambientes RL
15. Use o REA pelo terminal (CLI)
16. Atualizar ou remover o REA
17. Solução de problemas
18. Dados, privacidade e segurança
19. Checklist de referência rápida
20. Backup / espelho offline (não oficial)

---

## 1. O que é o REA (e o que não é)

**O REA é:**
- Um servidor MCP local + habilidade de agente — permite que **seu agente de código** inspecione softwares que você tem localmente.
- Retorna **evidências**: assembly, pseudocódigo, mapas de módulos, emparelhamentos de canais IPC, tráfego de rede capturado, localizações de código — não o código-fonte original.
- A análise roda **na sua máquina**. Seu app não é enviado pelo REA; o provedor de modelo do seu agente vê os resultados (veja [Dados e privacidade](#18-data-privacy--security)).

**O REA não é:**
- Um botão mágico de "voltar ao código-fonte". Os resultados são assembly/pseudocódigo e referências; seu agente explica e ajuda a reconstruir o comportamento.
- Uma ferramenta para quebrar licenças/DRM ou burlar ativação paga. Não use para isso.
- Um contorno de ofuscação. Alvos fortemente empacotados/protegidos (VMProtect, Themida, anti-tamper) continuam extremamente difíceis.
- Um acesso ao lado do servidor. Não dá para inspecionar um servidor atrás de uma API; só o lado cliente/rede é visível.

---

## 2. Uso legal e responsável

A engenharia reversa pode ser legal para interoperabilidade, pesquisa de segurança, depuração e análise de software que você **possui** — mas leis e licenças variam conforme a jurisdição.

**Você deve:**
- Analisar software que você possui, tem licença para usar ou permissão para inspecionar.
- Respeitar acordos de licença, Termos de Serviço e regras anti-burla da DMCA.
- Usar os achados para interoperabilidade, educação e segurança defensiva.

**Você não deve:**
- Burlar DRM, ativação de licença ou proteção anticópia.
- Distribuir código quebrado/vazado de software proprietário.
- Analisar alvos que você não tem direito de possuir ou inspecionar.

Este guia não é aconselhamento jurídico. Em caso de dúvida, consulte um advogado.

---

## 3. O que você pode analisar

| Alvo | O que o REA retorna | Motor nativo necessário? |
|---|---|---|
| Binários nativos / bibliotecas (EXE, DLL, ELF, Mach-O) | Funções, assembly, pseudocódigo, chamadores, xrefs, constantes | Sim — Hopper, Ghidra ou IDA |
| Apps JavaScript & Electron | Módulos, imports, canais IPC + handlers, localizações de código | Não |
| Páginas de navegador (runtime) | Requisições/respostas, scripts, formatos de corpo JSON, janela de observação | Navegador família Chrome |
| Assemblies .NET / Flutter / pacotes | Inspeção de módulos e recursos | Não |
| APKs Android / dispositivos / recursos | Classes descompiladas, recursos, interação com dispositivos | JADX / adb / Apktool |
| Firmware | Sistemas de arquivos/blobs extraídos | Binwalk / Unblob (Linux) |
| WASM | Inspeção de módulos e funções | WABT |
| Bancos SQLite | Inspeção de esquema e consultas | Node.js 24.15+ / 26+ |
| Bytecode EVM | Estrutura do contrato | Node.js (Linux x64) |
| Capturas HAR / SAZ / mitmproxy | Evidência de tráfego parseado | Node.js / mitmdump |
| PCAP / PCAPNG | Fatos de pacotes/protocolos | TShark / capinfos (Linux) |

---

## 4. Requisitos do sistema

**Mínimo:**
- Node.js **22.23.4+**, **24.22.1+** ou **26+ (>= 26.12.1)** (npm incluído)
- Um agente de código compatível (etapa 2)
- Um diretório de trabalho para suas investigações

**Para análise nativa (binário)** — um de:
- **Ghidra 12.1.x** + **JDK 21+** de 64 bits (grátis, recomendado no Windows)
- **IDA** (comercial; perfis verificados: GUI legada do Windows + supervisor headless)
- **Hopper** (comercial; macOS e parte do Linux — **indisponível no Windows**)

**Notas de SO:**
- Windows: use **PowerShell**; entre aspas caminhos com espaços. Se seu agente roda no WSL, instale Node.js + REA **dentro** do WSL e use caminhos do Linux.
- Linux: um `ps` compatível com `procps` no `PATH` (para iniciar Ghidra/JADX/firmware e análise estática).
- macOS: use o Terminal; algumas etapas exigem Xcode Command Line Tools (compilar o descompilador do Ghidra no arm64).

---

## 5. Etapa 1 — Prepare seu computador

### 5.1 Verifique o Node.js

```powershell
node -v
npm -v
```

Esperado: `v22.23.4+`, `v24.22.1+` ou `v26.12.1+`. Mais antigo → instale o Node.js 24 LTS.

### 5.2 Instale o Node.js no Windows (se faltar)

```powershell
winget install --exact --id OpenJS.NodeJS.LTS
```

Digite `Y` se pedirem para aceitar os termos, feche e reabra o PowerShell e verifique `node -v`. (Alternativa: baixe o instalador LTS de https://nodejs.org/.)

> **Peculiaridade do PowerShell:** se `npx` falhar com "running scripts is disabled on this system", use `npx.cmd` e `npm.cmd`:
> ```powershell
> npx.cmd rea-agents@latest setup
> ```

### 5.3 (macOS)

Baixe o `.pkg` do Node.js 24 LTS, ou com Homebrew: `brew install node`.

### 5.4 (Linux)

```bash
sudo apt install curl unzip          # Debian/Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
# reabra o shell, depois:
fnm install 24 && fnm use 24 && fnm default 24
```

### 5.5 Crie uma pasta de trabalho

```powershell
mkdir rea-work
cd rea-work
```

---

## 6. Etapa 2 — Escolha um agente de código

O REA suporta qualquer agente que fale **MCP** local. Escolha um — todos os exemplos usam o **setup ID** do cliente (`--client <id>`).

| Cliente | Setup ID | Instalação / notas |
|---|---|---|
| Claude Code | `claude_code` | `irm https://claude.ai/install.ps1 \| iex` (Win) · `curl -fsSL https://claude.ai/install.sh \| bash` (macOS/Linux) |
| Claude Desktop | `claude_desktop` | Instale o app, faça login, depois `npx rea-agents@latest setup --client claude_desktop` |
| Codex | `codex` | `npm i -g @openai/codex` ou script de instalação · login com ChatGPT |
| Cursor | `cursor` | Instale o editor, abra a pasta de trabalho, modo Agent |
| Windsurf | `windsurf` | Mesmo padrão; chat do agente |
| VS Code | `vscode` | Configure o GitHub Copilot primeiro, depois modo Agent |
| OpenCode | `opencode` | `npm install --global opencode-ai`, rode `opencode`, `/connect` para seu modelo, depois `--client opencode` |
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

**Grok Bot:** no chat do bot, peça para adicionar um servidor MCP personalizado chamado `rea` no computador dele:
```
npx -y rea-agents@6.4.0 mcp
```

---

## 7. Etapa 3 — Conecte o REA

### Opção A — Deixe o agente fazer (recomendado)

Cole no chat do seu agente:

```
Install REA and connect it to this coding agent using npx rea-agents@latest setup.
Show me the setup plan for approval, then verify the installation.
```

O agente roda o setup, mostra o plano e aplica após a sua aprovação.

### Opção B — Rode o setup você mesmo

```powershell
npx rea-agents@latest setup
```

Para um cliente específico:

```powershell
npx rea-agents@latest setup --client opencode
```

Durante o setup:
- **Setas** para mover, **Espaço** para selecionar, **Enter** para continuar.
- O REA adiciona uma **conexão MCP** + a **habilidade de investigação** e **faz backup** da configuração atual antes de alterar.
- As mudanças só valem após a sua aprovação.
- No primeiro exercício, a instalação opcional do Hopper pode ser pulada.

### Reinicie o cliente após o setup

- Apps de desktop (Claude Desktop, Cursor, Windsurf, VS Code): **saia completamente** e reabra (Windows: também pelo ícone na bandeja).
- Agentes de terminal (Claude Code, Codex, Gemini CLI, OpenCode): encerre a sessão e reinicie.

---

## 8. Etapa 4 — Verifique a instalação

Rode o diagnóstico doctor para seu cliente (troque `<client_id>`):

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

Um relatório saudável mostra `"healthy": true`. Depois pergunte ao seu agente:

```
Check that REA is connected and show me which REA tools you can use.
```

---

## 9. Etapa 5 — Sua primeira investigação (exemplo Notes)

O exemplo oficial é um app Electron pequeno com um botão **Export notes**. Não precisa instalar o Electron — o agente lê o código.

Cole no seu agente:

```
Download https://rea.tools/examples/notes-example.zip into a new example
folder and unpack it. Use REA to find what happens when I click Export notes.
Show where notes.csv is written, which fields it contains, and the relevant
files and lines.
```

Resultado esperado: clicar em Export envia uma mensagem IPC `notes:export`; o processo principal formata as notas como CSV e grava `notes.csv` (colunas: `id`, `title`) na sua pasta Downloads.

Análise manual pelo terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "C:\path\to\notes-example" --json
```

---

## 10. Análise nativa (binários / EXE / DLL)

Análise nativa profunda exige um provedor. No **Windows**, use **Ghidra** ou **IDA** (Hopper não está disponível no Windows).

### 10.1 Ghidra (grátis) — configuração no Windows

1. Instale um **JDK 64 bits 21 ou superior** (com compilador). Verifique:
   ```powershell
   java -XshowSettings:properties -version
   javac -version
   ```
2. Baixe o **Ghidra 12.1.4** na lista *Assets* do lançamento e extraia o `ghidra_…_PUBLIC_….zip` (o arquivo do lançamento, **não** "Source code").
3. Anote a pasta extraída com o `ghidraRun.bat` — é o seu `GHIDRA_INSTALL_DIR`.
4. No PowerShell:
   ```powershell
   $env:GHIDRA_INSTALL_DIR = "C:/tools/ghidra_12.1.4_PUBLIC"
   $env:JAVA_HOME = "C:/tools/jdk-21"   # pasta indicada por java.home
   npx -y rea-agents@latest doctor --provider ghidra --json
   npx rea-agents@latest setup
   ```
   Ajuste os caminhos para suas instalações. Revise o plano atualizado do setup, aprove e **reinicie seu agente**.

> O suporte ao Ghidra no Windows é **experimental e somente leitura**, para apps/DLLs PE x86/x64 nativos em unidades **NTFS** locais fixas.

### 10.2 Ghidra — macOS / Linux

```bash
export GHIDRA_INSTALL_DIR="/absolute/path/to/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="/absolute/path/to/jdk-21"
npx -y rea-agents@latest doctor --provider ghidra --json
npx rea-agents@latest setup
```

No macOS arm64 e no Linux arm64, compile primeiro o descompilador nativo do Ghidra (no macOS são necessários Xcode Command Line Tools, make, bison).

### 10.3 IDA

1. Instale e configure o servidor MCP upstream do IDA conforme o guia do provedor IDA.
2. Salve a configuração funcional como `ida-mcp.json`. Exemplo (supervisor headless com `idb_open`/`idb_list`/`idb_close`):
   ```json
   {
     "command": "idalib-mcp",
     "args": ["--stdio", "--max-workers", "1"],
     "mode": "headless"
   }
   ```
   Para um servidor GUI legado 1.4.0 conectado, copie o command/args/env funcional dele (abra o binário no IDA e inicie o plugin primeiro).
3. Conecte:
   ```powershell
   $env:REA_IDA_MCP_CONFIG = "C:/analysis/ida-mcp.json"
   $env:REA_ANALYSIS_PROVIDER = "ida"
   npx -y rea-agents@latest doctor --provider ida --json
   npx rea-agents@latest setup
   ```
   No macOS/Linux use `export` em vez de `$env:`. Reinicie seu agente após o setup.

> Perfis IDA verificados: GUI legada do Windows e supervisor headless, mais o supervisor headless arm64 do macOS (IDA Professional 9.1). O npm 6.4.0 não inclui o perfil headless do macOS / a ponte GUI nativa — exigem build do REA a partir do fonte.

### 10.4 Hopper (somente macOS / Linux)

O setup pode detectar uma instalação existente do Hopper ou propor um plano de instalação. No macOS, no primeiro início, escolha o modo demo ou ative sua licença. A instalação automática no Linux exige um host x86_64 com Ubuntu 24.04+, Fedora 41+, Nobara 44+, Arch, CachyOS ou Omarchy. No Linux arm64, use o Ghidra.

```bash
npx -y rea-agents@latest doctor --provider hopper --json
```

### 10.5 Usando um provedor

```text
Use REA with my configured provider to inspect C:\path\to\program.exe.
List its functions and strings, then explain the part that handles user
input with references to the code.
```

Análise pontual de uma função pela CLI (Ghidra precisa estar configurado):

```powershell
npx -y rea-agents@latest function "C:\path\to\program.exe" main --provider ghidra --json
```

---

## 11. Apps JavaScript & Electron

Nenhum motor nativo é necessário. Aponte seu agente para a **pasta** do app ou para o **.asar**:

```text
Use REA to find what happens when I export notes in this app. Where is the CSV created?
```

Onde os apps Electron guardam o `app.asar`:
- Windows: `C:\Users\<you>\AppData\Local\Programs\<App>\resources\app.asar`
- macOS: `/Applications/<App>.app/Contents/Resources/app.asar`
- Linux: geralmente `/opt/<App>/resources/app.asar`

Análise estática pelo terminal:

```powershell
npx -y rea-agents@latest analyze-javascript-application "D:/apps/example" --json
```

Consulte `normalized_result.summary.ipc` para canais/handlers emparelhados e `normalized_result.graph` para localizações de código. Nomes de canais calculados podem ficar sem resolução — nesse caso use a observação do navegador (próxima seção).

---

## 12. Observação do navegador

1. Abra a página-alvo em um navegador família Chrome com depuração remota, ex.:

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

2. Pergunte ao seu agente:
   ```text
   Use REA to inspect this page while I click Export notes.
   What request does it make, and how is the CSV built?
   ```
   Passe o endpoint `http://127.0.0.1:9222` e a URL da página. Inicie a captura **antes** de clicar.

   Ou pelo terminal:
   ```bash
   npx -y rea-agents@latest list-browser-targets http://127.0.0.1:9222 --json
   npx -y rea-agents@latest inspect-web-page http://127.0.0.1:9222 TARGET_ID \
     --observation-ms 10000 --include-accessibility-text --include-json-body-shapes --json
   ```

Para corpos HTTP, as exportações do Fiddler Everywhere (SAZ/HAR 1.2) podem alimentar a Evidence de captura do REA, ou conecte o servidor MCP do Everywhere.

---

## 13. Outros alvos e ferramentas necessárias

| Alvo | Ferramentas a preparar | Notas |
|---|---|---|
| JavaScript / Electron | Node.js + npm | Sem motor |
| Website | Chrome / Chromium / Edge | Porta de depuração remota |
| .NET / Flutter / pacotes | Node.js + npm | Inspeção estática |
| APK Android | JADX + JDK 17+ | Descompilar `classes.dex` |
| Dispositivo Android | adb | Ativar depuração USB |
| Recursos Android | Apktool + Java | Desempacota recursos e manifesto |
| Projeto JEB | JEB + MCP | Descompilador comercial |
| Firmware | Binwalk / Unblob | **Somente Linux** |
| WASM | WABT (`wat2wasm`, `wasm2wat`) | |
| Banco SQLite | Node.js 24.15+ / 26+ | |
| Bytecode EVM | Node.js | **Somente Linux x64** |
| ELF / crash Linux | pwntools, GDB, pwndbg | |
| HAR / SAZ / mitmproxy | Node.js / mitmdump | Análise offline de capturas |
| PCAP / PCAPNG | TShark / capinfos | **Somente Linux** |
| Sinais lógicos | sigrok-cli | **Somente Linux** |
| Comportamento de processos | PTY | **Linux / macOS** |

Flutter, pacotes/recursos, EVM e guias de investigação completos: https://rea.tools/guides.

---

## 14. Crie ambientes RL

O REA pode gravar uma sessão de app web de teste e exportar um ambiente **AgentEnv** para treinar/avaliar agentes.

1. Prepare uma instância de app **de teste** onde o agente possa criar/editar/excluir dados.
2. Pergunte ao seu agente (exemplo com pastas):
   ```text
   Use REA to build an AgentEnv environment from my test web app at
   http://127.0.0.1:3000. Cover listing, creating, renaming, and deleting
   folders. Sign in as admin using the password in APP_PASSWORD. Use the
   browser at /path/to/chromium and export to /path/to/my-env (it must not
   exist yet). Report supported operations and any gaps.
   ```
   Mantenha a senha no ambiente do servidor MCP (`APP_PASSWORD`), não no prompt.
3. Ou construa direto de uma gravação HAR:
   ```bash
   npx -y rea-agents@latest environment-build ./session.har ./my-env --name my-env --json
   ```
   `--dry-run` revisa o relatório sem escrever arquivos.
4. Execute:
   ```bash
   agent-env run ./my-env
   ```
   A verificação de compatibilidade do REA usa **AgentEnv 0.9.1334 + Python 3.12**; o Docker deve estar em execução.
5. Só são suportadas operações cujos **efeitos** foram gravados (ex.: excluir exige a resposta de item ausente e a lista atualizada). Antes de compartilhar, revise os corpos de resposta retidos — podem conter credenciais.

---

## 15. Use o REA pelo terminal (CLI)

Sem instalar globalmente:

```powershell
npx -y rea-agents@latest --help
```

Instale o comando `rea` permanentemente:

```powershell
npm install --global rea-agents
rea --help
rea update
```

Instalador curl para macOS / Linux (requer Node.js primeiro):

```bash
curl -fsSL https://raw.githubusercontent.com/morluto/rea/main/install.sh | bash
rea setup
```

Comandos frequentes:

| Comando | Objetivo |
|---|---|
| `rea-agents analyze-javascript-application <path\|app.asar> --json` | Mapear módulos, imports, IPC, fronteiras |
| `rea-agents function <binary> <name-or-addr> --provider ghidra --json` | Analisar uma função nativa |
| `rea-agents list-browser-targets <endpoint> --json` | Listar páginas de navegador depuráveis |
| `rea-agents inspect-web-page <endpoint> <id> --observation-ms 10000 --json` | Observar rede/scripts da página |
| `rea-agents environment-build <recording.har> <out-dir> --name <n> --json` | Construir ambiente RL |
| `rea-agents environment-compare … --json` | Comparar ambiente com o app real |
| `rea-agents doctor --client <id> --json` | Verificar conexão do cliente |
| `rea-agents doctor --provider <ghidra\|ida\|hopper> --json` | Verificar provedor nativo |
| `rea-agents update` | Atualizar a CLI |
| `rea-agents uninstall` | Remover configuração do cliente + habilidade |

---

## 16. Atualizar ou remover o REA

**Atualizar:**
```powershell
rea update                       # se a CLI global estiver instalada
npx rea-agents@latest setup      # renovar conexão + habilidade; aprove o plano, reinicie o agente
```

**Remover:**
```powershell
npx rea-agents@latest uninstall
```

---

## 17. Solução de problemas

**O agente não enxerga as ferramentas do REA**
1. Reinicie/reconecte o cliente por completo (incluindo o ícone da bandeja).
2. `npx -y rea-agents@latest doctor --client <id> --json` — se o registro estiver ausente/desatualizado: `npx rea-agents@latest setup --client <id>`, reinicie.
3. Ainda não aparece: verifique o erro de conexão MCP do cliente; em editores, ative o REA nas configurações MCP e permita suas ferramentas.

**`npx` — "running scripts is disabled" (Windows PowerShell)**
Use `npx.cmd` / `npm.cmd` ou `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

**Caminhos com espaços**
Entre aspas: `"D:/my apps/tool.exe"`. No WSL, use caminhos do Linux e instale o REA dentro do WSL.

**Limites do Ghidra no Windows**
Experimental, somente leitura, apenas PE x86/x64, unidades NTFS locais fixas. Alternativa Linux: Ghidra/Hopper. Análise de crashes ELF nativos x64 no Linux: pwntools.

**macOS pede permissão de Automação (Hopper)**
Ajustes do Sistema → Privacidade e Segurança → Automação → permita o app que inicia o REA, tente de novo.

**Primeiro início do Hopper**
Conclua a escolha modo demo vs ativação de licença antes de análises não supervisionadas.

**Falta `ps` no Linux**
Instale `procps` (Debian/Ubuntu: `sudo apt install procps`); o REA precisa dele para verificações de propriedade de processos.

**Um bug?**
Atualize o REA, reinicie, tente de novo. Depois abra uma issue com: versão do REA, SO, tipo de alvo, passos de reprodução, saída de erro, nome do provedor. https://github.com/morluto/rea/issues.

---

## 18. Dados, privacidade e segurança

- O REA analisa alvos **na sua máquina**; seu app **não** é enviado pelo REA.
- **O provedor de modelo do seu agente** recebe os resultados — vale a política de dados/retenção dele. Não cole segredos ou dados de clientes nos prompts.
- Os esquemas de entrada MCP são compactos por padrão; defina `REA_MCP_INPUT_SCHEMA_PROFILE=full` no registro MCP para orientação completa dos campos. Esquemas de saída podem ser limitados com `REA_MCP_OUTPUT_SCHEMA_PROFILE=compact` (ou `off`).
- Gravações de ambientes RL podem reter credenciais em corpos/cabeçalhos — revise antes de compartilhar. Os avisos credential-name indicam onde revisar; eles **não** removem valores.
- Segredos tipo `APP_PASSWORD` ficam no ambiente do servidor MCP, não no chat.
- Instale o REA somente de `morluto/rea`, `rea.tools` ou npm `rea-agents`.

---

## 19. Checklist de referência rápida

```text
[ ] Node.js >= 22.23.4 / 24.22.1 / 26.12.1  (node -v)
[ ] Agente de código instalado (OpenCode / Claude Code / Codex / Cursor / ...)
[ ] npx rea-agents@latest setup --client <id>   (revise e aprove o plano)
[ ] Cliente reiniciado completamente
[ ] npx -y rea-agents@latest doctor --client <id> --json  → "healthy": true
[ ] Primeira investigação: notes-example.zip  →  encontrar notes:export / notes.csv
[ ] (Opcional) Native: JDK 21+ + Ghidra 12.1.4 → GHIDRA_INSTALL_DIR, JAVA_HOME
[ ]     doctor --provider ghidra --json → rode setup de novo → reinicie o agente
[ ] (Opcional) Navegador: Chrome --remote-debugging-port=9222 + inspect-web-page
[ ] Legal: você possui / tem licença para analisar o alvo
```

---

## 20. Backup / espelho offline (não oficial)

> ⚠️ **Leia isto primeiro.**
> Não existe "backup oficial" de um projeto oficial. O único REA oficial é **morluto/rea** (https://github.com/morluto/rea), **rea.tools** e o pacote npm **`rea-agents`**.
> Este repositório oferece um **espelho / arquivo não oficial** completo e compatível com a licença, preservando a licença MIT original e os avisos de copyright. Ele existe para que, **se o repositório, o site ou o pacote npm oficial sumirem**, você ainda possa obter o REA aqui — nada além disso.
> Enquanto as fontes oficiais existirem, **use-as**. Não apresente este backup como "oficial" nem o redistribua como "o REA oficial". Este repositório não é afiliado nem endossado pelos autores do REA.

**Licença:** o REA usa MIT — permite cópia, modificação e redistribuição com aviso. A licença completa, cabeçalhos de copyright e avisos de terceiros são preservados tanto no ramo espelho quanto no tarball npm. Sem garantia de qualquer tipo.

### O que o backup contém

| Parte do backup | Onde | O que é |
|---|---|---|
| Espelho do fonte | Ramo **`mirror/rea`** | Histórico git completo do `main` oficial `morluto/rea` (no último sync — v6.9.0, commit `cdc4541ef707f256f83abe5018df01a25182cf0b`) |
| Tags de lançamento | Tags **`rea-agents-*.*.*`** | Todas as tags de lançamento oficiais, apontando para os commits oficiais exatos (v2.7.0 → v6.9.0) |
| Tarball npm | **`backup/rea-agents-6.9.0.tgz`** | O pacote npm oficial, pré-compilado (inclui `dist/`) — instala **totalmente offline** |
| Script de sincronização | **`scripts/sync-backup.ps1`** | Atualiza o ramo espelho, as tags e o tarball npm mais recente a partir das fontes oficiais |
| Script de restauração | **`scripts/restore-backup.ps1`** | Instalação offline em um passo do tarball + próximos passos |
| O guia | `README.md` (mestre em inglês) | Guia completo de configuração; válido independentemente da fonte do REA |

### Mantenha o backup atualizado

Rode semanalmente (ou antes de depender dele):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-backup.ps1
```

Ele faz fetch de `upstream/main` + todas as tags, atualiza por força `mirror/rea`, envia as tags, empacota a `rea-agents-*.*.*` mais recente em `backup/` com `npm pack` e imprime os comandos finais `git add`/`commit`/`push` para o tarball.

### Cenários de restauração

**Cenário A — GitHub fora do ar, npm funcionando:** nada a restaurar. Continue `npx rea-agents@latest setup`.

**Cenário B — GitHub + npm fora do ar:** instale o tarball pré-compilado deste repo (sem rede, sem ferramentas de build):
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore-backup.ps1
# ou manualmente:
npm install --global .\backup\rea-agents-6.9.0.tgz
rea setup
rea doctor --client <your-client-id> --json
```
O `rea setup` registra o servidor MCP + a habilidade com seu agente exatamente como o `npx rea-agents setup` oficial — totalmente offline, sem tocar no registry.

**Cenário C — Você também quer o fonte/histórico completo:**
```powershell
git clone --branch mirror/rea --single-branch https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git rea-source
cd rea-source
# Fonte oficial completo no momento do último sync.
```

Construir a partir do fonte exige Node.js 22.23.4+ / 24.22.1+ / 26.12.1+ e acesso de rede ao registry npm (turbo monorepo; `npm ci && npm run build`). O caminho do tarball (Cenário B) não exige nenhum dos dois — prefira sempre ele para restaurar.

### Verifique o que você restaurou
```powershell
# Integridade do espelho — o commit deve coincidir com o último upstream/main sincronizado:
git ls-remote https://github.com/iamtanzir/Reverse-Engineering-Agent-Setup.git refs/heads/mirror/rea
git log mirror/rea -1 --format="%H %s"     # após clonar o ramo espelho
# Integridade do tarball — versão reportada pela própria CLI:
rea --version
```

Se os hashes divergirem do que você registrou no momento do backup, trate a cópia como suspeita e sincronize novamente das fontes oficiais (se já voltaram) antes de confiar nela.

### O que este backup NÃO garante

- Sem correções de segurança após o último sync — um backup abandonado é um instantâneo desatualizado.
- O pacote npm oficial pode conter hotfixes mais novos que `mirror/rea` ou o tarball.
- Serviços anexos (site rea.tools, Discord, notas de lançamento, site de documentação) são material de referência, não código restaurável daqui.
- Se o REA for relançado depois com outro nome/dono, este instantâneo continuará funcionando como upstream arquivado — migre deliberadamente, não presuma compatibilidade.

---

**Links**
- Site: https://rea.tools/ · Começar: https://rea.tools/get-started/ · Guias: https://rea.tools/guides/
- FAQ: https://rea.tools/faq/ · Showcases: https://rea.tools/showcases/
- Fonte: https://github.com/morluto/rea (MIT) · Issues: https://github.com/morluto/rea/issues
- Comunidade: Discord (veja o rodapé de rea.tools) · X: https://x.com/reatools
- **Backup deste repo:** ramo `mirror/rea` · tags `rea-agents-*` · `backup/` · `scripts/sync-backup.ps1` · `scripts/restore-backup.ps1`
