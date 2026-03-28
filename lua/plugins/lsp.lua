return {
  { "williamboman/mason.nvim", cmd = "Mason", build = ":MasonUpdate", opts = {} },
  { "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "jdtls", "gopls", "rust_analyzer", "pyright", "ts_ls",
          "kotlin_language_server", "bashls", "html", "cssls", "intelephense",
        },
        automatic_installation = true,
      })
    end,
  },
  { "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp = require("lspconfig")
      local caps = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local m = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        m("n", "gd", vim.lsp.buf.definition, "Go to definition")
        m("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        m("n", "gr", vim.lsp.buf.references, "References")
        m("n", "gi", vim.lsp.buf.implementation, "Implementation")
        m("n", "gy", vim.lsp.buf.type_definition, "Type definition")
        m("n", "K", vim.lsp.buf.hover, "Hover")
        m("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        m("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        m("n", "<leader>fs", vim.lsp.buf.document_symbol, "Document symbols")
        m("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        m("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        m("n", "<leader>d", vim.diagnostic.open_float, "Diagnostics")
      end
      local servers = { "gopls", "rust_analyzer", "pyright", "ts_ls",
        "kotlin_language_server", "bashls", "html", "cssls", "intelephense" }
      for _, s in ipairs(servers) do
        lsp[s].setup({ on_attach = on_attach, capabilities = caps })
      end
    end,
  },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "mrcjkb/rustaceanvim", ft = "rust" },
}
