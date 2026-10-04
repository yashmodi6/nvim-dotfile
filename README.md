<div align="center">
  <img src="https://github.com/user-attachments/assets/fa994106-f79a-40b5-b2f4-9251655452fc" alt="YovoVim Logo Preview" width="100%">
</div>

<hr>

<h4 align="center">
  <a href="#-installation">Install</a>
  ·
  <a href="#-features">Features</a>
  ·
  <a href="#-plugins-used">Plugins</a>
</h4>

<div align="center"><p>
    <a href="https://neovim.io">
      <img alt="Neovim" src="https://img.shields.io/badge/Neovim-0.11+-C9CBFF?style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/yovovim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/yashmodi6/yovovim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/yovovim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/yashmodi6/yovovim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/yovovim/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/yashmodi6/yovovim?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/yovovim/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/yashmodi6/yovovim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/yashmodi6/yovovim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/yashmodi6/yovovim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</p></div>

**YovoVim** is my personal Neovim configuration, built with simplicity and productivity in mind.

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

* Fast startup times (~20ms on desktop, ~35ms on Android)
* 6 built-in themes ready to use without extra plugins
* Fast autocompletion with signature help via `blink.cmp`
* File explorer, fuzzy finder, and floating terminal powered by `snacks.nvim`
* Lightweight statusline with Git status, diagnostics, and LSP progress
* Treesitter syntax highlighting, code folding, and auto-formatting on save
* Inline hex color previews with `mini.hipatterns`
* Works smoothly across Linux, macOS, and Android

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

## 🚀 Installation

Make sure to back up your current Neovim configuration.

```bash
# Linux / macOS / Android
git clone https://github.com/yashmodi6/yovovim.git ~/.config/nvim && nvim

# Windows (CMD)
git clone https://github.com/yashmodi6/yovovim.git %USERPROFILE%\AppData\Local\nvim && nvim

# Windows (PowerShell)
git clone https://github.com/yashmodi6/yovovim.git $env:LOCALAPPDATA\nvim; nvim
```

## 🗑️ Uninstall

```bash
# Linux / macOS
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
├── colors
│   └── ...
├── lua
│   ├── autocmds.lua
│   ├── keymaps.lua
│   ├── options.lua
│   ├── statusline.lua
│   ├── plugins
│   │   └── ...
│   └── theme
│       └── ...
├── init.lua
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
* **[folke](https://github.com/folke)** – For his amazing plugins.

---

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).  
Copyright (c) 2026 Yash Modi.
