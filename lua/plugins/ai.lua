return {
  -- Claude Code integration
  { "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code" } },
    opts = { window = { position = "right", width = 60 } },
  },

  -- Multi-provider AI (Claude, GPT, Gemini)
  { "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = { provider = "claude" },
  },
}
