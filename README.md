<div align="center">
  <img src="https://github.com/user-attachments/assets/fa994106-f79a-40b5-b2f4-9251655452fc" alt="YovoVim Logo Preview" width="100%">
</div>

<hr>

<div align="center"><p>
    <a href="https://neovim.io">
      <img alt="Neovim" src="https://img.shields.io/badge/Neovim-0.11+-C9CBFF?style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/nvim-dotfile/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/yashmodi6/nvim-dotfile?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/nvim-dotfile/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/yashmodi6/nvim-dotfile?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/nvim-dotfile/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/yashmodi6/nvim-dotfile?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/nvim-dotfile/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/yashmodi6/nvim-dotfile?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/nvim-dotfile">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/yashmodi6/nvim-dotfile?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</p></div>

**YovoVim** is a personal, high-performance Neovim configuration built for speed, aesthetics, and simplicity. Powered by [💤 lazy.nvim](https://github.com/folke/lazy.nvim) and [🍿 snacks.nvim](https://github.com/folke/snacks.nvim), it delivers a blazingly fast development environment tailored for both desktop and mobile (Termux / Android).

<div align="center">
  <img src="https://github.com/user-attachments/assets/59b04c8e-0c5e-4cce-8e5b-47e6e431170a" alt="Dashboard Preview" width="100%">
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/8a40b10e-61d8-4b1c-b106-76dfe099e6a7" alt="Editor and Explorer Preview" width="100%">
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/164b667c-08d8-41e1-9c5f-867506cb0b3c" alt="Snacks Finder Preview" width="100%">
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/4377f5ba-5544-44cb-91f7-d32147208fd5" alt="Floating Terminal Preview" width="100%">
</div>

## ✨ Features

- ⚡ **Blazingly Fast**: Cold startup times of **~20–25 ms** on desktop and **~35–40 ms** on phone (Android / Termux).
- 🎨 **Built-in Base46 Color System**: Curated palettes (`catppuccin`, `gruvbox`, `github_dark`, `vscode_dark`, `tokyodark`, `tokyonight`) with tailored plugin highlights and zero external theme plugins.
- 🍿 **Modern UI via Snacks.nvim**: Integrated dashboard, file explorer, fuzzy finder, terminal, and statuscolumn.
- 🧭 **Custom Statusline**: Single-file, zero-dependency statusline with LSP progress, diagnostics, Git status, and cached CWD.
- 🚀 **Full Editing Suite**: Blink.cmp completion with signature help, native Neovim LSP setup, Treesitter syntax highlighting, UFO code folding, Conform code formatting, and Mini.hipatterns color preview.
- 📱 **Termux & Mobile Friendly**: Automatic italic stripping to prevent Android rendering artifacts, touch-friendly window sizing, and lightweight resource usage.

## ⚡️ Requirements

* **Neovim >= 0.11+** (built with **LuaJIT**)
* **Git** (for plugin management)
* A **[Nerd Font](https://www.nerdfonts.com/)** as your terminal font:
  * Make sure the nerd font you set doesn't end with `Mono` to prevent small icons.
  * Example: `JetBrainsMono Nerd Font` and not `JetBrainsMono Nerd Font Mono`.
  * *(The `*Mono` fonts work too, but icons will look slightly smaller).*
* **`tree-sitter-cli`** is required by `nvim-treesitter` to install and compile parsers.
* **`ripgrep`** is required for grep searching with Snacks picker.
* **`fd`** is required for fast file finding with Snacks picker.
* **`curl`** for downloading plugins and parser grammars.
* **GCC** (or `clang`). Windows users must have MinGW installed and set on PATH.
* **Make**. Windows users must have GnuWin32 installed and set on PATH.

## 🚀 Getting Started

Make a backup of your current Neovim files:

```bash
# Linux / macOS / Android (Termux)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
```

Clone and launch **YovoVim**:

### Linux / macOS (Unix) / Android (Termux)

```bash
git clone https://github.com/yashmodi6/yovovim.git ~/.config/nvim && nvim
```

### Windows (CMD)

```cmd
git clone https://github.com/yashmodi6/yovovim.git %USERPROFILE%\AppData\Local\nvim && nvim
```

### Windows (PowerShell)

```powershell
git clone https://github.com/yashmodi6/yovovim.git $env:LOCALAPPDATA\nvim; nvim
```

## 🗑️ Uninstall

```bash
# Linux / macOS (Unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Flatpak (Linux)
rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Windows PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

## 📂 File Structure

```
~/.config/nvim
├── colors/                  # Colorscheme entrypoints (catppuccin, gruvbox, etc.)
├── lua/
│   ├── autocmds.lua         # Auto-commands (Termux italics, treesitter auto-start)
│   ├── keymaps.lua          # Custom keymaps & shortcuts
│   ├── options.lua          # Editor options & UI settings
│   ├── statusline.lua       # Single-file custom statusline
│   ├── plugins/             # Lazy.nvim plugin specifications
│   │   ├── completion.lua   # blink.cmp autocompletion
│   │   ├── cursor.lua       # smear-cursor animations
│   │   ├── flash.lua        # fast search navigation
│   │   ├── folding.lua      # nvim-ufo code folding
│   │   ├── formatting.lua   # conform.nvim formatters
│   │   ├── git.lua          # gitsigns hunks & status
│   │   ├── lazy.lua         # lazy.nvim manager setup
│   │   ├── lsp.lua          # native nvim-lspconfig
│   │   ├── markdown.lua     # render-markdown preview
│   │   ├── mini.lua         # mini.nvim (pairs, surround, ai, hipatterns)
│   │   ├── persistence.lua  # session restore
│   │   ├── snacks.lua       # snacks.nvim explorer, picker, dashboard
│   │   ├── treesitter.lua   # nvim-treesitter syntax highlighting
│   │   ├── venv.lua         # python virtual environment selector
│   │   └── whichkey.lua     # which-key keymap helper
│   └── theme/               # Built-in base46 theme engine
│       ├── init.lua         # Dynamic theme loader
│       ├── colors.lua       # Color mixing utility
│       ├── palettes/        # 6 curated theme palettes
│       └── integrations/    # Custom highlights for plugins & syntax
├── init.lua                 # Main Neovim configuration entrypoint
└── README.md
```

## 📦 Plugins Used

### Theme
* **Built-in Themes** – Curated base46 themes (`catppuccin`, `gruvbox`, `github_dark`, `vscode_dark`, `tokyodark`, `tokyonight`) with tailored plugin integrations

### Core & UI
* **[lazy.nvim](https://github.com/folke/lazy.nvim)** – Plugin manager
* **[snacks.nvim](https://github.com/folke/snacks.nvim)** – Dashboard, file explorer, picker, terminal, statuscolumn, words, and indent guides
* **[which-key.nvim](https://github.com/folke/which-key.nvim)** – Keymap guide
* **[smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)** – Cursor animation
* **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** – Markdown preview in buffer

### Coding & Editing
* **[blink.cmp](https://github.com/saghen/blink.cmp)** – Autocompletion
* **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** – LSP setup
* **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** – Syntax highlighting
* **[conform.nvim](https://github.com/stevearc/conform.nvim)** – Code formatting
* **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** – Git status and hunks
* **[nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)** & **[promise-async](https://github.com/kevinhwang91/promise-async)** – Code folding
* **[flash.nvim](https://github.com/folke/flash.nvim)** – Jump navigation
* **[persistence.nvim](https://github.com/folke/persistence.nvim)** – Resuming last coding session
* **[venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)** – Python virtual environment selector
* **[mini.nvim](https://github.com/echasnovski/mini.nvim)** – Pairs, surround, textobjects, splitjoin, move, and hipatterns (color preview)

---

## 🙏 Acknowledgements

* **[NvChad](https://github.com/NvChad/NvChad)** – Statusline aesthetics and base46 theme design inspirations.
* **[LazyVim](https://github.com/LazyVim/LazyVim)** & **[folke](https://github.com/folke)** – Plugin ecosystem and snacks.nvim inspirations.

---

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).  
Copyright (c) 2026 Yash Modi.
