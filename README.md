# nvim-leuwi-panjang

Lightweight Neovim IDE config — companion to [Leuwi Panjang Terminal](https://github.com/situkangsayur/leuwi-panjang).

Replaces CoC with native LSP for 5x faster startup and 3x less memory.

## Languages

Java, Go, Rust, Python, JavaScript, TypeScript, Kotlin, Shell, HTML, CSS, PHP

## Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone git@github.com:situkangsayur/nvim-leuwi-panjang.git ~/.config/nvim
nvim  # plugins auto-install on first run
```

## Stack

- **Plugin Manager**: lazy.nvim
- **LSP**: nvim-lspconfig + mason.nvim
- **Completion**: nvim-cmp
- **Fuzzy Finder**: telescope.nvim
- **Syntax**: treesitter
- **Git**: gitsigns + fugitive + diffview
- **Debug**: nvim-dap
- **AI**: claude-code.nvim, avante.nvim

## License

MIT
