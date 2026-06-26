# Neovim Config

Personal Neovim config built on [lazy.nvim](https://github.com/folke/lazy.nvim). Focused on Python, C/C++, PHP, Lua, JavaScript, and TLA+ development with tmux integration.

## Requirements

- Neovim >= 0.11
- Git
- [Nerd Font](https://www.nerdfonts.com/) (mono variant)
- `make` (for telescope-fzf-native)
- `lazygit` and `lazydocker` (optional)
- tmux (optional, for pane navigation)

## Structure

```
nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── remap.lua               # Global keymaps
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager bootstrap
│   │   └── set.lua             # Vim options
│   └── plugins/
│       ├── blink.lua           # Completion (blink.cmp + LuaSnip)
│       ├── editor_ui.lua       # Colorscheme (kanagawa-wave) + lualine
│       ├── format.lua          # Formatting (conform.nvim)
│       ├── git.lua             # Git (gitsigns + diffview)
│       ├── terminal.lua        # Terminal (toggleterm + lazygit/lazydocker)
│       ├── treesitter.lua      # Syntax (nvim-treesitter)
│       ├── utility.lua         # autopairs + Comment.nvim
│       ├── lsp/
│       │   ├── lsp.lua         # LSP configs (basedpyright, ruff, lua_ls, clangd, intelephense)
│       │   ├── mason.lua       # Mason tool installer
│       │   └── lazydev.lua     # Lua dev completions
│       ├── navigation/
│       │   ├── harpoon.lua     # File bookmarks (harpoon2)
│       │   ├── yazi.lua        # File manager (yazi TUI)
│       │   ├── telescope.lua   # Fuzzy finder
│       │   └── tmux.lua        # Tmux pane navigation
│       └── ui/
│           └── ui.lua          # which-key, noice, notify, todo-comments, rainbow-delimiters
```

## Plugins

| Category     | Plugin                          | Purpose                          |
|--------------|---------------------------------|----------------------------------|
| UI           | kanagawa.nvim                   | Colorscheme (wave variant)       |
| UI           | lualine.nvim                    | Statusline                       |
| UI           | noice.nvim + nvim-notify        | UI overhaul for messages/cmdline |
| UI           | which-key.nvim                  | Keymap hints                     |
| UI           | rainbow-delimiters.nvim         | Bracket pair colorizing          |
| UI           | todo-comments.nvim              | Highlight TODO/FIXME/etc         |
| LSP          | nvim-lspconfig                  | LSP client config                |
| LSP          | mason.nvim + mason-lspconfig    | LSP/tool installer               |
| LSP          | lazydev.nvim                    | Lua/Neovim API completions       |
| Completion   | blink.cmp                       | Completion engine                |
| Completion   | LuaSnip + friendly-snippets     | Snippet engine + snippet library |
| Formatting   | conform.nvim                    | Format on save                   |
| Syntax       | nvim-treesitter                 | AST-based highlighting           |
| Navigation   | telescope.nvim + fzf-native     | Fuzzy finder                     |
| Navigation   | harpoon (v2)                    | File bookmarks                   |
| Navigation   | yazi.nvim                       | File manager (yazi TUI)          |
| Navigation   | vim-tmux-navigator              | Seamless tmux/nvim pane nav      |
| Git          | gitsigns.nvim                   | Inline git hunks + blame         |
| Git          | diffview.nvim                   | Git diff/history viewer          |
| Utility      | nvim-autopairs                  | Auto-close brackets              |
| Utility      | Comment.nvim                    | Line/block commenting            |

## LSP Servers

| Language   | Server        | Notes                     |
|------------|---------------|---------------------------|
| Python     | basedpyright  | Type checking: basic      |
| Python     | ruff          | Linting (hover disabled)  |
| Lua        | lua_ls        | vim global recognized     |
| C/C++      | clangd        | Background index, clang-tidy |
| PHP        | intelephense  | Full-featured PHP LSP     |

## Formatters (conform.nvim)

| Filetype   | Formatter     |
|------------|---------------|
| Lua        | stylua        |
| JavaScript | prettier      |
| HTML       | prettier      |
| C          | clang-format  |
| C++        | clang-format  |
| PHP        | php-cs-fixer  |

Format on save — 500ms timeout, LSP fallback.

## Treesitter Grammars

`lua`, `vim`, `vimdoc`, `query`, `javascript`, `html`, `css`, `python`, `bash`, `c`, `cpp`, `php`, `tlaplus`

## Keymaps

**Leader:** `<Space>`

### Search (Telescope) — `<leader>s`

| Key                  | Action                  |
|----------------------|-------------------------|
| `<leader>sf`         | Find files              |
| `<leader>sg`         | Live grep               |
| `<leader>sw`         | Grep word under cursor  |
| `<leader>sr`         | Resume last search      |
| `<leader>sh`         | Help tags               |
| `<leader>sk`         | Keymaps                 |
| `<leader>sd`         | Diagnostics             |
| `<leader>sn`         | Neovim config files     |
| `<leader><leader>`   | Open buffers            |
| `<leader>/`          | Fuzzy search buffer     |

### LSP / Code — `<leader>g` / `<leader>c`

| Key           | Action               |
|---------------|----------------------|
| `<leader>gr`  | References           |
| `<leader>gd`  | Go to definition     |
| `<leader>gi`  | Go to implementation |
| `<leader>gt`  | Type definition      |
| `<leader>ca`  | Code action          |
| `<leader>cf`  | Format file          |
| `<leader>cr`  | Rename symbol        |
| `K`           | Hover docs           |

### Git — `<C-g>`

| Key          | Action              |
|--------------|---------------------|
| `<C-g>p`     | Preview hunk        |
| `<C-g>r`     | Reset hunk          |
| `<C-g>b`     | Toggle line blame   |
| `<C-g>d`     | Diff this file      |
| `<C-g>v`     | Diffview open       |
| `]h` / `[h`  | Next/prev hunk      |

### Harpoon — `<leader>h`

| Key            | Action           |
|----------------|------------------|
| `<leader>ha`   | Add file         |
| `<leader>hh`   | Toggle menu      |
| `<M-1..4>`     | Jump to slot 1-4 |

### Navigation

| Key              | Action                        |
|------------------|-------------------------------|
| `-`              | Yazi at current file          |
| `<leader>ew`     | Yazi in cwd                   |
| `<C-h/j/k/l>`   | Tmux/nvim pane navigation     |
