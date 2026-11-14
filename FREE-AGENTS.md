<p align="center">
  <img src="assets/banner.svg" alt="REA banner - Reverse Engineer Anything" width="100%">
</p>

# Free AI Agents for REA — Zero-Cost Setup

> **REA is not an AI agent.** REA is an **MCP server + investigation skill**. It gives your coding agent tools to inspect software; the **agent** (and the model behind it) does the reasoning, the planning, and the explanations. So "a free REA" only ever means: *a free agent + a free model + REA connected to it*. This guide covers exactly that.

> ℹ️ English is authoritative here; translations of this page may lag behind. Free tiers and model names change constantly — always verify quotas and pricing on the provider's own page before relying on them.

> 🧪 **Scope of the claims:** only the stack described in [section 11](#11-verification-scope-what-was-tested-and-what-was-not) was actually installed and run. Everything else on this page comes from vendor documentation, so treat it as a starting point rather than a guarantee.

---

## Contents

1. How the pieces fit
2. Three kinds of "free"
3. Recommended zero-cost stacks (at a glance)
4. Stack A — OpenCode + free model (easiest)
5. Stack B — Fully local with Ollama (no account, no quota)
6. Stack C — Other free agents worth knowing
7. Connecting REA to whichever agent you picked
8. What free actually costs you (limits, privacy, quality)
9. Hardware guide for local models
10. Common mistakes
11. Verification scope: what was tested and what was not
12. Links

---

## 1. How the pieces fit

```text
you  →  coding agent (client)  →  model (cloud or local)  →  tool calls
                ↕
        REA MCP server + skill  →  local analysis on your machine
```

- **REA** supplies tools: JavaScript/Electron analysis, browser observation, native function analysis via Ghidra/IDA/Hopper, Android, WASM, firmware, traffic captures, and so on. It never ships a model.
- **The agent** is the chat UI/CLI you actually talk to: OpenCode, Claude Code, Codex, Cursor, Gemini CLI, Qwen Code, Cline, Roo Code, and others.
- **The model** is the LLM the agent calls. This is where the bill usually appears — and where "free" can be arranged.

REA's own [README](README.md) section 6 lists the agent setup IDs. This page is about picking one that costs nothing, and pairing it with a model that also costs nothing.

---

## 2. Three kinds of "free"

| Kind | What it means | Typical catch |
|---|---|---|
| **Free tier** | A vendor gives a monthly/daily allowance of a hosted model | Quotas, rate limits, data-use terms, quality/feature restrictions |
| **Free models** | Aggregators and hosts offer specific models at $0 (often smaller or older ones) | Queueing, rate limits, availability changes without notice |
| **Fully local** | You run the model on your own machine (Ollama, LM Studio, llama.cpp) | Needs RAM/VRAM, slower, weaker at complex reasoning |

A genuinely **unlimited, unrestricted, frontier-quality, and free** agent does not exist. Anything advertised as that is either a trial, a limited tier, or a vector for something else.

---

## 3. Recommended zero-cost stacks (at a glance)

| Stack | Agent | Model source | Account needed | Best for |
|---|---|---|---|---|
| **A** | OpenCode | Free models via OpenCode's provider list | Optional | Easiest zero-cost start; strong MCP support |
| **B** | OpenCode / Cline / Roo Code | Ollama (local) | No | Privacy, offline, no quotas; 16 GB+ RAM |
| **C1** | Gemini CLI | Google AI free tier | Google account | Large context, quick setup |
| **C2** | Qwen Code | Qwen free quota | Qwen account | Solid coding model, generous daily quota |
| **C3** | VS Code + Cline / Roo Code | OpenRouter `:free` models, Groq, Mistral free tier, or Ollama | Usually free signup | Gui-first users; mix and match |
| **C4** | VS Code Agent mode | GitHub Copilot Free | GitHub account | Already in VS Code; small monthly allowance |

> ⚠️ Names, quotas and availability change frequently. Treat the table as a starting point, not a contract.

---

## 4. Stack A — OpenCode + free model (easiest)

OpenCode is open source, speaks MCP natively, and can use several providers — including free model tiers. REA's own setup supports it as `--client opencode`.

### Install

```powershell
# Windows (PowerShell)
npm install --global opencode-ai
opencode
```

```bash
# macOS / Linux
curl -fsSL https://opencode.ai/install | bash
opencode
```

(Alternatives: `npm i -g opencode-ai`, Homebrew, or a release binary. Node.js 22+ is required for the npm route.)

### Pick a free model

1. Inside OpenCode, run `/connect` and choose a provider. Providers with free models are labelled in the picker; the free ones are usually the smaller/faster models.
2. Run `/models` and pick a model whose entry shows no cost.
3. If no free model appears, add a provider you already have access to, or switch to Stack B (local).

### Connect REA

```powershell
npx rea-agents@latest setup --client opencode
```

Approve the plan, restart OpenCode, then:

```powershell
npx -y rea-agents@latest doctor --client opencode --json
```

`"healthy": true` means the MCP connection and the investigation skill are registered.

---

## 5. Stack B — Fully local with Ollama (no account, no quota)

This is the only option that stays free forever, works offline, and never sends your targets' evidence to a third party. The trade-off is model quality and speed.

### Install Ollama

```powershell
# Windows
winget install --exact --id Ollama.Ollama
```

```bash
# macOS / Linux
curl -fsSL https://ollama.com/install.sh | sh
```

### Pull a coding model

```powershell
ollama pull qwen2.5-coder:14b     # ~9 GB download, needs ~16 GB RAM
ollama serve                      # usually already running as a service
```

Reasonable local coding models (pick by your hardware):

| Model | Approx. size | Hardware | Notes |
|---|---|---|---|
| `qwen2.5-coder:7b` | ~4.7 GB | 8 GB RAM | Fast, good for small JS/Electron tasks |
| `qwen2.5-coder:14b` | ~9 GB | 16 GB RAM | Best value for REA-style investigations |
| `qwen2.5-coder:32b` | ~20 GB | 24–32 GB RAM or 16 GB+ VRAM | Noticeably better reasoning |
| `deepseek-coder-v2:16b` | ~9 GB | 16 GB RAM | Strong at code reading |
| `gpt-oss:20b` | ~13 GB | 16–24 GB RAM | General reasoning + tools |
| `devstral:24b` | ~14 GB | 24 GB RAM | Agent/tool-oriented |

### Point OpenCode at Ollama

`~/.config/opencode/opencode.json` (Windows: `%USERPROFILE%\.config\opencode\opencode.json`):

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (local)",
      "options": { "baseURL": "http://127.0.0.1:11434/v1" },
      "models": {
        "qwen2.5-coder:14b": { "name": "Qwen2.5 Coder 14B (local)" }
      }
    }
  }
}
```

Then `/models` → `Ollama (local)` → the model above.

**Alternative GUI:** [LM Studio](https://lmstudio.ai/) provides an OpenAI-compatible server on `http://127.0.0.1:1234/v1`; use the same config with that `baseURL`.

