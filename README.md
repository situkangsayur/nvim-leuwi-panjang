# nvim-leuwi-panjang

Lightweight Neovim IDE config — companion to [Leuwi Panjang Terminal](https://github.com/situkangsayur/leuwi-panjang).

Replaces CoC with native LSP. Target: **30-60ms startup**, **~40MB memory**.

## Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone git@github.com:situkangsayur/nvim-leuwi-panjang.git ~/.config/nvim
nvim  # plugins auto-install on first run
```

## Languages

Java (jdtls), Go (gopls), Rust (rust-analyzer), Python (pyright), JavaScript/TypeScript (ts_ls), Kotlin, Shell (bashls), HTML, CSS, PHP (intelephense)

## Keymaps

### Leader = Space

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gi` | Implementation |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>e` | File explorer |
| `<leader>gg` | Git status |
| `<leader>gb` | Git branches |
| `<leader>db` | Debug breakpoint |
| `<leader>dc` | Debug continue |
| `<leader>ac` | Claude Code |
| `<C-\>` | Terminal |
| `<leader>re` | Extract function (visual) |
| `<leader>rv` | Extract variable (visual) |

## Plugins

| Category | Plugin |
|----------|--------|
| Plugin Manager | lazy.nvim |
| LSP | nvim-lspconfig + mason |
| Completion | nvim-cmp + LuaSnip |
| Fuzzy Finder | telescope + fzf-native |
| Syntax | treesitter + textobjects |
| File Explorer | neo-tree |
| Git | gitsigns + fugitive + diffview |
| Debug | nvim-dap + dap-ui |
| Terminal | toggleterm |
| Keys | which-key |
| Refactor | refactoring.nvim |
| AI | claude-code.nvim + avante.nvim |
| Theme | catppuccin mocha (transparent) |
| Status | lualine |
| Buffers | bufferline |
| UI | noice + indent-blankline |

## License

MIT
