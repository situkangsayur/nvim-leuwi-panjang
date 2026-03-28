return {
  -- Rust enhanced
  { "mrcjkb/rustaceanvim", ft = "rust" },

  -- Go enhanced
  { "ray-x/go.nvim",
    ft = "go",
    dependencies = { "ray-x/guihua.lua" },
    config = function() require("go").setup() end,
    build = ':lua require("go.install").update_all_sync()',
  },

  -- Java enhanced (jdtls)
  { "mfussenegger/nvim-jdtls", ft = "java" },

  -- TypeScript enhanced
  { "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  },

  -- Dockerfile
  { "ekalinin/Dockerfile.vim", ft = "dockerfile" },

  -- TOML
  { "cespare/vim-toml", ft = "toml" },
}