**Alternative agents for local models:** Cline, Roo Code, or Continue inside VS Code — all open source, all can target Ollama/LM Studio, and all can host the REA MCP server.

### Connect REA

```powershell
npx rea-agents@latest setup --client opencode
```

---

## 6. Stack C — Other free agents worth knowing

### C1. Gemini CLI (free tier)

```bash
npm install -g @google/gemini-cli
gemini
```

Sign in with a Google account and use the free tier (daily request limits apply). REA setup ID: `gemini_cli`.

```powershell
npx rea-agents@latest setup --client gemini_cli
```

Best when you want a very large context window for reading whole Electron apps.

### C2. Qwen Code (free quota)

```bash
npm install -g @qwen-code/qwen-code
qwen
```

Sign in and use the free daily quota. REA setup ID: `qwen_code`.

```powershell
npx rea-agents@latest setup --client qwen_code
```

### C3. VS Code + free extensions

- **Cline** or **Roo Code** (open source) + **Ollama/LM Studio** = fully free.
- The same extensions can use **OpenRouter free models**, **Groq's free tier**, or **Mistral's free tier** — sign up, paste the key, accept the rate limits.
- REA setup: use the VS Code / MCP flow, or run `npx rea-agents@latest setup --client vscode` after enabling Copilot/agent mode.

### C4. GitHub Copilot Free in VS Code

GitHub's free plan includes a small monthly allowance of chat/agent requests. It is enough to try REA end to end, not enough for daily heavy use. Setup ID: `vscode`.

### Not free (for contrast)

Claude Code, Codex CLI (beyond any trial), Cursor's paid tiers, Windsurf's paid tiers, and Claude Desktop with a paid plan all require a subscription or API billing. They are excellent; they are just not what this page is about.

---

## 7. Connecting REA to whichever agent you picked

Every agent follows the same three steps:

```powershell
# 1. register MCP server + investigation skill
npx rea-agents@latest setup --client <setup-id>

# 2. fully restart the client (tray icon too, for desktop apps)

# 3. verify
npx -y rea-agents@latest doctor --client <setup-id> --json
```

Common setup IDs: `opencode`, `gemini_cli`, `qwen_code`, `vscode`, `cursor`, `claude_code`, `codex`. The full list is in [README section 6](README.md#6-step-2--choose-a-coding-agent).

Then ask your agent:

```text
Check that REA is connected and list the REA tools you can use.
```

If the tools are missing, see [README section 17 — Troubleshooting](README.md#17-troubleshooting).

---

## 8. What "free" actually costs you

- **Quotas:** free tiers throttle. Investigations with big binaries burn context fast; a 1M-token free allowance can disappear in a few native-analysis sessions.
- **Privacy:** any hosted model receives the evidence REA returns — strings, pseudocode, paths, captured traffic. REA does not upload your target, but the model provider sees what the agent sends it. For sensitive work, use Stack B.
- **Quality:** small local models are noticeably weaker at multi-step reverse engineering, tool calling, and long contexts. Expect more retries and shorter, more guided prompts.
- **Availability:** free models get retired or moved behind a paywall with little notice. Keep a second option configured.
- **Terms:** free tiers often reserve the right to use inputs for training. Read the provider's data policy before feeding it proprietary code.
- **Never** paste customer data, credentials, or license keys into a chat to save money.

---

## 9. Hardware guide for local models

| RAM / VRAM | Sensible ceiling | Experience |
|---|---|---|
| 8 GB | 7B (Q4) | Works for JS/Electron reading; slow for long sessions |
| 16 GB | 14B (Q4) | Sweet spot for REA + OpenCode |
| 24 GB | 20–24B (Q4) | Better planning and tool use |
| 32 GB+ | 32B (Q4) | Closest to hosted quality, still below frontier models |
| GPU with 12–24 GB VRAM | 14B–32B | Several times faster than CPU-only |

CPU-only inference is workable for 7B–14B but expect tens of seconds per answer. Apple Silicon (unified memory) and modern GPUs are much better.

---

## 10. Common mistakes

1. **Expecting REA to be the model.** It is not; install an agent first.
2. **Skipping the restart.** Desktop clients keep the old MCP config until fully quit.
3. **Using a chat-only model for tool calls.** Pick a model with reliable tool/function calling.
4. **Tiny context windows.** Native analysis produces large outputs; 8k-context models will truncate.
5. **Assuming free means unlimited.** Check the quota page, not the marketing page.
6. **Forgetting licensing.** REA is MIT, but the agent and the model each have their own license and terms.

---

## 11. Verification scope: what was tested and what was not

This page is written from documentation plus **one** hands-on run. That run is recorded below so you can judge how far its results carry — it is not a claim that every combination on this page works, and nothing here is "100% verified" beyond what the tables say.

**Tested on:** Windows x64 (build 26300.9974), Node.js 26.13.0, REA **6.9.0** restored from this repo's offline tarball (`backup/rea-agents-6.9.0.tgz`), agent OpenCode, model `opencode/deepseek-v4.1-flash-free`.

### 11.1 Verified: installation and MCP connection

| Check | How it was checked | Result |
|---|---|---|
| Offline restore | `tar -xzf backup/rea-agents-6.9.0.tgz` → `node package/scripts/rea.mjs --version` | `6.9.0` |
| MCP handshake | `initialize` → `tools/list` over stdio | serverInfo `rea` 6.9.0, protocol `2025-06-18` |
| Tool inventory | `tools/list` | **255 tools**, 6 prompts |
| Registration | `rea setup --client opencode --yes` | `status: ready`, command identity `owned`, state `aligned` |
| Skill | bundled investigation skill | v62, 255 tools, `aligned` |
| Health | `rea doctor --client opencode --json` | `"healthy": true` |
| Model cost | OpenCode model list | `opencode/deepseek-v4.1-flash-free`, $0 input / $0 output |

`environment_healthy` stayed `false` throughout, which is correct for this host: no Ghidra, IDA, Hopper, JADX or Kuna is installed, so native and Android providers report `missing_analysis_engine`. Static JavaScript, Electron, web-bundle, ASAR, browser and WASM work needs none of them — but that also means **no native analysis was exercised in this test.**

### 11.2 Verified: one real analysis (Electron)

A five-file Electron fixture (`main.js`, `preload.js`, `renderer.js`, `index.html`, `package.json`) was analysed with `analyze_javascript_application`, with the free model driving the MCP call:

```json
{
  "electron_semantics": "recovered",
  "browser_windows": 1,
  "preload_entrypoints": 1,
  "context_bridge_apis": 1,
  "exposed_api_members": 5,
  "ipc": {
    "literal_channels": 5,
    "main_handlers": 4,
    "renderer_transmissions": 4,
    "paired_renderer_transmissions": 4,
    "unpaired_literal_renderer_transmissions": 0,
    "ambiguous_renderer_transmissions": 0
  }
}
```

What that means in practice:

- All four renderer `ipcRenderer.invoke` calls were paired with their main-process `ipcMain.handle` registrations (`notes:export`, `notes:import`, `system:open-external`, `dialog:pick-file`).
- `notes:progress` was listed separately as a main→renderer listener, not confused with an invoke/handle pair.
- The `contextBridge` surface was recovered as one API with five exposed members.
- 5 files, 3 parsed JavaScript files, 459 AST nodes, 26 findings, 0 parse failures — about 2.8 KB of readable source in total.

### 11.3 Verified: REA refused to guess

The export path is built at runtime:

```js
path.join(app.getPath('documents'), 'notes.csv')
```

REA did **not** invent `notes.csv` as a literal; it kept the path in the unknown set (192 semantic unknowns in this fixture). That is the designed behaviour — a static analyser that guessed there would be lying to you. Read the unknowns list before trusting a conclusion.

### 11.4 Not verified: do not treat these as confirmed

| Area | Why it is unverified here |
|---|---|
| Native binaries (PE, ELF, Mach-O, .NET) | No Ghidra, IDA or Hopper installed; no native procedure was analysed |
| Android packages | No JADX or Kuna installed; `inspect_android_package` was never run |
| Frida and live runtime attachment | npm blocked `frida`'s install script (`allowScripts`), so runtime tooling was never exercised |
| Browser and CDP runtime observation | Not run in this test |
| Large, minified or bundled code, ASAR, source maps, WASM, firmware, PCAP | Not run; the fixture is small and readable |
| Other free models | Only one free model was used. Small local models may fail tool calling entirely |
| Other agents (Gemini CLI, Qwen Code, Cline, Roo, Copilot Free) | Setup IDs are documented from REA's own docs; they were not each installed and tested |
| Cost over time | This run cost $0; sustained free-tier quotas were not measured |
| Other operating systems | Windows x64 only; macOS and Linux paths are untested here |
| Other REA versions | 6.9.0 only |

If your case falls in that table, the honest status is **unknown** — not broken, and not guaranteed.

### 11.5 Reproduce the same test

```powershell
# 1. Durable install (the npm tarball, or the repo tarball offline)
npm install --global rea-agents@6.9.0

# 2. Register and verify
rea setup --client opencode --yes
rea doctor --client opencode --json        # expect "healthy": true

# 3. In OpenCode, pick a free model, then ask for the tools
#    "List the REA tools you can use."

# 4. Point it at any extracted Electron app
#    analyze_javascript_application({ input_path: "C:\\path\\to\\app", detail: "summary" })
```

**What this establishes:** on a Windows host with no native analysis engine, a $0 model could drive REA's MCP tools, and REA recovered a real Electron IPC graph from source alone, with no paid API involved.

**What it does not establish:** that every REA capability works on your machine, that other free models behave the same way, or that REA's conclusions are complete. REA reports coverage and unknowns with every result — read those, not this page's summary.

---

## 12. Links

- **REA:** https://rea.tools/ · https://github.com/morluto/rea · `rea-agents` on npm
- **OpenCode:** https://opencode.ai/
- **Ollama:** https://ollama.com/ · **LM Studio:** https://lmstudio.ai/
- **Gemini CLI:** https://github.com/google-gemini/gemini-cli
- **Qwen Code:** https://github.com/QwenLM/qwen-code
- **Cline:** https://cline.bot/ · **Roo Code:** https://roocode.com/ · **Continue:** https://continue.dev/
- **OpenRouter free models:** https://openrouter.ai/models?max_price=0
- **Groq:** https://groq.com/ · **Mistral:** https://mistral.ai/

> This page recommends tools; it does not bundle, resell, or redistribute them. All names belong to their owners, and each tool's own license and terms apply.
